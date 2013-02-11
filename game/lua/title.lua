--test script adds many polygons of different colors overlayed by text

janitor_destX = 400 - (348 / 2) + 16;
janitor_destY = 600 - 430;

addPolySprite("bg_white_right", 0, 0, 0xffffff, 0, 0, 800, 0, 800, 600, 0, 600);

addSprite("left_light", -349, janitor_destY, "janitor_fron_dark.png");
addSprite("right_dark", 800, janitor_destY, "janitor_fron_light.png");

addSprite("left_light_split", -349, janitor_destY, "janitor_fron_dark.png", 0, 0, 0, 0, (348 / 2) - 19, 430);

addPolySprite("bg_black_left", -450, 0, 0x000000, 0, 0, 430, 0, 370, 600, 0, 600);
addStringSprite("title_right", 800, 200, 96, "Janitor", 0x000000);

addStringSprite("cts", 100, 600, 100, "Click to Start", 0xaa0000);

function init()
	stage = 0;

	linearInterpolate("right_dark", janitor_destX, janitor_destY, 60.0);
	linearInterpolate("left_light", janitor_destX, janitor_destY, 60.0);
	linearInterpolate("left_light_split", janitor_destX, janitor_destY, 60.0);

	linearInterpolate("bg_black_left", 0, 0, 10);
	linearInterpolate("title_right", 450, 200, 10);
end

function event(target, type)

	if target == "mousedown" or target == "keydown" then
		print("seting state to intro");
		callState("intro_state");
	end

	if type == "arrived" then
		if target == "right_dark" or target == "left_light" then
			stage = stage + 1;
		end
	end

	if stage == 3 and type == "arrived" then
		linearInterpolate("cts", 100, 490, 10);
		stage = 4;
		return;
	end

	if stage == 2 then
		removeSprite("right_dark");
		removeSprite("left_light");
		removeSprite("left_light_split");

		linearInterpolate("bg_black_left", 0, 0, 155.0);

		addStringSprite("title_left", 70, 200, 96, "Stealth", 0xffffff);
		linearInterpolate("title_right", 450, 200, 150.0);

		addSprite("split", janitor_destX, janitor_destY, "janitor_fron_split.png");

		stage = 3;

		return;
	end
end

function error(type)

end