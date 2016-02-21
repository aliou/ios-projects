#### Notes

#### App without a storyboard
- Remove the `Main.storyboard` file.
- Remove the `Main storyboard file base name` key from the file `info.plist`.
- In the `AppDelegate.swift` file, add:

```swift
var window: UIWindow? = UIWindow(frame: UIScreen.mainScreen().bounds)
```

- Within `application(_:didFinishLaunchingWithOptions:)`, add:

```swift
window!.rootViewController = ViewController()
window!.makeKeyAndVisible()
```

#### Getting steps data

```swift
import CoreMotion

// Make sure the pedometer is initialized before way before starting using it.
let pedometer = CMPedometer()

func fetchSteps() {
  // Check if we can get data:
  if !CMPedometer.isStepCountingAvailable() {
    stepsLabel.text = "Steps data is not available."
    return
  }

  // Query the data for the current day:
  let today = NSDate().beginningOfDay()
  let now = NSDate()

  pedometer.queryPedometerDataFromDate(today, toDate: now) {
    (data: CMPedometerData?, error: NSError?) -> Void in
    var labelText: String
    // Implicit unwrapping of the `data` object.
    if let stepsData = data {
      labelText = "\(stepsData.numberOfSteps) steps so far today."
    } else {
      labelText = "Error retrieving the steps data."
    }

    // Since we update something related to the UI, we need to do it in the
    // main queue / thread or Xcode throws warnings everywhere.
    dispatch_async(dispatch_get_main_queue()) {
      self.stepsLabel.text = labelText
    }
  }
}
```


#### Class extensions

Class extensions allows you to add custom behavior to class already existing.
Kinda like monkey patching in ruby.

Example in the playground.


#### Links
- [StackOverflow - Getting a “This application is modifying the autolayout engine” error?](http://stackoverflow.com/questions/28302019/getting-a-this-application-is-modifying-the-autolayout-engine-error)
- [StackOverflow - NSDate beginning of day and end of day](http://stackoverflow.com/questions/13324633/nsdate-beginning-of-day-and-end-of-day)
- [#98: Auto Layout in Code 📐📏](https://littlebitesofcocoa.com/98-auto-layout-in-code)
