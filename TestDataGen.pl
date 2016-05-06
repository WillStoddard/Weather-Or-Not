#!/usr/bin/perl
use LWP::Simple;
use strict;
use FileHandle;
use Date::Calc qw(:all);

(my $precipThresh, my $targDate, my $zipC) = @ARGV;


$daySince1990 = Date_to_Days(1990,1,1);
my @storm;my @avgWeath;my @city;my @year;my @month;my @day;my @eDay;my @eMonth;my @eYear; my $c;

my @precip;

$c=0;
my @ymd = $targDate.split;
for(@storm){
    my @weather;
    my $webpage=LWP::Simple::getstore("http://www.wunderground.com/history/$zipC/$ymd[0]/$ymd[1]/$ymd[2]/CustomHistory.html?dayend=$eDay[$c]&monthend=$eMonth[$c]&yearend=$eYear[$c]&req_city=&req_state=&req_statename=&reqdb.zip=&reqdb.magic=&reqdb.wmo=&MR=1&format=1","weather.csv");
    my $filename="weather.csv";
    my $fh= new FileHandle "$filename";
    while(<$fh>){
        my @array=split/,/;
        #print "@array\n";
        if($array[2]!="Mean TemperatureF"){
            push(@weather, $array[2]);
        }
        if($array[11]!="Mean Sea Level PressureIn"){
            push(@weather, $array[11]);
        }
    }
    foreach(@weather){
        print "$_  ";
    }
    close $fh;
    $c++;
}
