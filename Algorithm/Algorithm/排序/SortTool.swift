//
//  SortTool.swift
//  Algorithm
//
//  Created by 陈思欣 on 2018/8/23.
//  Copyright © 2018年 chensx. All rights reserved.
//

import UIKit

protocol TargetAction {
    func performAction()
    
}

class SortTool: NSObject {
    
    func test() {
        //swift柯里化(Currying)
        let addNum = add(4)//这一步不会返回具体值，而是返回余下函数
        let allNum = addNum(10);
        print(allNum);
        
        
    }
    
    //swift 泛型  tuple
    func swap<T>(_ nums: inout [T], _ p: Int, _ q: Int) {
        (nums[p], nums[q]) = (nums[q], nums[p])
    }
    
    //Currying
    func add(_ num: Int) -> (Int) -> Int {
        return { val in
            return num + val
        }
    }
    
    // guard let
    func divide(dividend: Double?, by divisor: Double?) -> Double? {
        guard let dividend = dividend, let divisor = divisor, divisor != 0 else {
            return nil
        }
        
        return dividend / divisor
    }
    
//    func divide(dividend: Double?, by divisor: Double?) -> Double? {
//        if dividend == nil {
//            return nil
//        }
//        if divisor == nil {
//            return nil
//        }
//        if divisor == 0 {
//            return nil
//        }
//        return dividend! / divisor!
//    }
    
    
    

}
