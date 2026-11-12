# Doctor Online

A Flutter healthcare app that helps people in Sri Lanka find medical help fast. It channels a doctor by specialty, finds nearby hospitals on a map and calls the 1990 ambulance service in one tap.

## Features

- **Channel a doctor** by specialty: pediatrician, neurologist, psychiatrist, dermatologist, anaesthetist, disease physician
- **Contact a hospital**: nearby hospitals from your current location, using the Google Places Nearby Search API and shown on Google Maps
- **Emergency call**: one tap dials **1990** (Suwa Seriya ambulance)
- Google Lens shortcut from the channelling screen. It opens Lens, or its Play Store page if Lens isn't installed (`device_apps`, `launch_review`)
- Push notifications with Firebase Cloud Messaging
- Email/password and Google sign-in, and you stay logged in between launches

## Tech stack

- **Flutter** (Dart) with **GetX**
- **Firebase** Authentication and Cloud Messaging
- **Google Maps Flutter** and **Google Places API** (`http`)
- `geolocator`, `location`, `permission_handler`, `flutter_phone_direct_caller`

## Project structure

```
lib/
  startpage/         landing screen
  login/ registration/
  fourthview/        home menu
  channeldoctor/     specialties
  contacthospital/   nearby hospitals map
  emergencycall/     1990 dialler
  data/              Places API response models
  models/ routes/
DOCTOR ONLINE 1.pptx  project presentation
```

## Getting started

1. Add your Firebase config files and enable Email/Password and Google sign-in.
2. Add a Google Maps / Places API key to the Android manifest and to the Places request in `lib/contacthospital/`.
3. Run:
   ```bash
   flutter pub get
   flutter run
   ```

> Built in 2022. Upgrade the plugins before building with a current Flutter SDK.
