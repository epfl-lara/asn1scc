; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73116 () Bool)

(assert start!73116)

(declare-fun res!266872 () Bool)

(declare-fun e!234418 () Bool)

(assert (=> start!73116 (=> (not res!266872) (not e!234418))))

(declare-datatypes ((array!20976 0))(
  ( (array!20977 (arr!10203 (Array (_ BitVec 32) (_ BitVec 8))) (size!9111 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14384 0))(
  ( (BitStream!14385 (buf!8253 array!20976) (currentByte!15294 (_ BitVec 32)) (currentBit!15289 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14384)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> start!73116 (= res!266872 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!9111 (buf!8253 thiss!877))) ((_ sign_extend 32) (currentByte!15294 thiss!877)) ((_ sign_extend 32) (currentBit!15289 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!73116 e!234418))

(declare-fun e!234420 () Bool)

(declare-fun inv!12 (BitStream!14384) Bool)

(assert (=> start!73116 (and (inv!12 thiss!877) e!234420)))

(declare-fun b!325184 () Bool)

(declare-fun res!266871 () Bool)

(assert (=> b!325184 (=> (not res!266871) (not e!234418))))

(assert (=> b!325184 (= res!266871 (bvslt (currentBit!15289 thiss!877) #b00000000000000000000000000000111))))

(declare-fun b!325185 () Bool)

(assert (=> b!325185 (= e!234418 (not (inv!12 (BitStream!14385 (buf!8253 thiss!877) (currentByte!15294 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15289 thiss!877))))))))

(declare-fun b!325186 () Bool)

(declare-fun array_inv!8663 (array!20976) Bool)

(assert (=> b!325186 (= e!234420 (array_inv!8663 (buf!8253 thiss!877)))))

(assert (= (and start!73116 res!266872) b!325184))

(assert (= (and b!325184 res!266871) b!325185))

(assert (= start!73116 b!325186))

(declare-fun m!463175 () Bool)

(assert (=> start!73116 m!463175))

(declare-fun m!463177 () Bool)

(assert (=> start!73116 m!463177))

(declare-fun m!463179 () Bool)

(assert (=> b!325185 m!463179))

(declare-fun m!463181 () Bool)

(assert (=> b!325186 m!463181))

(push 1)

(assert (not start!73116))

(assert (not b!325185))

(assert (not b!325186))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!107040 () Bool)

(assert (=> d!107040 (= (remainingBits!0 ((_ sign_extend 32) (size!9111 (buf!8253 thiss!877))) ((_ sign_extend 32) (currentByte!15294 thiss!877)) ((_ sign_extend 32) (currentBit!15289 thiss!877))) (bvsub (bvmul ((_ sign_extend 32) (size!9111 (buf!8253 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15294 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15289 thiss!877)))))))

(assert (=> start!73116 d!107040))

(declare-fun d!107048 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!107048 (= (inv!12 thiss!877) (invariant!0 (currentBit!15289 thiss!877) (currentByte!15294 thiss!877) (size!9111 (buf!8253 thiss!877))))))

(declare-fun bs!28178 () Bool)

(assert (= bs!28178 d!107048))

(declare-fun m!463189 () Bool)

(assert (=> bs!28178 m!463189))

(assert (=> start!73116 d!107048))

(declare-fun d!107052 () Bool)

(assert (=> d!107052 (= (inv!12 (BitStream!14385 (buf!8253 thiss!877) (currentByte!15294 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15289 thiss!877)))) (invariant!0 (currentBit!15289 (BitStream!14385 (buf!8253 thiss!877) (currentByte!15294 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15289 thiss!877)))) (currentByte!15294 (BitStream!14385 (buf!8253 thiss!877) (currentByte!15294 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15289 thiss!877)))) (size!9111 (buf!8253 (BitStream!14385 (buf!8253 thiss!877) (currentByte!15294 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15289 thiss!877)))))))))

(declare-fun bs!28179 () Bool)

(assert (= bs!28179 d!107052))

(declare-fun m!463191 () Bool)

(assert (=> bs!28179 m!463191))

(assert (=> b!325185 d!107052))

(declare-fun d!107054 () Bool)

(assert (=> d!107054 (= (array_inv!8663 (buf!8253 thiss!877)) (bvsge (size!9111 (buf!8253 thiss!877)) #b00000000000000000000000000000000))))

(assert (=> b!325186 d!107054))

(push 1)

(assert (not d!107052))

(assert (not d!107048))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!107058 () Bool)

(assert (=> d!107058 (= (invariant!0 (currentBit!15289 (BitStream!14385 (buf!8253 thiss!877) (currentByte!15294 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15289 thiss!877)))) (currentByte!15294 (BitStream!14385 (buf!8253 thiss!877) (currentByte!15294 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15289 thiss!877)))) (size!9111 (buf!8253 (BitStream!14385 (buf!8253 thiss!877) (currentByte!15294 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15289 thiss!877)))))) (and (bvsge (currentBit!15289 (BitStream!14385 (buf!8253 thiss!877) (currentByte!15294 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15289 thiss!877)))) #b00000000000000000000000000000000) (bvslt (currentBit!15289 (BitStream!14385 (buf!8253 thiss!877) (currentByte!15294 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15289 thiss!877)))) #b00000000000000000000000000001000) (bvsge (currentByte!15294 (BitStream!14385 (buf!8253 thiss!877) (currentByte!15294 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15289 thiss!877)))) #b00000000000000000000000000000000) (or (bvslt (currentByte!15294 (BitStream!14385 (buf!8253 thiss!877) (currentByte!15294 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15289 thiss!877)))) (size!9111 (buf!8253 (BitStream!14385 (buf!8253 thiss!877) (currentByte!15294 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15289 thiss!877)))))) (and (= (currentBit!15289 (BitStream!14385 (buf!8253 thiss!877) (currentByte!15294 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15289 thiss!877)))) #b00000000000000000000000000000000) (= (currentByte!15294 (BitStream!14385 (buf!8253 thiss!877) (currentByte!15294 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15289 thiss!877)))) (size!9111 (buf!8253 (BitStream!14385 (buf!8253 thiss!877) (currentByte!15294 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15289 thiss!877))))))))))))

(assert (=> d!107052 d!107058))

(declare-fun d!107062 () Bool)

(assert (=> d!107062 (= (invariant!0 (currentBit!15289 thiss!877) (currentByte!15294 thiss!877) (size!9111 (buf!8253 thiss!877))) (and (bvsge (currentBit!15289 thiss!877) #b00000000000000000000000000000000) (bvslt (currentBit!15289 thiss!877) #b00000000000000000000000000001000) (bvsge (currentByte!15294 thiss!877) #b00000000000000000000000000000000) (or (bvslt (currentByte!15294 thiss!877) (size!9111 (buf!8253 thiss!877))) (and (= (currentBit!15289 thiss!877) #b00000000000000000000000000000000) (= (currentByte!15294 thiss!877) (size!9111 (buf!8253 thiss!877)))))))))

(assert (=> d!107048 d!107062))

(push 1)

(check-sat)

(pop 1)

