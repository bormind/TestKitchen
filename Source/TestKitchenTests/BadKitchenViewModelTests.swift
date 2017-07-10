//
// Created by Boris Schneiderman on 6/29/17.
// Copyright (c) 2017 Boris Schneiderman. All rights reserved.
//

import XCTest
@testable import TestKitchen

class BadKitchenViewModelTests : XCTestCase {

  let vm = KitchenViewModel()

  override func setUp() {
    print("setUp")
  }

  override func tearDown() {
    print("tearDown")
  }

  func testCanMakeCoffeeAfterDayStarted() {
    let tracker = KitchenTracker()
    vm.config(tracker: tracker)

    XCTAssertEqual([], tracker.values)

    vm.startTheDay()

    vm.makeCoffee()

    XCTAssertEqual(["Kitchen Day Started", "Washed Dishes",
                    "Grind Coffee Beans", "Bring Coffee From Starbucks", "Coffee is ready"],
      tracker.values)

    //can make more coffee
    vm.makeCoffee()

    XCTAssertEqual(["Kitchen Day Started", "Washed Dishes",
                    "Grind Coffee Beans", "Bring Coffee From Starbucks", "Coffee is ready",
                    "Grind Coffee Beans", "Bring Coffee From Starbucks", "Coffee is ready"],
      tracker.values)

  }

  func testCanMakeTeaAfterDayStarted() {
    let tracker = KitchenTracker()
    vm.config(tracker: tracker)

    XCTAssertEqual([], tracker.values)

    vm.startTheDay()

    vm.makeTea()

    XCTAssertEqual(["Kitchen Day Started", "Washed Dishes",
                    "Boil the watter", "Tea is ready"],
      tracker.values)

    //can make more tea
    vm.makeTea()

    XCTAssertEqual(["Kitchen Day Started", "Washed Dishes",
                    "Boil the watter", "Tea is ready",
                    "Boil the watter", "Tea is ready"],
      tracker.values)

  }

  func testDishesAreCleanedInTheMorning() {
    let tracker = KitchenTracker()
    vm.config(tracker: tracker)

    XCTAssertEqual([], tracker.values)

    vm.startTheDay()

    XCTAssertEqual(["Kitchen Day Started", "Washed Dishes"], tracker.values)
  }


}
