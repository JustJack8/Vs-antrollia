package;

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


class Balls extends FlxSprite
{
	public function new(x:Float = 0, y:Float = 0)
	{
		super(x, y);
		var tex:FlxAtlasFrames;
		tex = Paths.getSparrowAtlas('maballs','shared',true);
		frames = tex;
		animation.addByPrefix('can i put my', 'balls in yo jaws');
		animation.addByPrefix('ouch', 'cbt');
		animation.play('can i put my');
		flipX = true;
	}
}
