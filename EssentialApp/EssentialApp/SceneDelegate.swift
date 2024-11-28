//
//  Created by Philipp Saminger
//

import UIKit
import CoreData
import EssentialFeed
import EssentialFeediOS

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
	var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
        
        let remoteURL = URL(string: "https://static1.squarespace.com/static/5891c5b8d1758ec68ef5dbc2/t/5dab38c37d6ae13037e3cdaa/1571502294594/essential_app_feed.json")!
        
        let remoteClient = URLSessionHTTPClient(session: URLSession(configuration: .ephemeral))
        let remoteFeedLoader = RemoteFeedLoader(url: remoteURL, client: remoteClient)
        let remoteImageLoader = RemoteFeedImageDataLoader (client: remoteClient)
       
        let localStoreURL = NSPersistentContainer.defaultDirectoryURL().appendingPathComponent ("'feed-store.sqlite")
        
        let localStore = try! CoreDataFeedStore(storeURL: localStoreURL)
        let localFeedLoader = LocalFeedLoader(store: localStore, currentDate: Date.init)
        let localImageLoader = LocalFeedImageDataLoader (store: localStore)
        
        let primaryFeedLoader = FeedLoaderCacheDecorator(decoratee: remoteFeedLoader, cache: localFeedLoader)
        
        window?.rootViewController = FeedUIComposer.feedComposedWith(feedLoader: FeedLoaderWithFallbackComposite(primary: primaryFeedLoader,
                                                                                                                 fallback: localFeedLoader),
                                                                     imageLoader: FeedImageDataLoaderWithFallbackComposite(primary: localImageLoader,
                                                                                                                           fallback: remoteImageLoader))
    }
}
