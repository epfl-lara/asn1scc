; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56586 () Bool)

(assert start!56586)

(declare-fun res!218692 () Bool)

(declare-fun e!181544 () Bool)

(assert (=> start!56586 (=> (not res!218692) (not e!181544))))

(declare-datatypes ((array!14381 0))(
  ( (array!14382 (arr!7271 (Array (_ BitVec 32) (_ BitVec 8))) (size!6284 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11490 0))(
  ( (BitStream!11491 (buf!6806 array!14381) (currentByte!12547 (_ BitVec 32)) (currentBit!12542 (_ BitVec 32))) )
))
(declare-fun thiss!914 () BitStream!11490)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!56586 (= res!218692 (validate_offset_bit!0 ((_ sign_extend 32) (size!6284 (buf!6806 thiss!914))) ((_ sign_extend 32) (currentByte!12547 thiss!914)) ((_ sign_extend 32) (currentBit!12542 thiss!914))))))

(assert (=> start!56586 e!181544))

(declare-fun e!181546 () Bool)

(declare-fun inv!12 (BitStream!11490) Bool)

(assert (=> start!56586 (and (inv!12 thiss!914) e!181546)))

(assert (=> start!56586 true))

(declare-fun b!261186 () Bool)

(declare-fun res!218693 () Bool)

(assert (=> b!261186 (=> (not res!218693) (not e!181544))))

(declare-fun b!187 () Bool)

(assert (=> b!261186 (= res!218693 b!187)))

(declare-fun b!261187 () Bool)

(assert (=> b!261187 (= e!181544 (not (inv!12 (BitStream!11491 (array!14382 (store (arr!7271 (buf!6806 thiss!914)) (currentByte!12547 thiss!914) ((_ extract 7 0) (bvor ((_ sign_extend 24) (select (arr!7271 (buf!6806 thiss!914)) (currentByte!12547 thiss!914))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12542 thiss!914)))))) (size!6284 (buf!6806 thiss!914))) (currentByte!12547 thiss!914) (currentBit!12542 thiss!914)))))))

(declare-fun b!261188 () Bool)

(declare-fun array_inv!6025 (array!14381) Bool)

(assert (=> b!261188 (= e!181546 (array_inv!6025 (buf!6806 thiss!914)))))

(assert (= (and start!56586 res!218692) b!261186))

(assert (= (and b!261186 res!218693) b!261187))

(assert (= start!56586 b!261188))

(declare-fun m!390789 () Bool)

(assert (=> start!56586 m!390789))

(declare-fun m!390791 () Bool)

(assert (=> start!56586 m!390791))

(declare-fun m!390793 () Bool)

(assert (=> b!261187 m!390793))

(declare-fun m!390795 () Bool)

(assert (=> b!261187 m!390795))

(declare-fun m!390797 () Bool)

(assert (=> b!261187 m!390797))

(declare-fun m!390799 () Bool)

(assert (=> b!261187 m!390799))

(declare-fun m!390801 () Bool)

(assert (=> b!261188 m!390801))

(check-sat (not b!261187) (not start!56586) (not b!261188))
(check-sat)
(get-model)

(declare-fun d!87822 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!87822 (= (inv!12 (BitStream!11491 (array!14382 (store (arr!7271 (buf!6806 thiss!914)) (currentByte!12547 thiss!914) ((_ extract 7 0) (bvor ((_ sign_extend 24) (select (arr!7271 (buf!6806 thiss!914)) (currentByte!12547 thiss!914))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12542 thiss!914)))))) (size!6284 (buf!6806 thiss!914))) (currentByte!12547 thiss!914) (currentBit!12542 thiss!914))) (invariant!0 (currentBit!12542 (BitStream!11491 (array!14382 (store (arr!7271 (buf!6806 thiss!914)) (currentByte!12547 thiss!914) ((_ extract 7 0) (bvor ((_ sign_extend 24) (select (arr!7271 (buf!6806 thiss!914)) (currentByte!12547 thiss!914))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12542 thiss!914)))))) (size!6284 (buf!6806 thiss!914))) (currentByte!12547 thiss!914) (currentBit!12542 thiss!914))) (currentByte!12547 (BitStream!11491 (array!14382 (store (arr!7271 (buf!6806 thiss!914)) (currentByte!12547 thiss!914) ((_ extract 7 0) (bvor ((_ sign_extend 24) (select (arr!7271 (buf!6806 thiss!914)) (currentByte!12547 thiss!914))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12542 thiss!914)))))) (size!6284 (buf!6806 thiss!914))) (currentByte!12547 thiss!914) (currentBit!12542 thiss!914))) (size!6284 (buf!6806 (BitStream!11491 (array!14382 (store (arr!7271 (buf!6806 thiss!914)) (currentByte!12547 thiss!914) ((_ extract 7 0) (bvor ((_ sign_extend 24) (select (arr!7271 (buf!6806 thiss!914)) (currentByte!12547 thiss!914))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12542 thiss!914)))))) (size!6284 (buf!6806 thiss!914))) (currentByte!12547 thiss!914) (currentBit!12542 thiss!914))))))))

(declare-fun bs!22236 () Bool)

(assert (= bs!22236 d!87822))

(declare-fun m!390817 () Bool)

(assert (=> bs!22236 m!390817))

(assert (=> b!261187 d!87822))

(declare-fun d!87824 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!87824 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6284 (buf!6806 thiss!914))) ((_ sign_extend 32) (currentByte!12547 thiss!914)) ((_ sign_extend 32) (currentBit!12542 thiss!914))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6284 (buf!6806 thiss!914))) ((_ sign_extend 32) (currentByte!12547 thiss!914)) ((_ sign_extend 32) (currentBit!12542 thiss!914))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!22237 () Bool)

(assert (= bs!22237 d!87824))

(declare-fun m!390819 () Bool)

(assert (=> bs!22237 m!390819))

(assert (=> start!56586 d!87824))

(declare-fun d!87826 () Bool)

(assert (=> d!87826 (= (inv!12 thiss!914) (invariant!0 (currentBit!12542 thiss!914) (currentByte!12547 thiss!914) (size!6284 (buf!6806 thiss!914))))))

(declare-fun bs!22238 () Bool)

(assert (= bs!22238 d!87826))

(declare-fun m!390821 () Bool)

(assert (=> bs!22238 m!390821))

(assert (=> start!56586 d!87826))

(declare-fun d!87828 () Bool)

(assert (=> d!87828 (= (array_inv!6025 (buf!6806 thiss!914)) (bvsge (size!6284 (buf!6806 thiss!914)) #b00000000000000000000000000000000))))

(assert (=> b!261188 d!87828))

(check-sat (not d!87824) (not d!87826) (not d!87822))
(check-sat)
