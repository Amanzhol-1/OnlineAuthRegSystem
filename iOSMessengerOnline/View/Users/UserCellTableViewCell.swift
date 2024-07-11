//
//  UserCellTableViewCell.swift
//  iOSMessengerOnline
//
//  Created by Amanzhol on 02.07.2024.
//

import UIKit

class UserCellTableViewCell: UITableViewCell {

    static let reuceId = "UserCellTableViewCell"
    
    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    
    override func awakeFromNib(){
        super.awakeFromNib()
        settingCell()
    }
    
    func configCell(_ name: String){
        self.userName.text = name
    }

    func settingCell(){
        parentView.layer.cornerRadius = 10
        userImage.layer.cornerRadius = userImage.frame.width/2
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
