import ReSwift

enum WithMultipleAssigment {
    static let reduce: Reducer<State> = { action, state in
        var state = state ?? .initial
        state = reduceFoo(action, state)
        state = reduceBar(action, state)
        state = reduceSubstate(action, state)
        return state
    }
    
    static let reduceHeap: Reducer<HeapState> = { action, state in
        var state = state ?? .initial
        state = reduceFooHeap(action, state)
        state = reduceBarHeap(action, state)
        state = reduceSubstateHeap(action, state)
        return state
    }
}

private extension WithMultipleAssigment {
    static let reduceFoo: Reducer<State> = { action, state in
        var state = state ?? .initial
        if action is Actions.A {
            state.foo = "\(state.foo) A"
        }
        return state
    }
    
    static let reduceBar: Reducer<State> = { action, state in
        var state = state ?? .initial
        if action is Actions.B {
            state.bar = state.bar + 1
        }
        return state
    }
    
    static let reduceSubstate: Reducer<State> = { action, state in
        var state = state ?? .initial
        if let action = action as? Actions.C {
            state.substates += [.init(name: action.name)]
        }
        return state
    }
    
    static let reduceFooHeap: Reducer<HeapState> = { action, state in
        var state = state ?? .initial
        if action is Actions.A {
            state.foo = "\(state.foo) A"
        }
        return state
    }
    
    static let reduceBarHeap: Reducer<HeapState> = { action, state in
        var state = state ?? .initial
        if action is Actions.B {
            state.bar = state.bar + 1
        }
        return state
    }
    
    static let reduceSubstateHeap: Reducer<HeapState> = { action, state in
        var state = state ?? .initial
        if let action = action as? Actions.C {
            state.substates += [.init(name: action.name)]
        }
        return state
    }
}
