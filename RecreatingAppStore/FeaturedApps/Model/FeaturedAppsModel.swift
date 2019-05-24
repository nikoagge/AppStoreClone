//
//  FeaturedAppsModel.swift
//  RecreatingAppStore
//
//  Created by Nikolas on 21/11/2018.
//  Copyright © 2018 Nikolas. All rights reserved.
//

import Foundation

struct FeaturedAppsModel: Decodable {
    
    var appCategories: [AppCategoryModel]?
    let bannerCategory: AppCategoryModel
    
    private enum CodingKeys: String, CodingKey {
        
        case appCategories = "categories"
        case bannerCategory
    }
}
