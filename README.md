# 🕌 Nearby Masjid Finder App

A mobile application designed to help users quickly locate nearby masjids (mosques), view prayer times, and receive timely notifications — built using **Flutter** for the frontend and **ASP.NET Core Web API** for the backend.

---

## 📱 Overview

The **Nearby Masjid Finder** app empowers Muslims to:

- Discover masjids near them based on real-time location.
- View precise prayer times for each masjid.
- Get prayer time notifications and Jummah reminders.
- Navigate to masjid locations via integrated map view.
- Leverage a **decentralized validation system** where any user can suggest updates to masjid information — such as prayer time changes — and nearby users receive a notification to validate or object.

This project aims to simplify religious observance for users on the go, especially while traveling or in unfamiliar areas, and introduces community-powered accuracy to ensure masjid data stays relevant and trusted.

---

## ✨ Features

### 🔍 Masjid Discovery
- Interactive **map view** with markers for nearby masjids.
- List view with **name, distance**, and **Fajr prayer time**.
- Smart search bar to quickly find masjids by name.

### 🕰️ Masjid Details
- Full **daily prayer schedule** (Fajr, Zuhur, Asar, Maghrib, Isha).
- **Address display** and **“Get Directions”** button (Google Maps deep link).
- **Jummah prayer reminder** feature.

### 📍 Location Services
- Requests user’s location permission.
- Graceful fallback screen if location access is denied.
- Settings toggle to enable/disable location access.

### 🔔 Notifications
- Prompt user to enable prayer reminders.
- Scheduled local notifications for each prayer time.

### ⚙️ Account Settings
- Edit profile, change password.
- Toggle **notification** and **location access**.
- Change app language.
- View FAQs and app version.

### 🌐 Decentralized Masjid Data Validation
- Users can **suggest changes** (e.g. updated prayer times, new masjid name, address corrections).
- When a change is suggested, **nearby users receive a notification** to validate or object.
- If **no objections are received within a defined time window**, the change is **automatically accepted**.
- This ensures **community-driven, real-time accuracy** with minimal admin overhead.

---

## 💡 Project Structure

### Frontend
- **Framework**: Flutter (Dart)
- **Architecture**: MVVM / GetX / Repository Pattern
- **Packages**:
    - yet to decide

### Backend
- **Framework**: ASP.NET Core Web API
- **Database**: yet to decide
- **Key Modules**:
    - Masjid controller (CRUD + search)
    - Location & proximity filter
    - Prayer time scheduler
    - Notification time sync logic
    - Community-based validation engine
    - JWT-based Authentication (if applicable)

---

## 🛠️ Getting Started


### Figma Design
- Figma design available at: [Nearby Masjid Finder Design](https://www.figma.com/design/w7ZbZ2KPFnYMbvfAdEY8OP/Alfalah_Connect?node-id=0-1&t=jL8DUbDMrEC4slMQ-1)

### Prerequisites
- Flutter SDK & Android/iOS toolchains
- Visual Studio with .NET Core SDK
- SQL Server / PostgreSQL (optional for backend)

### Backend
```bash
cd backend/
dotnet build
dotnet run
```

### Frontend
```bash
cd frontend/
flutter pub get
flutter run
```

---

## 🔐 Permissions

- **Location Access**: Required for masjid discovery based on proximity.
- **Notifications**: Needed for prayer reminders and validation prompts.

---

## 🚀 Future Improvements

- Multi-language support (Arabic, Urdu, etc.)
- Offline prayer time caching.
- User favorites and masjid reviews.
- Live Qibla direction compass.
- Masjid registration and admin access roles.

---

## 🧑‍💻 Author

Muhammad Ahmad Mahmood  
Email: ahmad.mahmood@azm.dev / ahmadmahmood296@gmail.com
Phone :+92 332 5106960
LinkedIn: [muhammad-ahmad-mahmood](https://www.linkedin.com/in/ahmaddioxide/)


Backend Dev:
Sameer Ahmad
Phone: +92 310 8505682
---

## 📄 License

This project is licensed under the MIT License.
