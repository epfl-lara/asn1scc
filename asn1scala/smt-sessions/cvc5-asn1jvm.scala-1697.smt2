; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47090 () Bool)

(assert start!47090)

(declare-fun b!225177 () Bool)

(declare-fun res!188971 () Bool)

(declare-fun e!153618 () Bool)

(assert (=> b!225177 (=> (not res!188971) (not e!153618))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!225177 (= res!188971 (bvsge i!761 to!496))))

(declare-fun res!188972 () Bool)

(assert (=> start!47090 (=> (not res!188972) (not e!153618))))

(declare-datatypes ((array!11162 0))(
  ( (array!11163 (arr!5854 (Array (_ BitVec 32) (_ BitVec 8))) (size!4897 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11162)

(assert (=> start!47090 (= res!188972 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4897 arr!308))))))

(assert (=> start!47090 e!153618))

(assert (=> start!47090 true))

(declare-fun array_inv!4638 (array!11162) Bool)

(assert (=> start!47090 (array_inv!4638 arr!308)))

(declare-datatypes ((BitStream!8896 0))(
  ( (BitStream!8897 (buf!5441 array!11162) (currentByte!10207 (_ BitVec 32)) (currentBit!10202 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8896)

(declare-fun e!153620 () Bool)

(declare-fun inv!12 (BitStream!8896) Bool)

(assert (=> start!47090 (and (inv!12 thiss!1870) e!153620)))

(declare-fun b!225178 () Bool)

(assert (=> b!225178 (= e!153618 (not true))))

(declare-fun arrayRangesEq!787 (array!11162 array!11162 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!225178 (arrayRangesEq!787 arr!308 arr!308 #b00000000000000000000000000000000 (size!4897 arr!308))))

(declare-datatypes ((Unit!16539 0))(
  ( (Unit!16540) )
))
(declare-fun lt!358352 () Unit!16539)

(declare-fun arrayRangesEqReflexiveLemma!91 (array!11162) Unit!16539)

(assert (=> b!225178 (= lt!358352 (arrayRangesEqReflexiveLemma!91 arr!308))))

(declare-fun lt!358353 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!225178 (= lt!358353 (bitIndex!0 (size!4897 (buf!5441 thiss!1870)) (currentByte!10207 thiss!1870) (currentBit!10202 thiss!1870)))))

(declare-fun b!225176 () Bool)

(declare-fun res!188973 () Bool)

(assert (=> b!225176 (=> (not res!188973) (not e!153618))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!225176 (= res!188973 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4897 (buf!5441 thiss!1870))) ((_ sign_extend 32) (currentByte!10207 thiss!1870)) ((_ sign_extend 32) (currentBit!10202 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!225179 () Bool)

(assert (=> b!225179 (= e!153620 (array_inv!4638 (buf!5441 thiss!1870)))))

(assert (= (and start!47090 res!188972) b!225176))

(assert (= (and b!225176 res!188973) b!225177))

(assert (= (and b!225177 res!188971) b!225178))

(assert (= start!47090 b!225179))

(declare-fun m!346095 () Bool)

(assert (=> start!47090 m!346095))

(declare-fun m!346097 () Bool)

(assert (=> start!47090 m!346097))

(declare-fun m!346099 () Bool)

(assert (=> b!225178 m!346099))

(declare-fun m!346101 () Bool)

(assert (=> b!225178 m!346101))

(declare-fun m!346103 () Bool)

(assert (=> b!225178 m!346103))

(declare-fun m!346105 () Bool)

(assert (=> b!225176 m!346105))

(declare-fun m!346107 () Bool)

(assert (=> b!225179 m!346107))

(push 1)

(assert (not b!225176))

(assert (not start!47090))

(assert (not b!225178))

(assert (not b!225179))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

