//
//  ViewController.swift
//  NewsApp-Viper
//
//  Created by Naratama on 28/07/23.
//

import UIKit
import MBProgressHUD

class BaseViewController: UIViewController {

    var progress : MBProgressHUD = MBProgressHUD()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func showLoading(_ view:UIView){
        hideLoading(view)
        progress = MBProgressHUD.showAdded(to: view, animated: true)
        progress.label.text = ""
    }

    func hideLoading(_ view:UIView){
        MBProgressHUD.hide(for: view, animated: true)
    }

    @IBAction func dismissTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

