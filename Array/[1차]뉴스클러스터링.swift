   
/*
 - 문제: [1차] 뉴스클러스터링
 - 링크: https://programmers.co.kr/learn/courses/30/lessons/17677
 - key: 합집합과 교집합
 */

import Foundation

// 문자열 잘라 다중집합 만들기
func cutString(_ str: String) -> [String] {
  var rst: [String] = []
  
  for i in 0..<str.count - 1 {
    let startIndex = str.index(str.startIndex, offsetBy: i)
    let endIndex = str.index(str.startIndex, offsetBy: i + 1)

    if str[startIndex].isLetter && str[endIndex].isLetter {
      rst.append(String(str[startIndex...endIndex]).lowercased())
    }
  }
  return rst
}

// 합집합 개수 구하기
func union(_ base: [String], target: [String]) -> Int {
  return base.count + target.count - intersect(base, target: target)
}

// 교집합 개수 구하기
func intersect(_ base: [String], target: [String]) -> Int {
  var result: Int = 0
  var dict: [String: Int] = [:]
  
  target.forEach { elem in
    if dict[elem] != nil {
      dict[elem]! += 1
    } else {
      dict[elem] = 1
    }
  }
  
  base.forEach { elem in
    if let e = dict[elem], e >= 1 {
      result += 1
      dict[elem]! -= 1
      print(1)
    }
  }
  return result
}

func solution(_ str1:String, _ str2:String) -> Int {
  // 다중집합 구하기
  let s1 = cutString(str1)
  let s2 = cutString(str2)
  
  // 둘 다 공집합인 경우, 유사도는 1
  if s1.isEmpty && s2.isEmpty { return 65536 }
  
  // 두 다중집합을 비교해서 유사도 계산하기 : 교집합 개수 / 합집합 개수
  let a = Double(intersect(s1, target: s2)) // 교집합 개수 구하기 (b)
  let b = Double(union(s1, target: s2)) // 합집합 개수 구하기 (a)
  
  // 유사도 * 65536
  return Int(floor((a / b) * 65536))
}
