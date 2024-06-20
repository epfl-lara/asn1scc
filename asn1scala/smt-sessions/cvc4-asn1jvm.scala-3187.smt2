; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73272 () Bool)

(assert start!73272)

(declare-fun res!267036 () Bool)

(declare-fun e!234624 () Bool)

(assert (=> start!73272 (=> (not res!267036) (not e!234624))))

(declare-datatypes ((array!21027 0))(
  ( (array!21028 (arr!10221 (Array (_ BitVec 32) (_ BitVec 8))) (size!9129 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14420 0))(
  ( (BitStream!14421 (buf!8271 array!21027) (currentByte!15342 (_ BitVec 32)) (currentBit!15337 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14420)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> start!73272 (= res!267036 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!9129 (buf!8271 thiss!877))) ((_ sign_extend 32) (currentByte!15342 thiss!877)) ((_ sign_extend 32) (currentBit!15337 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!73272 e!234624))

(declare-fun e!234623 () Bool)

(declare-fun inv!12 (BitStream!14420) Bool)

(assert (=> start!73272 (and (inv!12 thiss!877) e!234623)))

(declare-fun b!325403 () Bool)

(declare-fun res!267037 () Bool)

(assert (=> b!325403 (=> (not res!267037) (not e!234624))))

(assert (=> b!325403 (= res!267037 (bvsge (currentBit!15337 thiss!877) #b00000000000000000000000000000111))))

(declare-fun b!325404 () Bool)

(assert (=> b!325404 (= e!234624 (not (inv!12 (BitStream!14421 (buf!8271 thiss!877) (bvadd #b00000000000000000000000000000001 (currentByte!15342 thiss!877)) #b00000000000000000000000000000000))))))

(declare-fun b!325405 () Bool)

(declare-fun array_inv!8681 (array!21027) Bool)

(assert (=> b!325405 (= e!234623 (array_inv!8681 (buf!8271 thiss!877)))))

(assert (= (and start!73272 res!267036) b!325403))

(assert (= (and b!325403 res!267037) b!325404))

(assert (= start!73272 b!325405))

(declare-fun m!463391 () Bool)

(assert (=> start!73272 m!463391))

(declare-fun m!463393 () Bool)

(assert (=> start!73272 m!463393))

(declare-fun m!463395 () Bool)

(assert (=> b!325404 m!463395))

(declare-fun m!463397 () Bool)

(assert (=> b!325405 m!463397))

(push 1)

(assert (not b!325405))

(assert (not b!325404))

(assert (not start!73272))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!107220 () Bool)

(assert (=> d!107220 (= (array_inv!8681 (buf!8271 thiss!877)) (bvsge (size!9129 (buf!8271 thiss!877)) #b00000000000000000000000000000000))))

(assert (=> b!325405 d!107220))

(declare-fun d!107224 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!107224 (= (inv!12 (BitStream!14421 (buf!8271 thiss!877) (bvadd #b00000000000000000000000000000001 (currentByte!15342 thiss!877)) #b00000000000000000000000000000000)) (invariant!0 (currentBit!15337 (BitStream!14421 (buf!8271 thiss!877) (bvadd #b00000000000000000000000000000001 (currentByte!15342 thiss!877)) #b00000000000000000000000000000000)) (currentByte!15342 (BitStream!14421 (buf!8271 thiss!877) (bvadd #b00000000000000000000000000000001 (currentByte!15342 thiss!877)) #b00000000000000000000000000000000)) (size!9129 (buf!8271 (BitStream!14421 (buf!8271 thiss!877) (bvadd #b00000000000000000000000000000001 (currentByte!15342 thiss!877)) #b00000000000000000000000000000000)))))))

(declare-fun bs!28218 () Bool)

(assert (= bs!28218 d!107224))

(declare-fun m!463407 () Bool)

(assert (=> bs!28218 m!463407))

(assert (=> b!325404 d!107224))

(declare-fun d!107232 () Bool)

(assert (=> d!107232 (= (remainingBits!0 ((_ sign_extend 32) (size!9129 (buf!8271 thiss!877))) ((_ sign_extend 32) (currentByte!15342 thiss!877)) ((_ sign_extend 32) (currentBit!15337 thiss!877))) (bvsub (bvmul ((_ sign_extend 32) (size!9129 (buf!8271 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15342 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15337 thiss!877)))))))

(assert (=> start!73272 d!107232))

(declare-fun d!107234 () Bool)

(assert (=> d!107234 (= (inv!12 thiss!877) (invariant!0 (currentBit!15337 thiss!877) (currentByte!15342 thiss!877) (size!9129 (buf!8271 thiss!877))))))

(declare-fun bs!28219 () Bool)

(assert (= bs!28219 d!107234))

(declare-fun m!463409 () Bool)

(assert (=> bs!28219 m!463409))

(assert (=> start!73272 d!107234))

(push 1)

(assert (not d!107224))

(assert (not d!107234))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!107240 () Bool)

(assert (=> d!107240 (= (invariant!0 (currentBit!15337 (BitStream!14421 (buf!8271 thiss!877) (bvadd #b00000000000000000000000000000001 (currentByte!15342 thiss!877)) #b00000000000000000000000000000000)) (currentByte!15342 (BitStream!14421 (buf!8271 thiss!877) (bvadd #b00000000000000000000000000000001 (currentByte!15342 thiss!877)) #b00000000000000000000000000000000)) (size!9129 (buf!8271 (BitStream!14421 (buf!8271 thiss!877) (bvadd #b00000000000000000000000000000001 (currentByte!15342 thiss!877)) #b00000000000000000000000000000000)))) (and (bvsge (currentBit!15337 (BitStream!14421 (buf!8271 thiss!877) (bvadd #b00000000000000000000000000000001 (currentByte!15342 thiss!877)) #b00000000000000000000000000000000)) #b00000000000000000000000000000000) (bvslt (currentBit!15337 (BitStream!14421 (buf!8271 thiss!877) (bvadd #b00000000000000000000000000000001 (currentByte!15342 thiss!877)) #b00000000000000000000000000000000)) #b00000000000000000000000000001000) (bvsge (currentByte!15342 (BitStream!14421 (buf!8271 thiss!877) (bvadd #b00000000000000000000000000000001 (currentByte!15342 thiss!877)) #b00000000000000000000000000000000)) #b00000000000000000000000000000000) (or (bvslt (currentByte!15342 (BitStream!14421 (buf!8271 thiss!877) (bvadd #b00000000000000000000000000000001 (currentByte!15342 thiss!877)) #b00000000000000000000000000000000)) (size!9129 (buf!8271 (BitStream!14421 (buf!8271 thiss!877) (bvadd #b00000000000000000000000000000001 (currentByte!15342 thiss!877)) #b00000000000000000000000000000000)))) (and (= (currentBit!15337 (BitStream!14421 (buf!8271 thiss!877) (bvadd #b00000000000000000000000000000001 (currentByte!15342 thiss!877)) #b00000000000000000000000000000000)) #b00000000000000000000000000000000) (= (currentByte!15342 (BitStream!14421 (buf!8271 thiss!877) (bvadd #b00000000000000000000000000000001 (currentByte!15342 thiss!877)) #b00000000000000000000000000000000)) (size!9129 (buf!8271 (BitStream!14421 (buf!8271 thiss!877) (bvadd #b00000000000000000000000000000001 (currentByte!15342 thiss!877)) #b00000000000000000000000000000000))))))))))

(assert (=> d!107224 d!107240))

(declare-fun d!107242 () Bool)

(assert (=> d!107242 (= (invariant!0 (currentBit!15337 thiss!877) (currentByte!15342 thiss!877) (size!9129 (buf!8271 thiss!877))) (and (bvsge (currentBit!15337 thiss!877) #b00000000000000000000000000000000) (bvslt (currentBit!15337 thiss!877) #b00000000000000000000000000001000) (bvsge (currentByte!15342 thiss!877) #b00000000000000000000000000000000) (or (bvslt (currentByte!15342 thiss!877) (size!9129 (buf!8271 thiss!877))) (and (= (currentBit!15337 thiss!877) #b00000000000000000000000000000000) (= (currentByte!15342 thiss!877) (size!9129 (buf!8271 thiss!877)))))))))

(assert (=> d!107234 d!107242))

(push 1)

(check-sat)

(pop 1)

