def solution(data, ext, val_ext, sort_by):
    answer = []
    
    for i in data:
        if ext == "code":
            if i[0] < val_ext:
                answer.append(i)
        elif ext == "date":
            if i[1] < val_ext:
                answer.append(i)
        elif ext == "maximum":
            if i[2] < val_ext:
                answer.append(i)
        elif ext == "remain":
            if i[3] < val_ext:
                answer.append(i)
            
    if sort_by == "remain":
        answer.sort(key=lambda t:t[3])
    elif sort_by == "maximum":
        answer.sort(key=lambda t:t[2])
    elif sort_by == "date":
        answer.sort(key=lambda t:t[1])
    elif sort_by == "code":
        answer.sort(key=lambda t:t[0])

    return answer