//
//  StateJSON.swift
//  ParsingJSON
//
//  Created by Дмитрий Рузайкин on 28.08.2021.
//

import Foundation

struct StateJSON: Decodable {
    let postId: Int
    let name: String
    let email: String
    let body: String
}
