//
//  LargeCategoryCell.swift
//  RecreatingAppStore
//
//  Created by Nikolas on 21/11/2018.
//  Copyright © 2018 Nikolas. All rights reserved.
//

import Foundation
import UIKit


class LargeCategoryCell: CategoryCell {

    
    private let largeAppCellId = "largeAppCellId"
    
    
    override func setupViews() {
        
        super.setupViews()
        
        appsCollectionView.register(LargeAppCell.self, forCellWithReuseIdentifier: "largeAppCellId")
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: largeAppCellId, for: indexPath) as! AppCell
        cell.app = appCategory?.apps?[indexPath.item]
        
        return cell
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 200, height: frame.height - 32)
    }
    
    
    private class LargeAppCell: AppCell {
        
        override func setupViews() {
            
            addSubview(imageView)
            
            addConstraintsWithFormat(format: "H:|[v0]|", views: imageView)
            addConstraintsWithFormat(format: "V:|-2-[v0]-14-|", views: imageView)
        }
    }
}
