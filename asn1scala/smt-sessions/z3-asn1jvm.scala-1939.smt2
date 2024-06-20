; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50626 () Bool)

(assert start!50626)

(declare-fun b!236786 () Bool)

(declare-fun res!197923 () Bool)

(declare-fun e!163706 () Bool)

(assert (=> b!236786 (=> (not res!197923) (not e!163706))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!236786 (= res!197923 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(declare-fun b!236787 () Bool)

(declare-fun res!197924 () Bool)

(assert (=> b!236787 (=> (not res!197924) (not e!163706))))

(declare-fun i!752 () (_ BitVec 32))

(assert (=> b!236787 (= res!197924 (not (= nBits!581 i!752)))))

(declare-fun b!236788 () Bool)

(declare-fun e!163704 () Bool)

(declare-datatypes ((array!12561 0))(
  ( (array!12562 (arr!6500 (Array (_ BitVec 32) (_ BitVec 8))) (size!5513 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9990 0))(
  ( (BitStream!9991 (buf!5988 array!12561) (currentByte!11153 (_ BitVec 32)) (currentBit!11148 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!9990)

(declare-fun array_inv!5254 (array!12561) Bool)

(assert (=> b!236788 (= e!163704 (array_inv!5254 (buf!5988 thiss!1830)))))

(declare-fun b!236789 () Bool)

(declare-fun e!163703 () Bool)

(assert (=> b!236789 (= e!163706 e!163703)))

(declare-fun res!197922 () Bool)

(assert (=> b!236789 (=> (not res!197922) (not e!163703))))

(declare-datatypes ((tuple2!19992 0))(
  ( (tuple2!19993 (_1!10900 Bool) (_2!10900 BitStream!9990)) )
))
(declare-fun lt!372324 () tuple2!19992)

(declare-datatypes ((tuple2!19994 0))(
  ( (tuple2!19995 (_1!10901 (_ BitVec 64)) (_2!10901 BitStream!9990)) )
))
(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!9990 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!19994)

(assert (=> b!236789 (= res!197922 (= (buf!5988 (_2!10901 (readNLeastSignificantBitsLoop!0 (_2!10900 lt!372324) nBits!581 (bvadd #b00000000000000000000000000000001 i!752) (bvor acc!170 (ite (_1!10900 lt!372324) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (buf!5988 thiss!1830)))))

(declare-fun readBit!0 (BitStream!9990) tuple2!19992)

(assert (=> b!236789 (= lt!372324 (readBit!0 thiss!1830))))

(declare-fun res!197921 () Bool)

(assert (=> start!50626 (=> (not res!197921) (not e!163706))))

(assert (=> start!50626 (= res!197921 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50626 e!163706))

(assert (=> start!50626 true))

(declare-fun inv!12 (BitStream!9990) Bool)

(assert (=> start!50626 (and (inv!12 thiss!1830) e!163704)))

(declare-fun b!236790 () Bool)

(declare-fun res!197920 () Bool)

(assert (=> b!236790 (=> (not res!197920) (not e!163706))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!236790 (= res!197920 (validate_offset_bits!1 ((_ sign_extend 32) (size!5513 (buf!5988 thiss!1830))) ((_ sign_extend 32) (currentByte!11153 thiss!1830)) ((_ sign_extend 32) (currentBit!11148 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(declare-fun b!236791 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!236791 (= e!163703 (not (invariant!0 (currentBit!11148 thiss!1830) (currentByte!11153 thiss!1830) (size!5513 (buf!5988 thiss!1830)))))))

(declare-fun b!236792 () Bool)

(declare-fun res!197925 () Bool)

(assert (=> b!236792 (=> (not res!197925) (not e!163706))))

(assert (=> b!236792 (= res!197925 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!50626 res!197921) b!236790))

(assert (= (and b!236790 res!197920) b!236792))

(assert (= (and b!236792 res!197925) b!236786))

(assert (= (and b!236786 res!197923) b!236787))

(assert (= (and b!236787 res!197924) b!236789))

(assert (= (and b!236789 res!197922) b!236791))

(assert (= start!50626 b!236788))

(declare-fun m!359395 () Bool)

(assert (=> b!236790 m!359395))

(declare-fun m!359397 () Bool)

(assert (=> b!236789 m!359397))

(declare-fun m!359399 () Bool)

(assert (=> b!236789 m!359399))

(declare-fun m!359401 () Bool)

(assert (=> b!236791 m!359401))

(declare-fun m!359403 () Bool)

(assert (=> b!236786 m!359403))

(declare-fun m!359405 () Bool)

(assert (=> b!236788 m!359405))

(declare-fun m!359407 () Bool)

(assert (=> start!50626 m!359407))

(declare-fun m!359409 () Bool)

(assert (=> b!236792 m!359409))

(check-sat (not b!236786) (not start!50626) (not b!236790) (not b!236789) (not b!236791) (not b!236788) (not b!236792))
(check-sat)
(get-model)

(declare-fun d!80028 () Bool)

(assert (=> d!80028 (= (onesLSBLong!0 nBits!581) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!581))))))

(assert (=> b!236786 d!80028))

(declare-fun d!80030 () Bool)

(assert (=> d!80030 (= (inv!12 thiss!1830) (invariant!0 (currentBit!11148 thiss!1830) (currentByte!11153 thiss!1830) (size!5513 (buf!5988 thiss!1830))))))

(declare-fun bs!19967 () Bool)

(assert (= bs!19967 d!80030))

(assert (=> bs!19967 m!359401))

(assert (=> start!50626 d!80030))

(declare-fun d!80032 () Bool)

(assert (=> d!80032 (= (invariant!0 (currentBit!11148 thiss!1830) (currentByte!11153 thiss!1830) (size!5513 (buf!5988 thiss!1830))) (and (bvsge (currentBit!11148 thiss!1830) #b00000000000000000000000000000000) (bvslt (currentBit!11148 thiss!1830) #b00000000000000000000000000001000) (bvsge (currentByte!11153 thiss!1830) #b00000000000000000000000000000000) (or (bvslt (currentByte!11153 thiss!1830) (size!5513 (buf!5988 thiss!1830))) (and (= (currentBit!11148 thiss!1830) #b00000000000000000000000000000000) (= (currentByte!11153 thiss!1830) (size!5513 (buf!5988 thiss!1830)))))))))

(assert (=> b!236791 d!80032))

(declare-fun d!80034 () Bool)

(assert (=> d!80034 (= (onesLSBLong!0 (bvsub nBits!581 i!752)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!581 i!752)))))))

(assert (=> b!236792 d!80034))

(declare-fun b!236828 () Bool)

(declare-fun e!163726 () tuple2!19994)

(assert (=> b!236828 (= e!163726 (tuple2!19995 (bvor acc!170 (ite (_1!10900 lt!372324) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000)) (_2!10900 lt!372324)))))

(declare-fun b!236829 () Bool)

(declare-fun e!163725 () Bool)

(declare-fun e!163727 () Bool)

(assert (=> b!236829 (= e!163725 e!163727)))

(declare-fun res!197956 () Bool)

(assert (=> b!236829 (=> res!197956 e!163727)))

(assert (=> b!236829 (= res!197956 (bvsge (bvadd #b00000000000000000000000000000001 i!752) nBits!581))))

(declare-fun b!236830 () Bool)

(declare-fun lt!372353 () tuple2!19994)

(assert (=> b!236830 (= e!163726 (tuple2!19995 (_1!10901 lt!372353) (_2!10901 lt!372353)))))

(declare-fun lt!372347 () tuple2!19992)

(assert (=> b!236830 (= lt!372347 (readBit!0 (_2!10900 lt!372324)))))

(assert (=> b!236830 (= lt!372353 (readNLeastSignificantBitsLoop!0 (_2!10900 lt!372347) nBits!581 (bvadd #b00000000000000000000000000000001 i!752 #b00000000000000000000000000000001) (bvor (bvor acc!170 (ite (_1!10900 lt!372324) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite (_1!10900 lt!372347) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!752)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!80036 () Bool)

(assert (=> d!80036 e!163725))

(declare-fun res!197958 () Bool)

(assert (=> d!80036 (=> (not res!197958) (not e!163725))))

(declare-fun lt!372348 () tuple2!19994)

(assert (=> d!80036 (= res!197958 (= (buf!5988 (_2!10901 lt!372348)) (buf!5988 (_2!10900 lt!372324))))))

(assert (=> d!80036 (= lt!372348 e!163726)))

(declare-fun c!11335 () Bool)

(assert (=> d!80036 (= c!11335 (= nBits!581 (bvadd #b00000000000000000000000000000001 i!752)))))

(assert (=> d!80036 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!752)) (bvsle (bvadd #b00000000000000000000000000000001 i!752) nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000))))

(assert (=> d!80036 (= (readNLeastSignificantBitsLoop!0 (_2!10900 lt!372324) nBits!581 (bvadd #b00000000000000000000000000000001 i!752) (bvor acc!170 (ite (_1!10900 lt!372324) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!372348)))

(declare-fun b!236831 () Bool)

(declare-fun res!197957 () Bool)

(assert (=> b!236831 (=> (not res!197957) (not e!163725))))

(declare-fun lt!372346 () (_ BitVec 64))

(declare-fun lt!372350 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!236831 (= res!197957 (= (bitIndex!0 (size!5513 (buf!5988 (_2!10901 lt!372348))) (currentByte!11153 (_2!10901 lt!372348)) (currentBit!11148 (_2!10901 lt!372348))) (bvadd lt!372346 lt!372350)))))

(assert (=> b!236831 (or (not (= (bvand lt!372346 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!372350 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!372346 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!372346 lt!372350) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!236831 (= lt!372350 ((_ sign_extend 32) (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752))))))

(assert (=> b!236831 (or (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!752) #b10000000000000000000000000000000)) (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752)) #b10000000000000000000000000000000)))))

(assert (=> b!236831 (= lt!372346 (bitIndex!0 (size!5513 (buf!5988 (_2!10900 lt!372324))) (currentByte!11153 (_2!10900 lt!372324)) (currentBit!11148 (_2!10900 lt!372324))))))

(declare-fun lt!372349 () (_ BitVec 64))

(declare-fun b!236832 () Bool)

(declare-datatypes ((tuple2!20000 0))(
  ( (tuple2!20001 (_1!10904 BitStream!9990) (_2!10904 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!9990) tuple2!20000)

(assert (=> b!236832 (= e!163727 (= (= (bvand (bvlshr (_1!10901 lt!372348) lt!372349) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!10904 (readBitPure!0 (_2!10900 lt!372324)))))))

(assert (=> b!236832 (and (bvsge lt!372349 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!372349 #b0000000000000000000000000000000000000000000000000000000001000000))))

(declare-fun lt!372351 () (_ BitVec 32))

(assert (=> b!236832 (= lt!372349 ((_ sign_extend 32) (bvsub lt!372351 (bvadd #b00000000000000000000000000000001 i!752))))))

(assert (=> b!236832 (or (= (bvand lt!372351 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!752) #b10000000000000000000000000000000)) (= (bvand lt!372351 #b10000000000000000000000000000000) (bvand (bvsub lt!372351 (bvadd #b00000000000000000000000000000001 i!752)) #b10000000000000000000000000000000)))))

(assert (=> b!236832 (= lt!372351 (bvsub nBits!581 #b00000000000000000000000000000001))))

(assert (=> b!236832 (or (= (bvand nBits!581 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))

(declare-fun b!236833 () Bool)

(declare-fun res!197955 () Bool)

(assert (=> b!236833 (=> (not res!197955) (not e!163725))))

(assert (=> b!236833 (= res!197955 (= (bvand (_1!10901 lt!372348) (onesLSBLong!0 nBits!581)) (_1!10901 lt!372348)))))

(declare-fun b!236834 () Bool)

(declare-fun res!197954 () Bool)

(assert (=> b!236834 (=> (not res!197954) (not e!163725))))

(declare-fun lt!372352 () (_ BitVec 64))

(declare-fun lt!372354 () (_ BitVec 64))

(assert (=> b!236834 (= res!197954 (= (bvlshr (_1!10901 lt!372348) lt!372352) (bvlshr (bvor acc!170 (ite (_1!10900 lt!372324) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000)) lt!372354)))))

(assert (=> b!236834 (and (bvsge lt!372354 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!372354 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!236834 (= lt!372354 ((_ sign_extend 32) (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752))))))

(assert (=> b!236834 (or (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!752) #b10000000000000000000000000000000)) (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752)) #b10000000000000000000000000000000)))))

(assert (=> b!236834 (and (bvsge lt!372352 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!372352 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!236834 (= lt!372352 ((_ sign_extend 32) (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752))))))

(assert (=> b!236834 (or (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!752) #b10000000000000000000000000000000)) (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752)) #b10000000000000000000000000000000)))))

(assert (= (and d!80036 c!11335) b!236828))

(assert (= (and d!80036 (not c!11335)) b!236830))

(assert (= (and d!80036 res!197958) b!236831))

(assert (= (and b!236831 res!197957) b!236834))

(assert (= (and b!236834 res!197954) b!236833))

(assert (= (and b!236833 res!197955) b!236829))

(assert (= (and b!236829 (not res!197956)) b!236832))

(declare-fun m!359429 () Bool)

(assert (=> b!236830 m!359429))

(declare-fun m!359431 () Bool)

(assert (=> b!236830 m!359431))

(declare-fun m!359433 () Bool)

(assert (=> b!236831 m!359433))

(declare-fun m!359435 () Bool)

(assert (=> b!236831 m!359435))

(declare-fun m!359437 () Bool)

(assert (=> b!236832 m!359437))

(assert (=> b!236833 m!359403))

(assert (=> b!236789 d!80036))

(declare-fun d!80048 () Bool)

(declare-fun e!163743 () Bool)

(assert (=> d!80048 e!163743))

(declare-fun res!197976 () Bool)

(assert (=> d!80048 (=> (not res!197976) (not e!163743))))

(declare-datatypes ((Unit!17387 0))(
  ( (Unit!17388) )
))
(declare-datatypes ((tuple2!20002 0))(
  ( (tuple2!20003 (_1!10905 Unit!17387) (_2!10905 BitStream!9990)) )
))
(declare-fun increaseBitIndex!0 (BitStream!9990) tuple2!20002)

(assert (=> d!80048 (= res!197976 (= (buf!5988 (_2!10905 (increaseBitIndex!0 thiss!1830))) (buf!5988 thiss!1830)))))

(declare-fun lt!372399 () Bool)

(assert (=> d!80048 (= lt!372399 (not (= (bvand ((_ sign_extend 24) (select (arr!6500 (buf!5988 thiss!1830)) (currentByte!11153 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11148 thiss!1830)))) #b00000000000000000000000000000000)))))

(declare-fun lt!372400 () tuple2!19992)

(assert (=> d!80048 (= lt!372400 (tuple2!19993 (not (= (bvand ((_ sign_extend 24) (select (arr!6500 (buf!5988 thiss!1830)) (currentByte!11153 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11148 thiss!1830)))) #b00000000000000000000000000000000)) (_2!10905 (increaseBitIndex!0 thiss!1830))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!80048 (validate_offset_bit!0 ((_ sign_extend 32) (size!5513 (buf!5988 thiss!1830))) ((_ sign_extend 32) (currentByte!11153 thiss!1830)) ((_ sign_extend 32) (currentBit!11148 thiss!1830)))))

(assert (=> d!80048 (= (readBit!0 thiss!1830) lt!372400)))

(declare-fun lt!372397 () (_ BitVec 64))

(declare-fun b!236858 () Bool)

(declare-fun lt!372401 () (_ BitVec 64))

(assert (=> b!236858 (= e!163743 (= (bitIndex!0 (size!5513 (buf!5988 (_2!10905 (increaseBitIndex!0 thiss!1830)))) (currentByte!11153 (_2!10905 (increaseBitIndex!0 thiss!1830))) (currentBit!11148 (_2!10905 (increaseBitIndex!0 thiss!1830)))) (bvadd lt!372397 lt!372401)))))

(assert (=> b!236858 (or (not (= (bvand lt!372397 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!372401 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!372397 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!372397 lt!372401) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!236858 (= lt!372401 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!236858 (= lt!372397 (bitIndex!0 (size!5513 (buf!5988 thiss!1830)) (currentByte!11153 thiss!1830) (currentBit!11148 thiss!1830)))))

(declare-fun lt!372402 () Bool)

(assert (=> b!236858 (= lt!372402 (not (= (bvand ((_ sign_extend 24) (select (arr!6500 (buf!5988 thiss!1830)) (currentByte!11153 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11148 thiss!1830)))) #b00000000000000000000000000000000)))))

(declare-fun lt!372396 () Bool)

(assert (=> b!236858 (= lt!372396 (not (= (bvand ((_ sign_extend 24) (select (arr!6500 (buf!5988 thiss!1830)) (currentByte!11153 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11148 thiss!1830)))) #b00000000000000000000000000000000)))))

(declare-fun lt!372398 () Bool)

(assert (=> b!236858 (= lt!372398 (not (= (bvand ((_ sign_extend 24) (select (arr!6500 (buf!5988 thiss!1830)) (currentByte!11153 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11148 thiss!1830)))) #b00000000000000000000000000000000)))))

(assert (= (and d!80048 res!197976) b!236858))

(declare-fun m!359449 () Bool)

(assert (=> d!80048 m!359449))

(declare-fun m!359451 () Bool)

(assert (=> d!80048 m!359451))

(declare-fun m!359453 () Bool)

(assert (=> d!80048 m!359453))

(declare-fun m!359455 () Bool)

(assert (=> d!80048 m!359455))

(assert (=> b!236858 m!359451))

(declare-fun m!359457 () Bool)

(assert (=> b!236858 m!359457))

(assert (=> b!236858 m!359453))

(declare-fun m!359459 () Bool)

(assert (=> b!236858 m!359459))

(assert (=> b!236858 m!359449))

(assert (=> b!236789 d!80048))

(declare-fun d!80052 () Bool)

(assert (=> d!80052 (= (array_inv!5254 (buf!5988 thiss!1830)) (bvsge (size!5513 (buf!5988 thiss!1830)) #b00000000000000000000000000000000))))

(assert (=> b!236788 d!80052))

(declare-fun d!80054 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!80054 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5513 (buf!5988 thiss!1830))) ((_ sign_extend 32) (currentByte!11153 thiss!1830)) ((_ sign_extend 32) (currentBit!11148 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5513 (buf!5988 thiss!1830))) ((_ sign_extend 32) (currentByte!11153 thiss!1830)) ((_ sign_extend 32) (currentBit!11148 thiss!1830))) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(declare-fun bs!19970 () Bool)

(assert (= bs!19970 d!80054))

(declare-fun m!359461 () Bool)

(assert (=> bs!19970 m!359461))

(assert (=> b!236790 d!80054))

(check-sat (not b!236831) (not d!80054) (not d!80048) (not b!236858) (not d!80030) (not b!236830) (not b!236833) (not b!236832))
(check-sat)
