//
//  LoginViewController.swift
//  iosApp-project
//
//  Created by YenYun Chen on 2023/12/21.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var accountTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var changeRoleLabel: UILabel!
    
    
    enum UserTypr {
        case coach
        case company
        case landholder
    }
    
    var userType: UserTypr = .coach
    
    

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
    
    @IBAction func goRegisterClick(_ sender: Any) {
        navigateToRegisterViewController()
    }    
    
    @IBAction func changeRoleClick(_ sender: Any) {
        let loginChooseVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginChooseViewController") as! LoginChooseViewController
        
        loginChooseVC.viewType = .login
        loginChooseVC.modalPresentationStyle = .fullScreen
        self.present(loginChooseVC, animated: true)
    }
    
    
    @IBAction func loginClick(_ sender: Any) {
        let sharedVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CompanySearchViewController") as! CompanySearchViewController
        
        switch userType {
        case .coach:
            if let account = accountTextField.text,
               let password = passwordTextField.text,
               account.isEmpty || password.isEmpty{
                emptyAlart()
            } else if accountTextField.text == "Kiki" {
                if passwordTextField.text == "123" {
                    sharedVC.userType = .coach
                    sharedVC.modeTypr = .company
                } else {
                    passwordWrongAlart(user: self.userType)
                }
            }
        case .company:
            if let account = accountTextField.text,
               let password = passwordTextField.text,
               account.isEmpty || password.isEmpty{
                emptyAlart()
            } else if accountTextField.text == "Merry" {
                if passwordTextField.text == "123" {
                    sharedVC.userType = .company
                    sharedVC.modeTypr = .place
                } else {
                    passwordWrongAlart(user: self.userType)
                }
            }
        case .landholder:
            if let account = accountTextField.text,
               let password = passwordTextField.text,
               account.isEmpty || password.isEmpty{
                emptyAlart()
            } else if accountTextField.text == "HANDSUP" {
                if passwordTextField.text == "123" {
                    sharedVC.userType = .landholder
                    sharedVC.modeTypr = .company
                } else {
                    passwordWrongAlart(user: self.userType)
                }
            }
        }
        
        sharedVC.modalPresentationStyle = .fullScreen
        self.present(sharedVC, animated: false)
    }
    
    
    @IBAction func forgetPasswordClick(_ sender: Any) {
        let alartVC = UIAlertController(title: "Error", message: "目前尚未提供修改密碼服務，請重新註冊帳號！", preferredStyle: UIAlertController.Style.alert)
//        let okButton = UIAlertAction(title: "確認", style: UIAlertAction.Style.default, handler: nil)
        let okButton = UIAlertAction(title: "確認", style: .default) { _ in
                // 在用户点击 "確認" 按钮后执行的逻辑
                self.navigateToRegisterViewController()
            }
        
        alartVC.addAction(okButton)
        self.present(alartVC, animated: true, completion: nil)
    }
    
    func configureView() {
        switch userType {
        case .coach:
            loginLabel.text = "教練登入"
            imageView.image = UIImage(named: "person")!
            changeRoleLabel.text = "Not a coach?"
        case .company:
            loginLabel.text = "企業登入"
            imageView.image = UIImage(named: "company")!
            changeRoleLabel.text = "Not a company?"
        case .landholder:
            loginLabel.text = "地主登入"
            imageView.image = UIImage(named: "place")!
            changeRoleLabel.text = "Not a landholder?"
        }
    }
    
    func navigateToRegisterViewController(){
        let registerChooseVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginChooseViewController") as! LoginChooseViewController
        
        registerChooseVC.viewType = .register
        registerChooseVC.modalPresentationStyle = .fullScreen
        self.present(registerChooseVC, animated: false)
    }
    
    func navigateToLoginViewController(user: UserTypr) {
        let loginChooseVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        
        loginChooseVC.userType = userType
        loginChooseVC.modalPresentationStyle = .fullScreen
        self.present(loginChooseVC, animated: false)
    }
    
    func passwordWrongAlart(user: UserTypr) {
        let alartVC = UIAlertController(title: "Error", message: "密碼有誤，請重新輸入！", preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "確認", style: .default) { _ in
            self.navigateToLoginViewController(user: user)
            }
        alartVC.addAction(okButton)
        self.present(alartVC, animated: true, completion: nil)
    }
    
    func accountNotExistAlart() {
        let alartVC = UIAlertController(title: "Error", message: "帳號不存在，請先註冊！", preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "確認", style: .default) { _ in
                self.navigateToRegisterViewController()
            }
        
        alartVC.addAction(okButton)
        self.present(alartVC, animated: true, completion: nil)
    }
    
    func emptyAlart() {
        let alartVC = UIAlertController(title: "Error", message: "不可有未填寫的空格，請填寫完整資料！", preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "確認", style: UIAlertAction.Style.default, handler: nil)
        
        alartVC.addAction(okButton)
        self.present(alartVC, animated: true, completion: nil)
    }
}
