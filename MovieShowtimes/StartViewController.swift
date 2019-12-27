//
//  StartViewController.swift
//  MovieShowtimes
//
//  Created by admin on 16.12.2019.
//  Copyright © 2019 Alex. All rights reserved.
//

import UIKit

struct DataOfJsonMovies : Decodable {
    var Movies : [Movie?]?
}

struct Movie : Decodable {
    var time : String?
    var name : String?
    var poster : String?
}

class StartViewController: UIViewController {
    

    @IBOutlet weak var startUIButton: UIButton!

    var arrayOfJsonStartVC = DataOfJsonMovies()
    var apiManager: APIManager!
    
    @IBOutlet weak var spinnerUIActivityIndicatorView: UIActivityIndicatorView!
    @IBAction func ActStart(_ sender: Any) {
        spinnerUIActivityIndicatorView.startAnimating()
        
        self.startUIButton.isHidden = true
        apiManager.getData { [weak self] data in
            guard let strongSelf = self, let data = data else {
                self?.startUIButton.isHidden = true
                let alertUIAlertController = UIAlertController(title: "Ошибка", message: "Ошибка загрузки файлов из сети", preferredStyle: .alert)
                let closeButtonUIAlertAction = UIAlertAction(title: "Закрыть", style: .default, handler: { action in})
                alertUIAlertController.addAction(closeButtonUIAlertAction)
                DispatchQueue.main.async(execute: {
                    self?.spinnerUIActivityIndicatorView.stopAnimating()
                    self?.present(alertUIAlertController, animated: true)
                    self?.startUIButton.isHidden = false
                })
                
                return
            }
            strongSelf.arrayOfJsonStartVC = data
            DispatchQueue.main.async {
                let mainTVC = strongSelf.storyboard?.instantiateViewController(identifier: "mainTVC") as! TableViewController
                mainTVC.arrayOfJsonTableVC = strongSelf.arrayOfJsonStartVC
                
                strongSelf.navigationController?.pushViewController(mainTVC, animated: true)
                
                
            }
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
       
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        apiManager = APIManager()
        startUIButton.titleLabel?.numberOfLines = 0
        startUIButton.titleLabel?.textAlignment = .center
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        spinnerUIActivityIndicatorView.stopAnimating()
        startUIButton.isHidden = false
    }
}
