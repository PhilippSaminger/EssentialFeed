//  Created by Philipp Saminger on 10.05.24.

import Foundation

public enum LoadFeedResult {
    
    case success([FeedItem])
    case failure(Error)
    
}

public protocol FeedLoader {
    
    func load(completion: @escaping (LoadFeedResult) ->Void)
    
}
