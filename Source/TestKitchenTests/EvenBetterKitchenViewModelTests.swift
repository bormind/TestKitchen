//
// Created by Boris Schneiderman on 6/29/17.
// Copyright (c) 2017 Boris Schneiderman. All rights reserved.
//

import XCTest
@testable import TestKitchen

class EvenBetterKitchenViewModelTests : XCTestCase {

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

    assertExpectedValues([], tracker.values)

    vm.startTheDay()

    vm.makeCoffee()

    assertExpectedValues(["Kitchen Day Started",
                          "Grind Coffee Beans", "Bring Coffee From Starbucks", "Coffee is ready"], tracker.values)

    //can make more coffie
    vm.makeCoffee()

    assertExpectedValues(["Kitchen Day Started",
                          "Grind Coffee Beans", "Bring Coffee From Starbucks", "Coffee is ready",
                          "Grind Coffee Beans", "Bring Coffee From Starbucks", "Coffee is ready"], tracker.values)

  }

  func testCanMakeTeaAfterDayStarted() {
    let tracker = KitchenTracker()
    vm.config(tracker: tracker)

    assertExpectedValues([], tracker.values)

    vm.startTheDay()

    vm.makeTea()

    assertExpectedValues(["Kitchen Day Started",
                          "Boil the watter", "Tea is ready"], tracker.values)

    //can make more tee
    vm.makeTea()

    assertExpectedValues(["Kitchen Day Started",
                          "Boil the watter", "Tea is ready",
                          "Boil the watter", "Tea is ready"], tracker.values)

  }

  func testDishesAreCleanedInTheMorning() {
    let tracker = KitchenTracker()
    vm.config(tracker: tracker)

    assertExpectedValues([], tracker.values)

    vm.startTheDay()

    assertExpectedValues(["Kitchen Day Started", "Washed Dishes"], tracker.values)

    //Can clean again
    vm.doDishes()

    assertExpectedValues(["Kitchen Day Started", "Washed Dishes", "Washed Dishes"], tracker.values)

  }
  

}
