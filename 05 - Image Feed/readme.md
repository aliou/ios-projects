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
