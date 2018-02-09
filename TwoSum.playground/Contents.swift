/*
Given an array of integers, return indices of the two numbers such that they add up to a specific target.

You may assume that each input would have exactly one solution, and you may not use the same element twice.

Example:
Given nums = [2, 7, 11, 15], target = 9,

Because nums[0] + nums[1] = 2 + 7 = 9,
return [0, 1].
*/

import UIKit

// Brute force method

func twoSumBrute(_ nums: [Int], _ target: Int) -> [Int] {
    for index in 0..<nums.count {
        // find the difference with current index
        let diff = target - nums[index]
        for index2 in (index+1)..<nums.count {
            if nums[index2] == diff {
                return [index, index2]
            }
        }
    }
    return [0,0]
}

// Efficent Method

func twoSumMap(_ nums: [Int], _ target: Int) -> [Int] {
    var numberMap = [Int:Int]()
    for index in 0..<nums.count {
        let diff = target - nums[index]
        
        if let num = numberMap[diff] {
            return [num, index]
        }
        numberMap[nums[index]] = index
    }
    return [0,0]
}

print(twoSumBrute([3,2,4],6))
print(twoSumMap([3,2,4],6))
