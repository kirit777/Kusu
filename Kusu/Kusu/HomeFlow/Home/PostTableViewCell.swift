//
//  PostTableViewCell.swift
//  Kusu
//
//  Created by Kirit on 15/11/22.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setCellData(dict:NSMutableDictionary){
        
        if let strImage = dict["att_thumb"] as? String{
            
        }
        
    }
    
}
