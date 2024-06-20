; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20372 () Bool)

(assert start!20372)

(declare-fun b!102686 () Bool)

(declare-fun e!67220 () Bool)

(declare-datatypes ((array!4816 0))(
  ( (array!4817 (arr!2792 (Array (_ BitVec 32) (_ BitVec 8))) (size!2199 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3872 0))(
  ( (BitStream!3873 (buf!2559 array!4816) (currentByte!5032 (_ BitVec 32)) (currentBit!5027 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!3872)

(declare-fun array_inv!2001 (array!4816) Bool)

(assert (=> b!102686 (= e!67220 (array_inv!2001 (buf!2559 thiss!1305)))))

(declare-fun b!102687 () Bool)

(declare-fun e!67223 () Bool)

(declare-datatypes ((Unit!6294 0))(
  ( (Unit!6295) )
))
(declare-datatypes ((tuple2!8414 0))(
  ( (tuple2!8415 (_1!4462 Unit!6294) (_2!4462 BitStream!3872)) )
))
(declare-fun lt!149358 () tuple2!8414)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!102687 (= e!67223 (invariant!0 (currentBit!5027 thiss!1305) (currentByte!5032 thiss!1305) (size!2199 (buf!2559 (_2!4462 lt!149358)))))))

(declare-fun res!84465 () Bool)

(declare-fun e!67225 () Bool)

(assert (=> start!20372 (=> (not res!84465) (not e!67225))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> start!20372 (= res!84465 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!20372 e!67225))

(assert (=> start!20372 true))

(declare-fun inv!12 (BitStream!3872) Bool)

(assert (=> start!20372 (and (inv!12 thiss!1305) e!67220)))

(declare-fun b!102688 () Bool)

(declare-fun e!67219 () Bool)

(assert (=> b!102688 (= e!67225 e!67219)))

(declare-fun res!84470 () Bool)

(assert (=> b!102688 (=> (not res!84470) (not e!67219))))

(declare-fun lt!149360 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!102688 (= res!84470 (validate_offset_bits!1 ((_ sign_extend 32) (size!2199 (buf!2559 thiss!1305))) ((_ sign_extend 32) (currentByte!5032 thiss!1305)) ((_ sign_extend 32) (currentBit!5027 thiss!1305)) lt!149360))))

(assert (=> b!102688 (= lt!149360 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!102689 () Bool)

(declare-fun e!67218 () Bool)

(declare-fun e!67222 () Bool)

(assert (=> b!102689 (= e!67218 e!67222)))

(declare-fun res!84461 () Bool)

(assert (=> b!102689 (=> (not res!84461) (not e!67222))))

(declare-fun lt!149357 () Bool)

(declare-datatypes ((tuple2!8416 0))(
  ( (tuple2!8417 (_1!4463 BitStream!3872) (_2!4463 Bool)) )
))
(declare-fun lt!149364 () tuple2!8416)

(declare-fun lt!149367 () tuple2!8414)

(assert (=> b!102689 (= res!84461 (and (= (_2!4463 lt!149364) lt!149357) (= (_1!4463 lt!149364) (_2!4462 lt!149367))))))

(declare-fun readBitPure!0 (BitStream!3872) tuple2!8416)

(declare-fun readerFrom!0 (BitStream!3872 (_ BitVec 32) (_ BitVec 32)) BitStream!3872)

(assert (=> b!102689 (= lt!149364 (readBitPure!0 (readerFrom!0 (_2!4462 lt!149367) (currentBit!5027 thiss!1305) (currentByte!5032 thiss!1305))))))

(declare-fun b!102690 () Bool)

(declare-fun res!84469 () Bool)

(assert (=> b!102690 (=> (not res!84469) (not e!67219))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!102690 (= res!84469 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!102691 () Bool)

(declare-fun lt!149359 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!102691 (= e!67222 (= (bitIndex!0 (size!2199 (buf!2559 (_1!4463 lt!149364))) (currentByte!5032 (_1!4463 lt!149364)) (currentBit!5027 (_1!4463 lt!149364))) lt!149359))))

(declare-fun b!102692 () Bool)

(declare-fun e!67227 () Bool)

(declare-datatypes ((tuple2!8418 0))(
  ( (tuple2!8419 (_1!4464 BitStream!3872) (_2!4464 BitStream!3872)) )
))
(declare-fun lt!149366 () tuple2!8418)

(assert (=> b!102692 (= e!67227 (validate_offset_bits!1 ((_ sign_extend 32) (size!2199 (buf!2559 (_1!4464 lt!149366)))) ((_ sign_extend 32) (currentByte!5032 (_1!4464 lt!149366))) ((_ sign_extend 32) (currentBit!5027 (_1!4464 lt!149366))) ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun b!102693 () Bool)

(declare-fun res!84467 () Bool)

(assert (=> b!102693 (=> (not res!84467) (not e!67219))))

(assert (=> b!102693 (= res!84467 (bvslt i!615 nBits!396))))

(declare-fun b!102694 () Bool)

(declare-fun res!84460 () Bool)

(assert (=> b!102694 (=> (not res!84460) (not e!67223))))

(assert (=> b!102694 (= res!84460 (invariant!0 (currentBit!5027 thiss!1305) (currentByte!5032 thiss!1305) (size!2199 (buf!2559 (_2!4462 lt!149367)))))))

(declare-fun b!102695 () Bool)

(assert (=> b!102695 (= e!67219 (not e!67227))))

(declare-fun res!84468 () Bool)

(assert (=> b!102695 (=> res!84468 e!67227)))

(assert (=> b!102695 (= res!84468 (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun lt!149361 () (_ BitVec 64))

(assert (=> b!102695 (validate_offset_bits!1 ((_ sign_extend 32) (size!2199 (buf!2559 (_2!4462 lt!149358)))) ((_ sign_extend 32) (currentByte!5032 (_2!4462 lt!149367))) ((_ sign_extend 32) (currentBit!5027 (_2!4462 lt!149367))) lt!149361)))

(declare-fun lt!149354 () Unit!6294)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3872 array!4816 (_ BitVec 64)) Unit!6294)

(assert (=> b!102695 (= lt!149354 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4462 lt!149367) (buf!2559 (_2!4462 lt!149358)) lt!149361))))

(assert (=> b!102695 (= lt!149361 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!149353 () tuple2!8418)

(declare-datatypes ((tuple2!8420 0))(
  ( (tuple2!8421 (_1!4465 BitStream!3872) (_2!4465 (_ BitVec 64))) )
))
(declare-fun lt!149365 () tuple2!8420)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3872 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8420)

(assert (=> b!102695 (= lt!149365 (readNLeastSignificantBitsLoopPure!0 (_1!4464 lt!149353) nBits!396 i!615 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615))))))))

(assert (=> b!102695 (validate_offset_bits!1 ((_ sign_extend 32) (size!2199 (buf!2559 (_2!4462 lt!149358)))) ((_ sign_extend 32) (currentByte!5032 thiss!1305)) ((_ sign_extend 32) (currentBit!5027 thiss!1305)) lt!149360)))

(declare-fun lt!149355 () Unit!6294)

(assert (=> b!102695 (= lt!149355 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2559 (_2!4462 lt!149358)) lt!149360))))

(assert (=> b!102695 (= (_2!4463 (readBitPure!0 (_1!4464 lt!149353))) lt!149357)))

(declare-fun reader!0 (BitStream!3872 BitStream!3872) tuple2!8418)

(assert (=> b!102695 (= lt!149366 (reader!0 (_2!4462 lt!149367) (_2!4462 lt!149358)))))

(assert (=> b!102695 (= lt!149353 (reader!0 thiss!1305 (_2!4462 lt!149358)))))

(declare-fun e!67221 () Bool)

(assert (=> b!102695 e!67221))

(declare-fun res!84463 () Bool)

(assert (=> b!102695 (=> (not res!84463) (not e!67221))))

(declare-fun lt!149363 () tuple2!8416)

(declare-fun lt!149368 () tuple2!8416)

(assert (=> b!102695 (= res!84463 (= (bitIndex!0 (size!2199 (buf!2559 (_1!4463 lt!149363))) (currentByte!5032 (_1!4463 lt!149363)) (currentBit!5027 (_1!4463 lt!149363))) (bitIndex!0 (size!2199 (buf!2559 (_1!4463 lt!149368))) (currentByte!5032 (_1!4463 lt!149368)) (currentBit!5027 (_1!4463 lt!149368)))))))

(declare-fun lt!149362 () Unit!6294)

(declare-fun lt!149356 () BitStream!3872)

(declare-fun readBitPrefixLemma!0 (BitStream!3872 BitStream!3872) Unit!6294)

(assert (=> b!102695 (= lt!149362 (readBitPrefixLemma!0 lt!149356 (_2!4462 lt!149358)))))

(assert (=> b!102695 (= lt!149368 (readBitPure!0 (BitStream!3873 (buf!2559 (_2!4462 lt!149358)) (currentByte!5032 thiss!1305) (currentBit!5027 thiss!1305))))))

(assert (=> b!102695 (= lt!149363 (readBitPure!0 lt!149356))))

(assert (=> b!102695 (= lt!149356 (BitStream!3873 (buf!2559 (_2!4462 lt!149367)) (currentByte!5032 thiss!1305) (currentBit!5027 thiss!1305)))))

(assert (=> b!102695 e!67223))

(declare-fun res!84459 () Bool)

(assert (=> b!102695 (=> (not res!84459) (not e!67223))))

(declare-fun isPrefixOf!0 (BitStream!3872 BitStream!3872) Bool)

(assert (=> b!102695 (= res!84459 (isPrefixOf!0 thiss!1305 (_2!4462 lt!149358)))))

(declare-fun lt!149352 () Unit!6294)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3872 BitStream!3872 BitStream!3872) Unit!6294)

(assert (=> b!102695 (= lt!149352 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4462 lt!149367) (_2!4462 lt!149358)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3872 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8414)

(assert (=> b!102695 (= lt!149358 (appendNLeastSignificantBitsLoop!0 (_2!4462 lt!149367) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!67224 () Bool)

(assert (=> b!102695 e!67224))

(declare-fun res!84464 () Bool)

(assert (=> b!102695 (=> (not res!84464) (not e!67224))))

(assert (=> b!102695 (= res!84464 (= (size!2199 (buf!2559 thiss!1305)) (size!2199 (buf!2559 (_2!4462 lt!149367)))))))

(declare-fun appendBit!0 (BitStream!3872 Bool) tuple2!8414)

(assert (=> b!102695 (= lt!149367 (appendBit!0 thiss!1305 lt!149357))))

(assert (=> b!102695 (= lt!149357 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!102696 () Bool)

(assert (=> b!102696 (= e!67221 (= (_2!4463 lt!149363) (_2!4463 lt!149368)))))

(declare-fun b!102697 () Bool)

(declare-fun res!84466 () Bool)

(assert (=> b!102697 (=> (not res!84466) (not e!67218))))

(assert (=> b!102697 (= res!84466 (isPrefixOf!0 thiss!1305 (_2!4462 lt!149367)))))

(declare-fun b!102698 () Bool)

(assert (=> b!102698 (= e!67224 e!67218)))

(declare-fun res!84462 () Bool)

(assert (=> b!102698 (=> (not res!84462) (not e!67218))))

(declare-fun lt!149351 () (_ BitVec 64))

(assert (=> b!102698 (= res!84462 (= lt!149359 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!149351)))))

(assert (=> b!102698 (= lt!149359 (bitIndex!0 (size!2199 (buf!2559 (_2!4462 lt!149367))) (currentByte!5032 (_2!4462 lt!149367)) (currentBit!5027 (_2!4462 lt!149367))))))

(assert (=> b!102698 (= lt!149351 (bitIndex!0 (size!2199 (buf!2559 thiss!1305)) (currentByte!5032 thiss!1305) (currentBit!5027 thiss!1305)))))

(assert (= (and start!20372 res!84465) b!102688))

(assert (= (and b!102688 res!84470) b!102690))

(assert (= (and b!102690 res!84469) b!102693))

(assert (= (and b!102693 res!84467) b!102695))

(assert (= (and b!102695 res!84464) b!102698))

(assert (= (and b!102698 res!84462) b!102697))

(assert (= (and b!102697 res!84466) b!102689))

(assert (= (and b!102689 res!84461) b!102691))

(assert (= (and b!102695 res!84459) b!102694))

(assert (= (and b!102694 res!84460) b!102687))

(assert (= (and b!102695 res!84463) b!102696))

(assert (= (and b!102695 (not res!84468)) b!102692))

(assert (= start!20372 b!102686))

(declare-fun m!149579 () Bool)

(assert (=> start!20372 m!149579))

(declare-fun m!149581 () Bool)

(assert (=> b!102690 m!149581))

(declare-fun m!149583 () Bool)

(assert (=> b!102689 m!149583))

(assert (=> b!102689 m!149583))

(declare-fun m!149585 () Bool)

(assert (=> b!102689 m!149585))

(declare-fun m!149587 () Bool)

(assert (=> b!102687 m!149587))

(declare-fun m!149589 () Bool)

(assert (=> b!102695 m!149589))

(declare-fun m!149591 () Bool)

(assert (=> b!102695 m!149591))

(declare-fun m!149593 () Bool)

(assert (=> b!102695 m!149593))

(declare-fun m!149595 () Bool)

(assert (=> b!102695 m!149595))

(declare-fun m!149597 () Bool)

(assert (=> b!102695 m!149597))

(declare-fun m!149599 () Bool)

(assert (=> b!102695 m!149599))

(declare-fun m!149601 () Bool)

(assert (=> b!102695 m!149601))

(declare-fun m!149603 () Bool)

(assert (=> b!102695 m!149603))

(declare-fun m!149605 () Bool)

(assert (=> b!102695 m!149605))

(declare-fun m!149607 () Bool)

(assert (=> b!102695 m!149607))

(declare-fun m!149609 () Bool)

(assert (=> b!102695 m!149609))

(declare-fun m!149611 () Bool)

(assert (=> b!102695 m!149611))

(declare-fun m!149613 () Bool)

(assert (=> b!102695 m!149613))

(declare-fun m!149615 () Bool)

(assert (=> b!102695 m!149615))

(declare-fun m!149617 () Bool)

(assert (=> b!102695 m!149617))

(declare-fun m!149619 () Bool)

(assert (=> b!102695 m!149619))

(declare-fun m!149621 () Bool)

(assert (=> b!102695 m!149621))

(declare-fun m!149623 () Bool)

(assert (=> b!102695 m!149623))

(declare-fun m!149625 () Bool)

(assert (=> b!102691 m!149625))

(declare-fun m!149627 () Bool)

(assert (=> b!102697 m!149627))

(declare-fun m!149629 () Bool)

(assert (=> b!102688 m!149629))

(declare-fun m!149631 () Bool)

(assert (=> b!102694 m!149631))

(declare-fun m!149633 () Bool)

(assert (=> b!102692 m!149633))

(declare-fun m!149635 () Bool)

(assert (=> b!102686 m!149635))

(declare-fun m!149637 () Bool)

(assert (=> b!102698 m!149637))

(declare-fun m!149639 () Bool)

(assert (=> b!102698 m!149639))

(push 1)

(assert (not b!102690))

(assert (not b!102692))

(assert (not b!102698))

(assert (not b!102689))

(assert (not b!102687))

(assert (not b!102694))

(assert (not b!102697))

(assert (not b!102695))

(assert (not b!102688))

(assert (not b!102686))

(assert (not b!102691))

(assert (not start!20372))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!31914 () Bool)

(declare-fun e!67261 () Bool)

(assert (=> d!31914 e!67261))

(declare-fun res!84526 () Bool)

(assert (=> d!31914 (=> (not res!84526) (not e!67261))))

(declare-fun lt!149583 () (_ BitVec 64))

(declare-fun lt!149586 () (_ BitVec 64))

(declare-fun lt!149581 () (_ BitVec 64))

(assert (=> d!31914 (= res!84526 (= lt!149583 (bvsub lt!149586 lt!149581)))))

(assert (=> d!31914 (or (= (bvand lt!149586 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!149581 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!149586 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!149586 lt!149581) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!31914 (= lt!149581 (remainingBits!0 ((_ sign_extend 32) (size!2199 (buf!2559 (_1!4463 lt!149364)))) ((_ sign_extend 32) (currentByte!5032 (_1!4463 lt!149364))) ((_ sign_extend 32) (currentBit!5027 (_1!4463 lt!149364)))))))

(declare-fun lt!149585 () (_ BitVec 64))

(declare-fun lt!149582 () (_ BitVec 64))

(assert (=> d!31914 (= lt!149586 (bvmul lt!149585 lt!149582))))

(assert (=> d!31914 (or (= lt!149585 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!149582 (bvsdiv (bvmul lt!149585 lt!149582) lt!149585)))))

(assert (=> d!31914 (= lt!149582 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!31914 (= lt!149585 ((_ sign_extend 32) (size!2199 (buf!2559 (_1!4463 lt!149364)))))))

(assert (=> d!31914 (= lt!149583 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5032 (_1!4463 lt!149364))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5027 (_1!4463 lt!149364)))))))

(assert (=> d!31914 (invariant!0 (currentBit!5027 (_1!4463 lt!149364)) (currentByte!5032 (_1!4463 lt!149364)) (size!2199 (buf!2559 (_1!4463 lt!149364))))))

(assert (=> d!31914 (= (bitIndex!0 (size!2199 (buf!2559 (_1!4463 lt!149364))) (currentByte!5032 (_1!4463 lt!149364)) (currentBit!5027 (_1!4463 lt!149364))) lt!149583)))

(declare-fun b!102765 () Bool)

(declare-fun res!84527 () Bool)

(assert (=> b!102765 (=> (not res!84527) (not e!67261))))

(assert (=> b!102765 (= res!84527 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!149583))))

(declare-fun b!102766 () Bool)

(declare-fun lt!149584 () (_ BitVec 64))

(assert (=> b!102766 (= e!67261 (bvsle lt!149583 (bvmul lt!149584 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!102766 (or (= lt!149584 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!149584 #b0000000000000000000000000000000000000000000000000000000000001000) lt!149584)))))

(assert (=> b!102766 (= lt!149584 ((_ sign_extend 32) (size!2199 (buf!2559 (_1!4463 lt!149364)))))))

(assert (= (and d!31914 res!84526) b!102765))

(assert (= (and b!102765 res!84527) b!102766))

(declare-fun m!149755 () Bool)

(assert (=> d!31914 m!149755))

(declare-fun m!149757 () Bool)

(assert (=> d!31914 m!149757))

(assert (=> b!102691 d!31914))

(declare-fun d!31916 () Bool)

(assert (=> d!31916 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2199 (buf!2559 (_1!4464 lt!149366)))) ((_ sign_extend 32) (currentByte!5032 (_1!4464 lt!149366))) ((_ sign_extend 32) (currentBit!5027 (_1!4464 lt!149366))) ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2199 (buf!2559 (_1!4464 lt!149366)))) ((_ sign_extend 32) (currentByte!5032 (_1!4464 lt!149366))) ((_ sign_extend 32) (currentBit!5027 (_1!4464 lt!149366)))) ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun bs!7829 () Bool)

(assert (= bs!7829 d!31916))

(declare-fun m!149759 () Bool)

(assert (=> bs!7829 m!149759))

(assert (=> b!102692 d!31916))

(declare-fun d!31918 () Bool)

(assert (=> d!31918 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2199 (buf!2559 thiss!1305))) ((_ sign_extend 32) (currentByte!5032 thiss!1305)) ((_ sign_extend 32) (currentBit!5027 thiss!1305)) lt!149360) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2199 (buf!2559 thiss!1305))) ((_ sign_extend 32) (currentByte!5032 thiss!1305)) ((_ sign_extend 32) (currentBit!5027 thiss!1305))) lt!149360))))

(declare-fun bs!7830 () Bool)

(assert (= bs!7830 d!31918))

(declare-fun m!149761 () Bool)

(assert (=> bs!7830 m!149761))

(assert (=> b!102688 d!31918))

(declare-fun d!31920 () Bool)

(assert (=> d!31920 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!102690 d!31920))

(declare-fun d!31922 () Bool)

(declare-datatypes ((tuple2!8430 0))(
  ( (tuple2!8431 (_1!4470 Bool) (_2!4470 BitStream!3872)) )
))
(declare-fun lt!149589 () tuple2!8430)

(declare-fun readBit!0 (BitStream!3872) tuple2!8430)

(assert (=> d!31922 (= lt!149589 (readBit!0 (readerFrom!0 (_2!4462 lt!149367) (currentBit!5027 thiss!1305) (currentByte!5032 thiss!1305))))))

(assert (=> d!31922 (= (readBitPure!0 (readerFrom!0 (_2!4462 lt!149367) (currentBit!5027 thiss!1305) (currentByte!5032 thiss!1305))) (tuple2!8417 (_2!4470 lt!149589) (_1!4470 lt!149589)))))

(declare-fun bs!7831 () Bool)

(assert (= bs!7831 d!31922))

(assert (=> bs!7831 m!149583))

(declare-fun m!149763 () Bool)

(assert (=> bs!7831 m!149763))

(assert (=> b!102689 d!31922))

(declare-fun d!31924 () Bool)

(declare-fun e!67264 () Bool)

(assert (=> d!31924 e!67264))

(declare-fun res!84531 () Bool)

(assert (=> d!31924 (=> (not res!84531) (not e!67264))))

(assert (=> d!31924 (= res!84531 (invariant!0 (currentBit!5027 (_2!4462 lt!149367)) (currentByte!5032 (_2!4462 lt!149367)) (size!2199 (buf!2559 (_2!4462 lt!149367)))))))

(assert (=> d!31924 (= (readerFrom!0 (_2!4462 lt!149367) (currentBit!5027 thiss!1305) (currentByte!5032 thiss!1305)) (BitStream!3873 (buf!2559 (_2!4462 lt!149367)) (currentByte!5032 thiss!1305) (currentBit!5027 thiss!1305)))))

(declare-fun b!102769 () Bool)

(assert (=> b!102769 (= e!67264 (invariant!0 (currentBit!5027 thiss!1305) (currentByte!5032 thiss!1305) (size!2199 (buf!2559 (_2!4462 lt!149367)))))))

(assert (= (and d!31924 res!84531) b!102769))

(declare-fun m!149765 () Bool)

(assert (=> d!31924 m!149765))

(assert (=> b!102769 m!149631))

(assert (=> b!102689 d!31924))

(declare-fun d!31926 () Bool)

(assert (=> d!31926 (= (array_inv!2001 (buf!2559 thiss!1305)) (bvsge (size!2199 (buf!2559 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!102686 d!31926))

(declare-fun d!31928 () Bool)

(declare-fun e!67265 () Bool)

(assert (=> d!31928 e!67265))

(declare-fun res!84532 () Bool)

(assert (=> d!31928 (=> (not res!84532) (not e!67265))))

(declare-fun lt!149595 () (_ BitVec 64))

(declare-fun lt!149592 () (_ BitVec 64))

(declare-fun lt!149590 () (_ BitVec 64))

(assert (=> d!31928 (= res!84532 (= lt!149592 (bvsub lt!149595 lt!149590)))))

(assert (=> d!31928 (or (= (bvand lt!149595 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!149590 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!149595 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!149595 lt!149590) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!31928 (= lt!149590 (remainingBits!0 ((_ sign_extend 32) (size!2199 (buf!2559 (_2!4462 lt!149367)))) ((_ sign_extend 32) (currentByte!5032 (_2!4462 lt!149367))) ((_ sign_extend 32) (currentBit!5027 (_2!4462 lt!149367)))))))

(declare-fun lt!149594 () (_ BitVec 64))

(declare-fun lt!149591 () (_ BitVec 64))

(assert (=> d!31928 (= lt!149595 (bvmul lt!149594 lt!149591))))

(assert (=> d!31928 (or (= lt!149594 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!149591 (bvsdiv (bvmul lt!149594 lt!149591) lt!149594)))))

(assert (=> d!31928 (= lt!149591 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!31928 (= lt!149594 ((_ sign_extend 32) (size!2199 (buf!2559 (_2!4462 lt!149367)))))))

(assert (=> d!31928 (= lt!149592 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5032 (_2!4462 lt!149367))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5027 (_2!4462 lt!149367)))))))

(assert (=> d!31928 (invariant!0 (currentBit!5027 (_2!4462 lt!149367)) (currentByte!5032 (_2!4462 lt!149367)) (size!2199 (buf!2559 (_2!4462 lt!149367))))))

(assert (=> d!31928 (= (bitIndex!0 (size!2199 (buf!2559 (_2!4462 lt!149367))) (currentByte!5032 (_2!4462 lt!149367)) (currentBit!5027 (_2!4462 lt!149367))) lt!149592)))

(declare-fun b!102770 () Bool)

(declare-fun res!84533 () Bool)

(assert (=> b!102770 (=> (not res!84533) (not e!67265))))

(assert (=> b!102770 (= res!84533 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!149592))))

(declare-fun b!102771 () Bool)

(declare-fun lt!149593 () (_ BitVec 64))

(assert (=> b!102771 (= e!67265 (bvsle lt!149592 (bvmul lt!149593 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!102771 (or (= lt!149593 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!149593 #b0000000000000000000000000000000000000000000000000000000000001000) lt!149593)))))

(assert (=> b!102771 (= lt!149593 ((_ sign_extend 32) (size!2199 (buf!2559 (_2!4462 lt!149367)))))))

(assert (= (and d!31928 res!84532) b!102770))

(assert (= (and b!102770 res!84533) b!102771))

(declare-fun m!149767 () Bool)

(assert (=> d!31928 m!149767))

(assert (=> d!31928 m!149765))

(assert (=> b!102698 d!31928))

(declare-fun d!31930 () Bool)

(declare-fun e!67266 () Bool)

(assert (=> d!31930 e!67266))

(declare-fun res!84534 () Bool)

(assert (=> d!31930 (=> (not res!84534) (not e!67266))))

(declare-fun lt!149598 () (_ BitVec 64))

(declare-fun lt!149601 () (_ BitVec 64))

(declare-fun lt!149596 () (_ BitVec 64))

(assert (=> d!31930 (= res!84534 (= lt!149598 (bvsub lt!149601 lt!149596)))))

(assert (=> d!31930 (or (= (bvand lt!149601 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!149596 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!149601 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!149601 lt!149596) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!31930 (= lt!149596 (remainingBits!0 ((_ sign_extend 32) (size!2199 (buf!2559 thiss!1305))) ((_ sign_extend 32) (currentByte!5032 thiss!1305)) ((_ sign_extend 32) (currentBit!5027 thiss!1305))))))

(declare-fun lt!149600 () (_ BitVec 64))

(declare-fun lt!149597 () (_ BitVec 64))

(assert (=> d!31930 (= lt!149601 (bvmul lt!149600 lt!149597))))

(assert (=> d!31930 (or (= lt!149600 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!149597 (bvsdiv (bvmul lt!149600 lt!149597) lt!149600)))))

(assert (=> d!31930 (= lt!149597 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!31930 (= lt!149600 ((_ sign_extend 32) (size!2199 (buf!2559 thiss!1305))))))

(assert (=> d!31930 (= lt!149598 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5032 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5027 thiss!1305))))))

(assert (=> d!31930 (invariant!0 (currentBit!5027 thiss!1305) (currentByte!5032 thiss!1305) (size!2199 (buf!2559 thiss!1305)))))

(assert (=> d!31930 (= (bitIndex!0 (size!2199 (buf!2559 thiss!1305)) (currentByte!5032 thiss!1305) (currentBit!5027 thiss!1305)) lt!149598)))

(declare-fun b!102772 () Bool)

(declare-fun res!84535 () Bool)

(assert (=> b!102772 (=> (not res!84535) (not e!67266))))

(assert (=> b!102772 (= res!84535 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!149598))))

(declare-fun b!102773 () Bool)

(declare-fun lt!149599 () (_ BitVec 64))

(assert (=> b!102773 (= e!67266 (bvsle lt!149598 (bvmul lt!149599 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!102773 (or (= lt!149599 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!149599 #b0000000000000000000000000000000000000000000000000000000000001000) lt!149599)))))

(assert (=> b!102773 (= lt!149599 ((_ sign_extend 32) (size!2199 (buf!2559 thiss!1305))))))

(assert (= (and d!31930 res!84534) b!102772))

(assert (= (and b!102772 res!84535) b!102773))

(assert (=> d!31930 m!149761))

(declare-fun m!149769 () Bool)

(assert (=> d!31930 m!149769))

(assert (=> b!102698 d!31930))

(declare-fun d!31932 () Bool)

(assert (=> d!31932 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5027 thiss!1305) (currentByte!5032 thiss!1305) (size!2199 (buf!2559 thiss!1305))))))

(declare-fun bs!7832 () Bool)

(assert (= bs!7832 d!31932))

(assert (=> bs!7832 m!149769))

(assert (=> start!20372 d!31932))

(declare-fun d!31934 () Bool)

(assert (=> d!31934 (= (invariant!0 (currentBit!5027 thiss!1305) (currentByte!5032 thiss!1305) (size!2199 (buf!2559 (_2!4462 lt!149358)))) (and (bvsge (currentBit!5027 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5027 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5032 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5032 thiss!1305) (size!2199 (buf!2559 (_2!4462 lt!149358)))) (and (= (currentBit!5027 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5032 thiss!1305) (size!2199 (buf!2559 (_2!4462 lt!149358))))))))))

(assert (=> b!102687 d!31934))

(declare-fun d!31936 () Bool)

(declare-fun res!84542 () Bool)

(declare-fun e!67272 () Bool)

(assert (=> d!31936 (=> (not res!84542) (not e!67272))))

(assert (=> d!31936 (= res!84542 (= (size!2199 (buf!2559 thiss!1305)) (size!2199 (buf!2559 (_2!4462 lt!149367)))))))

(assert (=> d!31936 (= (isPrefixOf!0 thiss!1305 (_2!4462 lt!149367)) e!67272)))

(declare-fun b!102780 () Bool)

(declare-fun res!84543 () Bool)

(assert (=> b!102780 (=> (not res!84543) (not e!67272))))

(assert (=> b!102780 (= res!84543 (bvsle (bitIndex!0 (size!2199 (buf!2559 thiss!1305)) (currentByte!5032 thiss!1305) (currentBit!5027 thiss!1305)) (bitIndex!0 (size!2199 (buf!2559 (_2!4462 lt!149367))) (currentByte!5032 (_2!4462 lt!149367)) (currentBit!5027 (_2!4462 lt!149367)))))))

(declare-fun b!102781 () Bool)

(declare-fun e!67271 () Bool)

(assert (=> b!102781 (= e!67272 e!67271)))

(declare-fun res!84544 () Bool)

(assert (=> b!102781 (=> res!84544 e!67271)))

(assert (=> b!102781 (= res!84544 (= (size!2199 (buf!2559 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!102782 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4816 array!4816 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!102782 (= e!67271 (arrayBitRangesEq!0 (buf!2559 thiss!1305) (buf!2559 (_2!4462 lt!149367)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2199 (buf!2559 thiss!1305)) (currentByte!5032 thiss!1305) (currentBit!5027 thiss!1305))))))

(assert (= (and d!31936 res!84542) b!102780))

(assert (= (and b!102780 res!84543) b!102781))

(assert (= (and b!102781 (not res!84544)) b!102782))

(assert (=> b!102780 m!149639))

(assert (=> b!102780 m!149637))

(assert (=> b!102782 m!149639))

(assert (=> b!102782 m!149639))

(declare-fun m!149771 () Bool)

(assert (=> b!102782 m!149771))

(assert (=> b!102697 d!31936))

(declare-fun d!31938 () Bool)

(assert (=> d!31938 (= (invariant!0 (currentBit!5027 thiss!1305) (currentByte!5032 thiss!1305) (size!2199 (buf!2559 (_2!4462 lt!149367)))) (and (bvsge (currentBit!5027 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5027 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5032 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5032 thiss!1305) (size!2199 (buf!2559 (_2!4462 lt!149367)))) (and (= (currentBit!5027 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5032 thiss!1305) (size!2199 (buf!2559 (_2!4462 lt!149367))))))))))

(assert (=> b!102694 d!31938))

(declare-fun d!31940 () Bool)

(assert (=> d!31940 (= (onesLSBLong!0 (bvsub nBits!396 i!615)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!396 i!615)))))))

(assert (=> b!102695 d!31940))

(declare-fun d!31942 () Bool)

(declare-fun e!67275 () Bool)

(assert (=> d!31942 e!67275))

(declare-fun res!84547 () Bool)

(assert (=> d!31942 (=> (not res!84547) (not e!67275))))

(declare-fun lt!149611 () tuple2!8416)

(declare-fun lt!149613 () tuple2!8416)

(assert (=> d!31942 (= res!84547 (= (bitIndex!0 (size!2199 (buf!2559 (_1!4463 lt!149611))) (currentByte!5032 (_1!4463 lt!149611)) (currentBit!5027 (_1!4463 lt!149611))) (bitIndex!0 (size!2199 (buf!2559 (_1!4463 lt!149613))) (currentByte!5032 (_1!4463 lt!149613)) (currentBit!5027 (_1!4463 lt!149613)))))))

(declare-fun lt!149612 () Unit!6294)

(declare-fun lt!149610 () BitStream!3872)

(declare-fun choose!50 (BitStream!3872 BitStream!3872 BitStream!3872 tuple2!8416 tuple2!8416 BitStream!3872 Bool tuple2!8416 tuple2!8416 BitStream!3872 Bool) Unit!6294)

(assert (=> d!31942 (= lt!149612 (choose!50 lt!149356 (_2!4462 lt!149358) lt!149610 lt!149611 (tuple2!8417 (_1!4463 lt!149611) (_2!4463 lt!149611)) (_1!4463 lt!149611) (_2!4463 lt!149611) lt!149613 (tuple2!8417 (_1!4463 lt!149613) (_2!4463 lt!149613)) (_1!4463 lt!149613) (_2!4463 lt!149613)))))

(assert (=> d!31942 (= lt!149613 (readBitPure!0 lt!149610))))

(assert (=> d!31942 (= lt!149611 (readBitPure!0 lt!149356))))

(assert (=> d!31942 (= lt!149610 (BitStream!3873 (buf!2559 (_2!4462 lt!149358)) (currentByte!5032 lt!149356) (currentBit!5027 lt!149356)))))

(assert (=> d!31942 (invariant!0 (currentBit!5027 lt!149356) (currentByte!5032 lt!149356) (size!2199 (buf!2559 (_2!4462 lt!149358))))))

(assert (=> d!31942 (= (readBitPrefixLemma!0 lt!149356 (_2!4462 lt!149358)) lt!149612)))

(declare-fun b!102785 () Bool)

(assert (=> b!102785 (= e!67275 (= (_2!4463 lt!149611) (_2!4463 lt!149613)))))

(assert (= (and d!31942 res!84547) b!102785))

(declare-fun m!149773 () Bool)

(assert (=> d!31942 m!149773))

(declare-fun m!149775 () Bool)

(assert (=> d!31942 m!149775))

(declare-fun m!149777 () Bool)

(assert (=> d!31942 m!149777))

(declare-fun m!149779 () Bool)

(assert (=> d!31942 m!149779))

(declare-fun m!149781 () Bool)

(assert (=> d!31942 m!149781))

(assert (=> d!31942 m!149623))

(assert (=> b!102695 d!31942))

(declare-fun d!31944 () Bool)

(declare-fun e!67276 () Bool)

(assert (=> d!31944 e!67276))

(declare-fun res!84548 () Bool)

(assert (=> d!31944 (=> (not res!84548) (not e!67276))))

(declare-fun lt!149616 () (_ BitVec 64))

(declare-fun lt!149614 () (_ BitVec 64))

(declare-fun lt!149619 () (_ BitVec 64))

(assert (=> d!31944 (= res!84548 (= lt!149616 (bvsub lt!149619 lt!149614)))))

(assert (=> d!31944 (or (= (bvand lt!149619 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!149614 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!149619 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!149619 lt!149614) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!31944 (= lt!149614 (remainingBits!0 ((_ sign_extend 32) (size!2199 (buf!2559 (_1!4463 lt!149368)))) ((_ sign_extend 32) (currentByte!5032 (_1!4463 lt!149368))) ((_ sign_extend 32) (currentBit!5027 (_1!4463 lt!149368)))))))

(declare-fun lt!149618 () (_ BitVec 64))

(declare-fun lt!149615 () (_ BitVec 64))

(assert (=> d!31944 (= lt!149619 (bvmul lt!149618 lt!149615))))

(assert (=> d!31944 (or (= lt!149618 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!149615 (bvsdiv (bvmul lt!149618 lt!149615) lt!149618)))))

(assert (=> d!31944 (= lt!149615 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!31944 (= lt!149618 ((_ sign_extend 32) (size!2199 (buf!2559 (_1!4463 lt!149368)))))))

(assert (=> d!31944 (= lt!149616 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5032 (_1!4463 lt!149368))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5027 (_1!4463 lt!149368)))))))

(assert (=> d!31944 (invariant!0 (currentBit!5027 (_1!4463 lt!149368)) (currentByte!5032 (_1!4463 lt!149368)) (size!2199 (buf!2559 (_1!4463 lt!149368))))))

(assert (=> d!31944 (= (bitIndex!0 (size!2199 (buf!2559 (_1!4463 lt!149368))) (currentByte!5032 (_1!4463 lt!149368)) (currentBit!5027 (_1!4463 lt!149368))) lt!149616)))

(declare-fun b!102786 () Bool)

(declare-fun res!84549 () Bool)

(assert (=> b!102786 (=> (not res!84549) (not e!67276))))

(assert (=> b!102786 (= res!84549 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!149616))))

(declare-fun b!102787 () Bool)

(declare-fun lt!149617 () (_ BitVec 64))

(assert (=> b!102787 (= e!67276 (bvsle lt!149616 (bvmul lt!149617 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!102787 (or (= lt!149617 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!149617 #b0000000000000000000000000000000000000000000000000000000000001000) lt!149617)))))

(assert (=> b!102787 (= lt!149617 ((_ sign_extend 32) (size!2199 (buf!2559 (_1!4463 lt!149368)))))))

(assert (= (and d!31944 res!84548) b!102786))

(assert (= (and b!102786 res!84549) b!102787))

(declare-fun m!149783 () Bool)

(assert (=> d!31944 m!149783))

(declare-fun m!149785 () Bool)

(assert (=> d!31944 m!149785))

(assert (=> b!102695 d!31944))

(declare-fun d!31946 () Bool)

(declare-fun res!84550 () Bool)

(declare-fun e!67278 () Bool)

(assert (=> d!31946 (=> (not res!84550) (not e!67278))))

(assert (=> d!31946 (= res!84550 (= (size!2199 (buf!2559 thiss!1305)) (size!2199 (buf!2559 (_2!4462 lt!149358)))))))

(assert (=> d!31946 (= (isPrefixOf!0 thiss!1305 (_2!4462 lt!149358)) e!67278)))

(declare-fun b!102788 () Bool)

(declare-fun res!84551 () Bool)

(assert (=> b!102788 (=> (not res!84551) (not e!67278))))

(assert (=> b!102788 (= res!84551 (bvsle (bitIndex!0 (size!2199 (buf!2559 thiss!1305)) (currentByte!5032 thiss!1305) (currentBit!5027 thiss!1305)) (bitIndex!0 (size!2199 (buf!2559 (_2!4462 lt!149358))) (currentByte!5032 (_2!4462 lt!149358)) (currentBit!5027 (_2!4462 lt!149358)))))))

(declare-fun b!102789 () Bool)

(declare-fun e!67277 () Bool)

(assert (=> b!102789 (= e!67278 e!67277)))

(declare-fun res!84552 () Bool)

(assert (=> b!102789 (=> res!84552 e!67277)))

(assert (=> b!102789 (= res!84552 (= (size!2199 (buf!2559 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!102790 () Bool)

(assert (=> b!102790 (= e!67277 (arrayBitRangesEq!0 (buf!2559 thiss!1305) (buf!2559 (_2!4462 lt!149358)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2199 (buf!2559 thiss!1305)) (currentByte!5032 thiss!1305) (currentBit!5027 thiss!1305))))))

(assert (= (and d!31946 res!84550) b!102788))

(assert (= (and b!102788 res!84551) b!102789))

(assert (= (and b!102789 (not res!84552)) b!102790))

(assert (=> b!102788 m!149639))

(declare-fun m!149787 () Bool)

(assert (=> b!102788 m!149787))

(assert (=> b!102790 m!149639))

(assert (=> b!102790 m!149639))

(declare-fun m!149789 () Bool)

(assert (=> b!102790 m!149789))

(assert (=> b!102695 d!31946))

(declare-fun lt!150077 () tuple2!8418)

(declare-fun lt!150063 () tuple2!8420)

(declare-fun b!102932 () Bool)

(declare-fun e!67358 () Bool)

(assert (=> b!102932 (= e!67358 (and (= (_2!4465 lt!150063) v!199) (= (_1!4465 lt!150063) (_2!4464 lt!150077))))))

(declare-fun lt!150052 () (_ BitVec 64))

(assert (=> b!102932 (= lt!150063 (readNLeastSignificantBitsLoopPure!0 (_1!4464 lt!150077) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!150052))))

(declare-fun lt!150057 () Unit!6294)

(declare-fun lt!150071 () Unit!6294)

(assert (=> b!102932 (= lt!150057 lt!150071)))

(declare-fun lt!150084 () tuple2!8414)

(declare-fun lt!150047 () (_ BitVec 64))

(assert (=> b!102932 (validate_offset_bits!1 ((_ sign_extend 32) (size!2199 (buf!2559 (_2!4462 lt!150084)))) ((_ sign_extend 32) (currentByte!5032 (_2!4462 lt!149367))) ((_ sign_extend 32) (currentBit!5027 (_2!4462 lt!149367))) lt!150047)))

(assert (=> b!102932 (= lt!150071 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4462 lt!149367) (buf!2559 (_2!4462 lt!150084)) lt!150047))))

(declare-fun e!67359 () Bool)

(assert (=> b!102932 e!67359))

(declare-fun res!84662 () Bool)

(assert (=> b!102932 (=> (not res!84662) (not e!67359))))

(assert (=> b!102932 (= res!84662 (and (= (size!2199 (buf!2559 (_2!4462 lt!149367))) (size!2199 (buf!2559 (_2!4462 lt!150084)))) (bvsge lt!150047 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!102932 (= lt!150047 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!102932 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!102932 (= lt!150052 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!102932 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!102932 (= lt!150077 (reader!0 (_2!4462 lt!149367) (_2!4462 lt!150084)))))

(declare-fun b!102933 () Bool)

(declare-fun lt!150076 () tuple2!8416)

(declare-fun lt!150043 () tuple2!8414)

(assert (=> b!102933 (= lt!150076 (readBitPure!0 (readerFrom!0 (_2!4462 lt!150043) (currentBit!5027 (_2!4462 lt!149367)) (currentByte!5032 (_2!4462 lt!149367)))))))

(declare-fun res!84663 () Bool)

(declare-fun lt!150078 () Bool)

(assert (=> b!102933 (= res!84663 (and (= (_2!4463 lt!150076) lt!150078) (= (_1!4463 lt!150076) (_2!4462 lt!150043))))))

(declare-fun e!67354 () Bool)

(assert (=> b!102933 (=> (not res!84663) (not e!67354))))

(declare-fun e!67355 () Bool)

(assert (=> b!102933 (= e!67355 e!67354)))

(declare-fun b!102934 () Bool)

(declare-fun e!67357 () (_ BitVec 64))

(assert (=> b!102934 (= e!67357 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun b!102935 () Bool)

(assert (=> b!102935 (= e!67354 (= (bitIndex!0 (size!2199 (buf!2559 (_1!4463 lt!150076))) (currentByte!5032 (_1!4463 lt!150076)) (currentBit!5027 (_1!4463 lt!150076))) (bitIndex!0 (size!2199 (buf!2559 (_2!4462 lt!150043))) (currentByte!5032 (_2!4462 lt!150043)) (currentBit!5027 (_2!4462 lt!150043)))))))

(declare-fun b!102936 () Bool)

(declare-fun res!84659 () Bool)

(assert (=> b!102936 (= res!84659 (= (bitIndex!0 (size!2199 (buf!2559 (_2!4462 lt!150043))) (currentByte!5032 (_2!4462 lt!150043)) (currentBit!5027 (_2!4462 lt!150043))) (bvadd (bitIndex!0 (size!2199 (buf!2559 (_2!4462 lt!149367))) (currentByte!5032 (_2!4462 lt!149367)) (currentBit!5027 (_2!4462 lt!149367))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!102936 (=> (not res!84659) (not e!67355))))

(declare-fun b!102937 () Bool)

(declare-fun res!84660 () Bool)

(assert (=> b!102937 (=> (not res!84660) (not e!67358))))

(assert (=> b!102937 (= res!84660 (isPrefixOf!0 (_2!4462 lt!149367) (_2!4462 lt!150084)))))

(declare-fun d!31948 () Bool)

(assert (=> d!31948 e!67358))

(declare-fun res!84661 () Bool)

(assert (=> d!31948 (=> (not res!84661) (not e!67358))))

(assert (=> d!31948 (= res!84661 (= (size!2199 (buf!2559 (_2!4462 lt!149367))) (size!2199 (buf!2559 (_2!4462 lt!150084)))))))

(declare-fun e!67356 () tuple2!8414)

(assert (=> d!31948 (= lt!150084 e!67356)))

(declare-fun c!6380 () Bool)

(assert (=> d!31948 (= c!6380 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!31948 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!31948 (= (appendNLeastSignificantBitsLoop!0 (_2!4462 lt!149367) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!150084)))

(declare-fun b!102938 () Bool)

(declare-fun res!84664 () Bool)

(assert (=> b!102938 (= res!84664 (isPrefixOf!0 (_2!4462 lt!149367) (_2!4462 lt!150043)))))

(assert (=> b!102938 (=> (not res!84664) (not e!67355))))

(declare-fun b!102939 () Bool)

(declare-fun res!84658 () Bool)

(assert (=> b!102939 (=> (not res!84658) (not e!67358))))

(declare-fun lt!150068 () (_ BitVec 64))

(declare-fun lt!150049 () (_ BitVec 64))

(assert (=> b!102939 (= res!84658 (= (bitIndex!0 (size!2199 (buf!2559 (_2!4462 lt!150084))) (currentByte!5032 (_2!4462 lt!150084)) (currentBit!5027 (_2!4462 lt!150084))) (bvadd lt!150068 lt!150049)))))

(assert (=> b!102939 (or (not (= (bvand lt!150068 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!150049 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!150068 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!150068 lt!150049) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!102939 (= lt!150049 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!102939 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!102939 (= lt!150068 (bitIndex!0 (size!2199 (buf!2559 (_2!4462 lt!149367))) (currentByte!5032 (_2!4462 lt!149367)) (currentBit!5027 (_2!4462 lt!149367))))))

(declare-fun b!102940 () Bool)

(declare-fun e!67360 () Bool)

(declare-fun lt!150058 () tuple2!8416)

(declare-fun lt!150074 () tuple2!8416)

(assert (=> b!102940 (= e!67360 (= (_2!4463 lt!150058) (_2!4463 lt!150074)))))

(declare-fun b!102941 () Bool)

(assert (=> b!102941 (= e!67357 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!102942 () Bool)

(declare-fun lt!150065 () tuple2!8414)

(declare-fun Unit!6312 () Unit!6294)

(assert (=> b!102942 (= e!67356 (tuple2!8415 Unit!6312 (_2!4462 lt!150065)))))

(assert (=> b!102942 (= lt!150078 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!102942 (= lt!150043 (appendBit!0 (_2!4462 lt!149367) lt!150078))))

(declare-fun res!84666 () Bool)

(assert (=> b!102942 (= res!84666 (= (size!2199 (buf!2559 (_2!4462 lt!149367))) (size!2199 (buf!2559 (_2!4462 lt!150043)))))))

(assert (=> b!102942 (=> (not res!84666) (not e!67355))))

(assert (=> b!102942 e!67355))

(declare-fun lt!150083 () tuple2!8414)

(assert (=> b!102942 (= lt!150083 lt!150043)))

(assert (=> b!102942 (= lt!150065 (appendNLeastSignificantBitsLoop!0 (_2!4462 lt!150083) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!150085 () Unit!6294)

(assert (=> b!102942 (= lt!150085 (lemmaIsPrefixTransitive!0 (_2!4462 lt!149367) (_2!4462 lt!150083) (_2!4462 lt!150065)))))

(declare-fun call!1282 () Bool)

(assert (=> b!102942 call!1282))

(declare-fun lt!150087 () Unit!6294)

(assert (=> b!102942 (= lt!150087 lt!150085)))

(assert (=> b!102942 (invariant!0 (currentBit!5027 (_2!4462 lt!149367)) (currentByte!5032 (_2!4462 lt!149367)) (size!2199 (buf!2559 (_2!4462 lt!150083))))))

(declare-fun lt!150070 () BitStream!3872)

(assert (=> b!102942 (= lt!150070 (BitStream!3873 (buf!2559 (_2!4462 lt!150083)) (currentByte!5032 (_2!4462 lt!149367)) (currentBit!5027 (_2!4462 lt!149367))))))

(assert (=> b!102942 (invariant!0 (currentBit!5027 lt!150070) (currentByte!5032 lt!150070) (size!2199 (buf!2559 (_2!4462 lt!150065))))))

(declare-fun lt!150045 () BitStream!3872)

(assert (=> b!102942 (= lt!150045 (BitStream!3873 (buf!2559 (_2!4462 lt!150065)) (currentByte!5032 lt!150070) (currentBit!5027 lt!150070)))))

(assert (=> b!102942 (= lt!150058 (readBitPure!0 lt!150070))))

(assert (=> b!102942 (= lt!150074 (readBitPure!0 lt!150045))))

(declare-fun lt!150079 () Unit!6294)

(assert (=> b!102942 (= lt!150079 (readBitPrefixLemma!0 lt!150070 (_2!4462 lt!150065)))))

(declare-fun res!84665 () Bool)

(assert (=> b!102942 (= res!84665 (= (bitIndex!0 (size!2199 (buf!2559 (_1!4463 lt!150058))) (currentByte!5032 (_1!4463 lt!150058)) (currentBit!5027 (_1!4463 lt!150058))) (bitIndex!0 (size!2199 (buf!2559 (_1!4463 lt!150074))) (currentByte!5032 (_1!4463 lt!150074)) (currentBit!5027 (_1!4463 lt!150074)))))))

(assert (=> b!102942 (=> (not res!84665) (not e!67360))))

(assert (=> b!102942 e!67360))

(declare-fun lt!150086 () Unit!6294)

(assert (=> b!102942 (= lt!150086 lt!150079)))

(declare-fun lt!150055 () tuple2!8418)

(assert (=> b!102942 (= lt!150055 (reader!0 (_2!4462 lt!149367) (_2!4462 lt!150065)))))

(declare-fun lt!150066 () tuple2!8418)

(assert (=> b!102942 (= lt!150066 (reader!0 (_2!4462 lt!150083) (_2!4462 lt!150065)))))

(declare-fun lt!150046 () tuple2!8416)

(assert (=> b!102942 (= lt!150046 (readBitPure!0 (_1!4464 lt!150055)))))

(assert (=> b!102942 (= (_2!4463 lt!150046) lt!150078)))

(declare-fun lt!150073 () Unit!6294)

(declare-fun Unit!6313 () Unit!6294)

(assert (=> b!102942 (= lt!150073 Unit!6313)))

(declare-fun lt!150064 () (_ BitVec 64))

(assert (=> b!102942 (= lt!150064 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!150067 () (_ BitVec 64))

(assert (=> b!102942 (= lt!150067 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!150048 () Unit!6294)

(assert (=> b!102942 (= lt!150048 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4462 lt!149367) (buf!2559 (_2!4462 lt!150065)) lt!150067))))

(assert (=> b!102942 (validate_offset_bits!1 ((_ sign_extend 32) (size!2199 (buf!2559 (_2!4462 lt!150065)))) ((_ sign_extend 32) (currentByte!5032 (_2!4462 lt!149367))) ((_ sign_extend 32) (currentBit!5027 (_2!4462 lt!149367))) lt!150067)))

(declare-fun lt!150075 () Unit!6294)

(assert (=> b!102942 (= lt!150075 lt!150048)))

(declare-fun lt!150081 () tuple2!8420)

(assert (=> b!102942 (= lt!150081 (readNLeastSignificantBitsLoopPure!0 (_1!4464 lt!150055) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!150064))))

(declare-fun lt!150080 () (_ BitVec 64))

(assert (=> b!102942 (= lt!150080 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!150050 () Unit!6294)

(assert (=> b!102942 (= lt!150050 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4462 lt!150083) (buf!2559 (_2!4462 lt!150065)) lt!150080))))

(assert (=> b!102942 (validate_offset_bits!1 ((_ sign_extend 32) (size!2199 (buf!2559 (_2!4462 lt!150065)))) ((_ sign_extend 32) (currentByte!5032 (_2!4462 lt!150083))) ((_ sign_extend 32) (currentBit!5027 (_2!4462 lt!150083))) lt!150080)))

(declare-fun lt!150059 () Unit!6294)

(assert (=> b!102942 (= lt!150059 lt!150050)))

(declare-fun lt!150061 () tuple2!8420)

(assert (=> b!102942 (= lt!150061 (readNLeastSignificantBitsLoopPure!0 (_1!4464 lt!150066) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!150064 (ite (_2!4463 lt!150046) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!150051 () tuple2!8420)

(assert (=> b!102942 (= lt!150051 (readNLeastSignificantBitsLoopPure!0 (_1!4464 lt!150055) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!150064))))

(declare-fun c!6381 () Bool)

(assert (=> b!102942 (= c!6381 (_2!4463 (readBitPure!0 (_1!4464 lt!150055))))))

(declare-fun lt!150072 () tuple2!8420)

(declare-fun withMovedBitIndex!0 (BitStream!3872 (_ BitVec 64)) BitStream!3872)

(assert (=> b!102942 (= lt!150072 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4464 lt!150055) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!150064 e!67357)))))

(declare-fun lt!150069 () Unit!6294)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!3872 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6294)

(assert (=> b!102942 (= lt!150069 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4464 lt!150055) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!150064))))

(assert (=> b!102942 (and (= (_2!4465 lt!150051) (_2!4465 lt!150072)) (= (_1!4465 lt!150051) (_1!4465 lt!150072)))))

(declare-fun lt!150053 () Unit!6294)

(assert (=> b!102942 (= lt!150053 lt!150069)))

(assert (=> b!102942 (= (_1!4464 lt!150055) (withMovedBitIndex!0 (_2!4464 lt!150055) (bvsub (bitIndex!0 (size!2199 (buf!2559 (_2!4462 lt!149367))) (currentByte!5032 (_2!4462 lt!149367)) (currentBit!5027 (_2!4462 lt!149367))) (bitIndex!0 (size!2199 (buf!2559 (_2!4462 lt!150065))) (currentByte!5032 (_2!4462 lt!150065)) (currentBit!5027 (_2!4462 lt!150065))))))))

(declare-fun lt!150060 () Unit!6294)

(declare-fun Unit!6314 () Unit!6294)

(assert (=> b!102942 (= lt!150060 Unit!6314)))

(assert (=> b!102942 (= (_1!4464 lt!150066) (withMovedBitIndex!0 (_2!4464 lt!150066) (bvsub (bitIndex!0 (size!2199 (buf!2559 (_2!4462 lt!150083))) (currentByte!5032 (_2!4462 lt!150083)) (currentBit!5027 (_2!4462 lt!150083))) (bitIndex!0 (size!2199 (buf!2559 (_2!4462 lt!150065))) (currentByte!5032 (_2!4462 lt!150065)) (currentBit!5027 (_2!4462 lt!150065))))))))

(declare-fun lt!150044 () Unit!6294)

(declare-fun Unit!6315 () Unit!6294)

(assert (=> b!102942 (= lt!150044 Unit!6315)))

(assert (=> b!102942 (= (bitIndex!0 (size!2199 (buf!2559 (_2!4462 lt!149367))) (currentByte!5032 (_2!4462 lt!149367)) (currentBit!5027 (_2!4462 lt!149367))) (bvsub (bitIndex!0 (size!2199 (buf!2559 (_2!4462 lt!150083))) (currentByte!5032 (_2!4462 lt!150083)) (currentBit!5027 (_2!4462 lt!150083))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!150056 () Unit!6294)

(declare-fun Unit!6316 () Unit!6294)

(assert (=> b!102942 (= lt!150056 Unit!6316)))

(assert (=> b!102942 (= (_2!4465 lt!150081) (_2!4465 lt!150061))))

(declare-fun lt!150062 () Unit!6294)

(declare-fun Unit!6317 () Unit!6294)

(assert (=> b!102942 (= lt!150062 Unit!6317)))

(assert (=> b!102942 (= (_1!4465 lt!150081) (_2!4464 lt!150055))))

(declare-fun b!102943 () Bool)

(declare-fun lt!150054 () Unit!6294)

(assert (=> b!102943 (= e!67356 (tuple2!8415 lt!150054 (_2!4462 lt!149367)))))

(declare-fun lt!150082 () BitStream!3872)

(assert (=> b!102943 (= lt!150082 (_2!4462 lt!149367))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!3872) Unit!6294)

(assert (=> b!102943 (= lt!150054 (lemmaIsPrefixRefl!0 lt!150082))))

(assert (=> b!102943 call!1282))

(declare-fun b!102944 () Bool)

(assert (=> b!102944 (= e!67359 (validate_offset_bits!1 ((_ sign_extend 32) (size!2199 (buf!2559 (_2!4462 lt!149367)))) ((_ sign_extend 32) (currentByte!5032 (_2!4462 lt!149367))) ((_ sign_extend 32) (currentBit!5027 (_2!4462 lt!149367))) lt!150047))))

(declare-fun bm!1279 () Bool)

(assert (=> bm!1279 (= call!1282 (isPrefixOf!0 (ite c!6380 (_2!4462 lt!149367) lt!150082) (ite c!6380 (_2!4462 lt!150065) lt!150082)))))

(assert (= (and d!31948 c!6380) b!102942))

(assert (= (and d!31948 (not c!6380)) b!102943))

(assert (= (and b!102942 res!84666) b!102936))

(assert (= (and b!102936 res!84659) b!102938))

(assert (= (and b!102938 res!84664) b!102933))

(assert (= (and b!102933 res!84663) b!102935))

(assert (= (and b!102942 res!84665) b!102940))

(assert (= (and b!102942 c!6381) b!102934))

(assert (= (and b!102942 (not c!6381)) b!102941))

(assert (= (or b!102942 b!102943) bm!1279))

(assert (= (and d!31948 res!84661) b!102939))

(assert (= (and b!102939 res!84658) b!102937))

(assert (= (and b!102937 res!84660) b!102932))

(assert (= (and b!102932 res!84662) b!102944))

(declare-fun m!150037 () Bool)

(assert (=> b!102943 m!150037))

(declare-fun m!150039 () Bool)

(assert (=> b!102942 m!150039))

(declare-fun m!150041 () Bool)

(assert (=> b!102942 m!150041))

(declare-fun m!150043 () Bool)

(assert (=> b!102942 m!150043))

(declare-fun m!150045 () Bool)

(assert (=> b!102942 m!150045))

(declare-fun m!150047 () Bool)

(assert (=> b!102942 m!150047))

(declare-fun m!150049 () Bool)

(assert (=> b!102942 m!150049))

(declare-fun m!150051 () Bool)

(assert (=> b!102942 m!150051))

(declare-fun m!150053 () Bool)

(assert (=> b!102942 m!150053))

(declare-fun m!150055 () Bool)

(assert (=> b!102942 m!150055))

(declare-fun m!150057 () Bool)

(assert (=> b!102942 m!150057))

(declare-fun m!150059 () Bool)

(assert (=> b!102942 m!150059))

(assert (=> b!102942 m!149637))

(declare-fun m!150061 () Bool)

(assert (=> b!102942 m!150061))

(declare-fun m!150063 () Bool)

(assert (=> b!102942 m!150063))

(declare-fun m!150065 () Bool)

(assert (=> b!102942 m!150065))

(declare-fun m!150067 () Bool)

(assert (=> b!102942 m!150067))

(declare-fun m!150069 () Bool)

(assert (=> b!102942 m!150069))

(declare-fun m!150071 () Bool)

(assert (=> b!102942 m!150071))

(declare-fun m!150073 () Bool)

(assert (=> b!102942 m!150073))

(declare-fun m!150075 () Bool)

(assert (=> b!102942 m!150075))

(declare-fun m!150077 () Bool)

(assert (=> b!102942 m!150077))

(declare-fun m!150079 () Bool)

(assert (=> b!102942 m!150079))

(declare-fun m!150081 () Bool)

(assert (=> b!102942 m!150081))

(declare-fun m!150083 () Bool)

(assert (=> b!102942 m!150083))

(declare-fun m!150085 () Bool)

(assert (=> b!102942 m!150085))

(assert (=> b!102942 m!150051))

(declare-fun m!150087 () Bool)

(assert (=> b!102942 m!150087))

(declare-fun m!150089 () Bool)

(assert (=> b!102942 m!150089))

(declare-fun m!150091 () Bool)

(assert (=> b!102942 m!150091))

(declare-fun m!150093 () Bool)

(assert (=> b!102933 m!150093))

(assert (=> b!102933 m!150093))

(declare-fun m!150095 () Bool)

(assert (=> b!102933 m!150095))

(declare-fun m!150097 () Bool)

(assert (=> b!102932 m!150097))

(declare-fun m!150099 () Bool)

(assert (=> b!102932 m!150099))

(declare-fun m!150101 () Bool)

(assert (=> b!102932 m!150101))

(assert (=> b!102932 m!150053))

(declare-fun m!150103 () Bool)

(assert (=> b!102932 m!150103))

(declare-fun m!150105 () Bool)

(assert (=> b!102938 m!150105))

(declare-fun m!150107 () Bool)

(assert (=> b!102939 m!150107))

(assert (=> b!102939 m!149637))

(declare-fun m!150109 () Bool)

(assert (=> b!102935 m!150109))

(declare-fun m!150111 () Bool)

(assert (=> b!102935 m!150111))

(declare-fun m!150113 () Bool)

(assert (=> b!102937 m!150113))

(assert (=> b!102936 m!150111))

(assert (=> b!102936 m!149637))

(declare-fun m!150115 () Bool)

(assert (=> b!102944 m!150115))

(declare-fun m!150117 () Bool)

(assert (=> bm!1279 m!150117))

(assert (=> b!102695 d!31948))

(declare-fun d!31982 () Bool)

(assert (=> d!31982 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2199 (buf!2559 (_2!4462 lt!149358)))) ((_ sign_extend 32) (currentByte!5032 thiss!1305)) ((_ sign_extend 32) (currentBit!5027 thiss!1305)) lt!149360) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2199 (buf!2559 (_2!4462 lt!149358)))) ((_ sign_extend 32) (currentByte!5032 thiss!1305)) ((_ sign_extend 32) (currentBit!5027 thiss!1305))) lt!149360))))

(declare-fun bs!7841 () Bool)

(assert (= bs!7841 d!31982))

(declare-fun m!150119 () Bool)

(assert (=> bs!7841 m!150119))

(assert (=> b!102695 d!31982))

(declare-fun d!31984 () Bool)

(declare-fun lt!150088 () tuple2!8430)

(assert (=> d!31984 (= lt!150088 (readBit!0 (BitStream!3873 (buf!2559 (_2!4462 lt!149358)) (currentByte!5032 thiss!1305) (currentBit!5027 thiss!1305))))))

(assert (=> d!31984 (= (readBitPure!0 (BitStream!3873 (buf!2559 (_2!4462 lt!149358)) (currentByte!5032 thiss!1305) (currentBit!5027 thiss!1305))) (tuple2!8417 (_2!4470 lt!150088) (_1!4470 lt!150088)))))

(declare-fun bs!7842 () Bool)

(assert (= bs!7842 d!31984))

(declare-fun m!150121 () Bool)

(assert (=> bs!7842 m!150121))

(assert (=> b!102695 d!31984))

(declare-fun d!31986 () Bool)

(assert (=> d!31986 (validate_offset_bits!1 ((_ sign_extend 32) (size!2199 (buf!2559 (_2!4462 lt!149358)))) ((_ sign_extend 32) (currentByte!5032 thiss!1305)) ((_ sign_extend 32) (currentBit!5027 thiss!1305)) lt!149360)))

(declare-fun lt!150099 () Unit!6294)

(declare-fun choose!9 (BitStream!3872 array!4816 (_ BitVec 64) BitStream!3872) Unit!6294)

(assert (=> d!31986 (= lt!150099 (choose!9 thiss!1305 (buf!2559 (_2!4462 lt!149358)) lt!149360 (BitStream!3873 (buf!2559 (_2!4462 lt!149358)) (currentByte!5032 thiss!1305) (currentBit!5027 thiss!1305))))))

(assert (=> d!31986 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2559 (_2!4462 lt!149358)) lt!149360) lt!150099)))

(declare-fun bs!7843 () Bool)

(assert (= bs!7843 d!31986))

(assert (=> bs!7843 m!149607))

(declare-fun m!150123 () Bool)

(assert (=> bs!7843 m!150123))

(assert (=> b!102695 d!31986))

(declare-fun d!31988 () Bool)

(declare-datatypes ((tuple2!8432 0))(
  ( (tuple2!8433 (_1!4471 (_ BitVec 64)) (_2!4471 BitStream!3872)) )
))
(declare-fun lt!150106 () tuple2!8432)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!3872 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8432)

(assert (=> d!31988 (= lt!150106 (readNLeastSignificantBitsLoop!0 (_1!4464 lt!149353) nBits!396 i!615 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615))))))))

(assert (=> d!31988 (= (readNLeastSignificantBitsLoopPure!0 (_1!4464 lt!149353) nBits!396 i!615 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615))))) (tuple2!8421 (_2!4471 lt!150106) (_1!4471 lt!150106)))))

(declare-fun bs!7844 () Bool)

(assert (= bs!7844 d!31988))

(declare-fun m!150135 () Bool)

(assert (=> bs!7844 m!150135))

(assert (=> b!102695 d!31988))

(declare-fun b!102986 () Bool)

(declare-fun res!84705 () Bool)

(declare-fun e!67385 () Bool)

(assert (=> b!102986 (=> (not res!84705) (not e!67385))))

(declare-fun lt!150206 () tuple2!8418)

(assert (=> b!102986 (= res!84705 (isPrefixOf!0 (_2!4464 lt!150206) (_2!4462 lt!149358)))))

(declare-fun b!102987 () Bool)

(declare-fun e!67386 () Unit!6294)

(declare-fun lt!150205 () Unit!6294)

(assert (=> b!102987 (= e!67386 lt!150205)))

(declare-fun lt!150210 () (_ BitVec 64))

(assert (=> b!102987 (= lt!150210 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!150202 () (_ BitVec 64))

(assert (=> b!102987 (= lt!150202 (bitIndex!0 (size!2199 (buf!2559 thiss!1305)) (currentByte!5032 thiss!1305) (currentBit!5027 thiss!1305)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!4816 array!4816 (_ BitVec 64) (_ BitVec 64)) Unit!6294)

(assert (=> b!102987 (= lt!150205 (arrayBitRangesEqSymmetric!0 (buf!2559 thiss!1305) (buf!2559 (_2!4462 lt!149358)) lt!150210 lt!150202))))

(assert (=> b!102987 (arrayBitRangesEq!0 (buf!2559 (_2!4462 lt!149358)) (buf!2559 thiss!1305) lt!150210 lt!150202)))

(declare-fun b!102988 () Bool)

(declare-fun lt!150215 () (_ BitVec 64))

(declare-fun lt!150203 () (_ BitVec 64))

(assert (=> b!102988 (= e!67385 (= (_1!4464 lt!150206) (withMovedBitIndex!0 (_2!4464 lt!150206) (bvsub lt!150215 lt!150203))))))

(assert (=> b!102988 (or (= (bvand lt!150215 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!150203 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!150215 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!150215 lt!150203) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!102988 (= lt!150203 (bitIndex!0 (size!2199 (buf!2559 (_2!4462 lt!149358))) (currentByte!5032 (_2!4462 lt!149358)) (currentBit!5027 (_2!4462 lt!149358))))))

(assert (=> b!102988 (= lt!150215 (bitIndex!0 (size!2199 (buf!2559 thiss!1305)) (currentByte!5032 thiss!1305) (currentBit!5027 thiss!1305)))))

(declare-fun d!31994 () Bool)

(assert (=> d!31994 e!67385))

(declare-fun res!84704 () Bool)

(assert (=> d!31994 (=> (not res!84704) (not e!67385))))

(assert (=> d!31994 (= res!84704 (isPrefixOf!0 (_1!4464 lt!150206) (_2!4464 lt!150206)))))

(declare-fun lt!150213 () BitStream!3872)

(assert (=> d!31994 (= lt!150206 (tuple2!8419 lt!150213 (_2!4462 lt!149358)))))

(declare-fun lt!150212 () Unit!6294)

(declare-fun lt!150201 () Unit!6294)

(assert (=> d!31994 (= lt!150212 lt!150201)))

(assert (=> d!31994 (isPrefixOf!0 lt!150213 (_2!4462 lt!149358))))

(assert (=> d!31994 (= lt!150201 (lemmaIsPrefixTransitive!0 lt!150213 (_2!4462 lt!149358) (_2!4462 lt!149358)))))

(declare-fun lt!150214 () Unit!6294)

(declare-fun lt!150197 () Unit!6294)

(assert (=> d!31994 (= lt!150214 lt!150197)))

(assert (=> d!31994 (isPrefixOf!0 lt!150213 (_2!4462 lt!149358))))

(assert (=> d!31994 (= lt!150197 (lemmaIsPrefixTransitive!0 lt!150213 thiss!1305 (_2!4462 lt!149358)))))

(declare-fun lt!150207 () Unit!6294)

(assert (=> d!31994 (= lt!150207 e!67386)))

(declare-fun c!6385 () Bool)

(assert (=> d!31994 (= c!6385 (not (= (size!2199 (buf!2559 thiss!1305)) #b00000000000000000000000000000000)))))

(declare-fun lt!150204 () Unit!6294)

(declare-fun lt!150200 () Unit!6294)

(assert (=> d!31994 (= lt!150204 lt!150200)))

(assert (=> d!31994 (isPrefixOf!0 (_2!4462 lt!149358) (_2!4462 lt!149358))))

(assert (=> d!31994 (= lt!150200 (lemmaIsPrefixRefl!0 (_2!4462 lt!149358)))))

(declare-fun lt!150209 () Unit!6294)

(declare-fun lt!150199 () Unit!6294)

(assert (=> d!31994 (= lt!150209 lt!150199)))

(assert (=> d!31994 (= lt!150199 (lemmaIsPrefixRefl!0 (_2!4462 lt!149358)))))

(declare-fun lt!150208 () Unit!6294)

(declare-fun lt!150196 () Unit!6294)

(assert (=> d!31994 (= lt!150208 lt!150196)))

(assert (=> d!31994 (isPrefixOf!0 lt!150213 lt!150213)))

(assert (=> d!31994 (= lt!150196 (lemmaIsPrefixRefl!0 lt!150213))))

(declare-fun lt!150211 () Unit!6294)

(declare-fun lt!150198 () Unit!6294)

(assert (=> d!31994 (= lt!150211 lt!150198)))

(assert (=> d!31994 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!31994 (= lt!150198 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (=> d!31994 (= lt!150213 (BitStream!3873 (buf!2559 (_2!4462 lt!149358)) (currentByte!5032 thiss!1305) (currentBit!5027 thiss!1305)))))

(assert (=> d!31994 (isPrefixOf!0 thiss!1305 (_2!4462 lt!149358))))

(assert (=> d!31994 (= (reader!0 thiss!1305 (_2!4462 lt!149358)) lt!150206)))

(declare-fun b!102989 () Bool)

(declare-fun res!84703 () Bool)

(assert (=> b!102989 (=> (not res!84703) (not e!67385))))

(assert (=> b!102989 (= res!84703 (isPrefixOf!0 (_1!4464 lt!150206) thiss!1305))))

(declare-fun b!102990 () Bool)

(declare-fun Unit!6318 () Unit!6294)

(assert (=> b!102990 (= e!67386 Unit!6318)))

(assert (= (and d!31994 c!6385) b!102987))

(assert (= (and d!31994 (not c!6385)) b!102990))

(assert (= (and d!31994 res!84704) b!102989))

(assert (= (and b!102989 res!84703) b!102986))

(assert (= (and b!102986 res!84705) b!102988))

(assert (=> b!102987 m!149639))

(declare-fun m!150191 () Bool)

(assert (=> b!102987 m!150191))

(declare-fun m!150193 () Bool)

(assert (=> b!102987 m!150193))

(declare-fun m!150195 () Bool)

(assert (=> b!102986 m!150195))

(declare-fun m!150197 () Bool)

(assert (=> b!102989 m!150197))

(declare-fun m!150199 () Bool)

(assert (=> d!31994 m!150199))

(declare-fun m!150201 () Bool)

(assert (=> d!31994 m!150201))

(declare-fun m!150203 () Bool)

(assert (=> d!31994 m!150203))

(declare-fun m!150205 () Bool)

(assert (=> d!31994 m!150205))

(declare-fun m!150207 () Bool)

(assert (=> d!31994 m!150207))

(declare-fun m!150209 () Bool)

(assert (=> d!31994 m!150209))

(declare-fun m!150211 () Bool)

(assert (=> d!31994 m!150211))

(declare-fun m!150213 () Bool)

(assert (=> d!31994 m!150213))

(declare-fun m!150215 () Bool)

(assert (=> d!31994 m!150215))

(assert (=> d!31994 m!149619))

(declare-fun m!150217 () Bool)

(assert (=> d!31994 m!150217))

(declare-fun m!150219 () Bool)

(assert (=> b!102988 m!150219))

(assert (=> b!102988 m!149787))

(assert (=> b!102988 m!149639))

(assert (=> b!102695 d!31994))

(declare-fun d!32022 () Bool)

(assert (=> d!32022 (isPrefixOf!0 thiss!1305 (_2!4462 lt!149358))))

(declare-fun lt!150218 () Unit!6294)

(declare-fun choose!30 (BitStream!3872 BitStream!3872 BitStream!3872) Unit!6294)

(assert (=> d!32022 (= lt!150218 (choose!30 thiss!1305 (_2!4462 lt!149367) (_2!4462 lt!149358)))))

(assert (=> d!32022 (isPrefixOf!0 thiss!1305 (_2!4462 lt!149367))))

(assert (=> d!32022 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4462 lt!149367) (_2!4462 lt!149358)) lt!150218)))

(declare-fun bs!7850 () Bool)

(assert (= bs!7850 d!32022))

(assert (=> bs!7850 m!149619))

(declare-fun m!150221 () Bool)

(assert (=> bs!7850 m!150221))

(assert (=> bs!7850 m!149627))

(assert (=> b!102695 d!32022))

(declare-fun b!103002 () Bool)

(declare-fun e!67392 () Bool)

(declare-fun e!67391 () Bool)

(assert (=> b!103002 (= e!67392 e!67391)))

(declare-fun res!84715 () Bool)

(assert (=> b!103002 (=> (not res!84715) (not e!67391))))

(declare-fun lt!150228 () tuple2!8414)

(declare-fun lt!150230 () tuple2!8416)

(assert (=> b!103002 (= res!84715 (and (= (_2!4463 lt!150230) lt!149357) (= (_1!4463 lt!150230) (_2!4462 lt!150228))))))

(assert (=> b!103002 (= lt!150230 (readBitPure!0 (readerFrom!0 (_2!4462 lt!150228) (currentBit!5027 thiss!1305) (currentByte!5032 thiss!1305))))))

(declare-fun d!32024 () Bool)

(assert (=> d!32024 e!67392))

(declare-fun res!84717 () Bool)

(assert (=> d!32024 (=> (not res!84717) (not e!67392))))

(assert (=> d!32024 (= res!84717 (= (size!2199 (buf!2559 thiss!1305)) (size!2199 (buf!2559 (_2!4462 lt!150228)))))))

(declare-fun choose!16 (BitStream!3872 Bool) tuple2!8414)

(assert (=> d!32024 (= lt!150228 (choose!16 thiss!1305 lt!149357))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!32024 (validate_offset_bit!0 ((_ sign_extend 32) (size!2199 (buf!2559 thiss!1305))) ((_ sign_extend 32) (currentByte!5032 thiss!1305)) ((_ sign_extend 32) (currentBit!5027 thiss!1305)))))

(assert (=> d!32024 (= (appendBit!0 thiss!1305 lt!149357) lt!150228)))

(declare-fun b!103001 () Bool)

(declare-fun res!84714 () Bool)

(assert (=> b!103001 (=> (not res!84714) (not e!67392))))

(assert (=> b!103001 (= res!84714 (isPrefixOf!0 thiss!1305 (_2!4462 lt!150228)))))

(declare-fun b!103000 () Bool)

(declare-fun res!84716 () Bool)

(assert (=> b!103000 (=> (not res!84716) (not e!67392))))

(declare-fun lt!150227 () (_ BitVec 64))

(declare-fun lt!150229 () (_ BitVec 64))

(assert (=> b!103000 (= res!84716 (= (bitIndex!0 (size!2199 (buf!2559 (_2!4462 lt!150228))) (currentByte!5032 (_2!4462 lt!150228)) (currentBit!5027 (_2!4462 lt!150228))) (bvadd lt!150227 lt!150229)))))

(assert (=> b!103000 (or (not (= (bvand lt!150227 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!150229 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!150227 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!150227 lt!150229) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!103000 (= lt!150229 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!103000 (= lt!150227 (bitIndex!0 (size!2199 (buf!2559 thiss!1305)) (currentByte!5032 thiss!1305) (currentBit!5027 thiss!1305)))))

(declare-fun b!103003 () Bool)

(assert (=> b!103003 (= e!67391 (= (bitIndex!0 (size!2199 (buf!2559 (_1!4463 lt!150230))) (currentByte!5032 (_1!4463 lt!150230)) (currentBit!5027 (_1!4463 lt!150230))) (bitIndex!0 (size!2199 (buf!2559 (_2!4462 lt!150228))) (currentByte!5032 (_2!4462 lt!150228)) (currentBit!5027 (_2!4462 lt!150228)))))))

(assert (= (and d!32024 res!84717) b!103000))

(assert (= (and b!103000 res!84716) b!103001))

(assert (= (and b!103001 res!84714) b!103002))

(assert (= (and b!103002 res!84715) b!103003))

(declare-fun m!150223 () Bool)

(assert (=> b!103000 m!150223))

(assert (=> b!103000 m!149639))

(declare-fun m!150225 () Bool)

(assert (=> d!32024 m!150225))

(declare-fun m!150227 () Bool)

(assert (=> d!32024 m!150227))

(declare-fun m!150229 () Bool)

(assert (=> b!103001 m!150229))

(declare-fun m!150231 () Bool)

(assert (=> b!103003 m!150231))

(assert (=> b!103003 m!150223))

(declare-fun m!150233 () Bool)

(assert (=> b!103002 m!150233))

(assert (=> b!103002 m!150233))

(declare-fun m!150235 () Bool)

(assert (=> b!103002 m!150235))

(assert (=> b!102695 d!32024))

(declare-fun b!103004 () Bool)

(declare-fun res!84720 () Bool)

(declare-fun e!67393 () Bool)

(assert (=> b!103004 (=> (not res!84720) (not e!67393))))

(declare-fun lt!150241 () tuple2!8418)

(assert (=> b!103004 (= res!84720 (isPrefixOf!0 (_2!4464 lt!150241) (_2!4462 lt!149358)))))

(declare-fun b!103005 () Bool)

(declare-fun e!67394 () Unit!6294)

(declare-fun lt!150240 () Unit!6294)

(assert (=> b!103005 (= e!67394 lt!150240)))

(declare-fun lt!150245 () (_ BitVec 64))

(assert (=> b!103005 (= lt!150245 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!150237 () (_ BitVec 64))

(assert (=> b!103005 (= lt!150237 (bitIndex!0 (size!2199 (buf!2559 (_2!4462 lt!149367))) (currentByte!5032 (_2!4462 lt!149367)) (currentBit!5027 (_2!4462 lt!149367))))))

(assert (=> b!103005 (= lt!150240 (arrayBitRangesEqSymmetric!0 (buf!2559 (_2!4462 lt!149367)) (buf!2559 (_2!4462 lt!149358)) lt!150245 lt!150237))))

(assert (=> b!103005 (arrayBitRangesEq!0 (buf!2559 (_2!4462 lt!149358)) (buf!2559 (_2!4462 lt!149367)) lt!150245 lt!150237)))

(declare-fun b!103006 () Bool)

(declare-fun lt!150250 () (_ BitVec 64))

(declare-fun lt!150238 () (_ BitVec 64))

(assert (=> b!103006 (= e!67393 (= (_1!4464 lt!150241) (withMovedBitIndex!0 (_2!4464 lt!150241) (bvsub lt!150250 lt!150238))))))

(assert (=> b!103006 (or (= (bvand lt!150250 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!150238 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!150250 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!150250 lt!150238) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!103006 (= lt!150238 (bitIndex!0 (size!2199 (buf!2559 (_2!4462 lt!149358))) (currentByte!5032 (_2!4462 lt!149358)) (currentBit!5027 (_2!4462 lt!149358))))))

(assert (=> b!103006 (= lt!150250 (bitIndex!0 (size!2199 (buf!2559 (_2!4462 lt!149367))) (currentByte!5032 (_2!4462 lt!149367)) (currentBit!5027 (_2!4462 lt!149367))))))

(declare-fun d!32026 () Bool)

(assert (=> d!32026 e!67393))

(declare-fun res!84719 () Bool)

(assert (=> d!32026 (=> (not res!84719) (not e!67393))))

(assert (=> d!32026 (= res!84719 (isPrefixOf!0 (_1!4464 lt!150241) (_2!4464 lt!150241)))))

(declare-fun lt!150248 () BitStream!3872)

(assert (=> d!32026 (= lt!150241 (tuple2!8419 lt!150248 (_2!4462 lt!149358)))))

(declare-fun lt!150247 () Unit!6294)

(declare-fun lt!150236 () Unit!6294)

(assert (=> d!32026 (= lt!150247 lt!150236)))

(assert (=> d!32026 (isPrefixOf!0 lt!150248 (_2!4462 lt!149358))))

(assert (=> d!32026 (= lt!150236 (lemmaIsPrefixTransitive!0 lt!150248 (_2!4462 lt!149358) (_2!4462 lt!149358)))))

(declare-fun lt!150249 () Unit!6294)

(declare-fun lt!150232 () Unit!6294)

(assert (=> d!32026 (= lt!150249 lt!150232)))

(assert (=> d!32026 (isPrefixOf!0 lt!150248 (_2!4462 lt!149358))))

(assert (=> d!32026 (= lt!150232 (lemmaIsPrefixTransitive!0 lt!150248 (_2!4462 lt!149367) (_2!4462 lt!149358)))))

(declare-fun lt!150242 () Unit!6294)

(assert (=> d!32026 (= lt!150242 e!67394)))

(declare-fun c!6386 () Bool)

(assert (=> d!32026 (= c!6386 (not (= (size!2199 (buf!2559 (_2!4462 lt!149367))) #b00000000000000000000000000000000)))))

(declare-fun lt!150239 () Unit!6294)

(declare-fun lt!150235 () Unit!6294)

(assert (=> d!32026 (= lt!150239 lt!150235)))

(assert (=> d!32026 (isPrefixOf!0 (_2!4462 lt!149358) (_2!4462 lt!149358))))

(assert (=> d!32026 (= lt!150235 (lemmaIsPrefixRefl!0 (_2!4462 lt!149358)))))

(declare-fun lt!150244 () Unit!6294)

(declare-fun lt!150234 () Unit!6294)

(assert (=> d!32026 (= lt!150244 lt!150234)))

(assert (=> d!32026 (= lt!150234 (lemmaIsPrefixRefl!0 (_2!4462 lt!149358)))))

(declare-fun lt!150243 () Unit!6294)

(declare-fun lt!150231 () Unit!6294)

(assert (=> d!32026 (= lt!150243 lt!150231)))

(assert (=> d!32026 (isPrefixOf!0 lt!150248 lt!150248)))

(assert (=> d!32026 (= lt!150231 (lemmaIsPrefixRefl!0 lt!150248))))

(declare-fun lt!150246 () Unit!6294)

(declare-fun lt!150233 () Unit!6294)

(assert (=> d!32026 (= lt!150246 lt!150233)))

(assert (=> d!32026 (isPrefixOf!0 (_2!4462 lt!149367) (_2!4462 lt!149367))))

(assert (=> d!32026 (= lt!150233 (lemmaIsPrefixRefl!0 (_2!4462 lt!149367)))))

(assert (=> d!32026 (= lt!150248 (BitStream!3873 (buf!2559 (_2!4462 lt!149358)) (currentByte!5032 (_2!4462 lt!149367)) (currentBit!5027 (_2!4462 lt!149367))))))

(assert (=> d!32026 (isPrefixOf!0 (_2!4462 lt!149367) (_2!4462 lt!149358))))

(assert (=> d!32026 (= (reader!0 (_2!4462 lt!149367) (_2!4462 lt!149358)) lt!150241)))

(declare-fun b!103007 () Bool)

(declare-fun res!84718 () Bool)

(assert (=> b!103007 (=> (not res!84718) (not e!67393))))

(assert (=> b!103007 (= res!84718 (isPrefixOf!0 (_1!4464 lt!150241) (_2!4462 lt!149367)))))

(declare-fun b!103008 () Bool)

(declare-fun Unit!6319 () Unit!6294)

(assert (=> b!103008 (= e!67394 Unit!6319)))

(assert (= (and d!32026 c!6386) b!103005))

(assert (= (and d!32026 (not c!6386)) b!103008))

(assert (= (and d!32026 res!84719) b!103007))

(assert (= (and b!103007 res!84718) b!103004))

(assert (= (and b!103004 res!84720) b!103006))

(assert (=> b!103005 m!149637))

(declare-fun m!150237 () Bool)

(assert (=> b!103005 m!150237))

(declare-fun m!150239 () Bool)

(assert (=> b!103005 m!150239))

(declare-fun m!150241 () Bool)

(assert (=> b!103004 m!150241))

(declare-fun m!150243 () Bool)

(assert (=> b!103007 m!150243))

(declare-fun m!150245 () Bool)

(assert (=> d!32026 m!150245))

(declare-fun m!150247 () Bool)

(assert (=> d!32026 m!150247))

(assert (=> d!32026 m!150203))

(declare-fun m!150249 () Bool)

(assert (=> d!32026 m!150249))

(declare-fun m!150251 () Bool)

(assert (=> d!32026 m!150251))

(declare-fun m!150253 () Bool)

(assert (=> d!32026 m!150253))

(declare-fun m!150255 () Bool)

(assert (=> d!32026 m!150255))

(assert (=> d!32026 m!150213))

(declare-fun m!150257 () Bool)

(assert (=> d!32026 m!150257))

(declare-fun m!150259 () Bool)

(assert (=> d!32026 m!150259))

(declare-fun m!150261 () Bool)

(assert (=> d!32026 m!150261))

(declare-fun m!150263 () Bool)

(assert (=> b!103006 m!150263))

(assert (=> b!103006 m!149787))

(assert (=> b!103006 m!149637))

(assert (=> b!102695 d!32026))

(declare-fun d!32028 () Bool)

(assert (=> d!32028 (validate_offset_bits!1 ((_ sign_extend 32) (size!2199 (buf!2559 (_2!4462 lt!149358)))) ((_ sign_extend 32) (currentByte!5032 (_2!4462 lt!149367))) ((_ sign_extend 32) (currentBit!5027 (_2!4462 lt!149367))) lt!149361)))

(declare-fun lt!150251 () Unit!6294)

(assert (=> d!32028 (= lt!150251 (choose!9 (_2!4462 lt!149367) (buf!2559 (_2!4462 lt!149358)) lt!149361 (BitStream!3873 (buf!2559 (_2!4462 lt!149358)) (currentByte!5032 (_2!4462 lt!149367)) (currentBit!5027 (_2!4462 lt!149367)))))))

(assert (=> d!32028 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4462 lt!149367) (buf!2559 (_2!4462 lt!149358)) lt!149361) lt!150251)))

(declare-fun bs!7851 () Bool)

(assert (= bs!7851 d!32028))

(assert (=> bs!7851 m!149611))

(declare-fun m!150265 () Bool)

(assert (=> bs!7851 m!150265))

(assert (=> b!102695 d!32028))

(declare-fun d!32030 () Bool)

(declare-fun lt!150252 () tuple2!8430)

(assert (=> d!32030 (= lt!150252 (readBit!0 (_1!4464 lt!149353)))))

(assert (=> d!32030 (= (readBitPure!0 (_1!4464 lt!149353)) (tuple2!8417 (_2!4470 lt!150252) (_1!4470 lt!150252)))))

(declare-fun bs!7852 () Bool)

(assert (= bs!7852 d!32030))

(declare-fun m!150267 () Bool)

(assert (=> bs!7852 m!150267))

(assert (=> b!102695 d!32030))

(declare-fun d!32032 () Bool)

(declare-fun e!67395 () Bool)

(assert (=> d!32032 e!67395))

(declare-fun res!84721 () Bool)

(assert (=> d!32032 (=> (not res!84721) (not e!67395))))

(declare-fun lt!150258 () (_ BitVec 64))

(declare-fun lt!150253 () (_ BitVec 64))

(declare-fun lt!150255 () (_ BitVec 64))

(assert (=> d!32032 (= res!84721 (= lt!150255 (bvsub lt!150258 lt!150253)))))

(assert (=> d!32032 (or (= (bvand lt!150258 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!150253 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!150258 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!150258 lt!150253) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32032 (= lt!150253 (remainingBits!0 ((_ sign_extend 32) (size!2199 (buf!2559 (_1!4463 lt!149363)))) ((_ sign_extend 32) (currentByte!5032 (_1!4463 lt!149363))) ((_ sign_extend 32) (currentBit!5027 (_1!4463 lt!149363)))))))

(declare-fun lt!150257 () (_ BitVec 64))

(declare-fun lt!150254 () (_ BitVec 64))

(assert (=> d!32032 (= lt!150258 (bvmul lt!150257 lt!150254))))

(assert (=> d!32032 (or (= lt!150257 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!150254 (bvsdiv (bvmul lt!150257 lt!150254) lt!150257)))))

(assert (=> d!32032 (= lt!150254 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!32032 (= lt!150257 ((_ sign_extend 32) (size!2199 (buf!2559 (_1!4463 lt!149363)))))))

(assert (=> d!32032 (= lt!150255 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5032 (_1!4463 lt!149363))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5027 (_1!4463 lt!149363)))))))

(assert (=> d!32032 (invariant!0 (currentBit!5027 (_1!4463 lt!149363)) (currentByte!5032 (_1!4463 lt!149363)) (size!2199 (buf!2559 (_1!4463 lt!149363))))))

(assert (=> d!32032 (= (bitIndex!0 (size!2199 (buf!2559 (_1!4463 lt!149363))) (currentByte!5032 (_1!4463 lt!149363)) (currentBit!5027 (_1!4463 lt!149363))) lt!150255)))

(declare-fun b!103009 () Bool)

(declare-fun res!84722 () Bool)

(assert (=> b!103009 (=> (not res!84722) (not e!67395))))

(assert (=> b!103009 (= res!84722 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!150255))))

(declare-fun b!103010 () Bool)

(declare-fun lt!150256 () (_ BitVec 64))

(assert (=> b!103010 (= e!67395 (bvsle lt!150255 (bvmul lt!150256 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!103010 (or (= lt!150256 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!150256 #b0000000000000000000000000000000000000000000000000000000000001000) lt!150256)))))

(assert (=> b!103010 (= lt!150256 ((_ sign_extend 32) (size!2199 (buf!2559 (_1!4463 lt!149363)))))))

(assert (= (and d!32032 res!84721) b!103009))

(assert (= (and b!103009 res!84722) b!103010))

(declare-fun m!150269 () Bool)

(assert (=> d!32032 m!150269))

(declare-fun m!150271 () Bool)

(assert (=> d!32032 m!150271))

(assert (=> b!102695 d!32032))

(declare-fun d!32034 () Bool)

(declare-fun lt!150259 () tuple2!8430)

(assert (=> d!32034 (= lt!150259 (readBit!0 lt!149356))))

(assert (=> d!32034 (= (readBitPure!0 lt!149356) (tuple2!8417 (_2!4470 lt!150259) (_1!4470 lt!150259)))))

(declare-fun bs!7853 () Bool)

(assert (= bs!7853 d!32034))

(declare-fun m!150273 () Bool)

(assert (=> bs!7853 m!150273))

(assert (=> b!102695 d!32034))

(declare-fun d!32036 () Bool)

(assert (=> d!32036 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2199 (buf!2559 (_2!4462 lt!149358)))) ((_ sign_extend 32) (currentByte!5032 (_2!4462 lt!149367))) ((_ sign_extend 32) (currentBit!5027 (_2!4462 lt!149367))) lt!149361) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2199 (buf!2559 (_2!4462 lt!149358)))) ((_ sign_extend 32) (currentByte!5032 (_2!4462 lt!149367))) ((_ sign_extend 32) (currentBit!5027 (_2!4462 lt!149367)))) lt!149361))))

(declare-fun bs!7854 () Bool)

(assert (= bs!7854 d!32036))

(declare-fun m!150275 () Bool)

(assert (=> bs!7854 m!150275))

(assert (=> b!102695 d!32036))

(push 1)

(assert (not b!103000))

(assert (not b!103004))

(assert (not d!31984))

(assert (not b!102942))

(assert (not b!102788))

(assert (not d!32026))

(assert (not b!102932))

(assert (not b!102944))

(assert (not d!31986))

(assert (not b!103006))

(assert (not b!102986))

(assert (not b!103003))

(assert (not b!102987))

(assert (not b!102939))

(assert (not b!103002))

(assert (not d!31942))

(assert (not d!31994))

(assert (not d!31982))

(assert (not d!32024))

(assert (not b!102938))

(assert (not b!102943))

(assert (not d!31924))

(assert (not d!31944))

(assert (not b!102769))

(assert (not d!31918))

(assert (not b!102935))

(assert (not d!31914))

(assert (not d!32022))

(assert (not d!32036))

(assert (not d!32028))

(assert (not b!103005))

(assert (not b!102936))

(assert (not b!102989))

(assert (not d!32032))

(assert (not b!102937))

(assert (not b!102780))

(assert (not bm!1279))

(assert (not b!103001))

(assert (not b!102933))

(assert (not d!31932))

(assert (not d!31930))

(assert (not b!102988))

(assert (not d!31928))

(assert (not b!102790))

(assert (not d!31988))

(assert (not d!31922))

(assert (not b!102782))

(assert (not d!31916))

(assert (not d!32034))

(assert (not d!32030))

(assert (not b!103007))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

