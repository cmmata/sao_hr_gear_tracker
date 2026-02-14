# Sideloading to Android

To install this app on your Android device without the Play Store:

## Prerequisites
1. **Enable Developer Options**: 
   - Go to Settings > About Phone.
   - Tap "Build Number" 7 times.
2. **Enable USB Debugging**:
   - Go to Settings > System > Developer Options.
   - Enable "USB Debugging".

## Connecting
1. Connect your phone to your PC via USB.
2. Accept the "Allow USB Debugging" prompt on your phone.

OR

## Wireless Debugging (WiFi)
If you have Android 11 or higher, you can connect without a USB cable:
1. Ensure your PC and phone are on the same WiFi network.
2. Go to **Developer Options > Wireless Debugging** and enable it.
3. Access **Pair device with QR code** or **Pair device with pairing code**.
4. In Android Studio, go to **Device Manager > Physical > Pair using Wi-Fi**.
5. Use the QR code or pairing code to connect.

## Installing (Sideloading)
From the project directory:

1. **Set Android SDK**:
   ```bash
   export ANDROID_HOME=~/Android/Sdk
   ```

2. **Build the APK**:
   ```bash
   flutter build apk --release
   ```
   The APK will be at `build/app/outputs/flutter-apk/app-release.apk`.

3. **Install**:
   ```bash
   flutter install
   ```
   This command installs the app on the connected device.

## Troubleshooting
- If `flutter install` fails, you can copy the APK file to your phone and open it with a File Manager application.
