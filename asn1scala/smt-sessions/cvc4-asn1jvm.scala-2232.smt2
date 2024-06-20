; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56730 () Bool)

(assert start!56730)

(declare-fun res!218762 () Bool)

(declare-fun e!181717 () Bool)

(assert (=> start!56730 (=> (not res!218762) (not e!181717))))

(declare-datatypes ((array!14431 0))(
  ( (array!14432 (arr!7290 (Array (_ BitVec 32) (_ BitVec 8))) (size!6303 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11528 0))(
  ( (BitStream!11529 (buf!6825 array!14431) (currentByte!12595 (_ BitVec 32)) (currentBit!12590 (_ BitVec 32))) )
))
(declare-fun thiss!914 () BitStream!11528)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!56730 (= res!218762 (validate_offset_bit!0 ((_ sign_extend 32) (size!6303 (buf!6825 thiss!914))) ((_ sign_extend 32) (currentByte!12595 thiss!914)) ((_ sign_extend 32) (currentBit!12590 thiss!914))))))

(assert (=> start!56730 e!181717))

(declare-fun e!181716 () Bool)

(declare-fun inv!12 (BitStream!11528) Bool)

(assert (=> start!56730 (and (inv!12 thiss!914) e!181716)))

(assert (=> start!56730 true))

(declare-fun b!261312 () Bool)

(declare-fun res!218761 () Bool)

(assert (=> b!261312 (=> (not res!218761) (not e!181717))))

(declare-fun b!187 () Bool)

(assert (=> b!261312 (= res!218761 (not b!187))))

(declare-fun b!261313 () Bool)

(assert (=> b!261313 (= e!181717 (not (inv!12 (BitStream!11529 (array!14432 (store (arr!7290 (buf!6825 thiss!914)) (currentByte!12595 thiss!914) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!7290 (buf!6825 thiss!914)) (currentByte!12595 thiss!914))) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12590 thiss!914))))))) (size!6303 (buf!6825 thiss!914))) (currentByte!12595 thiss!914) (currentBit!12590 thiss!914)))))))

(declare-fun b!261314 () Bool)

(declare-fun array_inv!6044 (array!14431) Bool)

(assert (=> b!261314 (= e!181716 (array_inv!6044 (buf!6825 thiss!914)))))

(assert (= (and start!56730 res!218762) b!261312))

(assert (= (and b!261312 res!218761) b!261313))

(assert (= start!56730 b!261314))

(declare-fun m!391007 () Bool)

(assert (=> start!56730 m!391007))

(declare-fun m!391009 () Bool)

(assert (=> start!56730 m!391009))

(declare-fun m!391011 () Bool)

(assert (=> b!261313 m!391011))

(declare-fun m!391013 () Bool)

(assert (=> b!261313 m!391013))

(declare-fun m!391015 () Bool)

(assert (=> b!261313 m!391015))

(declare-fun m!391017 () Bool)

(assert (=> b!261313 m!391017))

(declare-fun m!391019 () Bool)

(assert (=> b!261314 m!391019))

(push 1)

(assert (not b!261313))

(assert (not start!56730))

(assert (not b!261314))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!87952 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!87952 (= (inv!12 (BitStream!11529 (array!14432 (store (arr!7290 (buf!6825 thiss!914)) (currentByte!12595 thiss!914) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!7290 (buf!6825 thiss!914)) (currentByte!12595 thiss!914))) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12590 thiss!914))))))) (size!6303 (buf!6825 thiss!914))) (currentByte!12595 thiss!914) (currentBit!12590 thiss!914))) (invariant!0 (currentBit!12590 (BitStream!11529 (array!14432 (store (arr!7290 (buf!6825 thiss!914)) (currentByte!12595 thiss!914) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!7290 (buf!6825 thiss!914)) (currentByte!12595 thiss!914))) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12590 thiss!914))))))) (size!6303 (buf!6825 thiss!914))) (currentByte!12595 thiss!914) (currentBit!12590 thiss!914))) (currentByte!12595 (BitStream!11529 (array!14432 (store (arr!7290 (buf!6825 thiss!914)) (currentByte!12595 thiss!914) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!7290 (buf!6825 thiss!914)) (currentByte!12595 thiss!914))) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12590 thiss!914))))))) (size!6303 (buf!6825 thiss!914))) (currentByte!12595 thiss!914) (currentBit!12590 thiss!914))) (size!6303 (buf!6825 (BitStream!11529 (array!14432 (store (arr!7290 (buf!6825 thiss!914)) (currentByte!12595 thiss!914) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!7290 (buf!6825 thiss!914)) (currentByte!12595 thiss!914))) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12590 thiss!914))))))) (size!6303 (buf!6825 thiss!914))) (currentByte!12595 thiss!914) (currentBit!12590 thiss!914))))))))

(declare-fun bs!22282 () Bool)

(assert (= bs!22282 d!87952))

(declare-fun m!391029 () Bool)

(assert (=> bs!22282 m!391029))

(assert (=> b!261313 d!87952))

(declare-fun d!87956 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!87956 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6303 (buf!6825 thiss!914))) ((_ sign_extend 32) (currentByte!12595 thiss!914)) ((_ sign_extend 32) (currentBit!12590 thiss!914))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6303 (buf!6825 thiss!914))) ((_ sign_extend 32) (currentByte!12595 thiss!914)) ((_ sign_extend 32) (currentBit!12590 thiss!914))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!22284 () Bool)

(assert (= bs!22284 d!87956))

