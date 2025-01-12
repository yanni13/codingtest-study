def solution(x):
    answer = [True, False]
    
    sum = 0
    temp = list(str(x))
    for i in temp:
        sum += int(i)

    if x % sum == 0:
        return answer[0]
    else:
        return answer[1]
