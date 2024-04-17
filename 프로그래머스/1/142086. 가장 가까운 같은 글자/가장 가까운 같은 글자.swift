import Foundation

func solution(_ s:String) -> [Int] {
    var array = [Character](s) //문자열을 배열 문자열로 만들어줌
    var result = [Int]() //결과를 저장할 배열
    var lastPositions = [Character: Int]()
    
    
    for i in 0..<array.count {
        let char = array[i] 
        
        if let lastPos = lastPositions[char] {
            result.append(i - lastPos)
        } else {
            result.append(-1)
        }
        lastPositions[char] = i
    }
    
    return result
}