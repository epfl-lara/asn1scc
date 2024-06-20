; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6014 () Bool)

(assert start!6014)

(declare-fun b!28300 () Bool)

(declare-fun e!19072 () Bool)

(declare-fun e!19071 () Bool)

(assert (=> b!28300 (= e!19072 e!19071)))

(declare-fun res!24558 () Bool)

(assert (=> b!28300 (=> res!24558 e!19071)))

(declare-datatypes ((array!1751 0))(
  ( (array!1752 (arr!1220 (Array (_ BitVec 32) (_ BitVec 8))) (size!758 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1348 0))(
  ( (BitStream!1349 (buf!1085 array!1751) (currentByte!2410 (_ BitVec 32)) (currentBit!2405 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!2219 0))(
  ( (Unit!2220) )
))
(declare-datatypes ((tuple2!3062 0))(
  ( (tuple2!3063 (_1!1618 Unit!2219) (_2!1618 BitStream!1348)) )
))
(declare-fun lt!39776 () tuple2!3062)

(declare-fun lt!39778 () tuple2!3062)

(declare-fun isPrefixOf!0 (BitStream!1348 BitStream!1348) Bool)

(assert (=> b!28300 (= res!24558 (not (isPrefixOf!0 (_2!1618 lt!39776) (_2!1618 lt!39778))))))

(declare-fun thiss!1379 () BitStream!1348)

(assert (=> b!28300 (isPrefixOf!0 thiss!1379 (_2!1618 lt!39778))))

(declare-fun lt!39771 () Unit!2219)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1348 BitStream!1348 BitStream!1348) Unit!2219)

(assert (=> b!28300 (= lt!39771 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1618 lt!39776) (_2!1618 lt!39778)))))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun srcBuffer!2 () array!1751)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1348 array!1751 (_ BitVec 64) (_ BitVec 64)) tuple2!3062)

(assert (=> b!28300 (= lt!39778 (appendBitsMSBFirstLoop!0 (_2!1618 lt!39776) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!19069 () Bool)

(assert (=> b!28300 e!19069))

(declare-fun res!24553 () Bool)

(assert (=> b!28300 (=> (not res!24553) (not e!19069))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!28300 (= res!24553 (validate_offset_bits!1 ((_ sign_extend 32) (size!758 (buf!1085 (_2!1618 lt!39776)))) ((_ sign_extend 32) (currentByte!2410 thiss!1379)) ((_ sign_extend 32) (currentBit!2405 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!39767 () Unit!2219)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1348 array!1751 (_ BitVec 64)) Unit!2219)

(assert (=> b!28300 (= lt!39767 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1085 (_2!1618 lt!39776)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!3064 0))(
  ( (tuple2!3065 (_1!1619 BitStream!1348) (_2!1619 BitStream!1348)) )
))
(declare-fun lt!39766 () tuple2!3064)

(declare-fun reader!0 (BitStream!1348 BitStream!1348) tuple2!3064)

(assert (=> b!28300 (= lt!39766 (reader!0 thiss!1379 (_2!1618 lt!39776)))))

(declare-fun b!28301 () Bool)

(declare-fun e!19061 () Bool)

(declare-fun e!19064 () Bool)

(assert (=> b!28301 (= e!19061 (not e!19064))))

(declare-fun res!24559 () Bool)

(assert (=> b!28301 (=> res!24559 e!19064)))

(assert (=> b!28301 (= res!24559 (bvsge i!635 to!314))))

(assert (=> b!28301 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!39773 () Unit!2219)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1348) Unit!2219)

(assert (=> b!28301 (= lt!39773 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!39779 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!28301 (= lt!39779 (bitIndex!0 (size!758 (buf!1085 thiss!1379)) (currentByte!2410 thiss!1379) (currentBit!2405 thiss!1379)))))

(declare-fun b!28302 () Bool)

(declare-fun e!19070 () Bool)

(declare-datatypes ((List!375 0))(
  ( (Nil!372) (Cons!371 (h!490 Bool) (t!1125 List!375)) )
))
(declare-fun lt!39770 () List!375)

(assert (=> b!28302 (= e!19070 (not (= lt!39770 Nil!372)))))

(declare-fun lt!39772 () List!375)

(declare-fun tail!92 (List!375) List!375)

(assert (=> b!28302 (= lt!39772 (tail!92 lt!39770))))

(declare-fun lt!39769 () Unit!2219)

(declare-fun lt!39777 () tuple2!3064)

(declare-fun lt!39775 () tuple2!3064)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1348 BitStream!1348 BitStream!1348 BitStream!1348 (_ BitVec 64) List!375) Unit!2219)

(assert (=> b!28302 (= lt!39769 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1618 lt!39778) (_2!1618 lt!39778) (_1!1619 lt!39775) (_1!1619 lt!39777) (bvsub to!314 i!635) lt!39770))))

(declare-fun b!28303 () Bool)

(assert (=> b!28303 (= e!19064 e!19072)))

(declare-fun res!24556 () Bool)

(assert (=> b!28303 (=> res!24556 e!19072)))

(assert (=> b!28303 (= res!24556 (not (isPrefixOf!0 thiss!1379 (_2!1618 lt!39776))))))

(declare-fun lt!39780 () (_ BitVec 64))

(assert (=> b!28303 (validate_offset_bits!1 ((_ sign_extend 32) (size!758 (buf!1085 (_2!1618 lt!39776)))) ((_ sign_extend 32) (currentByte!2410 (_2!1618 lt!39776))) ((_ sign_extend 32) (currentBit!2405 (_2!1618 lt!39776))) lt!39780)))

(assert (=> b!28303 (= lt!39780 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!39768 () Unit!2219)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1348 BitStream!1348 (_ BitVec 64) (_ BitVec 64)) Unit!2219)

(assert (=> b!28303 (= lt!39768 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1618 lt!39776) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1348 (_ BitVec 8) (_ BitVec 32)) tuple2!3062)

(assert (=> b!28303 (= lt!39776 (appendBitFromByte!0 thiss!1379 (select (arr!1220 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!28304 () Bool)

(declare-fun e!19066 () Bool)

(declare-fun e!19065 () Bool)

(assert (=> b!28304 (= e!19066 e!19065)))

(declare-fun res!24560 () Bool)

(assert (=> b!28304 (=> res!24560 e!19065)))

(assert (=> b!28304 (= res!24560 (not (= (size!758 (buf!1085 (_2!1618 lt!39776))) (size!758 (buf!1085 (_2!1618 lt!39778))))))))

(declare-fun e!19067 () Bool)

(assert (=> b!28304 e!19067))

(declare-fun res!24566 () Bool)

(assert (=> b!28304 (=> (not res!24566) (not e!19067))))

(assert (=> b!28304 (= res!24566 (= (size!758 (buf!1085 (_2!1618 lt!39778))) (size!758 (buf!1085 thiss!1379))))))

(declare-fun b!28305 () Bool)

(declare-fun res!24562 () Bool)

(assert (=> b!28305 (=> res!24562 e!19066)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!28305 (= res!24562 (not (invariant!0 (currentBit!2405 (_2!1618 lt!39778)) (currentByte!2410 (_2!1618 lt!39778)) (size!758 (buf!1085 (_2!1618 lt!39778))))))))

(declare-fun b!28306 () Bool)

(declare-fun e!19062 () Bool)

(declare-fun array_inv!727 (array!1751) Bool)

(assert (=> b!28306 (= e!19062 (array_inv!727 (buf!1085 thiss!1379)))))

(declare-fun b!28307 () Bool)

(assert (=> b!28307 (= e!19065 e!19070)))

(declare-fun res!24555 () Bool)

(assert (=> b!28307 (=> res!24555 e!19070)))

(assert (=> b!28307 (= res!24555 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1348 BitStream!1348 (_ BitVec 64)) List!375)

(assert (=> b!28307 (= lt!39772 (bitStreamReadBitsIntoList!0 (_2!1618 lt!39778) (_1!1619 lt!39777) lt!39780))))

(assert (=> b!28307 (= lt!39770 (bitStreamReadBitsIntoList!0 (_2!1618 lt!39778) (_1!1619 lt!39775) (bvsub to!314 i!635)))))

(assert (=> b!28307 (validate_offset_bits!1 ((_ sign_extend 32) (size!758 (buf!1085 (_2!1618 lt!39778)))) ((_ sign_extend 32) (currentByte!2410 (_2!1618 lt!39776))) ((_ sign_extend 32) (currentBit!2405 (_2!1618 lt!39776))) lt!39780)))

(declare-fun lt!39765 () Unit!2219)

(assert (=> b!28307 (= lt!39765 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1618 lt!39776) (buf!1085 (_2!1618 lt!39778)) lt!39780))))

(assert (=> b!28307 (= lt!39777 (reader!0 (_2!1618 lt!39776) (_2!1618 lt!39778)))))

(assert (=> b!28307 (validate_offset_bits!1 ((_ sign_extend 32) (size!758 (buf!1085 (_2!1618 lt!39778)))) ((_ sign_extend 32) (currentByte!2410 thiss!1379)) ((_ sign_extend 32) (currentBit!2405 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!39774 () Unit!2219)

(assert (=> b!28307 (= lt!39774 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1085 (_2!1618 lt!39778)) (bvsub to!314 i!635)))))

(assert (=> b!28307 (= lt!39775 (reader!0 thiss!1379 (_2!1618 lt!39778)))))

(declare-fun b!28308 () Bool)

(assert (=> b!28308 (= e!19071 e!19066)))

(declare-fun res!24567 () Bool)

(assert (=> b!28308 (=> res!24567 e!19066)))

(declare-fun lt!39781 () (_ BitVec 64))

(assert (=> b!28308 (= res!24567 (not (= lt!39781 (bvsub (bvadd lt!39779 to!314) i!635))))))

(assert (=> b!28308 (= lt!39781 (bitIndex!0 (size!758 (buf!1085 (_2!1618 lt!39778))) (currentByte!2410 (_2!1618 lt!39778)) (currentBit!2405 (_2!1618 lt!39778))))))

(declare-fun b!28309 () Bool)

(declare-fun res!24561 () Bool)

(assert (=> b!28309 (=> res!24561 e!19066)))

(assert (=> b!28309 (= res!24561 (not (= (size!758 (buf!1085 thiss!1379)) (size!758 (buf!1085 (_2!1618 lt!39778))))))))

(declare-fun res!24565 () Bool)

(assert (=> start!6014 (=> (not res!24565) (not e!19061))))

(assert (=> start!6014 (= res!24565 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!758 srcBuffer!2))))))))

(assert (=> start!6014 e!19061))

(assert (=> start!6014 true))

(assert (=> start!6014 (array_inv!727 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1348) Bool)

(assert (=> start!6014 (and (inv!12 thiss!1379) e!19062)))

(declare-fun b!28310 () Bool)

(declare-fun res!24554 () Bool)

(assert (=> b!28310 (=> res!24554 e!19065)))

(assert (=> b!28310 (= res!24554 (not (invariant!0 (currentBit!2405 (_2!1618 lt!39776)) (currentByte!2410 (_2!1618 lt!39776)) (size!758 (buf!1085 (_2!1618 lt!39776))))))))

(declare-fun b!28311 () Bool)

(declare-fun head!212 (List!375) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1348 array!1751 (_ BitVec 64) (_ BitVec 64)) List!375)

(assert (=> b!28311 (= e!19069 (= (head!212 (byteArrayBitContentToList!0 (_2!1618 lt!39776) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!212 (bitStreamReadBitsIntoList!0 (_2!1618 lt!39776) (_1!1619 lt!39766) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!28312 () Bool)

(declare-fun res!24563 () Bool)

(assert (=> b!28312 (=> res!24563 e!19065)))

(assert (=> b!28312 (= res!24563 (not (invariant!0 (currentBit!2405 (_2!1618 lt!39776)) (currentByte!2410 (_2!1618 lt!39776)) (size!758 (buf!1085 (_2!1618 lt!39778))))))))

(declare-fun b!28313 () Bool)

(assert (=> b!28313 (= e!19067 (= lt!39781 (bvsub (bvsub (bvadd (bitIndex!0 (size!758 (buf!1085 (_2!1618 lt!39776))) (currentByte!2410 (_2!1618 lt!39776)) (currentBit!2405 (_2!1618 lt!39776))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!28314 () Bool)

(declare-fun res!24564 () Bool)

(assert (=> b!28314 (=> (not res!24564) (not e!19061))))

(assert (=> b!28314 (= res!24564 (validate_offset_bits!1 ((_ sign_extend 32) (size!758 (buf!1085 thiss!1379))) ((_ sign_extend 32) (currentByte!2410 thiss!1379)) ((_ sign_extend 32) (currentBit!2405 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!28315 () Bool)

(declare-fun res!24557 () Bool)

(assert (=> b!28315 (=> res!24557 e!19070)))

(declare-fun length!101 (List!375) Int)

(assert (=> b!28315 (= res!24557 (<= (length!101 lt!39770) 0))))

(assert (= (and start!6014 res!24565) b!28314))

(assert (= (and b!28314 res!24564) b!28301))

(assert (= (and b!28301 (not res!24559)) b!28303))

(assert (= (and b!28303 (not res!24556)) b!28300))

(assert (= (and b!28300 res!24553) b!28311))

(assert (= (and b!28300 (not res!24558)) b!28308))

(assert (= (and b!28308 (not res!24567)) b!28305))

(assert (= (and b!28305 (not res!24562)) b!28309))

(assert (= (and b!28309 (not res!24561)) b!28304))

(assert (= (and b!28304 res!24566) b!28313))

(assert (= (and b!28304 (not res!24560)) b!28310))

(assert (= (and b!28310 (not res!24554)) b!28312))

(assert (= (and b!28312 (not res!24563)) b!28307))

(assert (= (and b!28307 (not res!24555)) b!28315))

(assert (= (and b!28315 (not res!24557)) b!28302))

(assert (= start!6014 b!28306))

(declare-fun m!40533 () Bool)

(assert (=> b!28305 m!40533))

(declare-fun m!40535 () Bool)

(assert (=> b!28300 m!40535))

(declare-fun m!40537 () Bool)

(assert (=> b!28300 m!40537))

(declare-fun m!40539 () Bool)

(assert (=> b!28300 m!40539))

(declare-fun m!40541 () Bool)

(assert (=> b!28300 m!40541))

(declare-fun m!40543 () Bool)

(assert (=> b!28300 m!40543))

(declare-fun m!40545 () Bool)

(assert (=> b!28300 m!40545))

(declare-fun m!40547 () Bool)

(assert (=> b!28300 m!40547))

(declare-fun m!40549 () Bool)

(assert (=> b!28306 m!40549))

(declare-fun m!40551 () Bool)

(assert (=> b!28302 m!40551))

(declare-fun m!40553 () Bool)

(assert (=> b!28302 m!40553))

(declare-fun m!40555 () Bool)

(assert (=> b!28310 m!40555))

(declare-fun m!40557 () Bool)

(assert (=> b!28313 m!40557))

(declare-fun m!40559 () Bool)

(assert (=> b!28314 m!40559))

(declare-fun m!40561 () Bool)

(assert (=> start!6014 m!40561))

(declare-fun m!40563 () Bool)

(assert (=> start!6014 m!40563))

(declare-fun m!40565 () Bool)

(assert (=> b!28312 m!40565))

(declare-fun m!40567 () Bool)

(assert (=> b!28311 m!40567))

(assert (=> b!28311 m!40567))

(declare-fun m!40569 () Bool)

(assert (=> b!28311 m!40569))

(declare-fun m!40571 () Bool)

(assert (=> b!28311 m!40571))

(assert (=> b!28311 m!40571))

(declare-fun m!40573 () Bool)

(assert (=> b!28311 m!40573))

(declare-fun m!40575 () Bool)

(assert (=> b!28301 m!40575))

(declare-fun m!40577 () Bool)

(assert (=> b!28301 m!40577))

(declare-fun m!40579 () Bool)

(assert (=> b!28301 m!40579))

(declare-fun m!40581 () Bool)

(assert (=> b!28315 m!40581))

(declare-fun m!40583 () Bool)

(assert (=> b!28307 m!40583))

(declare-fun m!40585 () Bool)

(assert (=> b!28307 m!40585))

(declare-fun m!40587 () Bool)

(assert (=> b!28307 m!40587))

(declare-fun m!40589 () Bool)

(assert (=> b!28307 m!40589))

(declare-fun m!40591 () Bool)

(assert (=> b!28307 m!40591))

(declare-fun m!40593 () Bool)

(assert (=> b!28307 m!40593))

(declare-fun m!40595 () Bool)

(assert (=> b!28307 m!40595))

(declare-fun m!40597 () Bool)

(assert (=> b!28307 m!40597))

(declare-fun m!40599 () Bool)

(assert (=> b!28308 m!40599))

(declare-fun m!40601 () Bool)

(assert (=> b!28303 m!40601))

(declare-fun m!40603 () Bool)

(assert (=> b!28303 m!40603))

(declare-fun m!40605 () Bool)

(assert (=> b!28303 m!40605))

(assert (=> b!28303 m!40601))

(declare-fun m!40607 () Bool)

(assert (=> b!28303 m!40607))

(declare-fun m!40609 () Bool)

(assert (=> b!28303 m!40609))

(push 1)

(assert (not b!28306))

(assert (not b!28301))

(assert (not b!28303))

(assert (not start!6014))

(assert (not b!28305))

(assert (not b!28312))

(assert (not b!28314))

(assert (not b!28313))

(assert (not b!28308))

(assert (not b!28315))

(assert (not b!28311))

(assert (not b!28307))

(assert (not b!28310))

(assert (not b!28302))

(assert (not b!28300))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!28621 () Bool)

(declare-fun res!24794 () Bool)

(declare-fun e!19250 () Bool)

(assert (=> b!28621 (=> (not res!24794) (not e!19250))))

(declare-fun lt!40323 () tuple2!3062)

(assert (=> b!28621 (= res!24794 (= (size!758 (buf!1085 (_2!1618 lt!40323))) (size!758 (buf!1085 (_2!1618 lt!39776)))))))

(declare-fun b!28622 () Bool)

(declare-fun lt!40355 () tuple2!3064)

(assert (=> b!28622 (= e!19250 (= (bitStreamReadBitsIntoList!0 (_2!1618 lt!40323) (_1!1619 lt!40355) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!1618 lt!40323) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!28622 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!28622 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!40357 () Unit!2219)

(declare-fun lt!40350 () Unit!2219)

(assert (=> b!28622 (= lt!40357 lt!40350)))

(declare-fun lt!40364 () (_ BitVec 64))

(assert (=> b!28622 (validate_offset_bits!1 ((_ sign_extend 32) (size!758 (buf!1085 (_2!1618 lt!40323)))) ((_ sign_extend 32) (currentByte!2410 (_2!1618 lt!39776))) ((_ sign_extend 32) (currentBit!2405 (_2!1618 lt!39776))) lt!40364)))

(assert (=> b!28622 (= lt!40350 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1618 lt!39776) (buf!1085 (_2!1618 lt!40323)) lt!40364))))

(declare-fun e!19251 () Bool)

(assert (=> b!28622 e!19251))

(declare-fun res!24792 () Bool)

(assert (=> b!28622 (=> (not res!24792) (not e!19251))))

(assert (=> b!28622 (= res!24792 (and (= (size!758 (buf!1085 (_2!1618 lt!39776))) (size!758 (buf!1085 (_2!1618 lt!40323)))) (bvsge lt!40364 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!28622 (= lt!40364 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!28622 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!28622 (= lt!40355 (reader!0 (_2!1618 lt!39776) (_2!1618 lt!40323)))))

(declare-fun b!28623 () Bool)

(assert (=> b!28623 (= e!19251 (validate_offset_bits!1 ((_ sign_extend 32) (size!758 (buf!1085 (_2!1618 lt!39776)))) ((_ sign_extend 32) (currentByte!2410 (_2!1618 lt!39776))) ((_ sign_extend 32) (currentBit!2405 (_2!1618 lt!39776))) lt!40364))))

(declare-fun b!28624 () Bool)

(declare-fun res!24790 () Bool)

(assert (=> b!28624 (=> (not res!24790) (not e!19250))))

(assert (=> b!28624 (= res!24790 (isPrefixOf!0 (_2!1618 lt!39776) (_2!1618 lt!40323)))))

(declare-fun b!28625 () Bool)

(declare-fun res!24789 () Bool)

(assert (=> b!28625 (=> (not res!24789) (not e!19250))))

(assert (=> b!28625 (= res!24789 (invariant!0 (currentBit!2405 (_2!1618 lt!40323)) (currentByte!2410 (_2!1618 lt!40323)) (size!758 (buf!1085 (_2!1618 lt!40323)))))))

(declare-fun b!28626 () Bool)

(declare-fun e!19252 () tuple2!3062)

(declare-fun Unit!2225 () Unit!2219)

(assert (=> b!28626 (= e!19252 (tuple2!3063 Unit!2225 (_2!1618 lt!39776)))))

(assert (=> b!28626 (= (size!758 (buf!1085 (_2!1618 lt!39776))) (size!758 (buf!1085 (_2!1618 lt!39776))))))

(declare-fun lt!40348 () Unit!2219)

(declare-fun Unit!2226 () Unit!2219)

(assert (=> b!28626 (= lt!40348 Unit!2226)))

(declare-fun call!358 () tuple2!3064)

(declare-fun checkByteArrayBitContent!0 (BitStream!1348 array!1751 array!1751 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!3082 0))(
  ( (tuple2!3083 (_1!1628 array!1751) (_2!1628 BitStream!1348)) )
))
(declare-fun readBits!0 (BitStream!1348 (_ BitVec 64)) tuple2!3082)

(assert (=> b!28626 (checkByteArrayBitContent!0 (_2!1618 lt!39776) srcBuffer!2 (_1!1628 (readBits!0 (_1!1619 call!358) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun d!7902 () Bool)

(assert (=> d!7902 e!19250))

(declare-fun res!24791 () Bool)

(assert (=> d!7902 (=> (not res!24791) (not e!19250))))

(declare-fun lt!40344 () (_ BitVec 64))

(assert (=> d!7902 (= res!24791 (= (bitIndex!0 (size!758 (buf!1085 (_2!1618 lt!40323))) (currentByte!2410 (_2!1618 lt!40323)) (currentBit!2405 (_2!1618 lt!40323))) (bvsub lt!40344 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!7902 (or (= (bvand lt!40344 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!40344 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!40344 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!40334 () (_ BitVec 64))

(assert (=> d!7902 (= lt!40344 (bvadd lt!40334 to!314))))

(assert (=> d!7902 (or (not (= (bvand lt!40334 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!40334 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!40334 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!7902 (= lt!40334 (bitIndex!0 (size!758 (buf!1085 (_2!1618 lt!39776))) (currentByte!2410 (_2!1618 lt!39776)) (currentBit!2405 (_2!1618 lt!39776))))))

(assert (=> d!7902 (= lt!40323 e!19252)))

(declare-fun c!1815 () Bool)

(assert (=> d!7902 (= c!1815 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!40337 () Unit!2219)

(declare-fun lt!40341 () Unit!2219)

(assert (=> d!7902 (= lt!40337 lt!40341)))

(assert (=> d!7902 (isPrefixOf!0 (_2!1618 lt!39776) (_2!1618 lt!39776))))

(assert (=> d!7902 (= lt!40341 (lemmaIsPrefixRefl!0 (_2!1618 lt!39776)))))

(declare-fun lt!40325 () (_ BitVec 64))

(assert (=> d!7902 (= lt!40325 (bitIndex!0 (size!758 (buf!1085 (_2!1618 lt!39776))) (currentByte!2410 (_2!1618 lt!39776)) (currentBit!2405 (_2!1618 lt!39776))))))

(assert (=> d!7902 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!7902 (= (appendBitsMSBFirstLoop!0 (_2!1618 lt!39776) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!40323)))

(declare-fun bm!355 () Bool)

(declare-fun lt!40342 () tuple2!3062)

(declare-fun lt!40359 () tuple2!3062)

(assert (=> bm!355 (= call!358 (reader!0 (ite c!1815 (_2!1618 lt!40359) (_2!1618 lt!39776)) (ite c!1815 (_2!1618 lt!40342) (_2!1618 lt!39776))))))

(declare-fun b!28627 () Bool)

(declare-fun Unit!2227 () Unit!2219)

(assert (=> b!28627 (= e!19252 (tuple2!3063 Unit!2227 (_2!1618 lt!40342)))))

(assert (=> b!28627 (= lt!40359 (appendBitFromByte!0 (_2!1618 lt!39776) (select (arr!1220 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!40338 () (_ BitVec 64))

(assert (=> b!28627 (= lt!40338 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!40324 () (_ BitVec 64))

(assert (=> b!28627 (= lt!40324 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!40328 () Unit!2219)

(assert (=> b!28627 (= lt!40328 (validateOffsetBitsIneqLemma!0 (_2!1618 lt!39776) (_2!1618 lt!40359) lt!40338 lt!40324))))

(assert (=> b!28627 (validate_offset_bits!1 ((_ sign_extend 32) (size!758 (buf!1085 (_2!1618 lt!40359)))) ((_ sign_extend 32) (currentByte!2410 (_2!1618 lt!40359))) ((_ sign_extend 32) (currentBit!2405 (_2!1618 lt!40359))) (bvsub lt!40338 lt!40324))))

(declare-fun lt!40343 () Unit!2219)

(assert (=> b!28627 (= lt!40343 lt!40328)))

(declare-fun lt!40329 () tuple2!3064)

(assert (=> b!28627 (= lt!40329 (reader!0 (_2!1618 lt!39776) (_2!1618 lt!40359)))))

(declare-fun lt!40353 () (_ BitVec 64))

(assert (=> b!28627 (= lt!40353 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!40365 () Unit!2219)

(assert (=> b!28627 (= lt!40365 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1618 lt!39776) (buf!1085 (_2!1618 lt!40359)) lt!40353))))

(assert (=> b!28627 (validate_offset_bits!1 ((_ sign_extend 32) (size!758 (buf!1085 (_2!1618 lt!40359)))) ((_ sign_extend 32) (currentByte!2410 (_2!1618 lt!39776))) ((_ sign_extend 32) (currentBit!2405 (_2!1618 lt!39776))) lt!40353)))

(declare-fun lt!40361 () Unit!2219)

(assert (=> b!28627 (= lt!40361 lt!40365)))

(assert (=> b!28627 (= (head!212 (byteArrayBitContentToList!0 (_2!1618 lt!40359) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!212 (bitStreamReadBitsIntoList!0 (_2!1618 lt!40359) (_1!1619 lt!40329) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!40332 () Unit!2219)

(declare-fun Unit!2228 () Unit!2219)

(assert (=> b!28627 (= lt!40332 Unit!2228)))

(assert (=> b!28627 (= lt!40342 (appendBitsMSBFirstLoop!0 (_2!1618 lt!40359) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!40354 () Unit!2219)

(assert (=> b!28627 (= lt!40354 (lemmaIsPrefixTransitive!0 (_2!1618 lt!39776) (_2!1618 lt!40359) (_2!1618 lt!40342)))))

(assert (=> b!28627 (isPrefixOf!0 (_2!1618 lt!39776) (_2!1618 lt!40342))))

(declare-fun lt!40336 () Unit!2219)

(assert (=> b!28627 (= lt!40336 lt!40354)))

(assert (=> b!28627 (= (size!758 (buf!1085 (_2!1618 lt!40342))) (size!758 (buf!1085 (_2!1618 lt!39776))))))

(declare-fun lt!40326 () Unit!2219)

(declare-fun Unit!2229 () Unit!2219)

(assert (=> b!28627 (= lt!40326 Unit!2229)))

(assert (=> b!28627 (= (bitIndex!0 (size!758 (buf!1085 (_2!1618 lt!40342))) (currentByte!2410 (_2!1618 lt!40342)) (currentBit!2405 (_2!1618 lt!40342))) (bvsub (bvadd (bitIndex!0 (size!758 (buf!1085 (_2!1618 lt!39776))) (currentByte!2410 (_2!1618 lt!39776)) (currentBit!2405 (_2!1618 lt!39776))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!40335 () Unit!2219)

(declare-fun Unit!2230 () Unit!2219)

(assert (=> b!28627 (= lt!40335 Unit!2230)))

(assert (=> b!28627 (= (bitIndex!0 (size!758 (buf!1085 (_2!1618 lt!40342))) (currentByte!2410 (_2!1618 lt!40342)) (currentBit!2405 (_2!1618 lt!40342))) (bvsub (bvsub (bvadd (bitIndex!0 (size!758 (buf!1085 (_2!1618 lt!40359))) (currentByte!2410 (_2!1618 lt!40359)) (currentBit!2405 (_2!1618 lt!40359))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!40352 () Unit!2219)

(declare-fun Unit!2231 () Unit!2219)

(assert (=> b!28627 (= lt!40352 Unit!2231)))

(declare-fun lt!40349 () tuple2!3064)

(assert (=> b!28627 (= lt!40349 (reader!0 (_2!1618 lt!39776) (_2!1618 lt!40342)))))

(declare-fun lt!40356 () (_ BitVec 64))

(assert (=> b!28627 (= lt!40356 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!40347 () Unit!2219)

(assert (=> b!28627 (= lt!40347 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1618 lt!39776) (buf!1085 (_2!1618 lt!40342)) lt!40356))))

(assert (=> b!28627 (validate_offset_bits!1 ((_ sign_extend 32) (size!758 (buf!1085 (_2!1618 lt!40342)))) ((_ sign_extend 32) (currentByte!2410 (_2!1618 lt!39776))) ((_ sign_extend 32) (currentBit!2405 (_2!1618 lt!39776))) lt!40356)))

(declare-fun lt!40345 () Unit!2219)

(assert (=> b!28627 (= lt!40345 lt!40347)))

(declare-fun lt!40363 () tuple2!3064)

(assert (=> b!28627 (= lt!40363 call!358)))

(declare-fun lt!40327 () (_ BitVec 64))

(assert (=> b!28627 (= lt!40327 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!40339 () Unit!2219)

(assert (=> b!28627 (= lt!40339 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1618 lt!40359) (buf!1085 (_2!1618 lt!40342)) lt!40327))))

(assert (=> b!28627 (validate_offset_bits!1 ((_ sign_extend 32) (size!758 (buf!1085 (_2!1618 lt!40342)))) ((_ sign_extend 32) (currentByte!2410 (_2!1618 lt!40359))) ((_ sign_extend 32) (currentBit!2405 (_2!1618 lt!40359))) lt!40327)))

(declare-fun lt!40330 () Unit!2219)

(assert (=> b!28627 (= lt!40330 lt!40339)))

(declare-fun lt!40362 () List!375)

(assert (=> b!28627 (= lt!40362 (byteArrayBitContentToList!0 (_2!1618 lt!40342) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!40346 () List!375)

(assert (=> b!28627 (= lt!40346 (byteArrayBitContentToList!0 (_2!1618 lt!40342) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!40333 () List!375)

(assert (=> b!28627 (= lt!40333 (bitStreamReadBitsIntoList!0 (_2!1618 lt!40342) (_1!1619 lt!40349) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!40360 () List!375)

(assert (=> b!28627 (= lt!40360 (bitStreamReadBitsIntoList!0 (_2!1618 lt!40342) (_1!1619 lt!40363) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!40366 () (_ BitVec 64))

(assert (=> b!28627 (= lt!40366 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!40358 () Unit!2219)

(assert (=> b!28627 (= lt!40358 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1618 lt!40342) (_2!1618 lt!40342) (_1!1619 lt!40349) (_1!1619 lt!40363) lt!40366 lt!40333))))

(assert (=> b!28627 (= (bitStreamReadBitsIntoList!0 (_2!1618 lt!40342) (_1!1619 lt!40363) (bvsub lt!40366 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!92 lt!40333))))

(declare-fun lt!40351 () Unit!2219)

(assert (=> b!28627 (= lt!40351 lt!40358)))

(declare-fun lt!40340 () Unit!2219)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!1751 array!1751 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2219)

(assert (=> b!28627 (= lt!40340 (arrayBitRangesEqImpliesEq!0 (buf!1085 (_2!1618 lt!40359)) (buf!1085 (_2!1618 lt!40342)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!40325 (bitIndex!0 (size!758 (buf!1085 (_2!1618 lt!40359))) (currentByte!2410 (_2!1618 lt!40359)) (currentBit!2405 (_2!1618 lt!40359)))))))

(declare-fun bitAt!0 (array!1751 (_ BitVec 64)) Bool)

(assert (=> b!28627 (= (bitAt!0 (buf!1085 (_2!1618 lt!40359)) lt!40325) (bitAt!0 (buf!1085 (_2!1618 lt!40342)) lt!40325))))

(declare-fun lt!40331 () Unit!2219)

(assert (=> b!28627 (= lt!40331 lt!40340)))

(declare-fun b!28628 () Bool)

(declare-fun res!24793 () Bool)

(assert (=> b!28628 (=> (not res!24793) (not e!19250))))

(assert (=> b!28628 (= res!24793 (= (size!758 (buf!1085 (_2!1618 lt!39776))) (size!758 (buf!1085 (_2!1618 lt!40323)))))))

(assert (= (and d!7902 c!1815) b!28627))

(assert (= (and d!7902 (not c!1815)) b!28626))

(assert (= (or b!28627 b!28626) bm!355))

(assert (= (and d!7902 res!24791) b!28625))

(assert (= (and b!28625 res!24789) b!28628))

(assert (= (and b!28628 res!24793) b!28624))

(assert (= (and b!28624 res!24790) b!28621))

(assert (= (and b!28621 res!24794) b!28622))

(assert (= (and b!28622 res!24792) b!28623))

(declare-fun m!41073 () Bool)

(assert (=> b!28625 m!41073))

(declare-fun m!41075 () Bool)

(assert (=> b!28622 m!41075))

(declare-fun m!41077 () Bool)

(assert (=> b!28622 m!41077))

(declare-fun m!41079 () Bool)

(assert (=> b!28622 m!41079))

(declare-fun m!41081 () Bool)

(assert (=> b!28622 m!41081))

(declare-fun m!41083 () Bool)

(assert (=> b!28622 m!41083))

(declare-fun m!41085 () Bool)

(assert (=> b!28624 m!41085))

(declare-fun m!41087 () Bool)

(assert (=> bm!355 m!41087))

(declare-fun m!41089 () Bool)

(assert (=> b!28623 m!41089))

(declare-fun m!41091 () Bool)

(assert (=> d!7902 m!41091))

(assert (=> d!7902 m!40557))

(declare-fun m!41093 () Bool)

(assert (=> d!7902 m!41093))

(declare-fun m!41095 () Bool)

(assert (=> d!7902 m!41095))

(declare-fun m!41097 () Bool)

(assert (=> b!28626 m!41097))

(declare-fun m!41099 () Bool)

(assert (=> b!28626 m!41099))

(declare-fun m!41101 () Bool)

(assert (=> b!28627 m!41101))

(declare-fun m!41103 () Bool)

(assert (=> b!28627 m!41103))

(declare-fun m!41105 () Bool)

(assert (=> b!28627 m!41105))

(declare-fun m!41107 () Bool)

(assert (=> b!28627 m!41107))

(declare-fun m!41109 () Bool)

(assert (=> b!28627 m!41109))

(declare-fun m!41111 () Bool)

(assert (=> b!28627 m!41111))

(declare-fun m!41113 () Bool)

(assert (=> b!28627 m!41113))

(declare-fun m!41115 () Bool)

(assert (=> b!28627 m!41115))

(declare-fun m!41117 () Bool)

(assert (=> b!28627 m!41117))

(declare-fun m!41119 () Bool)

(assert (=> b!28627 m!41119))

(assert (=> b!28627 m!40557))

(declare-fun m!41121 () Bool)

(assert (=> b!28627 m!41121))

(declare-fun m!41123 () Bool)

(assert (=> b!28627 m!41123))

(declare-fun m!41125 () Bool)

(assert (=> b!28627 m!41125))

(declare-fun m!41127 () Bool)

(assert (=> b!28627 m!41127))

(assert (=> b!28627 m!41115))

(declare-fun m!41129 () Bool)

(assert (=> b!28627 m!41129))

(declare-fun m!41131 () Bool)

(assert (=> b!28627 m!41131))

(declare-fun m!41133 () Bool)

(assert (=> b!28627 m!41133))

(declare-fun m!41135 () Bool)

(assert (=> b!28627 m!41135))

(assert (=> b!28627 m!41119))

(declare-fun m!41137 () Bool)

(assert (=> b!28627 m!41137))

(declare-fun m!41139 () Bool)

(assert (=> b!28627 m!41139))

(declare-fun m!41141 () Bool)

(assert (=> b!28627 m!41141))

(declare-fun m!41143 () Bool)

(assert (=> b!28627 m!41143))

(declare-fun m!41145 () Bool)

(assert (=> b!28627 m!41145))

(declare-fun m!41147 () Bool)

(assert (=> b!28627 m!41147))

(declare-fun m!41149 () Bool)

(assert (=> b!28627 m!41149))

(declare-fun m!41151 () Bool)

(assert (=> b!28627 m!41151))

(declare-fun m!41153 () Bool)

(assert (=> b!28627 m!41153))

(declare-fun m!41155 () Bool)

(assert (=> b!28627 m!41155))

(assert (=> b!28627 m!41147))

(declare-fun m!41157 () Bool)

(assert (=> b!28627 m!41157))

(declare-fun m!41159 () Bool)

(assert (=> b!28627 m!41159))

(assert (=> b!28627 m!41125))

(declare-fun m!41161 () Bool)

(assert (=> b!28627 m!41161))

(assert (=> b!28300 d!7902))

(declare-fun d!7982 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!7982 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!758 (buf!1085 (_2!1618 lt!39776)))) ((_ sign_extend 32) (currentByte!2410 thiss!1379)) ((_ sign_extend 32) (currentBit!2405 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!758 (buf!1085 (_2!1618 lt!39776)))) ((_ sign_extend 32) (currentByte!2410 thiss!1379)) ((_ sign_extend 32) (currentBit!2405 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!2302 () Bool)

(assert (= bs!2302 d!7982))

(declare-fun m!41163 () Bool)

(assert (=> bs!2302 m!41163))

(assert (=> b!28300 d!7982))

(declare-fun lt!40426 () (_ BitVec 64))

(declare-fun e!19257 () Bool)

(declare-fun lt!40411 () tuple2!3064)

(declare-fun lt!40412 () (_ BitVec 64))

(declare-fun b!28639 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!1348 (_ BitVec 64)) BitStream!1348)

(assert (=> b!28639 (= e!19257 (= (_1!1619 lt!40411) (withMovedBitIndex!0 (_2!1619 lt!40411) (bvsub lt!40412 lt!40426))))))

(assert (=> b!28639 (or (= (bvand lt!40412 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!40426 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!40412 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!40412 lt!40426) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!28639 (= lt!40426 (bitIndex!0 (size!758 (buf!1085 (_2!1618 lt!39776))) (currentByte!2410 (_2!1618 lt!39776)) (currentBit!2405 (_2!1618 lt!39776))))))

(assert (=> b!28639 (= lt!40412 (bitIndex!0 (size!758 (buf!1085 thiss!1379)) (currentByte!2410 thiss!1379) (currentBit!2405 thiss!1379)))))

(declare-fun b!28640 () Bool)

(declare-fun e!19258 () Unit!2219)

(declare-fun lt!40416 () Unit!2219)

(assert (=> b!28640 (= e!19258 lt!40416)))

(declare-fun lt!40419 () (_ BitVec 64))

(assert (=> b!28640 (= lt!40419 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!40420 () (_ BitVec 64))

(assert (=> b!28640 (= lt!40420 (bitIndex!0 (size!758 (buf!1085 thiss!1379)) (currentByte!2410 thiss!1379) (currentBit!2405 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!1751 array!1751 (_ BitVec 64) (_ BitVec 64)) Unit!2219)

(assert (=> b!28640 (= lt!40416 (arrayBitRangesEqSymmetric!0 (buf!1085 thiss!1379) (buf!1085 (_2!1618 lt!39776)) lt!40419 lt!40420))))

(declare-fun arrayBitRangesEq!0 (array!1751 array!1751 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!28640 (arrayBitRangesEq!0 (buf!1085 (_2!1618 lt!39776)) (buf!1085 thiss!1379) lt!40419 lt!40420)))

(declare-fun b!28641 () Bool)

(declare-fun res!24803 () Bool)

(assert (=> b!28641 (=> (not res!24803) (not e!19257))))

(assert (=> b!28641 (= res!24803 (isPrefixOf!0 (_2!1619 lt!40411) (_2!1618 lt!39776)))))

(declare-fun d!7984 () Bool)

(assert (=> d!7984 e!19257))

(declare-fun res!24802 () Bool)

(assert (=> d!7984 (=> (not res!24802) (not e!19257))))

(assert (=> d!7984 (= res!24802 (isPrefixOf!0 (_1!1619 lt!40411) (_2!1619 lt!40411)))))

(declare-fun lt!40424 () BitStream!1348)

(assert (=> d!7984 (= lt!40411 (tuple2!3065 lt!40424 (_2!1618 lt!39776)))))

(declare-fun lt!40423 () Unit!2219)

(declare-fun lt!40410 () Unit!2219)

(assert (=> d!7984 (= lt!40423 lt!40410)))

(assert (=> d!7984 (isPrefixOf!0 lt!40424 (_2!1618 lt!39776))))

(assert (=> d!7984 (= lt!40410 (lemmaIsPrefixTransitive!0 lt!40424 (_2!1618 lt!39776) (_2!1618 lt!39776)))))

(declare-fun lt!40421 () Unit!2219)

(declare-fun lt!40414 () Unit!2219)

(assert (=> d!7984 (= lt!40421 lt!40414)))

(assert (=> d!7984 (isPrefixOf!0 lt!40424 (_2!1618 lt!39776))))

(assert (=> d!7984 (= lt!40414 (lemmaIsPrefixTransitive!0 lt!40424 thiss!1379 (_2!1618 lt!39776)))))

(declare-fun lt!40409 () Unit!2219)

(assert (=> d!7984 (= lt!40409 e!19258)))

(declare-fun c!1818 () Bool)

(assert (=> d!7984 (= c!1818 (not (= (size!758 (buf!1085 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!40417 () Unit!2219)

(declare-fun lt!40425 () Unit!2219)

(assert (=> d!7984 (= lt!40417 lt!40425)))

(assert (=> d!7984 (isPrefixOf!0 (_2!1618 lt!39776) (_2!1618 lt!39776))))

(assert (=> d!7984 (= lt!40425 (lemmaIsPrefixRefl!0 (_2!1618 lt!39776)))))

(declare-fun lt!40422 () Unit!2219)

(declare-fun lt!40408 () Unit!2219)

(assert (=> d!7984 (= lt!40422 lt!40408)))

(assert (=> d!7984 (= lt!40408 (lemmaIsPrefixRefl!0 (_2!1618 lt!39776)))))

(declare-fun lt!40415 () Unit!2219)

(declare-fun lt!40418 () Unit!2219)

(assert (=> d!7984 (= lt!40415 lt!40418)))

(assert (=> d!7984 (isPrefixOf!0 lt!40424 lt!40424)))

(assert (=> d!7984 (= lt!40418 (lemmaIsPrefixRefl!0 lt!40424))))

(declare-fun lt!40413 () Unit!2219)

(declare-fun lt!40407 () Unit!2219)

(assert (=> d!7984 (= lt!40413 lt!40407)))

(assert (=> d!7984 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!7984 (= lt!40407 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!7984 (= lt!40424 (BitStream!1349 (buf!1085 (_2!1618 lt!39776)) (currentByte!2410 thiss!1379) (currentBit!2405 thiss!1379)))))

(assert (=> d!7984 (isPrefixOf!0 thiss!1379 (_2!1618 lt!39776))))

(assert (=> d!7984 (= (reader!0 thiss!1379 (_2!1618 lt!39776)) lt!40411)))

(declare-fun b!28642 () Bool)

(declare-fun Unit!2234 () Unit!2219)

(assert (=> b!28642 (= e!19258 Unit!2234)))

(declare-fun b!28643 () Bool)

(declare-fun res!24801 () Bool)

(assert (=> b!28643 (=> (not res!24801) (not e!19257))))

(assert (=> b!28643 (= res!24801 (isPrefixOf!0 (_1!1619 lt!40411) thiss!1379))))

(assert (= (and d!7984 c!1818) b!28640))

(assert (= (and d!7984 (not c!1818)) b!28642))

(assert (= (and d!7984 res!24802) b!28643))

(assert (= (and b!28643 res!24801) b!28641))

(assert (= (and b!28641 res!24803) b!28639))

(declare-fun m!41165 () Bool)

(assert (=> b!28641 m!41165))

(declare-fun m!41167 () Bool)

(assert (=> d!7984 m!41167))

(declare-fun m!41169 () Bool)

(assert (=> d!7984 m!41169))

(assert (=> d!7984 m!41095))

(assert (=> d!7984 m!40603))

(declare-fun m!41171 () Bool)

(assert (=> d!7984 m!41171))

(declare-fun m!41173 () Bool)

(assert (=> d!7984 m!41173))

(declare-fun m!41175 () Bool)

(assert (=> d!7984 m!41175))

(assert (=> d!7984 m!41093))

(assert (=> d!7984 m!40575))

(declare-fun m!41177 () Bool)

(assert (=> d!7984 m!41177))

(assert (=> d!7984 m!40577))

(assert (=> b!28640 m!40579))

(declare-fun m!41179 () Bool)

(assert (=> b!28640 m!41179))

(declare-fun m!41181 () Bool)

(assert (=> b!28640 m!41181))

(declare-fun m!41183 () Bool)

(assert (=> b!28643 m!41183))

(declare-fun m!41185 () Bool)

(assert (=> b!28639 m!41185))

(assert (=> b!28639 m!40557))

(assert (=> b!28639 m!40579))

(assert (=> b!28300 d!7984))

(declare-fun d!7986 () Bool)

(assert (=> d!7986 (validate_offset_bits!1 ((_ sign_extend 32) (size!758 (buf!1085 (_2!1618 lt!39776)))) ((_ sign_extend 32) (currentByte!2410 thiss!1379)) ((_ sign_extend 32) (currentBit!2405 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!40429 () Unit!2219)

(declare-fun choose!9 (BitStream!1348 array!1751 (_ BitVec 64) BitStream!1348) Unit!2219)

(assert (=> d!7986 (= lt!40429 (choose!9 thiss!1379 (buf!1085 (_2!1618 lt!39776)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1349 (buf!1085 (_2!1618 lt!39776)) (currentByte!2410 thiss!1379) (currentBit!2405 thiss!1379))))))

(assert (=> d!7986 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1085 (_2!1618 lt!39776)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!40429)))

(declare-fun bs!2303 () Bool)

(assert (= bs!2303 d!7986))

(assert (=> bs!2303 m!40543))

(declare-fun m!41187 () Bool)

(assert (=> bs!2303 m!41187))

(assert (=> b!28300 d!7986))

(declare-fun d!7988 () Bool)

(declare-fun res!24810 () Bool)

(declare-fun e!19264 () Bool)

(assert (=> d!7988 (=> (not res!24810) (not e!19264))))

(assert (=> d!7988 (= res!24810 (= (size!758 (buf!1085 (_2!1618 lt!39776))) (size!758 (buf!1085 (_2!1618 lt!39778)))))))

(assert (=> d!7988 (= (isPrefixOf!0 (_2!1618 lt!39776) (_2!1618 lt!39778)) e!19264)))

(declare-fun b!28650 () Bool)

(declare-fun res!24812 () Bool)

(assert (=> b!28650 (=> (not res!24812) (not e!19264))))

(assert (=> b!28650 (= res!24812 (bvsle (bitIndex!0 (size!758 (buf!1085 (_2!1618 lt!39776))) (currentByte!2410 (_2!1618 lt!39776)) (currentBit!2405 (_2!1618 lt!39776))) (bitIndex!0 (size!758 (buf!1085 (_2!1618 lt!39778))) (currentByte!2410 (_2!1618 lt!39778)) (currentBit!2405 (_2!1618 lt!39778)))))))

(declare-fun b!28651 () Bool)

(declare-fun e!19263 () Bool)

(assert (=> b!28651 (= e!19264 e!19263)))

(declare-fun res!24811 () Bool)

(assert (=> b!28651 (=> res!24811 e!19263)))

(assert (=> b!28651 (= res!24811 (= (size!758 (buf!1085 (_2!1618 lt!39776))) #b00000000000000000000000000000000))))

(declare-fun b!28652 () Bool)

(assert (=> b!28652 (= e!19263 (arrayBitRangesEq!0 (buf!1085 (_2!1618 lt!39776)) (buf!1085 (_2!1618 lt!39778)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!758 (buf!1085 (_2!1618 lt!39776))) (currentByte!2410 (_2!1618 lt!39776)) (currentBit!2405 (_2!1618 lt!39776)))))))

(assert (= (and d!7988 res!24810) b!28650))

(assert (= (and b!28650 res!24812) b!28651))

(assert (= (and b!28651 (not res!24811)) b!28652))

(assert (=> b!28650 m!40557))

(assert (=> b!28650 m!40599))

(assert (=> b!28652 m!40557))

(assert (=> b!28652 m!40557))

(declare-fun m!41189 () Bool)

(assert (=> b!28652 m!41189))

(assert (=> b!28300 d!7988))

(declare-fun d!7990 () Bool)

(declare-fun res!24813 () Bool)

(declare-fun e!19266 () Bool)

(assert (=> d!7990 (=> (not res!24813) (not e!19266))))

(assert (=> d!7990 (= res!24813 (= (size!758 (buf!1085 thiss!1379)) (size!758 (buf!1085 (_2!1618 lt!39778)))))))

(assert (=> d!7990 (= (isPrefixOf!0 thiss!1379 (_2!1618 lt!39778)) e!19266)))

(declare-fun b!28653 () Bool)

(declare-fun res!24815 () Bool)

(assert (=> b!28653 (=> (not res!24815) (not e!19266))))

(assert (=> b!28653 (= res!24815 (bvsle (bitIndex!0 (size!758 (buf!1085 thiss!1379)) (currentByte!2410 thiss!1379) (currentBit!2405 thiss!1379)) (bitIndex!0 (size!758 (buf!1085 (_2!1618 lt!39778))) (currentByte!2410 (_2!1618 lt!39778)) (currentBit!2405 (_2!1618 lt!39778)))))))

(declare-fun b!28654 () Bool)

(declare-fun e!19265 () Bool)

(assert (=> b!28654 (= e!19266 e!19265)))

(declare-fun res!24814 () Bool)

(assert (=> b!28654 (=> res!24814 e!19265)))

(assert (=> b!28654 (= res!24814 (= (size!758 (buf!1085 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!28655 () Bool)

(assert (=> b!28655 (= e!19265 (arrayBitRangesEq!0 (buf!1085 thiss!1379) (buf!1085 (_2!1618 lt!39778)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!758 (buf!1085 thiss!1379)) (currentByte!2410 thiss!1379) (currentBit!2405 thiss!1379))))))

(assert (= (and d!7990 res!24813) b!28653))

(assert (= (and b!28653 res!24815) b!28654))

(assert (= (and b!28654 (not res!24814)) b!28655))

(assert (=> b!28653 m!40579))

(assert (=> b!28653 m!40599))

(assert (=> b!28655 m!40579))

(assert (=> b!28655 m!40579))

(declare-fun m!41191 () Bool)

(assert (=> b!28655 m!41191))

(assert (=> b!28300 d!7990))

(declare-fun d!7992 () Bool)

(assert (=> d!7992 (isPrefixOf!0 thiss!1379 (_2!1618 lt!39778))))

(declare-fun lt!40432 () Unit!2219)

(declare-fun choose!30 (BitStream!1348 BitStream!1348 BitStream!1348) Unit!2219)

(assert (=> d!7992 (= lt!40432 (choose!30 thiss!1379 (_2!1618 lt!39776) (_2!1618 lt!39778)))))

(assert (=> d!7992 (isPrefixOf!0 thiss!1379 (_2!1618 lt!39776))))

(assert (=> d!7992 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1618 lt!39776) (_2!1618 lt!39778)) lt!40432)))

(declare-fun bs!2304 () Bool)

(assert (= bs!2304 d!7992))

(assert (=> bs!2304 m!40545))

(declare-fun m!41193 () Bool)

(assert (=> bs!2304 m!41193))

(assert (=> bs!2304 m!40603))

(assert (=> b!28300 d!7992))

(declare-fun d!7994 () Bool)

(assert (=> d!7994 (= (invariant!0 (currentBit!2405 (_2!1618 lt!39776)) (currentByte!2410 (_2!1618 lt!39776)) (size!758 (buf!1085 (_2!1618 lt!39776)))) (and (bvsge (currentBit!2405 (_2!1618 lt!39776)) #b00000000000000000000000000000000) (bvslt (currentBit!2405 (_2!1618 lt!39776)) #b00000000000000000000000000001000) (bvsge (currentByte!2410 (_2!1618 lt!39776)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2410 (_2!1618 lt!39776)) (size!758 (buf!1085 (_2!1618 lt!39776)))) (and (= (currentBit!2405 (_2!1618 lt!39776)) #b00000000000000000000000000000000) (= (currentByte!2410 (_2!1618 lt!39776)) (size!758 (buf!1085 (_2!1618 lt!39776))))))))))

(assert (=> b!28310 d!7994))

(declare-fun d!7996 () Bool)

(assert (=> d!7996 (= (invariant!0 (currentBit!2405 (_2!1618 lt!39776)) (currentByte!2410 (_2!1618 lt!39776)) (size!758 (buf!1085 (_2!1618 lt!39778)))) (and (bvsge (currentBit!2405 (_2!1618 lt!39776)) #b00000000000000000000000000000000) (bvslt (currentBit!2405 (_2!1618 lt!39776)) #b00000000000000000000000000001000) (bvsge (currentByte!2410 (_2!1618 lt!39776)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2410 (_2!1618 lt!39776)) (size!758 (buf!1085 (_2!1618 lt!39778)))) (and (= (currentBit!2405 (_2!1618 lt!39776)) #b00000000000000000000000000000000) (= (currentByte!2410 (_2!1618 lt!39776)) (size!758 (buf!1085 (_2!1618 lt!39778))))))))))

(assert (=> b!28312 d!7996))

(declare-fun d!7998 () Bool)

(declare-fun res!24816 () Bool)

(declare-fun e!19268 () Bool)

(assert (=> d!7998 (=> (not res!24816) (not e!19268))))

(assert (=> d!7998 (= res!24816 (= (size!758 (buf!1085 thiss!1379)) (size!758 (buf!1085 thiss!1379))))))

(assert (=> d!7998 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!19268)))

(declare-fun b!28656 () Bool)

(declare-fun res!24818 () Bool)

(assert (=> b!28656 (=> (not res!24818) (not e!19268))))

(assert (=> b!28656 (= res!24818 (bvsle (bitIndex!0 (size!758 (buf!1085 thiss!1379)) (currentByte!2410 thiss!1379) (currentBit!2405 thiss!1379)) (bitIndex!0 (size!758 (buf!1085 thiss!1379)) (currentByte!2410 thiss!1379) (currentBit!2405 thiss!1379))))))

(declare-fun b!28657 () Bool)

(declare-fun e!19267 () Bool)

(assert (=> b!28657 (= e!19268 e!19267)))

(declare-fun res!24817 () Bool)

(assert (=> b!28657 (=> res!24817 e!19267)))

(assert (=> b!28657 (= res!24817 (= (size!758 (buf!1085 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!28658 () Bool)

(assert (=> b!28658 (= e!19267 (arrayBitRangesEq!0 (buf!1085 thiss!1379) (buf!1085 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!758 (buf!1085 thiss!1379)) (currentByte!2410 thiss!1379) (currentBit!2405 thiss!1379))))))

(assert (= (and d!7998 res!24816) b!28656))

(assert (= (and b!28656 res!24818) b!28657))

(assert (= (and b!28657 (not res!24817)) b!28658))

(assert (=> b!28656 m!40579))

(assert (=> b!28656 m!40579))

(assert (=> b!28658 m!40579))

(assert (=> b!28658 m!40579))

(declare-fun m!41195 () Bool)

(assert (=> b!28658 m!41195))

(assert (=> b!28301 d!7998))

(declare-fun d!8000 () Bool)

(assert (=> d!8000 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!40435 () Unit!2219)

(declare-fun choose!11 (BitStream!1348) Unit!2219)

(assert (=> d!8000 (= lt!40435 (choose!11 thiss!1379))))

(assert (=> d!8000 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!40435)))

(declare-fun bs!2306 () Bool)

(assert (= bs!2306 d!8000))

(assert (=> bs!2306 m!40575))

(declare-fun m!41197 () Bool)

(assert (=> bs!2306 m!41197))

(assert (=> b!28301 d!8000))

(declare-fun d!8002 () Bool)

(declare-fun e!19271 () Bool)

(assert (=> d!8002 e!19271))

(declare-fun res!24823 () Bool)

(assert (=> d!8002 (=> (not res!24823) (not e!19271))))

(declare-fun lt!40449 () (_ BitVec 64))

(declare-fun lt!40451 () (_ BitVec 64))

(declare-fun lt!40448 () (_ BitVec 64))

(assert (=> d!8002 (= res!24823 (= lt!40448 (bvsub lt!40449 lt!40451)))))

(assert (=> d!8002 (or (= (bvand lt!40449 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!40451 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!40449 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!40449 lt!40451) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!8002 (= lt!40451 (remainingBits!0 ((_ sign_extend 32) (size!758 (buf!1085 thiss!1379))) ((_ sign_extend 32) (currentByte!2410 thiss!1379)) ((_ sign_extend 32) (currentBit!2405 thiss!1379))))))

(declare-fun lt!40453 () (_ BitVec 64))

(declare-fun lt!40450 () (_ BitVec 64))

(assert (=> d!8002 (= lt!40449 (bvmul lt!40453 lt!40450))))

(assert (=> d!8002 (or (= lt!40453 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!40450 (bvsdiv (bvmul lt!40453 lt!40450) lt!40453)))))

(assert (=> d!8002 (= lt!40450 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!8002 (= lt!40453 ((_ sign_extend 32) (size!758 (buf!1085 thiss!1379))))))

(assert (=> d!8002 (= lt!40448 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2410 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2405 thiss!1379))))))

(assert (=> d!8002 (invariant!0 (currentBit!2405 thiss!1379) (currentByte!2410 thiss!1379) (size!758 (buf!1085 thiss!1379)))))

(assert (=> d!8002 (= (bitIndex!0 (size!758 (buf!1085 thiss!1379)) (currentByte!2410 thiss!1379) (currentBit!2405 thiss!1379)) lt!40448)))

(declare-fun b!28663 () Bool)

(declare-fun res!24824 () Bool)

(assert (=> b!28663 (=> (not res!24824) (not e!19271))))

(assert (=> b!28663 (= res!24824 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!40448))))

(declare-fun b!28664 () Bool)

(declare-fun lt!40452 () (_ BitVec 64))

(assert (=> b!28664 (= e!19271 (bvsle lt!40448 (bvmul lt!40452 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!28664 (or (= lt!40452 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!40452 #b0000000000000000000000000000000000000000000000000000000000001000) lt!40452)))))

(assert (=> b!28664 (= lt!40452 ((_ sign_extend 32) (size!758 (buf!1085 thiss!1379))))))

(assert (= (and d!8002 res!24823) b!28663))

(assert (= (and b!28663 res!24824) b!28664))

(declare-fun m!41199 () Bool)

(assert (=> d!8002 m!41199))

(declare-fun m!41201 () Bool)

(assert (=> d!8002 m!41201))

(assert (=> b!28301 d!8002))

(declare-fun d!8004 () Bool)

(assert (=> d!8004 (= (head!212 (byteArrayBitContentToList!0 (_2!1618 lt!39776) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!490 (byteArrayBitContentToList!0 (_2!1618 lt!39776) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!28311 d!8004))

(declare-fun d!8006 () Bool)

(declare-fun c!1821 () Bool)

(assert (=> d!8006 (= c!1821 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!19274 () List!375)

(assert (=> d!8006 (= (byteArrayBitContentToList!0 (_2!1618 lt!39776) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!19274)))

(declare-fun b!28669 () Bool)

(assert (=> b!28669 (= e!19274 Nil!372)))

(declare-fun b!28670 () Bool)

(assert (=> b!28670 (= e!19274 (Cons!371 (not (= (bvand ((_ sign_extend 24) (select (arr!1220 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1618 lt!39776) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!8006 c!1821) b!28669))

(assert (= (and d!8006 (not c!1821)) b!28670))

(assert (=> b!28670 m!40601))

(declare-fun m!41203 () Bool)

(assert (=> b!28670 m!41203))

(declare-fun m!41205 () Bool)

(assert (=> b!28670 m!41205))

(assert (=> b!28311 d!8006))

(declare-fun d!8008 () Bool)

(assert (=> d!8008 (= (head!212 (bitStreamReadBitsIntoList!0 (_2!1618 lt!39776) (_1!1619 lt!39766) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!490 (bitStreamReadBitsIntoList!0 (_2!1618 lt!39776) (_1!1619 lt!39766) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!28311 d!8008))

(declare-fun b!28685 () Bool)

(declare-fun e!19281 () Bool)

(declare-fun lt!40495 () List!375)

(declare-fun isEmpty!71 (List!375) Bool)

(assert (=> b!28685 (= e!19281 (isEmpty!71 lt!40495))))

(declare-fun b!28686 () Bool)

(assert (=> b!28686 (= e!19281 (> (length!101 lt!40495) 0))))

(declare-fun b!28684 () Bool)

(declare-datatypes ((tuple2!3084 0))(
  ( (tuple2!3085 (_1!1629 List!375) (_2!1629 BitStream!1348)) )
))
(declare-fun e!19282 () tuple2!3084)

(declare-fun lt!40496 () (_ BitVec 64))

(declare-datatypes ((tuple2!3086 0))(
  ( (tuple2!3087 (_1!1630 Bool) (_2!1630 BitStream!1348)) )
))
(declare-fun lt!40494 () tuple2!3086)

(assert (=> b!28684 (= e!19282 (tuple2!3085 (Cons!371 (_1!1630 lt!40494) (bitStreamReadBitsIntoList!0 (_2!1618 lt!39776) (_2!1630 lt!40494) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!40496))) (_2!1630 lt!40494)))))

(declare-fun readBit!0 (BitStream!1348) tuple2!3086)

(assert (=> b!28684 (= lt!40494 (readBit!0 (_1!1619 lt!39766)))))

(assert (=> b!28684 (= lt!40496 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!28683 () Bool)

(assert (=> b!28683 (= e!19282 (tuple2!3085 Nil!372 (_1!1619 lt!39766)))))

(declare-fun d!8010 () Bool)

(assert (=> d!8010 e!19281))

(declare-fun c!1829 () Bool)

(assert (=> d!8010 (= c!1829 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!8010 (= lt!40495 (_1!1629 e!19282))))

(declare-fun c!1828 () Bool)

(assert (=> d!8010 (= c!1828 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!8010 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!8010 (= (bitStreamReadBitsIntoList!0 (_2!1618 lt!39776) (_1!1619 lt!39766) #b0000000000000000000000000000000000000000000000000000000000000001) lt!40495)))

(assert (= (and d!8010 c!1828) b!28683))

(assert (= (and d!8010 (not c!1828)) b!28684))

(assert (= (and d!8010 c!1829) b!28685))

(assert (= (and d!8010 (not c!1829)) b!28686))

(declare-fun m!41207 () Bool)

(assert (=> b!28685 m!41207))

(declare-fun m!41209 () Bool)

(assert (=> b!28686 m!41209))

(declare-fun m!41211 () Bool)

(assert (=> b!28684 m!41211))

(declare-fun m!41213 () Bool)

(assert (=> b!28684 m!41213))

(assert (=> b!28311 d!8010))

(declare-fun d!8012 () Bool)

(declare-fun e!19283 () Bool)

(assert (=> d!8012 e!19283))

(declare-fun res!24825 () Bool)

(assert (=> d!8012 (=> (not res!24825) (not e!19283))))

(declare-fun lt!40500 () (_ BitVec 64))

(declare-fun lt!40499 () (_ BitVec 64))

(declare-fun lt!40502 () (_ BitVec 64))

(assert (=> d!8012 (= res!24825 (= lt!40499 (bvsub lt!40500 lt!40502)))))

(assert (=> d!8012 (or (= (bvand lt!40500 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!40502 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!40500 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!40500 lt!40502) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!8012 (= lt!40502 (remainingBits!0 ((_ sign_extend 32) (size!758 (buf!1085 (_2!1618 lt!39776)))) ((_ sign_extend 32) (currentByte!2410 (_2!1618 lt!39776))) ((_ sign_extend 32) (currentBit!2405 (_2!1618 lt!39776)))))))

(declare-fun lt!40504 () (_ BitVec 64))

(declare-fun lt!40501 () (_ BitVec 64))

(assert (=> d!8012 (= lt!40500 (bvmul lt!40504 lt!40501))))

(assert (=> d!8012 (or (= lt!40504 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!40501 (bvsdiv (bvmul lt!40504 lt!40501) lt!40504)))))

(assert (=> d!8012 (= lt!40501 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!8012 (= lt!40504 ((_ sign_extend 32) (size!758 (buf!1085 (_2!1618 lt!39776)))))))

(assert (=> d!8012 (= lt!40499 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2410 (_2!1618 lt!39776))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2405 (_2!1618 lt!39776)))))))

(assert (=> d!8012 (invariant!0 (currentBit!2405 (_2!1618 lt!39776)) (currentByte!2410 (_2!1618 lt!39776)) (size!758 (buf!1085 (_2!1618 lt!39776))))))

(assert (=> d!8012 (= (bitIndex!0 (size!758 (buf!1085 (_2!1618 lt!39776))) (currentByte!2410 (_2!1618 lt!39776)) (currentBit!2405 (_2!1618 lt!39776))) lt!40499)))

(declare-fun b!28687 () Bool)

(declare-fun res!24826 () Bool)

(assert (=> b!28687 (=> (not res!24826) (not e!19283))))

(assert (=> b!28687 (= res!24826 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!40499))))

(declare-fun b!28688 () Bool)

(declare-fun lt!40503 () (_ BitVec 64))

(assert (=> b!28688 (= e!19283 (bvsle lt!40499 (bvmul lt!40503 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!28688 (or (= lt!40503 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!40503 #b0000000000000000000000000000000000000000000000000000000000001000) lt!40503)))))

(assert (=> b!28688 (= lt!40503 ((_ sign_extend 32) (size!758 (buf!1085 (_2!1618 lt!39776)))))))

(assert (= (and d!8012 res!24825) b!28687))

(assert (= (and b!28687 res!24826) b!28688))

(declare-fun m!41215 () Bool)

(assert (=> d!8012 m!41215))

(assert (=> d!8012 m!40555))

(assert (=> b!28313 d!8012))

(declare-fun d!8014 () Bool)

(assert (=> d!8014 (= (tail!92 lt!39770) (t!1125 lt!39770))))

(assert (=> b!28302 d!8014))

(declare-fun d!8016 () Bool)

(declare-fun e!19288 () Bool)

(assert (=> d!8016 e!19288))

(declare-fun res!24839 () Bool)

(assert (=> d!8016 (=> (not res!24839) (not e!19288))))

(declare-fun lt!40556 () (_ BitVec 64))

(assert (=> d!8016 (= res!24839 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!40556 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!40556) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!8016 (= lt!40556 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!40555 () Unit!2219)

(declare-fun choose!42 (BitStream!1348 BitStream!1348 BitStream!1348 BitStream!1348 (_ BitVec 64) List!375) Unit!2219)

(assert (=> d!8016 (= lt!40555 (choose!42 (_2!1618 lt!39778) (_2!1618 lt!39778) (_1!1619 lt!39775) (_1!1619 lt!39777) (bvsub to!314 i!635) lt!39770))))

(assert (=> d!8016 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!8016 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1618 lt!39778) (_2!1618 lt!39778) (_1!1619 lt!39775) (_1!1619 lt!39777) (bvsub to!314 i!635) lt!39770) lt!40555)))

(declare-fun b!28701 () Bool)

(assert (=> b!28701 (= e!19288 (= (bitStreamReadBitsIntoList!0 (_2!1618 lt!39778) (_1!1619 lt!39777) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!92 lt!39770)))))

(assert (= (and d!8016 res!24839) b!28701))

(declare-fun m!41217 () Bool)

(assert (=> d!8016 m!41217))

(declare-fun m!41219 () Bool)

(assert (=> b!28701 m!41219))

(assert (=> b!28701 m!40551))

(assert (=> b!28302 d!8016))

(declare-fun d!8018 () Bool)

(assert (=> d!8018 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!758 (buf!1085 thiss!1379))) ((_ sign_extend 32) (currentByte!2410 thiss!1379)) ((_ sign_extend 32) (currentBit!2405 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!758 (buf!1085 thiss!1379))) ((_ sign_extend 32) (currentByte!2410 thiss!1379)) ((_ sign_extend 32) (currentBit!2405 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2307 () Bool)

(assert (= bs!2307 d!8018))

(assert (=> bs!2307 m!41199))

(assert (=> b!28314 d!8018))

(declare-fun d!8020 () Bool)

(declare-fun res!24842 () Bool)

(declare-fun e!19292 () Bool)

(assert (=> d!8020 (=> (not res!24842) (not e!19292))))

(assert (=> d!8020 (= res!24842 (= (size!758 (buf!1085 thiss!1379)) (size!758 (buf!1085 (_2!1618 lt!39776)))))))

(assert (=> d!8020 (= (isPrefixOf!0 thiss!1379 (_2!1618 lt!39776)) e!19292)))

(declare-fun b!28704 () Bool)

(declare-fun res!24844 () Bool)

(assert (=> b!28704 (=> (not res!24844) (not e!19292))))

(assert (=> b!28704 (= res!24844 (bvsle (bitIndex!0 (size!758 (buf!1085 thiss!1379)) (currentByte!2410 thiss!1379) (currentBit!2405 thiss!1379)) (bitIndex!0 (size!758 (buf!1085 (_2!1618 lt!39776))) (currentByte!2410 (_2!1618 lt!39776)) (currentBit!2405 (_2!1618 lt!39776)))))))

(declare-fun b!28705 () Bool)

(declare-fun e!19291 () Bool)

(assert (=> b!28705 (= e!19292 e!19291)))

(declare-fun res!24843 () Bool)

(assert (=> b!28705 (=> res!24843 e!19291)))

(assert (=> b!28705 (= res!24843 (= (size!758 (buf!1085 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!28706 () Bool)

(assert (=> b!28706 (= e!19291 (arrayBitRangesEq!0 (buf!1085 thiss!1379) (buf!1085 (_2!1618 lt!39776)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!758 (buf!1085 thiss!1379)) (currentByte!2410 thiss!1379) (currentBit!2405 thiss!1379))))))

(assert (= (and d!8020 res!24842) b!28704))

(assert (= (and b!28704 res!24844) b!28705))

(assert (= (and b!28705 (not res!24843)) b!28706))

(assert (=> b!28704 m!40579))

(assert (=> b!28704 m!40557))

(assert (=> b!28706 m!40579))

(assert (=> b!28706 m!40579))

(declare-fun m!41221 () Bool)

(assert (=> b!28706 m!41221))

(assert (=> b!28303 d!8020))

(declare-fun d!8022 () Bool)

(assert (=> d!8022 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!758 (buf!1085 (_2!1618 lt!39776)))) ((_ sign_extend 32) (currentByte!2410 (_2!1618 lt!39776))) ((_ sign_extend 32) (currentBit!2405 (_2!1618 lt!39776))) lt!39780) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!758 (buf!1085 (_2!1618 lt!39776)))) ((_ sign_extend 32) (currentByte!2410 (_2!1618 lt!39776))) ((_ sign_extend 32) (currentBit!2405 (_2!1618 lt!39776)))) lt!39780))))

(declare-fun bs!2308 () Bool)

(assert (= bs!2308 d!8022))

(assert (=> bs!2308 m!41215))

(assert (=> b!28303 d!8022))

(declare-fun d!8024 () Bool)

(declare-fun e!19295 () Bool)

(assert (=> d!8024 e!19295))

(declare-fun res!24847 () Bool)

(assert (=> d!8024 (=> (not res!24847) (not e!19295))))

(assert (=> d!8024 (= res!24847 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!40565 () Unit!2219)

(declare-fun choose!27 (BitStream!1348 BitStream!1348 (_ BitVec 64) (_ BitVec 64)) Unit!2219)

(assert (=> d!8024 (= lt!40565 (choose!27 thiss!1379 (_2!1618 lt!39776) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!8024 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!8024 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1618 lt!39776) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!40565)))

(declare-fun b!28709 () Bool)

(assert (=> b!28709 (= e!19295 (validate_offset_bits!1 ((_ sign_extend 32) (size!758 (buf!1085 (_2!1618 lt!39776)))) ((_ sign_extend 32) (currentByte!2410 (_2!1618 lt!39776))) ((_ sign_extend 32) (currentBit!2405 (_2!1618 lt!39776))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!8024 res!24847) b!28709))

(declare-fun m!41223 () Bool)

(assert (=> d!8024 m!41223))

(declare-fun m!41225 () Bool)

(assert (=> b!28709 m!41225))

(assert (=> b!28303 d!8024))

(declare-fun d!8026 () Bool)

(declare-fun e!19318 () Bool)

(assert (=> d!8026 e!19318))

(declare-fun res!24882 () Bool)

(assert (=> d!8026 (=> (not res!24882) (not e!19318))))

(declare-fun lt!40657 () tuple2!3062)

(assert (=> d!8026 (= res!24882 (= (size!758 (buf!1085 (_2!1618 lt!40657))) (size!758 (buf!1085 thiss!1379))))))

(declare-fun lt!40659 () (_ BitVec 8))

(declare-fun lt!40658 () array!1751)

(assert (=> d!8026 (= lt!40659 (select (arr!1220 lt!40658) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!8026 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!758 lt!40658)))))

(assert (=> d!8026 (= lt!40658 (array!1752 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!40652 () tuple2!3062)

(assert (=> d!8026 (= lt!40657 (tuple2!3063 (_1!1618 lt!40652) (_2!1618 lt!40652)))))

(declare-fun lt!40654 () tuple2!3062)

(assert (=> d!8026 (= lt!40652 lt!40654)))

(declare-fun e!19316 () Bool)

(assert (=> d!8026 e!19316))

(declare-fun res!24887 () Bool)

(assert (=> d!8026 (=> (not res!24887) (not e!19316))))

(assert (=> d!8026 (= res!24887 (= (size!758 (buf!1085 thiss!1379)) (size!758 (buf!1085 (_2!1618 lt!40654)))))))

(declare-fun lt!40656 () Bool)

(declare-fun appendBit!0 (BitStream!1348 Bool) tuple2!3062)

(assert (=> d!8026 (= lt!40654 (appendBit!0 thiss!1379 lt!40656))))

(assert (=> d!8026 (= lt!40656 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1220 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!8026 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!8026 (= (appendBitFromByte!0 thiss!1379 (select (arr!1220 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!40657)))

(declare-fun b!28746 () Bool)

(declare-fun e!19315 () Bool)

(declare-datatypes ((tuple2!3088 0))(
  ( (tuple2!3089 (_1!1631 BitStream!1348) (_2!1631 Bool)) )
))
(declare-fun lt!40653 () tuple2!3088)

(assert (=> b!28746 (= e!19315 (= (bitIndex!0 (size!758 (buf!1085 (_1!1631 lt!40653))) (currentByte!2410 (_1!1631 lt!40653)) (currentBit!2405 (_1!1631 lt!40653))) (bitIndex!0 (size!758 (buf!1085 (_2!1618 lt!40654))) (currentByte!2410 (_2!1618 lt!40654)) (currentBit!2405 (_2!1618 lt!40654)))))))

(declare-fun b!28747 () Bool)

(assert (=> b!28747 (= e!19316 e!19315)))

(declare-fun res!24888 () Bool)

(assert (=> b!28747 (=> (not res!24888) (not e!19315))))

(assert (=> b!28747 (= res!24888 (and (= (_2!1631 lt!40653) lt!40656) (= (_1!1631 lt!40653) (_2!1618 lt!40654))))))

(declare-fun readBitPure!0 (BitStream!1348) tuple2!3088)

(declare-fun readerFrom!0 (BitStream!1348 (_ BitVec 32) (_ BitVec 32)) BitStream!1348)

(assert (=> b!28747 (= lt!40653 (readBitPure!0 (readerFrom!0 (_2!1618 lt!40654) (currentBit!2405 thiss!1379) (currentByte!2410 thiss!1379))))))

(declare-fun b!28748 () Bool)

(declare-fun e!19317 () Bool)

(assert (=> b!28748 (= e!19318 e!19317)))

(declare-fun res!24881 () Bool)

(assert (=> b!28748 (=> (not res!24881) (not e!19317))))

(declare-fun lt!40660 () tuple2!3088)

(assert (=> b!28748 (= res!24881 (and (= (_2!1631 lt!40660) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1220 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!40659)) #b00000000000000000000000000000000))) (= (_1!1631 lt!40660) (_2!1618 lt!40657))))))

(declare-fun lt!40663 () tuple2!3082)

(declare-fun lt!40662 () BitStream!1348)

(assert (=> b!28748 (= lt!40663 (readBits!0 lt!40662 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!28748 (= lt!40660 (readBitPure!0 lt!40662))))

(assert (=> b!28748 (= lt!40662 (readerFrom!0 (_2!1618 lt!40657) (currentBit!2405 thiss!1379) (currentByte!2410 thiss!1379)))))

(declare-fun b!28749 () Bool)

(assert (=> b!28749 (= e!19317 (= (bitIndex!0 (size!758 (buf!1085 (_1!1631 lt!40660))) (currentByte!2410 (_1!1631 lt!40660)) (currentBit!2405 (_1!1631 lt!40660))) (bitIndex!0 (size!758 (buf!1085 (_2!1618 lt!40657))) (currentByte!2410 (_2!1618 lt!40657)) (currentBit!2405 (_2!1618 lt!40657)))))))

(declare-fun b!28750 () Bool)

(declare-fun res!24883 () Bool)

(assert (=> b!28750 (=> (not res!24883) (not e!19318))))

(declare-fun lt!40655 () (_ BitVec 64))

(declare-fun lt!40661 () (_ BitVec 64))

(assert (=> b!28750 (= res!24883 (= (bitIndex!0 (size!758 (buf!1085 (_2!1618 lt!40657))) (currentByte!2410 (_2!1618 lt!40657)) (currentBit!2405 (_2!1618 lt!40657))) (bvadd lt!40655 lt!40661)))))

(assert (=> b!28750 (or (not (= (bvand lt!40655 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!40661 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!40655 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!40655 lt!40661) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!28750 (= lt!40661 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!28750 (= lt!40655 (bitIndex!0 (size!758 (buf!1085 thiss!1379)) (currentByte!2410 thiss!1379) (currentBit!2405 thiss!1379)))))

(declare-fun b!28751 () Bool)

(declare-fun res!24884 () Bool)

(assert (=> b!28751 (=> (not res!24884) (not e!19316))))

(assert (=> b!28751 (= res!24884 (isPrefixOf!0 thiss!1379 (_2!1618 lt!40654)))))

(declare-fun b!28752 () Bool)

(declare-fun res!24886 () Bool)

(assert (=> b!28752 (=> (not res!24886) (not e!19316))))

(assert (=> b!28752 (= res!24886 (= (bitIndex!0 (size!758 (buf!1085 (_2!1618 lt!40654))) (currentByte!2410 (_2!1618 lt!40654)) (currentBit!2405 (_2!1618 lt!40654))) (bvadd (bitIndex!0 (size!758 (buf!1085 thiss!1379)) (currentByte!2410 thiss!1379) (currentBit!2405 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!28753 () Bool)

(declare-fun res!24885 () Bool)

(assert (=> b!28753 (=> (not res!24885) (not e!19318))))

(assert (=> b!28753 (= res!24885 (isPrefixOf!0 thiss!1379 (_2!1618 lt!40657)))))

(assert (= (and d!8026 res!24887) b!28752))

(assert (= (and b!28752 res!24886) b!28751))

(assert (= (and b!28751 res!24884) b!28747))

(assert (= (and b!28747 res!24888) b!28746))

(assert (= (and d!8026 res!24882) b!28750))

(assert (= (and b!28750 res!24883) b!28753))

(assert (= (and b!28753 res!24885) b!28748))

(assert (= (and b!28748 res!24881) b!28749))

(declare-fun m!41333 () Bool)

(assert (=> d!8026 m!41333))

(declare-fun m!41335 () Bool)

(assert (=> d!8026 m!41335))

(assert (=> d!8026 m!41203))

(declare-fun m!41337 () Bool)

(assert (=> b!28746 m!41337))

(declare-fun m!41339 () Bool)

(assert (=> b!28746 m!41339))

(assert (=> b!28752 m!41339))

(assert (=> b!28752 m!40579))

(declare-fun m!41341 () Bool)

(assert (=> b!28747 m!41341))

(assert (=> b!28747 m!41341))

(declare-fun m!41343 () Bool)

(assert (=> b!28747 m!41343))

(declare-fun m!41345 () Bool)

(assert (=> b!28753 m!41345))

(declare-fun m!41347 () Bool)

(assert (=> b!28750 m!41347))

(assert (=> b!28750 m!40579))

(declare-fun m!41349 () Bool)

(assert (=> b!28751 m!41349))

(declare-fun m!41351 () Bool)

(assert (=> b!28748 m!41351))

(declare-fun m!41353 () Bool)

(assert (=> b!28748 m!41353))

(declare-fun m!41355 () Bool)

(assert (=> b!28748 m!41355))

(declare-fun m!41357 () Bool)

(assert (=> b!28749 m!41357))

(assert (=> b!28749 m!41347))

(assert (=> b!28303 d!8026))

(declare-fun d!8054 () Bool)

(assert (=> d!8054 (= (invariant!0 (currentBit!2405 (_2!1618 lt!39778)) (currentByte!2410 (_2!1618 lt!39778)) (size!758 (buf!1085 (_2!1618 lt!39778)))) (and (bvsge (currentBit!2405 (_2!1618 lt!39778)) #b00000000000000000000000000000000) (bvslt (currentBit!2405 (_2!1618 lt!39778)) #b00000000000000000000000000001000) (bvsge (currentByte!2410 (_2!1618 lt!39778)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2410 (_2!1618 lt!39778)) (size!758 (buf!1085 (_2!1618 lt!39778)))) (and (= (currentBit!2405 (_2!1618 lt!39778)) #b00000000000000000000000000000000) (= (currentByte!2410 (_2!1618 lt!39778)) (size!758 (buf!1085 (_2!1618 lt!39778))))))))))

(assert (=> b!28305 d!8054))

(declare-fun d!8056 () Bool)

(declare-fun size!761 (List!375) Int)

(assert (=> d!8056 (= (length!101 lt!39770) (size!761 lt!39770))))

(declare-fun bs!2316 () Bool)

(assert (= bs!2316 d!8056))

(declare-fun m!41359 () Bool)

(assert (=> bs!2316 m!41359))

(assert (=> b!28315 d!8056))

(declare-fun d!8058 () Bool)

(assert (=> d!8058 (= (array_inv!727 (buf!1085 thiss!1379)) (bvsge (size!758 (buf!1085 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!28306 d!8058))

(declare-fun d!8060 () Bool)

(assert (=> d!8060 (= (array_inv!727 srcBuffer!2) (bvsge (size!758 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!6014 d!8060))

(declare-fun d!8062 () Bool)

(assert (=> d!8062 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2405 thiss!1379) (currentByte!2410 thiss!1379) (size!758 (buf!1085 thiss!1379))))))

(declare-fun bs!2317 () Bool)

(assert (= bs!2317 d!8062))

(assert (=> bs!2317 m!41201))

(assert (=> start!6014 d!8062))

(declare-fun d!8064 () Bool)

(declare-fun e!19319 () Bool)

(assert (=> d!8064 e!19319))

(declare-fun res!24889 () Bool)

(assert (=> d!8064 (=> (not res!24889) (not e!19319))))

(declare-fun lt!40664 () (_ BitVec 64))

(declare-fun lt!40667 () (_ BitVec 64))

(declare-fun lt!40665 () (_ BitVec 64))

(assert (=> d!8064 (= res!24889 (= lt!40664 (bvsub lt!40665 lt!40667)))))

(assert (=> d!8064 (or (= (bvand lt!40665 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!40667 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!40665 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!40665 lt!40667) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!8064 (= lt!40667 (remainingBits!0 ((_ sign_extend 32) (size!758 (buf!1085 (_2!1618 lt!39778)))) ((_ sign_extend 32) (currentByte!2410 (_2!1618 lt!39778))) ((_ sign_extend 32) (currentBit!2405 (_2!1618 lt!39778)))))))

(declare-fun lt!40669 () (_ BitVec 64))

(declare-fun lt!40666 () (_ BitVec 64))

(assert (=> d!8064 (= lt!40665 (bvmul lt!40669 lt!40666))))

(assert (=> d!8064 (or (= lt!40669 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!40666 (bvsdiv (bvmul lt!40669 lt!40666) lt!40669)))))

(assert (=> d!8064 (= lt!40666 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!8064 (= lt!40669 ((_ sign_extend 32) (size!758 (buf!1085 (_2!1618 lt!39778)))))))

(assert (=> d!8064 (= lt!40664 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2410 (_2!1618 lt!39778))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2405 (_2!1618 lt!39778)))))))

(assert (=> d!8064 (invariant!0 (currentBit!2405 (_2!1618 lt!39778)) (currentByte!2410 (_2!1618 lt!39778)) (size!758 (buf!1085 (_2!1618 lt!39778))))))

(assert (=> d!8064 (= (bitIndex!0 (size!758 (buf!1085 (_2!1618 lt!39778))) (currentByte!2410 (_2!1618 lt!39778)) (currentBit!2405 (_2!1618 lt!39778))) lt!40664)))

(declare-fun b!28754 () Bool)

(declare-fun res!24890 () Bool)

(assert (=> b!28754 (=> (not res!24890) (not e!19319))))

(assert (=> b!28754 (= res!24890 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!40664))))

(declare-fun b!28755 () Bool)

(declare-fun lt!40668 () (_ BitVec 64))

(assert (=> b!28755 (= e!19319 (bvsle lt!40664 (bvmul lt!40668 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!28755 (or (= lt!40668 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!40668 #b0000000000000000000000000000000000000000000000000000000000001000) lt!40668)))))

(assert (=> b!28755 (= lt!40668 ((_ sign_extend 32) (size!758 (buf!1085 (_2!1618 lt!39778)))))))

(assert (= (and d!8064 res!24889) b!28754))

(assert (= (and b!28754 res!24890) b!28755))

(declare-fun m!41361 () Bool)

(assert (=> d!8064 m!41361))

(assert (=> d!8064 m!40533))

(assert (=> b!28308 d!8064))

(declare-fun d!8066 () Bool)

(assert (=> d!8066 (validate_offset_bits!1 ((_ sign_extend 32) (size!758 (buf!1085 (_2!1618 lt!39778)))) ((_ sign_extend 32) (currentByte!2410 thiss!1379)) ((_ sign_extend 32) (currentBit!2405 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!40670 () Unit!2219)

(assert (=> d!8066 (= lt!40670 (choose!9 thiss!1379 (buf!1085 (_2!1618 lt!39778)) (bvsub to!314 i!635) (BitStream!1349 (buf!1085 (_2!1618 lt!39778)) (currentByte!2410 thiss!1379) (currentBit!2405 thiss!1379))))))

(assert (=> d!8066 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1085 (_2!1618 lt!39778)) (bvsub to!314 i!635)) lt!40670)))

(declare-fun bs!2318 () Bool)

(assert (= bs!2318 d!8066))

(assert (=> bs!2318 m!40589))

(declare-fun m!41363 () Bool)

(assert (=> bs!2318 m!41363))

(assert (=> b!28307 d!8066))

(declare-fun lt!40690 () (_ BitVec 64))

(declare-fun lt!40675 () tuple2!3064)

(declare-fun b!28756 () Bool)

(declare-fun lt!40676 () (_ BitVec 64))

(declare-fun e!19320 () Bool)

(assert (=> b!28756 (= e!19320 (= (_1!1619 lt!40675) (withMovedBitIndex!0 (_2!1619 lt!40675) (bvsub lt!40676 lt!40690))))))

(assert (=> b!28756 (or (= (bvand lt!40676 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!40690 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!40676 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!40676 lt!40690) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!28756 (= lt!40690 (bitIndex!0 (size!758 (buf!1085 (_2!1618 lt!39778))) (currentByte!2410 (_2!1618 lt!39778)) (currentBit!2405 (_2!1618 lt!39778))))))

(assert (=> b!28756 (= lt!40676 (bitIndex!0 (size!758 (buf!1085 (_2!1618 lt!39776))) (currentByte!2410 (_2!1618 lt!39776)) (currentBit!2405 (_2!1618 lt!39776))))))

(declare-fun b!28757 () Bool)

(declare-fun e!19321 () Unit!2219)

(declare-fun lt!40680 () Unit!2219)

(assert (=> b!28757 (= e!19321 lt!40680)))

(declare-fun lt!40683 () (_ BitVec 64))

(assert (=> b!28757 (= lt!40683 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!40684 () (_ BitVec 64))

(assert (=> b!28757 (= lt!40684 (bitIndex!0 (size!758 (buf!1085 (_2!1618 lt!39776))) (currentByte!2410 (_2!1618 lt!39776)) (currentBit!2405 (_2!1618 lt!39776))))))

(assert (=> b!28757 (= lt!40680 (arrayBitRangesEqSymmetric!0 (buf!1085 (_2!1618 lt!39776)) (buf!1085 (_2!1618 lt!39778)) lt!40683 lt!40684))))

(assert (=> b!28757 (arrayBitRangesEq!0 (buf!1085 (_2!1618 lt!39778)) (buf!1085 (_2!1618 lt!39776)) lt!40683 lt!40684)))

(declare-fun b!28758 () Bool)

(declare-fun res!24893 () Bool)

(assert (=> b!28758 (=> (not res!24893) (not e!19320))))

(assert (=> b!28758 (= res!24893 (isPrefixOf!0 (_2!1619 lt!40675) (_2!1618 lt!39778)))))

(declare-fun d!8068 () Bool)

(assert (=> d!8068 e!19320))

(declare-fun res!24892 () Bool)

(assert (=> d!8068 (=> (not res!24892) (not e!19320))))

(assert (=> d!8068 (= res!24892 (isPrefixOf!0 (_1!1619 lt!40675) (_2!1619 lt!40675)))))

(declare-fun lt!40688 () BitStream!1348)

(assert (=> d!8068 (= lt!40675 (tuple2!3065 lt!40688 (_2!1618 lt!39778)))))

(declare-fun lt!40687 () Unit!2219)

(declare-fun lt!40674 () Unit!2219)

(assert (=> d!8068 (= lt!40687 lt!40674)))

(assert (=> d!8068 (isPrefixOf!0 lt!40688 (_2!1618 lt!39778))))

(assert (=> d!8068 (= lt!40674 (lemmaIsPrefixTransitive!0 lt!40688 (_2!1618 lt!39778) (_2!1618 lt!39778)))))

(declare-fun lt!40685 () Unit!2219)

(declare-fun lt!40678 () Unit!2219)

(assert (=> d!8068 (= lt!40685 lt!40678)))

(assert (=> d!8068 (isPrefixOf!0 lt!40688 (_2!1618 lt!39778))))

(assert (=> d!8068 (= lt!40678 (lemmaIsPrefixTransitive!0 lt!40688 (_2!1618 lt!39776) (_2!1618 lt!39778)))))

(declare-fun lt!40673 () Unit!2219)

(assert (=> d!8068 (= lt!40673 e!19321)))

(declare-fun c!1831 () Bool)

(assert (=> d!8068 (= c!1831 (not (= (size!758 (buf!1085 (_2!1618 lt!39776))) #b00000000000000000000000000000000)))))

(declare-fun lt!40681 () Unit!2219)

(declare-fun lt!40689 () Unit!2219)

(assert (=> d!8068 (= lt!40681 lt!40689)))

(assert (=> d!8068 (isPrefixOf!0 (_2!1618 lt!39778) (_2!1618 lt!39778))))

(assert (=> d!8068 (= lt!40689 (lemmaIsPrefixRefl!0 (_2!1618 lt!39778)))))

(declare-fun lt!40686 () Unit!2219)

(declare-fun lt!40672 () Unit!2219)

(assert (=> d!8068 (= lt!40686 lt!40672)))

(assert (=> d!8068 (= lt!40672 (lemmaIsPrefixRefl!0 (_2!1618 lt!39778)))))

(declare-fun lt!40679 () Unit!2219)

(declare-fun lt!40682 () Unit!2219)

(assert (=> d!8068 (= lt!40679 lt!40682)))

(assert (=> d!8068 (isPrefixOf!0 lt!40688 lt!40688)))

(assert (=> d!8068 (= lt!40682 (lemmaIsPrefixRefl!0 lt!40688))))

(declare-fun lt!40677 () Unit!2219)

(declare-fun lt!40671 () Unit!2219)

(assert (=> d!8068 (= lt!40677 lt!40671)))

(assert (=> d!8068 (isPrefixOf!0 (_2!1618 lt!39776) (_2!1618 lt!39776))))

(assert (=> d!8068 (= lt!40671 (lemmaIsPrefixRefl!0 (_2!1618 lt!39776)))))

(assert (=> d!8068 (= lt!40688 (BitStream!1349 (buf!1085 (_2!1618 lt!39778)) (currentByte!2410 (_2!1618 lt!39776)) (currentBit!2405 (_2!1618 lt!39776))))))

(assert (=> d!8068 (isPrefixOf!0 (_2!1618 lt!39776) (_2!1618 lt!39778))))

(assert (=> d!8068 (= (reader!0 (_2!1618 lt!39776) (_2!1618 lt!39778)) lt!40675)))

(declare-fun b!28759 () Bool)

(declare-fun Unit!2243 () Unit!2219)

(assert (=> b!28759 (= e!19321 Unit!2243)))

(declare-fun b!28760 () Bool)

(declare-fun res!24891 () Bool)

(assert (=> b!28760 (=> (not res!24891) (not e!19320))))

(assert (=> b!28760 (= res!24891 (isPrefixOf!0 (_1!1619 lt!40675) (_2!1618 lt!39776)))))

(assert (= (and d!8068 c!1831) b!28757))

(assert (= (and d!8068 (not c!1831)) b!28759))

(assert (= (and d!8068 res!24892) b!28760))

(assert (= (and b!28760 res!24891) b!28758))

(assert (= (and b!28758 res!24893) b!28756))

(declare-fun m!41365 () Bool)

(assert (=> b!28758 m!41365))

(declare-fun m!41367 () Bool)

(assert (=> d!8068 m!41367))

(declare-fun m!41369 () Bool)

(assert (=> d!8068 m!41369))

(declare-fun m!41371 () Bool)

(assert (=> d!8068 m!41371))

(assert (=> d!8068 m!40547))

(declare-fun m!41373 () Bool)

(assert (=> d!8068 m!41373))

(declare-fun m!41375 () Bool)

(assert (=> d!8068 m!41375))

(declare-fun m!41377 () Bool)

(assert (=> d!8068 m!41377))

(declare-fun m!41379 () Bool)

(assert (=> d!8068 m!41379))

(assert (=> d!8068 m!41093))

(declare-fun m!41381 () Bool)

(assert (=> d!8068 m!41381))

(assert (=> d!8068 m!41095))

(assert (=> b!28757 m!40557))

(declare-fun m!41383 () Bool)

(assert (=> b!28757 m!41383))

(declare-fun m!41385 () Bool)

(assert (=> b!28757 m!41385))

(declare-fun m!41387 () Bool)

(assert (=> b!28760 m!41387))

(declare-fun m!41389 () Bool)

(assert (=> b!28756 m!41389))

(assert (=> b!28756 m!40599))

(assert (=> b!28756 m!40557))

(assert (=> b!28307 d!8068))

(declare-fun b!28763 () Bool)

(declare-fun e!19322 () Bool)

(declare-fun lt!40692 () List!375)

(assert (=> b!28763 (= e!19322 (isEmpty!71 lt!40692))))

(declare-fun b!28764 () Bool)

(assert (=> b!28764 (= e!19322 (> (length!101 lt!40692) 0))))

(declare-fun b!28762 () Bool)

(declare-fun e!19323 () tuple2!3084)

(declare-fun lt!40691 () tuple2!3086)

(declare-fun lt!40693 () (_ BitVec 64))

(assert (=> b!28762 (= e!19323 (tuple2!3085 (Cons!371 (_1!1630 lt!40691) (bitStreamReadBitsIntoList!0 (_2!1618 lt!39778) (_2!1630 lt!40691) (bvsub lt!39780 lt!40693))) (_2!1630 lt!40691)))))

(assert (=> b!28762 (= lt!40691 (readBit!0 (_1!1619 lt!39777)))))

(assert (=> b!28762 (= lt!40693 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!28761 () Bool)

(assert (=> b!28761 (= e!19323 (tuple2!3085 Nil!372 (_1!1619 lt!39777)))))

(declare-fun d!8070 () Bool)

(assert (=> d!8070 e!19322))

(declare-fun c!1833 () Bool)

(assert (=> d!8070 (= c!1833 (= lt!39780 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!8070 (= lt!40692 (_1!1629 e!19323))))

(declare-fun c!1832 () Bool)

(assert (=> d!8070 (= c!1832 (= lt!39780 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!8070 (bvsge lt!39780 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!8070 (= (bitStreamReadBitsIntoList!0 (_2!1618 lt!39778) (_1!1619 lt!39777) lt!39780) lt!40692)))

(assert (= (and d!8070 c!1832) b!28761))

(assert (= (and d!8070 (not c!1832)) b!28762))

(assert (= (and d!8070 c!1833) b!28763))

(assert (= (and d!8070 (not c!1833)) b!28764))

(declare-fun m!41391 () Bool)

(assert (=> b!28763 m!41391))

(declare-fun m!41393 () Bool)

(assert (=> b!28764 m!41393))

(declare-fun m!41395 () Bool)

(assert (=> b!28762 m!41395))

(declare-fun m!41397 () Bool)

(assert (=> b!28762 m!41397))

(assert (=> b!28307 d!8070))

(declare-fun d!8072 () Bool)

(assert (=> d!8072 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!758 (buf!1085 (_2!1618 lt!39778)))) ((_ sign_extend 32) (currentByte!2410 thiss!1379)) ((_ sign_extend 32) (currentBit!2405 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!758 (buf!1085 (_2!1618 lt!39778)))) ((_ sign_extend 32) (currentByte!2410 thiss!1379)) ((_ sign_extend 32) (currentBit!2405 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2319 () Bool)

(assert (= bs!2319 d!8072))

(declare-fun m!41399 () Bool)

(assert (=> bs!2319 m!41399))

(assert (=> b!28307 d!8072))

(declare-fun b!28767 () Bool)

(declare-fun e!19324 () Bool)

(declare-fun lt!40695 () List!375)

(assert (=> b!28767 (= e!19324 (isEmpty!71 lt!40695))))

(declare-fun b!28768 () Bool)

(assert (=> b!28768 (= e!19324 (> (length!101 lt!40695) 0))))

(declare-fun e!19325 () tuple2!3084)

(declare-fun lt!40694 () tuple2!3086)

(declare-fun b!28766 () Bool)

(declare-fun lt!40696 () (_ BitVec 64))

(assert (=> b!28766 (= e!19325 (tuple2!3085 (Cons!371 (_1!1630 lt!40694) (bitStreamReadBitsIntoList!0 (_2!1618 lt!39778) (_2!1630 lt!40694) (bvsub (bvsub to!314 i!635) lt!40696))) (_2!1630 lt!40694)))))

(assert (=> b!28766 (= lt!40694 (readBit!0 (_1!1619 lt!39775)))))

(assert (=> b!28766 (= lt!40696 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!28765 () Bool)

(assert (=> b!28765 (= e!19325 (tuple2!3085 Nil!372 (_1!1619 lt!39775)))))

(declare-fun d!8074 () Bool)

(assert (=> d!8074 e!19324))

(declare-fun c!1835 () Bool)

(assert (=> d!8074 (= c!1835 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!8074 (= lt!40695 (_1!1629 e!19325))))

(declare-fun c!1834 () Bool)

(assert (=> d!8074 (= c!1834 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!8074 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!8074 (= (bitStreamReadBitsIntoList!0 (_2!1618 lt!39778) (_1!1619 lt!39775) (bvsub to!314 i!635)) lt!40695)))

(assert (= (and d!8074 c!1834) b!28765))

(assert (= (and d!8074 (not c!1834)) b!28766))

(assert (= (and d!8074 c!1835) b!28767))

(assert (= (and d!8074 (not c!1835)) b!28768))

(declare-fun m!41401 () Bool)

(assert (=> b!28767 m!41401))

(declare-fun m!41403 () Bool)

(assert (=> b!28768 m!41403))

(declare-fun m!41405 () Bool)

(assert (=> b!28766 m!41405))

(declare-fun m!41407 () Bool)

(assert (=> b!28766 m!41407))

(assert (=> b!28307 d!8074))

(declare-fun d!8076 () Bool)

(assert (=> d!8076 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!758 (buf!1085 (_2!1618 lt!39778)))) ((_ sign_extend 32) (currentByte!2410 (_2!1618 lt!39776))) ((_ sign_extend 32) (currentBit!2405 (_2!1618 lt!39776))) lt!39780) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!758 (buf!1085 (_2!1618 lt!39778)))) ((_ sign_extend 32) (currentByte!2410 (_2!1618 lt!39776))) ((_ sign_extend 32) (currentBit!2405 (_2!1618 lt!39776)))) lt!39780))))

(declare-fun bs!2320 () Bool)

(assert (= bs!2320 d!8076))

(declare-fun m!41409 () Bool)

(assert (=> bs!2320 m!41409))

(assert (=> b!28307 d!8076))

(declare-fun d!8078 () Bool)

(assert (=> d!8078 (validate_offset_bits!1 ((_ sign_extend 32) (size!758 (buf!1085 (_2!1618 lt!39778)))) ((_ sign_extend 32) (currentByte!2410 (_2!1618 lt!39776))) ((_ sign_extend 32) (currentBit!2405 (_2!1618 lt!39776))) lt!39780)))

(declare-fun lt!40697 () Unit!2219)

(assert (=> d!8078 (= lt!40697 (choose!9 (_2!1618 lt!39776) (buf!1085 (_2!1618 lt!39778)) lt!39780 (BitStream!1349 (buf!1085 (_2!1618 lt!39778)) (currentByte!2410 (_2!1618 lt!39776)) (currentBit!2405 (_2!1618 lt!39776)))))))

(assert (=> d!8078 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1618 lt!39776) (buf!1085 (_2!1618 lt!39778)) lt!39780) lt!40697)))

(declare-fun bs!2321 () Bool)

(assert (= bs!2321 d!8078))

(assert (=> bs!2321 m!40587))

(declare-fun m!41411 () Bool)

(assert (=> bs!2321 m!41411))

(assert (=> b!28307 d!8078))

(declare-fun b!28769 () Bool)

(declare-fun e!19326 () Bool)

(declare-fun lt!40702 () tuple2!3064)

(declare-fun lt!40703 () (_ BitVec 64))

(declare-fun lt!40717 () (_ BitVec 64))

(assert (=> b!28769 (= e!19326 (= (_1!1619 lt!40702) (withMovedBitIndex!0 (_2!1619 lt!40702) (bvsub lt!40703 lt!40717))))))

(assert (=> b!28769 (or (= (bvand lt!40703 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!40717 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!40703 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!40703 lt!40717) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!28769 (= lt!40717 (bitIndex!0 (size!758 (buf!1085 (_2!1618 lt!39778))) (currentByte!2410 (_2!1618 lt!39778)) (currentBit!2405 (_2!1618 lt!39778))))))

(assert (=> b!28769 (= lt!40703 (bitIndex!0 (size!758 (buf!1085 thiss!1379)) (currentByte!2410 thiss!1379) (currentBit!2405 thiss!1379)))))

(declare-fun b!28770 () Bool)

(declare-fun e!19327 () Unit!2219)

(declare-fun lt!40707 () Unit!2219)

(assert (=> b!28770 (= e!19327 lt!40707)))

(declare-fun lt!40710 () (_ BitVec 64))

(assert (=> b!28770 (= lt!40710 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!40711 () (_ BitVec 64))

(assert (=> b!28770 (= lt!40711 (bitIndex!0 (size!758 (buf!1085 thiss!1379)) (currentByte!2410 thiss!1379) (currentBit!2405 thiss!1379)))))

(assert (=> b!28770 (= lt!40707 (arrayBitRangesEqSymmetric!0 (buf!1085 thiss!1379) (buf!1085 (_2!1618 lt!39778)) lt!40710 lt!40711))))

(assert (=> b!28770 (arrayBitRangesEq!0 (buf!1085 (_2!1618 lt!39778)) (buf!1085 thiss!1379) lt!40710 lt!40711)))

(declare-fun b!28771 () Bool)

(declare-fun res!24896 () Bool)

(assert (=> b!28771 (=> (not res!24896) (not e!19326))))

(assert (=> b!28771 (= res!24896 (isPrefixOf!0 (_2!1619 lt!40702) (_2!1618 lt!39778)))))

(declare-fun d!8080 () Bool)

(assert (=> d!8080 e!19326))

(declare-fun res!24895 () Bool)

(assert (=> d!8080 (=> (not res!24895) (not e!19326))))

(assert (=> d!8080 (= res!24895 (isPrefixOf!0 (_1!1619 lt!40702) (_2!1619 lt!40702)))))

(declare-fun lt!40715 () BitStream!1348)

(assert (=> d!8080 (= lt!40702 (tuple2!3065 lt!40715 (_2!1618 lt!39778)))))

(declare-fun lt!40714 () Unit!2219)

(declare-fun lt!40701 () Unit!2219)

(assert (=> d!8080 (= lt!40714 lt!40701)))

(assert (=> d!8080 (isPrefixOf!0 lt!40715 (_2!1618 lt!39778))))

(assert (=> d!8080 (= lt!40701 (lemmaIsPrefixTransitive!0 lt!40715 (_2!1618 lt!39778) (_2!1618 lt!39778)))))

(declare-fun lt!40712 () Unit!2219)

(declare-fun lt!40705 () Unit!2219)

(assert (=> d!8080 (= lt!40712 lt!40705)))

(assert (=> d!8080 (isPrefixOf!0 lt!40715 (_2!1618 lt!39778))))

(assert (=> d!8080 (= lt!40705 (lemmaIsPrefixTransitive!0 lt!40715 thiss!1379 (_2!1618 lt!39778)))))

(declare-fun lt!40700 () Unit!2219)

(assert (=> d!8080 (= lt!40700 e!19327)))

(declare-fun c!1836 () Bool)

(assert (=> d!8080 (= c!1836 (not (= (size!758 (buf!1085 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!40708 () Unit!2219)

(declare-fun lt!40716 () Unit!2219)

(assert (=> d!8080 (= lt!40708 lt!40716)))

(assert (=> d!8080 (isPrefixOf!0 (_2!1618 lt!39778) (_2!1618 lt!39778))))

(assert (=> d!8080 (= lt!40716 (lemmaIsPrefixRefl!0 (_2!1618 lt!39778)))))

(declare-fun lt!40713 () Unit!2219)

(declare-fun lt!40699 () Unit!2219)

(assert (=> d!8080 (= lt!40713 lt!40699)))

(assert (=> d!8080 (= lt!40699 (lemmaIsPrefixRefl!0 (_2!1618 lt!39778)))))

(declare-fun lt!40706 () Unit!2219)

(declare-fun lt!40709 () Unit!2219)

(assert (=> d!8080 (= lt!40706 lt!40709)))

(assert (=> d!8080 (isPrefixOf!0 lt!40715 lt!40715)))

(assert (=> d!8080 (= lt!40709 (lemmaIsPrefixRefl!0 lt!40715))))

(declare-fun lt!40704 () Unit!2219)

(declare-fun lt!40698 () Unit!2219)

(assert (=> d!8080 (= lt!40704 lt!40698)))

(assert (=> d!8080 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!8080 (= lt!40698 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!8080 (= lt!40715 (BitStream!1349 (buf!1085 (_2!1618 lt!39778)) (currentByte!2410 thiss!1379) (currentBit!2405 thiss!1379)))))

(assert (=> d!8080 (isPrefixOf!0 thiss!1379 (_2!1618 lt!39778))))

(assert (=> d!8080 (= (reader!0 thiss!1379 (_2!1618 lt!39778)) lt!40702)))

(declare-fun b!28772 () Bool)

(declare-fun Unit!2245 () Unit!2219)

(assert (=> b!28772 (= e!19327 Unit!2245)))

(declare-fun b!28773 () Bool)

(declare-fun res!24894 () Bool)

(assert (=> b!28773 (=> (not res!24894) (not e!19326))))

(assert (=> b!28773 (= res!24894 (isPrefixOf!0 (_1!1619 lt!40702) thiss!1379))))

(assert (= (and d!8080 c!1836) b!28770))

(assert (= (and d!8080 (not c!1836)) b!28772))

(assert (= (and d!8080 res!24895) b!28773))

(assert (= (and b!28773 res!24894) b!28771))

(assert (= (and b!28771 res!24896) b!28769))

(declare-fun m!41413 () Bool)

(assert (=> b!28771 m!41413))

(declare-fun m!41415 () Bool)

(assert (=> d!8080 m!41415))

(declare-fun m!41417 () Bool)

(assert (=> d!8080 m!41417))

(assert (=> d!8080 m!41371))

(assert (=> d!8080 m!40545))

(declare-fun m!41419 () Bool)

(assert (=> d!8080 m!41419))

(declare-fun m!41421 () Bool)

(assert (=> d!8080 m!41421))

(declare-fun m!41423 () Bool)

(assert (=> d!8080 m!41423))

(assert (=> d!8080 m!41379))

(assert (=> d!8080 m!40575))

(declare-fun m!41425 () Bool)

(assert (=> d!8080 m!41425))

(assert (=> d!8080 m!40577))

(assert (=> b!28770 m!40579))

(declare-fun m!41427 () Bool)

(assert (=> b!28770 m!41427))

(declare-fun m!41429 () Bool)

(assert (=> b!28770 m!41429))

(declare-fun m!41431 () Bool)

(assert (=> b!28773 m!41431))

(declare-fun m!41433 () Bool)

(assert (=> b!28769 m!41433))

(assert (=> b!28769 m!40599))

(assert (=> b!28769 m!40579))

(assert (=> b!28307 d!8080))

(push 1)

(assert (not b!28709))

(assert (not bm!355))

(assert (not d!8076))

(assert (not b!28753))

(assert (not b!28768))

(assert (not d!8064))

(assert (not b!28624))

(assert (not d!8012))

(assert (not b!28763))

(assert (not b!28751))

(assert (not d!7986))

(assert (not b!28773))

(assert (not d!8016))

(assert (not b!28749))

(assert (not b!28656))

(assert (not b!28762))

(assert (not b!28758))

(assert (not b!28764))

(assert (not d!8018))

(assert (not b!28684))

(assert (not b!28685))

(assert (not b!28643))

(assert (not d!8078))

(assert (not b!28627))

(assert (not b!28746))

(assert (not d!8072))

(assert (not d!8026))

(assert (not b!28641))

(assert (not b!28658))

(assert (not d!8056))

(assert (not b!28748))

(assert (not b!28766))

(assert (not b!28640))

(assert (not b!28769))

(assert (not b!28750))

(assert (not d!7992))

(assert (not d!7984))

(assert (not b!28625))

(assert (not b!28756))

(assert (not b!28639))

(assert (not b!28701))

(assert (not d!7982))

(assert (not d!7902))

(assert (not b!28623))

(assert (not b!28652))

(assert (not b!28670))

(assert (not b!28650))

(assert (not d!8080))

(assert (not d!8022))

(assert (not b!28622))

(assert (not d!8068))

(assert (not b!28704))

(assert (not b!28767))

(assert (not d!8002))

(assert (not b!28655))

(assert (not b!28653))

(assert (not b!28626))

(assert (not d!8000))

(assert (not b!28757))

(assert (not b!28706))

(assert (not b!28686))

(assert (not d!8024))

(assert (not b!28752))

(assert (not b!28770))

(assert (not b!28747))

(assert (not d!8066))

(assert (not b!28771))

(assert (not b!28760))

(assert (not d!8062))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

