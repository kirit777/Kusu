//
//  StoryCollectionViewCell.swift
//  Kusu
//
//  Created by Kirit on 15/11/22.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imgStory: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setCellData(dict:NSMutableDictionary){
        if let strImage = dict["att_thumb"] as? String{
            self.imgStory.setImage(strUrl: strImage, strDefault: "DefaultUser", cornerRadius: 0)
        }
        
        
        if let strUserName = dict["name"] as? String{
            self.lblName.text = strUserName
        }
    }
    
}
