//  Created by Philipp Saminger on 18.06.24.

import Foundation

public protocol FeedStore {
    typealias DeletionCompletion = (Error?) -> Void
    typealias InsertionCompletion = (Error?) -> Void
    
    func deleteCachedFeed(completion: @escaping DeletionCompletion)
    
    func insert(_ items: [LocalFeedItem], _ timestamp: Date, completion: @escaping InsertionCompletion)
}
