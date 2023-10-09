import Foundation

@propertyWrapper
struct StoredOnHeap<T> {
    private var value: [T]

    init(wrappedValue: T) {
        value = [wrappedValue]
    }

    var wrappedValue: T {
        get {
            value[0]
        }

        set {
            value[0] = newValue
        }
    }
}
