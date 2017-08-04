//
//  SeasonViewController.swift
//  Westeros
//
//  Created by Carlos on 4/8/17.
//  Copyright © 2017 THO. All rights reserved.
//

import UIKit

class SeasonViewController: UIViewController {

    @IBOutlet weak var seasonNameView: UILabel!
    @IBOutlet weak var releaseDateView: UILabel!
    @IBOutlet weak var episodesDescriptionView: UITextView!
    
    let model : Season
    
    init(model: Season) {
        self.model = model
        
        super.init(nibName: nil, bundle: nil)
        
        title = model.description
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func syncViewWithModel(){
        seasonNameView.text = model.name
        releaseDateView.text = model.releaseDate.description
        
        var episodesMultilineText = model.sortedEpisodes().map {$0.description}.joined(separator: "\n")
        print("Multiline: ", episodesMultilineText)
        episodesDescriptionView.text = episodesMultilineText
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
