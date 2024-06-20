; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56904 () Bool)

(assert start!56904)

(declare-fun res!218822 () Bool)

(declare-fun e!181895 () Bool)

(assert (=> start!56904 (=> (not res!218822) (not e!181895))))

(declare-datatypes ((array!14486 0))(
  ( (array!14487 (arr!7310 (Array (_ BitVec 32) (_ BitVec 8))) (size!6323 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11568 0))(
  ( (BitStream!11569 (buf!6845 array!14486) (currentByte!12652 (_ BitVec 32)) (currentBit!12647 (_ BitVec 32))) )
))
(declare-fun thiss!914 () BitStream!11568)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!56904 (= res!218822 (validate_offset_bit!0 ((_ sign_extend 32) (size!6323 (buf!6845 thiss!914))) ((_ sign_extend 32) (currentByte!12652 thiss!914)) ((_ sign_extend 32) (currentBit!12647 thiss!914))))))

(assert (=> start!56904 e!181895))

(declare-fun e!181896 () Bool)

(declare-fun inv!12 (BitStream!11568) Bool)

(assert (=> start!56904 (and (inv!12 thiss!914) e!181896)))

(assert (=> start!56904 true))

(declare-fun b!261433 () Bool)

(declare-datatypes ((Unit!18625 0))(
  ( (Unit!18626) )
))
(declare-datatypes ((tuple2!22372 0))(
  ( (tuple2!22373 (_1!12122 Unit!18625) (_2!12122 BitStream!11568)) )
))
(declare-fun lt!403349 () tuple2!22372)

(assert (=> b!261433 (= e!181895 (or (bvsgt #b00000000000000000000000000000000 (currentByte!12652 (_2!12122 lt!403349))) (bvsge (currentByte!12652 (_2!12122 lt!403349)) (size!6323 (buf!6845 thiss!914)))))))

(declare-fun b!187 () Bool)

(declare-fun Unit!18627 () Unit!18625)

(declare-fun Unit!18628 () Unit!18625)

(assert (=> b!261433 (= lt!403349 (ite b!187 (tuple2!22373 Unit!18627 (BitStream!11569 (array!14487 (store (arr!7310 (buf!6845 thiss!914)) (currentByte!12652 thiss!914) ((_ extract 7 0) (bvor ((_ sign_extend 24) (select (arr!7310 (buf!6845 thiss!914)) (currentByte!12652 thiss!914))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12647 thiss!914)))))) (size!6323 (buf!6845 thiss!914))) (currentByte!12652 thiss!914) (currentBit!12647 thiss!914))) (tuple2!22373 Unit!18628 (BitStream!11569 (array!14487 (store (arr!7310 (buf!6845 thiss!914)) (currentByte!12652 thiss!914) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!7310 (buf!6845 thiss!914)) (currentByte!12652 thiss!914))) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12647 thiss!914))))))) (size!6323 (buf!6845 thiss!914))) (currentByte!12652 thiss!914) (currentBit!12647 thiss!914)))))))

(declare-fun b!261434 () Bool)

(declare-fun array_inv!6064 (array!14486) Bool)

(assert (=> b!261434 (= e!181896 (array_inv!6064 (buf!6845 thiss!914)))))

(assert (= (and start!56904 res!218822) b!261433))

(assert (= start!56904 b!261434))

(declare-fun m!391257 () Bool)

(assert (=> start!56904 m!391257))

(declare-fun m!391259 () Bool)

(assert (=> start!56904 m!391259))

(declare-fun m!391261 () Bool)

(assert (=> b!261433 m!391261))

(declare-fun m!391263 () Bool)

(assert (=> b!261433 m!391263))

(declare-fun m!391265 () Bool)

(assert (=> b!261433 m!391265))

(declare-fun m!391267 () Bool)

(assert (=> b!261433 m!391267))

(declare-fun m!391269 () Bool)

(assert (=> b!261434 m!391269))

(check-sat (not start!56904) (not b!261434))
(check-sat)
(get-model)

(declare-fun d!88096 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!88096 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6323 (buf!6845 thiss!914))) ((_ sign_extend 32) (currentByte!12652 thiss!914)) ((_ sign_extend 32) (currentBit!12647 thiss!914))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6323 (buf!6845 thiss!914))) ((_ sign_extend 32) (currentByte!12652 thiss!914)) ((_ sign_extend 32) (currentBit!12647 thiss!914))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!22332 () Bool)

(assert (= bs!22332 d!88096))

(declare-fun m!391287 () Bool)

(assert (=> bs!22332 m!391287))

(assert (=> start!56904 d!88096))

(declare-fun d!88102 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!88102 (= (inv!12 thiss!914) (invariant!0 (currentBit!12647 thiss!914) (currentByte!12652 thiss!914) (size!6323 (buf!6845 thiss!914))))))

(declare-fun bs!22335 () Bool)

(assert (= bs!22335 d!88102))

(declare-fun m!391291 () Bool)

(assert (=> bs!22335 m!391291))

(assert (=> start!56904 d!88102))

(declare-fun d!88106 () Bool)

(assert (=> d!88106 (= (array_inv!6064 (buf!6845 thiss!914)) (bvsge (size!6323 (buf!6845 thiss!914)) #b00000000000000000000000000000000))))

(assert (=> b!261434 d!88106))

(check-sat (not d!88096) (not d!88102))
(check-sat)
(get-model)

(declare-fun d!88114 () Bool)

(assert (=> d!88114 (= (remainingBits!0 ((_ sign_extend 32) (size!6323 (buf!6845 thiss!914))) ((_ sign_extend 32) (currentByte!12652 thiss!914)) ((_ sign_extend 32) (currentBit!12647 thiss!914))) (bvsub (bvmul ((_ sign_extend 32) (size!6323 (buf!6845 thiss!914))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12652 thiss!914)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12647 thiss!914)))))))

(assert (=> d!88096 d!88114))

(declare-fun d!88116 () Bool)

(assert (=> d!88116 (= (invariant!0 (currentBit!12647 thiss!914) (currentByte!12652 thiss!914) (size!6323 (buf!6845 thiss!914))) (and (bvsge (currentBit!12647 thiss!914) #b00000000000000000000000000000000) (bvslt (currentBit!12647 thiss!914) #b00000000000000000000000000001000) (bvsge (currentByte!12652 thiss!914) #b00000000000000000000000000000000) (or (bvslt (currentByte!12652 thiss!914) (size!6323 (buf!6845 thiss!914))) (and (= (currentBit!12647 thiss!914) #b00000000000000000000000000000000) (= (currentByte!12652 thiss!914) (size!6323 (buf!6845 thiss!914)))))))))

(assert (=> d!88102 d!88116))

(check-sat)
