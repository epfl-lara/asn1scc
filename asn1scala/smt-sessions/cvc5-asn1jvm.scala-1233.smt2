; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34994 () Bool)

(assert start!34994)

(declare-fun res!137380 () Bool)

(declare-fun e!114001 () Bool)

(assert (=> start!34994 (=> (not res!137380) (not e!114001))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!34994 (= res!137380 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34994 e!114001))

(assert (=> start!34994 true))

(declare-datatypes ((array!8301 0))(
  ( (array!8302 (arr!4633 (Array (_ BitVec 32) (_ BitVec 8))) (size!3712 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6580 0))(
  ( (BitStream!6581 (buf!4164 array!8301) (currentByte!7774 (_ BitVec 32)) (currentBit!7769 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6580)

(declare-fun e!114002 () Bool)

(declare-fun inv!12 (BitStream!6580) Bool)

(assert (=> start!34994 (and (inv!12 thiss!1577) e!114002)))

(declare-fun b!164884 () Bool)

(declare-fun res!137381 () Bool)

(assert (=> b!164884 (=> (not res!137381) (not e!114001))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!164884 (= res!137381 (validate_offset_bits!1 ((_ sign_extend 32) (size!3712 (buf!4164 thiss!1577))) ((_ sign_extend 32) (currentByte!7774 thiss!1577)) ((_ sign_extend 32) (currentBit!7769 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!164885 () Bool)

(assert (=> b!164885 (= e!114001 (or (bvslt nBits!511 #b00000000000000000000000000000000) (bvsge nBits!511 #b00000000000000000000000000001001)))))

(declare-fun b!164886 () Bool)

(declare-fun array_inv!3453 (array!8301) Bool)

(assert (=> b!164886 (= e!114002 (array_inv!3453 (buf!4164 thiss!1577)))))

(assert (= (and start!34994 res!137380) b!164884))

(assert (= (and b!164884 res!137381) b!164885))

(assert (= start!34994 b!164886))

(declare-fun m!262243 () Bool)

(assert (=> start!34994 m!262243))

(declare-fun m!262245 () Bool)

(assert (=> b!164884 m!262245))

(declare-fun m!262247 () Bool)

(assert (=> b!164886 m!262247))

(push 1)

(assert (not b!164886))

(assert (not b!164884))

(assert (not start!34994))

(check-sat)

(pop 1)

