//
//  DetailViewController.swift
//  MVC Networking
//
//  Created by Yusuf Saifudin on 26/07/23.
//

import UIKit

class DetailViewController: UIViewController {
    
    var place: PlaceModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Detail"
        let button = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = button
        self.navigationController?.navigationBar.setColors(background: UIColor(named: "BlueGrey")!, text: UIColor.white)
        
        print("DetailViewController # \(place)")
    }
    
}
