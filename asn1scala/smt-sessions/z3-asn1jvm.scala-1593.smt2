; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45314 () Bool)

(assert start!45314)

(declare-fun i!541 () (_ BitVec 32))

(declare-fun nBits!265 () (_ BitVec 32))

(declare-datatypes ((array!10678 0))(
  ( (array!10679 (arr!5621 (Array (_ BitVec 32) (_ BitVec 8))) (size!4691 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8490 0))(
  ( (BitStream!8491 (buf!5238 array!10678) (currentByte!9837 (_ BitVec 32)) (currentBit!9832 (_ BitVec 32))) )
))
(declare-fun bs!62 () BitStream!8490)

(assert (=> start!45314 (and (bvsle #b00000000000000000000000000000000 i!541) (bvslt i!541 nBits!265) (bvsle nBits!265 #b00000000000000000000000001000000) (or (bvsgt ((_ sign_extend 32) (size!4691 (buf!5238 bs!62))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!9837 bs!62)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!9832 bs!62)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!45314 true))

(declare-fun e!149345 () Bool)

(declare-fun inv!12 (BitStream!8490) Bool)

(assert (=> start!45314 (and (inv!12 bs!62) e!149345)))

(declare-fun b!219972 () Bool)

(declare-fun array_inv!4432 (array!10678) Bool)

(assert (=> b!219972 (= e!149345 (array_inv!4432 (buf!5238 bs!62)))))

(assert (= start!45314 b!219972))

(declare-fun m!338707 () Bool)

(assert (=> start!45314 m!338707))

(declare-fun m!338709 () Bool)

(assert (=> b!219972 m!338709))

(check-sat (not b!219972) (not start!45314))
(check-sat)
