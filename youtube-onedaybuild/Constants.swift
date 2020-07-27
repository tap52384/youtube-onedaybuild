//
//  Constants.swift
//  youtube-onedaybuild
//
//  Created by zplewis on 7/25/20.
//  Copyright © 2020 zplewis. All rights reserved.
//

import Foundation

struct Constants {
    // make sure not to commit the API_KEY
    static var API_KEY = ""
    static var PLAYLIST_ID = "PLuxOMzT4jmsGKcAw6V5NXo4rI7aW0bwZJ"
    static var API_URL = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&maxResults=25&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
    static var VIDEOCELL_ID = "VideoCell"
}
