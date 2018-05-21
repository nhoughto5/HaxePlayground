package;
import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.tweens.FlxTween;

class PlayState extends FlxState
{
	var sprite:FlxSprite;
	override public function create():Void
	{
		super.create();
		sprite = new FlxSprite();
		sprite.loadGraphic(AssetPaths.darthNihilus__png);
		sprite.x = FlxG.width / 2 -sprite.width / 2;
		sprite.y = FlxG.height / 2 -sprite.width / 2;
		sprite.scale.x = 0.5;
		sprite.scale.y = 0.5;
		add(sprite);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if(FlxG.keys.pressed.LEFT) sprite.x--;
		if(FlxG.keys.pressed.RIGHT) sprite.x++;

		if(FlxG.keys.pressed.DOWN) sprite.y++;
		if(FlxG.keys.pressed.UP) sprite.y--;
	}
}
