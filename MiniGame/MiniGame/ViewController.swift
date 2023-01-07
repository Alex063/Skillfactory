//
//  ViewController.swift
//  MiniGame
//
//  Created by Aleksandr Gulakov on 06.01.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var view1: MyCustomView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view1.removeFromSuperview()
  
        let guide = view.safeAreaLayoutGuide
        let heightView = Int(guide.layoutFrame.size.height - 70)
        let widthView = Int(guide.layoutFrame.size.width - 70)

        for _ in 1...7 {
            var addSubviewY = Int.random(in: 70..<heightView)
            var addSubviewX = Int.random(in: 70..<widthView)
            view.addSubview(MyCustomView(frame: CGRect (x: addSubviewX ,y: addSubviewY, width: 50, height: 50)))
        }
        
        view.subviews.forEach { mySubView in
            let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(didPan))
            mySubView.addGestureRecognizer(panGestureRecognizer)
        }
        
    }
        
    @objc private func didPan(_ gesture: UIPanGestureRecognizer) {
        let gestureTranslation = gesture.translation(in: view)
        guard let gestureView = gesture.view as? MyCustomView else { return }
        gestureView.center = CGPoint(
            x: gestureView.center.x + gestureTranslation.x,
            y: gestureView.center.y + gestureTranslation.y
        )
        gesture.setTranslation(.zero, in: view)
        guard gesture.state == .ended else { return }
        
        viewIsIntersect(gestureView)
    }
    
    func unification (_ myView1: MyCustomView, _ myView2: MyCustomView) {
        myView1.removeFromSuperview() // Удалим вьюху
        myView2.increaseCircleSize() // Изменям размер и цвет
    }
    
    func viewIsIntersect (_ checkingView: MyCustomView) {
        view.subviews.forEach {
            guard checkingView != $0, checkingView.intersects($0) else { return }
            unification(checkingView, $0 as! MyCustomView)
        }
    }

}

extension UIView {
    func intersects(_ val: UIView) -> Bool {
        let myVal = convert(val.bounds, from: val)
        return bounds.intersects(myVal)
    }
}
