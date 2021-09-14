//
//  DetailViewController.swift
//  ParsingJSON
//
//  Created by Дмитрий Рузайкин on 28.08.2021.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var postIdLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    var state: StateJSON?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        postIdLabel.text = "\(state?.postId)"
        nameLabel.text = state?.name
        emailLabel.text = state?.email
        bodyLabel.text = state?.body
    }


}
