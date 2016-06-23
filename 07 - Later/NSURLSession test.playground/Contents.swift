//: Playground - noun: a place where people can play

import UIKit
import XCPlayground

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

typealias CompletionHandler = (success: Bool, object: AnyObject?) -> ()

let endpoint = "https://later.dumb.tools/api/bookmarks"

private func dataTask(request: NSMutableURLRequest, method: String, completion: CompletionHandler) {
  request.HTTPMethod = method

  let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
  session.dataTaskWithRequest(request) { (data, response, error) in
    if let data = data {
      let json = try? NSJSONSerialization.JSONObjectWithData(data, options: [])
      if let response = response as? NSHTTPURLResponse where 200...299 ~= response.statusCode {
        completion(success: true, object: json)
      } else {
        completion(success: false, object: json)
      }
    }
  }.resume()
}

private func post(request: NSMutableURLRequest, completion: (success: Bool, object: AnyObject?) -> ()) {
  dataTask(request, method: "POST", completion: completion)
}

private func put(request: NSMutableURLRequest, completion: (success: Bool, object: AnyObject?) -> ()) {
  dataTask(request, method: "PUT", completion: completion)
}

private func get(request: NSMutableURLRequest, completion: (success: Bool, object: AnyObject?) -> ()) {
  dataTask(request, method: "GET", completion: completion)
}

let request = NSMutableURLRequest(URL: NSURL(string: endpoint)!)

get(request) { (success, object) in
  if let object = object as? Dictionary<String, AnyObject> {
    let date = object["date"] as! String
    if let bookmarks = object["bookmarks"] as? [String] {
      for bookmark in bookmarks { print("\(date) => \(bookmark)") }
    }
  }
}