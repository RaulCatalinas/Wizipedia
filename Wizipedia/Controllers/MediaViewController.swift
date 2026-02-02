//
//  MediaViewController.swift
//  Wizipedia
//
//  Created by Tardes on 2/2/26.
//

import UIKit

class MediaViewController: UIInputViewController, UITableViewDataSource {
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!

    var data: Media? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self

        Task {
            if segmentedControl.selectedSegmentIndex == 0 {
                data = .movies(await Api.getAllMovies())
            } else {
                data = .books(await Api.getAllBooks())
            }

            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    @IBAction func toggleView(_ sender: UISegmentedControl) {
        Task {
            if sender.selectedSegmentIndex == 0 {
                data = .movies(await Api.getAllMovies())
            } else {
                data = .books(await Api.getAllBooks())
            }

            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.tableView.scrollToTop()
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)
        -> Int
    {
        guard let data else { return 0 }

        switch data {
        case .movies(let movies):
            return movies.count

        case .books(let books):
            return books.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell
    {
        let cell =
            tableView.dequeueReusableCell(withIdentifier: "MediaViewCell")
            as! MediaViewCell

        guard let data else {
            cell.textLabel?.text = ""
            cell.detailTextLabel?.text = nil

            return cell
        }

        cell.configure(with: data, indexPath: indexPath)

        return cell
    }

}
