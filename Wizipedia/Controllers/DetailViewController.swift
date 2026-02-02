//
//  DetailViewController.swift
//  Wizipedia
//
//  Created by Tardes on 23/1/26.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var wizardImageView: UIImageView!
    @IBOutlet weak var hogwartsHouseLabel: UILabel!
    @IBOutlet weak var wrizardStateLabel: UILabel!
    @IBOutlet weak var actorNameLabel: UILabel!
    @IBOutlet weak var wizardGenderLabel: UILabel!
    @IBOutlet weak var charcterSpecieLabel: UILabel!
    @IBOutlet weak var wizardAncestryLabel: UILabel!
    @IBOutlet weak var wizardNameLabel: UILabel!
    @IBOutlet weak var hogwartsHouseContinerUIView: UIView!
    @IBOutlet weak var wizardStateContinerUIView: UIView!
    @IBOutlet weak var wizardPatronousLabel: UILabel!
    @IBOutlet weak var wandWoodLabel: UILabel!
    @IBOutlet weak var wandLenghtLabel: UILabel!
    @IBOutlet weak var wandCoreLabel: UILabel!
    @IBOutlet weak var wizardEyeColorLabel: UILabel!
    @IBOutlet weak var wizardBornDateLabel: UILabel!
    @IBOutlet weak var wizardhairColorLabel: UILabel!

    var characterName: String!

    override func viewDidLoad() {
        super.viewDidLoad()

        Task {
            let character = await Api.getDetails(for: characterName)

            guard let character = character else { return }

            DispatchQueue.main.async {
                self.wizardImageView.loadFromInternet(url: character.image)

                if character.image.isEmpty {
                    self.wizardNameLabel.textColor = .systemGray
                }

                self.wizardNameLabel.text = character.name
                self.hogwartsHouseContinerUIView.roundCorners(radious: 20)

                let house = HouseEnum.fromString(character.house.rawValue)

                self.hogwartsHouseContinerUIView.backgroundColor =
                    house.backgroundColor
                self.hogwartsHouseLabel.text = house.displayName.uppercased()
                self.hogwartsHouseLabel.textColor = house.foregroundColor
                self.wizardStateContinerUIView.roundCorners(radious: 20)
                self.wizardStateContinerUIView.backgroundColor =
                    character.alive ? UIColor.systemGreen : UIColor.systemRed
                self.wrizardStateLabel.text =
                    character.alive ? "Alive" : "Dead"
                self.actorNameLabel.text = character.actor
                self.wizardGenderLabel.text = character.gender.rawValue.capitalizingFirstLetter()
                self.charcterSpecieLabel.text = character.species.rawValue.capitalizingFirstLetter()
                self.wizardAncestryLabel.text = character.ancestry.rawValue.capitalizingFirstLetter()
                self.wizardPatronousLabel.text = character.patronus.rawValue.capitalizingFirstLetter()
                self.wandWoodLabel.text = character.wand.wood.rawValue.capitalizingFirstLetter()
                self.wandLenghtLabel.text = "\(character.wand.length ?? 0) in"
                self.wandCoreLabel.text = character.wand.core.rawValue.capitalizingFirstLetter()
                self.wizardEyeColorLabel.text = character.eyeColour.rawValue.capitalizingFirstLetter()
                self.wizardhairColorLabel.text = character.hairColour.rawValue.capitalizingFirstLetter()
                self.wizardBornDateLabel.text = character.dateOfBirth?.capitalizingFirstLetter() ?? "Unknown"
            }
        }

        /*
         // MARK: - Navigation
        
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
         */

    }
}
