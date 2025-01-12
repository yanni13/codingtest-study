def can_place_mat(park, x, y, size):
    # 공원 크기 확인
    rows = len(park)
    cols = len(park[0])
    
    # 범위를 벗어나는지 확인
    if x + size > rows or y + size > cols:
        return False
    
    # 해당 영역이 모두 "-1"인지 확인
    for i in range(x, x + size):
        for j in range(y, y + size):
            if park[i][j] != "-1":
                return False
    
    return True

def solution(mats, park):
    rows = len(park)
    cols = len(park[0])
    
    # mats를 내림차순으로 정렬
    mats.sort(reverse=True)
    
    # 각 크기의 돗자리에 대해
    for size in mats:
        # 모든 위치를 확인
        for i in range(rows):
            for j in range(cols):
                # 해당 위치에 돗자리를 놓을 수 있는지 확인
                if can_place_mat(park, i, j, size):
                    return size
    
    return -1