//
//  MovieDetailsViewController.swift
//  Theater
//
//  Created by Macbook Pro on 2/28/22.
//

import UIKit
import AlamofireImage //required to retreive images

class MovieDetailsViewController: UIViewController
{
    
    
    
    @IBOutlet weak var backdropView: UIImageView!
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    
    var movie: [String:Any]!

    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //title
        titleLabel.text = movie["title"] as? String
        
        //used to fit the text
        titleLabel.sizeToFit()
        
        //synopsis
        synopsisLabel.text = movie["overview"] as? String
        
        //used to fit the text
        synopsisLabel.sizeToFit()
        
        //-------poster----------
        
        let posterbaseUrl = "https://image.tmdb.org/t/p/w185"
        
        let posterPath = movie["poster_path"] as! String
        
        let posterUrl = URL(string: posterbaseUrl + posterPath)
        
        posterView.af.setImage(withURL: posterUrl!)
        
        //----------backdrop--------
        
        //url is same as poster except we increased the resolution (we must choose a size that is available from the api documentation)
        let backdropbaseUrl = "https://image.tmdb.org/t/p/w780"
        
        let backdropPath = movie["backdrop_path"] as! String
        
        let backdropUrl = URL(string: backdropbaseUrl + backdropPath)
        
        backdropView.af.setImage(withURL: backdropUrl!)
        
        
        
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }

}
