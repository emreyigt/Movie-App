//
//  MovieDetailVC.swift
//  Movies
//
//  Created by EmreYiğit on 27.10.2023.
//

import UIKit
import AVKit
import AVFoundation




class MovieDetailVC: UIViewController, AVPlayerViewControllerDelegate {
    var playerController = AVPlayerViewController()
    
    var myButton: ButtonClass = {
        let myButton = ButtonClass()
        return myButton
    }()
    
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblCategories: UILabel!
    @IBOutlet weak var lblSummary: UITextView!
    @IBOutlet weak var lblRatings: UILabel!
    @IBOutlet weak var lblDuration: UILabel!
    @IBOutlet weak var imgPoster: UIImageView!
    
    @IBOutlet weak var t_Button: UIButton!
    
    
    @IBAction func trailerButton(_ sender: Any) {
            guard let videoUrl = URL(string: "http://jplayer.org/video/m4v/Big_Buck_Bunny_Trailer.m4v") else {return}
            let player = AVPlayer(url: videoUrl)
            playerController = AVPlayerViewController()
            playerController.player = player
            playerController.allowsPictureInPicturePlayback = true
            playerController.delegate = self
            playerController.player?.play()
            self.present(playerController, animated: true, completion: nil)
    }
    
    
    
    
    var movie: Movie!
    
    func buttonHidden() {
        if(myRow%2 == 1){
            t_Button.isHidden = true
        }
    }
    
    /*override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //buttonHidden()
        lblTitle.text = movie.title
        lblRatings.text = "⭐️ \(movie.vote_average)/10"
        lblSummary.text = movie.overview
        lblCategories.text = movie.release_date
        lblDuration.text = "Votes: \(movie.vote_count)"
        
        let imgUrl = "https://image.tmdb.org/t/p/w300" + movie.backdrop_path
        
        imgPoster.downloaded(from: imgUrl)
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
