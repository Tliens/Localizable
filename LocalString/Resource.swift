//
//  Resource.swift
//  LocalString
//
//  Created by 2020 on 2021/2/8.
//

import Foundation
import UIKit

public typealias R = Resource

public struct Resource {
    
    static func string(_ key:String, _ desc:String = "")->String{
        return Language.shared.bundle.localizedString(forKey: key, value: desc, table: "")
    }
    static func img(_ key:String)->UIImage?{
        return UIImage(named: key)
    }
}

public enum LanguageType:String{
    case en = "en"
    case jp = "ja"
    case zhhans = "zh-Hans"
}

public class Language{
    public static let shared = Language()
    private init(){}
    public var bundle = Bundle.main
    
    public func `switch`(_ type:LanguageType){
        /// 如果是组件化：获取国际化文案所在的bundle
        //  bundle = Language.bundle(class: ViewController.self, name: "AppModule")!
        
        // 本demo非组件化示例 bundle为 Bundle.main
        let bundle = Bundle.main
        
        let path = bundle.path(forResource: type.rawValue, ofType: "lproj")
        
        self.bundle = Bundle.init(path: path!)!
        
    }
    
    
    /// 组件化时 Class为组件中任意一个Class name 为组件的名字
    static func bundle(`class`: AnyClass, name: String)-> Bundle? {
        /// 当前的包
        var bundle: Bundle? = Bundle.main
        if let path = Bundle.init(for: `class`).path(forResource: name, ofType: "bundle") {
            bundle = Bundle.init(path: path)
        }
        return bundle
    }
}
