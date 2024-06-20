; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20610 () Bool)

(assert start!20610)

(declare-fun b!104261 () Bool)

(declare-fun e!68313 () Bool)

(declare-fun e!68312 () Bool)

(assert (=> b!104261 (= e!68313 e!68312)))

(declare-fun res!85849 () Bool)

(assert (=> b!104261 (=> (not res!85849) (not e!68312))))

(declare-datatypes ((array!4868 0))(
  ( (array!4869 (arr!2815 (Array (_ BitVec 32) (_ BitVec 8))) (size!2222 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3918 0))(
  ( (BitStream!3919 (buf!2588 array!4868) (currentByte!5073 (_ BitVec 32)) (currentBit!5068 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!6388 0))(
  ( (Unit!6389) )
))
(declare-datatypes ((tuple2!8622 0))(
  ( (tuple2!8623 (_1!4566 Unit!6388) (_2!4566 BitStream!3918)) )
))
(declare-fun lt!152821 () tuple2!8622)

(declare-datatypes ((tuple2!8624 0))(
  ( (tuple2!8625 (_1!4567 BitStream!3918) (_2!4567 Bool)) )
))
(declare-fun lt!152830 () tuple2!8624)

(declare-fun lt!152816 () Bool)

(assert (=> b!104261 (= res!85849 (and (= (_2!4567 lt!152830) lt!152816) (= (_1!4567 lt!152830) (_2!4566 lt!152821))))))

(declare-fun thiss!1305 () BitStream!3918)

(declare-fun readBitPure!0 (BitStream!3918) tuple2!8624)

(declare-fun readerFrom!0 (BitStream!3918 (_ BitVec 32) (_ BitVec 32)) BitStream!3918)

(assert (=> b!104261 (= lt!152830 (readBitPure!0 (readerFrom!0 (_2!4566 lt!152821) (currentBit!5068 thiss!1305) (currentByte!5073 thiss!1305))))))

(declare-fun b!104262 () Bool)

(declare-fun e!68315 () Bool)

(declare-fun e!68310 () Bool)

(assert (=> b!104262 (= e!68315 (not e!68310))))

(declare-fun res!85853 () Bool)

(assert (=> b!104262 (=> res!85853 e!68310)))

(declare-fun lt!152818 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-datatypes ((tuple2!8626 0))(
  ( (tuple2!8627 (_1!4568 BitStream!3918) (_2!4568 BitStream!3918)) )
))
(declare-fun lt!152827 () tuple2!8626)

(declare-fun i!615 () (_ BitVec 32))

(declare-datatypes ((tuple2!8628 0))(
  ( (tuple2!8629 (_1!4569 BitStream!3918) (_2!4569 (_ BitVec 64))) )
))
(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3918 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8628)

(assert (=> b!104262 (= res!85853 (not (= (_1!4569 (readNLeastSignificantBitsLoopPure!0 (_1!4568 lt!152827) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!152818)) (_2!4568 lt!152827))))))

(declare-fun lt!152813 () tuple2!8622)

(declare-fun lt!152820 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!104262 (validate_offset_bits!1 ((_ sign_extend 32) (size!2222 (buf!2588 (_2!4566 lt!152813)))) ((_ sign_extend 32) (currentByte!5073 (_2!4566 lt!152821))) ((_ sign_extend 32) (currentBit!5068 (_2!4566 lt!152821))) lt!152820)))

(declare-fun lt!152824 () Unit!6388)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3918 array!4868 (_ BitVec 64)) Unit!6388)

(assert (=> b!104262 (= lt!152824 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4566 lt!152821) (buf!2588 (_2!4566 lt!152813)) lt!152820))))

(assert (=> b!104262 (= lt!152820 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!152817 () (_ BitVec 64))

(declare-fun lt!152819 () (_ BitVec 64))

(declare-fun lt!152828 () tuple2!8624)

(assert (=> b!104262 (= lt!152818 (bvor lt!152817 (ite (_2!4567 lt!152828) lt!152819 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!152809 () tuple2!8626)

(declare-fun lt!152810 () tuple2!8628)

(assert (=> b!104262 (= lt!152810 (readNLeastSignificantBitsLoopPure!0 (_1!4568 lt!152809) nBits!396 i!615 lt!152817))))

(declare-fun lt!152807 () (_ BitVec 64))

(assert (=> b!104262 (validate_offset_bits!1 ((_ sign_extend 32) (size!2222 (buf!2588 (_2!4566 lt!152813)))) ((_ sign_extend 32) (currentByte!5073 thiss!1305)) ((_ sign_extend 32) (currentBit!5068 thiss!1305)) lt!152807)))

(declare-fun lt!152815 () Unit!6388)

(assert (=> b!104262 (= lt!152815 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2588 (_2!4566 lt!152813)) lt!152807))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!104262 (= lt!152817 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(assert (=> b!104262 (= (_2!4567 lt!152828) lt!152816)))

(assert (=> b!104262 (= lt!152828 (readBitPure!0 (_1!4568 lt!152809)))))

(declare-fun reader!0 (BitStream!3918 BitStream!3918) tuple2!8626)

(assert (=> b!104262 (= lt!152827 (reader!0 (_2!4566 lt!152821) (_2!4566 lt!152813)))))

(assert (=> b!104262 (= lt!152809 (reader!0 thiss!1305 (_2!4566 lt!152813)))))

(declare-fun e!68316 () Bool)

(assert (=> b!104262 e!68316))

(declare-fun res!85856 () Bool)

(assert (=> b!104262 (=> (not res!85856) (not e!68316))))

(declare-fun lt!152808 () tuple2!8624)

(declare-fun lt!152826 () tuple2!8624)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!104262 (= res!85856 (= (bitIndex!0 (size!2222 (buf!2588 (_1!4567 lt!152808))) (currentByte!5073 (_1!4567 lt!152808)) (currentBit!5068 (_1!4567 lt!152808))) (bitIndex!0 (size!2222 (buf!2588 (_1!4567 lt!152826))) (currentByte!5073 (_1!4567 lt!152826)) (currentBit!5068 (_1!4567 lt!152826)))))))

(declare-fun lt!152806 () Unit!6388)

(declare-fun lt!152823 () BitStream!3918)

(declare-fun readBitPrefixLemma!0 (BitStream!3918 BitStream!3918) Unit!6388)

(assert (=> b!104262 (= lt!152806 (readBitPrefixLemma!0 lt!152823 (_2!4566 lt!152813)))))

(assert (=> b!104262 (= lt!152826 (readBitPure!0 (BitStream!3919 (buf!2588 (_2!4566 lt!152813)) (currentByte!5073 thiss!1305) (currentBit!5068 thiss!1305))))))

(assert (=> b!104262 (= lt!152808 (readBitPure!0 lt!152823))))

(assert (=> b!104262 (= lt!152823 (BitStream!3919 (buf!2588 (_2!4566 lt!152821)) (currentByte!5073 thiss!1305) (currentBit!5068 thiss!1305)))))

(declare-fun e!68308 () Bool)

(assert (=> b!104262 e!68308))

(declare-fun res!85848 () Bool)

(assert (=> b!104262 (=> (not res!85848) (not e!68308))))

(declare-fun isPrefixOf!0 (BitStream!3918 BitStream!3918) Bool)

(assert (=> b!104262 (= res!85848 (isPrefixOf!0 thiss!1305 (_2!4566 lt!152813)))))

(declare-fun lt!152822 () Unit!6388)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3918 BitStream!3918 BitStream!3918) Unit!6388)

(assert (=> b!104262 (= lt!152822 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4566 lt!152821) (_2!4566 lt!152813)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3918 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8622)

(assert (=> b!104262 (= lt!152813 (appendNLeastSignificantBitsLoop!0 (_2!4566 lt!152821) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!68307 () Bool)

(assert (=> b!104262 e!68307))

(declare-fun res!85850 () Bool)

(assert (=> b!104262 (=> (not res!85850) (not e!68307))))

(assert (=> b!104262 (= res!85850 (= (size!2222 (buf!2588 thiss!1305)) (size!2222 (buf!2588 (_2!4566 lt!152821)))))))

(declare-fun appendBit!0 (BitStream!3918 Bool) tuple2!8622)

(assert (=> b!104262 (= lt!152821 (appendBit!0 thiss!1305 lt!152816))))

(assert (=> b!104262 (= lt!152816 (not (= (bvand v!199 lt!152819) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!104262 (= lt!152819 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!104263 () Bool)

(declare-fun res!85851 () Bool)

(assert (=> b!104263 (=> (not res!85851) (not e!68315))))

(assert (=> b!104263 (= res!85851 (bvslt i!615 nBits!396))))

(declare-fun b!104264 () Bool)

(declare-fun res!85852 () Bool)

(assert (=> b!104264 (=> (not res!85852) (not e!68315))))

(assert (=> b!104264 (= res!85852 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!104265 () Bool)

(assert (=> b!104265 (= e!68307 e!68313)))

(declare-fun res!85847 () Bool)

(assert (=> b!104265 (=> (not res!85847) (not e!68313))))

(declare-fun lt!152811 () (_ BitVec 64))

(declare-fun lt!152825 () (_ BitVec 64))

(assert (=> b!104265 (= res!85847 (= lt!152811 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!152825)))))

(assert (=> b!104265 (= lt!152811 (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!152821))) (currentByte!5073 (_2!4566 lt!152821)) (currentBit!5068 (_2!4566 lt!152821))))))

(assert (=> b!104265 (= lt!152825 (bitIndex!0 (size!2222 (buf!2588 thiss!1305)) (currentByte!5073 thiss!1305) (currentBit!5068 thiss!1305)))))

(declare-fun b!104266 () Bool)

(assert (=> b!104266 (= e!68312 (= (bitIndex!0 (size!2222 (buf!2588 (_1!4567 lt!152830))) (currentByte!5073 (_1!4567 lt!152830)) (currentBit!5068 (_1!4567 lt!152830))) lt!152811))))

(declare-fun b!104267 () Bool)

(declare-fun e!68309 () Bool)

(assert (=> b!104267 (= e!68309 e!68315)))

(declare-fun res!85854 () Bool)

(assert (=> b!104267 (=> (not res!85854) (not e!68315))))

(assert (=> b!104267 (= res!85854 (validate_offset_bits!1 ((_ sign_extend 32) (size!2222 (buf!2588 thiss!1305))) ((_ sign_extend 32) (currentByte!5073 thiss!1305)) ((_ sign_extend 32) (currentBit!5068 thiss!1305)) lt!152807))))

(assert (=> b!104267 (= lt!152807 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!104268 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!104268 (= e!68310 (invariant!0 (currentBit!5068 (_2!4566 lt!152813)) (currentByte!5073 (_2!4566 lt!152813)) (size!2222 (buf!2588 (_2!4566 lt!152813)))))))

(declare-fun lt!152814 () (_ BitVec 64))

(assert (=> b!104268 (= lt!152814 (bitIndex!0 (size!2222 (buf!2588 thiss!1305)) (currentByte!5073 thiss!1305) (currentBit!5068 thiss!1305)))))

(declare-fun lt!152812 () tuple2!8628)

(assert (=> b!104268 (and (= (_2!4569 lt!152810) (_2!4569 lt!152812)) (= (_1!4569 lt!152810) (_1!4569 lt!152812)))))

(declare-fun lt!152829 () Unit!6388)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!3918 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6388)

(assert (=> b!104268 (= lt!152829 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4568 lt!152809) nBits!396 i!615 lt!152817))))

(declare-fun withMovedBitIndex!0 (BitStream!3918 (_ BitVec 64)) BitStream!3918)

(assert (=> b!104268 (= lt!152812 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4568 lt!152809) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!152818))))

(declare-fun b!104269 () Bool)

(declare-fun res!85845 () Bool)

(assert (=> b!104269 (=> (not res!85845) (not e!68308))))

(assert (=> b!104269 (= res!85845 (invariant!0 (currentBit!5068 thiss!1305) (currentByte!5073 thiss!1305) (size!2222 (buf!2588 (_2!4566 lt!152821)))))))

(declare-fun b!104270 () Bool)

(assert (=> b!104270 (= e!68316 (= (_2!4567 lt!152808) (_2!4567 lt!152826)))))

(declare-fun b!104271 () Bool)

(declare-fun res!85855 () Bool)

(assert (=> b!104271 (=> (not res!85855) (not e!68313))))

(assert (=> b!104271 (= res!85855 (isPrefixOf!0 thiss!1305 (_2!4566 lt!152821)))))

(declare-fun b!104273 () Bool)

(assert (=> b!104273 (= e!68308 (invariant!0 (currentBit!5068 thiss!1305) (currentByte!5073 thiss!1305) (size!2222 (buf!2588 (_2!4566 lt!152813)))))))

(declare-fun res!85846 () Bool)

(assert (=> start!20610 (=> (not res!85846) (not e!68309))))

(assert (=> start!20610 (= res!85846 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!20610 e!68309))

(assert (=> start!20610 true))

(declare-fun e!68311 () Bool)

(declare-fun inv!12 (BitStream!3918) Bool)

(assert (=> start!20610 (and (inv!12 thiss!1305) e!68311)))

(declare-fun b!104272 () Bool)

(declare-fun array_inv!2024 (array!4868) Bool)

(assert (=> b!104272 (= e!68311 (array_inv!2024 (buf!2588 thiss!1305)))))

(assert (= (and start!20610 res!85846) b!104267))

(assert (= (and b!104267 res!85854) b!104264))

(assert (= (and b!104264 res!85852) b!104263))

(assert (= (and b!104263 res!85851) b!104262))

(assert (= (and b!104262 res!85850) b!104265))

(assert (= (and b!104265 res!85847) b!104271))

(assert (= (and b!104271 res!85855) b!104261))

(assert (= (and b!104261 res!85849) b!104266))

(assert (= (and b!104262 res!85848) b!104269))

(assert (= (and b!104269 res!85845) b!104273))

(assert (= (and b!104262 res!85856) b!104270))

(assert (= (and b!104262 (not res!85853)) b!104268))

(assert (= start!20610 b!104272))

(declare-fun m!152393 () Bool)

(assert (=> b!104267 m!152393))

(declare-fun m!152395 () Bool)

(assert (=> b!104262 m!152395))

(declare-fun m!152397 () Bool)

(assert (=> b!104262 m!152397))

(declare-fun m!152399 () Bool)

(assert (=> b!104262 m!152399))

(declare-fun m!152401 () Bool)

(assert (=> b!104262 m!152401))

(declare-fun m!152403 () Bool)

(assert (=> b!104262 m!152403))

(declare-fun m!152405 () Bool)

(assert (=> b!104262 m!152405))

(declare-fun m!152407 () Bool)

(assert (=> b!104262 m!152407))

(declare-fun m!152409 () Bool)

(assert (=> b!104262 m!152409))

(declare-fun m!152411 () Bool)

(assert (=> b!104262 m!152411))

(declare-fun m!152413 () Bool)

(assert (=> b!104262 m!152413))

(declare-fun m!152415 () Bool)

(assert (=> b!104262 m!152415))

(declare-fun m!152417 () Bool)

(assert (=> b!104262 m!152417))

(declare-fun m!152419 () Bool)

(assert (=> b!104262 m!152419))

(declare-fun m!152421 () Bool)

(assert (=> b!104262 m!152421))

(declare-fun m!152423 () Bool)

(assert (=> b!104262 m!152423))

(declare-fun m!152425 () Bool)

(assert (=> b!104262 m!152425))

(declare-fun m!152427 () Bool)

(assert (=> b!104262 m!152427))

(declare-fun m!152429 () Bool)

(assert (=> b!104262 m!152429))

(declare-fun m!152431 () Bool)

(assert (=> b!104262 m!152431))

(declare-fun m!152433 () Bool)

(assert (=> b!104261 m!152433))

(assert (=> b!104261 m!152433))

(declare-fun m!152435 () Bool)

(assert (=> b!104261 m!152435))

(declare-fun m!152437 () Bool)

(assert (=> start!20610 m!152437))

(declare-fun m!152439 () Bool)

(assert (=> b!104265 m!152439))

(declare-fun m!152441 () Bool)

(assert (=> b!104265 m!152441))

(declare-fun m!152443 () Bool)

(assert (=> b!104268 m!152443))

(declare-fun m!152445 () Bool)

(assert (=> b!104268 m!152445))

(assert (=> b!104268 m!152443))

(declare-fun m!152447 () Bool)

(assert (=> b!104268 m!152447))

(declare-fun m!152449 () Bool)

(assert (=> b!104268 m!152449))

(assert (=> b!104268 m!152441))

(declare-fun m!152451 () Bool)

(assert (=> b!104266 m!152451))

(declare-fun m!152453 () Bool)

(assert (=> b!104271 m!152453))

(declare-fun m!152455 () Bool)

(assert (=> b!104264 m!152455))

(declare-fun m!152457 () Bool)

(assert (=> b!104273 m!152457))

(declare-fun m!152459 () Bool)

(assert (=> b!104269 m!152459))

(declare-fun m!152461 () Bool)

(assert (=> b!104272 m!152461))

(check-sat (not b!104266) (not b!104265) (not b!104264) (not b!104269) (not b!104267) (not b!104268) (not b!104261) (not b!104262) (not b!104272) (not b!104273) (not b!104271) (not start!20610))
(check-sat)
(get-model)

(declare-fun d!32246 () Bool)

(assert (=> d!32246 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5068 thiss!1305) (currentByte!5073 thiss!1305) (size!2222 (buf!2588 thiss!1305))))))

(declare-fun bs!7918 () Bool)

(assert (= bs!7918 d!32246))

(declare-fun m!152533 () Bool)

(assert (=> bs!7918 m!152533))

(assert (=> start!20610 d!32246))

(declare-fun d!32248 () Bool)

(assert (=> d!32248 (= (invariant!0 (currentBit!5068 thiss!1305) (currentByte!5073 thiss!1305) (size!2222 (buf!2588 (_2!4566 lt!152813)))) (and (bvsge (currentBit!5068 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5068 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5073 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5073 thiss!1305) (size!2222 (buf!2588 (_2!4566 lt!152813)))) (and (= (currentBit!5068 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5073 thiss!1305) (size!2222 (buf!2588 (_2!4566 lt!152813))))))))))

(assert (=> b!104273 d!32248))

(declare-fun d!32250 () Bool)

(assert (=> d!32250 (= (onesLSBLong!0 (bvsub nBits!396 i!615)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!396 i!615)))))))

(assert (=> b!104262 d!32250))

(declare-fun d!32252 () Bool)

(declare-fun e!68349 () Bool)

(assert (=> d!32252 e!68349))

(declare-fun res!85895 () Bool)

(assert (=> d!32252 (=> (not res!85895) (not e!68349))))

(declare-fun lt!152917 () tuple2!8624)

(declare-fun lt!152915 () tuple2!8624)

(assert (=> d!32252 (= res!85895 (= (bitIndex!0 (size!2222 (buf!2588 (_1!4567 lt!152917))) (currentByte!5073 (_1!4567 lt!152917)) (currentBit!5068 (_1!4567 lt!152917))) (bitIndex!0 (size!2222 (buf!2588 (_1!4567 lt!152915))) (currentByte!5073 (_1!4567 lt!152915)) (currentBit!5068 (_1!4567 lt!152915)))))))

(declare-fun lt!152914 () BitStream!3918)

(declare-fun lt!152916 () Unit!6388)

(declare-fun choose!50 (BitStream!3918 BitStream!3918 BitStream!3918 tuple2!8624 tuple2!8624 BitStream!3918 Bool tuple2!8624 tuple2!8624 BitStream!3918 Bool) Unit!6388)

(assert (=> d!32252 (= lt!152916 (choose!50 lt!152823 (_2!4566 lt!152813) lt!152914 lt!152917 (tuple2!8625 (_1!4567 lt!152917) (_2!4567 lt!152917)) (_1!4567 lt!152917) (_2!4567 lt!152917) lt!152915 (tuple2!8625 (_1!4567 lt!152915) (_2!4567 lt!152915)) (_1!4567 lt!152915) (_2!4567 lt!152915)))))

(assert (=> d!32252 (= lt!152915 (readBitPure!0 lt!152914))))

(assert (=> d!32252 (= lt!152917 (readBitPure!0 lt!152823))))

(assert (=> d!32252 (= lt!152914 (BitStream!3919 (buf!2588 (_2!4566 lt!152813)) (currentByte!5073 lt!152823) (currentBit!5068 lt!152823)))))

(assert (=> d!32252 (invariant!0 (currentBit!5068 lt!152823) (currentByte!5073 lt!152823) (size!2222 (buf!2588 (_2!4566 lt!152813))))))

(assert (=> d!32252 (= (readBitPrefixLemma!0 lt!152823 (_2!4566 lt!152813)) lt!152916)))

(declare-fun b!104315 () Bool)

(assert (=> b!104315 (= e!68349 (= (_2!4567 lt!152917) (_2!4567 lt!152915)))))

(assert (= (and d!32252 res!85895) b!104315))

(assert (=> d!32252 m!152423))

(declare-fun m!152535 () Bool)

(assert (=> d!32252 m!152535))

(declare-fun m!152537 () Bool)

(assert (=> d!32252 m!152537))

(declare-fun m!152539 () Bool)

(assert (=> d!32252 m!152539))

(declare-fun m!152541 () Bool)

(assert (=> d!32252 m!152541))

(declare-fun m!152543 () Bool)

(assert (=> d!32252 m!152543))

(assert (=> b!104262 d!32252))

(declare-fun d!32254 () Bool)

(assert (=> d!32254 (validate_offset_bits!1 ((_ sign_extend 32) (size!2222 (buf!2588 (_2!4566 lt!152813)))) ((_ sign_extend 32) (currentByte!5073 (_2!4566 lt!152821))) ((_ sign_extend 32) (currentBit!5068 (_2!4566 lt!152821))) lt!152820)))

(declare-fun lt!152920 () Unit!6388)

(declare-fun choose!9 (BitStream!3918 array!4868 (_ BitVec 64) BitStream!3918) Unit!6388)

(assert (=> d!32254 (= lt!152920 (choose!9 (_2!4566 lt!152821) (buf!2588 (_2!4566 lt!152813)) lt!152820 (BitStream!3919 (buf!2588 (_2!4566 lt!152813)) (currentByte!5073 (_2!4566 lt!152821)) (currentBit!5068 (_2!4566 lt!152821)))))))

(assert (=> d!32254 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4566 lt!152821) (buf!2588 (_2!4566 lt!152813)) lt!152820) lt!152920)))

(declare-fun bs!7919 () Bool)

(assert (= bs!7919 d!32254))

(assert (=> bs!7919 m!152421))

(declare-fun m!152545 () Bool)

(assert (=> bs!7919 m!152545))

(assert (=> b!104262 d!32254))

(declare-fun d!32256 () Bool)

(declare-datatypes ((tuple2!8642 0))(
  ( (tuple2!8643 (_1!4576 Bool) (_2!4576 BitStream!3918)) )
))
(declare-fun lt!152923 () tuple2!8642)

(declare-fun readBit!0 (BitStream!3918) tuple2!8642)

(assert (=> d!32256 (= lt!152923 (readBit!0 (_1!4568 lt!152809)))))

(assert (=> d!32256 (= (readBitPure!0 (_1!4568 lt!152809)) (tuple2!8625 (_2!4576 lt!152923) (_1!4576 lt!152923)))))

(declare-fun bs!7920 () Bool)

(assert (= bs!7920 d!32256))

(declare-fun m!152547 () Bool)

(assert (=> bs!7920 m!152547))

(assert (=> b!104262 d!32256))

(declare-fun d!32258 () Bool)

(declare-datatypes ((tuple2!8644 0))(
  ( (tuple2!8645 (_1!4577 (_ BitVec 64)) (_2!4577 BitStream!3918)) )
))
(declare-fun lt!152926 () tuple2!8644)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!3918 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8644)

(assert (=> d!32258 (= lt!152926 (readNLeastSignificantBitsLoop!0 (_1!4568 lt!152809) nBits!396 i!615 lt!152817))))

(assert (=> d!32258 (= (readNLeastSignificantBitsLoopPure!0 (_1!4568 lt!152809) nBits!396 i!615 lt!152817) (tuple2!8629 (_2!4577 lt!152926) (_1!4577 lt!152926)))))

(declare-fun bs!7921 () Bool)

(assert (= bs!7921 d!32258))

(declare-fun m!152549 () Bool)

(assert (=> bs!7921 m!152549))

(assert (=> b!104262 d!32258))

(declare-fun b!104326 () Bool)

(declare-fun res!85904 () Bool)

(declare-fun e!68354 () Bool)

(assert (=> b!104326 (=> (not res!85904) (not e!68354))))

(declare-fun lt!152968 () tuple2!8626)

(assert (=> b!104326 (= res!85904 (isPrefixOf!0 (_2!4568 lt!152968) (_2!4566 lt!152813)))))

(declare-fun b!104327 () Bool)

(declare-fun e!68355 () Unit!6388)

(declare-fun lt!152980 () Unit!6388)

(assert (=> b!104327 (= e!68355 lt!152980)))

(declare-fun lt!152977 () (_ BitVec 64))

(assert (=> b!104327 (= lt!152977 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!152986 () (_ BitVec 64))

(assert (=> b!104327 (= lt!152986 (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!152821))) (currentByte!5073 (_2!4566 lt!152821)) (currentBit!5068 (_2!4566 lt!152821))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!4868 array!4868 (_ BitVec 64) (_ BitVec 64)) Unit!6388)

(assert (=> b!104327 (= lt!152980 (arrayBitRangesEqSymmetric!0 (buf!2588 (_2!4566 lt!152821)) (buf!2588 (_2!4566 lt!152813)) lt!152977 lt!152986))))

(declare-fun arrayBitRangesEq!0 (array!4868 array!4868 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!104327 (arrayBitRangesEq!0 (buf!2588 (_2!4566 lt!152813)) (buf!2588 (_2!4566 lt!152821)) lt!152977 lt!152986)))

(declare-fun b!104328 () Bool)

(declare-fun Unit!6393 () Unit!6388)

(assert (=> b!104328 (= e!68355 Unit!6393)))

(declare-fun d!32260 () Bool)

(assert (=> d!32260 e!68354))

(declare-fun res!85903 () Bool)

(assert (=> d!32260 (=> (not res!85903) (not e!68354))))

(assert (=> d!32260 (= res!85903 (isPrefixOf!0 (_1!4568 lt!152968) (_2!4568 lt!152968)))))

(declare-fun lt!152978 () BitStream!3918)

(assert (=> d!32260 (= lt!152968 (tuple2!8627 lt!152978 (_2!4566 lt!152813)))))

(declare-fun lt!152974 () Unit!6388)

(declare-fun lt!152972 () Unit!6388)

(assert (=> d!32260 (= lt!152974 lt!152972)))

(assert (=> d!32260 (isPrefixOf!0 lt!152978 (_2!4566 lt!152813))))

(assert (=> d!32260 (= lt!152972 (lemmaIsPrefixTransitive!0 lt!152978 (_2!4566 lt!152813) (_2!4566 lt!152813)))))

(declare-fun lt!152969 () Unit!6388)

(declare-fun lt!152971 () Unit!6388)

(assert (=> d!32260 (= lt!152969 lt!152971)))

(assert (=> d!32260 (isPrefixOf!0 lt!152978 (_2!4566 lt!152813))))

(assert (=> d!32260 (= lt!152971 (lemmaIsPrefixTransitive!0 lt!152978 (_2!4566 lt!152821) (_2!4566 lt!152813)))))

(declare-fun lt!152982 () Unit!6388)

(assert (=> d!32260 (= lt!152982 e!68355)))

(declare-fun c!6419 () Bool)

(assert (=> d!32260 (= c!6419 (not (= (size!2222 (buf!2588 (_2!4566 lt!152821))) #b00000000000000000000000000000000)))))

(declare-fun lt!152984 () Unit!6388)

(declare-fun lt!152983 () Unit!6388)

(assert (=> d!32260 (= lt!152984 lt!152983)))

(assert (=> d!32260 (isPrefixOf!0 (_2!4566 lt!152813) (_2!4566 lt!152813))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!3918) Unit!6388)

(assert (=> d!32260 (= lt!152983 (lemmaIsPrefixRefl!0 (_2!4566 lt!152813)))))

(declare-fun lt!152967 () Unit!6388)

(declare-fun lt!152985 () Unit!6388)

(assert (=> d!32260 (= lt!152967 lt!152985)))

(assert (=> d!32260 (= lt!152985 (lemmaIsPrefixRefl!0 (_2!4566 lt!152813)))))

(declare-fun lt!152973 () Unit!6388)

(declare-fun lt!152976 () Unit!6388)

(assert (=> d!32260 (= lt!152973 lt!152976)))

(assert (=> d!32260 (isPrefixOf!0 lt!152978 lt!152978)))

(assert (=> d!32260 (= lt!152976 (lemmaIsPrefixRefl!0 lt!152978))))

(declare-fun lt!152979 () Unit!6388)

(declare-fun lt!152970 () Unit!6388)

(assert (=> d!32260 (= lt!152979 lt!152970)))

(assert (=> d!32260 (isPrefixOf!0 (_2!4566 lt!152821) (_2!4566 lt!152821))))

(assert (=> d!32260 (= lt!152970 (lemmaIsPrefixRefl!0 (_2!4566 lt!152821)))))

(assert (=> d!32260 (= lt!152978 (BitStream!3919 (buf!2588 (_2!4566 lt!152813)) (currentByte!5073 (_2!4566 lt!152821)) (currentBit!5068 (_2!4566 lt!152821))))))

(assert (=> d!32260 (isPrefixOf!0 (_2!4566 lt!152821) (_2!4566 lt!152813))))

(assert (=> d!32260 (= (reader!0 (_2!4566 lt!152821) (_2!4566 lt!152813)) lt!152968)))

(declare-fun b!104329 () Bool)

(declare-fun res!85902 () Bool)

(assert (=> b!104329 (=> (not res!85902) (not e!68354))))

(assert (=> b!104329 (= res!85902 (isPrefixOf!0 (_1!4568 lt!152968) (_2!4566 lt!152821)))))

(declare-fun lt!152981 () (_ BitVec 64))

(declare-fun b!104330 () Bool)

(declare-fun lt!152975 () (_ BitVec 64))

(assert (=> b!104330 (= e!68354 (= (_1!4568 lt!152968) (withMovedBitIndex!0 (_2!4568 lt!152968) (bvsub lt!152975 lt!152981))))))

(assert (=> b!104330 (or (= (bvand lt!152975 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!152981 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!152975 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!152975 lt!152981) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!104330 (= lt!152981 (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!152813))) (currentByte!5073 (_2!4566 lt!152813)) (currentBit!5068 (_2!4566 lt!152813))))))

(assert (=> b!104330 (= lt!152975 (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!152821))) (currentByte!5073 (_2!4566 lt!152821)) (currentBit!5068 (_2!4566 lt!152821))))))

(assert (= (and d!32260 c!6419) b!104327))

(assert (= (and d!32260 (not c!6419)) b!104328))

(assert (= (and d!32260 res!85903) b!104329))

(assert (= (and b!104329 res!85902) b!104326))

(assert (= (and b!104326 res!85904) b!104330))

(declare-fun m!152551 () Bool)

(assert (=> b!104329 m!152551))

(declare-fun m!152553 () Bool)

(assert (=> b!104326 m!152553))

(declare-fun m!152555 () Bool)

(assert (=> d!32260 m!152555))

(declare-fun m!152557 () Bool)

(assert (=> d!32260 m!152557))

(declare-fun m!152559 () Bool)

(assert (=> d!32260 m!152559))

(declare-fun m!152561 () Bool)

(assert (=> d!32260 m!152561))

(declare-fun m!152563 () Bool)

(assert (=> d!32260 m!152563))

(declare-fun m!152565 () Bool)

(assert (=> d!32260 m!152565))

(declare-fun m!152567 () Bool)

(assert (=> d!32260 m!152567))

(declare-fun m!152569 () Bool)

(assert (=> d!32260 m!152569))

(declare-fun m!152571 () Bool)

(assert (=> d!32260 m!152571))

(declare-fun m!152573 () Bool)

(assert (=> d!32260 m!152573))

(declare-fun m!152575 () Bool)

(assert (=> d!32260 m!152575))

(assert (=> b!104327 m!152439))

(declare-fun m!152577 () Bool)

(assert (=> b!104327 m!152577))

(declare-fun m!152579 () Bool)

(assert (=> b!104327 m!152579))

(declare-fun m!152581 () Bool)

(assert (=> b!104330 m!152581))

(declare-fun m!152583 () Bool)

(assert (=> b!104330 m!152583))

(assert (=> b!104330 m!152439))

(assert (=> b!104262 d!32260))

(declare-fun b!104331 () Bool)

(declare-fun res!85907 () Bool)

(declare-fun e!68356 () Bool)

(assert (=> b!104331 (=> (not res!85907) (not e!68356))))

(declare-fun lt!152988 () tuple2!8626)

(assert (=> b!104331 (= res!85907 (isPrefixOf!0 (_2!4568 lt!152988) (_2!4566 lt!152813)))))

(declare-fun b!104332 () Bool)

(declare-fun e!68357 () Unit!6388)

(declare-fun lt!153000 () Unit!6388)

(assert (=> b!104332 (= e!68357 lt!153000)))

(declare-fun lt!152997 () (_ BitVec 64))

(assert (=> b!104332 (= lt!152997 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!153006 () (_ BitVec 64))

(assert (=> b!104332 (= lt!153006 (bitIndex!0 (size!2222 (buf!2588 thiss!1305)) (currentByte!5073 thiss!1305) (currentBit!5068 thiss!1305)))))

(assert (=> b!104332 (= lt!153000 (arrayBitRangesEqSymmetric!0 (buf!2588 thiss!1305) (buf!2588 (_2!4566 lt!152813)) lt!152997 lt!153006))))

(assert (=> b!104332 (arrayBitRangesEq!0 (buf!2588 (_2!4566 lt!152813)) (buf!2588 thiss!1305) lt!152997 lt!153006)))

(declare-fun b!104333 () Bool)

(declare-fun Unit!6399 () Unit!6388)

(assert (=> b!104333 (= e!68357 Unit!6399)))

(declare-fun d!32262 () Bool)

(assert (=> d!32262 e!68356))

(declare-fun res!85906 () Bool)

(assert (=> d!32262 (=> (not res!85906) (not e!68356))))

(assert (=> d!32262 (= res!85906 (isPrefixOf!0 (_1!4568 lt!152988) (_2!4568 lt!152988)))))

(declare-fun lt!152998 () BitStream!3918)

(assert (=> d!32262 (= lt!152988 (tuple2!8627 lt!152998 (_2!4566 lt!152813)))))

(declare-fun lt!152994 () Unit!6388)

(declare-fun lt!152992 () Unit!6388)

(assert (=> d!32262 (= lt!152994 lt!152992)))

(assert (=> d!32262 (isPrefixOf!0 lt!152998 (_2!4566 lt!152813))))

(assert (=> d!32262 (= lt!152992 (lemmaIsPrefixTransitive!0 lt!152998 (_2!4566 lt!152813) (_2!4566 lt!152813)))))

(declare-fun lt!152989 () Unit!6388)

(declare-fun lt!152991 () Unit!6388)

(assert (=> d!32262 (= lt!152989 lt!152991)))

(assert (=> d!32262 (isPrefixOf!0 lt!152998 (_2!4566 lt!152813))))

(assert (=> d!32262 (= lt!152991 (lemmaIsPrefixTransitive!0 lt!152998 thiss!1305 (_2!4566 lt!152813)))))

(declare-fun lt!153002 () Unit!6388)

(assert (=> d!32262 (= lt!153002 e!68357)))

(declare-fun c!6420 () Bool)

(assert (=> d!32262 (= c!6420 (not (= (size!2222 (buf!2588 thiss!1305)) #b00000000000000000000000000000000)))))

(declare-fun lt!153004 () Unit!6388)

(declare-fun lt!153003 () Unit!6388)

(assert (=> d!32262 (= lt!153004 lt!153003)))

(assert (=> d!32262 (isPrefixOf!0 (_2!4566 lt!152813) (_2!4566 lt!152813))))

(assert (=> d!32262 (= lt!153003 (lemmaIsPrefixRefl!0 (_2!4566 lt!152813)))))

(declare-fun lt!152987 () Unit!6388)

(declare-fun lt!153005 () Unit!6388)

(assert (=> d!32262 (= lt!152987 lt!153005)))

(assert (=> d!32262 (= lt!153005 (lemmaIsPrefixRefl!0 (_2!4566 lt!152813)))))

(declare-fun lt!152993 () Unit!6388)

(declare-fun lt!152996 () Unit!6388)

(assert (=> d!32262 (= lt!152993 lt!152996)))

(assert (=> d!32262 (isPrefixOf!0 lt!152998 lt!152998)))

(assert (=> d!32262 (= lt!152996 (lemmaIsPrefixRefl!0 lt!152998))))

(declare-fun lt!152999 () Unit!6388)

(declare-fun lt!152990 () Unit!6388)

(assert (=> d!32262 (= lt!152999 lt!152990)))

(assert (=> d!32262 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!32262 (= lt!152990 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (=> d!32262 (= lt!152998 (BitStream!3919 (buf!2588 (_2!4566 lt!152813)) (currentByte!5073 thiss!1305) (currentBit!5068 thiss!1305)))))

(assert (=> d!32262 (isPrefixOf!0 thiss!1305 (_2!4566 lt!152813))))

(assert (=> d!32262 (= (reader!0 thiss!1305 (_2!4566 lt!152813)) lt!152988)))

(declare-fun b!104334 () Bool)

(declare-fun res!85905 () Bool)

(assert (=> b!104334 (=> (not res!85905) (not e!68356))))

(assert (=> b!104334 (= res!85905 (isPrefixOf!0 (_1!4568 lt!152988) thiss!1305))))

(declare-fun b!104335 () Bool)

(declare-fun lt!152995 () (_ BitVec 64))

(declare-fun lt!153001 () (_ BitVec 64))

(assert (=> b!104335 (= e!68356 (= (_1!4568 lt!152988) (withMovedBitIndex!0 (_2!4568 lt!152988) (bvsub lt!152995 lt!153001))))))

(assert (=> b!104335 (or (= (bvand lt!152995 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!153001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!152995 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!152995 lt!153001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!104335 (= lt!153001 (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!152813))) (currentByte!5073 (_2!4566 lt!152813)) (currentBit!5068 (_2!4566 lt!152813))))))

(assert (=> b!104335 (= lt!152995 (bitIndex!0 (size!2222 (buf!2588 thiss!1305)) (currentByte!5073 thiss!1305) (currentBit!5068 thiss!1305)))))

(assert (= (and d!32262 c!6420) b!104332))

(assert (= (and d!32262 (not c!6420)) b!104333))

(assert (= (and d!32262 res!85906) b!104334))

(assert (= (and b!104334 res!85905) b!104331))

(assert (= (and b!104331 res!85907) b!104335))

(declare-fun m!152585 () Bool)

(assert (=> b!104334 m!152585))

(declare-fun m!152587 () Bool)

(assert (=> b!104331 m!152587))

(declare-fun m!152589 () Bool)

(assert (=> d!32262 m!152589))

(declare-fun m!152591 () Bool)

(assert (=> d!32262 m!152591))

(declare-fun m!152593 () Bool)

(assert (=> d!32262 m!152593))

(declare-fun m!152595 () Bool)

(assert (=> d!32262 m!152595))

(declare-fun m!152597 () Bool)

(assert (=> d!32262 m!152597))

(assert (=> d!32262 m!152565))

(declare-fun m!152599 () Bool)

(assert (=> d!32262 m!152599))

(declare-fun m!152601 () Bool)

(assert (=> d!32262 m!152601))

(assert (=> d!32262 m!152413))

(assert (=> d!32262 m!152573))

(declare-fun m!152603 () Bool)

(assert (=> d!32262 m!152603))

(assert (=> b!104332 m!152441))

(declare-fun m!152605 () Bool)

(assert (=> b!104332 m!152605))

(declare-fun m!152607 () Bool)

(assert (=> b!104332 m!152607))

(declare-fun m!152609 () Bool)

(assert (=> b!104335 m!152609))

(assert (=> b!104335 m!152583))

(assert (=> b!104335 m!152441))

(assert (=> b!104262 d!32262))

(declare-fun d!32264 () Bool)

(declare-fun e!68360 () Bool)

(assert (=> d!32264 e!68360))

(declare-fun res!85913 () Bool)

(assert (=> d!32264 (=> (not res!85913) (not e!68360))))

(declare-fun lt!153021 () (_ BitVec 64))

(declare-fun lt!153022 () (_ BitVec 64))

(declare-fun lt!153023 () (_ BitVec 64))

(assert (=> d!32264 (= res!85913 (= lt!153022 (bvsub lt!153021 lt!153023)))))

(assert (=> d!32264 (or (= (bvand lt!153021 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!153023 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!153021 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!153021 lt!153023) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!32264 (= lt!153023 (remainingBits!0 ((_ sign_extend 32) (size!2222 (buf!2588 (_1!4567 lt!152826)))) ((_ sign_extend 32) (currentByte!5073 (_1!4567 lt!152826))) ((_ sign_extend 32) (currentBit!5068 (_1!4567 lt!152826)))))))

(declare-fun lt!153020 () (_ BitVec 64))

(declare-fun lt!153019 () (_ BitVec 64))

(assert (=> d!32264 (= lt!153021 (bvmul lt!153020 lt!153019))))

(assert (=> d!32264 (or (= lt!153020 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!153019 (bvsdiv (bvmul lt!153020 lt!153019) lt!153020)))))

(assert (=> d!32264 (= lt!153019 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!32264 (= lt!153020 ((_ sign_extend 32) (size!2222 (buf!2588 (_1!4567 lt!152826)))))))

(assert (=> d!32264 (= lt!153022 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5073 (_1!4567 lt!152826))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5068 (_1!4567 lt!152826)))))))

(assert (=> d!32264 (invariant!0 (currentBit!5068 (_1!4567 lt!152826)) (currentByte!5073 (_1!4567 lt!152826)) (size!2222 (buf!2588 (_1!4567 lt!152826))))))

(assert (=> d!32264 (= (bitIndex!0 (size!2222 (buf!2588 (_1!4567 lt!152826))) (currentByte!5073 (_1!4567 lt!152826)) (currentBit!5068 (_1!4567 lt!152826))) lt!153022)))

(declare-fun b!104340 () Bool)

(declare-fun res!85912 () Bool)

(assert (=> b!104340 (=> (not res!85912) (not e!68360))))

(assert (=> b!104340 (= res!85912 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!153022))))

(declare-fun b!104341 () Bool)

(declare-fun lt!153024 () (_ BitVec 64))

(assert (=> b!104341 (= e!68360 (bvsle lt!153022 (bvmul lt!153024 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!104341 (or (= lt!153024 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!153024 #b0000000000000000000000000000000000000000000000000000000000001000) lt!153024)))))

(assert (=> b!104341 (= lt!153024 ((_ sign_extend 32) (size!2222 (buf!2588 (_1!4567 lt!152826)))))))

(assert (= (and d!32264 res!85913) b!104340))

(assert (= (and b!104340 res!85912) b!104341))

(declare-fun m!152611 () Bool)

(assert (=> d!32264 m!152611))

(declare-fun m!152613 () Bool)

(assert (=> d!32264 m!152613))

(assert (=> b!104262 d!32264))

(declare-fun d!32266 () Bool)

(declare-fun lt!153025 () tuple2!8644)

(assert (=> d!32266 (= lt!153025 (readNLeastSignificantBitsLoop!0 (_1!4568 lt!152827) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!152818))))

(assert (=> d!32266 (= (readNLeastSignificantBitsLoopPure!0 (_1!4568 lt!152827) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!152818) (tuple2!8629 (_2!4577 lt!153025) (_1!4577 lt!153025)))))

(declare-fun bs!7922 () Bool)

(assert (= bs!7922 d!32266))

(declare-fun m!152615 () Bool)

(assert (=> bs!7922 m!152615))

(assert (=> b!104262 d!32266))

(declare-fun b!104451 () Bool)

(declare-fun e!68426 () Bool)

(declare-fun lt!153460 () tuple2!8624)

(declare-fun lt!153437 () tuple2!8624)

(assert (=> b!104451 (= e!68426 (= (_2!4567 lt!153460) (_2!4567 lt!153437)))))

(declare-fun b!104453 () Bool)

(declare-fun e!68422 () tuple2!8622)

(declare-fun lt!153454 () Unit!6388)

(assert (=> b!104453 (= e!68422 (tuple2!8623 lt!153454 (_2!4566 lt!152821)))))

(declare-fun lt!153423 () BitStream!3918)

(assert (=> b!104453 (= lt!153423 (_2!4566 lt!152821))))

(assert (=> b!104453 (= lt!153454 (lemmaIsPrefixRefl!0 lt!153423))))

(declare-fun call!1297 () Bool)

(assert (=> b!104453 call!1297))

(declare-fun b!104454 () Bool)

(declare-fun e!68425 () (_ BitVec 64))

(assert (=> b!104454 (= e!68425 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun b!104455 () Bool)

(declare-fun lt!153443 () tuple2!8624)

(declare-fun lt!153424 () tuple2!8622)

(assert (=> b!104455 (= lt!153443 (readBitPure!0 (readerFrom!0 (_2!4566 lt!153424) (currentBit!5068 (_2!4566 lt!152821)) (currentByte!5073 (_2!4566 lt!152821)))))))

(declare-fun res!86001 () Bool)

(declare-fun lt!153431 () Bool)

(assert (=> b!104455 (= res!86001 (and (= (_2!4567 lt!153443) lt!153431) (= (_1!4567 lt!153443) (_2!4566 lt!153424))))))

(declare-fun e!68421 () Bool)

(assert (=> b!104455 (=> (not res!86001) (not e!68421))))

(declare-fun e!68423 () Bool)

(assert (=> b!104455 (= e!68423 e!68421)))

(declare-fun bm!1294 () Bool)

(declare-fun c!6434 () Bool)

(assert (=> bm!1294 (= call!1297 (isPrefixOf!0 (ite c!6434 (_2!4566 lt!152821) lt!153423) (ite c!6434 (_2!4566 lt!153424) lt!153423)))))

(declare-fun b!104456 () Bool)

(declare-fun lt!153463 () tuple2!8622)

(declare-fun Unit!6402 () Unit!6388)

(assert (=> b!104456 (= e!68422 (tuple2!8623 Unit!6402 (_2!4566 lt!153463)))))

(assert (=> b!104456 (= lt!153431 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!104456 (= lt!153424 (appendBit!0 (_2!4566 lt!152821) lt!153431))))

(declare-fun res!85998 () Bool)

(assert (=> b!104456 (= res!85998 (= (size!2222 (buf!2588 (_2!4566 lt!152821))) (size!2222 (buf!2588 (_2!4566 lt!153424)))))))

(assert (=> b!104456 (=> (not res!85998) (not e!68423))))

(assert (=> b!104456 e!68423))

(declare-fun lt!153449 () tuple2!8622)

(assert (=> b!104456 (= lt!153449 lt!153424)))

(assert (=> b!104456 (= lt!153463 (appendNLeastSignificantBitsLoop!0 (_2!4566 lt!153449) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!153439 () Unit!6388)

(assert (=> b!104456 (= lt!153439 (lemmaIsPrefixTransitive!0 (_2!4566 lt!152821) (_2!4566 lt!153449) (_2!4566 lt!153463)))))

(assert (=> b!104456 (isPrefixOf!0 (_2!4566 lt!152821) (_2!4566 lt!153463))))

(declare-fun lt!153435 () Unit!6388)

(assert (=> b!104456 (= lt!153435 lt!153439)))

(assert (=> b!104456 (invariant!0 (currentBit!5068 (_2!4566 lt!152821)) (currentByte!5073 (_2!4566 lt!152821)) (size!2222 (buf!2588 (_2!4566 lt!153449))))))

(declare-fun lt!153456 () BitStream!3918)

(assert (=> b!104456 (= lt!153456 (BitStream!3919 (buf!2588 (_2!4566 lt!153449)) (currentByte!5073 (_2!4566 lt!152821)) (currentBit!5068 (_2!4566 lt!152821))))))

(assert (=> b!104456 (invariant!0 (currentBit!5068 lt!153456) (currentByte!5073 lt!153456) (size!2222 (buf!2588 (_2!4566 lt!153463))))))

(declare-fun lt!153453 () BitStream!3918)

(assert (=> b!104456 (= lt!153453 (BitStream!3919 (buf!2588 (_2!4566 lt!153463)) (currentByte!5073 lt!153456) (currentBit!5068 lt!153456)))))

(assert (=> b!104456 (= lt!153460 (readBitPure!0 lt!153456))))

(assert (=> b!104456 (= lt!153437 (readBitPure!0 lt!153453))))

(declare-fun lt!153447 () Unit!6388)

(assert (=> b!104456 (= lt!153447 (readBitPrefixLemma!0 lt!153456 (_2!4566 lt!153463)))))

(declare-fun res!86003 () Bool)

(assert (=> b!104456 (= res!86003 (= (bitIndex!0 (size!2222 (buf!2588 (_1!4567 lt!153460))) (currentByte!5073 (_1!4567 lt!153460)) (currentBit!5068 (_1!4567 lt!153460))) (bitIndex!0 (size!2222 (buf!2588 (_1!4567 lt!153437))) (currentByte!5073 (_1!4567 lt!153437)) (currentBit!5068 (_1!4567 lt!153437)))))))

(assert (=> b!104456 (=> (not res!86003) (not e!68426))))

(assert (=> b!104456 e!68426))

(declare-fun lt!153420 () Unit!6388)

(assert (=> b!104456 (= lt!153420 lt!153447)))

(declare-fun lt!153433 () tuple2!8626)

(assert (=> b!104456 (= lt!153433 (reader!0 (_2!4566 lt!152821) (_2!4566 lt!153463)))))

(declare-fun lt!153465 () tuple2!8626)

(assert (=> b!104456 (= lt!153465 (reader!0 (_2!4566 lt!153449) (_2!4566 lt!153463)))))

(declare-fun lt!153432 () tuple2!8624)

(assert (=> b!104456 (= lt!153432 (readBitPure!0 (_1!4568 lt!153433)))))

(assert (=> b!104456 (= (_2!4567 lt!153432) lt!153431)))

(declare-fun lt!153430 () Unit!6388)

(declare-fun Unit!6404 () Unit!6388)

(assert (=> b!104456 (= lt!153430 Unit!6404)))

(declare-fun lt!153422 () (_ BitVec 64))

(assert (=> b!104456 (= lt!153422 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!153421 () (_ BitVec 64))

(assert (=> b!104456 (= lt!153421 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!153455 () Unit!6388)

(assert (=> b!104456 (= lt!153455 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4566 lt!152821) (buf!2588 (_2!4566 lt!153463)) lt!153421))))

(assert (=> b!104456 (validate_offset_bits!1 ((_ sign_extend 32) (size!2222 (buf!2588 (_2!4566 lt!153463)))) ((_ sign_extend 32) (currentByte!5073 (_2!4566 lt!152821))) ((_ sign_extend 32) (currentBit!5068 (_2!4566 lt!152821))) lt!153421)))

(declare-fun lt!153448 () Unit!6388)

(assert (=> b!104456 (= lt!153448 lt!153455)))

(declare-fun lt!153445 () tuple2!8628)

(assert (=> b!104456 (= lt!153445 (readNLeastSignificantBitsLoopPure!0 (_1!4568 lt!153433) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!153422))))

(declare-fun lt!153440 () (_ BitVec 64))

(assert (=> b!104456 (= lt!153440 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!153438 () Unit!6388)

(assert (=> b!104456 (= lt!153438 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4566 lt!153449) (buf!2588 (_2!4566 lt!153463)) lt!153440))))

(assert (=> b!104456 (validate_offset_bits!1 ((_ sign_extend 32) (size!2222 (buf!2588 (_2!4566 lt!153463)))) ((_ sign_extend 32) (currentByte!5073 (_2!4566 lt!153449))) ((_ sign_extend 32) (currentBit!5068 (_2!4566 lt!153449))) lt!153440)))

(declare-fun lt!153442 () Unit!6388)

(assert (=> b!104456 (= lt!153442 lt!153438)))

(declare-fun lt!153452 () tuple2!8628)

(assert (=> b!104456 (= lt!153452 (readNLeastSignificantBitsLoopPure!0 (_1!4568 lt!153465) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!153422 (ite (_2!4567 lt!153432) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!153444 () tuple2!8628)

(assert (=> b!104456 (= lt!153444 (readNLeastSignificantBitsLoopPure!0 (_1!4568 lt!153433) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!153422))))

(declare-fun c!6435 () Bool)

(assert (=> b!104456 (= c!6435 (_2!4567 (readBitPure!0 (_1!4568 lt!153433))))))

(declare-fun lt!153462 () tuple2!8628)

(assert (=> b!104456 (= lt!153462 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4568 lt!153433) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!153422 e!68425)))))

(declare-fun lt!153436 () Unit!6388)

(assert (=> b!104456 (= lt!153436 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4568 lt!153433) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!153422))))

(assert (=> b!104456 (and (= (_2!4569 lt!153444) (_2!4569 lt!153462)) (= (_1!4569 lt!153444) (_1!4569 lt!153462)))))

(declare-fun lt!153450 () Unit!6388)

(assert (=> b!104456 (= lt!153450 lt!153436)))

(assert (=> b!104456 (= (_1!4568 lt!153433) (withMovedBitIndex!0 (_2!4568 lt!153433) (bvsub (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!152821))) (currentByte!5073 (_2!4566 lt!152821)) (currentBit!5068 (_2!4566 lt!152821))) (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!153463))) (currentByte!5073 (_2!4566 lt!153463)) (currentBit!5068 (_2!4566 lt!153463))))))))

(declare-fun lt!153461 () Unit!6388)

(declare-fun Unit!6409 () Unit!6388)

(assert (=> b!104456 (= lt!153461 Unit!6409)))

(assert (=> b!104456 (= (_1!4568 lt!153465) (withMovedBitIndex!0 (_2!4568 lt!153465) (bvsub (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!153449))) (currentByte!5073 (_2!4566 lt!153449)) (currentBit!5068 (_2!4566 lt!153449))) (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!153463))) (currentByte!5073 (_2!4566 lt!153463)) (currentBit!5068 (_2!4566 lt!153463))))))))

(declare-fun lt!153441 () Unit!6388)

(declare-fun Unit!6410 () Unit!6388)

(assert (=> b!104456 (= lt!153441 Unit!6410)))

(assert (=> b!104456 (= (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!152821))) (currentByte!5073 (_2!4566 lt!152821)) (currentBit!5068 (_2!4566 lt!152821))) (bvsub (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!153449))) (currentByte!5073 (_2!4566 lt!153449)) (currentBit!5068 (_2!4566 lt!153449))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!153459 () Unit!6388)

(declare-fun Unit!6411 () Unit!6388)

(assert (=> b!104456 (= lt!153459 Unit!6411)))

(assert (=> b!104456 (= (_2!4569 lt!153445) (_2!4569 lt!153452))))

(declare-fun lt!153464 () Unit!6388)

(declare-fun Unit!6412 () Unit!6388)

(assert (=> b!104456 (= lt!153464 Unit!6412)))

(assert (=> b!104456 (= (_1!4569 lt!153445) (_2!4568 lt!153433))))

(declare-fun b!104457 () Bool)

(assert (=> b!104457 (= e!68421 (= (bitIndex!0 (size!2222 (buf!2588 (_1!4567 lt!153443))) (currentByte!5073 (_1!4567 lt!153443)) (currentBit!5068 (_1!4567 lt!153443))) (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!153424))) (currentByte!5073 (_2!4566 lt!153424)) (currentBit!5068 (_2!4566 lt!153424)))))))

(declare-fun d!32268 () Bool)

(declare-fun e!68427 () Bool)

(assert (=> d!32268 e!68427))

(declare-fun res!86005 () Bool)

(assert (=> d!32268 (=> (not res!86005) (not e!68427))))

(declare-fun lt!153451 () tuple2!8622)

(assert (=> d!32268 (= res!86005 (= (size!2222 (buf!2588 (_2!4566 lt!152821))) (size!2222 (buf!2588 (_2!4566 lt!153451)))))))

(assert (=> d!32268 (= lt!153451 e!68422)))

(assert (=> d!32268 (= c!6434 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!32268 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!32268 (= (appendNLeastSignificantBitsLoop!0 (_2!4566 lt!152821) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!153451)))

(declare-fun b!104452 () Bool)

(declare-fun res!86002 () Bool)

(assert (=> b!104452 (= res!86002 (= (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!153424))) (currentByte!5073 (_2!4566 lt!153424)) (currentBit!5068 (_2!4566 lt!153424))) (bvadd (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!152821))) (currentByte!5073 (_2!4566 lt!152821)) (currentBit!5068 (_2!4566 lt!152821))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!104452 (=> (not res!86002) (not e!68423))))

(declare-fun b!104458 () Bool)

(declare-fun res!85999 () Bool)

(assert (=> b!104458 (=> (not res!85999) (not e!68427))))

(assert (=> b!104458 (= res!85999 (isPrefixOf!0 (_2!4566 lt!152821) (_2!4566 lt!153451)))))

(declare-fun b!104459 () Bool)

(assert (=> b!104459 (= e!68425 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!104460 () Bool)

(declare-fun res!86004 () Bool)

(assert (=> b!104460 (=> (not res!86004) (not e!68427))))

(declare-fun lt!153419 () (_ BitVec 64))

(declare-fun lt!153417 () (_ BitVec 64))

(assert (=> b!104460 (= res!86004 (= (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!153451))) (currentByte!5073 (_2!4566 lt!153451)) (currentBit!5068 (_2!4566 lt!153451))) (bvadd lt!153417 lt!153419)))))

(assert (=> b!104460 (or (not (= (bvand lt!153417 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!153419 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!153417 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!153417 lt!153419) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!104460 (= lt!153419 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!104460 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!104460 (= lt!153417 (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!152821))) (currentByte!5073 (_2!4566 lt!152821)) (currentBit!5068 (_2!4566 lt!152821))))))

(declare-fun b!104461 () Bool)

(declare-fun e!68424 () Bool)

(declare-fun lt!153457 () (_ BitVec 64))

(assert (=> b!104461 (= e!68424 (validate_offset_bits!1 ((_ sign_extend 32) (size!2222 (buf!2588 (_2!4566 lt!152821)))) ((_ sign_extend 32) (currentByte!5073 (_2!4566 lt!152821))) ((_ sign_extend 32) (currentBit!5068 (_2!4566 lt!152821))) lt!153457))))

(declare-fun b!104462 () Bool)

(declare-fun res!86000 () Bool)

(assert (=> b!104462 (= res!86000 call!1297)))

(assert (=> b!104462 (=> (not res!86000) (not e!68423))))

(declare-fun b!104463 () Bool)

(declare-fun lt!153446 () tuple2!8626)

(declare-fun lt!153427 () tuple2!8628)

(assert (=> b!104463 (= e!68427 (and (= (_2!4569 lt!153427) v!199) (= (_1!4569 lt!153427) (_2!4568 lt!153446))))))

(declare-fun lt!153434 () (_ BitVec 64))

(assert (=> b!104463 (= lt!153427 (readNLeastSignificantBitsLoopPure!0 (_1!4568 lt!153446) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!153434))))

(declare-fun lt!153458 () Unit!6388)

(declare-fun lt!153418 () Unit!6388)

(assert (=> b!104463 (= lt!153458 lt!153418)))

(assert (=> b!104463 (validate_offset_bits!1 ((_ sign_extend 32) (size!2222 (buf!2588 (_2!4566 lt!153451)))) ((_ sign_extend 32) (currentByte!5073 (_2!4566 lt!152821))) ((_ sign_extend 32) (currentBit!5068 (_2!4566 lt!152821))) lt!153457)))

(assert (=> b!104463 (= lt!153418 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4566 lt!152821) (buf!2588 (_2!4566 lt!153451)) lt!153457))))

(assert (=> b!104463 e!68424))

(declare-fun res!85997 () Bool)

(assert (=> b!104463 (=> (not res!85997) (not e!68424))))

(assert (=> b!104463 (= res!85997 (and (= (size!2222 (buf!2588 (_2!4566 lt!152821))) (size!2222 (buf!2588 (_2!4566 lt!153451)))) (bvsge lt!153457 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!104463 (= lt!153457 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!104463 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!104463 (= lt!153434 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!104463 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!104463 (= lt!153446 (reader!0 (_2!4566 lt!152821) (_2!4566 lt!153451)))))

(assert (= (and d!32268 c!6434) b!104456))

(assert (= (and d!32268 (not c!6434)) b!104453))

(assert (= (and b!104456 res!85998) b!104452))

(assert (= (and b!104452 res!86002) b!104462))

(assert (= (and b!104462 res!86000) b!104455))

(assert (= (and b!104455 res!86001) b!104457))

(assert (= (and b!104456 res!86003) b!104451))

(assert (= (and b!104456 c!6435) b!104454))

(assert (= (and b!104456 (not c!6435)) b!104459))

(assert (= (or b!104462 b!104453) bm!1294))

(assert (= (and d!32268 res!86005) b!104460))

(assert (= (and b!104460 res!86004) b!104458))

(assert (= (and b!104458 res!85999) b!104463))

(assert (= (and b!104463 res!85997) b!104461))

(declare-fun m!152787 () Bool)

(assert (=> bm!1294 m!152787))

(declare-fun m!152789 () Bool)

(assert (=> b!104460 m!152789))

(assert (=> b!104460 m!152439))

(declare-fun m!152791 () Bool)

(assert (=> b!104457 m!152791))

(declare-fun m!152793 () Bool)

(assert (=> b!104457 m!152793))

(assert (=> b!104452 m!152793))

(assert (=> b!104452 m!152439))

(declare-fun m!152795 () Bool)

(assert (=> b!104458 m!152795))

(declare-fun m!152797 () Bool)

(assert (=> b!104453 m!152797))

(declare-fun m!152799 () Bool)

(assert (=> b!104461 m!152799))

(declare-fun m!152801 () Bool)

(assert (=> b!104456 m!152801))

(declare-fun m!152803 () Bool)

(assert (=> b!104456 m!152803))

(declare-fun m!152805 () Bool)

(assert (=> b!104456 m!152805))

(declare-fun m!152807 () Bool)

(assert (=> b!104456 m!152807))

(declare-fun m!152809 () Bool)

(assert (=> b!104456 m!152809))

(declare-fun m!152811 () Bool)

(assert (=> b!104456 m!152811))

(declare-fun m!152813 () Bool)

(assert (=> b!104456 m!152813))

(declare-fun m!152815 () Bool)

(assert (=> b!104456 m!152815))

(declare-fun m!152817 () Bool)

(assert (=> b!104456 m!152817))

(declare-fun m!152819 () Bool)

(assert (=> b!104456 m!152819))

(declare-fun m!152821 () Bool)

(assert (=> b!104456 m!152821))

(declare-fun m!152823 () Bool)

(assert (=> b!104456 m!152823))

(declare-fun m!152825 () Bool)

(assert (=> b!104456 m!152825))

(declare-fun m!152827 () Bool)

(assert (=> b!104456 m!152827))

(declare-fun m!152829 () Bool)

(assert (=> b!104456 m!152829))

(declare-fun m!152831 () Bool)

(assert (=> b!104456 m!152831))

(declare-fun m!152833 () Bool)

(assert (=> b!104456 m!152833))

(declare-fun m!152835 () Bool)

(assert (=> b!104456 m!152835))

(assert (=> b!104456 m!152829))

(declare-fun m!152837 () Bool)

(assert (=> b!104456 m!152837))

(declare-fun m!152841 () Bool)

(assert (=> b!104456 m!152841))

(declare-fun m!152845 () Bool)

(assert (=> b!104456 m!152845))

(declare-fun m!152859 () Bool)

(assert (=> b!104456 m!152859))

(assert (=> b!104456 m!152439))

(declare-fun m!152871 () Bool)

(assert (=> b!104456 m!152871))

(declare-fun m!152875 () Bool)

(assert (=> b!104456 m!152875))

(declare-fun m!152879 () Bool)

(assert (=> b!104456 m!152879))

(declare-fun m!152883 () Bool)

(assert (=> b!104456 m!152883))

(declare-fun m!152885 () Bool)

(assert (=> b!104456 m!152885))

(declare-fun m!152887 () Bool)

(assert (=> b!104456 m!152887))

(declare-fun m!152889 () Bool)

(assert (=> b!104463 m!152889))

(declare-fun m!152891 () Bool)

(assert (=> b!104463 m!152891))

(declare-fun m!152893 () Bool)

(assert (=> b!104463 m!152893))

(declare-fun m!152895 () Bool)

(assert (=> b!104463 m!152895))

(assert (=> b!104463 m!152815))

(declare-fun m!152897 () Bool)

(assert (=> b!104455 m!152897))

(assert (=> b!104455 m!152897))

(declare-fun m!152899 () Bool)

(assert (=> b!104455 m!152899))

(assert (=> b!104262 d!32268))

(declare-fun d!32324 () Bool)

(assert (=> d!32324 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2222 (buf!2588 (_2!4566 lt!152813)))) ((_ sign_extend 32) (currentByte!5073 thiss!1305)) ((_ sign_extend 32) (currentBit!5068 thiss!1305)) lt!152807) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2222 (buf!2588 (_2!4566 lt!152813)))) ((_ sign_extend 32) (currentByte!5073 thiss!1305)) ((_ sign_extend 32) (currentBit!5068 thiss!1305))) lt!152807))))

(declare-fun bs!7936 () Bool)

(assert (= bs!7936 d!32324))

(declare-fun m!152931 () Bool)

(assert (=> bs!7936 m!152931))

(assert (=> b!104262 d!32324))

(declare-fun d!32330 () Bool)

(declare-fun lt!153530 () tuple2!8642)

(assert (=> d!32330 (= lt!153530 (readBit!0 (BitStream!3919 (buf!2588 (_2!4566 lt!152813)) (currentByte!5073 thiss!1305) (currentBit!5068 thiss!1305))))))

(assert (=> d!32330 (= (readBitPure!0 (BitStream!3919 (buf!2588 (_2!4566 lt!152813)) (currentByte!5073 thiss!1305) (currentBit!5068 thiss!1305))) (tuple2!8625 (_2!4576 lt!153530) (_1!4576 lt!153530)))))

(declare-fun bs!7937 () Bool)

(assert (= bs!7937 d!32330))

(declare-fun m!152933 () Bool)

(assert (=> bs!7937 m!152933))

(assert (=> b!104262 d!32330))

(declare-fun d!32332 () Bool)

(declare-fun res!86033 () Bool)

(declare-fun e!68447 () Bool)

(assert (=> d!32332 (=> (not res!86033) (not e!68447))))

(assert (=> d!32332 (= res!86033 (= (size!2222 (buf!2588 thiss!1305)) (size!2222 (buf!2588 (_2!4566 lt!152813)))))))

(assert (=> d!32332 (= (isPrefixOf!0 thiss!1305 (_2!4566 lt!152813)) e!68447)))

(declare-fun b!104502 () Bool)

(declare-fun res!86032 () Bool)

(assert (=> b!104502 (=> (not res!86032) (not e!68447))))

(assert (=> b!104502 (= res!86032 (bvsle (bitIndex!0 (size!2222 (buf!2588 thiss!1305)) (currentByte!5073 thiss!1305) (currentBit!5068 thiss!1305)) (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!152813))) (currentByte!5073 (_2!4566 lt!152813)) (currentBit!5068 (_2!4566 lt!152813)))))))

(declare-fun b!104503 () Bool)

(declare-fun e!68446 () Bool)

(assert (=> b!104503 (= e!68447 e!68446)))

(declare-fun res!86034 () Bool)

(assert (=> b!104503 (=> res!86034 e!68446)))

(assert (=> b!104503 (= res!86034 (= (size!2222 (buf!2588 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!104504 () Bool)

(assert (=> b!104504 (= e!68446 (arrayBitRangesEq!0 (buf!2588 thiss!1305) (buf!2588 (_2!4566 lt!152813)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2222 (buf!2588 thiss!1305)) (currentByte!5073 thiss!1305) (currentBit!5068 thiss!1305))))))

(assert (= (and d!32332 res!86033) b!104502))

(assert (= (and b!104502 res!86032) b!104503))

(assert (= (and b!104503 (not res!86034)) b!104504))

(assert (=> b!104502 m!152441))

(assert (=> b!104502 m!152583))

(assert (=> b!104504 m!152441))

(assert (=> b!104504 m!152441))

(declare-fun m!152935 () Bool)

(assert (=> b!104504 m!152935))

(assert (=> b!104262 d!32332))

(declare-fun b!104560 () Bool)

(declare-fun e!68476 () Bool)

(declare-fun lt!153702 () tuple2!8624)

(declare-fun lt!153700 () tuple2!8622)

(assert (=> b!104560 (= e!68476 (= (bitIndex!0 (size!2222 (buf!2588 (_1!4567 lt!153702))) (currentByte!5073 (_1!4567 lt!153702)) (currentBit!5068 (_1!4567 lt!153702))) (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!153700))) (currentByte!5073 (_2!4566 lt!153700)) (currentBit!5068 (_2!4566 lt!153700)))))))

(declare-fun b!104557 () Bool)

(declare-fun res!86080 () Bool)

(declare-fun e!68477 () Bool)

(assert (=> b!104557 (=> (not res!86080) (not e!68477))))

(declare-fun lt!153699 () (_ BitVec 64))

(declare-fun lt!153701 () (_ BitVec 64))

(assert (=> b!104557 (= res!86080 (= (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!153700))) (currentByte!5073 (_2!4566 lt!153700)) (currentBit!5068 (_2!4566 lt!153700))) (bvadd lt!153699 lt!153701)))))

(assert (=> b!104557 (or (not (= (bvand lt!153699 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!153701 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!153699 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!153699 lt!153701) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!104557 (= lt!153701 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!104557 (= lt!153699 (bitIndex!0 (size!2222 (buf!2588 thiss!1305)) (currentByte!5073 thiss!1305) (currentBit!5068 thiss!1305)))))

(declare-fun d!32334 () Bool)

(assert (=> d!32334 e!68477))

(declare-fun res!86077 () Bool)

(assert (=> d!32334 (=> (not res!86077) (not e!68477))))

(assert (=> d!32334 (= res!86077 (= (size!2222 (buf!2588 thiss!1305)) (size!2222 (buf!2588 (_2!4566 lt!153700)))))))

(declare-fun choose!16 (BitStream!3918 Bool) tuple2!8622)

(assert (=> d!32334 (= lt!153700 (choose!16 thiss!1305 lt!152816))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!32334 (validate_offset_bit!0 ((_ sign_extend 32) (size!2222 (buf!2588 thiss!1305))) ((_ sign_extend 32) (currentByte!5073 thiss!1305)) ((_ sign_extend 32) (currentBit!5068 thiss!1305)))))

(assert (=> d!32334 (= (appendBit!0 thiss!1305 lt!152816) lt!153700)))

(declare-fun b!104559 () Bool)

(assert (=> b!104559 (= e!68477 e!68476)))

(declare-fun res!86079 () Bool)

(assert (=> b!104559 (=> (not res!86079) (not e!68476))))

(assert (=> b!104559 (= res!86079 (and (= (_2!4567 lt!153702) lt!152816) (= (_1!4567 lt!153702) (_2!4566 lt!153700))))))

(assert (=> b!104559 (= lt!153702 (readBitPure!0 (readerFrom!0 (_2!4566 lt!153700) (currentBit!5068 thiss!1305) (currentByte!5073 thiss!1305))))))

(declare-fun b!104558 () Bool)

(declare-fun res!86078 () Bool)

(assert (=> b!104558 (=> (not res!86078) (not e!68477))))

(assert (=> b!104558 (= res!86078 (isPrefixOf!0 thiss!1305 (_2!4566 lt!153700)))))

(assert (= (and d!32334 res!86077) b!104557))

(assert (= (and b!104557 res!86080) b!104558))

(assert (= (and b!104558 res!86078) b!104559))

(assert (= (and b!104559 res!86079) b!104560))

(declare-fun m!152967 () Bool)

(assert (=> b!104559 m!152967))

(assert (=> b!104559 m!152967))

(declare-fun m!152969 () Bool)

(assert (=> b!104559 m!152969))

(declare-fun m!152971 () Bool)

(assert (=> b!104560 m!152971))

(declare-fun m!152973 () Bool)

(assert (=> b!104560 m!152973))

(declare-fun m!152975 () Bool)

(assert (=> d!32334 m!152975))

(declare-fun m!152977 () Bool)

(assert (=> d!32334 m!152977))

(assert (=> b!104557 m!152973))

(assert (=> b!104557 m!152441))

(declare-fun m!152979 () Bool)

(assert (=> b!104558 m!152979))

(assert (=> b!104262 d!32334))

(declare-fun d!32346 () Bool)

(assert (=> d!32346 (isPrefixOf!0 thiss!1305 (_2!4566 lt!152813))))

(declare-fun lt!153718 () Unit!6388)

(declare-fun choose!30 (BitStream!3918 BitStream!3918 BitStream!3918) Unit!6388)

(assert (=> d!32346 (= lt!153718 (choose!30 thiss!1305 (_2!4566 lt!152821) (_2!4566 lt!152813)))))

(assert (=> d!32346 (isPrefixOf!0 thiss!1305 (_2!4566 lt!152821))))

(assert (=> d!32346 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4566 lt!152821) (_2!4566 lt!152813)) lt!153718)))

(declare-fun bs!7944 () Bool)

(assert (= bs!7944 d!32346))

(assert (=> bs!7944 m!152413))

(declare-fun m!153073 () Bool)

(assert (=> bs!7944 m!153073))

(assert (=> bs!7944 m!152453))

(assert (=> b!104262 d!32346))

(declare-fun d!32358 () Bool)

(assert (=> d!32358 (validate_offset_bits!1 ((_ sign_extend 32) (size!2222 (buf!2588 (_2!4566 lt!152813)))) ((_ sign_extend 32) (currentByte!5073 thiss!1305)) ((_ sign_extend 32) (currentBit!5068 thiss!1305)) lt!152807)))

(declare-fun lt!153719 () Unit!6388)

(assert (=> d!32358 (= lt!153719 (choose!9 thiss!1305 (buf!2588 (_2!4566 lt!152813)) lt!152807 (BitStream!3919 (buf!2588 (_2!4566 lt!152813)) (currentByte!5073 thiss!1305) (currentBit!5068 thiss!1305))))))

(assert (=> d!32358 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2588 (_2!4566 lt!152813)) lt!152807) lt!153719)))

(declare-fun bs!7945 () Bool)

(assert (= bs!7945 d!32358))

(assert (=> bs!7945 m!152407))

(declare-fun m!153075 () Bool)

(assert (=> bs!7945 m!153075))

(assert (=> b!104262 d!32358))

(declare-fun d!32360 () Bool)

(declare-fun e!68479 () Bool)

(assert (=> d!32360 e!68479))

(declare-fun res!86084 () Bool)

(assert (=> d!32360 (=> (not res!86084) (not e!68479))))

(declare-fun lt!153723 () (_ BitVec 64))

(declare-fun lt!153724 () (_ BitVec 64))

(declare-fun lt!153722 () (_ BitVec 64))

(assert (=> d!32360 (= res!86084 (= lt!153723 (bvsub lt!153722 lt!153724)))))

(assert (=> d!32360 (or (= (bvand lt!153722 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!153724 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!153722 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!153722 lt!153724) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32360 (= lt!153724 (remainingBits!0 ((_ sign_extend 32) (size!2222 (buf!2588 (_1!4567 lt!152808)))) ((_ sign_extend 32) (currentByte!5073 (_1!4567 lt!152808))) ((_ sign_extend 32) (currentBit!5068 (_1!4567 lt!152808)))))))

(declare-fun lt!153721 () (_ BitVec 64))

(declare-fun lt!153720 () (_ BitVec 64))

(assert (=> d!32360 (= lt!153722 (bvmul lt!153721 lt!153720))))

(assert (=> d!32360 (or (= lt!153721 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!153720 (bvsdiv (bvmul lt!153721 lt!153720) lt!153721)))))

(assert (=> d!32360 (= lt!153720 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!32360 (= lt!153721 ((_ sign_extend 32) (size!2222 (buf!2588 (_1!4567 lt!152808)))))))

(assert (=> d!32360 (= lt!153723 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5073 (_1!4567 lt!152808))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5068 (_1!4567 lt!152808)))))))

(assert (=> d!32360 (invariant!0 (currentBit!5068 (_1!4567 lt!152808)) (currentByte!5073 (_1!4567 lt!152808)) (size!2222 (buf!2588 (_1!4567 lt!152808))))))

(assert (=> d!32360 (= (bitIndex!0 (size!2222 (buf!2588 (_1!4567 lt!152808))) (currentByte!5073 (_1!4567 lt!152808)) (currentBit!5068 (_1!4567 lt!152808))) lt!153723)))

(declare-fun b!104563 () Bool)

(declare-fun res!86083 () Bool)

(assert (=> b!104563 (=> (not res!86083) (not e!68479))))

(assert (=> b!104563 (= res!86083 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!153723))))

(declare-fun b!104564 () Bool)

(declare-fun lt!153725 () (_ BitVec 64))

(assert (=> b!104564 (= e!68479 (bvsle lt!153723 (bvmul lt!153725 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!104564 (or (= lt!153725 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!153725 #b0000000000000000000000000000000000000000000000000000000000001000) lt!153725)))))

(assert (=> b!104564 (= lt!153725 ((_ sign_extend 32) (size!2222 (buf!2588 (_1!4567 lt!152808)))))))

(assert (= (and d!32360 res!86084) b!104563))

(assert (= (and b!104563 res!86083) b!104564))

(declare-fun m!153077 () Bool)

(assert (=> d!32360 m!153077))

(declare-fun m!153079 () Bool)

(assert (=> d!32360 m!153079))

(assert (=> b!104262 d!32360))

(declare-fun d!32362 () Bool)

(declare-fun lt!153728 () tuple2!8642)

(assert (=> d!32362 (= lt!153728 (readBit!0 lt!152823))))

(assert (=> d!32362 (= (readBitPure!0 lt!152823) (tuple2!8625 (_2!4576 lt!153728) (_1!4576 lt!153728)))))

(declare-fun bs!7946 () Bool)

(assert (= bs!7946 d!32362))

(declare-fun m!153081 () Bool)

(assert (=> bs!7946 m!153081))

(assert (=> b!104262 d!32362))

(declare-fun d!32364 () Bool)

(assert (=> d!32364 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2222 (buf!2588 (_2!4566 lt!152813)))) ((_ sign_extend 32) (currentByte!5073 (_2!4566 lt!152821))) ((_ sign_extend 32) (currentBit!5068 (_2!4566 lt!152821))) lt!152820) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2222 (buf!2588 (_2!4566 lt!152813)))) ((_ sign_extend 32) (currentByte!5073 (_2!4566 lt!152821))) ((_ sign_extend 32) (currentBit!5068 (_2!4566 lt!152821)))) lt!152820))))

(declare-fun bs!7947 () Bool)

(assert (= bs!7947 d!32364))

(declare-fun m!153083 () Bool)

(assert (=> bs!7947 m!153083))

(assert (=> b!104262 d!32364))

(declare-fun d!32366 () Bool)

(declare-fun lt!153729 () tuple2!8642)

(assert (=> d!32366 (= lt!153729 (readBit!0 (readerFrom!0 (_2!4566 lt!152821) (currentBit!5068 thiss!1305) (currentByte!5073 thiss!1305))))))

(assert (=> d!32366 (= (readBitPure!0 (readerFrom!0 (_2!4566 lt!152821) (currentBit!5068 thiss!1305) (currentByte!5073 thiss!1305))) (tuple2!8625 (_2!4576 lt!153729) (_1!4576 lt!153729)))))

(declare-fun bs!7948 () Bool)

(assert (= bs!7948 d!32366))

(assert (=> bs!7948 m!152433))

(declare-fun m!153085 () Bool)

(assert (=> bs!7948 m!153085))

(assert (=> b!104261 d!32366))

(declare-fun d!32368 () Bool)

(declare-fun e!68490 () Bool)

(assert (=> d!32368 e!68490))

(declare-fun res!86101 () Bool)

(assert (=> d!32368 (=> (not res!86101) (not e!68490))))

(assert (=> d!32368 (= res!86101 (invariant!0 (currentBit!5068 (_2!4566 lt!152821)) (currentByte!5073 (_2!4566 lt!152821)) (size!2222 (buf!2588 (_2!4566 lt!152821)))))))

(assert (=> d!32368 (= (readerFrom!0 (_2!4566 lt!152821) (currentBit!5068 thiss!1305) (currentByte!5073 thiss!1305)) (BitStream!3919 (buf!2588 (_2!4566 lt!152821)) (currentByte!5073 thiss!1305) (currentBit!5068 thiss!1305)))))

(declare-fun b!104580 () Bool)

(assert (=> b!104580 (= e!68490 (invariant!0 (currentBit!5068 thiss!1305) (currentByte!5073 thiss!1305) (size!2222 (buf!2588 (_2!4566 lt!152821)))))))

(assert (= (and d!32368 res!86101) b!104580))

(declare-fun m!153099 () Bool)

(assert (=> d!32368 m!153099))

(assert (=> b!104580 m!152459))

(assert (=> b!104261 d!32368))

(declare-fun d!32382 () Bool)

(assert (=> d!32382 (= (array_inv!2024 (buf!2588 thiss!1305)) (bvsge (size!2222 (buf!2588 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!104272 d!32382))

(declare-fun d!32390 () Bool)

(declare-fun res!86104 () Bool)

(declare-fun e!68492 () Bool)

(assert (=> d!32390 (=> (not res!86104) (not e!68492))))

(assert (=> d!32390 (= res!86104 (= (size!2222 (buf!2588 thiss!1305)) (size!2222 (buf!2588 (_2!4566 lt!152821)))))))

(assert (=> d!32390 (= (isPrefixOf!0 thiss!1305 (_2!4566 lt!152821)) e!68492)))

(declare-fun b!104581 () Bool)

(declare-fun res!86103 () Bool)

(assert (=> b!104581 (=> (not res!86103) (not e!68492))))

(assert (=> b!104581 (= res!86103 (bvsle (bitIndex!0 (size!2222 (buf!2588 thiss!1305)) (currentByte!5073 thiss!1305) (currentBit!5068 thiss!1305)) (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!152821))) (currentByte!5073 (_2!4566 lt!152821)) (currentBit!5068 (_2!4566 lt!152821)))))))

(declare-fun b!104582 () Bool)

(declare-fun e!68491 () Bool)

(assert (=> b!104582 (= e!68492 e!68491)))

(declare-fun res!86105 () Bool)

(assert (=> b!104582 (=> res!86105 e!68491)))

(assert (=> b!104582 (= res!86105 (= (size!2222 (buf!2588 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!104583 () Bool)

(assert (=> b!104583 (= e!68491 (arrayBitRangesEq!0 (buf!2588 thiss!1305) (buf!2588 (_2!4566 lt!152821)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2222 (buf!2588 thiss!1305)) (currentByte!5073 thiss!1305) (currentBit!5068 thiss!1305))))))

(assert (= (and d!32390 res!86104) b!104581))

(assert (= (and b!104581 res!86103) b!104582))

(assert (= (and b!104582 (not res!86105)) b!104583))

(assert (=> b!104581 m!152441))

(assert (=> b!104581 m!152439))

(assert (=> b!104583 m!152441))

(assert (=> b!104583 m!152441))

(declare-fun m!153107 () Bool)

(assert (=> b!104583 m!153107))

(assert (=> b!104271 d!32390))

(declare-fun d!32392 () Bool)

(assert (=> d!32392 (= (invariant!0 (currentBit!5068 thiss!1305) (currentByte!5073 thiss!1305) (size!2222 (buf!2588 (_2!4566 lt!152821)))) (and (bvsge (currentBit!5068 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5068 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5073 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5073 thiss!1305) (size!2222 (buf!2588 (_2!4566 lt!152821)))) (and (= (currentBit!5068 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5073 thiss!1305) (size!2222 (buf!2588 (_2!4566 lt!152821))))))))))

(assert (=> b!104269 d!32392))

(declare-fun d!32394 () Bool)

(declare-fun lt!153748 () tuple2!8644)

(assert (=> d!32394 (= lt!153748 (readNLeastSignificantBitsLoop!0 (withMovedBitIndex!0 (_1!4568 lt!152809) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!152818))))

(assert (=> d!32394 (= (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4568 lt!152809) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!152818) (tuple2!8629 (_2!4577 lt!153748) (_1!4577 lt!153748)))))

(declare-fun bs!7954 () Bool)

(assert (= bs!7954 d!32394))

(assert (=> bs!7954 m!152443))

(declare-fun m!153109 () Bool)

(assert (=> bs!7954 m!153109))

(assert (=> b!104268 d!32394))

(declare-fun d!32396 () Bool)

(assert (=> d!32396 (= (invariant!0 (currentBit!5068 (_2!4566 lt!152813)) (currentByte!5073 (_2!4566 lt!152813)) (size!2222 (buf!2588 (_2!4566 lt!152813)))) (and (bvsge (currentBit!5068 (_2!4566 lt!152813)) #b00000000000000000000000000000000) (bvslt (currentBit!5068 (_2!4566 lt!152813)) #b00000000000000000000000000001000) (bvsge (currentByte!5073 (_2!4566 lt!152813)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5073 (_2!4566 lt!152813)) (size!2222 (buf!2588 (_2!4566 lt!152813)))) (and (= (currentBit!5068 (_2!4566 lt!152813)) #b00000000000000000000000000000000) (= (currentByte!5073 (_2!4566 lt!152813)) (size!2222 (buf!2588 (_2!4566 lt!152813))))))))))

(assert (=> b!104268 d!32396))

(declare-fun d!32398 () Bool)

(declare-fun lt!153777 () tuple2!8628)

(declare-fun lt!153780 () tuple2!8628)

(assert (=> d!32398 (and (= (_2!4569 lt!153777) (_2!4569 lt!153780)) (= (_1!4569 lt!153777) (_1!4569 lt!153780)))))

(declare-fun lt!153778 () Bool)

(declare-fun lt!153781 () Unit!6388)

(declare-fun lt!153779 () BitStream!3918)

(declare-fun lt!153776 () (_ BitVec 64))

(declare-fun choose!45 (BitStream!3918 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!8628 tuple2!8628 BitStream!3918 (_ BitVec 64) Bool BitStream!3918 (_ BitVec 64) tuple2!8628 tuple2!8628 BitStream!3918 (_ BitVec 64)) Unit!6388)

(assert (=> d!32398 (= lt!153781 (choose!45 (_1!4568 lt!152809) nBits!396 i!615 lt!152817 lt!153777 (tuple2!8629 (_1!4569 lt!153777) (_2!4569 lt!153777)) (_1!4569 lt!153777) (_2!4569 lt!153777) lt!153778 lt!153779 lt!153776 lt!153780 (tuple2!8629 (_1!4569 lt!153780) (_2!4569 lt!153780)) (_1!4569 lt!153780) (_2!4569 lt!153780)))))

(assert (=> d!32398 (= lt!153780 (readNLeastSignificantBitsLoopPure!0 lt!153779 nBits!396 (bvadd i!615 #b00000000000000000000000000000001) lt!153776))))

(assert (=> d!32398 (= lt!153776 (bvor lt!152817 (ite lt!153778 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32398 (= lt!153779 (withMovedBitIndex!0 (_1!4568 lt!152809) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!32398 (= lt!153778 (_2!4567 (readBitPure!0 (_1!4568 lt!152809))))))

(assert (=> d!32398 (= lt!153777 (readNLeastSignificantBitsLoopPure!0 (_1!4568 lt!152809) nBits!396 i!615 lt!152817))))

(assert (=> d!32398 (= (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4568 lt!152809) nBits!396 i!615 lt!152817) lt!153781)))

(declare-fun bs!7958 () Bool)

(assert (= bs!7958 d!32398))

(assert (=> bs!7958 m!152443))

(assert (=> bs!7958 m!152429))

(assert (=> bs!7958 m!152427))

(declare-fun m!153121 () Bool)

(assert (=> bs!7958 m!153121))

(declare-fun m!153123 () Bool)

(assert (=> bs!7958 m!153123))

(assert (=> b!104268 d!32398))

(declare-fun d!32412 () Bool)

(declare-fun e!68517 () Bool)

(assert (=> d!32412 e!68517))

(declare-fun res!86141 () Bool)

(assert (=> d!32412 (=> (not res!86141) (not e!68517))))

(declare-fun lt!153838 () (_ BitVec 64))

(declare-fun lt!153837 () BitStream!3918)

(assert (=> d!32412 (= res!86141 (= (bvadd lt!153838 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!2222 (buf!2588 lt!153837)) (currentByte!5073 lt!153837) (currentBit!5068 lt!153837))))))

(assert (=> d!32412 (or (not (= (bvand lt!153838 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!153838 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!153838 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32412 (= lt!153838 (bitIndex!0 (size!2222 (buf!2588 (_1!4568 lt!152809))) (currentByte!5073 (_1!4568 lt!152809)) (currentBit!5068 (_1!4568 lt!152809))))))

(declare-fun moveBitIndex!0 (BitStream!3918 (_ BitVec 64)) tuple2!8622)

(assert (=> d!32412 (= lt!153837 (_2!4566 (moveBitIndex!0 (_1!4568 lt!152809) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!3918 (_ BitVec 64)) Bool)

(assert (=> d!32412 (moveBitIndexPrecond!0 (_1!4568 lt!152809) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!32412 (= (withMovedBitIndex!0 (_1!4568 lt!152809) #b0000000000000000000000000000000000000000000000000000000000000001) lt!153837)))

(declare-fun b!104621 () Bool)

(assert (=> b!104621 (= e!68517 (= (size!2222 (buf!2588 (_1!4568 lt!152809))) (size!2222 (buf!2588 lt!153837))))))

(assert (= (and d!32412 res!86141) b!104621))

(declare-fun m!153183 () Bool)

(assert (=> d!32412 m!153183))

(declare-fun m!153185 () Bool)

(assert (=> d!32412 m!153185))

(declare-fun m!153187 () Bool)

(assert (=> d!32412 m!153187))

(declare-fun m!153191 () Bool)

(assert (=> d!32412 m!153191))

(assert (=> b!104268 d!32412))

(declare-fun d!32438 () Bool)

(declare-fun e!68519 () Bool)

(assert (=> d!32438 e!68519))

(declare-fun res!86145 () Bool)

(assert (=> d!32438 (=> (not res!86145) (not e!68519))))

(declare-fun lt!153849 () (_ BitVec 64))

(declare-fun lt!153847 () (_ BitVec 64))

(declare-fun lt!153848 () (_ BitVec 64))

(assert (=> d!32438 (= res!86145 (= lt!153848 (bvsub lt!153847 lt!153849)))))

(assert (=> d!32438 (or (= (bvand lt!153847 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!153849 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!153847 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!153847 lt!153849) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32438 (= lt!153849 (remainingBits!0 ((_ sign_extend 32) (size!2222 (buf!2588 thiss!1305))) ((_ sign_extend 32) (currentByte!5073 thiss!1305)) ((_ sign_extend 32) (currentBit!5068 thiss!1305))))))

(declare-fun lt!153846 () (_ BitVec 64))

(declare-fun lt!153845 () (_ BitVec 64))

(assert (=> d!32438 (= lt!153847 (bvmul lt!153846 lt!153845))))

(assert (=> d!32438 (or (= lt!153846 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!153845 (bvsdiv (bvmul lt!153846 lt!153845) lt!153846)))))

(assert (=> d!32438 (= lt!153845 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!32438 (= lt!153846 ((_ sign_extend 32) (size!2222 (buf!2588 thiss!1305))))))

(assert (=> d!32438 (= lt!153848 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5073 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5068 thiss!1305))))))

(assert (=> d!32438 (invariant!0 (currentBit!5068 thiss!1305) (currentByte!5073 thiss!1305) (size!2222 (buf!2588 thiss!1305)))))

(assert (=> d!32438 (= (bitIndex!0 (size!2222 (buf!2588 thiss!1305)) (currentByte!5073 thiss!1305) (currentBit!5068 thiss!1305)) lt!153848)))

(declare-fun b!104624 () Bool)

(declare-fun res!86144 () Bool)

(assert (=> b!104624 (=> (not res!86144) (not e!68519))))

(assert (=> b!104624 (= res!86144 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!153848))))

(declare-fun b!104625 () Bool)

(declare-fun lt!153850 () (_ BitVec 64))

(assert (=> b!104625 (= e!68519 (bvsle lt!153848 (bvmul lt!153850 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!104625 (or (= lt!153850 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!153850 #b0000000000000000000000000000000000000000000000000000000000001000) lt!153850)))))

(assert (=> b!104625 (= lt!153850 ((_ sign_extend 32) (size!2222 (buf!2588 thiss!1305))))))

(assert (= (and d!32438 res!86145) b!104624))

(assert (= (and b!104624 res!86144) b!104625))

(declare-fun m!153199 () Bool)

(assert (=> d!32438 m!153199))

(assert (=> d!32438 m!152533))

(assert (=> b!104268 d!32438))

(declare-fun d!32446 () Bool)

(assert (=> d!32446 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2222 (buf!2588 thiss!1305))) ((_ sign_extend 32) (currentByte!5073 thiss!1305)) ((_ sign_extend 32) (currentBit!5068 thiss!1305)) lt!152807) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2222 (buf!2588 thiss!1305))) ((_ sign_extend 32) (currentByte!5073 thiss!1305)) ((_ sign_extend 32) (currentBit!5068 thiss!1305))) lt!152807))))

(declare-fun bs!7965 () Bool)

(assert (= bs!7965 d!32446))

(assert (=> bs!7965 m!153199))

(assert (=> b!104267 d!32446))

(declare-fun d!32450 () Bool)

(declare-fun e!68522 () Bool)

(assert (=> d!32450 e!68522))

(declare-fun res!86151 () Bool)

(assert (=> d!32450 (=> (not res!86151) (not e!68522))))

(declare-fun lt!153865 () (_ BitVec 64))

(declare-fun lt!153866 () (_ BitVec 64))

(declare-fun lt!153867 () (_ BitVec 64))

(assert (=> d!32450 (= res!86151 (= lt!153866 (bvsub lt!153865 lt!153867)))))

(assert (=> d!32450 (or (= (bvand lt!153865 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!153867 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!153865 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!153865 lt!153867) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32450 (= lt!153867 (remainingBits!0 ((_ sign_extend 32) (size!2222 (buf!2588 (_1!4567 lt!152830)))) ((_ sign_extend 32) (currentByte!5073 (_1!4567 lt!152830))) ((_ sign_extend 32) (currentBit!5068 (_1!4567 lt!152830)))))))

(declare-fun lt!153864 () (_ BitVec 64))

(declare-fun lt!153863 () (_ BitVec 64))

(assert (=> d!32450 (= lt!153865 (bvmul lt!153864 lt!153863))))

(assert (=> d!32450 (or (= lt!153864 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!153863 (bvsdiv (bvmul lt!153864 lt!153863) lt!153864)))))

(assert (=> d!32450 (= lt!153863 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!32450 (= lt!153864 ((_ sign_extend 32) (size!2222 (buf!2588 (_1!4567 lt!152830)))))))

(assert (=> d!32450 (= lt!153866 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5073 (_1!4567 lt!152830))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5068 (_1!4567 lt!152830)))))))

(assert (=> d!32450 (invariant!0 (currentBit!5068 (_1!4567 lt!152830)) (currentByte!5073 (_1!4567 lt!152830)) (size!2222 (buf!2588 (_1!4567 lt!152830))))))

(assert (=> d!32450 (= (bitIndex!0 (size!2222 (buf!2588 (_1!4567 lt!152830))) (currentByte!5073 (_1!4567 lt!152830)) (currentBit!5068 (_1!4567 lt!152830))) lt!153866)))

(declare-fun b!104630 () Bool)

(declare-fun res!86150 () Bool)

(assert (=> b!104630 (=> (not res!86150) (not e!68522))))

(assert (=> b!104630 (= res!86150 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!153866))))

(declare-fun b!104631 () Bool)

(declare-fun lt!153868 () (_ BitVec 64))

(assert (=> b!104631 (= e!68522 (bvsle lt!153866 (bvmul lt!153868 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!104631 (or (= lt!153868 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!153868 #b0000000000000000000000000000000000000000000000000000000000001000) lt!153868)))))

(assert (=> b!104631 (= lt!153868 ((_ sign_extend 32) (size!2222 (buf!2588 (_1!4567 lt!152830)))))))

(assert (= (and d!32450 res!86151) b!104630))

(assert (= (and b!104630 res!86150) b!104631))

(declare-fun m!153205 () Bool)

(assert (=> d!32450 m!153205))

(declare-fun m!153207 () Bool)

(assert (=> d!32450 m!153207))

(assert (=> b!104266 d!32450))

(declare-fun d!32452 () Bool)

(declare-fun e!68523 () Bool)

(assert (=> d!32452 e!68523))

(declare-fun res!86153 () Bool)

(assert (=> d!32452 (=> (not res!86153) (not e!68523))))

(declare-fun lt!153872 () (_ BitVec 64))

(declare-fun lt!153873 () (_ BitVec 64))

(declare-fun lt!153871 () (_ BitVec 64))

(assert (=> d!32452 (= res!86153 (= lt!153872 (bvsub lt!153871 lt!153873)))))

(assert (=> d!32452 (or (= (bvand lt!153871 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!153873 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!153871 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!153871 lt!153873) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32452 (= lt!153873 (remainingBits!0 ((_ sign_extend 32) (size!2222 (buf!2588 (_2!4566 lt!152821)))) ((_ sign_extend 32) (currentByte!5073 (_2!4566 lt!152821))) ((_ sign_extend 32) (currentBit!5068 (_2!4566 lt!152821)))))))

(declare-fun lt!153870 () (_ BitVec 64))

(declare-fun lt!153869 () (_ BitVec 64))

(assert (=> d!32452 (= lt!153871 (bvmul lt!153870 lt!153869))))

(assert (=> d!32452 (or (= lt!153870 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!153869 (bvsdiv (bvmul lt!153870 lt!153869) lt!153870)))))

(assert (=> d!32452 (= lt!153869 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!32452 (= lt!153870 ((_ sign_extend 32) (size!2222 (buf!2588 (_2!4566 lt!152821)))))))

(assert (=> d!32452 (= lt!153872 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5073 (_2!4566 lt!152821))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5068 (_2!4566 lt!152821)))))))

(assert (=> d!32452 (invariant!0 (currentBit!5068 (_2!4566 lt!152821)) (currentByte!5073 (_2!4566 lt!152821)) (size!2222 (buf!2588 (_2!4566 lt!152821))))))

(assert (=> d!32452 (= (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!152821))) (currentByte!5073 (_2!4566 lt!152821)) (currentBit!5068 (_2!4566 lt!152821))) lt!153872)))

(declare-fun b!104632 () Bool)

(declare-fun res!86152 () Bool)

(assert (=> b!104632 (=> (not res!86152) (not e!68523))))

(assert (=> b!104632 (= res!86152 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!153872))))

(declare-fun b!104633 () Bool)

(declare-fun lt!153874 () (_ BitVec 64))

(assert (=> b!104633 (= e!68523 (bvsle lt!153872 (bvmul lt!153874 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!104633 (or (= lt!153874 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!153874 #b0000000000000000000000000000000000000000000000000000000000001000) lt!153874)))))

(assert (=> b!104633 (= lt!153874 ((_ sign_extend 32) (size!2222 (buf!2588 (_2!4566 lt!152821)))))))

(assert (= (and d!32452 res!86153) b!104632))

(assert (= (and b!104632 res!86152) b!104633))

(declare-fun m!153209 () Bool)

(assert (=> d!32452 m!153209))

(assert (=> d!32452 m!153099))

(assert (=> b!104265 d!32452))

(assert (=> b!104265 d!32438))

(declare-fun d!32454 () Bool)

(assert (=> d!32454 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!104264 d!32454))

(check-sat (not b!104461) (not d!32334) (not d!32252) (not d!32446) (not b!104453) (not d!32246) (not d!32258) (not d!32368) (not d!32254) (not b!104581) (not d!32256) (not d!32266) (not d!32264) (not b!104456) (not b!104460) (not b!104329) (not d!32412) (not b!104331) (not b!104557) (not b!104463) (not d!32346) (not b!104330) (not b!104580) (not d!32438) (not d!32452) (not b!104502) (not d!32330) (not d!32360) (not b!104335) (not b!104504) (not d!32260) (not b!104326) (not d!32358) (not b!104458) (not d!32262) (not d!32366) (not b!104332) (not b!104327) (not d!32324) (not d!32364) (not bm!1294) (not b!104558) (not b!104334) (not b!104452) (not b!104457) (not d!32398) (not b!104560) (not d!32362) (not b!104583) (not b!104455) (not d!32394) (not b!104559) (not d!32450))
(check-sat)
(get-model)

(declare-fun d!32456 () Bool)

(assert (=> d!32456 (= (remainingBits!0 ((_ sign_extend 32) (size!2222 (buf!2588 (_2!4566 lt!152821)))) ((_ sign_extend 32) (currentByte!5073 (_2!4566 lt!152821))) ((_ sign_extend 32) (currentBit!5068 (_2!4566 lt!152821)))) (bvsub (bvmul ((_ sign_extend 32) (size!2222 (buf!2588 (_2!4566 lt!152821)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5073 (_2!4566 lt!152821))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5068 (_2!4566 lt!152821))))))))

(assert (=> d!32452 d!32456))

(declare-fun d!32458 () Bool)

(assert (=> d!32458 (= (invariant!0 (currentBit!5068 (_2!4566 lt!152821)) (currentByte!5073 (_2!4566 lt!152821)) (size!2222 (buf!2588 (_2!4566 lt!152821)))) (and (bvsge (currentBit!5068 (_2!4566 lt!152821)) #b00000000000000000000000000000000) (bvslt (currentBit!5068 (_2!4566 lt!152821)) #b00000000000000000000000000001000) (bvsge (currentByte!5073 (_2!4566 lt!152821)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5073 (_2!4566 lt!152821)) (size!2222 (buf!2588 (_2!4566 lt!152821)))) (and (= (currentBit!5068 (_2!4566 lt!152821)) #b00000000000000000000000000000000) (= (currentByte!5073 (_2!4566 lt!152821)) (size!2222 (buf!2588 (_2!4566 lt!152821))))))))))

(assert (=> d!32452 d!32458))

(declare-fun d!32460 () Bool)

(assert (=> d!32460 (isPrefixOf!0 (_2!4566 lt!152813) (_2!4566 lt!152813))))

(declare-fun lt!153877 () Unit!6388)

(declare-fun choose!11 (BitStream!3918) Unit!6388)

(assert (=> d!32460 (= lt!153877 (choose!11 (_2!4566 lt!152813)))))

(assert (=> d!32460 (= (lemmaIsPrefixRefl!0 (_2!4566 lt!152813)) lt!153877)))

(declare-fun bs!7967 () Bool)

(assert (= bs!7967 d!32460))

(assert (=> bs!7967 m!152565))

(declare-fun m!153211 () Bool)

(assert (=> bs!7967 m!153211))

(assert (=> d!32260 d!32460))

(declare-fun d!32462 () Bool)

(assert (=> d!32462 (isPrefixOf!0 (_2!4566 lt!152821) (_2!4566 lt!152821))))

(declare-fun lt!153878 () Unit!6388)

(assert (=> d!32462 (= lt!153878 (choose!11 (_2!4566 lt!152821)))))

(assert (=> d!32462 (= (lemmaIsPrefixRefl!0 (_2!4566 lt!152821)) lt!153878)))

(declare-fun bs!7968 () Bool)

(assert (= bs!7968 d!32462))

(assert (=> bs!7968 m!152563))

(declare-fun m!153213 () Bool)

(assert (=> bs!7968 m!153213))

(assert (=> d!32260 d!32462))

(declare-fun d!32464 () Bool)

(declare-fun res!86155 () Bool)

(declare-fun e!68525 () Bool)

(assert (=> d!32464 (=> (not res!86155) (not e!68525))))

(assert (=> d!32464 (= res!86155 (= (size!2222 (buf!2588 lt!152978)) (size!2222 (buf!2588 (_2!4566 lt!152813)))))))

(assert (=> d!32464 (= (isPrefixOf!0 lt!152978 (_2!4566 lt!152813)) e!68525)))

(declare-fun b!104634 () Bool)

(declare-fun res!86154 () Bool)

(assert (=> b!104634 (=> (not res!86154) (not e!68525))))

(assert (=> b!104634 (= res!86154 (bvsle (bitIndex!0 (size!2222 (buf!2588 lt!152978)) (currentByte!5073 lt!152978) (currentBit!5068 lt!152978)) (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!152813))) (currentByte!5073 (_2!4566 lt!152813)) (currentBit!5068 (_2!4566 lt!152813)))))))

(declare-fun b!104635 () Bool)

(declare-fun e!68524 () Bool)

(assert (=> b!104635 (= e!68525 e!68524)))

(declare-fun res!86156 () Bool)

(assert (=> b!104635 (=> res!86156 e!68524)))

(assert (=> b!104635 (= res!86156 (= (size!2222 (buf!2588 lt!152978)) #b00000000000000000000000000000000))))

(declare-fun b!104636 () Bool)

(assert (=> b!104636 (= e!68524 (arrayBitRangesEq!0 (buf!2588 lt!152978) (buf!2588 (_2!4566 lt!152813)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2222 (buf!2588 lt!152978)) (currentByte!5073 lt!152978) (currentBit!5068 lt!152978))))))

(assert (= (and d!32464 res!86155) b!104634))

(assert (= (and b!104634 res!86154) b!104635))

(assert (= (and b!104635 (not res!86156)) b!104636))

(declare-fun m!153215 () Bool)

(assert (=> b!104634 m!153215))

(assert (=> b!104634 m!152583))

(assert (=> b!104636 m!153215))

(assert (=> b!104636 m!153215))

(declare-fun m!153217 () Bool)

(assert (=> b!104636 m!153217))

(assert (=> d!32260 d!32464))

(declare-fun d!32466 () Bool)

(declare-fun res!86158 () Bool)

(declare-fun e!68527 () Bool)

(assert (=> d!32466 (=> (not res!86158) (not e!68527))))

(assert (=> d!32466 (= res!86158 (= (size!2222 (buf!2588 (_1!4568 lt!152968))) (size!2222 (buf!2588 (_2!4568 lt!152968)))))))

(assert (=> d!32466 (= (isPrefixOf!0 (_1!4568 lt!152968) (_2!4568 lt!152968)) e!68527)))

(declare-fun b!104637 () Bool)

(declare-fun res!86157 () Bool)

(assert (=> b!104637 (=> (not res!86157) (not e!68527))))

(assert (=> b!104637 (= res!86157 (bvsle (bitIndex!0 (size!2222 (buf!2588 (_1!4568 lt!152968))) (currentByte!5073 (_1!4568 lt!152968)) (currentBit!5068 (_1!4568 lt!152968))) (bitIndex!0 (size!2222 (buf!2588 (_2!4568 lt!152968))) (currentByte!5073 (_2!4568 lt!152968)) (currentBit!5068 (_2!4568 lt!152968)))))))

(declare-fun b!104638 () Bool)

(declare-fun e!68526 () Bool)

(assert (=> b!104638 (= e!68527 e!68526)))

(declare-fun res!86159 () Bool)

(assert (=> b!104638 (=> res!86159 e!68526)))

(assert (=> b!104638 (= res!86159 (= (size!2222 (buf!2588 (_1!4568 lt!152968))) #b00000000000000000000000000000000))))

(declare-fun b!104639 () Bool)

(assert (=> b!104639 (= e!68526 (arrayBitRangesEq!0 (buf!2588 (_1!4568 lt!152968)) (buf!2588 (_2!4568 lt!152968)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2222 (buf!2588 (_1!4568 lt!152968))) (currentByte!5073 (_1!4568 lt!152968)) (currentBit!5068 (_1!4568 lt!152968)))))))

(assert (= (and d!32466 res!86158) b!104637))

(assert (= (and b!104637 res!86157) b!104638))

(assert (= (and b!104638 (not res!86159)) b!104639))

(declare-fun m!153219 () Bool)

(assert (=> b!104637 m!153219))

(declare-fun m!153221 () Bool)

(assert (=> b!104637 m!153221))

(assert (=> b!104639 m!153219))

(assert (=> b!104639 m!153219))

(declare-fun m!153223 () Bool)

(assert (=> b!104639 m!153223))

(assert (=> d!32260 d!32466))

(declare-fun d!32468 () Bool)

(declare-fun res!86161 () Bool)

(declare-fun e!68529 () Bool)

(assert (=> d!32468 (=> (not res!86161) (not e!68529))))

(assert (=> d!32468 (= res!86161 (= (size!2222 (buf!2588 lt!152978)) (size!2222 (buf!2588 lt!152978))))))

(assert (=> d!32468 (= (isPrefixOf!0 lt!152978 lt!152978) e!68529)))

(declare-fun b!104640 () Bool)

(declare-fun res!86160 () Bool)

(assert (=> b!104640 (=> (not res!86160) (not e!68529))))

(assert (=> b!104640 (= res!86160 (bvsle (bitIndex!0 (size!2222 (buf!2588 lt!152978)) (currentByte!5073 lt!152978) (currentBit!5068 lt!152978)) (bitIndex!0 (size!2222 (buf!2588 lt!152978)) (currentByte!5073 lt!152978) (currentBit!5068 lt!152978))))))

(declare-fun b!104641 () Bool)

(declare-fun e!68528 () Bool)

(assert (=> b!104641 (= e!68529 e!68528)))

(declare-fun res!86162 () Bool)

(assert (=> b!104641 (=> res!86162 e!68528)))

(assert (=> b!104641 (= res!86162 (= (size!2222 (buf!2588 lt!152978)) #b00000000000000000000000000000000))))

(declare-fun b!104642 () Bool)

(assert (=> b!104642 (= e!68528 (arrayBitRangesEq!0 (buf!2588 lt!152978) (buf!2588 lt!152978) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2222 (buf!2588 lt!152978)) (currentByte!5073 lt!152978) (currentBit!5068 lt!152978))))))

(assert (= (and d!32468 res!86161) b!104640))

(assert (= (and b!104640 res!86160) b!104641))

(assert (= (and b!104641 (not res!86162)) b!104642))

(assert (=> b!104640 m!153215))

(assert (=> b!104640 m!153215))

(assert (=> b!104642 m!153215))

(assert (=> b!104642 m!153215))

(declare-fun m!153225 () Bool)

(assert (=> b!104642 m!153225))

(assert (=> d!32260 d!32468))

(declare-fun d!32470 () Bool)

(declare-fun res!86164 () Bool)

(declare-fun e!68531 () Bool)

(assert (=> d!32470 (=> (not res!86164) (not e!68531))))

(assert (=> d!32470 (= res!86164 (= (size!2222 (buf!2588 (_2!4566 lt!152821))) (size!2222 (buf!2588 (_2!4566 lt!152821)))))))

(assert (=> d!32470 (= (isPrefixOf!0 (_2!4566 lt!152821) (_2!4566 lt!152821)) e!68531)))

(declare-fun b!104643 () Bool)

(declare-fun res!86163 () Bool)

(assert (=> b!104643 (=> (not res!86163) (not e!68531))))

(assert (=> b!104643 (= res!86163 (bvsle (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!152821))) (currentByte!5073 (_2!4566 lt!152821)) (currentBit!5068 (_2!4566 lt!152821))) (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!152821))) (currentByte!5073 (_2!4566 lt!152821)) (currentBit!5068 (_2!4566 lt!152821)))))))

(declare-fun b!104644 () Bool)

(declare-fun e!68530 () Bool)

(assert (=> b!104644 (= e!68531 e!68530)))

(declare-fun res!86165 () Bool)

(assert (=> b!104644 (=> res!86165 e!68530)))

(assert (=> b!104644 (= res!86165 (= (size!2222 (buf!2588 (_2!4566 lt!152821))) #b00000000000000000000000000000000))))

(declare-fun b!104645 () Bool)

(assert (=> b!104645 (= e!68530 (arrayBitRangesEq!0 (buf!2588 (_2!4566 lt!152821)) (buf!2588 (_2!4566 lt!152821)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!152821))) (currentByte!5073 (_2!4566 lt!152821)) (currentBit!5068 (_2!4566 lt!152821)))))))

(assert (= (and d!32470 res!86164) b!104643))

(assert (= (and b!104643 res!86163) b!104644))

(assert (= (and b!104644 (not res!86165)) b!104645))

(assert (=> b!104643 m!152439))

(assert (=> b!104643 m!152439))

(assert (=> b!104645 m!152439))

(assert (=> b!104645 m!152439))

(declare-fun m!153227 () Bool)

(assert (=> b!104645 m!153227))

(assert (=> d!32260 d!32470))

(declare-fun d!32472 () Bool)

(declare-fun res!86167 () Bool)

(declare-fun e!68533 () Bool)

(assert (=> d!32472 (=> (not res!86167) (not e!68533))))

(assert (=> d!32472 (= res!86167 (= (size!2222 (buf!2588 (_2!4566 lt!152813))) (size!2222 (buf!2588 (_2!4566 lt!152813)))))))

(assert (=> d!32472 (= (isPrefixOf!0 (_2!4566 lt!152813) (_2!4566 lt!152813)) e!68533)))

(declare-fun b!104646 () Bool)

(declare-fun res!86166 () Bool)

(assert (=> b!104646 (=> (not res!86166) (not e!68533))))

(assert (=> b!104646 (= res!86166 (bvsle (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!152813))) (currentByte!5073 (_2!4566 lt!152813)) (currentBit!5068 (_2!4566 lt!152813))) (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!152813))) (currentByte!5073 (_2!4566 lt!152813)) (currentBit!5068 (_2!4566 lt!152813)))))))

(declare-fun b!104647 () Bool)

(declare-fun e!68532 () Bool)

(assert (=> b!104647 (= e!68533 e!68532)))

(declare-fun res!86168 () Bool)

(assert (=> b!104647 (=> res!86168 e!68532)))

(assert (=> b!104647 (= res!86168 (= (size!2222 (buf!2588 (_2!4566 lt!152813))) #b00000000000000000000000000000000))))

(declare-fun b!104648 () Bool)

(assert (=> b!104648 (= e!68532 (arrayBitRangesEq!0 (buf!2588 (_2!4566 lt!152813)) (buf!2588 (_2!4566 lt!152813)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!152813))) (currentByte!5073 (_2!4566 lt!152813)) (currentBit!5068 (_2!4566 lt!152813)))))))

(assert (= (and d!32472 res!86167) b!104646))

(assert (= (and b!104646 res!86166) b!104647))

(assert (= (and b!104647 (not res!86168)) b!104648))

(assert (=> b!104646 m!152583))

(assert (=> b!104646 m!152583))

(assert (=> b!104648 m!152583))

(assert (=> b!104648 m!152583))

(declare-fun m!153229 () Bool)

(assert (=> b!104648 m!153229))

(assert (=> d!32260 d!32472))

(declare-fun d!32474 () Bool)

(assert (=> d!32474 (isPrefixOf!0 lt!152978 lt!152978)))

(declare-fun lt!153879 () Unit!6388)

(assert (=> d!32474 (= lt!153879 (choose!11 lt!152978))))

(assert (=> d!32474 (= (lemmaIsPrefixRefl!0 lt!152978) lt!153879)))

(declare-fun bs!7969 () Bool)

(assert (= bs!7969 d!32474))

(assert (=> bs!7969 m!152569))

(declare-fun m!153231 () Bool)

(assert (=> bs!7969 m!153231))

(assert (=> d!32260 d!32474))

(declare-fun d!32476 () Bool)

(assert (=> d!32476 (isPrefixOf!0 lt!152978 (_2!4566 lt!152813))))

(declare-fun lt!153880 () Unit!6388)

(assert (=> d!32476 (= lt!153880 (choose!30 lt!152978 (_2!4566 lt!152821) (_2!4566 lt!152813)))))

(assert (=> d!32476 (isPrefixOf!0 lt!152978 (_2!4566 lt!152821))))

(assert (=> d!32476 (= (lemmaIsPrefixTransitive!0 lt!152978 (_2!4566 lt!152821) (_2!4566 lt!152813)) lt!153880)))

(declare-fun bs!7970 () Bool)

(assert (= bs!7970 d!32476))

(assert (=> bs!7970 m!152557))

(declare-fun m!153233 () Bool)

(assert (=> bs!7970 m!153233))

(declare-fun m!153235 () Bool)

(assert (=> bs!7970 m!153235))

(assert (=> d!32260 d!32476))

(declare-fun d!32478 () Bool)

(assert (=> d!32478 (isPrefixOf!0 lt!152978 (_2!4566 lt!152813))))

(declare-fun lt!153881 () Unit!6388)

(assert (=> d!32478 (= lt!153881 (choose!30 lt!152978 (_2!4566 lt!152813) (_2!4566 lt!152813)))))

(assert (=> d!32478 (isPrefixOf!0 lt!152978 (_2!4566 lt!152813))))

(assert (=> d!32478 (= (lemmaIsPrefixTransitive!0 lt!152978 (_2!4566 lt!152813) (_2!4566 lt!152813)) lt!153881)))

(declare-fun bs!7971 () Bool)

(assert (= bs!7971 d!32478))

(assert (=> bs!7971 m!152557))

(declare-fun m!153237 () Bool)

(assert (=> bs!7971 m!153237))

(assert (=> bs!7971 m!152557))

(assert (=> d!32260 d!32478))

(declare-fun d!32480 () Bool)

(declare-fun res!86170 () Bool)

(declare-fun e!68535 () Bool)

(assert (=> d!32480 (=> (not res!86170) (not e!68535))))

(assert (=> d!32480 (= res!86170 (= (size!2222 (buf!2588 (_2!4566 lt!152821))) (size!2222 (buf!2588 (_2!4566 lt!152813)))))))

(assert (=> d!32480 (= (isPrefixOf!0 (_2!4566 lt!152821) (_2!4566 lt!152813)) e!68535)))

(declare-fun b!104649 () Bool)

(declare-fun res!86169 () Bool)

(assert (=> b!104649 (=> (not res!86169) (not e!68535))))

(assert (=> b!104649 (= res!86169 (bvsle (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!152821))) (currentByte!5073 (_2!4566 lt!152821)) (currentBit!5068 (_2!4566 lt!152821))) (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!152813))) (currentByte!5073 (_2!4566 lt!152813)) (currentBit!5068 (_2!4566 lt!152813)))))))

(declare-fun b!104650 () Bool)

(declare-fun e!68534 () Bool)

(assert (=> b!104650 (= e!68535 e!68534)))

(declare-fun res!86171 () Bool)

(assert (=> b!104650 (=> res!86171 e!68534)))

(assert (=> b!104650 (= res!86171 (= (size!2222 (buf!2588 (_2!4566 lt!152821))) #b00000000000000000000000000000000))))

(declare-fun b!104651 () Bool)

(assert (=> b!104651 (= e!68534 (arrayBitRangesEq!0 (buf!2588 (_2!4566 lt!152821)) (buf!2588 (_2!4566 lt!152813)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!152821))) (currentByte!5073 (_2!4566 lt!152821)) (currentBit!5068 (_2!4566 lt!152821)))))))

(assert (= (and d!32480 res!86170) b!104649))

(assert (= (and b!104649 res!86169) b!104650))

(assert (= (and b!104650 (not res!86171)) b!104651))

(assert (=> b!104649 m!152439))

(assert (=> b!104649 m!152583))

(assert (=> b!104651 m!152439))

(assert (=> b!104651 m!152439))

(declare-fun m!153239 () Bool)

(assert (=> b!104651 m!153239))

(assert (=> d!32260 d!32480))

(declare-fun d!32482 () Bool)

(declare-fun e!68536 () Bool)

(assert (=> d!32482 e!68536))

(declare-fun res!86173 () Bool)

(assert (=> d!32482 (=> (not res!86173) (not e!68536))))

(declare-fun lt!153886 () (_ BitVec 64))

(declare-fun lt!153885 () (_ BitVec 64))

(declare-fun lt!153884 () (_ BitVec 64))

(assert (=> d!32482 (= res!86173 (= lt!153885 (bvsub lt!153884 lt!153886)))))

(assert (=> d!32482 (or (= (bvand lt!153884 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!153886 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!153884 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!153884 lt!153886) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32482 (= lt!153886 (remainingBits!0 ((_ sign_extend 32) (size!2222 (buf!2588 lt!153837))) ((_ sign_extend 32) (currentByte!5073 lt!153837)) ((_ sign_extend 32) (currentBit!5068 lt!153837))))))

(declare-fun lt!153883 () (_ BitVec 64))

(declare-fun lt!153882 () (_ BitVec 64))

(assert (=> d!32482 (= lt!153884 (bvmul lt!153883 lt!153882))))

(assert (=> d!32482 (or (= lt!153883 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!153882 (bvsdiv (bvmul lt!153883 lt!153882) lt!153883)))))

(assert (=> d!32482 (= lt!153882 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!32482 (= lt!153883 ((_ sign_extend 32) (size!2222 (buf!2588 lt!153837))))))

(assert (=> d!32482 (= lt!153885 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5073 lt!153837)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5068 lt!153837))))))

(assert (=> d!32482 (invariant!0 (currentBit!5068 lt!153837) (currentByte!5073 lt!153837) (size!2222 (buf!2588 lt!153837)))))

(assert (=> d!32482 (= (bitIndex!0 (size!2222 (buf!2588 lt!153837)) (currentByte!5073 lt!153837) (currentBit!5068 lt!153837)) lt!153885)))

(declare-fun b!104652 () Bool)

(declare-fun res!86172 () Bool)

(assert (=> b!104652 (=> (not res!86172) (not e!68536))))

(assert (=> b!104652 (= res!86172 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!153885))))

(declare-fun b!104653 () Bool)

(declare-fun lt!153887 () (_ BitVec 64))

(assert (=> b!104653 (= e!68536 (bvsle lt!153885 (bvmul lt!153887 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!104653 (or (= lt!153887 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!153887 #b0000000000000000000000000000000000000000000000000000000000001000) lt!153887)))))

(assert (=> b!104653 (= lt!153887 ((_ sign_extend 32) (size!2222 (buf!2588 lt!153837))))))

(assert (= (and d!32482 res!86173) b!104652))

(assert (= (and b!104652 res!86172) b!104653))

(declare-fun m!153241 () Bool)

(assert (=> d!32482 m!153241))

(declare-fun m!153243 () Bool)

(assert (=> d!32482 m!153243))

(assert (=> d!32412 d!32482))

(declare-fun d!32484 () Bool)

(declare-fun e!68537 () Bool)

(assert (=> d!32484 e!68537))

(declare-fun res!86175 () Bool)

(assert (=> d!32484 (=> (not res!86175) (not e!68537))))

(declare-fun lt!153890 () (_ BitVec 64))

(declare-fun lt!153892 () (_ BitVec 64))

(declare-fun lt!153891 () (_ BitVec 64))

(assert (=> d!32484 (= res!86175 (= lt!153891 (bvsub lt!153890 lt!153892)))))

(assert (=> d!32484 (or (= (bvand lt!153890 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!153892 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!153890 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!153890 lt!153892) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32484 (= lt!153892 (remainingBits!0 ((_ sign_extend 32) (size!2222 (buf!2588 (_1!4568 lt!152809)))) ((_ sign_extend 32) (currentByte!5073 (_1!4568 lt!152809))) ((_ sign_extend 32) (currentBit!5068 (_1!4568 lt!152809)))))))

(declare-fun lt!153889 () (_ BitVec 64))

(declare-fun lt!153888 () (_ BitVec 64))

(assert (=> d!32484 (= lt!153890 (bvmul lt!153889 lt!153888))))

(assert (=> d!32484 (or (= lt!153889 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!153888 (bvsdiv (bvmul lt!153889 lt!153888) lt!153889)))))

(assert (=> d!32484 (= lt!153888 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!32484 (= lt!153889 ((_ sign_extend 32) (size!2222 (buf!2588 (_1!4568 lt!152809)))))))

(assert (=> d!32484 (= lt!153891 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5073 (_1!4568 lt!152809))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5068 (_1!4568 lt!152809)))))))

(assert (=> d!32484 (invariant!0 (currentBit!5068 (_1!4568 lt!152809)) (currentByte!5073 (_1!4568 lt!152809)) (size!2222 (buf!2588 (_1!4568 lt!152809))))))

(assert (=> d!32484 (= (bitIndex!0 (size!2222 (buf!2588 (_1!4568 lt!152809))) (currentByte!5073 (_1!4568 lt!152809)) (currentBit!5068 (_1!4568 lt!152809))) lt!153891)))

(declare-fun b!104654 () Bool)

(declare-fun res!86174 () Bool)

(assert (=> b!104654 (=> (not res!86174) (not e!68537))))

(assert (=> b!104654 (= res!86174 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!153891))))

(declare-fun b!104655 () Bool)

(declare-fun lt!153893 () (_ BitVec 64))

(assert (=> b!104655 (= e!68537 (bvsle lt!153891 (bvmul lt!153893 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!104655 (or (= lt!153893 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!153893 #b0000000000000000000000000000000000000000000000000000000000001000) lt!153893)))))

(assert (=> b!104655 (= lt!153893 ((_ sign_extend 32) (size!2222 (buf!2588 (_1!4568 lt!152809)))))))

(assert (= (and d!32484 res!86175) b!104654))

(assert (= (and b!104654 res!86174) b!104655))

(declare-fun m!153245 () Bool)

(assert (=> d!32484 m!153245))

(declare-fun m!153247 () Bool)

(assert (=> d!32484 m!153247))

(assert (=> d!32412 d!32484))

(declare-fun d!32486 () Bool)

(declare-fun lt!153906 () (_ BitVec 32))

(assert (=> d!32486 (= lt!153906 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!153908 () (_ BitVec 32))

(assert (=> d!32486 (= lt!153908 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!68543 () Bool)

(assert (=> d!32486 e!68543))

(declare-fun res!86180 () Bool)

(assert (=> d!32486 (=> (not res!86180) (not e!68543))))

(assert (=> d!32486 (= res!86180 (moveBitIndexPrecond!0 (_1!4568 lt!152809) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun Unit!6416 () Unit!6388)

(declare-fun Unit!6417 () Unit!6388)

(declare-fun Unit!6418 () Unit!6388)

(assert (=> d!32486 (= (moveBitIndex!0 (_1!4568 lt!152809) #b0000000000000000000000000000000000000000000000000000000000000001) (ite (bvslt (bvadd (currentBit!5068 (_1!4568 lt!152809)) lt!153906) #b00000000000000000000000000000000) (tuple2!8623 Unit!6416 (BitStream!3919 (buf!2588 (_1!4568 lt!152809)) (bvsub (bvadd (currentByte!5073 (_1!4568 lt!152809)) lt!153908) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!153906 (currentBit!5068 (_1!4568 lt!152809))))) (ite (bvsge (bvadd (currentBit!5068 (_1!4568 lt!152809)) lt!153906) #b00000000000000000000000000001000) (tuple2!8623 Unit!6417 (BitStream!3919 (buf!2588 (_1!4568 lt!152809)) (bvadd (currentByte!5073 (_1!4568 lt!152809)) lt!153908 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!5068 (_1!4568 lt!152809)) lt!153906) #b00000000000000000000000000001000))) (tuple2!8623 Unit!6418 (BitStream!3919 (buf!2588 (_1!4568 lt!152809)) (bvadd (currentByte!5073 (_1!4568 lt!152809)) lt!153908) (bvadd (currentBit!5068 (_1!4568 lt!152809)) lt!153906))))))))

(declare-fun b!104660 () Bool)

(declare-fun e!68542 () Bool)

(assert (=> b!104660 (= e!68543 e!68542)))

(declare-fun res!86181 () Bool)

(assert (=> b!104660 (=> (not res!86181) (not e!68542))))

(declare-fun lt!153909 () (_ BitVec 64))

(declare-fun lt!153911 () tuple2!8622)

(assert (=> b!104660 (= res!86181 (= (bvadd lt!153909 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!153911))) (currentByte!5073 (_2!4566 lt!153911)) (currentBit!5068 (_2!4566 lt!153911)))))))

(assert (=> b!104660 (or (not (= (bvand lt!153909 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!153909 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!153909 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!104660 (= lt!153909 (bitIndex!0 (size!2222 (buf!2588 (_1!4568 lt!152809))) (currentByte!5073 (_1!4568 lt!152809)) (currentBit!5068 (_1!4568 lt!152809))))))

(declare-fun lt!153910 () (_ BitVec 32))

(declare-fun lt!153907 () (_ BitVec 32))

(declare-fun Unit!6419 () Unit!6388)

(declare-fun Unit!6420 () Unit!6388)

(declare-fun Unit!6421 () Unit!6388)

(assert (=> b!104660 (= lt!153911 (ite (bvslt (bvadd (currentBit!5068 (_1!4568 lt!152809)) lt!153910) #b00000000000000000000000000000000) (tuple2!8623 Unit!6419 (BitStream!3919 (buf!2588 (_1!4568 lt!152809)) (bvsub (bvadd (currentByte!5073 (_1!4568 lt!152809)) lt!153907) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!153910 (currentBit!5068 (_1!4568 lt!152809))))) (ite (bvsge (bvadd (currentBit!5068 (_1!4568 lt!152809)) lt!153910) #b00000000000000000000000000001000) (tuple2!8623 Unit!6420 (BitStream!3919 (buf!2588 (_1!4568 lt!152809)) (bvadd (currentByte!5073 (_1!4568 lt!152809)) lt!153907 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!5068 (_1!4568 lt!152809)) lt!153910) #b00000000000000000000000000001000))) (tuple2!8623 Unit!6421 (BitStream!3919 (buf!2588 (_1!4568 lt!152809)) (bvadd (currentByte!5073 (_1!4568 lt!152809)) lt!153907) (bvadd (currentBit!5068 (_1!4568 lt!152809)) lt!153910))))))))

(assert (=> b!104660 (= lt!153910 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!104660 (= lt!153907 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!104661 () Bool)

(assert (=> b!104661 (= e!68542 (and (= (size!2222 (buf!2588 (_1!4568 lt!152809))) (size!2222 (buf!2588 (_2!4566 lt!153911)))) (= (buf!2588 (_1!4568 lt!152809)) (buf!2588 (_2!4566 lt!153911)))))))

(assert (= (and d!32486 res!86180) b!104660))

(assert (= (and b!104660 res!86181) b!104661))

(assert (=> d!32486 m!153191))

(declare-fun m!153249 () Bool)

(assert (=> b!104660 m!153249))

(assert (=> b!104660 m!153185))

(assert (=> d!32412 d!32486))

(declare-fun d!32490 () Bool)

(declare-fun res!86184 () Bool)

(declare-fun e!68546 () Bool)

(assert (=> d!32490 (=> (not res!86184) (not e!68546))))

(assert (=> d!32490 (= res!86184 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!2222 (buf!2588 (_1!4568 lt!152809))))) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2222 (buf!2588 (_1!4568 lt!152809))))))))))

(assert (=> d!32490 (= (moveBitIndexPrecond!0 (_1!4568 lt!152809) #b0000000000000000000000000000000000000000000000000000000000000001) e!68546)))

(declare-fun b!104665 () Bool)

(declare-fun lt!153914 () (_ BitVec 64))

(assert (=> b!104665 (= e!68546 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!153914) (bvsle lt!153914 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2222 (buf!2588 (_1!4568 lt!152809))))))))))

(assert (=> b!104665 (= lt!153914 (bvadd (bitIndex!0 (size!2222 (buf!2588 (_1!4568 lt!152809))) (currentByte!5073 (_1!4568 lt!152809)) (currentBit!5068 (_1!4568 lt!152809))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (= (and d!32490 res!86184) b!104665))

(assert (=> b!104665 m!153185))

(assert (=> d!32412 d!32490))

(declare-fun d!32492 () Bool)

(declare-fun e!68553 () Bool)

(assert (=> d!32492 e!68553))

(declare-fun res!86187 () Bool)

(assert (=> d!32492 (=> (not res!86187) (not e!68553))))

(declare-fun increaseBitIndex!0 (BitStream!3918) tuple2!8622)

(assert (=> d!32492 (= res!86187 (= (buf!2588 (_2!4566 (increaseBitIndex!0 lt!152823))) (buf!2588 lt!152823)))))

(declare-fun lt!153935 () Bool)

(assert (=> d!32492 (= lt!153935 (not (= (bvand ((_ sign_extend 24) (select (arr!2815 (buf!2588 lt!152823)) (currentByte!5073 lt!152823))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5068 lt!152823)))) #b00000000000000000000000000000000)))))

(declare-fun lt!153933 () tuple2!8642)

(assert (=> d!32492 (= lt!153933 (tuple2!8643 (not (= (bvand ((_ sign_extend 24) (select (arr!2815 (buf!2588 lt!152823)) (currentByte!5073 lt!152823))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5068 lt!152823)))) #b00000000000000000000000000000000)) (_2!4566 (increaseBitIndex!0 lt!152823))))))

(assert (=> d!32492 (validate_offset_bit!0 ((_ sign_extend 32) (size!2222 (buf!2588 lt!152823))) ((_ sign_extend 32) (currentByte!5073 lt!152823)) ((_ sign_extend 32) (currentBit!5068 lt!152823)))))

(assert (=> d!32492 (= (readBit!0 lt!152823) lt!153933)))

(declare-fun b!104668 () Bool)

(declare-fun lt!153931 () (_ BitVec 64))

(declare-fun lt!153934 () (_ BitVec 64))

(assert (=> b!104668 (= e!68553 (= (bitIndex!0 (size!2222 (buf!2588 (_2!4566 (increaseBitIndex!0 lt!152823)))) (currentByte!5073 (_2!4566 (increaseBitIndex!0 lt!152823))) (currentBit!5068 (_2!4566 (increaseBitIndex!0 lt!152823)))) (bvadd lt!153934 lt!153931)))))

(assert (=> b!104668 (or (not (= (bvand lt!153934 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!153931 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!153934 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!153934 lt!153931) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!104668 (= lt!153931 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!104668 (= lt!153934 (bitIndex!0 (size!2222 (buf!2588 lt!152823)) (currentByte!5073 lt!152823) (currentBit!5068 lt!152823)))))

(declare-fun lt!153930 () Bool)

(assert (=> b!104668 (= lt!153930 (not (= (bvand ((_ sign_extend 24) (select (arr!2815 (buf!2588 lt!152823)) (currentByte!5073 lt!152823))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5068 lt!152823)))) #b00000000000000000000000000000000)))))

(declare-fun lt!153932 () Bool)

(assert (=> b!104668 (= lt!153932 (not (= (bvand ((_ sign_extend 24) (select (arr!2815 (buf!2588 lt!152823)) (currentByte!5073 lt!152823))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5068 lt!152823)))) #b00000000000000000000000000000000)))))

(declare-fun lt!153929 () Bool)

(assert (=> b!104668 (= lt!153929 (not (= (bvand ((_ sign_extend 24) (select (arr!2815 (buf!2588 lt!152823)) (currentByte!5073 lt!152823))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5068 lt!152823)))) #b00000000000000000000000000000000)))))

(assert (= (and d!32492 res!86187) b!104668))

(declare-fun m!153251 () Bool)

(assert (=> d!32492 m!153251))

(declare-fun m!153253 () Bool)

(assert (=> d!32492 m!153253))

(declare-fun m!153255 () Bool)

(assert (=> d!32492 m!153255))

(declare-fun m!153257 () Bool)

(assert (=> d!32492 m!153257))

(assert (=> b!104668 m!153253))

(declare-fun m!153259 () Bool)

(assert (=> b!104668 m!153259))

(assert (=> b!104668 m!153251))

(assert (=> b!104668 m!153255))

(declare-fun m!153261 () Bool)

(assert (=> b!104668 m!153261))

(assert (=> d!32362 d!32492))

(declare-fun d!32494 () Bool)

(assert (=> d!32494 (= (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!104463 d!32494))

(declare-fun b!104669 () Bool)

(declare-fun res!86190 () Bool)

(declare-fun e!68554 () Bool)

(assert (=> b!104669 (=> (not res!86190) (not e!68554))))

(declare-fun lt!153937 () tuple2!8626)

(assert (=> b!104669 (= res!86190 (isPrefixOf!0 (_2!4568 lt!153937) (_2!4566 lt!153451)))))

(declare-fun b!104670 () Bool)

(declare-fun e!68555 () Unit!6388)

(declare-fun lt!153949 () Unit!6388)

(assert (=> b!104670 (= e!68555 lt!153949)))

(declare-fun lt!153946 () (_ BitVec 64))

(assert (=> b!104670 (= lt!153946 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!153955 () (_ BitVec 64))

(assert (=> b!104670 (= lt!153955 (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!152821))) (currentByte!5073 (_2!4566 lt!152821)) (currentBit!5068 (_2!4566 lt!152821))))))

(assert (=> b!104670 (= lt!153949 (arrayBitRangesEqSymmetric!0 (buf!2588 (_2!4566 lt!152821)) (buf!2588 (_2!4566 lt!153451)) lt!153946 lt!153955))))

(assert (=> b!104670 (arrayBitRangesEq!0 (buf!2588 (_2!4566 lt!153451)) (buf!2588 (_2!4566 lt!152821)) lt!153946 lt!153955)))

(declare-fun b!104671 () Bool)

(declare-fun Unit!6422 () Unit!6388)

(assert (=> b!104671 (= e!68555 Unit!6422)))

(declare-fun d!32496 () Bool)

(assert (=> d!32496 e!68554))

(declare-fun res!86189 () Bool)

(assert (=> d!32496 (=> (not res!86189) (not e!68554))))

(assert (=> d!32496 (= res!86189 (isPrefixOf!0 (_1!4568 lt!153937) (_2!4568 lt!153937)))))

(declare-fun lt!153947 () BitStream!3918)

(assert (=> d!32496 (= lt!153937 (tuple2!8627 lt!153947 (_2!4566 lt!153451)))))

(declare-fun lt!153943 () Unit!6388)

(declare-fun lt!153941 () Unit!6388)

(assert (=> d!32496 (= lt!153943 lt!153941)))

(assert (=> d!32496 (isPrefixOf!0 lt!153947 (_2!4566 lt!153451))))

(assert (=> d!32496 (= lt!153941 (lemmaIsPrefixTransitive!0 lt!153947 (_2!4566 lt!153451) (_2!4566 lt!153451)))))

(declare-fun lt!153938 () Unit!6388)

(declare-fun lt!153940 () Unit!6388)

(assert (=> d!32496 (= lt!153938 lt!153940)))

(assert (=> d!32496 (isPrefixOf!0 lt!153947 (_2!4566 lt!153451))))

(assert (=> d!32496 (= lt!153940 (lemmaIsPrefixTransitive!0 lt!153947 (_2!4566 lt!152821) (_2!4566 lt!153451)))))

(declare-fun lt!153951 () Unit!6388)

(assert (=> d!32496 (= lt!153951 e!68555)))

(declare-fun c!6447 () Bool)

(assert (=> d!32496 (= c!6447 (not (= (size!2222 (buf!2588 (_2!4566 lt!152821))) #b00000000000000000000000000000000)))))

(declare-fun lt!153953 () Unit!6388)

(declare-fun lt!153952 () Unit!6388)

(assert (=> d!32496 (= lt!153953 lt!153952)))

(assert (=> d!32496 (isPrefixOf!0 (_2!4566 lt!153451) (_2!4566 lt!153451))))

(assert (=> d!32496 (= lt!153952 (lemmaIsPrefixRefl!0 (_2!4566 lt!153451)))))

(declare-fun lt!153936 () Unit!6388)

(declare-fun lt!153954 () Unit!6388)

(assert (=> d!32496 (= lt!153936 lt!153954)))

(assert (=> d!32496 (= lt!153954 (lemmaIsPrefixRefl!0 (_2!4566 lt!153451)))))

(declare-fun lt!153942 () Unit!6388)

(declare-fun lt!153945 () Unit!6388)

(assert (=> d!32496 (= lt!153942 lt!153945)))

(assert (=> d!32496 (isPrefixOf!0 lt!153947 lt!153947)))

(assert (=> d!32496 (= lt!153945 (lemmaIsPrefixRefl!0 lt!153947))))

(declare-fun lt!153948 () Unit!6388)

(declare-fun lt!153939 () Unit!6388)

(assert (=> d!32496 (= lt!153948 lt!153939)))

(assert (=> d!32496 (isPrefixOf!0 (_2!4566 lt!152821) (_2!4566 lt!152821))))

(assert (=> d!32496 (= lt!153939 (lemmaIsPrefixRefl!0 (_2!4566 lt!152821)))))

(assert (=> d!32496 (= lt!153947 (BitStream!3919 (buf!2588 (_2!4566 lt!153451)) (currentByte!5073 (_2!4566 lt!152821)) (currentBit!5068 (_2!4566 lt!152821))))))

(assert (=> d!32496 (isPrefixOf!0 (_2!4566 lt!152821) (_2!4566 lt!153451))))

(assert (=> d!32496 (= (reader!0 (_2!4566 lt!152821) (_2!4566 lt!153451)) lt!153937)))

(declare-fun b!104672 () Bool)

(declare-fun res!86188 () Bool)

(assert (=> b!104672 (=> (not res!86188) (not e!68554))))

(assert (=> b!104672 (= res!86188 (isPrefixOf!0 (_1!4568 lt!153937) (_2!4566 lt!152821)))))

(declare-fun lt!153950 () (_ BitVec 64))

(declare-fun lt!153944 () (_ BitVec 64))

(declare-fun b!104673 () Bool)

(assert (=> b!104673 (= e!68554 (= (_1!4568 lt!153937) (withMovedBitIndex!0 (_2!4568 lt!153937) (bvsub lt!153944 lt!153950))))))

(assert (=> b!104673 (or (= (bvand lt!153944 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!153950 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!153944 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!153944 lt!153950) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!104673 (= lt!153950 (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!153451))) (currentByte!5073 (_2!4566 lt!153451)) (currentBit!5068 (_2!4566 lt!153451))))))

(assert (=> b!104673 (= lt!153944 (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!152821))) (currentByte!5073 (_2!4566 lt!152821)) (currentBit!5068 (_2!4566 lt!152821))))))

(assert (= (and d!32496 c!6447) b!104670))

(assert (= (and d!32496 (not c!6447)) b!104671))

(assert (= (and d!32496 res!86189) b!104672))

(assert (= (and b!104672 res!86188) b!104669))

(assert (= (and b!104669 res!86190) b!104673))

(declare-fun m!153263 () Bool)

(assert (=> b!104672 m!153263))

(declare-fun m!153265 () Bool)

(assert (=> b!104669 m!153265))

(declare-fun m!153267 () Bool)

(assert (=> d!32496 m!153267))

(declare-fun m!153269 () Bool)

(assert (=> d!32496 m!153269))

(declare-fun m!153271 () Bool)

(assert (=> d!32496 m!153271))

(assert (=> d!32496 m!152561))

(assert (=> d!32496 m!152563))

(declare-fun m!153273 () Bool)

(assert (=> d!32496 m!153273))

(declare-fun m!153275 () Bool)

(assert (=> d!32496 m!153275))

(declare-fun m!153277 () Bool)

(assert (=> d!32496 m!153277))

(assert (=> d!32496 m!152795))

(declare-fun m!153279 () Bool)

(assert (=> d!32496 m!153279))

(declare-fun m!153281 () Bool)

(assert (=> d!32496 m!153281))

(assert (=> b!104670 m!152439))

(declare-fun m!153283 () Bool)

(assert (=> b!104670 m!153283))

(declare-fun m!153285 () Bool)

(assert (=> b!104670 m!153285))

(declare-fun m!153287 () Bool)

(assert (=> b!104673 m!153287))

(assert (=> b!104673 m!152789))

(assert (=> b!104673 m!152439))

(assert (=> b!104463 d!32496))

(declare-fun d!32498 () Bool)

(assert (=> d!32498 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2222 (buf!2588 (_2!4566 lt!153451)))) ((_ sign_extend 32) (currentByte!5073 (_2!4566 lt!152821))) ((_ sign_extend 32) (currentBit!5068 (_2!4566 lt!152821))) lt!153457) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2222 (buf!2588 (_2!4566 lt!153451)))) ((_ sign_extend 32) (currentByte!5073 (_2!4566 lt!152821))) ((_ sign_extend 32) (currentBit!5068 (_2!4566 lt!152821)))) lt!153457))))

(declare-fun bs!7972 () Bool)

(assert (= bs!7972 d!32498))

(declare-fun m!153289 () Bool)

(assert (=> bs!7972 m!153289))

(assert (=> b!104463 d!32498))

(declare-fun lt!153956 () tuple2!8644)

(declare-fun d!32500 () Bool)

(assert (=> d!32500 (= lt!153956 (readNLeastSignificantBitsLoop!0 (_1!4568 lt!153446) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!153434))))

(assert (=> d!32500 (= (readNLeastSignificantBitsLoopPure!0 (_1!4568 lt!153446) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!153434) (tuple2!8629 (_2!4577 lt!153956) (_1!4577 lt!153956)))))

(declare-fun bs!7973 () Bool)

(assert (= bs!7973 d!32500))

(declare-fun m!153291 () Bool)

(assert (=> bs!7973 m!153291))

(assert (=> b!104463 d!32500))

(declare-fun d!32502 () Bool)

(assert (=> d!32502 (validate_offset_bits!1 ((_ sign_extend 32) (size!2222 (buf!2588 (_2!4566 lt!153451)))) ((_ sign_extend 32) (currentByte!5073 (_2!4566 lt!152821))) ((_ sign_extend 32) (currentBit!5068 (_2!4566 lt!152821))) lt!153457)))

(declare-fun lt!153957 () Unit!6388)

(assert (=> d!32502 (= lt!153957 (choose!9 (_2!4566 lt!152821) (buf!2588 (_2!4566 lt!153451)) lt!153457 (BitStream!3919 (buf!2588 (_2!4566 lt!153451)) (currentByte!5073 (_2!4566 lt!152821)) (currentBit!5068 (_2!4566 lt!152821)))))))

(assert (=> d!32502 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4566 lt!152821) (buf!2588 (_2!4566 lt!153451)) lt!153457) lt!153957)))

(declare-fun bs!7974 () Bool)

(assert (= bs!7974 d!32502))

(assert (=> bs!7974 m!152895))

(declare-fun m!153293 () Bool)

(assert (=> bs!7974 m!153293))

(assert (=> b!104463 d!32502))

(declare-fun d!32504 () Bool)

(declare-fun e!68556 () Bool)

(assert (=> d!32504 e!68556))

(declare-fun res!86191 () Bool)

(assert (=> d!32504 (=> (not res!86191) (not e!68556))))

(assert (=> d!32504 (= res!86191 (= (buf!2588 (_2!4566 (increaseBitIndex!0 (_1!4568 lt!152809)))) (buf!2588 (_1!4568 lt!152809))))))

(declare-fun lt!153964 () Bool)

(assert (=> d!32504 (= lt!153964 (not (= (bvand ((_ sign_extend 24) (select (arr!2815 (buf!2588 (_1!4568 lt!152809))) (currentByte!5073 (_1!4568 lt!152809)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5068 (_1!4568 lt!152809))))) #b00000000000000000000000000000000)))))

(declare-fun lt!153962 () tuple2!8642)

(assert (=> d!32504 (= lt!153962 (tuple2!8643 (not (= (bvand ((_ sign_extend 24) (select (arr!2815 (buf!2588 (_1!4568 lt!152809))) (currentByte!5073 (_1!4568 lt!152809)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5068 (_1!4568 lt!152809))))) #b00000000000000000000000000000000)) (_2!4566 (increaseBitIndex!0 (_1!4568 lt!152809)))))))

(assert (=> d!32504 (validate_offset_bit!0 ((_ sign_extend 32) (size!2222 (buf!2588 (_1!4568 lt!152809)))) ((_ sign_extend 32) (currentByte!5073 (_1!4568 lt!152809))) ((_ sign_extend 32) (currentBit!5068 (_1!4568 lt!152809))))))

(assert (=> d!32504 (= (readBit!0 (_1!4568 lt!152809)) lt!153962)))

(declare-fun lt!153960 () (_ BitVec 64))

(declare-fun b!104674 () Bool)

(declare-fun lt!153963 () (_ BitVec 64))

(assert (=> b!104674 (= e!68556 (= (bitIndex!0 (size!2222 (buf!2588 (_2!4566 (increaseBitIndex!0 (_1!4568 lt!152809))))) (currentByte!5073 (_2!4566 (increaseBitIndex!0 (_1!4568 lt!152809)))) (currentBit!5068 (_2!4566 (increaseBitIndex!0 (_1!4568 lt!152809))))) (bvadd lt!153963 lt!153960)))))

(assert (=> b!104674 (or (not (= (bvand lt!153963 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!153960 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!153963 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!153963 lt!153960) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!104674 (= lt!153960 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!104674 (= lt!153963 (bitIndex!0 (size!2222 (buf!2588 (_1!4568 lt!152809))) (currentByte!5073 (_1!4568 lt!152809)) (currentBit!5068 (_1!4568 lt!152809))))))

(declare-fun lt!153959 () Bool)

(assert (=> b!104674 (= lt!153959 (not (= (bvand ((_ sign_extend 24) (select (arr!2815 (buf!2588 (_1!4568 lt!152809))) (currentByte!5073 (_1!4568 lt!152809)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5068 (_1!4568 lt!152809))))) #b00000000000000000000000000000000)))))

(declare-fun lt!153961 () Bool)

(assert (=> b!104674 (= lt!153961 (not (= (bvand ((_ sign_extend 24) (select (arr!2815 (buf!2588 (_1!4568 lt!152809))) (currentByte!5073 (_1!4568 lt!152809)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5068 (_1!4568 lt!152809))))) #b00000000000000000000000000000000)))))

(declare-fun lt!153958 () Bool)

(assert (=> b!104674 (= lt!153958 (not (= (bvand ((_ sign_extend 24) (select (arr!2815 (buf!2588 (_1!4568 lt!152809))) (currentByte!5073 (_1!4568 lt!152809)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5068 (_1!4568 lt!152809))))) #b00000000000000000000000000000000)))))

(assert (= (and d!32504 res!86191) b!104674))

(declare-fun m!153295 () Bool)

(assert (=> d!32504 m!153295))

(declare-fun m!153297 () Bool)

(assert (=> d!32504 m!153297))

(declare-fun m!153299 () Bool)

(assert (=> d!32504 m!153299))

(declare-fun m!153301 () Bool)

(assert (=> d!32504 m!153301))

(assert (=> b!104674 m!153297))

(assert (=> b!104674 m!153185))

(assert (=> b!104674 m!153295))

(assert (=> b!104674 m!153299))

(declare-fun m!153303 () Bool)

(assert (=> b!104674 m!153303))

(assert (=> d!32256 d!32504))

(declare-fun d!32506 () Bool)

(assert (=> d!32506 (= (remainingBits!0 ((_ sign_extend 32) (size!2222 (buf!2588 (_2!4566 lt!152813)))) ((_ sign_extend 32) (currentByte!5073 (_2!4566 lt!152821))) ((_ sign_extend 32) (currentBit!5068 (_2!4566 lt!152821)))) (bvsub (bvmul ((_ sign_extend 32) (size!2222 (buf!2588 (_2!4566 lt!152813)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5073 (_2!4566 lt!152821))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5068 (_2!4566 lt!152821))))))))

(assert (=> d!32364 d!32506))

(assert (=> b!104502 d!32438))

(declare-fun d!32508 () Bool)

(declare-fun e!68557 () Bool)

(assert (=> d!32508 e!68557))

(declare-fun res!86193 () Bool)

(assert (=> d!32508 (=> (not res!86193) (not e!68557))))

(declare-fun lt!153968 () (_ BitVec 64))

(declare-fun lt!153967 () (_ BitVec 64))

(declare-fun lt!153969 () (_ BitVec 64))

(assert (=> d!32508 (= res!86193 (= lt!153968 (bvsub lt!153967 lt!153969)))))

(assert (=> d!32508 (or (= (bvand lt!153967 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!153969 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!153967 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!153967 lt!153969) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32508 (= lt!153969 (remainingBits!0 ((_ sign_extend 32) (size!2222 (buf!2588 (_2!4566 lt!152813)))) ((_ sign_extend 32) (currentByte!5073 (_2!4566 lt!152813))) ((_ sign_extend 32) (currentBit!5068 (_2!4566 lt!152813)))))))

(declare-fun lt!153966 () (_ BitVec 64))

(declare-fun lt!153965 () (_ BitVec 64))

(assert (=> d!32508 (= lt!153967 (bvmul lt!153966 lt!153965))))

(assert (=> d!32508 (or (= lt!153966 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!153965 (bvsdiv (bvmul lt!153966 lt!153965) lt!153966)))))

(assert (=> d!32508 (= lt!153965 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!32508 (= lt!153966 ((_ sign_extend 32) (size!2222 (buf!2588 (_2!4566 lt!152813)))))))

(assert (=> d!32508 (= lt!153968 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5073 (_2!4566 lt!152813))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5068 (_2!4566 lt!152813)))))))

(assert (=> d!32508 (invariant!0 (currentBit!5068 (_2!4566 lt!152813)) (currentByte!5073 (_2!4566 lt!152813)) (size!2222 (buf!2588 (_2!4566 lt!152813))))))

(assert (=> d!32508 (= (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!152813))) (currentByte!5073 (_2!4566 lt!152813)) (currentBit!5068 (_2!4566 lt!152813))) lt!153968)))

(declare-fun b!104675 () Bool)

(declare-fun res!86192 () Bool)

(assert (=> b!104675 (=> (not res!86192) (not e!68557))))

(assert (=> b!104675 (= res!86192 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!153968))))

(declare-fun b!104676 () Bool)

(declare-fun lt!153970 () (_ BitVec 64))

(assert (=> b!104676 (= e!68557 (bvsle lt!153968 (bvmul lt!153970 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!104676 (or (= lt!153970 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!153970 #b0000000000000000000000000000000000000000000000000000000000001000) lt!153970)))))

(assert (=> b!104676 (= lt!153970 ((_ sign_extend 32) (size!2222 (buf!2588 (_2!4566 lt!152813)))))))

(assert (= (and d!32508 res!86193) b!104675))

(assert (= (and b!104675 res!86192) b!104676))

(declare-fun m!153305 () Bool)

(assert (=> d!32508 m!153305))

(assert (=> d!32508 m!152449))

(assert (=> b!104502 d!32508))

(declare-fun d!32510 () Bool)

(assert (=> d!32510 (= (remainingBits!0 ((_ sign_extend 32) (size!2222 (buf!2588 thiss!1305))) ((_ sign_extend 32) (currentByte!5073 thiss!1305)) ((_ sign_extend 32) (currentBit!5068 thiss!1305))) (bvsub (bvmul ((_ sign_extend 32) (size!2222 (buf!2588 thiss!1305))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5073 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5068 thiss!1305)))))))

(assert (=> d!32446 d!32510))

(assert (=> d!32254 d!32364))

(declare-fun d!32512 () Bool)

(assert (=> d!32512 (validate_offset_bits!1 ((_ sign_extend 32) (size!2222 (buf!2588 (_2!4566 lt!152813)))) ((_ sign_extend 32) (currentByte!5073 (_2!4566 lt!152821))) ((_ sign_extend 32) (currentBit!5068 (_2!4566 lt!152821))) lt!152820)))

(assert (=> d!32512 true))

(declare-fun _$6!228 () Unit!6388)

(assert (=> d!32512 (= (choose!9 (_2!4566 lt!152821) (buf!2588 (_2!4566 lt!152813)) lt!152820 (BitStream!3919 (buf!2588 (_2!4566 lt!152813)) (currentByte!5073 (_2!4566 lt!152821)) (currentBit!5068 (_2!4566 lt!152821)))) _$6!228)))

(declare-fun bs!7975 () Bool)

(assert (= bs!7975 d!32512))

(assert (=> bs!7975 m!152421))

(assert (=> d!32254 d!32512))

(declare-fun e!68572 () Bool)

(declare-fun b!104691 () Bool)

(declare-datatypes ((tuple4!68 0))(
  ( (tuple4!69 (_1!4580 (_ BitVec 32)) (_2!4580 (_ BitVec 32)) (_3!255 (_ BitVec 32)) (_4!34 (_ BitVec 32))) )
))
(declare-fun lt!153977 () tuple4!68)

(declare-fun arrayRangesEq!35 (array!4868 array!4868 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!104691 (= e!68572 (arrayRangesEq!35 (buf!2588 thiss!1305) (buf!2588 (_2!4566 lt!152821)) (_1!4580 lt!153977) (_2!4580 lt!153977)))))

(declare-fun b!104692 () Bool)

(declare-fun e!68571 () Bool)

(declare-fun call!1303 () Bool)

(assert (=> b!104692 (= e!68571 call!1303)))

(declare-fun lt!153978 () (_ BitVec 32))

(declare-fun c!6450 () Bool)

(declare-fun lt!153979 () (_ BitVec 32))

(declare-fun bm!1300 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!1300 (= call!1303 (byteRangesEq!0 (ite c!6450 (select (arr!2815 (buf!2588 thiss!1305)) (_3!255 lt!153977)) (select (arr!2815 (buf!2588 thiss!1305)) (_4!34 lt!153977))) (ite c!6450 (select (arr!2815 (buf!2588 (_2!4566 lt!152821))) (_3!255 lt!153977)) (select (arr!2815 (buf!2588 (_2!4566 lt!152821))) (_4!34 lt!153977))) (ite c!6450 lt!153978 #b00000000000000000000000000000000) lt!153979))))

(declare-fun b!104693 () Bool)

(declare-fun e!68575 () Bool)

(assert (=> b!104693 (= e!68571 e!68575)))

(declare-fun res!86204 () Bool)

(assert (=> b!104693 (= res!86204 (byteRangesEq!0 (select (arr!2815 (buf!2588 thiss!1305)) (_3!255 lt!153977)) (select (arr!2815 (buf!2588 (_2!4566 lt!152821))) (_3!255 lt!153977)) lt!153978 #b00000000000000000000000000001000))))

(assert (=> b!104693 (=> (not res!86204) (not e!68575))))

(declare-fun d!32514 () Bool)

(declare-fun res!86207 () Bool)

(declare-fun e!68573 () Bool)

(assert (=> d!32514 (=> res!86207 e!68573)))

(assert (=> d!32514 (= res!86207 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2222 (buf!2588 thiss!1305)) (currentByte!5073 thiss!1305) (currentBit!5068 thiss!1305))))))

(assert (=> d!32514 (= (arrayBitRangesEq!0 (buf!2588 thiss!1305) (buf!2588 (_2!4566 lt!152821)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2222 (buf!2588 thiss!1305)) (currentByte!5073 thiss!1305) (currentBit!5068 thiss!1305))) e!68573)))

(declare-fun b!104694 () Bool)

(declare-fun e!68574 () Bool)

(assert (=> b!104694 (= e!68574 call!1303)))

(declare-fun b!104695 () Bool)

(declare-fun e!68570 () Bool)

(assert (=> b!104695 (= e!68570 e!68571)))

(assert (=> b!104695 (= c!6450 (= (_3!255 lt!153977) (_4!34 lt!153977)))))

(declare-fun b!104696 () Bool)

(assert (=> b!104696 (= e!68573 e!68570)))

(declare-fun res!86206 () Bool)

(assert (=> b!104696 (=> (not res!86206) (not e!68570))))

(assert (=> b!104696 (= res!86206 e!68572)))

(declare-fun res!86205 () Bool)

(assert (=> b!104696 (=> res!86205 e!68572)))

(assert (=> b!104696 (= res!86205 (bvsge (_1!4580 lt!153977) (_2!4580 lt!153977)))))

(assert (=> b!104696 (= lt!153979 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!2222 (buf!2588 thiss!1305)) (currentByte!5073 thiss!1305) (currentBit!5068 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!104696 (= lt!153978 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!68)

(assert (=> b!104696 (= lt!153977 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2222 (buf!2588 thiss!1305)) (currentByte!5073 thiss!1305) (currentBit!5068 thiss!1305))))))

(declare-fun b!104697 () Bool)

(declare-fun res!86208 () Bool)

(assert (=> b!104697 (= res!86208 (= lt!153979 #b00000000000000000000000000000000))))

(assert (=> b!104697 (=> res!86208 e!68574)))

(assert (=> b!104697 (= e!68575 e!68574)))

(assert (= (and d!32514 (not res!86207)) b!104696))

(assert (= (and b!104696 (not res!86205)) b!104691))

(assert (= (and b!104696 res!86206) b!104695))

(assert (= (and b!104695 c!6450) b!104692))

(assert (= (and b!104695 (not c!6450)) b!104693))

(assert (= (and b!104693 res!86204) b!104697))

(assert (= (and b!104697 (not res!86208)) b!104694))

(assert (= (or b!104692 b!104694) bm!1300))

(declare-fun m!153307 () Bool)

(assert (=> b!104691 m!153307))

(declare-fun m!153309 () Bool)

(assert (=> bm!1300 m!153309))

(declare-fun m!153311 () Bool)

(assert (=> bm!1300 m!153311))

(declare-fun m!153313 () Bool)

(assert (=> bm!1300 m!153313))

(declare-fun m!153315 () Bool)

(assert (=> bm!1300 m!153315))

(declare-fun m!153317 () Bool)

(assert (=> bm!1300 m!153317))

(assert (=> b!104693 m!153313))

(assert (=> b!104693 m!153315))

(assert (=> b!104693 m!153313))

(assert (=> b!104693 m!153315))

(declare-fun m!153319 () Bool)

(assert (=> b!104693 m!153319))

(assert (=> b!104696 m!152441))

(declare-fun m!153321 () Bool)

(assert (=> b!104696 m!153321))

(assert (=> b!104583 d!32514))

(assert (=> b!104583 d!32438))

(assert (=> b!104581 d!32438))

(assert (=> b!104581 d!32452))

(declare-fun d!32516 () Bool)

(declare-fun e!68576 () Bool)

(assert (=> d!32516 e!68576))

(declare-fun res!86209 () Bool)

(assert (=> d!32516 (=> (not res!86209) (not e!68576))))

(declare-fun lt!153980 () BitStream!3918)

(declare-fun lt!153981 () (_ BitVec 64))

(assert (=> d!32516 (= res!86209 (= (bvadd lt!153981 (bvsub lt!152975 lt!152981)) (bitIndex!0 (size!2222 (buf!2588 lt!153980)) (currentByte!5073 lt!153980) (currentBit!5068 lt!153980))))))

(assert (=> d!32516 (or (not (= (bvand lt!153981 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!152975 lt!152981) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!153981 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!153981 (bvsub lt!152975 lt!152981)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32516 (= lt!153981 (bitIndex!0 (size!2222 (buf!2588 (_2!4568 lt!152968))) (currentByte!5073 (_2!4568 lt!152968)) (currentBit!5068 (_2!4568 lt!152968))))))

(assert (=> d!32516 (= lt!153980 (_2!4566 (moveBitIndex!0 (_2!4568 lt!152968) (bvsub lt!152975 lt!152981))))))

(assert (=> d!32516 (moveBitIndexPrecond!0 (_2!4568 lt!152968) (bvsub lt!152975 lt!152981))))

(assert (=> d!32516 (= (withMovedBitIndex!0 (_2!4568 lt!152968) (bvsub lt!152975 lt!152981)) lt!153980)))

(declare-fun b!104698 () Bool)

(assert (=> b!104698 (= e!68576 (= (size!2222 (buf!2588 (_2!4568 lt!152968))) (size!2222 (buf!2588 lt!153980))))))

(assert (= (and d!32516 res!86209) b!104698))

(declare-fun m!153323 () Bool)

(assert (=> d!32516 m!153323))

(assert (=> d!32516 m!153221))

(declare-fun m!153325 () Bool)

(assert (=> d!32516 m!153325))

(declare-fun m!153327 () Bool)

(assert (=> d!32516 m!153327))

(assert (=> b!104330 d!32516))

(assert (=> b!104330 d!32508))

(assert (=> b!104330 d!32452))

(declare-fun d!32518 () Bool)

(declare-fun res!86211 () Bool)

(declare-fun e!68578 () Bool)

(assert (=> d!32518 (=> (not res!86211) (not e!68578))))

(assert (=> d!32518 (= res!86211 (= (size!2222 (buf!2588 (ite c!6434 (_2!4566 lt!152821) lt!153423))) (size!2222 (buf!2588 (ite c!6434 (_2!4566 lt!153424) lt!153423)))))))

(assert (=> d!32518 (= (isPrefixOf!0 (ite c!6434 (_2!4566 lt!152821) lt!153423) (ite c!6434 (_2!4566 lt!153424) lt!153423)) e!68578)))

(declare-fun b!104699 () Bool)

(declare-fun res!86210 () Bool)

(assert (=> b!104699 (=> (not res!86210) (not e!68578))))

(assert (=> b!104699 (= res!86210 (bvsle (bitIndex!0 (size!2222 (buf!2588 (ite c!6434 (_2!4566 lt!152821) lt!153423))) (currentByte!5073 (ite c!6434 (_2!4566 lt!152821) lt!153423)) (currentBit!5068 (ite c!6434 (_2!4566 lt!152821) lt!153423))) (bitIndex!0 (size!2222 (buf!2588 (ite c!6434 (_2!4566 lt!153424) lt!153423))) (currentByte!5073 (ite c!6434 (_2!4566 lt!153424) lt!153423)) (currentBit!5068 (ite c!6434 (_2!4566 lt!153424) lt!153423)))))))

(declare-fun b!104700 () Bool)

(declare-fun e!68577 () Bool)

(assert (=> b!104700 (= e!68578 e!68577)))

(declare-fun res!86212 () Bool)

(assert (=> b!104700 (=> res!86212 e!68577)))

(assert (=> b!104700 (= res!86212 (= (size!2222 (buf!2588 (ite c!6434 (_2!4566 lt!152821) lt!153423))) #b00000000000000000000000000000000))))

(declare-fun b!104701 () Bool)

(assert (=> b!104701 (= e!68577 (arrayBitRangesEq!0 (buf!2588 (ite c!6434 (_2!4566 lt!152821) lt!153423)) (buf!2588 (ite c!6434 (_2!4566 lt!153424) lt!153423)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2222 (buf!2588 (ite c!6434 (_2!4566 lt!152821) lt!153423))) (currentByte!5073 (ite c!6434 (_2!4566 lt!152821) lt!153423)) (currentBit!5068 (ite c!6434 (_2!4566 lt!152821) lt!153423)))))))

(assert (= (and d!32518 res!86211) b!104699))

(assert (= (and b!104699 res!86210) b!104700))

(assert (= (and b!104700 (not res!86212)) b!104701))

(declare-fun m!153329 () Bool)

(assert (=> b!104699 m!153329))

(declare-fun m!153331 () Bool)

(assert (=> b!104699 m!153331))

(assert (=> b!104701 m!153329))

(assert (=> b!104701 m!153329))

(declare-fun m!153333 () Bool)

(assert (=> b!104701 m!153333))

(assert (=> bm!1294 d!32518))

(declare-fun d!32520 () Bool)

(declare-fun res!86214 () Bool)

(declare-fun e!68580 () Bool)

(assert (=> d!32520 (=> (not res!86214) (not e!68580))))

(assert (=> d!32520 (= res!86214 (= (size!2222 (buf!2588 (_2!4568 lt!152988))) (size!2222 (buf!2588 (_2!4566 lt!152813)))))))

(assert (=> d!32520 (= (isPrefixOf!0 (_2!4568 lt!152988) (_2!4566 lt!152813)) e!68580)))

(declare-fun b!104702 () Bool)

(declare-fun res!86213 () Bool)

(assert (=> b!104702 (=> (not res!86213) (not e!68580))))

(assert (=> b!104702 (= res!86213 (bvsle (bitIndex!0 (size!2222 (buf!2588 (_2!4568 lt!152988))) (currentByte!5073 (_2!4568 lt!152988)) (currentBit!5068 (_2!4568 lt!152988))) (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!152813))) (currentByte!5073 (_2!4566 lt!152813)) (currentBit!5068 (_2!4566 lt!152813)))))))

(declare-fun b!104703 () Bool)

(declare-fun e!68579 () Bool)

(assert (=> b!104703 (= e!68580 e!68579)))

(declare-fun res!86215 () Bool)

(assert (=> b!104703 (=> res!86215 e!68579)))

(assert (=> b!104703 (= res!86215 (= (size!2222 (buf!2588 (_2!4568 lt!152988))) #b00000000000000000000000000000000))))

(declare-fun b!104704 () Bool)

(assert (=> b!104704 (= e!68579 (arrayBitRangesEq!0 (buf!2588 (_2!4568 lt!152988)) (buf!2588 (_2!4566 lt!152813)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2222 (buf!2588 (_2!4568 lt!152988))) (currentByte!5073 (_2!4568 lt!152988)) (currentBit!5068 (_2!4568 lt!152988)))))))

(assert (= (and d!32520 res!86214) b!104702))

(assert (= (and b!104702 res!86213) b!104703))

(assert (= (and b!104703 (not res!86215)) b!104704))

(declare-fun m!153335 () Bool)

(assert (=> b!104702 m!153335))

(assert (=> b!104702 m!152583))

(assert (=> b!104704 m!153335))

(assert (=> b!104704 m!153335))

(declare-fun m!153337 () Bool)

(assert (=> b!104704 m!153337))

(assert (=> b!104331 d!32520))

(declare-fun d!32522 () Bool)

(declare-fun e!68581 () Bool)

(assert (=> d!32522 e!68581))

(declare-fun res!86217 () Bool)

(assert (=> d!32522 (=> (not res!86217) (not e!68581))))

(declare-fun lt!153984 () (_ BitVec 64))

(declare-fun lt!153985 () (_ BitVec 64))

(declare-fun lt!153986 () (_ BitVec 64))

(assert (=> d!32522 (= res!86217 (= lt!153985 (bvsub lt!153984 lt!153986)))))

(assert (=> d!32522 (or (= (bvand lt!153984 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!153986 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!153984 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!153984 lt!153986) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32522 (= lt!153986 (remainingBits!0 ((_ sign_extend 32) (size!2222 (buf!2588 (_1!4567 lt!153702)))) ((_ sign_extend 32) (currentByte!5073 (_1!4567 lt!153702))) ((_ sign_extend 32) (currentBit!5068 (_1!4567 lt!153702)))))))

(declare-fun lt!153983 () (_ BitVec 64))

(declare-fun lt!153982 () (_ BitVec 64))

(assert (=> d!32522 (= lt!153984 (bvmul lt!153983 lt!153982))))

(assert (=> d!32522 (or (= lt!153983 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!153982 (bvsdiv (bvmul lt!153983 lt!153982) lt!153983)))))

(assert (=> d!32522 (= lt!153982 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!32522 (= lt!153983 ((_ sign_extend 32) (size!2222 (buf!2588 (_1!4567 lt!153702)))))))

(assert (=> d!32522 (= lt!153985 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5073 (_1!4567 lt!153702))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5068 (_1!4567 lt!153702)))))))

(assert (=> d!32522 (invariant!0 (currentBit!5068 (_1!4567 lt!153702)) (currentByte!5073 (_1!4567 lt!153702)) (size!2222 (buf!2588 (_1!4567 lt!153702))))))

(assert (=> d!32522 (= (bitIndex!0 (size!2222 (buf!2588 (_1!4567 lt!153702))) (currentByte!5073 (_1!4567 lt!153702)) (currentBit!5068 (_1!4567 lt!153702))) lt!153985)))

(declare-fun b!104705 () Bool)

(declare-fun res!86216 () Bool)

(assert (=> b!104705 (=> (not res!86216) (not e!68581))))

(assert (=> b!104705 (= res!86216 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!153985))))

(declare-fun b!104706 () Bool)

(declare-fun lt!153987 () (_ BitVec 64))

(assert (=> b!104706 (= e!68581 (bvsle lt!153985 (bvmul lt!153987 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!104706 (or (= lt!153987 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!153987 #b0000000000000000000000000000000000000000000000000000000000001000) lt!153987)))))

(assert (=> b!104706 (= lt!153987 ((_ sign_extend 32) (size!2222 (buf!2588 (_1!4567 lt!153702)))))))

(assert (= (and d!32522 res!86217) b!104705))

(assert (= (and b!104705 res!86216) b!104706))

(declare-fun m!153339 () Bool)

(assert (=> d!32522 m!153339))

(declare-fun m!153341 () Bool)

(assert (=> d!32522 m!153341))

(assert (=> b!104560 d!32522))

(declare-fun d!32524 () Bool)

(declare-fun e!68582 () Bool)

(assert (=> d!32524 e!68582))

(declare-fun res!86219 () Bool)

(assert (=> d!32524 (=> (not res!86219) (not e!68582))))

(declare-fun lt!153990 () (_ BitVec 64))

(declare-fun lt!153992 () (_ BitVec 64))

(declare-fun lt!153991 () (_ BitVec 64))

(assert (=> d!32524 (= res!86219 (= lt!153991 (bvsub lt!153990 lt!153992)))))

(assert (=> d!32524 (or (= (bvand lt!153990 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!153992 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!153990 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!153990 lt!153992) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32524 (= lt!153992 (remainingBits!0 ((_ sign_extend 32) (size!2222 (buf!2588 (_2!4566 lt!153700)))) ((_ sign_extend 32) (currentByte!5073 (_2!4566 lt!153700))) ((_ sign_extend 32) (currentBit!5068 (_2!4566 lt!153700)))))))

(declare-fun lt!153989 () (_ BitVec 64))

(declare-fun lt!153988 () (_ BitVec 64))

(assert (=> d!32524 (= lt!153990 (bvmul lt!153989 lt!153988))))

(assert (=> d!32524 (or (= lt!153989 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!153988 (bvsdiv (bvmul lt!153989 lt!153988) lt!153989)))))

(assert (=> d!32524 (= lt!153988 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!32524 (= lt!153989 ((_ sign_extend 32) (size!2222 (buf!2588 (_2!4566 lt!153700)))))))

(assert (=> d!32524 (= lt!153991 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5073 (_2!4566 lt!153700))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5068 (_2!4566 lt!153700)))))))

(assert (=> d!32524 (invariant!0 (currentBit!5068 (_2!4566 lt!153700)) (currentByte!5073 (_2!4566 lt!153700)) (size!2222 (buf!2588 (_2!4566 lt!153700))))))

(assert (=> d!32524 (= (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!153700))) (currentByte!5073 (_2!4566 lt!153700)) (currentBit!5068 (_2!4566 lt!153700))) lt!153991)))

(declare-fun b!104707 () Bool)

(declare-fun res!86218 () Bool)

(assert (=> b!104707 (=> (not res!86218) (not e!68582))))

(assert (=> b!104707 (= res!86218 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!153991))))

(declare-fun b!104708 () Bool)

(declare-fun lt!153993 () (_ BitVec 64))

(assert (=> b!104708 (= e!68582 (bvsle lt!153991 (bvmul lt!153993 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!104708 (or (= lt!153993 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!153993 #b0000000000000000000000000000000000000000000000000000000000001000) lt!153993)))))

(assert (=> b!104708 (= lt!153993 ((_ sign_extend 32) (size!2222 (buf!2588 (_2!4566 lt!153700)))))))

(assert (= (and d!32524 res!86219) b!104707))

(assert (= (and b!104707 res!86218) b!104708))

(declare-fun m!153343 () Bool)

(assert (=> d!32524 m!153343))

(declare-fun m!153345 () Bool)

(assert (=> d!32524 m!153345))

(assert (=> b!104560 d!32524))

(declare-fun d!32526 () Bool)

(declare-fun e!68583 () Bool)

(assert (=> d!32526 e!68583))

(declare-fun res!86221 () Bool)

(assert (=> d!32526 (=> (not res!86221) (not e!68583))))

(declare-fun lt!153998 () (_ BitVec 64))

(declare-fun lt!153996 () (_ BitVec 64))

(declare-fun lt!153997 () (_ BitVec 64))

(assert (=> d!32526 (= res!86221 (= lt!153997 (bvsub lt!153996 lt!153998)))))

(assert (=> d!32526 (or (= (bvand lt!153996 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!153998 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!153996 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!153996 lt!153998) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32526 (= lt!153998 (remainingBits!0 ((_ sign_extend 32) (size!2222 (buf!2588 (_1!4567 lt!152915)))) ((_ sign_extend 32) (currentByte!5073 (_1!4567 lt!152915))) ((_ sign_extend 32) (currentBit!5068 (_1!4567 lt!152915)))))))

(declare-fun lt!153995 () (_ BitVec 64))

(declare-fun lt!153994 () (_ BitVec 64))

(assert (=> d!32526 (= lt!153996 (bvmul lt!153995 lt!153994))))

(assert (=> d!32526 (or (= lt!153995 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!153994 (bvsdiv (bvmul lt!153995 lt!153994) lt!153995)))))

(assert (=> d!32526 (= lt!153994 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!32526 (= lt!153995 ((_ sign_extend 32) (size!2222 (buf!2588 (_1!4567 lt!152915)))))))

(assert (=> d!32526 (= lt!153997 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5073 (_1!4567 lt!152915))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5068 (_1!4567 lt!152915)))))))

(assert (=> d!32526 (invariant!0 (currentBit!5068 (_1!4567 lt!152915)) (currentByte!5073 (_1!4567 lt!152915)) (size!2222 (buf!2588 (_1!4567 lt!152915))))))

(assert (=> d!32526 (= (bitIndex!0 (size!2222 (buf!2588 (_1!4567 lt!152915))) (currentByte!5073 (_1!4567 lt!152915)) (currentBit!5068 (_1!4567 lt!152915))) lt!153997)))

(declare-fun b!104709 () Bool)

(declare-fun res!86220 () Bool)

(assert (=> b!104709 (=> (not res!86220) (not e!68583))))

(assert (=> b!104709 (= res!86220 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!153997))))

(declare-fun b!104710 () Bool)

(declare-fun lt!153999 () (_ BitVec 64))

(assert (=> b!104710 (= e!68583 (bvsle lt!153997 (bvmul lt!153999 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!104710 (or (= lt!153999 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!153999 #b0000000000000000000000000000000000000000000000000000000000001000) lt!153999)))))

(assert (=> b!104710 (= lt!153999 ((_ sign_extend 32) (size!2222 (buf!2588 (_1!4567 lt!152915)))))))

(assert (= (and d!32526 res!86221) b!104709))

(assert (= (and b!104709 res!86220) b!104710))

(declare-fun m!153347 () Bool)

(assert (=> d!32526 m!153347))

(declare-fun m!153349 () Bool)

(assert (=> d!32526 m!153349))

(assert (=> d!32252 d!32526))

(declare-fun d!32528 () Bool)

(declare-fun e!68586 () Bool)

(assert (=> d!32528 e!68586))

(declare-fun res!86224 () Bool)

(assert (=> d!32528 (=> (not res!86224) (not e!68586))))

(declare-fun lt!154008 () tuple2!8624)

(declare-fun lt!154007 () tuple2!8624)

(assert (=> d!32528 (= res!86224 (= (bitIndex!0 (size!2222 (buf!2588 (_1!4567 lt!154008))) (currentByte!5073 (_1!4567 lt!154008)) (currentBit!5068 (_1!4567 lt!154008))) (bitIndex!0 (size!2222 (buf!2588 (_1!4567 lt!154007))) (currentByte!5073 (_1!4567 lt!154007)) (currentBit!5068 (_1!4567 lt!154007)))))))

(declare-fun lt!154006 () BitStream!3918)

(assert (=> d!32528 (= lt!154007 (readBitPure!0 lt!154006))))

(assert (=> d!32528 (= lt!154008 (readBitPure!0 lt!152823))))

(assert (=> d!32528 (= lt!154006 (BitStream!3919 (buf!2588 (_2!4566 lt!152813)) (currentByte!5073 lt!152823) (currentBit!5068 lt!152823)))))

(assert (=> d!32528 (invariant!0 (currentBit!5068 lt!152823) (currentByte!5073 lt!152823) (size!2222 (buf!2588 (_2!4566 lt!152813))))))

(assert (=> d!32528 true))

(declare-fun _$9!39 () Unit!6388)

(assert (=> d!32528 (= (choose!50 lt!152823 (_2!4566 lt!152813) lt!152914 lt!152917 (tuple2!8625 (_1!4567 lt!152917) (_2!4567 lt!152917)) (_1!4567 lt!152917) (_2!4567 lt!152917) lt!152915 (tuple2!8625 (_1!4567 lt!152915) (_2!4567 lt!152915)) (_1!4567 lt!152915) (_2!4567 lt!152915)) _$9!39)))

(declare-fun b!104713 () Bool)

(assert (=> b!104713 (= e!68586 (= (_2!4567 lt!154008) (_2!4567 lt!154007)))))

(assert (= (and d!32528 res!86224) b!104713))

(assert (=> d!32528 m!152539))

(declare-fun m!153351 () Bool)

(assert (=> d!32528 m!153351))

(declare-fun m!153353 () Bool)

(assert (=> d!32528 m!153353))

(assert (=> d!32528 m!152423))

(declare-fun m!153355 () Bool)

(assert (=> d!32528 m!153355))

(assert (=> d!32252 d!32528))

(declare-fun d!32530 () Bool)

(assert (=> d!32530 (= (invariant!0 (currentBit!5068 lt!152823) (currentByte!5073 lt!152823) (size!2222 (buf!2588 (_2!4566 lt!152813)))) (and (bvsge (currentBit!5068 lt!152823) #b00000000000000000000000000000000) (bvslt (currentBit!5068 lt!152823) #b00000000000000000000000000001000) (bvsge (currentByte!5073 lt!152823) #b00000000000000000000000000000000) (or (bvslt (currentByte!5073 lt!152823) (size!2222 (buf!2588 (_2!4566 lt!152813)))) (and (= (currentBit!5068 lt!152823) #b00000000000000000000000000000000) (= (currentByte!5073 lt!152823) (size!2222 (buf!2588 (_2!4566 lt!152813))))))))))

(assert (=> d!32252 d!32530))

(assert (=> d!32252 d!32362))

(declare-fun d!32532 () Bool)

(declare-fun lt!154009 () tuple2!8642)

(assert (=> d!32532 (= lt!154009 (readBit!0 lt!152914))))

(assert (=> d!32532 (= (readBitPure!0 lt!152914) (tuple2!8625 (_2!4576 lt!154009) (_1!4576 lt!154009)))))

(declare-fun bs!7976 () Bool)

(assert (= bs!7976 d!32532))

(declare-fun m!153357 () Bool)

(assert (=> bs!7976 m!153357))

(assert (=> d!32252 d!32532))

(declare-fun d!32534 () Bool)

(declare-fun e!68587 () Bool)

(assert (=> d!32534 e!68587))

(declare-fun res!86226 () Bool)

(assert (=> d!32534 (=> (not res!86226) (not e!68587))))

(declare-fun lt!154012 () (_ BitVec 64))

(declare-fun lt!154013 () (_ BitVec 64))

(declare-fun lt!154014 () (_ BitVec 64))

(assert (=> d!32534 (= res!86226 (= lt!154013 (bvsub lt!154012 lt!154014)))))

(assert (=> d!32534 (or (= (bvand lt!154012 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!154014 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!154012 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!154012 lt!154014) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32534 (= lt!154014 (remainingBits!0 ((_ sign_extend 32) (size!2222 (buf!2588 (_1!4567 lt!152917)))) ((_ sign_extend 32) (currentByte!5073 (_1!4567 lt!152917))) ((_ sign_extend 32) (currentBit!5068 (_1!4567 lt!152917)))))))

(declare-fun lt!154011 () (_ BitVec 64))

(declare-fun lt!154010 () (_ BitVec 64))

(assert (=> d!32534 (= lt!154012 (bvmul lt!154011 lt!154010))))

(assert (=> d!32534 (or (= lt!154011 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!154010 (bvsdiv (bvmul lt!154011 lt!154010) lt!154011)))))

(assert (=> d!32534 (= lt!154010 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!32534 (= lt!154011 ((_ sign_extend 32) (size!2222 (buf!2588 (_1!4567 lt!152917)))))))

(assert (=> d!32534 (= lt!154013 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5073 (_1!4567 lt!152917))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5068 (_1!4567 lt!152917)))))))

(assert (=> d!32534 (invariant!0 (currentBit!5068 (_1!4567 lt!152917)) (currentByte!5073 (_1!4567 lt!152917)) (size!2222 (buf!2588 (_1!4567 lt!152917))))))

(assert (=> d!32534 (= (bitIndex!0 (size!2222 (buf!2588 (_1!4567 lt!152917))) (currentByte!5073 (_1!4567 lt!152917)) (currentBit!5068 (_1!4567 lt!152917))) lt!154013)))

(declare-fun b!104714 () Bool)

(declare-fun res!86225 () Bool)

(assert (=> b!104714 (=> (not res!86225) (not e!68587))))

(assert (=> b!104714 (= res!86225 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!154013))))

(declare-fun b!104715 () Bool)

(declare-fun lt!154015 () (_ BitVec 64))

(assert (=> b!104715 (= e!68587 (bvsle lt!154013 (bvmul lt!154015 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!104715 (or (= lt!154015 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!154015 #b0000000000000000000000000000000000000000000000000000000000001000) lt!154015)))))

(assert (=> b!104715 (= lt!154015 ((_ sign_extend 32) (size!2222 (buf!2588 (_1!4567 lt!152917)))))))

(assert (= (and d!32534 res!86226) b!104714))

(assert (= (and b!104714 res!86225) b!104715))

(declare-fun m!153359 () Bool)

(assert (=> d!32534 m!153359))

(declare-fun m!153361 () Bool)

(assert (=> d!32534 m!153361))

(assert (=> d!32252 d!32534))

(declare-fun d!32536 () Bool)

(declare-fun res!86228 () Bool)

(declare-fun e!68589 () Bool)

(assert (=> d!32536 (=> (not res!86228) (not e!68589))))

(assert (=> d!32536 (= res!86228 (= (size!2222 (buf!2588 thiss!1305)) (size!2222 (buf!2588 (_2!4566 lt!153700)))))))

(assert (=> d!32536 (= (isPrefixOf!0 thiss!1305 (_2!4566 lt!153700)) e!68589)))

(declare-fun b!104716 () Bool)

(declare-fun res!86227 () Bool)

(assert (=> b!104716 (=> (not res!86227) (not e!68589))))

(assert (=> b!104716 (= res!86227 (bvsle (bitIndex!0 (size!2222 (buf!2588 thiss!1305)) (currentByte!5073 thiss!1305) (currentBit!5068 thiss!1305)) (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!153700))) (currentByte!5073 (_2!4566 lt!153700)) (currentBit!5068 (_2!4566 lt!153700)))))))

(declare-fun b!104717 () Bool)

(declare-fun e!68588 () Bool)

(assert (=> b!104717 (= e!68589 e!68588)))

(declare-fun res!86229 () Bool)

(assert (=> b!104717 (=> res!86229 e!68588)))

(assert (=> b!104717 (= res!86229 (= (size!2222 (buf!2588 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!104718 () Bool)

(assert (=> b!104718 (= e!68588 (arrayBitRangesEq!0 (buf!2588 thiss!1305) (buf!2588 (_2!4566 lt!153700)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2222 (buf!2588 thiss!1305)) (currentByte!5073 thiss!1305) (currentBit!5068 thiss!1305))))))

(assert (= (and d!32536 res!86228) b!104716))

(assert (= (and b!104716 res!86227) b!104717))

(assert (= (and b!104717 (not res!86229)) b!104718))

(assert (=> b!104716 m!152441))

(assert (=> b!104716 m!152973))

(assert (=> b!104718 m!152441))

(assert (=> b!104718 m!152441))

(declare-fun m!153363 () Bool)

(assert (=> b!104718 m!153363))

(assert (=> b!104558 d!32536))

(assert (=> d!32368 d!32458))

(declare-fun b!104733 () Bool)

(declare-fun res!86244 () Bool)

(declare-fun e!68598 () Bool)

(assert (=> b!104733 (=> (not res!86244) (not e!68598))))

(declare-fun lt!154042 () tuple2!8644)

(assert (=> b!104733 (= res!86244 (= (bvand (_1!4577 lt!154042) (onesLSBLong!0 nBits!396)) (_1!4577 lt!154042)))))

(declare-fun lt!154037 () (_ BitVec 64))

(declare-fun e!68597 () Bool)

(declare-fun b!104734 () Bool)

(assert (=> b!104734 (= e!68597 (= (= (bvand (bvlshr (_1!4577 lt!154042) lt!154037) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!4567 (readBitPure!0 (_1!4568 lt!152809)))))))

(assert (=> b!104734 (and (bvsge lt!154037 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!154037 #b0000000000000000000000000000000000000000000000000000000001000000))))

(declare-fun lt!154039 () (_ BitVec 32))

(assert (=> b!104734 (= lt!154037 ((_ sign_extend 32) (bvsub lt!154039 i!615)))))

(assert (=> b!104734 (or (= (bvand lt!154039 #b10000000000000000000000000000000) (bvand i!615 #b10000000000000000000000000000000)) (= (bvand lt!154039 #b10000000000000000000000000000000) (bvand (bvsub lt!154039 i!615) #b10000000000000000000000000000000)))))

(assert (=> b!104734 (= lt!154039 (bvsub nBits!396 #b00000000000000000000000000000001))))

(assert (=> b!104734 (or (= (bvand nBits!396 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))

(declare-fun b!104735 () Bool)

(assert (=> b!104735 (= e!68598 e!68597)))

(declare-fun res!86243 () Bool)

(assert (=> b!104735 (=> res!86243 e!68597)))

(assert (=> b!104735 (= res!86243 (bvsge i!615 nBits!396))))

(declare-fun b!104736 () Bool)

(declare-fun res!86241 () Bool)

(assert (=> b!104736 (=> (not res!86241) (not e!68598))))

(declare-fun lt!154040 () (_ BitVec 64))

(declare-fun lt!154034 () (_ BitVec 64))

(assert (=> b!104736 (= res!86241 (= (bitIndex!0 (size!2222 (buf!2588 (_2!4577 lt!154042))) (currentByte!5073 (_2!4577 lt!154042)) (currentBit!5068 (_2!4577 lt!154042))) (bvadd lt!154040 lt!154034)))))

(assert (=> b!104736 (or (not (= (bvand lt!154040 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!154034 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!154040 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!154040 lt!154034) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!104736 (= lt!154034 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(assert (=> b!104736 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand i!615 #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 i!615) #b10000000000000000000000000000000)))))

(assert (=> b!104736 (= lt!154040 (bitIndex!0 (size!2222 (buf!2588 (_1!4568 lt!152809))) (currentByte!5073 (_1!4568 lt!152809)) (currentBit!5068 (_1!4568 lt!152809))))))

(declare-fun b!104737 () Bool)

(declare-fun e!68596 () tuple2!8644)

(assert (=> b!104737 (= e!68596 (tuple2!8645 lt!152817 (_1!4568 lt!152809)))))

(declare-fun b!104738 () Bool)

(declare-fun lt!154035 () tuple2!8644)

(assert (=> b!104738 (= e!68596 (tuple2!8645 (_1!4577 lt!154035) (_2!4577 lt!154035)))))

(declare-fun lt!154036 () tuple2!8642)

(assert (=> b!104738 (= lt!154036 (readBit!0 (_1!4568 lt!152809)))))

(assert (=> b!104738 (= lt!154035 (readNLeastSignificantBitsLoop!0 (_2!4576 lt!154036) nBits!396 (bvadd i!615 #b00000000000000000000000000000001) (bvor lt!152817 (ite (_1!4576 lt!154036) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!104739 () Bool)

(declare-fun res!86240 () Bool)

(assert (=> b!104739 (=> (not res!86240) (not e!68598))))

(declare-fun lt!154038 () (_ BitVec 64))

(declare-fun lt!154041 () (_ BitVec 64))

(assert (=> b!104739 (= res!86240 (= (bvlshr (_1!4577 lt!154042) lt!154038) (bvlshr lt!152817 lt!154041)))))

(assert (=> b!104739 (and (bvsge lt!154041 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!154041 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!104739 (= lt!154041 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(assert (=> b!104739 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand i!615 #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 i!615) #b10000000000000000000000000000000)))))

(assert (=> b!104739 (and (bvsge lt!154038 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!154038 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!104739 (= lt!154038 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(assert (=> b!104739 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand i!615 #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 i!615) #b10000000000000000000000000000000)))))

(declare-fun d!32538 () Bool)

(assert (=> d!32538 e!68598))

(declare-fun res!86242 () Bool)

(assert (=> d!32538 (=> (not res!86242) (not e!68598))))

(assert (=> d!32538 (= res!86242 (= (buf!2588 (_2!4577 lt!154042)) (buf!2588 (_1!4568 lt!152809))))))

(assert (=> d!32538 (= lt!154042 e!68596)))

(declare-fun c!6453 () Bool)

(assert (=> d!32538 (= c!6453 (= nBits!396 i!615))))

(assert (=> d!32538 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!32538 (= (readNLeastSignificantBitsLoop!0 (_1!4568 lt!152809) nBits!396 i!615 lt!152817) lt!154042)))

(assert (= (and d!32538 c!6453) b!104737))

(assert (= (and d!32538 (not c!6453)) b!104738))

(assert (= (and d!32538 res!86242) b!104736))

(assert (= (and b!104736 res!86241) b!104739))

(assert (= (and b!104739 res!86240) b!104733))

(assert (= (and b!104733 res!86244) b!104735))

(assert (= (and b!104735 (not res!86243)) b!104734))

(assert (=> b!104733 m!152455))

(assert (=> b!104734 m!152427))

(declare-fun m!153365 () Bool)

(assert (=> b!104736 m!153365))

(assert (=> b!104736 m!153185))

(assert (=> b!104738 m!152547))

(declare-fun m!153367 () Bool)

(assert (=> b!104738 m!153367))

(assert (=> d!32258 d!32538))

(declare-fun d!32540 () Bool)

(declare-fun res!86246 () Bool)

(declare-fun e!68600 () Bool)

(assert (=> d!32540 (=> (not res!86246) (not e!68600))))

(assert (=> d!32540 (= res!86246 (= (size!2222 (buf!2588 (_2!4568 lt!152968))) (size!2222 (buf!2588 (_2!4566 lt!152813)))))))

(assert (=> d!32540 (= (isPrefixOf!0 (_2!4568 lt!152968) (_2!4566 lt!152813)) e!68600)))

(declare-fun b!104740 () Bool)

(declare-fun res!86245 () Bool)

(assert (=> b!104740 (=> (not res!86245) (not e!68600))))

(assert (=> b!104740 (= res!86245 (bvsle (bitIndex!0 (size!2222 (buf!2588 (_2!4568 lt!152968))) (currentByte!5073 (_2!4568 lt!152968)) (currentBit!5068 (_2!4568 lt!152968))) (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!152813))) (currentByte!5073 (_2!4566 lt!152813)) (currentBit!5068 (_2!4566 lt!152813)))))))

(declare-fun b!104741 () Bool)

(declare-fun e!68599 () Bool)

(assert (=> b!104741 (= e!68600 e!68599)))

(declare-fun res!86247 () Bool)

(assert (=> b!104741 (=> res!86247 e!68599)))

(assert (=> b!104741 (= res!86247 (= (size!2222 (buf!2588 (_2!4568 lt!152968))) #b00000000000000000000000000000000))))

(declare-fun b!104742 () Bool)

(assert (=> b!104742 (= e!68599 (arrayBitRangesEq!0 (buf!2588 (_2!4568 lt!152968)) (buf!2588 (_2!4566 lt!152813)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2222 (buf!2588 (_2!4568 lt!152968))) (currentByte!5073 (_2!4568 lt!152968)) (currentBit!5068 (_2!4568 lt!152968)))))))

(assert (= (and d!32540 res!86246) b!104740))

(assert (= (and b!104740 res!86245) b!104741))

(assert (= (and b!104741 (not res!86247)) b!104742))

(assert (=> b!104740 m!153221))

(assert (=> b!104740 m!152583))

(assert (=> b!104742 m!153221))

(assert (=> b!104742 m!153221))

(declare-fun m!153369 () Bool)

(assert (=> b!104742 m!153369))

(assert (=> b!104326 d!32540))

(declare-fun d!32542 () Bool)

(declare-fun e!68601 () Bool)

(assert (=> d!32542 e!68601))

(declare-fun res!86249 () Bool)

(assert (=> d!32542 (=> (not res!86249) (not e!68601))))

(declare-fun lt!154046 () (_ BitVec 64))

(declare-fun lt!154047 () (_ BitVec 64))

(declare-fun lt!154045 () (_ BitVec 64))

(assert (=> d!32542 (= res!86249 (= lt!154046 (bvsub lt!154045 lt!154047)))))

(assert (=> d!32542 (or (= (bvand lt!154045 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!154047 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!154045 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!154045 lt!154047) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32542 (= lt!154047 (remainingBits!0 ((_ sign_extend 32) (size!2222 (buf!2588 (_2!4566 lt!153424)))) ((_ sign_extend 32) (currentByte!5073 (_2!4566 lt!153424))) ((_ sign_extend 32) (currentBit!5068 (_2!4566 lt!153424)))))))

(declare-fun lt!154044 () (_ BitVec 64))

(declare-fun lt!154043 () (_ BitVec 64))

(assert (=> d!32542 (= lt!154045 (bvmul lt!154044 lt!154043))))

(assert (=> d!32542 (or (= lt!154044 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!154043 (bvsdiv (bvmul lt!154044 lt!154043) lt!154044)))))

(assert (=> d!32542 (= lt!154043 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!32542 (= lt!154044 ((_ sign_extend 32) (size!2222 (buf!2588 (_2!4566 lt!153424)))))))

(assert (=> d!32542 (= lt!154046 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5073 (_2!4566 lt!153424))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5068 (_2!4566 lt!153424)))))))

(assert (=> d!32542 (invariant!0 (currentBit!5068 (_2!4566 lt!153424)) (currentByte!5073 (_2!4566 lt!153424)) (size!2222 (buf!2588 (_2!4566 lt!153424))))))

(assert (=> d!32542 (= (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!153424))) (currentByte!5073 (_2!4566 lt!153424)) (currentBit!5068 (_2!4566 lt!153424))) lt!154046)))

(declare-fun b!104743 () Bool)

(declare-fun res!86248 () Bool)

(assert (=> b!104743 (=> (not res!86248) (not e!68601))))

(assert (=> b!104743 (= res!86248 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!154046))))

(declare-fun b!104744 () Bool)

(declare-fun lt!154048 () (_ BitVec 64))

(assert (=> b!104744 (= e!68601 (bvsle lt!154046 (bvmul lt!154048 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!104744 (or (= lt!154048 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!154048 #b0000000000000000000000000000000000000000000000000000000000001000) lt!154048)))))

(assert (=> b!104744 (= lt!154048 ((_ sign_extend 32) (size!2222 (buf!2588 (_2!4566 lt!153424)))))))

(assert (= (and d!32542 res!86249) b!104743))

(assert (= (and b!104743 res!86248) b!104744))

(declare-fun m!153371 () Bool)

(assert (=> d!32542 m!153371))

(declare-fun m!153373 () Bool)

(assert (=> d!32542 m!153373))

(assert (=> b!104452 d!32542))

(assert (=> b!104452 d!32452))

(declare-fun d!32544 () Bool)

(assert (=> d!32544 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2222 (buf!2588 (_2!4566 lt!152821)))) ((_ sign_extend 32) (currentByte!5073 (_2!4566 lt!152821))) ((_ sign_extend 32) (currentBit!5068 (_2!4566 lt!152821))) lt!153457) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2222 (buf!2588 (_2!4566 lt!152821)))) ((_ sign_extend 32) (currentByte!5073 (_2!4566 lt!152821))) ((_ sign_extend 32) (currentBit!5068 (_2!4566 lt!152821)))) lt!153457))))

(declare-fun bs!7977 () Bool)

(assert (= bs!7977 d!32544))

(assert (=> bs!7977 m!153209))

(assert (=> b!104461 d!32544))

(declare-fun d!32546 () Bool)

(declare-fun e!68602 () Bool)

(assert (=> d!32546 e!68602))

(declare-fun res!86250 () Bool)

(assert (=> d!32546 (=> (not res!86250) (not e!68602))))

(declare-fun lt!154049 () BitStream!3918)

(declare-fun lt!154050 () (_ BitVec 64))

(assert (=> d!32546 (= res!86250 (= (bvadd lt!154050 (bvsub lt!152995 lt!153001)) (bitIndex!0 (size!2222 (buf!2588 lt!154049)) (currentByte!5073 lt!154049) (currentBit!5068 lt!154049))))))

(assert (=> d!32546 (or (not (= (bvand lt!154050 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!152995 lt!153001) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!154050 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!154050 (bvsub lt!152995 lt!153001)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32546 (= lt!154050 (bitIndex!0 (size!2222 (buf!2588 (_2!4568 lt!152988))) (currentByte!5073 (_2!4568 lt!152988)) (currentBit!5068 (_2!4568 lt!152988))))))

(assert (=> d!32546 (= lt!154049 (_2!4566 (moveBitIndex!0 (_2!4568 lt!152988) (bvsub lt!152995 lt!153001))))))

(assert (=> d!32546 (moveBitIndexPrecond!0 (_2!4568 lt!152988) (bvsub lt!152995 lt!153001))))

(assert (=> d!32546 (= (withMovedBitIndex!0 (_2!4568 lt!152988) (bvsub lt!152995 lt!153001)) lt!154049)))

(declare-fun b!104745 () Bool)

(assert (=> b!104745 (= e!68602 (= (size!2222 (buf!2588 (_2!4568 lt!152988))) (size!2222 (buf!2588 lt!154049))))))

(assert (= (and d!32546 res!86250) b!104745))

(declare-fun m!153375 () Bool)

(assert (=> d!32546 m!153375))

(assert (=> d!32546 m!153335))

(declare-fun m!153377 () Bool)

(assert (=> d!32546 m!153377))

(declare-fun m!153379 () Bool)

(assert (=> d!32546 m!153379))

(assert (=> b!104335 d!32546))

(assert (=> b!104335 d!32508))

(assert (=> b!104335 d!32438))

(declare-fun d!32548 () Bool)

(declare-fun e!68603 () Bool)

(assert (=> d!32548 e!68603))

(declare-fun res!86251 () Bool)

(assert (=> d!32548 (=> (not res!86251) (not e!68603))))

(assert (=> d!32548 (= res!86251 (= (buf!2588 (_2!4566 (increaseBitIndex!0 (readerFrom!0 (_2!4566 lt!152821) (currentBit!5068 thiss!1305) (currentByte!5073 thiss!1305))))) (buf!2588 (readerFrom!0 (_2!4566 lt!152821) (currentBit!5068 thiss!1305) (currentByte!5073 thiss!1305)))))))

(declare-fun lt!154057 () Bool)

(assert (=> d!32548 (= lt!154057 (not (= (bvand ((_ sign_extend 24) (select (arr!2815 (buf!2588 (readerFrom!0 (_2!4566 lt!152821) (currentBit!5068 thiss!1305) (currentByte!5073 thiss!1305)))) (currentByte!5073 (readerFrom!0 (_2!4566 lt!152821) (currentBit!5068 thiss!1305) (currentByte!5073 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5068 (readerFrom!0 (_2!4566 lt!152821) (currentBit!5068 thiss!1305) (currentByte!5073 thiss!1305)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!154055 () tuple2!8642)

(assert (=> d!32548 (= lt!154055 (tuple2!8643 (not (= (bvand ((_ sign_extend 24) (select (arr!2815 (buf!2588 (readerFrom!0 (_2!4566 lt!152821) (currentBit!5068 thiss!1305) (currentByte!5073 thiss!1305)))) (currentByte!5073 (readerFrom!0 (_2!4566 lt!152821) (currentBit!5068 thiss!1305) (currentByte!5073 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5068 (readerFrom!0 (_2!4566 lt!152821) (currentBit!5068 thiss!1305) (currentByte!5073 thiss!1305)))))) #b00000000000000000000000000000000)) (_2!4566 (increaseBitIndex!0 (readerFrom!0 (_2!4566 lt!152821) (currentBit!5068 thiss!1305) (currentByte!5073 thiss!1305))))))))

(assert (=> d!32548 (validate_offset_bit!0 ((_ sign_extend 32) (size!2222 (buf!2588 (readerFrom!0 (_2!4566 lt!152821) (currentBit!5068 thiss!1305) (currentByte!5073 thiss!1305))))) ((_ sign_extend 32) (currentByte!5073 (readerFrom!0 (_2!4566 lt!152821) (currentBit!5068 thiss!1305) (currentByte!5073 thiss!1305)))) ((_ sign_extend 32) (currentBit!5068 (readerFrom!0 (_2!4566 lt!152821) (currentBit!5068 thiss!1305) (currentByte!5073 thiss!1305)))))))

(assert (=> d!32548 (= (readBit!0 (readerFrom!0 (_2!4566 lt!152821) (currentBit!5068 thiss!1305) (currentByte!5073 thiss!1305))) lt!154055)))

(declare-fun lt!154056 () (_ BitVec 64))

(declare-fun b!104746 () Bool)

(declare-fun lt!154053 () (_ BitVec 64))

(assert (=> b!104746 (= e!68603 (= (bitIndex!0 (size!2222 (buf!2588 (_2!4566 (increaseBitIndex!0 (readerFrom!0 (_2!4566 lt!152821) (currentBit!5068 thiss!1305) (currentByte!5073 thiss!1305)))))) (currentByte!5073 (_2!4566 (increaseBitIndex!0 (readerFrom!0 (_2!4566 lt!152821) (currentBit!5068 thiss!1305) (currentByte!5073 thiss!1305))))) (currentBit!5068 (_2!4566 (increaseBitIndex!0 (readerFrom!0 (_2!4566 lt!152821) (currentBit!5068 thiss!1305) (currentByte!5073 thiss!1305)))))) (bvadd lt!154056 lt!154053)))))

(assert (=> b!104746 (or (not (= (bvand lt!154056 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!154053 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!154056 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!154056 lt!154053) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!104746 (= lt!154053 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!104746 (= lt!154056 (bitIndex!0 (size!2222 (buf!2588 (readerFrom!0 (_2!4566 lt!152821) (currentBit!5068 thiss!1305) (currentByte!5073 thiss!1305)))) (currentByte!5073 (readerFrom!0 (_2!4566 lt!152821) (currentBit!5068 thiss!1305) (currentByte!5073 thiss!1305))) (currentBit!5068 (readerFrom!0 (_2!4566 lt!152821) (currentBit!5068 thiss!1305) (currentByte!5073 thiss!1305)))))))

(declare-fun lt!154052 () Bool)

(assert (=> b!104746 (= lt!154052 (not (= (bvand ((_ sign_extend 24) (select (arr!2815 (buf!2588 (readerFrom!0 (_2!4566 lt!152821) (currentBit!5068 thiss!1305) (currentByte!5073 thiss!1305)))) (currentByte!5073 (readerFrom!0 (_2!4566 lt!152821) (currentBit!5068 thiss!1305) (currentByte!5073 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5068 (readerFrom!0 (_2!4566 lt!152821) (currentBit!5068 thiss!1305) (currentByte!5073 thiss!1305)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!154054 () Bool)

(assert (=> b!104746 (= lt!154054 (not (= (bvand ((_ sign_extend 24) (select (arr!2815 (buf!2588 (readerFrom!0 (_2!4566 lt!152821) (currentBit!5068 thiss!1305) (currentByte!5073 thiss!1305)))) (currentByte!5073 (readerFrom!0 (_2!4566 lt!152821) (currentBit!5068 thiss!1305) (currentByte!5073 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5068 (readerFrom!0 (_2!4566 lt!152821) (currentBit!5068 thiss!1305) (currentByte!5073 thiss!1305)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!154051 () Bool)

(assert (=> b!104746 (= lt!154051 (not (= (bvand ((_ sign_extend 24) (select (arr!2815 (buf!2588 (readerFrom!0 (_2!4566 lt!152821) (currentBit!5068 thiss!1305) (currentByte!5073 thiss!1305)))) (currentByte!5073 (readerFrom!0 (_2!4566 lt!152821) (currentBit!5068 thiss!1305) (currentByte!5073 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5068 (readerFrom!0 (_2!4566 lt!152821) (currentBit!5068 thiss!1305) (currentByte!5073 thiss!1305)))))) #b00000000000000000000000000000000)))))

(assert (= (and d!32548 res!86251) b!104746))

(assert (=> d!32548 m!152433))

(declare-fun m!153381 () Bool)

(assert (=> d!32548 m!153381))

(declare-fun m!153383 () Bool)

(assert (=> d!32548 m!153383))

(declare-fun m!153385 () Bool)

(assert (=> d!32548 m!153385))

(declare-fun m!153387 () Bool)

(assert (=> d!32548 m!153387))

(assert (=> b!104746 m!153383))

(declare-fun m!153389 () Bool)

(assert (=> b!104746 m!153389))

(assert (=> b!104746 m!152433))

(assert (=> b!104746 m!153381))

(assert (=> b!104746 m!153385))

(declare-fun m!153391 () Bool)

(assert (=> b!104746 m!153391))

(assert (=> d!32366 d!32548))

(declare-fun d!32550 () Bool)

(declare-fun e!68604 () Bool)

(assert (=> d!32550 e!68604))

(declare-fun res!86253 () Bool)

(assert (=> d!32550 (=> (not res!86253) (not e!68604))))

(declare-fun lt!154061 () (_ BitVec 64))

(declare-fun lt!154060 () (_ BitVec 64))

(declare-fun lt!154062 () (_ BitVec 64))

(assert (=> d!32550 (= res!86253 (= lt!154061 (bvsub lt!154060 lt!154062)))))

(assert (=> d!32550 (or (= (bvand lt!154060 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!154062 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!154060 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!154060 lt!154062) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32550 (= lt!154062 (remainingBits!0 ((_ sign_extend 32) (size!2222 (buf!2588 (_1!4567 lt!153443)))) ((_ sign_extend 32) (currentByte!5073 (_1!4567 lt!153443))) ((_ sign_extend 32) (currentBit!5068 (_1!4567 lt!153443)))))))

(declare-fun lt!154059 () (_ BitVec 64))

(declare-fun lt!154058 () (_ BitVec 64))

(assert (=> d!32550 (= lt!154060 (bvmul lt!154059 lt!154058))))

(assert (=> d!32550 (or (= lt!154059 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!154058 (bvsdiv (bvmul lt!154059 lt!154058) lt!154059)))))

(assert (=> d!32550 (= lt!154058 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!32550 (= lt!154059 ((_ sign_extend 32) (size!2222 (buf!2588 (_1!4567 lt!153443)))))))

(assert (=> d!32550 (= lt!154061 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5073 (_1!4567 lt!153443))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5068 (_1!4567 lt!153443)))))))

(assert (=> d!32550 (invariant!0 (currentBit!5068 (_1!4567 lt!153443)) (currentByte!5073 (_1!4567 lt!153443)) (size!2222 (buf!2588 (_1!4567 lt!153443))))))

(assert (=> d!32550 (= (bitIndex!0 (size!2222 (buf!2588 (_1!4567 lt!153443))) (currentByte!5073 (_1!4567 lt!153443)) (currentBit!5068 (_1!4567 lt!153443))) lt!154061)))

(declare-fun b!104747 () Bool)

(declare-fun res!86252 () Bool)

(assert (=> b!104747 (=> (not res!86252) (not e!68604))))

(assert (=> b!104747 (= res!86252 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!154061))))

(declare-fun b!104748 () Bool)

(declare-fun lt!154063 () (_ BitVec 64))

(assert (=> b!104748 (= e!68604 (bvsle lt!154061 (bvmul lt!154063 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!104748 (or (= lt!154063 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!154063 #b0000000000000000000000000000000000000000000000000000000000001000) lt!154063)))))

(assert (=> b!104748 (= lt!154063 ((_ sign_extend 32) (size!2222 (buf!2588 (_1!4567 lt!153443)))))))

(assert (= (and d!32550 res!86253) b!104747))

(assert (= (and b!104747 res!86252) b!104748))

(declare-fun m!153393 () Bool)

(assert (=> d!32550 m!153393))

(declare-fun m!153395 () Bool)

(assert (=> d!32550 m!153395))

(assert (=> b!104457 d!32550))

(assert (=> b!104457 d!32542))

(declare-fun d!32552 () Bool)

(assert (=> d!32552 (= (remainingBits!0 ((_ sign_extend 32) (size!2222 (buf!2588 (_1!4567 lt!152826)))) ((_ sign_extend 32) (currentByte!5073 (_1!4567 lt!152826))) ((_ sign_extend 32) (currentBit!5068 (_1!4567 lt!152826)))) (bvsub (bvmul ((_ sign_extend 32) (size!2222 (buf!2588 (_1!4567 lt!152826)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5073 (_1!4567 lt!152826))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5068 (_1!4567 lt!152826))))))))

(assert (=> d!32264 d!32552))

(declare-fun d!32554 () Bool)

(assert (=> d!32554 (= (invariant!0 (currentBit!5068 (_1!4567 lt!152826)) (currentByte!5073 (_1!4567 lt!152826)) (size!2222 (buf!2588 (_1!4567 lt!152826)))) (and (bvsge (currentBit!5068 (_1!4567 lt!152826)) #b00000000000000000000000000000000) (bvslt (currentBit!5068 (_1!4567 lt!152826)) #b00000000000000000000000000001000) (bvsge (currentByte!5073 (_1!4567 lt!152826)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5073 (_1!4567 lt!152826)) (size!2222 (buf!2588 (_1!4567 lt!152826)))) (and (= (currentBit!5068 (_1!4567 lt!152826)) #b00000000000000000000000000000000) (= (currentByte!5073 (_1!4567 lt!152826)) (size!2222 (buf!2588 (_1!4567 lt!152826))))))))))

(assert (=> d!32264 d!32554))

(declare-fun b!104760 () Bool)

(declare-fun res!86263 () Bool)

(declare-fun e!68615 () Bool)

(assert (=> b!104760 (=> (not res!86263) (not e!68615))))

(declare-fun _$19!90 () tuple2!8622)

(assert (=> b!104760 (= res!86263 (= (bitIndex!0 (size!2222 (buf!2588 (_2!4566 _$19!90))) (currentByte!5073 (_2!4566 _$19!90)) (currentBit!5068 (_2!4566 _$19!90))) (bvadd (bitIndex!0 (size!2222 (buf!2588 thiss!1305)) (currentByte!5073 thiss!1305) (currentBit!5068 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!104761 () Bool)

(declare-fun e!68616 () Bool)

(assert (=> b!104761 (= e!68616 (array_inv!2024 (buf!2588 (_2!4566 _$19!90))))))

(declare-fun d!32556 () Bool)

(assert (=> d!32556 e!68615))

(declare-fun res!86262 () Bool)

(assert (=> d!32556 (=> (not res!86262) (not e!68615))))

(assert (=> d!32556 (= res!86262 (= (size!2222 (buf!2588 thiss!1305)) (size!2222 (buf!2588 (_2!4566 _$19!90)))))))

(assert (=> d!32556 (and (inv!12 (_2!4566 _$19!90)) e!68616)))

(assert (=> d!32556 (= (choose!16 thiss!1305 lt!152816) _$19!90)))

(declare-fun b!104762 () Bool)

(declare-fun e!68614 () Bool)

(declare-fun lt!154066 () tuple2!8624)

(assert (=> b!104762 (= e!68614 (= (bitIndex!0 (size!2222 (buf!2588 (_1!4567 lt!154066))) (currentByte!5073 (_1!4567 lt!154066)) (currentBit!5068 (_1!4567 lt!154066))) (bitIndex!0 (size!2222 (buf!2588 (_2!4566 _$19!90))) (currentByte!5073 (_2!4566 _$19!90)) (currentBit!5068 (_2!4566 _$19!90)))))))

(declare-fun b!104763 () Bool)

(declare-fun res!86264 () Bool)

(assert (=> b!104763 (=> (not res!86264) (not e!68615))))

(assert (=> b!104763 (= res!86264 (isPrefixOf!0 thiss!1305 (_2!4566 _$19!90)))))

(declare-fun b!104764 () Bool)

(assert (=> b!104764 (= e!68615 e!68614)))

(declare-fun res!86265 () Bool)

(assert (=> b!104764 (=> (not res!86265) (not e!68614))))

(assert (=> b!104764 (= res!86265 (and (= (_2!4567 lt!154066) lt!152816) (= (_1!4567 lt!154066) (_2!4566 _$19!90))))))

(assert (=> b!104764 (= lt!154066 (readBitPure!0 (readerFrom!0 (_2!4566 _$19!90) (currentBit!5068 thiss!1305) (currentByte!5073 thiss!1305))))))

(assert (= d!32556 b!104761))

(assert (= (and d!32556 res!86262) b!104760))

(assert (= (and b!104760 res!86263) b!104763))

(assert (= (and b!104763 res!86264) b!104764))

(assert (= (and b!104764 res!86265) b!104762))

(declare-fun m!153397 () Bool)

(assert (=> d!32556 m!153397))

(declare-fun m!153399 () Bool)

(assert (=> b!104762 m!153399))

(declare-fun m!153401 () Bool)

(assert (=> b!104762 m!153401))

(assert (=> b!104760 m!153401))

(assert (=> b!104760 m!152441))

(declare-fun m!153403 () Bool)

(assert (=> b!104763 m!153403))

(declare-fun m!153405 () Bool)

(assert (=> b!104764 m!153405))

(assert (=> b!104764 m!153405))

(declare-fun m!153407 () Bool)

(assert (=> b!104764 m!153407))

(declare-fun m!153409 () Bool)

(assert (=> b!104761 m!153409))

(assert (=> d!32334 d!32556))

(declare-fun d!32558 () Bool)

(assert (=> d!32558 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!2222 (buf!2588 thiss!1305))) ((_ sign_extend 32) (currentByte!5073 thiss!1305)) ((_ sign_extend 32) (currentBit!5068 thiss!1305))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2222 (buf!2588 thiss!1305))) ((_ sign_extend 32) (currentByte!5073 thiss!1305)) ((_ sign_extend 32) (currentBit!5068 thiss!1305))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!7978 () Bool)

(assert (= bs!7978 d!32558))

(assert (=> bs!7978 m!153199))

(assert (=> d!32334 d!32558))

(assert (=> d!32346 d!32332))

(declare-fun d!32560 () Bool)

(assert (=> d!32560 (isPrefixOf!0 thiss!1305 (_2!4566 lt!152813))))

(assert (=> d!32560 true))

(declare-fun _$15!165 () Unit!6388)

(assert (=> d!32560 (= (choose!30 thiss!1305 (_2!4566 lt!152821) (_2!4566 lt!152813)) _$15!165)))

(declare-fun bs!7979 () Bool)

(assert (= bs!7979 d!32560))

(assert (=> bs!7979 m!152413))

(assert (=> d!32346 d!32560))

(assert (=> d!32346 d!32390))

(declare-fun d!32562 () Bool)

(assert (=> d!32562 (= (remainingBits!0 ((_ sign_extend 32) (size!2222 (buf!2588 (_1!4567 lt!152808)))) ((_ sign_extend 32) (currentByte!5073 (_1!4567 lt!152808))) ((_ sign_extend 32) (currentBit!5068 (_1!4567 lt!152808)))) (bvsub (bvmul ((_ sign_extend 32) (size!2222 (buf!2588 (_1!4567 lt!152808)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5073 (_1!4567 lt!152808))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5068 (_1!4567 lt!152808))))))))

(assert (=> d!32360 d!32562))

(declare-fun d!32564 () Bool)

(assert (=> d!32564 (= (invariant!0 (currentBit!5068 (_1!4567 lt!152808)) (currentByte!5073 (_1!4567 lt!152808)) (size!2222 (buf!2588 (_1!4567 lt!152808)))) (and (bvsge (currentBit!5068 (_1!4567 lt!152808)) #b00000000000000000000000000000000) (bvslt (currentBit!5068 (_1!4567 lt!152808)) #b00000000000000000000000000001000) (bvsge (currentByte!5073 (_1!4567 lt!152808)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5073 (_1!4567 lt!152808)) (size!2222 (buf!2588 (_1!4567 lt!152808)))) (and (= (currentBit!5068 (_1!4567 lt!152808)) #b00000000000000000000000000000000) (= (currentByte!5073 (_1!4567 lt!152808)) (size!2222 (buf!2588 (_1!4567 lt!152808))))))))))

(assert (=> d!32360 d!32564))

(assert (=> d!32262 d!32472))

(declare-fun d!32566 () Bool)

(assert (=> d!32566 (isPrefixOf!0 lt!152998 (_2!4566 lt!152813))))

(declare-fun lt!154067 () Unit!6388)

(assert (=> d!32566 (= lt!154067 (choose!30 lt!152998 (_2!4566 lt!152813) (_2!4566 lt!152813)))))

(assert (=> d!32566 (isPrefixOf!0 lt!152998 (_2!4566 lt!152813))))

(assert (=> d!32566 (= (lemmaIsPrefixTransitive!0 lt!152998 (_2!4566 lt!152813) (_2!4566 lt!152813)) lt!154067)))

(declare-fun bs!7980 () Bool)

(assert (= bs!7980 d!32566))

(assert (=> bs!7980 m!152591))

(declare-fun m!153411 () Bool)

(assert (=> bs!7980 m!153411))

(assert (=> bs!7980 m!152591))

(assert (=> d!32262 d!32566))

(declare-fun d!32568 () Bool)

(assert (=> d!32568 (isPrefixOf!0 thiss!1305 thiss!1305)))

(declare-fun lt!154068 () Unit!6388)

(assert (=> d!32568 (= lt!154068 (choose!11 thiss!1305))))

(assert (=> d!32568 (= (lemmaIsPrefixRefl!0 thiss!1305) lt!154068)))

(declare-fun bs!7981 () Bool)

(assert (= bs!7981 d!32568))

(assert (=> bs!7981 m!152597))

(declare-fun m!153413 () Bool)

(assert (=> bs!7981 m!153413))

(assert (=> d!32262 d!32568))

(declare-fun d!32570 () Bool)

(declare-fun res!86267 () Bool)

(declare-fun e!68618 () Bool)

(assert (=> d!32570 (=> (not res!86267) (not e!68618))))

(assert (=> d!32570 (= res!86267 (= (size!2222 (buf!2588 lt!152998)) (size!2222 (buf!2588 (_2!4566 lt!152813)))))))

(assert (=> d!32570 (= (isPrefixOf!0 lt!152998 (_2!4566 lt!152813)) e!68618)))

(declare-fun b!104765 () Bool)

(declare-fun res!86266 () Bool)

(assert (=> b!104765 (=> (not res!86266) (not e!68618))))

(assert (=> b!104765 (= res!86266 (bvsle (bitIndex!0 (size!2222 (buf!2588 lt!152998)) (currentByte!5073 lt!152998) (currentBit!5068 lt!152998)) (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!152813))) (currentByte!5073 (_2!4566 lt!152813)) (currentBit!5068 (_2!4566 lt!152813)))))))

(declare-fun b!104766 () Bool)

(declare-fun e!68617 () Bool)

(assert (=> b!104766 (= e!68618 e!68617)))

(declare-fun res!86268 () Bool)

(assert (=> b!104766 (=> res!86268 e!68617)))

(assert (=> b!104766 (= res!86268 (= (size!2222 (buf!2588 lt!152998)) #b00000000000000000000000000000000))))

(declare-fun b!104767 () Bool)

(assert (=> b!104767 (= e!68617 (arrayBitRangesEq!0 (buf!2588 lt!152998) (buf!2588 (_2!4566 lt!152813)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2222 (buf!2588 lt!152998)) (currentByte!5073 lt!152998) (currentBit!5068 lt!152998))))))

(assert (= (and d!32570 res!86267) b!104765))

(assert (= (and b!104765 res!86266) b!104766))

(assert (= (and b!104766 (not res!86268)) b!104767))

(declare-fun m!153415 () Bool)

(assert (=> b!104765 m!153415))

(assert (=> b!104765 m!152583))

(assert (=> b!104767 m!153415))

(assert (=> b!104767 m!153415))

(declare-fun m!153417 () Bool)

(assert (=> b!104767 m!153417))

(assert (=> d!32262 d!32570))

(declare-fun d!32572 () Bool)

(declare-fun res!86270 () Bool)

(declare-fun e!68620 () Bool)

(assert (=> d!32572 (=> (not res!86270) (not e!68620))))

(assert (=> d!32572 (= res!86270 (= (size!2222 (buf!2588 (_1!4568 lt!152988))) (size!2222 (buf!2588 (_2!4568 lt!152988)))))))

(assert (=> d!32572 (= (isPrefixOf!0 (_1!4568 lt!152988) (_2!4568 lt!152988)) e!68620)))

(declare-fun b!104768 () Bool)

(declare-fun res!86269 () Bool)

(assert (=> b!104768 (=> (not res!86269) (not e!68620))))

(assert (=> b!104768 (= res!86269 (bvsle (bitIndex!0 (size!2222 (buf!2588 (_1!4568 lt!152988))) (currentByte!5073 (_1!4568 lt!152988)) (currentBit!5068 (_1!4568 lt!152988))) (bitIndex!0 (size!2222 (buf!2588 (_2!4568 lt!152988))) (currentByte!5073 (_2!4568 lt!152988)) (currentBit!5068 (_2!4568 lt!152988)))))))

(declare-fun b!104769 () Bool)

(declare-fun e!68619 () Bool)

(assert (=> b!104769 (= e!68620 e!68619)))

(declare-fun res!86271 () Bool)

(assert (=> b!104769 (=> res!86271 e!68619)))

(assert (=> b!104769 (= res!86271 (= (size!2222 (buf!2588 (_1!4568 lt!152988))) #b00000000000000000000000000000000))))

(declare-fun b!104770 () Bool)

(assert (=> b!104770 (= e!68619 (arrayBitRangesEq!0 (buf!2588 (_1!4568 lt!152988)) (buf!2588 (_2!4568 lt!152988)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2222 (buf!2588 (_1!4568 lt!152988))) (currentByte!5073 (_1!4568 lt!152988)) (currentBit!5068 (_1!4568 lt!152988)))))))

(assert (= (and d!32572 res!86270) b!104768))

(assert (= (and b!104768 res!86269) b!104769))

(assert (= (and b!104769 (not res!86271)) b!104770))

(declare-fun m!153419 () Bool)

(assert (=> b!104768 m!153419))

(assert (=> b!104768 m!153335))

(assert (=> b!104770 m!153419))

(assert (=> b!104770 m!153419))

(declare-fun m!153421 () Bool)

(assert (=> b!104770 m!153421))

(assert (=> d!32262 d!32572))

(assert (=> d!32262 d!32332))

(declare-fun d!32574 () Bool)

(declare-fun res!86273 () Bool)

(declare-fun e!68622 () Bool)

(assert (=> d!32574 (=> (not res!86273) (not e!68622))))

(assert (=> d!32574 (= res!86273 (= (size!2222 (buf!2588 thiss!1305)) (size!2222 (buf!2588 thiss!1305))))))

(assert (=> d!32574 (= (isPrefixOf!0 thiss!1305 thiss!1305) e!68622)))

(declare-fun b!104771 () Bool)

(declare-fun res!86272 () Bool)

(assert (=> b!104771 (=> (not res!86272) (not e!68622))))

(assert (=> b!104771 (= res!86272 (bvsle (bitIndex!0 (size!2222 (buf!2588 thiss!1305)) (currentByte!5073 thiss!1305) (currentBit!5068 thiss!1305)) (bitIndex!0 (size!2222 (buf!2588 thiss!1305)) (currentByte!5073 thiss!1305) (currentBit!5068 thiss!1305))))))

(declare-fun b!104772 () Bool)

(declare-fun e!68621 () Bool)

(assert (=> b!104772 (= e!68622 e!68621)))

(declare-fun res!86274 () Bool)

(assert (=> b!104772 (=> res!86274 e!68621)))

(assert (=> b!104772 (= res!86274 (= (size!2222 (buf!2588 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!104773 () Bool)

(assert (=> b!104773 (= e!68621 (arrayBitRangesEq!0 (buf!2588 thiss!1305) (buf!2588 thiss!1305) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2222 (buf!2588 thiss!1305)) (currentByte!5073 thiss!1305) (currentBit!5068 thiss!1305))))))

(assert (= (and d!32574 res!86273) b!104771))

(assert (= (and b!104771 res!86272) b!104772))

(assert (= (and b!104772 (not res!86274)) b!104773))

(assert (=> b!104771 m!152441))

(assert (=> b!104771 m!152441))

(assert (=> b!104773 m!152441))

(assert (=> b!104773 m!152441))

(declare-fun m!153423 () Bool)

(assert (=> b!104773 m!153423))

(assert (=> d!32262 d!32574))

(declare-fun d!32576 () Bool)

(assert (=> d!32576 (isPrefixOf!0 lt!152998 (_2!4566 lt!152813))))

(declare-fun lt!154069 () Unit!6388)

(assert (=> d!32576 (= lt!154069 (choose!30 lt!152998 thiss!1305 (_2!4566 lt!152813)))))

(assert (=> d!32576 (isPrefixOf!0 lt!152998 thiss!1305)))

(assert (=> d!32576 (= (lemmaIsPrefixTransitive!0 lt!152998 thiss!1305 (_2!4566 lt!152813)) lt!154069)))

(declare-fun bs!7982 () Bool)

(assert (= bs!7982 d!32576))

(assert (=> bs!7982 m!152591))

(declare-fun m!153425 () Bool)

(assert (=> bs!7982 m!153425))

(declare-fun m!153427 () Bool)

(assert (=> bs!7982 m!153427))

(assert (=> d!32262 d!32576))

(declare-fun d!32578 () Bool)

(declare-fun res!86276 () Bool)

(declare-fun e!68624 () Bool)

(assert (=> d!32578 (=> (not res!86276) (not e!68624))))

(assert (=> d!32578 (= res!86276 (= (size!2222 (buf!2588 lt!152998)) (size!2222 (buf!2588 lt!152998))))))

(assert (=> d!32578 (= (isPrefixOf!0 lt!152998 lt!152998) e!68624)))

(declare-fun b!104774 () Bool)

(declare-fun res!86275 () Bool)

(assert (=> b!104774 (=> (not res!86275) (not e!68624))))

(assert (=> b!104774 (= res!86275 (bvsle (bitIndex!0 (size!2222 (buf!2588 lt!152998)) (currentByte!5073 lt!152998) (currentBit!5068 lt!152998)) (bitIndex!0 (size!2222 (buf!2588 lt!152998)) (currentByte!5073 lt!152998) (currentBit!5068 lt!152998))))))

(declare-fun b!104775 () Bool)

(declare-fun e!68623 () Bool)

(assert (=> b!104775 (= e!68624 e!68623)))

(declare-fun res!86277 () Bool)

(assert (=> b!104775 (=> res!86277 e!68623)))

(assert (=> b!104775 (= res!86277 (= (size!2222 (buf!2588 lt!152998)) #b00000000000000000000000000000000))))

(declare-fun b!104776 () Bool)

(assert (=> b!104776 (= e!68623 (arrayBitRangesEq!0 (buf!2588 lt!152998) (buf!2588 lt!152998) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2222 (buf!2588 lt!152998)) (currentByte!5073 lt!152998) (currentBit!5068 lt!152998))))))

(assert (= (and d!32578 res!86276) b!104774))

(assert (= (and b!104774 res!86275) b!104775))

(assert (= (and b!104775 (not res!86277)) b!104776))

(assert (=> b!104774 m!153415))

(assert (=> b!104774 m!153415))

(assert (=> b!104776 m!153415))

(assert (=> b!104776 m!153415))

(declare-fun m!153429 () Bool)

(assert (=> b!104776 m!153429))

(assert (=> d!32262 d!32578))

(declare-fun d!32580 () Bool)

(assert (=> d!32580 (isPrefixOf!0 lt!152998 lt!152998)))

(declare-fun lt!154070 () Unit!6388)

(assert (=> d!32580 (= lt!154070 (choose!11 lt!152998))))

(assert (=> d!32580 (= (lemmaIsPrefixRefl!0 lt!152998) lt!154070)))

(declare-fun bs!7983 () Bool)

(assert (= bs!7983 d!32580))

(assert (=> bs!7983 m!152601))

(declare-fun m!153431 () Bool)

(assert (=> bs!7983 m!153431))

(assert (=> d!32262 d!32580))

(assert (=> d!32262 d!32460))

(declare-fun b!104777 () Bool)

(declare-fun res!86282 () Bool)

(declare-fun e!68627 () Bool)

(assert (=> b!104777 (=> (not res!86282) (not e!68627))))

(declare-fun lt!154079 () tuple2!8644)

(assert (=> b!104777 (= res!86282 (= (bvand (_1!4577 lt!154079) (onesLSBLong!0 nBits!396)) (_1!4577 lt!154079)))))

(declare-fun lt!154074 () (_ BitVec 64))

(declare-fun e!68626 () Bool)

(declare-fun b!104778 () Bool)

(assert (=> b!104778 (= e!68626 (= (= (bvand (bvlshr (_1!4577 lt!154079) lt!154074) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!4567 (readBitPure!0 (_1!4568 lt!152827)))))))

(assert (=> b!104778 (and (bvsge lt!154074 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!154074 #b0000000000000000000000000000000000000000000000000000000001000000))))

(declare-fun lt!154076 () (_ BitVec 32))

(assert (=> b!104778 (= lt!154074 ((_ sign_extend 32) (bvsub lt!154076 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!104778 (or (= (bvand lt!154076 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand lt!154076 #b10000000000000000000000000000000) (bvand (bvsub lt!154076 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!104778 (= lt!154076 (bvsub nBits!396 #b00000000000000000000000000000001))))

(assert (=> b!104778 (or (= (bvand nBits!396 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))

(declare-fun b!104779 () Bool)

(assert (=> b!104779 (= e!68627 e!68626)))

(declare-fun res!86281 () Bool)

(assert (=> b!104779 (=> res!86281 e!68626)))

(assert (=> b!104779 (= res!86281 (bvsge (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(declare-fun b!104780 () Bool)

(declare-fun res!86279 () Bool)

(assert (=> b!104780 (=> (not res!86279) (not e!68627))))

(declare-fun lt!154071 () (_ BitVec 64))

(declare-fun lt!154077 () (_ BitVec 64))

(assert (=> b!104780 (= res!86279 (= (bitIndex!0 (size!2222 (buf!2588 (_2!4577 lt!154079))) (currentByte!5073 (_2!4577 lt!154079)) (currentBit!5068 (_2!4577 lt!154079))) (bvadd lt!154077 lt!154071)))))

(assert (=> b!104780 (or (not (= (bvand lt!154077 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!154071 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!154077 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!154077 lt!154071) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!104780 (= lt!154071 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!104780 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!104780 (= lt!154077 (bitIndex!0 (size!2222 (buf!2588 (_1!4568 lt!152827))) (currentByte!5073 (_1!4568 lt!152827)) (currentBit!5068 (_1!4568 lt!152827))))))

(declare-fun b!104781 () Bool)

(declare-fun e!68625 () tuple2!8644)

(assert (=> b!104781 (= e!68625 (tuple2!8645 lt!152818 (_1!4568 lt!152827)))))

(declare-fun b!104782 () Bool)

(declare-fun lt!154072 () tuple2!8644)

(assert (=> b!104782 (= e!68625 (tuple2!8645 (_1!4577 lt!154072) (_2!4577 lt!154072)))))

(declare-fun lt!154073 () tuple2!8642)

(assert (=> b!104782 (= lt!154073 (readBit!0 (_1!4568 lt!152827)))))

(assert (=> b!104782 (= lt!154072 (readNLeastSignificantBitsLoop!0 (_2!4576 lt!154073) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!152818 (ite (_1!4576 lt!154073) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!104783 () Bool)

(declare-fun res!86278 () Bool)

(assert (=> b!104783 (=> (not res!86278) (not e!68627))))

(declare-fun lt!154075 () (_ BitVec 64))

(declare-fun lt!154078 () (_ BitVec 64))

(assert (=> b!104783 (= res!86278 (= (bvlshr (_1!4577 lt!154079) lt!154075) (bvlshr lt!152818 lt!154078)))))

(assert (=> b!104783 (and (bvsge lt!154078 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!154078 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!104783 (= lt!154078 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!104783 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!104783 (and (bvsge lt!154075 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!154075 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!104783 (= lt!154075 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!104783 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(declare-fun d!32582 () Bool)

(assert (=> d!32582 e!68627))

(declare-fun res!86280 () Bool)

(assert (=> d!32582 (=> (not res!86280) (not e!68627))))

(assert (=> d!32582 (= res!86280 (= (buf!2588 (_2!4577 lt!154079)) (buf!2588 (_1!4568 lt!152827))))))

(assert (=> d!32582 (= lt!154079 e!68625)))

(declare-fun c!6454 () Bool)

(assert (=> d!32582 (= c!6454 (= nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> d!32582 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!32582 (= (readNLeastSignificantBitsLoop!0 (_1!4568 lt!152827) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!152818) lt!154079)))

(assert (= (and d!32582 c!6454) b!104781))

(assert (= (and d!32582 (not c!6454)) b!104782))

(assert (= (and d!32582 res!86280) b!104780))

(assert (= (and b!104780 res!86279) b!104783))

(assert (= (and b!104783 res!86278) b!104777))

(assert (= (and b!104777 res!86282) b!104779))

(assert (= (and b!104779 (not res!86281)) b!104778))

(assert (=> b!104777 m!152455))

(declare-fun m!153433 () Bool)

(assert (=> b!104778 m!153433))

(declare-fun m!153435 () Bool)

(assert (=> b!104780 m!153435))

(declare-fun m!153437 () Bool)

(assert (=> b!104780 m!153437))

(declare-fun m!153439 () Bool)

(assert (=> b!104782 m!153439))

(declare-fun m!153441 () Bool)

(assert (=> b!104782 m!153441))

(assert (=> d!32266 d!32582))

(declare-fun d!32584 () Bool)

(declare-fun lt!154080 () tuple2!8642)

(assert (=> d!32584 (= lt!154080 (readBit!0 (readerFrom!0 (_2!4566 lt!153700) (currentBit!5068 thiss!1305) (currentByte!5073 thiss!1305))))))

(assert (=> d!32584 (= (readBitPure!0 (readerFrom!0 (_2!4566 lt!153700) (currentBit!5068 thiss!1305) (currentByte!5073 thiss!1305))) (tuple2!8625 (_2!4576 lt!154080) (_1!4576 lt!154080)))))

(declare-fun bs!7984 () Bool)

(assert (= bs!7984 d!32584))

(assert (=> bs!7984 m!152967))

(declare-fun m!153443 () Bool)

(assert (=> bs!7984 m!153443))

(assert (=> b!104559 d!32584))

(declare-fun d!32586 () Bool)

(declare-fun e!68628 () Bool)

(assert (=> d!32586 e!68628))

(declare-fun res!86283 () Bool)

(assert (=> d!32586 (=> (not res!86283) (not e!68628))))

(assert (=> d!32586 (= res!86283 (invariant!0 (currentBit!5068 (_2!4566 lt!153700)) (currentByte!5073 (_2!4566 lt!153700)) (size!2222 (buf!2588 (_2!4566 lt!153700)))))))

(assert (=> d!32586 (= (readerFrom!0 (_2!4566 lt!153700) (currentBit!5068 thiss!1305) (currentByte!5073 thiss!1305)) (BitStream!3919 (buf!2588 (_2!4566 lt!153700)) (currentByte!5073 thiss!1305) (currentBit!5068 thiss!1305)))))

(declare-fun b!104784 () Bool)

(assert (=> b!104784 (= e!68628 (invariant!0 (currentBit!5068 thiss!1305) (currentByte!5073 thiss!1305) (size!2222 (buf!2588 (_2!4566 lt!153700)))))))

(assert (= (and d!32586 res!86283) b!104784))

(assert (=> d!32586 m!153345))

(declare-fun m!153445 () Bool)

(assert (=> b!104784 m!153445))

(assert (=> b!104559 d!32586))

(declare-fun d!32588 () Bool)

(assert (=> d!32588 (= (remainingBits!0 ((_ sign_extend 32) (size!2222 (buf!2588 (_1!4567 lt!152830)))) ((_ sign_extend 32) (currentByte!5073 (_1!4567 lt!152830))) ((_ sign_extend 32) (currentBit!5068 (_1!4567 lt!152830)))) (bvsub (bvmul ((_ sign_extend 32) (size!2222 (buf!2588 (_1!4567 lt!152830)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5073 (_1!4567 lt!152830))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5068 (_1!4567 lt!152830))))))))

(assert (=> d!32450 d!32588))

(declare-fun d!32590 () Bool)

(assert (=> d!32590 (= (invariant!0 (currentBit!5068 (_1!4567 lt!152830)) (currentByte!5073 (_1!4567 lt!152830)) (size!2222 (buf!2588 (_1!4567 lt!152830)))) (and (bvsge (currentBit!5068 (_1!4567 lt!152830)) #b00000000000000000000000000000000) (bvslt (currentBit!5068 (_1!4567 lt!152830)) #b00000000000000000000000000001000) (bvsge (currentByte!5073 (_1!4567 lt!152830)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5073 (_1!4567 lt!152830)) (size!2222 (buf!2588 (_1!4567 lt!152830)))) (and (= (currentBit!5068 (_1!4567 lt!152830)) #b00000000000000000000000000000000) (= (currentByte!5073 (_1!4567 lt!152830)) (size!2222 (buf!2588 (_1!4567 lt!152830))))))))))

(assert (=> d!32450 d!32590))

(assert (=> b!104332 d!32438))

(declare-fun d!32592 () Bool)

(assert (=> d!32592 (arrayBitRangesEq!0 (buf!2588 (_2!4566 lt!152813)) (buf!2588 thiss!1305) lt!152997 lt!153006)))

(declare-fun lt!154083 () Unit!6388)

(declare-fun choose!8 (array!4868 array!4868 (_ BitVec 64) (_ BitVec 64)) Unit!6388)

(assert (=> d!32592 (= lt!154083 (choose!8 (buf!2588 thiss!1305) (buf!2588 (_2!4566 lt!152813)) lt!152997 lt!153006))))

(assert (=> d!32592 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!152997) (bvsle lt!152997 lt!153006))))

(assert (=> d!32592 (= (arrayBitRangesEqSymmetric!0 (buf!2588 thiss!1305) (buf!2588 (_2!4566 lt!152813)) lt!152997 lt!153006) lt!154083)))

(declare-fun bs!7985 () Bool)

(assert (= bs!7985 d!32592))

(assert (=> bs!7985 m!152607))

(declare-fun m!153447 () Bool)

(assert (=> bs!7985 m!153447))

(assert (=> b!104332 d!32592))

(declare-fun e!68631 () Bool)

(declare-fun lt!154084 () tuple4!68)

(declare-fun b!104785 () Bool)

(assert (=> b!104785 (= e!68631 (arrayRangesEq!35 (buf!2588 (_2!4566 lt!152813)) (buf!2588 thiss!1305) (_1!4580 lt!154084) (_2!4580 lt!154084)))))

(declare-fun b!104786 () Bool)

(declare-fun e!68630 () Bool)

(declare-fun call!1304 () Bool)

(assert (=> b!104786 (= e!68630 call!1304)))

(declare-fun lt!154086 () (_ BitVec 32))

(declare-fun bm!1301 () Bool)

(declare-fun lt!154085 () (_ BitVec 32))

(declare-fun c!6455 () Bool)

(assert (=> bm!1301 (= call!1304 (byteRangesEq!0 (ite c!6455 (select (arr!2815 (buf!2588 (_2!4566 lt!152813))) (_3!255 lt!154084)) (select (arr!2815 (buf!2588 (_2!4566 lt!152813))) (_4!34 lt!154084))) (ite c!6455 (select (arr!2815 (buf!2588 thiss!1305)) (_3!255 lt!154084)) (select (arr!2815 (buf!2588 thiss!1305)) (_4!34 lt!154084))) (ite c!6455 lt!154085 #b00000000000000000000000000000000) lt!154086))))

(declare-fun b!104787 () Bool)

(declare-fun e!68634 () Bool)

(assert (=> b!104787 (= e!68630 e!68634)))

(declare-fun res!86284 () Bool)

(assert (=> b!104787 (= res!86284 (byteRangesEq!0 (select (arr!2815 (buf!2588 (_2!4566 lt!152813))) (_3!255 lt!154084)) (select (arr!2815 (buf!2588 thiss!1305)) (_3!255 lt!154084)) lt!154085 #b00000000000000000000000000001000))))

(assert (=> b!104787 (=> (not res!86284) (not e!68634))))

(declare-fun d!32594 () Bool)

(declare-fun res!86287 () Bool)

(declare-fun e!68632 () Bool)

(assert (=> d!32594 (=> res!86287 e!68632)))

(assert (=> d!32594 (= res!86287 (bvsge lt!152997 lt!153006))))

(assert (=> d!32594 (= (arrayBitRangesEq!0 (buf!2588 (_2!4566 lt!152813)) (buf!2588 thiss!1305) lt!152997 lt!153006) e!68632)))

(declare-fun b!104788 () Bool)

(declare-fun e!68633 () Bool)

(assert (=> b!104788 (= e!68633 call!1304)))

(declare-fun b!104789 () Bool)

(declare-fun e!68629 () Bool)

(assert (=> b!104789 (= e!68629 e!68630)))

(assert (=> b!104789 (= c!6455 (= (_3!255 lt!154084) (_4!34 lt!154084)))))

(declare-fun b!104790 () Bool)

(assert (=> b!104790 (= e!68632 e!68629)))

(declare-fun res!86286 () Bool)

(assert (=> b!104790 (=> (not res!86286) (not e!68629))))

(assert (=> b!104790 (= res!86286 e!68631)))

(declare-fun res!86285 () Bool)

(assert (=> b!104790 (=> res!86285 e!68631)))

(assert (=> b!104790 (= res!86285 (bvsge (_1!4580 lt!154084) (_2!4580 lt!154084)))))

(assert (=> b!104790 (= lt!154086 ((_ extract 31 0) (bvsrem lt!153006 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!104790 (= lt!154085 ((_ extract 31 0) (bvsrem lt!152997 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!104790 (= lt!154084 (arrayBitIndices!0 lt!152997 lt!153006))))

(declare-fun b!104791 () Bool)

(declare-fun res!86288 () Bool)

(assert (=> b!104791 (= res!86288 (= lt!154086 #b00000000000000000000000000000000))))

(assert (=> b!104791 (=> res!86288 e!68633)))

(assert (=> b!104791 (= e!68634 e!68633)))

(assert (= (and d!32594 (not res!86287)) b!104790))

(assert (= (and b!104790 (not res!86285)) b!104785))

(assert (= (and b!104790 res!86286) b!104789))

(assert (= (and b!104789 c!6455) b!104786))

(assert (= (and b!104789 (not c!6455)) b!104787))

(assert (= (and b!104787 res!86284) b!104791))

(assert (= (and b!104791 (not res!86288)) b!104788))

(assert (= (or b!104786 b!104788) bm!1301))

(declare-fun m!153449 () Bool)

(assert (=> b!104785 m!153449))

(declare-fun m!153451 () Bool)

(assert (=> bm!1301 m!153451))

(declare-fun m!153453 () Bool)

(assert (=> bm!1301 m!153453))

(declare-fun m!153455 () Bool)

(assert (=> bm!1301 m!153455))

(declare-fun m!153457 () Bool)

(assert (=> bm!1301 m!153457))

(declare-fun m!153459 () Bool)

(assert (=> bm!1301 m!153459))

(assert (=> b!104787 m!153455))

(assert (=> b!104787 m!153457))

(assert (=> b!104787 m!153455))

(assert (=> b!104787 m!153457))

(declare-fun m!153461 () Bool)

(assert (=> b!104787 m!153461))

(declare-fun m!153463 () Bool)

(assert (=> b!104790 m!153463))

(assert (=> b!104332 d!32594))

(declare-fun d!32596 () Bool)

(assert (=> d!32596 (= (invariant!0 (currentBit!5068 thiss!1305) (currentByte!5073 thiss!1305) (size!2222 (buf!2588 thiss!1305))) (and (bvsge (currentBit!5068 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5068 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5073 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5073 thiss!1305) (size!2222 (buf!2588 thiss!1305))) (and (= (currentBit!5068 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5073 thiss!1305) (size!2222 (buf!2588 thiss!1305)))))))))

(assert (=> d!32246 d!32596))

(declare-fun b!104792 () Bool)

(declare-fun res!86293 () Bool)

(declare-fun e!68637 () Bool)

(assert (=> b!104792 (=> (not res!86293) (not e!68637))))

(declare-fun lt!154095 () tuple2!8644)

(assert (=> b!104792 (= res!86293 (= (bvand (_1!4577 lt!154095) (onesLSBLong!0 nBits!396)) (_1!4577 lt!154095)))))

(declare-fun b!104793 () Bool)

(declare-fun e!68636 () Bool)

(declare-fun lt!154090 () (_ BitVec 64))

(assert (=> b!104793 (= e!68636 (= (= (bvand (bvlshr (_1!4577 lt!154095) lt!154090) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!4567 (readBitPure!0 (withMovedBitIndex!0 (_1!4568 lt!152809) #b0000000000000000000000000000000000000000000000000000000000000001)))))))

(assert (=> b!104793 (and (bvsge lt!154090 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!154090 #b0000000000000000000000000000000000000000000000000000000001000000))))

(declare-fun lt!154092 () (_ BitVec 32))

(assert (=> b!104793 (= lt!154090 ((_ sign_extend 32) (bvsub lt!154092 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!104793 (or (= (bvand lt!154092 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand lt!154092 #b10000000000000000000000000000000) (bvand (bvsub lt!154092 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!104793 (= lt!154092 (bvsub nBits!396 #b00000000000000000000000000000001))))

(assert (=> b!104793 (or (= (bvand nBits!396 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))

(declare-fun b!104794 () Bool)

(assert (=> b!104794 (= e!68637 e!68636)))

(declare-fun res!86292 () Bool)

(assert (=> b!104794 (=> res!86292 e!68636)))

(assert (=> b!104794 (= res!86292 (bvsge (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(declare-fun b!104795 () Bool)

(declare-fun res!86290 () Bool)

(assert (=> b!104795 (=> (not res!86290) (not e!68637))))

(declare-fun lt!154093 () (_ BitVec 64))

(declare-fun lt!154087 () (_ BitVec 64))

(assert (=> b!104795 (= res!86290 (= (bitIndex!0 (size!2222 (buf!2588 (_2!4577 lt!154095))) (currentByte!5073 (_2!4577 lt!154095)) (currentBit!5068 (_2!4577 lt!154095))) (bvadd lt!154093 lt!154087)))))

(assert (=> b!104795 (or (not (= (bvand lt!154093 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!154087 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!154093 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!154093 lt!154087) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!104795 (= lt!154087 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!104795 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!104795 (= lt!154093 (bitIndex!0 (size!2222 (buf!2588 (withMovedBitIndex!0 (_1!4568 lt!152809) #b0000000000000000000000000000000000000000000000000000000000000001))) (currentByte!5073 (withMovedBitIndex!0 (_1!4568 lt!152809) #b0000000000000000000000000000000000000000000000000000000000000001)) (currentBit!5068 (withMovedBitIndex!0 (_1!4568 lt!152809) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!104796 () Bool)

(declare-fun e!68635 () tuple2!8644)

(assert (=> b!104796 (= e!68635 (tuple2!8645 lt!152818 (withMovedBitIndex!0 (_1!4568 lt!152809) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!104797 () Bool)

(declare-fun lt!154088 () tuple2!8644)

(assert (=> b!104797 (= e!68635 (tuple2!8645 (_1!4577 lt!154088) (_2!4577 lt!154088)))))

(declare-fun lt!154089 () tuple2!8642)

(assert (=> b!104797 (= lt!154089 (readBit!0 (withMovedBitIndex!0 (_1!4568 lt!152809) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!104797 (= lt!154088 (readNLeastSignificantBitsLoop!0 (_2!4576 lt!154089) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!152818 (ite (_1!4576 lt!154089) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!104798 () Bool)

(declare-fun res!86289 () Bool)

(assert (=> b!104798 (=> (not res!86289) (not e!68637))))

(declare-fun lt!154094 () (_ BitVec 64))

(declare-fun lt!154091 () (_ BitVec 64))

(assert (=> b!104798 (= res!86289 (= (bvlshr (_1!4577 lt!154095) lt!154091) (bvlshr lt!152818 lt!154094)))))

(assert (=> b!104798 (and (bvsge lt!154094 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!154094 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!104798 (= lt!154094 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!104798 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!104798 (and (bvsge lt!154091 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!154091 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!104798 (= lt!154091 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!104798 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(declare-fun d!32598 () Bool)

(assert (=> d!32598 e!68637))

(declare-fun res!86291 () Bool)

(assert (=> d!32598 (=> (not res!86291) (not e!68637))))

(assert (=> d!32598 (= res!86291 (= (buf!2588 (_2!4577 lt!154095)) (buf!2588 (withMovedBitIndex!0 (_1!4568 lt!152809) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> d!32598 (= lt!154095 e!68635)))

(declare-fun c!6456 () Bool)

(assert (=> d!32598 (= c!6456 (= nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> d!32598 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!32598 (= (readNLeastSignificantBitsLoop!0 (withMovedBitIndex!0 (_1!4568 lt!152809) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!152818) lt!154095)))

(assert (= (and d!32598 c!6456) b!104796))

(assert (= (and d!32598 (not c!6456)) b!104797))

(assert (= (and d!32598 res!86291) b!104795))

(assert (= (and b!104795 res!86290) b!104798))

(assert (= (and b!104798 res!86289) b!104792))

(assert (= (and b!104792 res!86293) b!104794))

(assert (= (and b!104794 (not res!86292)) b!104793))

(assert (=> b!104792 m!152455))

(assert (=> b!104793 m!152443))

(declare-fun m!153465 () Bool)

(assert (=> b!104793 m!153465))

(declare-fun m!153467 () Bool)

(assert (=> b!104795 m!153467))

(declare-fun m!153469 () Bool)

(assert (=> b!104795 m!153469))

(assert (=> b!104797 m!152443))

(declare-fun m!153471 () Bool)

(assert (=> b!104797 m!153471))

(declare-fun m!153473 () Bool)

(assert (=> b!104797 m!153473))

(assert (=> d!32394 d!32598))

(declare-fun d!32600 () Bool)

(declare-fun res!86295 () Bool)

(declare-fun e!68639 () Bool)

(assert (=> d!32600 (=> (not res!86295) (not e!68639))))

(assert (=> d!32600 (= res!86295 (= (size!2222 (buf!2588 (_1!4568 lt!152968))) (size!2222 (buf!2588 (_2!4566 lt!152821)))))))

(assert (=> d!32600 (= (isPrefixOf!0 (_1!4568 lt!152968) (_2!4566 lt!152821)) e!68639)))

(declare-fun b!104799 () Bool)

(declare-fun res!86294 () Bool)

(assert (=> b!104799 (=> (not res!86294) (not e!68639))))

(assert (=> b!104799 (= res!86294 (bvsle (bitIndex!0 (size!2222 (buf!2588 (_1!4568 lt!152968))) (currentByte!5073 (_1!4568 lt!152968)) (currentBit!5068 (_1!4568 lt!152968))) (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!152821))) (currentByte!5073 (_2!4566 lt!152821)) (currentBit!5068 (_2!4566 lt!152821)))))))

(declare-fun b!104800 () Bool)

(declare-fun e!68638 () Bool)

(assert (=> b!104800 (= e!68639 e!68638)))

(declare-fun res!86296 () Bool)

(assert (=> b!104800 (=> res!86296 e!68638)))

(assert (=> b!104800 (= res!86296 (= (size!2222 (buf!2588 (_1!4568 lt!152968))) #b00000000000000000000000000000000))))

(declare-fun b!104801 () Bool)

(assert (=> b!104801 (= e!68638 (arrayBitRangesEq!0 (buf!2588 (_1!4568 lt!152968)) (buf!2588 (_2!4566 lt!152821)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2222 (buf!2588 (_1!4568 lt!152968))) (currentByte!5073 (_1!4568 lt!152968)) (currentBit!5068 (_1!4568 lt!152968)))))))

(assert (= (and d!32600 res!86295) b!104799))

(assert (= (and b!104799 res!86294) b!104800))

(assert (= (and b!104800 (not res!86296)) b!104801))

(assert (=> b!104799 m!153219))

(assert (=> b!104799 m!152439))

(assert (=> b!104801 m!153219))

(assert (=> b!104801 m!153219))

(declare-fun m!153475 () Bool)

(assert (=> b!104801 m!153475))

(assert (=> b!104329 d!32600))

(declare-fun d!32602 () Bool)

(assert (=> d!32602 (validate_offset_bits!1 ((_ sign_extend 32) (size!2222 (buf!2588 (_2!4566 lt!153463)))) ((_ sign_extend 32) (currentByte!5073 (_2!4566 lt!153449))) ((_ sign_extend 32) (currentBit!5068 (_2!4566 lt!153449))) lt!153440)))

(declare-fun lt!154096 () Unit!6388)

(assert (=> d!32602 (= lt!154096 (choose!9 (_2!4566 lt!153449) (buf!2588 (_2!4566 lt!153463)) lt!153440 (BitStream!3919 (buf!2588 (_2!4566 lt!153463)) (currentByte!5073 (_2!4566 lt!153449)) (currentBit!5068 (_2!4566 lt!153449)))))))

(assert (=> d!32602 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4566 lt!153449) (buf!2588 (_2!4566 lt!153463)) lt!153440) lt!154096)))

(declare-fun bs!7986 () Bool)

(assert (= bs!7986 d!32602))

(assert (=> bs!7986 m!152811))

(declare-fun m!153477 () Bool)

(assert (=> bs!7986 m!153477))

(assert (=> b!104456 d!32602))

(declare-fun d!32604 () Bool)

(declare-fun e!68640 () Bool)

(assert (=> d!32604 e!68640))

(declare-fun res!86298 () Bool)

(assert (=> d!32604 (=> (not res!86298) (not e!68640))))

(declare-fun lt!154101 () (_ BitVec 64))

(declare-fun lt!154099 () (_ BitVec 64))

(declare-fun lt!154100 () (_ BitVec 64))

(assert (=> d!32604 (= res!86298 (= lt!154100 (bvsub lt!154099 lt!154101)))))

(assert (=> d!32604 (or (= (bvand lt!154099 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!154101 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!154099 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!154099 lt!154101) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32604 (= lt!154101 (remainingBits!0 ((_ sign_extend 32) (size!2222 (buf!2588 (_2!4566 lt!153449)))) ((_ sign_extend 32) (currentByte!5073 (_2!4566 lt!153449))) ((_ sign_extend 32) (currentBit!5068 (_2!4566 lt!153449)))))))

(declare-fun lt!154098 () (_ BitVec 64))

(declare-fun lt!154097 () (_ BitVec 64))

(assert (=> d!32604 (= lt!154099 (bvmul lt!154098 lt!154097))))

(assert (=> d!32604 (or (= lt!154098 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!154097 (bvsdiv (bvmul lt!154098 lt!154097) lt!154098)))))

(assert (=> d!32604 (= lt!154097 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!32604 (= lt!154098 ((_ sign_extend 32) (size!2222 (buf!2588 (_2!4566 lt!153449)))))))

(assert (=> d!32604 (= lt!154100 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5073 (_2!4566 lt!153449))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5068 (_2!4566 lt!153449)))))))

(assert (=> d!32604 (invariant!0 (currentBit!5068 (_2!4566 lt!153449)) (currentByte!5073 (_2!4566 lt!153449)) (size!2222 (buf!2588 (_2!4566 lt!153449))))))

(assert (=> d!32604 (= (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!153449))) (currentByte!5073 (_2!4566 lt!153449)) (currentBit!5068 (_2!4566 lt!153449))) lt!154100)))

(declare-fun b!104802 () Bool)

(declare-fun res!86297 () Bool)

(assert (=> b!104802 (=> (not res!86297) (not e!68640))))

(assert (=> b!104802 (= res!86297 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!154100))))

(declare-fun b!104803 () Bool)

(declare-fun lt!154102 () (_ BitVec 64))

(assert (=> b!104803 (= e!68640 (bvsle lt!154100 (bvmul lt!154102 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!104803 (or (= lt!154102 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!154102 #b0000000000000000000000000000000000000000000000000000000000001000) lt!154102)))))

(assert (=> b!104803 (= lt!154102 ((_ sign_extend 32) (size!2222 (buf!2588 (_2!4566 lt!153449)))))))

(assert (= (and d!32604 res!86298) b!104802))

(assert (= (and b!104802 res!86297) b!104803))

(declare-fun m!153479 () Bool)

(assert (=> d!32604 m!153479))

(declare-fun m!153481 () Bool)

(assert (=> d!32604 m!153481))

(assert (=> b!104456 d!32604))

(declare-fun d!32606 () Bool)

(declare-fun e!68641 () Bool)

(assert (=> d!32606 e!68641))

(declare-fun res!86300 () Bool)

(assert (=> d!32606 (=> (not res!86300) (not e!68641))))

(declare-fun lt!154107 () (_ BitVec 64))

(declare-fun lt!154106 () (_ BitVec 64))

(declare-fun lt!154105 () (_ BitVec 64))

(assert (=> d!32606 (= res!86300 (= lt!154106 (bvsub lt!154105 lt!154107)))))

(assert (=> d!32606 (or (= (bvand lt!154105 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!154107 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!154105 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!154105 lt!154107) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32606 (= lt!154107 (remainingBits!0 ((_ sign_extend 32) (size!2222 (buf!2588 (_2!4566 lt!153463)))) ((_ sign_extend 32) (currentByte!5073 (_2!4566 lt!153463))) ((_ sign_extend 32) (currentBit!5068 (_2!4566 lt!153463)))))))

(declare-fun lt!154104 () (_ BitVec 64))

(declare-fun lt!154103 () (_ BitVec 64))

(assert (=> d!32606 (= lt!154105 (bvmul lt!154104 lt!154103))))

(assert (=> d!32606 (or (= lt!154104 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!154103 (bvsdiv (bvmul lt!154104 lt!154103) lt!154104)))))

(assert (=> d!32606 (= lt!154103 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!32606 (= lt!154104 ((_ sign_extend 32) (size!2222 (buf!2588 (_2!4566 lt!153463)))))))

(assert (=> d!32606 (= lt!154106 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5073 (_2!4566 lt!153463))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5068 (_2!4566 lt!153463)))))))

(assert (=> d!32606 (invariant!0 (currentBit!5068 (_2!4566 lt!153463)) (currentByte!5073 (_2!4566 lt!153463)) (size!2222 (buf!2588 (_2!4566 lt!153463))))))

(assert (=> d!32606 (= (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!153463))) (currentByte!5073 (_2!4566 lt!153463)) (currentBit!5068 (_2!4566 lt!153463))) lt!154106)))

(declare-fun b!104804 () Bool)

(declare-fun res!86299 () Bool)

(assert (=> b!104804 (=> (not res!86299) (not e!68641))))

(assert (=> b!104804 (= res!86299 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!154106))))

(declare-fun b!104805 () Bool)

(declare-fun lt!154108 () (_ BitVec 64))

(assert (=> b!104805 (= e!68641 (bvsle lt!154106 (bvmul lt!154108 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!104805 (or (= lt!154108 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!154108 #b0000000000000000000000000000000000000000000000000000000000001000) lt!154108)))))

(assert (=> b!104805 (= lt!154108 ((_ sign_extend 32) (size!2222 (buf!2588 (_2!4566 lt!153463)))))))

(assert (= (and d!32606 res!86300) b!104804))

(assert (= (and b!104804 res!86299) b!104805))

(declare-fun m!153483 () Bool)

(assert (=> d!32606 m!153483))

(declare-fun m!153485 () Bool)

(assert (=> d!32606 m!153485))

(assert (=> b!104456 d!32606))

(declare-fun d!32608 () Bool)

(declare-fun lt!154110 () tuple2!8628)

(declare-fun lt!154113 () tuple2!8628)

(assert (=> d!32608 (and (= (_2!4569 lt!154110) (_2!4569 lt!154113)) (= (_1!4569 lt!154110) (_1!4569 lt!154113)))))

(declare-fun lt!154114 () Unit!6388)

(declare-fun lt!154111 () Bool)

(declare-fun lt!154112 () BitStream!3918)

(declare-fun lt!154109 () (_ BitVec 64))

(assert (=> d!32608 (= lt!154114 (choose!45 (_1!4568 lt!153433) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!153422 lt!154110 (tuple2!8629 (_1!4569 lt!154110) (_2!4569 lt!154110)) (_1!4569 lt!154110) (_2!4569 lt!154110) lt!154111 lt!154112 lt!154109 lt!154113 (tuple2!8629 (_1!4569 lt!154113) (_2!4569 lt!154113)) (_1!4569 lt!154113) (_2!4569 lt!154113)))))

(assert (=> d!32608 (= lt!154113 (readNLeastSignificantBitsLoopPure!0 lt!154112 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) lt!154109))))

(assert (=> d!32608 (= lt!154109 (bvor lt!153422 (ite lt!154111 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32608 (= lt!154112 (withMovedBitIndex!0 (_1!4568 lt!153433) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!32608 (= lt!154111 (_2!4567 (readBitPure!0 (_1!4568 lt!153433))))))

(assert (=> d!32608 (= lt!154110 (readNLeastSignificantBitsLoopPure!0 (_1!4568 lt!153433) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!153422))))

(assert (=> d!32608 (= (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4568 lt!153433) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!153422) lt!154114)))

(declare-fun bs!7987 () Bool)

(assert (= bs!7987 d!32608))

(assert (=> bs!7987 m!152829))

(assert (=> bs!7987 m!152821))

(assert (=> bs!7987 m!152823))

(declare-fun m!153487 () Bool)

(assert (=> bs!7987 m!153487))

(declare-fun m!153489 () Bool)

(assert (=> bs!7987 m!153489))

(assert (=> b!104456 d!32608))

(declare-fun d!32610 () Bool)

(declare-fun res!86302 () Bool)

(declare-fun e!68643 () Bool)

(assert (=> d!32610 (=> (not res!86302) (not e!68643))))

(assert (=> d!32610 (= res!86302 (= (size!2222 (buf!2588 (_2!4566 lt!152821))) (size!2222 (buf!2588 (_2!4566 lt!153463)))))))

(assert (=> d!32610 (= (isPrefixOf!0 (_2!4566 lt!152821) (_2!4566 lt!153463)) e!68643)))

(declare-fun b!104806 () Bool)

(declare-fun res!86301 () Bool)

(assert (=> b!104806 (=> (not res!86301) (not e!68643))))

(assert (=> b!104806 (= res!86301 (bvsle (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!152821))) (currentByte!5073 (_2!4566 lt!152821)) (currentBit!5068 (_2!4566 lt!152821))) (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!153463))) (currentByte!5073 (_2!4566 lt!153463)) (currentBit!5068 (_2!4566 lt!153463)))))))

(declare-fun b!104807 () Bool)

(declare-fun e!68642 () Bool)

(assert (=> b!104807 (= e!68643 e!68642)))

(declare-fun res!86303 () Bool)

(assert (=> b!104807 (=> res!86303 e!68642)))

(assert (=> b!104807 (= res!86303 (= (size!2222 (buf!2588 (_2!4566 lt!152821))) #b00000000000000000000000000000000))))

(declare-fun b!104808 () Bool)

(assert (=> b!104808 (= e!68642 (arrayBitRangesEq!0 (buf!2588 (_2!4566 lt!152821)) (buf!2588 (_2!4566 lt!153463)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!152821))) (currentByte!5073 (_2!4566 lt!152821)) (currentBit!5068 (_2!4566 lt!152821)))))))

(assert (= (and d!32610 res!86302) b!104806))

(assert (= (and b!104806 res!86301) b!104807))

(assert (= (and b!104807 (not res!86303)) b!104808))

(assert (=> b!104806 m!152439))

(assert (=> b!104806 m!152827))

(assert (=> b!104808 m!152439))

(assert (=> b!104808 m!152439))

(declare-fun m!153491 () Bool)

(assert (=> b!104808 m!153491))

(assert (=> b!104456 d!32610))

(declare-fun d!32612 () Bool)

(declare-fun lt!154115 () tuple2!8642)

(assert (=> d!32612 (= lt!154115 (readBit!0 lt!153456))))

(assert (=> d!32612 (= (readBitPure!0 lt!153456) (tuple2!8625 (_2!4576 lt!154115) (_1!4576 lt!154115)))))

(declare-fun bs!7988 () Bool)

(assert (= bs!7988 d!32612))

(declare-fun m!153493 () Bool)

(assert (=> bs!7988 m!153493))

(assert (=> b!104456 d!32612))

(assert (=> b!104456 d!32452))

(declare-fun b!104812 () Bool)

(declare-fun e!68644 () Bool)

(declare-fun lt!154119 () tuple2!8624)

(declare-fun lt!154117 () tuple2!8622)

(assert (=> b!104812 (= e!68644 (= (bitIndex!0 (size!2222 (buf!2588 (_1!4567 lt!154119))) (currentByte!5073 (_1!4567 lt!154119)) (currentBit!5068 (_1!4567 lt!154119))) (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!154117))) (currentByte!5073 (_2!4566 lt!154117)) (currentBit!5068 (_2!4566 lt!154117)))))))

(declare-fun b!104809 () Bool)

(declare-fun res!86307 () Bool)

(declare-fun e!68645 () Bool)

(assert (=> b!104809 (=> (not res!86307) (not e!68645))))

(declare-fun lt!154116 () (_ BitVec 64))

(declare-fun lt!154118 () (_ BitVec 64))

(assert (=> b!104809 (= res!86307 (= (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!154117))) (currentByte!5073 (_2!4566 lt!154117)) (currentBit!5068 (_2!4566 lt!154117))) (bvadd lt!154116 lt!154118)))))

(assert (=> b!104809 (or (not (= (bvand lt!154116 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!154118 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!154116 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!154116 lt!154118) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!104809 (= lt!154118 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!104809 (= lt!154116 (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!152821))) (currentByte!5073 (_2!4566 lt!152821)) (currentBit!5068 (_2!4566 lt!152821))))))

(declare-fun d!32614 () Bool)

(assert (=> d!32614 e!68645))

(declare-fun res!86304 () Bool)

(assert (=> d!32614 (=> (not res!86304) (not e!68645))))

(assert (=> d!32614 (= res!86304 (= (size!2222 (buf!2588 (_2!4566 lt!152821))) (size!2222 (buf!2588 (_2!4566 lt!154117)))))))

(assert (=> d!32614 (= lt!154117 (choose!16 (_2!4566 lt!152821) lt!153431))))

(assert (=> d!32614 (validate_offset_bit!0 ((_ sign_extend 32) (size!2222 (buf!2588 (_2!4566 lt!152821)))) ((_ sign_extend 32) (currentByte!5073 (_2!4566 lt!152821))) ((_ sign_extend 32) (currentBit!5068 (_2!4566 lt!152821))))))

(assert (=> d!32614 (= (appendBit!0 (_2!4566 lt!152821) lt!153431) lt!154117)))

(declare-fun b!104811 () Bool)

(assert (=> b!104811 (= e!68645 e!68644)))

(declare-fun res!86306 () Bool)

(assert (=> b!104811 (=> (not res!86306) (not e!68644))))

(assert (=> b!104811 (= res!86306 (and (= (_2!4567 lt!154119) lt!153431) (= (_1!4567 lt!154119) (_2!4566 lt!154117))))))

(assert (=> b!104811 (= lt!154119 (readBitPure!0 (readerFrom!0 (_2!4566 lt!154117) (currentBit!5068 (_2!4566 lt!152821)) (currentByte!5073 (_2!4566 lt!152821)))))))

(declare-fun b!104810 () Bool)

(declare-fun res!86305 () Bool)

(assert (=> b!104810 (=> (not res!86305) (not e!68645))))

(assert (=> b!104810 (= res!86305 (isPrefixOf!0 (_2!4566 lt!152821) (_2!4566 lt!154117)))))

(assert (= (and d!32614 res!86304) b!104809))

(assert (= (and b!104809 res!86307) b!104810))

(assert (= (and b!104810 res!86305) b!104811))

(assert (= (and b!104811 res!86306) b!104812))

(declare-fun m!153495 () Bool)

(assert (=> b!104811 m!153495))

(assert (=> b!104811 m!153495))

(declare-fun m!153497 () Bool)

(assert (=> b!104811 m!153497))

(declare-fun m!153499 () Bool)

(assert (=> b!104812 m!153499))

(declare-fun m!153501 () Bool)

(assert (=> b!104812 m!153501))

(declare-fun m!153503 () Bool)

(assert (=> d!32614 m!153503))

(declare-fun m!153505 () Bool)

(assert (=> d!32614 m!153505))

(assert (=> b!104809 m!153501))

(assert (=> b!104809 m!152439))

(declare-fun m!153507 () Bool)

(assert (=> b!104810 m!153507))

(assert (=> b!104456 d!32614))

(assert (=> b!104456 d!32494))

(declare-fun b!104813 () Bool)

(declare-fun e!68651 () Bool)

(declare-fun lt!154159 () tuple2!8624)

(declare-fun lt!154136 () tuple2!8624)

(assert (=> b!104813 (= e!68651 (= (_2!4567 lt!154159) (_2!4567 lt!154136)))))

(declare-fun b!104815 () Bool)

(declare-fun e!68647 () tuple2!8622)

(declare-fun lt!154153 () Unit!6388)

(assert (=> b!104815 (= e!68647 (tuple2!8623 lt!154153 (_2!4566 lt!153449)))))

(declare-fun lt!154126 () BitStream!3918)

(assert (=> b!104815 (= lt!154126 (_2!4566 lt!153449))))

(assert (=> b!104815 (= lt!154153 (lemmaIsPrefixRefl!0 lt!154126))))

(declare-fun call!1305 () Bool)

(assert (=> b!104815 call!1305))

(declare-fun b!104816 () Bool)

(declare-fun e!68650 () (_ BitVec 64))

(assert (=> b!104816 (= e!68650 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))))

(declare-fun b!104817 () Bool)

(declare-fun lt!154142 () tuple2!8624)

(declare-fun lt!154127 () tuple2!8622)

(assert (=> b!104817 (= lt!154142 (readBitPure!0 (readerFrom!0 (_2!4566 lt!154127) (currentBit!5068 (_2!4566 lt!153449)) (currentByte!5073 (_2!4566 lt!153449)))))))

(declare-fun lt!154130 () Bool)

(declare-fun res!86312 () Bool)

(assert (=> b!104817 (= res!86312 (and (= (_2!4567 lt!154142) lt!154130) (= (_1!4567 lt!154142) (_2!4566 lt!154127))))))

(declare-fun e!68646 () Bool)

(assert (=> b!104817 (=> (not res!86312) (not e!68646))))

(declare-fun e!68648 () Bool)

(assert (=> b!104817 (= e!68648 e!68646)))

(declare-fun c!6457 () Bool)

(declare-fun bm!1302 () Bool)

(assert (=> bm!1302 (= call!1305 (isPrefixOf!0 (ite c!6457 (_2!4566 lt!153449) lt!154126) (ite c!6457 (_2!4566 lt!154127) lt!154126)))))

(declare-fun b!104818 () Bool)

(declare-fun lt!154162 () tuple2!8622)

(declare-fun Unit!6423 () Unit!6388)

(assert (=> b!104818 (= e!68647 (tuple2!8623 Unit!6423 (_2!4566 lt!154162)))))

(assert (=> b!104818 (= lt!154130 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!104818 (= lt!154127 (appendBit!0 (_2!4566 lt!153449) lt!154130))))

(declare-fun res!86309 () Bool)

(assert (=> b!104818 (= res!86309 (= (size!2222 (buf!2588 (_2!4566 lt!153449))) (size!2222 (buf!2588 (_2!4566 lt!154127)))))))

(assert (=> b!104818 (=> (not res!86309) (not e!68648))))

(assert (=> b!104818 e!68648))

(declare-fun lt!154148 () tuple2!8622)

(assert (=> b!104818 (= lt!154148 lt!154127)))

(assert (=> b!104818 (= lt!154162 (appendNLeastSignificantBitsLoop!0 (_2!4566 lt!154148) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(declare-fun lt!154138 () Unit!6388)

(assert (=> b!104818 (= lt!154138 (lemmaIsPrefixTransitive!0 (_2!4566 lt!153449) (_2!4566 lt!154148) (_2!4566 lt!154162)))))

(assert (=> b!104818 (isPrefixOf!0 (_2!4566 lt!153449) (_2!4566 lt!154162))))

(declare-fun lt!154134 () Unit!6388)

(assert (=> b!104818 (= lt!154134 lt!154138)))

(assert (=> b!104818 (invariant!0 (currentBit!5068 (_2!4566 lt!153449)) (currentByte!5073 (_2!4566 lt!153449)) (size!2222 (buf!2588 (_2!4566 lt!154148))))))

(declare-fun lt!154155 () BitStream!3918)

(assert (=> b!104818 (= lt!154155 (BitStream!3919 (buf!2588 (_2!4566 lt!154148)) (currentByte!5073 (_2!4566 lt!153449)) (currentBit!5068 (_2!4566 lt!153449))))))

(assert (=> b!104818 (invariant!0 (currentBit!5068 lt!154155) (currentByte!5073 lt!154155) (size!2222 (buf!2588 (_2!4566 lt!154162))))))

(declare-fun lt!154152 () BitStream!3918)

(assert (=> b!104818 (= lt!154152 (BitStream!3919 (buf!2588 (_2!4566 lt!154162)) (currentByte!5073 lt!154155) (currentBit!5068 lt!154155)))))

(assert (=> b!104818 (= lt!154159 (readBitPure!0 lt!154155))))

(assert (=> b!104818 (= lt!154136 (readBitPure!0 lt!154152))))

(declare-fun lt!154146 () Unit!6388)

(assert (=> b!104818 (= lt!154146 (readBitPrefixLemma!0 lt!154155 (_2!4566 lt!154162)))))

(declare-fun res!86314 () Bool)

(assert (=> b!104818 (= res!86314 (= (bitIndex!0 (size!2222 (buf!2588 (_1!4567 lt!154159))) (currentByte!5073 (_1!4567 lt!154159)) (currentBit!5068 (_1!4567 lt!154159))) (bitIndex!0 (size!2222 (buf!2588 (_1!4567 lt!154136))) (currentByte!5073 (_1!4567 lt!154136)) (currentBit!5068 (_1!4567 lt!154136)))))))

(assert (=> b!104818 (=> (not res!86314) (not e!68651))))

(assert (=> b!104818 e!68651))

(declare-fun lt!154123 () Unit!6388)

(assert (=> b!104818 (= lt!154123 lt!154146)))

(declare-fun lt!154132 () tuple2!8626)

(assert (=> b!104818 (= lt!154132 (reader!0 (_2!4566 lt!153449) (_2!4566 lt!154162)))))

(declare-fun lt!154164 () tuple2!8626)

(assert (=> b!104818 (= lt!154164 (reader!0 (_2!4566 lt!154148) (_2!4566 lt!154162)))))

(declare-fun lt!154131 () tuple2!8624)

(assert (=> b!104818 (= lt!154131 (readBitPure!0 (_1!4568 lt!154132)))))

(assert (=> b!104818 (= (_2!4567 lt!154131) lt!154130)))

(declare-fun lt!154129 () Unit!6388)

(declare-fun Unit!6424 () Unit!6388)

(assert (=> b!104818 (= lt!154129 Unit!6424)))

(declare-fun lt!154125 () (_ BitVec 64))

(assert (=> b!104818 (= lt!154125 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001))))))))

(declare-fun lt!154124 () (_ BitVec 64))

(assert (=> b!104818 (= lt!154124 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001))))))

(declare-fun lt!154154 () Unit!6388)

(assert (=> b!104818 (= lt!154154 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4566 lt!153449) (buf!2588 (_2!4566 lt!154162)) lt!154124))))

(assert (=> b!104818 (validate_offset_bits!1 ((_ sign_extend 32) (size!2222 (buf!2588 (_2!4566 lt!154162)))) ((_ sign_extend 32) (currentByte!5073 (_2!4566 lt!153449))) ((_ sign_extend 32) (currentBit!5068 (_2!4566 lt!153449))) lt!154124)))

(declare-fun lt!154147 () Unit!6388)

(assert (=> b!104818 (= lt!154147 lt!154154)))

(declare-fun lt!154144 () tuple2!8628)

(assert (=> b!104818 (= lt!154144 (readNLeastSignificantBitsLoopPure!0 (_1!4568 lt!154132) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) lt!154125))))

(declare-fun lt!154139 () (_ BitVec 64))

(assert (=> b!104818 (= lt!154139 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))))

(declare-fun lt!154137 () Unit!6388)

(assert (=> b!104818 (= lt!154137 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4566 lt!154148) (buf!2588 (_2!4566 lt!154162)) lt!154139))))

(assert (=> b!104818 (validate_offset_bits!1 ((_ sign_extend 32) (size!2222 (buf!2588 (_2!4566 lt!154162)))) ((_ sign_extend 32) (currentByte!5073 (_2!4566 lt!154148))) ((_ sign_extend 32) (currentBit!5068 (_2!4566 lt!154148))) lt!154139)))

(declare-fun lt!154141 () Unit!6388)

(assert (=> b!104818 (= lt!154141 lt!154137)))

(declare-fun lt!154151 () tuple2!8628)

(assert (=> b!104818 (= lt!154151 (readNLeastSignificantBitsLoopPure!0 (_1!4568 lt!154164) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvor lt!154125 (ite (_2!4567 lt!154131) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!154143 () tuple2!8628)

(assert (=> b!104818 (= lt!154143 (readNLeastSignificantBitsLoopPure!0 (_1!4568 lt!154132) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) lt!154125))))

(declare-fun c!6458 () Bool)

(assert (=> b!104818 (= c!6458 (_2!4567 (readBitPure!0 (_1!4568 lt!154132))))))

(declare-fun lt!154161 () tuple2!8628)

(assert (=> b!104818 (= lt!154161 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4568 lt!154132) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvor lt!154125 e!68650)))))

(declare-fun lt!154135 () Unit!6388)

(assert (=> b!104818 (= lt!154135 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4568 lt!154132) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) lt!154125))))

(assert (=> b!104818 (and (= (_2!4569 lt!154143) (_2!4569 lt!154161)) (= (_1!4569 lt!154143) (_1!4569 lt!154161)))))

(declare-fun lt!154149 () Unit!6388)

(assert (=> b!104818 (= lt!154149 lt!154135)))

(assert (=> b!104818 (= (_1!4568 lt!154132) (withMovedBitIndex!0 (_2!4568 lt!154132) (bvsub (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!153449))) (currentByte!5073 (_2!4566 lt!153449)) (currentBit!5068 (_2!4566 lt!153449))) (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!154162))) (currentByte!5073 (_2!4566 lt!154162)) (currentBit!5068 (_2!4566 lt!154162))))))))

(declare-fun lt!154160 () Unit!6388)

(declare-fun Unit!6425 () Unit!6388)

(assert (=> b!104818 (= lt!154160 Unit!6425)))

(assert (=> b!104818 (= (_1!4568 lt!154164) (withMovedBitIndex!0 (_2!4568 lt!154164) (bvsub (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!154148))) (currentByte!5073 (_2!4566 lt!154148)) (currentBit!5068 (_2!4566 lt!154148))) (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!154162))) (currentByte!5073 (_2!4566 lt!154162)) (currentBit!5068 (_2!4566 lt!154162))))))))

(declare-fun lt!154140 () Unit!6388)

(declare-fun Unit!6426 () Unit!6388)

(assert (=> b!104818 (= lt!154140 Unit!6426)))

(assert (=> b!104818 (= (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!153449))) (currentByte!5073 (_2!4566 lt!153449)) (currentBit!5068 (_2!4566 lt!153449))) (bvsub (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!154148))) (currentByte!5073 (_2!4566 lt!154148)) (currentBit!5068 (_2!4566 lt!154148))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!154158 () Unit!6388)

(declare-fun Unit!6427 () Unit!6388)

(assert (=> b!104818 (= lt!154158 Unit!6427)))

(assert (=> b!104818 (= (_2!4569 lt!154144) (_2!4569 lt!154151))))

(declare-fun lt!154163 () Unit!6388)

(declare-fun Unit!6428 () Unit!6388)

(assert (=> b!104818 (= lt!154163 Unit!6428)))

(assert (=> b!104818 (= (_1!4569 lt!154144) (_2!4568 lt!154132))))

(declare-fun b!104819 () Bool)

(assert (=> b!104819 (= e!68646 (= (bitIndex!0 (size!2222 (buf!2588 (_1!4567 lt!154142))) (currentByte!5073 (_1!4567 lt!154142)) (currentBit!5068 (_1!4567 lt!154142))) (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!154127))) (currentByte!5073 (_2!4566 lt!154127)) (currentBit!5068 (_2!4566 lt!154127)))))))

(declare-fun d!32616 () Bool)

(declare-fun e!68652 () Bool)

(assert (=> d!32616 e!68652))

(declare-fun res!86316 () Bool)

(assert (=> d!32616 (=> (not res!86316) (not e!68652))))

(declare-fun lt!154150 () tuple2!8622)

(assert (=> d!32616 (= res!86316 (= (size!2222 (buf!2588 (_2!4566 lt!153449))) (size!2222 (buf!2588 (_2!4566 lt!154150)))))))

(assert (=> d!32616 (= lt!154150 e!68647)))

(assert (=> d!32616 (= c!6457 (bvslt (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) nBits!396))))

(assert (=> d!32616 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)) (bvsle (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!32616 (= (appendNLeastSignificantBitsLoop!0 (_2!4566 lt!153449) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)) lt!154150)))

(declare-fun b!104814 () Bool)

(declare-fun res!86313 () Bool)

(assert (=> b!104814 (= res!86313 (= (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!154127))) (currentByte!5073 (_2!4566 lt!154127)) (currentBit!5068 (_2!4566 lt!154127))) (bvadd (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!153449))) (currentByte!5073 (_2!4566 lt!153449)) (currentBit!5068 (_2!4566 lt!153449))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!104814 (=> (not res!86313) (not e!68648))))

(declare-fun b!104820 () Bool)

(declare-fun res!86310 () Bool)

(assert (=> b!104820 (=> (not res!86310) (not e!68652))))

(assert (=> b!104820 (= res!86310 (isPrefixOf!0 (_2!4566 lt!153449) (_2!4566 lt!154150)))))

(declare-fun b!104821 () Bool)

(assert (=> b!104821 (= e!68650 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!104822 () Bool)

(declare-fun res!86315 () Bool)

(assert (=> b!104822 (=> (not res!86315) (not e!68652))))

(declare-fun lt!154120 () (_ BitVec 64))

(declare-fun lt!154122 () (_ BitVec 64))

(assert (=> b!104822 (= res!86315 (= (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!154150))) (currentByte!5073 (_2!4566 lt!154150)) (currentBit!5068 (_2!4566 lt!154150))) (bvadd lt!154120 lt!154122)))))

(assert (=> b!104822 (or (not (= (bvand lt!154120 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!154122 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!154120 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!154120 lt!154122) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!104822 (= lt!154122 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001))))))

(assert (=> b!104822 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!104822 (= lt!154120 (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!153449))) (currentByte!5073 (_2!4566 lt!153449)) (currentBit!5068 (_2!4566 lt!153449))))))

(declare-fun b!104823 () Bool)

(declare-fun e!68649 () Bool)

(declare-fun lt!154156 () (_ BitVec 64))

(assert (=> b!104823 (= e!68649 (validate_offset_bits!1 ((_ sign_extend 32) (size!2222 (buf!2588 (_2!4566 lt!153449)))) ((_ sign_extend 32) (currentByte!5073 (_2!4566 lt!153449))) ((_ sign_extend 32) (currentBit!5068 (_2!4566 lt!153449))) lt!154156))))

(declare-fun b!104824 () Bool)

(declare-fun res!86311 () Bool)

(assert (=> b!104824 (= res!86311 call!1305)))

(assert (=> b!104824 (=> (not res!86311) (not e!68648))))

(declare-fun lt!154145 () tuple2!8626)

(declare-fun lt!154128 () tuple2!8628)

(declare-fun b!104825 () Bool)

(assert (=> b!104825 (= e!68652 (and (= (_2!4569 lt!154128) v!199) (= (_1!4569 lt!154128) (_2!4568 lt!154145))))))

(declare-fun lt!154133 () (_ BitVec 64))

(assert (=> b!104825 (= lt!154128 (readNLeastSignificantBitsLoopPure!0 (_1!4568 lt!154145) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) lt!154133))))

(declare-fun lt!154157 () Unit!6388)

(declare-fun lt!154121 () Unit!6388)

(assert (=> b!104825 (= lt!154157 lt!154121)))

(assert (=> b!104825 (validate_offset_bits!1 ((_ sign_extend 32) (size!2222 (buf!2588 (_2!4566 lt!154150)))) ((_ sign_extend 32) (currentByte!5073 (_2!4566 lt!153449))) ((_ sign_extend 32) (currentBit!5068 (_2!4566 lt!153449))) lt!154156)))

(assert (=> b!104825 (= lt!154121 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4566 lt!153449) (buf!2588 (_2!4566 lt!154150)) lt!154156))))

(assert (=> b!104825 e!68649))

(declare-fun res!86308 () Bool)

(assert (=> b!104825 (=> (not res!86308) (not e!68649))))

(assert (=> b!104825 (= res!86308 (and (= (size!2222 (buf!2588 (_2!4566 lt!153449))) (size!2222 (buf!2588 (_2!4566 lt!154150)))) (bvsge lt!154156 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!104825 (= lt!154156 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001))))))

(assert (=> b!104825 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!104825 (= lt!154133 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001))))))))

(assert (=> b!104825 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!104825 (= lt!154145 (reader!0 (_2!4566 lt!153449) (_2!4566 lt!154150)))))

(assert (= (and d!32616 c!6457) b!104818))

(assert (= (and d!32616 (not c!6457)) b!104815))

(assert (= (and b!104818 res!86309) b!104814))

(assert (= (and b!104814 res!86313) b!104824))

(assert (= (and b!104824 res!86311) b!104817))

(assert (= (and b!104817 res!86312) b!104819))

(assert (= (and b!104818 res!86314) b!104813))

(assert (= (and b!104818 c!6458) b!104816))

(assert (= (and b!104818 (not c!6458)) b!104821))

(assert (= (or b!104824 b!104815) bm!1302))

(assert (= (and d!32616 res!86316) b!104822))

(assert (= (and b!104822 res!86315) b!104820))

(assert (= (and b!104820 res!86310) b!104825))

(assert (= (and b!104825 res!86308) b!104823))

(declare-fun m!153509 () Bool)

(assert (=> bm!1302 m!153509))

(declare-fun m!153511 () Bool)

(assert (=> b!104822 m!153511))

(assert (=> b!104822 m!152819))

(declare-fun m!153513 () Bool)

(assert (=> b!104819 m!153513))

(declare-fun m!153515 () Bool)

(assert (=> b!104819 m!153515))

(assert (=> b!104814 m!153515))

(assert (=> b!104814 m!152819))

(declare-fun m!153517 () Bool)

(assert (=> b!104820 m!153517))

(declare-fun m!153519 () Bool)

(assert (=> b!104815 m!153519))

(declare-fun m!153521 () Bool)

(assert (=> b!104823 m!153521))

(declare-fun m!153523 () Bool)

(assert (=> b!104818 m!153523))

(declare-fun m!153525 () Bool)

(assert (=> b!104818 m!153525))

(declare-fun m!153527 () Bool)

(assert (=> b!104818 m!153527))

(declare-fun m!153529 () Bool)

(assert (=> b!104818 m!153529))

(declare-fun m!153531 () Bool)

(assert (=> b!104818 m!153531))

(declare-fun m!153533 () Bool)

(assert (=> b!104818 m!153533))

(declare-fun m!153535 () Bool)

(assert (=> b!104818 m!153535))

(declare-fun m!153537 () Bool)

(assert (=> b!104818 m!153537))

(declare-fun m!153539 () Bool)

(assert (=> b!104818 m!153539))

(declare-fun m!153541 () Bool)

(assert (=> b!104818 m!153541))

(declare-fun m!153543 () Bool)

(assert (=> b!104818 m!153543))

(declare-fun m!153545 () Bool)

(assert (=> b!104818 m!153545))

(declare-fun m!153547 () Bool)

(assert (=> b!104818 m!153547))

(declare-fun m!153549 () Bool)

(assert (=> b!104818 m!153549))

(declare-fun m!153551 () Bool)

(assert (=> b!104818 m!153551))

(declare-fun m!153553 () Bool)

(assert (=> b!104818 m!153553))

(declare-fun m!153555 () Bool)

(assert (=> b!104818 m!153555))

(declare-fun m!153557 () Bool)

(assert (=> b!104818 m!153557))

(assert (=> b!104818 m!153551))

(declare-fun m!153559 () Bool)

(assert (=> b!104818 m!153559))

(declare-fun m!153561 () Bool)

(assert (=> b!104818 m!153561))

(declare-fun m!153563 () Bool)

(assert (=> b!104818 m!153563))

(declare-fun m!153565 () Bool)

(assert (=> b!104818 m!153565))

(assert (=> b!104818 m!152819))

(declare-fun m!153567 () Bool)

(assert (=> b!104818 m!153567))

(declare-fun m!153569 () Bool)

(assert (=> b!104818 m!153569))

(declare-fun m!153571 () Bool)

(assert (=> b!104818 m!153571))

(declare-fun m!153573 () Bool)

(assert (=> b!104818 m!153573))

(declare-fun m!153575 () Bool)

(assert (=> b!104818 m!153575))

(declare-fun m!153577 () Bool)

(assert (=> b!104818 m!153577))

(declare-fun m!153579 () Bool)

(assert (=> b!104825 m!153579))

(declare-fun m!153581 () Bool)

(assert (=> b!104825 m!153581))

(declare-fun m!153583 () Bool)

(assert (=> b!104825 m!153583))

(declare-fun m!153585 () Bool)

(assert (=> b!104825 m!153585))

(assert (=> b!104825 m!153537))

(declare-fun m!153587 () Bool)

(assert (=> b!104817 m!153587))

(assert (=> b!104817 m!153587))

(declare-fun m!153589 () Bool)

(assert (=> b!104817 m!153589))

(assert (=> b!104456 d!32616))

(declare-fun d!32618 () Bool)

(assert (=> d!32618 (isPrefixOf!0 (_2!4566 lt!152821) (_2!4566 lt!153463))))

(declare-fun lt!154165 () Unit!6388)

(assert (=> d!32618 (= lt!154165 (choose!30 (_2!4566 lt!152821) (_2!4566 lt!153449) (_2!4566 lt!153463)))))

(assert (=> d!32618 (isPrefixOf!0 (_2!4566 lt!152821) (_2!4566 lt!153449))))

(assert (=> d!32618 (= (lemmaIsPrefixTransitive!0 (_2!4566 lt!152821) (_2!4566 lt!153449) (_2!4566 lt!153463)) lt!154165)))

(declare-fun bs!7989 () Bool)

(assert (= bs!7989 d!32618))

(assert (=> bs!7989 m!152803))

(declare-fun m!153591 () Bool)

(assert (=> bs!7989 m!153591))

(declare-fun m!153593 () Bool)

(assert (=> bs!7989 m!153593))

(assert (=> b!104456 d!32618))

(declare-fun d!32620 () Bool)

(declare-fun e!68653 () Bool)

(assert (=> d!32620 e!68653))

(declare-fun res!86317 () Bool)

(assert (=> d!32620 (=> (not res!86317) (not e!68653))))

(declare-fun lt!154167 () (_ BitVec 64))

(declare-fun lt!154166 () BitStream!3918)

(assert (=> d!32620 (= res!86317 (= (bvadd lt!154167 (bvsub (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!152821))) (currentByte!5073 (_2!4566 lt!152821)) (currentBit!5068 (_2!4566 lt!152821))) (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!153463))) (currentByte!5073 (_2!4566 lt!153463)) (currentBit!5068 (_2!4566 lt!153463))))) (bitIndex!0 (size!2222 (buf!2588 lt!154166)) (currentByte!5073 lt!154166) (currentBit!5068 lt!154166))))))

(assert (=> d!32620 (or (not (= (bvand lt!154167 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!152821))) (currentByte!5073 (_2!4566 lt!152821)) (currentBit!5068 (_2!4566 lt!152821))) (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!153463))) (currentByte!5073 (_2!4566 lt!153463)) (currentBit!5068 (_2!4566 lt!153463)))) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!154167 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!154167 (bvsub (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!152821))) (currentByte!5073 (_2!4566 lt!152821)) (currentBit!5068 (_2!4566 lt!152821))) (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!153463))) (currentByte!5073 (_2!4566 lt!153463)) (currentBit!5068 (_2!4566 lt!153463))))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32620 (= lt!154167 (bitIndex!0 (size!2222 (buf!2588 (_2!4568 lt!153433))) (currentByte!5073 (_2!4568 lt!153433)) (currentBit!5068 (_2!4568 lt!153433))))))

(assert (=> d!32620 (= lt!154166 (_2!4566 (moveBitIndex!0 (_2!4568 lt!153433) (bvsub (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!152821))) (currentByte!5073 (_2!4566 lt!152821)) (currentBit!5068 (_2!4566 lt!152821))) (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!153463))) (currentByte!5073 (_2!4566 lt!153463)) (currentBit!5068 (_2!4566 lt!153463)))))))))

(assert (=> d!32620 (moveBitIndexPrecond!0 (_2!4568 lt!153433) (bvsub (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!152821))) (currentByte!5073 (_2!4566 lt!152821)) (currentBit!5068 (_2!4566 lt!152821))) (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!153463))) (currentByte!5073 (_2!4566 lt!153463)) (currentBit!5068 (_2!4566 lt!153463)))))))

(assert (=> d!32620 (= (withMovedBitIndex!0 (_2!4568 lt!153433) (bvsub (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!152821))) (currentByte!5073 (_2!4566 lt!152821)) (currentBit!5068 (_2!4566 lt!152821))) (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!153463))) (currentByte!5073 (_2!4566 lt!153463)) (currentBit!5068 (_2!4566 lt!153463))))) lt!154166)))

(declare-fun b!104826 () Bool)

(assert (=> b!104826 (= e!68653 (= (size!2222 (buf!2588 (_2!4568 lt!153433))) (size!2222 (buf!2588 lt!154166))))))

(assert (= (and d!32620 res!86317) b!104826))

(declare-fun m!153595 () Bool)

(assert (=> d!32620 m!153595))

(declare-fun m!153597 () Bool)

(assert (=> d!32620 m!153597))

(declare-fun m!153599 () Bool)

(assert (=> d!32620 m!153599))

(declare-fun m!153601 () Bool)

(assert (=> d!32620 m!153601))

(assert (=> b!104456 d!32620))

(declare-fun d!32622 () Bool)

(declare-fun e!68654 () Bool)

(assert (=> d!32622 e!68654))

(declare-fun res!86319 () Bool)

(assert (=> d!32622 (=> (not res!86319) (not e!68654))))

(declare-fun lt!154172 () (_ BitVec 64))

(declare-fun lt!154171 () (_ BitVec 64))

(declare-fun lt!154170 () (_ BitVec 64))

(assert (=> d!32622 (= res!86319 (= lt!154171 (bvsub lt!154170 lt!154172)))))

(assert (=> d!32622 (or (= (bvand lt!154170 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!154172 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!154170 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!154170 lt!154172) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32622 (= lt!154172 (remainingBits!0 ((_ sign_extend 32) (size!2222 (buf!2588 (_1!4567 lt!153437)))) ((_ sign_extend 32) (currentByte!5073 (_1!4567 lt!153437))) ((_ sign_extend 32) (currentBit!5068 (_1!4567 lt!153437)))))))

(declare-fun lt!154169 () (_ BitVec 64))

(declare-fun lt!154168 () (_ BitVec 64))

(assert (=> d!32622 (= lt!154170 (bvmul lt!154169 lt!154168))))

(assert (=> d!32622 (or (= lt!154169 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!154168 (bvsdiv (bvmul lt!154169 lt!154168) lt!154169)))))

(assert (=> d!32622 (= lt!154168 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!32622 (= lt!154169 ((_ sign_extend 32) (size!2222 (buf!2588 (_1!4567 lt!153437)))))))

(assert (=> d!32622 (= lt!154171 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5073 (_1!4567 lt!153437))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5068 (_1!4567 lt!153437)))))))

(assert (=> d!32622 (invariant!0 (currentBit!5068 (_1!4567 lt!153437)) (currentByte!5073 (_1!4567 lt!153437)) (size!2222 (buf!2588 (_1!4567 lt!153437))))))

(assert (=> d!32622 (= (bitIndex!0 (size!2222 (buf!2588 (_1!4567 lt!153437))) (currentByte!5073 (_1!4567 lt!153437)) (currentBit!5068 (_1!4567 lt!153437))) lt!154171)))

(declare-fun b!104827 () Bool)

(declare-fun res!86318 () Bool)

(assert (=> b!104827 (=> (not res!86318) (not e!68654))))

(assert (=> b!104827 (= res!86318 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!154171))))

(declare-fun b!104828 () Bool)

(declare-fun lt!154173 () (_ BitVec 64))

(assert (=> b!104828 (= e!68654 (bvsle lt!154171 (bvmul lt!154173 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!104828 (or (= lt!154173 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!154173 #b0000000000000000000000000000000000000000000000000000000000001000) lt!154173)))))

(assert (=> b!104828 (= lt!154173 ((_ sign_extend 32) (size!2222 (buf!2588 (_1!4567 lt!153437)))))))

(assert (= (and d!32622 res!86319) b!104827))

(assert (= (and b!104827 res!86318) b!104828))

(declare-fun m!153603 () Bool)

(assert (=> d!32622 m!153603))

(declare-fun m!153605 () Bool)

(assert (=> d!32622 m!153605))

(assert (=> b!104456 d!32622))

(declare-fun d!32624 () Bool)

(assert (=> d!32624 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2222 (buf!2588 (_2!4566 lt!153463)))) ((_ sign_extend 32) (currentByte!5073 (_2!4566 lt!153449))) ((_ sign_extend 32) (currentBit!5068 (_2!4566 lt!153449))) lt!153440) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2222 (buf!2588 (_2!4566 lt!153463)))) ((_ sign_extend 32) (currentByte!5073 (_2!4566 lt!153449))) ((_ sign_extend 32) (currentBit!5068 (_2!4566 lt!153449)))) lt!153440))))

(declare-fun bs!7990 () Bool)

(assert (= bs!7990 d!32624))

(declare-fun m!153607 () Bool)

(assert (=> bs!7990 m!153607))

(assert (=> b!104456 d!32624))

(declare-fun d!32626 () Bool)

(declare-fun lt!154174 () tuple2!8644)

(assert (=> d!32626 (= lt!154174 (readNLeastSignificantBitsLoop!0 (withMovedBitIndex!0 (_1!4568 lt!153433) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!153422 e!68425)))))

(assert (=> d!32626 (= (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4568 lt!153433) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!153422 e!68425)) (tuple2!8629 (_2!4577 lt!154174) (_1!4577 lt!154174)))))

(declare-fun bs!7991 () Bool)

(assert (= bs!7991 d!32626))

(assert (=> bs!7991 m!152829))

(declare-fun m!153609 () Bool)

(assert (=> bs!7991 m!153609))

(assert (=> b!104456 d!32626))

(declare-fun d!32628 () Bool)

(assert (=> d!32628 (validate_offset_bits!1 ((_ sign_extend 32) (size!2222 (buf!2588 (_2!4566 lt!153463)))) ((_ sign_extend 32) (currentByte!5073 (_2!4566 lt!152821))) ((_ sign_extend 32) (currentBit!5068 (_2!4566 lt!152821))) lt!153421)))

(declare-fun lt!154175 () Unit!6388)

(assert (=> d!32628 (= lt!154175 (choose!9 (_2!4566 lt!152821) (buf!2588 (_2!4566 lt!153463)) lt!153421 (BitStream!3919 (buf!2588 (_2!4566 lt!153463)) (currentByte!5073 (_2!4566 lt!152821)) (currentBit!5068 (_2!4566 lt!152821)))))))

(assert (=> d!32628 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4566 lt!152821) (buf!2588 (_2!4566 lt!153463)) lt!153421) lt!154175)))

(declare-fun bs!7992 () Bool)

(assert (= bs!7992 d!32628))

(assert (=> bs!7992 m!152807))

(declare-fun m!153611 () Bool)

(assert (=> bs!7992 m!153611))

(assert (=> b!104456 d!32628))

(declare-fun d!32630 () Bool)

(declare-fun e!68655 () Bool)

(assert (=> d!32630 e!68655))

(declare-fun res!86320 () Bool)

(assert (=> d!32630 (=> (not res!86320) (not e!68655))))

(declare-fun lt!154177 () (_ BitVec 64))

(declare-fun lt!154176 () BitStream!3918)

(assert (=> d!32630 (= res!86320 (= (bvadd lt!154177 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!2222 (buf!2588 lt!154176)) (currentByte!5073 lt!154176) (currentBit!5068 lt!154176))))))

(assert (=> d!32630 (or (not (= (bvand lt!154177 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!154177 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!154177 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32630 (= lt!154177 (bitIndex!0 (size!2222 (buf!2588 (_1!4568 lt!153433))) (currentByte!5073 (_1!4568 lt!153433)) (currentBit!5068 (_1!4568 lt!153433))))))

(assert (=> d!32630 (= lt!154176 (_2!4566 (moveBitIndex!0 (_1!4568 lt!153433) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!32630 (moveBitIndexPrecond!0 (_1!4568 lt!153433) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!32630 (= (withMovedBitIndex!0 (_1!4568 lt!153433) #b0000000000000000000000000000000000000000000000000000000000000001) lt!154176)))

(declare-fun b!104829 () Bool)

(assert (=> b!104829 (= e!68655 (= (size!2222 (buf!2588 (_1!4568 lt!153433))) (size!2222 (buf!2588 lt!154176))))))

(assert (= (and d!32630 res!86320) b!104829))

(declare-fun m!153613 () Bool)

(assert (=> d!32630 m!153613))

(declare-fun m!153615 () Bool)

(assert (=> d!32630 m!153615))

(declare-fun m!153617 () Bool)

(assert (=> d!32630 m!153617))

(declare-fun m!153619 () Bool)

(assert (=> d!32630 m!153619))

(assert (=> b!104456 d!32630))

(declare-fun d!32632 () Bool)

(declare-fun e!68656 () Bool)

(assert (=> d!32632 e!68656))

(declare-fun res!86321 () Bool)

(assert (=> d!32632 (=> (not res!86321) (not e!68656))))

(declare-fun lt!154178 () BitStream!3918)

(declare-fun lt!154179 () (_ BitVec 64))

(assert (=> d!32632 (= res!86321 (= (bvadd lt!154179 (bvsub (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!153449))) (currentByte!5073 (_2!4566 lt!153449)) (currentBit!5068 (_2!4566 lt!153449))) (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!153463))) (currentByte!5073 (_2!4566 lt!153463)) (currentBit!5068 (_2!4566 lt!153463))))) (bitIndex!0 (size!2222 (buf!2588 lt!154178)) (currentByte!5073 lt!154178) (currentBit!5068 lt!154178))))))

(assert (=> d!32632 (or (not (= (bvand lt!154179 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!153449))) (currentByte!5073 (_2!4566 lt!153449)) (currentBit!5068 (_2!4566 lt!153449))) (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!153463))) (currentByte!5073 (_2!4566 lt!153463)) (currentBit!5068 (_2!4566 lt!153463)))) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!154179 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!154179 (bvsub (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!153449))) (currentByte!5073 (_2!4566 lt!153449)) (currentBit!5068 (_2!4566 lt!153449))) (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!153463))) (currentByte!5073 (_2!4566 lt!153463)) (currentBit!5068 (_2!4566 lt!153463))))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32632 (= lt!154179 (bitIndex!0 (size!2222 (buf!2588 (_2!4568 lt!153465))) (currentByte!5073 (_2!4568 lt!153465)) (currentBit!5068 (_2!4568 lt!153465))))))

(assert (=> d!32632 (= lt!154178 (_2!4566 (moveBitIndex!0 (_2!4568 lt!153465) (bvsub (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!153449))) (currentByte!5073 (_2!4566 lt!153449)) (currentBit!5068 (_2!4566 lt!153449))) (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!153463))) (currentByte!5073 (_2!4566 lt!153463)) (currentBit!5068 (_2!4566 lt!153463)))))))))

(assert (=> d!32632 (moveBitIndexPrecond!0 (_2!4568 lt!153465) (bvsub (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!153449))) (currentByte!5073 (_2!4566 lt!153449)) (currentBit!5068 (_2!4566 lt!153449))) (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!153463))) (currentByte!5073 (_2!4566 lt!153463)) (currentBit!5068 (_2!4566 lt!153463)))))))

(assert (=> d!32632 (= (withMovedBitIndex!0 (_2!4568 lt!153465) (bvsub (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!153449))) (currentByte!5073 (_2!4566 lt!153449)) (currentBit!5068 (_2!4566 lt!153449))) (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!153463))) (currentByte!5073 (_2!4566 lt!153463)) (currentBit!5068 (_2!4566 lt!153463))))) lt!154178)))

(declare-fun b!104830 () Bool)

(assert (=> b!104830 (= e!68656 (= (size!2222 (buf!2588 (_2!4568 lt!153465))) (size!2222 (buf!2588 lt!154178))))))

(assert (= (and d!32632 res!86321) b!104830))

(declare-fun m!153621 () Bool)

(assert (=> d!32632 m!153621))

(declare-fun m!153623 () Bool)

(assert (=> d!32632 m!153623))

(declare-fun m!153625 () Bool)

(assert (=> d!32632 m!153625))

(declare-fun m!153627 () Bool)

(assert (=> d!32632 m!153627))

(assert (=> b!104456 d!32632))

(declare-fun d!32634 () Bool)

(assert (=> d!32634 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2222 (buf!2588 (_2!4566 lt!153463)))) ((_ sign_extend 32) (currentByte!5073 (_2!4566 lt!152821))) ((_ sign_extend 32) (currentBit!5068 (_2!4566 lt!152821))) lt!153421) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2222 (buf!2588 (_2!4566 lt!153463)))) ((_ sign_extend 32) (currentByte!5073 (_2!4566 lt!152821))) ((_ sign_extend 32) (currentBit!5068 (_2!4566 lt!152821)))) lt!153421))))

(declare-fun bs!7993 () Bool)

(assert (= bs!7993 d!32634))

(declare-fun m!153629 () Bool)

(assert (=> bs!7993 m!153629))

(assert (=> b!104456 d!32634))

(declare-fun d!32636 () Bool)

(declare-fun e!68657 () Bool)

(assert (=> d!32636 e!68657))

(declare-fun res!86322 () Bool)

(assert (=> d!32636 (=> (not res!86322) (not e!68657))))

(declare-fun lt!154183 () tuple2!8624)

(declare-fun lt!154181 () tuple2!8624)

(assert (=> d!32636 (= res!86322 (= (bitIndex!0 (size!2222 (buf!2588 (_1!4567 lt!154183))) (currentByte!5073 (_1!4567 lt!154183)) (currentBit!5068 (_1!4567 lt!154183))) (bitIndex!0 (size!2222 (buf!2588 (_1!4567 lt!154181))) (currentByte!5073 (_1!4567 lt!154181)) (currentBit!5068 (_1!4567 lt!154181)))))))

(declare-fun lt!154182 () Unit!6388)

(declare-fun lt!154180 () BitStream!3918)

(assert (=> d!32636 (= lt!154182 (choose!50 lt!153456 (_2!4566 lt!153463) lt!154180 lt!154183 (tuple2!8625 (_1!4567 lt!154183) (_2!4567 lt!154183)) (_1!4567 lt!154183) (_2!4567 lt!154183) lt!154181 (tuple2!8625 (_1!4567 lt!154181) (_2!4567 lt!154181)) (_1!4567 lt!154181) (_2!4567 lt!154181)))))

(assert (=> d!32636 (= lt!154181 (readBitPure!0 lt!154180))))

(assert (=> d!32636 (= lt!154183 (readBitPure!0 lt!153456))))

(assert (=> d!32636 (= lt!154180 (BitStream!3919 (buf!2588 (_2!4566 lt!153463)) (currentByte!5073 lt!153456) (currentBit!5068 lt!153456)))))

(assert (=> d!32636 (invariant!0 (currentBit!5068 lt!153456) (currentByte!5073 lt!153456) (size!2222 (buf!2588 (_2!4566 lt!153463))))))

(assert (=> d!32636 (= (readBitPrefixLemma!0 lt!153456 (_2!4566 lt!153463)) lt!154182)))

(declare-fun b!104831 () Bool)

(assert (=> b!104831 (= e!68657 (= (_2!4567 lt!154183) (_2!4567 lt!154181)))))

(assert (= (and d!32636 res!86322) b!104831))

(assert (=> d!32636 m!152813))

(declare-fun m!153631 () Bool)

(assert (=> d!32636 m!153631))

(declare-fun m!153633 () Bool)

(assert (=> d!32636 m!153633))

(assert (=> d!32636 m!152841))

(declare-fun m!153635 () Bool)

(assert (=> d!32636 m!153635))

(declare-fun m!153637 () Bool)

(assert (=> d!32636 m!153637))

(assert (=> b!104456 d!32636))

(declare-fun d!32638 () Bool)

(declare-fun e!68658 () Bool)

(assert (=> d!32638 e!68658))

(declare-fun res!86324 () Bool)

(assert (=> d!32638 (=> (not res!86324) (not e!68658))))

(declare-fun lt!154188 () (_ BitVec 64))

(declare-fun lt!154187 () (_ BitVec 64))

(declare-fun lt!154186 () (_ BitVec 64))

(assert (=> d!32638 (= res!86324 (= lt!154187 (bvsub lt!154186 lt!154188)))))

(assert (=> d!32638 (or (= (bvand lt!154186 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!154188 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!154186 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!154186 lt!154188) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32638 (= lt!154188 (remainingBits!0 ((_ sign_extend 32) (size!2222 (buf!2588 (_1!4567 lt!153460)))) ((_ sign_extend 32) (currentByte!5073 (_1!4567 lt!153460))) ((_ sign_extend 32) (currentBit!5068 (_1!4567 lt!153460)))))))

(declare-fun lt!154185 () (_ BitVec 64))

(declare-fun lt!154184 () (_ BitVec 64))

(assert (=> d!32638 (= lt!154186 (bvmul lt!154185 lt!154184))))

(assert (=> d!32638 (or (= lt!154185 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!154184 (bvsdiv (bvmul lt!154185 lt!154184) lt!154185)))))

(assert (=> d!32638 (= lt!154184 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!32638 (= lt!154185 ((_ sign_extend 32) (size!2222 (buf!2588 (_1!4567 lt!153460)))))))

(assert (=> d!32638 (= lt!154187 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5073 (_1!4567 lt!153460))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5068 (_1!4567 lt!153460)))))))

(assert (=> d!32638 (invariant!0 (currentBit!5068 (_1!4567 lt!153460)) (currentByte!5073 (_1!4567 lt!153460)) (size!2222 (buf!2588 (_1!4567 lt!153460))))))

(assert (=> d!32638 (= (bitIndex!0 (size!2222 (buf!2588 (_1!4567 lt!153460))) (currentByte!5073 (_1!4567 lt!153460)) (currentBit!5068 (_1!4567 lt!153460))) lt!154187)))

(declare-fun b!104832 () Bool)

(declare-fun res!86323 () Bool)

(assert (=> b!104832 (=> (not res!86323) (not e!68658))))

(assert (=> b!104832 (= res!86323 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!154187))))

(declare-fun b!104833 () Bool)

(declare-fun lt!154189 () (_ BitVec 64))

(assert (=> b!104833 (= e!68658 (bvsle lt!154187 (bvmul lt!154189 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!104833 (or (= lt!154189 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!154189 #b0000000000000000000000000000000000000000000000000000000000001000) lt!154189)))))

(assert (=> b!104833 (= lt!154189 ((_ sign_extend 32) (size!2222 (buf!2588 (_1!4567 lt!153460)))))))

(assert (= (and d!32638 res!86324) b!104832))

(assert (= (and b!104832 res!86323) b!104833))

(declare-fun m!153639 () Bool)

(assert (=> d!32638 m!153639))

(declare-fun m!153641 () Bool)

(assert (=> d!32638 m!153641))

(assert (=> b!104456 d!32638))

(declare-fun b!104834 () Bool)

(declare-fun res!86327 () Bool)

(declare-fun e!68659 () Bool)

(assert (=> b!104834 (=> (not res!86327) (not e!68659))))

(declare-fun lt!154191 () tuple2!8626)

(assert (=> b!104834 (= res!86327 (isPrefixOf!0 (_2!4568 lt!154191) (_2!4566 lt!153463)))))

(declare-fun b!104835 () Bool)

(declare-fun e!68660 () Unit!6388)

(declare-fun lt!154203 () Unit!6388)

(assert (=> b!104835 (= e!68660 lt!154203)))

(declare-fun lt!154200 () (_ BitVec 64))

(assert (=> b!104835 (= lt!154200 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!154209 () (_ BitVec 64))

(assert (=> b!104835 (= lt!154209 (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!153449))) (currentByte!5073 (_2!4566 lt!153449)) (currentBit!5068 (_2!4566 lt!153449))))))

(assert (=> b!104835 (= lt!154203 (arrayBitRangesEqSymmetric!0 (buf!2588 (_2!4566 lt!153449)) (buf!2588 (_2!4566 lt!153463)) lt!154200 lt!154209))))

(assert (=> b!104835 (arrayBitRangesEq!0 (buf!2588 (_2!4566 lt!153463)) (buf!2588 (_2!4566 lt!153449)) lt!154200 lt!154209)))

(declare-fun b!104836 () Bool)

(declare-fun Unit!6429 () Unit!6388)

(assert (=> b!104836 (= e!68660 Unit!6429)))

(declare-fun d!32640 () Bool)

(assert (=> d!32640 e!68659))

(declare-fun res!86326 () Bool)

(assert (=> d!32640 (=> (not res!86326) (not e!68659))))

(assert (=> d!32640 (= res!86326 (isPrefixOf!0 (_1!4568 lt!154191) (_2!4568 lt!154191)))))

(declare-fun lt!154201 () BitStream!3918)

(assert (=> d!32640 (= lt!154191 (tuple2!8627 lt!154201 (_2!4566 lt!153463)))))

(declare-fun lt!154197 () Unit!6388)

(declare-fun lt!154195 () Unit!6388)

(assert (=> d!32640 (= lt!154197 lt!154195)))

(assert (=> d!32640 (isPrefixOf!0 lt!154201 (_2!4566 lt!153463))))

(assert (=> d!32640 (= lt!154195 (lemmaIsPrefixTransitive!0 lt!154201 (_2!4566 lt!153463) (_2!4566 lt!153463)))))

(declare-fun lt!154192 () Unit!6388)

(declare-fun lt!154194 () Unit!6388)

(assert (=> d!32640 (= lt!154192 lt!154194)))

(assert (=> d!32640 (isPrefixOf!0 lt!154201 (_2!4566 lt!153463))))

(assert (=> d!32640 (= lt!154194 (lemmaIsPrefixTransitive!0 lt!154201 (_2!4566 lt!153449) (_2!4566 lt!153463)))))

(declare-fun lt!154205 () Unit!6388)

(assert (=> d!32640 (= lt!154205 e!68660)))

(declare-fun c!6459 () Bool)

(assert (=> d!32640 (= c!6459 (not (= (size!2222 (buf!2588 (_2!4566 lt!153449))) #b00000000000000000000000000000000)))))

(declare-fun lt!154207 () Unit!6388)

(declare-fun lt!154206 () Unit!6388)

(assert (=> d!32640 (= lt!154207 lt!154206)))

(assert (=> d!32640 (isPrefixOf!0 (_2!4566 lt!153463) (_2!4566 lt!153463))))

(assert (=> d!32640 (= lt!154206 (lemmaIsPrefixRefl!0 (_2!4566 lt!153463)))))

(declare-fun lt!154190 () Unit!6388)

(declare-fun lt!154208 () Unit!6388)

(assert (=> d!32640 (= lt!154190 lt!154208)))

(assert (=> d!32640 (= lt!154208 (lemmaIsPrefixRefl!0 (_2!4566 lt!153463)))))

(declare-fun lt!154196 () Unit!6388)

(declare-fun lt!154199 () Unit!6388)

(assert (=> d!32640 (= lt!154196 lt!154199)))

(assert (=> d!32640 (isPrefixOf!0 lt!154201 lt!154201)))

(assert (=> d!32640 (= lt!154199 (lemmaIsPrefixRefl!0 lt!154201))))

(declare-fun lt!154202 () Unit!6388)

(declare-fun lt!154193 () Unit!6388)

(assert (=> d!32640 (= lt!154202 lt!154193)))

(assert (=> d!32640 (isPrefixOf!0 (_2!4566 lt!153449) (_2!4566 lt!153449))))

(assert (=> d!32640 (= lt!154193 (lemmaIsPrefixRefl!0 (_2!4566 lt!153449)))))

(assert (=> d!32640 (= lt!154201 (BitStream!3919 (buf!2588 (_2!4566 lt!153463)) (currentByte!5073 (_2!4566 lt!153449)) (currentBit!5068 (_2!4566 lt!153449))))))

(assert (=> d!32640 (isPrefixOf!0 (_2!4566 lt!153449) (_2!4566 lt!153463))))

(assert (=> d!32640 (= (reader!0 (_2!4566 lt!153449) (_2!4566 lt!153463)) lt!154191)))

(declare-fun b!104837 () Bool)

(declare-fun res!86325 () Bool)

(assert (=> b!104837 (=> (not res!86325) (not e!68659))))

(assert (=> b!104837 (= res!86325 (isPrefixOf!0 (_1!4568 lt!154191) (_2!4566 lt!153449)))))

(declare-fun b!104838 () Bool)

(declare-fun lt!154198 () (_ BitVec 64))

(declare-fun lt!154204 () (_ BitVec 64))

(assert (=> b!104838 (= e!68659 (= (_1!4568 lt!154191) (withMovedBitIndex!0 (_2!4568 lt!154191) (bvsub lt!154198 lt!154204))))))

(assert (=> b!104838 (or (= (bvand lt!154198 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!154204 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!154198 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!154198 lt!154204) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!104838 (= lt!154204 (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!153463))) (currentByte!5073 (_2!4566 lt!153463)) (currentBit!5068 (_2!4566 lt!153463))))))

(assert (=> b!104838 (= lt!154198 (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!153449))) (currentByte!5073 (_2!4566 lt!153449)) (currentBit!5068 (_2!4566 lt!153449))))))

(assert (= (and d!32640 c!6459) b!104835))

(assert (= (and d!32640 (not c!6459)) b!104836))

(assert (= (and d!32640 res!86326) b!104837))

(assert (= (and b!104837 res!86325) b!104834))

(assert (= (and b!104834 res!86327) b!104838))

(declare-fun m!153643 () Bool)

(assert (=> b!104837 m!153643))

(declare-fun m!153645 () Bool)

(assert (=> b!104834 m!153645))

(declare-fun m!153647 () Bool)

(assert (=> d!32640 m!153647))

(declare-fun m!153649 () Bool)

(assert (=> d!32640 m!153649))

(declare-fun m!153651 () Bool)

(assert (=> d!32640 m!153651))

(declare-fun m!153653 () Bool)

(assert (=> d!32640 m!153653))

(declare-fun m!153655 () Bool)

(assert (=> d!32640 m!153655))

(declare-fun m!153657 () Bool)

(assert (=> d!32640 m!153657))

(declare-fun m!153659 () Bool)

(assert (=> d!32640 m!153659))

(declare-fun m!153661 () Bool)

(assert (=> d!32640 m!153661))

(declare-fun m!153663 () Bool)

(assert (=> d!32640 m!153663))

(declare-fun m!153665 () Bool)

(assert (=> d!32640 m!153665))

(declare-fun m!153667 () Bool)

(assert (=> d!32640 m!153667))

(assert (=> b!104835 m!152819))

(declare-fun m!153669 () Bool)

(assert (=> b!104835 m!153669))

(declare-fun m!153671 () Bool)

(assert (=> b!104835 m!153671))

(declare-fun m!153673 () Bool)

(assert (=> b!104838 m!153673))

(assert (=> b!104838 m!152827))

(assert (=> b!104838 m!152819))

(assert (=> b!104456 d!32640))

(declare-fun lt!154210 () tuple2!8644)

(declare-fun d!32642 () Bool)

(assert (=> d!32642 (= lt!154210 (readNLeastSignificantBitsLoop!0 (_1!4568 lt!153465) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!153422 (ite (_2!4567 lt!153432) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!32642 (= (readNLeastSignificantBitsLoopPure!0 (_1!4568 lt!153465) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!153422 (ite (_2!4567 lt!153432) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!8629 (_2!4577 lt!154210) (_1!4577 lt!154210)))))

(declare-fun bs!7994 () Bool)

(assert (= bs!7994 d!32642))

(declare-fun m!153675 () Bool)

(assert (=> bs!7994 m!153675))

(assert (=> b!104456 d!32642))

(declare-fun b!104839 () Bool)

(declare-fun res!86330 () Bool)

(declare-fun e!68661 () Bool)

(assert (=> b!104839 (=> (not res!86330) (not e!68661))))

(declare-fun lt!154212 () tuple2!8626)

(assert (=> b!104839 (= res!86330 (isPrefixOf!0 (_2!4568 lt!154212) (_2!4566 lt!153463)))))

(declare-fun b!104840 () Bool)

(declare-fun e!68662 () Unit!6388)

(declare-fun lt!154224 () Unit!6388)

(assert (=> b!104840 (= e!68662 lt!154224)))

(declare-fun lt!154221 () (_ BitVec 64))

(assert (=> b!104840 (= lt!154221 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!154230 () (_ BitVec 64))

(assert (=> b!104840 (= lt!154230 (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!152821))) (currentByte!5073 (_2!4566 lt!152821)) (currentBit!5068 (_2!4566 lt!152821))))))

(assert (=> b!104840 (= lt!154224 (arrayBitRangesEqSymmetric!0 (buf!2588 (_2!4566 lt!152821)) (buf!2588 (_2!4566 lt!153463)) lt!154221 lt!154230))))

(assert (=> b!104840 (arrayBitRangesEq!0 (buf!2588 (_2!4566 lt!153463)) (buf!2588 (_2!4566 lt!152821)) lt!154221 lt!154230)))

(declare-fun b!104841 () Bool)

(declare-fun Unit!6430 () Unit!6388)

(assert (=> b!104841 (= e!68662 Unit!6430)))

(declare-fun d!32644 () Bool)

(assert (=> d!32644 e!68661))

(declare-fun res!86329 () Bool)

(assert (=> d!32644 (=> (not res!86329) (not e!68661))))

(assert (=> d!32644 (= res!86329 (isPrefixOf!0 (_1!4568 lt!154212) (_2!4568 lt!154212)))))

(declare-fun lt!154222 () BitStream!3918)

(assert (=> d!32644 (= lt!154212 (tuple2!8627 lt!154222 (_2!4566 lt!153463)))))

(declare-fun lt!154218 () Unit!6388)

(declare-fun lt!154216 () Unit!6388)

(assert (=> d!32644 (= lt!154218 lt!154216)))

(assert (=> d!32644 (isPrefixOf!0 lt!154222 (_2!4566 lt!153463))))

(assert (=> d!32644 (= lt!154216 (lemmaIsPrefixTransitive!0 lt!154222 (_2!4566 lt!153463) (_2!4566 lt!153463)))))

(declare-fun lt!154213 () Unit!6388)

(declare-fun lt!154215 () Unit!6388)

(assert (=> d!32644 (= lt!154213 lt!154215)))

(assert (=> d!32644 (isPrefixOf!0 lt!154222 (_2!4566 lt!153463))))

(assert (=> d!32644 (= lt!154215 (lemmaIsPrefixTransitive!0 lt!154222 (_2!4566 lt!152821) (_2!4566 lt!153463)))))

(declare-fun lt!154226 () Unit!6388)

(assert (=> d!32644 (= lt!154226 e!68662)))

(declare-fun c!6460 () Bool)

(assert (=> d!32644 (= c!6460 (not (= (size!2222 (buf!2588 (_2!4566 lt!152821))) #b00000000000000000000000000000000)))))

(declare-fun lt!154228 () Unit!6388)

(declare-fun lt!154227 () Unit!6388)

(assert (=> d!32644 (= lt!154228 lt!154227)))

(assert (=> d!32644 (isPrefixOf!0 (_2!4566 lt!153463) (_2!4566 lt!153463))))

(assert (=> d!32644 (= lt!154227 (lemmaIsPrefixRefl!0 (_2!4566 lt!153463)))))

(declare-fun lt!154211 () Unit!6388)

(declare-fun lt!154229 () Unit!6388)

(assert (=> d!32644 (= lt!154211 lt!154229)))

(assert (=> d!32644 (= lt!154229 (lemmaIsPrefixRefl!0 (_2!4566 lt!153463)))))

(declare-fun lt!154217 () Unit!6388)

(declare-fun lt!154220 () Unit!6388)

(assert (=> d!32644 (= lt!154217 lt!154220)))

(assert (=> d!32644 (isPrefixOf!0 lt!154222 lt!154222)))

(assert (=> d!32644 (= lt!154220 (lemmaIsPrefixRefl!0 lt!154222))))

(declare-fun lt!154223 () Unit!6388)

(declare-fun lt!154214 () Unit!6388)

(assert (=> d!32644 (= lt!154223 lt!154214)))

(assert (=> d!32644 (isPrefixOf!0 (_2!4566 lt!152821) (_2!4566 lt!152821))))

(assert (=> d!32644 (= lt!154214 (lemmaIsPrefixRefl!0 (_2!4566 lt!152821)))))

(assert (=> d!32644 (= lt!154222 (BitStream!3919 (buf!2588 (_2!4566 lt!153463)) (currentByte!5073 (_2!4566 lt!152821)) (currentBit!5068 (_2!4566 lt!152821))))))

(assert (=> d!32644 (isPrefixOf!0 (_2!4566 lt!152821) (_2!4566 lt!153463))))

(assert (=> d!32644 (= (reader!0 (_2!4566 lt!152821) (_2!4566 lt!153463)) lt!154212)))

(declare-fun b!104842 () Bool)

(declare-fun res!86328 () Bool)

(assert (=> b!104842 (=> (not res!86328) (not e!68661))))

(assert (=> b!104842 (= res!86328 (isPrefixOf!0 (_1!4568 lt!154212) (_2!4566 lt!152821)))))

(declare-fun lt!154225 () (_ BitVec 64))

(declare-fun lt!154219 () (_ BitVec 64))

(declare-fun b!104843 () Bool)

(assert (=> b!104843 (= e!68661 (= (_1!4568 lt!154212) (withMovedBitIndex!0 (_2!4568 lt!154212) (bvsub lt!154219 lt!154225))))))

(assert (=> b!104843 (or (= (bvand lt!154219 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!154225 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!154219 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!154219 lt!154225) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!104843 (= lt!154225 (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!153463))) (currentByte!5073 (_2!4566 lt!153463)) (currentBit!5068 (_2!4566 lt!153463))))))

(assert (=> b!104843 (= lt!154219 (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!152821))) (currentByte!5073 (_2!4566 lt!152821)) (currentBit!5068 (_2!4566 lt!152821))))))

(assert (= (and d!32644 c!6460) b!104840))

(assert (= (and d!32644 (not c!6460)) b!104841))

(assert (= (and d!32644 res!86329) b!104842))

(assert (= (and b!104842 res!86328) b!104839))

(assert (= (and b!104839 res!86330) b!104843))

(declare-fun m!153677 () Bool)

(assert (=> b!104842 m!153677))

(declare-fun m!153679 () Bool)

(assert (=> b!104839 m!153679))

(declare-fun m!153681 () Bool)

(assert (=> d!32644 m!153681))

(declare-fun m!153683 () Bool)

(assert (=> d!32644 m!153683))

(declare-fun m!153685 () Bool)

(assert (=> d!32644 m!153685))

(assert (=> d!32644 m!152561))

(assert (=> d!32644 m!152563))

(assert (=> d!32644 m!153657))

(declare-fun m!153687 () Bool)

(assert (=> d!32644 m!153687))

(declare-fun m!153689 () Bool)

(assert (=> d!32644 m!153689))

(assert (=> d!32644 m!152803))

(assert (=> d!32644 m!153665))

(declare-fun m!153691 () Bool)

(assert (=> d!32644 m!153691))

(assert (=> b!104840 m!152439))

(declare-fun m!153693 () Bool)

(assert (=> b!104840 m!153693))

(declare-fun m!153695 () Bool)

(assert (=> b!104840 m!153695))

(declare-fun m!153697 () Bool)

(assert (=> b!104843 m!153697))

(assert (=> b!104843 m!152827))

(assert (=> b!104843 m!152439))

(assert (=> b!104456 d!32644))

(declare-fun d!32646 () Bool)

(assert (=> d!32646 (= (invariant!0 (currentBit!5068 (_2!4566 lt!152821)) (currentByte!5073 (_2!4566 lt!152821)) (size!2222 (buf!2588 (_2!4566 lt!153449)))) (and (bvsge (currentBit!5068 (_2!4566 lt!152821)) #b00000000000000000000000000000000) (bvslt (currentBit!5068 (_2!4566 lt!152821)) #b00000000000000000000000000001000) (bvsge (currentByte!5073 (_2!4566 lt!152821)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5073 (_2!4566 lt!152821)) (size!2222 (buf!2588 (_2!4566 lt!153449)))) (and (= (currentBit!5068 (_2!4566 lt!152821)) #b00000000000000000000000000000000) (= (currentByte!5073 (_2!4566 lt!152821)) (size!2222 (buf!2588 (_2!4566 lt!153449))))))))))

(assert (=> b!104456 d!32646))

(declare-fun d!32648 () Bool)

(declare-fun lt!154231 () tuple2!8642)

(assert (=> d!32648 (= lt!154231 (readBit!0 (_1!4568 lt!153433)))))

(assert (=> d!32648 (= (readBitPure!0 (_1!4568 lt!153433)) (tuple2!8625 (_2!4576 lt!154231) (_1!4576 lt!154231)))))

(declare-fun bs!7995 () Bool)

(assert (= bs!7995 d!32648))

(declare-fun m!153699 () Bool)

(assert (=> bs!7995 m!153699))

(assert (=> b!104456 d!32648))

(declare-fun d!32650 () Bool)

(declare-fun lt!154232 () tuple2!8644)

(assert (=> d!32650 (= lt!154232 (readNLeastSignificantBitsLoop!0 (_1!4568 lt!153433) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!153422))))

(assert (=> d!32650 (= (readNLeastSignificantBitsLoopPure!0 (_1!4568 lt!153433) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!153422) (tuple2!8629 (_2!4577 lt!154232) (_1!4577 lt!154232)))))

(declare-fun bs!7996 () Bool)

(assert (= bs!7996 d!32650))

(declare-fun m!153701 () Bool)

(assert (=> bs!7996 m!153701))

(assert (=> b!104456 d!32650))

(declare-fun d!32652 () Bool)

(assert (=> d!32652 (= (invariant!0 (currentBit!5068 lt!153456) (currentByte!5073 lt!153456) (size!2222 (buf!2588 (_2!4566 lt!153463)))) (and (bvsge (currentBit!5068 lt!153456) #b00000000000000000000000000000000) (bvslt (currentBit!5068 lt!153456) #b00000000000000000000000000001000) (bvsge (currentByte!5073 lt!153456) #b00000000000000000000000000000000) (or (bvslt (currentByte!5073 lt!153456) (size!2222 (buf!2588 (_2!4566 lt!153463)))) (and (= (currentBit!5068 lt!153456) #b00000000000000000000000000000000) (= (currentByte!5073 lt!153456) (size!2222 (buf!2588 (_2!4566 lt!153463))))))))))

(assert (=> b!104456 d!32652))

(declare-fun d!32654 () Bool)

(declare-fun lt!154233 () tuple2!8642)

(assert (=> d!32654 (= lt!154233 (readBit!0 lt!153453))))

(assert (=> d!32654 (= (readBitPure!0 lt!153453) (tuple2!8625 (_2!4576 lt!154233) (_1!4576 lt!154233)))))

(declare-fun bs!7997 () Bool)

(assert (= bs!7997 d!32654))

(declare-fun m!153703 () Bool)

(assert (=> bs!7997 m!153703))

(assert (=> b!104456 d!32654))

(declare-fun d!32656 () Bool)

(declare-fun lt!154234 () tuple2!8642)

(assert (=> d!32656 (= lt!154234 (readBit!0 (readerFrom!0 (_2!4566 lt!153424) (currentBit!5068 (_2!4566 lt!152821)) (currentByte!5073 (_2!4566 lt!152821)))))))

(assert (=> d!32656 (= (readBitPure!0 (readerFrom!0 (_2!4566 lt!153424) (currentBit!5068 (_2!4566 lt!152821)) (currentByte!5073 (_2!4566 lt!152821)))) (tuple2!8625 (_2!4576 lt!154234) (_1!4576 lt!154234)))))

(declare-fun bs!7998 () Bool)

(assert (= bs!7998 d!32656))

(assert (=> bs!7998 m!152897))

(declare-fun m!153705 () Bool)

(assert (=> bs!7998 m!153705))

(assert (=> b!104455 d!32656))

(declare-fun d!32658 () Bool)

(declare-fun e!68663 () Bool)

(assert (=> d!32658 e!68663))

(declare-fun res!86331 () Bool)

(assert (=> d!32658 (=> (not res!86331) (not e!68663))))

(assert (=> d!32658 (= res!86331 (invariant!0 (currentBit!5068 (_2!4566 lt!153424)) (currentByte!5073 (_2!4566 lt!153424)) (size!2222 (buf!2588 (_2!4566 lt!153424)))))))

(assert (=> d!32658 (= (readerFrom!0 (_2!4566 lt!153424) (currentBit!5068 (_2!4566 lt!152821)) (currentByte!5073 (_2!4566 lt!152821))) (BitStream!3919 (buf!2588 (_2!4566 lt!153424)) (currentByte!5073 (_2!4566 lt!152821)) (currentBit!5068 (_2!4566 lt!152821))))))

(declare-fun b!104844 () Bool)

(assert (=> b!104844 (= e!68663 (invariant!0 (currentBit!5068 (_2!4566 lt!152821)) (currentByte!5073 (_2!4566 lt!152821)) (size!2222 (buf!2588 (_2!4566 lt!153424)))))))

(assert (= (and d!32658 res!86331) b!104844))

(assert (=> d!32658 m!153373))

(declare-fun m!153707 () Bool)

(assert (=> b!104844 m!153707))

(assert (=> b!104455 d!32658))

(declare-fun d!32660 () Bool)

(assert (=> d!32660 (= (remainingBits!0 ((_ sign_extend 32) (size!2222 (buf!2588 (_2!4566 lt!152813)))) ((_ sign_extend 32) (currentByte!5073 thiss!1305)) ((_ sign_extend 32) (currentBit!5068 thiss!1305))) (bvsub (bvmul ((_ sign_extend 32) (size!2222 (buf!2588 (_2!4566 lt!152813)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5073 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5068 thiss!1305)))))))

(assert (=> d!32324 d!32660))

(assert (=> b!104327 d!32452))

(declare-fun d!32662 () Bool)

(assert (=> d!32662 (arrayBitRangesEq!0 (buf!2588 (_2!4566 lt!152813)) (buf!2588 (_2!4566 lt!152821)) lt!152977 lt!152986)))

(declare-fun lt!154235 () Unit!6388)

(assert (=> d!32662 (= lt!154235 (choose!8 (buf!2588 (_2!4566 lt!152821)) (buf!2588 (_2!4566 lt!152813)) lt!152977 lt!152986))))

(assert (=> d!32662 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!152977) (bvsle lt!152977 lt!152986))))

(assert (=> d!32662 (= (arrayBitRangesEqSymmetric!0 (buf!2588 (_2!4566 lt!152821)) (buf!2588 (_2!4566 lt!152813)) lt!152977 lt!152986) lt!154235)))

(declare-fun bs!7999 () Bool)

(assert (= bs!7999 d!32662))

(assert (=> bs!7999 m!152579))

(declare-fun m!153709 () Bool)

(assert (=> bs!7999 m!153709))

(assert (=> b!104327 d!32662))

(declare-fun lt!154236 () tuple4!68)

(declare-fun e!68666 () Bool)

(declare-fun b!104845 () Bool)

(assert (=> b!104845 (= e!68666 (arrayRangesEq!35 (buf!2588 (_2!4566 lt!152813)) (buf!2588 (_2!4566 lt!152821)) (_1!4580 lt!154236) (_2!4580 lt!154236)))))

(declare-fun b!104846 () Bool)

(declare-fun e!68665 () Bool)

(declare-fun call!1306 () Bool)

(assert (=> b!104846 (= e!68665 call!1306)))

(declare-fun c!6461 () Bool)

(declare-fun lt!154237 () (_ BitVec 32))

(declare-fun bm!1303 () Bool)

(declare-fun lt!154238 () (_ BitVec 32))

(assert (=> bm!1303 (= call!1306 (byteRangesEq!0 (ite c!6461 (select (arr!2815 (buf!2588 (_2!4566 lt!152813))) (_3!255 lt!154236)) (select (arr!2815 (buf!2588 (_2!4566 lt!152813))) (_4!34 lt!154236))) (ite c!6461 (select (arr!2815 (buf!2588 (_2!4566 lt!152821))) (_3!255 lt!154236)) (select (arr!2815 (buf!2588 (_2!4566 lt!152821))) (_4!34 lt!154236))) (ite c!6461 lt!154237 #b00000000000000000000000000000000) lt!154238))))

(declare-fun b!104847 () Bool)

(declare-fun e!68669 () Bool)

(assert (=> b!104847 (= e!68665 e!68669)))

(declare-fun res!86332 () Bool)

(assert (=> b!104847 (= res!86332 (byteRangesEq!0 (select (arr!2815 (buf!2588 (_2!4566 lt!152813))) (_3!255 lt!154236)) (select (arr!2815 (buf!2588 (_2!4566 lt!152821))) (_3!255 lt!154236)) lt!154237 #b00000000000000000000000000001000))))

(assert (=> b!104847 (=> (not res!86332) (not e!68669))))

(declare-fun d!32664 () Bool)

(declare-fun res!86335 () Bool)

(declare-fun e!68667 () Bool)

(assert (=> d!32664 (=> res!86335 e!68667)))

(assert (=> d!32664 (= res!86335 (bvsge lt!152977 lt!152986))))

(assert (=> d!32664 (= (arrayBitRangesEq!0 (buf!2588 (_2!4566 lt!152813)) (buf!2588 (_2!4566 lt!152821)) lt!152977 lt!152986) e!68667)))

(declare-fun b!104848 () Bool)

(declare-fun e!68668 () Bool)

(assert (=> b!104848 (= e!68668 call!1306)))

(declare-fun b!104849 () Bool)

(declare-fun e!68664 () Bool)

(assert (=> b!104849 (= e!68664 e!68665)))

(assert (=> b!104849 (= c!6461 (= (_3!255 lt!154236) (_4!34 lt!154236)))))

(declare-fun b!104850 () Bool)

(assert (=> b!104850 (= e!68667 e!68664)))

(declare-fun res!86334 () Bool)

(assert (=> b!104850 (=> (not res!86334) (not e!68664))))

(assert (=> b!104850 (= res!86334 e!68666)))

(declare-fun res!86333 () Bool)

(assert (=> b!104850 (=> res!86333 e!68666)))

(assert (=> b!104850 (= res!86333 (bvsge (_1!4580 lt!154236) (_2!4580 lt!154236)))))

(assert (=> b!104850 (= lt!154238 ((_ extract 31 0) (bvsrem lt!152986 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!104850 (= lt!154237 ((_ extract 31 0) (bvsrem lt!152977 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!104850 (= lt!154236 (arrayBitIndices!0 lt!152977 lt!152986))))

(declare-fun b!104851 () Bool)

(declare-fun res!86336 () Bool)

(assert (=> b!104851 (= res!86336 (= lt!154238 #b00000000000000000000000000000000))))

(assert (=> b!104851 (=> res!86336 e!68668)))

(assert (=> b!104851 (= e!68669 e!68668)))

(assert (= (and d!32664 (not res!86335)) b!104850))

(assert (= (and b!104850 (not res!86333)) b!104845))

(assert (= (and b!104850 res!86334) b!104849))

(assert (= (and b!104849 c!6461) b!104846))

(assert (= (and b!104849 (not c!6461)) b!104847))

(assert (= (and b!104847 res!86332) b!104851))

(assert (= (and b!104851 (not res!86336)) b!104848))

(assert (= (or b!104846 b!104848) bm!1303))

(declare-fun m!153711 () Bool)

(assert (=> b!104845 m!153711))

(declare-fun m!153713 () Bool)

(assert (=> bm!1303 m!153713))

(declare-fun m!153715 () Bool)

(assert (=> bm!1303 m!153715))

(declare-fun m!153717 () Bool)

(assert (=> bm!1303 m!153717))

(declare-fun m!153719 () Bool)

(assert (=> bm!1303 m!153719))

(declare-fun m!153721 () Bool)

(assert (=> bm!1303 m!153721))

(assert (=> b!104847 m!153717))

(assert (=> b!104847 m!153719))

(assert (=> b!104847 m!153717))

(assert (=> b!104847 m!153719))

(declare-fun m!153723 () Bool)

(assert (=> b!104847 m!153723))

(declare-fun m!153725 () Bool)

(assert (=> b!104850 m!153725))

(assert (=> b!104327 d!32664))

(declare-fun e!68672 () Bool)

(declare-fun lt!154239 () tuple4!68)

(declare-fun b!104852 () Bool)

(assert (=> b!104852 (= e!68672 (arrayRangesEq!35 (buf!2588 thiss!1305) (buf!2588 (_2!4566 lt!152813)) (_1!4580 lt!154239) (_2!4580 lt!154239)))))

(declare-fun b!104853 () Bool)

(declare-fun e!68671 () Bool)

(declare-fun call!1307 () Bool)

(assert (=> b!104853 (= e!68671 call!1307)))

(declare-fun lt!154241 () (_ BitVec 32))

(declare-fun lt!154240 () (_ BitVec 32))

(declare-fun bm!1304 () Bool)

(declare-fun c!6462 () Bool)

(assert (=> bm!1304 (= call!1307 (byteRangesEq!0 (ite c!6462 (select (arr!2815 (buf!2588 thiss!1305)) (_3!255 lt!154239)) (select (arr!2815 (buf!2588 thiss!1305)) (_4!34 lt!154239))) (ite c!6462 (select (arr!2815 (buf!2588 (_2!4566 lt!152813))) (_3!255 lt!154239)) (select (arr!2815 (buf!2588 (_2!4566 lt!152813))) (_4!34 lt!154239))) (ite c!6462 lt!154240 #b00000000000000000000000000000000) lt!154241))))

(declare-fun b!104854 () Bool)

(declare-fun e!68675 () Bool)

(assert (=> b!104854 (= e!68671 e!68675)))

(declare-fun res!86337 () Bool)

(assert (=> b!104854 (= res!86337 (byteRangesEq!0 (select (arr!2815 (buf!2588 thiss!1305)) (_3!255 lt!154239)) (select (arr!2815 (buf!2588 (_2!4566 lt!152813))) (_3!255 lt!154239)) lt!154240 #b00000000000000000000000000001000))))

(assert (=> b!104854 (=> (not res!86337) (not e!68675))))

(declare-fun d!32666 () Bool)

(declare-fun res!86340 () Bool)

(declare-fun e!68673 () Bool)

(assert (=> d!32666 (=> res!86340 e!68673)))

(assert (=> d!32666 (= res!86340 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2222 (buf!2588 thiss!1305)) (currentByte!5073 thiss!1305) (currentBit!5068 thiss!1305))))))

(assert (=> d!32666 (= (arrayBitRangesEq!0 (buf!2588 thiss!1305) (buf!2588 (_2!4566 lt!152813)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2222 (buf!2588 thiss!1305)) (currentByte!5073 thiss!1305) (currentBit!5068 thiss!1305))) e!68673)))

(declare-fun b!104855 () Bool)

(declare-fun e!68674 () Bool)

(assert (=> b!104855 (= e!68674 call!1307)))

(declare-fun b!104856 () Bool)

(declare-fun e!68670 () Bool)

(assert (=> b!104856 (= e!68670 e!68671)))

(assert (=> b!104856 (= c!6462 (= (_3!255 lt!154239) (_4!34 lt!154239)))))

(declare-fun b!104857 () Bool)

(assert (=> b!104857 (= e!68673 e!68670)))

(declare-fun res!86339 () Bool)

(assert (=> b!104857 (=> (not res!86339) (not e!68670))))

(assert (=> b!104857 (= res!86339 e!68672)))

(declare-fun res!86338 () Bool)

(assert (=> b!104857 (=> res!86338 e!68672)))

(assert (=> b!104857 (= res!86338 (bvsge (_1!4580 lt!154239) (_2!4580 lt!154239)))))

(assert (=> b!104857 (= lt!154241 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!2222 (buf!2588 thiss!1305)) (currentByte!5073 thiss!1305) (currentBit!5068 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!104857 (= lt!154240 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!104857 (= lt!154239 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2222 (buf!2588 thiss!1305)) (currentByte!5073 thiss!1305) (currentBit!5068 thiss!1305))))))

(declare-fun b!104858 () Bool)

(declare-fun res!86341 () Bool)

(assert (=> b!104858 (= res!86341 (= lt!154241 #b00000000000000000000000000000000))))

(assert (=> b!104858 (=> res!86341 e!68674)))

(assert (=> b!104858 (= e!68675 e!68674)))

(assert (= (and d!32666 (not res!86340)) b!104857))

(assert (= (and b!104857 (not res!86338)) b!104852))

(assert (= (and b!104857 res!86339) b!104856))

(assert (= (and b!104856 c!6462) b!104853))

(assert (= (and b!104856 (not c!6462)) b!104854))

(assert (= (and b!104854 res!86337) b!104858))

(assert (= (and b!104858 (not res!86341)) b!104855))

(assert (= (or b!104853 b!104855) bm!1304))

(declare-fun m!153727 () Bool)

(assert (=> b!104852 m!153727))

(declare-fun m!153729 () Bool)

(assert (=> bm!1304 m!153729))

(declare-fun m!153731 () Bool)

(assert (=> bm!1304 m!153731))

(declare-fun m!153733 () Bool)

(assert (=> bm!1304 m!153733))

(declare-fun m!153735 () Bool)

(assert (=> bm!1304 m!153735))

(declare-fun m!153737 () Bool)

(assert (=> bm!1304 m!153737))

(assert (=> b!104854 m!153733))

(assert (=> b!104854 m!153735))

(assert (=> b!104854 m!153733))

(assert (=> b!104854 m!153735))

(declare-fun m!153739 () Bool)

(assert (=> b!104854 m!153739))

(assert (=> b!104857 m!152441))

(assert (=> b!104857 m!153321))

(assert (=> b!104504 d!32666))

(assert (=> b!104504 d!32438))

(assert (=> d!32398 d!32256))

(assert (=> d!32398 d!32258))

(declare-fun d!32668 () Bool)

(declare-fun lt!154246 () tuple2!8628)

(declare-fun lt!154247 () tuple2!8628)

(assert (=> d!32668 (and (= (_2!4569 lt!154246) (_2!4569 lt!154247)) (= (_1!4569 lt!154246) (_1!4569 lt!154247)))))

(declare-fun e!68678 () (_ BitVec 64))

(assert (=> d!32668 (= lt!154247 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4568 lt!152809) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd i!615 #b00000000000000000000000000000001) (bvor lt!152817 e!68678)))))

(declare-fun c!6465 () Bool)

(assert (=> d!32668 (= c!6465 (_2!4567 (readBitPure!0 (_1!4568 lt!152809))))))

(assert (=> d!32668 (= lt!154246 (readNLeastSignificantBitsLoopPure!0 (_1!4568 lt!152809) nBits!396 i!615 lt!152817))))

(assert (=> d!32668 true))

(declare-fun _$11!35 () Unit!6388)

(assert (=> d!32668 (= (choose!45 (_1!4568 lt!152809) nBits!396 i!615 lt!152817 lt!153777 (tuple2!8629 (_1!4569 lt!153777) (_2!4569 lt!153777)) (_1!4569 lt!153777) (_2!4569 lt!153777) lt!153778 lt!153779 lt!153776 lt!153780 (tuple2!8629 (_1!4569 lt!153780) (_2!4569 lt!153780)) (_1!4569 lt!153780) (_2!4569 lt!153780)) _$11!35)))

(declare-fun b!104863 () Bool)

(assert (=> b!104863 (= e!68678 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!104864 () Bool)

(assert (=> b!104864 (= e!68678 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (= (and d!32668 c!6465) b!104863))

(assert (= (and d!32668 (not c!6465)) b!104864))

(assert (=> d!32668 m!152443))

(assert (=> d!32668 m!152443))

(declare-fun m!153741 () Bool)

(assert (=> d!32668 m!153741))

(assert (=> d!32668 m!152427))

(assert (=> d!32668 m!152429))

(assert (=> d!32398 d!32668))

(declare-fun lt!154248 () tuple2!8644)

(declare-fun d!32670 () Bool)

(assert (=> d!32670 (= lt!154248 (readNLeastSignificantBitsLoop!0 lt!153779 nBits!396 (bvadd i!615 #b00000000000000000000000000000001) lt!153776))))

(assert (=> d!32670 (= (readNLeastSignificantBitsLoopPure!0 lt!153779 nBits!396 (bvadd i!615 #b00000000000000000000000000000001) lt!153776) (tuple2!8629 (_2!4577 lt!154248) (_1!4577 lt!154248)))))

(declare-fun bs!8001 () Bool)

(assert (= bs!8001 d!32670))

(declare-fun m!153743 () Bool)

(assert (=> bs!8001 m!153743))

(assert (=> d!32398 d!32670))

(assert (=> d!32398 d!32412))

(assert (=> b!104557 d!32524))

(assert (=> b!104557 d!32438))

(assert (=> d!32438 d!32510))

(assert (=> d!32438 d!32596))

(declare-fun d!32672 () Bool)

(assert (=> d!32672 (isPrefixOf!0 lt!153423 lt!153423)))

(declare-fun lt!154249 () Unit!6388)

(assert (=> d!32672 (= lt!154249 (choose!11 lt!153423))))

(assert (=> d!32672 (= (lemmaIsPrefixRefl!0 lt!153423) lt!154249)))

(declare-fun bs!8002 () Bool)

(assert (= bs!8002 d!32672))

(declare-fun m!153745 () Bool)

(assert (=> bs!8002 m!153745))

(declare-fun m!153747 () Bool)

(assert (=> bs!8002 m!153747))

(assert (=> b!104453 d!32672))

(assert (=> b!104580 d!32392))

(declare-fun d!32674 () Bool)

(declare-fun e!68679 () Bool)

(assert (=> d!32674 e!68679))

(declare-fun res!86343 () Bool)

(assert (=> d!32674 (=> (not res!86343) (not e!68679))))

(declare-fun lt!154254 () (_ BitVec 64))

(declare-fun lt!154253 () (_ BitVec 64))

(declare-fun lt!154252 () (_ BitVec 64))

(assert (=> d!32674 (= res!86343 (= lt!154253 (bvsub lt!154252 lt!154254)))))

(assert (=> d!32674 (or (= (bvand lt!154252 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!154254 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!154252 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!154252 lt!154254) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32674 (= lt!154254 (remainingBits!0 ((_ sign_extend 32) (size!2222 (buf!2588 (_2!4566 lt!153451)))) ((_ sign_extend 32) (currentByte!5073 (_2!4566 lt!153451))) ((_ sign_extend 32) (currentBit!5068 (_2!4566 lt!153451)))))))

(declare-fun lt!154251 () (_ BitVec 64))

(declare-fun lt!154250 () (_ BitVec 64))

(assert (=> d!32674 (= lt!154252 (bvmul lt!154251 lt!154250))))

(assert (=> d!32674 (or (= lt!154251 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!154250 (bvsdiv (bvmul lt!154251 lt!154250) lt!154251)))))

(assert (=> d!32674 (= lt!154250 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!32674 (= lt!154251 ((_ sign_extend 32) (size!2222 (buf!2588 (_2!4566 lt!153451)))))))

(assert (=> d!32674 (= lt!154253 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5073 (_2!4566 lt!153451))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5068 (_2!4566 lt!153451)))))))

(assert (=> d!32674 (invariant!0 (currentBit!5068 (_2!4566 lt!153451)) (currentByte!5073 (_2!4566 lt!153451)) (size!2222 (buf!2588 (_2!4566 lt!153451))))))

(assert (=> d!32674 (= (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!153451))) (currentByte!5073 (_2!4566 lt!153451)) (currentBit!5068 (_2!4566 lt!153451))) lt!154253)))

(declare-fun b!104865 () Bool)

(declare-fun res!86342 () Bool)

(assert (=> b!104865 (=> (not res!86342) (not e!68679))))

(assert (=> b!104865 (= res!86342 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!154253))))

(declare-fun b!104866 () Bool)

(declare-fun lt!154255 () (_ BitVec 64))

(assert (=> b!104866 (= e!68679 (bvsle lt!154253 (bvmul lt!154255 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!104866 (or (= lt!154255 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!154255 #b0000000000000000000000000000000000000000000000000000000000001000) lt!154255)))))

(assert (=> b!104866 (= lt!154255 ((_ sign_extend 32) (size!2222 (buf!2588 (_2!4566 lt!153451)))))))

(assert (= (and d!32674 res!86343) b!104865))

(assert (= (and b!104865 res!86342) b!104866))

(declare-fun m!153749 () Bool)

(assert (=> d!32674 m!153749))

(declare-fun m!153751 () Bool)

(assert (=> d!32674 m!153751))

(assert (=> b!104460 d!32674))

(assert (=> b!104460 d!32452))

(declare-fun d!32676 () Bool)

(declare-fun res!86345 () Bool)

(declare-fun e!68681 () Bool)

(assert (=> d!32676 (=> (not res!86345) (not e!68681))))

(assert (=> d!32676 (= res!86345 (= (size!2222 (buf!2588 (_2!4566 lt!152821))) (size!2222 (buf!2588 (_2!4566 lt!153451)))))))

(assert (=> d!32676 (= (isPrefixOf!0 (_2!4566 lt!152821) (_2!4566 lt!153451)) e!68681)))

(declare-fun b!104867 () Bool)

(declare-fun res!86344 () Bool)

(assert (=> b!104867 (=> (not res!86344) (not e!68681))))

(assert (=> b!104867 (= res!86344 (bvsle (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!152821))) (currentByte!5073 (_2!4566 lt!152821)) (currentBit!5068 (_2!4566 lt!152821))) (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!153451))) (currentByte!5073 (_2!4566 lt!153451)) (currentBit!5068 (_2!4566 lt!153451)))))))

(declare-fun b!104868 () Bool)

(declare-fun e!68680 () Bool)

(assert (=> b!104868 (= e!68681 e!68680)))

(declare-fun res!86346 () Bool)

(assert (=> b!104868 (=> res!86346 e!68680)))

(assert (=> b!104868 (= res!86346 (= (size!2222 (buf!2588 (_2!4566 lt!152821))) #b00000000000000000000000000000000))))

(declare-fun b!104869 () Bool)

(assert (=> b!104869 (= e!68680 (arrayBitRangesEq!0 (buf!2588 (_2!4566 lt!152821)) (buf!2588 (_2!4566 lt!153451)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2222 (buf!2588 (_2!4566 lt!152821))) (currentByte!5073 (_2!4566 lt!152821)) (currentBit!5068 (_2!4566 lt!152821)))))))

(assert (= (and d!32676 res!86345) b!104867))

(assert (= (and b!104867 res!86344) b!104868))

(assert (= (and b!104868 (not res!86346)) b!104869))

(assert (=> b!104867 m!152439))

(assert (=> b!104867 m!152789))

(assert (=> b!104869 m!152439))

(assert (=> b!104869 m!152439))

(declare-fun m!153753 () Bool)

(assert (=> b!104869 m!153753))

(assert (=> b!104458 d!32676))

(declare-fun d!32678 () Bool)

(declare-fun e!68682 () Bool)

(assert (=> d!32678 e!68682))

(declare-fun res!86347 () Bool)

(assert (=> d!32678 (=> (not res!86347) (not e!68682))))

(assert (=> d!32678 (= res!86347 (= (buf!2588 (_2!4566 (increaseBitIndex!0 (BitStream!3919 (buf!2588 (_2!4566 lt!152813)) (currentByte!5073 thiss!1305) (currentBit!5068 thiss!1305))))) (buf!2588 (BitStream!3919 (buf!2588 (_2!4566 lt!152813)) (currentByte!5073 thiss!1305) (currentBit!5068 thiss!1305)))))))

(declare-fun lt!154262 () Bool)

(assert (=> d!32678 (= lt!154262 (not (= (bvand ((_ sign_extend 24) (select (arr!2815 (buf!2588 (BitStream!3919 (buf!2588 (_2!4566 lt!152813)) (currentByte!5073 thiss!1305) (currentBit!5068 thiss!1305)))) (currentByte!5073 (BitStream!3919 (buf!2588 (_2!4566 lt!152813)) (currentByte!5073 thiss!1305) (currentBit!5068 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5068 (BitStream!3919 (buf!2588 (_2!4566 lt!152813)) (currentByte!5073 thiss!1305) (currentBit!5068 thiss!1305)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!154260 () tuple2!8642)

(assert (=> d!32678 (= lt!154260 (tuple2!8643 (not (= (bvand ((_ sign_extend 24) (select (arr!2815 (buf!2588 (BitStream!3919 (buf!2588 (_2!4566 lt!152813)) (currentByte!5073 thiss!1305) (currentBit!5068 thiss!1305)))) (currentByte!5073 (BitStream!3919 (buf!2588 (_2!4566 lt!152813)) (currentByte!5073 thiss!1305) (currentBit!5068 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5068 (BitStream!3919 (buf!2588 (_2!4566 lt!152813)) (currentByte!5073 thiss!1305) (currentBit!5068 thiss!1305)))))) #b00000000000000000000000000000000)) (_2!4566 (increaseBitIndex!0 (BitStream!3919 (buf!2588 (_2!4566 lt!152813)) (currentByte!5073 thiss!1305) (currentBit!5068 thiss!1305))))))))

(assert (=> d!32678 (validate_offset_bit!0 ((_ sign_extend 32) (size!2222 (buf!2588 (BitStream!3919 (buf!2588 (_2!4566 lt!152813)) (currentByte!5073 thiss!1305) (currentBit!5068 thiss!1305))))) ((_ sign_extend 32) (currentByte!5073 (BitStream!3919 (buf!2588 (_2!4566 lt!152813)) (currentByte!5073 thiss!1305) (currentBit!5068 thiss!1305)))) ((_ sign_extend 32) (currentBit!5068 (BitStream!3919 (buf!2588 (_2!4566 lt!152813)) (currentByte!5073 thiss!1305) (currentBit!5068 thiss!1305)))))))

(assert (=> d!32678 (= (readBit!0 (BitStream!3919 (buf!2588 (_2!4566 lt!152813)) (currentByte!5073 thiss!1305) (currentBit!5068 thiss!1305))) lt!154260)))

(declare-fun b!104870 () Bool)

(declare-fun lt!154261 () (_ BitVec 64))

(declare-fun lt!154258 () (_ BitVec 64))

(assert (=> b!104870 (= e!68682 (= (bitIndex!0 (size!2222 (buf!2588 (_2!4566 (increaseBitIndex!0 (BitStream!3919 (buf!2588 (_2!4566 lt!152813)) (currentByte!5073 thiss!1305) (currentBit!5068 thiss!1305)))))) (currentByte!5073 (_2!4566 (increaseBitIndex!0 (BitStream!3919 (buf!2588 (_2!4566 lt!152813)) (currentByte!5073 thiss!1305) (currentBit!5068 thiss!1305))))) (currentBit!5068 (_2!4566 (increaseBitIndex!0 (BitStream!3919 (buf!2588 (_2!4566 lt!152813)) (currentByte!5073 thiss!1305) (currentBit!5068 thiss!1305)))))) (bvadd lt!154261 lt!154258)))))

(assert (=> b!104870 (or (not (= (bvand lt!154261 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!154258 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!154261 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!154261 lt!154258) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!104870 (= lt!154258 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!104870 (= lt!154261 (bitIndex!0 (size!2222 (buf!2588 (BitStream!3919 (buf!2588 (_2!4566 lt!152813)) (currentByte!5073 thiss!1305) (currentBit!5068 thiss!1305)))) (currentByte!5073 (BitStream!3919 (buf!2588 (_2!4566 lt!152813)) (currentByte!5073 thiss!1305) (currentBit!5068 thiss!1305))) (currentBit!5068 (BitStream!3919 (buf!2588 (_2!4566 lt!152813)) (currentByte!5073 thiss!1305) (currentBit!5068 thiss!1305)))))))

(declare-fun lt!154257 () Bool)

(assert (=> b!104870 (= lt!154257 (not (= (bvand ((_ sign_extend 24) (select (arr!2815 (buf!2588 (BitStream!3919 (buf!2588 (_2!4566 lt!152813)) (currentByte!5073 thiss!1305) (currentBit!5068 thiss!1305)))) (currentByte!5073 (BitStream!3919 (buf!2588 (_2!4566 lt!152813)) (currentByte!5073 thiss!1305) (currentBit!5068 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5068 (BitStream!3919 (buf!2588 (_2!4566 lt!152813)) (currentByte!5073 thiss!1305) (currentBit!5068 thiss!1305)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!154259 () Bool)

(assert (=> b!104870 (= lt!154259 (not (= (bvand ((_ sign_extend 24) (select (arr!2815 (buf!2588 (BitStream!3919 (buf!2588 (_2!4566 lt!152813)) (currentByte!5073 thiss!1305) (currentBit!5068 thiss!1305)))) (currentByte!5073 (BitStream!3919 (buf!2588 (_2!4566 lt!152813)) (currentByte!5073 thiss!1305) (currentBit!5068 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5068 (BitStream!3919 (buf!2588 (_2!4566 lt!152813)) (currentByte!5073 thiss!1305) (currentBit!5068 thiss!1305)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!154256 () Bool)

(assert (=> b!104870 (= lt!154256 (not (= (bvand ((_ sign_extend 24) (select (arr!2815 (buf!2588 (BitStream!3919 (buf!2588 (_2!4566 lt!152813)) (currentByte!5073 thiss!1305) (currentBit!5068 thiss!1305)))) (currentByte!5073 (BitStream!3919 (buf!2588 (_2!4566 lt!152813)) (currentByte!5073 thiss!1305) (currentBit!5068 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5068 (BitStream!3919 (buf!2588 (_2!4566 lt!152813)) (currentByte!5073 thiss!1305) (currentBit!5068 thiss!1305)))))) #b00000000000000000000000000000000)))))

(assert (= (and d!32678 res!86347) b!104870))

(declare-fun m!153755 () Bool)

(assert (=> d!32678 m!153755))

(declare-fun m!153757 () Bool)

(assert (=> d!32678 m!153757))

(declare-fun m!153759 () Bool)

(assert (=> d!32678 m!153759))

(declare-fun m!153761 () Bool)

(assert (=> d!32678 m!153761))

(assert (=> b!104870 m!153757))

(declare-fun m!153763 () Bool)

(assert (=> b!104870 m!153763))

(assert (=> b!104870 m!153755))

(assert (=> b!104870 m!153759))

(declare-fun m!153765 () Bool)

(assert (=> b!104870 m!153765))

(assert (=> d!32330 d!32678))

(declare-fun d!32680 () Bool)

(declare-fun res!86349 () Bool)

(declare-fun e!68684 () Bool)

(assert (=> d!32680 (=> (not res!86349) (not e!68684))))

(assert (=> d!32680 (= res!86349 (= (size!2222 (buf!2588 (_1!4568 lt!152988))) (size!2222 (buf!2588 thiss!1305))))))

(assert (=> d!32680 (= (isPrefixOf!0 (_1!4568 lt!152988) thiss!1305) e!68684)))

(declare-fun b!104871 () Bool)

(declare-fun res!86348 () Bool)

(assert (=> b!104871 (=> (not res!86348) (not e!68684))))

(assert (=> b!104871 (= res!86348 (bvsle (bitIndex!0 (size!2222 (buf!2588 (_1!4568 lt!152988))) (currentByte!5073 (_1!4568 lt!152988)) (currentBit!5068 (_1!4568 lt!152988))) (bitIndex!0 (size!2222 (buf!2588 thiss!1305)) (currentByte!5073 thiss!1305) (currentBit!5068 thiss!1305))))))

(declare-fun b!104872 () Bool)

(declare-fun e!68683 () Bool)

(assert (=> b!104872 (= e!68684 e!68683)))

(declare-fun res!86350 () Bool)

(assert (=> b!104872 (=> res!86350 e!68683)))

(assert (=> b!104872 (= res!86350 (= (size!2222 (buf!2588 (_1!4568 lt!152988))) #b00000000000000000000000000000000))))

(declare-fun b!104873 () Bool)

(assert (=> b!104873 (= e!68683 (arrayBitRangesEq!0 (buf!2588 (_1!4568 lt!152988)) (buf!2588 thiss!1305) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2222 (buf!2588 (_1!4568 lt!152988))) (currentByte!5073 (_1!4568 lt!152988)) (currentBit!5068 (_1!4568 lt!152988)))))))

(assert (= (and d!32680 res!86349) b!104871))

(assert (= (and b!104871 res!86348) b!104872))

(assert (= (and b!104872 (not res!86350)) b!104873))

(assert (=> b!104871 m!153419))

(assert (=> b!104871 m!152441))

(assert (=> b!104873 m!153419))

(assert (=> b!104873 m!153419))

(declare-fun m!153767 () Bool)

(assert (=> b!104873 m!153767))

(assert (=> b!104334 d!32680))

(assert (=> d!32358 d!32324))

(declare-fun d!32682 () Bool)

(assert (=> d!32682 (validate_offset_bits!1 ((_ sign_extend 32) (size!2222 (buf!2588 (_2!4566 lt!152813)))) ((_ sign_extend 32) (currentByte!5073 thiss!1305)) ((_ sign_extend 32) (currentBit!5068 thiss!1305)) lt!152807)))

(assert (=> d!32682 true))

(declare-fun _$6!229 () Unit!6388)

(assert (=> d!32682 (= (choose!9 thiss!1305 (buf!2588 (_2!4566 lt!152813)) lt!152807 (BitStream!3919 (buf!2588 (_2!4566 lt!152813)) (currentByte!5073 thiss!1305) (currentBit!5068 thiss!1305))) _$6!229)))

(declare-fun bs!8003 () Bool)

(assert (= bs!8003 d!32682))

(assert (=> bs!8003 m!152407))

(assert (=> d!32358 d!32682))

(check-sat (not d!32632) (not b!104673) (not d!32512) (not d!32586) (not b!104767) (not d!32524) (not b!104825) (not b!104820) (not bm!1304) (not d!32650) (not d!32500) (not b!104847) (not b!104857) (not d!32682) (not d!32526) (not d!32560) (not d!32502) (not b!104701) (not d!32476) (not bm!1302) (not b!104672) (not d!32630) (not b!104651) (not d!32602) (not d!32528) (not b!104634) (not b!104734) (not d!32566) (not b!104808) (not b!104768) (not d!32622) (not d!32580) (not d!32670) (not d!32486) (not b!104797) (not d!32662) (not b!104837) (not d!32492) (not b!104801) (not d!32544) (not b!104793) (not d!32640) (not b!104691) (not b!104639) (not d!32656) (not d!32542) (not b!104761) (not d!32614) (not b!104795) (not b!104822) (not b!104716) (not d!32482) (not b!104834) (not b!104670) (not b!104762) (not d!32532) (not d!32612) (not b!104774) (not b!104746) (not d!32628) (not b!104704) (not d!32462) (not b!104869) (not b!104809) (not b!104764) (not b!104817) (not b!104699) (not d!32550) (not d!32576) (not d!32522) (not b!104799) (not d!32584) (not d!32546) (not d!32620) (not b!104871) (not b!104850) (not b!104812) (not d!32604) (not b!104854) (not b!104838) (not b!104736) (not b!104770) (not b!104649) (not bm!1303) (not b!104778) (not d!32674) (not b!104835) (not b!104815) (not b!104742) (not d!32648) (not b!104771) (not d!32508) (not b!104792) (not d!32618) (not d!32642) (not b!104823) (not d!32478) (not d!32568) (not b!104693) (not b!104840) (not b!104646) (not b!104674) (not b!104660) (not bm!1301) (not d!32638) (not d!32672) (not b!104777) (not d!32498) (not d!32548) (not b!104696) (not b!104733) (not b!104760) (not d!32592) (not b!104765) (not b!104740) (not b!104645) (not b!104773) (not b!104785) (not d!32606) (not b!104637) (not d!32556) (not b!104870) (not d!32668) (not b!104718) (not b!104843) (not b!104845) (not d!32558) (not b!104636) (not b!104839) (not d!32678) (not d!32496) (not d!32634) (not d!32460) (not b!104669) (not d!32534) (not b!104873) (not b!104702) (not b!104643) (not b!104844) (not b!104738) (not b!104819) (not d!32644) (not b!104763) (not d!32624) (not d!32608) (not b!104810) (not b!104790) (not b!104787) (not b!104642) (not b!104852) (not b!104811) (not d!32658) (not d!32654) (not d!32484) (not b!104814) (not b!104867) (not d!32474) (not d!32516) (not b!104784) (not b!104780) (not b!104668) (not b!104818) (not b!104806) (not d!32504) (not bm!1300) (not b!104782) (not b!104648) (not b!104640) (not d!32626) (not b!104842) (not b!104776) (not d!32636) (not b!104665))
