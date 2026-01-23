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

    var character: Character!

    override func viewDidLoad() {
        super.viewDidLoad()

        wizardImageView.loadFromInternet(url: character.image)
        wizardBasicInfoLabel.text = """
                Name: \(character.name)
                Hair colour: \(character.hairColour)
                \(character.house.rawValue.isEmpty ? "" : "House: \(character.house.rawValue)")
                \(character.patronus.rawValue.isEmpty ? "" : "Patronus: \(character.patronus.rawValue)")
            """

        wizardSpellInfoLabel.text = """
                Wood: \(character.wand.wood)
                \(character.wand.core.rawValue.isEmpty ? "" : "Core: \(character.wand.core.rawValue)")
                Length: \(character.wand.length?.description ?? "---") in
            """
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
