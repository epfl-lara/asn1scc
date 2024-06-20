; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41588 () Bool)

(assert start!41588)

(declare-fun res!163377 () Bool)

(declare-fun e!134296 () Bool)

(assert (=> start!41588 (=> (not res!163377) (not e!134296))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!41588 (= res!163377 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!41588 e!134296))

(assert (=> start!41588 true))

(declare-datatypes ((array!10025 0))(
  ( (array!10026 (arr!5350 (Array (_ BitVec 32) (_ BitVec 8))) (size!4420 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7948 0))(
  ( (BitStream!7949 (buf!4906 array!10025) (currentByte!9208 (_ BitVec 32)) (currentBit!9203 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7948)

(declare-fun e!134295 () Bool)

(declare-fun inv!12 (BitStream!7948) Bool)

(assert (=> start!41588 (and (inv!12 thiss!1204) e!134295)))

(declare-fun b!195313 () Bool)

(declare-fun res!163375 () Bool)

(assert (=> b!195313 (=> (not res!163375) (not e!134296))))

(assert (=> b!195313 (= res!163375 (= i!590 nBits!348))))

(declare-fun b!195314 () Bool)

(declare-fun res!163376 () Bool)

(assert (=> b!195314 (=> (not res!163376) (not e!134296))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!195314 (= res!163376 (invariant!0 (currentBit!9203 thiss!1204) (currentByte!9208 thiss!1204) (size!4420 (buf!4906 thiss!1204))))))

(declare-fun b!195315 () Bool)

(declare-fun array_inv!4161 (array!10025) Bool)

(assert (=> b!195315 (= e!134295 (array_inv!4161 (buf!4906 thiss!1204)))))

(declare-fun b!195316 () Bool)

(declare-fun lt!303793 () (_ BitVec 64))

(assert (=> b!195316 (= e!134296 (not (= lt!303793 (bvsub (bvadd lt!303793 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!195316 (= lt!303793 (bitIndex!0 (size!4420 (buf!4906 thiss!1204)) (currentByte!9208 thiss!1204) (currentBit!9203 thiss!1204)))))

(declare-fun b!195317 () Bool)

(declare-fun res!163374 () Bool)

(assert (=> b!195317 (=> (not res!163374) (not e!134296))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!195317 (= res!163374 (validate_offset_bits!1 ((_ sign_extend 32) (size!4420 (buf!4906 thiss!1204))) ((_ sign_extend 32) (currentByte!9208 thiss!1204)) ((_ sign_extend 32) (currentBit!9203 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(assert (= (and start!41588 res!163377) b!195317))

(assert (= (and b!195317 res!163374) b!195314))

(assert (= (and b!195314 res!163376) b!195313))

(assert (= (and b!195313 res!163375) b!195316))

(assert (= start!41588 b!195315))

(declare-fun m!302555 () Bool)

(assert (=> b!195315 m!302555))

(declare-fun m!302557 () Bool)

(assert (=> b!195314 m!302557))

(declare-fun m!302559 () Bool)

(assert (=> b!195316 m!302559))

(declare-fun m!302561 () Bool)

(assert (=> b!195317 m!302561))

(declare-fun m!302563 () Bool)

(assert (=> start!41588 m!302563))

(push 1)

(assert (not start!41588))

(assert (not b!195314))

(assert (not b!195317))

(assert (not b!195316))

(assert (not b!195315))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

