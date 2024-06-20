; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38942 () Bool)

(assert start!38942)

(declare-fun b!175363 () Bool)

(declare-fun e!122277 () Bool)

(declare-datatypes ((array!9452 0))(
  ( (array!9453 (arr!5101 (Array (_ BitVec 32) (_ BitVec 8))) (size!4171 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7450 0))(
  ( (BitStream!7451 (buf!4608 array!9452) (currentByte!8731 (_ BitVec 32)) (currentBit!8726 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7450)

(declare-fun array_inv!3912 (array!9452) Bool)

(assert (=> b!175363 (= e!122277 (array_inv!3912 (buf!4608 thiss!1204)))))

(declare-fun b!175364 () Bool)

(declare-fun res!145215 () Bool)

(declare-fun e!122275 () Bool)

(assert (=> b!175364 (=> (not res!145215) (not e!122275))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!175364 (= res!145215 (invariant!0 (currentBit!8726 thiss!1204) (currentByte!8731 thiss!1204) (size!4171 (buf!4608 thiss!1204))))))

(declare-fun res!145216 () Bool)

(assert (=> start!38942 (=> (not res!145216) (not e!122275))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!38942 (= res!145216 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!38942 e!122275))

(assert (=> start!38942 true))

(declare-fun inv!12 (BitStream!7450) Bool)

(assert (=> start!38942 (and (inv!12 thiss!1204) e!122277)))

(declare-fun b!175365 () Bool)

(declare-fun res!145217 () Bool)

(assert (=> b!175365 (=> (not res!145217) (not e!122275))))

(assert (=> b!175365 (= res!145217 (= i!590 nBits!348))))

(declare-fun b!175366 () Bool)

(declare-fun e!122276 () Bool)

(assert (=> b!175366 (= e!122276 (not true))))

(declare-datatypes ((tuple2!15088 0))(
  ( (tuple2!15089 (_1!8189 BitStream!7450) (_2!8189 BitStream!7450)) )
))
(declare-fun lt!270445 () tuple2!15088)

(declare-fun reader!0 (BitStream!7450 BitStream!7450) tuple2!15088)

(assert (=> b!175366 (= lt!270445 (reader!0 thiss!1204 thiss!1204))))

(declare-fun isPrefixOf!0 (BitStream!7450 BitStream!7450) Bool)

(assert (=> b!175366 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-datatypes ((Unit!12650 0))(
  ( (Unit!12651) )
))
(declare-fun lt!270444 () Unit!12650)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7450) Unit!12650)

(assert (=> b!175366 (= lt!270444 (lemmaIsPrefixRefl!0 thiss!1204))))

(declare-fun b!175367 () Bool)

(assert (=> b!175367 (= e!122275 e!122276)))

(declare-fun res!145214 () Bool)

(assert (=> b!175367 (=> (not res!145214) (not e!122276))))

(declare-fun lt!270446 () (_ BitVec 64))

(assert (=> b!175367 (= res!145214 (= lt!270446 (bvsub (bvadd lt!270446 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!175367 (= lt!270446 (bitIndex!0 (size!4171 (buf!4608 thiss!1204)) (currentByte!8731 thiss!1204) (currentBit!8726 thiss!1204)))))

(declare-fun b!175368 () Bool)

(declare-fun res!145218 () Bool)

(assert (=> b!175368 (=> (not res!145218) (not e!122275))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!175368 (= res!145218 (validate_offset_bits!1 ((_ sign_extend 32) (size!4171 (buf!4608 thiss!1204))) ((_ sign_extend 32) (currentByte!8731 thiss!1204)) ((_ sign_extend 32) (currentBit!8726 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(assert (= (and start!38942 res!145216) b!175368))

(assert (= (and b!175368 res!145218) b!175364))

(assert (= (and b!175364 res!145215) b!175365))

(assert (= (and b!175365 res!145217) b!175367))

(assert (= (and b!175367 res!145214) b!175366))

(assert (= start!38942 b!175363))

(declare-fun m!275551 () Bool)

(assert (=> start!38942 m!275551))

(declare-fun m!275553 () Bool)

(assert (=> b!175363 m!275553))

(declare-fun m!275555 () Bool)

(assert (=> b!175364 m!275555))

(declare-fun m!275557 () Bool)

(assert (=> b!175366 m!275557))

(declare-fun m!275559 () Bool)

(assert (=> b!175366 m!275559))

(declare-fun m!275561 () Bool)

(assert (=> b!175366 m!275561))

(declare-fun m!275563 () Bool)

(assert (=> b!175368 m!275563))

(declare-fun m!275565 () Bool)

(assert (=> b!175367 m!275565))

(push 1)

(assert (not b!175364))

(assert (not b!175367))

(assert (not b!175366))

(assert (not start!38942))

(assert (not b!175363))

(assert (not b!175368))

(check-sat)

(pop 1)

