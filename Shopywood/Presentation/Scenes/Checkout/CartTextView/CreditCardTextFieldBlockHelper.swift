//
//  CreditCardTextFieldBlockHelper.swift
//  Shopywood
//
//  Created by CodergirlTM on 24.07.21.
//

import Foundation

/// A structure that contains the block character main properties.
 struct CreditCardTextFieldBlockCharacter {
    
    //  MARK: - General
    
    /// Character index in the block.
    
     var index: Int
    
    /// The block index in the mask.
    
     var blockIndex: Int
    
    /// Current character status.
    
    var status: CreditCardTextFieldStatus
    
    //  MARK: - Pattern
    
    /// The mask pattern character.
    
     var pattern: CreditCardTextFieldPattern!
    
    /// Location of the pattern character in the mask.
    
     var patternRange: NSRange
    
    //  MARK: - Mask template
    
    /// The mask template character.
    
     var template: Character!
    
    /// Location of the mask template character in the mask template.
    
    var templateRange: NSRange
}


struct CreditCardTextFieldBraces {
    
    let left, right: Character
}

enum CreditCardTextFieldEvents {
    case error, insert, delete ,replace
}


enum CreditCardTextFieldStatus {
    
    case clear, incomplete, complete
}
