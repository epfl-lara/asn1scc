; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50848 () Bool)

(assert start!50848)

(declare-fun b!238133 () Bool)

(declare-fun res!199043 () Bool)

(declare-fun e!164502 () Bool)

(assert (=> b!238133 (=> (not res!199043) (not e!164502))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun i!752 () (_ BitVec 32))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!238133 (= res!199043 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!238134 () Bool)

(declare-fun res!199046 () Bool)

(assert (=> b!238134 (=> (not res!199046) (not e!164502))))

(assert (=> b!238134 (= res!199046 (not (= nBits!581 i!752)))))

(declare-fun b!238135 () Bool)

(declare-fun e!164501 () Bool)

(assert (=> b!238135 (= e!164501 e!164502)))

(declare-fun res!199044 () Bool)

(assert (=> b!238135 (=> (not res!199044) (not e!164502))))

(declare-datatypes ((array!12693 0))(
  ( (array!12694 (arr!6563 (Array (_ BitVec 32) (_ BitVec 8))) (size!5576 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10116 0))(
  ( (BitStream!10117 (buf!6051 array!12693) (currentByte!11231 (_ BitVec 32)) (currentBit!11226 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!10116)

(declare-fun lt!372980 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!238135 (= res!199044 (validate_offset_bits!1 ((_ sign_extend 32) (size!5576 (buf!6051 thiss!1830))) ((_ sign_extend 32) (currentByte!11231 thiss!1830)) ((_ sign_extend 32) (currentBit!11226 thiss!1830)) lt!372980))))

(assert (=> b!238135 (= lt!372980 ((_ sign_extend 32) (bvsub nBits!581 i!752)))))

(declare-fun e!164504 () Bool)

(declare-fun lt!372978 () (_ BitVec 64))

(declare-fun b!238136 () Bool)

(declare-fun lt!372979 () (_ BitVec 64))

(assert (=> b!238136 (= e!164504 (and (= lt!372979 (bvand lt!372980 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!372979 (bvand (bvadd lt!372978 lt!372980) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!238136 (= lt!372979 (bvand lt!372978 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!238136 (= lt!372978 (bitIndex!0 (size!5576 (buf!6051 thiss!1830)) (currentByte!11231 thiss!1830) (currentBit!11226 thiss!1830)))))

(declare-fun b!238137 () Bool)

(declare-fun e!164503 () Bool)

(declare-fun array_inv!5317 (array!12693) Bool)

(assert (=> b!238137 (= e!164503 (array_inv!5317 (buf!6051 thiss!1830)))))

(declare-fun b!238139 () Bool)

(declare-fun res!199045 () Bool)

(assert (=> b!238139 (=> (not res!199045) (not e!164502))))

(assert (=> b!238139 (= res!199045 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(declare-fun b!238138 () Bool)

(assert (=> b!238138 (= e!164502 e!164504)))

(declare-fun res!199042 () Bool)

(assert (=> b!238138 (=> (not res!199042) (not e!164504))))

(declare-datatypes ((tuple2!20086 0))(
  ( (tuple2!20087 (_1!10947 Bool) (_2!10947 BitStream!10116)) )
))
(declare-fun lt!372981 () tuple2!20086)

(declare-datatypes ((tuple2!20088 0))(
  ( (tuple2!20089 (_1!10948 (_ BitVec 64)) (_2!10948 BitStream!10116)) )
))
(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!10116 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!20088)

(assert (=> b!238138 (= res!199042 (= (buf!6051 (_2!10948 (readNLeastSignificantBitsLoop!0 (_2!10947 lt!372981) nBits!581 (bvadd #b00000000000000000000000000000001 i!752) (bvor acc!170 (ite (_1!10947 lt!372981) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (buf!6051 thiss!1830)))))

(declare-fun readBit!0 (BitStream!10116) tuple2!20086)

(assert (=> b!238138 (= lt!372981 (readBit!0 thiss!1830))))

(declare-fun res!199047 () Bool)

(assert (=> start!50848 (=> (not res!199047) (not e!164501))))

(assert (=> start!50848 (= res!199047 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50848 e!164501))

(assert (=> start!50848 true))

(declare-fun inv!12 (BitStream!10116) Bool)

(assert (=> start!50848 (and (inv!12 thiss!1830) e!164503)))

(assert (= (and start!50848 res!199047) b!238135))

(assert (= (and b!238135 res!199044) b!238133))

(assert (= (and b!238133 res!199043) b!238139))

(assert (= (and b!238139 res!199045) b!238134))

(assert (= (and b!238134 res!199046) b!238138))

(assert (= (and b!238138 res!199042) b!238136))

(assert (= start!50848 b!238137))

(declare-fun m!360343 () Bool)

(assert (=> b!238137 m!360343))

(declare-fun m!360345 () Bool)

(assert (=> b!238139 m!360345))

(declare-fun m!360347 () Bool)

(assert (=> b!238138 m!360347))

(declare-fun m!360349 () Bool)

(assert (=> b!238138 m!360349))

(declare-fun m!360351 () Bool)

(assert (=> b!238135 m!360351))

(declare-fun m!360353 () Bool)

(assert (=> start!50848 m!360353))

(declare-fun m!360355 () Bool)

(assert (=> b!238133 m!360355))

(declare-fun m!360357 () Bool)

(assert (=> b!238136 m!360357))

(check-sat (not b!238139) (not start!50848) (not b!238136) (not b!238135) (not b!238137) (not b!238133) (not b!238138))
(check-sat)
(get-model)

(declare-fun d!80180 () Bool)

(assert (=> d!80180 (= (onesLSBLong!0 (bvsub nBits!581 i!752)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!581 i!752)))))))

(assert (=> b!238133 d!80180))

(declare-fun b!238175 () Bool)

(declare-fun res!199079 () Bool)

(declare-fun e!164526 () Bool)

(assert (=> b!238175 (=> (not res!199079) (not e!164526))))

(declare-fun lt!373015 () tuple2!20088)

(assert (=> b!238175 (= res!199079 (= (bvand (_1!10948 lt!373015) (onesLSBLong!0 nBits!581)) (_1!10948 lt!373015)))))

(declare-fun d!80182 () Bool)

(assert (=> d!80182 e!164526))

(declare-fun res!199077 () Bool)

(assert (=> d!80182 (=> (not res!199077) (not e!164526))))

(assert (=> d!80182 (= res!199077 (= (buf!6051 (_2!10948 lt!373015)) (buf!6051 (_2!10947 lt!372981))))))

(declare-fun e!164528 () tuple2!20088)

(assert (=> d!80182 (= lt!373015 e!164528)))

(declare-fun c!11353 () Bool)

(assert (=> d!80182 (= c!11353 (= nBits!581 (bvadd #b00000000000000000000000000000001 i!752)))))

(assert (=> d!80182 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!752)) (bvsle (bvadd #b00000000000000000000000000000001 i!752) nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000))))

(assert (=> d!80182 (= (readNLeastSignificantBitsLoop!0 (_2!10947 lt!372981) nBits!581 (bvadd #b00000000000000000000000000000001 i!752) (bvor acc!170 (ite (_1!10947 lt!372981) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!373015)))

(declare-fun b!238176 () Bool)

(declare-fun res!199078 () Bool)

(assert (=> b!238176 (=> (not res!199078) (not e!164526))))

(declare-fun lt!373019 () (_ BitVec 64))

(declare-fun lt!373020 () (_ BitVec 64))

(assert (=> b!238176 (= res!199078 (= (bitIndex!0 (size!5576 (buf!6051 (_2!10948 lt!373015))) (currentByte!11231 (_2!10948 lt!373015)) (currentBit!11226 (_2!10948 lt!373015))) (bvadd lt!373020 lt!373019)))))

(assert (=> b!238176 (or (not (= (bvand lt!373020 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!373019 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!373020 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!373020 lt!373019) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!238176 (= lt!373019 ((_ sign_extend 32) (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752))))))

(assert (=> b!238176 (or (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!752) #b10000000000000000000000000000000)) (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752)) #b10000000000000000000000000000000)))))

(assert (=> b!238176 (= lt!373020 (bitIndex!0 (size!5576 (buf!6051 (_2!10947 lt!372981))) (currentByte!11231 (_2!10947 lt!372981)) (currentBit!11226 (_2!10947 lt!372981))))))

(declare-fun b!238177 () Bool)

(declare-fun e!164527 () Bool)

(assert (=> b!238177 (= e!164526 e!164527)))

(declare-fun res!199076 () Bool)

(assert (=> b!238177 (=> res!199076 e!164527)))

(assert (=> b!238177 (= res!199076 (bvsge (bvadd #b00000000000000000000000000000001 i!752) nBits!581))))

(declare-fun lt!373017 () (_ BitVec 64))

(declare-fun b!238178 () Bool)

(declare-datatypes ((tuple2!20094 0))(
  ( (tuple2!20095 (_1!10951 BitStream!10116) (_2!10951 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!10116) tuple2!20094)

(assert (=> b!238178 (= e!164527 (= (= (bvand (bvlshr (_1!10948 lt!373015) lt!373017) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!10951 (readBitPure!0 (_2!10947 lt!372981)))))))

(assert (=> b!238178 (and (bvsge lt!373017 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!373017 #b0000000000000000000000000000000000000000000000000000000001000000))))

(declare-fun lt!373018 () (_ BitVec 32))

(assert (=> b!238178 (= lt!373017 ((_ sign_extend 32) (bvsub lt!373018 (bvadd #b00000000000000000000000000000001 i!752))))))

(assert (=> b!238178 (or (= (bvand lt!373018 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!752) #b10000000000000000000000000000000)) (= (bvand lt!373018 #b10000000000000000000000000000000) (bvand (bvsub lt!373018 (bvadd #b00000000000000000000000000000001 i!752)) #b10000000000000000000000000000000)))))

(assert (=> b!238178 (= lt!373018 (bvsub nBits!581 #b00000000000000000000000000000001))))

(assert (=> b!238178 (or (= (bvand nBits!581 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))

(declare-fun b!238179 () Bool)

(declare-fun res!199080 () Bool)

(assert (=> b!238179 (=> (not res!199080) (not e!164526))))

(declare-fun lt!373014 () (_ BitVec 64))

(declare-fun lt!373013 () (_ BitVec 64))

(assert (=> b!238179 (= res!199080 (= (bvlshr (_1!10948 lt!373015) lt!373014) (bvlshr (bvor acc!170 (ite (_1!10947 lt!372981) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000)) lt!373013)))))

(assert (=> b!238179 (and (bvsge lt!373013 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!373013 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!238179 (= lt!373013 ((_ sign_extend 32) (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752))))))

(assert (=> b!238179 (or (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!752) #b10000000000000000000000000000000)) (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752)) #b10000000000000000000000000000000)))))

(assert (=> b!238179 (and (bvsge lt!373014 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!373014 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!238179 (= lt!373014 ((_ sign_extend 32) (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752))))))

(assert (=> b!238179 (or (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!752) #b10000000000000000000000000000000)) (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752)) #b10000000000000000000000000000000)))))

(declare-fun b!238180 () Bool)

(assert (=> b!238180 (= e!164528 (tuple2!20089 (bvor acc!170 (ite (_1!10947 lt!372981) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000)) (_2!10947 lt!372981)))))

(declare-fun b!238181 () Bool)

(declare-fun lt!373016 () tuple2!20088)

(assert (=> b!238181 (= e!164528 (tuple2!20089 (_1!10948 lt!373016) (_2!10948 lt!373016)))))

(declare-fun lt!373012 () tuple2!20086)

(assert (=> b!238181 (= lt!373012 (readBit!0 (_2!10947 lt!372981)))))

(assert (=> b!238181 (= lt!373016 (readNLeastSignificantBitsLoop!0 (_2!10947 lt!373012) nBits!581 (bvadd #b00000000000000000000000000000001 i!752 #b00000000000000000000000000000001) (bvor (bvor acc!170 (ite (_1!10947 lt!372981) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite (_1!10947 lt!373012) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!752)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!80182 c!11353) b!238180))

(assert (= (and d!80182 (not c!11353)) b!238181))

(assert (= (and d!80182 res!199077) b!238176))

(assert (= (and b!238176 res!199078) b!238179))

(assert (= (and b!238179 res!199080) b!238175))

(assert (= (and b!238175 res!199079) b!238177))

(assert (= (and b!238177 (not res!199076)) b!238178))

(assert (=> b!238175 m!360345))

(declare-fun m!360377 () Bool)

(assert (=> b!238176 m!360377))

(declare-fun m!360379 () Bool)

(assert (=> b!238176 m!360379))

(declare-fun m!360381 () Bool)

(assert (=> b!238178 m!360381))

(declare-fun m!360383 () Bool)

(assert (=> b!238181 m!360383))

(declare-fun m!360385 () Bool)

(assert (=> b!238181 m!360385))

(assert (=> b!238138 d!80182))

(declare-fun d!80194 () Bool)

(declare-fun e!164538 () Bool)

(assert (=> d!80194 e!164538))

(declare-fun res!199089 () Bool)

(assert (=> d!80194 (=> (not res!199089) (not e!164538))))

(declare-datatypes ((Unit!17395 0))(
  ( (Unit!17396) )
))
(declare-datatypes ((tuple2!20096 0))(
  ( (tuple2!20097 (_1!10952 Unit!17395) (_2!10952 BitStream!10116)) )
))
(declare-fun increaseBitIndex!0 (BitStream!10116) tuple2!20096)

(assert (=> d!80194 (= res!199089 (= (buf!6051 (_2!10952 (increaseBitIndex!0 thiss!1830))) (buf!6051 thiss!1830)))))

(declare-fun lt!373058 () Bool)

(assert (=> d!80194 (= lt!373058 (not (= (bvand ((_ sign_extend 24) (select (arr!6563 (buf!6051 thiss!1830)) (currentByte!11231 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11226 thiss!1830)))) #b00000000000000000000000000000000)))))

(declare-fun lt!373056 () tuple2!20086)

(assert (=> d!80194 (= lt!373056 (tuple2!20087 (not (= (bvand ((_ sign_extend 24) (select (arr!6563 (buf!6051 thiss!1830)) (currentByte!11231 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11226 thiss!1830)))) #b00000000000000000000000000000000)) (_2!10952 (increaseBitIndex!0 thiss!1830))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!80194 (validate_offset_bit!0 ((_ sign_extend 32) (size!5576 (buf!6051 thiss!1830))) ((_ sign_extend 32) (currentByte!11231 thiss!1830)) ((_ sign_extend 32) (currentBit!11226 thiss!1830)))))

(assert (=> d!80194 (= (readBit!0 thiss!1830) lt!373056)))

(declare-fun b!238190 () Bool)

(declare-fun lt!373054 () (_ BitVec 64))

(declare-fun lt!373053 () (_ BitVec 64))

(assert (=> b!238190 (= e!164538 (= (bitIndex!0 (size!5576 (buf!6051 (_2!10952 (increaseBitIndex!0 thiss!1830)))) (currentByte!11231 (_2!10952 (increaseBitIndex!0 thiss!1830))) (currentBit!11226 (_2!10952 (increaseBitIndex!0 thiss!1830)))) (bvadd lt!373053 lt!373054)))))

(assert (=> b!238190 (or (not (= (bvand lt!373053 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!373054 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!373053 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!373053 lt!373054) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!238190 (= lt!373054 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!238190 (= lt!373053 (bitIndex!0 (size!5576 (buf!6051 thiss!1830)) (currentByte!11231 thiss!1830) (currentBit!11226 thiss!1830)))))

(declare-fun lt!373055 () Bool)

(assert (=> b!238190 (= lt!373055 (not (= (bvand ((_ sign_extend 24) (select (arr!6563 (buf!6051 thiss!1830)) (currentByte!11231 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11226 thiss!1830)))) #b00000000000000000000000000000000)))))

(declare-fun lt!373057 () Bool)

(assert (=> b!238190 (= lt!373057 (not (= (bvand ((_ sign_extend 24) (select (arr!6563 (buf!6051 thiss!1830)) (currentByte!11231 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11226 thiss!1830)))) #b00000000000000000000000000000000)))))

(declare-fun lt!373059 () Bool)

(assert (=> b!238190 (= lt!373059 (not (= (bvand ((_ sign_extend 24) (select (arr!6563 (buf!6051 thiss!1830)) (currentByte!11231 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11226 thiss!1830)))) #b00000000000000000000000000000000)))))

(assert (= (and d!80194 res!199089) b!238190))

(declare-fun m!360391 () Bool)

(assert (=> d!80194 m!360391))

(declare-fun m!360393 () Bool)

(assert (=> d!80194 m!360393))

(declare-fun m!360395 () Bool)

(assert (=> d!80194 m!360395))

(declare-fun m!360397 () Bool)

(assert (=> d!80194 m!360397))

(assert (=> b!238190 m!360391))

(assert (=> b!238190 m!360395))

(declare-fun m!360399 () Bool)

(assert (=> b!238190 m!360399))

(assert (=> b!238190 m!360357))

(assert (=> b!238190 m!360393))

(assert (=> b!238138 d!80194))

(declare-fun d!80206 () Bool)

(assert (=> d!80206 (= (onesLSBLong!0 nBits!581) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!581))))))

(assert (=> b!238139 d!80206))

(declare-fun d!80208 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!80208 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5576 (buf!6051 thiss!1830))) ((_ sign_extend 32) (currentByte!11231 thiss!1830)) ((_ sign_extend 32) (currentBit!11226 thiss!1830)) lt!372980) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5576 (buf!6051 thiss!1830))) ((_ sign_extend 32) (currentByte!11231 thiss!1830)) ((_ sign_extend 32) (currentBit!11226 thiss!1830))) lt!372980))))

(declare-fun bs!20051 () Bool)

(assert (= bs!20051 d!80208))

(declare-fun m!360401 () Bool)

(assert (=> bs!20051 m!360401))

(assert (=> b!238135 d!80208))

(declare-fun d!80210 () Bool)

(declare-fun e!164550 () Bool)

(assert (=> d!80210 e!164550))

(declare-fun res!199110 () Bool)

(assert (=> d!80210 (=> (not res!199110) (not e!164550))))

(declare-fun lt!373099 () (_ BitVec 64))

(declare-fun lt!373102 () (_ BitVec 64))

(declare-fun lt!373104 () (_ BitVec 64))

(assert (=> d!80210 (= res!199110 (= lt!373102 (bvsub lt!373104 lt!373099)))))

(assert (=> d!80210 (or (= (bvand lt!373104 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!373099 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!373104 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!373104 lt!373099) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!80210 (= lt!373099 (remainingBits!0 ((_ sign_extend 32) (size!5576 (buf!6051 thiss!1830))) ((_ sign_extend 32) (currentByte!11231 thiss!1830)) ((_ sign_extend 32) (currentBit!11226 thiss!1830))))))

(declare-fun lt!373100 () (_ BitVec 64))

(declare-fun lt!373101 () (_ BitVec 64))

(assert (=> d!80210 (= lt!373104 (bvmul lt!373100 lt!373101))))

(assert (=> d!80210 (or (= lt!373100 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!373101 (bvsdiv (bvmul lt!373100 lt!373101) lt!373100)))))

(assert (=> d!80210 (= lt!373101 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!80210 (= lt!373100 ((_ sign_extend 32) (size!5576 (buf!6051 thiss!1830))))))

(assert (=> d!80210 (= lt!373102 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11231 thiss!1830)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11226 thiss!1830))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!80210 (invariant!0 (currentBit!11226 thiss!1830) (currentByte!11231 thiss!1830) (size!5576 (buf!6051 thiss!1830)))))

(assert (=> d!80210 (= (bitIndex!0 (size!5576 (buf!6051 thiss!1830)) (currentByte!11231 thiss!1830) (currentBit!11226 thiss!1830)) lt!373102)))

(declare-fun b!238216 () Bool)

(declare-fun res!199109 () Bool)

(assert (=> b!238216 (=> (not res!199109) (not e!164550))))

(assert (=> b!238216 (= res!199109 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!373102))))

(declare-fun b!238217 () Bool)

(declare-fun lt!373103 () (_ BitVec 64))

(assert (=> b!238217 (= e!164550 (bvsle lt!373102 (bvmul lt!373103 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!238217 (or (= lt!373103 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!373103 #b0000000000000000000000000000000000000000000000000000000000001000) lt!373103)))))

(assert (=> b!238217 (= lt!373103 ((_ sign_extend 32) (size!5576 (buf!6051 thiss!1830))))))

(assert (= (and d!80210 res!199110) b!238216))

(assert (= (and b!238216 res!199109) b!238217))

(assert (=> d!80210 m!360401))

(declare-fun m!360413 () Bool)

(assert (=> d!80210 m!360413))

(assert (=> b!238136 d!80210))

(declare-fun d!80214 () Bool)

(assert (=> d!80214 (= (array_inv!5317 (buf!6051 thiss!1830)) (bvsge (size!5576 (buf!6051 thiss!1830)) #b00000000000000000000000000000000))))

(assert (=> b!238137 d!80214))

(declare-fun d!80216 () Bool)

(assert (=> d!80216 (= (inv!12 thiss!1830) (invariant!0 (currentBit!11226 thiss!1830) (currentByte!11231 thiss!1830) (size!5576 (buf!6051 thiss!1830))))))

(declare-fun bs!20052 () Bool)

(assert (= bs!20052 d!80216))

(assert (=> bs!20052 m!360413))

(assert (=> start!50848 d!80216))

(check-sat (not b!238181) (not b!238190) (not b!238178) (not b!238176) (not b!238175) (not d!80208) (not d!80216) (not d!80194) (not d!80210))
