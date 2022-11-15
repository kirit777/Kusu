//
//  CustomeLoading.swift
//  Kusu
//
//  Created by Kirit on 15/11/22.
//

import UIKit

class CustomeLoading: UIViewController {

    @IBOutlet weak var secView: KusuView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    func animate(view:UIView){
        let zoomInAndOut = CABasicAnimation(keyPath: "transform.scale")
        zoomInAndOut.fromValue = 1.0
        zoomInAndOut.toValue = 1.2
        zoomInAndOut.duration = 0.5
        zoomInAndOut.repeatCount = 0
        zoomInAndOut.autoreverses = false
        zoomInAndOut.speed = 2.0
        view.layer.add(zoomInAndOut, forKey: nil)
        view.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

