; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56524 () Bool)

(assert start!56524)

(declare-fun b!261031 () Bool)

(declare-fun e!181429 () Bool)

(declare-fun e!181427 () Bool)

(assert (=> b!261031 (= e!181429 (not e!181427))))

(declare-fun res!218546 () Bool)

(assert (=> b!261031 (=> res!218546 e!181427)))

(declare-datatypes ((array!14370 0))(
  ( (array!14371 (arr!7267 (Array (_ BitVec 32) (_ BitVec 8))) (size!6280 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11482 0))(
  ( (BitStream!11483 (buf!6802 array!14370) (currentByte!12537 (_ BitVec 32)) (currentBit!12532 (_ BitVec 32))) )
))
(declare-fun thiss!914 () BitStream!11482)

(declare-datatypes ((Unit!18591 0))(
  ( (Unit!18592) )
))
(declare-datatypes ((tuple2!22358 0))(
  ( (tuple2!22359 (_1!12115 Unit!18591) (_2!12115 BitStream!11482)) )
))
(declare-fun lt!403182 () tuple2!22358)

(assert (=> b!261031 (= res!218546 (not (= (size!6280 (buf!6802 thiss!914)) (size!6280 (buf!6802 (_2!12115 lt!403182))))))))

(declare-fun lt!403183 () tuple2!22358)

(declare-fun increaseBitIndex!0 (BitStream!11482) tuple2!22358)

(assert (=> b!261031 (= lt!403182 (increaseBitIndex!0 (_2!12115 lt!403183)))))

(declare-fun arrayRangesEq!947 (array!14370 array!14370 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!261031 (arrayRangesEq!947 (buf!6802 thiss!914) (array!14371 (store (arr!7267 (buf!6802 thiss!914)) (currentByte!12537 (_2!12115 lt!403183)) (select (arr!7267 (buf!6802 (_2!12115 lt!403183))) (currentByte!12537 (_2!12115 lt!403183)))) (size!6280 (buf!6802 thiss!914))) #b00000000000000000000000000000000 (currentByte!12537 (_2!12115 lt!403183)))))

(declare-fun lt!403184 () Unit!18591)

(declare-fun arrayUpdatedAtPrefixLemma!463 (array!14370 (_ BitVec 32) (_ BitVec 8)) Unit!18591)

(assert (=> b!261031 (= lt!403184 (arrayUpdatedAtPrefixLemma!463 (buf!6802 thiss!914) (currentByte!12537 (_2!12115 lt!403183)) (select (arr!7267 (buf!6802 (_2!12115 lt!403183))) (currentByte!12537 (_2!12115 lt!403183)))))))

(declare-fun b!187 () Bool)

(declare-fun Unit!18593 () Unit!18591)

(declare-fun Unit!18594 () Unit!18591)

(assert (=> b!261031 (= lt!403183 (ite b!187 (tuple2!22359 Unit!18593 (BitStream!11483 (array!14371 (store (arr!7267 (buf!6802 thiss!914)) (currentByte!12537 thiss!914) ((_ extract 7 0) (bvor ((_ sign_extend 24) (select (arr!7267 (buf!6802 thiss!914)) (currentByte!12537 thiss!914))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12532 thiss!914)))))) (size!6280 (buf!6802 thiss!914))) (currentByte!12537 thiss!914) (currentBit!12532 thiss!914))) (tuple2!22359 Unit!18594 (BitStream!11483 (array!14371 (store (arr!7267 (buf!6802 thiss!914)) (currentByte!12537 thiss!914) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!7267 (buf!6802 thiss!914)) (currentByte!12537 thiss!914))) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12532 thiss!914))))))) (size!6280 (buf!6802 thiss!914))) (currentByte!12537 thiss!914) (currentBit!12532 thiss!914)))))))

(declare-fun res!218547 () Bool)

(assert (=> start!56524 (=> (not res!218547) (not e!181429))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!56524 (= res!218547 (validate_offset_bit!0 ((_ sign_extend 32) (size!6280 (buf!6802 thiss!914))) ((_ sign_extend 32) (currentByte!12537 thiss!914)) ((_ sign_extend 32) (currentBit!12532 thiss!914))))))

(assert (=> start!56524 e!181429))

(declare-fun e!181426 () Bool)

(declare-fun inv!12 (BitStream!11482) Bool)

(assert (=> start!56524 (and (inv!12 thiss!914) e!181426)))

(assert (=> start!56524 true))

(declare-fun b!261032 () Bool)

(declare-fun res!218548 () Bool)

(assert (=> b!261032 (=> res!218548 e!181427)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!261032 (= res!218548 (not (= (bitIndex!0 (size!6280 (buf!6802 (_2!12115 lt!403182))) (currentByte!12537 (_2!12115 lt!403182)) (currentBit!12532 (_2!12115 lt!403182))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!6280 (buf!6802 thiss!914)) (currentByte!12537 thiss!914) (currentBit!12532 thiss!914))))))))

(declare-fun b!261033 () Bool)

(declare-fun lt!403181 () BitStream!11482)

(assert (=> b!261033 (= e!181427 (validate_offset_bit!0 ((_ sign_extend 32) (size!6280 (buf!6802 lt!403181))) ((_ sign_extend 32) (currentByte!12537 lt!403181)) ((_ sign_extend 32) (currentBit!12532 lt!403181))))))

(declare-fun readerFrom!0 (BitStream!11482 (_ BitVec 32) (_ BitVec 32)) BitStream!11482)

(assert (=> b!261033 (= lt!403181 (readerFrom!0 (_2!12115 lt!403182) (currentBit!12532 thiss!914) (currentByte!12537 thiss!914)))))

(declare-fun b!261034 () Bool)

(declare-fun res!218549 () Bool)

(assert (=> b!261034 (=> res!218549 e!181427)))

(declare-fun isPrefixOf!0 (BitStream!11482 BitStream!11482) Bool)

(assert (=> b!261034 (= res!218549 (not (isPrefixOf!0 thiss!914 (_2!12115 lt!403182))))))

(declare-fun b!261035 () Bool)

(declare-fun array_inv!6021 (array!14370) Bool)

(assert (=> b!261035 (= e!181426 (array_inv!6021 (buf!6802 thiss!914)))))

(assert (= (and start!56524 res!218547) b!261031))

(assert (= (and b!261031 (not res!218546)) b!261032))

(assert (= (and b!261032 (not res!218548)) b!261034))

(assert (= (and b!261034 (not res!218549)) b!261033))

(assert (= start!56524 b!261035))

(declare-fun m!390583 () Bool)

(assert (=> start!56524 m!390583))

(declare-fun m!390585 () Bool)

(assert (=> start!56524 m!390585))

(declare-fun m!390587 () Bool)

(assert (=> b!261031 m!390587))

(declare-fun m!390589 () Bool)

(assert (=> b!261031 m!390589))

(declare-fun m!390591 () Bool)

(assert (=> b!261031 m!390591))

(declare-fun m!390593 () Bool)

(assert (=> b!261031 m!390593))

(declare-fun m!390595 () Bool)

(assert (=> b!261031 m!390595))

(declare-fun m!390597 () Bool)

(assert (=> b!261031 m!390597))

(assert (=> b!261031 m!390597))

(declare-fun m!390599 () Bool)

(assert (=> b!261031 m!390599))

(declare-fun m!390601 () Bool)

(assert (=> b!261031 m!390601))

(declare-fun m!390603 () Bool)

(assert (=> b!261031 m!390603))

(declare-fun m!390605 () Bool)

(assert (=> b!261035 m!390605))

(declare-fun m!390607 () Bool)

(assert (=> b!261033 m!390607))

(declare-fun m!390609 () Bool)

(assert (=> b!261033 m!390609))

(declare-fun m!390611 () Bool)

(assert (=> b!261032 m!390611))

(declare-fun m!390613 () Bool)

(assert (=> b!261032 m!390613))

(declare-fun m!390615 () Bool)

(assert (=> b!261034 m!390615))

(push 1)

(assert (not b!261031))

(assert (not b!261032))

(assert (not start!56524))

(assert (not b!261035))

(assert (not b!261033))

(assert (not b!261034))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!87754 () Bool)

(declare-fun res!218581 () Bool)

(declare-fun e!181458 () Bool)

(assert (=> d!87754 (=> (not res!218581) (not e!181458))))

(assert (=> d!87754 (= res!218581 (= (size!6280 (buf!6802 thiss!914)) (size!6280 (buf!6802 (_2!12115 lt!403182)))))))

(assert (=> d!87754 (= (isPrefixOf!0 thiss!914 (_2!12115 lt!403182)) e!181458)))

(declare-fun b!261072 () Bool)

(declare-fun res!218580 () Bool)

(assert (=> b!261072 (=> (not res!218580) (not e!181458))))

(assert (=> b!261072 (= res!218580 (bvsle (bitIndex!0 (size!6280 (buf!6802 thiss!914)) (currentByte!12537 thiss!914) (currentBit!12532 thiss!914)) (bitIndex!0 (size!6280 (buf!6802 (_2!12115 lt!403182))) (currentByte!12537 (_2!12115 lt!403182)) (currentBit!12532 (_2!12115 lt!403182)))))))

(declare-fun b!261073 () Bool)

(declare-fun e!181459 () Bool)

(assert (=> b!261073 (= e!181458 e!181459)))

(declare-fun res!218582 () Bool)

(assert (=> b!261073 (=> res!218582 e!181459)))

(assert (=> b!261073 (= res!218582 (= (size!6280 (buf!6802 thiss!914)) #b00000000000000000000000000000000))))

(declare-fun b!261074 () Bool)

(declare-fun arrayBitRangesEq!0 (array!14370 array!14370 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!261074 (= e!181459 (arrayBitRangesEq!0 (buf!6802 thiss!914) (buf!6802 (_2!12115 lt!403182)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6280 (buf!6802 thiss!914)) (currentByte!12537 thiss!914) (currentBit!12532 thiss!914))))))

(assert (= (and d!87754 res!218581) b!261072))

(assert (= (and b!261072 res!218580) b!261073))

(assert (= (and b!261073 (not res!218582)) b!261074))

(assert (=> b!261072 m!390613))

(assert (=> b!261072 m!390611))

(assert (=> b!261074 m!390613))

(assert (=> b!261074 m!390613))

(declare-fun m!390685 () Bool)

(assert (=> b!261074 m!390685))

(assert (=> b!261034 d!87754))

(declare-fun d!87756 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!87756 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6280 (buf!6802 lt!403181))) ((_ sign_extend 32) (currentByte!12537 lt!403181)) ((_ sign_extend 32) (currentBit!12532 lt!403181))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6280 (buf!6802 lt!403181))) ((_ sign_extend 32) (currentByte!12537 lt!403181)) ((_ sign_extend 32) (currentBit!12532 lt!403181))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!22224 () Bool)

(assert (= bs!22224 d!87756))

(declare-fun m!390687 () Bool)

(assert (=> bs!22224 m!390687))

(assert (=> b!261033 d!87756))

(declare-fun d!87758 () Bool)

(declare-fun e!181462 () Bool)

(assert (=> d!87758 e!181462))

(declare-fun res!218586 () Bool)

(assert (=> d!87758 (=> (not res!218586) (not e!181462))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!87758 (= res!218586 (invariant!0 (currentBit!12532 (_2!12115 lt!403182)) (currentByte!12537 (_2!12115 lt!403182)) (size!6280 (buf!6802 (_2!12115 lt!403182)))))))

(assert (=> d!87758 (= (readerFrom!0 (_2!12115 lt!403182) (currentBit!12532 thiss!914) (currentByte!12537 thiss!914)) (BitStream!11483 (buf!6802 (_2!12115 lt!403182)) (currentByte!12537 thiss!914) (currentBit!12532 thiss!914)))))

(declare-fun b!261077 () Bool)

(assert (=> b!261077 (= e!181462 (invariant!0 (currentBit!12532 thiss!914) (currentByte!12537 thiss!914) (size!6280 (buf!6802 (_2!12115 lt!403182)))))))

(assert (= (and d!87758 res!218586) b!261077))

(declare-fun m!390689 () Bool)

(assert (=> d!87758 m!390689))

(declare-fun m!390691 () Bool)

(assert (=> b!261077 m!390691))

(assert (=> b!261033 d!87758))

(declare-fun d!87762 () Bool)

(declare-fun e!181479 () Bool)

(assert (=> d!87762 e!181479))

(declare-fun res!218612 () Bool)

(assert (=> d!87762 (=> (not res!218612) (not e!181479))))

(declare-fun lt!403221 () (_ BitVec 64))

(declare-fun lt!403224 () (_ BitVec 64))

(declare-fun lt!403223 () (_ BitVec 64))

(assert (=> d!87762 (= res!218612 (= lt!403223 (bvsub lt!403221 lt!403224)))))

(assert (=> d!87762 (or (= (bvand lt!403221 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!403224 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!403221 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!403221 lt!403224) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!87762 (= lt!403224 (remainingBits!0 ((_ sign_extend 32) (size!6280 (buf!6802 (_2!12115 lt!403182)))) ((_ sign_extend 32) (currentByte!12537 (_2!12115 lt!403182))) ((_ sign_extend 32) (currentBit!12532 (_2!12115 lt!403182)))))))

(declare-fun lt!403226 () (_ BitVec 64))

(declare-fun lt!403225 () (_ BitVec 64))

(assert (=> d!87762 (= lt!403221 (bvmul lt!403226 lt!403225))))

(assert (=> d!87762 (or (= lt!403226 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!403225 (bvsdiv (bvmul lt!403226 lt!403225) lt!403226)))))

(assert (=> d!87762 (= lt!403225 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!87762 (= lt!403226 ((_ sign_extend 32) (size!6280 (buf!6802 (_2!12115 lt!403182)))))))

(assert (=> d!87762 (= lt!403223 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12537 (_2!12115 lt!403182))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12532 (_2!12115 lt!403182)))))))

(assert (=> d!87762 (invariant!0 (currentBit!12532 (_2!12115 lt!403182)) (currentByte!12537 (_2!12115 lt!403182)) (size!6280 (buf!6802 (_2!12115 lt!403182))))))

(assert (=> d!87762 (= (bitIndex!0 (size!6280 (buf!6802 (_2!12115 lt!403182))) (currentByte!12537 (_2!12115 lt!403182)) (currentBit!12532 (_2!12115 lt!403182))) lt!403223)))

(declare-fun b!261102 () Bool)

(declare-fun res!218613 () Bool)

(assert (=> b!261102 (=> (not res!218613) (not e!181479))))

(assert (=> b!261102 (= res!218613 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!403223))))

(declare-fun b!261103 () Bool)

(declare-fun lt!403222 () (_ BitVec 64))

(assert (=> b!261103 (= e!181479 (bvsle lt!403223 (bvmul lt!403222 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!261103 (or (= lt!403222 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!403222 #b0000000000000000000000000000000000000000000000000000000000001000) lt!403222)))))

(assert (=> b!261103 (= lt!403222 ((_ sign_extend 32) (size!6280 (buf!6802 (_2!12115 lt!403182)))))))

(assert (= (and d!87762 res!218612) b!261102))

(assert (= (and b!261102 res!218613) b!261103))

(declare-fun m!390703 () Bool)

(assert (=> d!87762 m!390703))

(assert (=> d!87762 m!390689))

(assert (=> b!261032 d!87762))

(declare-fun d!87780 () Bool)

(declare-fun e!181480 () Bool)

(assert (=> d!87780 e!181480))

(declare-fun res!218614 () Bool)

(assert (=> d!87780 (=> (not res!218614) (not e!181480))))

(declare-fun lt!403227 () (_ BitVec 64))

(declare-fun lt!403229 () (_ BitVec 64))

(declare-fun lt!403230 () (_ BitVec 64))

(assert (=> d!87780 (= res!218614 (= lt!403229 (bvsub lt!403227 lt!403230)))))

(assert (=> d!87780 (or (= (bvand lt!403227 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!403230 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!403227 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!403227 lt!403230) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!87780 (= lt!403230 (remainingBits!0 ((_ sign_extend 32) (size!6280 (buf!6802 thiss!914))) ((_ sign_extend 32) (currentByte!12537 thiss!914)) ((_ sign_extend 32) (currentBit!12532 thiss!914))))))

(declare-fun lt!403232 () (_ BitVec 64))

(declare-fun lt!403231 () (_ BitVec 64))

(assert (=> d!87780 (= lt!403227 (bvmul lt!403232 lt!403231))))

(assert (=> d!87780 (or (= lt!403232 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!403231 (bvsdiv (bvmul lt!403232 lt!403231) lt!403232)))))

(assert (=> d!87780 (= lt!403231 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!87780 (= lt!403232 ((_ sign_extend 32) (size!6280 (buf!6802 thiss!914))))))

(assert (=> d!87780 (= lt!403229 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12537 thiss!914)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12532 thiss!914))))))

(assert (=> d!87780 (invariant!0 (currentBit!12532 thiss!914) (currentByte!12537 thiss!914) (size!6280 (buf!6802 thiss!914)))))

(assert (=> d!87780 (= (bitIndex!0 (size!6280 (buf!6802 thiss!914)) (currentByte!12537 thiss!914) (currentBit!12532 thiss!914)) lt!403229)))

(declare-fun b!261104 () Bool)

(declare-fun res!218615 () Bool)

(assert (=> b!261104 (=> (not res!218615) (not e!181480))))

(assert (=> b!261104 (= res!218615 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!403229))))

(declare-fun b!261105 () Bool)

(declare-fun lt!403228 () (_ BitVec 64))

(assert (=> b!261105 (= e!181480 (bvsle lt!403229 (bvmul lt!403228 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!261105 (or (= lt!403228 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!403228 #b0000000000000000000000000000000000000000000000000000000000001000) lt!403228)))))

(assert (=> b!261105 (= lt!403228 ((_ sign_extend 32) (size!6280 (buf!6802 thiss!914))))))

(assert (= (and d!87780 res!218614) b!261104))

(assert (= (and b!261104 res!218615) b!261105))

(declare-fun m!390707 () Bool)

(assert (=> d!87780 m!390707))

(declare-fun m!390709 () Bool)

(assert (=> d!87780 m!390709))

(assert (=> b!261032 d!87780))

(declare-fun d!87782 () Bool)

(declare-fun e!181493 () Bool)

(assert (=> d!87782 e!181493))

(declare-fun res!218638 () Bool)

(assert (=> d!87782 (=> (not res!218638) (not e!181493))))

(declare-fun lt!403278 () tuple2!22358)

(declare-fun lt!403280 () (_ BitVec 64))

(declare-fun lt!403281 () (_ BitVec 64))

(assert (=> d!87782 (= res!218638 (= (bvadd lt!403280 lt!403281) (bitIndex!0 (size!6280 (buf!6802 (_2!12115 lt!403278))) (currentByte!12537 (_2!12115 lt!403278)) (currentBit!12532 (_2!12115 lt!403278)))))))

(assert (=> d!87782 (or (not (= (bvand lt!403280 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!403281 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!403280 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!403280 lt!403281) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!87782 (= lt!403281 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!87782 (= lt!403280 (bitIndex!0 (size!6280 (buf!6802 (_2!12115 lt!403183))) (currentByte!12537 (_2!12115 lt!403183)) (currentBit!12532 (_2!12115 lt!403183))))))

(declare-fun Unit!18603 () Unit!18591)

(declare-fun Unit!18604 () Unit!18591)

(assert (=> d!87782 (= lt!403278 (ite (bvslt (currentBit!12532 (_2!12115 lt!403183)) #b00000000000000000000000000000111) (tuple2!22359 Unit!18603 (BitStream!11483 (buf!6802 (_2!12115 lt!403183)) (currentByte!12537 (_2!12115 lt!403183)) (bvadd (currentBit!12532 (_2!12115 lt!403183)) #b00000000000000000000000000000001))) (tuple2!22359 Unit!18604 (BitStream!11483 (buf!6802 (_2!12115 lt!403183)) (bvadd (currentByte!12537 (_2!12115 lt!403183)) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (=> d!87782 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!6280 (buf!6802 (_2!12115 lt!403183)))) ((_ sign_extend 32) (currentByte!12537 (_2!12115 lt!403183))) ((_ sign_extend 32) (currentBit!12532 (_2!12115 lt!403183)))) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!87782 (= (increaseBitIndex!0 (_2!12115 lt!403183)) lt!403278)))

(declare-fun b!261126 () Bool)

(declare-fun res!218637 () Bool)

(assert (=> b!261126 (=> (not res!218637) (not e!181493))))

(declare-fun lt!403277 () (_ BitVec 64))

(declare-fun lt!403279 () (_ BitVec 64))

(assert (=> b!261126 (= res!218637 (= (bvsub lt!403277 lt!403279) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!261126 (or (= (bvand lt!403277 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!403279 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!403277 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!403277 lt!403279) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!261126 (= lt!403279 (remainingBits!0 ((_ sign_extend 32) (size!6280 (buf!6802 (_2!12115 lt!403278)))) ((_ sign_extend 32) (currentByte!12537 (_2!12115 lt!403278))) ((_ sign_extend 32) (currentBit!12532 (_2!12115 lt!403278)))))))

(assert (=> b!261126 (= lt!403277 (remainingBits!0 ((_ sign_extend 32) (size!6280 (buf!6802 (_2!12115 lt!403183)))) ((_ sign_extend 32) (currentByte!12537 (_2!12115 lt!403183))) ((_ sign_extend 32) (currentBit!12532 (_2!12115 lt!403183)))))))

(declare-fun b!261127 () Bool)

(assert (=> b!261127 (= e!181493 (= (size!6280 (buf!6802 (_2!12115 lt!403183))) (size!6280 (buf!6802 (_2!12115 lt!403278)))))))

(assert (= (and d!87782 res!218638) b!261126))

(assert (= (and b!261126 res!218637) b!261127))

(declare-fun m!390721 () Bool)

(assert (=> d!87782 m!390721))

(declare-fun m!390723 () Bool)

(assert (=> d!87782 m!390723))

(declare-fun m!390725 () Bool)

(assert (=> d!87782 m!390725))

(declare-fun m!390727 () Bool)

(assert (=> b!261126 m!390727))

(assert (=> b!261126 m!390725))

(assert (=> b!261031 d!87782))

(declare-fun d!87794 () Bool)

(declare-fun res!218649 () Bool)

(declare-fun e!181503 () Bool)

(assert (=> d!87794 (=> res!218649 e!181503)))

(assert (=> d!87794 (= res!218649 (= #b00000000000000000000000000000000 (currentByte!12537 (_2!12115 lt!403183))))))

(assert (=> d!87794 (= (arrayRangesEq!947 (buf!6802 thiss!914) (array!14371 (store (arr!7267 (buf!6802 thiss!914)) (currentByte!12537 (_2!12115 lt!403183)) (select (arr!7267 (buf!6802 (_2!12115 lt!403183))) (currentByte!12537 (_2!12115 lt!403183)))) (size!6280 (buf!6802 thiss!914))) #b00000000000000000000000000000000 (currentByte!12537 (_2!12115 lt!403183))) e!181503)))

(declare-fun b!261138 () Bool)

(declare-fun e!181504 () Bool)

(assert (=> b!261138 (= e!181503 e!181504)))

(declare-fun res!218650 () Bool)

(assert (=> b!261138 (=> (not res!218650) (not e!181504))))

(assert (=> b!261138 (= res!218650 (= (select (arr!7267 (buf!6802 thiss!914)) #b00000000000000000000000000000000) (select (arr!7267 (array!14371 (store (arr!7267 (buf!6802 thiss!914)) (currentByte!12537 (_2!12115 lt!403183)) (select (arr!7267 (buf!6802 (_2!12115 lt!403183))) (currentByte!12537 (_2!12115 lt!403183)))) (size!6280 (buf!6802 thiss!914)))) #b00000000000000000000000000000000)))))

(declare-fun b!261139 () Bool)

(assert (=> b!261139 (= e!181504 (arrayRangesEq!947 (buf!6802 thiss!914) (array!14371 (store (arr!7267 (buf!6802 thiss!914)) (currentByte!12537 (_2!12115 lt!403183)) (select (arr!7267 (buf!6802 (_2!12115 lt!403183))) (currentByte!12537 (_2!12115 lt!403183)))) (size!6280 (buf!6802 thiss!914))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12537 (_2!12115 lt!403183))))))

(assert (= (and d!87794 (not res!218649)) b!261138))

(assert (= (and b!261138 res!218650) b!261139))

(declare-fun m!390737 () Bool)

(assert (=> b!261138 m!390737))

(declare-fun m!390739 () Bool)

(assert (=> b!261138 m!390739))

(declare-fun m!390741 () Bool)

(assert (=> b!261139 m!390741))

(assert (=> b!261031 d!87794))

(declare-fun d!87798 () Bool)

(declare-fun e!181513 () Bool)

(assert (=> d!87798 e!181513))

(declare-fun res!218661 () Bool)

(assert (=> d!87798 (=> (not res!218661) (not e!181513))))

(assert (=> d!87798 (= res!218661 (and (bvsge (currentByte!12537 (_2!12115 lt!403183)) #b00000000000000000000000000000000) (bvslt (currentByte!12537 (_2!12115 lt!403183)) (size!6280 (buf!6802 thiss!914)))))))

(declare-fun lt!403301 () Unit!18591)

(declare-fun choose!357 (array!14370 (_ BitVec 32) (_ BitVec 8)) Unit!18591)

(assert (=> d!87798 (= lt!403301 (choose!357 (buf!6802 thiss!914) (currentByte!12537 (_2!12115 lt!403183)) (select (arr!7267 (buf!6802 (_2!12115 lt!403183))) (currentByte!12537 (_2!12115 lt!403183)))))))

(assert (=> d!87798 (and (bvsle #b00000000000000000000000000000000 (currentByte!12537 (_2!12115 lt!403183))) (bvslt (currentByte!12537 (_2!12115 lt!403183)) (size!6280 (buf!6802 thiss!914))))))

(assert (=> d!87798 (= (arrayUpdatedAtPrefixLemma!463 (buf!6802 thiss!914) (currentByte!12537 (_2!12115 lt!403183)) (select (arr!7267 (buf!6802 (_2!12115 lt!403183))) (currentByte!12537 (_2!12115 lt!403183)))) lt!403301)))

(declare-fun b!261150 () Bool)

(assert (=> b!261150 (= e!181513 (arrayRangesEq!947 (buf!6802 thiss!914) (array!14371 (store (arr!7267 (buf!6802 thiss!914)) (currentByte!12537 (_2!12115 lt!403183)) (select (arr!7267 (buf!6802 (_2!12115 lt!403183))) (currentByte!12537 (_2!12115 lt!403183)))) (size!6280 (buf!6802 thiss!914))) #b00000000000000000000000000000000 (currentByte!12537 (_2!12115 lt!403183))))))

(assert (= (and d!87798 res!218661) b!261150))

(assert (=> d!87798 m!390597))

(declare-fun m!390749 () Bool)

(assert (=> d!87798 m!390749))

(assert (=> b!261150 m!390593))

(assert (=> b!261150 m!390595))

(assert (=> b!261031 d!87798))

(declare-fun d!87802 () Bool)

(assert (=> d!87802 (= (array_inv!6021 (buf!6802 thiss!914)) (bvsge (size!6280 (buf!6802 thiss!914)) #b00000000000000000000000000000000))))

(assert (=> b!261035 d!87802))

(declare-fun d!87806 () Bool)

(assert (=> d!87806 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6280 (buf!6802 thiss!914))) ((_ sign_extend 32) (currentByte!12537 thiss!914)) ((_ sign_extend 32) (currentBit!12532 thiss!914))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6280 (buf!6802 thiss!914))) ((_ sign_extend 32) (currentByte!12537 thiss!914)) ((_ sign_extend 32) (currentBit!12532 thiss!914))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!22229 () Bool)

(assert (= bs!22229 d!87806))

(assert (=> bs!22229 m!390707))

(assert (=> start!56524 d!87806))

(declare-fun d!87808 () Bool)

(assert (=> d!87808 (= (inv!12 thiss!914) (invariant!0 (currentBit!12532 thiss!914) (currentByte!12537 thiss!914) (size!6280 (buf!6802 thiss!914))))))

(declare-fun bs!22230 () Bool)

(assert (= bs!22230 d!87808))

(assert (=> bs!22230 m!390709))

(assert (=> start!56524 d!87808))

(push 1)

(assert (not d!87806))

(assert (not d!87782))

(assert (not b!261074))

(assert (not b!261077))

(assert (not d!87780))

(assert (not d!87756))

(assert (not b!261072))

(assert (not d!87798))

(assert (not d!87758))

(assert (not d!87808))

(assert (not d!87762))

(assert (not b!261150))

(assert (not b!261139))

(assert (not b!261126))

(check-sat)

(pop 1)

(push 1)

(check-sat)

