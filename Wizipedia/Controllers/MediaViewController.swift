//
//  MediaViewController.swift
//  Wizipedia
//
//  Created by Tardes on 2/2/26.
//

import UIKit

class MediaViewController: UIInputViewController, UITableViewDataSource,
    UITableViewDelegate
{
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!

    var data: Media? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self

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

    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        performSegue(
            withIdentifier:
                segmentedControl.selectedSegmentIndex == 0
                ? "showMovieDetail"
                : "showBookDetail",
            sender: indexPath
        )

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = sender as? IndexPath else { return }
        guard let data else { return }

        var itemId = ""

        switch data {
        case .movies(let movies):
            itemId = movies[indexPath.row].serial

        case .books(let books):
            itemId = books[indexPath.row].serial
        }

        if segue.identifier == "showMovieDetail" {
            let movieDatailsVC =
                segue.destination as! MovieDetailsViewController

            movieDatailsVC.movieID = itemId

        } else if segue.identifier == "showBookDetail" {
        }
    }

}
