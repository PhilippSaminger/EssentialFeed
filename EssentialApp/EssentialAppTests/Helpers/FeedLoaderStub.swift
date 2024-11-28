//  Created by Philipp Saminger on 28.11.24.

import EssentialFeed

public class FeedLoaderStub: FeedLoader {
    
    private let result: FeedLoader.Result
    
    init(result: FeedLoader.Result) {
        self.result = result
    }
    
    public func load(completion: @escaping (FeedLoader.Result) -> Void) {
        completion(result)
    }
}
