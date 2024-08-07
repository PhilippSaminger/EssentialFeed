//
//  SharedTestHelpers.swift
//  EssentialFeedTests
//
//  Created by Philipp Saminger on 07.08.24.
//

import Foundation

func anyNSError() -> NSError {
    NSError(domain: "any error", code: 0)
}

func anyURL() -> URL  {
    URL(string: "https://www.test.at")!
}
