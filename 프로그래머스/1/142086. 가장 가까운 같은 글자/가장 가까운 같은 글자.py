def solution(s):
    answer = []
    temp = [s]
    #얼마나 반복할 것인가? -> s의 글자만큼
    for i in range(len(s)):
        if temp[i+1] not in answer:
            print(1)
    return answer