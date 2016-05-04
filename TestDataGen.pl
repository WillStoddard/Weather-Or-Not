#!/usr/bin/perl
use LWP::Simple;
use strict;
use FileHandle;
use Date::Calc qw(:all);

my ($zipcode, $threshold) = @ARGV;
$daySince1990 = Date_to_Days(1990,1,1);
($cyear, $cmonth, $cday) = Today();
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


$tyear = 1990;
$tmonth = 1;
$tday = 1;
while((Date_to_Days($tyear, $tmonth, 1) < Date_to_Days($cyear, $cmonth, 1)){
    my @precip;
    my $avgMonth = 0;
    my $webpage=LWP::Simple::getstore("http://www.wunderground.com/history/zipcode/$zipcode/$tyear/$tmonth/1/MonthlyHistory.html?format=1","average.csv");
    my $filename1 = "average.csv";
    my $fh1 = new FileHandle "$filename1";
    while(<$fh1>){
        my @array = split/,/;
        if($array[19] 1="PrecipitationIn"){
            push(@precip, $array[19];
        }
    close $fh1;
    $total = 0;
    foreach(@precip){
        $total = $total + $_;
    }
    $avgMonth = ($total/scalar(@precip));
    my @weather;
    my $webpage=LWP::Simple::getstore("http://www.wunderground.com/history/zipcode/$zipcode/$tyear/$tmonth/1/MonthlyHistory.html?format=1","weather.csv");
    my $filename="weather.csv";
    my $fh= new FileHandle "$filename";
    while(<$fh>){
        my @array=split/,/;
        #print "@array\n";
        if($array[19]!="PrecipitationIn"){
            if($array[19] > ($avgMonth + $threshold)){
                if($array[2]!="Mean TemperatureF"){
                    push(@weather, $array[2]);
                }  
                if($array[11]!="Mean Sea Level PressureIn"){
                    push(@weather, $array[11]);
                }
            }
        }
    }
    foreach(@weather){
        print "$_  ";
    }
    close $fh;
    ($tyear, $tmonth, $tday) = Add_Delta_YM($tyear, $tmonth, $tday, 0, 1);
}
