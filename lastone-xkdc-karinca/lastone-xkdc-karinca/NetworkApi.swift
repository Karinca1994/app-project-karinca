//
//  NetworkApi.swift
//  lastone-xkdc-karinca
//
//  Created by Karinca Danielsen on 30/09/2022.
//


import Foundation
import UIKit
//I have an issue here where :it says Type 'ComicsEntry' does not conform to protocol 'Encodable', i tried to make a own... i tried to watch thi video: https://www.youtube.com/watch?v=18-4ShJsNBY but i didnt have the time to finish trying to solve the problem...

//used postman and https://app.quicktype.io/ here

struct Response : Codable {
    var results: [ComicsEntry]
}

struct ComicsEntry: Codable, Identifiable {
    let id: Int
    let publishedAt, news, safeTitle, title: String
    let transcript :String
    let alt: String
    let sourceURL, explainURL: String
    let interactiveURL: String?
    let imgs: [ComicImageModel]

    enum CodingKeys: String, CodingKey {
        case id, publishedAt, news, safeTitle, title, transcript, altx
        case sourceURL = "sourceUrl"
        case explainURL = "explainUrl"
        case interactiveURL = "interactiveUrl"
        case imgs
    }
}

struct ComicImageModel: Codable {
    let height, width: Int
    let ratio: Double
    let sourceURL: String
    let size: String

    enum CodingKeys: String, CodingKey {
        case height, width, ratio
        case sourceURL = "sourceUrl"
        case size
    }
}

typealias ComicsModel = [ComicsEntry]

class NetworkApi {
//coundt figure out how to use the https://xkcd.com/info.0.json api, so i used: https://api.xkcdy.com/comics who can be a bit bugs some times, so i made a failure cases
    static let shared = NetworkApi()
    private let baseURL = "https://api.xkcdy.com/"

    func getComics(since: Int, completion: @escaping (Result<ComicsModel, Errors>) -> Void) {
        let endpoint = baseURL + "comics"

        guard var components = URLComponents(string: endpoint) else {
            completion(.failure(.failureURL))
            return
        }

        components.queryItems = [
            URLQueryItem(name: "since", value: String(since))
        ]

        let url = URLRequest(url: components.url!)

        let _ = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completion(.failure(.failureToShare))
            }

            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.failureResponse))
                return
            }

            guard let data = data else {
                completion(.failure(.failureData))
                return
            }

            do {
                let decoder = JSONDecoder()
                let comics = try decoder.decode(ComicsModel.self, from: data)
                completion(.success(comics))
            } catch {
                completion(.failure(.failureData))
            }

        }.resume()
    }

    func getImageData(_ url: String) -> Data {
        guard let url = URL(string: url) else { return Data() }

        do {
            let data = try Data(contentsOf: url)
            return data
        } catch {
            print(error.localizedDescription)
        }

        return Data()
    }
}


enum Errors: String, Error {
    case failureURL = "Invalid Url, Please try again!"
    case failureToShare = "Couldn´t share your request, Please try again!"
    case failureResponse = "Failure to response to the server. Please try again!"
    case failureData = "Failure data from the server. Please try again!"
    case failureToFavorite = "Failure to favorite comic. Please try again!"
}
