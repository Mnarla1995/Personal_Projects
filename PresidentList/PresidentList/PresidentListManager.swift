//
//  PresidentListManager.swift
//  PresidentList
//
//  Created by Kalebu Patan on 4/15/24.
//

import Foundation

@Observable
class PresidentListManager {
    
    private var presidentsList: Presidents?
    
    init() {
        self.getPresident()
    }
    
    private func getPresident() {
        let sourceURL = Bundle.main.url(forResource: K.presidentPath, withExtension: K.presidentExt)
        let data = try! Data(contentsOf: sourceURL!)
        let decoder = PropertyListDecoder()
        presidentsList =  try! decoder.decode(Presidents.self, from: data)
    }
    
    func getPresidentsList() -> [President] {
        presidentsList?.presidents ?? []
    }
}
