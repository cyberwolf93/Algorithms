import Foundation

class Heap {
    var arr:[Int] = []
    var hSize = 0

    private func getParent(_ i: Int) -> Int? {
        let index = (i - 1) / 2
        return index >= 0 ? index : nil
    }

    private func getLeftChild(_ i: Int) -> Int? {
        let index = (2*i) + 1
        return index < hSize ? index : nil
    }

    private func getRightChild(_ i: Int) -> Int? {
        let index = (2*i) + 2
        return index < hSize ? index : nil
    }

    func build(arr: [Int]) {
        self.arr = arr
        self.hSize = arr.count

        var startIndex = hSize / 2 + 1
        while startIndex >= 0 {
            heapify(startIndex)
            startIndex -= 1
        }

    }

    private func swap(_ a: Int,_ b: Int) {
        let temp = arr[a]
        arr[a] = arr[b]
        arr[b] = temp
    }

    func heapify(_ i: Int) {
        var largest = i
        let left = getLeftChild(i)
        let right = getRightChild(i)
        if let left = left, arr[left] > arr[largest] {
            largest = left
        }

        if let right = right, arr[right] > arr[largest] {
            largest = right
        }

        if largest != i {
            swap(i, largest)
            heapify(largest)
        }
    }

    func deleteMax() {
        swap(0,hSize-1)
        hSize -= 1
        heapify(0)
        
    }

    func heapSort() { // O(nLogn)
        if (hSize < 2) {
            return
        }

        while hSize > 0 {
            deleteMax()
        }

    }

    func printHeap() {
        print(arr)
    }


}

func main() {
    let heap = Heap()
    let arr = [64, 34, 25, 12, 100, 22, 11, 90]
    heap.build(arr: arr)
    heap.printHeap()
    heap.heapSort()
    heap.printHeap()
}

main()