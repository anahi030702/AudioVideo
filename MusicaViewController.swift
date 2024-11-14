//
//  ViewController.swift
//  AudioVideo
//
//  Created by Igmar Salazar on 07/03/23.
//

import UIKit
import AVFoundation

class MusicaViewController: UIViewController
{
    
    @IBOutlet weak var sldAvance: UISlider!
    
    @IBOutlet weak var lblTiempo: UILabel!
    
    @IBOutlet weak var imvCancion: UIImageView!
    
    @IBOutlet weak var lblCancion: UILabel!
    
    @IBOutlet weak var lblArtista: UILabel!
    
    @IBOutlet weak var lblContador: UILabel!
    
    @IBOutlet weak var sgcPaneo: UISegmentedControl!
    
    @IBOutlet weak var sldVolumen: UISlider!
    
    let canciones = ["Back in black", "Crazy", "Let It Be"]
    let artistas = ["AC/DC", "Aerosmith", "The Beatles"]
    let webs = ["https://www.acdc.com", "https://www.aerosmith.com", "https://www.thebeatles.com"]
    var indice = 0
    var reproductor = AVAudioPlayer()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setearTrack()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func avanzarTrack() {
    }
    
    @IBAction func cambiarVelocidad() {
    }
    
    @IBAction func playPausa(_ sender: UIButton) {
        if reproductor.isPlaying{
            reproductor.pause()
            sender.setImage(UIImage(named: "play.png"), for: .normal)
        }else{
            reproductor.play()
            sender.setImage(UIImage(named: "pause.png"), for: .normal)
        }
    }
    
    @IBAction func panear() {
    }
    
    @IBAction func cambiarVolumen(_ sender: Any) {
    }
    
    @IBAction func irSiguiente(_ sender: UISwipeGestureRecognizer) {
        indice += 1
        if indice == canciones.count{
            indice = canciones.count - 1
        }
        setearTrack()
    }
    
    @IBAction func irAnterior(_ sender: Any) {
        indice -= 1
        if indice == -1{
            indice = 0
        }
        setearTrack()
    }
    
    func setearTrack(){
        imvCancion.image = UIImage(named: canciones[indice] + ".jpg")
        lblCancion.text = canciones[indice]
        lblArtista.text = canciones[indice]
        lblContador.text = "\(indice + 1) / \(canciones.count)"
        
        if let x = Bundle.main.path(forResource: canciones[indice], ofType: "mp3"){
            let pathURL = URL(fileURLWithPath: x)
            do{
                reproductor = try AVAudioPlayer(contentsOf: pathURL)
            }catch{
                print("NO SE PUDO CARGAR")
            }
        }else{
            print("NO SE ENCONTRO")
        }
    }
}
