### Notes

#### Making the phone vibrate

```swift
import AudioToolbox

func phoneVibrate() {
  AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
}
```


#### Links
- [Exploring Apple’s 3D Touch](https://medium.com/@rknla/exploring-apple-s-3d-touch-f5980ef45af5#.621pzj49x)
- [3D Force Touch: beyond peek & pop](https://medium.com/produkt-blog/3d-force-touch-beyond-peek-pop-c448edc2b1f5#.x3wdcnpw0)
- [Swift-Vibrate-Tutorial](https://github.com/awseeley/Swift-Vibrate-Tutorial)
