//
//  Video.swift
//  youtube-onedaybuild
//
//  Created by zplewis on 7/25/20.
//  Copyright © 2020 zplewis. All rights reserved.
//

import Foundation

// https://developer.apple.com/documentation/swift/decodable
// A type that can decode itself from an external representation.
// https://developer.apple.com/documentation/foundation/archives_and_serialization/encoding_and_decoding_custom_types#2904056
// Look at the "Encode or Decode Exclusively" section.
struct Video : Decodable {
    // By setting the value, we are techinically setting the type
    // String is a standard library type
    var videoId = ""
    var title = ""
    var description = ""
    var thumbnail = ""
    // Date is a Foundation type
    var published = Date()
    
    // TODO: look at how enums work
    // CodingKey - a type that can be used as a key for encoding and decoding
    // https://developer.apple.com/documentation/swift/codingkey
    // CodingKey protocol is used as the authoritative list of properties that must be included when instances of a codable type,
    // like Decodable, are encoded or decoded.
    // TODO: Does the order matter? I'm assuming it doesn't?
    enum CodingKeys: String, CodingKey {
        
        // keys that exist in the JSON returned from the YouTube API that do not
        // directly map to variables in this Video struct
        case snippet
        case thumbnails
        case high
        case resourceId
        
        // maps the vars above to the keys in the returned JSON
        case published = "publishedAt"
        // You can also just use "case title" since the source and destination keys match
        case title
        case description
        case thumbnail = "url"
        case videoId
    }
    
    init (from decoder: Decoder) throws {
        
        // TODO: See how this works
        // My assumption is to look for an object within the entire JSON response that has
        // all of the keys in the enum , but that is just a guess based on the "keyedBy"
        // parameter for the container method
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // Gets the snippet object from the items object somehow...
        // netstedContainer is used to get a nested object
        let snippetContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
        
        // Parse title
        self.title = try snippetContainer.decode(String.self, forKey: .title)
        
        // parse description
        self.description = try snippetContainer.decode(String.self, forKey: .description)
        
        // Parse the publish date
        // The first parameter of the decode method specifies the type of the value
        // The second value looks in the CodingKeys enum for a case called "published". If it exists,
        // and a value is set, the value is actually the key in the JSON response that is assigned to
        // "published" in this struct. If no value is set, then the key in the JSON response is assumed
        // to be the same as the case in the enum, like with snippet, thumbnails, high, resourceId, etc.
        self.published = try snippetContainer.decode(Date.self, forKey: .published)
        
        // Parse thumbnails object
        let thumbnailsContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnails)
        let highContainer = try thumbnailsContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .high)
        
        self.thumbnail = try highContainer.decode(String.self, forKey: .thumbnail)
        
        // Parse Video ID
        let resourceIdContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .resourceId)
        self.videoId = try resourceIdContainer.decode(String.self, forKey: .videoId)
    }
}
