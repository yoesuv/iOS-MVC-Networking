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
        Task { @MainActor in
            try? await Task.sleep(for: .seconds(2))
            self.performSegue(withIdentifier: "SplashToHome", sender: self)
        }
    }

}
