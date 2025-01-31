import 'package:flutter/material.dart';
import 'package:plantproject/constants.dart';
import 'package:plantproject/models/plants.dart';
import 'package:plantproject/ui/screens/datail_page.dart';

class PlantWidget extends StatelessWidget {
  const PlantWidget({
    super.key,
    required this.index,
    required this.plantList,
  });

  final int index;
  final List<Plant> plantList;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(
              plantId: plantList[index].plantId, 
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          // ignore: deprecated_member_use
          color: Constants.primaryColor.withOpacity(.1),
          borderRadius: BorderRadius.circular(10),
        ),
        height: 80.0,
        padding: const EdgeInsets.only(left: 10, top: 10),
        margin: const EdgeInsets.only(bottom: 10, top: 10),
        width: size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  // Circle background
                  Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      // ignore: deprecated_member_use
                      color: Constants.primaryColor.withOpacity(.8),
                      shape: BoxShape.circle,
                    ),
                  ),
                  // Plant image
                  Positioned(
                    bottom: 5,
                    left: 0,
                    right: 0,
                    child: SizedBox(
                      height: 80.0,
                      child: Image.asset(
                        plantList[index].imageURL,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  // Plant details
                  Positioned(
                    bottom: 5,
                    left: 80,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          plantList[index].category,
                          style: const TextStyle(
                            color: Colors.black54,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          plantList[index].plantName,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Constants.blackColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Price
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Text(
                '\$${plantList[index].price}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: Constants.primaryColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
