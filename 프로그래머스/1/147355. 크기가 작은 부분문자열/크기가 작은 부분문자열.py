def solution(t, p):
    answer = 0
    num = len(p)
    
    for i in range(len(t)-num+1):
        sub_str = t[i:i+num]
        
        #만약 자른 숫자가 p보다 작을 경우 합 누적
        if sub_str <= p:
            answer += 1
        else:
            continue
        
    return answer