//
// Created by Boris Schneiderman on 6/29/17.
// Copyright (c) 2017 Boris Schneiderman. All rights reserved.
//

import Foundation


final class KitchenTracker {
  var values: [String] = []
  func log(_ value: String) {
    self.values.append(value)
  }
}
