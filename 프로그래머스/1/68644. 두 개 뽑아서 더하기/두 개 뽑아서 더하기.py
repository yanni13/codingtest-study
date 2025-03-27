def solution(numbers):
    answer = []
    temp = []
    
    numbers.sort()
    for i in range(len(numbers)):
        for j in range(i+1, len(numbers)):
            answer.append(numbers[i] + numbers[j])
    return sorted(set(answer))