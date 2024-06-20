; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47332 () Bool)

(assert start!47332)

(declare-fun b!225803 () Bool)

(declare-fun res!189487 () Bool)

(declare-fun e!154236 () Bool)

(assert (=> b!225803 (=> (not res!189487) (not e!154236))))

(declare-datatypes ((array!11260 0))(
  ( (array!11261 (arr!5897 (Array (_ BitVec 32) (_ BitVec 8))) (size!4940 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8976 0))(
  ( (BitStream!8977 (buf!5481 array!11260) (currentByte!10277 (_ BitVec 32)) (currentBit!10272 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8976)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!225803 (= res!189487 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4940 (buf!5481 thiss!1870))) ((_ sign_extend 32) (currentByte!10277 thiss!1870)) ((_ sign_extend 32) (currentBit!10272 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!225804 () Bool)

(declare-fun res!189486 () Bool)

(assert (=> b!225804 (=> (not res!189486) (not e!154236))))

(assert (=> b!225804 (= res!189486 (bvslt i!761 to!496))))

(declare-fun res!189484 () Bool)

(assert (=> start!47332 (=> (not res!189484) (not e!154236))))

(declare-fun arr!308 () array!11260)

(assert (=> start!47332 (= res!189484 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4940 arr!308))))))

(assert (=> start!47332 e!154236))

(assert (=> start!47332 true))

(declare-fun array_inv!4681 (array!11260) Bool)

(assert (=> start!47332 (array_inv!4681 arr!308)))

(declare-fun e!154234 () Bool)

(declare-fun inv!12 (BitStream!8976) Bool)

(assert (=> start!47332 (and (inv!12 thiss!1870) e!154234)))

(declare-fun b!225805 () Bool)

(declare-fun e!154237 () Bool)

(assert (=> b!225805 (= e!154237 false)))

(declare-fun lt!358920 () (_ BitVec 64))

(declare-datatypes ((tuple2!19324 0))(
  ( (tuple2!19325 (_1!10449 (_ BitVec 8)) (_2!10449 BitStream!8976)) )
))
(declare-fun lt!358919 () tuple2!19324)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!225805 (= lt!358920 (bitIndex!0 (size!4940 (buf!5481 (_2!10449 lt!358919))) (currentByte!10277 (_2!10449 lt!358919)) (currentBit!10272 (_2!10449 lt!358919))))))

(declare-fun b!225806 () Bool)

(assert (=> b!225806 (= e!154234 (array_inv!4681 (buf!5481 thiss!1870)))))

(declare-fun b!225807 () Bool)

(assert (=> b!225807 (= e!154236 e!154237)))

(declare-fun res!189485 () Bool)

(assert (=> b!225807 (=> (not res!189485) (not e!154237))))

(assert (=> b!225807 (= res!189485 (= (size!4940 (buf!5481 thiss!1870)) (size!4940 (buf!5481 (_2!10449 lt!358919)))))))

(declare-fun readByte!0 (BitStream!8976) tuple2!19324)

(assert (=> b!225807 (= lt!358919 (readByte!0 thiss!1870))))

(assert (= (and start!47332 res!189484) b!225803))

(assert (= (and b!225803 res!189487) b!225804))

(assert (= (and b!225804 res!189486) b!225807))

(assert (= (and b!225807 res!189485) b!225805))

(assert (= start!47332 b!225806))

(declare-fun m!346855 () Bool)

(assert (=> start!47332 m!346855))

(declare-fun m!346857 () Bool)

(assert (=> start!47332 m!346857))

(declare-fun m!346859 () Bool)

(assert (=> b!225807 m!346859))

(declare-fun m!346861 () Bool)

(assert (=> b!225803 m!346861))

(declare-fun m!346863 () Bool)

(assert (=> b!225806 m!346863))

(declare-fun m!346865 () Bool)

(assert (=> b!225805 m!346865))

(check-sat (not b!225806) (not b!225807) (not b!225803) (not start!47332) (not b!225805))
