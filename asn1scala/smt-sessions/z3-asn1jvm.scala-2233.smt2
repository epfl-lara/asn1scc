; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56752 () Bool)

(assert start!56752)

(declare-fun res!218768 () Bool)

(declare-fun e!181733 () Bool)

(assert (=> start!56752 (=> (not res!218768) (not e!181733))))

(declare-datatypes ((array!14438 0))(
  ( (array!14439 (arr!7292 (Array (_ BitVec 32) (_ BitVec 8))) (size!6305 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11532 0))(
  ( (BitStream!11533 (buf!6827 array!14438) (currentByte!12600 (_ BitVec 32)) (currentBit!12595 (_ BitVec 32))) )
))
(declare-fun thiss!914 () BitStream!11532)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!56752 (= res!218768 (validate_offset_bit!0 ((_ sign_extend 32) (size!6305 (buf!6827 thiss!914))) ((_ sign_extend 32) (currentByte!12600 thiss!914)) ((_ sign_extend 32) (currentBit!12595 thiss!914))))))

(assert (=> start!56752 e!181733))

(declare-fun e!181734 () Bool)

(declare-fun inv!12 (BitStream!11532) Bool)

(assert (=> start!56752 (and (inv!12 thiss!914) e!181734)))

(assert (=> start!56752 true))

(declare-fun b!261325 () Bool)

(declare-fun b!187 () Bool)

(assert (=> b!261325 (= e!181733 (and (not b!187) (or (bvslt (currentByte!12600 thiss!914) #b00000000000000000000000000000000) (bvsge (currentByte!12600 thiss!914) (size!6305 (buf!6827 thiss!914))))))))

(declare-fun b!261326 () Bool)

(declare-fun array_inv!6046 (array!14438) Bool)

(assert (=> b!261326 (= e!181734 (array_inv!6046 (buf!6827 thiss!914)))))

(assert (= (and start!56752 res!218768) b!261325))

(assert (= start!56752 b!261326))

(declare-fun m!391045 () Bool)

(assert (=> start!56752 m!391045))

(declare-fun m!391047 () Bool)

(assert (=> start!56752 m!391047))

(declare-fun m!391049 () Bool)

(assert (=> b!261326 m!391049))

(check-sat (not b!261326) (not start!56752))
(check-sat)
(get-model)

(declare-fun d!87968 () Bool)

(assert (=> d!87968 (= (array_inv!6046 (buf!6827 thiss!914)) (bvsge (size!6305 (buf!6827 thiss!914)) #b00000000000000000000000000000000))))

(assert (=> b!261326 d!87968))

(declare-fun d!87970 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!87970 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6305 (buf!6827 thiss!914))) ((_ sign_extend 32) (currentByte!12600 thiss!914)) ((_ sign_extend 32) (currentBit!12595 thiss!914))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6305 (buf!6827 thiss!914))) ((_ sign_extend 32) (currentByte!12600 thiss!914)) ((_ sign_extend 32) (currentBit!12595 thiss!914))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!22290 () Bool)

(assert (= bs!22290 d!87970))

(declare-fun m!391057 () Bool)

(assert (=> bs!22290 m!391057))

(assert (=> start!56752 d!87970))

(declare-fun d!87972 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!87972 (= (inv!12 thiss!914) (invariant!0 (currentBit!12595 thiss!914) (currentByte!12600 thiss!914) (size!6305 (buf!6827 thiss!914))))))

(declare-fun bs!22291 () Bool)

(assert (= bs!22291 d!87972))

(declare-fun m!391059 () Bool)

(assert (=> bs!22291 m!391059))

(assert (=> start!56752 d!87972))

(check-sat (not d!87972) (not d!87970))
(check-sat)
(get-model)

(declare-fun d!87986 () Bool)

(assert (=> d!87986 (= (invariant!0 (currentBit!12595 thiss!914) (currentByte!12600 thiss!914) (size!6305 (buf!6827 thiss!914))) (and (bvsge (currentBit!12595 thiss!914) #b00000000000000000000000000000000) (bvslt (currentBit!12595 thiss!914) #b00000000000000000000000000001000) (bvsge (currentByte!12600 thiss!914) #b00000000000000000000000000000000) (or (bvslt (currentByte!12600 thiss!914) (size!6305 (buf!6827 thiss!914))) (and (= (currentBit!12595 thiss!914) #b00000000000000000000000000000000) (= (currentByte!12600 thiss!914) (size!6305 (buf!6827 thiss!914)))))))))

(assert (=> d!87972 d!87986))

(declare-fun d!87988 () Bool)

(assert (=> d!87988 (= (remainingBits!0 ((_ sign_extend 32) (size!6305 (buf!6827 thiss!914))) ((_ sign_extend 32) (currentByte!12600 thiss!914)) ((_ sign_extend 32) (currentBit!12595 thiss!914))) (bvsub (bvmul ((_ sign_extend 32) (size!6305 (buf!6827 thiss!914))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12600 thiss!914)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12595 thiss!914)))))))

(assert (=> d!87970 d!87988))

(check-sat)
