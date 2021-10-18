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
import flixel.addons.effects.FlxTrail;
import flixel.addons.effects.FlxTrailArea;

#if windows
import Discord.DiscordClient;
#end

using StringTools;

class MainMenuState extends MusicBeatState
{
	var curSelected:Int = 0;

	var menuItems:FlxTypedGroup<FlxSprite>;
	public var gay:Bool = false;

	#if !switch
	var optionShit:Array<String> = ['story', 'free', 'credit', 'options', 'trophy', 'extra'];
	#else
	var optionShit:Array<String> = ['story', 'free'];
	#end

	var newGaming:FlxText;
	var newGaming2:FlxText;
	var aaatween:FlxTween;
	var aaatween2:FlxTween;
	public static var firstStart:Bool = true;

	var troll:FlxSprite;
	var troll2:FlxSprite;

	public static var nightly:String = "";
	var backdrops:FlxBackdrop = new FlxBackdrop(Paths.image('test'), 0.2, 0.2, true, true);

	public static var kadeEngineVer:String = "1.7" + nightly;
	public static var gameVer:String = "0.2.7.1";

	var magenta:FlxSprite;
	var camFollow:FlxObject;
	public static var finishedFunnyMove:Bool = false;

	override function create()
	{
		clean();
		#if windows
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In the Menus", null);
		#end

		FlxG.mouse.visible = false;

		if (!FlxG.sound.music.playing)
		{
			FlxG.sound.playMusic(Paths.music('freakyMenu'));
		}

		persistentUpdate = persistentDraw = true;

		var bg:FlxSprite = new FlxSprite(-100).loadGraphic(Paths.image('menuBG'));
		bg.scrollFactor.x = 0;
		bg.scrollFactor.y = 0.10;
		bg.setGraphicSize(Std.int(bg.width * 1.1));
		bg.updateHitbox();
		bg.screenCenter();
		bg.antialiasing = FlxG.save.data.antialiasing;
		add(bg);

		camFollow = new FlxObject(0, 0, 0, 0);
		add(camFollow);

		magenta = new FlxSprite(-80).loadGraphic(Paths.image('menuDesat'));
		magenta.scrollFactor.x = 0;
		magenta.scrollFactor.y = 0.10;
		magenta.setGraphicSize(Std.int(magenta.width * 1.1));
		magenta.updateHitbox();
		magenta.screenCenter();
		magenta.visible = false;
		magenta.antialiasing = FlxG.save.data.antialiasing;
		magenta.color = 0xFFfd719b;
		add(magenta);
		// magenta.scrollFactor.set();

		add(backdrops);
		backdrops.scrollFactor.set(0, 0.07);
		backdrops.angle = 45;

		menuItems = new FlxTypedGroup<FlxSprite>();
		add(menuItems);

		var tex = Paths.getSparrowAtlas('menu');

		for (i in 0...optionShit.length)
		{
			var menuItem:FlxSprite = new FlxSprite(0, FlxG.height * 1.6);
			menuItem.frames = tex;
			menuItem.animation.addByPrefix('idle', "menu " + optionShit[i] + "idle", 24);
			menuItem.animation.addByPrefix('selected', "menu " + optionShit[i] + "select", 24);
			menuItem.animation.play('idle');
			menuItem.ID = i;
			menuItems.add(menuItem);
			menuItem.scrollFactor.set();
			menuItem.scale.set(0.3,0.3);
			menuItem.x += 50;
			menuItem.antialiasing = FlxG.save.data.antialiasing;
			menuItem.y = 60 + (i * 160);

			switch (i) {
				case 4:
					menuItem.x = 1200;
					menuItem.y -= 660;
					menuItem.scale.set(0.28,0.28);
				case 5:
					menuItem.x = 1200;
					menuItem.y -= 490;
					menuItem.scale.set(0.28,0.28);
			}
		}

		finishedFunnyMove = true; 
		changeItem();

		firstStart = false;

		FlxG.camera.follow(camFollow, null, 0 * (0 / FlxG.save.data.fpsCap));

		var versionShit:FlxText = new FlxText(5, FlxG.height - 18, 0, gameVer +  (Main.watermarks ? " FNF - " + kadeEngineVer + " Kade Engine" : ""), 12);
		versionShit.scrollFactor.set();
		versionShit.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		//add(versionShit);

		// NG.core.calls.event.logEvent('swag').send();


		if (FlxG.save.data.dfjk)
			controls.setKeyboardScheme(KeyboardScheme.Solo, true);
		else
			controls.setKeyboardScheme(KeyboardScheme.Duo(true), true);

		changeItem();

		troll2 = new FlxSprite().loadGraphic(Paths.image('herblue'));
		troll2.updateHitbox();
		troll2.screenCenter();
		troll2.antialiasing = FlxG.save.data.antialiasing;
		troll2.y += 90;
		troll2.scale.set(2,2);
		add(troll2);

		troll = new FlxSprite().loadGraphic(Paths.image('her'));
		troll.updateHitbox();
		troll.screenCenter();
		troll.antialiasing = FlxG.save.data.antialiasing;
		troll.y += 80;
		troll.scale.set(2,2);
		add(troll);


		FlxTween.tween(troll,{"scale.x": 0.17,"scale.y": 0.17, angle: 360.0},1.5,{ease: FlxEase.expoInOut, onComplete: function(flxTween:FlxTween) 
			{ 
				aaatween = FlxTween.tween(troll,{x: troll.x + 280},1,{ease: FlxEase.expoInOut, onComplete: function(flxTween:FlxTween) 
					{ 
					}});
			}});

		FlxTween.tween(troll2,{"scale.x": 0.17,"scale.y": 0.17, angle: 360.0},1.5,{ease: FlxEase.expoInOut, onComplete: function(flxTween:FlxTween) 
			{ 
				aaatween2 = FlxTween.tween(troll2,{x: troll2.x + 290},1,{ease: FlxEase.expoInOut, onComplete: function(flxTween:FlxTween) 
					{ 
					}});
			}});

		super.create();
	}

	var selectedSomethin:Bool = false;

	override function update(elapsed:Float)
	{
		if (FlxG.sound.music.volume < 0.8)
		{
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
		}

		if (gay)
			{
				backdrops.x += 1.5 / (120 / 60);
				backdrops.y += 1.5 / (120 / 60);
			}
			else
				{
					backdrops.x -= 1.5 / (120 / 60);
					backdrops.y -= 1.5 / (120 / 60);
				}


		#if debug
		if (FlxG.keys.justPressed.ONE)
			{
				FlxG.switchState(new Trophy());
			}
		#end

		switch (curSelected)
		{
			case 0:
				gay = true;
			case 1:
				gay = false;
			case 2:
				gay = true;
			case 3:
				gay = false;
			case 4:
				gay = true;
			case 5:
				gay = false;

		}

		if (!selectedSomethin)
		{
			var gamepad:FlxGamepad = FlxG.gamepads.lastActive;

			if (gamepad != null)
			{
				if (gamepad.justPressed.DPAD_UP)
				{
					FlxG.sound.play(Paths.sound('scrollMenu'));
					changeItem(-1);
				}
				if (gamepad.justPressed.DPAD_DOWN)
				{
					FlxG.sound.play(Paths.sound('scrollMenu'));
					changeItem(1);
				}
			}

			if (FlxG.keys.justPressed.UP)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				changeItem(-1);
			}

			if (FlxG.keys.justPressed.DOWN)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				changeItem(1);
			}

			if (controls.BACK)
			{
				FlxG.switchState(new TitleState());
			}

			if (controls.ACCEPT)
			{
					selectedSomethin = true;
					FlxG.sound.play(Paths.sound('confirmMenu'));
					
					if (FlxG.save.data.flashing)
						FlxFlicker.flicker(magenta, 1.1, 0.15, false);

						goToState();
			}
		}

		super.update(elapsed);

		menuItems.forEach(function(spr:FlxSprite)
		{
		});
	}
	
	function goToState()
	{
		var daChoice:String = optionShit[curSelected];


		if (aaatween != null)
			aaatween.cancel();
		if (aaatween2 != null)
			aaatween2.cancel();
		menuItems.forEach(function(spr:FlxSprite)
			{
				FlxTween.tween(spr,{y: spr.y + 1100},1,{ease: FlxEase.expoInOut});
			});

		FlxTween.tween(troll,{x: troll.x - 320},1,{ease: FlxEase.expoInOut, onComplete: function(flxTween:FlxTween) 
			{ 
						FlxTween.tween(troll,{"scale.x": 2,"scale.y": 2, angle: -360.0},1.5,{ease: FlxEase.expoInOut});
			}});

		FlxTween.tween(troll2,{x: troll2.x - 320},1,{ease: FlxEase.expoInOut, onComplete: function(flxTween:FlxTween) 
			{ 
						FlxTween.tween(troll2,{"scale.x": 2,"scale.y": 2, angle: -360.0},1.5,{ease: FlxEase.expoInOut});
			}});

		new FlxTimer().start(1.7, function(tmr:FlxTimer)
			{
				switch (daChoice)
				{
					case 'story':
						FlxG.switchState(new StoryMenuState());
						trace("Story Menu Selected");
					case 'free':
						FlxG.switchState(new FreeplayState());
		
						trace("Freeplay Menu Selected");
					case 'credit':
						FlxG.switchState(new Credits());
					case 'options':
						FlxG.switchState(new OptionsMenu());
					case 'trophy':
						FlxG.switchState(new Trophy());
					case 'extra':
						FlxG.switchState(new Extra());
				}
			});

	}

	function changeItem(huh:Int = 0)
	{
		if (finishedFunnyMove)
		{
			curSelected += huh;

			if (curSelected >= menuItems.length)
				curSelected = 0;
			if (curSelected < 0)
				curSelected = menuItems.length - 1;
		}
		menuItems.forEach(function(spr:FlxSprite)
		{
			spr.animation.play('idle');

			if (spr.ID == curSelected && finishedFunnyMove)
			{
				spr.animation.play('selected');
				camFollow.setPosition(spr.getGraphicMidpoint().x, spr.getGraphicMidpoint().y);
			}

			spr.updateHitbox();
		});
	}
}
