--test script adds many polygons of different colors overlayed by text

janitor_destX = 400 - (348 / 2) + 16;
janitor_destY = 600 - 430;

addSprite("right_dark", 800, janitor_destY, "janitor_fron_light.png", 0, 0);
addSprite("left_light", -349, janitor_destY, "janitor_fron_dark.png", 0, 0);

function init()
	arrived = 0;

	linearInterpolate("right_dark", janitor_destX, janitor_destY, 80.0);
	linearInterpolate("left_light", janitor_destX, janitor_destY, 80.0);
end

function event(target, type)

	if type == "arrived" then
		arrived = arrived + 1;
	end

	if arrived >= 2 then
		removeSprite("right_dark");
		removeSprite("left_light");

		addPolySprite("bg_black_left", 0, 0, 0x000000, 0, 0, 400, 0, 400, 600, 0, 600);
		addPolySprite("bg_white_right", 400, 0, 0xffffff, 0, 0, 400, 0, 400, 600, 0, 600);

		addStringSprite("title_left", 70, 200, 96, "Stealth", 0xffffff);
		addStringSprite("title_right", 450, 200, 96, "Janitor", 0x000000);

		addSprite("split", janitor_destX, janitor_destY, "janitor_fron_split.png", 0, 0);
	end
end

function error(type)

end