; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17354 () Bool)

(assert start!17354)

(declare-datatypes ((array!3927 0))(
  ( (array!3928 (arr!2418 (Array (_ BitVec 32) (_ BitVec 8))) (size!1781 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3124 0))(
  ( (BitStream!3125 (buf!2171 array!3927) (currentByte!4317 (_ BitVec 32)) (currentBit!4312 (_ BitVec 32))) )
))
(declare-fun b!169 () BitStream!3124)

(assert (=> start!17354 (and (not (= ((_ sign_extend 32) (size!1781 (buf!2171 b!169))) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1781 (buf!2171 b!169)))) ((_ sign_extend 32) (size!1781 (buf!2171 b!169)))))))))

(declare-fun e!56099 () Bool)

(declare-fun inv!12 (BitStream!3124) Bool)

(assert (=> start!17354 (and (inv!12 b!169) e!56099)))

(declare-fun b!84016 () Bool)

(declare-fun array_inv!1627 (array!3927) Bool)

(assert (=> b!84016 (= e!56099 (array_inv!1627 (buf!2171 b!169)))))

(assert (= start!17354 b!84016))

(declare-fun m!130707 () Bool)

(assert (=> start!17354 m!130707))

(declare-fun m!130709 () Bool)

(assert (=> b!84016 m!130709))

(push 1)

(assert (not b!84016))

(assert (not start!17354))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

