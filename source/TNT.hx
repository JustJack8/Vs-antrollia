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

class TNT extends FlxSprite

{

	public function new(x:Float, y:Float)
	{
		super(x, y);

		var tex:flixel.graphics.frames.FlxAtlasFrames = Paths.getSparrowAtlas('TNT', 'shared');
		frames = tex;
		animation.addByPrefix('idle', 'tnt',24);
		animation.play('idle');

		if (acceleration.y == 0)
			{
				velocity.x = 640;
			}

			velocity.y = -800;

		new FlxTimer().start(3.5, function(timer) {
			kill();
		},1);
	}
	

	override function update(elapsed:Float)
	{
		super.update(elapsed);
		if (y > 590)
			{
				y = 590;
				velocity.x = 0;
			}
		acceleration.y += 100;
	}
}