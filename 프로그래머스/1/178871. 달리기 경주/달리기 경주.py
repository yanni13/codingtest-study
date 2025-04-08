def solution(players, callings):
    #각 player의 등수를 저장 (jam: 1)
    player_index = {name: i for i, name in enumerate(players)}
    
    for name in callings:
        #callings에 이름이 있다는건 이미 앞질렀다는 얘기
        idx = player_index[name]
        # 앞 사람이랑 자리 바꾸기
        front_player = players[idx-1]
        
        players[idx], players[idx-1] = players[idx-1], players[idx]
        
        player_index[name] = idx - 1
        player_index[front_player] = idx
    return players