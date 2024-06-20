; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45322 () Bool)

(assert start!45322)

(declare-fun i!541 () (_ BitVec 32))

(declare-fun nBits!265 () (_ BitVec 32))

(declare-datatypes ((array!10686 0))(
  ( (array!10687 (arr!5625 (Array (_ BitVec 32) (_ BitVec 8))) (size!4695 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8498 0))(
  ( (BitStream!8499 (buf!5242 array!10686) (currentByte!9841 (_ BitVec 32)) (currentBit!9836 (_ BitVec 32))) )
))
(declare-fun bs!62 () BitStream!8498)

(assert (=> start!45322 (and (bvsle #b00000000000000000000000000000000 i!541) (bvslt i!541 nBits!265) (bvsle nBits!265 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!4695 (buf!5242 bs!62))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!9841 bs!62)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!9836 bs!62)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!4695 (buf!5242 bs!62))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!9841 bs!62)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!9836 bs!62)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!45322 true))

(declare-fun e!149369 () Bool)

(declare-fun inv!12 (BitStream!8498) Bool)

(assert (=> start!45322 (and (inv!12 bs!62) e!149369)))

(declare-fun b!219984 () Bool)

(declare-fun array_inv!4436 (array!10686) Bool)

(assert (=> b!219984 (= e!149369 (array_inv!4436 (buf!5242 bs!62)))))

(assert (= start!45322 b!219984))

(declare-fun m!338723 () Bool)

(assert (=> start!45322 m!338723))

(declare-fun m!338725 () Bool)

(assert (=> b!219984 m!338725))

(push 1)

(assert (not start!45322))

(assert (not b!219984))

(check-sat)

(pop 1)

(push 1)

(check-sat)

