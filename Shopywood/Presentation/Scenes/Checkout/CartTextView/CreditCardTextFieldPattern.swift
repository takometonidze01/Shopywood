//
//  CreditCardTextFieldPattern.swift
//  Shopywood
//
//  Created by CodergirlTM on 24.07.21.
//

enum CreditCardTextFieldPattern: String {
    
    //  MARK: - Constants
    
    case NumberDecimal = "d"
    case NonDecimal    = "D"
    case NonWord       = "W"
    case Alphabet      = "a"
    case AnyChar       = "."
    
    /// Returns regular expression pattern.
    
    func pattern() -> String {
        switch self {
        case .NumberDecimal   : return "\\d"
        case .NonDecimal      : return "\\D"
        case .NonWord         : return "\\W"
        case .Alphabet        : return "[a-zA-Z]"
        default               : return "."
        }
    }
}
