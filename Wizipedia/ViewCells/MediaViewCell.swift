//
//  MediaViewCell.swift
//  Wizipedia
//
//  Created by Tardes on 2/2/26.
//

import UIKit

class MediaViewCell: UITableViewCell {
    @IBOutlet weak var mediaImageView: UIImageView!
    @IBOutlet weak var mediaTitleLabel: UILabel!
    @IBOutlet weak var mediaDescriptionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(with data: Media, indexPath: IndexPath) {
        switch data {
        case .movies(let movies):
            let movie = movies[indexPath.row]

            setUpUI(
                imageUrl: movie.poster,
                title: movie.title,
                description: movie.runningTime
            )

        case .books(let books):
            let book = books[indexPath.row]

            setUpUI(
                imageUrl: book.cover,
                title: book.title,
                description: book.summary
            )
        }
    }

    private func setUpUI(imageUrl: String, title: String, description: String) {
        mediaImageView.loadFromInternet(url: imageUrl)
        mediaTitleLabel.text = title
        mediaDescriptionLabel.text = description
    }
}
