//
//  Query.swift
//  audioPlayerwithNetWorking
//
//  Created by Tigran on 7/23/19.
//  Copyright © 2019 Tigran Vilasyan. All rights reserved.
//

import Foundation
import UIKit

let host = "https://itunes.apple.com"
let search = host + "/search"
let media = "media"
let entity = "entity"
let term = "term"

class SongsManager {
    
    
    static let shared = SongsManager()

    private let session = URLSession(configuration: .default)
    private func addQueries(_ queries: [String: String], to baseURL: URL) -> URL {
        var components = URLComponents(string: baseURL.absoluteString)
        let queryItems = queries.map { URLQueryItem(name: $0, value: $1.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)) }
        components?.queryItems = queryItems
        return components?.url ?? baseURL
    }
    //https://itunes.apple.com/search/media=music&entity=song&term=\linkin
    
    func requestSong(_ name: String, completion: @escaping ([Song]?) -> Void) {
        guard var url = URL(string: search) else { print("no url", search); return }
        let queries: [String: String] = [media: "music", entity: "song", term: name]
        url = addQueries(queries, to: url)
        let task = session.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async { // Correct
                guard error == nil, let response = response as? HTTPURLResponse, response.statusCode == 200 else { completion(nil); return }
                guard let data = data else { completion(nil); return }
                guard let result = try? JSONDecoder().decode(Result.self, from: data) else { completion(nil); return }
                completion(result.results)
            }
        }
        task.resume()
    }
}

