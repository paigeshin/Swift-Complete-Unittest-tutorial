//
//  ViewController.swift
//  TestNavigation
//
//  Created by paige on 2021/12/27.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nextViewButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func nextViewButtonTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondVC = storyboard.instantiateViewController(withIdentifier: "SecondVC") as? SecondVC
        self.navigationController?.pushViewController(secondVC!, animated: true)
    }

}

