//
//  BookDetailsViewController.swift
//  Wizipedia
//
//  Created by Tardes on 3/2/26.
//

import ExpandableLabel
import UIKit

class BookDetailsViewController: UIViewController {

    @IBOutlet weak var bookName: UILabel!
    @IBOutlet weak var bookSummary: ExpandableLabel!
    @IBOutlet weak var bookReleaseDate: UILabel!
    @IBOutlet weak var bookPoster: UIImageView!
    @IBOutlet weak var bookAuthor: UILabel!

    var bookID: String!
    private var book: Book!

    override func viewDidLoad() {
        super.viewDidLoad()

        bookSummary.contigureViewMoreViewLess()

        Task {
            book = await Api.getBook(withId: bookID)

            DispatchQueue.main.async {
                self.bookPoster.loadFromInternet(url: self.book.cover)
                self.bookName.text = self.book.title
                self.bookSummary.text = self.book.summary
                self.bookAuthor.text = self.book.author
                    .capitalizingFirstLetter()
                self.bookReleaseDate.text = "Release Date: \(self.book?.releaseDate ?? "Unknown")"
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
