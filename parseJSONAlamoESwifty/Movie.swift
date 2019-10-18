//
//  Movie.swift
//  parseJSONAlamoESwifty
//
//  Created by Gabriella Messias Aleo on 18/10/19.
//  Copyright © 2019 Gabriella Messias Aleo. All rights reserved.
//

import UIKit
class Movie:Codable{
    var Title:String
    var `Type`:String
    var imdbID:String
    var Year:String
    var Poster:String
    
    enum CodingKeys: String, CodingKey {
           case Title = "Title"
           case `Type` = "Type"
           case imdbID = "imdbID"
           case Year = "Year"
           case Poster = "Poster"
        
       }
    init(Title:String, Type:String, imdbID:String, Year:String, Poster:String) {
        self.Title = Title
        self.Type = Type
        self.imdbID = imdbID
        self.Year = Year
        self.Poster = Poster
        
    }
    
}

class Movies:Codable{
    var Search: [Movie]
    
// enum CodingKeys: String, CodingKey {
//    case Search = "Search"
//}
//
//
    init(Search : [Movie]) {
        self.Search = Search
    }
}
