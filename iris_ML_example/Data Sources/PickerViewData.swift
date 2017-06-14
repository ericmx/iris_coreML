//
//  PickerViewData.swift
//  iris_ML_example
//
//  Created by Eric May on 6/14/17.
//  Copyright © 2017 ericmay. All rights reserved.
//
import UIKit

class PickerViewData: NSObject, UIPickerViewDelegate, UIPickerViewDataSource {
    private let sepalLength = SepalLength()
    private let sepalWidth = SepalWidth()
    private let petalLength = PetalLength()
    private let petalWidth = PetalWidth()
    
    func title(for row: Int, feature: Feature) -> String? {
        switch feature {
            case.septallength: return sepalLength.title(for: row)
            case.septalwidth: return sepalWidth.title(for: row)
            case.petallength: return petalLength.title(for: row)
            case.petalwidth: return petalWidth.title(for: row)
        }
    }
    
    func value(for row: Int, feature: Feature) -> Double {
        let value: Double?
        
        switch feature {
            case.septallength: value = sepalLength.value(for:row)
            case.septalwidth: value = sepalWidth.value(for: row)
            case.petallength: value = petalLength.value(for: row)
            case.petalwidth: value = petalWidth.value(for: row)
        }
        return value!
    }
    
    @available(iOS 2.0, *)
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 4
    }
    
        /// Find the count of each column of the picker.
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch Feature(rawValue: component)! {
            case.septallength: return sepalLength.items
            case.septalwidth: return sepalWidth.items
            case.petallength: return petalLength.items
            case.petalwidth: return petalWidth.items
            }
        }
}

