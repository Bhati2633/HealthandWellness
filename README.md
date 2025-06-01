# Mindfulness App 

A Flutter application designed to support your health and wellness journey through mindfulness exercises, affirmations, and progress tracking.

## Overview

This Mindfulness App provides users with tools to engage in daily mindfulness practices. It features guided exercises, a collection of positive affirmations, the ability to track progress, and customizable reminders to help users stay consistent with their wellness goals.

## Author / Connect

* **Name**: Bhavya Patel
* **GitHub**: [bhati2633](https://github.com/bhati2633)
* **Portfolio**: [View My Portfolio](https://portfolio-fawn-omega-85.vercel.app/)

## Key Features

* **Guided Exercises**: Step-by-step mindfulness exercises to help users relax and focus. Includes various exercises like breathing, stretching, and strength builders.
* **Daily Affirmations**: A collection of positive affirmations to inspire and motivate. Users can browse through affirmations and save their favorites.
* **Progress Tracking**: Monitor your exercise progress over time. The app displays completion percentage for the exercise routines.
* **Customizable Reminders**: Set daily reminders for exercises and affirmations to maintain a consistent practice.
* **Local Storage**: Saved affirmations, exercise progress, and reminder settings are stored locally on the device using `shared_preferences`.
* **Engaging Interface**: Features a pleasant user interface with background imagery and clear navigation.

## Technologies Used

* **Flutter**: For building the cross-platform mobile application.
* **Dart**: The programming language used for Flutter development.
* **shared\_preferences**: For simple local data storage.
* **percent\_indicator**: For visually displaying progress bars.

## Getting Started

This project is a starting point for a Flutter application.

To get a local copy up and running follow these simple steps:

### Prerequisites

* Flutter SDK: [Install Flutter](https://flutter.dev/docs/get-started/install)
* Dart SDK: (Comes with Flutter)
* An editor like Android Studio or VS Code (with Flutter and Dart plugins).

### Installation & Running

1.  Clone the repo (replace with your actual repo URL if you have one):
    ```sh
    git clone [https://github.com/bhati2633/project01.git](https://github.com/bhati2633/project01.git)
    ```
2.  Navigate to the project directory:
    ```sh
    cd project01
    ```
3.  Install Flutter packages:
    ```sh
    flutter pub get
    ```
4.  Run the app:
    ```sh
    flutter run
    ```

    Ensure you have a connected device or an emulator running.

## Project Structure

A brief overview of the key directories:

* `lib/`: Contains the main Dart code for the application.
    * `main.dart`: The entry point of the application, defines routes and themes.
    * `screens/`: Contains individual screen widgets for different features (e.g., `home_screen.dart`, `exercise_screen.dart`).
    * `utils/`: Utility classes, such as `local_storage.dart` for managing data persistence.
* `assets/`: Contains static assets like images (e.g., `background.jpg`).
* `android/`, `ios/`, `web/`, `linux/`, `macos/`, `windows/`: Platform-specific project files.
* `pubspec.yaml`: Defines project metadata, dependencies, and assets.

## Further Help

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

You can also check out these resources:
- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

---
