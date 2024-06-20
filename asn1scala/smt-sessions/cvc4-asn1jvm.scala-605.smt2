; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17294 () Bool)

(assert start!17294)

(declare-datatypes ((array!3906 0))(
  ( (array!3907 (arr!2411 (Array (_ BitVec 32) (_ BitVec 8))) (size!1774 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3110 0))(
  ( (BitStream!3111 (buf!2164 array!3906) (currentByte!4303 (_ BitVec 32)) (currentBit!4298 (_ BitVec 32))) )
))
(declare-fun b!169 () BitStream!3110)

(assert (=> start!17294 (and (bvsle ((_ sign_extend 32) (size!1774 (buf!2164 b!169))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!4303 b!169)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!4298 b!169)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!1774 (buf!2164 b!169))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!4303 b!169)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!4298 b!169)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!56048 () Bool)

(declare-fun inv!12 (BitStream!3110) Bool)

(assert (=> start!17294 (and (inv!12 b!169) e!56048)))

(declare-fun b!83986 () Bool)

(declare-fun array_inv!1620 (array!3906) Bool)

(assert (=> b!83986 (= e!56048 (array_inv!1620 (buf!2164 b!169)))))

(assert (= start!17294 b!83986))

(declare-fun m!130655 () Bool)

(assert (=> start!17294 m!130655))

(declare-fun m!130657 () Bool)

(assert (=> b!83986 m!130657))

(push 1)

(assert (not b!83986))

(assert (not start!17294))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!26978 () Bool)

