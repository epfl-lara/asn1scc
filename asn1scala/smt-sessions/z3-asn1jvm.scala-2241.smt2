; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56988 () Bool)

(assert start!56988)

(declare-fun b!261561 () Bool)

(declare-fun e!182022 () Bool)

(declare-fun e!182023 () Bool)

(assert (=> b!261561 (= e!182022 e!182023)))

(declare-fun res!218933 () Bool)

(assert (=> b!261561 (=> (not res!218933) (not e!182023))))

(declare-datatypes ((array!14504 0))(
  ( (array!14505 (arr!7316 (Array (_ BitVec 32) (_ BitVec 8))) (size!6329 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11580 0))(
  ( (BitStream!11581 (buf!6851 array!14504) (currentByte!12673 (_ BitVec 32)) (currentBit!12668 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!18655 0))(
  ( (Unit!18656) )
))
(declare-datatypes ((tuple2!22386 0))(
  ( (tuple2!22387 (_1!12129 Unit!18655) (_2!12129 BitStream!11580)) )
))
(declare-fun lt!403528 () tuple2!22386)

(declare-datatypes ((tuple2!22388 0))(
  ( (tuple2!22389 (_1!12130 BitStream!11580) (_2!12130 Bool)) )
))
(declare-fun lt!403532 () tuple2!22388)

(declare-fun b!187 () Bool)

(assert (=> b!261561 (= res!218933 (and (= (_2!12130 lt!403532) b!187) (= (_1!12130 lt!403532) (_2!12129 lt!403528))))))

(declare-fun thiss!914 () BitStream!11580)

(declare-fun readBitPure!0 (BitStream!11580) tuple2!22388)

(declare-fun readerFrom!0 (BitStream!11580 (_ BitVec 32) (_ BitVec 32)) BitStream!11580)

(assert (=> b!261561 (= lt!403532 (readBitPure!0 (readerFrom!0 (_2!12129 lt!403528) (currentBit!12668 thiss!914) (currentByte!12673 thiss!914))))))

(declare-fun b!261562 () Bool)

(declare-fun lt!403529 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!261562 (= e!182023 (= (bitIndex!0 (size!6329 (buf!6851 (_1!12130 lt!403532))) (currentByte!12673 (_1!12130 lt!403532)) (currentBit!12668 (_1!12130 lt!403532))) lt!403529))))

(declare-fun b!261563 () Bool)

(declare-fun e!182020 () Bool)

(assert (=> b!261563 (= e!182020 e!182022)))

(declare-fun res!218935 () Bool)

(assert (=> b!261563 (=> (not res!218935) (not e!182022))))

(declare-fun lt!403531 () (_ BitVec 64))

(assert (=> b!261563 (= res!218935 (= lt!403529 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!403531)))))

(assert (=> b!261563 (= lt!403529 (bitIndex!0 (size!6329 (buf!6851 (_2!12129 lt!403528))) (currentByte!12673 (_2!12129 lt!403528)) (currentBit!12668 (_2!12129 lt!403528))))))

(assert (=> b!261563 (= lt!403531 (bitIndex!0 (size!6329 (buf!6851 thiss!914)) (currentByte!12673 thiss!914) (currentBit!12668 thiss!914)))))

(declare-fun b!261564 () Bool)

(declare-fun e!182018 () Bool)

(declare-fun array_inv!6070 (array!14504) Bool)

(assert (=> b!261564 (= e!182018 (array_inv!6070 (buf!6851 thiss!914)))))

(declare-fun b!261565 () Bool)

(declare-fun e!182021 () Bool)

(assert (=> b!261565 (= e!182021 (not e!182020))))

(declare-fun res!218932 () Bool)

(assert (=> b!261565 (=> (not res!218932) (not e!182020))))

(assert (=> b!261565 (= res!218932 (= (size!6329 (buf!6851 thiss!914)) (size!6329 (buf!6851 (_2!12129 lt!403528)))))))

(declare-fun lt!403527 () tuple2!22386)

(declare-fun increaseBitIndex!0 (BitStream!11580) tuple2!22386)

(assert (=> b!261565 (= lt!403528 (increaseBitIndex!0 (_2!12129 lt!403527)))))

(declare-fun arrayRangesEq!954 (array!14504 array!14504 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!261565 (arrayRangesEq!954 (buf!6851 thiss!914) (array!14505 (store (arr!7316 (buf!6851 thiss!914)) (currentByte!12673 (_2!12129 lt!403527)) (select (arr!7316 (buf!6851 (_2!12129 lt!403527))) (currentByte!12673 (_2!12129 lt!403527)))) (size!6329 (buf!6851 thiss!914))) #b00000000000000000000000000000000 (currentByte!12673 (_2!12129 lt!403527)))))

(declare-fun lt!403530 () Unit!18655)

(declare-fun arrayUpdatedAtPrefixLemma!470 (array!14504 (_ BitVec 32) (_ BitVec 8)) Unit!18655)

(assert (=> b!261565 (= lt!403530 (arrayUpdatedAtPrefixLemma!470 (buf!6851 thiss!914) (currentByte!12673 (_2!12129 lt!403527)) (select (arr!7316 (buf!6851 (_2!12129 lt!403527))) (currentByte!12673 (_2!12129 lt!403527)))))))

(declare-fun Unit!18657 () Unit!18655)

(declare-fun Unit!18658 () Unit!18655)

(assert (=> b!261565 (= lt!403527 (ite b!187 (tuple2!22387 Unit!18657 (BitStream!11581 (array!14505 (store (arr!7316 (buf!6851 thiss!914)) (currentByte!12673 thiss!914) ((_ extract 7 0) (bvor ((_ sign_extend 24) (select (arr!7316 (buf!6851 thiss!914)) (currentByte!12673 thiss!914))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12668 thiss!914)))))) (size!6329 (buf!6851 thiss!914))) (currentByte!12673 thiss!914) (currentBit!12668 thiss!914))) (tuple2!22387 Unit!18658 (BitStream!11581 (array!14505 (store (arr!7316 (buf!6851 thiss!914)) (currentByte!12673 thiss!914) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!7316 (buf!6851 thiss!914)) (currentByte!12673 thiss!914))) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12668 thiss!914))))))) (size!6329 (buf!6851 thiss!914))) (currentByte!12673 thiss!914) (currentBit!12668 thiss!914)))))))

(declare-fun res!218934 () Bool)

(assert (=> start!56988 (=> (not res!218934) (not e!182021))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!56988 (= res!218934 (validate_offset_bit!0 ((_ sign_extend 32) (size!6329 (buf!6851 thiss!914))) ((_ sign_extend 32) (currentByte!12673 thiss!914)) ((_ sign_extend 32) (currentBit!12668 thiss!914))))))

(assert (=> start!56988 e!182021))

(declare-fun inv!12 (BitStream!11580) Bool)

(assert (=> start!56988 (and (inv!12 thiss!914) e!182018)))

(assert (=> start!56988 true))

(declare-fun b!261566 () Bool)

(declare-fun res!218936 () Bool)

(assert (=> b!261566 (=> (not res!218936) (not e!182022))))

(declare-fun isPrefixOf!0 (BitStream!11580 BitStream!11580) Bool)

(assert (=> b!261566 (= res!218936 (isPrefixOf!0 thiss!914 (_2!12129 lt!403528)))))

(assert (= (and start!56988 res!218934) b!261565))

(assert (= (and b!261565 res!218932) b!261563))

(assert (= (and b!261563 res!218935) b!261566))

(assert (= (and b!261566 res!218936) b!261561))

(assert (= (and b!261561 res!218933) b!261562))

(assert (= start!56988 b!261564))

(declare-fun m!391471 () Bool)

(assert (=> b!261564 m!391471))

(declare-fun m!391473 () Bool)

(assert (=> b!261565 m!391473))

(declare-fun m!391475 () Bool)

(assert (=> b!261565 m!391475))

(declare-fun m!391477 () Bool)

(assert (=> b!261565 m!391477))

(declare-fun m!391479 () Bool)

(assert (=> b!261565 m!391479))

(declare-fun m!391481 () Bool)

(assert (=> b!261565 m!391481))

(declare-fun m!391483 () Bool)

(assert (=> b!261565 m!391483))

(declare-fun m!391485 () Bool)

(assert (=> b!261565 m!391485))

(declare-fun m!391487 () Bool)

(assert (=> b!261565 m!391487))

(assert (=> b!261565 m!391479))

(declare-fun m!391489 () Bool)

(assert (=> b!261565 m!391489))

(declare-fun m!391491 () Bool)

(assert (=> b!261562 m!391491))

(declare-fun m!391493 () Bool)

(assert (=> b!261566 m!391493))

(declare-fun m!391495 () Bool)

(assert (=> b!261563 m!391495))

(declare-fun m!391497 () Bool)

(assert (=> b!261563 m!391497))

(declare-fun m!391499 () Bool)

(assert (=> start!56988 m!391499))

(declare-fun m!391501 () Bool)

(assert (=> start!56988 m!391501))

(declare-fun m!391503 () Bool)

(assert (=> b!261561 m!391503))

(assert (=> b!261561 m!391503))

(declare-fun m!391505 () Bool)

(assert (=> b!261561 m!391505))

(check-sat (not b!261561) (not b!261565) (not b!261564) (not start!56988) (not b!261566) (not b!261562) (not b!261563))
(check-sat)
(get-model)

(declare-fun d!88172 () Bool)

(declare-fun e!182047 () Bool)

(assert (=> d!88172 e!182047))

(declare-fun res!218960 () Bool)

(assert (=> d!88172 (=> (not res!218960) (not e!182047))))

(declare-fun lt!403566 () (_ BitVec 64))

(declare-fun lt!403571 () (_ BitVec 64))

(declare-fun lt!403569 () (_ BitVec 64))

(assert (=> d!88172 (= res!218960 (= lt!403571 (bvsub lt!403569 lt!403566)))))

(assert (=> d!88172 (or (= (bvand lt!403569 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!403566 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!403569 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!403569 lt!403566) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!88172 (= lt!403566 (remainingBits!0 ((_ sign_extend 32) (size!6329 (buf!6851 (_1!12130 lt!403532)))) ((_ sign_extend 32) (currentByte!12673 (_1!12130 lt!403532))) ((_ sign_extend 32) (currentBit!12668 (_1!12130 lt!403532)))))))

(declare-fun lt!403568 () (_ BitVec 64))

(declare-fun lt!403567 () (_ BitVec 64))

(assert (=> d!88172 (= lt!403569 (bvmul lt!403568 lt!403567))))

(assert (=> d!88172 (or (= lt!403568 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!403567 (bvsdiv (bvmul lt!403568 lt!403567) lt!403568)))))

(assert (=> d!88172 (= lt!403567 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!88172 (= lt!403568 ((_ sign_extend 32) (size!6329 (buf!6851 (_1!12130 lt!403532)))))))

(assert (=> d!88172 (= lt!403571 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12673 (_1!12130 lt!403532))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12668 (_1!12130 lt!403532)))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!88172 (invariant!0 (currentBit!12668 (_1!12130 lt!403532)) (currentByte!12673 (_1!12130 lt!403532)) (size!6329 (buf!6851 (_1!12130 lt!403532))))))

(assert (=> d!88172 (= (bitIndex!0 (size!6329 (buf!6851 (_1!12130 lt!403532))) (currentByte!12673 (_1!12130 lt!403532)) (currentBit!12668 (_1!12130 lt!403532))) lt!403571)))

(declare-fun b!261592 () Bool)

(declare-fun res!218961 () Bool)

(assert (=> b!261592 (=> (not res!218961) (not e!182047))))

(assert (=> b!261592 (= res!218961 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!403571))))

(declare-fun b!261593 () Bool)

(declare-fun lt!403570 () (_ BitVec 64))

(assert (=> b!261593 (= e!182047 (bvsle lt!403571 (bvmul lt!403570 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!261593 (or (= lt!403570 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!403570 #b0000000000000000000000000000000000000000000000000000000000001000) lt!403570)))))

(assert (=> b!261593 (= lt!403570 ((_ sign_extend 32) (size!6329 (buf!6851 (_1!12130 lt!403532)))))))

(assert (= (and d!88172 res!218960) b!261592))

(assert (= (and b!261592 res!218961) b!261593))

(declare-fun m!391549 () Bool)

(assert (=> d!88172 m!391549))

(declare-fun m!391551 () Bool)

(assert (=> d!88172 m!391551))

(assert (=> b!261562 d!88172))

(declare-fun d!88180 () Bool)

(declare-fun e!182048 () Bool)

(assert (=> d!88180 e!182048))

(declare-fun res!218962 () Bool)

(assert (=> d!88180 (=> (not res!218962) (not e!182048))))

(declare-fun lt!403575 () (_ BitVec 64))

(declare-fun lt!403577 () (_ BitVec 64))

(declare-fun lt!403572 () (_ BitVec 64))

(assert (=> d!88180 (= res!218962 (= lt!403577 (bvsub lt!403575 lt!403572)))))

(assert (=> d!88180 (or (= (bvand lt!403575 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!403572 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!403575 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!403575 lt!403572) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!88180 (= lt!403572 (remainingBits!0 ((_ sign_extend 32) (size!6329 (buf!6851 (_2!12129 lt!403528)))) ((_ sign_extend 32) (currentByte!12673 (_2!12129 lt!403528))) ((_ sign_extend 32) (currentBit!12668 (_2!12129 lt!403528)))))))

(declare-fun lt!403574 () (_ BitVec 64))

(declare-fun lt!403573 () (_ BitVec 64))

(assert (=> d!88180 (= lt!403575 (bvmul lt!403574 lt!403573))))

(assert (=> d!88180 (or (= lt!403574 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!403573 (bvsdiv (bvmul lt!403574 lt!403573) lt!403574)))))

(assert (=> d!88180 (= lt!403573 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!88180 (= lt!403574 ((_ sign_extend 32) (size!6329 (buf!6851 (_2!12129 lt!403528)))))))

(assert (=> d!88180 (= lt!403577 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12673 (_2!12129 lt!403528))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12668 (_2!12129 lt!403528)))))))

(assert (=> d!88180 (invariant!0 (currentBit!12668 (_2!12129 lt!403528)) (currentByte!12673 (_2!12129 lt!403528)) (size!6329 (buf!6851 (_2!12129 lt!403528))))))

(assert (=> d!88180 (= (bitIndex!0 (size!6329 (buf!6851 (_2!12129 lt!403528))) (currentByte!12673 (_2!12129 lt!403528)) (currentBit!12668 (_2!12129 lt!403528))) lt!403577)))

(declare-fun b!261594 () Bool)

(declare-fun res!218963 () Bool)

(assert (=> b!261594 (=> (not res!218963) (not e!182048))))

(assert (=> b!261594 (= res!218963 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!403577))))

(declare-fun b!261595 () Bool)

(declare-fun lt!403576 () (_ BitVec 64))

(assert (=> b!261595 (= e!182048 (bvsle lt!403577 (bvmul lt!403576 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!261595 (or (= lt!403576 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!403576 #b0000000000000000000000000000000000000000000000000000000000001000) lt!403576)))))

(assert (=> b!261595 (= lt!403576 ((_ sign_extend 32) (size!6329 (buf!6851 (_2!12129 lt!403528)))))))

(assert (= (and d!88180 res!218962) b!261594))

(assert (= (and b!261594 res!218963) b!261595))

(declare-fun m!391553 () Bool)

(assert (=> d!88180 m!391553))

(declare-fun m!391555 () Bool)

(assert (=> d!88180 m!391555))

(assert (=> b!261563 d!88180))

(declare-fun d!88182 () Bool)

(declare-fun e!182049 () Bool)

(assert (=> d!88182 e!182049))

(declare-fun res!218964 () Bool)

(assert (=> d!88182 (=> (not res!218964) (not e!182049))))

(declare-fun lt!403578 () (_ BitVec 64))

(declare-fun lt!403581 () (_ BitVec 64))

(declare-fun lt!403583 () (_ BitVec 64))

(assert (=> d!88182 (= res!218964 (= lt!403583 (bvsub lt!403581 lt!403578)))))

(assert (=> d!88182 (or (= (bvand lt!403581 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!403578 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!403581 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!403581 lt!403578) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!88182 (= lt!403578 (remainingBits!0 ((_ sign_extend 32) (size!6329 (buf!6851 thiss!914))) ((_ sign_extend 32) (currentByte!12673 thiss!914)) ((_ sign_extend 32) (currentBit!12668 thiss!914))))))

(declare-fun lt!403580 () (_ BitVec 64))

(declare-fun lt!403579 () (_ BitVec 64))

(assert (=> d!88182 (= lt!403581 (bvmul lt!403580 lt!403579))))

(assert (=> d!88182 (or (= lt!403580 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!403579 (bvsdiv (bvmul lt!403580 lt!403579) lt!403580)))))

(assert (=> d!88182 (= lt!403579 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!88182 (= lt!403580 ((_ sign_extend 32) (size!6329 (buf!6851 thiss!914))))))

(assert (=> d!88182 (= lt!403583 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12673 thiss!914)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12668 thiss!914))))))

(assert (=> d!88182 (invariant!0 (currentBit!12668 thiss!914) (currentByte!12673 thiss!914) (size!6329 (buf!6851 thiss!914)))))

(assert (=> d!88182 (= (bitIndex!0 (size!6329 (buf!6851 thiss!914)) (currentByte!12673 thiss!914) (currentBit!12668 thiss!914)) lt!403583)))

(declare-fun b!261596 () Bool)

(declare-fun res!218965 () Bool)

(assert (=> b!261596 (=> (not res!218965) (not e!182049))))

(assert (=> b!261596 (= res!218965 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!403583))))

(declare-fun b!261597 () Bool)

(declare-fun lt!403582 () (_ BitVec 64))

(assert (=> b!261597 (= e!182049 (bvsle lt!403583 (bvmul lt!403582 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!261597 (or (= lt!403582 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!403582 #b0000000000000000000000000000000000000000000000000000000000001000) lt!403582)))))

(assert (=> b!261597 (= lt!403582 ((_ sign_extend 32) (size!6329 (buf!6851 thiss!914))))))

(assert (= (and d!88182 res!218964) b!261596))

(assert (= (and b!261596 res!218965) b!261597))

(declare-fun m!391557 () Bool)

(assert (=> d!88182 m!391557))

(declare-fun m!391559 () Bool)

(assert (=> d!88182 m!391559))

(assert (=> b!261563 d!88182))

(declare-fun d!88184 () Bool)

(assert (=> d!88184 (= (array_inv!6070 (buf!6851 thiss!914)) (bvsge (size!6329 (buf!6851 thiss!914)) #b00000000000000000000000000000000))))

(assert (=> b!261564 d!88184))

(declare-fun d!88186 () Bool)

(assert (=> d!88186 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6329 (buf!6851 thiss!914))) ((_ sign_extend 32) (currentByte!12673 thiss!914)) ((_ sign_extend 32) (currentBit!12668 thiss!914))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6329 (buf!6851 thiss!914))) ((_ sign_extend 32) (currentByte!12673 thiss!914)) ((_ sign_extend 32) (currentBit!12668 thiss!914))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!22351 () Bool)

(assert (= bs!22351 d!88186))

(assert (=> bs!22351 m!391557))

(assert (=> start!56988 d!88186))

(declare-fun d!88188 () Bool)

(assert (=> d!88188 (= (inv!12 thiss!914) (invariant!0 (currentBit!12668 thiss!914) (currentByte!12673 thiss!914) (size!6329 (buf!6851 thiss!914))))))

(declare-fun bs!22352 () Bool)

(assert (= bs!22352 d!88188))

(assert (=> bs!22352 m!391559))

(assert (=> start!56988 d!88188))

(declare-fun d!88190 () Bool)

(declare-fun e!182066 () Bool)

(assert (=> d!88190 e!182066))

(declare-fun res!218994 () Bool)

(assert (=> d!88190 (=> (not res!218994) (not e!182066))))

(declare-fun lt!403631 () (_ BitVec 64))

(declare-fun lt!403627 () (_ BitVec 64))

(declare-fun lt!403629 () tuple2!22386)

(assert (=> d!88190 (= res!218994 (= (bvadd lt!403627 lt!403631) (bitIndex!0 (size!6329 (buf!6851 (_2!12129 lt!403629))) (currentByte!12673 (_2!12129 lt!403629)) (currentBit!12668 (_2!12129 lt!403629)))))))

(assert (=> d!88190 (or (not (= (bvand lt!403627 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!403631 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!403627 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!403627 lt!403631) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!88190 (= lt!403631 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!88190 (= lt!403627 (bitIndex!0 (size!6329 (buf!6851 (_2!12129 lt!403527))) (currentByte!12673 (_2!12129 lt!403527)) (currentBit!12668 (_2!12129 lt!403527))))))

(declare-fun Unit!18663 () Unit!18655)

(declare-fun Unit!18664 () Unit!18655)

(assert (=> d!88190 (= lt!403629 (ite (bvslt (currentBit!12668 (_2!12129 lt!403527)) #b00000000000000000000000000000111) (tuple2!22387 Unit!18663 (BitStream!11581 (buf!6851 (_2!12129 lt!403527)) (currentByte!12673 (_2!12129 lt!403527)) (bvadd (currentBit!12668 (_2!12129 lt!403527)) #b00000000000000000000000000000001))) (tuple2!22387 Unit!18664 (BitStream!11581 (buf!6851 (_2!12129 lt!403527)) (bvadd (currentByte!12673 (_2!12129 lt!403527)) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (=> d!88190 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!6329 (buf!6851 (_2!12129 lt!403527)))) ((_ sign_extend 32) (currentByte!12673 (_2!12129 lt!403527))) ((_ sign_extend 32) (currentBit!12668 (_2!12129 lt!403527)))) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!88190 (= (increaseBitIndex!0 (_2!12129 lt!403527)) lt!403629)))

(declare-fun b!261624 () Bool)

(declare-fun res!218993 () Bool)

(assert (=> b!261624 (=> (not res!218993) (not e!182066))))

(declare-fun lt!403630 () (_ BitVec 64))

(declare-fun lt!403628 () (_ BitVec 64))

(assert (=> b!261624 (= res!218993 (= (bvsub lt!403630 lt!403628) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!261624 (or (= (bvand lt!403630 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!403628 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!403630 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!403630 lt!403628) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!261624 (= lt!403628 (remainingBits!0 ((_ sign_extend 32) (size!6329 (buf!6851 (_2!12129 lt!403629)))) ((_ sign_extend 32) (currentByte!12673 (_2!12129 lt!403629))) ((_ sign_extend 32) (currentBit!12668 (_2!12129 lt!403629)))))))

(assert (=> b!261624 (= lt!403630 (remainingBits!0 ((_ sign_extend 32) (size!6329 (buf!6851 (_2!12129 lt!403527)))) ((_ sign_extend 32) (currentByte!12673 (_2!12129 lt!403527))) ((_ sign_extend 32) (currentBit!12668 (_2!12129 lt!403527)))))))

(declare-fun b!261625 () Bool)

(assert (=> b!261625 (= e!182066 (= (size!6329 (buf!6851 (_2!12129 lt!403527))) (size!6329 (buf!6851 (_2!12129 lt!403629)))))))

(assert (= (and d!88190 res!218994) b!261624))

(assert (= (and b!261624 res!218993) b!261625))

(declare-fun m!391579 () Bool)

(assert (=> d!88190 m!391579))

(declare-fun m!391581 () Bool)

(assert (=> d!88190 m!391581))

(declare-fun m!391583 () Bool)

(assert (=> d!88190 m!391583))

(declare-fun m!391585 () Bool)

(assert (=> b!261624 m!391585))

(assert (=> b!261624 m!391583))

(assert (=> b!261565 d!88190))

(declare-fun d!88214 () Bool)

(declare-fun res!218999 () Bool)

(declare-fun e!182071 () Bool)

(assert (=> d!88214 (=> res!218999 e!182071)))

(assert (=> d!88214 (= res!218999 (= #b00000000000000000000000000000000 (currentByte!12673 (_2!12129 lt!403527))))))

(assert (=> d!88214 (= (arrayRangesEq!954 (buf!6851 thiss!914) (array!14505 (store (arr!7316 (buf!6851 thiss!914)) (currentByte!12673 (_2!12129 lt!403527)) (select (arr!7316 (buf!6851 (_2!12129 lt!403527))) (currentByte!12673 (_2!12129 lt!403527)))) (size!6329 (buf!6851 thiss!914))) #b00000000000000000000000000000000 (currentByte!12673 (_2!12129 lt!403527))) e!182071)))

(declare-fun b!261630 () Bool)

(declare-fun e!182072 () Bool)

(assert (=> b!261630 (= e!182071 e!182072)))

(declare-fun res!219000 () Bool)

(assert (=> b!261630 (=> (not res!219000) (not e!182072))))

(assert (=> b!261630 (= res!219000 (= (select (arr!7316 (buf!6851 thiss!914)) #b00000000000000000000000000000000) (select (arr!7316 (array!14505 (store (arr!7316 (buf!6851 thiss!914)) (currentByte!12673 (_2!12129 lt!403527)) (select (arr!7316 (buf!6851 (_2!12129 lt!403527))) (currentByte!12673 (_2!12129 lt!403527)))) (size!6329 (buf!6851 thiss!914)))) #b00000000000000000000000000000000)))))

(declare-fun b!261631 () Bool)

(assert (=> b!261631 (= e!182072 (arrayRangesEq!954 (buf!6851 thiss!914) (array!14505 (store (arr!7316 (buf!6851 thiss!914)) (currentByte!12673 (_2!12129 lt!403527)) (select (arr!7316 (buf!6851 (_2!12129 lt!403527))) (currentByte!12673 (_2!12129 lt!403527)))) (size!6329 (buf!6851 thiss!914))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12673 (_2!12129 lt!403527))))))

(assert (= (and d!88214 (not res!218999)) b!261630))

(assert (= (and b!261630 res!219000) b!261631))

(declare-fun m!391587 () Bool)

(assert (=> b!261630 m!391587))

(declare-fun m!391589 () Bool)

(assert (=> b!261630 m!391589))

(declare-fun m!391591 () Bool)

(assert (=> b!261631 m!391591))

(assert (=> b!261565 d!88214))

(declare-fun d!88216 () Bool)

(declare-fun e!182077 () Bool)

(assert (=> d!88216 e!182077))

(declare-fun res!219007 () Bool)

(assert (=> d!88216 (=> (not res!219007) (not e!182077))))

(assert (=> d!88216 (= res!219007 (and (bvsge (currentByte!12673 (_2!12129 lt!403527)) #b00000000000000000000000000000000) (bvslt (currentByte!12673 (_2!12129 lt!403527)) (size!6329 (buf!6851 thiss!914)))))))

(declare-fun lt!403648 () Unit!18655)

(declare-fun choose!363 (array!14504 (_ BitVec 32) (_ BitVec 8)) Unit!18655)

(assert (=> d!88216 (= lt!403648 (choose!363 (buf!6851 thiss!914) (currentByte!12673 (_2!12129 lt!403527)) (select (arr!7316 (buf!6851 (_2!12129 lt!403527))) (currentByte!12673 (_2!12129 lt!403527)))))))

(assert (=> d!88216 (and (bvsle #b00000000000000000000000000000000 (currentByte!12673 (_2!12129 lt!403527))) (bvslt (currentByte!12673 (_2!12129 lt!403527)) (size!6329 (buf!6851 thiss!914))))))

(assert (=> d!88216 (= (arrayUpdatedAtPrefixLemma!470 (buf!6851 thiss!914) (currentByte!12673 (_2!12129 lt!403527)) (select (arr!7316 (buf!6851 (_2!12129 lt!403527))) (currentByte!12673 (_2!12129 lt!403527)))) lt!403648)))

(declare-fun b!261638 () Bool)

(assert (=> b!261638 (= e!182077 (arrayRangesEq!954 (buf!6851 thiss!914) (array!14505 (store (arr!7316 (buf!6851 thiss!914)) (currentByte!12673 (_2!12129 lt!403527)) (select (arr!7316 (buf!6851 (_2!12129 lt!403527))) (currentByte!12673 (_2!12129 lt!403527)))) (size!6329 (buf!6851 thiss!914))) #b00000000000000000000000000000000 (currentByte!12673 (_2!12129 lt!403527))))))

(assert (= (and d!88216 res!219007) b!261638))

(assert (=> d!88216 m!391479))

(declare-fun m!391593 () Bool)

(assert (=> d!88216 m!391593))

(assert (=> b!261638 m!391477))

(assert (=> b!261638 m!391473))

(assert (=> b!261565 d!88216))

(declare-fun d!88218 () Bool)

(declare-fun res!219024 () Bool)

(declare-fun e!182086 () Bool)

(assert (=> d!88218 (=> (not res!219024) (not e!182086))))

(assert (=> d!88218 (= res!219024 (= (size!6329 (buf!6851 thiss!914)) (size!6329 (buf!6851 (_2!12129 lt!403528)))))))

(assert (=> d!88218 (= (isPrefixOf!0 thiss!914 (_2!12129 lt!403528)) e!182086)))

(declare-fun b!261653 () Bool)

(declare-fun res!219023 () Bool)

(assert (=> b!261653 (=> (not res!219023) (not e!182086))))

(assert (=> b!261653 (= res!219023 (bvsle (bitIndex!0 (size!6329 (buf!6851 thiss!914)) (currentByte!12673 thiss!914) (currentBit!12668 thiss!914)) (bitIndex!0 (size!6329 (buf!6851 (_2!12129 lt!403528))) (currentByte!12673 (_2!12129 lt!403528)) (currentBit!12668 (_2!12129 lt!403528)))))))

(declare-fun b!261654 () Bool)

(declare-fun e!182087 () Bool)

(assert (=> b!261654 (= e!182086 e!182087)))

(declare-fun res!219022 () Bool)

(assert (=> b!261654 (=> res!219022 e!182087)))

(assert (=> b!261654 (= res!219022 (= (size!6329 (buf!6851 thiss!914)) #b00000000000000000000000000000000))))

(declare-fun b!261655 () Bool)

(declare-fun arrayBitRangesEq!0 (array!14504 array!14504 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!261655 (= e!182087 (arrayBitRangesEq!0 (buf!6851 thiss!914) (buf!6851 (_2!12129 lt!403528)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6329 (buf!6851 thiss!914)) (currentByte!12673 thiss!914) (currentBit!12668 thiss!914))))))

(assert (= (and d!88218 res!219024) b!261653))

(assert (= (and b!261653 res!219023) b!261654))

(assert (= (and b!261654 (not res!219022)) b!261655))

(assert (=> b!261653 m!391497))

(assert (=> b!261653 m!391495))

(assert (=> b!261655 m!391497))

(assert (=> b!261655 m!391497))

(declare-fun m!391611 () Bool)

(assert (=> b!261655 m!391611))

(assert (=> b!261566 d!88218))

(declare-fun d!88228 () Bool)

(declare-datatypes ((tuple2!22398 0))(
  ( (tuple2!22399 (_1!12135 Bool) (_2!12135 BitStream!11580)) )
))
(declare-fun lt!403676 () tuple2!22398)

(declare-fun readBit!0 (BitStream!11580) tuple2!22398)

(assert (=> d!88228 (= lt!403676 (readBit!0 (readerFrom!0 (_2!12129 lt!403528) (currentBit!12668 thiss!914) (currentByte!12673 thiss!914))))))

(assert (=> d!88228 (= (readBitPure!0 (readerFrom!0 (_2!12129 lt!403528) (currentBit!12668 thiss!914) (currentByte!12673 thiss!914))) (tuple2!22389 (_2!12135 lt!403676) (_1!12135 lt!403676)))))

(declare-fun bs!22358 () Bool)

(assert (= bs!22358 d!88228))

(assert (=> bs!22358 m!391503))

(declare-fun m!391623 () Bool)

(assert (=> bs!22358 m!391623))

(assert (=> b!261561 d!88228))

(declare-fun d!88236 () Bool)

(declare-fun e!182106 () Bool)

(assert (=> d!88236 e!182106))

(declare-fun res!219049 () Bool)

(assert (=> d!88236 (=> (not res!219049) (not e!182106))))

(assert (=> d!88236 (= res!219049 (invariant!0 (currentBit!12668 (_2!12129 lt!403528)) (currentByte!12673 (_2!12129 lt!403528)) (size!6329 (buf!6851 (_2!12129 lt!403528)))))))

(assert (=> d!88236 (= (readerFrom!0 (_2!12129 lt!403528) (currentBit!12668 thiss!914) (currentByte!12673 thiss!914)) (BitStream!11581 (buf!6851 (_2!12129 lt!403528)) (currentByte!12673 thiss!914) (currentBit!12668 thiss!914)))))

(declare-fun b!261679 () Bool)

(assert (=> b!261679 (= e!182106 (invariant!0 (currentBit!12668 thiss!914) (currentByte!12673 thiss!914) (size!6329 (buf!6851 (_2!12129 lt!403528)))))))

(assert (= (and d!88236 res!219049) b!261679))

(assert (=> d!88236 m!391555))

(declare-fun m!391625 () Bool)

(assert (=> b!261679 m!391625))

(assert (=> b!261561 d!88236))

(check-sat (not d!88186) (not b!261655) (not d!88236) (not d!88172) (not b!261653) (not d!88216) (not b!261631) (not b!261624) (not d!88182) (not d!88188) (not b!261638) (not d!88190) (not d!88228) (not b!261679) (not d!88180))
(check-sat)
(get-model)

(declare-fun d!88244 () Bool)

(assert (=> d!88244 (= (remainingBits!0 ((_ sign_extend 32) (size!6329 (buf!6851 thiss!914))) ((_ sign_extend 32) (currentByte!12673 thiss!914)) ((_ sign_extend 32) (currentBit!12668 thiss!914))) (bvsub (bvmul ((_ sign_extend 32) (size!6329 (buf!6851 thiss!914))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12673 thiss!914)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12668 thiss!914)))))))

(assert (=> d!88182 d!88244))

(declare-fun d!88246 () Bool)

(assert (=> d!88246 (= (invariant!0 (currentBit!12668 thiss!914) (currentByte!12673 thiss!914) (size!6329 (buf!6851 thiss!914))) (and (bvsge (currentBit!12668 thiss!914) #b00000000000000000000000000000000) (bvslt (currentBit!12668 thiss!914) #b00000000000000000000000000001000) (bvsge (currentByte!12673 thiss!914) #b00000000000000000000000000000000) (or (bvslt (currentByte!12673 thiss!914) (size!6329 (buf!6851 thiss!914))) (and (= (currentBit!12668 thiss!914) #b00000000000000000000000000000000) (= (currentByte!12673 thiss!914) (size!6329 (buf!6851 thiss!914)))))))))

(assert (=> d!88182 d!88246))

(assert (=> d!88186 d!88244))

(assert (=> b!261638 d!88214))

(declare-fun d!88248 () Bool)

(assert (=> d!88248 (= (remainingBits!0 ((_ sign_extend 32) (size!6329 (buf!6851 (_1!12130 lt!403532)))) ((_ sign_extend 32) (currentByte!12673 (_1!12130 lt!403532))) ((_ sign_extend 32) (currentBit!12668 (_1!12130 lt!403532)))) (bvsub (bvmul ((_ sign_extend 32) (size!6329 (buf!6851 (_1!12130 lt!403532)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12673 (_1!12130 lt!403532))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12668 (_1!12130 lt!403532))))))))

(assert (=> d!88172 d!88248))

(declare-fun d!88250 () Bool)

(assert (=> d!88250 (= (invariant!0 (currentBit!12668 (_1!12130 lt!403532)) (currentByte!12673 (_1!12130 lt!403532)) (size!6329 (buf!6851 (_1!12130 lt!403532)))) (and (bvsge (currentBit!12668 (_1!12130 lt!403532)) #b00000000000000000000000000000000) (bvslt (currentBit!12668 (_1!12130 lt!403532)) #b00000000000000000000000000001000) (bvsge (currentByte!12673 (_1!12130 lt!403532)) #b00000000000000000000000000000000) (or (bvslt (currentByte!12673 (_1!12130 lt!403532)) (size!6329 (buf!6851 (_1!12130 lt!403532)))) (and (= (currentBit!12668 (_1!12130 lt!403532)) #b00000000000000000000000000000000) (= (currentByte!12673 (_1!12130 lt!403532)) (size!6329 (buf!6851 (_1!12130 lt!403532))))))))))

(assert (=> d!88172 d!88250))

(declare-fun d!88252 () Bool)

(declare-fun res!219077 () Bool)

(declare-fun e!182137 () Bool)

(assert (=> d!88252 (=> res!219077 e!182137)))

(assert (=> d!88252 (= res!219077 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6329 (buf!6851 thiss!914)) (currentByte!12673 thiss!914) (currentBit!12668 thiss!914))))))

(assert (=> d!88252 (= (arrayBitRangesEq!0 (buf!6851 thiss!914) (buf!6851 (_2!12129 lt!403528)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6329 (buf!6851 thiss!914)) (currentByte!12673 thiss!914) (currentBit!12668 thiss!914))) e!182137)))

(declare-fun b!261710 () Bool)

(declare-fun e!182132 () Bool)

(declare-fun e!182134 () Bool)

(assert (=> b!261710 (= e!182132 e!182134)))

(declare-fun lt!403712 () (_ BitVec 32))

(declare-datatypes ((tuple4!312 0))(
  ( (tuple4!313 (_1!12136 (_ BitVec 32)) (_2!12136 (_ BitVec 32)) (_3!936 (_ BitVec 32)) (_4!156 (_ BitVec 32))) )
))
(declare-fun lt!403711 () tuple4!312)

(declare-fun res!219076 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!261710 (= res!219076 (byteRangesEq!0 (select (arr!7316 (buf!6851 thiss!914)) (_3!936 lt!403711)) (select (arr!7316 (buf!6851 (_2!12129 lt!403528))) (_3!936 lt!403711)) lt!403712 #b00000000000000000000000000001000))))

(assert (=> b!261710 (=> (not res!219076) (not e!182134))))

(declare-fun b!261711 () Bool)

(declare-fun e!182135 () Bool)

(assert (=> b!261711 (= e!182137 e!182135)))

(declare-fun res!219079 () Bool)

(assert (=> b!261711 (=> (not res!219079) (not e!182135))))

(declare-fun e!182136 () Bool)

(assert (=> b!261711 (= res!219079 e!182136)))

(declare-fun res!219078 () Bool)

(assert (=> b!261711 (=> res!219078 e!182136)))

(assert (=> b!261711 (= res!219078 (bvsge (_1!12136 lt!403711) (_2!12136 lt!403711)))))

(declare-fun lt!403710 () (_ BitVec 32))

(assert (=> b!261711 (= lt!403710 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6329 (buf!6851 thiss!914)) (currentByte!12673 thiss!914) (currentBit!12668 thiss!914)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!261711 (= lt!403712 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!312)

(assert (=> b!261711 (= lt!403711 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6329 (buf!6851 thiss!914)) (currentByte!12673 thiss!914) (currentBit!12668 thiss!914))))))

(declare-fun b!261712 () Bool)

(assert (=> b!261712 (= e!182135 e!182132)))

(declare-fun c!11988 () Bool)

(assert (=> b!261712 (= c!11988 (= (_3!936 lt!403711) (_4!156 lt!403711)))))

(declare-fun bm!4016 () Bool)

(declare-fun call!4019 () Bool)

(assert (=> bm!4016 (= call!4019 (byteRangesEq!0 (ite c!11988 (select (arr!7316 (buf!6851 thiss!914)) (_3!936 lt!403711)) (select (arr!7316 (buf!6851 thiss!914)) (_4!156 lt!403711))) (ite c!11988 (select (arr!7316 (buf!6851 (_2!12129 lt!403528))) (_3!936 lt!403711)) (select (arr!7316 (buf!6851 (_2!12129 lt!403528))) (_4!156 lt!403711))) (ite c!11988 lt!403712 #b00000000000000000000000000000000) lt!403710))))

(declare-fun b!261713 () Bool)

(declare-fun res!219080 () Bool)

(assert (=> b!261713 (= res!219080 (= lt!403710 #b00000000000000000000000000000000))))

(declare-fun e!182133 () Bool)

(assert (=> b!261713 (=> res!219080 e!182133)))

(assert (=> b!261713 (= e!182134 e!182133)))

(declare-fun b!261714 () Bool)

(assert (=> b!261714 (= e!182133 call!4019)))

(declare-fun b!261715 () Bool)

(assert (=> b!261715 (= e!182136 (arrayRangesEq!954 (buf!6851 thiss!914) (buf!6851 (_2!12129 lt!403528)) (_1!12136 lt!403711) (_2!12136 lt!403711)))))

(declare-fun b!261716 () Bool)

(assert (=> b!261716 (= e!182132 call!4019)))

(assert (= (and d!88252 (not res!219077)) b!261711))

(assert (= (and b!261711 (not res!219078)) b!261715))

(assert (= (and b!261711 res!219079) b!261712))

(assert (= (and b!261712 c!11988) b!261716))

(assert (= (and b!261712 (not c!11988)) b!261710))

(assert (= (and b!261710 res!219076) b!261713))

(assert (= (and b!261713 (not res!219080)) b!261714))

(assert (= (or b!261716 b!261714) bm!4016))

(declare-fun m!391645 () Bool)

(assert (=> b!261710 m!391645))

(declare-fun m!391647 () Bool)

(assert (=> b!261710 m!391647))

(assert (=> b!261710 m!391645))

(assert (=> b!261710 m!391647))

(declare-fun m!391649 () Bool)

(assert (=> b!261710 m!391649))

(assert (=> b!261711 m!391497))

(declare-fun m!391651 () Bool)

(assert (=> b!261711 m!391651))

(declare-fun m!391653 () Bool)

(assert (=> bm!4016 m!391653))

(declare-fun m!391655 () Bool)

(assert (=> bm!4016 m!391655))

(assert (=> bm!4016 m!391647))

(declare-fun m!391657 () Bool)

(assert (=> bm!4016 m!391657))

(assert (=> bm!4016 m!391645))

(declare-fun m!391659 () Bool)

(assert (=> b!261715 m!391659))

(assert (=> b!261655 d!88252))

(assert (=> b!261655 d!88182))

(declare-fun d!88254 () Bool)

(assert (=> d!88254 (= (invariant!0 (currentBit!12668 (_2!12129 lt!403528)) (currentByte!12673 (_2!12129 lt!403528)) (size!6329 (buf!6851 (_2!12129 lt!403528)))) (and (bvsge (currentBit!12668 (_2!12129 lt!403528)) #b00000000000000000000000000000000) (bvslt (currentBit!12668 (_2!12129 lt!403528)) #b00000000000000000000000000001000) (bvsge (currentByte!12673 (_2!12129 lt!403528)) #b00000000000000000000000000000000) (or (bvslt (currentByte!12673 (_2!12129 lt!403528)) (size!6329 (buf!6851 (_2!12129 lt!403528)))) (and (= (currentBit!12668 (_2!12129 lt!403528)) #b00000000000000000000000000000000) (= (currentByte!12673 (_2!12129 lt!403528)) (size!6329 (buf!6851 (_2!12129 lt!403528))))))))))

(assert (=> d!88236 d!88254))

(declare-fun d!88256 () Bool)

(declare-fun e!182144 () Bool)

(assert (=> d!88256 e!182144))

(declare-fun res!219083 () Bool)

(assert (=> d!88256 (=> (not res!219083) (not e!182144))))

(assert (=> d!88256 (= res!219083 (= (buf!6851 (_2!12129 (increaseBitIndex!0 (readerFrom!0 (_2!12129 lt!403528) (currentBit!12668 thiss!914) (currentByte!12673 thiss!914))))) (buf!6851 (readerFrom!0 (_2!12129 lt!403528) (currentBit!12668 thiss!914) (currentByte!12673 thiss!914)))))))

(declare-fun lt!403732 () Bool)

(assert (=> d!88256 (= lt!403732 (not (= (bvand ((_ sign_extend 24) (select (arr!7316 (buf!6851 (readerFrom!0 (_2!12129 lt!403528) (currentBit!12668 thiss!914) (currentByte!12673 thiss!914)))) (currentByte!12673 (readerFrom!0 (_2!12129 lt!403528) (currentBit!12668 thiss!914) (currentByte!12673 thiss!914))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12668 (readerFrom!0 (_2!12129 lt!403528) (currentBit!12668 thiss!914) (currentByte!12673 thiss!914)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!403727 () tuple2!22398)

(assert (=> d!88256 (= lt!403727 (tuple2!22399 (not (= (bvand ((_ sign_extend 24) (select (arr!7316 (buf!6851 (readerFrom!0 (_2!12129 lt!403528) (currentBit!12668 thiss!914) (currentByte!12673 thiss!914)))) (currentByte!12673 (readerFrom!0 (_2!12129 lt!403528) (currentBit!12668 thiss!914) (currentByte!12673 thiss!914))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12668 (readerFrom!0 (_2!12129 lt!403528) (currentBit!12668 thiss!914) (currentByte!12673 thiss!914)))))) #b00000000000000000000000000000000)) (_2!12129 (increaseBitIndex!0 (readerFrom!0 (_2!12129 lt!403528) (currentBit!12668 thiss!914) (currentByte!12673 thiss!914))))))))

(assert (=> d!88256 (validate_offset_bit!0 ((_ sign_extend 32) (size!6329 (buf!6851 (readerFrom!0 (_2!12129 lt!403528) (currentBit!12668 thiss!914) (currentByte!12673 thiss!914))))) ((_ sign_extend 32) (currentByte!12673 (readerFrom!0 (_2!12129 lt!403528) (currentBit!12668 thiss!914) (currentByte!12673 thiss!914)))) ((_ sign_extend 32) (currentBit!12668 (readerFrom!0 (_2!12129 lt!403528) (currentBit!12668 thiss!914) (currentByte!12673 thiss!914)))))))

(assert (=> d!88256 (= (readBit!0 (readerFrom!0 (_2!12129 lt!403528) (currentBit!12668 thiss!914) (currentByte!12673 thiss!914))) lt!403727)))

(declare-fun b!261719 () Bool)

(declare-fun lt!403731 () (_ BitVec 64))

(declare-fun lt!403729 () (_ BitVec 64))

(assert (=> b!261719 (= e!182144 (= (bitIndex!0 (size!6329 (buf!6851 (_2!12129 (increaseBitIndex!0 (readerFrom!0 (_2!12129 lt!403528) (currentBit!12668 thiss!914) (currentByte!12673 thiss!914)))))) (currentByte!12673 (_2!12129 (increaseBitIndex!0 (readerFrom!0 (_2!12129 lt!403528) (currentBit!12668 thiss!914) (currentByte!12673 thiss!914))))) (currentBit!12668 (_2!12129 (increaseBitIndex!0 (readerFrom!0 (_2!12129 lt!403528) (currentBit!12668 thiss!914) (currentByte!12673 thiss!914)))))) (bvadd lt!403729 lt!403731)))))

(assert (=> b!261719 (or (not (= (bvand lt!403729 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!403731 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!403729 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!403729 lt!403731) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!261719 (= lt!403731 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!261719 (= lt!403729 (bitIndex!0 (size!6329 (buf!6851 (readerFrom!0 (_2!12129 lt!403528) (currentBit!12668 thiss!914) (currentByte!12673 thiss!914)))) (currentByte!12673 (readerFrom!0 (_2!12129 lt!403528) (currentBit!12668 thiss!914) (currentByte!12673 thiss!914))) (currentBit!12668 (readerFrom!0 (_2!12129 lt!403528) (currentBit!12668 thiss!914) (currentByte!12673 thiss!914)))))))

(declare-fun lt!403733 () Bool)

(assert (=> b!261719 (= lt!403733 (not (= (bvand ((_ sign_extend 24) (select (arr!7316 (buf!6851 (readerFrom!0 (_2!12129 lt!403528) (currentBit!12668 thiss!914) (currentByte!12673 thiss!914)))) (currentByte!12673 (readerFrom!0 (_2!12129 lt!403528) (currentBit!12668 thiss!914) (currentByte!12673 thiss!914))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12668 (readerFrom!0 (_2!12129 lt!403528) (currentBit!12668 thiss!914) (currentByte!12673 thiss!914)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!403730 () Bool)

(assert (=> b!261719 (= lt!403730 (not (= (bvand ((_ sign_extend 24) (select (arr!7316 (buf!6851 (readerFrom!0 (_2!12129 lt!403528) (currentBit!12668 thiss!914) (currentByte!12673 thiss!914)))) (currentByte!12673 (readerFrom!0 (_2!12129 lt!403528) (currentBit!12668 thiss!914) (currentByte!12673 thiss!914))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12668 (readerFrom!0 (_2!12129 lt!403528) (currentBit!12668 thiss!914) (currentByte!12673 thiss!914)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!403728 () Bool)

(assert (=> b!261719 (= lt!403728 (not (= (bvand ((_ sign_extend 24) (select (arr!7316 (buf!6851 (readerFrom!0 (_2!12129 lt!403528) (currentBit!12668 thiss!914) (currentByte!12673 thiss!914)))) (currentByte!12673 (readerFrom!0 (_2!12129 lt!403528) (currentBit!12668 thiss!914) (currentByte!12673 thiss!914))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12668 (readerFrom!0 (_2!12129 lt!403528) (currentBit!12668 thiss!914) (currentByte!12673 thiss!914)))))) #b00000000000000000000000000000000)))))

(assert (= (and d!88256 res!219083) b!261719))

(assert (=> d!88256 m!391503))

(declare-fun m!391661 () Bool)

(assert (=> d!88256 m!391661))

(declare-fun m!391663 () Bool)

(assert (=> d!88256 m!391663))

(declare-fun m!391665 () Bool)

(assert (=> d!88256 m!391665))

(declare-fun m!391667 () Bool)

(assert (=> d!88256 m!391667))

(declare-fun m!391669 () Bool)

(assert (=> b!261719 m!391669))

(assert (=> b!261719 m!391665))

(assert (=> b!261719 m!391663))

(assert (=> b!261719 m!391503))

(assert (=> b!261719 m!391661))

(declare-fun m!391671 () Bool)

(assert (=> b!261719 m!391671))

(assert (=> d!88228 d!88256))

(declare-fun d!88258 () Bool)

(declare-fun e!182145 () Bool)

(assert (=> d!88258 e!182145))

(declare-fun res!219084 () Bool)

(assert (=> d!88258 (=> (not res!219084) (not e!182145))))

(declare-fun lt!403739 () (_ BitVec 64))

(declare-fun lt!403737 () (_ BitVec 64))

(declare-fun lt!403734 () (_ BitVec 64))

(assert (=> d!88258 (= res!219084 (= lt!403739 (bvsub lt!403737 lt!403734)))))

(assert (=> d!88258 (or (= (bvand lt!403737 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!403734 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!403737 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!403737 lt!403734) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!88258 (= lt!403734 (remainingBits!0 ((_ sign_extend 32) (size!6329 (buf!6851 (_2!12129 lt!403629)))) ((_ sign_extend 32) (currentByte!12673 (_2!12129 lt!403629))) ((_ sign_extend 32) (currentBit!12668 (_2!12129 lt!403629)))))))

(declare-fun lt!403736 () (_ BitVec 64))

(declare-fun lt!403735 () (_ BitVec 64))

(assert (=> d!88258 (= lt!403737 (bvmul lt!403736 lt!403735))))

(assert (=> d!88258 (or (= lt!403736 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!403735 (bvsdiv (bvmul lt!403736 lt!403735) lt!403736)))))

(assert (=> d!88258 (= lt!403735 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!88258 (= lt!403736 ((_ sign_extend 32) (size!6329 (buf!6851 (_2!12129 lt!403629)))))))

(assert (=> d!88258 (= lt!403739 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12673 (_2!12129 lt!403629))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12668 (_2!12129 lt!403629)))))))

(assert (=> d!88258 (invariant!0 (currentBit!12668 (_2!12129 lt!403629)) (currentByte!12673 (_2!12129 lt!403629)) (size!6329 (buf!6851 (_2!12129 lt!403629))))))

(assert (=> d!88258 (= (bitIndex!0 (size!6329 (buf!6851 (_2!12129 lt!403629))) (currentByte!12673 (_2!12129 lt!403629)) (currentBit!12668 (_2!12129 lt!403629))) lt!403739)))

(declare-fun b!261720 () Bool)

(declare-fun res!219085 () Bool)

(assert (=> b!261720 (=> (not res!219085) (not e!182145))))

(assert (=> b!261720 (= res!219085 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!403739))))

(declare-fun b!261721 () Bool)

(declare-fun lt!403738 () (_ BitVec 64))

(assert (=> b!261721 (= e!182145 (bvsle lt!403739 (bvmul lt!403738 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!261721 (or (= lt!403738 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!403738 #b0000000000000000000000000000000000000000000000000000000000001000) lt!403738)))))

(assert (=> b!261721 (= lt!403738 ((_ sign_extend 32) (size!6329 (buf!6851 (_2!12129 lt!403629)))))))

(assert (= (and d!88258 res!219084) b!261720))

(assert (= (and b!261720 res!219085) b!261721))

(assert (=> d!88258 m!391585))

(declare-fun m!391673 () Bool)

(assert (=> d!88258 m!391673))

(assert (=> d!88190 d!88258))

(declare-fun d!88260 () Bool)

(declare-fun e!182146 () Bool)

(assert (=> d!88260 e!182146))

(declare-fun res!219086 () Bool)

(assert (=> d!88260 (=> (not res!219086) (not e!182146))))

(declare-fun lt!403745 () (_ BitVec 64))

(declare-fun lt!403743 () (_ BitVec 64))

(declare-fun lt!403740 () (_ BitVec 64))

(assert (=> d!88260 (= res!219086 (= lt!403745 (bvsub lt!403743 lt!403740)))))

(assert (=> d!88260 (or (= (bvand lt!403743 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!403740 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!403743 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!403743 lt!403740) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!88260 (= lt!403740 (remainingBits!0 ((_ sign_extend 32) (size!6329 (buf!6851 (_2!12129 lt!403527)))) ((_ sign_extend 32) (currentByte!12673 (_2!12129 lt!403527))) ((_ sign_extend 32) (currentBit!12668 (_2!12129 lt!403527)))))))

(declare-fun lt!403742 () (_ BitVec 64))

(declare-fun lt!403741 () (_ BitVec 64))

(assert (=> d!88260 (= lt!403743 (bvmul lt!403742 lt!403741))))

(assert (=> d!88260 (or (= lt!403742 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!403741 (bvsdiv (bvmul lt!403742 lt!403741) lt!403742)))))

(assert (=> d!88260 (= lt!403741 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!88260 (= lt!403742 ((_ sign_extend 32) (size!6329 (buf!6851 (_2!12129 lt!403527)))))))

(assert (=> d!88260 (= lt!403745 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12673 (_2!12129 lt!403527))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12668 (_2!12129 lt!403527)))))))

(assert (=> d!88260 (invariant!0 (currentBit!12668 (_2!12129 lt!403527)) (currentByte!12673 (_2!12129 lt!403527)) (size!6329 (buf!6851 (_2!12129 lt!403527))))))

(assert (=> d!88260 (= (bitIndex!0 (size!6329 (buf!6851 (_2!12129 lt!403527))) (currentByte!12673 (_2!12129 lt!403527)) (currentBit!12668 (_2!12129 lt!403527))) lt!403745)))

(declare-fun b!261722 () Bool)

(declare-fun res!219087 () Bool)

(assert (=> b!261722 (=> (not res!219087) (not e!182146))))

(assert (=> b!261722 (= res!219087 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!403745))))

(declare-fun b!261723 () Bool)

(declare-fun lt!403744 () (_ BitVec 64))

(assert (=> b!261723 (= e!182146 (bvsle lt!403745 (bvmul lt!403744 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!261723 (or (= lt!403744 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!403744 #b0000000000000000000000000000000000000000000000000000000000001000) lt!403744)))))

(assert (=> b!261723 (= lt!403744 ((_ sign_extend 32) (size!6329 (buf!6851 (_2!12129 lt!403527)))))))

(assert (= (and d!88260 res!219086) b!261722))

(assert (= (and b!261722 res!219087) b!261723))

(assert (=> d!88260 m!391583))

(declare-fun m!391675 () Bool)

(assert (=> d!88260 m!391675))

(assert (=> d!88190 d!88260))

(declare-fun d!88262 () Bool)

(assert (=> d!88262 (= (remainingBits!0 ((_ sign_extend 32) (size!6329 (buf!6851 (_2!12129 lt!403527)))) ((_ sign_extend 32) (currentByte!12673 (_2!12129 lt!403527))) ((_ sign_extend 32) (currentBit!12668 (_2!12129 lt!403527)))) (bvsub (bvmul ((_ sign_extend 32) (size!6329 (buf!6851 (_2!12129 lt!403527)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12673 (_2!12129 lt!403527))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12668 (_2!12129 lt!403527))))))))

(assert (=> d!88190 d!88262))

(declare-fun d!88264 () Bool)

(assert (=> d!88264 (= (remainingBits!0 ((_ sign_extend 32) (size!6329 (buf!6851 (_2!12129 lt!403528)))) ((_ sign_extend 32) (currentByte!12673 (_2!12129 lt!403528))) ((_ sign_extend 32) (currentBit!12668 (_2!12129 lt!403528)))) (bvsub (bvmul ((_ sign_extend 32) (size!6329 (buf!6851 (_2!12129 lt!403528)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12673 (_2!12129 lt!403528))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12668 (_2!12129 lt!403528))))))))

(assert (=> d!88180 d!88264))

(assert (=> d!88180 d!88254))

(assert (=> b!261653 d!88182))

(assert (=> b!261653 d!88180))

(declare-fun d!88266 () Bool)

(assert (=> d!88266 (= (invariant!0 (currentBit!12668 thiss!914) (currentByte!12673 thiss!914) (size!6329 (buf!6851 (_2!12129 lt!403528)))) (and (bvsge (currentBit!12668 thiss!914) #b00000000000000000000000000000000) (bvslt (currentBit!12668 thiss!914) #b00000000000000000000000000001000) (bvsge (currentByte!12673 thiss!914) #b00000000000000000000000000000000) (or (bvslt (currentByte!12673 thiss!914) (size!6329 (buf!6851 (_2!12129 lt!403528)))) (and (= (currentBit!12668 thiss!914) #b00000000000000000000000000000000) (= (currentByte!12673 thiss!914) (size!6329 (buf!6851 (_2!12129 lt!403528))))))))))

(assert (=> b!261679 d!88266))

(declare-fun d!88268 () Bool)

(declare-fun res!219088 () Bool)

(declare-fun e!182147 () Bool)

(assert (=> d!88268 (=> res!219088 e!182147)))

(assert (=> d!88268 (= res!219088 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12673 (_2!12129 lt!403527))))))

(assert (=> d!88268 (= (arrayRangesEq!954 (buf!6851 thiss!914) (array!14505 (store (arr!7316 (buf!6851 thiss!914)) (currentByte!12673 (_2!12129 lt!403527)) (select (arr!7316 (buf!6851 (_2!12129 lt!403527))) (currentByte!12673 (_2!12129 lt!403527)))) (size!6329 (buf!6851 thiss!914))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12673 (_2!12129 lt!403527))) e!182147)))

(declare-fun b!261724 () Bool)

(declare-fun e!182148 () Bool)

(assert (=> b!261724 (= e!182147 e!182148)))

(declare-fun res!219089 () Bool)

(assert (=> b!261724 (=> (not res!219089) (not e!182148))))

(assert (=> b!261724 (= res!219089 (= (select (arr!7316 (buf!6851 thiss!914)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!7316 (array!14505 (store (arr!7316 (buf!6851 thiss!914)) (currentByte!12673 (_2!12129 lt!403527)) (select (arr!7316 (buf!6851 (_2!12129 lt!403527))) (currentByte!12673 (_2!12129 lt!403527)))) (size!6329 (buf!6851 thiss!914)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!261725 () Bool)

(assert (=> b!261725 (= e!182148 (arrayRangesEq!954 (buf!6851 thiss!914) (array!14505 (store (arr!7316 (buf!6851 thiss!914)) (currentByte!12673 (_2!12129 lt!403527)) (select (arr!7316 (buf!6851 (_2!12129 lt!403527))) (currentByte!12673 (_2!12129 lt!403527)))) (size!6329 (buf!6851 thiss!914))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!12673 (_2!12129 lt!403527))))))

(assert (= (and d!88268 (not res!219088)) b!261724))

(assert (= (and b!261724 res!219089) b!261725))

(declare-fun m!391677 () Bool)

(assert (=> b!261724 m!391677))

(declare-fun m!391679 () Bool)

(assert (=> b!261724 m!391679))

(declare-fun m!391681 () Bool)

(assert (=> b!261725 m!391681))

(assert (=> b!261631 d!88268))

(declare-fun d!88270 () Bool)

(assert (=> d!88270 (arrayRangesEq!954 (buf!6851 thiss!914) (array!14505 (store (arr!7316 (buf!6851 thiss!914)) (currentByte!12673 (_2!12129 lt!403527)) (select (arr!7316 (buf!6851 (_2!12129 lt!403527))) (currentByte!12673 (_2!12129 lt!403527)))) (size!6329 (buf!6851 thiss!914))) #b00000000000000000000000000000000 (currentByte!12673 (_2!12129 lt!403527)))))

(assert (=> d!88270 true))

(declare-fun _$8!223 () Unit!18655)

(assert (=> d!88270 (= (choose!363 (buf!6851 thiss!914) (currentByte!12673 (_2!12129 lt!403527)) (select (arr!7316 (buf!6851 (_2!12129 lt!403527))) (currentByte!12673 (_2!12129 lt!403527)))) _$8!223)))

(declare-fun bs!22359 () Bool)

(assert (= bs!22359 d!88270))

(assert (=> bs!22359 m!391477))

(assert (=> bs!22359 m!391473))

(assert (=> d!88216 d!88270))

(declare-fun d!88272 () Bool)

(assert (=> d!88272 (= (remainingBits!0 ((_ sign_extend 32) (size!6329 (buf!6851 (_2!12129 lt!403629)))) ((_ sign_extend 32) (currentByte!12673 (_2!12129 lt!403629))) ((_ sign_extend 32) (currentBit!12668 (_2!12129 lt!403629)))) (bvsub (bvmul ((_ sign_extend 32) (size!6329 (buf!6851 (_2!12129 lt!403629)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12673 (_2!12129 lt!403629))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12668 (_2!12129 lt!403629))))))))

(assert (=> b!261624 d!88272))

(assert (=> b!261624 d!88262))

(assert (=> d!88188 d!88246))

(check-sat (not b!261725) (not b!261715) (not bm!4016) (not b!261710) (not d!88256) (not d!88260) (not d!88270) (not b!261711) (not d!88258) (not b!261719))
(check-sat)
(get-model)

(declare-fun d!88334 () Bool)

(assert (=> d!88334 (= (byteRangesEq!0 (ite c!11988 (select (arr!7316 (buf!6851 thiss!914)) (_3!936 lt!403711)) (select (arr!7316 (buf!6851 thiss!914)) (_4!156 lt!403711))) (ite c!11988 (select (arr!7316 (buf!6851 (_2!12129 lt!403528))) (_3!936 lt!403711)) (select (arr!7316 (buf!6851 (_2!12129 lt!403528))) (_4!156 lt!403711))) (ite c!11988 lt!403712 #b00000000000000000000000000000000) lt!403710) (or (= (ite c!11988 lt!403712 #b00000000000000000000000000000000) lt!403710) (= (bvand (bvand (bvand ((_ sign_extend 24) (ite c!11988 (select (arr!7316 (buf!6851 thiss!914)) (_3!936 lt!403711)) (select (arr!7316 (buf!6851 thiss!914)) (_4!156 lt!403711)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!403710))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!11988 lt!403712 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (ite c!11988 (select (arr!7316 (buf!6851 (_2!12129 lt!403528))) (_3!936 lt!403711)) (select (arr!7316 (buf!6851 (_2!12129 lt!403528))) (_4!156 lt!403711)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!403710))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!11988 lt!403712 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111))))))

(declare-fun bs!22362 () Bool)

(assert (= bs!22362 d!88334))

(declare-fun m!391759 () Bool)

(assert (=> bs!22362 m!391759))

(declare-fun m!391761 () Bool)

(assert (=> bs!22362 m!391761))

(assert (=> bm!4016 d!88334))

(assert (=> d!88260 d!88262))

(declare-fun d!88336 () Bool)

(assert (=> d!88336 (= (invariant!0 (currentBit!12668 (_2!12129 lt!403527)) (currentByte!12673 (_2!12129 lt!403527)) (size!6329 (buf!6851 (_2!12129 lt!403527)))) (and (bvsge (currentBit!12668 (_2!12129 lt!403527)) #b00000000000000000000000000000000) (bvslt (currentBit!12668 (_2!12129 lt!403527)) #b00000000000000000000000000001000) (bvsge (currentByte!12673 (_2!12129 lt!403527)) #b00000000000000000000000000000000) (or (bvslt (currentByte!12673 (_2!12129 lt!403527)) (size!6329 (buf!6851 (_2!12129 lt!403527)))) (and (= (currentBit!12668 (_2!12129 lt!403527)) #b00000000000000000000000000000000) (= (currentByte!12673 (_2!12129 lt!403527)) (size!6329 (buf!6851 (_2!12129 lt!403527))))))))))

(assert (=> d!88260 d!88336))

(declare-fun d!88338 () Bool)

(assert (=> d!88338 (= (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6329 (buf!6851 thiss!914)) (currentByte!12673 thiss!914) (currentBit!12668 thiss!914))) (tuple4!313 ((_ extract 31 0) (bvadd (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!6329 (buf!6851 thiss!914)) (currentByte!12673 thiss!914) (currentBit!12668 thiss!914)) #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!6329 (buf!6851 thiss!914)) (currentByte!12673 thiss!914) (currentBit!12668 thiss!914)) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!261711 d!88338))

(declare-fun d!88340 () Bool)

(assert (=> d!88340 (= (byteRangesEq!0 (select (arr!7316 (buf!6851 thiss!914)) (_3!936 lt!403711)) (select (arr!7316 (buf!6851 (_2!12129 lt!403528))) (_3!936 lt!403711)) lt!403712 #b00000000000000000000000000001000) (or (= lt!403712 #b00000000000000000000000000001000) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7316 (buf!6851 thiss!914)) (_3!936 lt!403711))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!403712)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7316 (buf!6851 (_2!12129 lt!403528))) (_3!936 lt!403711))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!403712)))) #b00000000000000000000000011111111))))))

(declare-fun bs!22363 () Bool)

(assert (= bs!22363 d!88340))

(declare-fun m!391763 () Bool)

(assert (=> bs!22363 m!391763))

(declare-fun m!391765 () Bool)

(assert (=> bs!22363 m!391765))

(assert (=> b!261710 d!88340))

(assert (=> d!88258 d!88272))

(declare-fun d!88342 () Bool)

(assert (=> d!88342 (= (invariant!0 (currentBit!12668 (_2!12129 lt!403629)) (currentByte!12673 (_2!12129 lt!403629)) (size!6329 (buf!6851 (_2!12129 lt!403629)))) (and (bvsge (currentBit!12668 (_2!12129 lt!403629)) #b00000000000000000000000000000000) (bvslt (currentBit!12668 (_2!12129 lt!403629)) #b00000000000000000000000000001000) (bvsge (currentByte!12673 (_2!12129 lt!403629)) #b00000000000000000000000000000000) (or (bvslt (currentByte!12673 (_2!12129 lt!403629)) (size!6329 (buf!6851 (_2!12129 lt!403629)))) (and (= (currentBit!12668 (_2!12129 lt!403629)) #b00000000000000000000000000000000) (= (currentByte!12673 (_2!12129 lt!403629)) (size!6329 (buf!6851 (_2!12129 lt!403629))))))))))

(assert (=> d!88258 d!88342))

(declare-fun d!88344 () Bool)

(declare-fun res!219138 () Bool)

(declare-fun e!182207 () Bool)

(assert (=> d!88344 (=> res!219138 e!182207)))

(assert (=> d!88344 (= res!219138 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!12673 (_2!12129 lt!403527))))))

(assert (=> d!88344 (= (arrayRangesEq!954 (buf!6851 thiss!914) (array!14505 (store (arr!7316 (buf!6851 thiss!914)) (currentByte!12673 (_2!12129 lt!403527)) (select (arr!7316 (buf!6851 (_2!12129 lt!403527))) (currentByte!12673 (_2!12129 lt!403527)))) (size!6329 (buf!6851 thiss!914))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!12673 (_2!12129 lt!403527))) e!182207)))

(declare-fun b!261786 () Bool)

(declare-fun e!182208 () Bool)

(assert (=> b!261786 (= e!182207 e!182208)))

(declare-fun res!219139 () Bool)

(assert (=> b!261786 (=> (not res!219139) (not e!182208))))

(assert (=> b!261786 (= res!219139 (= (select (arr!7316 (buf!6851 thiss!914)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (select (arr!7316 (array!14505 (store (arr!7316 (buf!6851 thiss!914)) (currentByte!12673 (_2!12129 lt!403527)) (select (arr!7316 (buf!6851 (_2!12129 lt!403527))) (currentByte!12673 (_2!12129 lt!403527)))) (size!6329 (buf!6851 thiss!914)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!261787 () Bool)

(assert (=> b!261787 (= e!182208 (arrayRangesEq!954 (buf!6851 thiss!914) (array!14505 (store (arr!7316 (buf!6851 thiss!914)) (currentByte!12673 (_2!12129 lt!403527)) (select (arr!7316 (buf!6851 (_2!12129 lt!403527))) (currentByte!12673 (_2!12129 lt!403527)))) (size!6329 (buf!6851 thiss!914))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!12673 (_2!12129 lt!403527))))))

(assert (= (and d!88344 (not res!219138)) b!261786))

(assert (= (and b!261786 res!219139) b!261787))

(declare-fun m!391767 () Bool)

(assert (=> b!261786 m!391767))

(declare-fun m!391769 () Bool)

(assert (=> b!261786 m!391769))

(declare-fun m!391771 () Bool)

(assert (=> b!261787 m!391771))

(assert (=> b!261725 d!88344))

(declare-fun d!88346 () Bool)

(declare-fun res!219140 () Bool)

(declare-fun e!182209 () Bool)

(assert (=> d!88346 (=> res!219140 e!182209)))

(assert (=> d!88346 (= res!219140 (= (_1!12136 lt!403711) (_2!12136 lt!403711)))))

(assert (=> d!88346 (= (arrayRangesEq!954 (buf!6851 thiss!914) (buf!6851 (_2!12129 lt!403528)) (_1!12136 lt!403711) (_2!12136 lt!403711)) e!182209)))

(declare-fun b!261788 () Bool)

(declare-fun e!182210 () Bool)

(assert (=> b!261788 (= e!182209 e!182210)))

(declare-fun res!219141 () Bool)

(assert (=> b!261788 (=> (not res!219141) (not e!182210))))

(assert (=> b!261788 (= res!219141 (= (select (arr!7316 (buf!6851 thiss!914)) (_1!12136 lt!403711)) (select (arr!7316 (buf!6851 (_2!12129 lt!403528))) (_1!12136 lt!403711))))))

(declare-fun b!261789 () Bool)

(assert (=> b!261789 (= e!182210 (arrayRangesEq!954 (buf!6851 thiss!914) (buf!6851 (_2!12129 lt!403528)) (bvadd (_1!12136 lt!403711) #b00000000000000000000000000000001) (_2!12136 lt!403711)))))

(assert (= (and d!88346 (not res!219140)) b!261788))

(assert (= (and b!261788 res!219141) b!261789))

(declare-fun m!391773 () Bool)

(assert (=> b!261788 m!391773))

(declare-fun m!391775 () Bool)

(assert (=> b!261788 m!391775))

(declare-fun m!391777 () Bool)

(assert (=> b!261789 m!391777))

(assert (=> b!261715 d!88346))

(declare-fun d!88348 () Bool)

(declare-fun e!182211 () Bool)

(assert (=> d!88348 e!182211))

(declare-fun res!219143 () Bool)

(assert (=> d!88348 (=> (not res!219143) (not e!182211))))

(declare-fun lt!403832 () tuple2!22386)

(declare-fun lt!403830 () (_ BitVec 64))

(declare-fun lt!403834 () (_ BitVec 64))

(assert (=> d!88348 (= res!219143 (= (bvadd lt!403830 lt!403834) (bitIndex!0 (size!6329 (buf!6851 (_2!12129 lt!403832))) (currentByte!12673 (_2!12129 lt!403832)) (currentBit!12668 (_2!12129 lt!403832)))))))

(assert (=> d!88348 (or (not (= (bvand lt!403830 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!403834 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!403830 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!403830 lt!403834) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!88348 (= lt!403834 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!88348 (= lt!403830 (bitIndex!0 (size!6329 (buf!6851 (readerFrom!0 (_2!12129 lt!403528) (currentBit!12668 thiss!914) (currentByte!12673 thiss!914)))) (currentByte!12673 (readerFrom!0 (_2!12129 lt!403528) (currentBit!12668 thiss!914) (currentByte!12673 thiss!914))) (currentBit!12668 (readerFrom!0 (_2!12129 lt!403528) (currentBit!12668 thiss!914) (currentByte!12673 thiss!914)))))))

(declare-fun Unit!18669 () Unit!18655)

(declare-fun Unit!18670 () Unit!18655)

(assert (=> d!88348 (= lt!403832 (ite (bvslt (currentBit!12668 (readerFrom!0 (_2!12129 lt!403528) (currentBit!12668 thiss!914) (currentByte!12673 thiss!914))) #b00000000000000000000000000000111) (tuple2!22387 Unit!18669 (BitStream!11581 (buf!6851 (readerFrom!0 (_2!12129 lt!403528) (currentBit!12668 thiss!914) (currentByte!12673 thiss!914))) (currentByte!12673 (readerFrom!0 (_2!12129 lt!403528) (currentBit!12668 thiss!914) (currentByte!12673 thiss!914))) (bvadd (currentBit!12668 (readerFrom!0 (_2!12129 lt!403528) (currentBit!12668 thiss!914) (currentByte!12673 thiss!914))) #b00000000000000000000000000000001))) (tuple2!22387 Unit!18670 (BitStream!11581 (buf!6851 (readerFrom!0 (_2!12129 lt!403528) (currentBit!12668 thiss!914) (currentByte!12673 thiss!914))) (bvadd (currentByte!12673 (readerFrom!0 (_2!12129 lt!403528) (currentBit!12668 thiss!914) (currentByte!12673 thiss!914))) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (=> d!88348 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!6329 (buf!6851 (readerFrom!0 (_2!12129 lt!403528) (currentBit!12668 thiss!914) (currentByte!12673 thiss!914))))) ((_ sign_extend 32) (currentByte!12673 (readerFrom!0 (_2!12129 lt!403528) (currentBit!12668 thiss!914) (currentByte!12673 thiss!914)))) ((_ sign_extend 32) (currentBit!12668 (readerFrom!0 (_2!12129 lt!403528) (currentBit!12668 thiss!914) (currentByte!12673 thiss!914))))) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!88348 (= (increaseBitIndex!0 (readerFrom!0 (_2!12129 lt!403528) (currentBit!12668 thiss!914) (currentByte!12673 thiss!914))) lt!403832)))

(declare-fun b!261790 () Bool)

(declare-fun res!219142 () Bool)

(assert (=> b!261790 (=> (not res!219142) (not e!182211))))

(declare-fun lt!403833 () (_ BitVec 64))

(declare-fun lt!403831 () (_ BitVec 64))

(assert (=> b!261790 (= res!219142 (= (bvsub lt!403833 lt!403831) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!261790 (or (= (bvand lt!403833 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!403831 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!403833 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!403833 lt!403831) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!261790 (= lt!403831 (remainingBits!0 ((_ sign_extend 32) (size!6329 (buf!6851 (_2!12129 lt!403832)))) ((_ sign_extend 32) (currentByte!12673 (_2!12129 lt!403832))) ((_ sign_extend 32) (currentBit!12668 (_2!12129 lt!403832)))))))

(assert (=> b!261790 (= lt!403833 (remainingBits!0 ((_ sign_extend 32) (size!6329 (buf!6851 (readerFrom!0 (_2!12129 lt!403528) (currentBit!12668 thiss!914) (currentByte!12673 thiss!914))))) ((_ sign_extend 32) (currentByte!12673 (readerFrom!0 (_2!12129 lt!403528) (currentBit!12668 thiss!914) (currentByte!12673 thiss!914)))) ((_ sign_extend 32) (currentBit!12668 (readerFrom!0 (_2!12129 lt!403528) (currentBit!12668 thiss!914) (currentByte!12673 thiss!914))))))))

(declare-fun b!261791 () Bool)

(assert (=> b!261791 (= e!182211 (= (size!6329 (buf!6851 (readerFrom!0 (_2!12129 lt!403528) (currentBit!12668 thiss!914) (currentByte!12673 thiss!914)))) (size!6329 (buf!6851 (_2!12129 lt!403832)))))))

(assert (= (and d!88348 res!219143) b!261790))

(assert (= (and b!261790 res!219142) b!261791))

(declare-fun m!391779 () Bool)

(assert (=> d!88348 m!391779))

(assert (=> d!88348 m!391671))

(declare-fun m!391781 () Bool)

(assert (=> d!88348 m!391781))

(declare-fun m!391783 () Bool)

(assert (=> b!261790 m!391783))

(assert (=> b!261790 m!391781))

(assert (=> d!88256 d!88348))

(declare-fun d!88350 () Bool)

(assert (=> d!88350 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6329 (buf!6851 (readerFrom!0 (_2!12129 lt!403528) (currentBit!12668 thiss!914) (currentByte!12673 thiss!914))))) ((_ sign_extend 32) (currentByte!12673 (readerFrom!0 (_2!12129 lt!403528) (currentBit!12668 thiss!914) (currentByte!12673 thiss!914)))) ((_ sign_extend 32) (currentBit!12668 (readerFrom!0 (_2!12129 lt!403528) (currentBit!12668 thiss!914) (currentByte!12673 thiss!914))))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6329 (buf!6851 (readerFrom!0 (_2!12129 lt!403528) (currentBit!12668 thiss!914) (currentByte!12673 thiss!914))))) ((_ sign_extend 32) (currentByte!12673 (readerFrom!0 (_2!12129 lt!403528) (currentBit!12668 thiss!914) (currentByte!12673 thiss!914)))) ((_ sign_extend 32) (currentBit!12668 (readerFrom!0 (_2!12129 lt!403528) (currentBit!12668 thiss!914) (currentByte!12673 thiss!914))))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!22364 () Bool)

(assert (= bs!22364 d!88350))

(assert (=> bs!22364 m!391781))

(assert (=> d!88256 d!88350))

(assert (=> d!88270 d!88214))

(declare-fun d!88352 () Bool)

(declare-fun e!182212 () Bool)

(assert (=> d!88352 e!182212))

(declare-fun res!219144 () Bool)

(assert (=> d!88352 (=> (not res!219144) (not e!182212))))

(declare-fun lt!403835 () (_ BitVec 64))

(declare-fun lt!403840 () (_ BitVec 64))

(declare-fun lt!403838 () (_ BitVec 64))

(assert (=> d!88352 (= res!219144 (= lt!403840 (bvsub lt!403838 lt!403835)))))

(assert (=> d!88352 (or (= (bvand lt!403838 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!403835 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!403838 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!403838 lt!403835) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!88352 (= lt!403835 (remainingBits!0 ((_ sign_extend 32) (size!6329 (buf!6851 (_2!12129 (increaseBitIndex!0 (readerFrom!0 (_2!12129 lt!403528) (currentBit!12668 thiss!914) (currentByte!12673 thiss!914))))))) ((_ sign_extend 32) (currentByte!12673 (_2!12129 (increaseBitIndex!0 (readerFrom!0 (_2!12129 lt!403528) (currentBit!12668 thiss!914) (currentByte!12673 thiss!914)))))) ((_ sign_extend 32) (currentBit!12668 (_2!12129 (increaseBitIndex!0 (readerFrom!0 (_2!12129 lt!403528) (currentBit!12668 thiss!914) (currentByte!12673 thiss!914))))))))))

(declare-fun lt!403837 () (_ BitVec 64))

(declare-fun lt!403836 () (_ BitVec 64))

(assert (=> d!88352 (= lt!403838 (bvmul lt!403837 lt!403836))))

(assert (=> d!88352 (or (= lt!403837 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!403836 (bvsdiv (bvmul lt!403837 lt!403836) lt!403837)))))

(assert (=> d!88352 (= lt!403836 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!88352 (= lt!403837 ((_ sign_extend 32) (size!6329 (buf!6851 (_2!12129 (increaseBitIndex!0 (readerFrom!0 (_2!12129 lt!403528) (currentBit!12668 thiss!914) (currentByte!12673 thiss!914))))))))))

(assert (=> d!88352 (= lt!403840 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12673 (_2!12129 (increaseBitIndex!0 (readerFrom!0 (_2!12129 lt!403528) (currentBit!12668 thiss!914) (currentByte!12673 thiss!914)))))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12668 (_2!12129 (increaseBitIndex!0 (readerFrom!0 (_2!12129 lt!403528) (currentBit!12668 thiss!914) (currentByte!12673 thiss!914))))))))))

(assert (=> d!88352 (invariant!0 (currentBit!12668 (_2!12129 (increaseBitIndex!0 (readerFrom!0 (_2!12129 lt!403528) (currentBit!12668 thiss!914) (currentByte!12673 thiss!914))))) (currentByte!12673 (_2!12129 (increaseBitIndex!0 (readerFrom!0 (_2!12129 lt!403528) (currentBit!12668 thiss!914) (currentByte!12673 thiss!914))))) (size!6329 (buf!6851 (_2!12129 (increaseBitIndex!0 (readerFrom!0 (_2!12129 lt!403528) (currentBit!12668 thiss!914) (currentByte!12673 thiss!914)))))))))

(assert (=> d!88352 (= (bitIndex!0 (size!6329 (buf!6851 (_2!12129 (increaseBitIndex!0 (readerFrom!0 (_2!12129 lt!403528) (currentBit!12668 thiss!914) (currentByte!12673 thiss!914)))))) (currentByte!12673 (_2!12129 (increaseBitIndex!0 (readerFrom!0 (_2!12129 lt!403528) (currentBit!12668 thiss!914) (currentByte!12673 thiss!914))))) (currentBit!12668 (_2!12129 (increaseBitIndex!0 (readerFrom!0 (_2!12129 lt!403528) (currentBit!12668 thiss!914) (currentByte!12673 thiss!914)))))) lt!403840)))

(declare-fun b!261792 () Bool)

(declare-fun res!219145 () Bool)

(assert (=> b!261792 (=> (not res!219145) (not e!182212))))

(assert (=> b!261792 (= res!219145 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!403840))))

(declare-fun b!261793 () Bool)

(declare-fun lt!403839 () (_ BitVec 64))

(assert (=> b!261793 (= e!182212 (bvsle lt!403840 (bvmul lt!403839 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!261793 (or (= lt!403839 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!403839 #b0000000000000000000000000000000000000000000000000000000000001000) lt!403839)))))

(assert (=> b!261793 (= lt!403839 ((_ sign_extend 32) (size!6329 (buf!6851 (_2!12129 (increaseBitIndex!0 (readerFrom!0 (_2!12129 lt!403528) (currentBit!12668 thiss!914) (currentByte!12673 thiss!914))))))))))

(assert (= (and d!88352 res!219144) b!261792))

(assert (= (and b!261792 res!219145) b!261793))

(declare-fun m!391785 () Bool)

(assert (=> d!88352 m!391785))

(declare-fun m!391787 () Bool)

(assert (=> d!88352 m!391787))

(assert (=> b!261719 d!88352))

(assert (=> b!261719 d!88348))

(declare-fun d!88354 () Bool)

(declare-fun e!182213 () Bool)

(assert (=> d!88354 e!182213))

(declare-fun res!219146 () Bool)

(assert (=> d!88354 (=> (not res!219146) (not e!182213))))

(declare-fun lt!403844 () (_ BitVec 64))

(declare-fun lt!403846 () (_ BitVec 64))

(declare-fun lt!403841 () (_ BitVec 64))

(assert (=> d!88354 (= res!219146 (= lt!403846 (bvsub lt!403844 lt!403841)))))

(assert (=> d!88354 (or (= (bvand lt!403844 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!403841 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!403844 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!403844 lt!403841) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!88354 (= lt!403841 (remainingBits!0 ((_ sign_extend 32) (size!6329 (buf!6851 (readerFrom!0 (_2!12129 lt!403528) (currentBit!12668 thiss!914) (currentByte!12673 thiss!914))))) ((_ sign_extend 32) (currentByte!12673 (readerFrom!0 (_2!12129 lt!403528) (currentBit!12668 thiss!914) (currentByte!12673 thiss!914)))) ((_ sign_extend 32) (currentBit!12668 (readerFrom!0 (_2!12129 lt!403528) (currentBit!12668 thiss!914) (currentByte!12673 thiss!914))))))))

(declare-fun lt!403843 () (_ BitVec 64))

(declare-fun lt!403842 () (_ BitVec 64))

(assert (=> d!88354 (= lt!403844 (bvmul lt!403843 lt!403842))))

(assert (=> d!88354 (or (= lt!403843 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!403842 (bvsdiv (bvmul lt!403843 lt!403842) lt!403843)))))

(assert (=> d!88354 (= lt!403842 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!88354 (= lt!403843 ((_ sign_extend 32) (size!6329 (buf!6851 (readerFrom!0 (_2!12129 lt!403528) (currentBit!12668 thiss!914) (currentByte!12673 thiss!914))))))))

(assert (=> d!88354 (= lt!403846 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12673 (readerFrom!0 (_2!12129 lt!403528) (currentBit!12668 thiss!914) (currentByte!12673 thiss!914)))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12668 (readerFrom!0 (_2!12129 lt!403528) (currentBit!12668 thiss!914) (currentByte!12673 thiss!914))))))))

(assert (=> d!88354 (invariant!0 (currentBit!12668 (readerFrom!0 (_2!12129 lt!403528) (currentBit!12668 thiss!914) (currentByte!12673 thiss!914))) (currentByte!12673 (readerFrom!0 (_2!12129 lt!403528) (currentBit!12668 thiss!914) (currentByte!12673 thiss!914))) (size!6329 (buf!6851 (readerFrom!0 (_2!12129 lt!403528) (currentBit!12668 thiss!914) (currentByte!12673 thiss!914)))))))

(assert (=> d!88354 (= (bitIndex!0 (size!6329 (buf!6851 (readerFrom!0 (_2!12129 lt!403528) (currentBit!12668 thiss!914) (currentByte!12673 thiss!914)))) (currentByte!12673 (readerFrom!0 (_2!12129 lt!403528) (currentBit!12668 thiss!914) (currentByte!12673 thiss!914))) (currentBit!12668 (readerFrom!0 (_2!12129 lt!403528) (currentBit!12668 thiss!914) (currentByte!12673 thiss!914)))) lt!403846)))

(declare-fun b!261794 () Bool)

(declare-fun res!219147 () Bool)

(assert (=> b!261794 (=> (not res!219147) (not e!182213))))

(assert (=> b!261794 (= res!219147 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!403846))))

(declare-fun b!261795 () Bool)

(declare-fun lt!403845 () (_ BitVec 64))

(assert (=> b!261795 (= e!182213 (bvsle lt!403846 (bvmul lt!403845 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!261795 (or (= lt!403845 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!403845 #b0000000000000000000000000000000000000000000000000000000000001000) lt!403845)))))

(assert (=> b!261795 (= lt!403845 ((_ sign_extend 32) (size!6329 (buf!6851 (readerFrom!0 (_2!12129 lt!403528) (currentBit!12668 thiss!914) (currentByte!12673 thiss!914))))))))

(assert (= (and d!88354 res!219146) b!261794))

(assert (= (and b!261794 res!219147) b!261795))

(assert (=> d!88354 m!391781))

(declare-fun m!391789 () Bool)

(assert (=> d!88354 m!391789))

(assert (=> b!261719 d!88354))

(check-sat (not d!88352) (not b!261790) (not d!88350) (not b!261787) (not d!88348) (not b!261789) (not d!88354))
(check-sat)
