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
            
            mediaImageView.loadFromInternet(url: movie.poster)
            mediaTitleLabel.text = movie.title
            mediaDescriptionLabel.text = movie.runningTime

        case .books(let books):
            let book = books[indexPath.row]
           
            mediaImageView.loadFromInternet(url: book.cover)
            mediaTitleLabel.text = book.title
            mediaDescriptionLabel.text = book.summary
        }
    }
}
