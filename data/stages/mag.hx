function postCreate(){
	FlxG.camera.zoom = 0.7;
	defaultCamZoom = 0.7;
	dad.scale.set(0.9,0.9);
	dad.y += 40;
	boyfriend.y += 400;
	dad.cameraOffset = FlxPoint.get(0,100);
}

function onNoteCreation(e){
	if(e.noteType == "Hurt Note"){
		e.note.kill();			
		// e.note.colorTransform.color = 0xFF000000;
		// e.note.avoid = true;
		// e.note.canBeHit = false;
		// e.misses = true;
	}
}

// function onPlayerMiss(e){
// 	if(e.noteType == "Hurt Note") e.cancel();
// }
var dir = false;
var ang = 3;
function beatHit(curBeat){
	if(startingSong == false){
		camGame.angle = dir ? -ang : ang;
		camGame.y = -12;
		camHUD.y = 12;
		dir = !dir;
	}
}
function update(){
	camGame.angle = FlxMath.lerp(camGame.angle, 0, 0.02);
	camGame.y = FlxMath.lerp(camGame.y * 100, 0, 0.05) / 100;
	camHUD.y = FlxMath.lerp(camHUD.y * 100, 0, 0.05) / 100;
	camHUD.angle = camGame.angle;
}