# TailSafe

TailSafe is a React Native mobile application designed for real-time tracking and management of devices. The app provides seamless connectivity through Bluetooth Low Energy (BLE), WebSocket communication, and Firebase integration for comprehensive device monitoring.

## Features
- **Real-time Tracking**: GPS-based location tracking with map visualization.
- **Bluetooth Low Energy (BLE)**: Direct device communication and connectivity.
- **WebSocket Integration**: Real-time data synchronization.
- **Device Management**: Add, view, and manage multiple devices.
- **Alert System**: Receive notifications and alerts from your devices.
- **User Authentication**: Secure sign-in and sign-up with Firebase.
- **Device Details**: Comprehensive device information and status monitoring.
- **User Profile**: Personalized user settings and preferences.

## Tech Stack
- **Framework**: React Native
- **Backend**: Firebase (Firestore database)
- **Build Tools**: Expo/Metro, Babel
- **Authentication**: Firebase Authentication
- **Database**: Firestore
- **Real-time Communication**: WebSocket, Bluetooth Low Energy

## Project Structure
```
src/
├── Navigation/          # App navigation configuration
├── Screens/             # Screen components
│   ├── HomeScreen.js
│   ├── DeviceDetailsScreen.js
│   ├── MapScreen.js
│   ├── AlertsScreen.js
│   ├── ProfileScreen.js
│   ├── BLEScreen.js
│   ├── WebSocketScreen.js
│   ├── ConnectionScreen.js
│   ├── AddDeviceScreen.js
│   └── AuthScreen/      # Authentication screens
└── services/            # Firebase configuration
```

## Installation

### Prerequisites (Local Development)
- Node.js (v14+)
- npm or yarn
- Android SDK / iOS SDK
- Expo CLI (if using Expo)

### Prerequisites (Docker)
- Docker
- Docker Compose

### Local Setup
1. Clone the repository:
   ```bash
   git clone https://github.com/Ahamedshakir02/TailSafe.git
   cd TailSafe
   ```

2. Install dependencies:
   ```bash
   npm install
   ```

3. Configure Firebase:
   - Update `src/services/firebaseConfig.js` with your Firebase credentials.

4. Run the app:
   ```bash
   # For Android
   npm run android
   
   # For iOS
   npm run ios
   
   # Using Expo
   npm start
   ```

### Docker Setup

#### Quick Start with Docker
1. Clone the repository:
   ```bash
   git clone https://github.com/Ahamedshakir02/TailSafe.git
   cd TailSafe
   ```

2. Build and run the container:
   ```bash
   docker-compose up
   ```

   The Expo development server will be available at `http://localhost:19000`

#### Docker Commands

**Build the image:**
```bash
docker-compose build
```

**Run the development server:**
```bash
docker-compose up
```

**Run in background:**
```bash
docker-compose up -d
```

**Stop the container:**
```bash
docker-compose down
```

**View logs:**
```bash
docker-compose logs -f app
```

**Install new dependencies inside container:**
```bash
docker-compose exec app npm install <package-name>
```

#### Firebase Emulator (Optional)
To use Firebase emulators locally:
```bash
docker-compose --profile firebase up
```

This will start:
- Firebase Emulator Suite UI: `http://localhost:4000`
- Firestore Emulator: `localhost:8085`
- Auth Emulator: `localhost:9099`

Update your `src/services/firebaseConfig.js` to connect to local emulators when needed.

## Usage
1. **Sign Up/Sign In**: Create an account or log in with existing credentials.
2. **Add Device**: Connect and add devices to your account via BLE or manual entry.
3. **Monitor**: View real-time device locations on the map.
4. **Receive Alerts**: Get notifications for important device events.
5. **Manage Profile**: Update personal settings and preferences.

## Development

### Scripts
- `npm start` - Start the development server
- `npm run android` - Build and run on Android
- `npm run ios` - Build and run on iOS
- `npm run web` - Build and run web version
- `npm run build` - Build the production app

## Environment Variables

Copy `.env.example` to `.env` in the project root and fill in real values (`.env` is gitignored):

```env
# Firebase Configuration
FIREBASE_API_KEY=your_firebase_api_key
FIREBASE_AUTH_DOMAIN=your_firebase_auth_domain
FIREBASE_PROJECT_ID=your_firebase_project_id
FIREBASE_STORAGE_BUCKET=your_firebase_storage_bucket
FIREBASE_MESSAGING_SENDER_ID=your_messaging_sender_id
FIREBASE_APP_ID=your_firebase_app_id

# Google Maps (read by app.config.js for Expo/iOS, and by
# android/local.properties for the native Android build)
GOOGLE_MAPS_API_KEY=your_google_maps_api_key
```

For a native Android build (`npm run android` / opening `android/` directly), also add the
same key to `android/local.properties` (also gitignored):

```properties
GOOGLE_MAPS_API_KEY=your_google_maps_api_key
```

## Troubleshooting

### Common Issues

**Metro bundler port already in use:**
```bash
# Kill process on port 8081
lsof -ti:8081 | xargs kill -9
```

**Docker container permission issues:**
```bash
# Rebuild with proper permissions
docker-compose down -v
docker-compose build --no-cache
```

**Firebase authentication issues:**
- Ensure Firebase credentials are correctly set in `src/services/firebaseConfig.js`
- Check Firebase console for enabled authentication methods
- Verify Firestore security rules allow read/write access

**BLE connectivity issues:**
- Ensure app has proper permissions (Android 12+)
- Check if Bluetooth is enabled on device
- Verify device is within BLE range

**Map functionality not working:**
- Verify location permissions are granted
- Check `expo-location` is properly installed
- Ensure API keys are configured for map services

## Architecture

### Navigation Flow
- **AuthScreen**: Initial login/signup screen
- **HomeScreen**: Main dashboard with device overview
- **DeviceDetailsScreen**: Individual device information
- **MapScreen**: GPS location visualization
- **AlertsScreen**: System alerts and notifications
- **BLEScreen**: Bluetooth device management
- **WebSocketScreen**: Real-time data streaming
- **ProfileScreen**: User settings and preferences

### Communication Protocols
- **BLE (Bluetooth Low Energy)**: Direct device communication with low power consumption
- **WebSocket**: Real-time bidirectional data synchronization
- **HTTP/REST**: Firebase API calls for authentication and data persistence
- **GPS**: Location tracking via Expo Location API

## API Integration

### Firebase Firestore Structure
```
users/
  ├── {userId}/
  │   ├── profile/
  │   ├── devices/
  │   └── alerts/

devices/
  ├── {deviceId}/
  │   ├── location/
  │   ├── status/
  │   └── metrics/

locations/
  ├── {locationId}/
  │   ├── latitude
  │   ├── longitude
  │   └── timestamp
```

## Contributing
Contributions are welcome! Please feel free to submit issues, feature requests, or pull requests.

To contribute:
1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License
This project is licensed under the MIT License. See the LICENSE file for details.

## Support

For support, documentation, or feature requests:
- 📧 Email: ahamedshakir02@gmail.com
- 🐙 GitHub: [TailSafe Repository](https://github.com/Ahamedshakir02/TailSafe/)
- 📱 Issues: [GitHub Issues](https://github.com/Ahamedshakir02/TailSafe/issues)

## Changelog

### Version 1.0.0
- Initial release
- Real-time GPS tracking
- BLE device connectivity
- WebSocket integration
- Firebase authentication
- Firestore database integration

