; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61064 () Bool)

(assert start!61064)

(declare-fun res!228805 () Bool)

(declare-fun e!195074 () Bool)

(assert (=> start!61064 (=> (not res!228805) (not e!195074))))

(declare-datatypes ((array!15677 0))(
  ( (array!15678 (arr!7777 (Array (_ BitVec 32) (_ BitVec 8))) (size!6790 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12394 0))(
  ( (BitStream!12395 (buf!7258 array!15677) (currentByte!13418 (_ BitVec 32)) (currentBit!13413 (_ BitVec 32))) )
))
(declare-fun bs1!11 () BitStream!12394)

(declare-fun bs2!19 () BitStream!12394)

(assert (=> start!61064 (= res!228805 (and (= (size!6790 (buf!7258 bs1!11)) (size!6790 (buf!7258 bs2!19))) (bvsle ((_ sign_extend 32) (size!6790 (buf!7258 bs1!11))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!13418 bs1!11)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!13413 bs1!11)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!6790 (buf!7258 bs1!11))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!13418 bs1!11)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!13413 bs1!11)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!61064 e!195074))

(declare-fun e!195072 () Bool)

(declare-fun inv!12 (BitStream!12394) Bool)

(assert (=> start!61064 (and (inv!12 bs1!11) e!195072)))

(declare-fun e!195076 () Bool)

(assert (=> start!61064 (and (inv!12 bs2!19) e!195076)))

(declare-fun b!275134 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!275134 (= e!195074 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!13413 bs1!11))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!13418 bs1!11))) ((_ extract 31 0) ((_ sign_extend 32) (size!6790 (buf!7258 bs1!11)))))))))

(declare-fun b!275135 () Bool)

(declare-fun array_inv!6514 (array!15677) Bool)

(assert (=> b!275135 (= e!195072 (array_inv!6514 (buf!7258 bs1!11)))))

(declare-fun b!275136 () Bool)

(assert (=> b!275136 (= e!195076 (array_inv!6514 (buf!7258 bs2!19)))))

(assert (= (and start!61064 res!228805) b!275134))

(assert (= start!61064 b!275135))

(assert (= start!61064 b!275136))

(declare-fun m!407705 () Bool)

(assert (=> start!61064 m!407705))

(declare-fun m!407707 () Bool)

(assert (=> start!61064 m!407707))

(declare-fun m!407709 () Bool)

(assert (=> b!275134 m!407709))

(declare-fun m!407711 () Bool)

(assert (=> b!275135 m!407711))

(declare-fun m!407713 () Bool)

(assert (=> b!275136 m!407713))

(push 1)

(assert (not b!275135))

(assert (not b!275134))

(assert (not b!275136))

(assert (not start!61064))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

