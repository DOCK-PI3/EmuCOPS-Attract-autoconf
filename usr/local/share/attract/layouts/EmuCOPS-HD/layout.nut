//
// Attract-Mode Front-End - CoinOps Layout based on "Basic" sample layout
//
//instead of drawing on the layout directly, we draw on a surface to ensure
//an aspect ratio of ~16/9
//fe.layout.width=1280;
//fe.layout.height=720;

fe.layout.width=ScreenWidth;
fe.layout.height=ScreenHeight;

local screenAspect=(1.0*ScreenWidth)/ScreenHeight;
local layoutAspect=16.0/9.0;
if (screenAspect > 1.2 && screenAspect < 1.4)
{
	layoutAspect=screenAspect;
}

local surfaceWidth=layoutAspect*ScreenHeight;
local surfaceHeight=ScreenHeight;

local fs=fe.add_surface(surfaceWidth,surfaceHeight)

//x scale factor
local xs=surfaceWidth/1280.;
//y scale factor
local ys=surfaceHeight/720.;

fs.add_image( "backdrop-list.png", 0, 0, 1280*xs, 720*ys );

local t = fs.add_artwork( "marquee", 715*xs, 87*ys, 520*xs, 112*ys);
t.trigger = Transition.EndNavigation;

local t = fs.add_artwork( "snap", 757*xs, 218*ys, 436*xs,  374*ys );
t.trigger = Transition.EndNavigation;
t.preserve_aspect_ratio=true;

local lb = fs.add_listbox( 10*xs, 35*ys, 480*xs, 740*ys );
lb.rows = 19;
lb.charsize = 15*ys;

// Top Row:

local l = fs.add_text( "[System]", 0, 20*ys, 1280*xs, 16*ys );
l.set_rgb( 150, 150, 150 );

local l = fs.add_text( "[FilterName]", 1130*xs, 20*ys, 290*xs, 16*ys );
l.set_rgb( 150, 150, 150 );
l.align = Align.Left;

local l = fs.add_text( "[ListEntry]/[ListSize]", 302*xs, 20*ys, 290*xs, 16*ys );
l.set_rgb( 150, 150, 150 );
l.align = Align.Right;

// Bottom Left side:

// local l = fs.add_text( "[Title]", 610*xs, 670*ys, 610*xs, 30*ys );
// l.set_rgb( 200, 200, 70 );
// l.align = Align.Left;

local l = fs.add_text( "[Year] [Manufacturer]", 20*xs, 532*ys, 630*xs, 20*ys );
l.set_rgb( 150, 150, 150 );
l.align = Align.Left;

local l = fs.add_text( "[Category]", 20*xs, 552*ys, 630*xs, 20*ys );
l.set_rgb( 150, 150, 150 );
l.align = Align.Left;
