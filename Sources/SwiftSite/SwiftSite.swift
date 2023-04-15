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

@resultBuilder public enum SiteBuilder {

    /// Builds an expression within the builder.
  public static func buildExpression<Content>(_ content: Content) -> Content where Content : Site {
    return content
  }

    /// Builds an empty view from a block containing no statements.
  public static func buildBlock() -> EmptySite {
    return EmptySite()
  }

    /// Passes a single view written as a child view through unmodified.
    ///
    /// An example of a single view written as a child view is
    /// `{ Text("Hello") }`.
  public static func buildBlock<Content>(_ content: Content) -> Content where Content : Site {
    return content
  }
}







public protocol Page {

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required ``View/body-swift.property`` property.
    associatedtype Body : Page

    /// The content and behavior of the view.
    ///
    /// When you implement a custom view, you must implement a computed
    /// `body` property to provide the content for your view. Return a view
    /// that's composed of built-in views that SwiftUI provides, plus other
    /// composite views that you've already defined:
    ///
    ///     struct MyView: View {
    ///         var body: some View {
    ///             Text("Hello, World!")
    ///         }
    ///     }
    ///
    /// For more information about composing views and a view hierarchy,
    /// see <doc:Declaring-a-Custom-View>.
    @PageBuilder var body: Self.Body { get }
}


@resultBuilder public struct PageBuilder {

    /// Builds an expression within the builder.
  public static func buildExpression<Content>(_ content: Content) -> Content where Content : Page {
    return content
  }

    /// Builds an empty view from a block containing no statements.
//    public static func buildBlock() -> EmptyView

    /// Passes a single view written as a child view through unmodified.
    ///
    /// An example of a single view written as a child view is
    /// `{ Text("Hello") }`.
  public static func buildBlock<Content>(_ content: Content) -> Content where Content : Page {
    return content
  }
}
