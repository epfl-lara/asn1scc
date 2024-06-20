; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51376 () Bool)

(assert start!51376)

(declare-fun res!199857 () Bool)

(declare-fun e!165444 () Bool)

(assert (=> start!51376 (=> (not res!199857) (not e!165444))))

(declare-datatypes ((array!12864 0))(
  ( (array!12865 (arr!6634 (Array (_ BitVec 32) (_ BitVec 8))) (size!5647 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10216 0))(
  ( (BitStream!10217 (buf!6101 array!12864) (currentByte!11317 (_ BitVec 32)) (currentBit!11312 (_ BitVec 32))) )
))
(declare-fun thiss!1854 () BitStream!10216)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!51376 (= res!199857 (validate_offset_bits!1 ((_ sign_extend 32) (size!5647 (buf!6101 thiss!1854))) ((_ sign_extend 32) (currentByte!11317 thiss!1854)) ((_ sign_extend 32) (currentBit!11312 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> start!51376 e!165444))

(declare-fun e!165445 () Bool)

(declare-fun inv!12 (BitStream!10216) Bool)

(assert (=> start!51376 (and (inv!12 thiss!1854) e!165445)))

(declare-fun b!239206 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!239206 (= e!165444 (not (invariant!0 (currentBit!11312 thiss!1854) (currentByte!11317 thiss!1854) (size!5647 (buf!6101 thiss!1854)))))))

(declare-fun b!239207 () Bool)

(declare-fun array_inv!5388 (array!12864) Bool)

(assert (=> b!239207 (= e!165445 (array_inv!5388 (buf!6101 thiss!1854)))))

(assert (= (and start!51376 res!199857) b!239206))

(assert (= start!51376 b!239207))

(declare-fun m!361291 () Bool)

(assert (=> start!51376 m!361291))

(declare-fun m!361293 () Bool)

(assert (=> start!51376 m!361293))

(declare-fun m!361295 () Bool)

(assert (=> b!239206 m!361295))

(declare-fun m!361297 () Bool)

(assert (=> b!239207 m!361297))

(push 1)

(assert (not start!51376))

(assert (not b!239206))

(assert (not b!239207))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!80542 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!80542 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5647 (buf!6101 thiss!1854))) ((_ sign_extend 32) (currentByte!11317 thiss!1854)) ((_ sign_extend 32) (currentBit!11312 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5647 (buf!6101 thiss!1854))) ((_ sign_extend 32) (currentByte!11317 thiss!1854)) ((_ sign_extend 32) (currentBit!11312 thiss!1854))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!20248 () Bool)

(assert (= bs!20248 d!80542))

(declare-fun m!361315 () Bool)

(assert (=> bs!20248 m!361315))

(assert (=> start!51376 d!80542))

(declare-fun d!80548 () Bool)

(assert (=> d!80548 (= (inv!12 thiss!1854) (invariant!0 (currentBit!11312 thiss!1854) (currentByte!11317 thiss!1854) (size!5647 (buf!6101 thiss!1854))))))

(declare-fun bs!20250 () Bool)

(assert (= bs!20250 d!80548))

(assert (=> bs!20250 m!361295))

(assert (=> start!51376 d!80548))

(declare-fun d!80552 () Bool)

(assert (=> d!80552 (= (invariant!0 (currentBit!11312 thiss!1854) (currentByte!11317 thiss!1854) (size!5647 (buf!6101 thiss!1854))) (and (bvsge (currentBit!11312 thiss!1854) #b00000000000000000000000000000000) (bvslt (currentBit!11312 thiss!1854) #b00000000000000000000000000001000) (bvsge (currentByte!11317 thiss!1854) #b00000000000000000000000000000000) (or (bvslt (currentByte!11317 thiss!1854) (size!5647 (buf!6101 thiss!1854))) (and (= (currentBit!11312 thiss!1854) #b00000000000000000000000000000000) (= (currentByte!11317 thiss!1854) (size!5647 (buf!6101 thiss!1854)))))))))

(assert (=> b!239206 d!80552))

(declare-fun d!80556 () Bool)

(assert (=> d!80556 (= (array_inv!5388 (buf!6101 thiss!1854)) (bvsge (size!5647 (buf!6101 thiss!1854)) #b00000000000000000000000000000000))))

(assert (=> b!239207 d!80556))

(push 1)

(assert (not d!80548))

(assert (not d!80542))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

