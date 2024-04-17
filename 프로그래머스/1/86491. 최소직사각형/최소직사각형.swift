import Foundation

func solution(_ sizes:[[Int]]) -> Int {
    var sizes = sizes
    
    var x: [Int] = []
    var y: [Int] = []
    
    for i in 0..<sizes.count {
        sizes[i].sort()
        
        x.append(sizes[i][0])
        y.append(sizes[i][1])
    
    }
    return x.max()! * y.max()!
}