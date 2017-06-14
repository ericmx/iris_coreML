//
//  ViewControllerPickerViewDelegate.swift
//  iris_ML_example
//
//  Created by Eric May on 6/14/17.
//  Copyright © 2017 ericmay. All rights reserved.
//

import UIKit

extension ViewController: UIPickerViewDelegate {
    // MARK: - UIPickerViewDelegate
    
    /// When values are changed, update the predicted price.
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        updatePredictedIris()
    }
    
    /// Accessor for picker values.
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        guard let feature = Feature(rawValue: component) else {
            fatalError("Invalid component \(component) found to represent a \(Feature.self). This should not happen based on the configuration set in the storyboard.")
        }
        
        return pickerDataSource.title(for: row, feature: feature)
    }
}

