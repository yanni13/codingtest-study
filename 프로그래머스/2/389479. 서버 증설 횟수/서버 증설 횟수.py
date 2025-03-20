def solution(players, m, k):
    history = []
    
    for player in players:
        # 최근 k번의 history 값과 m을 사용하여 예상 점수 계산
        total = sum((history + [1])[-k:]) * m

        if total > player:
            history = history + [0]
        else:
            add = (player - total) // m + 1
            history += [add]

    return sum(history)