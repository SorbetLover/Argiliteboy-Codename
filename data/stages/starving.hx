import flixel.addons.display.FlxBackdrop;
var sky:FlxBackdrop;
var rail:FlxBackdrop;
var ciro;
var lule;
function create(){

    defaultCamZoom = 0.6;

    sky = new FlxBackdrop().loadGraphic(Paths.image("stages/prey/stardustBg3"));
    sky.velocity.x = -2000;
    sky.repeatAxes = 1;
    sky.screenCenter();
    sky.y = -570;

    rail = new FlxBackdrop().loadGraphic(Paths.image("stages/prey/stardustFloor"));
    rail.velocity.x = sky.velocity.x * 0.9;
    rail.repeatAxes = 1;
    rail.scale.set(0.6,0.6);
    rail.updateHitbox();
    rail.y = sky.y - sky.height + (rail.height * 0.68);
    
    sky.y -=90;
    remove(gf);
    insert(0,sky);
    insert(members.indexOf(boyfriend) + 1,rail);


}
var thing1:FunkinSprite;
var thing2:FunkinSprite;

function postCreate(){
    lule = strumLines.members[0].characters[1];
    ciro = strumLines.members[0].characters[0];
    
    iconP2.y = 1000;
    iconP1.y = 1000;

    lule.y -= 460;
    ciro.y -= 400;

    lule.x -= 1500;
    ciro.x -= 1500;
    
    for(i in [strumLines.members[1].characters[0], lule, ciro]){
        i.scale.set(0.7,0.7);
        i.y += 70;
    }
    boyfriend.cameraOffset = FlxPoint.get(60,-90);
    dad.cameraOffset = FlxPoint.get(1200, 300);

    comboGroup.x += 700;

    thing1 = new FunkinSprite().loadGraphic(Paths.image("stages/prey/Circle-prey"));
    thing2 = new FunkinSprite().loadGraphic(Paths.image("stages/prey/Text-prey"));
    for(i in [thing1, thing2]){
        i.cameras = [camHUD];
        i.screenCenter();
    }
    add(thing1);
    add(thing2);
    var mer = thing1.x;

    thing1.x -= 1000;
    thing2.x += 1000;
    // camGame.fade(0xFF000000, 0, false);
    

}

function onSongStart(){
    FlxTween.tween(thing1, {x: thing1.x + 1000}, 0.3 * inst.pitch, {onComplete: function(){
        for(i in [thing1, thing2])FlxTween.tween(i, {alpha: 0}, 2 * inst.pitch, {startDelay: 2*inst.pitch});
        new FlxTimer().start(2, function(){
        camGame.fade(0xFF000000, 2*inst.pitch, true);

        });
    }});
    FlxTween.tween(thing2, {x: thing2.x - 1000}, 0.3 * inst.pitch);
}

function stepHit(){
    switch(curStep){
        case 248:
            FlxTween.tween(ciro, {x:0}, 1 * inst.pitch, {ease:FlxEase.backOut});
        case 320:
            ciro.x = 0;
        case 1520:
            ciro.x = 0;
        case 1526:
            FlxTween.tween(ciro, {x:-4600}, 1 * inst.pitch, {ease:FlxEase.backIn});

        case 1550:
                // dad.cameraOffset = FlxPoint.get(-100, 300);
            lule.playAnim("singLEFT");
            curCameraTarget = 1;
        case 1598:
            // lule.cameraOffset = FlxPoint.get(500,0);
            FlxTween.tween(lule, {x: 1500}, 5 *inst.pitch);
        case 1650:
            boyfriend.cameraOffset = FlxPoint.get(300, -90);
            
        case 1790, 3335:

            // lule.cameraOffset = FlxPoint.get(500,0);
            lule.x = 1500;
        case 3365:
            ciro.y = boyfriend.y;
            ciro.x = 3000;
            ciro.flipX = true;
            FlxTween.tween(ciro, {x: boyfriend.x + 100}, 0.2 * inst.pitch, {onComplete: function(){
                camGame.fade(0xFF000000, 0, false);
            }});
        /// 3367
    }
}


function postUpdate(){
    if(curCameraTarget == 0 && PlayState.instance.curStep >= 1760){
        camFollow.setPosition(1400,0);
    }
}
