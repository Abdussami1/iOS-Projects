//
//  CaculatorBrain.swift
//  BMI Calculator
//
//  Created by Macbook on 03/07/25.
//  Copyright © 2025 Angela Yu. All rights reserved.
//

import UIKit

struct CaculatorBrain{
    
    var bmi: BMI?
    
    mutating func calculateBMI(height: Float, weight: Float){
        let bmiValue = weight / (height*height)
        if bmiValue<18.5{
            bmi = BMI(value: bmiValue, advice: "Eat more pies!", color: .blue)
        }else if bmiValue<24.9{
            bmi = BMI(value: bmiValue, advice: "Fit as a fiddle", color: .green)
        }else{
            bmi = BMI(value: bmiValue, advice: "Eat less pies!", color: .red)
        }
    }
    
    func getBMIValue()->String{
        let bmiString = String(format: "%.1f",bmi?.value ?? 0.0)
        return bmiString
    }
    
    func getAdvice()-> String{
        return bmi?.advice ?? "No Advice"
    }
    
    func getColor()->UIColor{
        return bmi?.color ?? .white
    }
}
