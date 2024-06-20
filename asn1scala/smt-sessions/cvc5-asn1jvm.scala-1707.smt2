; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47246 () Bool)

(assert start!47246)

(declare-fun b!225576 () Bool)

(declare-fun res!189290 () Bool)

(declare-fun e!154018 () Bool)

(assert (=> b!225576 (=> (not res!189290) (not e!154018))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!225576 (= res!189290 (bvslt i!761 to!496))))

(declare-fun b!225575 () Bool)

(declare-fun res!189289 () Bool)

(assert (=> b!225575 (=> (not res!189289) (not e!154018))))

(declare-datatypes ((array!11228 0))(
  ( (array!11229 (arr!5884 (Array (_ BitVec 32) (_ BitVec 8))) (size!4927 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8950 0))(
  ( (BitStream!8951 (buf!5468 array!11228) (currentByte!10252 (_ BitVec 32)) (currentBit!10247 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8950)

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!225575 (= res!189289 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4927 (buf!5468 thiss!1870))) ((_ sign_extend 32) (currentByte!10252 thiss!1870)) ((_ sign_extend 32) (currentBit!10247 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!225577 () Bool)

(declare-fun arr!308 () array!11228)

(assert (=> b!225577 (= e!154018 (bvsge i!761 (size!4927 arr!308)))))

(declare-datatypes ((tuple2!19286 0))(
  ( (tuple2!19287 (_1!10430 (_ BitVec 8)) (_2!10430 BitStream!8950)) )
))
(declare-fun lt!358692 () tuple2!19286)

(declare-fun readByte!0 (BitStream!8950) tuple2!19286)

(assert (=> b!225577 (= lt!358692 (readByte!0 thiss!1870))))

(declare-fun b!225578 () Bool)

(declare-fun e!154019 () Bool)

(declare-fun array_inv!4668 (array!11228) Bool)

(assert (=> b!225578 (= e!154019 (array_inv!4668 (buf!5468 thiss!1870)))))

(declare-fun res!189291 () Bool)

(assert (=> start!47246 (=> (not res!189291) (not e!154018))))

(assert (=> start!47246 (= res!189291 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4927 arr!308))))))

(assert (=> start!47246 e!154018))

(assert (=> start!47246 true))

(assert (=> start!47246 (array_inv!4668 arr!308)))

(declare-fun inv!12 (BitStream!8950) Bool)

(assert (=> start!47246 (and (inv!12 thiss!1870) e!154019)))

(assert (= (and start!47246 res!189291) b!225575))

(assert (= (and b!225575 res!189289) b!225576))

(assert (= (and b!225576 res!189290) b!225577))

(assert (= start!47246 b!225578))

(declare-fun m!346617 () Bool)

(assert (=> b!225575 m!346617))

(declare-fun m!346619 () Bool)

(assert (=> b!225577 m!346619))

(declare-fun m!346621 () Bool)

(assert (=> b!225578 m!346621))

(declare-fun m!346623 () Bool)

(assert (=> start!47246 m!346623))

(declare-fun m!346625 () Bool)

(assert (=> start!47246 m!346625))

(push 1)

(assert (not b!225578))

(assert (not b!225577))

(assert (not b!225575))

(assert (not start!47246))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

