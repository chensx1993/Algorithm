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
        
        var array = [8, 4, 5, 7, 1, 3, 6, 2]
        
        array = mergeSort(array)
        print(array)
        
    }
    
    func mergeSort(_ array: [Int]) -> [Int] {
        var helper = Array(repeating: 0, count: array.count), array = array
        mergeSort(&array, &helper, 0, array.count - 1)
        return array
    }
    
    func mergeSort(_ array: inout [Int], _ helper: inout [Int], _ low: Int, _ high: Int) {
        guard low < high else {
            return
        }
        
        let middle = (high - low) / 2 + low
        mergeSort(&array, &helper, low, middle)
        mergeSort(&array, &helper, middle + 1, high)
        merge(array: &array, &helper, low, middle, high)
    }
    
    func merge(array: inout [Int], _ helper: inout [Int], _ low: Int, _ middle: Int, _ high: Int) {
        for i in low ... high {
            helper[i] = array[i]
        }
        
        var helperLeft = low, helperRight = middle + 1, current = low
        
        while helperLeft <= middle && helperRight <= high {
            if helper[helperLeft] <= helper[helperRight] {
                array[current] = helper[helperLeft]
                helperLeft += 1
                
            }else {
                array[current] = helper[helperRight]
                helperRight += 1
            }
            current += 1
        }
        
        while helperLeft <= middle {
            array[current] = helper[helperLeft]
            current += 1
            helperLeft += 1
        }
        
        while helperRight <= high {
            array[current] = helper[helperRight]
            current += 1
            helperRight += 1
        }
        
//        guard middle - helperRight >= 0 else {
//            return
//        }
//
//        for i in 0 ... middle - helperLeft {
//            array[current + i] = helper[helperLeft + i]
//        }
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
