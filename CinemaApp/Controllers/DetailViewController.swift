//
//  DetailViewController.swift
//  CinemaApp
//
//  Created by Dmitry Anatolievich on 16.09.2020.
//  Copyright © 2020 Dmitry Anatolievich. All rights reserved.
//

import UIKit
class DetailViewController: UIViewController {
    var model: MovieModel?
    
    @IBOutlet var detailScrollView: UIScrollView!
    @IBOutlet var detailView: UIView!
    @IBOutlet var filmNameLabel: UILabel!
    @IBOutlet var filmNameIV: UIImageView!
    @IBOutlet var yearLabel: UILabel!
    @IBOutlet var genreLabel: UILabel!
    @IBOutlet var producerLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var castLabel: UILabel!
    @IBOutlet var rateLabel: UILabel!
    @IBOutlet var filmNameLbl: UILabel!
    @IBOutlet var starIV: UIImageView!
    @IBOutlet var ratingLabel: UILabel!
    @IBOutlet var watchBatton: UIButton!
    @IBOutlet var fiveStarsStackView: UIStackView!
    @IBOutlet var oneStarIV: UIImageView!
    @IBOutlet var twoStarsIV: UIImageView!
    @IBOutlet var threeStarsIV: UIImageView!
    @IBOutlet var fourStarsIV: UIImageView!
    @IBOutlet var fiveStarsIV: UIImageView!
    @IBOutlet var leftActorIV: UIImageView!
    @IBOutlet var rightActorIV: UIImageView!
    @IBOutlet var leftActorNameLabel: UILabel!
    @IBOutlet var rightActorNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backBttnSettings()
        labelsSettings()
        detailView.backgroundColor = UIColor.clear
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "secondBackground")!)
        
    }
    
    func setModel(model: MovieModel) {
        self.model = model
    }
    
    fileprivate func labelsSettings() {
        filmNameLabel.text = model?.title
        filmNameLbl.numberOfLines = 0
        filmNameIV.image = UIImage(named: model?.imageName ?? "")
        yearLabel.text = model?.yearLabel
        genreLabel.numberOfLines = 0
        genreLabel.text = model?.genreLabel
        producerLabel.numberOfLines = 0
        producerLabel.text = model?.producerLabel
        descriptionLabel.text = model?.filmDescriptionText
        descriptionLabel.numberOfLines = 0
        filmNameLbl.text = model?.filmNameLbl
        oneStarIV.image = UIImage(named: model?.oneStarIV ?? "")
        twoStarsIV.image = UIImage(named:model?.twoStarsIV ?? "")
        threeStarsIV.image = UIImage(named: model?.threeStarsIV ?? "")
        fourStarsIV.image = UIImage(named: model?.fourStarsIV ?? "")
        fiveStarsIV.image = UIImage(named: model?.fiveStarsIV ?? "")
        leftActorIV.image = UIImage(named: model?.leftActorIV ?? "")
        leftActorIV.layer.cornerRadius = 55
        leftActorIV.contentMode = .scaleAspectFill
        rightActorIV.image = UIImage(named: model?.rightActorIV ?? "")
        rightActorIV.layer.cornerRadius = 55
        leftActorNameLabel.text = model?.leftActorNameLabel
        leftActorNameLabel.numberOfLines = 0
        rightActorNameLabel.text = model?.rightActorNameLabel
        rightActorNameLabel.numberOfLines = 0
        castLabel.text = model?.castLabel
        rateLabel.text = model?.rateLabel
        ratingLabel.text = model?.ratingLabel
        watchBatton.addButtonSettings()
    }
    
    @IBAction func watchTrailerBttnAction(_ sender: Any) {
        guard let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "trailerVC") as? TrailerViewController else { return }
        let movie = model
        controller.setModel(model: movie!)
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    fileprivate func backBttnSettings() {
        let back = UIImage(named: "item")?.withRenderingMode(.alwaysOriginal)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: back, style:.plain, target: self, action: #selector(handlePop))
    }
    
    @objc func handlePop() {
        self.navigationController?.popViewController(animated: true)
    }
}

