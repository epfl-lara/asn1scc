; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2798 () Bool)

(assert start!2798)

(declare-fun b!13161 () Bool)

(declare-fun e!8037 () Bool)

(declare-fun e!8035 () Bool)

(assert (=> b!13161 (= e!8037 e!8035)))

(declare-fun res!12485 () Bool)

(assert (=> b!13161 (=> (not res!12485) (not e!8035))))

(declare-datatypes ((array!741 0))(
  ( (array!742 (arr!751 (Array (_ BitVec 32) (_ BitVec 8))) (size!322 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!604 0))(
  ( (BitStream!605 (buf!673 array!741) (currentByte!1763 (_ BitVec 32)) (currentBit!1758 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!1564 0))(
  ( (tuple2!1565 (_1!837 BitStream!604) (_2!837 Bool)) )
))
(declare-fun lt!20846 () tuple2!1564)

(declare-datatypes ((Unit!1109 0))(
  ( (Unit!1110) )
))
(declare-datatypes ((tuple2!1566 0))(
  ( (tuple2!1567 (_1!838 Unit!1109) (_2!838 BitStream!604)) )
))
(declare-fun lt!20843 () tuple2!1566)

(assert (=> b!13161 (= res!12485 (and (not (_2!837 lt!20846)) (= (_1!837 lt!20846) (_2!838 lt!20843))))))

(declare-fun thiss!957 () BitStream!604)

(declare-fun readBitPure!0 (BitStream!604) tuple2!1564)

(declare-fun readerFrom!0 (BitStream!604 (_ BitVec 32) (_ BitVec 32)) BitStream!604)

(assert (=> b!13161 (= lt!20846 (readBitPure!0 (readerFrom!0 (_2!838 lt!20843) (currentBit!1758 thiss!957) (currentByte!1763 thiss!957))))))

(declare-fun b!13162 () Bool)

(declare-fun e!8038 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!13162 (= e!8038 (invariant!0 (currentBit!1758 (_2!838 lt!20843)) (currentByte!1763 (_2!838 lt!20843)) (size!322 (buf!673 (_2!838 lt!20843)))))))

(declare-fun b!13163 () Bool)

(declare-fun e!8036 () Bool)

(assert (=> b!13163 (= e!8036 e!8037)))

(declare-fun res!12487 () Bool)

(assert (=> b!13163 (=> (not res!12487) (not e!8037))))

(declare-fun lt!20844 () (_ BitVec 64))

(declare-fun lt!20845 () (_ BitVec 64))

(assert (=> b!13163 (= res!12487 (= lt!20844 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!20845)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!13163 (= lt!20844 (bitIndex!0 (size!322 (buf!673 (_2!838 lt!20843))) (currentByte!1763 (_2!838 lt!20843)) (currentBit!1758 (_2!838 lt!20843))))))

(assert (=> b!13163 (= lt!20845 (bitIndex!0 (size!322 (buf!673 thiss!957)) (currentByte!1763 thiss!957) (currentBit!1758 thiss!957)))))

(declare-fun b!13164 () Bool)

(declare-fun e!8033 () Bool)

(assert (=> b!13164 (= e!8033 (not e!8038))))

(declare-fun res!12488 () Bool)

(assert (=> b!13164 (=> res!12488 e!8038)))

(assert (=> b!13164 (= res!12488 (not (= (size!322 (buf!673 (_2!838 lt!20843))) (size!322 (buf!673 thiss!957)))))))

(assert (=> b!13164 e!8036))

(declare-fun res!12489 () Bool)

(assert (=> b!13164 (=> (not res!12489) (not e!8036))))

(assert (=> b!13164 (= res!12489 (= (size!322 (buf!673 thiss!957)) (size!322 (buf!673 (_2!838 lt!20843)))))))

(declare-fun appendBit!0 (BitStream!604 Bool) tuple2!1566)

(assert (=> b!13164 (= lt!20843 (appendBit!0 thiss!957 false))))

(declare-fun res!12490 () Bool)

(assert (=> start!2798 (=> (not res!12490) (not e!8033))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!2798 (= res!12490 (validate_offset_bit!0 ((_ sign_extend 32) (size!322 (buf!673 thiss!957))) ((_ sign_extend 32) (currentByte!1763 thiss!957)) ((_ sign_extend 32) (currentBit!1758 thiss!957))))))

(assert (=> start!2798 e!8033))

(declare-fun e!8039 () Bool)

(declare-fun inv!12 (BitStream!604) Bool)

(assert (=> start!2798 (and (inv!12 thiss!957) e!8039)))

(declare-fun b!13165 () Bool)

(assert (=> b!13165 (= e!8035 (= (bitIndex!0 (size!322 (buf!673 (_1!837 lt!20846))) (currentByte!1763 (_1!837 lt!20846)) (currentBit!1758 (_1!837 lt!20846))) lt!20844))))

(declare-fun b!13166 () Bool)

(declare-fun res!12486 () Bool)

(assert (=> b!13166 (=> (not res!12486) (not e!8037))))

(declare-fun isPrefixOf!0 (BitStream!604 BitStream!604) Bool)

(assert (=> b!13166 (= res!12486 (isPrefixOf!0 thiss!957 (_2!838 lt!20843)))))

(declare-fun b!13167 () Bool)

(declare-fun array_inv!311 (array!741) Bool)

(assert (=> b!13167 (= e!8039 (array_inv!311 (buf!673 thiss!957)))))

(assert (= (and start!2798 res!12490) b!13164))

(assert (= (and b!13164 res!12489) b!13163))

(assert (= (and b!13163 res!12487) b!13166))

(assert (= (and b!13166 res!12486) b!13161))

(assert (= (and b!13161 res!12485) b!13165))

(assert (= (and b!13164 (not res!12488)) b!13162))

(assert (= start!2798 b!13167))

(declare-fun m!19815 () Bool)

(assert (=> b!13163 m!19815))

(declare-fun m!19817 () Bool)

(assert (=> b!13163 m!19817))

(declare-fun m!19819 () Bool)

(assert (=> b!13166 m!19819))

(declare-fun m!19821 () Bool)

(assert (=> b!13162 m!19821))

(declare-fun m!19823 () Bool)

(assert (=> b!13167 m!19823))

(declare-fun m!19825 () Bool)

(assert (=> start!2798 m!19825))

(declare-fun m!19827 () Bool)

(assert (=> start!2798 m!19827))

(declare-fun m!19829 () Bool)

(assert (=> b!13165 m!19829))

(declare-fun m!19831 () Bool)

(assert (=> b!13164 m!19831))

(declare-fun m!19833 () Bool)

(assert (=> b!13161 m!19833))

(assert (=> b!13161 m!19833))

(declare-fun m!19835 () Bool)

(assert (=> b!13161 m!19835))

(push 1)

(assert (not start!2798))

(assert (not b!13167))

(assert (not b!13165))

(assert (not b!13164))

(assert (not b!13163))

(assert (not b!13162))

(assert (not b!13161))

(assert (not b!13166))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!4234 () Bool)

(assert (=> d!4234 (= (invariant!0 (currentBit!1758 (_2!838 lt!20843)) (currentByte!1763 (_2!838 lt!20843)) (size!322 (buf!673 (_2!838 lt!20843)))) (and (bvsge (currentBit!1758 (_2!838 lt!20843)) #b00000000000000000000000000000000) (bvslt (currentBit!1758 (_2!838 lt!20843)) #b00000000000000000000000000001000) (bvsge (currentByte!1763 (_2!838 lt!20843)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1763 (_2!838 lt!20843)) (size!322 (buf!673 (_2!838 lt!20843)))) (and (= (currentBit!1758 (_2!838 lt!20843)) #b00000000000000000000000000000000) (= (currentByte!1763 (_2!838 lt!20843)) (size!322 (buf!673 (_2!838 lt!20843))))))))))

(assert (=> b!13162 d!4234))

(declare-fun d!4236 () Bool)

(assert (=> d!4236 (= (array_inv!311 (buf!673 thiss!957)) (bvsge (size!322 (buf!673 thiss!957)) #b00000000000000000000000000000000))))

(assert (=> b!13167 d!4236))

(declare-fun d!4238 () Bool)

(declare-fun e!8096 () Bool)

(assert (=> d!4238 e!8096))

(declare-fun res!12552 () Bool)

(assert (=> d!4238 (=> (not res!12552) (not e!8096))))

(declare-fun lt!20900 () (_ BitVec 64))

(declare-fun lt!20897 () (_ BitVec 64))

(declare-fun lt!20895 () (_ BitVec 64))

(assert (=> d!4238 (= res!12552 (= lt!20895 (bvsub lt!20897 lt!20900)))))

(assert (=> d!4238 (or (= (bvand lt!20897 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!20900 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!20897 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!20897 lt!20900) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!4238 (= lt!20900 (remainingBits!0 ((_ sign_extend 32) (size!322 (buf!673 (_2!838 lt!20843)))) ((_ sign_extend 32) (currentByte!1763 (_2!838 lt!20843))) ((_ sign_extend 32) (currentBit!1758 (_2!838 lt!20843)))))))

(declare-fun lt!20898 () (_ BitVec 64))

(declare-fun lt!20899 () (_ BitVec 64))

(assert (=> d!4238 (= lt!20897 (bvmul lt!20898 lt!20899))))

(assert (=> d!4238 (or (= lt!20898 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!20899 (bvsdiv (bvmul lt!20898 lt!20899) lt!20898)))))

(assert (=> d!4238 (= lt!20899 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!4238 (= lt!20898 ((_ sign_extend 32) (size!322 (buf!673 (_2!838 lt!20843)))))))

(assert (=> d!4238 (= lt!20895 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1763 (_2!838 lt!20843))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1758 (_2!838 lt!20843)))))))

(assert (=> d!4238 (invariant!0 (currentBit!1758 (_2!838 lt!20843)) (currentByte!1763 (_2!838 lt!20843)) (size!322 (buf!673 (_2!838 lt!20843))))))

(assert (=> d!4238 (= (bitIndex!0 (size!322 (buf!673 (_2!838 lt!20843))) (currentByte!1763 (_2!838 lt!20843)) (currentBit!1758 (_2!838 lt!20843))) lt!20895)))

(declare-fun b!13236 () Bool)

(declare-fun res!12553 () Bool)

(assert (=> b!13236 (=> (not res!12553) (not e!8096))))

(assert (=> b!13236 (= res!12553 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!20895))))

(declare-fun b!13237 () Bool)

(declare-fun lt!20896 () (_ BitVec 64))

(assert (=> b!13237 (= e!8096 (bvsle lt!20895 (bvmul lt!20896 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!13237 (or (= lt!20896 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!20896 #b0000000000000000000000000000000000000000000000000000000000001000) lt!20896)))))

(assert (=> b!13237 (= lt!20896 ((_ sign_extend 32) (size!322 (buf!673 (_2!838 lt!20843)))))))

(assert (= (and d!4238 res!12552) b!13236))

(assert (= (and b!13236 res!12553) b!13237))

(declare-fun m!19899 () Bool)

(assert (=> d!4238 m!19899))

(assert (=> d!4238 m!19821))

(assert (=> b!13163 d!4238))

(declare-fun d!4248 () Bool)

(declare-fun e!8097 () Bool)

(assert (=> d!4248 e!8097))

(declare-fun res!12554 () Bool)

(assert (=> d!4248 (=> (not res!12554) (not e!8097))))

(declare-fun lt!20903 () (_ BitVec 64))

(declare-fun lt!20901 () (_ BitVec 64))

(declare-fun lt!20906 () (_ BitVec 64))

(assert (=> d!4248 (= res!12554 (= lt!20901 (bvsub lt!20903 lt!20906)))))

(assert (=> d!4248 (or (= (bvand lt!20903 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!20906 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!20903 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!20903 lt!20906) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!4248 (= lt!20906 (remainingBits!0 ((_ sign_extend 32) (size!322 (buf!673 thiss!957))) ((_ sign_extend 32) (currentByte!1763 thiss!957)) ((_ sign_extend 32) (currentBit!1758 thiss!957))))))

(declare-fun lt!20904 () (_ BitVec 64))

(declare-fun lt!20905 () (_ BitVec 64))

(assert (=> d!4248 (= lt!20903 (bvmul lt!20904 lt!20905))))

(assert (=> d!4248 (or (= lt!20904 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!20905 (bvsdiv (bvmul lt!20904 lt!20905) lt!20904)))))

(assert (=> d!4248 (= lt!20905 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!4248 (= lt!20904 ((_ sign_extend 32) (size!322 (buf!673 thiss!957))))))

(assert (=> d!4248 (= lt!20901 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1763 thiss!957)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1758 thiss!957))))))

(assert (=> d!4248 (invariant!0 (currentBit!1758 thiss!957) (currentByte!1763 thiss!957) (size!322 (buf!673 thiss!957)))))

(assert (=> d!4248 (= (bitIndex!0 (size!322 (buf!673 thiss!957)) (currentByte!1763 thiss!957) (currentBit!1758 thiss!957)) lt!20901)))

(declare-fun b!13238 () Bool)

(declare-fun res!12555 () Bool)

(assert (=> b!13238 (=> (not res!12555) (not e!8097))))

(assert (=> b!13238 (= res!12555 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!20901))))

(declare-fun b!13239 () Bool)

(declare-fun lt!20902 () (_ BitVec 64))

(assert (=> b!13239 (= e!8097 (bvsle lt!20901 (bvmul lt!20902 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!13239 (or (= lt!20902 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!20902 #b0000000000000000000000000000000000000000000000000000000000001000) lt!20902)))))

(assert (=> b!13239 (= lt!20902 ((_ sign_extend 32) (size!322 (buf!673 thiss!957))))))

(assert (= (and d!4248 res!12554) b!13238))

(assert (= (and b!13238 res!12555) b!13239))

(declare-fun m!19901 () Bool)

(assert (=> d!4248 m!19901))

(declare-fun m!19903 () Bool)

(assert (=> d!4248 m!19903))

(assert (=> b!13163 d!4248))

(declare-fun d!4250 () Bool)

(declare-fun e!8098 () Bool)

(assert (=> d!4250 e!8098))

(declare-fun res!12556 () Bool)

(assert (=> d!4250 (=> (not res!12556) (not e!8098))))

(declare-fun lt!20912 () (_ BitVec 64))

(declare-fun lt!20909 () (_ BitVec 64))

(declare-fun lt!20907 () (_ BitVec 64))

(assert (=> d!4250 (= res!12556 (= lt!20907 (bvsub lt!20909 lt!20912)))))

(assert (=> d!4250 (or (= (bvand lt!20909 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!20912 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!20909 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!20909 lt!20912) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!4250 (= lt!20912 (remainingBits!0 ((_ sign_extend 32) (size!322 (buf!673 (_1!837 lt!20846)))) ((_ sign_extend 32) (currentByte!1763 (_1!837 lt!20846))) ((_ sign_extend 32) (currentBit!1758 (_1!837 lt!20846)))))))

(declare-fun lt!20910 () (_ BitVec 64))

(declare-fun lt!20911 () (_ BitVec 64))

(assert (=> d!4250 (= lt!20909 (bvmul lt!20910 lt!20911))))

(assert (=> d!4250 (or (= lt!20910 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!20911 (bvsdiv (bvmul lt!20910 lt!20911) lt!20910)))))

(assert (=> d!4250 (= lt!20911 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!4250 (= lt!20910 ((_ sign_extend 32) (size!322 (buf!673 (_1!837 lt!20846)))))))

(assert (=> d!4250 (= lt!20907 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1763 (_1!837 lt!20846))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1758 (_1!837 lt!20846)))))))

(assert (=> d!4250 (invariant!0 (currentBit!1758 (_1!837 lt!20846)) (currentByte!1763 (_1!837 lt!20846)) (size!322 (buf!673 (_1!837 lt!20846))))))

(assert (=> d!4250 (= (bitIndex!0 (size!322 (buf!673 (_1!837 lt!20846))) (currentByte!1763 (_1!837 lt!20846)) (currentBit!1758 (_1!837 lt!20846))) lt!20907)))

(declare-fun b!13240 () Bool)

(declare-fun res!12557 () Bool)

(assert (=> b!13240 (=> (not res!12557) (not e!8098))))

(assert (=> b!13240 (= res!12557 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!20907))))

(declare-fun b!13241 () Bool)

(declare-fun lt!20908 () (_ BitVec 64))

(assert (=> b!13241 (= e!8098 (bvsle lt!20907 (bvmul lt!20908 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!13241 (or (= lt!20908 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!20908 #b0000000000000000000000000000000000000000000000000000000000001000) lt!20908)))))

(assert (=> b!13241 (= lt!20908 ((_ sign_extend 32) (size!322 (buf!673 (_1!837 lt!20846)))))))

(assert (= (and d!4250 res!12556) b!13240))

(assert (= (and b!13240 res!12557) b!13241))

(declare-fun m!19905 () Bool)

(assert (=> d!4250 m!19905))

(declare-fun m!19907 () Bool)

(assert (=> d!4250 m!19907))

(assert (=> b!13165 d!4250))

(declare-fun b!13270 () Bool)

(declare-fun res!12587 () Bool)

(declare-fun e!8115 () Bool)

(assert (=> b!13270 (=> (not res!12587) (not e!8115))))

(declare-fun lt!20975 () (_ BitVec 64))

(declare-fun lt!20974 () (_ BitVec 64))

(declare-fun lt!20973 () tuple2!1566)

(assert (=> b!13270 (= res!12587 (= (bitIndex!0 (size!322 (buf!673 (_2!838 lt!20973))) (currentByte!1763 (_2!838 lt!20973)) (currentBit!1758 (_2!838 lt!20973))) (bvadd lt!20974 lt!20975)))))

(assert (=> b!13270 (or (not (= (bvand lt!20974 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!20975 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!20974 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!20974 lt!20975) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!13270 (= lt!20975 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!13270 (= lt!20974 (bitIndex!0 (size!322 (buf!673 thiss!957)) (currentByte!1763 thiss!957) (currentBit!1758 thiss!957)))))

(declare-fun b!13273 () Bool)

(declare-fun e!8114 () Bool)

(declare-fun lt!20972 () tuple2!1564)

(assert (=> b!13273 (= e!8114 (= (bitIndex!0 (size!322 (buf!673 (_1!837 lt!20972))) (currentByte!1763 (_1!837 lt!20972)) (currentBit!1758 (_1!837 lt!20972))) (bitIndex!0 (size!322 (buf!673 (_2!838 lt!20973))) (currentByte!1763 (_2!838 lt!20973)) (currentBit!1758 (_2!838 lt!20973)))))))

(declare-fun d!4252 () Bool)

(assert (=> d!4252 e!8115))

(declare-fun res!12589 () Bool)

(assert (=> d!4252 (=> (not res!12589) (not e!8115))))

(assert (=> d!4252 (= res!12589 (= (size!322 (buf!673 thiss!957)) (size!322 (buf!673 (_2!838 lt!20973)))))))

(declare-fun choose!16 (BitStream!604 Bool) tuple2!1566)

(assert (=> d!4252 (= lt!20973 (choose!16 thiss!957 false))))

(assert (=> d!4252 (validate_offset_bit!0 ((_ sign_extend 32) (size!322 (buf!673 thiss!957))) ((_ sign_extend 32) (currentByte!1763 thiss!957)) ((_ sign_extend 32) (currentBit!1758 thiss!957)))))

(assert (=> d!4252 (= (appendBit!0 thiss!957 false) lt!20973)))

(declare-fun b!13272 () Bool)

(assert (=> b!13272 (= e!8115 e!8114)))

(declare-fun res!12588 () Bool)

(assert (=> b!13272 (=> (not res!12588) (not e!8114))))

(assert (=> b!13272 (= res!12588 (and (= (_2!837 lt!20972) false) (= (_1!837 lt!20972) (_2!838 lt!20973))))))

(assert (=> b!13272 (= lt!20972 (readBitPure!0 (readerFrom!0 (_2!838 lt!20973) (currentBit!1758 thiss!957) (currentByte!1763 thiss!957))))))

(declare-fun b!13271 () Bool)

(declare-fun res!12586 () Bool)

(assert (=> b!13271 (=> (not res!12586) (not e!8115))))

(assert (=> b!13271 (= res!12586 (isPrefixOf!0 thiss!957 (_2!838 lt!20973)))))

(assert (= (and d!4252 res!12589) b!13270))

(assert (= (and b!13270 res!12587) b!13271))

(assert (= (and b!13271 res!12586) b!13272))

(assert (= (and b!13272 res!12588) b!13273))

(declare-fun m!19927 () Bool)

(assert (=> d!4252 m!19927))

(assert (=> d!4252 m!19825))

(declare-fun m!19929 () Bool)

(assert (=> b!13270 m!19929))

(assert (=> b!13270 m!19817))

(declare-fun m!19931 () Bool)

(assert (=> b!13272 m!19931))

(assert (=> b!13272 m!19931))

(declare-fun m!19933 () Bool)

(assert (=> b!13272 m!19933))

(declare-fun m!19935 () Bool)

(assert (=> b!13273 m!19935))

(assert (=> b!13273 m!19929))

(declare-fun m!19937 () Bool)

(assert (=> b!13271 m!19937))

(assert (=> b!13164 d!4252))

(declare-fun d!4272 () Bool)

(assert (=> d!4272 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!322 (buf!673 thiss!957))) ((_ sign_extend 32) (currentByte!1763 thiss!957)) ((_ sign_extend 32) (currentBit!1758 thiss!957))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!322 (buf!673 thiss!957))) ((_ sign_extend 32) (currentByte!1763 thiss!957)) ((_ sign_extend 32) (currentBit!1758 thiss!957))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!1197 () Bool)

(assert (= bs!1197 d!4272))

(assert (=> bs!1197 m!19901))

(assert (=> start!2798 d!4272))

(declare-fun d!4274 () Bool)

(assert (=> d!4274 (= (inv!12 thiss!957) (invariant!0 (currentBit!1758 thiss!957) (currentByte!1763 thiss!957) (size!322 (buf!673 thiss!957))))))

(declare-fun bs!1198 () Bool)

(assert (= bs!1198 d!4274))

(assert (=> bs!1198 m!19903))

(assert (=> start!2798 d!4274))

(declare-fun d!4276 () Bool)

(declare-fun res!12607 () Bool)

(declare-fun e!8127 () Bool)

(assert (=> d!4276 (=> (not res!12607) (not e!8127))))

(assert (=> d!4276 (= res!12607 (= (size!322 (buf!673 thiss!957)) (size!322 (buf!673 (_2!838 lt!20843)))))))

(assert (=> d!4276 (= (isPrefixOf!0 thiss!957 (_2!838 lt!20843)) e!8127)))

(declare-fun b!13289 () Bool)

(declare-fun res!12606 () Bool)

(assert (=> b!13289 (=> (not res!12606) (not e!8127))))

(assert (=> b!13289 (= res!12606 (bvsle (bitIndex!0 (size!322 (buf!673 thiss!957)) (currentByte!1763 thiss!957) (currentBit!1758 thiss!957)) (bitIndex!0 (size!322 (buf!673 (_2!838 lt!20843))) (currentByte!1763 (_2!838 lt!20843)) (currentBit!1758 (_2!838 lt!20843)))))))

(declare-fun b!13290 () Bool)

(declare-fun e!8126 () Bool)

(assert (=> b!13290 (= e!8127 e!8126)))

(declare-fun res!12605 () Bool)

(assert (=> b!13290 (=> res!12605 e!8126)))

(assert (=> b!13290 (= res!12605 (= (size!322 (buf!673 thiss!957)) #b00000000000000000000000000000000))))

(declare-fun b!13291 () Bool)

(declare-fun arrayBitRangesEq!0 (array!741 array!741 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!13291 (= e!8126 (arrayBitRangesEq!0 (buf!673 thiss!957) (buf!673 (_2!838 lt!20843)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!322 (buf!673 thiss!957)) (currentByte!1763 thiss!957) (currentBit!1758 thiss!957))))))

(assert (= (and d!4276 res!12607) b!13289))

(assert (= (and b!13289 res!12606) b!13290))

(assert (= (and b!13290 (not res!12605)) b!13291))

(assert (=> b!13289 m!19817))

(assert (=> b!13289 m!19815))

(assert (=> b!13291 m!19817))

(assert (=> b!13291 m!19817))

(declare-fun m!19941 () Bool)

(assert (=> b!13291 m!19941))

(assert (=> b!13166 d!4276))

(declare-fun d!4280 () Bool)

(declare-datatypes ((tuple2!1578 0))(
  ( (tuple2!1579 (_1!844 Bool) (_2!844 BitStream!604)) )
))
(declare-fun lt!20978 () tuple2!1578)

(declare-fun readBit!0 (BitStream!604) tuple2!1578)

(assert (=> d!4280 (= lt!20978 (readBit!0 (readerFrom!0 (_2!838 lt!20843) (currentBit!1758 thiss!957) (currentByte!1763 thiss!957))))))

(assert (=> d!4280 (= (readBitPure!0 (readerFrom!0 (_2!838 lt!20843) (currentBit!1758 thiss!957) (currentByte!1763 thiss!957))) (tuple2!1565 (_2!844 lt!20978) (_1!844 lt!20978)))))

(declare-fun bs!1199 () Bool)

(assert (= bs!1199 d!4280))

(assert (=> bs!1199 m!19833))

(declare-fun m!19943 () Bool)

(assert (=> bs!1199 m!19943))

(assert (=> b!13161 d!4280))

(declare-fun d!4282 () Bool)

(declare-fun e!8130 () Bool)

(assert (=> d!4282 e!8130))

(declare-fun res!12611 () Bool)

(assert (=> d!4282 (=> (not res!12611) (not e!8130))))

(assert (=> d!4282 (= res!12611 (invariant!0 (currentBit!1758 (_2!838 lt!20843)) (currentByte!1763 (_2!838 lt!20843)) (size!322 (buf!673 (_2!838 lt!20843)))))))

(assert (=> d!4282 (= (readerFrom!0 (_2!838 lt!20843) (currentBit!1758 thiss!957) (currentByte!1763 thiss!957)) (BitStream!605 (buf!673 (_2!838 lt!20843)) (currentByte!1763 thiss!957) (currentBit!1758 thiss!957)))))

(declare-fun b!13294 () Bool)

(assert (=> b!13294 (= e!8130 (invariant!0 (currentBit!1758 thiss!957) (currentByte!1763 thiss!957) (size!322 (buf!673 (_2!838 lt!20843)))))))

(assert (= (and d!4282 res!12611) b!13294))

(assert (=> d!4282 m!19821))

(declare-fun m!19945 () Bool)

(assert (=> b!13294 m!19945))

(assert (=> b!13161 d!4282))

(push 1)

(assert (not b!13294))

(assert (not d!4252))

(assert (not d!4250))

(assert (not d!4238))

(assert (not b!13289))

(assert (not d!4280))

(assert (not b!13270))

(assert (not d!4274))

(assert (not b!13291))

(assert (not b!13273))

(assert (not d!4248))

(assert (not b!13272))

(assert (not d!4282))

(assert (not b!13271))

(assert (not d!4272))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

