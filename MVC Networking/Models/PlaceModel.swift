//
//  PlaceModel.swift
//  MVC Networking
//
//  Created by Yusuf Saifudin on 25/07/23.
//
import Foundation

struct PlaceModel: Codable, Identifiable {
    var id: String {
        return nama
    }
    let nama: String
    let lokasi: String
    let deskripsi: String
    let thumbnail: String
    let gambar: String
}
