/*
 - 문제: 카펫
 - 링크: https://programmers.co.kr/learn/courses/30/lessons/42842
 - key: 곱해서 n이 되는 수를 찾아보자
 */
 
import Foundation

func makeDivisorArray(_ n: Int) -> [[Int]] {
  var num: Int = 3
  var array: [[Int]] = []
  
  while num < n/2 {
    if n % num == 0 {
      let length = n / num
      
      if num >= length {
        array.append([num, length])
      }
    }
    
    num += 1
  }

  return array
}

func solution(_ brown: Int, _ yellow: Int) -> [Int] {
  let total = brown + yellow
  let divisors = makeDivisorArray(total)
  
  for elem in divisors {
    if (elem[0] * 2) + (elem[1] - 2) * 2 == brown {
      return elem
    }
  }

  return [0]
}
