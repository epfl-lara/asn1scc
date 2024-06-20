; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41594 () Bool)

(assert start!41594)

(declare-fun b!195360 () Bool)

(declare-fun res!163414 () Bool)

(declare-fun e!134325 () Bool)

(assert (=> b!195360 (=> (not res!163414) (not e!134325))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!195360 (= res!163414 (= i!590 nBits!348))))

(declare-fun b!195361 () Bool)

(declare-fun e!134327 () Bool)

(declare-datatypes ((array!10031 0))(
  ( (array!10032 (arr!5353 (Array (_ BitVec 32) (_ BitVec 8))) (size!4423 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7954 0))(
  ( (BitStream!7955 (buf!4909 array!10031) (currentByte!9211 (_ BitVec 32)) (currentBit!9206 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7954)

(declare-fun array_inv!4164 (array!10031) Bool)

(assert (=> b!195361 (= e!134327 (array_inv!4164 (buf!4909 thiss!1204)))))

(declare-fun b!195362 () Bool)

(declare-fun res!163416 () Bool)

(assert (=> b!195362 (=> (not res!163416) (not e!134325))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!195362 (= res!163416 (validate_offset_bits!1 ((_ sign_extend 32) (size!4423 (buf!4909 thiss!1204))) ((_ sign_extend 32) (currentByte!9211 thiss!1204)) ((_ sign_extend 32) (currentBit!9206 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!195363 () Bool)

(declare-fun res!163412 () Bool)

(assert (=> b!195363 (=> (not res!163412) (not e!134325))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!195363 (= res!163412 (invariant!0 (currentBit!9206 thiss!1204) (currentByte!9211 thiss!1204) (size!4423 (buf!4909 thiss!1204))))))

(declare-fun res!163413 () Bool)

(assert (=> start!41594 (=> (not res!163413) (not e!134325))))

(assert (=> start!41594 (= res!163413 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!41594 e!134325))

(assert (=> start!41594 true))

(declare-fun inv!12 (BitStream!7954) Bool)

(assert (=> start!41594 (and (inv!12 thiss!1204) e!134327)))

(declare-fun b!195364 () Bool)

(declare-fun e!134324 () Bool)

(assert (=> b!195364 (= e!134324 (not true))))

(declare-fun isPrefixOf!0 (BitStream!7954 BitStream!7954) Bool)

(assert (=> b!195364 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-datatypes ((Unit!13789 0))(
  ( (Unit!13790) )
))
(declare-fun lt!303804 () Unit!13789)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7954) Unit!13789)

(assert (=> b!195364 (= lt!303804 (lemmaIsPrefixRefl!0 thiss!1204))))

(declare-fun b!195365 () Bool)

(assert (=> b!195365 (= e!134325 e!134324)))

(declare-fun res!163415 () Bool)

(assert (=> b!195365 (=> (not res!163415) (not e!134324))))

(declare-fun lt!303805 () (_ BitVec 64))

(assert (=> b!195365 (= res!163415 (= lt!303805 (bvsub (bvadd lt!303805 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!195365 (= lt!303805 (bitIndex!0 (size!4423 (buf!4909 thiss!1204)) (currentByte!9211 thiss!1204) (currentBit!9206 thiss!1204)))))

(assert (= (and start!41594 res!163413) b!195362))

(assert (= (and b!195362 res!163416) b!195363))

(assert (= (and b!195363 res!163412) b!195360))

(assert (= (and b!195360 res!163414) b!195365))

(assert (= (and b!195365 res!163415) b!195364))

(assert (= start!41594 b!195361))

(declare-fun m!302585 () Bool)

(assert (=> b!195362 m!302585))

(declare-fun m!302587 () Bool)

(assert (=> start!41594 m!302587))

(declare-fun m!302589 () Bool)

(assert (=> b!195363 m!302589))

(declare-fun m!302591 () Bool)

(assert (=> b!195365 m!302591))

(declare-fun m!302593 () Bool)

(assert (=> b!195361 m!302593))

(declare-fun m!302595 () Bool)

(assert (=> b!195364 m!302595))

(declare-fun m!302597 () Bool)

(assert (=> b!195364 m!302597))

(push 1)

(assert (not b!195363))

(assert (not b!195364))

(assert (not b!195361))

(assert (not start!41594))

(assert (not b!195365))

(assert (not b!195362))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

