; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17284 () Bool)

(assert start!17284)

(declare-datatypes ((array!3896 0))(
  ( (array!3897 (arr!2406 (Array (_ BitVec 32) (_ BitVec 8))) (size!1769 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3100 0))(
  ( (BitStream!3101 (buf!2159 array!3896) (currentByte!4298 (_ BitVec 32)) (currentBit!4293 (_ BitVec 32))) )
))
(declare-fun b!169 () BitStream!3100)

(assert (=> start!17284 (or (bvsgt ((_ sign_extend 32) (size!1769 (buf!2159 b!169))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!4298 b!169)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!4293 b!169)) #b0000000000000000000000000000000001111111111111111111111111111111))))

(declare-fun e!56018 () Bool)

(declare-fun inv!12 (BitStream!3100) Bool)

(assert (=> start!17284 (and (inv!12 b!169) e!56018)))

(declare-fun b!83971 () Bool)

(declare-fun array_inv!1615 (array!3896) Bool)

(assert (=> b!83971 (= e!56018 (array_inv!1615 (buf!2159 b!169)))))

(assert (= start!17284 b!83971))

(declare-fun m!130635 () Bool)

(assert (=> start!17284 m!130635))

(declare-fun m!130637 () Bool)

(assert (=> b!83971 m!130637))

(push 1)

(assert (not start!17284))

(assert (not b!83971))

(check-sat)

(pop 1)

(push 1)

(check-sat)

