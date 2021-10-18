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
import flixel.math.FlxVelocity;


class Heartlol extends FlxSprite {
	private var target:FlxObject; 
	var go:Bool = true;
	public function new(x:Float, y:Float, target:FlxObject)
		{
			super(x, y);
	
			this.target = target;

			frames = Paths.getSparrowAtlas('bullets/attackanimation', 'shared');
			animation.addByPrefix('aaa', 'attackanimation',24,false);
			animation.play('aaa');
			scale.set(2,2);
			FlxG.sound.play(Paths.sound('bomb'));
		}

  override function update(elapsed:Float)
    {
      angle += 1;
	  if(go && animation.frameIndex == 19)
		{
			FlxVelocity.accelerateTowardsPoint(this, target.getMidpoint(), 600,700);
			go = false;
		}
      super.update(elapsed);
    }
}