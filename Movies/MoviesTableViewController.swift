//
//  MoviesTableViewController.swift
//  Movies
//
//  Created by EmreYiğit on 25.10.2023.
//

import UIKit
import AVKit
import AVFoundation


extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}

var myRow = 0

class MoviesTableViewController: UITableViewController {
    
    var myButton: ButtonClass = {
        let myButton = ButtonClass()
        return myButton
    }()
    
    var movie = [Movie]()
    let url = URL(string: "https://api.themoviedb.org/3/movie/top_rated?api_key=5f14349b0dddbc3d3659588e52d16ca3&language=en-US&page=1")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetch()
    }
    
    func fetch() {
        fetchData { (response, error) in
            if let movieList = response {
                self.movie = movieList
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    
    
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     let vc = segue.destination as! MovieDetailVC
     guard let row = tableView.indexPathForSelectedRow?.row else { return }
     let movie = movie[row]
     vc.movie = movie
     myRow = row
     }*/
    
    
    
    
    func fetchData(completion: @escaping ([Movie]?, Error?) -> Void) {
        URLSession.shared.dataTask(with: url!) { data, response, error in
            guard let data else {
                completion(nil, error)
                return
            }
            guard let response = response as? HTTPURLResponse, 200 ... 299  ~= response.statusCode else {
                completion(nil, nil)
                return
            }
            
            do {
                let movies = try JSONDecoder().decode(MovieResult.self, from: data)
                completion(movies.results, nil)
            }
            catch {
                completion(nil, error)
            }
        }.resume()
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return movie.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {      let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieTableViewCell
        let row = movie[indexPath.row]
        cell.prepare(movie: row)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //let vc = MovieDetailVC(nibName: "MovieDetailVC", bundle: nil)
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(identifier: "MovieDetailVC") as! MovieDetailVC
        let indexpath = indexPath.row
        let movie = movie[indexpath]
        vc.movie = movie
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}
