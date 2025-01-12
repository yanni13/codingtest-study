def solution(phone_number):
    answer = list(phone_number)
    answer.reverse()
    result = []

    result = answer[0:4]
    for i in (answer[4:]):
        temp = i.replace(i,'*')
        result.append(temp)

    result.reverse()
    return ''.join(result)