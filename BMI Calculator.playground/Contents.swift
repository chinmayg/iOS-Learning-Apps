import UIKit

func calculateBMI(yourWeight : Float, yourHeight : Float) -> String {
    
    let bmi : Float = yourWeight / pow(yourHeight, 2)
    
    let shortenedBMI = String(format : "%.2f", bmi)
    
    var interpertation = ""
    
    if bmi > 25 {
         interpertation = "You are overweight."
    }
    else if bmi > 18.5 && bmi <= 25 {
       interpertation = "You are normal weight."
    }
    else {
        interpertation = "You are underweight."
    }
    
    return "Your BMI is \(shortenedBMI). \(interpertation)"
}

func calculateBMIImperialUnits(yourWeightInLB : Float, yourHeightInFeet : Float, yourHeightInInches : Float) -> String {
    
    let weightInKG = convertWeight(yourWeight: yourWeightInLB)
    let heightInMeters = convertHeight(yourHeightInFeet: yourHeightInFeet, yourHeightInInches: yourHeightInInches)
    
    return calculateBMI(yourWeight: weightInKG, yourHeight: heightInMeters)
}

func convertWeight(yourWeight : Float) -> Float {
    return yourWeight * 0.45359237
}

func convertHeight(yourHeightInFeet : Float, yourHeightInInches : Float) -> Float {
    let heightInInches = yourHeightInFeet * 12
    return (heightInInches + yourHeightInInches) * 0.0254
}

var bmiResult = calculateBMI(yourWeight: 160, yourHeight: 6)
print(bmiResult)

bmiResult = calculateBMIImperialUnits(yourWeightInLB: 160, yourHeightInFeet: 5, yourHeightInInches: 8)
print(bmiResult)

