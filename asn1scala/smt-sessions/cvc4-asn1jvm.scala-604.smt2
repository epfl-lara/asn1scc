; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17288 () Bool)

(assert start!17288)

(declare-datatypes ((array!3900 0))(
  ( (array!3901 (arr!2408 (Array (_ BitVec 32) (_ BitVec 8))) (size!1771 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3104 0))(
  ( (BitStream!3105 (buf!2161 array!3900) (currentByte!4300 (_ BitVec 32)) (currentBit!4295 (_ BitVec 32))) )
))
(declare-fun b!169 () BitStream!3104)

(assert (=> start!17288 (or (bvsgt ((_ sign_extend 32) (size!1771 (buf!2161 b!169))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!4300 b!169)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!4295 b!169)) #b0000000000000000000000000000000001111111111111111111111111111111))))

(declare-fun e!56030 () Bool)

(declare-fun inv!12 (BitStream!3104) Bool)

(assert (=> start!17288 (and (inv!12 b!169) e!56030)))

(declare-fun b!83977 () Bool)

(declare-fun array_inv!1617 (array!3900) Bool)

(assert (=> b!83977 (= e!56030 (array_inv!1617 (buf!2161 b!169)))))

(assert (= start!17288 b!83977))

(declare-fun m!130643 () Bool)

(assert (=> start!17288 m!130643))

(declare-fun m!130645 () Bool)

(assert (=> b!83977 m!130645))

(push 1)

(assert (not b!83977))

(assert (not start!17288))

(check-sat)

(pop 1)

(push 1)

(check-sat)

