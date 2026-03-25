# Flutter Linear Regression Model App

This Flutter application serves as a client for a linear regression model API built with FastAPI. It allows users to interact with the model and visualize the results.

## Project Structure

```
FlutterApp
├── android                # Android platform-specific code
├── ios                    # iOS platform-specific code
├── lib                    # Main application code
│   ├── main.dart          # Entry point of the application
│   ├── screens            # Contains all screen widgets
│   │   └── home_screen.dart # Main screen of the application
│   ├── services           # Contains services for API interaction
│   │   └── api_service.dart # Handles HTTP requests to the backend
│   └── widgets            # Contains reusable widgets
│       └── custom_widget.dart # Custom UI components
├── test                   # Contains unit and widget tests
│   └── widget_test.dart    # Tests for the widgets
├── pubspec.yaml           # Project configuration and dependencies
└── README.md              # Project documentation
```

## Setup Instructions

1. **Clone the repository**:
   ```bash
   git clone <repository-url>
   cd FlutterApp
   ```

2. **Install dependencies**:
   Make sure you have Flutter installed on your machine. Run the following command to get the required packages:
   ```bash
   flutter pub get
   ```

3. **Run the application**:
   Use the following command to run the app:
   ```bash
   flutter run
   ```

## Usage

- The application connects to a FastAPI backend to perform linear regression predictions.
- Navigate to the home screen to input data and view predictions.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request for any improvements or bug fixes.