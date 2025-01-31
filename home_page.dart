import 'package:flutter/material.dart';
import 'package:plantproject/constants.dart';
import 'package:plantproject/models/plants.dart';
import 'package:plantproject/ui/screens/datail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  final List<String> plantTypes = [
    'Recommended',
    'Indoor',
    'Outdoor',
    'Garden',
    'Supplement',
  ];

  bool toggleIsFavorited(bool isFavorited) {
    return !isFavorited;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final List<Plant> plantList = Plant.plantList;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
                child: Container(
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Constants.primaryColor.withOpacity(.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.search,
                        color: Colors.black54.withOpacity(.6),
                      ),
                      const Expanded(
                        child: TextField(
                          showCursor: false,
                          decoration: InputDecoration(
                            hintText: 'Search Plant',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 16),
                          ),
                        ),
                      ),
                      Icon(
                        Icons.mic,
                        color: Colors.black54.withOpacity(.6),
                      ),
                    ],
                  ),
                ),
              ),

              // Categories
              Container(
                height: 50,
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  scrollDirection: Axis.horizontal,
                  itemCount: plantTypes.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Text(
                          plantTypes[index],
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: selectedIndex == index
                                ? FontWeight.bold
                                : FontWeight.w300,
                            color: selectedIndex == index
                                ? Constants.primaryColor
                                : Constants.blackColor,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              // Horizontal Plant List
              SizedBox(
                height: size.height * .3,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  itemCount: plantList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailPage(plantId: index),
                          ),
                        );
                      },
                      child: Container(
                        width: 200,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: Constants.primaryColor.withOpacity(.8),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Stack(
                          children: [
                            // Favorite Button
                            Positioned(
                              top: 10,
                              right: 20,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    plantList[index].isFavorated =
                                        toggleIsFavorited(
                                            plantList[index].isFavorated);
                                  });
                                },
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Icon(
                                    plantList[index].isFavorated
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: Constants.primaryColor,
                                    size: 30,
                                  ),
                                ),
                              ),
                            ),

                            // Plant Image and other widgets remain the same
                            Positioned(
                              left: 50,
                              right: 50,
                              top: 50,
                              bottom: 50,
                              child: Image.asset(
                                plantList[index].imageURL,
                                fit: BoxFit.contain,
                              ),
                            ),

                            // Plant Details and Price
                            Positioned(
                              bottom: 15,
                              left: 20,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    plantList[index].category,
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    plantList[index].plantName,
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              bottom: 15,
                              right: 20,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 2),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  '\$${plantList[index].price}',
                                  style: TextStyle(
                                    color: Constants.primaryColor,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              // New Plants Section
              const Padding(
                padding: EdgeInsets.only(left: 16, bottom: 20, top: 20),
                child: Text(
                  'New Plants',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),

              // Vertical Plant List
              SizedBox(
                height: size.height * .5,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: plantList.length,
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailPage(plantId: index),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Constants.primaryColor.withOpacity(.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Image.asset(
                                plantList[index].imageURL,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    plantList[index].plantName,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    plantList[index].category,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.black54,
                                    ),
                                  ),
                                  Text(
                                    '\$${plantList[index].price}',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Constants.primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  plantList[index].isFavorated =
                                      toggleIsFavorited(plantList[index].isFavorated);
                                });
                              },
                              child: Icon(
                                plantList[index].isFavorated
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: Constants.primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
