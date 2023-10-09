import ReSwift

enum Middlewares {
    static func stateLoggingMiddleware<T: GenericState>() -> Middleware<T> {
        { dispatch, getState in
            { next in
                { action in
                    print("State:")
                    var (oldStateDescription, newStateDescription) = ("", "")
                    guard let oldState = getState(), let newState = getState() else { return }
                    next(action)
                    
                    dump(oldState, to: &oldStateDescription)
                    dump(newState, to: &newStateDescription)
                    
                    withUnsafePointer(to: oldState) { pointer in
                        print("-old\n- Memory address: \(pointer)\n\(oldStateDescription)")
                    }
                    withUnsafePointer(to: newState) { pointer in
                        print("-new\n- Memory address: \(pointer)\n\(newStateDescription)")
                    }
                }
            }
        }
    } 

    static func actionLoggingMiddleware<T: StateType>() -> Middleware<T> {
        { dispatch, getState in
            { next in
                { action in
                    print("Action: \(action)")
                    return next(action)
                }
            }
        }
    }
}


