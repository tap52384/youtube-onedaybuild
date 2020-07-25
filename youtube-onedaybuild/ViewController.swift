//
//  ViewController.swift
//  youtube-onedaybuild
//
//  Created by zplewis on 7/24/20.
//  Copyright © 2020 zplewis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var model = Model()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        model.getVideos()
    }


}

