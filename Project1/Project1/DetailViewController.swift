//
//  DetailViewController.swift
//  Project1
//
//  Created by Igor Sapozhnikov on 22.01.2020.
//  Copyright © 2020 Igor Sapozhnikov. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let imageToLoad = selectedImage {
            imageView.image  = UIImage(named: imageToLoad)
        }
    }
}
