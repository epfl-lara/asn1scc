; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50850 () Bool)

(assert start!50850)

(declare-fun b!238154 () Bool)

(declare-fun res!199063 () Bool)

(declare-fun e!164516 () Bool)

(assert (=> b!238154 (=> (not res!199063) (not e!164516))))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun i!752 () (_ BitVec 32))

(assert (=> b!238154 (= res!199063 (not (= nBits!581 i!752)))))

(declare-fun b!238155 () Bool)

(declare-fun res!199062 () Bool)

(assert (=> b!238155 (=> (not res!199062) (not e!164516))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!238155 (= res!199062 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(declare-fun b!238156 () Bool)

(declare-fun e!164519 () Bool)

(assert (=> b!238156 (= e!164516 e!164519)))

(declare-fun res!199060 () Bool)

(assert (=> b!238156 (=> (not res!199060) (not e!164519))))

(declare-datatypes ((array!12695 0))(
  ( (array!12696 (arr!6564 (Array (_ BitVec 32) (_ BitVec 8))) (size!5577 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10118 0))(
  ( (BitStream!10119 (buf!6052 array!12695) (currentByte!11232 (_ BitVec 32)) (currentBit!11227 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!10118)

(declare-datatypes ((tuple2!20090 0))(
  ( (tuple2!20091 (_1!10949 Bool) (_2!10949 BitStream!10118)) )
))
(declare-fun lt!372993 () tuple2!20090)

(declare-datatypes ((tuple2!20092 0))(
  ( (tuple2!20093 (_1!10950 (_ BitVec 64)) (_2!10950 BitStream!10118)) )
))
(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!10118 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!20092)

(assert (=> b!238156 (= res!199060 (= (buf!6052 (_2!10950 (readNLeastSignificantBitsLoop!0 (_2!10949 lt!372993) nBits!581 (bvadd #b00000000000000000000000000000001 i!752) (bvor acc!170 (ite (_1!10949 lt!372993) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (buf!6052 thiss!1830)))))

(declare-fun readBit!0 (BitStream!10118) tuple2!20090)

(assert (=> b!238156 (= lt!372993 (readBit!0 thiss!1830))))

(declare-fun lt!372991 () (_ BitVec 64))

(declare-fun lt!372992 () (_ BitVec 64))

(declare-fun lt!372990 () (_ BitVec 64))

(declare-fun b!238157 () Bool)

(assert (=> b!238157 (= e!164519 (and (= lt!372992 (bvand lt!372990 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!372992 (bvand (bvadd lt!372991 lt!372990) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!238157 (= lt!372992 (bvand lt!372991 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!238157 (= lt!372991 (bitIndex!0 (size!5577 (buf!6052 thiss!1830)) (currentByte!11232 thiss!1830) (currentBit!11227 thiss!1830)))))

(declare-fun res!199065 () Bool)

(declare-fun e!164515 () Bool)

(assert (=> start!50850 (=> (not res!199065) (not e!164515))))

(assert (=> start!50850 (= res!199065 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50850 e!164515))

(assert (=> start!50850 true))

(declare-fun e!164517 () Bool)

(declare-fun inv!12 (BitStream!10118) Bool)

(assert (=> start!50850 (and (inv!12 thiss!1830) e!164517)))

(declare-fun b!238158 () Bool)

(declare-fun array_inv!5318 (array!12695) Bool)

(assert (=> b!238158 (= e!164517 (array_inv!5318 (buf!6052 thiss!1830)))))

(declare-fun b!238159 () Bool)

(assert (=> b!238159 (= e!164515 e!164516)))

(declare-fun res!199061 () Bool)

(assert (=> b!238159 (=> (not res!199061) (not e!164516))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!238159 (= res!199061 (validate_offset_bits!1 ((_ sign_extend 32) (size!5577 (buf!6052 thiss!1830))) ((_ sign_extend 32) (currentByte!11232 thiss!1830)) ((_ sign_extend 32) (currentBit!11227 thiss!1830)) lt!372990))))

(assert (=> b!238159 (= lt!372990 ((_ sign_extend 32) (bvsub nBits!581 i!752)))))

(declare-fun b!238160 () Bool)

(declare-fun res!199064 () Bool)

(assert (=> b!238160 (=> (not res!199064) (not e!164516))))

(assert (=> b!238160 (= res!199064 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!50850 res!199065) b!238159))

(assert (= (and b!238159 res!199061) b!238160))

(assert (= (and b!238160 res!199064) b!238155))

(assert (= (and b!238155 res!199062) b!238154))

(assert (= (and b!238154 res!199063) b!238156))

(assert (= (and b!238156 res!199060) b!238157))

(assert (= start!50850 b!238158))

(declare-fun m!360359 () Bool)

(assert (=> b!238157 m!360359))

(declare-fun m!360361 () Bool)

(assert (=> b!238158 m!360361))

(declare-fun m!360363 () Bool)

(assert (=> b!238155 m!360363))

(declare-fun m!360365 () Bool)

(assert (=> b!238156 m!360365))

(declare-fun m!360367 () Bool)

(assert (=> b!238156 m!360367))

(declare-fun m!360369 () Bool)

(assert (=> start!50850 m!360369))

(declare-fun m!360371 () Bool)

(assert (=> b!238160 m!360371))

(declare-fun m!360373 () Bool)

(assert (=> b!238159 m!360373))

(push 1)

(assert (not b!238156))

(assert (not b!238160))

(assert (not b!238155))

(assert (not start!50850))

(assert (not b!238157))

(assert (not b!238159))

(assert (not b!238158))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!80184 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!80184 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5577 (buf!6052 thiss!1830))) ((_ sign_extend 32) (currentByte!11232 thiss!1830)) ((_ sign_extend 32) (currentBit!11227 thiss!1830)) lt!372990) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5577 (buf!6052 thiss!1830))) ((_ sign_extend 32) (currentByte!11232 thiss!1830)) ((_ sign_extend 32) (currentBit!11227 thiss!1830))) lt!372990))))

(declare-fun bs!20048 () Bool)

(assert (= bs!20048 d!80184))

(declare-fun m!360375 () Bool)

(assert (=> bs!20048 m!360375))

(assert (=> b!238159 d!80184))

(declare-fun d!80186 () Bool)

(assert (=> d!80186 (= (onesLSBLong!0 (bvsub nBits!581 i!752)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!581 i!752)))))))

(assert (=> b!238160 d!80186))

(declare-fun d!80188 () Bool)

(assert (=> d!80188 (= (onesLSBLong!0 nBits!581) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!581))))))

(assert (=> b!238155 d!80188))

(declare-fun b!238205 () Bool)

(declare-fun res!199101 () Bool)

(declare-fun e!164546 () Bool)

(assert (=> b!238205 (=> (not res!199101) (not e!164546))))

(declare-fun lt!373080 () tuple2!20092)

(declare-fun lt!373081 () (_ BitVec 64))

(declare-fun lt!373084 () (_ BitVec 64))

(assert (=> b!238205 (= res!199101 (= (bitIndex!0 (size!5577 (buf!6052 (_2!10950 lt!373080))) (currentByte!11232 (_2!10950 lt!373080)) (currentBit!11227 (_2!10950 lt!373080))) (bvadd lt!373081 lt!373084)))))

(assert (=> b!238205 (or (not (= (bvand lt!373081 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!373084 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!373081 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!373081 lt!373084) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!238205 (= lt!373084 ((_ sign_extend 32) (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752))))))

(assert (=> b!238205 (or (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!752) #b10000000000000000000000000000000)) (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752)) #b10000000000000000000000000000000)))))

(assert (=> b!238205 (= lt!373081 (bitIndex!0 (size!5577 (buf!6052 (_2!10949 lt!372993))) (currentByte!11232 (_2!10949 lt!372993)) (currentBit!11227 (_2!10949 lt!372993))))))

(declare-fun b!238206 () Bool)

(declare-fun e!164545 () tuple2!20092)

(assert (=> b!238206 (= e!164545 (tuple2!20093 (bvor acc!170 (ite (_1!10949 lt!372993) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000)) (_2!10949 lt!372993)))))

(declare-fun b!238207 () Bool)

(declare-fun e!164547 () Bool)

(assert (=> b!238207 (= e!164546 e!164547)))

(declare-fun res!199100 () Bool)

(assert (=> b!238207 (=> res!199100 e!164547)))

(assert (=> b!238207 (= res!199100 (bvsge (bvadd #b00000000000000000000000000000001 i!752) nBits!581))))

(declare-fun b!238208 () Bool)

(declare-fun res!199102 () Bool)

(assert (=> b!238208 (=> (not res!199102) (not e!164546))))

(assert (=> b!238208 (= res!199102 (= (bvand (_1!10950 lt!373080) (onesLSBLong!0 nBits!581)) (_1!10950 lt!373080)))))

(declare-fun d!80190 () Bool)

(assert (=> d!80190 e!164546))

(declare-fun res!199104 () Bool)

(assert (=> d!80190 (=> (not res!199104) (not e!164546))))

(assert (=> d!80190 (= res!199104 (= (buf!6052 (_2!10950 lt!373080)) (buf!6052 (_2!10949 lt!372993))))))

(assert (=> d!80190 (= lt!373080 e!164545)))

(declare-fun c!11356 () Bool)

(assert (=> d!80190 (= c!11356 (= nBits!581 (bvadd #b00000000000000000000000000000001 i!752)))))

(assert (=> d!80190 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!752)) (bvsle (bvadd #b00000000000000000000000000000001 i!752) nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000))))

(assert (=> d!80190 (= (readNLeastSignificantBitsLoop!0 (_2!10949 lt!372993) nBits!581 (bvadd #b00000000000000000000000000000001 i!752) (bvor acc!170 (ite (_1!10949 lt!372993) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!373080)))

(declare-fun b!238209 () Bool)

(declare-fun lt!373086 () tuple2!20092)

(assert (=> b!238209 (= e!164545 (tuple2!20093 (_1!10950 lt!373086) (_2!10950 lt!373086)))))

(declare-fun lt!373082 () tuple2!20090)

(assert (=> b!238209 (= lt!373082 (readBit!0 (_2!10949 lt!372993)))))

(assert (=> b!238209 (= lt!373086 (readNLeastSignificantBitsLoop!0 (_2!10949 lt!373082) nBits!581 (bvadd #b00000000000000000000000000000001 i!752 #b00000000000000000000000000000001) (bvor (bvor acc!170 (ite (_1!10949 lt!372993) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite (_1!10949 lt!373082) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!752)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!238210 () Bool)

(declare-fun res!199103 () Bool)

(assert (=> b!238210 (=> (not res!199103) (not e!164546))))

(declare-fun lt!373079 () (_ BitVec 64))

(declare-fun lt!373085 () (_ BitVec 64))

(assert (=> b!238210 (= res!199103 (= (bvlshr (_1!10950 lt!373080) lt!373085) (bvlshr (bvor acc!170 (ite (_1!10949 lt!372993) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000)) lt!373079)))))

(assert (=> b!238210 (and (bvsge lt!373079 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!373079 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!238210 (= lt!373079 ((_ sign_extend 32) (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752))))))

(assert (=> b!238210 (or (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!752) #b10000000000000000000000000000000)) (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752)) #b10000000000000000000000000000000)))))

(assert (=> b!238210 (and (bvsge lt!373085 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!373085 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!238210 (= lt!373085 ((_ sign_extend 32) (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752))))))

(assert (=> b!238210 (or (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!752) #b10000000000000000000000000000000)) (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752)) #b10000000000000000000000000000000)))))

(declare-fun lt!373078 () (_ BitVec 64))

(declare-fun b!238211 () Bool)

(declare-datatypes ((tuple2!20098 0))(
  ( (tuple2!20099 (_1!10953 BitStream!10118) (_2!10953 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!10118) tuple2!20098)

(assert (=> b!238211 (= e!164547 (= (= (bvand (bvlshr (_1!10950 lt!373080) lt!373078) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!10953 (readBitPure!0 (_2!10949 lt!372993)))))))

(assert (=> b!238211 (and (bvsge lt!373078 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!373078 #b0000000000000000000000000000000000000000000000000000000001000000))))

(declare-fun lt!373083 () (_ BitVec 32))

(assert (=> b!238211 (= lt!373078 ((_ sign_extend 32) (bvsub lt!373083 (bvadd #b00000000000000000000000000000001 i!752))))))

(assert (=> b!238211 (or (= (bvand lt!373083 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!752) #b10000000000000000000000000000000)) (= (bvand lt!373083 #b10000000000000000000000000000000) (bvand (bvsub lt!373083 (bvadd #b00000000000000000000000000000001 i!752)) #b10000000000000000000000000000000)))))

(assert (=> b!238211 (= lt!373083 (bvsub nBits!581 #b00000000000000000000000000000001))))

(assert (=> b!238211 (or (= (bvand nBits!581 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))

(assert (= (and d!80190 c!11356) b!238206))

(assert (= (and d!80190 (not c!11356)) b!238209))

(assert (= (and d!80190 res!199104) b!238205))

(assert (= (and b!238205 res!199101) b!238210))

(assert (= (and b!238210 res!199103) b!238208))

(assert (= (and b!238208 res!199102) b!238207))

(assert (= (and b!238207 (not res!199100)) b!238211))

(declare-fun m!360403 () Bool)

(assert (=> b!238205 m!360403))

(declare-fun m!360405 () Bool)

(assert (=> b!238205 m!360405))

(assert (=> b!238208 m!360363))

(declare-fun m!360407 () Bool)

(assert (=> b!238209 m!360407))

(declare-fun m!360409 () Bool)

(assert (=> b!238209 m!360409))

(declare-fun m!360411 () Bool)

(assert (=> b!238211 m!360411))

(assert (=> b!238156 d!80190))

(declare-fun d!80212 () Bool)

(declare-fun e!164557 () Bool)

(assert (=> d!80212 e!164557))

(declare-fun res!199113 () Bool)

(assert (=> d!80212 (=> (not res!199113) (not e!164557))))

(declare-datatypes ((Unit!17397 0))(
  ( (Unit!17398) )
))
(declare-datatypes ((tuple2!20100 0))(
  ( (tuple2!20101 (_1!10954 Unit!17397) (_2!10954 BitStream!10118)) )
))
(declare-fun increaseBitIndex!0 (BitStream!10118) tuple2!20100)

(assert (=> d!80212 (= res!199113 (= (buf!6052 (_2!10954 (increaseBitIndex!0 thiss!1830))) (buf!6052 thiss!1830)))))

(declare-fun lt!373124 () Bool)

(assert (=> d!80212 (= lt!373124 (not (= (bvand ((_ sign_extend 24) (select (arr!6564 (buf!6052 thiss!1830)) (currentByte!11232 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11227 thiss!1830)))) #b00000000000000000000000000000000)))))

(declare-fun lt!373119 () tuple2!20090)

(assert (=> d!80212 (= lt!373119 (tuple2!20091 (not (= (bvand ((_ sign_extend 24) (select (arr!6564 (buf!6052 thiss!1830)) (currentByte!11232 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11227 thiss!1830)))) #b00000000000000000000000000000000)) (_2!10954 (increaseBitIndex!0 thiss!1830))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!80212 (validate_offset_bit!0 ((_ sign_extend 32) (size!5577 (buf!6052 thiss!1830))) ((_ sign_extend 32) (currentByte!11232 thiss!1830)) ((_ sign_extend 32) (currentBit!11227 thiss!1830)))))

(assert (=> d!80212 (= (readBit!0 thiss!1830) lt!373119)))

(declare-fun lt!373125 () (_ BitVec 64))

(declare-fun b!238220 () Bool)

(declare-fun lt!373120 () (_ BitVec 64))

(assert (=> b!238220 (= e!164557 (= (bitIndex!0 (size!5577 (buf!6052 (_2!10954 (increaseBitIndex!0 thiss!1830)))) (currentByte!11232 (_2!10954 (increaseBitIndex!0 thiss!1830))) (currentBit!11227 (_2!10954 (increaseBitIndex!0 thiss!1830)))) (bvadd lt!373125 lt!373120)))))

(assert (=> b!238220 (or (not (= (bvand lt!373125 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!373120 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!373125 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!373125 lt!373120) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!238220 (= lt!373120 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!238220 (= lt!373125 (bitIndex!0 (size!5577 (buf!6052 thiss!1830)) (currentByte!11232 thiss!1830) (currentBit!11227 thiss!1830)))))

(declare-fun lt!373123 () Bool)

(assert (=> b!238220 (= lt!373123 (not (= (bvand ((_ sign_extend 24) (select (arr!6564 (buf!6052 thiss!1830)) (currentByte!11232 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11227 thiss!1830)))) #b00000000000000000000000000000000)))))

(declare-fun lt!373122 () Bool)

(assert (=> b!238220 (= lt!373122 (not (= (bvand ((_ sign_extend 24) (select (arr!6564 (buf!6052 thiss!1830)) (currentByte!11232 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11227 thiss!1830)))) #b00000000000000000000000000000000)))))

(declare-fun lt!373121 () Bool)

(assert (=> b!238220 (= lt!373121 (not (= (bvand ((_ sign_extend 24) (select (arr!6564 (buf!6052 thiss!1830)) (currentByte!11232 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11227 thiss!1830)))) #b00000000000000000000000000000000)))))

(assert (= (and d!80212 res!199113) b!238220))

(declare-fun m!360415 () Bool)

(assert (=> d!80212 m!360415))

(declare-fun m!360417 () Bool)

(assert (=> d!80212 m!360417))

(declare-fun m!360419 () Bool)

(assert (=> d!80212 m!360419))

(declare-fun m!360421 () Bool)

(assert (=> d!80212 m!360421))

(assert (=> b!238220 m!360419))

(declare-fun m!360423 () Bool)

(assert (=> b!238220 m!360423))

(assert (=> b!238220 m!360415))

(assert (=> b!238220 m!360359))

(assert (=> b!238220 m!360417))

(assert (=> b!238156 d!80212))

(declare-fun d!80218 () Bool)

(declare-fun e!164560 () Bool)

(assert (=> d!80218 e!164560))

(declare-fun res!199118 () Bool)

(assert (=> d!80218 (=> (not res!199118) (not e!164560))))

(declare-fun lt!373139 () (_ BitVec 64))

(declare-fun lt!373141 () (_ BitVec 64))

(declare-fun lt!373143 () (_ BitVec 64))

(assert (=> d!80218 (= res!199118 (= lt!373139 (bvsub lt!373141 lt!373143)))))

(assert (=> d!80218 (or (= (bvand lt!373141 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!373143 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!373141 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!373141 lt!373143) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!80218 (= lt!373143 (remainingBits!0 ((_ sign_extend 32) (size!5577 (buf!6052 thiss!1830))) ((_ sign_extend 32) (currentByte!11232 thiss!1830)) ((_ sign_extend 32) (currentBit!11227 thiss!1830))))))

(declare-fun lt!373142 () (_ BitVec 64))

(declare-fun lt!373138 () (_ BitVec 64))

(assert (=> d!80218 (= lt!373141 (bvmul lt!373142 lt!373138))))

(assert (=> d!80218 (or (= lt!373142 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!373138 (bvsdiv (bvmul lt!373142 lt!373138) lt!373142)))))

(assert (=> d!80218 (= lt!373138 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!80218 (= lt!373142 ((_ sign_extend 32) (size!5577 (buf!6052 thiss!1830))))))

(assert (=> d!80218 (= lt!373139 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11232 thiss!1830)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11227 thiss!1830))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!80218 (invariant!0 (currentBit!11227 thiss!1830) (currentByte!11232 thiss!1830) (size!5577 (buf!6052 thiss!1830)))))

(assert (=> d!80218 (= (bitIndex!0 (size!5577 (buf!6052 thiss!1830)) (currentByte!11232 thiss!1830) (currentBit!11227 thiss!1830)) lt!373139)))

(declare-fun b!238225 () Bool)

(declare-fun res!199119 () Bool)

(assert (=> b!238225 (=> (not res!199119) (not e!164560))))

(assert (=> b!238225 (= res!199119 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!373139))))

(declare-fun b!238226 () Bool)

(declare-fun lt!373140 () (_ BitVec 64))

(assert (=> b!238226 (= e!164560 (bvsle lt!373139 (bvmul lt!373140 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!238226 (or (= lt!373140 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!373140 #b0000000000000000000000000000000000000000000000000000000000001000) lt!373140)))))

(assert (=> b!238226 (= lt!373140 ((_ sign_extend 32) (size!5577 (buf!6052 thiss!1830))))))

(assert (= (and d!80218 res!199118) b!238225))

(assert (= (and b!238225 res!199119) b!238226))

(assert (=> d!80218 m!360375))

(declare-fun m!360425 () Bool)

(assert (=> d!80218 m!360425))

(assert (=> b!238157 d!80218))

(declare-fun d!80220 () Bool)

(assert (=> d!80220 (= (inv!12 thiss!1830) (invariant!0 (currentBit!11227 thiss!1830) (currentByte!11232 thiss!1830) (size!5577 (buf!6052 thiss!1830))))))

(declare-fun bs!20053 () Bool)

(assert (= bs!20053 d!80220))

(assert (=> bs!20053 m!360425))

(assert (=> start!50850 d!80220))

(declare-fun d!80222 () Bool)

(assert (=> d!80222 (= (array_inv!5318 (buf!6052 thiss!1830)) (bvsge (size!5577 (buf!6052 thiss!1830)) #b00000000000000000000000000000000))))

(assert (=> b!238158 d!80222))

(push 1)

(assert (not b!238220))

(assert (not d!80212))

(assert (not d!80218))

(assert (not d!80220))

(assert (not b!238211))

(assert (not b!238209))

(assert (not b!238208))

(assert (not b!238205))

(assert (not d!80184))

(check-sat)

(pop 1)

(push 1)

(check-sat)

