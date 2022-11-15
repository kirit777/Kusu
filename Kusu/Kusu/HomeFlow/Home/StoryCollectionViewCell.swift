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
        if let strTitle = dict["title"] as? String{
            lblName.text = strTitle
        }
        
        if let strImage = dict["image"] as? String{
            ///
        }
    }
    
}
