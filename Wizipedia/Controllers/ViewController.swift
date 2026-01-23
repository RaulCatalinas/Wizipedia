//
//  ViewController.swift
//  Wizipedia
//
//  Created by Tardes on 23/1/26.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!

    var characters: Characters = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self

        Task {
            characters = await Api.getCharacters()

            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)
        -> Int
    {
        return characters.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell
    {
        let cell =
            tableView.dequeueReusableCell(
                withIdentifier: "WizardCell",
                for: indexPath
            ) as! WizardCell

        cell.configure(with: characters[indexPath.row])

        return cell
    }

}
