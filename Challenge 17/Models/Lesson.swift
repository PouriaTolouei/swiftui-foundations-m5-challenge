//
//  Lesson.swift
//  Challenge 17
//
//  Created by Pouria Tolouei on 06/08/2022.
//

import Foundation

struct Lesson: Decodable, Identifiable {
    let id: Int
    let title: String
    let url: String
}
