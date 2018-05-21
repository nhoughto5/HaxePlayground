package;
import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.input.mouse.FlxMouseEventManager;

class PlayState extends FlxState
{
	var sprite:FlxSprite;
	var scaleFactor = 0.1;
	override public function create():Void
	{
		super.create();
		sprite = new FlxSprite();
		sprite.loadGraphic(AssetPaths.darthNihilus__png);
		sprite.scale.x = 0.5;
		sprite.scale.y = 0.5;
		sprite.x = FlxG.width / 2 - sprite.width / 2;
		sprite.y = FlxG.height / 2 - sprite.height / 2;
		add(sprite);

		FlxMouseEventManager.add(sprite, 
			function(s:FlxSprite){ trace("Mouse Down");},
			function(s:FlxSprite){ trace("Mouse Up");},
			function(s:FlxSprite){ trace("Mouse Over");},
			onMouseOut);
	}

	public function onMouseOut(s:FlxSprite):Void{
		trace("Mouse Out, sprite at: " + s.x + ", " + s.y + "  Mouse at: " + FlxG.mouse.getPosition());
	}

	private function handleMouse():Void {
		if(FlxG.mouse.overlaps(sprite)){
			if(FlxG.mouse.pressed){
				sprite.setPosition(FlxG.mouse.getPosition().x - sprite.width / 2,  FlxG.mouse.getPosition().y - sprite.height / 2);
			}
		}
		if(FlxG.mouse.justReleasedRight){
			sprite.x = FlxG.width / 2 - sprite.width / 2;
			sprite.y = FlxG.height / 2 - sprite.height / 2;
			sprite.scale.set(0.5, 0.5);
		}
		if(FlxG.mouse.wheel != 0) {
			sprite.scale.add(FlxG.mouse.wheel * scaleFactor, FlxG.mouse.wheel * scaleFactor);
		}
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if(FlxG.keys.pressed.LEFT) sprite.x--;
		if(FlxG.keys.pressed.RIGHT) sprite.x++;

		if(FlxG.keys.pressed.DOWN) sprite.y++;
		if(FlxG.keys.pressed.UP) sprite.y--;

		//handleMouse();
	}
}
