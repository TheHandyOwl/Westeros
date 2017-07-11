//
//  HouseViewController.swift
//  Westeros
//
//  Created by Carlos on 10/7/17.
//  Copyright © 2017 THO. All rights reserved.
//

import UIKit

class HouseViewController: UIViewController {

    @IBOutlet weak var houseNameView: UILabel!
    @IBOutlet weak var wordsView: UILabel!
    @IBOutlet weak var sigilImageView: UIImageView!

    // Modelo
    let model : House
    
    init(model: House){
        self.model = model
        // Si metemos aquí el title = model.name petaría
        super.init(nibName: nil, bundle: nil)
        
        // Tras el super.init
        // Tras inicializar
        title = model.name
        
        // Se puede poner aquí un color para la barra de botones
        // Pero mejor no poner nada de la vista aquí
        // Puede que pete con Objective C
    }
    
    //Parche de los de Cupertino (relacionada con los nil)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been impemented")
    }

    func syncViewWithModel(){
        // model -> view
        houseNameView.text = "House: \(model.name)"
        sigilImageView.image = model.sigil.image
        wordsView.text = model.words
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        syncViewWithModel()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        UITabBar.appearance().backgroundColor = UIColor.gray
        
        let appearance = UITabBarItem.appearance()
        let attributesSelected: [String: Any] = [
            NSForegroundColorAttributeName: UIColor.darkGray
        ]
        appearance.setTitleTextAttributes(attributesSelected, for: .selected)
        let attributesNormal: [String: Any] = [
            NSForegroundColorAttributeName: UIColor.lightGray
        ]
        appearance.setTitleTextAttributes(attributesNormal, for: .normal)
    }
}