//
//  AppDetailsController.swift
//  RecreatingAppStore
//
//  Created by Nikolas on 21/11/2018.
//  Copyright © 2018 Nikolas. All rights reserved.
//

import UIKit


class AppDetailsController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    
    private let headerId = "headerId"
    private let cellId = "cellId"
    private let descriptionCellId = "descriptionCellId"

    var app: AppModel? {
        
        didSet {
            
            if app?.screenshots != nil {
                
                return
            }
            
            if let id = app?.appId {
                
                let urlString = "https://api.letsbuildthatapp.com/appstore/appdetail?id=\(id)"
                
                URLSession.shared.dataTask(with: URL(string: urlString)!, completionHandler: { (data, response, error) -> Void in
                    
                    if error != nil {
                        
                        print(error ?? "")
                        
                        return
                    }
                    
                    do {
                        
                        guard let data = data else { return }
                        
                        let appDetail = try JSONDecoder().decode(AppModel.self, from: data)
                        
                        self.app = appDetail
                        
                        DispatchQueue.main.async(execute: { () -> Void in
                         
                            self.collectionView.reloadData()
                        })
                    } catch let err {
                        
                        print(err)
                    }
                }).resume()
            }
        }
    }
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        // Register cell classes
        collectionView!.register(SreenshotsCell.self, forCellWithReuseIdentifier: cellId)

        // Do any additional setup after loading the view.
        collectionView.backgroundColor = .white
        collectionView.alwaysBounceVertical = true
        
        collectionView.register(AppDetailsHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        collectionView.register(AppDetailsDescriptionCell.self, forCellWithReuseIdentifier: descriptionCellId)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.item == 1 {
            
            let dummySize = CGSize(width: view.frame.width - 8 - 8, height: 1000)
            
            let options = NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin)
            
            let rect = descriptionAttributedText().boundingRect(with: dummySize, options: options, context: nil)
            
            return CGSize(width: view.frame.width, height: rect.height + 30)
        }
        return CGSize(width: view.frame.width, height: 170)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! AppDetailsHeader
        header.app = app
        
        return header
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize(width: view.frame.width, height: 170)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 2
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item == 1 {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: descriptionCellId, for: indexPath) as! AppDetailsDescriptionCell
            cell.textView.attributedText = descriptionAttributedText()
            
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SreenshotsCell
        cell.app = app
        
        return cell
    }
    
    
    fileprivate func descriptionAttributedText() -> NSAttributedString {
        
        let attributedText = NSMutableAttributedString(string: "Description\n", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)])
        
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 10
        
        let range = NSMakeRange(0, attributedText.string.count)
        
        attributedText.addAttribute(NSAttributedString.Key.paragraphStyle, value: style, range: range)
        
        if let desc = app?.desc {
            
            attributedText.append(NSAttributedString(string: desc, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 11), NSAttributedString.Key.foregroundColor: UIColor.darkGray]))
        }
        
        return attributedText
    }
}
