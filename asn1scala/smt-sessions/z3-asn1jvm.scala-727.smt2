; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20340 () Bool)

(assert start!20340)

(declare-fun b!102102 () Bool)

(declare-fun e!66778 () Bool)

(declare-datatypes ((array!4784 0))(
  ( (array!4785 (arr!2776 (Array (_ BitVec 32) (_ BitVec 8))) (size!2183 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3840 0))(
  ( (BitStream!3841 (buf!2543 array!4784) (currentByte!5016 (_ BitVec 32)) (currentBit!5011 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!8290 0))(
  ( (tuple2!8291 (_1!4400 BitStream!3840) (_2!4400 Bool)) )
))
(declare-fun lt!148548 () tuple2!8290)

(declare-fun lt!148549 () tuple2!8290)

(assert (=> b!102102 (= e!66778 (= (_2!4400 lt!148548) (_2!4400 lt!148549)))))

(declare-fun b!102103 () Bool)

(declare-fun e!66772 () Bool)

(declare-fun e!66775 () Bool)

(assert (=> b!102103 (= e!66772 e!66775)))

(declare-fun res!83931 () Bool)

(assert (=> b!102103 (=> (not res!83931) (not e!66775))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun lt!148541 () (_ BitVec 64))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!102103 (= res!83931 (and (= (bvand v!199 lt!148541) v!199) (bvslt i!615 nBits!396)))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!102103 (= lt!148541 (onesLSBLong!0 nBits!396))))

(declare-fun b!102104 () Bool)

(declare-fun e!66773 () Bool)

(declare-fun thiss!1305 () BitStream!3840)

(declare-fun array_inv!1985 (array!4784) Bool)

(assert (=> b!102104 (= e!66773 (array_inv!1985 (buf!2543 thiss!1305)))))

(declare-fun res!83933 () Bool)

(declare-fun e!66779 () Bool)

(assert (=> start!20340 (=> (not res!83933) (not e!66779))))

(assert (=> start!20340 (= res!83933 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!20340 e!66779))

(assert (=> start!20340 true))

(declare-fun inv!12 (BitStream!3840) Bool)

(assert (=> start!20340 (and (inv!12 thiss!1305) e!66773)))

(declare-fun b!102105 () Bool)

(declare-fun e!66777 () Bool)

(declare-fun e!66774 () Bool)

(assert (=> b!102105 (= e!66777 e!66774)))

(declare-fun res!83928 () Bool)

(assert (=> b!102105 (=> (not res!83928) (not e!66774))))

(declare-datatypes ((Unit!6262 0))(
  ( (Unit!6263) )
))
(declare-datatypes ((tuple2!8292 0))(
  ( (tuple2!8293 (_1!4401 Unit!6262) (_2!4401 BitStream!3840)) )
))
(declare-fun lt!148556 () tuple2!8292)

(declare-fun lt!148545 () tuple2!8290)

(declare-fun lt!148542 () Bool)

(assert (=> b!102105 (= res!83928 (and (= (_2!4400 lt!148545) lt!148542) (= (_1!4400 lt!148545) (_2!4401 lt!148556))))))

(declare-fun readBitPure!0 (BitStream!3840) tuple2!8290)

(declare-fun readerFrom!0 (BitStream!3840 (_ BitVec 32) (_ BitVec 32)) BitStream!3840)

(assert (=> b!102105 (= lt!148545 (readBitPure!0 (readerFrom!0 (_2!4401 lt!148556) (currentBit!5011 thiss!1305) (currentByte!5016 thiss!1305))))))

(declare-fun b!102106 () Bool)

(declare-fun e!66770 () Bool)

(declare-fun lt!148546 () tuple2!8292)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!102106 (= e!66770 (invariant!0 (currentBit!5011 thiss!1305) (currentByte!5016 thiss!1305) (size!2183 (buf!2543 (_2!4401 lt!148546)))))))

(declare-fun b!102107 () Bool)

(declare-fun e!66771 () Bool)

(assert (=> b!102107 (= e!66775 (not e!66771))))

(declare-fun res!83929 () Bool)

(assert (=> b!102107 (=> res!83929 e!66771)))

(declare-datatypes ((tuple2!8294 0))(
  ( (tuple2!8295 (_1!4402 BitStream!3840) (_2!4402 BitStream!3840)) )
))
(declare-fun lt!148553 () tuple2!8294)

(declare-fun lt!148554 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!102107 (= res!83929 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!2183 (buf!2543 (_1!4402 lt!148553)))) ((_ sign_extend 32) (currentByte!5016 (_1!4402 lt!148553))) ((_ sign_extend 32) (currentBit!5011 (_1!4402 lt!148553))) lt!148554)))))

(assert (=> b!102107 (validate_offset_bits!1 ((_ sign_extend 32) (size!2183 (buf!2543 (_2!4401 lt!148546)))) ((_ sign_extend 32) (currentByte!5016 thiss!1305)) ((_ sign_extend 32) (currentBit!5011 thiss!1305)) lt!148554)))

(declare-fun lt!148558 () Unit!6262)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3840 array!4784 (_ BitVec 64)) Unit!6262)

(assert (=> b!102107 (= lt!148558 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2543 (_2!4401 lt!148546)) lt!148554))))

(declare-fun lt!148557 () (_ BitVec 64))

(declare-fun lt!148544 () (_ BitVec 64))

(assert (=> b!102107 (= lt!148557 (bvand v!199 (bvnot lt!148544)))))

(assert (=> b!102107 (= lt!148544 (onesLSBLong!0 (bvsub nBits!396 i!615)))))

(assert (=> b!102107 (= (_2!4400 (readBitPure!0 (_1!4402 lt!148553))) lt!148542)))

(declare-fun lt!148550 () tuple2!8294)

(declare-fun reader!0 (BitStream!3840 BitStream!3840) tuple2!8294)

(assert (=> b!102107 (= lt!148550 (reader!0 (_2!4401 lt!148556) (_2!4401 lt!148546)))))

(assert (=> b!102107 (= lt!148553 (reader!0 thiss!1305 (_2!4401 lt!148546)))))

(assert (=> b!102107 e!66778))

(declare-fun res!83926 () Bool)

(assert (=> b!102107 (=> (not res!83926) (not e!66778))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!102107 (= res!83926 (= (bitIndex!0 (size!2183 (buf!2543 (_1!4400 lt!148548))) (currentByte!5016 (_1!4400 lt!148548)) (currentBit!5011 (_1!4400 lt!148548))) (bitIndex!0 (size!2183 (buf!2543 (_1!4400 lt!148549))) (currentByte!5016 (_1!4400 lt!148549)) (currentBit!5011 (_1!4400 lt!148549)))))))

(declare-fun lt!148552 () Unit!6262)

(declare-fun lt!148547 () BitStream!3840)

(declare-fun readBitPrefixLemma!0 (BitStream!3840 BitStream!3840) Unit!6262)

(assert (=> b!102107 (= lt!148552 (readBitPrefixLemma!0 lt!148547 (_2!4401 lt!148546)))))

(assert (=> b!102107 (= lt!148549 (readBitPure!0 (BitStream!3841 (buf!2543 (_2!4401 lt!148546)) (currentByte!5016 thiss!1305) (currentBit!5011 thiss!1305))))))

(assert (=> b!102107 (= lt!148548 (readBitPure!0 lt!148547))))

(assert (=> b!102107 (= lt!148547 (BitStream!3841 (buf!2543 (_2!4401 lt!148556)) (currentByte!5016 thiss!1305) (currentBit!5011 thiss!1305)))))

(assert (=> b!102107 e!66770))

(declare-fun res!83927 () Bool)

(assert (=> b!102107 (=> (not res!83927) (not e!66770))))

(declare-fun isPrefixOf!0 (BitStream!3840 BitStream!3840) Bool)

(assert (=> b!102107 (= res!83927 (isPrefixOf!0 thiss!1305 (_2!4401 lt!148546)))))

(declare-fun lt!148543 () Unit!6262)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3840 BitStream!3840 BitStream!3840) Unit!6262)

(assert (=> b!102107 (= lt!148543 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4401 lt!148556) (_2!4401 lt!148546)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3840 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8292)

(assert (=> b!102107 (= lt!148546 (appendNLeastSignificantBitsLoop!0 (_2!4401 lt!148556) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!66780 () Bool)

(assert (=> b!102107 e!66780))

(declare-fun res!83932 () Bool)

(assert (=> b!102107 (=> (not res!83932) (not e!66780))))

(assert (=> b!102107 (= res!83932 (= (size!2183 (buf!2543 thiss!1305)) (size!2183 (buf!2543 (_2!4401 lt!148556)))))))

(declare-fun appendBit!0 (BitStream!3840 Bool) tuple2!8292)

(assert (=> b!102107 (= lt!148556 (appendBit!0 thiss!1305 lt!148542))))

(assert (=> b!102107 (= lt!148542 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!102108 () Bool)

(declare-fun res!83930 () Bool)

(assert (=> b!102108 (=> (not res!83930) (not e!66777))))

(assert (=> b!102108 (= res!83930 (isPrefixOf!0 thiss!1305 (_2!4401 lt!148556)))))

(declare-fun b!102109 () Bool)

(declare-fun res!83924 () Bool)

(assert (=> b!102109 (=> (not res!83924) (not e!66770))))

(assert (=> b!102109 (= res!83924 (invariant!0 (currentBit!5011 thiss!1305) (currentByte!5016 thiss!1305) (size!2183 (buf!2543 (_2!4401 lt!148556)))))))

(declare-fun b!102110 () Bool)

(declare-fun lt!148555 () (_ BitVec 64))

(assert (=> b!102110 (= e!66774 (= (bitIndex!0 (size!2183 (buf!2543 (_1!4400 lt!148545))) (currentByte!5016 (_1!4400 lt!148545)) (currentBit!5011 (_1!4400 lt!148545))) lt!148555))))

(declare-fun b!102111 () Bool)

(assert (=> b!102111 (= e!66780 e!66777)))

(declare-fun res!83925 () Bool)

(assert (=> b!102111 (=> (not res!83925) (not e!66777))))

(declare-fun lt!148551 () (_ BitVec 64))

(assert (=> b!102111 (= res!83925 (= lt!148555 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!148551)))))

(assert (=> b!102111 (= lt!148555 (bitIndex!0 (size!2183 (buf!2543 (_2!4401 lt!148556))) (currentByte!5016 (_2!4401 lt!148556)) (currentBit!5011 (_2!4401 lt!148556))))))

(assert (=> b!102111 (= lt!148551 (bitIndex!0 (size!2183 (buf!2543 thiss!1305)) (currentByte!5016 thiss!1305) (currentBit!5011 thiss!1305)))))

(declare-fun b!102112 () Bool)

(assert (=> b!102112 (= e!66779 e!66772)))

(declare-fun res!83923 () Bool)

(assert (=> b!102112 (=> (not res!83923) (not e!66772))))

(assert (=> b!102112 (= res!83923 (validate_offset_bits!1 ((_ sign_extend 32) (size!2183 (buf!2543 thiss!1305))) ((_ sign_extend 32) (currentByte!5016 thiss!1305)) ((_ sign_extend 32) (currentBit!5011 thiss!1305)) lt!148554))))

(assert (=> b!102112 (= lt!148554 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!102113 () Bool)

(assert (=> b!102113 (= e!66771 (or (not (= (bvand lt!148557 lt!148544) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!148557 lt!148541) lt!148557)))))

(assert (= (and start!20340 res!83933) b!102112))

(assert (= (and b!102112 res!83923) b!102103))

(assert (= (and b!102103 res!83931) b!102107))

(assert (= (and b!102107 res!83932) b!102111))

(assert (= (and b!102111 res!83925) b!102108))

(assert (= (and b!102108 res!83930) b!102105))

(assert (= (and b!102105 res!83928) b!102110))

(assert (= (and b!102107 res!83927) b!102109))

(assert (= (and b!102109 res!83924) b!102106))

(assert (= (and b!102107 res!83926) b!102102))

(assert (= (and b!102107 (not res!83929)) b!102113))

(assert (= start!20340 b!102104))

(declare-fun m!148659 () Bool)

(assert (=> b!102103 m!148659))

(declare-fun m!148661 () Bool)

(assert (=> b!102109 m!148661))

(declare-fun m!148663 () Bool)

(assert (=> b!102108 m!148663))

(declare-fun m!148665 () Bool)

(assert (=> b!102112 m!148665))

(declare-fun m!148667 () Bool)

(assert (=> b!102106 m!148667))

(declare-fun m!148669 () Bool)

(assert (=> b!102105 m!148669))

(assert (=> b!102105 m!148669))

(declare-fun m!148671 () Bool)

(assert (=> b!102105 m!148671))

(declare-fun m!148673 () Bool)

(assert (=> b!102104 m!148673))

(declare-fun m!148675 () Bool)

(assert (=> b!102111 m!148675))

(declare-fun m!148677 () Bool)

(assert (=> b!102111 m!148677))

(declare-fun m!148679 () Bool)

(assert (=> b!102110 m!148679))

(declare-fun m!148681 () Bool)

(assert (=> start!20340 m!148681))

(declare-fun m!148683 () Bool)

(assert (=> b!102107 m!148683))

(declare-fun m!148685 () Bool)

(assert (=> b!102107 m!148685))

(declare-fun m!148687 () Bool)

(assert (=> b!102107 m!148687))

(declare-fun m!148689 () Bool)

(assert (=> b!102107 m!148689))

(declare-fun m!148691 () Bool)

(assert (=> b!102107 m!148691))

(declare-fun m!148693 () Bool)

(assert (=> b!102107 m!148693))

(declare-fun m!148695 () Bool)

(assert (=> b!102107 m!148695))

(declare-fun m!148697 () Bool)

(assert (=> b!102107 m!148697))

(declare-fun m!148699 () Bool)

(assert (=> b!102107 m!148699))

(declare-fun m!148701 () Bool)

(assert (=> b!102107 m!148701))

(declare-fun m!148703 () Bool)

(assert (=> b!102107 m!148703))

(declare-fun m!148705 () Bool)

(assert (=> b!102107 m!148705))

(declare-fun m!148707 () Bool)

(assert (=> b!102107 m!148707))

(declare-fun m!148709 () Bool)

(assert (=> b!102107 m!148709))

(declare-fun m!148711 () Bool)

(assert (=> b!102107 m!148711))

(declare-fun m!148713 () Bool)

(assert (=> b!102107 m!148713))

(check-sat (not b!102107) (not start!20340) (not b!102110) (not b!102109) (not b!102104) (not b!102105) (not b!102108) (not b!102106) (not b!102103) (not b!102111) (not b!102112))
(check-sat)
