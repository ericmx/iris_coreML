//
//  ViewController.swift
//  iris_ML_example
//
//  Created by Eric May on 6/13/17.
//  Copyright © 2017 ericmay. All rights reserved.
//

import UIKit
import CoreML

class ViewController: UIViewController {
    let model = Iris()
    let pickerDataSource = PickerViewData()
    
    @IBOutlet weak var irisLabel: UILabel!
    
    @IBOutlet weak var pickerView: UIPickerView! {
        didSet {
            pickerView.delegate = self
            pickerView.dataSource = pickerDataSource
            
            let features: [Feature] = [.septallength, .septalwidth, .petallength, .petalwidth]
            
            for feature in features {
                pickerView.selectRow(3, inComponent: feature.rawValue, animated: false)
            }
        }
    }
    override func viewDidLoad() {
            super.viewDidLoad()
            updatePredictedIris()
        }
    func updatePredictedIris() {
        func selectedRow(for feature: Feature) -> Int {
            return pickerView.selectedRow(inComponent: feature.rawValue)
        }
        
        let septalLength = pickerDataSource.value(for: selectedRow(for: .septallength), feature: .septallength)
        let septalWidth = pickerDataSource.value(for: selectedRow(for: .septalwidth), feature: .septalwidth)
        let petalLength = pickerDataSource.value(for: selectedRow(for: .petallength), feature: .petallength)
        let petalWidth = pickerDataSource.value(for: selectedRow(for: .petalwidth), feature: .petalwidth)
        
        guard let irisClassificationOutput = try? model.prediction(septal_length: septalLength, septal_width: septalWidth, petal_length: petalLength, petal_width: petalWidth) else {
            fatalError("Unexpected run time error during irisClassificationOutput prediction method")
        }
        let irisClassification = irisClassificationOutput.classification
            irisLabel.text = String(irisClassification)
    }
    
}




