; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54626 () Bool)

(assert start!54626)

(declare-fun b!255366 () Bool)

(declare-fun res!214030 () Bool)

(declare-fun e!176915 () Bool)

(assert (=> b!255366 (=> (not res!214030) (not e!176915))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-datatypes ((array!13773 0))(
  ( (array!13774 (arr!7028 (Array (_ BitVec 32) (_ BitVec 8))) (size!6041 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11004 0))(
  ( (BitStream!11005 (buf!6558 array!13773) (currentByte!12037 (_ BitVec 32)) (currentBit!12032 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!11004)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!255366 (= res!214030 (validate_offset_bits!1 ((_ sign_extend 32) (size!6041 (buf!6558 thiss!1005))) ((_ sign_extend 32) (currentByte!12037 thiss!1005)) ((_ sign_extend 32) (currentBit!12032 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!255367 () Bool)

(declare-fun e!176917 () Bool)

(declare-fun e!176918 () Bool)

(assert (=> b!255367 (= e!176917 e!176918)))

(declare-fun res!214041 () Bool)

(assert (=> b!255367 (=> (not res!214041) (not e!176918))))

(declare-fun lt!396645 () (_ BitVec 64))

(declare-fun lt!396657 () (_ BitVec 64))

(assert (=> b!255367 (= res!214041 (= lt!396645 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!396657)))))

(declare-datatypes ((Unit!18290 0))(
  ( (Unit!18291) )
))
(declare-datatypes ((tuple2!21834 0))(
  ( (tuple2!21835 (_1!11851 Unit!18290) (_2!11851 BitStream!11004)) )
))
(declare-fun lt!396643 () tuple2!21834)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!255367 (= lt!396645 (bitIndex!0 (size!6041 (buf!6558 (_2!11851 lt!396643))) (currentByte!12037 (_2!11851 lt!396643)) (currentBit!12032 (_2!11851 lt!396643))))))

(assert (=> b!255367 (= lt!396657 (bitIndex!0 (size!6041 (buf!6558 thiss!1005)) (currentByte!12037 thiss!1005) (currentBit!12032 thiss!1005)))))

(declare-fun b!255368 () Bool)

(declare-fun res!214032 () Bool)

(assert (=> b!255368 (=> (not res!214032) (not e!176915))))

(assert (=> b!255368 (= res!214032 (bvslt from!289 nBits!297))))

(declare-fun b!255369 () Bool)

(declare-fun res!214033 () Bool)

(declare-fun e!176910 () Bool)

(assert (=> b!255369 (=> (not res!214033) (not e!176910))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!255369 (= res!214033 (invariant!0 (currentBit!12032 thiss!1005) (currentByte!12037 thiss!1005) (size!6041 (buf!6558 (_2!11851 lt!396643)))))))

(declare-fun b!255370 () Bool)

(declare-fun res!214034 () Bool)

(declare-fun e!176912 () Bool)

(assert (=> b!255370 (=> (not res!214034) (not e!176912))))

(declare-fun lt!396652 () tuple2!21834)

(declare-fun isPrefixOf!0 (BitStream!11004 BitStream!11004) Bool)

(assert (=> b!255370 (= res!214034 (isPrefixOf!0 (_2!11851 lt!396643) (_2!11851 lt!396652)))))

(declare-fun b!255371 () Bool)

(declare-fun res!214031 () Bool)

(declare-fun e!176909 () Bool)

(assert (=> b!255371 (=> res!214031 e!176909)))

(assert (=> b!255371 (= res!214031 (not (= (bitIndex!0 (size!6041 (buf!6558 (_2!11851 lt!396652))) (currentByte!12037 (_2!11851 lt!396652)) (currentBit!12032 (_2!11851 lt!396652))) (bvadd (bitIndex!0 (size!6041 (buf!6558 thiss!1005)) (currentByte!12037 thiss!1005) (currentBit!12032 thiss!1005)) (bvsub nBits!297 from!289)))))))

(declare-fun b!255372 () Bool)

(declare-fun res!214043 () Bool)

(assert (=> b!255372 (=> (not res!214043) (not e!176918))))

(assert (=> b!255372 (= res!214043 (isPrefixOf!0 thiss!1005 (_2!11851 lt!396643)))))

(declare-fun b!255373 () Bool)

(assert (=> b!255373 (= e!176909 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!289 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!255375 () Bool)

(declare-fun e!176908 () Bool)

(assert (=> b!255375 (= e!176908 e!176909)))

(declare-fun res!214042 () Bool)

(assert (=> b!255375 (=> res!214042 e!176909)))

(assert (=> b!255375 (= res!214042 (not (= (size!6041 (buf!6558 thiss!1005)) (size!6041 (buf!6558 (_2!11851 lt!396652))))))))

(declare-datatypes ((tuple2!21836 0))(
  ( (tuple2!21837 (_1!11852 BitStream!11004) (_2!11852 Bool)) )
))
(declare-fun lt!396650 () tuple2!21836)

(declare-fun lt!396644 () tuple2!21836)

(declare-datatypes ((tuple2!21838 0))(
  ( (tuple2!21839 (_1!11853 BitStream!11004) (_2!11853 BitStream!11004)) )
))
(declare-fun lt!396653 () tuple2!21838)

(assert (=> b!255375 (and (= (_2!11852 lt!396650) (_2!11852 lt!396644)) (= (_1!11852 lt!396650) (_2!11853 lt!396653)))))

(declare-fun b!255376 () Bool)

(assert (=> b!255376 (= e!176910 (invariant!0 (currentBit!12032 thiss!1005) (currentByte!12037 thiss!1005) (size!6041 (buf!6558 (_2!11851 lt!396652)))))))

(declare-fun b!255377 () Bool)

(declare-fun e!176911 () Bool)

(declare-fun lt!396655 () tuple2!21836)

(declare-fun lt!396648 () tuple2!21836)

(assert (=> b!255377 (= e!176911 (= (_2!11852 lt!396655) (_2!11852 lt!396648)))))

(declare-fun b!255378 () Bool)

(declare-fun lt!396659 () tuple2!21836)

(declare-fun lt!396660 () tuple2!21838)

(assert (=> b!255378 (= e!176912 (not (or (not (_2!11852 lt!396659)) (not (= (_1!11852 lt!396659) (_2!11853 lt!396660))))))))

(declare-fun bit!26 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!11004 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21836)

(assert (=> b!255378 (= lt!396659 (checkBitsLoopPure!0 (_1!11853 lt!396660) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!396654 () (_ BitVec 64))

(assert (=> b!255378 (validate_offset_bits!1 ((_ sign_extend 32) (size!6041 (buf!6558 (_2!11851 lt!396652)))) ((_ sign_extend 32) (currentByte!12037 (_2!11851 lt!396643))) ((_ sign_extend 32) (currentBit!12032 (_2!11851 lt!396643))) lt!396654)))

(declare-fun lt!396662 () Unit!18290)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!11004 array!13773 (_ BitVec 64)) Unit!18290)

(assert (=> b!255378 (= lt!396662 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11851 lt!396643) (buf!6558 (_2!11851 lt!396652)) lt!396654))))

(declare-fun reader!0 (BitStream!11004 BitStream!11004) tuple2!21838)

(assert (=> b!255378 (= lt!396660 (reader!0 (_2!11851 lt!396643) (_2!11851 lt!396652)))))

(declare-fun b!255379 () Bool)

(declare-fun e!176907 () Bool)

(assert (=> b!255379 (= e!176907 e!176912)))

(declare-fun res!214039 () Bool)

(assert (=> b!255379 (=> (not res!214039) (not e!176912))))

(assert (=> b!255379 (= res!214039 (= (bitIndex!0 (size!6041 (buf!6558 (_2!11851 lt!396652))) (currentByte!12037 (_2!11851 lt!396652)) (currentBit!12032 (_2!11851 lt!396652))) (bvadd (bitIndex!0 (size!6041 (buf!6558 (_2!11851 lt!396643))) (currentByte!12037 (_2!11851 lt!396643)) (currentBit!12032 (_2!11851 lt!396643))) lt!396654)))))

(assert (=> b!255379 (= lt!396654 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!255380 () Bool)

(declare-fun e!176913 () Bool)

(declare-fun lt!396663 () tuple2!21836)

(assert (=> b!255380 (= e!176913 (= (bitIndex!0 (size!6041 (buf!6558 (_1!11852 lt!396663))) (currentByte!12037 (_1!11852 lt!396663)) (currentBit!12032 (_1!11852 lt!396663))) lt!396645))))

(declare-fun b!255381 () Bool)

(assert (=> b!255381 (= e!176918 e!176913)))

(declare-fun res!214036 () Bool)

(assert (=> b!255381 (=> (not res!214036) (not e!176913))))

(assert (=> b!255381 (= res!214036 (and (= (_2!11852 lt!396663) bit!26) (= (_1!11852 lt!396663) (_2!11851 lt!396643))))))

(declare-fun readBitPure!0 (BitStream!11004) tuple2!21836)

(declare-fun readerFrom!0 (BitStream!11004 (_ BitVec 32) (_ BitVec 32)) BitStream!11004)

(assert (=> b!255381 (= lt!396663 (readBitPure!0 (readerFrom!0 (_2!11851 lt!396643) (currentBit!12032 thiss!1005) (currentByte!12037 thiss!1005))))))

(declare-fun b!255382 () Bool)

(assert (=> b!255382 (= e!176915 (not e!176908))))

(declare-fun res!214037 () Bool)

(assert (=> b!255382 (=> res!214037 e!176908)))

(declare-fun lt!396651 () tuple2!21838)

(assert (=> b!255382 (= res!214037 (not (= (_1!11852 lt!396644) (_2!11853 lt!396651))))))

(assert (=> b!255382 (= lt!396644 (checkBitsLoopPure!0 (_1!11853 lt!396651) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!396642 () (_ BitVec 64))

(assert (=> b!255382 (validate_offset_bits!1 ((_ sign_extend 32) (size!6041 (buf!6558 (_2!11851 lt!396652)))) ((_ sign_extend 32) (currentByte!12037 (_2!11851 lt!396643))) ((_ sign_extend 32) (currentBit!12032 (_2!11851 lt!396643))) lt!396642)))

(declare-fun lt!396646 () Unit!18290)

(assert (=> b!255382 (= lt!396646 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11851 lt!396643) (buf!6558 (_2!11851 lt!396652)) lt!396642))))

(assert (=> b!255382 (= lt!396650 (checkBitsLoopPure!0 (_1!11853 lt!396653) nBits!297 bit!26 from!289))))

(assert (=> b!255382 (validate_offset_bits!1 ((_ sign_extend 32) (size!6041 (buf!6558 (_2!11851 lt!396652)))) ((_ sign_extend 32) (currentByte!12037 thiss!1005)) ((_ sign_extend 32) (currentBit!12032 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!396649 () Unit!18290)

(assert (=> b!255382 (= lt!396649 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6558 (_2!11851 lt!396652)) (bvsub nBits!297 from!289)))))

(assert (=> b!255382 (= (_2!11852 (readBitPure!0 (_1!11853 lt!396653))) bit!26)))

(assert (=> b!255382 (= lt!396651 (reader!0 (_2!11851 lt!396643) (_2!11851 lt!396652)))))

(assert (=> b!255382 (= lt!396653 (reader!0 thiss!1005 (_2!11851 lt!396652)))))

(assert (=> b!255382 e!176911))

(declare-fun res!214029 () Bool)

(assert (=> b!255382 (=> (not res!214029) (not e!176911))))

(assert (=> b!255382 (= res!214029 (= (bitIndex!0 (size!6041 (buf!6558 (_1!11852 lt!396655))) (currentByte!12037 (_1!11852 lt!396655)) (currentBit!12032 (_1!11852 lt!396655))) (bitIndex!0 (size!6041 (buf!6558 (_1!11852 lt!396648))) (currentByte!12037 (_1!11852 lt!396648)) (currentBit!12032 (_1!11852 lt!396648)))))))

(declare-fun lt!396647 () Unit!18290)

(declare-fun lt!396658 () BitStream!11004)

(declare-fun readBitPrefixLemma!0 (BitStream!11004 BitStream!11004) Unit!18290)

(assert (=> b!255382 (= lt!396647 (readBitPrefixLemma!0 lt!396658 (_2!11851 lt!396652)))))

(assert (=> b!255382 (= lt!396648 (readBitPure!0 (BitStream!11005 (buf!6558 (_2!11851 lt!396652)) (currentByte!12037 thiss!1005) (currentBit!12032 thiss!1005))))))

(assert (=> b!255382 (= lt!396655 (readBitPure!0 lt!396658))))

(assert (=> b!255382 (= lt!396658 (BitStream!11005 (buf!6558 (_2!11851 lt!396643)) (currentByte!12037 thiss!1005) (currentBit!12032 thiss!1005)))))

(assert (=> b!255382 e!176910))

(declare-fun res!214040 () Bool)

(assert (=> b!255382 (=> (not res!214040) (not e!176910))))

(assert (=> b!255382 (= res!214040 (isPrefixOf!0 thiss!1005 (_2!11851 lt!396652)))))

(declare-fun lt!396656 () Unit!18290)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!11004 BitStream!11004 BitStream!11004) Unit!18290)

(assert (=> b!255382 (= lt!396656 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11851 lt!396643) (_2!11851 lt!396652)))))

(assert (=> b!255382 e!176907))

(declare-fun res!214028 () Bool)

(assert (=> b!255382 (=> (not res!214028) (not e!176907))))

(assert (=> b!255382 (= res!214028 (= (size!6041 (buf!6558 (_2!11851 lt!396643))) (size!6041 (buf!6558 (_2!11851 lt!396652)))))))

(declare-fun appendNBitsLoop!0 (BitStream!11004 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21834)

(assert (=> b!255382 (= lt!396652 (appendNBitsLoop!0 (_2!11851 lt!396643) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!255382 (validate_offset_bits!1 ((_ sign_extend 32) (size!6041 (buf!6558 (_2!11851 lt!396643)))) ((_ sign_extend 32) (currentByte!12037 (_2!11851 lt!396643))) ((_ sign_extend 32) (currentBit!12032 (_2!11851 lt!396643))) lt!396642)))

(assert (=> b!255382 (= lt!396642 (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!396661 () Unit!18290)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!11004 BitStream!11004 (_ BitVec 64) (_ BitVec 64)) Unit!18290)

(assert (=> b!255382 (= lt!396661 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11851 lt!396643) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!255382 e!176917))

(declare-fun res!214035 () Bool)

(assert (=> b!255382 (=> (not res!214035) (not e!176917))))

(assert (=> b!255382 (= res!214035 (= (size!6041 (buf!6558 thiss!1005)) (size!6041 (buf!6558 (_2!11851 lt!396643)))))))

(declare-fun appendBit!0 (BitStream!11004 Bool) tuple2!21834)

(assert (=> b!255382 (= lt!396643 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!255383 () Bool)

(declare-fun res!214044 () Bool)

(assert (=> b!255383 (=> res!214044 e!176908)))

(declare-fun withMovedBitIndex!0 (BitStream!11004 (_ BitVec 64)) BitStream!11004)

(assert (=> b!255383 (= res!214044 (not (= (_1!11853 lt!396651) (withMovedBitIndex!0 (_1!11853 lt!396653) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!255374 () Bool)

(declare-fun e!176914 () Bool)

(declare-fun array_inv!5782 (array!13773) Bool)

(assert (=> b!255374 (= e!176914 (array_inv!5782 (buf!6558 thiss!1005)))))

(declare-fun res!214038 () Bool)

(assert (=> start!54626 (=> (not res!214038) (not e!176915))))

(assert (=> start!54626 (= res!214038 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!54626 e!176915))

(assert (=> start!54626 true))

(declare-fun inv!12 (BitStream!11004) Bool)

(assert (=> start!54626 (and (inv!12 thiss!1005) e!176914)))

(assert (= (and start!54626 res!214038) b!255366))

(assert (= (and b!255366 res!214030) b!255368))

(assert (= (and b!255368 res!214032) b!255382))

(assert (= (and b!255382 res!214035) b!255367))

(assert (= (and b!255367 res!214041) b!255372))

(assert (= (and b!255372 res!214043) b!255381))

(assert (= (and b!255381 res!214036) b!255380))

(assert (= (and b!255382 res!214028) b!255379))

(assert (= (and b!255379 res!214039) b!255370))

(assert (= (and b!255370 res!214034) b!255378))

(assert (= (and b!255382 res!214040) b!255369))

(assert (= (and b!255369 res!214033) b!255376))

(assert (= (and b!255382 res!214029) b!255377))

(assert (= (and b!255382 (not res!214037)) b!255383))

(assert (= (and b!255383 (not res!214044)) b!255375))

(assert (= (and b!255375 (not res!214042)) b!255371))

(assert (= (and b!255371 (not res!214031)) b!255373))

(assert (= start!54626 b!255374))

(declare-fun m!384689 () Bool)

(assert (=> b!255381 m!384689))

(assert (=> b!255381 m!384689))

(declare-fun m!384691 () Bool)

(assert (=> b!255381 m!384691))

(declare-fun m!384693 () Bool)

(assert (=> b!255378 m!384693))

(declare-fun m!384695 () Bool)

(assert (=> b!255378 m!384695))

(declare-fun m!384697 () Bool)

(assert (=> b!255378 m!384697))

(declare-fun m!384699 () Bool)

(assert (=> b!255378 m!384699))

(declare-fun m!384701 () Bool)

(assert (=> b!255367 m!384701))

(declare-fun m!384703 () Bool)

(assert (=> b!255367 m!384703))

(declare-fun m!384705 () Bool)

(assert (=> start!54626 m!384705))

(declare-fun m!384707 () Bool)

(assert (=> b!255366 m!384707))

(declare-fun m!384709 () Bool)

(assert (=> b!255374 m!384709))

(declare-fun m!384711 () Bool)

(assert (=> b!255372 m!384711))

(declare-fun m!384713 () Bool)

(assert (=> b!255369 m!384713))

(declare-fun m!384715 () Bool)

(assert (=> b!255370 m!384715))

(declare-fun m!384717 () Bool)

(assert (=> b!255379 m!384717))

(assert (=> b!255379 m!384701))

(assert (=> b!255371 m!384717))

(assert (=> b!255371 m!384703))

(declare-fun m!384719 () Bool)

(assert (=> b!255380 m!384719))

(declare-fun m!384721 () Bool)

(assert (=> b!255376 m!384721))

(declare-fun m!384723 () Bool)

(assert (=> b!255382 m!384723))

(declare-fun m!384725 () Bool)

(assert (=> b!255382 m!384725))

(declare-fun m!384727 () Bool)

(assert (=> b!255382 m!384727))

(declare-fun m!384729 () Bool)

(assert (=> b!255382 m!384729))

(declare-fun m!384731 () Bool)

(assert (=> b!255382 m!384731))

(assert (=> b!255382 m!384699))

(declare-fun m!384733 () Bool)

(assert (=> b!255382 m!384733))

(declare-fun m!384735 () Bool)

(assert (=> b!255382 m!384735))

(declare-fun m!384737 () Bool)

(assert (=> b!255382 m!384737))

(declare-fun m!384739 () Bool)

(assert (=> b!255382 m!384739))

(declare-fun m!384741 () Bool)

(assert (=> b!255382 m!384741))

(declare-fun m!384743 () Bool)

(assert (=> b!255382 m!384743))

(declare-fun m!384745 () Bool)

(assert (=> b!255382 m!384745))

(declare-fun m!384747 () Bool)

(assert (=> b!255382 m!384747))

(declare-fun m!384749 () Bool)

(assert (=> b!255382 m!384749))

(declare-fun m!384751 () Bool)

(assert (=> b!255382 m!384751))

(declare-fun m!384753 () Bool)

(assert (=> b!255382 m!384753))

(declare-fun m!384755 () Bool)

(assert (=> b!255382 m!384755))

(declare-fun m!384757 () Bool)

(assert (=> b!255382 m!384757))

(declare-fun m!384759 () Bool)

(assert (=> b!255382 m!384759))

(declare-fun m!384761 () Bool)

(assert (=> b!255383 m!384761))

(check-sat (not b!255369) (not b!255372) (not b!255370) (not b!255378) (not b!255374) (not b!255376) (not b!255381) (not b!255367) (not b!255382) (not b!255380) (not start!54626) (not b!255366) (not b!255383) (not b!255371) (not b!255379))
(check-sat)
