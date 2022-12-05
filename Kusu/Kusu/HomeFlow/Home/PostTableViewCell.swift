//
//  PostTableViewCell.swift
//  Kusu
//
//  Created by Kirit on 15/11/22.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var imgPost: UIImageView!
    @IBOutlet weak var txtDesc: UITextView!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var imgUserImage: UIImageView!
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
            self.imgPost.setImage(strUrl: "https://drive.google.com/file/d/1VcU3FeXfGl6E_MicePaRLjgEKE6b4lSr/view", strDefault: "", cornerRadius: 0)
            
        }
        
        if let strDesc = dict["description"] as? String{
            self.txtDesc.text = strDesc
        }
        
        if let strUserName = dict["name"] as? String{
            self.lblUserName.text = strUserName
        }
        
        if let strImage = dict["photo"] as? String{
            self.imgUserImage.setImage(strUrl: strImage, strDefault: "DefaultUser", cornerRadius: 0)
        }
    }
    
}

