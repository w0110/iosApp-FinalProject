//
//  CompanySearchViewController.swift
//  iosApp-project
//
//  Created by YenYun Chen on 2023/12/23.
//

import UIKit

class CompanySearchViewController: UIViewController {
    
    
    @IBOutlet weak var testImg: UIImageView!
    @IBOutlet weak var searchBarTextField: UITextField!
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    @IBOutlet weak var image5: UIImageView!
    
    @IBOutlet weak var footCompanyButton: UIButton!
    @IBOutlet weak var footCoachButton: UIButton!
    @IBOutlet weak var footPlaceButton: UIButton!
    
    enum UserTypr {
        case coach
        case company
        case landholder
    }
    var userType: UserTypr = .company
    
    enum ModeType {
        case coach
        case company
        case place
    }
    var modeTypr: ModeType = .coach
    
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
    
    @IBAction func button1Click(_ sender: Any) {
        switch modeTypr {
        case .company:
            navigateToDetailPage(user: userType, mode: modeTypr, itemName: "company1")
        case .coach:
            navigateToDetailPage(user: userType, mode: modeTypr, itemName: "coach1")
        case .place:
            navigateToDetailPage(user: userType, mode: modeTypr, itemName: "place1")
        }
    }
    
    @IBAction func button2Click(_ sender: Any) {
        switch modeTypr {
        case .company:
            navigateToDetailPage(user: userType, mode: modeTypr, itemName: "company2")
        case .coach:
            navigateToDetailPage(user: userType, mode: modeTypr, itemName: "coach2")
        case .place:
            navigateToDetailPage(user: userType, mode: modeTypr, itemName: "place2")
        }
    }
    
    @IBAction func button3Click(_ sender: Any) {
        switch modeTypr {
        case .company:
            navigateToDetailPage(user: userType, mode: modeTypr, itemName: "company3")
        case .coach:
            navigateToDetailPage(user: userType, mode: modeTypr, itemName: "coach3")
        case .place:
            navigateToDetailPage(user: userType, mode: modeTypr, itemName: "place3")
        }
    }
    
    @IBAction func button4Click(_ sender: Any) {
        switch modeTypr {
        case .company:
            navigateToDetailPage(user: userType, mode: modeTypr, itemName: "company4")
        case .coach:
            navigateToDetailPage(user: userType, mode: modeTypr, itemName: "coach4")
        case .place:
            navigateToDetailPage(user: userType, mode: modeTypr, itemName: "place4")
        }
    }
    
    func configureView() {
        
//        switch userType {
//        case .company:
//            testImg.image = UIImage(named: "company")
//        case .coach:
//            testImg.image = UIImage(named: "coach")
//        case .landholder:
//            testImg.image = UIImage(named: "place")
//        }
        
        switch modeTypr {
        case .company:
            searchBarTextField.placeholder = "Search Company"
            footCompanyButton.backgroundColor = UIColor(red: 154/255, green: 206/255, blue: 214/255, alpha: 1)
            image1.image = UIImage(named: "company-hiwin")!
            image2.image = UIImage(named: "company-largan")!
            image3.image = UIImage(named: "company-merry")!
            image4.image = UIImage(named: "company-winbond")!
            image5.image = UIImage(named: "company-sunspring")!
        case .coach:
            searchBarTextField.placeholder = "Search Coach"
            footCoachButton.backgroundColor = UIColor(red: 154/255, green: 206/255, blue: 214/255, alpha: 1)
            image1.image = UIImage(named: "coach1")!
            image2.image = UIImage(named: "coach2")!
            image3.image = UIImage(named: "coach3")!
            image4.image = UIImage(named: "coach4")!
            image5.image = UIImage(named: "coach")!
        case .place:
            searchBarTextField.placeholder = "Search Place"
            footPlaceButton.backgroundColor = UIColor(red: 154/255, green: 206/255, blue: 214/255, alpha: 1)
            image1.image = UIImage(named: "place1")!
            image2.image = UIImage(named: "place2")!
            image3.image = UIImage(named: "place3")!
            image4.image = UIImage(named: "place4")!
            image5.image = UIImage(named: "place")!
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
    
    func navigateToDetailPage(user: UserTypr, mode: ModeType, itemName: String) {
        let sharedVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailPageViewController") as! DetailPageViewController
        
        sharedVC.itemName = itemName
        switch user {
        case .coach:
            sharedVC.userType = .coach
        case .company:
            sharedVC.userType = .company
        case .landholder:
            sharedVC.userType = .landholder
        }
        
        switch modeTypr {
        case .coach:
            sharedVC.modeTypr = .coach
        case .company:
            sharedVC.modeTypr = .company
        case .place:
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
