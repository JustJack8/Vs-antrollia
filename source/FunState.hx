package;
import flixel.*;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import openfl.system.System;

/**
 * ...
 * Hi Shadow :)
 */
class FunState extends FlxState
{
	
	override public function create():Void 
	{
		super.create();
		var end:FlxSprite = new FlxSprite(0, 0).loadGraphic(Paths.image('Fun_Is_Infinite', 'shared'));
		FlxG.sound.playMusic(Paths.music('Fun_is_Infinite'));
		add(end);
		FlxG.camera.fade(FlxColor.BLACK, 0.8, true);
		
		
		new FlxTimer().start(25, function(timer:FlxTimer)
            {
                System.exit(0);
            });
		
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
	}
	
	
	public function endIt(e:FlxTimer=null){
		trace("TROLLED");
		//FlxG.switchState(new PlayState());
	}
	
}