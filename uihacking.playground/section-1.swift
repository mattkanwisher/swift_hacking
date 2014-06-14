// Playground - noun: a place where people can play
// Consider this your Main class, basically the Stage
// Note: The code below is for OSX Playground, not iOS

// this imports higher level APIs like Starling
import SpriteKit
import XCPlayground

// our main logic inside this class
class GameScene: SKScene {
    
    // properties initialization
    // note that the spriteNode property below is not initialized
    // we initialize it through the init initializer below
    //    var spriteNode: SKSpriteNode
    var i = 0.0
    var grid  = String[]()
    var height = 20
    var width = 20
    
    // this is our initializer, called once when the scene is created
    // we do our initialization/setup here
    init(size: CGSize){
        
        /*
        let sprite = NSImage(contentsOfFile:"/Users/kanwisher/swift.jpeg")
        
        // let's create a bitmap, like Bitmap in AS3
        let myTexture = SKTexture(image: sprite)
        
        // let's wrap it inside a node
        spriteNode = SKSpriteNode(texture: myTexture)
        
        // we position it, we could scale it, etc.
        spriteNode.position = CGPoint (x: 250, y: 250)
        
        */
        // we complete the initialization by initializating the superclass
        super.init(size: size)
    }
    
    override func didMoveToView(view: SKView) {
         let sprite = NSImage(contentsOfFile:"/Users/kanwisher/projects/me/swift_hacking/block.png")
        let skt = SKTexture(image: sprite)
        
        let s = CGSizeMake(100, 100)
        
        for x in 1..10 {
            for y in 1..10 {
                
                var rectSprite = SKSpriteNode(color:SKColor.whiteColor(), size:s)
               rectSprite.position = CGPoint(x:100*x-50 ,y:100*y-50);
                rectSprite.texture = skt
                var myLabel = SKLabelNode(fontNamed:"Arial")
                myLabel.text = "A"
                myLabel.fontSize = 20
                myLabel.fontColor = SKColor.blackColor()
                myLabel.color = SKColor.clearColor()
                myLabel.position = CGPoint(x:0,y:0);
                
              rectSprite.addChild(myLabel)
              self.addChild(rectSprite)
            //  self.addChild(myLabel)
            //    self.addChild(customView)
            }
        }
        
        
        
        // let's add it to the display list
        //        self.addChild(spriteNode)
    }
    
    // we override update, which is like an Event.ENTER_FRAME or advanceTime in Starling
    override func update(currentTime: CFTimeInterval) {
        /*
        i += 0.1
        // oscillation with sin, like Math.sin
        var osc = 1.5 + sin(CDouble(i))
        // let's scale it
        spriteNode.setScale(CGFloat(osc))
        // we could have retrieved spriteNode also with the code below, similar to getChildAt(0)
        //let node = self.children[0] as SKSpriteNode
        */
    }
    
    override func mouseDown(theEvent:NSEvent) {
        println(theEvent)
    }

    /*
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {

    }
*/

}

// we create our scene (from our GameScene above), like a main canvas
let scene = GameScene(size: CGSize(width: 500, height: 500))

// we need a view
let view = SKView(frame: NSRect(x: 0, y: 0, width: 500, height: 500))

// we link both
view.presentScene(scene)


//_window.acceptsMouseMovedEvents = YES;
//[_window makeFirstResponder:self.skView.scene];
// display it, XCPShowView is a global function that paints the final scene
XCPShowView("result", view)

