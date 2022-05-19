/*
 - 문제: 음료수 얼려먹기 - 이것이 취업을 위한 코딩테스트다. (예제 5-10)
 - 링크: https://www.acmicpc.net/problem/2178
 - key:
 1. 방문한 노트를 visited에 추가하기
 2. 현재 노드를 기준으로 사방에 있으면서 미로를 벗어나지 않은 노드를 queue에 추가하기

<문제 내용>
N * M 크기의 얼음 틀이 있다. 
구멍이 뚫려 있는 부분은 0, 칸막이가 존재하는 부분은 1로 표시된다. 
구멍이 뚫려 있는 부분끼리 상, 하, 좌, 우로 붙어있는 경우 서로 연결되어있는 것으로 간주한다. 
이때 얼음 틀의 모양이 주어졌을 떄 생성되는 총 아이스크림의 개수를 구하는 프로그램을 작성하시오. 
다음의 4 * 5 얼음틀 예시에서는 아이스크림이 총 3개 생성된다.

입력조건
- 첫 번째 줄에 얼음 틀의 세로길이 N과 가로 길이 M이 주어진다.(1 <= N, M <= 1000)
- 두 번째 줄부터 N + 1번째 줄 까지 얼음 틀의 형태가 주어진다.
- 이때 구멍이 뚫려 있는 부분은 0, 그렇지 않은 부분은 1이다.

출력조건
- 한 번에 만들수 있는 아이스크림의 개수를 출력한다.

예시

4 5
00110
00011
11111
00000

답: 2
*/


import Foundation

func solution(graph: [[Int]]) -> Int {
  let n: Int = graph.count
  let m: Int = graph[0].count
  
  var graph = graph
  var result: Int = 0
  
  func dfs(_ x: Int, _ y: Int) -> Bool {
    print("dfs")
    if x < 0 || x > n - 1 || y < 0 || y > m - 1 {
      return false
    }
    
    if graph[x][y] == 0 {
      graph[x][y] = 1
      
      dfs(x - 1, y)
      dfs(x, y - 1)
      dfs(x + 1, y)
      dfs(x, y + 1)
      
      return true
    }
    
    return false
  }
  
  for i in 1...n {
    for j in 1...m {
      if dfs(i, j) == true {
        result += 1
      }
    }
  }
  
  return result
}

let graph = [
  [0,0,1,1,0],
  [0,0,0,1,1],
  [1,1,1,1,1],
  [0,0,0,0,0]
]

solution(graph: graph) // 2
