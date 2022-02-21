/*
    - 문제: 50. Pow(x, n)
    - 링크: https://leetcode.com/problems/powx-n/
    - key: n이 양수인 경우와 음수인 경우를 나누어 생각하기
 */

 class Solution {
  func myPow(_ x: Double, _ n: Int) -> Double {
    var x = x
    var n = n
    var result: Double = 1
    
    if n < 0 { // 음수
      x = 1 / x
      n = -n
    }
    
    while n > 0 { // n이 0보다 큰 동안
      if n % 2 != 0 {
        result *= x
      }
      x *= x
      n /= 2
    }
    return result
  }
}