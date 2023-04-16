
import Foundation

public protocol WebSite {
  @FolderBuilder func body() -> Folder
  init()
}

extension WebSite {
  public static func main() {
    let z = Self.init().body()
    print("hello site:\n \(z.description)")
  }
  
  public init() {
    self.init()
  }
}
