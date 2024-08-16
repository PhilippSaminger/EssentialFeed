//
//  FeedCacheTestHelpers.swift
//  EssentialFeedTests
//
//  Created by Philipp Saminger on 07.08.24.
//

import Foundation
import EssentialFeed

func uniqueImageFeed() -> (models: [FeedImage], local: [LocalFeedImage]) {
    let feed = [FeedImage(id: UUID(), description: nil, location: nil, url: anyURL())]
    let localFeed = feed.map { LocalFeedImage(id: $0.id, description: $0.description, location: $0.location, url: $0.url)}
    return (feed, localFeed)
}

extension Date {
    
    private var feedCacheMaxAgeInDays: Int { 7 }
    
    func minusFeedCacheMaxAge() -> Date {
        adding(days: -feedCacheMaxAgeInDays)
    }
    
    private func adding(days: Int) -> Date {
        Calendar(identifier: .gregorian).date(byAdding: .day, value: days, to: self)!
    }
    
}

extension Date {
    
    func adding(seconds: TimeInterval) -> Date {
        self + seconds
    }
    
}
