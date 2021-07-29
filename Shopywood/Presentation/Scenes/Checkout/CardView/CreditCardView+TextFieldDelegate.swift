//
//  CreditCardView+TextFieldDelegate.swift
//  Shopywood
//
//  Created by CodergirlTM on 24.07.21.
//

import Foundation
import UIKit


extension CreditCardView: CreditCardTextFieldDelegate{
    
    func maskField(_ maskField: CreditCardTextField, shouldChangeBlock block: CreditCardTextFieldBlock, inRange range: inout NSRange, replacementString string: inout String) -> Bool {
        if maskField == cardNumberview {
            let allowedCharacters = CharacterSet(charactersIn:"0123456789")
            let characterSet = CharacterSet(charactersIn: string)
            return allowedCharacters.isSuperset(of: characterSet)
        }
        return true
    }
    
    func maskField(_ maskField: CreditCardTextField, didChangedWithEvent event: CreditCardTextFieldEvents) {
        paymentCardTextFieldDidChange(cardNumber: maskField.text)
    }
    
}
