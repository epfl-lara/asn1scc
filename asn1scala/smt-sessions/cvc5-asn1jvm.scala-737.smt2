; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20590 () Bool)

(assert start!20590)

(declare-fun b!103855 () Bool)

(declare-fun e!67993 () Bool)

(declare-datatypes ((array!4848 0))(
  ( (array!4849 (arr!2805 (Array (_ BitVec 32) (_ BitVec 8))) (size!2212 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3898 0))(
  ( (BitStream!3899 (buf!2578 array!4848) (currentByte!5063 (_ BitVec 32)) (currentBit!5058 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!8542 0))(
  ( (tuple2!8543 (_1!4526 BitStream!3898) (_2!4526 Bool)) )
))
(declare-fun lt!152075 () tuple2!8542)

(declare-fun lt!152078 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!103855 (= e!67993 (= (bitIndex!0 (size!2212 (buf!2578 (_1!4526 lt!152075))) (currentByte!5063 (_1!4526 lt!152075)) (currentBit!5058 (_1!4526 lt!152075))) lt!152078))))

(declare-fun b!103856 () Bool)

(declare-fun e!67996 () Bool)

(declare-fun lt!152072 () tuple2!8542)

(declare-fun lt!152085 () tuple2!8542)

(assert (=> b!103856 (= e!67996 (= (_2!4526 lt!152072) (_2!4526 lt!152085)))))

(declare-fun res!85473 () Bool)

(declare-fun e!67994 () Bool)

(assert (=> start!20590 (=> (not res!85473) (not e!67994))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> start!20590 (= res!85473 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!20590 e!67994))

(assert (=> start!20590 true))

(declare-fun thiss!1305 () BitStream!3898)

(declare-fun e!67991 () Bool)

(declare-fun inv!12 (BitStream!3898) Bool)

(assert (=> start!20590 (and (inv!12 thiss!1305) e!67991)))

(declare-fun b!103857 () Bool)

(declare-fun res!85481 () Bool)

(declare-fun e!67992 () Bool)

(assert (=> b!103857 (=> res!85481 e!67992)))

(declare-fun lt!152089 () (_ BitVec 64))

(declare-fun lt!152080 () (_ BitVec 64))

(declare-fun lt!152070 () (_ BitVec 64))

(assert (=> b!103857 (= res!85481 (or (not (= (bvand lt!152080 lt!152070) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand lt!152080 lt!152089) lt!152080))))))

(declare-fun b!103858 () Bool)

(declare-fun e!68001 () Bool)

(assert (=> b!103858 (= e!67994 e!68001)))

(declare-fun res!85470 () Bool)

(assert (=> b!103858 (=> (not res!85470) (not e!68001))))

(declare-fun lt!152071 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!103858 (= res!85470 (validate_offset_bits!1 ((_ sign_extend 32) (size!2212 (buf!2578 thiss!1305))) ((_ sign_extend 32) (currentByte!5063 thiss!1305)) ((_ sign_extend 32) (currentBit!5058 thiss!1305)) lt!152071))))

(assert (=> b!103858 (= lt!152071 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!103859 () Bool)

(declare-fun res!85469 () Bool)

(assert (=> b!103859 (=> res!85469 e!67992)))

(declare-datatypes ((tuple2!8544 0))(
  ( (tuple2!8545 (_1!4527 BitStream!3898) (_2!4527 BitStream!3898)) )
))
(declare-fun lt!152087 () tuple2!8544)

(assert (=> b!103859 (= res!85469 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!2212 (buf!2578 (_1!4527 lt!152087)))) ((_ sign_extend 32) (currentByte!5063 (_1!4527 lt!152087))) ((_ sign_extend 32) (currentBit!5058 (_1!4527 lt!152087))) lt!152071)))))

(declare-fun b!103860 () Bool)

(declare-fun res!85480 () Bool)

(declare-fun e!67999 () Bool)

(assert (=> b!103860 (=> (not res!85480) (not e!67999))))

(declare-datatypes ((Unit!6368 0))(
  ( (Unit!6369) )
))
(declare-datatypes ((tuple2!8546 0))(
  ( (tuple2!8547 (_1!4528 Unit!6368) (_2!4528 BitStream!3898)) )
))
(declare-fun lt!152079 () tuple2!8546)

(declare-fun isPrefixOf!0 (BitStream!3898 BitStream!3898) Bool)

(assert (=> b!103860 (= res!85480 (isPrefixOf!0 thiss!1305 (_2!4528 lt!152079)))))

(declare-fun b!103861 () Bool)

(declare-fun e!67997 () Bool)

(assert (=> b!103861 (= e!67997 e!67999)))

(declare-fun res!85476 () Bool)

(assert (=> b!103861 (=> (not res!85476) (not e!67999))))

(declare-fun lt!152086 () (_ BitVec 64))

(assert (=> b!103861 (= res!85476 (= lt!152078 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!152086)))))

(assert (=> b!103861 (= lt!152078 (bitIndex!0 (size!2212 (buf!2578 (_2!4528 lt!152079))) (currentByte!5063 (_2!4528 lt!152079)) (currentBit!5058 (_2!4528 lt!152079))))))

(assert (=> b!103861 (= lt!152086 (bitIndex!0 (size!2212 (buf!2578 thiss!1305)) (currentByte!5063 thiss!1305) (currentBit!5058 thiss!1305)))))

(declare-fun b!103862 () Bool)

(declare-fun e!68000 () Bool)

(declare-fun lt!152068 () tuple2!8546)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!103862 (= e!68000 (invariant!0 (currentBit!5058 thiss!1305) (currentByte!5063 thiss!1305) (size!2212 (buf!2578 (_2!4528 lt!152068)))))))

(declare-fun b!103863 () Bool)

(declare-fun res!85475 () Bool)

(assert (=> b!103863 (=> (not res!85475) (not e!68000))))

(assert (=> b!103863 (= res!85475 (invariant!0 (currentBit!5058 thiss!1305) (currentByte!5063 thiss!1305) (size!2212 (buf!2578 (_2!4528 lt!152079)))))))

(declare-fun b!103864 () Bool)

(assert (=> b!103864 (= e!67999 e!67993)))

(declare-fun res!85471 () Bool)

(assert (=> b!103864 (=> (not res!85471) (not e!67993))))

(declare-fun lt!152084 () Bool)

(assert (=> b!103864 (= res!85471 (and (= (_2!4526 lt!152075) lt!152084) (= (_1!4526 lt!152075) (_2!4528 lt!152079))))))

(declare-fun readBitPure!0 (BitStream!3898) tuple2!8542)

(declare-fun readerFrom!0 (BitStream!3898 (_ BitVec 32) (_ BitVec 32)) BitStream!3898)

(assert (=> b!103864 (= lt!152075 (readBitPure!0 (readerFrom!0 (_2!4528 lt!152079) (currentBit!5058 thiss!1305) (currentByte!5063 thiss!1305))))))

(declare-fun b!103865 () Bool)

(assert (=> b!103865 (= e!67992 true)))

(declare-fun lt!152082 () (_ BitVec 64))

(declare-datatypes ((tuple2!8548 0))(
  ( (tuple2!8549 (_1!4529 BitStream!3898) (_2!4529 (_ BitVec 64))) )
))
(declare-fun lt!152069 () tuple2!8548)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3898 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8548)

(declare-fun withMovedBitIndex!0 (BitStream!3898 (_ BitVec 64)) BitStream!3898)

(assert (=> b!103865 (= lt!152069 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4527 lt!152087) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!152082))))

(declare-fun b!103866 () Bool)

(declare-fun array_inv!2014 (array!4848) Bool)

(assert (=> b!103866 (= e!67991 (array_inv!2014 (buf!2578 thiss!1305)))))

(declare-fun b!103867 () Bool)

(declare-fun e!67998 () Bool)

(assert (=> b!103867 (= e!67998 (not e!67992))))

(declare-fun res!85477 () Bool)

(assert (=> b!103867 (=> res!85477 e!67992)))

(declare-fun lt!152073 () tuple2!8544)

(assert (=> b!103867 (= res!85477 (not (= (_1!4529 (readNLeastSignificantBitsLoopPure!0 (_1!4527 lt!152073) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!152082)) (_2!4527 lt!152073))))))

(declare-fun lt!152088 () (_ BitVec 64))

(assert (=> b!103867 (validate_offset_bits!1 ((_ sign_extend 32) (size!2212 (buf!2578 (_2!4528 lt!152068)))) ((_ sign_extend 32) (currentByte!5063 (_2!4528 lt!152079))) ((_ sign_extend 32) (currentBit!5058 (_2!4528 lt!152079))) lt!152088)))

(declare-fun lt!152067 () Unit!6368)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3898 array!4848 (_ BitVec 64)) Unit!6368)

(assert (=> b!103867 (= lt!152067 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4528 lt!152079) (buf!2578 (_2!4528 lt!152068)) lt!152088))))

(assert (=> b!103867 (= lt!152088 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!152066 () tuple2!8542)

(declare-fun lt!152076 () (_ BitVec 64))

(assert (=> b!103867 (= lt!152082 (bvor lt!152080 (ite (_2!4526 lt!152066) lt!152076 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!152081 () tuple2!8548)

(assert (=> b!103867 (= lt!152081 (readNLeastSignificantBitsLoopPure!0 (_1!4527 lt!152087) nBits!396 i!615 lt!152080))))

(assert (=> b!103867 (validate_offset_bits!1 ((_ sign_extend 32) (size!2212 (buf!2578 (_2!4528 lt!152068)))) ((_ sign_extend 32) (currentByte!5063 thiss!1305)) ((_ sign_extend 32) (currentBit!5058 thiss!1305)) lt!152071)))

(declare-fun lt!152074 () Unit!6368)

(assert (=> b!103867 (= lt!152074 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2578 (_2!4528 lt!152068)) lt!152071))))

(declare-fun v!199 () (_ BitVec 64))

(assert (=> b!103867 (= lt!152080 (bvand v!199 (bvnot lt!152070)))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!103867 (= lt!152070 (onesLSBLong!0 (bvsub nBits!396 i!615)))))

(assert (=> b!103867 (= (_2!4526 lt!152066) lt!152084)))

(assert (=> b!103867 (= lt!152066 (readBitPure!0 (_1!4527 lt!152087)))))

(declare-fun reader!0 (BitStream!3898 BitStream!3898) tuple2!8544)

(assert (=> b!103867 (= lt!152073 (reader!0 (_2!4528 lt!152079) (_2!4528 lt!152068)))))

(assert (=> b!103867 (= lt!152087 (reader!0 thiss!1305 (_2!4528 lt!152068)))))

(assert (=> b!103867 e!67996))

(declare-fun res!85479 () Bool)

(assert (=> b!103867 (=> (not res!85479) (not e!67996))))

(assert (=> b!103867 (= res!85479 (= (bitIndex!0 (size!2212 (buf!2578 (_1!4526 lt!152072))) (currentByte!5063 (_1!4526 lt!152072)) (currentBit!5058 (_1!4526 lt!152072))) (bitIndex!0 (size!2212 (buf!2578 (_1!4526 lt!152085))) (currentByte!5063 (_1!4526 lt!152085)) (currentBit!5058 (_1!4526 lt!152085)))))))

(declare-fun lt!152083 () Unit!6368)

(declare-fun lt!152065 () BitStream!3898)

(declare-fun readBitPrefixLemma!0 (BitStream!3898 BitStream!3898) Unit!6368)

(assert (=> b!103867 (= lt!152083 (readBitPrefixLemma!0 lt!152065 (_2!4528 lt!152068)))))

(assert (=> b!103867 (= lt!152085 (readBitPure!0 (BitStream!3899 (buf!2578 (_2!4528 lt!152068)) (currentByte!5063 thiss!1305) (currentBit!5058 thiss!1305))))))

(assert (=> b!103867 (= lt!152072 (readBitPure!0 lt!152065))))

(assert (=> b!103867 (= lt!152065 (BitStream!3899 (buf!2578 (_2!4528 lt!152079)) (currentByte!5063 thiss!1305) (currentBit!5058 thiss!1305)))))

(assert (=> b!103867 e!68000))

(declare-fun res!85478 () Bool)

(assert (=> b!103867 (=> (not res!85478) (not e!68000))))

(assert (=> b!103867 (= res!85478 (isPrefixOf!0 thiss!1305 (_2!4528 lt!152068)))))

(declare-fun lt!152077 () Unit!6368)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3898 BitStream!3898 BitStream!3898) Unit!6368)

(assert (=> b!103867 (= lt!152077 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4528 lt!152079) (_2!4528 lt!152068)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3898 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8546)

(assert (=> b!103867 (= lt!152068 (appendNLeastSignificantBitsLoop!0 (_2!4528 lt!152079) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!103867 e!67997))

(declare-fun res!85474 () Bool)

(assert (=> b!103867 (=> (not res!85474) (not e!67997))))

(assert (=> b!103867 (= res!85474 (= (size!2212 (buf!2578 thiss!1305)) (size!2212 (buf!2578 (_2!4528 lt!152079)))))))

(declare-fun appendBit!0 (BitStream!3898 Bool) tuple2!8546)

(assert (=> b!103867 (= lt!152079 (appendBit!0 thiss!1305 lt!152084))))

(assert (=> b!103867 (= lt!152084 (not (= (bvand v!199 lt!152076) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!103867 (= lt!152076 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!103868 () Bool)

(assert (=> b!103868 (= e!68001 e!67998)))

(declare-fun res!85472 () Bool)

(assert (=> b!103868 (=> (not res!85472) (not e!67998))))

(assert (=> b!103868 (= res!85472 (and (= (bvand v!199 lt!152089) v!199) (bvslt i!615 nBits!396)))))

(assert (=> b!103868 (= lt!152089 (onesLSBLong!0 nBits!396))))

(assert (= (and start!20590 res!85473) b!103858))

(assert (= (and b!103858 res!85470) b!103868))

(assert (= (and b!103868 res!85472) b!103867))

(assert (= (and b!103867 res!85474) b!103861))

(assert (= (and b!103861 res!85476) b!103860))

(assert (= (and b!103860 res!85480) b!103864))

(assert (= (and b!103864 res!85471) b!103855))

(assert (= (and b!103867 res!85478) b!103863))

(assert (= (and b!103863 res!85475) b!103862))

(assert (= (and b!103867 res!85479) b!103856))

(assert (= (and b!103867 (not res!85477)) b!103859))

(assert (= (and b!103859 (not res!85469)) b!103857))

(assert (= (and b!103857 (not res!85481)) b!103865))

(assert (= start!20590 b!103866))

(declare-fun m!151705 () Bool)

(assert (=> start!20590 m!151705))

(declare-fun m!151707 () Bool)

(assert (=> b!103855 m!151707))

(declare-fun m!151709 () Bool)

(assert (=> b!103868 m!151709))

(declare-fun m!151711 () Bool)

(assert (=> b!103866 m!151711))

(declare-fun m!151713 () Bool)

(assert (=> b!103865 m!151713))

(assert (=> b!103865 m!151713))

(declare-fun m!151715 () Bool)

(assert (=> b!103865 m!151715))

(declare-fun m!151717 () Bool)

(assert (=> b!103862 m!151717))

(declare-fun m!151719 () Bool)

(assert (=> b!103867 m!151719))

(declare-fun m!151721 () Bool)

(assert (=> b!103867 m!151721))

(declare-fun m!151723 () Bool)

(assert (=> b!103867 m!151723))

(declare-fun m!151725 () Bool)

(assert (=> b!103867 m!151725))

(declare-fun m!151727 () Bool)

(assert (=> b!103867 m!151727))

(declare-fun m!151729 () Bool)

(assert (=> b!103867 m!151729))

(declare-fun m!151731 () Bool)

(assert (=> b!103867 m!151731))

(declare-fun m!151733 () Bool)

(assert (=> b!103867 m!151733))

(declare-fun m!151735 () Bool)

(assert (=> b!103867 m!151735))

(declare-fun m!151737 () Bool)

(assert (=> b!103867 m!151737))

(declare-fun m!151739 () Bool)

(assert (=> b!103867 m!151739))

(declare-fun m!151741 () Bool)

(assert (=> b!103867 m!151741))

(declare-fun m!151743 () Bool)

(assert (=> b!103867 m!151743))

(declare-fun m!151745 () Bool)

(assert (=> b!103867 m!151745))

(declare-fun m!151747 () Bool)

(assert (=> b!103867 m!151747))

(declare-fun m!151749 () Bool)

(assert (=> b!103867 m!151749))

(declare-fun m!151751 () Bool)

(assert (=> b!103867 m!151751))

(declare-fun m!151753 () Bool)

(assert (=> b!103867 m!151753))

(declare-fun m!151755 () Bool)

(assert (=> b!103867 m!151755))

(declare-fun m!151757 () Bool)

(assert (=> b!103860 m!151757))

(declare-fun m!151759 () Bool)

(assert (=> b!103863 m!151759))

(declare-fun m!151761 () Bool)

(assert (=> b!103858 m!151761))

(declare-fun m!151763 () Bool)

(assert (=> b!103864 m!151763))

(assert (=> b!103864 m!151763))

(declare-fun m!151765 () Bool)

(assert (=> b!103864 m!151765))

(declare-fun m!151767 () Bool)

(assert (=> b!103859 m!151767))

(declare-fun m!151769 () Bool)

(assert (=> b!103861 m!151769))

(declare-fun m!151771 () Bool)

(assert (=> b!103861 m!151771))

(push 1)

(assert (not b!103863))

(assert (not b!103859))

(assert (not b!103860))

(assert (not b!103861))

(assert (not b!103867))

(assert (not b!103868))

(assert (not b!103865))

(assert (not b!103862))

(assert (not b!103864))

