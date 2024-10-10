# to_bee

# Flutter To-Do List App

## overview
The Flutter To-Do List App is a productivity application designed to help users efficiently manage their tasks.
It integrates AI-powered recommendations, Pomodoro timer functionality, task prioritization, and gamification features to enhance productivity. The app is user-friendly and includes features suitable for children, offering a playful yet functional approach to task management.
## Features

- Task Management: Add, edit, prioritize, and manage tasks with deadlines and descriptions.
- Pomodoro Timer: Track work sessions and breaks to boost productivity.
- AI Recommendations: Get personalized productivity tips and task suggestions based on your activity.
- Gamification: Earn points and unlock rewards by completing tasks and achieving milestones.
- Progress Reports: View daily and weekly summaries of your productivity and achievements.
- User Profiles: Manage your personal information and app settings.

## Technologies
Flutter: Framework for building natively compiled applications for mobile from a single codebase.
Dart: Programming language used for developing the app.
Firebase: For authentication, real-time database, and cloud storage.
Provider: State management solution.
flutter_local_notifications: For handling local notifications.
fl_chart: For creating charts and visualizing progress.
lottie: For animations in the rewards system.

## Project Architecture
The app follows the MVC (Model-View-Controller) architecture to separate concerns and maintain code clarity:

Model: Represents data structures and business logic.
View: User interface components that render data to the user.
Controller: Manages the interaction between the model and the view, handling user input and updating the model.

## File Structure

lib/

│── assets/
│   ├── images/
│
│
│── constants
│
├── controllers/
│   ├── gamification_controller.dart
│   ├── pomodoro_controller.dart
│   ├── progress_report_controller.dart
│   ├── recommendation_controller.dart
│   ├── todo_controller.dart
│
│   
│  
│
├── models/
│   ├── progress_report_model.dart
│   ├── recommendation_model.dart
│   ├── reward_model.dart
│   ├── task_model.dart
│   
│
├── services/
│   ├── ai_recommendation_service.dart
│   ├── notification_service.dart
│   └── pomodoro_timer_service.dart
│
├── utils
│
├── views/
│   ├── home_page.dart
│   ├── login_screen.dart
│   ├── on_boarding.dart
│   ├── pomodoro_timer.dart
│   ├── profile.dart
│   ├── progress_reports_view.dart
│   ├── recommendations_view.dart
│   ├── rewards.dart
│   ├── sign_up.dart
│   ├── tasks.dart
│
│── widgets/
│   ├── ai_recommendation_widget.dart
│   ├── pomodoro_timer_widget.dart
│   ├── progress_report_widget.dart
│   ├── reward_widget.dart
│   ├── task_input_form.dart
│   ├── task_item.dart
│
├── main.dart
│

Integration Between AI and Software:
The AI system is responsible for providing personalized task recommendations based on several parameters like:

Task completion history
Task difficulty and duration
User preferences and task categories
The AI engine connects to the app via a backend API. Data sent includes task details, user history, and preferences, and the AI responds with a prioritized list of recommended tasks. Integration is done using REST APIs, which are connected via a secure HTTPS connection.

# AI Integration Workflow:
User submits task data and preferences.
The app sends the data to the AI service through an API request.
AI processes data and returns prioritized task suggestions.
Suggestions are displayed in the “Recommended Tasks” section.
# Third-Party Integrations:
Pomodoro Timer: A custom-built Pomodoro timer for task time management. It allows users to pause, resume, and adjust time based on the Pomodoro technique.
AI Recommendation Engine: Integrated via a REST API for personalized task recommendations.
Calendar API: External API for managing task deadlines and scheduling visualizations.
Rewards API: External system used to manage and distribute rewards based on user activity.
#Types of Tests:
Unit Tests:
Testing individual functions and widgets like the task list view, task creation form, and the timer component.
Integration Tests:
Ensuring that the task list correctly integrates with the API to display tasks.
Checking the seamless transition between different pages, like from the task list to the timer page.
End-to-End (E2E) Tests:
Full test cases to simulate the user journey from logging in, viewing tasks, starting a timer, and completing tasks with rewards.
Testing integration with AI task recommendations, ensuring they load and display correctly on the app.
How to Run the Application:
Prerequisites:
Flutter SDK installed
Dart SDK installed
Android Studio or Xcode (for iOS development)



