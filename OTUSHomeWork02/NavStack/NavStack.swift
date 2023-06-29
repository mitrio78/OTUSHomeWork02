//
//  NavStack.swift
//
//
//  Created by Exey Panteleev on 13.06.2023.
//

import SwiftUI

// MARK: - NavStackVM

final public class NavStackVM: ObservableObject {

    // MARK: - Properties

    @Published fileprivate var current: Screen?
    private var screenStack: ScreenStack = .init() {
        didSet {
            current = screenStack.top()
        }
    }

    var easing: Animation = .easeInOut(duration: 0.5)
    var navigationType: NavType = .push

    // MARK: - API

    func push<S: View>(_ screen: S) {
        navigationType = .push

        let screen: Screen = .init(
            id: UUID().uuidString,
            nextScreen: AnyView(screen)
        )

        withAnimation(easing) {
            screenStack.push(screen)
        }
    }

    func pop(to: PopDestination = .previous) {
        navigationType = .pop
        withAnimation(easing) {
            switch to {
            case .previous:
                screenStack.popToPrevious()
            case .root:
                screenStack.popToRoot()
            }
        }
    }

}

// MARK: - UI

public struct NavStack<Content>: View where Content: View {

    // MARK: - Properties

    @StateObject var viewModel: NavStackVM = .init()

    private let content: Content
    private let transitions: (push: AnyTransition, pop: AnyTransition)

    public var easing: Animation {
        get {
            viewModel.easing
        }
        set {
            viewModel.easing = newValue
        }
    }

    public var body: some View {
        let isRoot = viewModel.current == nil
        return ZStack {
            if isRoot {
                content
                    .environmentObject(viewModel)
                    .transition(viewModel.navigationType == .push ? transitions.push : transitions.pop)
            } else {
                viewModel.current!.nextScreen
                    .environmentObject(viewModel)
                    .transition(viewModel.navigationType == .push ? transitions.push : transitions.pop)
            }
        }
    }

    public init(
        transition: NavTransition,
        easing: Animation = .easeInOut(duration: 0.33),
        @ViewBuilder content: @escaping ()->Content
    ) {
        self.content = content()

        switch transition {
        case .custom(let t):
            self.transitions = (t, t)
        case .none:
            self.transitions = (.identity, .identity)
        }
    }
}

public struct NavButtonPush<Content, Destination>: View where Content: View, Destination: View {

    // MARK: - Properties

    @EnvironmentObject var viewModel: NavStackVM

    private let content: Content
    private let destination: Destination

    public init(destination: Destination, @ViewBuilder content: @escaping ()->Content) {
        self.destination = destination
        self.content = content()
    }

    public var body: some View {
        content.onTapGesture {
            push()
        }
    }

    private func push() {
        viewModel.push(destination)
    }

}

public struct NavButtonPop<Content>: View where Content: View {

    // MARK: - Properties

    @EnvironmentObject var viewModel: NavStackVM

    private let content: Content
    private let destination: PopDestination

    public init(destination: PopDestination, @ViewBuilder content: @escaping ()->Content) {
        self.destination = destination
        self.content = content()
    }

    public var body: some View {
        content.onTapGesture {
            pop()
        }
    }

    private func pop() {
        viewModel.pop(to: destination)
    }

}

// MARK: - Enums

public enum NavTransition {
    case none
    case custom(AnyTransition)
}

enum NavType {
    case push
    case pop
    case byId
}

public enum PopDestination {
    case previous
    case root
}

// MARK: - Base Logic

private struct Screen: Identifiable, Equatable {

    // MARK: - Properties

    let id: String
    let nextScreen: AnyView

    static func == (lhs: Screen, rhs: Screen) -> Bool {
        lhs.id == rhs.id
    }
}

private struct ScreenStack {

    // MARK: - Properties

    private var screens: [Screen] = .init()

    func top() -> Screen? {
        screens.last
    }

    mutating func push(_ s: Screen) {
        screens.append(s)
    }

    mutating func popToPrevious() {
        _ = screens.popLast()
    }

    mutating func popToRoot() {
        screens.removeAll()
    }

    // MARK: - Routing

    mutating func pushTo(id: String) {
        //..
    }
}
