//
//  DetailPageViewController.swift
//  iosApp-project
//
//  Created by YenYun Chen on 2023/12/24.
//

import UIKit

class DetailPageViewController: UIViewController {
    
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
    
    var itemName: String = "tmp"

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
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
    
    @IBAction func backClick(_ sender: Any) {
        navigateToSearch(user: userType, mode: modeTypr)
    }
    
    func configureView() {
        
        switch itemName {
        case "company1":
            imageView.image = UIImage(named: "company-hiwin")
            mainLabel.text = "上銀科技股份有限公司"
            detailLabel.text = "需求:\n•    健身房場地合作(自主運動、團體課程、教練課程)"
        case "company2":
            imageView.image = UIImage(named: "company-largan")
            mainLabel.text = "大立光電股份有限公司"
            detailLabel.text = "需求:\n            •    徵求教練到本公司健身房定期上團體課程\n                         ·伸展瑜珈\n                         ·空中瑜珈\n                         ·瑜珈牆\n                         ·拳擊有氧\n                         ·TRX"
        case "company3":
            imageView.image = UIImage(named: "company-merry")
            mainLabel.text = "美律實業股份有限公司"
            detailLabel.text = "需求:\n•    健身房場地合作\n•    團膳營養師合作\n•    企業員工增肌減脂線上教練配合"
        case "company4":
            imageView.image = UIImage(named: "company-winbond")
            mainLabel.text = "華邦電子股份有限公司"
            detailLabel.text = "需求:\n•    健身房入場自主運動合作\n•    體適能教練到本公司自有場地帶體適能課程"
        case "coach1":
            imageView.image = UIImage(named: "coach1")
            mainLabel.text = "Kiki 教練"
            detailLabel.text = "資歷:\n•    ACE孕產專業體適能認證\n•    ACE女性專業體適能認證\n•    皮拉提斯ARC BARREL脊椎訓練師\n•    中華民國健身協會 C級教練證照\n提供項目:\n•    孕婦產後恢復\n•    運動防護觀念指導\n•    企業團班運動體適能"
        case "coach2":
            imageView.image = UIImage(named: "coach2")
            mainLabel.text = "Amy 教練"
            detailLabel.text = "資歷:\n•    美國運動委員會Health and wellness coach\n            •    TRX YOGA認證\n            •    YOGA FIT 老人瑜珈\n            •    YOGA FIT 孕婦瑜珈\n            提供項目:\n            •    瑜珈團團體課程\n            •    團體體適能訓練\n            •    TRX團體課程"
        case "coach3":
            imageView.image = UIImage(named: "coach3")
            mainLabel.text = "Daniel 教練"
            detailLabel.text = "資歷:\n•    CTSSN運動營養專業認證\n            •    RTS抗阻力訓練\n            •    中華民國健身協會 C級教練證照\n            •    WNBF男子健康體180-殿軍\n            提供項目:\n            •    健康飲食安排菜單指導\n            •    團體體適能訓練\n            •    1對1私教課程"
        case "coach4":
            imageView.image = UIImage(named: "coach4")
            mainLabel.text = "Eathon 教練"
            detailLabel.text = "資歷:\n•    澳洲體適能踢拳擊L1~3互動式踢拳擊教練\n            •    銀髮族功能性訓練研習\n            •    水適能深水/淺水水適能指導員\n            提供項目:\n            •    銀髮族帶動團課程\n            •    拳擊有氧團體課程\n            •    水適能團體課程"
        case "place1":
            imageView.image = UIImage(named: "place1")
            mainLabel.text = "HANDS UP TRAINING"
            detailLabel.text = "地點: 403台中市西區臺灣大道二段285號B1\n        電話: 04 2326 2181\n提供項目:\n•    企業合作每人每月四次入場自主運動權限\n•    團課教室租借(可容納15人)\n•    教練培訓課程\n•    賽事場地租借\n•    活動策畫籌辦"
        case "place2":
            imageView.image = UIImage(named: "place2")
            mainLabel.text = "ACTION FITNESS"
            detailLabel.text = "地點: 40763台中市西屯區國安一路168號5樓\n電話: 04 2465 8899\n        提供項目:\n        •    企業合作每人每月四次入場自主運動權限\n        •    團課教室租借(可容納30人)"
        case "place3":
            imageView.image = UIImage(named: "place3")
            mainLabel.text = "Harfez Fitness"
            detailLabel.text = "地點: 40341台中市西區忠明路30號2樓\n        電話: 04 2314 0789\n        提供項目:\n        •    企業合作每人每月四次入場自主運動權限\n        •    團課教室租借(可容納10人)\n        •    企業包餐聚會"
        case "place4":
            imageView.image = UIImage(named: "place4")
            mainLabel.text = "澳美伽健身會館"
            detailLabel.text = "地點: 407台中市西屯區福康路89號\n        電話: 0424615566\n        提供項目:\n        •    企業合作每人每月四次入場自主運動權限、一百人次入場優惠\n        •    團課教室租借(可容納10人)\n        •    企業包餐聚會"
        default:
            imageView.image = UIImage(named: "logo")
            mainLabel.text = "Fitness Unity"
            detailLabel.text = "Fitness Unity"
        }
    }

    func navigateToSearch(user: UserTypr, mode: ModeType) {
        let sharedVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CompanySearchViewController") as! CompanySearchViewController
        
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

}
