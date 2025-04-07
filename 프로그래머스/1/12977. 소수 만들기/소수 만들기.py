from itertools import combinations

def solution(nums):
    answer = 0

    result = list(combinations(nums, 3))
    
    for i in result:
        # print(i)
        temp = sum(i)
        if is_prime_number(temp) == True:
            answer += 1
        
    # [실행] 버튼을 누르면 출력 값을 볼 수 있습니다.
    # print(result)

    return answer

def is_prime_number(x):
    # 2부터 (x - 1)까지의 모든 수를 확인하며
    for i in range(2, x):
        # x가 해당 수로 나누어떨어진다면
        if x % i == 0:
            return False # 소수가 아님
    return True # 소수임