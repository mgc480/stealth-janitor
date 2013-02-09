--test script adds many polygons of different colors overlayed by text

addSprite("bg", 0, 0, "bar.png", 800, 600);

block_size = 3;
barx = 40;
bary = 200;

i = 0;
while i < 80 do
	i = i + 1;
	addPolySprite("text_bg_red"..i, ((i * block_size) - block_size) % 800 + barx, bary, (0xff0000 * i * 3) % 0xffffff, 0, 0, block_size, 0, block_size, 240, 0, 240);
	addPolySprite("text_bg_blue"..i, (((i * block_size) - block_size) % 800) + 80 * block_size + barx, bary, (0x0000ff * i * 3) % 0xffffff, 0, 0, block_size, 0, block_size, 240, 0, 240);
	addPolySprite("text_bg_green"..i, (((i * block_size) - block_size) % 800) + 160 * block_size + barx, bary, (0x00ff00 * i * 3) % 0xffffff, 0, 0, block_size, 0, block_size, 240, 0, 240);
end


addStringSprite("text_shadow", 60 + 2, 280 + 2, 50, "This a test script it does nothing...", 0xffffff);
addStringSprite("text", 60, 280, 50, "This a test script it does nothing...", 0x000000);

function init()
	stage = 0;	--the current step that the ui is in
end

function event(target, type)
	
end

function error(type)

end