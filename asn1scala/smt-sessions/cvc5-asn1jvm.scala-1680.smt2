; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46730 () Bool)

(assert start!46730)

(declare-fun res!188153 () Bool)

(declare-fun e!152701 () Bool)

(assert (=> start!46730 (=> (not res!188153) (not e!152701))))

(declare-datatypes ((array!11046 0))(
  ( (array!11047 (arr!5794 (Array (_ BitVec 32) (_ BitVec 8))) (size!4846 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11046)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!46730 (= res!188153 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4846 arr!308))))))

(assert (=> start!46730 e!152701))

(assert (=> start!46730 true))

(declare-fun array_inv!4587 (array!11046) Bool)

(assert (=> start!46730 (array_inv!4587 arr!308)))

(declare-datatypes ((BitStream!8794 0))(
  ( (BitStream!8795 (buf!5390 array!11046) (currentByte!10118 (_ BitVec 32)) (currentBit!10113 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8794)

(declare-fun e!152699 () Bool)

(declare-fun inv!12 (BitStream!8794) Bool)

(assert (=> start!46730 (and (inv!12 thiss!1870) e!152699)))

(declare-fun b!224159 () Bool)

(declare-fun res!188154 () Bool)

(assert (=> b!224159 (=> (not res!188154) (not e!152701))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!224159 (= res!188154 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4846 (buf!5390 thiss!1870))) ((_ sign_extend 32) (currentByte!10118 thiss!1870)) ((_ sign_extend 32) (currentBit!10113 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!224161 () Bool)

(assert (=> b!224161 (= e!152701 (not (bvsle i!761 (size!4846 arr!308))))))

(declare-datatypes ((Unit!16361 0))(
  ( (Unit!16362) )
))
(declare-datatypes ((tuple3!1218 0))(
  ( (tuple3!1219 (_1!10341 Unit!16361) (_2!10341 BitStream!8794) (_3!751 array!11046)) )
))
(declare-fun lt!355592 () tuple3!1218)

(declare-fun arrayRangesEq!742 (array!11046 array!11046 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!224161 (arrayRangesEq!742 arr!308 (_3!751 lt!355592) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!355587 () array!11046)

(declare-fun lt!355593 () Unit!16361)

(declare-fun arrayRangesEqTransitive!213 (array!11046 array!11046 array!11046 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16361)

(assert (=> b!224161 (= lt!355593 (arrayRangesEqTransitive!213 arr!308 lt!355587 (_3!751 lt!355592) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> b!224161 (arrayRangesEq!742 arr!308 lt!355587 #b00000000000000000000000000000000 i!761)))

(declare-datatypes ((tuple2!19180 0))(
  ( (tuple2!19181 (_1!10342 (_ BitVec 8)) (_2!10342 BitStream!8794)) )
))
(declare-fun lt!355594 () tuple2!19180)

(declare-fun lt!355595 () Unit!16361)

(declare-fun arrayUpdatedAtPrefixLemma!334 (array!11046 (_ BitVec 32) (_ BitVec 8)) Unit!16361)

(assert (=> b!224161 (= lt!355595 (arrayUpdatedAtPrefixLemma!334 arr!308 i!761 (_1!10342 lt!355594)))))

(declare-fun lt!355590 () (_ BitVec 64))

(declare-fun lt!355588 () (_ BitVec 64))

(declare-fun lt!355596 () (_ BitVec 32))

(declare-fun lt!355591 () (_ BitVec 64))

(assert (=> b!224161 (and (= (bvadd lt!355590 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!355596))) lt!355588) (= (bvadd lt!355591 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!355588) (= (buf!5390 thiss!1870) (buf!5390 (_2!10341 lt!355592))) (= (size!4846 arr!308) (size!4846 (_3!751 lt!355592))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!224161 (= lt!355588 (bitIndex!0 (size!4846 (buf!5390 (_2!10341 lt!355592))) (currentByte!10118 (_2!10341 lt!355592)) (currentBit!10113 (_2!10341 lt!355592))))))

(assert (=> b!224161 (= lt!355590 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!355591))))

(assert (=> b!224161 (= lt!355590 (bitIndex!0 (size!4846 (buf!5390 (_2!10342 lt!355594))) (currentByte!10118 (_2!10342 lt!355594)) (currentBit!10113 (_2!10342 lt!355594))))))

(assert (=> b!224161 (= lt!355591 (bitIndex!0 (size!4846 (buf!5390 thiss!1870)) (currentByte!10118 thiss!1870) (currentBit!10113 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!8794 array!11046 (_ BitVec 32) (_ BitVec 32)) tuple3!1218)

(assert (=> b!224161 (= lt!355592 (readByteArrayLoop!0 (_2!10342 lt!355594) lt!355587 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> b!224161 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4846 (buf!5390 (_2!10342 lt!355594)))) ((_ sign_extend 32) (currentByte!10118 (_2!10342 lt!355594))) ((_ sign_extend 32) (currentBit!10113 (_2!10342 lt!355594))) lt!355596)))

(assert (=> b!224161 (= lt!355596 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!355589 () Unit!16361)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!8794 BitStream!8794 (_ BitVec 64) (_ BitVec 32)) Unit!16361)

(assert (=> b!224161 (= lt!355589 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10342 lt!355594) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!224161 (= lt!355587 (array!11047 (store (arr!5794 arr!308) i!761 (_1!10342 lt!355594)) (size!4846 arr!308)))))

(declare-fun readByte!0 (BitStream!8794) tuple2!19180)

(assert (=> b!224161 (= lt!355594 (readByte!0 thiss!1870))))

(declare-fun b!224160 () Bool)

(declare-fun res!188152 () Bool)

(assert (=> b!224160 (=> (not res!188152) (not e!152701))))

(assert (=> b!224160 (= res!188152 (bvslt i!761 to!496))))

(declare-fun b!224162 () Bool)

(assert (=> b!224162 (= e!152699 (array_inv!4587 (buf!5390 thiss!1870)))))

(assert (= (and start!46730 res!188153) b!224159))

(assert (= (and b!224159 res!188154) b!224160))

(assert (= (and b!224160 res!188152) b!224161))

(assert (= start!46730 b!224162))

(declare-fun m!343895 () Bool)

(assert (=> start!46730 m!343895))

(declare-fun m!343897 () Bool)

(assert (=> start!46730 m!343897))

(declare-fun m!343899 () Bool)

(assert (=> b!224159 m!343899))

(declare-fun m!343901 () Bool)

(assert (=> b!224161 m!343901))

(declare-fun m!343903 () Bool)

(assert (=> b!224161 m!343903))

(declare-fun m!343905 () Bool)

(assert (=> b!224161 m!343905))

(declare-fun m!343907 () Bool)

(assert (=> b!224161 m!343907))

(declare-fun m!343909 () Bool)

(assert (=> b!224161 m!343909))

(declare-fun m!343911 () Bool)

(assert (=> b!224161 m!343911))

(declare-fun m!343913 () Bool)

(assert (=> b!224161 m!343913))

(declare-fun m!343915 () Bool)

(assert (=> b!224161 m!343915))

(declare-fun m!343917 () Bool)

(assert (=> b!224161 m!343917))

(declare-fun m!343919 () Bool)

(assert (=> b!224161 m!343919))

(declare-fun m!343921 () Bool)

(assert (=> b!224161 m!343921))

(declare-fun m!343923 () Bool)

(assert (=> b!224161 m!343923))

(declare-fun m!343925 () Bool)

(assert (=> b!224162 m!343925))

(push 1)

(assert (not start!46730))

(assert (not b!224162))

(assert (not b!224161))

(assert (not b!224159))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

