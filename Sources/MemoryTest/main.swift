import ReSwift

let sequence = (1...100_000)

func generateAction(for item: Int) -> Action {
    switch item % 3 {
    case 0:
        return Actions.A()
    case 1:
        return Actions.B()
    case 2:
        return Actions.C(name: item.description)
    default:
        fatalError()
    }
}

@available(macOS 13.0, *)
func test<T: GenericState>(store: Store<T>, with sequence: ClosedRange<Int>, name: String) {
    print("--- Test store: \(name) ---")
    let clock = ContinuousClock()
    let result = clock.measure {
        sequence.forEach { item in
            store.dispatch(generateAction(for: item))
        }
    }
    print(result)
    reportMemory()
    print("--- End test ---")
}

// Try to comment tests in order to see isolated mem reports!
(1...3).forEach { run in
    guard #available(macOS 13.0, *) else { fatalError("Unsupported target OS") }
    print("=== Run \(run) ===\n")
    test(store: Stores.multipleAssigmentHeapStore(), with: sequence, name: "Multiple assigments ON HEAP")
    test(store: Stores.multipleAssigmentStore(), with: sequence, name: "Multiple assigments PLAIN STRUCT")
    test(store: Stores.singleAssigmentHeapStore(), with: sequence, name: "Single assigments ON HEAP")
    test(store: Stores.singleAssigmentStore(), with: sequence, name: "Single assigments PLAIN STRUCT")
    print("\n=== Run \(run) done. ===\n\n")
}

print("All done!")
