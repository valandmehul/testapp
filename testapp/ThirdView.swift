//
//  ThirdView.swift
//  testapp
//
//  Created by mehul on 07/12/2022.
//

import UIKit

class ThirdView: UIViewController {

    let greet : (String) -> () = { name in
        print("hello!, \(name)")
    }
    
    let compare: (Int,Int) -> (Bool) = { (num1, num2) in
        return num1 > num2
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstCloser()
        // Do any additional setup after loading the view.
    }
    
    //MARK: Use Closer Function
    func firstCloser() {
        
        
        greet("Nick")
        print(compare(10, 66))
        
        let nums = [10, 2, 3, 54, 3, 2, 1030]
        let sortednum = nums.sorted(by: compare)
        print(sortednum)
        
        //network request of completion
        let handler: (Data?, URLResponse?, Error?) -> () = { (data, response, error) in
            
            guard let data = data else { return }
            //print(String(data: data, encoding: .utf8)!)
        }
        
        let url = URL(string: "http://www.google.com")!
        let task = URLSession.shared.dataTask(with: url, completionHandler: handler)
        
        //add closesr directly into data task
        let task1 = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            //print(String(data: data, encoding: .utf8)!)
            
        }

        task.resume()
        
    }
    
    @IBAction func btnClose(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
