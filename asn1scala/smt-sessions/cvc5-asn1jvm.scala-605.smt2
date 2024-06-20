; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17290 () Bool)

(assert start!17290)

(declare-datatypes ((array!3902 0))(
  ( (array!3903 (arr!2409 (Array (_ BitVec 32) (_ BitVec 8))) (size!1772 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3106 0))(
  ( (BitStream!3107 (buf!2162 array!3902) (currentByte!4301 (_ BitVec 32)) (currentBit!4296 (_ BitVec 32))) )
))
(declare-fun b!169 () BitStream!3106)

(assert (=> start!17290 (and (bvsle ((_ sign_extend 32) (size!1772 (buf!2162 b!169))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!4301 b!169)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!4296 b!169)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!1772 (buf!2162 b!169))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!4301 b!169)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!4296 b!169)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!56036 () Bool)

(declare-fun inv!12 (BitStream!3106) Bool)

(assert (=> start!17290 (and (inv!12 b!169) e!56036)))

(declare-fun b!83980 () Bool)

(declare-fun array_inv!1618 (array!3902) Bool)

(assert (=> b!83980 (= e!56036 (array_inv!1618 (buf!2162 b!169)))))

(assert (= start!17290 b!83980))

(declare-fun m!130647 () Bool)

(assert (=> start!17290 m!130647))

(declare-fun m!130649 () Bool)

(assert (=> b!83980 m!130649))

(push 1)

(assert (not start!17290))

(assert (not b!83980))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!26972 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!26972 (= (inv!12 b!169) (invariant!0 (currentBit!4296 b!169) (currentByte!4301 b!169) (size!1772 (buf!2162 b!169))))))

(declare-fun bs!6656 () Bool)

(assert (= bs!6656 d!26972))

(declare-fun m!130661 () Bool)

(assert (=> bs!6656 m!130661))

(assert (=> start!17290 d!26972))

(declare-fun d!26976 () Bool)

(assert (=> d!26976 (= (array_inv!1618 (buf!2162 b!169)) (bvsge (size!1772 (buf!2162 b!169)) #b00000000000000000000000000000000))))

(assert (=> b!83980 d!26976))

(push 1)

(assert (not d!26972))

(check-sat)

