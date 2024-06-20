; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73112 () Bool)

(assert start!73112)

(declare-fun res!266860 () Bool)

(declare-fun e!234402 () Bool)

(assert (=> start!73112 (=> (not res!266860) (not e!234402))))

(declare-datatypes ((array!20972 0))(
  ( (array!20973 (arr!10201 (Array (_ BitVec 32) (_ BitVec 8))) (size!9109 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14380 0))(
  ( (BitStream!14381 (buf!8251 array!20972) (currentByte!15292 (_ BitVec 32)) (currentBit!15287 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14380)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> start!73112 (= res!266860 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!9109 (buf!8251 thiss!877))) ((_ sign_extend 32) (currentByte!15292 thiss!877)) ((_ sign_extend 32) (currentBit!15287 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!73112 e!234402))

(declare-fun e!234401 () Bool)

(declare-fun inv!12 (BitStream!14380) Bool)

(assert (=> start!73112 (and (inv!12 thiss!877) e!234401)))

(declare-fun b!325166 () Bool)

(declare-fun res!266859 () Bool)

(assert (=> b!325166 (=> (not res!266859) (not e!234402))))

(assert (=> b!325166 (= res!266859 (bvslt (currentBit!15287 thiss!877) #b00000000000000000000000000000111))))

(declare-fun b!325167 () Bool)

(assert (=> b!325167 (= e!234402 (not (inv!12 (BitStream!14381 (buf!8251 thiss!877) (currentByte!15292 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15287 thiss!877))))))))

(declare-fun b!325168 () Bool)

(declare-fun array_inv!8661 (array!20972) Bool)

(assert (=> b!325168 (= e!234401 (array_inv!8661 (buf!8251 thiss!877)))))

(assert (= (and start!73112 res!266860) b!325166))

(assert (= (and b!325166 res!266859) b!325167))

(assert (= start!73112 b!325168))

(declare-fun m!463159 () Bool)

(assert (=> start!73112 m!463159))

(declare-fun m!463161 () Bool)

(assert (=> start!73112 m!463161))

(declare-fun m!463163 () Bool)

(assert (=> b!325167 m!463163))

(declare-fun m!463165 () Bool)

(assert (=> b!325168 m!463165))

(push 1)

(assert (not b!325167))

(assert (not b!325168))

(assert (not start!73112))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!107036 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!107036 (= (inv!12 (BitStream!14381 (buf!8251 thiss!877) (currentByte!15292 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15287 thiss!877)))) (invariant!0 (currentBit!15287 (BitStream!14381 (buf!8251 thiss!877) (currentByte!15292 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15287 thiss!877)))) (currentByte!15292 (BitStream!14381 (buf!8251 thiss!877) (currentByte!15292 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15287 thiss!877)))) (size!9109 (buf!8251 (BitStream!14381 (buf!8251 thiss!877) (currentByte!15292 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15287 thiss!877)))))))))

(declare-fun bs!28177 () Bool)

(assert (= bs!28177 d!107036))

(declare-fun m!463187 () Bool)

(assert (=> bs!28177 m!463187))

(assert (=> b!325167 d!107036))

(declare-fun d!107046 () Bool)

(assert (=> d!107046 (= (array_inv!8661 (buf!8251 thiss!877)) (bvsge (size!9109 (buf!8251 thiss!877)) #b00000000000000000000000000000000))))

(assert (=> b!325168 d!107046))

(declare-fun d!107050 () Bool)

(assert (=> d!107050 (= (remainingBits!0 ((_ sign_extend 32) (size!9109 (buf!8251 thiss!877))) ((_ sign_extend 32) (currentByte!15292 thiss!877)) ((_ sign_extend 32) (currentBit!15287 thiss!877))) (bvsub (bvmul ((_ sign_extend 32) (size!9109 (buf!8251 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15292 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15287 thiss!877)))))))

(assert (=> start!73112 d!107050))

(declare-fun d!107056 () Bool)

(assert (=> d!107056 (= (inv!12 thiss!877) (invariant!0 (currentBit!15287 thiss!877) (currentByte!15292 thiss!877) (size!9109 (buf!8251 thiss!877))))))

(declare-fun bs!28180 () Bool)

(assert (= bs!28180 d!107056))

(declare-fun m!463193 () Bool)

(assert (=> bs!28180 m!463193))

(assert (=> start!73112 d!107056))

(push 1)

(assert (not d!107056))

(assert (not d!107036))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!107060 () Bool)

(assert (=> d!107060 (= (invariant!0 (currentBit!15287 thiss!877) (currentByte!15292 thiss!877) (size!9109 (buf!8251 thiss!877))) (and (bvsge (currentBit!15287 thiss!877) #b00000000000000000000000000000000) (bvslt (currentBit!15287 thiss!877) #b00000000000000000000000000001000) (bvsge (currentByte!15292 thiss!877) #b00000000000000000000000000000000) (or (bvslt (currentByte!15292 thiss!877) (size!9109 (buf!8251 thiss!877))) (and (= (currentBit!15287 thiss!877) #b00000000000000000000000000000000) (= (currentByte!15292 thiss!877) (size!9109 (buf!8251 thiss!877)))))))))

(assert (=> d!107056 d!107060))

(declare-fun d!107064 () Bool)

(assert (=> d!107064 (= (invariant!0 (currentBit!15287 (BitStream!14381 (buf!8251 thiss!877) (currentByte!15292 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15287 thiss!877)))) (currentByte!15292 (BitStream!14381 (buf!8251 thiss!877) (currentByte!15292 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15287 thiss!877)))) (size!9109 (buf!8251 (BitStream!14381 (buf!8251 thiss!877) (currentByte!15292 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15287 thiss!877)))))) (and (bvsge (currentBit!15287 (BitStream!14381 (buf!8251 thiss!877) (currentByte!15292 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15287 thiss!877)))) #b00000000000000000000000000000000) (bvslt (currentBit!15287 (BitStream!14381 (buf!8251 thiss!877) (currentByte!15292 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15287 thiss!877)))) #b00000000000000000000000000001000) (bvsge (currentByte!15292 (BitStream!14381 (buf!8251 thiss!877) (currentByte!15292 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15287 thiss!877)))) #b00000000000000000000000000000000) (or (bvslt (currentByte!15292 (BitStream!14381 (buf!8251 thiss!877) (currentByte!15292 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15287 thiss!877)))) (size!9109 (buf!8251 (BitStream!14381 (buf!8251 thiss!877) (currentByte!15292 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15287 thiss!877)))))) (and (= (currentBit!15287 (BitStream!14381 (buf!8251 thiss!877) (currentByte!15292 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15287 thiss!877)))) #b00000000000000000000000000000000) (= (currentByte!15292 (BitStream!14381 (buf!8251 thiss!877) (currentByte!15292 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15287 thiss!877)))) (size!9109 (buf!8251 (BitStream!14381 (buf!8251 thiss!877) (currentByte!15292 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15287 thiss!877))))))))))))

(assert (=> d!107036 d!107064))

(push 1)

(check-sat)

