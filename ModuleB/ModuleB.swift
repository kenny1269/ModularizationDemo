//
//  ModuleB.swift
//  ModuleB
//
//  Created by keyu on 2023/1/10.
//

import UIKit
import Mediator

public class ModuleB: ModuleBService {
    public func pusheBViewController() {
        Mediator.shared.currentViewController?.navigationController?.pushViewController(BViewController(nibName: nil, bundle: nil), animated: true)
    }

    public init() {

    }
}


class BViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        title = "B ViewController"

//        let button = UIButton(frame: .zero)
//        button.setTitle("push", for: .normal)
//        button.center = view.center
//        button.addTarget(self, action: #selector(push), for: .touchUpInside)
//        view.addSubview(button)
    }

//    @objc func push() {
//
//    }
}
