import Foundation

func solution(_ keymap:[String], _ targets:[String]) -> [Int] {
    var result = Array<Int>()
    
    
    for i in targets {
        var totalCount = 0
        var sumCount = 0
        var isPossible = true
        
        for j in i {
            var minIndex: Int? = nil
            
            for key in keymap {
                if let index = key.firstIndex(of: j) {
                    totalCount = key.distance(from: key.startIndex, to: index) + 1
                    if minIndex == nil || totalCount < minIndex! {
                        minIndex = totalCount
                    }
                }
            }
            
            if let minValue = minIndex {
                sumCount += minValue
            } else {
                isPossible = false
                break
            }
        }
        result.append(isPossible ? sumCount : -1)
        
        // if result.allSatisfy( {$0 == 0 }) {
        //     return [-1]
        // }        
    }
    return result
}