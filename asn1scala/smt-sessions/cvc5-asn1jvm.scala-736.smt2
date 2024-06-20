; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20584 () Bool)

(assert start!20584)

(declare-fun b!103729 () Bool)

(declare-fun e!67895 () Bool)

(declare-fun e!67897 () Bool)

(assert (=> b!103729 (= e!67895 e!67897)))

(declare-fun res!85362 () Bool)

(assert (=> b!103729 (=> (not res!85362) (not e!67897))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun lt!151840 () (_ BitVec 64))

(assert (=> b!103729 (= res!85362 (and (= (bvand v!199 lt!151840) v!199) (bvslt i!615 nBits!396)))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!103729 (= lt!151840 (onesLSBLong!0 nBits!396))))

(declare-fun b!103730 () Bool)

(declare-fun e!67902 () Bool)

(declare-datatypes ((array!4842 0))(
  ( (array!4843 (arr!2802 (Array (_ BitVec 32) (_ BitVec 8))) (size!2209 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3892 0))(
  ( (BitStream!3893 (buf!2575 array!4842) (currentByte!5060 (_ BitVec 32)) (currentBit!5055 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!8518 0))(
  ( (tuple2!8519 (_1!4514 BitStream!3892) (_2!4514 Bool)) )
))
(declare-fun lt!151854 () tuple2!8518)

(declare-fun lt!151850 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!103730 (= e!67902 (= (bitIndex!0 (size!2209 (buf!2575 (_1!4514 lt!151854))) (currentByte!5060 (_1!4514 lt!151854)) (currentBit!5055 (_1!4514 lt!151854))) lt!151850))))

(declare-fun b!103731 () Bool)

(declare-fun res!85357 () Bool)

(declare-fun e!67898 () Bool)

(assert (=> b!103731 (=> (not res!85357) (not e!67898))))

(declare-fun thiss!1305 () BitStream!3892)

(declare-datatypes ((Unit!6362 0))(
  ( (Unit!6363) )
))
(declare-datatypes ((tuple2!8520 0))(
  ( (tuple2!8521 (_1!4515 Unit!6362) (_2!4515 BitStream!3892)) )
))
(declare-fun lt!151861 () tuple2!8520)

(declare-fun isPrefixOf!0 (BitStream!3892 BitStream!3892) Bool)

(assert (=> b!103731 (= res!85357 (isPrefixOf!0 thiss!1305 (_2!4515 lt!151861)))))

(declare-fun b!103732 () Bool)

(declare-fun res!85360 () Bool)

(declare-fun e!67899 () Bool)

(assert (=> b!103732 (=> (not res!85360) (not e!67899))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!103732 (= res!85360 (invariant!0 (currentBit!5055 thiss!1305) (currentByte!5060 thiss!1305) (size!2209 (buf!2575 (_2!4515 lt!151861)))))))

(declare-fun b!103733 () Bool)

(declare-fun e!67894 () Bool)

(assert (=> b!103733 (= e!67894 e!67895)))

(declare-fun res!85359 () Bool)

(assert (=> b!103733 (=> (not res!85359) (not e!67895))))

(declare-fun lt!151858 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!103733 (= res!85359 (validate_offset_bits!1 ((_ sign_extend 32) (size!2209 (buf!2575 thiss!1305))) ((_ sign_extend 32) (currentByte!5060 thiss!1305)) ((_ sign_extend 32) (currentBit!5055 thiss!1305)) lt!151858))))

(assert (=> b!103733 (= lt!151858 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!103734 () Bool)

(declare-fun e!67892 () Bool)

(declare-fun array_inv!2011 (array!4842) Bool)

(assert (=> b!103734 (= e!67892 (array_inv!2011 (buf!2575 thiss!1305)))))

(declare-fun b!103735 () Bool)

(assert (=> b!103735 (= e!67898 e!67902)))

(declare-fun res!85363 () Bool)

(assert (=> b!103735 (=> (not res!85363) (not e!67902))))

(declare-fun lt!151864 () Bool)

(assert (=> b!103735 (= res!85363 (and (= (_2!4514 lt!151854) lt!151864) (= (_1!4514 lt!151854) (_2!4515 lt!151861))))))

(declare-fun readBitPure!0 (BitStream!3892) tuple2!8518)

(declare-fun readerFrom!0 (BitStream!3892 (_ BitVec 32) (_ BitVec 32)) BitStream!3892)

(assert (=> b!103735 (= lt!151854 (readBitPure!0 (readerFrom!0 (_2!4515 lt!151861) (currentBit!5055 thiss!1305) (currentByte!5060 thiss!1305))))))

(declare-fun b!103736 () Bool)

(declare-fun e!67900 () Bool)

(assert (=> b!103736 (= e!67900 true)))

(declare-datatypes ((tuple2!8522 0))(
  ( (tuple2!8523 (_1!4516 BitStream!3892) (_2!4516 BitStream!3892)) )
))
(declare-fun lt!151857 () tuple2!8522)

(declare-fun lt!151852 () (_ BitVec 64))

(declare-datatypes ((tuple2!8524 0))(
  ( (tuple2!8525 (_1!4517 BitStream!3892) (_2!4517 (_ BitVec 64))) )
))
(declare-fun lt!151846 () tuple2!8524)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3892 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8524)

(declare-fun withMovedBitIndex!0 (BitStream!3892 (_ BitVec 64)) BitStream!3892)

(assert (=> b!103736 (= lt!151846 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4516 lt!151857) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!151852))))

(declare-fun res!85364 () Bool)

(assert (=> start!20584 (=> (not res!85364) (not e!67894))))

(assert (=> start!20584 (= res!85364 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!20584 e!67894))

(assert (=> start!20584 true))

(declare-fun inv!12 (BitStream!3892) Bool)

(assert (=> start!20584 (and (inv!12 thiss!1305) e!67892)))

(declare-fun b!103737 () Bool)

(declare-fun res!85356 () Bool)

(assert (=> b!103737 (=> res!85356 e!67900)))

(declare-fun lt!151862 () (_ BitVec 64))

(declare-fun lt!151859 () (_ BitVec 64))

(assert (=> b!103737 (= res!85356 (or (not (= (bvand lt!151859 lt!151862) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand lt!151859 lt!151840) lt!151859))))))

(declare-fun b!103738 () Bool)

(declare-fun e!67896 () Bool)

(assert (=> b!103738 (= e!67896 e!67898)))

(declare-fun res!85352 () Bool)

(assert (=> b!103738 (=> (not res!85352) (not e!67898))))

(declare-fun lt!151842 () (_ BitVec 64))

(assert (=> b!103738 (= res!85352 (= lt!151850 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!151842)))))

(assert (=> b!103738 (= lt!151850 (bitIndex!0 (size!2209 (buf!2575 (_2!4515 lt!151861))) (currentByte!5060 (_2!4515 lt!151861)) (currentBit!5055 (_2!4515 lt!151861))))))

(assert (=> b!103738 (= lt!151842 (bitIndex!0 (size!2209 (buf!2575 thiss!1305)) (currentByte!5060 thiss!1305) (currentBit!5055 thiss!1305)))))

(declare-fun b!103739 () Bool)

(declare-fun lt!151848 () tuple2!8520)

(assert (=> b!103739 (= e!67899 (invariant!0 (currentBit!5055 thiss!1305) (currentByte!5060 thiss!1305) (size!2209 (buf!2575 (_2!4515 lt!151848)))))))

(declare-fun b!103740 () Bool)

(declare-fun res!85358 () Bool)

(assert (=> b!103740 (=> res!85358 e!67900)))

(assert (=> b!103740 (= res!85358 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!2209 (buf!2575 (_1!4516 lt!151857)))) ((_ sign_extend 32) (currentByte!5060 (_1!4516 lt!151857))) ((_ sign_extend 32) (currentBit!5055 (_1!4516 lt!151857))) lt!151858)))))

(declare-fun b!103741 () Bool)

(assert (=> b!103741 (= e!67897 (not e!67900))))

(declare-fun res!85353 () Bool)

(assert (=> b!103741 (=> res!85353 e!67900)))

(declare-fun lt!151843 () tuple2!8522)

(assert (=> b!103741 (= res!85353 (not (= (_1!4517 (readNLeastSignificantBitsLoopPure!0 (_1!4516 lt!151843) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!151852)) (_2!4516 lt!151843))))))

(declare-fun lt!151853 () (_ BitVec 64))

(assert (=> b!103741 (validate_offset_bits!1 ((_ sign_extend 32) (size!2209 (buf!2575 (_2!4515 lt!151848)))) ((_ sign_extend 32) (currentByte!5060 (_2!4515 lt!151861))) ((_ sign_extend 32) (currentBit!5055 (_2!4515 lt!151861))) lt!151853)))

(declare-fun lt!151844 () Unit!6362)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3892 array!4842 (_ BitVec 64)) Unit!6362)

(assert (=> b!103741 (= lt!151844 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4515 lt!151861) (buf!2575 (_2!4515 lt!151848)) lt!151853))))

(assert (=> b!103741 (= lt!151853 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!151845 () tuple2!8518)

(declare-fun lt!151841 () (_ BitVec 64))

(assert (=> b!103741 (= lt!151852 (bvor lt!151859 (ite (_2!4514 lt!151845) lt!151841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!151849 () tuple2!8524)

(assert (=> b!103741 (= lt!151849 (readNLeastSignificantBitsLoopPure!0 (_1!4516 lt!151857) nBits!396 i!615 lt!151859))))

(assert (=> b!103741 (validate_offset_bits!1 ((_ sign_extend 32) (size!2209 (buf!2575 (_2!4515 lt!151848)))) ((_ sign_extend 32) (currentByte!5060 thiss!1305)) ((_ sign_extend 32) (currentBit!5055 thiss!1305)) lt!151858)))

(declare-fun lt!151851 () Unit!6362)

(assert (=> b!103741 (= lt!151851 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2575 (_2!4515 lt!151848)) lt!151858))))

(assert (=> b!103741 (= lt!151859 (bvand v!199 (bvnot lt!151862)))))

(assert (=> b!103741 (= lt!151862 (onesLSBLong!0 (bvsub nBits!396 i!615)))))

(assert (=> b!103741 (= (_2!4514 lt!151845) lt!151864)))

(assert (=> b!103741 (= lt!151845 (readBitPure!0 (_1!4516 lt!151857)))))

(declare-fun reader!0 (BitStream!3892 BitStream!3892) tuple2!8522)

(assert (=> b!103741 (= lt!151843 (reader!0 (_2!4515 lt!151861) (_2!4515 lt!151848)))))

(assert (=> b!103741 (= lt!151857 (reader!0 thiss!1305 (_2!4515 lt!151848)))))

(declare-fun e!67901 () Bool)

(assert (=> b!103741 e!67901))

(declare-fun res!85361 () Bool)

(assert (=> b!103741 (=> (not res!85361) (not e!67901))))

(declare-fun lt!151855 () tuple2!8518)

(declare-fun lt!151856 () tuple2!8518)

(assert (=> b!103741 (= res!85361 (= (bitIndex!0 (size!2209 (buf!2575 (_1!4514 lt!151855))) (currentByte!5060 (_1!4514 lt!151855)) (currentBit!5055 (_1!4514 lt!151855))) (bitIndex!0 (size!2209 (buf!2575 (_1!4514 lt!151856))) (currentByte!5060 (_1!4514 lt!151856)) (currentBit!5055 (_1!4514 lt!151856)))))))

(declare-fun lt!151847 () Unit!6362)

(declare-fun lt!151860 () BitStream!3892)

(declare-fun readBitPrefixLemma!0 (BitStream!3892 BitStream!3892) Unit!6362)

(assert (=> b!103741 (= lt!151847 (readBitPrefixLemma!0 lt!151860 (_2!4515 lt!151848)))))

(assert (=> b!103741 (= lt!151856 (readBitPure!0 (BitStream!3893 (buf!2575 (_2!4515 lt!151848)) (currentByte!5060 thiss!1305) (currentBit!5055 thiss!1305))))))

(assert (=> b!103741 (= lt!151855 (readBitPure!0 lt!151860))))

(assert (=> b!103741 (= lt!151860 (BitStream!3893 (buf!2575 (_2!4515 lt!151861)) (currentByte!5060 thiss!1305) (currentBit!5055 thiss!1305)))))

(assert (=> b!103741 e!67899))

(declare-fun res!85354 () Bool)

(assert (=> b!103741 (=> (not res!85354) (not e!67899))))

(assert (=> b!103741 (= res!85354 (isPrefixOf!0 thiss!1305 (_2!4515 lt!151848)))))

(declare-fun lt!151863 () Unit!6362)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3892 BitStream!3892 BitStream!3892) Unit!6362)

(assert (=> b!103741 (= lt!151863 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4515 lt!151861) (_2!4515 lt!151848)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3892 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8520)

(assert (=> b!103741 (= lt!151848 (appendNLeastSignificantBitsLoop!0 (_2!4515 lt!151861) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!103741 e!67896))

(declare-fun res!85355 () Bool)

(assert (=> b!103741 (=> (not res!85355) (not e!67896))))

(assert (=> b!103741 (= res!85355 (= (size!2209 (buf!2575 thiss!1305)) (size!2209 (buf!2575 (_2!4515 lt!151861)))))))

(declare-fun appendBit!0 (BitStream!3892 Bool) tuple2!8520)

(assert (=> b!103741 (= lt!151861 (appendBit!0 thiss!1305 lt!151864))))

(assert (=> b!103741 (= lt!151864 (not (= (bvand v!199 lt!151841) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!103741 (= lt!151841 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!103742 () Bool)

(assert (=> b!103742 (= e!67901 (= (_2!4514 lt!151855) (_2!4514 lt!151856)))))

(assert (= (and start!20584 res!85364) b!103733))

(assert (= (and b!103733 res!85359) b!103729))

(assert (= (and b!103729 res!85362) b!103741))

(assert (= (and b!103741 res!85355) b!103738))

(assert (= (and b!103738 res!85352) b!103731))

(assert (= (and b!103731 res!85357) b!103735))

(assert (= (and b!103735 res!85363) b!103730))

(assert (= (and b!103741 res!85354) b!103732))

(assert (= (and b!103732 res!85360) b!103739))

(assert (= (and b!103741 res!85361) b!103742))

(assert (= (and b!103741 (not res!85353)) b!103740))

(assert (= (and b!103740 (not res!85358)) b!103737))

(assert (= (and b!103737 (not res!85356)) b!103736))

(assert (= start!20584 b!103734))

(declare-fun m!151501 () Bool)

(assert (=> b!103730 m!151501))

(declare-fun m!151503 () Bool)

(assert (=> start!20584 m!151503))

(declare-fun m!151505 () Bool)

(assert (=> b!103732 m!151505))

(declare-fun m!151507 () Bool)

(assert (=> b!103738 m!151507))

(declare-fun m!151509 () Bool)

(assert (=> b!103738 m!151509))

(declare-fun m!151511 () Bool)

(assert (=> b!103735 m!151511))

(assert (=> b!103735 m!151511))

(declare-fun m!151513 () Bool)

(assert (=> b!103735 m!151513))

(declare-fun m!151515 () Bool)

(assert (=> b!103741 m!151515))

(declare-fun m!151517 () Bool)

(assert (=> b!103741 m!151517))

(declare-fun m!151519 () Bool)

(assert (=> b!103741 m!151519))

(declare-fun m!151521 () Bool)

(assert (=> b!103741 m!151521))

(declare-fun m!151523 () Bool)

(assert (=> b!103741 m!151523))

(declare-fun m!151525 () Bool)

(assert (=> b!103741 m!151525))

(declare-fun m!151527 () Bool)

(assert (=> b!103741 m!151527))

(declare-fun m!151529 () Bool)

(assert (=> b!103741 m!151529))

(declare-fun m!151531 () Bool)

(assert (=> b!103741 m!151531))

(declare-fun m!151533 () Bool)

(assert (=> b!103741 m!151533))

(declare-fun m!151535 () Bool)

(assert (=> b!103741 m!151535))

(declare-fun m!151537 () Bool)

(assert (=> b!103741 m!151537))

(declare-fun m!151539 () Bool)

(assert (=> b!103741 m!151539))

(declare-fun m!151541 () Bool)

(assert (=> b!103741 m!151541))

(declare-fun m!151543 () Bool)

(assert (=> b!103741 m!151543))

(declare-fun m!151545 () Bool)

(assert (=> b!103741 m!151545))

(declare-fun m!151547 () Bool)

(assert (=> b!103741 m!151547))

(declare-fun m!151549 () Bool)

(assert (=> b!103741 m!151549))

(declare-fun m!151551 () Bool)

(assert (=> b!103741 m!151551))

(declare-fun m!151553 () Bool)

(assert (=> b!103740 m!151553))

(declare-fun m!151555 () Bool)

(assert (=> b!103739 m!151555))

(declare-fun m!151557 () Bool)

(assert (=> b!103733 m!151557))

(declare-fun m!151559 () Bool)

(assert (=> b!103731 m!151559))

(declare-fun m!151561 () Bool)

(assert (=> b!103736 m!151561))

(assert (=> b!103736 m!151561))

(declare-fun m!151563 () Bool)

(assert (=> b!103736 m!151563))

(declare-fun m!151565 () Bool)

(assert (=> b!103734 m!151565))

(declare-fun m!151567 () Bool)

(assert (=> b!103729 m!151567))

(push 1)

(assert (not b!103741))

(assert (not b!103731))

(assert (not b!103730))

(assert (not b!103738))

(assert (not b!103732))

(assert (not b!103735))

(assert (not b!103734))

(assert (not b!103736))

