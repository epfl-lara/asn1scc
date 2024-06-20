; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54104 () Bool)

(assert start!54104)

(declare-fun b!252460 () Bool)

(declare-fun res!211523 () Bool)

(declare-fun e!174944 () Bool)

(assert (=> b!252460 (=> (not res!211523) (not e!174944))))

(declare-datatypes ((array!13728 0))(
  ( (array!13729 (arr!7010 (Array (_ BitVec 32) (_ BitVec 8))) (size!6023 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10968 0))(
  ( (BitStream!10969 (buf!6525 array!13728) (currentByte!11980 (_ BitVec 32)) (currentBit!11975 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10968)

(declare-datatypes ((Unit!18194 0))(
  ( (Unit!18195) )
))
(declare-datatypes ((tuple2!21708 0))(
  ( (tuple2!21709 (_1!11782 Unit!18194) (_2!11782 BitStream!10968)) )
))
(declare-fun lt!392119 () tuple2!21708)

(declare-fun isPrefixOf!0 (BitStream!10968 BitStream!10968) Bool)

(assert (=> b!252460 (= res!211523 (isPrefixOf!0 thiss!1005 (_2!11782 lt!392119)))))

(declare-fun b!252461 () Bool)

(declare-fun e!174946 () Bool)

(declare-fun e!174947 () Bool)

(assert (=> b!252461 (= e!174946 e!174947)))

(declare-fun res!211519 () Bool)

(assert (=> b!252461 (=> (not res!211519) (not e!174947))))

(declare-fun lt!392111 () tuple2!21708)

(declare-fun lt!392118 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!252461 (= res!211519 (= (bitIndex!0 (size!6023 (buf!6525 (_2!11782 lt!392111))) (currentByte!11980 (_2!11782 lt!392111)) (currentBit!11975 (_2!11782 lt!392111))) (bvadd (bitIndex!0 (size!6023 (buf!6525 (_2!11782 lt!392119))) (currentByte!11980 (_2!11782 lt!392119)) (currentBit!11975 (_2!11782 lt!392119))) lt!392118)))))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> b!252461 (= lt!392118 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!252462 () Bool)

(declare-fun res!211513 () Bool)

(assert (=> b!252462 (=> (not res!211513) (not e!174947))))

(assert (=> b!252462 (= res!211513 (isPrefixOf!0 (_2!11782 lt!392119) (_2!11782 lt!392111)))))

(declare-fun b!252463 () Bool)

(declare-fun e!174950 () Bool)

(assert (=> b!252463 (= e!174950 e!174944)))

(declare-fun res!211512 () Bool)

(assert (=> b!252463 (=> (not res!211512) (not e!174944))))

(declare-fun lt!392124 () (_ BitVec 64))

(declare-fun lt!392108 () (_ BitVec 64))

(assert (=> b!252463 (= res!211512 (= lt!392124 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!392108)))))

(assert (=> b!252463 (= lt!392124 (bitIndex!0 (size!6023 (buf!6525 (_2!11782 lt!392119))) (currentByte!11980 (_2!11782 lt!392119)) (currentBit!11975 (_2!11782 lt!392119))))))

(assert (=> b!252463 (= lt!392108 (bitIndex!0 (size!6023 (buf!6525 thiss!1005)) (currentByte!11980 thiss!1005) (currentBit!11975 thiss!1005)))))

(declare-fun b!252464 () Bool)

(declare-fun e!174945 () Bool)

(declare-datatypes ((tuple2!21710 0))(
  ( (tuple2!21711 (_1!11783 BitStream!10968) (_2!11783 Bool)) )
))
(declare-fun lt!392113 () tuple2!21710)

(assert (=> b!252464 (= e!174945 (= (bitIndex!0 (size!6023 (buf!6525 (_1!11783 lt!392113))) (currentByte!11980 (_1!11783 lt!392113)) (currentBit!11975 (_1!11783 lt!392113))) lt!392124))))

(declare-fun b!252465 () Bool)

(declare-fun e!174942 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!252465 (= e!174942 (invariant!0 (currentBit!11975 thiss!1005) (currentByte!11980 thiss!1005) (size!6023 (buf!6525 (_2!11782 lt!392111)))))))

(declare-fun b!252466 () Bool)

(declare-fun lt!392121 () tuple2!21710)

(declare-datatypes ((tuple2!21712 0))(
  ( (tuple2!21713 (_1!11784 BitStream!10968) (_2!11784 BitStream!10968)) )
))
(declare-fun lt!392116 () tuple2!21712)

(assert (=> b!252466 (= e!174947 (not (or (not (_2!11783 lt!392121)) (not (= (_1!11783 lt!392121) (_2!11784 lt!392116))))))))

(declare-fun bit!26 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!10968 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21710)

(assert (=> b!252466 (= lt!392121 (checkBitsLoopPure!0 (_1!11784 lt!392116) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!252466 (validate_offset_bits!1 ((_ sign_extend 32) (size!6023 (buf!6525 (_2!11782 lt!392111)))) ((_ sign_extend 32) (currentByte!11980 (_2!11782 lt!392119))) ((_ sign_extend 32) (currentBit!11975 (_2!11782 lt!392119))) lt!392118)))

(declare-fun lt!392120 () Unit!18194)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10968 array!13728 (_ BitVec 64)) Unit!18194)

(assert (=> b!252466 (= lt!392120 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11782 lt!392119) (buf!6525 (_2!11782 lt!392111)) lt!392118))))

(declare-fun reader!0 (BitStream!10968 BitStream!10968) tuple2!21712)

(assert (=> b!252466 (= lt!392116 (reader!0 (_2!11782 lt!392119) (_2!11782 lt!392111)))))

(declare-fun b!252467 () Bool)

(declare-fun res!211518 () Bool)

(assert (=> b!252467 (=> (not res!211518) (not e!174942))))

(assert (=> b!252467 (= res!211518 (invariant!0 (currentBit!11975 thiss!1005) (currentByte!11980 thiss!1005) (size!6023 (buf!6525 (_2!11782 lt!392119)))))))

(declare-fun res!211517 () Bool)

(declare-fun e!174949 () Bool)

(assert (=> start!54104 (=> (not res!211517) (not e!174949))))

(assert (=> start!54104 (= res!211517 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!54104 e!174949))

(assert (=> start!54104 true))

(declare-fun e!174943 () Bool)

(declare-fun inv!12 (BitStream!10968) Bool)

(assert (=> start!54104 (and (inv!12 thiss!1005) e!174943)))

(declare-fun b!252468 () Bool)

(assert (=> b!252468 (= e!174944 e!174945)))

(declare-fun res!211521 () Bool)

(assert (=> b!252468 (=> (not res!211521) (not e!174945))))

(assert (=> b!252468 (= res!211521 (and (= (_2!11783 lt!392113) bit!26) (= (_1!11783 lt!392113) (_2!11782 lt!392119))))))

(declare-fun readBitPure!0 (BitStream!10968) tuple2!21710)

(declare-fun readerFrom!0 (BitStream!10968 (_ BitVec 32) (_ BitVec 32)) BitStream!10968)

(assert (=> b!252468 (= lt!392113 (readBitPure!0 (readerFrom!0 (_2!11782 lt!392119) (currentBit!11975 thiss!1005) (currentByte!11980 thiss!1005))))))

(declare-fun b!252469 () Bool)

(declare-fun e!174941 () Bool)

(declare-fun lt!392115 () tuple2!21710)

(declare-fun lt!392109 () tuple2!21710)

(assert (=> b!252469 (= e!174941 (= (_2!11783 lt!392115) (_2!11783 lt!392109)))))

(declare-fun b!252470 () Bool)

(declare-fun res!211515 () Bool)

(assert (=> b!252470 (=> (not res!211515) (not e!174949))))

(assert (=> b!252470 (= res!211515 (validate_offset_bits!1 ((_ sign_extend 32) (size!6023 (buf!6525 thiss!1005))) ((_ sign_extend 32) (currentByte!11980 thiss!1005)) ((_ sign_extend 32) (currentBit!11975 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!252471 () Bool)

(declare-fun array_inv!5764 (array!13728) Bool)

(assert (=> b!252471 (= e!174943 (array_inv!5764 (buf!6525 thiss!1005)))))

(declare-fun b!252472 () Bool)

(declare-fun res!211520 () Bool)

(assert (=> b!252472 (=> (not res!211520) (not e!174949))))

(assert (=> b!252472 (= res!211520 (bvslt from!289 nBits!297))))

(declare-fun b!252473 () Bool)

(assert (=> b!252473 (= e!174949 (not true))))

(declare-fun lt!392107 () tuple2!21712)

(declare-fun lt!392110 () tuple2!21710)

(assert (=> b!252473 (= lt!392110 (checkBitsLoopPure!0 (_1!11784 lt!392107) nBits!297 bit!26 from!289))))

(assert (=> b!252473 (validate_offset_bits!1 ((_ sign_extend 32) (size!6023 (buf!6525 (_2!11782 lt!392111)))) ((_ sign_extend 32) (currentByte!11980 thiss!1005)) ((_ sign_extend 32) (currentBit!11975 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!392122 () Unit!18194)

(assert (=> b!252473 (= lt!392122 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6525 (_2!11782 lt!392111)) (bvsub nBits!297 from!289)))))

(assert (=> b!252473 (= (_2!11783 (readBitPure!0 (_1!11784 lt!392107))) bit!26)))

(declare-fun lt!392106 () tuple2!21712)

(assert (=> b!252473 (= lt!392106 (reader!0 (_2!11782 lt!392119) (_2!11782 lt!392111)))))

(assert (=> b!252473 (= lt!392107 (reader!0 thiss!1005 (_2!11782 lt!392111)))))

(assert (=> b!252473 e!174941))

(declare-fun res!211522 () Bool)

(assert (=> b!252473 (=> (not res!211522) (not e!174941))))

(assert (=> b!252473 (= res!211522 (= (bitIndex!0 (size!6023 (buf!6525 (_1!11783 lt!392115))) (currentByte!11980 (_1!11783 lt!392115)) (currentBit!11975 (_1!11783 lt!392115))) (bitIndex!0 (size!6023 (buf!6525 (_1!11783 lt!392109))) (currentByte!11980 (_1!11783 lt!392109)) (currentBit!11975 (_1!11783 lt!392109)))))))

(declare-fun lt!392112 () Unit!18194)

(declare-fun lt!392123 () BitStream!10968)

(declare-fun readBitPrefixLemma!0 (BitStream!10968 BitStream!10968) Unit!18194)

(assert (=> b!252473 (= lt!392112 (readBitPrefixLemma!0 lt!392123 (_2!11782 lt!392111)))))

(assert (=> b!252473 (= lt!392109 (readBitPure!0 (BitStream!10969 (buf!6525 (_2!11782 lt!392111)) (currentByte!11980 thiss!1005) (currentBit!11975 thiss!1005))))))

(assert (=> b!252473 (= lt!392115 (readBitPure!0 lt!392123))))

(assert (=> b!252473 (= lt!392123 (BitStream!10969 (buf!6525 (_2!11782 lt!392119)) (currentByte!11980 thiss!1005) (currentBit!11975 thiss!1005)))))

(assert (=> b!252473 e!174942))

(declare-fun res!211516 () Bool)

(assert (=> b!252473 (=> (not res!211516) (not e!174942))))

(assert (=> b!252473 (= res!211516 (isPrefixOf!0 thiss!1005 (_2!11782 lt!392111)))))

(declare-fun lt!392117 () Unit!18194)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10968 BitStream!10968 BitStream!10968) Unit!18194)

(assert (=> b!252473 (= lt!392117 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11782 lt!392119) (_2!11782 lt!392111)))))

(assert (=> b!252473 e!174946))

(declare-fun res!211524 () Bool)

(assert (=> b!252473 (=> (not res!211524) (not e!174946))))

(assert (=> b!252473 (= res!211524 (= (size!6023 (buf!6525 (_2!11782 lt!392119))) (size!6023 (buf!6525 (_2!11782 lt!392111)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10968 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21708)

(assert (=> b!252473 (= lt!392111 (appendNBitsLoop!0 (_2!11782 lt!392119) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!252473 (validate_offset_bits!1 ((_ sign_extend 32) (size!6023 (buf!6525 (_2!11782 lt!392119)))) ((_ sign_extend 32) (currentByte!11980 (_2!11782 lt!392119))) ((_ sign_extend 32) (currentBit!11975 (_2!11782 lt!392119))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!392114 () Unit!18194)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10968 BitStream!10968 (_ BitVec 64) (_ BitVec 64)) Unit!18194)

(assert (=> b!252473 (= lt!392114 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11782 lt!392119) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!252473 e!174950))

(declare-fun res!211514 () Bool)

(assert (=> b!252473 (=> (not res!211514) (not e!174950))))

(assert (=> b!252473 (= res!211514 (= (size!6023 (buf!6525 thiss!1005)) (size!6023 (buf!6525 (_2!11782 lt!392119)))))))

(declare-fun appendBit!0 (BitStream!10968 Bool) tuple2!21708)

(assert (=> b!252473 (= lt!392119 (appendBit!0 thiss!1005 bit!26))))

(assert (= (and start!54104 res!211517) b!252470))

(assert (= (and b!252470 res!211515) b!252472))

(assert (= (and b!252472 res!211520) b!252473))

(assert (= (and b!252473 res!211514) b!252463))

(assert (= (and b!252463 res!211512) b!252460))

(assert (= (and b!252460 res!211523) b!252468))

(assert (= (and b!252468 res!211521) b!252464))

(assert (= (and b!252473 res!211524) b!252461))

(assert (= (and b!252461 res!211519) b!252462))

(assert (= (and b!252462 res!211513) b!252466))

(assert (= (and b!252473 res!211516) b!252467))

(assert (= (and b!252467 res!211518) b!252465))

(assert (= (and b!252473 res!211522) b!252469))

(assert (= start!54104 b!252471))

(declare-fun m!379845 () Bool)

(assert (=> b!252471 m!379845))

(declare-fun m!379847 () Bool)

(assert (=> b!252467 m!379847))

(declare-fun m!379849 () Bool)

(assert (=> b!252462 m!379849))

(declare-fun m!379851 () Bool)

(assert (=> b!252465 m!379851))

(declare-fun m!379853 () Bool)

(assert (=> b!252473 m!379853))

(declare-fun m!379855 () Bool)

(assert (=> b!252473 m!379855))

(declare-fun m!379857 () Bool)

(assert (=> b!252473 m!379857))

(declare-fun m!379859 () Bool)

(assert (=> b!252473 m!379859))

(declare-fun m!379861 () Bool)

(assert (=> b!252473 m!379861))

(declare-fun m!379863 () Bool)

(assert (=> b!252473 m!379863))

(declare-fun m!379865 () Bool)

(assert (=> b!252473 m!379865))

(declare-fun m!379867 () Bool)

(assert (=> b!252473 m!379867))

(declare-fun m!379869 () Bool)

(assert (=> b!252473 m!379869))

(declare-fun m!379871 () Bool)

(assert (=> b!252473 m!379871))

(declare-fun m!379873 () Bool)

(assert (=> b!252473 m!379873))

(declare-fun m!379875 () Bool)

(assert (=> b!252473 m!379875))

(declare-fun m!379877 () Bool)

(assert (=> b!252473 m!379877))

(declare-fun m!379879 () Bool)

(assert (=> b!252473 m!379879))

(declare-fun m!379881 () Bool)

(assert (=> b!252473 m!379881))

(declare-fun m!379883 () Bool)

(assert (=> b!252473 m!379883))

(declare-fun m!379885 () Bool)

(assert (=> b!252473 m!379885))

(declare-fun m!379887 () Bool)

(assert (=> b!252463 m!379887))

(declare-fun m!379889 () Bool)

(assert (=> b!252463 m!379889))

(declare-fun m!379891 () Bool)

(assert (=> b!252466 m!379891))

(declare-fun m!379893 () Bool)

(assert (=> b!252466 m!379893))

(declare-fun m!379895 () Bool)

(assert (=> b!252466 m!379895))

(assert (=> b!252466 m!379865))

(declare-fun m!379897 () Bool)

(assert (=> start!54104 m!379897))

(declare-fun m!379899 () Bool)

(assert (=> b!252468 m!379899))

(assert (=> b!252468 m!379899))

(declare-fun m!379901 () Bool)

(assert (=> b!252468 m!379901))

(declare-fun m!379903 () Bool)

(assert (=> b!252464 m!379903))

(declare-fun m!379905 () Bool)

(assert (=> b!252470 m!379905))

(declare-fun m!379907 () Bool)

(assert (=> b!252460 m!379907))

(declare-fun m!379909 () Bool)

(assert (=> b!252461 m!379909))

(assert (=> b!252461 m!379887))

(check-sat (not b!252462) (not b!252464) (not start!54104) (not b!252470) (not b!252471) (not b!252463) (not b!252465) (not b!252467) (not b!252461) (not b!252460) (not b!252468) (not b!252473) (not b!252466))
