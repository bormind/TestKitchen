//
// Created by Boris Schneiderman on 6/29/17.
// Copyright (c) 2017 Boris Schneiderman. All rights reserved.
//

import XCTest
@testable import TestKitchen

class BetterKitchenViewModelTests : XCTestCase {

  let vm = KitchenViewModel()

  override func setUp() {
    print("setUp")
  }

  override func tearDown() {
    print("tearDown")
  }

  func testCanMakeCoffeeAfterDayStarted() {
    let filterRelevant = relevantValues(["Kitchen Day Started", "Grind Coffee Beans", "Bring Coffee From Starbucks", "Coffee is ready"])

    let tracker = KitchenTracker()
    vm.config(tracker: tracker)

    XCTAssertEqual([], tracker.values)

    vm.startTheDay()

    vm.makeCoffee()

    XCTAssertEqual(["Kitchen Day Started",
                    "Grind Coffee Beans", "Bring Coffee From Starbucks", "Coffee is ready"],
      tracker.values |> filterRelevant)

    vm.makeCoffee()

    XCTAssertEqual(["Kitchen Day Started",
                    "Grind Coffee Beans", "Bring Coffee From Starbucks", "Coffee is ready",
                    "Grind Coffee Beans", "Bring Coffee From Starbucks", "Coffee is ready"],
      tracker.values |> filterRelevant)

  }

  func testCanMakeTeaAfterDayStarted() {
    let filterRelevant = relevantValues(["Kitchen Day Started", "Boil the watter", "Tea is ready"])

    let tracker = KitchenTracker()
    vm.config(tracker: tracker)

    XCTAssertEqual([], tracker.values)

    vm.startTheDay()

    vm.makeTea()

    XCTAssertEqual(["Kitchen Day Started",
                    "Boil the watter", "Tea is ready"],
      tracker.values |> filterRelevant)

    vm.makeTea()

    XCTAssertEqual(["Kitchen Day Started",
                    "Boil the watter", "Tea is ready",
                    "Boil the watter", "Tea is ready"],
      tracker.values |> filterRelevant)

  }

  func testDishesAreCleanedInTheMorning() {
    let filterRelevant = relevantValues(["Kitchen Day Started", "Washed Dishes"])

    let tracker = KitchenTracker()
    vm.config(tracker: tracker)

    XCTAssertEqual([], tracker.values)

    vm.startTheDay()

    XCTAssertEqual(["Kitchen Day Started", "Washed Dishes"], tracker.values |> filterRelevant)

    //Can clean again
    vm.doDishes()

    assertExpectedValues(["Kitchen Day Started", "Washed Dishes", "Washed Dishes"],
      tracker.values |> filterRelevant)
    

  }
  
}
