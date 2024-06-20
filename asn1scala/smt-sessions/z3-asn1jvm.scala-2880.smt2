; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68998 () Bool)

(assert start!68998)

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-datatypes ((array!18958 0))(
  ( (array!18959 (arr!9308 (Array (_ BitVec 32) (_ BitVec 8))) (size!8228 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13560 0))(
  ( (BitStream!13561 (buf!7841 array!18958) (currentByte!14444 (_ BitVec 32)) (currentBit!14439 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13560)

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun b2!97 () BitStream!13560)

(assert (=> start!68998 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8228 (buf!7841 b1!97)) (size!8228 (buf!7841 b2!97))) (or (bvsgt ((_ sign_extend 32) (size!8228 (buf!7841 b1!97))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!14444 b1!97)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!14439 b1!97)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!68998 true))

(declare-fun e!223493 () Bool)

(declare-fun inv!12 (BitStream!13560) Bool)

(assert (=> start!68998 (and (inv!12 b1!97) e!223493)))

(declare-fun e!223495 () Bool)

(assert (=> start!68998 (and (inv!12 b2!97) e!223495)))

(declare-fun b!311038 () Bool)

(declare-fun array_inv!7780 (array!18958) Bool)

(assert (=> b!311038 (= e!223493 (array_inv!7780 (buf!7841 b1!97)))))

(declare-fun b!311039 () Bool)

(assert (=> b!311039 (= e!223495 (array_inv!7780 (buf!7841 b2!97)))))

(assert (= start!68998 b!311038))

(assert (= start!68998 b!311039))

(declare-fun m!448891 () Bool)

(assert (=> start!68998 m!448891))

(declare-fun m!448893 () Bool)

(assert (=> start!68998 m!448893))

(declare-fun m!448895 () Bool)

(assert (=> b!311038 m!448895))

(declare-fun m!448897 () Bool)

(assert (=> b!311039 m!448897))

(check-sat (not b!311039) (not start!68998) (not b!311038))
(check-sat)
