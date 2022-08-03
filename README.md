# Personal Planner 

A todo app built built using Flutter and MongoDB (V1.0) The UI design was done in Figma.

The goal for this project was to get familiar with Flutter, and build UIs from a given template (ie. Figma file) while also learning how to make CRUD operations in MongoDb.

## Learnign Goals
- Designing a UI with Figma and integrate it into an application
- Flutter
- MongoDB

### Figma

The UI was designed by me using Figma, with a focus on something that looks minimalistic yet eye-catching and conveys information quickly to the user. Starting with choosing a suitable color pallette and consistent designs such as fonts, colors, border radius, etc to have the theme of the app feel consistent yet modern.

### Flutter

Once the design was finalised, I broke down how to build the application in Flutter. The first step was understanding the flow and learning how to build or use features such as Onboarding screen, animated objects and manage widgets in a way that would make the code fast yet easy to debug in the future.

### MongoDB

The third goal of this project was to learn MongoDB and how to interact with it using Flutter. The database has a simple structure with 3 collections. Users, Tasks and Expenses (expenses is a feature that can be added in the future).

## Features Included
- Onboarding Screen
- Login
- Task Screen based on 3 categories (Non Urgent, Important, Urgent)
- Add Task, Edit Task, Delete Task

![Application overview](https://i.imgur.com/896weoW.gif)

## Libraries and Tools Used
- VSCode
- Android Studio (For Emulators)
- smooth_page_indicator: ^1.0.0+2
- shared_preferences: ^2.0.15
- lottie: ^1.4.0
- mongo_dart: ^0.7.4+1
- scoped_model: ^1.1.0

## Features to Implement and Improvements
- Splash Screen
- Load tasks instantly without reloading tasks page
- Delete Task on Swipe instead of button press
- Sign Up Screen
- Expense Tracker
- Rearranging index of tasks by dragging within the same category
- Change catgory of tasks by dragging into different category
- Filtering Tasks 
- Dark Mode

