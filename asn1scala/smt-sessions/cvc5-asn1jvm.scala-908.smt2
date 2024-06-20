; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25522 () Bool)

(assert start!25522)

(declare-fun b!129713 () Bool)

(declare-fun res!107456 () Bool)

(declare-fun e!85964 () Bool)

(assert (=> b!129713 (=> (not res!107456) (not e!85964))))

(declare-datatypes ((array!6007 0))(
  ( (array!6008 (arr!3336 (Array (_ BitVec 32) (_ BitVec 8))) (size!2719 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4702 0))(
  ( (BitStream!4703 (buf!3077 array!6007) (currentByte!5838 (_ BitVec 32)) (currentBit!5833 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!8043 0))(
  ( (Unit!8044) )
))
(declare-datatypes ((tuple2!11110 0))(
  ( (tuple2!11111 (_1!5852 Unit!8043) (_2!5852 BitStream!4702)) )
))
(declare-fun lt!200280 () tuple2!11110)

(declare-fun lt!200286 () tuple2!11110)

(declare-fun isPrefixOf!0 (BitStream!4702 BitStream!4702) Bool)

(assert (=> b!129713 (= res!107456 (isPrefixOf!0 (_2!5852 lt!200280) (_2!5852 lt!200286)))))

(declare-fun b!129714 () Bool)

(declare-fun res!107463 () Bool)

(declare-fun e!85968 () Bool)

(assert (=> b!129714 (=> (not res!107463) (not e!85968))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun thiss!1634 () BitStream!4702)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!129714 (= res!107463 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2719 (buf!3077 thiss!1634))) ((_ sign_extend 32) (currentByte!5838 thiss!1634)) ((_ sign_extend 32) (currentBit!5833 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!129715 () Bool)

(declare-fun res!107465 () Bool)

(declare-fun e!85967 () Bool)

(assert (=> b!129715 (=> res!107465 e!85967)))

(declare-fun lt!200279 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!129715 (= res!107465 (bvsgt lt!200279 (bitIndex!0 (size!2719 (buf!3077 (_2!5852 lt!200286))) (currentByte!5838 (_2!5852 lt!200286)) (currentBit!5833 (_2!5852 lt!200286)))))))

(declare-fun b!129716 () Bool)

(declare-fun res!107462 () Bool)

(assert (=> b!129716 (=> res!107462 e!85967)))

(declare-fun arrayBitRangesEq!0 (array!6007 array!6007 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!129716 (= res!107462 (not (arrayBitRangesEq!0 (buf!3077 (_2!5852 lt!200280)) (buf!3077 (_2!5852 lt!200286)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!200279)))))

(declare-fun res!107453 () Bool)

(assert (=> start!25522 (=> (not res!107453) (not e!85968))))

(declare-fun arr!237 () array!6007)

(assert (=> start!25522 (= res!107453 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2719 arr!237))))))

(assert (=> start!25522 e!85968))

(assert (=> start!25522 true))

(declare-fun array_inv!2508 (array!6007) Bool)

(assert (=> start!25522 (array_inv!2508 arr!237)))

(declare-fun e!85962 () Bool)

(declare-fun inv!12 (BitStream!4702) Bool)

(assert (=> start!25522 (and (inv!12 thiss!1634) e!85962)))

(declare-fun b!129717 () Bool)

(assert (=> b!129717 (= e!85962 (array_inv!2508 (buf!3077 thiss!1634)))))

(declare-fun b!129718 () Bool)

(declare-fun res!107466 () Bool)

(declare-fun e!85969 () Bool)

(assert (=> b!129718 (=> (not res!107466) (not e!85969))))

(assert (=> b!129718 (= res!107466 (isPrefixOf!0 thiss!1634 (_2!5852 lt!200280)))))

(declare-fun b!129719 () Bool)

(declare-fun res!107457 () Bool)

(assert (=> b!129719 (=> (not res!107457) (not e!85969))))

(assert (=> b!129719 (= res!107457 (= (bitIndex!0 (size!2719 (buf!3077 (_2!5852 lt!200280))) (currentByte!5838 (_2!5852 lt!200280)) (currentBit!5833 (_2!5852 lt!200280))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2719 (buf!3077 thiss!1634)) (currentByte!5838 thiss!1634) (currentBit!5833 thiss!1634)))))))

(declare-fun b!129720 () Bool)

(declare-fun res!107461 () Bool)

(assert (=> b!129720 (=> (not res!107461) (not e!85968))))

(assert (=> b!129720 (= res!107461 (bvslt from!447 to!404))))

(declare-datatypes ((tuple2!11112 0))(
  ( (tuple2!11113 (_1!5853 BitStream!4702) (_2!5853 BitStream!4702)) )
))
(declare-fun lt!200287 () tuple2!11112)

(declare-fun b!129721 () Bool)

(declare-datatypes ((tuple2!11114 0))(
  ( (tuple2!11115 (_1!5854 BitStream!4702) (_2!5854 (_ BitVec 8))) )
))
(declare-fun lt!200277 () tuple2!11114)

(assert (=> b!129721 (= e!85969 (and (= (_2!5854 lt!200277) (select (arr!3336 arr!237) from!447)) (= (_1!5854 lt!200277) (_2!5853 lt!200287))))))

(declare-fun readBytePure!0 (BitStream!4702) tuple2!11114)

(assert (=> b!129721 (= lt!200277 (readBytePure!0 (_1!5853 lt!200287)))))

(declare-fun reader!0 (BitStream!4702 BitStream!4702) tuple2!11112)

(assert (=> b!129721 (= lt!200287 (reader!0 thiss!1634 (_2!5852 lt!200280)))))

(declare-fun b!129722 () Bool)

(declare-fun e!85961 () Bool)

(assert (=> b!129722 (= e!85964 (not e!85961))))

(declare-fun res!107454 () Bool)

(assert (=> b!129722 (=> res!107454 e!85961)))

(declare-datatypes ((tuple2!11116 0))(
  ( (tuple2!11117 (_1!5855 BitStream!4702) (_2!5855 array!6007)) )
))
(declare-fun lt!200285 () tuple2!11116)

(declare-fun lt!200278 () tuple2!11112)

(assert (=> b!129722 (= res!107454 (or (not (= (size!2719 (_2!5855 lt!200285)) (size!2719 arr!237))) (not (= (_1!5855 lt!200285) (_2!5853 lt!200278)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4702 array!6007 (_ BitVec 32) (_ BitVec 32)) tuple2!11116)

(assert (=> b!129722 (= lt!200285 (readByteArrayLoopPure!0 (_1!5853 lt!200278) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!200288 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!129722 (validate_offset_bits!1 ((_ sign_extend 32) (size!2719 (buf!3077 (_2!5852 lt!200286)))) ((_ sign_extend 32) (currentByte!5838 (_2!5852 lt!200280))) ((_ sign_extend 32) (currentBit!5833 (_2!5852 lt!200280))) lt!200288)))

(declare-fun lt!200283 () Unit!8043)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4702 array!6007 (_ BitVec 64)) Unit!8043)

(assert (=> b!129722 (= lt!200283 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5852 lt!200280) (buf!3077 (_2!5852 lt!200286)) lt!200288))))

(assert (=> b!129722 (= lt!200278 (reader!0 (_2!5852 lt!200280) (_2!5852 lt!200286)))))

(declare-fun b!129723 () Bool)

(assert (=> b!129723 (= e!85967 true)))

(declare-fun lt!200282 () tuple2!11114)

(assert (=> b!129723 (= lt!200282 (readBytePure!0 (BitStream!4703 (buf!3077 (_2!5852 lt!200286)) (currentByte!5838 thiss!1634) (currentBit!5833 thiss!1634))))))

(declare-fun lt!200281 () tuple2!11114)

(assert (=> b!129723 (= lt!200281 (readBytePure!0 (BitStream!4703 (buf!3077 (_2!5852 lt!200280)) (currentByte!5838 thiss!1634) (currentBit!5833 thiss!1634))))))

(declare-fun b!129724 () Bool)

(assert (=> b!129724 (= e!85968 (not e!85967))))

(declare-fun res!107458 () Bool)

(assert (=> b!129724 (=> res!107458 e!85967)))

(assert (=> b!129724 (= res!107458 (bvsgt lt!200279 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2719 (buf!3077 (_2!5852 lt!200280)))))))))

(assert (=> b!129724 (= lt!200279 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2719 (buf!3077 (_2!5852 lt!200280))) (currentByte!5838 thiss!1634) (currentBit!5833 thiss!1634))))))

(declare-fun e!85970 () Bool)

(assert (=> b!129724 e!85970))

(declare-fun res!107467 () Bool)

(assert (=> b!129724 (=> (not res!107467) (not e!85970))))

(assert (=> b!129724 (= res!107467 (isPrefixOf!0 thiss!1634 (_2!5852 lt!200286)))))

(declare-fun lt!200284 () Unit!8043)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4702 BitStream!4702 BitStream!4702) Unit!8043)

(assert (=> b!129724 (= lt!200284 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!5852 lt!200280) (_2!5852 lt!200286)))))

(declare-fun e!85965 () Bool)

(assert (=> b!129724 e!85965))

(declare-fun res!107464 () Bool)

(assert (=> b!129724 (=> (not res!107464) (not e!85965))))

(assert (=> b!129724 (= res!107464 (= (size!2719 (buf!3077 (_2!5852 lt!200280))) (size!2719 (buf!3077 (_2!5852 lt!200286)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4702 array!6007 (_ BitVec 32) (_ BitVec 32)) tuple2!11110)

(assert (=> b!129724 (= lt!200286 (appendByteArrayLoop!0 (_2!5852 lt!200280) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!129724 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2719 (buf!3077 (_2!5852 lt!200280)))) ((_ sign_extend 32) (currentByte!5838 (_2!5852 lt!200280))) ((_ sign_extend 32) (currentBit!5833 (_2!5852 lt!200280))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!200276 () Unit!8043)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4702 BitStream!4702 (_ BitVec 64) (_ BitVec 32)) Unit!8043)

(assert (=> b!129724 (= lt!200276 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!5852 lt!200280) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!129724 e!85969))

(declare-fun res!107455 () Bool)

(assert (=> b!129724 (=> (not res!107455) (not e!85969))))

(assert (=> b!129724 (= res!107455 (= (size!2719 (buf!3077 thiss!1634)) (size!2719 (buf!3077 (_2!5852 lt!200280)))))))

(declare-fun appendByte!0 (BitStream!4702 (_ BitVec 8)) tuple2!11110)

(assert (=> b!129724 (= lt!200280 (appendByte!0 thiss!1634 (select (arr!3336 arr!237) from!447)))))

(declare-fun b!129725 () Bool)

(assert (=> b!129725 (= e!85965 e!85964)))

(declare-fun res!107459 () Bool)

(assert (=> b!129725 (=> (not res!107459) (not e!85964))))

(assert (=> b!129725 (= res!107459 (= (bitIndex!0 (size!2719 (buf!3077 (_2!5852 lt!200286))) (currentByte!5838 (_2!5852 lt!200286)) (currentBit!5833 (_2!5852 lt!200286))) (bvadd (bitIndex!0 (size!2719 (buf!3077 (_2!5852 lt!200280))) (currentByte!5838 (_2!5852 lt!200280)) (currentBit!5833 (_2!5852 lt!200280))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!200288))))))

(assert (=> b!129725 (= lt!200288 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!129726 () Bool)

(declare-fun arrayRangesEq!122 (array!6007 array!6007 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!129726 (= e!85961 (not (arrayRangesEq!122 arr!237 (_2!5855 lt!200285) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!129727 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!129727 (= e!85970 (invariant!0 (currentBit!5833 thiss!1634) (currentByte!5838 thiss!1634) (size!2719 (buf!3077 (_2!5852 lt!200280)))))))

(declare-fun b!129728 () Bool)

(declare-fun res!107460 () Bool)

(assert (=> b!129728 (=> (not res!107460) (not e!85968))))

(assert (=> b!129728 (= res!107460 (invariant!0 (currentBit!5833 thiss!1634) (currentByte!5838 thiss!1634) (size!2719 (buf!3077 thiss!1634))))))

(assert (= (and start!25522 res!107453) b!129714))

(assert (= (and b!129714 res!107463) b!129720))

(assert (= (and b!129720 res!107461) b!129728))

(assert (= (and b!129728 res!107460) b!129724))

(assert (= (and b!129724 res!107455) b!129719))

(assert (= (and b!129719 res!107457) b!129718))

(assert (= (and b!129718 res!107466) b!129721))

(assert (= (and b!129724 res!107464) b!129725))

(assert (= (and b!129725 res!107459) b!129713))

(assert (= (and b!129713 res!107456) b!129722))

(assert (= (and b!129722 (not res!107454)) b!129726))

(assert (= (and b!129724 res!107467) b!129727))

(assert (= (and b!129724 (not res!107458)) b!129715))

(assert (= (and b!129715 (not res!107465)) b!129716))

(assert (= (and b!129716 (not res!107462)) b!129723))

(assert (= start!25522 b!129717))

(declare-fun m!195607 () Bool)

(assert (=> start!25522 m!195607))

(declare-fun m!195609 () Bool)

(assert (=> start!25522 m!195609))

(declare-fun m!195611 () Bool)

(assert (=> b!129723 m!195611))

(declare-fun m!195613 () Bool)

(assert (=> b!129723 m!195613))

(declare-fun m!195615 () Bool)

(assert (=> b!129727 m!195615))

(declare-fun m!195617 () Bool)

(assert (=> b!129728 m!195617))

(declare-fun m!195619 () Bool)

(assert (=> b!129713 m!195619))

(declare-fun m!195621 () Bool)

(assert (=> b!129721 m!195621))

(declare-fun m!195623 () Bool)

(assert (=> b!129721 m!195623))

(declare-fun m!195625 () Bool)

(assert (=> b!129721 m!195625))

(declare-fun m!195627 () Bool)

(assert (=> b!129718 m!195627))

(declare-fun m!195629 () Bool)

(assert (=> b!129715 m!195629))

(declare-fun m!195631 () Bool)

(assert (=> b!129719 m!195631))

(declare-fun m!195633 () Bool)

(assert (=> b!129719 m!195633))

(declare-fun m!195635 () Bool)

(assert (=> b!129716 m!195635))

(declare-fun m!195637 () Bool)

(assert (=> b!129717 m!195637))

(declare-fun m!195639 () Bool)

(assert (=> b!129722 m!195639))

(declare-fun m!195641 () Bool)

(assert (=> b!129722 m!195641))

(declare-fun m!195643 () Bool)

(assert (=> b!129722 m!195643))

(declare-fun m!195645 () Bool)

(assert (=> b!129722 m!195645))

(declare-fun m!195647 () Bool)

(assert (=> b!129714 m!195647))

(declare-fun m!195649 () Bool)

(assert (=> b!129726 m!195649))

(declare-fun m!195651 () Bool)

(assert (=> b!129724 m!195651))

(declare-fun m!195653 () Bool)

(assert (=> b!129724 m!195653))

(declare-fun m!195655 () Bool)

(assert (=> b!129724 m!195655))

(declare-fun m!195657 () Bool)

(assert (=> b!129724 m!195657))

(assert (=> b!129724 m!195621))

(assert (=> b!129724 m!195621))

(declare-fun m!195659 () Bool)

(assert (=> b!129724 m!195659))

(declare-fun m!195661 () Bool)

(assert (=> b!129724 m!195661))

(declare-fun m!195663 () Bool)

(assert (=> b!129724 m!195663))

(assert (=> b!129725 m!195629))

(assert (=> b!129725 m!195631))

(push 1)

(assert (not b!129725))

(assert (not b!129721))

(assert (not b!129715))

(assert (not b!129713))

(assert (not b!129718))

(assert (not b!129723))

(assert (not b!129719))

(assert (not b!129716))

(assert (not b!129728))

(assert (not b!129726))

(assert (not b!129717))

(assert (not start!25522))

(assert (not b!129727))

(assert (not b!129722))

(assert (not b!129724))

(assert (not b!129714))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

