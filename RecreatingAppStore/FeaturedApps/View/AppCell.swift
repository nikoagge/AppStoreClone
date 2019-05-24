//
//  AppCell.swift
//  RecreatingAppStore
//
//  Created by Nikolas on 17/11/2018.
//  Copyright © 2018 Nikolas. All rights reserved.
//

import UIKit


class AppCell: UICollectionViewCell {

    
    var app: AppModel? {
        
        didSet {
            
            if let name = app?.name {
                
                nameLabel.text = name
                
                let dummySize = CGSize(width: frame.width, height: 1000)
                let rect = NSString(string: name).boundingRect(with: dummySize, options: NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin), attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)], context: nil)
                
                if rect.height > 20 {
                    
                    categoryLabel.frame = CGRect(x: 0, y: frame.width + 38, width: frame.width, height: 20)
                    priceLabel.frame = CGRect(x: 0, y: frame.width + 56, width: frame.width, height: 20)
                } else {
                    
                    categoryLabel.frame = CGRect(x: 0, y: frame.width + 22, width: frame.width, height: 20)
                    priceLabel.frame = CGRect(x: 0, y: frame.width + 40, width: frame.width, height: 20)
                }
                
                nameLabel.frame = CGRect(x: 0, y: frame.width + 5, width: frame.width, height: 40)
                nameLabel.sizeToFit()
            }
            
            categoryLabel.text = app?.category
            
            if let price = app?.price {
                
                priceLabel.text = "$\(price)"
            } else {
                
                priceLabel.text = ""
            }
            
            if let imageName = app?.imageName {
                
                imageView.image = UIImage(named: imageName)
            }
        }
    }
    
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        setupViews()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    
    let imageView: UIImageView = {
        
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 16
        iv.layer.masksToBounds = true
        
        return iv
    }()
    
    
    let nameLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Disney Build It: Frozen"
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 2
        
        return label
    }()
    
    
    let categoryLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Entertainment"
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor.darkGray
        
        return label
    }()
    
    
    let priceLabel: UILabel = {
        
        let label = UILabel()
        label.text = "$3.99"
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor.darkGray
        
        return label
    }()
    
    
    func setupViews() {
        
        addSubview(imageView)
        addSubview(nameLabel)
        addSubview(categoryLabel)
        addSubview(priceLabel)
        
        imageView.frame = CGRect(x:0, y: 0, width: frame.width, height: frame.width)
        nameLabel.frame = CGRect(x: 0, y: frame.width + 2, width: frame.width, height: 40)
        categoryLabel.frame = CGRect(x: 0, y: frame.width + 38, width: frame.width, height: 20)
        priceLabel.frame = CGRect(x: 0, y: frame.width + 56, width: frame.width, height: 20)
    }
}
