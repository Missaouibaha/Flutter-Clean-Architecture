🧠 Overview
This project follows Clean Architecture principles with a modular folder structure, ensuring clear separation of concerns, testability, and scalability.

Clean Architecture divides the code into three main layers:

Data

Domain

Presentation

Each layer has a specific responsibility. The modular design enables reusable core logic and feature-based isolation, making the project easy to navigate and maintain as it grows.

📁 Project Structure
🔹 Core Layer
The core directory contains shared resources and base configurations used across the entire app.

base/
BaseLocalDataSource, BaseRemoteDataSource

BaseState<T> for standardized state representation

di/
Dependency injection setup using service locators (e.g., getIt)

helper/
Utility classes and extensions:

SharedPrefHelper

Dart extension methods

services/
Shared services such as:

HiveService for local storage

routing/
Application-wide routing:

AppRouter, route names, guards, etc.

theming/
App-wide theming:

Colors, typography, dimensions, and asset references

utils/
Global constants and string resources:

AppStrings, AppConsts, etc.

widgets/
Reusable global widgets:

TextFormField, custom buttons, dialogs, etc.

🔹 Features Layer
Organized by feature, each with its own data, domain, and presentation folders.

📦 data/
Handles all data flow (local and remote):

datasources/

local/:

Models

LocalDataSource & implementation

remote/:

Models

RemoteDataSource & implementation

mappers/

Convert API/local models to domain entities

repositoryImpl/

Implements domain-level repository contracts

📦 domain/
Contains the business logic:

repository/

Abstract definitions for data operations

entities/

Pure models representing business objects

usecases/

Application-specific use cases (e.g., LoginUseCase, GetUserProfile)

📦 presentation/
Handles all UI logic and rendering:

cubit/

Cubits for state management

Corresponding UI state classes

widgets/

Feature-specific widgets and listeners

screen/

UI screens like login, sign-up, home, etc.


