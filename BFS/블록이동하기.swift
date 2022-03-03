/*
    - 문제: 2020 KAKAO BLIND RECRUITMENT - 블록 이동하기
    - 링크: https://programmers.co.kr/learn/courses/30/lessons/60063
    - key: 
    1. 회전할때 가로 세로 나눠서 구현하기
    2. 로봇이 가로, 세로일때 left, right 또한 구분짓기
*/

import Foundation

struct Coordinate: Hashable {
    let x: Int
    let y: Int
}

struct Robot: Hashable {
    let left: Coordinate
    let right: Coordinate
    var cnt: Int = 0
}

func isInBoard(nexCoordi: Coordinate, length: Int) -> Bool {
    for i in [nexCoordi.x, nexCoordi.y] {
        if !(0 <= i && i < length) {
            return false
        }
    }
    return true
}

func calNextCoordi(cur: Coordinate, dist: Array<Int>) -> Coordinate {
    return Coordinate(x: cur.x + dist[0], y: cur.y + dist[1])
}

func nextMoveArray(cur: Robot, board: [[Int]]) -> Array<Robot> {
    var nextArray = [Robot]()
    let n = board.count
    let dist = [
        0 : [1, 0],
        1 : [-1, 0],
        2 : [0, 1],
        3 : [0, -1]
    ]
    
    // 상하좌우
    for i in 0...3 {
        let left = calNextCoordi(cur: cur.left, dist: dist[i]!)
        let right = calNextCoordi(cur: cur.right, dist: dist[i]!)
        if isInBoard(nexCoordi: left, length: n), isInBoard(nexCoordi: right, length: n) {
            if board[left.x][left.y] == 0, board[right.x][right.y] == 0 {
                nextArray.append(Robot(left: left, right: right))
            }
        }
    }
    
    // 회전
    // 가로
    if cur.left.x == cur.right.x {
        for i in [0,1] {
            let left = calNextCoordi(cur: cur.left, dist: dist[i]!)
            let right = calNextCoordi(cur: cur.right, dist: dist[i]!)
            if isInBoard(nexCoordi: left, length: n), isInBoard(nexCoordi: right, length: n) {
                if board[left.x][left.y] == 0, board[right.x][right.y] == 0 {
                    if i == 0 {
                        nextArray.append(Robot(left: left, right: cur.left))
                        nextArray.append(Robot(left: right, right: cur.right))
                    }
                    else if i == 1 {
                        nextArray.append(Robot(left: cur.left, right: left))
                        nextArray.append(Robot(left: cur.right, right: right))
                    }
                }
            }
        }
    }
    
    // 세로
    else if cur.left.y == cur.right.y {
        for i in [2,3] {
            let left = calNextCoordi(cur: cur.left, dist: dist[i]!)
            let right = calNextCoordi(cur: cur.right, dist: dist[i]!)
            if isInBoard(nexCoordi: left, length: n), isInBoard(nexCoordi: right, length: n) {
                if board[left.x][left.y] == 0, board[right.x][right.y] == 0 {
                    if i == 2 {
                        nextArray.append(Robot(left: cur.left, right: left))
                        nextArray.append(Robot(left: cur.right, right: right))
                    }
                    else if i == 3 {
                        nextArray.append(Robot(left: left, right: cur.left))
                        nextArray.append(Robot(left: right, right: cur.right))
                    }
                }
            }
        }
    }
    
    return nextArray
}

class Queue<T: Equatable> {
    var left: [T] = []
    var right: [T]
    
    init(_ items: [T] = []) {
        right = items
    }
    
    var isEmpty: Bool {
        return left.isEmpty && right.isEmpty
    }
    
    func push(_ item: T) {
        right.append(item)
    }
    
    func pop() -> T? {
        if left.isEmpty {
            left = right.reversed()
            right.removeAll()
        }
        return left.popLast()
    }
}

func solution(_ board: [[Int]]) -> Int {
    var visied = Set<[Coordinate]>()
    let q = Queue<Robot>()
    let g = board.count-1
    let goal = Coordinate(x: g, y: g)
    let _left = Coordinate(x: 0, y: 0)
    let _right = Coordinate(x: 0, y: 1)
    let _robot = Robot(left: _left, right: _right)
    q.push(_robot)
    visied.insert([_left, _right])
    
    while !q.isEmpty {
        let curRobot = q.pop()!
        if goal == curRobot.left || goal == curRobot.right {
            return curRobot.cnt
        }
        
        for var nexRobot in nextMoveArray(cur: curRobot, board: board) {
            if !visied.contains([nexRobot.left, nexRobot.right]) {
                nexRobot.cnt = curRobot.cnt + 1
                q.push(nexRobot)
                visied.insert([nexRobot.left, nexRobot.right])
            }
        }
    }
    
    return -1
}
