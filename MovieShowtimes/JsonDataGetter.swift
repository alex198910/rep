//
//  JsonDataGetter.swift
//  MovieShowtimes
//
//  Created by admin on 27.12.2019.
//  Copyright © 2019 Alex. All rights reserved.
//

import UIKit

class JsonDataGetter: NSObject {
    func decodeJson(myData: Data, comletion: @escaping ((DataOfJsonMovies?) -> Void)) {
        do {
            let jsonData = try JSONDecoder().decode(DataOfJsonMovies.self, from: myData)
            comletion(jsonData)
            //x = jsonData
        } catch {
            //print("Error during parsing ---> \(error) ")
            comletion(nil)
        }
    }
        
}
