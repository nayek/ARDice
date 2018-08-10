//
//  ViewController.swift
//  ARDice
//
//  Created by Paul Larsen on 8/9/18.
//  Copyright © 2018 Paul Larsen. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // Create a new scene
        //let scene = SCNScene(named: "art.scnassets/ship.scn")!
        let earth = SCNSphere(radius: 0.2)
        let moon = SCNSphere(radius:0.1)
        let jupiter = SCNSphere(radius:0.4)
        let ematerial = SCNMaterial()
        let mmaterial = SCNMaterial()
        let jmaterial = SCNMaterial()
        
        ematerial.diffuse.contents = UIImage(named: "art.scnassets/2k_earth_daymap.jpg")
        mmaterial.diffuse.contents = UIImage(named: "art.scnassets/2k_moon.jpg")
        jmaterial.diffuse.contents = UIImage(named: "art.scnassets/2k_jupiter.jpg")
        
        earth.materials = [ematerial]
        moon.materials = [mmaterial]
        jupiter.materials = [jmaterial]
        
        let enode = SCNNode()
        let mnode = SCNNode()
        let jnode = SCNNode()
        
        enode.position = SCNVector3(x: 0, y: 0.1, z: -0.5)
        mnode.position = SCNVector3(x: 0, y: 0.1, z: -2)
        jnode.position = SCNVector3(x: 0, y: 0.1, z: 3)
        enode.geometry = earth
        mnode.geometry = moon
        jnode.geometry = jupiter
        
        sceneView.scene.rootNode.addChildNode(enode)
        sceneView.scene.rootNode.addChildNode(mnode)
        sceneView.scene.rootNode.addChildNode(jnode)
        
        sceneView.autoenablesDefaultLighting = true
        // Set the scene to the view
        //sceneView.scene = scene
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
