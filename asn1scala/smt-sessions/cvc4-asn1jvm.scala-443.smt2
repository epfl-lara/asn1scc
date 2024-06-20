; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11854 () Bool)

(assert start!11854)

(declare-fun res!49567 () Bool)

(declare-fun e!39626 () Bool)

(assert (=> start!11854 (=> (not res!49567) (not e!39626))))

(declare-datatypes ((array!2711 0))(
  ( (array!2712 (arr!1795 (Array (_ BitVec 32) (_ BitVec 8))) (size!1231 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2711)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!11854 (= res!49567 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1231 srcBuffer!2))))))))

(assert (=> start!11854 e!39626))

(assert (=> start!11854 true))

(declare-fun array_inv!1134 (array!2711) Bool)

(assert (=> start!11854 (array_inv!1134 srcBuffer!2)))

(declare-datatypes ((BitStream!2150 0))(
  ( (BitStream!2151 (buf!1612 array!2711) (currentByte!3230 (_ BitVec 32)) (currentBit!3225 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2150)

(declare-fun e!39628 () Bool)

(declare-fun inv!12 (BitStream!2150) Bool)

(assert (=> start!11854 (and (inv!12 thiss!1379) e!39628)))

(declare-fun b!59538 () Bool)

(declare-fun e!39623 () Bool)

(declare-fun e!39632 () Bool)

(assert (=> b!59538 (= e!39623 e!39632)))

(declare-fun res!49561 () Bool)

(assert (=> b!59538 (=> res!49561 e!39632)))

(declare-fun lt!93346 () (_ BitVec 64))

(declare-fun lt!93335 () (_ BitVec 64))

(assert (=> b!59538 (= res!49561 (not (= lt!93346 (bvsub (bvadd lt!93335 to!314) i!635))))))

(declare-datatypes ((Unit!4085 0))(
  ( (Unit!4086) )
))
(declare-datatypes ((tuple2!5422 0))(
  ( (tuple2!5423 (_1!2822 Unit!4085) (_2!2822 BitStream!2150)) )
))
(declare-fun lt!93343 () tuple2!5422)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!59538 (= lt!93346 (bitIndex!0 (size!1231 (buf!1612 (_2!2822 lt!93343))) (currentByte!3230 (_2!2822 lt!93343)) (currentBit!3225 (_2!2822 lt!93343))))))

(declare-fun b!59539 () Bool)

(declare-fun res!49568 () Bool)

(assert (=> b!59539 (=> (not res!49568) (not e!39626))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!59539 (= res!49568 (validate_offset_bits!1 ((_ sign_extend 32) (size!1231 (buf!1612 thiss!1379))) ((_ sign_extend 32) (currentByte!3230 thiss!1379)) ((_ sign_extend 32) (currentBit!3225 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!59540 () Bool)

(declare-fun res!49559 () Bool)

(assert (=> b!59540 (=> res!49559 e!39632)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!59540 (= res!49559 (not (invariant!0 (currentBit!3225 (_2!2822 lt!93343)) (currentByte!3230 (_2!2822 lt!93343)) (size!1231 (buf!1612 (_2!2822 lt!93343))))))))

(declare-fun b!59541 () Bool)

(assert (=> b!59541 (= e!39628 (array_inv!1134 (buf!1612 thiss!1379)))))

(declare-fun b!59542 () Bool)

(declare-fun res!49563 () Bool)

(declare-fun e!39627 () Bool)

(assert (=> b!59542 (=> res!49563 e!39627)))

(declare-fun lt!93337 () tuple2!5422)

(assert (=> b!59542 (= res!49563 (not (invariant!0 (currentBit!3225 (_2!2822 lt!93337)) (currentByte!3230 (_2!2822 lt!93337)) (size!1231 (buf!1612 (_2!2822 lt!93343))))))))

(declare-fun b!59543 () Bool)

(declare-fun res!49560 () Bool)

(assert (=> b!59543 (=> res!49560 e!39632)))

(assert (=> b!59543 (= res!49560 (not (= (size!1231 (buf!1612 thiss!1379)) (size!1231 (buf!1612 (_2!2822 lt!93343))))))))

(declare-fun b!59544 () Bool)

(declare-fun e!39624 () Bool)

(assert (=> b!59544 (= e!39626 (not e!39624))))

(declare-fun res!49566 () Bool)

(assert (=> b!59544 (=> res!49566 e!39624)))

(assert (=> b!59544 (= res!49566 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!2150 BitStream!2150) Bool)

(assert (=> b!59544 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!93344 () Unit!4085)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2150) Unit!4085)

(assert (=> b!59544 (= lt!93344 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!59544 (= lt!93335 (bitIndex!0 (size!1231 (buf!1612 thiss!1379)) (currentByte!3230 thiss!1379) (currentBit!3225 thiss!1379)))))

(declare-fun b!59545 () Bool)

(declare-datatypes ((tuple2!5424 0))(
  ( (tuple2!5425 (_1!2823 BitStream!2150) (_2!2823 BitStream!2150)) )
))
(declare-fun lt!93340 () tuple2!5424)

(declare-fun e!39629 () Bool)

(declare-datatypes ((List!650 0))(
  ( (Nil!647) (Cons!646 (h!765 Bool) (t!1400 List!650)) )
))
(declare-fun head!469 (List!650) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2150 array!2711 (_ BitVec 64) (_ BitVec 64)) List!650)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2150 BitStream!2150 (_ BitVec 64)) List!650)

(assert (=> b!59545 (= e!39629 (= (head!469 (byteArrayBitContentToList!0 (_2!2822 lt!93337) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!469 (bitStreamReadBitsIntoList!0 (_2!2822 lt!93337) (_1!2823 lt!93340) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun e!39630 () Bool)

(declare-fun b!59546 () Bool)

(assert (=> b!59546 (= e!39630 (= lt!93346 (bvsub (bvsub (bvadd (bitIndex!0 (size!1231 (buf!1612 (_2!2822 lt!93337))) (currentByte!3230 (_2!2822 lt!93337)) (currentBit!3225 (_2!2822 lt!93337))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!59547 () Bool)

(declare-fun e!39622 () Bool)

(assert (=> b!59547 (= e!39624 e!39622)))

(declare-fun res!49562 () Bool)

(assert (=> b!59547 (=> res!49562 e!39622)))

(assert (=> b!59547 (= res!49562 (not (isPrefixOf!0 thiss!1379 (_2!2822 lt!93337))))))

(declare-fun lt!93338 () (_ BitVec 64))

(assert (=> b!59547 (validate_offset_bits!1 ((_ sign_extend 32) (size!1231 (buf!1612 (_2!2822 lt!93337)))) ((_ sign_extend 32) (currentByte!3230 (_2!2822 lt!93337))) ((_ sign_extend 32) (currentBit!3225 (_2!2822 lt!93337))) lt!93338)))

(assert (=> b!59547 (= lt!93338 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!93341 () Unit!4085)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2150 BitStream!2150 (_ BitVec 64) (_ BitVec 64)) Unit!4085)

(assert (=> b!59547 (= lt!93341 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2822 lt!93337) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2150 (_ BitVec 8) (_ BitVec 32)) tuple2!5422)

(assert (=> b!59547 (= lt!93337 (appendBitFromByte!0 thiss!1379 (select (arr!1795 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!59548 () Bool)

(assert (=> b!59548 (= e!39632 e!39627)))

(declare-fun res!49564 () Bool)

(assert (=> b!59548 (=> res!49564 e!39627)))

(assert (=> b!59548 (= res!49564 (not (= (size!1231 (buf!1612 (_2!2822 lt!93337))) (size!1231 (buf!1612 (_2!2822 lt!93343))))))))

(assert (=> b!59548 e!39630))

(declare-fun res!49565 () Bool)

(assert (=> b!59548 (=> (not res!49565) (not e!39630))))

(assert (=> b!59548 (= res!49565 (= (size!1231 (buf!1612 (_2!2822 lt!93343))) (size!1231 (buf!1612 thiss!1379))))))

(declare-fun b!59549 () Bool)

(declare-fun res!49569 () Bool)

(assert (=> b!59549 (=> res!49569 e!39627)))

(assert (=> b!59549 (= res!49569 (not (invariant!0 (currentBit!3225 (_2!2822 lt!93337)) (currentByte!3230 (_2!2822 lt!93337)) (size!1231 (buf!1612 (_2!2822 lt!93337))))))))

(declare-fun b!59550 () Bool)

(assert (=> b!59550 (= e!39627 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand i!635 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!59550 (validate_offset_bits!1 ((_ sign_extend 32) (size!1231 (buf!1612 (_2!2822 lt!93343)))) ((_ sign_extend 32) (currentByte!3230 (_2!2822 lt!93337))) ((_ sign_extend 32) (currentBit!3225 (_2!2822 lt!93337))) lt!93338)))

(declare-fun lt!93333 () Unit!4085)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2150 array!2711 (_ BitVec 64)) Unit!4085)

(assert (=> b!59550 (= lt!93333 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2822 lt!93337) (buf!1612 (_2!2822 lt!93343)) lt!93338))))

(declare-fun lt!93339 () tuple2!5424)

(declare-fun reader!0 (BitStream!2150 BitStream!2150) tuple2!5424)

(assert (=> b!59550 (= lt!93339 (reader!0 (_2!2822 lt!93337) (_2!2822 lt!93343)))))

(assert (=> b!59550 (validate_offset_bits!1 ((_ sign_extend 32) (size!1231 (buf!1612 (_2!2822 lt!93343)))) ((_ sign_extend 32) (currentByte!3230 thiss!1379)) ((_ sign_extend 32) (currentBit!3225 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!93336 () Unit!4085)

(assert (=> b!59550 (= lt!93336 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1612 (_2!2822 lt!93343)) (bvsub to!314 i!635)))))

(declare-fun lt!93334 () tuple2!5424)

(assert (=> b!59550 (= lt!93334 (reader!0 thiss!1379 (_2!2822 lt!93343)))))

(declare-fun b!59551 () Bool)

(assert (=> b!59551 (= e!39622 e!39623)))

(declare-fun res!49557 () Bool)

(assert (=> b!59551 (=> res!49557 e!39623)))

(assert (=> b!59551 (= res!49557 (not (isPrefixOf!0 (_2!2822 lt!93337) (_2!2822 lt!93343))))))

(assert (=> b!59551 (isPrefixOf!0 thiss!1379 (_2!2822 lt!93343))))

(declare-fun lt!93342 () Unit!4085)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2150 BitStream!2150 BitStream!2150) Unit!4085)

(assert (=> b!59551 (= lt!93342 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2822 lt!93337) (_2!2822 lt!93343)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2150 array!2711 (_ BitVec 64) (_ BitVec 64)) tuple2!5422)

(assert (=> b!59551 (= lt!93343 (appendBitsMSBFirstLoop!0 (_2!2822 lt!93337) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!59551 e!39629))

(declare-fun res!49558 () Bool)

(assert (=> b!59551 (=> (not res!49558) (not e!39629))))

(assert (=> b!59551 (= res!49558 (validate_offset_bits!1 ((_ sign_extend 32) (size!1231 (buf!1612 (_2!2822 lt!93337)))) ((_ sign_extend 32) (currentByte!3230 thiss!1379)) ((_ sign_extend 32) (currentBit!3225 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!93345 () Unit!4085)

(assert (=> b!59551 (= lt!93345 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1612 (_2!2822 lt!93337)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!59551 (= lt!93340 (reader!0 thiss!1379 (_2!2822 lt!93337)))))

(assert (= (and start!11854 res!49567) b!59539))

(assert (= (and b!59539 res!49568) b!59544))

(assert (= (and b!59544 (not res!49566)) b!59547))

(assert (= (and b!59547 (not res!49562)) b!59551))

(assert (= (and b!59551 res!49558) b!59545))

(assert (= (and b!59551 (not res!49557)) b!59538))

(assert (= (and b!59538 (not res!49561)) b!59540))

(assert (= (and b!59540 (not res!49559)) b!59543))

(assert (= (and b!59543 (not res!49560)) b!59548))

(assert (= (and b!59548 res!49565) b!59546))

(assert (= (and b!59548 (not res!49564)) b!59549))

(assert (= (and b!59549 (not res!49569)) b!59542))

(assert (= (and b!59542 (not res!49563)) b!59550))

(assert (= start!11854 b!59541))

(declare-fun m!93761 () Bool)

(assert (=> b!59547 m!93761))

(declare-fun m!93763 () Bool)

(assert (=> b!59547 m!93763))

(declare-fun m!93765 () Bool)

(assert (=> b!59547 m!93765))

(declare-fun m!93767 () Bool)

(assert (=> b!59547 m!93767))

(assert (=> b!59547 m!93763))

(declare-fun m!93769 () Bool)

(assert (=> b!59547 m!93769))

(declare-fun m!93771 () Bool)

(assert (=> b!59539 m!93771))

(declare-fun m!93773 () Bool)

(assert (=> b!59549 m!93773))

(declare-fun m!93775 () Bool)

(assert (=> b!59546 m!93775))

(declare-fun m!93777 () Bool)

(assert (=> b!59540 m!93777))

(declare-fun m!93779 () Bool)

(assert (=> b!59538 m!93779))

(declare-fun m!93781 () Bool)

(assert (=> b!59544 m!93781))

(declare-fun m!93783 () Bool)

(assert (=> b!59544 m!93783))

(declare-fun m!93785 () Bool)

(assert (=> b!59544 m!93785))

(declare-fun m!93787 () Bool)

(assert (=> b!59541 m!93787))

(declare-fun m!93789 () Bool)

(assert (=> b!59551 m!93789))

(declare-fun m!93791 () Bool)

(assert (=> b!59551 m!93791))

(declare-fun m!93793 () Bool)

(assert (=> b!59551 m!93793))

(declare-fun m!93795 () Bool)

(assert (=> b!59551 m!93795))

(declare-fun m!93797 () Bool)

(assert (=> b!59551 m!93797))

(declare-fun m!93799 () Bool)

(assert (=> b!59551 m!93799))

(declare-fun m!93801 () Bool)

(assert (=> b!59551 m!93801))

(declare-fun m!93803 () Bool)

(assert (=> start!11854 m!93803))

(declare-fun m!93805 () Bool)

(assert (=> start!11854 m!93805))

(declare-fun m!93807 () Bool)

(assert (=> b!59550 m!93807))

(declare-fun m!93809 () Bool)

(assert (=> b!59550 m!93809))

(declare-fun m!93811 () Bool)

(assert (=> b!59550 m!93811))

(declare-fun m!93813 () Bool)

(assert (=> b!59550 m!93813))

(declare-fun m!93815 () Bool)

(assert (=> b!59550 m!93815))

(declare-fun m!93817 () Bool)

(assert (=> b!59550 m!93817))

(declare-fun m!93819 () Bool)

(assert (=> b!59545 m!93819))

(assert (=> b!59545 m!93819))

(declare-fun m!93821 () Bool)

(assert (=> b!59545 m!93821))

(declare-fun m!93823 () Bool)

(assert (=> b!59545 m!93823))

(assert (=> b!59545 m!93823))

(declare-fun m!93825 () Bool)

(assert (=> b!59545 m!93825))

(declare-fun m!93827 () Bool)

(assert (=> b!59542 m!93827))

(push 1)

(assert (not b!59547))

(assert (not b!59551))

(assert (not b!59549))

(assert (not b!59539))

(assert (not start!11854))

(assert (not b!59545))

(assert (not b!59540))

(assert (not b!59550))

(assert (not b!59542))

(assert (not b!59544))

(assert (not b!59541))

(assert (not b!59546))

(assert (not b!59538))

(check-sat)

(pop 1)

(push 1)

(check-sat)

