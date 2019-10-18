//
//  ViewController.swift
//  parseJSONAlamoESwifty
//
//  Created by Gabriella Messias Aleo on 16/10/19.
//  Copyright © 2019 Gabriella Messias Aleo. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON





class ViewController:  UITableViewController, UISearchBarDelegate {
    
    var currency: [Movie] = []
   
    var key = "532e4717"
    
    var searching = false

    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     
        return currency.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellReuse = "cellReuse"
        
        let cell=tableView.dequeueReusableCell(withIdentifier: cellReuse, for: indexPath)
        
        cell.textLabel?.text = currency[indexPath.row].Title
//        cell.textLabel?.text = currency[indexPath.row].Type
//        cell.textLabel?.text = currency[indexPath.row].imdbID
//        cell.textLabel?.text = currency[indexPath.row].Year
//        cell.textLabel?.text = currency[indexPath.row].Poster
       

        return cell
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            
            let search = searchText.replacingOccurrences(of: " ", with: "+")
            let urlDataComplete = "http://www.omdbapi.com/?apikey=\(key)&s=\(search)"
            searching = true
           if search != ""{
               currency = currency.filter {filme in
                   return  filme.Title.lowercased().contains(search)
                
            }
           }else{
            self.tableView.reloadData()
        }
            getPrices(url: urlDataComplete)
        }
        func getPrices(url : String){
            Alamofire.request(url, method: .get).responseData { (response) in
                    guard let dados = response.data else { return }
                    print(dados)
                    do{
                    let decoder = JSONDecoder()
                    let procurar = try decoder.decode(Movies.self, from: dados)
                        self.currency = procurar.Search
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    }catch let error{
                        print(error)
                    }
        
        }
  
}
}

