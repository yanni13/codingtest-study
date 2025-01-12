def solution(n):
    answer = []
    temp = list(str(n))
    for i in temp:
        answer.append(i)
        answer.sort(reverse=True)
    return int(''.join(answer))