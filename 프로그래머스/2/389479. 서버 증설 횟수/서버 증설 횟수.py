def solution(players, m, k):
    answer = []
    
    for player in players:
        total = sum((answer + [1])[-k:]) * m
        
        if total > player:
            answer.append(0)
        else:
            add = (player-total) // m + 1
            answer.append(add)
    return sum(answer)