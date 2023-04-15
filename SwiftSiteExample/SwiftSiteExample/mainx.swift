
import Foundation
import SwiftSite

/* Bug in swift: this file cannot be named: main.swift */


@main struct MySite : WebSite {
//  init() {
//  }
  
  
    var body : some Site {
      IndexPage("index.html")
      Point2Text
      
    }
}

struct IndexPage : Page {
  var name : String
  
  init(_ s : String) {
      name = s
  }
  
  var body : some Page {
    "The html for Index"
  }
}

struct Point2Text : Page {
  var body : some Page {
    "The HTML for p2t"
  }
}

struct NoItAll : Page {
  var body : some Page {
    "The HTML for nia"
  }
}
