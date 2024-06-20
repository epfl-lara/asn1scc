; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20212 () Bool)

(assert start!20212)

(declare-fun b!101097 () Bool)

(declare-fun res!83045 () Bool)

(declare-fun e!66098 () Bool)

(assert (=> b!101097 (=> (not res!83045) (not e!66098))))

(declare-datatypes ((array!4743 0))(
  ( (array!4744 (arr!2757 (Array (_ BitVec 32) (_ BitVec 8))) (size!2164 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3802 0))(
  ( (BitStream!3803 (buf!2521 array!4743) (currentByte!4988 (_ BitVec 32)) (currentBit!4983 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!3802)

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!101097 (= res!83045 (validate_offset_bits!1 ((_ sign_extend 32) (size!2164 (buf!2521 thiss!1305))) ((_ sign_extend 32) (currentByte!4988 thiss!1305)) ((_ sign_extend 32) (currentBit!4983 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun b!101098 () Bool)

(declare-fun res!83041 () Bool)

(assert (=> b!101098 (=> (not res!83041) (not e!66098))))

(assert (=> b!101098 (= res!83041 (bvslt i!615 nBits!396))))

(declare-fun b!101099 () Bool)

(declare-fun e!66097 () Bool)

(declare-datatypes ((tuple2!8164 0))(
  ( (tuple2!8165 (_1!4337 BitStream!3802) (_2!4337 Bool)) )
))
(declare-fun lt!146836 () tuple2!8164)

(declare-fun lt!146844 () tuple2!8164)

(assert (=> b!101099 (= e!66097 (= (_2!4337 lt!146836) (_2!4337 lt!146844)))))

(declare-fun b!101100 () Bool)

(declare-fun res!83042 () Bool)

(assert (=> b!101100 (=> (not res!83042) (not e!66098))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!101100 (= res!83042 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!101101 () Bool)

(declare-fun e!66099 () Bool)

(declare-fun lt!146835 () tuple2!8164)

(declare-fun lt!146839 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!101101 (= e!66099 (= (bitIndex!0 (size!2164 (buf!2521 (_1!4337 lt!146835))) (currentByte!4988 (_1!4337 lt!146835)) (currentBit!4983 (_1!4337 lt!146835))) lt!146839))))

(declare-fun b!101102 () Bool)

(declare-fun e!66100 () Bool)

(declare-fun array_inv!1966 (array!4743) Bool)

(assert (=> b!101102 (= e!66100 (array_inv!1966 (buf!2521 thiss!1305)))))

(declare-fun b!101103 () Bool)

(declare-fun res!83039 () Bool)

(declare-fun e!66102 () Bool)

(assert (=> b!101103 (=> (not res!83039) (not e!66102))))

(declare-datatypes ((Unit!6200 0))(
  ( (Unit!6201) )
))
(declare-datatypes ((tuple2!8166 0))(
  ( (tuple2!8167 (_1!4338 Unit!6200) (_2!4338 BitStream!3802)) )
))
(declare-fun lt!146845 () tuple2!8166)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!101103 (= res!83039 (invariant!0 (currentBit!4983 thiss!1305) (currentByte!4988 thiss!1305) (size!2164 (buf!2521 (_2!4338 lt!146845)))))))

(declare-fun b!101104 () Bool)

(declare-fun lt!146842 () tuple2!8166)

(assert (=> b!101104 (= e!66102 (invariant!0 (currentBit!4983 thiss!1305) (currentByte!4988 thiss!1305) (size!2164 (buf!2521 (_2!4338 lt!146842)))))))

(declare-fun res!83044 () Bool)

(assert (=> start!20212 (=> (not res!83044) (not e!66098))))

(assert (=> start!20212 (= res!83044 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!20212 e!66098))

(assert (=> start!20212 true))

(declare-fun inv!12 (BitStream!3802) Bool)

(assert (=> start!20212 (and (inv!12 thiss!1305) e!66100)))

(declare-fun b!101105 () Bool)

(declare-fun e!66095 () Bool)

(assert (=> b!101105 (= e!66095 e!66099)))

(declare-fun res!83038 () Bool)

(assert (=> b!101105 (=> (not res!83038) (not e!66099))))

(declare-fun lt!146833 () Bool)

(assert (=> b!101105 (= res!83038 (and (= (_2!4337 lt!146835) lt!146833) (= (_1!4337 lt!146835) (_2!4338 lt!146845))))))

(declare-fun readBitPure!0 (BitStream!3802) tuple2!8164)

(declare-fun readerFrom!0 (BitStream!3802 (_ BitVec 32) (_ BitVec 32)) BitStream!3802)

(assert (=> b!101105 (= lt!146835 (readBitPure!0 (readerFrom!0 (_2!4338 lt!146845) (currentBit!4983 thiss!1305) (currentByte!4988 thiss!1305))))))

(declare-fun b!101106 () Bool)

(assert (=> b!101106 (= e!66098 (not true))))

(declare-datatypes ((tuple2!8168 0))(
  ( (tuple2!8169 (_1!4339 BitStream!3802) (_2!4339 BitStream!3802)) )
))
(declare-fun lt!146843 () tuple2!8168)

(assert (=> b!101106 (= (_2!4337 (readBitPure!0 (_1!4339 lt!146843))) lt!146833)))

(declare-fun lt!146834 () tuple2!8168)

(declare-fun reader!0 (BitStream!3802 BitStream!3802) tuple2!8168)

(assert (=> b!101106 (= lt!146834 (reader!0 (_2!4338 lt!146845) (_2!4338 lt!146842)))))

(assert (=> b!101106 (= lt!146843 (reader!0 thiss!1305 (_2!4338 lt!146842)))))

(assert (=> b!101106 e!66097))

(declare-fun res!83037 () Bool)

(assert (=> b!101106 (=> (not res!83037) (not e!66097))))

(assert (=> b!101106 (= res!83037 (= (bitIndex!0 (size!2164 (buf!2521 (_1!4337 lt!146836))) (currentByte!4988 (_1!4337 lt!146836)) (currentBit!4983 (_1!4337 lt!146836))) (bitIndex!0 (size!2164 (buf!2521 (_1!4337 lt!146844))) (currentByte!4988 (_1!4337 lt!146844)) (currentBit!4983 (_1!4337 lt!146844)))))))

(declare-fun lt!146840 () Unit!6200)

(declare-fun lt!146841 () BitStream!3802)

(declare-fun readBitPrefixLemma!0 (BitStream!3802 BitStream!3802) Unit!6200)

(assert (=> b!101106 (= lt!146840 (readBitPrefixLemma!0 lt!146841 (_2!4338 lt!146842)))))

(assert (=> b!101106 (= lt!146844 (readBitPure!0 (BitStream!3803 (buf!2521 (_2!4338 lt!146842)) (currentByte!4988 thiss!1305) (currentBit!4983 thiss!1305))))))

(assert (=> b!101106 (= lt!146836 (readBitPure!0 lt!146841))))

(assert (=> b!101106 (= lt!146841 (BitStream!3803 (buf!2521 (_2!4338 lt!146845)) (currentByte!4988 thiss!1305) (currentBit!4983 thiss!1305)))))

(assert (=> b!101106 e!66102))

(declare-fun res!83043 () Bool)

(assert (=> b!101106 (=> (not res!83043) (not e!66102))))

(declare-fun isPrefixOf!0 (BitStream!3802 BitStream!3802) Bool)

(assert (=> b!101106 (= res!83043 (isPrefixOf!0 thiss!1305 (_2!4338 lt!146842)))))

(declare-fun lt!146837 () Unit!6200)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3802 BitStream!3802 BitStream!3802) Unit!6200)

(assert (=> b!101106 (= lt!146837 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4338 lt!146845) (_2!4338 lt!146842)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3802 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8166)

(assert (=> b!101106 (= lt!146842 (appendNLeastSignificantBitsLoop!0 (_2!4338 lt!146845) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!66096 () Bool)

(assert (=> b!101106 e!66096))

(declare-fun res!83040 () Bool)

(assert (=> b!101106 (=> (not res!83040) (not e!66096))))

(assert (=> b!101106 (= res!83040 (= (size!2164 (buf!2521 thiss!1305)) (size!2164 (buf!2521 (_2!4338 lt!146845)))))))

(declare-fun appendBit!0 (BitStream!3802 Bool) tuple2!8166)

(assert (=> b!101106 (= lt!146845 (appendBit!0 thiss!1305 lt!146833))))

(assert (=> b!101106 (= lt!146833 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!101107 () Bool)

(assert (=> b!101107 (= e!66096 e!66095)))

(declare-fun res!83036 () Bool)

(assert (=> b!101107 (=> (not res!83036) (not e!66095))))

(declare-fun lt!146838 () (_ BitVec 64))

(assert (=> b!101107 (= res!83036 (= lt!146839 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!146838)))))

(assert (=> b!101107 (= lt!146839 (bitIndex!0 (size!2164 (buf!2521 (_2!4338 lt!146845))) (currentByte!4988 (_2!4338 lt!146845)) (currentBit!4983 (_2!4338 lt!146845))))))

(assert (=> b!101107 (= lt!146838 (bitIndex!0 (size!2164 (buf!2521 thiss!1305)) (currentByte!4988 thiss!1305) (currentBit!4983 thiss!1305)))))

(declare-fun b!101108 () Bool)

(declare-fun res!83035 () Bool)

(assert (=> b!101108 (=> (not res!83035) (not e!66095))))

(assert (=> b!101108 (= res!83035 (isPrefixOf!0 thiss!1305 (_2!4338 lt!146845)))))

(assert (= (and start!20212 res!83044) b!101097))

(assert (= (and b!101097 res!83045) b!101100))

(assert (= (and b!101100 res!83042) b!101098))

(assert (= (and b!101098 res!83041) b!101106))

(assert (= (and b!101106 res!83040) b!101107))

(assert (= (and b!101107 res!83036) b!101108))

(assert (= (and b!101108 res!83035) b!101105))

(assert (= (and b!101105 res!83038) b!101101))

(assert (= (and b!101106 res!83043) b!101103))

(assert (= (and b!101103 res!83039) b!101104))

(assert (= (and b!101106 res!83037) b!101099))

(assert (= start!20212 b!101102))

(declare-fun m!147067 () Bool)

(assert (=> start!20212 m!147067))

(declare-fun m!147069 () Bool)

(assert (=> b!101097 m!147069))

(declare-fun m!147071 () Bool)

(assert (=> b!101107 m!147071))

(declare-fun m!147073 () Bool)

(assert (=> b!101107 m!147073))

(declare-fun m!147075 () Bool)

(assert (=> b!101106 m!147075))

(declare-fun m!147077 () Bool)

(assert (=> b!101106 m!147077))

(declare-fun m!147079 () Bool)

(assert (=> b!101106 m!147079))

(declare-fun m!147081 () Bool)

(assert (=> b!101106 m!147081))

(declare-fun m!147083 () Bool)

(assert (=> b!101106 m!147083))

(declare-fun m!147085 () Bool)

(assert (=> b!101106 m!147085))

(declare-fun m!147087 () Bool)

(assert (=> b!101106 m!147087))

(declare-fun m!147089 () Bool)

(assert (=> b!101106 m!147089))

(declare-fun m!147091 () Bool)

(assert (=> b!101106 m!147091))

(declare-fun m!147093 () Bool)

(assert (=> b!101106 m!147093))

(declare-fun m!147095 () Bool)

(assert (=> b!101106 m!147095))

(declare-fun m!147097 () Bool)

(assert (=> b!101106 m!147097))

(declare-fun m!147099 () Bool)

(assert (=> b!101100 m!147099))

(declare-fun m!147101 () Bool)

(assert (=> b!101102 m!147101))

(declare-fun m!147103 () Bool)

(assert (=> b!101103 m!147103))

(declare-fun m!147105 () Bool)

(assert (=> b!101108 m!147105))

(declare-fun m!147107 () Bool)

(assert (=> b!101104 m!147107))

(declare-fun m!147109 () Bool)

(assert (=> b!101101 m!147109))

(declare-fun m!147111 () Bool)

(assert (=> b!101105 m!147111))

(assert (=> b!101105 m!147111))

(declare-fun m!147113 () Bool)

(assert (=> b!101105 m!147113))

(push 1)

(assert (not b!101100))

(assert (not b!101105))

(assert (not b!101102))

(assert (not b!101103))

(assert (not b!101106))

(assert (not start!20212))

(assert (not b!101108))

(assert (not b!101101))

(assert (not b!101104))

(assert (not b!101107))

(assert (not b!101097))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

