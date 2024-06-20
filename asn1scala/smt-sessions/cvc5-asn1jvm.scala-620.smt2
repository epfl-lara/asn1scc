; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17584 () Bool)

(assert start!17584)

(declare-fun b!84712 () Bool)

(declare-fun e!56539 () Bool)

(declare-datatypes ((array!4020 0))(
  ( (array!4021 (arr!2454 (Array (_ BitVec 32) (_ BitVec 8))) (size!1817 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3196 0))(
  ( (BitStream!3197 (buf!2207 array!4020) (currentByte!4386 (_ BitVec 32)) (currentBit!4381 (_ BitVec 32))) )
))
(declare-fun thiss!1136 () BitStream!3196)

(declare-fun array_inv!1663 (array!4020) Bool)

(assert (=> b!84712 (= e!56539 (array_inv!1663 (buf!2207 thiss!1136)))))

(declare-fun res!69510 () Bool)

(declare-fun e!56538 () Bool)

(assert (=> start!17584 (=> (not res!69510) (not e!56538))))

(declare-fun nBits!333 () (_ BitVec 32))

(assert (=> start!17584 (= res!69510 (and (bvsge nBits!333 #b00000000000000000000000000000000) (bvsle nBits!333 #b00000000000000000000000001000000)))))

(assert (=> start!17584 e!56538))

(assert (=> start!17584 true))

(declare-fun inv!12 (BitStream!3196) Bool)

(assert (=> start!17584 (and (inv!12 thiss!1136) e!56539)))

(declare-fun b!84713 () Bool)

(declare-datatypes ((Unit!5674 0))(
  ( (Unit!5675) )
))
(declare-datatypes ((tuple3!376 0))(
  ( (tuple3!377 (_1!3838 Unit!5674) (_2!3838 BitStream!3196) (_3!212 (_ BitVec 32))) )
))
(declare-fun e!56541 () tuple3!376)

(declare-fun v!176 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstWhileWhile!0 ((_ BitVec 32) BitStream!3196 (_ BitVec 64) BitStream!3196 (_ BitVec 32)) tuple3!376)

(assert (=> b!84713 (= e!56541 (appendBitsLSBFirstWhileWhile!0 nBits!333 thiss!1136 v!176 thiss!1136 #b00000000000000000000000000000000))))

(declare-fun b!84714 () Bool)

(declare-fun res!69509 () Bool)

(assert (=> b!84714 (=> (not res!69509) (not e!56538))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!84714 (= res!69509 (validate_offset_bits!1 ((_ sign_extend 32) (size!1817 (buf!2207 thiss!1136))) ((_ sign_extend 32) (currentByte!4386 thiss!1136)) ((_ sign_extend 32) (currentBit!4381 thiss!1136)) ((_ sign_extend 32) nBits!333)))))

(declare-fun b!84715 () Bool)

(declare-fun e!56537 () Bool)

(assert (=> b!84715 (= e!56538 e!56537)))

(declare-fun res!69508 () Bool)

(assert (=> b!84715 (=> res!69508 e!56537)))

(declare-fun lt!134406 () tuple3!376)

(assert (=> b!84715 (= res!69508 (not (= (size!1817 (buf!2207 (_2!3838 lt!134406))) (size!1817 (buf!2207 thiss!1136)))))))

(assert (=> b!84715 (= lt!134406 e!56541)))

(declare-fun c!5834 () Bool)

(assert (=> b!84715 (= c!5834 (bvslt #b00000000000000000000000000000000 nBits!333))))

(declare-fun b!84716 () Bool)

(declare-fun Unit!5676 () Unit!5674)

(assert (=> b!84716 (= e!56541 (tuple3!377 Unit!5676 thiss!1136 #b00000000000000000000000000000000))))

(declare-fun b!84717 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!84717 (= e!56537 (not (= (bitIndex!0 (size!1817 (buf!2207 (_2!3838 lt!134406))) (currentByte!4386 (_2!3838 lt!134406)) (currentBit!4381 (_2!3838 lt!134406))) (bvadd (bitIndex!0 (size!1817 (buf!2207 thiss!1136)) (currentByte!4386 thiss!1136) (currentBit!4381 thiss!1136)) ((_ sign_extend 32) nBits!333)))))))

(declare-fun b!84718 () Bool)

(declare-fun res!69511 () Bool)

(assert (=> b!84718 (=> (not res!69511) (not e!56538))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!84718 (= res!69511 (invariant!0 (currentBit!4381 thiss!1136) (currentByte!4386 thiss!1136) (size!1817 (buf!2207 thiss!1136))))))

(assert (= (and start!17584 res!69510) b!84714))

(assert (= (and b!84714 res!69509) b!84718))

(assert (= (and b!84718 res!69511) b!84715))

(assert (= (and b!84715 c!5834) b!84713))

(assert (= (and b!84715 (not c!5834)) b!84716))

(assert (= (and b!84715 (not res!69508)) b!84717))

(assert (= start!17584 b!84712))

(declare-fun m!131159 () Bool)

(assert (=> b!84714 m!131159))

(declare-fun m!131161 () Bool)

(assert (=> b!84712 m!131161))

(declare-fun m!131163 () Bool)

(assert (=> start!17584 m!131163))

(declare-fun m!131165 () Bool)

(assert (=> b!84717 m!131165))

(declare-fun m!131167 () Bool)

(assert (=> b!84717 m!131167))

(declare-fun m!131169 () Bool)

(assert (=> b!84718 m!131169))

(declare-fun m!131171 () Bool)

(assert (=> b!84713 m!131171))

(push 1)

(assert (not b!84714))

(assert (not b!84718))

(assert (not b!84717))

(assert (not b!84713))

(assert (not b!84712))

(assert (not start!17584))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!84801 () Bool)

(declare-fun res!69573 () Bool)

(declare-fun e!56590 () Bool)

(assert (=> b!84801 (=> (not res!69573) (not e!56590))))

(declare-fun lt!134455 () tuple3!376)

(assert (=> b!84801 (= res!69573 (validate_offset_bits!1 ((_ sign_extend 32) (size!1817 (buf!2207 (_2!3838 lt!134455)))) ((_ sign_extend 32) (currentByte!4386 (_2!3838 lt!134455))) ((_ sign_extend 32) (currentBit!4381 (_2!3838 lt!134455))) ((_ sign_extend 32) (bvsub nBits!333 (_3!212 lt!134455)))))))

(assert (=> b!84801 (or (= (bvand nBits!333 #b10000000000000000000000000000000) (bvand (_3!212 lt!134455) #b10000000000000000000000000000000)) (= (bvand nBits!333 #b10000000000000000000000000000000) (bvand (bvsub nBits!333 (_3!212 lt!134455)) #b10000000000000000000000000000000)))))

(declare-fun b!84802 () Bool)

(assert (=> b!84802 (= e!56590 (bvsge (_3!212 lt!134455) nBits!333))))

(declare-fun lt!134456 () (_ BitVec 32))

(declare-datatypes ((tuple2!7252 0))(
  ( (tuple2!7253 (_1!3841 Unit!5674) (_2!3841 BitStream!3196)) )
))
(declare-fun lt!134460 () tuple2!7252)

(declare-fun b!84803 () Bool)

(declare-fun e!56587 () tuple3!376)

(assert (=> b!84803 (= e!56587 (appendBitsLSBFirstWhileWhile!0 nBits!333 thiss!1136 v!176 (_2!3841 lt!134460) lt!134456))))

(declare-fun b!84804 () Bool)

(declare-fun e!56586 () Bool)

(assert (=> b!84804 (= e!56586 (bvslt #b00000000000000000000000000000000 nBits!333))))

(declare-fun b!84805 () Bool)

(declare-fun res!69578 () Bool)

(assert (=> b!84805 (=> (not res!69578) (not e!56590))))

(assert (=> b!84805 (= res!69578 (and (bvsle (_3!212 lt!134455) nBits!333) (= (size!1817 (buf!2207 (_2!3838 lt!134455))) (size!1817 (buf!2207 thiss!1136)))))))

(declare-fun b!84806 () Bool)

(declare-fun e!56588 () Bool)

(declare-datatypes ((tuple2!7254 0))(
  ( (tuple2!7255 (_1!3842 BitStream!3196) (_2!3842 Bool)) )
))
(declare-fun lt!134454 () tuple2!7254)

(declare-fun lt!134459 () tuple2!7252)

(assert (=> b!84806 (= e!56588 (= (bitIndex!0 (size!1817 (buf!2207 (_1!3842 lt!134454))) (currentByte!4386 (_1!3842 lt!134454)) (currentBit!4381 (_1!3842 lt!134454))) (bitIndex!0 (size!1817 (buf!2207 (_2!3841 lt!134459))) (currentByte!4386 (_2!3841 lt!134459)) (currentBit!4381 (_2!3841 lt!134459)))))))

(declare-fun b!84807 () Bool)

(declare-fun res!69584 () Bool)

(assert (=> b!84807 (=> (not res!69584) (not e!56586))))

(assert (=> b!84807 (= res!69584 (and (bvsle #b00000000000000000000000000000000 nBits!333) (= (size!1817 (buf!2207 thiss!1136)) (size!1817 (buf!2207 thiss!1136)))))))

(declare-fun b!84808 () Bool)

(declare-fun res!69575 () Bool)

(declare-fun e!56589 () Bool)

(assert (=> b!84808 (=> (not res!69575) (not e!56589))))

(assert (=> b!84808 (= res!69575 (= (bitIndex!0 (size!1817 (buf!2207 (_2!3841 lt!134459))) (currentByte!4386 (_2!3841 lt!134459)) (currentBit!4381 (_2!3841 lt!134459))) (bvadd (bitIndex!0 (size!1817 (buf!2207 thiss!1136)) (currentByte!4386 thiss!1136) (currentBit!4381 thiss!1136)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!84809 () Bool)

(declare-fun Unit!5683 () Unit!5674)

(assert (=> b!84809 (= e!56587 (tuple3!377 Unit!5683 (_2!3841 lt!134460) lt!134456))))

(declare-fun d!27212 () Bool)

(assert (=> d!27212 e!56590))

(declare-fun res!69580 () Bool)

(assert (=> d!27212 (=> (not res!69580) (not e!56590))))

(assert (=> d!27212 (= res!69580 (bvsge (_3!212 lt!134455) #b00000000000000000000000000000000))))

(assert (=> d!27212 (= lt!134455 e!56587)))

(declare-fun c!5843 () Bool)

(assert (=> d!27212 (= c!5843 (bvslt lt!134456 nBits!333))))

(assert (=> d!27212 (= lt!134456 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))

(assert (=> d!27212 (= lt!134460 lt!134459)))

(assert (=> d!27212 e!56589))

(declare-fun res!69576 () Bool)

(assert (=> d!27212 (=> (not res!69576) (not e!56589))))

(assert (=> d!27212 (= res!69576 (= (size!1817 (buf!2207 thiss!1136)) (size!1817 (buf!2207 (_2!3841 lt!134459)))))))

(declare-fun lt!134453 () Bool)

(declare-fun appendBit!0 (BitStream!3196 Bool) tuple2!7252)

(assert (=> d!27212 (= lt!134459 (appendBit!0 thiss!1136 lt!134453))))

(assert (=> d!27212 (= lt!134453 (not (= (bvand v!176 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) #b00000000000000000000000000000000))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!27212 e!56586))

(declare-fun res!69579 () Bool)

(assert (=> d!27212 (=> (not res!69579) (not e!56586))))

(assert (=> d!27212 (= res!69579 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000))))

(assert (=> d!27212 (= (appendBitsLSBFirstWhileWhile!0 nBits!333 thiss!1136 v!176 thiss!1136 #b00000000000000000000000000000000) lt!134455)))

(declare-fun b!84810 () Bool)

(declare-fun res!69582 () Bool)

(assert (=> b!84810 (=> (not res!69582) (not e!56586))))

(assert (=> b!84810 (= res!69582 (= (bitIndex!0 (size!1817 (buf!2207 thiss!1136)) (currentByte!4386 thiss!1136) (currentBit!4381 thiss!1136)) (bvadd (bitIndex!0 (size!1817 (buf!2207 thiss!1136)) (currentByte!4386 thiss!1136) (currentBit!4381 thiss!1136)) ((_ sign_extend 32) #b00000000000000000000000000000000))))))

(declare-fun b!84811 () Bool)

(declare-fun res!69583 () Bool)

(assert (=> b!84811 (=> (not res!69583) (not e!56589))))

(declare-fun isPrefixOf!0 (BitStream!3196 BitStream!3196) Bool)

(assert (=> b!84811 (= res!69583 (isPrefixOf!0 thiss!1136 (_2!3841 lt!134459)))))

(declare-fun b!84812 () Bool)

(declare-fun res!69581 () Bool)

(assert (=> b!84812 (=> (not res!69581) (not e!56590))))

(assert (=> b!84812 (= res!69581 (invariant!0 (currentBit!4381 (_2!3838 lt!134455)) (currentByte!4386 (_2!3838 lt!134455)) (size!1817 (buf!2207 (_2!3838 lt!134455)))))))

(declare-fun b!84813 () Bool)

(declare-fun res!69572 () Bool)

(assert (=> b!84813 (=> (not res!69572) (not e!56586))))

(assert (=> b!84813 (= res!69572 (invariant!0 (currentBit!4381 thiss!1136) (currentByte!4386 thiss!1136) (size!1817 (buf!2207 thiss!1136))))))

(declare-fun b!84814 () Bool)

(declare-fun res!69574 () Bool)

(assert (=> b!84814 (=> (not res!69574) (not e!56586))))

(assert (=> b!84814 (= res!69574 (validate_offset_bits!1 ((_ sign_extend 32) (size!1817 (buf!2207 thiss!1136))) ((_ sign_extend 32) (currentByte!4386 thiss!1136)) ((_ sign_extend 32) (currentBit!4381 thiss!1136)) ((_ sign_extend 32) (bvsub nBits!333 #b00000000000000000000000000000000))))))

(declare-fun b!84815 () Bool)

(declare-fun res!69577 () Bool)

(assert (=> b!84815 (=> (not res!69577) (not e!56590))))

(declare-fun lt!134458 () (_ BitVec 64))

(declare-fun lt!134457 () (_ BitVec 64))

(assert (=> b!84815 (= res!69577 (= (bitIndex!0 (size!1817 (buf!2207 (_2!3838 lt!134455))) (currentByte!4386 (_2!3838 lt!134455)) (currentBit!4381 (_2!3838 lt!134455))) (bvadd lt!134457 lt!134458)))))

(assert (=> b!84815 (or (not (= (bvand lt!134457 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!134458 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!134457 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!134457 lt!134458) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!84815 (= lt!134458 ((_ sign_extend 32) (_3!212 lt!134455)))))

(assert (=> b!84815 (= lt!134457 (bitIndex!0 (size!1817 (buf!2207 thiss!1136)) (currentByte!4386 thiss!1136) (currentBit!4381 thiss!1136)))))

(declare-fun b!84816 () Bool)

(assert (=> b!84816 (= e!56589 e!56588)))

(declare-fun res!69585 () Bool)

(assert (=> b!84816 (=> (not res!69585) (not e!56588))))

(assert (=> b!84816 (= res!69585 (and (= (_2!3842 lt!134454) lt!134453) (= (_1!3842 lt!134454) (_2!3841 lt!134459))))))

(declare-fun readBitPure!0 (BitStream!3196) tuple2!7254)

(declare-fun readerFrom!0 (BitStream!3196 (_ BitVec 32) (_ BitVec 32)) BitStream!3196)

(assert (=> b!84816 (= lt!134454 (readBitPure!0 (readerFrom!0 (_2!3841 lt!134459) (currentBit!4381 thiss!1136) (currentByte!4386 thiss!1136))))))

(assert (= (and d!27212 res!69579) b!84813))

(assert (= (and b!84813 res!69572) b!84807))

(assert (= (and b!84807 res!69584) b!84810))

(assert (= (and b!84810 res!69582) b!84814))

(assert (= (and b!84814 res!69574) b!84804))

(assert (= (and d!27212 res!69576) b!84808))

(assert (= (and b!84808 res!69575) b!84811))

(assert (= (and b!84811 res!69583) b!84816))

(assert (= (and b!84816 res!69585) b!84806))

(assert (= (and d!27212 c!5843) b!84803))

(assert (= (and d!27212 (not c!5843)) b!84809))

(assert (= (and d!27212 res!69580) b!84812))

(assert (= (and b!84812 res!69581) b!84805))

(assert (= (and b!84805 res!69578) b!84815))

(assert (= (and b!84815 res!69577) b!84801))

(assert (= (and b!84801 res!69573) b!84802))

(declare-fun m!131207 () Bool)

(assert (=> b!84803 m!131207))

(declare-fun m!131209 () Bool)

(assert (=> b!84806 m!131209))

(declare-fun m!131211 () Bool)

(assert (=> b!84806 m!131211))

(declare-fun m!131213 () Bool)

(assert (=> b!84812 m!131213))

(assert (=> b!84808 m!131211))

(assert (=> b!84808 m!131167))

(declare-fun m!131215 () Bool)

(assert (=> b!84801 m!131215))

(declare-fun m!131217 () Bool)

(assert (=> b!84814 m!131217))

(assert (=> b!84813 m!131169))

(declare-fun m!131219 () Bool)

(assert (=> b!84811 m!131219))

(declare-fun m!131221 () Bool)

(assert (=> d!27212 m!131221))

(declare-fun m!131223 () Bool)

(assert (=> b!84816 m!131223))

(assert (=> b!84816 m!131223))

(declare-fun m!131225 () Bool)

(assert (=> b!84816 m!131225))

(assert (=> b!84810 m!131167))

(assert (=> b!84810 m!131167))

(declare-fun m!131227 () Bool)

(assert (=> b!84815 m!131227))

(assert (=> b!84815 m!131167))

(assert (=> b!84713 d!27212))

(declare-fun d!27222 () Bool)

(assert (=> d!27222 (= (invariant!0 (currentBit!4381 thiss!1136) (currentByte!4386 thiss!1136) (size!1817 (buf!2207 thiss!1136))) (and (bvsge (currentBit!4381 thiss!1136) #b00000000000000000000000000000000) (bvslt (currentBit!4381 thiss!1136) #b00000000000000000000000000001000) (bvsge (currentByte!4386 thiss!1136) #b00000000000000000000000000000000) (or (bvslt (currentByte!4386 thiss!1136) (size!1817 (buf!2207 thiss!1136))) (and (= (currentBit!4381 thiss!1136) #b00000000000000000000000000000000) (= (currentByte!4386 thiss!1136) (size!1817 (buf!2207 thiss!1136)))))))))

(assert (=> b!84718 d!27222))

(declare-fun d!27224 () Bool)

(assert (=> d!27224 (= (array_inv!1663 (buf!2207 thiss!1136)) (bvsge (size!1817 (buf!2207 thiss!1136)) #b00000000000000000000000000000000))))

(assert (=> b!84712 d!27224))

(declare-fun d!27226 () Bool)

(assert (=> d!27226 (= (inv!12 thiss!1136) (invariant!0 (currentBit!4381 thiss!1136) (currentByte!4386 thiss!1136) (size!1817 (buf!2207 thiss!1136))))))

(declare-fun bs!6739 () Bool)

(assert (= bs!6739 d!27226))

(assert (=> bs!6739 m!131169))

(assert (=> start!17584 d!27226))

(declare-fun d!27228 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!27228 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1817 (buf!2207 thiss!1136))) ((_ sign_extend 32) (currentByte!4386 thiss!1136)) ((_ sign_extend 32) (currentBit!4381 thiss!1136)) ((_ sign_extend 32) nBits!333)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1817 (buf!2207 thiss!1136))) ((_ sign_extend 32) (currentByte!4386 thiss!1136)) ((_ sign_extend 32) (currentBit!4381 thiss!1136))) ((_ sign_extend 32) nBits!333)))))

(declare-fun bs!6740 () Bool)

(assert (= bs!6740 d!27228))

(declare-fun m!131229 () Bool)

(assert (=> bs!6740 m!131229))

(assert (=> b!84714 d!27228))

(declare-fun d!27230 () Bool)

(declare-fun e!56608 () Bool)

(assert (=> d!27230 e!56608))

(declare-fun res!69633 () Bool)

(assert (=> d!27230 (=> (not res!69633) (not e!56608))))

(declare-fun lt!134499 () (_ BitVec 64))

(declare-fun lt!134500 () (_ BitVec 64))

(declare-fun lt!134502 () (_ BitVec 64))

(assert (=> d!27230 (= res!69633 (= lt!134502 (bvsub lt!134500 lt!134499)))))

(assert (=> d!27230 (or (= (bvand lt!134500 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!134499 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!134500 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!134500 lt!134499) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!27230 (= lt!134499 (remainingBits!0 ((_ sign_extend 32) (size!1817 (buf!2207 (_2!3838 lt!134406)))) ((_ sign_extend 32) (currentByte!4386 (_2!3838 lt!134406))) ((_ sign_extend 32) (currentBit!4381 (_2!3838 lt!134406)))))))

(declare-fun lt!134498 () (_ BitVec 64))

(declare-fun lt!134497 () (_ BitVec 64))

(assert (=> d!27230 (= lt!134500 (bvmul lt!134498 lt!134497))))

(assert (=> d!27230 (or (= lt!134498 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!134497 (bvsdiv (bvmul lt!134498 lt!134497) lt!134498)))))

(assert (=> d!27230 (= lt!134497 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27230 (= lt!134498 ((_ sign_extend 32) (size!1817 (buf!2207 (_2!3838 lt!134406)))))))

(assert (=> d!27230 (= lt!134502 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4386 (_2!3838 lt!134406))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4381 (_2!3838 lt!134406)))))))

(assert (=> d!27230 (invariant!0 (currentBit!4381 (_2!3838 lt!134406)) (currentByte!4386 (_2!3838 lt!134406)) (size!1817 (buf!2207 (_2!3838 lt!134406))))))

(assert (=> d!27230 (= (bitIndex!0 (size!1817 (buf!2207 (_2!3838 lt!134406))) (currentByte!4386 (_2!3838 lt!134406)) (currentBit!4381 (_2!3838 lt!134406))) lt!134502)))

(declare-fun b!84869 () Bool)

(declare-fun res!69632 () Bool)

(assert (=> b!84869 (=> (not res!69632) (not e!56608))))

(assert (=> b!84869 (= res!69632 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!134502))))

(declare-fun b!84870 () Bool)

(declare-fun lt!134501 () (_ BitVec 64))

(assert (=> b!84870 (= e!56608 (bvsle lt!134502 (bvmul lt!134501 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!84870 (or (= lt!134501 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!134501 #b0000000000000000000000000000000000000000000000000000000000001000) lt!134501)))))

(assert (=> b!84870 (= lt!134501 ((_ sign_extend 32) (size!1817 (buf!2207 (_2!3838 lt!134406)))))))

(assert (= (and d!27230 res!69633) b!84869))

(assert (= (and b!84869 res!69632) b!84870))

(declare-fun m!131253 () Bool)

(assert (=> d!27230 m!131253))

(declare-fun m!131255 () Bool)

(assert (=> d!27230 m!131255))

(assert (=> b!84717 d!27230))

(declare-fun d!27234 () Bool)

(declare-fun e!56609 () Bool)

(assert (=> d!27234 e!56609))

(declare-fun res!69635 () Bool)

(assert (=> d!27234 (=> (not res!69635) (not e!56609))))

(declare-fun lt!134506 () (_ BitVec 64))

(declare-fun lt!134508 () (_ BitVec 64))

(declare-fun lt!134505 () (_ BitVec 64))

(assert (=> d!27234 (= res!69635 (= lt!134508 (bvsub lt!134506 lt!134505)))))

(assert (=> d!27234 (or (= (bvand lt!134506 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!134505 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!134506 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!134506 lt!134505) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!27234 (= lt!134505 (remainingBits!0 ((_ sign_extend 32) (size!1817 (buf!2207 thiss!1136))) ((_ sign_extend 32) (currentByte!4386 thiss!1136)) ((_ sign_extend 32) (currentBit!4381 thiss!1136))))))

(declare-fun lt!134504 () (_ BitVec 64))

(declare-fun lt!134503 () (_ BitVec 64))

(assert (=> d!27234 (= lt!134506 (bvmul lt!134504 lt!134503))))

(assert (=> d!27234 (or (= lt!134504 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!134503 (bvsdiv (bvmul lt!134504 lt!134503) lt!134504)))))

(assert (=> d!27234 (= lt!134503 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27234 (= lt!134504 ((_ sign_extend 32) (size!1817 (buf!2207 thiss!1136))))))

(assert (=> d!27234 (= lt!134508 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4386 thiss!1136)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4381 thiss!1136))))))

(assert (=> d!27234 (invariant!0 (currentBit!4381 thiss!1136) (currentByte!4386 thiss!1136) (size!1817 (buf!2207 thiss!1136)))))

(assert (=> d!27234 (= (bitIndex!0 (size!1817 (buf!2207 thiss!1136)) (currentByte!4386 thiss!1136) (currentBit!4381 thiss!1136)) lt!134508)))

(declare-fun b!84871 () Bool)

(declare-fun res!69634 () Bool)

(assert (=> b!84871 (=> (not res!69634) (not e!56609))))

(assert (=> b!84871 (= res!69634 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!134508))))

(declare-fun b!84872 () Bool)

(declare-fun lt!134507 () (_ BitVec 64))

(assert (=> b!84872 (= e!56609 (bvsle lt!134508 (bvmul lt!134507 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!84872 (or (= lt!134507 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!134507 #b0000000000000000000000000000000000000000000000000000000000001000) lt!134507)))))

(assert (=> b!84872 (= lt!134507 ((_ sign_extend 32) (size!1817 (buf!2207 thiss!1136))))))

(assert (= (and d!27234 res!69635) b!84871))

(assert (= (and b!84871 res!69634) b!84872))

(assert (=> d!27234 m!131229))

(assert (=> d!27234 m!131169))

(assert (=> b!84717 d!27234))

(push 1)

(assert (not b!84811))

(assert (not d!27234))

(assert (not d!27230))

(assert (not b!84803))

(assert (not b!84815))

(assert (not b!84812))

(assert (not b!84814))

(assert (not d!27212))

(assert (not b!84808))

(assert (not b!84816))

(assert (not b!84810))

(assert (not d!27226))

(assert (not b!84801))

(assert (not b!84806))

(assert (not b!84813))

(assert (not d!27228))

(check-sat)

(pop 1)

(push 1)

(check-sat)

