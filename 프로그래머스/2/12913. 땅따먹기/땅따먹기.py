def solution(land):
    answer = 0

    for i in range(1, len(land)):
        #열은 무조건 4열임
        for j in range(4):
            land[i][j] += max(land[i-1][k] for k in range(4) if k != j)
    return max(land[-1])
            

