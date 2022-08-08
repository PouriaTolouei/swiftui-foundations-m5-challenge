//
//  LessonModel.swift
//  Challenge 17
//
//  Created by Pouria Tolouei on 06/08/2022.
//

import Foundation
import SwiftUI

class LessonModel: ObservableObject {
    
    @Published var lessons = [Lesson]()
    @Published var selectedLessonId: Int?
    
    @Published var currentLesson: Lesson?
    var lessonIndex = 0
    
    init() {
        getRemoteData()
    }
    
    // Fetches remote json data from a github page
    func getRemoteData() {
        
        // Data remote source
        let urlString = "https://codewithchris.github.io/Module5Challenge/Data.json"
        
        // Creates a URL object
        let jsonUrl = URL(string: urlString)
        
        // Makes sure the URL object is set
        if let url = jsonUrl {
            
            URLSession.shared.dataTask(with: url) { data, urlResponse, error in
                
                // Makes sure there are no errors
                if error != nil {
                    return
                }
                
                // Creates a decoder
                let decoder = JSONDecoder()
                
                do {
                    
                    // Decodes the remote data into a lessons array
                    let lessonData = try decoder.decode([Lesson].self, from: data!)
                    
                    DispatchQueue.main.async {
                        
                        // Adds the lessons array to lessons property
                        self.lessons += lessonData
                    }
                }
                // Shows error when decoding fails
                catch {
                    print(error)
                }
                
            }.resume()
        }
    }
    
    // Sets the current lesson so that the appropriate lesson can be shown in the lesson view
    func beginLesson(_ lessonIndex: Int) {
        
        // Loops through the lessons
        for index in 0..<lessons.count {
            
            // Finds the matching lesson index
            if index == lessonIndex {
                
                // Sets the current lesson and lesson index properties
                self.lessonIndex = lessonIndex
                currentLesson = lessons[self.lessonIndex]
                
                return
            }
            
        }
    }
}
