//
//  ViewController.swift
//  networking-example
//
//  Created by akin on 5.06.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        NetworkService().fetchQuotes { response in
            switch response {
            case .success(let result):
                print(result)
            case .failure(let err):
                print(err)
            }
        }
    }
}

