//
//  AppService.swift
//  parseJSONAlamoESwifty
//
//  Created by Gabriella Messias Aleo on 18/10/19.
//  Copyright © 2019 Gabriella Messias Aleo. All rights reserved.
//

import Foundation
import Alamofire
final class AppService{
    
    private var alamofireManager = Alamofire.SessionManager.self
    private var url:String = ""
    init(_ url:String, timeout: TimeInterval = 15 ) {
        self.url = url
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = timeout
        configuration.timeoutIntervalForResource = timeout
        alamofireManager = Alamofire.SessionManager(configuration: configuration)
        
    }
    
    func getFromServer(completionHandler: @escaping(_ Movie: Movie?,_ error:String?)-> Void){
        alamofireManager.request(self.url).validate(statusCode:200..<300).validate(contentType: ["application/json"]).responseJSON{ response in
            switch response.result{
            case .success
            }
    }
    
}
