//
//  SearchTool.swift
//  Algorithm
//
//  Created by 陈思欣 on 2018/10/30.
//  Copyright © 2018年 chensx. All rights reserved.
//

import UIKit

// 二分查找
func binarySearch(_ nums:[Int], target: Int) -> Int {
    var left = 0, middle = 0, right = nums.count - 1;
    
    while left <= right {
        middle = (right - left)/2 + left
        
        if nums[middle] == target {
            return middle;
            
        } else if (nums[middle] < target) {
            left = middle + 1;
            
        }else {
            right = middle - 1;
        }
    }
    
    return -1;
}


/********************************************
 已知有很多会议，如果有这些会议时间有重叠，则将它们合并。
 比如有一个会议的时间为 3 点到 5 点，另一个会议时间为 4 点到 6 点，
 那么合并之后的会议时间为 3 点到6点
 *******************************************
 */


class MeettingTime: NSObject {
    public var start: Int = 0
    public var end: Int = 0
    
    public init(_ start: Int, _ end: Int) {
        self.start = start
        self.end = end
    }
}

func merge(meettingTimes:[MeettingTime]) -> [MeettingTime] {
    guard meettingTimes.count > 1 else {
        return meettingTimes;
    }
    
    //排序
    var meettingTimes = meettingTimes.sorted { (time1, time2) -> Bool in
        if time1.start != time2.start {
            return time1.start < time2.start
        }else {
            return time1.end < time2.end
        }
    }
    
    //新建结构数据
    var res = [MeettingTime]()
    res.append(meettingTimes.first!)
    
    for i in 1..<meettingTimes.count {
        let last = res.last!
        let current = meettingTimes[i]
        
        if current.start <= last.end {
            last.end = max(current.end, last.end)
        }else {
            res.append(current)
        }
    }
    return res;
}
