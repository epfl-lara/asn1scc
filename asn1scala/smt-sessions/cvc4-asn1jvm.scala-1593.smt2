; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45316 () Bool)

(assert start!45316)

(declare-fun i!541 () (_ BitVec 32))

(declare-fun nBits!265 () (_ BitVec 32))

(declare-datatypes ((array!10680 0))(
  ( (array!10681 (arr!5622 (Array (_ BitVec 32) (_ BitVec 8))) (size!4692 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8492 0))(
  ( (BitStream!8493 (buf!5239 array!10680) (currentByte!9838 (_ BitVec 32)) (currentBit!9833 (_ BitVec 32))) )
))
(declare-fun bs!62 () BitStream!8492)

(assert (=> start!45316 (and (bvsle #b00000000000000000000000000000000 i!541) (bvslt i!541 nBits!265) (bvsle nBits!265 #b00000000000000000000000001000000) (or (bvsgt ((_ sign_extend 32) (size!4692 (buf!5239 bs!62))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!9838 bs!62)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!9833 bs!62)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!45316 true))

(declare-fun e!149351 () Bool)

(declare-fun inv!12 (BitStream!8492) Bool)

(assert (=> start!45316 (and (inv!12 bs!62) e!149351)))

(declare-fun b!219975 () Bool)

(declare-fun array_inv!4433 (array!10680) Bool)

(assert (=> b!219975 (= e!149351 (array_inv!4433 (buf!5239 bs!62)))))

(assert (= start!45316 b!219975))

(declare-fun m!338711 () Bool)

(assert (=> start!45316 m!338711))

(declare-fun m!338713 () Bool)

(assert (=> b!219975 m!338713))

(push 1)

(assert (not start!45316))

(assert (not b!219975))

(check-sat)

(pop 1)

(push 1)

(check-sat)

