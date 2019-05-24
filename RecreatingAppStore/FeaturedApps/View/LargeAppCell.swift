//
//  LargeAppCell.swift
//  RecreatingAppStore
//
//  Created by Nikolas on 21/11/2018.
//  Copyright © 2018 Nikolas. All rights reserved.
//

import Foundation


class LargeAppCell: AppCell {
    
    
    override func setupViews() {
        
        addSubview(imageView)
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: imageView)
        addConstraintsWithFormat(format: "V:|-2-[v0]-14-|", views: imageView)
    }
}
