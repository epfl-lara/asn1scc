; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28784 () Bool)

(assert start!28784)

(declare-fun e!99877 () Bool)

(declare-datatypes ((array!6706 0))(
  ( (array!6707 (arr!3819 (Array (_ BitVec 32) (_ BitVec 8))) (size!3035 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5328 0))(
  ( (BitStream!5329 (buf!3510 array!6706) (currentByte!6424 (_ BitVec 32)) (currentBit!6419 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!13358 0))(
  ( (tuple2!13359 (_1!7043 BitStream!5328) (_2!7043 (_ BitVec 8))) )
))
(declare-fun lt!233452 () tuple2!13358)

(declare-fun arr!237 () array!6706)

(declare-datatypes ((tuple2!13360 0))(
  ( (tuple2!13361 (_1!7044 BitStream!5328) (_2!7044 BitStream!5328)) )
))
(declare-fun lt!233432 () tuple2!13360)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun b!149588 () Bool)

(assert (=> b!149588 (= e!99877 (and (= (_2!7043 lt!233452) (select (arr!3819 arr!237) from!447)) (= (_1!7043 lt!233452) (_2!7044 lt!233432))))))

(declare-fun readBytePure!0 (BitStream!5328) tuple2!13358)

(assert (=> b!149588 (= lt!233452 (readBytePure!0 (_1!7044 lt!233432)))))

(declare-fun thiss!1634 () BitStream!5328)

(declare-datatypes ((Unit!9461 0))(
  ( (Unit!9462) )
))
(declare-datatypes ((tuple2!13362 0))(
  ( (tuple2!13363 (_1!7045 Unit!9461) (_2!7045 BitStream!5328)) )
))
(declare-fun lt!233453 () tuple2!13362)

(declare-fun reader!0 (BitStream!5328 BitStream!5328) tuple2!13360)

(assert (=> b!149588 (= lt!233432 (reader!0 thiss!1634 (_2!7045 lt!233453)))))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((tuple2!13364 0))(
  ( (tuple2!13365 (_1!7046 BitStream!5328) (_2!7046 array!6706)) )
))
(declare-fun lt!233457 () tuple2!13364)

(declare-fun b!149589 () Bool)

(declare-fun e!99885 () Bool)

(declare-fun arrayRangesEq!351 (array!6706 array!6706 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!149589 (= e!99885 (not (arrayRangesEq!351 arr!237 (_2!7046 lt!233457) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!149590 () Bool)

(declare-fun e!99886 () Bool)

(declare-fun array_inv!2824 (array!6706) Bool)

(assert (=> b!149590 (= e!99886 (array_inv!2824 (buf!3510 thiss!1634)))))

(declare-fun b!149591 () Bool)

(declare-fun res!125310 () Bool)

(assert (=> b!149591 (=> (not res!125310) (not e!99877))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!149591 (= res!125310 (= (bitIndex!0 (size!3035 (buf!3510 (_2!7045 lt!233453))) (currentByte!6424 (_2!7045 lt!233453)) (currentBit!6419 (_2!7045 lt!233453))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3035 (buf!3510 thiss!1634)) (currentByte!6424 thiss!1634) (currentBit!6419 thiss!1634)))))))

(declare-fun b!149592 () Bool)

(declare-fun e!99882 () Bool)

(declare-fun e!99881 () Bool)

(assert (=> b!149592 (= e!99882 e!99881)))

(declare-fun res!125313 () Bool)

(assert (=> b!149592 (=> res!125313 e!99881)))

(declare-fun lt!233450 () tuple2!13362)

(assert (=> b!149592 (= res!125313 (not (= (size!3035 (buf!3510 thiss!1634)) (size!3035 (buf!3510 (_2!7045 lt!233450))))))))

(declare-fun lt!233446 () tuple2!13364)

(assert (=> b!149592 (arrayRangesEq!351 arr!237 (_2!7046 lt!233446) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!233439 () Unit!9461)

(declare-fun lt!233438 () tuple2!13364)

(declare-fun arrayRangesEqTransitive!66 (array!6706 array!6706 array!6706 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9461)

(assert (=> b!149592 (= lt!233439 (arrayRangesEqTransitive!66 arr!237 (_2!7046 lt!233438) (_2!7046 lt!233446) #b00000000000000000000000000000000 to!404 to!404))))

(assert (=> b!149592 (arrayRangesEq!351 (_2!7046 lt!233438) (_2!7046 lt!233446) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!233430 () Unit!9461)

(declare-fun arrayRangesEqSymmetricLemma!83 (array!6706 array!6706 (_ BitVec 32) (_ BitVec 32)) Unit!9461)

(assert (=> b!149592 (= lt!233430 (arrayRangesEqSymmetricLemma!83 (_2!7046 lt!233446) (_2!7046 lt!233438) #b00000000000000000000000000000000 to!404))))

(declare-fun lt!233447 () (_ BitVec 64))

(declare-fun lt!233456 () (_ BitVec 64))

(declare-fun b!149593 () Bool)

(declare-fun lt!233449 () (_ BitVec 64))

(assert (=> b!149593 (= e!99881 (or (not (= lt!233456 (bvand lt!233447 #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!233456 (bvand (bvadd lt!233449 lt!233447) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!149593 (= lt!233456 (bvand lt!233449 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!149593 (= lt!233447 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!404 from!447))))))

(assert (=> b!149593 (= lt!233449 (bitIndex!0 (size!3035 (buf!3510 thiss!1634)) (currentByte!6424 thiss!1634) (currentBit!6419 thiss!1634)))))

(declare-fun b!149594 () Bool)

(declare-fun e!99884 () Bool)

(assert (=> b!149594 (= e!99884 (not e!99882))))

(declare-fun res!125320 () Bool)

(assert (=> b!149594 (=> res!125320 e!99882)))

(assert (=> b!149594 (= res!125320 (not (arrayRangesEq!351 (_2!7046 lt!233446) (_2!7046 lt!233438) #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!233445 () tuple2!13364)

(assert (=> b!149594 (arrayRangesEq!351 (_2!7046 lt!233446) (_2!7046 lt!233445) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!233433 () tuple2!13360)

(declare-fun lt!233434 () Unit!9461)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!5328 array!6706 (_ BitVec 32) (_ BitVec 32)) Unit!9461)

(assert (=> b!149594 (= lt!233434 (readByteArrayLoopArrayPrefixLemma!0 (_1!7044 lt!233433) arr!237 from!447 to!404))))

(declare-fun lt!233436 () array!6706)

(declare-fun readByteArrayLoopPure!0 (BitStream!5328 array!6706 (_ BitVec 32) (_ BitVec 32)) tuple2!13364)

(declare-fun withMovedByteIndex!0 (BitStream!5328 (_ BitVec 32)) BitStream!5328)

(assert (=> b!149594 (= lt!233445 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!7044 lt!233433) #b00000000000000000000000000000001) lt!233436 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!233441 () tuple2!13360)

(assert (=> b!149594 (= lt!233438 (readByteArrayLoopPure!0 (_1!7044 lt!233441) lt!233436 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!233451 () tuple2!13358)

(assert (=> b!149594 (= lt!233436 (array!6707 (store (arr!3819 arr!237) from!447 (_2!7043 lt!233451)) (size!3035 arr!237)))))

(declare-fun lt!233429 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!149594 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3035 (buf!3510 (_2!7045 lt!233450)))) ((_ sign_extend 32) (currentByte!6424 (_2!7045 lt!233453))) ((_ sign_extend 32) (currentBit!6419 (_2!7045 lt!233453))) lt!233429)))

(declare-fun lt!233443 () Unit!9461)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!5328 array!6706 (_ BitVec 32)) Unit!9461)

(assert (=> b!149594 (= lt!233443 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!7045 lt!233453) (buf!3510 (_2!7045 lt!233450)) lt!233429))))

(assert (=> b!149594 (= (_1!7046 lt!233446) (_2!7044 lt!233433))))

(assert (=> b!149594 (= lt!233446 (readByteArrayLoopPure!0 (_1!7044 lt!233433) arr!237 from!447 to!404))))

(assert (=> b!149594 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3035 (buf!3510 (_2!7045 lt!233450)))) ((_ sign_extend 32) (currentByte!6424 thiss!1634)) ((_ sign_extend 32) (currentBit!6419 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!233454 () Unit!9461)

(assert (=> b!149594 (= lt!233454 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3510 (_2!7045 lt!233450)) (bvsub to!404 from!447)))))

(assert (=> b!149594 (= (_2!7043 lt!233451) (select (arr!3819 arr!237) from!447))))

(assert (=> b!149594 (= lt!233451 (readBytePure!0 (_1!7044 lt!233433)))))

(assert (=> b!149594 (= lt!233441 (reader!0 (_2!7045 lt!233453) (_2!7045 lt!233450)))))

(assert (=> b!149594 (= lt!233433 (reader!0 thiss!1634 (_2!7045 lt!233450)))))

(declare-fun e!99880 () Bool)

(assert (=> b!149594 e!99880))

(declare-fun res!125317 () Bool)

(assert (=> b!149594 (=> (not res!125317) (not e!99880))))

(declare-fun lt!233442 () tuple2!13358)

(declare-fun lt!233440 () tuple2!13358)

(assert (=> b!149594 (= res!125317 (= (bitIndex!0 (size!3035 (buf!3510 (_1!7043 lt!233442))) (currentByte!6424 (_1!7043 lt!233442)) (currentBit!6419 (_1!7043 lt!233442))) (bitIndex!0 (size!3035 (buf!3510 (_1!7043 lt!233440))) (currentByte!6424 (_1!7043 lt!233440)) (currentBit!6419 (_1!7043 lt!233440)))))))

(declare-fun lt!233448 () Unit!9461)

(declare-fun lt!233455 () BitStream!5328)

(declare-fun readBytePrefixLemma!0 (BitStream!5328 BitStream!5328) Unit!9461)

(assert (=> b!149594 (= lt!233448 (readBytePrefixLemma!0 lt!233455 (_2!7045 lt!233450)))))

(assert (=> b!149594 (= lt!233440 (readBytePure!0 (BitStream!5329 (buf!3510 (_2!7045 lt!233450)) (currentByte!6424 thiss!1634) (currentBit!6419 thiss!1634))))))

(assert (=> b!149594 (= lt!233442 (readBytePure!0 lt!233455))))

(assert (=> b!149594 (= lt!233455 (BitStream!5329 (buf!3510 (_2!7045 lt!233453)) (currentByte!6424 thiss!1634) (currentBit!6419 thiss!1634)))))

(declare-fun e!99876 () Bool)

(assert (=> b!149594 e!99876))

(declare-fun res!125312 () Bool)

(assert (=> b!149594 (=> (not res!125312) (not e!99876))))

(declare-fun isPrefixOf!0 (BitStream!5328 BitStream!5328) Bool)

(assert (=> b!149594 (= res!125312 (isPrefixOf!0 thiss!1634 (_2!7045 lt!233450)))))

(declare-fun lt!233437 () Unit!9461)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5328 BitStream!5328 BitStream!5328) Unit!9461)

(assert (=> b!149594 (= lt!233437 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!7045 lt!233453) (_2!7045 lt!233450)))))

(declare-fun e!99875 () Bool)

(assert (=> b!149594 e!99875))

(declare-fun res!125316 () Bool)

(assert (=> b!149594 (=> (not res!125316) (not e!99875))))

(assert (=> b!149594 (= res!125316 (= (size!3035 (buf!3510 (_2!7045 lt!233453))) (size!3035 (buf!3510 (_2!7045 lt!233450)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5328 array!6706 (_ BitVec 32) (_ BitVec 32)) tuple2!13362)

(assert (=> b!149594 (= lt!233450 (appendByteArrayLoop!0 (_2!7045 lt!233453) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!149594 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3035 (buf!3510 (_2!7045 lt!233453)))) ((_ sign_extend 32) (currentByte!6424 (_2!7045 lt!233453))) ((_ sign_extend 32) (currentBit!6419 (_2!7045 lt!233453))) lt!233429)))

(assert (=> b!149594 (= lt!233429 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!233428 () Unit!9461)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5328 BitStream!5328 (_ BitVec 64) (_ BitVec 32)) Unit!9461)

(assert (=> b!149594 (= lt!233428 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!7045 lt!233453) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!149594 e!99877))

(declare-fun res!125322 () Bool)

(assert (=> b!149594 (=> (not res!125322) (not e!99877))))

(assert (=> b!149594 (= res!125322 (= (size!3035 (buf!3510 thiss!1634)) (size!3035 (buf!3510 (_2!7045 lt!233453)))))))

(declare-fun appendByte!0 (BitStream!5328 (_ BitVec 8)) tuple2!13362)

(assert (=> b!149594 (= lt!233453 (appendByte!0 thiss!1634 (select (arr!3819 arr!237) from!447)))))

(declare-fun b!149595 () Bool)

(assert (=> b!149595 (= e!99880 (= (_2!7043 lt!233442) (_2!7043 lt!233440)))))

(declare-fun b!149596 () Bool)

(declare-fun res!125311 () Bool)

(declare-fun e!99883 () Bool)

(assert (=> b!149596 (=> (not res!125311) (not e!99883))))

(assert (=> b!149596 (= res!125311 (isPrefixOf!0 (_2!7045 lt!233453) (_2!7045 lt!233450)))))

(declare-fun b!149597 () Bool)

(assert (=> b!149597 (= e!99875 e!99883)))

(declare-fun res!125319 () Bool)

(assert (=> b!149597 (=> (not res!125319) (not e!99883))))

(declare-fun lt!233435 () (_ BitVec 64))

(assert (=> b!149597 (= res!125319 (= (bitIndex!0 (size!3035 (buf!3510 (_2!7045 lt!233450))) (currentByte!6424 (_2!7045 lt!233450)) (currentBit!6419 (_2!7045 lt!233450))) (bvadd (bitIndex!0 (size!3035 (buf!3510 (_2!7045 lt!233453))) (currentByte!6424 (_2!7045 lt!233453)) (currentBit!6419 (_2!7045 lt!233453))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!233435))))))

(assert (=> b!149597 (= lt!233435 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!149598 () Bool)

(declare-fun res!125321 () Bool)

(assert (=> b!149598 (=> (not res!125321) (not e!99884))))

(assert (=> b!149598 (= res!125321 (bvslt from!447 to!404))))

(declare-fun res!125323 () Bool)

(assert (=> start!28784 (=> (not res!125323) (not e!99884))))

(assert (=> start!28784 (= res!125323 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!3035 arr!237))))))

(assert (=> start!28784 e!99884))

(assert (=> start!28784 true))

(assert (=> start!28784 (array_inv!2824 arr!237)))

(declare-fun inv!12 (BitStream!5328) Bool)

(assert (=> start!28784 (and (inv!12 thiss!1634) e!99886)))

(declare-fun b!149599 () Bool)

(declare-fun res!125324 () Bool)

(assert (=> b!149599 (=> (not res!125324) (not e!99884))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!149599 (= res!125324 (invariant!0 (currentBit!6419 thiss!1634) (currentByte!6424 thiss!1634) (size!3035 (buf!3510 thiss!1634))))))

(declare-fun b!149600 () Bool)

(assert (=> b!149600 (= e!99876 (invariant!0 (currentBit!6419 thiss!1634) (currentByte!6424 thiss!1634) (size!3035 (buf!3510 (_2!7045 lt!233453)))))))

(declare-fun b!149601 () Bool)

(declare-fun res!125314 () Bool)

(assert (=> b!149601 (=> (not res!125314) (not e!99884))))

(assert (=> b!149601 (= res!125314 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3035 (buf!3510 thiss!1634))) ((_ sign_extend 32) (currentByte!6424 thiss!1634)) ((_ sign_extend 32) (currentBit!6419 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!149602 () Bool)

(assert (=> b!149602 (= e!99883 (not e!99885))))

(declare-fun res!125315 () Bool)

(assert (=> b!149602 (=> res!125315 e!99885)))

(declare-fun lt!233431 () tuple2!13360)

(assert (=> b!149602 (= res!125315 (or (not (= (size!3035 (_2!7046 lt!233457)) (size!3035 arr!237))) (not (= (_1!7046 lt!233457) (_2!7044 lt!233431)))))))

(assert (=> b!149602 (= lt!233457 (readByteArrayLoopPure!0 (_1!7044 lt!233431) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!149602 (validate_offset_bits!1 ((_ sign_extend 32) (size!3035 (buf!3510 (_2!7045 lt!233450)))) ((_ sign_extend 32) (currentByte!6424 (_2!7045 lt!233453))) ((_ sign_extend 32) (currentBit!6419 (_2!7045 lt!233453))) lt!233435)))

(declare-fun lt!233444 () Unit!9461)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5328 array!6706 (_ BitVec 64)) Unit!9461)

(assert (=> b!149602 (= lt!233444 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!7045 lt!233453) (buf!3510 (_2!7045 lt!233450)) lt!233435))))

(assert (=> b!149602 (= lt!233431 (reader!0 (_2!7045 lt!233453) (_2!7045 lt!233450)))))

(declare-fun b!149603 () Bool)

(declare-fun res!125318 () Bool)

(assert (=> b!149603 (=> (not res!125318) (not e!99877))))

(assert (=> b!149603 (= res!125318 (isPrefixOf!0 thiss!1634 (_2!7045 lt!233453)))))

(assert (= (and start!28784 res!125323) b!149601))

(assert (= (and b!149601 res!125314) b!149598))

(assert (= (and b!149598 res!125321) b!149599))

(assert (= (and b!149599 res!125324) b!149594))

(assert (= (and b!149594 res!125322) b!149591))

(assert (= (and b!149591 res!125310) b!149603))

(assert (= (and b!149603 res!125318) b!149588))

(assert (= (and b!149594 res!125316) b!149597))

(assert (= (and b!149597 res!125319) b!149596))

(assert (= (and b!149596 res!125311) b!149602))

(assert (= (and b!149602 (not res!125315)) b!149589))

(assert (= (and b!149594 res!125312) b!149600))

(assert (= (and b!149594 res!125317) b!149595))

(assert (= (and b!149594 (not res!125320)) b!149592))

(assert (= (and b!149592 (not res!125313)) b!149593))

(assert (= start!28784 b!149590))

(declare-fun m!232815 () Bool)

(assert (=> b!149588 m!232815))

(declare-fun m!232817 () Bool)

(assert (=> b!149588 m!232817))

(declare-fun m!232819 () Bool)

(assert (=> b!149588 m!232819))

(declare-fun m!232821 () Bool)

(assert (=> b!149589 m!232821))

(declare-fun m!232823 () Bool)

(assert (=> b!149602 m!232823))

(declare-fun m!232825 () Bool)

(assert (=> b!149602 m!232825))

(declare-fun m!232827 () Bool)

(assert (=> b!149602 m!232827))

(declare-fun m!232829 () Bool)

(assert (=> b!149602 m!232829))

(declare-fun m!232831 () Bool)

(assert (=> b!149593 m!232831))

(declare-fun m!232833 () Bool)

(assert (=> b!149603 m!232833))

(declare-fun m!232835 () Bool)

(assert (=> b!149599 m!232835))

(declare-fun m!232837 () Bool)

(assert (=> b!149596 m!232837))

(declare-fun m!232839 () Bool)

(assert (=> b!149600 m!232839))

(declare-fun m!232841 () Bool)

(assert (=> b!149594 m!232841))

(declare-fun m!232843 () Bool)

(assert (=> b!149594 m!232843))

(declare-fun m!232845 () Bool)

(assert (=> b!149594 m!232845))

(declare-fun m!232847 () Bool)

(assert (=> b!149594 m!232847))

(declare-fun m!232849 () Bool)

(assert (=> b!149594 m!232849))

(declare-fun m!232851 () Bool)

(assert (=> b!149594 m!232851))

(declare-fun m!232853 () Bool)

(assert (=> b!149594 m!232853))

(declare-fun m!232855 () Bool)

(assert (=> b!149594 m!232855))

(declare-fun m!232857 () Bool)

(assert (=> b!149594 m!232857))

(declare-fun m!232859 () Bool)

(assert (=> b!149594 m!232859))

(declare-fun m!232861 () Bool)

(assert (=> b!149594 m!232861))

(declare-fun m!232863 () Bool)

(assert (=> b!149594 m!232863))

(declare-fun m!232865 () Bool)

(assert (=> b!149594 m!232865))

(declare-fun m!232867 () Bool)

(assert (=> b!149594 m!232867))

(declare-fun m!232869 () Bool)

(assert (=> b!149594 m!232869))

(declare-fun m!232871 () Bool)

(assert (=> b!149594 m!232871))

(declare-fun m!232873 () Bool)

(assert (=> b!149594 m!232873))

(assert (=> b!149594 m!232829))

(declare-fun m!232875 () Bool)

(assert (=> b!149594 m!232875))

(declare-fun m!232877 () Bool)

(assert (=> b!149594 m!232877))

(assert (=> b!149594 m!232815))

(declare-fun m!232879 () Bool)

(assert (=> b!149594 m!232879))

(declare-fun m!232881 () Bool)

(assert (=> b!149594 m!232881))

(declare-fun m!232883 () Bool)

(assert (=> b!149594 m!232883))

(declare-fun m!232885 () Bool)

(assert (=> b!149594 m!232885))

(declare-fun m!232887 () Bool)

(assert (=> b!149594 m!232887))

(declare-fun m!232889 () Bool)

(assert (=> b!149594 m!232889))

(assert (=> b!149594 m!232885))

(assert (=> b!149594 m!232815))

(declare-fun m!232891 () Bool)

(assert (=> b!149590 m!232891))

(declare-fun m!232893 () Bool)

(assert (=> b!149591 m!232893))

(assert (=> b!149591 m!232831))

(declare-fun m!232895 () Bool)

(assert (=> start!28784 m!232895))

(declare-fun m!232897 () Bool)

(assert (=> start!28784 m!232897))

(declare-fun m!232899 () Bool)

(assert (=> b!149592 m!232899))

(declare-fun m!232901 () Bool)

(assert (=> b!149592 m!232901))

(declare-fun m!232903 () Bool)

(assert (=> b!149592 m!232903))

(declare-fun m!232905 () Bool)

(assert (=> b!149592 m!232905))

(declare-fun m!232907 () Bool)

(assert (=> b!149597 m!232907))

(assert (=> b!149597 m!232893))

(declare-fun m!232909 () Bool)

(assert (=> b!149601 m!232909))

(check-sat (not start!28784) (not b!149597) (not b!149589) (not b!149590) (not b!149593) (not b!149594) (not b!149588) (not b!149602) (not b!149601) (not b!149603) (not b!149599) (not b!149591) (not b!149596) (not b!149592) (not b!149600))
(check-sat)
(get-model)

(declare-fun d!48751 () Bool)

(assert (=> d!48751 (= (array_inv!2824 (buf!3510 thiss!1634)) (bvsge (size!3035 (buf!3510 thiss!1634)) #b00000000000000000000000000000000))))

(assert (=> b!149590 d!48751))

(declare-fun d!48753 () Bool)

(declare-fun res!125550 () Bool)

(declare-fun e!100045 () Bool)

(assert (=> d!48753 (=> res!125550 e!100045)))

(assert (=> d!48753 (= res!125550 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!48753 (= (arrayRangesEq!351 arr!237 (_2!7046 lt!233457) #b00000000000000000000000000000000 to!404) e!100045)))

(declare-fun b!149852 () Bool)

(declare-fun e!100046 () Bool)

(assert (=> b!149852 (= e!100045 e!100046)))

(declare-fun res!125551 () Bool)

(assert (=> b!149852 (=> (not res!125551) (not e!100046))))

(assert (=> b!149852 (= res!125551 (= (select (arr!3819 arr!237) #b00000000000000000000000000000000) (select (arr!3819 (_2!7046 lt!233457)) #b00000000000000000000000000000000)))))

(declare-fun b!149853 () Bool)

(assert (=> b!149853 (= e!100046 (arrayRangesEq!351 arr!237 (_2!7046 lt!233457) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!48753 (not res!125550)) b!149852))

(assert (= (and b!149852 res!125551) b!149853))

(declare-fun m!233419 () Bool)

(assert (=> b!149852 m!233419))

(declare-fun m!233421 () Bool)

(assert (=> b!149852 m!233421))

(declare-fun m!233423 () Bool)

(assert (=> b!149853 m!233423))

(assert (=> b!149589 d!48753))

(declare-fun d!48755 () Bool)

(assert (=> d!48755 (= (invariant!0 (currentBit!6419 thiss!1634) (currentByte!6424 thiss!1634) (size!3035 (buf!3510 (_2!7045 lt!233453)))) (and (bvsge (currentBit!6419 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6419 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6424 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6424 thiss!1634) (size!3035 (buf!3510 (_2!7045 lt!233453)))) (and (= (currentBit!6419 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6424 thiss!1634) (size!3035 (buf!3510 (_2!7045 lt!233453))))))))))

(assert (=> b!149600 d!48755))

(declare-fun d!48757 () Bool)

(declare-fun e!100049 () Bool)

(assert (=> d!48757 e!100049))

(declare-fun res!125557 () Bool)

(assert (=> d!48757 (=> (not res!125557) (not e!100049))))

(declare-fun lt!234053 () (_ BitVec 64))

(declare-fun lt!234054 () (_ BitVec 64))

(declare-fun lt!234050 () (_ BitVec 64))

(assert (=> d!48757 (= res!125557 (= lt!234054 (bvsub lt!234050 lt!234053)))))

(assert (=> d!48757 (or (= (bvand lt!234050 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!234053 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!234050 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!234050 lt!234053) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!48757 (= lt!234053 (remainingBits!0 ((_ sign_extend 32) (size!3035 (buf!3510 (_2!7045 lt!233453)))) ((_ sign_extend 32) (currentByte!6424 (_2!7045 lt!233453))) ((_ sign_extend 32) (currentBit!6419 (_2!7045 lt!233453)))))))

(declare-fun lt!234055 () (_ BitVec 64))

(declare-fun lt!234052 () (_ BitVec 64))

(assert (=> d!48757 (= lt!234050 (bvmul lt!234055 lt!234052))))

(assert (=> d!48757 (or (= lt!234055 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!234052 (bvsdiv (bvmul lt!234055 lt!234052) lt!234055)))))

(assert (=> d!48757 (= lt!234052 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!48757 (= lt!234055 ((_ sign_extend 32) (size!3035 (buf!3510 (_2!7045 lt!233453)))))))

(assert (=> d!48757 (= lt!234054 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6424 (_2!7045 lt!233453))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6419 (_2!7045 lt!233453)))))))

(assert (=> d!48757 (invariant!0 (currentBit!6419 (_2!7045 lt!233453)) (currentByte!6424 (_2!7045 lt!233453)) (size!3035 (buf!3510 (_2!7045 lt!233453))))))

(assert (=> d!48757 (= (bitIndex!0 (size!3035 (buf!3510 (_2!7045 lt!233453))) (currentByte!6424 (_2!7045 lt!233453)) (currentBit!6419 (_2!7045 lt!233453))) lt!234054)))

(declare-fun b!149858 () Bool)

(declare-fun res!125556 () Bool)

(assert (=> b!149858 (=> (not res!125556) (not e!100049))))

(assert (=> b!149858 (= res!125556 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!234054))))

(declare-fun b!149859 () Bool)

(declare-fun lt!234051 () (_ BitVec 64))

(assert (=> b!149859 (= e!100049 (bvsle lt!234054 (bvmul lt!234051 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!149859 (or (= lt!234051 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!234051 #b0000000000000000000000000000000000000000000000000000000000001000) lt!234051)))))

(assert (=> b!149859 (= lt!234051 ((_ sign_extend 32) (size!3035 (buf!3510 (_2!7045 lt!233453)))))))

(assert (= (and d!48757 res!125557) b!149858))

(assert (= (and b!149858 res!125556) b!149859))

(declare-fun m!233425 () Bool)

(assert (=> d!48757 m!233425))

(declare-fun m!233427 () Bool)

(assert (=> d!48757 m!233427))

(assert (=> b!149591 d!48757))

(declare-fun d!48759 () Bool)

(declare-fun e!100050 () Bool)

(assert (=> d!48759 e!100050))

(declare-fun res!125559 () Bool)

(assert (=> d!48759 (=> (not res!125559) (not e!100050))))

(declare-fun lt!234059 () (_ BitVec 64))

(declare-fun lt!234060 () (_ BitVec 64))

(declare-fun lt!234056 () (_ BitVec 64))

(assert (=> d!48759 (= res!125559 (= lt!234060 (bvsub lt!234056 lt!234059)))))

(assert (=> d!48759 (or (= (bvand lt!234056 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!234059 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!234056 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!234056 lt!234059) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!48759 (= lt!234059 (remainingBits!0 ((_ sign_extend 32) (size!3035 (buf!3510 thiss!1634))) ((_ sign_extend 32) (currentByte!6424 thiss!1634)) ((_ sign_extend 32) (currentBit!6419 thiss!1634))))))

(declare-fun lt!234061 () (_ BitVec 64))

(declare-fun lt!234058 () (_ BitVec 64))

(assert (=> d!48759 (= lt!234056 (bvmul lt!234061 lt!234058))))

(assert (=> d!48759 (or (= lt!234061 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!234058 (bvsdiv (bvmul lt!234061 lt!234058) lt!234061)))))

(assert (=> d!48759 (= lt!234058 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!48759 (= lt!234061 ((_ sign_extend 32) (size!3035 (buf!3510 thiss!1634))))))

(assert (=> d!48759 (= lt!234060 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6424 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6419 thiss!1634))))))

(assert (=> d!48759 (invariant!0 (currentBit!6419 thiss!1634) (currentByte!6424 thiss!1634) (size!3035 (buf!3510 thiss!1634)))))

(assert (=> d!48759 (= (bitIndex!0 (size!3035 (buf!3510 thiss!1634)) (currentByte!6424 thiss!1634) (currentBit!6419 thiss!1634)) lt!234060)))

(declare-fun b!149860 () Bool)

(declare-fun res!125558 () Bool)

(assert (=> b!149860 (=> (not res!125558) (not e!100050))))

(assert (=> b!149860 (= res!125558 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!234060))))

(declare-fun b!149861 () Bool)

(declare-fun lt!234057 () (_ BitVec 64))

(assert (=> b!149861 (= e!100050 (bvsle lt!234060 (bvmul lt!234057 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!149861 (or (= lt!234057 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!234057 #b0000000000000000000000000000000000000000000000000000000000001000) lt!234057)))))

(assert (=> b!149861 (= lt!234057 ((_ sign_extend 32) (size!3035 (buf!3510 thiss!1634))))))

(assert (= (and d!48759 res!125559) b!149860))

(assert (= (and b!149860 res!125558) b!149861))

(declare-fun m!233429 () Bool)

(assert (=> d!48759 m!233429))

(assert (=> d!48759 m!232835))

(assert (=> b!149591 d!48759))

(declare-fun d!48761 () Bool)

(declare-datatypes ((tuple3!586 0))(
  ( (tuple3!587 (_1!7055 Unit!9461) (_2!7055 BitStream!5328) (_3!366 array!6706)) )
))
(declare-fun lt!234064 () tuple3!586)

(declare-fun readByteArrayLoop!0 (BitStream!5328 array!6706 (_ BitVec 32) (_ BitVec 32)) tuple3!586)

(assert (=> d!48761 (= lt!234064 (readByteArrayLoop!0 (_1!7044 lt!233431) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!48761 (= (readByteArrayLoopPure!0 (_1!7044 lt!233431) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!13365 (_2!7055 lt!234064) (_3!366 lt!234064)))))

(declare-fun bs!11906 () Bool)

(assert (= bs!11906 d!48761))

(declare-fun m!233431 () Bool)

(assert (=> bs!11906 m!233431))

(assert (=> b!149602 d!48761))

(declare-fun d!48763 () Bool)

(assert (=> d!48763 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3035 (buf!3510 (_2!7045 lt!233450)))) ((_ sign_extend 32) (currentByte!6424 (_2!7045 lt!233453))) ((_ sign_extend 32) (currentBit!6419 (_2!7045 lt!233453))) lt!233435) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3035 (buf!3510 (_2!7045 lt!233450)))) ((_ sign_extend 32) (currentByte!6424 (_2!7045 lt!233453))) ((_ sign_extend 32) (currentBit!6419 (_2!7045 lt!233453)))) lt!233435))))

(declare-fun bs!11907 () Bool)

(assert (= bs!11907 d!48763))

(declare-fun m!233433 () Bool)

(assert (=> bs!11907 m!233433))

(assert (=> b!149602 d!48763))

(declare-fun d!48765 () Bool)

(assert (=> d!48765 (validate_offset_bits!1 ((_ sign_extend 32) (size!3035 (buf!3510 (_2!7045 lt!233450)))) ((_ sign_extend 32) (currentByte!6424 (_2!7045 lt!233453))) ((_ sign_extend 32) (currentBit!6419 (_2!7045 lt!233453))) lt!233435)))

(declare-fun lt!234067 () Unit!9461)

(declare-fun choose!9 (BitStream!5328 array!6706 (_ BitVec 64) BitStream!5328) Unit!9461)

(assert (=> d!48765 (= lt!234067 (choose!9 (_2!7045 lt!233453) (buf!3510 (_2!7045 lt!233450)) lt!233435 (BitStream!5329 (buf!3510 (_2!7045 lt!233450)) (currentByte!6424 (_2!7045 lt!233453)) (currentBit!6419 (_2!7045 lt!233453)))))))

(assert (=> d!48765 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!7045 lt!233453) (buf!3510 (_2!7045 lt!233450)) lt!233435) lt!234067)))

(declare-fun bs!11908 () Bool)

(assert (= bs!11908 d!48765))

(assert (=> bs!11908 m!232825))

(declare-fun m!233435 () Bool)

(assert (=> bs!11908 m!233435))

(assert (=> b!149602 d!48765))

(declare-fun b!149872 () Bool)

(declare-fun res!125566 () Bool)

(declare-fun e!100056 () Bool)

(assert (=> b!149872 (=> (not res!125566) (not e!100056))))

(declare-fun lt!234119 () tuple2!13360)

(assert (=> b!149872 (= res!125566 (isPrefixOf!0 (_2!7044 lt!234119) (_2!7045 lt!233450)))))

(declare-fun d!48767 () Bool)

(assert (=> d!48767 e!100056))

(declare-fun res!125568 () Bool)

(assert (=> d!48767 (=> (not res!125568) (not e!100056))))

(assert (=> d!48767 (= res!125568 (isPrefixOf!0 (_1!7044 lt!234119) (_2!7044 lt!234119)))))

(declare-fun lt!234127 () BitStream!5328)

(assert (=> d!48767 (= lt!234119 (tuple2!13361 lt!234127 (_2!7045 lt!233450)))))

(declare-fun lt!234123 () Unit!9461)

(declare-fun lt!234113 () Unit!9461)

(assert (=> d!48767 (= lt!234123 lt!234113)))

(assert (=> d!48767 (isPrefixOf!0 lt!234127 (_2!7045 lt!233450))))

(assert (=> d!48767 (= lt!234113 (lemmaIsPrefixTransitive!0 lt!234127 (_2!7045 lt!233450) (_2!7045 lt!233450)))))

(declare-fun lt!234125 () Unit!9461)

(declare-fun lt!234124 () Unit!9461)

(assert (=> d!48767 (= lt!234125 lt!234124)))

(assert (=> d!48767 (isPrefixOf!0 lt!234127 (_2!7045 lt!233450))))

(assert (=> d!48767 (= lt!234124 (lemmaIsPrefixTransitive!0 lt!234127 (_2!7045 lt!233453) (_2!7045 lt!233450)))))

(declare-fun lt!234118 () Unit!9461)

(declare-fun e!100055 () Unit!9461)

(assert (=> d!48767 (= lt!234118 e!100055)))

(declare-fun c!8054 () Bool)

(assert (=> d!48767 (= c!8054 (not (= (size!3035 (buf!3510 (_2!7045 lt!233453))) #b00000000000000000000000000000000)))))

(declare-fun lt!234120 () Unit!9461)

(declare-fun lt!234109 () Unit!9461)

(assert (=> d!48767 (= lt!234120 lt!234109)))

(assert (=> d!48767 (isPrefixOf!0 (_2!7045 lt!233450) (_2!7045 lt!233450))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!5328) Unit!9461)

(assert (=> d!48767 (= lt!234109 (lemmaIsPrefixRefl!0 (_2!7045 lt!233450)))))

(declare-fun lt!234121 () Unit!9461)

(declare-fun lt!234126 () Unit!9461)

(assert (=> d!48767 (= lt!234121 lt!234126)))

(assert (=> d!48767 (= lt!234126 (lemmaIsPrefixRefl!0 (_2!7045 lt!233450)))))

(declare-fun lt!234115 () Unit!9461)

(declare-fun lt!234112 () Unit!9461)

(assert (=> d!48767 (= lt!234115 lt!234112)))

(assert (=> d!48767 (isPrefixOf!0 lt!234127 lt!234127)))

(assert (=> d!48767 (= lt!234112 (lemmaIsPrefixRefl!0 lt!234127))))

(declare-fun lt!234108 () Unit!9461)

(declare-fun lt!234117 () Unit!9461)

(assert (=> d!48767 (= lt!234108 lt!234117)))

(assert (=> d!48767 (isPrefixOf!0 (_2!7045 lt!233453) (_2!7045 lt!233453))))

(assert (=> d!48767 (= lt!234117 (lemmaIsPrefixRefl!0 (_2!7045 lt!233453)))))

(assert (=> d!48767 (= lt!234127 (BitStream!5329 (buf!3510 (_2!7045 lt!233450)) (currentByte!6424 (_2!7045 lt!233453)) (currentBit!6419 (_2!7045 lt!233453))))))

(assert (=> d!48767 (isPrefixOf!0 (_2!7045 lt!233453) (_2!7045 lt!233450))))

(assert (=> d!48767 (= (reader!0 (_2!7045 lt!233453) (_2!7045 lt!233450)) lt!234119)))

(declare-fun b!149873 () Bool)

(declare-fun Unit!9471 () Unit!9461)

(assert (=> b!149873 (= e!100055 Unit!9471)))

(declare-fun b!149874 () Bool)

(declare-fun lt!234114 () Unit!9461)

(assert (=> b!149874 (= e!100055 lt!234114)))

(declare-fun lt!234122 () (_ BitVec 64))

(assert (=> b!149874 (= lt!234122 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!234116 () (_ BitVec 64))

(assert (=> b!149874 (= lt!234116 (bitIndex!0 (size!3035 (buf!3510 (_2!7045 lt!233453))) (currentByte!6424 (_2!7045 lt!233453)) (currentBit!6419 (_2!7045 lt!233453))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!6706 array!6706 (_ BitVec 64) (_ BitVec 64)) Unit!9461)

(assert (=> b!149874 (= lt!234114 (arrayBitRangesEqSymmetric!0 (buf!3510 (_2!7045 lt!233453)) (buf!3510 (_2!7045 lt!233450)) lt!234122 lt!234116))))

(declare-fun arrayBitRangesEq!0 (array!6706 array!6706 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!149874 (arrayBitRangesEq!0 (buf!3510 (_2!7045 lt!233450)) (buf!3510 (_2!7045 lt!233453)) lt!234122 lt!234116)))

(declare-fun b!149875 () Bool)

(declare-fun res!125567 () Bool)

(assert (=> b!149875 (=> (not res!125567) (not e!100056))))

(assert (=> b!149875 (= res!125567 (isPrefixOf!0 (_1!7044 lt!234119) (_2!7045 lt!233453)))))

(declare-fun b!149876 () Bool)

(declare-fun lt!234110 () (_ BitVec 64))

(declare-fun lt!234111 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!5328 (_ BitVec 64)) BitStream!5328)

(assert (=> b!149876 (= e!100056 (= (_1!7044 lt!234119) (withMovedBitIndex!0 (_2!7044 lt!234119) (bvsub lt!234110 lt!234111))))))

(assert (=> b!149876 (or (= (bvand lt!234110 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!234111 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!234110 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!234110 lt!234111) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!149876 (= lt!234111 (bitIndex!0 (size!3035 (buf!3510 (_2!7045 lt!233450))) (currentByte!6424 (_2!7045 lt!233450)) (currentBit!6419 (_2!7045 lt!233450))))))

(assert (=> b!149876 (= lt!234110 (bitIndex!0 (size!3035 (buf!3510 (_2!7045 lt!233453))) (currentByte!6424 (_2!7045 lt!233453)) (currentBit!6419 (_2!7045 lt!233453))))))

(assert (= (and d!48767 c!8054) b!149874))

(assert (= (and d!48767 (not c!8054)) b!149873))

(assert (= (and d!48767 res!125568) b!149875))

(assert (= (and b!149875 res!125567) b!149872))

(assert (= (and b!149872 res!125566) b!149876))

(declare-fun m!233437 () Bool)

(assert (=> d!48767 m!233437))

(declare-fun m!233439 () Bool)

(assert (=> d!48767 m!233439))

(declare-fun m!233441 () Bool)

(assert (=> d!48767 m!233441))

(declare-fun m!233443 () Bool)

(assert (=> d!48767 m!233443))

(assert (=> d!48767 m!232837))

(declare-fun m!233445 () Bool)

(assert (=> d!48767 m!233445))

(declare-fun m!233447 () Bool)

(assert (=> d!48767 m!233447))

(declare-fun m!233449 () Bool)

(assert (=> d!48767 m!233449))

(declare-fun m!233451 () Bool)

(assert (=> d!48767 m!233451))

(declare-fun m!233453 () Bool)

(assert (=> d!48767 m!233453))

(declare-fun m!233455 () Bool)

(assert (=> d!48767 m!233455))

(declare-fun m!233457 () Bool)

(assert (=> b!149875 m!233457))

(assert (=> b!149874 m!232893))

(declare-fun m!233459 () Bool)

(assert (=> b!149874 m!233459))

(declare-fun m!233461 () Bool)

(assert (=> b!149874 m!233461))

(declare-fun m!233463 () Bool)

(assert (=> b!149872 m!233463))

(declare-fun m!233465 () Bool)

(assert (=> b!149876 m!233465))

(assert (=> b!149876 m!232907))

(assert (=> b!149876 m!232893))

(assert (=> b!149602 d!48767))

(declare-fun d!48769 () Bool)

(assert (=> d!48769 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3035 (buf!3510 thiss!1634))) ((_ sign_extend 32) (currentByte!6424 thiss!1634)) ((_ sign_extend 32) (currentBit!6419 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3035 (buf!3510 thiss!1634))) ((_ sign_extend 32) (currentByte!6424 thiss!1634)) ((_ sign_extend 32) (currentBit!6419 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11909 () Bool)

(assert (= bs!11909 d!48769))

(assert (=> bs!11909 m!233429))

(assert (=> b!149601 d!48769))

(declare-fun d!48771 () Bool)

(declare-fun e!100057 () Bool)

(assert (=> d!48771 e!100057))

(declare-fun res!125570 () Bool)

(assert (=> d!48771 (=> (not res!125570) (not e!100057))))

(declare-fun lt!234131 () (_ BitVec 64))

(declare-fun lt!234132 () (_ BitVec 64))

(declare-fun lt!234128 () (_ BitVec 64))

(assert (=> d!48771 (= res!125570 (= lt!234132 (bvsub lt!234128 lt!234131)))))

(assert (=> d!48771 (or (= (bvand lt!234128 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!234131 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!234128 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!234128 lt!234131) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!48771 (= lt!234131 (remainingBits!0 ((_ sign_extend 32) (size!3035 (buf!3510 (_2!7045 lt!233450)))) ((_ sign_extend 32) (currentByte!6424 (_2!7045 lt!233450))) ((_ sign_extend 32) (currentBit!6419 (_2!7045 lt!233450)))))))

(declare-fun lt!234133 () (_ BitVec 64))

(declare-fun lt!234130 () (_ BitVec 64))

(assert (=> d!48771 (= lt!234128 (bvmul lt!234133 lt!234130))))

(assert (=> d!48771 (or (= lt!234133 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!234130 (bvsdiv (bvmul lt!234133 lt!234130) lt!234133)))))

(assert (=> d!48771 (= lt!234130 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!48771 (= lt!234133 ((_ sign_extend 32) (size!3035 (buf!3510 (_2!7045 lt!233450)))))))

(assert (=> d!48771 (= lt!234132 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6424 (_2!7045 lt!233450))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6419 (_2!7045 lt!233450)))))))

(assert (=> d!48771 (invariant!0 (currentBit!6419 (_2!7045 lt!233450)) (currentByte!6424 (_2!7045 lt!233450)) (size!3035 (buf!3510 (_2!7045 lt!233450))))))

(assert (=> d!48771 (= (bitIndex!0 (size!3035 (buf!3510 (_2!7045 lt!233450))) (currentByte!6424 (_2!7045 lt!233450)) (currentBit!6419 (_2!7045 lt!233450))) lt!234132)))

(declare-fun b!149877 () Bool)

(declare-fun res!125569 () Bool)

(assert (=> b!149877 (=> (not res!125569) (not e!100057))))

(assert (=> b!149877 (= res!125569 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!234132))))

(declare-fun b!149878 () Bool)

(declare-fun lt!234129 () (_ BitVec 64))

(assert (=> b!149878 (= e!100057 (bvsle lt!234132 (bvmul lt!234129 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!149878 (or (= lt!234129 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!234129 #b0000000000000000000000000000000000000000000000000000000000001000) lt!234129)))))

(assert (=> b!149878 (= lt!234129 ((_ sign_extend 32) (size!3035 (buf!3510 (_2!7045 lt!233450)))))))

(assert (= (and d!48771 res!125570) b!149877))

(assert (= (and b!149877 res!125569) b!149878))

(declare-fun m!233467 () Bool)

(assert (=> d!48771 m!233467))

(declare-fun m!233469 () Bool)

(assert (=> d!48771 m!233469))

(assert (=> b!149597 d!48771))

(assert (=> b!149597 d!48757))

(declare-fun d!48773 () Bool)

(assert (=> d!48773 (= (invariant!0 (currentBit!6419 thiss!1634) (currentByte!6424 thiss!1634) (size!3035 (buf!3510 thiss!1634))) (and (bvsge (currentBit!6419 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6419 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6424 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6424 thiss!1634) (size!3035 (buf!3510 thiss!1634))) (and (= (currentBit!6419 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6424 thiss!1634) (size!3035 (buf!3510 thiss!1634)))))))))

(assert (=> b!149599 d!48773))

(declare-fun d!48775 () Bool)

(declare-datatypes ((tuple2!13378 0))(
  ( (tuple2!13379 (_1!7056 (_ BitVec 8)) (_2!7056 BitStream!5328)) )
))
(declare-fun lt!234136 () tuple2!13378)

(declare-fun readByte!0 (BitStream!5328) tuple2!13378)

(assert (=> d!48775 (= lt!234136 (readByte!0 (_1!7044 lt!233432)))))

(assert (=> d!48775 (= (readBytePure!0 (_1!7044 lt!233432)) (tuple2!13359 (_2!7056 lt!234136) (_1!7056 lt!234136)))))

(declare-fun bs!11910 () Bool)

(assert (= bs!11910 d!48775))

(declare-fun m!233471 () Bool)

(assert (=> bs!11910 m!233471))

(assert (=> b!149588 d!48775))

(declare-fun b!149879 () Bool)

(declare-fun res!125571 () Bool)

(declare-fun e!100059 () Bool)

(assert (=> b!149879 (=> (not res!125571) (not e!100059))))

(declare-fun lt!234148 () tuple2!13360)

(assert (=> b!149879 (= res!125571 (isPrefixOf!0 (_2!7044 lt!234148) (_2!7045 lt!233453)))))

(declare-fun d!48777 () Bool)

(assert (=> d!48777 e!100059))

(declare-fun res!125573 () Bool)

(assert (=> d!48777 (=> (not res!125573) (not e!100059))))

(assert (=> d!48777 (= res!125573 (isPrefixOf!0 (_1!7044 lt!234148) (_2!7044 lt!234148)))))

(declare-fun lt!234156 () BitStream!5328)

(assert (=> d!48777 (= lt!234148 (tuple2!13361 lt!234156 (_2!7045 lt!233453)))))

(declare-fun lt!234152 () Unit!9461)

(declare-fun lt!234142 () Unit!9461)

(assert (=> d!48777 (= lt!234152 lt!234142)))

(assert (=> d!48777 (isPrefixOf!0 lt!234156 (_2!7045 lt!233453))))

(assert (=> d!48777 (= lt!234142 (lemmaIsPrefixTransitive!0 lt!234156 (_2!7045 lt!233453) (_2!7045 lt!233453)))))

(declare-fun lt!234154 () Unit!9461)

(declare-fun lt!234153 () Unit!9461)

(assert (=> d!48777 (= lt!234154 lt!234153)))

(assert (=> d!48777 (isPrefixOf!0 lt!234156 (_2!7045 lt!233453))))

(assert (=> d!48777 (= lt!234153 (lemmaIsPrefixTransitive!0 lt!234156 thiss!1634 (_2!7045 lt!233453)))))

(declare-fun lt!234147 () Unit!9461)

(declare-fun e!100058 () Unit!9461)

(assert (=> d!48777 (= lt!234147 e!100058)))

(declare-fun c!8055 () Bool)

(assert (=> d!48777 (= c!8055 (not (= (size!3035 (buf!3510 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!234149 () Unit!9461)

(declare-fun lt!234138 () Unit!9461)

(assert (=> d!48777 (= lt!234149 lt!234138)))

(assert (=> d!48777 (isPrefixOf!0 (_2!7045 lt!233453) (_2!7045 lt!233453))))

(assert (=> d!48777 (= lt!234138 (lemmaIsPrefixRefl!0 (_2!7045 lt!233453)))))

(declare-fun lt!234150 () Unit!9461)

(declare-fun lt!234155 () Unit!9461)

(assert (=> d!48777 (= lt!234150 lt!234155)))

(assert (=> d!48777 (= lt!234155 (lemmaIsPrefixRefl!0 (_2!7045 lt!233453)))))

(declare-fun lt!234144 () Unit!9461)

(declare-fun lt!234141 () Unit!9461)

(assert (=> d!48777 (= lt!234144 lt!234141)))

(assert (=> d!48777 (isPrefixOf!0 lt!234156 lt!234156)))

(assert (=> d!48777 (= lt!234141 (lemmaIsPrefixRefl!0 lt!234156))))

(declare-fun lt!234137 () Unit!9461)

(declare-fun lt!234146 () Unit!9461)

(assert (=> d!48777 (= lt!234137 lt!234146)))

(assert (=> d!48777 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!48777 (= lt!234146 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!48777 (= lt!234156 (BitStream!5329 (buf!3510 (_2!7045 lt!233453)) (currentByte!6424 thiss!1634) (currentBit!6419 thiss!1634)))))

(assert (=> d!48777 (isPrefixOf!0 thiss!1634 (_2!7045 lt!233453))))

(assert (=> d!48777 (= (reader!0 thiss!1634 (_2!7045 lt!233453)) lt!234148)))

(declare-fun b!149880 () Bool)

(declare-fun Unit!9472 () Unit!9461)

(assert (=> b!149880 (= e!100058 Unit!9472)))

(declare-fun b!149881 () Bool)

(declare-fun lt!234143 () Unit!9461)

(assert (=> b!149881 (= e!100058 lt!234143)))

(declare-fun lt!234151 () (_ BitVec 64))

(assert (=> b!149881 (= lt!234151 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!234145 () (_ BitVec 64))

(assert (=> b!149881 (= lt!234145 (bitIndex!0 (size!3035 (buf!3510 thiss!1634)) (currentByte!6424 thiss!1634) (currentBit!6419 thiss!1634)))))

(assert (=> b!149881 (= lt!234143 (arrayBitRangesEqSymmetric!0 (buf!3510 thiss!1634) (buf!3510 (_2!7045 lt!233453)) lt!234151 lt!234145))))

(assert (=> b!149881 (arrayBitRangesEq!0 (buf!3510 (_2!7045 lt!233453)) (buf!3510 thiss!1634) lt!234151 lt!234145)))

(declare-fun b!149882 () Bool)

(declare-fun res!125572 () Bool)

(assert (=> b!149882 (=> (not res!125572) (not e!100059))))

(assert (=> b!149882 (= res!125572 (isPrefixOf!0 (_1!7044 lt!234148) thiss!1634))))

(declare-fun b!149883 () Bool)

(declare-fun lt!234139 () (_ BitVec 64))

(declare-fun lt!234140 () (_ BitVec 64))

(assert (=> b!149883 (= e!100059 (= (_1!7044 lt!234148) (withMovedBitIndex!0 (_2!7044 lt!234148) (bvsub lt!234139 lt!234140))))))

(assert (=> b!149883 (or (= (bvand lt!234139 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!234140 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!234139 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!234139 lt!234140) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!149883 (= lt!234140 (bitIndex!0 (size!3035 (buf!3510 (_2!7045 lt!233453))) (currentByte!6424 (_2!7045 lt!233453)) (currentBit!6419 (_2!7045 lt!233453))))))

(assert (=> b!149883 (= lt!234139 (bitIndex!0 (size!3035 (buf!3510 thiss!1634)) (currentByte!6424 thiss!1634) (currentBit!6419 thiss!1634)))))

(assert (= (and d!48777 c!8055) b!149881))

(assert (= (and d!48777 (not c!8055)) b!149880))

(assert (= (and d!48777 res!125573) b!149882))

(assert (= (and b!149882 res!125572) b!149879))

(assert (= (and b!149879 res!125571) b!149883))

(declare-fun m!233473 () Bool)

(assert (=> d!48777 m!233473))

(declare-fun m!233475 () Bool)

(assert (=> d!48777 m!233475))

(assert (=> d!48777 m!233445))

(declare-fun m!233477 () Bool)

(assert (=> d!48777 m!233477))

(assert (=> d!48777 m!232833))

(declare-fun m!233479 () Bool)

(assert (=> d!48777 m!233479))

(declare-fun m!233481 () Bool)

(assert (=> d!48777 m!233481))

(declare-fun m!233483 () Bool)

(assert (=> d!48777 m!233483))

(assert (=> d!48777 m!233455))

(declare-fun m!233485 () Bool)

(assert (=> d!48777 m!233485))

(declare-fun m!233487 () Bool)

(assert (=> d!48777 m!233487))

(declare-fun m!233489 () Bool)

(assert (=> b!149882 m!233489))

(assert (=> b!149881 m!232831))

(declare-fun m!233491 () Bool)

(assert (=> b!149881 m!233491))

(declare-fun m!233493 () Bool)

(assert (=> b!149881 m!233493))

(declare-fun m!233495 () Bool)

(assert (=> b!149879 m!233495))

(declare-fun m!233497 () Bool)

(assert (=> b!149883 m!233497))

(assert (=> b!149883 m!232893))

(assert (=> b!149883 m!232831))

(assert (=> b!149588 d!48777))

(declare-fun d!48779 () Bool)

(assert (=> d!48779 (= (array_inv!2824 arr!237) (bvsge (size!3035 arr!237) #b00000000000000000000000000000000))))

(assert (=> start!28784 d!48779))

(declare-fun d!48781 () Bool)

(assert (=> d!48781 (= (inv!12 thiss!1634) (invariant!0 (currentBit!6419 thiss!1634) (currentByte!6424 thiss!1634) (size!3035 (buf!3510 thiss!1634))))))

(declare-fun bs!11911 () Bool)

(assert (= bs!11911 d!48781))

(assert (=> bs!11911 m!232835))

(assert (=> start!28784 d!48781))

(declare-fun d!48783 () Bool)

(declare-fun res!125580 () Bool)

(declare-fun e!100065 () Bool)

(assert (=> d!48783 (=> (not res!125580) (not e!100065))))

(assert (=> d!48783 (= res!125580 (= (size!3035 (buf!3510 (_2!7045 lt!233453))) (size!3035 (buf!3510 (_2!7045 lt!233450)))))))

(assert (=> d!48783 (= (isPrefixOf!0 (_2!7045 lt!233453) (_2!7045 lt!233450)) e!100065)))

(declare-fun b!149890 () Bool)

(declare-fun res!125582 () Bool)

(assert (=> b!149890 (=> (not res!125582) (not e!100065))))

(assert (=> b!149890 (= res!125582 (bvsle (bitIndex!0 (size!3035 (buf!3510 (_2!7045 lt!233453))) (currentByte!6424 (_2!7045 lt!233453)) (currentBit!6419 (_2!7045 lt!233453))) (bitIndex!0 (size!3035 (buf!3510 (_2!7045 lt!233450))) (currentByte!6424 (_2!7045 lt!233450)) (currentBit!6419 (_2!7045 lt!233450)))))))

(declare-fun b!149891 () Bool)

(declare-fun e!100064 () Bool)

(assert (=> b!149891 (= e!100065 e!100064)))

(declare-fun res!125581 () Bool)

(assert (=> b!149891 (=> res!125581 e!100064)))

(assert (=> b!149891 (= res!125581 (= (size!3035 (buf!3510 (_2!7045 lt!233453))) #b00000000000000000000000000000000))))

(declare-fun b!149892 () Bool)

(assert (=> b!149892 (= e!100064 (arrayBitRangesEq!0 (buf!3510 (_2!7045 lt!233453)) (buf!3510 (_2!7045 lt!233450)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3035 (buf!3510 (_2!7045 lt!233453))) (currentByte!6424 (_2!7045 lt!233453)) (currentBit!6419 (_2!7045 lt!233453)))))))

(assert (= (and d!48783 res!125580) b!149890))

(assert (= (and b!149890 res!125582) b!149891))

(assert (= (and b!149891 (not res!125581)) b!149892))

(assert (=> b!149890 m!232893))

(assert (=> b!149890 m!232907))

(assert (=> b!149892 m!232893))

(assert (=> b!149892 m!232893))

(declare-fun m!233499 () Bool)

(assert (=> b!149892 m!233499))

(assert (=> b!149596 d!48783))

(declare-fun d!48785 () Bool)

(declare-fun res!125583 () Bool)

(declare-fun e!100067 () Bool)

(assert (=> d!48785 (=> (not res!125583) (not e!100067))))

(assert (=> d!48785 (= res!125583 (= (size!3035 (buf!3510 thiss!1634)) (size!3035 (buf!3510 (_2!7045 lt!233453)))))))

(assert (=> d!48785 (= (isPrefixOf!0 thiss!1634 (_2!7045 lt!233453)) e!100067)))

(declare-fun b!149893 () Bool)

(declare-fun res!125585 () Bool)

(assert (=> b!149893 (=> (not res!125585) (not e!100067))))

(assert (=> b!149893 (= res!125585 (bvsle (bitIndex!0 (size!3035 (buf!3510 thiss!1634)) (currentByte!6424 thiss!1634) (currentBit!6419 thiss!1634)) (bitIndex!0 (size!3035 (buf!3510 (_2!7045 lt!233453))) (currentByte!6424 (_2!7045 lt!233453)) (currentBit!6419 (_2!7045 lt!233453)))))))

(declare-fun b!149894 () Bool)

(declare-fun e!100066 () Bool)

(assert (=> b!149894 (= e!100067 e!100066)))

(declare-fun res!125584 () Bool)

(assert (=> b!149894 (=> res!125584 e!100066)))

(assert (=> b!149894 (= res!125584 (= (size!3035 (buf!3510 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!149895 () Bool)

(assert (=> b!149895 (= e!100066 (arrayBitRangesEq!0 (buf!3510 thiss!1634) (buf!3510 (_2!7045 lt!233453)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3035 (buf!3510 thiss!1634)) (currentByte!6424 thiss!1634) (currentBit!6419 thiss!1634))))))

(assert (= (and d!48785 res!125583) b!149893))

(assert (= (and b!149893 res!125585) b!149894))

(assert (= (and b!149894 (not res!125584)) b!149895))

(assert (=> b!149893 m!232831))

(assert (=> b!149893 m!232893))

(assert (=> b!149895 m!232831))

(assert (=> b!149895 m!232831))

(declare-fun m!233501 () Bool)

(assert (=> b!149895 m!233501))

(assert (=> b!149603 d!48785))

(declare-fun d!48787 () Bool)

(declare-fun res!125586 () Bool)

(declare-fun e!100068 () Bool)

(assert (=> d!48787 (=> res!125586 e!100068)))

(assert (=> d!48787 (= res!125586 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!48787 (= (arrayRangesEq!351 arr!237 (_2!7046 lt!233446) #b00000000000000000000000000000000 to!404) e!100068)))

(declare-fun b!149896 () Bool)

(declare-fun e!100069 () Bool)

(assert (=> b!149896 (= e!100068 e!100069)))

(declare-fun res!125587 () Bool)

(assert (=> b!149896 (=> (not res!125587) (not e!100069))))

(assert (=> b!149896 (= res!125587 (= (select (arr!3819 arr!237) #b00000000000000000000000000000000) (select (arr!3819 (_2!7046 lt!233446)) #b00000000000000000000000000000000)))))

(declare-fun b!149897 () Bool)

(assert (=> b!149897 (= e!100069 (arrayRangesEq!351 arr!237 (_2!7046 lt!233446) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!48787 (not res!125586)) b!149896))

(assert (= (and b!149896 res!125587) b!149897))

(assert (=> b!149896 m!233419))

(declare-fun m!233503 () Bool)

(assert (=> b!149896 m!233503))

(declare-fun m!233505 () Bool)

(assert (=> b!149897 m!233505))

(assert (=> b!149592 d!48787))

(declare-fun d!48789 () Bool)

(assert (=> d!48789 (arrayRangesEq!351 arr!237 (_2!7046 lt!233446) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!234159 () Unit!9461)

(declare-fun choose!90 (array!6706 array!6706 array!6706 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9461)

(assert (=> d!48789 (= lt!234159 (choose!90 arr!237 (_2!7046 lt!233438) (_2!7046 lt!233446) #b00000000000000000000000000000000 to!404 to!404))))

(assert (=> d!48789 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 to!404) (bvsle to!404 to!404))))

(assert (=> d!48789 (= (arrayRangesEqTransitive!66 arr!237 (_2!7046 lt!233438) (_2!7046 lt!233446) #b00000000000000000000000000000000 to!404 to!404) lt!234159)))

(declare-fun bs!11912 () Bool)

(assert (= bs!11912 d!48789))

(assert (=> bs!11912 m!232899))

(declare-fun m!233507 () Bool)

(assert (=> bs!11912 m!233507))

(assert (=> b!149592 d!48789))

(declare-fun d!48791 () Bool)

(declare-fun res!125588 () Bool)

(declare-fun e!100070 () Bool)

(assert (=> d!48791 (=> res!125588 e!100070)))

(assert (=> d!48791 (= res!125588 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!48791 (= (arrayRangesEq!351 (_2!7046 lt!233438) (_2!7046 lt!233446) #b00000000000000000000000000000000 to!404) e!100070)))

(declare-fun b!149898 () Bool)

(declare-fun e!100071 () Bool)

(assert (=> b!149898 (= e!100070 e!100071)))

(declare-fun res!125589 () Bool)

(assert (=> b!149898 (=> (not res!125589) (not e!100071))))

(assert (=> b!149898 (= res!125589 (= (select (arr!3819 (_2!7046 lt!233438)) #b00000000000000000000000000000000) (select (arr!3819 (_2!7046 lt!233446)) #b00000000000000000000000000000000)))))

(declare-fun b!149899 () Bool)

(assert (=> b!149899 (= e!100071 (arrayRangesEq!351 (_2!7046 lt!233438) (_2!7046 lt!233446) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!48791 (not res!125588)) b!149898))

(assert (= (and b!149898 res!125589) b!149899))

(declare-fun m!233509 () Bool)

(assert (=> b!149898 m!233509))

(assert (=> b!149898 m!233503))

(declare-fun m!233511 () Bool)

(assert (=> b!149899 m!233511))

(assert (=> b!149592 d!48791))

(declare-fun d!48793 () Bool)

(assert (=> d!48793 (arrayRangesEq!351 (_2!7046 lt!233438) (_2!7046 lt!233446) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!234162 () Unit!9461)

(declare-fun choose!91 (array!6706 array!6706 (_ BitVec 32) (_ BitVec 32)) Unit!9461)

(assert (=> d!48793 (= lt!234162 (choose!91 (_2!7046 lt!233446) (_2!7046 lt!233438) #b00000000000000000000000000000000 to!404))))

(assert (=> d!48793 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 to!404) (bvsle to!404 (size!3035 (_2!7046 lt!233446))))))

(assert (=> d!48793 (= (arrayRangesEqSymmetricLemma!83 (_2!7046 lt!233446) (_2!7046 lt!233438) #b00000000000000000000000000000000 to!404) lt!234162)))

(declare-fun bs!11913 () Bool)

(assert (= bs!11913 d!48793))

(assert (=> bs!11913 m!232903))

(declare-fun m!233513 () Bool)

(assert (=> bs!11913 m!233513))

(assert (=> b!149592 d!48793))

(declare-fun lt!234163 () tuple3!586)

(declare-fun d!48795 () Bool)

(assert (=> d!48795 (= lt!234163 (readByteArrayLoop!0 (_1!7044 lt!233433) arr!237 from!447 to!404))))

(assert (=> d!48795 (= (readByteArrayLoopPure!0 (_1!7044 lt!233433) arr!237 from!447 to!404) (tuple2!13365 (_2!7055 lt!234163) (_3!366 lt!234163)))))

(declare-fun bs!11914 () Bool)

(assert (= bs!11914 d!48795))

(declare-fun m!233515 () Bool)

(assert (=> bs!11914 m!233515))

(assert (=> b!149594 d!48795))

(declare-fun d!48797 () Bool)

(assert (=> d!48797 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3035 (buf!3510 (_2!7045 lt!233453)))) ((_ sign_extend 32) (currentByte!6424 (_2!7045 lt!233453))) ((_ sign_extend 32) (currentBit!6419 (_2!7045 lt!233453))) lt!233429) (bvsle ((_ sign_extend 32) lt!233429) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3035 (buf!3510 (_2!7045 lt!233453)))) ((_ sign_extend 32) (currentByte!6424 (_2!7045 lt!233453))) ((_ sign_extend 32) (currentBit!6419 (_2!7045 lt!233453)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11915 () Bool)

(assert (= bs!11915 d!48797))

(assert (=> bs!11915 m!233425))

(assert (=> b!149594 d!48797))

(assert (=> b!149594 d!48767))

(declare-fun d!48799 () Bool)

(declare-fun res!125590 () Bool)

(declare-fun e!100072 () Bool)

(assert (=> d!48799 (=> res!125590 e!100072)))

(assert (=> d!48799 (= res!125590 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!48799 (= (arrayRangesEq!351 (_2!7046 lt!233446) (_2!7046 lt!233438) #b00000000000000000000000000000000 to!404) e!100072)))

(declare-fun b!149900 () Bool)

(declare-fun e!100073 () Bool)

(assert (=> b!149900 (= e!100072 e!100073)))

(declare-fun res!125591 () Bool)

(assert (=> b!149900 (=> (not res!125591) (not e!100073))))

(assert (=> b!149900 (= res!125591 (= (select (arr!3819 (_2!7046 lt!233446)) #b00000000000000000000000000000000) (select (arr!3819 (_2!7046 lt!233438)) #b00000000000000000000000000000000)))))

(declare-fun b!149901 () Bool)

(assert (=> b!149901 (= e!100073 (arrayRangesEq!351 (_2!7046 lt!233446) (_2!7046 lt!233438) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!48799 (not res!125590)) b!149900))

(assert (= (and b!149900 res!125591) b!149901))

(assert (=> b!149900 m!233503))

(assert (=> b!149900 m!233509))

(declare-fun m!233517 () Bool)

(assert (=> b!149901 m!233517))

(assert (=> b!149594 d!48799))

(declare-fun d!48801 () Bool)

(declare-fun res!125592 () Bool)

(declare-fun e!100075 () Bool)

(assert (=> d!48801 (=> (not res!125592) (not e!100075))))

(assert (=> d!48801 (= res!125592 (= (size!3035 (buf!3510 thiss!1634)) (size!3035 (buf!3510 (_2!7045 lt!233450)))))))

(assert (=> d!48801 (= (isPrefixOf!0 thiss!1634 (_2!7045 lt!233450)) e!100075)))

(declare-fun b!149902 () Bool)

(declare-fun res!125594 () Bool)

(assert (=> b!149902 (=> (not res!125594) (not e!100075))))

(assert (=> b!149902 (= res!125594 (bvsle (bitIndex!0 (size!3035 (buf!3510 thiss!1634)) (currentByte!6424 thiss!1634) (currentBit!6419 thiss!1634)) (bitIndex!0 (size!3035 (buf!3510 (_2!7045 lt!233450))) (currentByte!6424 (_2!7045 lt!233450)) (currentBit!6419 (_2!7045 lt!233450)))))))

(declare-fun b!149903 () Bool)

(declare-fun e!100074 () Bool)

(assert (=> b!149903 (= e!100075 e!100074)))

(declare-fun res!125593 () Bool)

(assert (=> b!149903 (=> res!125593 e!100074)))

(assert (=> b!149903 (= res!125593 (= (size!3035 (buf!3510 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!149904 () Bool)

(assert (=> b!149904 (= e!100074 (arrayBitRangesEq!0 (buf!3510 thiss!1634) (buf!3510 (_2!7045 lt!233450)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3035 (buf!3510 thiss!1634)) (currentByte!6424 thiss!1634) (currentBit!6419 thiss!1634))))))

(assert (= (and d!48801 res!125592) b!149902))

(assert (= (and b!149902 res!125594) b!149903))

(assert (= (and b!149903 (not res!125593)) b!149904))

(assert (=> b!149902 m!232831))

(assert (=> b!149902 m!232907))

(assert (=> b!149904 m!232831))

(assert (=> b!149904 m!232831))

(declare-fun m!233519 () Bool)

(assert (=> b!149904 m!233519))

(assert (=> b!149594 d!48801))

(declare-fun b!149915 () Bool)

(declare-fun res!125605 () Bool)

(declare-fun e!100084 () Bool)

(assert (=> b!149915 (=> (not res!125605) (not e!100084))))

(declare-fun lt!234182 () tuple2!13362)

(assert (=> b!149915 (= res!125605 (isPrefixOf!0 (_2!7045 lt!233453) (_2!7045 lt!234182)))))

(declare-fun b!149916 () Bool)

(declare-fun e!100083 () Bool)

(assert (=> b!149916 (= e!100084 e!100083)))

(declare-fun res!125608 () Bool)

(assert (=> b!149916 (=> (not res!125608) (not e!100083))))

(declare-fun lt!234185 () tuple2!13364)

(declare-fun lt!234189 () tuple2!13360)

(assert (=> b!149916 (= res!125608 (and (= (size!3035 (_2!7046 lt!234185)) (size!3035 arr!237)) (= (_1!7046 lt!234185) (_2!7044 lt!234189))))))

(assert (=> b!149916 (= lt!234185 (readByteArrayLoopPure!0 (_1!7044 lt!234189) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!234184 () Unit!9461)

(declare-fun lt!234190 () Unit!9461)

(assert (=> b!149916 (= lt!234184 lt!234190)))

(declare-fun lt!234187 () (_ BitVec 64))

(assert (=> b!149916 (validate_offset_bits!1 ((_ sign_extend 32) (size!3035 (buf!3510 (_2!7045 lt!234182)))) ((_ sign_extend 32) (currentByte!6424 (_2!7045 lt!233453))) ((_ sign_extend 32) (currentBit!6419 (_2!7045 lt!233453))) lt!234187)))

(assert (=> b!149916 (= lt!234190 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!7045 lt!233453) (buf!3510 (_2!7045 lt!234182)) lt!234187))))

(declare-fun e!100082 () Bool)

(assert (=> b!149916 e!100082))

(declare-fun res!125606 () Bool)

(assert (=> b!149916 (=> (not res!125606) (not e!100082))))

(assert (=> b!149916 (= res!125606 (and (= (size!3035 (buf!3510 (_2!7045 lt!233453))) (size!3035 (buf!3510 (_2!7045 lt!234182)))) (bvsge lt!234187 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!149916 (= lt!234187 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!149916 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!149916 (= lt!234189 (reader!0 (_2!7045 lt!233453) (_2!7045 lt!234182)))))

(declare-fun b!149917 () Bool)

(assert (=> b!149917 (= e!100082 (validate_offset_bits!1 ((_ sign_extend 32) (size!3035 (buf!3510 (_2!7045 lt!233453)))) ((_ sign_extend 32) (currentByte!6424 (_2!7045 lt!233453))) ((_ sign_extend 32) (currentBit!6419 (_2!7045 lt!233453))) lt!234187))))

(declare-fun d!48803 () Bool)

(assert (=> d!48803 e!100084))

(declare-fun res!125607 () Bool)

(assert (=> d!48803 (=> (not res!125607) (not e!100084))))

(assert (=> d!48803 (= res!125607 (= (size!3035 (buf!3510 (_2!7045 lt!233453))) (size!3035 (buf!3510 (_2!7045 lt!234182)))))))

(declare-fun choose!64 (BitStream!5328 array!6706 (_ BitVec 32) (_ BitVec 32)) tuple2!13362)

(assert (=> d!48803 (= lt!234182 (choose!64 (_2!7045 lt!233453) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!48803 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!3035 arr!237)))))

(assert (=> d!48803 (= (appendByteArrayLoop!0 (_2!7045 lt!233453) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!234182)))

(declare-fun b!149918 () Bool)

(declare-fun res!125609 () Bool)

(assert (=> b!149918 (=> (not res!125609) (not e!100084))))

(declare-fun lt!234186 () (_ BitVec 64))

(declare-fun lt!234183 () (_ BitVec 64))

(assert (=> b!149918 (= res!125609 (= (bitIndex!0 (size!3035 (buf!3510 (_2!7045 lt!234182))) (currentByte!6424 (_2!7045 lt!234182)) (currentBit!6419 (_2!7045 lt!234182))) (bvadd lt!234186 lt!234183)))))

(assert (=> b!149918 (or (not (= (bvand lt!234186 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!234183 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!234186 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!234186 lt!234183) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!234188 () (_ BitVec 64))

(assert (=> b!149918 (= lt!234183 (bvmul lt!234188 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!149918 (or (= lt!234188 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!234188 #b0000000000000000000000000000000000000000000000000000000000001000) lt!234188)))))

(assert (=> b!149918 (= lt!234188 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!149918 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!149918 (= lt!234186 (bitIndex!0 (size!3035 (buf!3510 (_2!7045 lt!233453))) (currentByte!6424 (_2!7045 lt!233453)) (currentBit!6419 (_2!7045 lt!233453))))))

(declare-fun b!149919 () Bool)

(assert (=> b!149919 (= e!100083 (arrayRangesEq!351 arr!237 (_2!7046 lt!234185) #b00000000000000000000000000000000 to!404))))

(assert (= (and d!48803 res!125607) b!149918))

(assert (= (and b!149918 res!125609) b!149915))

(assert (= (and b!149915 res!125605) b!149916))

(assert (= (and b!149916 res!125606) b!149917))

(assert (= (and b!149916 res!125608) b!149919))

(declare-fun m!233521 () Bool)

(assert (=> d!48803 m!233521))

(declare-fun m!233523 () Bool)

(assert (=> b!149917 m!233523))

(declare-fun m!233525 () Bool)

(assert (=> b!149915 m!233525))

(declare-fun m!233527 () Bool)

(assert (=> b!149919 m!233527))

(declare-fun m!233529 () Bool)

(assert (=> b!149916 m!233529))

(declare-fun m!233531 () Bool)

(assert (=> b!149916 m!233531))

(declare-fun m!233533 () Bool)

(assert (=> b!149916 m!233533))

(declare-fun m!233535 () Bool)

(assert (=> b!149916 m!233535))

(declare-fun m!233537 () Bool)

(assert (=> b!149918 m!233537))

(assert (=> b!149918 m!232893))

(assert (=> b!149594 d!48803))

(declare-fun d!48805 () Bool)

(declare-fun e!100085 () Bool)

(assert (=> d!48805 e!100085))

(declare-fun res!125611 () Bool)

(assert (=> d!48805 (=> (not res!125611) (not e!100085))))

(declare-fun lt!234191 () (_ BitVec 64))

(declare-fun lt!234194 () (_ BitVec 64))

(declare-fun lt!234195 () (_ BitVec 64))

(assert (=> d!48805 (= res!125611 (= lt!234195 (bvsub lt!234191 lt!234194)))))

(assert (=> d!48805 (or (= (bvand lt!234191 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!234194 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!234191 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!234191 lt!234194) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!48805 (= lt!234194 (remainingBits!0 ((_ sign_extend 32) (size!3035 (buf!3510 (_1!7043 lt!233440)))) ((_ sign_extend 32) (currentByte!6424 (_1!7043 lt!233440))) ((_ sign_extend 32) (currentBit!6419 (_1!7043 lt!233440)))))))

(declare-fun lt!234196 () (_ BitVec 64))

(declare-fun lt!234193 () (_ BitVec 64))

(assert (=> d!48805 (= lt!234191 (bvmul lt!234196 lt!234193))))

(assert (=> d!48805 (or (= lt!234196 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!234193 (bvsdiv (bvmul lt!234196 lt!234193) lt!234196)))))

(assert (=> d!48805 (= lt!234193 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!48805 (= lt!234196 ((_ sign_extend 32) (size!3035 (buf!3510 (_1!7043 lt!233440)))))))

(assert (=> d!48805 (= lt!234195 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6424 (_1!7043 lt!233440))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6419 (_1!7043 lt!233440)))))))

(assert (=> d!48805 (invariant!0 (currentBit!6419 (_1!7043 lt!233440)) (currentByte!6424 (_1!7043 lt!233440)) (size!3035 (buf!3510 (_1!7043 lt!233440))))))

(assert (=> d!48805 (= (bitIndex!0 (size!3035 (buf!3510 (_1!7043 lt!233440))) (currentByte!6424 (_1!7043 lt!233440)) (currentBit!6419 (_1!7043 lt!233440))) lt!234195)))

(declare-fun b!149920 () Bool)

(declare-fun res!125610 () Bool)

(assert (=> b!149920 (=> (not res!125610) (not e!100085))))

(assert (=> b!149920 (= res!125610 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!234195))))

(declare-fun b!149921 () Bool)

(declare-fun lt!234192 () (_ BitVec 64))

(assert (=> b!149921 (= e!100085 (bvsle lt!234195 (bvmul lt!234192 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!149921 (or (= lt!234192 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!234192 #b0000000000000000000000000000000000000000000000000000000000001000) lt!234192)))))

(assert (=> b!149921 (= lt!234192 ((_ sign_extend 32) (size!3035 (buf!3510 (_1!7043 lt!233440)))))))

(assert (= (and d!48805 res!125611) b!149920))

(assert (= (and b!149920 res!125610) b!149921))

(declare-fun m!233539 () Bool)

(assert (=> d!48805 m!233539))

(declare-fun m!233541 () Bool)

(assert (=> d!48805 m!233541))

(assert (=> b!149594 d!48805))

(declare-fun d!48807 () Bool)

(declare-fun lt!234197 () tuple2!13378)

(assert (=> d!48807 (= lt!234197 (readByte!0 (BitStream!5329 (buf!3510 (_2!7045 lt!233450)) (currentByte!6424 thiss!1634) (currentBit!6419 thiss!1634))))))

(assert (=> d!48807 (= (readBytePure!0 (BitStream!5329 (buf!3510 (_2!7045 lt!233450)) (currentByte!6424 thiss!1634) (currentBit!6419 thiss!1634))) (tuple2!13359 (_2!7056 lt!234197) (_1!7056 lt!234197)))))

(declare-fun bs!11916 () Bool)

(assert (= bs!11916 d!48807))

(declare-fun m!233543 () Bool)

(assert (=> bs!11916 m!233543))

(assert (=> b!149594 d!48807))

(declare-fun d!48809 () Bool)

(assert (=> d!48809 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3035 (buf!3510 (_2!7045 lt!233450)))) ((_ sign_extend 32) (currentByte!6424 thiss!1634)) ((_ sign_extend 32) (currentBit!6419 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3035 (buf!3510 (_2!7045 lt!233450)))) ((_ sign_extend 32) (currentByte!6424 thiss!1634)) ((_ sign_extend 32) (currentBit!6419 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11917 () Bool)

(assert (= bs!11917 d!48809))

(declare-fun m!233545 () Bool)

(assert (=> bs!11917 m!233545))

(assert (=> b!149594 d!48809))

(declare-fun d!48811 () Bool)

(declare-fun e!100088 () Bool)

(assert (=> d!48811 e!100088))

(declare-fun res!125614 () Bool)

(assert (=> d!48811 (=> (not res!125614) (not e!100088))))

(assert (=> d!48811 (= res!125614 (and (or (let ((rhs!3283 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3283 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3283) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!48812 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!48812 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!48812 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3282 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3282 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3282) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!234206 () Unit!9461)

(declare-fun choose!57 (BitStream!5328 BitStream!5328 (_ BitVec 64) (_ BitVec 32)) Unit!9461)

(assert (=> d!48811 (= lt!234206 (choose!57 thiss!1634 (_2!7045 lt!233453) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> d!48811 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!7045 lt!233453) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)) lt!234206)))

(declare-fun lt!234204 () (_ BitVec 32))

(declare-fun b!149924 () Bool)

(assert (=> b!149924 (= e!100088 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3035 (buf!3510 (_2!7045 lt!233453)))) ((_ sign_extend 32) (currentByte!6424 (_2!7045 lt!233453))) ((_ sign_extend 32) (currentBit!6419 (_2!7045 lt!233453))) (bvsub (bvsub to!404 from!447) lt!234204)))))

(assert (=> b!149924 (or (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand lt!234204 #b10000000000000000000000000000000)) (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!404 from!447) lt!234204) #b10000000000000000000000000000000)))))

(declare-fun lt!234205 () (_ BitVec 64))

(assert (=> b!149924 (= lt!234204 ((_ extract 31 0) lt!234205))))

(assert (=> b!149924 (and (bvslt lt!234205 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!234205 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!149924 (= lt!234205 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!48811 res!125614) b!149924))

(declare-fun m!233547 () Bool)

(assert (=> d!48811 m!233547))

(declare-fun m!233549 () Bool)

(assert (=> b!149924 m!233549))

(assert (=> b!149594 d!48811))

(declare-fun d!48814 () Bool)

(declare-fun moveByteIndex!0 (BitStream!5328 (_ BitVec 32)) tuple2!13362)

(assert (=> d!48814 (= (withMovedByteIndex!0 (_1!7044 lt!233433) #b00000000000000000000000000000001) (_2!7045 (moveByteIndex!0 (_1!7044 lt!233433) #b00000000000000000000000000000001)))))

(declare-fun bs!11918 () Bool)

(assert (= bs!11918 d!48814))

(declare-fun m!233551 () Bool)

(assert (=> bs!11918 m!233551))

(assert (=> b!149594 d!48814))

(declare-fun d!48816 () Bool)

(assert (=> d!48816 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3035 (buf!3510 (_2!7045 lt!233450)))) ((_ sign_extend 32) (currentByte!6424 thiss!1634)) ((_ sign_extend 32) (currentBit!6419 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!234209 () Unit!9461)

(declare-fun choose!26 (BitStream!5328 array!6706 (_ BitVec 32) BitStream!5328) Unit!9461)

(assert (=> d!48816 (= lt!234209 (choose!26 thiss!1634 (buf!3510 (_2!7045 lt!233450)) (bvsub to!404 from!447) (BitStream!5329 (buf!3510 (_2!7045 lt!233450)) (currentByte!6424 thiss!1634) (currentBit!6419 thiss!1634))))))

(assert (=> d!48816 (= (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3510 (_2!7045 lt!233450)) (bvsub to!404 from!447)) lt!234209)))

(declare-fun bs!11919 () Bool)

(assert (= bs!11919 d!48816))

(assert (=> bs!11919 m!232875))

(declare-fun m!233553 () Bool)

(assert (=> bs!11919 m!233553))

(assert (=> b!149594 d!48816))

(declare-fun d!48818 () Bool)

(declare-fun lt!234210 () tuple3!586)

(assert (=> d!48818 (= lt!234210 (readByteArrayLoop!0 (withMovedByteIndex!0 (_1!7044 lt!233433) #b00000000000000000000000000000001) lt!233436 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!48818 (= (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!7044 lt!233433) #b00000000000000000000000000000001) lt!233436 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!13365 (_2!7055 lt!234210) (_3!366 lt!234210)))))

(declare-fun bs!11920 () Bool)

(assert (= bs!11920 d!48818))

(assert (=> bs!11920 m!232885))

(declare-fun m!233555 () Bool)

(assert (=> bs!11920 m!233555))

(assert (=> b!149594 d!48818))

(declare-fun d!48820 () Bool)

(declare-fun lt!234211 () tuple2!13378)

(assert (=> d!48820 (= lt!234211 (readByte!0 (_1!7044 lt!233433)))))

(assert (=> d!48820 (= (readBytePure!0 (_1!7044 lt!233433)) (tuple2!13359 (_2!7056 lt!234211) (_1!7056 lt!234211)))))

(declare-fun bs!11921 () Bool)

(assert (= bs!11921 d!48820))

(declare-fun m!233557 () Bool)

(assert (=> bs!11921 m!233557))

(assert (=> b!149594 d!48820))

(declare-fun d!48822 () Bool)

(assert (=> d!48822 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3035 (buf!3510 (_2!7045 lt!233450)))) ((_ sign_extend 32) (currentByte!6424 (_2!7045 lt!233453))) ((_ sign_extend 32) (currentBit!6419 (_2!7045 lt!233453))) lt!233429) (bvsle ((_ sign_extend 32) lt!233429) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3035 (buf!3510 (_2!7045 lt!233450)))) ((_ sign_extend 32) (currentByte!6424 (_2!7045 lt!233453))) ((_ sign_extend 32) (currentBit!6419 (_2!7045 lt!233453)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11922 () Bool)

(assert (= bs!11922 d!48822))

(assert (=> bs!11922 m!233433))

(assert (=> b!149594 d!48822))

(declare-fun d!48824 () Bool)

(declare-fun lt!234212 () tuple3!586)

(assert (=> d!48824 (= lt!234212 (readByteArrayLoop!0 (_1!7044 lt!233441) lt!233436 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!48824 (= (readByteArrayLoopPure!0 (_1!7044 lt!233441) lt!233436 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!13365 (_2!7055 lt!234212) (_3!366 lt!234212)))))

(declare-fun bs!11923 () Bool)

(assert (= bs!11923 d!48824))

(declare-fun m!233559 () Bool)

(assert (=> bs!11923 m!233559))

(assert (=> b!149594 d!48824))

(declare-fun d!48826 () Bool)

(declare-fun e!100089 () Bool)

(assert (=> d!48826 e!100089))

(declare-fun res!125616 () Bool)

(assert (=> d!48826 (=> (not res!125616) (not e!100089))))

(declare-fun lt!234217 () (_ BitVec 64))

(declare-fun lt!234213 () (_ BitVec 64))

(declare-fun lt!234216 () (_ BitVec 64))

(assert (=> d!48826 (= res!125616 (= lt!234217 (bvsub lt!234213 lt!234216)))))

(assert (=> d!48826 (or (= (bvand lt!234213 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!234216 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!234213 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!234213 lt!234216) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!48826 (= lt!234216 (remainingBits!0 ((_ sign_extend 32) (size!3035 (buf!3510 (_1!7043 lt!233442)))) ((_ sign_extend 32) (currentByte!6424 (_1!7043 lt!233442))) ((_ sign_extend 32) (currentBit!6419 (_1!7043 lt!233442)))))))

(declare-fun lt!234218 () (_ BitVec 64))

(declare-fun lt!234215 () (_ BitVec 64))

(assert (=> d!48826 (= lt!234213 (bvmul lt!234218 lt!234215))))

(assert (=> d!48826 (or (= lt!234218 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!234215 (bvsdiv (bvmul lt!234218 lt!234215) lt!234218)))))

(assert (=> d!48826 (= lt!234215 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!48826 (= lt!234218 ((_ sign_extend 32) (size!3035 (buf!3510 (_1!7043 lt!233442)))))))

(assert (=> d!48826 (= lt!234217 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6424 (_1!7043 lt!233442))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6419 (_1!7043 lt!233442)))))))

(assert (=> d!48826 (invariant!0 (currentBit!6419 (_1!7043 lt!233442)) (currentByte!6424 (_1!7043 lt!233442)) (size!3035 (buf!3510 (_1!7043 lt!233442))))))

(assert (=> d!48826 (= (bitIndex!0 (size!3035 (buf!3510 (_1!7043 lt!233442))) (currentByte!6424 (_1!7043 lt!233442)) (currentBit!6419 (_1!7043 lt!233442))) lt!234217)))

(declare-fun b!149925 () Bool)

(declare-fun res!125615 () Bool)

(assert (=> b!149925 (=> (not res!125615) (not e!100089))))

(assert (=> b!149925 (= res!125615 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!234217))))

(declare-fun b!149926 () Bool)

(declare-fun lt!234214 () (_ BitVec 64))

(assert (=> b!149926 (= e!100089 (bvsle lt!234217 (bvmul lt!234214 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!149926 (or (= lt!234214 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!234214 #b0000000000000000000000000000000000000000000000000000000000001000) lt!234214)))))

(assert (=> b!149926 (= lt!234214 ((_ sign_extend 32) (size!3035 (buf!3510 (_1!7043 lt!233442)))))))

(assert (= (and d!48826 res!125616) b!149925))

(assert (= (and b!149925 res!125615) b!149926))

(declare-fun m!233561 () Bool)

(assert (=> d!48826 m!233561))

(declare-fun m!233563 () Bool)

(assert (=> d!48826 m!233563))

(assert (=> b!149594 d!48826))

(declare-fun d!48828 () Bool)

(declare-fun lt!234219 () tuple2!13378)

(assert (=> d!48828 (= lt!234219 (readByte!0 lt!233455))))

(assert (=> d!48828 (= (readBytePure!0 lt!233455) (tuple2!13359 (_2!7056 lt!234219) (_1!7056 lt!234219)))))

(declare-fun bs!11924 () Bool)

(assert (= bs!11924 d!48828))

(declare-fun m!233565 () Bool)

(assert (=> bs!11924 m!233565))

(assert (=> b!149594 d!48828))

(declare-fun d!48830 () Bool)

(assert (=> d!48830 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3035 (buf!3510 (_2!7045 lt!233450)))) ((_ sign_extend 32) (currentByte!6424 (_2!7045 lt!233453))) ((_ sign_extend 32) (currentBit!6419 (_2!7045 lt!233453))) lt!233429)))

(declare-fun lt!234220 () Unit!9461)

(assert (=> d!48830 (= lt!234220 (choose!26 (_2!7045 lt!233453) (buf!3510 (_2!7045 lt!233450)) lt!233429 (BitStream!5329 (buf!3510 (_2!7045 lt!233450)) (currentByte!6424 (_2!7045 lt!233453)) (currentBit!6419 (_2!7045 lt!233453)))))))

(assert (=> d!48830 (= (validateOffsetBytesContentIrrelevancyLemma!0 (_2!7045 lt!233453) (buf!3510 (_2!7045 lt!233450)) lt!233429) lt!234220)))

(declare-fun bs!11925 () Bool)

(assert (= bs!11925 d!48830))

(assert (=> bs!11925 m!232873))

(declare-fun m!233567 () Bool)

(assert (=> bs!11925 m!233567))

(assert (=> b!149594 d!48830))

(declare-fun d!48832 () Bool)

(assert (=> d!48832 (isPrefixOf!0 thiss!1634 (_2!7045 lt!233450))))

(declare-fun lt!234223 () Unit!9461)

(declare-fun choose!30 (BitStream!5328 BitStream!5328 BitStream!5328) Unit!9461)

(assert (=> d!48832 (= lt!234223 (choose!30 thiss!1634 (_2!7045 lt!233453) (_2!7045 lt!233450)))))

(assert (=> d!48832 (isPrefixOf!0 thiss!1634 (_2!7045 lt!233453))))

(assert (=> d!48832 (= (lemmaIsPrefixTransitive!0 thiss!1634 (_2!7045 lt!233453) (_2!7045 lt!233450)) lt!234223)))

(declare-fun bs!11926 () Bool)

(assert (= bs!11926 d!48832))

(assert (=> bs!11926 m!232857))

(declare-fun m!233569 () Bool)

(assert (=> bs!11926 m!233569))

(assert (=> bs!11926 m!232833))

(assert (=> b!149594 d!48832))

(declare-fun d!48834 () Bool)

(declare-fun lt!234232 () tuple2!13364)

(declare-fun lt!234234 () tuple2!13364)

(assert (=> d!48834 (arrayRangesEq!351 (_2!7046 lt!234232) (_2!7046 lt!234234) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!234235 () Unit!9461)

(declare-fun lt!234233 () BitStream!5328)

(declare-fun choose!35 (BitStream!5328 array!6706 (_ BitVec 32) (_ BitVec 32) tuple2!13364 array!6706 BitStream!5328 tuple2!13364 array!6706) Unit!9461)

(assert (=> d!48834 (= lt!234235 (choose!35 (_1!7044 lt!233433) arr!237 from!447 to!404 lt!234232 (_2!7046 lt!234232) lt!234233 lt!234234 (_2!7046 lt!234234)))))

(assert (=> d!48834 (= lt!234234 (readByteArrayLoopPure!0 lt!234233 (array!6707 (store (arr!3819 arr!237) from!447 (_2!7043 (readBytePure!0 (_1!7044 lt!233433)))) (size!3035 arr!237)) (bvadd from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> d!48834 (= lt!234233 (withMovedByteIndex!0 (_1!7044 lt!233433) #b00000000000000000000000000000001))))

(assert (=> d!48834 (= lt!234232 (readByteArrayLoopPure!0 (_1!7044 lt!233433) arr!237 from!447 to!404))))

(assert (=> d!48834 (= (readByteArrayLoopArrayPrefixLemma!0 (_1!7044 lt!233433) arr!237 from!447 to!404) lt!234235)))

(declare-fun bs!11928 () Bool)

(assert (= bs!11928 d!48834))

(declare-fun m!233571 () Bool)

(assert (=> bs!11928 m!233571))

(assert (=> bs!11928 m!232885))

(assert (=> bs!11928 m!232881))

(declare-fun m!233573 () Bool)

(assert (=> bs!11928 m!233573))

(declare-fun m!233575 () Bool)

(assert (=> bs!11928 m!233575))

(declare-fun m!233577 () Bool)

(assert (=> bs!11928 m!233577))

(assert (=> bs!11928 m!232851))

(assert (=> b!149594 d!48834))

(declare-fun d!48836 () Bool)

(declare-fun res!125617 () Bool)

(declare-fun e!100090 () Bool)

(assert (=> d!48836 (=> res!125617 e!100090)))

(assert (=> d!48836 (= res!125617 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!48836 (= (arrayRangesEq!351 (_2!7046 lt!233446) (_2!7046 lt!233445) #b00000000000000000000000000000000 to!404) e!100090)))

(declare-fun b!149927 () Bool)

(declare-fun e!100091 () Bool)

(assert (=> b!149927 (= e!100090 e!100091)))

(declare-fun res!125618 () Bool)

(assert (=> b!149927 (=> (not res!125618) (not e!100091))))

(assert (=> b!149927 (= res!125618 (= (select (arr!3819 (_2!7046 lt!233446)) #b00000000000000000000000000000000) (select (arr!3819 (_2!7046 lt!233445)) #b00000000000000000000000000000000)))))

(declare-fun b!149928 () Bool)

(assert (=> b!149928 (= e!100091 (arrayRangesEq!351 (_2!7046 lt!233446) (_2!7046 lt!233445) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!48836 (not res!125617)) b!149927))

(assert (= (and b!149927 res!125618) b!149928))

(assert (=> b!149927 m!233503))

(declare-fun m!233579 () Bool)

(assert (=> b!149927 m!233579))

(declare-fun m!233581 () Bool)

(assert (=> b!149928 m!233581))

(assert (=> b!149594 d!48836))

(declare-fun d!48838 () Bool)

(declare-fun e!100094 () Bool)

(assert (=> d!48838 e!100094))

(declare-fun res!125625 () Bool)

(assert (=> d!48838 (=> (not res!125625) (not e!100094))))

(declare-fun lt!234248 () tuple2!13362)

(assert (=> d!48838 (= res!125625 (= (size!3035 (buf!3510 thiss!1634)) (size!3035 (buf!3510 (_2!7045 lt!234248)))))))

(declare-fun choose!6 (BitStream!5328 (_ BitVec 8)) tuple2!13362)

(assert (=> d!48838 (= lt!234248 (choose!6 thiss!1634 (select (arr!3819 arr!237) from!447)))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!48838 (validate_offset_byte!0 ((_ sign_extend 32) (size!3035 (buf!3510 thiss!1634))) ((_ sign_extend 32) (currentByte!6424 thiss!1634)) ((_ sign_extend 32) (currentBit!6419 thiss!1634)))))

(assert (=> d!48838 (= (appendByte!0 thiss!1634 (select (arr!3819 arr!237) from!447)) lt!234248)))

(declare-fun b!149935 () Bool)

(declare-fun res!125627 () Bool)

(assert (=> b!149935 (=> (not res!125627) (not e!100094))))

(declare-fun lt!234246 () (_ BitVec 64))

(declare-fun lt!234247 () (_ BitVec 64))

(assert (=> b!149935 (= res!125627 (= (bitIndex!0 (size!3035 (buf!3510 (_2!7045 lt!234248))) (currentByte!6424 (_2!7045 lt!234248)) (currentBit!6419 (_2!7045 lt!234248))) (bvadd lt!234246 lt!234247)))))

(assert (=> b!149935 (or (not (= (bvand lt!234246 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!234247 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!234246 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!234246 lt!234247) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!149935 (= lt!234247 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!149935 (= lt!234246 (bitIndex!0 (size!3035 (buf!3510 thiss!1634)) (currentByte!6424 thiss!1634) (currentBit!6419 thiss!1634)))))

(declare-fun b!149936 () Bool)

(declare-fun res!125626 () Bool)

(assert (=> b!149936 (=> (not res!125626) (not e!100094))))

(assert (=> b!149936 (= res!125626 (isPrefixOf!0 thiss!1634 (_2!7045 lt!234248)))))

(declare-fun lt!234249 () tuple2!13358)

(declare-fun b!149937 () Bool)

(declare-fun lt!234250 () tuple2!13360)

(assert (=> b!149937 (= e!100094 (and (= (_2!7043 lt!234249) (select (arr!3819 arr!237) from!447)) (= (_1!7043 lt!234249) (_2!7044 lt!234250))))))

(assert (=> b!149937 (= lt!234249 (readBytePure!0 (_1!7044 lt!234250)))))

(assert (=> b!149937 (= lt!234250 (reader!0 thiss!1634 (_2!7045 lt!234248)))))

(assert (= (and d!48838 res!125625) b!149935))

(assert (= (and b!149935 res!125627) b!149936))

(assert (= (and b!149936 res!125626) b!149937))

(assert (=> d!48838 m!232815))

(declare-fun m!233583 () Bool)

(assert (=> d!48838 m!233583))

(declare-fun m!233585 () Bool)

(assert (=> d!48838 m!233585))

(declare-fun m!233587 () Bool)

(assert (=> b!149935 m!233587))

(assert (=> b!149935 m!232831))

(declare-fun m!233589 () Bool)

(assert (=> b!149936 m!233589))

(declare-fun m!233591 () Bool)

(assert (=> b!149937 m!233591))

(declare-fun m!233593 () Bool)

(assert (=> b!149937 m!233593))

(assert (=> b!149594 d!48838))

(declare-fun b!149938 () Bool)

(declare-fun res!125628 () Bool)

(declare-fun e!100096 () Bool)

(assert (=> b!149938 (=> (not res!125628) (not e!100096))))

(declare-fun lt!234262 () tuple2!13360)

(assert (=> b!149938 (= res!125628 (isPrefixOf!0 (_2!7044 lt!234262) (_2!7045 lt!233450)))))

(declare-fun d!48840 () Bool)

(assert (=> d!48840 e!100096))

(declare-fun res!125630 () Bool)

(assert (=> d!48840 (=> (not res!125630) (not e!100096))))

(assert (=> d!48840 (= res!125630 (isPrefixOf!0 (_1!7044 lt!234262) (_2!7044 lt!234262)))))

(declare-fun lt!234270 () BitStream!5328)

(assert (=> d!48840 (= lt!234262 (tuple2!13361 lt!234270 (_2!7045 lt!233450)))))

(declare-fun lt!234266 () Unit!9461)

(declare-fun lt!234256 () Unit!9461)

(assert (=> d!48840 (= lt!234266 lt!234256)))

(assert (=> d!48840 (isPrefixOf!0 lt!234270 (_2!7045 lt!233450))))

(assert (=> d!48840 (= lt!234256 (lemmaIsPrefixTransitive!0 lt!234270 (_2!7045 lt!233450) (_2!7045 lt!233450)))))

(declare-fun lt!234268 () Unit!9461)

(declare-fun lt!234267 () Unit!9461)

(assert (=> d!48840 (= lt!234268 lt!234267)))

(assert (=> d!48840 (isPrefixOf!0 lt!234270 (_2!7045 lt!233450))))

(assert (=> d!48840 (= lt!234267 (lemmaIsPrefixTransitive!0 lt!234270 thiss!1634 (_2!7045 lt!233450)))))

(declare-fun lt!234261 () Unit!9461)

(declare-fun e!100095 () Unit!9461)

(assert (=> d!48840 (= lt!234261 e!100095)))

(declare-fun c!8056 () Bool)

(assert (=> d!48840 (= c!8056 (not (= (size!3035 (buf!3510 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!234263 () Unit!9461)

(declare-fun lt!234252 () Unit!9461)

(assert (=> d!48840 (= lt!234263 lt!234252)))

(assert (=> d!48840 (isPrefixOf!0 (_2!7045 lt!233450) (_2!7045 lt!233450))))

(assert (=> d!48840 (= lt!234252 (lemmaIsPrefixRefl!0 (_2!7045 lt!233450)))))

(declare-fun lt!234264 () Unit!9461)

(declare-fun lt!234269 () Unit!9461)

(assert (=> d!48840 (= lt!234264 lt!234269)))

(assert (=> d!48840 (= lt!234269 (lemmaIsPrefixRefl!0 (_2!7045 lt!233450)))))

(declare-fun lt!234258 () Unit!9461)

(declare-fun lt!234255 () Unit!9461)

(assert (=> d!48840 (= lt!234258 lt!234255)))

(assert (=> d!48840 (isPrefixOf!0 lt!234270 lt!234270)))

(assert (=> d!48840 (= lt!234255 (lemmaIsPrefixRefl!0 lt!234270))))

(declare-fun lt!234251 () Unit!9461)

(declare-fun lt!234260 () Unit!9461)

(assert (=> d!48840 (= lt!234251 lt!234260)))

(assert (=> d!48840 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!48840 (= lt!234260 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!48840 (= lt!234270 (BitStream!5329 (buf!3510 (_2!7045 lt!233450)) (currentByte!6424 thiss!1634) (currentBit!6419 thiss!1634)))))

(assert (=> d!48840 (isPrefixOf!0 thiss!1634 (_2!7045 lt!233450))))

(assert (=> d!48840 (= (reader!0 thiss!1634 (_2!7045 lt!233450)) lt!234262)))

(declare-fun b!149939 () Bool)

(declare-fun Unit!9473 () Unit!9461)

(assert (=> b!149939 (= e!100095 Unit!9473)))

(declare-fun b!149940 () Bool)

(declare-fun lt!234257 () Unit!9461)

(assert (=> b!149940 (= e!100095 lt!234257)))

(declare-fun lt!234265 () (_ BitVec 64))

(assert (=> b!149940 (= lt!234265 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!234259 () (_ BitVec 64))

(assert (=> b!149940 (= lt!234259 (bitIndex!0 (size!3035 (buf!3510 thiss!1634)) (currentByte!6424 thiss!1634) (currentBit!6419 thiss!1634)))))

(assert (=> b!149940 (= lt!234257 (arrayBitRangesEqSymmetric!0 (buf!3510 thiss!1634) (buf!3510 (_2!7045 lt!233450)) lt!234265 lt!234259))))

(assert (=> b!149940 (arrayBitRangesEq!0 (buf!3510 (_2!7045 lt!233450)) (buf!3510 thiss!1634) lt!234265 lt!234259)))

(declare-fun b!149941 () Bool)

(declare-fun res!125629 () Bool)

(assert (=> b!149941 (=> (not res!125629) (not e!100096))))

(assert (=> b!149941 (= res!125629 (isPrefixOf!0 (_1!7044 lt!234262) thiss!1634))))

(declare-fun b!149942 () Bool)

(declare-fun lt!234254 () (_ BitVec 64))

(declare-fun lt!234253 () (_ BitVec 64))

(assert (=> b!149942 (= e!100096 (= (_1!7044 lt!234262) (withMovedBitIndex!0 (_2!7044 lt!234262) (bvsub lt!234253 lt!234254))))))

(assert (=> b!149942 (or (= (bvand lt!234253 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!234254 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!234253 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!234253 lt!234254) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!149942 (= lt!234254 (bitIndex!0 (size!3035 (buf!3510 (_2!7045 lt!233450))) (currentByte!6424 (_2!7045 lt!233450)) (currentBit!6419 (_2!7045 lt!233450))))))

(assert (=> b!149942 (= lt!234253 (bitIndex!0 (size!3035 (buf!3510 thiss!1634)) (currentByte!6424 thiss!1634) (currentBit!6419 thiss!1634)))))

(assert (= (and d!48840 c!8056) b!149940))

(assert (= (and d!48840 (not c!8056)) b!149939))

(assert (= (and d!48840 res!125630) b!149941))

(assert (= (and b!149941 res!125629) b!149938))

(assert (= (and b!149938 res!125628) b!149942))

(declare-fun m!233595 () Bool)

(assert (=> d!48840 m!233595))

(declare-fun m!233597 () Bool)

(assert (=> d!48840 m!233597))

(assert (=> d!48840 m!233441))

(declare-fun m!233599 () Bool)

(assert (=> d!48840 m!233599))

(assert (=> d!48840 m!232857))

(assert (=> d!48840 m!233479))

(declare-fun m!233601 () Bool)

(assert (=> d!48840 m!233601))

(declare-fun m!233603 () Bool)

(assert (=> d!48840 m!233603))

(assert (=> d!48840 m!233451))

(declare-fun m!233605 () Bool)

(assert (=> d!48840 m!233605))

(assert (=> d!48840 m!233487))

(declare-fun m!233607 () Bool)

(assert (=> b!149941 m!233607))

(assert (=> b!149940 m!232831))

(declare-fun m!233609 () Bool)

(assert (=> b!149940 m!233609))

(declare-fun m!233611 () Bool)

(assert (=> b!149940 m!233611))

(declare-fun m!233613 () Bool)

(assert (=> b!149938 m!233613))

(declare-fun m!233615 () Bool)

(assert (=> b!149942 m!233615))

(assert (=> b!149942 m!232907))

(assert (=> b!149942 m!232831))

(assert (=> b!149594 d!48840))

(declare-fun d!48842 () Bool)

(declare-fun e!100099 () Bool)

(assert (=> d!48842 e!100099))

(declare-fun res!125633 () Bool)

(assert (=> d!48842 (=> (not res!125633) (not e!100099))))

(declare-fun lt!234279 () tuple2!13358)

(declare-fun lt!234281 () tuple2!13358)

(assert (=> d!48842 (= res!125633 (= (bitIndex!0 (size!3035 (buf!3510 (_1!7043 lt!234279))) (currentByte!6424 (_1!7043 lt!234279)) (currentBit!6419 (_1!7043 lt!234279))) (bitIndex!0 (size!3035 (buf!3510 (_1!7043 lt!234281))) (currentByte!6424 (_1!7043 lt!234281)) (currentBit!6419 (_1!7043 lt!234281)))))))

(declare-fun lt!234280 () Unit!9461)

(declare-fun lt!234282 () BitStream!5328)

(declare-fun choose!14 (BitStream!5328 BitStream!5328 BitStream!5328 tuple2!13358 tuple2!13358 BitStream!5328 (_ BitVec 8) tuple2!13358 tuple2!13358 BitStream!5328 (_ BitVec 8)) Unit!9461)

(assert (=> d!48842 (= lt!234280 (choose!14 lt!233455 (_2!7045 lt!233450) lt!234282 lt!234279 (tuple2!13359 (_1!7043 lt!234279) (_2!7043 lt!234279)) (_1!7043 lt!234279) (_2!7043 lt!234279) lt!234281 (tuple2!13359 (_1!7043 lt!234281) (_2!7043 lt!234281)) (_1!7043 lt!234281) (_2!7043 lt!234281)))))

(assert (=> d!48842 (= lt!234281 (readBytePure!0 lt!234282))))

(assert (=> d!48842 (= lt!234279 (readBytePure!0 lt!233455))))

(assert (=> d!48842 (= lt!234282 (BitStream!5329 (buf!3510 (_2!7045 lt!233450)) (currentByte!6424 lt!233455) (currentBit!6419 lt!233455)))))

(assert (=> d!48842 (= (readBytePrefixLemma!0 lt!233455 (_2!7045 lt!233450)) lt!234280)))

(declare-fun b!149945 () Bool)

(assert (=> b!149945 (= e!100099 (= (_2!7043 lt!234279) (_2!7043 lt!234281)))))

(assert (= (and d!48842 res!125633) b!149945))

(declare-fun m!233617 () Bool)

(assert (=> d!48842 m!233617))

(declare-fun m!233619 () Bool)

(assert (=> d!48842 m!233619))

(declare-fun m!233621 () Bool)

(assert (=> d!48842 m!233621))

(assert (=> d!48842 m!232883))

(declare-fun m!233623 () Bool)

(assert (=> d!48842 m!233623))

(assert (=> b!149594 d!48842))

(assert (=> b!149593 d!48759))

(check-sat (not d!48769) (not d!48834) (not b!149915) (not d!48767) (not d!48816) (not b!149883) (not b!149881) (not d!48830) (not b!149899) (not b!149882) (not d!48777) (not b!149924) (not b!149918) (not b!149938) (not b!149935) (not b!149901) (not d!48765) (not b!149919) (not b!149875) (not d!48832) (not d!48763) (not d!48826) (not b!149916) (not b!149917) (not d!48789) (not b!149895) (not d!48824) (not b!149853) (not b!149874) (not d!48775) (not d!48805) (not d!48820) (not b!149876) (not b!149940) (not d!48771) (not d!48795) (not b!149902) (not d!48822) (not b!149897) (not d!48759) (not b!149928) (not b!149890) (not d!48828) (not d!48761) (not d!48818) (not d!48781) (not d!48809) (not d!48811) (not d!48838) (not d!48842) (not d!48803) (not b!149879) (not d!48814) (not b!149893) (not b!149941) (not b!149904) (not b!149936) (not b!149892) (not b!149937) (not b!149942) (not d!48757) (not d!48807) (not b!149872) (not d!48793) (not d!48797) (not d!48840))
