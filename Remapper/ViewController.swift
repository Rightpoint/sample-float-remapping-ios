//
//  ViewController.swift
//  Remapper
//
//  Created by Zev Eisenberg on 3/12/17.
//  Copyright © 2017 Raizlabs. All rights reserved.
//

import UIKit
import Swiftilities

// Here is where the magic happens

extension ViewController: UITableViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateHairline()
    }

}

extension ViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateHairline()
    }

}

private extension ViewController {

    func updateHairline() {
        let offset = tableView.contentOffset.y
        print(offset)
        hairlineView.alpha = offset.scaled(from: 3...11, to: 0...1)
    }

}

// Everything after this line is just boring table view setup code

class ViewController: UIViewController {

    @IBOutlet var hairlineView: UIView!
    @IBOutlet var tableView: UITableView!

    let names = [
        "Balin",
        "Bard",
        "Beorn",
        "Bert",
        "Bifur",
        "Bilbo",
        "Bofur",
        "Bolg",
        "Bombur",
        "Dain",
        "Dori",
        "Dwalin",
        "The Elvenking",
        "Fili",
        "Gandalf the Grey",
        "Gloin",
        "Gollum",
        "The Great Goblin",
        "Kili",
        "Nori",
        "Oin",
        "Ori",
        "Smaug",
        "Thorin Oakenshield",
        "Tom",
        "William",
        ]

}

extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count + 1 // + 1 is for title cell
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            return tableView.dequeueReusableCell(withIdentifier: "TitleCell", for: indexPath)
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell", for: indexPath) as! CharacterCell
            cell.label.text = names[indexPath.row - 1]
            return cell
        }
    }

}

class TitleCell: UITableViewCell { }

class CharacterCell: UITableViewCell {

    @IBOutlet var label: UILabel!

}
