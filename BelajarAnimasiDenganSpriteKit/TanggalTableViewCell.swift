//
//  TanggalTableViewCell.swift
//  BelajarAnimasiDenganSpriteKit
//
//  Created by Muhammad Rajab Priharsanto on 02/09/19.
//  Copyright © 2019 Muhammad Rajab Priharsanto. All rights reserved.
//

import UIKit

class TanggalTableViewCell: UITableViewCell
{

    @IBOutlet weak var tanggalLabel: UILabel!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
