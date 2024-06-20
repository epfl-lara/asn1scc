; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47214 () Bool)

(assert start!47214)

(declare-fun b!225431 () Bool)

(declare-fun e!153851 () Bool)

(declare-datatypes ((array!11196 0))(
  ( (array!11197 (arr!5868 (Array (_ BitVec 32) (_ BitVec 8))) (size!4911 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8924 0))(
  ( (BitStream!8925 (buf!5455 array!11196) (currentByte!10239 (_ BitVec 32)) (currentBit!10234 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8924)

(declare-fun array_inv!4652 (array!11196) Bool)

(assert (=> b!225431 (= e!153851 (array_inv!4652 (buf!5455 thiss!1870)))))

(declare-fun b!225429 () Bool)

(declare-fun res!189181 () Bool)

(declare-fun e!153852 () Bool)

(assert (=> b!225429 (=> (not res!189181) (not e!153852))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!225429 (= res!189181 (bvsge i!761 to!496))))

(declare-fun b!225430 () Bool)

(assert (=> b!225430 (= e!153852 (not true))))

(declare-fun arr!308 () array!11196)

(declare-fun arrayRangesEq!801 (array!11196 array!11196 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!225430 (arrayRangesEq!801 arr!308 arr!308 #b00000000000000000000000000000000 i!761)))

(declare-datatypes ((Unit!16567 0))(
  ( (Unit!16568) )
))
(declare-fun lt!358607 () Unit!16567)

(declare-fun arrayRangesEqSlicedLemma!90 (array!11196 array!11196 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16567)

(assert (=> b!225430 (= lt!358607 (arrayRangesEqSlicedLemma!90 arr!308 arr!308 #b00000000000000000000000000000000 (size!4911 arr!308) #b00000000000000000000000000000000 i!761))))

(assert (=> b!225430 (arrayRangesEq!801 arr!308 arr!308 #b00000000000000000000000000000000 (size!4911 arr!308))))

(declare-fun lt!358608 () Unit!16567)

(declare-fun arrayRangesEqReflexiveLemma!105 (array!11196) Unit!16567)

(assert (=> b!225430 (= lt!358608 (arrayRangesEqReflexiveLemma!105 arr!308))))

(declare-fun lt!358606 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!225430 (= lt!358606 (bitIndex!0 (size!4911 (buf!5455 thiss!1870)) (currentByte!10239 thiss!1870) (currentBit!10234 thiss!1870)))))

(declare-fun b!225428 () Bool)

(declare-fun res!189183 () Bool)

(assert (=> b!225428 (=> (not res!189183) (not e!153852))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!225428 (= res!189183 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4911 (buf!5455 thiss!1870))) ((_ sign_extend 32) (currentByte!10239 thiss!1870)) ((_ sign_extend 32) (currentBit!10234 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun res!189182 () Bool)

(assert (=> start!47214 (=> (not res!189182) (not e!153852))))

(assert (=> start!47214 (= res!189182 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4911 arr!308))))))

(assert (=> start!47214 e!153852))

(assert (=> start!47214 true))

(assert (=> start!47214 (array_inv!4652 arr!308)))

(declare-fun inv!12 (BitStream!8924) Bool)

(assert (=> start!47214 (and (inv!12 thiss!1870) e!153851)))

(assert (= (and start!47214 res!189182) b!225428))

(assert (= (and b!225428 res!189183) b!225429))

(assert (= (and b!225429 res!189181) b!225430))

(assert (= start!47214 b!225431))

(declare-fun m!346407 () Bool)

(assert (=> b!225431 m!346407))

(declare-fun m!346409 () Bool)

(assert (=> b!225430 m!346409))

(declare-fun m!346411 () Bool)

(assert (=> b!225430 m!346411))

(declare-fun m!346413 () Bool)

(assert (=> b!225430 m!346413))

(declare-fun m!346415 () Bool)

(assert (=> b!225430 m!346415))

(declare-fun m!346417 () Bool)

(assert (=> b!225430 m!346417))

(declare-fun m!346419 () Bool)

(assert (=> b!225428 m!346419))

(declare-fun m!346421 () Bool)

(assert (=> start!47214 m!346421))

(declare-fun m!346423 () Bool)

(assert (=> start!47214 m!346423))

(push 1)

(assert (not b!225428))

(assert (not b!225430))

(assert (not b!225431))

(assert (not start!47214))

