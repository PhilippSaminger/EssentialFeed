//
//  EssentialAppUIAcceptanceTests.swift
//  EssentialAppUIAcceptanceTests
//
//  Created by Philipp Saminger on 29.11.24.
//  Copyright © 2024 Essential Developer. All rights reserved.
//

import XCTest

final class EssentialAppUIAcceptanceTests: XCTestCase {

   
    func test_onLaunch_displaysRemoteFeedWhenCustomerHasConnectivity() {
        let app = XCUIApplication()
        
        app.launch()
        
        let feedCells = app.cells.matching(identifier: "feed-image-cell")
        XCTAssertEqual(feedCells.count, 22)
        
        let firstImage = app.cells.matching(identifier: "feed-image-view").firstMatch.images.count
        XCTAssertEqual(firstImage, 1)

    }
    
}
