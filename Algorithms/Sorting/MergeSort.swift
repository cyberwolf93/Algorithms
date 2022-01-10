import Foundation

func mergeSort(arr: inout [Int], l: Int, r: Int) {
    let mid = (l + r) / 2
    if (l >= r) { return }

    mergeSort(arr: &arr, l: l, r: mid)
    mergeSort(arr: &arr, l: mid+1, r: r)
    
    merge(arr: &arr, l: l, mid: mid, r: r)
}
func merge(arr: inout [Int], l: Int, mid: Int, r: Int) {
    let left = l
    let right = r
    let subOne = mid - left + 1
    let subTwo = right - mid
    var index = left
    var leftArr:[Int] = []
    var rightArr:[Int] = []

    for i in 0...subOne-1 {
        leftArr.append(arr[left+i])
    }
    for i in 0...subTwo-1 {
        rightArr.append(arr[mid+1+i])
    }
    var i = 0
    var j = 0
    while (i < subOne && j < subTwo) {
        if (leftArr[i] < rightArr[j]) {
            arr[index] = leftArr[i]
            i += 1
            
        } else {
            arr[index] = rightArr[j]
            j += 1
        }

        index += 1
    }
    while(i < subOne) {
        arr[index] = leftArr[i]
        index += 1
        i += 1
    }
    while(j < subTwo) {
        arr[index] = rightArr[j]
        index += 1
        j += 1
    }
}

func main() {
    var arr = [64, 34, 25, 12, 100, 22, 11, 90]
    mergeSort(arr: &arr, l: 0, r: arr.count-1)
    print(arr)
}
main()