; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40544 () Bool)

(assert start!40544)

(declare-fun b!186237 () Bool)

(declare-fun res!155039 () Bool)

(declare-fun e!128881 () Bool)

(assert (=> b!186237 (=> res!155039 e!128881)))

(declare-datatypes ((array!9820 0))(
  ( (array!9821 (arr!5260 (Array (_ BitVec 32) (_ BitVec 8))) (size!4330 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7768 0))(
  ( (BitStream!7769 (buf!4793 array!9820) (currentByte!9043 (_ BitVec 32)) (currentBit!9038 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!13329 0))(
  ( (Unit!13330) )
))
(declare-datatypes ((tuple2!16108 0))(
  ( (tuple2!16109 (_1!8699 Unit!13329) (_2!8699 BitStream!7768)) )
))
(declare-fun lt!287708 () tuple2!16108)

(declare-fun lt!287724 () tuple2!16108)

(declare-fun isPrefixOf!0 (BitStream!7768 BitStream!7768) Bool)

(assert (=> b!186237 (= res!155039 (not (isPrefixOf!0 (_2!8699 lt!287708) (_2!8699 lt!287724))))))

(declare-fun b!186238 () Bool)

(declare-fun res!155048 () Bool)

(declare-fun e!128876 () Bool)

(assert (=> b!186238 (=> (not res!155048) (not e!128876))))

(declare-datatypes ((tuple2!16110 0))(
  ( (tuple2!16111 (_1!8700 BitStream!7768) (_2!8700 BitStream!7768)) )
))
(declare-fun lt!287723 () tuple2!16110)

(declare-fun lt!287726 () (_ BitVec 64))

(declare-fun lt!287721 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!7768 (_ BitVec 64)) BitStream!7768)

(assert (=> b!186238 (= res!155048 (= (_1!8700 lt!287723) (withMovedBitIndex!0 (_2!8700 lt!287723) (bvsub lt!287721 lt!287726))))))

(declare-fun b!186239 () Bool)

(declare-fun e!128880 () Bool)

(assert (=> b!186239 (= e!128881 e!128880)))

(declare-fun res!155042 () Bool)

(assert (=> b!186239 (=> res!155042 e!128880)))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun lt!287720 () tuple2!16110)

(declare-fun lt!287731 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-datatypes ((tuple2!16112 0))(
  ( (tuple2!16113 (_1!8701 BitStream!7768) (_2!8701 (_ BitVec 64))) )
))
(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7768 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16112)

(assert (=> b!186239 (= res!155042 (not (= (_1!8701 (readNBitsLSBFirstsLoopPure!0 (_1!8700 lt!287720) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!287731)) (_2!8700 lt!287720))))))

(declare-fun lt!287725 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!186239 (validate_offset_bits!1 ((_ sign_extend 32) (size!4330 (buf!4793 (_2!8699 lt!287724)))) ((_ sign_extend 32) (currentByte!9043 (_2!8699 lt!287708))) ((_ sign_extend 32) (currentBit!9038 (_2!8699 lt!287708))) lt!287725)))

(declare-fun lt!287718 () Unit!13329)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7768 array!9820 (_ BitVec 64)) Unit!13329)

(assert (=> b!186239 (= lt!287718 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8699 lt!287708) (buf!4793 (_2!8699 lt!287724)) lt!287725))))

(assert (=> b!186239 (= lt!287725 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!287713 () (_ BitVec 64))

(declare-fun lt!287715 () (_ BitVec 64))

(declare-datatypes ((tuple2!16114 0))(
  ( (tuple2!16115 (_1!8702 BitStream!7768) (_2!8702 Bool)) )
))
(declare-fun lt!287728 () tuple2!16114)

(assert (=> b!186239 (= lt!287731 (bvor lt!287715 (ite (_2!8702 lt!287728) lt!287713 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!287717 () tuple2!16112)

(assert (=> b!186239 (= lt!287717 (readNBitsLSBFirstsLoopPure!0 (_1!8700 lt!287723) nBits!348 i!590 lt!287715))))

(declare-fun thiss!1204 () BitStream!7768)

(declare-fun lt!287705 () (_ BitVec 64))

(assert (=> b!186239 (validate_offset_bits!1 ((_ sign_extend 32) (size!4330 (buf!4793 (_2!8699 lt!287724)))) ((_ sign_extend 32) (currentByte!9043 thiss!1204)) ((_ sign_extend 32) (currentBit!9038 thiss!1204)) lt!287705)))

(declare-fun lt!287710 () Unit!13329)

(assert (=> b!186239 (= lt!287710 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4793 (_2!8699 lt!287724)) lt!287705))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!186239 (= lt!287715 (bvand v!189 (onesLSBLong!0 i!590)))))

(declare-fun lt!287727 () Bool)

(assert (=> b!186239 (= (_2!8702 lt!287728) lt!287727)))

(declare-fun readBitPure!0 (BitStream!7768) tuple2!16114)

(assert (=> b!186239 (= lt!287728 (readBitPure!0 (_1!8700 lt!287723)))))

(declare-fun reader!0 (BitStream!7768 BitStream!7768) tuple2!16110)

(assert (=> b!186239 (= lt!287720 (reader!0 (_2!8699 lt!287708) (_2!8699 lt!287724)))))

(assert (=> b!186239 (= lt!287723 (reader!0 thiss!1204 (_2!8699 lt!287724)))))

(declare-fun e!128882 () Bool)

(assert (=> b!186239 e!128882))

(declare-fun res!155053 () Bool)

(assert (=> b!186239 (=> (not res!155053) (not e!128882))))

(declare-fun lt!287729 () tuple2!16114)

(declare-fun lt!287706 () tuple2!16114)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!186239 (= res!155053 (= (bitIndex!0 (size!4330 (buf!4793 (_1!8702 lt!287729))) (currentByte!9043 (_1!8702 lt!287729)) (currentBit!9038 (_1!8702 lt!287729))) (bitIndex!0 (size!4330 (buf!4793 (_1!8702 lt!287706))) (currentByte!9043 (_1!8702 lt!287706)) (currentBit!9038 (_1!8702 lt!287706)))))))

(declare-fun lt!287730 () Unit!13329)

(declare-fun lt!287711 () BitStream!7768)

(declare-fun readBitPrefixLemma!0 (BitStream!7768 BitStream!7768) Unit!13329)

(assert (=> b!186239 (= lt!287730 (readBitPrefixLemma!0 lt!287711 (_2!8699 lt!287724)))))

(assert (=> b!186239 (= lt!287706 (readBitPure!0 (BitStream!7769 (buf!4793 (_2!8699 lt!287724)) (currentByte!9043 thiss!1204) (currentBit!9038 thiss!1204))))))

(assert (=> b!186239 (= lt!287729 (readBitPure!0 lt!287711))))

(declare-fun e!128886 () Bool)

(assert (=> b!186239 e!128886))

(declare-fun res!155051 () Bool)

(assert (=> b!186239 (=> (not res!155051) (not e!128886))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!186239 (= res!155051 (invariant!0 (currentBit!9038 thiss!1204) (currentByte!9043 thiss!1204) (size!4330 (buf!4793 (_2!8699 lt!287708)))))))

(assert (=> b!186239 (= lt!287711 (BitStream!7769 (buf!4793 (_2!8699 lt!287708)) (currentByte!9043 thiss!1204) (currentBit!9038 thiss!1204)))))

(declare-fun res!155046 () Bool)

(declare-fun e!128884 () Bool)

(assert (=> start!40544 (=> (not res!155046) (not e!128884))))

(assert (=> start!40544 (= res!155046 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!40544 e!128884))

(assert (=> start!40544 true))

(declare-fun e!128887 () Bool)

(declare-fun inv!12 (BitStream!7768) Bool)

(assert (=> start!40544 (and (inv!12 thiss!1204) e!128887)))

(declare-fun b!186240 () Bool)

(declare-fun e!128879 () Bool)

(declare-fun e!128875 () Bool)

(assert (=> b!186240 (= e!128879 e!128875)))

(declare-fun res!155038 () Bool)

(assert (=> b!186240 (=> (not res!155038) (not e!128875))))

(declare-fun lt!287707 () (_ BitVec 64))

(declare-fun lt!287719 () (_ BitVec 64))

(assert (=> b!186240 (= res!155038 (= lt!287707 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!287719)))))

(assert (=> b!186240 (= lt!287707 (bitIndex!0 (size!4330 (buf!4793 (_2!8699 lt!287708))) (currentByte!9043 (_2!8699 lt!287708)) (currentBit!9038 (_2!8699 lt!287708))))))

(assert (=> b!186240 (= lt!287719 (bitIndex!0 (size!4330 (buf!4793 thiss!1204)) (currentByte!9043 thiss!1204) (currentBit!9038 thiss!1204)))))

(declare-fun b!186241 () Bool)

(declare-fun e!128877 () Bool)

(assert (=> b!186241 (= e!128884 e!128877)))

(declare-fun res!155049 () Bool)

(assert (=> b!186241 (=> (not res!155049) (not e!128877))))

(assert (=> b!186241 (= res!155049 (validate_offset_bits!1 ((_ sign_extend 32) (size!4330 (buf!4793 thiss!1204))) ((_ sign_extend 32) (currentByte!9043 thiss!1204)) ((_ sign_extend 32) (currentBit!9038 thiss!1204)) lt!287705))))

(assert (=> b!186241 (= lt!287705 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!186242 () Bool)

(declare-fun res!155041 () Bool)

(assert (=> b!186242 (=> res!155041 e!128881)))

(assert (=> b!186242 (= res!155041 (or (not (= (size!4330 (buf!4793 (_2!8699 lt!287724))) (size!4330 (buf!4793 thiss!1204)))) (not (= lt!287726 (bvsub (bvadd lt!287721 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!186243 () Bool)

(declare-fun res!155040 () Bool)

(assert (=> b!186243 (=> (not res!155040) (not e!128877))))

(assert (=> b!186243 (= res!155040 (not (= i!590 nBits!348)))))

(declare-fun b!186244 () Bool)

(declare-fun e!128883 () Bool)

(assert (=> b!186244 (= e!128875 e!128883)))

(declare-fun res!155044 () Bool)

(assert (=> b!186244 (=> (not res!155044) (not e!128883))))

(declare-fun lt!287716 () tuple2!16114)

(assert (=> b!186244 (= res!155044 (and (= (_2!8702 lt!287716) lt!287727) (= (_1!8702 lt!287716) (_2!8699 lt!287708))))))

(declare-fun readerFrom!0 (BitStream!7768 (_ BitVec 32) (_ BitVec 32)) BitStream!7768)

(assert (=> b!186244 (= lt!287716 (readBitPure!0 (readerFrom!0 (_2!8699 lt!287708) (currentBit!9038 thiss!1204) (currentByte!9043 thiss!1204))))))

(declare-fun b!186245 () Bool)

(assert (=> b!186245 (= e!128880 true)))

(assert (=> b!186245 e!128876))

(declare-fun res!155050 () Bool)

(assert (=> b!186245 (=> (not res!155050) (not e!128876))))

(declare-fun lt!287709 () tuple2!16112)

(assert (=> b!186245 (= res!155050 (and (= (_2!8701 lt!287717) (_2!8701 lt!287709)) (= (_1!8701 lt!287717) (_1!8701 lt!287709))))))

(declare-fun lt!287712 () Unit!13329)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7768 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13329)

(assert (=> b!186245 (= lt!287712 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8700 lt!287723) nBits!348 i!590 lt!287715))))

(assert (=> b!186245 (= lt!287709 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8700 lt!287723) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!287731))))

(declare-fun b!186246 () Bool)

(declare-fun res!155047 () Bool)

(assert (=> b!186246 (=> res!155047 e!128881)))

(assert (=> b!186246 (= res!155047 (not (isPrefixOf!0 thiss!1204 (_2!8699 lt!287708))))))

(declare-fun b!186247 () Bool)

(assert (=> b!186247 (= e!128883 (= (bitIndex!0 (size!4330 (buf!4793 (_1!8702 lt!287716))) (currentByte!9043 (_1!8702 lt!287716)) (currentBit!9038 (_1!8702 lt!287716))) lt!287707))))

(declare-fun b!186248 () Bool)

(assert (=> b!186248 (= e!128886 (invariant!0 (currentBit!9038 thiss!1204) (currentByte!9043 thiss!1204) (size!4330 (buf!4793 (_2!8699 lt!287724)))))))

(declare-fun b!186249 () Bool)

(declare-fun res!155055 () Bool)

(assert (=> b!186249 (=> (not res!155055) (not e!128877))))

(assert (=> b!186249 (= res!155055 (invariant!0 (currentBit!9038 thiss!1204) (currentByte!9043 thiss!1204) (size!4330 (buf!4793 thiss!1204))))))

(declare-fun b!186250 () Bool)

(declare-fun res!155054 () Bool)

(assert (=> b!186250 (=> res!155054 e!128881)))

(assert (=> b!186250 (= res!155054 (not (invariant!0 (currentBit!9038 (_2!8699 lt!287724)) (currentByte!9043 (_2!8699 lt!287724)) (size!4330 (buf!4793 (_2!8699 lt!287724))))))))

(declare-fun b!186251 () Bool)

(declare-fun e!128878 () Bool)

(assert (=> b!186251 (= e!128877 (not e!128878))))

(declare-fun res!155052 () Bool)

(assert (=> b!186251 (=> res!155052 e!128878)))

(declare-fun lt!287714 () (_ BitVec 64))

(assert (=> b!186251 (= res!155052 (not (= lt!287714 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!287721))))))

(assert (=> b!186251 (= lt!287714 (bitIndex!0 (size!4330 (buf!4793 (_2!8699 lt!287708))) (currentByte!9043 (_2!8699 lt!287708)) (currentBit!9038 (_2!8699 lt!287708))))))

(assert (=> b!186251 (= lt!287721 (bitIndex!0 (size!4330 (buf!4793 thiss!1204)) (currentByte!9043 thiss!1204) (currentBit!9038 thiss!1204)))))

(assert (=> b!186251 e!128879))

(declare-fun res!155037 () Bool)

(assert (=> b!186251 (=> (not res!155037) (not e!128879))))

(assert (=> b!186251 (= res!155037 (= (size!4330 (buf!4793 thiss!1204)) (size!4330 (buf!4793 (_2!8699 lt!287708)))))))

(declare-fun appendBit!0 (BitStream!7768 Bool) tuple2!16108)

(assert (=> b!186251 (= lt!287708 (appendBit!0 thiss!1204 lt!287727))))

(assert (=> b!186251 (= lt!287727 (not (= (bvand v!189 lt!287713) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!186251 (= lt!287713 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!186252 () Bool)

(declare-fun array_inv!4071 (array!9820) Bool)

(assert (=> b!186252 (= e!128887 (array_inv!4071 (buf!4793 thiss!1204)))))

(declare-fun b!186253 () Bool)

(assert (=> b!186253 (= e!128878 e!128881)))

(declare-fun res!155043 () Bool)

(assert (=> b!186253 (=> res!155043 e!128881)))

(assert (=> b!186253 (= res!155043 (not (= lt!287726 (bvsub (bvsub (bvadd lt!287714 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!186253 (= lt!287726 (bitIndex!0 (size!4330 (buf!4793 (_2!8699 lt!287724))) (currentByte!9043 (_2!8699 lt!287724)) (currentBit!9038 (_2!8699 lt!287724))))))

(assert (=> b!186253 (isPrefixOf!0 thiss!1204 (_2!8699 lt!287724))))

(declare-fun lt!287722 () Unit!13329)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7768 BitStream!7768 BitStream!7768) Unit!13329)

(assert (=> b!186253 (= lt!287722 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8699 lt!287708) (_2!8699 lt!287724)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7768 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!16108)

(assert (=> b!186253 (= lt!287724 (appendBitsLSBFirstLoopTR!0 (_2!8699 lt!287708) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!186254 () Bool)

(assert (=> b!186254 (= e!128876 (= (_1!8700 lt!287720) (withMovedBitIndex!0 (_2!8700 lt!287720) (bvsub lt!287714 lt!287726))))))

(declare-fun b!186255 () Bool)

(declare-fun res!155045 () Bool)

(assert (=> b!186255 (=> (not res!155045) (not e!128875))))

(assert (=> b!186255 (= res!155045 (isPrefixOf!0 thiss!1204 (_2!8699 lt!287708)))))

(declare-fun b!186256 () Bool)

(assert (=> b!186256 (= e!128882 (= (_2!8702 lt!287729) (_2!8702 lt!287706)))))

(assert (= (and start!40544 res!155046) b!186241))

(assert (= (and b!186241 res!155049) b!186249))

(assert (= (and b!186249 res!155055) b!186243))

(assert (= (and b!186243 res!155040) b!186251))

(assert (= (and b!186251 res!155037) b!186240))

(assert (= (and b!186240 res!155038) b!186255))

(assert (= (and b!186255 res!155045) b!186244))

(assert (= (and b!186244 res!155044) b!186247))

(assert (= (and b!186251 (not res!155052)) b!186253))

(assert (= (and b!186253 (not res!155043)) b!186250))

(assert (= (and b!186250 (not res!155054)) b!186242))

(assert (= (and b!186242 (not res!155041)) b!186237))

(assert (= (and b!186237 (not res!155039)) b!186246))

(assert (= (and b!186246 (not res!155047)) b!186239))

(assert (= (and b!186239 res!155051) b!186248))

(assert (= (and b!186239 res!155053) b!186256))

(assert (= (and b!186239 (not res!155042)) b!186245))

(assert (= (and b!186245 res!155050) b!186238))

(assert (= (and b!186238 res!155048) b!186254))

(assert (= start!40544 b!186252))

(declare-fun m!289573 () Bool)

(assert (=> b!186245 m!289573))

(declare-fun m!289575 () Bool)

(assert (=> b!186245 m!289575))

(assert (=> b!186245 m!289575))

(declare-fun m!289577 () Bool)

(assert (=> b!186245 m!289577))

(declare-fun m!289579 () Bool)

(assert (=> b!186246 m!289579))

(declare-fun m!289581 () Bool)

(assert (=> b!186239 m!289581))

(declare-fun m!289583 () Bool)

(assert (=> b!186239 m!289583))

(declare-fun m!289585 () Bool)

(assert (=> b!186239 m!289585))

(declare-fun m!289587 () Bool)

(assert (=> b!186239 m!289587))

(declare-fun m!289589 () Bool)

(assert (=> b!186239 m!289589))

(declare-fun m!289591 () Bool)

(assert (=> b!186239 m!289591))

(declare-fun m!289593 () Bool)

(assert (=> b!186239 m!289593))

(declare-fun m!289595 () Bool)

(assert (=> b!186239 m!289595))

(declare-fun m!289597 () Bool)

(assert (=> b!186239 m!289597))

(declare-fun m!289599 () Bool)

(assert (=> b!186239 m!289599))

(declare-fun m!289601 () Bool)

(assert (=> b!186239 m!289601))

(declare-fun m!289603 () Bool)

(assert (=> b!186239 m!289603))

(declare-fun m!289605 () Bool)

(assert (=> b!186239 m!289605))

(declare-fun m!289607 () Bool)

(assert (=> b!186239 m!289607))

(declare-fun m!289609 () Bool)

(assert (=> b!186239 m!289609))

(declare-fun m!289611 () Bool)

(assert (=> b!186239 m!289611))

(declare-fun m!289613 () Bool)

(assert (=> b!186252 m!289613))

(assert (=> b!186255 m!289579))

(declare-fun m!289615 () Bool)

(assert (=> b!186254 m!289615))

(declare-fun m!289617 () Bool)

(assert (=> b!186244 m!289617))

(assert (=> b!186244 m!289617))

(declare-fun m!289619 () Bool)

(assert (=> b!186244 m!289619))

(declare-fun m!289621 () Bool)

(assert (=> b!186250 m!289621))

(declare-fun m!289623 () Bool)

(assert (=> b!186240 m!289623))

(declare-fun m!289625 () Bool)

(assert (=> b!186240 m!289625))

(declare-fun m!289627 () Bool)

(assert (=> b!186241 m!289627))

(declare-fun m!289629 () Bool)

(assert (=> b!186253 m!289629))

(declare-fun m!289631 () Bool)

(assert (=> b!186253 m!289631))

(declare-fun m!289633 () Bool)

(assert (=> b!186253 m!289633))

(declare-fun m!289635 () Bool)

(assert (=> b!186253 m!289635))

(declare-fun m!289637 () Bool)

(assert (=> b!186248 m!289637))

(assert (=> b!186251 m!289623))

(assert (=> b!186251 m!289625))

(declare-fun m!289639 () Bool)

(assert (=> b!186251 m!289639))

(declare-fun m!289641 () Bool)

(assert (=> start!40544 m!289641))

(declare-fun m!289643 () Bool)

(assert (=> b!186247 m!289643))

(declare-fun m!289645 () Bool)

(assert (=> b!186237 m!289645))

(declare-fun m!289647 () Bool)

(assert (=> b!186249 m!289647))

(declare-fun m!289649 () Bool)

(assert (=> b!186238 m!289649))

(push 1)

