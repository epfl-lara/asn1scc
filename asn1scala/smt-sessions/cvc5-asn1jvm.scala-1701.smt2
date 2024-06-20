; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47210 () Bool)

(assert start!47210)

(declare-fun res!189165 () Bool)

(declare-fun e!153830 () Bool)

(assert (=> start!47210 (=> (not res!189165) (not e!153830))))

(declare-datatypes ((array!11192 0))(
  ( (array!11193 (arr!5866 (Array (_ BitVec 32) (_ BitVec 8))) (size!4909 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11192)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!47210 (= res!189165 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4909 arr!308))))))

(assert (=> start!47210 e!153830))

(assert (=> start!47210 true))

(declare-fun array_inv!4650 (array!11192) Bool)

(assert (=> start!47210 (array_inv!4650 arr!308)))

(declare-datatypes ((BitStream!8920 0))(
  ( (BitStream!8921 (buf!5453 array!11192) (currentByte!10237 (_ BitVec 32)) (currentBit!10232 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8920)

(declare-fun e!153827 () Bool)

(declare-fun inv!12 (BitStream!8920) Bool)

(assert (=> start!47210 (and (inv!12 thiss!1870) e!153827)))

(declare-fun b!225406 () Bool)

(assert (=> b!225406 (= e!153830 (not true))))

(declare-fun arrayRangesEq!799 (array!11192 array!11192 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!225406 (arrayRangesEq!799 arr!308 arr!308 #b00000000000000000000000000000000 i!761)))

(declare-datatypes ((Unit!16563 0))(
  ( (Unit!16564) )
))
(declare-fun lt!358588 () Unit!16563)

(declare-fun arrayRangesEqSlicedLemma!88 (array!11192 array!11192 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16563)

(assert (=> b!225406 (= lt!358588 (arrayRangesEqSlicedLemma!88 arr!308 arr!308 #b00000000000000000000000000000000 (size!4909 arr!308) #b00000000000000000000000000000000 i!761))))

(assert (=> b!225406 (arrayRangesEq!799 arr!308 arr!308 #b00000000000000000000000000000000 (size!4909 arr!308))))

(declare-fun lt!358589 () Unit!16563)

(declare-fun arrayRangesEqReflexiveLemma!103 (array!11192) Unit!16563)

(assert (=> b!225406 (= lt!358589 (arrayRangesEqReflexiveLemma!103 arr!308))))

(declare-fun lt!358590 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!225406 (= lt!358590 (bitIndex!0 (size!4909 (buf!5453 thiss!1870)) (currentByte!10237 thiss!1870) (currentBit!10232 thiss!1870)))))

(declare-fun b!225405 () Bool)

(declare-fun res!189163 () Bool)

(assert (=> b!225405 (=> (not res!189163) (not e!153830))))

(assert (=> b!225405 (= res!189163 (bvsge i!761 to!496))))

(declare-fun b!225404 () Bool)

(declare-fun res!189164 () Bool)

(assert (=> b!225404 (=> (not res!189164) (not e!153830))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!225404 (= res!189164 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4909 (buf!5453 thiss!1870))) ((_ sign_extend 32) (currentByte!10237 thiss!1870)) ((_ sign_extend 32) (currentBit!10232 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!225407 () Bool)

(assert (=> b!225407 (= e!153827 (array_inv!4650 (buf!5453 thiss!1870)))))

(assert (= (and start!47210 res!189165) b!225404))

(assert (= (and b!225404 res!189164) b!225405))

(assert (= (and b!225405 res!189163) b!225406))

(assert (= start!47210 b!225407))

(declare-fun m!346371 () Bool)

(assert (=> start!47210 m!346371))

(declare-fun m!346373 () Bool)

(assert (=> start!47210 m!346373))

(declare-fun m!346375 () Bool)

(assert (=> b!225406 m!346375))

(declare-fun m!346377 () Bool)

(assert (=> b!225406 m!346377))

(declare-fun m!346379 () Bool)

(assert (=> b!225406 m!346379))

(declare-fun m!346381 () Bool)

(assert (=> b!225406 m!346381))

(declare-fun m!346383 () Bool)

(assert (=> b!225406 m!346383))

(declare-fun m!346385 () Bool)

(assert (=> b!225404 m!346385))

(declare-fun m!346387 () Bool)

(assert (=> b!225407 m!346387))

(push 1)

(assert (not start!47210))

(assert (not b!225404))

(assert (not b!225406))

(assert (not b!225407))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

