//  Created by Philipp Saminger on 28.11.24.

public protocol FeedCache {
    
    typealias Result = Swift.Result<Void, Error>

    func save(_ feed: [FeedImage], completion: @escaping (Result) -> Void)
    
}
