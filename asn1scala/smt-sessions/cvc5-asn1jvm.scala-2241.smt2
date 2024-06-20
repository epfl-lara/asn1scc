; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56986 () Bool)

(assert start!56986)

(declare-fun res!218919 () Bool)

(declare-fun e!182001 () Bool)

(assert (=> start!56986 (=> (not res!218919) (not e!182001))))

(declare-datatypes ((array!14502 0))(
  ( (array!14503 (arr!7315 (Array (_ BitVec 32) (_ BitVec 8))) (size!6328 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11578 0))(
  ( (BitStream!11579 (buf!6850 array!14502) (currentByte!12672 (_ BitVec 32)) (currentBit!12667 (_ BitVec 32))) )
))
(declare-fun thiss!914 () BitStream!11578)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!56986 (= res!218919 (validate_offset_bit!0 ((_ sign_extend 32) (size!6328 (buf!6850 thiss!914))) ((_ sign_extend 32) (currentByte!12672 thiss!914)) ((_ sign_extend 32) (currentBit!12667 thiss!914))))))

(assert (=> start!56986 e!182001))

(declare-fun e!182000 () Bool)

(declare-fun inv!12 (BitStream!11578) Bool)

(assert (=> start!56986 (and (inv!12 thiss!914) e!182000)))

(assert (=> start!56986 true))

(declare-fun b!261543 () Bool)

(declare-fun e!182005 () Bool)

(declare-fun e!182004 () Bool)

(assert (=> b!261543 (= e!182005 e!182004)))

(declare-fun res!218920 () Bool)

(assert (=> b!261543 (=> (not res!218920) (not e!182004))))

(declare-datatypes ((tuple2!22382 0))(
  ( (tuple2!22383 (_1!12127 BitStream!11578) (_2!12127 Bool)) )
))
(declare-fun lt!403510 () tuple2!22382)

(declare-datatypes ((Unit!18651 0))(
  ( (Unit!18652) )
))
(declare-datatypes ((tuple2!22384 0))(
  ( (tuple2!22385 (_1!12128 Unit!18651) (_2!12128 BitStream!11578)) )
))
(declare-fun lt!403512 () tuple2!22384)

(declare-fun b!187 () Bool)

(assert (=> b!261543 (= res!218920 (and (= (_2!12127 lt!403510) b!187) (= (_1!12127 lt!403510) (_2!12128 lt!403512))))))

(declare-fun readBitPure!0 (BitStream!11578) tuple2!22382)

(declare-fun readerFrom!0 (BitStream!11578 (_ BitVec 32) (_ BitVec 32)) BitStream!11578)

(assert (=> b!261543 (= lt!403510 (readBitPure!0 (readerFrom!0 (_2!12128 lt!403512) (currentBit!12667 thiss!914) (currentByte!12672 thiss!914))))))

(declare-fun b!261544 () Bool)

(declare-fun lt!403513 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!261544 (= e!182004 (= (bitIndex!0 (size!6328 (buf!6850 (_1!12127 lt!403510))) (currentByte!12672 (_1!12127 lt!403510)) (currentBit!12667 (_1!12127 lt!403510))) lt!403513))))

(declare-fun b!261545 () Bool)

(declare-fun e!182003 () Bool)

(assert (=> b!261545 (= e!182003 e!182005)))

(declare-fun res!218917 () Bool)

(assert (=> b!261545 (=> (not res!218917) (not e!182005))))

(declare-fun lt!403511 () (_ BitVec 64))

(assert (=> b!261545 (= res!218917 (= lt!403513 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!403511)))))

(assert (=> b!261545 (= lt!403513 (bitIndex!0 (size!6328 (buf!6850 (_2!12128 lt!403512))) (currentByte!12672 (_2!12128 lt!403512)) (currentBit!12667 (_2!12128 lt!403512))))))

(assert (=> b!261545 (= lt!403511 (bitIndex!0 (size!6328 (buf!6850 thiss!914)) (currentByte!12672 thiss!914) (currentBit!12667 thiss!914)))))

(declare-fun b!261546 () Bool)

(declare-fun array_inv!6069 (array!14502) Bool)

(assert (=> b!261546 (= e!182000 (array_inv!6069 (buf!6850 thiss!914)))))

(declare-fun b!261547 () Bool)

(declare-fun res!218921 () Bool)

(assert (=> b!261547 (=> (not res!218921) (not e!182005))))

(declare-fun isPrefixOf!0 (BitStream!11578 BitStream!11578) Bool)

(assert (=> b!261547 (= res!218921 (isPrefixOf!0 thiss!914 (_2!12128 lt!403512)))))

(declare-fun b!261548 () Bool)

(assert (=> b!261548 (= e!182001 (not e!182003))))

(declare-fun res!218918 () Bool)

(assert (=> b!261548 (=> (not res!218918) (not e!182003))))

(assert (=> b!261548 (= res!218918 (= (size!6328 (buf!6850 thiss!914)) (size!6328 (buf!6850 (_2!12128 lt!403512)))))))

(declare-fun lt!403514 () tuple2!22384)

(declare-fun increaseBitIndex!0 (BitStream!11578) tuple2!22384)

(assert (=> b!261548 (= lt!403512 (increaseBitIndex!0 (_2!12128 lt!403514)))))

(declare-fun arrayRangesEq!953 (array!14502 array!14502 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!261548 (arrayRangesEq!953 (buf!6850 thiss!914) (array!14503 (store (arr!7315 (buf!6850 thiss!914)) (currentByte!12672 (_2!12128 lt!403514)) (select (arr!7315 (buf!6850 (_2!12128 lt!403514))) (currentByte!12672 (_2!12128 lt!403514)))) (size!6328 (buf!6850 thiss!914))) #b00000000000000000000000000000000 (currentByte!12672 (_2!12128 lt!403514)))))

(declare-fun lt!403509 () Unit!18651)

(declare-fun arrayUpdatedAtPrefixLemma!469 (array!14502 (_ BitVec 32) (_ BitVec 8)) Unit!18651)

(assert (=> b!261548 (= lt!403509 (arrayUpdatedAtPrefixLemma!469 (buf!6850 thiss!914) (currentByte!12672 (_2!12128 lt!403514)) (select (arr!7315 (buf!6850 (_2!12128 lt!403514))) (currentByte!12672 (_2!12128 lt!403514)))))))

(declare-fun Unit!18653 () Unit!18651)

(declare-fun Unit!18654 () Unit!18651)

(assert (=> b!261548 (= lt!403514 (ite b!187 (tuple2!22385 Unit!18653 (BitStream!11579 (array!14503 (store (arr!7315 (buf!6850 thiss!914)) (currentByte!12672 thiss!914) ((_ extract 7 0) (bvor ((_ sign_extend 24) (select (arr!7315 (buf!6850 thiss!914)) (currentByte!12672 thiss!914))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12667 thiss!914)))))) (size!6328 (buf!6850 thiss!914))) (currentByte!12672 thiss!914) (currentBit!12667 thiss!914))) (tuple2!22385 Unit!18654 (BitStream!11579 (array!14503 (store (arr!7315 (buf!6850 thiss!914)) (currentByte!12672 thiss!914) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!7315 (buf!6850 thiss!914)) (currentByte!12672 thiss!914))) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12667 thiss!914))))))) (size!6328 (buf!6850 thiss!914))) (currentByte!12672 thiss!914) (currentBit!12667 thiss!914)))))))

(assert (= (and start!56986 res!218919) b!261548))

(assert (= (and b!261548 res!218918) b!261545))

(assert (= (and b!261545 res!218917) b!261547))

(assert (= (and b!261547 res!218921) b!261543))

(assert (= (and b!261543 res!218920) b!261544))

(assert (= start!56986 b!261546))

(declare-fun m!391435 () Bool)

(assert (=> b!261546 m!391435))

(declare-fun m!391437 () Bool)

(assert (=> b!261544 m!391437))

(declare-fun m!391439 () Bool)

(assert (=> b!261547 m!391439))

(declare-fun m!391441 () Bool)

(assert (=> start!56986 m!391441))

(declare-fun m!391443 () Bool)

(assert (=> start!56986 m!391443))

(declare-fun m!391445 () Bool)

(assert (=> b!261543 m!391445))

(assert (=> b!261543 m!391445))

(declare-fun m!391447 () Bool)

(assert (=> b!261543 m!391447))

(declare-fun m!391449 () Bool)

(assert (=> b!261545 m!391449))

(declare-fun m!391451 () Bool)

(assert (=> b!261545 m!391451))

(declare-fun m!391453 () Bool)

(assert (=> b!261548 m!391453))

(declare-fun m!391455 () Bool)

(assert (=> b!261548 m!391455))

(declare-fun m!391457 () Bool)

(assert (=> b!261548 m!391457))

(declare-fun m!391459 () Bool)

(assert (=> b!261548 m!391459))

(declare-fun m!391461 () Bool)

(assert (=> b!261548 m!391461))

(declare-fun m!391463 () Bool)

(assert (=> b!261548 m!391463))

(declare-fun m!391465 () Bool)

(assert (=> b!261548 m!391465))

(declare-fun m!391467 () Bool)

(assert (=> b!261548 m!391467))

(declare-fun m!391469 () Bool)

(assert (=> b!261548 m!391469))

(assert (=> b!261548 m!391467))

(push 1)

(assert (not start!56986))

(assert (not b!261546))

(assert (not b!261544))

(assert (not b!261548))

(assert (not b!261543))

(assert (not b!261545))

(assert (not b!261547))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!88174 () Bool)

(declare-datatypes ((tuple2!22394 0))(
  ( (tuple2!22395 (_1!12133 Bool) (_2!12133 BitStream!11578)) )
))
(declare-fun lt!403553 () tuple2!22394)

(declare-fun readBit!0 (BitStream!11578) tuple2!22394)

(assert (=> d!88174 (= lt!403553 (readBit!0 (readerFrom!0 (_2!12128 lt!403512) (currentBit!12667 thiss!914) (currentByte!12672 thiss!914))))))

(assert (=> d!88174 (= (readBitPure!0 (readerFrom!0 (_2!12128 lt!403512) (currentBit!12667 thiss!914) (currentByte!12672 thiss!914))) (tuple2!22383 (_2!12133 lt!403553) (_1!12133 lt!403553)))))

(declare-fun bs!22350 () Bool)

(assert (= bs!22350 d!88174))

(assert (=> bs!22350 m!391445))

(declare-fun m!391543 () Bool)

(assert (=> bs!22350 m!391543))

(assert (=> b!261543 d!88174))

(declare-fun d!88176 () Bool)

(declare-fun e!182044 () Bool)

(assert (=> d!88176 e!182044))

(declare-fun res!218955 () Bool)

(assert (=> d!88176 (=> (not res!218955) (not e!182044))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!88176 (= res!218955 (invariant!0 (currentBit!12667 (_2!12128 lt!403512)) (currentByte!12672 (_2!12128 lt!403512)) (size!6328 (buf!6850 (_2!12128 lt!403512)))))))

(assert (=> d!88176 (= (readerFrom!0 (_2!12128 lt!403512) (currentBit!12667 thiss!914) (currentByte!12672 thiss!914)) (BitStream!11579 (buf!6850 (_2!12128 lt!403512)) (currentByte!12672 thiss!914) (currentBit!12667 thiss!914)))))

(declare-fun b!261587 () Bool)

(assert (=> b!261587 (= e!182044 (invariant!0 (currentBit!12667 thiss!914) (currentByte!12672 thiss!914) (size!6328 (buf!6850 (_2!12128 lt!403512)))))))

(assert (= (and d!88176 res!218955) b!261587))

(declare-fun m!391545 () Bool)

(assert (=> d!88176 m!391545))

(declare-fun m!391547 () Bool)

(assert (=> b!261587 m!391547))

(assert (=> b!261543 d!88176))

(declare-fun d!88178 () Bool)

(declare-fun e!182052 () Bool)

(assert (=> d!88178 e!182052))

(declare-fun res!218971 () Bool)

(assert (=> d!88178 (=> (not res!218971) (not e!182052))))

(declare-fun lt!403599 () (_ BitVec 64))

(declare-fun lt!403597 () (_ BitVec 64))

(declare-fun lt!403598 () (_ BitVec 64))

(assert (=> d!88178 (= res!218971 (= lt!403599 (bvsub lt!403597 lt!403598)))))

(assert (=> d!88178 (or (= (bvand lt!403597 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!403598 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!403597 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!403597 lt!403598) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!88178 (= lt!403598 (remainingBits!0 ((_ sign_extend 32) (size!6328 (buf!6850 (_1!12127 lt!403510)))) ((_ sign_extend 32) (currentByte!12672 (_1!12127 lt!403510))) ((_ sign_extend 32) (currentBit!12667 (_1!12127 lt!403510)))))))

(declare-fun lt!403600 () (_ BitVec 64))

(declare-fun lt!403596 () (_ BitVec 64))

(assert (=> d!88178 (= lt!403597 (bvmul lt!403600 lt!403596))))

(assert (=> d!88178 (or (= lt!403600 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!403596 (bvsdiv (bvmul lt!403600 lt!403596) lt!403600)))))

(assert (=> d!88178 (= lt!403596 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!88178 (= lt!403600 ((_ sign_extend 32) (size!6328 (buf!6850 (_1!12127 lt!403510)))))))

(assert (=> d!88178 (= lt!403599 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12672 (_1!12127 lt!403510))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12667 (_1!12127 lt!403510)))))))

(assert (=> d!88178 (invariant!0 (currentBit!12667 (_1!12127 lt!403510)) (currentByte!12672 (_1!12127 lt!403510)) (size!6328 (buf!6850 (_1!12127 lt!403510))))))

(assert (=> d!88178 (= (bitIndex!0 (size!6328 (buf!6850 (_1!12127 lt!403510))) (currentByte!12672 (_1!12127 lt!403510)) (currentBit!12667 (_1!12127 lt!403510))) lt!403599)))

(declare-fun b!261602 () Bool)

(declare-fun res!218970 () Bool)

(assert (=> b!261602 (=> (not res!218970) (not e!182052))))

(assert (=> b!261602 (= res!218970 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!403599))))

(declare-fun b!261603 () Bool)

(declare-fun lt!403601 () (_ BitVec 64))

(assert (=> b!261603 (= e!182052 (bvsle lt!403599 (bvmul lt!403601 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!261603 (or (= lt!403601 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!403601 #b0000000000000000000000000000000000000000000000000000000000001000) lt!403601)))))

(assert (=> b!261603 (= lt!403601 ((_ sign_extend 32) (size!6328 (buf!6850 (_1!12127 lt!403510)))))))

(assert (= (and d!88178 res!218971) b!261602))

(assert (= (and b!261602 res!218970) b!261603))

(declare-fun m!391561 () Bool)

(assert (=> d!88178 m!391561))

(declare-fun m!391563 () Bool)

(assert (=> d!88178 m!391563))

(assert (=> b!261544 d!88178))

(declare-fun d!88192 () Bool)

(declare-fun e!182053 () Bool)

(assert (=> d!88192 e!182053))

(declare-fun res!218973 () Bool)

(assert (=> d!88192 (=> (not res!218973) (not e!182053))))

(declare-fun lt!403603 () (_ BitVec 64))

(declare-fun lt!403605 () (_ BitVec 64))

(declare-fun lt!403604 () (_ BitVec 64))

(assert (=> d!88192 (= res!218973 (= lt!403605 (bvsub lt!403603 lt!403604)))))

(assert (=> d!88192 (or (= (bvand lt!403603 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!403604 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!403603 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!403603 lt!403604) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!88192 (= lt!403604 (remainingBits!0 ((_ sign_extend 32) (size!6328 (buf!6850 (_2!12128 lt!403512)))) ((_ sign_extend 32) (currentByte!12672 (_2!12128 lt!403512))) ((_ sign_extend 32) (currentBit!12667 (_2!12128 lt!403512)))))))

(declare-fun lt!403606 () (_ BitVec 64))

(declare-fun lt!403602 () (_ BitVec 64))

(assert (=> d!88192 (= lt!403603 (bvmul lt!403606 lt!403602))))

(assert (=> d!88192 (or (= lt!403606 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!403602 (bvsdiv (bvmul lt!403606 lt!403602) lt!403606)))))

(assert (=> d!88192 (= lt!403602 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!88192 (= lt!403606 ((_ sign_extend 32) (size!6328 (buf!6850 (_2!12128 lt!403512)))))))

(assert (=> d!88192 (= lt!403605 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12672 (_2!12128 lt!403512))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12667 (_2!12128 lt!403512)))))))

(assert (=> d!88192 (invariant!0 (currentBit!12667 (_2!12128 lt!403512)) (currentByte!12672 (_2!12128 lt!403512)) (size!6328 (buf!6850 (_2!12128 lt!403512))))))

(assert (=> d!88192 (= (bitIndex!0 (size!6328 (buf!6850 (_2!12128 lt!403512))) (currentByte!12672 (_2!12128 lt!403512)) (currentBit!12667 (_2!12128 lt!403512))) lt!403605)))

(declare-fun b!261604 () Bool)

(declare-fun res!218972 () Bool)

(assert (=> b!261604 (=> (not res!218972) (not e!182053))))

(assert (=> b!261604 (= res!218972 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!403605))))

(declare-fun b!261605 () Bool)

(declare-fun lt!403607 () (_ BitVec 64))

(assert (=> b!261605 (= e!182053 (bvsle lt!403605 (bvmul lt!403607 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!261605 (or (= lt!403607 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!403607 #b0000000000000000000000000000000000000000000000000000000000001000) lt!403607)))))

(assert (=> b!261605 (= lt!403607 ((_ sign_extend 32) (size!6328 (buf!6850 (_2!12128 lt!403512)))))))

(assert (= (and d!88192 res!218973) b!261604))

(assert (= (and b!261604 res!218972) b!261605))

(declare-fun m!391565 () Bool)

(assert (=> d!88192 m!391565))

(assert (=> d!88192 m!391545))

(assert (=> b!261545 d!88192))

(declare-fun d!88194 () Bool)

(declare-fun e!182054 () Bool)

(assert (=> d!88194 e!182054))

(declare-fun res!218975 () Bool)

(assert (=> d!88194 (=> (not res!218975) (not e!182054))))

(declare-fun lt!403610 () (_ BitVec 64))

(declare-fun lt!403611 () (_ BitVec 64))

(declare-fun lt!403609 () (_ BitVec 64))

(assert (=> d!88194 (= res!218975 (= lt!403611 (bvsub lt!403609 lt!403610)))))

(assert (=> d!88194 (or (= (bvand lt!403609 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!403610 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!403609 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!403609 lt!403610) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!88194 (= lt!403610 (remainingBits!0 ((_ sign_extend 32) (size!6328 (buf!6850 thiss!914))) ((_ sign_extend 32) (currentByte!12672 thiss!914)) ((_ sign_extend 32) (currentBit!12667 thiss!914))))))

(declare-fun lt!403612 () (_ BitVec 64))

(declare-fun lt!403608 () (_ BitVec 64))

(assert (=> d!88194 (= lt!403609 (bvmul lt!403612 lt!403608))))

(assert (=> d!88194 (or (= lt!403612 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!403608 (bvsdiv (bvmul lt!403612 lt!403608) lt!403612)))))

(assert (=> d!88194 (= lt!403608 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!88194 (= lt!403612 ((_ sign_extend 32) (size!6328 (buf!6850 thiss!914))))))

(assert (=> d!88194 (= lt!403611 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12672 thiss!914)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12667 thiss!914))))))

(assert (=> d!88194 (invariant!0 (currentBit!12667 thiss!914) (currentByte!12672 thiss!914) (size!6328 (buf!6850 thiss!914)))))

(assert (=> d!88194 (= (bitIndex!0 (size!6328 (buf!6850 thiss!914)) (currentByte!12672 thiss!914) (currentBit!12667 thiss!914)) lt!403611)))

(declare-fun b!261606 () Bool)

(declare-fun res!218974 () Bool)

(assert (=> b!261606 (=> (not res!218974) (not e!182054))))

(assert (=> b!261606 (= res!218974 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!403611))))

(declare-fun b!261607 () Bool)

(declare-fun lt!403613 () (_ BitVec 64))

(assert (=> b!261607 (= e!182054 (bvsle lt!403611 (bvmul lt!403613 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!261607 (or (= lt!403613 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!403613 #b0000000000000000000000000000000000000000000000000000000000001000) lt!403613)))))

(assert (=> b!261607 (= lt!403613 ((_ sign_extend 32) (size!6328 (buf!6850 thiss!914))))))

(assert (= (and d!88194 res!218975) b!261606))

(assert (= (and b!261606 res!218974) b!261607))

(declare-fun m!391567 () Bool)

(assert (=> d!88194 m!391567))

(declare-fun m!391569 () Bool)

(assert (=> d!88194 m!391569))

(assert (=> b!261545 d!88194))

(declare-fun d!88196 () Bool)

(assert (=> d!88196 (= (array_inv!6069 (buf!6850 thiss!914)) (bvsge (size!6328 (buf!6850 thiss!914)) #b00000000000000000000000000000000))))

(assert (=> b!261546 d!88196))

(declare-fun d!88198 () Bool)

(assert (=> d!88198 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6328 (buf!6850 thiss!914))) ((_ sign_extend 32) (currentByte!12672 thiss!914)) ((_ sign_extend 32) (currentBit!12667 thiss!914))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6328 (buf!6850 thiss!914))) ((_ sign_extend 32) (currentByte!12672 thiss!914)) ((_ sign_extend 32) (currentBit!12667 thiss!914))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!22353 () Bool)

(assert (= bs!22353 d!88198))

(assert (=> bs!22353 m!391567))

(assert (=> start!56986 d!88198))

(declare-fun d!88200 () Bool)

(assert (=> d!88200 (= (inv!12 thiss!914) (invariant!0 (currentBit!12667 thiss!914) (currentByte!12672 thiss!914) (size!6328 (buf!6850 thiss!914))))))

(declare-fun bs!22354 () Bool)

(assert (= bs!22354 d!88200))

(assert (=> bs!22354 m!391569))

(assert (=> start!56986 d!88200))

(declare-fun d!88202 () Bool)

(declare-fun res!218982 () Bool)

(declare-fun e!182059 () Bool)

(assert (=> d!88202 (=> (not res!218982) (not e!182059))))

(assert (=> d!88202 (= res!218982 (= (size!6328 (buf!6850 thiss!914)) (size!6328 (buf!6850 (_2!12128 lt!403512)))))))

(assert (=> d!88202 (= (isPrefixOf!0 thiss!914 (_2!12128 lt!403512)) e!182059)))

(declare-fun b!261614 () Bool)

(declare-fun res!218984 () Bool)

(assert (=> b!261614 (=> (not res!218984) (not e!182059))))

(assert (=> b!261614 (= res!218984 (bvsle (bitIndex!0 (size!6328 (buf!6850 thiss!914)) (currentByte!12672 thiss!914) (currentBit!12667 thiss!914)) (bitIndex!0 (size!6328 (buf!6850 (_2!12128 lt!403512))) (currentByte!12672 (_2!12128 lt!403512)) (currentBit!12667 (_2!12128 lt!403512)))))))

(declare-fun b!261615 () Bool)

(declare-fun e!182060 () Bool)

(assert (=> b!261615 (= e!182059 e!182060)))

(declare-fun res!218983 () Bool)

(assert (=> b!261615 (=> res!218983 e!182060)))

(assert (=> b!261615 (= res!218983 (= (size!6328 (buf!6850 thiss!914)) #b00000000000000000000000000000000))))

(declare-fun b!261616 () Bool)

(declare-fun arrayBitRangesEq!0 (array!14502 array!14502 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!261616 (= e!182060 (arrayBitRangesEq!0 (buf!6850 thiss!914) (buf!6850 (_2!12128 lt!403512)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6328 (buf!6850 thiss!914)) (currentByte!12672 thiss!914) (currentBit!12667 thiss!914))))))

(assert (= (and d!88202 res!218982) b!261614))

(assert (= (and b!261614 res!218984) b!261615))

(assert (= (and b!261615 (not res!218983)) b!261616))

(assert (=> b!261614 m!391451))

(assert (=> b!261614 m!391449))

(assert (=> b!261616 m!391451))

(assert (=> b!261616 m!391451))

(declare-fun m!391573 () Bool)

(assert (=> b!261616 m!391573))

(assert (=> b!261547 d!88202))

(declare-fun d!88210 () Bool)

(declare-fun e!182083 () Bool)

(assert (=> d!88210 e!182083))

(declare-fun res!219019 () Bool)

(assert (=> d!88210 (=> (not res!219019) (not e!182083))))

(declare-fun lt!403667 () (_ BitVec 64))

(declare-fun lt!403664 () tuple2!22384)

(declare-fun lt!403665 () (_ BitVec 64))

(assert (=> d!88210 (= res!219019 (= (bvadd lt!403665 lt!403667) (bitIndex!0 (size!6328 (buf!6850 (_2!12128 lt!403664))) (currentByte!12672 (_2!12128 lt!403664)) (currentBit!12667 (_2!12128 lt!403664)))))))

(assert (=> d!88210 (or (not (= (bvand lt!403665 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!403667 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!403665 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!403665 lt!403667) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!88210 (= lt!403667 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!88210 (= lt!403665 (bitIndex!0 (size!6328 (buf!6850 (_2!12128 lt!403514))) (currentByte!12672 (_2!12128 lt!403514)) (currentBit!12667 (_2!12128 lt!403514))))))

(declare-fun Unit!18665 () Unit!18651)

(declare-fun Unit!18666 () Unit!18651)

(assert (=> d!88210 (= lt!403664 (ite (bvslt (currentBit!12667 (_2!12128 lt!403514)) #b00000000000000000000000000000111) (tuple2!22385 Unit!18665 (BitStream!11579 (buf!6850 (_2!12128 lt!403514)) (currentByte!12672 (_2!12128 lt!403514)) (bvadd (currentBit!12667 (_2!12128 lt!403514)) #b00000000000000000000000000000001))) (tuple2!22385 Unit!18666 (BitStream!11579 (buf!6850 (_2!12128 lt!403514)) (bvadd (currentByte!12672 (_2!12128 lt!403514)) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (=> d!88210 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!6328 (buf!6850 (_2!12128 lt!403514)))) ((_ sign_extend 32) (currentByte!12672 (_2!12128 lt!403514))) ((_ sign_extend 32) (currentBit!12667 (_2!12128 lt!403514)))) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!88210 (= (increaseBitIndex!0 (_2!12128 lt!403514)) lt!403664)))

(declare-fun b!261649 () Bool)

(declare-fun res!219018 () Bool)

(assert (=> b!261649 (=> (not res!219018) (not e!182083))))

(declare-fun lt!403663 () (_ BitVec 64))

(declare-fun lt!403666 () (_ BitVec 64))

(assert (=> b!261649 (= res!219018 (= (bvsub lt!403663 lt!403666) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!261649 (or (= (bvand lt!403663 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!403666 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!403663 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!403663 lt!403666) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!261649 (= lt!403666 (remainingBits!0 ((_ sign_extend 32) (size!6328 (buf!6850 (_2!12128 lt!403664)))) ((_ sign_extend 32) (currentByte!12672 (_2!12128 lt!403664))) ((_ sign_extend 32) (currentBit!12667 (_2!12128 lt!403664)))))))

(assert (=> b!261649 (= lt!403663 (remainingBits!0 ((_ sign_extend 32) (size!6328 (buf!6850 (_2!12128 lt!403514)))) ((_ sign_extend 32) (currentByte!12672 (_2!12128 lt!403514))) ((_ sign_extend 32) (currentBit!12667 (_2!12128 lt!403514)))))))

(declare-fun b!261650 () Bool)

(assert (=> b!261650 (= e!182083 (= (size!6328 (buf!6850 (_2!12128 lt!403514))) (size!6328 (buf!6850 (_2!12128 lt!403664)))))))

(assert (= (and d!88210 res!219019) b!261649))

(assert (= (and b!261649 res!219018) b!261650))

(declare-fun m!391603 () Bool)

(assert (=> d!88210 m!391603))

(declare-fun m!391605 () Bool)

(assert (=> d!88210 m!391605))

(declare-fun m!391607 () Bool)

(assert (=> d!88210 m!391607))

(declare-fun m!391609 () Bool)

(assert (=> b!261649 m!391609))

(assert (=> b!261649 m!391607))

(assert (=> b!261548 d!88210))

(declare-fun d!88226 () Bool)

(declare-fun res!219035 () Bool)

(declare-fun e!182096 () Bool)

(assert (=> d!88226 (=> res!219035 e!182096)))

(assert (=> d!88226 (= res!219035 (= #b00000000000000000000000000000000 (currentByte!12672 (_2!12128 lt!403514))))))

(assert (=> d!88226 (= (arrayRangesEq!953 (buf!6850 thiss!914) (array!14503 (store (arr!7315 (buf!6850 thiss!914)) (currentByte!12672 (_2!12128 lt!403514)) (select (arr!7315 (buf!6850 (_2!12128 lt!403514))) (currentByte!12672 (_2!12128 lt!403514)))) (size!6328 (buf!6850 thiss!914))) #b00000000000000000000000000000000 (currentByte!12672 (_2!12128 lt!403514))) e!182096)))

(declare-fun b!261666 () Bool)

(declare-fun e!182097 () Bool)

(assert (=> b!261666 (= e!182096 e!182097)))

(declare-fun res!219036 () Bool)

(assert (=> b!261666 (=> (not res!219036) (not e!182097))))

(assert (=> b!261666 (= res!219036 (= (select (arr!7315 (buf!6850 thiss!914)) #b00000000000000000000000000000000) (select (arr!7315 (array!14503 (store (arr!7315 (buf!6850 thiss!914)) (currentByte!12672 (_2!12128 lt!403514)) (select (arr!7315 (buf!6850 (_2!12128 lt!403514))) (currentByte!12672 (_2!12128 lt!403514)))) (size!6328 (buf!6850 thiss!914)))) #b00000000000000000000000000000000)))))

(declare-fun b!261667 () Bool)

(assert (=> b!261667 (= e!182097 (arrayRangesEq!953 (buf!6850 thiss!914) (array!14503 (store (arr!7315 (buf!6850 thiss!914)) (currentByte!12672 (_2!12128 lt!403514)) (select (arr!7315 (buf!6850 (_2!12128 lt!403514))) (currentByte!12672 (_2!12128 lt!403514)))) (size!6328 (buf!6850 thiss!914))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12672 (_2!12128 lt!403514))))))

(assert (= (and d!88226 (not res!219035)) b!261666))

(assert (= (and b!261666 res!219036) b!261667))

(declare-fun m!391613 () Bool)

(assert (=> b!261666 m!391613))

(declare-fun m!391615 () Bool)

(assert (=> b!261666 m!391615))

(declare-fun m!391617 () Bool)

(assert (=> b!261667 m!391617))

(assert (=> b!261548 d!88226))

(declare-fun d!88230 () Bool)

(declare-fun e!182107 () Bool)

(assert (=> d!88230 e!182107))

(declare-fun res!219050 () Bool)

(assert (=> d!88230 (=> (not res!219050) (not e!182107))))

(assert (=> d!88230 (= res!219050 (and (bvsge (currentByte!12672 (_2!12128 lt!403514)) #b00000000000000000000000000000000) (bvslt (currentByte!12672 (_2!12128 lt!403514)) (size!6328 (buf!6850 thiss!914)))))))

(declare-fun lt!403685 () Unit!18651)

(declare-fun choose!364 (array!14502 (_ BitVec 32) (_ BitVec 8)) Unit!18651)

(assert (=> d!88230 (= lt!403685 (choose!364 (buf!6850 thiss!914) (currentByte!12672 (_2!12128 lt!403514)) (select (arr!7315 (buf!6850 (_2!12128 lt!403514))) (currentByte!12672 (_2!12128 lt!403514)))))))

(assert (=> d!88230 (and (bvsle #b00000000000000000000000000000000 (currentByte!12672 (_2!12128 lt!403514))) (bvslt (currentByte!12672 (_2!12128 lt!403514)) (size!6328 (buf!6850 thiss!914))))))

(assert (=> d!88230 (= (arrayUpdatedAtPrefixLemma!469 (buf!6850 thiss!914) (currentByte!12672 (_2!12128 lt!403514)) (select (arr!7315 (buf!6850 (_2!12128 lt!403514))) (currentByte!12672 (_2!12128 lt!403514)))) lt!403685)))

(declare-fun b!261680 () Bool)

(assert (=> b!261680 (= e!182107 (arrayRangesEq!953 (buf!6850 thiss!914) (array!14503 (store (arr!7315 (buf!6850 thiss!914)) (currentByte!12672 (_2!12128 lt!403514)) (select (arr!7315 (buf!6850 (_2!12128 lt!403514))) (currentByte!12672 (_2!12128 lt!403514)))) (size!6328 (buf!6850 thiss!914))) #b00000000000000000000000000000000 (currentByte!12672 (_2!12128 lt!403514))))))

(assert (= (and d!88230 res!219050) b!261680))

(assert (=> d!88230 m!391467))

(declare-fun m!391627 () Bool)

(assert (=> d!88230 m!391627))

(assert (=> b!261680 m!391459))

(assert (=> b!261680 m!391453))

(assert (=> b!261548 d!88230))

(push 1)

(assert (not d!88194))

(assert (not d!88178))

(assert (not d!88176))

(assert (not d!88200))

(assert (not b!261667))

(assert (not d!88210))

(assert (not b!261649))

(assert (not b!261680))

(assert (not b!261614))

(assert (not b!261587))

(assert (not b!261616))

(assert (not d!88230))

(assert (not d!88192))

(assert (not d!88174))

(assert (not d!88198))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!88274 () Bool)

(assert (=> d!88274 (= (remainingBits!0 ((_ sign_extend 32) (size!6328 (buf!6850 thiss!914))) ((_ sign_extend 32) (currentByte!12672 thiss!914)) ((_ sign_extend 32) (currentBit!12667 thiss!914))) (bvsub (bvmul ((_ sign_extend 32) (size!6328 (buf!6850 thiss!914))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12672 thiss!914)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12667 thiss!914)))))))

(assert (=> d!88194 d!88274))

(declare-fun d!88276 () Bool)

(assert (=> d!88276 (= (invariant!0 (currentBit!12667 thiss!914) (currentByte!12672 thiss!914) (size!6328 (buf!6850 thiss!914))) (and (bvsge (currentBit!12667 thiss!914) #b00000000000000000000000000000000) (bvslt (currentBit!12667 thiss!914) #b00000000000000000000000000001000) (bvsge (currentByte!12672 thiss!914) #b00000000000000000000000000000000) (or (bvslt (currentByte!12672 thiss!914) (size!6328 (buf!6850 thiss!914))) (and (= (currentBit!12667 thiss!914) #b00000000000000000000000000000000) (= (currentByte!12672 thiss!914) (size!6328 (buf!6850 thiss!914)))))))))

(assert (=> d!88194 d!88276))

(assert (=> d!88198 d!88274))

(declare-fun d!88278 () Bool)

(declare-fun e!182149 () Bool)

(assert (=> d!88278 e!182149))

(declare-fun res!219091 () Bool)

(assert (=> d!88278 (=> (not res!219091) (not e!182149))))

(declare-fun lt!403747 () (_ BitVec 64))

(declare-fun lt!403749 () (_ BitVec 64))

(declare-fun lt!403748 () (_ BitVec 64))

(assert (=> d!88278 (= res!219091 (= lt!403749 (bvsub lt!403747 lt!403748)))))

(assert (=> d!88278 (or (= (bvand lt!403747 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!403748 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!403747 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!403747 lt!403748) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!88278 (= lt!403748 (remainingBits!0 ((_ sign_extend 32) (size!6328 (buf!6850 (_2!12128 lt!403664)))) ((_ sign_extend 32) (currentByte!12672 (_2!12128 lt!403664))) ((_ sign_extend 32) (currentBit!12667 (_2!12128 lt!403664)))))))

(declare-fun lt!403750 () (_ BitVec 64))

(declare-fun lt!403746 () (_ BitVec 64))

(assert (=> d!88278 (= lt!403747 (bvmul lt!403750 lt!403746))))

(assert (=> d!88278 (or (= lt!403750 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!403746 (bvsdiv (bvmul lt!403750 lt!403746) lt!403750)))))

(assert (=> d!88278 (= lt!403746 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!88278 (= lt!403750 ((_ sign_extend 32) (size!6328 (buf!6850 (_2!12128 lt!403664)))))))

(assert (=> d!88278 (= lt!403749 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12672 (_2!12128 lt!403664))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12667 (_2!12128 lt!403664)))))))

(assert (=> d!88278 (invariant!0 (currentBit!12667 (_2!12128 lt!403664)) (currentByte!12672 (_2!12128 lt!403664)) (size!6328 (buf!6850 (_2!12128 lt!403664))))))

(assert (=> d!88278 (= (bitIndex!0 (size!6328 (buf!6850 (_2!12128 lt!403664))) (currentByte!12672 (_2!12128 lt!403664)) (currentBit!12667 (_2!12128 lt!403664))) lt!403749)))

(declare-fun b!261726 () Bool)

(declare-fun res!219090 () Bool)

(assert (=> b!261726 (=> (not res!219090) (not e!182149))))

(assert (=> b!261726 (= res!219090 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!403749))))

(declare-fun b!261727 () Bool)

(declare-fun lt!403751 () (_ BitVec 64))

(assert (=> b!261727 (= e!182149 (bvsle lt!403749 (bvmul lt!403751 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!261727 (or (= lt!403751 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!403751 #b0000000000000000000000000000000000000000000000000000000000001000) lt!403751)))))

(assert (=> b!261727 (= lt!403751 ((_ sign_extend 32) (size!6328 (buf!6850 (_2!12128 lt!403664)))))))

(assert (= (and d!88278 res!219091) b!261726))

(assert (= (and b!261726 res!219090) b!261727))

(assert (=> d!88278 m!391609))

(declare-fun m!391683 () Bool)

(assert (=> d!88278 m!391683))

(assert (=> d!88210 d!88278))

(declare-fun d!88280 () Bool)

(declare-fun e!182150 () Bool)

(assert (=> d!88280 e!182150))

(declare-fun res!219093 () Bool)

(assert (=> d!88280 (=> (not res!219093) (not e!182150))))

(declare-fun lt!403755 () (_ BitVec 64))

(declare-fun lt!403753 () (_ BitVec 64))

(declare-fun lt!403754 () (_ BitVec 64))

(assert (=> d!88280 (= res!219093 (= lt!403755 (bvsub lt!403753 lt!403754)))))

(assert (=> d!88280 (or (= (bvand lt!403753 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!403754 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!403753 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!403753 lt!403754) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!88280 (= lt!403754 (remainingBits!0 ((_ sign_extend 32) (size!6328 (buf!6850 (_2!12128 lt!403514)))) ((_ sign_extend 32) (currentByte!12672 (_2!12128 lt!403514))) ((_ sign_extend 32) (currentBit!12667 (_2!12128 lt!403514)))))))

(declare-fun lt!403756 () (_ BitVec 64))

(declare-fun lt!403752 () (_ BitVec 64))

(assert (=> d!88280 (= lt!403753 (bvmul lt!403756 lt!403752))))

(assert (=> d!88280 (or (= lt!403756 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!403752 (bvsdiv (bvmul lt!403756 lt!403752) lt!403756)))))

(assert (=> d!88280 (= lt!403752 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!88280 (= lt!403756 ((_ sign_extend 32) (size!6328 (buf!6850 (_2!12128 lt!403514)))))))

(assert (=> d!88280 (= lt!403755 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12672 (_2!12128 lt!403514))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12667 (_2!12128 lt!403514)))))))

(assert (=> d!88280 (invariant!0 (currentBit!12667 (_2!12128 lt!403514)) (currentByte!12672 (_2!12128 lt!403514)) (size!6328 (buf!6850 (_2!12128 lt!403514))))))

(assert (=> d!88280 (= (bitIndex!0 (size!6328 (buf!6850 (_2!12128 lt!403514))) (currentByte!12672 (_2!12128 lt!403514)) (currentBit!12667 (_2!12128 lt!403514))) lt!403755)))

(declare-fun b!261728 () Bool)

(declare-fun res!219092 () Bool)

(assert (=> b!261728 (=> (not res!219092) (not e!182150))))

(assert (=> b!261728 (= res!219092 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!403755))))

(declare-fun b!261729 () Bool)

(declare-fun lt!403757 () (_ BitVec 64))

(assert (=> b!261729 (= e!182150 (bvsle lt!403755 (bvmul lt!403757 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!261729 (or (= lt!403757 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!403757 #b0000000000000000000000000000000000000000000000000000000000001000) lt!403757)))))

(assert (=> b!261729 (= lt!403757 ((_ sign_extend 32) (size!6328 (buf!6850 (_2!12128 lt!403514)))))))

(assert (= (and d!88280 res!219093) b!261728))

(assert (= (and b!261728 res!219092) b!261729))

(assert (=> d!88280 m!391607))

(declare-fun m!391685 () Bool)

(assert (=> d!88280 m!391685))

(assert (=> d!88210 d!88280))

(declare-fun d!88282 () Bool)

(assert (=> d!88282 (= (remainingBits!0 ((_ sign_extend 32) (size!6328 (buf!6850 (_2!12128 lt!403514)))) ((_ sign_extend 32) (currentByte!12672 (_2!12128 lt!403514))) ((_ sign_extend 32) (currentBit!12667 (_2!12128 lt!403514)))) (bvsub (bvmul ((_ sign_extend 32) (size!6328 (buf!6850 (_2!12128 lt!403514)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12672 (_2!12128 lt!403514))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12667 (_2!12128 lt!403514))))))))

(assert (=> d!88210 d!88282))

(declare-fun d!88284 () Bool)

(assert (=> d!88284 (arrayRangesEq!953 (buf!6850 thiss!914) (array!14503 (store (arr!7315 (buf!6850 thiss!914)) (currentByte!12672 (_2!12128 lt!403514)) (select (arr!7315 (buf!6850 (_2!12128 lt!403514))) (currentByte!12672 (_2!12128 lt!403514)))) (size!6328 (buf!6850 thiss!914))) #b00000000000000000000000000000000 (currentByte!12672 (_2!12128 lt!403514)))))

(assert (=> d!88284 true))

(declare-fun _$8!226 () Unit!18651)

(assert (=> d!88284 (= (choose!364 (buf!6850 thiss!914) (currentByte!12672 (_2!12128 lt!403514)) (select (arr!7315 (buf!6850 (_2!12128 lt!403514))) (currentByte!12672 (_2!12128 lt!403514)))) _$8!226)))

(declare-fun bs!22360 () Bool)

(assert (= bs!22360 d!88284))

(assert (=> bs!22360 m!391459))

(assert (=> bs!22360 m!391453))

(assert (=> d!88230 d!88284))

(declare-fun b!261744 () Bool)

(declare-fun res!219108 () Bool)

(declare-fun lt!403766 () (_ BitVec 32))

(assert (=> b!261744 (= res!219108 (= lt!403766 #b00000000000000000000000000000000))))

(declare-fun e!182165 () Bool)

(assert (=> b!261744 (=> res!219108 e!182165)))

(declare-fun e!182166 () Bool)

(assert (=> b!261744 (= e!182166 e!182165)))

(declare-fun b!261745 () Bool)

(declare-fun e!182163 () Bool)

(declare-fun e!182164 () Bool)

(assert (=> b!261745 (= e!182163 e!182164)))

(declare-fun c!11991 () Bool)

(declare-datatypes ((tuple4!314 0))(
  ( (tuple4!315 (_1!12137 (_ BitVec 32)) (_2!12137 (_ BitVec 32)) (_3!937 (_ BitVec 32)) (_4!157 (_ BitVec 32))) )
))
(declare-fun lt!403764 () tuple4!314)

(assert (=> b!261745 (= c!11991 (= (_3!937 lt!403764) (_4!157 lt!403764)))))

(declare-fun e!182168 () Bool)

(declare-fun b!261746 () Bool)

(assert (=> b!261746 (= e!182168 (arrayRangesEq!953 (buf!6850 thiss!914) (buf!6850 (_2!12128 lt!403512)) (_1!12137 lt!403764) (_2!12137 lt!403764)))))

(declare-fun d!88286 () Bool)

(declare-fun res!219107 () Bool)

(declare-fun e!182167 () Bool)

(assert (=> d!88286 (=> res!219107 e!182167)))

(assert (=> d!88286 (= res!219107 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6328 (buf!6850 thiss!914)) (currentByte!12672 thiss!914) (currentBit!12667 thiss!914))))))

(assert (=> d!88286 (= (arrayBitRangesEq!0 (buf!6850 thiss!914) (buf!6850 (_2!12128 lt!403512)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6328 (buf!6850 thiss!914)) (currentByte!12672 thiss!914) (currentBit!12667 thiss!914))) e!182167)))

(declare-fun b!261747 () Bool)

(assert (=> b!261747 (= e!182164 e!182166)))

(declare-fun lt!403765 () (_ BitVec 32))

(declare-fun res!219106 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!261747 (= res!219106 (byteRangesEq!0 (select (arr!7315 (buf!6850 thiss!914)) (_3!937 lt!403764)) (select (arr!7315 (buf!6850 (_2!12128 lt!403512))) (_3!937 lt!403764)) lt!403765 #b00000000000000000000000000001000))))

(assert (=> b!261747 (=> (not res!219106) (not e!182166))))

(declare-fun b!261748 () Bool)

(declare-fun call!4022 () Bool)

(assert (=> b!261748 (= e!182164 call!4022)))

(declare-fun b!261749 () Bool)

(assert (=> b!261749 (= e!182165 call!4022)))

(declare-fun bm!4019 () Bool)

(assert (=> bm!4019 (= call!4022 (byteRangesEq!0 (ite c!11991 (select (arr!7315 (buf!6850 thiss!914)) (_3!937 lt!403764)) (select (arr!7315 (buf!6850 thiss!914)) (_4!157 lt!403764))) (ite c!11991 (select (arr!7315 (buf!6850 (_2!12128 lt!403512))) (_3!937 lt!403764)) (select (arr!7315 (buf!6850 (_2!12128 lt!403512))) (_4!157 lt!403764))) (ite c!11991 lt!403765 #b00000000000000000000000000000000) lt!403766))))

(declare-fun b!261750 () Bool)

(assert (=> b!261750 (= e!182167 e!182163)))

(declare-fun res!219105 () Bool)

(assert (=> b!261750 (=> (not res!219105) (not e!182163))))

(assert (=> b!261750 (= res!219105 e!182168)))

(declare-fun res!219104 () Bool)

(assert (=> b!261750 (=> res!219104 e!182168)))

(assert (=> b!261750 (= res!219104 (bvsge (_1!12137 lt!403764) (_2!12137 lt!403764)))))

(assert (=> b!261750 (= lt!403766 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6328 (buf!6850 thiss!914)) (currentByte!12672 thiss!914) (currentBit!12667 thiss!914)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!261750 (= lt!403765 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!314)

(assert (=> b!261750 (= lt!403764 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6328 (buf!6850 thiss!914)) (currentByte!12672 thiss!914) (currentBit!12667 thiss!914))))))

(assert (= (and d!88286 (not res!219107)) b!261750))

(assert (= (and b!261750 (not res!219104)) b!261746))

(assert (= (and b!261750 res!219105) b!261745))

(assert (= (and b!261745 c!11991) b!261748))

(assert (= (and b!261745 (not c!11991)) b!261747))

(assert (= (and b!261747 res!219106) b!261744))

(assert (= (and b!261744 (not res!219108)) b!261749))

(assert (= (or b!261748 b!261749) bm!4019))

(declare-fun m!391687 () Bool)

(assert (=> b!261746 m!391687))

(declare-fun m!391689 () Bool)

(assert (=> b!261747 m!391689))

(declare-fun m!391691 () Bool)

(assert (=> b!261747 m!391691))

(assert (=> b!261747 m!391689))

(assert (=> b!261747 m!391691))

(declare-fun m!391693 () Bool)

(assert (=> b!261747 m!391693))

(declare-fun m!391695 () Bool)

(assert (=> bm!4019 m!391695))

(assert (=> bm!4019 m!391691))

(assert (=> bm!4019 m!391689))

(declare-fun m!391697 () Bool)

(assert (=> bm!4019 m!391697))

(declare-fun m!391699 () Bool)

(assert (=> bm!4019 m!391699))

(assert (=> b!261750 m!391451))

(declare-fun m!391701 () Bool)

(assert (=> b!261750 m!391701))

(assert (=> b!261616 d!88286))

(assert (=> b!261616 d!88194))

(assert (=> b!261680 d!88226))

(declare-fun d!88288 () Bool)

(assert (=> d!88288 (= (remainingBits!0 ((_ sign_extend 32) (size!6328 (buf!6850 (_1!12127 lt!403510)))) ((_ sign_extend 32) (currentByte!12672 (_1!12127 lt!403510))) ((_ sign_extend 32) (currentBit!12667 (_1!12127 lt!403510)))) (bvsub (bvmul ((_ sign_extend 32) (size!6328 (buf!6850 (_1!12127 lt!403510)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12672 (_1!12127 lt!403510))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12667 (_1!12127 lt!403510))))))))

(assert (=> d!88178 d!88288))

(declare-fun d!88290 () Bool)

(assert (=> d!88290 (= (invariant!0 (currentBit!12667 (_1!12127 lt!403510)) (currentByte!12672 (_1!12127 lt!403510)) (size!6328 (buf!6850 (_1!12127 lt!403510)))) (and (bvsge (currentBit!12667 (_1!12127 lt!403510)) #b00000000000000000000000000000000) (bvslt (currentBit!12667 (_1!12127 lt!403510)) #b00000000000000000000000000001000) (bvsge (currentByte!12672 (_1!12127 lt!403510)) #b00000000000000000000000000000000) (or (bvslt (currentByte!12672 (_1!12127 lt!403510)) (size!6328 (buf!6850 (_1!12127 lt!403510)))) (and (= (currentBit!12667 (_1!12127 lt!403510)) #b00000000000000000000000000000000) (= (currentByte!12672 (_1!12127 lt!403510)) (size!6328 (buf!6850 (_1!12127 lt!403510))))))))))

(assert (=> d!88178 d!88290))

(declare-fun d!88292 () Bool)

(declare-fun e!182175 () Bool)

(assert (=> d!88292 e!182175))

(declare-fun res!219111 () Bool)

(assert (=> d!88292 (=> (not res!219111) (not e!182175))))

(assert (=> d!88292 (= res!219111 (= (buf!6850 (_2!12128 (increaseBitIndex!0 (readerFrom!0 (_2!12128 lt!403512) (currentBit!12667 thiss!914) (currentByte!12672 thiss!914))))) (buf!6850 (readerFrom!0 (_2!12128 lt!403512) (currentBit!12667 thiss!914) (currentByte!12672 thiss!914)))))))

(declare-fun lt!403786 () Bool)

(assert (=> d!88292 (= lt!403786 (not (= (bvand ((_ sign_extend 24) (select (arr!7315 (buf!6850 (readerFrom!0 (_2!12128 lt!403512) (currentBit!12667 thiss!914) (currentByte!12672 thiss!914)))) (currentByte!12672 (readerFrom!0 (_2!12128 lt!403512) (currentBit!12667 thiss!914) (currentByte!12672 thiss!914))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12667 (readerFrom!0 (_2!12128 lt!403512) (currentBit!12667 thiss!914) (currentByte!12672 thiss!914)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!403781 () tuple2!22394)

(assert (=> d!88292 (= lt!403781 (tuple2!22395 (not (= (bvand ((_ sign_extend 24) (select (arr!7315 (buf!6850 (readerFrom!0 (_2!12128 lt!403512) (currentBit!12667 thiss!914) (currentByte!12672 thiss!914)))) (currentByte!12672 (readerFrom!0 (_2!12128 lt!403512) (currentBit!12667 thiss!914) (currentByte!12672 thiss!914))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12667 (readerFrom!0 (_2!12128 lt!403512) (currentBit!12667 thiss!914) (currentByte!12672 thiss!914)))))) #b00000000000000000000000000000000)) (_2!12128 (increaseBitIndex!0 (readerFrom!0 (_2!12128 lt!403512) (currentBit!12667 thiss!914) (currentByte!12672 thiss!914))))))))

(assert (=> d!88292 (validate_offset_bit!0 ((_ sign_extend 32) (size!6328 (buf!6850 (readerFrom!0 (_2!12128 lt!403512) (currentBit!12667 thiss!914) (currentByte!12672 thiss!914))))) ((_ sign_extend 32) (currentByte!12672 (readerFrom!0 (_2!12128 lt!403512) (currentBit!12667 thiss!914) (currentByte!12672 thiss!914)))) ((_ sign_extend 32) (currentBit!12667 (readerFrom!0 (_2!12128 lt!403512) (currentBit!12667 thiss!914) (currentByte!12672 thiss!914)))))))

(assert (=> d!88292 (= (readBit!0 (readerFrom!0 (_2!12128 lt!403512) (currentBit!12667 thiss!914) (currentByte!12672 thiss!914))) lt!403781)))

(declare-fun b!261753 () Bool)

(declare-fun lt!403787 () (_ BitVec 64))

(declare-fun lt!403784 () (_ BitVec 64))

(assert (=> b!261753 (= e!182175 (= (bitIndex!0 (size!6328 (buf!6850 (_2!12128 (increaseBitIndex!0 (readerFrom!0 (_2!12128 lt!403512) (currentBit!12667 thiss!914) (currentByte!12672 thiss!914)))))) (currentByte!12672 (_2!12128 (increaseBitIndex!0 (readerFrom!0 (_2!12128 lt!403512) (currentBit!12667 thiss!914) (currentByte!12672 thiss!914))))) (currentBit!12667 (_2!12128 (increaseBitIndex!0 (readerFrom!0 (_2!12128 lt!403512) (currentBit!12667 thiss!914) (currentByte!12672 thiss!914)))))) (bvadd lt!403784 lt!403787)))))

(assert (=> b!261753 (or (not (= (bvand lt!403784 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!403787 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!403784 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!403784 lt!403787) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!261753 (= lt!403787 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!261753 (= lt!403784 (bitIndex!0 (size!6328 (buf!6850 (readerFrom!0 (_2!12128 lt!403512) (currentBit!12667 thiss!914) (currentByte!12672 thiss!914)))) (currentByte!12672 (readerFrom!0 (_2!12128 lt!403512) (currentBit!12667 thiss!914) (currentByte!12672 thiss!914))) (currentBit!12667 (readerFrom!0 (_2!12128 lt!403512) (currentBit!12667 thiss!914) (currentByte!12672 thiss!914)))))))

(declare-fun lt!403783 () Bool)

(assert (=> b!261753 (= lt!403783 (not (= (bvand ((_ sign_extend 24) (select (arr!7315 (buf!6850 (readerFrom!0 (_2!12128 lt!403512) (currentBit!12667 thiss!914) (currentByte!12672 thiss!914)))) (currentByte!12672 (readerFrom!0 (_2!12128 lt!403512) (currentBit!12667 thiss!914) (currentByte!12672 thiss!914))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12667 (readerFrom!0 (_2!12128 lt!403512) (currentBit!12667 thiss!914) (currentByte!12672 thiss!914)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!403782 () Bool)

(assert (=> b!261753 (= lt!403782 (not (= (bvand ((_ sign_extend 24) (select (arr!7315 (buf!6850 (readerFrom!0 (_2!12128 lt!403512) (currentBit!12667 thiss!914) (currentByte!12672 thiss!914)))) (currentByte!12672 (readerFrom!0 (_2!12128 lt!403512) (currentBit!12667 thiss!914) (currentByte!12672 thiss!914))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12667 (readerFrom!0 (_2!12128 lt!403512) (currentBit!12667 thiss!914) (currentByte!12672 thiss!914)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!403785 () Bool)

(assert (=> b!261753 (= lt!403785 (not (= (bvand ((_ sign_extend 24) (select (arr!7315 (buf!6850 (readerFrom!0 (_2!12128 lt!403512) (currentBit!12667 thiss!914) (currentByte!12672 thiss!914)))) (currentByte!12672 (readerFrom!0 (_2!12128 lt!403512) (currentBit!12667 thiss!914) (currentByte!12672 thiss!914))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12667 (readerFrom!0 (_2!12128 lt!403512) (currentBit!12667 thiss!914) (currentByte!12672 thiss!914)))))) #b00000000000000000000000000000000)))))

(assert (= (and d!88292 res!219111) b!261753))

(assert (=> d!88292 m!391445))

(declare-fun m!391703 () Bool)

(assert (=> d!88292 m!391703))

(declare-fun m!391705 () Bool)

(assert (=> d!88292 m!391705))

(declare-fun m!391707 () Bool)

(assert (=> d!88292 m!391707))

(declare-fun m!391709 () Bool)

(assert (=> d!88292 m!391709))

(assert (=> b!261753 m!391705))

(assert (=> b!261753 m!391445))

(assert (=> b!261753 m!391703))

(declare-fun m!391711 () Bool)

(assert (=> b!261753 m!391711))

(assert (=> b!261753 m!391707))

(declare-fun m!391713 () Bool)

(assert (=> b!261753 m!391713))

(assert (=> d!88174 d!88292))

(declare-fun d!88294 () Bool)

(assert (=> d!88294 (= (invariant!0 (currentBit!12667 (_2!12128 lt!403512)) (currentByte!12672 (_2!12128 lt!403512)) (size!6328 (buf!6850 (_2!12128 lt!403512)))) (and (bvsge (currentBit!12667 (_2!12128 lt!403512)) #b00000000000000000000000000000000) (bvslt (currentBit!12667 (_2!12128 lt!403512)) #b00000000000000000000000000001000) (bvsge (currentByte!12672 (_2!12128 lt!403512)) #b00000000000000000000000000000000) (or (bvslt (currentByte!12672 (_2!12128 lt!403512)) (size!6328 (buf!6850 (_2!12128 lt!403512)))) (and (= (currentBit!12667 (_2!12128 lt!403512)) #b00000000000000000000000000000000) (= (currentByte!12672 (_2!12128 lt!403512)) (size!6328 (buf!6850 (_2!12128 lt!403512))))))))))

(assert (=> d!88176 d!88294))

(declare-fun d!88296 () Bool)

(assert (=> d!88296 (= (remainingBits!0 ((_ sign_extend 32) (size!6328 (buf!6850 (_2!12128 lt!403512)))) ((_ sign_extend 32) (currentByte!12672 (_2!12128 lt!403512))) ((_ sign_extend 32) (currentBit!12667 (_2!12128 lt!403512)))) (bvsub (bvmul ((_ sign_extend 32) (size!6328 (buf!6850 (_2!12128 lt!403512)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12672 (_2!12128 lt!403512))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12667 (_2!12128 lt!403512))))))))

(assert (=> d!88192 d!88296))

(assert (=> d!88192 d!88294))

(declare-fun d!88298 () Bool)

(assert (=> d!88298 (= (remainingBits!0 ((_ sign_extend 32) (size!6328 (buf!6850 (_2!12128 lt!403664)))) ((_ sign_extend 32) (currentByte!12672 (_2!12128 lt!403664))) ((_ sign_extend 32) (currentBit!12667 (_2!12128 lt!403664)))) (bvsub (bvmul ((_ sign_extend 32) (size!6328 (buf!6850 (_2!12128 lt!403664)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12672 (_2!12128 lt!403664))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12667 (_2!12128 lt!403664))))))))

(assert (=> b!261649 d!88298))

(assert (=> b!261649 d!88282))

(assert (=> d!88200 d!88276))

(declare-fun d!88300 () Bool)

(assert (=> d!88300 (= (invariant!0 (currentBit!12667 thiss!914) (currentByte!12672 thiss!914) (size!6328 (buf!6850 (_2!12128 lt!403512)))) (and (bvsge (currentBit!12667 thiss!914) #b00000000000000000000000000000000) (bvslt (currentBit!12667 thiss!914) #b00000000000000000000000000001000) (bvsge (currentByte!12672 thiss!914) #b00000000000000000000000000000000) (or (bvslt (currentByte!12672 thiss!914) (size!6328 (buf!6850 (_2!12128 lt!403512)))) (and (= (currentBit!12667 thiss!914) #b00000000000000000000000000000000) (= (currentByte!12672 thiss!914) (size!6328 (buf!6850 (_2!12128 lt!403512))))))))))

(assert (=> b!261587 d!88300))

(declare-fun d!88302 () Bool)

(declare-fun res!219112 () Bool)

(declare-fun e!182176 () Bool)

(assert (=> d!88302 (=> res!219112 e!182176)))

(assert (=> d!88302 (= res!219112 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12672 (_2!12128 lt!403514))))))

(assert (=> d!88302 (= (arrayRangesEq!953 (buf!6850 thiss!914) (array!14503 (store (arr!7315 (buf!6850 thiss!914)) (currentByte!12672 (_2!12128 lt!403514)) (select (arr!7315 (buf!6850 (_2!12128 lt!403514))) (currentByte!12672 (_2!12128 lt!403514)))) (size!6328 (buf!6850 thiss!914))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12672 (_2!12128 lt!403514))) e!182176)))

(declare-fun b!261754 () Bool)

(declare-fun e!182177 () Bool)

(assert (=> b!261754 (= e!182176 e!182177)))

(declare-fun res!219113 () Bool)

(assert (=> b!261754 (=> (not res!219113) (not e!182177))))

(assert (=> b!261754 (= res!219113 (= (select (arr!7315 (buf!6850 thiss!914)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!7315 (array!14503 (store (arr!7315 (buf!6850 thiss!914)) (currentByte!12672 (_2!12128 lt!403514)) (select (arr!7315 (buf!6850 (_2!12128 lt!403514))) (currentByte!12672 (_2!12128 lt!403514)))) (size!6328 (buf!6850 thiss!914)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!261755 () Bool)

(assert (=> b!261755 (= e!182177 (arrayRangesEq!953 (buf!6850 thiss!914) (array!14503 (store (arr!7315 (buf!6850 thiss!914)) (currentByte!12672 (_2!12128 lt!403514)) (select (arr!7315 (buf!6850 (_2!12128 lt!403514))) (currentByte!12672 (_2!12128 lt!403514)))) (size!6328 (buf!6850 thiss!914))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!12672 (_2!12128 lt!403514))))))

(assert (= (and d!88302 (not res!219112)) b!261754))

(assert (= (and b!261754 res!219113) b!261755))

(declare-fun m!391715 () Bool)

(assert (=> b!261754 m!391715))

(declare-fun m!391717 () Bool)

(assert (=> b!261754 m!391717))

(declare-fun m!391719 () Bool)

(assert (=> b!261755 m!391719))

(assert (=> b!261667 d!88302))

(assert (=> b!261614 d!88194))

(assert (=> b!261614 d!88192))

(push 1)

(assert (not b!261746))

(assert (not b!261747))

(assert (not d!88292))

(assert (not d!88280))

(assert (not d!88284))

(assert (not b!261755))

(assert (not bm!4019))

(assert (not d!88278))

(assert (not b!261753))

(assert (not b!261750))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!88378 () Bool)

(declare-fun res!219158 () Bool)

(declare-fun e!182221 () Bool)

(assert (=> d!88378 (=> res!219158 e!182221)))

(assert (=> d!88378 (= res!219158 (= (_1!12137 lt!403764) (_2!12137 lt!403764)))))

(assert (=> d!88378 (= (arrayRangesEq!953 (buf!6850 thiss!914) (buf!6850 (_2!12128 lt!403512)) (_1!12137 lt!403764) (_2!12137 lt!403764)) e!182221)))

(declare-fun b!261806 () Bool)

(declare-fun e!182222 () Bool)

(assert (=> b!261806 (= e!182221 e!182222)))

(declare-fun res!219159 () Bool)

(assert (=> b!261806 (=> (not res!219159) (not e!182222))))

(assert (=> b!261806 (= res!219159 (= (select (arr!7315 (buf!6850 thiss!914)) (_1!12137 lt!403764)) (select (arr!7315 (buf!6850 (_2!12128 lt!403512))) (_1!12137 lt!403764))))))

(declare-fun b!261807 () Bool)

(assert (=> b!261807 (= e!182222 (arrayRangesEq!953 (buf!6850 thiss!914) (buf!6850 (_2!12128 lt!403512)) (bvadd (_1!12137 lt!403764) #b00000000000000000000000000000001) (_2!12137 lt!403764)))))

(assert (= (and d!88378 (not res!219158)) b!261806))

(assert (= (and b!261806 res!219159) b!261807))

(declare-fun m!391823 () Bool)

(assert (=> b!261806 m!391823))

(declare-fun m!391825 () Bool)

(assert (=> b!261806 m!391825))

(declare-fun m!391827 () Bool)

(assert (=> b!261807 m!391827))

(assert (=> b!261746 d!88378))

(declare-fun d!88380 () Bool)

(declare-fun e!182223 () Bool)

(assert (=> d!88380 e!182223))

(declare-fun res!219161 () Bool)

(assert (=> d!88380 (=> (not res!219161) (not e!182223))))

(declare-fun lt!403865 () tuple2!22384)

(declare-fun lt!403866 () (_ BitVec 64))

(declare-fun lt!403868 () (_ BitVec 64))

(assert (=> d!88380 (= res!219161 (= (bvadd lt!403866 lt!403868) (bitIndex!0 (size!6328 (buf!6850 (_2!12128 lt!403865))) (currentByte!12672 (_2!12128 lt!403865)) (currentBit!12667 (_2!12128 lt!403865)))))))

(assert (=> d!88380 (or (not (= (bvand lt!403866 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!403868 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!403866 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!403866 lt!403868) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!88380 (= lt!403868 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!88380 (= lt!403866 (bitIndex!0 (size!6328 (buf!6850 (readerFrom!0 (_2!12128 lt!403512) (currentBit!12667 thiss!914) (currentByte!12672 thiss!914)))) (currentByte!12672 (readerFrom!0 (_2!12128 lt!403512) (currentBit!12667 thiss!914) (currentByte!12672 thiss!914))) (currentBit!12667 (readerFrom!0 (_2!12128 lt!403512) (currentBit!12667 thiss!914) (currentByte!12672 thiss!914)))))))

(declare-fun Unit!18673 () Unit!18651)

(declare-fun Unit!18674 () Unit!18651)

(assert (=> d!88380 (= lt!403865 (ite (bvslt (currentBit!12667 (readerFrom!0 (_2!12128 lt!403512) (currentBit!12667 thiss!914) (currentByte!12672 thiss!914))) #b00000000000000000000000000000111) (tuple2!22385 Unit!18673 (BitStream!11579 (buf!6850 (readerFrom!0 (_2!12128 lt!403512) (currentBit!12667 thiss!914) (currentByte!12672 thiss!914))) (currentByte!12672 (readerFrom!0 (_2!12128 lt!403512) (currentBit!12667 thiss!914) (currentByte!12672 thiss!914))) (bvadd (currentBit!12667 (readerFrom!0 (_2!12128 lt!403512) (currentBit!12667 thiss!914) (currentByte!12672 thiss!914))) #b00000000000000000000000000000001))) (tuple2!22385 Unit!18674 (BitStream!11579 (buf!6850 (readerFrom!0 (_2!12128 lt!403512) (currentBit!12667 thiss!914) (currentByte!12672 thiss!914))) (bvadd (currentByte!12672 (readerFrom!0 (_2!12128 lt!403512) (currentBit!12667 thiss!914) (currentByte!12672 thiss!914))) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (=> d!88380 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!6328 (buf!6850 (readerFrom!0 (_2!12128 lt!403512) (currentBit!12667 thiss!914) (currentByte!12672 thiss!914))))) ((_ sign_extend 32) (currentByte!12672 (readerFrom!0 (_2!12128 lt!403512) (currentBit!12667 thiss!914) (currentByte!12672 thiss!914)))) ((_ sign_extend 32) (currentBit!12667 (readerFrom!0 (_2!12128 lt!403512) (currentBit!12667 thiss!914) (currentByte!12672 thiss!914))))) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!88380 (= (increaseBitIndex!0 (readerFrom!0 (_2!12128 lt!403512) (currentBit!12667 thiss!914) (currentByte!12672 thiss!914))) lt!403865)))

(declare-fun b!261808 () Bool)

(declare-fun res!219160 () Bool)

(assert (=> b!261808 (=> (not res!219160) (not e!182223))))

(declare-fun lt!403864 () (_ BitVec 64))

(declare-fun lt!403867 () (_ BitVec 64))

(assert (=> b!261808 (= res!219160 (= (bvsub lt!403864 lt!403867) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!261808 (or (= (bvand lt!403864 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!403867 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!403864 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!403864 lt!403867) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!261808 (= lt!403867 (remainingBits!0 ((_ sign_extend 32) (size!6328 (buf!6850 (_2!12128 lt!403865)))) ((_ sign_extend 32) (currentByte!12672 (_2!12128 lt!403865))) ((_ sign_extend 32) (currentBit!12667 (_2!12128 lt!403865)))))))

(assert (=> b!261808 (= lt!403864 (remainingBits!0 ((_ sign_extend 32) (size!6328 (buf!6850 (readerFrom!0 (_2!12128 lt!403512) (currentBit!12667 thiss!914) (currentByte!12672 thiss!914))))) ((_ sign_extend 32) (currentByte!12672 (readerFrom!0 (_2!12128 lt!403512) (currentBit!12667 thiss!914) (currentByte!12672 thiss!914)))) ((_ sign_extend 32) (currentBit!12667 (readerFrom!0 (_2!12128 lt!403512) (currentBit!12667 thiss!914) (currentByte!12672 thiss!914))))))))

(declare-fun b!261809 () Bool)

(assert (=> b!261809 (= e!182223 (= (size!6328 (buf!6850 (readerFrom!0 (_2!12128 lt!403512) (currentBit!12667 thiss!914) (currentByte!12672 thiss!914)))) (size!6328 (buf!6850 (_2!12128 lt!403865)))))))

(assert (= (and d!88380 res!219161) b!261808))

(assert (= (and b!261808 res!219160) b!261809))

(declare-fun m!391829 () Bool)

(assert (=> d!88380 m!391829))

(assert (=> d!88380 m!391713))

(declare-fun m!391831 () Bool)

(assert (=> d!88380 m!391831))

(declare-fun m!391833 () Bool)

(assert (=> b!261808 m!391833))

(assert (=> b!261808 m!391831))

(assert (=> d!88292 d!88380))

(declare-fun d!88382 () Bool)

(assert (=> d!88382 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6328 (buf!6850 (readerFrom!0 (_2!12128 lt!403512) (currentBit!12667 thiss!914) (currentByte!12672 thiss!914))))) ((_ sign_extend 32) (currentByte!12672 (readerFrom!0 (_2!12128 lt!403512) (currentBit!12667 thiss!914) (currentByte!12672 thiss!914)))) ((_ sign_extend 32) (currentBit!12667 (readerFrom!0 (_2!12128 lt!403512) (currentBit!12667 thiss!914) (currentByte!12672 thiss!914))))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6328 (buf!6850 (readerFrom!0 (_2!12128 lt!403512) (currentBit!12667 thiss!914) (currentByte!12672 thiss!914))))) ((_ sign_extend 32) (currentByte!12672 (readerFrom!0 (_2!12128 lt!403512) (currentBit!12667 thiss!914) (currentByte!12672 thiss!914)))) ((_ sign_extend 32) (currentBit!12667 (readerFrom!0 (_2!12128 lt!403512) (currentBit!12667 thiss!914) (currentByte!12672 thiss!914))))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!22368 () Bool)

(assert (= bs!22368 d!88382))

(assert (=> bs!22368 m!391831))

(assert (=> d!88292 d!88382))

(assert (=> d!88280 d!88282))

(declare-fun d!88384 () Bool)

(assert (=> d!88384 (= (invariant!0 (currentBit!12667 (_2!12128 lt!403514)) (currentByte!12672 (_2!12128 lt!403514)) (size!6328 (buf!6850 (_2!12128 lt!403514)))) (and (bvsge (currentBit!12667 (_2!12128 lt!403514)) #b00000000000000000000000000000000) (bvslt (currentBit!12667 (_2!12128 lt!403514)) #b00000000000000000000000000001000) (bvsge (currentByte!12672 (_2!12128 lt!403514)) #b00000000000000000000000000000000) (or (bvslt (currentByte!12672 (_2!12128 lt!403514)) (size!6328 (buf!6850 (_2!12128 lt!403514)))) (and (= (currentBit!12667 (_2!12128 lt!403514)) #b00000000000000000000000000000000) (= (currentByte!12672 (_2!12128 lt!403514)) (size!6328 (buf!6850 (_2!12128 lt!403514))))))))))

(assert (=> d!88280 d!88384))

(declare-fun d!88386 () Bool)

(assert (=> d!88386 (= (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6328 (buf!6850 thiss!914)) (currentByte!12672 thiss!914) (currentBit!12667 thiss!914))) (tuple4!315 ((_ extract 31 0) (bvadd (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!6328 (buf!6850 thiss!914)) (currentByte!12672 thiss!914) (currentBit!12667 thiss!914)) #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!6328 (buf!6850 thiss!914)) (currentByte!12672 thiss!914) (currentBit!12667 thiss!914)) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!261750 d!88386))

(declare-fun d!88388 () Bool)

(declare-fun e!182224 () Bool)

(assert (=> d!88388 e!182224))

(declare-fun res!219163 () Bool)

(assert (=> d!88388 (=> (not res!219163) (not e!182224))))

(declare-fun lt!403870 () (_ BitVec 64))

(declare-fun lt!403872 () (_ BitVec 64))

(declare-fun lt!403871 () (_ BitVec 64))

(assert (=> d!88388 (= res!219163 (= lt!403872 (bvsub lt!403870 lt!403871)))))

(assert (=> d!88388 (or (= (bvand lt!403870 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!403871 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!403870 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!403870 lt!403871) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!88388 (= lt!403871 (remainingBits!0 ((_ sign_extend 32) (size!6328 (buf!6850 (_2!12128 (increaseBitIndex!0 (readerFrom!0 (_2!12128 lt!403512) (currentBit!12667 thiss!914) (currentByte!12672 thiss!914))))))) ((_ sign_extend 32) (currentByte!12672 (_2!12128 (increaseBitIndex!0 (readerFrom!0 (_2!12128 lt!403512) (currentBit!12667 thiss!914) (currentByte!12672 thiss!914)))))) ((_ sign_extend 32) (currentBit!12667 (_2!12128 (increaseBitIndex!0 (readerFrom!0 (_2!12128 lt!403512) (currentBit!12667 thiss!914) (currentByte!12672 thiss!914))))))))))

(declare-fun lt!403873 () (_ BitVec 64))

(declare-fun lt!403869 () (_ BitVec 64))

(assert (=> d!88388 (= lt!403870 (bvmul lt!403873 lt!403869))))

(assert (=> d!88388 (or (= lt!403873 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!403869 (bvsdiv (bvmul lt!403873 lt!403869) lt!403873)))))

(assert (=> d!88388 (= lt!403869 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!88388 (= lt!403873 ((_ sign_extend 32) (size!6328 (buf!6850 (_2!12128 (increaseBitIndex!0 (readerFrom!0 (_2!12128 lt!403512) (currentBit!12667 thiss!914) (currentByte!12672 thiss!914))))))))))

(assert (=> d!88388 (= lt!403872 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12672 (_2!12128 (increaseBitIndex!0 (readerFrom!0 (_2!12128 lt!403512) (currentBit!12667 thiss!914) (currentByte!12672 thiss!914)))))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12667 (_2!12128 (increaseBitIndex!0 (readerFrom!0 (_2!12128 lt!403512) (currentBit!12667 thiss!914) (currentByte!12672 thiss!914))))))))))

(assert (=> d!88388 (invariant!0 (currentBit!12667 (_2!12128 (increaseBitIndex!0 (readerFrom!0 (_2!12128 lt!403512) (currentBit!12667 thiss!914) (currentByte!12672 thiss!914))))) (currentByte!12672 (_2!12128 (increaseBitIndex!0 (readerFrom!0 (_2!12128 lt!403512) (currentBit!12667 thiss!914) (currentByte!12672 thiss!914))))) (size!6328 (buf!6850 (_2!12128 (increaseBitIndex!0 (readerFrom!0 (_2!12128 lt!403512) (currentBit!12667 thiss!914) (currentByte!12672 thiss!914)))))))))

(assert (=> d!88388 (= (bitIndex!0 (size!6328 (buf!6850 (_2!12128 (increaseBitIndex!0 (readerFrom!0 (_2!12128 lt!403512) (currentBit!12667 thiss!914) (currentByte!12672 thiss!914)))))) (currentByte!12672 (_2!12128 (increaseBitIndex!0 (readerFrom!0 (_2!12128 lt!403512) (currentBit!12667 thiss!914) (currentByte!12672 thiss!914))))) (currentBit!12667 (_2!12128 (increaseBitIndex!0 (readerFrom!0 (_2!12128 lt!403512) (currentBit!12667 thiss!914) (currentByte!12672 thiss!914)))))) lt!403872)))

(declare-fun b!261810 () Bool)

(declare-fun res!219162 () Bool)

(assert (=> b!261810 (=> (not res!219162) (not e!182224))))

(assert (=> b!261810 (= res!219162 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!403872))))

(declare-fun b!261811 () Bool)

(declare-fun lt!403874 () (_ BitVec 64))

(assert (=> b!261811 (= e!182224 (bvsle lt!403872 (bvmul lt!403874 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!261811 (or (= lt!403874 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!403874 #b0000000000000000000000000000000000000000000000000000000000001000) lt!403874)))))

(assert (=> b!261811 (= lt!403874 ((_ sign_extend 32) (size!6328 (buf!6850 (_2!12128 (increaseBitIndex!0 (readerFrom!0 (_2!12128 lt!403512) (currentBit!12667 thiss!914) (currentByte!12672 thiss!914))))))))))

(assert (= (and d!88388 res!219163) b!261810))

(assert (= (and b!261810 res!219162) b!261811))

(declare-fun m!391835 () Bool)

(assert (=> d!88388 m!391835))

(declare-fun m!391837 () Bool)

(assert (=> d!88388 m!391837))

(assert (=> b!261753 d!88388))

(assert (=> b!261753 d!88380))

(declare-fun d!88390 () Bool)

(declare-fun e!182225 () Bool)

(assert (=> d!88390 e!182225))

(declare-fun res!219165 () Bool)

(assert (=> d!88390 (=> (not res!219165) (not e!182225))))

(declare-fun lt!403876 () (_ BitVec 64))

(declare-fun lt!403877 () (_ BitVec 64))

(declare-fun lt!403878 () (_ BitVec 64))

(assert (=> d!88390 (= res!219165 (= lt!403878 (bvsub lt!403876 lt!403877)))))

(assert (=> d!88390 (or (= (bvand lt!403876 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!403877 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!403876 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!403876 lt!403877) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!88390 (= lt!403877 (remainingBits!0 ((_ sign_extend 32) (size!6328 (buf!6850 (readerFrom!0 (_2!12128 lt!403512) (currentBit!12667 thiss!914) (currentByte!12672 thiss!914))))) ((_ sign_extend 32) (currentByte!12672 (readerFrom!0 (_2!12128 lt!403512) (currentBit!12667 thiss!914) (currentByte!12672 thiss!914)))) ((_ sign_extend 32) (currentBit!12667 (readerFrom!0 (_2!12128 lt!403512) (currentBit!12667 thiss!914) (currentByte!12672 thiss!914))))))))

(declare-fun lt!403879 () (_ BitVec 64))

(declare-fun lt!403875 () (_ BitVec 64))

(assert (=> d!88390 (= lt!403876 (bvmul lt!403879 lt!403875))))

(assert (=> d!88390 (or (= lt!403879 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!403875 (bvsdiv (bvmul lt!403879 lt!403875) lt!403879)))))

(assert (=> d!88390 (= lt!403875 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!88390 (= lt!403879 ((_ sign_extend 32) (size!6328 (buf!6850 (readerFrom!0 (_2!12128 lt!403512) (currentBit!12667 thiss!914) (currentByte!12672 thiss!914))))))))

(assert (=> d!88390 (= lt!403878 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12672 (readerFrom!0 (_2!12128 lt!403512) (currentBit!12667 thiss!914) (currentByte!12672 thiss!914)))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12667 (readerFrom!0 (_2!12128 lt!403512) (currentBit!12667 thiss!914) (currentByte!12672 thiss!914))))))))

(assert (=> d!88390 (invariant!0 (currentBit!12667 (readerFrom!0 (_2!12128 lt!403512) (currentBit!12667 thiss!914) (currentByte!12672 thiss!914))) (currentByte!12672 (readerFrom!0 (_2!12128 lt!403512) (currentBit!12667 thiss!914) (currentByte!12672 thiss!914))) (size!6328 (buf!6850 (readerFrom!0 (_2!12128 lt!403512) (currentBit!12667 thiss!914) (currentByte!12672 thiss!914)))))))

(assert (=> d!88390 (= (bitIndex!0 (size!6328 (buf!6850 (readerFrom!0 (_2!12128 lt!403512) (currentBit!12667 thiss!914) (currentByte!12672 thiss!914)))) (currentByte!12672 (readerFrom!0 (_2!12128 lt!403512) (currentBit!12667 thiss!914) (currentByte!12672 thiss!914))) (currentBit!12667 (readerFrom!0 (_2!12128 lt!403512) (currentBit!12667 thiss!914) (currentByte!12672 thiss!914)))) lt!403878)))

(declare-fun b!261812 () Bool)

(declare-fun res!219164 () Bool)

(assert (=> b!261812 (=> (not res!219164) (not e!182225))))

(assert (=> b!261812 (= res!219164 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!403878))))

(declare-fun b!261813 () Bool)

(declare-fun lt!403880 () (_ BitVec 64))

(assert (=> b!261813 (= e!182225 (bvsle lt!403878 (bvmul lt!403880 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!261813 (or (= lt!403880 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!403880 #b0000000000000000000000000000000000000000000000000000000000001000) lt!403880)))))

(assert (=> b!261813 (= lt!403880 ((_ sign_extend 32) (size!6328 (buf!6850 (readerFrom!0 (_2!12128 lt!403512) (currentBit!12667 thiss!914) (currentByte!12672 thiss!914))))))))

(assert (= (and d!88390 res!219165) b!261812))

(assert (= (and b!261812 res!219164) b!261813))

(assert (=> d!88390 m!391831))

(declare-fun m!391839 () Bool)

(assert (=> d!88390 m!391839))

(assert (=> b!261753 d!88390))

(declare-fun d!88392 () Bool)

(assert (=> d!88392 (= (byteRangesEq!0 (ite c!11991 (select (arr!7315 (buf!6850 thiss!914)) (_3!937 lt!403764)) (select (arr!7315 (buf!6850 thiss!914)) (_4!157 lt!403764))) (ite c!11991 (select (arr!7315 (buf!6850 (_2!12128 lt!403512))) (_3!937 lt!403764)) (select (arr!7315 (buf!6850 (_2!12128 lt!403512))) (_4!157 lt!403764))) (ite c!11991 lt!403765 #b00000000000000000000000000000000) lt!403766) (or (= (ite c!11991 lt!403765 #b00000000000000000000000000000000) lt!403766) (= (bvand (bvand (bvand ((_ sign_extend 24) (ite c!11991 (select (arr!7315 (buf!6850 thiss!914)) (_3!937 lt!403764)) (select (arr!7315 (buf!6850 thiss!914)) (_4!157 lt!403764)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!403766))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!11991 lt!403765 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (ite c!11991 (select (arr!7315 (buf!6850 (_2!12128 lt!403512))) (_3!937 lt!403764)) (select (arr!7315 (buf!6850 (_2!12128 lt!403512))) (_4!157 lt!403764)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!403766))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!11991 lt!403765 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111))))))

(declare-fun bs!22369 () Bool)

(assert (= bs!22369 d!88392))

(declare-fun m!391841 () Bool)

(assert (=> bs!22369 m!391841))

(declare-fun m!391843 () Bool)

(assert (=> bs!22369 m!391843))

(assert (=> bm!4019 d!88392))

(assert (=> d!88278 d!88298))

(declare-fun d!88394 () Bool)

(assert (=> d!88394 (= (invariant!0 (currentBit!12667 (_2!12128 lt!403664)) (currentByte!12672 (_2!12128 lt!403664)) (size!6328 (buf!6850 (_2!12128 lt!403664)))) (and (bvsge (currentBit!12667 (_2!12128 lt!403664)) #b00000000000000000000000000000000) (bvslt (currentBit!12667 (_2!12128 lt!403664)) #b00000000000000000000000000001000) (bvsge (currentByte!12672 (_2!12128 lt!403664)) #b00000000000000000000000000000000) (or (bvslt (currentByte!12672 (_2!12128 lt!403664)) (size!6328 (buf!6850 (_2!12128 lt!403664)))) (and (= (currentBit!12667 (_2!12128 lt!403664)) #b00000000000000000000000000000000) (= (currentByte!12672 (_2!12128 lt!403664)) (size!6328 (buf!6850 (_2!12128 lt!403664))))))))))

(assert (=> d!88278 d!88394))

(assert (=> d!88284 d!88226))

(declare-fun d!88396 () Bool)

(declare-fun res!219166 () Bool)

(declare-fun e!182226 () Bool)

(assert (=> d!88396 (=> res!219166 e!182226)))

(assert (=> d!88396 (= res!219166 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!12672 (_2!12128 lt!403514))))))

(assert (=> d!88396 (= (arrayRangesEq!953 (buf!6850 thiss!914) (array!14503 (store (arr!7315 (buf!6850 thiss!914)) (currentByte!12672 (_2!12128 lt!403514)) (select (arr!7315 (buf!6850 (_2!12128 lt!403514))) (currentByte!12672 (_2!12128 lt!403514)))) (size!6328 (buf!6850 thiss!914))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!12672 (_2!12128 lt!403514))) e!182226)))

(declare-fun b!261814 () Bool)

(declare-fun e!182227 () Bool)

(assert (=> b!261814 (= e!182226 e!182227)))

(declare-fun res!219167 () Bool)

(assert (=> b!261814 (=> (not res!219167) (not e!182227))))

(assert (=> b!261814 (= res!219167 (= (select (arr!7315 (buf!6850 thiss!914)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (select (arr!7315 (array!14503 (store (arr!7315 (buf!6850 thiss!914)) (currentByte!12672 (_2!12128 lt!403514)) (select (arr!7315 (buf!6850 (_2!12128 lt!403514))) (currentByte!12672 (_2!12128 lt!403514)))) (size!6328 (buf!6850 thiss!914)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!261815 () Bool)

(assert (=> b!261815 (= e!182227 (arrayRangesEq!953 (buf!6850 thiss!914) (array!14503 (store (arr!7315 (buf!6850 thiss!914)) (currentByte!12672 (_2!12128 lt!403514)) (select (arr!7315 (buf!6850 (_2!12128 lt!403514))) (currentByte!12672 (_2!12128 lt!403514)))) (size!6328 (buf!6850 thiss!914))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!12672 (_2!12128 lt!403514))))))

(assert (= (and d!88396 (not res!219166)) b!261814))

(assert (= (and b!261814 res!219167) b!261815))

(declare-fun m!391845 () Bool)

(assert (=> b!261814 m!391845))

(declare-fun m!391847 () Bool)

(assert (=> b!261814 m!391847))

(declare-fun m!391849 () Bool)

(assert (=> b!261815 m!391849))

(assert (=> b!261755 d!88396))

(declare-fun d!88398 () Bool)

(assert (=> d!88398 (= (byteRangesEq!0 (select (arr!7315 (buf!6850 thiss!914)) (_3!937 lt!403764)) (select (arr!7315 (buf!6850 (_2!12128 lt!403512))) (_3!937 lt!403764)) lt!403765 #b00000000000000000000000000001000) (or (= lt!403765 #b00000000000000000000000000001000) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7315 (buf!6850 thiss!914)) (_3!937 lt!403764))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!403765)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7315 (buf!6850 (_2!12128 lt!403512))) (_3!937 lt!403764))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!403765)))) #b00000000000000000000000011111111))))))

(declare-fun bs!22370 () Bool)

(assert (= bs!22370 d!88398))

(declare-fun m!391851 () Bool)

(assert (=> bs!22370 m!391851))

(declare-fun m!391853 () Bool)

(assert (=> bs!22370 m!391853))

(assert (=> b!261747 d!88398))

(push 1)

(assert (not b!261807))

(assert (not b!261808))

(assert (not d!88388))

(assert (not d!88382))

(assert (not b!261815))

(assert (not d!88390))

(assert (not d!88380))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

