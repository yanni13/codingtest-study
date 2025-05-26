import Foundation

func solution(_ ingredient:[Int]) -> Int {
    // 빵-야채-고기-빵
    var hambuger: [Int] = [1,2,3,1]
    
    var stack = [Int]()
    var count = 0
    
    for i in ingredient {
        stack.append(i)
        
        if Array(stack.suffix(4)) == hambuger {
            stack.removeLast(4)
            count+=1
        }
    }
    return count
}