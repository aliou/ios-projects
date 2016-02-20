### Notes

#### Making the phone vibrate

```swift
import AudioToolbox

func phoneVibrate() {
  AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
}
```
