; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17358 () Bool)

(assert start!17358)

(declare-datatypes ((array!3931 0))(
  ( (array!3932 (arr!2420 (Array (_ BitVec 32) (_ BitVec 8))) (size!1783 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3128 0))(
  ( (BitStream!3129 (buf!2173 array!3931) (currentByte!4319 (_ BitVec 32)) (currentBit!4314 (_ BitVec 32))) )
))
(declare-fun b!169 () BitStream!3128)

(assert (=> start!17358 (and (not (= ((_ sign_extend 32) (size!1783 (buf!2173 b!169))) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1783 (buf!2173 b!169)))) ((_ sign_extend 32) (size!1783 (buf!2173 b!169)))))))))

(declare-fun e!56111 () Bool)

(declare-fun inv!12 (BitStream!3128) Bool)

(assert (=> start!17358 (and (inv!12 b!169) e!56111)))

(declare-fun b!84022 () Bool)

(declare-fun array_inv!1629 (array!3931) Bool)

(assert (=> b!84022 (= e!56111 (array_inv!1629 (buf!2173 b!169)))))

(assert (= start!17358 b!84022))

(declare-fun m!130715 () Bool)

(assert (=> start!17358 m!130715))

(declare-fun m!130717 () Bool)

(assert (=> b!84022 m!130717))

(push 1)

(assert (not start!17358))

(assert (not b!84022))

(check-sat)

(pop 1)

(push 1)

(check-sat)

