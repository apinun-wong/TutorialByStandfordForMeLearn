//
//  FirstViewController.swift
//  WindowSample
//
//  Created by Apinun Wongintawang on 3/25/19.
//  Copyright © 2019 Apinun Wongintawang. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func onNextVC(_ sender: Any) {
        let mainView = MainViewController.init(nibName: "MainViewController", bundle: nil)
        let navVC = UINavigationController(rootViewController: mainView)
        self.dismiss(animated: false, completion: nil)
        self.present(navVC, animated: true, completion: nil)
    }
}
