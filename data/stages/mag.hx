var kaboom = false;
function postCreate(){
	dad.cameraOffset = FlxPoint.get(0,100);
	dad.scale.set(0.9,0.9);

	if(PlayState.instance.curSong == "kaboom") kaboom = true;
	if(PlayState.instance.curSong == "two-four"){
		boyfriend.fixChar(true,false);
		boyfriend.scale.set(0.8,0.8);
		boyfriend.y = -200;
		boyfriend.x += 100;
		dad.x -= 100;
		boyfriend.cameraOffset = FlxPoint.get(-200,100);
		strumLines.members[0].characters[0].cameraOffset = FlxPoint.get(0,100);
		dad.scale.set(0.8,0.8);
		dad.y += 100;
	}
	FlxG.camera.zoom = 0.7;
	defaultCamZoom = 0.7;
	dad.y += 40;
	boyfriend.y += 400;
}

function onNoteCreation(e){
	if(e.noteType == "Hurt Note"){
		e.note.kill();			
	}
}


var dir = false;
var ang = 3;
function beatHit(curBeat){
	if(startingSong == false && kaboom == true){
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