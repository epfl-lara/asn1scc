; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34876 () Bool)

(assert start!34876)

(declare-fun res!137290 () Bool)

(declare-fun e!113868 () Bool)

(assert (=> start!34876 (=> (not res!137290) (not e!113868))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!34876 (= res!137290 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34876 e!113868))

(assert (=> start!34876 true))

(declare-datatypes ((array!8262 0))(
  ( (array!8263 (arr!4618 (Array (_ BitVec 32) (_ BitVec 8))) (size!3697 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6550 0))(
  ( (BitStream!6551 (buf!4149 array!8262) (currentByte!7733 (_ BitVec 32)) (currentBit!7728 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6550)

(declare-fun e!113867 () Bool)

(declare-fun inv!12 (BitStream!6550) Bool)

(assert (=> start!34876 (and (inv!12 thiss!1577) e!113867)))

(declare-fun b!164749 () Bool)

(declare-fun res!137291 () Bool)

(assert (=> b!164749 (=> (not res!137291) (not e!113868))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!164749 (= res!137291 (validate_offset_bits!1 ((_ sign_extend 32) (size!3697 (buf!4149 thiss!1577))) ((_ sign_extend 32) (currentByte!7733 thiss!1577)) ((_ sign_extend 32) (currentBit!7728 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!164750 () Bool)

(assert (=> b!164750 (= e!113868 (and (= (bvand (currentBit!7728 thiss!1577) #b10000000000000000000000000000000) (bvand nBits!511 #b10000000000000000000000000000000)) (not (= (bvand (currentBit!7728 thiss!1577) #b10000000000000000000000000000000) (bvand (bvadd (currentBit!7728 thiss!1577) nBits!511) #b10000000000000000000000000000000)))))))

(declare-fun b!164751 () Bool)

(declare-fun array_inv!3438 (array!8262) Bool)

(assert (=> b!164751 (= e!113867 (array_inv!3438 (buf!4149 thiss!1577)))))

(assert (= (and start!34876 res!137290) b!164749))

(assert (= (and b!164749 res!137291) b!164750))

(assert (= start!34876 b!164751))

(declare-fun m!262105 () Bool)

(assert (=> start!34876 m!262105))

(declare-fun m!262107 () Bool)

(assert (=> b!164749 m!262107))

(declare-fun m!262109 () Bool)

(assert (=> b!164751 m!262109))

(push 1)

(assert (not b!164751))

(assert (not b!164749))

(assert (not start!34876))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!56913 () Bool)

(assert (=> d!56913 (= (array_inv!3438 (buf!4149 thiss!1577)) (bvsge (size!3697 (buf!4149 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!164751 d!56913))

(declare-fun d!56915 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!56915 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3697 (buf!4149 thiss!1577))) ((_ sign_extend 32) (currentByte!7733 thiss!1577)) ((_ sign_extend 32) (currentBit!7728 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3697 (buf!4149 thiss!1577))) ((_ sign_extend 32) (currentByte!7733 thiss!1577)) ((_ sign_extend 32) (currentBit!7728 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14106 () Bool)

(assert (= bs!14106 d!56915))

(declare-fun m!262123 () Bool)

(assert (=> bs!14106 m!262123))

(assert (=> b!164749 d!56915))

(declare-fun d!56917 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!56917 (= (inv!12 thiss!1577) (invariant!0 (currentBit!7728 thiss!1577) (currentByte!7733 thiss!1577) (size!3697 (buf!4149 thiss!1577))))))

(declare-fun bs!14107 () Bool)

(assert (= bs!14107 d!56917))

(declare-fun m!262125 () Bool)

(assert (=> bs!14107 m!262125))

(assert (=> start!34876 d!56917))

(push 1)

(assert (not d!56917))

(assert (not d!56915))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!56933 () Bool)

(assert (=> d!56933 (= (invariant!0 (currentBit!7728 thiss!1577) (currentByte!7733 thiss!1577) (size!3697 (buf!4149 thiss!1577))) (and (bvsge (currentBit!7728 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentBit!7728 thiss!1577) #b00000000000000000000000000001000) (bvsge (currentByte!7733 thiss!1577) #b00000000000000000000000000000000) (or (bvslt (currentByte!7733 thiss!1577) (size!3697 (buf!4149 thiss!1577))) (and (= (currentBit!7728 thiss!1577) #b00000000000000000000000000000000) (= (currentByte!7733 thiss!1577) (size!3697 (buf!4149 thiss!1577)))))))))

(assert (=> d!56917 d!56933))

(declare-fun d!56937 () Bool)

(assert (=> d!56937 (= (remainingBits!0 ((_ sign_extend 32) (size!3697 (buf!4149 thiss!1577))) ((_ sign_extend 32) (currentByte!7733 thiss!1577)) ((_ sign_extend 32) (currentBit!7728 thiss!1577))) (bvsub (bvmul ((_ sign_extend 32) (size!3697 (buf!4149 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7733 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7728 thiss!1577)))))))

(assert (=> d!56915 d!56937))

(push 1)

(check-sat)

