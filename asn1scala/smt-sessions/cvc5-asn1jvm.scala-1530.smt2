; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42638 () Bool)

(assert start!42638)

(declare-fun res!168491 () Bool)

(declare-fun e!138022 () Bool)

(assert (=> start!42638 (=> (not res!168491) (not e!138022))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!42638 (= res!168491 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!42638 e!138022))

(assert (=> start!42638 true))

(declare-datatypes ((array!10220 0))(
  ( (array!10221 (arr!5431 (Array (_ BitVec 32) (_ BitVec 8))) (size!4501 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8110 0))(
  ( (BitStream!8111 (buf!5002 array!10220) (currentByte!9400 (_ BitVec 32)) (currentBit!9395 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8110)

(declare-fun e!138023 () Bool)

(declare-fun inv!12 (BitStream!8110) Bool)

(assert (=> start!42638 (and (inv!12 thiss!1204) e!138023)))

(declare-fun b!201236 () Bool)

(declare-fun res!168490 () Bool)

(declare-fun e!138026 () Bool)

(assert (=> b!201236 (=> (not res!168490) (not e!138026))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!201236 (= res!168490 (invariant!0 (currentBit!9395 thiss!1204) (currentByte!9400 thiss!1204) (size!4501 (buf!5002 thiss!1204))))))

(declare-fun b!201237 () Bool)

(declare-fun e!138021 () Bool)

(declare-fun e!138024 () Bool)

(assert (=> b!201237 (= e!138021 (not e!138024))))

(declare-fun res!168488 () Bool)

(assert (=> b!201237 (=> (not res!168488) (not e!138024))))

(declare-datatypes ((tuple2!17204 0))(
  ( (tuple2!17205 (_1!9253 BitStream!8110) (_2!9253 (_ BitVec 64))) )
))
(declare-fun lt!314010 () tuple2!17204)

(declare-fun v!189 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!201237 (= res!168488 (= (_2!9253 lt!314010) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-datatypes ((tuple2!17206 0))(
  ( (tuple2!17207 (_1!9254 BitStream!8110) (_2!9254 BitStream!8110)) )
))
(declare-fun lt!314007 () tuple2!17206)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8110 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17204)

(assert (=> b!201237 (= lt!314010 (readNBitsLSBFirstsLoopPure!0 (_1!9254 lt!314007) nBits!348 i!590 (bvand v!189 (onesLSBLong!0 i!590))))))

(declare-datatypes ((Unit!14304 0))(
  ( (Unit!14305) )
))
(declare-fun lt!314006 () Unit!14304)

(declare-fun lt!314008 () (_ BitVec 64))

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8110 array!10220 (_ BitVec 64)) Unit!14304)

(assert (=> b!201237 (= lt!314006 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5002 thiss!1204) lt!314008))))

(declare-fun reader!0 (BitStream!8110 BitStream!8110) tuple2!17206)

(assert (=> b!201237 (= lt!314007 (reader!0 thiss!1204 thiss!1204))))

(declare-fun isPrefixOf!0 (BitStream!8110 BitStream!8110) Bool)

(assert (=> b!201237 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-fun lt!314011 () Unit!14304)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8110) Unit!14304)

(assert (=> b!201237 (= lt!314011 (lemmaIsPrefixRefl!0 thiss!1204))))

(declare-fun b!201238 () Bool)

(declare-fun res!168492 () Bool)

(assert (=> b!201238 (=> (not res!168492) (not e!138026))))

(assert (=> b!201238 (= res!168492 (= i!590 nBits!348))))

(declare-fun b!201239 () Bool)

(assert (=> b!201239 (= e!138022 e!138026)))

(declare-fun res!168487 () Bool)

(assert (=> b!201239 (=> (not res!168487) (not e!138026))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!201239 (= res!168487 (validate_offset_bits!1 ((_ sign_extend 32) (size!4501 (buf!5002 thiss!1204))) ((_ sign_extend 32) (currentByte!9400 thiss!1204)) ((_ sign_extend 32) (currentBit!9395 thiss!1204)) lt!314008))))

(assert (=> b!201239 (= lt!314008 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!201240 () Bool)

(assert (=> b!201240 (= e!138024 (= (_1!9253 lt!314010) (_2!9254 lt!314007)))))

(declare-fun b!201241 () Bool)

(declare-fun array_inv!4242 (array!10220) Bool)

(assert (=> b!201241 (= e!138023 (array_inv!4242 (buf!5002 thiss!1204)))))

(declare-fun b!201242 () Bool)

(assert (=> b!201242 (= e!138026 e!138021)))

(declare-fun res!168489 () Bool)

(assert (=> b!201242 (=> (not res!168489) (not e!138021))))

(declare-fun lt!314009 () (_ BitVec 64))

(assert (=> b!201242 (= res!168489 (= lt!314009 (bvsub (bvadd lt!314009 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!201242 (= lt!314009 (bitIndex!0 (size!4501 (buf!5002 thiss!1204)) (currentByte!9400 thiss!1204) (currentBit!9395 thiss!1204)))))

(assert (= (and start!42638 res!168491) b!201239))

(assert (= (and b!201239 res!168487) b!201236))

(assert (= (and b!201236 res!168490) b!201238))

(assert (= (and b!201238 res!168492) b!201242))

(assert (= (and b!201242 res!168489) b!201237))

(assert (= (and b!201237 res!168488) b!201240))

(assert (= start!42638 b!201241))

(declare-fun m!311839 () Bool)

(assert (=> start!42638 m!311839))

(declare-fun m!311841 () Bool)

(assert (=> b!201242 m!311841))

(declare-fun m!311843 () Bool)

(assert (=> b!201236 m!311843))

(declare-fun m!311845 () Bool)

(assert (=> b!201239 m!311845))

(declare-fun m!311847 () Bool)

(assert (=> b!201241 m!311847))

(declare-fun m!311849 () Bool)

(assert (=> b!201237 m!311849))

(declare-fun m!311851 () Bool)

(assert (=> b!201237 m!311851))

(declare-fun m!311853 () Bool)

(assert (=> b!201237 m!311853))

(declare-fun m!311855 () Bool)

(assert (=> b!201237 m!311855))

(declare-fun m!311857 () Bool)

(assert (=> b!201237 m!311857))

(declare-fun m!311859 () Bool)

(assert (=> b!201237 m!311859))

(declare-fun m!311861 () Bool)

(assert (=> b!201237 m!311861))

(push 1)

(assert (not start!42638))

(assert (not b!201239))

(assert (not b!201241))

(assert (not b!201236))

(assert (not b!201237))

(assert (not b!201242))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!68929 () Bool)

(assert (=> d!68929 (validate_offset_bits!1 ((_ sign_extend 32) (size!4501 (buf!5002 thiss!1204))) ((_ sign_extend 32) (currentByte!9400 thiss!1204)) ((_ sign_extend 32) (currentBit!9395 thiss!1204)) lt!314008)))

(declare-fun lt!314050 () Unit!14304)

(declare-fun choose!9 (BitStream!8110 array!10220 (_ BitVec 64) BitStream!8110) Unit!14304)

(assert (=> d!68929 (= lt!314050 (choose!9 thiss!1204 (buf!5002 thiss!1204) lt!314008 (BitStream!8111 (buf!5002 thiss!1204) (currentByte!9400 thiss!1204) (currentBit!9395 thiss!1204))))))

(assert (=> d!68929 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5002 thiss!1204) lt!314008) lt!314050)))

(declare-fun bs!17007 () Bool)

(assert (= bs!17007 d!68929))

(assert (=> bs!17007 m!311845))

(declare-fun m!311911 () Bool)

(assert (=> bs!17007 m!311911))

(assert (=> b!201237 d!68929))

(declare-fun d!68931 () Bool)

(assert (=> d!68931 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!201237 d!68931))

(declare-fun d!68933 () Bool)

(assert (=> d!68933 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-fun lt!314053 () Unit!14304)

(declare-fun choose!11 (BitStream!8110) Unit!14304)

(assert (=> d!68933 (= lt!314053 (choose!11 thiss!1204))))

(assert (=> d!68933 (= (lemmaIsPrefixRefl!0 thiss!1204) lt!314053)))

(declare-fun bs!17010 () Bool)

(assert (= bs!17010 d!68933))

(assert (=> bs!17010 m!311853))

(declare-fun m!311915 () Bool)

(assert (=> bs!17010 m!311915))

(assert (=> b!201237 d!68933))

(declare-fun b!201319 () Bool)

(declare-fun e!138079 () Unit!14304)

(declare-fun lt!314178 () Unit!14304)

(assert (=> b!201319 (= e!138079 lt!314178)))

(declare-fun lt!314174 () (_ BitVec 64))

(assert (=> b!201319 (= lt!314174 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!314185 () (_ BitVec 64))

(assert (=> b!201319 (= lt!314185 (bitIndex!0 (size!4501 (buf!5002 thiss!1204)) (currentByte!9400 thiss!1204) (currentBit!9395 thiss!1204)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!10220 array!10220 (_ BitVec 64) (_ BitVec 64)) Unit!14304)

(assert (=> b!201319 (= lt!314178 (arrayBitRangesEqSymmetric!0 (buf!5002 thiss!1204) (buf!5002 thiss!1204) lt!314174 lt!314185))))

(declare-fun arrayBitRangesEq!0 (array!10220 array!10220 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!201319 (arrayBitRangesEq!0 (buf!5002 thiss!1204) (buf!5002 thiss!1204) lt!314174 lt!314185)))

(declare-fun b!201320 () Bool)

(declare-fun Unit!14311 () Unit!14304)

(assert (=> b!201320 (= e!138079 Unit!14311)))

(declare-fun lt!314184 () tuple2!17206)

(declare-fun b!201321 () Bool)

(declare-fun lt!314175 () (_ BitVec 64))

(declare-fun e!138080 () Bool)

(declare-fun lt!314188 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!8110 (_ BitVec 64)) BitStream!8110)

(assert (=> b!201321 (= e!138080 (= (_1!9254 lt!314184) (withMovedBitIndex!0 (_2!9254 lt!314184) (bvsub lt!314175 lt!314188))))))

(assert (=> b!201321 (or (= (bvand lt!314175 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!314188 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!314175 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!314175 lt!314188) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!201321 (= lt!314188 (bitIndex!0 (size!4501 (buf!5002 thiss!1204)) (currentByte!9400 thiss!1204) (currentBit!9395 thiss!1204)))))

(assert (=> b!201321 (= lt!314175 (bitIndex!0 (size!4501 (buf!5002 thiss!1204)) (currentByte!9400 thiss!1204) (currentBit!9395 thiss!1204)))))

(declare-fun b!201322 () Bool)

(declare-fun res!168553 () Bool)

(assert (=> b!201322 (=> (not res!168553) (not e!138080))))

(assert (=> b!201322 (= res!168553 (isPrefixOf!0 (_2!9254 lt!314184) thiss!1204))))

(declare-fun b!201323 () Bool)

(declare-fun res!168554 () Bool)

(assert (=> b!201323 (=> (not res!168554) (not e!138080))))

(assert (=> b!201323 (= res!168554 (isPrefixOf!0 (_1!9254 lt!314184) thiss!1204))))

(declare-fun d!68941 () Bool)

(assert (=> d!68941 e!138080))

(declare-fun res!168555 () Bool)

(assert (=> d!68941 (=> (not res!168555) (not e!138080))))

(assert (=> d!68941 (= res!168555 (isPrefixOf!0 (_1!9254 lt!314184) (_2!9254 lt!314184)))))

(declare-fun lt!314180 () BitStream!8110)

(assert (=> d!68941 (= lt!314184 (tuple2!17207 lt!314180 thiss!1204))))

(declare-fun lt!314179 () Unit!14304)

(declare-fun lt!314177 () Unit!14304)

(assert (=> d!68941 (= lt!314179 lt!314177)))

(assert (=> d!68941 (isPrefixOf!0 lt!314180 thiss!1204)))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8110 BitStream!8110 BitStream!8110) Unit!14304)

(assert (=> d!68941 (= lt!314177 (lemmaIsPrefixTransitive!0 lt!314180 thiss!1204 thiss!1204))))

(declare-fun lt!314171 () Unit!14304)

(declare-fun lt!314170 () Unit!14304)

(assert (=> d!68941 (= lt!314171 lt!314170)))

(assert (=> d!68941 (isPrefixOf!0 lt!314180 thiss!1204)))

(assert (=> d!68941 (= lt!314170 (lemmaIsPrefixTransitive!0 lt!314180 thiss!1204 thiss!1204))))

(declare-fun lt!314183 () Unit!14304)

(assert (=> d!68941 (= lt!314183 e!138079)))

(declare-fun c!10015 () Bool)

(assert (=> d!68941 (= c!10015 (not (= (size!4501 (buf!5002 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!314173 () Unit!14304)

(declare-fun lt!314187 () Unit!14304)

(assert (=> d!68941 (= lt!314173 lt!314187)))

(assert (=> d!68941 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!68941 (= lt!314187 (lemmaIsPrefixRefl!0 thiss!1204))))

(declare-fun lt!314186 () Unit!14304)

(declare-fun lt!314169 () Unit!14304)

(assert (=> d!68941 (= lt!314186 lt!314169)))

(assert (=> d!68941 (= lt!314169 (lemmaIsPrefixRefl!0 thiss!1204))))

(declare-fun lt!314182 () Unit!14304)

(declare-fun lt!314176 () Unit!14304)

(assert (=> d!68941 (= lt!314182 lt!314176)))

(assert (=> d!68941 (isPrefixOf!0 lt!314180 lt!314180)))

(assert (=> d!68941 (= lt!314176 (lemmaIsPrefixRefl!0 lt!314180))))

(declare-fun lt!314172 () Unit!14304)

(declare-fun lt!314181 () Unit!14304)

(assert (=> d!68941 (= lt!314172 lt!314181)))

(assert (=> d!68941 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!68941 (= lt!314181 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!68941 (= lt!314180 (BitStream!8111 (buf!5002 thiss!1204) (currentByte!9400 thiss!1204) (currentBit!9395 thiss!1204)))))

(assert (=> d!68941 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!68941 (= (reader!0 thiss!1204 thiss!1204) lt!314184)))

(assert (= (and d!68941 c!10015) b!201319))

(assert (= (and d!68941 (not c!10015)) b!201320))

(assert (= (and d!68941 res!168555) b!201323))

(assert (= (and b!201323 res!168554) b!201322))

(assert (= (and b!201322 res!168553) b!201321))

(declare-fun m!311949 () Bool)

(assert (=> b!201322 m!311949))

(declare-fun m!311951 () Bool)

(assert (=> d!68941 m!311951))

(declare-fun m!311953 () Bool)

(assert (=> d!68941 m!311953))

(declare-fun m!311955 () Bool)

(assert (=> d!68941 m!311955))

(declare-fun m!311957 () Bool)

(assert (=> d!68941 m!311957))

(assert (=> d!68941 m!311955))

(assert (=> d!68941 m!311853))

(assert (=> d!68941 m!311853))

(assert (=> d!68941 m!311851))

(assert (=> d!68941 m!311851))

(declare-fun m!311959 () Bool)

(assert (=> d!68941 m!311959))

(assert (=> d!68941 m!311853))

(assert (=> b!201319 m!311841))

(declare-fun m!311961 () Bool)

(assert (=> b!201319 m!311961))

(declare-fun m!311963 () Bool)

(assert (=> b!201319 m!311963))

(declare-fun m!311965 () Bool)

(assert (=> b!201323 m!311965))

(declare-fun m!311967 () Bool)

(assert (=> b!201321 m!311967))

(assert (=> b!201321 m!311841))

(assert (=> b!201321 m!311841))

(assert (=> b!201237 d!68941))

(declare-fun d!68969 () Bool)

(declare-fun res!168574 () Bool)

(declare-fun e!138092 () Bool)

(assert (=> d!68969 (=> (not res!168574) (not e!138092))))

(assert (=> d!68969 (= res!168574 (= (size!4501 (buf!5002 thiss!1204)) (size!4501 (buf!5002 thiss!1204))))))

(assert (=> d!68969 (= (isPrefixOf!0 thiss!1204 thiss!1204) e!138092)))

(declare-fun b!201346 () Bool)

(declare-fun res!168576 () Bool)

(assert (=> b!201346 (=> (not res!168576) (not e!138092))))

(assert (=> b!201346 (= res!168576 (bvsle (bitIndex!0 (size!4501 (buf!5002 thiss!1204)) (currentByte!9400 thiss!1204) (currentBit!9395 thiss!1204)) (bitIndex!0 (size!4501 (buf!5002 thiss!1204)) (currentByte!9400 thiss!1204) (currentBit!9395 thiss!1204))))))

(declare-fun b!201347 () Bool)

(declare-fun e!138093 () Bool)

(assert (=> b!201347 (= e!138092 e!138093)))

(declare-fun res!168575 () Bool)

(assert (=> b!201347 (=> res!168575 e!138093)))

(assert (=> b!201347 (= res!168575 (= (size!4501 (buf!5002 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!201348 () Bool)

(assert (=> b!201348 (= e!138093 (arrayBitRangesEq!0 (buf!5002 thiss!1204) (buf!5002 thiss!1204) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4501 (buf!5002 thiss!1204)) (currentByte!9400 thiss!1204) (currentBit!9395 thiss!1204))))))

(assert (= (and d!68969 res!168574) b!201346))

(assert (= (and b!201346 res!168576) b!201347))

(assert (= (and b!201347 (not res!168575)) b!201348))

(assert (=> b!201346 m!311841))

(assert (=> b!201346 m!311841))

(assert (=> b!201348 m!311841))

(assert (=> b!201348 m!311841))

(declare-fun m!311969 () Bool)

(assert (=> b!201348 m!311969))

(assert (=> b!201237 d!68969))

(declare-fun d!68971 () Bool)

(declare-datatypes ((tuple2!17220 0))(
  ( (tuple2!17221 (_1!9261 (_ BitVec 64)) (_2!9261 BitStream!8110)) )
))
(declare-fun lt!314269 () tuple2!17220)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!8110 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17220)

(assert (=> d!68971 (= lt!314269 (readNBitsLSBFirstsLoop!0 (_1!9254 lt!314007) nBits!348 i!590 (bvand v!189 (onesLSBLong!0 i!590))))))

(assert (=> d!68971 (= (readNBitsLSBFirstsLoopPure!0 (_1!9254 lt!314007) nBits!348 i!590 (bvand v!189 (onesLSBLong!0 i!590))) (tuple2!17205 (_2!9261 lt!314269) (_1!9261 lt!314269)))))

(declare-fun bs!17019 () Bool)

(assert (= bs!17019 d!68971))

(declare-fun m!311971 () Bool)

(assert (=> bs!17019 m!311971))

(assert (=> b!201237 d!68971))

(declare-fun d!68973 () Bool)

(assert (=> d!68973 (= (onesLSBLong!0 nBits!348) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!348))))))

(assert (=> b!201237 d!68973))

(declare-fun d!68975 () Bool)

(declare-fun e!138104 () Bool)

(assert (=> d!68975 e!138104))

(declare-fun res!168593 () Bool)

(assert (=> d!68975 (=> (not res!168593) (not e!138104))))

(declare-fun lt!314287 () (_ BitVec 64))

(declare-fun lt!314289 () (_ BitVec 64))

(declare-fun lt!314285 () (_ BitVec 64))

(assert (=> d!68975 (= res!168593 (= lt!314285 (bvsub lt!314287 lt!314289)))))

(assert (=> d!68975 (or (= (bvand lt!314287 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!314289 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!314287 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!314287 lt!314289) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!68975 (= lt!314289 (remainingBits!0 ((_ sign_extend 32) (size!4501 (buf!5002 thiss!1204))) ((_ sign_extend 32) (currentByte!9400 thiss!1204)) ((_ sign_extend 32) (currentBit!9395 thiss!1204))))))

(declare-fun lt!314286 () (_ BitVec 64))

(declare-fun lt!314288 () (_ BitVec 64))

(assert (=> d!68975 (= lt!314287 (bvmul lt!314286 lt!314288))))

(assert (=> d!68975 (or (= lt!314286 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!314288 (bvsdiv (bvmul lt!314286 lt!314288) lt!314286)))))

(assert (=> d!68975 (= lt!314288 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!68975 (= lt!314286 ((_ sign_extend 32) (size!4501 (buf!5002 thiss!1204))))))

(assert (=> d!68975 (= lt!314285 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9400 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9395 thiss!1204))))))

(assert (=> d!68975 (invariant!0 (currentBit!9395 thiss!1204) (currentByte!9400 thiss!1204) (size!4501 (buf!5002 thiss!1204)))))

(assert (=> d!68975 (= (bitIndex!0 (size!4501 (buf!5002 thiss!1204)) (currentByte!9400 thiss!1204) (currentBit!9395 thiss!1204)) lt!314285)))

(declare-fun b!201367 () Bool)

(declare-fun res!168594 () Bool)

(assert (=> b!201367 (=> (not res!168594) (not e!138104))))

(assert (=> b!201367 (= res!168594 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!314285))))

(declare-fun b!201368 () Bool)

(declare-fun lt!314290 () (_ BitVec 64))

(assert (=> b!201368 (= e!138104 (bvsle lt!314285 (bvmul lt!314290 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!201368 (or (= lt!314290 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!314290 #b0000000000000000000000000000000000000000000000000000000000001000) lt!314290)))))

(assert (=> b!201368 (= lt!314290 ((_ sign_extend 32) (size!4501 (buf!5002 thiss!1204))))))

(assert (= (and d!68975 res!168593) b!201367))

(assert (= (and b!201367 res!168594) b!201368))

(declare-fun m!311999 () Bool)

(assert (=> d!68975 m!311999))

(assert (=> d!68975 m!311843))

(assert (=> b!201242 d!68975))

(declare-fun d!68987 () Bool)

(assert (=> d!68987 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4501 (buf!5002 thiss!1204))) ((_ sign_extend 32) (currentByte!9400 thiss!1204)) ((_ sign_extend 32) (currentBit!9395 thiss!1204)) lt!314008) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4501 (buf!5002 thiss!1204))) ((_ sign_extend 32) (currentByte!9400 thiss!1204)) ((_ sign_extend 32) (currentBit!9395 thiss!1204))) lt!314008))))

(declare-fun bs!17022 () Bool)

(assert (= bs!17022 d!68987))

(assert (=> bs!17022 m!311999))

(assert (=> b!201239 d!68987))

(declare-fun d!68989 () Bool)

(assert (=> d!68989 (= (array_inv!4242 (buf!5002 thiss!1204)) (bvsge (size!4501 (buf!5002 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!201241 d!68989))

(declare-fun d!68991 () Bool)

(assert (=> d!68991 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9395 thiss!1204) (currentByte!9400 thiss!1204) (size!4501 (buf!5002 thiss!1204))))))

(declare-fun bs!17023 () Bool)

(assert (= bs!17023 d!68991))

(assert (=> bs!17023 m!311843))

(assert (=> start!42638 d!68991))

(declare-fun d!68993 () Bool)

(assert (=> d!68993 (= (invariant!0 (currentBit!9395 thiss!1204) (currentByte!9400 thiss!1204) (size!4501 (buf!5002 thiss!1204))) (and (bvsge (currentBit!9395 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9395 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9400 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9400 thiss!1204) (size!4501 (buf!5002 thiss!1204))) (and (= (currentBit!9395 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9400 thiss!1204) (size!4501 (buf!5002 thiss!1204)))))))))

(assert (=> b!201236 d!68993))

(push 1)

(assert (not d!68975))

(assert (not d!68933))

(assert (not d!68991))

(assert (not b!201319))

(assert (not b!201321))

(assert (not b!201346))

(assert (not d!68971))

(assert (not d!68941))

(assert (not b!201323))

(assert (not d!68929))

(assert (not b!201348))

(assert (not d!68987))

(assert (not b!201322))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!69001 () Bool)

(declare-fun res!168601 () Bool)

(declare-fun e!138108 () Bool)

(assert (=> d!69001 (=> (not res!168601) (not e!138108))))

(assert (=> d!69001 (= res!168601 (= (size!4501 (buf!5002 (_2!9254 lt!314184))) (size!4501 (buf!5002 thiss!1204))))))

(assert (=> d!69001 (= (isPrefixOf!0 (_2!9254 lt!314184) thiss!1204) e!138108)))

(declare-fun b!201375 () Bool)

(declare-fun res!168603 () Bool)

(assert (=> b!201375 (=> (not res!168603) (not e!138108))))

(assert (=> b!201375 (= res!168603 (bvsle (bitIndex!0 (size!4501 (buf!5002 (_2!9254 lt!314184))) (currentByte!9400 (_2!9254 lt!314184)) (currentBit!9395 (_2!9254 lt!314184))) (bitIndex!0 (size!4501 (buf!5002 thiss!1204)) (currentByte!9400 thiss!1204) (currentBit!9395 thiss!1204))))))

(declare-fun b!201376 () Bool)

(declare-fun e!138109 () Bool)

(assert (=> b!201376 (= e!138108 e!138109)))

(declare-fun res!168602 () Bool)

(assert (=> b!201376 (=> res!168602 e!138109)))

(assert (=> b!201376 (= res!168602 (= (size!4501 (buf!5002 (_2!9254 lt!314184))) #b00000000000000000000000000000000))))

(declare-fun b!201377 () Bool)

(assert (=> b!201377 (= e!138109 (arrayBitRangesEq!0 (buf!5002 (_2!9254 lt!314184)) (buf!5002 thiss!1204) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4501 (buf!5002 (_2!9254 lt!314184))) (currentByte!9400 (_2!9254 lt!314184)) (currentBit!9395 (_2!9254 lt!314184)))))))

(assert (= (and d!69001 res!168601) b!201375))

(assert (= (and b!201375 res!168603) b!201376))

(assert (= (and b!201376 (not res!168602)) b!201377))

(declare-fun m!312001 () Bool)

(assert (=> b!201375 m!312001))

(assert (=> b!201375 m!311841))

(assert (=> b!201377 m!312001))

(assert (=> b!201377 m!312001))

(declare-fun m!312003 () Bool)

(assert (=> b!201377 m!312003))

(assert (=> b!201322 d!69001))

(assert (=> d!68929 d!68987))

(declare-fun d!69003 () Bool)

(assert (=> d!69003 (validate_offset_bits!1 ((_ sign_extend 32) (size!4501 (buf!5002 thiss!1204))) ((_ sign_extend 32) (currentByte!9400 thiss!1204)) ((_ sign_extend 32) (currentBit!9395 thiss!1204)) lt!314008)))

(assert (=> d!69003 true))

(declare-fun _$6!387 () Unit!14304)

(assert (=> d!69003 (= (choose!9 thiss!1204 (buf!5002 thiss!1204) lt!314008 (BitStream!8111 (buf!5002 thiss!1204) (currentByte!9400 thiss!1204) (currentBit!9395 thiss!1204))) _$6!387)))

(declare-fun bs!17025 () Bool)

(assert (= bs!17025 d!69003))

(assert (=> bs!17025 m!311845))

(assert (=> d!68929 d!69003))

(declare-fun d!69005 () Bool)

(declare-fun res!168604 () Bool)

(declare-fun e!138110 () Bool)

(assert (=> d!69005 (=> (not res!168604) (not e!138110))))

(assert (=> d!69005 (= res!168604 (= (size!4501 (buf!5002 (_1!9254 lt!314184))) (size!4501 (buf!5002 thiss!1204))))))

(assert (=> d!69005 (= (isPrefixOf!0 (_1!9254 lt!314184) thiss!1204) e!138110)))

(declare-fun b!201378 () Bool)

(declare-fun res!168606 () Bool)

(assert (=> b!201378 (=> (not res!168606) (not e!138110))))

(assert (=> b!201378 (= res!168606 (bvsle (bitIndex!0 (size!4501 (buf!5002 (_1!9254 lt!314184))) (currentByte!9400 (_1!9254 lt!314184)) (currentBit!9395 (_1!9254 lt!314184))) (bitIndex!0 (size!4501 (buf!5002 thiss!1204)) (currentByte!9400 thiss!1204) (currentBit!9395 thiss!1204))))))

(declare-fun b!201379 () Bool)

(declare-fun e!138111 () Bool)

(assert (=> b!201379 (= e!138110 e!138111)))

(declare-fun res!168605 () Bool)

(assert (=> b!201379 (=> res!168605 e!138111)))

(assert (=> b!201379 (= res!168605 (= (size!4501 (buf!5002 (_1!9254 lt!314184))) #b00000000000000000000000000000000))))

(declare-fun b!201380 () Bool)

(assert (=> b!201380 (= e!138111 (arrayBitRangesEq!0 (buf!5002 (_1!9254 lt!314184)) (buf!5002 thiss!1204) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4501 (buf!5002 (_1!9254 lt!314184))) (currentByte!9400 (_1!9254 lt!314184)) (currentBit!9395 (_1!9254 lt!314184)))))))

(assert (= (and d!69005 res!168604) b!201378))

(assert (= (and b!201378 res!168606) b!201379))

(assert (= (and b!201379 (not res!168605)) b!201380))

(declare-fun m!312005 () Bool)

(assert (=> b!201378 m!312005))

(assert (=> b!201378 m!311841))

(assert (=> b!201380 m!312005))

(assert (=> b!201380 m!312005))

(declare-fun m!312007 () Bool)

(assert (=> b!201380 m!312007))

(assert (=> b!201323 d!69005))

(declare-fun d!69007 () Bool)

(assert (=> d!69007 (= (remainingBits!0 ((_ sign_extend 32) (size!4501 (buf!5002 thiss!1204))) ((_ sign_extend 32) (currentByte!9400 thiss!1204)) ((_ sign_extend 32) (currentBit!9395 thiss!1204))) (bvsub (bvmul ((_ sign_extend 32) (size!4501 (buf!5002 thiss!1204))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9400 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9395 thiss!1204)))))))

(assert (=> d!68987 d!69007))

(assert (=> b!201346 d!68975))

(assert (=> d!68991 d!68993))

(declare-fun b!201395 () Bool)

(declare-fun e!138128 () Bool)

(declare-fun e!138125 () Bool)

(assert (=> b!201395 (= e!138128 e!138125)))

(declare-fun c!10021 () Bool)

(declare-datatypes ((tuple4!270 0))(
  ( (tuple4!271 (_1!9262 (_ BitVec 32)) (_2!9262 (_ BitVec 32)) (_3!651 (_ BitVec 32)) (_4!135 (_ BitVec 32))) )
))
(declare-fun lt!314317 () tuple4!270)

(assert (=> b!201395 (= c!10021 (= (_3!651 lt!314317) (_4!135 lt!314317)))))

(declare-fun b!201396 () Bool)

(declare-fun res!168620 () Bool)

(declare-fun lt!314316 () (_ BitVec 32))

(assert (=> b!201396 (= res!168620 (= lt!314316 #b00000000000000000000000000000000))))

(declare-fun e!138124 () Bool)

(assert (=> b!201396 (=> res!168620 e!138124)))

(declare-fun e!138127 () Bool)

(assert (=> b!201396 (= e!138127 e!138124)))

(declare-fun b!201397 () Bool)

(declare-fun e!138129 () Bool)

(assert (=> b!201397 (= e!138129 e!138128)))

(declare-fun res!168619 () Bool)

(assert (=> b!201397 (=> (not res!168619) (not e!138128))))

(declare-fun e!138126 () Bool)

(assert (=> b!201397 (= res!168619 e!138126)))

(declare-fun res!168617 () Bool)

(assert (=> b!201397 (=> res!168617 e!138126)))

(assert (=> b!201397 (= res!168617 (bvsge (_1!9262 lt!314317) (_2!9262 lt!314317)))))

(assert (=> b!201397 (= lt!314316 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!4501 (buf!5002 thiss!1204)) (currentByte!9400 thiss!1204) (currentBit!9395 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!314315 () (_ BitVec 32))

(assert (=> b!201397 (= lt!314315 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!270)

(assert (=> b!201397 (= lt!314317 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4501 (buf!5002 thiss!1204)) (currentByte!9400 thiss!1204) (currentBit!9395 thiss!1204))))))

(declare-fun b!201398 () Bool)

(declare-fun call!3179 () Bool)

(assert (=> b!201398 (= e!138124 call!3179)))

(declare-fun bm!3176 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!3176 (= call!3179 (byteRangesEq!0 (ite c!10021 (select (arr!5431 (buf!5002 thiss!1204)) (_3!651 lt!314317)) (select (arr!5431 (buf!5002 thiss!1204)) (_4!135 lt!314317))) (ite c!10021 (select (arr!5431 (buf!5002 thiss!1204)) (_3!651 lt!314317)) (select (arr!5431 (buf!5002 thiss!1204)) (_4!135 lt!314317))) (ite c!10021 lt!314315 #b00000000000000000000000000000000) lt!314316))))

(declare-fun d!69009 () Bool)

(declare-fun res!168621 () Bool)

(assert (=> d!69009 (=> res!168621 e!138129)))

(assert (=> d!69009 (= res!168621 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4501 (buf!5002 thiss!1204)) (currentByte!9400 thiss!1204) (currentBit!9395 thiss!1204))))))

(assert (=> d!69009 (= (arrayBitRangesEq!0 (buf!5002 thiss!1204) (buf!5002 thiss!1204) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4501 (buf!5002 thiss!1204)) (currentByte!9400 thiss!1204) (currentBit!9395 thiss!1204))) e!138129)))

(declare-fun b!201399 () Bool)

(assert (=> b!201399 (= e!138125 e!138127)))

(declare-fun res!168618 () Bool)

(assert (=> b!201399 (= res!168618 (byteRangesEq!0 (select (arr!5431 (buf!5002 thiss!1204)) (_3!651 lt!314317)) (select (arr!5431 (buf!5002 thiss!1204)) (_3!651 lt!314317)) lt!314315 #b00000000000000000000000000001000))))

(assert (=> b!201399 (=> (not res!168618) (not e!138127))))

(declare-fun b!201400 () Bool)

(declare-fun arrayRangesEq!697 (array!10220 array!10220 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!201400 (= e!138126 (arrayRangesEq!697 (buf!5002 thiss!1204) (buf!5002 thiss!1204) (_1!9262 lt!314317) (_2!9262 lt!314317)))))

(declare-fun b!201401 () Bool)

(assert (=> b!201401 (= e!138125 call!3179)))

(assert (= (and d!69009 (not res!168621)) b!201397))

(assert (= (and b!201397 (not res!168617)) b!201400))

(assert (= (and b!201397 res!168619) b!201395))

(assert (= (and b!201395 c!10021) b!201401))

(assert (= (and b!201395 (not c!10021)) b!201399))

(assert (= (and b!201399 res!168618) b!201396))

(assert (= (and b!201396 (not res!168620)) b!201398))

(assert (= (or b!201401 b!201398) bm!3176))

(assert (=> b!201397 m!311841))

(declare-fun m!312009 () Bool)

(assert (=> b!201397 m!312009))

(declare-fun m!312011 () Bool)

(assert (=> bm!3176 m!312011))

(assert (=> bm!3176 m!312011))

(declare-fun m!312013 () Bool)

(assert (=> bm!3176 m!312013))

(declare-fun m!312015 () Bool)

(assert (=> bm!3176 m!312015))

(assert (=> bm!3176 m!312015))

(assert (=> b!201399 m!312011))

(assert (=> b!201399 m!312011))

(assert (=> b!201399 m!312011))

(assert (=> b!201399 m!312011))

(declare-fun m!312017 () Bool)

(assert (=> b!201399 m!312017))

(declare-fun m!312019 () Bool)

(assert (=> b!201400 m!312019))

(assert (=> b!201348 d!69009))

(assert (=> b!201348 d!68975))

(assert (=> d!68941 d!68933))

(declare-fun d!69011 () Bool)

(declare-fun res!168622 () Bool)

(declare-fun e!138130 () Bool)

(assert (=> d!69011 (=> (not res!168622) (not e!138130))))

(assert (=> d!69011 (= res!168622 (= (size!4501 (buf!5002 lt!314180)) (size!4501 (buf!5002 thiss!1204))))))

(assert (=> d!69011 (= (isPrefixOf!0 lt!314180 thiss!1204) e!138130)))

(declare-fun b!201402 () Bool)

(declare-fun res!168624 () Bool)

(assert (=> b!201402 (=> (not res!168624) (not e!138130))))

(assert (=> b!201402 (= res!168624 (bvsle (bitIndex!0 (size!4501 (buf!5002 lt!314180)) (currentByte!9400 lt!314180) (currentBit!9395 lt!314180)) (bitIndex!0 (size!4501 (buf!5002 thiss!1204)) (currentByte!9400 thiss!1204) (currentBit!9395 thiss!1204))))))

(declare-fun b!201403 () Bool)

(declare-fun e!138131 () Bool)

(assert (=> b!201403 (= e!138130 e!138131)))

(declare-fun res!168623 () Bool)

(assert (=> b!201403 (=> res!168623 e!138131)))

(assert (=> b!201403 (= res!168623 (= (size!4501 (buf!5002 lt!314180)) #b00000000000000000000000000000000))))

(declare-fun b!201404 () Bool)

(assert (=> b!201404 (= e!138131 (arrayBitRangesEq!0 (buf!5002 lt!314180) (buf!5002 thiss!1204) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4501 (buf!5002 lt!314180)) (currentByte!9400 lt!314180) (currentBit!9395 lt!314180))))))

(assert (= (and d!69011 res!168622) b!201402))

(assert (= (and b!201402 res!168624) b!201403))

(assert (= (and b!201403 (not res!168623)) b!201404))

(declare-fun m!312021 () Bool)

(assert (=> b!201402 m!312021))

(assert (=> b!201402 m!311841))

(assert (=> b!201404 m!312021))

(assert (=> b!201404 m!312021))

(declare-fun m!312023 () Bool)

(assert (=> b!201404 m!312023))

(assert (=> d!68941 d!69011))

(declare-fun d!69013 () Bool)

(declare-fun res!168625 () Bool)

(declare-fun e!138132 () Bool)

(assert (=> d!69013 (=> (not res!168625) (not e!138132))))

(assert (=> d!69013 (= res!168625 (= (size!4501 (buf!5002 (_1!9254 lt!314184))) (size!4501 (buf!5002 (_2!9254 lt!314184)))))))

(assert (=> d!69013 (= (isPrefixOf!0 (_1!9254 lt!314184) (_2!9254 lt!314184)) e!138132)))

(declare-fun b!201405 () Bool)

(declare-fun res!168627 () Bool)

(assert (=> b!201405 (=> (not res!168627) (not e!138132))))

(assert (=> b!201405 (= res!168627 (bvsle (bitIndex!0 (size!4501 (buf!5002 (_1!9254 lt!314184))) (currentByte!9400 (_1!9254 lt!314184)) (currentBit!9395 (_1!9254 lt!314184))) (bitIndex!0 (size!4501 (buf!5002 (_2!9254 lt!314184))) (currentByte!9400 (_2!9254 lt!314184)) (currentBit!9395 (_2!9254 lt!314184)))))))

(declare-fun b!201406 () Bool)

(declare-fun e!138133 () Bool)

(assert (=> b!201406 (= e!138132 e!138133)))

(declare-fun res!168626 () Bool)

(assert (=> b!201406 (=> res!168626 e!138133)))

(assert (=> b!201406 (= res!168626 (= (size!4501 (buf!5002 (_1!9254 lt!314184))) #b00000000000000000000000000000000))))

(declare-fun b!201407 () Bool)

(assert (=> b!201407 (= e!138133 (arrayBitRangesEq!0 (buf!5002 (_1!9254 lt!314184)) (buf!5002 (_2!9254 lt!314184)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4501 (buf!5002 (_1!9254 lt!314184))) (currentByte!9400 (_1!9254 lt!314184)) (currentBit!9395 (_1!9254 lt!314184)))))))

(assert (= (and d!69013 res!168625) b!201405))

(assert (= (and b!201405 res!168627) b!201406))

(assert (= (and b!201406 (not res!168626)) b!201407))

(assert (=> b!201405 m!312005))

(assert (=> b!201405 m!312001))

(assert (=> b!201407 m!312005))

(assert (=> b!201407 m!312005))

(declare-fun m!312025 () Bool)

(assert (=> b!201407 m!312025))

(assert (=> d!68941 d!69013))

(declare-fun d!69015 () Bool)

(assert (=> d!69015 (isPrefixOf!0 lt!314180 thiss!1204)))

(declare-fun lt!314320 () Unit!14304)

(declare-fun choose!30 (BitStream!8110 BitStream!8110 BitStream!8110) Unit!14304)

(assert (=> d!69015 (= lt!314320 (choose!30 lt!314180 thiss!1204 thiss!1204))))

(assert (=> d!69015 (isPrefixOf!0 lt!314180 thiss!1204)))

(assert (=> d!69015 (= (lemmaIsPrefixTransitive!0 lt!314180 thiss!1204 thiss!1204) lt!314320)))

(declare-fun bs!17026 () Bool)

(assert (= bs!17026 d!69015))

(assert (=> bs!17026 m!311951))

(declare-fun m!312027 () Bool)

(assert (=> bs!17026 m!312027))

(assert (=> bs!17026 m!311951))

(assert (=> d!68941 d!69015))

(assert (=> d!68941 d!68969))

(declare-fun d!69017 () Bool)

(declare-fun res!168628 () Bool)

(declare-fun e!138134 () Bool)

(assert (=> d!69017 (=> (not res!168628) (not e!138134))))

(assert (=> d!69017 (= res!168628 (= (size!4501 (buf!5002 lt!314180)) (size!4501 (buf!5002 lt!314180))))))

(assert (=> d!69017 (= (isPrefixOf!0 lt!314180 lt!314180) e!138134)))

(declare-fun b!201408 () Bool)

(declare-fun res!168630 () Bool)

(assert (=> b!201408 (=> (not res!168630) (not e!138134))))

(assert (=> b!201408 (= res!168630 (bvsle (bitIndex!0 (size!4501 (buf!5002 lt!314180)) (currentByte!9400 lt!314180) (currentBit!9395 lt!314180)) (bitIndex!0 (size!4501 (buf!5002 lt!314180)) (currentByte!9400 lt!314180) (currentBit!9395 lt!314180))))))

(declare-fun b!201409 () Bool)

(declare-fun e!138135 () Bool)

(assert (=> b!201409 (= e!138134 e!138135)))

(declare-fun res!168629 () Bool)

(assert (=> b!201409 (=> res!168629 e!138135)))

(assert (=> b!201409 (= res!168629 (= (size!4501 (buf!5002 lt!314180)) #b00000000000000000000000000000000))))

(declare-fun b!201410 () Bool)

(assert (=> b!201410 (= e!138135 (arrayBitRangesEq!0 (buf!5002 lt!314180) (buf!5002 lt!314180) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4501 (buf!5002 lt!314180)) (currentByte!9400 lt!314180) (currentBit!9395 lt!314180))))))

(assert (= (and d!69017 res!168628) b!201408))

(assert (= (and b!201408 res!168630) b!201409))

(assert (= (and b!201409 (not res!168629)) b!201410))

(assert (=> b!201408 m!312021))

(assert (=> b!201408 m!312021))

(assert (=> b!201410 m!312021))

(assert (=> b!201410 m!312021))

(declare-fun m!312029 () Bool)

(assert (=> b!201410 m!312029))

(assert (=> d!68941 d!69017))

(declare-fun d!69019 () Bool)

(assert (=> d!69019 (isPrefixOf!0 lt!314180 lt!314180)))

(declare-fun lt!314321 () Unit!14304)

(assert (=> d!69019 (= lt!314321 (choose!11 lt!314180))))

(assert (=> d!69019 (= (lemmaIsPrefixRefl!0 lt!314180) lt!314321)))

(declare-fun bs!17027 () Bool)

(assert (= bs!17027 d!69019))

(assert (=> bs!17027 m!311953))

(declare-fun m!312031 () Bool)

(assert (=> bs!17027 m!312031))

(assert (=> d!68941 d!69019))

(assert (=> d!68975 d!69007))

(assert (=> d!68975 d!68993))

(assert (=> d!68933 d!68969))

(declare-fun d!69021 () Bool)

(assert (=> d!69021 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!69021 true))

(declare-fun _$14!322 () Unit!14304)

(assert (=> d!69021 (= (choose!11 thiss!1204) _$14!322)))

(declare-fun bs!17029 () Bool)

(assert (= bs!17029 d!69021))

(assert (=> bs!17029 m!311853))

(assert (=> d!68933 d!69021))

(assert (=> b!201319 d!68975))

(declare-fun d!69023 () Bool)

(assert (=> d!69023 (arrayBitRangesEq!0 (buf!5002 thiss!1204) (buf!5002 thiss!1204) lt!314174 lt!314185)))

(declare-fun lt!314324 () Unit!14304)

(declare-fun choose!8 (array!10220 array!10220 (_ BitVec 64) (_ BitVec 64)) Unit!14304)

(assert (=> d!69023 (= lt!314324 (choose!8 (buf!5002 thiss!1204) (buf!5002 thiss!1204) lt!314174 lt!314185))))

(assert (=> d!69023 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!314174) (bvsle lt!314174 lt!314185))))

(assert (=> d!69023 (= (arrayBitRangesEqSymmetric!0 (buf!5002 thiss!1204) (buf!5002 thiss!1204) lt!314174 lt!314185) lt!314324)))

(declare-fun bs!17030 () Bool)

(assert (= bs!17030 d!69023))

(assert (=> bs!17030 m!311963))

(declare-fun m!312033 () Bool)

(assert (=> bs!17030 m!312033))

(assert (=> b!201319 d!69023))

(declare-fun b!201411 () Bool)

(declare-fun e!138140 () Bool)

(declare-fun e!138137 () Bool)

(assert (=> b!201411 (= e!138140 e!138137)))

(declare-fun c!10022 () Bool)

(declare-fun lt!314327 () tuple4!270)

(assert (=> b!201411 (= c!10022 (= (_3!651 lt!314327) (_4!135 lt!314327)))))

(declare-fun b!201412 () Bool)

(declare-fun res!168634 () Bool)

(declare-fun lt!314326 () (_ BitVec 32))

(assert (=> b!201412 (= res!168634 (= lt!314326 #b00000000000000000000000000000000))))

(declare-fun e!138136 () Bool)

(assert (=> b!201412 (=> res!168634 e!138136)))

(declare-fun e!138139 () Bool)

(assert (=> b!201412 (= e!138139 e!138136)))

(declare-fun b!201413 () Bool)

(declare-fun e!138141 () Bool)

(assert (=> b!201413 (= e!138141 e!138140)))

(declare-fun res!168633 () Bool)

(assert (=> b!201413 (=> (not res!168633) (not e!138140))))

(declare-fun e!138138 () Bool)

(assert (=> b!201413 (= res!168633 e!138138)))

(declare-fun res!168631 () Bool)

(assert (=> b!201413 (=> res!168631 e!138138)))

(assert (=> b!201413 (= res!168631 (bvsge (_1!9262 lt!314327) (_2!9262 lt!314327)))))

(assert (=> b!201413 (= lt!314326 ((_ extract 31 0) (bvsrem lt!314185 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!314325 () (_ BitVec 32))

(assert (=> b!201413 (= lt!314325 ((_ extract 31 0) (bvsrem lt!314174 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!201413 (= lt!314327 (arrayBitIndices!0 lt!314174 lt!314185))))

(declare-fun b!201414 () Bool)

(declare-fun call!3180 () Bool)

(assert (=> b!201414 (= e!138136 call!3180)))

(declare-fun bm!3177 () Bool)

(assert (=> bm!3177 (= call!3180 (byteRangesEq!0 (ite c!10022 (select (arr!5431 (buf!5002 thiss!1204)) (_3!651 lt!314327)) (select (arr!5431 (buf!5002 thiss!1204)) (_4!135 lt!314327))) (ite c!10022 (select (arr!5431 (buf!5002 thiss!1204)) (_3!651 lt!314327)) (select (arr!5431 (buf!5002 thiss!1204)) (_4!135 lt!314327))) (ite c!10022 lt!314325 #b00000000000000000000000000000000) lt!314326))))

(declare-fun d!69025 () Bool)

(declare-fun res!168635 () Bool)

(assert (=> d!69025 (=> res!168635 e!138141)))

(assert (=> d!69025 (= res!168635 (bvsge lt!314174 lt!314185))))

(assert (=> d!69025 (= (arrayBitRangesEq!0 (buf!5002 thiss!1204) (buf!5002 thiss!1204) lt!314174 lt!314185) e!138141)))

(declare-fun b!201415 () Bool)

(assert (=> b!201415 (= e!138137 e!138139)))

(declare-fun res!168632 () Bool)

(assert (=> b!201415 (= res!168632 (byteRangesEq!0 (select (arr!5431 (buf!5002 thiss!1204)) (_3!651 lt!314327)) (select (arr!5431 (buf!5002 thiss!1204)) (_3!651 lt!314327)) lt!314325 #b00000000000000000000000000001000))))

(assert (=> b!201415 (=> (not res!168632) (not e!138139))))

(declare-fun b!201416 () Bool)

(assert (=> b!201416 (= e!138138 (arrayRangesEq!697 (buf!5002 thiss!1204) (buf!5002 thiss!1204) (_1!9262 lt!314327) (_2!9262 lt!314327)))))

(declare-fun b!201417 () Bool)

(assert (=> b!201417 (= e!138137 call!3180)))

(assert (= (and d!69025 (not res!168635)) b!201413))

(assert (= (and b!201413 (not res!168631)) b!201416))

(assert (= (and b!201413 res!168633) b!201411))

(assert (= (and b!201411 c!10022) b!201417))

(assert (= (and b!201411 (not c!10022)) b!201415))

(assert (= (and b!201415 res!168632) b!201412))

(assert (= (and b!201412 (not res!168634)) b!201414))

(assert (= (or b!201417 b!201414) bm!3177))

(declare-fun m!312035 () Bool)

(assert (=> b!201413 m!312035))

(declare-fun m!312037 () Bool)

(assert (=> bm!3177 m!312037))

(assert (=> bm!3177 m!312037))

(declare-fun m!312039 () Bool)

(assert (=> bm!3177 m!312039))

(declare-fun m!312041 () Bool)

(assert (=> bm!3177 m!312041))

(assert (=> bm!3177 m!312041))

(assert (=> b!201415 m!312037))

(assert (=> b!201415 m!312037))

(assert (=> b!201415 m!312037))

(assert (=> b!201415 m!312037))

(declare-fun m!312043 () Bool)

(assert (=> b!201415 m!312043))

(declare-fun m!312045 () Bool)

(assert (=> b!201416 m!312045))

(assert (=> b!201319 d!69025))

(declare-fun b!201432 () Bool)

(declare-fun lt!314340 () tuple2!17220)

(declare-fun e!138150 () Bool)

(declare-fun lt!314344 () (_ BitVec 64))

(declare-datatypes ((tuple2!17222 0))(
  ( (tuple2!17223 (_1!9263 BitStream!8110) (_2!9263 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!8110) tuple2!17222)

(assert (=> b!201432 (= e!138150 (= (= (bvand (bvlshr (_1!9261 lt!314340) lt!314344) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!9263 (readBitPure!0 (_1!9254 lt!314007)))))))

(assert (=> b!201432 (and (bvsge lt!314344 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!314344 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!201432 (= lt!314344 ((_ sign_extend 32) i!590))))

(declare-fun d!69027 () Bool)

(declare-fun e!138148 () Bool)

(assert (=> d!69027 e!138148))

(declare-fun res!168647 () Bool)

(assert (=> d!69027 (=> (not res!168647) (not e!138148))))

(assert (=> d!69027 (= res!168647 (= (buf!5002 (_2!9261 lt!314340)) (buf!5002 (_1!9254 lt!314007))))))

(declare-fun e!138149 () tuple2!17220)

(assert (=> d!69027 (= lt!314340 e!138149)))

(declare-fun c!10025 () Bool)

(assert (=> d!69027 (= c!10025 (= nBits!348 i!590))))

(assert (=> d!69027 (and (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!69027 (= (readNBitsLSBFirstsLoop!0 (_1!9254 lt!314007) nBits!348 i!590 (bvand v!189 (onesLSBLong!0 i!590))) lt!314340)))

(declare-fun b!201433 () Bool)

(declare-fun res!168650 () Bool)

(assert (=> b!201433 (=> (not res!168650) (not e!138148))))

(assert (=> b!201433 (= res!168650 (= (bvand (_1!9261 lt!314340) (onesLSBLong!0 nBits!348)) (_1!9261 lt!314340)))))

(declare-fun b!201434 () Bool)

(declare-fun res!168646 () Bool)

(assert (=> b!201434 (=> (not res!168646) (not e!138148))))

(declare-fun lt!314343 () (_ BitVec 64))

(declare-fun lt!314341 () (_ BitVec 64))

(assert (=> b!201434 (= res!168646 (= (bitIndex!0 (size!4501 (buf!5002 (_2!9261 lt!314340))) (currentByte!9400 (_2!9261 lt!314340)) (currentBit!9395 (_2!9261 lt!314340))) (bvadd lt!314343 lt!314341)))))

(assert (=> b!201434 (or (not (= (bvand lt!314343 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!314341 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!314343 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!314343 lt!314341) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!201434 (= lt!314341 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(assert (=> b!201434 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand i!590 #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 i!590) #b10000000000000000000000000000000)))))

(assert (=> b!201434 (= lt!314343 (bitIndex!0 (size!4501 (buf!5002 (_1!9254 lt!314007))) (currentByte!9400 (_1!9254 lt!314007)) (currentBit!9395 (_1!9254 lt!314007))))))

(declare-fun b!201435 () Bool)

(assert (=> b!201435 (= e!138149 (tuple2!17221 (bvand v!189 (onesLSBLong!0 i!590)) (_1!9254 lt!314007)))))

(declare-fun b!201436 () Bool)

(assert (=> b!201436 (= e!138148 e!138150)))

(declare-fun res!168648 () Bool)

(assert (=> b!201436 (=> res!168648 e!138150)))

(assert (=> b!201436 (= res!168648 (not (bvslt i!590 nBits!348)))))

(declare-fun b!201437 () Bool)

(declare-fun res!168649 () Bool)

(assert (=> b!201437 (=> (not res!168649) (not e!138148))))

(assert (=> b!201437 (= res!168649 (= (bvand (_1!9261 lt!314340) (onesLSBLong!0 i!590)) (bvand (bvand v!189 (onesLSBLong!0 i!590)) (onesLSBLong!0 i!590))))))

(declare-fun b!201438 () Bool)

(declare-fun lt!314345 () tuple2!17220)

(assert (=> b!201438 (= e!138149 (tuple2!17221 (_1!9261 lt!314345) (_2!9261 lt!314345)))))

(declare-datatypes ((tuple2!17224 0))(
  ( (tuple2!17225 (_1!9264 Bool) (_2!9264 BitStream!8110)) )
))
(declare-fun lt!314342 () tuple2!17224)

(declare-fun readBit!0 (BitStream!8110) tuple2!17224)

(assert (=> b!201438 (= lt!314342 (readBit!0 (_1!9254 lt!314007)))))

(assert (=> b!201438 (= lt!314345 (readNBitsLSBFirstsLoop!0 (_2!9264 lt!314342) nBits!348 (bvadd i!590 #b00000000000000000000000000000001) (bvor (bvand v!189 (onesLSBLong!0 i!590)) (ite (_1!9264 lt!314342) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!69027 c!10025) b!201435))

(assert (= (and d!69027 (not c!10025)) b!201438))

(assert (= (and d!69027 res!168647) b!201434))

(assert (= (and b!201434 res!168646) b!201437))

(assert (= (and b!201437 res!168649) b!201433))

(assert (= (and b!201433 res!168650) b!201436))

(assert (= (and b!201436 (not res!168648)) b!201432))

(assert (=> b!201433 m!311861))

(declare-fun m!312047 () Bool)

(assert (=> b!201434 m!312047))

(declare-fun m!312049 () Bool)

(assert (=> b!201434 m!312049))

(declare-fun m!312051 () Bool)

(assert (=> b!201438 m!312051))

(declare-fun m!312053 () Bool)

(assert (=> b!201438 m!312053))

(assert (=> b!201437 m!311859))

(declare-fun m!312055 () Bool)

(assert (=> b!201432 m!312055))

(assert (=> d!68971 d!69027))

(declare-fun d!69029 () Bool)

(declare-fun e!138153 () Bool)

(assert (=> d!69029 e!138153))

(declare-fun res!168653 () Bool)

(assert (=> d!69029 (=> (not res!168653) (not e!138153))))

(declare-fun lt!314350 () BitStream!8110)

(declare-fun lt!314351 () (_ BitVec 64))

(assert (=> d!69029 (= res!168653 (= (bvadd lt!314351 (bvsub lt!314175 lt!314188)) (bitIndex!0 (size!4501 (buf!5002 lt!314350)) (currentByte!9400 lt!314350) (currentBit!9395 lt!314350))))))

(assert (=> d!69029 (or (not (= (bvand lt!314351 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!314175 lt!314188) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!314351 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!314351 (bvsub lt!314175 lt!314188)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!69029 (= lt!314351 (bitIndex!0 (size!4501 (buf!5002 (_2!9254 lt!314184))) (currentByte!9400 (_2!9254 lt!314184)) (currentBit!9395 (_2!9254 lt!314184))))))

(declare-datatypes ((tuple2!17226 0))(
  ( (tuple2!17227 (_1!9265 Unit!14304) (_2!9265 BitStream!8110)) )
))
(declare-fun moveBitIndex!0 (BitStream!8110 (_ BitVec 64)) tuple2!17226)

(assert (=> d!69029 (= lt!314350 (_2!9265 (moveBitIndex!0 (_2!9254 lt!314184) (bvsub lt!314175 lt!314188))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!8110 (_ BitVec 64)) Bool)

(assert (=> d!69029 (moveBitIndexPrecond!0 (_2!9254 lt!314184) (bvsub lt!314175 lt!314188))))

(assert (=> d!69029 (= (withMovedBitIndex!0 (_2!9254 lt!314184) (bvsub lt!314175 lt!314188)) lt!314350)))

(declare-fun b!201441 () Bool)

(assert (=> b!201441 (= e!138153 (= (size!4501 (buf!5002 (_2!9254 lt!314184))) (size!4501 (buf!5002 lt!314350))))))

(assert (= (and d!69029 res!168653) b!201441))

(declare-fun m!312057 () Bool)

(assert (=> d!69029 m!312057))

(assert (=> d!69029 m!312001))

(declare-fun m!312059 () Bool)

(assert (=> d!69029 m!312059))

(declare-fun m!312061 () Bool)

(assert (=> d!69029 m!312061))

(assert (=> b!201321 d!69029))

(assert (=> b!201321 d!68975))

(push 1)

(assert (not d!69021))

(assert (not b!201413))

(assert (not b!201380))

(assert (not d!69015))

(assert (not bm!3177))

(assert (not d!69019))

(assert (not d!69023))

(assert (not b!201407))

(assert (not b!201405))

(assert (not b!201433))

(assert (not d!69003))

(assert (not b!201434))

(assert (not b!201375))

(assert (not b!201378))

(assert (not b!201402))

(assert (not b!201377))

(assert (not b!201399))

(assert (not b!201404))

(assert (not b!201438))

(assert (not b!201400))

(assert (not b!201416))

(assert (not b!201408))

(assert (not b!201397))

(assert (not b!201432))

(assert (not b!201437))

(assert (not bm!3176))

(assert (not b!201410))

(assert (not b!201415))

(assert (not d!69029))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

