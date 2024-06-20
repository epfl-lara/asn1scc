; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17356 () Bool)

(assert start!17356)

(declare-datatypes ((array!3929 0))(
  ( (array!3930 (arr!2419 (Array (_ BitVec 32) (_ BitVec 8))) (size!1782 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3126 0))(
  ( (BitStream!3127 (buf!2172 array!3929) (currentByte!4318 (_ BitVec 32)) (currentBit!4313 (_ BitVec 32))) )
))
(declare-fun b!169 () BitStream!3126)

(assert (=> start!17356 (and (not (= ((_ sign_extend 32) (size!1782 (buf!2172 b!169))) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1782 (buf!2172 b!169)))) ((_ sign_extend 32) (size!1782 (buf!2172 b!169)))))))))

(declare-fun e!56105 () Bool)

(declare-fun inv!12 (BitStream!3126) Bool)

(assert (=> start!17356 (and (inv!12 b!169) e!56105)))

(declare-fun b!84019 () Bool)

(declare-fun array_inv!1628 (array!3929) Bool)

(assert (=> b!84019 (= e!56105 (array_inv!1628 (buf!2172 b!169)))))

(assert (= start!17356 b!84019))

(declare-fun m!130711 () Bool)

(assert (=> start!17356 m!130711))

(declare-fun m!130713 () Bool)

(assert (=> b!84019 m!130713))

(check-sat (not start!17356) (not b!84019))
(check-sat)
