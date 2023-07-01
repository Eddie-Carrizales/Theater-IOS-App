//
//  ViewController.swift
//  Theater
//
//  Created by Eddie Carrizales on 2/24/22.
//

import UIKit
import AlamofireImage //required to retreive images

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    //Outlet declarations
    @IBOutlet weak var tableView: UITableView!
    
    //Declaration of an array with dictionaries inside specified with a Key:Value format
    var movies = [[String:Any]]()

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //required for the class UItableviewdatasource and UITableview delegate
        tableView.dataSource = self
        tableView.delegate = self
        
        //Used to retreive API that get the list of now playing movies and their information
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
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
                
                //After getting all the movies using "self.movies" above, we use "self.tableView.reloadData()" to reload our tableview with all of the data we just got
                self.tableView.reloadData()
                
                print(dataDictionary)

                    // TODO: Get the array of movies
                    // TODO: Store the movies in a property to use elsewhere
                    // TODO: Reload your table view data

            }
        }
        task.resume()
    }//end of func viewDidLoad
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as! MovieCell
        
        let movie = movies[indexPath.row]
        
        //The key to access the movie title from the dictionary is "title" (we got this from the api code data from the api website)
        let title = movie["title"] as! String
        
        //we store the title name in our title labels
        cell.titleLabel.text = title
        
        //The key to access the movie synopsis from the dictionary is "overview" (we got this from the api code data from the api website)
        let synopsis = movie["overview"] as! String
        
        //we store the synopsis in our synopsis labels
        cell.synopsisLabel.text = synopsis
        
        
        //--------poster---------
        
        let baseUrl = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        
        let posterUrl = URL(string: baseUrl + posterPath)
        
        cell.posterView.af.setImage(withURL: posterUrl!)
        
        
        return cell
    }


    //Send information to the new view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        //Two tasks we must do:
        //1. find the selected movie
        let cell = sender as! UITableViewCell //"as!" is basically like casting, we cast it as a UITableViewCell
        let indexPath = tableView.indexPath(for: cell)!
        
        let movie = movies[indexPath.row]
        
        //2. pass the selected movie to the movieDetailsviewcontroller
        let detailsViewController = segue.destination as! MovieDetailsViewController
        
        detailsViewController.movie = movie
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

