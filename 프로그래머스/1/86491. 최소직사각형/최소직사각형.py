def solution(sizes):
    answer = 0
    width, height = 0, 0
    
    for w,h in sizes:
        w, h = min(w,h), max(w,h)
        width = max(width, h)
        height = max(height, w)
        
    return width * height