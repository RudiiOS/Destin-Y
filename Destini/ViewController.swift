import UIKit

class ViewController: UIViewController {

    let story1 = "Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide brimmed hat with soulless eyes opens the passenger door for you and asks: \"Need a ride, boy?\"."
    let answer1a = "I\'ll hop in. Thanks for the help!"
    let answer1b = "Better ask him if he\'s a murderer first."
    
    
    let story2 = "He nods slowly, unphased by the question."
    let answer2a = "At least he\'s honest. I\'ll climb in."
    let answer2b = "Wait, I know how to change a tire."
    
    let story3 = "As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glovebox. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box."
    let answer3a = "I love Elton John! Hand him the cassette tape."
    let answer3b = "It\'s him or me! You take the knife and stab him."
    
    let story4 = "What? Such a cop out! Did you know traffic accidents are the second leading cause of accidental death for most adult age groups?"
    let story5 = "As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in."
    let story6 = "You bond with the murderer while crooning verses of \"Can you feel the love tonight\". He drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply: \"Try the pier.\""
    
    @IBOutlet weak var topButton: UIButton!
    @IBOutlet weak var bottomButton: UIButton!
    @IBOutlet weak var storyTextView: UILabel!
    var storyIndex = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI(story: story1, topBtn: answer1a, bottomBtn: answer1b)
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        if storyIndex == 1  && sender.tag == 1{
            updateUI(story: story3, topBtn: answer3a, bottomBtn: answer3b)
            storyIndex = 3
        }else if storyIndex == 3 && sender.tag == 1 {
            endOfStorie(storyEnd: story6)
            storyIndex = 6
        }else if storyIndex == 3 && sender.tag == 2 {
                endOfStorie(storyEnd: story5)
            storyIndex = 5
        }else if storyIndex == 1 && sender.tag == 2 {
            updateUI(story: story2, topBtn: answer2a, bottomBtn: answer2b)
            storyIndex = 2
        }else if storyIndex == 2 && sender.tag == 1 {
            updateUI(story: story3, topBtn: answer3a, bottomBtn: answer3b)
            storyIndex = 3
        }else if storyIndex == 2 && sender.tag == 2{
            endOfStorie(storyEnd: story4)
            storyIndex = 4
        }else if (storyIndex == 4 || storyIndex == 5 || storyIndex == 6 && sender.tag == 1){
            updateUI(story: story1, topBtn: answer1a, bottomBtn: answer1b)
            bottomButton.isHidden = false
            storyIndex = 1
        }
    }
    
    func updateUI (story: String,topBtn: String,bottomBtn: String){
        storyTextView.text = story
        topButton.setTitle("\(topBtn)", for: .normal)
        bottomButton.setTitle("\(bottomBtn)", for: .normal)
    }
    func endOfStorie(storyEnd: String){
        storyTextView.text = storyEnd
        topButton.setTitle("Reset Story", for: .normal)
        bottomButton.isHidden = true
    }
    
    
}

