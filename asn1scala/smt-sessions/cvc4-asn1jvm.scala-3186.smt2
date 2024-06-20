; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73242 () Bool)

(assert start!73242)

(declare-fun res!267019 () Bool)

(declare-fun e!234595 () Bool)

(assert (=> start!73242 (=> (not res!267019) (not e!234595))))

(declare-datatypes ((array!21018 0))(
  ( (array!21019 (arr!10218 (Array (_ BitVec 32) (_ BitVec 8))) (size!9126 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14414 0))(
  ( (BitStream!14415 (buf!8268 array!21018) (currentByte!15333 (_ BitVec 32)) (currentBit!15328 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14414)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> start!73242 (= res!267019 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!9126 (buf!8268 thiss!877))) ((_ sign_extend 32) (currentByte!15333 thiss!877)) ((_ sign_extend 32) (currentBit!15328 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!73242 e!234595))

(declare-fun e!234597 () Bool)

(declare-fun inv!12 (BitStream!14414) Bool)

(assert (=> start!73242 (and (inv!12 thiss!877) e!234597)))

(declare-fun b!325376 () Bool)

(declare-fun res!267018 () Bool)

(assert (=> b!325376 (=> (not res!267018) (not e!234595))))

(assert (=> b!325376 (= res!267018 (bvsge (currentBit!15328 thiss!877) #b00000000000000000000000000000111))))

(declare-fun b!325377 () Bool)

(assert (=> b!325377 (= e!234595 (not (inv!12 (BitStream!14415 (buf!8268 thiss!877) (currentByte!15333 thiss!877) #b00000000000000000000000000000000))))))

(declare-fun b!325378 () Bool)

(declare-fun array_inv!8678 (array!21018) Bool)

(assert (=> b!325378 (= e!234597 (array_inv!8678 (buf!8268 thiss!877)))))

(assert (= (and start!73242 res!267019) b!325376))

(assert (= (and b!325376 res!267018) b!325377))

(assert (= start!73242 b!325378))

(declare-fun m!463355 () Bool)

(assert (=> start!73242 m!463355))

(declare-fun m!463357 () Bool)

(assert (=> start!73242 m!463357))

(declare-fun m!463359 () Bool)

(assert (=> b!325377 m!463359))

(declare-fun m!463361 () Bool)

(assert (=> b!325378 m!463361))

(push 1)

(assert (not start!73242))

(assert (not b!325378))

(assert (not b!325377))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!107192 () Bool)

(assert (=> d!107192 (= (remainingBits!0 ((_ sign_extend 32) (size!9126 (buf!8268 thiss!877))) ((_ sign_extend 32) (currentByte!15333 thiss!877)) ((_ sign_extend 32) (currentBit!15328 thiss!877))) (bvsub (bvmul ((_ sign_extend 32) (size!9126 (buf!8268 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15333 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15328 thiss!877)))))))

(assert (=> start!73242 d!107192))

(declare-fun d!107194 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!107194 (= (inv!12 thiss!877) (invariant!0 (currentBit!15328 thiss!877) (currentByte!15333 thiss!877) (size!9126 (buf!8268 thiss!877))))))

(declare-fun bs!28209 () Bool)

(assert (= bs!28209 d!107194))

(declare-fun m!463371 () Bool)

(assert (=> bs!28209 m!463371))

(assert (=> start!73242 d!107194))

(declare-fun d!107196 () Bool)

(assert (=> d!107196 (= (array_inv!8678 (buf!8268 thiss!877)) (bvsge (size!9126 (buf!8268 thiss!877)) #b00000000000000000000000000000000))))

(assert (=> b!325378 d!107196))

(declare-fun d!107198 () Bool)

(assert (=> d!107198 (= (inv!12 (BitStream!14415 (buf!8268 thiss!877) (currentByte!15333 thiss!877) #b00000000000000000000000000000000)) (invariant!0 (currentBit!15328 (BitStream!14415 (buf!8268 thiss!877) (currentByte!15333 thiss!877) #b00000000000000000000000000000000)) (currentByte!15333 (BitStream!14415 (buf!8268 thiss!877) (currentByte!15333 thiss!877) #b00000000000000000000000000000000)) (size!9126 (buf!8268 (BitStream!14415 (buf!8268 thiss!877) (currentByte!15333 thiss!877) #b00000000000000000000000000000000)))))))

(declare-fun bs!28210 () Bool)

(assert (= bs!28210 d!107198))

(declare-fun m!463373 () Bool)

(assert (=> bs!28210 m!463373))

(assert (=> b!325377 d!107198))

(push 1)

(assert (not d!107194))

(assert (not d!107198))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

