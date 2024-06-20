; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41562 () Bool)

(assert start!41562)

(declare-fun res!163364 () Bool)

(declare-fun e!134288 () Bool)

(assert (=> start!41562 (=> (not res!163364) (not e!134288))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!41562 (= res!163364 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!41562 e!134288))

(assert (=> start!41562 true))

(declare-datatypes ((array!10020 0))(
  ( (array!10021 (arr!5349 (Array (_ BitVec 32) (_ BitVec 8))) (size!4419 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7946 0))(
  ( (BitStream!7947 (buf!4905 array!10020) (currentByte!9201 (_ BitVec 32)) (currentBit!9196 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7946)

(declare-fun e!134287 () Bool)

(declare-fun inv!12 (BitStream!7946) Bool)

(assert (=> start!41562 (and (inv!12 thiss!1204) e!134287)))

(declare-fun b!195300 () Bool)

(declare-fun res!163365 () Bool)

(assert (=> b!195300 (=> (not res!163365) (not e!134288))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!195300 (= res!163365 (validate_offset_bits!1 ((_ sign_extend 32) (size!4419 (buf!4905 thiss!1204))) ((_ sign_extend 32) (currentByte!9201 thiss!1204)) ((_ sign_extend 32) (currentBit!9196 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!195301 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!195301 (= e!134288 (not (invariant!0 (currentBit!9196 thiss!1204) (currentByte!9201 thiss!1204) (size!4419 (buf!4905 thiss!1204)))))))

(declare-fun b!195302 () Bool)

(declare-fun array_inv!4160 (array!10020) Bool)

(assert (=> b!195302 (= e!134287 (array_inv!4160 (buf!4905 thiss!1204)))))

(assert (= (and start!41562 res!163364) b!195300))

(assert (= (and b!195300 res!163365) b!195301))

(assert (= start!41562 b!195302))

(declare-fun m!302541 () Bool)

(assert (=> start!41562 m!302541))

(declare-fun m!302543 () Bool)

(assert (=> b!195300 m!302543))

(declare-fun m!302545 () Bool)

(assert (=> b!195301 m!302545))

(declare-fun m!302547 () Bool)

(assert (=> b!195302 m!302547))

(push 1)

(assert (not b!195301))

(assert (not b!195302))

(assert (not b!195300))

(assert (not start!41562))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!66229 () Bool)

(assert (=> d!66229 (= (invariant!0 (currentBit!9196 thiss!1204) (currentByte!9201 thiss!1204) (size!4419 (buf!4905 thiss!1204))) (and (bvsge (currentBit!9196 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9196 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9201 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9201 thiss!1204) (size!4419 (buf!4905 thiss!1204))) (and (= (currentBit!9196 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9201 thiss!1204) (size!4419 (buf!4905 thiss!1204)))))))))

(assert (=> b!195301 d!66229))

(declare-fun d!66235 () Bool)

(assert (=> d!66235 (= (array_inv!4160 (buf!4905 thiss!1204)) (bvsge (size!4419 (buf!4905 thiss!1204)) #b00000000000000000000000000000000))))

