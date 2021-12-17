//
//  Question.swift
//  Question
//
//  Created by 王昱淇 on 2021/8/31.
//

import Foundation
import UIKit
import CodableCSV

struct Question: Codable {
    let question: String
    let rightAnswer: String
    let optionA: String
    let optionB: String
    let optionC: String
    let optionD: String
    
}

extension Question {
    static var data: [Self] {
        var array = [Self]()
        if let data = NSDataAsset(name: "EnglishQuestion")?.data {
            let decoder = CSVDecoder {
                $0.headerStrategy = .firstLine
            }
            do {
                array = try decoder.decode([Self].self, from: data)
            } catch {
                print(error)
            }
        }
        return array
    }
}

