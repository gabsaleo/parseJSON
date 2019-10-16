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

struct Movie{
    var title:String
//    var year:String
}

class ViewController: UITableViewController, UISearchBarDelegate {
    
    var currency: [Movie] = []
    var filterCurrency = [Movie]()
    var urlData = "http://data.fixer.io/api/latest?access_key="
    var key = "532e4717"
    var base = "EUR"
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
        
        cell.textLabel?.text = currency[indexPath.row].title
       

        return cell
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        let search = searchText.replacingOccurrences(of: " ", with: "+")
        let urlDataComplete = "http://www.omdbapi.com/?apikey=\(key)&s=\(search)"
        searching = true
       if search != ""{
           currency = currency.filter {filme in
               return  filme.title.lowercased().contains(search)

           }
       }
       
        getPrices(url: urlDataComplete, t: search)
        
        tableView.reloadData()
    }
    func getPrices(url : String, t:  String){
        let search = t.replacingOccurrences(of: " ", with: "+")
        Alamofire.request(url, method: .get).responseJSON { response in
            
            if response.result.isSuccess{
//                print("Sucesso")
                let priceJSON: JSON = JSON(response.result.value!)
                self.updatePrices(json: priceJSON, t: search)
//                print(priceJSON)
            }else{
                print("Erro \(String(describing: response.result.error))")
            }
            
        }
    }
    func updatePrices(json: JSON, t: String){
        for(Title) in json["Search"]{

            let curr = ("\(Title) ")
            print(curr)
            currency.append(Movie(title: curr))
            self.tableView.reloadData()
        }
        self.tableView.reloadData()
    }
   

}

