//
//  SNSviewController.swift
//  aboutMe
//
//  Created by 김수완 on 2020/07/24.
//  Copyright © 2020 김수완. All rights reserved.
//

import UIKit

class SNSviewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var table: UITableView!
    
    var SNSes = [sns]()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureSongs()
        table.delegate = self
        table.dataSource = self
    }

    func configureSongs() {
        SNSes.append(sns(SNSname: "instagram",
                         ID: "XXW9999",
                         url: "https://www.instagram.com/xxw9999/",
                         image: "instagram"))
        SNSes.append(sns(SNSname: "Facebook",
                         ID: "수완",
                         url: "https://www.facebook.com/profile.php?id=100023288092815",
                         image: "facebook"))
        SNSes.append(sns(SNSname: "Github",
                         ID: "Kimxwan0319",
                         url: "https://github.com/kimxwan0319",
                         image: "github"))
    }

    // Table

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SNSes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let sns = SNSes[indexPath.row]
        // configure
        cell.textLabel?.text = sns.ID
        cell.detailTextLabel?.text = sns.SNSname
        cell.accessoryType = .disclosureIndicator
        cell.imageView?.image = UIImage(named: sns.image)
        cell.textLabel?.font = UIFont(name: "Helvetica-Bold", size: 18)
        cell.detailTextLabel?.font = UIFont(name: "Helvetica", size: 15)

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        // present the player
        let position = indexPath.row
        guard let vc = storyboard?.instantiateViewController(identifier: "webViewer") as? webViewController else {
            return
        }
        vc.SNSes = SNSes
        vc.position = position
        present(vc, animated: true)
    }


}

struct sns {
    let SNSname: String
    let ID : String
    let url : String
    let image : String
}
