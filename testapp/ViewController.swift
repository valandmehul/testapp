//
//  ViewController.swift
//  testapp
//
//  Created by mehul on 15/06/2022.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: all veriables
    
    var CompletionHandler: ((Int) -> Void)?
    
    //use of Defer
    func myFunc() {
        print("Step 2")
        defer { print("Step 3") }
        print("Step 4")
    }
    
    func fetchCrewMember() -> (job: String, name: String) {
        return ("Public Relations", "Jayne")
    }
    
    func divide(_ dividend: Double?, by divisor: Double?) -> Double? {
        
        guard let dividend = dividend, let divisor = divisor , divisor != 0 else {
            return nil
        }
        
      return dividend / divisor
        
    }
    
    func removeVowels(_ str: String) -> String {
        return str.replacingOccurrences(of: "[aeiou]", with: "", options: [.caseInsensitive,.regularExpression], range: nil)
    }
    
    func dictionary(_ initial: String, _ words: [String]) -> [String] {
        var fil = words.filter { str -> Bool in
            return str.range(of: initial, options: .caseInsensitive, range: nil, locale: nil) != nil
        }
        return fil
    }
    
    func repeating<T>(_ item: T, _ times: Int) -> [String] {
        var str = [String]()
        for _ in 0...times {
            str.append("\(item)")
         }
        return str
    }
    
    func printvalue<T>(_ details : T){
        print("\(details)")
    }
    
    func mysteryFunc(_ arr: [Int], _ num: Int) -> [Int] {
        var number = [Int]()
        for i in arr {
            let num = i % num
            number.append(num)
        }
        return number
    }
    
    func carsNeeded(_ n: Int) -> Int {
        return n % 5 == 0 ? n/5 : n/5+1
    }
    
    func larger(_ f: () -> Int, _ g: () -> Int) -> String {
        let m  = max(f(), g())
        if f() == g() {
            return "neither"
        }
        return m == f() ? "f" : "g"
    }
    
    func sortNumsAscending(_ arr: [Int]?) -> [Int] {
        guard let asdf = arr else {
            return []
        }
        return asdf.sorted(by: <)
    }
    
    func doubleChar(_ str: String) -> String {
        let text = str.map { String($0) } //map{ $0 }
        let asdf = text.map{"\($0)\($0)"}
        return asdf.joined()
    }
    
    func setify(_ arr: [Int]) -> [Int] {
//        var array = [Int]()
//        for i in arr {
//            if !array.contains(i) {
//                array.append(i)
//            }
//        }
        return Set(arr).sorted()
    }
    
    func existsHigher(_ arr: [Int], _ n: Int) -> Bool {
        for i in arr {
            if i >= n {
                return true
            }
        }
        return false
    }

    func Practical() {
        
        let div = divide(50, by:5)
        print(div)
        print(removeVowels("I have never seen a thin person drinking Diet Coke."))
        print(dictionary("tri", ["triplet", "tries", "trip", "piano", "tree"]))
        printvalue(repeating(0, 8))
        printvalue(mysteryFunc([5, 7, 8, 2, 1], 2))
        printvalue(carsNeeded(11))
        printvalue(larger({588}, {15}))
        printvalue(sortNumsAscending([80, 29, 4, 0, -95, -24, 85]))
        printvalue(doubleChar("Hello World!"))
        printvalue(setify([5, 7, 8, 9, 10, 15]))
        printvalue(existsHigher([4, 3, 3, 3, 2, 2], 4))
        printvalue("mehul")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        plusMinus(arr: [-4, 3, -9, 0, 4, 1])
        
        //-----------------------------------------------------------------------------------------------------------------------------------
        
        let someHotel = Hotel(name: "The best hotel")
        let someHotelRooms = [
            Room(type: .single, price: 25.4, hotel: someHotel),
            Room(type: .double, price: 36.768, hotel: someHotel)
        ]
        someHotel.rooms = someHotelRooms
        
        print("Hotel room prices: ", someHotel.rooms.compactMap({ $0.price }))
        //-----------------------------------------------------------------------------------------------------------------------------------
        //MARK: What output will be produced by the code below?
        let numbers2 = [1, 3, 5, 7, 9]
        let result = numbers2.flatMap { i in
            [i,i]
        }
        let result1 = numbers2.map{([$0*10,$0])}
        print(numbers2,result,result1)
        
        
        //MARK: What output will be produced by the code below?
        
        for i in stride(from: 1, to: 17, by: 4) {
            print(i)
        }
        // 1,5,9,13
        
        //MARK: What output will be produced by the code below?
        
        let numbers = Array(1..<10)
           print(numbers.count)
        
        //MARK: When this code is executed, what data type does convertedNumber have?
        let possibleNumber = "1701"
        _ = Int(possibleNumber)
        
        //MARK: What output will be produced by the code below?
        let people = [String](repeating: "Malkovitch", count: 2)
        print(people)
        
        //MARK: What output will be produced by the code below?
        print("Step 1")
        myFunc()
        print("Step 5")
        
        //MARK: What output will be produced by the code below?
        let names = ["Pilot": "Wash", "Doctor": "Simon"]
        let doctor = names["doctor"] ?? "Bones"
        print(doctor)
        
        //MARK: What output will be produced by the code below?
        let name = "Simon"
        switch name {
        case "Simon":
            fallthrough // because a fallthrough statement is used just after the statement of simon. Due to fallthrough statement the next is forcefully executed
        case "Malcom", "Zoe", "Kaylee":
            print("Crew")
        default:
            print("Not crew")
        }
        
        //MARK: When this code is executed, what will the numbers constant contain?
        let numbers1 = [1,2,3].map { [$0, $0] }
        print(numbers1)
        
        //MARK: What output will be produced by the code below?
        func greet(_ nam: inout String) {
            nam = nam.uppercased()
            print("Greetings, \(nam)!")
        }
        // this code will not compile without the use of "&" in function call because if inout use
        var nam = "Mal"
        greet(&nam)
        //after this nam value will be change
        print("Goodbye, \(nam)!")
        
//        A. "Greetings, MAL!", "Goodbye, MAL!"
//
//        B. "Greetings, MAL!", "Goodbye, Mal!"
//
//         C. "Greetings, Mal!", "Goodbye, MAL!"
//
//        D. Nothing will be output
//
//        E. This code will compile but crash
//
//        F. This code will not compile
        
        //MARK: What output will be produced by the code below?
//        var i = 1
//
//            mainLoop: repeat {
//                i += 2
//
//
//                switch i % 2 {
//                    case 0:
//                        break mainLoop
//                    default:
//                        break
//                }
//            } while true

        // this code gose in infinite loop because of repeat true.
         //   print("Complete!")

//        A. ""
//        B. "Complete!"
//        C. This code will compile but crash
//        D. This code will not compile

        //MARK: What output will be produced by the code below?
        
        enum MyError: Error {
            case broken
            case busted
            case badgered
        }
        
        func willThrowAnError() {
            //throw MyError.busted
        }
    
        do {
            try willThrowAnError()
        } catch MyError.busted {
            print("Code was busted!")
        } catch {
            print("Code just didn't work")
        }
        //This code will not compile
        
//      A. "Code just didn't work"
//      B. "Code was busted!"
//      C. Nothing will be output
//      D. This code will compile but crash
//      E. This code will not compile

        //MARK: Assuming no typecasting, which of the following statements is true?
        var foo : Float = 200
        var boo : Double = 300
        //foo = boo
        //boo = foo
        //Neither variable can be assigned to the other
        
        
//        a) Either variable can be assigned to the other
//        b) Neither variable can be assigned to the other
//        c) You can assign “bar” to “foo”
//        d) You can assign “foo” to “bar”
//        e) This code will compile but crash
//        f) This code will not compile
        
        //MARK: What output will be produced by the code below?
        let years = [21, 35, 23, 47]
        let cancellable = years.publisher
            .reduce(0, { acc, nxt in acc + nxt })
            .sink { print("\($0)") }
        
        let cancel = years.publisher.reduce(0) { acc, nxt in
            acc + nxt
        }
        
        print("\(cancel) ==== \(years.reduce(0, +))")
        
        //MARK: What output will be produced by the code below?
        // it is set of string you can not insert same string again
        var spaceships = Set<String>()
        spaceships.insert("Serenity")
        spaceships.insert("Enterprise")
        spaceships.insert("TARDIS")
        spaceships.insert("Serenity")
        print(spaceships.count)
        // count is 3 because, in set string we can not add same string again.
        
        //MARK: What output will be produced by the code below?
        struct Tutorial {
          var difficulty: Int = 1
        }

        var tutorial1 = Tutorial()
        var tutorial2 = tutorial1
        tutorial2.difficulty = 2

        print("\(tutorial1.difficulty) -- \(tutorial2.difficulty)")
        // print 1 and 2 because struct is value type
        //MARK: What output will be produced by the code below?
        class Tutorial1 {
          var difficulty: Int = 1
        }

        var tutorial3 = Tutorial1()
        var tutorial4 = tutorial3
        tutorial4.difficulty = 3

        print("\(tutorial3.difficulty) -- \(tutorial4.difficulty)")
        //print 3 and 3 because class is reference type
        
        //MARK: What output will be produced by the code below?
        var thing = "cars"

        let closure = { [thing] in
            print("i love \(thing)")
        }
        
//        let closure = {
//            print("i love \(thing)")
//        }

        thing = "airplanes"

        closure()
        
        // print: I love cars. The capture list creates a copy of thing when you declare the closure. This means that captured value doesn't change even if you assign a new value to thing
        
        print("count : \([1, 2, 3, 3].countUniques())") // should print 3

        
        print(fetchCrewMember())
        dosomthing()
        DoSomthingEscaping()
        Practical()
    }
    
    // MARK: button action
    
    @IBAction func btnPokemon(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let pokeController = storyboard.instantiateViewController(withIdentifier: "pokeController") as! pokeController
        self.navigationController?.pushViewController(pokeController, animated: true)
    }
    

   // MARK: closer example , completion handler
    func sumofarray (ary : [Int], handler : ((Int) -> Void)){
        var sum : Int = 0
        for i in ary {
            sum += i
        }
        handler(sum)
    }

    func dosomthing()  {
        self.sumofarray(ary: [2, 4, 5, 7, 12, 33, 2, 77]) { (sum) in
            print(sum)
        }
    }
    //MARK: closer @escaping
    
    func sumofarrayEscaping(ary: [Int], handler: ((Int) -> Void)){
        var sum : Int = 0
        for i in ary {
            sum += i
        }
        
        //self.CompletionHandler = handler
        handler(sum)
    }
    
    func DoSomthingEscaping(){
        self.sumofarrayEscaping(ary: [4, 5, 7, 12, 33, 2, 77]) { [weak self] sum in
            print("asdf")
        }
    }

   
}

func plusMinus(arr: [Int]) -> Void {
    // Write your code here
    var count = arr.count
    var results: [Int]
    var plus = Int()
    var minus = Int()
    var zero = Int()
    
    for i in arr {
        if i.signum() == 1 {
            plus = plus + 1
        } else if i.signum() == -1 {
            minus = minus + 1
        } else if i.signum() == 0 {
            zero = zero + 1
        }
    }
    var first = Double() //plus/count
    first = first / Double(count)
    //print(first)
    //print(plus/count,3/6,minus%=count,zero%count)
}

class Animal {
    var name: String  = ""
    
    init(name: String) {
        self.name = name
    }
}

 
class Hotel {
    let name: String
    var rooms: [Room] = []
    
    init(name: String) {
        self.name = name
    }
}

enum RoomType {
    case single
    case double
}

class Room {
    let type: RoomType
    let price: String
    let hotel: Hotel
    
    init(type: RoomType, price: Double, hotel: Hotel) {
        self.type = type
        self.price = price.toPriceString()
        self.hotel = hotel
    }
}

private extension Double {
    func toPriceString() -> String {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = Locale.current
        return currencyFormatter.string(from: NSNumber(value: self)) ?? "unknown"
    }
}

class ThreadSafeQueue<T> {
        private let queue: DispatchQueue
    private var data: [T]

init() {
self.queue = DispatchQueue(label: "ThreadSafeQueue")
self.data = []
}

deinit {
    //self.data.clear()
}

var isEmpty: Bool {
    self.queue.sync { [weak self] in (self?.data.isEmpty)! ?? false }
}

func push(_ element: T) {
self.queue.async { [weak self] in
self?.data.append(element)
}
}

func take() -> T? {
if self.isEmpty { return nil }
return queue.sync { data[0] }
}
}


extension Array where Element : Comparable {
    func countUniques() -> Int {
        let sortedValues = sorted()
        let initial: (Element?, Int) = (.none, 0)
        let reduced = sortedValues.reduce(initial) {
          ($1, $0.0 == $1 ? $0.1 : $0.1 + 1)
        }
        return reduced.1
    }
}

