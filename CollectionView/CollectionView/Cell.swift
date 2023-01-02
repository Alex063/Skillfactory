//
//  Cell.swift
//  CollectionView
//
//  Created by Aleksandr Gulakov on 02.01.2023.
//

import UIKit

class Cell: UICollectionViewCell {
    
    @IBOutlet weak var temperatureImage: UIImageView!
    @IBOutlet weak var smileImage: UIImageView!
    
    
    func setTemperatureImage(tempName: String) {
        temperatureImage.image = UIImage(named: tempName)
    }
    
    func setSmileImage(tempName: String) {
        smileImage.image = UIImage(named: tempName)
    }
    
}
