//
// Attract-Mode Front-End - CoinOps Layout based on "Basic" sample layout
//
//instead of drawing on the layout directly, we draw on a surface to ensure
//an aspect ratio of ~4/3
//fe.layout.width=640;
//fe.layout.height=480;

fe.layout.width=ScreenWidth;
fe.layout.height=ScreenHeight;

local screenAspect=(1.0*ScreenWidth)/ScreenHeight;
local layoutAspect=4.0/3.0;
if (screenAspect > 1.2 && screenAspect < 1.4)
{
	layoutAspect=screenAspect;
}

local surfaceWidth=layoutAspect*ScreenHeight;
local surfaceHeight=ScreenHeight;

local fs=fe.add_surface(surfaceWidth,surfaceHeight)

//x scale factor
local xs=surfaceWidth/640.;
//y scale factor
local ys=surfaceHeight/480.;

fs.add_image( "backdrop-list.png", 0, 0, 640*xs, 480*ys );

local t = fs.add_artwork( "marquee", 260*xs, 59*ys, 346*xs, 74*ys);
t.trigger = Transition.EndNavigation;

local t = fs.add_artwork( "snap", 288*xs, 163*ys, 290*xs,  215*ys );
t.trigger = Transition.EndNavigation;
t.preserve_aspect_ratio=true;

local lb = fs.add_listbox( 10*xs, 35*ys, 240*xs, 370*ys );
lb.rows = 19;
lb.charsize = 12*ys;

// Top Row:

local l = fs.add_text( "[System]", 0, 10*ys, 640*xs, 16*ys );
l.set_rgb( 150, 150, 150 );

local l = fs.add_text( "[FilterName]", 10*xs, 10*ys, 290*xs, 16*ys );
l.set_rgb( 150, 150, 150 );
l.align = Align.Left;

local l = fs.add_text( "[ListEntry]/[ListSize]", 320*xs, 10*ys, 290*xs, 16*ys );
l.set_rgb( 150, 150, 150 );
l.align = Align.Right;

// Bottom Left side:

local l = fs.add_text( "[Title]", 10*xs, 412*ys, 630*xs, 20*ys );
l.set_rgb( 200, 200, 70 );
l.align = Align.Left;

local l = fs.add_text( "[Year] [Manufacturer]", 10*xs, 432*ys, 630*xs, 20*ys );
l.set_rgb( 150, 150, 150 );
l.align = Align.Left;

local l = fs.add_text( "[Category]", 10*xs, 452*ys, 630*xs, 20*ys );
l.set_rgb( 150, 150, 150 );
l.align = Align.Left;
