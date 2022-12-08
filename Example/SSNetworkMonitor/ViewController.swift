//
//  ViewController.swift
//  SSNetworkMonitor
//
//  Created by naveenkumar-ss on 12/07/2022.
//  Copyright (c) 2022 naveenkumar-ss. All rights reserved.
//

import UIKit
import Pods_SSNetworkMonitor_Example

class ViewController: UIViewController , ObservableObject {
    
    @Published var network = SSNetworkMonitor.shared
    override func viewDidLoad() {
        super.viewDidLoad()
        print(network.checkNetworkAvailability())
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

