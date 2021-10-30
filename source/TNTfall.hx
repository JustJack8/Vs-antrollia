import flixel.math.FlxPoint;
import flixel.system.FlxSound;
import flixel.input.gamepad.FlxGamepad;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.effects.FlxFlicker;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import flixel.util.FlxCollision;
import flixel.FlxCamera;
import lime.app.Application;
import flixel.FlxState;
import flixel.math.FlxMath;
import openfl.filters.ShaderFilter;
import openfl.filters.BitmapFilter;
import flixel.group.FlxGroup.FlxTypedGroup;

class TNTfall extends FlxSprite

{
	var int:Float = 0;
	public function new(x:Float, y:Float)
	{
		super(x, y);

		var tex:flixel.graphics.frames.FlxAtlasFrames = Paths.getSparrowAtlas('TNT', 'shared');
		frames = tex;
		animation.addByPrefix('idle', 'tnt',24);
		animation.play('idle');

		x += Random.int(-100, 300);

		new FlxTimer().start(3, function(timer) {
			kill();
		},1);
		int = Random.float(550, 600);
	}
	

	override function update(elapsed:Float)
	{
		super.update(elapsed);
		if (y > int)
			{
				y = int;
			}
		acceleration.y += 200;
	}
}