//
//  passcodeViewController.swift
//  passcode
//
//  Created by 林家宇 on 2020/7/24.
//

import UIKit

class passcodeViewController: UIViewController {

    @IBOutlet var password1: UIImageView!
    @IBOutlet var password2: UIImageView!
    @IBOutlet var password3: UIImageView!
    @IBOutlet var password4: UIImageView!
    @IBOutlet var checkImage: UIImageView!
    var passwordStr = "1234"
    var inputPasscodeStr = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnNum(_ sender: UIButton) {
        inputPasscode(input:String(sender.tag))
    }
    @IBAction func btnDelete(_ sender: UIButton) {
        if 1...3 ~= inputPasscodeStr.count{
            inputPasscodeStr.removeLast()
        }
        showImage()
    }
    @IBAction func btnReload(_ sender: UIButton) {
        reload()
    }
    func inputPasscode(input:String){
        if 0...3 ~= inputPasscodeStr.count{
            inputPasscodeStr += input
        }
        if inputPasscodeStr.count == 4 {
            if inputPasscodeStr == passwordStr{
                checkTrue()
            }else{
                reload()
                checkFalse()
            }
        }
        showImage()
    }
    func reload(){
        inputPasscodeStr = ""
        checkImageSetDefault()
        showImage()
    }
    func showImage(){
        let passcodeCount = inputPasscodeStr.count
        let imageEmputy = UIImage(named: "baaro-inWhite")
        let imageHave = UIImage(named: "baaro")
        
        switch passcodeCount{
        case 1:
            password1.image = imageHave
            password2.image = imageEmputy
            password3.image = imageEmputy
            password4.image = imageEmputy
        case 2:
            password1.image = imageHave
            password2.image = imageHave
            password3.image = imageEmputy
            password4.image = imageEmputy
        case 3:
            password1.image = imageHave
            password2.image = imageHave
            password3.image = imageHave
            password4.image = imageEmputy
        case 4:
            password1.image = imageHave
            password2.image = imageHave
            password3.image = imageHave
            password4.image = imageHave
        default:
            password1.image = imageEmputy
            password2.image = imageEmputy
            password3.image = imageEmputy
            password4.image = imageEmputy
        }
    }
    func checkTrue(){
        let imageTrue = UIImage(systemName: "checkmark")
        checkImage.image = imageTrue
        checkImage.backgroundColor = UIColor.systemGreen
        
    }
    func checkFalse(){
        let imageFalse = UIImage(systemName: "xmark")
        checkImage.image = imageFalse
        checkImage.backgroundColor = UIColor.systemRed
    }
    func checkImageSetDefault(){
        let imageDefault = UIImage(systemName: "questionmark")
        checkImage.image = imageDefault
        checkImage.backgroundColor = UIColor.systemGray
    }
    
}
