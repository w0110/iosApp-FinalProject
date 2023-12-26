//
//  ViewController.swift
//  iosApp-project
//
//  Created by YenYun Chen on 2023/12/20.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // background img
        let backgroundImage = UIImage(named: "FNbackground")
        let backgroundImageView = UIImageView(frame: UIScreen.main.bounds)
        backgroundImageView.image = backgroundImage
        backgroundImageView.contentMode = .scaleAspectFill
        
        // 将 UIImageView 添加到视图上
        view.addSubview(backgroundImageView)
        view.sendSubviewToBack(backgroundImageView)
    }
    
    @IBAction func registerClick(_ sender: Any) {
        navigateToSharedViewController(view: "register")
    }
    
    @IBAction func loginClick(_ sender: Any) {
        navigateToSharedViewController(view: "login")
    }
    
    func navigateToSharedViewController(view: String) {
        let sharedVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginChooseViewController") as! LoginChooseViewController
        
        if view == "register" {
            sharedVC.viewType = .register
        } else if view == "login" {
            sharedVC.viewType = .login
        }
        
        sharedVC.modalPresentationStyle = .fullScreen
        self.present(sharedVC, animated: false)
        
//        navigationController?.pushViewController(sharedVC, animated: true)
    }
}
