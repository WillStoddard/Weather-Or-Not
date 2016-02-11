#!/usr/bin/perl
use LWP::Simple;
use strict;
use FileHandle;

my @storm;my @avgWeath;my @city;my @year;my @month;my @day;my @eDay;my @eMonth;my @eYear;my $c;
$storm[0]="Blizzard of 78";
$city[0]="KBOS";
$year[0]="1978";
$month[0]="1";
$day[0]="21";
$eDay[0]="9";
$eMonth[0]="2";
$eYear[0]="1978";

$storm[1]="Storm of the Century";
$city[1]="KBOS";
$year[1]="1993";
$month[1]="2";
$day[1]="26";
$eDay[1]="17";
$eMonth[1]="3";
$eYear[1]="1993";

$storm[2]="Blizzard of 1996";
$city[2]="KBOS";
$year[2]="1995";
$month[2]="12";
$day[2]="24";
$eDay[2]="12";
$eMonth[2]="1";
$eYear[2]="1996";

$storm[3]="Dec 2010";
$city[3]="KBOS";
$year[3]="2010";
$month[3]="12";
$day[3]="10";
$eDay[3]="29";
$eMonth[3]="12";
$eYear[3]="2010";

$storm[4]="Blizzard of 2005";
$city[4]="KBOS";
$year[4]="2005";
$month[4]="1";
$day[4]="7";
$eDay[4]="26";
$eMonth[4]="1";
$eYear[4]="2005";

$storm[5]="Buffalo Blizzard";
$city[5]="KBUF";
$year[5]="2014";
$month[5]="11";
$day[5]="3";
$eDay[5]="22";
$eMonth[5]="11";
$eYear[5]="2014";

$avgWeath[0]="Average November";
$city[6]="KBUF";
$year[6]="2012";
$month[6]="11";
$day[6]="3";
$eDay[6]="22";
$eMonth[6]="11";
$eYear[6]="2012";

$avgWeath[1]="Average December";
$city[7]="KBOS";
$year[7]="2014";
$month[7]="12";
$day[7]="3";
$eDay[7]="22";
$eMonth[7]="12";
$eYear[7]="2014";

$avgWeath[2]="Average January";
$city[8]="KBOS";
$year[8]="2013";
$month[8]="1";
$day[8]="3";
$eDay[8]="22";
$eMonth[8]="1";
$eYear[8]="2013";

$avgWeath[3]="Average February";
$city[9]="KBOS";
$year[9]="2012";
$month[9]="2";
$day[9]="3";
$eDay[9]="22";
$eMonth[9]="2";
$eYear[9]="2012";

$avgWeath[4]="Average March";
$city[10]="KBOS";
$year[10]="2011";
$month[10]="3";
$day[10]="3";
$eDay[10]="22";
$eMonth[10]="3";
$eYear[10]="2011";

$c=0;
foreach(@storm){
    my @weather;
    my $webpage=LWP::Simple::getstore("http://www.wunderground.com/history/airport/$city[$c]/$year[$c]/$month[$c]/$day[$c]/CustomHistory.html?dayend=$eDay[$c]&monthend=$eMonth[$c]&yearend=$eYear[$c]&req_city=&req_state=&req_statename=&reqdb.zip=&reqdb.magic=&reqdb.wmo=&MR=1&format=1","weather.csv");
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
    if($_ eq "Blizzard of 78"){
        print "1 ";
    }else{
        print "\n1 ";
    }
    foreach(@weather){
        print "$_  ";
    }
    close $fh;
    $c++;
}
foreach(@avgWeath){
    my @weather;
    my $webpage=LWP::Simple::getstore("http://www.wunderground.com/history/airport/$city[$c]/$year[$c]/$month[$c]/$day[$c]/CustomHistory.html?dayend=$eDay[$c]&monthend=$eMonth[$c]&yearend=$eYear[$c]&req_city=&req_state=&req_statename=&reqdb.zip=&reqdb.magic=&reqdb.wmo=&MR=1&format=1","weather.csv");
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
    if($_ eq "Average November"){
        print "-1";
    }else{
        print "\n-1 ";
    }
    foreach(@weather){
        print "$_  ";
    }
    close $fh;
    $c++;
}

