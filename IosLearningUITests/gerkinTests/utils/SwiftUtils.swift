//
//  SwiftUtils.swift
//  IosLearningUITests
//
//  Created by admin on 03/06/2019.
//  Copyright © 2019 Cluj Testing Community. All rights reserved.
//

import Foundation

class SwiftUtils  {
    
    
    /// Function to generate a random string
    ///
    /// - Parameter length: lenght of desired string
    /// - Returns: returns the new created string
    func randomString(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<length).map{ _ in letters.randomElement()! })
    }
    
    func generateRandomStringWithLength(length: Int) -> String {
        var randomString = ""
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        
        for _ in 1...length {
            let randomIndex  = Int(arc4random_uniform(UInt32(letters.count)))
            let a = letters.index(letters.startIndex, offsetBy: randomIndex)
            randomString +=  String(letters[a])
        }
        return randomString
    }
    
    
    /// Function to read from a file
    ///
    /// - Parameter filePath: Local path to used file
    /// - Returns: Returns the value inside of the file
    func readFile(_ filePath: String) -> String {
        var text = ""
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent(filePath)
            do {
                text = try String(contentsOf: fileURL, encoding: .utf8)
            }
            catch {/* error handling here */}
        }
        return text
    }
    
    
    /// Function to write to a File
    ///
    /// - Parameters:
    ///   - text: Text to br written in File
    ///   - filePath: Path to the file
    ///   - notClean: Bool to set if is needed to clean or not the file
    func write(text: String, _ filePath: String, notClean: Bool) {
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent(filePath)
            do {
                try text.write(to: fileURL, atomically: notClean, encoding: .utf8)
            }
            catch {/* error handling here */}
        }
    }
    
}
