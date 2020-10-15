//
//  SecondViewController.swift
//  CinemaApp
//
//  Created by Dmitry Anatolievich on 14.09.2020.
//  Copyright © 2020 Dmitry Anatolievich. All rights reserved.
//

import UIKit
class SecondViewController: UIViewController {
    @IBOutlet var collectionView: UICollectionView!
    var collectionViewFlowLayout: UICollectionViewFlowLayout!
    @IBOutlet var genreLabel: UILabel!
    var model: [MovieModel] = []
    var titleText: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "myCell")
        setupCollectionView()
        genreLabelSettings()
    }
    
    fileprivate func genreLabelSettings() {
        self.genreLabel.text = titleText
        self.genreLabel.textColor = .white
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupCollectionViewItemSize()
    }
    
    public func setModel(_ movies: [MovieModel]) {
        self.model = movies
    }
    
    fileprivate func backBttnSettings() {
        let back = UIImage(named: "item")?.withRenderingMode(.alwaysOriginal)
        navigationController?.navigationBar.barTintColor = UIColor.black
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: back, style:.plain, target: self, action: #selector(handlePop))
    }
    @objc func handlePop() {
            self.navigationController?.popViewController(animated: true)
        }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "secondBackground")!)
        backBttnSettings()
    }

    private func setupCollectionViewItemSize() {
        if collectionViewFlowLayout == nil {
            let lineSpacing:CGFloat = 5
            let interItemSpacing: CGFloat = 4
            collectionViewFlowLayout = UICollectionViewFlowLayout()
            collectionViewFlowLayout.itemSize = CGSize(width: 120, height: 266)
            collectionViewFlowLayout.sectionInset = UIEdgeInsets.init(top: 10, left: 19, bottom: 0, right: 19)
            collectionViewFlowLayout.scrollDirection = .vertical
            collectionViewFlowLayout.minimumLineSpacing = lineSpacing
            collectionViewFlowLayout.minimumInteritemSpacing = interItemSpacing
            collectionView.setCollectionViewLayout(collectionViewFlowLayout, animated: true)
        }
    }
}

extension SecondViewController: UICollectionViewDelegate {
    
}

extension SecondViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! CollectionViewCell
        let movie = model[indexPath.row]
        cell.starImageViewOutlet.image = UIImage(named: "goldStar")
        cell.ratingLabelOutlet.text = movie.ratingLabel
        cell.filmNameLabelOutlet.text = movie.title
        cell.configCellElements()
        cell.genreImageView.image = UIImage(named: movie.imageName)
        watchTrailer(cell, row: indexPath.row)
        return cell
    }
    
    func watchTrailer(_ event: CollectionViewCell?, row: Int) {
        event?.watchTrailerDidTapped = {[weak self ] in
            guard let self = self else { return }
            self.watchTrailerController(row)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        watchDetails(indexPath.row)
    }
    
    private func watchTrailerController(_ row: Int) {
        guard let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "trailerVC") as? TrailerViewController else { return }
        let movie = model[row]
        controller.setModel(model: movie)
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    private func watchDetails(_ row: Int) {
        let controller = DetailViewController()
        let movie = model[row]
        controller.setModel(model: movie)
        self.navigationController!.pushViewController(controller, animated: true)
    }
}

