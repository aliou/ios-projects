//
//  ImageViewController.swift
//  Image Feed
//
//  Created by Aliou Diallo on 13/03/16.
//  Copyright © 2016 Aliou Diallo. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

  var image: Image
  var imageView: UIImageView

  init(image: Image) {
    self.image = image
    self.imageView = UIImageView()

    super.init(nibName: nil, bundle: nil)

    self.imageView.frame = view.frame
    if let image = image.image {
      self.imageView.image = image
    }
    view.addSubview(imageView)
  }
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
