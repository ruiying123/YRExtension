//
//  File.swift
//  YRExtension
//
//  Created by 杨锐 on 2016/12/26.
//  Copyright © 2016年 yang. All rights reserved.
//

import Foundation

public extension String {
    
    /// 电话号码中间加字符(默认插入空格)
    ///
    /// - Returns: new string
    @discardableResult public func addChar(char: String = " ") -> String {
        let mobile = NSMutableString(string: self)
        for i in 0..<2 {
            mobile.insert(char, at: 5*i+3)
        }
        return mobile as String
    }
    
    /// 在指定的位置插入字符串
    ///
    /// - Parameters:
    ///   - aString: 插入的字符串
    ///   - index: 插入的位子
    /// - Returns: 返回新的字符串
    @discardableResult public func insert(aString: String, at index: Int) -> String {
        let string = NSMutableString(string: self)
        string.insert(aString, at: index)
        return string as String
    }
    
    /// 验证字符串是否是身份证号
    ///
    /// - Returns:
    public func checkIDNumber() -> Bool {
        let idRegex = "^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}([0-9]|X)$"
        let identifyCardPredicate: NSPredicate = NSPredicate(format: "SELF MATCHES %@", idRegex)
        return identifyCardPredicate.evaluate(with: self)
    }
    
}
