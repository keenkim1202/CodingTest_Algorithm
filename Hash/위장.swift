/*
 - 문제: 위장
 - 링크: https://programmers.co.kr/learn/courses/30/lessons/42578
 - key: 딕셔너리 활용 & 옷을 안 입는 경우도 고려할 것
 */

import Foundation

func solution(_ clothes:[[String]]) -> Int {
  var dictionary: [String: [String]] = [:]
  
  // 옷목록을  순회하면서 딕셔너리 값 추가
  for c in clothes {
    let name = c[0]
    let type = c[1]
    
    if dictionary[type] == nil {
      dictionary[type] = [name]
    } else {
      dictionary[type]!.append(name)
    }
  }
  
  // 종류마다의 옷 갯수 구하기
  let valuesCount = dictionary.mapValues{ $0.count }.values
  
  // 최소 1개는 입으므로 아무것도 입지 않는 경우 제외
  return valuesCount.reduce(1) { $0 * ($1 + 1) } - 1
}