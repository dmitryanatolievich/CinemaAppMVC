//
//  TrailerViewController.swift
//  CinemaApp
//
//  Created by Dmitry Anatolievich on 14.10.2020.
//  Copyright © 2020 Dmitry Anatolievich. All rights reserved.
//

import UIKit
import WebKit

class TrailerViewController: UIViewController, WKUIDelegate {
    @IBOutlet var trailerWebView: WKWebView!
    var model: MovieModel?
    
    override func viewDidAppear(_ animated: Bool) {
        trailerWebView.uiDelegate = self
        view = trailerWebView
        let trailerUrl = NSURL(string: model!.trailerUrl)
        if let myUrl = trailerUrl {
            let request = URLRequest(url: myUrl as URL)
            trailerWebView.load(request)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backBttnSettings()
    }
    
    func setModel(model: MovieModel) {
        self.model = model
    }
  
    fileprivate func backBttnSettings() {
        let back = UIImage(named: "item")?.withRenderingMode(.alwaysOriginal)
        navigationController?.navigationBar.barTintColor = UIColor.black
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: back, style:.plain, target: self, action: #selector(handlePop))
    }
    @objc func handlePop() {
            self.navigationController?.popViewController(animated: true)
    }
}
