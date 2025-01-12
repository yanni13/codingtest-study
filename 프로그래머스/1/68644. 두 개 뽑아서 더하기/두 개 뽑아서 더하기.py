def solution(numbers):
    answer = []
    numbers.sort()
    for i in range(len(numbers)):
        for j in range(i+1,len(numbers)):
            temp = numbers[i] + numbers[j]
            answer.append(temp)
    return sorted(set(answer))