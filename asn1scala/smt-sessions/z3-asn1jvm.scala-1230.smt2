; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34950 () Bool)

(assert start!34950)

(declare-fun res!137332 () Bool)

(declare-fun e!113931 () Bool)

(assert (=> start!34950 (=> (not res!137332) (not e!113931))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!34950 (= res!137332 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34950 e!113931))

(assert (=> start!34950 true))

(declare-datatypes ((array!8282 0))(
  ( (array!8283 (arr!4625 (Array (_ BitVec 32) (_ BitVec 8))) (size!3704 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6564 0))(
  ( (BitStream!6565 (buf!4156 array!8282) (currentByte!7758 (_ BitVec 32)) (currentBit!7753 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6564)

(declare-fun e!113929 () Bool)

(declare-fun inv!12 (BitStream!6564) Bool)

(assert (=> start!34950 (and (inv!12 thiss!1577) e!113929)))

(declare-fun b!164812 () Bool)

(declare-fun res!137333 () Bool)

(assert (=> b!164812 (=> (not res!137333) (not e!113931))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!164812 (= res!137333 (validate_offset_bits!1 ((_ sign_extend 32) (size!3704 (buf!4156 thiss!1577))) ((_ sign_extend 32) (currentByte!7758 thiss!1577)) ((_ sign_extend 32) (currentBit!7753 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!164813 () Bool)

(assert (=> b!164813 (= e!113931 (or (bvslt (bvsub #b00000000000000000000000000001000 (currentBit!7753 thiss!1577)) #b00000000000000000000000000000000) (bvsge (bvsub #b00000000000000000000000000001000 (currentBit!7753 thiss!1577)) #b00000000000000000000000000001001)))))

(declare-fun b!164814 () Bool)

(declare-fun array_inv!3445 (array!8282) Bool)

(assert (=> b!164814 (= e!113929 (array_inv!3445 (buf!4156 thiss!1577)))))

(assert (= (and start!34950 res!137332) b!164812))

(assert (= (and b!164812 res!137333) b!164813))

(assert (= start!34950 b!164814))

(declare-fun m!262171 () Bool)

(assert (=> start!34950 m!262171))

(declare-fun m!262173 () Bool)

(assert (=> b!164812 m!262173))

(declare-fun m!262175 () Bool)

(assert (=> b!164814 m!262175))

(check-sat (not b!164812) (not start!34950) (not b!164814))
(check-sat)
(get-model)

(declare-fun d!56977 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!56977 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3704 (buf!4156 thiss!1577))) ((_ sign_extend 32) (currentByte!7758 thiss!1577)) ((_ sign_extend 32) (currentBit!7753 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3704 (buf!4156 thiss!1577))) ((_ sign_extend 32) (currentByte!7758 thiss!1577)) ((_ sign_extend 32) (currentBit!7753 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14124 () Bool)

(assert (= bs!14124 d!56977))

(declare-fun m!262183 () Bool)

(assert (=> bs!14124 m!262183))

(assert (=> b!164812 d!56977))

(declare-fun d!56979 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!56979 (= (inv!12 thiss!1577) (invariant!0 (currentBit!7753 thiss!1577) (currentByte!7758 thiss!1577) (size!3704 (buf!4156 thiss!1577))))))

(declare-fun bs!14125 () Bool)

(assert (= bs!14125 d!56979))

(declare-fun m!262185 () Bool)

(assert (=> bs!14125 m!262185))

(assert (=> start!34950 d!56979))

(declare-fun d!56981 () Bool)

(assert (=> d!56981 (= (array_inv!3445 (buf!4156 thiss!1577)) (bvsge (size!3704 (buf!4156 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!164814 d!56981))

(check-sat (not d!56977) (not d!56979))
(check-sat)
(get-model)

(declare-fun d!56989 () Bool)

(assert (=> d!56989 (= (remainingBits!0 ((_ sign_extend 32) (size!3704 (buf!4156 thiss!1577))) ((_ sign_extend 32) (currentByte!7758 thiss!1577)) ((_ sign_extend 32) (currentBit!7753 thiss!1577))) (bvsub (bvmul ((_ sign_extend 32) (size!3704 (buf!4156 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7758 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7753 thiss!1577)))))))

(assert (=> d!56977 d!56989))

(declare-fun d!56995 () Bool)

(assert (=> d!56995 (= (invariant!0 (currentBit!7753 thiss!1577) (currentByte!7758 thiss!1577) (size!3704 (buf!4156 thiss!1577))) (and (bvsge (currentBit!7753 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentBit!7753 thiss!1577) #b00000000000000000000000000001000) (bvsge (currentByte!7758 thiss!1577) #b00000000000000000000000000000000) (or (bvslt (currentByte!7758 thiss!1577) (size!3704 (buf!4156 thiss!1577))) (and (= (currentBit!7753 thiss!1577) #b00000000000000000000000000000000) (= (currentByte!7758 thiss!1577) (size!3704 (buf!4156 thiss!1577)))))))))

(assert (=> d!56979 d!56995))

(check-sat)
