//
//  LessonView.swift
//  Challenge 17
//
//  Created by Pouria Tolouei on 06/08/2022.
//

import SwiftUI
import AVKit

struct LessonView: View {
    
    @EnvironmentObject var model: LessonModel
    
    // Shows "next" or "finished" depending on the current lesson
    var buttonText: String {
        
        // Not the last lesson
        if model.currentLesson?.id ?? 0 < model.lessons.count {
            return "Next"
        }
        // Last lesson
        else {
            return "Finish"
        }
    }
    
    var body: some View {
        
        GeometryReader { geo in
            
            // Makes sure the current lesson is set
            if model.currentLesson != nil {
            
                VStack(spacing: 100) {
                    
                    // Title and video player
                    VStack(alignment: .leading, spacing: 80) {
                        
                        Text(model.currentLesson!.title)
                            .bold()
                            .font(.title)
                            .frame(height: geo.size.height / 5)
                        
                        // Makes sure URL object can be created
                        if let videoUrl = URL(string: model.currentLesson!.url) {
                            
                            VideoPlayer(player: AVPlayer(url: videoUrl))
                                .frame(height: (geo.size.width - 20) / (16/9))
                        }
                    }
                    
                    // Navigation button
                    ZStack {
                    
                        Rectangle()
                            .frame(width: geo.size.width / 3, height: geo.size.height / 15)
                            .foregroundColor(.black)
                            .cornerRadius(15)
                        
                        Button {
                            if buttonText == "Next" {
                                model.lessonIndex += 1
                                model.currentLesson = model.lessons[model.lessonIndex]
                            }
                            else {
                                model.selectedLessonId = nil
                            }
                        } label: {
                            Text(buttonText)
                                .foregroundColor(.white)
                        }
                    }
                }
                
                .padding(.all, 10)
            }
        }
        .navigationBarTitleDisplayMode(.inline)

//        // In case current lesson isn't set properly
//        else {
//
//            ProgressView()
//        }
    }
}
