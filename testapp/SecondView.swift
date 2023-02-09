//
//  SecondView.swift
//  testapp
//
//  Created by mehul on 11/07/2022.
//

import Foundation
import UIKit

protocol pizzeria {
    func makepizza (_ ingradiants : [String]) -> pizza
    //func makeMargerita() -> pizza
}

//MARK: Structure
struct pizza {
    let ingradiants : [String]
}

struct Lombardis : pizzeria {
    func makepizza(_ ingradiants: [String]) -> pizza {
        return pizza(ingradiants: ["tomato", "mozzarella", "basil"])
    }
    
    func makeMargherita() -> pizza {
        return makepizza(["tomato", "mozzarella", "basil"])
      }
    
}

//MARK: Extension
extension pizzeria {
    func makeMargerita() -> pizza {
        return makepizza(["tomato", "mozzarella"])
    }
}

class SecondView : UIViewController {
    
    override func viewDidLoad() {
        MapUse()
        UseOfFilter()
        dosomthing()
        
        let lombardis1: pizzeria = Lombardis()
        let lombardis2: Lombardis = Lombardis()

        lombardis1.makeMargerita()
        lombardis2.makeMargerita()

    }
    
    //MARK: button actions
    @IBAction func btnClose(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: Map use
    func MapUse() {
        
        let values = [2,3,4,5,6,7]
        let square = values.map { result in
            result * result
        }
        
        // this map accept one argument we can not pass two arguments on normal map
        let square2 = values.map{$0 * $0}
        let square3 = values.map{NumberFormatter.localizedString(from: $0 as NSNumber, number: .spellOut)}
        print(square,square2,square3)
        
        //there is same output for both the varible
        let miles = ["point1":120.0,"point2":30.0,"point3":50.0]
        let milestopoint = miles.map { points, value in value * 1.60}
        let milestopoint2 = miles.map { $0.value * 1.60}
        print(milestopoint,milestopoint2)
        
        //MARK: Flat Map Use
        let results = [[5,2,7], [4,8], [9,1,3]]
        let allResults = results.map{ $0.map{ $0 > 5 } }
        print(allResults)
    }
    
    //MARK: Filter use
    func UseOfFilter(){
        let years = [1989, 1992, 2003, 1970, 2014, 2001, 2015, 1990, 2000, 2024, 1999]
        let filter = years.filter({$0 >= 2000}).map({2020 - $0}).reduce(0, +)
        
        print(filter)
    }
    
    //MARK: guard statement
    func useguard() {
        
    }
    
    
    func sumofarray (ary : [Int], handler : ((Int) -> Void)){
        let sum = ary.reduce(0, +)
        handler(sum)
    }

    func dosomthing()  {
        self.sumofarray(ary: [2, 4, 5, 7, 12, 33, 2, 77]) { (sum) in
            print(sum)
        }
        self.sumofarray(ary: [4,6,3]) { sum in
            print(sum)
        }
    }
    
}


