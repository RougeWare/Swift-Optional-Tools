# Swift Optional Tools #

Some tools to make Optionals easier to use


## Examples ##

### Unwrap or throw an error ###

```swift

let image = try UIImage(named: "My Image").unwrappedOrThrow()
let color = try UIColor(named: "My Color").unwrappedOrThrow(error: ColorNotFoundError())

```
