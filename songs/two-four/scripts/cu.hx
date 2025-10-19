function stepHit(){
    switch(curStep){
        case 612:
            dad.playAnim("throw");
    }
}
function postCreate(){
    dad.holdTime = 8;
    boyfriend.holdTime = 8;
}
function onNoteHit(e){
    if(e.player) return;
    if(e.noteType == "No Animation"){
        e.preventAnim();
        dad.playSingAnim(e.direction, "-mag");
    }
}