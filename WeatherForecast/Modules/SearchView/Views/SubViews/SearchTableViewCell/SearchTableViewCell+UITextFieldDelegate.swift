//
//  SearchTableViewCell+UITextFieldDelegate.swift
//  WeatherForecast
//
//  Created by Prabakaran on 22/05/22.
//

import Foundation
import UIKit
extension SearchTableViewCell: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
    }
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        let textFieldTag: Int = textField.tag
        var inputValue = ""
        if textField.text!.isEmpty {
            textField.textColor = UIColor.lightGray
        } else {
            inputValue = textField.text!
        }
        inputTextFieldChanged(inputValue, textFieldTag)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let textFieldTag: Int = textField.tag
        if string == "\n" {
            textField.resignFirstResponder()
            return false
        }
        let newText = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        guard newText.count<=10 else {
            return false
        }
        inputTextFieldChanged(newText, textFieldTag)
        return true
    }
}
