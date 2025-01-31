# Plant App README

## Overview
The Plant App is a mobile application built with Flutter that allows users to browse and discover various types of plants, including indoor, outdoor, garden, and supplementary plants. Users can view detailed information about each plant, favorite them, and add them to their cart.

## Features
- **Home Screen**: Displays a search bar, plant categories, featured plants, and new plant recommendations.
- **Plant Details**: Provides detailed information about a selected plant, including size, humidity, temperature, price, rating, and description.
- **Favoriting**: Allows users to mark plants as favorites.
- **Cart Management**: Enables users to add and remove plants from their cart.

## Getting Started

### Prerequisites
- Flutter SDK version 2.5.0 or higher
- Dart version 2.14.0 or higher

### Installation
1. Clone the repository:
   ```
   git clone https://github.com/your-username/plant-app.git
   ```
2. Navigate to the project directory:
   ```
   cd plant-app
   ```
3. Install the dependencies:
   ```
   flutter pub get
   ```
4. Run the app:
   ```
   flutter run
   ```

### Usage
1. The **Home** screen displays a list of plant categories, featured plants, and new plant recommendations.
2. Tap on a plant to navigate to the **Detail** screen, where you can view more information about the plant, favorite it, and add it to your cart.
3. Use the search bar to find specific plants.
4. Tap the heart icon to favorite a plant.
5. Tap the shopping cart icon to add a plant to your cart.

## Project Structure
The project is organized as follows:

```
plant-app/
├── lib/
│   ├── constants.dart
│   ├── main.dart
│   ├── models/
│   │   └── plants.dart
│   └── ui/
│       ├── detail_page.dart
│       └── home_page.dart
├── pubspec.yaml
└── README.md
```

- `constants.dart`: Defines the app's color scheme and other constants.
- `main.dart`: The entry point of the app.
- `models/plants.dart`: Defines the `Plant` class and the initial list of plants.
- `ui/detail_page.dart`: Implements the plant detail screen.
- `ui/home_page.dart`: Implements the home screen.
- `pubspec.yaml`: Specifies the app's dependencies and asset configuration.

## Dependencies
The Plant App uses the following dependencies:

- `flutter`
- `flutter/material.dart`

## Contributing
Contributions are welcome! If you find any issues or have suggestions for improvements, please feel free to open a new issue or submit a pull request.

## License
This project is licensed under the [MIT License](LICENSE).
