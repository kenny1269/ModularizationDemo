//
//  ViewController.swift
//  ModularizationDemo
//
//  Created by keyu on 2023/1/10.
//

import UIKit
import Mediator

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        title = "Home"
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        if indexPath.row == 0 {
            var content = cell.defaultContentConfiguration()
            content.text = "push"
            cell.contentConfiguration = content
        }

        return cell
    }


}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("cell did select")

        if indexPath.row == 0 {
            Mediator.shared.module(for: ModuleAService.self).pusheAViewController()
        }


        
    }
}
