'''
    - 문제: 2020 KAKAO BLIND RECRUITMENT - 가사 검색
    - 링크: https://programmers.co.kr/learn/courses/30/lessons/60060
    - key:
    1. 각 노드마다 현재시점까지의 단어갯수를 저장하는 passNumber 딕셔너리 만들기
'''

from collections import defaultdict

class Node(object):
    def __init__(self, key):
        self.key = key
        self.child = dict()
        self.passNumber = defaultdict(int)

class Trie(object):
    def __init__(self):
        self.head = Node(None)
    
    def insert(self, string):
        cur_node = self.head
        cur_node.passNumber[len(string)] += 1
        for s in string:
            if s not in cur_node.child:
                cur_node.child[s] = Node(s)
            cur_node = cur_node.child[s]
            cur_node.passNumber[len(string)] += 1
    
    def findKeyword(self, query):
        idx = 0
        for i in range(len(query)):
            if query[i] == '?':
                idx = i
                break
        
        start_node = self.head
        for i in range(idx):
            if query[i] not in start_node.child:
                return 0
            start_node = start_node.child[query[i]]
        
        return start_node.passNumber[len(query)]

def isReversed(q):
    if q[0] == '?':
        return True
    else:
        return False

def solution(words, queries):
    trie = Trie()
    reverTrie = Trie()
    for w in words:
        trie.insert(w)
        reverTrie.insert(w[::-1])
    
    answer = []
    for q in queries:
        if isReversed(q):
            answer.append(reverTrie.findKeyword(q[::-1]))
        else:
            answer.append(trie.findKeyword(q))

    return answer