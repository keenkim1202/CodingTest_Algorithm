/*
    - ����: 50. Pow(x, n)
    - ��ũ: https://leetcode.com/problems/powx-n/
    - key: n�� ����� ���� ������ ��츦 ������ �����ϱ�
 */

 class Solution {
  func myPow(_ x: Double, _ n: Int) -> Double {
    var x = x
    var n = n
    var result: Double = 1
    
    if n < 0 { // ����
      x = 1 / x
      n = -n
    }
    
    while n > 0 { // n�� 0���� ū ����
      if n % 2 != 0 {
        result *= x
      }
      x *= x
      n /= 2
    }
    return result
  }
}