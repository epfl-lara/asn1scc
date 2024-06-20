; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73298 () Bool)

(assert start!73298)

(declare-fun res!267040 () Bool)

(declare-fun e!234631 () Bool)

(assert (=> start!73298 (=> (not res!267040) (not e!234631))))

(declare-datatypes ((array!21032 0))(
  ( (array!21033 (arr!10222 (Array (_ BitVec 32) (_ BitVec 8))) (size!9130 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14422 0))(
  ( (BitStream!14423 (buf!8272 array!21032) (currentByte!15349 (_ BitVec 32)) (currentBit!15344 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14422)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> start!73298 (= res!267040 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!9130 (buf!8272 thiss!877))) ((_ sign_extend 32) (currentByte!15349 thiss!877)) ((_ sign_extend 32) (currentBit!15344 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!73298 e!234631))

(declare-fun e!234632 () Bool)

(declare-fun inv!12 (BitStream!14422) Bool)

(assert (=> start!73298 (and (inv!12 thiss!877) e!234632)))

(declare-fun b!325410 () Bool)

(assert (=> b!325410 (= e!234631 (and (bvsge (currentBit!15344 thiss!877) #b00000000000000000000000000000111) (= (bvand (currentByte!15349 thiss!877) #b10000000000000000000000000000000) #b00000000000000000000000000000000) (not (= (bvand (currentByte!15349 thiss!877) #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 (currentByte!15349 thiss!877)) #b10000000000000000000000000000000)))))))

(declare-fun b!325411 () Bool)

(declare-fun array_inv!8682 (array!21032) Bool)

(assert (=> b!325411 (= e!234632 (array_inv!8682 (buf!8272 thiss!877)))))

(assert (= (and start!73298 res!267040) b!325410))

(assert (= start!73298 b!325411))

(declare-fun m!463411 () Bool)

(assert (=> start!73298 m!463411))

(declare-fun m!463413 () Bool)

(assert (=> start!73298 m!463413))

(declare-fun m!463415 () Bool)

(assert (=> b!325411 m!463415))

(push 1)

(assert (not b!325411))

(assert (not start!73298))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!107256 () Bool)

(assert (=> d!107256 (= (array_inv!8682 (buf!8272 thiss!877)) (bvsge (size!9130 (buf!8272 thiss!877)) #b00000000000000000000000000000000))))

(assert (=> b!325411 d!107256))

(declare-fun d!107260 () Bool)

(assert (=> d!107260 (= (remainingBits!0 ((_ sign_extend 32) (size!9130 (buf!8272 thiss!877))) ((_ sign_extend 32) (currentByte!15349 thiss!877)) ((_ sign_extend 32) (currentBit!15344 thiss!877))) (bvsub (bvmul ((_ sign_extend 32) (size!9130 (buf!8272 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15349 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15344 thiss!877)))))))

(assert (=> start!73298 d!107260))

(declare-fun d!107264 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!107264 (= (inv!12 thiss!877) (invariant!0 (currentBit!15344 thiss!877) (currentByte!15349 thiss!877) (size!9130 (buf!8272 thiss!877))))))

(declare-fun bs!28225 () Bool)

(assert (= bs!28225 d!107264))

(declare-fun m!463433 () Bool)

(assert (=> bs!28225 m!463433))

(assert (=> start!73298 d!107264))

(push 1)

(assert (not d!107264))

(check-sat)

(pop 1)

(push 1)

(check-sat)

