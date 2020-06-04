# LE-iOS-Lib
LIVEENSURE v6 iOS SDK

    LiveEnsure® authenticates users and their mobile devices across device, location, behavior(3 pattern), time, wearable         devices, biometric authentication and knowledge factors with a simple API and an elegant mobile app. Developers mashup 
    the API with their site or host app and end users imply scan the screen or tap to authenticate via four dimensions of         security. LiveEnsure® protects both privacy and authenticity online.

Requirements

    macOS version 10.15 or later
    Xcode version 11.0 or later
    iPhone with iOS version 10.0 or later
    A valid session token, session token can be generated using LiveEnsure web-service calls.
    A host server, to generate session token & to validate status after LiveEnsure authentication.(Optional)

SDK Installation

    Installation of the Xcode project requires a few steps in Xcode to get up and running with LiveEnsure Capabilities.
    Create a Single View App inside the iOS section using xCode & select Objective c from the language section of the new project popup.
    Drag LiveEnsureSDK Folder Inside your project.
    Go to Project Target -> General -> Embedded Binaries -> add LiveEnsureSDK.framework

SDK Configuration 

    Configuring the Xcode project requires a few steps to add permission in info.plist.

    a) Add permissions in info.plist use this library
      <key>NSBluetoothAlwaysUsageDescription</key>
	    <string>$(PRODUCT_NAME) needs bluetooth permission to support nearby device authentication. </string>
	    <key>NSBluetoothPeripheralUsageDescription</key>
	    <string>$(PRODUCT_NAME) would like to use bluetooth to support nearby device authentication.</string>
	    <key>NSCameraUsageDescription</key>
	    <string>$(PRODUCT_NAME) will access your camera for barcode scanning.</string>
	    <key>NSLocationWhenInUseUsageDescription</key>
	    <string>$(PRODUCT_NAME) will use your location only if authentication requires it.</string>

    b) Import SDK header
     
     #import <LiveEnsureSDK/LiveEnsureSDK.h>
 


Initialization LiveEnsure SDK :
    
    We are assuming that you have a valid session token, which can talk to Liveensure server using our SDK. Initialization of     SDK is just like you are eating a piece of cake. Just Call our authentication method but sessionToken is required.
    
Let‘s initialise SDK with all this information which we have now.
    
    [[LiveEnsureSDK sharedInstance] authenticateWithSessionToken:VALID_SESSION_TOKEN delegate:self];
    
Conform LiveEnsureDelegate protocol & Implement delegate methods 
  
  To get authentication status -(void)sessionComptedWithStatus:(BOOL)status;
  
To get error messages 
 
 -(void)sessionCompletedWithError:(NSString*_Nullable)errorMessage;

Validate Status(At server side)
  
  After validating sessionToken we recommend to validate poll status using LiveEnsure Web-service calls.

