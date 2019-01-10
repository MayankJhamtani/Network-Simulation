set val(nn) 37
set opt(x) 120
set opt(y) 120
set val(stop) 35
set ns [new Simulator]
set trfd [open Wireless.tr w]
set namfd [open Wireless.nam w]
$ns use-newtrace
$ns trace-all $trfd
$ns namtrace-all-wireless $namfd $opt(x) $opt(y)
set topo [new Topography]
$topo load_flatgrid $opt(x) $opt(y)
set god_ [create-god $val(nn)]

$ns node-config -adhocRouting AODV \
-llType LL \
-macType Mac/802_11 \
-ifqType Queue/DropTail/PriQueue \
-channelType Channel/WirelessChannel \
-propType Propagation/TwoRayGround \
-antType Antenna/OmniAntenna \
-ifqLen 50 \
-phyType Phy/WirelessPhy \
-topoInstance $topo \
-agentTrace ON \
-routerTrace ON \
-macTrace OFF \
-movementTrace ON

      set dist(10m) 1.92278e-06
      set dist(25m) 3.07645e-07
      set dist(50m) 7.69113e-08
      set dist(75m) 3.41828e-08
      set dist(100m) 1.42681e-08
      set dist(125m) 5.8442e-09
      Phy/WirelessPhy set CSThresh_ $dist(25m)
      Phy/WirelessPhy set RXThresh_ $dist(25m)

for {set i 0} {$i<$val(nn)} {incr i} {
	set n($i) [$ns node]
}



$ns at 0.0 "$n(0) label CentralServer"
$n(0) color "Blue"
$ns at 0.0 "$n(0) color Blue"
$n(0) set X_ 60
$n(0) set Y_ 60
$n(0) set Z_ 0.0

######################################
$ns at 0.0 "$n(1) label Node_11"
$n(1) color "Red"
$ns at 0.0 "$n(1) color Red"
$n(1) set X_ 10
$n(1) set Y_ 10
$n(1) set Z_ 0.0


$ns at 0.0 "$n(2) label Node_12"
$n(2) color "Red"
$ns at 0.0 "$n(2) color Red"
$n(2) set X_ 10
$n(2) set Y_ 30
$n(2) set Z_ 0.0

$ns at 0.0 "$n(3) label Node_13"
$n(3) color "Red"
$ns at 0.0 "$n(3) color Red"
$n(3) set X_ 10
$n(3) set Y_ 50
$n(3) set Z_ 0.0

$ns at 0.0 "$n(4) label Node_14"
$n(4) color "Red"
$ns at 0.0 "$n(4) color Red"
$n(4) set X_ 10
$n(4) set Y_ 70
$n(4) set Z_ 0.0

$ns at 0.0 "$n(5) label Node_15"
$n(5) color "Red"
$ns at 0.0 "$n(5) color Red"
$n(5) set X_ 10
$n(5) set Y_ 90
$n(5) set Z_ 0.0

$ns at 0.0 "$n(6) label Node_16"
$n(6) color "Red"
$ns at 0.0 "$n(6) color Red"
$n(6) set X_ 10
$n(6) set Y_ 110
$n(6) set Z_ 0.0

$ns at 0.0 "$n(7) label Node_21"
$n(7) color "Red"
$ns at 0.0 "$n(7) color Red"
$n(7) set X_ 30
$n(7) set Y_ 10
$n(7) set Z_ 0.0


$ns at 0.0 "$n(8) label Node_22"
$n(8) color "Red"
$ns at 0.0 "$n(8) color Red"
$n(8) set X_ 30 
$n(8) set Y_ 30
$n(8) set Z_ 0.0

$ns at 0.0 "$n(9) label Node_23"
$n(9) color "Red"
$ns at 0.0 "$n(9) color Red"
$n(9) set X_ 30
$n(9) set Y_ 50
$n(9) set Z_ 0.0

$ns at 0.0 "$n(10) label Node_24"
$n(10) color "Red"
$ns at 0.0 "$n(10) color Red"
$n(10) set X_ 30
$n(10) set Y_ 70
$n(10) set Z_ 0.0

$ns at 0.0 "$n(11) label Node_25"
$n(11) color "Red"
$ns at 0.0 "$n(11) color Red"
$n(11) set X_ 30
$n(11) set Y_ 90
$n(11) set Z_ 0.0

$ns at 0.0 "$n(12) label Node_26"
$n(12) color "Red"
$ns at 0.0 "$n(12) color Red"
$n(12) set X_ 30
$n(12) set Y_ 110
$n(12) set Z_ 0.0

$ns at 0.0 "$n(13) label Node_31"
$n(13) color "Red"
$ns at 0.0 "$n(13) color Red"
$n(13) set X_ 50
$n(13) set Y_ 10
$n(13) set Z_ 0.0


$ns at 0.0 "$n(14) label Node_32"
$n(14) color "Red"
$ns at 0.0 "$n(14) color Red"
$n(14) set X_ 50
$n(14) set Y_ 30
$n(14) set Z_ 0.0

$ns at 0.0 "$n(15) label Node_33"
$n(15) color "Red"
$ns at 0.0 "$n(15) color Red"
$n(15) set X_ 50
$n(15) set Y_ 50
$n(15) set Z_ 0.0

$ns at 0.0 "$n(16) label Node_34"
$n(16) color "Red"
$ns at 0.0 "$n(16) color Red"
$n(16) set X_ 50
$n(16) set Y_ 70
$n(16) set Z_ 0.0

$ns at 0.0 "$n(17) label Node_35"
$n(17) color "Red"
$ns at 0.0 "$n(17) color Red"
$n(17) set X_ 50
$n(17) set Y_ 90
$n(17) set Z_ 0.0

$ns at 0.0 "$n(18) label Node_36"
$n(18) color "Red"
$ns at 0.0 "$n(18) color Red"
$n(18) set X_ 50
$n(18) set Y_ 110
$n(18) set Z_ 0.0

$ns at 0.0 "$n(19) label Node_41"
$n(19) color "Red" 
$ns at 0.0 "$n(19) color Red"
$n(19) set X_ 70
$n(19) set Y_ 10
$n(19) set Z_ 0.0


$ns at 0.0 "$n(20) label Node_42"
$n(20) color "Red"
$ns at 0.0 "$n(20) color Red"
$n(20) set X_ 70 
$n(20) set Y_ 30
$n(20) set Z_ 0.0

$ns at 0.0 "$n(21) label Node_43"
$n(21) color "Red"
$ns at 0.0 "$n(21) color Red"
$n(21) set X_ 70
$n(21) set Y_ 50
$n(21) set Z_ 0.0

$ns at 0.0 "$n(22) label Node_44"
$n(22) color "Red"
$ns at 0.0 "$n(22) color Red"
$n(22) set X_ 70
$n(22) set Y_ 70
$n(22) set Z_ 0.0

$ns at 0.0 "$n(23) label Node_45"
$n(23) color "Red"
$ns at 0.0 "$n(23) color Red"
$n(23) set X_ 70
$n(23) set Y_ 90
$n(23) set Z_ 0.0

$ns at 0.0 "$n(24) label Node_46"
$n(24) color "Red"
$ns at 0.0 "$n(24) color Red"
$n(24) set X_ 70
$n(24) set Y_ 110
$n(24) set Z_ 0.0

$ns at 0.0 "$n(25) label Node_51"
$n(25) color "Red"
$ns at 0.0 "$n(25) color Red"
$n(25) set X_ 90
$n(25) set Y_ 10
$n(25) set Z_ 0.0


$ns at 0.0 "$n(26) label Node_52"
$n(26) color "Red"
$ns at 0.0 "$n(26) color Red"
$n(26) set X_ 90 
$n(26) set Y_ 30
$n(26) set Z_ 0.0

$ns at 0.0 "$n(27) label Node_53"
$n(27) color "Red"
$ns at 0.0 "$n(27) color Red"
$n(27) set X_ 90
$n(27) set Y_ 50
$n(27) set Z_ 0.0

$ns at 0.0 "$n(28) label Node_54"
$n(28) color "Red"
$ns at 0.0 "$n(28) color Red"
$n(28) set X_ 90
$n(28) set Y_ 70
$n(28) set Z_ 0.0

$ns at 0.0 "$n(29) label Node_55"
$n(29) color "Red"
$ns at 0.0 "$n(29) color Red"
$n(29) set X_ 90
$n(29) set Y_ 90
$n(29) set Z_ 0.0

$ns at 0.0 "$n(30) label Node_56"
$n(30) color "Red"
$ns at 0.0 "$n(30) color Red"
$n(30) set X_ 90
$n(30) set Y_ 110
$n(30) set Z_ 0.0

$ns at 0.0 "$n(31) label Node_61"
$n(31) color "Red"
$ns at 0.0 "$n(31) color Red"
$n(31) set X_ 110
$n(31) set Y_ 10
$n(31) set Z_ 0.0


$ns at 0.0 "$n(32) label Node_62"
$n(32) color "Red"
$ns at 0.0 "$n(32) color Red"
$n(32) set X_ 110 
$n(32) set Y_ 30
$n(32) set Z_ 0.0

$ns at 0.0 "$n(33) label Node_63"
$n(33) color "Red"
$ns at 0.0 "$n(33) color Red"
$n(33) set X_ 110
$n(33) set Y_ 50
$n(33) set Z_ 0.0

$ns at 0.0 "$n(34) label Node_64"
$n(34) color "Red"
$ns at 0.0 "$n(34) color Red"
$n(34) set X_ 110
$n(34) set Y_ 70
$n(34) set Z_ 0.0

$ns at 0.0 "$n(35) label Node_65"
$n(35) color "Red"
$ns at 0.0 "$n(35) color Red"
$n(35) set X_ 110
$n(35) set Y_ 90
$n(35) set Z_ 0.0

$ns at 0.0 "$n(36) label Node_66"
$n(36) color "Red"
$ns at 0.0 "$n(36) color Red"
$n(36) set X_ 110
$n(36) set Y_ 110
$n(36) set Z_ 0.0

for {set i 0} {$i<$val(nn)} {incr i} {
	$ns initial_node_pos $n($i) 10
}

for {set i 1} {$i < 37} {incr i} {
set udp($i) [new Agent/UDP]
ns attach-agent $n($i) $udp($i)
}

for {set i 1} {$i < 37} {incr i} {
set cbr($i) [new Application/Traffic/CBR]
$cbr($i) set packetSize_ 1024
$cbr($i) set interval_ 30
$cbr($i) attach-agent $udp($i)
}

set null0 [new Agent/Null]
$ns attach-agent $n(0) $null0

for {set i 1} {$i < 37} {incr i} {
$ns connect $udp($i) $null0
}

for {set i 1} {$i < 37} {incr i} {
$ns at $i "$cbr($i) start"
}

proc destination { } {
	global ns val n 
	set now [$ns now]
	set time 5.0
	for {set i 0} {$i<$val(nn)} {incr i} {
		set XX [expr rand()*500]
		set YY [expr rand()*500]
		$ns at [expr $now + $time] "$n($i) setdest $XX $YY 20.0"
	}
	$ns at [expr $now + $time] "destination"
}


for {set i 0} {$i<$val(nn)} {incr i} {
	$ns at $val(stop) "$n($i) reset"
}

$ns at $val(stop) "$ns nam-end-wireless $val(stop)"
$ns at $val(stop) "stop"

proc stop { } {
	global ns trfd namfd
	close $trfd
	close $namfd
	exec nam Wireless.nam &
	exit 0
}

$ns run
