//
//  ReaponseModel.swift
//  test1
//
//  Created by Rajesh  on 25/10/23.
//

import Foundation

// MARK: - DataResponse
struct DataResponse: Codable {
    let count: Int
    let next, previous: String
    let results: [ResultObj]
}

// MARK: - Result
struct ResultObj: Codable {
    let id: Int
    let title: String
    let url: String
    let imageURL: String
    let newsSite, summary: String
    let publishedAt: String
    let updatedAt: String
    let featured: Bool
    let launches: [Launch]
    let events: [Event]
    
    enum CodingKeys: String, CodingKey {
        case id, title, url
        case imageURL = "image_url"
        case newsSite = "news_site"
        case summary
        case publishedAt = "published_at"
        case updatedAt = "updated_at"
        case featured, launches, events
    }
}

// MARK: - Event
struct Event: Codable {
    let eventID: Int
    let provider: Provider
    
    enum CodingKeys: String, CodingKey {
        case eventID = "event_id"
        case provider
    }
}

enum Provider: String, Codable {
    case launchLibrary2 = "Launch Library 2"
}

// MARK: - Launch
struct Launch: Codable {
    let launchID: String
    let provider: Provider
    
    enum CodingKeys: String, CodingKey {
        case launchID = "launch_id"
        case provider
    }
}
