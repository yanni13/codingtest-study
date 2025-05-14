import Foundation

func solution(_ food:[Int]) -> String {
    // food[1]부터 배열을 돌면서
    // i가 temp[i]만큼을 반복하게 하려면?
   
    var count = 0
    var temp = "" // 중간 저장소
    var result = ""
    for i in 1..<food.count {

        
        count = food[i]/2
        temp += String(repeating: "\(i)", count: count)
        result = temp + String(0) + temp.reversed()
    }
    
    return result
}
