//
//  AppModel.swift
//  RecreatingAppStore
//
//  Created by Nikolas on 19/11/2018.
//  Copyright © 2018 Nikolas. All rights reserved.
//

import Foundation
import UIKit


struct AppModel: Decodable {
    
    var appId: Int?
    var name: String?
    var category: String?
    var imageName: String?
    var price: Float?
    var screenshots: [String]?
    var desc: String?
    
    private enum CodingKeys: String, CodingKey {
        
        case appId = "Id"
        case name = "Name"
        case category = "Category"
        case imageName = "ImageName"
        case price = "Price"
        case screenshots = "Screenshots"
        case desc = "Description"
    }
}
