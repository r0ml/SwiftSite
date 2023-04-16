
import Foundation

public struct SwiftSite {
    public private(set) var text = "Hello, World!"

    public init() {
    }
}

public protocol Site {
  associatedtype Body : Site
  
  @SiteBuilder var body : Self.Body { get }
}

public protocol WebSite {
  associatedtype Body : Site
  @SiteBuilder var body : Self.Body { get }
 // init()
}

extension WebSite {
  public static func main() {
    print("hello site")
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

@resultBuilder public enum SiteBuilder {

    /// Builds an expression within the builder.
  public static func buildExpression<Content>(_ content: Content...) -> [Content] where Content : Page {
    return content
  }

    /// Builds an empty view from a block containing no statements.
  public static func buildBlock() -> [Page] {
    return []
  }

    /// Passes a single view written as a child view through unmodified.
    ///
    /// An example of a single view written as a child view is
    /// `{ Text("Hello") }`.
  public static func buildBlock<Content>(_ content: Content) -> Content where Content : Site {
    return content
  }
}







public class Page {
  var url : URL
  var wrapper : FileWrapper
  
  public init(_ s : String, @PageBuilder clo : () -> String) {
    url = URL(filePath: s)
    wrapper = FileWrapper(regularFileWithContents: Data( clo().utf8 ))
  }
  
}


@resultBuilder public struct PageBuilder {

    /// Builds an expression within the builder.
  public static func buildExpression(_ content: String) -> String {
    return content
  }

  
//  public static func buildExpression<Content>(_ content: String) -> Page {
//
//  }

  
    /// Builds an empty view from a block containing no statements.
//    public static func buildBlock() -> EmptyView

    /// Passes a single view written as a child view through unmodified.
    ///
    /// An example of a single view written as a child view is
    /// `{ Text("Hello") }`.
  public static func buildBlock(_ content: String) -> String {
    return content
  }
}
