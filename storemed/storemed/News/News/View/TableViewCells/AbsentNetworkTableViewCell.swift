//
//  AbsentNetworkTableViewCell.swift
//  storemed
//
//  Created by pragmus on 16.07.2020.
//  Copyright © 2020 pragmus. All rights reserved.
//

import UIKit

protocol AbsentNetworkTableViewCellDelegate: AnyObject {
    func retryAction()
}

class AbsentNetworkTableViewCell: UITableViewCell {

    weak var delegate: AbsentNetworkTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    
    //MARK: - Actions
    
    @IBAction func onRetryButtonTouched(_ sender: Any) {
        self.delegate?.retryAction()
    }

}
