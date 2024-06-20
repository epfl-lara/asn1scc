; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47378 () Bool)

(assert start!47378)

(declare-fun b!225974 () Bool)

(declare-fun e!154390 () Bool)

(declare-fun i!761 () (_ BitVec 32))

(assert (=> b!225974 (= e!154390 (not (or (not (= (bvand i!761 #b10000000000000000000000000000000) #b00000000000000000000000000000000)) (= (bvand i!761 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!761) #b10000000000000000000000000000000)))))))

(declare-datatypes ((array!11279 0))(
  ( (array!11280 (arr!5905 (Array (_ BitVec 32) (_ BitVec 8))) (size!4948 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8992 0))(
  ( (BitStream!8993 (buf!5489 array!11279) (currentByte!10291 (_ BitVec 32)) (currentBit!10286 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!19346 0))(
  ( (tuple2!19347 (_1!10460 (_ BitVec 8)) (_2!10460 BitStream!8992)) )
))
(declare-fun lt!359102 () tuple2!19346)

(declare-fun to!496 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!225974 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4948 (buf!5489 (_2!10460 lt!359102)))) ((_ sign_extend 32) (currentByte!10291 (_2!10460 lt!359102))) ((_ sign_extend 32) (currentBit!10286 (_2!10460 lt!359102))) (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun thiss!1870 () BitStream!8992)

(declare-datatypes ((Unit!16641 0))(
  ( (Unit!16642) )
))
(declare-fun lt!359103 () Unit!16641)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!8992 BitStream!8992 (_ BitVec 64) (_ BitVec 32)) Unit!16641)

(assert (=> b!225974 (= lt!359103 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10460 lt!359102) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(declare-fun readByte!0 (BitStream!8992) tuple2!19346)

(assert (=> b!225974 (= lt!359102 (readByte!0 thiss!1870))))

(declare-fun b!225972 () Bool)

(declare-fun res!189633 () Bool)

(assert (=> b!225972 (=> (not res!189633) (not e!154390))))

(assert (=> b!225972 (= res!189633 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4948 (buf!5489 thiss!1870))) ((_ sign_extend 32) (currentByte!10291 thiss!1870)) ((_ sign_extend 32) (currentBit!10286 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun res!189634 () Bool)

(assert (=> start!47378 (=> (not res!189634) (not e!154390))))

(declare-fun arr!308 () array!11279)

(assert (=> start!47378 (= res!189634 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4948 arr!308))))))

(assert (=> start!47378 e!154390))

(assert (=> start!47378 true))

(declare-fun array_inv!4689 (array!11279) Bool)

(assert (=> start!47378 (array_inv!4689 arr!308)))

(declare-fun e!154393 () Bool)

(declare-fun inv!12 (BitStream!8992) Bool)

(assert (=> start!47378 (and (inv!12 thiss!1870) e!154393)))

(declare-fun b!225973 () Bool)

(declare-fun res!189632 () Bool)

(assert (=> b!225973 (=> (not res!189632) (not e!154390))))

(assert (=> b!225973 (= res!189632 (bvslt i!761 to!496))))

(declare-fun b!225975 () Bool)

(assert (=> b!225975 (= e!154393 (array_inv!4689 (buf!5489 thiss!1870)))))

(assert (= (and start!47378 res!189634) b!225972))

(assert (= (and b!225972 res!189633) b!225973))

(assert (= (and b!225973 res!189632) b!225974))

(assert (= start!47378 b!225975))

(declare-fun m!347005 () Bool)

(assert (=> b!225974 m!347005))

(declare-fun m!347007 () Bool)

(assert (=> b!225974 m!347007))

(declare-fun m!347009 () Bool)

(assert (=> b!225974 m!347009))

(declare-fun m!347011 () Bool)

(assert (=> b!225972 m!347011))

(declare-fun m!347013 () Bool)

(assert (=> start!47378 m!347013))

(declare-fun m!347015 () Bool)

(assert (=> start!47378 m!347015))

(declare-fun m!347017 () Bool)

(assert (=> b!225975 m!347017))

(push 1)

(assert (not b!225974))

(assert (not b!225975))

(assert (not b!225972))

(assert (not start!47378))

(check-sat)

(pop 1)

(push 1)

(check-sat)

