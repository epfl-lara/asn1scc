; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50674 () Bool)

(assert start!50674)

(declare-fun b!236926 () Bool)

(declare-fun lt!372488 () (_ BitVec 64))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun e!163792 () Bool)

(declare-datatypes ((array!12570 0))(
  ( (array!12571 (arr!6503 (Array (_ BitVec 32) (_ BitVec 8))) (size!5516 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9996 0))(
  ( (BitStream!9997 (buf!5991 array!12570) (currentByte!11162 (_ BitVec 32)) (currentBit!11157 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!20012 0))(
  ( (tuple2!20013 (_1!10910 (_ BitVec 64)) (_2!10910 BitStream!9996)) )
))
(declare-fun lt!372487 () tuple2!20012)

(declare-fun nBits!581 () (_ BitVec 32))

(assert (=> b!236926 (= e!163792 (and (= (bvlshr (_1!10910 lt!372487) lt!372488) (bvlshr acc!170 lt!372488)) (bvsgt #b00000000000000000000000000000000 nBits!581)))))

(declare-fun b!236927 () Bool)

(declare-fun res!198038 () Bool)

(declare-fun e!163793 () Bool)

(assert (=> b!236927 (=> (not res!198038) (not e!163793))))

(declare-fun i!752 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!236927 (= res!198038 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!236928 () Bool)

(declare-fun e!163794 () Bool)

(declare-fun thiss!1830 () BitStream!9996)

(declare-fun array_inv!5257 (array!12570) Bool)

(assert (=> b!236928 (= e!163794 (array_inv!5257 (buf!5991 thiss!1830)))))

(declare-fun b!236929 () Bool)

(assert (=> b!236929 (= e!163793 e!163792)))

(declare-fun res!198036 () Bool)

(assert (=> b!236929 (=> (not res!198036) (not e!163792))))

(assert (=> b!236929 (= res!198036 (= (buf!5991 (_2!10910 lt!372487)) (buf!5991 thiss!1830)))))

(declare-datatypes ((tuple2!20014 0))(
  ( (tuple2!20015 (_1!10911 Bool) (_2!10911 BitStream!9996)) )
))
(declare-fun lt!372489 () tuple2!20014)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!9996 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!20012)

(assert (=> b!236929 (= lt!372487 (readNLeastSignificantBitsLoop!0 (_2!10911 lt!372489) nBits!581 (bvadd #b00000000000000000000000000000001 i!752) (bvor acc!170 (ite (_1!10911 lt!372489) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun readBit!0 (BitStream!9996) tuple2!20014)

(assert (=> b!236929 (= lt!372489 (readBit!0 thiss!1830))))

(declare-fun b!236930 () Bool)

(declare-fun res!198034 () Bool)

(assert (=> b!236930 (=> (not res!198034) (not e!163792))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!236930 (= res!198034 (= (bitIndex!0 (size!5516 (buf!5991 (_2!10910 lt!372487))) (currentByte!11162 (_2!10910 lt!372487)) (currentBit!11157 (_2!10910 lt!372487))) (bvadd (bitIndex!0 (size!5516 (buf!5991 thiss!1830)) (currentByte!11162 thiss!1830) (currentBit!11157 thiss!1830)) lt!372488)))))

(declare-fun b!236931 () Bool)

(declare-fun res!198033 () Bool)

(assert (=> b!236931 (=> (not res!198033) (not e!163793))))

(assert (=> b!236931 (= res!198033 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(declare-fun b!236932 () Bool)

(declare-fun res!198037 () Bool)

(assert (=> b!236932 (=> (not res!198037) (not e!163793))))

(assert (=> b!236932 (= res!198037 (not (= nBits!581 i!752)))))

(declare-fun res!198039 () Bool)

(declare-fun e!163796 () Bool)

(assert (=> start!50674 (=> (not res!198039) (not e!163796))))

(assert (=> start!50674 (= res!198039 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50674 e!163796))

(assert (=> start!50674 true))

(declare-fun inv!12 (BitStream!9996) Bool)

(assert (=> start!50674 (and (inv!12 thiss!1830) e!163794)))

(declare-fun b!236933 () Bool)

(assert (=> b!236933 (= e!163796 e!163793)))

(declare-fun res!198035 () Bool)

(assert (=> b!236933 (=> (not res!198035) (not e!163793))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!236933 (= res!198035 (validate_offset_bits!1 ((_ sign_extend 32) (size!5516 (buf!5991 thiss!1830))) ((_ sign_extend 32) (currentByte!11162 thiss!1830)) ((_ sign_extend 32) (currentBit!11157 thiss!1830)) lt!372488))))

(assert (=> b!236933 (= lt!372488 ((_ sign_extend 32) (bvsub nBits!581 i!752)))))

(assert (= (and start!50674 res!198039) b!236933))

(assert (= (and b!236933 res!198035) b!236927))

(assert (= (and b!236927 res!198038) b!236931))

(assert (= (and b!236931 res!198033) b!236932))

(assert (= (and b!236932 res!198037) b!236929))

(assert (= (and b!236929 res!198036) b!236930))

(assert (= (and b!236930 res!198034) b!236926))

(assert (= start!50674 b!236928))

(declare-fun m!359517 () Bool)

(assert (=> b!236927 m!359517))

(declare-fun m!359519 () Bool)

(assert (=> b!236930 m!359519))

(declare-fun m!359521 () Bool)

(assert (=> b!236930 m!359521))

(declare-fun m!359523 () Bool)

(assert (=> start!50674 m!359523))

(declare-fun m!359525 () Bool)

(assert (=> b!236931 m!359525))

(declare-fun m!359527 () Bool)

(assert (=> b!236933 m!359527))

(declare-fun m!359529 () Bool)

(assert (=> b!236929 m!359529))

(declare-fun m!359531 () Bool)

(assert (=> b!236929 m!359531))

(declare-fun m!359533 () Bool)

(assert (=> b!236928 m!359533))

(check-sat (not b!236928) (not b!236931) (not start!50674) (not b!236927) (not b!236929) (not b!236933) (not b!236930))
(check-sat)
