; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45312 () Bool)

(assert start!45312)

(declare-fun i!541 () (_ BitVec 32))

(declare-fun nBits!265 () (_ BitVec 32))

(declare-datatypes ((array!10676 0))(
  ( (array!10677 (arr!5620 (Array (_ BitVec 32) (_ BitVec 8))) (size!4690 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8488 0))(
  ( (BitStream!8489 (buf!5237 array!10676) (currentByte!9836 (_ BitVec 32)) (currentBit!9831 (_ BitVec 32))) )
))
(declare-fun bs!62 () BitStream!8488)

(assert (=> start!45312 (and (bvsle #b00000000000000000000000000000000 i!541) (bvslt i!541 nBits!265) (bvsle nBits!265 #b00000000000000000000000001000000) (or (bvsgt ((_ sign_extend 32) (size!4690 (buf!5237 bs!62))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!9836 bs!62)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!9831 bs!62)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!45312 true))

(declare-fun e!149339 () Bool)

(declare-fun inv!12 (BitStream!8488) Bool)

(assert (=> start!45312 (and (inv!12 bs!62) e!149339)))

(declare-fun b!219969 () Bool)

(declare-fun array_inv!4431 (array!10676) Bool)

(assert (=> b!219969 (= e!149339 (array_inv!4431 (buf!5237 bs!62)))))

(assert (= start!45312 b!219969))

(declare-fun m!338703 () Bool)

(assert (=> start!45312 m!338703))

(declare-fun m!338705 () Bool)

(assert (=> b!219969 m!338705))

(push 1)

(assert (not b!219969))

(assert (not start!45312))

(check-sat)

(pop 1)

(push 1)

(check-sat)

