; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47082 () Bool)

(assert start!47082)

(declare-fun b!225129 () Bool)

(declare-fun res!188936 () Bool)

(declare-fun e!153570 () Bool)

(assert (=> b!225129 (=> (not res!188936) (not e!153570))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!225129 (= res!188936 (bvsge i!761 to!496))))

(declare-fun b!225128 () Bool)

(declare-fun res!188937 () Bool)

(assert (=> b!225128 (=> (not res!188937) (not e!153570))))

(declare-datatypes ((array!11154 0))(
  ( (array!11155 (arr!5850 (Array (_ BitVec 32) (_ BitVec 8))) (size!4893 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8888 0))(
  ( (BitStream!8889 (buf!5437 array!11154) (currentByte!10203 (_ BitVec 32)) (currentBit!10198 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8888)

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!225128 (= res!188937 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4893 (buf!5437 thiss!1870))) ((_ sign_extend 32) (currentByte!10203 thiss!1870)) ((_ sign_extend 32) (currentBit!10198 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun res!188935 () Bool)

(assert (=> start!47082 (=> (not res!188935) (not e!153570))))

(declare-fun arr!308 () array!11154)

(assert (=> start!47082 (= res!188935 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4893 arr!308))))))

(assert (=> start!47082 e!153570))

(assert (=> start!47082 true))

(declare-fun array_inv!4634 (array!11154) Bool)

(assert (=> start!47082 (array_inv!4634 arr!308)))

(declare-fun e!153572 () Bool)

(declare-fun inv!12 (BitStream!8888) Bool)

(assert (=> start!47082 (and (inv!12 thiss!1870) e!153572)))

(declare-fun b!225131 () Bool)

(assert (=> b!225131 (= e!153572 (array_inv!4634 (buf!5437 thiss!1870)))))

(declare-fun b!225130 () Bool)

(assert (=> b!225130 (= e!153570 (not true))))

(declare-fun arrayRangesEq!783 (array!11154 array!11154 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!225130 (arrayRangesEq!783 arr!308 arr!308 #b00000000000000000000000000000000 (size!4893 arr!308))))

(declare-datatypes ((Unit!16531 0))(
  ( (Unit!16532) )
))
(declare-fun lt!358329 () Unit!16531)

(declare-fun arrayRangesEqReflexiveLemma!87 (array!11154) Unit!16531)

(assert (=> b!225130 (= lt!358329 (arrayRangesEqReflexiveLemma!87 arr!308))))

(declare-fun lt!358328 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!225130 (= lt!358328 (bitIndex!0 (size!4893 (buf!5437 thiss!1870)) (currentByte!10203 thiss!1870) (currentBit!10198 thiss!1870)))))

(assert (= (and start!47082 res!188935) b!225128))

(assert (= (and b!225128 res!188937) b!225129))

(assert (= (and b!225129 res!188936) b!225130))

(assert (= start!47082 b!225131))

(declare-fun m!346039 () Bool)

(assert (=> b!225128 m!346039))

(declare-fun m!346041 () Bool)

(assert (=> start!47082 m!346041))

(declare-fun m!346043 () Bool)

(assert (=> start!47082 m!346043))

(declare-fun m!346045 () Bool)

(assert (=> b!225131 m!346045))

(declare-fun m!346047 () Bool)

(assert (=> b!225130 m!346047))

(declare-fun m!346049 () Bool)

(assert (=> b!225130 m!346049))

(declare-fun m!346051 () Bool)

(assert (=> b!225130 m!346051))

(push 1)

