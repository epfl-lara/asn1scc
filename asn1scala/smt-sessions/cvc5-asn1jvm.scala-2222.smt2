; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56356 () Bool)

(assert start!56356)

(declare-fun res!218206 () Bool)

(declare-fun e!181151 () Bool)

(assert (=> start!56356 (=> (not res!218206) (not e!181151))))

(declare-datatypes ((array!14343 0))(
  ( (array!14344 (arr!7258 (Array (_ BitVec 32) (_ BitVec 8))) (size!6271 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11464 0))(
  ( (BitStream!11465 (buf!6793 array!14343) (currentByte!12504 (_ BitVec 32)) (currentBit!12499 (_ BitVec 32))) )
))
(declare-fun thiss!914 () BitStream!11464)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!56356 (= res!218206 (validate_offset_bit!0 ((_ sign_extend 32) (size!6271 (buf!6793 thiss!914))) ((_ sign_extend 32) (currentByte!12504 thiss!914)) ((_ sign_extend 32) (currentBit!12499 thiss!914))))))

(assert (=> start!56356 e!181151))

(declare-fun e!181152 () Bool)

(declare-fun inv!12 (BitStream!11464) Bool)

(assert (=> start!56356 (and (inv!12 thiss!914) e!181152)))

(assert (=> start!56356 true))

(declare-fun b!260664 () Bool)

(declare-fun e!181153 () Bool)

(assert (=> b!260664 (= e!181151 (not e!181153))))

(declare-fun res!218207 () Bool)

(assert (=> b!260664 (=> res!218207 e!181153)))

(declare-datatypes ((Unit!18537 0))(
  ( (Unit!18538) )
))
(declare-datatypes ((tuple2!22340 0))(
  ( (tuple2!22341 (_1!12106 Unit!18537) (_2!12106 BitStream!11464)) )
))
(declare-fun lt!402800 () tuple2!22340)

(declare-fun increaseBitIndex!0 (BitStream!11464) tuple2!22340)

(assert (=> b!260664 (= res!218207 (not (= (size!6271 (buf!6793 thiss!914)) (size!6271 (buf!6793 (_2!12106 (increaseBitIndex!0 (_2!12106 lt!402800))))))))))

(declare-fun arrayRangesEq!938 (array!14343 array!14343 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!260664 (arrayRangesEq!938 (buf!6793 thiss!914) (array!14344 (store (arr!7258 (buf!6793 thiss!914)) (currentByte!12504 (_2!12106 lt!402800)) (select (arr!7258 (buf!6793 (_2!12106 lt!402800))) (currentByte!12504 (_2!12106 lt!402800)))) (size!6271 (buf!6793 thiss!914))) #b00000000000000000000000000000000 (currentByte!12504 (_2!12106 lt!402800)))))

(declare-fun lt!402799 () Unit!18537)

(declare-fun arrayUpdatedAtPrefixLemma!454 (array!14343 (_ BitVec 32) (_ BitVec 8)) Unit!18537)

(assert (=> b!260664 (= lt!402799 (arrayUpdatedAtPrefixLemma!454 (buf!6793 thiss!914) (currentByte!12504 (_2!12106 lt!402800)) (select (arr!7258 (buf!6793 (_2!12106 lt!402800))) (currentByte!12504 (_2!12106 lt!402800)))))))

(declare-fun b!187 () Bool)

(declare-fun Unit!18539 () Unit!18537)

(declare-fun Unit!18540 () Unit!18537)

(assert (=> b!260664 (= lt!402800 (ite b!187 (tuple2!22341 Unit!18539 (BitStream!11465 (array!14344 (store (arr!7258 (buf!6793 thiss!914)) (currentByte!12504 thiss!914) ((_ extract 7 0) (bvor ((_ sign_extend 24) (select (arr!7258 (buf!6793 thiss!914)) (currentByte!12504 thiss!914))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12499 thiss!914)))))) (size!6271 (buf!6793 thiss!914))) (currentByte!12504 thiss!914) (currentBit!12499 thiss!914))) (tuple2!22341 Unit!18540 (BitStream!11465 (array!14344 (store (arr!7258 (buf!6793 thiss!914)) (currentByte!12504 thiss!914) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!7258 (buf!6793 thiss!914)) (currentByte!12504 thiss!914))) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12499 thiss!914))))))) (size!6271 (buf!6793 thiss!914))) (currentByte!12504 thiss!914) (currentBit!12499 thiss!914)))))))

(declare-fun b!260665 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!260665 (= e!181153 (invariant!0 (currentBit!12499 thiss!914) (currentByte!12504 thiss!914) (size!6271 (buf!6793 thiss!914))))))

(declare-fun b!260666 () Bool)

(declare-fun array_inv!6012 (array!14343) Bool)

(assert (=> b!260666 (= e!181152 (array_inv!6012 (buf!6793 thiss!914)))))

(assert (= (and start!56356 res!218206) b!260664))

(assert (= (and b!260664 (not res!218207)) b!260665))

(assert (= start!56356 b!260666))

(declare-fun m!390109 () Bool)

(assert (=> start!56356 m!390109))

(declare-fun m!390111 () Bool)

(assert (=> start!56356 m!390111))

(declare-fun m!390113 () Bool)

(assert (=> b!260664 m!390113))

(declare-fun m!390115 () Bool)

(assert (=> b!260664 m!390115))

(declare-fun m!390117 () Bool)

(assert (=> b!260664 m!390117))

(declare-fun m!390119 () Bool)

(assert (=> b!260664 m!390119))

(declare-fun m!390121 () Bool)

(assert (=> b!260664 m!390121))

(assert (=> b!260664 m!390113))

(declare-fun m!390123 () Bool)

(assert (=> b!260664 m!390123))

(declare-fun m!390125 () Bool)

(assert (=> b!260664 m!390125))

(declare-fun m!390127 () Bool)

(assert (=> b!260664 m!390127))

(declare-fun m!390129 () Bool)

(assert (=> b!260664 m!390129))

(declare-fun m!390131 () Bool)

(assert (=> b!260665 m!390131))

(declare-fun m!390133 () Bool)

(assert (=> b!260666 m!390133))

(push 1)

(assert (not start!56356))

(assert (not b!260664))

(assert (not b!260665))

(assert (not b!260666))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!87580 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!87580 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6271 (buf!6793 thiss!914))) ((_ sign_extend 32) (currentByte!12504 thiss!914)) ((_ sign_extend 32) (currentBit!12499 thiss!914))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6271 (buf!6793 thiss!914))) ((_ sign_extend 32) (currentByte!12504 thiss!914)) ((_ sign_extend 32) (currentBit!12499 thiss!914))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!22197 () Bool)

(assert (= bs!22197 d!87580))

(declare-fun m!390187 () Bool)

(assert (=> bs!22197 m!390187))

(assert (=> start!56356 d!87580))

(declare-fun d!87582 () Bool)

(assert (=> d!87582 (= (inv!12 thiss!914) (invariant!0 (currentBit!12499 thiss!914) (currentByte!12504 thiss!914) (size!6271 (buf!6793 thiss!914))))))

(declare-fun bs!22198 () Bool)

(assert (= bs!22198 d!87582))

(assert (=> bs!22198 m!390131))

(assert (=> start!56356 d!87582))

(declare-fun d!87584 () Bool)

(declare-fun e!181180 () Bool)

(assert (=> d!87584 e!181180))

(declare-fun res!218225 () Bool)

(assert (=> d!87584 (=> (not res!218225) (not e!181180))))

(declare-fun lt!402823 () (_ BitVec 64))

(declare-fun lt!402826 () tuple2!22340)

(declare-fun lt!402825 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> d!87584 (= res!218225 (= (bvadd lt!402825 lt!402823) (bitIndex!0 (size!6271 (buf!6793 (_2!12106 lt!402826))) (currentByte!12504 (_2!12106 lt!402826)) (currentBit!12499 (_2!12106 lt!402826)))))))

(assert (=> d!87584 (or (not (= (bvand lt!402825 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!402823 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!402825 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!402825 lt!402823) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!87584 (= lt!402823 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!87584 (= lt!402825 (bitIndex!0 (size!6271 (buf!6793 (_2!12106 lt!402800))) (currentByte!12504 (_2!12106 lt!402800)) (currentBit!12499 (_2!12106 lt!402800))))))

(declare-fun Unit!18549 () Unit!18537)

(declare-fun Unit!18550 () Unit!18537)

(assert (=> d!87584 (= lt!402826 (ite (bvslt (currentBit!12499 (_2!12106 lt!402800)) #b00000000000000000000000000000111) (tuple2!22341 Unit!18549 (BitStream!11465 (buf!6793 (_2!12106 lt!402800)) (currentByte!12504 (_2!12106 lt!402800)) (bvadd (currentBit!12499 (_2!12106 lt!402800)) #b00000000000000000000000000000001))) (tuple2!22341 Unit!18550 (BitStream!11465 (buf!6793 (_2!12106 lt!402800)) (bvadd (currentByte!12504 (_2!12106 lt!402800)) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (=> d!87584 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!6271 (buf!6793 (_2!12106 lt!402800)))) ((_ sign_extend 32) (currentByte!12504 (_2!12106 lt!402800))) ((_ sign_extend 32) (currentBit!12499 (_2!12106 lt!402800)))) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!87584 (= (increaseBitIndex!0 (_2!12106 lt!402800)) lt!402826)))

(declare-fun b!260689 () Bool)

(declare-fun res!218224 () Bool)

(assert (=> b!260689 (=> (not res!218224) (not e!181180))))

(declare-fun lt!402827 () (_ BitVec 64))

(declare-fun lt!402824 () (_ BitVec 64))

(assert (=> b!260689 (= res!218224 (= (bvsub lt!402827 lt!402824) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!260689 (or (= (bvand lt!402827 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!402824 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!402827 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!402827 lt!402824) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!260689 (= lt!402824 (remainingBits!0 ((_ sign_extend 32) (size!6271 (buf!6793 (_2!12106 lt!402826)))) ((_ sign_extend 32) (currentByte!12504 (_2!12106 lt!402826))) ((_ sign_extend 32) (currentBit!12499 (_2!12106 lt!402826)))))))

(assert (=> b!260689 (= lt!402827 (remainingBits!0 ((_ sign_extend 32) (size!6271 (buf!6793 (_2!12106 lt!402800)))) ((_ sign_extend 32) (currentByte!12504 (_2!12106 lt!402800))) ((_ sign_extend 32) (currentBit!12499 (_2!12106 lt!402800)))))))

(declare-fun b!260690 () Bool)

(assert (=> b!260690 (= e!181180 (= (size!6271 (buf!6793 (_2!12106 lt!402800))) (size!6271 (buf!6793 (_2!12106 lt!402826)))))))

(assert (= (and d!87584 res!218225) b!260689))

(assert (= (and b!260689 res!218224) b!260690))

(declare-fun m!390191 () Bool)

(assert (=> d!87584 m!390191))

(declare-fun m!390193 () Bool)

(assert (=> d!87584 m!390193))

(declare-fun m!390195 () Bool)

(assert (=> d!87584 m!390195))

(declare-fun m!390197 () Bool)

(assert (=> b!260689 m!390197))

(assert (=> b!260689 m!390195))

(assert (=> b!260664 d!87584))

(declare-fun d!87594 () Bool)

(declare-fun res!218230 () Bool)

(declare-fun e!181185 () Bool)

(assert (=> d!87594 (=> res!218230 e!181185)))

(assert (=> d!87594 (= res!218230 (= #b00000000000000000000000000000000 (currentByte!12504 (_2!12106 lt!402800))))))

(assert (=> d!87594 (= (arrayRangesEq!938 (buf!6793 thiss!914) (array!14344 (store (arr!7258 (buf!6793 thiss!914)) (currentByte!12504 (_2!12106 lt!402800)) (select (arr!7258 (buf!6793 (_2!12106 lt!402800))) (currentByte!12504 (_2!12106 lt!402800)))) (size!6271 (buf!6793 thiss!914))) #b00000000000000000000000000000000 (currentByte!12504 (_2!12106 lt!402800))) e!181185)))

(declare-fun b!260695 () Bool)

(declare-fun e!181186 () Bool)

(assert (=> b!260695 (= e!181185 e!181186)))

(declare-fun res!218231 () Bool)

(assert (=> b!260695 (=> (not res!218231) (not e!181186))))

(assert (=> b!260695 (= res!218231 (= (select (arr!7258 (buf!6793 thiss!914)) #b00000000000000000000000000000000) (select (arr!7258 (array!14344 (store (arr!7258 (buf!6793 thiss!914)) (currentByte!12504 (_2!12106 lt!402800)) (select (arr!7258 (buf!6793 (_2!12106 lt!402800))) (currentByte!12504 (_2!12106 lt!402800)))) (size!6271 (buf!6793 thiss!914)))) #b00000000000000000000000000000000)))))

(declare-fun b!260696 () Bool)

(assert (=> b!260696 (= e!181186 (arrayRangesEq!938 (buf!6793 thiss!914) (array!14344 (store (arr!7258 (buf!6793 thiss!914)) (currentByte!12504 (_2!12106 lt!402800)) (select (arr!7258 (buf!6793 (_2!12106 lt!402800))) (currentByte!12504 (_2!12106 lt!402800)))) (size!6271 (buf!6793 thiss!914))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12504 (_2!12106 lt!402800))))))

(assert (= (and d!87594 (not res!218230)) b!260695))

(assert (= (and b!260695 res!218231) b!260696))

(declare-fun m!390199 () Bool)

(assert (=> b!260695 m!390199))

(declare-fun m!390201 () Bool)

(assert (=> b!260695 m!390201))

(declare-fun m!390203 () Bool)

(assert (=> b!260696 m!390203))

(assert (=> b!260664 d!87594))

(declare-fun d!87596 () Bool)

(declare-fun e!181195 () Bool)

(assert (=> d!87596 e!181195))

(declare-fun res!218246 () Bool)

(assert (=> d!87596 (=> (not res!218246) (not e!181195))))

(assert (=> d!87596 (= res!218246 (and (bvsge (currentByte!12504 (_2!12106 lt!402800)) #b00000000000000000000000000000000) (bvslt (currentByte!12504 (_2!12106 lt!402800)) (size!6271 (buf!6793 thiss!914)))))))

(declare-fun lt!402860 () Unit!18537)

(declare-fun choose!348 (array!14343 (_ BitVec 32) (_ BitVec 8)) Unit!18537)

(assert (=> d!87596 (= lt!402860 (choose!348 (buf!6793 thiss!914) (currentByte!12504 (_2!12106 lt!402800)) (select (arr!7258 (buf!6793 (_2!12106 lt!402800))) (currentByte!12504 (_2!12106 lt!402800)))))))

(assert (=> d!87596 (and (bvsle #b00000000000000000000000000000000 (currentByte!12504 (_2!12106 lt!402800))) (bvslt (currentByte!12504 (_2!12106 lt!402800)) (size!6271 (buf!6793 thiss!914))))))

(assert (=> d!87596 (= (arrayUpdatedAtPrefixLemma!454 (buf!6793 thiss!914) (currentByte!12504 (_2!12106 lt!402800)) (select (arr!7258 (buf!6793 (_2!12106 lt!402800))) (currentByte!12504 (_2!12106 lt!402800)))) lt!402860)))

(declare-fun b!260711 () Bool)

(assert (=> b!260711 (= e!181195 (arrayRangesEq!938 (buf!6793 thiss!914) (array!14344 (store (arr!7258 (buf!6793 thiss!914)) (currentByte!12504 (_2!12106 lt!402800)) (select (arr!7258 (buf!6793 (_2!12106 lt!402800))) (currentByte!12504 (_2!12106 lt!402800)))) (size!6271 (buf!6793 thiss!914))) #b00000000000000000000000000000000 (currentByte!12504 (_2!12106 lt!402800))))))

(assert (= (and d!87596 res!218246) b!260711))

(assert (=> d!87596 m!390113))

(declare-fun m!390219 () Bool)

(assert (=> d!87596 m!390219))

(assert (=> b!260711 m!390121))

(assert (=> b!260711 m!390129))

(assert (=> b!260664 d!87596))

(declare-fun d!87602 () Bool)

(assert (=> d!87602 (= (invariant!0 (currentBit!12499 thiss!914) (currentByte!12504 thiss!914) (size!6271 (buf!6793 thiss!914))) (and (bvsge (currentBit!12499 thiss!914) #b00000000000000000000000000000000) (bvslt (currentBit!12499 thiss!914) #b00000000000000000000000000001000) (bvsge (currentByte!12504 thiss!914) #b00000000000000000000000000000000) (or (bvslt (currentByte!12504 thiss!914) (size!6271 (buf!6793 thiss!914))) (and (= (currentBit!12499 thiss!914) #b00000000000000000000000000000000) (= (currentByte!12504 thiss!914) (size!6271 (buf!6793 thiss!914)))))))))

(assert (=> b!260665 d!87602))

(declare-fun d!87604 () Bool)

(assert (=> d!87604 (= (array_inv!6012 (buf!6793 thiss!914)) (bvsge (size!6271 (buf!6793 thiss!914)) #b00000000000000000000000000000000))))

(assert (=> b!260666 d!87604))

(push 1)

(assert (not d!87582))

(assert (not b!260711))

(assert (not d!87596))

(assert (not d!87580))

(assert (not d!87584))

(assert (not b!260689))

(assert (not b!260696))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

