//
//  WizardCell.swift
//  Wizipedia
//
//  Created by Tardes on 23/1/26.
//

import UIKit

class WizardCell: UITableViewCell {
    @IBOutlet weak var wizardImageView: UIImageView!
    @IBOutlet weak var wizardNameLabel: UILabel!
    @IBOutlet weak var wizardActorLabel: UILabel!
    @IBOutlet weak var wizardHouseLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(with wizard: Character) {
        wizardImageView.addBorderColor(
            wizard.alive ? UIColor.green : UIColor.red,
        )

        wizardImageView.loadFromInternet(url: wizard.image)
        wizardNameLabel.text = wizard.name
        wizardActorLabel.text = wizard.actor

        let house = HouseEnum.fromString(wizard.house.rawValue)

        wizardHouseLabel.text = house.displayName
        wizardHouseLabel.backgroundColor = house.backgroundColor
        wizardHouseLabel.textColor = house.foregroundColor
    }

}
