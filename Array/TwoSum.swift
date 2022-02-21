// LeetCode
// 1. TwoSum

/*
 nums의 정수배열과 target 정수가 주어진다.
 더해서 target정수가 되는 두 숫자의 인덱스를 리턴한다.
 
 문제는 오직 하나의 결과만 나오며, 같은 원소를 두번 사용할 수 없다.
 결과의 정렬은 상관없다.
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