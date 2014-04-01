#!/usr/bin/perl
use Image::Magick;	# apt-get install perlmagick

my $image = Image::Magick->new;
$image->Set(size => '720x580');
$image->ReadImage('canvas:black');

$image->Annotate(
	gravity => 'south',
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
	gravity => 'south',
);

$image->Annotate(
	gravity => 'south',
	pointsize => 60,
	stroke => 'white',
	fill => 'white',
	font => 'Helvetica',
	text => 'FOR\nSUNFLOWER',
);

$image->Write(filename => 'avatar.png');
