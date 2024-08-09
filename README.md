# Audio Podcasting App

### Overview

This project is a comprehensive audio podcasting application built using Flutter for the frontend, Riverpod for state management, Hive for local data storage, and FastAPI for the backend API. It utilizes a SQLite database for efficient data management and adheres to the MVVM architectural pattern for clean code separation and maintainability.

### Project Structure

The project is divided into two main components:

    Frontend (Flutter):
        music_app folder containing the Flutter application code.
        Utilizes Riverpod for effective state management.
        Leverages Hive for local data storage.
        Implements the MVVM architecture for clean code organization.

    Backend (FastAPI):
        server_client folder containing the FastAPI backend code.
        Employs a SQLite database for data persistence.
        Provides RESTful APIs for interaction with the frontend.

### Key Features

    User Authentication: Secure user registration, login, and profile management.
    Podcast Discovery: Browse and search for podcasts based on various criteria.
    Podcast Subscription: Subscribe to favorite podcasts for easy access.
    Episode Playback: Stream and download podcast episodes.
    Playlists: Create and manage personalized playlists.
    Offline Listening: Enjoy podcasts offline through local storage.
    User Reviews and Ratings: Provide feedback on podcasts and episodes.
    Push Notifications: Receive updates on new episodes and recommendations.

### Technologies Used

    Flutter: Cross-platform UI framework for building the frontend.
    Riverpod: State management solution for efficient data flow.
    Hive: NoSQL database for local data storage.
    FastAPI: High-performance Python web framework for the backend API.
    SQLite: Embedded database for storing podcast metadata and user data.
    MVVM: Architectural pattern for clean code separation.

### Getting Started

    Clone the repository:
    Bash

    git clone https://github.com/your-username/audio-podcasting-app.git

    Utilisez ce code avec précaution.

Set up the backend environment:

    Install required Python packages:
    Bash

    pip install fastapi uvicorn sqlalchemy

    Utilisez ce code avec précaution.

    Configure database connection details in the server_client folder.

Set up the frontend environment:

    Install Flutter SDK.
    Install required Dart packages:
    Bash

    flutter pub get

    Utilisez ce code avec précaution.

Run the backend:
Bash

uvicorn main:app --reload

Run the frontend:
Bash

flutter run

For any inquiries or issues, please feel free to contact me.
