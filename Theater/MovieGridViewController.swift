//
//  MovieGridViewController.swift
//  Theater
//
//  Created by Macbook Pro on 2/28/22.
//

import UIKit
import AlamofireImage

class MovieGridViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource
{
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    //Declaration of an array with dictionaries inside specified with a Key:Value format
    var movies = [[String:Any]]() //needed to store the api info

    override func viewDidLoad()
    {
        super.viewDidLoad()

        
        //required for the class UItableviewdatasource and UITableview delegate
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        layout.minimumLineSpacing = 4
        
        layout.minimumInteritemSpacing = 4
        
        //divided by the number of posters you want to show, we ant to show 3 in this case
        let width = (view.frame.size.width - layout.minimumInteritemSpacing * 2) / 3
        layout.itemSize = CGSize(width: width, height: width * 3 / 2)
        
        //Used to retreive an API that will get a list of movies similar to the movie of wonderwoman (meaning superhero movies)
        let url = URL(string: "https://api.themoviedb.org/3/movie/634649/similar?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request)
        { (data, response, error) in
             // This will run when the network request returns
             if let error = error
            {
                 print(error.localizedDescription)
            }
            else if let data = data
            {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                
                //Downloads movies and stores them in the array of dictionaries
                self.movies = dataDictionary["results"] as! [[String:Any]]
                
                self.collectionView.reloadData()
                
                print(self.movies)

            }

        }
        task.resume()

    } //end of overide func viewdidload
    
    func collectionView(_ collectionView:UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieGridCell", for: indexPath) as! MovieGridCell
        
        let movie = movies[indexPath.item]
        
        let baseUrl = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        
        let posterUrl = URL(string: baseUrl + posterPath)
        
        cell.posterView.af.setImage(withURL: posterUrl!)
        
        return cell
        
    }
    
    
}

