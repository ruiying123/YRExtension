//
//  YRDevice.swift
//  YRExtension
//
//  Created by kilrae on 2019/9/9.
//  Copyright © 2019 yang. All rights reserved.
//

import Foundation
import UIKit

fileprivate let mainWidth: CGFloat = UIScreen.main.bounds.size.width;
fileprivate let mainHeight: CGFloat = UIScreen.main.bounds.size.height;


public class YRDevice {
  
  /// 获取状态栏高度
  public static func getStatusHeight() -> CGFloat {
    return UIApplication.shared.statusBarFrame.height;
  }
  
  /// 获取状态栏+导航栏的高度
  public static func getNavAndStatusHeight() -> CGFloat {
    return 44 + YRDevice.getStatusHeight();
  }
  
  /// 是否是刘海屏
  public static func isIphoneX() -> Bool {
    let size = YRDevice.size();
    switch size {
    case .screen6_1Inch, .screen6_5Inch, .screen5_8Inch:
      return true;
    default:
      return false;
    }
  }
  
  /// 获取Tabbar高度
  public static func getTabbarHeight() -> CGFloat {
    if YRDevice.isIphoneX() == true {
      return 83;
    }
    return 64;
  }
}

extension YRDevice {
  static fileprivate func getVersionCode() -> String {
    var systemInfo = utsname()
    uname(&systemInfo)
    
    let versionCode: String = String(validatingUTF8: NSString(bytes: &systemInfo.machine, length: Int(_SYS_NAMELEN), encoding: String.Encoding.ascii.rawValue)!.utf8String!)!
    
    return versionCode
  }
}

/// Version
extension YRDevice {
  
  public enum YRVersion: String {
    /*** iPhone ***/
    case iPhone4
    case iPhone4S
    case iPhone5
    case iPhone5C
    case iPhone5S
    case iPhone6
    case iPhone6Plus
    case iPhone6S
    case iPhone6SPlus
    case iPhoneSE
    case iPhone7
    case iPhone7Plus
    case iPhone8
    case iPhone8Plus
    case iPhoneX
    case iPhoneXS
    case iPhoneXS_Max
    case iPhoneXR
    
    /*** iPad ***/
    case iPad1
    case iPad2
    case iPad3
    case iPad4
    case iPad5
    case iPad6
    case iPadAir
    case iPadAir2
    case iPadMini
    case iPadMini2
    case iPadMini3
    case iPadMini4
    case iPadPro9_7Inch
    case iPadPro10_5Inch
    case iPadPro12_9Inch
    
    /*** iPod ***/
    case iPodTouch1Gen
    case iPodTouch2Gen
    case iPodTouch3Gen
    case iPodTouch4Gen
    case iPodTouch5Gen
    case iPodTouch6Gen
    
    /*** simulator ***/
    case simulator
    
    /*** unknown ***/
    case unknown
  }
  
  static public func version() -> YRVersion {
    return getVersion(code: getVersionCode())
  }
  
  static fileprivate func getVersion(code: String) -> YRVersion {
    switch code {
      /*** iPhone ***/
    case "iPhone3,1", "iPhone3,2", "iPhone3,3":     return .iPhone4
    case "iPhone4,1", "iPhone4,2", "iPhone4,3":     return .iPhone4S
    case "iPhone5,1", "iPhone5,2":                 return .iPhone5
    case "iPhone5,3", "iPhone5,4":                 return .iPhone5C
    case "iPhone6,1", "iPhone6,2":                 return .iPhone5S
    case "iPhone7,2":                            return .iPhone6
    case "iPhone7,1":                            return .iPhone6Plus
    case "iPhone8,1":                            return .iPhone6S
    case "iPhone8,2":                            return .iPhone6SPlus
    case "iPhone8,3", "iPhone8,4":                 return .iPhoneSE
    case "iPhone9,1", "iPhone9,3":                 return .iPhone7
    case "iPhone9,2", "iPhone9,4":                 return .iPhone7Plus
    case "iPhone10,1", "iPhone10,4":               return .iPhone8
    case "iPhone10,2", "iPhone10,5":               return .iPhone8Plus
    case "iPhone10,3", "iPhone10,6":               return .iPhoneX
    case "iPhone11,2":                           return .iPhoneXS
    case "iPhone11,4", "iPhone11,6":               return .iPhoneXS_Max
    case "iPhone11,8":                           return .iPhoneXR
      
      
      /*** iPad ***/
    case "iPad1,1", "iPad1,2":                    return .iPad1
    case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4": return .iPad2
    case "iPad3,1", "iPad3,2", "iPad3,3":           return .iPad3
    case "iPad3,4", "iPad3,5", "iPad3,6":           return .iPad4
    case "iPad6,11", "iPad6,12":                   return .iPad5
    case "iPad7,5", "iPad 7,6":                    return .iPad6
    case "iPad4,1", "iPad4,2", "iPad4,3":           return .iPadAir
    case "iPad5,3", "iPad5,4":                     return .iPadAir2
    case "iPad2,5", "iPad2,6", "iPad2,7":           return .iPadMini
    case "iPad4,4", "iPad4,5", "iPad4,6":           return .iPadMini2
    case "iPad4,7", "iPad4,8", "iPad4,9":           return .iPadMini3
    case "iPad5,1", "iPad5,2":                     return .iPadMini4
    case "iPad6,7", "iPad6,8", "iPad7,1", "iPad7,2":  return .iPadPro12_9Inch
    case "iPad7,3", "iPad7,4":                       return .iPadPro10_5Inch
    case "iPad6,3", "iPad6,4":                       return .iPadPro9_7Inch
      
      /*** iPod ***/
    case "iPod1,1":                                  return .iPodTouch1Gen
    case "iPod2,1":                                  return .iPodTouch2Gen
    case "iPod3,1":                                  return .iPodTouch3Gen
    case "iPod4,1":                                  return .iPodTouch4Gen
    case "iPod5,1":                                  return .iPodTouch5Gen
    case "iPod7,1":                                  return .iPodTouch6Gen
      
      /*** Simulator ***/
    case "i386", "x86_64":                           return .simulator
      
    default:                                         return .unknown
    }
  }
}

/// Size
extension YRDevice {
  
  public enum YRSize: Int, Comparable {
    case unknownSize = 0
    /// iPhone 4, 4s, iPod Touch 4th gen.
    case screen3_5Inch
    /// iPhone 5, 5s, 5c, SE, iPod Touch 5-6th gen.
    case screen4Inch
    /// iPhone 6, 6s, 7, 8
    case screen4_7Inch
    /// iPhone 6+, 6s+, 7+, 8+
    case screen5_5Inch
    /// iPhone X, Xs
    case screen5_8Inch
    /// iPhone Xr
    case screen6_1Inch
    /// iPhone Xs Max
    case screen6_5Inch
    /// iPad Mini
    case screen7_9Inch
    /// iPad
    case screen9_7Inch
    /// iPad Pro (10.5-inch)
    case screen10_5Inch
    /// iPad Pro (12.9-inch)
    case screen12_9Inch
  }
  
  
  static public func size() -> YRSize {
    let screenHeight: CGFloat = max(mainWidth, mainHeight)

    switch screenHeight {
    case 480:
      return .screen3_5Inch
    case 568:
      return .screen4Inch
    case 667:
      return UIScreen.main.scale == 3.0 ? .screen5_5Inch : .screen4_7Inch
    case 736:
      return .screen5_5Inch
    case 812:
      return .screen5_8Inch
    case 896:
      switch version() {
      case .iPhoneXS_Max:
        return .screen6_5Inch
      default:
        return .screen6_1Inch
      }
    case 1024:
      switch version() {
      case .iPadMini,.iPadMini2,.iPadMini3,.iPadMini4:
        return .screen7_9Inch
      case .iPadPro10_5Inch:
        return .screen10_5Inch
      default:
        return .screen9_7Inch
      }
    case 1112:
      return .screen10_5Inch
    case 1366:
      return .screen12_9Inch
    default:
      return .unknownSize
    }
  }
}

public func <(lhs: YRDevice.YRSize, rhs: YRDevice.YRSize) -> Bool {
  return lhs.rawValue < rhs.rawValue
}

public func ==(lhs: YRDevice.YRSize, rhs: YRDevice.YRSize) -> Bool {
  return lhs.rawValue == rhs.rawValue
}


