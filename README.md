# 📝 Tasky App (Flutter + Firebase)

## 1. Description

This is a task management application built with **Flutter** and **Firebase**, designed to help users manage their daily tasks effectively. The app includes:

- 🔐 User authentication
- ✅ Task creation with priority and due dates
- 🗓️ Calendar-based task selection
- 🧠 Clean and modular architecture
- 📱 Beautiful, responsive, and user-friendly UI

---

## 2. Screen-by-Screen Explanation

### 🔐 Authentication Screens (`/auth`)
- **Login Screen**
  - Validates user email and password
  - Displays real-time error messages
- **Register Screen**
  - Allows new users to register
  - Includes password confirmation & strength validation
- **Widgets**
  - `materialButtonWidget`, `textFormFieldWidget`, `textRichWidget` – reusable UI elements

---

### 🏠 Home Screen (`/home`)
- Displays the list of created tasks
- Includes a **Floating Action Button** to add new tasks
- Visual indicators for:
  - Priority level
  - Due date
- Integrates task list using:
  - `taskItemWidget`: Task layout
  - `calendar_dialog`: Date picker modal
  - `containerPeriorityWidget`: Priority selection
  - `alertDialog`: Confirmations and warnings

---

### ➕ Empty State
- **File:** `empty_scre_widget.dart`
- **Use case:** When no tasks exist, a placeholder is shown with an icon or message encouraging the user to add tasks.

---

### 📝 Update Task Screen (`/update_screen`)
- Allows users to edit existing tasks
- Pre-fills previous data
- Uses `item_update_widget.dart` for UI

---

### 🚀 Splash Screen (`/splashScreen`)
- **File:** `splash_screen.dart`
- Shown when the app is opened
- Displays logo/branding while Firebase initializes

---

### 👋 Onboarding Screens (`/onboardingScreen`)
- Guides first-time users
- Consists of multiple pages using `PageView` and `smooth_page_indicator`
- Controlled via:
  - `onboarding.dart`: data model
  - `onboarding_screen.dart`: logic & layout

---

## 3. Design Patterns 🏗️

### 🔁 Architectural Patterns
- **Repository Pattern:** Used in `firebaseDatabase.dart` to abstract Firebase operations
- **Singleton Pattern:** `app_shared_preference.dart` ensures one instance of preferences
- **Factory Pattern:** Used in `task_model.dart`, `user_model.dart`, `onboarding_model.dart`

### 🧠 Code Structure
- `core/constant/`: Asset paths and key constants
- `core/utils/`: Utilities like dialog, validation, shared prefs
- `data/firebase/`: Auth and Firestore logic
- `data/model/`: All app models
- `screens/`: Grouped by feature with separation of widgets and views

---

## 4. UI/UX 🎨

### 🎨 Design System
- **Primary Color:** `#5F33E1` (Purple)
- **Typography:** Bold headers, readable text
- **Icons:** Custom and Material icons for clarity

<div align="center">

  <img src="https://github.com/user-attachments/assets/ae59bc66-8293-4664-99c4-d0eaf02f9a0a" width="180"/>
  <img src="https://github.com/user-attachments/assets/33f80f5e-100f-47ce-8859-668f4097461b" width="180"/>
  <img src="https://github.com/user-attachments/assets/1518f8ff-adfb-4e84-ad83-8415bfb363c7" width="180"/>
  <img src="https://github.com/user-attachments/assets/18977b3d-3e43-4159-96ac-795b407e40da" width="180"/>
  <br/>
  <img src="https://github.com/user-attachments/assets/844a6be0-2687-46c6-897b-0aec68512648" width="180"/>
  <img src="https://github.com/user-attachments/assets/73ec3fc8-df0b-47f4-b449-20acaa86dd51" width="180"/>
  <img src="https://github.com/user-attachments/assets/126c65bb-f1c6-4a68-b892-077303c29753" width="180"/>
  <img src="https://github.com/user-attachments/assets/47be0491-1658-4418-8211-9f724526fe74" width="180"/>
  <br/>
  <img src="https://github.com/user-attachments/assets/9aa3031e-f80a-48d1-8249-65d3a41bba07" width="180"/>
  <img src="https://github.com/user-attachments/assets/ba7d3db0-7477-4bf4-9319-47a9c3428de0" width="180"/>
  <img src="https://github.com/user-attachments/assets/f44f3fe8-3446-462d-9c68-360c758429e9" width="180"/>
  <img src="https://github.com/user-attachments/assets/7cf8450b-97e3-468a-9550-b641ecc11dab" width="180"/>
  <br/>
  <img src="https://github.com/user-attachments/assets/23d26a41-0776-46d1-97fd-29a2faf7bce6" width="180"/>
  <img src="https://github.com/user-attachments/assets/90e25154-a8f8-4386-8131-7a36f8c11c0a" width="180"/>

</div>
### 📲 Features
- **Responsive Layouts** for multiple screen sizes
- **Interactive Widgets:**
  - Calendar dialog
  - Priority selection
- **Form Validation:**
  - Real-time error messages
  - Password strength check
- **Feedback Mechanisms:**
  - Loading indicators
  - Success/failure dialogs

---

## 5. 🎥 Video Demo


https://github.com/user-attachments/assets/26c8611d-b61c-4515-be0c-275b2669739b




**Demonstrates:**
- Onboarding flow
- Registration/login
- Adding/updating tasks
- Priority/date selection
- Responsive layout

---

## 6. 📦 Dependencies

### 🔥 Firebase
- `firebase_core: ^2.24.2`
- `firebase_auth: ^4.16.0`
- `cloud_firestore: ^4.14.0`

### 💾 Storage & Preferences
- `shared_preferences: ^2.2.2`

### 📆 Calendar & Dates
- `table_calendar: ^3.1.3`
- `intl: ^0.19.0`

### 💡 UI/UX
- `animate_do: ^3.0.2` – Animations
- `smooth_page_indicator: ^1.2.1` – Onboarding pagination

### ✅ Linting
- `flutter_lints: ^2.0.0`

---

## ✨ Future Improvements

- 🔍 Task filtering & sorting
- 🏷️ Add categories/tags
- 🌙 Dark mode
- 🔐 Better Firebase error handling
- 🧠 Use advanced state management (Cubit/Provider)
- 🌀 Enhanced animations using `flutter_animate` or `rive`

---

### 📁 Project Structure (Simplified)

```
lib/
├── core/
│   ├── constant/
│   ├── utils/
├── data/
│   ├── firebase/
│   └── model/
├── screens/
│   ├── auth/
│   ├── home/
│   ├── onboardingScreen/
│   ├── splashScreen/
│   └── update_screen/
├── firebase_options.dart
└── main.dart
```
