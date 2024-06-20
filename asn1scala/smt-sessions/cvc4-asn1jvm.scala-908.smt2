; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25526 () Bool)

(assert start!25526)

(declare-fun b!129809 () Bool)

(declare-fun res!107545 () Bool)

(declare-fun e!86025 () Bool)

(assert (=> b!129809 (=> res!107545 e!86025)))

(declare-datatypes ((array!6011 0))(
  ( (array!6012 (arr!3338 (Array (_ BitVec 32) (_ BitVec 8))) (size!2721 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4706 0))(
  ( (BitStream!4707 (buf!3079 array!6011) (currentByte!5840 (_ BitVec 32)) (currentBit!5835 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!8047 0))(
  ( (Unit!8048) )
))
(declare-datatypes ((tuple2!11126 0))(
  ( (tuple2!11127 (_1!5860 Unit!8047) (_2!5860 BitStream!4706)) )
))
(declare-fun lt!200364 () tuple2!11126)

(declare-fun lt!200357 () tuple2!11126)

(declare-fun lt!200363 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!6011 array!6011 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!129809 (= res!107545 (not (arrayBitRangesEq!0 (buf!3079 (_2!5860 lt!200364)) (buf!3079 (_2!5860 lt!200357)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!200363)))))

(declare-fun b!129810 () Bool)

(declare-fun res!107554 () Bool)

(declare-fun e!86024 () Bool)

(assert (=> b!129810 (=> (not res!107554) (not e!86024))))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> b!129810 (= res!107554 (bvslt from!447 to!404))))

(declare-fun b!129811 () Bool)

(declare-fun res!107550 () Bool)

(declare-fun e!86021 () Bool)

(assert (=> b!129811 (=> (not res!107550) (not e!86021))))

(declare-fun isPrefixOf!0 (BitStream!4706 BitStream!4706) Bool)

(assert (=> b!129811 (= res!107550 (isPrefixOf!0 (_2!5860 lt!200364) (_2!5860 lt!200357)))))

(declare-fun b!129812 () Bool)

(assert (=> b!129812 (= e!86024 (not e!86025))))

(declare-fun res!107551 () Bool)

(assert (=> b!129812 (=> res!107551 e!86025)))

(assert (=> b!129812 (= res!107551 (bvsgt lt!200363 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2721 (buf!3079 (_2!5860 lt!200364)))))))))

(declare-fun thiss!1634 () BitStream!4706)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!129812 (= lt!200363 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2721 (buf!3079 (_2!5860 lt!200364))) (currentByte!5840 thiss!1634) (currentBit!5835 thiss!1634))))))

(declare-fun e!86028 () Bool)

(assert (=> b!129812 e!86028))

(declare-fun res!107544 () Bool)

(assert (=> b!129812 (=> (not res!107544) (not e!86028))))

(assert (=> b!129812 (= res!107544 (isPrefixOf!0 thiss!1634 (_2!5860 lt!200357)))))

(declare-fun lt!200359 () Unit!8047)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4706 BitStream!4706 BitStream!4706) Unit!8047)

(assert (=> b!129812 (= lt!200359 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!5860 lt!200364) (_2!5860 lt!200357)))))

(declare-fun e!86026 () Bool)

(assert (=> b!129812 e!86026))

(declare-fun res!107549 () Bool)

(assert (=> b!129812 (=> (not res!107549) (not e!86026))))

(assert (=> b!129812 (= res!107549 (= (size!2721 (buf!3079 (_2!5860 lt!200364))) (size!2721 (buf!3079 (_2!5860 lt!200357)))))))

(declare-fun arr!237 () array!6011)

(declare-fun appendByteArrayLoop!0 (BitStream!4706 array!6011 (_ BitVec 32) (_ BitVec 32)) tuple2!11126)

(assert (=> b!129812 (= lt!200357 (appendByteArrayLoop!0 (_2!5860 lt!200364) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!129812 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2721 (buf!3079 (_2!5860 lt!200364)))) ((_ sign_extend 32) (currentByte!5840 (_2!5860 lt!200364))) ((_ sign_extend 32) (currentBit!5835 (_2!5860 lt!200364))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!200355 () Unit!8047)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4706 BitStream!4706 (_ BitVec 64) (_ BitVec 32)) Unit!8047)

(assert (=> b!129812 (= lt!200355 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!5860 lt!200364) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(declare-fun e!86029 () Bool)

(assert (=> b!129812 e!86029))

(declare-fun res!107546 () Bool)

(assert (=> b!129812 (=> (not res!107546) (not e!86029))))

(assert (=> b!129812 (= res!107546 (= (size!2721 (buf!3079 thiss!1634)) (size!2721 (buf!3079 (_2!5860 lt!200364)))))))

(declare-fun appendByte!0 (BitStream!4706 (_ BitVec 8)) tuple2!11126)

(assert (=> b!129812 (= lt!200364 (appendByte!0 thiss!1634 (select (arr!3338 arr!237) from!447)))))

(declare-fun b!129813 () Bool)

(assert (=> b!129813 (= e!86025 true)))

(declare-datatypes ((tuple2!11128 0))(
  ( (tuple2!11129 (_1!5861 BitStream!4706) (_2!5861 (_ BitVec 8))) )
))
(declare-fun lt!200361 () tuple2!11128)

(declare-fun readBytePure!0 (BitStream!4706) tuple2!11128)

(assert (=> b!129813 (= lt!200361 (readBytePure!0 (BitStream!4707 (buf!3079 (_2!5860 lt!200357)) (currentByte!5840 thiss!1634) (currentBit!5835 thiss!1634))))))

(declare-fun lt!200362 () tuple2!11128)

(assert (=> b!129813 (= lt!200362 (readBytePure!0 (BitStream!4707 (buf!3079 (_2!5860 lt!200364)) (currentByte!5840 thiss!1634) (currentBit!5835 thiss!1634))))))

(declare-fun res!107547 () Bool)

(assert (=> start!25526 (=> (not res!107547) (not e!86024))))

(assert (=> start!25526 (= res!107547 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2721 arr!237))))))

(assert (=> start!25526 e!86024))

(assert (=> start!25526 true))

(declare-fun array_inv!2510 (array!6011) Bool)

(assert (=> start!25526 (array_inv!2510 arr!237)))

(declare-fun e!86022 () Bool)

(declare-fun inv!12 (BitStream!4706) Bool)

(assert (=> start!25526 (and (inv!12 thiss!1634) e!86022)))

(declare-fun b!129814 () Bool)

(declare-fun res!107556 () Bool)

(assert (=> b!129814 (=> (not res!107556) (not e!86024))))

(assert (=> b!129814 (= res!107556 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2721 (buf!3079 thiss!1634))) ((_ sign_extend 32) (currentByte!5840 thiss!1634)) ((_ sign_extend 32) (currentBit!5835 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!129815 () Bool)

(declare-fun res!107543 () Bool)

(assert (=> b!129815 (=> (not res!107543) (not e!86029))))

(assert (=> b!129815 (= res!107543 (= (bitIndex!0 (size!2721 (buf!3079 (_2!5860 lt!200364))) (currentByte!5840 (_2!5860 lt!200364)) (currentBit!5835 (_2!5860 lt!200364))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2721 (buf!3079 thiss!1634)) (currentByte!5840 thiss!1634) (currentBit!5835 thiss!1634)))))))

(declare-datatypes ((tuple2!11130 0))(
  ( (tuple2!11131 (_1!5862 BitStream!4706) (_2!5862 BitStream!4706)) )
))
(declare-fun lt!200358 () tuple2!11130)

(declare-fun b!129816 () Bool)

(declare-fun lt!200354 () tuple2!11128)

(assert (=> b!129816 (= e!86029 (and (= (_2!5861 lt!200354) (select (arr!3338 arr!237) from!447)) (= (_1!5861 lt!200354) (_2!5862 lt!200358))))))

(assert (=> b!129816 (= lt!200354 (readBytePure!0 (_1!5862 lt!200358)))))

(declare-fun reader!0 (BitStream!4706 BitStream!4706) tuple2!11130)

(assert (=> b!129816 (= lt!200358 (reader!0 thiss!1634 (_2!5860 lt!200364)))))

(declare-fun b!129817 () Bool)

(assert (=> b!129817 (= e!86022 (array_inv!2510 (buf!3079 thiss!1634)))))

(declare-fun b!129818 () Bool)

(declare-fun res!107555 () Bool)

(assert (=> b!129818 (=> (not res!107555) (not e!86024))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!129818 (= res!107555 (invariant!0 (currentBit!5835 thiss!1634) (currentByte!5840 thiss!1634) (size!2721 (buf!3079 thiss!1634))))))

(declare-fun b!129819 () Bool)

(declare-fun e!86023 () Bool)

(assert (=> b!129819 (= e!86021 (not e!86023))))

(declare-fun res!107552 () Bool)

(assert (=> b!129819 (=> res!107552 e!86023)))

(declare-datatypes ((tuple2!11132 0))(
  ( (tuple2!11133 (_1!5863 BitStream!4706) (_2!5863 array!6011)) )
))
(declare-fun lt!200360 () tuple2!11132)

(declare-fun lt!200366 () tuple2!11130)

(assert (=> b!129819 (= res!107552 (or (not (= (size!2721 (_2!5863 lt!200360)) (size!2721 arr!237))) (not (= (_1!5863 lt!200360) (_2!5862 lt!200366)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4706 array!6011 (_ BitVec 32) (_ BitVec 32)) tuple2!11132)

(assert (=> b!129819 (= lt!200360 (readByteArrayLoopPure!0 (_1!5862 lt!200366) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!200356 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!129819 (validate_offset_bits!1 ((_ sign_extend 32) (size!2721 (buf!3079 (_2!5860 lt!200357)))) ((_ sign_extend 32) (currentByte!5840 (_2!5860 lt!200364))) ((_ sign_extend 32) (currentBit!5835 (_2!5860 lt!200364))) lt!200356)))

(declare-fun lt!200365 () Unit!8047)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4706 array!6011 (_ BitVec 64)) Unit!8047)

(assert (=> b!129819 (= lt!200365 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5860 lt!200364) (buf!3079 (_2!5860 lt!200357)) lt!200356))))

(assert (=> b!129819 (= lt!200366 (reader!0 (_2!5860 lt!200364) (_2!5860 lt!200357)))))

(declare-fun b!129820 () Bool)

(declare-fun res!107553 () Bool)

(assert (=> b!129820 (=> res!107553 e!86025)))

(assert (=> b!129820 (= res!107553 (bvsgt lt!200363 (bitIndex!0 (size!2721 (buf!3079 (_2!5860 lt!200357))) (currentByte!5840 (_2!5860 lt!200357)) (currentBit!5835 (_2!5860 lt!200357)))))))

(declare-fun b!129821 () Bool)

(declare-fun arrayRangesEq!124 (array!6011 array!6011 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!129821 (= e!86023 (not (arrayRangesEq!124 arr!237 (_2!5863 lt!200360) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!129822 () Bool)

(assert (=> b!129822 (= e!86028 (invariant!0 (currentBit!5835 thiss!1634) (currentByte!5840 thiss!1634) (size!2721 (buf!3079 (_2!5860 lt!200364)))))))

(declare-fun b!129823 () Bool)

(assert (=> b!129823 (= e!86026 e!86021)))

(declare-fun res!107548 () Bool)

(assert (=> b!129823 (=> (not res!107548) (not e!86021))))

(assert (=> b!129823 (= res!107548 (= (bitIndex!0 (size!2721 (buf!3079 (_2!5860 lt!200357))) (currentByte!5840 (_2!5860 lt!200357)) (currentBit!5835 (_2!5860 lt!200357))) (bvadd (bitIndex!0 (size!2721 (buf!3079 (_2!5860 lt!200364))) (currentByte!5840 (_2!5860 lt!200364)) (currentBit!5835 (_2!5860 lt!200364))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!200356))))))

(assert (=> b!129823 (= lt!200356 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!129824 () Bool)

(declare-fun res!107557 () Bool)

(assert (=> b!129824 (=> (not res!107557) (not e!86029))))

(assert (=> b!129824 (= res!107557 (isPrefixOf!0 thiss!1634 (_2!5860 lt!200364)))))

(assert (= (and start!25526 res!107547) b!129814))

(assert (= (and b!129814 res!107556) b!129810))

(assert (= (and b!129810 res!107554) b!129818))

(assert (= (and b!129818 res!107555) b!129812))

(assert (= (and b!129812 res!107546) b!129815))

(assert (= (and b!129815 res!107543) b!129824))

(assert (= (and b!129824 res!107557) b!129816))

(assert (= (and b!129812 res!107549) b!129823))

(assert (= (and b!129823 res!107548) b!129811))

(assert (= (and b!129811 res!107550) b!129819))

(assert (= (and b!129819 (not res!107552)) b!129821))

(assert (= (and b!129812 res!107544) b!129822))

(assert (= (and b!129812 (not res!107551)) b!129820))

(assert (= (and b!129820 (not res!107553)) b!129809))

(assert (= (and b!129809 (not res!107545)) b!129813))

(assert (= start!25526 b!129817))

(declare-fun m!195723 () Bool)

(assert (=> b!129812 m!195723))

(declare-fun m!195725 () Bool)

(assert (=> b!129812 m!195725))

(declare-fun m!195727 () Bool)

(assert (=> b!129812 m!195727))

(declare-fun m!195729 () Bool)

(assert (=> b!129812 m!195729))

(declare-fun m!195731 () Bool)

(assert (=> b!129812 m!195731))

(declare-fun m!195733 () Bool)

(assert (=> b!129812 m!195733))

(declare-fun m!195735 () Bool)

(assert (=> b!129812 m!195735))

(declare-fun m!195737 () Bool)

(assert (=> b!129812 m!195737))

(assert (=> b!129812 m!195735))

(assert (=> b!129816 m!195735))

(declare-fun m!195739 () Bool)

(assert (=> b!129816 m!195739))

(declare-fun m!195741 () Bool)

(assert (=> b!129816 m!195741))

(declare-fun m!195743 () Bool)

(assert (=> b!129813 m!195743))

(declare-fun m!195745 () Bool)

(assert (=> b!129813 m!195745))

(declare-fun m!195747 () Bool)

(assert (=> b!129819 m!195747))

(declare-fun m!195749 () Bool)

(assert (=> b!129819 m!195749))

(declare-fun m!195751 () Bool)

(assert (=> b!129819 m!195751))

(declare-fun m!195753 () Bool)

(assert (=> b!129819 m!195753))

(declare-fun m!195755 () Bool)

(assert (=> b!129811 m!195755))

(declare-fun m!195757 () Bool)

(assert (=> b!129818 m!195757))

(declare-fun m!195759 () Bool)

(assert (=> b!129809 m!195759))

(declare-fun m!195761 () Bool)

(assert (=> b!129814 m!195761))

(declare-fun m!195763 () Bool)

(assert (=> b!129822 m!195763))

(declare-fun m!195765 () Bool)

(assert (=> b!129821 m!195765))

(declare-fun m!195767 () Bool)

(assert (=> b!129824 m!195767))

(declare-fun m!195769 () Bool)

(assert (=> b!129820 m!195769))

(declare-fun m!195771 () Bool)

(assert (=> start!25526 m!195771))

(declare-fun m!195773 () Bool)

(assert (=> start!25526 m!195773))

(declare-fun m!195775 () Bool)

(assert (=> b!129817 m!195775))

(assert (=> b!129823 m!195769))

(declare-fun m!195777 () Bool)

(assert (=> b!129823 m!195777))

(assert (=> b!129815 m!195777))

(declare-fun m!195779 () Bool)

(assert (=> b!129815 m!195779))

(push 1)

(assert (not b!129817))

(assert (not b!129813))

(assert (not b!129821))

(assert (not b!129820))

(assert (not b!129816))

(assert (not b!129815))

(assert (not b!129818))

(assert (not start!25526))

(assert (not b!129814))

(assert (not b!129819))

(assert (not b!129812))

(assert (not b!129811))

(assert (not b!129822))

(assert (not b!129823))

(assert (not b!129824))

(assert (not b!129809))

(check-sat)

