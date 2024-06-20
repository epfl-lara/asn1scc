; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51444 () Bool)

(assert start!51444)

(declare-fun res!199878 () Bool)

(declare-fun e!165507 () Bool)

(assert (=> start!51444 (=> (not res!199878) (not e!165507))))

(declare-datatypes ((array!12884 0))(
  ( (array!12885 (arr!6641 (Array (_ BitVec 32) (_ BitVec 8))) (size!5654 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10230 0))(
  ( (BitStream!10231 (buf!6108 array!12884) (currentByte!11339 (_ BitVec 32)) (currentBit!11334 (_ BitVec 32))) )
))
(declare-fun thiss!1854 () BitStream!10230)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!51444 (= res!199878 (validate_offset_bits!1 ((_ sign_extend 32) (size!5654 (buf!6108 thiss!1854))) ((_ sign_extend 32) (currentByte!11339 thiss!1854)) ((_ sign_extend 32) (currentBit!11334 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> start!51444 e!165507))

(declare-fun e!165508 () Bool)

(declare-fun inv!12 (BitStream!10230) Bool)

(assert (=> start!51444 (and (inv!12 thiss!1854) e!165508)))

(declare-fun b!239248 () Bool)

(assert (=> b!239248 (= e!165507 (and (bvslt (currentBit!11334 thiss!1854) #b00000000000000000000000010000000) (bvslt (currentBit!11334 thiss!1854) #b11111111111111111111111110000000)))))

(declare-fun b!239249 () Bool)

(declare-fun array_inv!5395 (array!12884) Bool)

(assert (=> b!239249 (= e!165508 (array_inv!5395 (buf!6108 thiss!1854)))))

(assert (= (and start!51444 res!199878) b!239248))

(assert (= start!51444 b!239249))

(declare-fun m!361357 () Bool)

(assert (=> start!51444 m!361357))

(declare-fun m!361359 () Bool)

(assert (=> start!51444 m!361359))

(declare-fun m!361361 () Bool)

(assert (=> b!239249 m!361361))

(check-sat (not start!51444) (not b!239249))
(check-sat)
(get-model)

(declare-fun d!80600 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!80600 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5654 (buf!6108 thiss!1854))) ((_ sign_extend 32) (currentByte!11339 thiss!1854)) ((_ sign_extend 32) (currentBit!11334 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5654 (buf!6108 thiss!1854))) ((_ sign_extend 32) (currentByte!11339 thiss!1854)) ((_ sign_extend 32) (currentBit!11334 thiss!1854))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!20266 () Bool)

(assert (= bs!20266 d!80600))

(declare-fun m!361369 () Bool)

(assert (=> bs!20266 m!361369))

(assert (=> start!51444 d!80600))

(declare-fun d!80604 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!80604 (= (inv!12 thiss!1854) (invariant!0 (currentBit!11334 thiss!1854) (currentByte!11339 thiss!1854) (size!5654 (buf!6108 thiss!1854))))))

(declare-fun bs!20268 () Bool)

(assert (= bs!20268 d!80604))

(declare-fun m!361373 () Bool)

(assert (=> bs!20268 m!361373))

(assert (=> start!51444 d!80604))

(declare-fun d!80608 () Bool)

(assert (=> d!80608 (= (array_inv!5395 (buf!6108 thiss!1854)) (bvsge (size!5654 (buf!6108 thiss!1854)) #b00000000000000000000000000000000))))

(assert (=> b!239249 d!80608))

(check-sat (not d!80604) (not d!80600))
(check-sat)
(get-model)

(declare-fun d!80618 () Bool)

(assert (=> d!80618 (= (invariant!0 (currentBit!11334 thiss!1854) (currentByte!11339 thiss!1854) (size!5654 (buf!6108 thiss!1854))) (and (bvsge (currentBit!11334 thiss!1854) #b00000000000000000000000000000000) (bvslt (currentBit!11334 thiss!1854) #b00000000000000000000000000001000) (bvsge (currentByte!11339 thiss!1854) #b00000000000000000000000000000000) (or (bvslt (currentByte!11339 thiss!1854) (size!5654 (buf!6108 thiss!1854))) (and (= (currentBit!11334 thiss!1854) #b00000000000000000000000000000000) (= (currentByte!11339 thiss!1854) (size!5654 (buf!6108 thiss!1854)))))))))

(assert (=> d!80604 d!80618))

(declare-fun d!80620 () Bool)

(assert (=> d!80620 (= (remainingBits!0 ((_ sign_extend 32) (size!5654 (buf!6108 thiss!1854))) ((_ sign_extend 32) (currentByte!11339 thiss!1854)) ((_ sign_extend 32) (currentBit!11334 thiss!1854))) (bvsub (bvmul ((_ sign_extend 32) (size!5654 (buf!6108 thiss!1854))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11339 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11334 thiss!1854)))))))

(assert (=> d!80600 d!80620))

(check-sat)
