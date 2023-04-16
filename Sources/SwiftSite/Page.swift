
import Foundation

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

