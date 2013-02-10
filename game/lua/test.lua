--test script adds many polygons of different colors overlayed by text

janitor_destX = 400 - (348 / 2) + 16;
janitor_destY = 600 - 430;

addPolySprite("bg_white_right", 0, 0, 0xffffff, 0, 0, 800, 0, 800, 600, 0, 600);

addSprite("right_dark", 800, janitor_destY, "janitor_fron_light.png", 0, 0);
addSprite("left_light", -349, janitor_destY, "janitor_fron_dark.png", 0, 0);

function init()
	stage = 0;

	linearInterpolate("right_dark", janitor_destX, janitor_destY, 80.0);
	linearInterpolate("left_light", janitor_destX, janitor_destY, 80.0);
end

function event(target, type)

	if type == "arrived" then
		if target == "right_dark" or target == "left_light" then
			stage = stage + 1;
		end
	end

	if stage == 2 then
		removeSprite("right_dark");
		removeSprite("left_light");
		
		addPolySprite("bg_black_left", -450, 0, 0x000000, 0, 0, 430, 0, 370, 600, 0, 600);
		linearInterpolate("bg_black_left", 0, 0, 80.0);

		addStringSprite("title_left", 70, 200, 96, "Stealth", 0xffffff);
		addStringSprite("title_right", 450, 200, 96, "Janitor", 0x000000);

		addSprite("split", janitor_destX, janitor_destY, "janitor_fron_split.png", 0, 0);

		stage = 3;
	end
end

function error(type)

end