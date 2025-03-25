def solution(s):
    answer = s
    
    data = {'0':'zero', '1':'one', '2':'two', '3':'three', '4':'four', '5':'five', '6':'six', '7':'seven', '8':'eight', '9':'nine'}
    
    for key, value in data.items():
        # replace는 '문자열'을 변경
        answer = answer.replace(value, key)
    return int(answer)