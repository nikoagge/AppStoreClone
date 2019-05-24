//
//  AppDetailsDescriptionCell.swift
//  RecreatingAppStore
//
//  Created by Nikolas on 22/11/2018.
//  Copyright © 2018 Nikolas. All rights reserved.
//

import Foundation
import UIKit


class AppDetailsDescriptionCell: BaseCell {
    
    
    let textView: UITextView = {
        
        let tv = UITextView()
        tv.text = "Sample description"
        
        return tv
    }()
    
    let dividerLineView: UIView = {
        
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.4, alpha: 0.4)
        
        return view
    }()
    
    
    override func setupViews() {
        
        super.setupViews()
        
        addSubview(textView)
        addSubview(dividerLineView)
        
        addConstraintsWithFormat(format: "H:|-8-[v0]-8-|", views: textView)
        addConstraintsWithFormat(format: "H:|-14-[v0]|", views: dividerLineView)
        addConstraintsWithFormat(format: "V:|-4-[v0]-4-[v1(1)]|", views: textView, dividerLineView)
    }
}
