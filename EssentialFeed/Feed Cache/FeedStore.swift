//  Created by Philipp Saminger on 18.06.24.

import Foundation

public enum RetrieveCachedFeedResult {
    case empty
    case found(feed: [LocalFeedImage], timestamp: Date)
    case failure(Error)
}

public protocol FeedStore {
    typealias DeletionCompletion = (Error?) -> Void
    typealias InsertionCompletion = (Error?) -> Void
    typealias RetreivalCompletion = (RetrieveCachedFeedResult) -> Void

    func deleteCachedFeed(completion: @escaping DeletionCompletion)
    
    func insert(_ feed: [LocalFeedImage], _ timestamp: Date, completion: @escaping InsertionCompletion)
    
    func retrieve(completion: @escaping RetreivalCompletion)
}
