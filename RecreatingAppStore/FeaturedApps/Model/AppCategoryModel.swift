//
//  AppCategoryModel.swift
//  RecreatingAppStore
//
//  Created by Nikolas on 19/11/2018.
//  Copyright © 2018 Nikolas. All rights reserved.
//

import Foundation
import UIKit


struct AppCategoryModel: Decodable {
    
    
    var name: String?
    var apps: [AppModel]?
    var type: String?
    
    
    /*mutating func setValue(_ value: Any?, forKey key: String) {
        
        if key == "apps" {
            
            apps = [AppModel]()
            for dict in value as! [[String: AnyObject]] {
                
                let app = AppModel()
                app.setValuesForKeys(dict)
                apps?.append(app)
            }
        } else {
            
            super.setValue(value, forKey: key)
        }
    }*/
    
    
    static func fetchFeaturedApps(_ completionHandler: @escaping (FeaturedAppsModel) -> ()) {
        
        guard let url = URL(string: "https://api.letsbuildthatapp.com/appstore/featured") else { return }
        URLSession.shared.dataTask(with: url, completionHandler: { ( data, response, error) -> Void in
            
            if error != nil {
                
                print(error!)
                
                return
            }
            
            do {
                
                guard let data = data else { return }
                
                let featuredApps = try JSONDecoder().decode(FeaturedAppsModel.self, from: data)
                
                DispatchQueue.main.async(execute: { () -> Void in
                    
                    completionHandler(featuredApps)
                })
            } catch let err {
                
                print(err)
            }
        }).resume()
    }
    
    
    static func sampleAppsCategories() -> [AppCategoryModel] {
        
        var bestNewAppsCategory = AppCategoryModel()
        bestNewAppsCategory.name = "Best New Apps"
        
        var bestNewApps = [AppModel]()
        
        //Logic
        var frozenApp = AppModel()
        frozenApp.name = "Disney built it: Frozen"
        frozenApp.imageName = "frozen"
        frozenApp.category = "Entertainment"
        frozenApp.price = NSNumber(value: 0.99) as? Float
        
        bestNewApps.append(frozenApp)
        bestNewAppsCategory.apps = bestNewApps
        
        var bestNewGamesCategory = AppCategoryModel()
        bestNewGamesCategory.name = "Best New Games"
        
        var bestNewGames = [AppModel]()
        
        var telepaintApp = AppModel()
        telepaintApp.name = "Telepaint"
        telepaintApp.category = "Games"
        telepaintApp.imageName = "telepaint1"
        telepaintApp.price = NSNumber(value: 2.99) as? Float
        
        bestNewGames.append(telepaintApp)
        bestNewGamesCategory.apps = bestNewGames
        
        return [bestNewAppsCategory, bestNewGamesCategory]
    }
}
