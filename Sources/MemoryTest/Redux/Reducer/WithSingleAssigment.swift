import ReSwift

enum WithSingleAssigment {
    static let reduce: Reducer<State> = { action, state in .init(
        foo: reduceFoo(action, state?.foo),
        bar: reduceBar(action, state?.bar),
        substates: reduceSubstates(action, state?.substates))
    }
    
    static let reduceHeap: Reducer<HeapState> = { action, state in .init(
        foo: reduceFoo(action, state?.foo),
        bar: reduceBar(action, state?.bar),
        substates: reduceSubstates(action, state?.substates))
    }
}

private extension WithSingleAssigment {
    static let reduceFoo: Reducer<String> = { action, state in
        switch action {
        case is Actions.A:
            return "\(state ?? State.initial.foo) B"
        default:
            return state ?? State.initial.foo
        }
    }
    
    static let reduceBar: Reducer<Int> = { action, state in
        switch action {
        case is Actions.B:
            return state ?? State.initial.bar + 1
        default:
            return state ?? State.initial.bar
        }
    }
    
    static let reduceSubstates: Reducer<[SubState]> = { action, state in
        switch action {
        case let action as Actions.C:
            return state ?? State.initial.substates + [.init(name: action.name)]
        default:
            return state ?? State.initial.substates
        }
    }
}
