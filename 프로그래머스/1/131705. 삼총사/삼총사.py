from itertools import combinations

def solution(number):
    answer = 0
    result = list(combinations(number, 3))
    
    for i in combinations(number, 3):
        if sum(i) == 0:
            answer += 1
    return answer