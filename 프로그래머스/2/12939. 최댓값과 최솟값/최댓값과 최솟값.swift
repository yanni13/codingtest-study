func solution(_ s:String) -> String {
    
    var arr = s.split(separator: " ").compactMap {Int($0)}
    arr = arr.sorted(by: <) //오름차순 정렬
    
    let min = arr[0]
    let max = arr[arr.index(before: arr.endIndex)]
    
    
    return String(min) + " " + String(max)
}