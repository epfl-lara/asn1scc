; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47100 () Bool)

(assert start!47100)

(declare-fun b!225237 () Bool)

(declare-fun res!189017 () Bool)

(declare-fun e!153677 () Bool)

(assert (=> b!225237 (=> (not res!189017) (not e!153677))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!225237 (= res!189017 (bvsge i!761 to!496))))

(declare-fun b!225238 () Bool)

(assert (=> b!225238 (= e!153677 (not true))))

(declare-datatypes ((array!11172 0))(
  ( (array!11173 (arr!5859 (Array (_ BitVec 32) (_ BitVec 8))) (size!4902 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11172)

(declare-fun arrayRangesEq!792 (array!11172 array!11172 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!225238 (arrayRangesEq!792 arr!308 arr!308 #b00000000000000000000000000000000 (size!4902 arr!308))))

(declare-datatypes ((Unit!16549 0))(
  ( (Unit!16550) )
))
(declare-fun lt!358383 () Unit!16549)

(declare-fun arrayRangesEqReflexiveLemma!96 (array!11172) Unit!16549)

(assert (=> b!225238 (= lt!358383 (arrayRangesEqReflexiveLemma!96 arr!308))))

(declare-fun lt!358382 () (_ BitVec 64))

(declare-datatypes ((BitStream!8906 0))(
  ( (BitStream!8907 (buf!5446 array!11172) (currentByte!10212 (_ BitVec 32)) (currentBit!10207 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8906)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!225238 (= lt!358382 (bitIndex!0 (size!4902 (buf!5446 thiss!1870)) (currentByte!10212 thiss!1870) (currentBit!10207 thiss!1870)))))

(declare-fun b!225236 () Bool)

(declare-fun res!189018 () Bool)

(assert (=> b!225236 (=> (not res!189018) (not e!153677))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!225236 (= res!189018 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4902 (buf!5446 thiss!1870))) ((_ sign_extend 32) (currentByte!10212 thiss!1870)) ((_ sign_extend 32) (currentBit!10207 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun res!189016 () Bool)

(assert (=> start!47100 (=> (not res!189016) (not e!153677))))

(assert (=> start!47100 (= res!189016 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4902 arr!308))))))

(assert (=> start!47100 e!153677))

(assert (=> start!47100 true))

(declare-fun array_inv!4643 (array!11172) Bool)

(assert (=> start!47100 (array_inv!4643 arr!308)))

(declare-fun e!153679 () Bool)

(declare-fun inv!12 (BitStream!8906) Bool)

(assert (=> start!47100 (and (inv!12 thiss!1870) e!153679)))

(declare-fun b!225239 () Bool)

(assert (=> b!225239 (= e!153679 (array_inv!4643 (buf!5446 thiss!1870)))))

(assert (= (and start!47100 res!189016) b!225236))

(assert (= (and b!225236 res!189018) b!225237))

(assert (= (and b!225237 res!189017) b!225238))

(assert (= start!47100 b!225239))

(declare-fun m!346165 () Bool)

(assert (=> b!225238 m!346165))

(declare-fun m!346167 () Bool)

(assert (=> b!225238 m!346167))

(declare-fun m!346169 () Bool)

(assert (=> b!225238 m!346169))

(declare-fun m!346171 () Bool)

(assert (=> b!225236 m!346171))

(declare-fun m!346173 () Bool)

(assert (=> start!47100 m!346173))

(declare-fun m!346175 () Bool)

(assert (=> start!47100 m!346175))

(declare-fun m!346177 () Bool)

(assert (=> b!225239 m!346177))

(push 1)

(assert (not b!225236))

(assert (not start!47100))

(assert (not b!225239))

(assert (not b!225238))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

