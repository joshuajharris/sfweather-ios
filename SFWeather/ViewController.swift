//
//  ViewController.swift
//  SFWeather
//
//  Created by Joshua Harris on 11/14/15.
//  Copyright © 2015 Joshua Harris. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    @IBOutlet weak var weatherCondition: UILabel!
    var ref = Firebase(url: "https://sfweather-ios.firebaseio.com/")

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        ref.observeEventType(.Value, withBlock: { snapshot in self.weatherCondition.text = snapshot.value as? String
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func updateWeather(sender: UIButton) {
        ref.setValue(sender.titleLabel?.text)
    }

}

