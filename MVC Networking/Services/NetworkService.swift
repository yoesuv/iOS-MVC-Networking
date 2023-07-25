//
//  NetworkService.swift
//  MVC Networking
//
//  Created by Yusuf Saifudin on 25/07/23.
//

import Foundation
import Alamofire

class NetworkService {
    
    func fetchPlaces(result: @escaping (DataResponse<[PlaceModel], AFError>) -> Void) {
        let url = "https://info-malang-batu.firebaseapp.com/List_place_malang_batu.json"
        AF.request(url, method: .get).responseDecodable(of: [PlaceModel].self) { response in
            result(response)
        }
    }
    
}
