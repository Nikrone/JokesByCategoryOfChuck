//
//  CustomCellTableViewCell.swift
//  JokesByCategoryOfChuck
//
//  Created by Evgeniy Nosko on 31.10.21.
//

import UIKit

class CustomCellTableViewCell: UITableViewCell {

    @IBOutlet weak var titleCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        Как сделать Заглавной первую букву
//        titleCell.text?.capitalized
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        contentView.layer.cornerRadius = 10
        contentView.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
