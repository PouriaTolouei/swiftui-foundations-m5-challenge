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
            
            VStack {
                
                List {
                    
                    ForEach(model.lessons) { lesson in
                        
                        NavigationLink(tag: lesson.id, selection: $model.selectedLessonIndex) {
                            
                            LessonView()
                            
                        } label: {
                            
                            Text(lesson.title)
                            
                        }

                        
                    }
                }
                .navigationTitle("All Vidoes")
            }
        }
    }
}

struct LessonListView_Previews: PreviewProvider {
    static var previews: some View {
        LessonListView()
            .environmentObject(LessonModel())
    }
}
