func solution(_ phone_number:String) -> String {
    
    var mapping = phone_number.map {String($0)} //문자열을 배열로 바꿈
    for i in 0..<mapping.count - 4 {
        mapping[i] = "*"
    }
    
    return mapping.joined()
}