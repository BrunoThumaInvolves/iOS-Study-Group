class MultiSet {

    private var elements = [Int:Int]()

    func add(element: Int) {
        var count = elements[element] ?? 0
        count += 1
        elements[element] = count
    }

    func contains(element: Int) -> Bool {
        guard let count = elements[element] else {
            return false
        }
        return count > 0
    }

    func count(element: Int) -> Int {
        return elements[element] ?? 0
    }

    func remove(element: Int) {
        guard var count = elements[element] else {
            return
        }
        count -= 1
        elements[element] = count
    }

}
