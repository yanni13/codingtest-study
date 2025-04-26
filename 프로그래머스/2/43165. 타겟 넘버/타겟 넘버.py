from collections import deque

def solution(numbers, target): 
    answer = 0
    queue = deque()
    n = len(numbers)
    #모든 경우의 수를 빠짐 없이 탐색하기 위해 +, - 값을 한번에 넣음
    queue.append([numbers[0],0])
    queue.append([-1*numbers[0],0])
    
    while queue:
        temp, idx = queue.popleft()
        #현재 몇 번째 숫자까지 사용했는지를 나타내는 인덱스
        idx += 1
        if idx < n:
            queue.append([temp+numbers[idx], idx])
            queue.append([temp-numbers[idx], idx])
        else:
            if temp == target:
                answer += 1
    return answer