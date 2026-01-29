//
//  DetailViewController.swift
//  Wizipedia
//
//  Created by Tardes on 23/1/26.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var wizardImageView: UIImageView!
    @IBOutlet weak var wizardBasicInfoLabel: UILabel!
    @IBOutlet weak var wizardSpellInfoLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    var characterName: String!

    override func viewDidLoad() {
        super.viewDidLoad()

        Task {
            defer {
                activityIndicator.stopAnimating()
                activityIndicator.isHidden = true
            }

            activityIndicator.startAnimating()
            activityIndicator.isHidden = false

            let character = await Api.getDetails(for: characterName)

            guard let character = character else { return }

            DispatchQueue.main.async {
                self.wizardImageView.loadFromInternet(url: character.image)
                self.wizardBasicInfoLabel.text = """
                        Name: \(character.name)
                        Hair colour: \(character.hairColour)
                        \(character.house.rawValue.isEmpty ? "" : "House: \(character.house.rawValue)")
                        \(character.patronus.rawValue.isEmpty ? "" : "Patronus: \(character.patronus.rawValue)")
                    """

                self.wizardSpellInfoLabel.text = """
                        Wood: \(character.wand.wood)
                        \(character.wand.core.rawValue.isEmpty ? "" : "Core: \(character.wand.core.rawValue)")
                        Length: \(character.wand.length?.description ?? "---") in
                    """
            }
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
