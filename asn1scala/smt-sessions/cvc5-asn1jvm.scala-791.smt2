; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22964 () Bool)

(assert start!22964)

(declare-fun b!116090 () Bool)

(declare-fun e!76068 () Bool)

(declare-fun e!76064 () Bool)

(assert (=> b!116090 (= e!76068 e!76064)))

(declare-fun res!95959 () Bool)

(assert (=> b!116090 (=> (not res!95959) (not e!76064))))

(declare-fun lt!177462 () (_ BitVec 64))

(declare-fun lt!177464 () (_ BitVec 64))

(assert (=> b!116090 (= res!95959 (= lt!177462 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!177464)))))

(declare-datatypes ((array!5228 0))(
  ( (array!5229 (arr!2964 (Array (_ BitVec 32) (_ BitVec 8))) (size!2371 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4216 0))(
  ( (BitStream!4217 (buf!2781 array!5228) (currentByte!5418 (_ BitVec 32)) (currentBit!5413 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!7147 0))(
  ( (Unit!7148) )
))
(declare-datatypes ((tuple2!9574 0))(
  ( (tuple2!9575 (_1!5052 Unit!7147) (_2!5052 BitStream!4216)) )
))
(declare-fun lt!177473 () tuple2!9574)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!116090 (= lt!177462 (bitIndex!0 (size!2371 (buf!2781 (_2!5052 lt!177473))) (currentByte!5418 (_2!5052 lt!177473)) (currentBit!5413 (_2!5052 lt!177473))))))

(declare-fun thiss!1305 () BitStream!4216)

(assert (=> b!116090 (= lt!177464 (bitIndex!0 (size!2371 (buf!2781 thiss!1305)) (currentByte!5418 thiss!1305) (currentBit!5413 thiss!1305)))))

(declare-fun b!116091 () Bool)

(declare-fun e!76061 () Bool)

(declare-fun lt!177468 () tuple2!9574)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!116091 (= e!76061 (invariant!0 (currentBit!5413 thiss!1305) (currentByte!5418 thiss!1305) (size!2371 (buf!2781 (_2!5052 lt!177468)))))))

(declare-fun b!116092 () Bool)

(declare-fun res!95955 () Bool)

(declare-fun e!76065 () Bool)

(assert (=> b!116092 (=> (not res!95955) (not e!76065))))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!116092 (= res!95955 (validate_offset_bits!1 ((_ sign_extend 32) (size!2371 (buf!2781 thiss!1305))) ((_ sign_extend 32) (currentByte!5418 thiss!1305)) ((_ sign_extend 32) (currentBit!5413 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun b!116093 () Bool)

(declare-fun res!95951 () Bool)

(assert (=> b!116093 (=> (not res!95951) (not e!76065))))

(assert (=> b!116093 (= res!95951 (bvslt i!615 nBits!396))))

(declare-fun b!116094 () Bool)

(declare-fun res!95961 () Bool)

(assert (=> b!116094 (=> (not res!95961) (not e!76064))))

(declare-fun isPrefixOf!0 (BitStream!4216 BitStream!4216) Bool)

(assert (=> b!116094 (= res!95961 (isPrefixOf!0 thiss!1305 (_2!5052 lt!177473)))))

(declare-fun b!116095 () Bool)

(declare-fun res!95958 () Bool)

(assert (=> b!116095 (=> (not res!95958) (not e!76061))))

(assert (=> b!116095 (= res!95958 (invariant!0 (currentBit!5413 thiss!1305) (currentByte!5418 thiss!1305) (size!2371 (buf!2781 (_2!5052 lt!177473)))))))

(declare-fun b!116096 () Bool)

(assert (=> b!116096 (= e!76065 (not true))))

(declare-datatypes ((tuple2!9576 0))(
  ( (tuple2!9577 (_1!5053 BitStream!4216) (_2!5053 BitStream!4216)) )
))
(declare-fun lt!177467 () tuple2!9576)

(declare-fun lt!177472 () Bool)

(declare-datatypes ((tuple2!9578 0))(
  ( (tuple2!9579 (_1!5054 BitStream!4216) (_2!5054 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!4216) tuple2!9578)

(assert (=> b!116096 (= (_2!5054 (readBitPure!0 (_1!5053 lt!177467))) lt!177472)))

(declare-fun lt!177465 () tuple2!9576)

(declare-fun reader!0 (BitStream!4216 BitStream!4216) tuple2!9576)

(assert (=> b!116096 (= lt!177465 (reader!0 (_2!5052 lt!177473) (_2!5052 lt!177468)))))

(assert (=> b!116096 (= lt!177467 (reader!0 thiss!1305 (_2!5052 lt!177468)))))

(declare-fun e!76062 () Bool)

(assert (=> b!116096 e!76062))

(declare-fun res!95953 () Bool)

(assert (=> b!116096 (=> (not res!95953) (not e!76062))))

(declare-fun lt!177474 () tuple2!9578)

(declare-fun lt!177463 () tuple2!9578)

(assert (=> b!116096 (= res!95953 (= (bitIndex!0 (size!2371 (buf!2781 (_1!5054 lt!177474))) (currentByte!5418 (_1!5054 lt!177474)) (currentBit!5413 (_1!5054 lt!177474))) (bitIndex!0 (size!2371 (buf!2781 (_1!5054 lt!177463))) (currentByte!5418 (_1!5054 lt!177463)) (currentBit!5413 (_1!5054 lt!177463)))))))

(declare-fun lt!177471 () Unit!7147)

(declare-fun lt!177466 () BitStream!4216)

(declare-fun readBitPrefixLemma!0 (BitStream!4216 BitStream!4216) Unit!7147)

(assert (=> b!116096 (= lt!177471 (readBitPrefixLemma!0 lt!177466 (_2!5052 lt!177468)))))

(assert (=> b!116096 (= lt!177463 (readBitPure!0 (BitStream!4217 (buf!2781 (_2!5052 lt!177468)) (currentByte!5418 thiss!1305) (currentBit!5413 thiss!1305))))))

(assert (=> b!116096 (= lt!177474 (readBitPure!0 lt!177466))))

(assert (=> b!116096 (= lt!177466 (BitStream!4217 (buf!2781 (_2!5052 lt!177473)) (currentByte!5418 thiss!1305) (currentBit!5413 thiss!1305)))))

(assert (=> b!116096 e!76061))

(declare-fun res!95956 () Bool)

(assert (=> b!116096 (=> (not res!95956) (not e!76061))))

(assert (=> b!116096 (= res!95956 (isPrefixOf!0 thiss!1305 (_2!5052 lt!177468)))))

(declare-fun lt!177469 () Unit!7147)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4216 BitStream!4216 BitStream!4216) Unit!7147)

(assert (=> b!116096 (= lt!177469 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5052 lt!177473) (_2!5052 lt!177468)))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4216 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9574)

(assert (=> b!116096 (= lt!177468 (appendNLeastSignificantBitsLoop!0 (_2!5052 lt!177473) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!116096 e!76068))

(declare-fun res!95960 () Bool)

(assert (=> b!116096 (=> (not res!95960) (not e!76068))))

(assert (=> b!116096 (= res!95960 (= (size!2371 (buf!2781 thiss!1305)) (size!2371 (buf!2781 (_2!5052 lt!177473)))))))

(declare-fun appendBit!0 (BitStream!4216 Bool) tuple2!9574)

(assert (=> b!116096 (= lt!177473 (appendBit!0 thiss!1305 lt!177472))))

(assert (=> b!116096 (= lt!177472 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!116097 () Bool)

(declare-fun e!76067 () Bool)

(declare-fun array_inv!2173 (array!5228) Bool)

(assert (=> b!116097 (= e!76067 (array_inv!2173 (buf!2781 thiss!1305)))))

(declare-fun b!116098 () Bool)

(assert (=> b!116098 (= e!76062 (= (_2!5054 lt!177474) (_2!5054 lt!177463)))))

(declare-fun b!116099 () Bool)

(declare-fun res!95954 () Bool)

(assert (=> b!116099 (=> (not res!95954) (not e!76065))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!116099 (= res!95954 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun res!95952 () Bool)

(assert (=> start!22964 (=> (not res!95952) (not e!76065))))

(assert (=> start!22964 (= res!95952 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!22964 e!76065))

(assert (=> start!22964 true))

(declare-fun inv!12 (BitStream!4216) Bool)

(assert (=> start!22964 (and (inv!12 thiss!1305) e!76067)))

(declare-fun b!116100 () Bool)

(declare-fun e!76066 () Bool)

(declare-fun lt!177470 () tuple2!9578)

(assert (=> b!116100 (= e!76066 (= (bitIndex!0 (size!2371 (buf!2781 (_1!5054 lt!177470))) (currentByte!5418 (_1!5054 lt!177470)) (currentBit!5413 (_1!5054 lt!177470))) lt!177462))))

(declare-fun b!116101 () Bool)

(assert (=> b!116101 (= e!76064 e!76066)))

(declare-fun res!95957 () Bool)

(assert (=> b!116101 (=> (not res!95957) (not e!76066))))

(assert (=> b!116101 (= res!95957 (and (= (_2!5054 lt!177470) lt!177472) (= (_1!5054 lt!177470) (_2!5052 lt!177473))))))

(declare-fun readerFrom!0 (BitStream!4216 (_ BitVec 32) (_ BitVec 32)) BitStream!4216)

(assert (=> b!116101 (= lt!177470 (readBitPure!0 (readerFrom!0 (_2!5052 lt!177473) (currentBit!5413 thiss!1305) (currentByte!5418 thiss!1305))))))

(assert (= (and start!22964 res!95952) b!116092))

(assert (= (and b!116092 res!95955) b!116099))

(assert (= (and b!116099 res!95954) b!116093))

(assert (= (and b!116093 res!95951) b!116096))

(assert (= (and b!116096 res!95960) b!116090))

(assert (= (and b!116090 res!95959) b!116094))

(assert (= (and b!116094 res!95961) b!116101))

(assert (= (and b!116101 res!95957) b!116100))

(assert (= (and b!116096 res!95956) b!116095))

(assert (= (and b!116095 res!95958) b!116091))

(assert (= (and b!116096 res!95953) b!116098))

(assert (= start!22964 b!116097))

(declare-fun m!173843 () Bool)

(assert (=> b!116092 m!173843))

(declare-fun m!173845 () Bool)

(assert (=> b!116096 m!173845))

(declare-fun m!173847 () Bool)

(assert (=> b!116096 m!173847))

(declare-fun m!173849 () Bool)

(assert (=> b!116096 m!173849))

(declare-fun m!173851 () Bool)

(assert (=> b!116096 m!173851))

(declare-fun m!173853 () Bool)

(assert (=> b!116096 m!173853))

(declare-fun m!173855 () Bool)

(assert (=> b!116096 m!173855))

(declare-fun m!173857 () Bool)

(assert (=> b!116096 m!173857))

(declare-fun m!173859 () Bool)

(assert (=> b!116096 m!173859))

(declare-fun m!173861 () Bool)

(assert (=> b!116096 m!173861))

(declare-fun m!173863 () Bool)

(assert (=> b!116096 m!173863))

(declare-fun m!173865 () Bool)

(assert (=> b!116096 m!173865))

(declare-fun m!173867 () Bool)

(assert (=> b!116096 m!173867))

(declare-fun m!173869 () Bool)

(assert (=> b!116101 m!173869))

(assert (=> b!116101 m!173869))

(declare-fun m!173871 () Bool)

(assert (=> b!116101 m!173871))

(declare-fun m!173873 () Bool)

(assert (=> b!116095 m!173873))

(declare-fun m!173875 () Bool)

(assert (=> b!116091 m!173875))

(declare-fun m!173877 () Bool)

(assert (=> b!116099 m!173877))

(declare-fun m!173879 () Bool)

(assert (=> b!116100 m!173879))

(declare-fun m!173881 () Bool)

(assert (=> b!116097 m!173881))

(declare-fun m!173883 () Bool)

(assert (=> b!116090 m!173883))

(declare-fun m!173885 () Bool)

(assert (=> b!116090 m!173885))

(declare-fun m!173887 () Bool)

(assert (=> b!116094 m!173887))

(declare-fun m!173889 () Bool)

(assert (=> start!22964 m!173889))

(push 1)

(assert (not start!22964))

(assert (not b!116099))

(assert (not b!116097))

(assert (not b!116100))

(assert (not b!116090))

(assert (not b!116095))

(assert (not b!116096))

(assert (not b!116094))

(assert (not b!116091))

(assert (not b!116101))

(assert (not b!116092))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

