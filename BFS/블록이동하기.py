'''
    - 문제: 2020 KAKAO BLIND RECRUITMENT - 블록 이동하기
    - 링크: https://programmers.co.kr/learn/courses/30/lessons/60063
    - key:
    1. 회전할때 가로 세로 나눠서 구현하기
    2. 로봇이 가로, 세로일때 left, right 또한 구분짓기
'''

from collections import deque

def isInBoard(nex_cordi, length):
    for c in nex_cordi:
        if not (0 <= c < length):
            return False
    return True

def calNexCordi(cur_cordi, dist_cordi):
    return (cur_cordi[0] + dist_cordi[0], cur_cordi[1] + dist_cordi[1])

def nex_move_list(cur_cordi, board):
    nex_list = []
    left = cur_cordi[0]
    right = cur_cordi[1]
    dist = {0 : (1,0), 1 : (-1,0), 2 : (0,1), 3 : (0,-1)}

    # 상하좌우
    for i in range(4):
        left_tmp = calNexCordi(left, dist[i])
        right_tmp = calNexCordi(right, dist[i])
        if isInBoard(left_tmp, len(board)) and isInBoard(right_tmp, len(board)):
            if not board[left_tmp[0]][left_tmp[1]] and not board[right_tmp[0]][right_tmp[1]]:
                nex_list.append((left_tmp, right_tmp))

    # 회전
    # 가로
    if left[0] == right[0]:
        for i in [0,1]:
            left_tmp = calNexCordi(left, dist[i])
            right_tmp = calNexCordi(right, dist[i])
            if isInBoard(left_tmp, len(board)) and isInBoard(right_tmp, len(board)):
                if not board[left_tmp[0]][left_tmp[1]] and not board[right_tmp[0]][right_tmp[1]]:
                    if i == 0:
                        nex_list.append((left_tmp, left))
                        nex_list.append((right_tmp, right))
                    elif i == 1:
                        nex_list.append((left, left_tmp))
                        nex_list.append((right, right_tmp))
    
    # 세로
    elif left[1] == right[1]:
        for i in [2,3]:
            left_tmp = calNexCordi(left, dist[i])
            right_tmp = calNexCordi(right, dist[i])
            if isInBoard(left_tmp, len(board)) and isInBoard(right_tmp, len(board)):
                if not board[left_tmp[0]][left_tmp[1]] and not board[right_tmp[0]][right_tmp[1]]:
                    if i == 2:
                        nex_list.append((left, left_tmp))
                        nex_list.append((right, right_tmp))
                    elif i == 3:
                        nex_list.append((left_tmp, left))
                        nex_list.append((right_tmp, right))
    
    return nex_list

def solution(board):
    # {((1,2),(2,3)), ((2,3), (1,2))...}
    visited = set()
    q = deque()
    q.append(((0,0),(0,1),0))
    visited.add(((0,0),(0,1)))
    goal = (len(board)-1, len(board)-1)

    while q:
        left, right, cnt = q.popleft()
        if goal == left or goal == right:
            return cnt

        for nex in nex_move_list((left, right), board):
            if nex not in visited:
                q.append((nex[0], nex[1], cnt+1))
                visited.add(nex)