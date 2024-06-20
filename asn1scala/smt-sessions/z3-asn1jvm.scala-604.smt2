; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17286 () Bool)

(assert start!17286)

(declare-datatypes ((array!3898 0))(
  ( (array!3899 (arr!2407 (Array (_ BitVec 32) (_ BitVec 8))) (size!1770 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3102 0))(
  ( (BitStream!3103 (buf!2160 array!3898) (currentByte!4299 (_ BitVec 32)) (currentBit!4294 (_ BitVec 32))) )
))
(declare-fun b!169 () BitStream!3102)

(assert (=> start!17286 (or (bvsgt ((_ sign_extend 32) (size!1770 (buf!2160 b!169))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!4299 b!169)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!4294 b!169)) #b0000000000000000000000000000000001111111111111111111111111111111))))

(declare-fun e!56024 () Bool)

(declare-fun inv!12 (BitStream!3102) Bool)

(assert (=> start!17286 (and (inv!12 b!169) e!56024)))

(declare-fun b!83974 () Bool)

(declare-fun array_inv!1616 (array!3898) Bool)

(assert (=> b!83974 (= e!56024 (array_inv!1616 (buf!2160 b!169)))))

(assert (= start!17286 b!83974))

(declare-fun m!130639 () Bool)

(assert (=> start!17286 m!130639))

(declare-fun m!130641 () Bool)

(assert (=> b!83974 m!130641))

(check-sat (not b!83974) (not start!17286))
(check-sat)
