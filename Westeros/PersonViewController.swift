//
//  PersonViewController.swift
//  Westeros
//
//  Created by Carlos on 7/8/17.
//  Copyright © 2017 THO. All rights reserved.
//

import UIKit

class PersonViewController: UIViewController {

    @IBOutlet weak var nameView: UILabel!
    @IBOutlet weak var aliasView: UILabel!
    @IBOutlet weak var houseView: UILabel!
    
    let model : Person
    
    init(model: Person){
        self.model = model
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func syncViewWithModel() {
        nameView.text = "Name: " + model.name
        aliasView.text = "Alias: " + model.alias
        houseView.text = "House: " + model.house.name
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        syncViewWithModel()
    }

}
