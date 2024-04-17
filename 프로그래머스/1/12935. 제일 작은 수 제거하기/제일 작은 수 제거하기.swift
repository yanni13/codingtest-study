func solution(_ arr:[Int]) -> [Int] {
    
    var arr1 = arr
    
    if arr.count == 1 {
        arr1[0] = -1
        
        return arr1
    }
    else {
        let min = arr1.firstIndex(of: arr1.min()!)!
        arr1.remove(at: min)
        
        return arr1
    }
    
}
