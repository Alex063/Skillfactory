//
//  MyCustomView.swift
//  MiniGame
//
//  Created by Aleksandr Gulakov on 10.01.2023.
//

import UIKit

class MyCustomView: UIView {
    
    var workingView: UIView!
    var xibName: String = "MyCustomView"
    
    struct SetColor {
        static let red: Int = 0
        static let green: Int = 255
        static let blue: Int = 255
        static let stepTone: Int = 51
        static let valuesRGB: CGFloat = 255
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setCustomView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setCustomView()
    }

    func getFromXib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let xib = UINib(nibName: xibName, bundle: bundle)
        let view = xib.instantiate(withOwner: self, options: nil).first as! UIView
        
        return view
    }
    
    func setCustomView() {
        workingView = getFromXib()
        workingView.frame = bounds
        workingView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        workingView.layer.cornerRadius = frame.size.width / 2
        workingView.backgroundColor = UIColor(r: SetColor.red, g: SetColor.green, b: SetColor.blue)
        addSubview(workingView)
    }
    
    func increaseCircleSize() {
        UIView.animate(withDuration: 3) {
            self.workingView.transform = self.workingView.transform.scaledBy (x: 1.3, y: 1.3)
            self.changeCircleColor() // изменение цвета
        }
        
    }
    
    func changeCircleColor() {
        
        let bgColor: UIColor = self.workingView.backgroundColor!
        // Переменные длля получения значения цвета из UIColor
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0

        if bgColor.getRed(&r, green: &g, blue: &b, alpha: &a) {
            let isEmptyGreen = g == 0
            let setColorBlue = Int(b * SetColor.valuesRGB) - (isEmptyGreen ? SetColor.stepTone : 0)
            let setColorGreen = Int(g * SetColor.valuesRGB) - (isEmptyGreen ? 0 : SetColor.stepTone)
            let setColorRed = Int(r * SetColor.valuesRGB)
            self.workingView.backgroundColor = UIColor(r: setColorRed, g: setColorGreen, b: setColorBlue)
        }
    }
    
}

extension UIColor {
// Конвертация цветовых значений от 0 до 255
  public convenience init(r: Int, g: Int, b: Int, alpha: CGFloat = 1.0) {
    self.init(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: alpha)
  }
}
