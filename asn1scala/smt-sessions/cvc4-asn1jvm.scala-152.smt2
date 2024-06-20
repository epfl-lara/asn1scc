; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3584 () Bool)

(assert start!3584)

(declare-fun lt!23749 () (_ BitVec 64))

(declare-fun b!15609 () Bool)

(declare-fun lt!23748 () (_ BitVec 64))

(declare-fun e!9754 () Bool)

(declare-fun nBits!313 () (_ BitVec 64))

(assert (=> b!15609 (= e!9754 (not (or (not (= lt!23749 (bvand nBits!313 #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!23749 (bvand (bvadd lt!23748 nBits!313) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!15609 (= lt!23749 (bvand lt!23748 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((array!940 0))(
  ( (array!941 (arr!828 (Array (_ BitVec 32) (_ BitVec 8))) (size!399 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!758 0))(
  ( (BitStream!759 (buf!759 array!940) (currentByte!1925 (_ BitVec 32)) (currentBit!1920 (_ BitVec 32))) )
))
(declare-fun thiss!1073 () BitStream!758)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!15609 (= lt!23748 (bitIndex!0 (size!399 (buf!759 thiss!1073)) (currentByte!1925 thiss!1073) (currentBit!1920 thiss!1073)))))

(declare-fun e!9753 () Bool)

(assert (=> b!15609 e!9753))

(declare-fun res!14514 () Bool)

(assert (=> b!15609 (=> (not res!14514) (not e!9753))))

(declare-datatypes ((Unit!1289 0))(
  ( (Unit!1290) )
))
(declare-datatypes ((tuple2!1874 0))(
  ( (tuple2!1875 (_1!998 Unit!1289) (_2!998 BitStream!758)) )
))
(declare-fun lt!23752 () tuple2!1874)

(assert (=> b!15609 (= res!14514 (= (size!399 (buf!759 thiss!1073)) (size!399 (buf!759 (_2!998 lt!23752)))))))

(declare-fun appendNBits!0 (BitStream!758 (_ BitVec 64) Bool) tuple2!1874)

(assert (=> b!15609 (= lt!23752 (appendNBits!0 thiss!1073 nBits!313 true))))

(declare-fun b!15610 () Bool)

(declare-datatypes ((tuple2!1876 0))(
  ( (tuple2!1877 (_1!999 BitStream!758) (_2!999 Bool)) )
))
(declare-fun lt!23751 () tuple2!1876)

(declare-datatypes ((tuple2!1878 0))(
  ( (tuple2!1879 (_1!1000 BitStream!758) (_2!1000 BitStream!758)) )
))
(declare-fun lt!23750 () tuple2!1878)

(assert (=> b!15610 (= e!9753 (not (or (not (_2!999 lt!23751)) (not (= (_1!999 lt!23751) (_2!1000 lt!23750))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!758 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!1876)

(assert (=> b!15610 (= lt!23751 (checkBitsLoopPure!0 (_1!1000 lt!23750) nBits!313 true #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!15610 (validate_offset_bits!1 ((_ sign_extend 32) (size!399 (buf!759 (_2!998 lt!23752)))) ((_ sign_extend 32) (currentByte!1925 thiss!1073)) ((_ sign_extend 32) (currentBit!1920 thiss!1073)) nBits!313)))

(declare-fun lt!23747 () Unit!1289)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!758 array!940 (_ BitVec 64)) Unit!1289)

(assert (=> b!15610 (= lt!23747 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1073 (buf!759 (_2!998 lt!23752)) nBits!313))))

(declare-fun reader!0 (BitStream!758 BitStream!758) tuple2!1878)

(assert (=> b!15610 (= lt!23750 (reader!0 thiss!1073 (_2!998 lt!23752)))))

(declare-fun b!15611 () Bool)

(declare-fun res!14512 () Bool)

(assert (=> b!15611 (=> (not res!14512) (not e!9753))))

(assert (=> b!15611 (= res!14512 (= (bitIndex!0 (size!399 (buf!759 (_2!998 lt!23752))) (currentByte!1925 (_2!998 lt!23752)) (currentBit!1920 (_2!998 lt!23752))) (bvadd (bitIndex!0 (size!399 (buf!759 thiss!1073)) (currentByte!1925 thiss!1073) (currentBit!1920 thiss!1073)) nBits!313)))))

(declare-fun b!15612 () Bool)

(declare-fun res!14515 () Bool)

(assert (=> b!15612 (=> (not res!14515) (not e!9753))))

(declare-fun isPrefixOf!0 (BitStream!758 BitStream!758) Bool)

(assert (=> b!15612 (= res!14515 (isPrefixOf!0 thiss!1073 (_2!998 lt!23752)))))

(declare-fun res!14516 () Bool)

(assert (=> start!3584 (=> (not res!14516) (not e!9754))))

(assert (=> start!3584 (= res!14516 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!313) (bvsle nBits!313 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!3584 e!9754))

(assert (=> start!3584 true))

(declare-fun e!9756 () Bool)

(declare-fun inv!12 (BitStream!758) Bool)

(assert (=> start!3584 (and (inv!12 thiss!1073) e!9756)))

(declare-fun b!15613 () Bool)

(declare-fun res!14513 () Bool)

(assert (=> b!15613 (=> (not res!14513) (not e!9754))))

(assert (=> b!15613 (= res!14513 (validate_offset_bits!1 ((_ sign_extend 32) (size!399 (buf!759 thiss!1073))) ((_ sign_extend 32) (currentByte!1925 thiss!1073)) ((_ sign_extend 32) (currentBit!1920 thiss!1073)) nBits!313))))

(declare-fun b!15614 () Bool)

(declare-fun array_inv!388 (array!940) Bool)

(assert (=> b!15614 (= e!9756 (array_inv!388 (buf!759 thiss!1073)))))

(assert (= (and start!3584 res!14516) b!15613))

(assert (= (and b!15613 res!14513) b!15609))

(assert (= (and b!15609 res!14514) b!15611))

(assert (= (and b!15611 res!14512) b!15612))

(assert (= (and b!15612 res!14515) b!15610))

(assert (= start!3584 b!15614))

(declare-fun m!22319 () Bool)

(assert (=> b!15613 m!22319))

(declare-fun m!22321 () Bool)

(assert (=> b!15610 m!22321))

(declare-fun m!22323 () Bool)

(assert (=> b!15610 m!22323))

(declare-fun m!22325 () Bool)

(assert (=> b!15610 m!22325))

(declare-fun m!22327 () Bool)

(assert (=> b!15610 m!22327))

(declare-fun m!22329 () Bool)

(assert (=> b!15614 m!22329))

(declare-fun m!22331 () Bool)

(assert (=> b!15609 m!22331))

(declare-fun m!22333 () Bool)

(assert (=> b!15609 m!22333))

(declare-fun m!22335 () Bool)

(assert (=> start!3584 m!22335))

(declare-fun m!22337 () Bool)

(assert (=> b!15612 m!22337))

(declare-fun m!22339 () Bool)

(assert (=> b!15611 m!22339))

(assert (=> b!15611 m!22331))

(push 1)

(assert (not start!3584))

(assert (not b!15610))

(assert (not b!15614))

(assert (not b!15613))

(assert (not b!15612))

(assert (not b!15609))

(assert (not b!15611))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!5084 () Bool)

(assert (=> d!5084 (= (array_inv!388 (buf!759 thiss!1073)) (bvsge (size!399 (buf!759 thiss!1073)) #b00000000000000000000000000000000))))

(assert (=> b!15614 d!5084))

(declare-fun d!5088 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!5088 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!399 (buf!759 thiss!1073))) ((_ sign_extend 32) (currentByte!1925 thiss!1073)) ((_ sign_extend 32) (currentBit!1920 thiss!1073)) nBits!313) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!399 (buf!759 thiss!1073))) ((_ sign_extend 32) (currentByte!1925 thiss!1073)) ((_ sign_extend 32) (currentBit!1920 thiss!1073))) nBits!313))))

(declare-fun bs!1418 () Bool)

(assert (= bs!1418 d!5088))

(declare-fun m!22345 () Bool)

(assert (=> bs!1418 m!22345))

(assert (=> b!15613 d!5088))

(declare-fun d!5090 () Bool)

(declare-fun res!14523 () Bool)

(declare-fun e!9761 () Bool)

(assert (=> d!5090 (=> (not res!14523) (not e!9761))))

(assert (=> d!5090 (= res!14523 (= (size!399 (buf!759 thiss!1073)) (size!399 (buf!759 (_2!998 lt!23752)))))))

(assert (=> d!5090 (= (isPrefixOf!0 thiss!1073 (_2!998 lt!23752)) e!9761)))

(declare-fun b!15621 () Bool)

(declare-fun res!14525 () Bool)

(assert (=> b!15621 (=> (not res!14525) (not e!9761))))

(assert (=> b!15621 (= res!14525 (bvsle (bitIndex!0 (size!399 (buf!759 thiss!1073)) (currentByte!1925 thiss!1073) (currentBit!1920 thiss!1073)) (bitIndex!0 (size!399 (buf!759 (_2!998 lt!23752))) (currentByte!1925 (_2!998 lt!23752)) (currentBit!1920 (_2!998 lt!23752)))))))

(declare-fun b!15622 () Bool)

(declare-fun e!9762 () Bool)

(assert (=> b!15622 (= e!9761 e!9762)))

(declare-fun res!14524 () Bool)

(assert (=> b!15622 (=> res!14524 e!9762)))

(assert (=> b!15622 (= res!14524 (= (size!399 (buf!759 thiss!1073)) #b00000000000000000000000000000000))))

(declare-fun b!15623 () Bool)

(declare-fun arrayBitRangesEq!0 (array!940 array!940 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!15623 (= e!9762 (arrayBitRangesEq!0 (buf!759 thiss!1073) (buf!759 (_2!998 lt!23752)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!399 (buf!759 thiss!1073)) (currentByte!1925 thiss!1073) (currentBit!1920 thiss!1073))))))

(assert (= (and d!5090 res!14523) b!15621))

(assert (= (and b!15621 res!14525) b!15622))

(assert (= (and b!15622 (not res!14524)) b!15623))

(assert (=> b!15621 m!22331))

(assert (=> b!15621 m!22339))

(assert (=> b!15623 m!22331))

(assert (=> b!15623 m!22331))

(declare-fun m!22349 () Bool)

(assert (=> b!15623 m!22349))

(assert (=> b!15612 d!5090))

(declare-fun d!5094 () Bool)

(declare-fun e!9765 () Bool)

(assert (=> d!5094 e!9765))

(declare-fun res!14530 () Bool)

(assert (=> d!5094 (=> (not res!14530) (not e!9765))))

(declare-fun lt!23774 () (_ BitVec 64))

(declare-fun lt!23771 () (_ BitVec 64))

(declare-fun lt!23773 () (_ BitVec 64))

(assert (=> d!5094 (= res!14530 (= lt!23774 (bvsub lt!23773 lt!23771)))))

(assert (=> d!5094 (or (= (bvand lt!23773 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!23771 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!23773 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!23773 lt!23771) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!5094 (= lt!23771 (remainingBits!0 ((_ sign_extend 32) (size!399 (buf!759 (_2!998 lt!23752)))) ((_ sign_extend 32) (currentByte!1925 (_2!998 lt!23752))) ((_ sign_extend 32) (currentBit!1920 (_2!998 lt!23752)))))))

(declare-fun lt!23776 () (_ BitVec 64))

(declare-fun lt!23772 () (_ BitVec 64))

(assert (=> d!5094 (= lt!23773 (bvmul lt!23776 lt!23772))))

(assert (=> d!5094 (or (= lt!23776 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!23772 (bvsdiv (bvmul lt!23776 lt!23772) lt!23776)))))

(assert (=> d!5094 (= lt!23772 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!5094 (= lt!23776 ((_ sign_extend 32) (size!399 (buf!759 (_2!998 lt!23752)))))))

(assert (=> d!5094 (= lt!23774 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1925 (_2!998 lt!23752))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1920 (_2!998 lt!23752)))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!5094 (invariant!0 (currentBit!1920 (_2!998 lt!23752)) (currentByte!1925 (_2!998 lt!23752)) (size!399 (buf!759 (_2!998 lt!23752))))))

(assert (=> d!5094 (= (bitIndex!0 (size!399 (buf!759 (_2!998 lt!23752))) (currentByte!1925 (_2!998 lt!23752)) (currentBit!1920 (_2!998 lt!23752))) lt!23774)))

(declare-fun b!15628 () Bool)

(declare-fun res!14531 () Bool)

(assert (=> b!15628 (=> (not res!14531) (not e!9765))))

(assert (=> b!15628 (= res!14531 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!23774))))

(declare-fun b!15629 () Bool)

(declare-fun lt!23775 () (_ BitVec 64))

(assert (=> b!15629 (= e!9765 (bvsle lt!23774 (bvmul lt!23775 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!15629 (or (= lt!23775 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!23775 #b0000000000000000000000000000000000000000000000000000000000001000) lt!23775)))))

(assert (=> b!15629 (= lt!23775 ((_ sign_extend 32) (size!399 (buf!759 (_2!998 lt!23752)))))))

(assert (= (and d!5094 res!14530) b!15628))

(assert (= (and b!15628 res!14531) b!15629))

(declare-fun m!22351 () Bool)

(assert (=> d!5094 m!22351))

(declare-fun m!22353 () Bool)

(assert (=> d!5094 m!22353))

(assert (=> b!15611 d!5094))

(declare-fun d!5096 () Bool)

(declare-fun e!9766 () Bool)

(assert (=> d!5096 e!9766))

(declare-fun res!14532 () Bool)

(assert (=> d!5096 (=> (not res!14532) (not e!9766))))

(declare-fun lt!23777 () (_ BitVec 64))

(declare-fun lt!23779 () (_ BitVec 64))

(declare-fun lt!23780 () (_ BitVec 64))

(assert (=> d!5096 (= res!14532 (= lt!23780 (bvsub lt!23779 lt!23777)))))

(assert (=> d!5096 (or (= (bvand lt!23779 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!23777 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!23779 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!23779 lt!23777) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!5096 (= lt!23777 (remainingBits!0 ((_ sign_extend 32) (size!399 (buf!759 thiss!1073))) ((_ sign_extend 32) (currentByte!1925 thiss!1073)) ((_ sign_extend 32) (currentBit!1920 thiss!1073))))))

(declare-fun lt!23782 () (_ BitVec 64))

(declare-fun lt!23778 () (_ BitVec 64))

(assert (=> d!5096 (= lt!23779 (bvmul lt!23782 lt!23778))))

(assert (=> d!5096 (or (= lt!23782 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!23778 (bvsdiv (bvmul lt!23782 lt!23778) lt!23782)))))

(assert (=> d!5096 (= lt!23778 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!5096 (= lt!23782 ((_ sign_extend 32) (size!399 (buf!759 thiss!1073))))))

(assert (=> d!5096 (= lt!23780 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1925 thiss!1073)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1920 thiss!1073))))))

(assert (=> d!5096 (invariant!0 (currentBit!1920 thiss!1073) (currentByte!1925 thiss!1073) (size!399 (buf!759 thiss!1073)))))

(assert (=> d!5096 (= (bitIndex!0 (size!399 (buf!759 thiss!1073)) (currentByte!1925 thiss!1073) (currentBit!1920 thiss!1073)) lt!23780)))

(declare-fun b!15630 () Bool)

(declare-fun res!14533 () Bool)

(assert (=> b!15630 (=> (not res!14533) (not e!9766))))

(assert (=> b!15630 (= res!14533 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!23780))))

(declare-fun b!15631 () Bool)

(declare-fun lt!23781 () (_ BitVec 64))

(assert (=> b!15631 (= e!9766 (bvsle lt!23780 (bvmul lt!23781 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!15631 (or (= lt!23781 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!23781 #b0000000000000000000000000000000000000000000000000000000000001000) lt!23781)))))

(assert (=> b!15631 (= lt!23781 ((_ sign_extend 32) (size!399 (buf!759 thiss!1073))))))

(assert (= (and d!5096 res!14532) b!15630))

(assert (= (and b!15630 res!14533) b!15631))

(assert (=> d!5096 m!22345))

(declare-fun m!22355 () Bool)

(assert (=> d!5096 m!22355))

(assert (=> b!15611 d!5096))

(declare-fun d!5098 () Bool)

(declare-datatypes ((tuple2!1882 0))(
  ( (tuple2!1883 (_1!1002 Bool) (_2!1002 BitStream!758)) )
))
(declare-fun lt!23785 () tuple2!1882)

(declare-fun checkBitsLoop!0 (BitStream!758 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!1882)

(assert (=> d!5098 (= lt!23785 (checkBitsLoop!0 (_1!1000 lt!23750) nBits!313 true #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!5098 (= (checkBitsLoopPure!0 (_1!1000 lt!23750) nBits!313 true #b0000000000000000000000000000000000000000000000000000000000000000) (tuple2!1877 (_2!1002 lt!23785) (_1!1002 lt!23785)))))

(declare-fun bs!1420 () Bool)

(assert (= bs!1420 d!5098))

(declare-fun m!22357 () Bool)

(assert (=> bs!1420 m!22357))

(assert (=> b!15610 d!5098))

(declare-fun d!5100 () Bool)

(assert (=> d!5100 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!399 (buf!759 (_2!998 lt!23752)))) ((_ sign_extend 32) (currentByte!1925 thiss!1073)) ((_ sign_extend 32) (currentBit!1920 thiss!1073)) nBits!313) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!399 (buf!759 (_2!998 lt!23752)))) ((_ sign_extend 32) (currentByte!1925 thiss!1073)) ((_ sign_extend 32) (currentBit!1920 thiss!1073))) nBits!313))))

(declare-fun bs!1421 () Bool)

(assert (= bs!1421 d!5100))

(declare-fun m!22359 () Bool)

(assert (=> bs!1421 m!22359))

(assert (=> b!15610 d!5100))

(declare-fun d!5102 () Bool)

(assert (=> d!5102 (validate_offset_bits!1 ((_ sign_extend 32) (size!399 (buf!759 (_2!998 lt!23752)))) ((_ sign_extend 32) (currentByte!1925 thiss!1073)) ((_ sign_extend 32) (currentBit!1920 thiss!1073)) nBits!313)))

(declare-fun lt!23788 () Unit!1289)

(declare-fun choose!9 (BitStream!758 array!940 (_ BitVec 64) BitStream!758) Unit!1289)

(assert (=> d!5102 (= lt!23788 (choose!9 thiss!1073 (buf!759 (_2!998 lt!23752)) nBits!313 (BitStream!759 (buf!759 (_2!998 lt!23752)) (currentByte!1925 thiss!1073) (currentBit!1920 thiss!1073))))))

(assert (=> d!5102 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1073 (buf!759 (_2!998 lt!23752)) nBits!313) lt!23788)))

(declare-fun bs!1422 () Bool)

(assert (= bs!1422 d!5102))

(assert (=> bs!1422 m!22323))

(declare-fun m!22361 () Bool)

(assert (=> bs!1422 m!22361))

(assert (=> b!15610 d!5102))

(declare-fun b!15663 () Bool)

(declare-fun res!14556 () Bool)

(declare-fun e!9780 () Bool)

(assert (=> b!15663 (=> (not res!14556) (not e!9780))))

(declare-fun lt!23919 () tuple2!1878)

(assert (=> b!15663 (= res!14556 (isPrefixOf!0 (_2!1000 lt!23919) (_2!998 lt!23752)))))

(declare-fun b!15664 () Bool)

(declare-fun res!14557 () Bool)

(assert (=> b!15664 (=> (not res!14557) (not e!9780))))

(assert (=> b!15664 (= res!14557 (isPrefixOf!0 (_1!1000 lt!23919) thiss!1073))))

(declare-fun b!15665 () Bool)

(declare-fun e!9781 () Unit!1289)

(declare-fun lt!23926 () Unit!1289)

(assert (=> b!15665 (= e!9781 lt!23926)))

(declare-fun lt!23918 () (_ BitVec 64))

(assert (=> b!15665 (= lt!23918 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!23916 () (_ BitVec 64))

(assert (=> b!15665 (= lt!23916 (bitIndex!0 (size!399 (buf!759 thiss!1073)) (currentByte!1925 thiss!1073) (currentBit!1920 thiss!1073)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!940 array!940 (_ BitVec 64) (_ BitVec 64)) Unit!1289)

(assert (=> b!15665 (= lt!23926 (arrayBitRangesEqSymmetric!0 (buf!759 thiss!1073) (buf!759 (_2!998 lt!23752)) lt!23918 lt!23916))))

(assert (=> b!15665 (arrayBitRangesEq!0 (buf!759 (_2!998 lt!23752)) (buf!759 thiss!1073) lt!23918 lt!23916)))

(declare-fun b!15666 () Bool)

(declare-fun Unit!1292 () Unit!1289)

(assert (=> b!15666 (= e!9781 Unit!1292)))

(declare-fun d!5104 () Bool)

(assert (=> d!5104 e!9780))

(declare-fun res!14555 () Bool)

(assert (=> d!5104 (=> (not res!14555) (not e!9780))))

(assert (=> d!5104 (= res!14555 (isPrefixOf!0 (_1!1000 lt!23919) (_2!1000 lt!23919)))))

(declare-fun lt!23909 () BitStream!758)

(assert (=> d!5104 (= lt!23919 (tuple2!1879 lt!23909 (_2!998 lt!23752)))))

(declare-fun lt!23914 () Unit!1289)

(declare-fun lt!23920 () Unit!1289)

(assert (=> d!5104 (= lt!23914 lt!23920)))

(assert (=> d!5104 (isPrefixOf!0 lt!23909 (_2!998 lt!23752))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!758 BitStream!758 BitStream!758) Unit!1289)

(assert (=> d!5104 (= lt!23920 (lemmaIsPrefixTransitive!0 lt!23909 (_2!998 lt!23752) (_2!998 lt!23752)))))

(declare-fun lt!23913 () Unit!1289)

(declare-fun lt!23915 () Unit!1289)

(assert (=> d!5104 (= lt!23913 lt!23915)))

(assert (=> d!5104 (isPrefixOf!0 lt!23909 (_2!998 lt!23752))))

(assert (=> d!5104 (= lt!23915 (lemmaIsPrefixTransitive!0 lt!23909 thiss!1073 (_2!998 lt!23752)))))

(declare-fun lt!23908 () Unit!1289)

(assert (=> d!5104 (= lt!23908 e!9781)))

(declare-fun c!1054 () Bool)

(assert (=> d!5104 (= c!1054 (not (= (size!399 (buf!759 thiss!1073)) #b00000000000000000000000000000000)))))

(declare-fun lt!23917 () Unit!1289)

(declare-fun lt!23907 () Unit!1289)

(assert (=> d!5104 (= lt!23917 lt!23907)))

(assert (=> d!5104 (isPrefixOf!0 (_2!998 lt!23752) (_2!998 lt!23752))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!758) Unit!1289)

(assert (=> d!5104 (= lt!23907 (lemmaIsPrefixRefl!0 (_2!998 lt!23752)))))

(declare-fun lt!23924 () Unit!1289)

(declare-fun lt!23922 () Unit!1289)

(assert (=> d!5104 (= lt!23924 lt!23922)))

(assert (=> d!5104 (= lt!23922 (lemmaIsPrefixRefl!0 (_2!998 lt!23752)))))

(declare-fun lt!23910 () Unit!1289)

(declare-fun lt!23925 () Unit!1289)

(assert (=> d!5104 (= lt!23910 lt!23925)))

(assert (=> d!5104 (isPrefixOf!0 lt!23909 lt!23909)))

(assert (=> d!5104 (= lt!23925 (lemmaIsPrefixRefl!0 lt!23909))))

(declare-fun lt!23912 () Unit!1289)

(declare-fun lt!23911 () Unit!1289)

(assert (=> d!5104 (= lt!23912 lt!23911)))

(assert (=> d!5104 (isPrefixOf!0 thiss!1073 thiss!1073)))

(assert (=> d!5104 (= lt!23911 (lemmaIsPrefixRefl!0 thiss!1073))))

(assert (=> d!5104 (= lt!23909 (BitStream!759 (buf!759 (_2!998 lt!23752)) (currentByte!1925 thiss!1073) (currentBit!1920 thiss!1073)))))

(assert (=> d!5104 (isPrefixOf!0 thiss!1073 (_2!998 lt!23752))))

(assert (=> d!5104 (= (reader!0 thiss!1073 (_2!998 lt!23752)) lt!23919)))

(declare-fun b!15667 () Bool)

(declare-fun lt!23923 () (_ BitVec 64))

(declare-fun lt!23921 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!758 (_ BitVec 64)) BitStream!758)

(assert (=> b!15667 (= e!9780 (= (_1!1000 lt!23919) (withMovedBitIndex!0 (_2!1000 lt!23919) (bvsub lt!23921 lt!23923))))))

(assert (=> b!15667 (or (= (bvand lt!23921 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!23923 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!23921 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!23921 lt!23923) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!15667 (= lt!23923 (bitIndex!0 (size!399 (buf!759 (_2!998 lt!23752))) (currentByte!1925 (_2!998 lt!23752)) (currentBit!1920 (_2!998 lt!23752))))))

(assert (=> b!15667 (= lt!23921 (bitIndex!0 (size!399 (buf!759 thiss!1073)) (currentByte!1925 thiss!1073) (currentBit!1920 thiss!1073)))))

(assert (= (and d!5104 c!1054) b!15665))

(assert (= (and d!5104 (not c!1054)) b!15666))

(assert (= (and d!5104 res!14555) b!15664))

(assert (= (and b!15664 res!14557) b!15663))

(assert (= (and b!15663 res!14556) b!15667))

(assert (=> b!15665 m!22331))

(declare-fun m!22397 () Bool)

(assert (=> b!15665 m!22397))

(declare-fun m!22399 () Bool)

(assert (=> b!15665 m!22399))

(declare-fun m!22401 () Bool)

(assert (=> b!15664 m!22401))

(assert (=> d!5104 m!22337))

(declare-fun m!22403 () Bool)

(assert (=> d!5104 m!22403))

(declare-fun m!22405 () Bool)

(assert (=> d!5104 m!22405))

(declare-fun m!22407 () Bool)

(assert (=> d!5104 m!22407))

(declare-fun m!22409 () Bool)

(assert (=> d!5104 m!22409))

(declare-fun m!22411 () Bool)

(assert (=> d!5104 m!22411))

(declare-fun m!22413 () Bool)

(assert (=> d!5104 m!22413))

(declare-fun m!22415 () Bool)

(assert (=> d!5104 m!22415))

(declare-fun m!22417 () Bool)

(assert (=> d!5104 m!22417))

(declare-fun m!22419 () Bool)

(assert (=> d!5104 m!22419))

(declare-fun m!22421 () Bool)

(assert (=> d!5104 m!22421))

(declare-fun m!22423 () Bool)

(assert (=> b!15663 m!22423))

(declare-fun m!22425 () Bool)

(assert (=> b!15667 m!22425))

(assert (=> b!15667 m!22339))

(assert (=> b!15667 m!22331))

(assert (=> b!15610 d!5104))

(declare-fun d!5112 () Bool)

(assert (=> d!5112 (= (inv!12 thiss!1073) (invariant!0 (currentBit!1920 thiss!1073) (currentByte!1925 thiss!1073) (size!399 (buf!759 thiss!1073))))))

(declare-fun bs!1423 () Bool)

(assert (= bs!1423 d!5112))

(assert (=> bs!1423 m!22355))

(assert (=> start!3584 d!5112))

(assert (=> b!15609 d!5096))

(declare-fun b!15717 () Bool)

(declare-fun res!14607 () Bool)

(declare-fun e!9810 () Bool)

(assert (=> b!15717 (=> (not res!14607) (not e!9810))))

(declare-fun lt!23990 () tuple2!1874)

(assert (=> b!15717 (= res!14607 (isPrefixOf!0 thiss!1073 (_2!998 lt!23990)))))

(declare-fun b!15719 () Bool)

(declare-fun e!9809 () Bool)

(assert (=> b!15719 (= e!9809 (validate_offset_bits!1 ((_ sign_extend 32) (size!399 (buf!759 thiss!1073))) ((_ sign_extend 32) (currentByte!1925 thiss!1073)) ((_ sign_extend 32) (currentBit!1920 thiss!1073)) nBits!313))))

(declare-fun d!5114 () Bool)

(assert (=> d!5114 e!9810))

(declare-fun res!14606 () Bool)

(assert (=> d!5114 (=> (not res!14606) (not e!9810))))

(assert (=> d!5114 (= res!14606 (= (size!399 (buf!759 thiss!1073)) (size!399 (buf!759 (_2!998 lt!23990)))))))

(declare-fun choose!36 (BitStream!758 (_ BitVec 64) Bool) tuple2!1874)

(assert (=> d!5114 (= lt!23990 (choose!36 thiss!1073 nBits!313 true))))

(assert (=> d!5114 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!313) (bvsle nBits!313 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!5114 (= (appendNBits!0 thiss!1073 nBits!313 true) lt!23990)))

(declare-fun b!15716 () Bool)

(declare-fun res!14608 () Bool)

(assert (=> b!15716 (=> (not res!14608) (not e!9810))))

(declare-fun lt!23991 () (_ BitVec 64))

(assert (=> b!15716 (= res!14608 (= (bitIndex!0 (size!399 (buf!759 (_2!998 lt!23990))) (currentByte!1925 (_2!998 lt!23990)) (currentBit!1920 (_2!998 lt!23990))) (bvadd lt!23991 nBits!313)))))

(assert (=> b!15716 (or (not (= (bvand lt!23991 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!313 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!23991 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!23991 nBits!313) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!15716 (= lt!23991 (bitIndex!0 (size!399 (buf!759 thiss!1073)) (currentByte!1925 thiss!1073) (currentBit!1920 thiss!1073)))))

(declare-fun b!15718 () Bool)

(declare-fun lt!23987 () tuple2!1876)

(declare-fun lt!23988 () tuple2!1878)

(assert (=> b!15718 (= e!9810 (and (_2!999 lt!23987) (= (_1!999 lt!23987) (_2!1000 lt!23988))))))

(assert (=> b!15718 (= lt!23987 (checkBitsLoopPure!0 (_1!1000 lt!23988) nBits!313 true #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!23992 () Unit!1289)

(declare-fun lt!23989 () Unit!1289)

(assert (=> b!15718 (= lt!23992 lt!23989)))

(assert (=> b!15718 (validate_offset_bits!1 ((_ sign_extend 32) (size!399 (buf!759 (_2!998 lt!23990)))) ((_ sign_extend 32) (currentByte!1925 thiss!1073)) ((_ sign_extend 32) (currentBit!1920 thiss!1073)) nBits!313)))

(assert (=> b!15718 (= lt!23989 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1073 (buf!759 (_2!998 lt!23990)) nBits!313))))

(assert (=> b!15718 e!9809))

(declare-fun res!14609 () Bool)

(assert (=> b!15718 (=> (not res!14609) (not e!9809))))

(assert (=> b!15718 (= res!14609 (and (= (size!399 (buf!759 thiss!1073)) (size!399 (buf!759 (_2!998 lt!23990)))) (bvsge nBits!313 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!15718 (= lt!23988 (reader!0 thiss!1073 (_2!998 lt!23990)))))

(assert (= (and d!5114 res!14606) b!15716))

(assert (= (and b!15716 res!14608) b!15717))

(assert (= (and b!15717 res!14607) b!15718))

(assert (= (and b!15718 res!14609) b!15719))

(assert (=> b!15719 m!22319))

(declare-fun m!22457 () Bool)

(assert (=> b!15717 m!22457))

(declare-fun m!22459 () Bool)

(assert (=> b!15716 m!22459))

(assert (=> b!15716 m!22331))

(declare-fun m!22461 () Bool)

(assert (=> d!5114 m!22461))

(declare-fun m!22463 () Bool)

(assert (=> b!15718 m!22463))

(declare-fun m!22465 () Bool)

(assert (=> b!15718 m!22465))

(declare-fun m!22467 () Bool)

(assert (=> b!15718 m!22467))

(declare-fun m!22469 () Bool)

(assert (=> b!15718 m!22469))

(assert (=> b!15609 d!5114))

(push 1)

