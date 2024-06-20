; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73268 () Bool)

(assert start!73268)

(declare-fun res!267025 () Bool)

(declare-fun e!234604 () Bool)

(assert (=> start!73268 (=> (not res!267025) (not e!234604))))

(declare-datatypes ((array!21023 0))(
  ( (array!21024 (arr!10219 (Array (_ BitVec 32) (_ BitVec 8))) (size!9127 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14416 0))(
  ( (BitStream!14417 (buf!8269 array!21023) (currentByte!15340 (_ BitVec 32)) (currentBit!15335 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14416)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> start!73268 (= res!267025 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!9127 (buf!8269 thiss!877))) ((_ sign_extend 32) (currentByte!15340 thiss!877)) ((_ sign_extend 32) (currentBit!15335 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!73268 e!234604))

(declare-fun e!234606 () Bool)

(declare-fun inv!12 (BitStream!14416) Bool)

(assert (=> start!73268 (and (inv!12 thiss!877) e!234606)))

(declare-fun b!325385 () Bool)

(declare-fun res!267024 () Bool)

(assert (=> b!325385 (=> (not res!267024) (not e!234604))))

(assert (=> b!325385 (= res!267024 (bvsge (currentBit!15335 thiss!877) #b00000000000000000000000000000111))))

(declare-fun b!325386 () Bool)

(assert (=> b!325386 (= e!234604 (not (inv!12 (BitStream!14417 (buf!8269 thiss!877) (bvadd #b00000000000000000000000000000001 (currentByte!15340 thiss!877)) #b00000000000000000000000000000000))))))

(declare-fun b!325387 () Bool)

(declare-fun array_inv!8679 (array!21023) Bool)

(assert (=> b!325387 (= e!234606 (array_inv!8679 (buf!8269 thiss!877)))))

(assert (= (and start!73268 res!267025) b!325385))

(assert (= (and b!325385 res!267024) b!325386))

(assert (= start!73268 b!325387))

(declare-fun m!463375 () Bool)

(assert (=> start!73268 m!463375))

(declare-fun m!463377 () Bool)

(assert (=> start!73268 m!463377))

(declare-fun m!463379 () Bool)

(assert (=> b!325386 m!463379))

(declare-fun m!463381 () Bool)

(assert (=> b!325387 m!463381))

(push 1)

(assert (not start!73268))

(assert (not b!325387))

(assert (not b!325386))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!107214 () Bool)

(assert (=> d!107214 (= (remainingBits!0 ((_ sign_extend 32) (size!9127 (buf!8269 thiss!877))) ((_ sign_extend 32) (currentByte!15340 thiss!877)) ((_ sign_extend 32) (currentBit!15335 thiss!877))) (bvsub (bvmul ((_ sign_extend 32) (size!9127 (buf!8269 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15340 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15335 thiss!877)))))))

(assert (=> start!73268 d!107214))

(declare-fun d!107218 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!107218 (= (inv!12 thiss!877) (invariant!0 (currentBit!15335 thiss!877) (currentByte!15340 thiss!877) (size!9127 (buf!8269 thiss!877))))))

(declare-fun bs!28216 () Bool)

(assert (= bs!28216 d!107218))

(declare-fun m!463403 () Bool)

(assert (=> bs!28216 m!463403))

(assert (=> start!73268 d!107218))

(declare-fun d!107228 () Bool)

(assert (=> d!107228 (= (array_inv!8679 (buf!8269 thiss!877)) (bvsge (size!9127 (buf!8269 thiss!877)) #b00000000000000000000000000000000))))

(assert (=> b!325387 d!107228))

(declare-fun d!107230 () Bool)

(assert (=> d!107230 (= (inv!12 (BitStream!14417 (buf!8269 thiss!877) (bvadd #b00000000000000000000000000000001 (currentByte!15340 thiss!877)) #b00000000000000000000000000000000)) (invariant!0 (currentBit!15335 (BitStream!14417 (buf!8269 thiss!877) (bvadd #b00000000000000000000000000000001 (currentByte!15340 thiss!877)) #b00000000000000000000000000000000)) (currentByte!15340 (BitStream!14417 (buf!8269 thiss!877) (bvadd #b00000000000000000000000000000001 (currentByte!15340 thiss!877)) #b00000000000000000000000000000000)) (size!9127 (buf!8269 (BitStream!14417 (buf!8269 thiss!877) (bvadd #b00000000000000000000000000000001 (currentByte!15340 thiss!877)) #b00000000000000000000000000000000)))))))

(declare-fun bs!28217 () Bool)

(assert (= bs!28217 d!107230))

(declare-fun m!463405 () Bool)

(assert (=> bs!28217 m!463405))

(assert (=> b!325386 d!107230))

(push 1)

(assert (not d!107230))

(assert (not d!107218))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!107236 () Bool)

(assert (=> d!107236 (= (invariant!0 (currentBit!15335 (BitStream!14417 (buf!8269 thiss!877) (bvadd #b00000000000000000000000000000001 (currentByte!15340 thiss!877)) #b00000000000000000000000000000000)) (currentByte!15340 (BitStream!14417 (buf!8269 thiss!877) (bvadd #b00000000000000000000000000000001 (currentByte!15340 thiss!877)) #b00000000000000000000000000000000)) (size!9127 (buf!8269 (BitStream!14417 (buf!8269 thiss!877) (bvadd #b00000000000000000000000000000001 (currentByte!15340 thiss!877)) #b00000000000000000000000000000000)))) (and (bvsge (currentBit!15335 (BitStream!14417 (buf!8269 thiss!877) (bvadd #b00000000000000000000000000000001 (currentByte!15340 thiss!877)) #b00000000000000000000000000000000)) #b00000000000000000000000000000000) (bvslt (currentBit!15335 (BitStream!14417 (buf!8269 thiss!877) (bvadd #b00000000000000000000000000000001 (currentByte!15340 thiss!877)) #b00000000000000000000000000000000)) #b00000000000000000000000000001000) (bvsge (currentByte!15340 (BitStream!14417 (buf!8269 thiss!877) (bvadd #b00000000000000000000000000000001 (currentByte!15340 thiss!877)) #b00000000000000000000000000000000)) #b00000000000000000000000000000000) (or (bvslt (currentByte!15340 (BitStream!14417 (buf!8269 thiss!877) (bvadd #b00000000000000000000000000000001 (currentByte!15340 thiss!877)) #b00000000000000000000000000000000)) (size!9127 (buf!8269 (BitStream!14417 (buf!8269 thiss!877) (bvadd #b00000000000000000000000000000001 (currentByte!15340 thiss!877)) #b00000000000000000000000000000000)))) (and (= (currentBit!15335 (BitStream!14417 (buf!8269 thiss!877) (bvadd #b00000000000000000000000000000001 (currentByte!15340 thiss!877)) #b00000000000000000000000000000000)) #b00000000000000000000000000000000) (= (currentByte!15340 (BitStream!14417 (buf!8269 thiss!877) (bvadd #b00000000000000000000000000000001 (currentByte!15340 thiss!877)) #b00000000000000000000000000000000)) (size!9127 (buf!8269 (BitStream!14417 (buf!8269 thiss!877) (bvadd #b00000000000000000000000000000001 (currentByte!15340 thiss!877)) #b00000000000000000000000000000000))))))))))

(assert (=> d!107230 d!107236))

(declare-fun d!107238 () Bool)

(assert (=> d!107238 (= (invariant!0 (currentBit!15335 thiss!877) (currentByte!15340 thiss!877) (size!9127 (buf!8269 thiss!877))) (and (bvsge (currentBit!15335 thiss!877) #b00000000000000000000000000000000) (bvslt (currentBit!15335 thiss!877) #b00000000000000000000000000001000) (bvsge (currentByte!15340 thiss!877) #b00000000000000000000000000000000) (or (bvslt (currentByte!15340 thiss!877) (size!9127 (buf!8269 thiss!877))) (and (= (currentBit!15335 thiss!877) #b00000000000000000000000000000000) (= (currentByte!15340 thiss!877) (size!9127 (buf!8269 thiss!877)))))))))

(assert (=> d!107218 d!107238))

(push 1)

(check-sat)

