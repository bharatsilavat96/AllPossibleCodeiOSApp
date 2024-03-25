//
//  CoreAnimationAllViewController.swift
//  AllInOneiOSProjectApp
//
//  Created by Apple on 18/04/23.
//

import UIKit

class CoreAnimationAllViewController: UIViewController {
    
    @IBOutlet weak var allAnimationTableView: UITableView!
    
    var animationArray : [String] =  ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q"]
    var isAnimationRunning = false
    var animationStates: [Int: Bool] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allAnimationTableView.dataSource = self
        allAnimationTableView.delegate = self
    }
    
}
extension CoreAnimationAllViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animationArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AllAnimationTableViewCell", for: indexPath) as! AllAnimationTableViewCell
        let buttonTittle: String = animationArray[indexPath.row]
        cell.isUserInteractionEnabled = true
        cell.animationButton.tag = indexPath.row
        cell.animationView.backgroundColor = .random()
        cell.animationButton.setTitle("Animate : \(buttonTittle)", for: .normal)
        cell.animationButton.addTarget(self, action: #selector(setUpCellWithButtonNameAndAnimation(sender:)), for: .touchUpInside)
        return cell
    }
    
    @objc func setUpCellWithButtonNameAndAnimation(sender: UIButton) {
        let buttonTag = sender.tag
        print("Button Tag: \(buttonTag)")
        let cell = allAnimationTableView.cellForRow(at: IndexPath(row: buttonTag, section: 0)) as! AllAnimationTableViewCell
        
        // Check if animation is already running for the cell
        if let isAnimationRunning = animationStates[buttonTag], isAnimationRunning {
            // Reverse the animation to its original state
            UIView.animate(withDuration: 1.0, delay: 0, options: .curveEaseInOut, animations: {
                cell.animationView.transform = CGAffineTransform.identity
                cell.animationView.alpha = 1.0
                cell.animationView.backgroundColor = .clear
            }, completion: { _ in
                // Set view properties to initial values after animation completes
                cell.animationView.transform = CGAffineTransform.identity
                cell.animationView.alpha = 1.0
                cell.animationView.backgroundColor = .clear
                
                // Update the animation state for the cell
                self.animationStates[buttonTag] = false
            })
        } else {
            // Apply the animation based on the button tag
            switch buttonTag {
            case 0: // Animation A
                UIView.animate(withDuration: 1.0, delay: 0, options: .curveEaseInOut, animations: {
                    cell.animationView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
                }, completion: nil)
                
            case 1: // Animation B
                UIView.animate(withDuration: 1.0, delay: 0, options: .curveEaseInOut, animations: {
                    cell.animationView.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
                }, completion: nil)
                
            case 2: // Animation C
                UIView.animate(withDuration: 1.0, delay: 0, options: .curveEaseInOut, animations: {
                    cell.animationView.transform = CGAffineTransform(translationX: -100, y: 0)
                }, completion: nil)
                
            case 3: // Animation D
                UIView.animate(withDuration: 1.0, delay: 0, options: .curveEaseInOut, animations: {
                    cell.animationView.alpha = 0.25
                }, completion: nil)
                
            case 4: // Animation E
                UIView.animate(withDuration: 1.0, delay: 0, options: .curveEaseInOut, animations: {
                    cell.animationView.backgroundColor = .red
                }, completion: nil)
                
            case 5: // Animation F
                UIView.animate(withDuration: 1.0, delay: 0, options: .curveEaseInOut, animations: {
                    cell.animationView.center.x += 100
                }, completion: nil)
                
            case 6: // Animation G
                UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                    cell.animationView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
                }, completion: nil)
                
            case 7: // Animation H
                UIView.animate(withDuration: 1.0, delay: 0, options: .curveEaseInOut, animations: {
                    cell.animationView.transform = CGAffineTransform(rotationAngle: CGFloat.pi/2)
                    cell.animationView.center.x += 100
                    cell.animationView.backgroundColor = .blue
                    cell.animationView.alpha = 0.5
                }, completion: nil)

            case 8: // Animation i (example)
                // Example of a custom animation
                UIView.animate(withDuration: 1.0, delay: 0, options: .curveEaseInOut, animations: {
                    // Customize the animation here
                    cell.animationView.transform = CGAffineTransform(rotationAngle: CGFloat.pi/4)
                    cell.animationView.center.y += 50
                    cell.animationView.backgroundColor = .green
                    cell.animationView.alpha = 0.75
                }, completion: nil)
                
            case 9: // Animation j
                UIView.animate(withDuration: 1.0, delay: 0, options: .curveEaseInOut, animations: {
                    cell.animationView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                    cell.animationView.backgroundColor = .blue
                }, completion: nil)

            case 10: // Animation k
                UIView.animate(withDuration: 1.0, delay: 0, options: .curveEaseInOut, animations: {
                    cell.animationView.transform = CGAffineTransform(translationX: 0, y: -100)
                    cell.animationView.alpha = 0.5
                }, completion: nil)

            case 11: // Animation L
                UIView.animate(withDuration: 1.0, delay: 0, options: .curveEaseInOut, animations: {
                    cell.animationView.transform = CGAffineTransform(rotationAngle: CGFloat.pi/2)
                    cell.animationView.center.x -= 100
                }, completion: nil)

            case 12: // Animation M
                UIView.animate(withDuration: 1.0, delay: 0, options: .curveEaseInOut, animations: {
                    cell.animationView.alpha = 1.0
                    cell.animationView.backgroundColor = .yellow
                }, completion: nil)

            case 13: // Animation N
                UIView.animate(withDuration: 1.0, delay: 0, options: .curveEaseInOut, animations: {
                    cell.animationView.transform = CGAffineTransform(translationX: 100, y: 0)
                    cell.animationView.center.y -= 50
                }, completion: nil)

            case 14: // Animation O
                UIView.animate(withDuration: 1.0, delay: 0, options: .curveEaseInOut, animations: {
                    cell.animationView.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
                    cell.animationView.backgroundColor = .orange
                }, completion: nil)

            case 15: // Animation P
                UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.3, options: .curveEaseInOut, animations: {
                    cell.animationView.transform = CGAffineTransform(rotationAngle: -CGFloat.pi/2)
                }, completion: nil)

            case 16: // Animation Q (example)
                // Example of a custom animation
                UIView.animate(withDuration: 1.0, delay: 0, options: .curveEaseInOut, animations: {
                    // Customize the animation here
                    cell.animationView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
                    cell.animationView.center.x += 50
                    cell.animationView.center.y += 50
                    cell.animationView.backgroundColor = .purple
                    cell.animationView.alpha = 0.5
                }, completion: nil)
            default:
                break
            }
        }
        // Toggle the animation state
        isAnimationRunning = !isAnimationRunning
    }
}
extension CoreAnimationAllViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! AllAnimationTableViewCell
        cell.selectionStyle = .none
    }
}
