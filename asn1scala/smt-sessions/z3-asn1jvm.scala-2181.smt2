; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55230 () Bool)

(assert start!55230)

(declare-fun b!257757 () Bool)

(declare-fun e!178766 () Bool)

(declare-datatypes ((array!14027 0))(
  ( (array!14028 (arr!7139 (Array (_ BitVec 32) (_ BitVec 8))) (size!6152 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11226 0))(
  ( (BitStream!11227 (buf!6674 array!14027) (currentByte!12225 (_ BitVec 32)) (currentBit!12220 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!22066 0))(
  ( (tuple2!22067 (_1!11969 Bool) (_2!11969 BitStream!11226)) )
))
(declare-fun lt!398994 () tuple2!22066)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!257757 (= e!178766 (not (invariant!0 (currentBit!12220 (_2!11969 lt!398994)) (currentByte!12225 (_2!11969 lt!398994)) (size!6152 (buf!6674 (_2!11969 lt!398994))))))))

(declare-fun expected!109 () Bool)

(declare-fun nBits!535 () (_ BitVec 64))

(declare-fun lt!398995 () tuple2!22066)

(declare-fun from!526 () (_ BitVec 64))

(declare-fun checkBitsLoop!0 (BitStream!11226 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!22066)

(assert (=> b!257757 (= lt!398994 (checkBitsLoop!0 (_2!11969 lt!398995) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!257757 (validate_offset_bits!1 ((_ sign_extend 32) (size!6152 (buf!6674 (_2!11969 lt!398995)))) ((_ sign_extend 32) (currentByte!12225 (_2!11969 lt!398995))) ((_ sign_extend 32) (currentBit!12220 (_2!11969 lt!398995))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun thiss!1754 () BitStream!11226)

(declare-datatypes ((Unit!18407 0))(
  ( (Unit!18408) )
))
(declare-fun lt!398996 () Unit!18407)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!11226 BitStream!11226 (_ BitVec 64) (_ BitVec 64)) Unit!18407)

(assert (=> b!257757 (= lt!398996 (validateOffsetBitsIneqLemma!0 thiss!1754 (_2!11969 lt!398995) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!257758 () Bool)

(declare-fun e!178765 () Bool)

(assert (=> b!257758 (= e!178765 e!178766)))

(declare-fun res!215994 () Bool)

(assert (=> b!257758 (=> (not res!215994) (not e!178766))))

(assert (=> b!257758 (= res!215994 (= (_1!11969 lt!398995) expected!109))))

(declare-fun readBit!0 (BitStream!11226) tuple2!22066)

(assert (=> b!257758 (= lt!398995 (readBit!0 thiss!1754))))

(declare-fun b!257759 () Bool)

(declare-fun e!178768 () Bool)

(declare-fun array_inv!5893 (array!14027) Bool)

(assert (=> b!257759 (= e!178768 (array_inv!5893 (buf!6674 thiss!1754)))))

(declare-fun b!257760 () Bool)

(declare-fun res!215993 () Bool)

(assert (=> b!257760 (=> (not res!215993) (not e!178765))))

(assert (=> b!257760 (= res!215993 (validate_offset_bits!1 ((_ sign_extend 32) (size!6152 (buf!6674 thiss!1754))) ((_ sign_extend 32) (currentByte!12225 thiss!1754)) ((_ sign_extend 32) (currentBit!12220 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun res!215995 () Bool)

(assert (=> start!55230 (=> (not res!215995) (not e!178765))))

(assert (=> start!55230 (= res!215995 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55230 e!178765))

(assert (=> start!55230 true))

(declare-fun inv!12 (BitStream!11226) Bool)

(assert (=> start!55230 (and (inv!12 thiss!1754) e!178768)))

(declare-fun b!257761 () Bool)

(declare-fun res!215992 () Bool)

(assert (=> b!257761 (=> (not res!215992) (not e!178765))))

(assert (=> b!257761 (= res!215992 (not (= from!526 nBits!535)))))

(assert (= (and start!55230 res!215995) b!257760))

(assert (= (and b!257760 res!215993) b!257761))

(assert (= (and b!257761 res!215992) b!257758))

(assert (= (and b!257758 res!215994) b!257757))

(assert (= start!55230 b!257759))

(declare-fun m!387231 () Bool)

(assert (=> start!55230 m!387231))

(declare-fun m!387233 () Bool)

(assert (=> b!257760 m!387233))

(declare-fun m!387235 () Bool)

(assert (=> b!257758 m!387235))

(declare-fun m!387237 () Bool)

(assert (=> b!257757 m!387237))

(declare-fun m!387239 () Bool)

(assert (=> b!257757 m!387239))

(declare-fun m!387241 () Bool)

(assert (=> b!257757 m!387241))

(declare-fun m!387243 () Bool)

(assert (=> b!257757 m!387243))

(declare-fun m!387245 () Bool)

(assert (=> b!257759 m!387245))

(check-sat (not b!257757) (not start!55230) (not b!257758) (not b!257759) (not b!257760))
(check-sat)
(get-model)

(declare-fun d!86422 () Bool)

(assert (=> d!86422 (= (invariant!0 (currentBit!12220 (_2!11969 lt!398994)) (currentByte!12225 (_2!11969 lt!398994)) (size!6152 (buf!6674 (_2!11969 lt!398994)))) (and (bvsge (currentBit!12220 (_2!11969 lt!398994)) #b00000000000000000000000000000000) (bvslt (currentBit!12220 (_2!11969 lt!398994)) #b00000000000000000000000000001000) (bvsge (currentByte!12225 (_2!11969 lt!398994)) #b00000000000000000000000000000000) (or (bvslt (currentByte!12225 (_2!11969 lt!398994)) (size!6152 (buf!6674 (_2!11969 lt!398994)))) (and (= (currentBit!12220 (_2!11969 lt!398994)) #b00000000000000000000000000000000) (= (currentByte!12225 (_2!11969 lt!398994)) (size!6152 (buf!6674 (_2!11969 lt!398994))))))))))

(assert (=> b!257757 d!86422))

(declare-fun b!257801 () Bool)

(declare-fun e!178808 () Bool)

(declare-datatypes ((tuple2!22070 0))(
  ( (tuple2!22071 (_1!11971 BitStream!11226) (_2!11971 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!11226) tuple2!22070)

(assert (=> b!257801 (= e!178808 (= expected!109 (_2!11971 (readBitPure!0 (_2!11969 lt!398995)))))))

(declare-fun b!257802 () Bool)

(declare-fun e!178809 () tuple2!22066)

(assert (=> b!257802 (= e!178809 (tuple2!22067 true (_2!11969 lt!398995)))))

(declare-fun b!257803 () Bool)

(declare-fun e!178805 () Bool)

(assert (=> b!257803 (= e!178805 e!178808)))

(declare-fun res!216025 () Bool)

(assert (=> b!257803 (=> res!216025 e!178808)))

(declare-fun lt!399073 () tuple2!22066)

(assert (=> b!257803 (= res!216025 (or (not (_1!11969 lt!399073)) (bvsge (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) nBits!535)))))

(declare-fun b!257804 () Bool)

(declare-fun res!216026 () Bool)

(assert (=> b!257804 (=> (not res!216026) (not e!178805))))

(declare-fun e!178807 () Bool)

(assert (=> b!257804 (= res!216026 e!178807)))

(declare-fun res!216028 () Bool)

(assert (=> b!257804 (=> res!216028 e!178807)))

(assert (=> b!257804 (= res!216028 (not (_1!11969 lt!399073)))))

(declare-fun d!86424 () Bool)

(assert (=> d!86424 e!178805))

(declare-fun res!216024 () Bool)

(assert (=> d!86424 (=> (not res!216024) (not e!178805))))

(declare-fun lt!399070 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> d!86424 (= res!216024 (bvsge (bvsub lt!399070 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) (bitIndex!0 (size!6152 (buf!6674 (_2!11969 lt!399073))) (currentByte!12225 (_2!11969 lt!399073)) (currentBit!12220 (_2!11969 lt!399073)))))))

(assert (=> d!86424 (or (= (bvand lt!399070 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!399070 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!399070 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!399076 () (_ BitVec 64))

(assert (=> d!86424 (= lt!399070 (bvadd lt!399076 nBits!535))))

(assert (=> d!86424 (or (not (= (bvand lt!399076 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!399076 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!399076 nBits!535) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!86424 (= lt!399076 (bitIndex!0 (size!6152 (buf!6674 (_2!11969 lt!398995))) (currentByte!12225 (_2!11969 lt!398995)) (currentBit!12220 (_2!11969 lt!398995))))))

(assert (=> d!86424 (= lt!399073 e!178809)))

(declare-fun c!11822 () Bool)

(assert (=> d!86424 (= c!11822 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) nBits!535))))

(assert (=> d!86424 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!86424 (= (checkBitsLoop!0 (_2!11969 lt!398995) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) lt!399073)))

(declare-fun b!257805 () Bool)

(declare-fun e!178806 () tuple2!22066)

(declare-fun lt!399074 () tuple2!22066)

(assert (=> b!257805 (= e!178806 (tuple2!22067 false (_2!11969 lt!399074)))))

(declare-fun b!257806 () Bool)

(assert (=> b!257806 (= e!178809 e!178806)))

(assert (=> b!257806 (= lt!399074 (readBit!0 (_2!11969 lt!398995)))))

(declare-fun c!11823 () Bool)

(assert (=> b!257806 (= c!11823 (not (= (_1!11969 lt!399074) expected!109)))))

(declare-fun b!257807 () Bool)

(declare-fun lt!399079 () tuple2!22066)

(assert (=> b!257807 (= lt!399079 (checkBitsLoop!0 (_2!11969 lt!399074) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!399078 () Unit!18407)

(declare-fun lt!399071 () Unit!18407)

(assert (=> b!257807 (= lt!399078 lt!399071)))

(declare-fun lt!399080 () (_ BitVec 64))

(declare-fun lt!399075 () (_ BitVec 64))

(assert (=> b!257807 (validate_offset_bits!1 ((_ sign_extend 32) (size!6152 (buf!6674 (_2!11969 lt!399074)))) ((_ sign_extend 32) (currentByte!12225 (_2!11969 lt!399074))) ((_ sign_extend 32) (currentBit!12220 (_2!11969 lt!399074))) (bvsub lt!399080 lt!399075))))

(assert (=> b!257807 (= lt!399071 (validateOffsetBitsIneqLemma!0 (_2!11969 lt!398995) (_2!11969 lt!399074) lt!399080 lt!399075))))

(assert (=> b!257807 (= lt!399075 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!257807 (= lt!399080 (bvsub nBits!535 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)))))

(assert (=> b!257807 (= e!178806 (tuple2!22067 (_1!11969 lt!399079) (_2!11969 lt!399079)))))

(declare-fun b!257808 () Bool)

(declare-fun res!216027 () Bool)

(assert (=> b!257808 (=> (not res!216027) (not e!178805))))

(assert (=> b!257808 (= res!216027 (and (= (buf!6674 (_2!11969 lt!398995)) (buf!6674 (_2!11969 lt!399073))) (or (not (= nBits!535 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526))) (_1!11969 lt!399073))))))

(declare-fun lt!399072 () (_ BitVec 64))

(declare-fun b!257809 () Bool)

(assert (=> b!257809 (= e!178807 (= (bvsub lt!399072 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) (bitIndex!0 (size!6152 (buf!6674 (_2!11969 lt!399073))) (currentByte!12225 (_2!11969 lt!399073)) (currentBit!12220 (_2!11969 lt!399073)))))))

(assert (=> b!257809 (or (= (bvand lt!399072 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!399072 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!399072 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!399077 () (_ BitVec 64))

(assert (=> b!257809 (= lt!399072 (bvadd lt!399077 nBits!535))))

(assert (=> b!257809 (or (not (= (bvand lt!399077 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!399077 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!399077 nBits!535) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!257809 (= lt!399077 (bitIndex!0 (size!6152 (buf!6674 (_2!11969 lt!398995))) (currentByte!12225 (_2!11969 lt!398995)) (currentBit!12220 (_2!11969 lt!398995))))))

(assert (= (and d!86424 c!11822) b!257802))

(assert (= (and d!86424 (not c!11822)) b!257806))

(assert (= (and b!257806 c!11823) b!257805))

(assert (= (and b!257806 (not c!11823)) b!257807))

(assert (= (and d!86424 res!216024) b!257808))

(assert (= (and b!257808 res!216027) b!257804))

(assert (= (and b!257804 (not res!216028)) b!257809))

(assert (= (and b!257804 res!216026) b!257803))

(assert (= (and b!257803 (not res!216025)) b!257801))

(declare-fun m!387291 () Bool)

(assert (=> b!257801 m!387291))

(declare-fun m!387293 () Bool)

(assert (=> b!257806 m!387293))

(declare-fun m!387295 () Bool)

(assert (=> b!257809 m!387295))

(declare-fun m!387297 () Bool)

(assert (=> b!257809 m!387297))

(assert (=> d!86424 m!387295))

(assert (=> d!86424 m!387297))

(declare-fun m!387299 () Bool)

(assert (=> b!257807 m!387299))

(declare-fun m!387301 () Bool)

(assert (=> b!257807 m!387301))

(declare-fun m!387303 () Bool)

(assert (=> b!257807 m!387303))

(assert (=> b!257757 d!86424))

(declare-fun d!86444 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!86444 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6152 (buf!6674 (_2!11969 lt!398995)))) ((_ sign_extend 32) (currentByte!12225 (_2!11969 lt!398995))) ((_ sign_extend 32) (currentBit!12220 (_2!11969 lt!398995))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6152 (buf!6674 (_2!11969 lt!398995)))) ((_ sign_extend 32) (currentByte!12225 (_2!11969 lt!398995))) ((_ sign_extend 32) (currentBit!12220 (_2!11969 lt!398995)))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!21881 () Bool)

(assert (= bs!21881 d!86444))

(declare-fun m!387305 () Bool)

(assert (=> bs!21881 m!387305))

(assert (=> b!257757 d!86444))

(declare-fun d!86446 () Bool)

(declare-fun e!178812 () Bool)

(assert (=> d!86446 e!178812))

(declare-fun res!216031 () Bool)

(assert (=> d!86446 (=> (not res!216031) (not e!178812))))

(assert (=> d!86446 (= res!216031 (or (= (bvand (bvsub nBits!535 from!526) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!535 from!526) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!399083 () Unit!18407)

(declare-fun choose!27 (BitStream!11226 BitStream!11226 (_ BitVec 64) (_ BitVec 64)) Unit!18407)

(assert (=> d!86446 (= lt!399083 (choose!27 thiss!1754 (_2!11969 lt!398995) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!86446 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!535 from!526)))))

(assert (=> d!86446 (= (validateOffsetBitsIneqLemma!0 thiss!1754 (_2!11969 lt!398995) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001) lt!399083)))

(declare-fun b!257812 () Bool)

(assert (=> b!257812 (= e!178812 (validate_offset_bits!1 ((_ sign_extend 32) (size!6152 (buf!6674 (_2!11969 lt!398995)))) ((_ sign_extend 32) (currentByte!12225 (_2!11969 lt!398995))) ((_ sign_extend 32) (currentBit!12220 (_2!11969 lt!398995))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!86446 res!216031) b!257812))

(declare-fun m!387307 () Bool)

(assert (=> d!86446 m!387307))

(assert (=> b!257812 m!387241))

(assert (=> b!257757 d!86446))

(declare-fun d!86448 () Bool)

(declare-fun e!178838 () Bool)

(assert (=> d!86448 e!178838))

(declare-fun res!216049 () Bool)

(assert (=> d!86448 (=> (not res!216049) (not e!178838))))

(declare-datatypes ((tuple2!22078 0))(
  ( (tuple2!22079 (_1!11975 Unit!18407) (_2!11975 BitStream!11226)) )
))
(declare-fun increaseBitIndex!0 (BitStream!11226) tuple2!22078)

(assert (=> d!86448 (= res!216049 (= (buf!6674 (_2!11975 (increaseBitIndex!0 thiss!1754))) (buf!6674 thiss!1754)))))

(declare-fun lt!399151 () Bool)

(assert (=> d!86448 (= lt!399151 (not (= (bvand ((_ sign_extend 24) (select (arr!7139 (buf!6674 thiss!1754)) (currentByte!12225 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12220 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!399147 () tuple2!22066)

(assert (=> d!86448 (= lt!399147 (tuple2!22067 (not (= (bvand ((_ sign_extend 24) (select (arr!7139 (buf!6674 thiss!1754)) (currentByte!12225 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12220 thiss!1754)))) #b00000000000000000000000000000000)) (_2!11975 (increaseBitIndex!0 thiss!1754))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!86448 (validate_offset_bit!0 ((_ sign_extend 32) (size!6152 (buf!6674 thiss!1754))) ((_ sign_extend 32) (currentByte!12225 thiss!1754)) ((_ sign_extend 32) (currentBit!12220 thiss!1754)))))

(assert (=> d!86448 (= (readBit!0 thiss!1754) lt!399147)))

(declare-fun lt!399145 () (_ BitVec 64))

(declare-fun b!257850 () Bool)

(declare-fun lt!399146 () (_ BitVec 64))

(assert (=> b!257850 (= e!178838 (= (bitIndex!0 (size!6152 (buf!6674 (_2!11975 (increaseBitIndex!0 thiss!1754)))) (currentByte!12225 (_2!11975 (increaseBitIndex!0 thiss!1754))) (currentBit!12220 (_2!11975 (increaseBitIndex!0 thiss!1754)))) (bvadd lt!399145 lt!399146)))))

(assert (=> b!257850 (or (not (= (bvand lt!399145 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!399146 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!399145 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!399145 lt!399146) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!257850 (= lt!399146 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!257850 (= lt!399145 (bitIndex!0 (size!6152 (buf!6674 thiss!1754)) (currentByte!12225 thiss!1754) (currentBit!12220 thiss!1754)))))

(declare-fun lt!399148 () Bool)

(assert (=> b!257850 (= lt!399148 (not (= (bvand ((_ sign_extend 24) (select (arr!7139 (buf!6674 thiss!1754)) (currentByte!12225 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12220 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!399149 () Bool)

(assert (=> b!257850 (= lt!399149 (not (= (bvand ((_ sign_extend 24) (select (arr!7139 (buf!6674 thiss!1754)) (currentByte!12225 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12220 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!399150 () Bool)

(assert (=> b!257850 (= lt!399150 (not (= (bvand ((_ sign_extend 24) (select (arr!7139 (buf!6674 thiss!1754)) (currentByte!12225 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12220 thiss!1754)))) #b00000000000000000000000000000000)))))

(assert (= (and d!86448 res!216049) b!257850))

(declare-fun m!387325 () Bool)

(assert (=> d!86448 m!387325))

(declare-fun m!387327 () Bool)

(assert (=> d!86448 m!387327))

(declare-fun m!387329 () Bool)

(assert (=> d!86448 m!387329))

(declare-fun m!387331 () Bool)

(assert (=> d!86448 m!387331))

(assert (=> b!257850 m!387325))

(assert (=> b!257850 m!387327))

(declare-fun m!387333 () Bool)

(assert (=> b!257850 m!387333))

(assert (=> b!257850 m!387329))

(declare-fun m!387335 () Bool)

(assert (=> b!257850 m!387335))

(assert (=> b!257758 d!86448))

(declare-fun d!86454 () Bool)

(assert (=> d!86454 (= (array_inv!5893 (buf!6674 thiss!1754)) (bvsge (size!6152 (buf!6674 thiss!1754)) #b00000000000000000000000000000000))))

(assert (=> b!257759 d!86454))

(declare-fun d!86456 () Bool)

(assert (=> d!86456 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6152 (buf!6674 thiss!1754))) ((_ sign_extend 32) (currentByte!12225 thiss!1754)) ((_ sign_extend 32) (currentBit!12220 thiss!1754)) (bvsub nBits!535 from!526)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6152 (buf!6674 thiss!1754))) ((_ sign_extend 32) (currentByte!12225 thiss!1754)) ((_ sign_extend 32) (currentBit!12220 thiss!1754))) (bvsub nBits!535 from!526)))))

(declare-fun bs!21883 () Bool)

(assert (= bs!21883 d!86456))

(declare-fun m!387337 () Bool)

(assert (=> bs!21883 m!387337))

(assert (=> b!257760 d!86456))

(declare-fun d!86458 () Bool)

(assert (=> d!86458 (= (inv!12 thiss!1754) (invariant!0 (currentBit!12220 thiss!1754) (currentByte!12225 thiss!1754) (size!6152 (buf!6674 thiss!1754))))))

(declare-fun bs!21884 () Bool)

(assert (= bs!21884 d!86458))

(declare-fun m!387339 () Bool)

(assert (=> bs!21884 m!387339))

(assert (=> start!55230 d!86458))

(check-sat (not d!86424) (not d!86458) (not d!86448) (not b!257801) (not b!257807) (not b!257806) (not b!257812) (not b!257850) (not d!86446) (not d!86444) (not d!86456) (not b!257809))
(check-sat)
(get-model)

(declare-fun d!86470 () Bool)

(assert (=> d!86470 (= (invariant!0 (currentBit!12220 thiss!1754) (currentByte!12225 thiss!1754) (size!6152 (buf!6674 thiss!1754))) (and (bvsge (currentBit!12220 thiss!1754) #b00000000000000000000000000000000) (bvslt (currentBit!12220 thiss!1754) #b00000000000000000000000000001000) (bvsge (currentByte!12225 thiss!1754) #b00000000000000000000000000000000) (or (bvslt (currentByte!12225 thiss!1754) (size!6152 (buf!6674 thiss!1754))) (and (= (currentBit!12220 thiss!1754) #b00000000000000000000000000000000) (= (currentByte!12225 thiss!1754) (size!6152 (buf!6674 thiss!1754)))))))))

(assert (=> d!86458 d!86470))

(declare-fun d!86472 () Bool)

(assert (=> d!86472 (validate_offset_bits!1 ((_ sign_extend 32) (size!6152 (buf!6674 (_2!11969 lt!398995)))) ((_ sign_extend 32) (currentByte!12225 (_2!11969 lt!398995))) ((_ sign_extend 32) (currentBit!12220 (_2!11969 lt!398995))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!86472 true))

(declare-fun _$1!345 () Unit!18407)

(assert (=> d!86472 (= (choose!27 thiss!1754 (_2!11969 lt!398995) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001) _$1!345)))

(declare-fun bs!21888 () Bool)

(assert (= bs!21888 d!86472))

(assert (=> bs!21888 m!387241))

(assert (=> d!86446 d!86472))

(declare-fun d!86474 () Bool)

(assert (=> d!86474 (= (remainingBits!0 ((_ sign_extend 32) (size!6152 (buf!6674 (_2!11969 lt!398995)))) ((_ sign_extend 32) (currentByte!12225 (_2!11969 lt!398995))) ((_ sign_extend 32) (currentBit!12220 (_2!11969 lt!398995)))) (bvsub (bvmul ((_ sign_extend 32) (size!6152 (buf!6674 (_2!11969 lt!398995)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12225 (_2!11969 lt!398995))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12220 (_2!11969 lt!398995))))))))

(assert (=> d!86444 d!86474))

(declare-fun d!86476 () Bool)

(declare-fun e!178858 () Bool)

(assert (=> d!86476 e!178858))

(declare-fun res!216075 () Bool)

(assert (=> d!86476 (=> (not res!216075) (not e!178858))))

(declare-fun lt!399191 () tuple2!22078)

(declare-fun lt!399189 () (_ BitVec 64))

(declare-fun lt!399187 () (_ BitVec 64))

(assert (=> d!86476 (= res!216075 (= (bvadd lt!399189 lt!399187) (bitIndex!0 (size!6152 (buf!6674 (_2!11975 lt!399191))) (currentByte!12225 (_2!11975 lt!399191)) (currentBit!12220 (_2!11975 lt!399191)))))))

(assert (=> d!86476 (or (not (= (bvand lt!399189 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!399187 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!399189 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!399189 lt!399187) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!86476 (= lt!399187 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!86476 (= lt!399189 (bitIndex!0 (size!6152 (buf!6674 thiss!1754)) (currentByte!12225 thiss!1754) (currentBit!12220 thiss!1754)))))

(declare-fun Unit!18411 () Unit!18407)

(declare-fun Unit!18412 () Unit!18407)

(assert (=> d!86476 (= lt!399191 (ite (bvslt (currentBit!12220 thiss!1754) #b00000000000000000000000000000111) (tuple2!22079 Unit!18411 (BitStream!11227 (buf!6674 thiss!1754) (currentByte!12225 thiss!1754) (bvadd (currentBit!12220 thiss!1754) #b00000000000000000000000000000001))) (tuple2!22079 Unit!18412 (BitStream!11227 (buf!6674 thiss!1754) (bvadd (currentByte!12225 thiss!1754) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (=> d!86476 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!6152 (buf!6674 thiss!1754))) ((_ sign_extend 32) (currentByte!12225 thiss!1754)) ((_ sign_extend 32) (currentBit!12220 thiss!1754))) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!86476 (= (increaseBitIndex!0 thiss!1754) lt!399191)))

(declare-fun b!257880 () Bool)

(declare-fun res!216076 () Bool)

(assert (=> b!257880 (=> (not res!216076) (not e!178858))))

(declare-fun lt!399190 () (_ BitVec 64))

(declare-fun lt!399188 () (_ BitVec 64))

(assert (=> b!257880 (= res!216076 (= (bvsub lt!399190 lt!399188) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!257880 (or (= (bvand lt!399190 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!399188 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!399190 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!399190 lt!399188) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!257880 (= lt!399188 (remainingBits!0 ((_ sign_extend 32) (size!6152 (buf!6674 (_2!11975 lt!399191)))) ((_ sign_extend 32) (currentByte!12225 (_2!11975 lt!399191))) ((_ sign_extend 32) (currentBit!12220 (_2!11975 lt!399191)))))))

(assert (=> b!257880 (= lt!399190 (remainingBits!0 ((_ sign_extend 32) (size!6152 (buf!6674 thiss!1754))) ((_ sign_extend 32) (currentByte!12225 thiss!1754)) ((_ sign_extend 32) (currentBit!12220 thiss!1754))))))

(declare-fun b!257881 () Bool)

(assert (=> b!257881 (= e!178858 (= (size!6152 (buf!6674 thiss!1754)) (size!6152 (buf!6674 (_2!11975 lt!399191)))))))

(assert (= (and d!86476 res!216075) b!257880))

(assert (= (and b!257880 res!216076) b!257881))

(declare-fun m!387365 () Bool)

(assert (=> d!86476 m!387365))

(assert (=> d!86476 m!387335))

(assert (=> d!86476 m!387337))

(declare-fun m!387367 () Bool)

(assert (=> b!257880 m!387367))

(assert (=> b!257880 m!387337))

(assert (=> d!86448 d!86476))

(declare-fun d!86478 () Bool)

(assert (=> d!86478 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6152 (buf!6674 thiss!1754))) ((_ sign_extend 32) (currentByte!12225 thiss!1754)) ((_ sign_extend 32) (currentBit!12220 thiss!1754))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6152 (buf!6674 thiss!1754))) ((_ sign_extend 32) (currentByte!12225 thiss!1754)) ((_ sign_extend 32) (currentBit!12220 thiss!1754))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!21889 () Bool)

(assert (= bs!21889 d!86478))

(assert (=> bs!21889 m!387337))

(assert (=> d!86448 d!86478))

(declare-fun d!86480 () Bool)

(declare-fun e!178859 () Bool)

(assert (=> d!86480 e!178859))

(declare-fun res!216077 () Bool)

(assert (=> d!86480 (=> (not res!216077) (not e!178859))))

(assert (=> d!86480 (= res!216077 (= (buf!6674 (_2!11975 (increaseBitIndex!0 (_2!11969 lt!398995)))) (buf!6674 (_2!11969 lt!398995))))))

(declare-fun lt!399198 () Bool)

(assert (=> d!86480 (= lt!399198 (not (= (bvand ((_ sign_extend 24) (select (arr!7139 (buf!6674 (_2!11969 lt!398995))) (currentByte!12225 (_2!11969 lt!398995)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12220 (_2!11969 lt!398995))))) #b00000000000000000000000000000000)))))

(declare-fun lt!399194 () tuple2!22066)

(assert (=> d!86480 (= lt!399194 (tuple2!22067 (not (= (bvand ((_ sign_extend 24) (select (arr!7139 (buf!6674 (_2!11969 lt!398995))) (currentByte!12225 (_2!11969 lt!398995)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12220 (_2!11969 lt!398995))))) #b00000000000000000000000000000000)) (_2!11975 (increaseBitIndex!0 (_2!11969 lt!398995)))))))

(assert (=> d!86480 (validate_offset_bit!0 ((_ sign_extend 32) (size!6152 (buf!6674 (_2!11969 lt!398995)))) ((_ sign_extend 32) (currentByte!12225 (_2!11969 lt!398995))) ((_ sign_extend 32) (currentBit!12220 (_2!11969 lt!398995))))))

(assert (=> d!86480 (= (readBit!0 (_2!11969 lt!398995)) lt!399194)))

(declare-fun lt!399193 () (_ BitVec 64))

(declare-fun b!257882 () Bool)

(declare-fun lt!399192 () (_ BitVec 64))

(assert (=> b!257882 (= e!178859 (= (bitIndex!0 (size!6152 (buf!6674 (_2!11975 (increaseBitIndex!0 (_2!11969 lt!398995))))) (currentByte!12225 (_2!11975 (increaseBitIndex!0 (_2!11969 lt!398995)))) (currentBit!12220 (_2!11975 (increaseBitIndex!0 (_2!11969 lt!398995))))) (bvadd lt!399192 lt!399193)))))

(assert (=> b!257882 (or (not (= (bvand lt!399192 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!399193 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!399192 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!399192 lt!399193) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!257882 (= lt!399193 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!257882 (= lt!399192 (bitIndex!0 (size!6152 (buf!6674 (_2!11969 lt!398995))) (currentByte!12225 (_2!11969 lt!398995)) (currentBit!12220 (_2!11969 lt!398995))))))

(declare-fun lt!399195 () Bool)

(assert (=> b!257882 (= lt!399195 (not (= (bvand ((_ sign_extend 24) (select (arr!7139 (buf!6674 (_2!11969 lt!398995))) (currentByte!12225 (_2!11969 lt!398995)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12220 (_2!11969 lt!398995))))) #b00000000000000000000000000000000)))))

(declare-fun lt!399196 () Bool)

(assert (=> b!257882 (= lt!399196 (not (= (bvand ((_ sign_extend 24) (select (arr!7139 (buf!6674 (_2!11969 lt!398995))) (currentByte!12225 (_2!11969 lt!398995)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12220 (_2!11969 lt!398995))))) #b00000000000000000000000000000000)))))

(declare-fun lt!399197 () Bool)

(assert (=> b!257882 (= lt!399197 (not (= (bvand ((_ sign_extend 24) (select (arr!7139 (buf!6674 (_2!11969 lt!398995))) (currentByte!12225 (_2!11969 lt!398995)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12220 (_2!11969 lt!398995))))) #b00000000000000000000000000000000)))))

(assert (= (and d!86480 res!216077) b!257882))

(declare-fun m!387369 () Bool)

(assert (=> d!86480 m!387369))

(declare-fun m!387371 () Bool)

(assert (=> d!86480 m!387371))

(declare-fun m!387373 () Bool)

(assert (=> d!86480 m!387373))

(declare-fun m!387375 () Bool)

(assert (=> d!86480 m!387375))

(assert (=> b!257882 m!387369))

(assert (=> b!257882 m!387371))

(declare-fun m!387377 () Bool)

(assert (=> b!257882 m!387377))

(assert (=> b!257882 m!387373))

(assert (=> b!257882 m!387297))

(assert (=> b!257806 d!86480))

(declare-fun b!257883 () Bool)

(declare-fun e!178863 () Bool)

(assert (=> b!257883 (= e!178863 (= expected!109 (_2!11971 (readBitPure!0 (_2!11969 lt!399074)))))))

(declare-fun b!257884 () Bool)

(declare-fun e!178864 () tuple2!22066)

(assert (=> b!257884 (= e!178864 (tuple2!22067 true (_2!11969 lt!399074)))))

(declare-fun b!257885 () Bool)

(declare-fun e!178860 () Bool)

(assert (=> b!257885 (= e!178860 e!178863)))

(declare-fun res!216079 () Bool)

(assert (=> b!257885 (=> res!216079 e!178863)))

(declare-fun lt!399202 () tuple2!22066)

(assert (=> b!257885 (= res!216079 (or (not (_1!11969 lt!399202)) (bvsge (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!535)))))

(declare-fun b!257886 () Bool)

(declare-fun res!216080 () Bool)

(assert (=> b!257886 (=> (not res!216080) (not e!178860))))

(declare-fun e!178862 () Bool)

(assert (=> b!257886 (= res!216080 e!178862)))

(declare-fun res!216082 () Bool)

(assert (=> b!257886 (=> res!216082 e!178862)))

(assert (=> b!257886 (= res!216082 (not (_1!11969 lt!399202)))))

(declare-fun d!86482 () Bool)

(assert (=> d!86482 e!178860))

(declare-fun res!216078 () Bool)

(assert (=> d!86482 (=> (not res!216078) (not e!178860))))

(declare-fun lt!399199 () (_ BitVec 64))

(assert (=> d!86482 (= res!216078 (bvsge (bvsub lt!399199 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitIndex!0 (size!6152 (buf!6674 (_2!11969 lt!399202))) (currentByte!12225 (_2!11969 lt!399202)) (currentBit!12220 (_2!11969 lt!399202)))))))

(assert (=> d!86482 (or (= (bvand lt!399199 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!399199 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!399199 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526 #b0000000000000000000000000000000000000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!399205 () (_ BitVec 64))

(assert (=> d!86482 (= lt!399199 (bvadd lt!399205 nBits!535))))

(assert (=> d!86482 (or (not (= (bvand lt!399205 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!399205 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!399205 nBits!535) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!86482 (= lt!399205 (bitIndex!0 (size!6152 (buf!6674 (_2!11969 lt!399074))) (currentByte!12225 (_2!11969 lt!399074)) (currentBit!12220 (_2!11969 lt!399074))))))

(assert (=> d!86482 (= lt!399202 e!178864)))

(declare-fun c!11836 () Bool)

(assert (=> d!86482 (= c!11836 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!535))))

(assert (=> d!86482 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!86482 (= (checkBitsLoop!0 (_2!11969 lt!399074) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526 #b0000000000000000000000000000000000000000000000000000000000000001)) lt!399202)))

(declare-fun b!257887 () Bool)

(declare-fun e!178861 () tuple2!22066)

(declare-fun lt!399203 () tuple2!22066)

(assert (=> b!257887 (= e!178861 (tuple2!22067 false (_2!11969 lt!399203)))))

(declare-fun b!257888 () Bool)

(assert (=> b!257888 (= e!178864 e!178861)))

(assert (=> b!257888 (= lt!399203 (readBit!0 (_2!11969 lt!399074)))))

(declare-fun c!11837 () Bool)

(assert (=> b!257888 (= c!11837 (not (= (_1!11969 lt!399203) expected!109)))))

(declare-fun lt!399208 () tuple2!22066)

(declare-fun b!257889 () Bool)

(assert (=> b!257889 (= lt!399208 (checkBitsLoop!0 (_2!11969 lt!399203) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526 #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!399207 () Unit!18407)

(declare-fun lt!399200 () Unit!18407)

(assert (=> b!257889 (= lt!399207 lt!399200)))

(declare-fun lt!399209 () (_ BitVec 64))

(declare-fun lt!399204 () (_ BitVec 64))

(assert (=> b!257889 (validate_offset_bits!1 ((_ sign_extend 32) (size!6152 (buf!6674 (_2!11969 lt!399203)))) ((_ sign_extend 32) (currentByte!12225 (_2!11969 lt!399203))) ((_ sign_extend 32) (currentBit!12220 (_2!11969 lt!399203))) (bvsub lt!399209 lt!399204))))

(assert (=> b!257889 (= lt!399200 (validateOffsetBitsIneqLemma!0 (_2!11969 lt!399074) (_2!11969 lt!399203) lt!399209 lt!399204))))

(assert (=> b!257889 (= lt!399204 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!257889 (= lt!399209 (bvsub nBits!535 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!257889 (= e!178861 (tuple2!22067 (_1!11969 lt!399208) (_2!11969 lt!399208)))))

(declare-fun b!257890 () Bool)

(declare-fun res!216081 () Bool)

(assert (=> b!257890 (=> (not res!216081) (not e!178860))))

(assert (=> b!257890 (= res!216081 (and (= (buf!6674 (_2!11969 lt!399074)) (buf!6674 (_2!11969 lt!399202))) (or (not (= nBits!535 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526 #b0000000000000000000000000000000000000000000000000000000000000001))) (_1!11969 lt!399202))))))

(declare-fun b!257891 () Bool)

(declare-fun lt!399201 () (_ BitVec 64))

(assert (=> b!257891 (= e!178862 (= (bvsub lt!399201 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitIndex!0 (size!6152 (buf!6674 (_2!11969 lt!399202))) (currentByte!12225 (_2!11969 lt!399202)) (currentBit!12220 (_2!11969 lt!399202)))))))

(assert (=> b!257891 (or (= (bvand lt!399201 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!399201 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!399201 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526 #b0000000000000000000000000000000000000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!399206 () (_ BitVec 64))

(assert (=> b!257891 (= lt!399201 (bvadd lt!399206 nBits!535))))

(assert (=> b!257891 (or (not (= (bvand lt!399206 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!399206 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!399206 nBits!535) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!257891 (= lt!399206 (bitIndex!0 (size!6152 (buf!6674 (_2!11969 lt!399074))) (currentByte!12225 (_2!11969 lt!399074)) (currentBit!12220 (_2!11969 lt!399074))))))

(assert (= (and d!86482 c!11836) b!257884))

(assert (= (and d!86482 (not c!11836)) b!257888))

(assert (= (and b!257888 c!11837) b!257887))

(assert (= (and b!257888 (not c!11837)) b!257889))

(assert (= (and d!86482 res!216078) b!257890))

(assert (= (and b!257890 res!216081) b!257886))

(assert (= (and b!257886 (not res!216082)) b!257891))

(assert (= (and b!257886 res!216080) b!257885))

(assert (= (and b!257885 (not res!216079)) b!257883))

(declare-fun m!387379 () Bool)

(assert (=> b!257883 m!387379))

(declare-fun m!387381 () Bool)

(assert (=> b!257888 m!387381))

(declare-fun m!387383 () Bool)

(assert (=> b!257891 m!387383))

(declare-fun m!387385 () Bool)

(assert (=> b!257891 m!387385))

(assert (=> d!86482 m!387383))

(assert (=> d!86482 m!387385))

(declare-fun m!387387 () Bool)

(assert (=> b!257889 m!387387))

(declare-fun m!387389 () Bool)

(assert (=> b!257889 m!387389))

(declare-fun m!387391 () Bool)

(assert (=> b!257889 m!387391))

(assert (=> b!257807 d!86482))

(declare-fun d!86484 () Bool)

(assert (=> d!86484 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6152 (buf!6674 (_2!11969 lt!399074)))) ((_ sign_extend 32) (currentByte!12225 (_2!11969 lt!399074))) ((_ sign_extend 32) (currentBit!12220 (_2!11969 lt!399074))) (bvsub lt!399080 lt!399075)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6152 (buf!6674 (_2!11969 lt!399074)))) ((_ sign_extend 32) (currentByte!12225 (_2!11969 lt!399074))) ((_ sign_extend 32) (currentBit!12220 (_2!11969 lt!399074)))) (bvsub lt!399080 lt!399075)))))

(declare-fun bs!21890 () Bool)

(assert (= bs!21890 d!86484))

(declare-fun m!387393 () Bool)

(assert (=> bs!21890 m!387393))

(assert (=> b!257807 d!86484))

(declare-fun d!86486 () Bool)

(declare-fun e!178865 () Bool)

(assert (=> d!86486 e!178865))

(declare-fun res!216083 () Bool)

(assert (=> d!86486 (=> (not res!216083) (not e!178865))))

(assert (=> d!86486 (= res!216083 (or (= (bvand lt!399080 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!399075 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!399080 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!399080 lt!399075) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!399210 () Unit!18407)

(assert (=> d!86486 (= lt!399210 (choose!27 (_2!11969 lt!398995) (_2!11969 lt!399074) lt!399080 lt!399075))))

(assert (=> d!86486 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!399075) (bvsle lt!399075 lt!399080))))

(assert (=> d!86486 (= (validateOffsetBitsIneqLemma!0 (_2!11969 lt!398995) (_2!11969 lt!399074) lt!399080 lt!399075) lt!399210)))

(declare-fun b!257892 () Bool)

(assert (=> b!257892 (= e!178865 (validate_offset_bits!1 ((_ sign_extend 32) (size!6152 (buf!6674 (_2!11969 lt!399074)))) ((_ sign_extend 32) (currentByte!12225 (_2!11969 lt!399074))) ((_ sign_extend 32) (currentBit!12220 (_2!11969 lt!399074))) (bvsub lt!399080 lt!399075)))))

(assert (= (and d!86486 res!216083) b!257892))

(declare-fun m!387395 () Bool)

(assert (=> d!86486 m!387395))

(assert (=> b!257892 m!387301))

(assert (=> b!257807 d!86486))

(declare-fun d!86488 () Bool)

(assert (=> d!86488 (= (remainingBits!0 ((_ sign_extend 32) (size!6152 (buf!6674 thiss!1754))) ((_ sign_extend 32) (currentByte!12225 thiss!1754)) ((_ sign_extend 32) (currentBit!12220 thiss!1754))) (bvsub (bvmul ((_ sign_extend 32) (size!6152 (buf!6674 thiss!1754))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12225 thiss!1754)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12220 thiss!1754)))))))

(assert (=> d!86456 d!86488))

(declare-fun d!86490 () Bool)

(declare-fun e!178868 () Bool)

(assert (=> d!86490 e!178868))

(declare-fun res!216088 () Bool)

(assert (=> d!86490 (=> (not res!216088) (not e!178868))))

(declare-fun lt!399228 () (_ BitVec 64))

(declare-fun lt!399227 () (_ BitVec 64))

(declare-fun lt!399226 () (_ BitVec 64))

(assert (=> d!86490 (= res!216088 (= lt!399228 (bvsub lt!399226 lt!399227)))))

(assert (=> d!86490 (or (= (bvand lt!399226 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!399227 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!399226 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!399226 lt!399227) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!86490 (= lt!399227 (remainingBits!0 ((_ sign_extend 32) (size!6152 (buf!6674 (_2!11975 (increaseBitIndex!0 thiss!1754))))) ((_ sign_extend 32) (currentByte!12225 (_2!11975 (increaseBitIndex!0 thiss!1754)))) ((_ sign_extend 32) (currentBit!12220 (_2!11975 (increaseBitIndex!0 thiss!1754))))))))

(declare-fun lt!399223 () (_ BitVec 64))

(declare-fun lt!399224 () (_ BitVec 64))

(assert (=> d!86490 (= lt!399226 (bvmul lt!399223 lt!399224))))

(assert (=> d!86490 (or (= lt!399223 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!399224 (bvsdiv (bvmul lt!399223 lt!399224) lt!399223)))))

(assert (=> d!86490 (= lt!399224 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!86490 (= lt!399223 ((_ sign_extend 32) (size!6152 (buf!6674 (_2!11975 (increaseBitIndex!0 thiss!1754))))))))

(assert (=> d!86490 (= lt!399228 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12225 (_2!11975 (increaseBitIndex!0 thiss!1754)))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12220 (_2!11975 (increaseBitIndex!0 thiss!1754))))))))

(assert (=> d!86490 (invariant!0 (currentBit!12220 (_2!11975 (increaseBitIndex!0 thiss!1754))) (currentByte!12225 (_2!11975 (increaseBitIndex!0 thiss!1754))) (size!6152 (buf!6674 (_2!11975 (increaseBitIndex!0 thiss!1754)))))))

(assert (=> d!86490 (= (bitIndex!0 (size!6152 (buf!6674 (_2!11975 (increaseBitIndex!0 thiss!1754)))) (currentByte!12225 (_2!11975 (increaseBitIndex!0 thiss!1754))) (currentBit!12220 (_2!11975 (increaseBitIndex!0 thiss!1754)))) lt!399228)))

(declare-fun b!257897 () Bool)

(declare-fun res!216089 () Bool)

(assert (=> b!257897 (=> (not res!216089) (not e!178868))))

(assert (=> b!257897 (= res!216089 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!399228))))

(declare-fun b!257898 () Bool)

(declare-fun lt!399225 () (_ BitVec 64))

(assert (=> b!257898 (= e!178868 (bvsle lt!399228 (bvmul lt!399225 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!257898 (or (= lt!399225 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!399225 #b0000000000000000000000000000000000000000000000000000000000001000) lt!399225)))))

(assert (=> b!257898 (= lt!399225 ((_ sign_extend 32) (size!6152 (buf!6674 (_2!11975 (increaseBitIndex!0 thiss!1754))))))))

(assert (= (and d!86490 res!216088) b!257897))

(assert (= (and b!257897 res!216089) b!257898))

(declare-fun m!387397 () Bool)

(assert (=> d!86490 m!387397))

(declare-fun m!387399 () Bool)

(assert (=> d!86490 m!387399))

(assert (=> b!257850 d!86490))

(assert (=> b!257850 d!86476))

(declare-fun d!86492 () Bool)

(declare-fun e!178869 () Bool)

(assert (=> d!86492 e!178869))

(declare-fun res!216090 () Bool)

(assert (=> d!86492 (=> (not res!216090) (not e!178869))))

(declare-fun lt!399233 () (_ BitVec 64))

(declare-fun lt!399232 () (_ BitVec 64))

(declare-fun lt!399234 () (_ BitVec 64))

(assert (=> d!86492 (= res!216090 (= lt!399234 (bvsub lt!399232 lt!399233)))))

(assert (=> d!86492 (or (= (bvand lt!399232 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!399233 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!399232 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!399232 lt!399233) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!86492 (= lt!399233 (remainingBits!0 ((_ sign_extend 32) (size!6152 (buf!6674 thiss!1754))) ((_ sign_extend 32) (currentByte!12225 thiss!1754)) ((_ sign_extend 32) (currentBit!12220 thiss!1754))))))

(declare-fun lt!399229 () (_ BitVec 64))

(declare-fun lt!399230 () (_ BitVec 64))

(assert (=> d!86492 (= lt!399232 (bvmul lt!399229 lt!399230))))

(assert (=> d!86492 (or (= lt!399229 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!399230 (bvsdiv (bvmul lt!399229 lt!399230) lt!399229)))))

(assert (=> d!86492 (= lt!399230 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!86492 (= lt!399229 ((_ sign_extend 32) (size!6152 (buf!6674 thiss!1754))))))

(assert (=> d!86492 (= lt!399234 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12225 thiss!1754)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12220 thiss!1754))))))

(assert (=> d!86492 (invariant!0 (currentBit!12220 thiss!1754) (currentByte!12225 thiss!1754) (size!6152 (buf!6674 thiss!1754)))))

(assert (=> d!86492 (= (bitIndex!0 (size!6152 (buf!6674 thiss!1754)) (currentByte!12225 thiss!1754) (currentBit!12220 thiss!1754)) lt!399234)))

(declare-fun b!257899 () Bool)

(declare-fun res!216091 () Bool)

(assert (=> b!257899 (=> (not res!216091) (not e!178869))))

(assert (=> b!257899 (= res!216091 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!399234))))

(declare-fun b!257900 () Bool)

(declare-fun lt!399231 () (_ BitVec 64))

(assert (=> b!257900 (= e!178869 (bvsle lt!399234 (bvmul lt!399231 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!257900 (or (= lt!399231 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!399231 #b0000000000000000000000000000000000000000000000000000000000001000) lt!399231)))))

(assert (=> b!257900 (= lt!399231 ((_ sign_extend 32) (size!6152 (buf!6674 thiss!1754))))))

(assert (= (and d!86492 res!216090) b!257899))

(assert (= (and b!257899 res!216091) b!257900))

(assert (=> d!86492 m!387337))

(assert (=> d!86492 m!387339))

(assert (=> b!257850 d!86492))

(declare-fun d!86494 () Bool)

(declare-fun e!178870 () Bool)

(assert (=> d!86494 e!178870))

(declare-fun res!216092 () Bool)

(assert (=> d!86494 (=> (not res!216092) (not e!178870))))

(declare-fun lt!399239 () (_ BitVec 64))

(declare-fun lt!399240 () (_ BitVec 64))

(declare-fun lt!399238 () (_ BitVec 64))

(assert (=> d!86494 (= res!216092 (= lt!399240 (bvsub lt!399238 lt!399239)))))

(assert (=> d!86494 (or (= (bvand lt!399238 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!399239 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!399238 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!399238 lt!399239) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!86494 (= lt!399239 (remainingBits!0 ((_ sign_extend 32) (size!6152 (buf!6674 (_2!11969 lt!399073)))) ((_ sign_extend 32) (currentByte!12225 (_2!11969 lt!399073))) ((_ sign_extend 32) (currentBit!12220 (_2!11969 lt!399073)))))))

(declare-fun lt!399235 () (_ BitVec 64))

(declare-fun lt!399236 () (_ BitVec 64))

(assert (=> d!86494 (= lt!399238 (bvmul lt!399235 lt!399236))))

(assert (=> d!86494 (or (= lt!399235 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!399236 (bvsdiv (bvmul lt!399235 lt!399236) lt!399235)))))

(assert (=> d!86494 (= lt!399236 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!86494 (= lt!399235 ((_ sign_extend 32) (size!6152 (buf!6674 (_2!11969 lt!399073)))))))

(assert (=> d!86494 (= lt!399240 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12225 (_2!11969 lt!399073))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12220 (_2!11969 lt!399073)))))))

(assert (=> d!86494 (invariant!0 (currentBit!12220 (_2!11969 lt!399073)) (currentByte!12225 (_2!11969 lt!399073)) (size!6152 (buf!6674 (_2!11969 lt!399073))))))

(assert (=> d!86494 (= (bitIndex!0 (size!6152 (buf!6674 (_2!11969 lt!399073))) (currentByte!12225 (_2!11969 lt!399073)) (currentBit!12220 (_2!11969 lt!399073))) lt!399240)))

(declare-fun b!257901 () Bool)

(declare-fun res!216093 () Bool)

(assert (=> b!257901 (=> (not res!216093) (not e!178870))))

(assert (=> b!257901 (= res!216093 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!399240))))

(declare-fun b!257902 () Bool)

(declare-fun lt!399237 () (_ BitVec 64))

(assert (=> b!257902 (= e!178870 (bvsle lt!399240 (bvmul lt!399237 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!257902 (or (= lt!399237 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!399237 #b0000000000000000000000000000000000000000000000000000000000001000) lt!399237)))))

(assert (=> b!257902 (= lt!399237 ((_ sign_extend 32) (size!6152 (buf!6674 (_2!11969 lt!399073)))))))

(assert (= (and d!86494 res!216092) b!257901))

(assert (= (and b!257901 res!216093) b!257902))

(declare-fun m!387401 () Bool)

(assert (=> d!86494 m!387401))

(declare-fun m!387403 () Bool)

(assert (=> d!86494 m!387403))

(assert (=> b!257809 d!86494))

(declare-fun d!86496 () Bool)

(declare-fun e!178871 () Bool)

(assert (=> d!86496 e!178871))

(declare-fun res!216094 () Bool)

(assert (=> d!86496 (=> (not res!216094) (not e!178871))))

(declare-fun lt!399245 () (_ BitVec 64))

(declare-fun lt!399244 () (_ BitVec 64))

(declare-fun lt!399246 () (_ BitVec 64))

(assert (=> d!86496 (= res!216094 (= lt!399246 (bvsub lt!399244 lt!399245)))))

(assert (=> d!86496 (or (= (bvand lt!399244 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!399245 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!399244 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!399244 lt!399245) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!86496 (= lt!399245 (remainingBits!0 ((_ sign_extend 32) (size!6152 (buf!6674 (_2!11969 lt!398995)))) ((_ sign_extend 32) (currentByte!12225 (_2!11969 lt!398995))) ((_ sign_extend 32) (currentBit!12220 (_2!11969 lt!398995)))))))

(declare-fun lt!399241 () (_ BitVec 64))

(declare-fun lt!399242 () (_ BitVec 64))

(assert (=> d!86496 (= lt!399244 (bvmul lt!399241 lt!399242))))

(assert (=> d!86496 (or (= lt!399241 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!399242 (bvsdiv (bvmul lt!399241 lt!399242) lt!399241)))))

(assert (=> d!86496 (= lt!399242 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!86496 (= lt!399241 ((_ sign_extend 32) (size!6152 (buf!6674 (_2!11969 lt!398995)))))))

(assert (=> d!86496 (= lt!399246 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12225 (_2!11969 lt!398995))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12220 (_2!11969 lt!398995)))))))

(assert (=> d!86496 (invariant!0 (currentBit!12220 (_2!11969 lt!398995)) (currentByte!12225 (_2!11969 lt!398995)) (size!6152 (buf!6674 (_2!11969 lt!398995))))))

(assert (=> d!86496 (= (bitIndex!0 (size!6152 (buf!6674 (_2!11969 lt!398995))) (currentByte!12225 (_2!11969 lt!398995)) (currentBit!12220 (_2!11969 lt!398995))) lt!399246)))

(declare-fun b!257903 () Bool)

(declare-fun res!216095 () Bool)

(assert (=> b!257903 (=> (not res!216095) (not e!178871))))

(assert (=> b!257903 (= res!216095 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!399246))))

(declare-fun b!257904 () Bool)

(declare-fun lt!399243 () (_ BitVec 64))

(assert (=> b!257904 (= e!178871 (bvsle lt!399246 (bvmul lt!399243 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!257904 (or (= lt!399243 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!399243 #b0000000000000000000000000000000000000000000000000000000000001000) lt!399243)))))

(assert (=> b!257904 (= lt!399243 ((_ sign_extend 32) (size!6152 (buf!6674 (_2!11969 lt!398995)))))))

(assert (= (and d!86496 res!216094) b!257903))

(assert (= (and b!257903 res!216095) b!257904))

(assert (=> d!86496 m!387305))

(declare-fun m!387405 () Bool)

(assert (=> d!86496 m!387405))

(assert (=> b!257809 d!86496))

(assert (=> b!257812 d!86444))

(assert (=> d!86424 d!86494))

(assert (=> d!86424 d!86496))

(declare-fun d!86498 () Bool)

(declare-fun lt!399249 () tuple2!22066)

(assert (=> d!86498 (= lt!399249 (readBit!0 (_2!11969 lt!398995)))))

(assert (=> d!86498 (= (readBitPure!0 (_2!11969 lt!398995)) (tuple2!22071 (_2!11969 lt!399249) (_1!11969 lt!399249)))))

(declare-fun bs!21891 () Bool)

(assert (= bs!21891 d!86498))

(assert (=> bs!21891 m!387293))

(assert (=> b!257801 d!86498))

(check-sat (not d!86478) (not d!86496) (not b!257888) (not d!86490) (not b!257889) (not d!86492) (not b!257891) (not d!86476) (not b!257892) (not b!257880) (not d!86498) (not d!86484) (not d!86480) (not d!86472) (not b!257882) (not d!86486) (not b!257883) (not d!86482) (not d!86494))
