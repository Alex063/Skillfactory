//
//  MyCustomView.swift
//  MiniGame
//
//  Created by Aleksandr Gulakov on 06.01.2023.
//

import UIKit

class MyCustomView: UIView {
    
    var workingView: UIView!
    var xibName: String = "MyCustomView"

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
        addSubview(workingView)
    }
    
    func increaseCircleSize() {
        frame = CGRect(x: frame.minX, y: frame.minY, width: frame.width + 20, height: frame.height + 20)
        workingView.layer.cornerRadius += 10
        workingView.backgroundColor = .systemIndigo        
    }
     
}
