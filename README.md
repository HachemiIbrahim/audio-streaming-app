# Audio Streaming App

### Overview

This project is a comprehensive audio streaming application built using Flutter for the frontend, Riverpod for state management, Hive for local data storage, and FastAPI for the backend API. It utilizes a SQLite database for efficient data management and adheres to the MVVM architectural pattern for clean code separation and maintainability.

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
    Episode Playback: Stream podcast episodes.

### Technologies Used

    Flutter: Cross-platform UI framework for building the frontend.
    Riverpod: State management solution for efficient data flow.
    Hive: NoSQL database for local data storage.
    FastAPI: High-performance Python web framework for the backend API.
    SQLite: Embedded database for storing podcast metadata and user data.

### Getting Started

    Clone the repository:

    git clone https://github.com/your-username/audio-podcasting-app.git


Set up the backend environment:

    Install required Python packages:

    pip install fastapi uvicorn sqlalchemy

    

Set up the frontend environment:

    Install Flutter SDK.
    Install required Dart packages:

    flutter pub get


Run the backend:
Bash

uvicorn main:app --reload

Run the frontend:
Bash

flutter run

For any inquiries or issues, please feel free to contact me.

 <p>
  <img src="images/Screenshot 2024-08-09 135911.png" alt="Image Description" style="margin-right: 10px;">
  <img src="images/Screenshot 2024-08-09 135911.png" alt="Image Description" style="margin-right: 10px;">

</p>
