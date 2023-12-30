import Foundation

func solution(_ price:Int, _ money:Int, _ count:Int) -> Int64{
    var answer:Int64 = -1
    var sum = 0 , result = 0 , total_price = 0
    
    for i in 1...count {
        total_price = price*i
        sum += total_price
    }
    
    result = money - Int(Int64(sum))
    answer = Int64(abs(result))
    

    if (money > sum) {
        return 0
    } 
    else {
        return answer
    }
}