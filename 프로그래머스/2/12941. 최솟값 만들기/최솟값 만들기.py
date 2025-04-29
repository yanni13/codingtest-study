def solution(A,B):
    answer = 0

    A.sort(reverse=False)
    B.sort(reverse=True)
    
    result = [x * y for x, y in zip(A, B)]

    
    return sum(result)

