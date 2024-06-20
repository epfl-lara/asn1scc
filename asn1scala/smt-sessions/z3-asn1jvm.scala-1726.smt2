; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47662 () Bool)

(assert start!47662)

(declare-fun res!190405 () Bool)

(declare-fun e!155197 () Bool)

(assert (=> start!47662 (=> (not res!190405) (not e!155197))))

(declare-datatypes ((array!11368 0))(
  ( (array!11369 (arr!5957 (Array (_ BitVec 32) (_ BitVec 8))) (size!4985 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11368)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!47662 (= res!190405 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4985 arr!308))))))

(assert (=> start!47662 e!155197))

(assert (=> start!47662 true))

(declare-fun array_inv!4726 (array!11368) Bool)

(assert (=> start!47662 (array_inv!4726 arr!308)))

(declare-datatypes ((BitStream!9066 0))(
  ( (BitStream!9067 (buf!5526 array!11368) (currentByte!10358 (_ BitVec 32)) (currentBit!10353 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9066)

(declare-fun e!155194 () Bool)

(declare-fun inv!12 (BitStream!9066) Bool)

(assert (=> start!47662 (and (inv!12 thiss!1870) e!155194)))

(declare-fun b!226931 () Bool)

(declare-fun lt!362125 () (_ BitVec 64))

(declare-fun lt!362124 () (_ BitVec 64))

(assert (=> b!226931 (= e!155197 (not (= (bvadd lt!362124 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!362125)))))

(declare-fun lt!362126 () (_ BitVec 64))

(declare-fun lt!362121 () (_ BitVec 32))

(assert (=> b!226931 (= (bvadd lt!362126 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!362121))) lt!362125)))

(declare-datatypes ((Unit!16880 0))(
  ( (Unit!16881) )
))
(declare-datatypes ((tuple3!1352 0))(
  ( (tuple3!1353 (_1!10558 Unit!16880) (_2!10558 BitStream!9066) (_3!818 array!11368)) )
))
(declare-fun lt!362127 () tuple3!1352)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!226931 (= lt!362125 (bitIndex!0 (size!4985 (buf!5526 (_2!10558 lt!362127))) (currentByte!10358 (_2!10558 lt!362127)) (currentBit!10353 (_2!10558 lt!362127))))))

(assert (=> b!226931 (= lt!362126 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!362124))))

(declare-datatypes ((tuple2!19480 0))(
  ( (tuple2!19481 (_1!10559 (_ BitVec 8)) (_2!10559 BitStream!9066)) )
))
(declare-fun lt!362123 () tuple2!19480)

(assert (=> b!226931 (= lt!362126 (bitIndex!0 (size!4985 (buf!5526 (_2!10559 lt!362123))) (currentByte!10358 (_2!10559 lt!362123)) (currentBit!10353 (_2!10559 lt!362123))))))

(assert (=> b!226931 (= lt!362124 (bitIndex!0 (size!4985 (buf!5526 thiss!1870)) (currentByte!10358 thiss!1870) (currentBit!10353 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!9066 array!11368 (_ BitVec 32) (_ BitVec 32)) tuple3!1352)

(assert (=> b!226931 (= lt!362127 (readByteArrayLoop!0 (_2!10559 lt!362123) (array!11369 (store (arr!5957 arr!308) i!761 (_1!10559 lt!362123)) (size!4985 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!226931 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4985 (buf!5526 (_2!10559 lt!362123)))) ((_ sign_extend 32) (currentByte!10358 (_2!10559 lt!362123))) ((_ sign_extend 32) (currentBit!10353 (_2!10559 lt!362123))) lt!362121)))

(assert (=> b!226931 (= lt!362121 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!362122 () Unit!16880)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9066 BitStream!9066 (_ BitVec 64) (_ BitVec 32)) Unit!16880)

(assert (=> b!226931 (= lt!362122 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10559 lt!362123) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(declare-fun readByte!0 (BitStream!9066) tuple2!19480)

(assert (=> b!226931 (= lt!362123 (readByte!0 thiss!1870))))

(declare-fun b!226930 () Bool)

(declare-fun res!190404 () Bool)

(assert (=> b!226930 (=> (not res!190404) (not e!155197))))

(assert (=> b!226930 (= res!190404 (bvslt i!761 to!496))))

(declare-fun b!226932 () Bool)

(assert (=> b!226932 (= e!155194 (array_inv!4726 (buf!5526 thiss!1870)))))

(declare-fun b!226929 () Bool)

(declare-fun res!190403 () Bool)

(assert (=> b!226929 (=> (not res!190403) (not e!155197))))

(assert (=> b!226929 (= res!190403 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4985 (buf!5526 thiss!1870))) ((_ sign_extend 32) (currentByte!10358 thiss!1870)) ((_ sign_extend 32) (currentBit!10353 thiss!1870)) (bvsub to!496 i!761)))))

(assert (= (and start!47662 res!190405) b!226929))

(assert (= (and b!226929 res!190403) b!226930))

(assert (= (and b!226930 res!190404) b!226931))

(assert (= start!47662 b!226932))

(declare-fun m!348745 () Bool)

(assert (=> start!47662 m!348745))

(declare-fun m!348747 () Bool)

(assert (=> start!47662 m!348747))

(declare-fun m!348749 () Bool)

(assert (=> b!226931 m!348749))

(declare-fun m!348751 () Bool)

(assert (=> b!226931 m!348751))

(declare-fun m!348753 () Bool)

(assert (=> b!226931 m!348753))

(declare-fun m!348755 () Bool)

(assert (=> b!226931 m!348755))

(declare-fun m!348757 () Bool)

(assert (=> b!226931 m!348757))

(declare-fun m!348759 () Bool)

(assert (=> b!226931 m!348759))

(declare-fun m!348761 () Bool)

(assert (=> b!226931 m!348761))

(declare-fun m!348763 () Bool)

(assert (=> b!226931 m!348763))

(declare-fun m!348765 () Bool)

(assert (=> b!226932 m!348765))

(declare-fun m!348767 () Bool)

(assert (=> b!226929 m!348767))

(check-sat (not b!226929) (not b!226931) (not start!47662) (not b!226932))
(check-sat)
