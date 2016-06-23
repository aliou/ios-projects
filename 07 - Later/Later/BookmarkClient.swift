//
//  BookmarkClient.swift
//  Later
//
//  Created by Aliou Diallo on 23/06/16.
//  Copyright © 2016 Aliou Diallo. All rights reserved.
//

import Foundation

// TODO: Extract enpoint base URL.
let kBookmarkEndpoint = "https://later.dumb.tools/api/bookmarks"

typealias BookmarkClientCompletionHandler = ([Bookmark]) -> ()
typealias DataCompletionHandler = (success: Bool, data: AnyObject?) -> ()

class BookmarkClient {
  static let sharedClient = BookmarkClient()

  func getBookmarks(completionHandler: BookmarkClientCompletionHandler) {
    let request = NSMutableURLRequest(URL: NSURL(string: kBookmarkEndpoint)!)
    var bookmarks: [Bookmark] = []

    get(request) { (success, data) in
      guard success else { return }

      if let data = data as? Dictionary<String, AnyObject> {
//        let date = data["date"] as! String
        if let urls = data["bookmarks"] as? [String] {
          for url in urls {
            let bk = Bookmark(date: NSDate(), url: url, title: nil, description: nil)
            bookmarks.append(bk)
          }

          completionHandler(bookmarks)
        }
      }
    }
  }

  private func get(request: NSMutableURLRequest, completion: (success: Bool, object: AnyObject?) -> ()) {
    dataTask(request, method: "GET", completion: completion)
  }

  private func dataTask(request: NSMutableURLRequest, method: String, completion: DataCompletionHandler) {
    request.HTTPMethod = method

    let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
    session.dataTaskWithRequest(request) { (data, response, error) in
      if let data = data {
        let json = try? NSJSONSerialization.JSONObjectWithData(data, options: [])
        if let response = response as? NSHTTPURLResponse where 200...299 ~= response.statusCode {
          completion(success: true, data: json)
        } else {
          completion(success: false, data: json)
        }
      }
      }.resume()
  }
}