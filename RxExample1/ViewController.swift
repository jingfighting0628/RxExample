//
//  ViewController.swift
//  RxExample1
//
//  Created by liuningbo on 2021/12/3.
//

import UIKit
import RxCocoa
import RxSwift
import SnapKit
class ViewController: UIViewController {
    var number1 :UITextField!
    var number2 :UITextField!
    var number3 :UITextField!
    var result  :UILabel!
    var separator :UIView!
    var pluseLab :UILabel!
    var disposedBag = DisposeBag()
    
    var userName :UILabel!
    var userNameOutlet :UITextField!
    var password :UILabel!
    var passwordOutlet :UITextField!
    var userNameValidOutlet :UILabel!
    var passwordValidOutlet :UILabel!
    var doSomeThing :UIButton!
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        //self.numbers()
        
        
        self.simpleValidation()
        
        
    }

    func numbers() -> Void {
        self.number1 = UITextField.init()
        //self.number1.backgroundColor = UIColor.red
        self.number1.borderStyle = UITextField.BorderStyle.roundedRect;
        self.number1.keyboardType = UIKeyboardType.decimalPad
        self.view.addSubview(self.number1)
        self.number2 = UITextField.init()
        self.number2.keyboardType = UIKeyboardType.decimalPad
        self.number2.borderStyle = UITextField.BorderStyle.roundedRect
        self.view.addSubview(self.number2)
        self.number3 = UITextField.init()
        self.number3.keyboardType = UIKeyboardType.decimalPad
        self.number3.borderStyle = UITextField.BorderStyle.roundedRect
        self.view.addSubview(self.number3)
        self.separator = UIView.init()
        self.separator.backgroundColor = UIColor.lightGray
        self.view.addSubview(self.separator)
        
        self.pluseLab = UILabel.init()
        self.pluseLab.text = "+"
        self.pluseLab.textColor = UIColor.black
        self.pluseLab.font = UIFont.systemFont(ofSize: 16)
        self.view.addSubview(self.pluseLab)
    
        
        
        self.result = UILabel.init()
        self.view.addSubview(self.result)
        
        self.number1.snp.makeConstraints { (make) in
            make.left.equalTo(self.view).offset(123)
            make.top.equalTo(self.view).offset(220)
            make.height.equalTo(30)
            make.width.equalTo(97)
        }
        self.number2.snp.makeConstraints { (make) in
            make.left.height.width.equalTo(self.number1)
            make.top.equalTo(self.number1.snp.bottom).offset(8)
        }
        self.number3.snp.makeConstraints { (make) in
            make.left.height.width.equalTo(self.number1)
            make.top.equalTo(self.number2.snp.bottom).offset(8)
        }
        self.separator.snp.makeConstraints { (make) in
            make.top.equalTo(self.number3.snp.bottom).offset(8)
            make.width.equalTo(116)
            make.height.equalTo(1)
            make.left.equalTo(104)
        }
        self.pluseLab.snp.makeConstraints { (make) in
            make.left.equalTo(self.separator)
            make.width.equalTo(11)
            make.height.equalTo(20.5)
            make.top.equalTo(301.5)
        }
        self.result.snp.makeConstraints { (make) in
            make.top.equalTo(self.separator.snp.bottom).offset(8)
            make.width.equalTo(106)
            make.left.equalTo(self.number1)
            make.height.equalTo(30)
        }
        //combineLatest由多个可观测的值组成，并且当其中一个可观测的值发出数据时，combineLatest将其组合起来，并订阅到结果
        Observable.combineLatest(self.number1.rx.text.orEmpty,self.number2.rx.text.orEmpty,self.number3.rx.text.orEmpty){
            value1,valu2,valu3 -> Double in
            
//            let num1 = NSDecimalNumber(string: value1 )
//            let num2 = NSDecimalNumber(string: valu2 )
//            let num3 = NSDecimalNumber(string: valu3 )
//            let result = num1.adding(num2).doubleValue
            
            return (Double(value1) ?? 0) + (Double(valu2) ?? 0) + (Double(valu3) ?? 0)
        }
        .map {$0.description}
        .bind(to: self.result.rx.text)
        .disposed(by:disposedBag)
    }
    
    
    func simpleValidation() -> Void {
        
        self.userName = UILabel.init()
        self.userName.font = UIFont.systemFont(ofSize: 16)
        self.userName.textAlignment = NSTextAlignment.left
        self.userName.textColor = UIColor.black
        self.userName.text = "UserName"
        //self.userName.backgroundColor = UIColor.red
        self.view.addSubview(self.userName)
        
        self.userNameOutlet = UITextField.init()
        self.userNameOutlet.borderStyle = UITextField.BorderStyle.roundedRect
        self.view.addSubview(self.userNameOutlet)
        
        
        self.userName.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.snp.top).offset(64)
            make.width.equalTo(374)
            make.height.equalTo(20.5)
            make.left.equalTo(self.view).offset(0.5)
        }
        
    }
    
}



