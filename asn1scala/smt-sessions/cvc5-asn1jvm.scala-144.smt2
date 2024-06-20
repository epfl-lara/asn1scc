; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3418 () Bool)

(assert start!3418)

(declare-fun b!14877 () Bool)

(declare-fun e!9309 () Bool)

(declare-datatypes ((array!882 0))(
  ( (array!883 (arr!802 (Array (_ BitVec 32) (_ BitVec 8))) (size!373 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!706 0))(
  ( (BitStream!707 (buf!727 array!882) (currentByte!1884 (_ BitVec 32)) (currentBit!1879 (_ BitVec 32))) )
))
(declare-fun thiss!1073 () BitStream!706)

(declare-fun array_inv!362 (array!882) Bool)

(assert (=> b!14877 (= e!9309 (array_inv!362 (buf!727 thiss!1073)))))

(declare-fun b!14878 () Bool)

(declare-fun res!13898 () Bool)

(declare-fun e!9310 () Bool)

(assert (=> b!14878 (=> (not res!13898) (not e!9310))))

(declare-fun nBits!313 () (_ BitVec 64))

(declare-datatypes ((Unit!1231 0))(
  ( (Unit!1232) )
))
(declare-datatypes ((tuple2!1706 0))(
  ( (tuple2!1707 (_1!914 Unit!1231) (_2!914 BitStream!706)) )
))
(declare-fun lt!22502 () tuple2!1706)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!14878 (= res!13898 (= (bitIndex!0 (size!373 (buf!727 (_2!914 lt!22502))) (currentByte!1884 (_2!914 lt!22502)) (currentBit!1879 (_2!914 lt!22502))) (bvadd (bitIndex!0 (size!373 (buf!727 thiss!1073)) (currentByte!1884 thiss!1073) (currentBit!1879 thiss!1073)) nBits!313)))))

(declare-fun b!14879 () Bool)

(declare-fun res!13897 () Bool)

(declare-fun e!9312 () Bool)

(assert (=> b!14879 (=> (not res!13897) (not e!9312))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!14879 (= res!13897 (validate_offset_bits!1 ((_ sign_extend 32) (size!373 (buf!727 thiss!1073))) ((_ sign_extend 32) (currentByte!1884 thiss!1073)) ((_ sign_extend 32) (currentBit!1879 thiss!1073)) nBits!313))))

(declare-fun res!13895 () Bool)

(assert (=> start!3418 (=> (not res!13895) (not e!9312))))

(assert (=> start!3418 (= res!13895 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!313) (bvsle nBits!313 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!3418 e!9312))

(assert (=> start!3418 true))

(declare-fun inv!12 (BitStream!706) Bool)

(assert (=> start!3418 (and (inv!12 thiss!1073) e!9309)))

(declare-fun b!14880 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!14880 (= e!9312 (not (invariant!0 (currentBit!1879 thiss!1073) (currentByte!1884 thiss!1073) (size!373 (buf!727 thiss!1073)))))))

(assert (=> b!14880 e!9310))

(declare-fun res!13894 () Bool)

(assert (=> b!14880 (=> (not res!13894) (not e!9310))))

(assert (=> b!14880 (= res!13894 (= (size!373 (buf!727 thiss!1073)) (size!373 (buf!727 (_2!914 lt!22502)))))))

(declare-fun appendNBits!0 (BitStream!706 (_ BitVec 64) Bool) tuple2!1706)

(assert (=> b!14880 (= lt!22502 (appendNBits!0 thiss!1073 nBits!313 true))))

(declare-fun b!14881 () Bool)

(declare-fun res!13896 () Bool)

(assert (=> b!14881 (=> (not res!13896) (not e!9310))))

(declare-fun isPrefixOf!0 (BitStream!706 BitStream!706) Bool)

(assert (=> b!14881 (= res!13896 (isPrefixOf!0 thiss!1073 (_2!914 lt!22502)))))

(declare-fun b!14882 () Bool)

(declare-datatypes ((tuple2!1708 0))(
  ( (tuple2!1709 (_1!915 BitStream!706) (_2!915 Bool)) )
))
(declare-fun lt!22503 () tuple2!1708)

(declare-datatypes ((tuple2!1710 0))(
  ( (tuple2!1711 (_1!916 BitStream!706) (_2!916 BitStream!706)) )
))
(declare-fun lt!22504 () tuple2!1710)

(assert (=> b!14882 (= e!9310 (not (or (not (_2!915 lt!22503)) (not (= (_1!915 lt!22503) (_2!916 lt!22504))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!706 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!1708)

(assert (=> b!14882 (= lt!22503 (checkBitsLoopPure!0 (_1!916 lt!22504) nBits!313 true #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!14882 (validate_offset_bits!1 ((_ sign_extend 32) (size!373 (buf!727 (_2!914 lt!22502)))) ((_ sign_extend 32) (currentByte!1884 thiss!1073)) ((_ sign_extend 32) (currentBit!1879 thiss!1073)) nBits!313)))

(declare-fun lt!22501 () Unit!1231)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!706 array!882 (_ BitVec 64)) Unit!1231)

(assert (=> b!14882 (= lt!22501 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1073 (buf!727 (_2!914 lt!22502)) nBits!313))))

(declare-fun reader!0 (BitStream!706 BitStream!706) tuple2!1710)

(assert (=> b!14882 (= lt!22504 (reader!0 thiss!1073 (_2!914 lt!22502)))))

(assert (= (and start!3418 res!13895) b!14879))

(assert (= (and b!14879 res!13897) b!14880))

(assert (= (and b!14880 res!13894) b!14878))

(assert (= (and b!14878 res!13898) b!14881))

(assert (= (and b!14881 res!13896) b!14882))

(assert (= start!3418 b!14877))

(declare-fun m!21375 () Bool)

(assert (=> b!14879 m!21375))

(declare-fun m!21377 () Bool)

(assert (=> b!14877 m!21377))

(declare-fun m!21379 () Bool)

(assert (=> b!14881 m!21379))

(declare-fun m!21381 () Bool)

(assert (=> start!3418 m!21381))

(declare-fun m!21383 () Bool)

(assert (=> b!14880 m!21383))

(declare-fun m!21385 () Bool)

(assert (=> b!14880 m!21385))

(declare-fun m!21387 () Bool)

(assert (=> b!14882 m!21387))

(declare-fun m!21389 () Bool)

(assert (=> b!14882 m!21389))

(declare-fun m!21391 () Bool)

(assert (=> b!14882 m!21391))

(declare-fun m!21393 () Bool)

(assert (=> b!14882 m!21393))

(declare-fun m!21395 () Bool)

(assert (=> b!14878 m!21395))

(declare-fun m!21397 () Bool)

(assert (=> b!14878 m!21397))

(push 1)

(assert (not b!14882))

(assert (not b!14881))

(assert (not start!3418))

(assert (not b!14878))

(assert (not b!14879))

(assert (not b!14880))

(assert (not b!14877))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!4922 () Bool)

(assert (=> d!4922 (= (invariant!0 (currentBit!1879 thiss!1073) (currentByte!1884 thiss!1073) (size!373 (buf!727 thiss!1073))) (and (bvsge (currentBit!1879 thiss!1073) #b00000000000000000000000000000000) (bvslt (currentBit!1879 thiss!1073) #b00000000000000000000000000001000) (bvsge (currentByte!1884 thiss!1073) #b00000000000000000000000000000000) (or (bvslt (currentByte!1884 thiss!1073) (size!373 (buf!727 thiss!1073))) (and (= (currentBit!1879 thiss!1073) #b00000000000000000000000000000000) (= (currentByte!1884 thiss!1073) (size!373 (buf!727 thiss!1073)))))))))

(assert (=> b!14880 d!4922))

(declare-fun b!14956 () Bool)

(declare-fun res!13967 () Bool)

(declare-fun e!9357 () Bool)

(assert (=> b!14956 (=> (not res!13967) (not e!9357))))

(declare-fun lt!22595 () (_ BitVec 64))

(declare-fun lt!22594 () tuple2!1706)

(assert (=> b!14956 (= res!13967 (= (bitIndex!0 (size!373 (buf!727 (_2!914 lt!22594))) (currentByte!1884 (_2!914 lt!22594)) (currentBit!1879 (_2!914 lt!22594))) (bvadd lt!22595 nBits!313)))))

(assert (=> b!14956 (or (not (= (bvand lt!22595 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!313 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!22595 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!22595 nBits!313) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!14956 (= lt!22595 (bitIndex!0 (size!373 (buf!727 thiss!1073)) (currentByte!1884 thiss!1073) (currentBit!1879 thiss!1073)))))

(declare-fun b!14957 () Bool)

(declare-fun res!13966 () Bool)

(assert (=> b!14957 (=> (not res!13966) (not e!9357))))

(assert (=> b!14957 (= res!13966 (isPrefixOf!0 thiss!1073 (_2!914 lt!22594)))))

(declare-fun b!14959 () Bool)

(declare-fun e!9358 () Bool)

(assert (=> b!14959 (= e!9358 (validate_offset_bits!1 ((_ sign_extend 32) (size!373 (buf!727 thiss!1073))) ((_ sign_extend 32) (currentByte!1884 thiss!1073)) ((_ sign_extend 32) (currentBit!1879 thiss!1073)) nBits!313))))

(declare-fun b!14958 () Bool)

(declare-fun lt!22597 () tuple2!1708)

(declare-fun lt!22592 () tuple2!1710)

(assert (=> b!14958 (= e!9357 (and (_2!915 lt!22597) (= (_1!915 lt!22597) (_2!916 lt!22592))))))

(assert (=> b!14958 (= lt!22597 (checkBitsLoopPure!0 (_1!916 lt!22592) nBits!313 true #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!22593 () Unit!1231)

(declare-fun lt!22596 () Unit!1231)

(assert (=> b!14958 (= lt!22593 lt!22596)))

(assert (=> b!14958 (validate_offset_bits!1 ((_ sign_extend 32) (size!373 (buf!727 (_2!914 lt!22594)))) ((_ sign_extend 32) (currentByte!1884 thiss!1073)) ((_ sign_extend 32) (currentBit!1879 thiss!1073)) nBits!313)))

(assert (=> b!14958 (= lt!22596 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1073 (buf!727 (_2!914 lt!22594)) nBits!313))))

(assert (=> b!14958 e!9358))

(declare-fun res!13969 () Bool)

(assert (=> b!14958 (=> (not res!13969) (not e!9358))))

(assert (=> b!14958 (= res!13969 (and (= (size!373 (buf!727 thiss!1073)) (size!373 (buf!727 (_2!914 lt!22594)))) (bvsge nBits!313 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!14958 (= lt!22592 (reader!0 thiss!1073 (_2!914 lt!22594)))))

(declare-fun d!4928 () Bool)

(assert (=> d!4928 e!9357))

(declare-fun res!13968 () Bool)

(assert (=> d!4928 (=> (not res!13968) (not e!9357))))

(assert (=> d!4928 (= res!13968 (= (size!373 (buf!727 thiss!1073)) (size!373 (buf!727 (_2!914 lt!22594)))))))

(declare-fun choose!36 (BitStream!706 (_ BitVec 64) Bool) tuple2!1706)

(assert (=> d!4928 (= lt!22594 (choose!36 thiss!1073 nBits!313 true))))

(assert (=> d!4928 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!313) (bvsle nBits!313 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!4928 (= (appendNBits!0 thiss!1073 nBits!313 true) lt!22594)))

(assert (= (and d!4928 res!13968) b!14956))

(assert (= (and b!14956 res!13967) b!14957))

(assert (= (and b!14957 res!13966) b!14958))

(assert (= (and b!14958 res!13969) b!14959))

(declare-fun m!21479 () Bool)

(assert (=> b!14957 m!21479))

(declare-fun m!21481 () Bool)

(assert (=> b!14958 m!21481))

(declare-fun m!21483 () Bool)

(assert (=> b!14958 m!21483))

(declare-fun m!21485 () Bool)

(assert (=> b!14958 m!21485))

(declare-fun m!21487 () Bool)

(assert (=> b!14958 m!21487))

(declare-fun m!21489 () Bool)

(assert (=> d!4928 m!21489))

(assert (=> b!14959 m!21375))

(declare-fun m!21491 () Bool)

(assert (=> b!14956 m!21491))

(assert (=> b!14956 m!21397))

(assert (=> b!14880 d!4928))

(declare-fun d!4958 () Bool)

(assert (=> d!4958 (= (inv!12 thiss!1073) (invariant!0 (currentBit!1879 thiss!1073) (currentByte!1884 thiss!1073) (size!373 (buf!727 thiss!1073))))))

(declare-fun bs!1367 () Bool)

(assert (= bs!1367 d!4958))

(assert (=> bs!1367 m!21383))

(assert (=> start!3418 d!4958))

(declare-fun d!4960 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!4960 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!373 (buf!727 thiss!1073))) ((_ sign_extend 32) (currentByte!1884 thiss!1073)) ((_ sign_extend 32) (currentBit!1879 thiss!1073)) nBits!313) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!373 (buf!727 thiss!1073))) ((_ sign_extend 32) (currentByte!1884 thiss!1073)) ((_ sign_extend 32) (currentBit!1879 thiss!1073))) nBits!313))))

(declare-fun bs!1369 () Bool)

(assert (= bs!1369 d!4960))

(declare-fun m!21495 () Bool)

(assert (=> bs!1369 m!21495))

(assert (=> b!14879 d!4960))

(declare-fun d!4964 () Bool)

(assert (=> d!4964 (= (array_inv!362 (buf!727 thiss!1073)) (bvsge (size!373 (buf!727 thiss!1073)) #b00000000000000000000000000000000))))

(assert (=> b!14877 d!4964))

(declare-fun d!4966 () Bool)

(declare-fun e!9367 () Bool)

(assert (=> d!4966 e!9367))

(declare-fun res!13983 () Bool)

(assert (=> d!4966 (=> (not res!13983) (not e!9367))))

(declare-fun lt!22677 () (_ BitVec 64))

(declare-fun lt!22675 () (_ BitVec 64))

(declare-fun lt!22673 () (_ BitVec 64))

(assert (=> d!4966 (= res!13983 (= lt!22677 (bvsub lt!22675 lt!22673)))))

(assert (=> d!4966 (or (= (bvand lt!22675 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!22673 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!22675 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!22675 lt!22673) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!4966 (= lt!22673 (remainingBits!0 ((_ sign_extend 32) (size!373 (buf!727 (_2!914 lt!22502)))) ((_ sign_extend 32) (currentByte!1884 (_2!914 lt!22502))) ((_ sign_extend 32) (currentBit!1879 (_2!914 lt!22502)))))))

(declare-fun lt!22674 () (_ BitVec 64))

(declare-fun lt!22678 () (_ BitVec 64))

(assert (=> d!4966 (= lt!22675 (bvmul lt!22674 lt!22678))))

(assert (=> d!4966 (or (= lt!22674 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!22678 (bvsdiv (bvmul lt!22674 lt!22678) lt!22674)))))

(assert (=> d!4966 (= lt!22678 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!4966 (= lt!22674 ((_ sign_extend 32) (size!373 (buf!727 (_2!914 lt!22502)))))))

(assert (=> d!4966 (= lt!22677 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1884 (_2!914 lt!22502))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1879 (_2!914 lt!22502)))))))

(assert (=> d!4966 (invariant!0 (currentBit!1879 (_2!914 lt!22502)) (currentByte!1884 (_2!914 lt!22502)) (size!373 (buf!727 (_2!914 lt!22502))))))

(assert (=> d!4966 (= (bitIndex!0 (size!373 (buf!727 (_2!914 lt!22502))) (currentByte!1884 (_2!914 lt!22502)) (currentBit!1879 (_2!914 lt!22502))) lt!22677)))

(declare-fun b!14979 () Bool)

(declare-fun res!13984 () Bool)

(assert (=> b!14979 (=> (not res!13984) (not e!9367))))

(assert (=> b!14979 (= res!13984 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!22677))))

(declare-fun b!14980 () Bool)

(declare-fun lt!22676 () (_ BitVec 64))

(assert (=> b!14980 (= e!9367 (bvsle lt!22677 (bvmul lt!22676 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!14980 (or (= lt!22676 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!22676 #b0000000000000000000000000000000000000000000000000000000000001000) lt!22676)))))

(assert (=> b!14980 (= lt!22676 ((_ sign_extend 32) (size!373 (buf!727 (_2!914 lt!22502)))))))

(assert (= (and d!4966 res!13983) b!14979))

(assert (= (and b!14979 res!13984) b!14980))

(declare-fun m!21527 () Bool)

(assert (=> d!4966 m!21527))

(declare-fun m!21529 () Bool)

(assert (=> d!4966 m!21529))

(assert (=> b!14878 d!4966))

(declare-fun d!4970 () Bool)

(declare-fun e!9368 () Bool)

(assert (=> d!4970 e!9368))

(declare-fun res!13985 () Bool)

(assert (=> d!4970 (=> (not res!13985) (not e!9368))))

(declare-fun lt!22683 () (_ BitVec 64))

(declare-fun lt!22679 () (_ BitVec 64))

(declare-fun lt!22681 () (_ BitVec 64))

(assert (=> d!4970 (= res!13985 (= lt!22683 (bvsub lt!22681 lt!22679)))))

(assert (=> d!4970 (or (= (bvand lt!22681 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!22679 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!22681 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!22681 lt!22679) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!4970 (= lt!22679 (remainingBits!0 ((_ sign_extend 32) (size!373 (buf!727 thiss!1073))) ((_ sign_extend 32) (currentByte!1884 thiss!1073)) ((_ sign_extend 32) (currentBit!1879 thiss!1073))))))

(declare-fun lt!22680 () (_ BitVec 64))

(declare-fun lt!22684 () (_ BitVec 64))

(assert (=> d!4970 (= lt!22681 (bvmul lt!22680 lt!22684))))

(assert (=> d!4970 (or (= lt!22680 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!22684 (bvsdiv (bvmul lt!22680 lt!22684) lt!22680)))))

(assert (=> d!4970 (= lt!22684 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!4970 (= lt!22680 ((_ sign_extend 32) (size!373 (buf!727 thiss!1073))))))

(assert (=> d!4970 (= lt!22683 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1884 thiss!1073)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1879 thiss!1073))))))

(assert (=> d!4970 (invariant!0 (currentBit!1879 thiss!1073) (currentByte!1884 thiss!1073) (size!373 (buf!727 thiss!1073)))))

(assert (=> d!4970 (= (bitIndex!0 (size!373 (buf!727 thiss!1073)) (currentByte!1884 thiss!1073) (currentBit!1879 thiss!1073)) lt!22683)))

(declare-fun b!14981 () Bool)

(declare-fun res!13986 () Bool)

(assert (=> b!14981 (=> (not res!13986) (not e!9368))))

(assert (=> b!14981 (= res!13986 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!22683))))

(declare-fun b!14982 () Bool)

(declare-fun lt!22682 () (_ BitVec 64))

(assert (=> b!14982 (= e!9368 (bvsle lt!22683 (bvmul lt!22682 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!14982 (or (= lt!22682 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!22682 #b0000000000000000000000000000000000000000000000000000000000001000) lt!22682)))))

(assert (=> b!14982 (= lt!22682 ((_ sign_extend 32) (size!373 (buf!727 thiss!1073))))))

(assert (= (and d!4970 res!13985) b!14981))

(assert (= (and b!14981 res!13986) b!14982))

(assert (=> d!4970 m!21495))

(assert (=> d!4970 m!21383))

(assert (=> b!14878 d!4970))

(declare-fun d!4972 () Bool)

(declare-fun res!13993 () Bool)

(declare-fun e!9374 () Bool)

(assert (=> d!4972 (=> (not res!13993) (not e!9374))))

(assert (=> d!4972 (= res!13993 (= (size!373 (buf!727 thiss!1073)) (size!373 (buf!727 (_2!914 lt!22502)))))))

(assert (=> d!4972 (= (isPrefixOf!0 thiss!1073 (_2!914 lt!22502)) e!9374)))

(declare-fun b!14989 () Bool)

(declare-fun res!13994 () Bool)

(assert (=> b!14989 (=> (not res!13994) (not e!9374))))

(assert (=> b!14989 (= res!13994 (bvsle (bitIndex!0 (size!373 (buf!727 thiss!1073)) (currentByte!1884 thiss!1073) (currentBit!1879 thiss!1073)) (bitIndex!0 (size!373 (buf!727 (_2!914 lt!22502))) (currentByte!1884 (_2!914 lt!22502)) (currentBit!1879 (_2!914 lt!22502)))))))

(declare-fun b!14990 () Bool)

(declare-fun e!9373 () Bool)

(assert (=> b!14990 (= e!9374 e!9373)))

(declare-fun res!13995 () Bool)

(assert (=> b!14990 (=> res!13995 e!9373)))

(assert (=> b!14990 (= res!13995 (= (size!373 (buf!727 thiss!1073)) #b00000000000000000000000000000000))))

(declare-fun b!14991 () Bool)

(declare-fun arrayBitRangesEq!0 (array!882 array!882 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!14991 (= e!9373 (arrayBitRangesEq!0 (buf!727 thiss!1073) (buf!727 (_2!914 lt!22502)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!373 (buf!727 thiss!1073)) (currentByte!1884 thiss!1073) (currentBit!1879 thiss!1073))))))

(assert (= (and d!4972 res!13993) b!14989))

(assert (= (and b!14989 res!13994) b!14990))

(assert (= (and b!14990 (not res!13995)) b!14991))

(assert (=> b!14989 m!21397))

(assert (=> b!14989 m!21395))

(assert (=> b!14991 m!21397))

(assert (=> b!14991 m!21397))

(declare-fun m!21531 () Bool)

(assert (=> b!14991 m!21531))

(assert (=> b!14881 d!4972))

(declare-fun d!4976 () Bool)

(declare-datatypes ((tuple2!1728 0))(
  ( (tuple2!1729 (_1!925 Bool) (_2!925 BitStream!706)) )
))
(declare-fun lt!22687 () tuple2!1728)

(declare-fun checkBitsLoop!0 (BitStream!706 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!1728)

(assert (=> d!4976 (= lt!22687 (checkBitsLoop!0 (_1!916 lt!22504) nBits!313 true #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!4976 (= (checkBitsLoopPure!0 (_1!916 lt!22504) nBits!313 true #b0000000000000000000000000000000000000000000000000000000000000000) (tuple2!1709 (_2!925 lt!22687) (_1!925 lt!22687)))))

(declare-fun bs!1370 () Bool)

(assert (= bs!1370 d!4976))

(declare-fun m!21533 () Bool)

(assert (=> bs!1370 m!21533))

(assert (=> b!14882 d!4976))

(declare-fun d!4978 () Bool)

(assert (=> d!4978 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!373 (buf!727 (_2!914 lt!22502)))) ((_ sign_extend 32) (currentByte!1884 thiss!1073)) ((_ sign_extend 32) (currentBit!1879 thiss!1073)) nBits!313) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!373 (buf!727 (_2!914 lt!22502)))) ((_ sign_extend 32) (currentByte!1884 thiss!1073)) ((_ sign_extend 32) (currentBit!1879 thiss!1073))) nBits!313))))

(declare-fun bs!1371 () Bool)

(assert (= bs!1371 d!4978))

(declare-fun m!21535 () Bool)

(assert (=> bs!1371 m!21535))

(assert (=> b!14882 d!4978))

(declare-fun d!4980 () Bool)

(assert (=> d!4980 (validate_offset_bits!1 ((_ sign_extend 32) (size!373 (buf!727 (_2!914 lt!22502)))) ((_ sign_extend 32) (currentByte!1884 thiss!1073)) ((_ sign_extend 32) (currentBit!1879 thiss!1073)) nBits!313)))

(declare-fun lt!22690 () Unit!1231)

(declare-fun choose!9 (BitStream!706 array!882 (_ BitVec 64) BitStream!706) Unit!1231)

(assert (=> d!4980 (= lt!22690 (choose!9 thiss!1073 (buf!727 (_2!914 lt!22502)) nBits!313 (BitStream!707 (buf!727 (_2!914 lt!22502)) (currentByte!1884 thiss!1073) (currentBit!1879 thiss!1073))))))

(assert (=> d!4980 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1073 (buf!727 (_2!914 lt!22502)) nBits!313) lt!22690)))

(declare-fun bs!1372 () Bool)

(assert (= bs!1372 d!4980))

(assert (=> bs!1372 m!21389))

(declare-fun m!21537 () Bool)

(assert (=> bs!1372 m!21537))

(assert (=> b!14882 d!4980))

(declare-fun b!15046 () Bool)

(declare-fun e!9401 () Unit!1231)

(declare-fun Unit!1238 () Unit!1231)

(assert (=> b!15046 (= e!9401 Unit!1238)))

(declare-fun b!15047 () Bool)

(declare-fun res!14040 () Bool)

(declare-fun e!9402 () Bool)

(assert (=> b!15047 (=> (not res!14040) (not e!9402))))

(declare-fun lt!22835 () tuple2!1710)

(assert (=> b!15047 (= res!14040 (isPrefixOf!0 (_1!916 lt!22835) thiss!1073))))

(declare-fun b!15048 () Bool)

(declare-fun res!14042 () Bool)

(assert (=> b!15048 (=> (not res!14042) (not e!9402))))

(assert (=> b!15048 (= res!14042 (isPrefixOf!0 (_2!916 lt!22835) (_2!914 lt!22502)))))

(declare-fun d!4982 () Bool)

(assert (=> d!4982 e!9402))

(declare-fun res!14041 () Bool)

(assert (=> d!4982 (=> (not res!14041) (not e!9402))))

(assert (=> d!4982 (= res!14041 (isPrefixOf!0 (_1!916 lt!22835) (_2!916 lt!22835)))))

(declare-fun lt!22850 () BitStream!706)

(assert (=> d!4982 (= lt!22835 (tuple2!1711 lt!22850 (_2!914 lt!22502)))))

(declare-fun lt!22845 () Unit!1231)

(declare-fun lt!22847 () Unit!1231)

(assert (=> d!4982 (= lt!22845 lt!22847)))

(assert (=> d!4982 (isPrefixOf!0 lt!22850 (_2!914 lt!22502))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!706 BitStream!706 BitStream!706) Unit!1231)

(assert (=> d!4982 (= lt!22847 (lemmaIsPrefixTransitive!0 lt!22850 (_2!914 lt!22502) (_2!914 lt!22502)))))

(declare-fun lt!22833 () Unit!1231)

(declare-fun lt!22838 () Unit!1231)

(assert (=> d!4982 (= lt!22833 lt!22838)))

(assert (=> d!4982 (isPrefixOf!0 lt!22850 (_2!914 lt!22502))))

(assert (=> d!4982 (= lt!22838 (lemmaIsPrefixTransitive!0 lt!22850 thiss!1073 (_2!914 lt!22502)))))

(declare-fun lt!22849 () Unit!1231)

(assert (=> d!4982 (= lt!22849 e!9401)))

(declare-fun c!1039 () Bool)

(assert (=> d!4982 (= c!1039 (not (= (size!373 (buf!727 thiss!1073)) #b00000000000000000000000000000000)))))

(declare-fun lt!22834 () Unit!1231)

(declare-fun lt!22842 () Unit!1231)

(assert (=> d!4982 (= lt!22834 lt!22842)))

(assert (=> d!4982 (isPrefixOf!0 (_2!914 lt!22502) (_2!914 lt!22502))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!706) Unit!1231)

(assert (=> d!4982 (= lt!22842 (lemmaIsPrefixRefl!0 (_2!914 lt!22502)))))

(declare-fun lt!22848 () Unit!1231)

(declare-fun lt!22844 () Unit!1231)

(assert (=> d!4982 (= lt!22848 lt!22844)))

(assert (=> d!4982 (= lt!22844 (lemmaIsPrefixRefl!0 (_2!914 lt!22502)))))

(declare-fun lt!22846 () Unit!1231)

(declare-fun lt!22841 () Unit!1231)

(assert (=> d!4982 (= lt!22846 lt!22841)))

(assert (=> d!4982 (isPrefixOf!0 lt!22850 lt!22850)))

(assert (=> d!4982 (= lt!22841 (lemmaIsPrefixRefl!0 lt!22850))))

(declare-fun lt!22851 () Unit!1231)

(declare-fun lt!22840 () Unit!1231)

(assert (=> d!4982 (= lt!22851 lt!22840)))

(assert (=> d!4982 (isPrefixOf!0 thiss!1073 thiss!1073)))

(assert (=> d!4982 (= lt!22840 (lemmaIsPrefixRefl!0 thiss!1073))))

(assert (=> d!4982 (= lt!22850 (BitStream!707 (buf!727 (_2!914 lt!22502)) (currentByte!1884 thiss!1073) (currentBit!1879 thiss!1073)))))

(assert (=> d!4982 (isPrefixOf!0 thiss!1073 (_2!914 lt!22502))))

(assert (=> d!4982 (= (reader!0 thiss!1073 (_2!914 lt!22502)) lt!22835)))

(declare-fun b!15049 () Bool)

(declare-fun lt!22837 () (_ BitVec 64))

(declare-fun lt!22836 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!706 (_ BitVec 64)) BitStream!706)

(assert (=> b!15049 (= e!9402 (= (_1!916 lt!22835) (withMovedBitIndex!0 (_2!916 lt!22835) (bvsub lt!22837 lt!22836))))))

(assert (=> b!15049 (or (= (bvand lt!22837 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!22836 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!22837 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!22837 lt!22836) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!15049 (= lt!22836 (bitIndex!0 (size!373 (buf!727 (_2!914 lt!22502))) (currentByte!1884 (_2!914 lt!22502)) (currentBit!1879 (_2!914 lt!22502))))))

(assert (=> b!15049 (= lt!22837 (bitIndex!0 (size!373 (buf!727 thiss!1073)) (currentByte!1884 thiss!1073) (currentBit!1879 thiss!1073)))))

(declare-fun b!15050 () Bool)

(declare-fun lt!22852 () Unit!1231)

(assert (=> b!15050 (= e!9401 lt!22852)))

(declare-fun lt!22839 () (_ BitVec 64))

(assert (=> b!15050 (= lt!22839 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!22843 () (_ BitVec 64))

(assert (=> b!15050 (= lt!22843 (bitIndex!0 (size!373 (buf!727 thiss!1073)) (currentByte!1884 thiss!1073) (currentBit!1879 thiss!1073)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!882 array!882 (_ BitVec 64) (_ BitVec 64)) Unit!1231)

(assert (=> b!15050 (= lt!22852 (arrayBitRangesEqSymmetric!0 (buf!727 thiss!1073) (buf!727 (_2!914 lt!22502)) lt!22839 lt!22843))))

(assert (=> b!15050 (arrayBitRangesEq!0 (buf!727 (_2!914 lt!22502)) (buf!727 thiss!1073) lt!22839 lt!22843)))

(assert (= (and d!4982 c!1039) b!15050))

(assert (= (and d!4982 (not c!1039)) b!15046))

(assert (= (and d!4982 res!14041) b!15047))

(assert (= (and b!15047 res!14040) b!15048))

(assert (= (and b!15048 res!14042) b!15049))

(declare-fun m!21591 () Bool)

(assert (=> d!4982 m!21591))

(declare-fun m!21593 () Bool)

(assert (=> d!4982 m!21593))

(declare-fun m!21595 () Bool)

(assert (=> d!4982 m!21595))

(declare-fun m!21597 () Bool)

(assert (=> d!4982 m!21597))

(declare-fun m!21599 () Bool)

(assert (=> d!4982 m!21599))

(declare-fun m!21601 () Bool)

(assert (=> d!4982 m!21601))

(assert (=> d!4982 m!21379))

(declare-fun m!21603 () Bool)

(assert (=> d!4982 m!21603))

(declare-fun m!21605 () Bool)

(assert (=> d!4982 m!21605))

(declare-fun m!21607 () Bool)

(assert (=> d!4982 m!21607))

(declare-fun m!21609 () Bool)

(assert (=> d!4982 m!21609))

(declare-fun m!21611 () Bool)

(assert (=> b!15049 m!21611))

(assert (=> b!15049 m!21395))

(assert (=> b!15049 m!21397))

(declare-fun m!21613 () Bool)

(assert (=> b!15048 m!21613))

(declare-fun m!21615 () Bool)

(assert (=> b!15047 m!21615))

(assert (=> b!15050 m!21397))

(declare-fun m!21617 () Bool)

(assert (=> b!15050 m!21617))

(declare-fun m!21619 () Bool)

(assert (=> b!15050 m!21619))

(assert (=> b!14882 d!4982))

(push 1)

(assert (not b!15050))

(assert (not d!4960))

(assert (not b!15048))

(assert (not d!4982))

(assert (not d!4958))

(assert (not b!15047))

(assert (not b!14958))

(assert (not b!14991))

(assert (not d!4978))

(assert (not d!4976))

(assert (not b!14959))

(assert (not b!14956))

(assert (not d!4970))

(assert (not d!4966))

(assert (not b!15049))

(assert (not b!14989))

(assert (not b!14957))

(assert (not d!4928))

(assert (not d!4980))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

