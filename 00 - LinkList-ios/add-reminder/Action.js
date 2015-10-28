//
//  Action.js
//  add-reminder
//
//  Created by Aliou Diallo on 26/10/15.
//  Copyright © 2015 Aliou Diallo. All rights reserved.
//

var Action = function() {};

Action.prototype = {

  run: function(arguments) {
    arguments.completionFunction({ "baseURI" : document.baseURI });
  },

  finalize: function(arguments) {
  }
};

var ExtensionPreprocessingJS = new Action
