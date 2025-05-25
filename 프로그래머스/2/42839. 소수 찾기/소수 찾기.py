from itertools import permutations 

def solution(numbers):
    answer = set()
    temp = []
    final_list = []
    
    result = []
    count = numbers.count
    for i in numbers:
        temp.append(i)
        
    for i in range(1, len(numbers)+1):
        answer.update(permutations(temp, i))
    

    for item in [list(item) for item in answer]:
        if item:
            num = int(''.join(item)) 
            final_list.append(num)

    for i in final_list:
        if i < 2:
            continue
        for num in range(2, i):
            if i % num == 0:
                break
        else:     
            result.append(i)
            
            
    return len(set(result))

# #소수 판별
# def is_prime_number(x):
#     for i in range(2, x):
#         if i % x == 0:
#             return False
#     return True
        