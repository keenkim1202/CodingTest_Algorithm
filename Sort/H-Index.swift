import Foundation

/*
 - 문제: H - Index
 - 링크: https://programmers.co.kr/learn/courses/30/lessons/42747
 - key:
 */

// 과학자의 생산성과 영향력을 나타내는 지표
// h값을 구하려 한다.
// 논문 n개 중 h번이상 인용된 논문이 h편 이상이고, 나머지 논문이 h번 이하 인용 되었다면 h의 최댓값이 H-Index
// 발표한 논문의 인용횟수를 담은 배열이 주어진다.
func solution(_ citations:[Int]) -> Int {
  let array = citations.sorted(by: >)
  var index: Int = 0
  let n = citations.count
  
  for h in 1...n {
    if array.filter({ $0 >= h }).count >= h {
      print(h)
      if h > index {
        index = h
      }
    }
  }
  
  print(index)
  return index
}
