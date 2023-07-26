//
//  HomeViewController.swift
//  MVC Networking
//
//  Created by Yusuf Saifudin on 25/07/23.
//

import UIKit
import Kingfisher

class HomeViewController: UIViewController {
    
    private let service = NetworkService()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Home"
        self.navigationItem.hidesBackButton = true
        
        self.navigationController?.navigationBar.setColors(background: UIColor(named: "BlueGrey")!, text: UIColor.white)
        
        setupTableView()
        requestListPlace()
    }
    
    private func setupTableView() {
        tableView.register(UINib(nibName: "PlaceCell", bundle: nil), forCellReuseIdentifier: "CellPlace")
        tableView.separatorInset = .zero
        tableView.layoutMargins = .zero
        tableView.directionalLayoutMargins = .zero
        
        tableView.dataSource = self
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

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CellPlace", for: indexPath) as? PlaceCell else {
            return UITableViewCell()
        }
        cell.labelName.text = "Index \(indexPath.row)"
        cell.labelLocation.text = "Kota Malang"
        let imgUrl = URL(string: "https://lh3.googleusercontent.com/-7To0y-nnYak/VqQYjBWAwoI/AAAAAAAACf8/r_sAJ-dgsL8/s250-Ic42/thumbnail_alun_alun_malang.jpg")
        cell.imageViewPlace.kf.setImage(with: imgUrl)
        return cell
    }
}
