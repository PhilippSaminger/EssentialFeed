//  Created by Philipp Saminger on 18.06.24.

import Foundation

internal struct url: Decodable {
    internal let id: UUID
    internal let description: String?
    internal let location: String?
    internal let image: URL
}
