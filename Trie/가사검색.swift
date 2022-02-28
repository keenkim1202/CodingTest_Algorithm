/*
    - 문제: 2020 KAKAO BLIND RECRUITMENT - 가사 검색
    - 링크: https://programmers.co.kr/learn/courses/30/lessons/60060
    - key:
    1. 각 노드마다 현재시점까지의 단어갯수를 저장하는 passNumber 딕셔너리 만들기
    2. String -> Array로 변환후 사용하기
 */

import Foundation

class Node {
    var key: Character?
    var child = [Character : Node]()
    var passNumber = [Int : Int]()
    
    init(_ key: Character? = nil) {
        self.key = key
    }
}

class Trie {
    var head = Node()
    
    func insert(word: Array<Character>, isReversed: Bool) {
        var curNode = self.head
        curNode.passNumber[word.count, default: 0] += 1
        
        var w = Character("w") {
            didSet {
                if curNode.child[w] == nil {
                    curNode.child[w] = Node(w)
                }
                curNode = curNode.child[w]!
                curNode.passNumber[word.count, default: 0] += 1
            }
        }
        
        if isReversed {
            for i in stride(from: word.count-1, through: 0, by: -1) {
                w = word[i]
            }
        }
        else {
            word.forEach {
                w = $0
            }
        }
    }
    
    func countWord(query: Array<Character>, isReversed: Bool) -> Int {
        var startNode = self.head
        var flag = false
        var q = Character("q") {
            didSet {
                if startNode.child[q] == nil {
                    flag = true
                } else {
                    startNode = startNode.child[q]!
                }
            }
        }
        
        if isReversed {
            for i in stride(from: query.count-1, through: 0, by: -1) {
                if query[i] == "?" {
                    break
                }
                q = query[i]
                if flag {
                    break
                }
            }
        }
        else {
            for i in query {
                if i == "?" {
                    break
                }
                q = i
                if flag {
                    break
                }
            }
        }
        
        var cnt = 0
        if !flag {
            cnt = startNode.passNumber[query.count, default: 0]
        }
        return cnt
    }
}

func solution(_ words:[String], _ queries:[String]) -> [Int] {
    let trie = Trie()
    let reversedTrie = Trie()
    
    words.forEach { wordString in
        let wordArray = Array(wordString)
        trie.insert(word: wordArray, isReversed: false)
        reversedTrie.insert(word: wordArray, isReversed: true)
    }
    
    var answer = [Int]()
    queries.forEach { queryString in
        let queryArray = Array(queryString)
        var ans = 0
        
        if queryArray[0] == "?" {
            ans = reversedTrie.countWord(query: queryArray, isReversed: true)
            answer.append(ans)
        }
        else {
            ans = trie.countWord(query: queryArray, isReversed: false)
            answer.append(ans)
        }
    }
    
    return answer
}