//
//  EpisodeViewController.swift
//  Westeros
//
//  Created by Carlos on 5/8/17.
//  Copyright © 2017 THO. All rights reserved.
//

import UIKit


// MARK: - EpisodeVC Class

class EpisodeViewController: UIViewController {

    @IBOutlet weak var seasonView: UILabel!
    @IBOutlet weak var episodeView: UILabel!
    @IBOutlet weak var premierDataView: UILabel!
    
    let model : Episode
    
    init(model: Episode) {
        self.model = model
        
        super.init(nibName: nil, bundle: nil)
        
        title = model.description
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func syncViewWithModel(){
        seasonView.text = "Season: " + (model.episodeFromSeason?.name)!
        episodeView.text = "Episode: " + model.description
        premierDataView.text = "Broadcast Date: " + model.broadcastDate.formatDate2StringYYYYMMdd()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        syncViewWithModel()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
