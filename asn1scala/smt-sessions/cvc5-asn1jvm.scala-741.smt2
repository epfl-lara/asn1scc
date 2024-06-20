; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20778 () Bool)

(assert start!20778)

(declare-fun b!105140 () Bool)

(declare-fun e!68866 () Bool)

(declare-datatypes ((array!4875 0))(
  ( (array!4876 (arr!2817 (Array (_ BitVec 32) (_ BitVec 8))) (size!2224 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3922 0))(
  ( (BitStream!3923 (buf!2595 array!4875) (currentByte!5088 (_ BitVec 32)) (currentBit!5083 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!8650 0))(
  ( (tuple2!8651 (_1!4582 BitStream!3922) (_2!4582 Bool)) )
))
(declare-fun lt!154720 () tuple2!8650)

(declare-fun lt!154701 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!105140 (= e!68866 (= (bitIndex!0 (size!2224 (buf!2595 (_1!4582 lt!154720))) (currentByte!5088 (_1!4582 lt!154720)) (currentBit!5083 (_1!4582 lt!154720))) lt!154701))))

(declare-fun res!86574 () Bool)

(declare-fun e!68868 () Bool)

(assert (=> start!20778 (=> (not res!86574) (not e!68868))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> start!20778 (= res!86574 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!20778 e!68868))

(assert (=> start!20778 true))

(declare-fun thiss!1305 () BitStream!3922)

(declare-fun e!68873 () Bool)

(declare-fun inv!12 (BitStream!3922) Bool)

(assert (=> start!20778 (and (inv!12 thiss!1305) e!68873)))

(declare-fun e!68874 () Bool)

(declare-datatypes ((Unit!6446 0))(
  ( (Unit!6447) )
))
(declare-datatypes ((tuple2!8652 0))(
  ( (tuple2!8653 (_1!4583 Unit!6446) (_2!4583 BitStream!3922)) )
))
(declare-fun lt!154712 () tuple2!8652)

(declare-fun b!105141 () Bool)

(declare-datatypes ((tuple2!8654 0))(
  ( (tuple2!8655 (_1!4584 BitStream!3922) (_2!4584 BitStream!3922)) )
))
(declare-fun lt!154711 () tuple2!8654)

(declare-fun moveBitIndexPrecond!0 (BitStream!3922 (_ BitVec 64)) Bool)

(assert (=> b!105141 (= e!68874 (moveBitIndexPrecond!0 (_2!4584 lt!154711) (bvsub (bitIndex!0 (size!2224 (buf!2595 thiss!1305)) (currentByte!5088 thiss!1305) (currentBit!5083 thiss!1305)) (bitIndex!0 (size!2224 (buf!2595 (_2!4583 lt!154712))) (currentByte!5088 (_2!4583 lt!154712)) (currentBit!5083 (_2!4583 lt!154712))))))))

(declare-datatypes ((tuple2!8656 0))(
  ( (tuple2!8657 (_1!4585 BitStream!3922) (_2!4585 (_ BitVec 64))) )
))
(declare-fun lt!154714 () tuple2!8656)

(declare-fun lt!154706 () tuple2!8656)

(assert (=> b!105141 (and (= (_2!4585 lt!154714) (_2!4585 lt!154706)) (= (_1!4585 lt!154714) (_1!4585 lt!154706)))))

(declare-fun lt!154700 () Unit!6446)

(declare-fun lt!154707 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!3922 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6446)

(assert (=> b!105141 (= lt!154700 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4584 lt!154711) nBits!396 i!615 lt!154707))))

(declare-fun lt!154709 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3922 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8656)

(declare-fun withMovedBitIndex!0 (BitStream!3922 (_ BitVec 64)) BitStream!3922)

(assert (=> b!105141 (= lt!154706 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4584 lt!154711) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!154709))))

(declare-fun b!105142 () Bool)

(declare-fun e!68872 () Bool)

(declare-fun lt!154719 () tuple2!8650)

(declare-fun lt!154721 () tuple2!8650)

(assert (=> b!105142 (= e!68872 (= (_2!4582 lt!154719) (_2!4582 lt!154721)))))

(declare-fun b!105143 () Bool)

(declare-fun res!86576 () Bool)

(declare-fun e!68871 () Bool)

(assert (=> b!105143 (=> (not res!86576) (not e!68871))))

(declare-fun lt!154722 () tuple2!8652)

(declare-fun isPrefixOf!0 (BitStream!3922 BitStream!3922) Bool)

(assert (=> b!105143 (= res!86576 (isPrefixOf!0 thiss!1305 (_2!4583 lt!154722)))))

(declare-fun b!105144 () Bool)

(declare-fun array_inv!2026 (array!4875) Bool)

(assert (=> b!105144 (= e!68873 (array_inv!2026 (buf!2595 thiss!1305)))))

(declare-fun b!105145 () Bool)

(declare-fun res!86580 () Bool)

(declare-fun e!68867 () Bool)

(assert (=> b!105145 (=> (not res!86580) (not e!68867))))

(assert (=> b!105145 (= res!86580 (bvslt i!615 nBits!396))))

(declare-fun b!105146 () Bool)

(declare-fun res!86572 () Bool)

(assert (=> b!105146 (=> (not res!86572) (not e!68867))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!105146 (= res!86572 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!105147 () Bool)

(declare-fun e!68875 () Bool)

(assert (=> b!105147 (= e!68875 e!68871)))

(declare-fun res!86579 () Bool)

(assert (=> b!105147 (=> (not res!86579) (not e!68871))))

(declare-fun lt!154705 () (_ BitVec 64))

(assert (=> b!105147 (= res!86579 (= lt!154701 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!154705)))))

(assert (=> b!105147 (= lt!154701 (bitIndex!0 (size!2224 (buf!2595 (_2!4583 lt!154722))) (currentByte!5088 (_2!4583 lt!154722)) (currentBit!5083 (_2!4583 lt!154722))))))

(assert (=> b!105147 (= lt!154705 (bitIndex!0 (size!2224 (buf!2595 thiss!1305)) (currentByte!5088 thiss!1305) (currentBit!5083 thiss!1305)))))

(declare-fun b!105148 () Bool)

(declare-fun e!68869 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!105148 (= e!68869 (invariant!0 (currentBit!5083 thiss!1305) (currentByte!5088 thiss!1305) (size!2224 (buf!2595 (_2!4583 lt!154712)))))))

(declare-fun b!105149 () Bool)

(assert (=> b!105149 (= e!68868 e!68867)))

(declare-fun res!86575 () Bool)

(assert (=> b!105149 (=> (not res!86575) (not e!68867))))

(declare-fun lt!154715 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!105149 (= res!86575 (validate_offset_bits!1 ((_ sign_extend 32) (size!2224 (buf!2595 thiss!1305))) ((_ sign_extend 32) (currentByte!5088 thiss!1305)) ((_ sign_extend 32) (currentBit!5083 thiss!1305)) lt!154715))))

(assert (=> b!105149 (= lt!154715 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!105150 () Bool)

(declare-fun res!86582 () Bool)

(assert (=> b!105150 (=> (not res!86582) (not e!68869))))

(assert (=> b!105150 (= res!86582 (invariant!0 (currentBit!5083 thiss!1305) (currentByte!5088 thiss!1305) (size!2224 (buf!2595 (_2!4583 lt!154722)))))))

(declare-fun b!105151 () Bool)

(assert (=> b!105151 (= e!68871 e!68866)))

(declare-fun res!86573 () Bool)

(assert (=> b!105151 (=> (not res!86573) (not e!68866))))

(declare-fun lt!154710 () Bool)

(assert (=> b!105151 (= res!86573 (and (= (_2!4582 lt!154720) lt!154710) (= (_1!4582 lt!154720) (_2!4583 lt!154722))))))

(declare-fun readBitPure!0 (BitStream!3922) tuple2!8650)

(declare-fun readerFrom!0 (BitStream!3922 (_ BitVec 32) (_ BitVec 32)) BitStream!3922)

(assert (=> b!105151 (= lt!154720 (readBitPure!0 (readerFrom!0 (_2!4583 lt!154722) (currentBit!5083 thiss!1305) (currentByte!5088 thiss!1305))))))

(declare-fun b!105152 () Bool)

(assert (=> b!105152 (= e!68867 (not e!68874))))

(declare-fun res!86581 () Bool)

(assert (=> b!105152 (=> res!86581 e!68874)))

(declare-fun lt!154708 () tuple2!8654)

(assert (=> b!105152 (= res!86581 (not (= (_1!4585 (readNLeastSignificantBitsLoopPure!0 (_1!4584 lt!154708) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!154709)) (_2!4584 lt!154708))))))

(declare-fun lt!154716 () (_ BitVec 64))

(assert (=> b!105152 (validate_offset_bits!1 ((_ sign_extend 32) (size!2224 (buf!2595 (_2!4583 lt!154712)))) ((_ sign_extend 32) (currentByte!5088 (_2!4583 lt!154722))) ((_ sign_extend 32) (currentBit!5083 (_2!4583 lt!154722))) lt!154716)))

(declare-fun lt!154702 () Unit!6446)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3922 array!4875 (_ BitVec 64)) Unit!6446)

(assert (=> b!105152 (= lt!154702 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4583 lt!154722) (buf!2595 (_2!4583 lt!154712)) lt!154716))))

(assert (=> b!105152 (= lt!154716 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!154703 () tuple2!8650)

(declare-fun lt!154717 () (_ BitVec 64))

(assert (=> b!105152 (= lt!154709 (bvor lt!154707 (ite (_2!4582 lt!154703) lt!154717 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!105152 (= lt!154714 (readNLeastSignificantBitsLoopPure!0 (_1!4584 lt!154711) nBits!396 i!615 lt!154707))))

(assert (=> b!105152 (validate_offset_bits!1 ((_ sign_extend 32) (size!2224 (buf!2595 (_2!4583 lt!154712)))) ((_ sign_extend 32) (currentByte!5088 thiss!1305)) ((_ sign_extend 32) (currentBit!5083 thiss!1305)) lt!154715)))

(declare-fun lt!154699 () Unit!6446)

(assert (=> b!105152 (= lt!154699 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2595 (_2!4583 lt!154712)) lt!154715))))

(assert (=> b!105152 (= lt!154707 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(assert (=> b!105152 (= (_2!4582 lt!154703) lt!154710)))

(assert (=> b!105152 (= lt!154703 (readBitPure!0 (_1!4584 lt!154711)))))

(declare-fun reader!0 (BitStream!3922 BitStream!3922) tuple2!8654)

(assert (=> b!105152 (= lt!154708 (reader!0 (_2!4583 lt!154722) (_2!4583 lt!154712)))))

(assert (=> b!105152 (= lt!154711 (reader!0 thiss!1305 (_2!4583 lt!154712)))))

(assert (=> b!105152 e!68872))

(declare-fun res!86578 () Bool)

(assert (=> b!105152 (=> (not res!86578) (not e!68872))))

(assert (=> b!105152 (= res!86578 (= (bitIndex!0 (size!2224 (buf!2595 (_1!4582 lt!154719))) (currentByte!5088 (_1!4582 lt!154719)) (currentBit!5083 (_1!4582 lt!154719))) (bitIndex!0 (size!2224 (buf!2595 (_1!4582 lt!154721))) (currentByte!5088 (_1!4582 lt!154721)) (currentBit!5083 (_1!4582 lt!154721)))))))

(declare-fun lt!154713 () Unit!6446)

(declare-fun lt!154718 () BitStream!3922)

(declare-fun readBitPrefixLemma!0 (BitStream!3922 BitStream!3922) Unit!6446)

(assert (=> b!105152 (= lt!154713 (readBitPrefixLemma!0 lt!154718 (_2!4583 lt!154712)))))

(assert (=> b!105152 (= lt!154721 (readBitPure!0 (BitStream!3923 (buf!2595 (_2!4583 lt!154712)) (currentByte!5088 thiss!1305) (currentBit!5083 thiss!1305))))))

(assert (=> b!105152 (= lt!154719 (readBitPure!0 lt!154718))))

(assert (=> b!105152 (= lt!154718 (BitStream!3923 (buf!2595 (_2!4583 lt!154722)) (currentByte!5088 thiss!1305) (currentBit!5083 thiss!1305)))))

(assert (=> b!105152 e!68869))

(declare-fun res!86577 () Bool)

(assert (=> b!105152 (=> (not res!86577) (not e!68869))))

(assert (=> b!105152 (= res!86577 (isPrefixOf!0 thiss!1305 (_2!4583 lt!154712)))))

(declare-fun lt!154704 () Unit!6446)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3922 BitStream!3922 BitStream!3922) Unit!6446)

(assert (=> b!105152 (= lt!154704 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4583 lt!154722) (_2!4583 lt!154712)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3922 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8652)

(assert (=> b!105152 (= lt!154712 (appendNLeastSignificantBitsLoop!0 (_2!4583 lt!154722) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!105152 e!68875))

(declare-fun res!86583 () Bool)

(assert (=> b!105152 (=> (not res!86583) (not e!68875))))

(assert (=> b!105152 (= res!86583 (= (size!2224 (buf!2595 thiss!1305)) (size!2224 (buf!2595 (_2!4583 lt!154722)))))))

(declare-fun appendBit!0 (BitStream!3922 Bool) tuple2!8652)

(assert (=> b!105152 (= lt!154722 (appendBit!0 thiss!1305 lt!154710))))

(assert (=> b!105152 (= lt!154710 (not (= (bvand v!199 lt!154717) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!105152 (= lt!154717 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(assert (= (and start!20778 res!86574) b!105149))

(assert (= (and b!105149 res!86575) b!105146))

(assert (= (and b!105146 res!86572) b!105145))

(assert (= (and b!105145 res!86580) b!105152))

(assert (= (and b!105152 res!86583) b!105147))

(assert (= (and b!105147 res!86579) b!105143))

(assert (= (and b!105143 res!86576) b!105151))

(assert (= (and b!105151 res!86573) b!105140))

(assert (= (and b!105152 res!86577) b!105150))

(assert (= (and b!105150 res!86582) b!105148))

(assert (= (and b!105152 res!86578) b!105142))

(assert (= (and b!105152 (not res!86581)) b!105141))

(assert (= start!20778 b!105144))

(declare-fun m!154327 () Bool)

(assert (=> b!105152 m!154327))

(declare-fun m!154329 () Bool)

(assert (=> b!105152 m!154329))

(declare-fun m!154331 () Bool)

(assert (=> b!105152 m!154331))

(declare-fun m!154333 () Bool)

(assert (=> b!105152 m!154333))

(declare-fun m!154335 () Bool)

(assert (=> b!105152 m!154335))

(declare-fun m!154337 () Bool)

(assert (=> b!105152 m!154337))

(declare-fun m!154339 () Bool)

(assert (=> b!105152 m!154339))

(declare-fun m!154341 () Bool)

(assert (=> b!105152 m!154341))

(declare-fun m!154343 () Bool)

(assert (=> b!105152 m!154343))

(declare-fun m!154345 () Bool)

(assert (=> b!105152 m!154345))

(declare-fun m!154347 () Bool)

(assert (=> b!105152 m!154347))

(declare-fun m!154349 () Bool)

(assert (=> b!105152 m!154349))

(declare-fun m!154351 () Bool)

(assert (=> b!105152 m!154351))

(declare-fun m!154353 () Bool)

(assert (=> b!105152 m!154353))

(declare-fun m!154355 () Bool)

(assert (=> b!105152 m!154355))

(declare-fun m!154357 () Bool)

(assert (=> b!105152 m!154357))

(declare-fun m!154359 () Bool)

(assert (=> b!105152 m!154359))

(declare-fun m!154361 () Bool)

(assert (=> b!105152 m!154361))

(declare-fun m!154363 () Bool)

(assert (=> b!105152 m!154363))

(declare-fun m!154365 () Bool)

(assert (=> b!105143 m!154365))

(declare-fun m!154367 () Bool)

(assert (=> start!20778 m!154367))

(declare-fun m!154369 () Bool)

(assert (=> b!105144 m!154369))

(declare-fun m!154371 () Bool)

(assert (=> b!105146 m!154371))

(declare-fun m!154373 () Bool)

(assert (=> b!105148 m!154373))

(declare-fun m!154375 () Bool)

(assert (=> b!105149 m!154375))

(declare-fun m!154377 () Bool)

(assert (=> b!105150 m!154377))

(declare-fun m!154379 () Bool)

(assert (=> b!105140 m!154379))

(declare-fun m!154381 () Bool)

(assert (=> b!105147 m!154381))

(declare-fun m!154383 () Bool)

(assert (=> b!105147 m!154383))

(declare-fun m!154385 () Bool)

(assert (=> b!105141 m!154385))

(declare-fun m!154387 () Bool)

(assert (=> b!105141 m!154387))

(assert (=> b!105141 m!154383))

(assert (=> b!105141 m!154385))

(declare-fun m!154389 () Bool)

(assert (=> b!105141 m!154389))

(declare-fun m!154391 () Bool)

(assert (=> b!105141 m!154391))

(declare-fun m!154393 () Bool)

(assert (=> b!105141 m!154393))

(declare-fun m!154395 () Bool)

(assert (=> b!105151 m!154395))

(assert (=> b!105151 m!154395))

(declare-fun m!154397 () Bool)

(assert (=> b!105151 m!154397))

(push 1)

(assert (not b!105149))

(assert (not b!105152))

(assert (not b!105150))

(assert (not b!105148))

(assert (not b!105141))

(assert (not b!105143))

(assert (not b!105147))

(assert (not b!105151))

(assert (not b!105146))

(assert (not b!105140))

(assert (not start!20778))

(assert (not b!105144))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!32914 () Bool)

(assert (=> d!32914 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5083 thiss!1305) (currentByte!5088 thiss!1305) (size!2224 (buf!2595 thiss!1305))))))

(declare-fun bs!8045 () Bool)

(assert (= bs!8045 d!32914))

(declare-fun m!154543 () Bool)

(assert (=> bs!8045 m!154543))

(assert (=> start!20778 d!32914))

(declare-fun d!32916 () Bool)

(assert (=> d!32916 (= (array_inv!2026 (buf!2595 thiss!1305)) (bvsge (size!2224 (buf!2595 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!105144 d!32916))

(declare-fun d!32918 () Bool)

(assert (=> d!32918 (= (invariant!0 (currentBit!5083 thiss!1305) (currentByte!5088 thiss!1305) (size!2224 (buf!2595 (_2!4583 lt!154712)))) (and (bvsge (currentBit!5083 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5083 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5088 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5088 thiss!1305) (size!2224 (buf!2595 (_2!4583 lt!154712)))) (and (= (currentBit!5083 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5088 thiss!1305) (size!2224 (buf!2595 (_2!4583 lt!154712))))))))))

(assert (=> b!105148 d!32918))

(declare-fun d!32920 () Bool)

(declare-fun e!68938 () Bool)

(assert (=> d!32920 e!68938))

(declare-fun res!86661 () Bool)

(assert (=> d!32920 (=> (not res!86661) (not e!68938))))

(declare-fun lt!154882 () (_ BitVec 64))

(declare-fun lt!154879 () (_ BitVec 64))

(declare-fun lt!154881 () (_ BitVec 64))

(assert (=> d!32920 (= res!86661 (= lt!154882 (bvsub lt!154879 lt!154881)))))

(assert (=> d!32920 (or (= (bvand lt!154879 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!154881 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!154879 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!154879 lt!154881) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!32920 (= lt!154881 (remainingBits!0 ((_ sign_extend 32) (size!2224 (buf!2595 (_2!4583 lt!154722)))) ((_ sign_extend 32) (currentByte!5088 (_2!4583 lt!154722))) ((_ sign_extend 32) (currentBit!5083 (_2!4583 lt!154722)))))))

(declare-fun lt!154880 () (_ BitVec 64))

(declare-fun lt!154883 () (_ BitVec 64))

(assert (=> d!32920 (= lt!154879 (bvmul lt!154880 lt!154883))))

(assert (=> d!32920 (or (= lt!154880 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!154883 (bvsdiv (bvmul lt!154880 lt!154883) lt!154880)))))

(assert (=> d!32920 (= lt!154883 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!32920 (= lt!154880 ((_ sign_extend 32) (size!2224 (buf!2595 (_2!4583 lt!154722)))))))

(assert (=> d!32920 (= lt!154882 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5088 (_2!4583 lt!154722))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5083 (_2!4583 lt!154722)))))))

(assert (=> d!32920 (invariant!0 (currentBit!5083 (_2!4583 lt!154722)) (currentByte!5088 (_2!4583 lt!154722)) (size!2224 (buf!2595 (_2!4583 lt!154722))))))

(assert (=> d!32920 (= (bitIndex!0 (size!2224 (buf!2595 (_2!4583 lt!154722))) (currentByte!5088 (_2!4583 lt!154722)) (currentBit!5083 (_2!4583 lt!154722))) lt!154882)))

(declare-fun b!105235 () Bool)

(declare-fun res!86660 () Bool)

(assert (=> b!105235 (=> (not res!86660) (not e!68938))))

(assert (=> b!105235 (= res!86660 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!154882))))

(declare-fun b!105236 () Bool)

(declare-fun lt!154884 () (_ BitVec 64))

(assert (=> b!105236 (= e!68938 (bvsle lt!154882 (bvmul lt!154884 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!105236 (or (= lt!154884 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!154884 #b0000000000000000000000000000000000000000000000000000000000001000) lt!154884)))))

(assert (=> b!105236 (= lt!154884 ((_ sign_extend 32) (size!2224 (buf!2595 (_2!4583 lt!154722)))))))

(assert (= (and d!32920 res!86661) b!105235))

(assert (= (and b!105235 res!86660) b!105236))

(declare-fun m!154545 () Bool)

(assert (=> d!32920 m!154545))

(declare-fun m!154547 () Bool)

(assert (=> d!32920 m!154547))

(assert (=> b!105147 d!32920))

(declare-fun d!32922 () Bool)

(declare-fun e!68939 () Bool)

(assert (=> d!32922 e!68939))

(declare-fun res!86663 () Bool)

(assert (=> d!32922 (=> (not res!86663) (not e!68939))))

(declare-fun lt!154887 () (_ BitVec 64))

(declare-fun lt!154888 () (_ BitVec 64))

(declare-fun lt!154885 () (_ BitVec 64))

(assert (=> d!32922 (= res!86663 (= lt!154888 (bvsub lt!154885 lt!154887)))))

(assert (=> d!32922 (or (= (bvand lt!154885 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!154887 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!154885 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!154885 lt!154887) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32922 (= lt!154887 (remainingBits!0 ((_ sign_extend 32) (size!2224 (buf!2595 thiss!1305))) ((_ sign_extend 32) (currentByte!5088 thiss!1305)) ((_ sign_extend 32) (currentBit!5083 thiss!1305))))))

(declare-fun lt!154886 () (_ BitVec 64))

(declare-fun lt!154889 () (_ BitVec 64))

(assert (=> d!32922 (= lt!154885 (bvmul lt!154886 lt!154889))))

(assert (=> d!32922 (or (= lt!154886 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!154889 (bvsdiv (bvmul lt!154886 lt!154889) lt!154886)))))

(assert (=> d!32922 (= lt!154889 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!32922 (= lt!154886 ((_ sign_extend 32) (size!2224 (buf!2595 thiss!1305))))))

(assert (=> d!32922 (= lt!154888 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5088 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5083 thiss!1305))))))

(assert (=> d!32922 (invariant!0 (currentBit!5083 thiss!1305) (currentByte!5088 thiss!1305) (size!2224 (buf!2595 thiss!1305)))))

(assert (=> d!32922 (= (bitIndex!0 (size!2224 (buf!2595 thiss!1305)) (currentByte!5088 thiss!1305) (currentBit!5083 thiss!1305)) lt!154888)))

(declare-fun b!105237 () Bool)

(declare-fun res!86662 () Bool)

(assert (=> b!105237 (=> (not res!86662) (not e!68939))))

(assert (=> b!105237 (= res!86662 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!154888))))

(declare-fun b!105238 () Bool)

(declare-fun lt!154890 () (_ BitVec 64))

(assert (=> b!105238 (= e!68939 (bvsle lt!154888 (bvmul lt!154890 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!105238 (or (= lt!154890 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!154890 #b0000000000000000000000000000000000000000000000000000000000001000) lt!154890)))))

(assert (=> b!105238 (= lt!154890 ((_ sign_extend 32) (size!2224 (buf!2595 thiss!1305))))))

(assert (= (and d!32922 res!86663) b!105237))

(assert (= (and b!105237 res!86662) b!105238))

(declare-fun m!154549 () Bool)

(assert (=> d!32922 m!154549))

(assert (=> d!32922 m!154543))

(assert (=> b!105147 d!32922))

(declare-fun d!32924 () Bool)

(assert (=> d!32924 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!105146 d!32924))

(declare-fun d!32926 () Bool)

(declare-datatypes ((tuple2!8674 0))(
  ( (tuple2!8675 (_1!4594 Bool) (_2!4594 BitStream!3922)) )
))
(declare-fun lt!154893 () tuple2!8674)

(declare-fun readBit!0 (BitStream!3922) tuple2!8674)

(assert (=> d!32926 (= lt!154893 (readBit!0 (readerFrom!0 (_2!4583 lt!154722) (currentBit!5083 thiss!1305) (currentByte!5088 thiss!1305))))))

(assert (=> d!32926 (= (readBitPure!0 (readerFrom!0 (_2!4583 lt!154722) (currentBit!5083 thiss!1305) (currentByte!5088 thiss!1305))) (tuple2!8651 (_2!4594 lt!154893) (_1!4594 lt!154893)))))

(declare-fun bs!8046 () Bool)

(assert (= bs!8046 d!32926))

(assert (=> bs!8046 m!154395))

(declare-fun m!154551 () Bool)

(assert (=> bs!8046 m!154551))

(assert (=> b!105151 d!32926))

(declare-fun d!32928 () Bool)

(declare-fun e!68942 () Bool)

(assert (=> d!32928 e!68942))

(declare-fun res!86667 () Bool)

(assert (=> d!32928 (=> (not res!86667) (not e!68942))))

(assert (=> d!32928 (= res!86667 (invariant!0 (currentBit!5083 (_2!4583 lt!154722)) (currentByte!5088 (_2!4583 lt!154722)) (size!2224 (buf!2595 (_2!4583 lt!154722)))))))

(assert (=> d!32928 (= (readerFrom!0 (_2!4583 lt!154722) (currentBit!5083 thiss!1305) (currentByte!5088 thiss!1305)) (BitStream!3923 (buf!2595 (_2!4583 lt!154722)) (currentByte!5088 thiss!1305) (currentBit!5083 thiss!1305)))))

(declare-fun b!105241 () Bool)

(assert (=> b!105241 (= e!68942 (invariant!0 (currentBit!5083 thiss!1305) (currentByte!5088 thiss!1305) (size!2224 (buf!2595 (_2!4583 lt!154722)))))))

(assert (= (and d!32928 res!86667) b!105241))

(assert (=> d!32928 m!154547))

(assert (=> b!105241 m!154377))

(assert (=> b!105151 d!32928))

(declare-fun d!32930 () Bool)

(declare-fun e!68943 () Bool)

(assert (=> d!32930 e!68943))

(declare-fun res!86669 () Bool)

(assert (=> d!32930 (=> (not res!86669) (not e!68943))))

(declare-fun lt!154894 () (_ BitVec 64))

(declare-fun lt!154896 () (_ BitVec 64))

(declare-fun lt!154897 () (_ BitVec 64))

(assert (=> d!32930 (= res!86669 (= lt!154897 (bvsub lt!154894 lt!154896)))))

(assert (=> d!32930 (or (= (bvand lt!154894 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!154896 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!154894 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!154894 lt!154896) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32930 (= lt!154896 (remainingBits!0 ((_ sign_extend 32) (size!2224 (buf!2595 (_1!4582 lt!154720)))) ((_ sign_extend 32) (currentByte!5088 (_1!4582 lt!154720))) ((_ sign_extend 32) (currentBit!5083 (_1!4582 lt!154720)))))))

(declare-fun lt!154895 () (_ BitVec 64))

(declare-fun lt!154898 () (_ BitVec 64))

(assert (=> d!32930 (= lt!154894 (bvmul lt!154895 lt!154898))))

(assert (=> d!32930 (or (= lt!154895 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!154898 (bvsdiv (bvmul lt!154895 lt!154898) lt!154895)))))

(assert (=> d!32930 (= lt!154898 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!32930 (= lt!154895 ((_ sign_extend 32) (size!2224 (buf!2595 (_1!4582 lt!154720)))))))

(assert (=> d!32930 (= lt!154897 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5088 (_1!4582 lt!154720))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5083 (_1!4582 lt!154720)))))))

(assert (=> d!32930 (invariant!0 (currentBit!5083 (_1!4582 lt!154720)) (currentByte!5088 (_1!4582 lt!154720)) (size!2224 (buf!2595 (_1!4582 lt!154720))))))

(assert (=> d!32930 (= (bitIndex!0 (size!2224 (buf!2595 (_1!4582 lt!154720))) (currentByte!5088 (_1!4582 lt!154720)) (currentBit!5083 (_1!4582 lt!154720))) lt!154897)))

(declare-fun b!105242 () Bool)

(declare-fun res!86668 () Bool)

(assert (=> b!105242 (=> (not res!86668) (not e!68943))))

(assert (=> b!105242 (= res!86668 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!154897))))

(declare-fun b!105243 () Bool)

(declare-fun lt!154899 () (_ BitVec 64))

(assert (=> b!105243 (= e!68943 (bvsle lt!154897 (bvmul lt!154899 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!105243 (or (= lt!154899 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!154899 #b0000000000000000000000000000000000000000000000000000000000001000) lt!154899)))))

(assert (=> b!105243 (= lt!154899 ((_ sign_extend 32) (size!2224 (buf!2595 (_1!4582 lt!154720)))))))

(assert (= (and d!32930 res!86669) b!105242))

(assert (= (and b!105242 res!86668) b!105243))

(declare-fun m!154553 () Bool)

(assert (=> d!32930 m!154553))

(declare-fun m!154555 () Bool)

(assert (=> d!32930 m!154555))

(assert (=> b!105140 d!32930))

(declare-fun d!32932 () Bool)

(assert (=> d!32932 (= (invariant!0 (currentBit!5083 thiss!1305) (currentByte!5088 thiss!1305) (size!2224 (buf!2595 (_2!4583 lt!154722)))) (and (bvsge (currentBit!5083 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5083 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5088 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5088 thiss!1305) (size!2224 (buf!2595 (_2!4583 lt!154722)))) (and (= (currentBit!5083 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5088 thiss!1305) (size!2224 (buf!2595 (_2!4583 lt!154722))))))))))

(assert (=> b!105150 d!32932))

(declare-fun d!32936 () Bool)

(assert (=> d!32936 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2224 (buf!2595 thiss!1305))) ((_ sign_extend 32) (currentByte!5088 thiss!1305)) ((_ sign_extend 32) (currentBit!5083 thiss!1305)) lt!154715) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2224 (buf!2595 thiss!1305))) ((_ sign_extend 32) (currentByte!5088 thiss!1305)) ((_ sign_extend 32) (currentBit!5083 thiss!1305))) lt!154715))))

(declare-fun bs!8047 () Bool)

(assert (= bs!8047 d!32936))

(assert (=> bs!8047 m!154549))

(assert (=> b!105149 d!32936))

(declare-fun d!32938 () Bool)

(declare-fun res!86676 () Bool)

(declare-fun e!68948 () Bool)

(assert (=> d!32938 (=> (not res!86676) (not e!68948))))

(assert (=> d!32938 (= res!86676 (= (size!2224 (buf!2595 thiss!1305)) (size!2224 (buf!2595 (_2!4583 lt!154722)))))))

(assert (=> d!32938 (= (isPrefixOf!0 thiss!1305 (_2!4583 lt!154722)) e!68948)))

(declare-fun b!105250 () Bool)

(declare-fun res!86677 () Bool)

(assert (=> b!105250 (=> (not res!86677) (not e!68948))))

(assert (=> b!105250 (= res!86677 (bvsle (bitIndex!0 (size!2224 (buf!2595 thiss!1305)) (currentByte!5088 thiss!1305) (currentBit!5083 thiss!1305)) (bitIndex!0 (size!2224 (buf!2595 (_2!4583 lt!154722))) (currentByte!5088 (_2!4583 lt!154722)) (currentBit!5083 (_2!4583 lt!154722)))))))

(declare-fun b!105251 () Bool)

(declare-fun e!68949 () Bool)

(assert (=> b!105251 (= e!68948 e!68949)))

(declare-fun res!86678 () Bool)

(assert (=> b!105251 (=> res!86678 e!68949)))

(assert (=> b!105251 (= res!86678 (= (size!2224 (buf!2595 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!105252 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4875 array!4875 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!105252 (= e!68949 (arrayBitRangesEq!0 (buf!2595 thiss!1305) (buf!2595 (_2!4583 lt!154722)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2224 (buf!2595 thiss!1305)) (currentByte!5088 thiss!1305) (currentBit!5083 thiss!1305))))))

(assert (= (and d!32938 res!86676) b!105250))

(assert (= (and b!105250 res!86677) b!105251))

(assert (= (and b!105251 (not res!86678)) b!105252))

(assert (=> b!105250 m!154383))

(assert (=> b!105250 m!154381))

(assert (=> b!105252 m!154383))

(assert (=> b!105252 m!154383))

(declare-fun m!154559 () Bool)

(assert (=> b!105252 m!154559))

(assert (=> b!105143 d!32938))

(declare-fun d!32948 () Bool)

(assert (=> d!32948 (validate_offset_bits!1 ((_ sign_extend 32) (size!2224 (buf!2595 (_2!4583 lt!154712)))) ((_ sign_extend 32) (currentByte!5088 thiss!1305)) ((_ sign_extend 32) (currentBit!5083 thiss!1305)) lt!154715)))

(declare-fun lt!154905 () Unit!6446)

(declare-fun choose!9 (BitStream!3922 array!4875 (_ BitVec 64) BitStream!3922) Unit!6446)

(assert (=> d!32948 (= lt!154905 (choose!9 thiss!1305 (buf!2595 (_2!4583 lt!154712)) lt!154715 (BitStream!3923 (buf!2595 (_2!4583 lt!154712)) (currentByte!5088 thiss!1305) (currentBit!5083 thiss!1305))))))

(assert (=> d!32948 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2595 (_2!4583 lt!154712)) lt!154715) lt!154905)))

(declare-fun bs!8050 () Bool)

(assert (= bs!8050 d!32948))

(assert (=> bs!8050 m!154361))

(declare-fun m!154563 () Bool)

(assert (=> bs!8050 m!154563))

(assert (=> b!105152 d!32948))

(declare-fun d!32952 () Bool)

(declare-fun e!68954 () Bool)

(assert (=> d!32952 e!68954))

(declare-fun res!86687 () Bool)

(assert (=> d!32952 (=> (not res!86687) (not e!68954))))

(declare-fun lt!154948 () tuple2!8654)

(assert (=> d!32952 (= res!86687 (isPrefixOf!0 (_1!4584 lt!154948) (_2!4584 lt!154948)))))

(declare-fun lt!154960 () BitStream!3922)

(assert (=> d!32952 (= lt!154948 (tuple2!8655 lt!154960 (_2!4583 lt!154712)))))

(declare-fun lt!154964 () Unit!6446)

(declare-fun lt!154947 () Unit!6446)

(assert (=> d!32952 (= lt!154964 lt!154947)))

(assert (=> d!32952 (isPrefixOf!0 lt!154960 (_2!4583 lt!154712))))

(assert (=> d!32952 (= lt!154947 (lemmaIsPrefixTransitive!0 lt!154960 (_2!4583 lt!154712) (_2!4583 lt!154712)))))

(declare-fun lt!154953 () Unit!6446)

(declare-fun lt!154949 () Unit!6446)

(assert (=> d!32952 (= lt!154953 lt!154949)))

(assert (=> d!32952 (isPrefixOf!0 lt!154960 (_2!4583 lt!154712))))

(assert (=> d!32952 (= lt!154949 (lemmaIsPrefixTransitive!0 lt!154960 (_2!4583 lt!154722) (_2!4583 lt!154712)))))

(declare-fun lt!154963 () Unit!6446)

(declare-fun e!68955 () Unit!6446)

(assert (=> d!32952 (= lt!154963 e!68955)))

(declare-fun c!6487 () Bool)

(assert (=> d!32952 (= c!6487 (not (= (size!2224 (buf!2595 (_2!4583 lt!154722))) #b00000000000000000000000000000000)))))

(declare-fun lt!154952 () Unit!6446)

(declare-fun lt!154956 () Unit!6446)

(assert (=> d!32952 (= lt!154952 lt!154956)))

(assert (=> d!32952 (isPrefixOf!0 (_2!4583 lt!154712) (_2!4583 lt!154712))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!3922) Unit!6446)

(assert (=> d!32952 (= lt!154956 (lemmaIsPrefixRefl!0 (_2!4583 lt!154712)))))

(declare-fun lt!154965 () Unit!6446)

(declare-fun lt!154950 () Unit!6446)

(assert (=> d!32952 (= lt!154965 lt!154950)))

(assert (=> d!32952 (= lt!154950 (lemmaIsPrefixRefl!0 (_2!4583 lt!154712)))))

(declare-fun lt!154954 () Unit!6446)

(declare-fun lt!154946 () Unit!6446)

(assert (=> d!32952 (= lt!154954 lt!154946)))

(assert (=> d!32952 (isPrefixOf!0 lt!154960 lt!154960)))

(assert (=> d!32952 (= lt!154946 (lemmaIsPrefixRefl!0 lt!154960))))

(declare-fun lt!154951 () Unit!6446)

(declare-fun lt!154957 () Unit!6446)

(assert (=> d!32952 (= lt!154951 lt!154957)))

(assert (=> d!32952 (isPrefixOf!0 (_2!4583 lt!154722) (_2!4583 lt!154722))))

(assert (=> d!32952 (= lt!154957 (lemmaIsPrefixRefl!0 (_2!4583 lt!154722)))))

(assert (=> d!32952 (= lt!154960 (BitStream!3923 (buf!2595 (_2!4583 lt!154712)) (currentByte!5088 (_2!4583 lt!154722)) (currentBit!5083 (_2!4583 lt!154722))))))

(assert (=> d!32952 (isPrefixOf!0 (_2!4583 lt!154722) (_2!4583 lt!154712))))

(assert (=> d!32952 (= (reader!0 (_2!4583 lt!154722) (_2!4583 lt!154712)) lt!154948)))

(declare-fun b!105263 () Bool)

(declare-fun lt!154962 () (_ BitVec 64))

(declare-fun lt!154955 () (_ BitVec 64))

(assert (=> b!105263 (= e!68954 (= (_1!4584 lt!154948) (withMovedBitIndex!0 (_2!4584 lt!154948) (bvsub lt!154962 lt!154955))))))

(assert (=> b!105263 (or (= (bvand lt!154962 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!154955 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!154962 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!154962 lt!154955) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!105263 (= lt!154955 (bitIndex!0 (size!2224 (buf!2595 (_2!4583 lt!154712))) (currentByte!5088 (_2!4583 lt!154712)) (currentBit!5083 (_2!4583 lt!154712))))))

(assert (=> b!105263 (= lt!154962 (bitIndex!0 (size!2224 (buf!2595 (_2!4583 lt!154722))) (currentByte!5088 (_2!4583 lt!154722)) (currentBit!5083 (_2!4583 lt!154722))))))

(declare-fun b!105264 () Bool)

(declare-fun res!86685 () Bool)

(assert (=> b!105264 (=> (not res!86685) (not e!68954))))

(assert (=> b!105264 (= res!86685 (isPrefixOf!0 (_2!4584 lt!154948) (_2!4583 lt!154712)))))

(declare-fun b!105265 () Bool)

(declare-fun lt!154961 () Unit!6446)

(assert (=> b!105265 (= e!68955 lt!154961)))

(declare-fun lt!154959 () (_ BitVec 64))

(assert (=> b!105265 (= lt!154959 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!154958 () (_ BitVec 64))

(assert (=> b!105265 (= lt!154958 (bitIndex!0 (size!2224 (buf!2595 (_2!4583 lt!154722))) (currentByte!5088 (_2!4583 lt!154722)) (currentBit!5083 (_2!4583 lt!154722))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!4875 array!4875 (_ BitVec 64) (_ BitVec 64)) Unit!6446)

(assert (=> b!105265 (= lt!154961 (arrayBitRangesEqSymmetric!0 (buf!2595 (_2!4583 lt!154722)) (buf!2595 (_2!4583 lt!154712)) lt!154959 lt!154958))))

(assert (=> b!105265 (arrayBitRangesEq!0 (buf!2595 (_2!4583 lt!154712)) (buf!2595 (_2!4583 lt!154722)) lt!154959 lt!154958)))

(declare-fun b!105266 () Bool)

(declare-fun res!86686 () Bool)

(assert (=> b!105266 (=> (not res!86686) (not e!68954))))

(assert (=> b!105266 (= res!86686 (isPrefixOf!0 (_1!4584 lt!154948) (_2!4583 lt!154722)))))

(declare-fun b!105267 () Bool)

(declare-fun Unit!6453 () Unit!6446)

(assert (=> b!105267 (= e!68955 Unit!6453)))

(assert (= (and d!32952 c!6487) b!105265))

(assert (= (and d!32952 (not c!6487)) b!105267))

(assert (= (and d!32952 res!86687) b!105266))

(assert (= (and b!105266 res!86686) b!105264))

(assert (= (and b!105264 res!86685) b!105263))

(declare-fun m!154565 () Bool)

(assert (=> d!32952 m!154565))

(declare-fun m!154567 () Bool)

(assert (=> d!32952 m!154567))

(declare-fun m!154569 () Bool)

(assert (=> d!32952 m!154569))

(declare-fun m!154571 () Bool)

(assert (=> d!32952 m!154571))

(declare-fun m!154573 () Bool)

(assert (=> d!32952 m!154573))

(declare-fun m!154575 () Bool)

(assert (=> d!32952 m!154575))

(declare-fun m!154577 () Bool)

(assert (=> d!32952 m!154577))

(declare-fun m!154579 () Bool)

(assert (=> d!32952 m!154579))

(declare-fun m!154581 () Bool)

(assert (=> d!32952 m!154581))

(declare-fun m!154583 () Bool)

(assert (=> d!32952 m!154583))

(declare-fun m!154585 () Bool)

(assert (=> d!32952 m!154585))

(declare-fun m!154587 () Bool)

(assert (=> b!105266 m!154587))

(declare-fun m!154589 () Bool)

(assert (=> b!105263 m!154589))

(assert (=> b!105263 m!154389))

(assert (=> b!105263 m!154381))

(assert (=> b!105265 m!154381))

(declare-fun m!154591 () Bool)

(assert (=> b!105265 m!154591))

(declare-fun m!154593 () Bool)

(assert (=> b!105265 m!154593))

(declare-fun m!154595 () Bool)

(assert (=> b!105264 m!154595))

(assert (=> b!105152 d!32952))

(declare-fun d!32954 () Bool)

(assert (=> d!32954 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2224 (buf!2595 (_2!4583 lt!154712)))) ((_ sign_extend 32) (currentByte!5088 (_2!4583 lt!154722))) ((_ sign_extend 32) (currentBit!5083 (_2!4583 lt!154722))) lt!154716) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2224 (buf!2595 (_2!4583 lt!154712)))) ((_ sign_extend 32) (currentByte!5088 (_2!4583 lt!154722))) ((_ sign_extend 32) (currentBit!5083 (_2!4583 lt!154722)))) lt!154716))))

(declare-fun bs!8051 () Bool)

(assert (= bs!8051 d!32954))

(declare-fun m!154597 () Bool)

(assert (=> bs!8051 m!154597))

(assert (=> b!105152 d!32954))

(declare-fun d!32956 () Bool)

(declare-fun e!68956 () Bool)

(assert (=> d!32956 e!68956))

(declare-fun res!86690 () Bool)

(assert (=> d!32956 (=> (not res!86690) (not e!68956))))

(declare-fun lt!154968 () tuple2!8654)

(assert (=> d!32956 (= res!86690 (isPrefixOf!0 (_1!4584 lt!154968) (_2!4584 lt!154968)))))

(declare-fun lt!154980 () BitStream!3922)

(assert (=> d!32956 (= lt!154968 (tuple2!8655 lt!154980 (_2!4583 lt!154712)))))

(declare-fun lt!154984 () Unit!6446)

(declare-fun lt!154967 () Unit!6446)

(assert (=> d!32956 (= lt!154984 lt!154967)))

(assert (=> d!32956 (isPrefixOf!0 lt!154980 (_2!4583 lt!154712))))

(assert (=> d!32956 (= lt!154967 (lemmaIsPrefixTransitive!0 lt!154980 (_2!4583 lt!154712) (_2!4583 lt!154712)))))

(declare-fun lt!154973 () Unit!6446)

(declare-fun lt!154969 () Unit!6446)

(assert (=> d!32956 (= lt!154973 lt!154969)))

(assert (=> d!32956 (isPrefixOf!0 lt!154980 (_2!4583 lt!154712))))

(assert (=> d!32956 (= lt!154969 (lemmaIsPrefixTransitive!0 lt!154980 thiss!1305 (_2!4583 lt!154712)))))

(declare-fun lt!154983 () Unit!6446)

(declare-fun e!68957 () Unit!6446)

(assert (=> d!32956 (= lt!154983 e!68957)))

(declare-fun c!6488 () Bool)

(assert (=> d!32956 (= c!6488 (not (= (size!2224 (buf!2595 thiss!1305)) #b00000000000000000000000000000000)))))

(declare-fun lt!154972 () Unit!6446)

(declare-fun lt!154976 () Unit!6446)

(assert (=> d!32956 (= lt!154972 lt!154976)))

(assert (=> d!32956 (isPrefixOf!0 (_2!4583 lt!154712) (_2!4583 lt!154712))))

(assert (=> d!32956 (= lt!154976 (lemmaIsPrefixRefl!0 (_2!4583 lt!154712)))))

(declare-fun lt!154985 () Unit!6446)

(declare-fun lt!154970 () Unit!6446)

(assert (=> d!32956 (= lt!154985 lt!154970)))

(assert (=> d!32956 (= lt!154970 (lemmaIsPrefixRefl!0 (_2!4583 lt!154712)))))

(declare-fun lt!154974 () Unit!6446)

(declare-fun lt!154966 () Unit!6446)

(assert (=> d!32956 (= lt!154974 lt!154966)))

(assert (=> d!32956 (isPrefixOf!0 lt!154980 lt!154980)))

(assert (=> d!32956 (= lt!154966 (lemmaIsPrefixRefl!0 lt!154980))))

(declare-fun lt!154971 () Unit!6446)

(declare-fun lt!154977 () Unit!6446)

(assert (=> d!32956 (= lt!154971 lt!154977)))

(assert (=> d!32956 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!32956 (= lt!154977 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (=> d!32956 (= lt!154980 (BitStream!3923 (buf!2595 (_2!4583 lt!154712)) (currentByte!5088 thiss!1305) (currentBit!5083 thiss!1305)))))

(assert (=> d!32956 (isPrefixOf!0 thiss!1305 (_2!4583 lt!154712))))

(assert (=> d!32956 (= (reader!0 thiss!1305 (_2!4583 lt!154712)) lt!154968)))

(declare-fun b!105268 () Bool)

(declare-fun lt!154975 () (_ BitVec 64))

(declare-fun lt!154982 () (_ BitVec 64))

(assert (=> b!105268 (= e!68956 (= (_1!4584 lt!154968) (withMovedBitIndex!0 (_2!4584 lt!154968) (bvsub lt!154982 lt!154975))))))

(assert (=> b!105268 (or (= (bvand lt!154982 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!154975 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!154982 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!154982 lt!154975) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!105268 (= lt!154975 (bitIndex!0 (size!2224 (buf!2595 (_2!4583 lt!154712))) (currentByte!5088 (_2!4583 lt!154712)) (currentBit!5083 (_2!4583 lt!154712))))))

(assert (=> b!105268 (= lt!154982 (bitIndex!0 (size!2224 (buf!2595 thiss!1305)) (currentByte!5088 thiss!1305) (currentBit!5083 thiss!1305)))))

(declare-fun b!105269 () Bool)

(declare-fun res!86688 () Bool)

(assert (=> b!105269 (=> (not res!86688) (not e!68956))))

(assert (=> b!105269 (= res!86688 (isPrefixOf!0 (_2!4584 lt!154968) (_2!4583 lt!154712)))))

(declare-fun b!105270 () Bool)

(declare-fun lt!154981 () Unit!6446)

(assert (=> b!105270 (= e!68957 lt!154981)))

(declare-fun lt!154979 () (_ BitVec 64))

(assert (=> b!105270 (= lt!154979 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!154978 () (_ BitVec 64))

(assert (=> b!105270 (= lt!154978 (bitIndex!0 (size!2224 (buf!2595 thiss!1305)) (currentByte!5088 thiss!1305) (currentBit!5083 thiss!1305)))))

(assert (=> b!105270 (= lt!154981 (arrayBitRangesEqSymmetric!0 (buf!2595 thiss!1305) (buf!2595 (_2!4583 lt!154712)) lt!154979 lt!154978))))

(assert (=> b!105270 (arrayBitRangesEq!0 (buf!2595 (_2!4583 lt!154712)) (buf!2595 thiss!1305) lt!154979 lt!154978)))

(declare-fun b!105271 () Bool)

(declare-fun res!86689 () Bool)

(assert (=> b!105271 (=> (not res!86689) (not e!68956))))

(assert (=> b!105271 (= res!86689 (isPrefixOf!0 (_1!4584 lt!154968) thiss!1305))))

(declare-fun b!105272 () Bool)

(declare-fun Unit!6455 () Unit!6446)

(assert (=> b!105272 (= e!68957 Unit!6455)))

(assert (= (and d!32956 c!6488) b!105270))

(assert (= (and d!32956 (not c!6488)) b!105272))

(assert (= (and d!32956 res!86690) b!105271))

(assert (= (and b!105271 res!86689) b!105269))

(assert (= (and b!105269 res!86688) b!105268))

(declare-fun m!154599 () Bool)

(assert (=> d!32956 m!154599))

(declare-fun m!154601 () Bool)

(assert (=> d!32956 m!154601))

(declare-fun m!154603 () Bool)

(assert (=> d!32956 m!154603))

(declare-fun m!154605 () Bool)

(assert (=> d!32956 m!154605))

(assert (=> d!32956 m!154573))

(declare-fun m!154607 () Bool)

(assert (=> d!32956 m!154607))

(assert (=> d!32956 m!154577))

(declare-fun m!154609 () Bool)

(assert (=> d!32956 m!154609))

(declare-fun m!154611 () Bool)

(assert (=> d!32956 m!154611))

(declare-fun m!154613 () Bool)

(assert (=> d!32956 m!154613))

(assert (=> d!32956 m!154335))

(declare-fun m!154615 () Bool)

(assert (=> b!105271 m!154615))

(declare-fun m!154617 () Bool)

(assert (=> b!105268 m!154617))

(assert (=> b!105268 m!154389))

(assert (=> b!105268 m!154383))

(assert (=> b!105270 m!154383))

(declare-fun m!154619 () Bool)

(assert (=> b!105270 m!154619))

(declare-fun m!154621 () Bool)

(assert (=> b!105270 m!154621))

(declare-fun m!154623 () Bool)

(assert (=> b!105269 m!154623))

(assert (=> b!105152 d!32956))

(declare-fun d!32958 () Bool)

(assert (=> d!32958 (validate_offset_bits!1 ((_ sign_extend 32) (size!2224 (buf!2595 (_2!4583 lt!154712)))) ((_ sign_extend 32) (currentByte!5088 (_2!4583 lt!154722))) ((_ sign_extend 32) (currentBit!5083 (_2!4583 lt!154722))) lt!154716)))

(declare-fun lt!154986 () Unit!6446)

(assert (=> d!32958 (= lt!154986 (choose!9 (_2!4583 lt!154722) (buf!2595 (_2!4583 lt!154712)) lt!154716 (BitStream!3923 (buf!2595 (_2!4583 lt!154712)) (currentByte!5088 (_2!4583 lt!154722)) (currentBit!5083 (_2!4583 lt!154722)))))))

(assert (=> d!32958 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4583 lt!154722) (buf!2595 (_2!4583 lt!154712)) lt!154716) lt!154986)))

(declare-fun bs!8052 () Bool)

(assert (= bs!8052 d!32958))

(assert (=> bs!8052 m!154363))

(declare-fun m!154625 () Bool)

(assert (=> bs!8052 m!154625))

(assert (=> b!105152 d!32958))

(declare-fun d!32960 () Bool)

(assert (=> d!32960 (isPrefixOf!0 thiss!1305 (_2!4583 lt!154712))))

(declare-fun lt!154989 () Unit!6446)

(declare-fun choose!30 (BitStream!3922 BitStream!3922 BitStream!3922) Unit!6446)

(assert (=> d!32960 (= lt!154989 (choose!30 thiss!1305 (_2!4583 lt!154722) (_2!4583 lt!154712)))))

(assert (=> d!32960 (isPrefixOf!0 thiss!1305 (_2!4583 lt!154722))))

(assert (=> d!32960 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4583 lt!154722) (_2!4583 lt!154712)) lt!154989)))

(declare-fun bs!8053 () Bool)

(assert (= bs!8053 d!32960))

(assert (=> bs!8053 m!154335))

(declare-fun m!154627 () Bool)

(assert (=> bs!8053 m!154627))

(assert (=> bs!8053 m!154365))

(assert (=> b!105152 d!32960))

(declare-datatypes ((tuple2!8678 0))(
  ( (tuple2!8679 (_1!4596 (_ BitVec 64)) (_2!4596 BitStream!3922)) )
))
(declare-fun lt!154992 () tuple2!8678)

(declare-fun d!32962 () Bool)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!3922 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8678)

(assert (=> d!32962 (= lt!154992 (readNLeastSignificantBitsLoop!0 (_1!4584 lt!154708) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!154709))))

(assert (=> d!32962 (= (readNLeastSignificantBitsLoopPure!0 (_1!4584 lt!154708) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!154709) (tuple2!8657 (_2!4596 lt!154992) (_1!4596 lt!154992)))))

(declare-fun bs!8054 () Bool)

(assert (= bs!8054 d!32962))

(declare-fun m!154629 () Bool)

(assert (=> bs!8054 m!154629))

(assert (=> b!105152 d!32962))

(declare-fun d!32964 () Bool)

(declare-fun lt!154993 () tuple2!8674)

(assert (=> d!32964 (= lt!154993 (readBit!0 (BitStream!3923 (buf!2595 (_2!4583 lt!154712)) (currentByte!5088 thiss!1305) (currentBit!5083 thiss!1305))))))

(assert (=> d!32964 (= (readBitPure!0 (BitStream!3923 (buf!2595 (_2!4583 lt!154712)) (currentByte!5088 thiss!1305) (currentBit!5083 thiss!1305))) (tuple2!8651 (_2!4594 lt!154993) (_1!4594 lt!154993)))))

(declare-fun bs!8055 () Bool)

(assert (= bs!8055 d!32964))

(declare-fun m!154631 () Bool)

(assert (=> bs!8055 m!154631))

(assert (=> b!105152 d!32964))

(declare-fun d!32966 () Bool)

(declare-fun e!68958 () Bool)

(assert (=> d!32966 e!68958))

(declare-fun res!86692 () Bool)

(assert (=> d!32966 (=> (not res!86692) (not e!68958))))

(declare-fun lt!154994 () (_ BitVec 64))

(declare-fun lt!154996 () (_ BitVec 64))

(declare-fun lt!154997 () (_ BitVec 64))

(assert (=> d!32966 (= res!86692 (= lt!154997 (bvsub lt!154994 lt!154996)))))

(assert (=> d!32966 (or (= (bvand lt!154994 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!154996 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!154994 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!154994 lt!154996) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32966 (= lt!154996 (remainingBits!0 ((_ sign_extend 32) (size!2224 (buf!2595 (_1!4582 lt!154719)))) ((_ sign_extend 32) (currentByte!5088 (_1!4582 lt!154719))) ((_ sign_extend 32) (currentBit!5083 (_1!4582 lt!154719)))))))

(declare-fun lt!154995 () (_ BitVec 64))

(declare-fun lt!154998 () (_ BitVec 64))

(assert (=> d!32966 (= lt!154994 (bvmul lt!154995 lt!154998))))

(assert (=> d!32966 (or (= lt!154995 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!154998 (bvsdiv (bvmul lt!154995 lt!154998) lt!154995)))))

(assert (=> d!32966 (= lt!154998 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!32966 (= lt!154995 ((_ sign_extend 32) (size!2224 (buf!2595 (_1!4582 lt!154719)))))))

(assert (=> d!32966 (= lt!154997 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5088 (_1!4582 lt!154719))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5083 (_1!4582 lt!154719)))))))

(assert (=> d!32966 (invariant!0 (currentBit!5083 (_1!4582 lt!154719)) (currentByte!5088 (_1!4582 lt!154719)) (size!2224 (buf!2595 (_1!4582 lt!154719))))))

(assert (=> d!32966 (= (bitIndex!0 (size!2224 (buf!2595 (_1!4582 lt!154719))) (currentByte!5088 (_1!4582 lt!154719)) (currentBit!5083 (_1!4582 lt!154719))) lt!154997)))

(declare-fun b!105273 () Bool)

(declare-fun res!86691 () Bool)

(assert (=> b!105273 (=> (not res!86691) (not e!68958))))

(assert (=> b!105273 (= res!86691 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!154997))))

(declare-fun b!105274 () Bool)

(declare-fun lt!154999 () (_ BitVec 64))

(assert (=> b!105274 (= e!68958 (bvsle lt!154997 (bvmul lt!154999 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!105274 (or (= lt!154999 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!154999 #b0000000000000000000000000000000000000000000000000000000000001000) lt!154999)))))

(assert (=> b!105274 (= lt!154999 ((_ sign_extend 32) (size!2224 (buf!2595 (_1!4582 lt!154719)))))))

(assert (= (and d!32966 res!86692) b!105273))

(assert (= (and b!105273 res!86691) b!105274))

(declare-fun m!154633 () Bool)

(assert (=> d!32966 m!154633))

(declare-fun m!154635 () Bool)

(assert (=> d!32966 m!154635))

(assert (=> b!105152 d!32966))

(declare-fun d!32968 () Bool)

(assert (=> d!32968 (= (onesLSBLong!0 (bvsub nBits!396 i!615)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!396 i!615)))))))

(assert (=> b!105152 d!32968))

(declare-fun d!32970 () Bool)

(declare-fun res!86693 () Bool)

(declare-fun e!68959 () Bool)

(assert (=> d!32970 (=> (not res!86693) (not e!68959))))

(assert (=> d!32970 (= res!86693 (= (size!2224 (buf!2595 thiss!1305)) (size!2224 (buf!2595 (_2!4583 lt!154712)))))))

(assert (=> d!32970 (= (isPrefixOf!0 thiss!1305 (_2!4583 lt!154712)) e!68959)))

(declare-fun b!105275 () Bool)

(declare-fun res!86694 () Bool)

(assert (=> b!105275 (=> (not res!86694) (not e!68959))))

(assert (=> b!105275 (= res!86694 (bvsle (bitIndex!0 (size!2224 (buf!2595 thiss!1305)) (currentByte!5088 thiss!1305) (currentBit!5083 thiss!1305)) (bitIndex!0 (size!2224 (buf!2595 (_2!4583 lt!154712))) (currentByte!5088 (_2!4583 lt!154712)) (currentBit!5083 (_2!4583 lt!154712)))))))

(declare-fun b!105276 () Bool)

(declare-fun e!68960 () Bool)

(assert (=> b!105276 (= e!68959 e!68960)))

(declare-fun res!86695 () Bool)

(assert (=> b!105276 (=> res!86695 e!68960)))

(assert (=> b!105276 (= res!86695 (= (size!2224 (buf!2595 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!105277 () Bool)

(assert (=> b!105277 (= e!68960 (arrayBitRangesEq!0 (buf!2595 thiss!1305) (buf!2595 (_2!4583 lt!154712)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2224 (buf!2595 thiss!1305)) (currentByte!5088 thiss!1305) (currentBit!5083 thiss!1305))))))

(assert (= (and d!32970 res!86693) b!105275))

(assert (= (and b!105275 res!86694) b!105276))

(assert (= (and b!105276 (not res!86695)) b!105277))

(assert (=> b!105275 m!154383))

(assert (=> b!105275 m!154389))

(assert (=> b!105277 m!154383))

(assert (=> b!105277 m!154383))

(declare-fun m!154637 () Bool)

(assert (=> b!105277 m!154637))

(assert (=> b!105152 d!32970))

(declare-fun d!32972 () Bool)

(declare-fun lt!155000 () tuple2!8678)

(assert (=> d!32972 (= lt!155000 (readNLeastSignificantBitsLoop!0 (_1!4584 lt!154711) nBits!396 i!615 lt!154707))))

(assert (=> d!32972 (= (readNLeastSignificantBitsLoopPure!0 (_1!4584 lt!154711) nBits!396 i!615 lt!154707) (tuple2!8657 (_2!4596 lt!155000) (_1!4596 lt!155000)))))

(declare-fun bs!8056 () Bool)

(assert (= bs!8056 d!32972))

(declare-fun m!154639 () Bool)

(assert (=> bs!8056 m!154639))

(assert (=> b!105152 d!32972))

(declare-fun d!32974 () Bool)

(declare-fun e!68961 () Bool)

(assert (=> d!32974 e!68961))

(declare-fun res!86697 () Bool)

(assert (=> d!32974 (=> (not res!86697) (not e!68961))))

(declare-fun lt!155004 () (_ BitVec 64))

(declare-fun lt!155003 () (_ BitVec 64))

(declare-fun lt!155001 () (_ BitVec 64))

(assert (=> d!32974 (= res!86697 (= lt!155004 (bvsub lt!155001 lt!155003)))))

(assert (=> d!32974 (or (= (bvand lt!155001 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!155003 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!155001 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!155001 lt!155003) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32974 (= lt!155003 (remainingBits!0 ((_ sign_extend 32) (size!2224 (buf!2595 (_1!4582 lt!154721)))) ((_ sign_extend 32) (currentByte!5088 (_1!4582 lt!154721))) ((_ sign_extend 32) (currentBit!5083 (_1!4582 lt!154721)))))))

(declare-fun lt!155002 () (_ BitVec 64))

(declare-fun lt!155005 () (_ BitVec 64))

(assert (=> d!32974 (= lt!155001 (bvmul lt!155002 lt!155005))))

(assert (=> d!32974 (or (= lt!155002 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!155005 (bvsdiv (bvmul lt!155002 lt!155005) lt!155002)))))

(assert (=> d!32974 (= lt!155005 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!32974 (= lt!155002 ((_ sign_extend 32) (size!2224 (buf!2595 (_1!4582 lt!154721)))))))

(assert (=> d!32974 (= lt!155004 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5088 (_1!4582 lt!154721))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5083 (_1!4582 lt!154721)))))))

(assert (=> d!32974 (invariant!0 (currentBit!5083 (_1!4582 lt!154721)) (currentByte!5088 (_1!4582 lt!154721)) (size!2224 (buf!2595 (_1!4582 lt!154721))))))

(assert (=> d!32974 (= (bitIndex!0 (size!2224 (buf!2595 (_1!4582 lt!154721))) (currentByte!5088 (_1!4582 lt!154721)) (currentBit!5083 (_1!4582 lt!154721))) lt!155004)))

(declare-fun b!105278 () Bool)

(declare-fun res!86696 () Bool)

(assert (=> b!105278 (=> (not res!86696) (not e!68961))))

(assert (=> b!105278 (= res!86696 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!155004))))

(declare-fun b!105279 () Bool)

(declare-fun lt!155006 () (_ BitVec 64))

(assert (=> b!105279 (= e!68961 (bvsle lt!155004 (bvmul lt!155006 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!105279 (or (= lt!155006 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!155006 #b0000000000000000000000000000000000000000000000000000000000001000) lt!155006)))))

(assert (=> b!105279 (= lt!155006 ((_ sign_extend 32) (size!2224 (buf!2595 (_1!4582 lt!154721)))))))

(assert (= (and d!32974 res!86697) b!105278))

(assert (= (and b!105278 res!86696) b!105279))

(declare-fun m!154641 () Bool)

(assert (=> d!32974 m!154641))

(declare-fun m!154643 () Bool)

(assert (=> d!32974 m!154643))

(assert (=> b!105152 d!32974))

(declare-fun d!32976 () Bool)

(declare-fun lt!155007 () tuple2!8674)

(assert (=> d!32976 (= lt!155007 (readBit!0 (_1!4584 lt!154711)))))

(assert (=> d!32976 (= (readBitPure!0 (_1!4584 lt!154711)) (tuple2!8651 (_2!4594 lt!155007) (_1!4594 lt!155007)))))

(declare-fun bs!8057 () Bool)

(assert (= bs!8057 d!32976))

(declare-fun m!154645 () Bool)

(assert (=> bs!8057 m!154645))

(assert (=> b!105152 d!32976))

(declare-fun d!32978 () Bool)

(declare-fun e!68964 () Bool)

(assert (=> d!32978 e!68964))

(declare-fun res!86700 () Bool)

(assert (=> d!32978 (=> (not res!86700) (not e!68964))))

(declare-fun lt!155019 () tuple2!8650)

(declare-fun lt!155017 () tuple2!8650)

(assert (=> d!32978 (= res!86700 (= (bitIndex!0 (size!2224 (buf!2595 (_1!4582 lt!155019))) (currentByte!5088 (_1!4582 lt!155019)) (currentBit!5083 (_1!4582 lt!155019))) (bitIndex!0 (size!2224 (buf!2595 (_1!4582 lt!155017))) (currentByte!5088 (_1!4582 lt!155017)) (currentBit!5083 (_1!4582 lt!155017)))))))

(declare-fun lt!155016 () Unit!6446)

(declare-fun lt!155018 () BitStream!3922)

(declare-fun choose!50 (BitStream!3922 BitStream!3922 BitStream!3922 tuple2!8650 tuple2!8650 BitStream!3922 Bool tuple2!8650 tuple2!8650 BitStream!3922 Bool) Unit!6446)

(assert (=> d!32978 (= lt!155016 (choose!50 lt!154718 (_2!4583 lt!154712) lt!155018 lt!155019 (tuple2!8651 (_1!4582 lt!155019) (_2!4582 lt!155019)) (_1!4582 lt!155019) (_2!4582 lt!155019) lt!155017 (tuple2!8651 (_1!4582 lt!155017) (_2!4582 lt!155017)) (_1!4582 lt!155017) (_2!4582 lt!155017)))))

(assert (=> d!32978 (= lt!155017 (readBitPure!0 lt!155018))))

(assert (=> d!32978 (= lt!155019 (readBitPure!0 lt!154718))))

(assert (=> d!32978 (= lt!155018 (BitStream!3923 (buf!2595 (_2!4583 lt!154712)) (currentByte!5088 lt!154718) (currentBit!5083 lt!154718)))))

(assert (=> d!32978 (invariant!0 (currentBit!5083 lt!154718) (currentByte!5088 lt!154718) (size!2224 (buf!2595 (_2!4583 lt!154712))))))

(assert (=> d!32978 (= (readBitPrefixLemma!0 lt!154718 (_2!4583 lt!154712)) lt!155016)))

(declare-fun b!105282 () Bool)

(assert (=> b!105282 (= e!68964 (= (_2!4582 lt!155019) (_2!4582 lt!155017)))))

(assert (= (and d!32978 res!86700) b!105282))

(assert (=> d!32978 m!154327))

(declare-fun m!154647 () Bool)

(assert (=> d!32978 m!154647))

(declare-fun m!154649 () Bool)

(assert (=> d!32978 m!154649))

(declare-fun m!154651 () Bool)

(assert (=> d!32978 m!154651))

(declare-fun m!154653 () Bool)

(assert (=> d!32978 m!154653))

(declare-fun m!154655 () Bool)

(assert (=> d!32978 m!154655))

(assert (=> b!105152 d!32978))

(declare-fun b!105373 () Bool)

(declare-fun res!86769 () Bool)

(declare-fun lt!155360 () tuple2!8652)

(assert (=> b!105373 (= res!86769 (isPrefixOf!0 (_2!4583 lt!154722) (_2!4583 lt!155360)))))

(declare-fun e!69016 () Bool)

(assert (=> b!105373 (=> (not res!86769) (not e!69016))))

(declare-fun lt!155373 () tuple2!8656)

(declare-fun e!69014 () Bool)

(declare-fun b!105374 () Bool)

(declare-fun lt!155357 () tuple2!8654)

(assert (=> b!105374 (= e!69014 (and (= (_2!4585 lt!155373) v!199) (= (_1!4585 lt!155373) (_2!4584 lt!155357))))))

(declare-fun lt!155353 () (_ BitVec 64))

(assert (=> b!105374 (= lt!155373 (readNLeastSignificantBitsLoopPure!0 (_1!4584 lt!155357) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!155353))))

(declare-fun lt!155345 () Unit!6446)

(declare-fun lt!155340 () Unit!6446)

(assert (=> b!105374 (= lt!155345 lt!155340)))

(declare-fun lt!155371 () tuple2!8652)

(declare-fun lt!155334 () (_ BitVec 64))

(assert (=> b!105374 (validate_offset_bits!1 ((_ sign_extend 32) (size!2224 (buf!2595 (_2!4583 lt!155371)))) ((_ sign_extend 32) (currentByte!5088 (_2!4583 lt!154722))) ((_ sign_extend 32) (currentBit!5083 (_2!4583 lt!154722))) lt!155334)))

(assert (=> b!105374 (= lt!155340 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4583 lt!154722) (buf!2595 (_2!4583 lt!155371)) lt!155334))))

(declare-fun e!69011 () Bool)

(assert (=> b!105374 e!69011))

(declare-fun res!86771 () Bool)

(assert (=> b!105374 (=> (not res!86771) (not e!69011))))

(assert (=> b!105374 (= res!86771 (and (= (size!2224 (buf!2595 (_2!4583 lt!154722))) (size!2224 (buf!2595 (_2!4583 lt!155371)))) (bvsge lt!155334 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!105374 (= lt!155334 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!105374 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!105374 (= lt!155353 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!105374 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!105374 (= lt!155357 (reader!0 (_2!4583 lt!154722) (_2!4583 lt!155371)))))

(declare-fun b!105375 () Bool)

(declare-fun e!69015 () tuple2!8652)

(declare-fun lt!155354 () tuple2!8652)

(declare-fun Unit!6460 () Unit!6446)

(assert (=> b!105375 (= e!69015 (tuple2!8653 Unit!6460 (_2!4583 lt!155354)))))

(declare-fun lt!155361 () Bool)

(assert (=> b!105375 (= lt!155361 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!105375 (= lt!155360 (appendBit!0 (_2!4583 lt!154722) lt!155361))))

(declare-fun res!86764 () Bool)

(assert (=> b!105375 (= res!86764 (= (size!2224 (buf!2595 (_2!4583 lt!154722))) (size!2224 (buf!2595 (_2!4583 lt!155360)))))))

(assert (=> b!105375 (=> (not res!86764) (not e!69016))))

(assert (=> b!105375 e!69016))

(declare-fun lt!155346 () tuple2!8652)

(assert (=> b!105375 (= lt!155346 lt!155360)))

(assert (=> b!105375 (= lt!155354 (appendNLeastSignificantBitsLoop!0 (_2!4583 lt!155346) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!155341 () Unit!6446)

(assert (=> b!105375 (= lt!155341 (lemmaIsPrefixTransitive!0 (_2!4583 lt!154722) (_2!4583 lt!155346) (_2!4583 lt!155354)))))

(declare-fun call!1320 () Bool)

(assert (=> b!105375 call!1320))

(declare-fun lt!155336 () Unit!6446)

(assert (=> b!105375 (= lt!155336 lt!155341)))

(assert (=> b!105375 (invariant!0 (currentBit!5083 (_2!4583 lt!154722)) (currentByte!5088 (_2!4583 lt!154722)) (size!2224 (buf!2595 (_2!4583 lt!155346))))))

(declare-fun lt!155350 () BitStream!3922)

(assert (=> b!105375 (= lt!155350 (BitStream!3923 (buf!2595 (_2!4583 lt!155346)) (currentByte!5088 (_2!4583 lt!154722)) (currentBit!5083 (_2!4583 lt!154722))))))

(assert (=> b!105375 (invariant!0 (currentBit!5083 lt!155350) (currentByte!5088 lt!155350) (size!2224 (buf!2595 (_2!4583 lt!155354))))))

(declare-fun lt!155366 () BitStream!3922)

(assert (=> b!105375 (= lt!155366 (BitStream!3923 (buf!2595 (_2!4583 lt!155354)) (currentByte!5088 lt!155350) (currentBit!5083 lt!155350)))))

(declare-fun lt!155365 () tuple2!8650)

(assert (=> b!105375 (= lt!155365 (readBitPure!0 lt!155350))))

(declare-fun lt!155349 () tuple2!8650)

(assert (=> b!105375 (= lt!155349 (readBitPure!0 lt!155366))))

(declare-fun lt!155374 () Unit!6446)

(assert (=> b!105375 (= lt!155374 (readBitPrefixLemma!0 lt!155350 (_2!4583 lt!155354)))))

(declare-fun res!86763 () Bool)

(assert (=> b!105375 (= res!86763 (= (bitIndex!0 (size!2224 (buf!2595 (_1!4582 lt!155365))) (currentByte!5088 (_1!4582 lt!155365)) (currentBit!5083 (_1!4582 lt!155365))) (bitIndex!0 (size!2224 (buf!2595 (_1!4582 lt!155349))) (currentByte!5088 (_1!4582 lt!155349)) (currentBit!5083 (_1!4582 lt!155349)))))))

(declare-fun e!69017 () Bool)

(assert (=> b!105375 (=> (not res!86763) (not e!69017))))

(assert (=> b!105375 e!69017))

(declare-fun lt!155337 () Unit!6446)

(assert (=> b!105375 (= lt!155337 lt!155374)))

(declare-fun lt!155376 () tuple2!8654)

(assert (=> b!105375 (= lt!155376 (reader!0 (_2!4583 lt!154722) (_2!4583 lt!155354)))))

(declare-fun lt!155359 () tuple2!8654)

(assert (=> b!105375 (= lt!155359 (reader!0 (_2!4583 lt!155346) (_2!4583 lt!155354)))))

(declare-fun lt!155362 () tuple2!8650)

(assert (=> b!105375 (= lt!155362 (readBitPure!0 (_1!4584 lt!155376)))))

(assert (=> b!105375 (= (_2!4582 lt!155362) lt!155361)))

(declare-fun lt!155370 () Unit!6446)

(declare-fun Unit!6461 () Unit!6446)

(assert (=> b!105375 (= lt!155370 Unit!6461)))

(declare-fun lt!155355 () (_ BitVec 64))

(assert (=> b!105375 (= lt!155355 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!155342 () (_ BitVec 64))

(assert (=> b!105375 (= lt!155342 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!155375 () Unit!6446)

(assert (=> b!105375 (= lt!155375 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4583 lt!154722) (buf!2595 (_2!4583 lt!155354)) lt!155342))))

(assert (=> b!105375 (validate_offset_bits!1 ((_ sign_extend 32) (size!2224 (buf!2595 (_2!4583 lt!155354)))) ((_ sign_extend 32) (currentByte!5088 (_2!4583 lt!154722))) ((_ sign_extend 32) (currentBit!5083 (_2!4583 lt!154722))) lt!155342)))

(declare-fun lt!155356 () Unit!6446)

(assert (=> b!105375 (= lt!155356 lt!155375)))

(declare-fun lt!155343 () tuple2!8656)

(assert (=> b!105375 (= lt!155343 (readNLeastSignificantBitsLoopPure!0 (_1!4584 lt!155376) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!155355))))

(declare-fun lt!155338 () (_ BitVec 64))

(assert (=> b!105375 (= lt!155338 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!155335 () Unit!6446)

(assert (=> b!105375 (= lt!155335 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4583 lt!155346) (buf!2595 (_2!4583 lt!155354)) lt!155338))))

(assert (=> b!105375 (validate_offset_bits!1 ((_ sign_extend 32) (size!2224 (buf!2595 (_2!4583 lt!155354)))) ((_ sign_extend 32) (currentByte!5088 (_2!4583 lt!155346))) ((_ sign_extend 32) (currentBit!5083 (_2!4583 lt!155346))) lt!155338)))

(declare-fun lt!155369 () Unit!6446)

(assert (=> b!105375 (= lt!155369 lt!155335)))

(declare-fun lt!155367 () tuple2!8656)

(assert (=> b!105375 (= lt!155367 (readNLeastSignificantBitsLoopPure!0 (_1!4584 lt!155359) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!155355 (ite (_2!4582 lt!155362) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!155358 () tuple2!8656)

(assert (=> b!105375 (= lt!155358 (readNLeastSignificantBitsLoopPure!0 (_1!4584 lt!155376) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!155355))))

(declare-fun c!6503 () Bool)

(assert (=> b!105375 (= c!6503 (_2!4582 (readBitPure!0 (_1!4584 lt!155376))))))

(declare-fun e!69013 () (_ BitVec 64))

(declare-fun lt!155332 () tuple2!8656)

(assert (=> b!105375 (= lt!155332 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4584 lt!155376) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!155355 e!69013)))))

(declare-fun lt!155348 () Unit!6446)

(assert (=> b!105375 (= lt!155348 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4584 lt!155376) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!155355))))

(assert (=> b!105375 (and (= (_2!4585 lt!155358) (_2!4585 lt!155332)) (= (_1!4585 lt!155358) (_1!4585 lt!155332)))))

(declare-fun lt!155344 () Unit!6446)

(assert (=> b!105375 (= lt!155344 lt!155348)))

(assert (=> b!105375 (= (_1!4584 lt!155376) (withMovedBitIndex!0 (_2!4584 lt!155376) (bvsub (bitIndex!0 (size!2224 (buf!2595 (_2!4583 lt!154722))) (currentByte!5088 (_2!4583 lt!154722)) (currentBit!5083 (_2!4583 lt!154722))) (bitIndex!0 (size!2224 (buf!2595 (_2!4583 lt!155354))) (currentByte!5088 (_2!4583 lt!155354)) (currentBit!5083 (_2!4583 lt!155354))))))))

(declare-fun lt!155368 () Unit!6446)

(declare-fun Unit!6462 () Unit!6446)

(assert (=> b!105375 (= lt!155368 Unit!6462)))

(assert (=> b!105375 (= (_1!4584 lt!155359) (withMovedBitIndex!0 (_2!4584 lt!155359) (bvsub (bitIndex!0 (size!2224 (buf!2595 (_2!4583 lt!155346))) (currentByte!5088 (_2!4583 lt!155346)) (currentBit!5083 (_2!4583 lt!155346))) (bitIndex!0 (size!2224 (buf!2595 (_2!4583 lt!155354))) (currentByte!5088 (_2!4583 lt!155354)) (currentBit!5083 (_2!4583 lt!155354))))))))

(declare-fun lt!155364 () Unit!6446)

(declare-fun Unit!6463 () Unit!6446)

(assert (=> b!105375 (= lt!155364 Unit!6463)))

(assert (=> b!105375 (= (bitIndex!0 (size!2224 (buf!2595 (_2!4583 lt!154722))) (currentByte!5088 (_2!4583 lt!154722)) (currentBit!5083 (_2!4583 lt!154722))) (bvsub (bitIndex!0 (size!2224 (buf!2595 (_2!4583 lt!155346))) (currentByte!5088 (_2!4583 lt!155346)) (currentBit!5083 (_2!4583 lt!155346))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!155347 () Unit!6446)

(declare-fun Unit!6464 () Unit!6446)

(assert (=> b!105375 (= lt!155347 Unit!6464)))

(assert (=> b!105375 (= (_2!4585 lt!155343) (_2!4585 lt!155367))))

(declare-fun lt!155339 () Unit!6446)

(declare-fun Unit!6465 () Unit!6446)

(assert (=> b!105375 (= lt!155339 Unit!6465)))

(assert (=> b!105375 (= (_1!4585 lt!155343) (_2!4584 lt!155376))))

(declare-fun b!105376 () Bool)

(assert (=> b!105376 (= e!69013 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun d!32980 () Bool)

(assert (=> d!32980 e!69014))

(declare-fun res!86773 () Bool)

(assert (=> d!32980 (=> (not res!86773) (not e!69014))))

(assert (=> d!32980 (= res!86773 (= (size!2224 (buf!2595 (_2!4583 lt!154722))) (size!2224 (buf!2595 (_2!4583 lt!155371)))))))

(assert (=> d!32980 (= lt!155371 e!69015)))

(declare-fun c!6502 () Bool)

(assert (=> d!32980 (= c!6502 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!32980 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!32980 (= (appendNLeastSignificantBitsLoop!0 (_2!4583 lt!154722) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!155371)))

(declare-fun b!105377 () Bool)

(assert (=> b!105377 (= e!69011 (validate_offset_bits!1 ((_ sign_extend 32) (size!2224 (buf!2595 (_2!4583 lt!154722)))) ((_ sign_extend 32) (currentByte!5088 (_2!4583 lt!154722))) ((_ sign_extend 32) (currentBit!5083 (_2!4583 lt!154722))) lt!155334))))

(declare-fun bm!1317 () Bool)

(declare-fun lt!155333 () BitStream!3922)

(assert (=> bm!1317 (= call!1320 (isPrefixOf!0 (ite c!6502 (_2!4583 lt!154722) lt!155333) (ite c!6502 (_2!4583 lt!155354) lt!155333)))))

(declare-fun b!105378 () Bool)

(declare-fun e!69012 () Bool)

(declare-fun lt!155351 () tuple2!8650)

(assert (=> b!105378 (= e!69012 (= (bitIndex!0 (size!2224 (buf!2595 (_1!4582 lt!155351))) (currentByte!5088 (_1!4582 lt!155351)) (currentBit!5083 (_1!4582 lt!155351))) (bitIndex!0 (size!2224 (buf!2595 (_2!4583 lt!155360))) (currentByte!5088 (_2!4583 lt!155360)) (currentBit!5083 (_2!4583 lt!155360)))))))

(declare-fun b!105379 () Bool)

(assert (=> b!105379 (= e!69013 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun b!105380 () Bool)

(declare-fun res!86772 () Bool)

(assert (=> b!105380 (= res!86772 (= (bitIndex!0 (size!2224 (buf!2595 (_2!4583 lt!155360))) (currentByte!5088 (_2!4583 lt!155360)) (currentBit!5083 (_2!4583 lt!155360))) (bvadd (bitIndex!0 (size!2224 (buf!2595 (_2!4583 lt!154722))) (currentByte!5088 (_2!4583 lt!154722)) (currentBit!5083 (_2!4583 lt!154722))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!105380 (=> (not res!86772) (not e!69016))))

(declare-fun b!105381 () Bool)

(declare-fun lt!155363 () Unit!6446)

(assert (=> b!105381 (= e!69015 (tuple2!8653 lt!155363 (_2!4583 lt!154722)))))

(assert (=> b!105381 (= lt!155333 (_2!4583 lt!154722))))

(assert (=> b!105381 (= lt!155363 (lemmaIsPrefixRefl!0 lt!155333))))

(assert (=> b!105381 call!1320))

(declare-fun b!105382 () Bool)

(assert (=> b!105382 (= e!69017 (= (_2!4582 lt!155365) (_2!4582 lt!155349)))))

(declare-fun b!105383 () Bool)

(declare-fun res!86770 () Bool)

(assert (=> b!105383 (=> (not res!86770) (not e!69014))))

(assert (=> b!105383 (= res!86770 (isPrefixOf!0 (_2!4583 lt!154722) (_2!4583 lt!155371)))))

(declare-fun b!105384 () Bool)

(assert (=> b!105384 (= lt!155351 (readBitPure!0 (readerFrom!0 (_2!4583 lt!155360) (currentBit!5083 (_2!4583 lt!154722)) (currentByte!5088 (_2!4583 lt!154722)))))))

(declare-fun res!86765 () Bool)

(assert (=> b!105384 (= res!86765 (and (= (_2!4582 lt!155351) lt!155361) (= (_1!4582 lt!155351) (_2!4583 lt!155360))))))

(assert (=> b!105384 (=> (not res!86765) (not e!69012))))

(assert (=> b!105384 (= e!69016 e!69012)))

(declare-fun b!105385 () Bool)

(declare-fun res!86768 () Bool)

(assert (=> b!105385 (=> (not res!86768) (not e!69014))))

(declare-fun lt!155372 () (_ BitVec 64))

(declare-fun lt!155352 () (_ BitVec 64))

(assert (=> b!105385 (= res!86768 (= (bitIndex!0 (size!2224 (buf!2595 (_2!4583 lt!155371))) (currentByte!5088 (_2!4583 lt!155371)) (currentBit!5083 (_2!4583 lt!155371))) (bvadd lt!155352 lt!155372)))))

(assert (=> b!105385 (or (not (= (bvand lt!155352 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!155372 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!155352 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!155352 lt!155372) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!105385 (= lt!155372 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!105385 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!105385 (= lt!155352 (bitIndex!0 (size!2224 (buf!2595 (_2!4583 lt!154722))) (currentByte!5088 (_2!4583 lt!154722)) (currentBit!5083 (_2!4583 lt!154722))))))

(assert (= (and d!32980 c!6502) b!105375))

(assert (= (and d!32980 (not c!6502)) b!105381))

(assert (= (and b!105375 res!86764) b!105380))

(assert (= (and b!105380 res!86772) b!105373))

(assert (= (and b!105373 res!86769) b!105384))

(assert (= (and b!105384 res!86765) b!105378))

(assert (= (and b!105375 res!86763) b!105382))

(assert (= (and b!105375 c!6503) b!105379))

(assert (= (and b!105375 (not c!6503)) b!105376))

(assert (= (or b!105375 b!105381) bm!1317))

(assert (= (and d!32980 res!86773) b!105385))

(assert (= (and b!105385 res!86768) b!105383))

(assert (= (and b!105383 res!86770) b!105374))

(assert (= (and b!105374 res!86771) b!105377))

(declare-fun m!154795 () Bool)

(assert (=> b!105375 m!154795))

(declare-fun m!154797 () Bool)

(assert (=> b!105375 m!154797))

(declare-fun m!154799 () Bool)

(assert (=> b!105375 m!154799))

(declare-fun m!154801 () Bool)

(assert (=> b!105375 m!154801))

(declare-fun m!154803 () Bool)

(assert (=> b!105375 m!154803))

(declare-fun m!154805 () Bool)

(assert (=> b!105375 m!154805))

(declare-fun m!154807 () Bool)

(assert (=> b!105375 m!154807))

(declare-fun m!154809 () Bool)

(assert (=> b!105375 m!154809))

(declare-fun m!154811 () Bool)

(assert (=> b!105375 m!154811))

(declare-fun m!154813 () Bool)

(assert (=> b!105375 m!154813))

(declare-fun m!154815 () Bool)

(assert (=> b!105375 m!154815))

(declare-fun m!154817 () Bool)

(assert (=> b!105375 m!154817))

(declare-fun m!154819 () Bool)

(assert (=> b!105375 m!154819))

(declare-fun m!154821 () Bool)

(assert (=> b!105375 m!154821))

(declare-fun m!154823 () Bool)

(assert (=> b!105375 m!154823))

(declare-fun m!154825 () Bool)

(assert (=> b!105375 m!154825))

(assert (=> b!105375 m!154817))

(declare-fun m!154827 () Bool)

(assert (=> b!105375 m!154827))

(declare-fun m!154829 () Bool)

(assert (=> b!105375 m!154829))

(declare-fun m!154831 () Bool)

(assert (=> b!105375 m!154831))

(declare-fun m!154833 () Bool)

(assert (=> b!105375 m!154833))

(assert (=> b!105375 m!154381))

(declare-fun m!154835 () Bool)

(assert (=> b!105375 m!154835))

(declare-fun m!154837 () Bool)

(assert (=> b!105375 m!154837))

(declare-fun m!154839 () Bool)

(assert (=> b!105375 m!154839))

(declare-fun m!154841 () Bool)

(assert (=> b!105375 m!154841))

(declare-fun m!154843 () Bool)

(assert (=> b!105375 m!154843))

(declare-fun m!154845 () Bool)

(assert (=> b!105375 m!154845))

(declare-fun m!154847 () Bool)

(assert (=> b!105375 m!154847))

(declare-fun m!154849 () Bool)

(assert (=> b!105381 m!154849))

(declare-fun m!154851 () Bool)

(assert (=> b!105377 m!154851))

(declare-fun m!154853 () Bool)

(assert (=> b!105384 m!154853))

(assert (=> b!105384 m!154853))

(declare-fun m!154855 () Bool)

(assert (=> b!105384 m!154855))

(declare-fun m!154857 () Bool)

(assert (=> b!105380 m!154857))

(assert (=> b!105380 m!154381))

(declare-fun m!154859 () Bool)

(assert (=> b!105373 m!154859))

(declare-fun m!154861 () Bool)

(assert (=> b!105385 m!154861))

(assert (=> b!105385 m!154381))

(declare-fun m!154863 () Bool)

(assert (=> b!105374 m!154863))

(declare-fun m!154865 () Bool)

(assert (=> b!105374 m!154865))

(assert (=> b!105374 m!154799))

(declare-fun m!154867 () Bool)

(assert (=> b!105374 m!154867))

(declare-fun m!154869 () Bool)

(assert (=> b!105374 m!154869))

(declare-fun m!154871 () Bool)

(assert (=> b!105378 m!154871))

(assert (=> b!105378 m!154857))

(declare-fun m!154873 () Bool)

(assert (=> b!105383 m!154873))

(declare-fun m!154875 () Bool)

(assert (=> bm!1317 m!154875))

(assert (=> b!105152 d!32980))

(declare-fun d!33006 () Bool)

(declare-fun e!69034 () Bool)

(assert (=> d!33006 e!69034))

(declare-fun res!86804 () Bool)

(assert (=> d!33006 (=> (not res!86804) (not e!69034))))

(declare-fun lt!155406 () tuple2!8652)

(assert (=> d!33006 (= res!86804 (= (size!2224 (buf!2595 thiss!1305)) (size!2224 (buf!2595 (_2!4583 lt!155406)))))))

(declare-fun choose!16 (BitStream!3922 Bool) tuple2!8652)

(assert (=> d!33006 (= lt!155406 (choose!16 thiss!1305 lt!154710))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!33006 (validate_offset_bit!0 ((_ sign_extend 32) (size!2224 (buf!2595 thiss!1305))) ((_ sign_extend 32) (currentByte!5088 thiss!1305)) ((_ sign_extend 32) (currentBit!5083 thiss!1305)))))

(assert (=> d!33006 (= (appendBit!0 thiss!1305 lt!154710) lt!155406)))

(declare-fun b!105418 () Bool)

(declare-fun e!69033 () Bool)

(declare-fun lt!155404 () tuple2!8650)

(assert (=> b!105418 (= e!69033 (= (bitIndex!0 (size!2224 (buf!2595 (_1!4582 lt!155404))) (currentByte!5088 (_1!4582 lt!155404)) (currentBit!5083 (_1!4582 lt!155404))) (bitIndex!0 (size!2224 (buf!2595 (_2!4583 lt!155406))) (currentByte!5088 (_2!4583 lt!155406)) (currentBit!5083 (_2!4583 lt!155406)))))))

(declare-fun b!105416 () Bool)

(declare-fun res!86803 () Bool)

(assert (=> b!105416 (=> (not res!86803) (not e!69034))))

(assert (=> b!105416 (= res!86803 (isPrefixOf!0 thiss!1305 (_2!4583 lt!155406)))))

(declare-fun b!105417 () Bool)

(assert (=> b!105417 (= e!69034 e!69033)))

(declare-fun res!86801 () Bool)

(assert (=> b!105417 (=> (not res!86801) (not e!69033))))

(assert (=> b!105417 (= res!86801 (and (= (_2!4582 lt!155404) lt!154710) (= (_1!4582 lt!155404) (_2!4583 lt!155406))))))

(assert (=> b!105417 (= lt!155404 (readBitPure!0 (readerFrom!0 (_2!4583 lt!155406) (currentBit!5083 thiss!1305) (currentByte!5088 thiss!1305))))))

(declare-fun b!105415 () Bool)

(declare-fun res!86802 () Bool)

(assert (=> b!105415 (=> (not res!86802) (not e!69034))))

(declare-fun lt!155405 () (_ BitVec 64))

(declare-fun lt!155407 () (_ BitVec 64))

(assert (=> b!105415 (= res!86802 (= (bitIndex!0 (size!2224 (buf!2595 (_2!4583 lt!155406))) (currentByte!5088 (_2!4583 lt!155406)) (currentBit!5083 (_2!4583 lt!155406))) (bvadd lt!155405 lt!155407)))))

(assert (=> b!105415 (or (not (= (bvand lt!155405 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!155407 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!155405 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!155405 lt!155407) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!105415 (= lt!155407 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!105415 (= lt!155405 (bitIndex!0 (size!2224 (buf!2595 thiss!1305)) (currentByte!5088 thiss!1305) (currentBit!5083 thiss!1305)))))

(assert (= (and d!33006 res!86804) b!105415))

(assert (= (and b!105415 res!86802) b!105416))

(assert (= (and b!105416 res!86803) b!105417))

(assert (= (and b!105417 res!86801) b!105418))

(declare-fun m!154893 () Bool)

(assert (=> d!33006 m!154893))

(declare-fun m!154895 () Bool)

(assert (=> d!33006 m!154895))

(declare-fun m!154897 () Bool)

(assert (=> b!105415 m!154897))

(assert (=> b!105415 m!154383))

(declare-fun m!154899 () Bool)

(assert (=> b!105417 m!154899))

(assert (=> b!105417 m!154899))

(declare-fun m!154901 () Bool)

(assert (=> b!105417 m!154901))

(declare-fun m!154903 () Bool)

(assert (=> b!105416 m!154903))

(declare-fun m!154905 () Bool)

(assert (=> b!105418 m!154905))

(assert (=> b!105418 m!154897))

(assert (=> b!105152 d!33006))

(declare-fun d!33012 () Bool)

(declare-fun lt!155408 () tuple2!8674)

(assert (=> d!33012 (= lt!155408 (readBit!0 lt!154718))))

(assert (=> d!33012 (= (readBitPure!0 lt!154718) (tuple2!8651 (_2!4594 lt!155408) (_1!4594 lt!155408)))))

(declare-fun bs!8066 () Bool)

(assert (= bs!8066 d!33012))

(declare-fun m!154907 () Bool)

(assert (=> bs!8066 m!154907))

(assert (=> b!105152 d!33012))

(declare-fun d!33014 () Bool)

(assert (=> d!33014 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2224 (buf!2595 (_2!4583 lt!154712)))) ((_ sign_extend 32) (currentByte!5088 thiss!1305)) ((_ sign_extend 32) (currentBit!5083 thiss!1305)) lt!154715) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2224 (buf!2595 (_2!4583 lt!154712)))) ((_ sign_extend 32) (currentByte!5088 thiss!1305)) ((_ sign_extend 32) (currentBit!5083 thiss!1305))) lt!154715))))

(declare-fun bs!8067 () Bool)

(assert (= bs!8067 d!33014))

(declare-fun m!154909 () Bool)

(assert (=> bs!8067 m!154909))

(assert (=> b!105152 d!33014))

(declare-fun d!33016 () Bool)

(declare-fun res!86807 () Bool)

(declare-fun e!69037 () Bool)

(assert (=> d!33016 (=> (not res!86807) (not e!69037))))

(assert (=> d!33016 (= res!86807 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!2224 (buf!2595 (_2!4584 lt!154711))))) (bvsub (bitIndex!0 (size!2224 (buf!2595 thiss!1305)) (currentByte!5088 thiss!1305) (currentBit!5083 thiss!1305)) (bitIndex!0 (size!2224 (buf!2595 (_2!4583 lt!154712))) (currentByte!5088 (_2!4583 lt!154712)) (currentBit!5083 (_2!4583 lt!154712))))) (bvsle (bvsub (bitIndex!0 (size!2224 (buf!2595 thiss!1305)) (currentByte!5088 thiss!1305) (currentBit!5083 thiss!1305)) (bitIndex!0 (size!2224 (buf!2595 (_2!4583 lt!154712))) (currentByte!5088 (_2!4583 lt!154712)) (currentBit!5083 (_2!4583 lt!154712)))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2224 (buf!2595 (_2!4584 lt!154711))))))))))

(assert (=> d!33016 (= (moveBitIndexPrecond!0 (_2!4584 lt!154711) (bvsub (bitIndex!0 (size!2224 (buf!2595 thiss!1305)) (currentByte!5088 thiss!1305) (currentBit!5083 thiss!1305)) (bitIndex!0 (size!2224 (buf!2595 (_2!4583 lt!154712))) (currentByte!5088 (_2!4583 lt!154712)) (currentBit!5083 (_2!4583 lt!154712))))) e!69037)))

(declare-fun b!105422 () Bool)

(declare-fun lt!155411 () (_ BitVec 64))

(assert (=> b!105422 (= e!69037 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!155411) (bvsle lt!155411 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2224 (buf!2595 (_2!4584 lt!154711))))))))))

(assert (=> b!105422 (= lt!155411 (bvadd (bitIndex!0 (size!2224 (buf!2595 (_2!4584 lt!154711))) (currentByte!5088 (_2!4584 lt!154711)) (currentBit!5083 (_2!4584 lt!154711))) (bvsub (bitIndex!0 (size!2224 (buf!2595 thiss!1305)) (currentByte!5088 thiss!1305) (currentBit!5083 thiss!1305)) (bitIndex!0 (size!2224 (buf!2595 (_2!4583 lt!154712))) (currentByte!5088 (_2!4583 lt!154712)) (currentBit!5083 (_2!4583 lt!154712))))))))

(assert (= (and d!33016 res!86807) b!105422))

(declare-fun m!154911 () Bool)

(assert (=> b!105422 m!154911))

(assert (=> b!105141 d!33016))

(declare-fun d!33018 () Bool)

(declare-fun e!69045 () Bool)

(assert (=> d!33018 e!69045))

(declare-fun res!86816 () Bool)

(assert (=> d!33018 (=> (not res!86816) (not e!69045))))

(declare-fun lt!155452 () (_ BitVec 64))

(declare-fun lt!155451 () BitStream!3922)

(assert (=> d!33018 (= res!86816 (= (bvadd lt!155452 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!2224 (buf!2595 lt!155451)) (currentByte!5088 lt!155451) (currentBit!5083 lt!155451))))))

(assert (=> d!33018 (or (not (= (bvand lt!155452 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!155452 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!155452 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33018 (= lt!155452 (bitIndex!0 (size!2224 (buf!2595 (_1!4584 lt!154711))) (currentByte!5088 (_1!4584 lt!154711)) (currentBit!5083 (_1!4584 lt!154711))))))

(declare-fun moveBitIndex!0 (BitStream!3922 (_ BitVec 64)) tuple2!8652)

(assert (=> d!33018 (= lt!155451 (_2!4583 (moveBitIndex!0 (_1!4584 lt!154711) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!33018 (moveBitIndexPrecond!0 (_1!4584 lt!154711) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!33018 (= (withMovedBitIndex!0 (_1!4584 lt!154711) #b0000000000000000000000000000000000000000000000000000000000000001) lt!155451)))

(declare-fun b!105433 () Bool)

(assert (=> b!105433 (= e!69045 (= (size!2224 (buf!2595 (_1!4584 lt!154711))) (size!2224 (buf!2595 lt!155451))))))

(assert (= (and d!33018 res!86816) b!105433))

(declare-fun m!154929 () Bool)

(assert (=> d!33018 m!154929))

(declare-fun m!154931 () Bool)

(assert (=> d!33018 m!154931))

(declare-fun m!154933 () Bool)

(assert (=> d!33018 m!154933))

(declare-fun m!154935 () Bool)

(assert (=> d!33018 m!154935))

(assert (=> b!105141 d!33018))

(declare-fun d!33024 () Bool)

(declare-fun lt!155453 () tuple2!8678)

(assert (=> d!33024 (= lt!155453 (readNLeastSignificantBitsLoop!0 (withMovedBitIndex!0 (_1!4584 lt!154711) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!154709))))

(assert (=> d!33024 (= (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4584 lt!154711) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!154709) (tuple2!8657 (_2!4596 lt!155453) (_1!4596 lt!155453)))))

(declare-fun bs!8069 () Bool)

(assert (= bs!8069 d!33024))

(assert (=> bs!8069 m!154385))

(declare-fun m!154957 () Bool)

(assert (=> bs!8069 m!154957))

(assert (=> b!105141 d!33024))

(declare-fun d!33026 () Bool)

(declare-fun e!69046 () Bool)

(assert (=> d!33026 e!69046))

(declare-fun res!86818 () Bool)

(assert (=> d!33026 (=> (not res!86818) (not e!69046))))

(declare-fun lt!155454 () (_ BitVec 64))

(declare-fun lt!155456 () (_ BitVec 64))

(declare-fun lt!155457 () (_ BitVec 64))

(assert (=> d!33026 (= res!86818 (= lt!155457 (bvsub lt!155454 lt!155456)))))

(assert (=> d!33026 (or (= (bvand lt!155454 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!155456 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!155454 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!155454 lt!155456) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33026 (= lt!155456 (remainingBits!0 ((_ sign_extend 32) (size!2224 (buf!2595 (_2!4583 lt!154712)))) ((_ sign_extend 32) (currentByte!5088 (_2!4583 lt!154712))) ((_ sign_extend 32) (currentBit!5083 (_2!4583 lt!154712)))))))

(declare-fun lt!155455 () (_ BitVec 64))

(declare-fun lt!155458 () (_ BitVec 64))

(assert (=> d!33026 (= lt!155454 (bvmul lt!155455 lt!155458))))

(assert (=> d!33026 (or (= lt!155455 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!155458 (bvsdiv (bvmul lt!155455 lt!155458) lt!155455)))))

(assert (=> d!33026 (= lt!155458 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!33026 (= lt!155455 ((_ sign_extend 32) (size!2224 (buf!2595 (_2!4583 lt!154712)))))))

(assert (=> d!33026 (= lt!155457 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5088 (_2!4583 lt!154712))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5083 (_2!4583 lt!154712)))))))

(assert (=> d!33026 (invariant!0 (currentBit!5083 (_2!4583 lt!154712)) (currentByte!5088 (_2!4583 lt!154712)) (size!2224 (buf!2595 (_2!4583 lt!154712))))))

(assert (=> d!33026 (= (bitIndex!0 (size!2224 (buf!2595 (_2!4583 lt!154712))) (currentByte!5088 (_2!4583 lt!154712)) (currentBit!5083 (_2!4583 lt!154712))) lt!155457)))

(declare-fun b!105434 () Bool)

(declare-fun res!86817 () Bool)

(assert (=> b!105434 (=> (not res!86817) (not e!69046))))

(assert (=> b!105434 (= res!86817 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!155457))))

(declare-fun b!105435 () Bool)

(declare-fun lt!155459 () (_ BitVec 64))

(assert (=> b!105435 (= e!69046 (bvsle lt!155457 (bvmul lt!155459 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!105435 (or (= lt!155459 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!155459 #b0000000000000000000000000000000000000000000000000000000000001000) lt!155459)))))

(assert (=> b!105435 (= lt!155459 ((_ sign_extend 32) (size!2224 (buf!2595 (_2!4583 lt!154712)))))))

(assert (= (and d!33026 res!86818) b!105434))

(assert (= (and b!105434 res!86817) b!105435))

(declare-fun m!154961 () Bool)

(assert (=> d!33026 m!154961))

(declare-fun m!154963 () Bool)

(assert (=> d!33026 m!154963))

(assert (=> b!105141 d!33026))

(declare-fun d!33032 () Bool)

(declare-fun lt!155486 () tuple2!8656)

(declare-fun lt!155490 () tuple2!8656)

(assert (=> d!33032 (and (= (_2!4585 lt!155486) (_2!4585 lt!155490)) (= (_1!4585 lt!155486) (_1!4585 lt!155490)))))

(declare-fun lt!155491 () (_ BitVec 64))

(declare-fun lt!155489 () BitStream!3922)

(declare-fun lt!155488 () Unit!6446)

(declare-fun lt!155487 () Bool)

(declare-fun choose!45 (BitStream!3922 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!8656 tuple2!8656 BitStream!3922 (_ BitVec 64) Bool BitStream!3922 (_ BitVec 64) tuple2!8656 tuple2!8656 BitStream!3922 (_ BitVec 64)) Unit!6446)

(assert (=> d!33032 (= lt!155488 (choose!45 (_1!4584 lt!154711) nBits!396 i!615 lt!154707 lt!155486 (tuple2!8657 (_1!4585 lt!155486) (_2!4585 lt!155486)) (_1!4585 lt!155486) (_2!4585 lt!155486) lt!155487 lt!155489 lt!155491 lt!155490 (tuple2!8657 (_1!4585 lt!155490) (_2!4585 lt!155490)) (_1!4585 lt!155490) (_2!4585 lt!155490)))))

(assert (=> d!33032 (= lt!155490 (readNLeastSignificantBitsLoopPure!0 lt!155489 nBits!396 (bvadd i!615 #b00000000000000000000000000000001) lt!155491))))

(assert (=> d!33032 (= lt!155491 (bvor lt!154707 (ite lt!155487 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33032 (= lt!155489 (withMovedBitIndex!0 (_1!4584 lt!154711) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!33032 (= lt!155487 (_2!4582 (readBitPure!0 (_1!4584 lt!154711))))))

(assert (=> d!33032 (= lt!155486 (readNLeastSignificantBitsLoopPure!0 (_1!4584 lt!154711) nBits!396 i!615 lt!154707))))

(assert (=> d!33032 (= (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4584 lt!154711) nBits!396 i!615 lt!154707) lt!155488)))

(declare-fun bs!8074 () Bool)

(assert (= bs!8074 d!33032))

(declare-fun m!154983 () Bool)

(assert (=> bs!8074 m!154983))

(assert (=> bs!8074 m!154385))

(assert (=> bs!8074 m!154333))

(assert (=> bs!8074 m!154337))

(declare-fun m!154985 () Bool)

(assert (=> bs!8074 m!154985))

(assert (=> b!105141 d!33032))

(assert (=> b!105141 d!32922))

(push 1)

(assert (not b!105373))

(assert (not d!33006))

(assert (not b!105263))

(assert (not d!32958))

(assert (not b!105415))

(assert (not d!32928))

(assert (not b!105418))

(assert (not b!105384))

(assert (not b!105264))

(assert (not d!32978))

(assert (not d!32962))

(assert (not b!105380))

(assert (not d!32922))

(assert (not d!32972))

(assert (not b!105416))

(assert (not d!33018))

(assert (not b!105241))

(assert (not b!105385))

(assert (not d!32936))

(assert (not b!105265))

(assert (not b!105270))

(assert (not d!32926))

(assert (not d!32964))

(assert (not d!33026))

(assert (not d!33012))

(assert (not b!105383))

(assert (not d!32954))

(assert (not bm!1317))

(assert (not b!105252))

(assert (not b!105417))

(assert (not d!32930))

(assert (not b!105250))

(assert (not d!32974))

(assert (not d!32960))

(assert (not b!105374))

(assert (not b!105271))

(assert (not d!32914))

(assert (not b!105377))

(assert (not b!105275))

(assert (not d!32966))

(assert (not d!32920))

(assert (not d!33024))

(assert (not d!32948))

(assert (not b!105422))

(assert (not b!105378))

(assert (not d!32976))

(assert (not d!33032))

(assert (not b!105277))

(assert (not b!105268))

(assert (not b!105269))

(assert (not d!33014))

(assert (not d!32956))

(assert (not b!105375))

(assert (not b!105266))

(assert (not b!105381))

(assert (not d!32952))

(check-sat)

(pop 1)

(push 1)

(check-sat)

