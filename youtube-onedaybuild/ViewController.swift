//
//  ViewController.swift
//  youtube-onedaybuild
//
//  Created by zplewis on 7/24/20.
//  Copyright © 2020 zplewis. All rights reserved.
//

import UIKit

// UITableViewDatasource is a protocol
// UITableViewDelegate is a protocol
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ModelDelegate {
    
    
    
    // TODO: What does this mean?
    @IBOutlet weak var tableView: UITableView!
    
    var model = Model()
    // Initialized to an empty array of videos
    var videos = [Video]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Sets the data source to the view controller
        tableView.dataSource = self
        tableView.delegate = self
        
        model.delegate = self
        
        model.getVideos()
    }
    
    // MARK: - TableView Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // returns this list of
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // get a cell based on the index
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath)
        
        // Configure the prototype cell with the data
        // Get the title for the specified video
        let title = self.videos[indexPath.row].title
        
        cell.textLabel?.text = title
        
        // Return the cell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    // MARK: - Model Delegate Methods
    
    func videosFetched(_ videos: [Video]) {
        // Set the returned videos to our video property
        self.videos = videos
        
        // Refresh the tableview
        tableView.reloadData()
    }


}

