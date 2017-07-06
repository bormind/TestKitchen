//
// Created by Boris Schneiderman on 6/29/17.
// Copyright (c) 2017 Boris Schneiderman. All rights reserved.
//

import Foundation

final class KitchenViewModel {

  var tracker: KitchenTracker = KitchenTracker()

  func config(tracker: KitchenTracker) {
    self.tracker = tracker
  }

  func startTheDay() {
    tracker.log("Kitchen Day Started")
//    doDishes()
  }

  func doDishes() {
    tracker.log("Washed Dishes")
  }

  func finishTheDay() {
    doDishes()
    tracker.log("Kitchen Day Finished")
  }

  func makeCoffee() {
    tracker.log("Grind Coffee Beans")
    tracker.log("Bring Coffee From Starbucks")
    tracker.log("Coffee is ready")
  }

  func makeTea() {
    tracker.log("Boil the watter")
    tracker.log("Tea is ready")
  }
}
