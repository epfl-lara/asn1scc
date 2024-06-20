; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21956 () Bool)

(assert start!21956)

(declare-fun b!110831 () Bool)

(declare-fun res!91509 () Bool)

(declare-fun e!72739 () Bool)

(assert (=> b!110831 (=> (not res!91509) (not e!72739))))

(declare-datatypes ((array!5085 0))(
  ( (array!5086 (arr!2906 (Array (_ BitVec 32) (_ BitVec 8))) (size!2313 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4100 0))(
  ( (BitStream!4101 (buf!2710 array!5085) (currentByte!5267 (_ BitVec 32)) (currentBit!5262 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4100)

(declare-datatypes ((Unit!6794 0))(
  ( (Unit!6795) )
))
(declare-datatypes ((tuple2!9232 0))(
  ( (tuple2!9233 (_1!4873 Unit!6794) (_2!4873 BitStream!4100)) )
))
(declare-fun lt!167769 () tuple2!9232)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!110831 (= res!91509 (invariant!0 (currentBit!5262 thiss!1305) (currentByte!5267 thiss!1305) (size!2313 (buf!2710 (_2!4873 lt!167769)))))))

(declare-fun res!91503 () Bool)

(declare-fun e!72745 () Bool)

(assert (=> start!21956 (=> (not res!91503) (not e!72745))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> start!21956 (= res!91503 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!21956 e!72745))

(assert (=> start!21956 true))

(declare-fun e!72742 () Bool)

(declare-fun inv!12 (BitStream!4100) Bool)

(assert (=> start!21956 (and (inv!12 thiss!1305) e!72742)))

(declare-fun b!110832 () Bool)

(declare-fun lt!167766 () tuple2!9232)

(assert (=> b!110832 (= e!72739 (invariant!0 (currentBit!5262 thiss!1305) (currentByte!5267 thiss!1305) (size!2313 (buf!2710 (_2!4873 lt!167766)))))))

(declare-fun e!72743 () Bool)

(declare-fun b!110833 () Bool)

(declare-datatypes ((tuple2!9234 0))(
  ( (tuple2!9235 (_1!4874 BitStream!4100) (_2!4874 Bool)) )
))
(declare-fun lt!167754 () tuple2!9234)

(declare-fun lt!167763 () (_ BitVec 64))

(declare-fun lt!167756 () (_ BitVec 64))

(declare-datatypes ((tuple2!9236 0))(
  ( (tuple2!9237 (_1!4875 BitStream!4100) (_2!4875 BitStream!4100)) )
))
(declare-fun lt!167765 () tuple2!9236)

(declare-datatypes ((tuple2!9238 0))(
  ( (tuple2!9239 (_1!4876 BitStream!4100) (_2!4876 (_ BitVec 64))) )
))
(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4100 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9238)

(assert (=> b!110833 (= e!72743 (not (= (_1!4876 (readNLeastSignificantBitsLoopPure!0 (_1!4875 lt!167765) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) (bvor lt!167763 (ite (_2!4874 lt!167754) lt!167756 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!4875 lt!167765))))))

(declare-fun lt!167760 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!110833 (validate_offset_bits!1 ((_ sign_extend 32) (size!2313 (buf!2710 (_2!4873 lt!167766)))) ((_ sign_extend 32) (currentByte!5267 (_2!4873 lt!167769))) ((_ sign_extend 32) (currentBit!5262 (_2!4873 lt!167769))) lt!167760)))

(declare-fun lt!167764 () Unit!6794)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4100 array!5085 (_ BitVec 64)) Unit!6794)

(assert (=> b!110833 (= lt!167764 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4873 lt!167769) (buf!2710 (_2!4873 lt!167766)) lt!167760))))

(assert (=> b!110833 (= lt!167760 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!167757 () tuple2!9236)

(declare-fun lt!167758 () tuple2!9238)

(assert (=> b!110833 (= lt!167758 (readNLeastSignificantBitsLoopPure!0 (_1!4875 lt!167757) nBits!396 i!615 lt!167763))))

(declare-fun lt!167771 () (_ BitVec 64))

(assert (=> b!110833 (validate_offset_bits!1 ((_ sign_extend 32) (size!2313 (buf!2710 (_2!4873 lt!167766)))) ((_ sign_extend 32) (currentByte!5267 thiss!1305)) ((_ sign_extend 32) (currentBit!5262 thiss!1305)) lt!167771)))

(declare-fun lt!167755 () Unit!6794)

(assert (=> b!110833 (= lt!167755 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2710 (_2!4873 lt!167766)) lt!167771))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!110833 (= lt!167763 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(declare-fun lt!167762 () Bool)

(assert (=> b!110833 (= (_2!4874 lt!167754) lt!167762)))

(declare-fun readBitPure!0 (BitStream!4100) tuple2!9234)

(assert (=> b!110833 (= lt!167754 (readBitPure!0 (_1!4875 lt!167757)))))

(declare-fun reader!0 (BitStream!4100 BitStream!4100) tuple2!9236)

(assert (=> b!110833 (= lt!167765 (reader!0 (_2!4873 lt!167769) (_2!4873 lt!167766)))))

(assert (=> b!110833 (= lt!167757 (reader!0 thiss!1305 (_2!4873 lt!167766)))))

(declare-fun e!72746 () Bool)

(assert (=> b!110833 e!72746))

(declare-fun res!91504 () Bool)

(assert (=> b!110833 (=> (not res!91504) (not e!72746))))

(declare-fun lt!167752 () tuple2!9234)

(declare-fun lt!167753 () tuple2!9234)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!110833 (= res!91504 (= (bitIndex!0 (size!2313 (buf!2710 (_1!4874 lt!167752))) (currentByte!5267 (_1!4874 lt!167752)) (currentBit!5262 (_1!4874 lt!167752))) (bitIndex!0 (size!2313 (buf!2710 (_1!4874 lt!167753))) (currentByte!5267 (_1!4874 lt!167753)) (currentBit!5262 (_1!4874 lt!167753)))))))

(declare-fun lt!167767 () Unit!6794)

(declare-fun lt!167770 () BitStream!4100)

(declare-fun readBitPrefixLemma!0 (BitStream!4100 BitStream!4100) Unit!6794)

(assert (=> b!110833 (= lt!167767 (readBitPrefixLemma!0 lt!167770 (_2!4873 lt!167766)))))

(assert (=> b!110833 (= lt!167753 (readBitPure!0 (BitStream!4101 (buf!2710 (_2!4873 lt!167766)) (currentByte!5267 thiss!1305) (currentBit!5262 thiss!1305))))))

(assert (=> b!110833 (= lt!167752 (readBitPure!0 lt!167770))))

(assert (=> b!110833 (= lt!167770 (BitStream!4101 (buf!2710 (_2!4873 lt!167769)) (currentByte!5267 thiss!1305) (currentBit!5262 thiss!1305)))))

(assert (=> b!110833 e!72739))

(declare-fun res!91502 () Bool)

(assert (=> b!110833 (=> (not res!91502) (not e!72739))))

(declare-fun isPrefixOf!0 (BitStream!4100 BitStream!4100) Bool)

(assert (=> b!110833 (= res!91502 (isPrefixOf!0 thiss!1305 (_2!4873 lt!167766)))))

(declare-fun lt!167768 () Unit!6794)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4100 BitStream!4100 BitStream!4100) Unit!6794)

(assert (=> b!110833 (= lt!167768 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4873 lt!167769) (_2!4873 lt!167766)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4100 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9232)

(assert (=> b!110833 (= lt!167766 (appendNLeastSignificantBitsLoop!0 (_2!4873 lt!167769) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!72740 () Bool)

(assert (=> b!110833 e!72740))

(declare-fun res!91508 () Bool)

(assert (=> b!110833 (=> (not res!91508) (not e!72740))))

(assert (=> b!110833 (= res!91508 (= (size!2313 (buf!2710 thiss!1305)) (size!2313 (buf!2710 (_2!4873 lt!167769)))))))

(declare-fun appendBit!0 (BitStream!4100 Bool) tuple2!9232)

(assert (=> b!110833 (= lt!167769 (appendBit!0 thiss!1305 lt!167762))))

(assert (=> b!110833 (= lt!167762 (not (= (bvand v!199 lt!167756) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!110833 (= lt!167756 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!110834 () Bool)

(declare-fun e!72744 () Bool)

(assert (=> b!110834 (= e!72740 e!72744)))

(declare-fun res!91510 () Bool)

(assert (=> b!110834 (=> (not res!91510) (not e!72744))))

(declare-fun lt!167759 () (_ BitVec 64))

(declare-fun lt!167761 () (_ BitVec 64))

(assert (=> b!110834 (= res!91510 (= lt!167759 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!167761)))))

(assert (=> b!110834 (= lt!167759 (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!167769))) (currentByte!5267 (_2!4873 lt!167769)) (currentBit!5262 (_2!4873 lt!167769))))))

(assert (=> b!110834 (= lt!167761 (bitIndex!0 (size!2313 (buf!2710 thiss!1305)) (currentByte!5267 thiss!1305) (currentBit!5262 thiss!1305)))))

(declare-fun b!110835 () Bool)

(declare-fun e!72738 () Bool)

(assert (=> b!110835 (= e!72744 e!72738)))

(declare-fun res!91506 () Bool)

(assert (=> b!110835 (=> (not res!91506) (not e!72738))))

(declare-fun lt!167751 () tuple2!9234)

(assert (=> b!110835 (= res!91506 (and (= (_2!4874 lt!167751) lt!167762) (= (_1!4874 lt!167751) (_2!4873 lt!167769))))))

(declare-fun readerFrom!0 (BitStream!4100 (_ BitVec 32) (_ BitVec 32)) BitStream!4100)

(assert (=> b!110835 (= lt!167751 (readBitPure!0 (readerFrom!0 (_2!4873 lt!167769) (currentBit!5262 thiss!1305) (currentByte!5267 thiss!1305))))))

(declare-fun b!110836 () Bool)

(declare-fun res!91507 () Bool)

(assert (=> b!110836 (=> (not res!91507) (not e!72743))))

(assert (=> b!110836 (= res!91507 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!110837 () Bool)

(assert (=> b!110837 (= e!72745 e!72743)))

(declare-fun res!91501 () Bool)

(assert (=> b!110837 (=> (not res!91501) (not e!72743))))

(assert (=> b!110837 (= res!91501 (validate_offset_bits!1 ((_ sign_extend 32) (size!2313 (buf!2710 thiss!1305))) ((_ sign_extend 32) (currentByte!5267 thiss!1305)) ((_ sign_extend 32) (currentBit!5262 thiss!1305)) lt!167771))))

(assert (=> b!110837 (= lt!167771 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!110838 () Bool)

(assert (=> b!110838 (= e!72746 (= (_2!4874 lt!167752) (_2!4874 lt!167753)))))

(declare-fun b!110839 () Bool)

(declare-fun array_inv!2115 (array!5085) Bool)

(assert (=> b!110839 (= e!72742 (array_inv!2115 (buf!2710 thiss!1305)))))

(declare-fun b!110840 () Bool)

(declare-fun res!91500 () Bool)

(assert (=> b!110840 (=> (not res!91500) (not e!72744))))

(assert (=> b!110840 (= res!91500 (isPrefixOf!0 thiss!1305 (_2!4873 lt!167769)))))

(declare-fun b!110841 () Bool)

(assert (=> b!110841 (= e!72738 (= (bitIndex!0 (size!2313 (buf!2710 (_1!4874 lt!167751))) (currentByte!5267 (_1!4874 lt!167751)) (currentBit!5262 (_1!4874 lt!167751))) lt!167759))))

(declare-fun b!110842 () Bool)

(declare-fun res!91505 () Bool)

(assert (=> b!110842 (=> (not res!91505) (not e!72743))))

(assert (=> b!110842 (= res!91505 (bvslt i!615 nBits!396))))

(assert (= (and start!21956 res!91503) b!110837))

(assert (= (and b!110837 res!91501) b!110836))

(assert (= (and b!110836 res!91507) b!110842))

(assert (= (and b!110842 res!91505) b!110833))

(assert (= (and b!110833 res!91508) b!110834))

(assert (= (and b!110834 res!91510) b!110840))

(assert (= (and b!110840 res!91500) b!110835))

(assert (= (and b!110835 res!91506) b!110841))

(assert (= (and b!110833 res!91502) b!110831))

(assert (= (and b!110831 res!91509) b!110832))

(assert (= (and b!110833 res!91504) b!110838))

(assert (= start!21956 b!110839))

(declare-fun m!164463 () Bool)

(assert (=> b!110832 m!164463))

(declare-fun m!164465 () Bool)

(assert (=> b!110833 m!164465))

(declare-fun m!164467 () Bool)

(assert (=> b!110833 m!164467))

(declare-fun m!164469 () Bool)

(assert (=> b!110833 m!164469))

(declare-fun m!164471 () Bool)

(assert (=> b!110833 m!164471))

(declare-fun m!164473 () Bool)

(assert (=> b!110833 m!164473))

(declare-fun m!164475 () Bool)

(assert (=> b!110833 m!164475))

(declare-fun m!164477 () Bool)

(assert (=> b!110833 m!164477))

(declare-fun m!164479 () Bool)

(assert (=> b!110833 m!164479))

(declare-fun m!164481 () Bool)

(assert (=> b!110833 m!164481))

(declare-fun m!164483 () Bool)

(assert (=> b!110833 m!164483))

(declare-fun m!164485 () Bool)

(assert (=> b!110833 m!164485))

(declare-fun m!164487 () Bool)

(assert (=> b!110833 m!164487))

(declare-fun m!164489 () Bool)

(assert (=> b!110833 m!164489))

(declare-fun m!164491 () Bool)

(assert (=> b!110833 m!164491))

(declare-fun m!164493 () Bool)

(assert (=> b!110833 m!164493))

(declare-fun m!164495 () Bool)

(assert (=> b!110833 m!164495))

(declare-fun m!164497 () Bool)

(assert (=> b!110833 m!164497))

(declare-fun m!164499 () Bool)

(assert (=> b!110833 m!164499))

(declare-fun m!164501 () Bool)

(assert (=> b!110833 m!164501))

(declare-fun m!164503 () Bool)

(assert (=> b!110831 m!164503))

(declare-fun m!164505 () Bool)

(assert (=> b!110840 m!164505))

(declare-fun m!164507 () Bool)

(assert (=> b!110839 m!164507))

(declare-fun m!164509 () Bool)

(assert (=> b!110841 m!164509))

(declare-fun m!164511 () Bool)

(assert (=> b!110837 m!164511))

(declare-fun m!164513 () Bool)

(assert (=> start!21956 m!164513))

(declare-fun m!164515 () Bool)

(assert (=> b!110836 m!164515))

(declare-fun m!164517 () Bool)

(assert (=> b!110834 m!164517))

(declare-fun m!164519 () Bool)

(assert (=> b!110834 m!164519))

(declare-fun m!164521 () Bool)

(assert (=> b!110835 m!164521))

(assert (=> b!110835 m!164521))

(declare-fun m!164523 () Bool)

(assert (=> b!110835 m!164523))

(push 1)

(assert (not b!110834))

(assert (not b!110831))

(assert (not b!110833))

(assert (not b!110841))

(assert (not b!110832))

(assert (not b!110840))

(assert (not b!110839))

(assert (not b!110836))

(assert (not b!110835))

(assert (not b!110837))

(assert (not start!21956))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!34816 () Bool)

(declare-fun res!91519 () Bool)

(declare-fun e!72752 () Bool)

(assert (=> d!34816 (=> (not res!91519) (not e!72752))))

(assert (=> d!34816 (= res!91519 (= (size!2313 (buf!2710 thiss!1305)) (size!2313 (buf!2710 (_2!4873 lt!167769)))))))

(assert (=> d!34816 (= (isPrefixOf!0 thiss!1305 (_2!4873 lt!167769)) e!72752)))

(declare-fun b!110849 () Bool)

(declare-fun res!91518 () Bool)

(assert (=> b!110849 (=> (not res!91518) (not e!72752))))

(assert (=> b!110849 (= res!91518 (bvsle (bitIndex!0 (size!2313 (buf!2710 thiss!1305)) (currentByte!5267 thiss!1305) (currentBit!5262 thiss!1305)) (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!167769))) (currentByte!5267 (_2!4873 lt!167769)) (currentBit!5262 (_2!4873 lt!167769)))))))

(declare-fun b!110850 () Bool)

(declare-fun e!72751 () Bool)

(assert (=> b!110850 (= e!72752 e!72751)))

(declare-fun res!91517 () Bool)

(assert (=> b!110850 (=> res!91517 e!72751)))

(assert (=> b!110850 (= res!91517 (= (size!2313 (buf!2710 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!110851 () Bool)

(declare-fun arrayBitRangesEq!0 (array!5085 array!5085 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!110851 (= e!72751 (arrayBitRangesEq!0 (buf!2710 thiss!1305) (buf!2710 (_2!4873 lt!167769)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2313 (buf!2710 thiss!1305)) (currentByte!5267 thiss!1305) (currentBit!5262 thiss!1305))))))

(assert (= (and d!34816 res!91519) b!110849))

(assert (= (and b!110849 res!91518) b!110850))

(assert (= (and b!110850 (not res!91517)) b!110851))

(assert (=> b!110849 m!164519))

(assert (=> b!110849 m!164517))

(assert (=> b!110851 m!164519))

(assert (=> b!110851 m!164519))

(declare-fun m!164525 () Bool)

(assert (=> b!110851 m!164525))

(assert (=> b!110840 d!34816))

(declare-fun d!34818 () Bool)

(declare-fun e!72755 () Bool)

(assert (=> d!34818 e!72755))

(declare-fun res!91524 () Bool)

(assert (=> d!34818 (=> (not res!91524) (not e!72755))))

(declare-fun lt!167784 () (_ BitVec 64))

(declare-fun lt!167789 () (_ BitVec 64))

(declare-fun lt!167785 () (_ BitVec 64))

(assert (=> d!34818 (= res!91524 (= lt!167785 (bvsub lt!167789 lt!167784)))))

(assert (=> d!34818 (or (= (bvand lt!167789 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!167784 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!167789 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!167789 lt!167784) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!34818 (= lt!167784 (remainingBits!0 ((_ sign_extend 32) (size!2313 (buf!2710 (_1!4874 lt!167751)))) ((_ sign_extend 32) (currentByte!5267 (_1!4874 lt!167751))) ((_ sign_extend 32) (currentBit!5262 (_1!4874 lt!167751)))))))

(declare-fun lt!167787 () (_ BitVec 64))

(declare-fun lt!167788 () (_ BitVec 64))

(assert (=> d!34818 (= lt!167789 (bvmul lt!167787 lt!167788))))

(assert (=> d!34818 (or (= lt!167787 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!167788 (bvsdiv (bvmul lt!167787 lt!167788) lt!167787)))))

(assert (=> d!34818 (= lt!167788 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!34818 (= lt!167787 ((_ sign_extend 32) (size!2313 (buf!2710 (_1!4874 lt!167751)))))))

(assert (=> d!34818 (= lt!167785 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5267 (_1!4874 lt!167751))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5262 (_1!4874 lt!167751)))))))

(assert (=> d!34818 (invariant!0 (currentBit!5262 (_1!4874 lt!167751)) (currentByte!5267 (_1!4874 lt!167751)) (size!2313 (buf!2710 (_1!4874 lt!167751))))))

(assert (=> d!34818 (= (bitIndex!0 (size!2313 (buf!2710 (_1!4874 lt!167751))) (currentByte!5267 (_1!4874 lt!167751)) (currentBit!5262 (_1!4874 lt!167751))) lt!167785)))

(declare-fun b!110856 () Bool)

(declare-fun res!91525 () Bool)

(assert (=> b!110856 (=> (not res!91525) (not e!72755))))

(assert (=> b!110856 (= res!91525 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!167785))))

(declare-fun b!110857 () Bool)

(declare-fun lt!167786 () (_ BitVec 64))

(assert (=> b!110857 (= e!72755 (bvsle lt!167785 (bvmul lt!167786 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!110857 (or (= lt!167786 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!167786 #b0000000000000000000000000000000000000000000000000000000000001000) lt!167786)))))

(assert (=> b!110857 (= lt!167786 ((_ sign_extend 32) (size!2313 (buf!2710 (_1!4874 lt!167751)))))))

(assert (= (and d!34818 res!91524) b!110856))

(assert (= (and b!110856 res!91525) b!110857))

(declare-fun m!164527 () Bool)

(assert (=> d!34818 m!164527))

(declare-fun m!164529 () Bool)

(assert (=> d!34818 m!164529))

(assert (=> b!110841 d!34818))

(declare-fun d!34820 () Bool)

(assert (=> d!34820 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5262 thiss!1305) (currentByte!5267 thiss!1305) (size!2313 (buf!2710 thiss!1305))))))

(declare-fun bs!8540 () Bool)

(assert (= bs!8540 d!34820))

(declare-fun m!164531 () Bool)

(assert (=> bs!8540 m!164531))

(assert (=> start!21956 d!34820))

(declare-fun d!34822 () Bool)

(assert (=> d!34822 (= (invariant!0 (currentBit!5262 thiss!1305) (currentByte!5267 thiss!1305) (size!2313 (buf!2710 (_2!4873 lt!167769)))) (and (bvsge (currentBit!5262 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5262 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5267 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5267 thiss!1305) (size!2313 (buf!2710 (_2!4873 lt!167769)))) (and (= (currentBit!5262 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5267 thiss!1305) (size!2313 (buf!2710 (_2!4873 lt!167769))))))))))

(assert (=> b!110831 d!34822))

(declare-fun d!34824 () Bool)

(assert (=> d!34824 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2313 (buf!2710 thiss!1305))) ((_ sign_extend 32) (currentByte!5267 thiss!1305)) ((_ sign_extend 32) (currentBit!5262 thiss!1305)) lt!167771) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2313 (buf!2710 thiss!1305))) ((_ sign_extend 32) (currentByte!5267 thiss!1305)) ((_ sign_extend 32) (currentBit!5262 thiss!1305))) lt!167771))))

(declare-fun bs!8541 () Bool)

(assert (= bs!8541 d!34824))

(declare-fun m!164533 () Bool)

(assert (=> bs!8541 m!164533))

(assert (=> b!110837 d!34824))

(declare-fun d!34826 () Bool)

(assert (=> d!34826 (= (array_inv!2115 (buf!2710 thiss!1305)) (bvsge (size!2313 (buf!2710 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!110839 d!34826))

(declare-fun d!34828 () Bool)

(declare-datatypes ((tuple2!9242 0))(
  ( (tuple2!9243 (_1!4878 Bool) (_2!4878 BitStream!4100)) )
))
(declare-fun lt!167792 () tuple2!9242)

(declare-fun readBit!0 (BitStream!4100) tuple2!9242)

(assert (=> d!34828 (= lt!167792 (readBit!0 (readerFrom!0 (_2!4873 lt!167769) (currentBit!5262 thiss!1305) (currentByte!5267 thiss!1305))))))

(assert (=> d!34828 (= (readBitPure!0 (readerFrom!0 (_2!4873 lt!167769) (currentBit!5262 thiss!1305) (currentByte!5267 thiss!1305))) (tuple2!9235 (_2!4878 lt!167792) (_1!4878 lt!167792)))))

(declare-fun bs!8542 () Bool)

(assert (= bs!8542 d!34828))

(assert (=> bs!8542 m!164521))

(declare-fun m!164535 () Bool)

(assert (=> bs!8542 m!164535))

(assert (=> b!110835 d!34828))

(declare-fun d!34830 () Bool)

(declare-fun e!72758 () Bool)

(assert (=> d!34830 e!72758))

(declare-fun res!91529 () Bool)

(assert (=> d!34830 (=> (not res!91529) (not e!72758))))

(assert (=> d!34830 (= res!91529 (invariant!0 (currentBit!5262 (_2!4873 lt!167769)) (currentByte!5267 (_2!4873 lt!167769)) (size!2313 (buf!2710 (_2!4873 lt!167769)))))))

(assert (=> d!34830 (= (readerFrom!0 (_2!4873 lt!167769) (currentBit!5262 thiss!1305) (currentByte!5267 thiss!1305)) (BitStream!4101 (buf!2710 (_2!4873 lt!167769)) (currentByte!5267 thiss!1305) (currentBit!5262 thiss!1305)))))

(declare-fun b!110860 () Bool)

(assert (=> b!110860 (= e!72758 (invariant!0 (currentBit!5262 thiss!1305) (currentByte!5267 thiss!1305) (size!2313 (buf!2710 (_2!4873 lt!167769)))))))

(assert (= (and d!34830 res!91529) b!110860))

(declare-fun m!164537 () Bool)

(assert (=> d!34830 m!164537))

(assert (=> b!110860 m!164503))

(assert (=> b!110835 d!34830))

(declare-fun d!34832 () Bool)

(assert (=> d!34832 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!110836 d!34832))

(declare-fun d!34834 () Bool)

(assert (=> d!34834 (= (invariant!0 (currentBit!5262 thiss!1305) (currentByte!5267 thiss!1305) (size!2313 (buf!2710 (_2!4873 lt!167766)))) (and (bvsge (currentBit!5262 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5262 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5267 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5267 thiss!1305) (size!2313 (buf!2710 (_2!4873 lt!167766)))) (and (= (currentBit!5262 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5267 thiss!1305) (size!2313 (buf!2710 (_2!4873 lt!167766))))))))))

(assert (=> b!110832 d!34834))

(declare-fun d!34836 () Bool)

(assert (=> d!34836 (= (onesLSBLong!0 (bvsub nBits!396 i!615)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!396 i!615)))))))

(assert (=> b!110833 d!34836))

(declare-datatypes ((tuple2!9246 0))(
  ( (tuple2!9247 (_1!4880 (_ BitVec 64)) (_2!4880 BitStream!4100)) )
))
(declare-fun lt!167795 () tuple2!9246)

(declare-fun d!34838 () Bool)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!4100 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9246)

(assert (=> d!34838 (= lt!167795 (readNLeastSignificantBitsLoop!0 (_1!4875 lt!167757) nBits!396 i!615 lt!167763))))

(assert (=> d!34838 (= (readNLeastSignificantBitsLoopPure!0 (_1!4875 lt!167757) nBits!396 i!615 lt!167763) (tuple2!9239 (_2!4880 lt!167795) (_1!4880 lt!167795)))))

(declare-fun bs!8543 () Bool)

(assert (= bs!8543 d!34838))

(declare-fun m!164539 () Bool)

(assert (=> bs!8543 m!164539))

(assert (=> b!110833 d!34838))

(declare-fun d!34840 () Bool)

(assert (=> d!34840 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2313 (buf!2710 (_2!4873 lt!167766)))) ((_ sign_extend 32) (currentByte!5267 thiss!1305)) ((_ sign_extend 32) (currentBit!5262 thiss!1305)) lt!167771) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2313 (buf!2710 (_2!4873 lt!167766)))) ((_ sign_extend 32) (currentByte!5267 thiss!1305)) ((_ sign_extend 32) (currentBit!5262 thiss!1305))) lt!167771))))

(declare-fun bs!8544 () Bool)

(assert (= bs!8544 d!34840))

(declare-fun m!164541 () Bool)

(assert (=> bs!8544 m!164541))

(assert (=> b!110833 d!34840))

(declare-fun d!34842 () Bool)

(assert (=> d!34842 (validate_offset_bits!1 ((_ sign_extend 32) (size!2313 (buf!2710 (_2!4873 lt!167766)))) ((_ sign_extend 32) (currentByte!5267 thiss!1305)) ((_ sign_extend 32) (currentBit!5262 thiss!1305)) lt!167771)))

(declare-fun lt!167798 () Unit!6794)

(declare-fun choose!9 (BitStream!4100 array!5085 (_ BitVec 64) BitStream!4100) Unit!6794)

(assert (=> d!34842 (= lt!167798 (choose!9 thiss!1305 (buf!2710 (_2!4873 lt!167766)) lt!167771 (BitStream!4101 (buf!2710 (_2!4873 lt!167766)) (currentByte!5267 thiss!1305) (currentBit!5262 thiss!1305))))))

(assert (=> d!34842 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2710 (_2!4873 lt!167766)) lt!167771) lt!167798)))

(declare-fun bs!8545 () Bool)

(assert (= bs!8545 d!34842))

(assert (=> bs!8545 m!164465))

(declare-fun m!164543 () Bool)

(assert (=> bs!8545 m!164543))

(assert (=> b!110833 d!34842))

(declare-fun d!34844 () Bool)

(assert (=> d!34844 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2313 (buf!2710 (_2!4873 lt!167766)))) ((_ sign_extend 32) (currentByte!5267 (_2!4873 lt!167769))) ((_ sign_extend 32) (currentBit!5262 (_2!4873 lt!167769))) lt!167760) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2313 (buf!2710 (_2!4873 lt!167766)))) ((_ sign_extend 32) (currentByte!5267 (_2!4873 lt!167769))) ((_ sign_extend 32) (currentBit!5262 (_2!4873 lt!167769)))) lt!167760))))

(declare-fun bs!8546 () Bool)

(assert (= bs!8546 d!34844))

(declare-fun m!164545 () Bool)

(assert (=> bs!8546 m!164545))

(assert (=> b!110833 d!34844))

(declare-fun d!34846 () Bool)

(declare-fun e!72761 () Bool)

(assert (=> d!34846 e!72761))

(declare-fun res!91532 () Bool)

(assert (=> d!34846 (=> (not res!91532) (not e!72761))))

(declare-fun lt!167810 () tuple2!9234)

(declare-fun lt!167808 () tuple2!9234)

(assert (=> d!34846 (= res!91532 (= (bitIndex!0 (size!2313 (buf!2710 (_1!4874 lt!167810))) (currentByte!5267 (_1!4874 lt!167810)) (currentBit!5262 (_1!4874 lt!167810))) (bitIndex!0 (size!2313 (buf!2710 (_1!4874 lt!167808))) (currentByte!5267 (_1!4874 lt!167808)) (currentBit!5262 (_1!4874 lt!167808)))))))

(declare-fun lt!167807 () Unit!6794)

(declare-fun lt!167809 () BitStream!4100)

(declare-fun choose!50 (BitStream!4100 BitStream!4100 BitStream!4100 tuple2!9234 tuple2!9234 BitStream!4100 Bool tuple2!9234 tuple2!9234 BitStream!4100 Bool) Unit!6794)

(assert (=> d!34846 (= lt!167807 (choose!50 lt!167770 (_2!4873 lt!167766) lt!167809 lt!167810 (tuple2!9235 (_1!4874 lt!167810) (_2!4874 lt!167810)) (_1!4874 lt!167810) (_2!4874 lt!167810) lt!167808 (tuple2!9235 (_1!4874 lt!167808) (_2!4874 lt!167808)) (_1!4874 lt!167808) (_2!4874 lt!167808)))))

(assert (=> d!34846 (= lt!167808 (readBitPure!0 lt!167809))))

(assert (=> d!34846 (= lt!167810 (readBitPure!0 lt!167770))))

(assert (=> d!34846 (= lt!167809 (BitStream!4101 (buf!2710 (_2!4873 lt!167766)) (currentByte!5267 lt!167770) (currentBit!5262 lt!167770)))))

(assert (=> d!34846 (invariant!0 (currentBit!5262 lt!167770) (currentByte!5267 lt!167770) (size!2313 (buf!2710 (_2!4873 lt!167766))))))

(assert (=> d!34846 (= (readBitPrefixLemma!0 lt!167770 (_2!4873 lt!167766)) lt!167807)))

(declare-fun b!110863 () Bool)

(assert (=> b!110863 (= e!72761 (= (_2!4874 lt!167810) (_2!4874 lt!167808)))))

(assert (= (and d!34846 res!91532) b!110863))

(declare-fun m!164547 () Bool)

(assert (=> d!34846 m!164547))

(assert (=> d!34846 m!164501))

(declare-fun m!164549 () Bool)

(assert (=> d!34846 m!164549))

(declare-fun m!164551 () Bool)

(assert (=> d!34846 m!164551))

(declare-fun m!164553 () Bool)

(assert (=> d!34846 m!164553))

(declare-fun m!164555 () Bool)

(assert (=> d!34846 m!164555))

(assert (=> b!110833 d!34846))

(declare-fun b!110894 () Bool)

(declare-fun res!91560 () Bool)

(declare-fun e!72780 () Bool)

(assert (=> b!110894 (=> (not res!91560) (not e!72780))))

(declare-fun lt!167903 () tuple2!9236)

(assert (=> b!110894 (= res!91560 (isPrefixOf!0 (_1!4875 lt!167903) (_2!4873 lt!167769)))))

(declare-fun lt!167886 () (_ BitVec 64))

(declare-fun b!110896 () Bool)

(declare-fun lt!167893 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!4100 (_ BitVec 64)) BitStream!4100)

(assert (=> b!110896 (= e!72780 (= (_1!4875 lt!167903) (withMovedBitIndex!0 (_2!4875 lt!167903) (bvsub lt!167893 lt!167886))))))

(assert (=> b!110896 (or (= (bvand lt!167893 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!167886 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!167893 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!167893 lt!167886) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!110896 (= lt!167886 (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!167766))) (currentByte!5267 (_2!4873 lt!167766)) (currentBit!5262 (_2!4873 lt!167766))))))

(assert (=> b!110896 (= lt!167893 (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!167769))) (currentByte!5267 (_2!4873 lt!167769)) (currentBit!5262 (_2!4873 lt!167769))))))

(declare-fun b!110897 () Bool)

(declare-fun e!72779 () Unit!6794)

(declare-fun lt!167894 () Unit!6794)

(assert (=> b!110897 (= e!72779 lt!167894)))

(declare-fun lt!167884 () (_ BitVec 64))

(assert (=> b!110897 (= lt!167884 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!167900 () (_ BitVec 64))

(assert (=> b!110897 (= lt!167900 (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!167769))) (currentByte!5267 (_2!4873 lt!167769)) (currentBit!5262 (_2!4873 lt!167769))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!5085 array!5085 (_ BitVec 64) (_ BitVec 64)) Unit!6794)

(assert (=> b!110897 (= lt!167894 (arrayBitRangesEqSymmetric!0 (buf!2710 (_2!4873 lt!167769)) (buf!2710 (_2!4873 lt!167766)) lt!167884 lt!167900))))

(assert (=> b!110897 (arrayBitRangesEq!0 (buf!2710 (_2!4873 lt!167766)) (buf!2710 (_2!4873 lt!167769)) lt!167884 lt!167900)))

(declare-fun b!110898 () Bool)

(declare-fun res!91562 () Bool)

(assert (=> b!110898 (=> (not res!91562) (not e!72780))))

(assert (=> b!110898 (= res!91562 (isPrefixOf!0 (_2!4875 lt!167903) (_2!4873 lt!167766)))))

(declare-fun d!34848 () Bool)

(assert (=> d!34848 e!72780))

(declare-fun res!91561 () Bool)

(assert (=> d!34848 (=> (not res!91561) (not e!72780))))

(assert (=> d!34848 (= res!91561 (isPrefixOf!0 (_1!4875 lt!167903) (_2!4875 lt!167903)))))

(declare-fun lt!167892 () BitStream!4100)

(assert (=> d!34848 (= lt!167903 (tuple2!9237 lt!167892 (_2!4873 lt!167766)))))

(declare-fun lt!167898 () Unit!6794)

(declare-fun lt!167885 () Unit!6794)

(assert (=> d!34848 (= lt!167898 lt!167885)))

(assert (=> d!34848 (isPrefixOf!0 lt!167892 (_2!4873 lt!167766))))

(assert (=> d!34848 (= lt!167885 (lemmaIsPrefixTransitive!0 lt!167892 (_2!4873 lt!167766) (_2!4873 lt!167766)))))

(declare-fun lt!167897 () Unit!6794)

(declare-fun lt!167895 () Unit!6794)

(assert (=> d!34848 (= lt!167897 lt!167895)))

(assert (=> d!34848 (isPrefixOf!0 lt!167892 (_2!4873 lt!167766))))

(assert (=> d!34848 (= lt!167895 (lemmaIsPrefixTransitive!0 lt!167892 (_2!4873 lt!167769) (_2!4873 lt!167766)))))

(declare-fun lt!167888 () Unit!6794)

(assert (=> d!34848 (= lt!167888 e!72779)))

(declare-fun c!6731 () Bool)

(assert (=> d!34848 (= c!6731 (not (= (size!2313 (buf!2710 (_2!4873 lt!167769))) #b00000000000000000000000000000000)))))

(declare-fun lt!167902 () Unit!6794)

(declare-fun lt!167896 () Unit!6794)

(assert (=> d!34848 (= lt!167902 lt!167896)))

(assert (=> d!34848 (isPrefixOf!0 (_2!4873 lt!167766) (_2!4873 lt!167766))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4100) Unit!6794)

(assert (=> d!34848 (= lt!167896 (lemmaIsPrefixRefl!0 (_2!4873 lt!167766)))))

(declare-fun lt!167890 () Unit!6794)

(declare-fun lt!167899 () Unit!6794)

(assert (=> d!34848 (= lt!167890 lt!167899)))

(assert (=> d!34848 (= lt!167899 (lemmaIsPrefixRefl!0 (_2!4873 lt!167766)))))

(declare-fun lt!167887 () Unit!6794)

(declare-fun lt!167891 () Unit!6794)

(assert (=> d!34848 (= lt!167887 lt!167891)))

(assert (=> d!34848 (isPrefixOf!0 lt!167892 lt!167892)))

(assert (=> d!34848 (= lt!167891 (lemmaIsPrefixRefl!0 lt!167892))))

(declare-fun lt!167889 () Unit!6794)

(declare-fun lt!167901 () Unit!6794)

(assert (=> d!34848 (= lt!167889 lt!167901)))

(assert (=> d!34848 (isPrefixOf!0 (_2!4873 lt!167769) (_2!4873 lt!167769))))

(assert (=> d!34848 (= lt!167901 (lemmaIsPrefixRefl!0 (_2!4873 lt!167769)))))

(assert (=> d!34848 (= lt!167892 (BitStream!4101 (buf!2710 (_2!4873 lt!167766)) (currentByte!5267 (_2!4873 lt!167769)) (currentBit!5262 (_2!4873 lt!167769))))))

(assert (=> d!34848 (isPrefixOf!0 (_2!4873 lt!167769) (_2!4873 lt!167766))))

(assert (=> d!34848 (= (reader!0 (_2!4873 lt!167769) (_2!4873 lt!167766)) lt!167903)))

(declare-fun b!110895 () Bool)

(declare-fun Unit!6797 () Unit!6794)

(assert (=> b!110895 (= e!72779 Unit!6797)))

(assert (= (and d!34848 c!6731) b!110897))

(assert (= (and d!34848 (not c!6731)) b!110895))

(assert (= (and d!34848 res!91561) b!110894))

(assert (= (and b!110894 res!91560) b!110898))

(assert (= (and b!110898 res!91562) b!110896))

(declare-fun m!164577 () Bool)

(assert (=> b!110898 m!164577))

(declare-fun m!164581 () Bool)

(assert (=> b!110896 m!164581))

(declare-fun m!164583 () Bool)

(assert (=> b!110896 m!164583))

(assert (=> b!110896 m!164517))

(declare-fun m!164585 () Bool)

(assert (=> b!110894 m!164585))

(declare-fun m!164587 () Bool)

(assert (=> d!34848 m!164587))

(declare-fun m!164589 () Bool)

(assert (=> d!34848 m!164589))

(declare-fun m!164591 () Bool)

(assert (=> d!34848 m!164591))

(declare-fun m!164593 () Bool)

(assert (=> d!34848 m!164593))

(declare-fun m!164595 () Bool)

(assert (=> d!34848 m!164595))

(declare-fun m!164597 () Bool)

(assert (=> d!34848 m!164597))

(declare-fun m!164599 () Bool)

(assert (=> d!34848 m!164599))

(declare-fun m!164601 () Bool)

(assert (=> d!34848 m!164601))

(declare-fun m!164603 () Bool)

(assert (=> d!34848 m!164603))

(declare-fun m!164605 () Bool)

(assert (=> d!34848 m!164605))

(declare-fun m!164607 () Bool)

(assert (=> d!34848 m!164607))

(assert (=> b!110897 m!164517))

(declare-fun m!164609 () Bool)

(assert (=> b!110897 m!164609))

(declare-fun m!164611 () Bool)

(assert (=> b!110897 m!164611))

(assert (=> b!110833 d!34848))

(declare-fun d!34876 () Bool)

(declare-fun lt!167909 () tuple2!9242)

(assert (=> d!34876 (= lt!167909 (readBit!0 (_1!4875 lt!167757)))))

(assert (=> d!34876 (= (readBitPure!0 (_1!4875 lt!167757)) (tuple2!9235 (_2!4878 lt!167909) (_1!4878 lt!167909)))))

(declare-fun bs!8554 () Bool)

(assert (= bs!8554 d!34876))

(declare-fun m!164615 () Bool)

(assert (=> bs!8554 m!164615))

(assert (=> b!110833 d!34876))

(declare-fun d!34880 () Bool)

(declare-fun lt!167917 () tuple2!9242)

(assert (=> d!34880 (= lt!167917 (readBit!0 (BitStream!4101 (buf!2710 (_2!4873 lt!167766)) (currentByte!5267 thiss!1305) (currentBit!5262 thiss!1305))))))

(assert (=> d!34880 (= (readBitPure!0 (BitStream!4101 (buf!2710 (_2!4873 lt!167766)) (currentByte!5267 thiss!1305) (currentBit!5262 thiss!1305))) (tuple2!9235 (_2!4878 lt!167917) (_1!4878 lt!167917)))))

(declare-fun bs!8556 () Bool)

(assert (= bs!8556 d!34880))

(declare-fun m!164619 () Bool)

(assert (=> bs!8556 m!164619))

(assert (=> b!110833 d!34880))

(declare-fun d!34884 () Bool)

(assert (=> d!34884 (isPrefixOf!0 thiss!1305 (_2!4873 lt!167766))))

(declare-fun lt!167920 () Unit!6794)

(declare-fun choose!30 (BitStream!4100 BitStream!4100 BitStream!4100) Unit!6794)

(assert (=> d!34884 (= lt!167920 (choose!30 thiss!1305 (_2!4873 lt!167769) (_2!4873 lt!167766)))))

(assert (=> d!34884 (isPrefixOf!0 thiss!1305 (_2!4873 lt!167769))))

(assert (=> d!34884 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4873 lt!167769) (_2!4873 lt!167766)) lt!167920)))

(declare-fun bs!8557 () Bool)

(assert (= bs!8557 d!34884))

(assert (=> bs!8557 m!164497))

(declare-fun m!164625 () Bool)

(assert (=> bs!8557 m!164625))

(assert (=> bs!8557 m!164505))

(assert (=> b!110833 d!34884))

(declare-fun d!34888 () Bool)

(assert (=> d!34888 (validate_offset_bits!1 ((_ sign_extend 32) (size!2313 (buf!2710 (_2!4873 lt!167766)))) ((_ sign_extend 32) (currentByte!5267 (_2!4873 lt!167769))) ((_ sign_extend 32) (currentBit!5262 (_2!4873 lt!167769))) lt!167760)))

(declare-fun lt!167921 () Unit!6794)

(assert (=> d!34888 (= lt!167921 (choose!9 (_2!4873 lt!167769) (buf!2710 (_2!4873 lt!167766)) lt!167760 (BitStream!4101 (buf!2710 (_2!4873 lt!167766)) (currentByte!5267 (_2!4873 lt!167769)) (currentBit!5262 (_2!4873 lt!167769)))))))

(assert (=> d!34888 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4873 lt!167769) (buf!2710 (_2!4873 lt!167766)) lt!167760) lt!167921)))

(declare-fun bs!8558 () Bool)

(assert (= bs!8558 d!34888))

(assert (=> bs!8558 m!164479))

(declare-fun m!164627 () Bool)

(assert (=> bs!8558 m!164627))

(assert (=> b!110833 d!34888))

(declare-fun d!34890 () Bool)

(declare-fun lt!167922 () tuple2!9242)

(assert (=> d!34890 (= lt!167922 (readBit!0 lt!167770))))

(assert (=> d!34890 (= (readBitPure!0 lt!167770) (tuple2!9235 (_2!4878 lt!167922) (_1!4878 lt!167922)))))

(declare-fun bs!8559 () Bool)

(assert (= bs!8559 d!34890))

(declare-fun m!164629 () Bool)

(assert (=> bs!8559 m!164629))

(assert (=> b!110833 d!34890))

(declare-fun d!34892 () Bool)

(declare-fun e!72782 () Bool)

(assert (=> d!34892 e!72782))

(declare-fun res!91565 () Bool)

(assert (=> d!34892 (=> (not res!91565) (not e!72782))))

(declare-fun lt!167928 () (_ BitVec 64))

(declare-fun lt!167924 () (_ BitVec 64))

(declare-fun lt!167923 () (_ BitVec 64))

(assert (=> d!34892 (= res!91565 (= lt!167924 (bvsub lt!167928 lt!167923)))))

(assert (=> d!34892 (or (= (bvand lt!167928 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!167923 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!167928 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!167928 lt!167923) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!34892 (= lt!167923 (remainingBits!0 ((_ sign_extend 32) (size!2313 (buf!2710 (_1!4874 lt!167752)))) ((_ sign_extend 32) (currentByte!5267 (_1!4874 lt!167752))) ((_ sign_extend 32) (currentBit!5262 (_1!4874 lt!167752)))))))

(declare-fun lt!167926 () (_ BitVec 64))

(declare-fun lt!167927 () (_ BitVec 64))

(assert (=> d!34892 (= lt!167928 (bvmul lt!167926 lt!167927))))

(assert (=> d!34892 (or (= lt!167926 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!167927 (bvsdiv (bvmul lt!167926 lt!167927) lt!167926)))))

(assert (=> d!34892 (= lt!167927 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!34892 (= lt!167926 ((_ sign_extend 32) (size!2313 (buf!2710 (_1!4874 lt!167752)))))))

(assert (=> d!34892 (= lt!167924 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5267 (_1!4874 lt!167752))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5262 (_1!4874 lt!167752)))))))

(assert (=> d!34892 (invariant!0 (currentBit!5262 (_1!4874 lt!167752)) (currentByte!5267 (_1!4874 lt!167752)) (size!2313 (buf!2710 (_1!4874 lt!167752))))))

(assert (=> d!34892 (= (bitIndex!0 (size!2313 (buf!2710 (_1!4874 lt!167752))) (currentByte!5267 (_1!4874 lt!167752)) (currentBit!5262 (_1!4874 lt!167752))) lt!167924)))

(declare-fun b!110901 () Bool)

(declare-fun res!91566 () Bool)

(assert (=> b!110901 (=> (not res!91566) (not e!72782))))

(assert (=> b!110901 (= res!91566 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!167924))))

(declare-fun b!110902 () Bool)

(declare-fun lt!167925 () (_ BitVec 64))

(assert (=> b!110902 (= e!72782 (bvsle lt!167924 (bvmul lt!167925 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!110902 (or (= lt!167925 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!167925 #b0000000000000000000000000000000000000000000000000000000000001000) lt!167925)))))

(assert (=> b!110902 (= lt!167925 ((_ sign_extend 32) (size!2313 (buf!2710 (_1!4874 lt!167752)))))))

(assert (= (and d!34892 res!91565) b!110901))

(assert (= (and b!110901 res!91566) b!110902))

(declare-fun m!164631 () Bool)

(assert (=> d!34892 m!164631))

(declare-fun m!164633 () Bool)

(assert (=> d!34892 m!164633))

(assert (=> b!110833 d!34892))

(declare-fun b!110903 () Bool)

(declare-fun res!91567 () Bool)

(declare-fun e!72784 () Bool)

(assert (=> b!110903 (=> (not res!91567) (not e!72784))))

(declare-fun lt!167948 () tuple2!9236)

(assert (=> b!110903 (= res!91567 (isPrefixOf!0 (_1!4875 lt!167948) thiss!1305))))

(declare-fun lt!167931 () (_ BitVec 64))

(declare-fun lt!167938 () (_ BitVec 64))

(declare-fun b!110905 () Bool)

(assert (=> b!110905 (= e!72784 (= (_1!4875 lt!167948) (withMovedBitIndex!0 (_2!4875 lt!167948) (bvsub lt!167938 lt!167931))))))

(assert (=> b!110905 (or (= (bvand lt!167938 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!167931 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!167938 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!167938 lt!167931) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!110905 (= lt!167931 (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!167766))) (currentByte!5267 (_2!4873 lt!167766)) (currentBit!5262 (_2!4873 lt!167766))))))

(assert (=> b!110905 (= lt!167938 (bitIndex!0 (size!2313 (buf!2710 thiss!1305)) (currentByte!5267 thiss!1305) (currentBit!5262 thiss!1305)))))

(declare-fun b!110906 () Bool)

(declare-fun e!72783 () Unit!6794)

(declare-fun lt!167939 () Unit!6794)

(assert (=> b!110906 (= e!72783 lt!167939)))

(declare-fun lt!167929 () (_ BitVec 64))

(assert (=> b!110906 (= lt!167929 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!167945 () (_ BitVec 64))

(assert (=> b!110906 (= lt!167945 (bitIndex!0 (size!2313 (buf!2710 thiss!1305)) (currentByte!5267 thiss!1305) (currentBit!5262 thiss!1305)))))

(assert (=> b!110906 (= lt!167939 (arrayBitRangesEqSymmetric!0 (buf!2710 thiss!1305) (buf!2710 (_2!4873 lt!167766)) lt!167929 lt!167945))))

(assert (=> b!110906 (arrayBitRangesEq!0 (buf!2710 (_2!4873 lt!167766)) (buf!2710 thiss!1305) lt!167929 lt!167945)))

(declare-fun b!110907 () Bool)

(declare-fun res!91569 () Bool)

(assert (=> b!110907 (=> (not res!91569) (not e!72784))))

(assert (=> b!110907 (= res!91569 (isPrefixOf!0 (_2!4875 lt!167948) (_2!4873 lt!167766)))))

(declare-fun d!34894 () Bool)

(assert (=> d!34894 e!72784))

(declare-fun res!91568 () Bool)

(assert (=> d!34894 (=> (not res!91568) (not e!72784))))

(assert (=> d!34894 (= res!91568 (isPrefixOf!0 (_1!4875 lt!167948) (_2!4875 lt!167948)))))

(declare-fun lt!167937 () BitStream!4100)

(assert (=> d!34894 (= lt!167948 (tuple2!9237 lt!167937 (_2!4873 lt!167766)))))

(declare-fun lt!167943 () Unit!6794)

(declare-fun lt!167930 () Unit!6794)

(assert (=> d!34894 (= lt!167943 lt!167930)))

(assert (=> d!34894 (isPrefixOf!0 lt!167937 (_2!4873 lt!167766))))

(assert (=> d!34894 (= lt!167930 (lemmaIsPrefixTransitive!0 lt!167937 (_2!4873 lt!167766) (_2!4873 lt!167766)))))

(declare-fun lt!167942 () Unit!6794)

(declare-fun lt!167940 () Unit!6794)

(assert (=> d!34894 (= lt!167942 lt!167940)))

(assert (=> d!34894 (isPrefixOf!0 lt!167937 (_2!4873 lt!167766))))

(assert (=> d!34894 (= lt!167940 (lemmaIsPrefixTransitive!0 lt!167937 thiss!1305 (_2!4873 lt!167766)))))

(declare-fun lt!167933 () Unit!6794)

(assert (=> d!34894 (= lt!167933 e!72783)))

(declare-fun c!6732 () Bool)

(assert (=> d!34894 (= c!6732 (not (= (size!2313 (buf!2710 thiss!1305)) #b00000000000000000000000000000000)))))

(declare-fun lt!167947 () Unit!6794)

(declare-fun lt!167941 () Unit!6794)

(assert (=> d!34894 (= lt!167947 lt!167941)))

(assert (=> d!34894 (isPrefixOf!0 (_2!4873 lt!167766) (_2!4873 lt!167766))))

(assert (=> d!34894 (= lt!167941 (lemmaIsPrefixRefl!0 (_2!4873 lt!167766)))))

(declare-fun lt!167935 () Unit!6794)

(declare-fun lt!167944 () Unit!6794)

(assert (=> d!34894 (= lt!167935 lt!167944)))

(assert (=> d!34894 (= lt!167944 (lemmaIsPrefixRefl!0 (_2!4873 lt!167766)))))

(declare-fun lt!167932 () Unit!6794)

(declare-fun lt!167936 () Unit!6794)

(assert (=> d!34894 (= lt!167932 lt!167936)))

(assert (=> d!34894 (isPrefixOf!0 lt!167937 lt!167937)))

(assert (=> d!34894 (= lt!167936 (lemmaIsPrefixRefl!0 lt!167937))))

(declare-fun lt!167934 () Unit!6794)

(declare-fun lt!167946 () Unit!6794)

(assert (=> d!34894 (= lt!167934 lt!167946)))

(assert (=> d!34894 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!34894 (= lt!167946 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (=> d!34894 (= lt!167937 (BitStream!4101 (buf!2710 (_2!4873 lt!167766)) (currentByte!5267 thiss!1305) (currentBit!5262 thiss!1305)))))

(assert (=> d!34894 (isPrefixOf!0 thiss!1305 (_2!4873 lt!167766))))

(assert (=> d!34894 (= (reader!0 thiss!1305 (_2!4873 lt!167766)) lt!167948)))

(declare-fun b!110904 () Bool)

(declare-fun Unit!6799 () Unit!6794)

(assert (=> b!110904 (= e!72783 Unit!6799)))

(assert (= (and d!34894 c!6732) b!110906))

(assert (= (and d!34894 (not c!6732)) b!110904))

(assert (= (and d!34894 res!91568) b!110903))

(assert (= (and b!110903 res!91567) b!110907))

(assert (= (and b!110907 res!91569) b!110905))

(declare-fun m!164635 () Bool)

(assert (=> b!110907 m!164635))

(declare-fun m!164637 () Bool)

(assert (=> b!110905 m!164637))

(assert (=> b!110905 m!164583))

(assert (=> b!110905 m!164519))

(declare-fun m!164639 () Bool)

(assert (=> b!110903 m!164639))

(declare-fun m!164641 () Bool)

(assert (=> d!34894 m!164641))

(declare-fun m!164643 () Bool)

(assert (=> d!34894 m!164643))

(declare-fun m!164645 () Bool)

(assert (=> d!34894 m!164645))

(declare-fun m!164647 () Bool)

(assert (=> d!34894 m!164647))

(declare-fun m!164649 () Bool)

(assert (=> d!34894 m!164649))

(assert (=> d!34894 m!164597))

(declare-fun m!164651 () Bool)

(assert (=> d!34894 m!164651))

(assert (=> d!34894 m!164497))

(declare-fun m!164653 () Bool)

(assert (=> d!34894 m!164653))

(declare-fun m!164655 () Bool)

(assert (=> d!34894 m!164655))

(assert (=> d!34894 m!164607))

(assert (=> b!110906 m!164519))

(declare-fun m!164657 () Bool)

(assert (=> b!110906 m!164657))

(declare-fun m!164659 () Bool)

(assert (=> b!110906 m!164659))

(assert (=> b!110833 d!34894))

(declare-fun d!34896 () Bool)

(declare-fun res!91572 () Bool)

(declare-fun e!72786 () Bool)

(assert (=> d!34896 (=> (not res!91572) (not e!72786))))

(assert (=> d!34896 (= res!91572 (= (size!2313 (buf!2710 thiss!1305)) (size!2313 (buf!2710 (_2!4873 lt!167766)))))))

(assert (=> d!34896 (= (isPrefixOf!0 thiss!1305 (_2!4873 lt!167766)) e!72786)))

(declare-fun b!110908 () Bool)

(declare-fun res!91571 () Bool)

(assert (=> b!110908 (=> (not res!91571) (not e!72786))))

(assert (=> b!110908 (= res!91571 (bvsle (bitIndex!0 (size!2313 (buf!2710 thiss!1305)) (currentByte!5267 thiss!1305) (currentBit!5262 thiss!1305)) (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!167766))) (currentByte!5267 (_2!4873 lt!167766)) (currentBit!5262 (_2!4873 lt!167766)))))))

(declare-fun b!110909 () Bool)

(declare-fun e!72785 () Bool)

(assert (=> b!110909 (= e!72786 e!72785)))

(declare-fun res!91570 () Bool)

(assert (=> b!110909 (=> res!91570 e!72785)))

(assert (=> b!110909 (= res!91570 (= (size!2313 (buf!2710 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!110910 () Bool)

(assert (=> b!110910 (= e!72785 (arrayBitRangesEq!0 (buf!2710 thiss!1305) (buf!2710 (_2!4873 lt!167766)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2313 (buf!2710 thiss!1305)) (currentByte!5267 thiss!1305) (currentBit!5262 thiss!1305))))))

(assert (= (and d!34896 res!91572) b!110908))

(assert (= (and b!110908 res!91571) b!110909))

(assert (= (and b!110909 (not res!91570)) b!110910))

(assert (=> b!110908 m!164519))

(assert (=> b!110908 m!164583))

(assert (=> b!110910 m!164519))

(assert (=> b!110910 m!164519))

(declare-fun m!164661 () Bool)

(assert (=> b!110910 m!164661))

(assert (=> b!110833 d!34896))

(declare-fun d!34898 () Bool)

(declare-fun e!72787 () Bool)

(assert (=> d!34898 e!72787))

(declare-fun res!91573 () Bool)

(assert (=> d!34898 (=> (not res!91573) (not e!72787))))

(declare-fun lt!167949 () (_ BitVec 64))

(declare-fun lt!167950 () (_ BitVec 64))

(declare-fun lt!167954 () (_ BitVec 64))

(assert (=> d!34898 (= res!91573 (= lt!167950 (bvsub lt!167954 lt!167949)))))

(assert (=> d!34898 (or (= (bvand lt!167954 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!167949 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!167954 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!167954 lt!167949) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!34898 (= lt!167949 (remainingBits!0 ((_ sign_extend 32) (size!2313 (buf!2710 (_1!4874 lt!167753)))) ((_ sign_extend 32) (currentByte!5267 (_1!4874 lt!167753))) ((_ sign_extend 32) (currentBit!5262 (_1!4874 lt!167753)))))))

(declare-fun lt!167952 () (_ BitVec 64))

(declare-fun lt!167953 () (_ BitVec 64))

(assert (=> d!34898 (= lt!167954 (bvmul lt!167952 lt!167953))))

(assert (=> d!34898 (or (= lt!167952 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!167953 (bvsdiv (bvmul lt!167952 lt!167953) lt!167952)))))

(assert (=> d!34898 (= lt!167953 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!34898 (= lt!167952 ((_ sign_extend 32) (size!2313 (buf!2710 (_1!4874 lt!167753)))))))

(assert (=> d!34898 (= lt!167950 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5267 (_1!4874 lt!167753))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5262 (_1!4874 lt!167753)))))))

(assert (=> d!34898 (invariant!0 (currentBit!5262 (_1!4874 lt!167753)) (currentByte!5267 (_1!4874 lt!167753)) (size!2313 (buf!2710 (_1!4874 lt!167753))))))

(assert (=> d!34898 (= (bitIndex!0 (size!2313 (buf!2710 (_1!4874 lt!167753))) (currentByte!5267 (_1!4874 lt!167753)) (currentBit!5262 (_1!4874 lt!167753))) lt!167950)))

(declare-fun b!110911 () Bool)

(declare-fun res!91574 () Bool)

(assert (=> b!110911 (=> (not res!91574) (not e!72787))))

(assert (=> b!110911 (= res!91574 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!167950))))

(declare-fun b!110912 () Bool)

(declare-fun lt!167951 () (_ BitVec 64))

(assert (=> b!110912 (= e!72787 (bvsle lt!167950 (bvmul lt!167951 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!110912 (or (= lt!167951 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!167951 #b0000000000000000000000000000000000000000000000000000000000001000) lt!167951)))))

(assert (=> b!110912 (= lt!167951 ((_ sign_extend 32) (size!2313 (buf!2710 (_1!4874 lt!167753)))))))

(assert (= (and d!34898 res!91573) b!110911))

(assert (= (and b!110911 res!91574) b!110912))

(declare-fun m!164663 () Bool)

(assert (=> d!34898 m!164663))

(declare-fun m!164665 () Bool)

(assert (=> d!34898 m!164665))

(assert (=> b!110833 d!34898))

(declare-fun call!1389 () Bool)

(declare-fun lt!168256 () tuple2!9232)

(declare-fun lt!168259 () BitStream!4100)

(declare-fun bm!1386 () Bool)

(declare-fun c!6745 () Bool)

(assert (=> bm!1386 (= call!1389 (isPrefixOf!0 (ite c!6745 (_2!4873 lt!167769) lt!168259) (ite c!6745 (_2!4873 lt!168256) lt!168259)))))

(declare-fun b!111015 () Bool)

(declare-fun e!72850 () Bool)

(declare-fun lt!168289 () tuple2!9234)

(declare-fun lt!168284 () tuple2!9234)

(assert (=> b!111015 (= e!72850 (= (_2!4874 lt!168289) (_2!4874 lt!168284)))))

(declare-fun b!111017 () Bool)

(declare-fun e!72847 () tuple2!9232)

(declare-fun Unit!6805 () Unit!6794)

(assert (=> b!111017 (= e!72847 (tuple2!9233 Unit!6805 (_2!4873 lt!168256)))))

(declare-fun lt!168283 () Bool)

(assert (=> b!111017 (= lt!168283 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!168267 () tuple2!9232)

(assert (=> b!111017 (= lt!168267 (appendBit!0 (_2!4873 lt!167769) lt!168283))))

(declare-fun res!91657 () Bool)

(assert (=> b!111017 (= res!91657 (= (size!2313 (buf!2710 (_2!4873 lt!167769))) (size!2313 (buf!2710 (_2!4873 lt!168267)))))))

(declare-fun e!72845 () Bool)

(assert (=> b!111017 (=> (not res!91657) (not e!72845))))

(assert (=> b!111017 e!72845))

(declare-fun lt!168246 () tuple2!9232)

(assert (=> b!111017 (= lt!168246 lt!168267)))

(assert (=> b!111017 (= lt!168256 (appendNLeastSignificantBitsLoop!0 (_2!4873 lt!168246) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!168261 () Unit!6794)

(assert (=> b!111017 (= lt!168261 (lemmaIsPrefixTransitive!0 (_2!4873 lt!167769) (_2!4873 lt!168246) (_2!4873 lt!168256)))))

(assert (=> b!111017 call!1389))

(declare-fun lt!168255 () Unit!6794)

(assert (=> b!111017 (= lt!168255 lt!168261)))

(assert (=> b!111017 (invariant!0 (currentBit!5262 (_2!4873 lt!167769)) (currentByte!5267 (_2!4873 lt!167769)) (size!2313 (buf!2710 (_2!4873 lt!168246))))))

(declare-fun lt!168290 () BitStream!4100)

(assert (=> b!111017 (= lt!168290 (BitStream!4101 (buf!2710 (_2!4873 lt!168246)) (currentByte!5267 (_2!4873 lt!167769)) (currentBit!5262 (_2!4873 lt!167769))))))

(assert (=> b!111017 (invariant!0 (currentBit!5262 lt!168290) (currentByte!5267 lt!168290) (size!2313 (buf!2710 (_2!4873 lt!168256))))))

(declare-fun lt!168260 () BitStream!4100)

(assert (=> b!111017 (= lt!168260 (BitStream!4101 (buf!2710 (_2!4873 lt!168256)) (currentByte!5267 lt!168290) (currentBit!5262 lt!168290)))))

(assert (=> b!111017 (= lt!168289 (readBitPure!0 lt!168290))))

(assert (=> b!111017 (= lt!168284 (readBitPure!0 lt!168260))))

(declare-fun lt!168251 () Unit!6794)

(assert (=> b!111017 (= lt!168251 (readBitPrefixLemma!0 lt!168290 (_2!4873 lt!168256)))))

(declare-fun res!91656 () Bool)

(assert (=> b!111017 (= res!91656 (= (bitIndex!0 (size!2313 (buf!2710 (_1!4874 lt!168289))) (currentByte!5267 (_1!4874 lt!168289)) (currentBit!5262 (_1!4874 lt!168289))) (bitIndex!0 (size!2313 (buf!2710 (_1!4874 lt!168284))) (currentByte!5267 (_1!4874 lt!168284)) (currentBit!5262 (_1!4874 lt!168284)))))))

(assert (=> b!111017 (=> (not res!91656) (not e!72850))))

(assert (=> b!111017 e!72850))

(declare-fun lt!168269 () Unit!6794)

(assert (=> b!111017 (= lt!168269 lt!168251)))

(declare-fun lt!168247 () tuple2!9236)

(assert (=> b!111017 (= lt!168247 (reader!0 (_2!4873 lt!167769) (_2!4873 lt!168256)))))

(declare-fun lt!168262 () tuple2!9236)

(assert (=> b!111017 (= lt!168262 (reader!0 (_2!4873 lt!168246) (_2!4873 lt!168256)))))

(declare-fun lt!168281 () tuple2!9234)

(assert (=> b!111017 (= lt!168281 (readBitPure!0 (_1!4875 lt!168247)))))

(assert (=> b!111017 (= (_2!4874 lt!168281) lt!168283)))

(declare-fun lt!168265 () Unit!6794)

(declare-fun Unit!6807 () Unit!6794)

(assert (=> b!111017 (= lt!168265 Unit!6807)))

(declare-fun lt!168266 () (_ BitVec 64))

(assert (=> b!111017 (= lt!168266 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!168280 () (_ BitVec 64))

(assert (=> b!111017 (= lt!168280 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!168250 () Unit!6794)

(assert (=> b!111017 (= lt!168250 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4873 lt!167769) (buf!2710 (_2!4873 lt!168256)) lt!168280))))

(assert (=> b!111017 (validate_offset_bits!1 ((_ sign_extend 32) (size!2313 (buf!2710 (_2!4873 lt!168256)))) ((_ sign_extend 32) (currentByte!5267 (_2!4873 lt!167769))) ((_ sign_extend 32) (currentBit!5262 (_2!4873 lt!167769))) lt!168280)))

(declare-fun lt!168253 () Unit!6794)

(assert (=> b!111017 (= lt!168253 lt!168250)))

(declare-fun lt!168270 () tuple2!9238)

(assert (=> b!111017 (= lt!168270 (readNLeastSignificantBitsLoopPure!0 (_1!4875 lt!168247) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!168266))))

(declare-fun lt!168248 () (_ BitVec 64))

(assert (=> b!111017 (= lt!168248 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!168287 () Unit!6794)

(assert (=> b!111017 (= lt!168287 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4873 lt!168246) (buf!2710 (_2!4873 lt!168256)) lt!168248))))

(assert (=> b!111017 (validate_offset_bits!1 ((_ sign_extend 32) (size!2313 (buf!2710 (_2!4873 lt!168256)))) ((_ sign_extend 32) (currentByte!5267 (_2!4873 lt!168246))) ((_ sign_extend 32) (currentBit!5262 (_2!4873 lt!168246))) lt!168248)))

(declare-fun lt!168254 () Unit!6794)

(assert (=> b!111017 (= lt!168254 lt!168287)))

(declare-fun lt!168285 () tuple2!9238)

(assert (=> b!111017 (= lt!168285 (readNLeastSignificantBitsLoopPure!0 (_1!4875 lt!168262) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!168266 (ite (_2!4874 lt!168281) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!168288 () tuple2!9238)

(assert (=> b!111017 (= lt!168288 (readNLeastSignificantBitsLoopPure!0 (_1!4875 lt!168247) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!168266))))

(declare-fun c!6744 () Bool)

(assert (=> b!111017 (= c!6744 (_2!4874 (readBitPure!0 (_1!4875 lt!168247))))))

(declare-fun e!72848 () (_ BitVec 64))

(declare-fun lt!168257 () tuple2!9238)

(assert (=> b!111017 (= lt!168257 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4875 lt!168247) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!168266 e!72848)))))

(declare-fun lt!168268 () Unit!6794)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4100 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6794)

(assert (=> b!111017 (= lt!168268 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4875 lt!168247) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!168266))))

(assert (=> b!111017 (and (= (_2!4876 lt!168288) (_2!4876 lt!168257)) (= (_1!4876 lt!168288) (_1!4876 lt!168257)))))

(declare-fun lt!168252 () Unit!6794)

(assert (=> b!111017 (= lt!168252 lt!168268)))

(assert (=> b!111017 (= (_1!4875 lt!168247) (withMovedBitIndex!0 (_2!4875 lt!168247) (bvsub (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!167769))) (currentByte!5267 (_2!4873 lt!167769)) (currentBit!5262 (_2!4873 lt!167769))) (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!168256))) (currentByte!5267 (_2!4873 lt!168256)) (currentBit!5262 (_2!4873 lt!168256))))))))

(declare-fun lt!168258 () Unit!6794)

(declare-fun Unit!6808 () Unit!6794)

(assert (=> b!111017 (= lt!168258 Unit!6808)))

(assert (=> b!111017 (= (_1!4875 lt!168262) (withMovedBitIndex!0 (_2!4875 lt!168262) (bvsub (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!168246))) (currentByte!5267 (_2!4873 lt!168246)) (currentBit!5262 (_2!4873 lt!168246))) (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!168256))) (currentByte!5267 (_2!4873 lt!168256)) (currentBit!5262 (_2!4873 lt!168256))))))))

(declare-fun lt!168249 () Unit!6794)

(declare-fun Unit!6809 () Unit!6794)

(assert (=> b!111017 (= lt!168249 Unit!6809)))

(assert (=> b!111017 (= (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!167769))) (currentByte!5267 (_2!4873 lt!167769)) (currentBit!5262 (_2!4873 lt!167769))) (bvsub (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!168246))) (currentByte!5267 (_2!4873 lt!168246)) (currentBit!5262 (_2!4873 lt!168246))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!168277 () Unit!6794)

(declare-fun Unit!6810 () Unit!6794)

(assert (=> b!111017 (= lt!168277 Unit!6810)))

(assert (=> b!111017 (= (_2!4876 lt!168270) (_2!4876 lt!168285))))

(declare-fun lt!168271 () Unit!6794)

(declare-fun Unit!6811 () Unit!6794)

(assert (=> b!111017 (= lt!168271 Unit!6811)))

(assert (=> b!111017 (= (_1!4876 lt!168270) (_2!4875 lt!168247))))

(declare-fun b!111018 () Bool)

(assert (=> b!111018 (= e!72848 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun b!111019 () Bool)

(declare-fun lt!168276 () tuple2!9234)

(assert (=> b!111019 (= lt!168276 (readBitPure!0 (readerFrom!0 (_2!4873 lt!168267) (currentBit!5262 (_2!4873 lt!167769)) (currentByte!5267 (_2!4873 lt!167769)))))))

(declare-fun res!91662 () Bool)

(assert (=> b!111019 (= res!91662 (and (= (_2!4874 lt!168276) lt!168283) (= (_1!4874 lt!168276) (_2!4873 lt!168267))))))

(declare-fun e!72849 () Bool)

(assert (=> b!111019 (=> (not res!91662) (not e!72849))))

(assert (=> b!111019 (= e!72845 e!72849)))

(declare-fun b!111020 () Bool)

(assert (=> b!111020 (= e!72849 (= (bitIndex!0 (size!2313 (buf!2710 (_1!4874 lt!168276))) (currentByte!5267 (_1!4874 lt!168276)) (currentBit!5262 (_1!4874 lt!168276))) (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!168267))) (currentByte!5267 (_2!4873 lt!168267)) (currentBit!5262 (_2!4873 lt!168267)))))))

(declare-fun b!111021 () Bool)

(declare-fun res!91663 () Bool)

(declare-fun e!72846 () Bool)

(assert (=> b!111021 (=> (not res!91663) (not e!72846))))

(declare-fun lt!168263 () tuple2!9232)

(declare-fun lt!168279 () (_ BitVec 64))

(declare-fun lt!168273 () (_ BitVec 64))

(assert (=> b!111021 (= res!91663 (= (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!168263))) (currentByte!5267 (_2!4873 lt!168263)) (currentBit!5262 (_2!4873 lt!168263))) (bvadd lt!168279 lt!168273)))))

(assert (=> b!111021 (or (not (= (bvand lt!168279 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!168273 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!168279 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!168279 lt!168273) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!111021 (= lt!168273 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!111021 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!111021 (= lt!168279 (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!167769))) (currentByte!5267 (_2!4873 lt!167769)) (currentBit!5262 (_2!4873 lt!167769))))))

(declare-fun b!111022 () Bool)

(declare-fun lt!168286 () Unit!6794)

(assert (=> b!111022 (= e!72847 (tuple2!9233 lt!168286 (_2!4873 lt!167769)))))

(assert (=> b!111022 (= lt!168259 (_2!4873 lt!167769))))

(assert (=> b!111022 (= lt!168286 (lemmaIsPrefixRefl!0 lt!168259))))

(assert (=> b!111022 call!1389))

(declare-fun b!111023 () Bool)

(declare-fun res!91661 () Bool)

(assert (=> b!111023 (= res!91661 (isPrefixOf!0 (_2!4873 lt!167769) (_2!4873 lt!168267)))))

(assert (=> b!111023 (=> (not res!91661) (not e!72845))))

(declare-fun b!111024 () Bool)

(declare-fun e!72844 () Bool)

(declare-fun lt!168272 () (_ BitVec 64))

(assert (=> b!111024 (= e!72844 (validate_offset_bits!1 ((_ sign_extend 32) (size!2313 (buf!2710 (_2!4873 lt!167769)))) ((_ sign_extend 32) (currentByte!5267 (_2!4873 lt!167769))) ((_ sign_extend 32) (currentBit!5262 (_2!4873 lt!167769))) lt!168272))))

(declare-fun b!111025 () Bool)

(declare-fun lt!168278 () tuple2!9238)

(declare-fun lt!168282 () tuple2!9236)

(assert (=> b!111025 (= e!72846 (and (= (_2!4876 lt!168278) v!199) (= (_1!4876 lt!168278) (_2!4875 lt!168282))))))

(declare-fun lt!168275 () (_ BitVec 64))

(assert (=> b!111025 (= lt!168278 (readNLeastSignificantBitsLoopPure!0 (_1!4875 lt!168282) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!168275))))

(declare-fun lt!168264 () Unit!6794)

(declare-fun lt!168274 () Unit!6794)

(assert (=> b!111025 (= lt!168264 lt!168274)))

(assert (=> b!111025 (validate_offset_bits!1 ((_ sign_extend 32) (size!2313 (buf!2710 (_2!4873 lt!168263)))) ((_ sign_extend 32) (currentByte!5267 (_2!4873 lt!167769))) ((_ sign_extend 32) (currentBit!5262 (_2!4873 lt!167769))) lt!168272)))

(assert (=> b!111025 (= lt!168274 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4873 lt!167769) (buf!2710 (_2!4873 lt!168263)) lt!168272))))

(assert (=> b!111025 e!72844))

(declare-fun res!91658 () Bool)

(assert (=> b!111025 (=> (not res!91658) (not e!72844))))

(assert (=> b!111025 (= res!91658 (and (= (size!2313 (buf!2710 (_2!4873 lt!167769))) (size!2313 (buf!2710 (_2!4873 lt!168263)))) (bvsge lt!168272 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!111025 (= lt!168272 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!111025 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!111025 (= lt!168275 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!111025 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!111025 (= lt!168282 (reader!0 (_2!4873 lt!167769) (_2!4873 lt!168263)))))

(declare-fun b!111026 () Bool)

(declare-fun res!91660 () Bool)

(assert (=> b!111026 (=> (not res!91660) (not e!72846))))

(assert (=> b!111026 (= res!91660 (isPrefixOf!0 (_2!4873 lt!167769) (_2!4873 lt!168263)))))

(declare-fun b!111027 () Bool)

(declare-fun res!91659 () Bool)

(assert (=> b!111027 (= res!91659 (= (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!168267))) (currentByte!5267 (_2!4873 lt!168267)) (currentBit!5262 (_2!4873 lt!168267))) (bvadd (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!167769))) (currentByte!5267 (_2!4873 lt!167769)) (currentBit!5262 (_2!4873 lt!167769))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!111027 (=> (not res!91659) (not e!72845))))

(declare-fun d!34900 () Bool)

(assert (=> d!34900 e!72846))

(declare-fun res!91655 () Bool)

(assert (=> d!34900 (=> (not res!91655) (not e!72846))))

(assert (=> d!34900 (= res!91655 (= (size!2313 (buf!2710 (_2!4873 lt!167769))) (size!2313 (buf!2710 (_2!4873 lt!168263)))))))

(assert (=> d!34900 (= lt!168263 e!72847)))

(assert (=> d!34900 (= c!6745 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!34900 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!34900 (= (appendNLeastSignificantBitsLoop!0 (_2!4873 lt!167769) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!168263)))

(declare-fun b!111016 () Bool)

(assert (=> b!111016 (= e!72848 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (= (and d!34900 c!6745) b!111017))

(assert (= (and d!34900 (not c!6745)) b!111022))

(assert (= (and b!111017 res!91657) b!111027))

(assert (= (and b!111027 res!91659) b!111023))

(assert (= (and b!111023 res!91661) b!111019))

(assert (= (and b!111019 res!91662) b!111020))

(assert (= (and b!111017 res!91656) b!111015))

(assert (= (and b!111017 c!6744) b!111018))

(assert (= (and b!111017 (not c!6744)) b!111016))

(assert (= (or b!111017 b!111022) bm!1386))

(assert (= (and d!34900 res!91655) b!111021))

(assert (= (and b!111021 res!91663) b!111026))

(assert (= (and b!111026 res!91660) b!111025))

(assert (= (and b!111025 res!91658) b!111024))

(declare-fun m!164749 () Bool)

(assert (=> b!111024 m!164749))

(declare-fun m!164751 () Bool)

(assert (=> b!111020 m!164751))

(declare-fun m!164753 () Bool)

(assert (=> b!111020 m!164753))

(declare-fun m!164755 () Bool)

(assert (=> b!111025 m!164755))

(declare-fun m!164757 () Bool)

(assert (=> b!111025 m!164757))

(declare-fun m!164759 () Bool)

(assert (=> b!111025 m!164759))

(declare-fun m!164761 () Bool)

(assert (=> b!111025 m!164761))

(declare-fun m!164763 () Bool)

(assert (=> b!111025 m!164763))

(assert (=> b!111027 m!164753))

(assert (=> b!111027 m!164517))

(declare-fun m!164765 () Bool)

(assert (=> b!111026 m!164765))

(declare-fun m!164767 () Bool)

(assert (=> b!111017 m!164767))

(declare-fun m!164769 () Bool)

(assert (=> b!111017 m!164769))

(declare-fun m!164771 () Bool)

(assert (=> b!111017 m!164771))

(declare-fun m!164773 () Bool)

(assert (=> b!111017 m!164773))

(declare-fun m!164775 () Bool)

(assert (=> b!111017 m!164775))

(declare-fun m!164777 () Bool)

(assert (=> b!111017 m!164777))

(declare-fun m!164779 () Bool)

(assert (=> b!111017 m!164779))

(declare-fun m!164781 () Bool)

(assert (=> b!111017 m!164781))

(declare-fun m!164783 () Bool)

(assert (=> b!111017 m!164783))

(assert (=> b!111017 m!164783))

(declare-fun m!164785 () Bool)

(assert (=> b!111017 m!164785))

(declare-fun m!164787 () Bool)

(assert (=> b!111017 m!164787))

(declare-fun m!164789 () Bool)

(assert (=> b!111017 m!164789))

(declare-fun m!164791 () Bool)

(assert (=> b!111017 m!164791))

(assert (=> b!111017 m!164755))

(declare-fun m!164793 () Bool)

(assert (=> b!111017 m!164793))

(declare-fun m!164795 () Bool)

(assert (=> b!111017 m!164795))

(declare-fun m!164797 () Bool)

(assert (=> b!111017 m!164797))

(declare-fun m!164799 () Bool)

(assert (=> b!111017 m!164799))

(declare-fun m!164801 () Bool)

(assert (=> b!111017 m!164801))

(declare-fun m!164803 () Bool)

(assert (=> b!111017 m!164803))

(declare-fun m!164805 () Bool)

(assert (=> b!111017 m!164805))

(declare-fun m!164807 () Bool)

(assert (=> b!111017 m!164807))

(declare-fun m!164809 () Bool)

(assert (=> b!111017 m!164809))

(declare-fun m!164811 () Bool)

(assert (=> b!111017 m!164811))

(declare-fun m!164813 () Bool)

(assert (=> b!111017 m!164813))

(declare-fun m!164815 () Bool)

(assert (=> b!111017 m!164815))

(declare-fun m!164817 () Bool)

(assert (=> b!111017 m!164817))

(assert (=> b!111017 m!164517))

(declare-fun m!164819 () Bool)

(assert (=> b!111021 m!164819))

(assert (=> b!111021 m!164517))

(declare-fun m!164821 () Bool)

(assert (=> b!111019 m!164821))

(assert (=> b!111019 m!164821))

(declare-fun m!164823 () Bool)

(assert (=> b!111019 m!164823))

(declare-fun m!164825 () Bool)

(assert (=> b!111022 m!164825))

(declare-fun m!164827 () Bool)

(assert (=> bm!1386 m!164827))

(declare-fun m!164829 () Bool)

(assert (=> b!111023 m!164829))

(assert (=> b!110833 d!34900))

(declare-fun d!34942 () Bool)

(declare-fun lt!168307 () tuple2!9246)

(assert (=> d!34942 (= lt!168307 (readNLeastSignificantBitsLoop!0 (_1!4875 lt!167765) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) (bvor lt!167763 (ite (_2!4874 lt!167754) lt!167756 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!34942 (= (readNLeastSignificantBitsLoopPure!0 (_1!4875 lt!167765) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) (bvor lt!167763 (ite (_2!4874 lt!167754) lt!167756 #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!9239 (_2!4880 lt!168307) (_1!4880 lt!168307)))))

(declare-fun bs!8565 () Bool)

(assert (= bs!8565 d!34942))

(declare-fun m!164831 () Bool)

(assert (=> bs!8565 m!164831))

(assert (=> b!110833 d!34942))

(declare-fun b!111067 () Bool)

(declare-fun e!72868 () Bool)

(declare-fun e!72869 () Bool)

(assert (=> b!111067 (= e!72868 e!72869)))

(declare-fun res!91695 () Bool)

(assert (=> b!111067 (=> (not res!91695) (not e!72869))))

(declare-fun lt!168384 () tuple2!9232)

(declare-fun lt!168385 () tuple2!9234)

(assert (=> b!111067 (= res!91695 (and (= (_2!4874 lt!168385) lt!167762) (= (_1!4874 lt!168385) (_2!4873 lt!168384))))))

(assert (=> b!111067 (= lt!168385 (readBitPure!0 (readerFrom!0 (_2!4873 lt!168384) (currentBit!5262 thiss!1305) (currentByte!5267 thiss!1305))))))

(declare-fun d!34944 () Bool)

(assert (=> d!34944 e!72868))

(declare-fun res!91692 () Bool)

(assert (=> d!34944 (=> (not res!91692) (not e!72868))))

(assert (=> d!34944 (= res!91692 (= (size!2313 (buf!2710 thiss!1305)) (size!2313 (buf!2710 (_2!4873 lt!168384)))))))

(declare-fun choose!16 (BitStream!4100 Bool) tuple2!9232)

(assert (=> d!34944 (= lt!168384 (choose!16 thiss!1305 lt!167762))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!34944 (validate_offset_bit!0 ((_ sign_extend 32) (size!2313 (buf!2710 thiss!1305))) ((_ sign_extend 32) (currentByte!5267 thiss!1305)) ((_ sign_extend 32) (currentBit!5262 thiss!1305)))))

(assert (=> d!34944 (= (appendBit!0 thiss!1305 lt!167762) lt!168384)))

(declare-fun b!111065 () Bool)

(declare-fun res!91693 () Bool)

(assert (=> b!111065 (=> (not res!91693) (not e!72868))))

(declare-fun lt!168386 () (_ BitVec 64))

(declare-fun lt!168387 () (_ BitVec 64))

(assert (=> b!111065 (= res!91693 (= (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!168384))) (currentByte!5267 (_2!4873 lt!168384)) (currentBit!5262 (_2!4873 lt!168384))) (bvadd lt!168386 lt!168387)))))

(assert (=> b!111065 (or (not (= (bvand lt!168386 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!168387 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!168386 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!168386 lt!168387) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!111065 (= lt!168387 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!111065 (= lt!168386 (bitIndex!0 (size!2313 (buf!2710 thiss!1305)) (currentByte!5267 thiss!1305) (currentBit!5262 thiss!1305)))))

(declare-fun b!111066 () Bool)

(declare-fun res!91694 () Bool)

(assert (=> b!111066 (=> (not res!91694) (not e!72868))))

(assert (=> b!111066 (= res!91694 (isPrefixOf!0 thiss!1305 (_2!4873 lt!168384)))))

(declare-fun b!111068 () Bool)

(assert (=> b!111068 (= e!72869 (= (bitIndex!0 (size!2313 (buf!2710 (_1!4874 lt!168385))) (currentByte!5267 (_1!4874 lt!168385)) (currentBit!5262 (_1!4874 lt!168385))) (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!168384))) (currentByte!5267 (_2!4873 lt!168384)) (currentBit!5262 (_2!4873 lt!168384)))))))

(assert (= (and d!34944 res!91692) b!111065))

(assert (= (and b!111065 res!91693) b!111066))

(assert (= (and b!111066 res!91694) b!111067))

(assert (= (and b!111067 res!91695) b!111068))

(declare-fun m!164951 () Bool)

(assert (=> d!34944 m!164951))

(declare-fun m!164953 () Bool)

(assert (=> d!34944 m!164953))

(declare-fun m!164955 () Bool)

(assert (=> b!111066 m!164955))

(declare-fun m!164957 () Bool)

(assert (=> b!111067 m!164957))

(assert (=> b!111067 m!164957))

(declare-fun m!164959 () Bool)

(assert (=> b!111067 m!164959))

(declare-fun m!164961 () Bool)

(assert (=> b!111068 m!164961))

(declare-fun m!164963 () Bool)

(assert (=> b!111068 m!164963))

(assert (=> b!111065 m!164963))

(assert (=> b!111065 m!164519))

(assert (=> b!110833 d!34944))

(declare-fun d!34960 () Bool)

(declare-fun e!72877 () Bool)

(assert (=> d!34960 e!72877))

(declare-fun res!91706 () Bool)

(assert (=> d!34960 (=> (not res!91706) (not e!72877))))

(declare-fun lt!168407 () (_ BitVec 64))

(declare-fun lt!168402 () (_ BitVec 64))

(declare-fun lt!168403 () (_ BitVec 64))

(assert (=> d!34960 (= res!91706 (= lt!168403 (bvsub lt!168407 lt!168402)))))

(assert (=> d!34960 (or (= (bvand lt!168407 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!168402 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!168407 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!168407 lt!168402) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!34960 (= lt!168402 (remainingBits!0 ((_ sign_extend 32) (size!2313 (buf!2710 (_2!4873 lt!167769)))) ((_ sign_extend 32) (currentByte!5267 (_2!4873 lt!167769))) ((_ sign_extend 32) (currentBit!5262 (_2!4873 lt!167769)))))))

(declare-fun lt!168405 () (_ BitVec 64))

(declare-fun lt!168406 () (_ BitVec 64))

(assert (=> d!34960 (= lt!168407 (bvmul lt!168405 lt!168406))))

(assert (=> d!34960 (or (= lt!168405 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!168406 (bvsdiv (bvmul lt!168405 lt!168406) lt!168405)))))

(assert (=> d!34960 (= lt!168406 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!34960 (= lt!168405 ((_ sign_extend 32) (size!2313 (buf!2710 (_2!4873 lt!167769)))))))

(assert (=> d!34960 (= lt!168403 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5267 (_2!4873 lt!167769))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5262 (_2!4873 lt!167769)))))))

(assert (=> d!34960 (invariant!0 (currentBit!5262 (_2!4873 lt!167769)) (currentByte!5267 (_2!4873 lt!167769)) (size!2313 (buf!2710 (_2!4873 lt!167769))))))

(assert (=> d!34960 (= (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!167769))) (currentByte!5267 (_2!4873 lt!167769)) (currentBit!5262 (_2!4873 lt!167769))) lt!168403)))

(declare-fun b!111079 () Bool)

(declare-fun res!91707 () Bool)

(assert (=> b!111079 (=> (not res!91707) (not e!72877))))

(assert (=> b!111079 (= res!91707 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!168403))))

(declare-fun b!111080 () Bool)

(declare-fun lt!168404 () (_ BitVec 64))

(assert (=> b!111080 (= e!72877 (bvsle lt!168403 (bvmul lt!168404 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!111080 (or (= lt!168404 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!168404 #b0000000000000000000000000000000000000000000000000000000000001000) lt!168404)))))

(assert (=> b!111080 (= lt!168404 ((_ sign_extend 32) (size!2313 (buf!2710 (_2!4873 lt!167769)))))))

(assert (= (and d!34960 res!91706) b!111079))

(assert (= (and b!111079 res!91707) b!111080))

(declare-fun m!164965 () Bool)

(assert (=> d!34960 m!164965))

(assert (=> d!34960 m!164537))

(assert (=> b!110834 d!34960))

(declare-fun d!34962 () Bool)

(declare-fun e!72878 () Bool)

(assert (=> d!34962 e!72878))

(declare-fun res!91708 () Bool)

(assert (=> d!34962 (=> (not res!91708) (not e!72878))))

(declare-fun lt!168408 () (_ BitVec 64))

(declare-fun lt!168413 () (_ BitVec 64))

(declare-fun lt!168409 () (_ BitVec 64))

(assert (=> d!34962 (= res!91708 (= lt!168409 (bvsub lt!168413 lt!168408)))))

(assert (=> d!34962 (or (= (bvand lt!168413 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!168408 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!168413 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!168413 lt!168408) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!34962 (= lt!168408 (remainingBits!0 ((_ sign_extend 32) (size!2313 (buf!2710 thiss!1305))) ((_ sign_extend 32) (currentByte!5267 thiss!1305)) ((_ sign_extend 32) (currentBit!5262 thiss!1305))))))

(declare-fun lt!168411 () (_ BitVec 64))

(declare-fun lt!168412 () (_ BitVec 64))

(assert (=> d!34962 (= lt!168413 (bvmul lt!168411 lt!168412))))

(assert (=> d!34962 (or (= lt!168411 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!168412 (bvsdiv (bvmul lt!168411 lt!168412) lt!168411)))))

(assert (=> d!34962 (= lt!168412 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!34962 (= lt!168411 ((_ sign_extend 32) (size!2313 (buf!2710 thiss!1305))))))

(assert (=> d!34962 (= lt!168409 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5267 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5262 thiss!1305))))))

(assert (=> d!34962 (invariant!0 (currentBit!5262 thiss!1305) (currentByte!5267 thiss!1305) (size!2313 (buf!2710 thiss!1305)))))

(assert (=> d!34962 (= (bitIndex!0 (size!2313 (buf!2710 thiss!1305)) (currentByte!5267 thiss!1305) (currentBit!5262 thiss!1305)) lt!168409)))

(declare-fun b!111083 () Bool)

(declare-fun res!91709 () Bool)

(assert (=> b!111083 (=> (not res!91709) (not e!72878))))

(assert (=> b!111083 (= res!91709 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!168409))))

(declare-fun b!111084 () Bool)

(declare-fun lt!168410 () (_ BitVec 64))

(assert (=> b!111084 (= e!72878 (bvsle lt!168409 (bvmul lt!168410 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!111084 (or (= lt!168410 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!168410 #b0000000000000000000000000000000000000000000000000000000000001000) lt!168410)))))

(assert (=> b!111084 (= lt!168410 ((_ sign_extend 32) (size!2313 (buf!2710 thiss!1305))))))

(assert (= (and d!34962 res!91708) b!111083))

(assert (= (and b!111083 res!91709) b!111084))

(assert (=> d!34962 m!164533))

(assert (=> d!34962 m!164531))

(assert (=> b!110834 d!34962))

(push 1)

(assert (not b!111022))

(assert (not b!111065))

(assert (not b!110851))

(assert (not d!34844))

(assert (not b!111025))

(assert (not d!34942))

(assert (not d!34890))

(assert (not b!110860))

(assert (not b!110906))

(assert (not d!34880))

(assert (not d!34848))

(assert (not b!111021))

(assert (not bm!1386))

(assert (not b!110907))

(assert (not d!34828))

(assert (not b!111068))

(assert (not d!34846))

(assert (not d!34894))

(assert (not b!110908))

(assert (not d!34830))

(assert (not d!34842))

(assert (not d!34876))

(assert (not b!110898))

(assert (not b!111023))

(assert (not b!111017))

(assert (not d!34840))

(assert (not b!110897))

(assert (not b!110905))

(assert (not b!110849))

(assert (not d!34824))

(assert (not b!111027))

(assert (not d!34888))

(assert (not b!111019))

(assert (not b!110903))

(assert (not d!34960))

(assert (not b!111024))

(assert (not d!34944))

(assert (not b!111020))

(assert (not d!34820))

(assert (not b!110910))

(assert (not d!34892))

(assert (not b!111066))

(assert (not d!34898))

(assert (not d!34884))

(assert (not b!110896))

(assert (not b!111026))

(assert (not b!111067))

(assert (not d!34838))

(assert (not d!34962))

(assert (not b!110894))

(assert (not d!34818))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!35214 () Bool)

(assert (=> d!35214 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2313 (buf!2710 (_2!4873 lt!167769)))) ((_ sign_extend 32) (currentByte!5267 (_2!4873 lt!167769))) ((_ sign_extend 32) (currentBit!5262 (_2!4873 lt!167769))) lt!168272) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2313 (buf!2710 (_2!4873 lt!167769)))) ((_ sign_extend 32) (currentByte!5267 (_2!4873 lt!167769))) ((_ sign_extend 32) (currentBit!5262 (_2!4873 lt!167769)))) lt!168272))))

(declare-fun bs!8616 () Bool)

(assert (= bs!8616 d!35214))

(assert (=> bs!8616 m!164965))

(assert (=> b!111024 d!35214))

(declare-fun d!35216 () Bool)

(assert (=> d!35216 (= (remainingBits!0 ((_ sign_extend 32) (size!2313 (buf!2710 (_2!4873 lt!167769)))) ((_ sign_extend 32) (currentByte!5267 (_2!4873 lt!167769))) ((_ sign_extend 32) (currentBit!5262 (_2!4873 lt!167769)))) (bvsub (bvmul ((_ sign_extend 32) (size!2313 (buf!2710 (_2!4873 lt!167769)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5267 (_2!4873 lt!167769))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5262 (_2!4873 lt!167769))))))))

(assert (=> d!34960 d!35216))

(declare-fun d!35218 () Bool)

(assert (=> d!35218 (= (invariant!0 (currentBit!5262 (_2!4873 lt!167769)) (currentByte!5267 (_2!4873 lt!167769)) (size!2313 (buf!2710 (_2!4873 lt!167769)))) (and (bvsge (currentBit!5262 (_2!4873 lt!167769)) #b00000000000000000000000000000000) (bvslt (currentBit!5262 (_2!4873 lt!167769)) #b00000000000000000000000000001000) (bvsge (currentByte!5267 (_2!4873 lt!167769)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5267 (_2!4873 lt!167769)) (size!2313 (buf!2710 (_2!4873 lt!167769)))) (and (= (currentBit!5262 (_2!4873 lt!167769)) #b00000000000000000000000000000000) (= (currentByte!5267 (_2!4873 lt!167769)) (size!2313 (buf!2710 (_2!4873 lt!167769))))))))))

(assert (=> d!34960 d!35218))

(declare-fun d!35220 () Bool)

(declare-fun res!91946 () Bool)

(declare-fun e!73062 () Bool)

(assert (=> d!35220 (=> (not res!91946) (not e!73062))))

(assert (=> d!35220 (= res!91946 (= (size!2313 (buf!2710 (_2!4873 lt!167769))) (size!2313 (buf!2710 (_2!4873 lt!168263)))))))

(assert (=> d!35220 (= (isPrefixOf!0 (_2!4873 lt!167769) (_2!4873 lt!168263)) e!73062)))

(declare-fun b!111370 () Bool)

(declare-fun res!91945 () Bool)

(assert (=> b!111370 (=> (not res!91945) (not e!73062))))

(assert (=> b!111370 (= res!91945 (bvsle (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!167769))) (currentByte!5267 (_2!4873 lt!167769)) (currentBit!5262 (_2!4873 lt!167769))) (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!168263))) (currentByte!5267 (_2!4873 lt!168263)) (currentBit!5262 (_2!4873 lt!168263)))))))

(declare-fun b!111371 () Bool)

(declare-fun e!73061 () Bool)

(assert (=> b!111371 (= e!73062 e!73061)))

(declare-fun res!91944 () Bool)

(assert (=> b!111371 (=> res!91944 e!73061)))

(assert (=> b!111371 (= res!91944 (= (size!2313 (buf!2710 (_2!4873 lt!167769))) #b00000000000000000000000000000000))))

(declare-fun b!111372 () Bool)

(assert (=> b!111372 (= e!73061 (arrayBitRangesEq!0 (buf!2710 (_2!4873 lt!167769)) (buf!2710 (_2!4873 lt!168263)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!167769))) (currentByte!5267 (_2!4873 lt!167769)) (currentBit!5262 (_2!4873 lt!167769)))))))

(assert (= (and d!35220 res!91946) b!111370))

(assert (= (and b!111370 res!91945) b!111371))

(assert (= (and b!111371 (not res!91944)) b!111372))

(assert (=> b!111370 m!164517))

(assert (=> b!111370 m!164819))

(assert (=> b!111372 m!164517))

(assert (=> b!111372 m!164517))

(declare-fun m!165701 () Bool)

(assert (=> b!111372 m!165701))

(assert (=> b!111026 d!35220))

(declare-fun d!35222 () Bool)

(assert (=> d!35222 (isPrefixOf!0 lt!168259 lt!168259)))

(declare-fun lt!169023 () Unit!6794)

(declare-fun choose!11 (BitStream!4100) Unit!6794)

(assert (=> d!35222 (= lt!169023 (choose!11 lt!168259))))

(assert (=> d!35222 (= (lemmaIsPrefixRefl!0 lt!168259) lt!169023)))

(declare-fun bs!8618 () Bool)

(assert (= bs!8618 d!35222))

(declare-fun m!165703 () Bool)

(assert (=> bs!8618 m!165703))

(declare-fun m!165705 () Bool)

(assert (=> bs!8618 m!165705))

(assert (=> b!111022 d!35222))

(declare-fun d!35224 () Bool)

(assert (=> d!35224 (= (remainingBits!0 ((_ sign_extend 32) (size!2313 (buf!2710 (_2!4873 lt!167766)))) ((_ sign_extend 32) (currentByte!5267 (_2!4873 lt!167769))) ((_ sign_extend 32) (currentBit!5262 (_2!4873 lt!167769)))) (bvsub (bvmul ((_ sign_extend 32) (size!2313 (buf!2710 (_2!4873 lt!167766)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5267 (_2!4873 lt!167769))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5262 (_2!4873 lt!167769))))))))

(assert (=> d!34844 d!35224))

(assert (=> b!110897 d!34960))

(declare-fun d!35226 () Bool)

(assert (=> d!35226 (arrayBitRangesEq!0 (buf!2710 (_2!4873 lt!167766)) (buf!2710 (_2!4873 lt!167769)) lt!167884 lt!167900)))

(declare-fun lt!169026 () Unit!6794)

(declare-fun choose!8 (array!5085 array!5085 (_ BitVec 64) (_ BitVec 64)) Unit!6794)

(assert (=> d!35226 (= lt!169026 (choose!8 (buf!2710 (_2!4873 lt!167769)) (buf!2710 (_2!4873 lt!167766)) lt!167884 lt!167900))))

(assert (=> d!35226 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!167884) (bvsle lt!167884 lt!167900))))

(assert (=> d!35226 (= (arrayBitRangesEqSymmetric!0 (buf!2710 (_2!4873 lt!167769)) (buf!2710 (_2!4873 lt!167766)) lt!167884 lt!167900) lt!169026)))

(declare-fun bs!8619 () Bool)

(assert (= bs!8619 d!35226))

(assert (=> bs!8619 m!164611))

(declare-fun m!165707 () Bool)

(assert (=> bs!8619 m!165707))

(assert (=> b!110897 d!35226))

(declare-fun b!111387 () Bool)

(declare-fun res!91958 () Bool)

(declare-fun lt!169034 () (_ BitVec 32))

(assert (=> b!111387 (= res!91958 (= lt!169034 #b00000000000000000000000000000000))))

(declare-fun e!73078 () Bool)

(assert (=> b!111387 (=> res!91958 e!73078)))

(declare-fun e!73079 () Bool)

(assert (=> b!111387 (= e!73079 e!73078)))

(declare-fun b!111388 () Bool)

(declare-fun e!73080 () Bool)

(declare-fun e!73076 () Bool)

(assert (=> b!111388 (= e!73080 e!73076)))

(declare-fun c!6776 () Bool)

(declare-datatypes ((tuple4!74 0))(
  ( (tuple4!75 (_1!4884 (_ BitVec 32)) (_2!4884 (_ BitVec 32)) (_3!258 (_ BitVec 32)) (_4!37 (_ BitVec 32))) )
))
(declare-fun lt!169035 () tuple4!74)

(assert (=> b!111388 (= c!6776 (= (_3!258 lt!169035) (_4!37 lt!169035)))))

(declare-fun d!35228 () Bool)

(declare-fun res!91961 () Bool)

(declare-fun e!73075 () Bool)

(assert (=> d!35228 (=> res!91961 e!73075)))

(assert (=> d!35228 (= res!91961 (bvsge lt!167884 lt!167900))))

(assert (=> d!35228 (= (arrayBitRangesEq!0 (buf!2710 (_2!4873 lt!167766)) (buf!2710 (_2!4873 lt!167769)) lt!167884 lt!167900) e!73075)))

(declare-fun e!73077 () Bool)

(declare-fun b!111389 () Bool)

(declare-fun arrayRangesEq!38 (array!5085 array!5085 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!111389 (= e!73077 (arrayRangesEq!38 (buf!2710 (_2!4873 lt!167766)) (buf!2710 (_2!4873 lt!167769)) (_1!4884 lt!169035) (_2!4884 lt!169035)))))

(declare-fun b!111390 () Bool)

(assert (=> b!111390 (= e!73075 e!73080)))

(declare-fun res!91959 () Bool)

(assert (=> b!111390 (=> (not res!91959) (not e!73080))))

(assert (=> b!111390 (= res!91959 e!73077)))

(declare-fun res!91957 () Bool)

(assert (=> b!111390 (=> res!91957 e!73077)))

(assert (=> b!111390 (= res!91957 (bvsge (_1!4884 lt!169035) (_2!4884 lt!169035)))))

(assert (=> b!111390 (= lt!169034 ((_ extract 31 0) (bvsrem lt!167900 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!169033 () (_ BitVec 32))

(assert (=> b!111390 (= lt!169033 ((_ extract 31 0) (bvsrem lt!167884 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!74)

(assert (=> b!111390 (= lt!169035 (arrayBitIndices!0 lt!167884 lt!167900))))

(declare-fun b!111391 () Bool)

(declare-fun call!1405 () Bool)

(assert (=> b!111391 (= e!73078 call!1405)))

(declare-fun b!111392 () Bool)

(assert (=> b!111392 (= e!73076 e!73079)))

(declare-fun res!91960 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!111392 (= res!91960 (byteRangesEq!0 (select (arr!2906 (buf!2710 (_2!4873 lt!167766))) (_3!258 lt!169035)) (select (arr!2906 (buf!2710 (_2!4873 lt!167769))) (_3!258 lt!169035)) lt!169033 #b00000000000000000000000000001000))))

(assert (=> b!111392 (=> (not res!91960) (not e!73079))))

(declare-fun b!111393 () Bool)

(assert (=> b!111393 (= e!73076 call!1405)))

(declare-fun bm!1402 () Bool)

(assert (=> bm!1402 (= call!1405 (byteRangesEq!0 (ite c!6776 (select (arr!2906 (buf!2710 (_2!4873 lt!167766))) (_3!258 lt!169035)) (select (arr!2906 (buf!2710 (_2!4873 lt!167766))) (_4!37 lt!169035))) (ite c!6776 (select (arr!2906 (buf!2710 (_2!4873 lt!167769))) (_3!258 lt!169035)) (select (arr!2906 (buf!2710 (_2!4873 lt!167769))) (_4!37 lt!169035))) (ite c!6776 lt!169033 #b00000000000000000000000000000000) lt!169034))))

(assert (= (and d!35228 (not res!91961)) b!111390))

(assert (= (and b!111390 (not res!91957)) b!111389))

(assert (= (and b!111390 res!91959) b!111388))

(assert (= (and b!111388 c!6776) b!111393))

(assert (= (and b!111388 (not c!6776)) b!111392))

(assert (= (and b!111392 res!91960) b!111387))

(assert (= (and b!111387 (not res!91958)) b!111391))

(assert (= (or b!111393 b!111391) bm!1402))

(declare-fun m!165709 () Bool)

(assert (=> b!111389 m!165709))

(declare-fun m!165711 () Bool)

(assert (=> b!111390 m!165711))

(declare-fun m!165713 () Bool)

(assert (=> b!111392 m!165713))

(declare-fun m!165715 () Bool)

(assert (=> b!111392 m!165715))

(assert (=> b!111392 m!165713))

(assert (=> b!111392 m!165715))

(declare-fun m!165717 () Bool)

(assert (=> b!111392 m!165717))

(assert (=> bm!1402 m!165715))

(declare-fun m!165719 () Bool)

(assert (=> bm!1402 m!165719))

(declare-fun m!165721 () Bool)

(assert (=> bm!1402 m!165721))

(declare-fun m!165723 () Bool)

(assert (=> bm!1402 m!165723))

(assert (=> bm!1402 m!165713))

(assert (=> b!110897 d!35228))

(declare-fun d!35230 () Bool)

(declare-fun e!73081 () Bool)

(assert (=> d!35230 e!73081))

(declare-fun res!91962 () Bool)

(assert (=> d!35230 (=> (not res!91962) (not e!73081))))

(declare-fun lt!169036 () (_ BitVec 64))

(declare-fun lt!169037 () (_ BitVec 64))

(declare-fun lt!169041 () (_ BitVec 64))

(assert (=> d!35230 (= res!91962 (= lt!169037 (bvsub lt!169041 lt!169036)))))

(assert (=> d!35230 (or (= (bvand lt!169041 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!169036 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!169041 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!169041 lt!169036) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35230 (= lt!169036 (remainingBits!0 ((_ sign_extend 32) (size!2313 (buf!2710 (_1!4874 lt!168276)))) ((_ sign_extend 32) (currentByte!5267 (_1!4874 lt!168276))) ((_ sign_extend 32) (currentBit!5262 (_1!4874 lt!168276)))))))

(declare-fun lt!169039 () (_ BitVec 64))

(declare-fun lt!169040 () (_ BitVec 64))

(assert (=> d!35230 (= lt!169041 (bvmul lt!169039 lt!169040))))

(assert (=> d!35230 (or (= lt!169039 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!169040 (bvsdiv (bvmul lt!169039 lt!169040) lt!169039)))))

(assert (=> d!35230 (= lt!169040 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!35230 (= lt!169039 ((_ sign_extend 32) (size!2313 (buf!2710 (_1!4874 lt!168276)))))))

(assert (=> d!35230 (= lt!169037 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5267 (_1!4874 lt!168276))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5262 (_1!4874 lt!168276)))))))

(assert (=> d!35230 (invariant!0 (currentBit!5262 (_1!4874 lt!168276)) (currentByte!5267 (_1!4874 lt!168276)) (size!2313 (buf!2710 (_1!4874 lt!168276))))))

(assert (=> d!35230 (= (bitIndex!0 (size!2313 (buf!2710 (_1!4874 lt!168276))) (currentByte!5267 (_1!4874 lt!168276)) (currentBit!5262 (_1!4874 lt!168276))) lt!169037)))

(declare-fun b!111394 () Bool)

(declare-fun res!91963 () Bool)

(assert (=> b!111394 (=> (not res!91963) (not e!73081))))

(assert (=> b!111394 (= res!91963 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!169037))))

(declare-fun b!111395 () Bool)

(declare-fun lt!169038 () (_ BitVec 64))

(assert (=> b!111395 (= e!73081 (bvsle lt!169037 (bvmul lt!169038 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!111395 (or (= lt!169038 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!169038 #b0000000000000000000000000000000000000000000000000000000000001000) lt!169038)))))

(assert (=> b!111395 (= lt!169038 ((_ sign_extend 32) (size!2313 (buf!2710 (_1!4874 lt!168276)))))))

(assert (= (and d!35230 res!91962) b!111394))

(assert (= (and b!111394 res!91963) b!111395))

(declare-fun m!165725 () Bool)

(assert (=> d!35230 m!165725))

(declare-fun m!165727 () Bool)

(assert (=> d!35230 m!165727))

(assert (=> b!111020 d!35230))

(declare-fun d!35232 () Bool)

(declare-fun e!73082 () Bool)

(assert (=> d!35232 e!73082))

(declare-fun res!91964 () Bool)

(assert (=> d!35232 (=> (not res!91964) (not e!73082))))

(declare-fun lt!169042 () (_ BitVec 64))

(declare-fun lt!169043 () (_ BitVec 64))

(declare-fun lt!169047 () (_ BitVec 64))

(assert (=> d!35232 (= res!91964 (= lt!169043 (bvsub lt!169047 lt!169042)))))

(assert (=> d!35232 (or (= (bvand lt!169047 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!169042 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!169047 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!169047 lt!169042) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35232 (= lt!169042 (remainingBits!0 ((_ sign_extend 32) (size!2313 (buf!2710 (_2!4873 lt!168267)))) ((_ sign_extend 32) (currentByte!5267 (_2!4873 lt!168267))) ((_ sign_extend 32) (currentBit!5262 (_2!4873 lt!168267)))))))

(declare-fun lt!169045 () (_ BitVec 64))

(declare-fun lt!169046 () (_ BitVec 64))

(assert (=> d!35232 (= lt!169047 (bvmul lt!169045 lt!169046))))

(assert (=> d!35232 (or (= lt!169045 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!169046 (bvsdiv (bvmul lt!169045 lt!169046) lt!169045)))))

(assert (=> d!35232 (= lt!169046 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!35232 (= lt!169045 ((_ sign_extend 32) (size!2313 (buf!2710 (_2!4873 lt!168267)))))))

(assert (=> d!35232 (= lt!169043 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5267 (_2!4873 lt!168267))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5262 (_2!4873 lt!168267)))))))

(assert (=> d!35232 (invariant!0 (currentBit!5262 (_2!4873 lt!168267)) (currentByte!5267 (_2!4873 lt!168267)) (size!2313 (buf!2710 (_2!4873 lt!168267))))))

(assert (=> d!35232 (= (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!168267))) (currentByte!5267 (_2!4873 lt!168267)) (currentBit!5262 (_2!4873 lt!168267))) lt!169043)))

(declare-fun b!111396 () Bool)

(declare-fun res!91965 () Bool)

(assert (=> b!111396 (=> (not res!91965) (not e!73082))))

(assert (=> b!111396 (= res!91965 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!169043))))

(declare-fun b!111397 () Bool)

(declare-fun lt!169044 () (_ BitVec 64))

(assert (=> b!111397 (= e!73082 (bvsle lt!169043 (bvmul lt!169044 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!111397 (or (= lt!169044 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!169044 #b0000000000000000000000000000000000000000000000000000000000001000) lt!169044)))))

(assert (=> b!111397 (= lt!169044 ((_ sign_extend 32) (size!2313 (buf!2710 (_2!4873 lt!168267)))))))

(assert (= (and d!35232 res!91964) b!111396))

(assert (= (and b!111396 res!91965) b!111397))

(declare-fun m!165729 () Bool)

(assert (=> d!35232 m!165729))

(declare-fun m!165731 () Bool)

(assert (=> d!35232 m!165731))

(assert (=> b!111020 d!35232))

(declare-fun d!35234 () Bool)

(assert (=> d!35234 (isPrefixOf!0 lt!167892 (_2!4873 lt!167766))))

(declare-fun lt!169048 () Unit!6794)

(assert (=> d!35234 (= lt!169048 (choose!30 lt!167892 (_2!4873 lt!167769) (_2!4873 lt!167766)))))

(assert (=> d!35234 (isPrefixOf!0 lt!167892 (_2!4873 lt!167769))))

(assert (=> d!35234 (= (lemmaIsPrefixTransitive!0 lt!167892 (_2!4873 lt!167769) (_2!4873 lt!167766)) lt!169048)))

(declare-fun bs!8620 () Bool)

(assert (= bs!8620 d!35234))

(assert (=> bs!8620 m!164599))

(declare-fun m!165733 () Bool)

(assert (=> bs!8620 m!165733))

(declare-fun m!165735 () Bool)

(assert (=> bs!8620 m!165735))

(assert (=> d!34848 d!35234))

(declare-fun d!35236 () Bool)

(declare-fun res!91968 () Bool)

(declare-fun e!73084 () Bool)

(assert (=> d!35236 (=> (not res!91968) (not e!73084))))

(assert (=> d!35236 (= res!91968 (= (size!2313 (buf!2710 lt!167892)) (size!2313 (buf!2710 lt!167892))))))

(assert (=> d!35236 (= (isPrefixOf!0 lt!167892 lt!167892) e!73084)))

(declare-fun b!111398 () Bool)

(declare-fun res!91967 () Bool)

(assert (=> b!111398 (=> (not res!91967) (not e!73084))))

(assert (=> b!111398 (= res!91967 (bvsle (bitIndex!0 (size!2313 (buf!2710 lt!167892)) (currentByte!5267 lt!167892) (currentBit!5262 lt!167892)) (bitIndex!0 (size!2313 (buf!2710 lt!167892)) (currentByte!5267 lt!167892) (currentBit!5262 lt!167892))))))

(declare-fun b!111399 () Bool)

(declare-fun e!73083 () Bool)

(assert (=> b!111399 (= e!73084 e!73083)))

(declare-fun res!91966 () Bool)

(assert (=> b!111399 (=> res!91966 e!73083)))

(assert (=> b!111399 (= res!91966 (= (size!2313 (buf!2710 lt!167892)) #b00000000000000000000000000000000))))

(declare-fun b!111400 () Bool)

(assert (=> b!111400 (= e!73083 (arrayBitRangesEq!0 (buf!2710 lt!167892) (buf!2710 lt!167892) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2313 (buf!2710 lt!167892)) (currentByte!5267 lt!167892) (currentBit!5262 lt!167892))))))

(assert (= (and d!35236 res!91968) b!111398))

(assert (= (and b!111398 res!91967) b!111399))

(assert (= (and b!111399 (not res!91966)) b!111400))

(declare-fun m!165737 () Bool)

(assert (=> b!111398 m!165737))

(assert (=> b!111398 m!165737))

(assert (=> b!111400 m!165737))

(assert (=> b!111400 m!165737))

(declare-fun m!165739 () Bool)

(assert (=> b!111400 m!165739))

(assert (=> d!34848 d!35236))

(declare-fun d!35238 () Bool)

(assert (=> d!35238 (isPrefixOf!0 (_2!4873 lt!167766) (_2!4873 lt!167766))))

(declare-fun lt!169049 () Unit!6794)

(assert (=> d!35238 (= lt!169049 (choose!11 (_2!4873 lt!167766)))))

(assert (=> d!35238 (= (lemmaIsPrefixRefl!0 (_2!4873 lt!167766)) lt!169049)))

(declare-fun bs!8621 () Bool)

(assert (= bs!8621 d!35238))

(assert (=> bs!8621 m!164597))

(declare-fun m!165741 () Bool)

(assert (=> bs!8621 m!165741))

(assert (=> d!34848 d!35238))

(declare-fun d!35240 () Bool)

(declare-fun res!91971 () Bool)

(declare-fun e!73086 () Bool)

(assert (=> d!35240 (=> (not res!91971) (not e!73086))))

(assert (=> d!35240 (= res!91971 (= (size!2313 (buf!2710 (_2!4873 lt!167766))) (size!2313 (buf!2710 (_2!4873 lt!167766)))))))

(assert (=> d!35240 (= (isPrefixOf!0 (_2!4873 lt!167766) (_2!4873 lt!167766)) e!73086)))

(declare-fun b!111401 () Bool)

(declare-fun res!91970 () Bool)

(assert (=> b!111401 (=> (not res!91970) (not e!73086))))

(assert (=> b!111401 (= res!91970 (bvsle (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!167766))) (currentByte!5267 (_2!4873 lt!167766)) (currentBit!5262 (_2!4873 lt!167766))) (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!167766))) (currentByte!5267 (_2!4873 lt!167766)) (currentBit!5262 (_2!4873 lt!167766)))))))

(declare-fun b!111402 () Bool)

(declare-fun e!73085 () Bool)

(assert (=> b!111402 (= e!73086 e!73085)))

(declare-fun res!91969 () Bool)

(assert (=> b!111402 (=> res!91969 e!73085)))

(assert (=> b!111402 (= res!91969 (= (size!2313 (buf!2710 (_2!4873 lt!167766))) #b00000000000000000000000000000000))))

(declare-fun b!111403 () Bool)

(assert (=> b!111403 (= e!73085 (arrayBitRangesEq!0 (buf!2710 (_2!4873 lt!167766)) (buf!2710 (_2!4873 lt!167766)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!167766))) (currentByte!5267 (_2!4873 lt!167766)) (currentBit!5262 (_2!4873 lt!167766)))))))

(assert (= (and d!35240 res!91971) b!111401))

(assert (= (and b!111401 res!91970) b!111402))

(assert (= (and b!111402 (not res!91969)) b!111403))

(assert (=> b!111401 m!164583))

(assert (=> b!111401 m!164583))

(assert (=> b!111403 m!164583))

(assert (=> b!111403 m!164583))

(declare-fun m!165743 () Bool)

(assert (=> b!111403 m!165743))

(assert (=> d!34848 d!35240))

(declare-fun d!35242 () Bool)

(assert (=> d!35242 (isPrefixOf!0 (_2!4873 lt!167769) (_2!4873 lt!167769))))

(declare-fun lt!169050 () Unit!6794)

(assert (=> d!35242 (= lt!169050 (choose!11 (_2!4873 lt!167769)))))

(assert (=> d!35242 (= (lemmaIsPrefixRefl!0 (_2!4873 lt!167769)) lt!169050)))

(declare-fun bs!8622 () Bool)

(assert (= bs!8622 d!35242))

(assert (=> bs!8622 m!164595))

(declare-fun m!165745 () Bool)

(assert (=> bs!8622 m!165745))

(assert (=> d!34848 d!35242))

(declare-fun d!35244 () Bool)

(declare-fun res!91974 () Bool)

(declare-fun e!73088 () Bool)

(assert (=> d!35244 (=> (not res!91974) (not e!73088))))

(assert (=> d!35244 (= res!91974 (= (size!2313 (buf!2710 (_1!4875 lt!167903))) (size!2313 (buf!2710 (_2!4875 lt!167903)))))))

(assert (=> d!35244 (= (isPrefixOf!0 (_1!4875 lt!167903) (_2!4875 lt!167903)) e!73088)))

(declare-fun b!111404 () Bool)

(declare-fun res!91973 () Bool)

(assert (=> b!111404 (=> (not res!91973) (not e!73088))))

(assert (=> b!111404 (= res!91973 (bvsle (bitIndex!0 (size!2313 (buf!2710 (_1!4875 lt!167903))) (currentByte!5267 (_1!4875 lt!167903)) (currentBit!5262 (_1!4875 lt!167903))) (bitIndex!0 (size!2313 (buf!2710 (_2!4875 lt!167903))) (currentByte!5267 (_2!4875 lt!167903)) (currentBit!5262 (_2!4875 lt!167903)))))))

(declare-fun b!111405 () Bool)

(declare-fun e!73087 () Bool)

(assert (=> b!111405 (= e!73088 e!73087)))

(declare-fun res!91972 () Bool)

(assert (=> b!111405 (=> res!91972 e!73087)))

(assert (=> b!111405 (= res!91972 (= (size!2313 (buf!2710 (_1!4875 lt!167903))) #b00000000000000000000000000000000))))

(declare-fun b!111406 () Bool)

(assert (=> b!111406 (= e!73087 (arrayBitRangesEq!0 (buf!2710 (_1!4875 lt!167903)) (buf!2710 (_2!4875 lt!167903)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2313 (buf!2710 (_1!4875 lt!167903))) (currentByte!5267 (_1!4875 lt!167903)) (currentBit!5262 (_1!4875 lt!167903)))))))

(assert (= (and d!35244 res!91974) b!111404))

(assert (= (and b!111404 res!91973) b!111405))

(assert (= (and b!111405 (not res!91972)) b!111406))

(declare-fun m!165747 () Bool)

(assert (=> b!111404 m!165747))

(declare-fun m!165749 () Bool)

(assert (=> b!111404 m!165749))

(assert (=> b!111406 m!165747))

(assert (=> b!111406 m!165747))

(declare-fun m!165751 () Bool)

(assert (=> b!111406 m!165751))

(assert (=> d!34848 d!35244))

(declare-fun d!35246 () Bool)

(declare-fun res!91977 () Bool)

(declare-fun e!73090 () Bool)

(assert (=> d!35246 (=> (not res!91977) (not e!73090))))

(assert (=> d!35246 (= res!91977 (= (size!2313 (buf!2710 lt!167892)) (size!2313 (buf!2710 (_2!4873 lt!167766)))))))

(assert (=> d!35246 (= (isPrefixOf!0 lt!167892 (_2!4873 lt!167766)) e!73090)))

(declare-fun b!111407 () Bool)

(declare-fun res!91976 () Bool)

(assert (=> b!111407 (=> (not res!91976) (not e!73090))))

(assert (=> b!111407 (= res!91976 (bvsle (bitIndex!0 (size!2313 (buf!2710 lt!167892)) (currentByte!5267 lt!167892) (currentBit!5262 lt!167892)) (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!167766))) (currentByte!5267 (_2!4873 lt!167766)) (currentBit!5262 (_2!4873 lt!167766)))))))

(declare-fun b!111408 () Bool)

(declare-fun e!73089 () Bool)

(assert (=> b!111408 (= e!73090 e!73089)))

(declare-fun res!91975 () Bool)

(assert (=> b!111408 (=> res!91975 e!73089)))

(assert (=> b!111408 (= res!91975 (= (size!2313 (buf!2710 lt!167892)) #b00000000000000000000000000000000))))

(declare-fun b!111409 () Bool)

(assert (=> b!111409 (= e!73089 (arrayBitRangesEq!0 (buf!2710 lt!167892) (buf!2710 (_2!4873 lt!167766)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2313 (buf!2710 lt!167892)) (currentByte!5267 lt!167892) (currentBit!5262 lt!167892))))))

(assert (= (and d!35246 res!91977) b!111407))

(assert (= (and b!111407 res!91976) b!111408))

(assert (= (and b!111408 (not res!91975)) b!111409))

(assert (=> b!111407 m!165737))

(assert (=> b!111407 m!164583))

(assert (=> b!111409 m!165737))

(assert (=> b!111409 m!165737))

(declare-fun m!165753 () Bool)

(assert (=> b!111409 m!165753))

(assert (=> d!34848 d!35246))

(declare-fun d!35248 () Bool)

(assert (=> d!35248 (isPrefixOf!0 lt!167892 lt!167892)))

(declare-fun lt!169051 () Unit!6794)

(assert (=> d!35248 (= lt!169051 (choose!11 lt!167892))))

(assert (=> d!35248 (= (lemmaIsPrefixRefl!0 lt!167892) lt!169051)))

(declare-fun bs!8623 () Bool)

(assert (= bs!8623 d!35248))

(assert (=> bs!8623 m!164605))

(declare-fun m!165755 () Bool)

(assert (=> bs!8623 m!165755))

(assert (=> d!34848 d!35248))

(declare-fun d!35250 () Bool)

(declare-fun res!91980 () Bool)

(declare-fun e!73092 () Bool)

(assert (=> d!35250 (=> (not res!91980) (not e!73092))))

(assert (=> d!35250 (= res!91980 (= (size!2313 (buf!2710 (_2!4873 lt!167769))) (size!2313 (buf!2710 (_2!4873 lt!167769)))))))

(assert (=> d!35250 (= (isPrefixOf!0 (_2!4873 lt!167769) (_2!4873 lt!167769)) e!73092)))

(declare-fun b!111410 () Bool)

(declare-fun res!91979 () Bool)

(assert (=> b!111410 (=> (not res!91979) (not e!73092))))

(assert (=> b!111410 (= res!91979 (bvsle (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!167769))) (currentByte!5267 (_2!4873 lt!167769)) (currentBit!5262 (_2!4873 lt!167769))) (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!167769))) (currentByte!5267 (_2!4873 lt!167769)) (currentBit!5262 (_2!4873 lt!167769)))))))

(declare-fun b!111411 () Bool)

(declare-fun e!73091 () Bool)

(assert (=> b!111411 (= e!73092 e!73091)))

(declare-fun res!91978 () Bool)

(assert (=> b!111411 (=> res!91978 e!73091)))

(assert (=> b!111411 (= res!91978 (= (size!2313 (buf!2710 (_2!4873 lt!167769))) #b00000000000000000000000000000000))))

(declare-fun b!111412 () Bool)

(assert (=> b!111412 (= e!73091 (arrayBitRangesEq!0 (buf!2710 (_2!4873 lt!167769)) (buf!2710 (_2!4873 lt!167769)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!167769))) (currentByte!5267 (_2!4873 lt!167769)) (currentBit!5262 (_2!4873 lt!167769)))))))

(assert (= (and d!35250 res!91980) b!111410))

(assert (= (and b!111410 res!91979) b!111411))

(assert (= (and b!111411 (not res!91978)) b!111412))

(assert (=> b!111410 m!164517))

(assert (=> b!111410 m!164517))

(assert (=> b!111412 m!164517))

(assert (=> b!111412 m!164517))

(declare-fun m!165757 () Bool)

(assert (=> b!111412 m!165757))

(assert (=> d!34848 d!35250))

(declare-fun d!35252 () Bool)

(assert (=> d!35252 (isPrefixOf!0 lt!167892 (_2!4873 lt!167766))))

(declare-fun lt!169052 () Unit!6794)

(assert (=> d!35252 (= lt!169052 (choose!30 lt!167892 (_2!4873 lt!167766) (_2!4873 lt!167766)))))

(assert (=> d!35252 (isPrefixOf!0 lt!167892 (_2!4873 lt!167766))))

(assert (=> d!35252 (= (lemmaIsPrefixTransitive!0 lt!167892 (_2!4873 lt!167766) (_2!4873 lt!167766)) lt!169052)))

(declare-fun bs!8624 () Bool)

(assert (= bs!8624 d!35252))

(assert (=> bs!8624 m!164599))

(declare-fun m!165759 () Bool)

(assert (=> bs!8624 m!165759))

(assert (=> bs!8624 m!164599))

(assert (=> d!34848 d!35252))

(declare-fun d!35254 () Bool)

(declare-fun res!91983 () Bool)

(declare-fun e!73094 () Bool)

(assert (=> d!35254 (=> (not res!91983) (not e!73094))))

(assert (=> d!35254 (= res!91983 (= (size!2313 (buf!2710 (_2!4873 lt!167769))) (size!2313 (buf!2710 (_2!4873 lt!167766)))))))

(assert (=> d!35254 (= (isPrefixOf!0 (_2!4873 lt!167769) (_2!4873 lt!167766)) e!73094)))

(declare-fun b!111413 () Bool)

(declare-fun res!91982 () Bool)

(assert (=> b!111413 (=> (not res!91982) (not e!73094))))

(assert (=> b!111413 (= res!91982 (bvsle (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!167769))) (currentByte!5267 (_2!4873 lt!167769)) (currentBit!5262 (_2!4873 lt!167769))) (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!167766))) (currentByte!5267 (_2!4873 lt!167766)) (currentBit!5262 (_2!4873 lt!167766)))))))

(declare-fun b!111414 () Bool)

(declare-fun e!73093 () Bool)

(assert (=> b!111414 (= e!73094 e!73093)))

(declare-fun res!91981 () Bool)

(assert (=> b!111414 (=> res!91981 e!73093)))

(assert (=> b!111414 (= res!91981 (= (size!2313 (buf!2710 (_2!4873 lt!167769))) #b00000000000000000000000000000000))))

(declare-fun b!111415 () Bool)

(assert (=> b!111415 (= e!73093 (arrayBitRangesEq!0 (buf!2710 (_2!4873 lt!167769)) (buf!2710 (_2!4873 lt!167766)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!167769))) (currentByte!5267 (_2!4873 lt!167769)) (currentBit!5262 (_2!4873 lt!167769)))))))

(assert (= (and d!35254 res!91983) b!111413))

(assert (= (and b!111413 res!91982) b!111414))

(assert (= (and b!111414 (not res!91981)) b!111415))

(assert (=> b!111413 m!164517))

(assert (=> b!111413 m!164583))

(assert (=> b!111415 m!164517))

(assert (=> b!111415 m!164517))

(declare-fun m!165761 () Bool)

(assert (=> b!111415 m!165761))

(assert (=> d!34848 d!35254))

(declare-fun d!35256 () Bool)

(declare-fun res!91986 () Bool)

(declare-fun e!73096 () Bool)

(assert (=> d!35256 (=> (not res!91986) (not e!73096))))

(assert (=> d!35256 (= res!91986 (= (size!2313 (buf!2710 (ite c!6745 (_2!4873 lt!167769) lt!168259))) (size!2313 (buf!2710 (ite c!6745 (_2!4873 lt!168256) lt!168259)))))))

(assert (=> d!35256 (= (isPrefixOf!0 (ite c!6745 (_2!4873 lt!167769) lt!168259) (ite c!6745 (_2!4873 lt!168256) lt!168259)) e!73096)))

(declare-fun b!111416 () Bool)

(declare-fun res!91985 () Bool)

(assert (=> b!111416 (=> (not res!91985) (not e!73096))))

(assert (=> b!111416 (= res!91985 (bvsle (bitIndex!0 (size!2313 (buf!2710 (ite c!6745 (_2!4873 lt!167769) lt!168259))) (currentByte!5267 (ite c!6745 (_2!4873 lt!167769) lt!168259)) (currentBit!5262 (ite c!6745 (_2!4873 lt!167769) lt!168259))) (bitIndex!0 (size!2313 (buf!2710 (ite c!6745 (_2!4873 lt!168256) lt!168259))) (currentByte!5267 (ite c!6745 (_2!4873 lt!168256) lt!168259)) (currentBit!5262 (ite c!6745 (_2!4873 lt!168256) lt!168259)))))))

(declare-fun b!111417 () Bool)

(declare-fun e!73095 () Bool)

(assert (=> b!111417 (= e!73096 e!73095)))

(declare-fun res!91984 () Bool)

(assert (=> b!111417 (=> res!91984 e!73095)))

(assert (=> b!111417 (= res!91984 (= (size!2313 (buf!2710 (ite c!6745 (_2!4873 lt!167769) lt!168259))) #b00000000000000000000000000000000))))

(declare-fun b!111418 () Bool)

(assert (=> b!111418 (= e!73095 (arrayBitRangesEq!0 (buf!2710 (ite c!6745 (_2!4873 lt!167769) lt!168259)) (buf!2710 (ite c!6745 (_2!4873 lt!168256) lt!168259)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2313 (buf!2710 (ite c!6745 (_2!4873 lt!167769) lt!168259))) (currentByte!5267 (ite c!6745 (_2!4873 lt!167769) lt!168259)) (currentBit!5262 (ite c!6745 (_2!4873 lt!167769) lt!168259)))))))

(assert (= (and d!35256 res!91986) b!111416))

(assert (= (and b!111416 res!91985) b!111417))

(assert (= (and b!111417 (not res!91984)) b!111418))

(declare-fun m!165763 () Bool)

(assert (=> b!111416 m!165763))

(declare-fun m!165765 () Bool)

(assert (=> b!111416 m!165765))

(assert (=> b!111418 m!165763))

(assert (=> b!111418 m!165763))

(declare-fun m!165767 () Bool)

(assert (=> b!111418 m!165767))

(assert (=> bm!1386 d!35256))

(declare-fun d!35258 () Bool)

(declare-fun e!73097 () Bool)

(assert (=> d!35258 e!73097))

(declare-fun res!91987 () Bool)

(assert (=> d!35258 (=> (not res!91987) (not e!73097))))

(declare-fun lt!169054 () (_ BitVec 64))

(declare-fun lt!169058 () (_ BitVec 64))

(declare-fun lt!169053 () (_ BitVec 64))

(assert (=> d!35258 (= res!91987 (= lt!169054 (bvsub lt!169058 lt!169053)))))

(assert (=> d!35258 (or (= (bvand lt!169058 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!169053 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!169058 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!169058 lt!169053) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35258 (= lt!169053 (remainingBits!0 ((_ sign_extend 32) (size!2313 (buf!2710 (_2!4873 lt!168384)))) ((_ sign_extend 32) (currentByte!5267 (_2!4873 lt!168384))) ((_ sign_extend 32) (currentBit!5262 (_2!4873 lt!168384)))))))

(declare-fun lt!169056 () (_ BitVec 64))

(declare-fun lt!169057 () (_ BitVec 64))

(assert (=> d!35258 (= lt!169058 (bvmul lt!169056 lt!169057))))

(assert (=> d!35258 (or (= lt!169056 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!169057 (bvsdiv (bvmul lt!169056 lt!169057) lt!169056)))))

(assert (=> d!35258 (= lt!169057 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!35258 (= lt!169056 ((_ sign_extend 32) (size!2313 (buf!2710 (_2!4873 lt!168384)))))))

(assert (=> d!35258 (= lt!169054 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5267 (_2!4873 lt!168384))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5262 (_2!4873 lt!168384)))))))

(assert (=> d!35258 (invariant!0 (currentBit!5262 (_2!4873 lt!168384)) (currentByte!5267 (_2!4873 lt!168384)) (size!2313 (buf!2710 (_2!4873 lt!168384))))))

(assert (=> d!35258 (= (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!168384))) (currentByte!5267 (_2!4873 lt!168384)) (currentBit!5262 (_2!4873 lt!168384))) lt!169054)))

(declare-fun b!111419 () Bool)

(declare-fun res!91988 () Bool)

(assert (=> b!111419 (=> (not res!91988) (not e!73097))))

(assert (=> b!111419 (= res!91988 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!169054))))

(declare-fun b!111420 () Bool)

(declare-fun lt!169055 () (_ BitVec 64))

(assert (=> b!111420 (= e!73097 (bvsle lt!169054 (bvmul lt!169055 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!111420 (or (= lt!169055 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!169055 #b0000000000000000000000000000000000000000000000000000000000001000) lt!169055)))))

(assert (=> b!111420 (= lt!169055 ((_ sign_extend 32) (size!2313 (buf!2710 (_2!4873 lt!168384)))))))

(assert (= (and d!35258 res!91987) b!111419))

(assert (= (and b!111419 res!91988) b!111420))

(declare-fun m!165769 () Bool)

(assert (=> d!35258 m!165769))

(declare-fun m!165771 () Bool)

(assert (=> d!35258 m!165771))

(assert (=> b!111065 d!35258))

(assert (=> b!111065 d!34962))

(declare-fun d!35260 () Bool)

(declare-fun e!73104 () Bool)

(assert (=> d!35260 e!73104))

(declare-fun res!91991 () Bool)

(assert (=> d!35260 (=> (not res!91991) (not e!73104))))

(declare-fun increaseBitIndex!0 (BitStream!4100) tuple2!9232)

(assert (=> d!35260 (= res!91991 (= (buf!2710 (_2!4873 (increaseBitIndex!0 (readerFrom!0 (_2!4873 lt!167769) (currentBit!5262 thiss!1305) (currentByte!5267 thiss!1305))))) (buf!2710 (readerFrom!0 (_2!4873 lt!167769) (currentBit!5262 thiss!1305) (currentByte!5267 thiss!1305)))))))

(declare-fun lt!169074 () Bool)

(assert (=> d!35260 (= lt!169074 (not (= (bvand ((_ sign_extend 24) (select (arr!2906 (buf!2710 (readerFrom!0 (_2!4873 lt!167769) (currentBit!5262 thiss!1305) (currentByte!5267 thiss!1305)))) (currentByte!5267 (readerFrom!0 (_2!4873 lt!167769) (currentBit!5262 thiss!1305) (currentByte!5267 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5262 (readerFrom!0 (_2!4873 lt!167769) (currentBit!5262 thiss!1305) (currentByte!5267 thiss!1305)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!169076 () tuple2!9242)

(assert (=> d!35260 (= lt!169076 (tuple2!9243 (not (= (bvand ((_ sign_extend 24) (select (arr!2906 (buf!2710 (readerFrom!0 (_2!4873 lt!167769) (currentBit!5262 thiss!1305) (currentByte!5267 thiss!1305)))) (currentByte!5267 (readerFrom!0 (_2!4873 lt!167769) (currentBit!5262 thiss!1305) (currentByte!5267 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5262 (readerFrom!0 (_2!4873 lt!167769) (currentBit!5262 thiss!1305) (currentByte!5267 thiss!1305)))))) #b00000000000000000000000000000000)) (_2!4873 (increaseBitIndex!0 (readerFrom!0 (_2!4873 lt!167769) (currentBit!5262 thiss!1305) (currentByte!5267 thiss!1305))))))))

(assert (=> d!35260 (validate_offset_bit!0 ((_ sign_extend 32) (size!2313 (buf!2710 (readerFrom!0 (_2!4873 lt!167769) (currentBit!5262 thiss!1305) (currentByte!5267 thiss!1305))))) ((_ sign_extend 32) (currentByte!5267 (readerFrom!0 (_2!4873 lt!167769) (currentBit!5262 thiss!1305) (currentByte!5267 thiss!1305)))) ((_ sign_extend 32) (currentBit!5262 (readerFrom!0 (_2!4873 lt!167769) (currentBit!5262 thiss!1305) (currentByte!5267 thiss!1305)))))))

(assert (=> d!35260 (= (readBit!0 (readerFrom!0 (_2!4873 lt!167769) (currentBit!5262 thiss!1305) (currentByte!5267 thiss!1305))) lt!169076)))

(declare-fun lt!169073 () (_ BitVec 64))

(declare-fun b!111423 () Bool)

(declare-fun lt!169075 () (_ BitVec 64))

(assert (=> b!111423 (= e!73104 (= (bitIndex!0 (size!2313 (buf!2710 (_2!4873 (increaseBitIndex!0 (readerFrom!0 (_2!4873 lt!167769) (currentBit!5262 thiss!1305) (currentByte!5267 thiss!1305)))))) (currentByte!5267 (_2!4873 (increaseBitIndex!0 (readerFrom!0 (_2!4873 lt!167769) (currentBit!5262 thiss!1305) (currentByte!5267 thiss!1305))))) (currentBit!5262 (_2!4873 (increaseBitIndex!0 (readerFrom!0 (_2!4873 lt!167769) (currentBit!5262 thiss!1305) (currentByte!5267 thiss!1305)))))) (bvadd lt!169073 lt!169075)))))

(assert (=> b!111423 (or (not (= (bvand lt!169073 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!169075 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!169073 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!169073 lt!169075) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!111423 (= lt!169075 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!111423 (= lt!169073 (bitIndex!0 (size!2313 (buf!2710 (readerFrom!0 (_2!4873 lt!167769) (currentBit!5262 thiss!1305) (currentByte!5267 thiss!1305)))) (currentByte!5267 (readerFrom!0 (_2!4873 lt!167769) (currentBit!5262 thiss!1305) (currentByte!5267 thiss!1305))) (currentBit!5262 (readerFrom!0 (_2!4873 lt!167769) (currentBit!5262 thiss!1305) (currentByte!5267 thiss!1305)))))))

(declare-fun lt!169077 () Bool)

(assert (=> b!111423 (= lt!169077 (not (= (bvand ((_ sign_extend 24) (select (arr!2906 (buf!2710 (readerFrom!0 (_2!4873 lt!167769) (currentBit!5262 thiss!1305) (currentByte!5267 thiss!1305)))) (currentByte!5267 (readerFrom!0 (_2!4873 lt!167769) (currentBit!5262 thiss!1305) (currentByte!5267 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5262 (readerFrom!0 (_2!4873 lt!167769) (currentBit!5262 thiss!1305) (currentByte!5267 thiss!1305)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!169079 () Bool)

(assert (=> b!111423 (= lt!169079 (not (= (bvand ((_ sign_extend 24) (select (arr!2906 (buf!2710 (readerFrom!0 (_2!4873 lt!167769) (currentBit!5262 thiss!1305) (currentByte!5267 thiss!1305)))) (currentByte!5267 (readerFrom!0 (_2!4873 lt!167769) (currentBit!5262 thiss!1305) (currentByte!5267 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5262 (readerFrom!0 (_2!4873 lt!167769) (currentBit!5262 thiss!1305) (currentByte!5267 thiss!1305)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!169078 () Bool)

(assert (=> b!111423 (= lt!169078 (not (= (bvand ((_ sign_extend 24) (select (arr!2906 (buf!2710 (readerFrom!0 (_2!4873 lt!167769) (currentBit!5262 thiss!1305) (currentByte!5267 thiss!1305)))) (currentByte!5267 (readerFrom!0 (_2!4873 lt!167769) (currentBit!5262 thiss!1305) (currentByte!5267 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5262 (readerFrom!0 (_2!4873 lt!167769) (currentBit!5262 thiss!1305) (currentByte!5267 thiss!1305)))))) #b00000000000000000000000000000000)))))

(assert (= (and d!35260 res!91991) b!111423))

(assert (=> d!35260 m!164521))

(declare-fun m!165773 () Bool)

(assert (=> d!35260 m!165773))

(declare-fun m!165775 () Bool)

(assert (=> d!35260 m!165775))

(declare-fun m!165777 () Bool)

(assert (=> d!35260 m!165777))

(declare-fun m!165779 () Bool)

(assert (=> d!35260 m!165779))

(assert (=> b!111423 m!165775))

(declare-fun m!165781 () Bool)

(assert (=> b!111423 m!165781))

(declare-fun m!165783 () Bool)

(assert (=> b!111423 m!165783))

(assert (=> b!111423 m!165777))

(assert (=> b!111423 m!164521))

(assert (=> b!111423 m!165773))

(assert (=> d!34828 d!35260))

(declare-fun d!35262 () Bool)

(declare-fun lt!169080 () tuple2!9242)

(assert (=> d!35262 (= lt!169080 (readBit!0 (readerFrom!0 (_2!4873 lt!168384) (currentBit!5262 thiss!1305) (currentByte!5267 thiss!1305))))))

(assert (=> d!35262 (= (readBitPure!0 (readerFrom!0 (_2!4873 lt!168384) (currentBit!5262 thiss!1305) (currentByte!5267 thiss!1305))) (tuple2!9235 (_2!4878 lt!169080) (_1!4878 lt!169080)))))

(declare-fun bs!8625 () Bool)

(assert (= bs!8625 d!35262))

(assert (=> bs!8625 m!164957))

(declare-fun m!165785 () Bool)

(assert (=> bs!8625 m!165785))

(assert (=> b!111067 d!35262))

(declare-fun d!35264 () Bool)

(declare-fun e!73105 () Bool)

(assert (=> d!35264 e!73105))

(declare-fun res!91992 () Bool)

(assert (=> d!35264 (=> (not res!91992) (not e!73105))))

(assert (=> d!35264 (= res!91992 (invariant!0 (currentBit!5262 (_2!4873 lt!168384)) (currentByte!5267 (_2!4873 lt!168384)) (size!2313 (buf!2710 (_2!4873 lt!168384)))))))

(assert (=> d!35264 (= (readerFrom!0 (_2!4873 lt!168384) (currentBit!5262 thiss!1305) (currentByte!5267 thiss!1305)) (BitStream!4101 (buf!2710 (_2!4873 lt!168384)) (currentByte!5267 thiss!1305) (currentBit!5262 thiss!1305)))))

(declare-fun b!111424 () Bool)

(assert (=> b!111424 (= e!73105 (invariant!0 (currentBit!5262 thiss!1305) (currentByte!5267 thiss!1305) (size!2313 (buf!2710 (_2!4873 lt!168384)))))))

(assert (= (and d!35264 res!91992) b!111424))

(assert (=> d!35264 m!165771))

(declare-fun m!165787 () Bool)

(assert (=> b!111424 m!165787))

(assert (=> b!111067 d!35264))

(declare-fun b!111436 () Bool)

(declare-fun e!73114 () Bool)

(declare-fun _$19!99 () tuple2!9232)

(assert (=> b!111436 (= e!73114 (array_inv!2115 (buf!2710 (_2!4873 _$19!99))))))

(declare-fun b!111437 () Bool)

(declare-fun res!92003 () Bool)

(declare-fun e!73117 () Bool)

(assert (=> b!111437 (=> (not res!92003) (not e!73117))))

(assert (=> b!111437 (= res!92003 (isPrefixOf!0 thiss!1305 (_2!4873 _$19!99)))))

(declare-fun d!35266 () Bool)

(assert (=> d!35266 e!73117))

(declare-fun res!92002 () Bool)

(assert (=> d!35266 (=> (not res!92002) (not e!73117))))

(assert (=> d!35266 (= res!92002 (= (size!2313 (buf!2710 thiss!1305)) (size!2313 (buf!2710 (_2!4873 _$19!99)))))))

(assert (=> d!35266 (and (inv!12 (_2!4873 _$19!99)) e!73114)))

(assert (=> d!35266 (= (choose!16 thiss!1305 lt!167762) _$19!99)))

(declare-fun b!111438 () Bool)

(declare-fun e!73116 () Bool)

(assert (=> b!111438 (= e!73117 e!73116)))

(declare-fun res!92004 () Bool)

(assert (=> b!111438 (=> (not res!92004) (not e!73116))))

(declare-fun lt!169083 () tuple2!9234)

(assert (=> b!111438 (= res!92004 (and (= (_2!4874 lt!169083) lt!167762) (= (_1!4874 lt!169083) (_2!4873 _$19!99))))))

(assert (=> b!111438 (= lt!169083 (readBitPure!0 (readerFrom!0 (_2!4873 _$19!99) (currentBit!5262 thiss!1305) (currentByte!5267 thiss!1305))))))

(declare-fun b!111439 () Bool)

(declare-fun res!92001 () Bool)

(assert (=> b!111439 (=> (not res!92001) (not e!73117))))

(assert (=> b!111439 (= res!92001 (= (bitIndex!0 (size!2313 (buf!2710 (_2!4873 _$19!99))) (currentByte!5267 (_2!4873 _$19!99)) (currentBit!5262 (_2!4873 _$19!99))) (bvadd (bitIndex!0 (size!2313 (buf!2710 thiss!1305)) (currentByte!5267 thiss!1305) (currentBit!5262 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!111440 () Bool)

(assert (=> b!111440 (= e!73116 (= (bitIndex!0 (size!2313 (buf!2710 (_1!4874 lt!169083))) (currentByte!5267 (_1!4874 lt!169083)) (currentBit!5262 (_1!4874 lt!169083))) (bitIndex!0 (size!2313 (buf!2710 (_2!4873 _$19!99))) (currentByte!5267 (_2!4873 _$19!99)) (currentBit!5262 (_2!4873 _$19!99)))))))

(assert (= d!35266 b!111436))

(assert (= (and d!35266 res!92002) b!111439))

(assert (= (and b!111439 res!92001) b!111437))

(assert (= (and b!111437 res!92003) b!111438))

(assert (= (and b!111438 res!92004) b!111440))

(declare-fun m!165789 () Bool)

(assert (=> b!111437 m!165789))

(declare-fun m!165791 () Bool)

(assert (=> b!111440 m!165791))

(declare-fun m!165793 () Bool)

(assert (=> b!111440 m!165793))

(declare-fun m!165795 () Bool)

(assert (=> d!35266 m!165795))

(declare-fun m!165797 () Bool)

(assert (=> b!111436 m!165797))

(assert (=> b!111439 m!165793))

(assert (=> b!111439 m!164519))

(declare-fun m!165799 () Bool)

(assert (=> b!111438 m!165799))

(assert (=> b!111438 m!165799))

(declare-fun m!165801 () Bool)

(assert (=> b!111438 m!165801))

(assert (=> d!34944 d!35266))

(declare-fun d!35268 () Bool)

(assert (=> d!35268 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!2313 (buf!2710 thiss!1305))) ((_ sign_extend 32) (currentByte!5267 thiss!1305)) ((_ sign_extend 32) (currentBit!5262 thiss!1305))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2313 (buf!2710 thiss!1305))) ((_ sign_extend 32) (currentByte!5267 thiss!1305)) ((_ sign_extend 32) (currentBit!5262 thiss!1305))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!8626 () Bool)

(assert (= bs!8626 d!35268))

(assert (=> bs!8626 m!164533))

(assert (=> d!34944 d!35268))

(declare-fun d!35270 () Bool)

(declare-fun res!92007 () Bool)

(declare-fun e!73119 () Bool)

(assert (=> d!35270 (=> (not res!92007) (not e!73119))))

(assert (=> d!35270 (= res!92007 (= (size!2313 (buf!2710 (_2!4875 lt!167948))) (size!2313 (buf!2710 (_2!4873 lt!167766)))))))

(assert (=> d!35270 (= (isPrefixOf!0 (_2!4875 lt!167948) (_2!4873 lt!167766)) e!73119)))

(declare-fun b!111441 () Bool)

(declare-fun res!92006 () Bool)

(assert (=> b!111441 (=> (not res!92006) (not e!73119))))

(assert (=> b!111441 (= res!92006 (bvsle (bitIndex!0 (size!2313 (buf!2710 (_2!4875 lt!167948))) (currentByte!5267 (_2!4875 lt!167948)) (currentBit!5262 (_2!4875 lt!167948))) (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!167766))) (currentByte!5267 (_2!4873 lt!167766)) (currentBit!5262 (_2!4873 lt!167766)))))))

(declare-fun b!111442 () Bool)

(declare-fun e!73118 () Bool)

(assert (=> b!111442 (= e!73119 e!73118)))

(declare-fun res!92005 () Bool)

(assert (=> b!111442 (=> res!92005 e!73118)))

(assert (=> b!111442 (= res!92005 (= (size!2313 (buf!2710 (_2!4875 lt!167948))) #b00000000000000000000000000000000))))

(declare-fun b!111443 () Bool)

(assert (=> b!111443 (= e!73118 (arrayBitRangesEq!0 (buf!2710 (_2!4875 lt!167948)) (buf!2710 (_2!4873 lt!167766)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2313 (buf!2710 (_2!4875 lt!167948))) (currentByte!5267 (_2!4875 lt!167948)) (currentBit!5262 (_2!4875 lt!167948)))))))

(assert (= (and d!35270 res!92007) b!111441))

(assert (= (and b!111441 res!92006) b!111442))

(assert (= (and b!111442 (not res!92005)) b!111443))

(declare-fun m!165803 () Bool)

(assert (=> b!111441 m!165803))

(assert (=> b!111441 m!164583))

(assert (=> b!111443 m!165803))

(assert (=> b!111443 m!165803))

(declare-fun m!165805 () Bool)

(assert (=> b!111443 m!165805))

(assert (=> b!110907 d!35270))

(declare-fun d!35272 () Bool)

(declare-fun res!92010 () Bool)

(declare-fun e!73121 () Bool)

(assert (=> d!35272 (=> (not res!92010) (not e!73121))))

(assert (=> d!35272 (= res!92010 (= (size!2313 (buf!2710 (_1!4875 lt!167948))) (size!2313 (buf!2710 thiss!1305))))))

(assert (=> d!35272 (= (isPrefixOf!0 (_1!4875 lt!167948) thiss!1305) e!73121)))

(declare-fun b!111444 () Bool)

(declare-fun res!92009 () Bool)

(assert (=> b!111444 (=> (not res!92009) (not e!73121))))

(assert (=> b!111444 (= res!92009 (bvsle (bitIndex!0 (size!2313 (buf!2710 (_1!4875 lt!167948))) (currentByte!5267 (_1!4875 lt!167948)) (currentBit!5262 (_1!4875 lt!167948))) (bitIndex!0 (size!2313 (buf!2710 thiss!1305)) (currentByte!5267 thiss!1305) (currentBit!5262 thiss!1305))))))

(declare-fun b!111445 () Bool)

(declare-fun e!73120 () Bool)

(assert (=> b!111445 (= e!73121 e!73120)))

(declare-fun res!92008 () Bool)

(assert (=> b!111445 (=> res!92008 e!73120)))

(assert (=> b!111445 (= res!92008 (= (size!2313 (buf!2710 (_1!4875 lt!167948))) #b00000000000000000000000000000000))))

(declare-fun b!111446 () Bool)

(assert (=> b!111446 (= e!73120 (arrayBitRangesEq!0 (buf!2710 (_1!4875 lt!167948)) (buf!2710 thiss!1305) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2313 (buf!2710 (_1!4875 lt!167948))) (currentByte!5267 (_1!4875 lt!167948)) (currentBit!5262 (_1!4875 lt!167948)))))))

(assert (= (and d!35272 res!92010) b!111444))

(assert (= (and b!111444 res!92009) b!111445))

(assert (= (and b!111445 (not res!92008)) b!111446))

(declare-fun m!165807 () Bool)

(assert (=> b!111444 m!165807))

(assert (=> b!111444 m!164519))

(assert (=> b!111446 m!165807))

(assert (=> b!111446 m!165807))

(declare-fun m!165809 () Bool)

(assert (=> b!111446 m!165809))

(assert (=> b!110903 d!35272))

(assert (=> b!111027 d!35232))

(assert (=> b!111027 d!34960))

(declare-fun d!35274 () Bool)

(assert (=> d!35274 (= (remainingBits!0 ((_ sign_extend 32) (size!2313 (buf!2710 (_1!4874 lt!167753)))) ((_ sign_extend 32) (currentByte!5267 (_1!4874 lt!167753))) ((_ sign_extend 32) (currentBit!5262 (_1!4874 lt!167753)))) (bvsub (bvmul ((_ sign_extend 32) (size!2313 (buf!2710 (_1!4874 lt!167753)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5267 (_1!4874 lt!167753))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5262 (_1!4874 lt!167753))))))))

(assert (=> d!34898 d!35274))

(declare-fun d!35276 () Bool)

(assert (=> d!35276 (= (invariant!0 (currentBit!5262 (_1!4874 lt!167753)) (currentByte!5267 (_1!4874 lt!167753)) (size!2313 (buf!2710 (_1!4874 lt!167753)))) (and (bvsge (currentBit!5262 (_1!4874 lt!167753)) #b00000000000000000000000000000000) (bvslt (currentBit!5262 (_1!4874 lt!167753)) #b00000000000000000000000000001000) (bvsge (currentByte!5267 (_1!4874 lt!167753)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5267 (_1!4874 lt!167753)) (size!2313 (buf!2710 (_1!4874 lt!167753)))) (and (= (currentBit!5262 (_1!4874 lt!167753)) #b00000000000000000000000000000000) (= (currentByte!5267 (_1!4874 lt!167753)) (size!2313 (buf!2710 (_1!4874 lt!167753))))))))))

(assert (=> d!34898 d!35276))

(declare-fun d!35278 () Bool)

(declare-fun e!73124 () Bool)

(assert (=> d!35278 e!73124))

(declare-fun res!92013 () Bool)

(assert (=> d!35278 (=> (not res!92013) (not e!73124))))

(declare-fun lt!169089 () (_ BitVec 64))

(declare-fun lt!169088 () BitStream!4100)

(assert (=> d!35278 (= res!92013 (= (bvadd lt!169089 (bvsub lt!167938 lt!167931)) (bitIndex!0 (size!2313 (buf!2710 lt!169088)) (currentByte!5267 lt!169088) (currentBit!5262 lt!169088))))))

(assert (=> d!35278 (or (not (= (bvand lt!169089 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!167938 lt!167931) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!169089 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!169089 (bvsub lt!167938 lt!167931)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35278 (= lt!169089 (bitIndex!0 (size!2313 (buf!2710 (_2!4875 lt!167948))) (currentByte!5267 (_2!4875 lt!167948)) (currentBit!5262 (_2!4875 lt!167948))))))

(declare-fun moveBitIndex!0 (BitStream!4100 (_ BitVec 64)) tuple2!9232)

(assert (=> d!35278 (= lt!169088 (_2!4873 (moveBitIndex!0 (_2!4875 lt!167948) (bvsub lt!167938 lt!167931))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!4100 (_ BitVec 64)) Bool)

(assert (=> d!35278 (moveBitIndexPrecond!0 (_2!4875 lt!167948) (bvsub lt!167938 lt!167931))))

(assert (=> d!35278 (= (withMovedBitIndex!0 (_2!4875 lt!167948) (bvsub lt!167938 lt!167931)) lt!169088)))

(declare-fun b!111449 () Bool)

(assert (=> b!111449 (= e!73124 (= (size!2313 (buf!2710 (_2!4875 lt!167948))) (size!2313 (buf!2710 lt!169088))))))

(assert (= (and d!35278 res!92013) b!111449))

(declare-fun m!165811 () Bool)

(assert (=> d!35278 m!165811))

(assert (=> d!35278 m!165803))

(declare-fun m!165813 () Bool)

(assert (=> d!35278 m!165813))

(declare-fun m!165815 () Bool)

(assert (=> d!35278 m!165815))

(assert (=> b!110905 d!35278))

(declare-fun d!35280 () Bool)

(declare-fun e!73125 () Bool)

(assert (=> d!35280 e!73125))

(declare-fun res!92014 () Bool)

(assert (=> d!35280 (=> (not res!92014) (not e!73125))))

(declare-fun lt!169091 () (_ BitVec 64))

(declare-fun lt!169090 () (_ BitVec 64))

(declare-fun lt!169095 () (_ BitVec 64))

(assert (=> d!35280 (= res!92014 (= lt!169091 (bvsub lt!169095 lt!169090)))))

(assert (=> d!35280 (or (= (bvand lt!169095 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!169090 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!169095 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!169095 lt!169090) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35280 (= lt!169090 (remainingBits!0 ((_ sign_extend 32) (size!2313 (buf!2710 (_2!4873 lt!167766)))) ((_ sign_extend 32) (currentByte!5267 (_2!4873 lt!167766))) ((_ sign_extend 32) (currentBit!5262 (_2!4873 lt!167766)))))))

(declare-fun lt!169093 () (_ BitVec 64))

(declare-fun lt!169094 () (_ BitVec 64))

(assert (=> d!35280 (= lt!169095 (bvmul lt!169093 lt!169094))))

(assert (=> d!35280 (or (= lt!169093 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!169094 (bvsdiv (bvmul lt!169093 lt!169094) lt!169093)))))

(assert (=> d!35280 (= lt!169094 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!35280 (= lt!169093 ((_ sign_extend 32) (size!2313 (buf!2710 (_2!4873 lt!167766)))))))

(assert (=> d!35280 (= lt!169091 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5267 (_2!4873 lt!167766))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5262 (_2!4873 lt!167766)))))))

(assert (=> d!35280 (invariant!0 (currentBit!5262 (_2!4873 lt!167766)) (currentByte!5267 (_2!4873 lt!167766)) (size!2313 (buf!2710 (_2!4873 lt!167766))))))

(assert (=> d!35280 (= (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!167766))) (currentByte!5267 (_2!4873 lt!167766)) (currentBit!5262 (_2!4873 lt!167766))) lt!169091)))

(declare-fun b!111450 () Bool)

(declare-fun res!92015 () Bool)

(assert (=> b!111450 (=> (not res!92015) (not e!73125))))

(assert (=> b!111450 (= res!92015 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!169091))))

(declare-fun b!111451 () Bool)

(declare-fun lt!169092 () (_ BitVec 64))

(assert (=> b!111451 (= e!73125 (bvsle lt!169091 (bvmul lt!169092 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!111451 (or (= lt!169092 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!169092 #b0000000000000000000000000000000000000000000000000000000000001000) lt!169092)))))

(assert (=> b!111451 (= lt!169092 ((_ sign_extend 32) (size!2313 (buf!2710 (_2!4873 lt!167766)))))))

(assert (= (and d!35280 res!92014) b!111450))

(assert (= (and b!111450 res!92015) b!111451))

(declare-fun m!165817 () Bool)

(assert (=> d!35280 m!165817))

(declare-fun m!165819 () Bool)

(assert (=> d!35280 m!165819))

(assert (=> b!110905 d!35280))

(assert (=> b!110905 d!34962))

(declare-fun b!111452 () Bool)

(declare-fun res!92017 () Bool)

(declare-fun lt!169097 () (_ BitVec 32))

(assert (=> b!111452 (= res!92017 (= lt!169097 #b00000000000000000000000000000000))))

(declare-fun e!73129 () Bool)

(assert (=> b!111452 (=> res!92017 e!73129)))

(declare-fun e!73130 () Bool)

(assert (=> b!111452 (= e!73130 e!73129)))

(declare-fun b!111453 () Bool)

(declare-fun e!73131 () Bool)

(declare-fun e!73127 () Bool)

(assert (=> b!111453 (= e!73131 e!73127)))

(declare-fun c!6777 () Bool)

(declare-fun lt!169098 () tuple4!74)

(assert (=> b!111453 (= c!6777 (= (_3!258 lt!169098) (_4!37 lt!169098)))))

(declare-fun d!35282 () Bool)

(declare-fun res!92020 () Bool)

(declare-fun e!73126 () Bool)

(assert (=> d!35282 (=> res!92020 e!73126)))

(assert (=> d!35282 (= res!92020 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2313 (buf!2710 thiss!1305)) (currentByte!5267 thiss!1305) (currentBit!5262 thiss!1305))))))

(assert (=> d!35282 (= (arrayBitRangesEq!0 (buf!2710 thiss!1305) (buf!2710 (_2!4873 lt!167766)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2313 (buf!2710 thiss!1305)) (currentByte!5267 thiss!1305) (currentBit!5262 thiss!1305))) e!73126)))

(declare-fun b!111454 () Bool)

(declare-fun e!73128 () Bool)

(assert (=> b!111454 (= e!73128 (arrayRangesEq!38 (buf!2710 thiss!1305) (buf!2710 (_2!4873 lt!167766)) (_1!4884 lt!169098) (_2!4884 lt!169098)))))

(declare-fun b!111455 () Bool)

(assert (=> b!111455 (= e!73126 e!73131)))

(declare-fun res!92018 () Bool)

(assert (=> b!111455 (=> (not res!92018) (not e!73131))))

(assert (=> b!111455 (= res!92018 e!73128)))

(declare-fun res!92016 () Bool)

(assert (=> b!111455 (=> res!92016 e!73128)))

(assert (=> b!111455 (= res!92016 (bvsge (_1!4884 lt!169098) (_2!4884 lt!169098)))))

(assert (=> b!111455 (= lt!169097 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!2313 (buf!2710 thiss!1305)) (currentByte!5267 thiss!1305) (currentBit!5262 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!169096 () (_ BitVec 32))

(assert (=> b!111455 (= lt!169096 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!111455 (= lt!169098 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2313 (buf!2710 thiss!1305)) (currentByte!5267 thiss!1305) (currentBit!5262 thiss!1305))))))

(declare-fun b!111456 () Bool)

(declare-fun call!1406 () Bool)

(assert (=> b!111456 (= e!73129 call!1406)))

(declare-fun b!111457 () Bool)

(assert (=> b!111457 (= e!73127 e!73130)))

(declare-fun res!92019 () Bool)

(assert (=> b!111457 (= res!92019 (byteRangesEq!0 (select (arr!2906 (buf!2710 thiss!1305)) (_3!258 lt!169098)) (select (arr!2906 (buf!2710 (_2!4873 lt!167766))) (_3!258 lt!169098)) lt!169096 #b00000000000000000000000000001000))))

(assert (=> b!111457 (=> (not res!92019) (not e!73130))))

(declare-fun b!111458 () Bool)

(assert (=> b!111458 (= e!73127 call!1406)))

(declare-fun bm!1403 () Bool)

(assert (=> bm!1403 (= call!1406 (byteRangesEq!0 (ite c!6777 (select (arr!2906 (buf!2710 thiss!1305)) (_3!258 lt!169098)) (select (arr!2906 (buf!2710 thiss!1305)) (_4!37 lt!169098))) (ite c!6777 (select (arr!2906 (buf!2710 (_2!4873 lt!167766))) (_3!258 lt!169098)) (select (arr!2906 (buf!2710 (_2!4873 lt!167766))) (_4!37 lt!169098))) (ite c!6777 lt!169096 #b00000000000000000000000000000000) lt!169097))))

(assert (= (and d!35282 (not res!92020)) b!111455))

(assert (= (and b!111455 (not res!92016)) b!111454))

(assert (= (and b!111455 res!92018) b!111453))

(assert (= (and b!111453 c!6777) b!111458))

(assert (= (and b!111453 (not c!6777)) b!111457))

(assert (= (and b!111457 res!92019) b!111452))

(assert (= (and b!111452 (not res!92017)) b!111456))

(assert (= (or b!111458 b!111456) bm!1403))

(declare-fun m!165821 () Bool)

(assert (=> b!111454 m!165821))

(assert (=> b!111455 m!164519))

(declare-fun m!165823 () Bool)

(assert (=> b!111455 m!165823))

(declare-fun m!165825 () Bool)

(assert (=> b!111457 m!165825))

(declare-fun m!165827 () Bool)

(assert (=> b!111457 m!165827))

(assert (=> b!111457 m!165825))

(assert (=> b!111457 m!165827))

(declare-fun m!165829 () Bool)

(assert (=> b!111457 m!165829))

(assert (=> bm!1403 m!165827))

(declare-fun m!165831 () Bool)

(assert (=> bm!1403 m!165831))

(declare-fun m!165833 () Bool)

(assert (=> bm!1403 m!165833))

(declare-fun m!165835 () Bool)

(assert (=> bm!1403 m!165835))

(assert (=> bm!1403 m!165825))

(assert (=> b!110910 d!35282))

(assert (=> b!110910 d!34962))

(declare-fun d!35284 () Bool)

(declare-fun e!73132 () Bool)

(assert (=> d!35284 e!73132))

(declare-fun res!92021 () Bool)

(assert (=> d!35284 (=> (not res!92021) (not e!73132))))

(declare-fun lt!169100 () (_ BitVec 64))

(declare-fun lt!169099 () (_ BitVec 64))

(declare-fun lt!169104 () (_ BitVec 64))

(assert (=> d!35284 (= res!92021 (= lt!169100 (bvsub lt!169104 lt!169099)))))

(assert (=> d!35284 (or (= (bvand lt!169104 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!169099 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!169104 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!169104 lt!169099) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35284 (= lt!169099 (remainingBits!0 ((_ sign_extend 32) (size!2313 (buf!2710 (_1!4874 lt!167808)))) ((_ sign_extend 32) (currentByte!5267 (_1!4874 lt!167808))) ((_ sign_extend 32) (currentBit!5262 (_1!4874 lt!167808)))))))

(declare-fun lt!169102 () (_ BitVec 64))

(declare-fun lt!169103 () (_ BitVec 64))

(assert (=> d!35284 (= lt!169104 (bvmul lt!169102 lt!169103))))

(assert (=> d!35284 (or (= lt!169102 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!169103 (bvsdiv (bvmul lt!169102 lt!169103) lt!169102)))))

(assert (=> d!35284 (= lt!169103 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!35284 (= lt!169102 ((_ sign_extend 32) (size!2313 (buf!2710 (_1!4874 lt!167808)))))))

(assert (=> d!35284 (= lt!169100 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5267 (_1!4874 lt!167808))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5262 (_1!4874 lt!167808)))))))

(assert (=> d!35284 (invariant!0 (currentBit!5262 (_1!4874 lt!167808)) (currentByte!5267 (_1!4874 lt!167808)) (size!2313 (buf!2710 (_1!4874 lt!167808))))))

(assert (=> d!35284 (= (bitIndex!0 (size!2313 (buf!2710 (_1!4874 lt!167808))) (currentByte!5267 (_1!4874 lt!167808)) (currentBit!5262 (_1!4874 lt!167808))) lt!169100)))

(declare-fun b!111459 () Bool)

(declare-fun res!92022 () Bool)

(assert (=> b!111459 (=> (not res!92022) (not e!73132))))

(assert (=> b!111459 (= res!92022 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!169100))))

(declare-fun b!111460 () Bool)

(declare-fun lt!169101 () (_ BitVec 64))

(assert (=> b!111460 (= e!73132 (bvsle lt!169100 (bvmul lt!169101 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!111460 (or (= lt!169101 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!169101 #b0000000000000000000000000000000000000000000000000000000000001000) lt!169101)))))

(assert (=> b!111460 (= lt!169101 ((_ sign_extend 32) (size!2313 (buf!2710 (_1!4874 lt!167808)))))))

(assert (= (and d!35284 res!92021) b!111459))

(assert (= (and b!111459 res!92022) b!111460))

(declare-fun m!165837 () Bool)

(assert (=> d!35284 m!165837))

(declare-fun m!165839 () Bool)

(assert (=> d!35284 m!165839))

(assert (=> d!34846 d!35284))

(declare-fun d!35286 () Bool)

(declare-fun e!73135 () Bool)

(assert (=> d!35286 e!73135))

(declare-fun res!92025 () Bool)

(assert (=> d!35286 (=> (not res!92025) (not e!73135))))

(declare-fun lt!169112 () tuple2!9234)

(declare-fun lt!169111 () tuple2!9234)

(assert (=> d!35286 (= res!92025 (= (bitIndex!0 (size!2313 (buf!2710 (_1!4874 lt!169112))) (currentByte!5267 (_1!4874 lt!169112)) (currentBit!5262 (_1!4874 lt!169112))) (bitIndex!0 (size!2313 (buf!2710 (_1!4874 lt!169111))) (currentByte!5267 (_1!4874 lt!169111)) (currentBit!5262 (_1!4874 lt!169111)))))))

(declare-fun lt!169113 () BitStream!4100)

(assert (=> d!35286 (= lt!169111 (readBitPure!0 lt!169113))))

(assert (=> d!35286 (= lt!169112 (readBitPure!0 lt!167770))))

(assert (=> d!35286 (= lt!169113 (BitStream!4101 (buf!2710 (_2!4873 lt!167766)) (currentByte!5267 lt!167770) (currentBit!5262 lt!167770)))))

(assert (=> d!35286 (invariant!0 (currentBit!5262 lt!167770) (currentByte!5267 lt!167770) (size!2313 (buf!2710 (_2!4873 lt!167766))))))

(assert (=> d!35286 true))

(declare-fun _$9!48 () Unit!6794)

(assert (=> d!35286 (= (choose!50 lt!167770 (_2!4873 lt!167766) lt!167809 lt!167810 (tuple2!9235 (_1!4874 lt!167810) (_2!4874 lt!167810)) (_1!4874 lt!167810) (_2!4874 lt!167810) lt!167808 (tuple2!9235 (_1!4874 lt!167808) (_2!4874 lt!167808)) (_1!4874 lt!167808) (_2!4874 lt!167808)) _$9!48)))

(declare-fun b!111463 () Bool)

(assert (=> b!111463 (= e!73135 (= (_2!4874 lt!169112) (_2!4874 lt!169111)))))

(assert (= (and d!35286 res!92025) b!111463))

(declare-fun m!165841 () Bool)

(assert (=> d!35286 m!165841))

(assert (=> d!35286 m!164553))

(declare-fun m!165843 () Bool)

(assert (=> d!35286 m!165843))

(assert (=> d!35286 m!164501))

(declare-fun m!165845 () Bool)

(assert (=> d!35286 m!165845))

(assert (=> d!34846 d!35286))

(declare-fun d!35288 () Bool)

(declare-fun lt!169114 () tuple2!9242)

(assert (=> d!35288 (= lt!169114 (readBit!0 lt!167809))))

(assert (=> d!35288 (= (readBitPure!0 lt!167809) (tuple2!9235 (_2!4878 lt!169114) (_1!4878 lt!169114)))))

(declare-fun bs!8627 () Bool)

(assert (= bs!8627 d!35288))

(declare-fun m!165847 () Bool)

(assert (=> bs!8627 m!165847))

(assert (=> d!34846 d!35288))

(assert (=> d!34846 d!34890))

(declare-fun d!35290 () Bool)

(assert (=> d!35290 (= (invariant!0 (currentBit!5262 lt!167770) (currentByte!5267 lt!167770) (size!2313 (buf!2710 (_2!4873 lt!167766)))) (and (bvsge (currentBit!5262 lt!167770) #b00000000000000000000000000000000) (bvslt (currentBit!5262 lt!167770) #b00000000000000000000000000001000) (bvsge (currentByte!5267 lt!167770) #b00000000000000000000000000000000) (or (bvslt (currentByte!5267 lt!167770) (size!2313 (buf!2710 (_2!4873 lt!167766)))) (and (= (currentBit!5262 lt!167770) #b00000000000000000000000000000000) (= (currentByte!5267 lt!167770) (size!2313 (buf!2710 (_2!4873 lt!167766))))))))))

(assert (=> d!34846 d!35290))

(declare-fun d!35292 () Bool)

(declare-fun e!73136 () Bool)

(assert (=> d!35292 e!73136))

(declare-fun res!92026 () Bool)

(assert (=> d!35292 (=> (not res!92026) (not e!73136))))

(declare-fun lt!169115 () (_ BitVec 64))

(declare-fun lt!169120 () (_ BitVec 64))

(declare-fun lt!169116 () (_ BitVec 64))

(assert (=> d!35292 (= res!92026 (= lt!169116 (bvsub lt!169120 lt!169115)))))

(assert (=> d!35292 (or (= (bvand lt!169120 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!169115 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!169120 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!169120 lt!169115) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35292 (= lt!169115 (remainingBits!0 ((_ sign_extend 32) (size!2313 (buf!2710 (_1!4874 lt!167810)))) ((_ sign_extend 32) (currentByte!5267 (_1!4874 lt!167810))) ((_ sign_extend 32) (currentBit!5262 (_1!4874 lt!167810)))))))

(declare-fun lt!169118 () (_ BitVec 64))

(declare-fun lt!169119 () (_ BitVec 64))

(assert (=> d!35292 (= lt!169120 (bvmul lt!169118 lt!169119))))

(assert (=> d!35292 (or (= lt!169118 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!169119 (bvsdiv (bvmul lt!169118 lt!169119) lt!169118)))))

(assert (=> d!35292 (= lt!169119 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!35292 (= lt!169118 ((_ sign_extend 32) (size!2313 (buf!2710 (_1!4874 lt!167810)))))))

(assert (=> d!35292 (= lt!169116 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5267 (_1!4874 lt!167810))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5262 (_1!4874 lt!167810)))))))

(assert (=> d!35292 (invariant!0 (currentBit!5262 (_1!4874 lt!167810)) (currentByte!5267 (_1!4874 lt!167810)) (size!2313 (buf!2710 (_1!4874 lt!167810))))))

(assert (=> d!35292 (= (bitIndex!0 (size!2313 (buf!2710 (_1!4874 lt!167810))) (currentByte!5267 (_1!4874 lt!167810)) (currentBit!5262 (_1!4874 lt!167810))) lt!169116)))

(declare-fun b!111464 () Bool)

(declare-fun res!92027 () Bool)

(assert (=> b!111464 (=> (not res!92027) (not e!73136))))

(assert (=> b!111464 (= res!92027 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!169116))))

(declare-fun b!111465 () Bool)

(declare-fun lt!169117 () (_ BitVec 64))

(assert (=> b!111465 (= e!73136 (bvsle lt!169116 (bvmul lt!169117 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!111465 (or (= lt!169117 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!169117 #b0000000000000000000000000000000000000000000000000000000000001000) lt!169117)))))

(assert (=> b!111465 (= lt!169117 ((_ sign_extend 32) (size!2313 (buf!2710 (_1!4874 lt!167810)))))))

(assert (= (and d!35292 res!92026) b!111464))

(assert (= (and b!111464 res!92027) b!111465))

(declare-fun m!165849 () Bool)

(assert (=> d!35292 m!165849))

(declare-fun m!165851 () Bool)

(assert (=> d!35292 m!165851))

(assert (=> d!34846 d!35292))

(declare-fun d!35294 () Bool)

(declare-fun e!73137 () Bool)

(assert (=> d!35294 e!73137))

(declare-fun res!92028 () Bool)

(assert (=> d!35294 (=> (not res!92028) (not e!73137))))

(assert (=> d!35294 (= res!92028 (= (buf!2710 (_2!4873 (increaseBitIndex!0 (_1!4875 lt!167757)))) (buf!2710 (_1!4875 lt!167757))))))

(declare-fun lt!169122 () Bool)

(assert (=> d!35294 (= lt!169122 (not (= (bvand ((_ sign_extend 24) (select (arr!2906 (buf!2710 (_1!4875 lt!167757))) (currentByte!5267 (_1!4875 lt!167757)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5262 (_1!4875 lt!167757))))) #b00000000000000000000000000000000)))))

(declare-fun lt!169124 () tuple2!9242)

(assert (=> d!35294 (= lt!169124 (tuple2!9243 (not (= (bvand ((_ sign_extend 24) (select (arr!2906 (buf!2710 (_1!4875 lt!167757))) (currentByte!5267 (_1!4875 lt!167757)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5262 (_1!4875 lt!167757))))) #b00000000000000000000000000000000)) (_2!4873 (increaseBitIndex!0 (_1!4875 lt!167757)))))))

(assert (=> d!35294 (validate_offset_bit!0 ((_ sign_extend 32) (size!2313 (buf!2710 (_1!4875 lt!167757)))) ((_ sign_extend 32) (currentByte!5267 (_1!4875 lt!167757))) ((_ sign_extend 32) (currentBit!5262 (_1!4875 lt!167757))))))

(assert (=> d!35294 (= (readBit!0 (_1!4875 lt!167757)) lt!169124)))

(declare-fun lt!169121 () (_ BitVec 64))

(declare-fun lt!169123 () (_ BitVec 64))

(declare-fun b!111466 () Bool)

(assert (=> b!111466 (= e!73137 (= (bitIndex!0 (size!2313 (buf!2710 (_2!4873 (increaseBitIndex!0 (_1!4875 lt!167757))))) (currentByte!5267 (_2!4873 (increaseBitIndex!0 (_1!4875 lt!167757)))) (currentBit!5262 (_2!4873 (increaseBitIndex!0 (_1!4875 lt!167757))))) (bvadd lt!169121 lt!169123)))))

(assert (=> b!111466 (or (not (= (bvand lt!169121 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!169123 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!169121 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!169121 lt!169123) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!111466 (= lt!169123 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!111466 (= lt!169121 (bitIndex!0 (size!2313 (buf!2710 (_1!4875 lt!167757))) (currentByte!5267 (_1!4875 lt!167757)) (currentBit!5262 (_1!4875 lt!167757))))))

(declare-fun lt!169125 () Bool)

(assert (=> b!111466 (= lt!169125 (not (= (bvand ((_ sign_extend 24) (select (arr!2906 (buf!2710 (_1!4875 lt!167757))) (currentByte!5267 (_1!4875 lt!167757)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5262 (_1!4875 lt!167757))))) #b00000000000000000000000000000000)))))

(declare-fun lt!169127 () Bool)

(assert (=> b!111466 (= lt!169127 (not (= (bvand ((_ sign_extend 24) (select (arr!2906 (buf!2710 (_1!4875 lt!167757))) (currentByte!5267 (_1!4875 lt!167757)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5262 (_1!4875 lt!167757))))) #b00000000000000000000000000000000)))))

(declare-fun lt!169126 () Bool)

(assert (=> b!111466 (= lt!169126 (not (= (bvand ((_ sign_extend 24) (select (arr!2906 (buf!2710 (_1!4875 lt!167757))) (currentByte!5267 (_1!4875 lt!167757)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5262 (_1!4875 lt!167757))))) #b00000000000000000000000000000000)))))

(assert (= (and d!35294 res!92028) b!111466))

(declare-fun m!165853 () Bool)

(assert (=> d!35294 m!165853))

(declare-fun m!165855 () Bool)

(assert (=> d!35294 m!165855))

(declare-fun m!165857 () Bool)

(assert (=> d!35294 m!165857))

(declare-fun m!165859 () Bool)

(assert (=> d!35294 m!165859))

(assert (=> b!111466 m!165855))

(declare-fun m!165861 () Bool)

(assert (=> b!111466 m!165861))

(declare-fun m!165863 () Bool)

(assert (=> b!111466 m!165863))

(assert (=> b!111466 m!165857))

(assert (=> b!111466 m!165853))

(assert (=> d!34876 d!35294))

(declare-fun b!111481 () Bool)

(declare-fun res!92041 () Bool)

(declare-fun e!73145 () Bool)

(assert (=> b!111481 (=> (not res!92041) (not e!73145))))

(declare-fun lt!169148 () (_ BitVec 64))

(declare-fun lt!169154 () tuple2!9246)

(declare-fun lt!169146 () (_ BitVec 64))

(assert (=> b!111481 (= res!92041 (= (bitIndex!0 (size!2313 (buf!2710 (_2!4880 lt!169154))) (currentByte!5267 (_2!4880 lt!169154)) (currentBit!5262 (_2!4880 lt!169154))) (bvadd lt!169148 lt!169146)))))

(assert (=> b!111481 (or (not (= (bvand lt!169148 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!169146 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!169148 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!169148 lt!169146) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!111481 (= lt!169146 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!111481 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!111481 (= lt!169148 (bitIndex!0 (size!2313 (buf!2710 (_1!4875 lt!167765))) (currentByte!5267 (_1!4875 lt!167765)) (currentBit!5262 (_1!4875 lt!167765))))))

(declare-fun b!111482 () Bool)

(declare-fun e!73146 () Bool)

(assert (=> b!111482 (= e!73145 e!73146)))

(declare-fun res!92043 () Bool)

(assert (=> b!111482 (=> res!92043 e!73146)))

(assert (=> b!111482 (= res!92043 (bvsge (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(declare-fun d!35296 () Bool)

(assert (=> d!35296 e!73145))

(declare-fun res!92040 () Bool)

(assert (=> d!35296 (=> (not res!92040) (not e!73145))))

(assert (=> d!35296 (= res!92040 (= (buf!2710 (_2!4880 lt!169154)) (buf!2710 (_1!4875 lt!167765))))))

(declare-fun e!73144 () tuple2!9246)

(assert (=> d!35296 (= lt!169154 e!73144)))

(declare-fun c!6780 () Bool)

(assert (=> d!35296 (= c!6780 (= nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> d!35296 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!35296 (= (readNLeastSignificantBitsLoop!0 (_1!4875 lt!167765) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) (bvor lt!167763 (ite (_2!4874 lt!167754) lt!167756 #b0000000000000000000000000000000000000000000000000000000000000000))) lt!169154)))

(declare-fun b!111483 () Bool)

(declare-fun res!92039 () Bool)

(assert (=> b!111483 (=> (not res!92039) (not e!73145))))

(assert (=> b!111483 (= res!92039 (= (bvand (_1!4880 lt!169154) (onesLSBLong!0 nBits!396)) (_1!4880 lt!169154)))))

(declare-fun b!111484 () Bool)

(declare-fun lt!169147 () tuple2!9246)

(assert (=> b!111484 (= e!73144 (tuple2!9247 (_1!4880 lt!169147) (_2!4880 lt!169147)))))

(declare-fun lt!169152 () tuple2!9242)

(assert (=> b!111484 (= lt!169152 (readBit!0 (_1!4875 lt!167765)))))

(assert (=> b!111484 (= lt!169147 (readNLeastSignificantBitsLoop!0 (_2!4878 lt!169152) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor (bvor lt!167763 (ite (_2!4874 lt!167754) lt!167756 #b0000000000000000000000000000000000000000000000000000000000000000)) (ite (_1!4878 lt!169152) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!111485 () Bool)

(declare-fun res!92042 () Bool)

(assert (=> b!111485 (=> (not res!92042) (not e!73145))))

(declare-fun lt!169150 () (_ BitVec 64))

(declare-fun lt!169153 () (_ BitVec 64))

(assert (=> b!111485 (= res!92042 (= (bvlshr (_1!4880 lt!169154) lt!169153) (bvlshr (bvor lt!167763 (ite (_2!4874 lt!167754) lt!167756 #b0000000000000000000000000000000000000000000000000000000000000000)) lt!169150)))))

(assert (=> b!111485 (and (bvsge lt!169150 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!169150 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!111485 (= lt!169150 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!111485 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!111485 (and (bvsge lt!169153 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!169153 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!111485 (= lt!169153 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!111485 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(declare-fun b!111486 () Bool)

(assert (=> b!111486 (= e!73144 (tuple2!9247 (bvor lt!167763 (ite (_2!4874 lt!167754) lt!167756 #b0000000000000000000000000000000000000000000000000000000000000000)) (_1!4875 lt!167765)))))

(declare-fun b!111487 () Bool)

(declare-fun lt!169149 () (_ BitVec 64))

(assert (=> b!111487 (= e!73146 (= (= (bvand (bvlshr (_1!4880 lt!169154) lt!169149) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!4874 (readBitPure!0 (_1!4875 lt!167765)))))))

(assert (=> b!111487 (and (bvsge lt!169149 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!169149 #b0000000000000000000000000000000000000000000000000000000001000000))))

(declare-fun lt!169151 () (_ BitVec 32))

(assert (=> b!111487 (= lt!169149 ((_ sign_extend 32) (bvsub lt!169151 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!111487 (or (= (bvand lt!169151 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand lt!169151 #b10000000000000000000000000000000) (bvand (bvsub lt!169151 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!111487 (= lt!169151 (bvsub nBits!396 #b00000000000000000000000000000001))))

(assert (=> b!111487 (or (= (bvand nBits!396 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))

(assert (= (and d!35296 c!6780) b!111486))

(assert (= (and d!35296 (not c!6780)) b!111484))

(assert (= (and d!35296 res!92040) b!111481))

(assert (= (and b!111481 res!92041) b!111485))

(assert (= (and b!111485 res!92042) b!111483))

(assert (= (and b!111483 res!92039) b!111482))

(assert (= (and b!111482 (not res!92043)) b!111487))

(declare-fun m!165865 () Bool)

(assert (=> b!111481 m!165865))

(declare-fun m!165867 () Bool)

(assert (=> b!111481 m!165867))

(assert (=> b!111483 m!164515))

(declare-fun m!165869 () Bool)

(assert (=> b!111484 m!165869))

(declare-fun m!165871 () Bool)

(assert (=> b!111484 m!165871))

(declare-fun m!165873 () Bool)

(assert (=> b!111487 m!165873))

(assert (=> d!34942 d!35296))

(declare-fun d!35298 () Bool)

(assert (=> d!35298 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2313 (buf!2710 (_2!4873 lt!168263)))) ((_ sign_extend 32) (currentByte!5267 (_2!4873 lt!167769))) ((_ sign_extend 32) (currentBit!5262 (_2!4873 lt!167769))) lt!168272) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2313 (buf!2710 (_2!4873 lt!168263)))) ((_ sign_extend 32) (currentByte!5267 (_2!4873 lt!167769))) ((_ sign_extend 32) (currentBit!5262 (_2!4873 lt!167769)))) lt!168272))))

(declare-fun bs!8628 () Bool)

(assert (= bs!8628 d!35298))

(declare-fun m!165875 () Bool)

(assert (=> bs!8628 m!165875))

(assert (=> b!111025 d!35298))

(declare-fun b!111488 () Bool)

(declare-fun res!92044 () Bool)

(declare-fun e!73148 () Bool)

(assert (=> b!111488 (=> (not res!92044) (not e!73148))))

(declare-fun lt!169174 () tuple2!9236)

(assert (=> b!111488 (= res!92044 (isPrefixOf!0 (_1!4875 lt!169174) (_2!4873 lt!167769)))))

(declare-fun lt!169157 () (_ BitVec 64))

(declare-fun b!111490 () Bool)

(declare-fun lt!169164 () (_ BitVec 64))

(assert (=> b!111490 (= e!73148 (= (_1!4875 lt!169174) (withMovedBitIndex!0 (_2!4875 lt!169174) (bvsub lt!169164 lt!169157))))))

(assert (=> b!111490 (or (= (bvand lt!169164 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!169157 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!169164 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!169164 lt!169157) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!111490 (= lt!169157 (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!168263))) (currentByte!5267 (_2!4873 lt!168263)) (currentBit!5262 (_2!4873 lt!168263))))))

(assert (=> b!111490 (= lt!169164 (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!167769))) (currentByte!5267 (_2!4873 lt!167769)) (currentBit!5262 (_2!4873 lt!167769))))))

(declare-fun b!111491 () Bool)

(declare-fun e!73147 () Unit!6794)

(declare-fun lt!169165 () Unit!6794)

(assert (=> b!111491 (= e!73147 lt!169165)))

(declare-fun lt!169155 () (_ BitVec 64))

(assert (=> b!111491 (= lt!169155 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!169171 () (_ BitVec 64))

(assert (=> b!111491 (= lt!169171 (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!167769))) (currentByte!5267 (_2!4873 lt!167769)) (currentBit!5262 (_2!4873 lt!167769))))))

(assert (=> b!111491 (= lt!169165 (arrayBitRangesEqSymmetric!0 (buf!2710 (_2!4873 lt!167769)) (buf!2710 (_2!4873 lt!168263)) lt!169155 lt!169171))))

(assert (=> b!111491 (arrayBitRangesEq!0 (buf!2710 (_2!4873 lt!168263)) (buf!2710 (_2!4873 lt!167769)) lt!169155 lt!169171)))

(declare-fun b!111492 () Bool)

(declare-fun res!92046 () Bool)

(assert (=> b!111492 (=> (not res!92046) (not e!73148))))

(assert (=> b!111492 (= res!92046 (isPrefixOf!0 (_2!4875 lt!169174) (_2!4873 lt!168263)))))

(declare-fun d!35300 () Bool)

(assert (=> d!35300 e!73148))

(declare-fun res!92045 () Bool)

(assert (=> d!35300 (=> (not res!92045) (not e!73148))))

(assert (=> d!35300 (= res!92045 (isPrefixOf!0 (_1!4875 lt!169174) (_2!4875 lt!169174)))))

(declare-fun lt!169163 () BitStream!4100)

(assert (=> d!35300 (= lt!169174 (tuple2!9237 lt!169163 (_2!4873 lt!168263)))))

(declare-fun lt!169169 () Unit!6794)

(declare-fun lt!169156 () Unit!6794)

(assert (=> d!35300 (= lt!169169 lt!169156)))

(assert (=> d!35300 (isPrefixOf!0 lt!169163 (_2!4873 lt!168263))))

(assert (=> d!35300 (= lt!169156 (lemmaIsPrefixTransitive!0 lt!169163 (_2!4873 lt!168263) (_2!4873 lt!168263)))))

(declare-fun lt!169168 () Unit!6794)

(declare-fun lt!169166 () Unit!6794)

(assert (=> d!35300 (= lt!169168 lt!169166)))

(assert (=> d!35300 (isPrefixOf!0 lt!169163 (_2!4873 lt!168263))))

(assert (=> d!35300 (= lt!169166 (lemmaIsPrefixTransitive!0 lt!169163 (_2!4873 lt!167769) (_2!4873 lt!168263)))))

(declare-fun lt!169159 () Unit!6794)

(assert (=> d!35300 (= lt!169159 e!73147)))

(declare-fun c!6781 () Bool)

(assert (=> d!35300 (= c!6781 (not (= (size!2313 (buf!2710 (_2!4873 lt!167769))) #b00000000000000000000000000000000)))))

(declare-fun lt!169173 () Unit!6794)

(declare-fun lt!169167 () Unit!6794)

(assert (=> d!35300 (= lt!169173 lt!169167)))

(assert (=> d!35300 (isPrefixOf!0 (_2!4873 lt!168263) (_2!4873 lt!168263))))

(assert (=> d!35300 (= lt!169167 (lemmaIsPrefixRefl!0 (_2!4873 lt!168263)))))

(declare-fun lt!169161 () Unit!6794)

(declare-fun lt!169170 () Unit!6794)

(assert (=> d!35300 (= lt!169161 lt!169170)))

(assert (=> d!35300 (= lt!169170 (lemmaIsPrefixRefl!0 (_2!4873 lt!168263)))))

(declare-fun lt!169158 () Unit!6794)

(declare-fun lt!169162 () Unit!6794)

(assert (=> d!35300 (= lt!169158 lt!169162)))

(assert (=> d!35300 (isPrefixOf!0 lt!169163 lt!169163)))

(assert (=> d!35300 (= lt!169162 (lemmaIsPrefixRefl!0 lt!169163))))

(declare-fun lt!169160 () Unit!6794)

(declare-fun lt!169172 () Unit!6794)

(assert (=> d!35300 (= lt!169160 lt!169172)))

(assert (=> d!35300 (isPrefixOf!0 (_2!4873 lt!167769) (_2!4873 lt!167769))))

(assert (=> d!35300 (= lt!169172 (lemmaIsPrefixRefl!0 (_2!4873 lt!167769)))))

(assert (=> d!35300 (= lt!169163 (BitStream!4101 (buf!2710 (_2!4873 lt!168263)) (currentByte!5267 (_2!4873 lt!167769)) (currentBit!5262 (_2!4873 lt!167769))))))

(assert (=> d!35300 (isPrefixOf!0 (_2!4873 lt!167769) (_2!4873 lt!168263))))

(assert (=> d!35300 (= (reader!0 (_2!4873 lt!167769) (_2!4873 lt!168263)) lt!169174)))

(declare-fun b!111489 () Bool)

(declare-fun Unit!6829 () Unit!6794)

(assert (=> b!111489 (= e!73147 Unit!6829)))

(assert (= (and d!35300 c!6781) b!111491))

(assert (= (and d!35300 (not c!6781)) b!111489))

(assert (= (and d!35300 res!92045) b!111488))

(assert (= (and b!111488 res!92044) b!111492))

(assert (= (and b!111492 res!92046) b!111490))

(declare-fun m!165877 () Bool)

(assert (=> b!111492 m!165877))

(declare-fun m!165879 () Bool)

(assert (=> b!111490 m!165879))

(assert (=> b!111490 m!164819))

(assert (=> b!111490 m!164517))

(declare-fun m!165881 () Bool)

(assert (=> b!111488 m!165881))

(declare-fun m!165883 () Bool)

(assert (=> d!35300 m!165883))

(declare-fun m!165885 () Bool)

(assert (=> d!35300 m!165885))

(declare-fun m!165887 () Bool)

(assert (=> d!35300 m!165887))

(declare-fun m!165889 () Bool)

(assert (=> d!35300 m!165889))

(assert (=> d!35300 m!164595))

(declare-fun m!165891 () Bool)

(assert (=> d!35300 m!165891))

(declare-fun m!165893 () Bool)

(assert (=> d!35300 m!165893))

(assert (=> d!35300 m!164765))

(assert (=> d!35300 m!164603))

(declare-fun m!165895 () Bool)

(assert (=> d!35300 m!165895))

(declare-fun m!165897 () Bool)

(assert (=> d!35300 m!165897))

(assert (=> b!111491 m!164517))

(declare-fun m!165899 () Bool)

(assert (=> b!111491 m!165899))

(declare-fun m!165901 () Bool)

(assert (=> b!111491 m!165901))

(assert (=> b!111025 d!35300))

(declare-fun d!35302 () Bool)

(assert (=> d!35302 (= (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!111025 d!35302))

(declare-fun lt!169175 () tuple2!9246)

(declare-fun d!35304 () Bool)

(assert (=> d!35304 (= lt!169175 (readNLeastSignificantBitsLoop!0 (_1!4875 lt!168282) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!168275))))

(assert (=> d!35304 (= (readNLeastSignificantBitsLoopPure!0 (_1!4875 lt!168282) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!168275) (tuple2!9239 (_2!4880 lt!169175) (_1!4880 lt!169175)))))

(declare-fun bs!8629 () Bool)

(assert (= bs!8629 d!35304))

(declare-fun m!165903 () Bool)

(assert (=> bs!8629 m!165903))

(assert (=> b!111025 d!35304))

(declare-fun d!35306 () Bool)

(assert (=> d!35306 (validate_offset_bits!1 ((_ sign_extend 32) (size!2313 (buf!2710 (_2!4873 lt!168263)))) ((_ sign_extend 32) (currentByte!5267 (_2!4873 lt!167769))) ((_ sign_extend 32) (currentBit!5262 (_2!4873 lt!167769))) lt!168272)))

(declare-fun lt!169176 () Unit!6794)

(assert (=> d!35306 (= lt!169176 (choose!9 (_2!4873 lt!167769) (buf!2710 (_2!4873 lt!168263)) lt!168272 (BitStream!4101 (buf!2710 (_2!4873 lt!168263)) (currentByte!5267 (_2!4873 lt!167769)) (currentBit!5262 (_2!4873 lt!167769)))))))

(assert (=> d!35306 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4873 lt!167769) (buf!2710 (_2!4873 lt!168263)) lt!168272) lt!169176)))

(declare-fun bs!8630 () Bool)

(assert (= bs!8630 d!35306))

(assert (=> bs!8630 m!164757))

(declare-fun m!165905 () Bool)

(assert (=> bs!8630 m!165905))

(assert (=> b!111025 d!35306))

(declare-fun d!35308 () Bool)

(assert (=> d!35308 (= (remainingBits!0 ((_ sign_extend 32) (size!2313 (buf!2710 (_1!4874 lt!167752)))) ((_ sign_extend 32) (currentByte!5267 (_1!4874 lt!167752))) ((_ sign_extend 32) (currentBit!5262 (_1!4874 lt!167752)))) (bvsub (bvmul ((_ sign_extend 32) (size!2313 (buf!2710 (_1!4874 lt!167752)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5267 (_1!4874 lt!167752))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5262 (_1!4874 lt!167752))))))))

(assert (=> d!34892 d!35308))

(declare-fun d!35310 () Bool)

(assert (=> d!35310 (= (invariant!0 (currentBit!5262 (_1!4874 lt!167752)) (currentByte!5267 (_1!4874 lt!167752)) (size!2313 (buf!2710 (_1!4874 lt!167752)))) (and (bvsge (currentBit!5262 (_1!4874 lt!167752)) #b00000000000000000000000000000000) (bvslt (currentBit!5262 (_1!4874 lt!167752)) #b00000000000000000000000000001000) (bvsge (currentByte!5267 (_1!4874 lt!167752)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5267 (_1!4874 lt!167752)) (size!2313 (buf!2710 (_1!4874 lt!167752)))) (and (= (currentBit!5262 (_1!4874 lt!167752)) #b00000000000000000000000000000000) (= (currentByte!5267 (_1!4874 lt!167752)) (size!2313 (buf!2710 (_1!4874 lt!167752))))))))))

(assert (=> d!34892 d!35310))

(declare-fun d!35312 () Bool)

(declare-fun res!92049 () Bool)

(declare-fun e!73150 () Bool)

(assert (=> d!35312 (=> (not res!92049) (not e!73150))))

(assert (=> d!35312 (= res!92049 (= (size!2313 (buf!2710 (_2!4875 lt!167903))) (size!2313 (buf!2710 (_2!4873 lt!167766)))))))

(assert (=> d!35312 (= (isPrefixOf!0 (_2!4875 lt!167903) (_2!4873 lt!167766)) e!73150)))

(declare-fun b!111493 () Bool)

(declare-fun res!92048 () Bool)

(assert (=> b!111493 (=> (not res!92048) (not e!73150))))

(assert (=> b!111493 (= res!92048 (bvsle (bitIndex!0 (size!2313 (buf!2710 (_2!4875 lt!167903))) (currentByte!5267 (_2!4875 lt!167903)) (currentBit!5262 (_2!4875 lt!167903))) (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!167766))) (currentByte!5267 (_2!4873 lt!167766)) (currentBit!5262 (_2!4873 lt!167766)))))))

(declare-fun b!111494 () Bool)

(declare-fun e!73149 () Bool)

(assert (=> b!111494 (= e!73150 e!73149)))

(declare-fun res!92047 () Bool)

(assert (=> b!111494 (=> res!92047 e!73149)))

(assert (=> b!111494 (= res!92047 (= (size!2313 (buf!2710 (_2!4875 lt!167903))) #b00000000000000000000000000000000))))

(declare-fun b!111495 () Bool)

(assert (=> b!111495 (= e!73149 (arrayBitRangesEq!0 (buf!2710 (_2!4875 lt!167903)) (buf!2710 (_2!4873 lt!167766)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2313 (buf!2710 (_2!4875 lt!167903))) (currentByte!5267 (_2!4875 lt!167903)) (currentBit!5262 (_2!4875 lt!167903)))))))

(assert (= (and d!35312 res!92049) b!111493))

(assert (= (and b!111493 res!92048) b!111494))

(assert (= (and b!111494 (not res!92047)) b!111495))

(assert (=> b!111493 m!165749))

(assert (=> b!111493 m!164583))

(assert (=> b!111495 m!165749))

(assert (=> b!111495 m!165749))

(declare-fun m!165907 () Bool)

(assert (=> b!111495 m!165907))

(assert (=> b!110898 d!35312))

(declare-fun d!35314 () Bool)

(assert (=> d!35314 (= (remainingBits!0 ((_ sign_extend 32) (size!2313 (buf!2710 (_2!4873 lt!167766)))) ((_ sign_extend 32) (currentByte!5267 thiss!1305)) ((_ sign_extend 32) (currentBit!5262 thiss!1305))) (bvsub (bvmul ((_ sign_extend 32) (size!2313 (buf!2710 (_2!4873 lt!167766)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5267 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5262 thiss!1305)))))))

(assert (=> d!34840 d!35314))

(declare-fun d!35316 () Bool)

(assert (=> d!35316 (= (remainingBits!0 ((_ sign_extend 32) (size!2313 (buf!2710 (_1!4874 lt!167751)))) ((_ sign_extend 32) (currentByte!5267 (_1!4874 lt!167751))) ((_ sign_extend 32) (currentBit!5262 (_1!4874 lt!167751)))) (bvsub (bvmul ((_ sign_extend 32) (size!2313 (buf!2710 (_1!4874 lt!167751)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5267 (_1!4874 lt!167751))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5262 (_1!4874 lt!167751))))))))

(assert (=> d!34818 d!35316))

(declare-fun d!35318 () Bool)

(assert (=> d!35318 (= (invariant!0 (currentBit!5262 (_1!4874 lt!167751)) (currentByte!5267 (_1!4874 lt!167751)) (size!2313 (buf!2710 (_1!4874 lt!167751)))) (and (bvsge (currentBit!5262 (_1!4874 lt!167751)) #b00000000000000000000000000000000) (bvslt (currentBit!5262 (_1!4874 lt!167751)) #b00000000000000000000000000001000) (bvsge (currentByte!5267 (_1!4874 lt!167751)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5267 (_1!4874 lt!167751)) (size!2313 (buf!2710 (_1!4874 lt!167751)))) (and (= (currentBit!5262 (_1!4874 lt!167751)) #b00000000000000000000000000000000) (= (currentByte!5267 (_1!4874 lt!167751)) (size!2313 (buf!2710 (_1!4874 lt!167751))))))))))

(assert (=> d!34818 d!35318))

(assert (=> b!110908 d!34962))

(assert (=> b!110908 d!35280))

(assert (=> d!34830 d!35218))

(declare-fun d!35320 () Bool)

(assert (=> d!35320 (= (remainingBits!0 ((_ sign_extend 32) (size!2313 (buf!2710 thiss!1305))) ((_ sign_extend 32) (currentByte!5267 thiss!1305)) ((_ sign_extend 32) (currentBit!5262 thiss!1305))) (bvsub (bvmul ((_ sign_extend 32) (size!2313 (buf!2710 thiss!1305))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5267 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5262 thiss!1305)))))))

(assert (=> d!34962 d!35320))

(declare-fun d!35322 () Bool)

(assert (=> d!35322 (= (invariant!0 (currentBit!5262 thiss!1305) (currentByte!5267 thiss!1305) (size!2313 (buf!2710 thiss!1305))) (and (bvsge (currentBit!5262 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5262 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5267 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5267 thiss!1305) (size!2313 (buf!2710 thiss!1305))) (and (= (currentBit!5262 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5267 thiss!1305) (size!2313 (buf!2710 thiss!1305)))))))))

(assert (=> d!34962 d!35322))

(declare-fun d!35324 () Bool)

(declare-fun res!92052 () Bool)

(declare-fun e!73152 () Bool)

(assert (=> d!35324 (=> (not res!92052) (not e!73152))))

(assert (=> d!35324 (= res!92052 (= (size!2313 (buf!2710 (_2!4873 lt!167769))) (size!2313 (buf!2710 (_2!4873 lt!168267)))))))

(assert (=> d!35324 (= (isPrefixOf!0 (_2!4873 lt!167769) (_2!4873 lt!168267)) e!73152)))

(declare-fun b!111496 () Bool)

(declare-fun res!92051 () Bool)

(assert (=> b!111496 (=> (not res!92051) (not e!73152))))

(assert (=> b!111496 (= res!92051 (bvsle (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!167769))) (currentByte!5267 (_2!4873 lt!167769)) (currentBit!5262 (_2!4873 lt!167769))) (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!168267))) (currentByte!5267 (_2!4873 lt!168267)) (currentBit!5262 (_2!4873 lt!168267)))))))

(declare-fun b!111497 () Bool)

(declare-fun e!73151 () Bool)

(assert (=> b!111497 (= e!73152 e!73151)))

(declare-fun res!92050 () Bool)

(assert (=> b!111497 (=> res!92050 e!73151)))

(assert (=> b!111497 (= res!92050 (= (size!2313 (buf!2710 (_2!4873 lt!167769))) #b00000000000000000000000000000000))))

(declare-fun b!111498 () Bool)

(assert (=> b!111498 (= e!73151 (arrayBitRangesEq!0 (buf!2710 (_2!4873 lt!167769)) (buf!2710 (_2!4873 lt!168267)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!167769))) (currentByte!5267 (_2!4873 lt!167769)) (currentBit!5262 (_2!4873 lt!167769)))))))

(assert (= (and d!35324 res!92052) b!111496))

(assert (= (and b!111496 res!92051) b!111497))

(assert (= (and b!111497 (not res!92050)) b!111498))

(assert (=> b!111496 m!164517))

(assert (=> b!111496 m!164753))

(assert (=> b!111498 m!164517))

(assert (=> b!111498 m!164517))

(declare-fun m!165909 () Bool)

(assert (=> b!111498 m!165909))

(assert (=> b!111023 d!35324))

(assert (=> d!34820 d!35322))

(declare-fun d!35326 () Bool)

(declare-fun lt!169177 () tuple2!9242)

(assert (=> d!35326 (= lt!169177 (readBit!0 (readerFrom!0 (_2!4873 lt!168267) (currentBit!5262 (_2!4873 lt!167769)) (currentByte!5267 (_2!4873 lt!167769)))))))

(assert (=> d!35326 (= (readBitPure!0 (readerFrom!0 (_2!4873 lt!168267) (currentBit!5262 (_2!4873 lt!167769)) (currentByte!5267 (_2!4873 lt!167769)))) (tuple2!9235 (_2!4878 lt!169177) (_1!4878 lt!169177)))))

(declare-fun bs!8631 () Bool)

(assert (= bs!8631 d!35326))

(assert (=> bs!8631 m!164821))

(declare-fun m!165911 () Bool)

(assert (=> bs!8631 m!165911))

(assert (=> b!111019 d!35326))

(declare-fun d!35328 () Bool)

(declare-fun e!73153 () Bool)

(assert (=> d!35328 e!73153))

(declare-fun res!92053 () Bool)

(assert (=> d!35328 (=> (not res!92053) (not e!73153))))

(assert (=> d!35328 (= res!92053 (invariant!0 (currentBit!5262 (_2!4873 lt!168267)) (currentByte!5267 (_2!4873 lt!168267)) (size!2313 (buf!2710 (_2!4873 lt!168267)))))))

(assert (=> d!35328 (= (readerFrom!0 (_2!4873 lt!168267) (currentBit!5262 (_2!4873 lt!167769)) (currentByte!5267 (_2!4873 lt!167769))) (BitStream!4101 (buf!2710 (_2!4873 lt!168267)) (currentByte!5267 (_2!4873 lt!167769)) (currentBit!5262 (_2!4873 lt!167769))))))

(declare-fun b!111499 () Bool)

(assert (=> b!111499 (= e!73153 (invariant!0 (currentBit!5262 (_2!4873 lt!167769)) (currentByte!5267 (_2!4873 lt!167769)) (size!2313 (buf!2710 (_2!4873 lt!168267)))))))

(assert (= (and d!35328 res!92053) b!111499))

(assert (=> d!35328 m!165731))

(declare-fun m!165913 () Bool)

(assert (=> b!111499 m!165913))

(assert (=> b!111019 d!35328))

(declare-fun d!35330 () Bool)

(declare-fun e!73154 () Bool)

(assert (=> d!35330 e!73154))

(declare-fun res!92054 () Bool)

(assert (=> d!35330 (=> (not res!92054) (not e!73154))))

(assert (=> d!35330 (= res!92054 (= (buf!2710 (_2!4873 (increaseBitIndex!0 lt!167770))) (buf!2710 lt!167770)))))

(declare-fun lt!169179 () Bool)

(assert (=> d!35330 (= lt!169179 (not (= (bvand ((_ sign_extend 24) (select (arr!2906 (buf!2710 lt!167770)) (currentByte!5267 lt!167770))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5262 lt!167770)))) #b00000000000000000000000000000000)))))

(declare-fun lt!169181 () tuple2!9242)

(assert (=> d!35330 (= lt!169181 (tuple2!9243 (not (= (bvand ((_ sign_extend 24) (select (arr!2906 (buf!2710 lt!167770)) (currentByte!5267 lt!167770))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5262 lt!167770)))) #b00000000000000000000000000000000)) (_2!4873 (increaseBitIndex!0 lt!167770))))))

(assert (=> d!35330 (validate_offset_bit!0 ((_ sign_extend 32) (size!2313 (buf!2710 lt!167770))) ((_ sign_extend 32) (currentByte!5267 lt!167770)) ((_ sign_extend 32) (currentBit!5262 lt!167770)))))

(assert (=> d!35330 (= (readBit!0 lt!167770) lt!169181)))

(declare-fun lt!169180 () (_ BitVec 64))

(declare-fun lt!169178 () (_ BitVec 64))

(declare-fun b!111500 () Bool)

(assert (=> b!111500 (= e!73154 (= (bitIndex!0 (size!2313 (buf!2710 (_2!4873 (increaseBitIndex!0 lt!167770)))) (currentByte!5267 (_2!4873 (increaseBitIndex!0 lt!167770))) (currentBit!5262 (_2!4873 (increaseBitIndex!0 lt!167770)))) (bvadd lt!169178 lt!169180)))))

(assert (=> b!111500 (or (not (= (bvand lt!169178 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!169180 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!169178 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!169178 lt!169180) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!111500 (= lt!169180 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!111500 (= lt!169178 (bitIndex!0 (size!2313 (buf!2710 lt!167770)) (currentByte!5267 lt!167770) (currentBit!5262 lt!167770)))))

(declare-fun lt!169182 () Bool)

(assert (=> b!111500 (= lt!169182 (not (= (bvand ((_ sign_extend 24) (select (arr!2906 (buf!2710 lt!167770)) (currentByte!5267 lt!167770))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5262 lt!167770)))) #b00000000000000000000000000000000)))))

(declare-fun lt!169184 () Bool)

(assert (=> b!111500 (= lt!169184 (not (= (bvand ((_ sign_extend 24) (select (arr!2906 (buf!2710 lt!167770)) (currentByte!5267 lt!167770))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5262 lt!167770)))) #b00000000000000000000000000000000)))))

(declare-fun lt!169183 () Bool)

(assert (=> b!111500 (= lt!169183 (not (= (bvand ((_ sign_extend 24) (select (arr!2906 (buf!2710 lt!167770)) (currentByte!5267 lt!167770))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5262 lt!167770)))) #b00000000000000000000000000000000)))))

(assert (= (and d!35330 res!92054) b!111500))

(declare-fun m!165915 () Bool)

(assert (=> d!35330 m!165915))

(declare-fun m!165917 () Bool)

(assert (=> d!35330 m!165917))

(declare-fun m!165919 () Bool)

(assert (=> d!35330 m!165919))

(declare-fun m!165921 () Bool)

(assert (=> d!35330 m!165921))

(assert (=> b!111500 m!165917))

(declare-fun m!165923 () Bool)

(assert (=> b!111500 m!165923))

(declare-fun m!165925 () Bool)

(assert (=> b!111500 m!165925))

(assert (=> b!111500 m!165919))

(assert (=> b!111500 m!165915))

(assert (=> d!34890 d!35330))

(declare-fun d!35332 () Bool)

(declare-fun e!73155 () Bool)

(assert (=> d!35332 e!73155))

(declare-fun res!92055 () Bool)

(assert (=> d!35332 (=> (not res!92055) (not e!73155))))

(declare-fun lt!169185 () BitStream!4100)

(declare-fun lt!169186 () (_ BitVec 64))

(assert (=> d!35332 (= res!92055 (= (bvadd lt!169186 (bvsub lt!167893 lt!167886)) (bitIndex!0 (size!2313 (buf!2710 lt!169185)) (currentByte!5267 lt!169185) (currentBit!5262 lt!169185))))))

(assert (=> d!35332 (or (not (= (bvand lt!169186 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!167893 lt!167886) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!169186 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!169186 (bvsub lt!167893 lt!167886)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35332 (= lt!169186 (bitIndex!0 (size!2313 (buf!2710 (_2!4875 lt!167903))) (currentByte!5267 (_2!4875 lt!167903)) (currentBit!5262 (_2!4875 lt!167903))))))

(assert (=> d!35332 (= lt!169185 (_2!4873 (moveBitIndex!0 (_2!4875 lt!167903) (bvsub lt!167893 lt!167886))))))

(assert (=> d!35332 (moveBitIndexPrecond!0 (_2!4875 lt!167903) (bvsub lt!167893 lt!167886))))

(assert (=> d!35332 (= (withMovedBitIndex!0 (_2!4875 lt!167903) (bvsub lt!167893 lt!167886)) lt!169185)))

(declare-fun b!111501 () Bool)

(assert (=> b!111501 (= e!73155 (= (size!2313 (buf!2710 (_2!4875 lt!167903))) (size!2313 (buf!2710 lt!169185))))))

(assert (= (and d!35332 res!92055) b!111501))

(declare-fun m!165927 () Bool)

(assert (=> d!35332 m!165927))

(assert (=> d!35332 m!165749))

(declare-fun m!165929 () Bool)

(assert (=> d!35332 m!165929))

(declare-fun m!165931 () Bool)

(assert (=> d!35332 m!165931))

(assert (=> b!110896 d!35332))

(assert (=> b!110896 d!35280))

(assert (=> b!110896 d!34960))

(declare-fun d!35334 () Bool)

(declare-fun e!73156 () Bool)

(assert (=> d!35334 e!73156))

(declare-fun res!92056 () Bool)

(assert (=> d!35334 (=> (not res!92056) (not e!73156))))

(declare-fun lt!169188 () (_ BitVec 64))

(declare-fun lt!169192 () (_ BitVec 64))

(declare-fun lt!169187 () (_ BitVec 64))

(assert (=> d!35334 (= res!92056 (= lt!169188 (bvsub lt!169192 lt!169187)))))

(assert (=> d!35334 (or (= (bvand lt!169192 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!169187 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!169192 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!169192 lt!169187) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35334 (= lt!169187 (remainingBits!0 ((_ sign_extend 32) (size!2313 (buf!2710 (_2!4873 lt!168263)))) ((_ sign_extend 32) (currentByte!5267 (_2!4873 lt!168263))) ((_ sign_extend 32) (currentBit!5262 (_2!4873 lt!168263)))))))

(declare-fun lt!169190 () (_ BitVec 64))

(declare-fun lt!169191 () (_ BitVec 64))

(assert (=> d!35334 (= lt!169192 (bvmul lt!169190 lt!169191))))

(assert (=> d!35334 (or (= lt!169190 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!169191 (bvsdiv (bvmul lt!169190 lt!169191) lt!169190)))))

(assert (=> d!35334 (= lt!169191 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!35334 (= lt!169190 ((_ sign_extend 32) (size!2313 (buf!2710 (_2!4873 lt!168263)))))))

(assert (=> d!35334 (= lt!169188 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5267 (_2!4873 lt!168263))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5262 (_2!4873 lt!168263)))))))

(assert (=> d!35334 (invariant!0 (currentBit!5262 (_2!4873 lt!168263)) (currentByte!5267 (_2!4873 lt!168263)) (size!2313 (buf!2710 (_2!4873 lt!168263))))))

(assert (=> d!35334 (= (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!168263))) (currentByte!5267 (_2!4873 lt!168263)) (currentBit!5262 (_2!4873 lt!168263))) lt!169188)))

(declare-fun b!111502 () Bool)

(declare-fun res!92057 () Bool)

(assert (=> b!111502 (=> (not res!92057) (not e!73156))))

(assert (=> b!111502 (= res!92057 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!169188))))

(declare-fun b!111503 () Bool)

(declare-fun lt!169189 () (_ BitVec 64))

(assert (=> b!111503 (= e!73156 (bvsle lt!169188 (bvmul lt!169189 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!111503 (or (= lt!169189 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!169189 #b0000000000000000000000000000000000000000000000000000000000001000) lt!169189)))))

(assert (=> b!111503 (= lt!169189 ((_ sign_extend 32) (size!2313 (buf!2710 (_2!4873 lt!168263)))))))

(assert (= (and d!35334 res!92056) b!111502))

(assert (= (and b!111502 res!92057) b!111503))

(declare-fun m!165933 () Bool)

(assert (=> d!35334 m!165933))

(declare-fun m!165935 () Bool)

(assert (=> d!35334 m!165935))

(assert (=> b!111021 d!35334))

(assert (=> b!111021 d!34960))

(declare-fun d!35336 () Bool)

(assert (=> d!35336 (isPrefixOf!0 lt!167937 (_2!4873 lt!167766))))

(declare-fun lt!169193 () Unit!6794)

(assert (=> d!35336 (= lt!169193 (choose!30 lt!167937 thiss!1305 (_2!4873 lt!167766)))))

(assert (=> d!35336 (isPrefixOf!0 lt!167937 thiss!1305)))

(assert (=> d!35336 (= (lemmaIsPrefixTransitive!0 lt!167937 thiss!1305 (_2!4873 lt!167766)) lt!169193)))

(declare-fun bs!8632 () Bool)

(assert (= bs!8632 d!35336))

(assert (=> bs!8632 m!164651))

(declare-fun m!165937 () Bool)

(assert (=> bs!8632 m!165937))

(declare-fun m!165939 () Bool)

(assert (=> bs!8632 m!165939))

(assert (=> d!34894 d!35336))

(declare-fun d!35338 () Bool)

(assert (=> d!35338 (isPrefixOf!0 lt!167937 lt!167937)))

(declare-fun lt!169194 () Unit!6794)

(assert (=> d!35338 (= lt!169194 (choose!11 lt!167937))))

(assert (=> d!35338 (= (lemmaIsPrefixRefl!0 lt!167937) lt!169194)))

(declare-fun bs!8633 () Bool)

(assert (= bs!8633 d!35338))

(assert (=> bs!8633 m!164655))

(declare-fun m!165941 () Bool)

(assert (=> bs!8633 m!165941))

(assert (=> d!34894 d!35338))

(declare-fun d!35340 () Bool)

(declare-fun res!92060 () Bool)

(declare-fun e!73158 () Bool)

(assert (=> d!35340 (=> (not res!92060) (not e!73158))))

(assert (=> d!35340 (= res!92060 (= (size!2313 (buf!2710 lt!167937)) (size!2313 (buf!2710 (_2!4873 lt!167766)))))))

(assert (=> d!35340 (= (isPrefixOf!0 lt!167937 (_2!4873 lt!167766)) e!73158)))

(declare-fun b!111504 () Bool)

(declare-fun res!92059 () Bool)

(assert (=> b!111504 (=> (not res!92059) (not e!73158))))

(assert (=> b!111504 (= res!92059 (bvsle (bitIndex!0 (size!2313 (buf!2710 lt!167937)) (currentByte!5267 lt!167937) (currentBit!5262 lt!167937)) (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!167766))) (currentByte!5267 (_2!4873 lt!167766)) (currentBit!5262 (_2!4873 lt!167766)))))))

(declare-fun b!111505 () Bool)

(declare-fun e!73157 () Bool)

(assert (=> b!111505 (= e!73158 e!73157)))

(declare-fun res!92058 () Bool)

(assert (=> b!111505 (=> res!92058 e!73157)))

(assert (=> b!111505 (= res!92058 (= (size!2313 (buf!2710 lt!167937)) #b00000000000000000000000000000000))))

(declare-fun b!111506 () Bool)

(assert (=> b!111506 (= e!73157 (arrayBitRangesEq!0 (buf!2710 lt!167937) (buf!2710 (_2!4873 lt!167766)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2313 (buf!2710 lt!167937)) (currentByte!5267 lt!167937) (currentBit!5262 lt!167937))))))

(assert (= (and d!35340 res!92060) b!111504))

(assert (= (and b!111504 res!92059) b!111505))

(assert (= (and b!111505 (not res!92058)) b!111506))

(declare-fun m!165943 () Bool)

(assert (=> b!111504 m!165943))

(assert (=> b!111504 m!164583))

(assert (=> b!111506 m!165943))

(assert (=> b!111506 m!165943))

(declare-fun m!165945 () Bool)

(assert (=> b!111506 m!165945))

(assert (=> d!34894 d!35340))

(assert (=> d!34894 d!35240))

(declare-fun d!35342 () Bool)

(declare-fun res!92063 () Bool)

(declare-fun e!73160 () Bool)

(assert (=> d!35342 (=> (not res!92063) (not e!73160))))

(assert (=> d!35342 (= res!92063 (= (size!2313 (buf!2710 (_1!4875 lt!167948))) (size!2313 (buf!2710 (_2!4875 lt!167948)))))))

(assert (=> d!35342 (= (isPrefixOf!0 (_1!4875 lt!167948) (_2!4875 lt!167948)) e!73160)))

(declare-fun b!111507 () Bool)

(declare-fun res!92062 () Bool)

(assert (=> b!111507 (=> (not res!92062) (not e!73160))))

(assert (=> b!111507 (= res!92062 (bvsle (bitIndex!0 (size!2313 (buf!2710 (_1!4875 lt!167948))) (currentByte!5267 (_1!4875 lt!167948)) (currentBit!5262 (_1!4875 lt!167948))) (bitIndex!0 (size!2313 (buf!2710 (_2!4875 lt!167948))) (currentByte!5267 (_2!4875 lt!167948)) (currentBit!5262 (_2!4875 lt!167948)))))))

(declare-fun b!111508 () Bool)

(declare-fun e!73159 () Bool)

(assert (=> b!111508 (= e!73160 e!73159)))

(declare-fun res!92061 () Bool)

(assert (=> b!111508 (=> res!92061 e!73159)))

(assert (=> b!111508 (= res!92061 (= (size!2313 (buf!2710 (_1!4875 lt!167948))) #b00000000000000000000000000000000))))

(declare-fun b!111509 () Bool)

(assert (=> b!111509 (= e!73159 (arrayBitRangesEq!0 (buf!2710 (_1!4875 lt!167948)) (buf!2710 (_2!4875 lt!167948)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2313 (buf!2710 (_1!4875 lt!167948))) (currentByte!5267 (_1!4875 lt!167948)) (currentBit!5262 (_1!4875 lt!167948)))))))

(assert (= (and d!35342 res!92063) b!111507))

(assert (= (and b!111507 res!92062) b!111508))

(assert (= (and b!111508 (not res!92061)) b!111509))

(assert (=> b!111507 m!165807))

(assert (=> b!111507 m!165803))

(assert (=> b!111509 m!165807))

(assert (=> b!111509 m!165807))

(declare-fun m!165947 () Bool)

(assert (=> b!111509 m!165947))

(assert (=> d!34894 d!35342))

(declare-fun d!35344 () Bool)

(assert (=> d!35344 (isPrefixOf!0 lt!167937 (_2!4873 lt!167766))))

(declare-fun lt!169195 () Unit!6794)

(assert (=> d!35344 (= lt!169195 (choose!30 lt!167937 (_2!4873 lt!167766) (_2!4873 lt!167766)))))

(assert (=> d!35344 (isPrefixOf!0 lt!167937 (_2!4873 lt!167766))))

(assert (=> d!35344 (= (lemmaIsPrefixTransitive!0 lt!167937 (_2!4873 lt!167766) (_2!4873 lt!167766)) lt!169195)))

(declare-fun bs!8634 () Bool)

(assert (= bs!8634 d!35344))

(assert (=> bs!8634 m!164651))

(declare-fun m!165949 () Bool)

(assert (=> bs!8634 m!165949))

(assert (=> bs!8634 m!164651))

(assert (=> d!34894 d!35344))

(declare-fun d!35346 () Bool)

(declare-fun res!92066 () Bool)

(declare-fun e!73162 () Bool)

(assert (=> d!35346 (=> (not res!92066) (not e!73162))))

(assert (=> d!35346 (= res!92066 (= (size!2313 (buf!2710 lt!167937)) (size!2313 (buf!2710 lt!167937))))))

(assert (=> d!35346 (= (isPrefixOf!0 lt!167937 lt!167937) e!73162)))

(declare-fun b!111510 () Bool)

(declare-fun res!92065 () Bool)

(assert (=> b!111510 (=> (not res!92065) (not e!73162))))

(assert (=> b!111510 (= res!92065 (bvsle (bitIndex!0 (size!2313 (buf!2710 lt!167937)) (currentByte!5267 lt!167937) (currentBit!5262 lt!167937)) (bitIndex!0 (size!2313 (buf!2710 lt!167937)) (currentByte!5267 lt!167937) (currentBit!5262 lt!167937))))))

(declare-fun b!111511 () Bool)

(declare-fun e!73161 () Bool)

(assert (=> b!111511 (= e!73162 e!73161)))

(declare-fun res!92064 () Bool)

(assert (=> b!111511 (=> res!92064 e!73161)))

(assert (=> b!111511 (= res!92064 (= (size!2313 (buf!2710 lt!167937)) #b00000000000000000000000000000000))))

(declare-fun b!111512 () Bool)

(assert (=> b!111512 (= e!73161 (arrayBitRangesEq!0 (buf!2710 lt!167937) (buf!2710 lt!167937) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2313 (buf!2710 lt!167937)) (currentByte!5267 lt!167937) (currentBit!5262 lt!167937))))))

(assert (= (and d!35346 res!92066) b!111510))

(assert (= (and b!111510 res!92065) b!111511))

(assert (= (and b!111511 (not res!92064)) b!111512))

(assert (=> b!111510 m!165943))

(assert (=> b!111510 m!165943))

(assert (=> b!111512 m!165943))

(assert (=> b!111512 m!165943))

(declare-fun m!165951 () Bool)

(assert (=> b!111512 m!165951))

(assert (=> d!34894 d!35346))

(declare-fun d!35348 () Bool)

(declare-fun res!92069 () Bool)

(declare-fun e!73164 () Bool)

(assert (=> d!35348 (=> (not res!92069) (not e!73164))))

(assert (=> d!35348 (= res!92069 (= (size!2313 (buf!2710 thiss!1305)) (size!2313 (buf!2710 thiss!1305))))))

(assert (=> d!35348 (= (isPrefixOf!0 thiss!1305 thiss!1305) e!73164)))

(declare-fun b!111513 () Bool)

(declare-fun res!92068 () Bool)

(assert (=> b!111513 (=> (not res!92068) (not e!73164))))

(assert (=> b!111513 (= res!92068 (bvsle (bitIndex!0 (size!2313 (buf!2710 thiss!1305)) (currentByte!5267 thiss!1305) (currentBit!5262 thiss!1305)) (bitIndex!0 (size!2313 (buf!2710 thiss!1305)) (currentByte!5267 thiss!1305) (currentBit!5262 thiss!1305))))))

(declare-fun b!111514 () Bool)

(declare-fun e!73163 () Bool)

(assert (=> b!111514 (= e!73164 e!73163)))

(declare-fun res!92067 () Bool)

(assert (=> b!111514 (=> res!92067 e!73163)))

(assert (=> b!111514 (= res!92067 (= (size!2313 (buf!2710 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!111515 () Bool)

(assert (=> b!111515 (= e!73163 (arrayBitRangesEq!0 (buf!2710 thiss!1305) (buf!2710 thiss!1305) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2313 (buf!2710 thiss!1305)) (currentByte!5267 thiss!1305) (currentBit!5262 thiss!1305))))))

(assert (= (and d!35348 res!92069) b!111513))

(assert (= (and b!111513 res!92068) b!111514))

(assert (= (and b!111514 (not res!92067)) b!111515))

(assert (=> b!111513 m!164519))

(assert (=> b!111513 m!164519))

(assert (=> b!111515 m!164519))

(assert (=> b!111515 m!164519))

(declare-fun m!165953 () Bool)

(assert (=> b!111515 m!165953))

(assert (=> d!34894 d!35348))

(assert (=> d!34894 d!34896))

(assert (=> d!34894 d!35238))

(declare-fun d!35350 () Bool)

(assert (=> d!35350 (isPrefixOf!0 thiss!1305 thiss!1305)))

(declare-fun lt!169196 () Unit!6794)

(assert (=> d!35350 (= lt!169196 (choose!11 thiss!1305))))

(assert (=> d!35350 (= (lemmaIsPrefixRefl!0 thiss!1305) lt!169196)))

(declare-fun bs!8635 () Bool)

(assert (= bs!8635 d!35350))

(assert (=> bs!8635 m!164649))

(declare-fun m!165955 () Bool)

(assert (=> bs!8635 m!165955))

(assert (=> d!34894 d!35350))

(assert (=> b!110849 d!34962))

(assert (=> b!110849 d!34960))

(assert (=> b!110860 d!34822))

(declare-fun d!35352 () Bool)

(declare-fun e!73165 () Bool)

(assert (=> d!35352 e!73165))

(declare-fun res!92070 () Bool)

(assert (=> d!35352 (=> (not res!92070) (not e!73165))))

(declare-fun lt!169198 () (_ BitVec 64))

(declare-fun lt!169197 () BitStream!4100)

(assert (=> d!35352 (= res!92070 (= (bvadd lt!169198 (bvsub (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!168246))) (currentByte!5267 (_2!4873 lt!168246)) (currentBit!5262 (_2!4873 lt!168246))) (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!168256))) (currentByte!5267 (_2!4873 lt!168256)) (currentBit!5262 (_2!4873 lt!168256))))) (bitIndex!0 (size!2313 (buf!2710 lt!169197)) (currentByte!5267 lt!169197) (currentBit!5262 lt!169197))))))

(assert (=> d!35352 (or (not (= (bvand lt!169198 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!168246))) (currentByte!5267 (_2!4873 lt!168246)) (currentBit!5262 (_2!4873 lt!168246))) (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!168256))) (currentByte!5267 (_2!4873 lt!168256)) (currentBit!5262 (_2!4873 lt!168256)))) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!169198 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!169198 (bvsub (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!168246))) (currentByte!5267 (_2!4873 lt!168246)) (currentBit!5262 (_2!4873 lt!168246))) (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!168256))) (currentByte!5267 (_2!4873 lt!168256)) (currentBit!5262 (_2!4873 lt!168256))))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35352 (= lt!169198 (bitIndex!0 (size!2313 (buf!2710 (_2!4875 lt!168262))) (currentByte!5267 (_2!4875 lt!168262)) (currentBit!5262 (_2!4875 lt!168262))))))

(assert (=> d!35352 (= lt!169197 (_2!4873 (moveBitIndex!0 (_2!4875 lt!168262) (bvsub (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!168246))) (currentByte!5267 (_2!4873 lt!168246)) (currentBit!5262 (_2!4873 lt!168246))) (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!168256))) (currentByte!5267 (_2!4873 lt!168256)) (currentBit!5262 (_2!4873 lt!168256)))))))))

(assert (=> d!35352 (moveBitIndexPrecond!0 (_2!4875 lt!168262) (bvsub (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!168246))) (currentByte!5267 (_2!4873 lt!168246)) (currentBit!5262 (_2!4873 lt!168246))) (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!168256))) (currentByte!5267 (_2!4873 lt!168256)) (currentBit!5262 (_2!4873 lt!168256)))))))

(assert (=> d!35352 (= (withMovedBitIndex!0 (_2!4875 lt!168262) (bvsub (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!168246))) (currentByte!5267 (_2!4873 lt!168246)) (currentBit!5262 (_2!4873 lt!168246))) (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!168256))) (currentByte!5267 (_2!4873 lt!168256)) (currentBit!5262 (_2!4873 lt!168256))))) lt!169197)))

(declare-fun b!111516 () Bool)

(assert (=> b!111516 (= e!73165 (= (size!2313 (buf!2710 (_2!4875 lt!168262))) (size!2313 (buf!2710 lt!169197))))))

(assert (= (and d!35352 res!92070) b!111516))

(declare-fun m!165957 () Bool)

(assert (=> d!35352 m!165957))

(declare-fun m!165959 () Bool)

(assert (=> d!35352 m!165959))

(declare-fun m!165961 () Bool)

(assert (=> d!35352 m!165961))

(declare-fun m!165963 () Bool)

(assert (=> d!35352 m!165963))

(assert (=> b!111017 d!35352))

(declare-fun b!111519 () Bool)

(declare-fun e!73166 () Bool)

(declare-fun e!73167 () Bool)

(assert (=> b!111519 (= e!73166 e!73167)))

(declare-fun res!92074 () Bool)

(assert (=> b!111519 (=> (not res!92074) (not e!73167))))

(declare-fun lt!169199 () tuple2!9232)

(declare-fun lt!169200 () tuple2!9234)

(assert (=> b!111519 (= res!92074 (and (= (_2!4874 lt!169200) lt!168283) (= (_1!4874 lt!169200) (_2!4873 lt!169199))))))

(assert (=> b!111519 (= lt!169200 (readBitPure!0 (readerFrom!0 (_2!4873 lt!169199) (currentBit!5262 (_2!4873 lt!167769)) (currentByte!5267 (_2!4873 lt!167769)))))))

(declare-fun d!35354 () Bool)

(assert (=> d!35354 e!73166))

(declare-fun res!92071 () Bool)

(assert (=> d!35354 (=> (not res!92071) (not e!73166))))

(assert (=> d!35354 (= res!92071 (= (size!2313 (buf!2710 (_2!4873 lt!167769))) (size!2313 (buf!2710 (_2!4873 lt!169199)))))))

(assert (=> d!35354 (= lt!169199 (choose!16 (_2!4873 lt!167769) lt!168283))))

(assert (=> d!35354 (validate_offset_bit!0 ((_ sign_extend 32) (size!2313 (buf!2710 (_2!4873 lt!167769)))) ((_ sign_extend 32) (currentByte!5267 (_2!4873 lt!167769))) ((_ sign_extend 32) (currentBit!5262 (_2!4873 lt!167769))))))

(assert (=> d!35354 (= (appendBit!0 (_2!4873 lt!167769) lt!168283) lt!169199)))

(declare-fun b!111517 () Bool)

(declare-fun res!92072 () Bool)

(assert (=> b!111517 (=> (not res!92072) (not e!73166))))

(declare-fun lt!169202 () (_ BitVec 64))

(declare-fun lt!169201 () (_ BitVec 64))

(assert (=> b!111517 (= res!92072 (= (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!169199))) (currentByte!5267 (_2!4873 lt!169199)) (currentBit!5262 (_2!4873 lt!169199))) (bvadd lt!169201 lt!169202)))))

(assert (=> b!111517 (or (not (= (bvand lt!169201 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!169202 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!169201 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!169201 lt!169202) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!111517 (= lt!169202 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!111517 (= lt!169201 (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!167769))) (currentByte!5267 (_2!4873 lt!167769)) (currentBit!5262 (_2!4873 lt!167769))))))

(declare-fun b!111518 () Bool)

(declare-fun res!92073 () Bool)

(assert (=> b!111518 (=> (not res!92073) (not e!73166))))

(assert (=> b!111518 (= res!92073 (isPrefixOf!0 (_2!4873 lt!167769) (_2!4873 lt!169199)))))

(declare-fun b!111520 () Bool)

(assert (=> b!111520 (= e!73167 (= (bitIndex!0 (size!2313 (buf!2710 (_1!4874 lt!169200))) (currentByte!5267 (_1!4874 lt!169200)) (currentBit!5262 (_1!4874 lt!169200))) (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!169199))) (currentByte!5267 (_2!4873 lt!169199)) (currentBit!5262 (_2!4873 lt!169199)))))))

(assert (= (and d!35354 res!92071) b!111517))

(assert (= (and b!111517 res!92072) b!111518))

(assert (= (and b!111518 res!92073) b!111519))

(assert (= (and b!111519 res!92074) b!111520))

(declare-fun m!165965 () Bool)

(assert (=> d!35354 m!165965))

(declare-fun m!165967 () Bool)

(assert (=> d!35354 m!165967))

(declare-fun m!165969 () Bool)

(assert (=> b!111518 m!165969))

(declare-fun m!165971 () Bool)

(assert (=> b!111519 m!165971))

(assert (=> b!111519 m!165971))

(declare-fun m!165973 () Bool)

(assert (=> b!111519 m!165973))

(declare-fun m!165975 () Bool)

(assert (=> b!111520 m!165975))

(declare-fun m!165977 () Bool)

(assert (=> b!111520 m!165977))

(assert (=> b!111517 m!165977))

(assert (=> b!111517 m!164517))

(assert (=> b!111017 d!35354))

(declare-fun d!35356 () Bool)

(declare-fun e!73168 () Bool)

(assert (=> d!35356 e!73168))

(declare-fun res!92075 () Bool)

(assert (=> d!35356 (=> (not res!92075) (not e!73168))))

(declare-fun lt!169208 () (_ BitVec 64))

(declare-fun lt!169203 () (_ BitVec 64))

(declare-fun lt!169204 () (_ BitVec 64))

(assert (=> d!35356 (= res!92075 (= lt!169204 (bvsub lt!169208 lt!169203)))))

(assert (=> d!35356 (or (= (bvand lt!169208 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!169203 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!169208 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!169208 lt!169203) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35356 (= lt!169203 (remainingBits!0 ((_ sign_extend 32) (size!2313 (buf!2710 (_1!4874 lt!168289)))) ((_ sign_extend 32) (currentByte!5267 (_1!4874 lt!168289))) ((_ sign_extend 32) (currentBit!5262 (_1!4874 lt!168289)))))))

(declare-fun lt!169206 () (_ BitVec 64))

(declare-fun lt!169207 () (_ BitVec 64))

(assert (=> d!35356 (= lt!169208 (bvmul lt!169206 lt!169207))))

(assert (=> d!35356 (or (= lt!169206 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!169207 (bvsdiv (bvmul lt!169206 lt!169207) lt!169206)))))

(assert (=> d!35356 (= lt!169207 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!35356 (= lt!169206 ((_ sign_extend 32) (size!2313 (buf!2710 (_1!4874 lt!168289)))))))

(assert (=> d!35356 (= lt!169204 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5267 (_1!4874 lt!168289))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5262 (_1!4874 lt!168289)))))))

(assert (=> d!35356 (invariant!0 (currentBit!5262 (_1!4874 lt!168289)) (currentByte!5267 (_1!4874 lt!168289)) (size!2313 (buf!2710 (_1!4874 lt!168289))))))

(assert (=> d!35356 (= (bitIndex!0 (size!2313 (buf!2710 (_1!4874 lt!168289))) (currentByte!5267 (_1!4874 lt!168289)) (currentBit!5262 (_1!4874 lt!168289))) lt!169204)))

(declare-fun b!111521 () Bool)

(declare-fun res!92076 () Bool)

(assert (=> b!111521 (=> (not res!92076) (not e!73168))))

(assert (=> b!111521 (= res!92076 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!169204))))

(declare-fun b!111522 () Bool)

(declare-fun lt!169205 () (_ BitVec 64))

(assert (=> b!111522 (= e!73168 (bvsle lt!169204 (bvmul lt!169205 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!111522 (or (= lt!169205 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!169205 #b0000000000000000000000000000000000000000000000000000000000001000) lt!169205)))))

(assert (=> b!111522 (= lt!169205 ((_ sign_extend 32) (size!2313 (buf!2710 (_1!4874 lt!168289)))))))

(assert (= (and d!35356 res!92075) b!111521))

(assert (= (and b!111521 res!92076) b!111522))

(declare-fun m!165979 () Bool)

(assert (=> d!35356 m!165979))

(declare-fun m!165981 () Bool)

(assert (=> d!35356 m!165981))

(assert (=> b!111017 d!35356))

(declare-fun lt!169209 () tuple2!9246)

(declare-fun d!35358 () Bool)

(assert (=> d!35358 (= lt!169209 (readNLeastSignificantBitsLoop!0 (_1!4875 lt!168247) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!168266))))

(assert (=> d!35358 (= (readNLeastSignificantBitsLoopPure!0 (_1!4875 lt!168247) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!168266) (tuple2!9239 (_2!4880 lt!169209) (_1!4880 lt!169209)))))

(declare-fun bs!8636 () Bool)

(assert (= bs!8636 d!35358))

(declare-fun m!165983 () Bool)

(assert (=> bs!8636 m!165983))

(assert (=> b!111017 d!35358))

(declare-fun d!35360 () Bool)

(declare-fun lt!169227 () tuple2!9238)

(declare-fun lt!169226 () tuple2!9238)

(assert (=> d!35360 (and (= (_2!4876 lt!169227) (_2!4876 lt!169226)) (= (_1!4876 lt!169227) (_1!4876 lt!169226)))))

(declare-fun lt!169224 () BitStream!4100)

(declare-fun lt!169225 () Unit!6794)

(declare-fun lt!169223 () (_ BitVec 64))

(declare-fun lt!169222 () Bool)

(declare-fun choose!45 (BitStream!4100 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!9238 tuple2!9238 BitStream!4100 (_ BitVec 64) Bool BitStream!4100 (_ BitVec 64) tuple2!9238 tuple2!9238 BitStream!4100 (_ BitVec 64)) Unit!6794)

(assert (=> d!35360 (= lt!169225 (choose!45 (_1!4875 lt!168247) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!168266 lt!169227 (tuple2!9239 (_1!4876 lt!169227) (_2!4876 lt!169227)) (_1!4876 lt!169227) (_2!4876 lt!169227) lt!169222 lt!169224 lt!169223 lt!169226 (tuple2!9239 (_1!4876 lt!169226) (_2!4876 lt!169226)) (_1!4876 lt!169226) (_2!4876 lt!169226)))))

(assert (=> d!35360 (= lt!169226 (readNLeastSignificantBitsLoopPure!0 lt!169224 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) lt!169223))))

(assert (=> d!35360 (= lt!169223 (bvor lt!168266 (ite lt!169222 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35360 (= lt!169224 (withMovedBitIndex!0 (_1!4875 lt!168247) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!35360 (= lt!169222 (_2!4874 (readBitPure!0 (_1!4875 lt!168247))))))

(assert (=> d!35360 (= lt!169227 (readNLeastSignificantBitsLoopPure!0 (_1!4875 lt!168247) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!168266))))

(assert (=> d!35360 (= (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4875 lt!168247) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!168266) lt!169225)))

(declare-fun bs!8638 () Bool)

(assert (= bs!8638 d!35360))

(declare-fun m!165985 () Bool)

(assert (=> bs!8638 m!165985))

(assert (=> bs!8638 m!164813))

(assert (=> bs!8638 m!164791))

(assert (=> bs!8638 m!164783))

(declare-fun m!165987 () Bool)

(assert (=> bs!8638 m!165987))

(assert (=> b!111017 d!35360))

(declare-fun d!35362 () Bool)

(declare-fun e!73169 () Bool)

(assert (=> d!35362 e!73169))

(declare-fun res!92077 () Bool)

(assert (=> d!35362 (=> (not res!92077) (not e!73169))))

(declare-fun lt!169233 () (_ BitVec 64))

(declare-fun lt!169229 () (_ BitVec 64))

(declare-fun lt!169228 () (_ BitVec 64))

(assert (=> d!35362 (= res!92077 (= lt!169229 (bvsub lt!169233 lt!169228)))))

(assert (=> d!35362 (or (= (bvand lt!169233 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!169228 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!169233 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!169233 lt!169228) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35362 (= lt!169228 (remainingBits!0 ((_ sign_extend 32) (size!2313 (buf!2710 (_2!4873 lt!168246)))) ((_ sign_extend 32) (currentByte!5267 (_2!4873 lt!168246))) ((_ sign_extend 32) (currentBit!5262 (_2!4873 lt!168246)))))))

(declare-fun lt!169231 () (_ BitVec 64))

(declare-fun lt!169232 () (_ BitVec 64))

(assert (=> d!35362 (= lt!169233 (bvmul lt!169231 lt!169232))))

(assert (=> d!35362 (or (= lt!169231 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!169232 (bvsdiv (bvmul lt!169231 lt!169232) lt!169231)))))

(assert (=> d!35362 (= lt!169232 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!35362 (= lt!169231 ((_ sign_extend 32) (size!2313 (buf!2710 (_2!4873 lt!168246)))))))

(assert (=> d!35362 (= lt!169229 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5267 (_2!4873 lt!168246))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5262 (_2!4873 lt!168246)))))))

(assert (=> d!35362 (invariant!0 (currentBit!5262 (_2!4873 lt!168246)) (currentByte!5267 (_2!4873 lt!168246)) (size!2313 (buf!2710 (_2!4873 lt!168246))))))

(assert (=> d!35362 (= (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!168246))) (currentByte!5267 (_2!4873 lt!168246)) (currentBit!5262 (_2!4873 lt!168246))) lt!169229)))

(declare-fun b!111523 () Bool)

(declare-fun res!92078 () Bool)

(assert (=> b!111523 (=> (not res!92078) (not e!73169))))

(assert (=> b!111523 (= res!92078 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!169229))))

(declare-fun b!111524 () Bool)

(declare-fun lt!169230 () (_ BitVec 64))

(assert (=> b!111524 (= e!73169 (bvsle lt!169229 (bvmul lt!169230 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!111524 (or (= lt!169230 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!169230 #b0000000000000000000000000000000000000000000000000000000000001000) lt!169230)))))

(assert (=> b!111524 (= lt!169230 ((_ sign_extend 32) (size!2313 (buf!2710 (_2!4873 lt!168246)))))))

(assert (= (and d!35362 res!92077) b!111523))

(assert (= (and b!111523 res!92078) b!111524))

(declare-fun m!165989 () Bool)

(assert (=> d!35362 m!165989))

(declare-fun m!165991 () Bool)

(assert (=> d!35362 m!165991))

(assert (=> b!111017 d!35362))

(declare-fun c!6783 () Bool)

(declare-fun call!1407 () Bool)

(declare-fun lt!169247 () BitStream!4100)

(declare-fun lt!169244 () tuple2!9232)

(declare-fun bm!1404 () Bool)

(assert (=> bm!1404 (= call!1407 (isPrefixOf!0 (ite c!6783 (_2!4873 lt!168246) lt!169247) (ite c!6783 (_2!4873 lt!169244) lt!169247)))))

(declare-fun b!111525 () Bool)

(declare-fun e!73176 () Bool)

(declare-fun lt!169277 () tuple2!9234)

(declare-fun lt!169272 () tuple2!9234)

(assert (=> b!111525 (= e!73176 (= (_2!4874 lt!169277) (_2!4874 lt!169272)))))

(declare-fun b!111527 () Bool)

(declare-fun e!73173 () tuple2!9232)

(declare-fun Unit!6830 () Unit!6794)

(assert (=> b!111527 (= e!73173 (tuple2!9233 Unit!6830 (_2!4873 lt!169244)))))

(declare-fun lt!169271 () Bool)

(assert (=> b!111527 (= lt!169271 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!169255 () tuple2!9232)

(assert (=> b!111527 (= lt!169255 (appendBit!0 (_2!4873 lt!168246) lt!169271))))

(declare-fun res!92081 () Bool)

(assert (=> b!111527 (= res!92081 (= (size!2313 (buf!2710 (_2!4873 lt!168246))) (size!2313 (buf!2710 (_2!4873 lt!169255)))))))

(declare-fun e!73171 () Bool)

(assert (=> b!111527 (=> (not res!92081) (not e!73171))))

(assert (=> b!111527 e!73171))

(declare-fun lt!169234 () tuple2!9232)

(assert (=> b!111527 (= lt!169234 lt!169255)))

(assert (=> b!111527 (= lt!169244 (appendNLeastSignificantBitsLoop!0 (_2!4873 lt!169234) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(declare-fun lt!169249 () Unit!6794)

(assert (=> b!111527 (= lt!169249 (lemmaIsPrefixTransitive!0 (_2!4873 lt!168246) (_2!4873 lt!169234) (_2!4873 lt!169244)))))

(assert (=> b!111527 call!1407))

(declare-fun lt!169243 () Unit!6794)

(assert (=> b!111527 (= lt!169243 lt!169249)))

(assert (=> b!111527 (invariant!0 (currentBit!5262 (_2!4873 lt!168246)) (currentByte!5267 (_2!4873 lt!168246)) (size!2313 (buf!2710 (_2!4873 lt!169234))))))

(declare-fun lt!169278 () BitStream!4100)

(assert (=> b!111527 (= lt!169278 (BitStream!4101 (buf!2710 (_2!4873 lt!169234)) (currentByte!5267 (_2!4873 lt!168246)) (currentBit!5262 (_2!4873 lt!168246))))))

(assert (=> b!111527 (invariant!0 (currentBit!5262 lt!169278) (currentByte!5267 lt!169278) (size!2313 (buf!2710 (_2!4873 lt!169244))))))

(declare-fun lt!169248 () BitStream!4100)

(assert (=> b!111527 (= lt!169248 (BitStream!4101 (buf!2710 (_2!4873 lt!169244)) (currentByte!5267 lt!169278) (currentBit!5262 lt!169278)))))

(assert (=> b!111527 (= lt!169277 (readBitPure!0 lt!169278))))

(assert (=> b!111527 (= lt!169272 (readBitPure!0 lt!169248))))

(declare-fun lt!169239 () Unit!6794)

(assert (=> b!111527 (= lt!169239 (readBitPrefixLemma!0 lt!169278 (_2!4873 lt!169244)))))

(declare-fun res!92080 () Bool)

(assert (=> b!111527 (= res!92080 (= (bitIndex!0 (size!2313 (buf!2710 (_1!4874 lt!169277))) (currentByte!5267 (_1!4874 lt!169277)) (currentBit!5262 (_1!4874 lt!169277))) (bitIndex!0 (size!2313 (buf!2710 (_1!4874 lt!169272))) (currentByte!5267 (_1!4874 lt!169272)) (currentBit!5262 (_1!4874 lt!169272)))))))

(assert (=> b!111527 (=> (not res!92080) (not e!73176))))

(assert (=> b!111527 e!73176))

(declare-fun lt!169257 () Unit!6794)

(assert (=> b!111527 (= lt!169257 lt!169239)))

(declare-fun lt!169235 () tuple2!9236)

(assert (=> b!111527 (= lt!169235 (reader!0 (_2!4873 lt!168246) (_2!4873 lt!169244)))))

(declare-fun lt!169250 () tuple2!9236)

(assert (=> b!111527 (= lt!169250 (reader!0 (_2!4873 lt!169234) (_2!4873 lt!169244)))))

(declare-fun lt!169269 () tuple2!9234)

(assert (=> b!111527 (= lt!169269 (readBitPure!0 (_1!4875 lt!169235)))))

(assert (=> b!111527 (= (_2!4874 lt!169269) lt!169271)))

(declare-fun lt!169253 () Unit!6794)

(declare-fun Unit!6831 () Unit!6794)

(assert (=> b!111527 (= lt!169253 Unit!6831)))

(declare-fun lt!169254 () (_ BitVec 64))

(assert (=> b!111527 (= lt!169254 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001))))))))

(declare-fun lt!169268 () (_ BitVec 64))

(assert (=> b!111527 (= lt!169268 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001))))))

(declare-fun lt!169238 () Unit!6794)

(assert (=> b!111527 (= lt!169238 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4873 lt!168246) (buf!2710 (_2!4873 lt!169244)) lt!169268))))

(assert (=> b!111527 (validate_offset_bits!1 ((_ sign_extend 32) (size!2313 (buf!2710 (_2!4873 lt!169244)))) ((_ sign_extend 32) (currentByte!5267 (_2!4873 lt!168246))) ((_ sign_extend 32) (currentBit!5262 (_2!4873 lt!168246))) lt!169268)))

(declare-fun lt!169241 () Unit!6794)

(assert (=> b!111527 (= lt!169241 lt!169238)))

(declare-fun lt!169258 () tuple2!9238)

(assert (=> b!111527 (= lt!169258 (readNLeastSignificantBitsLoopPure!0 (_1!4875 lt!169235) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) lt!169254))))

(declare-fun lt!169236 () (_ BitVec 64))

(assert (=> b!111527 (= lt!169236 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))))

(declare-fun lt!169275 () Unit!6794)

(assert (=> b!111527 (= lt!169275 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4873 lt!169234) (buf!2710 (_2!4873 lt!169244)) lt!169236))))

(assert (=> b!111527 (validate_offset_bits!1 ((_ sign_extend 32) (size!2313 (buf!2710 (_2!4873 lt!169244)))) ((_ sign_extend 32) (currentByte!5267 (_2!4873 lt!169234))) ((_ sign_extend 32) (currentBit!5262 (_2!4873 lt!169234))) lt!169236)))

(declare-fun lt!169242 () Unit!6794)

(assert (=> b!111527 (= lt!169242 lt!169275)))

(declare-fun lt!169273 () tuple2!9238)

(assert (=> b!111527 (= lt!169273 (readNLeastSignificantBitsLoopPure!0 (_1!4875 lt!169250) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvor lt!169254 (ite (_2!4874 lt!169269) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!169276 () tuple2!9238)

(assert (=> b!111527 (= lt!169276 (readNLeastSignificantBitsLoopPure!0 (_1!4875 lt!169235) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) lt!169254))))

(declare-fun c!6782 () Bool)

(assert (=> b!111527 (= c!6782 (_2!4874 (readBitPure!0 (_1!4875 lt!169235))))))

(declare-fun e!73174 () (_ BitVec 64))

(declare-fun lt!169245 () tuple2!9238)

(assert (=> b!111527 (= lt!169245 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4875 lt!169235) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvor lt!169254 e!73174)))))

(declare-fun lt!169256 () Unit!6794)

(assert (=> b!111527 (= lt!169256 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4875 lt!169235) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) lt!169254))))

(assert (=> b!111527 (and (= (_2!4876 lt!169276) (_2!4876 lt!169245)) (= (_1!4876 lt!169276) (_1!4876 lt!169245)))))

(declare-fun lt!169240 () Unit!6794)

(assert (=> b!111527 (= lt!169240 lt!169256)))

(assert (=> b!111527 (= (_1!4875 lt!169235) (withMovedBitIndex!0 (_2!4875 lt!169235) (bvsub (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!168246))) (currentByte!5267 (_2!4873 lt!168246)) (currentBit!5262 (_2!4873 lt!168246))) (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!169244))) (currentByte!5267 (_2!4873 lt!169244)) (currentBit!5262 (_2!4873 lt!169244))))))))

(declare-fun lt!169246 () Unit!6794)

(declare-fun Unit!6832 () Unit!6794)

(assert (=> b!111527 (= lt!169246 Unit!6832)))

(assert (=> b!111527 (= (_1!4875 lt!169250) (withMovedBitIndex!0 (_2!4875 lt!169250) (bvsub (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!169234))) (currentByte!5267 (_2!4873 lt!169234)) (currentBit!5262 (_2!4873 lt!169234))) (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!169244))) (currentByte!5267 (_2!4873 lt!169244)) (currentBit!5262 (_2!4873 lt!169244))))))))

(declare-fun lt!169237 () Unit!6794)

(declare-fun Unit!6833 () Unit!6794)

(assert (=> b!111527 (= lt!169237 Unit!6833)))

(assert (=> b!111527 (= (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!168246))) (currentByte!5267 (_2!4873 lt!168246)) (currentBit!5262 (_2!4873 lt!168246))) (bvsub (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!169234))) (currentByte!5267 (_2!4873 lt!169234)) (currentBit!5262 (_2!4873 lt!169234))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!169265 () Unit!6794)

(declare-fun Unit!6834 () Unit!6794)

(assert (=> b!111527 (= lt!169265 Unit!6834)))

(assert (=> b!111527 (= (_2!4876 lt!169258) (_2!4876 lt!169273))))

(declare-fun lt!169259 () Unit!6794)

(declare-fun Unit!6835 () Unit!6794)

(assert (=> b!111527 (= lt!169259 Unit!6835)))

(assert (=> b!111527 (= (_1!4876 lt!169258) (_2!4875 lt!169235))))

(declare-fun b!111528 () Bool)

(assert (=> b!111528 (= e!73174 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))))

(declare-fun b!111529 () Bool)

(declare-fun lt!169264 () tuple2!9234)

(assert (=> b!111529 (= lt!169264 (readBitPure!0 (readerFrom!0 (_2!4873 lt!169255) (currentBit!5262 (_2!4873 lt!168246)) (currentByte!5267 (_2!4873 lt!168246)))))))

(declare-fun res!92086 () Bool)

(assert (=> b!111529 (= res!92086 (and (= (_2!4874 lt!169264) lt!169271) (= (_1!4874 lt!169264) (_2!4873 lt!169255))))))

(declare-fun e!73175 () Bool)

(assert (=> b!111529 (=> (not res!92086) (not e!73175))))

(assert (=> b!111529 (= e!73171 e!73175)))

(declare-fun b!111530 () Bool)

(assert (=> b!111530 (= e!73175 (= (bitIndex!0 (size!2313 (buf!2710 (_1!4874 lt!169264))) (currentByte!5267 (_1!4874 lt!169264)) (currentBit!5262 (_1!4874 lt!169264))) (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!169255))) (currentByte!5267 (_2!4873 lt!169255)) (currentBit!5262 (_2!4873 lt!169255)))))))

(declare-fun b!111531 () Bool)

(declare-fun res!92087 () Bool)

(declare-fun e!73172 () Bool)

(assert (=> b!111531 (=> (not res!92087) (not e!73172))))

(declare-fun lt!169267 () (_ BitVec 64))

(declare-fun lt!169261 () (_ BitVec 64))

(declare-fun lt!169251 () tuple2!9232)

(assert (=> b!111531 (= res!92087 (= (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!169251))) (currentByte!5267 (_2!4873 lt!169251)) (currentBit!5262 (_2!4873 lt!169251))) (bvadd lt!169267 lt!169261)))))

(assert (=> b!111531 (or (not (= (bvand lt!169267 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!169261 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!169267 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!169267 lt!169261) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!111531 (= lt!169261 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001))))))

(assert (=> b!111531 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!111531 (= lt!169267 (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!168246))) (currentByte!5267 (_2!4873 lt!168246)) (currentBit!5262 (_2!4873 lt!168246))))))

(declare-fun b!111532 () Bool)

(declare-fun lt!169274 () Unit!6794)

(assert (=> b!111532 (= e!73173 (tuple2!9233 lt!169274 (_2!4873 lt!168246)))))

(assert (=> b!111532 (= lt!169247 (_2!4873 lt!168246))))

(assert (=> b!111532 (= lt!169274 (lemmaIsPrefixRefl!0 lt!169247))))

(assert (=> b!111532 call!1407))

(declare-fun b!111533 () Bool)

(declare-fun res!92085 () Bool)

(assert (=> b!111533 (= res!92085 (isPrefixOf!0 (_2!4873 lt!168246) (_2!4873 lt!169255)))))

(assert (=> b!111533 (=> (not res!92085) (not e!73171))))

(declare-fun b!111534 () Bool)

(declare-fun e!73170 () Bool)

(declare-fun lt!169260 () (_ BitVec 64))

(assert (=> b!111534 (= e!73170 (validate_offset_bits!1 ((_ sign_extend 32) (size!2313 (buf!2710 (_2!4873 lt!168246)))) ((_ sign_extend 32) (currentByte!5267 (_2!4873 lt!168246))) ((_ sign_extend 32) (currentBit!5262 (_2!4873 lt!168246))) lt!169260))))

(declare-fun b!111535 () Bool)

(declare-fun lt!169270 () tuple2!9236)

(declare-fun lt!169266 () tuple2!9238)

(assert (=> b!111535 (= e!73172 (and (= (_2!4876 lt!169266) v!199) (= (_1!4876 lt!169266) (_2!4875 lt!169270))))))

(declare-fun lt!169263 () (_ BitVec 64))

(assert (=> b!111535 (= lt!169266 (readNLeastSignificantBitsLoopPure!0 (_1!4875 lt!169270) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) lt!169263))))

(declare-fun lt!169252 () Unit!6794)

(declare-fun lt!169262 () Unit!6794)

(assert (=> b!111535 (= lt!169252 lt!169262)))

(assert (=> b!111535 (validate_offset_bits!1 ((_ sign_extend 32) (size!2313 (buf!2710 (_2!4873 lt!169251)))) ((_ sign_extend 32) (currentByte!5267 (_2!4873 lt!168246))) ((_ sign_extend 32) (currentBit!5262 (_2!4873 lt!168246))) lt!169260)))

(assert (=> b!111535 (= lt!169262 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4873 lt!168246) (buf!2710 (_2!4873 lt!169251)) lt!169260))))

(assert (=> b!111535 e!73170))

(declare-fun res!92082 () Bool)

(assert (=> b!111535 (=> (not res!92082) (not e!73170))))

(assert (=> b!111535 (= res!92082 (and (= (size!2313 (buf!2710 (_2!4873 lt!168246))) (size!2313 (buf!2710 (_2!4873 lt!169251)))) (bvsge lt!169260 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!111535 (= lt!169260 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001))))))

(assert (=> b!111535 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!111535 (= lt!169263 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001))))))))

(assert (=> b!111535 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!111535 (= lt!169270 (reader!0 (_2!4873 lt!168246) (_2!4873 lt!169251)))))

(declare-fun b!111536 () Bool)

(declare-fun res!92084 () Bool)

(assert (=> b!111536 (=> (not res!92084) (not e!73172))))

(assert (=> b!111536 (= res!92084 (isPrefixOf!0 (_2!4873 lt!168246) (_2!4873 lt!169251)))))

(declare-fun b!111537 () Bool)

(declare-fun res!92083 () Bool)

(assert (=> b!111537 (= res!92083 (= (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!169255))) (currentByte!5267 (_2!4873 lt!169255)) (currentBit!5262 (_2!4873 lt!169255))) (bvadd (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!168246))) (currentByte!5267 (_2!4873 lt!168246)) (currentBit!5262 (_2!4873 lt!168246))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!111537 (=> (not res!92083) (not e!73171))))

(declare-fun d!35364 () Bool)

(assert (=> d!35364 e!73172))

(declare-fun res!92079 () Bool)

(assert (=> d!35364 (=> (not res!92079) (not e!73172))))

(assert (=> d!35364 (= res!92079 (= (size!2313 (buf!2710 (_2!4873 lt!168246))) (size!2313 (buf!2710 (_2!4873 lt!169251)))))))

(assert (=> d!35364 (= lt!169251 e!73173)))

(assert (=> d!35364 (= c!6783 (bvslt (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) nBits!396))))

(assert (=> d!35364 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)) (bvsle (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!35364 (= (appendNLeastSignificantBitsLoop!0 (_2!4873 lt!168246) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)) lt!169251)))

(declare-fun b!111526 () Bool)

(assert (=> b!111526 (= e!73174 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (= (and d!35364 c!6783) b!111527))

(assert (= (and d!35364 (not c!6783)) b!111532))

(assert (= (and b!111527 res!92081) b!111537))

(assert (= (and b!111537 res!92083) b!111533))

(assert (= (and b!111533 res!92085) b!111529))

(assert (= (and b!111529 res!92086) b!111530))

(assert (= (and b!111527 res!92080) b!111525))

(assert (= (and b!111527 c!6782) b!111528))

(assert (= (and b!111527 (not c!6782)) b!111526))

(assert (= (or b!111527 b!111532) bm!1404))

(assert (= (and d!35364 res!92079) b!111531))

(assert (= (and b!111531 res!92087) b!111536))

(assert (= (and b!111536 res!92084) b!111535))

(assert (= (and b!111535 res!92082) b!111534))

(declare-fun m!165993 () Bool)

(assert (=> b!111534 m!165993))

(declare-fun m!165995 () Bool)

(assert (=> b!111530 m!165995))

(declare-fun m!165997 () Bool)

(assert (=> b!111530 m!165997))

(declare-fun m!165999 () Bool)

(assert (=> b!111535 m!165999))

(declare-fun m!166001 () Bool)

(assert (=> b!111535 m!166001))

(declare-fun m!166003 () Bool)

(assert (=> b!111535 m!166003))

(declare-fun m!166005 () Bool)

(assert (=> b!111535 m!166005))

(declare-fun m!166007 () Bool)

(assert (=> b!111535 m!166007))

(assert (=> b!111537 m!165997))

(assert (=> b!111537 m!164767))

(declare-fun m!166009 () Bool)

(assert (=> b!111536 m!166009))

(declare-fun m!166011 () Bool)

(assert (=> b!111527 m!166011))

(declare-fun m!166013 () Bool)

(assert (=> b!111527 m!166013))

(declare-fun m!166015 () Bool)

(assert (=> b!111527 m!166015))

(declare-fun m!166017 () Bool)

(assert (=> b!111527 m!166017))

(declare-fun m!166019 () Bool)

(assert (=> b!111527 m!166019))

(declare-fun m!166021 () Bool)

(assert (=> b!111527 m!166021))

(declare-fun m!166023 () Bool)

(assert (=> b!111527 m!166023))

(declare-fun m!166025 () Bool)

(assert (=> b!111527 m!166025))

(declare-fun m!166027 () Bool)

(assert (=> b!111527 m!166027))

(assert (=> b!111527 m!166027))

(declare-fun m!166029 () Bool)

(assert (=> b!111527 m!166029))

(declare-fun m!166031 () Bool)

(assert (=> b!111527 m!166031))

(declare-fun m!166033 () Bool)

(assert (=> b!111527 m!166033))

(declare-fun m!166035 () Bool)

(assert (=> b!111527 m!166035))

(assert (=> b!111527 m!165999))

(declare-fun m!166037 () Bool)

(assert (=> b!111527 m!166037))

(declare-fun m!166039 () Bool)

(assert (=> b!111527 m!166039))

(declare-fun m!166041 () Bool)

(assert (=> b!111527 m!166041))

(declare-fun m!166043 () Bool)

(assert (=> b!111527 m!166043))

(declare-fun m!166045 () Bool)

(assert (=> b!111527 m!166045))

(declare-fun m!166047 () Bool)

(assert (=> b!111527 m!166047))

(declare-fun m!166049 () Bool)

(assert (=> b!111527 m!166049))

(declare-fun m!166051 () Bool)

(assert (=> b!111527 m!166051))

(declare-fun m!166053 () Bool)

(assert (=> b!111527 m!166053))

(declare-fun m!166055 () Bool)

(assert (=> b!111527 m!166055))

(declare-fun m!166057 () Bool)

(assert (=> b!111527 m!166057))

(declare-fun m!166059 () Bool)

(assert (=> b!111527 m!166059))

(declare-fun m!166061 () Bool)

(assert (=> b!111527 m!166061))

(assert (=> b!111527 m!164767))

(declare-fun m!166063 () Bool)

(assert (=> b!111531 m!166063))

(assert (=> b!111531 m!164767))

(declare-fun m!166065 () Bool)

(assert (=> b!111529 m!166065))

(assert (=> b!111529 m!166065))

(declare-fun m!166067 () Bool)

(assert (=> b!111529 m!166067))

(declare-fun m!166069 () Bool)

(assert (=> b!111532 m!166069))

(declare-fun m!166071 () Bool)

(assert (=> bm!1404 m!166071))

(declare-fun m!166073 () Bool)

(assert (=> b!111533 m!166073))

(assert (=> b!111017 d!35364))

(declare-fun d!35366 () Bool)

(assert (=> d!35366 (isPrefixOf!0 (_2!4873 lt!167769) (_2!4873 lt!168256))))

(declare-fun lt!169279 () Unit!6794)

(assert (=> d!35366 (= lt!169279 (choose!30 (_2!4873 lt!167769) (_2!4873 lt!168246) (_2!4873 lt!168256)))))

(assert (=> d!35366 (isPrefixOf!0 (_2!4873 lt!167769) (_2!4873 lt!168246))))

(assert (=> d!35366 (= (lemmaIsPrefixTransitive!0 (_2!4873 lt!167769) (_2!4873 lt!168246) (_2!4873 lt!168256)) lt!169279)))

(declare-fun bs!8639 () Bool)

(assert (= bs!8639 d!35366))

(declare-fun m!166075 () Bool)

(assert (=> bs!8639 m!166075))

(declare-fun m!166077 () Bool)

(assert (=> bs!8639 m!166077))

(declare-fun m!166079 () Bool)

(assert (=> bs!8639 m!166079))

(assert (=> b!111017 d!35366))

(declare-fun d!35368 () Bool)

(declare-fun e!73177 () Bool)

(assert (=> d!35368 e!73177))

(declare-fun res!92088 () Bool)

(assert (=> d!35368 (=> (not res!92088) (not e!73177))))

(declare-fun lt!169280 () BitStream!4100)

(declare-fun lt!169281 () (_ BitVec 64))

(assert (=> d!35368 (= res!92088 (= (bvadd lt!169281 (bvsub (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!167769))) (currentByte!5267 (_2!4873 lt!167769)) (currentBit!5262 (_2!4873 lt!167769))) (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!168256))) (currentByte!5267 (_2!4873 lt!168256)) (currentBit!5262 (_2!4873 lt!168256))))) (bitIndex!0 (size!2313 (buf!2710 lt!169280)) (currentByte!5267 lt!169280) (currentBit!5262 lt!169280))))))

(assert (=> d!35368 (or (not (= (bvand lt!169281 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!167769))) (currentByte!5267 (_2!4873 lt!167769)) (currentBit!5262 (_2!4873 lt!167769))) (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!168256))) (currentByte!5267 (_2!4873 lt!168256)) (currentBit!5262 (_2!4873 lt!168256)))) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!169281 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!169281 (bvsub (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!167769))) (currentByte!5267 (_2!4873 lt!167769)) (currentBit!5262 (_2!4873 lt!167769))) (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!168256))) (currentByte!5267 (_2!4873 lt!168256)) (currentBit!5262 (_2!4873 lt!168256))))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35368 (= lt!169281 (bitIndex!0 (size!2313 (buf!2710 (_2!4875 lt!168247))) (currentByte!5267 (_2!4875 lt!168247)) (currentBit!5262 (_2!4875 lt!168247))))))

(assert (=> d!35368 (= lt!169280 (_2!4873 (moveBitIndex!0 (_2!4875 lt!168247) (bvsub (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!167769))) (currentByte!5267 (_2!4873 lt!167769)) (currentBit!5262 (_2!4873 lt!167769))) (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!168256))) (currentByte!5267 (_2!4873 lt!168256)) (currentBit!5262 (_2!4873 lt!168256)))))))))

(assert (=> d!35368 (moveBitIndexPrecond!0 (_2!4875 lt!168247) (bvsub (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!167769))) (currentByte!5267 (_2!4873 lt!167769)) (currentBit!5262 (_2!4873 lt!167769))) (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!168256))) (currentByte!5267 (_2!4873 lt!168256)) (currentBit!5262 (_2!4873 lt!168256)))))))

(assert (=> d!35368 (= (withMovedBitIndex!0 (_2!4875 lt!168247) (bvsub (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!167769))) (currentByte!5267 (_2!4873 lt!167769)) (currentBit!5262 (_2!4873 lt!167769))) (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!168256))) (currentByte!5267 (_2!4873 lt!168256)) (currentBit!5262 (_2!4873 lt!168256))))) lt!169280)))

(declare-fun b!111538 () Bool)

(assert (=> b!111538 (= e!73177 (= (size!2313 (buf!2710 (_2!4875 lt!168247))) (size!2313 (buf!2710 lt!169280))))))

(assert (= (and d!35368 res!92088) b!111538))

(declare-fun m!166081 () Bool)

(assert (=> d!35368 m!166081))

(declare-fun m!166083 () Bool)

(assert (=> d!35368 m!166083))

(declare-fun m!166085 () Bool)

(assert (=> d!35368 m!166085))

(declare-fun m!166087 () Bool)

(assert (=> d!35368 m!166087))

(assert (=> b!111017 d!35368))

(declare-fun d!35370 () Bool)

(assert (=> d!35370 (validate_offset_bits!1 ((_ sign_extend 32) (size!2313 (buf!2710 (_2!4873 lt!168256)))) ((_ sign_extend 32) (currentByte!5267 (_2!4873 lt!167769))) ((_ sign_extend 32) (currentBit!5262 (_2!4873 lt!167769))) lt!168280)))

(declare-fun lt!169282 () Unit!6794)

(assert (=> d!35370 (= lt!169282 (choose!9 (_2!4873 lt!167769) (buf!2710 (_2!4873 lt!168256)) lt!168280 (BitStream!4101 (buf!2710 (_2!4873 lt!168256)) (currentByte!5267 (_2!4873 lt!167769)) (currentBit!5262 (_2!4873 lt!167769)))))))

(assert (=> d!35370 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4873 lt!167769) (buf!2710 (_2!4873 lt!168256)) lt!168280) lt!169282)))

(declare-fun bs!8640 () Bool)

(assert (= bs!8640 d!35370))

(assert (=> bs!8640 m!164803))

(declare-fun m!166089 () Bool)

(assert (=> bs!8640 m!166089))

(assert (=> b!111017 d!35370))

(declare-fun d!35372 () Bool)

(declare-fun e!73178 () Bool)

(assert (=> d!35372 e!73178))

(declare-fun res!92089 () Bool)

(assert (=> d!35372 (=> (not res!92089) (not e!73178))))

(declare-fun lt!169283 () (_ BitVec 64))

(declare-fun lt!169288 () (_ BitVec 64))

(declare-fun lt!169284 () (_ BitVec 64))

(assert (=> d!35372 (= res!92089 (= lt!169284 (bvsub lt!169288 lt!169283)))))

(assert (=> d!35372 (or (= (bvand lt!169288 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!169283 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!169288 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!169288 lt!169283) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35372 (= lt!169283 (remainingBits!0 ((_ sign_extend 32) (size!2313 (buf!2710 (_2!4873 lt!168256)))) ((_ sign_extend 32) (currentByte!5267 (_2!4873 lt!168256))) ((_ sign_extend 32) (currentBit!5262 (_2!4873 lt!168256)))))))

(declare-fun lt!169286 () (_ BitVec 64))

(declare-fun lt!169287 () (_ BitVec 64))

(assert (=> d!35372 (= lt!169288 (bvmul lt!169286 lt!169287))))

(assert (=> d!35372 (or (= lt!169286 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!169287 (bvsdiv (bvmul lt!169286 lt!169287) lt!169286)))))

(assert (=> d!35372 (= lt!169287 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!35372 (= lt!169286 ((_ sign_extend 32) (size!2313 (buf!2710 (_2!4873 lt!168256)))))))

(assert (=> d!35372 (= lt!169284 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5267 (_2!4873 lt!168256))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5262 (_2!4873 lt!168256)))))))

(assert (=> d!35372 (invariant!0 (currentBit!5262 (_2!4873 lt!168256)) (currentByte!5267 (_2!4873 lt!168256)) (size!2313 (buf!2710 (_2!4873 lt!168256))))))

(assert (=> d!35372 (= (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!168256))) (currentByte!5267 (_2!4873 lt!168256)) (currentBit!5262 (_2!4873 lt!168256))) lt!169284)))

(declare-fun b!111539 () Bool)

(declare-fun res!92090 () Bool)

(assert (=> b!111539 (=> (not res!92090) (not e!73178))))

(assert (=> b!111539 (= res!92090 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!169284))))

(declare-fun b!111540 () Bool)

(declare-fun lt!169285 () (_ BitVec 64))

(assert (=> b!111540 (= e!73178 (bvsle lt!169284 (bvmul lt!169285 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!111540 (or (= lt!169285 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!169285 #b0000000000000000000000000000000000000000000000000000000000001000) lt!169285)))))

(assert (=> b!111540 (= lt!169285 ((_ sign_extend 32) (size!2313 (buf!2710 (_2!4873 lt!168256)))))))

(assert (= (and d!35372 res!92089) b!111539))

(assert (= (and b!111539 res!92090) b!111540))

(declare-fun m!166091 () Bool)

(assert (=> d!35372 m!166091))

(declare-fun m!166093 () Bool)

(assert (=> d!35372 m!166093))

(assert (=> b!111017 d!35372))

(declare-fun d!35374 () Bool)

(declare-fun lt!169289 () tuple2!9242)

(assert (=> d!35374 (= lt!169289 (readBit!0 (_1!4875 lt!168247)))))

(assert (=> d!35374 (= (readBitPure!0 (_1!4875 lt!168247)) (tuple2!9235 (_2!4878 lt!169289) (_1!4878 lt!169289)))))

(declare-fun bs!8641 () Bool)

(assert (= bs!8641 d!35374))

(declare-fun m!166095 () Bool)

(assert (=> bs!8641 m!166095))

(assert (=> b!111017 d!35374))

(declare-fun d!35376 () Bool)

(declare-fun e!73179 () Bool)

(assert (=> d!35376 e!73179))

(declare-fun res!92091 () Bool)

(assert (=> d!35376 (=> (not res!92091) (not e!73179))))

(declare-fun lt!169291 () (_ BitVec 64))

(declare-fun lt!169290 () BitStream!4100)

(assert (=> d!35376 (= res!92091 (= (bvadd lt!169291 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!2313 (buf!2710 lt!169290)) (currentByte!5267 lt!169290) (currentBit!5262 lt!169290))))))

(assert (=> d!35376 (or (not (= (bvand lt!169291 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!169291 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!169291 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35376 (= lt!169291 (bitIndex!0 (size!2313 (buf!2710 (_1!4875 lt!168247))) (currentByte!5267 (_1!4875 lt!168247)) (currentBit!5262 (_1!4875 lt!168247))))))

(assert (=> d!35376 (= lt!169290 (_2!4873 (moveBitIndex!0 (_1!4875 lt!168247) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!35376 (moveBitIndexPrecond!0 (_1!4875 lt!168247) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!35376 (= (withMovedBitIndex!0 (_1!4875 lt!168247) #b0000000000000000000000000000000000000000000000000000000000000001) lt!169290)))

(declare-fun b!111541 () Bool)

(assert (=> b!111541 (= e!73179 (= (size!2313 (buf!2710 (_1!4875 lt!168247))) (size!2313 (buf!2710 lt!169290))))))

(assert (= (and d!35376 res!92091) b!111541))

(declare-fun m!166097 () Bool)

(assert (=> d!35376 m!166097))

(declare-fun m!166099 () Bool)

(assert (=> d!35376 m!166099))

(declare-fun m!166101 () Bool)

(assert (=> d!35376 m!166101))

(declare-fun m!166103 () Bool)

(assert (=> d!35376 m!166103))

(assert (=> b!111017 d!35376))

(assert (=> b!111017 d!34960))

(declare-fun d!35378 () Bool)

(assert (=> d!35378 (validate_offset_bits!1 ((_ sign_extend 32) (size!2313 (buf!2710 (_2!4873 lt!168256)))) ((_ sign_extend 32) (currentByte!5267 (_2!4873 lt!168246))) ((_ sign_extend 32) (currentBit!5262 (_2!4873 lt!168246))) lt!168248)))

(declare-fun lt!169292 () Unit!6794)

(assert (=> d!35378 (= lt!169292 (choose!9 (_2!4873 lt!168246) (buf!2710 (_2!4873 lt!168256)) lt!168248 (BitStream!4101 (buf!2710 (_2!4873 lt!168256)) (currentByte!5267 (_2!4873 lt!168246)) (currentBit!5262 (_2!4873 lt!168246)))))))

(assert (=> d!35378 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4873 lt!168246) (buf!2710 (_2!4873 lt!168256)) lt!168248) lt!169292)))

(declare-fun bs!8642 () Bool)

(assert (= bs!8642 d!35378))

(assert (=> bs!8642 m!164773))

(declare-fun m!166105 () Bool)

(assert (=> bs!8642 m!166105))

(assert (=> b!111017 d!35378))

(declare-fun b!111542 () Bool)

(declare-fun res!92092 () Bool)

(declare-fun e!73181 () Bool)

(assert (=> b!111542 (=> (not res!92092) (not e!73181))))

(declare-fun lt!169312 () tuple2!9236)

(assert (=> b!111542 (= res!92092 (isPrefixOf!0 (_1!4875 lt!169312) (_2!4873 lt!168246)))))

(declare-fun lt!169302 () (_ BitVec 64))

(declare-fun b!111544 () Bool)

(declare-fun lt!169295 () (_ BitVec 64))

(assert (=> b!111544 (= e!73181 (= (_1!4875 lt!169312) (withMovedBitIndex!0 (_2!4875 lt!169312) (bvsub lt!169302 lt!169295))))))

(assert (=> b!111544 (or (= (bvand lt!169302 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!169295 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!169302 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!169302 lt!169295) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!111544 (= lt!169295 (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!168256))) (currentByte!5267 (_2!4873 lt!168256)) (currentBit!5262 (_2!4873 lt!168256))))))

(assert (=> b!111544 (= lt!169302 (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!168246))) (currentByte!5267 (_2!4873 lt!168246)) (currentBit!5262 (_2!4873 lt!168246))))))

(declare-fun b!111545 () Bool)

(declare-fun e!73180 () Unit!6794)

(declare-fun lt!169303 () Unit!6794)

(assert (=> b!111545 (= e!73180 lt!169303)))

(declare-fun lt!169293 () (_ BitVec 64))

(assert (=> b!111545 (= lt!169293 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!169309 () (_ BitVec 64))

(assert (=> b!111545 (= lt!169309 (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!168246))) (currentByte!5267 (_2!4873 lt!168246)) (currentBit!5262 (_2!4873 lt!168246))))))

(assert (=> b!111545 (= lt!169303 (arrayBitRangesEqSymmetric!0 (buf!2710 (_2!4873 lt!168246)) (buf!2710 (_2!4873 lt!168256)) lt!169293 lt!169309))))

(assert (=> b!111545 (arrayBitRangesEq!0 (buf!2710 (_2!4873 lt!168256)) (buf!2710 (_2!4873 lt!168246)) lt!169293 lt!169309)))

(declare-fun b!111546 () Bool)

(declare-fun res!92094 () Bool)

(assert (=> b!111546 (=> (not res!92094) (not e!73181))))

(assert (=> b!111546 (= res!92094 (isPrefixOf!0 (_2!4875 lt!169312) (_2!4873 lt!168256)))))

(declare-fun d!35380 () Bool)

(assert (=> d!35380 e!73181))

(declare-fun res!92093 () Bool)

(assert (=> d!35380 (=> (not res!92093) (not e!73181))))

(assert (=> d!35380 (= res!92093 (isPrefixOf!0 (_1!4875 lt!169312) (_2!4875 lt!169312)))))

(declare-fun lt!169301 () BitStream!4100)

(assert (=> d!35380 (= lt!169312 (tuple2!9237 lt!169301 (_2!4873 lt!168256)))))

(declare-fun lt!169307 () Unit!6794)

(declare-fun lt!169294 () Unit!6794)

(assert (=> d!35380 (= lt!169307 lt!169294)))

(assert (=> d!35380 (isPrefixOf!0 lt!169301 (_2!4873 lt!168256))))

(assert (=> d!35380 (= lt!169294 (lemmaIsPrefixTransitive!0 lt!169301 (_2!4873 lt!168256) (_2!4873 lt!168256)))))

(declare-fun lt!169306 () Unit!6794)

(declare-fun lt!169304 () Unit!6794)

(assert (=> d!35380 (= lt!169306 lt!169304)))

(assert (=> d!35380 (isPrefixOf!0 lt!169301 (_2!4873 lt!168256))))

(assert (=> d!35380 (= lt!169304 (lemmaIsPrefixTransitive!0 lt!169301 (_2!4873 lt!168246) (_2!4873 lt!168256)))))

(declare-fun lt!169297 () Unit!6794)

(assert (=> d!35380 (= lt!169297 e!73180)))

(declare-fun c!6784 () Bool)

(assert (=> d!35380 (= c!6784 (not (= (size!2313 (buf!2710 (_2!4873 lt!168246))) #b00000000000000000000000000000000)))))

(declare-fun lt!169311 () Unit!6794)

(declare-fun lt!169305 () Unit!6794)

(assert (=> d!35380 (= lt!169311 lt!169305)))

(assert (=> d!35380 (isPrefixOf!0 (_2!4873 lt!168256) (_2!4873 lt!168256))))

(assert (=> d!35380 (= lt!169305 (lemmaIsPrefixRefl!0 (_2!4873 lt!168256)))))

(declare-fun lt!169299 () Unit!6794)

(declare-fun lt!169308 () Unit!6794)

(assert (=> d!35380 (= lt!169299 lt!169308)))

(assert (=> d!35380 (= lt!169308 (lemmaIsPrefixRefl!0 (_2!4873 lt!168256)))))

(declare-fun lt!169296 () Unit!6794)

(declare-fun lt!169300 () Unit!6794)

(assert (=> d!35380 (= lt!169296 lt!169300)))

(assert (=> d!35380 (isPrefixOf!0 lt!169301 lt!169301)))

(assert (=> d!35380 (= lt!169300 (lemmaIsPrefixRefl!0 lt!169301))))

(declare-fun lt!169298 () Unit!6794)

(declare-fun lt!169310 () Unit!6794)

(assert (=> d!35380 (= lt!169298 lt!169310)))

(assert (=> d!35380 (isPrefixOf!0 (_2!4873 lt!168246) (_2!4873 lt!168246))))

(assert (=> d!35380 (= lt!169310 (lemmaIsPrefixRefl!0 (_2!4873 lt!168246)))))

(assert (=> d!35380 (= lt!169301 (BitStream!4101 (buf!2710 (_2!4873 lt!168256)) (currentByte!5267 (_2!4873 lt!168246)) (currentBit!5262 (_2!4873 lt!168246))))))

(assert (=> d!35380 (isPrefixOf!0 (_2!4873 lt!168246) (_2!4873 lt!168256))))

(assert (=> d!35380 (= (reader!0 (_2!4873 lt!168246) (_2!4873 lt!168256)) lt!169312)))

(declare-fun b!111543 () Bool)

(declare-fun Unit!6836 () Unit!6794)

(assert (=> b!111543 (= e!73180 Unit!6836)))

(assert (= (and d!35380 c!6784) b!111545))

(assert (= (and d!35380 (not c!6784)) b!111543))

(assert (= (and d!35380 res!92093) b!111542))

(assert (= (and b!111542 res!92092) b!111546))

(assert (= (and b!111546 res!92094) b!111544))

(declare-fun m!166107 () Bool)

(assert (=> b!111546 m!166107))

(declare-fun m!166109 () Bool)

(assert (=> b!111544 m!166109))

(assert (=> b!111544 m!164799))

(assert (=> b!111544 m!164767))

(declare-fun m!166111 () Bool)

(assert (=> b!111542 m!166111))

(declare-fun m!166113 () Bool)

(assert (=> d!35380 m!166113))

(declare-fun m!166115 () Bool)

(assert (=> d!35380 m!166115))

(declare-fun m!166117 () Bool)

(assert (=> d!35380 m!166117))

(declare-fun m!166119 () Bool)

(assert (=> d!35380 m!166119))

(declare-fun m!166121 () Bool)

(assert (=> d!35380 m!166121))

(declare-fun m!166123 () Bool)

(assert (=> d!35380 m!166123))

(declare-fun m!166125 () Bool)

(assert (=> d!35380 m!166125))

(declare-fun m!166127 () Bool)

(assert (=> d!35380 m!166127))

(declare-fun m!166129 () Bool)

(assert (=> d!35380 m!166129))

(declare-fun m!166131 () Bool)

(assert (=> d!35380 m!166131))

(declare-fun m!166133 () Bool)

(assert (=> d!35380 m!166133))

(assert (=> b!111545 m!164767))

(declare-fun m!166135 () Bool)

(assert (=> b!111545 m!166135))

(declare-fun m!166137 () Bool)

(assert (=> b!111545 m!166137))

(assert (=> b!111017 d!35380))

(declare-fun lt!169313 () tuple2!9246)

(declare-fun d!35382 () Bool)

(assert (=> d!35382 (= lt!169313 (readNLeastSignificantBitsLoop!0 (withMovedBitIndex!0 (_1!4875 lt!168247) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!168266 e!72848)))))

(assert (=> d!35382 (= (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4875 lt!168247) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!168266 e!72848)) (tuple2!9239 (_2!4880 lt!169313) (_1!4880 lt!169313)))))

(declare-fun bs!8643 () Bool)

(assert (= bs!8643 d!35382))

(assert (=> bs!8643 m!164783))

(declare-fun m!166139 () Bool)

(assert (=> bs!8643 m!166139))

(assert (=> b!111017 d!35382))

(declare-fun d!35384 () Bool)

(assert (=> d!35384 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2313 (buf!2710 (_2!4873 lt!168256)))) ((_ sign_extend 32) (currentByte!5267 (_2!4873 lt!168246))) ((_ sign_extend 32) (currentBit!5262 (_2!4873 lt!168246))) lt!168248) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2313 (buf!2710 (_2!4873 lt!168256)))) ((_ sign_extend 32) (currentByte!5267 (_2!4873 lt!168246))) ((_ sign_extend 32) (currentBit!5262 (_2!4873 lt!168246)))) lt!168248))))

(declare-fun bs!8644 () Bool)

(assert (= bs!8644 d!35384))

(declare-fun m!166141 () Bool)

(assert (=> bs!8644 m!166141))

(assert (=> b!111017 d!35384))

(declare-fun d!35386 () Bool)

(assert (=> d!35386 (= (invariant!0 (currentBit!5262 lt!168290) (currentByte!5267 lt!168290) (size!2313 (buf!2710 (_2!4873 lt!168256)))) (and (bvsge (currentBit!5262 lt!168290) #b00000000000000000000000000000000) (bvslt (currentBit!5262 lt!168290) #b00000000000000000000000000001000) (bvsge (currentByte!5267 lt!168290) #b00000000000000000000000000000000) (or (bvslt (currentByte!5267 lt!168290) (size!2313 (buf!2710 (_2!4873 lt!168256)))) (and (= (currentBit!5262 lt!168290) #b00000000000000000000000000000000) (= (currentByte!5267 lt!168290) (size!2313 (buf!2710 (_2!4873 lt!168256))))))))))

(assert (=> b!111017 d!35386))

(declare-fun d!35388 () Bool)

(assert (=> d!35388 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2313 (buf!2710 (_2!4873 lt!168256)))) ((_ sign_extend 32) (currentByte!5267 (_2!4873 lt!167769))) ((_ sign_extend 32) (currentBit!5262 (_2!4873 lt!167769))) lt!168280) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2313 (buf!2710 (_2!4873 lt!168256)))) ((_ sign_extend 32) (currentByte!5267 (_2!4873 lt!167769))) ((_ sign_extend 32) (currentBit!5262 (_2!4873 lt!167769)))) lt!168280))))

(declare-fun bs!8645 () Bool)

(assert (= bs!8645 d!35388))

(declare-fun m!166143 () Bool)

(assert (=> bs!8645 m!166143))

(assert (=> b!111017 d!35388))

(declare-fun d!35390 () Bool)

(declare-fun e!73182 () Bool)

(assert (=> d!35390 e!73182))

(declare-fun res!92095 () Bool)

(assert (=> d!35390 (=> (not res!92095) (not e!73182))))

(declare-fun lt!169317 () tuple2!9234)

(declare-fun lt!169315 () tuple2!9234)

(assert (=> d!35390 (= res!92095 (= (bitIndex!0 (size!2313 (buf!2710 (_1!4874 lt!169317))) (currentByte!5267 (_1!4874 lt!169317)) (currentBit!5262 (_1!4874 lt!169317))) (bitIndex!0 (size!2313 (buf!2710 (_1!4874 lt!169315))) (currentByte!5267 (_1!4874 lt!169315)) (currentBit!5262 (_1!4874 lt!169315)))))))

(declare-fun lt!169316 () BitStream!4100)

(declare-fun lt!169314 () Unit!6794)

(assert (=> d!35390 (= lt!169314 (choose!50 lt!168290 (_2!4873 lt!168256) lt!169316 lt!169317 (tuple2!9235 (_1!4874 lt!169317) (_2!4874 lt!169317)) (_1!4874 lt!169317) (_2!4874 lt!169317) lt!169315 (tuple2!9235 (_1!4874 lt!169315) (_2!4874 lt!169315)) (_1!4874 lt!169315) (_2!4874 lt!169315)))))

(assert (=> d!35390 (= lt!169315 (readBitPure!0 lt!169316))))

(assert (=> d!35390 (= lt!169317 (readBitPure!0 lt!168290))))

(assert (=> d!35390 (= lt!169316 (BitStream!4101 (buf!2710 (_2!4873 lt!168256)) (currentByte!5267 lt!168290) (currentBit!5262 lt!168290)))))

(assert (=> d!35390 (invariant!0 (currentBit!5262 lt!168290) (currentByte!5267 lt!168290) (size!2313 (buf!2710 (_2!4873 lt!168256))))))

(assert (=> d!35390 (= (readBitPrefixLemma!0 lt!168290 (_2!4873 lt!168256)) lt!169314)))

(declare-fun b!111547 () Bool)

(assert (=> b!111547 (= e!73182 (= (_2!4874 lt!169317) (_2!4874 lt!169315)))))

(assert (= (and d!35390 res!92095) b!111547))

(declare-fun m!166145 () Bool)

(assert (=> d!35390 m!166145))

(assert (=> d!35390 m!164817))

(declare-fun m!166147 () Bool)

(assert (=> d!35390 m!166147))

(declare-fun m!166149 () Bool)

(assert (=> d!35390 m!166149))

(assert (=> d!35390 m!164811))

(declare-fun m!166151 () Bool)

(assert (=> d!35390 m!166151))

(assert (=> b!111017 d!35390))

(declare-fun b!111548 () Bool)

(declare-fun res!92096 () Bool)

(declare-fun e!73184 () Bool)

(assert (=> b!111548 (=> (not res!92096) (not e!73184))))

(declare-fun lt!169337 () tuple2!9236)

(assert (=> b!111548 (= res!92096 (isPrefixOf!0 (_1!4875 lt!169337) (_2!4873 lt!167769)))))

(declare-fun b!111550 () Bool)

(declare-fun lt!169320 () (_ BitVec 64))

(declare-fun lt!169327 () (_ BitVec 64))

(assert (=> b!111550 (= e!73184 (= (_1!4875 lt!169337) (withMovedBitIndex!0 (_2!4875 lt!169337) (bvsub lt!169327 lt!169320))))))

(assert (=> b!111550 (or (= (bvand lt!169327 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!169320 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!169327 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!169327 lt!169320) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!111550 (= lt!169320 (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!168256))) (currentByte!5267 (_2!4873 lt!168256)) (currentBit!5262 (_2!4873 lt!168256))))))

(assert (=> b!111550 (= lt!169327 (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!167769))) (currentByte!5267 (_2!4873 lt!167769)) (currentBit!5262 (_2!4873 lt!167769))))))

(declare-fun b!111551 () Bool)

(declare-fun e!73183 () Unit!6794)

(declare-fun lt!169328 () Unit!6794)

(assert (=> b!111551 (= e!73183 lt!169328)))

(declare-fun lt!169318 () (_ BitVec 64))

(assert (=> b!111551 (= lt!169318 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!169334 () (_ BitVec 64))

(assert (=> b!111551 (= lt!169334 (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!167769))) (currentByte!5267 (_2!4873 lt!167769)) (currentBit!5262 (_2!4873 lt!167769))))))

(assert (=> b!111551 (= lt!169328 (arrayBitRangesEqSymmetric!0 (buf!2710 (_2!4873 lt!167769)) (buf!2710 (_2!4873 lt!168256)) lt!169318 lt!169334))))

(assert (=> b!111551 (arrayBitRangesEq!0 (buf!2710 (_2!4873 lt!168256)) (buf!2710 (_2!4873 lt!167769)) lt!169318 lt!169334)))

(declare-fun b!111552 () Bool)

(declare-fun res!92098 () Bool)

(assert (=> b!111552 (=> (not res!92098) (not e!73184))))

(assert (=> b!111552 (= res!92098 (isPrefixOf!0 (_2!4875 lt!169337) (_2!4873 lt!168256)))))

(declare-fun d!35392 () Bool)

(assert (=> d!35392 e!73184))

(declare-fun res!92097 () Bool)

(assert (=> d!35392 (=> (not res!92097) (not e!73184))))

(assert (=> d!35392 (= res!92097 (isPrefixOf!0 (_1!4875 lt!169337) (_2!4875 lt!169337)))))

(declare-fun lt!169326 () BitStream!4100)

(assert (=> d!35392 (= lt!169337 (tuple2!9237 lt!169326 (_2!4873 lt!168256)))))

(declare-fun lt!169332 () Unit!6794)

(declare-fun lt!169319 () Unit!6794)

(assert (=> d!35392 (= lt!169332 lt!169319)))

(assert (=> d!35392 (isPrefixOf!0 lt!169326 (_2!4873 lt!168256))))

(assert (=> d!35392 (= lt!169319 (lemmaIsPrefixTransitive!0 lt!169326 (_2!4873 lt!168256) (_2!4873 lt!168256)))))

(declare-fun lt!169331 () Unit!6794)

(declare-fun lt!169329 () Unit!6794)

(assert (=> d!35392 (= lt!169331 lt!169329)))

(assert (=> d!35392 (isPrefixOf!0 lt!169326 (_2!4873 lt!168256))))

(assert (=> d!35392 (= lt!169329 (lemmaIsPrefixTransitive!0 lt!169326 (_2!4873 lt!167769) (_2!4873 lt!168256)))))

(declare-fun lt!169322 () Unit!6794)

(assert (=> d!35392 (= lt!169322 e!73183)))

(declare-fun c!6785 () Bool)

(assert (=> d!35392 (= c!6785 (not (= (size!2313 (buf!2710 (_2!4873 lt!167769))) #b00000000000000000000000000000000)))))

(declare-fun lt!169336 () Unit!6794)

(declare-fun lt!169330 () Unit!6794)

(assert (=> d!35392 (= lt!169336 lt!169330)))

(assert (=> d!35392 (isPrefixOf!0 (_2!4873 lt!168256) (_2!4873 lt!168256))))

(assert (=> d!35392 (= lt!169330 (lemmaIsPrefixRefl!0 (_2!4873 lt!168256)))))

(declare-fun lt!169324 () Unit!6794)

(declare-fun lt!169333 () Unit!6794)

(assert (=> d!35392 (= lt!169324 lt!169333)))

(assert (=> d!35392 (= lt!169333 (lemmaIsPrefixRefl!0 (_2!4873 lt!168256)))))

(declare-fun lt!169321 () Unit!6794)

(declare-fun lt!169325 () Unit!6794)

(assert (=> d!35392 (= lt!169321 lt!169325)))

(assert (=> d!35392 (isPrefixOf!0 lt!169326 lt!169326)))

(assert (=> d!35392 (= lt!169325 (lemmaIsPrefixRefl!0 lt!169326))))

(declare-fun lt!169323 () Unit!6794)

(declare-fun lt!169335 () Unit!6794)

(assert (=> d!35392 (= lt!169323 lt!169335)))

(assert (=> d!35392 (isPrefixOf!0 (_2!4873 lt!167769) (_2!4873 lt!167769))))

(assert (=> d!35392 (= lt!169335 (lemmaIsPrefixRefl!0 (_2!4873 lt!167769)))))

(assert (=> d!35392 (= lt!169326 (BitStream!4101 (buf!2710 (_2!4873 lt!168256)) (currentByte!5267 (_2!4873 lt!167769)) (currentBit!5262 (_2!4873 lt!167769))))))

(assert (=> d!35392 (isPrefixOf!0 (_2!4873 lt!167769) (_2!4873 lt!168256))))

(assert (=> d!35392 (= (reader!0 (_2!4873 lt!167769) (_2!4873 lt!168256)) lt!169337)))

(declare-fun b!111549 () Bool)

(declare-fun Unit!6837 () Unit!6794)

(assert (=> b!111549 (= e!73183 Unit!6837)))

(assert (= (and d!35392 c!6785) b!111551))

(assert (= (and d!35392 (not c!6785)) b!111549))

(assert (= (and d!35392 res!92097) b!111548))

(assert (= (and b!111548 res!92096) b!111552))

(assert (= (and b!111552 res!92098) b!111550))

(declare-fun m!166153 () Bool)

(assert (=> b!111552 m!166153))

(declare-fun m!166155 () Bool)

(assert (=> b!111550 m!166155))

(assert (=> b!111550 m!164799))

(assert (=> b!111550 m!164517))

(declare-fun m!166157 () Bool)

(assert (=> b!111548 m!166157))

(declare-fun m!166159 () Bool)

(assert (=> d!35392 m!166159))

(declare-fun m!166161 () Bool)

(assert (=> d!35392 m!166161))

(declare-fun m!166163 () Bool)

(assert (=> d!35392 m!166163))

(declare-fun m!166165 () Bool)

(assert (=> d!35392 m!166165))

(assert (=> d!35392 m!164595))

(assert (=> d!35392 m!166123))

(declare-fun m!166167 () Bool)

(assert (=> d!35392 m!166167))

(assert (=> d!35392 m!166075))

(assert (=> d!35392 m!164603))

(declare-fun m!166169 () Bool)

(assert (=> d!35392 m!166169))

(assert (=> d!35392 m!166133))

(assert (=> b!111551 m!164517))

(declare-fun m!166171 () Bool)

(assert (=> b!111551 m!166171))

(declare-fun m!166173 () Bool)

(assert (=> b!111551 m!166173))

(assert (=> b!111017 d!35392))

(declare-fun d!35394 () Bool)

(declare-fun lt!169338 () tuple2!9242)

(assert (=> d!35394 (= lt!169338 (readBit!0 lt!168290))))

(assert (=> d!35394 (= (readBitPure!0 lt!168290) (tuple2!9235 (_2!4878 lt!169338) (_1!4878 lt!169338)))))

(declare-fun bs!8646 () Bool)

(assert (= bs!8646 d!35394))

(declare-fun m!166175 () Bool)

(assert (=> bs!8646 m!166175))

(assert (=> b!111017 d!35394))

(declare-fun d!35396 () Bool)

(assert (=> d!35396 (= (invariant!0 (currentBit!5262 (_2!4873 lt!167769)) (currentByte!5267 (_2!4873 lt!167769)) (size!2313 (buf!2710 (_2!4873 lt!168246)))) (and (bvsge (currentBit!5262 (_2!4873 lt!167769)) #b00000000000000000000000000000000) (bvslt (currentBit!5262 (_2!4873 lt!167769)) #b00000000000000000000000000001000) (bvsge (currentByte!5267 (_2!4873 lt!167769)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5267 (_2!4873 lt!167769)) (size!2313 (buf!2710 (_2!4873 lt!168246)))) (and (= (currentBit!5262 (_2!4873 lt!167769)) #b00000000000000000000000000000000) (= (currentByte!5267 (_2!4873 lt!167769)) (size!2313 (buf!2710 (_2!4873 lt!168246))))))))))

(assert (=> b!111017 d!35396))

(declare-fun d!35398 () Bool)

(declare-fun lt!169339 () tuple2!9246)

(assert (=> d!35398 (= lt!169339 (readNLeastSignificantBitsLoop!0 (_1!4875 lt!168262) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!168266 (ite (_2!4874 lt!168281) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!35398 (= (readNLeastSignificantBitsLoopPure!0 (_1!4875 lt!168262) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!168266 (ite (_2!4874 lt!168281) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!9239 (_2!4880 lt!169339) (_1!4880 lt!169339)))))

(declare-fun bs!8647 () Bool)

(assert (= bs!8647 d!35398))

(declare-fun m!166177 () Bool)

(assert (=> bs!8647 m!166177))

(assert (=> b!111017 d!35398))

(declare-fun d!35400 () Bool)

(declare-fun e!73185 () Bool)

(assert (=> d!35400 e!73185))

(declare-fun res!92099 () Bool)

(assert (=> d!35400 (=> (not res!92099) (not e!73185))))

(declare-fun lt!169341 () (_ BitVec 64))

(declare-fun lt!169340 () (_ BitVec 64))

(declare-fun lt!169345 () (_ BitVec 64))

(assert (=> d!35400 (= res!92099 (= lt!169341 (bvsub lt!169345 lt!169340)))))

(assert (=> d!35400 (or (= (bvand lt!169345 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!169340 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!169345 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!169345 lt!169340) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35400 (= lt!169340 (remainingBits!0 ((_ sign_extend 32) (size!2313 (buf!2710 (_1!4874 lt!168284)))) ((_ sign_extend 32) (currentByte!5267 (_1!4874 lt!168284))) ((_ sign_extend 32) (currentBit!5262 (_1!4874 lt!168284)))))))

(declare-fun lt!169343 () (_ BitVec 64))

(declare-fun lt!169344 () (_ BitVec 64))

(assert (=> d!35400 (= lt!169345 (bvmul lt!169343 lt!169344))))

(assert (=> d!35400 (or (= lt!169343 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!169344 (bvsdiv (bvmul lt!169343 lt!169344) lt!169343)))))

(assert (=> d!35400 (= lt!169344 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!35400 (= lt!169343 ((_ sign_extend 32) (size!2313 (buf!2710 (_1!4874 lt!168284)))))))

(assert (=> d!35400 (= lt!169341 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5267 (_1!4874 lt!168284))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5262 (_1!4874 lt!168284)))))))

(assert (=> d!35400 (invariant!0 (currentBit!5262 (_1!4874 lt!168284)) (currentByte!5267 (_1!4874 lt!168284)) (size!2313 (buf!2710 (_1!4874 lt!168284))))))

(assert (=> d!35400 (= (bitIndex!0 (size!2313 (buf!2710 (_1!4874 lt!168284))) (currentByte!5267 (_1!4874 lt!168284)) (currentBit!5262 (_1!4874 lt!168284))) lt!169341)))

(declare-fun b!111553 () Bool)

(declare-fun res!92100 () Bool)

(assert (=> b!111553 (=> (not res!92100) (not e!73185))))

(assert (=> b!111553 (= res!92100 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!169341))))

(declare-fun b!111554 () Bool)

(declare-fun lt!169342 () (_ BitVec 64))

(assert (=> b!111554 (= e!73185 (bvsle lt!169341 (bvmul lt!169342 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!111554 (or (= lt!169342 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!169342 #b0000000000000000000000000000000000000000000000000000000000001000) lt!169342)))))

(assert (=> b!111554 (= lt!169342 ((_ sign_extend 32) (size!2313 (buf!2710 (_1!4874 lt!168284)))))))

(assert (= (and d!35400 res!92099) b!111553))

(assert (= (and b!111553 res!92100) b!111554))

(declare-fun m!166179 () Bool)

(assert (=> d!35400 m!166179))

(declare-fun m!166181 () Bool)

(assert (=> d!35400 m!166181))

(assert (=> b!111017 d!35400))

(declare-fun d!35402 () Bool)

(declare-fun lt!169346 () tuple2!9242)

(assert (=> d!35402 (= lt!169346 (readBit!0 lt!168260))))

(assert (=> d!35402 (= (readBitPure!0 lt!168260) (tuple2!9235 (_2!4878 lt!169346) (_1!4878 lt!169346)))))

(declare-fun bs!8648 () Bool)

(assert (= bs!8648 d!35402))

(declare-fun m!166183 () Bool)

(assert (=> bs!8648 m!166183))

(assert (=> b!111017 d!35402))

(assert (=> b!111017 d!35302))

(declare-fun d!35404 () Bool)

(declare-fun res!92103 () Bool)

(declare-fun e!73187 () Bool)

(assert (=> d!35404 (=> (not res!92103) (not e!73187))))

(assert (=> d!35404 (= res!92103 (= (size!2313 (buf!2710 (_1!4875 lt!167903))) (size!2313 (buf!2710 (_2!4873 lt!167769)))))))

(assert (=> d!35404 (= (isPrefixOf!0 (_1!4875 lt!167903) (_2!4873 lt!167769)) e!73187)))

(declare-fun b!111555 () Bool)

(declare-fun res!92102 () Bool)

(assert (=> b!111555 (=> (not res!92102) (not e!73187))))

(assert (=> b!111555 (= res!92102 (bvsle (bitIndex!0 (size!2313 (buf!2710 (_1!4875 lt!167903))) (currentByte!5267 (_1!4875 lt!167903)) (currentBit!5262 (_1!4875 lt!167903))) (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!167769))) (currentByte!5267 (_2!4873 lt!167769)) (currentBit!5262 (_2!4873 lt!167769)))))))

(declare-fun b!111556 () Bool)

(declare-fun e!73186 () Bool)

(assert (=> b!111556 (= e!73187 e!73186)))

(declare-fun res!92101 () Bool)

(assert (=> b!111556 (=> res!92101 e!73186)))

(assert (=> b!111556 (= res!92101 (= (size!2313 (buf!2710 (_1!4875 lt!167903))) #b00000000000000000000000000000000))))

(declare-fun b!111557 () Bool)

(assert (=> b!111557 (= e!73186 (arrayBitRangesEq!0 (buf!2710 (_1!4875 lt!167903)) (buf!2710 (_2!4873 lt!167769)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2313 (buf!2710 (_1!4875 lt!167903))) (currentByte!5267 (_1!4875 lt!167903)) (currentBit!5262 (_1!4875 lt!167903)))))))

(assert (= (and d!35404 res!92103) b!111555))

(assert (= (and b!111555 res!92102) b!111556))

(assert (= (and b!111556 (not res!92101)) b!111557))

(assert (=> b!111555 m!165747))

(assert (=> b!111555 m!164517))

(assert (=> b!111557 m!165747))

(assert (=> b!111557 m!165747))

(declare-fun m!166185 () Bool)

(assert (=> b!111557 m!166185))

(assert (=> b!110894 d!35404))

(assert (=> d!34824 d!35320))

(declare-fun b!111558 () Bool)

(declare-fun res!92105 () Bool)

(declare-fun lt!169348 () (_ BitVec 32))

(assert (=> b!111558 (= res!92105 (= lt!169348 #b00000000000000000000000000000000))))

(declare-fun e!73191 () Bool)

(assert (=> b!111558 (=> res!92105 e!73191)))

(declare-fun e!73192 () Bool)

(assert (=> b!111558 (= e!73192 e!73191)))

(declare-fun b!111559 () Bool)

(declare-fun e!73193 () Bool)

(declare-fun e!73189 () Bool)

(assert (=> b!111559 (= e!73193 e!73189)))

(declare-fun c!6786 () Bool)

(declare-fun lt!169349 () tuple4!74)

(assert (=> b!111559 (= c!6786 (= (_3!258 lt!169349) (_4!37 lt!169349)))))

(declare-fun d!35406 () Bool)

(declare-fun res!92108 () Bool)

(declare-fun e!73188 () Bool)

(assert (=> d!35406 (=> res!92108 e!73188)))

(assert (=> d!35406 (= res!92108 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2313 (buf!2710 thiss!1305)) (currentByte!5267 thiss!1305) (currentBit!5262 thiss!1305))))))

(assert (=> d!35406 (= (arrayBitRangesEq!0 (buf!2710 thiss!1305) (buf!2710 (_2!4873 lt!167769)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2313 (buf!2710 thiss!1305)) (currentByte!5267 thiss!1305) (currentBit!5262 thiss!1305))) e!73188)))

(declare-fun b!111560 () Bool)

(declare-fun e!73190 () Bool)

(assert (=> b!111560 (= e!73190 (arrayRangesEq!38 (buf!2710 thiss!1305) (buf!2710 (_2!4873 lt!167769)) (_1!4884 lt!169349) (_2!4884 lt!169349)))))

(declare-fun b!111561 () Bool)

(assert (=> b!111561 (= e!73188 e!73193)))

(declare-fun res!92106 () Bool)

(assert (=> b!111561 (=> (not res!92106) (not e!73193))))

(assert (=> b!111561 (= res!92106 e!73190)))

(declare-fun res!92104 () Bool)

(assert (=> b!111561 (=> res!92104 e!73190)))

(assert (=> b!111561 (= res!92104 (bvsge (_1!4884 lt!169349) (_2!4884 lt!169349)))))

(assert (=> b!111561 (= lt!169348 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!2313 (buf!2710 thiss!1305)) (currentByte!5267 thiss!1305) (currentBit!5262 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!169347 () (_ BitVec 32))

(assert (=> b!111561 (= lt!169347 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!111561 (= lt!169349 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2313 (buf!2710 thiss!1305)) (currentByte!5267 thiss!1305) (currentBit!5262 thiss!1305))))))

(declare-fun b!111562 () Bool)

(declare-fun call!1408 () Bool)

(assert (=> b!111562 (= e!73191 call!1408)))

(declare-fun b!111563 () Bool)

(assert (=> b!111563 (= e!73189 e!73192)))

(declare-fun res!92107 () Bool)

(assert (=> b!111563 (= res!92107 (byteRangesEq!0 (select (arr!2906 (buf!2710 thiss!1305)) (_3!258 lt!169349)) (select (arr!2906 (buf!2710 (_2!4873 lt!167769))) (_3!258 lt!169349)) lt!169347 #b00000000000000000000000000001000))))

(assert (=> b!111563 (=> (not res!92107) (not e!73192))))

(declare-fun b!111564 () Bool)

(assert (=> b!111564 (= e!73189 call!1408)))

(declare-fun bm!1405 () Bool)

(assert (=> bm!1405 (= call!1408 (byteRangesEq!0 (ite c!6786 (select (arr!2906 (buf!2710 thiss!1305)) (_3!258 lt!169349)) (select (arr!2906 (buf!2710 thiss!1305)) (_4!37 lt!169349))) (ite c!6786 (select (arr!2906 (buf!2710 (_2!4873 lt!167769))) (_3!258 lt!169349)) (select (arr!2906 (buf!2710 (_2!4873 lt!167769))) (_4!37 lt!169349))) (ite c!6786 lt!169347 #b00000000000000000000000000000000) lt!169348))))

(assert (= (and d!35406 (not res!92108)) b!111561))

(assert (= (and b!111561 (not res!92104)) b!111560))

(assert (= (and b!111561 res!92106) b!111559))

(assert (= (and b!111559 c!6786) b!111564))

(assert (= (and b!111559 (not c!6786)) b!111563))

(assert (= (and b!111563 res!92107) b!111558))

(assert (= (and b!111558 (not res!92105)) b!111562))

(assert (= (or b!111564 b!111562) bm!1405))

(declare-fun m!166187 () Bool)

(assert (=> b!111560 m!166187))

(assert (=> b!111561 m!164519))

(assert (=> b!111561 m!165823))

(declare-fun m!166189 () Bool)

(assert (=> b!111563 m!166189))

(declare-fun m!166191 () Bool)

(assert (=> b!111563 m!166191))

(assert (=> b!111563 m!166189))

(assert (=> b!111563 m!166191))

(declare-fun m!166193 () Bool)

(assert (=> b!111563 m!166193))

(assert (=> bm!1405 m!166191))

(declare-fun m!166195 () Bool)

(assert (=> bm!1405 m!166195))

(declare-fun m!166197 () Bool)

(assert (=> bm!1405 m!166197))

(declare-fun m!166199 () Bool)

(assert (=> bm!1405 m!166199))

(assert (=> bm!1405 m!166189))

(assert (=> b!110851 d!35406))

(assert (=> b!110851 d!34962))

(declare-fun d!35408 () Bool)

(declare-fun e!73194 () Bool)

(assert (=> d!35408 e!73194))

(declare-fun res!92109 () Bool)

(assert (=> d!35408 (=> (not res!92109) (not e!73194))))

(assert (=> d!35408 (= res!92109 (= (buf!2710 (_2!4873 (increaseBitIndex!0 (BitStream!4101 (buf!2710 (_2!4873 lt!167766)) (currentByte!5267 thiss!1305) (currentBit!5262 thiss!1305))))) (buf!2710 (BitStream!4101 (buf!2710 (_2!4873 lt!167766)) (currentByte!5267 thiss!1305) (currentBit!5262 thiss!1305)))))))

(declare-fun lt!169351 () Bool)

(assert (=> d!35408 (= lt!169351 (not (= (bvand ((_ sign_extend 24) (select (arr!2906 (buf!2710 (BitStream!4101 (buf!2710 (_2!4873 lt!167766)) (currentByte!5267 thiss!1305) (currentBit!5262 thiss!1305)))) (currentByte!5267 (BitStream!4101 (buf!2710 (_2!4873 lt!167766)) (currentByte!5267 thiss!1305) (currentBit!5262 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5262 (BitStream!4101 (buf!2710 (_2!4873 lt!167766)) (currentByte!5267 thiss!1305) (currentBit!5262 thiss!1305)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!169353 () tuple2!9242)

(assert (=> d!35408 (= lt!169353 (tuple2!9243 (not (= (bvand ((_ sign_extend 24) (select (arr!2906 (buf!2710 (BitStream!4101 (buf!2710 (_2!4873 lt!167766)) (currentByte!5267 thiss!1305) (currentBit!5262 thiss!1305)))) (currentByte!5267 (BitStream!4101 (buf!2710 (_2!4873 lt!167766)) (currentByte!5267 thiss!1305) (currentBit!5262 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5262 (BitStream!4101 (buf!2710 (_2!4873 lt!167766)) (currentByte!5267 thiss!1305) (currentBit!5262 thiss!1305)))))) #b00000000000000000000000000000000)) (_2!4873 (increaseBitIndex!0 (BitStream!4101 (buf!2710 (_2!4873 lt!167766)) (currentByte!5267 thiss!1305) (currentBit!5262 thiss!1305))))))))

(assert (=> d!35408 (validate_offset_bit!0 ((_ sign_extend 32) (size!2313 (buf!2710 (BitStream!4101 (buf!2710 (_2!4873 lt!167766)) (currentByte!5267 thiss!1305) (currentBit!5262 thiss!1305))))) ((_ sign_extend 32) (currentByte!5267 (BitStream!4101 (buf!2710 (_2!4873 lt!167766)) (currentByte!5267 thiss!1305) (currentBit!5262 thiss!1305)))) ((_ sign_extend 32) (currentBit!5262 (BitStream!4101 (buf!2710 (_2!4873 lt!167766)) (currentByte!5267 thiss!1305) (currentBit!5262 thiss!1305)))))))

(assert (=> d!35408 (= (readBit!0 (BitStream!4101 (buf!2710 (_2!4873 lt!167766)) (currentByte!5267 thiss!1305) (currentBit!5262 thiss!1305))) lt!169353)))

(declare-fun lt!169352 () (_ BitVec 64))

(declare-fun b!111565 () Bool)

(declare-fun lt!169350 () (_ BitVec 64))

(assert (=> b!111565 (= e!73194 (= (bitIndex!0 (size!2313 (buf!2710 (_2!4873 (increaseBitIndex!0 (BitStream!4101 (buf!2710 (_2!4873 lt!167766)) (currentByte!5267 thiss!1305) (currentBit!5262 thiss!1305)))))) (currentByte!5267 (_2!4873 (increaseBitIndex!0 (BitStream!4101 (buf!2710 (_2!4873 lt!167766)) (currentByte!5267 thiss!1305) (currentBit!5262 thiss!1305))))) (currentBit!5262 (_2!4873 (increaseBitIndex!0 (BitStream!4101 (buf!2710 (_2!4873 lt!167766)) (currentByte!5267 thiss!1305) (currentBit!5262 thiss!1305)))))) (bvadd lt!169350 lt!169352)))))

(assert (=> b!111565 (or (not (= (bvand lt!169350 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!169352 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!169350 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!169350 lt!169352) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!111565 (= lt!169352 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!111565 (= lt!169350 (bitIndex!0 (size!2313 (buf!2710 (BitStream!4101 (buf!2710 (_2!4873 lt!167766)) (currentByte!5267 thiss!1305) (currentBit!5262 thiss!1305)))) (currentByte!5267 (BitStream!4101 (buf!2710 (_2!4873 lt!167766)) (currentByte!5267 thiss!1305) (currentBit!5262 thiss!1305))) (currentBit!5262 (BitStream!4101 (buf!2710 (_2!4873 lt!167766)) (currentByte!5267 thiss!1305) (currentBit!5262 thiss!1305)))))))

(declare-fun lt!169354 () Bool)

(assert (=> b!111565 (= lt!169354 (not (= (bvand ((_ sign_extend 24) (select (arr!2906 (buf!2710 (BitStream!4101 (buf!2710 (_2!4873 lt!167766)) (currentByte!5267 thiss!1305) (currentBit!5262 thiss!1305)))) (currentByte!5267 (BitStream!4101 (buf!2710 (_2!4873 lt!167766)) (currentByte!5267 thiss!1305) (currentBit!5262 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5262 (BitStream!4101 (buf!2710 (_2!4873 lt!167766)) (currentByte!5267 thiss!1305) (currentBit!5262 thiss!1305)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!169356 () Bool)

(assert (=> b!111565 (= lt!169356 (not (= (bvand ((_ sign_extend 24) (select (arr!2906 (buf!2710 (BitStream!4101 (buf!2710 (_2!4873 lt!167766)) (currentByte!5267 thiss!1305) (currentBit!5262 thiss!1305)))) (currentByte!5267 (BitStream!4101 (buf!2710 (_2!4873 lt!167766)) (currentByte!5267 thiss!1305) (currentBit!5262 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5262 (BitStream!4101 (buf!2710 (_2!4873 lt!167766)) (currentByte!5267 thiss!1305) (currentBit!5262 thiss!1305)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!169355 () Bool)

(assert (=> b!111565 (= lt!169355 (not (= (bvand ((_ sign_extend 24) (select (arr!2906 (buf!2710 (BitStream!4101 (buf!2710 (_2!4873 lt!167766)) (currentByte!5267 thiss!1305) (currentBit!5262 thiss!1305)))) (currentByte!5267 (BitStream!4101 (buf!2710 (_2!4873 lt!167766)) (currentByte!5267 thiss!1305) (currentBit!5262 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5262 (BitStream!4101 (buf!2710 (_2!4873 lt!167766)) (currentByte!5267 thiss!1305) (currentBit!5262 thiss!1305)))))) #b00000000000000000000000000000000)))))

(assert (= (and d!35408 res!92109) b!111565))

(declare-fun m!166201 () Bool)

(assert (=> d!35408 m!166201))

(declare-fun m!166203 () Bool)

(assert (=> d!35408 m!166203))

(declare-fun m!166205 () Bool)

(assert (=> d!35408 m!166205))

(declare-fun m!166207 () Bool)

(assert (=> d!35408 m!166207))

(assert (=> b!111565 m!166203))

(declare-fun m!166209 () Bool)

(assert (=> b!111565 m!166209))

(declare-fun m!166211 () Bool)

(assert (=> b!111565 m!166211))

(assert (=> b!111565 m!166205))

(assert (=> b!111565 m!166201))

(assert (=> d!34880 d!35408))

(assert (=> d!34888 d!34844))

(declare-fun d!35410 () Bool)

(assert (=> d!35410 (validate_offset_bits!1 ((_ sign_extend 32) (size!2313 (buf!2710 (_2!4873 lt!167766)))) ((_ sign_extend 32) (currentByte!5267 (_2!4873 lt!167769))) ((_ sign_extend 32) (currentBit!5262 (_2!4873 lt!167769))) lt!167760)))

(assert (=> d!35410 true))

(declare-fun _$6!240 () Unit!6794)

(assert (=> d!35410 (= (choose!9 (_2!4873 lt!167769) (buf!2710 (_2!4873 lt!167766)) lt!167760 (BitStream!4101 (buf!2710 (_2!4873 lt!167766)) (currentByte!5267 (_2!4873 lt!167769)) (currentBit!5262 (_2!4873 lt!167769)))) _$6!240)))

(declare-fun bs!8649 () Bool)

(assert (= bs!8649 d!35410))

(assert (=> bs!8649 m!164479))

(assert (=> d!34888 d!35410))

(declare-fun d!35412 () Bool)

(declare-fun res!92112 () Bool)

(declare-fun e!73196 () Bool)

(assert (=> d!35412 (=> (not res!92112) (not e!73196))))

(assert (=> d!35412 (= res!92112 (= (size!2313 (buf!2710 thiss!1305)) (size!2313 (buf!2710 (_2!4873 lt!168384)))))))

(assert (=> d!35412 (= (isPrefixOf!0 thiss!1305 (_2!4873 lt!168384)) e!73196)))

(declare-fun b!111566 () Bool)

(declare-fun res!92111 () Bool)

(assert (=> b!111566 (=> (not res!92111) (not e!73196))))

(assert (=> b!111566 (= res!92111 (bvsle (bitIndex!0 (size!2313 (buf!2710 thiss!1305)) (currentByte!5267 thiss!1305) (currentBit!5262 thiss!1305)) (bitIndex!0 (size!2313 (buf!2710 (_2!4873 lt!168384))) (currentByte!5267 (_2!4873 lt!168384)) (currentBit!5262 (_2!4873 lt!168384)))))))

(declare-fun b!111567 () Bool)

(declare-fun e!73195 () Bool)

(assert (=> b!111567 (= e!73196 e!73195)))

(declare-fun res!92110 () Bool)

(assert (=> b!111567 (=> res!92110 e!73195)))

(assert (=> b!111567 (= res!92110 (= (size!2313 (buf!2710 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!111568 () Bool)

(assert (=> b!111568 (= e!73195 (arrayBitRangesEq!0 (buf!2710 thiss!1305) (buf!2710 (_2!4873 lt!168384)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2313 (buf!2710 thiss!1305)) (currentByte!5267 thiss!1305) (currentBit!5262 thiss!1305))))))

(assert (= (and d!35412 res!92112) b!111566))

(assert (= (and b!111566 res!92111) b!111567))

(assert (= (and b!111567 (not res!92110)) b!111568))

(assert (=> b!111566 m!164519))

(assert (=> b!111566 m!164963))

(assert (=> b!111568 m!164519))

(assert (=> b!111568 m!164519))

(declare-fun m!166213 () Bool)

(assert (=> b!111568 m!166213))

(assert (=> b!111066 d!35412))

(assert (=> d!34884 d!34896))

(declare-fun d!35414 () Bool)

(assert (=> d!35414 (isPrefixOf!0 thiss!1305 (_2!4873 lt!167766))))

(assert (=> d!35414 true))

(declare-fun _$15!174 () Unit!6794)

(assert (=> d!35414 (= (choose!30 thiss!1305 (_2!4873 lt!167769) (_2!4873 lt!167766)) _$15!174)))

(declare-fun bs!8650 () Bool)

(assert (= bs!8650 d!35414))

(assert (=> bs!8650 m!164497))

(assert (=> d!34884 d!35414))

(assert (=> d!34884 d!34816))

(declare-fun d!35416 () Bool)

(declare-fun e!73197 () Bool)

(assert (=> d!35416 e!73197))

(declare-fun res!92113 () Bool)

(assert (=> d!35416 (=> (not res!92113) (not e!73197))))

(declare-fun lt!169358 () (_ BitVec 64))

(declare-fun lt!169357 () (_ BitVec 64))

(declare-fun lt!169362 () (_ BitVec 64))

(assert (=> d!35416 (= res!92113 (= lt!169358 (bvsub lt!169362 lt!169357)))))

(assert (=> d!35416 (or (= (bvand lt!169362 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!169357 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!169362 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!169362 lt!169357) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35416 (= lt!169357 (remainingBits!0 ((_ sign_extend 32) (size!2313 (buf!2710 (_1!4874 lt!168385)))) ((_ sign_extend 32) (currentByte!5267 (_1!4874 lt!168385))) ((_ sign_extend 32) (currentBit!5262 (_1!4874 lt!168385)))))))

(declare-fun lt!169360 () (_ BitVec 64))

(declare-fun lt!169361 () (_ BitVec 64))

(assert (=> d!35416 (= lt!169362 (bvmul lt!169360 lt!169361))))

(assert (=> d!35416 (or (= lt!169360 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!169361 (bvsdiv (bvmul lt!169360 lt!169361) lt!169360)))))

(assert (=> d!35416 (= lt!169361 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!35416 (= lt!169360 ((_ sign_extend 32) (size!2313 (buf!2710 (_1!4874 lt!168385)))))))

(assert (=> d!35416 (= lt!169358 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5267 (_1!4874 lt!168385))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5262 (_1!4874 lt!168385)))))))

(assert (=> d!35416 (invariant!0 (currentBit!5262 (_1!4874 lt!168385)) (currentByte!5267 (_1!4874 lt!168385)) (size!2313 (buf!2710 (_1!4874 lt!168385))))))

(assert (=> d!35416 (= (bitIndex!0 (size!2313 (buf!2710 (_1!4874 lt!168385))) (currentByte!5267 (_1!4874 lt!168385)) (currentBit!5262 (_1!4874 lt!168385))) lt!169358)))

(declare-fun b!111569 () Bool)

(declare-fun res!92114 () Bool)

(assert (=> b!111569 (=> (not res!92114) (not e!73197))))

(assert (=> b!111569 (= res!92114 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!169358))))

(declare-fun b!111570 () Bool)

(declare-fun lt!169359 () (_ BitVec 64))

(assert (=> b!111570 (= e!73197 (bvsle lt!169358 (bvmul lt!169359 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!111570 (or (= lt!169359 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!169359 #b0000000000000000000000000000000000000000000000000000000000001000) lt!169359)))))

(assert (=> b!111570 (= lt!169359 ((_ sign_extend 32) (size!2313 (buf!2710 (_1!4874 lt!168385)))))))

(assert (= (and d!35416 res!92113) b!111569))

(assert (= (and b!111569 res!92114) b!111570))

(declare-fun m!166215 () Bool)

(assert (=> d!35416 m!166215))

(declare-fun m!166217 () Bool)

(assert (=> d!35416 m!166217))

(assert (=> b!111068 d!35416))

(assert (=> b!111068 d!35258))

(declare-fun b!111571 () Bool)

(declare-fun res!92117 () Bool)

(declare-fun e!73199 () Bool)

(assert (=> b!111571 (=> (not res!92117) (not e!73199))))

(declare-fun lt!169363 () (_ BitVec 64))

(declare-fun lt!169371 () tuple2!9246)

(declare-fun lt!169365 () (_ BitVec 64))

(assert (=> b!111571 (= res!92117 (= (bitIndex!0 (size!2313 (buf!2710 (_2!4880 lt!169371))) (currentByte!5267 (_2!4880 lt!169371)) (currentBit!5262 (_2!4880 lt!169371))) (bvadd lt!169365 lt!169363)))))

(assert (=> b!111571 (or (not (= (bvand lt!169365 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!169363 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!169365 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!169365 lt!169363) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!111571 (= lt!169363 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(assert (=> b!111571 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand i!615 #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 i!615) #b10000000000000000000000000000000)))))

(assert (=> b!111571 (= lt!169365 (bitIndex!0 (size!2313 (buf!2710 (_1!4875 lt!167757))) (currentByte!5267 (_1!4875 lt!167757)) (currentBit!5262 (_1!4875 lt!167757))))))

(declare-fun b!111572 () Bool)

(declare-fun e!73200 () Bool)

(assert (=> b!111572 (= e!73199 e!73200)))

(declare-fun res!92119 () Bool)

(assert (=> b!111572 (=> res!92119 e!73200)))

(assert (=> b!111572 (= res!92119 (bvsge i!615 nBits!396))))

(declare-fun d!35418 () Bool)

(assert (=> d!35418 e!73199))

(declare-fun res!92116 () Bool)

(assert (=> d!35418 (=> (not res!92116) (not e!73199))))

(assert (=> d!35418 (= res!92116 (= (buf!2710 (_2!4880 lt!169371)) (buf!2710 (_1!4875 lt!167757))))))

(declare-fun e!73198 () tuple2!9246)

(assert (=> d!35418 (= lt!169371 e!73198)))

(declare-fun c!6787 () Bool)

(assert (=> d!35418 (= c!6787 (= nBits!396 i!615))))

(assert (=> d!35418 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!35418 (= (readNLeastSignificantBitsLoop!0 (_1!4875 lt!167757) nBits!396 i!615 lt!167763) lt!169371)))

(declare-fun b!111573 () Bool)

(declare-fun res!92115 () Bool)

(assert (=> b!111573 (=> (not res!92115) (not e!73199))))

(assert (=> b!111573 (= res!92115 (= (bvand (_1!4880 lt!169371) (onesLSBLong!0 nBits!396)) (_1!4880 lt!169371)))))

(declare-fun b!111574 () Bool)

(declare-fun lt!169364 () tuple2!9246)

(assert (=> b!111574 (= e!73198 (tuple2!9247 (_1!4880 lt!169364) (_2!4880 lt!169364)))))

(declare-fun lt!169369 () tuple2!9242)

(assert (=> b!111574 (= lt!169369 (readBit!0 (_1!4875 lt!167757)))))

(assert (=> b!111574 (= lt!169364 (readNLeastSignificantBitsLoop!0 (_2!4878 lt!169369) nBits!396 (bvadd i!615 #b00000000000000000000000000000001) (bvor lt!167763 (ite (_1!4878 lt!169369) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!111575 () Bool)

(declare-fun res!92118 () Bool)

(assert (=> b!111575 (=> (not res!92118) (not e!73199))))

(declare-fun lt!169367 () (_ BitVec 64))

(declare-fun lt!169370 () (_ BitVec 64))

(assert (=> b!111575 (= res!92118 (= (bvlshr (_1!4880 lt!169371) lt!169370) (bvlshr lt!167763 lt!169367)))))

(assert (=> b!111575 (and (bvsge lt!169367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!169367 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!111575 (= lt!169367 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(assert (=> b!111575 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand i!615 #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 i!615) #b10000000000000000000000000000000)))))

(assert (=> b!111575 (and (bvsge lt!169370 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!169370 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!111575 (= lt!169370 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(assert (=> b!111575 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand i!615 #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 i!615) #b10000000000000000000000000000000)))))

(declare-fun b!111576 () Bool)

(assert (=> b!111576 (= e!73198 (tuple2!9247 lt!167763 (_1!4875 lt!167757)))))

(declare-fun lt!169366 () (_ BitVec 64))

(declare-fun b!111577 () Bool)

(assert (=> b!111577 (= e!73200 (= (= (bvand (bvlshr (_1!4880 lt!169371) lt!169366) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!4874 (readBitPure!0 (_1!4875 lt!167757)))))))

(assert (=> b!111577 (and (bvsge lt!169366 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!169366 #b0000000000000000000000000000000000000000000000000000000001000000))))

(declare-fun lt!169368 () (_ BitVec 32))

(assert (=> b!111577 (= lt!169366 ((_ sign_extend 32) (bvsub lt!169368 i!615)))))

(assert (=> b!111577 (or (= (bvand lt!169368 #b10000000000000000000000000000000) (bvand i!615 #b10000000000000000000000000000000)) (= (bvand lt!169368 #b10000000000000000000000000000000) (bvand (bvsub lt!169368 i!615) #b10000000000000000000000000000000)))))

(assert (=> b!111577 (= lt!169368 (bvsub nBits!396 #b00000000000000000000000000000001))))

(assert (=> b!111577 (or (= (bvand nBits!396 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))

(assert (= (and d!35418 c!6787) b!111576))

(assert (= (and d!35418 (not c!6787)) b!111574))

(assert (= (and d!35418 res!92116) b!111571))

(assert (= (and b!111571 res!92117) b!111575))

(assert (= (and b!111575 res!92118) b!111573))

(assert (= (and b!111573 res!92115) b!111572))

(assert (= (and b!111572 (not res!92119)) b!111577))

(declare-fun m!166219 () Bool)

(assert (=> b!111571 m!166219))

(assert (=> b!111571 m!165861))

(assert (=> b!111573 m!164515))

(assert (=> b!111574 m!164615))

(declare-fun m!166221 () Bool)

(assert (=> b!111574 m!166221))

(assert (=> b!111577 m!164475))

(assert (=> d!34838 d!35418))

(assert (=> b!110906 d!34962))

(declare-fun d!35420 () Bool)

(assert (=> d!35420 (arrayBitRangesEq!0 (buf!2710 (_2!4873 lt!167766)) (buf!2710 thiss!1305) lt!167929 lt!167945)))

(declare-fun lt!169372 () Unit!6794)

(assert (=> d!35420 (= lt!169372 (choose!8 (buf!2710 thiss!1305) (buf!2710 (_2!4873 lt!167766)) lt!167929 lt!167945))))

(assert (=> d!35420 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!167929) (bvsle lt!167929 lt!167945))))

(assert (=> d!35420 (= (arrayBitRangesEqSymmetric!0 (buf!2710 thiss!1305) (buf!2710 (_2!4873 lt!167766)) lt!167929 lt!167945) lt!169372)))

(declare-fun bs!8651 () Bool)

(assert (= bs!8651 d!35420))

(assert (=> bs!8651 m!164659))

(declare-fun m!166223 () Bool)

(assert (=> bs!8651 m!166223))

(assert (=> b!110906 d!35420))

(declare-fun b!111578 () Bool)

(declare-fun res!92121 () Bool)

(declare-fun lt!169374 () (_ BitVec 32))

(assert (=> b!111578 (= res!92121 (= lt!169374 #b00000000000000000000000000000000))))

(declare-fun e!73204 () Bool)

(assert (=> b!111578 (=> res!92121 e!73204)))

(declare-fun e!73205 () Bool)

(assert (=> b!111578 (= e!73205 e!73204)))

(declare-fun b!111579 () Bool)

(declare-fun e!73206 () Bool)

(declare-fun e!73202 () Bool)

(assert (=> b!111579 (= e!73206 e!73202)))

(declare-fun c!6788 () Bool)

(declare-fun lt!169375 () tuple4!74)

(assert (=> b!111579 (= c!6788 (= (_3!258 lt!169375) (_4!37 lt!169375)))))

(declare-fun d!35422 () Bool)

(declare-fun res!92124 () Bool)

(declare-fun e!73201 () Bool)

(assert (=> d!35422 (=> res!92124 e!73201)))

(assert (=> d!35422 (= res!92124 (bvsge lt!167929 lt!167945))))

(assert (=> d!35422 (= (arrayBitRangesEq!0 (buf!2710 (_2!4873 lt!167766)) (buf!2710 thiss!1305) lt!167929 lt!167945) e!73201)))

(declare-fun e!73203 () Bool)

(declare-fun b!111580 () Bool)

(assert (=> b!111580 (= e!73203 (arrayRangesEq!38 (buf!2710 (_2!4873 lt!167766)) (buf!2710 thiss!1305) (_1!4884 lt!169375) (_2!4884 lt!169375)))))

(declare-fun b!111581 () Bool)

(assert (=> b!111581 (= e!73201 e!73206)))

(declare-fun res!92122 () Bool)

(assert (=> b!111581 (=> (not res!92122) (not e!73206))))

(assert (=> b!111581 (= res!92122 e!73203)))

(declare-fun res!92120 () Bool)

(assert (=> b!111581 (=> res!92120 e!73203)))

(assert (=> b!111581 (= res!92120 (bvsge (_1!4884 lt!169375) (_2!4884 lt!169375)))))

(assert (=> b!111581 (= lt!169374 ((_ extract 31 0) (bvsrem lt!167945 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!169373 () (_ BitVec 32))

(assert (=> b!111581 (= lt!169373 ((_ extract 31 0) (bvsrem lt!167929 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!111581 (= lt!169375 (arrayBitIndices!0 lt!167929 lt!167945))))

(declare-fun b!111582 () Bool)

(declare-fun call!1409 () Bool)

(assert (=> b!111582 (= e!73204 call!1409)))

(declare-fun b!111583 () Bool)

(assert (=> b!111583 (= e!73202 e!73205)))

(declare-fun res!92123 () Bool)

(assert (=> b!111583 (= res!92123 (byteRangesEq!0 (select (arr!2906 (buf!2710 (_2!4873 lt!167766))) (_3!258 lt!169375)) (select (arr!2906 (buf!2710 thiss!1305)) (_3!258 lt!169375)) lt!169373 #b00000000000000000000000000001000))))

(assert (=> b!111583 (=> (not res!92123) (not e!73205))))

(declare-fun b!111584 () Bool)

(assert (=> b!111584 (= e!73202 call!1409)))

(declare-fun bm!1406 () Bool)

(assert (=> bm!1406 (= call!1409 (byteRangesEq!0 (ite c!6788 (select (arr!2906 (buf!2710 (_2!4873 lt!167766))) (_3!258 lt!169375)) (select (arr!2906 (buf!2710 (_2!4873 lt!167766))) (_4!37 lt!169375))) (ite c!6788 (select (arr!2906 (buf!2710 thiss!1305)) (_3!258 lt!169375)) (select (arr!2906 (buf!2710 thiss!1305)) (_4!37 lt!169375))) (ite c!6788 lt!169373 #b00000000000000000000000000000000) lt!169374))))

(assert (= (and d!35422 (not res!92124)) b!111581))

(assert (= (and b!111581 (not res!92120)) b!111580))

(assert (= (and b!111581 res!92122) b!111579))

(assert (= (and b!111579 c!6788) b!111584))

(assert (= (and b!111579 (not c!6788)) b!111583))

(assert (= (and b!111583 res!92123) b!111578))

(assert (= (and b!111578 (not res!92121)) b!111582))

(assert (= (or b!111584 b!111582) bm!1406))

(declare-fun m!166225 () Bool)

(assert (=> b!111580 m!166225))

(declare-fun m!166227 () Bool)

(assert (=> b!111581 m!166227))

(declare-fun m!166229 () Bool)

(assert (=> b!111583 m!166229))

(declare-fun m!166231 () Bool)

(assert (=> b!111583 m!166231))

(assert (=> b!111583 m!166229))

(assert (=> b!111583 m!166231))

(declare-fun m!166233 () Bool)

(assert (=> b!111583 m!166233))

(assert (=> bm!1406 m!166231))

(declare-fun m!166235 () Bool)

(assert (=> bm!1406 m!166235))

(declare-fun m!166237 () Bool)

(assert (=> bm!1406 m!166237))

(declare-fun m!166239 () Bool)

(assert (=> bm!1406 m!166239))

(assert (=> bm!1406 m!166229))

(assert (=> b!110906 d!35422))

(assert (=> d!34842 d!34840))

(declare-fun d!35424 () Bool)

(assert (=> d!35424 (validate_offset_bits!1 ((_ sign_extend 32) (size!2313 (buf!2710 (_2!4873 lt!167766)))) ((_ sign_extend 32) (currentByte!5267 thiss!1305)) ((_ sign_extend 32) (currentBit!5262 thiss!1305)) lt!167771)))

(assert (=> d!35424 true))

(declare-fun _$6!241 () Unit!6794)

(assert (=> d!35424 (= (choose!9 thiss!1305 (buf!2710 (_2!4873 lt!167766)) lt!167771 (BitStream!4101 (buf!2710 (_2!4873 lt!167766)) (currentByte!5267 thiss!1305) (currentBit!5262 thiss!1305))) _$6!241)))

(declare-fun bs!8652 () Bool)

(assert (= bs!8652 d!35424))

(assert (=> bs!8652 m!164465))

(assert (=> d!34842 d!35424))

(push 1)

(assert (not b!111438))

(assert (not b!111415))

(assert (not d!35222))

(assert (not d!35394))

(assert (not d!35360))

(assert (not b!111577))

(assert (not bm!1404))

(assert (not b!111542))

(assert (not d!35358))

(assert (not d!35286))

(assert (not b!111498))

(assert (not d!35230))

(assert (not b!111565))

(assert (not b!111551))

(assert (not b!111418))

(assert (not d!35410))

(assert (not d!35278))

(assert (not d!35232))

(assert (not b!111443))

(assert (not b!111537))

(assert (not d!35332))

(assert (not b!111535))

(assert (not b!111491))

(assert (not d!35344))

(assert (not b!111413))

(assert (not b!111424))

(assert (not b!111416))

(assert (not b!111531))

(assert (not b!111372))

(assert (not b!111500))

(assert (not d!35280))

(assert (not b!111557))

(assert (not b!111520))

(assert (not b!111519))

(assert (not b!111437))

(assert (not b!111536))

(assert (not b!111571))

(assert (not d!35414))

(assert (not b!111398))

(assert (not b!111423))

(assert (not b!111527))

(assert (not b!111401))

(assert (not d!35226))

(assert (not b!111513))

(assert (not d!35356))

(assert (not d!35382))

(assert (not d!35292))

(assert (not b!111544))

(assert (not d!35402))

(assert (not b!111573))

(assert (not b!111580))

(assert (not d!35362))

(assert (not b!111545))

(assert (not b!111403))

(assert (not d!35268))

(assert (not b!111492))

(assert (not b!111484))

(assert (not b!111407))

(assert (not b!111548))

(assert (not d!35266))

(assert (not d!35326))

(assert (not b!111510))

(assert (not b!111392))

(assert (not b!111444))

(assert (not d!35424))

(assert (not d!35374))

(assert (not b!111493))

(assert (not b!111455))

(assert (not b!111563))

(assert (not d!35372))

(assert (not d!35388))

(assert (not d!35238))

(assert (not b!111499))

(assert (not d!35378))

(assert (not b!111507))

(assert (not d!35304))

(assert (not b!111440))

(assert (not b!111509))

(assert (not d!35264))

(assert (not bm!1403))

(assert (not d!35298))

(assert (not d!35300))

(assert (not b!111457))

(assert (not d!35284))

(assert (not bm!1406))

(assert (not d!35416))

(assert (not d!35336))

(assert (not b!111390))

(assert (not b!111504))

(assert (not d!35258))

(assert (not d!35400))

(assert (not d!35376))

(assert (not b!111487))

(assert (not d!35338))

(assert (not d!35306))

(assert (not b!111488))

(assert (not b!111436))

(assert (not d!35260))

(assert (not d!35354))

(assert (not b!111574))

(assert (not b!111410))

(assert (not d!35366))

(assert (not b!111496))

(assert (not b!111481))

(assert (not b!111400))

(assert (not b!111495))

(assert (not b!111583))

(assert (not b!111560))

(assert (not d!35390))

(assert (not b!111534))

(assert (not d!35252))

(assert (not b!111483))

(assert (not b!111439))

(assert (not b!111566))

(assert (not b!111512))

(assert (not d!35420))

(assert (not d!35380))

(assert (not b!111389))

(assert (not b!111441))

(assert (not b!111454))

(assert (not b!111530))

(assert (not b!111529))

(assert (not d!35328))

(assert (not d!35288))

(assert (not d!35334))

(assert (not d!35384))

(assert (not b!111412))

(assert (not b!111581))

(assert (not d!35330))

(assert (not b!111561))

(assert (not d!35398))

(assert (not b!111506))

(assert (not b!111532))

(assert (not b!111533))

(assert (not b!111515))

(assert (not b!111466))

(assert (not d!35242))

(assert (not b!111568))

(assert (not b!111555))

(assert (not d!35262))

(assert (not b!111370))

(assert (not d!35368))

(assert (not b!111546))

(assert (not b!111518))

(assert (not d!35352))

(assert (not d!35294))

(assert (not d!35248))

(assert (not b!111404))

(assert (not b!111406))

(assert (not d!35392))

(assert (not b!111409))

(assert (not b!111446))

(assert (not b!111552))

(assert (not d!35350))

(assert (not d!35234))

(assert (not b!111550))

(assert (not d!35214))

(assert (not d!35370))

(assert (not d!35408))

(assert (not bm!1402))

(assert (not bm!1405))

(assert (not b!111490))

(assert (not b!111517))

(check-sat)

(pop 1)

(push 1)

(check-sat)

