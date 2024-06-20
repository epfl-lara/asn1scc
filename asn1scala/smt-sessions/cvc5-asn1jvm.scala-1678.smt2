; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46718 () Bool)

(assert start!46718)

(declare-fun b!224089 () Bool)

(declare-fun e!152627 () Bool)

(assert (=> b!224089 (= e!152627 (not true))))

(declare-datatypes ((array!11034 0))(
  ( (array!11035 (arr!5788 (Array (_ BitVec 32) (_ BitVec 8))) (size!4840 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11034)

(declare-datatypes ((BitStream!8782 0))(
  ( (BitStream!8783 (buf!5384 array!11034) (currentByte!10112 (_ BitVec 32)) (currentBit!10107 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!16349 0))(
  ( (Unit!16350) )
))
(declare-datatypes ((tuple3!1206 0))(
  ( (tuple3!1207 (_1!10329 Unit!16349) (_2!10329 BitStream!8782) (_3!745 array!11034)) )
))
(declare-fun lt!355413 () tuple3!1206)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun arrayRangesEq!736 (array!11034 array!11034 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!224089 (arrayRangesEq!736 arr!308 (_3!745 lt!355413) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!355407 () Unit!16349)

(declare-fun lt!355410 () array!11034)

(declare-fun arrayRangesEqTransitive!207 (array!11034 array!11034 array!11034 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16349)

(assert (=> b!224089 (= lt!355407 (arrayRangesEqTransitive!207 arr!308 lt!355410 (_3!745 lt!355413) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> b!224089 (arrayRangesEq!736 arr!308 lt!355410 #b00000000000000000000000000000000 i!761)))

(declare-fun lt!355409 () Unit!16349)

(declare-datatypes ((tuple2!19168 0))(
  ( (tuple2!19169 (_1!10330 (_ BitVec 8)) (_2!10330 BitStream!8782)) )
))
(declare-fun lt!355416 () tuple2!19168)

(declare-fun arrayUpdatedAtPrefixLemma!328 (array!11034 (_ BitVec 32) (_ BitVec 8)) Unit!16349)

(assert (=> b!224089 (= lt!355409 (arrayUpdatedAtPrefixLemma!328 arr!308 i!761 (_1!10330 lt!355416)))))

(declare-fun thiss!1870 () BitStream!8782)

(declare-fun lt!355411 () (_ BitVec 64))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun lt!355415 () (_ BitVec 64))

(declare-fun lt!355414 () (_ BitVec 64))

(declare-fun lt!355412 () (_ BitVec 32))

(assert (=> b!224089 (and (= (bvadd lt!355415 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!355412))) lt!355414) (= (bvadd lt!355411 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!355414) (= (buf!5384 thiss!1870) (buf!5384 (_2!10329 lt!355413))) (= (size!4840 arr!308) (size!4840 (_3!745 lt!355413))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!224089 (= lt!355414 (bitIndex!0 (size!4840 (buf!5384 (_2!10329 lt!355413))) (currentByte!10112 (_2!10329 lt!355413)) (currentBit!10107 (_2!10329 lt!355413))))))

(assert (=> b!224089 (= lt!355415 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!355411))))

(assert (=> b!224089 (= lt!355415 (bitIndex!0 (size!4840 (buf!5384 (_2!10330 lt!355416))) (currentByte!10112 (_2!10330 lt!355416)) (currentBit!10107 (_2!10330 lt!355416))))))

(assert (=> b!224089 (= lt!355411 (bitIndex!0 (size!4840 (buf!5384 thiss!1870)) (currentByte!10112 thiss!1870) (currentBit!10107 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!8782 array!11034 (_ BitVec 32) (_ BitVec 32)) tuple3!1206)

(assert (=> b!224089 (= lt!355413 (readByteArrayLoop!0 (_2!10330 lt!355416) lt!355410 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!224089 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4840 (buf!5384 (_2!10330 lt!355416)))) ((_ sign_extend 32) (currentByte!10112 (_2!10330 lt!355416))) ((_ sign_extend 32) (currentBit!10107 (_2!10330 lt!355416))) lt!355412)))

(assert (=> b!224089 (= lt!355412 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!355408 () Unit!16349)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!8782 BitStream!8782 (_ BitVec 64) (_ BitVec 32)) Unit!16349)

(assert (=> b!224089 (= lt!355408 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10330 lt!355416) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!224089 (= lt!355410 (array!11035 (store (arr!5788 arr!308) i!761 (_1!10330 lt!355416)) (size!4840 arr!308)))))

(declare-fun readByte!0 (BitStream!8782) tuple2!19168)

(assert (=> b!224089 (= lt!355416 (readByte!0 thiss!1870))))

(declare-fun b!224088 () Bool)

(declare-fun res!188100 () Bool)

(assert (=> b!224088 (=> (not res!188100) (not e!152627))))

(assert (=> b!224088 (= res!188100 (bvslt i!761 to!496))))

(declare-fun res!188098 () Bool)

(assert (=> start!46718 (=> (not res!188098) (not e!152627))))

(assert (=> start!46718 (= res!188098 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4840 arr!308))))))

(assert (=> start!46718 e!152627))

(assert (=> start!46718 true))

(declare-fun array_inv!4581 (array!11034) Bool)

(assert (=> start!46718 (array_inv!4581 arr!308)))

(declare-fun e!152629 () Bool)

(declare-fun inv!12 (BitStream!8782) Bool)

(assert (=> start!46718 (and (inv!12 thiss!1870) e!152629)))

(declare-fun b!224090 () Bool)

(assert (=> b!224090 (= e!152629 (array_inv!4581 (buf!5384 thiss!1870)))))

(declare-fun b!224087 () Bool)

(declare-fun res!188099 () Bool)

(assert (=> b!224087 (=> (not res!188099) (not e!152627))))

(assert (=> b!224087 (= res!188099 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4840 (buf!5384 thiss!1870))) ((_ sign_extend 32) (currentByte!10112 thiss!1870)) ((_ sign_extend 32) (currentBit!10107 thiss!1870)) (bvsub to!496 i!761)))))

(assert (= (and start!46718 res!188098) b!224087))

(assert (= (and b!224087 res!188099) b!224088))

(assert (= (and b!224088 res!188100) b!224089))

(assert (= start!46718 b!224090))

(declare-fun m!343703 () Bool)

(assert (=> b!224089 m!343703))

(declare-fun m!343705 () Bool)

(assert (=> b!224089 m!343705))

(declare-fun m!343707 () Bool)

(assert (=> b!224089 m!343707))

(declare-fun m!343709 () Bool)

(assert (=> b!224089 m!343709))

(declare-fun m!343711 () Bool)

(assert (=> b!224089 m!343711))

(declare-fun m!343713 () Bool)

(assert (=> b!224089 m!343713))

(declare-fun m!343715 () Bool)

(assert (=> b!224089 m!343715))

(declare-fun m!343717 () Bool)

(assert (=> b!224089 m!343717))

(declare-fun m!343719 () Bool)

(assert (=> b!224089 m!343719))

(declare-fun m!343721 () Bool)

(assert (=> b!224089 m!343721))

(declare-fun m!343723 () Bool)

(assert (=> b!224089 m!343723))

(declare-fun m!343725 () Bool)

(assert (=> b!224089 m!343725))

(declare-fun m!343727 () Bool)

(assert (=> start!46718 m!343727))

(declare-fun m!343729 () Bool)

(assert (=> start!46718 m!343729))

(declare-fun m!343731 () Bool)

(assert (=> b!224090 m!343731))

(declare-fun m!343733 () Bool)

(assert (=> b!224087 m!343733))

(push 1)

(assert (not start!46718))

(assert (not b!224087))

(assert (not b!224089))

(assert (not b!224090))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

