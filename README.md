<div align="center">
  <img src="assets/images/shared/logo.png" alt="Manfaz Logo" width="200"/>
  <h1>Manfaz</h1>
  <p>A modern service marketplace connecting users with service providers</p>
  
  [![Flutter](https://img.shields.io/badge/Flutter-3.6.0-blue.svg)](https://flutter.dev/)
  [![Dart](https://img.shields.io/badge/Dart-3.6.0-blue.svg)](https://dart.dev/)
  [![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)
</div>

## 📋 Table of Contents

- [Overview](#-overview)
- [Features](#-features)
- [Screenshots](#-screenshots)
- [Architecture](#-architecture)
- [Project Structure](#-project-structure)
- [Technologies](#-technologies)
- [Installation](#-installation)
- [Usage](#-usage)
- [Localization](#-localization)
- [Contributing](#-contributing)
- [License](#-license)
- [Contact](#-contact)

## 🔍 Overview

Manfaz is a comprehensive service marketplace application that connects users with service providers. Inspired by platforms like Marsool and Ajeer, Manfaz offers a seamless experience for requesting services, tracking service providers in real-time, and managing secure transactions.

The application is built with Flutter following Clean Architecture principles, ensuring a scalable, maintainable, and testable codebase. It supports both English and Arabic languages, providing a localized experience for users.

## ✨ Features

- **Multi-language Support**: Full support for English and Arabic with easy switching between languages
- **Diverse Service Categories**: Request various services including delivery, home maintenance, and errands
- **Location-based Services**: Automatic location detection with manual location selection option
- **Real-time Tracking**: Track service providers on the map in real-time
- **In-app Communication**: Direct messaging between users and service providers
- **Custom Service Requests**: Place custom orders with detailed instructions
- **Secure Payment Options**: Multiple payment methods including cards and in-app wallet
- **Rating System**: Rate and review service providers to maintain quality
- **User Profiles**: Detailed profiles for both users and service providers
- **Order History**: Track past and current orders with detailed status information

## 📱 Screenshots

<div align="center">
  <table>
    <tr>
      <td align="center"><strong>Home Screen</strong></td>
      <td align="center"><strong>Service Selection</strong></td>
      <td align="center"><strong>Location Picker</strong></td>
    </tr>
    <tr>
      <td><img src="screenshots/home_screen.png" width="220"/></td>
      <td><img src="screenshots/service_selection.png" width="220"/></td>
      <td><img src="screenshots/location_picker.png" width="220"/></td>
    </tr>
    <tr>
      <td align="center"><strong>Restaurant Details</strong></td>
      <td align="center"><strong>Service Order</strong></td>
      <td align="center"><strong>Order Tracking</strong></td>
    </tr>
    <tr>
      <td><img src="screenshots/restaurant_details.png" width="220"/></td>
      <td><img src="screenshots/service_order.png" width="220"/></td>
      <td><img src="screenshots/order_tracking.png" width="220"/></td>
    </tr>
  </table>
</div>

> Note: Replace the placeholder paths with actual screenshots of your application.

## 🚀 Installation

### Prerequisites
- Flutter SDK (version ^3.6.0)
- Dart SDK (version ^3.6.0)
- Android Studio / VS Code
- Android SDK / Xcode (for iOS development)
- Google Maps API Key

### Setup
1. **Clone the repository**
   ```bash
   git clone https://github.com/youssefemadeldn/Manfaz-App.git
   cd Manfaz-App
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Set up Google Maps API Key**
   - Create a file named `api_keys.dart` in `lib/core/utils/`
   ```dart
   class ApiKeys {
     static const String googleMapsApiKey = 'YOUR_GOOGLE_MAPS_API_KEY';
   }
   ```
   - Add your Google Maps API key to `android/app/src/main/AndroidManifest.xml` and `ios/Runner/AppDelegate.swift`

4. **Generate necessary files**
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

5. **Run the app**
   ```bash
   flutter run
   ```

## 📱 Usage

### For Users
1. **Registration and Login**
   - Create an account or sign in with existing credentials
   - Complete your profile information

2. **Browsing Services**
   - Browse through various service categories on the home screen
   - Use the search bar to find specific services
   - View service details including ratings and reviews

3. **Placing Orders**
   - Select a service and specify your requirements
   - Choose your location or use automatic location detection
   - Add any additional details or instructions
   - Confirm your order

4. **Order Management**
   - Track your order status in real-time
   - Communicate with service providers through the in-app chat
   - Rate and review service providers after order completion

### For Developers
1. **Adding New Features**
   - Follow the Clean Architecture pattern
   - Create feature directories with data, domain, and presentation layers
   - Use dependency injection for services and repositories

2. **Modifying Existing Features**
   - Locate the feature in the project structure
   - Make changes while maintaining the architectural pattern
   - Update tests to reflect changes

3. **Running Tests**
   ```bash
   flutter test
   ```

## 🏗️ Architecture

Manfaz follows **Clean Architecture** principles with a feature-first approach, organizing code into three main layers:

### Domain Layer
- Contains business logic and rules
- Defines repository interfaces
- Implements use cases
- Uses Either<Failure, Success> for error handling

### Data Layer
- Implements repository interfaces from the domain layer
- Handles data sources (remote and local)
- Manages API calls and data caching
- Implements data models and mappers

### Presentation Layer
- Implements UI components using Flutter widgets
- Uses Cubit for state management
- Follows a component-based approach for reusable UI elements
- Handles user interactions and displays data

### Dependency Injection
- Uses `get_it` and `injectable` for dependency injection
- Follows the principle of dependency inversion
- Makes testing and maintenance easier

## 📂 Project Structure

```
lib/
├── core/                   # Core functionality shared across features
│   ├── cache/              # Local storage and caching
│   ├── di/                 # Dependency injection setup
│   ├── error/              # Error handling and failure classes
│   ├── helper/             # Helper classes (dialogs, snackbars, etc.)
│   ├── network/            # Network configuration and API client
│   ├── routes/             # App navigation and routing
│   ├── theme/              # App theming (colors, styles, etc.)
│   ├── utils/              # Utility functions and extensions
│   └── widgets/            # Shared widgets used across features
│
├── features/               # Feature-based modules
│   ├── auth/               # Authentication feature
│   ├── delivery/           # Delivery service feature
│   ├── google_maps/        # Maps integration feature
│   ├── onBoardings/        # Onboarding screens
│   ├── order/              # Order management
│   ├── scheme/             # Scheme-related features
│   ├── send_an_offer/      # Offer creation feature
│   ├── servicses/          # Services listing and management
│   ├── settings/           # App settings
│   ├── store/              # Store/restaurant features
│   ├── tabs/               # Main tab navigation
│   └── workers/            # Service provider features
│
└── main.dart               # App entry point
```

Each feature follows the Clean Architecture pattern with its own layers:
```
feature/
├── data/                   # Data layer
│   ├── data_source/        # Remote and local data sources
│   ├── models/             # Data models
│   └── repo/               # Repository implementations
├── domain/                 # Domain layer
│   ├── entities/           # Domain entities
│   ├── repo/               # Repository interfaces
│   └── use_cases/          # Use cases
└── presentation/           # Presentation layer
    ├── cubit/              # State management
    ├── screens/            # UI screens
    └── widgets/            # Feature-specific widgets
```

## 🛠️ Technologies

### Core
- **Flutter**: UI framework for building natively compiled applications
- **Dart**: Programming language optimized for client-side development

### State Management
- **flutter_bloc/bloc**: State management using the BLoC pattern
- **equatable**: Simplifies equality comparisons for classes

### Networking
- **dio**: HTTP client for API requests
- **pretty_dio_logger**: Logging for API requests and responses
- **web_socket_channel**: WebSocket communication

### Dependency Injection
- **get_it**: Service locator for dependency injection
- **injectable**: Code generation for dependency injection

### Navigation
- **auto_route**: Type-safe routing and navigation

### Persistence
- **shared_preferences**: Local key-value storage
- **cached_network_image**: Image caching and loading

### Location Services
- **google_maps_flutter**: Google Maps integration
- **location**: Location services and permissions
- **geocoding**: Converting coordinates to addresses

### UI Components
- **flutter_screenutil**: Responsive UI design
- **flutter_svg**: SVG rendering
- **lottie**: Animation rendering
- **shimmer**: Loading effect animations
- **flutter_rating_bar**: Rating UI component
- **pinput**: PIN input field
- **percent_indicator**: Progress indicators

### Localization
- **easy_localization**: Internationalization and localization
- **intl**: Internationalization utilities

### Error Handling
- **dartz**: Functional programming features including Either type

## 🌐 Localization

Manfaz supports both English and Arabic languages. The localization is implemented using the `easy_localization` package.

### Language Files
- Located in `assets/lang/`
- `en.json` - English translations
- `ar.json` - Arabic translations

### Key Features
- Automatic language detection based on device settings
- Manual language switching in settings
- Right-to-left (RTL) support for Arabic
- Localized date and number formatting

### Adding New Translations
1. Add new keys to both language files
2. Use the `tr()` function in the UI:
   ```dart
   Text('key_name'.tr())
   ```

## 🤝 Contributing

Contributions are welcome and appreciated! Here's how you can contribute:

1. **Fork the repository**
2. **Create a feature branch**
   ```bash
   git checkout -b feature/amazing-feature
   ```
3. **Commit your changes**
   ```bash
   git commit -m 'Add some amazing feature'
   ```
4. **Push to the branch**
   ```bash
   git push origin feature/amazing-feature
   ```
5. **Open a Pull Request**

### Guidelines
- Follow the existing code style and architecture
- Write clear commit messages
- Update documentation as needed
- Add tests for new features
- Ensure all tests pass before submitting a PR

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 📞 Contact

For any inquiries or support, please contact:

- **Project Maintainer**: Youssef Emad
- **Email**: [contact@youssefemad.com](mailto:contact@youssefemad.com)
- **GitHub**: [youssefemadeldn](https://github.com/youssefemadeldn)

---

<div align="center">
  <p>Made with ❤️ by Youssef Emad</p>
</div>
