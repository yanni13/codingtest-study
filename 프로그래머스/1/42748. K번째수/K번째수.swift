import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {

    var result: [Int] = [] 
    
    for command in commands {

        let start = command[0] - 1
        let finish = command[1] - 1
        let k = command[2] - 1
        
        let resultArray = Array(array[start...finish]).sorted()
        result.append(resultArray[k])
    }

    return result
}