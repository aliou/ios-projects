//
//  ActionRequestHandler.swift
//  add-reminder
//
//  Created by Aliou Diallo on 26/10/15.
//  Copyright © 2015 Aliou Diallo. All rights reserved.
//

import UIKit
import MobileCoreServices
import LinkListKit

class ActionRequestHandler: NSObject, NSExtensionRequestHandling {
  let supportedItemProviders: [String : NSItemProviderCompletionHandler] = [
    String(kUTTypePropertyList): { (itemList, error) in
      if let list = itemList as? NSDictionary {
        if let javascriptResults = list["NSExtensionJavaScriptPreprocessingResultsKey"] as? NSDictionary {
          let url = javascriptResults["baseURI"] as! String
          Reminder.Create(url, completionHandler: { (result, error) in

          })
        }
      }
    },

    String(kUTTypeURL): { (item, error) in
      let url = item as? NSURL
      if let url = url {
        Reminder.Create(url.absoluteString, completionHandler: { (result, error) in

        })
      }
    }
  ]

  func beginRequestWithExtensionContext(context: NSExtensionContext) {

    for item: AnyObject in context.inputItems {
      let inputItem = item as! NSExtensionItem
      for provider: AnyObject in inputItem.attachments! {
        let itemProvider = provider as! NSItemProvider

        for providerType: String in supportedItemProviders.keys {
          if itemProvider.hasItemConformingToTypeIdentifier(providerType) {
            itemProvider.loadItemForTypeIdentifier(providerType, options: nil,
              completionHandler: supportedItemProviders[providerType])
            break
          }
        }
      }
    }
  }
}