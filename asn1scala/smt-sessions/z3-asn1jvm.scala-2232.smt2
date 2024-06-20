; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56728 () Bool)

(assert start!56728)

(declare-fun res!218756 () Bool)

(declare-fun e!181707 () Bool)

(assert (=> start!56728 (=> (not res!218756) (not e!181707))))

(declare-datatypes ((array!14429 0))(
  ( (array!14430 (arr!7289 (Array (_ BitVec 32) (_ BitVec 8))) (size!6302 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11526 0))(
  ( (BitStream!11527 (buf!6824 array!14429) (currentByte!12594 (_ BitVec 32)) (currentBit!12589 (_ BitVec 32))) )
))
(declare-fun thiss!914 () BitStream!11526)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!56728 (= res!218756 (validate_offset_bit!0 ((_ sign_extend 32) (size!6302 (buf!6824 thiss!914))) ((_ sign_extend 32) (currentByte!12594 thiss!914)) ((_ sign_extend 32) (currentBit!12589 thiss!914))))))

(assert (=> start!56728 e!181707))

(declare-fun e!181708 () Bool)

(declare-fun inv!12 (BitStream!11526) Bool)

(assert (=> start!56728 (and (inv!12 thiss!914) e!181708)))

(assert (=> start!56728 true))

(declare-fun b!261303 () Bool)

(declare-fun res!218755 () Bool)

(assert (=> b!261303 (=> (not res!218755) (not e!181707))))

(declare-fun b!187 () Bool)

(assert (=> b!261303 (= res!218755 (not b!187))))

(declare-fun b!261304 () Bool)

(assert (=> b!261304 (= e!181707 (not (inv!12 (BitStream!11527 (array!14430 (store (arr!7289 (buf!6824 thiss!914)) (currentByte!12594 thiss!914) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!7289 (buf!6824 thiss!914)) (currentByte!12594 thiss!914))) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12589 thiss!914))))))) (size!6302 (buf!6824 thiss!914))) (currentByte!12594 thiss!914) (currentBit!12589 thiss!914)))))))

(declare-fun b!261305 () Bool)

(declare-fun array_inv!6043 (array!14429) Bool)

(assert (=> b!261305 (= e!181708 (array_inv!6043 (buf!6824 thiss!914)))))

(assert (= (and start!56728 res!218756) b!261303))

(assert (= (and b!261303 res!218755) b!261304))

(assert (= start!56728 b!261305))

(declare-fun m!390993 () Bool)

(assert (=> start!56728 m!390993))

(declare-fun m!390995 () Bool)

(assert (=> start!56728 m!390995))

(declare-fun m!390997 () Bool)

(assert (=> b!261304 m!390997))

(declare-fun m!390999 () Bool)

(assert (=> b!261304 m!390999))

(declare-fun m!391001 () Bool)

(assert (=> b!261304 m!391001))

(declare-fun m!391003 () Bool)

(assert (=> b!261304 m!391003))

(declare-fun m!391005 () Bool)

(assert (=> b!261305 m!391005))

(check-sat (not b!261305) (not b!261304) (not start!56728))
(check-sat)
(get-model)

(declare-fun d!87942 () Bool)

(assert (=> d!87942 (= (array_inv!6043 (buf!6824 thiss!914)) (bvsge (size!6302 (buf!6824 thiss!914)) #b00000000000000000000000000000000))))

(assert (=> b!261305 d!87942))

(declare-fun d!87944 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!87944 (= (inv!12 (BitStream!11527 (array!14430 (store (arr!7289 (buf!6824 thiss!914)) (currentByte!12594 thiss!914) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!7289 (buf!6824 thiss!914)) (currentByte!12594 thiss!914))) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12589 thiss!914))))))) (size!6302 (buf!6824 thiss!914))) (currentByte!12594 thiss!914) (currentBit!12589 thiss!914))) (invariant!0 (currentBit!12589 (BitStream!11527 (array!14430 (store (arr!7289 (buf!6824 thiss!914)) (currentByte!12594 thiss!914) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!7289 (buf!6824 thiss!914)) (currentByte!12594 thiss!914))) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12589 thiss!914))))))) (size!6302 (buf!6824 thiss!914))) (currentByte!12594 thiss!914) (currentBit!12589 thiss!914))) (currentByte!12594 (BitStream!11527 (array!14430 (store (arr!7289 (buf!6824 thiss!914)) (currentByte!12594 thiss!914) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!7289 (buf!6824 thiss!914)) (currentByte!12594 thiss!914))) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12589 thiss!914))))))) (size!6302 (buf!6824 thiss!914))) (currentByte!12594 thiss!914) (currentBit!12589 thiss!914))) (size!6302 (buf!6824 (BitStream!11527 (array!14430 (store (arr!7289 (buf!6824 thiss!914)) (currentByte!12594 thiss!914) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!7289 (buf!6824 thiss!914)) (currentByte!12594 thiss!914))) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12589 thiss!914))))))) (size!6302 (buf!6824 thiss!914))) (currentByte!12594 thiss!914) (currentBit!12589 thiss!914))))))))

(declare-fun bs!22278 () Bool)

(assert (= bs!22278 d!87944))

(declare-fun m!391021 () Bool)

(assert (=> bs!22278 m!391021))

(assert (=> b!261304 d!87944))

(declare-fun d!87946 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!87946 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6302 (buf!6824 thiss!914))) ((_ sign_extend 32) (currentByte!12594 thiss!914)) ((_ sign_extend 32) (currentBit!12589 thiss!914))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6302 (buf!6824 thiss!914))) ((_ sign_extend 32) (currentByte!12594 thiss!914)) ((_ sign_extend 32) (currentBit!12589 thiss!914))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!22279 () Bool)

(assert (= bs!22279 d!87946))

(declare-fun m!391023 () Bool)

(assert (=> bs!22279 m!391023))

(assert (=> start!56728 d!87946))

(declare-fun d!87948 () Bool)

(assert (=> d!87948 (= (inv!12 thiss!914) (invariant!0 (currentBit!12589 thiss!914) (currentByte!12594 thiss!914) (size!6302 (buf!6824 thiss!914))))))

(declare-fun bs!22280 () Bool)

(assert (= bs!22280 d!87948))

(declare-fun m!391025 () Bool)

(assert (=> bs!22280 m!391025))

(assert (=> start!56728 d!87948))

(check-sat (not d!87944) (not d!87946) (not d!87948))
(check-sat)
