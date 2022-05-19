
/*
 - 문제: 백준 2178번 - 미로 찾기
 - 링크: https://www.acmicpc.net/problem/2178
 - key:
 1. 방문한 노트를 visited에 추가하기
 2. 현재 노드를 기준으로 사방에 있으면서 미로를 벗어나지 않은 노드를 queue에 추가하기
 */

import Foundation

func solution(graph: [[Int]], n: Int, m: Int) -> Int {
  
  // 상하좌우
  let dx = [0, 0, -1, 1]
  let dy = [-1, 1, 0, 0]
  
  var graph = graph
  var visited: [[Int]] = []
  var queue: [[Int]] = [[0, 0]]
  
  while queue.count != 0 {
    let node = queue.remove(at: 0)
    
    if !visited.contains(node) {
      visited.append(node)
      
      for i in 0..<4 {
        let newX = node[0] - dx[i]
        let newY = node[1] - dy[i]
        
        if 0 > newX || n - 1 < newX || 0 > newY || m - 1 < newY {
          continue
        }
        
        if graph[newX][newY] == 0 {
          continue
        }
        
        if graph[newX][newY] == 1 {
          queue.append([newX, newY])
          graph[newX][newY] = graph[node[0]][node[1]] + 1
        }
      }
    }
  }
  
  return graph[n - 1][m - 1]
}

