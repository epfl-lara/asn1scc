; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56942 () Bool)

(assert start!56942)

(declare-fun res!218843 () Bool)

(declare-fun e!181941 () Bool)

(assert (=> start!56942 (=> (not res!218843) (not e!181941))))

(declare-datatypes ((array!14497 0))(
  ( (array!14498 (arr!7314 (Array (_ BitVec 32) (_ BitVec 8))) (size!6327 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11576 0))(
  ( (BitStream!11577 (buf!6849 array!14497) (currentByte!12665 (_ BitVec 32)) (currentBit!12660 (_ BitVec 32))) )
))
(declare-fun thiss!914 () BitStream!11576)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!56942 (= res!218843 (validate_offset_bit!0 ((_ sign_extend 32) (size!6327 (buf!6849 thiss!914))) ((_ sign_extend 32) (currentByte!12665 thiss!914)) ((_ sign_extend 32) (currentBit!12660 thiss!914))))))

(assert (=> start!56942 e!181941))

(declare-fun e!181940 () Bool)

(declare-fun inv!12 (BitStream!11576) Bool)

(assert (=> start!56942 (and (inv!12 thiss!914) e!181940)))

(assert (=> start!56942 true))

(declare-fun b!261465 () Bool)

(declare-fun e!181942 () Bool)

(assert (=> b!261465 (= e!181941 (not e!181942))))

(declare-fun res!218842 () Bool)

(assert (=> b!261465 (=> res!218842 e!181942)))

(declare-datatypes ((Unit!18641 0))(
  ( (Unit!18642) )
))
(declare-datatypes ((tuple2!22380 0))(
  ( (tuple2!22381 (_1!12126 Unit!18641) (_2!12126 BitStream!11576)) )
))
(declare-fun lt!403385 () tuple2!22380)

(declare-fun increaseBitIndex!0 (BitStream!11576) tuple2!22380)

(assert (=> b!261465 (= res!218842 (not (= (size!6327 (buf!6849 thiss!914)) (size!6327 (buf!6849 (_2!12126 (increaseBitIndex!0 (_2!12126 lt!403385))))))))))

(declare-fun arrayRangesEq!952 (array!14497 array!14497 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!261465 (arrayRangesEq!952 (buf!6849 thiss!914) (array!14498 (store (arr!7314 (buf!6849 thiss!914)) (currentByte!12665 (_2!12126 lt!403385)) (select (arr!7314 (buf!6849 (_2!12126 lt!403385))) (currentByte!12665 (_2!12126 lt!403385)))) (size!6327 (buf!6849 thiss!914))) #b00000000000000000000000000000000 (currentByte!12665 (_2!12126 lt!403385)))))

(declare-fun lt!403388 () Unit!18641)

(declare-fun arrayUpdatedAtPrefixLemma!468 (array!14497 (_ BitVec 32) (_ BitVec 8)) Unit!18641)

(assert (=> b!261465 (= lt!403388 (arrayUpdatedAtPrefixLemma!468 (buf!6849 thiss!914) (currentByte!12665 (_2!12126 lt!403385)) (select (arr!7314 (buf!6849 (_2!12126 lt!403385))) (currentByte!12665 (_2!12126 lt!403385)))))))

(declare-fun b!187 () Bool)

(declare-fun Unit!18643 () Unit!18641)

(declare-fun Unit!18644 () Unit!18641)

(assert (=> b!261465 (= lt!403385 (ite b!187 (tuple2!22381 Unit!18643 (BitStream!11577 (array!14498 (store (arr!7314 (buf!6849 thiss!914)) (currentByte!12665 thiss!914) ((_ extract 7 0) (bvor ((_ sign_extend 24) (select (arr!7314 (buf!6849 thiss!914)) (currentByte!12665 thiss!914))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12660 thiss!914)))))) (size!6327 (buf!6849 thiss!914))) (currentByte!12665 thiss!914) (currentBit!12660 thiss!914))) (tuple2!22381 Unit!18644 (BitStream!11577 (array!14498 (store (arr!7314 (buf!6849 thiss!914)) (currentByte!12665 thiss!914) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!7314 (buf!6849 thiss!914)) (currentByte!12665 thiss!914))) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12660 thiss!914))))))) (size!6327 (buf!6849 thiss!914))) (currentByte!12665 thiss!914) (currentBit!12660 thiss!914)))))))

(declare-fun b!261466 () Bool)

(declare-fun lt!403387 () (_ BitVec 64))

(declare-fun lt!403386 () (_ BitVec 64))

(assert (=> b!261466 (= e!181942 (or (not (= lt!403387 #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!403387 (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!403386) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!261466 (= lt!403387 (bvand lt!403386 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!261466 (= lt!403386 (bitIndex!0 (size!6327 (buf!6849 thiss!914)) (currentByte!12665 thiss!914) (currentBit!12660 thiss!914)))))

(declare-fun b!261467 () Bool)

(declare-fun array_inv!6068 (array!14497) Bool)

(assert (=> b!261467 (= e!181940 (array_inv!6068 (buf!6849 thiss!914)))))

(assert (= (and start!56942 res!218843) b!261465))

(assert (= (and b!261465 (not res!218842)) b!261466))

(assert (= start!56942 b!261467))

(declare-fun m!391349 () Bool)

(assert (=> start!56942 m!391349))

(declare-fun m!391351 () Bool)

(assert (=> start!56942 m!391351))

(declare-fun m!391353 () Bool)

(assert (=> b!261465 m!391353))

(declare-fun m!391355 () Bool)

(assert (=> b!261465 m!391355))

(assert (=> b!261465 m!391353))

(declare-fun m!391357 () Bool)

(assert (=> b!261465 m!391357))

(declare-fun m!391359 () Bool)

(assert (=> b!261465 m!391359))

(declare-fun m!391361 () Bool)

(assert (=> b!261465 m!391361))

(declare-fun m!391363 () Bool)

(assert (=> b!261465 m!391363))

(declare-fun m!391365 () Bool)

(assert (=> b!261465 m!391365))

(declare-fun m!391367 () Bool)

(assert (=> b!261465 m!391367))

(declare-fun m!391369 () Bool)

(assert (=> b!261465 m!391369))

(declare-fun m!391371 () Bool)

(assert (=> b!261466 m!391371))

(declare-fun m!391373 () Bool)

(assert (=> b!261467 m!391373))

(push 1)

(assert (not start!56942))

(assert (not b!261465))

(assert (not b!261466))

(assert (not b!261467))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!88130 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!88130 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6327 (buf!6849 thiss!914))) ((_ sign_extend 32) (currentByte!12665 thiss!914)) ((_ sign_extend 32) (currentBit!12660 thiss!914))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6327 (buf!6849 thiss!914))) ((_ sign_extend 32) (currentByte!12665 thiss!914)) ((_ sign_extend 32) (currentBit!12660 thiss!914))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!22341 () Bool)

(assert (= bs!22341 d!88130))

(declare-fun m!391375 () Bool)

(assert (=> bs!22341 m!391375))

(assert (=> start!56942 d!88130))

(declare-fun d!88134 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!88134 (= (inv!12 thiss!914) (invariant!0 (currentBit!12660 thiss!914) (currentByte!12665 thiss!914) (size!6327 (buf!6849 thiss!914))))))

(declare-fun bs!22342 () Bool)

(assert (= bs!22342 d!88134))

(declare-fun m!391377 () Bool)

(assert (=> bs!22342 m!391377))

(assert (=> start!56942 d!88134))

(declare-fun d!88136 () Bool)

(declare-fun e!181960 () Bool)

(assert (=> d!88136 e!181960))

(declare-fun res!218869 () Bool)

(assert (=> d!88136 (=> (not res!218869) (not e!181960))))

(declare-fun lt!403435 () tuple2!22380)

(declare-fun lt!403439 () (_ BitVec 64))

(declare-fun lt!403438 () (_ BitVec 64))

(assert (=> d!88136 (= res!218869 (= (bvadd lt!403438 lt!403439) (bitIndex!0 (size!6327 (buf!6849 (_2!12126 lt!403435))) (currentByte!12665 (_2!12126 lt!403435)) (currentBit!12660 (_2!12126 lt!403435)))))))

(assert (=> d!88136 (or (not (= (bvand lt!403438 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!403439 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!403438 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!403438 lt!403439) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!88136 (= lt!403439 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!88136 (= lt!403438 (bitIndex!0 (size!6327 (buf!6849 (_2!12126 lt!403385))) (currentByte!12665 (_2!12126 lt!403385)) (currentBit!12660 (_2!12126 lt!403385))))))

(declare-fun Unit!18647 () Unit!18641)

(declare-fun Unit!18648 () Unit!18641)

(assert (=> d!88136 (= lt!403435 (ite (bvslt (currentBit!12660 (_2!12126 lt!403385)) #b00000000000000000000000000000111) (tuple2!22381 Unit!18647 (BitStream!11577 (buf!6849 (_2!12126 lt!403385)) (currentByte!12665 (_2!12126 lt!403385)) (bvadd (currentBit!12660 (_2!12126 lt!403385)) #b00000000000000000000000000000001))) (tuple2!22381 Unit!18648 (BitStream!11577 (buf!6849 (_2!12126 lt!403385)) (bvadd (currentByte!12665 (_2!12126 lt!403385)) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (=> d!88136 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!6327 (buf!6849 (_2!12126 lt!403385)))) ((_ sign_extend 32) (currentByte!12665 (_2!12126 lt!403385))) ((_ sign_extend 32) (currentBit!12660 (_2!12126 lt!403385)))) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!88136 (= (increaseBitIndex!0 (_2!12126 lt!403385)) lt!403435)))

(declare-fun b!261493 () Bool)

(declare-fun res!218870 () Bool)

(assert (=> b!261493 (=> (not res!218870) (not e!181960))))

(declare-fun lt!403436 () (_ BitVec 64))

(declare-fun lt!403437 () (_ BitVec 64))

(assert (=> b!261493 (= res!218870 (= (bvsub lt!403436 lt!403437) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!261493 (or (= (bvand lt!403436 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!403437 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!403436 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!403436 lt!403437) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!261493 (= lt!403437 (remainingBits!0 ((_ sign_extend 32) (size!6327 (buf!6849 (_2!12126 lt!403435)))) ((_ sign_extend 32) (currentByte!12665 (_2!12126 lt!403435))) ((_ sign_extend 32) (currentBit!12660 (_2!12126 lt!403435)))))))

(assert (=> b!261493 (= lt!403436 (remainingBits!0 ((_ sign_extend 32) (size!6327 (buf!6849 (_2!12126 lt!403385)))) ((_ sign_extend 32) (currentByte!12665 (_2!12126 lt!403385))) ((_ sign_extend 32) (currentBit!12660 (_2!12126 lt!403385)))))))

(declare-fun b!261494 () Bool)

(assert (=> b!261494 (= e!181960 (= (size!6327 (buf!6849 (_2!12126 lt!403385))) (size!6327 (buf!6849 (_2!12126 lt!403435)))))))

(assert (= (and d!88136 res!218869) b!261493))

(assert (= (and b!261493 res!218870) b!261494))

(declare-fun m!391399 () Bool)

(assert (=> d!88136 m!391399))

(declare-fun m!391401 () Bool)

(assert (=> d!88136 m!391401))

(declare-fun m!391403 () Bool)

(assert (=> d!88136 m!391403))

(declare-fun m!391405 () Bool)

(assert (=> b!261493 m!391405))

(assert (=> b!261493 m!391403))

(assert (=> b!261465 d!88136))

(declare-fun d!88152 () Bool)

(declare-fun res!218875 () Bool)

(declare-fun e!181965 () Bool)

(assert (=> d!88152 (=> res!218875 e!181965)))

(assert (=> d!88152 (= res!218875 (= #b00000000000000000000000000000000 (currentByte!12665 (_2!12126 lt!403385))))))

(assert (=> d!88152 (= (arrayRangesEq!952 (buf!6849 thiss!914) (array!14498 (store (arr!7314 (buf!6849 thiss!914)) (currentByte!12665 (_2!12126 lt!403385)) (select (arr!7314 (buf!6849 (_2!12126 lt!403385))) (currentByte!12665 (_2!12126 lt!403385)))) (size!6327 (buf!6849 thiss!914))) #b00000000000000000000000000000000 (currentByte!12665 (_2!12126 lt!403385))) e!181965)))

(declare-fun b!261499 () Bool)

(declare-fun e!181966 () Bool)

(assert (=> b!261499 (= e!181965 e!181966)))

(declare-fun res!218876 () Bool)

(assert (=> b!261499 (=> (not res!218876) (not e!181966))))

(assert (=> b!261499 (= res!218876 (= (select (arr!7314 (buf!6849 thiss!914)) #b00000000000000000000000000000000) (select (arr!7314 (array!14498 (store (arr!7314 (buf!6849 thiss!914)) (currentByte!12665 (_2!12126 lt!403385)) (select (arr!7314 (buf!6849 (_2!12126 lt!403385))) (currentByte!12665 (_2!12126 lt!403385)))) (size!6327 (buf!6849 thiss!914)))) #b00000000000000000000000000000000)))))

(declare-fun b!261500 () Bool)

(assert (=> b!261500 (= e!181966 (arrayRangesEq!952 (buf!6849 thiss!914) (array!14498 (store (arr!7314 (buf!6849 thiss!914)) (currentByte!12665 (_2!12126 lt!403385)) (select (arr!7314 (buf!6849 (_2!12126 lt!403385))) (currentByte!12665 (_2!12126 lt!403385)))) (size!6327 (buf!6849 thiss!914))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12665 (_2!12126 lt!403385))))))

(assert (= (and d!88152 (not res!218875)) b!261499))

(assert (= (and b!261499 res!218876) b!261500))

(declare-fun m!391407 () Bool)

(assert (=> b!261499 m!391407))

(declare-fun m!391409 () Bool)

(assert (=> b!261499 m!391409))

(declare-fun m!391411 () Bool)

(assert (=> b!261500 m!391411))

(assert (=> b!261465 d!88152))

(declare-fun d!88154 () Bool)

(declare-fun e!181969 () Bool)

(assert (=> d!88154 e!181969))

(declare-fun res!218879 () Bool)

(assert (=> d!88154 (=> (not res!218879) (not e!181969))))

(assert (=> d!88154 (= res!218879 (and (bvsge (currentByte!12665 (_2!12126 lt!403385)) #b00000000000000000000000000000000) (bvslt (currentByte!12665 (_2!12126 lt!403385)) (size!6327 (buf!6849 thiss!914)))))))

(declare-fun lt!403442 () Unit!18641)

(declare-fun choose!362 (array!14497 (_ BitVec 32) (_ BitVec 8)) Unit!18641)

(assert (=> d!88154 (= lt!403442 (choose!362 (buf!6849 thiss!914) (currentByte!12665 (_2!12126 lt!403385)) (select (arr!7314 (buf!6849 (_2!12126 lt!403385))) (currentByte!12665 (_2!12126 lt!403385)))))))

(assert (=> d!88154 (and (bvsle #b00000000000000000000000000000000 (currentByte!12665 (_2!12126 lt!403385))) (bvslt (currentByte!12665 (_2!12126 lt!403385)) (size!6327 (buf!6849 thiss!914))))))

(assert (=> d!88154 (= (arrayUpdatedAtPrefixLemma!468 (buf!6849 thiss!914) (currentByte!12665 (_2!12126 lt!403385)) (select (arr!7314 (buf!6849 (_2!12126 lt!403385))) (currentByte!12665 (_2!12126 lt!403385)))) lt!403442)))

(declare-fun b!261503 () Bool)

(assert (=> b!261503 (= e!181969 (arrayRangesEq!952 (buf!6849 thiss!914) (array!14498 (store (arr!7314 (buf!6849 thiss!914)) (currentByte!12665 (_2!12126 lt!403385)) (select (arr!7314 (buf!6849 (_2!12126 lt!403385))) (currentByte!12665 (_2!12126 lt!403385)))) (size!6327 (buf!6849 thiss!914))) #b00000000000000000000000000000000 (currentByte!12665 (_2!12126 lt!403385))))))

(assert (= (and d!88154 res!218879) b!261503))

(assert (=> d!88154 m!391353))

(declare-fun m!391413 () Bool)

(assert (=> d!88154 m!391413))

(assert (=> b!261503 m!391361))

(assert (=> b!261503 m!391367))

(assert (=> b!261465 d!88154))

(declare-fun d!88156 () Bool)

(declare-fun e!181986 () Bool)

(assert (=> d!88156 e!181986))

(declare-fun res!218905 () Bool)

(assert (=> d!88156 (=> (not res!218905) (not e!181986))))

(declare-fun lt!403492 () (_ BitVec 64))

(declare-fun lt!403490 () (_ BitVec 64))

(declare-fun lt!403493 () (_ BitVec 64))

(assert (=> d!88156 (= res!218905 (= lt!403493 (bvsub lt!403492 lt!403490)))))

(assert (=> d!88156 (or (= (bvand lt!403492 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!403490 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!403492 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!403492 lt!403490) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!88156 (= lt!403490 (remainingBits!0 ((_ sign_extend 32) (size!6327 (buf!6849 thiss!914))) ((_ sign_extend 32) (currentByte!12665 thiss!914)) ((_ sign_extend 32) (currentBit!12660 thiss!914))))))

(declare-fun lt!403494 () (_ BitVec 64))

(declare-fun lt!403495 () (_ BitVec 64))

(assert (=> d!88156 (= lt!403492 (bvmul lt!403494 lt!403495))))

(assert (=> d!88156 (or (= lt!403494 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!403495 (bvsdiv (bvmul lt!403494 lt!403495) lt!403494)))))

(assert (=> d!88156 (= lt!403495 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!88156 (= lt!403494 ((_ sign_extend 32) (size!6327 (buf!6849 thiss!914))))))

(assert (=> d!88156 (= lt!403493 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12665 thiss!914)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12660 thiss!914))))))

(assert (=> d!88156 (invariant!0 (currentBit!12660 thiss!914) (currentByte!12665 thiss!914) (size!6327 (buf!6849 thiss!914)))))

(assert (=> d!88156 (= (bitIndex!0 (size!6327 (buf!6849 thiss!914)) (currentByte!12665 thiss!914) (currentBit!12660 thiss!914)) lt!403493)))

(declare-fun b!261526 () Bool)

(declare-fun res!218904 () Bool)

(assert (=> b!261526 (=> (not res!218904) (not e!181986))))

(assert (=> b!261526 (= res!218904 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!403493))))

(declare-fun b!261527 () Bool)

(declare-fun lt!403491 () (_ BitVec 64))

(assert (=> b!261527 (= e!181986 (bvsle lt!403493 (bvmul lt!403491 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!261527 (or (= lt!403491 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!403491 #b0000000000000000000000000000000000000000000000000000000000001000) lt!403491)))))

(assert (=> b!261527 (= lt!403491 ((_ sign_extend 32) (size!6327 (buf!6849 thiss!914))))))

(assert (= (and d!88156 res!218905) b!261526))

(assert (= (and b!261526 res!218904) b!261527))

(assert (=> d!88156 m!391375))

(assert (=> d!88156 m!391377))

(assert (=> b!261466 d!88156))

(declare-fun d!88168 () Bool)

(assert (=> d!88168 (= (array_inv!6068 (buf!6849 thiss!914)) (bvsge (size!6327 (buf!6849 thiss!914)) #b00000000000000000000000000000000))))

(assert (=> b!261467 d!88168))

(push 1)

(assert (not d!88156))

(assert (not d!88130))

(assert (not d!88134))

(assert (not b!261500))

(assert (not b!261493))

(assert (not b!261503))

(assert (not d!88136))

(assert (not d!88154))

(check-sat)

(pop 1)

(push 1)

(check-sat)

