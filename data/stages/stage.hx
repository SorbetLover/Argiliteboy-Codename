function postCreate(){
    FlxG.camera.zoom = 0.75;
    defaultCamZoom = 0.8;
    dad.cameraOffset = FlxPoint.get(-100,100);
    boyfriend.cameraOffset = FlxPoint.get(-100,100);
    switch(PlayState.instance.curSong){
        case 'lore':
            dad.scale.set(0.7,0.7);
        boyfriend.fixChar(true,false);
        boyfriend.flipX = false;
            dad.x -= 200;
            dad.y += 100;
            boyfriend.scale.set(0.8,0.8);
            boyfriend.x += 200;
            boyfriend.y += 40;
            gf.scale.set(0.8,0.8);
            for(i in [dad,boyfriend,gf]){
                i.holdTime = 8;
            }
        gf.cameraOffset = FlxPoint.get(-200,300);
    }
}


function onPlayerHit(e){
    if(e.noteType == "GF Sing"){
        e.preventAnim();
        if(curCameraTarget == 1) curCameraTarget = 2;
        // dad.playAnim("singLEFT", true);
        gf.playSingAnim(e.direction);
    }
}