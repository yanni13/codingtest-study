def solution(x, y, n):
    answer = 0
    dp = set()
    dp.add(x)
    # dp = {x}
    
    while dp:
        #y의 값이 dp에 있는지를 먼저 확인
        if y in dp:
            return answer
        #y가 dp안에 도달하지 못했다면?
        else:
            dp_y = set()
            for i in dp:
                if i+n <= y:
                    dp_y.add(i+n)
                if i*2 <= y:
                    dp_y.add(i*2)
                if i*3 <= y:
                    dp_y.add(i*3)
            dp = dp_y
            answer += 1
    return -1