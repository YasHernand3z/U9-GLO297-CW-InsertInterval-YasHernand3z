import UIKit

var greeting = "Hello, playground"

func splitNCases(_ text: String, _ size: Int) -> [String] {
    let stringSize = text.count / size
    if text.count % size != 0  || text.count < size{
        return ["ERROR"]
    }
    var result: [String] = []
    var hasReachEnd = false
    var indexStart = text.startIndex
    var endIndex: String.Index
    while indexStart < text.endIndex {
        endIndex = text.index(indexStart, offsetBy: stringSize)
        let substring = String(text[indexStart..<endIndex])
        result.append(substring)
        indexStart = endIndex
        
    }
    return result
}


splitNCases("Strengthened", 6)

splitNCases("Unscrupulous", 2)

splitNCases("Flavorless", 1)
