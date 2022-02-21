/*
    - 문제: 1. TwoSum
    - 링크: https://leetcode.com/problems/two-sum/
    - key: 같은 원소를 2번 이상 사용하지 않도록 체크하기
 */

// sol1
class Solution {
  func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var index: (Int, Int) = (0, 0)
    
    for i in 0..<nums.count {
      for j in 0..<nums.count {
        if (nums[i] + nums[j] == target) && (i != j) {
          index.0 = i
          index.1 = j
          break
        }
      }
    }
    return [index.0, index.1]
  }
}

// sol2
class Solution {
  func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var index: (Int, Int) = (0, 0)
    
    for i in 0..<nums.count {
      for j in i+1..<nums.count {
        if (nums[i] + nums[j] == target) {
          index.0 = i
          index.1 = j
          break
        }
      }
    }
    return [index.0, index.1]
  }
}