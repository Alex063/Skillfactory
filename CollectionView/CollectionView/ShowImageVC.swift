//
//  ShowImageVC.swift
//  CollectionView
//
//  Created by Aleksandr Gulakov on 02.01.2023.
//

import UIKit

class ShowImageVC: UIViewController {

    @IBOutlet weak var currentImage: UIImageView!
    
    var imageName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        currentImage.image = UIImage(named: imageName)
    }

    func setImageName (name: String) {
        imageName = name
    }
}
