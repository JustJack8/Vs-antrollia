package;

import flixel.system.FlxSound;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.text.FlxTypeText;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxSpriteGroup;
import flixel.input.FlxKeyManager;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

using StringTools;

class DialogueBox extends FlxSpriteGroup
{
	var box:FlxSprite;

	var boxgf:FlxSprite;
	var boxbf:FlxSprite;
	var boxant:FlxSprite;

	var curCharacter:String = '';
	var curExpression:String = '';
	var curLine:String = '';

	var skip:Array<String> = [];
	var background:FlxSprite;
	var curBg:String = '';

	var dialogue:Alphabet;
	var dialogueList:Array<String> = [];

	// SECOND DIALOGUE FOR THE PIXEL SHIT INSTEAD???
	var swagDialogue:FlxTypeText;
	var curSound:FlxSound;

	var dropText:FlxText;

	public var finishThing:Void->Void;

	var portraitLeft:FlxSprite;
	var portraitRight:FlxSprite;
	var portraitMid:FlxSprite;

	var handSelect:FlxSprite;
	var bgFade:FlxSprite;

	var sound:FlxSound;

	var showstuff:Bool = false;

	var volume:Bool = true;

	public function new(talkingRight:Bool = true, ?dialogueList:Array<String>)
	{
		super();

		skip = ['stv', 'lol','hide'];

		switch (PlayState.SONG.song.toLowerCase())
		{
			case 'blood-shed':
						sound = new FlxSound().loadEmbedded(Paths.music('Apology'),true);
						sound.volume = 0;
						sound.play();
						FlxG.sound.list.add(sound);
				
			default:
					sound = new FlxSound().loadEmbedded(Paths.music('Dialouge_Song'),true);
					sound.volume = 0;
					sound.play();
					FlxG.sound.list.add(sound);
		}

		background = new FlxSprite(0,0);
		background.visible = true;
		add(background);

		bgFade = new FlxSprite(-200, -200).makeGraphic(Std.int(FlxG.width * 1.3), Std.int(FlxG.height * 1.3), 0xFFB3DFd8);
		bgFade.scrollFactor.set();
		bgFade.alpha = 0.5;
		add(bgFade);

		var hasDialog = false;
		switch (PlayState.SONG.song.toLowerCase())
		{
			default:
				hasDialog = true;
				box = new FlxSprite().loadGraphic(Paths.image('bbb'));
				box.updateHitbox();
				box.antialiasing = FlxG.save.data.antialiasing;
		}

		this.dialogueList = dialogueList;
		
		if (!hasDialog)
			return;
		
		portraitLeft = new FlxSprite();
		portraitLeft.screenCenter();
		portraitLeft.scale.set(0.7,0.7);
		portraitLeft.x -= 450;
		portraitLeft.y -= 240;
		portraitLeft.frames = Paths.getSparrowAtlas('dialoguestuff/ports/antrolliatalkingsprites');
		portraitLeft.animation.addByPrefix('talk', 'antrollia talk5', 24);
		portraitLeft.animation.addByPrefix('christ', 'antrollia talk1 christ', 24);
		portraitLeft.animation.addByPrefix('devilish', 'antrollia talk2 encoraged-devilish', 24);
		portraitLeft.animation.addByPrefix('tired', 'antrollia talk3 tired', 24);
		portraitLeft.animation.addByPrefix('wah', 'antrollia talk4 wah', 24);
		portraitLeft.updateHitbox();
		portraitLeft.scrollFactor.set();
		add(portraitLeft);
		portraitLeft.visible = false;

		portraitMid = new FlxSprite(20, 80);
		portraitMid.screenCenter();
		portraitMid.scale.set(0.83,0.83);
		portraitMid.y -= 300;
		portraitMid.x -= 150;
		portraitMid.frames = Paths.getSparrowAtlas('dialoguestuff/ports/GF_Talking');
		portraitMid.animation.addByPrefix('talk', 'GF Talking', 24);
		portraitMid.updateHitbox();
		portraitMid.scrollFactor.set();
		add(portraitMid);
		portraitMid.visible = false;

		portraitRight = new FlxSprite(900, 200);
		portraitRight.screenCenter();
		portraitRight.x += 450;
		portraitRight.x -= 330;
		portraitRight.y -= 200;
		portraitRight.scale.set(0.9,0.9);
		portraitRight.frames = Paths.getSparrowAtlas('dialoguestuff/ports/bf_talking');
		portraitRight.animation.addByPrefix('talk', 'BFTalk', 24);
		portraitRight.updateHitbox();
		portraitRight.scrollFactor.set();
		add(portraitRight);
		portraitRight.visible = false;

		portraitRight.antialiasing = true;
		portraitMid.antialiasing = true;
		portraitLeft.antialiasing = true;
		
		box.updateHitbox();
		add(box);

		box.alpha =0;

		box.screenCenter(X);
		box.y += 450;

		boxbf = new FlxSprite(-100).loadGraphic(Paths.image('dialoguestuff/bfbox'));
		boxbf.updateHitbox();
		boxbf.screenCenter();
		add(boxbf);

		boxgf = new FlxSprite(-100).loadGraphic(Paths.image('dialoguestuff/gfbox'));
		boxgf.updateHitbox();
		boxgf.screenCenter();
		add(boxgf);

		boxant = new FlxSprite(-100).loadGraphic(Paths.image('dialoguestuff/antbox'));
		boxant.updateHitbox();
		boxant.screenCenter();
		add(boxant);

		boxgf.scale.set(0.91,0.9);
		boxbf.scale.set(0.91,0.9);
		boxant.scale.set(0.91,0.9);

		handSelect = new FlxSprite(FlxG.width * 0.9, FlxG.height * 0.9).loadGraphic(Paths.image('weeb/pixelUI/hand_textbox'));
		
		if (!talkingRight)
		{
			// box.flipX = true;
		}

		dropText = new FlxText(162, 502, Std.int(FlxG.width * 0.785), "", 32);
		dropText.setFormat(Paths.font("aaa.otf"), 40);
		dropText.color = 0xFF3F2021;
		add(dropText);

		swagDialogue = new FlxTypeText(160, 500, Std.int(FlxG.width * 0.785), "", 32);
		swagDialogue.setFormat(Paths.font("aaa.otf"), 40);
		swagDialogue.color = 0xFFD89494;
		add(swagDialogue);

		swagDialogue.y += 10;
		dropText.y += 10;

		swagDialogue.alpha =0.9;
		dropText.alpha =0.9;

		dialogue = new Alphabet(0, 80, "", false, true);
		// dialogue.x = 90;
		// add(dialogue);
	}

	var dialogueOpened:Bool = false;
	var dialogueStarted:Bool = false;

	override function update(elapsed:Float)
	{
		if (volume)
			sound.volume = 0.25;

		switch (PlayState.SONG.song.toLowerCase())
		{
			case 'explosive':
				bgFade.alpha = 0.5;
				showstuff = true;
			case 'cbt':
				bgFade.alpha = 0.5;
				showstuff = true;
			default:
				bgFade.alpha = 0;
				showstuff = false;
		}
		// HARD CODING CUZ IM STUPDI
		if (PlayState.SONG.song.toLowerCase() == 'roses')
			portraitLeft.visible = false;
		if (PlayState.SONG.song.toLowerCase() == 'thorns')
		{
			portraitLeft.visible = false;
			swagDialogue.color = FlxColor.WHITE;
			dropText.color = FlxColor.BLACK;
		}

		dropText.text = swagDialogue.text;

		dialogueOpened = true;

		if (dialogueOpened && !dialogueStarted)
		{
			startDialogue();
			dialogueStarted = true;
		}

		if (curCharacter == 'bgskip' && dialogueStarted == true)
			{
				dialogueList.remove(dialogueList[0]);
				startDialogue();
			}

		skip = ['stv', 'bgskip', 'lol','hide'];

		if (PlayerSettings.player1.controls.ACCEPT || (dialogueList.length > 0 && skip.contains(curCharacter))  && dialogueStarted == true)
		{
			remove(dialogue);

			if (dialogueList[1] == null && dialogueList[0] != null)
			{
				if (!isEnding)
				{
					isEnding = true;

					sound.volume = 0;
					new FlxTimer().start(0.2, function(tmr:FlxTimer)
					{
						portraitLeft.visible = false;
						portraitMid.visible = false;
						portraitRight.visible = false;
					}, 5);

						finishThing();
						kill();
				}
			}
			else
			{
				dialogueList.remove(dialogueList[0]);
				startDialogue();
			}
		}
		
		super.update(elapsed);

		if (!PlayState.isStoryMode)
			sound.volume = 0;
	}

	var isEnding:Bool = false;

	function startDialogue():Void
	{
		cleanDialog();
		// var theDialog:Alphabet = new Alphabet(0, 70, dialogueList[0], false, true);
		// dialogue = theDialog;
		// add(theDialog);

		// swagDialogue.text = ;
		if (curCharacter == 'bf')
			{
				switch (PlayState.SONG.song.toLowerCase())
				{
					case 'blood-shed':
						swagDialogue.sounds = [FlxG.sound.load(Paths.sound('bflines/bfvoice'), 0)];
					default:
						if (curSound != null && curSound.playing)
							{
								curSound.stop();
							}
						swagDialogue.sounds = [FlxG.sound.load(Paths.sound('bflines/bfvoice'), 0.7)];
				}
			}
			else
				{
					swagDialogue.sounds = [FlxG.sound.load(Paths.sound('pixelText'), 0)];
				}
		swagDialogue.resetText(dialogueList[0]);
		swagDialogue.start(0.04, true);

		swagDialogue.completeCallback = function() {
				portraitLeft.animation.pause();
				portraitLeft.animation.reset();
				portraitRight.animation.pause();
				portraitRight.animation.reset();
				portraitMid.animation.pause();
				portraitMid.animation.reset();
		};
		switch (curCharacter)
		{

			case 'bf':
				portraitRight.animation.play('talk');
				portraitLeft.visible = false;
				if (showstuff)
					portraitRight.visible = true;
				portraitMid.visible = false;

				boxgf.alpha =0;
				boxant.alpha =0;

				switch (PlayState.SONG.song.toLowerCase())
				{
					case 'explosive':
						boxbf.alpha =1;
					case 'cbt':
						boxbf.alpha =1;
					default:
						boxbf.alpha =0.9;
				}

				swagDialogue.alpha =0.9;
				dropText.alpha =0.9;
			case 'gf':
				portraitMid.animation.play('talk');
				portraitLeft.visible = false;
				portraitRight.visible = false;
				if (showstuff)
					portraitMid.visible = true;

				boxbf.alpha =0;
				boxgf.alpha =0.9;
				boxant.alpha =0;

				switch (PlayState.SONG.song.toLowerCase())
				{
					case 'explosive':
						boxgf.alpha =1;
					case 'cbt':
						boxgf.alpha =1;
					default:
						boxgf.alpha =0.9;
				}

				swagDialogue.alpha =0.9;
				dropText.alpha =0.9;
			case 'ant-talk':
				portraitLeft.animation.play('talk');
				if (showstuff)
					portraitLeft.visible = true;
				portraitRight.visible = false;
				portraitMid.visible = false;

				boxbf.alpha =0;
				boxgf.alpha =0;
				boxant.alpha =0.9;

				switch (PlayState.SONG.song.toLowerCase())
				{
					case 'explosive':
						boxant.alpha =1;
					case 'cbt':
						boxant.alpha =1;
					default:
						boxant.alpha =0.9;
				}

				swagDialogue.alpha =0.9;
				dropText.alpha =0.9;
			case 'ant-christ':
				portraitLeft.animation.play('christ');
				portraitLeft.visible = true;
				portraitRight.visible = false;
				portraitMid.visible = false;

				boxbf.alpha =0;
				boxgf.alpha =0;
				boxant.alpha =0.9;

				switch (PlayState.SONG.song.toLowerCase())
				{
					case 'explosive':
						boxant.alpha =1;
					case 'cbt':
						boxant.alpha =1;
					default:
						boxant.alpha =0.9;
				}

				swagDialogue.alpha =0.9;
				dropText.alpha =0.9;
			case 'ant-devilish':
				portraitLeft.animation.play('devilish');
				if (showstuff)
					portraitLeft.visible = true;
				portraitRight.visible = false;
				portraitMid.visible = false;

				boxbf.alpha =0;
				boxgf.alpha =0;
				boxant.alpha =0.9;

				switch (PlayState.SONG.song.toLowerCase())
				{
					case 'explosive':
						boxant.alpha =1;
					case 'cbt':
						boxant.alpha =1;
					default:
						boxant.alpha =0.9;
				}

				swagDialogue.alpha =0.9;
				dropText.alpha =0.9;
			case 'ant-tired':
				portraitLeft.animation.play('tired');
				portraitLeft.visible = true;
				portraitRight.visible = false;
				portraitMid.visible = false;

				boxbf.alpha =0;
				boxgf.alpha =0;
				boxant.alpha =0.9;

				switch (PlayState.SONG.song.toLowerCase())
				{
					case 'explosive':
						boxant.alpha =1;
					case 'cbt':
						boxant.alpha =1;
					default:
						boxant.alpha =0.9;
				}

				swagDialogue.alpha =0.9;
				dropText.alpha =0.9;
			case 'ant-wah':
				portraitLeft.animation.play('wah');
				portraitLeft.visible = true;
				portraitRight.visible = false;
				portraitMid.visible = false;

				boxbf.alpha =0;
				boxgf.alpha =0;
				boxant.alpha =0.9;

				switch (PlayState.SONG.song.toLowerCase())
				{
					case 'explosive':
						boxant.alpha =1;
					case 'cbt':
						boxant.alpha =1;
					default:
						boxant.alpha =0.9;
				}

				swagDialogue.alpha =0.9;
				dropText.alpha =0.9;
			case 'stv':
				if (Paths.exists(Paths.sound(dialogueList[0])))
					{
						if (curSound != null && curSound.playing)
						{
							curSound.stop();
						}
						curSound = new FlxSound().loadEmbedded(Paths.sound(dialogueList[0]));
						//curSound.volume = FlxG.sound.volume;
						curSound.play();
					}
			case 'bg':			
				remove(background);
				background.loadGraphic(Paths.image('dialoguestuff/cutscenes/$curBg'));
				background.setGraphicSize(1280,720);
				background.screenCenter();
				background.antialiasing = false;
				add(background);

				boxbf.alpha =0;
				boxgf.alpha =0;
				boxant.alpha =0;

				swagDialogue.alpha =0;
				dropText.alpha =0;
			case 'lol':			
				volume = false;
				sound.fadeOut(1.5,0);
				new FlxTimer().start(1.5, function(tmr:FlxTimer)
					{
						sound = new FlxSound().loadEmbedded(Paths.music('get_food'),true);
						sound.volume = 0;
						sound.play();
						sound.fadeIn(1.5,0,0.25);
					}, 1);
			case 'hide':
				if (curSound != null && curSound.playing)
					{
						curSound.stop();
					}
					boxbf.alpha =0;
					boxgf.alpha =0;
					boxant.alpha =0;
	
					swagDialogue.alpha =0;
					dropText.alpha =0;

			case 'bgskip':			
				remove(background);
				background.loadGraphic(Paths.image('dialoguestuff/cutscenes/$curBg'));
				background.screenCenter();
				add(background);

				boxbf.alpha =0;
				boxgf.alpha =0;
				boxant.alpha =0;

				swagDialogue.alpha =0;
				dropText.alpha =0;
		}
	}

	function cleanDialog():Void
		{
			var splitName:Array<String> = dialogueList[0].split(":");
			curCharacter = splitName[1];
			dialogueList[0] = dialogueList[0].substr(splitName[1].length + 2).trim();
	
			curBg = dialogueList[0];
		}
}