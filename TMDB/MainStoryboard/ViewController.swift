//
//  ViewController.swift
//  TMDB
//
//  Created by Rizwan Mehmood on 23/08/2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let vc  =  MoviesListVC.create()
        navigationController?.pushViewController(vc, animated: true)
    }


}

