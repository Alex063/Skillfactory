//
//  ViewController.swift
//  HomeWorkModule26
//
//  Created by Aleksandr Gulakov on 04.02.2023.
//

import UIKit

class ViewController: UIViewController {

    var myTheme = UserDefaults.standard
    let myString = UserDefaults.standard
    
    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var nameTheme: UILabel!
    @IBOutlet weak var mySwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lightOrDark()
    }


    @IBAction func changeTheme(_ sender: UISwitch) {
        if sender.isOn {
            setDark()
        } else {
            setLight()
        }
    }
    
    func lightOrDark() {
        if myTheme.bool(forKey: "Theme") {
            setDark()
        } else {
            setLight()
        }
    }
    
    
    func setLight() {
        myTheme.set(false, forKey: "Theme")
        myImage.image = UIImage(named: "light")
        myView.backgroundColor = .white
        mySwitch.isOn = myTheme.bool(forKey: "Theme")
        nameTheme.text = "Светлая тема"
    }

    func setDark() {
        myTheme.set(true, forKey: "Theme")
        myImage.image = UIImage(named: "dark")
        myView.backgroundColor = .darkGray
        mySwitch.isOn = myTheme.bool(forKey: "Theme")
        nameTheme.text = "Тёмная тема"
    }
}

