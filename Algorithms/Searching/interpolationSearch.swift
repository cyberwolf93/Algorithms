import Foundation

func interpolationSearch(arr: inout [Int], l: Int, r: Int, target: Int) -> Int { // worst O(n) , average O(log(log(n)))
    let pos = l + ( (target - arr[l]) * (r - l) / (arr[r] - arr[l]) )
    if (l > r || pos < 0 || pos >= arr.count) {
        return -1
    }

    if (arr[pos] == target) {
        return pos
    }

    if (arr[pos] < target) {
        return interpolationSearch(arr: &arr, l: pos+1, r: r, target: target)
    }

    return interpolationSearch(arr: &arr, l: l, r: pos-1, target: target)
}

func main() {
    var arr = [1, 2, 3,4 ,5 ,6 ,7 ,8,9, 10]
    print( "10 is: \(interpolationSearch(arr: &arr, l: 0, r: arr.count-1, target: 10))")
    print("====================================")
    print( "1 is: \(interpolationSearch(arr: &arr, l: 0, r: arr.count-1, target: 1))")
    print("====================================")
    print( "4 is: \(interpolationSearch(arr: &arr, l: 0, r: arr.count-1, target: 4))")
    print("====================================")
    print( "11 is: \(interpolationSearch(arr: &arr, l: 0, r: arr.count-1, target: 11))")
    print("====================================")
    print( "-1 is: \(interpolationSearch(arr: &arr, l: 0, r: arr.count-1, target: -1))")
    
}


main()