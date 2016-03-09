### Notes

#### Multiple protocol constraints

```swift
// Having the following protocols:

protocol FirstProtocol {
  // Something cool.
}

protocol SecondProtocol {
  // Something cool.
}

// To have a class taking a generic type implementing the previous protocols,
// you have two solutions:

// Using a where clause
class DopeViewController<T where T : FirstProtocol, T : SecondProtocol>{ }
// OR using protocol composition.
class DopeViewController<T : protocol<FirstProtocol, SecondProtocol>>{ }
```

#### Downloading an image

```swift
let url = NSURL(string: "https://source.unsplash.com/category/buildings")
if let resource = url {
  let imageData = NSData(contentsOfURL: resource)
    if let imageData = imageData {
      let image = UIImage(data: imageData)
    }
}
```
