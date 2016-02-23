### Notes

#### Recognizing a Tap

```swift
let tap = UITapGestureRecognizer(target: self, action: "customAction:")
view.addGestureRecognizer(tap)
```

#### Creating an image from a View

```swift
UIGraphicsBeginImageContext(gradientView!.bounds.size)
gradientView!.layer.renderInContext(UIGraphicsGetCurrentContext()!)
let gradientImage = UIGraphicsGetImageFromCurrentImageContext()
UIGraphicsEndImageContext()
```

#### Saving an image to the Photos Album
```swift
func saveImage(image: UIImage) {
  UIImageWriteToSavedPhotosAlbum(image, self, "image:didFinishSavingWithError:contextInfo:", nil)
}

func image(image: UIImage, didFinishSavingWithError error: NSError?, contextInfo: UnsafePointer<Void>) {
    if error == nil {
      let ac = UIAlertController(title: "Saved!", message: "Your gradient has been saved.", preferredStyle: .Alert)
      ac.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
      presentViewController(ac, animated: true, completion: nil)
    } else {
      let ac = UIAlertController(title: "Save error", message: error?.localizedDescription, preferredStyle: .Alert)
      ac.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
      presentViewController(ac, animated: true, completion: nil)
    }
  }
}

```

#### Links

- [StackOverflow - Pick a random element from an Array](http://stackoverflow.com/questions/24003191/pick-a-random-element-from-an-array)
- [Swift, UIView touch event in controller](http://stackoverflow.com/questions/30505165/swift-uiview-touch-event-in-controller)
- [Carthage](https://github.com/Carthage/Carthage)
- [GradientView](https://github.com/soffes/GradientView)
