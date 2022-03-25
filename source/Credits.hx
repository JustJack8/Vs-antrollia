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
	var ass:Int = 0;
	var creditgroup:FlxTypedGroup<FlxSprite>;
	var nametxt:Alphabet;
	var roletxt1:Alphabet;
	var roletxt2:Alphabet;
	var roletxt3:Alphabet;
	var colorTween:FlxTween;
	var bg:FlxSprite;
	var chung:FlxSprite;
	var link:String = "https://twitter.com/Fire_Mario_Fan";

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

		FlxG.mouse.visible = true;

		persistentUpdate = persistentDraw = true;

		bg = new FlxSprite(-100).loadGraphic(Paths.image('Vs_antrollia_menu_1'));
		bg.scrollFactor.x = 0;
		bg.scrollFactor.y = 0.10;
		bg.setGraphicSize(Std.int(bg.width * 1.1));
		bg.updateHitbox();
		bg.screenCenter();
		bg.antialiasing = FlxG.save.data.antialiasing;
		add(bg);

		creditgroup = new FlxTypedGroup<FlxSprite>();
		add(creditgroup);

		for (i in 0...12)
			{
					var cred:FlxSprite = new FlxSprite().loadGraphic(Paths.image('credicon/cred' + i));
					cred.updateHitbox();
					cred.x = 840;
					cred.y = 221 + (i * 720);
					cred.antialiasing = true;
					creditgroup.add(cred);
			}

		nametxt = new Alphabet(0, 0, 'fire', true, false, false);
		nametxt.color = 0xFFf06940;
		add(nametxt);
		nametxt.isname = true;

		roletxt1 = new Alphabet(0, 0, 'musician; pixel art', true, false, false);
		add(roletxt1);
		roletxt1.istext1 = true;

		roletxt2 = new Alphabet(0, 0, 'animation', true, false, false);
		add(roletxt2);
		roletxt2.istext2 = true;

		roletxt3 = new Alphabet(0, 0, 'animation', true, false, false);
		add(roletxt3);
		roletxt3.istext3 = true;

		camFollow = new FlxObject(0, 0, 0, 0);
		add(camFollow);

		FlxG.camera.follow(camFollow, null, 0 * (0 / FlxG.save.data.fpsCap));

		changename();

		chung = new FlxSprite().loadGraphic(Paths.image('bigbigchungusbigchungus'));
		chung.updateHitbox();
		chung.screenCenter();
		chung.alpha = 0;
		add(chung);

		super.create();
	}
	override function update(elapsed:Float)
	{


		if (FlxG.mouse.justPressed)
			{
				if (FlxG.mouse.overlaps(chung))
				{
					if (chung.alpha == 1)
						{
							FlxG.save.data.chungus = true;
							FlxG.sound.play(Paths.sound('levelup'));
							FlxTween.tween(chung,{alpha: 0},1,{ease: FlxEase.expoInOut});
						}
				}
			}
		if (FlxG.save.data.chungus)
			chung.alpha =0;

		if (controls.BACK)
			{
				FlxG.switchState(new MainMenuState());
			}

		if (FlxG.sound.music.volume < 0.8)
		{
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
		}
		if (gay == 12)
			{
				gay = 0;
				canmove = false;
				FlxTween.tween(nametxt,{alpha: 0},0.25,{ease: FlxEase.expoInOut, onComplete: function(flxTween:FlxTween) 
					{ 
						changename();
					}});
				creditgroup.forEach(function(spr:FlxSprite)
					{
						FlxTween.tween(spr,{y: spr.y + 7920},0.5,{ease: FlxEase.expoInOut, onComplete: function(flxTween:FlxTween) 
							{ 
								canmove = true;
							}});
						spr.updateHitbox();
					});
			}
		if (gay == -1)
			{
				gay = 11;
				canmove = false;
				FlxTween.tween(nametxt,{alpha: 0},0.25,{ease: FlxEase.expoInOut, onComplete: function(flxTween:FlxTween) 
					{ 
						changename();
					}});
				creditgroup.forEach(function(spr:FlxSprite)
					{
						FlxTween.tween(spr,{y: spr.y - 7920},0.5,{ease: FlxEase.expoInOut, onComplete: function(flxTween:FlxTween) 
							{ 
								canmove = true;
							}});
						spr.updateHitbox();
					});
			}

		if (FlxG.keys.justPressed.DOWN && canmove)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				canmove = false;
				gay++;
				FlxTween.tween(nametxt,{alpha: 0},0.25,{ease: FlxEase.expoInOut, onComplete: function(flxTween:FlxTween) 
					{ 
						changename();
					}});
				creditgroup.forEach(function(spr:FlxSprite)
					{
						FlxTween.tween(spr,{y: spr.y - 720},0.5,{ease: FlxEase.expoInOut, onComplete: function(flxTween:FlxTween) 
							{ 
								canmove = true;
							}});
						spr.updateHitbox();
					});
			}

		if (controls.ACCEPT)
			{
				if (gay == 10)
					{
						if (FlxG.random.bool(1))
							{
								FlxG.switchState(new FunState());
							}
							else
								{
									fancyOpenURL(link);
								}
					}
					else
						{
							fancyOpenURL(link);
						}
			}
	
		if (FlxG.keys.justPressed.UP && canmove)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				canmove = false;
				gay--;
				FlxTween.tween(nametxt,{alpha: 0},0.25,{ease: FlxEase.expoInOut, onComplete: function(flxTween:FlxTween) 
					{ 
						changename();
					}});
				creditgroup.forEach(function(spr:FlxSprite)
					{
						FlxTween.tween(spr,{y: spr.y + 720},0.5,{ease: FlxEase.expoInOut, onComplete: function(flxTween:FlxTween) 
							{ 
								canmove = true;
							}});
						spr.updateHitbox();
					});
			}

		super.update(elapsed);
	}

	function changename() {
		switch (gay)
		{
			case 0:
				remove(nametxt);
				nametxt = new Alphabet(0, 0, 'fire', true, false, false);
				nametxt.color = 0xFFf06940;
				add(nametxt);

				remove(roletxt1);
				roletxt1 = new Alphabet(0, 0, 'director', true, false, false);
				add(roletxt1);
				roletxt1.istext1 = true;
		
				remove(roletxt2);
				roletxt2 = new Alphabet(0, 0, 'music, pixel art', true, false, false);
				add(roletxt2);
				roletxt2.istext2 = true;

				remove(roletxt3);
				roletxt3 = new Alphabet(0, 0, 'and animation', true, false, false);
				add(roletxt3);
				roletxt3.istext3 = true;

				colorTween = FlxTween.color(bg, 0.5, bg.color, 0xFFf06940, {
					onComplete: function(twn:FlxTween) {
						colorTween = null;
					}
				});
				link = 'https://twitter.com/Fire_Mario_Fan';
			case 1:
				remove(nametxt);
				nametxt = new Alphabet(0, 0, 'shadowfi', true, false, false);
				nametxt.color = 0xFF3144a5;
				add(nametxt);

				remove(roletxt1);
				roletxt1 = new Alphabet(0, 0, 'co director', true, false, false);
				add(roletxt1);
				roletxt1.istext1 = true;
		
				remove(roletxt2);
				roletxt2 = new Alphabet(0, 0, 'main coder', true, false, false);
				add(roletxt2);
				roletxt2.istext2 = true;

				remove(roletxt3);
				roletxt3 = new Alphabet(0, 0, 'for the mod', true, false, false);
				add(roletxt3);
				roletxt3.istext3 = true;

				colorTween = FlxTween.color(bg, 0.5, bg.color, 0xFF3144a5, {
					onComplete: function(twn:FlxTween) {
						colorTween = null;
					}
				});

				link = 'https://twitter.com/Shadowfi1385';
			case 2:
				remove(roletxt3);
				remove(nametxt);
				nametxt = new Alphabet(0, 0, 'dusty', true, false, false);
				nametxt.color = 0xFFfdff91;
				add(nametxt);

				remove(roletxt1);
				roletxt1 = new Alphabet(0, 0, 'animation and', true, false, false);
				add(roletxt1);
				roletxt1.istext1 = true;
		
				remove(roletxt2);
				roletxt2 = new Alphabet(0, 0, 'art', true, false, false);
				add(roletxt2);
				roletxt2.istext2 = true;

				colorTween = FlxTween.color(bg, 0.5, bg.color, 0xFFfdff91, {
					onComplete: function(twn:FlxTween) {
						colorTween = null;
					}
				});

				link = 'https://twitter.com/DustyassGoat';
			case 3:
				remove(roletxt3);
				remove(nametxt);
				nametxt = new Alphabet(0, 0, 'crow', true, false, false);
				nametxt.color = 0xFFe0c1fe;
				add(nametxt);

				remove(roletxt1);
				roletxt1 = new Alphabet(0, 0, 'promo art and', true, false, false);
				add(roletxt1);
				roletxt1.istext1 = true;
		
				remove(roletxt2);
				roletxt2 = new Alphabet(0, 0, 'UI assets', true, false, false);
				add(roletxt2);
				roletxt2.istext2 = true;

				colorTween = FlxTween.color(bg, 0.5, bg.color, 0xFFe0c1fe, {
					onComplete: function(twn:FlxTween) {
						colorTween = null;
					}
				});

				link = 'https://twitter.com/CrowsDomeArt';
			case 4:
				remove(roletxt3);
				remove(nametxt);
				nametxt = new Alphabet(0, 0, 'shuun', true, false, false);
				nametxt.color = 0xFF9ae3e4;
				add(nametxt);

				remove(roletxt1);
				roletxt1 = new Alphabet(0, 0, 'bg and', true, false, false);
				add(roletxt1);
				roletxt1.istext1 = true;
		
				remove(roletxt2);
				roletxt2 = new Alphabet(0, 0, 'UI assets', true, false, false);
				add(roletxt2);
				roletxt2.istext2 = true;

				colorTween = FlxTween.color(bg, 0.5, bg.color, 0xFF9ae3e4, {
					onComplete: function(twn:FlxTween) {
						colorTween = null;
					}
				});

				link = 'https://twitter.com/SHuuN097885';
			case 5:
				remove(roletxt3);
				remove(nametxt);
				nametxt = new Alphabet(0, 0, 'rodri', true, false, false);
				nametxt.color = 0xFFff7bd7;
				add(nametxt);

				remove(roletxt1);
				roletxt1 = new Alphabet(0, 0, 'cutscenes and', true, false, false);
				add(roletxt1);
				roletxt1.istext1 = true;
		
				remove(roletxt2);
				roletxt2 = new Alphabet(0, 0, 'trailer', true, false, false);
				add(roletxt2);
				roletxt2.istext2 = true;

				colorTween = FlxTween.color(bg, 0.5, bg.color, 0xFFff7bd7, {
					onComplete: function(twn:FlxTween) {
						colorTween = null;
					}
				});

				link = 'https://twitter.com/Rodri117xd';
			case 6:
				remove(roletxt3);
				remove(nametxt);
				nametxt = new Alphabet(0, 0, 'nomie', true, false, false);
				nametxt.color = 0xFF350094;
				add(nametxt);

				remove(roletxt1);
				roletxt1 = new Alphabet(0, 0, 'cutscenes and', true, false, false);
				add(roletxt1);
				roletxt1.istext1 = true;
		
				remove(roletxt2);
				roletxt2 = new Alphabet(0, 0, 'characters', true, false, false);
				add(roletxt2);
				roletxt2.istext2 = true;

				colorTween = FlxTween.color(bg, 0.5, bg.color,  0xFF350094, {
					onComplete: function(twn:FlxTween) {
						colorTween = null;
					}
				});

				link = 'https://twitter.com/NomDomeStudios';
			case 7:
				remove(roletxt3);
				remove(nametxt);
				nametxt = new Alphabet(0, 0, 'dessie', true, false, false);
				nametxt.color = 0xFFda1d31;
				add(nametxt);

				remove(roletxt1);
				roletxt1 = new Alphabet(0, 0, 'voice actor', true, false, false);
				add(roletxt1);
				roletxt1.istext1 = true;
		
				remove(roletxt2);
				roletxt2 = new Alphabet(0, 0, 'for antrollia', true, false, false);
				add(roletxt2);
				roletxt2.istext2 = true;

				colorTween = FlxTween.color(bg, 0.5, bg.color,  0xFFda1d31, {
					onComplete: function(twn:FlxTween) {
						colorTween = null;
					}
				});
				link = 'https://youtube.com/c/RoseInTheSkull';
			case 8:
				remove(roletxt3);
				remove(nametxt);
				nametxt = new Alphabet(0, 0, 'soop', true, false, false);
				nametxt.color = 0xFF0000ff;
				add(nametxt);

				remove(roletxt1);
				roletxt1 = new Alphabet(0, 0, 'voice actor', true, false, false);
				add(roletxt1);
				roletxt1.istext1 = true;
		
				remove(roletxt2);
				roletxt2 = new Alphabet(0, 0, 'for bf', true, false, false);
				add(roletxt2);
				roletxt2.istext2 = true;

				colorTween = FlxTween.color(bg, 0.5, bg.color,  0xFF0000ff, {
					onComplete: function(twn:FlxTween) {
						colorTween = null;
					}
				});
				link = 'https://twitter.com/64Soop';
			case 9:
				remove(roletxt3);
				remove(nametxt);
				nametxt = new Alphabet(0, 0, 'salted', true, false, false);
				nametxt.color = 0xFF0bc892;
				add(nametxt);

				remove(roletxt1);
				roletxt1 = new Alphabet(0, 0, 'voice actor', true, false, false);
				add(roletxt1);
				roletxt1.istext1 = true;
		
				remove(roletxt2);
				roletxt2 = new Alphabet(0, 0, 'for gf', true, false, false);
				add(roletxt2);
				roletxt2.istext2 = true;

				colorTween = FlxTween.color(bg, 0.5, bg.color, 0xFF0bc892, {
					onComplete: function(twn:FlxTween) {
						colorTween = null;
					}
				});
				link = 'https://www.youtube.com/channel/UC5UKs_o3-j_IkF6aLTgMg1w';
			case 10:
				remove(roletxt3);
				remove(nametxt);
				nametxt = new Alphabet(0, 0, 'justjack', true, false, false);
				nametxt.color = 0xFF9293b0;
				add(nametxt);

				remove(roletxt1);
				roletxt1 = new Alphabet(0, 0, 'little coding', true, false, false); // im sorry but this just kinda pissed me off :/ -- just jack 
				add(roletxt1);
				roletxt1.istext1 = true;
		
				remove(roletxt2);
				roletxt2 = new Alphabet(0, 0, 'and charting', true, false, false);
				add(roletxt2);
				roletxt2.istext2 = true;

				colorTween = FlxTween.color(bg, 0.5, bg.color, 0xFF9293b0, {
					onComplete: function(twn:FlxTween) {
						colorTween = null;
					}
				});
				link = 'https://twitter.com/Just_Jack6';
			case 11:
				remove(roletxt3);
				remove(nametxt);
				nametxt = new Alphabet(0, 0, 'galXE', true, false, false);
				nametxt.color = 0xFFab75ce;
				add(nametxt);

				remove(roletxt1);
				roletxt1 = new Alphabet(0, 0, 'art', true, false, false);
				add(roletxt1);
				roletxt1.istext1 = true;
		
				remove(roletxt2);
				roletxt2 = new Alphabet(0, 0, 'and UI assets', true, false, false);
				add(roletxt2);
				roletxt2.istext2 = true;

				colorTween = FlxTween.color(bg, 0.5, bg.color, 0xFFab75ce, {
					onComplete: function(twn:FlxTween) {
						colorTween = null;
					}
				});
				link = 'https://twitter.com/atheri0nstudios';
		}
		switch(Random.int(1, 11)) {
			case 1:
				if (gay == 1)
					FlxTween.tween(chung,{alpha: 1},3,{ease: FlxEase.expoInOut});
			case 2:
				if (gay == 2)
					FlxTween.tween(chung,{alpha: 1},3,{ease: FlxEase.expoInOut});
			case 3:
				if (gay == 3)
					FlxTween.tween(chung,{alpha: 1},3,{ease: FlxEase.expoInOut});
			case 4:
				if (gay == 4)
					FlxTween.tween(chung,{alpha: 1},3,{ease: FlxEase.expoInOut});
			case 5:
				if (gay == 5)
					FlxTween.tween(chung,{alpha: 1},3,{ease: FlxEase.expoInOut});
			case 6:
				if (gay == 6)
					FlxTween.tween(chung,{alpha: 1},3,{ease: FlxEase.expoInOut});
			case 7:
				if (gay == 7)
					FlxTween.tween(chung,{alpha: 1},3,{ease: FlxEase.expoInOut});
			case 8:
				if (gay == 8)
					FlxTween.tween(chung,{alpha: 1},3,{ease: FlxEase.expoInOut});
			case 9:
				if (gay == 9)
					FlxTween.tween(chung,{alpha: 1},3,{ease: FlxEase.expoInOut});
			case 10:
				if (gay == 10)
					FlxTween.tween(chung,{alpha: 1},3,{ease: FlxEase.expoInOut});
			case 11:
				if (gay == 11)
					FlxTween.tween(chung,{alpha: 1},3,{ease: FlxEase.expoInOut});
		}
		nametxt.isname = true;
		FlxTween.tween(nametxt,{alpha: 1},0.25,{ease: FlxEase.expoInOut});
	}
}