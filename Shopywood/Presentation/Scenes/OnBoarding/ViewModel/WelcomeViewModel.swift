//
//  WelcomeViewModel.swift
//  Shopywood
//
//  Created by CodergirlTM on 18.07.21.
//

import Foundation
struct WelcomeViewModel : Codable{
    
    // MARK: - Private properties
    private var infos: OnBoarding
    
    init(infos: OnBoarding) {
        self.infos = infos
        
    }
    
    var image: URL? {
        URL(string: infos.image ?? "")
    }
    
    var text: String {
        infos.text ?? ""
    }
    
    var secondText: String {
        infos.secondText ?? ""
    }
}
