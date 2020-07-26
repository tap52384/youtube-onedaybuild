//
//  Response.swift
//  youtube-onedaybuild
//
//  Created by zplewis on 7/25/20.
//  Copyright © 2020 zplewis. All rights reserved.
//

import Foundation

struct Response: Decodable {
    // An optional array of Video objects
    var items: [Video]?
    
    enum CodingKeys:String, CodingKey {
        case items
    }
    
    init (from decoder: Decoder) throws {
    
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // What does .self do in Swift?
        self.items = try container.decode([Video].self, forKey: .items)
        
    }
}
