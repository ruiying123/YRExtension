//
//  DateExtension.swift
//  YRExtension
//
//  Created by 杨锐 on 2016/12/27.
//  Copyright © 2016年 yang. All rights reserved.
//

import Foundation

extension Date {
    
    /// 转换为字符串
    ///
    /// - Parameter formatter: DateFormatter
    /// - Returns: string
    func toDateString(formatter: String) -> String {
        let dateFmt = DateFormatter()
        dateFmt.timeZone = TimeZone.current
        dateFmt.dateFormat = formatter
        return dateFmt.string(from: self)
    }
}
