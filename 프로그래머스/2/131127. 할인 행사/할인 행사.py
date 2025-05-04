from collections import Counter

def solution(want, number, discount):
    answer = 0
    temp = {}
    for i in range(len(want)):
        temp[want[i]] = number[i]
                
    for i in range(len(discount)-9):
        if temp == Counter(discount[i:10+i]):
            answer += 1
    return answer