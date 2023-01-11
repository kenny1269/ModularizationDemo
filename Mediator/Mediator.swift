//
//  Mediator.swift
//  Mediator
//
//  Created by keyu on 2023/1/10.
//

import UIKit

public class Mediator {
    static public let shared = Mediator()

    private var registeredModuleDict: [String: Any] = [:]

    public var currentViewController: UIViewController? {
        if let windowScene = UIApplication.shared.connectedScenes.first(where: { $0 is UIWindowScene }) as? UIWindowScene,
        let navigationViewController = windowScene.keyWindow?.rootViewController as? UINavigationController {
            return navigationViewController.topViewController
        }

        return nil
    }

    public func register<Serivce>(module: Serivce, for serviceType: Serivce.Type) {
        registeredModuleDict[String(describing: serviceType)] = module
    }

    public func module<Service>(for serviceType: Service.Type) -> Service {
        if let module = registeredModuleDict[String(describing: serviceType)] as? Service {
            return module
        } else {
            fatalError("no module registered for service: \(serviceType)")
        }
    }
}

public protocol ModuleAService {
    func pusheAViewController()
}

public protocol ModuleBService {
    func pusheBViewController()
}
