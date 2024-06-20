; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34878 () Bool)

(assert start!34878)

(declare-fun res!137296 () Bool)

(declare-fun e!113875 () Bool)

(assert (=> start!34878 (=> (not res!137296) (not e!113875))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!34878 (= res!137296 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34878 e!113875))

(assert (=> start!34878 true))

(declare-datatypes ((array!8264 0))(
  ( (array!8265 (arr!4619 (Array (_ BitVec 32) (_ BitVec 8))) (size!3698 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6552 0))(
  ( (BitStream!6553 (buf!4150 array!8264) (currentByte!7734 (_ BitVec 32)) (currentBit!7729 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6552)

(declare-fun e!113877 () Bool)

(declare-fun inv!12 (BitStream!6552) Bool)

(assert (=> start!34878 (and (inv!12 thiss!1577) e!113877)))

(declare-fun b!164758 () Bool)

(declare-fun res!137297 () Bool)

(assert (=> b!164758 (=> (not res!137297) (not e!113875))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!164758 (= res!137297 (validate_offset_bits!1 ((_ sign_extend 32) (size!3698 (buf!4150 thiss!1577))) ((_ sign_extend 32) (currentByte!7734 thiss!1577)) ((_ sign_extend 32) (currentBit!7729 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!164759 () Bool)

(assert (=> b!164759 (= e!113875 (and (= (bvand (currentBit!7729 thiss!1577) #b10000000000000000000000000000000) (bvand nBits!511 #b10000000000000000000000000000000)) (not (= (bvand (currentBit!7729 thiss!1577) #b10000000000000000000000000000000) (bvand (bvadd (currentBit!7729 thiss!1577) nBits!511) #b10000000000000000000000000000000)))))))

(declare-fun b!164760 () Bool)

(declare-fun array_inv!3439 (array!8264) Bool)

(assert (=> b!164760 (= e!113877 (array_inv!3439 (buf!4150 thiss!1577)))))

(assert (= (and start!34878 res!137296) b!164758))

(assert (= (and b!164758 res!137297) b!164759))

(assert (= start!34878 b!164760))

(declare-fun m!262111 () Bool)

(assert (=> start!34878 m!262111))

(declare-fun m!262113 () Bool)

(assert (=> b!164758 m!262113))

(declare-fun m!262115 () Bool)

(assert (=> b!164760 m!262115))

(check-sat (not start!34878) (not b!164760) (not b!164758))
(check-sat)
(get-model)

(declare-fun d!56919 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!56919 (= (inv!12 thiss!1577) (invariant!0 (currentBit!7729 thiss!1577) (currentByte!7734 thiss!1577) (size!3698 (buf!4150 thiss!1577))))))

(declare-fun bs!14109 () Bool)

(assert (= bs!14109 d!56919))

(declare-fun m!262129 () Bool)

(assert (=> bs!14109 m!262129))

(assert (=> start!34878 d!56919))

(declare-fun d!56925 () Bool)

(assert (=> d!56925 (= (array_inv!3439 (buf!4150 thiss!1577)) (bvsge (size!3698 (buf!4150 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!164760 d!56925))

(declare-fun d!56927 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!56927 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3698 (buf!4150 thiss!1577))) ((_ sign_extend 32) (currentByte!7734 thiss!1577)) ((_ sign_extend 32) (currentBit!7729 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3698 (buf!4150 thiss!1577))) ((_ sign_extend 32) (currentByte!7734 thiss!1577)) ((_ sign_extend 32) (currentBit!7729 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14111 () Bool)

(assert (= bs!14111 d!56927))

(declare-fun m!262133 () Bool)

(assert (=> bs!14111 m!262133))

(assert (=> b!164758 d!56927))

(check-sat (not d!56927) (not d!56919))
(check-sat)
(get-model)

(declare-fun d!56931 () Bool)

(assert (=> d!56931 (= (remainingBits!0 ((_ sign_extend 32) (size!3698 (buf!4150 thiss!1577))) ((_ sign_extend 32) (currentByte!7734 thiss!1577)) ((_ sign_extend 32) (currentBit!7729 thiss!1577))) (bvsub (bvmul ((_ sign_extend 32) (size!3698 (buf!4150 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7734 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7729 thiss!1577)))))))

(assert (=> d!56927 d!56931))

(declare-fun d!56935 () Bool)

(assert (=> d!56935 (= (invariant!0 (currentBit!7729 thiss!1577) (currentByte!7734 thiss!1577) (size!3698 (buf!4150 thiss!1577))) (and (bvsge (currentBit!7729 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentBit!7729 thiss!1577) #b00000000000000000000000000001000) (bvsge (currentByte!7734 thiss!1577) #b00000000000000000000000000000000) (or (bvslt (currentByte!7734 thiss!1577) (size!3698 (buf!4150 thiss!1577))) (and (= (currentBit!7729 thiss!1577) #b00000000000000000000000000000000) (= (currentByte!7734 thiss!1577) (size!3698 (buf!4150 thiss!1577)))))))))

(assert (=> d!56919 d!56935))

(check-sat)
