import UIKit
import Flutter
import GoogleMaps
@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
override func application(
_ application: UIApplication,
didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
) -> Bool {
GeneratedPluginRegistrant.register(with: self)
GMSServices.provideAPIKey("AIzaSyB91YXxQCVgFnU5kVT1rdzmcSY2pv7TLKU")
return super.application(application, didFinishLaunchingWithOptions: launchOptions)
}
}
