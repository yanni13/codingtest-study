def solution(s):
    answer = []
    temp = []
    last_index = {}
    #얼마나 반복할 것인가? -> s의 글자만큼

    for i in range(len(s)):
        if s[i] not in temp:
            temp.append(s[i])
            answer.append(-1)
            
        #s[i]이 이미 나온경우
        else:
            answer.append(i - last_index[s[i]])
        
        last_index[s[i]] = i

    return answer