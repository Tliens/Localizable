//
//  ViewController.swift
//  LocalString
//
//  Created by 2020 on 2021/2/8.
//

import UIKit

class ViewController: UIViewController {

    let lb = UILabel()
    let imgV = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()

        /// 切换到en语言包
        Language.shared.switch(.en)
        
        /// 文本
        lb.text = R.string("login_name_placeholder")
        
        /// 图片资源
        imgV.image = R.img("remote-team")
        
    }
    
}

extension ViewController{
    func setupUI(){
        lb.textColor = .black
        lb.font = .boldSystemFont(ofSize: 30)
        lb.textAlignment = .center
        imgV.contentMode = .scaleAspectFit
        lb.frame = CGRect(x: 10, y: 100, width: 300, height: 100)
        lb.center.x = view.center.x
        imgV.frame = CGRect(x: 10, y: 300, width: 300, height: 300)
        imgV.center.x = view.center.x
        view.addSubview(lb)
        view.addSubview(imgV)
    }
}
