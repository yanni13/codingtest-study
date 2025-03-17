def solution(name, yearning, photo):
    answer = []
    # 딕셔너리로 name이랑 yearning을 묶어줌
    info = dict(zip(name, yearning))
    
    for i in photo:
        sum = 0
        for j in i:
            #딕셔너리에서 get메서드를 통해 값 가져옴
            
            sum += info.get(j, 0)
        answer.append(sum)
    return answer