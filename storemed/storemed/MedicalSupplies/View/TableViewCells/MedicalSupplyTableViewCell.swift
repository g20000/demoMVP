//
//  MedicalSupplyTableViewCell.swift
//  storemed
//
//  Created by pragmus on 05/08/2019.
//  Copyright © 2019 pragmus. All rights reserved.
//

import UIKit

class MedicalSupplyTableViewCell: UITableViewCell {

    @IBOutlet weak var labelPercent: UILabel!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelSubstance: UILabel!
    @IBOutlet weak var labelProducer: UILabel!
    @IBOutlet weak var labelRealPrice: UILabel!
    @IBOutlet weak var labelDiscountPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

}
