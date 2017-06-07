//
//  ViewController.swift
//  ClickCounter
//
//  Created by Yu-Jen Chang on 6/6/17.
//  Copyright © 2017 Yu-Jen Chang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var count = 0
    var label1: UILabel!
    var label2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // label
        let label1 = addLabel("0", initFrame: CGRect.init(x: 100, y: 150, width: 60, height: 60))
        let label2 = addLabel("0", initFrame: CGRect.init(x: 300, y: 150, width: 60, height: 60))
        self.label1 = label1
        self.label2 = label2
        
        // button
        var incrementButton = UIButton()
        var decrementButton = UIButton()
        var toggleButton = UIButton()
        incrementButton = addButton("Plus", initTitleColor: UIColor.blue, titleState: .normal, initFrame: CGRect.init(x: 75, y: 250, width: 60, height: 60))
        decrementButton = addButton("Minus", initTitleColor: UIColor.blue, titleState: .normal, initFrame: CGRect.init(x: 275, y: 250, width: 60, height: 60))
        toggleButton = addButton("Toggle", initTitleColor: UIColor.red, titleState: .normal, initFrame: CGRect.init(x: 175, y: 250, width: 60, height: 60))
    
        incrementButton.addTarget(self, action: #selector(ViewController.incrementCount), for: UIControlEvents.touchUpInside)
        decrementButton.addTarget(self, action: #selector(ViewController.decrementCount), for: UIControlEvents.touchUpInside)
        toggleButton.addTarget(self, action: #selector(ViewController.toggleBackgroundColor), for: UIControlEvents.touchUpInside)
    }
    
    func addLabel(_ initText: String, initFrame: CGRect) -> UILabel {
        let label = UILabel()
        label.frame = initFrame
        label.text = initText
        self.view.addSubview(label)
        return label
    }
    
    func addButton(_ initTitle: String, initTitleColor: UIColor, titleState: UIControlState, initFrame: CGRect) -> UIButton {
        let button = UIButton()
        button.frame = initFrame
        button.setTitle(initTitle, for: titleState)
        button.setTitleColor(initTitleColor, for: titleState)
        self.view.addSubview(button)
        return button
    }
    
    func incrementCount() {
        self.count = self.count + 1
        self.label1.text = "\(self.count)"
        self.label2.text = "\(self.count)"
    }
    
    func decrementCount() {
        self.count = self.count - 1
        self.label1.text = "\(self.count)"
        self.label2.text = "\(self.count)"
    }
    
    func toggleBackgroundColor() {
        self.view.backgroundColor = randomColor()
    }
    
    func randomColor() -> UIColor {
        // drand48() generate random numbers from 0.0 to 1.0
        let red = CGFloat(drand48())
        let green = CGFloat(drand48())
        let blue = CGFloat(drand48())
        let alpha = CGFloat(1.0)
        return UIColor.init(red: red, green: green, blue: blue, alpha: alpha)
    }

}

