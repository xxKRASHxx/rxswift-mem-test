import ReSwift

struct State: GenericState {
    var foo: String
    var bar: Int
    var substates: [SubState]
    
    static let initial: State = .init(foo: "initial string", bar: 0, substates: [])
}

public struct HeapState: GenericState {
    @StoredOnHeap var foo: String
    @StoredOnHeap var bar: Int
    @StoredOnHeap var substates: [SubState]
    
    static let initial: HeapState = .init(foo: "initial string", bar: 0, substates: [])
}
