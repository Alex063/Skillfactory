//
//  ViewController.swift
//  MiniGame
//
//  Created by Aleksandr Gulakov on 10.01.2023.
//

import UIKit

class ViewController: UIViewController {
    
    struct Constants {
        static let circleSize: CGFloat = 50
        static let safeAreaInset: CGFloat = 70
        static let circleCount = 7
    }

    @IBOutlet weak var view1: MyCustomView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view1.removeFromSuperview()
  
        setupCircles()
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
        view.layoutIfNeeded()
    }
    
    func viewIsIntersect (_ checkingView: MyCustomView) {
        view.subviews.forEach {
            guard checkingView != $0, checkingView.intersects($0) else { return }
            unification(checkingView, $0 as! MyCustomView)
        }
    }
    
    private func setupCircles() {
        for _ in 0..<Constants.circleCount {
            let randomPoint = makeRandomPoint()
            view.addSubview(MyCustomView(frame: CGRect (x: randomPoint.x ,y: randomPoint.y, width: Constants.circleSize, height: Constants.circleSize)))
        }
        addGesturesForCircles()
    }
    
    private func makeRandomPoint() -> CGPoint {
        let guide = view.safeAreaLayoutGuide
        let heightView = Int(guide.layoutFrame.size.height - Constants.safeAreaInset)
        let widthView = Int(guide.layoutFrame.size.width - Constants.safeAreaInset)
        
        let randomY = Int.random(in: Int(Constants.safeAreaInset)..<heightView)
        let randomX = Int.random(in: Int(Constants.safeAreaInset)..<widthView)
        let point = CGPoint(x: randomX, y: randomY)
        if hasIntersect(for: point) {
            return makeRandomPoint()
        } else {
            return point
        }
        
    }
    
    private func addGesturesForCircles() {
        view.subviews.forEach { mySubView in
            let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(didPan))
            mySubView.addGestureRecognizer(panGestureRecognizer)
        }
    }
    
    private func hasIntersect(for point: CGPoint) -> Bool {
        let randomFrame = CGRect(x: point.x, y: point.y, width: Constants.circleSize, height: Constants.circleSize)
        let intersect = view.subviews.first {
            randomFrame.intersects($0.frame)
        }
        return intersect != nil
    }

}

extension UIView {
    func intersects(_ val: UIView) -> Bool {
        let myVal = convert(val.bounds, from: val)
        return bounds.intersects(myVal)
    }
}
