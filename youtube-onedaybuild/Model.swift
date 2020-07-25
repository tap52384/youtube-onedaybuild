//
//  Model.swift
//  youtube-onedaybuild
//
//  Created by zplewis on 7/25/20.
//  Copyright © 2020 zplewis. All rights reserved.
//

import Foundation

class Model {
    
    func getVideos() {
        
        // Create a URL object
        let url = URL(string: Constants.API_URL)
        
        // TODO: Look into this
        guard url != nil else {
            return
        }
        
        // Get a URLSession object
        let session = URLSession.shared
        
        // Get a data task (represents a single call to the API)
        // from the URLSession object
        // TODO: what is variable with an exclamation point? If we're guarding against nil above, is it still needed?
        // Xcode let you double-click the completionHander, which I assume is looking for a function. You can double-click the completionHander parameters to create a new closure (curly brackets) to prevent writing a new function.
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            // Check if there are any errors
            if error != nil || data == nil {
                return
            }
            
            // Parsing the data into video objects
        }
        
        // Kick off the task
        dataTask.resume()
    }
}
