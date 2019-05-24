//
//  ViewController.swift
//  RecreatingAppStore
//
//  Created by Nikolas on 17/11/2018.
//  Copyright © 2018 Nikolas. All rights reserved.
//

import UIKit


class FeaturedAppsController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    
    private let cellId = "cellId"
    private let headerId = "headerId"
    private let largeCellId = "largeCellId"
    
    var featuredApps: FeaturedAppsModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AppCategoryModel.fetchFeaturedApps { (featuredApps) -> () in
            self.featuredApps = featuredApps
            self.collectionView?.reloadData()
        }
        
        collectionView?.backgroundColor = UIColor.white
        
        collectionView?.register(CategoryCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.register(LargeCategoryCell.self, forCellWithReuseIdentifier: largeCellId)
        collectionView.register(Header.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return .init(width: view.frame.width, height: 100)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! Header
        header.appCategory = featuredApps?.bannerCategory
        
        return header
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: largeCellId, for: indexPath) as! LargeCategoryCell
            cell.appCategory = featuredApps?.appCategories?[indexPath.item]
            cell.featuredAppsController = self
            
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CategoryCell
        cell.appCategory = featuredApps?.appCategories?[indexPath.item]
        cell.featuredAppsController = self
        
        return cell
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if let count = featuredApps?.appCategories?.count {
            
            return count
        }
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.item == 2 {
            
            return CGSize(width: view.frame.width, height: 160)
        }
        
        return CGSize(width: view.frame.width, height: 230)
    }

    
    func showAppDetailForApp(app: AppModel) {
        
        let layout = UICollectionViewFlowLayout()
        
        let appDetailController = AppDetailsController(collectionViewLayout: layout)
        appDetailController.app = app
        
        navigationController?.pushViewController(appDetailController, animated: true)
    }
}
