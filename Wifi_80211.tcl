# ======================================================================
# Define options
# ======================================================================
set val(chan)           Channel/WirelessChannel    ;# channel type
set val(prop)           Propagation/TwoRayGround   ;# radio-propagation model
set val(netif)          Phy/WirelessPhy            ;# network interface type
set val(mac)            Mac/802_11                 ;# MAC type
set val(ifq)            Queue/DropTail/PriQueue    ;# interface queue type
set val(ll)             LL                         ;# link layer type
set val(ant)            Antenna/OmniAntenna        ;# antenna model
set val(ifqlen)         50                         ;# max packet in ifq
set val(nn)             4                          ;# number of mobilenodes
set val(rp)             DumbAgent	                 ;# routing protocol

# ======================================================================
# Main Program
# ======================================================================

#
# Initialize Global Variables
#
set ns		[new Simulator]
set tracefd     [open simple.tr w]
$ns trace-all $tracefd

# set up topography object
set topo       [new Topography]
$topo load_flatgrid 500 500

#
# Create God
#
set god [create-god $val(nn)]

#
#  Create the specified number of mobilenodes [$val(nn)] and "attach" them
#  to the channel.
#  Here four nodes are created.
#  configure node
#  "This will remain same in our code. We might need to change the rp param"
        $ns node-config  -adhocRouting $val(rp) \
			  -llType $val(ll) \
			 -macType $val(mac) \
			 -ifqType $val(ifq) \
			 -ifqLen $val(ifqlen) \
			 -antType $val(ant) \
			 -propType $val(prop) \
			 -phyType $val(netif) \
			 -channelType $val(chan) \
			 -topoInstance $topo \
			 -agentTrace ON \
			 -macTrace ON \
			 -routerTrace OFF \
			 -movementTrace OFF

	for {set i 0} {$i < $val(nn) } {incr i} {
		set node_($i) [$ns node]
	}

#
# Provide initial (X,Y, for now Z=0) co-ordinates for mobilenodes
#
$node_(0) set X_ 5.0
$node_(0) set Y_ 2.0
$node_(0) set Z_ 0.0

$node_(1) set X_ 90.0
$node_(1) set Y_ 85.0
$node_(1) set Z_ 0.0

$node_(2) set X_ 100.0
$node_(2) set Y_ 50.0
$node_(2) set Z_ 0.0

$node_(3) set X_ 45.0
$node_(3) set Y_ 80.0
$node_(3) set Z_ 0.0

#This is important. Based on this and AODV/other_rp, can we implement what we want?
$god set-dist 0 1 1
$god set-dist 0 2 1
$god set-dist 1 2 1
$god set-dist 1 3 1
$god set-dist 2 3 1



#traffic details
set udp0 [new Agent/UDP]
$ns attach-agent $node_(0) $udp0

set udp1 [new Agent/UDP]
$ns attach-agent $node_(1) $udp1

set udp2 [new Agent/UDP]
$ns attach-agent $node_(2) $udp2


set cbr0 [new Application/Traffic/CBR]
$cbr0 set packetSize_ 512
$cbr0 set interval_ 0.1
$cbr0 attach-agent $udp0

set cbr1 [new Application/Traffic/CBR]
$cbr1 set packetSize_ 512
$cbr1 set interval_ 0.1
$cbr1 attach-agent $udp1

set cbr2 [new Application/Traffic/CBR]
$cbr2 set packetSize_ 512
$cbr2 set interval_ 0.1
$cbr2 attach-agent $udp2

set null0 [new Agent/Null]
$ns attach-agent $node_(3) $null0

$ns connect $udp0 $null0
$ns connect $udp1 $null0
$ns connect $udp2 $null0

$ns at 0.5 "$cbr0 start"
$ns at 9.5 "$cbr0 stop"

$ns at 0.5 "$cbr1 start"
$ns at 9.5 "$cbr1 stop"

$ns at 0.5 "$cbr2 start"
$ns at 9.5 "$cbr2 stop"

#
# Tell nodes when the simulation ends
#"When we reset, does the node's cbr time starts again from zero, so will node again
# transmit?"
for {set i 0} {$i < $val(nn) } {incr i} {
    $ns at 10.0 "$node_($i) reset";
}
$ns at 10.0 "stop"
$ns at 10.01 "puts \"NS EXITING...\" ; $ns halt"
proc stop {} {
    global ns tracefd
    $ns flush-trace
    close $tracefd
}

puts "Starting Simulation..."
$ns run
