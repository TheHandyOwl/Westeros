//
//  WikiViewController.swift
//  Westeros
//
//  Created by Carlos on 17/7/17.
//  Copyright © 2017 THO. All rights reserved.
//

import UIKit

class WikiViewController: UIViewController {

    @IBOutlet weak var browserView: UIWebView!
    @IBOutlet weak var activityView: UIActivityIndicatorView!
    
    // Lo hacemos privado para no manipularlo desde fuera
    // Finalmente lo deja como privado
    let model : House
    
    init(model: House) {
        self.model = model
        // Llamamos al inicializador designado
        super.init(nibName: nil, bundle: nil)
    }
    
    // Esto lo pone por defecto
    // Se pone y punto, ¿queda claro?
    // Es por el pánico que tiene Swift a nil
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Sincronizar la vista con el modelo
    // Primero tocamos la vista y luego volvemos aquí
    func syncViewWithModel(){
        
        // Activity
        activityView.isHidden = false
        activityView.startAnimating()
        
        title = model.name
        
        // Delegado para que funcione el delegado
        browserView.delegate = self
        
        browserView.loadRequest(URLRequest(url: model.wikiURL))
    }
    
    // ¿Y cuándo llamamos a la función de sincronización?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        syncViewWithModel()
        
    }
    
}

extension WikiViewController : UIWebViewDelegate{
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        // Aquí detenemos el activity
        activityView.stopAnimating()
        activityView.isHidden = true
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        // Esto comprueba lo que hace el usuario para bloquear (o no) la navegación
        if (navigationType == .linkClicked || navigationType == .formSubmitted) {
            return false
        } else {
            return true
        }
        
    }
    
}










