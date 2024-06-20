; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56528 () Bool)

(assert start!56528)

(declare-fun res!218573 () Bool)

(declare-fun e!181450 () Bool)

(assert (=> start!56528 (=> (not res!218573) (not e!181450))))

(declare-datatypes ((array!14374 0))(
  ( (array!14375 (arr!7269 (Array (_ BitVec 32) (_ BitVec 8))) (size!6282 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11486 0))(
  ( (BitStream!11487 (buf!6804 array!14374) (currentByte!12539 (_ BitVec 32)) (currentBit!12534 (_ BitVec 32))) )
))
(declare-fun thiss!914 () BitStream!11486)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!56528 (= res!218573 (validate_offset_bit!0 ((_ sign_extend 32) (size!6282 (buf!6804 thiss!914))) ((_ sign_extend 32) (currentByte!12539 thiss!914)) ((_ sign_extend 32) (currentBit!12534 thiss!914))))))

(assert (=> start!56528 e!181450))

(declare-fun e!181451 () Bool)

(declare-fun inv!12 (BitStream!11486) Bool)

(assert (=> start!56528 (and (inv!12 thiss!914) e!181451)))

(assert (=> start!56528 true))

(declare-fun b!261061 () Bool)

(declare-fun e!181453 () Bool)

(assert (=> b!261061 (= e!181450 (not e!181453))))

(declare-fun res!218570 () Bool)

(assert (=> b!261061 (=> res!218570 e!181453)))

(declare-datatypes ((Unit!18599 0))(
  ( (Unit!18600) )
))
(declare-datatypes ((tuple2!22362 0))(
  ( (tuple2!22363 (_1!12117 Unit!18599) (_2!12117 BitStream!11486)) )
))
(declare-fun lt!403207 () tuple2!22362)

(assert (=> b!261061 (= res!218570 (not (= (size!6282 (buf!6804 thiss!914)) (size!6282 (buf!6804 (_2!12117 lt!403207))))))))

(declare-fun lt!403208 () tuple2!22362)

(declare-fun increaseBitIndex!0 (BitStream!11486) tuple2!22362)

(assert (=> b!261061 (= lt!403207 (increaseBitIndex!0 (_2!12117 lt!403208)))))

(declare-fun arrayRangesEq!949 (array!14374 array!14374 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!261061 (arrayRangesEq!949 (buf!6804 thiss!914) (array!14375 (store (arr!7269 (buf!6804 thiss!914)) (currentByte!12539 (_2!12117 lt!403208)) (select (arr!7269 (buf!6804 (_2!12117 lt!403208))) (currentByte!12539 (_2!12117 lt!403208)))) (size!6282 (buf!6804 thiss!914))) #b00000000000000000000000000000000 (currentByte!12539 (_2!12117 lt!403208)))))

(declare-fun lt!403206 () Unit!18599)

(declare-fun arrayUpdatedAtPrefixLemma!465 (array!14374 (_ BitVec 32) (_ BitVec 8)) Unit!18599)

(assert (=> b!261061 (= lt!403206 (arrayUpdatedAtPrefixLemma!465 (buf!6804 thiss!914) (currentByte!12539 (_2!12117 lt!403208)) (select (arr!7269 (buf!6804 (_2!12117 lt!403208))) (currentByte!12539 (_2!12117 lt!403208)))))))

(declare-fun b!187 () Bool)

(declare-fun Unit!18601 () Unit!18599)

(declare-fun Unit!18602 () Unit!18599)

(assert (=> b!261061 (= lt!403208 (ite b!187 (tuple2!22363 Unit!18601 (BitStream!11487 (array!14375 (store (arr!7269 (buf!6804 thiss!914)) (currentByte!12539 thiss!914) ((_ extract 7 0) (bvor ((_ sign_extend 24) (select (arr!7269 (buf!6804 thiss!914)) (currentByte!12539 thiss!914))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12534 thiss!914)))))) (size!6282 (buf!6804 thiss!914))) (currentByte!12539 thiss!914) (currentBit!12534 thiss!914))) (tuple2!22363 Unit!18602 (BitStream!11487 (array!14375 (store (arr!7269 (buf!6804 thiss!914)) (currentByte!12539 thiss!914) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!7269 (buf!6804 thiss!914)) (currentByte!12539 thiss!914))) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12534 thiss!914))))))) (size!6282 (buf!6804 thiss!914))) (currentByte!12539 thiss!914) (currentBit!12534 thiss!914)))))))

(declare-fun b!261062 () Bool)

(declare-fun lt!403205 () BitStream!11486)

(assert (=> b!261062 (= e!181453 (validate_offset_bit!0 ((_ sign_extend 32) (size!6282 (buf!6804 lt!403205))) ((_ sign_extend 32) (currentByte!12539 lt!403205)) ((_ sign_extend 32) (currentBit!12534 lt!403205))))))

(declare-fun readerFrom!0 (BitStream!11486 (_ BitVec 32) (_ BitVec 32)) BitStream!11486)

(assert (=> b!261062 (= lt!403205 (readerFrom!0 (_2!12117 lt!403207) (currentBit!12534 thiss!914) (currentByte!12539 thiss!914)))))

(declare-fun b!261063 () Bool)

(declare-fun res!218572 () Bool)

(assert (=> b!261063 (=> res!218572 e!181453)))

(declare-fun isPrefixOf!0 (BitStream!11486 BitStream!11486) Bool)

(assert (=> b!261063 (= res!218572 (not (isPrefixOf!0 thiss!914 (_2!12117 lt!403207))))))

(declare-fun b!261064 () Bool)

(declare-fun array_inv!6023 (array!14374) Bool)

(assert (=> b!261064 (= e!181451 (array_inv!6023 (buf!6804 thiss!914)))))

(declare-fun b!261065 () Bool)

(declare-fun res!218571 () Bool)

(assert (=> b!261065 (=> res!218571 e!181453)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!261065 (= res!218571 (not (= (bitIndex!0 (size!6282 (buf!6804 (_2!12117 lt!403207))) (currentByte!12539 (_2!12117 lt!403207)) (currentBit!12534 (_2!12117 lt!403207))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!6282 (buf!6804 thiss!914)) (currentByte!12539 thiss!914) (currentBit!12534 thiss!914))))))))

(assert (= (and start!56528 res!218573) b!261061))

(assert (= (and b!261061 (not res!218570)) b!261065))

(assert (= (and b!261065 (not res!218571)) b!261063))

(assert (= (and b!261063 (not res!218572)) b!261062))

(assert (= start!56528 b!261064))

(declare-fun m!390651 () Bool)

(assert (=> b!261063 m!390651))

(declare-fun m!390653 () Bool)

(assert (=> b!261061 m!390653))

(declare-fun m!390655 () Bool)

(assert (=> b!261061 m!390655))

(declare-fun m!390657 () Bool)

(assert (=> b!261061 m!390657))

(declare-fun m!390659 () Bool)

(assert (=> b!261061 m!390659))

(declare-fun m!390661 () Bool)

(assert (=> b!261061 m!390661))

(declare-fun m!390663 () Bool)

(assert (=> b!261061 m!390663))

(declare-fun m!390665 () Bool)

(assert (=> b!261061 m!390665))

(assert (=> b!261061 m!390653))

(declare-fun m!390667 () Bool)

(assert (=> b!261061 m!390667))

(declare-fun m!390669 () Bool)

(assert (=> b!261061 m!390669))

(declare-fun m!390671 () Bool)

(assert (=> start!56528 m!390671))

(declare-fun m!390673 () Bool)

(assert (=> start!56528 m!390673))

(declare-fun m!390675 () Bool)

(assert (=> b!261065 m!390675))

(declare-fun m!390677 () Bool)

(assert (=> b!261065 m!390677))

(declare-fun m!390679 () Bool)

(assert (=> b!261064 m!390679))

(declare-fun m!390681 () Bool)

(assert (=> b!261062 m!390681))

(declare-fun m!390683 () Bool)

(assert (=> b!261062 m!390683))

(push 1)

(assert (not b!261061))

(assert (not b!261062))

(assert (not b!261065))

(assert (not b!261064))

(assert (not b!261063))

(assert (not start!56528))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!87764 () Bool)

(assert (=> d!87764 (= (array_inv!6023 (buf!6804 thiss!914)) (bvsge (size!6282 (buf!6804 thiss!914)) #b00000000000000000000000000000000))))

(assert (=> b!261064 d!87764))

(declare-fun d!87766 () Bool)

(declare-fun res!218603 () Bool)

(declare-fun e!181474 () Bool)

(assert (=> d!87766 (=> (not res!218603) (not e!181474))))

(assert (=> d!87766 (= res!218603 (= (size!6282 (buf!6804 thiss!914)) (size!6282 (buf!6804 (_2!12117 lt!403207)))))))

(assert (=> d!87766 (= (isPrefixOf!0 thiss!914 (_2!12117 lt!403207)) e!181474)))

(declare-fun b!261093 () Bool)

(declare-fun res!218602 () Bool)

(assert (=> b!261093 (=> (not res!218602) (not e!181474))))

(assert (=> b!261093 (= res!218602 (bvsle (bitIndex!0 (size!6282 (buf!6804 thiss!914)) (currentByte!12539 thiss!914) (currentBit!12534 thiss!914)) (bitIndex!0 (size!6282 (buf!6804 (_2!12117 lt!403207))) (currentByte!12539 (_2!12117 lt!403207)) (currentBit!12534 (_2!12117 lt!403207)))))))

(declare-fun b!261094 () Bool)

(declare-fun e!181473 () Bool)

(assert (=> b!261094 (= e!181474 e!181473)))

(declare-fun res!218604 () Bool)

(assert (=> b!261094 (=> res!218604 e!181473)))

(assert (=> b!261094 (= res!218604 (= (size!6282 (buf!6804 thiss!914)) #b00000000000000000000000000000000))))

(declare-fun b!261095 () Bool)

(declare-fun arrayBitRangesEq!0 (array!14374 array!14374 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!261095 (= e!181473 (arrayBitRangesEq!0 (buf!6804 thiss!914) (buf!6804 (_2!12117 lt!403207)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6282 (buf!6804 thiss!914)) (currentByte!12539 thiss!914) (currentBit!12534 thiss!914))))))

(assert (= (and d!87766 res!218603) b!261093))

(assert (= (and b!261093 res!218602) b!261094))

(assert (= (and b!261094 (not res!218604)) b!261095))

(assert (=> b!261093 m!390677))

(assert (=> b!261093 m!390675))

(assert (=> b!261095 m!390677))

(assert (=> b!261095 m!390677))

(declare-fun m!390699 () Bool)

(assert (=> b!261095 m!390699))

(assert (=> b!261063 d!87766))

(declare-fun d!87776 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!87776 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6282 (buf!6804 lt!403205))) ((_ sign_extend 32) (currentByte!12539 lt!403205)) ((_ sign_extend 32) (currentBit!12534 lt!403205))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6282 (buf!6804 lt!403205))) ((_ sign_extend 32) (currentByte!12539 lt!403205)) ((_ sign_extend 32) (currentBit!12534 lt!403205))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!22227 () Bool)

(assert (= bs!22227 d!87776))

(declare-fun m!390701 () Bool)

(assert (=> bs!22227 m!390701))

(assert (=> b!261062 d!87776))

(declare-fun d!87778 () Bool)

(declare-fun e!181481 () Bool)

(assert (=> d!87778 e!181481))

(declare-fun res!218616 () Bool)

(assert (=> d!87778 (=> (not res!218616) (not e!181481))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!87778 (= res!218616 (invariant!0 (currentBit!12534 (_2!12117 lt!403207)) (currentByte!12539 (_2!12117 lt!403207)) (size!6282 (buf!6804 (_2!12117 lt!403207)))))))

(assert (=> d!87778 (= (readerFrom!0 (_2!12117 lt!403207) (currentBit!12534 thiss!914) (currentByte!12539 thiss!914)) (BitStream!11487 (buf!6804 (_2!12117 lt!403207)) (currentByte!12539 thiss!914) (currentBit!12534 thiss!914)))))

(declare-fun b!261106 () Bool)

(assert (=> b!261106 (= e!181481 (invariant!0 (currentBit!12534 thiss!914) (currentByte!12539 thiss!914) (size!6282 (buf!6804 (_2!12117 lt!403207)))))))

(assert (= (and d!87778 res!218616) b!261106))

(declare-fun m!390705 () Bool)

(assert (=> d!87778 m!390705))

(declare-fun m!390711 () Bool)

(assert (=> b!261106 m!390711))

(assert (=> b!261062 d!87778))

(declare-fun d!87784 () Bool)

(declare-fun e!181494 () Bool)

(assert (=> d!87784 e!181494))

(declare-fun res!218640 () Bool)

(assert (=> d!87784 (=> (not res!218640) (not e!181494))))

(declare-fun lt!403284 () tuple2!22362)

(declare-fun lt!403283 () (_ BitVec 64))

(declare-fun lt!403285 () (_ BitVec 64))

(assert (=> d!87784 (= res!218640 (= (bvadd lt!403283 lt!403285) (bitIndex!0 (size!6282 (buf!6804 (_2!12117 lt!403284))) (currentByte!12539 (_2!12117 lt!403284)) (currentBit!12534 (_2!12117 lt!403284)))))))

(assert (=> d!87784 (or (not (= (bvand lt!403283 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!403285 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!403283 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!403283 lt!403285) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!87784 (= lt!403285 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!87784 (= lt!403283 (bitIndex!0 (size!6282 (buf!6804 (_2!12117 lt!403208))) (currentByte!12539 (_2!12117 lt!403208)) (currentBit!12534 (_2!12117 lt!403208))))))

(declare-fun Unit!18605 () Unit!18599)

(declare-fun Unit!18606 () Unit!18599)

(assert (=> d!87784 (= lt!403284 (ite (bvslt (currentBit!12534 (_2!12117 lt!403208)) #b00000000000000000000000000000111) (tuple2!22363 Unit!18605 (BitStream!11487 (buf!6804 (_2!12117 lt!403208)) (currentByte!12539 (_2!12117 lt!403208)) (bvadd (currentBit!12534 (_2!12117 lt!403208)) #b00000000000000000000000000000001))) (tuple2!22363 Unit!18606 (BitStream!11487 (buf!6804 (_2!12117 lt!403208)) (bvadd (currentByte!12539 (_2!12117 lt!403208)) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (=> d!87784 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!6282 (buf!6804 (_2!12117 lt!403208)))) ((_ sign_extend 32) (currentByte!12539 (_2!12117 lt!403208))) ((_ sign_extend 32) (currentBit!12534 (_2!12117 lt!403208)))) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!87784 (= (increaseBitIndex!0 (_2!12117 lt!403208)) lt!403284)))

(declare-fun b!261128 () Bool)

(declare-fun res!218639 () Bool)

(assert (=> b!261128 (=> (not res!218639) (not e!181494))))

(declare-fun lt!403286 () (_ BitVec 64))

(declare-fun lt!403282 () (_ BitVec 64))

(assert (=> b!261128 (= res!218639 (= (bvsub lt!403286 lt!403282) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!261128 (or (= (bvand lt!403286 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!403282 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!403286 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!403286 lt!403282) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!261128 (= lt!403282 (remainingBits!0 ((_ sign_extend 32) (size!6282 (buf!6804 (_2!12117 lt!403284)))) ((_ sign_extend 32) (currentByte!12539 (_2!12117 lt!403284))) ((_ sign_extend 32) (currentBit!12534 (_2!12117 lt!403284)))))))

(assert (=> b!261128 (= lt!403286 (remainingBits!0 ((_ sign_extend 32) (size!6282 (buf!6804 (_2!12117 lt!403208)))) ((_ sign_extend 32) (currentByte!12539 (_2!12117 lt!403208))) ((_ sign_extend 32) (currentBit!12534 (_2!12117 lt!403208)))))))

(declare-fun b!261129 () Bool)

(assert (=> b!261129 (= e!181494 (= (size!6282 (buf!6804 (_2!12117 lt!403208))) (size!6282 (buf!6804 (_2!12117 lt!403284)))))))

(assert (= (and d!87784 res!218640) b!261128))

(assert (= (and b!261128 res!218639) b!261129))

(declare-fun m!390729 () Bool)

(assert (=> d!87784 m!390729))

(declare-fun m!390731 () Bool)

(assert (=> d!87784 m!390731))

(declare-fun m!390733 () Bool)

(assert (=> d!87784 m!390733))

(declare-fun m!390735 () Bool)

(assert (=> b!261128 m!390735))

(assert (=> b!261128 m!390733))

(assert (=> b!261061 d!87784))

(declare-fun d!87796 () Bool)

(declare-fun res!218651 () Bool)

(declare-fun e!181505 () Bool)

(assert (=> d!87796 (=> res!218651 e!181505)))

(assert (=> d!87796 (= res!218651 (= #b00000000000000000000000000000000 (currentByte!12539 (_2!12117 lt!403208))))))

(assert (=> d!87796 (= (arrayRangesEq!949 (buf!6804 thiss!914) (array!14375 (store (arr!7269 (buf!6804 thiss!914)) (currentByte!12539 (_2!12117 lt!403208)) (select (arr!7269 (buf!6804 (_2!12117 lt!403208))) (currentByte!12539 (_2!12117 lt!403208)))) (size!6282 (buf!6804 thiss!914))) #b00000000000000000000000000000000 (currentByte!12539 (_2!12117 lt!403208))) e!181505)))

(declare-fun b!261140 () Bool)

(declare-fun e!181506 () Bool)

(assert (=> b!261140 (= e!181505 e!181506)))

(declare-fun res!218652 () Bool)

(assert (=> b!261140 (=> (not res!218652) (not e!181506))))

(assert (=> b!261140 (= res!218652 (= (select (arr!7269 (buf!6804 thiss!914)) #b00000000000000000000000000000000) (select (arr!7269 (array!14375 (store (arr!7269 (buf!6804 thiss!914)) (currentByte!12539 (_2!12117 lt!403208)) (select (arr!7269 (buf!6804 (_2!12117 lt!403208))) (currentByte!12539 (_2!12117 lt!403208)))) (size!6282 (buf!6804 thiss!914)))) #b00000000000000000000000000000000)))))

(declare-fun b!261141 () Bool)

(assert (=> b!261141 (= e!181506 (arrayRangesEq!949 (buf!6804 thiss!914) (array!14375 (store (arr!7269 (buf!6804 thiss!914)) (currentByte!12539 (_2!12117 lt!403208)) (select (arr!7269 (buf!6804 (_2!12117 lt!403208))) (currentByte!12539 (_2!12117 lt!403208)))) (size!6282 (buf!6804 thiss!914))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12539 (_2!12117 lt!403208))))))

(assert (= (and d!87796 (not res!218651)) b!261140))

(assert (= (and b!261140 res!218652) b!261141))

(declare-fun m!390743 () Bool)

(assert (=> b!261140 m!390743))

(declare-fun m!390745 () Bool)

(assert (=> b!261140 m!390745))

(declare-fun m!390747 () Bool)

(assert (=> b!261141 m!390747))

(assert (=> b!261061 d!87796))

(declare-fun d!87800 () Bool)

(declare-fun e!181514 () Bool)

(assert (=> d!87800 e!181514))

(declare-fun res!218662 () Bool)

(assert (=> d!87800 (=> (not res!218662) (not e!181514))))

(assert (=> d!87800 (= res!218662 (and (bvsge (currentByte!12539 (_2!12117 lt!403208)) #b00000000000000000000000000000000) (bvslt (currentByte!12539 (_2!12117 lt!403208)) (size!6282 (buf!6804 thiss!914)))))))

(declare-fun lt!403302 () Unit!18599)

(declare-fun choose!359 (array!14374 (_ BitVec 32) (_ BitVec 8)) Unit!18599)

(assert (=> d!87800 (= lt!403302 (choose!359 (buf!6804 thiss!914) (currentByte!12539 (_2!12117 lt!403208)) (select (arr!7269 (buf!6804 (_2!12117 lt!403208))) (currentByte!12539 (_2!12117 lt!403208)))))))

(assert (=> d!87800 (and (bvsle #b00000000000000000000000000000000 (currentByte!12539 (_2!12117 lt!403208))) (bvslt (currentByte!12539 (_2!12117 lt!403208)) (size!6282 (buf!6804 thiss!914))))))

(assert (=> d!87800 (= (arrayUpdatedAtPrefixLemma!465 (buf!6804 thiss!914) (currentByte!12539 (_2!12117 lt!403208)) (select (arr!7269 (buf!6804 (_2!12117 lt!403208))) (currentByte!12539 (_2!12117 lt!403208)))) lt!403302)))

(declare-fun b!261151 () Bool)

(assert (=> b!261151 (= e!181514 (arrayRangesEq!949 (buf!6804 thiss!914) (array!14375 (store (arr!7269 (buf!6804 thiss!914)) (currentByte!12539 (_2!12117 lt!403208)) (select (arr!7269 (buf!6804 (_2!12117 lt!403208))) (currentByte!12539 (_2!12117 lt!403208)))) (size!6282 (buf!6804 thiss!914))) #b00000000000000000000000000000000 (currentByte!12539 (_2!12117 lt!403208))))))

(assert (= (and d!87800 res!218662) b!261151))

(assert (=> d!87800 m!390653))

(declare-fun m!390751 () Bool)

(assert (=> d!87800 m!390751))

(assert (=> b!261151 m!390657))

(assert (=> b!261151 m!390659))

(assert (=> b!261061 d!87800))

(declare-fun d!87804 () Bool)

(declare-fun e!181527 () Bool)

(assert (=> d!87804 e!181527))

(declare-fun res!218678 () Bool)

(assert (=> d!87804 (=> (not res!218678) (not e!181527))))

(declare-fun lt!403325 () (_ BitVec 64))

(declare-fun lt!403328 () (_ BitVec 64))

(declare-fun lt!403327 () (_ BitVec 64))

(assert (=> d!87804 (= res!218678 (= lt!403325 (bvsub lt!403328 lt!403327)))))

(assert (=> d!87804 (or (= (bvand lt!403328 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!403327 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!403328 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!403328 lt!403327) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!87804 (= lt!403327 (remainingBits!0 ((_ sign_extend 32) (size!6282 (buf!6804 (_2!12117 lt!403207)))) ((_ sign_extend 32) (currentByte!12539 (_2!12117 lt!403207))) ((_ sign_extend 32) (currentBit!12534 (_2!12117 lt!403207)))))))

(declare-fun lt!403323 () (_ BitVec 64))

(declare-fun lt!403326 () (_ BitVec 64))

(assert (=> d!87804 (= lt!403328 (bvmul lt!403323 lt!403326))))

(assert (=> d!87804 (or (= lt!403323 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!403326 (bvsdiv (bvmul lt!403323 lt!403326) lt!403323)))))

(assert (=> d!87804 (= lt!403326 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!87804 (= lt!403323 ((_ sign_extend 32) (size!6282 (buf!6804 (_2!12117 lt!403207)))))))

(assert (=> d!87804 (= lt!403325 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12539 (_2!12117 lt!403207))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12534 (_2!12117 lt!403207)))))))

(assert (=> d!87804 (invariant!0 (currentBit!12534 (_2!12117 lt!403207)) (currentByte!12539 (_2!12117 lt!403207)) (size!6282 (buf!6804 (_2!12117 lt!403207))))))

(assert (=> d!87804 (= (bitIndex!0 (size!6282 (buf!6804 (_2!12117 lt!403207))) (currentByte!12539 (_2!12117 lt!403207)) (currentBit!12534 (_2!12117 lt!403207))) lt!403325)))

(declare-fun b!261167 () Bool)

(declare-fun res!218679 () Bool)

(assert (=> b!261167 (=> (not res!218679) (not e!181527))))

(assert (=> b!261167 (= res!218679 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!403325))))

(declare-fun b!261168 () Bool)

(declare-fun lt!403324 () (_ BitVec 64))

(assert (=> b!261168 (= e!181527 (bvsle lt!403325 (bvmul lt!403324 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!261168 (or (= lt!403324 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!403324 #b0000000000000000000000000000000000000000000000000000000000001000) lt!403324)))))

(assert (=> b!261168 (= lt!403324 ((_ sign_extend 32) (size!6282 (buf!6804 (_2!12117 lt!403207)))))))

(assert (= (and d!87804 res!218678) b!261167))

(assert (= (and b!261167 res!218679) b!261168))

(declare-fun m!390769 () Bool)

(assert (=> d!87804 m!390769))

(assert (=> d!87804 m!390705))

(assert (=> b!261065 d!87804))

(declare-fun d!87814 () Bool)

(declare-fun e!181528 () Bool)

(assert (=> d!87814 e!181528))

(declare-fun res!218680 () Bool)

(assert (=> d!87814 (=> (not res!218680) (not e!181528))))

(declare-fun lt!403334 () (_ BitVec 64))

(declare-fun lt!403333 () (_ BitVec 64))

(declare-fun lt!403331 () (_ BitVec 64))

(assert (=> d!87814 (= res!218680 (= lt!403331 (bvsub lt!403334 lt!403333)))))

(assert (=> d!87814 (or (= (bvand lt!403334 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!403333 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!403334 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!403334 lt!403333) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!87814 (= lt!403333 (remainingBits!0 ((_ sign_extend 32) (size!6282 (buf!6804 thiss!914))) ((_ sign_extend 32) (currentByte!12539 thiss!914)) ((_ sign_extend 32) (currentBit!12534 thiss!914))))))

(declare-fun lt!403329 () (_ BitVec 64))

(declare-fun lt!403332 () (_ BitVec 64))

(assert (=> d!87814 (= lt!403334 (bvmul lt!403329 lt!403332))))

(assert (=> d!87814 (or (= lt!403329 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!403332 (bvsdiv (bvmul lt!403329 lt!403332) lt!403329)))))

(assert (=> d!87814 (= lt!403332 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!87814 (= lt!403329 ((_ sign_extend 32) (size!6282 (buf!6804 thiss!914))))))

(assert (=> d!87814 (= lt!403331 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12539 thiss!914)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12534 thiss!914))))))

(assert (=> d!87814 (invariant!0 (currentBit!12534 thiss!914) (currentByte!12539 thiss!914) (size!6282 (buf!6804 thiss!914)))))

(assert (=> d!87814 (= (bitIndex!0 (size!6282 (buf!6804 thiss!914)) (currentByte!12539 thiss!914) (currentBit!12534 thiss!914)) lt!403331)))

(declare-fun b!261169 () Bool)

(declare-fun res!218681 () Bool)

(assert (=> b!261169 (=> (not res!218681) (not e!181528))))

(assert (=> b!261169 (= res!218681 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!403331))))

(declare-fun b!261170 () Bool)

(declare-fun lt!403330 () (_ BitVec 64))

(assert (=> b!261170 (= e!181528 (bvsle lt!403331 (bvmul lt!403330 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!261170 (or (= lt!403330 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!403330 #b0000000000000000000000000000000000000000000000000000000000001000) lt!403330)))))

(assert (=> b!261170 (= lt!403330 ((_ sign_extend 32) (size!6282 (buf!6804 thiss!914))))))

(assert (= (and d!87814 res!218680) b!261169))

(assert (= (and b!261169 res!218681) b!261170))

(declare-fun m!390771 () Bool)

(assert (=> d!87814 m!390771))

(declare-fun m!390773 () Bool)

(assert (=> d!87814 m!390773))

(assert (=> b!261065 d!87814))

(declare-fun d!87816 () Bool)

(assert (=> d!87816 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6282 (buf!6804 thiss!914))) ((_ sign_extend 32) (currentByte!12539 thiss!914)) ((_ sign_extend 32) (currentBit!12534 thiss!914))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6282 (buf!6804 thiss!914))) ((_ sign_extend 32) (currentByte!12539 thiss!914)) ((_ sign_extend 32) (currentBit!12534 thiss!914))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!22231 () Bool)

(assert (= bs!22231 d!87816))

(assert (=> bs!22231 m!390771))

(assert (=> start!56528 d!87816))

(declare-fun d!87818 () Bool)

(assert (=> d!87818 (= (inv!12 thiss!914) (invariant!0 (currentBit!12534 thiss!914) (currentByte!12539 thiss!914) (size!6282 (buf!6804 thiss!914))))))

(declare-fun bs!22232 () Bool)

(assert (= bs!22232 d!87818))

(assert (=> bs!22232 m!390773))

(assert (=> start!56528 d!87818))

(push 1)

(assert (not d!87804))

(assert (not b!261106))

(assert (not d!87776))

(assert (not d!87814))

(assert (not d!87800))

(assert (not b!261128))

(assert (not d!87778))

(assert (not d!87818))

(assert (not d!87784))

(assert (not d!87816))

(assert (not b!261151))

(assert (not b!261095))

(assert (not b!261093))

(assert (not b!261141))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

