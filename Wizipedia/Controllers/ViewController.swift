//
//  ViewController.swift
//  Wizipedia
//
//  Created by Tardes on 23/1/26.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource,
    UISearchBarDelegate
{
    @IBOutlet weak var tableView: UITableView!

    var characters: Characters = []
    var allCharacters: Characters = []

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self

        let searchController = UISearchController(searchResultsController: nil)

        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController

        Task {
            allCharacters = await Api.getCharacters()
            characters = allCharacters

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

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            characters = allCharacters
        } else {
            characters = allCharacters.filter {
                character in
                character.name.localizedCaseInsensitiveContains(searchText)
                    || character.house.rawValue
                        .localizedCaseInsensitiveContains(
                            searchText
                        )

            }
        }

        tableView.reloadData()
    }

}
