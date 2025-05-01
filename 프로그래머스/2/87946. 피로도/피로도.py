from itertools import permutations

def solution(k, dungeons):
    answer = 0
    
    for i in permutations(dungeons, len(dungeons)):
        temp = k
        cnt = 0
        for a,b in i:
            if temp>=a:
                temp -= b
                cnt += 1
        answer = max(cnt, answer)
    return answer