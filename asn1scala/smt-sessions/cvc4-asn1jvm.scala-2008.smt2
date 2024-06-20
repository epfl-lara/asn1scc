; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51344 () Bool)

(assert start!51344)

(declare-fun res!199854 () Bool)

(declare-fun e!165435 () Bool)

(assert (=> start!51344 (=> (not res!199854) (not e!165435))))

(declare-datatypes ((array!12859 0))(
  ( (array!12860 (arr!6633 (Array (_ BitVec 32) (_ BitVec 8))) (size!5646 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10214 0))(
  ( (BitStream!10215 (buf!6100 array!12859) (currentByte!11307 (_ BitVec 32)) (currentBit!11302 (_ BitVec 32))) )
))
(declare-fun thiss!1854 () BitStream!10214)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!51344 (= res!199854 (validate_offset_bits!1 ((_ sign_extend 32) (size!5646 (buf!6100 thiss!1854))) ((_ sign_extend 32) (currentByte!11307 thiss!1854)) ((_ sign_extend 32) (currentBit!11302 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> start!51344 e!165435))

(declare-fun e!165436 () Bool)

(declare-fun inv!12 (BitStream!10214) Bool)

(assert (=> start!51344 (and (inv!12 thiss!1854) e!165436)))

(declare-fun b!239200 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!239200 (= e!165435 (not (invariant!0 (currentBit!11302 thiss!1854) (bvadd #b00000000000000000000000000000001 (currentByte!11307 thiss!1854)) (size!5646 (buf!6100 thiss!1854)))))))

(declare-fun b!239201 () Bool)

(declare-fun array_inv!5387 (array!12859) Bool)

(assert (=> b!239201 (= e!165436 (array_inv!5387 (buf!6100 thiss!1854)))))

(assert (= (and start!51344 res!199854) b!239200))

(assert (= start!51344 b!239201))

(declare-fun m!361271 () Bool)

(assert (=> start!51344 m!361271))

(declare-fun m!361273 () Bool)

(assert (=> start!51344 m!361273))

(declare-fun m!361275 () Bool)

(assert (=> b!239200 m!361275))

(declare-fun m!361277 () Bool)

(assert (=> b!239201 m!361277))

(push 1)

(assert (not b!239201))

(assert (not start!51344))

(assert (not b!239200))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!80506 () Bool)

(assert (=> d!80506 (= (array_inv!5387 (buf!6100 thiss!1854)) (bvsge (size!5646 (buf!6100 thiss!1854)) #b00000000000000000000000000000000))))

(assert (=> b!239201 d!80506))

(declare-fun d!80510 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!80510 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5646 (buf!6100 thiss!1854))) ((_ sign_extend 32) (currentByte!11307 thiss!1854)) ((_ sign_extend 32) (currentBit!11302 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5646 (buf!6100 thiss!1854))) ((_ sign_extend 32) (currentByte!11307 thiss!1854)) ((_ sign_extend 32) (currentBit!11302 thiss!1854))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!20240 () Bool)

(assert (= bs!20240 d!80510))

(declare-fun m!361281 () Bool)

(assert (=> bs!20240 m!361281))

(assert (=> start!51344 d!80510))

(declare-fun d!80514 () Bool)

(assert (=> d!80514 (= (inv!12 thiss!1854) (invariant!0 (currentBit!11302 thiss!1854) (currentByte!11307 thiss!1854) (size!5646 (buf!6100 thiss!1854))))))

(declare-fun bs!20242 () Bool)

(assert (= bs!20242 d!80514))

(declare-fun m!361285 () Bool)

(assert (=> bs!20242 m!361285))

(assert (=> start!51344 d!80514))

(declare-fun d!80518 () Bool)

(assert (=> d!80518 (= (invariant!0 (currentBit!11302 thiss!1854) (bvadd #b00000000000000000000000000000001 (currentByte!11307 thiss!1854)) (size!5646 (buf!6100 thiss!1854))) (and (bvsge (currentBit!11302 thiss!1854) #b00000000000000000000000000000000) (bvslt (currentBit!11302 thiss!1854) #b00000000000000000000000000001000) (bvsge (bvadd #b00000000000000000000000000000001 (currentByte!11307 thiss!1854)) #b00000000000000000000000000000000) (or (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!11307 thiss!1854)) (size!5646 (buf!6100 thiss!1854))) (and (= (currentBit!11302 thiss!1854) #b00000000000000000000000000000000) (= (bvadd #b00000000000000000000000000000001 (currentByte!11307 thiss!1854)) (size!5646 (buf!6100 thiss!1854)))))))))

(assert (=> b!239200 d!80518))

(push 1)

(assert (not d!80514))

(assert (not d!80510))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!80536 () Bool)

(assert (=> d!80536 (= (invariant!0 (currentBit!11302 thiss!1854) (currentByte!11307 thiss!1854) (size!5646 (buf!6100 thiss!1854))) (and (bvsge (currentBit!11302 thiss!1854) #b00000000000000000000000000000000) (bvslt (currentBit!11302 thiss!1854) #b00000000000000000000000000001000) (bvsge (currentByte!11307 thiss!1854) #b00000000000000000000000000000000) (or (bvslt (currentByte!11307 thiss!1854) (size!5646 (buf!6100 thiss!1854))) (and (= (currentBit!11302 thiss!1854) #b00000000000000000000000000000000) (= (currentByte!11307 thiss!1854) (size!5646 (buf!6100 thiss!1854)))))))))

(assert (=> d!80514 d!80536))

(declare-fun d!80538 () Bool)

(assert (=> d!80538 (= (remainingBits!0 ((_ sign_extend 32) (size!5646 (buf!6100 thiss!1854))) ((_ sign_extend 32) (currentByte!11307 thiss!1854)) ((_ sign_extend 32) (currentBit!11302 thiss!1854))) (bvsub (bvmul ((_ sign_extend 32) (size!5646 (buf!6100 thiss!1854))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11307 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11302 thiss!1854)))))))

(assert (=> d!80510 d!80538))

(push 1)

(check-sat)

(pop 1)

