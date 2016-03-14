//
//  PictureTableViewCell.swift
//  Moments
//
//  Created by Varun Goel on 3/11/16.
//  Copyright © 2016 Varun Goel. All rights reserved.
//

import UIKit
import ParseUI
import AFNetworking

class PictureTableViewCell: UITableViewCell {
    
    @IBOutlet var pictureView: PFImageView!
    @IBOutlet var caption: UILabel!
    
    var momentsPost: PFObject! {
        didSet {
            self.pictureView.file = momentsPost["media"] as? PFFile
            self.caption.text = momentsPost["caption"] as? String
            self.pictureView.loadInBackground()
        }
    }
   

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
