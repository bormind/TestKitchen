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

  func testDishesAreCleanedInTheMorning() {
    let filterRelevant = relevantValues(["Kitchen Day Started", "Washed Dishes"])

    let tracker = KitchenTracker()
    vm.config(tracker: tracker)

    XCTAssertEqual([], tracker.values)

    vm.startTheDay()

    XCTAssertEqual(["Kitchen Day Started", "Washed Dishes"], tracker.values |> filterRelevant)
  }

  func testCanMakeCoffee() {
    let filterRelevant = relevantValues(["Grind Coffee Beans", "Bring Coffee From Starbucks", "Coffee is ready"])

    let tracker = KitchenTracker()
    vm.config(tracker: tracker)

    XCTAssertEqual([], tracker.values)

    vm.startTheDay()

    vm.makeCoffee()

    XCTAssertEqual(["Grind Coffee Beans", "Bring Coffee From Starbucks", "Coffee is ready"],
      tracker.values |> filterRelevant)

    vm.makeCoffee()

    XCTAssertEqual(["Grind Coffee Beans", "Bring Coffee From Starbucks", "Coffee is ready",
                    "Grind Coffee Beans", "Bring Coffee From Starbucks", "Coffee is ready"],
      tracker.values |> filterRelevant)

  }

  func testCanMakeTea() {
    let filterRelevant = relevantValues(["Boil the watter", "Tea is ready"])

    let tracker = KitchenTracker()
    vm.config(tracker: tracker)

    XCTAssertEqual([], tracker.values)

    vm.startTheDay()

    vm.makeTea()

    XCTAssertEqual(["Boil the watter", "Tea is ready"],
      tracker.values |> filterRelevant)

    vm.makeTea()

    XCTAssertEqual(["Boil the watter", "Tea is ready",
                    "Boil the watter", "Tea is ready"],
      tracker.values |> filterRelevant)

  }

}
