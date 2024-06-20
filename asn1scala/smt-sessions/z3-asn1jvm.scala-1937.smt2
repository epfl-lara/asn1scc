; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50512 () Bool)

(assert start!50512)

(declare-fun b!236497 () Bool)

(declare-fun e!163517 () Bool)

(declare-fun e!163516 () Bool)

(assert (=> b!236497 (= e!163517 e!163516)))

(declare-fun res!197675 () Bool)

(assert (=> b!236497 (=> (not res!197675) (not e!163516))))

(declare-datatypes ((array!12543 0))(
  ( (array!12544 (arr!6494 (Array (_ BitVec 32) (_ BitVec 8))) (size!5507 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9978 0))(
  ( (BitStream!9979 (buf!5982 array!12543) (currentByte!11129 (_ BitVec 32)) (currentBit!11124 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!19954 0))(
  ( (tuple2!19955 (_1!10881 Bool) (_2!10881 BitStream!9978)) )
))
(declare-fun lt!371869 () tuple2!19954)

(declare-fun lt!371870 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!236497 (= res!197675 (validate_offset_bits!1 ((_ sign_extend 32) (size!5507 (buf!5982 (_2!10881 lt!371869)))) ((_ sign_extend 32) (currentByte!11129 (_2!10881 lt!371869))) ((_ sign_extend 32) (currentBit!11124 (_2!10881 lt!371869))) ((_ sign_extend 32) lt!371870)))))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun i!752 () (_ BitVec 32))

(assert (=> b!236497 (= lt!371870 (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752)))))

(declare-fun b!236498 () Bool)

(declare-fun e!163515 () Bool)

(declare-fun thiss!1830 () BitStream!9978)

(declare-fun array_inv!5248 (array!12543) Bool)

(assert (=> b!236498 (= e!163515 (array_inv!5248 (buf!5982 thiss!1830)))))

(declare-fun res!197678 () Bool)

(declare-fun e!163520 () Bool)

(assert (=> start!50512 (=> (not res!197678) (not e!163520))))

(assert (=> start!50512 (= res!197678 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50512 e!163520))

(assert (=> start!50512 true))

(declare-fun inv!12 (BitStream!9978) Bool)

(assert (=> start!50512 (and (inv!12 thiss!1830) e!163515)))

(declare-fun b!236499 () Bool)

(declare-fun lt!371871 () (_ BitVec 64))

(declare-fun lt!371868 () (_ BitVec 64))

(assert (=> b!236499 (= e!163516 (not (= (bvand lt!371871 lt!371868) lt!371871)))))

(declare-fun b!236500 () Bool)

(declare-fun res!197674 () Bool)

(assert (=> b!236500 (=> (not res!197674) (not e!163520))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!236500 (= res!197674 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!236501 () Bool)

(declare-fun res!197676 () Bool)

(assert (=> b!236501 (=> (not res!197676) (not e!163520))))

(assert (=> b!236501 (= res!197676 (validate_offset_bits!1 ((_ sign_extend 32) (size!5507 (buf!5982 thiss!1830))) ((_ sign_extend 32) (currentByte!11129 thiss!1830)) ((_ sign_extend 32) (currentBit!11124 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(declare-fun b!236502 () Bool)

(declare-fun e!163518 () Bool)

(assert (=> b!236502 (= e!163520 e!163518)))

(declare-fun res!197677 () Bool)

(assert (=> b!236502 (=> (not res!197677) (not e!163518))))

(assert (=> b!236502 (= res!197677 (and (= (bvand acc!170 lt!371868) acc!170) (not (= nBits!581 i!752))))))

(assert (=> b!236502 (= lt!371868 (onesLSBLong!0 nBits!581))))

(declare-fun b!236503 () Bool)

(assert (=> b!236503 (= e!163518 e!163517)))

(declare-fun res!197673 () Bool)

(assert (=> b!236503 (=> (not res!197673) (not e!163517))))

(assert (=> b!236503 (= res!197673 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!752)) (bvsle (bvadd #b00000000000000000000000000000001 i!752) nBits!581)))))

(assert (=> b!236503 (= lt!371871 (bvor acc!170 (ite (_1!10881 lt!371869) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun readBit!0 (BitStream!9978) tuple2!19954)

(assert (=> b!236503 (= lt!371869 (readBit!0 thiss!1830))))

(declare-fun b!236504 () Bool)

(declare-fun res!197679 () Bool)

(assert (=> b!236504 (=> (not res!197679) (not e!163516))))

(assert (=> b!236504 (= res!197679 (= (bvand lt!371871 (onesLSBLong!0 lt!371870)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!50512 res!197678) b!236501))

(assert (= (and b!236501 res!197676) b!236500))

(assert (= (and b!236500 res!197674) b!236502))

(assert (= (and b!236502 res!197677) b!236503))

(assert (= (and b!236503 res!197673) b!236497))

(assert (= (and b!236497 res!197675) b!236504))

(assert (= (and b!236504 res!197679) b!236499))

(assert (= start!50512 b!236498))

(declare-fun m!359059 () Bool)

(assert (=> start!50512 m!359059))

(declare-fun m!359061 () Bool)

(assert (=> b!236504 m!359061))

(declare-fun m!359063 () Bool)

(assert (=> b!236497 m!359063))

(declare-fun m!359065 () Bool)

(assert (=> b!236502 m!359065))

(declare-fun m!359067 () Bool)

(assert (=> b!236500 m!359067))

(declare-fun m!359069 () Bool)

(assert (=> b!236503 m!359069))

(declare-fun m!359071 () Bool)

(assert (=> b!236498 m!359071))

(declare-fun m!359073 () Bool)

(assert (=> b!236501 m!359073))

(check-sat (not b!236500) (not b!236502) (not b!236498) (not b!236503) (not b!236504) (not b!236497) (not b!236501) (not start!50512))
(check-sat)
(get-model)

(declare-fun d!79862 () Bool)

(declare-fun e!163545 () Bool)

(assert (=> d!79862 e!163545))

(declare-fun res!197703 () Bool)

(assert (=> d!79862 (=> (not res!197703) (not e!163545))))

(declare-datatypes ((Unit!17369 0))(
  ( (Unit!17370) )
))
(declare-datatypes ((tuple2!19958 0))(
  ( (tuple2!19959 (_1!10883 Unit!17369) (_2!10883 BitStream!9978)) )
))
(declare-fun increaseBitIndex!0 (BitStream!9978) tuple2!19958)

(assert (=> d!79862 (= res!197703 (= (buf!5982 (_2!10883 (increaseBitIndex!0 thiss!1830))) (buf!5982 thiss!1830)))))

(declare-fun lt!371904 () Bool)

(assert (=> d!79862 (= lt!371904 (not (= (bvand ((_ sign_extend 24) (select (arr!6494 (buf!5982 thiss!1830)) (currentByte!11129 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11124 thiss!1830)))) #b00000000000000000000000000000000)))))

(declare-fun lt!371901 () tuple2!19954)

(assert (=> d!79862 (= lt!371901 (tuple2!19955 (not (= (bvand ((_ sign_extend 24) (select (arr!6494 (buf!5982 thiss!1830)) (currentByte!11129 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11124 thiss!1830)))) #b00000000000000000000000000000000)) (_2!10883 (increaseBitIndex!0 thiss!1830))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!79862 (validate_offset_bit!0 ((_ sign_extend 32) (size!5507 (buf!5982 thiss!1830))) ((_ sign_extend 32) (currentByte!11129 thiss!1830)) ((_ sign_extend 32) (currentBit!11124 thiss!1830)))))

(assert (=> d!79862 (= (readBit!0 thiss!1830) lt!371901)))

(declare-fun lt!371900 () (_ BitVec 64))

(declare-fun b!236531 () Bool)

(declare-fun lt!371902 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!236531 (= e!163545 (= (bitIndex!0 (size!5507 (buf!5982 (_2!10883 (increaseBitIndex!0 thiss!1830)))) (currentByte!11129 (_2!10883 (increaseBitIndex!0 thiss!1830))) (currentBit!11124 (_2!10883 (increaseBitIndex!0 thiss!1830)))) (bvadd lt!371900 lt!371902)))))

(assert (=> b!236531 (or (not (= (bvand lt!371900 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!371902 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!371900 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!371900 lt!371902) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!236531 (= lt!371902 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!236531 (= lt!371900 (bitIndex!0 (size!5507 (buf!5982 thiss!1830)) (currentByte!11129 thiss!1830) (currentBit!11124 thiss!1830)))))

(declare-fun lt!371899 () Bool)

(assert (=> b!236531 (= lt!371899 (not (= (bvand ((_ sign_extend 24) (select (arr!6494 (buf!5982 thiss!1830)) (currentByte!11129 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11124 thiss!1830)))) #b00000000000000000000000000000000)))))

(declare-fun lt!371898 () Bool)

(assert (=> b!236531 (= lt!371898 (not (= (bvand ((_ sign_extend 24) (select (arr!6494 (buf!5982 thiss!1830)) (currentByte!11129 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11124 thiss!1830)))) #b00000000000000000000000000000000)))))

(declare-fun lt!371903 () Bool)

(assert (=> b!236531 (= lt!371903 (not (= (bvand ((_ sign_extend 24) (select (arr!6494 (buf!5982 thiss!1830)) (currentByte!11129 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11124 thiss!1830)))) #b00000000000000000000000000000000)))))

(assert (= (and d!79862 res!197703) b!236531))

(declare-fun m!359093 () Bool)

(assert (=> d!79862 m!359093))

(declare-fun m!359095 () Bool)

(assert (=> d!79862 m!359095))

(declare-fun m!359097 () Bool)

(assert (=> d!79862 m!359097))

(declare-fun m!359099 () Bool)

(assert (=> d!79862 m!359099))

(declare-fun m!359101 () Bool)

(assert (=> b!236531 m!359101))

(assert (=> b!236531 m!359097))

(assert (=> b!236531 m!359093))

(declare-fun m!359103 () Bool)

(assert (=> b!236531 m!359103))

(assert (=> b!236531 m!359095))

(assert (=> b!236503 d!79862))

(declare-fun d!79868 () Bool)

(assert (=> d!79868 (= (array_inv!5248 (buf!5982 thiss!1830)) (bvsge (size!5507 (buf!5982 thiss!1830)) #b00000000000000000000000000000000))))

(assert (=> b!236498 d!79868))

(declare-fun d!79872 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!79872 (= (inv!12 thiss!1830) (invariant!0 (currentBit!11124 thiss!1830) (currentByte!11129 thiss!1830) (size!5507 (buf!5982 thiss!1830))))))

(declare-fun bs!19941 () Bool)

(assert (= bs!19941 d!79872))

(declare-fun m!359105 () Bool)

(assert (=> bs!19941 m!359105))

(assert (=> start!50512 d!79872))

(declare-fun d!79874 () Bool)

(assert (=> d!79874 (= (onesLSBLong!0 lt!371870) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 lt!371870))))))

(assert (=> b!236504 d!79874))

(declare-fun d!79878 () Bool)

(assert (=> d!79878 (= (onesLSBLong!0 nBits!581) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!581))))))

(assert (=> b!236502 d!79878))

(declare-fun d!79880 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!79880 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5507 (buf!5982 (_2!10881 lt!371869)))) ((_ sign_extend 32) (currentByte!11129 (_2!10881 lt!371869))) ((_ sign_extend 32) (currentBit!11124 (_2!10881 lt!371869))) ((_ sign_extend 32) lt!371870)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5507 (buf!5982 (_2!10881 lt!371869)))) ((_ sign_extend 32) (currentByte!11129 (_2!10881 lt!371869))) ((_ sign_extend 32) (currentBit!11124 (_2!10881 lt!371869)))) ((_ sign_extend 32) lt!371870)))))

(declare-fun bs!19943 () Bool)

(assert (= bs!19943 d!79880))

(declare-fun m!359109 () Bool)

(assert (=> bs!19943 m!359109))

(assert (=> b!236497 d!79880))

(declare-fun d!79882 () Bool)

(assert (=> d!79882 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5507 (buf!5982 thiss!1830))) ((_ sign_extend 32) (currentByte!11129 thiss!1830)) ((_ sign_extend 32) (currentBit!11124 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5507 (buf!5982 thiss!1830))) ((_ sign_extend 32) (currentByte!11129 thiss!1830)) ((_ sign_extend 32) (currentBit!11124 thiss!1830))) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(declare-fun bs!19944 () Bool)

(assert (= bs!19944 d!79882))

(declare-fun m!359111 () Bool)

(assert (=> bs!19944 m!359111))

(assert (=> b!236501 d!79882))

(declare-fun d!79884 () Bool)

(assert (=> d!79884 (= (onesLSBLong!0 (bvsub nBits!581 i!752)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!581 i!752)))))))

(assert (=> b!236500 d!79884))

(check-sat (not d!79872) (not d!79862) (not d!79880) (not b!236531) (not d!79882))
(check-sat)
