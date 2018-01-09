//
//  NotificationsCell.swift
//  GithubAPI_Example
//
//  Created by Serhii Londar on 1/9/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit

class NotificationsCell: UITableViewCell {
    @IBOutlet weak var notificationEventIcon: UIImageView! = nil
    @IBOutlet weak var notificationNameLabel: UILabel! = nil
    @IBOutlet weak var notificationTimeLabel: UILabel! = nil
    @IBOutlet weak var notificationMuteButton: UIButton! = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
