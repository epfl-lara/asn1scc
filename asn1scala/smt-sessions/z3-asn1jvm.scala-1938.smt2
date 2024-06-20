; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50548 () Bool)

(assert start!50548)

(declare-fun res!197740 () Bool)

(declare-fun e!163582 () Bool)

(assert (=> start!50548 (=> (not res!197740) (not e!163582))))

(declare-fun i!752 () (_ BitVec 32))

(declare-fun nBits!581 () (_ BitVec 32))

(assert (=> start!50548 (= res!197740 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50548 e!163582))

(assert (=> start!50548 true))

(declare-datatypes ((array!12552 0))(
  ( (array!12553 (arr!6497 (Array (_ BitVec 32) (_ BitVec 8))) (size!5510 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9984 0))(
  ( (BitStream!9985 (buf!5985 array!12552) (currentByte!11135 (_ BitVec 32)) (currentBit!11130 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!9984)

(declare-fun e!163583 () Bool)

(declare-fun inv!12 (BitStream!9984) Bool)

(assert (=> start!50548 (and (inv!12 thiss!1830) e!163583)))

(declare-fun b!236573 () Bool)

(declare-fun array_inv!5251 (array!12552) Bool)

(assert (=> b!236573 (= e!163583 (array_inv!5251 (buf!5985 thiss!1830)))))

(declare-fun b!236574 () Bool)

(declare-fun e!163581 () Bool)

(declare-datatypes ((tuple2!19968 0))(
  ( (tuple2!19969 (_1!10888 (_ BitVec 64)) (_2!10888 BitStream!9984)) )
))
(declare-fun lt!371958 () tuple2!19968)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!236574 (= e!163581 (not (invariant!0 (currentBit!11130 (_2!10888 lt!371958)) (currentByte!11135 (_2!10888 lt!371958)) (size!5510 (buf!5985 (_2!10888 lt!371958))))))))

(declare-fun b!236575 () Bool)

(assert (=> b!236575 (= e!163582 e!163581)))

(declare-fun res!197742 () Bool)

(assert (=> b!236575 (=> (not res!197742) (not e!163581))))

(assert (=> b!236575 (= res!197742 (= (buf!5985 (_2!10888 lt!371958)) (buf!5985 thiss!1830)))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-datatypes ((tuple2!19970 0))(
  ( (tuple2!19971 (_1!10889 Bool) (_2!10889 BitStream!9984)) )
))
(declare-fun lt!371957 () tuple2!19970)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!9984 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!19968)

(assert (=> b!236575 (= lt!371958 (readNLeastSignificantBitsLoop!0 (_2!10889 lt!371957) nBits!581 (bvadd #b00000000000000000000000000000001 i!752) (bvor acc!170 (ite (_1!10889 lt!371957) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun readBit!0 (BitStream!9984) tuple2!19970)

(assert (=> b!236575 (= lt!371957 (readBit!0 thiss!1830))))

(declare-fun b!236576 () Bool)

(declare-fun res!197743 () Bool)

(assert (=> b!236576 (=> (not res!197743) (not e!163582))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!236576 (= res!197743 (validate_offset_bits!1 ((_ sign_extend 32) (size!5510 (buf!5985 thiss!1830))) ((_ sign_extend 32) (currentByte!11135 thiss!1830)) ((_ sign_extend 32) (currentBit!11130 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(declare-fun b!236577 () Bool)

(declare-fun res!197745 () Bool)

(assert (=> b!236577 (=> (not res!197745) (not e!163582))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!236577 (= res!197745 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(declare-fun b!236578 () Bool)

(declare-fun res!197741 () Bool)

(assert (=> b!236578 (=> (not res!197741) (not e!163582))))

(assert (=> b!236578 (= res!197741 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!236579 () Bool)

(declare-fun res!197744 () Bool)

(assert (=> b!236579 (=> (not res!197744) (not e!163582))))

(assert (=> b!236579 (= res!197744 (not (= nBits!581 i!752)))))

(assert (= (and start!50548 res!197740) b!236576))

(assert (= (and b!236576 res!197743) b!236578))

(assert (= (and b!236578 res!197741) b!236577))

(assert (= (and b!236577 res!197745) b!236579))

(assert (= (and b!236579 res!197744) b!236575))

(assert (= (and b!236575 res!197742) b!236574))

(assert (= start!50548 b!236573))

(declare-fun m!359161 () Bool)

(assert (=> b!236578 m!359161))

(declare-fun m!359163 () Bool)

(assert (=> start!50548 m!359163))

(declare-fun m!359165 () Bool)

(assert (=> b!236573 m!359165))

(declare-fun m!359167 () Bool)

(assert (=> b!236576 m!359167))

(declare-fun m!359169 () Bool)

(assert (=> b!236577 m!359169))

(declare-fun m!359171 () Bool)

(assert (=> b!236574 m!359171))

(declare-fun m!359173 () Bool)

(assert (=> b!236575 m!359173))

(declare-fun m!359175 () Bool)

(assert (=> b!236575 m!359175))

(check-sat (not b!236576) (not b!236573) (not start!50548) (not b!236578) (not b!236575) (not b!236574) (not b!236577))
(check-sat)
(get-model)

(declare-fun d!79912 () Bool)

(assert (=> d!79912 (= (invariant!0 (currentBit!11130 (_2!10888 lt!371958)) (currentByte!11135 (_2!10888 lt!371958)) (size!5510 (buf!5985 (_2!10888 lt!371958)))) (and (bvsge (currentBit!11130 (_2!10888 lt!371958)) #b00000000000000000000000000000000) (bvslt (currentBit!11130 (_2!10888 lt!371958)) #b00000000000000000000000000001000) (bvsge (currentByte!11135 (_2!10888 lt!371958)) #b00000000000000000000000000000000) (or (bvslt (currentByte!11135 (_2!10888 lt!371958)) (size!5510 (buf!5985 (_2!10888 lt!371958)))) (and (= (currentBit!11130 (_2!10888 lt!371958)) #b00000000000000000000000000000000) (= (currentByte!11135 (_2!10888 lt!371958)) (size!5510 (buf!5985 (_2!10888 lt!371958))))))))))

(assert (=> b!236574 d!79912))

(declare-fun d!79914 () Bool)

(assert (=> d!79914 (= (array_inv!5251 (buf!5985 thiss!1830)) (bvsge (size!5510 (buf!5985 thiss!1830)) #b00000000000000000000000000000000))))

(assert (=> b!236573 d!79914))

(declare-fun d!79916 () Bool)

(assert (=> d!79916 (= (inv!12 thiss!1830) (invariant!0 (currentBit!11130 thiss!1830) (currentByte!11135 thiss!1830) (size!5510 (buf!5985 thiss!1830))))))

(declare-fun bs!19952 () Bool)

(assert (= bs!19952 d!79916))

(declare-fun m!359193 () Bool)

(assert (=> bs!19952 m!359193))

(assert (=> start!50548 d!79916))

(declare-fun b!236615 () Bool)

(declare-fun res!197777 () Bool)

(declare-fun e!163603 () Bool)

(assert (=> b!236615 (=> (not res!197777) (not e!163603))))

(declare-fun lt!371989 () (_ BitVec 64))

(declare-fun lt!371988 () tuple2!19968)

(declare-fun lt!371990 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!236615 (= res!197777 (= (bitIndex!0 (size!5510 (buf!5985 (_2!10888 lt!371988))) (currentByte!11135 (_2!10888 lt!371988)) (currentBit!11130 (_2!10888 lt!371988))) (bvadd lt!371989 lt!371990)))))

(assert (=> b!236615 (or (not (= (bvand lt!371989 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!371990 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!371989 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!371989 lt!371990) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!236615 (= lt!371990 ((_ sign_extend 32) (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752))))))

(assert (=> b!236615 (or (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!752) #b10000000000000000000000000000000)) (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752)) #b10000000000000000000000000000000)))))

(assert (=> b!236615 (= lt!371989 (bitIndex!0 (size!5510 (buf!5985 (_2!10889 lt!371957))) (currentByte!11135 (_2!10889 lt!371957)) (currentBit!11130 (_2!10889 lt!371957))))))

(declare-fun e!163604 () Bool)

(declare-fun b!236616 () Bool)

(declare-fun lt!371987 () (_ BitVec 64))

(declare-datatypes ((tuple2!19976 0))(
  ( (tuple2!19977 (_1!10892 BitStream!9984) (_2!10892 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!9984) tuple2!19976)

(assert (=> b!236616 (= e!163604 (= (= (bvand (bvlshr (_1!10888 lt!371988) lt!371987) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!10892 (readBitPure!0 (_2!10889 lt!371957)))))))

(assert (=> b!236616 (and (bvsge lt!371987 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!371987 #b0000000000000000000000000000000000000000000000000000000001000000))))

(declare-fun lt!371985 () (_ BitVec 32))

(assert (=> b!236616 (= lt!371987 ((_ sign_extend 32) (bvsub lt!371985 (bvadd #b00000000000000000000000000000001 i!752))))))

(assert (=> b!236616 (or (= (bvand lt!371985 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!752) #b10000000000000000000000000000000)) (= (bvand lt!371985 #b10000000000000000000000000000000) (bvand (bvsub lt!371985 (bvadd #b00000000000000000000000000000001 i!752)) #b10000000000000000000000000000000)))))

(assert (=> b!236616 (= lt!371985 (bvsub nBits!581 #b00000000000000000000000000000001))))

(assert (=> b!236616 (or (= (bvand nBits!581 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))

(declare-fun b!236617 () Bool)

(assert (=> b!236617 (= e!163603 e!163604)))

(declare-fun res!197774 () Bool)

(assert (=> b!236617 (=> res!197774 e!163604)))

(assert (=> b!236617 (= res!197774 (bvsge (bvadd #b00000000000000000000000000000001 i!752) nBits!581))))

(declare-fun b!236618 () Bool)

(declare-fun res!197776 () Bool)

(assert (=> b!236618 (=> (not res!197776) (not e!163603))))

(declare-fun lt!371983 () (_ BitVec 64))

(declare-fun lt!371991 () (_ BitVec 64))

(assert (=> b!236618 (= res!197776 (= (bvlshr (_1!10888 lt!371988) lt!371983) (bvlshr (bvor acc!170 (ite (_1!10889 lt!371957) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000)) lt!371991)))))

(assert (=> b!236618 (and (bvsge lt!371991 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!371991 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!236618 (= lt!371991 ((_ sign_extend 32) (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752))))))

(assert (=> b!236618 (or (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!752) #b10000000000000000000000000000000)) (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752)) #b10000000000000000000000000000000)))))

(assert (=> b!236618 (and (bvsge lt!371983 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!371983 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!236618 (= lt!371983 ((_ sign_extend 32) (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752))))))

(assert (=> b!236618 (or (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!752) #b10000000000000000000000000000000)) (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752)) #b10000000000000000000000000000000)))))

(declare-fun b!236619 () Bool)

(declare-fun e!163602 () tuple2!19968)

(assert (=> b!236619 (= e!163602 (tuple2!19969 (bvor acc!170 (ite (_1!10889 lt!371957) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000)) (_2!10889 lt!371957)))))

(declare-fun b!236620 () Bool)

(declare-fun lt!371986 () tuple2!19968)

(assert (=> b!236620 (= e!163602 (tuple2!19969 (_1!10888 lt!371986) (_2!10888 lt!371986)))))

(declare-fun lt!371984 () tuple2!19970)

(assert (=> b!236620 (= lt!371984 (readBit!0 (_2!10889 lt!371957)))))

(assert (=> b!236620 (= lt!371986 (readNLeastSignificantBitsLoop!0 (_2!10889 lt!371984) nBits!581 (bvadd #b00000000000000000000000000000001 i!752 #b00000000000000000000000000000001) (bvor (bvor acc!170 (ite (_1!10889 lt!371957) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite (_1!10889 lt!371984) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!752)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!236621 () Bool)

(declare-fun res!197775 () Bool)

(assert (=> b!236621 (=> (not res!197775) (not e!163603))))

(assert (=> b!236621 (= res!197775 (= (bvand (_1!10888 lt!371988) (onesLSBLong!0 nBits!581)) (_1!10888 lt!371988)))))

(declare-fun d!79918 () Bool)

(assert (=> d!79918 e!163603))

(declare-fun res!197778 () Bool)

(assert (=> d!79918 (=> (not res!197778) (not e!163603))))

(assert (=> d!79918 (= res!197778 (= (buf!5985 (_2!10888 lt!371988)) (buf!5985 (_2!10889 lt!371957))))))

(assert (=> d!79918 (= lt!371988 e!163602)))

(declare-fun c!11323 () Bool)

(assert (=> d!79918 (= c!11323 (= nBits!581 (bvadd #b00000000000000000000000000000001 i!752)))))

(assert (=> d!79918 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!752)) (bvsle (bvadd #b00000000000000000000000000000001 i!752) nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000))))

(assert (=> d!79918 (= (readNLeastSignificantBitsLoop!0 (_2!10889 lt!371957) nBits!581 (bvadd #b00000000000000000000000000000001 i!752) (bvor acc!170 (ite (_1!10889 lt!371957) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!371988)))

(assert (= (and d!79918 c!11323) b!236619))

(assert (= (and d!79918 (not c!11323)) b!236620))

(assert (= (and d!79918 res!197778) b!236615))

(assert (= (and b!236615 res!197777) b!236618))

(assert (= (and b!236618 res!197776) b!236621))

(assert (= (and b!236621 res!197775) b!236617))

(assert (= (and b!236617 (not res!197774)) b!236616))

(declare-fun m!359201 () Bool)

(assert (=> b!236615 m!359201))

(declare-fun m!359203 () Bool)

(assert (=> b!236615 m!359203))

(declare-fun m!359205 () Bool)

(assert (=> b!236616 m!359205))

(declare-fun m!359207 () Bool)

(assert (=> b!236620 m!359207))

(declare-fun m!359209 () Bool)

(assert (=> b!236620 m!359209))

(assert (=> b!236621 m!359169))

(assert (=> b!236575 d!79918))

(declare-fun d!79938 () Bool)

(declare-fun e!163620 () Bool)

(assert (=> d!79938 e!163620))

(declare-fun res!197796 () Bool)

(assert (=> d!79938 (=> (not res!197796) (not e!163620))))

(declare-datatypes ((Unit!17375 0))(
  ( (Unit!17376) )
))
(declare-datatypes ((tuple2!19978 0))(
  ( (tuple2!19979 (_1!10893 Unit!17375) (_2!10893 BitStream!9984)) )
))
(declare-fun increaseBitIndex!0 (BitStream!9984) tuple2!19978)

(assert (=> d!79938 (= res!197796 (= (buf!5985 (_2!10893 (increaseBitIndex!0 thiss!1830))) (buf!5985 thiss!1830)))))

(declare-fun lt!372033 () Bool)

(assert (=> d!79938 (= lt!372033 (not (= (bvand ((_ sign_extend 24) (select (arr!6497 (buf!5985 thiss!1830)) (currentByte!11135 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11130 thiss!1830)))) #b00000000000000000000000000000000)))))

(declare-fun lt!372037 () tuple2!19970)

(assert (=> d!79938 (= lt!372037 (tuple2!19971 (not (= (bvand ((_ sign_extend 24) (select (arr!6497 (buf!5985 thiss!1830)) (currentByte!11135 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11130 thiss!1830)))) #b00000000000000000000000000000000)) (_2!10893 (increaseBitIndex!0 thiss!1830))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!79938 (validate_offset_bit!0 ((_ sign_extend 32) (size!5510 (buf!5985 thiss!1830))) ((_ sign_extend 32) (currentByte!11135 thiss!1830)) ((_ sign_extend 32) (currentBit!11130 thiss!1830)))))

(assert (=> d!79938 (= (readBit!0 thiss!1830) lt!372037)))

(declare-fun b!236645 () Bool)

(declare-fun lt!372035 () (_ BitVec 64))

(declare-fun lt!372038 () (_ BitVec 64))

(assert (=> b!236645 (= e!163620 (= (bitIndex!0 (size!5510 (buf!5985 (_2!10893 (increaseBitIndex!0 thiss!1830)))) (currentByte!11135 (_2!10893 (increaseBitIndex!0 thiss!1830))) (currentBit!11130 (_2!10893 (increaseBitIndex!0 thiss!1830)))) (bvadd lt!372035 lt!372038)))))

(assert (=> b!236645 (or (not (= (bvand lt!372035 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!372038 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!372035 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!372035 lt!372038) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!236645 (= lt!372038 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!236645 (= lt!372035 (bitIndex!0 (size!5510 (buf!5985 thiss!1830)) (currentByte!11135 thiss!1830) (currentBit!11130 thiss!1830)))))

(declare-fun lt!372034 () Bool)

(assert (=> b!236645 (= lt!372034 (not (= (bvand ((_ sign_extend 24) (select (arr!6497 (buf!5985 thiss!1830)) (currentByte!11135 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11130 thiss!1830)))) #b00000000000000000000000000000000)))))

(declare-fun lt!372039 () Bool)

(assert (=> b!236645 (= lt!372039 (not (= (bvand ((_ sign_extend 24) (select (arr!6497 (buf!5985 thiss!1830)) (currentByte!11135 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11130 thiss!1830)))) #b00000000000000000000000000000000)))))

(declare-fun lt!372036 () Bool)

(assert (=> b!236645 (= lt!372036 (not (= (bvand ((_ sign_extend 24) (select (arr!6497 (buf!5985 thiss!1830)) (currentByte!11135 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11130 thiss!1830)))) #b00000000000000000000000000000000)))))

(assert (= (and d!79938 res!197796) b!236645))

(declare-fun m!359221 () Bool)

(assert (=> d!79938 m!359221))

(declare-fun m!359223 () Bool)

(assert (=> d!79938 m!359223))

(declare-fun m!359225 () Bool)

(assert (=> d!79938 m!359225))

(declare-fun m!359227 () Bool)

(assert (=> d!79938 m!359227))

(assert (=> b!236645 m!359221))

(declare-fun m!359229 () Bool)

(assert (=> b!236645 m!359229))

(assert (=> b!236645 m!359223))

(assert (=> b!236645 m!359225))

(declare-fun m!359231 () Bool)

(assert (=> b!236645 m!359231))

(assert (=> b!236575 d!79938))

(declare-fun d!79942 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!79942 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5510 (buf!5985 thiss!1830))) ((_ sign_extend 32) (currentByte!11135 thiss!1830)) ((_ sign_extend 32) (currentBit!11130 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5510 (buf!5985 thiss!1830))) ((_ sign_extend 32) (currentByte!11135 thiss!1830)) ((_ sign_extend 32) (currentBit!11130 thiss!1830))) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(declare-fun bs!19956 () Bool)

(assert (= bs!19956 d!79942))

(declare-fun m!359233 () Bool)

(assert (=> bs!19956 m!359233))

(assert (=> b!236576 d!79942))

(declare-fun d!79944 () Bool)

(assert (=> d!79944 (= (onesLSBLong!0 (bvsub nBits!581 i!752)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!581 i!752)))))))

(assert (=> b!236578 d!79944))

(declare-fun d!79946 () Bool)

(assert (=> d!79946 (= (onesLSBLong!0 nBits!581) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!581))))))

(assert (=> b!236577 d!79946))

(check-sat (not d!79916) (not b!236621) (not b!236616) (not d!79938) (not d!79942) (not b!236645) (not b!236615) (not b!236620))
(check-sat)
(get-model)

(declare-fun d!79960 () Bool)

(declare-fun e!163646 () Bool)

(assert (=> d!79960 e!163646))

(declare-fun res!197822 () Bool)

(assert (=> d!79960 (=> (not res!197822) (not e!163646))))

(declare-fun lt!372121 () tuple2!19978)

(declare-fun lt!372122 () (_ BitVec 64))

(declare-fun lt!372119 () (_ BitVec 64))

(assert (=> d!79960 (= res!197822 (= (bvadd lt!372119 lt!372122) (bitIndex!0 (size!5510 (buf!5985 (_2!10893 lt!372121))) (currentByte!11135 (_2!10893 lt!372121)) (currentBit!11130 (_2!10893 lt!372121)))))))

(assert (=> d!79960 (or (not (= (bvand lt!372119 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!372122 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!372119 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!372119 lt!372122) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!79960 (= lt!372122 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!79960 (= lt!372119 (bitIndex!0 (size!5510 (buf!5985 thiss!1830)) (currentByte!11135 thiss!1830) (currentBit!11130 thiss!1830)))))

(declare-fun Unit!17381 () Unit!17375)

(declare-fun Unit!17382 () Unit!17375)

(assert (=> d!79960 (= lt!372121 (ite (bvslt (currentBit!11130 thiss!1830) #b00000000000000000000000000000111) (tuple2!19979 Unit!17381 (BitStream!9985 (buf!5985 thiss!1830) (currentByte!11135 thiss!1830) (bvadd (currentBit!11130 thiss!1830) #b00000000000000000000000000000001))) (tuple2!19979 Unit!17382 (BitStream!9985 (buf!5985 thiss!1830) (bvadd (currentByte!11135 thiss!1830) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (=> d!79960 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!5510 (buf!5985 thiss!1830))) ((_ sign_extend 32) (currentByte!11135 thiss!1830)) ((_ sign_extend 32) (currentBit!11130 thiss!1830))) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!79960 (= (increaseBitIndex!0 thiss!1830) lt!372121)))

(declare-fun b!236677 () Bool)

(declare-fun res!197823 () Bool)

(assert (=> b!236677 (=> (not res!197823) (not e!163646))))

(declare-fun lt!372123 () (_ BitVec 64))

(declare-fun lt!372120 () (_ BitVec 64))

(assert (=> b!236677 (= res!197823 (= (bvsub lt!372123 lt!372120) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!236677 (or (= (bvand lt!372123 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!372120 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!372123 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!372123 lt!372120) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!236677 (= lt!372120 (remainingBits!0 ((_ sign_extend 32) (size!5510 (buf!5985 (_2!10893 lt!372121)))) ((_ sign_extend 32) (currentByte!11135 (_2!10893 lt!372121))) ((_ sign_extend 32) (currentBit!11130 (_2!10893 lt!372121)))))))

(assert (=> b!236677 (= lt!372123 (remainingBits!0 ((_ sign_extend 32) (size!5510 (buf!5985 thiss!1830))) ((_ sign_extend 32) (currentByte!11135 thiss!1830)) ((_ sign_extend 32) (currentBit!11130 thiss!1830))))))

(declare-fun b!236678 () Bool)

(assert (=> b!236678 (= e!163646 (= (size!5510 (buf!5985 thiss!1830)) (size!5510 (buf!5985 (_2!10893 lt!372121)))))))

(assert (= (and d!79960 res!197822) b!236677))

(assert (= (and b!236677 res!197823) b!236678))

(declare-fun m!359271 () Bool)

(assert (=> d!79960 m!359271))

(assert (=> d!79960 m!359229))

(assert (=> d!79960 m!359233))

(declare-fun m!359273 () Bool)

(assert (=> b!236677 m!359273))

(assert (=> b!236677 m!359233))

(assert (=> d!79938 d!79960))

(declare-fun d!79962 () Bool)

(assert (=> d!79962 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!5510 (buf!5985 thiss!1830))) ((_ sign_extend 32) (currentByte!11135 thiss!1830)) ((_ sign_extend 32) (currentBit!11130 thiss!1830))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5510 (buf!5985 thiss!1830))) ((_ sign_extend 32) (currentByte!11135 thiss!1830)) ((_ sign_extend 32) (currentBit!11130 thiss!1830))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!19958 () Bool)

(assert (= bs!19958 d!79962))

(assert (=> bs!19958 m!359233))

(assert (=> d!79938 d!79962))

(declare-fun d!79964 () Bool)

(declare-fun e!163649 () Bool)

(assert (=> d!79964 e!163649))

(declare-fun res!197828 () Bool)

(assert (=> d!79964 (=> (not res!197828) (not e!163649))))

(declare-fun lt!372140 () (_ BitVec 64))

(declare-fun lt!372136 () (_ BitVec 64))

(declare-fun lt!372138 () (_ BitVec 64))

(assert (=> d!79964 (= res!197828 (= lt!372136 (bvsub lt!372138 lt!372140)))))

(assert (=> d!79964 (or (= (bvand lt!372138 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!372140 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!372138 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!372138 lt!372140) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!79964 (= lt!372140 (remainingBits!0 ((_ sign_extend 32) (size!5510 (buf!5985 (_2!10893 (increaseBitIndex!0 thiss!1830))))) ((_ sign_extend 32) (currentByte!11135 (_2!10893 (increaseBitIndex!0 thiss!1830)))) ((_ sign_extend 32) (currentBit!11130 (_2!10893 (increaseBitIndex!0 thiss!1830))))))))

(declare-fun lt!372137 () (_ BitVec 64))

(declare-fun lt!372141 () (_ BitVec 64))

(assert (=> d!79964 (= lt!372138 (bvmul lt!372137 lt!372141))))

(assert (=> d!79964 (or (= lt!372137 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!372141 (bvsdiv (bvmul lt!372137 lt!372141) lt!372137)))))

(assert (=> d!79964 (= lt!372141 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!79964 (= lt!372137 ((_ sign_extend 32) (size!5510 (buf!5985 (_2!10893 (increaseBitIndex!0 thiss!1830))))))))

(assert (=> d!79964 (= lt!372136 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11135 (_2!10893 (increaseBitIndex!0 thiss!1830)))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11130 (_2!10893 (increaseBitIndex!0 thiss!1830))))))))

(assert (=> d!79964 (invariant!0 (currentBit!11130 (_2!10893 (increaseBitIndex!0 thiss!1830))) (currentByte!11135 (_2!10893 (increaseBitIndex!0 thiss!1830))) (size!5510 (buf!5985 (_2!10893 (increaseBitIndex!0 thiss!1830)))))))

(assert (=> d!79964 (= (bitIndex!0 (size!5510 (buf!5985 (_2!10893 (increaseBitIndex!0 thiss!1830)))) (currentByte!11135 (_2!10893 (increaseBitIndex!0 thiss!1830))) (currentBit!11130 (_2!10893 (increaseBitIndex!0 thiss!1830)))) lt!372136)))

(declare-fun b!236683 () Bool)

(declare-fun res!197829 () Bool)

(assert (=> b!236683 (=> (not res!197829) (not e!163649))))

(assert (=> b!236683 (= res!197829 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!372136))))

(declare-fun b!236684 () Bool)

(declare-fun lt!372139 () (_ BitVec 64))

(assert (=> b!236684 (= e!163649 (bvsle lt!372136 (bvmul lt!372139 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!236684 (or (= lt!372139 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!372139 #b0000000000000000000000000000000000000000000000000000000000001000) lt!372139)))))

(assert (=> b!236684 (= lt!372139 ((_ sign_extend 32) (size!5510 (buf!5985 (_2!10893 (increaseBitIndex!0 thiss!1830))))))))

(assert (= (and d!79964 res!197828) b!236683))

(assert (= (and b!236683 res!197829) b!236684))

(declare-fun m!359275 () Bool)

(assert (=> d!79964 m!359275))

(declare-fun m!359277 () Bool)

(assert (=> d!79964 m!359277))

(assert (=> b!236645 d!79964))

(assert (=> b!236645 d!79960))

(declare-fun d!79966 () Bool)

(declare-fun e!163650 () Bool)

(assert (=> d!79966 e!163650))

(declare-fun res!197830 () Bool)

(assert (=> d!79966 (=> (not res!197830) (not e!163650))))

(declare-fun lt!372146 () (_ BitVec 64))

(declare-fun lt!372144 () (_ BitVec 64))

(declare-fun lt!372142 () (_ BitVec 64))

(assert (=> d!79966 (= res!197830 (= lt!372142 (bvsub lt!372144 lt!372146)))))

(assert (=> d!79966 (or (= (bvand lt!372144 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!372146 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!372144 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!372144 lt!372146) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!79966 (= lt!372146 (remainingBits!0 ((_ sign_extend 32) (size!5510 (buf!5985 thiss!1830))) ((_ sign_extend 32) (currentByte!11135 thiss!1830)) ((_ sign_extend 32) (currentBit!11130 thiss!1830))))))

(declare-fun lt!372143 () (_ BitVec 64))

(declare-fun lt!372147 () (_ BitVec 64))

(assert (=> d!79966 (= lt!372144 (bvmul lt!372143 lt!372147))))

(assert (=> d!79966 (or (= lt!372143 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!372147 (bvsdiv (bvmul lt!372143 lt!372147) lt!372143)))))

(assert (=> d!79966 (= lt!372147 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!79966 (= lt!372143 ((_ sign_extend 32) (size!5510 (buf!5985 thiss!1830))))))

(assert (=> d!79966 (= lt!372142 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11135 thiss!1830)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11130 thiss!1830))))))

(assert (=> d!79966 (invariant!0 (currentBit!11130 thiss!1830) (currentByte!11135 thiss!1830) (size!5510 (buf!5985 thiss!1830)))))

(assert (=> d!79966 (= (bitIndex!0 (size!5510 (buf!5985 thiss!1830)) (currentByte!11135 thiss!1830) (currentBit!11130 thiss!1830)) lt!372142)))

(declare-fun b!236685 () Bool)

(declare-fun res!197831 () Bool)

(assert (=> b!236685 (=> (not res!197831) (not e!163650))))

(assert (=> b!236685 (= res!197831 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!372142))))

(declare-fun b!236686 () Bool)

(declare-fun lt!372145 () (_ BitVec 64))

(assert (=> b!236686 (= e!163650 (bvsle lt!372142 (bvmul lt!372145 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!236686 (or (= lt!372145 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!372145 #b0000000000000000000000000000000000000000000000000000000000001000) lt!372145)))))

(assert (=> b!236686 (= lt!372145 ((_ sign_extend 32) (size!5510 (buf!5985 thiss!1830))))))

(assert (= (and d!79966 res!197830) b!236685))

(assert (= (and b!236685 res!197831) b!236686))

(assert (=> d!79966 m!359233))

(assert (=> d!79966 m!359193))

(assert (=> b!236645 d!79966))

(declare-fun d!79968 () Bool)

(declare-fun e!163651 () Bool)

(assert (=> d!79968 e!163651))

(declare-fun res!197832 () Bool)

(assert (=> d!79968 (=> (not res!197832) (not e!163651))))

(declare-fun lt!372150 () (_ BitVec 64))

(declare-fun lt!372152 () (_ BitVec 64))

(declare-fun lt!372148 () (_ BitVec 64))

(assert (=> d!79968 (= res!197832 (= lt!372148 (bvsub lt!372150 lt!372152)))))

(assert (=> d!79968 (or (= (bvand lt!372150 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!372152 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!372150 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!372150 lt!372152) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!79968 (= lt!372152 (remainingBits!0 ((_ sign_extend 32) (size!5510 (buf!5985 (_2!10888 lt!371988)))) ((_ sign_extend 32) (currentByte!11135 (_2!10888 lt!371988))) ((_ sign_extend 32) (currentBit!11130 (_2!10888 lt!371988)))))))

(declare-fun lt!372149 () (_ BitVec 64))

(declare-fun lt!372153 () (_ BitVec 64))

(assert (=> d!79968 (= lt!372150 (bvmul lt!372149 lt!372153))))

(assert (=> d!79968 (or (= lt!372149 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!372153 (bvsdiv (bvmul lt!372149 lt!372153) lt!372149)))))

(assert (=> d!79968 (= lt!372153 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!79968 (= lt!372149 ((_ sign_extend 32) (size!5510 (buf!5985 (_2!10888 lt!371988)))))))

(assert (=> d!79968 (= lt!372148 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11135 (_2!10888 lt!371988))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11130 (_2!10888 lt!371988)))))))

(assert (=> d!79968 (invariant!0 (currentBit!11130 (_2!10888 lt!371988)) (currentByte!11135 (_2!10888 lt!371988)) (size!5510 (buf!5985 (_2!10888 lt!371988))))))

(assert (=> d!79968 (= (bitIndex!0 (size!5510 (buf!5985 (_2!10888 lt!371988))) (currentByte!11135 (_2!10888 lt!371988)) (currentBit!11130 (_2!10888 lt!371988))) lt!372148)))

(declare-fun b!236687 () Bool)

(declare-fun res!197833 () Bool)

(assert (=> b!236687 (=> (not res!197833) (not e!163651))))

(assert (=> b!236687 (= res!197833 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!372148))))

(declare-fun b!236688 () Bool)

(declare-fun lt!372151 () (_ BitVec 64))

(assert (=> b!236688 (= e!163651 (bvsle lt!372148 (bvmul lt!372151 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!236688 (or (= lt!372151 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!372151 #b0000000000000000000000000000000000000000000000000000000000001000) lt!372151)))))

(assert (=> b!236688 (= lt!372151 ((_ sign_extend 32) (size!5510 (buf!5985 (_2!10888 lt!371988)))))))

(assert (= (and d!79968 res!197832) b!236687))

(assert (= (and b!236687 res!197833) b!236688))

(declare-fun m!359279 () Bool)

(assert (=> d!79968 m!359279))

(declare-fun m!359281 () Bool)

(assert (=> d!79968 m!359281))

(assert (=> b!236615 d!79968))

(declare-fun d!79970 () Bool)

(declare-fun e!163652 () Bool)

(assert (=> d!79970 e!163652))

(declare-fun res!197834 () Bool)

(assert (=> d!79970 (=> (not res!197834) (not e!163652))))

(declare-fun lt!372156 () (_ BitVec 64))

(declare-fun lt!372154 () (_ BitVec 64))

(declare-fun lt!372158 () (_ BitVec 64))

(assert (=> d!79970 (= res!197834 (= lt!372154 (bvsub lt!372156 lt!372158)))))

(assert (=> d!79970 (or (= (bvand lt!372156 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!372158 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!372156 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!372156 lt!372158) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!79970 (= lt!372158 (remainingBits!0 ((_ sign_extend 32) (size!5510 (buf!5985 (_2!10889 lt!371957)))) ((_ sign_extend 32) (currentByte!11135 (_2!10889 lt!371957))) ((_ sign_extend 32) (currentBit!11130 (_2!10889 lt!371957)))))))

(declare-fun lt!372155 () (_ BitVec 64))

(declare-fun lt!372159 () (_ BitVec 64))

(assert (=> d!79970 (= lt!372156 (bvmul lt!372155 lt!372159))))

(assert (=> d!79970 (or (= lt!372155 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!372159 (bvsdiv (bvmul lt!372155 lt!372159) lt!372155)))))

(assert (=> d!79970 (= lt!372159 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!79970 (= lt!372155 ((_ sign_extend 32) (size!5510 (buf!5985 (_2!10889 lt!371957)))))))

(assert (=> d!79970 (= lt!372154 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11135 (_2!10889 lt!371957))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11130 (_2!10889 lt!371957)))))))

(assert (=> d!79970 (invariant!0 (currentBit!11130 (_2!10889 lt!371957)) (currentByte!11135 (_2!10889 lt!371957)) (size!5510 (buf!5985 (_2!10889 lt!371957))))))

(assert (=> d!79970 (= (bitIndex!0 (size!5510 (buf!5985 (_2!10889 lt!371957))) (currentByte!11135 (_2!10889 lt!371957)) (currentBit!11130 (_2!10889 lt!371957))) lt!372154)))

(declare-fun b!236689 () Bool)

(declare-fun res!197835 () Bool)

(assert (=> b!236689 (=> (not res!197835) (not e!163652))))

(assert (=> b!236689 (= res!197835 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!372154))))

(declare-fun b!236690 () Bool)

(declare-fun lt!372157 () (_ BitVec 64))

(assert (=> b!236690 (= e!163652 (bvsle lt!372154 (bvmul lt!372157 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!236690 (or (= lt!372157 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!372157 #b0000000000000000000000000000000000000000000000000000000000001000) lt!372157)))))

(assert (=> b!236690 (= lt!372157 ((_ sign_extend 32) (size!5510 (buf!5985 (_2!10889 lt!371957)))))))

(assert (= (and d!79970 res!197834) b!236689))

(assert (= (and b!236689 res!197835) b!236690))

(declare-fun m!359283 () Bool)

(assert (=> d!79970 m!359283))

(declare-fun m!359285 () Bool)

(assert (=> d!79970 m!359285))

(assert (=> b!236615 d!79970))

(declare-fun d!79972 () Bool)

(declare-fun e!163653 () Bool)

(assert (=> d!79972 e!163653))

(declare-fun res!197836 () Bool)

(assert (=> d!79972 (=> (not res!197836) (not e!163653))))

(assert (=> d!79972 (= res!197836 (= (buf!5985 (_2!10893 (increaseBitIndex!0 (_2!10889 lt!371957)))) (buf!5985 (_2!10889 lt!371957))))))

(declare-fun lt!372160 () Bool)

(assert (=> d!79972 (= lt!372160 (not (= (bvand ((_ sign_extend 24) (select (arr!6497 (buf!5985 (_2!10889 lt!371957))) (currentByte!11135 (_2!10889 lt!371957)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11130 (_2!10889 lt!371957))))) #b00000000000000000000000000000000)))))

(declare-fun lt!372164 () tuple2!19970)

(assert (=> d!79972 (= lt!372164 (tuple2!19971 (not (= (bvand ((_ sign_extend 24) (select (arr!6497 (buf!5985 (_2!10889 lt!371957))) (currentByte!11135 (_2!10889 lt!371957)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11130 (_2!10889 lt!371957))))) #b00000000000000000000000000000000)) (_2!10893 (increaseBitIndex!0 (_2!10889 lt!371957)))))))

(assert (=> d!79972 (validate_offset_bit!0 ((_ sign_extend 32) (size!5510 (buf!5985 (_2!10889 lt!371957)))) ((_ sign_extend 32) (currentByte!11135 (_2!10889 lt!371957))) ((_ sign_extend 32) (currentBit!11130 (_2!10889 lt!371957))))))

(assert (=> d!79972 (= (readBit!0 (_2!10889 lt!371957)) lt!372164)))

(declare-fun lt!372165 () (_ BitVec 64))

(declare-fun lt!372162 () (_ BitVec 64))

(declare-fun b!236691 () Bool)

(assert (=> b!236691 (= e!163653 (= (bitIndex!0 (size!5510 (buf!5985 (_2!10893 (increaseBitIndex!0 (_2!10889 lt!371957))))) (currentByte!11135 (_2!10893 (increaseBitIndex!0 (_2!10889 lt!371957)))) (currentBit!11130 (_2!10893 (increaseBitIndex!0 (_2!10889 lt!371957))))) (bvadd lt!372162 lt!372165)))))

(assert (=> b!236691 (or (not (= (bvand lt!372162 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!372165 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!372162 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!372162 lt!372165) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!236691 (= lt!372165 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!236691 (= lt!372162 (bitIndex!0 (size!5510 (buf!5985 (_2!10889 lt!371957))) (currentByte!11135 (_2!10889 lt!371957)) (currentBit!11130 (_2!10889 lt!371957))))))

(declare-fun lt!372161 () Bool)

(assert (=> b!236691 (= lt!372161 (not (= (bvand ((_ sign_extend 24) (select (arr!6497 (buf!5985 (_2!10889 lt!371957))) (currentByte!11135 (_2!10889 lt!371957)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11130 (_2!10889 lt!371957))))) #b00000000000000000000000000000000)))))

(declare-fun lt!372166 () Bool)

(assert (=> b!236691 (= lt!372166 (not (= (bvand ((_ sign_extend 24) (select (arr!6497 (buf!5985 (_2!10889 lt!371957))) (currentByte!11135 (_2!10889 lt!371957)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11130 (_2!10889 lt!371957))))) #b00000000000000000000000000000000)))))

(declare-fun lt!372163 () Bool)

(assert (=> b!236691 (= lt!372163 (not (= (bvand ((_ sign_extend 24) (select (arr!6497 (buf!5985 (_2!10889 lt!371957))) (currentByte!11135 (_2!10889 lt!371957)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11130 (_2!10889 lt!371957))))) #b00000000000000000000000000000000)))))

(assert (= (and d!79972 res!197836) b!236691))

(declare-fun m!359287 () Bool)

(assert (=> d!79972 m!359287))

(declare-fun m!359289 () Bool)

(assert (=> d!79972 m!359289))

(declare-fun m!359291 () Bool)

(assert (=> d!79972 m!359291))

(declare-fun m!359293 () Bool)

(assert (=> d!79972 m!359293))

(assert (=> b!236691 m!359287))

(assert (=> b!236691 m!359203))

(assert (=> b!236691 m!359289))

(assert (=> b!236691 m!359291))

(declare-fun m!359295 () Bool)

(assert (=> b!236691 m!359295))

(assert (=> b!236620 d!79972))

(declare-fun b!236692 () Bool)

(declare-fun res!197840 () Bool)

(declare-fun e!163655 () Bool)

(assert (=> b!236692 (=> (not res!197840) (not e!163655))))

(declare-fun lt!372173 () (_ BitVec 64))

(declare-fun lt!372174 () (_ BitVec 64))

(declare-fun lt!372172 () tuple2!19968)

(assert (=> b!236692 (= res!197840 (= (bitIndex!0 (size!5510 (buf!5985 (_2!10888 lt!372172))) (currentByte!11135 (_2!10888 lt!372172)) (currentBit!11130 (_2!10888 lt!372172))) (bvadd lt!372173 lt!372174)))))

(assert (=> b!236692 (or (not (= (bvand lt!372173 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!372174 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!372173 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!372173 lt!372174) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!236692 (= lt!372174 ((_ sign_extend 32) (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752 #b00000000000000000000000000000001))))))

(assert (=> b!236692 (or (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!752 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!236692 (= lt!372173 (bitIndex!0 (size!5510 (buf!5985 (_2!10889 lt!371984))) (currentByte!11135 (_2!10889 lt!371984)) (currentBit!11130 (_2!10889 lt!371984))))))

(declare-fun e!163656 () Bool)

(declare-fun lt!372171 () (_ BitVec 64))

(declare-fun b!236693 () Bool)

(assert (=> b!236693 (= e!163656 (= (= (bvand (bvlshr (_1!10888 lt!372172) lt!372171) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!10892 (readBitPure!0 (_2!10889 lt!371984)))))))

(assert (=> b!236693 (and (bvsge lt!372171 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!372171 #b0000000000000000000000000000000000000000000000000000000001000000))))

(declare-fun lt!372169 () (_ BitVec 32))

(assert (=> b!236693 (= lt!372171 ((_ sign_extend 32) (bvsub lt!372169 (bvadd #b00000000000000000000000000000001 i!752 #b00000000000000000000000000000001))))))

(assert (=> b!236693 (or (= (bvand lt!372169 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!752 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand lt!372169 #b10000000000000000000000000000000) (bvand (bvsub lt!372169 (bvadd #b00000000000000000000000000000001 i!752 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!236693 (= lt!372169 (bvsub nBits!581 #b00000000000000000000000000000001))))

(assert (=> b!236693 (or (= (bvand nBits!581 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))

(declare-fun b!236694 () Bool)

(assert (=> b!236694 (= e!163655 e!163656)))

(declare-fun res!197837 () Bool)

(assert (=> b!236694 (=> res!197837 e!163656)))

(assert (=> b!236694 (= res!197837 (bvsge (bvadd #b00000000000000000000000000000001 i!752 #b00000000000000000000000000000001) nBits!581))))

(declare-fun b!236695 () Bool)

(declare-fun res!197839 () Bool)

(assert (=> b!236695 (=> (not res!197839) (not e!163655))))

(declare-fun lt!372175 () (_ BitVec 64))

(declare-fun lt!372167 () (_ BitVec 64))

(assert (=> b!236695 (= res!197839 (= (bvlshr (_1!10888 lt!372172) lt!372167) (bvlshr (bvor (bvor acc!170 (ite (_1!10889 lt!371957) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite (_1!10889 lt!371984) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!752)))) #b0000000000000000000000000000000000000000000000000000000000000000)) lt!372175)))))

(assert (=> b!236695 (and (bvsge lt!372175 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!372175 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!236695 (= lt!372175 ((_ sign_extend 32) (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752 #b00000000000000000000000000000001))))))

(assert (=> b!236695 (or (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!752 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!236695 (and (bvsge lt!372167 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!372167 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!236695 (= lt!372167 ((_ sign_extend 32) (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752 #b00000000000000000000000000000001))))))

(assert (=> b!236695 (or (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!752 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(declare-fun b!236696 () Bool)

(declare-fun e!163654 () tuple2!19968)

(assert (=> b!236696 (= e!163654 (tuple2!19969 (bvor (bvor acc!170 (ite (_1!10889 lt!371957) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite (_1!10889 lt!371984) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!752)))) #b0000000000000000000000000000000000000000000000000000000000000000)) (_2!10889 lt!371984)))))

(declare-fun b!236697 () Bool)

(declare-fun lt!372170 () tuple2!19968)

(assert (=> b!236697 (= e!163654 (tuple2!19969 (_1!10888 lt!372170) (_2!10888 lt!372170)))))

(declare-fun lt!372168 () tuple2!19970)

(assert (=> b!236697 (= lt!372168 (readBit!0 (_2!10889 lt!371984)))))

(assert (=> b!236697 (= lt!372170 (readNLeastSignificantBitsLoop!0 (_2!10889 lt!372168) nBits!581 (bvadd #b00000000000000000000000000000001 i!752 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvor (bvor (bvor acc!170 (ite (_1!10889 lt!371957) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite (_1!10889 lt!371984) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!752)))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite (_1!10889 lt!372168) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!752 #b00000000000000000000000000000001)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!236698 () Bool)

(declare-fun res!197838 () Bool)

(assert (=> b!236698 (=> (not res!197838) (not e!163655))))

(assert (=> b!236698 (= res!197838 (= (bvand (_1!10888 lt!372172) (onesLSBLong!0 nBits!581)) (_1!10888 lt!372172)))))

(declare-fun d!79974 () Bool)

(assert (=> d!79974 e!163655))

(declare-fun res!197841 () Bool)

(assert (=> d!79974 (=> (not res!197841) (not e!163655))))

(assert (=> d!79974 (= res!197841 (= (buf!5985 (_2!10888 lt!372172)) (buf!5985 (_2!10889 lt!371984))))))

(assert (=> d!79974 (= lt!372172 e!163654)))

(declare-fun c!11330 () Bool)

(assert (=> d!79974 (= c!11330 (= nBits!581 (bvadd #b00000000000000000000000000000001 i!752 #b00000000000000000000000000000001)))))

(assert (=> d!79974 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!752 #b00000000000000000000000000000001)) (bvsle (bvadd #b00000000000000000000000000000001 i!752 #b00000000000000000000000000000001) nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000))))

(assert (=> d!79974 (= (readNLeastSignificantBitsLoop!0 (_2!10889 lt!371984) nBits!581 (bvadd #b00000000000000000000000000000001 i!752 #b00000000000000000000000000000001) (bvor (bvor acc!170 (ite (_1!10889 lt!371957) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite (_1!10889 lt!371984) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!752)))) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!372172)))

(assert (= (and d!79974 c!11330) b!236696))

(assert (= (and d!79974 (not c!11330)) b!236697))

(assert (= (and d!79974 res!197841) b!236692))

(assert (= (and b!236692 res!197840) b!236695))

(assert (= (and b!236695 res!197839) b!236698))

(assert (= (and b!236698 res!197838) b!236694))

(assert (= (and b!236694 (not res!197837)) b!236693))

(declare-fun m!359297 () Bool)

(assert (=> b!236692 m!359297))

(declare-fun m!359299 () Bool)

(assert (=> b!236692 m!359299))

(declare-fun m!359301 () Bool)

(assert (=> b!236693 m!359301))

(declare-fun m!359303 () Bool)

(assert (=> b!236697 m!359303))

(declare-fun m!359305 () Bool)

(assert (=> b!236697 m!359305))

(assert (=> b!236698 m!359169))

(assert (=> b!236620 d!79974))

(declare-fun d!79976 () Bool)

(assert (=> d!79976 (= (invariant!0 (currentBit!11130 thiss!1830) (currentByte!11135 thiss!1830) (size!5510 (buf!5985 thiss!1830))) (and (bvsge (currentBit!11130 thiss!1830) #b00000000000000000000000000000000) (bvslt (currentBit!11130 thiss!1830) #b00000000000000000000000000001000) (bvsge (currentByte!11135 thiss!1830) #b00000000000000000000000000000000) (or (bvslt (currentByte!11135 thiss!1830) (size!5510 (buf!5985 thiss!1830))) (and (= (currentBit!11130 thiss!1830) #b00000000000000000000000000000000) (= (currentByte!11135 thiss!1830) (size!5510 (buf!5985 thiss!1830)))))))))

(assert (=> d!79916 d!79976))

(declare-fun d!79978 () Bool)

(assert (=> d!79978 (= (remainingBits!0 ((_ sign_extend 32) (size!5510 (buf!5985 thiss!1830))) ((_ sign_extend 32) (currentByte!11135 thiss!1830)) ((_ sign_extend 32) (currentBit!11130 thiss!1830))) (bvsub (bvmul ((_ sign_extend 32) (size!5510 (buf!5985 thiss!1830))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11135 thiss!1830)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11130 thiss!1830)))))))

(assert (=> d!79942 d!79978))

(declare-fun d!79980 () Bool)

(declare-fun lt!372178 () tuple2!19970)

(assert (=> d!79980 (= lt!372178 (readBit!0 (_2!10889 lt!371957)))))

(assert (=> d!79980 (= (readBitPure!0 (_2!10889 lt!371957)) (tuple2!19977 (_2!10889 lt!372178) (_1!10889 lt!372178)))))

(declare-fun bs!19959 () Bool)

(assert (= bs!19959 d!79980))

(assert (=> bs!19959 m!359207))

(assert (=> b!236616 d!79980))

(assert (=> b!236621 d!79946))

(check-sat (not d!79968) (not b!236677) (not d!79980) (not d!79972) (not b!236698) (not b!236692) (not b!236693) (not b!236697) (not d!79960) (not d!79966) (not d!79970) (not d!79962) (not d!79964) (not b!236691))
