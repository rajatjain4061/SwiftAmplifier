//
//  String.swift
//  SwiftAmplifier
//
//  Created by Rajat Jain on 15/06/17.
//  Copyright © 2017 rajatjain4061. All rights reserved.
//  Fork this repo on Github: https://github.com/rajatjain4061/SwiftAmplifier
//

import Foundation


extension String {
    
    var isPhoneNumber: Bool {
        
        do {
            
            let detector = try NSDataDetector(types: NSTextCheckingResult.CheckingType.phoneNumber.rawValue)
            
            let matches = detector.matches(in: self, options: [], range: NSMakeRange(0, self.characters.count))
            
            if let res = matches.first {
                
                return res.resultType == .phoneNumber && res.range.location == 0 && res.range.length == self.characters.count
                
            } else {
                
                return false
                
            }
            
        } catch {
            
            return false
            
        }
    }
    
    //Validate Email
    
    var isEmail: Bool {
        
        do {
            
            let regex = try NSRegularExpression(pattern: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}", options: .caseInsensitive)
            
            return regex.firstMatch(in: self, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.characters.count)) != nil
            
        } catch {
            
            return false
            
        }
        
    }
    
    func substring(_ from: Int) -> String {
        
        return self.substring(from: self.characters.index(self.startIndex, offsetBy: from))
        
    }
    
    var length: Int {
        
        return self.characters.count
        
    }
    
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    func replace(target: String, withString: String) -> String
    {
        return self.replacingOccurrences(of: target, with: withString, options: NSString.CompareOptions.literal, range: nil)
    }
    
    func toUpper() -> String {
        return self.uppercased()
    }
    
    func toLower() -> String {
        return self.lowercased()
    }
    
    /**
    Generates a random string of given length
     
    - parameter length: (Int)
    */
    func random(length: Int) -> String {
        
        let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let len = UInt32(letters.length)
        
        var randomString = ""
        
        for _ in 0 ..< length {
            let rand = arc4random_uniform(len)
            var nextChar = letters.character(at: Int(rand))
            randomString += NSString(characters: &nextChar, length: 1) as String
        }
        
        return randomString
    }
    
    /**
      extracts file extension from a string
     
    */
    func fileExtension() -> String? {
        let stringUrl = NSURL(string: self)
        
        if let urlFileExtension = stringUrl?.pathExtension?.lowercased() {
            return urlFileExtension
        } else {
            return nil
        }
    }
    
    
}
