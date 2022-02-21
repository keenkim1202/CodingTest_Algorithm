/*
    - ����: 1. TwoSum
    - ��ũ: https://leetcode.com/problems/two-sum/
    - key: ���� ���Ҹ� 2�� �̻� ������� �ʵ��� üũ�ϱ�
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