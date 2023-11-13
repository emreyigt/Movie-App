//
//  MovieTableViewCell.swift
//  Movies
//
//  Created by EmreYiğit on 25.10.2023.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var lblSummary: UILabel!
    @IBOutlet weak var lblRatings: UILabel!
    @IBOutlet weak var lblCategories: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var img: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func prepare(movie: Movie) {
        print(movie)
        lblTitle.text = movie.title
        lblSummary.text = movie.overview
        lblRatings.text = "⭐️ \(movie.vote_average)/10"
        lblCategories.text = movie.release_date
        let imgUrl = "https://image.tmdb.org/t/p/w92" + movie.poster_path
        img.downloaded(from: imgUrl)
        
        
    }
        


}
