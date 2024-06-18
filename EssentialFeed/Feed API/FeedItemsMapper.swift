//  Created by Philipp Saminger on 17.05.24.

import Foundation

internal final class FeedItemsMapper {
    
    private struct Root: Decodable {
        let items: [url]
    }
    
    internal static func map(_ data: Data, from response: HTTPURLResponse) throws -> [url] {
        guard response.statusCode == 200,
              let root = try? JSONDecoder().decode(Root.self, from: data) else {
            throw RemoteFeedLoader.Error.invalidData
        }
        return root.items
    }
    
}
