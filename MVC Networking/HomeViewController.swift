//
//  HomeViewController.swift
//  MVC Networking
//
//  Created by Yusuf Saifudin on 25/07/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let service = NetworkService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Home"
        self.navigationItem.hidesBackButton = true
        
        self.navigationController?.navigationBar.setColors(background: UIColor(named: "BlueGrey")!, text: UIColor.white)
        
        requestListPlace()
    }
    
    private func requestListPlace() {
        service.fetchPlaces(result: { response in
            if (response.error == nil) {
                print("HomeViewController # success \(response.value?.count ?? 0)")
            } else {
                let err = response.error?.localizedDescription ?? ""
                print("HomeViewController # error \(err)")
            }
        })
    }
    
}
