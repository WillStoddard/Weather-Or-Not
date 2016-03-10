#!/usr/bin/perl
use LWP::Simple;
use strict;
use FileHandle;
use Date::Calc qw(:all);


$daySince1990 = Date_to_Days(1990,1,1);
my @storm;my @avgWeath;my @city;my @year;my @month;my @day;my @eDay;my @eMonth;my @eYear; my $c;
$storm[0]="Blizzard of 1999";
$city[0]="KISW";
$year[0]="1998";
$month[0]="12";
$day[0]="17";
$eDay[0]="5";
$eMonth[0]="1";
$eYear[0]="1999";

$storm[1]="Groundhog Day Blizzard";
$city[1]="KBOS";
$year[1]="2011";
$month[1]="1";
$day[1]="16";
$eDay[1]="4";
$eMonth[1]="2";
$eYear[1]="2011";

$storm[2]="Last November";
$city[2]="KBOS";
$year[2]="2015";
$month[2]="11";
$day[2]="3";
$eDay[2]="22";
$eMonth[2]="11";
$eYear[2]="2015";

$storm[3]="Last January";
$city[3]="KBOS";
$year[3]="2015";
$month[3]="1";
$day[3]="3";
$eDay[3]="22";
$eMonth[3]="1";
$eYear[3]="2015";

$storm[4]="Last February";
$city[4]="KBOS";
$year[4]="2015";
$month[4]="2";
$day[4]="3";
$eDay[4]="22";
$eMonth[4]="2";
$eYear[4]="2015";

$storm[5]="Last March";
$city[5]="KBOS";
$year[5]="2015";
$month[5]="2";
$day[5]="3";
$eDay[5]="22";
$eMonth[5]="2";
$eYear[5]="2015";

my @precip;

$c=0;
foreach(@storm){
    my @weather;
    my $webpage=LWP::Simple::getstore("http://www.wunderground.com/history/zipcode/$city[$c]/$year[$c]/$month[$c]/$day[$c]/CustomHistory.html?dayend=$eDay[$c]&monthend=$eMonth[$c]&yearend=$eYear[$c]&req_city=&req_state=&req_statename=&reqdb.zip=&reqdb.magic=&reqdb.wmo=&MR=1&format=1","weather.csv");
    my $filename="weather.csv";
    my $fh= new FileHandle "$filename";
    while(<$fh>){
        my @array=split/,/;
        #print "@array\n";
        if($array[1]!="Max TemperatureF"){
            push(@weather, $array[1]);
        }
        if($array[2]!="Mean TemperatureF"){
            push(@weather, $array[2]);
        }
        if($array[3]!="Min TemperatureF"){
            push(@weather, $array[3]);
        }
        if($array[10]!="Max Sea Level PressureIn"){
            push(@weather, $array[10]);
        }
        if($array[11]!="Mean Sea Level PressureIn"){
            push(@weather, $array[11]);
        }
        if($array[12]!="Min Sea Level PressureIn"){
            push(@weather, $array[12]);
        }
        if($array[16]!="Max Wind SpeedMPH"){
            push(@weather, $array[16]);
        }
        if($array[17]!="Mean Wind SpeedMPH"){
            push(@weather, $array[17]);
        }
    }
    if($_ eq "Blizzard of 1999"){
        print "1";
    }else{
        print "\n1 ";
    }
    foreach(@weather){
        print "$_  ";
    }
    close $fh;
    $c++;
}
