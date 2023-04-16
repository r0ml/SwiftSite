// Copyright (c) 1868 Charles Babbage
// Found amongst his effects by r0ml

import Foundation

public class Folder {
  var name : String
  var wrapper : FileWrapper
  
  public init(_ s : String, @FolderBuilder clo : () -> Folder) {
    name = s
    let z = clo()
    wrapper = z.wrapper
  }

  public init(name: String, wrapper: FileWrapper) {
    self.name = name
    self.wrapper = wrapper
  }
  
  public var description : String {
    if wrapper.isDirectory {
      var z = "folder: \(name)\n"
      for (k,v) in wrapper.fileWrappers ?? [:] {
        z.append("  \(k):\(v.regularFileContents?.count ?? 0)\n")
      }
      return z
    } else {
      let n = wrapper.regularFileContents?.count ?? 0
      return "file: \(name) \(n) bytes"
    }
  }
}



public class Site {
  var wrapper : FileWrapper
  
  public init( @FolderBuilder clo : () -> Folder) {
    let z = clo()
    wrapper = z.wrapper
  }
}


/*
extension Never : Site {
  public var body: Never {
    fatalError("no there there")
  }
  
  public typealias Body = Never
}

public struct EmptySite : Site {
  public typealias Body = Never
  
  public init() {}
  
  public var body : Self.Body {
    fatalError("no body for EmptySite")
 }

}
*/

@resultBuilder public enum FolderBuilder {
  public static func buildBlock(_ components: Page...) -> Folder {
    var dd : [String : FileWrapper ] = [:]
    let _ = components.map { k in dd[k.url.relativeString] = k.wrapper  }
    let yy = FileWrapper.init(directoryWithFileWrappers: dd)
    return Folder(name: "", wrapper: yy)
  }

  /*
    /// Builds an expression within the builder.
  public static func buildExpression(_ content: Page...) -> Folder {
    var dd : [String : FileWrapper ] = [:]
    let _ = content.map { k in dd[k.url.relativeString] = k.wrapper  }
    let yy = FileWrapper.init(directoryWithFileWrappers: dd)
    return Folder(name: "", wrapper: yy)
  }
   */

/*  public static func buildExpression(_ content: Page) -> Folder {
    return [content]
  }
*/
  
  /*
    /// Builds an empty view from a block containing no statements.
  public static func buildBlock() -> [Page] {
    return []
  }
*/
  
    /// Passes a single view written as a child view through unmodified.
    ///
    /// An example of a single view written as a child view is
    /// `{ Text("Hello") }`.
  ///
/*  public static func buildBlock(_ content: Page) -> [Page] {
    return [content]
  }
 */
}







