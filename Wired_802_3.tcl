#Create a simulator object
set ns [new Simulator]

#Tell the simulator to use dynamic routing


#Open the nam trace file
set nf [open out.nam w]
$ns namtrace-all $nf

#Open text trace file
set tracefd [open simple.tr w]
$ns trace-all $tracefd


#Define a 'finish' procedure
proc finish {} {
        global ns nf tracefd
        $ns flush-trace
	#Close the trace file
        close $nf
	close $tracefd
	#Execute nam on the trace file
        exec nam out.nam &
        exit 0
}

#Create four nodes
set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]




#Create links between the nodes
$ns duplex-link $n0 $n1 1Mb 10ms DropTail
$ns cost $n0 $n1 2
$ns cost $n1 $n0 2
$ns duplex-link $n0 $n2 1Mb 10ms DropTail
$ns cost $n0 $n2 7
$ns cost $n2 $n0 7
$ns duplex-link $n1 $n2 1Mb 10ms DropTail
$ns cost $n1 $n2 1
$ns cost $n2 $n1 1



#Create a UDP agent and attach it to node n(0)
set udp0 [new Agent/UDP]
$ns attach-agent $n0 $udp0

# Create a CBR traffic source and attach it to udp0
set cbr0 [new Application/Traffic/CBR]
$cbr0 set packetSize_ 500
$cbr0 set interval_ 0.005
$cbr0 attach-agent $udp0

#Create a Null agent (a traffic sink) and attach it to node n(3)
set null0 [new Agent/Null]
$ns attach-agent $n2 $null0

#Connect the traffic source with the traffic sink
$ns connect $udp0 $null0

$ns rtproto Session

#Schedule events for the CBR agent and the network dynamics
$ns at 0.5 "$cbr0 start"
$ns rtmodel-at 1.0 down $n0 $n1
$ns rtmodel-at 2.0 up $n0 $n1
$ns at 4.5 "$cbr0 stop"
#Call the finish procedure after 5 seconds of simulation time
$ns at 5.0 "finish"

#Run the simulation
$ns run
