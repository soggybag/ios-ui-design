//
//  ViewController.swift
//  Fibo Table
//
//  Created by mitchell hudson on 2/21/17.
//  Copyright © 2017 Mitchell Hudson. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    var array: [UInt64] = [1, 1]
    
    
    
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        makeFibonacci(n: 33)
        
        tableView.dataSource = self
        tableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func makeFibonacci(n: Int) {
        let start = array.count
        let end = array.count + n
        for i in start ..< end {
            // FIXME: Multiply with overflow
            array.append(array[i - 2] + array[i - 1])
            let indexPath = IndexPath(row: i, section: 0)
            tableView.insertRows(at: [indexPath], with: .none)
        }
    }

    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        
        let n = array[indexPath.row]
        let row = indexPath.row
        // print(n)
        cell.textLabel?.text = "\(row) : \(n)"
        
        return cell
    }
    
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if scrollView == tableView {
            if scrollView.contentOffset.y + scrollView.frame.size.height >= scrollView.contentSize.height {
                print("reached bottom...")
                makeFibonacci(n: 15)
            }
        }
    }
    

}

