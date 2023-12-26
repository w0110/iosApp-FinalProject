//
//  ChooseUserTypeViewController.swift
//  iosApp-project
//
//  Created by YenYun Chen on 2023/12/20.
//

import UIKit

class LoginChooseViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var footButton: UIButton!
    @IBOutlet weak var footLabel: UILabel!
    
    enum ViewType {
        case register
        case login
    }
    
    var viewType: ViewType = .register
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // background image setting
        let backgroundImage = UIImage(named: "FNbackground")
        let backgroundImageView = UIImageView(frame: UIScreen.main.bounds)
        backgroundImageView.image = backgroundImage
        backgroundImageView.contentMode = .scaleAspectFill 
        view.addSubview(backgroundImageView)
        view.sendSubviewToBack(backgroundImageView)
        
        configureView()
    }
    
    
    @IBAction func coachClick(_ sender: Any) {
        if viewType == .login {
            navigateToLoginViewController(user: "coach")
        } else if viewType == .register {
            navigateToRegisterViewController(user: "coach")
        }
    }
    
    
    @IBAction func companyClick(_ sender: Any) {
        if viewType == .login {
            navigateToLoginViewController(user: "company")
        } else if viewType == .register {
            navigateToRegisterViewController(user: "company")
        }
    }
    
    
    @IBAction func landholderClick(_ sender: Any) {
        if viewType == .login {
            navigateToLoginViewController(user: "landholder")
        } else if viewType == .register {
            navigateToRegisterViewController(user: "landholder")
        }
    }
    
    @IBAction func changeStatus(_ sender: Any) {
        let statusChooseVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginChooseViewController") as! LoginChooseViewController
        
        if viewType == .register {
            statusChooseVC.viewType = .login
        } else if viewType == .login {
            statusChooseVC.viewType = .register
        }
        
        statusChooseVC.modalPresentationStyle = .fullScreen
        self.present(statusChooseVC, animated: false)
    }
    
    func configureView() {
        switch viewType {
        case .register:
            titleLabel.text = "註冊身份選擇"
            imageView.image = UIImage(named: "person")!
            footLabel.text = "Already have an account?"
            footButton.setTitle("Login", for: .normal)
        case .login:
            titleLabel.text = "登入身份選擇"
            imageView.image = UIImage(named: "login")!
            footLabel.text = "Don’t have an account?"
            footButton.setTitle("Register", for: .normal)
        }
    }
    
    func navigateToLoginViewController(user: String) {
        let sharedVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        
        if user == "coach" {
            sharedVC.userType = .coach
        } else if user == "company" {
            sharedVC.userType = .company
        } else if user == "landholder" {
            sharedVC.userType = .landholder
        }
        
        sharedVC.modalPresentationStyle = .fullScreen
        self.present(sharedVC, animated: false)
    }
    
    func navigateToRegisterViewController(user: String) {
        let sharedVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
        
        if user == "coach" {
            sharedVC.userType = .coach
        } else if user == "company" {
            sharedVC.userType = .company
        } else if user == "landholder" {
            sharedVC.userType = .landholder
        }
        
        sharedVC.modalPresentationStyle = .fullScreen
        self.present(sharedVC, animated: false)
    }
}
