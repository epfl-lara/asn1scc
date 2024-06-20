; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72758 () Bool)

(assert start!72758)

(declare-fun b!324460 () Bool)

(declare-fun res!266282 () Bool)

(declare-fun e!233901 () Bool)

(assert (=> b!324460 (=> (not res!266282) (not e!233901))))

(declare-datatypes ((array!20856 0))(
  ( (array!20857 (arr!10158 (Array (_ BitVec 32) (_ BitVec 8))) (size!9066 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14294 0))(
  ( (BitStream!14295 (buf!8208 array!20856) (currentByte!15175 (_ BitVec 32)) (currentBit!15170 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14294)

(assert (=> b!324460 (= res!266282 (bvslt (currentBit!15170 thiss!877) #b00000000000000000000000000000111))))

(declare-fun b!324463 () Bool)

(declare-fun e!233900 () Bool)

(declare-fun array_inv!8618 (array!20856) Bool)

(assert (=> b!324463 (= e!233900 (array_inv!8618 (buf!8208 thiss!877)))))

(declare-fun res!266284 () Bool)

(assert (=> start!72758 (=> (not res!266284) (not e!233901))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> start!72758 (= res!266284 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!9066 (buf!8208 thiss!877))) ((_ sign_extend 32) (currentByte!15175 thiss!877)) ((_ sign_extend 32) (currentBit!15170 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!72758 e!233901))

(declare-fun inv!12 (BitStream!14294) Bool)

(assert (=> start!72758 (and (inv!12 thiss!877) e!233900)))

(declare-fun b!324461 () Bool)

(declare-fun res!266283 () Bool)

(assert (=> b!324461 (=> (not res!266283) (not e!233901))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!324461 (= res!266283 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!9066 (buf!8208 thiss!877)) (currentByte!15175 thiss!877) (currentBit!15170 thiss!877))) (bitIndex!0 (size!9066 (buf!8208 thiss!877)) (currentByte!15175 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15170 thiss!877)))))))

(declare-fun b!324462 () Bool)

(assert (=> b!324462 (= e!233901 (or (bvsgt ((_ sign_extend 32) (size!9066 (buf!8208 thiss!877))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!15175 thiss!877)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!15170 thiss!877)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (= (and start!72758 res!266284) b!324460))

(assert (= (and b!324460 res!266282) b!324461))

(assert (= (and b!324461 res!266283) b!324462))

(assert (= start!72758 b!324463))

(declare-fun m!462579 () Bool)

(assert (=> b!324463 m!462579))

(declare-fun m!462581 () Bool)

(assert (=> start!72758 m!462581))

(declare-fun m!462583 () Bool)

(assert (=> start!72758 m!462583))

(declare-fun m!462585 () Bool)

(assert (=> b!324461 m!462585))

(declare-fun m!462587 () Bool)

(assert (=> b!324461 m!462587))

(push 1)

(assert (not b!324463))

(assert (not b!324461))

(assert (not start!72758))

(check-sat)

(pop 1)

(push 1)

(check-sat)

