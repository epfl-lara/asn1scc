; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10968 () Bool)

(assert start!10968)

(declare-fun b!54541 () Bool)

(declare-fun e!36392 () Bool)

(declare-fun e!36390 () Bool)

(assert (=> b!54541 (= e!36392 (not e!36390))))

(declare-fun res!45500 () Bool)

(assert (=> b!54541 (=> res!45500 e!36390)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!54541 (= res!45500 (bvsge i!635 to!314))))

(declare-datatypes ((array!2557 0))(
  ( (array!2558 (arr!1706 (Array (_ BitVec 32) (_ BitVec 8))) (size!1166 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2020 0))(
  ( (BitStream!2021 (buf!1523 array!2557) (currentByte!3099 (_ BitVec 32)) (currentBit!3094 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2020)

(declare-fun isPrefixOf!0 (BitStream!2020 BitStream!2020) Bool)

(assert (=> b!54541 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!3763 0))(
  ( (Unit!3764) )
))
(declare-fun lt!84627 () Unit!3763)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2020) Unit!3763)

(assert (=> b!54541 (= lt!84627 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!84634 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!54541 (= lt!84634 (bitIndex!0 (size!1166 (buf!1523 thiss!1379)) (currentByte!3099 thiss!1379) (currentBit!3094 thiss!1379)))))

(declare-fun srcBuffer!2 () array!2557)

(declare-datatypes ((tuple2!4970 0))(
  ( (tuple2!4971 (_1!2596 Unit!3763) (_2!2596 BitStream!2020)) )
))
(declare-fun lt!84632 () tuple2!4970)

(declare-fun e!36395 () Bool)

(declare-datatypes ((tuple2!4972 0))(
  ( (tuple2!4973 (_1!2597 BitStream!2020) (_2!2597 BitStream!2020)) )
))
(declare-fun lt!84630 () tuple2!4972)

(declare-fun b!54543 () Bool)

(declare-datatypes ((List!585 0))(
  ( (Nil!582) (Cons!581 (h!700 Bool) (t!1335 List!585)) )
))
(declare-fun head!404 (List!585) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2020 array!2557 (_ BitVec 64) (_ BitVec 64)) List!585)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2020 BitStream!2020 (_ BitVec 64)) List!585)

(assert (=> b!54543 (= e!36395 (= (head!404 (byteArrayBitContentToList!0 (_2!2596 lt!84632) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!404 (bitStreamReadBitsIntoList!0 (_2!2596 lt!84632) (_1!2597 lt!84630) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!54544 () Bool)

(declare-fun res!45502 () Bool)

(assert (=> b!54544 (=> (not res!45502) (not e!36392))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!54544 (= res!45502 (validate_offset_bits!1 ((_ sign_extend 32) (size!1166 (buf!1523 thiss!1379))) ((_ sign_extend 32) (currentByte!3099 thiss!1379)) ((_ sign_extend 32) (currentBit!3094 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!54545 () Bool)

(declare-fun e!36391 () Bool)

(declare-fun array_inv!1069 (array!2557) Bool)

(assert (=> b!54545 (= e!36391 (array_inv!1069 (buf!1523 thiss!1379)))))

(declare-fun b!54546 () Bool)

(declare-fun e!36393 () Bool)

(assert (=> b!54546 (= e!36390 e!36393)))

(declare-fun res!45501 () Bool)

(assert (=> b!54546 (=> res!45501 e!36393)))

(assert (=> b!54546 (= res!45501 (not (isPrefixOf!0 thiss!1379 (_2!2596 lt!84632))))))

(assert (=> b!54546 (validate_offset_bits!1 ((_ sign_extend 32) (size!1166 (buf!1523 (_2!2596 lt!84632)))) ((_ sign_extend 32) (currentByte!3099 (_2!2596 lt!84632))) ((_ sign_extend 32) (currentBit!3094 (_2!2596 lt!84632))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!84633 () Unit!3763)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2020 BitStream!2020 (_ BitVec 64) (_ BitVec 64)) Unit!3763)

(assert (=> b!54546 (= lt!84633 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2596 lt!84632) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2020 (_ BitVec 8) (_ BitVec 32)) tuple2!4970)

(assert (=> b!54546 (= lt!84632 (appendBitFromByte!0 thiss!1379 (select (arr!1706 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!84626 () (_ BitVec 64))

(declare-fun e!36388 () Bool)

(declare-fun b!54547 () Bool)

(assert (=> b!54547 (= e!36388 (or (not (= lt!84626 (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!84626 (bvand (bvadd lt!84634 to!314) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!54547 (= lt!84626 (bvand lt!84634 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!45504 () Bool)

(assert (=> start!10968 (=> (not res!45504) (not e!36392))))

(assert (=> start!10968 (= res!45504 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1166 srcBuffer!2))))))))

(assert (=> start!10968 e!36392))

(assert (=> start!10968 true))

(assert (=> start!10968 (array_inv!1069 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2020) Bool)

(assert (=> start!10968 (and (inv!12 thiss!1379) e!36391)))

(declare-fun b!54542 () Bool)

(assert (=> b!54542 (= e!36393 e!36388)))

(declare-fun res!45503 () Bool)

(assert (=> b!54542 (=> res!45503 e!36388)))

(declare-fun lt!84628 () tuple2!4970)

(assert (=> b!54542 (= res!45503 (not (isPrefixOf!0 (_2!2596 lt!84632) (_2!2596 lt!84628))))))

(assert (=> b!54542 (isPrefixOf!0 thiss!1379 (_2!2596 lt!84628))))

(declare-fun lt!84631 () Unit!3763)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2020 BitStream!2020 BitStream!2020) Unit!3763)

(assert (=> b!54542 (= lt!84631 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2596 lt!84632) (_2!2596 lt!84628)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2020 array!2557 (_ BitVec 64) (_ BitVec 64)) tuple2!4970)

(assert (=> b!54542 (= lt!84628 (appendBitsMSBFirstLoop!0 (_2!2596 lt!84632) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!54542 e!36395))

(declare-fun res!45499 () Bool)

(assert (=> b!54542 (=> (not res!45499) (not e!36395))))

(assert (=> b!54542 (= res!45499 (validate_offset_bits!1 ((_ sign_extend 32) (size!1166 (buf!1523 (_2!2596 lt!84632)))) ((_ sign_extend 32) (currentByte!3099 thiss!1379)) ((_ sign_extend 32) (currentBit!3094 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!84629 () Unit!3763)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2020 array!2557 (_ BitVec 64)) Unit!3763)

(assert (=> b!54542 (= lt!84629 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1523 (_2!2596 lt!84632)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!2020 BitStream!2020) tuple2!4972)

(assert (=> b!54542 (= lt!84630 (reader!0 thiss!1379 (_2!2596 lt!84632)))))

(assert (= (and start!10968 res!45504) b!54544))

(assert (= (and b!54544 res!45502) b!54541))

(assert (= (and b!54541 (not res!45500)) b!54546))

(assert (= (and b!54546 (not res!45501)) b!54542))

(assert (= (and b!54542 res!45499) b!54543))

(assert (= (and b!54542 (not res!45503)) b!54547))

(assert (= start!10968 b!54545))

(declare-fun m!85789 () Bool)

(assert (=> b!54545 m!85789))

(declare-fun m!85791 () Bool)

(assert (=> b!54543 m!85791))

(assert (=> b!54543 m!85791))

(declare-fun m!85793 () Bool)

(assert (=> b!54543 m!85793))

(declare-fun m!85795 () Bool)

(assert (=> b!54543 m!85795))

(assert (=> b!54543 m!85795))

(declare-fun m!85797 () Bool)

(assert (=> b!54543 m!85797))

(declare-fun m!85799 () Bool)

(assert (=> b!54541 m!85799))

(declare-fun m!85801 () Bool)

(assert (=> b!54541 m!85801))

(declare-fun m!85803 () Bool)

(assert (=> b!54541 m!85803))

(declare-fun m!85805 () Bool)

(assert (=> start!10968 m!85805))

(declare-fun m!85807 () Bool)

(assert (=> start!10968 m!85807))

(declare-fun m!85809 () Bool)

(assert (=> b!54544 m!85809))

(declare-fun m!85811 () Bool)

(assert (=> b!54542 m!85811))

(declare-fun m!85813 () Bool)

(assert (=> b!54542 m!85813))

(declare-fun m!85815 () Bool)

(assert (=> b!54542 m!85815))

(declare-fun m!85817 () Bool)

(assert (=> b!54542 m!85817))

(declare-fun m!85819 () Bool)

(assert (=> b!54542 m!85819))

(declare-fun m!85821 () Bool)

(assert (=> b!54542 m!85821))

(declare-fun m!85823 () Bool)

(assert (=> b!54542 m!85823))

(declare-fun m!85825 () Bool)

(assert (=> b!54546 m!85825))

(declare-fun m!85827 () Bool)

(assert (=> b!54546 m!85827))

(declare-fun m!85829 () Bool)

(assert (=> b!54546 m!85829))

(assert (=> b!54546 m!85825))

(declare-fun m!85831 () Bool)

(assert (=> b!54546 m!85831))

(declare-fun m!85833 () Bool)

(assert (=> b!54546 m!85833))

(push 1)

(assert (not b!54546))

(assert (not b!54543))

(assert (not b!54545))

(assert (not start!10968))

(assert (not b!54544))

(assert (not b!54542))

(assert (not b!54541))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!17388 () Bool)

(assert (=> d!17388 (= (array_inv!1069 (buf!1523 thiss!1379)) (bvsge (size!1166 (buf!1523 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!54545 d!17388))

(declare-fun d!17390 () Bool)

(declare-fun res!45559 () Bool)

(declare-fun e!36457 () Bool)

(assert (=> d!17390 (=> (not res!45559) (not e!36457))))

(assert (=> d!17390 (= res!45559 (= (size!1166 (buf!1523 thiss!1379)) (size!1166 (buf!1523 thiss!1379))))))

(assert (=> d!17390 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!36457)))

(declare-fun b!54608 () Bool)

(declare-fun res!45560 () Bool)

(assert (=> b!54608 (=> (not res!45560) (not e!36457))))

(assert (=> b!54608 (= res!45560 (bvsle (bitIndex!0 (size!1166 (buf!1523 thiss!1379)) (currentByte!3099 thiss!1379) (currentBit!3094 thiss!1379)) (bitIndex!0 (size!1166 (buf!1523 thiss!1379)) (currentByte!3099 thiss!1379) (currentBit!3094 thiss!1379))))))

(declare-fun b!54609 () Bool)

(declare-fun e!36458 () Bool)

(assert (=> b!54609 (= e!36457 e!36458)))

(declare-fun res!45561 () Bool)

(assert (=> b!54609 (=> res!45561 e!36458)))

(assert (=> b!54609 (= res!45561 (= (size!1166 (buf!1523 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!54610 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2557 array!2557 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!54610 (= e!36458 (arrayBitRangesEq!0 (buf!1523 thiss!1379) (buf!1523 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1166 (buf!1523 thiss!1379)) (currentByte!3099 thiss!1379) (currentBit!3094 thiss!1379))))))

(assert (= (and d!17390 res!45559) b!54608))

(assert (= (and b!54608 res!45560) b!54609))

(assert (= (and b!54609 (not res!45561)) b!54610))

(assert (=> b!54608 m!85803))

(assert (=> b!54608 m!85803))

(assert (=> b!54610 m!85803))

(assert (=> b!54610 m!85803))

(declare-fun m!85935 () Bool)

(assert (=> b!54610 m!85935))

(assert (=> b!54541 d!17390))

(declare-fun d!17392 () Bool)

(assert (=> d!17392 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!84694 () Unit!3763)

(declare-fun choose!11 (BitStream!2020) Unit!3763)

(assert (=> d!17392 (= lt!84694 (choose!11 thiss!1379))))

(assert (=> d!17392 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!84694)))

(declare-fun bs!4385 () Bool)

(assert (= bs!4385 d!17392))

(assert (=> bs!4385 m!85799))

(declare-fun m!85937 () Bool)

(assert (=> bs!4385 m!85937))

(assert (=> b!54541 d!17392))

(declare-fun d!17394 () Bool)

(declare-fun e!36461 () Bool)

(assert (=> d!17394 e!36461))

(declare-fun res!45566 () Bool)

(assert (=> d!17394 (=> (not res!45566) (not e!36461))))

(declare-fun lt!84712 () (_ BitVec 64))

(declare-fun lt!84711 () (_ BitVec 64))

(declare-fun lt!84709 () (_ BitVec 64))

(assert (=> d!17394 (= res!45566 (= lt!84712 (bvsub lt!84711 lt!84709)))))

(assert (=> d!17394 (or (= (bvand lt!84711 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!84709 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!84711 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!84711 lt!84709) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!17394 (= lt!84709 (remainingBits!0 ((_ sign_extend 32) (size!1166 (buf!1523 thiss!1379))) ((_ sign_extend 32) (currentByte!3099 thiss!1379)) ((_ sign_extend 32) (currentBit!3094 thiss!1379))))))

(declare-fun lt!84710 () (_ BitVec 64))

(declare-fun lt!84707 () (_ BitVec 64))

(assert (=> d!17394 (= lt!84711 (bvmul lt!84710 lt!84707))))

(assert (=> d!17394 (or (= lt!84710 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!84707 (bvsdiv (bvmul lt!84710 lt!84707) lt!84710)))))

(assert (=> d!17394 (= lt!84707 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!17394 (= lt!84710 ((_ sign_extend 32) (size!1166 (buf!1523 thiss!1379))))))

(assert (=> d!17394 (= lt!84712 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3099 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3094 thiss!1379))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!17394 (invariant!0 (currentBit!3094 thiss!1379) (currentByte!3099 thiss!1379) (size!1166 (buf!1523 thiss!1379)))))

(assert (=> d!17394 (= (bitIndex!0 (size!1166 (buf!1523 thiss!1379)) (currentByte!3099 thiss!1379) (currentBit!3094 thiss!1379)) lt!84712)))

(declare-fun b!54615 () Bool)

(declare-fun res!45567 () Bool)

(assert (=> b!54615 (=> (not res!45567) (not e!36461))))

(assert (=> b!54615 (= res!45567 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!84712))))

(declare-fun b!54616 () Bool)

(declare-fun lt!84708 () (_ BitVec 64))

(assert (=> b!54616 (= e!36461 (bvsle lt!84712 (bvmul lt!84708 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!54616 (or (= lt!84708 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!84708 #b0000000000000000000000000000000000000000000000000000000000001000) lt!84708)))))

(assert (=> b!54616 (= lt!84708 ((_ sign_extend 32) (size!1166 (buf!1523 thiss!1379))))))

(assert (= (and d!17394 res!45566) b!54615))

(assert (= (and b!54615 res!45567) b!54616))

(declare-fun m!85939 () Bool)

(assert (=> d!17394 m!85939))

(declare-fun m!85941 () Bool)

(assert (=> d!17394 m!85941))

(assert (=> b!54541 d!17394))

(declare-fun d!17396 () Bool)

(declare-fun res!45568 () Bool)

(declare-fun e!36462 () Bool)

(assert (=> d!17396 (=> (not res!45568) (not e!36462))))

(assert (=> d!17396 (= res!45568 (= (size!1166 (buf!1523 thiss!1379)) (size!1166 (buf!1523 (_2!2596 lt!84632)))))))

(assert (=> d!17396 (= (isPrefixOf!0 thiss!1379 (_2!2596 lt!84632)) e!36462)))

(declare-fun b!54617 () Bool)

(declare-fun res!45569 () Bool)

(assert (=> b!54617 (=> (not res!45569) (not e!36462))))

(assert (=> b!54617 (= res!45569 (bvsle (bitIndex!0 (size!1166 (buf!1523 thiss!1379)) (currentByte!3099 thiss!1379) (currentBit!3094 thiss!1379)) (bitIndex!0 (size!1166 (buf!1523 (_2!2596 lt!84632))) (currentByte!3099 (_2!2596 lt!84632)) (currentBit!3094 (_2!2596 lt!84632)))))))

(declare-fun b!54618 () Bool)

(declare-fun e!36463 () Bool)

(assert (=> b!54618 (= e!36462 e!36463)))

(declare-fun res!45570 () Bool)

(assert (=> b!54618 (=> res!45570 e!36463)))

(assert (=> b!54618 (= res!45570 (= (size!1166 (buf!1523 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!54619 () Bool)

(assert (=> b!54619 (= e!36463 (arrayBitRangesEq!0 (buf!1523 thiss!1379) (buf!1523 (_2!2596 lt!84632)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1166 (buf!1523 thiss!1379)) (currentByte!3099 thiss!1379) (currentBit!3094 thiss!1379))))))

(assert (= (and d!17396 res!45568) b!54617))

(assert (= (and b!54617 res!45569) b!54618))

(assert (= (and b!54618 (not res!45570)) b!54619))

(assert (=> b!54617 m!85803))

(declare-fun m!85943 () Bool)

(assert (=> b!54617 m!85943))

(assert (=> b!54619 m!85803))

(assert (=> b!54619 m!85803))

(declare-fun m!85945 () Bool)

(assert (=> b!54619 m!85945))

(assert (=> b!54546 d!17396))

(declare-fun d!17398 () Bool)

(assert (=> d!17398 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1166 (buf!1523 (_2!2596 lt!84632)))) ((_ sign_extend 32) (currentByte!3099 (_2!2596 lt!84632))) ((_ sign_extend 32) (currentBit!3094 (_2!2596 lt!84632))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1166 (buf!1523 (_2!2596 lt!84632)))) ((_ sign_extend 32) (currentByte!3099 (_2!2596 lt!84632))) ((_ sign_extend 32) (currentBit!3094 (_2!2596 lt!84632)))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!4386 () Bool)

(assert (= bs!4386 d!17398))

(declare-fun m!85947 () Bool)

(assert (=> bs!4386 m!85947))

(assert (=> b!54546 d!17398))

(declare-fun d!17404 () Bool)

(declare-fun e!36466 () Bool)

(assert (=> d!17404 e!36466))

(declare-fun res!45573 () Bool)

(assert (=> d!17404 (=> (not res!45573) (not e!36466))))

(assert (=> d!17404 (= res!45573 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!84715 () Unit!3763)

(declare-fun choose!27 (BitStream!2020 BitStream!2020 (_ BitVec 64) (_ BitVec 64)) Unit!3763)

(assert (=> d!17404 (= lt!84715 (choose!27 thiss!1379 (_2!2596 lt!84632) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!17404 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!17404 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2596 lt!84632) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!84715)))

(declare-fun b!54622 () Bool)

(assert (=> b!54622 (= e!36466 (validate_offset_bits!1 ((_ sign_extend 32) (size!1166 (buf!1523 (_2!2596 lt!84632)))) ((_ sign_extend 32) (currentByte!3099 (_2!2596 lt!84632))) ((_ sign_extend 32) (currentBit!3094 (_2!2596 lt!84632))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!17404 res!45573) b!54622))

(declare-fun m!85951 () Bool)

(assert (=> d!17404 m!85951))

(assert (=> b!54622 m!85833))

(assert (=> b!54546 d!17404))

(declare-fun b!54695 () Bool)

(declare-fun e!36507 () Bool)

(declare-fun e!36505 () Bool)

(assert (=> b!54695 (= e!36507 e!36505)))

(declare-fun res!45627 () Bool)

(assert (=> b!54695 (=> (not res!45627) (not e!36505))))

(declare-datatypes ((tuple2!4986 0))(
  ( (tuple2!4987 (_1!2604 BitStream!2020) (_2!2604 Bool)) )
))
(declare-fun lt!84797 () tuple2!4986)

(declare-fun lt!84799 () tuple2!4970)

(declare-fun lt!84788 () Bool)

(assert (=> b!54695 (= res!45627 (and (= (_2!2604 lt!84797) lt!84788) (= (_1!2604 lt!84797) (_2!2596 lt!84799))))))

(declare-fun readBitPure!0 (BitStream!2020) tuple2!4986)

(declare-fun readerFrom!0 (BitStream!2020 (_ BitVec 32) (_ BitVec 32)) BitStream!2020)

(assert (=> b!54695 (= lt!84797 (readBitPure!0 (readerFrom!0 (_2!2596 lt!84799) (currentBit!3094 thiss!1379) (currentByte!3099 thiss!1379))))))

(declare-fun b!54696 () Bool)

(declare-fun res!45631 () Bool)

(assert (=> b!54696 (=> (not res!45631) (not e!36507))))

(assert (=> b!54696 (= res!45631 (isPrefixOf!0 thiss!1379 (_2!2596 lt!84799)))))

(declare-fun b!54697 () Bool)

(declare-fun res!45626 () Bool)

(declare-fun e!36506 () Bool)

(assert (=> b!54697 (=> (not res!45626) (not e!36506))))

(declare-fun lt!84795 () tuple2!4970)

(assert (=> b!54697 (= res!45626 (isPrefixOf!0 thiss!1379 (_2!2596 lt!84795)))))

(declare-fun b!54698 () Bool)

(declare-fun e!36508 () Bool)

(declare-fun lt!84790 () tuple2!4986)

(assert (=> b!54698 (= e!36508 (= (bitIndex!0 (size!1166 (buf!1523 (_1!2604 lt!84790))) (currentByte!3099 (_1!2604 lt!84790)) (currentBit!3094 (_1!2604 lt!84790))) (bitIndex!0 (size!1166 (buf!1523 (_2!2596 lt!84795))) (currentByte!3099 (_2!2596 lt!84795)) (currentBit!3094 (_2!2596 lt!84795)))))))

(declare-fun b!54699 () Bool)

(assert (=> b!54699 (= e!36505 (= (bitIndex!0 (size!1166 (buf!1523 (_1!2604 lt!84797))) (currentByte!3099 (_1!2604 lt!84797)) (currentBit!3094 (_1!2604 lt!84797))) (bitIndex!0 (size!1166 (buf!1523 (_2!2596 lt!84799))) (currentByte!3099 (_2!2596 lt!84799)) (currentBit!3094 (_2!2596 lt!84799)))))))

(declare-fun d!17410 () Bool)

(assert (=> d!17410 e!36506))

(declare-fun res!45633 () Bool)

(assert (=> d!17410 (=> (not res!45633) (not e!36506))))

(assert (=> d!17410 (= res!45633 (= (size!1166 (buf!1523 (_2!2596 lt!84795))) (size!1166 (buf!1523 thiss!1379))))))

(declare-fun lt!84789 () (_ BitVec 8))

(declare-fun lt!84792 () array!2557)

(assert (=> d!17410 (= lt!84789 (select (arr!1706 lt!84792) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!17410 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1166 lt!84792)))))

(assert (=> d!17410 (= lt!84792 (array!2558 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!84796 () tuple2!4970)

(assert (=> d!17410 (= lt!84795 (tuple2!4971 (_1!2596 lt!84796) (_2!2596 lt!84796)))))

(assert (=> d!17410 (= lt!84796 lt!84799)))

(assert (=> d!17410 e!36507))

(declare-fun res!45632 () Bool)

(assert (=> d!17410 (=> (not res!45632) (not e!36507))))

(assert (=> d!17410 (= res!45632 (= (size!1166 (buf!1523 thiss!1379)) (size!1166 (buf!1523 (_2!2596 lt!84799)))))))

(declare-fun appendBit!0 (BitStream!2020 Bool) tuple2!4970)

(assert (=> d!17410 (= lt!84799 (appendBit!0 thiss!1379 lt!84788))))

(assert (=> d!17410 (= lt!84788 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1706 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!17410 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!17410 (= (appendBitFromByte!0 thiss!1379 (select (arr!1706 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!84795)))

(declare-fun b!54700 () Bool)

(assert (=> b!54700 (= e!36506 e!36508)))

(declare-fun res!45628 () Bool)

(assert (=> b!54700 (=> (not res!45628) (not e!36508))))

(assert (=> b!54700 (= res!45628 (and (= (_2!2604 lt!84790) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1706 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!84789)) #b00000000000000000000000000000000))) (= (_1!2604 lt!84790) (_2!2596 lt!84795))))))

(declare-datatypes ((tuple2!4992 0))(
  ( (tuple2!4993 (_1!2607 array!2557) (_2!2607 BitStream!2020)) )
))
(declare-fun lt!84791 () tuple2!4992)

(declare-fun lt!84798 () BitStream!2020)

(declare-fun readBits!0 (BitStream!2020 (_ BitVec 64)) tuple2!4992)

(assert (=> b!54700 (= lt!84791 (readBits!0 lt!84798 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!54700 (= lt!84790 (readBitPure!0 lt!84798))))

(assert (=> b!54700 (= lt!84798 (readerFrom!0 (_2!2596 lt!84795) (currentBit!3094 thiss!1379) (currentByte!3099 thiss!1379)))))

(declare-fun b!54701 () Bool)

(declare-fun res!45629 () Bool)

(assert (=> b!54701 (=> (not res!45629) (not e!36506))))

(declare-fun lt!84793 () (_ BitVec 64))

(declare-fun lt!84794 () (_ BitVec 64))

(assert (=> b!54701 (= res!45629 (= (bitIndex!0 (size!1166 (buf!1523 (_2!2596 lt!84795))) (currentByte!3099 (_2!2596 lt!84795)) (currentBit!3094 (_2!2596 lt!84795))) (bvadd lt!84793 lt!84794)))))

(assert (=> b!54701 (or (not (= (bvand lt!84793 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!84794 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!84793 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!84793 lt!84794) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!54701 (= lt!84794 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!54701 (= lt!84793 (bitIndex!0 (size!1166 (buf!1523 thiss!1379)) (currentByte!3099 thiss!1379) (currentBit!3094 thiss!1379)))))

(declare-fun b!54702 () Bool)

(declare-fun res!45630 () Bool)

(assert (=> b!54702 (=> (not res!45630) (not e!36507))))

(assert (=> b!54702 (= res!45630 (= (bitIndex!0 (size!1166 (buf!1523 (_2!2596 lt!84799))) (currentByte!3099 (_2!2596 lt!84799)) (currentBit!3094 (_2!2596 lt!84799))) (bvadd (bitIndex!0 (size!1166 (buf!1523 thiss!1379)) (currentByte!3099 thiss!1379) (currentBit!3094 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!17410 res!45632) b!54702))

(assert (= (and b!54702 res!45630) b!54696))

(assert (= (and b!54696 res!45631) b!54695))

(assert (= (and b!54695 res!45627) b!54699))

(assert (= (and d!17410 res!45633) b!54701))

(assert (= (and b!54701 res!45629) b!54697))

(assert (= (and b!54697 res!45626) b!54700))

(assert (= (and b!54700 res!45628) b!54698))

(declare-fun m!86003 () Bool)

(assert (=> b!54697 m!86003))

(declare-fun m!86005 () Bool)

(assert (=> b!54695 m!86005))

(assert (=> b!54695 m!86005))

(declare-fun m!86007 () Bool)

(assert (=> b!54695 m!86007))

(declare-fun m!86009 () Bool)

(assert (=> b!54702 m!86009))

(assert (=> b!54702 m!85803))

(declare-fun m!86011 () Bool)

(assert (=> b!54700 m!86011))

(declare-fun m!86013 () Bool)

(assert (=> b!54700 m!86013))

(declare-fun m!86015 () Bool)

(assert (=> b!54700 m!86015))

(declare-fun m!86017 () Bool)

(assert (=> b!54701 m!86017))

(assert (=> b!54701 m!85803))

(declare-fun m!86019 () Bool)

(assert (=> d!17410 m!86019))

(declare-fun m!86021 () Bool)

(assert (=> d!17410 m!86021))

(declare-fun m!86023 () Bool)

(assert (=> d!17410 m!86023))

(declare-fun m!86025 () Bool)

(assert (=> b!54699 m!86025))

(assert (=> b!54699 m!86009))

(declare-fun m!86027 () Bool)

(assert (=> b!54696 m!86027))

(declare-fun m!86029 () Bool)

(assert (=> b!54698 m!86029))

(assert (=> b!54698 m!86017))

(assert (=> b!54546 d!17410))

(declare-fun d!17432 () Bool)

(assert (=> d!17432 (= (array_inv!1069 srcBuffer!2) (bvsge (size!1166 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!10968 d!17432))

(declare-fun d!17434 () Bool)

(assert (=> d!17434 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3094 thiss!1379) (currentByte!3099 thiss!1379) (size!1166 (buf!1523 thiss!1379))))))

(declare-fun bs!4390 () Bool)

(assert (= bs!4390 d!17434))

(assert (=> bs!4390 m!85941))

(assert (=> start!10968 d!17434))

(declare-fun d!17436 () Bool)

(assert (=> d!17436 (isPrefixOf!0 thiss!1379 (_2!2596 lt!84628))))

(declare-fun lt!84802 () Unit!3763)

(declare-fun choose!30 (BitStream!2020 BitStream!2020 BitStream!2020) Unit!3763)

(assert (=> d!17436 (= lt!84802 (choose!30 thiss!1379 (_2!2596 lt!84632) (_2!2596 lt!84628)))))

(assert (=> d!17436 (isPrefixOf!0 thiss!1379 (_2!2596 lt!84632))))

(assert (=> d!17436 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2596 lt!84632) (_2!2596 lt!84628)) lt!84802)))

(declare-fun bs!4391 () Bool)

(assert (= bs!4391 d!17436))

(assert (=> bs!4391 m!85823))

(declare-fun m!86031 () Bool)

(assert (=> bs!4391 m!86031))

(assert (=> bs!4391 m!85827))

(assert (=> b!54542 d!17436))

(declare-fun d!17438 () Bool)

(declare-fun res!45634 () Bool)

(declare-fun e!36509 () Bool)

(assert (=> d!17438 (=> (not res!45634) (not e!36509))))

(assert (=> d!17438 (= res!45634 (= (size!1166 (buf!1523 thiss!1379)) (size!1166 (buf!1523 (_2!2596 lt!84628)))))))

(assert (=> d!17438 (= (isPrefixOf!0 thiss!1379 (_2!2596 lt!84628)) e!36509)))

(declare-fun b!54703 () Bool)

(declare-fun res!45635 () Bool)

(assert (=> b!54703 (=> (not res!45635) (not e!36509))))

(assert (=> b!54703 (= res!45635 (bvsle (bitIndex!0 (size!1166 (buf!1523 thiss!1379)) (currentByte!3099 thiss!1379) (currentBit!3094 thiss!1379)) (bitIndex!0 (size!1166 (buf!1523 (_2!2596 lt!84628))) (currentByte!3099 (_2!2596 lt!84628)) (currentBit!3094 (_2!2596 lt!84628)))))))

(declare-fun b!54704 () Bool)

(declare-fun e!36510 () Bool)

(assert (=> b!54704 (= e!36509 e!36510)))

(declare-fun res!45636 () Bool)

(assert (=> b!54704 (=> res!45636 e!36510)))

(assert (=> b!54704 (= res!45636 (= (size!1166 (buf!1523 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!54705 () Bool)

(assert (=> b!54705 (= e!36510 (arrayBitRangesEq!0 (buf!1523 thiss!1379) (buf!1523 (_2!2596 lt!84628)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1166 (buf!1523 thiss!1379)) (currentByte!3099 thiss!1379) (currentBit!3094 thiss!1379))))))

(assert (= (and d!17438 res!45634) b!54703))

(assert (= (and b!54703 res!45635) b!54704))

(assert (= (and b!54704 (not res!45636)) b!54705))

(assert (=> b!54703 m!85803))

(declare-fun m!86033 () Bool)

(assert (=> b!54703 m!86033))

(assert (=> b!54705 m!85803))

(assert (=> b!54705 m!85803))

(declare-fun m!86035 () Bool)

(assert (=> b!54705 m!86035))

(assert (=> b!54542 d!17438))

(declare-fun d!17440 () Bool)

(assert (=> d!17440 (validate_offset_bits!1 ((_ sign_extend 32) (size!1166 (buf!1523 (_2!2596 lt!84632)))) ((_ sign_extend 32) (currentByte!3099 thiss!1379)) ((_ sign_extend 32) (currentBit!3094 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!84805 () Unit!3763)

(declare-fun choose!9 (BitStream!2020 array!2557 (_ BitVec 64) BitStream!2020) Unit!3763)

(assert (=> d!17440 (= lt!84805 (choose!9 thiss!1379 (buf!1523 (_2!2596 lt!84632)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!2021 (buf!1523 (_2!2596 lt!84632)) (currentByte!3099 thiss!1379) (currentBit!3094 thiss!1379))))))

(assert (=> d!17440 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1523 (_2!2596 lt!84632)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!84805)))

(declare-fun bs!4392 () Bool)

(assert (= bs!4392 d!17440))

(assert (=> bs!4392 m!85821))

(declare-fun m!86037 () Bool)

(assert (=> bs!4392 m!86037))

(assert (=> b!54542 d!17440))

(declare-fun b!54801 () Bool)

(declare-fun res!45716 () Bool)

(declare-fun e!36555 () Bool)

(assert (=> b!54801 (=> (not res!45716) (not e!36555))))

(declare-fun lt!85185 () tuple2!4970)

(assert (=> b!54801 (= res!45716 (isPrefixOf!0 (_2!2596 lt!84632) (_2!2596 lt!85185)))))

(declare-fun b!54802 () Bool)

(declare-fun res!45720 () Bool)

(assert (=> b!54802 (=> (not res!45720) (not e!36555))))

(assert (=> b!54802 (= res!45720 (invariant!0 (currentBit!3094 (_2!2596 lt!85185)) (currentByte!3099 (_2!2596 lt!85185)) (size!1166 (buf!1523 (_2!2596 lt!85185)))))))

(declare-fun b!54803 () Bool)

(declare-fun e!36553 () Bool)

(declare-fun lt!85167 () (_ BitVec 64))

(assert (=> b!54803 (= e!36553 (validate_offset_bits!1 ((_ sign_extend 32) (size!1166 (buf!1523 (_2!2596 lt!84632)))) ((_ sign_extend 32) (currentByte!3099 (_2!2596 lt!84632))) ((_ sign_extend 32) (currentBit!3094 (_2!2596 lt!84632))) lt!85167))))

(declare-fun lt!85157 () tuple2!4970)

(declare-fun c!3885 () Bool)

(declare-fun call!697 () tuple2!4972)

(declare-fun bm!694 () Bool)

(assert (=> bm!694 (= call!697 (reader!0 (_2!2596 lt!84632) (ite c!3885 (_2!2596 lt!85157) (_2!2596 lt!84632))))))

(declare-fun b!54804 () Bool)

(declare-fun lt!85149 () tuple2!4972)

(assert (=> b!54804 (= e!36555 (= (bitStreamReadBitsIntoList!0 (_2!2596 lt!85185) (_1!2597 lt!85149) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!2596 lt!85185) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!54804 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!54804 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!85181 () Unit!3763)

(declare-fun lt!85148 () Unit!3763)

(assert (=> b!54804 (= lt!85181 lt!85148)))

(assert (=> b!54804 (validate_offset_bits!1 ((_ sign_extend 32) (size!1166 (buf!1523 (_2!2596 lt!85185)))) ((_ sign_extend 32) (currentByte!3099 (_2!2596 lt!84632))) ((_ sign_extend 32) (currentBit!3094 (_2!2596 lt!84632))) lt!85167)))

(assert (=> b!54804 (= lt!85148 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2596 lt!84632) (buf!1523 (_2!2596 lt!85185)) lt!85167))))

(assert (=> b!54804 e!36553))

(declare-fun res!45717 () Bool)

(assert (=> b!54804 (=> (not res!45717) (not e!36553))))

(assert (=> b!54804 (= res!45717 (and (= (size!1166 (buf!1523 (_2!2596 lt!84632))) (size!1166 (buf!1523 (_2!2596 lt!85185)))) (bvsge lt!85167 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!54804 (= lt!85167 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!54804 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!54804 (= lt!85149 (reader!0 (_2!2596 lt!84632) (_2!2596 lt!85185)))))

(declare-fun d!17442 () Bool)

(assert (=> d!17442 e!36555))

(declare-fun res!45718 () Bool)

(assert (=> d!17442 (=> (not res!45718) (not e!36555))))

(declare-fun lt!85151 () (_ BitVec 64))

(assert (=> d!17442 (= res!45718 (= (bitIndex!0 (size!1166 (buf!1523 (_2!2596 lt!85185))) (currentByte!3099 (_2!2596 lt!85185)) (currentBit!3094 (_2!2596 lt!85185))) (bvsub lt!85151 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!17442 (or (= (bvand lt!85151 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!85151 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!85151 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!85163 () (_ BitVec 64))

(assert (=> d!17442 (= lt!85151 (bvadd lt!85163 to!314))))

(assert (=> d!17442 (or (not (= (bvand lt!85163 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!85163 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!85163 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!17442 (= lt!85163 (bitIndex!0 (size!1166 (buf!1523 (_2!2596 lt!84632))) (currentByte!3099 (_2!2596 lt!84632)) (currentBit!3094 (_2!2596 lt!84632))))))

(declare-fun e!36554 () tuple2!4970)

(assert (=> d!17442 (= lt!85185 e!36554)))

(assert (=> d!17442 (= c!3885 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!85156 () Unit!3763)

(declare-fun lt!85164 () Unit!3763)

(assert (=> d!17442 (= lt!85156 lt!85164)))

(assert (=> d!17442 (isPrefixOf!0 (_2!2596 lt!84632) (_2!2596 lt!84632))))

(assert (=> d!17442 (= lt!85164 (lemmaIsPrefixRefl!0 (_2!2596 lt!84632)))))

(declare-fun lt!85159 () (_ BitVec 64))

(assert (=> d!17442 (= lt!85159 (bitIndex!0 (size!1166 (buf!1523 (_2!2596 lt!84632))) (currentByte!3099 (_2!2596 lt!84632)) (currentBit!3094 (_2!2596 lt!84632))))))

(assert (=> d!17442 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!17442 (= (appendBitsMSBFirstLoop!0 (_2!2596 lt!84632) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!85185)))

(declare-fun b!54805 () Bool)

(declare-fun Unit!3776 () Unit!3763)

(assert (=> b!54805 (= e!36554 (tuple2!4971 Unit!3776 (_2!2596 lt!84632)))))

(assert (=> b!54805 (= (size!1166 (buf!1523 (_2!2596 lt!84632))) (size!1166 (buf!1523 (_2!2596 lt!84632))))))

(declare-fun lt!85162 () Unit!3763)

(declare-fun Unit!3777 () Unit!3763)

(assert (=> b!54805 (= lt!85162 Unit!3777)))

(declare-fun checkByteArrayBitContent!0 (BitStream!2020 array!2557 array!2557 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!54805 (checkByteArrayBitContent!0 (_2!2596 lt!84632) srcBuffer!2 (_1!2607 (readBits!0 (_1!2597 call!697) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!54806 () Bool)

(declare-fun res!45715 () Bool)

(assert (=> b!54806 (=> (not res!45715) (not e!36555))))

(assert (=> b!54806 (= res!45715 (= (size!1166 (buf!1523 (_2!2596 lt!84632))) (size!1166 (buf!1523 (_2!2596 lt!85185)))))))

(declare-fun b!54807 () Bool)

(declare-fun Unit!3778 () Unit!3763)

(assert (=> b!54807 (= e!36554 (tuple2!4971 Unit!3778 (_2!2596 lt!85157)))))

(declare-fun lt!85153 () tuple2!4970)

(assert (=> b!54807 (= lt!85153 (appendBitFromByte!0 (_2!2596 lt!84632) (select (arr!1706 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!85178 () (_ BitVec 64))

(assert (=> b!54807 (= lt!85178 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!85161 () (_ BitVec 64))

(assert (=> b!54807 (= lt!85161 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!85155 () Unit!3763)

(assert (=> b!54807 (= lt!85155 (validateOffsetBitsIneqLemma!0 (_2!2596 lt!84632) (_2!2596 lt!85153) lt!85178 lt!85161))))

(assert (=> b!54807 (validate_offset_bits!1 ((_ sign_extend 32) (size!1166 (buf!1523 (_2!2596 lt!85153)))) ((_ sign_extend 32) (currentByte!3099 (_2!2596 lt!85153))) ((_ sign_extend 32) (currentBit!3094 (_2!2596 lt!85153))) (bvsub lt!85178 lt!85161))))

(declare-fun lt!85171 () Unit!3763)

(assert (=> b!54807 (= lt!85171 lt!85155)))

(declare-fun lt!85172 () tuple2!4972)

(assert (=> b!54807 (= lt!85172 (reader!0 (_2!2596 lt!84632) (_2!2596 lt!85153)))))

(declare-fun lt!85175 () (_ BitVec 64))

(assert (=> b!54807 (= lt!85175 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!85180 () Unit!3763)

(assert (=> b!54807 (= lt!85180 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2596 lt!84632) (buf!1523 (_2!2596 lt!85153)) lt!85175))))

(assert (=> b!54807 (validate_offset_bits!1 ((_ sign_extend 32) (size!1166 (buf!1523 (_2!2596 lt!85153)))) ((_ sign_extend 32) (currentByte!3099 (_2!2596 lt!84632))) ((_ sign_extend 32) (currentBit!3094 (_2!2596 lt!84632))) lt!85175)))

(declare-fun lt!85152 () Unit!3763)

(assert (=> b!54807 (= lt!85152 lt!85180)))

(assert (=> b!54807 (= (head!404 (byteArrayBitContentToList!0 (_2!2596 lt!85153) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!404 (bitStreamReadBitsIntoList!0 (_2!2596 lt!85153) (_1!2597 lt!85172) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!85166 () Unit!3763)

(declare-fun Unit!3779 () Unit!3763)

(assert (=> b!54807 (= lt!85166 Unit!3779)))

(assert (=> b!54807 (= lt!85157 (appendBitsMSBFirstLoop!0 (_2!2596 lt!85153) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!85177 () Unit!3763)

(assert (=> b!54807 (= lt!85177 (lemmaIsPrefixTransitive!0 (_2!2596 lt!84632) (_2!2596 lt!85153) (_2!2596 lt!85157)))))

(assert (=> b!54807 (isPrefixOf!0 (_2!2596 lt!84632) (_2!2596 lt!85157))))

(declare-fun lt!85188 () Unit!3763)

(assert (=> b!54807 (= lt!85188 lt!85177)))

(assert (=> b!54807 (= (size!1166 (buf!1523 (_2!2596 lt!85157))) (size!1166 (buf!1523 (_2!2596 lt!84632))))))

(declare-fun lt!85168 () Unit!3763)

(declare-fun Unit!3780 () Unit!3763)

(assert (=> b!54807 (= lt!85168 Unit!3780)))

(assert (=> b!54807 (= (bitIndex!0 (size!1166 (buf!1523 (_2!2596 lt!85157))) (currentByte!3099 (_2!2596 lt!85157)) (currentBit!3094 (_2!2596 lt!85157))) (bvsub (bvadd (bitIndex!0 (size!1166 (buf!1523 (_2!2596 lt!84632))) (currentByte!3099 (_2!2596 lt!84632)) (currentBit!3094 (_2!2596 lt!84632))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!85187 () Unit!3763)

(declare-fun Unit!3781 () Unit!3763)

(assert (=> b!54807 (= lt!85187 Unit!3781)))

(assert (=> b!54807 (= (bitIndex!0 (size!1166 (buf!1523 (_2!2596 lt!85157))) (currentByte!3099 (_2!2596 lt!85157)) (currentBit!3094 (_2!2596 lt!85157))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1166 (buf!1523 (_2!2596 lt!85153))) (currentByte!3099 (_2!2596 lt!85153)) (currentBit!3094 (_2!2596 lt!85153))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!85146 () Unit!3763)

(declare-fun Unit!3782 () Unit!3763)

(assert (=> b!54807 (= lt!85146 Unit!3782)))

(declare-fun lt!85189 () tuple2!4972)

(assert (=> b!54807 (= lt!85189 call!697)))

(declare-fun lt!85169 () (_ BitVec 64))

(assert (=> b!54807 (= lt!85169 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!85147 () Unit!3763)

(assert (=> b!54807 (= lt!85147 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2596 lt!84632) (buf!1523 (_2!2596 lt!85157)) lt!85169))))

(assert (=> b!54807 (validate_offset_bits!1 ((_ sign_extend 32) (size!1166 (buf!1523 (_2!2596 lt!85157)))) ((_ sign_extend 32) (currentByte!3099 (_2!2596 lt!84632))) ((_ sign_extend 32) (currentBit!3094 (_2!2596 lt!84632))) lt!85169)))

(declare-fun lt!85150 () Unit!3763)

(assert (=> b!54807 (= lt!85150 lt!85147)))

(declare-fun lt!85183 () tuple2!4972)

(assert (=> b!54807 (= lt!85183 (reader!0 (_2!2596 lt!85153) (_2!2596 lt!85157)))))

(declare-fun lt!85154 () (_ BitVec 64))

(assert (=> b!54807 (= lt!85154 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!85174 () Unit!3763)

(assert (=> b!54807 (= lt!85174 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2596 lt!85153) (buf!1523 (_2!2596 lt!85157)) lt!85154))))

(assert (=> b!54807 (validate_offset_bits!1 ((_ sign_extend 32) (size!1166 (buf!1523 (_2!2596 lt!85157)))) ((_ sign_extend 32) (currentByte!3099 (_2!2596 lt!85153))) ((_ sign_extend 32) (currentBit!3094 (_2!2596 lt!85153))) lt!85154)))

(declare-fun lt!85182 () Unit!3763)

(assert (=> b!54807 (= lt!85182 lt!85174)))

(declare-fun lt!85179 () List!585)

(assert (=> b!54807 (= lt!85179 (byteArrayBitContentToList!0 (_2!2596 lt!85157) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!85170 () List!585)

(assert (=> b!54807 (= lt!85170 (byteArrayBitContentToList!0 (_2!2596 lt!85157) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!85160 () List!585)

(assert (=> b!54807 (= lt!85160 (bitStreamReadBitsIntoList!0 (_2!2596 lt!85157) (_1!2597 lt!85189) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!85165 () List!585)

(assert (=> b!54807 (= lt!85165 (bitStreamReadBitsIntoList!0 (_2!2596 lt!85157) (_1!2597 lt!85183) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!85186 () (_ BitVec 64))

(assert (=> b!54807 (= lt!85186 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!85176 () Unit!3763)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2020 BitStream!2020 BitStream!2020 BitStream!2020 (_ BitVec 64) List!585) Unit!3763)

(assert (=> b!54807 (= lt!85176 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2596 lt!85157) (_2!2596 lt!85157) (_1!2597 lt!85189) (_1!2597 lt!85183) lt!85186 lt!85160))))

(declare-fun tail!259 (List!585) List!585)

(assert (=> b!54807 (= (bitStreamReadBitsIntoList!0 (_2!2596 lt!85157) (_1!2597 lt!85183) (bvsub lt!85186 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!259 lt!85160))))

(declare-fun lt!85173 () Unit!3763)

(assert (=> b!54807 (= lt!85173 lt!85176)))

(declare-fun lt!85158 () Unit!3763)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2557 array!2557 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!3763)

(assert (=> b!54807 (= lt!85158 (arrayBitRangesEqImpliesEq!0 (buf!1523 (_2!2596 lt!85153)) (buf!1523 (_2!2596 lt!85157)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!85159 (bitIndex!0 (size!1166 (buf!1523 (_2!2596 lt!85153))) (currentByte!3099 (_2!2596 lt!85153)) (currentBit!3094 (_2!2596 lt!85153)))))))

(declare-fun bitAt!0 (array!2557 (_ BitVec 64)) Bool)

(assert (=> b!54807 (= (bitAt!0 (buf!1523 (_2!2596 lt!85153)) lt!85159) (bitAt!0 (buf!1523 (_2!2596 lt!85157)) lt!85159))))

(declare-fun lt!85184 () Unit!3763)

(assert (=> b!54807 (= lt!85184 lt!85158)))

(declare-fun b!54808 () Bool)

(declare-fun res!45719 () Bool)

(assert (=> b!54808 (=> (not res!45719) (not e!36555))))

(assert (=> b!54808 (= res!45719 (= (size!1166 (buf!1523 (_2!2596 lt!85185))) (size!1166 (buf!1523 (_2!2596 lt!84632)))))))

(assert (= (and d!17442 c!3885) b!54807))

(assert (= (and d!17442 (not c!3885)) b!54805))

(assert (= (or b!54807 b!54805) bm!694))

(assert (= (and d!17442 res!45718) b!54802))

(assert (= (and b!54802 res!45720) b!54806))

(assert (= (and b!54806 res!45715) b!54801))

(assert (= (and b!54801 res!45716) b!54808))

(assert (= (and b!54808 res!45719) b!54804))

(assert (= (and b!54804 res!45717) b!54803))

(declare-fun m!86197 () Bool)

(assert (=> b!54802 m!86197))

(declare-fun m!86199 () Bool)

(assert (=> b!54803 m!86199))

(declare-fun m!86201 () Bool)

(assert (=> b!54807 m!86201))

(declare-fun m!86203 () Bool)

(assert (=> b!54807 m!86203))

(declare-fun m!86205 () Bool)

(assert (=> b!54807 m!86205))

(declare-fun m!86207 () Bool)

(assert (=> b!54807 m!86207))

(declare-fun m!86209 () Bool)

(assert (=> b!54807 m!86209))

(declare-fun m!86211 () Bool)

(assert (=> b!54807 m!86211))

(declare-fun m!86213 () Bool)

(assert (=> b!54807 m!86213))

(declare-fun m!86215 () Bool)

(assert (=> b!54807 m!86215))

(declare-fun m!86217 () Bool)

(assert (=> b!54807 m!86217))

(declare-fun m!86219 () Bool)

(assert (=> b!54807 m!86219))

(declare-fun m!86221 () Bool)

(assert (=> b!54807 m!86221))

(declare-fun m!86223 () Bool)

(assert (=> b!54807 m!86223))

(declare-fun m!86225 () Bool)

(assert (=> b!54807 m!86225))

(declare-fun m!86227 () Bool)

(assert (=> b!54807 m!86227))

(assert (=> b!54807 m!86215))

(declare-fun m!86229 () Bool)

(assert (=> b!54807 m!86229))

(assert (=> b!54807 m!86211))

(declare-fun m!86231 () Bool)

(assert (=> b!54807 m!86231))

(declare-fun m!86233 () Bool)

(assert (=> b!54807 m!86233))

(declare-fun m!86235 () Bool)

(assert (=> b!54807 m!86235))

(assert (=> b!54807 m!86203))

(declare-fun m!86237 () Bool)

(assert (=> b!54807 m!86237))

(declare-fun m!86239 () Bool)

(assert (=> b!54807 m!86239))

(declare-fun m!86241 () Bool)

(assert (=> b!54807 m!86241))

(declare-fun m!86243 () Bool)

(assert (=> b!54807 m!86243))

(declare-fun m!86245 () Bool)

(assert (=> b!54807 m!86245))

(declare-fun m!86247 () Bool)

(assert (=> b!54807 m!86247))

(declare-fun m!86249 () Bool)

(assert (=> b!54807 m!86249))

(assert (=> b!54807 m!86233))

(assert (=> b!54807 m!85943))

(declare-fun m!86251 () Bool)

(assert (=> b!54807 m!86251))

(declare-fun m!86253 () Bool)

(assert (=> b!54807 m!86253))

(declare-fun m!86255 () Bool)

(assert (=> b!54807 m!86255))

(declare-fun m!86257 () Bool)

(assert (=> b!54807 m!86257))

(declare-fun m!86259 () Bool)

(assert (=> b!54807 m!86259))

(declare-fun m!86261 () Bool)

(assert (=> b!54807 m!86261))

(declare-fun m!86263 () Bool)

(assert (=> bm!694 m!86263))

(declare-fun m!86265 () Bool)

(assert (=> b!54804 m!86265))

(declare-fun m!86267 () Bool)

(assert (=> b!54804 m!86267))

(declare-fun m!86269 () Bool)

(assert (=> b!54804 m!86269))

(declare-fun m!86271 () Bool)

(assert (=> b!54804 m!86271))

(declare-fun m!86273 () Bool)

(assert (=> b!54804 m!86273))

(declare-fun m!86275 () Bool)

(assert (=> b!54801 m!86275))

(declare-fun m!86277 () Bool)

(assert (=> d!17442 m!86277))

(assert (=> d!17442 m!85943))

(declare-fun m!86279 () Bool)

(assert (=> d!17442 m!86279))

(declare-fun m!86281 () Bool)

(assert (=> d!17442 m!86281))

(declare-fun m!86283 () Bool)

(assert (=> b!54805 m!86283))

(declare-fun m!86285 () Bool)

(assert (=> b!54805 m!86285))

(assert (=> b!54542 d!17442))

(declare-fun d!17468 () Bool)

(assert (=> d!17468 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1166 (buf!1523 (_2!2596 lt!84632)))) ((_ sign_extend 32) (currentByte!3099 thiss!1379)) ((_ sign_extend 32) (currentBit!3094 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1166 (buf!1523 (_2!2596 lt!84632)))) ((_ sign_extend 32) (currentByte!3099 thiss!1379)) ((_ sign_extend 32) (currentBit!3094 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!4398 () Bool)

(assert (= bs!4398 d!17468))

(declare-fun m!86287 () Bool)

(assert (=> bs!4398 m!86287))

(assert (=> b!54542 d!17468))

(declare-fun d!17470 () Bool)

(declare-fun res!45721 () Bool)

(declare-fun e!36556 () Bool)

(assert (=> d!17470 (=> (not res!45721) (not e!36556))))

(assert (=> d!17470 (= res!45721 (= (size!1166 (buf!1523 (_2!2596 lt!84632))) (size!1166 (buf!1523 (_2!2596 lt!84628)))))))

(assert (=> d!17470 (= (isPrefixOf!0 (_2!2596 lt!84632) (_2!2596 lt!84628)) e!36556)))

(declare-fun b!54809 () Bool)

(declare-fun res!45722 () Bool)

(assert (=> b!54809 (=> (not res!45722) (not e!36556))))

(assert (=> b!54809 (= res!45722 (bvsle (bitIndex!0 (size!1166 (buf!1523 (_2!2596 lt!84632))) (currentByte!3099 (_2!2596 lt!84632)) (currentBit!3094 (_2!2596 lt!84632))) (bitIndex!0 (size!1166 (buf!1523 (_2!2596 lt!84628))) (currentByte!3099 (_2!2596 lt!84628)) (currentBit!3094 (_2!2596 lt!84628)))))))

(declare-fun b!54810 () Bool)

(declare-fun e!36557 () Bool)

(assert (=> b!54810 (= e!36556 e!36557)))

(declare-fun res!45723 () Bool)

(assert (=> b!54810 (=> res!45723 e!36557)))

(assert (=> b!54810 (= res!45723 (= (size!1166 (buf!1523 (_2!2596 lt!84632))) #b00000000000000000000000000000000))))

(declare-fun b!54811 () Bool)

(assert (=> b!54811 (= e!36557 (arrayBitRangesEq!0 (buf!1523 (_2!2596 lt!84632)) (buf!1523 (_2!2596 lt!84628)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1166 (buf!1523 (_2!2596 lt!84632))) (currentByte!3099 (_2!2596 lt!84632)) (currentBit!3094 (_2!2596 lt!84632)))))))

(assert (= (and d!17470 res!45721) b!54809))

(assert (= (and b!54809 res!45722) b!54810))

(assert (= (and b!54810 (not res!45723)) b!54811))

(assert (=> b!54809 m!85943))

(assert (=> b!54809 m!86033))

(assert (=> b!54811 m!85943))

(assert (=> b!54811 m!85943))

(declare-fun m!86289 () Bool)

(assert (=> b!54811 m!86289))

(assert (=> b!54542 d!17470))

(declare-fun b!54850 () Bool)

(declare-fun e!36577 () Unit!3763)

(declare-fun Unit!3784 () Unit!3763)

(assert (=> b!54850 (= e!36577 Unit!3784)))

(declare-fun b!54852 () Bool)

(declare-fun lt!85345 () Unit!3763)

(assert (=> b!54852 (= e!36577 lt!85345)))

(declare-fun lt!85349 () (_ BitVec 64))

(assert (=> b!54852 (= lt!85349 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!85333 () (_ BitVec 64))

(assert (=> b!54852 (= lt!85333 (bitIndex!0 (size!1166 (buf!1523 thiss!1379)) (currentByte!3099 thiss!1379) (currentBit!3094 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2557 array!2557 (_ BitVec 64) (_ BitVec 64)) Unit!3763)

(assert (=> b!54852 (= lt!85345 (arrayBitRangesEqSymmetric!0 (buf!1523 thiss!1379) (buf!1523 (_2!2596 lt!84632)) lt!85349 lt!85333))))

(assert (=> b!54852 (arrayBitRangesEq!0 (buf!1523 (_2!2596 lt!84632)) (buf!1523 thiss!1379) lt!85349 lt!85333)))

(declare-fun e!36576 () Bool)

(declare-fun lt!85339 () tuple2!4972)

(declare-fun lt!85347 () (_ BitVec 64))

(declare-fun lt!85340 () (_ BitVec 64))

(declare-fun b!54853 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!2020 (_ BitVec 64)) BitStream!2020)

(assert (=> b!54853 (= e!36576 (= (_1!2597 lt!85339) (withMovedBitIndex!0 (_2!2597 lt!85339) (bvsub lt!85347 lt!85340))))))

(assert (=> b!54853 (or (= (bvand lt!85347 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!85340 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!85347 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!85347 lt!85340) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!54853 (= lt!85340 (bitIndex!0 (size!1166 (buf!1523 (_2!2596 lt!84632))) (currentByte!3099 (_2!2596 lt!84632)) (currentBit!3094 (_2!2596 lt!84632))))))

(assert (=> b!54853 (= lt!85347 (bitIndex!0 (size!1166 (buf!1523 thiss!1379)) (currentByte!3099 thiss!1379) (currentBit!3094 thiss!1379)))))

(declare-fun b!54854 () Bool)

(declare-fun res!45748 () Bool)

(assert (=> b!54854 (=> (not res!45748) (not e!36576))))

(assert (=> b!54854 (= res!45748 (isPrefixOf!0 (_1!2597 lt!85339) thiss!1379))))

(declare-fun d!17472 () Bool)

(assert (=> d!17472 e!36576))

(declare-fun res!45749 () Bool)

(assert (=> d!17472 (=> (not res!45749) (not e!36576))))

(assert (=> d!17472 (= res!45749 (isPrefixOf!0 (_1!2597 lt!85339) (_2!2597 lt!85339)))))

(declare-fun lt!85341 () BitStream!2020)

(assert (=> d!17472 (= lt!85339 (tuple2!4973 lt!85341 (_2!2596 lt!84632)))))

(declare-fun lt!85342 () Unit!3763)

(declare-fun lt!85335 () Unit!3763)

(assert (=> d!17472 (= lt!85342 lt!85335)))

(assert (=> d!17472 (isPrefixOf!0 lt!85341 (_2!2596 lt!84632))))

(assert (=> d!17472 (= lt!85335 (lemmaIsPrefixTransitive!0 lt!85341 (_2!2596 lt!84632) (_2!2596 lt!84632)))))

(declare-fun lt!85351 () Unit!3763)

(declare-fun lt!85346 () Unit!3763)

(assert (=> d!17472 (= lt!85351 lt!85346)))

(assert (=> d!17472 (isPrefixOf!0 lt!85341 (_2!2596 lt!84632))))

(assert (=> d!17472 (= lt!85346 (lemmaIsPrefixTransitive!0 lt!85341 thiss!1379 (_2!2596 lt!84632)))))

(declare-fun lt!85336 () Unit!3763)

(assert (=> d!17472 (= lt!85336 e!36577)))

(declare-fun c!3893 () Bool)

(assert (=> d!17472 (= c!3893 (not (= (size!1166 (buf!1523 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!85334 () Unit!3763)

(declare-fun lt!85344 () Unit!3763)

(assert (=> d!17472 (= lt!85334 lt!85344)))

(assert (=> d!17472 (isPrefixOf!0 (_2!2596 lt!84632) (_2!2596 lt!84632))))

(assert (=> d!17472 (= lt!85344 (lemmaIsPrefixRefl!0 (_2!2596 lt!84632)))))

(declare-fun lt!85348 () Unit!3763)

(declare-fun lt!85337 () Unit!3763)

(assert (=> d!17472 (= lt!85348 lt!85337)))

(assert (=> d!17472 (= lt!85337 (lemmaIsPrefixRefl!0 (_2!2596 lt!84632)))))

(declare-fun lt!85343 () Unit!3763)

(declare-fun lt!85350 () Unit!3763)

(assert (=> d!17472 (= lt!85343 lt!85350)))

(assert (=> d!17472 (isPrefixOf!0 lt!85341 lt!85341)))

(assert (=> d!17472 (= lt!85350 (lemmaIsPrefixRefl!0 lt!85341))))

(declare-fun lt!85352 () Unit!3763)

(declare-fun lt!85338 () Unit!3763)

(assert (=> d!17472 (= lt!85352 lt!85338)))

(assert (=> d!17472 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!17472 (= lt!85338 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!17472 (= lt!85341 (BitStream!2021 (buf!1523 (_2!2596 lt!84632)) (currentByte!3099 thiss!1379) (currentBit!3094 thiss!1379)))))

(assert (=> d!17472 (isPrefixOf!0 thiss!1379 (_2!2596 lt!84632))))

(assert (=> d!17472 (= (reader!0 thiss!1379 (_2!2596 lt!84632)) lt!85339)))

(declare-fun b!54851 () Bool)

(declare-fun res!45750 () Bool)

(assert (=> b!54851 (=> (not res!45750) (not e!36576))))

(assert (=> b!54851 (= res!45750 (isPrefixOf!0 (_2!2597 lt!85339) (_2!2596 lt!84632)))))

(assert (= (and d!17472 c!3893) b!54852))

(assert (= (and d!17472 (not c!3893)) b!54850))

(assert (= (and d!17472 res!45749) b!54854))

(assert (= (and b!54854 res!45748) b!54851))

(assert (= (and b!54851 res!45750) b!54853))

(declare-fun m!86331 () Bool)

(assert (=> b!54853 m!86331))

(assert (=> b!54853 m!85943))

(assert (=> b!54853 m!85803))

(declare-fun m!86333 () Bool)

(assert (=> b!54854 m!86333))

(assert (=> d!17472 m!85801))

(assert (=> d!17472 m!85827))

(declare-fun m!86335 () Bool)

(assert (=> d!17472 m!86335))

(declare-fun m!86337 () Bool)

(assert (=> d!17472 m!86337))

(assert (=> d!17472 m!86281))

(assert (=> d!17472 m!86279))

(declare-fun m!86339 () Bool)

(assert (=> d!17472 m!86339))

(assert (=> d!17472 m!85799))

(declare-fun m!86341 () Bool)

(assert (=> d!17472 m!86341))

(declare-fun m!86343 () Bool)

(assert (=> d!17472 m!86343))

(declare-fun m!86345 () Bool)

(assert (=> d!17472 m!86345))

(assert (=> b!54852 m!85803))

(declare-fun m!86347 () Bool)

(assert (=> b!54852 m!86347))

(declare-fun m!86349 () Bool)

(assert (=> b!54852 m!86349))

(declare-fun m!86351 () Bool)

(assert (=> b!54851 m!86351))

(assert (=> b!54542 d!17472))

(declare-fun d!17492 () Bool)

(assert (=> d!17492 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1166 (buf!1523 thiss!1379))) ((_ sign_extend 32) (currentByte!3099 thiss!1379)) ((_ sign_extend 32) (currentBit!3094 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1166 (buf!1523 thiss!1379))) ((_ sign_extend 32) (currentByte!3099 thiss!1379)) ((_ sign_extend 32) (currentBit!3094 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4405 () Bool)

(assert (= bs!4405 d!17492))

(assert (=> bs!4405 m!85939))

(assert (=> b!54544 d!17492))

(declare-fun d!17494 () Bool)

(assert (=> d!17494 (= (head!404 (byteArrayBitContentToList!0 (_2!2596 lt!84632) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!700 (byteArrayBitContentToList!0 (_2!2596 lt!84632) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!54543 d!17494))

(declare-fun d!17496 () Bool)

(declare-fun c!3896 () Bool)

(assert (=> d!17496 (= c!3896 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!36586 () List!585)

(assert (=> d!17496 (= (byteArrayBitContentToList!0 (_2!2596 lt!84632) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!36586)))

(declare-fun b!54875 () Bool)

(assert (=> b!54875 (= e!36586 Nil!582)))

(declare-fun b!54876 () Bool)

(assert (=> b!54876 (= e!36586 (Cons!581 (not (= (bvand ((_ sign_extend 24) (select (arr!1706 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2596 lt!84632) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!17496 c!3896) b!54875))

(assert (= (and d!17496 (not c!3896)) b!54876))

(assert (=> b!54876 m!85825))

(assert (=> b!54876 m!86023))

(declare-fun m!86353 () Bool)

(assert (=> b!54876 m!86353))

(assert (=> b!54543 d!17496))

(declare-fun d!17498 () Bool)

(assert (=> d!17498 (= (head!404 (bitStreamReadBitsIntoList!0 (_2!2596 lt!84632) (_1!2597 lt!84630) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!700 (bitStreamReadBitsIntoList!0 (_2!2596 lt!84632) (_1!2597 lt!84630) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!54543 d!17498))

(declare-fun b!54896 () Bool)

(declare-fun e!36596 () Bool)

(declare-fun lt!85433 () List!585)

(declare-fun length!271 (List!585) Int)

(assert (=> b!54896 (= e!36596 (> (length!271 lt!85433) 0))))

(declare-fun d!17500 () Bool)

(assert (=> d!17500 e!36596))

(declare-fun c!3904 () Bool)

(assert (=> d!17500 (= c!3904 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!5002 0))(
  ( (tuple2!5003 (_1!2612 List!585) (_2!2612 BitStream!2020)) )
))
(declare-fun e!36595 () tuple2!5002)

(assert (=> d!17500 (= lt!85433 (_1!2612 e!36595))))

(declare-fun c!3905 () Bool)

(assert (=> d!17500 (= c!3905 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!17500 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!17500 (= (bitStreamReadBitsIntoList!0 (_2!2596 lt!84632) (_1!2597 lt!84630) #b0000000000000000000000000000000000000000000000000000000000000001) lt!85433)))

(declare-fun b!54893 () Bool)

(assert (=> b!54893 (= e!36595 (tuple2!5003 Nil!582 (_1!2597 lt!84630)))))

(declare-datatypes ((tuple2!5004 0))(
  ( (tuple2!5005 (_1!2613 Bool) (_2!2613 BitStream!2020)) )
))
(declare-fun lt!85432 () tuple2!5004)

(declare-fun b!54894 () Bool)

(declare-fun lt!85431 () (_ BitVec 64))

(assert (=> b!54894 (= e!36595 (tuple2!5003 (Cons!581 (_1!2613 lt!85432) (bitStreamReadBitsIntoList!0 (_2!2596 lt!84632) (_2!2613 lt!85432) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!85431))) (_2!2613 lt!85432)))))

(declare-fun readBit!0 (BitStream!2020) tuple2!5004)

(assert (=> b!54894 (= lt!85432 (readBit!0 (_1!2597 lt!84630)))))

(assert (=> b!54894 (= lt!85431 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!54895 () Bool)

(declare-fun isEmpty!158 (List!585) Bool)

(assert (=> b!54895 (= e!36596 (isEmpty!158 lt!85433))))

(assert (= (and d!17500 c!3905) b!54893))

(assert (= (and d!17500 (not c!3905)) b!54894))

(assert (= (and d!17500 c!3904) b!54895))

(assert (= (and d!17500 (not c!3904)) b!54896))

(declare-fun m!86357 () Bool)

(assert (=> b!54896 m!86357))

(declare-fun m!86359 () Bool)

(assert (=> b!54894 m!86359))

(declare-fun m!86361 () Bool)

(assert (=> b!54894 m!86361))

(declare-fun m!86363 () Bool)

(assert (=> b!54895 m!86363))

(assert (=> b!54543 d!17500))

(push 1)

(assert (not b!54698))

(assert (not b!54895))

(assert (not b!54853))

(assert (not b!54807))

(assert (not b!54802))

(assert (not b!54876))

(assert (not b!54696))

(assert (not b!54697))

(assert (not d!17492))

(assert (not b!54703))

(assert (not b!54705))

(assert (not b!54851))

(assert (not b!54699))

(assert (not b!54896))

(assert (not b!54622))

(assert (not b!54811))

(assert (not d!17394))

(assert (not d!17440))

(assert (not d!17398))

(assert (not b!54805))

(assert (not d!17436))

(assert (not b!54617))

(assert (not d!17442))

(assert (not b!54809))

(assert (not bm!694))

(assert (not d!17468))

(assert (not b!54701))

(assert (not b!54803))

(assert (not b!54854))

(assert (not b!54619))

(assert (not d!17392))

(assert (not b!54608))

(assert (not b!54695))

(assert (not b!54610))

(assert (not b!54894))

(assert (not b!54700))

(assert (not b!54801))

(assert (not b!54702))

(assert (not d!17410))

(assert (not b!54804))

(assert (not d!17472))

(assert (not d!17404))

(assert (not d!17434))

(assert (not b!54852))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

