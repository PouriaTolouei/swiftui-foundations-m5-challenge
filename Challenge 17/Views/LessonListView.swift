//
//  LessonListView.swift
//  Challenge 17
//
//  Created by Pouria Tolouei on 06/08/2022.
//

import SwiftUI
import AVFoundation

struct LessonListView: View {
    
    @EnvironmentObject var model: LessonModel
    
    @State private var searchText = ""
    
    var searchResults: [Lesson] {
        if searchText.isEmpty {
            return model.lessons
        }
        else {
            return model.lessons.filter { lesson in
                lesson.title.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    var body: some View {
        
        NavigationView {
     
            List {
                
                ForEach(searchResults) { lesson in
                    
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
            .searchable(text: $searchText)
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
