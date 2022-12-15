//
//  DataCell2.swift
//  3.8.Lesson2
//
//  Created by anjella on 12/12/22.
//

import Foundation
import UIKit


class DataCell2: UITableViewCell{
    
    
    @IBOutlet weak var imageIconView: UIImageView!
    
    @IBOutlet weak var wordLabel: UILabel!
    
    var isCheckMarck: Bool = false
    
    override func layoutSubviews() {
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(checkMarkTap))
        
        imageIconView.addGestureRecognizer(tap)
        imageIconView.isUserInteractionEnabled = true
        
    }
    
    @objc func checkMarkTap(){
        
        
//        imageIconView.image = UIImage(systemName: "checkmark.circle.fill")
        if isCheckMarck == false {
            imageIconView.image = UIImage(systemName: "checkmark.circle.fill")
            isCheckMarck = true
            
        }else{
            imageIconView.image = UIImage(systemName: "circle")
            isCheckMarck = false
            
        }
//        print("fghjkk")
        
    }
    
    
    
    
}

