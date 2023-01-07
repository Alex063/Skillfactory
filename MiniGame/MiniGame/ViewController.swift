//
//  ViewController.swift
//  MiniGame
//
//  Created by Aleksandr Gulakov on 06.01.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var view1: MyCustomView!
    @IBOutlet weak var view2: MyCustomView!
    @IBOutlet weak var view3: MyCustomView!
    @IBOutlet weak var view4: MyCustomView!
    @IBOutlet weak var view5: MyCustomView!
    @IBOutlet weak var view6: MyCustomView!
    @IBOutlet weak var view7: MyCustomView!

//    var customViewElement1: MyCustomView = MyCustomView(frame: CGRect (x: 171 ,y: 400, width: 50, height: 50))
//    var customViewElement2: MyCustomView = MyCustomView(frame: CGRect (x: 187 ,y: 300, width: 50, height: 50))
//    var customViewElement3: MyCustomView = MyCustomView(frame: CGRect (x: 280 ,y: 200, width: 50, height: 50))
//    var customViewElement4: MyCustomView = MyCustomView(frame: CGRect (x: 300 ,y: 500, width: 50, height: 50))
//    var customViewElement5: MyCustomView = MyCustomView(frame: CGRect (x: 287 ,y: 600, width: 50, height: 50))
//    var customViewElement6: MyCustomView = MyCustomView(frame: CGRect (x: 20 ,y: 700, width: 50, height: 50))
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view1.backgroundColor = .clear
        view2.backgroundColor = .clear
        view3.backgroundColor = .clear
        view4.backgroundColor = .clear
        view5.backgroundColor = .clear
        view6.backgroundColor = .clear
        view7.backgroundColor = .clear
                
//        view.addSubview(customViewElement1)
//        view.addSubview(customViewElement2)
//        view.addSubview(customViewElement3)
//        view.addSubview(customViewElement4)
//        view.addSubview(customViewElement5)
//        view.addSubview(customViewElement6)
    }
    
    
    func unification (_ myView1: UIView, _ myView2: UIView) {
        myView1.isHidden = true
        myView2.frame = CGRect(x: myView2.frame.minX, y: myView2.frame.minY, width: myView2.frame.width + 20, height: myView2.frame.height + 20)
        myView2.layer.cornerRadius = myView2.frame.size.width / 2
        myView2.backgroundColor = .systemIndigo
    }
    
    func viewIsIntersect (_ isView: UIView) {
        if isView != view1 { if isView.intersects(view1) { unification(isView, view1) } }
        if isView != view2 { if isView.intersects(view2) { unification(isView, view2) } }
        if isView != view3 { if isView.intersects(view3) { unification(isView, view3) } }
        if isView != view4 { if isView.intersects(view4) { unification(isView, view4) } }
        if isView != view5 { if isView.intersects(view5) { unification(isView, view5) } }
        if isView != view6 { if isView.intersects(view6) { unification(isView, view6) } }
        if isView != view7 { if isView.intersects(view7) { unification(isView, view7) } }
    }
    
    @IBAction func panAction1(_ gesture: UIPanGestureRecognizer) {
        let gestureTranslation = gesture.translation(in: view)
        guard let gestureView = gesture.view else { return }
        gestureView.center = CGPoint(
            x: gestureView.center.x + gestureTranslation.x,
            y: gestureView.center.y + gestureTranslation.y
        )
        gesture.setTranslation(.zero, in: view)
        guard gesture.state == .ended else { return }

        viewIsIntersect(view1)
        
    }
    
    @IBAction func panAction2(_ gesture: UIPanGestureRecognizer) {
        let gestureTranslation = gesture.translation(in: view)
        guard let gestureView = gesture.view else { return }
        gestureView.center = CGPoint(
            x: gestureView.center.x + gestureTranslation.x,
            y: gestureView.center.y + gestureTranslation.y
        )
        gesture.setTranslation(.zero, in: view)
        guard gesture.state == .ended else { return }
        
        viewIsIntersect(view2)

    }
    
    @IBAction func panAction3(_ gesture: UIPanGestureRecognizer) {
        let gestureTranslation = gesture.translation(in: view)
        guard let gestureView = gesture.view else { return }
        gestureView.center = CGPoint(
            x: gestureView.center.x + gestureTranslation.x,
            y: gestureView.center.y + gestureTranslation.y
        )
        gesture.setTranslation(.zero, in: view)
        guard gesture.state == .ended else { return }
  
        viewIsIntersect(view3)

    }
    
    @IBAction func panAction4(_ gesture: UIPanGestureRecognizer) {
        let gestureTranslation = gesture.translation(in: view)
        guard let gestureView = gesture.view else { return }
        gestureView.center = CGPoint(
            x: gestureView.center.x + gestureTranslation.x,
            y: gestureView.center.y + gestureTranslation.y
        )
        gesture.setTranslation(.zero, in: view)
        guard gesture.state == .ended else { return }
        
        viewIsIntersect(view4)

    }
    
    @IBAction func panAction5(_ gesture: UIPanGestureRecognizer) {
        let gestureTranslation = gesture.translation(in: view)
        guard let gestureView = gesture.view else { return }
        gestureView.center = CGPoint(
            x: gestureView.center.x + gestureTranslation.x,
            y: gestureView.center.y + gestureTranslation.y
        )
        gesture.setTranslation(.zero, in: view)
        guard gesture.state == .ended else { return }
        
        viewIsIntersect(view5)

    }
    
    @IBAction func panAction6(_ gesture: UIPanGestureRecognizer) {
        let gestureTranslation = gesture.translation(in: view)
        guard let gestureView = gesture.view else { return }
        gestureView.center = CGPoint(
            x: gestureView.center.x + gestureTranslation.x,
            y: gestureView.center.y + gestureTranslation.y
        )
        gesture.setTranslation(.zero, in: view)
        guard gesture.state == .ended else { return }
        
        viewIsIntersect(view6)
        
    }
    
    @IBAction func panAction7(_ gesture: UIPanGestureRecognizer) {
        let gestureTranslation = gesture.translation(in: view)
        guard let gestureView = gesture.view else { return }
        gestureView.center = CGPoint(
            x: gestureView.center.x + gestureTranslation.x,
            y: gestureView.center.y + gestureTranslation.y
        )
        gesture.setTranslation(.zero, in: view)
        guard gesture.state == .ended else { return }
        
        viewIsIntersect(view7)
        
    }
    
}

extension UIView {
    func intersects(_ val: UIView) -> Bool {
        let myVal = convert(val.bounds, from: val)
        return bounds.intersects(myVal)
    }
}
