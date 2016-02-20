### Notes

#### Updating something on value change

In our case, we want to update the label when the counter value changes. To do
this, you can use the `didSet` observer on our counter:

```swift
var counter = 0 {
  didSet {
    // Whatever I'm updating.
  }
}
```


#### Casting the counter value to String

To set the integer counter value in our label, we can directly use the `String`
constructor:

```swift
valueLabel.text = String(counter)
```

#### Initial styling IBoulets

Instead of adding the styling of IBoulets in the `viewDidLoad` method, we can
add it to the `didSet` observer:

```swift
@IBOutlet weak var resetButton: UIBarButtonItem! {
  didSet {
    resetButton.title = "Reset"
  }
}
```
