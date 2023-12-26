//
//  UserDetailViewController.swift
//  iosApp-project
//
//  Created by YenYun Chen on 2023/12/24.
//

import UIKit

class UserDetailViewController: UIViewController {
    enum UserTypr {
        case coach
        case company
        case landholder
    }
    var userType: UserTypr = .company
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var footCompanyButton: UIButton!
    @IBOutlet weak var footCoachButton: UIButton!
    @IBOutlet weak var footPlaceButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // background image setting
        let backgroundImage = UIImage(named: "FNbackground")
        let backgroundImageView = UIImageView(frame: UIScreen.main.bounds)
        backgroundImageView.image = backgroundImage
        backgroundImageView.contentMode = .scaleAspectFill
        view.addSubview(backgroundImageView)
        view.sendSubviewToBack(backgroundImageView)

        // Do any additional setup after loading the view.
        configureView()
    }
    
    @IBAction func logoutClick(_ sender: Any) {
        let sharedVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as! ViewController
        
        sharedVC.modalPresentationStyle = .fullScreen
        self.present(sharedVC, animated: false)
    }
    
        @IBAction func footCompanyClick(_ sender: Any) {
        if userType == .company {
            navigateToUserPage(user: userType)
        } else {
            navigateToOtherMode(user: userType, mode: "company")
        }

    }

    @IBAction func footPlaceClick(_ sender: Any) {
        if userType == .landholder {
            navigateToUserPage(user: userType)
        } else {
            navigateToOtherMode(user: userType, mode: "place")
        }
    }

    @IBAction func footCoachClick(_ sender: Any) {
        if userType == .coach {
            navigateToUserPage(user: userType)
        } else {
            navigateToOtherMode(user: userType, mode: "coach")
        }
    }
    
    func configureView() {
        switch userType {
        case .company:
            footCompanyButton.backgroundColor = UIColor(red: 154/255, green: 206/255, blue: 214/255, alpha: 1)
            image.image = UIImage(named: "company-merry")
            mainLabel.text = "美律實業股份有限公司"
            detailLabel.text = "需求:\n•    健身房場地合作\n•    團膳營養師合作\n•    企業員工增肌減脂線上教練配合"
        case .coach:
            footCoachButton.backgroundColor = UIColor(red: 154/255, green: 206/255, blue: 214/255, alpha: 1)
            image.image = UIImage(named: "coach1")
            mainLabel.text = "Kiki教練"
            detailLabel.text = "資歷:\n•    ACE孕產專業體適能認證\n•    ACE女性專業體適能認證\n•    皮拉提斯ARC BARREL脊椎訓練師\n•    中華民國健身協會 C級教練證照\n提供項目:\n•    孕婦產後恢復\n•    運動防護觀念指導\n•    企業團班運動體適能"
        case .landholder:
            footPlaceButton.backgroundColor = UIColor(red: 154/255, green: 206/255, blue: 214/255, alpha: 1)
            image.image = UIImage(named: "place1")
            mainLabel.text = "HANDS UP TRAINING"
            detailLabel.text = "地點: 403台中市西區臺灣大道二段285號B1\n        電話: 04 2326 2181\n提供項目:\n•    企業合作每人每月四次入場自主運動權限\n•    團課教室租借(可容納15人)\n•    教練培訓課程\n•    賽事場地租借\n•    活動策畫籌辦"
        }
    }
    
    func navigateToOtherMode(user: UserTypr, mode: String) {
        let sharedVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CompanySearchViewController") as! CompanySearchViewController
        
        switch user {
        case .coach:
            sharedVC.userType = .coach
        case .company:
            sharedVC.userType = .company
        case .landholder:
            sharedVC.userType = .landholder
        }
        
        if mode == "coach" {
            sharedVC.modeTypr = .coach
        } else if mode == "company" {
            sharedVC.modeTypr = .company
        } else if mode == "place" {
            sharedVC.modeTypr = .place
        }
        
        sharedVC.modalPresentationStyle = .fullScreen
        self.present(sharedVC, animated: false)
    }
    
    func navigateToUserPage(user: UserTypr) {
        let sharedVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "UserDetailViewController") as! UserDetailViewController
        
        switch user {
        case .coach:
            sharedVC.userType = .coach
        case .company:
            sharedVC.userType = .company
        case .landholder:
            sharedVC.userType = .landholder
        }
        
        sharedVC.modalPresentationStyle = .fullScreen
        self.present(sharedVC, animated: false)
    }
}
