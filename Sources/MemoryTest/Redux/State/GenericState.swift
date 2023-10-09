import ReSwift

protocol GenericState: StateType {
    var foo: String { get }
    var bar: Int { get }
    var substates: [SubState] { get }
}
