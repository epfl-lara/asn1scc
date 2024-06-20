; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56526 () Bool)

(assert start!56526)

(declare-fun b!261046 () Bool)

(declare-fun res!218560 () Bool)

(declare-fun e!181439 () Bool)

(assert (=> b!261046 (=> res!218560 e!181439)))

(declare-datatypes ((array!14372 0))(
  ( (array!14373 (arr!7268 (Array (_ BitVec 32) (_ BitVec 8))) (size!6281 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11484 0))(
  ( (BitStream!11485 (buf!6803 array!14372) (currentByte!12538 (_ BitVec 32)) (currentBit!12533 (_ BitVec 32))) )
))
(declare-fun thiss!914 () BitStream!11484)

(declare-datatypes ((Unit!18595 0))(
  ( (Unit!18596) )
))
(declare-datatypes ((tuple2!22360 0))(
  ( (tuple2!22361 (_1!12116 Unit!18595) (_2!12116 BitStream!11484)) )
))
(declare-fun lt!403193 () tuple2!22360)

(declare-fun isPrefixOf!0 (BitStream!11484 BitStream!11484) Bool)

(assert (=> b!261046 (= res!218560 (not (isPrefixOf!0 thiss!914 (_2!12116 lt!403193))))))

(declare-fun b!261048 () Bool)

(declare-fun lt!403194 () BitStream!11484)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!261048 (= e!181439 (validate_offset_bit!0 ((_ sign_extend 32) (size!6281 (buf!6803 lt!403194))) ((_ sign_extend 32) (currentByte!12538 lt!403194)) ((_ sign_extend 32) (currentBit!12533 lt!403194))))))

(declare-fun readerFrom!0 (BitStream!11484 (_ BitVec 32) (_ BitVec 32)) BitStream!11484)

(assert (=> b!261048 (= lt!403194 (readerFrom!0 (_2!12116 lt!403193) (currentBit!12533 thiss!914) (currentByte!12538 thiss!914)))))

(declare-fun b!261049 () Bool)

(declare-fun res!218559 () Bool)

(assert (=> b!261049 (=> res!218559 e!181439)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!261049 (= res!218559 (not (= (bitIndex!0 (size!6281 (buf!6803 (_2!12116 lt!403193))) (currentByte!12538 (_2!12116 lt!403193)) (currentBit!12533 (_2!12116 lt!403193))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!6281 (buf!6803 thiss!914)) (currentByte!12538 thiss!914) (currentBit!12533 thiss!914))))))))

(declare-fun b!261050 () Bool)

(declare-fun e!181440 () Bool)

(declare-fun array_inv!6022 (array!14372) Bool)

(assert (=> b!261050 (= e!181440 (array_inv!6022 (buf!6803 thiss!914)))))

(declare-fun b!261047 () Bool)

(declare-fun e!181438 () Bool)

(assert (=> b!261047 (= e!181438 (not e!181439))))

(declare-fun res!218561 () Bool)

(assert (=> b!261047 (=> res!218561 e!181439)))

(assert (=> b!261047 (= res!218561 (not (= (size!6281 (buf!6803 thiss!914)) (size!6281 (buf!6803 (_2!12116 lt!403193))))))))

(declare-fun lt!403195 () tuple2!22360)

(declare-fun increaseBitIndex!0 (BitStream!11484) tuple2!22360)

(assert (=> b!261047 (= lt!403193 (increaseBitIndex!0 (_2!12116 lt!403195)))))

(declare-fun arrayRangesEq!948 (array!14372 array!14372 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!261047 (arrayRangesEq!948 (buf!6803 thiss!914) (array!14373 (store (arr!7268 (buf!6803 thiss!914)) (currentByte!12538 (_2!12116 lt!403195)) (select (arr!7268 (buf!6803 (_2!12116 lt!403195))) (currentByte!12538 (_2!12116 lt!403195)))) (size!6281 (buf!6803 thiss!914))) #b00000000000000000000000000000000 (currentByte!12538 (_2!12116 lt!403195)))))

(declare-fun lt!403196 () Unit!18595)

(declare-fun arrayUpdatedAtPrefixLemma!464 (array!14372 (_ BitVec 32) (_ BitVec 8)) Unit!18595)

(assert (=> b!261047 (= lt!403196 (arrayUpdatedAtPrefixLemma!464 (buf!6803 thiss!914) (currentByte!12538 (_2!12116 lt!403195)) (select (arr!7268 (buf!6803 (_2!12116 lt!403195))) (currentByte!12538 (_2!12116 lt!403195)))))))

(declare-fun b!187 () Bool)

(declare-fun Unit!18597 () Unit!18595)

(declare-fun Unit!18598 () Unit!18595)

(assert (=> b!261047 (= lt!403195 (ite b!187 (tuple2!22361 Unit!18597 (BitStream!11485 (array!14373 (store (arr!7268 (buf!6803 thiss!914)) (currentByte!12538 thiss!914) ((_ extract 7 0) (bvor ((_ sign_extend 24) (select (arr!7268 (buf!6803 thiss!914)) (currentByte!12538 thiss!914))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12533 thiss!914)))))) (size!6281 (buf!6803 thiss!914))) (currentByte!12538 thiss!914) (currentBit!12533 thiss!914))) (tuple2!22361 Unit!18598 (BitStream!11485 (array!14373 (store (arr!7268 (buf!6803 thiss!914)) (currentByte!12538 thiss!914) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!7268 (buf!6803 thiss!914)) (currentByte!12538 thiss!914))) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12533 thiss!914))))))) (size!6281 (buf!6803 thiss!914))) (currentByte!12538 thiss!914) (currentBit!12533 thiss!914)))))))

(declare-fun res!218558 () Bool)

(assert (=> start!56526 (=> (not res!218558) (not e!181438))))

(assert (=> start!56526 (= res!218558 (validate_offset_bit!0 ((_ sign_extend 32) (size!6281 (buf!6803 thiss!914))) ((_ sign_extend 32) (currentByte!12538 thiss!914)) ((_ sign_extend 32) (currentBit!12533 thiss!914))))))

(assert (=> start!56526 e!181438))

(declare-fun inv!12 (BitStream!11484) Bool)

(assert (=> start!56526 (and (inv!12 thiss!914) e!181440)))

(assert (=> start!56526 true))

(assert (= (and start!56526 res!218558) b!261047))

(assert (= (and b!261047 (not res!218561)) b!261049))

(assert (= (and b!261049 (not res!218559)) b!261046))

(assert (= (and b!261046 (not res!218560)) b!261048))

(assert (= start!56526 b!261050))

(declare-fun m!390617 () Bool)

(assert (=> b!261049 m!390617))

(declare-fun m!390619 () Bool)

(assert (=> b!261049 m!390619))

(declare-fun m!390621 () Bool)

(assert (=> b!261050 m!390621))

(declare-fun m!390623 () Bool)

(assert (=> b!261046 m!390623))

(declare-fun m!390625 () Bool)

(assert (=> b!261048 m!390625))

(declare-fun m!390627 () Bool)

(assert (=> b!261048 m!390627))

(declare-fun m!390629 () Bool)

(assert (=> b!261047 m!390629))

(declare-fun m!390631 () Bool)

(assert (=> b!261047 m!390631))

(declare-fun m!390633 () Bool)

(assert (=> b!261047 m!390633))

(declare-fun m!390635 () Bool)

(assert (=> b!261047 m!390635))

(declare-fun m!390637 () Bool)

(assert (=> b!261047 m!390637))

(assert (=> b!261047 m!390633))

(declare-fun m!390639 () Bool)

(assert (=> b!261047 m!390639))

(declare-fun m!390641 () Bool)

(assert (=> b!261047 m!390641))

(declare-fun m!390643 () Bool)

(assert (=> b!261047 m!390643))

(declare-fun m!390645 () Bool)

(assert (=> b!261047 m!390645))

(declare-fun m!390647 () Bool)

(assert (=> start!56526 m!390647))

(declare-fun m!390649 () Bool)

(assert (=> start!56526 m!390649))

(check-sat (not start!56526) (not b!261047) (not b!261050) (not b!261049) (not b!261046) (not b!261048))
(check-sat)
(get-model)

(declare-fun d!87760 () Bool)

(declare-fun res!218595 () Bool)

(declare-fun e!181467 () Bool)

(assert (=> d!87760 (=> (not res!218595) (not e!181467))))

(assert (=> d!87760 (= res!218595 (= (size!6281 (buf!6803 thiss!914)) (size!6281 (buf!6803 (_2!12116 lt!403193)))))))

(assert (=> d!87760 (= (isPrefixOf!0 thiss!914 (_2!12116 lt!403193)) e!181467)))

(declare-fun b!261084 () Bool)

(declare-fun res!218594 () Bool)

(assert (=> b!261084 (=> (not res!218594) (not e!181467))))

(assert (=> b!261084 (= res!218594 (bvsle (bitIndex!0 (size!6281 (buf!6803 thiss!914)) (currentByte!12538 thiss!914) (currentBit!12533 thiss!914)) (bitIndex!0 (size!6281 (buf!6803 (_2!12116 lt!403193))) (currentByte!12538 (_2!12116 lt!403193)) (currentBit!12533 (_2!12116 lt!403193)))))))

(declare-fun b!261085 () Bool)

(declare-fun e!181468 () Bool)

(assert (=> b!261085 (= e!181467 e!181468)))

(declare-fun res!218593 () Bool)

(assert (=> b!261085 (=> res!218593 e!181468)))

(assert (=> b!261085 (= res!218593 (= (size!6281 (buf!6803 thiss!914)) #b00000000000000000000000000000000))))

(declare-fun b!261086 () Bool)

(declare-fun arrayBitRangesEq!0 (array!14372 array!14372 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!261086 (= e!181468 (arrayBitRangesEq!0 (buf!6803 thiss!914) (buf!6803 (_2!12116 lt!403193)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6281 (buf!6803 thiss!914)) (currentByte!12538 thiss!914) (currentBit!12533 thiss!914))))))

(assert (= (and d!87760 res!218595) b!261084))

(assert (= (and b!261084 res!218594) b!261085))

(assert (= (and b!261085 (not res!218593)) b!261086))

(assert (=> b!261084 m!390619))

(assert (=> b!261084 m!390617))

(assert (=> b!261086 m!390619))

(assert (=> b!261086 m!390619))

(declare-fun m!390693 () Bool)

(assert (=> b!261086 m!390693))

(assert (=> b!261046 d!87760))

(declare-fun d!87768 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!87768 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6281 (buf!6803 thiss!914))) ((_ sign_extend 32) (currentByte!12538 thiss!914)) ((_ sign_extend 32) (currentBit!12533 thiss!914))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6281 (buf!6803 thiss!914))) ((_ sign_extend 32) (currentByte!12538 thiss!914)) ((_ sign_extend 32) (currentBit!12533 thiss!914))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!22225 () Bool)

(assert (= bs!22225 d!87768))

(declare-fun m!390695 () Bool)

(assert (=> bs!22225 m!390695))

(assert (=> start!56526 d!87768))

(declare-fun d!87770 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!87770 (= (inv!12 thiss!914) (invariant!0 (currentBit!12533 thiss!914) (currentByte!12538 thiss!914) (size!6281 (buf!6803 thiss!914))))))

(declare-fun bs!22226 () Bool)

(assert (= bs!22226 d!87770))

(declare-fun m!390697 () Bool)

(assert (=> bs!22226 m!390697))

(assert (=> start!56526 d!87770))

(declare-fun d!87772 () Bool)

(assert (=> d!87772 (= (array_inv!6022 (buf!6803 thiss!914)) (bvsge (size!6281 (buf!6803 thiss!914)) #b00000000000000000000000000000000))))

(assert (=> b!261050 d!87772))

(declare-fun d!87774 () Bool)

(declare-fun e!181484 () Bool)

(assert (=> d!87774 e!181484))

(declare-fun res!218621 () Bool)

(assert (=> d!87774 (=> (not res!218621) (not e!181484))))

(declare-fun lt!403249 () (_ BitVec 64))

(declare-fun lt!403246 () (_ BitVec 64))

(declare-fun lt!403250 () (_ BitVec 64))

(assert (=> d!87774 (= res!218621 (= lt!403249 (bvsub lt!403250 lt!403246)))))

(assert (=> d!87774 (or (= (bvand lt!403250 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!403246 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!403250 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!403250 lt!403246) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!87774 (= lt!403246 (remainingBits!0 ((_ sign_extend 32) (size!6281 (buf!6803 (_2!12116 lt!403193)))) ((_ sign_extend 32) (currentByte!12538 (_2!12116 lt!403193))) ((_ sign_extend 32) (currentBit!12533 (_2!12116 lt!403193)))))))

(declare-fun lt!403248 () (_ BitVec 64))

(declare-fun lt!403247 () (_ BitVec 64))

(assert (=> d!87774 (= lt!403250 (bvmul lt!403248 lt!403247))))

(assert (=> d!87774 (or (= lt!403248 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!403247 (bvsdiv (bvmul lt!403248 lt!403247) lt!403248)))))

(assert (=> d!87774 (= lt!403247 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!87774 (= lt!403248 ((_ sign_extend 32) (size!6281 (buf!6803 (_2!12116 lt!403193)))))))

(assert (=> d!87774 (= lt!403249 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12538 (_2!12116 lt!403193))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12533 (_2!12116 lt!403193)))))))

(assert (=> d!87774 (invariant!0 (currentBit!12533 (_2!12116 lt!403193)) (currentByte!12538 (_2!12116 lt!403193)) (size!6281 (buf!6803 (_2!12116 lt!403193))))))

(assert (=> d!87774 (= (bitIndex!0 (size!6281 (buf!6803 (_2!12116 lt!403193))) (currentByte!12538 (_2!12116 lt!403193)) (currentBit!12533 (_2!12116 lt!403193))) lt!403249)))

(declare-fun b!261111 () Bool)

(declare-fun res!218622 () Bool)

(assert (=> b!261111 (=> (not res!218622) (not e!181484))))

(assert (=> b!261111 (= res!218622 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!403249))))

(declare-fun b!261112 () Bool)

(declare-fun lt!403245 () (_ BitVec 64))

(assert (=> b!261112 (= e!181484 (bvsle lt!403249 (bvmul lt!403245 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!261112 (or (= lt!403245 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!403245 #b0000000000000000000000000000000000000000000000000000000000001000) lt!403245)))))

(assert (=> b!261112 (= lt!403245 ((_ sign_extend 32) (size!6281 (buf!6803 (_2!12116 lt!403193)))))))

(assert (= (and d!87774 res!218621) b!261111))

(assert (= (and b!261111 res!218622) b!261112))

(declare-fun m!390713 () Bool)

(assert (=> d!87774 m!390713))

(declare-fun m!390715 () Bool)

(assert (=> d!87774 m!390715))

(assert (=> b!261049 d!87774))

(declare-fun d!87786 () Bool)

(declare-fun e!181485 () Bool)

(assert (=> d!87786 e!181485))

(declare-fun res!218623 () Bool)

(assert (=> d!87786 (=> (not res!218623) (not e!181485))))

(declare-fun lt!403256 () (_ BitVec 64))

(declare-fun lt!403252 () (_ BitVec 64))

(declare-fun lt!403255 () (_ BitVec 64))

(assert (=> d!87786 (= res!218623 (= lt!403255 (bvsub lt!403256 lt!403252)))))

(assert (=> d!87786 (or (= (bvand lt!403256 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!403252 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!403256 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!403256 lt!403252) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!87786 (= lt!403252 (remainingBits!0 ((_ sign_extend 32) (size!6281 (buf!6803 thiss!914))) ((_ sign_extend 32) (currentByte!12538 thiss!914)) ((_ sign_extend 32) (currentBit!12533 thiss!914))))))

(declare-fun lt!403254 () (_ BitVec 64))

(declare-fun lt!403253 () (_ BitVec 64))

(assert (=> d!87786 (= lt!403256 (bvmul lt!403254 lt!403253))))

(assert (=> d!87786 (or (= lt!403254 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!403253 (bvsdiv (bvmul lt!403254 lt!403253) lt!403254)))))

(assert (=> d!87786 (= lt!403253 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!87786 (= lt!403254 ((_ sign_extend 32) (size!6281 (buf!6803 thiss!914))))))

(assert (=> d!87786 (= lt!403255 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12538 thiss!914)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12533 thiss!914))))))

(assert (=> d!87786 (invariant!0 (currentBit!12533 thiss!914) (currentByte!12538 thiss!914) (size!6281 (buf!6803 thiss!914)))))

(assert (=> d!87786 (= (bitIndex!0 (size!6281 (buf!6803 thiss!914)) (currentByte!12538 thiss!914) (currentBit!12533 thiss!914)) lt!403255)))

(declare-fun b!261113 () Bool)

(declare-fun res!218624 () Bool)

(assert (=> b!261113 (=> (not res!218624) (not e!181485))))

(assert (=> b!261113 (= res!218624 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!403255))))

(declare-fun b!261114 () Bool)

(declare-fun lt!403251 () (_ BitVec 64))

(assert (=> b!261114 (= e!181485 (bvsle lt!403255 (bvmul lt!403251 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!261114 (or (= lt!403251 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!403251 #b0000000000000000000000000000000000000000000000000000000000001000) lt!403251)))))

(assert (=> b!261114 (= lt!403251 ((_ sign_extend 32) (size!6281 (buf!6803 thiss!914))))))

(assert (= (and d!87786 res!218623) b!261113))

(assert (= (and b!261113 res!218624) b!261114))

(assert (=> d!87786 m!390695))

(assert (=> d!87786 m!390697))

(assert (=> b!261049 d!87786))

(declare-fun d!87788 () Bool)

(assert (=> d!87788 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6281 (buf!6803 lt!403194))) ((_ sign_extend 32) (currentByte!12538 lt!403194)) ((_ sign_extend 32) (currentBit!12533 lt!403194))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6281 (buf!6803 lt!403194))) ((_ sign_extend 32) (currentByte!12538 lt!403194)) ((_ sign_extend 32) (currentBit!12533 lt!403194))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!22228 () Bool)

(assert (= bs!22228 d!87788))

(declare-fun m!390717 () Bool)

(assert (=> bs!22228 m!390717))

(assert (=> b!261048 d!87788))

(declare-fun d!87790 () Bool)

(declare-fun e!181488 () Bool)

(assert (=> d!87790 e!181488))

(declare-fun res!218628 () Bool)

(assert (=> d!87790 (=> (not res!218628) (not e!181488))))

(assert (=> d!87790 (= res!218628 (invariant!0 (currentBit!12533 (_2!12116 lt!403193)) (currentByte!12538 (_2!12116 lt!403193)) (size!6281 (buf!6803 (_2!12116 lt!403193)))))))

(assert (=> d!87790 (= (readerFrom!0 (_2!12116 lt!403193) (currentBit!12533 thiss!914) (currentByte!12538 thiss!914)) (BitStream!11485 (buf!6803 (_2!12116 lt!403193)) (currentByte!12538 thiss!914) (currentBit!12533 thiss!914)))))

(declare-fun b!261117 () Bool)

(assert (=> b!261117 (= e!181488 (invariant!0 (currentBit!12533 thiss!914) (currentByte!12538 thiss!914) (size!6281 (buf!6803 (_2!12116 lt!403193)))))))

(assert (= (and d!87790 res!218628) b!261117))

(assert (=> d!87790 m!390715))

(declare-fun m!390719 () Bool)

(assert (=> b!261117 m!390719))

(assert (=> b!261048 d!87790))

(declare-fun d!87792 () Bool)

(declare-fun e!181515 () Bool)

(assert (=> d!87792 e!181515))

(declare-fun res!218663 () Bool)

(assert (=> d!87792 (=> (not res!218663) (not e!181515))))

(declare-fun lt!403306 () tuple2!22360)

(declare-fun lt!403303 () (_ BitVec 64))

(declare-fun lt!403304 () (_ BitVec 64))

(assert (=> d!87792 (= res!218663 (= (bvadd lt!403303 lt!403304) (bitIndex!0 (size!6281 (buf!6803 (_2!12116 lt!403306))) (currentByte!12538 (_2!12116 lt!403306)) (currentBit!12533 (_2!12116 lt!403306)))))))

(assert (=> d!87792 (or (not (= (bvand lt!403303 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!403304 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!403303 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!403303 lt!403304) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!87792 (= lt!403304 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!87792 (= lt!403303 (bitIndex!0 (size!6281 (buf!6803 (_2!12116 lt!403195))) (currentByte!12538 (_2!12116 lt!403195)) (currentBit!12533 (_2!12116 lt!403195))))))

(declare-fun Unit!18607 () Unit!18595)

(declare-fun Unit!18608 () Unit!18595)

(assert (=> d!87792 (= lt!403306 (ite (bvslt (currentBit!12533 (_2!12116 lt!403195)) #b00000000000000000000000000000111) (tuple2!22361 Unit!18607 (BitStream!11485 (buf!6803 (_2!12116 lt!403195)) (currentByte!12538 (_2!12116 lt!403195)) (bvadd (currentBit!12533 (_2!12116 lt!403195)) #b00000000000000000000000000000001))) (tuple2!22361 Unit!18608 (BitStream!11485 (buf!6803 (_2!12116 lt!403195)) (bvadd (currentByte!12538 (_2!12116 lt!403195)) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (=> d!87792 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!6281 (buf!6803 (_2!12116 lt!403195)))) ((_ sign_extend 32) (currentByte!12538 (_2!12116 lt!403195))) ((_ sign_extend 32) (currentBit!12533 (_2!12116 lt!403195)))) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!87792 (= (increaseBitIndex!0 (_2!12116 lt!403195)) lt!403306)))

(declare-fun b!261152 () Bool)

(declare-fun res!218664 () Bool)

(assert (=> b!261152 (=> (not res!218664) (not e!181515))))

(declare-fun lt!403305 () (_ BitVec 64))

(declare-fun lt!403307 () (_ BitVec 64))

(assert (=> b!261152 (= res!218664 (= (bvsub lt!403305 lt!403307) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!261152 (or (= (bvand lt!403305 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!403307 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!403305 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!403305 lt!403307) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!261152 (= lt!403307 (remainingBits!0 ((_ sign_extend 32) (size!6281 (buf!6803 (_2!12116 lt!403306)))) ((_ sign_extend 32) (currentByte!12538 (_2!12116 lt!403306))) ((_ sign_extend 32) (currentBit!12533 (_2!12116 lt!403306)))))))

(assert (=> b!261152 (= lt!403305 (remainingBits!0 ((_ sign_extend 32) (size!6281 (buf!6803 (_2!12116 lt!403195)))) ((_ sign_extend 32) (currentByte!12538 (_2!12116 lt!403195))) ((_ sign_extend 32) (currentBit!12533 (_2!12116 lt!403195)))))))

(declare-fun b!261153 () Bool)

(assert (=> b!261153 (= e!181515 (= (size!6281 (buf!6803 (_2!12116 lt!403195))) (size!6281 (buf!6803 (_2!12116 lt!403306)))))))

(assert (= (and d!87792 res!218663) b!261152))

(assert (= (and b!261152 res!218664) b!261153))

(declare-fun m!390753 () Bool)

(assert (=> d!87792 m!390753))

(declare-fun m!390755 () Bool)

(assert (=> d!87792 m!390755))

(declare-fun m!390757 () Bool)

(assert (=> d!87792 m!390757))

(declare-fun m!390759 () Bool)

(assert (=> b!261152 m!390759))

(assert (=> b!261152 m!390757))

(assert (=> b!261047 d!87792))

(declare-fun d!87810 () Bool)

(declare-fun res!218669 () Bool)

(declare-fun e!181520 () Bool)

(assert (=> d!87810 (=> res!218669 e!181520)))

(assert (=> d!87810 (= res!218669 (= #b00000000000000000000000000000000 (currentByte!12538 (_2!12116 lt!403195))))))

(assert (=> d!87810 (= (arrayRangesEq!948 (buf!6803 thiss!914) (array!14373 (store (arr!7268 (buf!6803 thiss!914)) (currentByte!12538 (_2!12116 lt!403195)) (select (arr!7268 (buf!6803 (_2!12116 lt!403195))) (currentByte!12538 (_2!12116 lt!403195)))) (size!6281 (buf!6803 thiss!914))) #b00000000000000000000000000000000 (currentByte!12538 (_2!12116 lt!403195))) e!181520)))

(declare-fun b!261158 () Bool)

(declare-fun e!181521 () Bool)

(assert (=> b!261158 (= e!181520 e!181521)))

(declare-fun res!218670 () Bool)

(assert (=> b!261158 (=> (not res!218670) (not e!181521))))

(assert (=> b!261158 (= res!218670 (= (select (arr!7268 (buf!6803 thiss!914)) #b00000000000000000000000000000000) (select (arr!7268 (array!14373 (store (arr!7268 (buf!6803 thiss!914)) (currentByte!12538 (_2!12116 lt!403195)) (select (arr!7268 (buf!6803 (_2!12116 lt!403195))) (currentByte!12538 (_2!12116 lt!403195)))) (size!6281 (buf!6803 thiss!914)))) #b00000000000000000000000000000000)))))

(declare-fun b!261159 () Bool)

(assert (=> b!261159 (= e!181521 (arrayRangesEq!948 (buf!6803 thiss!914) (array!14373 (store (arr!7268 (buf!6803 thiss!914)) (currentByte!12538 (_2!12116 lt!403195)) (select (arr!7268 (buf!6803 (_2!12116 lt!403195))) (currentByte!12538 (_2!12116 lt!403195)))) (size!6281 (buf!6803 thiss!914))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12538 (_2!12116 lt!403195))))))

(assert (= (and d!87810 (not res!218669)) b!261158))

(assert (= (and b!261158 res!218670) b!261159))

(declare-fun m!390761 () Bool)

(assert (=> b!261158 m!390761))

(declare-fun m!390763 () Bool)

(assert (=> b!261158 m!390763))

(declare-fun m!390765 () Bool)

(assert (=> b!261159 m!390765))

(assert (=> b!261047 d!87810))

(declare-fun d!87812 () Bool)

(declare-fun e!181526 () Bool)

(assert (=> d!87812 e!181526))

(declare-fun res!218675 () Bool)

(assert (=> d!87812 (=> (not res!218675) (not e!181526))))

(assert (=> d!87812 (= res!218675 (and (bvsge (currentByte!12538 (_2!12116 lt!403195)) #b00000000000000000000000000000000) (bvslt (currentByte!12538 (_2!12116 lt!403195)) (size!6281 (buf!6803 thiss!914)))))))

(declare-fun lt!403320 () Unit!18595)

(declare-fun choose!358 (array!14372 (_ BitVec 32) (_ BitVec 8)) Unit!18595)

(assert (=> d!87812 (= lt!403320 (choose!358 (buf!6803 thiss!914) (currentByte!12538 (_2!12116 lt!403195)) (select (arr!7268 (buf!6803 (_2!12116 lt!403195))) (currentByte!12538 (_2!12116 lt!403195)))))))

(assert (=> d!87812 (and (bvsle #b00000000000000000000000000000000 (currentByte!12538 (_2!12116 lt!403195))) (bvslt (currentByte!12538 (_2!12116 lt!403195)) (size!6281 (buf!6803 thiss!914))))))

(assert (=> d!87812 (= (arrayUpdatedAtPrefixLemma!464 (buf!6803 thiss!914) (currentByte!12538 (_2!12116 lt!403195)) (select (arr!7268 (buf!6803 (_2!12116 lt!403195))) (currentByte!12538 (_2!12116 lt!403195)))) lt!403320)))

(declare-fun b!261162 () Bool)

(assert (=> b!261162 (= e!181526 (arrayRangesEq!948 (buf!6803 thiss!914) (array!14373 (store (arr!7268 (buf!6803 thiss!914)) (currentByte!12538 (_2!12116 lt!403195)) (select (arr!7268 (buf!6803 (_2!12116 lt!403195))) (currentByte!12538 (_2!12116 lt!403195)))) (size!6281 (buf!6803 thiss!914))) #b00000000000000000000000000000000 (currentByte!12538 (_2!12116 lt!403195))))))

(assert (= (and d!87812 res!218675) b!261162))

(assert (=> d!87812 m!390633))

(declare-fun m!390767 () Bool)

(assert (=> d!87812 m!390767))

(assert (=> b!261162 m!390641))

(assert (=> b!261162 m!390639))

(assert (=> b!261047 d!87812))

(check-sat (not b!261084) (not d!87788) (not b!261162) (not d!87792) (not d!87768) (not d!87786) (not d!87812) (not b!261117) (not b!261152) (not d!87770) (not d!87774) (not d!87790) (not b!261086) (not b!261159))
(check-sat)
