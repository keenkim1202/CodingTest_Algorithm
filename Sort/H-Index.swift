/*
 - 문제: H - Index
 - 링크: https://programmers.co.kr/learn/courses/30/lessons/42747
 - key: 정렬 후 탐색하기
 */
import Foundation

func solution(_ citations:[Int]) -> Int {
  let array = citations.sorted(by: >)
  var index: Int = 0
  let n = citations.count
  
  for h in 1...n {
    if array.filter({ $0 >= h }).count >= h {
      if h > index {
        index = h
      }
    }
  }
  
  return index
}

// 참고하면 좋을 풀이
func solution(_ citations:[Int]) -> Int {
  for (index, cit) in citations.sorted(by: >).enumerated() {
      if index >= cit {
          return index
      }
  }
 
  return citations.count
}
