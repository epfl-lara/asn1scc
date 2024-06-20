; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53744 () Bool)

(assert start!53744)

(declare-fun b!250329 () Bool)

(declare-fun res!209558 () Bool)

(declare-fun e!173525 () Bool)

(assert (=> b!250329 (=> (not res!209558) (not e!173525))))

(declare-datatypes ((array!13653 0))(
  ( (array!13654 (arr!6977 (Array (_ BitVec 32) (_ BitVec 8))) (size!5990 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10902 0))(
  ( (BitStream!10903 (buf!6483 array!13653) (currentByte!11914 (_ BitVec 32)) (currentBit!11909 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!18116 0))(
  ( (Unit!18117) )
))
(declare-datatypes ((tuple2!21492 0))(
  ( (tuple2!21493 (_1!11671 Unit!18116) (_2!11671 BitStream!10902)) )
))
(declare-fun lt!388892 () tuple2!21492)

(declare-fun lt!388895 () tuple2!21492)

(declare-fun isPrefixOf!0 (BitStream!10902 BitStream!10902) Bool)

(assert (=> b!250329 (= res!209558 (isPrefixOf!0 (_2!11671 lt!388892) (_2!11671 lt!388895)))))

(declare-fun b!250330 () Bool)

(declare-fun e!173518 () Bool)

(declare-fun thiss!1005 () BitStream!10902)

(declare-fun array_inv!5731 (array!13653) Bool)

(assert (=> b!250330 (= e!173518 (array_inv!5731 (buf!6483 thiss!1005)))))

(declare-fun b!250331 () Bool)

(declare-fun res!209562 () Bool)

(declare-fun e!173517 () Bool)

(assert (=> b!250331 (=> (not res!209562) (not e!173517))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(assert (=> b!250331 (= res!209562 (bvslt from!289 nBits!297))))

(declare-fun b!250332 () Bool)

(declare-datatypes ((tuple2!21494 0))(
  ( (tuple2!21495 (_1!11672 BitStream!10902) (_2!11672 Bool)) )
))
(declare-fun lt!388896 () tuple2!21494)

(declare-datatypes ((tuple2!21496 0))(
  ( (tuple2!21497 (_1!11673 BitStream!10902) (_2!11673 BitStream!10902)) )
))
(declare-fun lt!388901 () tuple2!21496)

(assert (=> b!250332 (= e!173525 (not (or (not (_2!11672 lt!388896)) (not (= (_1!11672 lt!388896) (_2!11673 lt!388901))))))))

(declare-fun bit!26 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!10902 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21494)

(assert (=> b!250332 (= lt!388896 (checkBitsLoopPure!0 (_1!11673 lt!388901) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!388902 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!250332 (validate_offset_bits!1 ((_ sign_extend 32) (size!5990 (buf!6483 (_2!11671 lt!388895)))) ((_ sign_extend 32) (currentByte!11914 (_2!11671 lt!388892))) ((_ sign_extend 32) (currentBit!11909 (_2!11671 lt!388892))) lt!388902)))

(declare-fun lt!388894 () Unit!18116)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10902 array!13653 (_ BitVec 64)) Unit!18116)

(assert (=> b!250332 (= lt!388894 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11671 lt!388892) (buf!6483 (_2!11671 lt!388895)) lt!388902))))

(declare-fun reader!0 (BitStream!10902 BitStream!10902) tuple2!21496)

(assert (=> b!250332 (= lt!388901 (reader!0 (_2!11671 lt!388892) (_2!11671 lt!388895)))))

(declare-fun b!250333 () Bool)

(declare-fun e!173520 () Bool)

(assert (=> b!250333 (= e!173520 e!173525)))

(declare-fun res!209563 () Bool)

(assert (=> b!250333 (=> (not res!209563) (not e!173525))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!250333 (= res!209563 (= (bitIndex!0 (size!5990 (buf!6483 (_2!11671 lt!388895))) (currentByte!11914 (_2!11671 lt!388895)) (currentBit!11909 (_2!11671 lt!388895))) (bvadd (bitIndex!0 (size!5990 (buf!6483 (_2!11671 lt!388892))) (currentByte!11914 (_2!11671 lt!388892)) (currentBit!11909 (_2!11671 lt!388892))) lt!388902)))))

(assert (=> b!250333 (= lt!388902 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun res!209561 () Bool)

(assert (=> start!53744 (=> (not res!209561) (not e!173517))))

(assert (=> start!53744 (= res!209561 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53744 e!173517))

(assert (=> start!53744 true))

(declare-fun inv!12 (BitStream!10902) Bool)

(assert (=> start!53744 (and (inv!12 thiss!1005) e!173518)))

(declare-fun b!250334 () Bool)

(declare-fun e!173519 () Bool)

(declare-fun e!173524 () Bool)

(assert (=> b!250334 (= e!173519 e!173524)))

(declare-fun res!209560 () Bool)

(assert (=> b!250334 (=> (not res!209560) (not e!173524))))

(declare-fun lt!388899 () (_ BitVec 64))

(declare-fun lt!388898 () (_ BitVec 64))

(assert (=> b!250334 (= res!209560 (= lt!388899 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!388898)))))

(assert (=> b!250334 (= lt!388899 (bitIndex!0 (size!5990 (buf!6483 (_2!11671 lt!388892))) (currentByte!11914 (_2!11671 lt!388892)) (currentBit!11909 (_2!11671 lt!388892))))))

(assert (=> b!250334 (= lt!388898 (bitIndex!0 (size!5990 (buf!6483 thiss!1005)) (currentByte!11914 thiss!1005) (currentBit!11909 thiss!1005)))))

(declare-fun b!250335 () Bool)

(declare-fun e!173521 () Bool)

(assert (=> b!250335 (= e!173524 e!173521)))

(declare-fun res!209568 () Bool)

(assert (=> b!250335 (=> (not res!209568) (not e!173521))))

(declare-fun lt!388893 () tuple2!21494)

(assert (=> b!250335 (= res!209568 (and (= (_2!11672 lt!388893) bit!26) (= (_1!11672 lt!388893) (_2!11671 lt!388892))))))

(declare-fun readBitPure!0 (BitStream!10902) tuple2!21494)

(declare-fun readerFrom!0 (BitStream!10902 (_ BitVec 32) (_ BitVec 32)) BitStream!10902)

(assert (=> b!250335 (= lt!388893 (readBitPure!0 (readerFrom!0 (_2!11671 lt!388892) (currentBit!11909 thiss!1005) (currentByte!11914 thiss!1005))))))

(declare-fun b!250336 () Bool)

(declare-fun e!173523 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!250336 (= e!173523 (invariant!0 (currentBit!11909 thiss!1005) (currentByte!11914 thiss!1005) (size!5990 (buf!6483 (_2!11671 lt!388892)))))))

(declare-fun b!250337 () Bool)

(assert (=> b!250337 (= e!173521 (= (bitIndex!0 (size!5990 (buf!6483 (_1!11672 lt!388893))) (currentByte!11914 (_1!11672 lt!388893)) (currentBit!11909 (_1!11672 lt!388893))) lt!388899))))

(declare-fun b!250338 () Bool)

(declare-fun res!209566 () Bool)

(assert (=> b!250338 (=> (not res!209566) (not e!173524))))

(assert (=> b!250338 (= res!209566 (isPrefixOf!0 thiss!1005 (_2!11671 lt!388892)))))

(declare-fun b!250339 () Bool)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!250339 (= e!173517 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!5990 (buf!6483 (_2!11671 lt!388892)))) ((_ sign_extend 32) (currentByte!11914 thiss!1005)) ((_ sign_extend 32) (currentBit!11909 thiss!1005)))))))

(assert (=> b!250339 e!173523))

(declare-fun res!209565 () Bool)

(assert (=> b!250339 (=> (not res!209565) (not e!173523))))

(assert (=> b!250339 (= res!209565 (isPrefixOf!0 thiss!1005 (_2!11671 lt!388895)))))

(declare-fun lt!388900 () Unit!18116)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10902 BitStream!10902 BitStream!10902) Unit!18116)

(assert (=> b!250339 (= lt!388900 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11671 lt!388892) (_2!11671 lt!388895)))))

(assert (=> b!250339 e!173520))

(declare-fun res!209567 () Bool)

(assert (=> b!250339 (=> (not res!209567) (not e!173520))))

(assert (=> b!250339 (= res!209567 (= (size!5990 (buf!6483 (_2!11671 lt!388892))) (size!5990 (buf!6483 (_2!11671 lt!388895)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10902 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21492)

(assert (=> b!250339 (= lt!388895 (appendNBitsLoop!0 (_2!11671 lt!388892) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!250339 (validate_offset_bits!1 ((_ sign_extend 32) (size!5990 (buf!6483 (_2!11671 lt!388892)))) ((_ sign_extend 32) (currentByte!11914 (_2!11671 lt!388892))) ((_ sign_extend 32) (currentBit!11909 (_2!11671 lt!388892))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!388897 () Unit!18116)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10902 BitStream!10902 (_ BitVec 64) (_ BitVec 64)) Unit!18116)

(assert (=> b!250339 (= lt!388897 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11671 lt!388892) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!250339 e!173519))

(declare-fun res!209559 () Bool)

(assert (=> b!250339 (=> (not res!209559) (not e!173519))))

(assert (=> b!250339 (= res!209559 (= (size!5990 (buf!6483 thiss!1005)) (size!5990 (buf!6483 (_2!11671 lt!388892)))))))

(declare-fun appendBit!0 (BitStream!10902 Bool) tuple2!21492)

(assert (=> b!250339 (= lt!388892 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!250340 () Bool)

(declare-fun res!209564 () Bool)

(assert (=> b!250340 (=> (not res!209564) (not e!173517))))

(assert (=> b!250340 (= res!209564 (validate_offset_bits!1 ((_ sign_extend 32) (size!5990 (buf!6483 thiss!1005))) ((_ sign_extend 32) (currentByte!11914 thiss!1005)) ((_ sign_extend 32) (currentBit!11909 thiss!1005)) (bvsub nBits!297 from!289)))))

(assert (= (and start!53744 res!209561) b!250340))

(assert (= (and b!250340 res!209564) b!250331))

(assert (= (and b!250331 res!209562) b!250339))

(assert (= (and b!250339 res!209559) b!250334))

(assert (= (and b!250334 res!209560) b!250338))

(assert (= (and b!250338 res!209566) b!250335))

(assert (= (and b!250335 res!209568) b!250337))

(assert (= (and b!250339 res!209567) b!250333))

(assert (= (and b!250333 res!209563) b!250329))

(assert (= (and b!250329 res!209558) b!250332))

(assert (= (and b!250339 res!209565) b!250336))

(assert (= start!53744 b!250330))

(declare-fun m!376789 () Bool)

(assert (=> b!250329 m!376789))

(declare-fun m!376791 () Bool)

(assert (=> b!250332 m!376791))

(declare-fun m!376793 () Bool)

(assert (=> b!250332 m!376793))

(declare-fun m!376795 () Bool)

(assert (=> b!250332 m!376795))

(declare-fun m!376797 () Bool)

(assert (=> b!250332 m!376797))

(declare-fun m!376799 () Bool)

(assert (=> b!250336 m!376799))

(declare-fun m!376801 () Bool)

(assert (=> b!250334 m!376801))

(declare-fun m!376803 () Bool)

(assert (=> b!250334 m!376803))

(declare-fun m!376805 () Bool)

(assert (=> b!250338 m!376805))

(declare-fun m!376807 () Bool)

(assert (=> b!250339 m!376807))

(declare-fun m!376809 () Bool)

(assert (=> b!250339 m!376809))

(declare-fun m!376811 () Bool)

(assert (=> b!250339 m!376811))

(declare-fun m!376813 () Bool)

(assert (=> b!250339 m!376813))

(declare-fun m!376815 () Bool)

(assert (=> b!250339 m!376815))

(declare-fun m!376817 () Bool)

(assert (=> b!250339 m!376817))

(declare-fun m!376819 () Bool)

(assert (=> b!250339 m!376819))

(declare-fun m!376821 () Bool)

(assert (=> b!250330 m!376821))

(declare-fun m!376823 () Bool)

(assert (=> b!250340 m!376823))

(declare-fun m!376825 () Bool)

(assert (=> start!53744 m!376825))

(declare-fun m!376827 () Bool)

(assert (=> b!250335 m!376827))

(assert (=> b!250335 m!376827))

(declare-fun m!376829 () Bool)

(assert (=> b!250335 m!376829))

(declare-fun m!376831 () Bool)

(assert (=> b!250333 m!376831))

(assert (=> b!250333 m!376801))

(declare-fun m!376833 () Bool)

(assert (=> b!250337 m!376833))

(check-sat (not start!53744) (not b!250333) (not b!250336) (not b!250332) (not b!250329) (not b!250335) (not b!250339) (not b!250340) (not b!250337) (not b!250334) (not b!250330) (not b!250338))
(check-sat)
(get-model)

(declare-fun d!83760 () Bool)

(assert (=> d!83760 (= (array_inv!5731 (buf!6483 thiss!1005)) (bvsge (size!5990 (buf!6483 thiss!1005)) #b00000000000000000000000000000000))))

(assert (=> b!250330 d!83760))

(declare-fun d!83762 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!83762 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5990 (buf!6483 thiss!1005))) ((_ sign_extend 32) (currentByte!11914 thiss!1005)) ((_ sign_extend 32) (currentBit!11909 thiss!1005)) (bvsub nBits!297 from!289)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5990 (buf!6483 thiss!1005))) ((_ sign_extend 32) (currentByte!11914 thiss!1005)) ((_ sign_extend 32) (currentBit!11909 thiss!1005))) (bvsub nBits!297 from!289)))))

(declare-fun bs!21233 () Bool)

(assert (= bs!21233 d!83762))

(declare-fun m!376881 () Bool)

(assert (=> bs!21233 m!376881))

(assert (=> b!250340 d!83762))

(declare-fun d!83764 () Bool)

(declare-fun res!209610 () Bool)

(declare-fun e!173558 () Bool)

(assert (=> d!83764 (=> (not res!209610) (not e!173558))))

(assert (=> d!83764 (= res!209610 (= (size!5990 (buf!6483 (_2!11671 lt!388892))) (size!5990 (buf!6483 (_2!11671 lt!388895)))))))

(assert (=> d!83764 (= (isPrefixOf!0 (_2!11671 lt!388892) (_2!11671 lt!388895)) e!173558)))

(declare-fun b!250383 () Bool)

(declare-fun res!209608 () Bool)

(assert (=> b!250383 (=> (not res!209608) (not e!173558))))

(assert (=> b!250383 (= res!209608 (bvsle (bitIndex!0 (size!5990 (buf!6483 (_2!11671 lt!388892))) (currentByte!11914 (_2!11671 lt!388892)) (currentBit!11909 (_2!11671 lt!388892))) (bitIndex!0 (size!5990 (buf!6483 (_2!11671 lt!388895))) (currentByte!11914 (_2!11671 lt!388895)) (currentBit!11909 (_2!11671 lt!388895)))))))

(declare-fun b!250384 () Bool)

(declare-fun e!173557 () Bool)

(assert (=> b!250384 (= e!173558 e!173557)))

(declare-fun res!209609 () Bool)

(assert (=> b!250384 (=> res!209609 e!173557)))

(assert (=> b!250384 (= res!209609 (= (size!5990 (buf!6483 (_2!11671 lt!388892))) #b00000000000000000000000000000000))))

(declare-fun b!250385 () Bool)

(declare-fun arrayBitRangesEq!0 (array!13653 array!13653 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!250385 (= e!173557 (arrayBitRangesEq!0 (buf!6483 (_2!11671 lt!388892)) (buf!6483 (_2!11671 lt!388895)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5990 (buf!6483 (_2!11671 lt!388892))) (currentByte!11914 (_2!11671 lt!388892)) (currentBit!11909 (_2!11671 lt!388892)))))))

(assert (= (and d!83764 res!209610) b!250383))

(assert (= (and b!250383 res!209608) b!250384))

(assert (= (and b!250384 (not res!209609)) b!250385))

(assert (=> b!250383 m!376801))

(assert (=> b!250383 m!376831))

(assert (=> b!250385 m!376801))

(assert (=> b!250385 m!376801))

(declare-fun m!376883 () Bool)

(assert (=> b!250385 m!376883))

(assert (=> b!250329 d!83764))

(declare-fun d!83766 () Bool)

(declare-fun e!173561 () Bool)

(assert (=> d!83766 e!173561))

(declare-fun res!209615 () Bool)

(assert (=> d!83766 (=> (not res!209615) (not e!173561))))

(declare-fun lt!388948 () (_ BitVec 64))

(declare-fun lt!388950 () (_ BitVec 64))

(declare-fun lt!388953 () (_ BitVec 64))

(assert (=> d!83766 (= res!209615 (= lt!388950 (bvsub lt!388953 lt!388948)))))

(assert (=> d!83766 (or (= (bvand lt!388953 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!388948 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!388953 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!388953 lt!388948) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!83766 (= lt!388948 (remainingBits!0 ((_ sign_extend 32) (size!5990 (buf!6483 (_2!11671 lt!388892)))) ((_ sign_extend 32) (currentByte!11914 (_2!11671 lt!388892))) ((_ sign_extend 32) (currentBit!11909 (_2!11671 lt!388892)))))))

(declare-fun lt!388951 () (_ BitVec 64))

(declare-fun lt!388949 () (_ BitVec 64))

(assert (=> d!83766 (= lt!388953 (bvmul lt!388951 lt!388949))))

(assert (=> d!83766 (or (= lt!388951 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!388949 (bvsdiv (bvmul lt!388951 lt!388949) lt!388951)))))

(assert (=> d!83766 (= lt!388949 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!83766 (= lt!388951 ((_ sign_extend 32) (size!5990 (buf!6483 (_2!11671 lt!388892)))))))

(assert (=> d!83766 (= lt!388950 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11914 (_2!11671 lt!388892))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11909 (_2!11671 lt!388892)))))))

(assert (=> d!83766 (invariant!0 (currentBit!11909 (_2!11671 lt!388892)) (currentByte!11914 (_2!11671 lt!388892)) (size!5990 (buf!6483 (_2!11671 lt!388892))))))

(assert (=> d!83766 (= (bitIndex!0 (size!5990 (buf!6483 (_2!11671 lt!388892))) (currentByte!11914 (_2!11671 lt!388892)) (currentBit!11909 (_2!11671 lt!388892))) lt!388950)))

(declare-fun b!250390 () Bool)

(declare-fun res!209616 () Bool)

(assert (=> b!250390 (=> (not res!209616) (not e!173561))))

(assert (=> b!250390 (= res!209616 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!388950))))

(declare-fun b!250391 () Bool)

(declare-fun lt!388952 () (_ BitVec 64))

(assert (=> b!250391 (= e!173561 (bvsle lt!388950 (bvmul lt!388952 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!250391 (or (= lt!388952 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!388952 #b0000000000000000000000000000000000000000000000000000000000001000) lt!388952)))))

(assert (=> b!250391 (= lt!388952 ((_ sign_extend 32) (size!5990 (buf!6483 (_2!11671 lt!388892)))))))

(assert (= (and d!83766 res!209615) b!250390))

(assert (= (and b!250390 res!209616) b!250391))

(declare-fun m!376885 () Bool)

(assert (=> d!83766 m!376885))

(declare-fun m!376887 () Bool)

(assert (=> d!83766 m!376887))

(assert (=> b!250334 d!83766))

(declare-fun d!83768 () Bool)

(declare-fun e!173562 () Bool)

(assert (=> d!83768 e!173562))

(declare-fun res!209617 () Bool)

(assert (=> d!83768 (=> (not res!209617) (not e!173562))))

(declare-fun lt!388956 () (_ BitVec 64))

(declare-fun lt!388954 () (_ BitVec 64))

(declare-fun lt!388959 () (_ BitVec 64))

(assert (=> d!83768 (= res!209617 (= lt!388956 (bvsub lt!388959 lt!388954)))))

(assert (=> d!83768 (or (= (bvand lt!388959 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!388954 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!388959 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!388959 lt!388954) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!83768 (= lt!388954 (remainingBits!0 ((_ sign_extend 32) (size!5990 (buf!6483 thiss!1005))) ((_ sign_extend 32) (currentByte!11914 thiss!1005)) ((_ sign_extend 32) (currentBit!11909 thiss!1005))))))

(declare-fun lt!388957 () (_ BitVec 64))

(declare-fun lt!388955 () (_ BitVec 64))

(assert (=> d!83768 (= lt!388959 (bvmul lt!388957 lt!388955))))

(assert (=> d!83768 (or (= lt!388957 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!388955 (bvsdiv (bvmul lt!388957 lt!388955) lt!388957)))))

(assert (=> d!83768 (= lt!388955 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!83768 (= lt!388957 ((_ sign_extend 32) (size!5990 (buf!6483 thiss!1005))))))

(assert (=> d!83768 (= lt!388956 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11914 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11909 thiss!1005))))))

(assert (=> d!83768 (invariant!0 (currentBit!11909 thiss!1005) (currentByte!11914 thiss!1005) (size!5990 (buf!6483 thiss!1005)))))

(assert (=> d!83768 (= (bitIndex!0 (size!5990 (buf!6483 thiss!1005)) (currentByte!11914 thiss!1005) (currentBit!11909 thiss!1005)) lt!388956)))

(declare-fun b!250392 () Bool)

(declare-fun res!209618 () Bool)

(assert (=> b!250392 (=> (not res!209618) (not e!173562))))

(assert (=> b!250392 (= res!209618 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!388956))))

(declare-fun b!250393 () Bool)

(declare-fun lt!388958 () (_ BitVec 64))

(assert (=> b!250393 (= e!173562 (bvsle lt!388956 (bvmul lt!388958 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!250393 (or (= lt!388958 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!388958 #b0000000000000000000000000000000000000000000000000000000000001000) lt!388958)))))

(assert (=> b!250393 (= lt!388958 ((_ sign_extend 32) (size!5990 (buf!6483 thiss!1005))))))

(assert (= (and d!83768 res!209617) b!250392))

(assert (= (and b!250392 res!209618) b!250393))

(assert (=> d!83768 m!376881))

(declare-fun m!376889 () Bool)

(assert (=> d!83768 m!376889))

(assert (=> b!250334 d!83768))

(declare-fun d!83770 () Bool)

(declare-fun e!173563 () Bool)

(assert (=> d!83770 e!173563))

(declare-fun res!209619 () Bool)

(assert (=> d!83770 (=> (not res!209619) (not e!173563))))

(declare-fun lt!388962 () (_ BitVec 64))

(declare-fun lt!388960 () (_ BitVec 64))

(declare-fun lt!388965 () (_ BitVec 64))

(assert (=> d!83770 (= res!209619 (= lt!388962 (bvsub lt!388965 lt!388960)))))

(assert (=> d!83770 (or (= (bvand lt!388965 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!388960 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!388965 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!388965 lt!388960) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!83770 (= lt!388960 (remainingBits!0 ((_ sign_extend 32) (size!5990 (buf!6483 (_2!11671 lt!388895)))) ((_ sign_extend 32) (currentByte!11914 (_2!11671 lt!388895))) ((_ sign_extend 32) (currentBit!11909 (_2!11671 lt!388895)))))))

(declare-fun lt!388963 () (_ BitVec 64))

(declare-fun lt!388961 () (_ BitVec 64))

(assert (=> d!83770 (= lt!388965 (bvmul lt!388963 lt!388961))))

(assert (=> d!83770 (or (= lt!388963 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!388961 (bvsdiv (bvmul lt!388963 lt!388961) lt!388963)))))

(assert (=> d!83770 (= lt!388961 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!83770 (= lt!388963 ((_ sign_extend 32) (size!5990 (buf!6483 (_2!11671 lt!388895)))))))

(assert (=> d!83770 (= lt!388962 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11914 (_2!11671 lt!388895))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11909 (_2!11671 lt!388895)))))))

(assert (=> d!83770 (invariant!0 (currentBit!11909 (_2!11671 lt!388895)) (currentByte!11914 (_2!11671 lt!388895)) (size!5990 (buf!6483 (_2!11671 lt!388895))))))

(assert (=> d!83770 (= (bitIndex!0 (size!5990 (buf!6483 (_2!11671 lt!388895))) (currentByte!11914 (_2!11671 lt!388895)) (currentBit!11909 (_2!11671 lt!388895))) lt!388962)))

(declare-fun b!250394 () Bool)

(declare-fun res!209620 () Bool)

(assert (=> b!250394 (=> (not res!209620) (not e!173563))))

(assert (=> b!250394 (= res!209620 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!388962))))

(declare-fun b!250395 () Bool)

(declare-fun lt!388964 () (_ BitVec 64))

(assert (=> b!250395 (= e!173563 (bvsle lt!388962 (bvmul lt!388964 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!250395 (or (= lt!388964 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!388964 #b0000000000000000000000000000000000000000000000000000000000001000) lt!388964)))))

(assert (=> b!250395 (= lt!388964 ((_ sign_extend 32) (size!5990 (buf!6483 (_2!11671 lt!388895)))))))

(assert (= (and d!83770 res!209619) b!250394))

(assert (= (and b!250394 res!209620) b!250395))

(declare-fun m!376891 () Bool)

(assert (=> d!83770 m!376891))

(declare-fun m!376893 () Bool)

(assert (=> d!83770 m!376893))

(assert (=> b!250333 d!83770))

(assert (=> b!250333 d!83766))

(declare-fun d!83772 () Bool)

(declare-datatypes ((tuple2!21504 0))(
  ( (tuple2!21505 (_1!11677 Bool) (_2!11677 BitStream!10902)) )
))
(declare-fun lt!388968 () tuple2!21504)

(declare-fun checkBitsLoop!0 (BitStream!10902 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21504)

(assert (=> d!83772 (= lt!388968 (checkBitsLoop!0 (_1!11673 lt!388901) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!83772 (= (checkBitsLoopPure!0 (_1!11673 lt!388901) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (tuple2!21495 (_2!11677 lt!388968) (_1!11677 lt!388968)))))

(declare-fun bs!21234 () Bool)

(assert (= bs!21234 d!83772))

(declare-fun m!376895 () Bool)

(assert (=> bs!21234 m!376895))

(assert (=> b!250332 d!83772))

(declare-fun d!83774 () Bool)

(assert (=> d!83774 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5990 (buf!6483 (_2!11671 lt!388895)))) ((_ sign_extend 32) (currentByte!11914 (_2!11671 lt!388892))) ((_ sign_extend 32) (currentBit!11909 (_2!11671 lt!388892))) lt!388902) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5990 (buf!6483 (_2!11671 lt!388895)))) ((_ sign_extend 32) (currentByte!11914 (_2!11671 lt!388892))) ((_ sign_extend 32) (currentBit!11909 (_2!11671 lt!388892)))) lt!388902))))

(declare-fun bs!21235 () Bool)

(assert (= bs!21235 d!83774))

(declare-fun m!376897 () Bool)

(assert (=> bs!21235 m!376897))

(assert (=> b!250332 d!83774))

(declare-fun d!83776 () Bool)

(assert (=> d!83776 (validate_offset_bits!1 ((_ sign_extend 32) (size!5990 (buf!6483 (_2!11671 lt!388895)))) ((_ sign_extend 32) (currentByte!11914 (_2!11671 lt!388892))) ((_ sign_extend 32) (currentBit!11909 (_2!11671 lt!388892))) lt!388902)))

(declare-fun lt!388971 () Unit!18116)

(declare-fun choose!9 (BitStream!10902 array!13653 (_ BitVec 64) BitStream!10902) Unit!18116)

(assert (=> d!83776 (= lt!388971 (choose!9 (_2!11671 lt!388892) (buf!6483 (_2!11671 lt!388895)) lt!388902 (BitStream!10903 (buf!6483 (_2!11671 lt!388895)) (currentByte!11914 (_2!11671 lt!388892)) (currentBit!11909 (_2!11671 lt!388892)))))))

(assert (=> d!83776 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11671 lt!388892) (buf!6483 (_2!11671 lt!388895)) lt!388902) lt!388971)))

(declare-fun bs!21236 () Bool)

(assert (= bs!21236 d!83776))

(assert (=> bs!21236 m!376793))

(declare-fun m!376899 () Bool)

(assert (=> bs!21236 m!376899))

(assert (=> b!250332 d!83776))

(declare-fun d!83778 () Bool)

(declare-fun e!173569 () Bool)

(assert (=> d!83778 e!173569))

(declare-fun res!209627 () Bool)

(assert (=> d!83778 (=> (not res!209627) (not e!173569))))

(declare-fun lt!389022 () tuple2!21496)

(assert (=> d!83778 (= res!209627 (isPrefixOf!0 (_1!11673 lt!389022) (_2!11673 lt!389022)))))

(declare-fun lt!389029 () BitStream!10902)

(assert (=> d!83778 (= lt!389022 (tuple2!21497 lt!389029 (_2!11671 lt!388895)))))

(declare-fun lt!389028 () Unit!18116)

(declare-fun lt!389030 () Unit!18116)

(assert (=> d!83778 (= lt!389028 lt!389030)))

(assert (=> d!83778 (isPrefixOf!0 lt!389029 (_2!11671 lt!388895))))

(assert (=> d!83778 (= lt!389030 (lemmaIsPrefixTransitive!0 lt!389029 (_2!11671 lt!388895) (_2!11671 lt!388895)))))

(declare-fun lt!389024 () Unit!18116)

(declare-fun lt!389020 () Unit!18116)

(assert (=> d!83778 (= lt!389024 lt!389020)))

(assert (=> d!83778 (isPrefixOf!0 lt!389029 (_2!11671 lt!388895))))

(assert (=> d!83778 (= lt!389020 (lemmaIsPrefixTransitive!0 lt!389029 (_2!11671 lt!388892) (_2!11671 lt!388895)))))

(declare-fun lt!389023 () Unit!18116)

(declare-fun e!173568 () Unit!18116)

(assert (=> d!83778 (= lt!389023 e!173568)))

(declare-fun c!11590 () Bool)

(assert (=> d!83778 (= c!11590 (not (= (size!5990 (buf!6483 (_2!11671 lt!388892))) #b00000000000000000000000000000000)))))

(declare-fun lt!389026 () Unit!18116)

(declare-fun lt!389013 () Unit!18116)

(assert (=> d!83778 (= lt!389026 lt!389013)))

(assert (=> d!83778 (isPrefixOf!0 (_2!11671 lt!388895) (_2!11671 lt!388895))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!10902) Unit!18116)

(assert (=> d!83778 (= lt!389013 (lemmaIsPrefixRefl!0 (_2!11671 lt!388895)))))

(declare-fun lt!389012 () Unit!18116)

(declare-fun lt!389018 () Unit!18116)

(assert (=> d!83778 (= lt!389012 lt!389018)))

(assert (=> d!83778 (= lt!389018 (lemmaIsPrefixRefl!0 (_2!11671 lt!388895)))))

(declare-fun lt!389031 () Unit!18116)

(declare-fun lt!389014 () Unit!18116)

(assert (=> d!83778 (= lt!389031 lt!389014)))

(assert (=> d!83778 (isPrefixOf!0 lt!389029 lt!389029)))

(assert (=> d!83778 (= lt!389014 (lemmaIsPrefixRefl!0 lt!389029))))

(declare-fun lt!389019 () Unit!18116)

(declare-fun lt!389015 () Unit!18116)

(assert (=> d!83778 (= lt!389019 lt!389015)))

(assert (=> d!83778 (isPrefixOf!0 (_2!11671 lt!388892) (_2!11671 lt!388892))))

(assert (=> d!83778 (= lt!389015 (lemmaIsPrefixRefl!0 (_2!11671 lt!388892)))))

(assert (=> d!83778 (= lt!389029 (BitStream!10903 (buf!6483 (_2!11671 lt!388895)) (currentByte!11914 (_2!11671 lt!388892)) (currentBit!11909 (_2!11671 lt!388892))))))

(assert (=> d!83778 (isPrefixOf!0 (_2!11671 lt!388892) (_2!11671 lt!388895))))

(assert (=> d!83778 (= (reader!0 (_2!11671 lt!388892) (_2!11671 lt!388895)) lt!389022)))

(declare-fun b!250406 () Bool)

(declare-fun res!209628 () Bool)

(assert (=> b!250406 (=> (not res!209628) (not e!173569))))

(assert (=> b!250406 (= res!209628 (isPrefixOf!0 (_1!11673 lt!389022) (_2!11671 lt!388892)))))

(declare-fun b!250407 () Bool)

(declare-fun res!209629 () Bool)

(assert (=> b!250407 (=> (not res!209629) (not e!173569))))

(assert (=> b!250407 (= res!209629 (isPrefixOf!0 (_2!11673 lt!389022) (_2!11671 lt!388895)))))

(declare-fun b!250408 () Bool)

(declare-fun lt!389016 () Unit!18116)

(assert (=> b!250408 (= e!173568 lt!389016)))

(declare-fun lt!389021 () (_ BitVec 64))

(assert (=> b!250408 (= lt!389021 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!389027 () (_ BitVec 64))

(assert (=> b!250408 (= lt!389027 (bitIndex!0 (size!5990 (buf!6483 (_2!11671 lt!388892))) (currentByte!11914 (_2!11671 lt!388892)) (currentBit!11909 (_2!11671 lt!388892))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!13653 array!13653 (_ BitVec 64) (_ BitVec 64)) Unit!18116)

(assert (=> b!250408 (= lt!389016 (arrayBitRangesEqSymmetric!0 (buf!6483 (_2!11671 lt!388892)) (buf!6483 (_2!11671 lt!388895)) lt!389021 lt!389027))))

(assert (=> b!250408 (arrayBitRangesEq!0 (buf!6483 (_2!11671 lt!388895)) (buf!6483 (_2!11671 lt!388892)) lt!389021 lt!389027)))

(declare-fun b!250409 () Bool)

(declare-fun Unit!18120 () Unit!18116)

(assert (=> b!250409 (= e!173568 Unit!18120)))

(declare-fun b!250410 () Bool)

(declare-fun lt!389017 () (_ BitVec 64))

(declare-fun lt!389025 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!10902 (_ BitVec 64)) BitStream!10902)

(assert (=> b!250410 (= e!173569 (= (_1!11673 lt!389022) (withMovedBitIndex!0 (_2!11673 lt!389022) (bvsub lt!389025 lt!389017))))))

(assert (=> b!250410 (or (= (bvand lt!389025 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!389017 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!389025 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!389025 lt!389017) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!250410 (= lt!389017 (bitIndex!0 (size!5990 (buf!6483 (_2!11671 lt!388895))) (currentByte!11914 (_2!11671 lt!388895)) (currentBit!11909 (_2!11671 lt!388895))))))

(assert (=> b!250410 (= lt!389025 (bitIndex!0 (size!5990 (buf!6483 (_2!11671 lt!388892))) (currentByte!11914 (_2!11671 lt!388892)) (currentBit!11909 (_2!11671 lt!388892))))))

(assert (= (and d!83778 c!11590) b!250408))

(assert (= (and d!83778 (not c!11590)) b!250409))

(assert (= (and d!83778 res!209627) b!250406))

(assert (= (and b!250406 res!209628) b!250407))

(assert (= (and b!250407 res!209629) b!250410))

(declare-fun m!376901 () Bool)

(assert (=> d!83778 m!376901))

(declare-fun m!376903 () Bool)

(assert (=> d!83778 m!376903))

(declare-fun m!376905 () Bool)

(assert (=> d!83778 m!376905))

(declare-fun m!376907 () Bool)

(assert (=> d!83778 m!376907))

(declare-fun m!376909 () Bool)

(assert (=> d!83778 m!376909))

(declare-fun m!376911 () Bool)

(assert (=> d!83778 m!376911))

(declare-fun m!376913 () Bool)

(assert (=> d!83778 m!376913))

(assert (=> d!83778 m!376789))

(declare-fun m!376915 () Bool)

(assert (=> d!83778 m!376915))

(declare-fun m!376917 () Bool)

(assert (=> d!83778 m!376917))

(declare-fun m!376919 () Bool)

(assert (=> d!83778 m!376919))

(declare-fun m!376921 () Bool)

(assert (=> b!250407 m!376921))

(declare-fun m!376923 () Bool)

(assert (=> b!250406 m!376923))

(declare-fun m!376925 () Bool)

(assert (=> b!250410 m!376925))

(assert (=> b!250410 m!376831))

(assert (=> b!250410 m!376801))

(assert (=> b!250408 m!376801))

(declare-fun m!376927 () Bool)

(assert (=> b!250408 m!376927))

(declare-fun m!376929 () Bool)

(assert (=> b!250408 m!376929))

(assert (=> b!250332 d!83778))

(declare-fun d!83780 () Bool)

(assert (=> d!83780 (= (invariant!0 (currentBit!11909 thiss!1005) (currentByte!11914 thiss!1005) (size!5990 (buf!6483 (_2!11671 lt!388892)))) (and (bvsge (currentBit!11909 thiss!1005) #b00000000000000000000000000000000) (bvslt (currentBit!11909 thiss!1005) #b00000000000000000000000000001000) (bvsge (currentByte!11914 thiss!1005) #b00000000000000000000000000000000) (or (bvslt (currentByte!11914 thiss!1005) (size!5990 (buf!6483 (_2!11671 lt!388892)))) (and (= (currentBit!11909 thiss!1005) #b00000000000000000000000000000000) (= (currentByte!11914 thiss!1005) (size!5990 (buf!6483 (_2!11671 lt!388892))))))))))

(assert (=> b!250336 d!83780))

(declare-fun d!83782 () Bool)

(declare-fun lt!389034 () tuple2!21504)

(declare-fun readBit!0 (BitStream!10902) tuple2!21504)

(assert (=> d!83782 (= lt!389034 (readBit!0 (readerFrom!0 (_2!11671 lt!388892) (currentBit!11909 thiss!1005) (currentByte!11914 thiss!1005))))))

(assert (=> d!83782 (= (readBitPure!0 (readerFrom!0 (_2!11671 lt!388892) (currentBit!11909 thiss!1005) (currentByte!11914 thiss!1005))) (tuple2!21495 (_2!11677 lt!389034) (_1!11677 lt!389034)))))

(declare-fun bs!21237 () Bool)

(assert (= bs!21237 d!83782))

(assert (=> bs!21237 m!376827))

(declare-fun m!376931 () Bool)

(assert (=> bs!21237 m!376931))

(assert (=> b!250335 d!83782))

(declare-fun d!83784 () Bool)

(declare-fun e!173572 () Bool)

(assert (=> d!83784 e!173572))

(declare-fun res!209633 () Bool)

(assert (=> d!83784 (=> (not res!209633) (not e!173572))))

(assert (=> d!83784 (= res!209633 (invariant!0 (currentBit!11909 (_2!11671 lt!388892)) (currentByte!11914 (_2!11671 lt!388892)) (size!5990 (buf!6483 (_2!11671 lt!388892)))))))

(assert (=> d!83784 (= (readerFrom!0 (_2!11671 lt!388892) (currentBit!11909 thiss!1005) (currentByte!11914 thiss!1005)) (BitStream!10903 (buf!6483 (_2!11671 lt!388892)) (currentByte!11914 thiss!1005) (currentBit!11909 thiss!1005)))))

(declare-fun b!250413 () Bool)

(assert (=> b!250413 (= e!173572 (invariant!0 (currentBit!11909 thiss!1005) (currentByte!11914 thiss!1005) (size!5990 (buf!6483 (_2!11671 lt!388892)))))))

(assert (= (and d!83784 res!209633) b!250413))

(assert (=> d!83784 m!376887))

(assert (=> b!250413 m!376799))

(assert (=> b!250335 d!83784))

(declare-fun b!250425 () Bool)

(declare-fun e!173577 () Bool)

(declare-fun e!173578 () Bool)

(assert (=> b!250425 (= e!173577 e!173578)))

(declare-fun res!209645 () Bool)

(assert (=> b!250425 (=> (not res!209645) (not e!173578))))

(declare-fun lt!389046 () tuple2!21494)

(declare-fun lt!389045 () tuple2!21492)

(assert (=> b!250425 (= res!209645 (and (= (_2!11672 lt!389046) bit!26) (= (_1!11672 lt!389046) (_2!11671 lt!389045))))))

(assert (=> b!250425 (= lt!389046 (readBitPure!0 (readerFrom!0 (_2!11671 lt!389045) (currentBit!11909 thiss!1005) (currentByte!11914 thiss!1005))))))

(declare-fun d!83786 () Bool)

(assert (=> d!83786 e!173577))

(declare-fun res!209642 () Bool)

(assert (=> d!83786 (=> (not res!209642) (not e!173577))))

(assert (=> d!83786 (= res!209642 (= (size!5990 (buf!6483 thiss!1005)) (size!5990 (buf!6483 (_2!11671 lt!389045)))))))

(declare-fun choose!16 (BitStream!10902 Bool) tuple2!21492)

(assert (=> d!83786 (= lt!389045 (choose!16 thiss!1005 bit!26))))

(assert (=> d!83786 (validate_offset_bit!0 ((_ sign_extend 32) (size!5990 (buf!6483 thiss!1005))) ((_ sign_extend 32) (currentByte!11914 thiss!1005)) ((_ sign_extend 32) (currentBit!11909 thiss!1005)))))

(assert (=> d!83786 (= (appendBit!0 thiss!1005 bit!26) lt!389045)))

(declare-fun b!250424 () Bool)

(declare-fun res!209644 () Bool)

(assert (=> b!250424 (=> (not res!209644) (not e!173577))))

(assert (=> b!250424 (= res!209644 (isPrefixOf!0 thiss!1005 (_2!11671 lt!389045)))))

(declare-fun b!250426 () Bool)

(assert (=> b!250426 (= e!173578 (= (bitIndex!0 (size!5990 (buf!6483 (_1!11672 lt!389046))) (currentByte!11914 (_1!11672 lt!389046)) (currentBit!11909 (_1!11672 lt!389046))) (bitIndex!0 (size!5990 (buf!6483 (_2!11671 lt!389045))) (currentByte!11914 (_2!11671 lt!389045)) (currentBit!11909 (_2!11671 lt!389045)))))))

(declare-fun b!250423 () Bool)

(declare-fun res!209643 () Bool)

(assert (=> b!250423 (=> (not res!209643) (not e!173577))))

(declare-fun lt!389043 () (_ BitVec 64))

(declare-fun lt!389044 () (_ BitVec 64))

(assert (=> b!250423 (= res!209643 (= (bitIndex!0 (size!5990 (buf!6483 (_2!11671 lt!389045))) (currentByte!11914 (_2!11671 lt!389045)) (currentBit!11909 (_2!11671 lt!389045))) (bvadd lt!389044 lt!389043)))))

(assert (=> b!250423 (or (not (= (bvand lt!389044 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!389043 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!389044 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!389044 lt!389043) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!250423 (= lt!389043 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!250423 (= lt!389044 (bitIndex!0 (size!5990 (buf!6483 thiss!1005)) (currentByte!11914 thiss!1005) (currentBit!11909 thiss!1005)))))

(assert (= (and d!83786 res!209642) b!250423))

(assert (= (and b!250423 res!209643) b!250424))

(assert (= (and b!250424 res!209644) b!250425))

(assert (= (and b!250425 res!209645) b!250426))

(declare-fun m!376933 () Bool)

(assert (=> b!250426 m!376933))

(declare-fun m!376935 () Bool)

(assert (=> b!250426 m!376935))

(declare-fun m!376937 () Bool)

(assert (=> d!83786 m!376937))

(declare-fun m!376939 () Bool)

(assert (=> d!83786 m!376939))

(declare-fun m!376941 () Bool)

(assert (=> b!250424 m!376941))

(assert (=> b!250423 m!376935))

(assert (=> b!250423 m!376803))

(declare-fun m!376943 () Bool)

(assert (=> b!250425 m!376943))

(assert (=> b!250425 m!376943))

(declare-fun m!376945 () Bool)

(assert (=> b!250425 m!376945))

(assert (=> b!250339 d!83786))

(declare-fun d!83790 () Bool)

(assert (=> d!83790 (isPrefixOf!0 thiss!1005 (_2!11671 lt!388895))))

(declare-fun lt!389049 () Unit!18116)

(declare-fun choose!30 (BitStream!10902 BitStream!10902 BitStream!10902) Unit!18116)

(assert (=> d!83790 (= lt!389049 (choose!30 thiss!1005 (_2!11671 lt!388892) (_2!11671 lt!388895)))))

(assert (=> d!83790 (isPrefixOf!0 thiss!1005 (_2!11671 lt!388892))))

(assert (=> d!83790 (= (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11671 lt!388892) (_2!11671 lt!388895)) lt!389049)))

(declare-fun bs!21238 () Bool)

(assert (= bs!21238 d!83790))

(assert (=> bs!21238 m!376815))

(declare-fun m!376947 () Bool)

(assert (=> bs!21238 m!376947))

(assert (=> bs!21238 m!376805))

(assert (=> b!250339 d!83790))

(declare-fun d!83792 () Bool)

(declare-fun res!209648 () Bool)

(declare-fun e!173580 () Bool)

(assert (=> d!83792 (=> (not res!209648) (not e!173580))))

(assert (=> d!83792 (= res!209648 (= (size!5990 (buf!6483 thiss!1005)) (size!5990 (buf!6483 (_2!11671 lt!388895)))))))

(assert (=> d!83792 (= (isPrefixOf!0 thiss!1005 (_2!11671 lt!388895)) e!173580)))

(declare-fun b!250427 () Bool)

(declare-fun res!209646 () Bool)

(assert (=> b!250427 (=> (not res!209646) (not e!173580))))

(assert (=> b!250427 (= res!209646 (bvsle (bitIndex!0 (size!5990 (buf!6483 thiss!1005)) (currentByte!11914 thiss!1005) (currentBit!11909 thiss!1005)) (bitIndex!0 (size!5990 (buf!6483 (_2!11671 lt!388895))) (currentByte!11914 (_2!11671 lt!388895)) (currentBit!11909 (_2!11671 lt!388895)))))))

(declare-fun b!250428 () Bool)

(declare-fun e!173579 () Bool)

(assert (=> b!250428 (= e!173580 e!173579)))

(declare-fun res!209647 () Bool)

(assert (=> b!250428 (=> res!209647 e!173579)))

(assert (=> b!250428 (= res!209647 (= (size!5990 (buf!6483 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!250429 () Bool)

(assert (=> b!250429 (= e!173579 (arrayBitRangesEq!0 (buf!6483 thiss!1005) (buf!6483 (_2!11671 lt!388895)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5990 (buf!6483 thiss!1005)) (currentByte!11914 thiss!1005) (currentBit!11909 thiss!1005))))))

(assert (= (and d!83792 res!209648) b!250427))

(assert (= (and b!250427 res!209646) b!250428))

(assert (= (and b!250428 (not res!209647)) b!250429))

(assert (=> b!250427 m!376803))

(assert (=> b!250427 m!376831))

(assert (=> b!250429 m!376803))

(assert (=> b!250429 m!376803))

(declare-fun m!376949 () Bool)

(assert (=> b!250429 m!376949))

(assert (=> b!250339 d!83792))

(declare-fun d!83794 () Bool)

(assert (=> d!83794 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5990 (buf!6483 (_2!11671 lt!388892)))) ((_ sign_extend 32) (currentByte!11914 (_2!11671 lt!388892))) ((_ sign_extend 32) (currentBit!11909 (_2!11671 lt!388892))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5990 (buf!6483 (_2!11671 lt!388892)))) ((_ sign_extend 32) (currentByte!11914 (_2!11671 lt!388892))) ((_ sign_extend 32) (currentBit!11909 (_2!11671 lt!388892)))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!21239 () Bool)

(assert (= bs!21239 d!83794))

(assert (=> bs!21239 m!376885))

(assert (=> b!250339 d!83794))

(declare-fun d!83796 () Bool)

(declare-fun e!173583 () Bool)

(assert (=> d!83796 e!173583))

(declare-fun res!209651 () Bool)

(assert (=> d!83796 (=> (not res!209651) (not e!173583))))

(assert (=> d!83796 (= res!209651 (or (= (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!389052 () Unit!18116)

(declare-fun choose!27 (BitStream!10902 BitStream!10902 (_ BitVec 64) (_ BitVec 64)) Unit!18116)

(assert (=> d!83796 (= lt!389052 (choose!27 thiss!1005 (_2!11671 lt!388892) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!83796 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!297 from!289)))))

(assert (=> d!83796 (= (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11671 lt!388892) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001) lt!389052)))

(declare-fun b!250432 () Bool)

(assert (=> b!250432 (= e!173583 (validate_offset_bits!1 ((_ sign_extend 32) (size!5990 (buf!6483 (_2!11671 lt!388892)))) ((_ sign_extend 32) (currentByte!11914 (_2!11671 lt!388892))) ((_ sign_extend 32) (currentBit!11909 (_2!11671 lt!388892))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!83796 res!209651) b!250432))

(declare-fun m!376951 () Bool)

(assert (=> d!83796 m!376951))

(assert (=> b!250432 m!376807))

(assert (=> b!250339 d!83796))

(declare-fun b!250505 () Bool)

(declare-fun res!209724 () Bool)

(declare-fun e!173627 () Bool)

(assert (=> b!250505 (=> (not res!209724) (not e!173627))))

(declare-fun lt!389150 () tuple2!21492)

(assert (=> b!250505 (= res!209724 (isPrefixOf!0 (_2!11671 lt!388892) (_2!11671 lt!389150)))))

(declare-fun b!250506 () Bool)

(declare-fun lt!389155 () tuple2!21494)

(declare-fun lt!389152 () tuple2!21496)

(assert (=> b!250506 (= e!173627 (and (_2!11672 lt!389155) (= (_1!11672 lt!389155) (_2!11673 lt!389152))))))

(assert (=> b!250506 (= lt!389155 (checkBitsLoopPure!0 (_1!11673 lt!389152) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!389153 () Unit!18116)

(declare-fun lt!389156 () Unit!18116)

(assert (=> b!250506 (= lt!389153 lt!389156)))

(declare-fun lt!389154 () (_ BitVec 64))

(assert (=> b!250506 (validate_offset_bits!1 ((_ sign_extend 32) (size!5990 (buf!6483 (_2!11671 lt!389150)))) ((_ sign_extend 32) (currentByte!11914 (_2!11671 lt!388892))) ((_ sign_extend 32) (currentBit!11909 (_2!11671 lt!388892))) lt!389154)))

(assert (=> b!250506 (= lt!389156 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11671 lt!388892) (buf!6483 (_2!11671 lt!389150)) lt!389154))))

(declare-fun e!173626 () Bool)

(assert (=> b!250506 e!173626))

(declare-fun res!209723 () Bool)

(assert (=> b!250506 (=> (not res!209723) (not e!173626))))

(assert (=> b!250506 (= res!209723 (and (= (size!5990 (buf!6483 (_2!11671 lt!388892))) (size!5990 (buf!6483 (_2!11671 lt!389150)))) (bvsge lt!389154 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!250506 (= lt!389154 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!250506 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!250506 (= lt!389152 (reader!0 (_2!11671 lt!388892) (_2!11671 lt!389150)))))

(declare-fun b!250504 () Bool)

(declare-fun res!209726 () Bool)

(assert (=> b!250504 (=> (not res!209726) (not e!173627))))

(declare-fun lt!389151 () (_ BitVec 64))

(declare-fun lt!389157 () (_ BitVec 64))

(assert (=> b!250504 (= res!209726 (= (bitIndex!0 (size!5990 (buf!6483 (_2!11671 lt!389150))) (currentByte!11914 (_2!11671 lt!389150)) (currentBit!11909 (_2!11671 lt!389150))) (bvadd lt!389157 lt!389151)))))

(assert (=> b!250504 (or (not (= (bvand lt!389157 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!389151 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!389157 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!389157 lt!389151) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!250504 (= lt!389151 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!250504 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!250504 (= lt!389157 (bitIndex!0 (size!5990 (buf!6483 (_2!11671 lt!388892))) (currentByte!11914 (_2!11671 lt!388892)) (currentBit!11909 (_2!11671 lt!388892))))))

(declare-fun b!250507 () Bool)

(assert (=> b!250507 (= e!173626 (validate_offset_bits!1 ((_ sign_extend 32) (size!5990 (buf!6483 (_2!11671 lt!388892)))) ((_ sign_extend 32) (currentByte!11914 (_2!11671 lt!388892))) ((_ sign_extend 32) (currentBit!11909 (_2!11671 lt!388892))) lt!389154))))

(declare-fun d!83798 () Bool)

(assert (=> d!83798 e!173627))

(declare-fun res!209725 () Bool)

(assert (=> d!83798 (=> (not res!209725) (not e!173627))))

(assert (=> d!83798 (= res!209725 (= (size!5990 (buf!6483 (_2!11671 lt!388892))) (size!5990 (buf!6483 (_2!11671 lt!389150)))))))

(declare-fun choose!51 (BitStream!10902 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21492)

(assert (=> d!83798 (= lt!389150 (choose!51 (_2!11671 lt!388892) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!83798 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!83798 (= (appendNBitsLoop!0 (_2!11671 lt!388892) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) lt!389150)))

(assert (= (and d!83798 res!209725) b!250504))

(assert (= (and b!250504 res!209726) b!250505))

(assert (= (and b!250505 res!209724) b!250506))

(assert (= (and b!250506 res!209723) b!250507))

(declare-fun m!377007 () Bool)

(assert (=> b!250507 m!377007))

(declare-fun m!377009 () Bool)

(assert (=> b!250505 m!377009))

(declare-fun m!377011 () Bool)

(assert (=> d!83798 m!377011))

(declare-fun m!377013 () Bool)

(assert (=> b!250506 m!377013))

(declare-fun m!377015 () Bool)

(assert (=> b!250506 m!377015))

(declare-fun m!377017 () Bool)

(assert (=> b!250506 m!377017))

(declare-fun m!377019 () Bool)

(assert (=> b!250506 m!377019))

(declare-fun m!377021 () Bool)

(assert (=> b!250504 m!377021))

(assert (=> b!250504 m!376801))

(assert (=> b!250339 d!83798))

(declare-fun d!83842 () Bool)

(assert (=> d!83842 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!5990 (buf!6483 (_2!11671 lt!388892)))) ((_ sign_extend 32) (currentByte!11914 thiss!1005)) ((_ sign_extend 32) (currentBit!11909 thiss!1005))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5990 (buf!6483 (_2!11671 lt!388892)))) ((_ sign_extend 32) (currentByte!11914 thiss!1005)) ((_ sign_extend 32) (currentBit!11909 thiss!1005))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!21246 () Bool)

(assert (= bs!21246 d!83842))

(declare-fun m!377023 () Bool)

(assert (=> bs!21246 m!377023))

(assert (=> b!250339 d!83842))

(declare-fun d!83844 () Bool)

(assert (=> d!83844 (= (inv!12 thiss!1005) (invariant!0 (currentBit!11909 thiss!1005) (currentByte!11914 thiss!1005) (size!5990 (buf!6483 thiss!1005))))))

(declare-fun bs!21247 () Bool)

(assert (= bs!21247 d!83844))

(assert (=> bs!21247 m!376889))

(assert (=> start!53744 d!83844))

(declare-fun d!83846 () Bool)

(declare-fun res!209729 () Bool)

(declare-fun e!173629 () Bool)

(assert (=> d!83846 (=> (not res!209729) (not e!173629))))

(assert (=> d!83846 (= res!209729 (= (size!5990 (buf!6483 thiss!1005)) (size!5990 (buf!6483 (_2!11671 lt!388892)))))))

(assert (=> d!83846 (= (isPrefixOf!0 thiss!1005 (_2!11671 lt!388892)) e!173629)))

(declare-fun b!250508 () Bool)

(declare-fun res!209727 () Bool)

(assert (=> b!250508 (=> (not res!209727) (not e!173629))))

(assert (=> b!250508 (= res!209727 (bvsle (bitIndex!0 (size!5990 (buf!6483 thiss!1005)) (currentByte!11914 thiss!1005) (currentBit!11909 thiss!1005)) (bitIndex!0 (size!5990 (buf!6483 (_2!11671 lt!388892))) (currentByte!11914 (_2!11671 lt!388892)) (currentBit!11909 (_2!11671 lt!388892)))))))

(declare-fun b!250509 () Bool)

(declare-fun e!173628 () Bool)

(assert (=> b!250509 (= e!173629 e!173628)))

(declare-fun res!209728 () Bool)

(assert (=> b!250509 (=> res!209728 e!173628)))

(assert (=> b!250509 (= res!209728 (= (size!5990 (buf!6483 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!250510 () Bool)

(assert (=> b!250510 (= e!173628 (arrayBitRangesEq!0 (buf!6483 thiss!1005) (buf!6483 (_2!11671 lt!388892)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5990 (buf!6483 thiss!1005)) (currentByte!11914 thiss!1005) (currentBit!11909 thiss!1005))))))

(assert (= (and d!83846 res!209729) b!250508))

(assert (= (and b!250508 res!209727) b!250509))

(assert (= (and b!250509 (not res!209728)) b!250510))

(assert (=> b!250508 m!376803))

(assert (=> b!250508 m!376801))

(assert (=> b!250510 m!376803))

(assert (=> b!250510 m!376803))

(declare-fun m!377025 () Bool)

(assert (=> b!250510 m!377025))

(assert (=> b!250338 d!83846))

(declare-fun d!83848 () Bool)

(declare-fun e!173630 () Bool)

(assert (=> d!83848 e!173630))

(declare-fun res!209730 () Bool)

(assert (=> d!83848 (=> (not res!209730) (not e!173630))))

(declare-fun lt!389163 () (_ BitVec 64))

(declare-fun lt!389158 () (_ BitVec 64))

(declare-fun lt!389160 () (_ BitVec 64))

(assert (=> d!83848 (= res!209730 (= lt!389160 (bvsub lt!389163 lt!389158)))))

(assert (=> d!83848 (or (= (bvand lt!389163 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!389158 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!389163 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!389163 lt!389158) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!83848 (= lt!389158 (remainingBits!0 ((_ sign_extend 32) (size!5990 (buf!6483 (_1!11672 lt!388893)))) ((_ sign_extend 32) (currentByte!11914 (_1!11672 lt!388893))) ((_ sign_extend 32) (currentBit!11909 (_1!11672 lt!388893)))))))

(declare-fun lt!389161 () (_ BitVec 64))

(declare-fun lt!389159 () (_ BitVec 64))

(assert (=> d!83848 (= lt!389163 (bvmul lt!389161 lt!389159))))

(assert (=> d!83848 (or (= lt!389161 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!389159 (bvsdiv (bvmul lt!389161 lt!389159) lt!389161)))))

(assert (=> d!83848 (= lt!389159 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!83848 (= lt!389161 ((_ sign_extend 32) (size!5990 (buf!6483 (_1!11672 lt!388893)))))))

(assert (=> d!83848 (= lt!389160 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11914 (_1!11672 lt!388893))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11909 (_1!11672 lt!388893)))))))

(assert (=> d!83848 (invariant!0 (currentBit!11909 (_1!11672 lt!388893)) (currentByte!11914 (_1!11672 lt!388893)) (size!5990 (buf!6483 (_1!11672 lt!388893))))))

(assert (=> d!83848 (= (bitIndex!0 (size!5990 (buf!6483 (_1!11672 lt!388893))) (currentByte!11914 (_1!11672 lt!388893)) (currentBit!11909 (_1!11672 lt!388893))) lt!389160)))

(declare-fun b!250511 () Bool)

(declare-fun res!209731 () Bool)

(assert (=> b!250511 (=> (not res!209731) (not e!173630))))

(assert (=> b!250511 (= res!209731 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!389160))))

(declare-fun b!250512 () Bool)

(declare-fun lt!389162 () (_ BitVec 64))

(assert (=> b!250512 (= e!173630 (bvsle lt!389160 (bvmul lt!389162 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!250512 (or (= lt!389162 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!389162 #b0000000000000000000000000000000000000000000000000000000000001000) lt!389162)))))

(assert (=> b!250512 (= lt!389162 ((_ sign_extend 32) (size!5990 (buf!6483 (_1!11672 lt!388893)))))))

(assert (= (and d!83848 res!209730) b!250511))

(assert (= (and b!250511 res!209731) b!250512))

(declare-fun m!377027 () Bool)

(assert (=> d!83848 m!377027))

(declare-fun m!377029 () Bool)

(assert (=> d!83848 m!377029))

(assert (=> b!250337 d!83848))

(check-sat (not b!250410) (not d!83786) (not d!83774) (not d!83848) (not d!83798) (not b!250406) (not b!250427) (not b!250407) (not b!250424) (not d!83776) (not d!83770) (not d!83762) (not b!250383) (not d!83766) (not d!83778) (not d!83794) (not b!250423) (not b!250408) (not b!250432) (not b!250506) (not b!250385) (not b!250425) (not d!83782) (not d!83796) (not b!250504) (not b!250510) (not b!250429) (not d!83772) (not b!250505) (not d!83844) (not d!83790) (not b!250426) (not b!250413) (not d!83842) (not d!83768) (not b!250507) (not d!83784) (not b!250508))
(check-sat)
