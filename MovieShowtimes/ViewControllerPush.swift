//
//  ViewController6.swift
//  MovieShowtimes
//
//  Created by admin on 19.12.2019.
//  Copyright © 2019 Alex. All rights reserved.
//

import UIKit

protocol SVCDelegate {
    func func1(name: String)
}

class ViewControllerPush: UIViewController {
    
    var del: SVCDelegate?
    
    @IBOutlet weak var scrollScrollView: UIScrollView!
    
    @IBOutlet weak var SaveUIButton: UIButton!
    
    @IBOutlet weak var movieNameLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var posterImageView: UIImageView!
    
    var movieText: String?
    var timeText: String?
    var posterImage: UIImage?
    var clr: UIColor?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieNameLabel.backgroundColor = clr ?? UIColor.white
        scrollScrollView.backgroundColor = clr ?? UIColor.white
        movieNameLabel.text = movieText
        posterImageView.image = posterImage
        posterImageView.contentMode = .scaleAspectFill
        posterImageView.sizeToFit()
        movieNameLabel.sizeToFit()
        let room2 = (timeText?.replacingOccurrences(of: " ", with: "\n\n\n")) ?? ""
        timeLabel.text = room2
        scrollScrollView.addSubview(timeLabel)
        scrollScrollView.contentSize = timeLabel.intrinsicContentSize
        del?.func1(name: movieText ?? "")
    }

}
