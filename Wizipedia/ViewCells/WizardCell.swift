//
//  WizardCell.swift
//  Wizipedia
//
//  Created by Tardes on 23/1/26.
//

import UIKit

class WizardCell: UITableViewCell {
    @IBOutlet weak var wizardImageView: UIImageView!
    @IBOutlet weak var wizardBasicInfoLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(with wizard: Character) {
        wizardImageView.loadFromInternet(url: wizard.image)
        wizardBasicInfoLabel.text =
            "\(wizard.name)\(wizard.house.rawValue.isEmpty ? "" : " - \(wizard.house.rawValue)")"
    }
}
