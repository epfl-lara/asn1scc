; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17314 () Bool)

(assert start!17314)

(declare-fun res!69013 () Bool)

(declare-fun e!56074 () Bool)

(assert (=> start!17314 (=> (not res!69013) (not e!56074))))

(declare-datatypes ((array!3915 0))(
  ( (array!3916 (arr!2414 (Array (_ BitVec 32) (_ BitVec 8))) (size!1777 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3116 0))(
  ( (BitStream!3117 (buf!2167 array!3915) (currentByte!4307 (_ BitVec 32)) (currentBit!4302 (_ BitVec 32))) )
))
(declare-fun b!169 () BitStream!3116)

(assert (=> start!17314 (= res!69013 (and (bvsle ((_ sign_extend 32) (size!1777 (buf!2167 b!169))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!4307 b!169)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!4302 b!169)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!1777 (buf!2167 b!169))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!4307 b!169)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!4302 b!169)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!17314 e!56074))

(declare-fun e!56075 () Bool)

(declare-fun inv!12 (BitStream!3116) Bool)

(assert (=> start!17314 (and (inv!12 b!169) e!56075)))

(declare-fun b!84003 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!84003 (= e!56074 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4302 b!169))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4307 b!169))) ((_ extract 31 0) ((_ sign_extend 32) (size!1777 (buf!2167 b!169)))))))))

(declare-fun b!84004 () Bool)

(declare-fun array_inv!1623 (array!3915) Bool)

(assert (=> b!84004 (= e!56075 (array_inv!1623 (buf!2167 b!169)))))

(assert (= (and start!17314 res!69013) b!84003))

(assert (= start!17314 b!84004))

(declare-fun m!130677 () Bool)

(assert (=> start!17314 m!130677))

(declare-fun m!130679 () Bool)

(assert (=> b!84003 m!130679))

(declare-fun m!130681 () Bool)

(assert (=> b!84004 m!130681))

(push 1)

(assert (not start!17314))

(assert (not b!84003))

(assert (not b!84004))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

