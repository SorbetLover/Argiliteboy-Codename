import openfl.display.BlendMode;
function create(){
    camFollow.setPosition(1000,600);
}
function postCreate(){

    gf.visible = false;
    boyfriend.x -= 100;
    strumLines.members[0].characters[1].x = strumLines.members[0].characters[0].x - 70;
    strumLines.members[1].characters[1].x = strumLines.members[1].characters[0].x + 140;
    for(i in [0,1]){
        strumLines.members[i].characters[0].y +=200;
        strumLines.members[i].characters[1].y +=200;
    }
    strumLines.members[0].characters[1].alpha = 0.0001;
    strumLines.members[1].characters[1].alpha = 0.0001;
    stage.getSprite("sprite_6").animation.addByPrefix("hey", "stage trolls", 18);
}

function beatHit(){
    if(curBeat % 2 == 0)stage.getSprite("sprite_6").playAnim("hey");
}
function stepHit(){
    switch(curStep){
        case 896:
            camGame.fade(0xFFFFFFFF, 0.5, true);
            strumLines.members[0].characters[1].alpha = 1;
            strumLines.members[1].characters[1].alpha = 1;
            strumLines.members[0].characters[0].alpha = 0.0001;
            strumLines.members[1].characters[0].alpha = 0.0001;
        case 1692:
                    strumLines.members[1].characters[0].alpha = 1;
                    strumLines.members[1].characters[1].alpha = 0;
        case 1760:
        
                    strumLines.members[0].characters[0].alpha = 1;
                    strumLines.members[0].characters[1].alpha = 0;

    }
}