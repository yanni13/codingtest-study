def solution(people, limit):
    answer = 0
    start = 0
    people.sort()
    end = len(people) - 1
    
    while start <= end:
        if people[start] + people[end] <= limit:
            start += 1
            end -= 1
        else:
            end-=1
        answer +=1
    return answer