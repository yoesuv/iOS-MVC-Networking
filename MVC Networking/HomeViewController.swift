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
    
    private var listPlace: [PlaceModel] = []
    private var place: PlaceModel?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "HomeToDetail") {
            if let detailViewController = segue.destination as? DetailViewController {
                detailViewController.place = place
            }
        }
    }
    
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
        tableView.delegate = self
    }
    
    private func requestListPlace() {
        LoadingOverlay.shared.showOverlay(view: self.navigationController?.view, text: "Loading List Place")
        self.listPlace.removeAll()
        service.fetchPlaces(result: { response in
            LoadingOverlay.shared.hideOverlayView()
            if (response.error == nil) {
                self.listPlace = response.value ?? []
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } else {
                let err = response.error?.localizedDescription ?? ""
                print("HomeViewController # error \(err)")
            }
        })
    }
    
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.place = listPlace[indexPath.row]
        self.performSegue(withIdentifier: "HomeToDetail", sender: self)
    }
}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listPlace.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CellPlace", for: indexPath) as? PlaceCell else {
            return UITableViewCell()
        }
        let data = listPlace[indexPath.row]
        cell.labelName.text = data.nama
        cell.labelLocation.text = data.lokasi
        let imgUrl = URL(string: data.gambar)
        cell.imageViewPlace.kf.setImage(with: imgUrl)
        return cell
    }
}
