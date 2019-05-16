//
//  DevDetailsViewController.swift
//  devTrombi
//
//  Created by celine dann on 16/05/2019.
//  Copyright © 2019 celine dann. All rights reserved.
//

import UIKit

class DevDetailsViewController: UIViewController {
    
    @IBOutlet weak var pictureLabel: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var hiredLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var developerRow: Int?
    var devContainer: DeveloperContainer? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let row = developerRow, let dev = devContainer?.developers?[row] {
            self.nameLabel.text = dev.name
            self.hiredLabel.text = dev.hired ? "hired" : "not hired"
            self.descriptionLabel.text = dev.description
        }
    }
}
