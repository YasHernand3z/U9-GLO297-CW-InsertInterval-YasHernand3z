func mergeIntervals(intervals: [(Int, Int)], newInterval: (Int, Int)) -> [(Int, Int)] {
    if intervals.count == 0 {
        return [newInterval]
    }
    
    var indexStart = intervals.lastIndex(where: {return newInterval.0 > $0.0}) ?? 0
    var indexEnd = intervals.lastIndex(where: {return newInterval.1 > $0.0}) ?? 0
    var newIntervals: [(Int, Int)] = []
    
    if indexStart > 0 {
        newIntervals.append(contentsOf: intervals[0..<indexStart])
        newIntervals.append(updateInterval(startInterval: intervals[indexStart], endInterval: intervals[indexEnd], newInterval: newInterval))
    } else {
        if isOverlaping(intervalA: newInterval, intervalB: intervals[indexStart]) {
            newIntervals.append(updateInterval(startInterval: intervals[indexStart], endInterval: intervals[indexEnd], newInterval: newInterval))
        } else {
            newIntervals.append(newInterval)
            newIntervals.append(intervals[indexStart])
        }
    }
    
    let index =  indexEnd + 1
    let count = intervals.count - 1

    if index < count {
        newIntervals.append(contentsOf: intervals[index...count])
    } else if index == count {
        newIntervals.append(intervals[index])
    }
    
    
    return newIntervals
}

func isOverlaping(intervalA: (Int, Int), intervalB: (Int, Int)) -> Bool {
    return  intervalA.1 >= intervalB.0 || intervalA.1 >= intervalB.1
}

func updateInterval(startInterval: (Int, Int), endInterval: (Int, Int), newInterval: (Int, Int)) -> (Int, Int)
{
    let startRange = startInterval.0 < newInterval.0 ? startInterval.0 : newInterval.0
    let endRange = endInterval.1 > newInterval.1 ? endInterval.1 : newInterval.1
    
    return (startRange, endRange)
}


let newIntervals01 = mergeIntervals(intervals: [(1,3), (6,9)], newInterval: (2,8))
let newIntervals02 = mergeIntervals(intervals: [], newInterval: (2,8))
let newIntervals03 = mergeIntervals(intervals: [(1,3), (6,9)], newInterval: (2,5))
let newIntervals04 = mergeIntervals(intervals: [(1,2), (3,5), (6,7), (8,10), (12, 16)], newInterval: (4,9))
let newIntervals05 = mergeIntervals(intervals: [(1,3), (6,9), (12,16)], newInterval: (2,5))
let newIntervals06 = mergeIntervals(intervals: [(6,9), (12,16)], newInterval: (1,3))
let newIntervals07 = mergeIntervals(intervals: [(3,4), (5,7)], newInterval: (2,3))
