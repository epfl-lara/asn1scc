; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73302 () Bool)

(assert start!73302)

(declare-fun res!267046 () Bool)

(declare-fun e!234649 () Bool)

(assert (=> start!73302 (=> (not res!267046) (not e!234649))))

(declare-datatypes ((array!21036 0))(
  ( (array!21037 (arr!10224 (Array (_ BitVec 32) (_ BitVec 8))) (size!9132 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14426 0))(
  ( (BitStream!14427 (buf!8274 array!21036) (currentByte!15351 (_ BitVec 32)) (currentBit!15346 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14426)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> start!73302 (= res!267046 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!9132 (buf!8274 thiss!877))) ((_ sign_extend 32) (currentByte!15351 thiss!877)) ((_ sign_extend 32) (currentBit!15346 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!73302 e!234649))

(declare-fun e!234650 () Bool)

(declare-fun inv!12 (BitStream!14426) Bool)

(assert (=> start!73302 (and (inv!12 thiss!877) e!234650)))

(declare-fun b!325422 () Bool)

(assert (=> b!325422 (= e!234649 (and (bvsge (currentBit!15346 thiss!877) #b00000000000000000000000000000111) (= (bvand (currentByte!15351 thiss!877) #b10000000000000000000000000000000) #b00000000000000000000000000000000) (not (= (bvand (currentByte!15351 thiss!877) #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 (currentByte!15351 thiss!877)) #b10000000000000000000000000000000)))))))

(declare-fun b!325423 () Bool)

(declare-fun array_inv!8684 (array!21036) Bool)

(assert (=> b!325423 (= e!234650 (array_inv!8684 (buf!8274 thiss!877)))))

(assert (= (and start!73302 res!267046) b!325422))

(assert (= start!73302 b!325423))

(declare-fun m!463423 () Bool)

(assert (=> start!73302 m!463423))

(declare-fun m!463425 () Bool)

(assert (=> start!73302 m!463425))

(declare-fun m!463427 () Bool)

(assert (=> b!325423 m!463427))

(push 1)

(assert (not start!73302))

(assert (not b!325423))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!107258 () Bool)

(assert (=> d!107258 (= (remainingBits!0 ((_ sign_extend 32) (size!9132 (buf!8274 thiss!877))) ((_ sign_extend 32) (currentByte!15351 thiss!877)) ((_ sign_extend 32) (currentBit!15346 thiss!877))) (bvsub (bvmul ((_ sign_extend 32) (size!9132 (buf!8274 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15351 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15346 thiss!877)))))))

(assert (=> start!73302 d!107258))

(declare-fun d!107262 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!107262 (= (inv!12 thiss!877) (invariant!0 (currentBit!15346 thiss!877) (currentByte!15351 thiss!877) (size!9132 (buf!8274 thiss!877))))))

(declare-fun bs!28224 () Bool)

(assert (= bs!28224 d!107262))

(declare-fun m!463431 () Bool)

(assert (=> bs!28224 m!463431))

(assert (=> start!73302 d!107262))

(declare-fun d!107266 () Bool)

(assert (=> d!107266 (= (array_inv!8684 (buf!8274 thiss!877)) (bvsge (size!9132 (buf!8274 thiss!877)) #b00000000000000000000000000000000))))

(assert (=> b!325423 d!107266))

(push 1)

(assert (not d!107262))

(check-sat)

(pop 1)

(push 1)

(check-sat)

