//
//  ModuleA.swift
//  ModuleA
//
//  Created by keyu on 2023/1/10.
//

import UIKit
import Mediator

public class ModuleA: ModuleAService {

    public func pusheAViewController() {
        Mediator.shared.currentViewController?.navigationController?.pushViewController(AViewController(nibName: nil, bundle: nil), animated: true)
    }

    public init() {

    }
}


class AViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        title = "A ViewController"

        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("push", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(push), for: .touchUpInside)
        view.addSubview(button)

        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

    @objc func push() {
        Mediator.shared.module(for: ModuleBService.self).pusheBViewController()
    }
}
