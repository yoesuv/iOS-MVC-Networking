//
//  ViewController.swift
//  MVC Networking
//
//  Created by Yusuf Saifudin on 25/07/23.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.performSegue(withIdentifier: "SplashToHome", sender: self)
        }
    }

}

