//
//  President.swift
//  PresidentList
//
//  Created by Kalebu Patan on 4/15/24.
//

import Foundation

struct Presidents: Codable {
    var presidents: [President]?
}

struct President: Codable, Identifiable, Hashable {
    var id = UUID()
    var name: String?
    var url: String?
    enum CodingKeys: CodingKey {
        case name
        case url
    }
}
