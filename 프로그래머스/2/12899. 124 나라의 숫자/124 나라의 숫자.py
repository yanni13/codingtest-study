def solution(n):
    answer = ''
    country = ['1','2','4']
    
    while n > 0:
        n -= 1
        answer = country[n%3] + answer
        n//=3
    return answer