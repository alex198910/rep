//
//  APIManager.swift
//  MovieShowtimes
//
//  Created by admin on 26.12.2019.
//  Copyright © 2019 Alex. All rights reserved.
//

import UIKit

class APIManager: NSObject {
    var jsonParser = JsonDataGetter()
    func getData(comletion: @escaping ((DataOfJsonMovies?) -> Void)) {
        let urlPath = "https://firebasestorage.googleapis.com/v0/b/testfirebase-d377b.appspot.com/o/movie2.json?alt=media&token=67b5aad0-e488-4931-8dcf-582be578e061"
        let myURL = URL(string: urlPath)!
        let request = URLRequest(url: myURL)
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let urlTask = session.dataTask(with: request) { [weak self] myData, response, error in
            guard let strongSelf = self,
                error == nil
            else {
                //print("\n\n DataTaskError ---> \(error!)")
                comletion(nil)
                return
            }
            do {
                guard let myData = myData else { return }
                strongSelf.jsonParser.decodeJson(myData: myData) { data in
                    comletion(data)
                }
                //x = jsonData
            } catch {
                //print("Error during parsing ---> \(error) ")
                comletion(nil)
            }
        }
        urlTask.resume()
    }
}
