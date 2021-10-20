package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.text.FlxTypeText;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxSpriteGroup;
import flixel.input.FlxKeyManager;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;

using StringTools;

class DialogueBox extends FlxSpriteGroup
{
	var box:FlxSprite;

	var curCharacter:String = '';

	var dialogue:Alphabet;
	var dialogueList:Array<String> = [];

	// SECOND DIALOGUE FOR THE PIXEL SHIT INSTEAD???
	var swagDialogue:FlxTypeText;

	var dropText:FlxText;

	public var finishThing:Void->Void;

	var portrait:FlxSprite;
	var bbboxu:FlxSprite; //bbpanzu but a box jk this is just the cooler box thing lol
	var cutscene:FlxSprite;
	var cutsceneStr:String;

	var handSelect:FlxSprite;
	var bgFade:FlxSprite;
	var scoreText:FlxText;
	var scoreText2:FlxText;

	public function new(talkingRight:Bool = true, ?dialogueList:Array<String>)
	{
		super();
		scoreText = new FlxText(895, 680, 0, "Press Q to skip all dialogue", 36);
		scoreText.setFormat("VCR OSD Mono", 32);
		scoreText2 = new FlxText(897, 682, 0, "Press Q to skip all dialogue", 36);
		scoreText2.setFormat("VCR OSD Mono", 32, FlxColor.BLUE);

		switch (PlayState.SONG.song.toLowerCase())
		{
			case 'thorns':
				FlxG.sound.playMusic(Paths.music('LunchboxScary'), 0);
				FlxG.sound.music.fadeIn(1, 0, 0.8);
		}
		FlxG.sound.playMusic(Paths.music('week'+PlayState.storyWeek), 0);
		FlxG.sound.music.fadeIn(1, 0, 0.8);

		bgFade = new FlxSprite(-200, -200).makeGraphic(Std.int(FlxG.width * 1.3), Std.int(FlxG.height * 1.3), 0xFFB3DFd8);
		bgFade.scrollFactor.set();
		bgFade.alpha = 0;
		add(bgFade);

		new FlxTimer().start(0.2, function(tmr:FlxTimer)
		{
					bgFade.alpha = .5;
					bgFade.alpha += (.05);
					if (bgFade.alpha > 0.7)
					bgFade.alpha = 0.7;
		}, 5);

		box = new FlxSprite(0, 375);
		
		var hasDialog = false;
		switch (PlayState.SONG.song.toLowerCase())
		{
			default:
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('portraits/speech_bubble_talking');
				box.animation.addByPrefix('normalOpen', 'Speech Bubble Normal Open', 24, false);
				box.animation.addByPrefix('normal', 'speech normal bubble', 24, true);
			case 'thorns':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('weeb/pixelUI/dialogueBox-evil');
				box.animation.addByPrefix('normalOpen', 'Spirit Textbox spawn', 24, false);
				box.animation.addByIndices('normal', 'Spirit Textbox spawn', [11], "", 24);

				var face:FlxSprite = new FlxSprite(320, 170).loadGraphic(Paths.image('weeb/spiritFaceForward'));
				face.setGraphicSize(Std.int(face.width * 6));
				add(face);
		}

		this.dialogueList = dialogueList;
		
		if (!hasDialog)
			return;
		
		cutscene = new FlxSprite(0, 0);
		add(cutscene);
		bbboxu = new FlxSprite(Std.parseFloat(CoolUtil.coolTextFile('assets/images/portraits/DialogueSetup.txt')[0].split(":")[1]), Std.parseFloat(CoolUtil.coolTextFile('assets/images/portraits/DialogueSetup.txt')[1].split(":")[1]));
		add(bbboxu);

		portrait = new FlxSprite(0, 210);
		portrait.frames = Paths.getSparrowAtlas('portraits/pump_ports');
		portrait.animation.addByPrefix('enter', 'pump content port ', 24, false);
		portrait.setGraphicSize(Std.int(portrait.width * 1));
		portrait.updateHitbox();
		portrait.scrollFactor.set();
		add(portrait);
		portrait.visible = false;

		box.visible = false;
		box.animation.play('normalOpen');
		box.setGraphicSize(Std.int(box.width * 1));
		box.updateHitbox();
		add(box);

		handSelect = new FlxSprite(FlxG.width * 0.9, FlxG.height * 0.9).loadGraphic(Paths.image('hand_textbox'));
		add(handSelect);


		if (portrait.visible = true)
		{
			//box.flipX = true;
		}


		dropText = new FlxText(Std.parseFloat(CoolUtil.coolTextFile('assets/images/portraits/DialogueSetup.txt')[2].split(":")[1])+2, Std.parseFloat(CoolUtil.coolTextFile('assets/images/portraits/DialogueSetup.txt')[3].split(":")[1])+2, Std.int(FlxG.width * 0.6), "", 32);
		dropText.font = 'Pixel Arial 11 Bold';
		dropText.color = 0xFF3F2021;
		add(dropText);

		swagDialogue = new FlxTypeText(Std.parseFloat(CoolUtil.coolTextFile('assets/images/portraits/DialogueSetup.txt')[2].split(":")[1]), Std.parseFloat(CoolUtil.coolTextFile('assets/images/portraits/DialogueSetup.txt')[3].split(":")[1]), Std.int(FlxG.width * 0.6), "", 32);
		swagDialogue.font = 'Pixel Arial 11 Bold';
		swagDialogue.color = 0xFFD89494;
		swagDialogue.sounds = [FlxG.sound.load(Paths.sound('pixelText'), 0.6)];
		add(swagDialogue);
		add(scoreText);
		add(scoreText2);

		dialogue = new Alphabet(0, 80, "", false, true);
		// dialogue.x = 90;
		// add(dialogue);
					funnyAlphaLoop();
	}

	var dialogueOpened:Bool = false;
	var dialogueStarted:Bool = false;
	var diaSkip:Bool = false;
	var targetnumalpha:Float = 0;
	var _typing:Bool = false;

	override function update(elapsed:Float)
	{
		scoreText2.alpha = scoreText.alpha;
		
		if (FlxG.keys.justPressed.Q)
			{
				PlayState.shitterman = "rr";
				PlayState.usedTime = false;
				bgFade.visible = true;
				diaSkip = true;
				isEnding = true;
				FlxG.sound.music.fadeOut(2.2, 0);

				new FlxTimer().start(0.1, function(tmr:FlxTimer)
				{
					box.alpha -= 1 / 10;
					bgFade.alpha -= 1 / 10 * 0.7;
					portrait.visible = false;
					swagDialogue.alpha -= 1 / 10;
					dropText.alpha = swagDialogue.alpha;
				}, 5);

				new FlxTimer().start(.5, function(tmr:FlxTimer)
				{
					finishThing();
					kill();
				});
			}
		if (PlayState.SONG.song.toLowerCase() == 'thorns')
		{
			portrait.color = FlxColor.BLACK;
			swagDialogue.color = FlxColor.WHITE;
			dropText.color = FlxColor.BLACK;
		}

		dropText.text = swagDialogue.text;

		if (box.animation.curAnim != null)
		{
			if (box.animation.curAnim.name == 'normalOpen' && box.animation.curAnim.finished)
			{
				box.animation.play('normal');
				dialogueOpened = true;
			}
		}

		if (dialogueOpened && !dialogueStarted)
		{
			startDialogue();
			dialogueStarted = true;
		}

		if (FlxG.keys.justPressed.ANY  && dialogueStarted == true || diaSkip == true)
		{
			remove(dialogue);
				
			if (diaSkip == false)
				{
					FlxG.sound.play(Paths.sound('clickText'), 0.8);
				}
				diaSkip = false;

			if (dialogueList[1] == null && dialogueList[0] != null)
			{
				if (!isEnding)
				{
					isEnding = true;
					FlxG.sound.music.fadeOut(2.2, 0);

					new FlxTimer().start(0.1, function(tmr:FlxTimer)
					{
						bbboxu.alpha -= 1 / 10;
						bgFade.alpha -= 1 / 10 * 0.7;
						portrait.visible = false;
						swagDialogue.alpha -= 1 / 10;
						dropText.alpha = swagDialogue.alpha;
					}, 5);

					new FlxTimer().start(.5, function(tmr:FlxTimer)
					{
						finishThing();
						kill();
					});
				}
			}
			else
			{
				dialogueList.remove(dialogueList[0]);
				startDialogue();
			}
		}
		
		if (swagDialogue._typing && dialogueList[0] != ' …' && dialogueList[0] != ' ...')
			{
				portrait.animation.play('talk');
			}
		else if (!swagDialogue._typing)
			{
				portrait.animation.stop;
			}

		super.update(elapsed);
	}

	var isEnding:Bool = false;

	function startDialogue():Void
	{
		cleanDialog();
		// var theDialog:Alphabet = new Alphabet(0, 70, dialogueList[0], false, true);
		// dialogue = theDialog;
		// add(theDialog);

		// swagDialogue.text = ;
		cutscene.visible = false;
		if (!portrait.visible)
		{
			portrait.visible = true;
		}
			switch(curCharacter)
			{
				case 'image':
					PlayState.shitterman = cutsceneStr;
					PlayState.usedTime = true;
					bgFade.visible = false;
					diaSkip = true;
				case 'endimage':
					PlayState.shitterman = "rr";
					PlayState.usedTime = false;
					bgFade.visible = true;
					diaSkip = true;
				default:
					swagDialogue.color = FlxColor.fromString(CoolUtil.coolTextFile('assets/images/portraits/$curCharacter/info.txt')[3].split(":")[0]);
					dropText.color = FlxColor.fromString(CoolUtil.coolTextFile('assets/images/portraits/$curCharacter/info.txt')[3].split(":")[1]);
					remove(bbboxu);
					bbboxu.loadGraphic('assets/images/portraits/$curCharacter/box.png');
					remove(portrait);
					portrait = new FlxSprite(Std.parseFloat(CoolUtil.coolTextFile('assets/images/portraits/$curCharacter/info.txt')[0]),Std.parseFloat(CoolUtil.coolTextFile('assets/images/portraits/$curCharacter/info.txt')[1]));
					portrait.frames = Paths.getSparrowAtlas('portraits/$curCharacter/ports');
					portrait.animation.addByPrefix('talk', cutsceneStr, 24, false);
					portrait.setGraphicSize(Std.int(portrait.width*Std.parseFloat(CoolUtil.coolTextFile('assets/images/portraits/$curCharacter/info.txt')[2])));
					portrait.updateHitbox();
					portrait.scrollFactor.set();
					add(portrait);
					add(bbboxu);
					//swagDialogue.sounds = [FlxG.sound.load(Paths.sound('dialogue/$curCharacter'+'-01'), 0.6),FlxG.sound.load(Paths.sound('dialogue/$curCharacter'+'-02'), 0.6),FlxG.sound.load(Paths.sound('dialogue/$curCharacter'+'-03'), 0.6),FlxG.sound.load(Paths.sound('dialogue/$curCharacter'+'-04'), 0.6),FlxG.sound.load(Paths.sound('dialogue/$curCharacter'+'-05'), 0.6)];
					swagDialogue.sounds = [FlxG.sound.load(Paths.sound('dialogue/$curCharacter'+'-0'+FlxG.random.int(1,5)), 0.6)];
					swagDialogue.resetText(dialogueList[0]); // PUMPPPPPPO curCharacter is the character
					swagDialogue.start(0.04, true);
			}
			/*switch (cutsceneStr)
			{
				case 'hide':
				{
					cutscene.visible = false;
				}
	
				case 'no':
				{
					trace('nothin changing here lmao');
				}
	
				default:
				{
					cutscene.visible = true;
					cutscene.loadGraphic(Paths.image('cutscenes/' + cutsceneStr));
				}
	
	
			}*/
		}
	
		function cleanDialog():Void
		{
			var splitName:Array<String> = dialogueList[0].split(":");
			curCharacter = splitName[1];
			cutsceneStr = splitName[2];
	
			dialogueList[0] = dialogueList[0].substr(splitName[1].length + splitName[2].length + 3).trim();
		}

		function funnyAlphaLoop():Void
			{
			FlxTween.tween(scoreText, {alpha: targetnumalpha}, 0.7, {ease: FlxEase.quintOut,
				onComplete: function(twn:FlxTween)
				{
					if (targetnumalpha == 0)
					targetnumalpha = 1;
					else if (targetnumalpha == 1)
					targetnumalpha = 0;
					funnyAlphaLoop();
				}});
			}
	}
