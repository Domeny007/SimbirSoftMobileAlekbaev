//
//  ViewController.swift
//  SimbirSoftTasksAlekbaev
//
//  Created by Азат Алекбаев on 09.07.2020.
//  Copyright © 2020 Азат Алекбаев. All rights reserved.
//

import UIKit
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK:- First task
        let a = 5.0
        let b = 6.0
        print(averageCount(firstNumber: a, secondNumber: b))
        //MARK:- Second task
        let firstName = "firstName"
        let lastName = "lastName"
        nameSurenameTuplePrint(firstName: firstName, lastName: lastName)
        //MARK:- Third task
        let firstFloat: Float? = 5.0
        let secondFloat: Float? = nil
        print(checkOptionalFloat(number: firstFloat))
        print(checkOptionalFloat(number: secondFloat))
        
        //MARK:- Fourth task
        fibonachchiPrint(number: 15)
        //MARK:- Sixth task
        let array = createRandomArray(with: 14)
        print("Random array",array)
        bubbleSort(array: array)
        //MARK:- Seventh task
        increaseIntInString()
    }
    
    func averageCount(firstNumber: Double, secondNumber: Double) -> Double{
        let average = (firstNumber + secondNumber) / 2
        return average
    }
    
    func nameSurenameTuplePrint(firstName: String, lastName: String) {
        let nameSurenameTuple = (firstName, lastName)
        let (name, surename) = nameSurenameTuple
        print("Full name: [\(name)] [\(surename)]")
    }
    
    
    func checkOptionalFloat(number: Float?) -> String{
        guard let number = number else { return "Variable can't be unwrapped" }
        return String(number)
    }
    
    
    func fibonachchiPrint(number: Int) {
        var f1 = 0
        var f2 = 1
        print(f1)
        print(f2)
        for _ in 3..<number + 1 {
            print(f1+f2)
            let temp = f1
            f1 = f2
            f2 = temp + f1
            
        }
    }
    
    func createRandomArray(with average: Int) -> [Int] {
        let n = 15
        var array = [Int]()
        for _ in 0...n {
            let number = Int.random(in: 0..<100)
            array.append(number)
        }
        return array
    }
    
    
    func bubbleSort(array: [Int]) {
        var mutatedArray = array
        let arrayCount = mutatedArray.count - 1
        for i in 0...arrayCount - 1 {
            for j in 0...arrayCount - i - 1 {
                if mutatedArray[j] > mutatedArray[j + 1]{
                    let temp = mutatedArray[j]
                    mutatedArray[j] = mutatedArray[j + 1]
                    mutatedArray[j+1] = temp
                }
            }
        }
        print("Sorted array",mutatedArray)
    }
    
    func increaseIntInString(){
        let string = "abc999"
        var stringOfChars = ""
        var stringOfInts = ""
        for i in string {
            let number = Int(String(i))
            if number != nil {
                stringOfInts.append(String(i))
            } else {
                stringOfChars.append(String(i))
            }
        }
        guard let checkedStringOfInts = Int(stringOfInts) else { return }
        let newNumber = String(checkedStringOfInts + 1)
        let result = stringOfChars + newNumber
        print(result)
    }
    
}

