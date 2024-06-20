; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56902 () Bool)

(assert start!56902)

(declare-fun res!218819 () Bool)

(declare-fun e!181888 () Bool)

(assert (=> start!56902 (=> (not res!218819) (not e!181888))))

(declare-datatypes ((array!14484 0))(
  ( (array!14485 (arr!7309 (Array (_ BitVec 32) (_ BitVec 8))) (size!6322 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11566 0))(
  ( (BitStream!11567 (buf!6844 array!14484) (currentByte!12651 (_ BitVec 32)) (currentBit!12646 (_ BitVec 32))) )
))
(declare-fun thiss!914 () BitStream!11566)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!56902 (= res!218819 (validate_offset_bit!0 ((_ sign_extend 32) (size!6322 (buf!6844 thiss!914))) ((_ sign_extend 32) (currentByte!12651 thiss!914)) ((_ sign_extend 32) (currentBit!12646 thiss!914))))))

(assert (=> start!56902 e!181888))

(declare-fun e!181886 () Bool)

(declare-fun inv!12 (BitStream!11566) Bool)

(assert (=> start!56902 (and (inv!12 thiss!914) e!181886)))

(assert (=> start!56902 true))

(declare-fun b!261427 () Bool)

(declare-datatypes ((Unit!18621 0))(
  ( (Unit!18622) )
))
(declare-datatypes ((tuple2!22370 0))(
  ( (tuple2!22371 (_1!12121 Unit!18621) (_2!12121 BitStream!11566)) )
))
(declare-fun lt!403346 () tuple2!22370)

(assert (=> b!261427 (= e!181888 (or (bvsgt #b00000000000000000000000000000000 (currentByte!12651 (_2!12121 lt!403346))) (bvsge (currentByte!12651 (_2!12121 lt!403346)) (size!6322 (buf!6844 thiss!914)))))))

(declare-fun b!187 () Bool)

(declare-fun Unit!18623 () Unit!18621)

(declare-fun Unit!18624 () Unit!18621)

(assert (=> b!261427 (= lt!403346 (ite b!187 (tuple2!22371 Unit!18623 (BitStream!11567 (array!14485 (store (arr!7309 (buf!6844 thiss!914)) (currentByte!12651 thiss!914) ((_ extract 7 0) (bvor ((_ sign_extend 24) (select (arr!7309 (buf!6844 thiss!914)) (currentByte!12651 thiss!914))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12646 thiss!914)))))) (size!6322 (buf!6844 thiss!914))) (currentByte!12651 thiss!914) (currentBit!12646 thiss!914))) (tuple2!22371 Unit!18624 (BitStream!11567 (array!14485 (store (arr!7309 (buf!6844 thiss!914)) (currentByte!12651 thiss!914) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!7309 (buf!6844 thiss!914)) (currentByte!12651 thiss!914))) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12646 thiss!914))))))) (size!6322 (buf!6844 thiss!914))) (currentByte!12651 thiss!914) (currentBit!12646 thiss!914)))))))

(declare-fun b!261428 () Bool)

(declare-fun array_inv!6063 (array!14484) Bool)

(assert (=> b!261428 (= e!181886 (array_inv!6063 (buf!6844 thiss!914)))))

(assert (= (and start!56902 res!218819) b!261427))

(assert (= start!56902 b!261428))

(declare-fun m!391243 () Bool)

(assert (=> start!56902 m!391243))

(declare-fun m!391245 () Bool)

(assert (=> start!56902 m!391245))

(declare-fun m!391247 () Bool)

(assert (=> b!261427 m!391247))

(declare-fun m!391249 () Bool)

(assert (=> b!261427 m!391249))

(declare-fun m!391251 () Bool)

(assert (=> b!261427 m!391251))

(declare-fun m!391253 () Bool)

(assert (=> b!261427 m!391253))

(declare-fun m!391255 () Bool)

(assert (=> b!261428 m!391255))

(push 1)

(assert (not start!56902))

(assert (not b!261428))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!88098 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!88098 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6322 (buf!6844 thiss!914))) ((_ sign_extend 32) (currentByte!12651 thiss!914)) ((_ sign_extend 32) (currentBit!12646 thiss!914))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6322 (buf!6844 thiss!914))) ((_ sign_extend 32) (currentByte!12651 thiss!914)) ((_ sign_extend 32) (currentBit!12646 thiss!914))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!22333 () Bool)

(assert (= bs!22333 d!88098))

(declare-fun m!391286 () Bool)

(assert (=> bs!22333 m!391286))

(assert (=> start!56902 d!88098))

(declare-fun d!88101 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!88101 (= (inv!12 thiss!914) (invariant!0 (currentBit!12646 thiss!914) (currentByte!12651 thiss!914) (size!6322 (buf!6844 thiss!914))))))

(declare-fun bs!22334 () Bool)

(assert (= bs!22334 d!88101))

(declare-fun m!391290 () Bool)

(assert (=> bs!22334 m!391290))

(assert (=> start!56902 d!88101))

(declare-fun d!88105 () Bool)

(assert (=> d!88105 (= (array_inv!6063 (buf!6844 thiss!914)) (bvsge (size!6322 (buf!6844 thiss!914)) #b00000000000000000000000000000000))))

(assert (=> b!261428 d!88105))

(push 1)

(assert (not d!88101))

(assert (not d!88098))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!88118 () Bool)

(assert (=> d!88118 (= (invariant!0 (currentBit!12646 thiss!914) (currentByte!12651 thiss!914) (size!6322 (buf!6844 thiss!914))) (and (bvsge (currentBit!12646 thiss!914) #b00000000000000000000000000000000) (bvslt (currentBit!12646 thiss!914) #b00000000000000000000000000001000) (bvsge (currentByte!12651 thiss!914) #b00000000000000000000000000000000) (or (bvslt (currentByte!12651 thiss!914) (size!6322 (buf!6844 thiss!914))) (and (= (currentBit!12646 thiss!914) #b00000000000000000000000000000000) (= (currentByte!12651 thiss!914) (size!6322 (buf!6844 thiss!914)))))))))

(assert (=> d!88101 d!88118))

(declare-fun d!88120 () Bool)

(assert (=> d!88120 (= (remainingBits!0 ((_ sign_extend 32) (size!6322 (buf!6844 thiss!914))) ((_ sign_extend 32) (currentByte!12651 thiss!914)) ((_ sign_extend 32) (currentBit!12646 thiss!914))) (bvsub (bvmul ((_ sign_extend 32) (size!6322 (buf!6844 thiss!914))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12651 thiss!914)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12646 thiss!914)))))))

(assert (=> d!88098 d!88120))

(push 1)

(check-sat)

(pop 1)

