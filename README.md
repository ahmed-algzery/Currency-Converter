# Currency Converter App

A simple and intuitive currency converter app that allows users to convert amounts between different currencies. The app fetches live exchange rates from an API and provides a user-friendly interface with dropdowns for selecting currencies and entering amounts.

## Features
- Real-time currency conversion using the latest exchange rates.
- Select currencies for both "From" and "To" using dropdowns.
- Input amount to be converted.
- View the converted result instantly.
- Beautiful and clean UI with smooth interactions.

## Tech Stack
- **Flutter**: A UI toolkit for building natively compiled applications for mobile, web, and desktop.
- **Dart**: The programming language used to build the Flutter app.
- **API**: Fetches exchange rates from `https://api.exchangerate-api.com/v4/latest/USD`.

## Screenshots
(Include some screenshots of your app here)

## Installation

### Prerequisites
Ensure that you have Flutter and Dart installed on your system. You can follow the official installation guide [here](https://flutter.dev/docs/get-started/install).

### Clone the Repository

```bash
git clone https://github.com/ahmed-algzery/Currency-Converter.git
```

### Install Dependencies

Navigate to the project directory and install dependencies:

```bash
cd currency_converter_app
flutter pub get
```

### Run the App

To run the app, use the following command:

```bash
flutter run
```

This will launch the app on your connected device or emulator.

## How it works

1. **Currency Selection**: The user can choose the source and target currencies using two dropdowns (`CurrencyDropdown` widget).
2. **Amount Input**: The user enters the amount to convert into the text field.
3. **Conversion**: The app fetches live exchange rates via a network request to the API (`ApiService`) and performs the conversion based on the selected currencies and entered amount.
4. **Result**: The result is displayed with the converted amount in the target currency.

## File Structure

```plaintext
lib/
│
├── main.dart               # Main entry point for the app
├── services/
│   └── api_service.dart    # Handles API requests to fetch exchange rates
├── widgets/
│   ├── currency_dropdown.dart  # Widget for the currency selection dropdown
│   └── result_display.dart     # Widget for displaying the conversion result
└── screens/
    └── currency_converter_screen.dart # Main screen where currency conversion happens
```

### API

- **Endpoint**: `https://api.exchangerate-api.com/v4/latest/USD`
- The API provides the latest exchange rates based on USD as the base currency.

## Contributing

If you want to contribute to this project, feel free to fork the repository, make changes, and submit a pull request. You can contribute in the following ways:
- Improving UI/UX design.
- Adding more features like historical currency data.
- Fixing bugs and improving performance.

## License

This project is open-source and available under the [MIT License](LICENSE).



