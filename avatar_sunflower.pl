#!/usr/bin/perl
use Image::Magick;	# apt-get install perlmagick

my $BACKGROUND = 'background_g0v.png';

my $image = Image::Magick->new;
$image->Set(size => '720x580');

if(-f $BACKGROUND)
{
	$image->Read($BACKGROUND);
}
else
{
	$image->ReadImage('canvas:black');
}

$image->Annotate(
	gravity => 'SouthWest',
	pointsize => 100,
	stroke => 'white',
	fill => 'white',
	font => 'Helvetica',
	text => $ARGV[0],
);

$image->Extent(
	width => 720,
	height => 720,
	background => 'black',
	gravity => 'South',
);

$image->Annotate(
	gravity => 'SouthWest',
	pointsize => 60,
	stroke => 'white',
	fill => 'white',
	font => 'Helvetica',
	text => 'FOR\nSUNFLOWER',
);

$image->Write(filename => 'avatar.png');
