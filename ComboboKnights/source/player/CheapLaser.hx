package player;

import flixel.addons.effects.FlxTrail;
import flixel.FlxSprite;
import flixel.FlxG;


/**
 * ...
 * @author Gerardo Heidel
 */
class CheapLaser extends FlxSprite
{
	var endX :Float = 0;
	var endY :Float = 0;
	var invAlpha :Float = 0;
	public function new(X:Float=0, Y:Float=0, EndX:Float=0, EndY:Float=0, ?SimpleGraphic:Dynamic) 
	{
		super(X, Y, SimpleGraphic);
//		loadGraphic(SimpleGraphic, false);
		endX = EndX;
		endY = EndX;
		origin.set(0, 0);
	}
	
	override public function update() :Void
	{
		super.update();
		
		scale.x = (endX);
		alpha -= FlxG.elapsed ;
		
		if (alpha <= 0)
		{
			destroy();
		}
	}
	
	
	
}