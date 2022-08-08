//
//  LessonListView.swift
//  Challenge 17
//
//  Created by Pouria Tolouei on 06/08/2022.
//

import SwiftUI

struct LessonListView: View {
    
    @EnvironmentObject var model: LessonModel
    
    var body: some View {
        
        NavigationView {
     
            List {
                
                ForEach(model.lessons) { lesson in
                    
                    NavigationLink(tag: lesson.id, selection: $model.selectedLessonId) {
                        
                        LessonView()
                            .onAppear {
                                model.beginLesson(lesson.id - 1)
                            }
                        
                    } label: {
                        
                        // Lesson list row
                        Text(lesson.title)
                            .padding(.vertical)
                        
                    }
                }
            }
            .navigationTitle("All Videos")
            .onChange(of: model.selectedLessonId) { newValue in
                
                // Makes sure current lesson is reset when lesson is changed or exited
                model.currentLesson = nil
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct LessonListView_Previews: PreviewProvider {
    static var previews: some View {
        LessonListView()
            .environmentObject(LessonModel())
    }
}
