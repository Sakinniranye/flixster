//
//  PostersViewController.swift
//  flixster
//
//  Created by Samuel Akinniranye on 2/20/23.
//

import UIKit

import Nuke

class PostersViewController: UIViewController, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { movies.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Get a collection view cell (based in the identifier you set in storyboard) and cast it to our custom AlbumCell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PosterCell", for: indexPath) as! PosterCell
        // Use the indexPath.item to index into the albums array to get the corresponding album
        let poster = movies[indexPath.item]
        // Get the artwork image url
        let imageUrl = URL(string: Movie.posterBaseURLString + poster.poster_path);
   
        // Set the image on the image view of the cell
        
        Nuke.loadImage(with: imageUrl!, into: cell.posterImageView)
        return cell
    }
    
    var movies: [Movie] = [];
  
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        
        super.viewDidLoad()
     
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
 
        layout.minimumInteritemSpacing = 4
    
        layout.minimumLineSpacing = 4
        let numberOfColumns: CGFloat = 3
        // Calculate the width each cell need to be to fit the number of columns, taking into account the spacing between cells.
        
        let width = (collectionView.bounds.width - layout.minimumInteritemSpacing * (numberOfColumns - 1)) / numberOfColumns
      
        // Set the size that each tem/cell should display at
        layout.itemSize = CGSize(width: width, height: width)
        
        collectionView.dataSource = self;
        // Create a search URL for fetching albums (`entity=album`)
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=293949a22b608d38951d1e2ab86aee5d")!
        
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            // Handle any errors
            
            if let error = error {
                print("❌ Network error: \(error.localizedDescription)")
            }
            // Make sure we have data
            guard let data = data else {
                print("❌ Data is nil")
                return
            }
            // Create a JSON Decoder
            let decoder = JSONDecoder()
            
            do {
                // Try to parse the response into our custom model
                let response = try decoder.decode(MoviesResponse.self, from: data)
                let movies = response.results
                self?.movies = movies;
                DispatchQueue.main.async {
                    self?.movies = movies
                    self?.collectionView.reloadData()
                }
            } catch {
                print(error)
            }
        }
        // Initiate the network request
        task.resume()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      
        if let cell = sender as? UICollectionViewCell,
        
            let indexPath = collectionView.indexPath(for: cell),
 
            let detailViewController = segue.destination as? DetailViewController {
          
            let movie = movies[indexPath.row]
         
            detailViewController.movie = movie
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
