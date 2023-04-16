
import Foundation
import SwiftSite

/* Bug in swift: this file cannot be named: main.swift */


@main struct MySite : WebSite {
//  init() {
//  }
  
  
    var body : some Site {
      Page("index.html") {
        "The html for index"
      }
      Page("p2t.html") {
        "The HTML for p2t"
      }
      Page("nia.html") {
        "The HTML for nia"
      }
      
    }
}

