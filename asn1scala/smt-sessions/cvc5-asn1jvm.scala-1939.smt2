; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50624 () Bool)

(assert start!50624)

(declare-fun b!236765 () Bool)

(declare-fun e!163694 () Bool)

(declare-datatypes ((array!12559 0))(
  ( (array!12560 (arr!6499 (Array (_ BitVec 32) (_ BitVec 8))) (size!5512 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9988 0))(
  ( (BitStream!9989 (buf!5987 array!12559) (currentByte!11152 (_ BitVec 32)) (currentBit!11147 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!9988)

(declare-fun array_inv!5253 (array!12559) Bool)

(assert (=> b!236765 (= e!163694 (array_inv!5253 (buf!5987 thiss!1830)))))

(declare-fun b!236766 () Bool)

(declare-fun res!197905 () Bool)

(declare-fun e!163691 () Bool)

(assert (=> b!236766 (=> (not res!197905) (not e!163691))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun i!752 () (_ BitVec 32))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!236766 (= res!197905 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!236767 () Bool)

(declare-fun e!163693 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!236767 (= e!163693 (not (invariant!0 (currentBit!11147 thiss!1830) (currentByte!11152 thiss!1830) (size!5512 (buf!5987 thiss!1830)))))))

(declare-fun res!197906 () Bool)

(assert (=> start!50624 (=> (not res!197906) (not e!163691))))

(assert (=> start!50624 (= res!197906 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50624 e!163691))

(assert (=> start!50624 true))

(declare-fun inv!12 (BitStream!9988) Bool)

(assert (=> start!50624 (and (inv!12 thiss!1830) e!163694)))

(declare-fun b!236768 () Bool)

(declare-fun res!197907 () Bool)

(assert (=> b!236768 (=> (not res!197907) (not e!163691))))

(assert (=> b!236768 (= res!197907 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(declare-fun b!236769 () Bool)

(declare-fun res!197904 () Bool)

(assert (=> b!236769 (=> (not res!197904) (not e!163691))))

(assert (=> b!236769 (= res!197904 (not (= nBits!581 i!752)))))

(declare-fun b!236770 () Bool)

(assert (=> b!236770 (= e!163691 e!163693)))

(declare-fun res!197902 () Bool)

(assert (=> b!236770 (=> (not res!197902) (not e!163693))))

(declare-datatypes ((tuple2!19988 0))(
  ( (tuple2!19989 (_1!10898 Bool) (_2!10898 BitStream!9988)) )
))
(declare-fun lt!372321 () tuple2!19988)

(declare-datatypes ((tuple2!19990 0))(
  ( (tuple2!19991 (_1!10899 (_ BitVec 64)) (_2!10899 BitStream!9988)) )
))
(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!9988 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!19990)

(assert (=> b!236770 (= res!197902 (= (buf!5987 (_2!10899 (readNLeastSignificantBitsLoop!0 (_2!10898 lt!372321) nBits!581 (bvadd #b00000000000000000000000000000001 i!752) (bvor acc!170 (ite (_1!10898 lt!372321) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (buf!5987 thiss!1830)))))

(declare-fun readBit!0 (BitStream!9988) tuple2!19988)

(assert (=> b!236770 (= lt!372321 (readBit!0 thiss!1830))))

(declare-fun b!236771 () Bool)

(declare-fun res!197903 () Bool)

(assert (=> b!236771 (=> (not res!197903) (not e!163691))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!236771 (= res!197903 (validate_offset_bits!1 ((_ sign_extend 32) (size!5512 (buf!5987 thiss!1830))) ((_ sign_extend 32) (currentByte!11152 thiss!1830)) ((_ sign_extend 32) (currentBit!11147 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(assert (= (and start!50624 res!197906) b!236771))

(assert (= (and b!236771 res!197903) b!236766))

(assert (= (and b!236766 res!197905) b!236768))

(assert (= (and b!236768 res!197907) b!236769))

(assert (= (and b!236769 res!197904) b!236770))

(assert (= (and b!236770 res!197902) b!236767))

(assert (= start!50624 b!236765))

(declare-fun m!359379 () Bool)

(assert (=> start!50624 m!359379))

(declare-fun m!359381 () Bool)

(assert (=> b!236765 m!359381))

(declare-fun m!359383 () Bool)

(assert (=> b!236771 m!359383))

(declare-fun m!359385 () Bool)

(assert (=> b!236766 m!359385))

(declare-fun m!359387 () Bool)

(assert (=> b!236767 m!359387))

(declare-fun m!359389 () Bool)

(assert (=> b!236768 m!359389))

(declare-fun m!359391 () Bool)

(assert (=> b!236770 m!359391))

(declare-fun m!359393 () Bool)

(assert (=> b!236770 m!359393))

(push 1)

(assert (not b!236771))

(assert (not b!236768))

(assert (not b!236766))

(assert (not b!236767))

(assert (not start!50624))

(assert (not b!236770))

(assert (not b!236765))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!236852 () Bool)

(declare-fun res!197974 () Bool)

(declare-fun e!163742 () Bool)

(assert (=> b!236852 (=> (not res!197974) (not e!163742))))

(declare-fun lt!372392 () tuple2!19990)

(assert (=> b!236852 (= res!197974 (= (bvand (_1!10899 lt!372392) (onesLSBLong!0 nBits!581)) (_1!10899 lt!372392)))))

(declare-fun b!236853 () Bool)

(declare-fun e!163741 () Bool)

(assert (=> b!236853 (= e!163742 e!163741)))

(declare-fun res!197973 () Bool)

(assert (=> b!236853 (=> res!197973 e!163741)))

(assert (=> b!236853 (= res!197973 (bvsge (bvadd #b00000000000000000000000000000001 i!752) nBits!581))))

(declare-fun b!236854 () Bool)

(declare-fun e!163740 () tuple2!19990)

(assert (=> b!236854 (= e!163740 (tuple2!19991 (bvor acc!170 (ite (_1!10898 lt!372321) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000)) (_2!10898 lt!372321)))))

(declare-fun b!236855 () Bool)

(declare-fun lt!372394 () (_ BitVec 64))

(declare-datatypes ((tuple2!20004 0))(
  ( (tuple2!20005 (_1!10906 BitStream!9988) (_2!10906 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!9988) tuple2!20004)

(assert (=> b!236855 (= e!163741 (= (= (bvand (bvlshr (_1!10899 lt!372392) lt!372394) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!10906 (readBitPure!0 (_2!10898 lt!372321)))))))

(assert (=> b!236855 (and (bvsge lt!372394 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!372394 #b0000000000000000000000000000000000000000000000000000000001000000))))

(declare-fun lt!372390 () (_ BitVec 32))

(assert (=> b!236855 (= lt!372394 ((_ sign_extend 32) (bvsub lt!372390 (bvadd #b00000000000000000000000000000001 i!752))))))

(assert (=> b!236855 (or (= (bvand lt!372390 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!752) #b10000000000000000000000000000000)) (= (bvand lt!372390 #b10000000000000000000000000000000) (bvand (bvsub lt!372390 (bvadd #b00000000000000000000000000000001 i!752)) #b10000000000000000000000000000000)))))

(assert (=> b!236855 (= lt!372390 (bvsub nBits!581 #b00000000000000000000000000000001))))

(assert (=> b!236855 (or (= (bvand nBits!581 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))

(declare-fun b!236856 () Bool)

(declare-fun lt!372388 () tuple2!19990)

(assert (=> b!236856 (= e!163740 (tuple2!19991 (_1!10899 lt!372388) (_2!10899 lt!372388)))))

(declare-fun lt!372389 () tuple2!19988)

(assert (=> b!236856 (= lt!372389 (readBit!0 (_2!10898 lt!372321)))))

(assert (=> b!236856 (= lt!372388 (readNLeastSignificantBitsLoop!0 (_2!10898 lt!372389) nBits!581 (bvadd #b00000000000000000000000000000001 i!752 #b00000000000000000000000000000001) (bvor (bvor acc!170 (ite (_1!10898 lt!372321) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite (_1!10898 lt!372389) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!752)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!236857 () Bool)

(declare-fun res!197971 () Bool)

(assert (=> b!236857 (=> (not res!197971) (not e!163742))))

(declare-fun lt!372391 () (_ BitVec 64))

(declare-fun lt!372387 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!236857 (= res!197971 (= (bitIndex!0 (size!5512 (buf!5987 (_2!10899 lt!372392))) (currentByte!11152 (_2!10899 lt!372392)) (currentBit!11147 (_2!10899 lt!372392))) (bvadd lt!372391 lt!372387)))))

(assert (=> b!236857 (or (not (= (bvand lt!372391 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!372387 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!372391 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!372391 lt!372387) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!236857 (= lt!372387 ((_ sign_extend 32) (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752))))))

(assert (=> b!236857 (or (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!752) #b10000000000000000000000000000000)) (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752)) #b10000000000000000000000000000000)))))

(assert (=> b!236857 (= lt!372391 (bitIndex!0 (size!5512 (buf!5987 (_2!10898 lt!372321))) (currentByte!11152 (_2!10898 lt!372321)) (currentBit!11147 (_2!10898 lt!372321))))))

(declare-fun d!80038 () Bool)

(assert (=> d!80038 e!163742))

(declare-fun res!197975 () Bool)

(assert (=> d!80038 (=> (not res!197975) (not e!163742))))

(assert (=> d!80038 (= res!197975 (= (buf!5987 (_2!10899 lt!372392)) (buf!5987 (_2!10898 lt!372321))))))

(assert (=> d!80038 (= lt!372392 e!163740)))

(declare-fun c!11338 () Bool)

(assert (=> d!80038 (= c!11338 (= nBits!581 (bvadd #b00000000000000000000000000000001 i!752)))))

(assert (=> d!80038 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!752)) (bvsle (bvadd #b00000000000000000000000000000001 i!752) nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000))))

(assert (=> d!80038 (= (readNLeastSignificantBitsLoop!0 (_2!10898 lt!372321) nBits!581 (bvadd #b00000000000000000000000000000001 i!752) (bvor acc!170 (ite (_1!10898 lt!372321) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!372392)))

(declare-fun b!236851 () Bool)

(declare-fun res!197972 () Bool)

(assert (=> b!236851 (=> (not res!197972) (not e!163742))))

(declare-fun lt!372395 () (_ BitVec 64))

(declare-fun lt!372393 () (_ BitVec 64))

(assert (=> b!236851 (= res!197972 (= (bvlshr (_1!10899 lt!372392) lt!372393) (bvlshr (bvor acc!170 (ite (_1!10898 lt!372321) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000)) lt!372395)))))

(assert (=> b!236851 (and (bvsge lt!372395 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!372395 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!236851 (= lt!372395 ((_ sign_extend 32) (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752))))))

(assert (=> b!236851 (or (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!752) #b10000000000000000000000000000000)) (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752)) #b10000000000000000000000000000000)))))

(assert (=> b!236851 (and (bvsge lt!372393 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!372393 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!236851 (= lt!372393 ((_ sign_extend 32) (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752))))))

(assert (=> b!236851 (or (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!752) #b10000000000000000000000000000000)) (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752)) #b10000000000000000000000000000000)))))

(assert (= (and d!80038 c!11338) b!236854))

(assert (= (and d!80038 (not c!11338)) b!236856))

(assert (= (and d!80038 res!197975) b!236857))

(assert (= (and b!236857 res!197971) b!236851))

(assert (= (and b!236851 res!197972) b!236852))

(assert (= (and b!236852 res!197974) b!236853))

(assert (= (and b!236853 (not res!197973)) b!236855))

(assert (=> b!236852 m!359389))

(declare-fun m!359439 () Bool)

(assert (=> b!236855 m!359439))

(declare-fun m!359441 () Bool)

(assert (=> b!236856 m!359441))

(declare-fun m!359443 () Bool)

(assert (=> b!236856 m!359443))

(declare-fun m!359445 () Bool)

(assert (=> b!236857 m!359445))

(declare-fun m!359447 () Bool)

(assert (=> b!236857 m!359447))

(assert (=> b!236770 d!80038))

(declare-fun d!80050 () Bool)

(declare-fun e!163754 () Bool)

(assert (=> d!80050 e!163754))

(declare-fun res!197983 () Bool)

(assert (=> d!80050 (=> (not res!197983) (not e!163754))))

(declare-datatypes ((Unit!17389 0))(
  ( (Unit!17390) )
))
(declare-datatypes ((tuple2!20006 0))(
  ( (tuple2!20007 (_1!10907 Unit!17389) (_2!10907 BitStream!9988)) )
))
(declare-fun increaseBitIndex!0 (BitStream!9988) tuple2!20006)

(assert (=> d!80050 (= res!197983 (= (buf!5987 (_2!10907 (increaseBitIndex!0 thiss!1830))) (buf!5987 thiss!1830)))))

(declare-fun lt!372432 () Bool)

(assert (=> d!80050 (= lt!372432 (not (= (bvand ((_ sign_extend 24) (select (arr!6499 (buf!5987 thiss!1830)) (currentByte!11152 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11147 thiss!1830)))) #b00000000000000000000000000000000)))))

(declare-fun lt!372428 () tuple2!19988)

(assert (=> d!80050 (= lt!372428 (tuple2!19989 (not (= (bvand ((_ sign_extend 24) (select (arr!6499 (buf!5987 thiss!1830)) (currentByte!11152 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11147 thiss!1830)))) #b00000000000000000000000000000000)) (_2!10907 (increaseBitIndex!0 thiss!1830))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!80050 (validate_offset_bit!0 ((_ sign_extend 32) (size!5512 (buf!5987 thiss!1830))) ((_ sign_extend 32) (currentByte!11152 thiss!1830)) ((_ sign_extend 32) (currentBit!11147 thiss!1830)))))

(assert (=> d!80050 (= (readBit!0 thiss!1830) lt!372428)))

(declare-fun b!236867 () Bool)

(declare-fun lt!372433 () (_ BitVec 64))

(declare-fun lt!372430 () (_ BitVec 64))

(assert (=> b!236867 (= e!163754 (= (bitIndex!0 (size!5512 (buf!5987 (_2!10907 (increaseBitIndex!0 thiss!1830)))) (currentByte!11152 (_2!10907 (increaseBitIndex!0 thiss!1830))) (currentBit!11147 (_2!10907 (increaseBitIndex!0 thiss!1830)))) (bvadd lt!372430 lt!372433)))))

(assert (=> b!236867 (or (not (= (bvand lt!372430 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!372433 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!372430 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!372430 lt!372433) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!236867 (= lt!372433 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!236867 (= lt!372430 (bitIndex!0 (size!5512 (buf!5987 thiss!1830)) (currentByte!11152 thiss!1830) (currentBit!11147 thiss!1830)))))

(declare-fun lt!372431 () Bool)

(assert (=> b!236867 (= lt!372431 (not (= (bvand ((_ sign_extend 24) (select (arr!6499 (buf!5987 thiss!1830)) (currentByte!11152 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11147 thiss!1830)))) #b00000000000000000000000000000000)))))

(declare-fun lt!372429 () Bool)

(assert (=> b!236867 (= lt!372429 (not (= (bvand ((_ sign_extend 24) (select (arr!6499 (buf!5987 thiss!1830)) (currentByte!11152 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11147 thiss!1830)))) #b00000000000000000000000000000000)))))

(declare-fun lt!372427 () Bool)

(assert (=> b!236867 (= lt!372427 (not (= (bvand ((_ sign_extend 24) (select (arr!6499 (buf!5987 thiss!1830)) (currentByte!11152 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11147 thiss!1830)))) #b00000000000000000000000000000000)))))

(assert (= (and d!80050 res!197983) b!236867))

(declare-fun m!359463 () Bool)

(assert (=> d!80050 m!359463))

(declare-fun m!359465 () Bool)

(assert (=> d!80050 m!359465))

(declare-fun m!359467 () Bool)

(assert (=> d!80050 m!359467))

(declare-fun m!359469 () Bool)

(assert (=> d!80050 m!359469))

(assert (=> b!236867 m!359465))

(declare-fun m!359471 () Bool)

(assert (=> b!236867 m!359471))

(assert (=> b!236867 m!359463))

(assert (=> b!236867 m!359467))

(declare-fun m!359473 () Bool)

(assert (=> b!236867 m!359473))

(assert (=> b!236770 d!80050))

(declare-fun d!80056 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

