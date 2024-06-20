; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3420 () Bool)

(assert start!3420)

(declare-fun b!14895 () Bool)

(declare-fun res!13912 () Bool)

(declare-fun e!9321 () Bool)

(assert (=> b!14895 (=> (not res!13912) (not e!9321))))

(declare-datatypes ((array!884 0))(
  ( (array!885 (arr!803 (Array (_ BitVec 32) (_ BitVec 8))) (size!374 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!708 0))(
  ( (BitStream!709 (buf!728 array!884) (currentByte!1885 (_ BitVec 32)) (currentBit!1880 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!1233 0))(
  ( (Unit!1234) )
))
(declare-datatypes ((tuple2!1712 0))(
  ( (tuple2!1713 (_1!917 Unit!1233) (_2!917 BitStream!708)) )
))
(declare-fun lt!22516 () tuple2!1712)

(declare-fun thiss!1073 () BitStream!708)

(declare-fun nBits!313 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!14895 (= res!13912 (= (bitIndex!0 (size!374 (buf!728 (_2!917 lt!22516))) (currentByte!1885 (_2!917 lt!22516)) (currentBit!1880 (_2!917 lt!22516))) (bvadd (bitIndex!0 (size!374 (buf!728 thiss!1073)) (currentByte!1885 thiss!1073) (currentBit!1880 thiss!1073)) nBits!313)))))

(declare-fun b!14896 () Bool)

(declare-fun e!9322 () Bool)

(declare-fun array_inv!363 (array!884) Bool)

(assert (=> b!14896 (= e!9322 (array_inv!363 (buf!728 thiss!1073)))))

(declare-fun b!14897 () Bool)

(declare-datatypes ((tuple2!1714 0))(
  ( (tuple2!1715 (_1!918 BitStream!708) (_2!918 Bool)) )
))
(declare-fun lt!22513 () tuple2!1714)

(declare-datatypes ((tuple2!1716 0))(
  ( (tuple2!1717 (_1!919 BitStream!708) (_2!919 BitStream!708)) )
))
(declare-fun lt!22515 () tuple2!1716)

(assert (=> b!14897 (= e!9321 (not (or (not (_2!918 lt!22513)) (not (= (_1!918 lt!22513) (_2!919 lt!22515))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!708 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!1714)

(assert (=> b!14897 (= lt!22513 (checkBitsLoopPure!0 (_1!919 lt!22515) nBits!313 true #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!14897 (validate_offset_bits!1 ((_ sign_extend 32) (size!374 (buf!728 (_2!917 lt!22516)))) ((_ sign_extend 32) (currentByte!1885 thiss!1073)) ((_ sign_extend 32) (currentBit!1880 thiss!1073)) nBits!313)))

(declare-fun lt!22514 () Unit!1233)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!708 array!884 (_ BitVec 64)) Unit!1233)

(assert (=> b!14897 (= lt!22514 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1073 (buf!728 (_2!917 lt!22516)) nBits!313))))

(declare-fun reader!0 (BitStream!708 BitStream!708) tuple2!1716)

(assert (=> b!14897 (= lt!22515 (reader!0 thiss!1073 (_2!917 lt!22516)))))

(declare-fun b!14898 () Bool)

(declare-fun e!9323 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!14898 (= e!9323 (not (invariant!0 (currentBit!1880 thiss!1073) (currentByte!1885 thiss!1073) (size!374 (buf!728 thiss!1073)))))))

(assert (=> b!14898 e!9321))

(declare-fun res!13910 () Bool)

(assert (=> b!14898 (=> (not res!13910) (not e!9321))))

(assert (=> b!14898 (= res!13910 (= (size!374 (buf!728 thiss!1073)) (size!374 (buf!728 (_2!917 lt!22516)))))))

(declare-fun appendNBits!0 (BitStream!708 (_ BitVec 64) Bool) tuple2!1712)

(assert (=> b!14898 (= lt!22516 (appendNBits!0 thiss!1073 nBits!313 true))))

(declare-fun res!13913 () Bool)

(assert (=> start!3420 (=> (not res!13913) (not e!9323))))

(assert (=> start!3420 (= res!13913 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!313) (bvsle nBits!313 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!3420 e!9323))

(assert (=> start!3420 true))

(declare-fun inv!12 (BitStream!708) Bool)

(assert (=> start!3420 (and (inv!12 thiss!1073) e!9322)))

(declare-fun b!14899 () Bool)

(declare-fun res!13911 () Bool)

(assert (=> b!14899 (=> (not res!13911) (not e!9321))))

(declare-fun isPrefixOf!0 (BitStream!708 BitStream!708) Bool)

(assert (=> b!14899 (= res!13911 (isPrefixOf!0 thiss!1073 (_2!917 lt!22516)))))

(declare-fun b!14900 () Bool)

(declare-fun res!13909 () Bool)

(assert (=> b!14900 (=> (not res!13909) (not e!9323))))

(assert (=> b!14900 (= res!13909 (validate_offset_bits!1 ((_ sign_extend 32) (size!374 (buf!728 thiss!1073))) ((_ sign_extend 32) (currentByte!1885 thiss!1073)) ((_ sign_extend 32) (currentBit!1880 thiss!1073)) nBits!313))))

(assert (= (and start!3420 res!13913) b!14900))

(assert (= (and b!14900 res!13909) b!14898))

(assert (= (and b!14898 res!13910) b!14895))

(assert (= (and b!14895 res!13912) b!14899))

(assert (= (and b!14899 res!13911) b!14897))

(assert (= start!3420 b!14896))

(declare-fun m!21399 () Bool)

(assert (=> b!14900 m!21399))

(declare-fun m!21401 () Bool)

(assert (=> b!14898 m!21401))

(declare-fun m!21403 () Bool)

(assert (=> b!14898 m!21403))

(declare-fun m!21405 () Bool)

(assert (=> b!14895 m!21405))

(declare-fun m!21407 () Bool)

(assert (=> b!14895 m!21407))

(declare-fun m!21409 () Bool)

(assert (=> start!3420 m!21409))

(declare-fun m!21411 () Bool)

(assert (=> b!14897 m!21411))

(declare-fun m!21413 () Bool)

(assert (=> b!14897 m!21413))

(declare-fun m!21415 () Bool)

(assert (=> b!14897 m!21415))

(declare-fun m!21417 () Bool)

(assert (=> b!14897 m!21417))

(declare-fun m!21419 () Bool)

(assert (=> b!14899 m!21419))

(declare-fun m!21421 () Bool)

(assert (=> b!14896 m!21421))

(check-sat (not b!14900) (not start!3420) (not b!14897) (not b!14898) (not b!14899) (not b!14895) (not b!14896))
(check-sat)
(get-model)

(declare-fun d!4920 () Bool)

(assert (=> d!4920 (= (invariant!0 (currentBit!1880 thiss!1073) (currentByte!1885 thiss!1073) (size!374 (buf!728 thiss!1073))) (and (bvsge (currentBit!1880 thiss!1073) #b00000000000000000000000000000000) (bvslt (currentBit!1880 thiss!1073) #b00000000000000000000000000001000) (bvsge (currentByte!1885 thiss!1073) #b00000000000000000000000000000000) (or (bvslt (currentByte!1885 thiss!1073) (size!374 (buf!728 thiss!1073))) (and (= (currentBit!1880 thiss!1073) #b00000000000000000000000000000000) (= (currentByte!1885 thiss!1073) (size!374 (buf!728 thiss!1073)))))))))

(assert (=> b!14898 d!4920))

(declare-fun b!14945 () Bool)

(declare-fun res!13956 () Bool)

(declare-fun e!9351 () Bool)

(assert (=> b!14945 (=> (not res!13956) (not e!9351))))

(declare-fun lt!22573 () tuple2!1712)

(assert (=> b!14945 (= res!13956 (isPrefixOf!0 thiss!1073 (_2!917 lt!22573)))))

(declare-fun d!4924 () Bool)

(assert (=> d!4924 e!9351))

(declare-fun res!13957 () Bool)

(assert (=> d!4924 (=> (not res!13957) (not e!9351))))

(assert (=> d!4924 (= res!13957 (= (size!374 (buf!728 thiss!1073)) (size!374 (buf!728 (_2!917 lt!22573)))))))

(declare-fun choose!36 (BitStream!708 (_ BitVec 64) Bool) tuple2!1712)

(assert (=> d!4924 (= lt!22573 (choose!36 thiss!1073 nBits!313 true))))

(assert (=> d!4924 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!313) (bvsle nBits!313 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!4924 (= (appendNBits!0 thiss!1073 nBits!313 true) lt!22573)))

(declare-fun b!14946 () Bool)

(declare-fun lt!22572 () tuple2!1714)

(declare-fun lt!22571 () tuple2!1716)

(assert (=> b!14946 (= e!9351 (and (_2!918 lt!22572) (= (_1!918 lt!22572) (_2!919 lt!22571))))))

(assert (=> b!14946 (= lt!22572 (checkBitsLoopPure!0 (_1!919 lt!22571) nBits!313 true #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!22574 () Unit!1233)

(declare-fun lt!22575 () Unit!1233)

(assert (=> b!14946 (= lt!22574 lt!22575)))

(assert (=> b!14946 (validate_offset_bits!1 ((_ sign_extend 32) (size!374 (buf!728 (_2!917 lt!22573)))) ((_ sign_extend 32) (currentByte!1885 thiss!1073)) ((_ sign_extend 32) (currentBit!1880 thiss!1073)) nBits!313)))

(assert (=> b!14946 (= lt!22575 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1073 (buf!728 (_2!917 lt!22573)) nBits!313))))

(declare-fun e!9352 () Bool)

(assert (=> b!14946 e!9352))

(declare-fun res!13954 () Bool)

(assert (=> b!14946 (=> (not res!13954) (not e!9352))))

(assert (=> b!14946 (= res!13954 (and (= (size!374 (buf!728 thiss!1073)) (size!374 (buf!728 (_2!917 lt!22573)))) (bvsge nBits!313 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!14946 (= lt!22571 (reader!0 thiss!1073 (_2!917 lt!22573)))))

(declare-fun b!14947 () Bool)

(assert (=> b!14947 (= e!9352 (validate_offset_bits!1 ((_ sign_extend 32) (size!374 (buf!728 thiss!1073))) ((_ sign_extend 32) (currentByte!1885 thiss!1073)) ((_ sign_extend 32) (currentBit!1880 thiss!1073)) nBits!313))))

(declare-fun b!14944 () Bool)

(declare-fun res!13955 () Bool)

(assert (=> b!14944 (=> (not res!13955) (not e!9351))))

(declare-fun lt!22576 () (_ BitVec 64))

(assert (=> b!14944 (= res!13955 (= (bitIndex!0 (size!374 (buf!728 (_2!917 lt!22573))) (currentByte!1885 (_2!917 lt!22573)) (currentBit!1880 (_2!917 lt!22573))) (bvadd lt!22576 nBits!313)))))

(assert (=> b!14944 (or (not (= (bvand lt!22576 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!313 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!22576 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!22576 nBits!313) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!14944 (= lt!22576 (bitIndex!0 (size!374 (buf!728 thiss!1073)) (currentByte!1885 thiss!1073) (currentBit!1880 thiss!1073)))))

(assert (= (and d!4924 res!13957) b!14944))

(assert (= (and b!14944 res!13955) b!14945))

(assert (= (and b!14945 res!13956) b!14946))

(assert (= (and b!14946 res!13954) b!14947))

(assert (=> b!14947 m!21399))

(declare-fun m!21461 () Bool)

(assert (=> b!14944 m!21461))

(assert (=> b!14944 m!21407))

(declare-fun m!21463 () Bool)

(assert (=> d!4924 m!21463))

(declare-fun m!21465 () Bool)

(assert (=> b!14946 m!21465))

(declare-fun m!21467 () Bool)

(assert (=> b!14946 m!21467))

(declare-fun m!21469 () Bool)

(assert (=> b!14946 m!21469))

(declare-fun m!21471 () Bool)

(assert (=> b!14946 m!21471))

(declare-fun m!21473 () Bool)

(assert (=> b!14945 m!21473))

(assert (=> b!14898 d!4924))

(declare-fun d!4948 () Bool)

(assert (=> d!4948 (= (inv!12 thiss!1073) (invariant!0 (currentBit!1880 thiss!1073) (currentByte!1885 thiss!1073) (size!374 (buf!728 thiss!1073))))))

(declare-fun bs!1364 () Bool)

(assert (= bs!1364 d!4948))

(assert (=> bs!1364 m!21401))

(assert (=> start!3420 d!4948))

(declare-fun d!4950 () Bool)

(assert (=> d!4950 (= (array_inv!363 (buf!728 thiss!1073)) (bvsge (size!374 (buf!728 thiss!1073)) #b00000000000000000000000000000000))))

(assert (=> b!14896 d!4950))

(declare-fun d!4952 () Bool)

(declare-datatypes ((tuple2!1724 0))(
  ( (tuple2!1725 (_1!923 Bool) (_2!923 BitStream!708)) )
))
(declare-fun lt!22591 () tuple2!1724)

(declare-fun checkBitsLoop!0 (BitStream!708 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!1724)

(assert (=> d!4952 (= lt!22591 (checkBitsLoop!0 (_1!919 lt!22515) nBits!313 true #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!4952 (= (checkBitsLoopPure!0 (_1!919 lt!22515) nBits!313 true #b0000000000000000000000000000000000000000000000000000000000000000) (tuple2!1715 (_2!923 lt!22591) (_1!923 lt!22591)))))

(declare-fun bs!1365 () Bool)

(assert (= bs!1365 d!4952))

(declare-fun m!21475 () Bool)

(assert (=> bs!1365 m!21475))

(assert (=> b!14897 d!4952))

(declare-fun d!4954 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!4954 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!374 (buf!728 (_2!917 lt!22516)))) ((_ sign_extend 32) (currentByte!1885 thiss!1073)) ((_ sign_extend 32) (currentBit!1880 thiss!1073)) nBits!313) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!374 (buf!728 (_2!917 lt!22516)))) ((_ sign_extend 32) (currentByte!1885 thiss!1073)) ((_ sign_extend 32) (currentBit!1880 thiss!1073))) nBits!313))))

(declare-fun bs!1366 () Bool)

(assert (= bs!1366 d!4954))

(declare-fun m!21477 () Bool)

(assert (=> bs!1366 m!21477))

(assert (=> b!14897 d!4954))

(declare-fun d!4956 () Bool)

(assert (=> d!4956 (validate_offset_bits!1 ((_ sign_extend 32) (size!374 (buf!728 (_2!917 lt!22516)))) ((_ sign_extend 32) (currentByte!1885 thiss!1073)) ((_ sign_extend 32) (currentBit!1880 thiss!1073)) nBits!313)))

(declare-fun lt!22600 () Unit!1233)

(declare-fun choose!9 (BitStream!708 array!884 (_ BitVec 64) BitStream!708) Unit!1233)

(assert (=> d!4956 (= lt!22600 (choose!9 thiss!1073 (buf!728 (_2!917 lt!22516)) nBits!313 (BitStream!709 (buf!728 (_2!917 lt!22516)) (currentByte!1885 thiss!1073) (currentBit!1880 thiss!1073))))))

(assert (=> d!4956 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1073 (buf!728 (_2!917 lt!22516)) nBits!313) lt!22600)))

(declare-fun bs!1368 () Bool)

(assert (= bs!1368 d!4956))

(assert (=> bs!1368 m!21413))

(declare-fun m!21493 () Bool)

(assert (=> bs!1368 m!21493))

(assert (=> b!14897 d!4956))

(declare-fun b!15002 () Bool)

(declare-fun res!14004 () Bool)

(declare-fun e!9379 () Bool)

(assert (=> b!15002 (=> (not res!14004) (not e!9379))))

(declare-fun lt!22748 () tuple2!1716)

(assert (=> b!15002 (= res!14004 (isPrefixOf!0 (_1!919 lt!22748) thiss!1073))))

(declare-fun b!15003 () Bool)

(declare-fun e!9380 () Unit!1233)

(declare-fun Unit!1237 () Unit!1233)

(assert (=> b!15003 (= e!9380 Unit!1237)))

(declare-fun d!4962 () Bool)

(assert (=> d!4962 e!9379))

(declare-fun res!14003 () Bool)

(assert (=> d!4962 (=> (not res!14003) (not e!9379))))

(assert (=> d!4962 (= res!14003 (isPrefixOf!0 (_1!919 lt!22748) (_2!919 lt!22748)))))

(declare-fun lt!22737 () BitStream!708)

(assert (=> d!4962 (= lt!22748 (tuple2!1717 lt!22737 (_2!917 lt!22516)))))

(declare-fun lt!22735 () Unit!1233)

(declare-fun lt!22749 () Unit!1233)

(assert (=> d!4962 (= lt!22735 lt!22749)))

(assert (=> d!4962 (isPrefixOf!0 lt!22737 (_2!917 lt!22516))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!708 BitStream!708 BitStream!708) Unit!1233)

(assert (=> d!4962 (= lt!22749 (lemmaIsPrefixTransitive!0 lt!22737 (_2!917 lt!22516) (_2!917 lt!22516)))))

(declare-fun lt!22732 () Unit!1233)

(declare-fun lt!22736 () Unit!1233)

(assert (=> d!4962 (= lt!22732 lt!22736)))

(assert (=> d!4962 (isPrefixOf!0 lt!22737 (_2!917 lt!22516))))

(assert (=> d!4962 (= lt!22736 (lemmaIsPrefixTransitive!0 lt!22737 thiss!1073 (_2!917 lt!22516)))))

(declare-fun lt!22743 () Unit!1233)

(assert (=> d!4962 (= lt!22743 e!9380)))

(declare-fun c!1036 () Bool)

(assert (=> d!4962 (= c!1036 (not (= (size!374 (buf!728 thiss!1073)) #b00000000000000000000000000000000)))))

(declare-fun lt!22740 () Unit!1233)

(declare-fun lt!22742 () Unit!1233)

(assert (=> d!4962 (= lt!22740 lt!22742)))

(assert (=> d!4962 (isPrefixOf!0 (_2!917 lt!22516) (_2!917 lt!22516))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!708) Unit!1233)

(assert (=> d!4962 (= lt!22742 (lemmaIsPrefixRefl!0 (_2!917 lt!22516)))))

(declare-fun lt!22738 () Unit!1233)

(declare-fun lt!22750 () Unit!1233)

(assert (=> d!4962 (= lt!22738 lt!22750)))

(assert (=> d!4962 (= lt!22750 (lemmaIsPrefixRefl!0 (_2!917 lt!22516)))))

(declare-fun lt!22731 () Unit!1233)

(declare-fun lt!22739 () Unit!1233)

(assert (=> d!4962 (= lt!22731 lt!22739)))

(assert (=> d!4962 (isPrefixOf!0 lt!22737 lt!22737)))

(assert (=> d!4962 (= lt!22739 (lemmaIsPrefixRefl!0 lt!22737))))

(declare-fun lt!22747 () Unit!1233)

(declare-fun lt!22745 () Unit!1233)

(assert (=> d!4962 (= lt!22747 lt!22745)))

(assert (=> d!4962 (isPrefixOf!0 thiss!1073 thiss!1073)))

(assert (=> d!4962 (= lt!22745 (lemmaIsPrefixRefl!0 thiss!1073))))

(assert (=> d!4962 (= lt!22737 (BitStream!709 (buf!728 (_2!917 lt!22516)) (currentByte!1885 thiss!1073) (currentBit!1880 thiss!1073)))))

(assert (=> d!4962 (isPrefixOf!0 thiss!1073 (_2!917 lt!22516))))

(assert (=> d!4962 (= (reader!0 thiss!1073 (_2!917 lt!22516)) lt!22748)))

(declare-fun b!15004 () Bool)

(declare-fun res!14002 () Bool)

(assert (=> b!15004 (=> (not res!14002) (not e!9379))))

(assert (=> b!15004 (= res!14002 (isPrefixOf!0 (_2!919 lt!22748) (_2!917 lt!22516)))))

(declare-fun b!15005 () Bool)

(declare-fun lt!22741 () Unit!1233)

(assert (=> b!15005 (= e!9380 lt!22741)))

(declare-fun lt!22734 () (_ BitVec 64))

(assert (=> b!15005 (= lt!22734 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!22744 () (_ BitVec 64))

(assert (=> b!15005 (= lt!22744 (bitIndex!0 (size!374 (buf!728 thiss!1073)) (currentByte!1885 thiss!1073) (currentBit!1880 thiss!1073)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!884 array!884 (_ BitVec 64) (_ BitVec 64)) Unit!1233)

(assert (=> b!15005 (= lt!22741 (arrayBitRangesEqSymmetric!0 (buf!728 thiss!1073) (buf!728 (_2!917 lt!22516)) lt!22734 lt!22744))))

(declare-fun arrayBitRangesEq!0 (array!884 array!884 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!15005 (arrayBitRangesEq!0 (buf!728 (_2!917 lt!22516)) (buf!728 thiss!1073) lt!22734 lt!22744)))

(declare-fun b!15006 () Bool)

(declare-fun lt!22746 () (_ BitVec 64))

(declare-fun lt!22733 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!708 (_ BitVec 64)) BitStream!708)

(assert (=> b!15006 (= e!9379 (= (_1!919 lt!22748) (withMovedBitIndex!0 (_2!919 lt!22748) (bvsub lt!22746 lt!22733))))))

(assert (=> b!15006 (or (= (bvand lt!22746 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!22733 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!22746 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!22746 lt!22733) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!15006 (= lt!22733 (bitIndex!0 (size!374 (buf!728 (_2!917 lt!22516))) (currentByte!1885 (_2!917 lt!22516)) (currentBit!1880 (_2!917 lt!22516))))))

(assert (=> b!15006 (= lt!22746 (bitIndex!0 (size!374 (buf!728 thiss!1073)) (currentByte!1885 thiss!1073) (currentBit!1880 thiss!1073)))))

(assert (= (and d!4962 c!1036) b!15005))

(assert (= (and d!4962 (not c!1036)) b!15003))

(assert (= (and d!4962 res!14003) b!15002))

(assert (= (and b!15002 res!14004) b!15004))

(assert (= (and b!15004 res!14002) b!15006))

(declare-fun m!21539 () Bool)

(assert (=> b!15006 m!21539))

(assert (=> b!15006 m!21405))

(assert (=> b!15006 m!21407))

(assert (=> b!15005 m!21407))

(declare-fun m!21541 () Bool)

(assert (=> b!15005 m!21541))

(declare-fun m!21543 () Bool)

(assert (=> b!15005 m!21543))

(declare-fun m!21545 () Bool)

(assert (=> b!15004 m!21545))

(declare-fun m!21547 () Bool)

(assert (=> b!15002 m!21547))

(declare-fun m!21549 () Bool)

(assert (=> d!4962 m!21549))

(declare-fun m!21551 () Bool)

(assert (=> d!4962 m!21551))

(declare-fun m!21553 () Bool)

(assert (=> d!4962 m!21553))

(declare-fun m!21555 () Bool)

(assert (=> d!4962 m!21555))

(assert (=> d!4962 m!21419))

(declare-fun m!21557 () Bool)

(assert (=> d!4962 m!21557))

(declare-fun m!21559 () Bool)

(assert (=> d!4962 m!21559))

(declare-fun m!21561 () Bool)

(assert (=> d!4962 m!21561))

(declare-fun m!21563 () Bool)

(assert (=> d!4962 m!21563))

(declare-fun m!21565 () Bool)

(assert (=> d!4962 m!21565))

(declare-fun m!21567 () Bool)

(assert (=> d!4962 m!21567))

(assert (=> b!14897 d!4962))

(declare-fun d!4984 () Bool)

(declare-fun e!9383 () Bool)

(assert (=> d!4984 e!9383))

(declare-fun res!14009 () Bool)

(assert (=> d!4984 (=> (not res!14009) (not e!9383))))

(declare-fun lt!22763 () (_ BitVec 64))

(declare-fun lt!22767 () (_ BitVec 64))

(declare-fun lt!22765 () (_ BitVec 64))

(assert (=> d!4984 (= res!14009 (= lt!22763 (bvsub lt!22765 lt!22767)))))

(assert (=> d!4984 (or (= (bvand lt!22765 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!22767 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!22765 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!22765 lt!22767) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!4984 (= lt!22767 (remainingBits!0 ((_ sign_extend 32) (size!374 (buf!728 (_2!917 lt!22516)))) ((_ sign_extend 32) (currentByte!1885 (_2!917 lt!22516))) ((_ sign_extend 32) (currentBit!1880 (_2!917 lt!22516)))))))

(declare-fun lt!22764 () (_ BitVec 64))

(declare-fun lt!22766 () (_ BitVec 64))

(assert (=> d!4984 (= lt!22765 (bvmul lt!22764 lt!22766))))

(assert (=> d!4984 (or (= lt!22764 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!22766 (bvsdiv (bvmul lt!22764 lt!22766) lt!22764)))))

(assert (=> d!4984 (= lt!22766 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!4984 (= lt!22764 ((_ sign_extend 32) (size!374 (buf!728 (_2!917 lt!22516)))))))

(assert (=> d!4984 (= lt!22763 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1885 (_2!917 lt!22516))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1880 (_2!917 lt!22516)))))))

(assert (=> d!4984 (invariant!0 (currentBit!1880 (_2!917 lt!22516)) (currentByte!1885 (_2!917 lt!22516)) (size!374 (buf!728 (_2!917 lt!22516))))))

(assert (=> d!4984 (= (bitIndex!0 (size!374 (buf!728 (_2!917 lt!22516))) (currentByte!1885 (_2!917 lt!22516)) (currentBit!1880 (_2!917 lt!22516))) lt!22763)))

(declare-fun b!15011 () Bool)

(declare-fun res!14010 () Bool)

(assert (=> b!15011 (=> (not res!14010) (not e!9383))))

(assert (=> b!15011 (= res!14010 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!22763))))

(declare-fun b!15012 () Bool)

(declare-fun lt!22768 () (_ BitVec 64))

(assert (=> b!15012 (= e!9383 (bvsle lt!22763 (bvmul lt!22768 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!15012 (or (= lt!22768 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!22768 #b0000000000000000000000000000000000000000000000000000000000001000) lt!22768)))))

(assert (=> b!15012 (= lt!22768 ((_ sign_extend 32) (size!374 (buf!728 (_2!917 lt!22516)))))))

(assert (= (and d!4984 res!14009) b!15011))

(assert (= (and b!15011 res!14010) b!15012))

(declare-fun m!21569 () Bool)

(assert (=> d!4984 m!21569))

(declare-fun m!21571 () Bool)

(assert (=> d!4984 m!21571))

(assert (=> b!14895 d!4984))

(declare-fun d!4986 () Bool)

(declare-fun e!9384 () Bool)

(assert (=> d!4986 e!9384))

(declare-fun res!14011 () Bool)

(assert (=> d!4986 (=> (not res!14011) (not e!9384))))

(declare-fun lt!22769 () (_ BitVec 64))

(declare-fun lt!22771 () (_ BitVec 64))

(declare-fun lt!22773 () (_ BitVec 64))

(assert (=> d!4986 (= res!14011 (= lt!22769 (bvsub lt!22771 lt!22773)))))

(assert (=> d!4986 (or (= (bvand lt!22771 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!22773 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!22771 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!22771 lt!22773) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!4986 (= lt!22773 (remainingBits!0 ((_ sign_extend 32) (size!374 (buf!728 thiss!1073))) ((_ sign_extend 32) (currentByte!1885 thiss!1073)) ((_ sign_extend 32) (currentBit!1880 thiss!1073))))))

(declare-fun lt!22770 () (_ BitVec 64))

(declare-fun lt!22772 () (_ BitVec 64))

(assert (=> d!4986 (= lt!22771 (bvmul lt!22770 lt!22772))))

(assert (=> d!4986 (or (= lt!22770 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!22772 (bvsdiv (bvmul lt!22770 lt!22772) lt!22770)))))

(assert (=> d!4986 (= lt!22772 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!4986 (= lt!22770 ((_ sign_extend 32) (size!374 (buf!728 thiss!1073))))))

(assert (=> d!4986 (= lt!22769 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1885 thiss!1073)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1880 thiss!1073))))))

(assert (=> d!4986 (invariant!0 (currentBit!1880 thiss!1073) (currentByte!1885 thiss!1073) (size!374 (buf!728 thiss!1073)))))

(assert (=> d!4986 (= (bitIndex!0 (size!374 (buf!728 thiss!1073)) (currentByte!1885 thiss!1073) (currentBit!1880 thiss!1073)) lt!22769)))

(declare-fun b!15013 () Bool)

(declare-fun res!14012 () Bool)

(assert (=> b!15013 (=> (not res!14012) (not e!9384))))

(assert (=> b!15013 (= res!14012 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!22769))))

(declare-fun b!15014 () Bool)

(declare-fun lt!22774 () (_ BitVec 64))

(assert (=> b!15014 (= e!9384 (bvsle lt!22769 (bvmul lt!22774 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!15014 (or (= lt!22774 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!22774 #b0000000000000000000000000000000000000000000000000000000000001000) lt!22774)))))

(assert (=> b!15014 (= lt!22774 ((_ sign_extend 32) (size!374 (buf!728 thiss!1073))))))

(assert (= (and d!4986 res!14011) b!15013))

(assert (= (and b!15013 res!14012) b!15014))

(declare-fun m!21573 () Bool)

(assert (=> d!4986 m!21573))

(assert (=> d!4986 m!21401))

(assert (=> b!14895 d!4986))

(declare-fun d!4988 () Bool)

(assert (=> d!4988 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!374 (buf!728 thiss!1073))) ((_ sign_extend 32) (currentByte!1885 thiss!1073)) ((_ sign_extend 32) (currentBit!1880 thiss!1073)) nBits!313) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!374 (buf!728 thiss!1073))) ((_ sign_extend 32) (currentByte!1885 thiss!1073)) ((_ sign_extend 32) (currentBit!1880 thiss!1073))) nBits!313))))

(declare-fun bs!1373 () Bool)

(assert (= bs!1373 d!4988))

(assert (=> bs!1373 m!21573))

(assert (=> b!14900 d!4988))

(declare-fun d!4990 () Bool)

(declare-fun res!14028 () Bool)

(declare-fun e!9394 () Bool)

(assert (=> d!4990 (=> (not res!14028) (not e!9394))))

(assert (=> d!4990 (= res!14028 (= (size!374 (buf!728 thiss!1073)) (size!374 (buf!728 (_2!917 lt!22516)))))))

(assert (=> d!4990 (= (isPrefixOf!0 thiss!1073 (_2!917 lt!22516)) e!9394)))

(declare-fun b!15029 () Bool)

(declare-fun res!14027 () Bool)

(assert (=> b!15029 (=> (not res!14027) (not e!9394))))

(assert (=> b!15029 (= res!14027 (bvsle (bitIndex!0 (size!374 (buf!728 thiss!1073)) (currentByte!1885 thiss!1073) (currentBit!1880 thiss!1073)) (bitIndex!0 (size!374 (buf!728 (_2!917 lt!22516))) (currentByte!1885 (_2!917 lt!22516)) (currentBit!1880 (_2!917 lt!22516)))))))

(declare-fun b!15030 () Bool)

(declare-fun e!9393 () Bool)

(assert (=> b!15030 (= e!9394 e!9393)))

(declare-fun res!14029 () Bool)

(assert (=> b!15030 (=> res!14029 e!9393)))

(assert (=> b!15030 (= res!14029 (= (size!374 (buf!728 thiss!1073)) #b00000000000000000000000000000000))))

(declare-fun b!15031 () Bool)

(assert (=> b!15031 (= e!9393 (arrayBitRangesEq!0 (buf!728 thiss!1073) (buf!728 (_2!917 lt!22516)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!374 (buf!728 thiss!1073)) (currentByte!1885 thiss!1073) (currentBit!1880 thiss!1073))))))

(assert (= (and d!4990 res!14028) b!15029))

(assert (= (and b!15029 res!14027) b!15030))

(assert (= (and b!15030 (not res!14029)) b!15031))

(assert (=> b!15029 m!21407))

(assert (=> b!15029 m!21405))

(assert (=> b!15031 m!21407))

(assert (=> b!15031 m!21407))

(declare-fun m!21575 () Bool)

(assert (=> b!15031 m!21575))

(assert (=> b!14899 d!4990))

(check-sat (not b!15005) (not d!4986) (not b!15006) (not d!4954) (not d!4948) (not d!4984) (not b!14944) (not d!4956) (not b!15004) (not d!4962) (not b!15029) (not b!15002) (not b!14946) (not d!4952) (not b!14945) (not d!4988) (not b!14947) (not d!4924) (not b!15031))
