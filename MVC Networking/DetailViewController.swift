//
//  DetailViewController.swift
//  MVC Networking
//
//  Created by Yusuf Saifudin on 26/07/23.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController {
    
    var place: PlaceModel?
    
    @IBOutlet weak var imageViewDetail: UIImageView!
    @IBOutlet weak var labelDetailName: UILabel!
    @IBOutlet weak var labelDetailDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Detail"
        let button = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = button
        self.navigationController?.navigationBar.setColors(background: UIColor(named: "BlueGrey")!, text: UIColor.white)
        
        labelDetailName.text = place?.nama
        labelDetailDescription.text = place?.deskripsi
        let imageUrl = URL(string: place?.gambar ?? "")
        imageViewDetail.kf.setImage(with: imageUrl)
    }
    
}
