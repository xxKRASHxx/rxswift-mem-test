//
//  File.swift
//  
//
//  Created by Daniel Lisovoy on 09.10.2023.
//

import ReSwift

enum Stores {
    
    enum Logging {
        case enabled, disabled
    }
    
    static let logging: Logging = .disabled
    
    static func multipleAssigmentStore() -> Store<State> {
        .init(
            reducer: WithMultipleAssigment.reduce, 
            state: State.initial,
            middleware: logging == .enabled 
            ? [Middlewares.actionLoggingMiddleware(), Middlewares.stateLoggingMiddleware()]
            : [])
    }

    static func singleAssigmentStore() -> Store<State> { 
        .init(
            reducer: WithSingleAssigment.reduce, 
            state: State.initial,
            middleware: logging == .enabled 
            ? [Middlewares.actionLoggingMiddleware(), Middlewares.stateLoggingMiddleware()]
            : [])
    }

    static func singleAssigmentHeapStore() -> Store<HeapState> { 
        .init(
            reducer: WithSingleAssigment.reduceHeap, 
            state: HeapState.initial,
            middleware: logging == .enabled 
            ? [Middlewares.actionLoggingMiddleware(), Middlewares.stateLoggingMiddleware()]
            : [])
    }

    static func multipleAssigmentHeapStore() -> Store<HeapState> { 
        .init(
            reducer: WithMultipleAssigment.reduceHeap, 
            state: HeapState.initial,
            middleware: logging == .enabled 
            ? [Middlewares.actionLoggingMiddleware(), Middlewares.stateLoggingMiddleware()]
            : [])
    }
}
