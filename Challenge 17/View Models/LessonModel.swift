//
//  LessonModel.swift
//  Challenge 17
//
//  Created by Pouria Tolouei on 06/08/2022.
//

import Foundation
import SwiftUI

class LessonModel {
    
    var lessons = [Lesson]()
    
    init() {
        getRemoteData()
    }
    
    func getRemoteData() {
        
        let urlString = "https://codewithchris.github.io/Module5Challenge/Data.json"
        let jsonUrl = URL(string: urlString)
        
        if let url = jsonUrl {
            
            URLSession.shared.dataTask(with: url) { data, urlResponse, error in
                
                if error == nil {
                    return
                }
                
                let decoder = JSONDecoder()
                
                do {
                    self.lessons = try decoder.decode([Lesson].self, from: data!)
                }
                catch {
                    print(error)
                }
                
            }
        }
        
    }
}
