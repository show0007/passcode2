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
    
    @IBAction func btn1(_ sender: UIButton) {
        inputPasscode(input:"1")
    }
    @IBAction func btn2(_ sender: UIButton) {
        inputPasscode(input:"2")
    }
    
    @IBAction func btn3(_ sender: UIButton) {
        inputPasscode(input:"3")
    }
    
    @IBAction func btn4(_ sender: UIButton) {
        inputPasscode(input:"4")
    }
    
    @IBAction func btn5(_ sender: UIButton) {
        inputPasscode(input:"5")
    }
    
    @IBAction func btn6(_ sender: UIButton) {
        inputPasscode(input:"6")
    }
    
    @IBAction func btn7(_ sender: UIButton) {
        inputPasscode(input:"7")
    }
    
    @IBAction func btn8(_ sender: UIButton) {
        inputPasscode(input:"8")
    }
    
    @IBAction func btn9(_ sender: UIButton) {
        inputPasscode(input:"9")
    }
    
    @IBAction func btn0(_ sender: UIButton) {
        inputPasscode(input:"0")
    }
    
    @IBAction func btnDelete(_ sender: UIButton) {
        if 1...3 ~= inputPasscodeStr.count{
            inputPasscodeStr.removeLast()
        }
        showImage()
        
//        print(inputPasscodeStr)
    }
    @IBAction func btnReload(_ sender: UIButton) {
//        print(inputPasscodeStr.count)
        reload()
    }
    func inputPasscode(input:String){
        if 0...3 ~= inputPasscodeStr.count{
            inputPasscodeStr += input
        }
        if inputPasscodeStr.count == 4 {
            if inputPasscodeStr == passwordStr{
//            print("Pass")
                checkTrue()
            }else{
                reload()
                checkFalse()
            }
        }
        showImage()
//        print(inputPasscodeStr)
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
        let imageTrue = UIImage(systemName: "person.fill.checkmark")
        checkImage.image = imageTrue
        checkImage.backgroundColor = UIColor.systemGreen
        
    }
    func checkFalse(){
        let imageFalse = UIImage(systemName: "person.fill.xmark")
        checkImage.image = imageFalse
        checkImage.backgroundColor = UIColor.systemRed
    }
    func checkImageSetDefault(){
        let imageDefault = UIImage(systemName: "person.fill.questionmark")
        checkImage.image = imageDefault
        checkImage.backgroundColor = UIColor.systemGray
    }
    
}
