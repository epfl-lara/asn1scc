; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56868 () Bool)

(assert start!56868)

(declare-fun res!218813 () Bool)

(declare-fun e!181868 () Bool)

(assert (=> start!56868 (=> (not res!218813) (not e!181868))))

(declare-datatypes ((array!14477 0))(
  ( (array!14478 (arr!7307 (Array (_ BitVec 32) (_ BitVec 8))) (size!6320 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11562 0))(
  ( (BitStream!11563 (buf!6842 array!14477) (currentByte!12640 (_ BitVec 32)) (currentBit!12635 (_ BitVec 32))) )
))
(declare-fun thiss!914 () BitStream!11562)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!56868 (= res!218813 (validate_offset_bit!0 ((_ sign_extend 32) (size!6320 (buf!6842 thiss!914))) ((_ sign_extend 32) (currentByte!12640 thiss!914)) ((_ sign_extend 32) (currentBit!12635 thiss!914))))))

(assert (=> start!56868 e!181868))

(declare-fun e!181870 () Bool)

(declare-fun inv!12 (BitStream!11562) Bool)

(assert (=> start!56868 (and (inv!12 thiss!914) e!181870)))

(assert (=> start!56868 true))

(declare-fun b!261415 () Bool)

(declare-datatypes ((Unit!18613 0))(
  ( (Unit!18614) )
))
(declare-datatypes ((tuple2!22366 0))(
  ( (tuple2!22367 (_1!12119 Unit!18613) (_2!12119 BitStream!11562)) )
))
(declare-fun lt!403340 () tuple2!22366)

(assert (=> b!261415 (= e!181868 (or (bvslt (currentByte!12640 (_2!12119 lt!403340)) #b00000000000000000000000000000000) (bvsge (currentByte!12640 (_2!12119 lt!403340)) (size!6320 (buf!6842 (_2!12119 lt!403340))))))))

(declare-fun b!187 () Bool)

(declare-fun Unit!18615 () Unit!18613)

(declare-fun Unit!18616 () Unit!18613)

(assert (=> b!261415 (= lt!403340 (ite b!187 (tuple2!22367 Unit!18615 (BitStream!11563 (array!14478 (store (arr!7307 (buf!6842 thiss!914)) (currentByte!12640 thiss!914) ((_ extract 7 0) (bvor ((_ sign_extend 24) (select (arr!7307 (buf!6842 thiss!914)) (currentByte!12640 thiss!914))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12635 thiss!914)))))) (size!6320 (buf!6842 thiss!914))) (currentByte!12640 thiss!914) (currentBit!12635 thiss!914))) (tuple2!22367 Unit!18616 (BitStream!11563 (array!14478 (store (arr!7307 (buf!6842 thiss!914)) (currentByte!12640 thiss!914) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!7307 (buf!6842 thiss!914)) (currentByte!12640 thiss!914))) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12635 thiss!914))))))) (size!6320 (buf!6842 thiss!914))) (currentByte!12640 thiss!914) (currentBit!12635 thiss!914)))))))

(declare-fun b!261416 () Bool)

(declare-fun array_inv!6061 (array!14477) Bool)

(assert (=> b!261416 (= e!181870 (array_inv!6061 (buf!6842 thiss!914)))))

(assert (= (and start!56868 res!218813) b!261415))

(assert (= start!56868 b!261416))

(declare-fun m!391203 () Bool)

(assert (=> start!56868 m!391203))

(declare-fun m!391205 () Bool)

(assert (=> start!56868 m!391205))

(declare-fun m!391207 () Bool)

(assert (=> b!261415 m!391207))

(declare-fun m!391209 () Bool)

(assert (=> b!261415 m!391209))

(declare-fun m!391211 () Bool)

(assert (=> b!261415 m!391211))

(declare-fun m!391213 () Bool)

(assert (=> b!261415 m!391213))

(declare-fun m!391215 () Bool)

(assert (=> b!261416 m!391215))

(check-sat (not start!56868) (not b!261416))
(check-sat)
(get-model)

(declare-fun d!88064 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!88064 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6320 (buf!6842 thiss!914))) ((_ sign_extend 32) (currentByte!12640 thiss!914)) ((_ sign_extend 32) (currentBit!12635 thiss!914))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6320 (buf!6842 thiss!914))) ((_ sign_extend 32) (currentByte!12640 thiss!914)) ((_ sign_extend 32) (currentBit!12635 thiss!914))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!22323 () Bool)

(assert (= bs!22323 d!88064))

(declare-fun m!391231 () Bool)

(assert (=> bs!22323 m!391231))

(assert (=> start!56868 d!88064))

(declare-fun d!88066 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!88066 (= (inv!12 thiss!914) (invariant!0 (currentBit!12635 thiss!914) (currentByte!12640 thiss!914) (size!6320 (buf!6842 thiss!914))))))

(declare-fun bs!22324 () Bool)

(assert (= bs!22324 d!88066))

(declare-fun m!391233 () Bool)

(assert (=> bs!22324 m!391233))

(assert (=> start!56868 d!88066))

(declare-fun d!88070 () Bool)

(assert (=> d!88070 (= (array_inv!6061 (buf!6842 thiss!914)) (bvsge (size!6320 (buf!6842 thiss!914)) #b00000000000000000000000000000000))))

(assert (=> b!261416 d!88070))

(check-sat (not d!88066) (not d!88064))
(check-sat)
(get-model)

(declare-fun d!88082 () Bool)

(assert (=> d!88082 (= (invariant!0 (currentBit!12635 thiss!914) (currentByte!12640 thiss!914) (size!6320 (buf!6842 thiss!914))) (and (bvsge (currentBit!12635 thiss!914) #b00000000000000000000000000000000) (bvslt (currentBit!12635 thiss!914) #b00000000000000000000000000001000) (bvsge (currentByte!12640 thiss!914) #b00000000000000000000000000000000) (or (bvslt (currentByte!12640 thiss!914) (size!6320 (buf!6842 thiss!914))) (and (= (currentBit!12635 thiss!914) #b00000000000000000000000000000000) (= (currentByte!12640 thiss!914) (size!6320 (buf!6842 thiss!914)))))))))

(assert (=> d!88066 d!88082))

(declare-fun d!88084 () Bool)

(assert (=> d!88084 (= (remainingBits!0 ((_ sign_extend 32) (size!6320 (buf!6842 thiss!914))) ((_ sign_extend 32) (currentByte!12640 thiss!914)) ((_ sign_extend 32) (currentBit!12635 thiss!914))) (bvsub (bvmul ((_ sign_extend 32) (size!6320 (buf!6842 thiss!914))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12640 thiss!914)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12635 thiss!914)))))))

(assert (=> d!88064 d!88084))

(check-sat)
