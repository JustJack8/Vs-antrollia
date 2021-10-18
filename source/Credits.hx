package;

import flixel.input.gamepad.FlxGamepad;
import Controls.KeyboardScheme;
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
import io.newgrounds.NG;
import lime.app.Application;
import flixel.addons.display.FlxBackdrop;

#if windows
import Discord.DiscordClient;
#end

using StringTools;

class Credits extends MusicBeatState
{

	var camFollow:FlxObject;
	var canmove:Bool = true;
	var gay:Int = 0;
	var creditgroup:FlxTypedGroup<FlxSprite>;

	override function create()
	{
		clean();
		#if windows
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In Trophy Menu", null);
		#end

		if (!FlxG.sound.music.playing)
		{
			FlxG.sound.playMusic(Paths.music('freakyMenu'));
		}

		persistentUpdate = persistentDraw = true;

		var bg:FlxSprite = new FlxSprite(-100).loadGraphic(Paths.image('Vs_antrollia_menu_1'));
		bg.scrollFactor.x = 0;
		bg.scrollFactor.y = 0.10;
		bg.setGraphicSize(Std.int(bg.width * 1.1));
		bg.updateHitbox();
		bg.screenCenter();
		bg.antialiasing = FlxG.save.data.antialiasing;
		add(bg);

		creditgroup = new FlxTypedGroup<FlxSprite>();
		add(creditgroup);

		for (i in 0...11)
			{
					var cred:FlxSprite = new FlxSprite().loadGraphic(Paths.image('credicon/cred' + i));
					cred.updateHitbox();
					cred.x = 840;
					cred.y = 221 + (i * 720);
					cred.antialiasing = true;
					creditgroup.add(cred);
			}

		camFollow = new FlxObject(0, 0, 0, 0);
		add(camFollow);

		FlxG.camera.follow(camFollow, null, 0 * (0 / FlxG.save.data.fpsCap));

		super.create();
	}
	override function update(elapsed:Float)
	{
		if (controls.BACK)
			{
				FlxG.switchState(new MainMenuState());
			}

		if (FlxG.sound.music.volume < 0.8)
		{
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
		}

		if (FlxG.keys.justPressed.DOWN && gay != 10 && canmove)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				canmove = false;
				gay++;
				creditgroup.forEach(function(spr:FlxSprite)
					{
						FlxTween.tween(spr,{y: spr.y - 720},0.65,{ease: FlxEase.expoInOut, onComplete: function(flxTween:FlxTween) 
							{ 
								canmove = true;
							}});
						spr.updateHitbox();
					});
			}

		if (FlxG.keys.justPressed.UP && gay != 0 && canmove)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				canmove = false;
				gay--;
				creditgroup.forEach(function(spr:FlxSprite)
					{
						FlxTween.tween(spr,{y: spr.y + 720},0.65,{ease: FlxEase.expoInOut, onComplete: function(flxTween:FlxTween) 
							{ 
								canmove = true;
							}});
						spr.updateHitbox();
					});
			}

		super.update(elapsed);
	}
}