//
//  ViewLockedUIView.swift
//  GialApp_App
//
//  Created by Andrew Amato on 22/06/17.
//  Copyright © 2017 Andrew Amato. All rights reserved.
//

import UIKit

class ViewAccelerazioneUIView: UIView {

  
    @IBOutlet weak var velocitaIsta: UILabel!
    @IBOutlet weak var velocitaMax: UILabel!
    @IBOutlet weak var velocitaMedia: UILabel!
    @IBOutlet weak var massimaLabel: UILabel!
    @IBOutlet weak var mediaLabel: UILabel!
    @IBOutlet weak var lineaSeparazione: UIImageView!
    
    var framePiccolo = CGRect()
    var boundsPiccolo = CGRect()
    var frameGrande = CGRect()
    var boundsGrande = CGRect()
    
    var velocitaNumero: Int = 80
    
    
    open func changeTheSize(scaleFactor: CGFloat, newTemporaryBounds: CGRect) {
        velocitaIsta.frame.size.width *= scaleFactor
        velocitaIsta.frame.size.height *= scaleFactor
        frame.size.width *= scaleFactor
        frame.size.height *= scaleFactor
        center.x = newTemporaryBounds.width/2
        center.y = newTemporaryBounds.height/2
        
        velocitaIsta.center = center
        
    }
    
    func setInitialFrame()  {
        self.frame = boundsPiccolo
        layer.cornerRadius = 10.0

        //questo è per i contenuti
        velocitaIsta.frame.size.width = frame.width*0.9
        velocitaIsta.adjustsFontSizeToFitWidth = true
        velocitaIsta.center = center
        
        velocitaMax.alpha = 0
        massimaLabel.alpha = 0
        mediaLabel.alpha = 0
        velocitaMedia.alpha = 0
        lineaSeparazione.alpha = 0
        
        
    }
    
    func setInMiniatura() {
        print("sto dentro la set in miniatura \(frame)")
        frame = boundsPiccolo
        velocitaIsta.center = center
        
    }
    
    
    func setFullSize () {
        print("sto dentro la setfullsize \(frame)")
        frame = boundsGrande
        velocitaIsta.center = center
        velocitaIsta.center.y = frame.height/3
        velocitaMax.alpha = 1
        velocitaMax.center.x = frame.width/4
        velocitaMax.center.y = frame.height - velocitaMax.frame.height/2
        velocitaMedia.alpha = 1
        velocitaMedia.center.x = 3*frame.width/4
        velocitaMedia.center.y = velocitaMax.center.y

        massimaLabel.alpha = 1
        massimaLabel.center.x = velocitaMax.center.x
        massimaLabel.center.y = velocitaMax.center.y - 5 - massimaLabel.frame.height
        
        mediaLabel.alpha = 1
        mediaLabel.center.x = velocitaMedia.center.x
        mediaLabel.center.y = massimaLabel.center.y

        lineaSeparazione.alpha = 1
        lineaSeparazione.center.x = center.x
        lineaSeparazione.center.y = massimaLabel.center.y - massimaLabel.frame.height
    }

    
    func aggiornaVelocita() {
        
        if arc4random_uniform(2) == 0 {
            velocitaNumero += 2
        } else {
            velocitaNumero -= 2
        }
        
        velocitaIsta.text = String(velocitaNumero) + " KM/H"
    }
}
