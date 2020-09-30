//
//  ViewController.swift
//  CinemaApp
//
//  Created by Dmitry Anatolievich on 11.09.2020.
//  Copyright © 2020 Dmitry Anatolievich. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
    @IBOutlet weak var backgroundView: UIImageView!
    @IBOutlet var filmsButton: UIButton!
    @IBOutlet var serialsButton: UIButton!
    @IBOutlet var cartoonsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configBtns()
    }
    
    private func configBtns() {
        filmsButton.addBorderAndShadowToTitle()
        serialsButton.addBorderAndShadowToTitle()
        cartoonsButton.addBorderAndShadowToTitle()
    }
    
    @IBAction func filmsButtonAction(_ sender: Any) {
        guard let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "secondVC") as? SecondViewController else { return }
        let films = DataStorage.shared.films
        controller.setModel(films)
        controller.titleText = "Фильмы"
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func serialsButtonAction(_ sender: Any) {
        guard let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "secondVC") as? SecondViewController else { return }
        let series = DataStorage.shared.series
        controller.setModel(series)
        controller.titleText = "Сериалы"
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func cartoonsButtonAction(_ sender: Any) {
        guard let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "secondVC") as? SecondViewController else { return }
        let cartoons = DataStorage.shared.cartoons
        controller.setModel(cartoons)
        controller.titleText = "Мультфильмы"
        self.navigationController?.pushViewController(controller, animated: true)
    }
}


