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

class Heartbullet extends FlxSprite
{
	private var aaa:FlxObject; 
	var hearts:FlxSprite;
	var herts:Heartlol;

	public function new(x:Float, y:Float)
	{
		super(x, y);

		var tex:flixel.graphics.frames.FlxAtlasFrames = Paths.getSparrowAtlas('bullets/Bombs', 'shared');
		frames = tex;
		animation.addByPrefix('boom', 'Bomb Heart',24);
		animation.play('boom');
		scale.set(3,3);
		acceleration.y = Random.int(120, 160);
	}
	

	override function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}