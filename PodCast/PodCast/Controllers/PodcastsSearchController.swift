//
//  PodcastsSearchController.swift
//  PodCast
//
//  Created by Coray on 28/1/2021.
//

import UIKit
import Alamofire

class PodcastsSearchController: UITableViewController, UISearchBarDelegate {
    
    let podcasts = [
        Podcast(name: "Coray show", artistName: "Corayjkfsd"),
        Podcast(name: "Coray show", artistName: "Coray"),
        Podcast(name: "Coray show", artistName: "Coray")
    ]
    
    let cellId = "cellId"
    
    //lets inplement a UISearchController
    let searchController = UISearchController(searchResultsController: nil)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSearchBar()
        setupTableView()

    }
    
    //MARK:- Setup work
    
    fileprivate func setupSearchBar() {
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        // later implement Alamofire to search iTunes API
        
        let url = "https://itunes.apple.com/search?term=jack+johnson"
        AF.request(url).responseData { (dataResponse) in
            if let err = dataResponse.error {
                print("Fail to contact yahoo", err)
                return
            }
            
            guard let data = dataResponse.data else{ return }
            let dummyString = String(data: data, encoding: .utf8)
            print(dummyString ?? "")
            
        }
    }
    
    fileprivate func setupTableView() {
        //1.register a cell for our tableView
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }
    
    //MARK:- UITableView
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return podcasts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        let podcast = podcasts[indexPath.row]
        
        cell.textLabel?.text = "\(podcast.name)\n\(podcast.artistName)"
        cell.textLabel?.numberOfLines = -1
        cell.imageView?.image = #imageLiteral(resourceName: "appicon")
        return cell
    }
}
