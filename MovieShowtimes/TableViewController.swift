//
//  TableViewController.swift
//  MovieShowtimes
//
//  Created by admin on 16.12.2019.
//  Copyright © 2019 Alex. All rights reserved.
//

import UIKit


class TableViewController: UITableViewController, SVCDelegate {

    var arrayOfJsonTableVC = DataOfJsonMovies()
    var names = [String: UIColor]()
    
    func func1(name: String) {
        self.names[name] = UIColor(red: 0.2, green: 0.1, blue: 0.3, alpha: 0.2)
        }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let countOfMembers = arrayOfJsonTableVC.Movies?.count else {return 0}
        return countOfMembers
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("TableViewCell", owner: self, options: nil)?.first as! TableViewCell
        cell.mainImageView.image = UIImage(named: arrayOfJsonTableVC.Movies![indexPath.row]?.poster ?? "no_image.png")
        cell.mainLabel.text = arrayOfJsonTableVC.Movies![indexPath.row]?.name
        cell.secondLabel.text = arrayOfJsonTableVC.Movies![indexPath.row]?.time
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("pushVC.clr = self.clr")
        let pushVC = storyboard?.instantiateViewController(identifier: "ViewControllerPush") as! ViewControllerPush
        pushVC.movieText = arrayOfJsonTableVC.Movies![tableView.indexPathForSelectedRow!.row]?.name
        pushVC.timeText = arrayOfJsonTableVC.Movies![tableView.indexPathForSelectedRow!.row]?.time
        pushVC.posterImage = UIImage(named: arrayOfJsonTableVC.Movies![tableView.indexPathForSelectedRow!.row]?.poster ?? "no_image.png")
        pushVC.clr = names[arrayOfJsonTableVC.Movies![indexPath.row]!.name!] ?? UIColor.white
        pushVC.del = self
        self.navigationController?.pushViewController(pushVC, animated: true)
    }
}
