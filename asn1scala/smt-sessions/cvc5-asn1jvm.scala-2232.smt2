; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56726 () Bool)

(assert start!56726)

(declare-fun res!218749 () Bool)

(declare-fun e!181698 () Bool)

(assert (=> start!56726 (=> (not res!218749) (not e!181698))))

(declare-datatypes ((array!14427 0))(
  ( (array!14428 (arr!7288 (Array (_ BitVec 32) (_ BitVec 8))) (size!6301 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11524 0))(
  ( (BitStream!11525 (buf!6823 array!14427) (currentByte!12593 (_ BitVec 32)) (currentBit!12588 (_ BitVec 32))) )
))
(declare-fun thiss!914 () BitStream!11524)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!56726 (= res!218749 (validate_offset_bit!0 ((_ sign_extend 32) (size!6301 (buf!6823 thiss!914))) ((_ sign_extend 32) (currentByte!12593 thiss!914)) ((_ sign_extend 32) (currentBit!12588 thiss!914))))))

(assert (=> start!56726 e!181698))

(declare-fun e!181699 () Bool)

(declare-fun inv!12 (BitStream!11524) Bool)

(assert (=> start!56726 (and (inv!12 thiss!914) e!181699)))

(assert (=> start!56726 true))

(declare-fun b!261294 () Bool)

(declare-fun res!218750 () Bool)

(assert (=> b!261294 (=> (not res!218750) (not e!181698))))

(declare-fun b!187 () Bool)

(assert (=> b!261294 (= res!218750 (not b!187))))

(declare-fun b!261295 () Bool)

(assert (=> b!261295 (= e!181698 (not (inv!12 (BitStream!11525 (array!14428 (store (arr!7288 (buf!6823 thiss!914)) (currentByte!12593 thiss!914) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!7288 (buf!6823 thiss!914)) (currentByte!12593 thiss!914))) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12588 thiss!914))))))) (size!6301 (buf!6823 thiss!914))) (currentByte!12593 thiss!914) (currentBit!12588 thiss!914)))))))

(declare-fun b!261296 () Bool)

(declare-fun array_inv!6042 (array!14427) Bool)

(assert (=> b!261296 (= e!181699 (array_inv!6042 (buf!6823 thiss!914)))))

(assert (= (and start!56726 res!218749) b!261294))

(assert (= (and b!261294 res!218750) b!261295))

(assert (= start!56726 b!261296))

(declare-fun m!390979 () Bool)

(assert (=> start!56726 m!390979))

(declare-fun m!390981 () Bool)

(assert (=> start!56726 m!390981))

(declare-fun m!390983 () Bool)

(assert (=> b!261295 m!390983))

(declare-fun m!390985 () Bool)

(assert (=> b!261295 m!390985))

(declare-fun m!390987 () Bool)

(assert (=> b!261295 m!390987))

(declare-fun m!390989 () Bool)

(assert (=> b!261295 m!390989))

(declare-fun m!390991 () Bool)

(assert (=> b!261296 m!390991))

(push 1)

(assert (not start!56726))

(assert (not b!261296))

(assert (not b!261295))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!87950 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!87950 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6301 (buf!6823 thiss!914))) ((_ sign_extend 32) (currentByte!12593 thiss!914)) ((_ sign_extend 32) (currentBit!12588 thiss!914))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6301 (buf!6823 thiss!914))) ((_ sign_extend 32) (currentByte!12593 thiss!914)) ((_ sign_extend 32) (currentBit!12588 thiss!914))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!22281 () Bool)

(assert (= bs!22281 d!87950))

(declare-fun m!391027 () Bool)

(assert (=> bs!22281 m!391027))

(assert (=> start!56726 d!87950))

(declare-fun d!87954 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!87954 (= (inv!12 thiss!914) (invariant!0 (currentBit!12588 thiss!914) (currentByte!12593 thiss!914) (size!6301 (buf!6823 thiss!914))))))

(declare-fun bs!22283 () Bool)

(assert (= bs!22283 d!87954))

(declare-fun m!391031 () Bool)

(assert (=> bs!22283 m!391031))

(assert (=> start!56726 d!87954))

(declare-fun d!87958 () Bool)

(assert (=> d!87958 (= (array_inv!6042 (buf!6823 thiss!914)) (bvsge (size!6301 (buf!6823 thiss!914)) #b00000000000000000000000000000000))))

(assert (=> b!261296 d!87958))

(declare-fun d!87964 () Bool)

(assert (=> d!87964 (= (inv!12 (BitStream!11525 (array!14428 (store (arr!7288 (buf!6823 thiss!914)) (currentByte!12593 thiss!914) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!7288 (buf!6823 thiss!914)) (currentByte!12593 thiss!914))) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12588 thiss!914))))))) (size!6301 (buf!6823 thiss!914))) (currentByte!12593 thiss!914) (currentBit!12588 thiss!914))) (invariant!0 (currentBit!12588 (BitStream!11525 (array!14428 (store (arr!7288 (buf!6823 thiss!914)) (currentByte!12593 thiss!914) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!7288 (buf!6823 thiss!914)) (currentByte!12593 thiss!914))) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12588 thiss!914))))))) (size!6301 (buf!6823 thiss!914))) (currentByte!12593 thiss!914) (currentBit!12588 thiss!914))) (currentByte!12593 (BitStream!11525 (array!14428 (store (arr!7288 (buf!6823 thiss!914)) (currentByte!12593 thiss!914) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!7288 (buf!6823 thiss!914)) (currentByte!12593 thiss!914))) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12588 thiss!914))))))) (size!6301 (buf!6823 thiss!914))) (currentByte!12593 thiss!914) (currentBit!12588 thiss!914))) (size!6301 (buf!6823 (BitStream!11525 (array!14428 (store (arr!7288 (buf!6823 thiss!914)) (currentByte!12593 thiss!914) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!7288 (buf!6823 thiss!914)) (currentByte!12593 thiss!914))) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12588 thiss!914))))))) (size!6301 (buf!6823 thiss!914))) (currentByte!12593 thiss!914) (currentBit!12588 thiss!914))))))))

(declare-fun bs!22286 () Bool)

(assert (= bs!22286 d!87964))

(declare-fun m!391037 () Bool)

(assert (=> bs!22286 m!391037))

(assert (=> b!261295 d!87964))

(push 1)

(assert (not d!87954))

(assert (not d!87964))

(assert (not d!87950))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

