; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2858 () Bool)

(assert start!2858)

(declare-fun b!13329 () Bool)

(declare-fun e!8158 () Bool)

(declare-fun e!8157 () Bool)

(assert (=> b!13329 (= e!8158 (not e!8157))))

(declare-fun res!12645 () Bool)

(assert (=> b!13329 (=> res!12645 e!8157)))

(declare-datatypes ((array!750 0))(
  ( (array!751 (arr!754 (Array (_ BitVec 32) (_ BitVec 8))) (size!325 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!610 0))(
  ( (BitStream!611 (buf!676 array!750) (currentByte!1775 (_ BitVec 32)) (currentBit!1770 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!1115 0))(
  ( (Unit!1116) )
))
(declare-datatypes ((tuple2!1580 0))(
  ( (tuple2!1581 (_1!845 Unit!1115) (_2!845 BitStream!610)) )
))
(declare-fun lt!21017 () tuple2!1580)

(declare-fun thiss!957 () BitStream!610)

(assert (=> b!13329 (= res!12645 (not (= (size!325 (buf!676 (_2!845 lt!21017))) (size!325 (buf!676 thiss!957)))))))

(declare-fun e!8160 () Bool)

(assert (=> b!13329 e!8160))

(declare-fun res!12649 () Bool)

(assert (=> b!13329 (=> (not res!12649) (not e!8160))))

(assert (=> b!13329 (= res!12649 (= (size!325 (buf!676 thiss!957)) (size!325 (buf!676 (_2!845 lt!21017)))))))

(declare-fun appendBit!0 (BitStream!610 Bool) tuple2!1580)

(assert (=> b!13329 (= lt!21017 (appendBit!0 thiss!957 false))))

(declare-fun b!13330 () Bool)

(declare-fun res!12646 () Bool)

(declare-fun e!8162 () Bool)

(assert (=> b!13330 (=> (not res!12646) (not e!8162))))

(declare-fun isPrefixOf!0 (BitStream!610 BitStream!610) Bool)

(assert (=> b!13330 (= res!12646 (isPrefixOf!0 thiss!957 (_2!845 lt!21017)))))

(declare-fun b!13331 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!13331 (= e!8157 (invariant!0 (currentBit!1770 thiss!957) (currentByte!1775 thiss!957) (size!325 (buf!676 thiss!957))))))

(declare-fun b!13332 () Bool)

(declare-fun e!8161 () Bool)

(declare-fun array_inv!314 (array!750) Bool)

(assert (=> b!13332 (= e!8161 (array_inv!314 (buf!676 thiss!957)))))

(declare-fun b!13333 () Bool)

(declare-fun e!8156 () Bool)

(assert (=> b!13333 (= e!8162 e!8156)))

(declare-fun res!12644 () Bool)

(assert (=> b!13333 (=> (not res!12644) (not e!8156))))

(declare-datatypes ((tuple2!1582 0))(
  ( (tuple2!1583 (_1!846 BitStream!610) (_2!846 Bool)) )
))
(declare-fun lt!21016 () tuple2!1582)

(assert (=> b!13333 (= res!12644 (and (not (_2!846 lt!21016)) (= (_1!846 lt!21016) (_2!845 lt!21017))))))

(declare-fun readBitPure!0 (BitStream!610) tuple2!1582)

(declare-fun readerFrom!0 (BitStream!610 (_ BitVec 32) (_ BitVec 32)) BitStream!610)

(assert (=> b!13333 (= lt!21016 (readBitPure!0 (readerFrom!0 (_2!845 lt!21017) (currentBit!1770 thiss!957) (currentByte!1775 thiss!957))))))

(declare-fun b!13334 () Bool)

(assert (=> b!13334 (= e!8160 e!8162)))

(declare-fun res!12648 () Bool)

(assert (=> b!13334 (=> (not res!12648) (not e!8162))))

(declare-fun lt!21014 () (_ BitVec 64))

(declare-fun lt!21015 () (_ BitVec 64))

(assert (=> b!13334 (= res!12648 (= lt!21014 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!21015)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!13334 (= lt!21014 (bitIndex!0 (size!325 (buf!676 (_2!845 lt!21017))) (currentByte!1775 (_2!845 lt!21017)) (currentBit!1770 (_2!845 lt!21017))))))

(assert (=> b!13334 (= lt!21015 (bitIndex!0 (size!325 (buf!676 thiss!957)) (currentByte!1775 thiss!957) (currentBit!1770 thiss!957)))))

(declare-fun res!12647 () Bool)

(assert (=> start!2858 (=> (not res!12647) (not e!8158))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!2858 (= res!12647 (validate_offset_bit!0 ((_ sign_extend 32) (size!325 (buf!676 thiss!957))) ((_ sign_extend 32) (currentByte!1775 thiss!957)) ((_ sign_extend 32) (currentBit!1770 thiss!957))))))

(assert (=> start!2858 e!8158))

(declare-fun inv!12 (BitStream!610) Bool)

(assert (=> start!2858 (and (inv!12 thiss!957) e!8161)))

(declare-fun b!13335 () Bool)

(assert (=> b!13335 (= e!8156 (= (bitIndex!0 (size!325 (buf!676 (_1!846 lt!21016))) (currentByte!1775 (_1!846 lt!21016)) (currentBit!1770 (_1!846 lt!21016))) lt!21014))))

(assert (= (and start!2858 res!12647) b!13329))

(assert (= (and b!13329 res!12649) b!13334))

(assert (= (and b!13334 res!12648) b!13330))

(assert (= (and b!13330 res!12646) b!13333))

(assert (= (and b!13333 res!12644) b!13335))

(assert (= (and b!13329 (not res!12645)) b!13331))

(assert (= start!2858 b!13332))

(declare-fun m!19965 () Bool)

(assert (=> b!13334 m!19965))

(declare-fun m!19967 () Bool)

(assert (=> b!13334 m!19967))

(declare-fun m!19969 () Bool)

(assert (=> b!13331 m!19969))

(declare-fun m!19971 () Bool)

(assert (=> b!13335 m!19971))

(declare-fun m!19973 () Bool)

(assert (=> b!13330 m!19973))

(declare-fun m!19975 () Bool)

(assert (=> b!13332 m!19975))

(declare-fun m!19977 () Bool)

(assert (=> b!13333 m!19977))

(assert (=> b!13333 m!19977))

(declare-fun m!19979 () Bool)

(assert (=> b!13333 m!19979))

(declare-fun m!19981 () Bool)

(assert (=> start!2858 m!19981))

(declare-fun m!19983 () Bool)

(assert (=> start!2858 m!19983))

(declare-fun m!19985 () Bool)

(assert (=> b!13329 m!19985))

(push 1)

(assert (not b!13334))

(assert (not start!2858))

(assert (not b!13331))

(assert (not b!13332))

(assert (not b!13335))

(assert (not b!13333))

(assert (not b!13330))

(assert (not b!13329))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!4296 () Bool)

(declare-datatypes ((tuple2!1592 0))(
  ( (tuple2!1593 (_1!851 Bool) (_2!851 BitStream!610)) )
))
(declare-fun lt!21044 () tuple2!1592)

(declare-fun readBit!0 (BitStream!610) tuple2!1592)

(assert (=> d!4296 (= lt!21044 (readBit!0 (readerFrom!0 (_2!845 lt!21017) (currentBit!1770 thiss!957) (currentByte!1775 thiss!957))))))

(assert (=> d!4296 (= (readBitPure!0 (readerFrom!0 (_2!845 lt!21017) (currentBit!1770 thiss!957) (currentByte!1775 thiss!957))) (tuple2!1583 (_2!851 lt!21044) (_1!851 lt!21044)))))

(declare-fun bs!1204 () Bool)

(assert (= bs!1204 d!4296))

(assert (=> bs!1204 m!19977))

(declare-fun m!20031 () Bool)

(assert (=> bs!1204 m!20031))

(assert (=> b!13333 d!4296))

(declare-fun d!4298 () Bool)

(declare-fun e!8207 () Bool)

(assert (=> d!4298 e!8207))

(declare-fun res!12689 () Bool)

(assert (=> d!4298 (=> (not res!12689) (not e!8207))))

(assert (=> d!4298 (= res!12689 (invariant!0 (currentBit!1770 (_2!845 lt!21017)) (currentByte!1775 (_2!845 lt!21017)) (size!325 (buf!676 (_2!845 lt!21017)))))))

(assert (=> d!4298 (= (readerFrom!0 (_2!845 lt!21017) (currentBit!1770 thiss!957) (currentByte!1775 thiss!957)) (BitStream!611 (buf!676 (_2!845 lt!21017)) (currentByte!1775 thiss!957) (currentBit!1770 thiss!957)))))

(declare-fun b!13380 () Bool)

(assert (=> b!13380 (= e!8207 (invariant!0 (currentBit!1770 thiss!957) (currentByte!1775 thiss!957) (size!325 (buf!676 (_2!845 lt!21017)))))))

(assert (= (and d!4298 res!12689) b!13380))

(declare-fun m!20033 () Bool)

(assert (=> d!4298 m!20033))

(declare-fun m!20035 () Bool)

(assert (=> b!13380 m!20035))

(assert (=> b!13333 d!4298))

(declare-fun b!13402 () Bool)

(declare-fun e!8218 () Bool)

(declare-fun e!8219 () Bool)

(assert (=> b!13402 (= e!8218 e!8219)))

(declare-fun res!12712 () Bool)

(assert (=> b!13402 (=> (not res!12712) (not e!8219))))

(declare-fun lt!21078 () tuple2!1582)

(declare-fun lt!21079 () tuple2!1580)

(assert (=> b!13402 (= res!12712 (and (= (_2!846 lt!21078) false) (= (_1!846 lt!21078) (_2!845 lt!21079))))))

(assert (=> b!13402 (= lt!21078 (readBitPure!0 (readerFrom!0 (_2!845 lt!21079) (currentBit!1770 thiss!957) (currentByte!1775 thiss!957))))))

(declare-fun b!13400 () Bool)

(declare-fun res!12713 () Bool)

(assert (=> b!13400 (=> (not res!12713) (not e!8218))))

(declare-fun lt!21077 () (_ BitVec 64))

(declare-fun lt!21080 () (_ BitVec 64))

(assert (=> b!13400 (= res!12713 (= (bitIndex!0 (size!325 (buf!676 (_2!845 lt!21079))) (currentByte!1775 (_2!845 lt!21079)) (currentBit!1770 (_2!845 lt!21079))) (bvadd lt!21080 lt!21077)))))

(assert (=> b!13400 (or (not (= (bvand lt!21080 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!21077 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!21080 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!21080 lt!21077) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!13400 (= lt!21077 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!13400 (= lt!21080 (bitIndex!0 (size!325 (buf!676 thiss!957)) (currentByte!1775 thiss!957) (currentBit!1770 thiss!957)))))

(declare-fun d!4300 () Bool)

(assert (=> d!4300 e!8218))

(declare-fun res!12711 () Bool)

(assert (=> d!4300 (=> (not res!12711) (not e!8218))))

(assert (=> d!4300 (= res!12711 (= (size!325 (buf!676 thiss!957)) (size!325 (buf!676 (_2!845 lt!21079)))))))

(declare-fun choose!16 (BitStream!610 Bool) tuple2!1580)

(assert (=> d!4300 (= lt!21079 (choose!16 thiss!957 false))))

(assert (=> d!4300 (validate_offset_bit!0 ((_ sign_extend 32) (size!325 (buf!676 thiss!957))) ((_ sign_extend 32) (currentByte!1775 thiss!957)) ((_ sign_extend 32) (currentBit!1770 thiss!957)))))

(assert (=> d!4300 (= (appendBit!0 thiss!957 false) lt!21079)))

(declare-fun b!13403 () Bool)

(assert (=> b!13403 (= e!8219 (= (bitIndex!0 (size!325 (buf!676 (_1!846 lt!21078))) (currentByte!1775 (_1!846 lt!21078)) (currentBit!1770 (_1!846 lt!21078))) (bitIndex!0 (size!325 (buf!676 (_2!845 lt!21079))) (currentByte!1775 (_2!845 lt!21079)) (currentBit!1770 (_2!845 lt!21079)))))))

(declare-fun b!13401 () Bool)

(declare-fun res!12710 () Bool)

(assert (=> b!13401 (=> (not res!12710) (not e!8218))))

(assert (=> b!13401 (= res!12710 (isPrefixOf!0 thiss!957 (_2!845 lt!21079)))))

(assert (= (and d!4300 res!12711) b!13400))

(assert (= (and b!13400 res!12713) b!13401))

(assert (= (and b!13401 res!12710) b!13402))

(assert (= (and b!13402 res!12712) b!13403))

(declare-fun m!20043 () Bool)

(assert (=> b!13403 m!20043))

(declare-fun m!20045 () Bool)

(assert (=> b!13403 m!20045))

(assert (=> b!13400 m!20045))

(assert (=> b!13400 m!19967))

(declare-fun m!20047 () Bool)

(assert (=> b!13402 m!20047))

(assert (=> b!13402 m!20047))

(declare-fun m!20049 () Bool)

(assert (=> b!13402 m!20049))

(declare-fun m!20051 () Bool)

(assert (=> b!13401 m!20051))

(declare-fun m!20053 () Bool)

(assert (=> d!4300 m!20053))

(assert (=> d!4300 m!19981))

(assert (=> b!13329 d!4300))

(declare-fun d!4318 () Bool)

(declare-fun e!8232 () Bool)

(assert (=> d!4318 e!8232))

(declare-fun res!12735 () Bool)

(assert (=> d!4318 (=> (not res!12735) (not e!8232))))

(declare-fun lt!21105 () (_ BitVec 64))

(declare-fun lt!21106 () (_ BitVec 64))

(declare-fun lt!21107 () (_ BitVec 64))

(assert (=> d!4318 (= res!12735 (= lt!21107 (bvsub lt!21105 lt!21106)))))

(assert (=> d!4318 (or (= (bvand lt!21105 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!21106 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!21105 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!21105 lt!21106) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!4318 (= lt!21106 (remainingBits!0 ((_ sign_extend 32) (size!325 (buf!676 (_2!845 lt!21017)))) ((_ sign_extend 32) (currentByte!1775 (_2!845 lt!21017))) ((_ sign_extend 32) (currentBit!1770 (_2!845 lt!21017)))))))

(declare-fun lt!21109 () (_ BitVec 64))

(declare-fun lt!21110 () (_ BitVec 64))

(assert (=> d!4318 (= lt!21105 (bvmul lt!21109 lt!21110))))

(assert (=> d!4318 (or (= lt!21109 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!21110 (bvsdiv (bvmul lt!21109 lt!21110) lt!21109)))))

(assert (=> d!4318 (= lt!21110 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!4318 (= lt!21109 ((_ sign_extend 32) (size!325 (buf!676 (_2!845 lt!21017)))))))

(assert (=> d!4318 (= lt!21107 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1775 (_2!845 lt!21017))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1770 (_2!845 lt!21017)))))))

(assert (=> d!4318 (invariant!0 (currentBit!1770 (_2!845 lt!21017)) (currentByte!1775 (_2!845 lt!21017)) (size!325 (buf!676 (_2!845 lt!21017))))))

(assert (=> d!4318 (= (bitIndex!0 (size!325 (buf!676 (_2!845 lt!21017))) (currentByte!1775 (_2!845 lt!21017)) (currentBit!1770 (_2!845 lt!21017))) lt!21107)))

(declare-fun b!13428 () Bool)

(declare-fun res!12736 () Bool)

(assert (=> b!13428 (=> (not res!12736) (not e!8232))))

(assert (=> b!13428 (= res!12736 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!21107))))

(declare-fun b!13429 () Bool)

(declare-fun lt!21108 () (_ BitVec 64))

(assert (=> b!13429 (= e!8232 (bvsle lt!21107 (bvmul lt!21108 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!13429 (or (= lt!21108 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!21108 #b0000000000000000000000000000000000000000000000000000000000001000) lt!21108)))))

(assert (=> b!13429 (= lt!21108 ((_ sign_extend 32) (size!325 (buf!676 (_2!845 lt!21017)))))))

(assert (= (and d!4318 res!12735) b!13428))

(assert (= (and b!13428 res!12736) b!13429))

(declare-fun m!20069 () Bool)

(assert (=> d!4318 m!20069))

(assert (=> d!4318 m!20033))

(assert (=> b!13334 d!4318))

(declare-fun d!4324 () Bool)

(declare-fun e!8233 () Bool)

(assert (=> d!4324 e!8233))

(declare-fun res!12737 () Bool)

(assert (=> d!4324 (=> (not res!12737) (not e!8233))))

(declare-fun lt!21111 () (_ BitVec 64))

(declare-fun lt!21112 () (_ BitVec 64))

(declare-fun lt!21113 () (_ BitVec 64))

(assert (=> d!4324 (= res!12737 (= lt!21113 (bvsub lt!21111 lt!21112)))))

(assert (=> d!4324 (or (= (bvand lt!21111 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!21112 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!21111 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!21111 lt!21112) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!4324 (= lt!21112 (remainingBits!0 ((_ sign_extend 32) (size!325 (buf!676 thiss!957))) ((_ sign_extend 32) (currentByte!1775 thiss!957)) ((_ sign_extend 32) (currentBit!1770 thiss!957))))))

(declare-fun lt!21115 () (_ BitVec 64))

(declare-fun lt!21116 () (_ BitVec 64))

(assert (=> d!4324 (= lt!21111 (bvmul lt!21115 lt!21116))))

(assert (=> d!4324 (or (= lt!21115 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!21116 (bvsdiv (bvmul lt!21115 lt!21116) lt!21115)))))

(assert (=> d!4324 (= lt!21116 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!4324 (= lt!21115 ((_ sign_extend 32) (size!325 (buf!676 thiss!957))))))

(assert (=> d!4324 (= lt!21113 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1775 thiss!957)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1770 thiss!957))))))

(assert (=> d!4324 (invariant!0 (currentBit!1770 thiss!957) (currentByte!1775 thiss!957) (size!325 (buf!676 thiss!957)))))

(assert (=> d!4324 (= (bitIndex!0 (size!325 (buf!676 thiss!957)) (currentByte!1775 thiss!957) (currentBit!1770 thiss!957)) lt!21113)))

(declare-fun b!13430 () Bool)

(declare-fun res!12738 () Bool)

(assert (=> b!13430 (=> (not res!12738) (not e!8233))))

(assert (=> b!13430 (= res!12738 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!21113))))

(declare-fun b!13431 () Bool)

(declare-fun lt!21114 () (_ BitVec 64))

(assert (=> b!13431 (= e!8233 (bvsle lt!21113 (bvmul lt!21114 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!13431 (or (= lt!21114 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!21114 #b0000000000000000000000000000000000000000000000000000000000001000) lt!21114)))))

(assert (=> b!13431 (= lt!21114 ((_ sign_extend 32) (size!325 (buf!676 thiss!957))))))

(assert (= (and d!4324 res!12737) b!13430))

(assert (= (and b!13430 res!12738) b!13431))

(declare-fun m!20071 () Bool)

(assert (=> d!4324 m!20071))

(assert (=> d!4324 m!19969))

(assert (=> b!13334 d!4324))

(declare-fun d!4326 () Bool)

(declare-fun e!8234 () Bool)

(assert (=> d!4326 e!8234))

(declare-fun res!12739 () Bool)

(assert (=> d!4326 (=> (not res!12739) (not e!8234))))

(declare-fun lt!21119 () (_ BitVec 64))

(declare-fun lt!21117 () (_ BitVec 64))

(declare-fun lt!21118 () (_ BitVec 64))

(assert (=> d!4326 (= res!12739 (= lt!21119 (bvsub lt!21117 lt!21118)))))

(assert (=> d!4326 (or (= (bvand lt!21117 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!21118 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!21117 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!21117 lt!21118) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!4326 (= lt!21118 (remainingBits!0 ((_ sign_extend 32) (size!325 (buf!676 (_1!846 lt!21016)))) ((_ sign_extend 32) (currentByte!1775 (_1!846 lt!21016))) ((_ sign_extend 32) (currentBit!1770 (_1!846 lt!21016)))))))

(declare-fun lt!21121 () (_ BitVec 64))

(declare-fun lt!21122 () (_ BitVec 64))

(assert (=> d!4326 (= lt!21117 (bvmul lt!21121 lt!21122))))

(assert (=> d!4326 (or (= lt!21121 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!21122 (bvsdiv (bvmul lt!21121 lt!21122) lt!21121)))))

(assert (=> d!4326 (= lt!21122 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!4326 (= lt!21121 ((_ sign_extend 32) (size!325 (buf!676 (_1!846 lt!21016)))))))

(assert (=> d!4326 (= lt!21119 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1775 (_1!846 lt!21016))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1770 (_1!846 lt!21016)))))))

(assert (=> d!4326 (invariant!0 (currentBit!1770 (_1!846 lt!21016)) (currentByte!1775 (_1!846 lt!21016)) (size!325 (buf!676 (_1!846 lt!21016))))))

(assert (=> d!4326 (= (bitIndex!0 (size!325 (buf!676 (_1!846 lt!21016))) (currentByte!1775 (_1!846 lt!21016)) (currentBit!1770 (_1!846 lt!21016))) lt!21119)))

(declare-fun b!13432 () Bool)

(declare-fun res!12740 () Bool)

(assert (=> b!13432 (=> (not res!12740) (not e!8234))))

(assert (=> b!13432 (= res!12740 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!21119))))

(declare-fun b!13433 () Bool)

(declare-fun lt!21120 () (_ BitVec 64))

(assert (=> b!13433 (= e!8234 (bvsle lt!21119 (bvmul lt!21120 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!13433 (or (= lt!21120 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!21120 #b0000000000000000000000000000000000000000000000000000000000001000) lt!21120)))))

(assert (=> b!13433 (= lt!21120 ((_ sign_extend 32) (size!325 (buf!676 (_1!846 lt!21016)))))))

(assert (= (and d!4326 res!12739) b!13432))

(assert (= (and b!13432 res!12740) b!13433))

(declare-fun m!20073 () Bool)

(assert (=> d!4326 m!20073))

(declare-fun m!20075 () Bool)

(assert (=> d!4326 m!20075))

(assert (=> b!13335 d!4326))

(declare-fun d!4328 () Bool)

(declare-fun res!12755 () Bool)

(declare-fun e!8242 () Bool)

(assert (=> d!4328 (=> (not res!12755) (not e!8242))))

(assert (=> d!4328 (= res!12755 (= (size!325 (buf!676 thiss!957)) (size!325 (buf!676 (_2!845 lt!21017)))))))

(assert (=> d!4328 (= (isPrefixOf!0 thiss!957 (_2!845 lt!21017)) e!8242)))

(declare-fun b!13447 () Bool)

(declare-fun res!12753 () Bool)

(assert (=> b!13447 (=> (not res!12753) (not e!8242))))

(assert (=> b!13447 (= res!12753 (bvsle (bitIndex!0 (size!325 (buf!676 thiss!957)) (currentByte!1775 thiss!957) (currentBit!1770 thiss!957)) (bitIndex!0 (size!325 (buf!676 (_2!845 lt!21017))) (currentByte!1775 (_2!845 lt!21017)) (currentBit!1770 (_2!845 lt!21017)))))))

(declare-fun b!13448 () Bool)

(declare-fun e!8241 () Bool)

(assert (=> b!13448 (= e!8242 e!8241)))

(declare-fun res!12754 () Bool)

(assert (=> b!13448 (=> res!12754 e!8241)))

(assert (=> b!13448 (= res!12754 (= (size!325 (buf!676 thiss!957)) #b00000000000000000000000000000000))))

(declare-fun b!13449 () Bool)

(declare-fun arrayBitRangesEq!0 (array!750 array!750 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!13449 (= e!8241 (arrayBitRangesEq!0 (buf!676 thiss!957) (buf!676 (_2!845 lt!21017)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!325 (buf!676 thiss!957)) (currentByte!1775 thiss!957) (currentBit!1770 thiss!957))))))

(assert (= (and d!4328 res!12755) b!13447))

(assert (= (and b!13447 res!12753) b!13448))

(assert (= (and b!13448 (not res!12754)) b!13449))

(assert (=> b!13447 m!19967))

(assert (=> b!13447 m!19965))

(assert (=> b!13449 m!19967))

(assert (=> b!13449 m!19967))

(declare-fun m!20077 () Bool)

(assert (=> b!13449 m!20077))

(assert (=> b!13330 d!4328))

(declare-fun d!4330 () Bool)

(assert (=> d!4330 (= (invariant!0 (currentBit!1770 thiss!957) (currentByte!1775 thiss!957) (size!325 (buf!676 thiss!957))) (and (bvsge (currentBit!1770 thiss!957) #b00000000000000000000000000000000) (bvslt (currentBit!1770 thiss!957) #b00000000000000000000000000001000) (bvsge (currentByte!1775 thiss!957) #b00000000000000000000000000000000) (or (bvslt (currentByte!1775 thiss!957) (size!325 (buf!676 thiss!957))) (and (= (currentBit!1770 thiss!957) #b00000000000000000000000000000000) (= (currentByte!1775 thiss!957) (size!325 (buf!676 thiss!957)))))))))

(assert (=> b!13331 d!4330))

(declare-fun d!4332 () Bool)

(assert (=> d!4332 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!325 (buf!676 thiss!957))) ((_ sign_extend 32) (currentByte!1775 thiss!957)) ((_ sign_extend 32) (currentBit!1770 thiss!957))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!325 (buf!676 thiss!957))) ((_ sign_extend 32) (currentByte!1775 thiss!957)) ((_ sign_extend 32) (currentBit!1770 thiss!957))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!1207 () Bool)

(assert (= bs!1207 d!4332))

(assert (=> bs!1207 m!20071))

(assert (=> start!2858 d!4332))

(declare-fun d!4334 () Bool)

(assert (=> d!4334 (= (inv!12 thiss!957) (invariant!0 (currentBit!1770 thiss!957) (currentByte!1775 thiss!957) (size!325 (buf!676 thiss!957))))))

(declare-fun bs!1208 () Bool)

(assert (= bs!1208 d!4334))

(assert (=> bs!1208 m!19969))

(assert (=> start!2858 d!4334))

(declare-fun d!4338 () Bool)

(assert (=> d!4338 (= (array_inv!314 (buf!676 thiss!957)) (bvsge (size!325 (buf!676 thiss!957)) #b00000000000000000000000000000000))))

(assert (=> b!13332 d!4338))

(push 1)

(assert (not d!4318))

(assert (not d!4300))

(assert (not b!13449))

(assert (not d!4324))

(assert (not d!4298))

(assert (not d!4326))

(assert (not d!4332))

(assert (not d!4334))

(assert (not b!13380))

(assert (not b!13400))

(assert (not b!13402))

(assert (not d!4296))

(assert (not b!13401))

(assert (not b!13447))

(assert (not b!13403))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

