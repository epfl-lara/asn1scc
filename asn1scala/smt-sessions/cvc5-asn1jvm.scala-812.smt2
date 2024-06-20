; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!23918 () Bool)

(assert start!23918)

(declare-fun b!121068 () Bool)

(declare-fun e!79299 () Bool)

(declare-datatypes ((array!5378 0))(
  ( (array!5379 (arr!3027 (Array (_ BitVec 32) (_ BitVec 8))) (size!2434 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4342 0))(
  ( (BitStream!4343 (buf!2868 array!5378) (currentByte!5553 (_ BitVec 32)) (currentBit!5548 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!10168 0))(
  ( (tuple2!10169 (_1!5349 BitStream!4342) (_2!5349 Bool)) )
))
(declare-fun lt!189146 () tuple2!10168)

(declare-fun lt!189145 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!121068 (= e!79299 (= (bitIndex!0 (size!2434 (buf!2868 (_1!5349 lt!189146))) (currentByte!5553 (_1!5349 lt!189146)) (currentBit!5548 (_1!5349 lt!189146))) lt!189145))))

(declare-fun b!121069 () Bool)

(declare-fun e!79298 () Bool)

(declare-fun e!79303 () Bool)

(assert (=> b!121069 (= e!79298 e!79303)))

(declare-fun res!100270 () Bool)

(assert (=> b!121069 (=> (not res!100270) (not e!79303))))

(declare-fun lt!189132 () (_ BitVec 64))

(assert (=> b!121069 (= res!100270 (= lt!189145 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!189132)))))

(declare-datatypes ((Unit!7459 0))(
  ( (Unit!7460) )
))
(declare-datatypes ((tuple2!10170 0))(
  ( (tuple2!10171 (_1!5350 Unit!7459) (_2!5350 BitStream!4342)) )
))
(declare-fun lt!189134 () tuple2!10170)

(assert (=> b!121069 (= lt!189145 (bitIndex!0 (size!2434 (buf!2868 (_2!5350 lt!189134))) (currentByte!5553 (_2!5350 lt!189134)) (currentBit!5548 (_2!5350 lt!189134))))))

(declare-fun thiss!1305 () BitStream!4342)

(assert (=> b!121069 (= lt!189132 (bitIndex!0 (size!2434 (buf!2868 thiss!1305)) (currentByte!5553 thiss!1305) (currentBit!5548 thiss!1305)))))

(declare-fun b!121070 () Bool)

(declare-fun e!79301 () Bool)

(declare-fun e!79305 () Bool)

(assert (=> b!121070 (= e!79301 e!79305)))

(declare-fun res!100261 () Bool)

(assert (=> b!121070 (=> (not res!100261) (not e!79305))))

(declare-fun lt!189135 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!121070 (= res!100261 (validate_offset_bits!1 ((_ sign_extend 32) (size!2434 (buf!2868 thiss!1305))) ((_ sign_extend 32) (currentByte!5553 thiss!1305)) ((_ sign_extend 32) (currentBit!5548 thiss!1305)) lt!189135))))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!121070 (= lt!189135 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!121071 () Bool)

(declare-fun res!100271 () Bool)

(declare-fun e!79308 () Bool)

(assert (=> b!121071 (=> (not res!100271) (not e!79308))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!121071 (= res!100271 (invariant!0 (currentBit!5548 thiss!1305) (currentByte!5553 thiss!1305) (size!2434 (buf!2868 (_2!5350 lt!189134)))))))

(declare-datatypes ((tuple2!10172 0))(
  ( (tuple2!10173 (_1!5351 BitStream!4342) (_2!5351 (_ BitVec 64))) )
))
(declare-fun lt!189127 () tuple2!10172)

(declare-fun e!79307 () Bool)

(declare-fun b!121072 () Bool)

(declare-datatypes ((tuple2!10174 0))(
  ( (tuple2!10175 (_1!5352 BitStream!4342) (_2!5352 BitStream!4342)) )
))
(declare-fun lt!189148 () tuple2!10174)

(declare-fun lt!189124 () BitStream!4342)

(declare-fun lt!189144 () tuple2!10174)

(assert (=> b!121072 (= e!79307 (or (not (= (_1!5352 lt!189144) lt!189124)) (= (_1!5351 lt!189127) (_2!5352 lt!189148))))))

(declare-fun e!79302 () Bool)

(assert (=> b!121072 e!79302))

(declare-fun res!100265 () Bool)

(assert (=> b!121072 (=> (not res!100265) (not e!79302))))

(declare-fun lt!189128 () (_ BitVec 64))

(declare-fun lt!189141 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!4342 (_ BitVec 64)) BitStream!4342)

(assert (=> b!121072 (= res!100265 (= (_1!5352 lt!189144) (withMovedBitIndex!0 (_2!5352 lt!189144) (bvsub lt!189128 lt!189141))))))

(assert (=> b!121072 (= lt!189128 (bitIndex!0 (size!2434 (buf!2868 (_2!5350 lt!189134))) (currentByte!5553 (_2!5350 lt!189134)) (currentBit!5548 (_2!5350 lt!189134))))))

(declare-fun lt!189139 () (_ BitVec 64))

(assert (=> b!121072 (= (_1!5352 lt!189148) (withMovedBitIndex!0 (_2!5352 lt!189148) (bvsub lt!189139 lt!189141)))))

(declare-fun lt!189140 () tuple2!10170)

(assert (=> b!121072 (= lt!189141 (bitIndex!0 (size!2434 (buf!2868 (_2!5350 lt!189140))) (currentByte!5553 (_2!5350 lt!189140)) (currentBit!5548 (_2!5350 lt!189140))))))

(assert (=> b!121072 (= lt!189139 (bitIndex!0 (size!2434 (buf!2868 thiss!1305)) (currentByte!5553 thiss!1305) (currentBit!5548 thiss!1305)))))

(declare-fun lt!189149 () tuple2!10172)

(assert (=> b!121072 (and (= (_2!5351 lt!189127) (_2!5351 lt!189149)) (= (_1!5351 lt!189127) (_1!5351 lt!189149)))))

(declare-fun lt!189129 () Unit!7459)

(declare-fun lt!189142 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4342 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!7459)

(assert (=> b!121072 (= lt!189129 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5352 lt!189148) nBits!396 i!615 lt!189142))))

(declare-fun lt!189130 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4342 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!10172)

(assert (=> b!121072 (= lt!189149 (readNLeastSignificantBitsLoopPure!0 lt!189124 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!189130))))

(assert (=> b!121072 (= lt!189124 (withMovedBitIndex!0 (_1!5352 lt!189148) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!121073 () Bool)

(assert (=> b!121073 (= e!79308 (invariant!0 (currentBit!5548 thiss!1305) (currentByte!5553 thiss!1305) (size!2434 (buf!2868 (_2!5350 lt!189140)))))))

(declare-fun b!121074 () Bool)

(assert (=> b!121074 (= e!79303 e!79299)))

(declare-fun res!100264 () Bool)

(assert (=> b!121074 (=> (not res!100264) (not e!79299))))

(declare-fun lt!189123 () Bool)

(assert (=> b!121074 (= res!100264 (and (= (_2!5349 lt!189146) lt!189123) (= (_1!5349 lt!189146) (_2!5350 lt!189134))))))

(declare-fun readBitPure!0 (BitStream!4342) tuple2!10168)

(declare-fun readerFrom!0 (BitStream!4342 (_ BitVec 32) (_ BitVec 32)) BitStream!4342)

(assert (=> b!121074 (= lt!189146 (readBitPure!0 (readerFrom!0 (_2!5350 lt!189134) (currentBit!5548 thiss!1305) (currentByte!5553 thiss!1305))))))

(declare-fun lt!189138 () tuple2!10172)

(declare-fun b!121075 () Bool)

(assert (=> b!121075 (= e!79302 (and (= lt!189139 (bvsub lt!189128 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!5352 lt!189144) lt!189124)) (= (_2!5351 lt!189127) (_2!5351 lt!189138)))))))

(declare-fun b!121076 () Bool)

(declare-fun e!79300 () Bool)

(declare-fun array_inv!2236 (array!5378) Bool)

(assert (=> b!121076 (= e!79300 (array_inv!2236 (buf!2868 thiss!1305)))))

(declare-fun b!121078 () Bool)

(assert (=> b!121078 (= e!79305 (not e!79307))))

(declare-fun res!100267 () Bool)

(assert (=> b!121078 (=> res!100267 e!79307)))

(assert (=> b!121078 (= res!100267 (not (= (_1!5351 lt!189138) (_2!5352 lt!189144))))))

(assert (=> b!121078 (= lt!189138 (readNLeastSignificantBitsLoopPure!0 (_1!5352 lt!189144) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!189130))))

(declare-fun lt!189143 () (_ BitVec 64))

(assert (=> b!121078 (validate_offset_bits!1 ((_ sign_extend 32) (size!2434 (buf!2868 (_2!5350 lt!189140)))) ((_ sign_extend 32) (currentByte!5553 (_2!5350 lt!189134))) ((_ sign_extend 32) (currentBit!5548 (_2!5350 lt!189134))) lt!189143)))

(declare-fun lt!189131 () Unit!7459)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4342 array!5378 (_ BitVec 64)) Unit!7459)

(assert (=> b!121078 (= lt!189131 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5350 lt!189134) (buf!2868 (_2!5350 lt!189140)) lt!189143))))

(assert (=> b!121078 (= lt!189143 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!189133 () tuple2!10168)

(declare-fun lt!189136 () (_ BitVec 64))

(assert (=> b!121078 (= lt!189130 (bvor lt!189142 (ite (_2!5349 lt!189133) lt!189136 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!121078 (= lt!189127 (readNLeastSignificantBitsLoopPure!0 (_1!5352 lt!189148) nBits!396 i!615 lt!189142))))

(assert (=> b!121078 (validate_offset_bits!1 ((_ sign_extend 32) (size!2434 (buf!2868 (_2!5350 lt!189140)))) ((_ sign_extend 32) (currentByte!5553 thiss!1305)) ((_ sign_extend 32) (currentBit!5548 thiss!1305)) lt!189135)))

(declare-fun lt!189147 () Unit!7459)

(assert (=> b!121078 (= lt!189147 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2868 (_2!5350 lt!189140)) lt!189135))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!121078 (= lt!189142 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(assert (=> b!121078 (= (_2!5349 lt!189133) lt!189123)))

(assert (=> b!121078 (= lt!189133 (readBitPure!0 (_1!5352 lt!189148)))))

(declare-fun reader!0 (BitStream!4342 BitStream!4342) tuple2!10174)

(assert (=> b!121078 (= lt!189144 (reader!0 (_2!5350 lt!189134) (_2!5350 lt!189140)))))

(assert (=> b!121078 (= lt!189148 (reader!0 thiss!1305 (_2!5350 lt!189140)))))

(declare-fun e!79304 () Bool)

(assert (=> b!121078 e!79304))

(declare-fun res!100263 () Bool)

(assert (=> b!121078 (=> (not res!100263) (not e!79304))))

(declare-fun lt!189137 () tuple2!10168)

(declare-fun lt!189150 () tuple2!10168)

(assert (=> b!121078 (= res!100263 (= (bitIndex!0 (size!2434 (buf!2868 (_1!5349 lt!189137))) (currentByte!5553 (_1!5349 lt!189137)) (currentBit!5548 (_1!5349 lt!189137))) (bitIndex!0 (size!2434 (buf!2868 (_1!5349 lt!189150))) (currentByte!5553 (_1!5349 lt!189150)) (currentBit!5548 (_1!5349 lt!189150)))))))

(declare-fun lt!189122 () Unit!7459)

(declare-fun lt!189125 () BitStream!4342)

(declare-fun readBitPrefixLemma!0 (BitStream!4342 BitStream!4342) Unit!7459)

(assert (=> b!121078 (= lt!189122 (readBitPrefixLemma!0 lt!189125 (_2!5350 lt!189140)))))

(assert (=> b!121078 (= lt!189150 (readBitPure!0 (BitStream!4343 (buf!2868 (_2!5350 lt!189140)) (currentByte!5553 thiss!1305) (currentBit!5548 thiss!1305))))))

(assert (=> b!121078 (= lt!189137 (readBitPure!0 lt!189125))))

(assert (=> b!121078 (= lt!189125 (BitStream!4343 (buf!2868 (_2!5350 lt!189134)) (currentByte!5553 thiss!1305) (currentBit!5548 thiss!1305)))))

(assert (=> b!121078 e!79308))

(declare-fun res!100262 () Bool)

(assert (=> b!121078 (=> (not res!100262) (not e!79308))))

(declare-fun isPrefixOf!0 (BitStream!4342 BitStream!4342) Bool)

(assert (=> b!121078 (= res!100262 (isPrefixOf!0 thiss!1305 (_2!5350 lt!189140)))))

(declare-fun lt!189126 () Unit!7459)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4342 BitStream!4342 BitStream!4342) Unit!7459)

(assert (=> b!121078 (= lt!189126 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5350 lt!189134) (_2!5350 lt!189140)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4342 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!10170)

(assert (=> b!121078 (= lt!189140 (appendNLeastSignificantBitsLoop!0 (_2!5350 lt!189134) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!121078 e!79298))

(declare-fun res!100268 () Bool)

(assert (=> b!121078 (=> (not res!100268) (not e!79298))))

(assert (=> b!121078 (= res!100268 (= (size!2434 (buf!2868 thiss!1305)) (size!2434 (buf!2868 (_2!5350 lt!189134)))))))

(declare-fun appendBit!0 (BitStream!4342 Bool) tuple2!10170)

(assert (=> b!121078 (= lt!189134 (appendBit!0 thiss!1305 lt!189123))))

(assert (=> b!121078 (= lt!189123 (not (= (bvand v!199 lt!189136) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!121078 (= lt!189136 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!121079 () Bool)

(declare-fun res!100266 () Bool)

(assert (=> b!121079 (=> (not res!100266) (not e!79305))))

(assert (=> b!121079 (= res!100266 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!121080 () Bool)

(declare-fun res!100260 () Bool)

(assert (=> b!121080 (=> (not res!100260) (not e!79303))))

(assert (=> b!121080 (= res!100260 (isPrefixOf!0 thiss!1305 (_2!5350 lt!189134)))))

(declare-fun b!121081 () Bool)

(assert (=> b!121081 (= e!79304 (= (_2!5349 lt!189137) (_2!5349 lt!189150)))))

(declare-fun res!100272 () Bool)

(assert (=> start!23918 (=> (not res!100272) (not e!79301))))

(assert (=> start!23918 (= res!100272 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!23918 e!79301))

(assert (=> start!23918 true))

(declare-fun inv!12 (BitStream!4342) Bool)

(assert (=> start!23918 (and (inv!12 thiss!1305) e!79300)))

(declare-fun b!121077 () Bool)

(declare-fun res!100269 () Bool)

(assert (=> b!121077 (=> (not res!100269) (not e!79305))))

(assert (=> b!121077 (= res!100269 (bvslt i!615 nBits!396))))

(assert (= (and start!23918 res!100272) b!121070))

(assert (= (and b!121070 res!100261) b!121079))

(assert (= (and b!121079 res!100266) b!121077))

(assert (= (and b!121077 res!100269) b!121078))

(assert (= (and b!121078 res!100268) b!121069))

(assert (= (and b!121069 res!100270) b!121080))

(assert (= (and b!121080 res!100260) b!121074))

(assert (= (and b!121074 res!100264) b!121068))

(assert (= (and b!121078 res!100262) b!121071))

(assert (= (and b!121071 res!100271) b!121073))

(assert (= (and b!121078 res!100263) b!121081))

(assert (= (and b!121078 (not res!100267)) b!121072))

(assert (= (and b!121072 res!100265) b!121075))

(assert (= start!23918 b!121076))

(declare-fun m!183251 () Bool)

(assert (=> b!121078 m!183251))

(declare-fun m!183253 () Bool)

(assert (=> b!121078 m!183253))

(declare-fun m!183255 () Bool)

(assert (=> b!121078 m!183255))

(declare-fun m!183257 () Bool)

(assert (=> b!121078 m!183257))

(declare-fun m!183259 () Bool)

(assert (=> b!121078 m!183259))

(declare-fun m!183261 () Bool)

(assert (=> b!121078 m!183261))

(declare-fun m!183263 () Bool)

(assert (=> b!121078 m!183263))

(declare-fun m!183265 () Bool)

(assert (=> b!121078 m!183265))

(declare-fun m!183267 () Bool)

(assert (=> b!121078 m!183267))

(declare-fun m!183269 () Bool)

(assert (=> b!121078 m!183269))

(declare-fun m!183271 () Bool)

(assert (=> b!121078 m!183271))

(declare-fun m!183273 () Bool)

(assert (=> b!121078 m!183273))

(declare-fun m!183275 () Bool)

(assert (=> b!121078 m!183275))

(declare-fun m!183277 () Bool)

(assert (=> b!121078 m!183277))

(declare-fun m!183279 () Bool)

(assert (=> b!121078 m!183279))

(declare-fun m!183281 () Bool)

(assert (=> b!121078 m!183281))

(declare-fun m!183283 () Bool)

(assert (=> b!121078 m!183283))

(declare-fun m!183285 () Bool)

(assert (=> b!121078 m!183285))

(declare-fun m!183287 () Bool)

(assert (=> b!121078 m!183287))

(declare-fun m!183289 () Bool)

(assert (=> b!121070 m!183289))

(declare-fun m!183291 () Bool)

(assert (=> b!121074 m!183291))

(assert (=> b!121074 m!183291))

(declare-fun m!183293 () Bool)

(assert (=> b!121074 m!183293))

(declare-fun m!183295 () Bool)

(assert (=> b!121071 m!183295))

(declare-fun m!183297 () Bool)

(assert (=> b!121068 m!183297))

(declare-fun m!183299 () Bool)

(assert (=> b!121072 m!183299))

(declare-fun m!183301 () Bool)

(assert (=> b!121072 m!183301))

(declare-fun m!183303 () Bool)

(assert (=> b!121072 m!183303))

(declare-fun m!183305 () Bool)

(assert (=> b!121072 m!183305))

(declare-fun m!183307 () Bool)

(assert (=> b!121072 m!183307))

(declare-fun m!183309 () Bool)

(assert (=> b!121072 m!183309))

(declare-fun m!183311 () Bool)

(assert (=> b!121072 m!183311))

(declare-fun m!183313 () Bool)

(assert (=> b!121072 m!183313))

(declare-fun m!183315 () Bool)

(assert (=> b!121076 m!183315))

(assert (=> b!121069 m!183305))

(assert (=> b!121069 m!183311))

(declare-fun m!183317 () Bool)

(assert (=> b!121080 m!183317))

(declare-fun m!183319 () Bool)

(assert (=> b!121073 m!183319))

(declare-fun m!183321 () Bool)

(assert (=> b!121079 m!183321))

(declare-fun m!183323 () Bool)

(assert (=> start!23918 m!183323))

(push 1)

(assert (not b!121072))

(assert (not b!121080))

(assert (not b!121068))

(assert (not b!121073))

(assert (not b!121078))

(assert (not start!23918))

(assert (not b!121076))

(assert (not b!121079))

(assert (not b!121070))

(assert (not b!121074))

(assert (not b!121069))

(assert (not b!121071))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!39010 () Bool)

(assert (=> d!39010 (= (array_inv!2236 (buf!2868 thiss!1305)) (bvsge (size!2434 (buf!2868 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!121076 d!39010))

(declare-fun d!39012 () Bool)

(declare-fun e!79386 () Bool)

(assert (=> d!39012 e!79386))

(declare-fun res!100368 () Bool)

(assert (=> d!39012 (=> (not res!100368) (not e!79386))))

(declare-fun lt!189348 () (_ BitVec 64))

(declare-fun lt!189347 () BitStream!4342)

(assert (=> d!39012 (= res!100368 (= (bvadd lt!189348 (bvsub lt!189139 lt!189141)) (bitIndex!0 (size!2434 (buf!2868 lt!189347)) (currentByte!5553 lt!189347) (currentBit!5548 lt!189347))))))

(assert (=> d!39012 (or (not (= (bvand lt!189348 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!189139 lt!189141) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!189348 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!189348 (bvsub lt!189139 lt!189141)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39012 (= lt!189348 (bitIndex!0 (size!2434 (buf!2868 (_2!5352 lt!189148))) (currentByte!5553 (_2!5352 lt!189148)) (currentBit!5548 (_2!5352 lt!189148))))))

(declare-fun moveBitIndex!0 (BitStream!4342 (_ BitVec 64)) tuple2!10170)

(assert (=> d!39012 (= lt!189347 (_2!5350 (moveBitIndex!0 (_2!5352 lt!189148) (bvsub lt!189139 lt!189141))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!4342 (_ BitVec 64)) Bool)

(assert (=> d!39012 (moveBitIndexPrecond!0 (_2!5352 lt!189148) (bvsub lt!189139 lt!189141))))

(assert (=> d!39012 (= (withMovedBitIndex!0 (_2!5352 lt!189148) (bvsub lt!189139 lt!189141)) lt!189347)))

(declare-fun b!121183 () Bool)

(assert (=> b!121183 (= e!79386 (= (size!2434 (buf!2868 (_2!5352 lt!189148))) (size!2434 (buf!2868 lt!189347))))))

(assert (= (and d!39012 res!100368) b!121183))

(declare-fun m!183481 () Bool)

(assert (=> d!39012 m!183481))

(declare-fun m!183483 () Bool)

(assert (=> d!39012 m!183483))

(declare-fun m!183485 () Bool)

(assert (=> d!39012 m!183485))

(declare-fun m!183487 () Bool)

(assert (=> d!39012 m!183487))

(assert (=> b!121072 d!39012))

(declare-fun d!39022 () Bool)

(declare-fun e!79397 () Bool)

(assert (=> d!39022 e!79397))

(declare-fun res!100387 () Bool)

(assert (=> d!39022 (=> (not res!100387) (not e!79397))))

(declare-fun lt!189401 () (_ BitVec 64))

(declare-fun lt!189400 () (_ BitVec 64))

(declare-fun lt!189399 () (_ BitVec 64))

(assert (=> d!39022 (= res!100387 (= lt!189401 (bvsub lt!189399 lt!189400)))))

(assert (=> d!39022 (or (= (bvand lt!189399 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!189400 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!189399 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!189399 lt!189400) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!39022 (= lt!189400 (remainingBits!0 ((_ sign_extend 32) (size!2434 (buf!2868 (_2!5350 lt!189134)))) ((_ sign_extend 32) (currentByte!5553 (_2!5350 lt!189134))) ((_ sign_extend 32) (currentBit!5548 (_2!5350 lt!189134)))))))

(declare-fun lt!189397 () (_ BitVec 64))

(declare-fun lt!189402 () (_ BitVec 64))

(assert (=> d!39022 (= lt!189399 (bvmul lt!189397 lt!189402))))

(assert (=> d!39022 (or (= lt!189397 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!189402 (bvsdiv (bvmul lt!189397 lt!189402) lt!189397)))))

(assert (=> d!39022 (= lt!189402 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!39022 (= lt!189397 ((_ sign_extend 32) (size!2434 (buf!2868 (_2!5350 lt!189134)))))))

(assert (=> d!39022 (= lt!189401 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5553 (_2!5350 lt!189134))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5548 (_2!5350 lt!189134)))))))

(assert (=> d!39022 (invariant!0 (currentBit!5548 (_2!5350 lt!189134)) (currentByte!5553 (_2!5350 lt!189134)) (size!2434 (buf!2868 (_2!5350 lt!189134))))))

(assert (=> d!39022 (= (bitIndex!0 (size!2434 (buf!2868 (_2!5350 lt!189134))) (currentByte!5553 (_2!5350 lt!189134)) (currentBit!5548 (_2!5350 lt!189134))) lt!189401)))

(declare-fun b!121201 () Bool)

(declare-fun res!100386 () Bool)

(assert (=> b!121201 (=> (not res!100386) (not e!79397))))

(assert (=> b!121201 (= res!100386 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!189401))))

(declare-fun b!121202 () Bool)

(declare-fun lt!189398 () (_ BitVec 64))

(assert (=> b!121202 (= e!79397 (bvsle lt!189401 (bvmul lt!189398 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!121202 (or (= lt!189398 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!189398 #b0000000000000000000000000000000000000000000000000000000000001000) lt!189398)))))

(assert (=> b!121202 (= lt!189398 ((_ sign_extend 32) (size!2434 (buf!2868 (_2!5350 lt!189134)))))))

(assert (= (and d!39022 res!100387) b!121201))

(assert (= (and b!121201 res!100386) b!121202))

(declare-fun m!183507 () Bool)

(assert (=> d!39022 m!183507))

(declare-fun m!183509 () Bool)

(assert (=> d!39022 m!183509))

(assert (=> b!121072 d!39022))

(declare-fun d!39032 () Bool)

(declare-datatypes ((tuple2!10196 0))(
  ( (tuple2!10197 (_1!5363 (_ BitVec 64)) (_2!5363 BitStream!4342)) )
))
(declare-fun lt!189405 () tuple2!10196)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!4342 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!10196)

(assert (=> d!39032 (= lt!189405 (readNLeastSignificantBitsLoop!0 lt!189124 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!189130))))

(assert (=> d!39032 (= (readNLeastSignificantBitsLoopPure!0 lt!189124 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!189130) (tuple2!10173 (_2!5363 lt!189405) (_1!5363 lt!189405)))))

(declare-fun bs!9438 () Bool)

(assert (= bs!9438 d!39032))

(declare-fun m!183511 () Bool)

(assert (=> bs!9438 m!183511))

(assert (=> b!121072 d!39032))

(declare-fun d!39034 () Bool)

(declare-fun e!79398 () Bool)

(assert (=> d!39034 e!79398))

(declare-fun res!100388 () Bool)

(assert (=> d!39034 (=> (not res!100388) (not e!79398))))

(declare-fun lt!189406 () BitStream!4342)

(declare-fun lt!189407 () (_ BitVec 64))

(assert (=> d!39034 (= res!100388 (= (bvadd lt!189407 (bvsub lt!189128 lt!189141)) (bitIndex!0 (size!2434 (buf!2868 lt!189406)) (currentByte!5553 lt!189406) (currentBit!5548 lt!189406))))))

(assert (=> d!39034 (or (not (= (bvand lt!189407 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!189128 lt!189141) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!189407 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!189407 (bvsub lt!189128 lt!189141)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39034 (= lt!189407 (bitIndex!0 (size!2434 (buf!2868 (_2!5352 lt!189144))) (currentByte!5553 (_2!5352 lt!189144)) (currentBit!5548 (_2!5352 lt!189144))))))

(assert (=> d!39034 (= lt!189406 (_2!5350 (moveBitIndex!0 (_2!5352 lt!189144) (bvsub lt!189128 lt!189141))))))

(assert (=> d!39034 (moveBitIndexPrecond!0 (_2!5352 lt!189144) (bvsub lt!189128 lt!189141))))

(assert (=> d!39034 (= (withMovedBitIndex!0 (_2!5352 lt!189144) (bvsub lt!189128 lt!189141)) lt!189406)))

(declare-fun b!121203 () Bool)

(assert (=> b!121203 (= e!79398 (= (size!2434 (buf!2868 (_2!5352 lt!189144))) (size!2434 (buf!2868 lt!189406))))))

(assert (= (and d!39034 res!100388) b!121203))

(declare-fun m!183513 () Bool)

(assert (=> d!39034 m!183513))

(declare-fun m!183515 () Bool)

(assert (=> d!39034 m!183515))

(declare-fun m!183517 () Bool)

(assert (=> d!39034 m!183517))

(declare-fun m!183519 () Bool)

(assert (=> d!39034 m!183519))

(assert (=> b!121072 d!39034))

(declare-fun d!39036 () Bool)

(declare-fun lt!189449 () tuple2!10172)

(declare-fun lt!189453 () tuple2!10172)

(assert (=> d!39036 (and (= (_2!5351 lt!189449) (_2!5351 lt!189453)) (= (_1!5351 lt!189449) (_1!5351 lt!189453)))))

(declare-fun lt!189448 () (_ BitVec 64))

(declare-fun lt!189452 () Bool)

(declare-fun lt!189451 () BitStream!4342)

(declare-fun lt!189450 () Unit!7459)

(declare-fun choose!45 (BitStream!4342 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!10172 tuple2!10172 BitStream!4342 (_ BitVec 64) Bool BitStream!4342 (_ BitVec 64) tuple2!10172 tuple2!10172 BitStream!4342 (_ BitVec 64)) Unit!7459)

(assert (=> d!39036 (= lt!189450 (choose!45 (_1!5352 lt!189148) nBits!396 i!615 lt!189142 lt!189449 (tuple2!10173 (_1!5351 lt!189449) (_2!5351 lt!189449)) (_1!5351 lt!189449) (_2!5351 lt!189449) lt!189452 lt!189451 lt!189448 lt!189453 (tuple2!10173 (_1!5351 lt!189453) (_2!5351 lt!189453)) (_1!5351 lt!189453) (_2!5351 lt!189453)))))

(assert (=> d!39036 (= lt!189453 (readNLeastSignificantBitsLoopPure!0 lt!189451 nBits!396 (bvadd i!615 #b00000000000000000000000000000001) lt!189448))))

(assert (=> d!39036 (= lt!189448 (bvor lt!189142 (ite lt!189452 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39036 (= lt!189451 (withMovedBitIndex!0 (_1!5352 lt!189148) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!39036 (= lt!189452 (_2!5349 (readBitPure!0 (_1!5352 lt!189148))))))

(assert (=> d!39036 (= lt!189449 (readNLeastSignificantBitsLoopPure!0 (_1!5352 lt!189148) nBits!396 i!615 lt!189142))))

(assert (=> d!39036 (= (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5352 lt!189148) nBits!396 i!615 lt!189142) lt!189450)))

(declare-fun bs!9445 () Bool)

(assert (= bs!9445 d!39036))

(assert (=> bs!9445 m!183269))

(assert (=> bs!9445 m!183301))

(declare-fun m!183545 () Bool)

(assert (=> bs!9445 m!183545))

(declare-fun m!183547 () Bool)

(assert (=> bs!9445 m!183547))

(assert (=> bs!9445 m!183255))

(assert (=> b!121072 d!39036))

(declare-fun d!39050 () Bool)

(declare-fun e!79401 () Bool)

(assert (=> d!39050 e!79401))

(declare-fun res!100392 () Bool)

(assert (=> d!39050 (=> (not res!100392) (not e!79401))))

(declare-fun lt!189455 () (_ BitVec 64))

(declare-fun lt!189454 () BitStream!4342)

(assert (=> d!39050 (= res!100392 (= (bvadd lt!189455 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!2434 (buf!2868 lt!189454)) (currentByte!5553 lt!189454) (currentBit!5548 lt!189454))))))

(assert (=> d!39050 (or (not (= (bvand lt!189455 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!189455 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!189455 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39050 (= lt!189455 (bitIndex!0 (size!2434 (buf!2868 (_1!5352 lt!189148))) (currentByte!5553 (_1!5352 lt!189148)) (currentBit!5548 (_1!5352 lt!189148))))))

(assert (=> d!39050 (= lt!189454 (_2!5350 (moveBitIndex!0 (_1!5352 lt!189148) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!39050 (moveBitIndexPrecond!0 (_1!5352 lt!189148) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!39050 (= (withMovedBitIndex!0 (_1!5352 lt!189148) #b0000000000000000000000000000000000000000000000000000000000000001) lt!189454)))

(declare-fun b!121206 () Bool)

(assert (=> b!121206 (= e!79401 (= (size!2434 (buf!2868 (_1!5352 lt!189148))) (size!2434 (buf!2868 lt!189454))))))

(assert (= (and d!39050 res!100392) b!121206))

(declare-fun m!183549 () Bool)

(assert (=> d!39050 m!183549))

(declare-fun m!183551 () Bool)

(assert (=> d!39050 m!183551))

(declare-fun m!183553 () Bool)

(assert (=> d!39050 m!183553))

(declare-fun m!183555 () Bool)

(assert (=> d!39050 m!183555))

(assert (=> b!121072 d!39050))

(declare-fun d!39052 () Bool)

(declare-fun e!79404 () Bool)

(assert (=> d!39052 e!79404))

(declare-fun res!100396 () Bool)

(assert (=> d!39052 (=> (not res!100396) (not e!79404))))

(declare-fun lt!189459 () (_ BitVec 64))

(declare-fun lt!189458 () (_ BitVec 64))

(declare-fun lt!189460 () (_ BitVec 64))

(assert (=> d!39052 (= res!100396 (= lt!189460 (bvsub lt!189458 lt!189459)))))

(assert (=> d!39052 (or (= (bvand lt!189458 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!189459 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!189458 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!189458 lt!189459) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39052 (= lt!189459 (remainingBits!0 ((_ sign_extend 32) (size!2434 (buf!2868 (_2!5350 lt!189140)))) ((_ sign_extend 32) (currentByte!5553 (_2!5350 lt!189140))) ((_ sign_extend 32) (currentBit!5548 (_2!5350 lt!189140)))))))

(declare-fun lt!189456 () (_ BitVec 64))

(declare-fun lt!189461 () (_ BitVec 64))

(assert (=> d!39052 (= lt!189458 (bvmul lt!189456 lt!189461))))

(assert (=> d!39052 (or (= lt!189456 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!189461 (bvsdiv (bvmul lt!189456 lt!189461) lt!189456)))))

(assert (=> d!39052 (= lt!189461 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!39052 (= lt!189456 ((_ sign_extend 32) (size!2434 (buf!2868 (_2!5350 lt!189140)))))))

(assert (=> d!39052 (= lt!189460 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5553 (_2!5350 lt!189140))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5548 (_2!5350 lt!189140)))))))

(assert (=> d!39052 (invariant!0 (currentBit!5548 (_2!5350 lt!189140)) (currentByte!5553 (_2!5350 lt!189140)) (size!2434 (buf!2868 (_2!5350 lt!189140))))))

(assert (=> d!39052 (= (bitIndex!0 (size!2434 (buf!2868 (_2!5350 lt!189140))) (currentByte!5553 (_2!5350 lt!189140)) (currentBit!5548 (_2!5350 lt!189140))) lt!189460)))

(declare-fun b!121209 () Bool)

(declare-fun res!100395 () Bool)

(assert (=> b!121209 (=> (not res!100395) (not e!79404))))

(assert (=> b!121209 (= res!100395 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!189460))))

(declare-fun b!121210 () Bool)

(declare-fun lt!189457 () (_ BitVec 64))

(assert (=> b!121210 (= e!79404 (bvsle lt!189460 (bvmul lt!189457 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!121210 (or (= lt!189457 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!189457 #b0000000000000000000000000000000000000000000000000000000000001000) lt!189457)))))

(assert (=> b!121210 (= lt!189457 ((_ sign_extend 32) (size!2434 (buf!2868 (_2!5350 lt!189140)))))))

(assert (= (and d!39052 res!100396) b!121209))

(assert (= (and b!121209 res!100395) b!121210))

(declare-fun m!183557 () Bool)

(assert (=> d!39052 m!183557))

(declare-fun m!183559 () Bool)

(assert (=> d!39052 m!183559))

(assert (=> b!121072 d!39052))

(declare-fun d!39054 () Bool)

(declare-fun e!79405 () Bool)

(assert (=> d!39054 e!79405))

(declare-fun res!100398 () Bool)

(assert (=> d!39054 (=> (not res!100398) (not e!79405))))

(declare-fun lt!189465 () (_ BitVec 64))

(declare-fun lt!189466 () (_ BitVec 64))

(declare-fun lt!189464 () (_ BitVec 64))

(assert (=> d!39054 (= res!100398 (= lt!189466 (bvsub lt!189464 lt!189465)))))

(assert (=> d!39054 (or (= (bvand lt!189464 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!189465 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!189464 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!189464 lt!189465) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39054 (= lt!189465 (remainingBits!0 ((_ sign_extend 32) (size!2434 (buf!2868 thiss!1305))) ((_ sign_extend 32) (currentByte!5553 thiss!1305)) ((_ sign_extend 32) (currentBit!5548 thiss!1305))))))

(declare-fun lt!189462 () (_ BitVec 64))

(declare-fun lt!189467 () (_ BitVec 64))

(assert (=> d!39054 (= lt!189464 (bvmul lt!189462 lt!189467))))

(assert (=> d!39054 (or (= lt!189462 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!189467 (bvsdiv (bvmul lt!189462 lt!189467) lt!189462)))))

(assert (=> d!39054 (= lt!189467 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!39054 (= lt!189462 ((_ sign_extend 32) (size!2434 (buf!2868 thiss!1305))))))

(assert (=> d!39054 (= lt!189466 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5553 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5548 thiss!1305))))))

(assert (=> d!39054 (invariant!0 (currentBit!5548 thiss!1305) (currentByte!5553 thiss!1305) (size!2434 (buf!2868 thiss!1305)))))

(assert (=> d!39054 (= (bitIndex!0 (size!2434 (buf!2868 thiss!1305)) (currentByte!5553 thiss!1305) (currentBit!5548 thiss!1305)) lt!189466)))

(declare-fun b!121211 () Bool)

(declare-fun res!100397 () Bool)

(assert (=> b!121211 (=> (not res!100397) (not e!79405))))

(assert (=> b!121211 (= res!100397 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!189466))))

(declare-fun b!121212 () Bool)

(declare-fun lt!189463 () (_ BitVec 64))

(assert (=> b!121212 (= e!79405 (bvsle lt!189466 (bvmul lt!189463 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!121212 (or (= lt!189463 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!189463 #b0000000000000000000000000000000000000000000000000000000000001000) lt!189463)))))

(assert (=> b!121212 (= lt!189463 ((_ sign_extend 32) (size!2434 (buf!2868 thiss!1305))))))

(assert (= (and d!39054 res!100398) b!121211))

(assert (= (and b!121211 res!100397) b!121212))

(declare-fun m!183561 () Bool)

(assert (=> d!39054 m!183561))

(declare-fun m!183563 () Bool)

(assert (=> d!39054 m!183563))

(assert (=> b!121072 d!39054))

(declare-fun d!39058 () Bool)

(assert (=> d!39058 (= (invariant!0 (currentBit!5548 thiss!1305) (currentByte!5553 thiss!1305) (size!2434 (buf!2868 (_2!5350 lt!189140)))) (and (bvsge (currentBit!5548 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5548 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5553 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5553 thiss!1305) (size!2434 (buf!2868 (_2!5350 lt!189140)))) (and (= (currentBit!5548 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5553 thiss!1305) (size!2434 (buf!2868 (_2!5350 lt!189140))))))))))

(assert (=> b!121073 d!39058))

(declare-fun d!39066 () Bool)

(declare-datatypes ((tuple2!10202 0))(
  ( (tuple2!10203 (_1!5366 Bool) (_2!5366 BitStream!4342)) )
))
(declare-fun lt!189476 () tuple2!10202)

(declare-fun readBit!0 (BitStream!4342) tuple2!10202)

(assert (=> d!39066 (= lt!189476 (readBit!0 (readerFrom!0 (_2!5350 lt!189134) (currentBit!5548 thiss!1305) (currentByte!5553 thiss!1305))))))

(assert (=> d!39066 (= (readBitPure!0 (readerFrom!0 (_2!5350 lt!189134) (currentBit!5548 thiss!1305) (currentByte!5553 thiss!1305))) (tuple2!10169 (_2!5366 lt!189476) (_1!5366 lt!189476)))))

(declare-fun bs!9446 () Bool)

(assert (= bs!9446 d!39066))

(assert (=> bs!9446 m!183291))

(declare-fun m!183569 () Bool)

(assert (=> bs!9446 m!183569))

(assert (=> b!121074 d!39066))

(declare-fun d!39068 () Bool)

(declare-fun e!79410 () Bool)

(assert (=> d!39068 e!79410))

(declare-fun res!100405 () Bool)

(assert (=> d!39068 (=> (not res!100405) (not e!79410))))

(assert (=> d!39068 (= res!100405 (invariant!0 (currentBit!5548 (_2!5350 lt!189134)) (currentByte!5553 (_2!5350 lt!189134)) (size!2434 (buf!2868 (_2!5350 lt!189134)))))))

(assert (=> d!39068 (= (readerFrom!0 (_2!5350 lt!189134) (currentBit!5548 thiss!1305) (currentByte!5553 thiss!1305)) (BitStream!4343 (buf!2868 (_2!5350 lt!189134)) (currentByte!5553 thiss!1305) (currentBit!5548 thiss!1305)))))

(declare-fun b!121218 () Bool)

(assert (=> b!121218 (= e!79410 (invariant!0 (currentBit!5548 thiss!1305) (currentByte!5553 thiss!1305) (size!2434 (buf!2868 (_2!5350 lt!189134)))))))

(assert (= (and d!39068 res!100405) b!121218))

(assert (=> d!39068 m!183509))

(assert (=> b!121218 m!183295))

(assert (=> b!121074 d!39068))

(declare-fun d!39070 () Bool)

(declare-fun res!100413 () Bool)

(declare-fun e!79416 () Bool)

(assert (=> d!39070 (=> (not res!100413) (not e!79416))))

(assert (=> d!39070 (= res!100413 (= (size!2434 (buf!2868 thiss!1305)) (size!2434 (buf!2868 (_2!5350 lt!189134)))))))

(assert (=> d!39070 (= (isPrefixOf!0 thiss!1305 (_2!5350 lt!189134)) e!79416)))

(declare-fun b!121225 () Bool)

(declare-fun res!100412 () Bool)

(assert (=> b!121225 (=> (not res!100412) (not e!79416))))

(assert (=> b!121225 (= res!100412 (bvsle (bitIndex!0 (size!2434 (buf!2868 thiss!1305)) (currentByte!5553 thiss!1305) (currentBit!5548 thiss!1305)) (bitIndex!0 (size!2434 (buf!2868 (_2!5350 lt!189134))) (currentByte!5553 (_2!5350 lt!189134)) (currentBit!5548 (_2!5350 lt!189134)))))))

(declare-fun b!121226 () Bool)

(declare-fun e!79415 () Bool)

(assert (=> b!121226 (= e!79416 e!79415)))

(declare-fun res!100414 () Bool)

(assert (=> b!121226 (=> res!100414 e!79415)))

(assert (=> b!121226 (= res!100414 (= (size!2434 (buf!2868 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!121227 () Bool)

(declare-fun arrayBitRangesEq!0 (array!5378 array!5378 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!121227 (= e!79415 (arrayBitRangesEq!0 (buf!2868 thiss!1305) (buf!2868 (_2!5350 lt!189134)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2434 (buf!2868 thiss!1305)) (currentByte!5553 thiss!1305) (currentBit!5548 thiss!1305))))))

(assert (= (and d!39070 res!100413) b!121225))

(assert (= (and b!121225 res!100412) b!121226))

(assert (= (and b!121226 (not res!100414)) b!121227))

(assert (=> b!121225 m!183311))

(assert (=> b!121225 m!183305))

(assert (=> b!121227 m!183311))

(assert (=> b!121227 m!183311))

(declare-fun m!183571 () Bool)

(assert (=> b!121227 m!183571))

(assert (=> b!121080 d!39070))

(assert (=> b!121069 d!39022))

(assert (=> b!121069 d!39054))

(declare-fun d!39072 () Bool)

(assert (=> d!39072 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2434 (buf!2868 thiss!1305))) ((_ sign_extend 32) (currentByte!5553 thiss!1305)) ((_ sign_extend 32) (currentBit!5548 thiss!1305)) lt!189135) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2434 (buf!2868 thiss!1305))) ((_ sign_extend 32) (currentByte!5553 thiss!1305)) ((_ sign_extend 32) (currentBit!5548 thiss!1305))) lt!189135))))

(declare-fun bs!9447 () Bool)

(assert (= bs!9447 d!39072))

(assert (=> bs!9447 m!183561))

(assert (=> b!121070 d!39072))

(declare-fun d!39074 () Bool)

(assert (=> d!39074 (= (invariant!0 (currentBit!5548 thiss!1305) (currentByte!5553 thiss!1305) (size!2434 (buf!2868 (_2!5350 lt!189134)))) (and (bvsge (currentBit!5548 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5548 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5553 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5553 thiss!1305) (size!2434 (buf!2868 (_2!5350 lt!189134)))) (and (= (currentBit!5548 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5553 thiss!1305) (size!2434 (buf!2868 (_2!5350 lt!189134))))))))))

(assert (=> b!121071 d!39074))

(declare-fun d!39076 () Bool)

(assert (=> d!39076 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5548 thiss!1305) (currentByte!5553 thiss!1305) (size!2434 (buf!2868 thiss!1305))))))

(declare-fun bs!9448 () Bool)

(assert (= bs!9448 d!39076))

(assert (=> bs!9448 m!183563))

(assert (=> start!23918 d!39076))

(declare-fun d!39078 () Bool)

(assert (=> d!39078 (= (onesLSBLong!0 (bvsub nBits!396 i!615)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!396 i!615)))))))

(assert (=> b!121078 d!39078))

(declare-fun lt!189477 () tuple2!10196)

(declare-fun d!39080 () Bool)

(assert (=> d!39080 (= lt!189477 (readNLeastSignificantBitsLoop!0 (_1!5352 lt!189144) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!189130))))

(assert (=> d!39080 (= (readNLeastSignificantBitsLoopPure!0 (_1!5352 lt!189144) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!189130) (tuple2!10173 (_2!5363 lt!189477) (_1!5363 lt!189477)))))

(declare-fun bs!9449 () Bool)

(assert (= bs!9449 d!39080))

(declare-fun m!183573 () Bool)

(assert (=> bs!9449 m!183573))

(assert (=> b!121078 d!39080))

(declare-fun d!39082 () Bool)

(assert (=> d!39082 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2434 (buf!2868 (_2!5350 lt!189140)))) ((_ sign_extend 32) (currentByte!5553 (_2!5350 lt!189134))) ((_ sign_extend 32) (currentBit!5548 (_2!5350 lt!189134))) lt!189143) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2434 (buf!2868 (_2!5350 lt!189140)))) ((_ sign_extend 32) (currentByte!5553 (_2!5350 lt!189134))) ((_ sign_extend 32) (currentBit!5548 (_2!5350 lt!189134)))) lt!189143))))

(declare-fun bs!9450 () Bool)

(assert (= bs!9450 d!39082))

(declare-fun m!183575 () Bool)

(assert (=> bs!9450 m!183575))

(assert (=> b!121078 d!39082))

(declare-fun d!39084 () Bool)

(declare-fun e!79417 () Bool)

(assert (=> d!39084 e!79417))

(declare-fun res!100416 () Bool)

(assert (=> d!39084 (=> (not res!100416) (not e!79417))))

(declare-fun lt!189481 () (_ BitVec 64))

(declare-fun lt!189482 () (_ BitVec 64))

(declare-fun lt!189480 () (_ BitVec 64))

(assert (=> d!39084 (= res!100416 (= lt!189482 (bvsub lt!189480 lt!189481)))))

(assert (=> d!39084 (or (= (bvand lt!189480 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!189481 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!189480 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!189480 lt!189481) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39084 (= lt!189481 (remainingBits!0 ((_ sign_extend 32) (size!2434 (buf!2868 (_1!5349 lt!189137)))) ((_ sign_extend 32) (currentByte!5553 (_1!5349 lt!189137))) ((_ sign_extend 32) (currentBit!5548 (_1!5349 lt!189137)))))))

(declare-fun lt!189478 () (_ BitVec 64))

(declare-fun lt!189483 () (_ BitVec 64))

(assert (=> d!39084 (= lt!189480 (bvmul lt!189478 lt!189483))))

(assert (=> d!39084 (or (= lt!189478 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!189483 (bvsdiv (bvmul lt!189478 lt!189483) lt!189478)))))

(assert (=> d!39084 (= lt!189483 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!39084 (= lt!189478 ((_ sign_extend 32) (size!2434 (buf!2868 (_1!5349 lt!189137)))))))

(assert (=> d!39084 (= lt!189482 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5553 (_1!5349 lt!189137))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5548 (_1!5349 lt!189137)))))))

(assert (=> d!39084 (invariant!0 (currentBit!5548 (_1!5349 lt!189137)) (currentByte!5553 (_1!5349 lt!189137)) (size!2434 (buf!2868 (_1!5349 lt!189137))))))

(assert (=> d!39084 (= (bitIndex!0 (size!2434 (buf!2868 (_1!5349 lt!189137))) (currentByte!5553 (_1!5349 lt!189137)) (currentBit!5548 (_1!5349 lt!189137))) lt!189482)))

(declare-fun b!121228 () Bool)

(declare-fun res!100415 () Bool)

(assert (=> b!121228 (=> (not res!100415) (not e!79417))))

(assert (=> b!121228 (= res!100415 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!189482))))

(declare-fun b!121229 () Bool)

(declare-fun lt!189479 () (_ BitVec 64))

(assert (=> b!121229 (= e!79417 (bvsle lt!189482 (bvmul lt!189479 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!121229 (or (= lt!189479 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!189479 #b0000000000000000000000000000000000000000000000000000000000001000) lt!189479)))))

(assert (=> b!121229 (= lt!189479 ((_ sign_extend 32) (size!2434 (buf!2868 (_1!5349 lt!189137)))))))

(assert (= (and d!39084 res!100416) b!121228))

(assert (= (and b!121228 res!100415) b!121229))

(declare-fun m!183577 () Bool)

(assert (=> d!39084 m!183577))

(declare-fun m!183579 () Bool)

(assert (=> d!39084 m!183579))

(assert (=> b!121078 d!39084))

(declare-fun d!39086 () Bool)

(assert (=> d!39086 (validate_offset_bits!1 ((_ sign_extend 32) (size!2434 (buf!2868 (_2!5350 lt!189140)))) ((_ sign_extend 32) (currentByte!5553 (_2!5350 lt!189134))) ((_ sign_extend 32) (currentBit!5548 (_2!5350 lt!189134))) lt!189143)))

(declare-fun lt!189494 () Unit!7459)

(declare-fun choose!9 (BitStream!4342 array!5378 (_ BitVec 64) BitStream!4342) Unit!7459)

(assert (=> d!39086 (= lt!189494 (choose!9 (_2!5350 lt!189134) (buf!2868 (_2!5350 lt!189140)) lt!189143 (BitStream!4343 (buf!2868 (_2!5350 lt!189140)) (currentByte!5553 (_2!5350 lt!189134)) (currentBit!5548 (_2!5350 lt!189134)))))))

(assert (=> d!39086 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5350 lt!189134) (buf!2868 (_2!5350 lt!189140)) lt!189143) lt!189494)))

(declare-fun bs!9451 () Bool)

(assert (= bs!9451 d!39086))

(assert (=> bs!9451 m!183271))

(declare-fun m!183581 () Bool)

(assert (=> bs!9451 m!183581))

(assert (=> b!121078 d!39086))

(declare-fun d!39088 () Bool)

(declare-fun lt!189495 () tuple2!10202)

(assert (=> d!39088 (= lt!189495 (readBit!0 (_1!5352 lt!189148)))))

(assert (=> d!39088 (= (readBitPure!0 (_1!5352 lt!189148)) (tuple2!10169 (_2!5366 lt!189495) (_1!5366 lt!189495)))))

(declare-fun bs!9452 () Bool)

(assert (= bs!9452 d!39088))

(declare-fun m!183583 () Bool)

(assert (=> bs!9452 m!183583))

(assert (=> b!121078 d!39088))

(declare-fun d!39090 () Bool)

(assert (=> d!39090 (validate_offset_bits!1 ((_ sign_extend 32) (size!2434 (buf!2868 (_2!5350 lt!189140)))) ((_ sign_extend 32) (currentByte!5553 thiss!1305)) ((_ sign_extend 32) (currentBit!5548 thiss!1305)) lt!189135)))

(declare-fun lt!189496 () Unit!7459)

(assert (=> d!39090 (= lt!189496 (choose!9 thiss!1305 (buf!2868 (_2!5350 lt!189140)) lt!189135 (BitStream!4343 (buf!2868 (_2!5350 lt!189140)) (currentByte!5553 thiss!1305) (currentBit!5548 thiss!1305))))))

(assert (=> d!39090 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2868 (_2!5350 lt!189140)) lt!189135) lt!189496)))

(declare-fun bs!9453 () Bool)

(assert (= bs!9453 d!39090))

(assert (=> bs!9453 m!183251))

(declare-fun m!183585 () Bool)

(assert (=> bs!9453 m!183585))

(assert (=> b!121078 d!39090))

(declare-fun b!121258 () Bool)

(declare-fun e!79433 () Bool)

(declare-fun lt!189571 () (_ BitVec 64))

(declare-fun lt!189566 () (_ BitVec 64))

(declare-fun lt!189576 () tuple2!10174)

(assert (=> b!121258 (= e!79433 (= (_1!5352 lt!189576) (withMovedBitIndex!0 (_2!5352 lt!189576) (bvsub lt!189566 lt!189571))))))

(assert (=> b!121258 (or (= (bvand lt!189566 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!189571 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!189566 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!189566 lt!189571) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!121258 (= lt!189571 (bitIndex!0 (size!2434 (buf!2868 (_2!5350 lt!189140))) (currentByte!5553 (_2!5350 lt!189140)) (currentBit!5548 (_2!5350 lt!189140))))))

(assert (=> b!121258 (= lt!189566 (bitIndex!0 (size!2434 (buf!2868 thiss!1305)) (currentByte!5553 thiss!1305) (currentBit!5548 thiss!1305)))))

(declare-fun b!121259 () Bool)

(declare-fun e!79432 () Unit!7459)

(declare-fun Unit!7473 () Unit!7459)

(assert (=> b!121259 (= e!79432 Unit!7473)))

(declare-fun b!121260 () Bool)

(declare-fun res!100442 () Bool)

(assert (=> b!121260 (=> (not res!100442) (not e!79433))))

(assert (=> b!121260 (= res!100442 (isPrefixOf!0 (_2!5352 lt!189576) (_2!5350 lt!189140)))))

(declare-fun d!39092 () Bool)

(assert (=> d!39092 e!79433))

(declare-fun res!100440 () Bool)

(assert (=> d!39092 (=> (not res!100440) (not e!79433))))

(assert (=> d!39092 (= res!100440 (isPrefixOf!0 (_1!5352 lt!189576) (_2!5352 lt!189576)))))

(declare-fun lt!189563 () BitStream!4342)

(assert (=> d!39092 (= lt!189576 (tuple2!10175 lt!189563 (_2!5350 lt!189140)))))

(declare-fun lt!189570 () Unit!7459)

(declare-fun lt!189575 () Unit!7459)

(assert (=> d!39092 (= lt!189570 lt!189575)))

(assert (=> d!39092 (isPrefixOf!0 lt!189563 (_2!5350 lt!189140))))

(assert (=> d!39092 (= lt!189575 (lemmaIsPrefixTransitive!0 lt!189563 (_2!5350 lt!189140) (_2!5350 lt!189140)))))

(declare-fun lt!189567 () Unit!7459)

(declare-fun lt!189562 () Unit!7459)

(assert (=> d!39092 (= lt!189567 lt!189562)))

(assert (=> d!39092 (isPrefixOf!0 lt!189563 (_2!5350 lt!189140))))

(assert (=> d!39092 (= lt!189562 (lemmaIsPrefixTransitive!0 lt!189563 thiss!1305 (_2!5350 lt!189140)))))

(declare-fun lt!189573 () Unit!7459)

(assert (=> d!39092 (= lt!189573 e!79432)))

(declare-fun c!7273 () Bool)

(assert (=> d!39092 (= c!7273 (not (= (size!2434 (buf!2868 thiss!1305)) #b00000000000000000000000000000000)))))

(declare-fun lt!189564 () Unit!7459)

(declare-fun lt!189580 () Unit!7459)

(assert (=> d!39092 (= lt!189564 lt!189580)))

(assert (=> d!39092 (isPrefixOf!0 (_2!5350 lt!189140) (_2!5350 lt!189140))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4342) Unit!7459)

(assert (=> d!39092 (= lt!189580 (lemmaIsPrefixRefl!0 (_2!5350 lt!189140)))))

(declare-fun lt!189577 () Unit!7459)

(declare-fun lt!189569 () Unit!7459)

(assert (=> d!39092 (= lt!189577 lt!189569)))

(assert (=> d!39092 (= lt!189569 (lemmaIsPrefixRefl!0 (_2!5350 lt!189140)))))

(declare-fun lt!189581 () Unit!7459)

(declare-fun lt!189574 () Unit!7459)

(assert (=> d!39092 (= lt!189581 lt!189574)))

(assert (=> d!39092 (isPrefixOf!0 lt!189563 lt!189563)))

(assert (=> d!39092 (= lt!189574 (lemmaIsPrefixRefl!0 lt!189563))))

(declare-fun lt!189578 () Unit!7459)

(declare-fun lt!189568 () Unit!7459)

(assert (=> d!39092 (= lt!189578 lt!189568)))

(assert (=> d!39092 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!39092 (= lt!189568 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (=> d!39092 (= lt!189563 (BitStream!4343 (buf!2868 (_2!5350 lt!189140)) (currentByte!5553 thiss!1305) (currentBit!5548 thiss!1305)))))

(assert (=> d!39092 (isPrefixOf!0 thiss!1305 (_2!5350 lt!189140))))

(assert (=> d!39092 (= (reader!0 thiss!1305 (_2!5350 lt!189140)) lt!189576)))

(declare-fun b!121261 () Bool)

(declare-fun res!100441 () Bool)

(assert (=> b!121261 (=> (not res!100441) (not e!79433))))

(assert (=> b!121261 (= res!100441 (isPrefixOf!0 (_1!5352 lt!189576) thiss!1305))))

(declare-fun b!121262 () Bool)

(declare-fun lt!189572 () Unit!7459)

(assert (=> b!121262 (= e!79432 lt!189572)))

(declare-fun lt!189579 () (_ BitVec 64))

(assert (=> b!121262 (= lt!189579 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!189565 () (_ BitVec 64))

(assert (=> b!121262 (= lt!189565 (bitIndex!0 (size!2434 (buf!2868 thiss!1305)) (currentByte!5553 thiss!1305) (currentBit!5548 thiss!1305)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!5378 array!5378 (_ BitVec 64) (_ BitVec 64)) Unit!7459)

(assert (=> b!121262 (= lt!189572 (arrayBitRangesEqSymmetric!0 (buf!2868 thiss!1305) (buf!2868 (_2!5350 lt!189140)) lt!189579 lt!189565))))

(assert (=> b!121262 (arrayBitRangesEq!0 (buf!2868 (_2!5350 lt!189140)) (buf!2868 thiss!1305) lt!189579 lt!189565)))

(assert (= (and d!39092 c!7273) b!121262))

(assert (= (and d!39092 (not c!7273)) b!121259))

(assert (= (and d!39092 res!100440) b!121261))

(assert (= (and b!121261 res!100441) b!121260))

(assert (= (and b!121260 res!100442) b!121258))

(declare-fun m!183621 () Bool)

(assert (=> b!121258 m!183621))

(assert (=> b!121258 m!183309))

(assert (=> b!121258 m!183311))

(declare-fun m!183623 () Bool)

(assert (=> d!39092 m!183623))

(assert (=> d!39092 m!183283))

(declare-fun m!183625 () Bool)

(assert (=> d!39092 m!183625))

(declare-fun m!183627 () Bool)

(assert (=> d!39092 m!183627))

(declare-fun m!183629 () Bool)

(assert (=> d!39092 m!183629))

(declare-fun m!183631 () Bool)

(assert (=> d!39092 m!183631))

(declare-fun m!183633 () Bool)

(assert (=> d!39092 m!183633))

(declare-fun m!183635 () Bool)

(assert (=> d!39092 m!183635))

(declare-fun m!183637 () Bool)

(assert (=> d!39092 m!183637))

(declare-fun m!183639 () Bool)

(assert (=> d!39092 m!183639))

(declare-fun m!183641 () Bool)

(assert (=> d!39092 m!183641))

(declare-fun m!183643 () Bool)

(assert (=> b!121261 m!183643))

(assert (=> b!121262 m!183311))

(declare-fun m!183645 () Bool)

(assert (=> b!121262 m!183645))

(declare-fun m!183647 () Bool)

(assert (=> b!121262 m!183647))

(declare-fun m!183649 () Bool)

(assert (=> b!121260 m!183649))

(assert (=> b!121078 d!39092))

(declare-fun lt!189596 () tuple2!10174)

(declare-fun lt!189591 () (_ BitVec 64))

(declare-fun e!79435 () Bool)

(declare-fun b!121263 () Bool)

(declare-fun lt!189586 () (_ BitVec 64))

(assert (=> b!121263 (= e!79435 (= (_1!5352 lt!189596) (withMovedBitIndex!0 (_2!5352 lt!189596) (bvsub lt!189586 lt!189591))))))

(assert (=> b!121263 (or (= (bvand lt!189586 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!189591 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!189586 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!189586 lt!189591) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!121263 (= lt!189591 (bitIndex!0 (size!2434 (buf!2868 (_2!5350 lt!189140))) (currentByte!5553 (_2!5350 lt!189140)) (currentBit!5548 (_2!5350 lt!189140))))))

(assert (=> b!121263 (= lt!189586 (bitIndex!0 (size!2434 (buf!2868 (_2!5350 lt!189134))) (currentByte!5553 (_2!5350 lt!189134)) (currentBit!5548 (_2!5350 lt!189134))))))

(declare-fun b!121264 () Bool)

(declare-fun e!79434 () Unit!7459)

(declare-fun Unit!7474 () Unit!7459)

(assert (=> b!121264 (= e!79434 Unit!7474)))

(declare-fun b!121265 () Bool)

(declare-fun res!100445 () Bool)

(assert (=> b!121265 (=> (not res!100445) (not e!79435))))

(assert (=> b!121265 (= res!100445 (isPrefixOf!0 (_2!5352 lt!189596) (_2!5350 lt!189140)))))

(declare-fun d!39106 () Bool)

(assert (=> d!39106 e!79435))

(declare-fun res!100443 () Bool)

(assert (=> d!39106 (=> (not res!100443) (not e!79435))))

(assert (=> d!39106 (= res!100443 (isPrefixOf!0 (_1!5352 lt!189596) (_2!5352 lt!189596)))))

(declare-fun lt!189583 () BitStream!4342)

(assert (=> d!39106 (= lt!189596 (tuple2!10175 lt!189583 (_2!5350 lt!189140)))))

(declare-fun lt!189590 () Unit!7459)

(declare-fun lt!189595 () Unit!7459)

(assert (=> d!39106 (= lt!189590 lt!189595)))

(assert (=> d!39106 (isPrefixOf!0 lt!189583 (_2!5350 lt!189140))))

(assert (=> d!39106 (= lt!189595 (lemmaIsPrefixTransitive!0 lt!189583 (_2!5350 lt!189140) (_2!5350 lt!189140)))))

(declare-fun lt!189587 () Unit!7459)

(declare-fun lt!189582 () Unit!7459)

(assert (=> d!39106 (= lt!189587 lt!189582)))

(assert (=> d!39106 (isPrefixOf!0 lt!189583 (_2!5350 lt!189140))))

(assert (=> d!39106 (= lt!189582 (lemmaIsPrefixTransitive!0 lt!189583 (_2!5350 lt!189134) (_2!5350 lt!189140)))))

(declare-fun lt!189593 () Unit!7459)

(assert (=> d!39106 (= lt!189593 e!79434)))

(declare-fun c!7274 () Bool)

(assert (=> d!39106 (= c!7274 (not (= (size!2434 (buf!2868 (_2!5350 lt!189134))) #b00000000000000000000000000000000)))))

(declare-fun lt!189584 () Unit!7459)

(declare-fun lt!189600 () Unit!7459)

(assert (=> d!39106 (= lt!189584 lt!189600)))

(assert (=> d!39106 (isPrefixOf!0 (_2!5350 lt!189140) (_2!5350 lt!189140))))

(assert (=> d!39106 (= lt!189600 (lemmaIsPrefixRefl!0 (_2!5350 lt!189140)))))

(declare-fun lt!189597 () Unit!7459)

(declare-fun lt!189589 () Unit!7459)

(assert (=> d!39106 (= lt!189597 lt!189589)))

(assert (=> d!39106 (= lt!189589 (lemmaIsPrefixRefl!0 (_2!5350 lt!189140)))))

(declare-fun lt!189601 () Unit!7459)

(declare-fun lt!189594 () Unit!7459)

(assert (=> d!39106 (= lt!189601 lt!189594)))

(assert (=> d!39106 (isPrefixOf!0 lt!189583 lt!189583)))

(assert (=> d!39106 (= lt!189594 (lemmaIsPrefixRefl!0 lt!189583))))

(declare-fun lt!189598 () Unit!7459)

(declare-fun lt!189588 () Unit!7459)

(assert (=> d!39106 (= lt!189598 lt!189588)))

(assert (=> d!39106 (isPrefixOf!0 (_2!5350 lt!189134) (_2!5350 lt!189134))))

(assert (=> d!39106 (= lt!189588 (lemmaIsPrefixRefl!0 (_2!5350 lt!189134)))))

(assert (=> d!39106 (= lt!189583 (BitStream!4343 (buf!2868 (_2!5350 lt!189140)) (currentByte!5553 (_2!5350 lt!189134)) (currentBit!5548 (_2!5350 lt!189134))))))

(assert (=> d!39106 (isPrefixOf!0 (_2!5350 lt!189134) (_2!5350 lt!189140))))

(assert (=> d!39106 (= (reader!0 (_2!5350 lt!189134) (_2!5350 lt!189140)) lt!189596)))

(declare-fun b!121266 () Bool)

(declare-fun res!100444 () Bool)

(assert (=> b!121266 (=> (not res!100444) (not e!79435))))

(assert (=> b!121266 (= res!100444 (isPrefixOf!0 (_1!5352 lt!189596) (_2!5350 lt!189134)))))

(declare-fun b!121267 () Bool)

(declare-fun lt!189592 () Unit!7459)

(assert (=> b!121267 (= e!79434 lt!189592)))

(declare-fun lt!189599 () (_ BitVec 64))

(assert (=> b!121267 (= lt!189599 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!189585 () (_ BitVec 64))

(assert (=> b!121267 (= lt!189585 (bitIndex!0 (size!2434 (buf!2868 (_2!5350 lt!189134))) (currentByte!5553 (_2!5350 lt!189134)) (currentBit!5548 (_2!5350 lt!189134))))))

(assert (=> b!121267 (= lt!189592 (arrayBitRangesEqSymmetric!0 (buf!2868 (_2!5350 lt!189134)) (buf!2868 (_2!5350 lt!189140)) lt!189599 lt!189585))))

(assert (=> b!121267 (arrayBitRangesEq!0 (buf!2868 (_2!5350 lt!189140)) (buf!2868 (_2!5350 lt!189134)) lt!189599 lt!189585)))

(assert (= (and d!39106 c!7274) b!121267))

(assert (= (and d!39106 (not c!7274)) b!121264))

(assert (= (and d!39106 res!100443) b!121266))

(assert (= (and b!121266 res!100444) b!121265))

(assert (= (and b!121265 res!100445) b!121263))

(declare-fun m!183651 () Bool)

(assert (=> b!121263 m!183651))

(assert (=> b!121263 m!183309))

(assert (=> b!121263 m!183305))

(declare-fun m!183653 () Bool)

(assert (=> d!39106 m!183653))

(declare-fun m!183655 () Bool)

(assert (=> d!39106 m!183655))

(assert (=> d!39106 m!183625))

(assert (=> d!39106 m!183627))

(declare-fun m!183657 () Bool)

(assert (=> d!39106 m!183657))

(declare-fun m!183659 () Bool)

(assert (=> d!39106 m!183659))

(declare-fun m!183661 () Bool)

(assert (=> d!39106 m!183661))

(declare-fun m!183663 () Bool)

(assert (=> d!39106 m!183663))

(declare-fun m!183665 () Bool)

(assert (=> d!39106 m!183665))

(declare-fun m!183667 () Bool)

(assert (=> d!39106 m!183667))

(declare-fun m!183669 () Bool)

(assert (=> d!39106 m!183669))

(declare-fun m!183671 () Bool)

(assert (=> b!121266 m!183671))

(assert (=> b!121267 m!183305))

(declare-fun m!183673 () Bool)

(assert (=> b!121267 m!183673))

(declare-fun m!183675 () Bool)

(assert (=> b!121267 m!183675))

(declare-fun m!183677 () Bool)

(assert (=> b!121265 m!183677))

(assert (=> b!121078 d!39106))

(declare-fun d!39108 () Bool)

(declare-fun e!79446 () Bool)

(assert (=> d!39108 e!79446))

(declare-fun res!100464 () Bool)

(assert (=> d!39108 (=> (not res!100464) (not e!79446))))

(declare-fun lt!189674 () tuple2!10170)

(assert (=> d!39108 (= res!100464 (= (size!2434 (buf!2868 thiss!1305)) (size!2434 (buf!2868 (_2!5350 lt!189674)))))))

(declare-fun choose!16 (BitStream!4342 Bool) tuple2!10170)

(assert (=> d!39108 (= lt!189674 (choose!16 thiss!1305 lt!189123))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!39108 (validate_offset_bit!0 ((_ sign_extend 32) (size!2434 (buf!2868 thiss!1305))) ((_ sign_extend 32) (currentByte!5553 thiss!1305)) ((_ sign_extend 32) (currentBit!5548 thiss!1305)))))

(assert (=> d!39108 (= (appendBit!0 thiss!1305 lt!189123) lt!189674)))

(declare-fun b!121294 () Bool)

(declare-fun e!79447 () Bool)

(assert (=> b!121294 (= e!79446 e!79447)))

(declare-fun res!100463 () Bool)

(assert (=> b!121294 (=> (not res!100463) (not e!79447))))

(declare-fun lt!189672 () tuple2!10168)

(assert (=> b!121294 (= res!100463 (and (= (_2!5349 lt!189672) lt!189123) (= (_1!5349 lt!189672) (_2!5350 lt!189674))))))

(assert (=> b!121294 (= lt!189672 (readBitPure!0 (readerFrom!0 (_2!5350 lt!189674) (currentBit!5548 thiss!1305) (currentByte!5553 thiss!1305))))))

(declare-fun b!121292 () Bool)

(declare-fun res!100465 () Bool)

(assert (=> b!121292 (=> (not res!100465) (not e!79446))))

(declare-fun lt!189675 () (_ BitVec 64))

(declare-fun lt!189673 () (_ BitVec 64))

(assert (=> b!121292 (= res!100465 (= (bitIndex!0 (size!2434 (buf!2868 (_2!5350 lt!189674))) (currentByte!5553 (_2!5350 lt!189674)) (currentBit!5548 (_2!5350 lt!189674))) (bvadd lt!189673 lt!189675)))))

(assert (=> b!121292 (or (not (= (bvand lt!189673 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!189675 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!189673 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!189673 lt!189675) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!121292 (= lt!189675 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!121292 (= lt!189673 (bitIndex!0 (size!2434 (buf!2868 thiss!1305)) (currentByte!5553 thiss!1305) (currentBit!5548 thiss!1305)))))

(declare-fun b!121295 () Bool)

(assert (=> b!121295 (= e!79447 (= (bitIndex!0 (size!2434 (buf!2868 (_1!5349 lt!189672))) (currentByte!5553 (_1!5349 lt!189672)) (currentBit!5548 (_1!5349 lt!189672))) (bitIndex!0 (size!2434 (buf!2868 (_2!5350 lt!189674))) (currentByte!5553 (_2!5350 lt!189674)) (currentBit!5548 (_2!5350 lt!189674)))))))

(declare-fun b!121293 () Bool)

(declare-fun res!100466 () Bool)

(assert (=> b!121293 (=> (not res!100466) (not e!79446))))

(assert (=> b!121293 (= res!100466 (isPrefixOf!0 thiss!1305 (_2!5350 lt!189674)))))

(assert (= (and d!39108 res!100464) b!121292))

(assert (= (and b!121292 res!100465) b!121293))

(assert (= (and b!121293 res!100466) b!121294))

(assert (= (and b!121294 res!100463) b!121295))

(declare-fun m!183713 () Bool)

(assert (=> b!121292 m!183713))

(assert (=> b!121292 m!183311))

(declare-fun m!183715 () Bool)

(assert (=> b!121295 m!183715))

(assert (=> b!121295 m!183713))

(declare-fun m!183717 () Bool)

(assert (=> b!121293 m!183717))

(declare-fun m!183719 () Bool)

(assert (=> d!39108 m!183719))

(declare-fun m!183721 () Bool)

(assert (=> d!39108 m!183721))

(declare-fun m!183723 () Bool)

(assert (=> b!121294 m!183723))

(assert (=> b!121294 m!183723))

(declare-fun m!183725 () Bool)

(assert (=> b!121294 m!183725))

(assert (=> b!121078 d!39108))

(declare-fun d!39116 () Bool)

(assert (=> d!39116 (isPrefixOf!0 thiss!1305 (_2!5350 lt!189140))))

(declare-fun lt!189678 () Unit!7459)

(declare-fun choose!30 (BitStream!4342 BitStream!4342 BitStream!4342) Unit!7459)

(assert (=> d!39116 (= lt!189678 (choose!30 thiss!1305 (_2!5350 lt!189134) (_2!5350 lt!189140)))))

(assert (=> d!39116 (isPrefixOf!0 thiss!1305 (_2!5350 lt!189134))))

(assert (=> d!39116 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5350 lt!189134) (_2!5350 lt!189140)) lt!189678)))

(declare-fun bs!9459 () Bool)

(assert (= bs!9459 d!39116))

(assert (=> bs!9459 m!183283))

(declare-fun m!183727 () Bool)

(assert (=> bs!9459 m!183727))

(assert (=> bs!9459 m!183317))

(assert (=> b!121078 d!39116))

(declare-fun d!39118 () Bool)

(assert (=> d!39118 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2434 (buf!2868 (_2!5350 lt!189140)))) ((_ sign_extend 32) (currentByte!5553 thiss!1305)) ((_ sign_extend 32) (currentBit!5548 thiss!1305)) lt!189135) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2434 (buf!2868 (_2!5350 lt!189140)))) ((_ sign_extend 32) (currentByte!5553 thiss!1305)) ((_ sign_extend 32) (currentBit!5548 thiss!1305))) lt!189135))))

(declare-fun bs!9460 () Bool)

(assert (= bs!9460 d!39118))

(declare-fun m!183729 () Bool)

(assert (=> bs!9460 m!183729))

(assert (=> b!121078 d!39118))

(declare-fun d!39120 () Bool)

(declare-fun lt!189679 () tuple2!10202)

(assert (=> d!39120 (= lt!189679 (readBit!0 (BitStream!4343 (buf!2868 (_2!5350 lt!189140)) (currentByte!5553 thiss!1305) (currentBit!5548 thiss!1305))))))

(assert (=> d!39120 (= (readBitPure!0 (BitStream!4343 (buf!2868 (_2!5350 lt!189140)) (currentByte!5553 thiss!1305) (currentBit!5548 thiss!1305))) (tuple2!10169 (_2!5366 lt!189679) (_1!5366 lt!189679)))))

(declare-fun bs!9461 () Bool)

(assert (= bs!9461 d!39120))

(declare-fun m!183731 () Bool)

(assert (=> bs!9461 m!183731))

(assert (=> b!121078 d!39120))

(declare-fun d!39122 () Bool)

(declare-fun res!100468 () Bool)

(declare-fun e!79449 () Bool)

(assert (=> d!39122 (=> (not res!100468) (not e!79449))))

(assert (=> d!39122 (= res!100468 (= (size!2434 (buf!2868 thiss!1305)) (size!2434 (buf!2868 (_2!5350 lt!189140)))))))

(assert (=> d!39122 (= (isPrefixOf!0 thiss!1305 (_2!5350 lt!189140)) e!79449)))

(declare-fun b!121296 () Bool)

(declare-fun res!100467 () Bool)

(assert (=> b!121296 (=> (not res!100467) (not e!79449))))

(assert (=> b!121296 (= res!100467 (bvsle (bitIndex!0 (size!2434 (buf!2868 thiss!1305)) (currentByte!5553 thiss!1305) (currentBit!5548 thiss!1305)) (bitIndex!0 (size!2434 (buf!2868 (_2!5350 lt!189140))) (currentByte!5553 (_2!5350 lt!189140)) (currentBit!5548 (_2!5350 lt!189140)))))))

(declare-fun b!121297 () Bool)

(declare-fun e!79448 () Bool)

(assert (=> b!121297 (= e!79449 e!79448)))

(declare-fun res!100469 () Bool)

(assert (=> b!121297 (=> res!100469 e!79448)))

(assert (=> b!121297 (= res!100469 (= (size!2434 (buf!2868 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!121298 () Bool)

(assert (=> b!121298 (= e!79448 (arrayBitRangesEq!0 (buf!2868 thiss!1305) (buf!2868 (_2!5350 lt!189140)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2434 (buf!2868 thiss!1305)) (currentByte!5553 thiss!1305) (currentBit!5548 thiss!1305))))))

(assert (= (and d!39122 res!100468) b!121296))

(assert (= (and b!121296 res!100467) b!121297))

(assert (= (and b!121297 (not res!100469)) b!121298))

(assert (=> b!121296 m!183311))

(assert (=> b!121296 m!183309))

(assert (=> b!121298 m!183311))

(assert (=> b!121298 m!183311))

(declare-fun m!183733 () Bool)

(assert (=> b!121298 m!183733))

(assert (=> b!121078 d!39122))

(declare-fun d!39124 () Bool)

(declare-fun e!79450 () Bool)

(assert (=> d!39124 e!79450))

(declare-fun res!100471 () Bool)

(assert (=> d!39124 (=> (not res!100471) (not e!79450))))

(declare-fun lt!189682 () (_ BitVec 64))

(declare-fun lt!189684 () (_ BitVec 64))

(declare-fun lt!189683 () (_ BitVec 64))

(assert (=> d!39124 (= res!100471 (= lt!189684 (bvsub lt!189682 lt!189683)))))

(assert (=> d!39124 (or (= (bvand lt!189682 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!189683 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!189682 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!189682 lt!189683) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39124 (= lt!189683 (remainingBits!0 ((_ sign_extend 32) (size!2434 (buf!2868 (_1!5349 lt!189150)))) ((_ sign_extend 32) (currentByte!5553 (_1!5349 lt!189150))) ((_ sign_extend 32) (currentBit!5548 (_1!5349 lt!189150)))))))

(declare-fun lt!189680 () (_ BitVec 64))

(declare-fun lt!189685 () (_ BitVec 64))

(assert (=> d!39124 (= lt!189682 (bvmul lt!189680 lt!189685))))

(assert (=> d!39124 (or (= lt!189680 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!189685 (bvsdiv (bvmul lt!189680 lt!189685) lt!189680)))))

(assert (=> d!39124 (= lt!189685 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!39124 (= lt!189680 ((_ sign_extend 32) (size!2434 (buf!2868 (_1!5349 lt!189150)))))))

(assert (=> d!39124 (= lt!189684 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5553 (_1!5349 lt!189150))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5548 (_1!5349 lt!189150)))))))

(assert (=> d!39124 (invariant!0 (currentBit!5548 (_1!5349 lt!189150)) (currentByte!5553 (_1!5349 lt!189150)) (size!2434 (buf!2868 (_1!5349 lt!189150))))))

(assert (=> d!39124 (= (bitIndex!0 (size!2434 (buf!2868 (_1!5349 lt!189150))) (currentByte!5553 (_1!5349 lt!189150)) (currentBit!5548 (_1!5349 lt!189150))) lt!189684)))

(declare-fun b!121299 () Bool)

(declare-fun res!100470 () Bool)

(assert (=> b!121299 (=> (not res!100470) (not e!79450))))

(assert (=> b!121299 (= res!100470 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!189684))))

(declare-fun b!121300 () Bool)

(declare-fun lt!189681 () (_ BitVec 64))

(assert (=> b!121300 (= e!79450 (bvsle lt!189684 (bvmul lt!189681 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!121300 (or (= lt!189681 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!189681 #b0000000000000000000000000000000000000000000000000000000000001000) lt!189681)))))

(assert (=> b!121300 (= lt!189681 ((_ sign_extend 32) (size!2434 (buf!2868 (_1!5349 lt!189150)))))))

(assert (= (and d!39124 res!100471) b!121299))

(assert (= (and b!121299 res!100470) b!121300))

(declare-fun m!183735 () Bool)

(assert (=> d!39124 m!183735))

(declare-fun m!183737 () Bool)

(assert (=> d!39124 m!183737))

(assert (=> b!121078 d!39124))

(declare-fun d!39126 () Bool)

(declare-fun lt!189686 () tuple2!10196)

(assert (=> d!39126 (= lt!189686 (readNLeastSignificantBitsLoop!0 (_1!5352 lt!189148) nBits!396 i!615 lt!189142))))

(assert (=> d!39126 (= (readNLeastSignificantBitsLoopPure!0 (_1!5352 lt!189148) nBits!396 i!615 lt!189142) (tuple2!10173 (_2!5363 lt!189686) (_1!5363 lt!189686)))))

(declare-fun bs!9462 () Bool)

(assert (= bs!9462 d!39126))

(declare-fun m!183739 () Bool)

(assert (=> bs!9462 m!183739))

(assert (=> b!121078 d!39126))

(declare-fun d!39128 () Bool)

(declare-fun e!79453 () Bool)

(assert (=> d!39128 e!79453))

(declare-fun res!100474 () Bool)

(assert (=> d!39128 (=> (not res!100474) (not e!79453))))

(declare-fun lt!189695 () tuple2!10168)

(declare-fun lt!189696 () tuple2!10168)

(assert (=> d!39128 (= res!100474 (= (bitIndex!0 (size!2434 (buf!2868 (_1!5349 lt!189695))) (currentByte!5553 (_1!5349 lt!189695)) (currentBit!5548 (_1!5349 lt!189695))) (bitIndex!0 (size!2434 (buf!2868 (_1!5349 lt!189696))) (currentByte!5553 (_1!5349 lt!189696)) (currentBit!5548 (_1!5349 lt!189696)))))))

(declare-fun lt!189698 () Unit!7459)

(declare-fun lt!189697 () BitStream!4342)

(declare-fun choose!50 (BitStream!4342 BitStream!4342 BitStream!4342 tuple2!10168 tuple2!10168 BitStream!4342 Bool tuple2!10168 tuple2!10168 BitStream!4342 Bool) Unit!7459)

(assert (=> d!39128 (= lt!189698 (choose!50 lt!189125 (_2!5350 lt!189140) lt!189697 lt!189695 (tuple2!10169 (_1!5349 lt!189695) (_2!5349 lt!189695)) (_1!5349 lt!189695) (_2!5349 lt!189695) lt!189696 (tuple2!10169 (_1!5349 lt!189696) (_2!5349 lt!189696)) (_1!5349 lt!189696) (_2!5349 lt!189696)))))

(assert (=> d!39128 (= lt!189696 (readBitPure!0 lt!189697))))

(assert (=> d!39128 (= lt!189695 (readBitPure!0 lt!189125))))

(assert (=> d!39128 (= lt!189697 (BitStream!4343 (buf!2868 (_2!5350 lt!189140)) (currentByte!5553 lt!189125) (currentBit!5548 lt!189125)))))

(assert (=> d!39128 (invariant!0 (currentBit!5548 lt!189125) (currentByte!5553 lt!189125) (size!2434 (buf!2868 (_2!5350 lt!189140))))))

(assert (=> d!39128 (= (readBitPrefixLemma!0 lt!189125 (_2!5350 lt!189140)) lt!189698)))

(declare-fun b!121303 () Bool)

(assert (=> b!121303 (= e!79453 (= (_2!5349 lt!189695) (_2!5349 lt!189696)))))

(assert (= (and d!39128 res!100474) b!121303))

(declare-fun m!183741 () Bool)

(assert (=> d!39128 m!183741))

(declare-fun m!183743 () Bool)

(assert (=> d!39128 m!183743))

(declare-fun m!183745 () Bool)

(assert (=> d!39128 m!183745))

(declare-fun m!183747 () Bool)

(assert (=> d!39128 m!183747))

(assert (=> d!39128 m!183285))

(declare-fun m!183749 () Bool)

(assert (=> d!39128 m!183749))

(assert (=> b!121078 d!39128))

(declare-fun d!39130 () Bool)

(declare-fun lt!189699 () tuple2!10202)

(assert (=> d!39130 (= lt!189699 (readBit!0 lt!189125))))

(assert (=> d!39130 (= (readBitPure!0 lt!189125) (tuple2!10169 (_2!5366 lt!189699) (_1!5366 lt!189699)))))

(declare-fun bs!9463 () Bool)

(assert (= bs!9463 d!39130))

(declare-fun m!183751 () Bool)

(assert (=> bs!9463 m!183751))

(assert (=> b!121078 d!39130))

(declare-fun b!121484 () Bool)

(declare-fun res!100616 () Bool)

(declare-fun call!1589 () Bool)

(assert (=> b!121484 (= res!100616 call!1589)))

(declare-fun e!79558 () Bool)

(assert (=> b!121484 (=> (not res!100616) (not e!79558))))

(declare-fun b!121485 () Bool)

(declare-fun res!100614 () Bool)

(declare-fun e!79559 () Bool)

(assert (=> b!121485 (=> (not res!100614) (not e!79559))))

(declare-fun lt!190293 () tuple2!10170)

(assert (=> b!121485 (= res!100614 (isPrefixOf!0 (_2!5350 lt!189134) (_2!5350 lt!190293)))))

(declare-fun lt!190309 () BitStream!4342)

(declare-fun c!7300 () Bool)

(declare-fun bm!1586 () Bool)

(declare-fun lt!190279 () tuple2!10170)

(assert (=> bm!1586 (= call!1589 (isPrefixOf!0 (ite c!7300 (_2!5350 lt!189134) lt!190309) (ite c!7300 (_2!5350 lt!190279) lt!190309)))))

(declare-fun b!121486 () Bool)

(declare-fun res!100618 () Bool)

(assert (=> b!121486 (= res!100618 (= (bitIndex!0 (size!2434 (buf!2868 (_2!5350 lt!190279))) (currentByte!5553 (_2!5350 lt!190279)) (currentBit!5548 (_2!5350 lt!190279))) (bvadd (bitIndex!0 (size!2434 (buf!2868 (_2!5350 lt!189134))) (currentByte!5553 (_2!5350 lt!189134)) (currentBit!5548 (_2!5350 lt!189134))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!121486 (=> (not res!100618) (not e!79558))))

(declare-fun d!39132 () Bool)

(assert (=> d!39132 e!79559))

(declare-fun res!100613 () Bool)

(assert (=> d!39132 (=> (not res!100613) (not e!79559))))

(assert (=> d!39132 (= res!100613 (= (size!2434 (buf!2868 (_2!5350 lt!189134))) (size!2434 (buf!2868 (_2!5350 lt!190293)))))))

(declare-fun e!79556 () tuple2!10170)

(assert (=> d!39132 (= lt!190293 e!79556)))

(assert (=> d!39132 (= c!7300 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!39132 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!39132 (= (appendNLeastSignificantBitsLoop!0 (_2!5350 lt!189134) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!190293)))

(declare-fun b!121487 () Bool)

(declare-fun lt!190290 () Unit!7459)

(assert (=> b!121487 (= e!79556 (tuple2!10171 lt!190290 (_2!5350 lt!189134)))))

(assert (=> b!121487 (= lt!190309 (_2!5350 lt!189134))))

(assert (=> b!121487 (= lt!190290 (lemmaIsPrefixRefl!0 lt!190309))))

(assert (=> b!121487 call!1589))

(declare-fun b!121488 () Bool)

(declare-fun res!100620 () Bool)

(assert (=> b!121488 (=> (not res!100620) (not e!79559))))

(declare-fun lt!190307 () (_ BitVec 64))

(declare-fun lt!190304 () (_ BitVec 64))

(assert (=> b!121488 (= res!100620 (= (bitIndex!0 (size!2434 (buf!2868 (_2!5350 lt!190293))) (currentByte!5553 (_2!5350 lt!190293)) (currentBit!5548 (_2!5350 lt!190293))) (bvadd lt!190307 lt!190304)))))

(assert (=> b!121488 (or (not (= (bvand lt!190307 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!190304 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!190307 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!190307 lt!190304) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!121488 (= lt!190304 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!121488 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!121488 (= lt!190307 (bitIndex!0 (size!2434 (buf!2868 (_2!5350 lt!189134))) (currentByte!5553 (_2!5350 lt!189134)) (currentBit!5548 (_2!5350 lt!189134))))))

(declare-fun b!121489 () Bool)

(declare-fun e!79555 () (_ BitVec 64))

(assert (=> b!121489 (= e!79555 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!121490 () Bool)

(declare-fun lt!190292 () tuple2!10174)

(declare-fun lt!190273 () tuple2!10172)

(assert (=> b!121490 (= e!79559 (and (= (_2!5351 lt!190273) v!199) (= (_1!5351 lt!190273) (_2!5352 lt!190292))))))

(declare-fun lt!190284 () (_ BitVec 64))

(assert (=> b!121490 (= lt!190273 (readNLeastSignificantBitsLoopPure!0 (_1!5352 lt!190292) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!190284))))

(declare-fun lt!190274 () Unit!7459)

(declare-fun lt!190294 () Unit!7459)

(assert (=> b!121490 (= lt!190274 lt!190294)))

(declare-fun lt!190311 () (_ BitVec 64))

(assert (=> b!121490 (validate_offset_bits!1 ((_ sign_extend 32) (size!2434 (buf!2868 (_2!5350 lt!190293)))) ((_ sign_extend 32) (currentByte!5553 (_2!5350 lt!189134))) ((_ sign_extend 32) (currentBit!5548 (_2!5350 lt!189134))) lt!190311)))

(assert (=> b!121490 (= lt!190294 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5350 lt!189134) (buf!2868 (_2!5350 lt!190293)) lt!190311))))

(declare-fun e!79554 () Bool)

(assert (=> b!121490 e!79554))

(declare-fun res!100617 () Bool)

(assert (=> b!121490 (=> (not res!100617) (not e!79554))))

(assert (=> b!121490 (= res!100617 (and (= (size!2434 (buf!2868 (_2!5350 lt!189134))) (size!2434 (buf!2868 (_2!5350 lt!190293)))) (bvsge lt!190311 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!121490 (= lt!190311 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!121490 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!121490 (= lt!190284 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!121490 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!121490 (= lt!190292 (reader!0 (_2!5350 lt!189134) (_2!5350 lt!190293)))))

(declare-fun b!121491 () Bool)

(declare-fun lt!190314 () tuple2!10170)

(declare-fun Unit!7478 () Unit!7459)

(assert (=> b!121491 (= e!79556 (tuple2!10171 Unit!7478 (_2!5350 lt!190314)))))

(declare-fun lt!190289 () Bool)

(assert (=> b!121491 (= lt!190289 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!121491 (= lt!190279 (appendBit!0 (_2!5350 lt!189134) lt!190289))))

(declare-fun res!100619 () Bool)

(assert (=> b!121491 (= res!100619 (= (size!2434 (buf!2868 (_2!5350 lt!189134))) (size!2434 (buf!2868 (_2!5350 lt!190279)))))))

(assert (=> b!121491 (=> (not res!100619) (not e!79558))))

(assert (=> b!121491 e!79558))

(declare-fun lt!190316 () tuple2!10170)

(assert (=> b!121491 (= lt!190316 lt!190279)))

(assert (=> b!121491 (= lt!190314 (appendNLeastSignificantBitsLoop!0 (_2!5350 lt!190316) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!190280 () Unit!7459)

(assert (=> b!121491 (= lt!190280 (lemmaIsPrefixTransitive!0 (_2!5350 lt!189134) (_2!5350 lt!190316) (_2!5350 lt!190314)))))

(assert (=> b!121491 (isPrefixOf!0 (_2!5350 lt!189134) (_2!5350 lt!190314))))

(declare-fun lt!190317 () Unit!7459)

(assert (=> b!121491 (= lt!190317 lt!190280)))

(assert (=> b!121491 (invariant!0 (currentBit!5548 (_2!5350 lt!189134)) (currentByte!5553 (_2!5350 lt!189134)) (size!2434 (buf!2868 (_2!5350 lt!190316))))))

(declare-fun lt!190308 () BitStream!4342)

(assert (=> b!121491 (= lt!190308 (BitStream!4343 (buf!2868 (_2!5350 lt!190316)) (currentByte!5553 (_2!5350 lt!189134)) (currentBit!5548 (_2!5350 lt!189134))))))

(assert (=> b!121491 (invariant!0 (currentBit!5548 lt!190308) (currentByte!5553 lt!190308) (size!2434 (buf!2868 (_2!5350 lt!190314))))))

(declare-fun lt!190297 () BitStream!4342)

(assert (=> b!121491 (= lt!190297 (BitStream!4343 (buf!2868 (_2!5350 lt!190314)) (currentByte!5553 lt!190308) (currentBit!5548 lt!190308)))))

(declare-fun lt!190276 () tuple2!10168)

(assert (=> b!121491 (= lt!190276 (readBitPure!0 lt!190308))))

(declare-fun lt!190285 () tuple2!10168)

(assert (=> b!121491 (= lt!190285 (readBitPure!0 lt!190297))))

(declare-fun lt!190288 () Unit!7459)

(assert (=> b!121491 (= lt!190288 (readBitPrefixLemma!0 lt!190308 (_2!5350 lt!190314)))))

(declare-fun res!100615 () Bool)

(assert (=> b!121491 (= res!100615 (= (bitIndex!0 (size!2434 (buf!2868 (_1!5349 lt!190276))) (currentByte!5553 (_1!5349 lt!190276)) (currentBit!5548 (_1!5349 lt!190276))) (bitIndex!0 (size!2434 (buf!2868 (_1!5349 lt!190285))) (currentByte!5553 (_1!5349 lt!190285)) (currentBit!5548 (_1!5349 lt!190285)))))))

(declare-fun e!79553 () Bool)

(assert (=> b!121491 (=> (not res!100615) (not e!79553))))

(assert (=> b!121491 e!79553))

(declare-fun lt!190300 () Unit!7459)

(assert (=> b!121491 (= lt!190300 lt!190288)))

(declare-fun lt!190315 () tuple2!10174)

(assert (=> b!121491 (= lt!190315 (reader!0 (_2!5350 lt!189134) (_2!5350 lt!190314)))))

(declare-fun lt!190305 () tuple2!10174)

(assert (=> b!121491 (= lt!190305 (reader!0 (_2!5350 lt!190316) (_2!5350 lt!190314)))))

(declare-fun lt!190291 () tuple2!10168)

(assert (=> b!121491 (= lt!190291 (readBitPure!0 (_1!5352 lt!190315)))))

(assert (=> b!121491 (= (_2!5349 lt!190291) lt!190289)))

(declare-fun lt!190301 () Unit!7459)

(declare-fun Unit!7479 () Unit!7459)

(assert (=> b!121491 (= lt!190301 Unit!7479)))

(declare-fun lt!190312 () (_ BitVec 64))

(assert (=> b!121491 (= lt!190312 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!190303 () (_ BitVec 64))

(assert (=> b!121491 (= lt!190303 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!190310 () Unit!7459)

(assert (=> b!121491 (= lt!190310 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5350 lt!189134) (buf!2868 (_2!5350 lt!190314)) lt!190303))))

(assert (=> b!121491 (validate_offset_bits!1 ((_ sign_extend 32) (size!2434 (buf!2868 (_2!5350 lt!190314)))) ((_ sign_extend 32) (currentByte!5553 (_2!5350 lt!189134))) ((_ sign_extend 32) (currentBit!5548 (_2!5350 lt!189134))) lt!190303)))

(declare-fun lt!190306 () Unit!7459)

(assert (=> b!121491 (= lt!190306 lt!190310)))

(declare-fun lt!190295 () tuple2!10172)

(assert (=> b!121491 (= lt!190295 (readNLeastSignificantBitsLoopPure!0 (_1!5352 lt!190315) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!190312))))

(declare-fun lt!190298 () (_ BitVec 64))

(assert (=> b!121491 (= lt!190298 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!190283 () Unit!7459)

(assert (=> b!121491 (= lt!190283 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5350 lt!190316) (buf!2868 (_2!5350 lt!190314)) lt!190298))))

(assert (=> b!121491 (validate_offset_bits!1 ((_ sign_extend 32) (size!2434 (buf!2868 (_2!5350 lt!190314)))) ((_ sign_extend 32) (currentByte!5553 (_2!5350 lt!190316))) ((_ sign_extend 32) (currentBit!5548 (_2!5350 lt!190316))) lt!190298)))

(declare-fun lt!190275 () Unit!7459)

(assert (=> b!121491 (= lt!190275 lt!190283)))

(declare-fun lt!190278 () tuple2!10172)

(assert (=> b!121491 (= lt!190278 (readNLeastSignificantBitsLoopPure!0 (_1!5352 lt!190305) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!190312 (ite (_2!5349 lt!190291) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!190286 () tuple2!10172)

(assert (=> b!121491 (= lt!190286 (readNLeastSignificantBitsLoopPure!0 (_1!5352 lt!190315) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!190312))))

(declare-fun c!7299 () Bool)

(assert (=> b!121491 (= c!7299 (_2!5349 (readBitPure!0 (_1!5352 lt!190315))))))

(declare-fun lt!190299 () tuple2!10172)

(assert (=> b!121491 (= lt!190299 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!5352 lt!190315) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!190312 e!79555)))))

(declare-fun lt!190287 () Unit!7459)

(assert (=> b!121491 (= lt!190287 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5352 lt!190315) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!190312))))

(assert (=> b!121491 (and (= (_2!5351 lt!190286) (_2!5351 lt!190299)) (= (_1!5351 lt!190286) (_1!5351 lt!190299)))))

(declare-fun lt!190302 () Unit!7459)

(assert (=> b!121491 (= lt!190302 lt!190287)))

(assert (=> b!121491 (= (_1!5352 lt!190315) (withMovedBitIndex!0 (_2!5352 lt!190315) (bvsub (bitIndex!0 (size!2434 (buf!2868 (_2!5350 lt!189134))) (currentByte!5553 (_2!5350 lt!189134)) (currentBit!5548 (_2!5350 lt!189134))) (bitIndex!0 (size!2434 (buf!2868 (_2!5350 lt!190314))) (currentByte!5553 (_2!5350 lt!190314)) (currentBit!5548 (_2!5350 lt!190314))))))))

(declare-fun lt!190313 () Unit!7459)

(declare-fun Unit!7484 () Unit!7459)

(assert (=> b!121491 (= lt!190313 Unit!7484)))

(assert (=> b!121491 (= (_1!5352 lt!190305) (withMovedBitIndex!0 (_2!5352 lt!190305) (bvsub (bitIndex!0 (size!2434 (buf!2868 (_2!5350 lt!190316))) (currentByte!5553 (_2!5350 lt!190316)) (currentBit!5548 (_2!5350 lt!190316))) (bitIndex!0 (size!2434 (buf!2868 (_2!5350 lt!190314))) (currentByte!5553 (_2!5350 lt!190314)) (currentBit!5548 (_2!5350 lt!190314))))))))

(declare-fun lt!190282 () Unit!7459)

(declare-fun Unit!7485 () Unit!7459)

(assert (=> b!121491 (= lt!190282 Unit!7485)))

(assert (=> b!121491 (= (bitIndex!0 (size!2434 (buf!2868 (_2!5350 lt!189134))) (currentByte!5553 (_2!5350 lt!189134)) (currentBit!5548 (_2!5350 lt!189134))) (bvsub (bitIndex!0 (size!2434 (buf!2868 (_2!5350 lt!190316))) (currentByte!5553 (_2!5350 lt!190316)) (currentBit!5548 (_2!5350 lt!190316))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!190277 () Unit!7459)

(declare-fun Unit!7486 () Unit!7459)

(assert (=> b!121491 (= lt!190277 Unit!7486)))

(assert (=> b!121491 (= (_2!5351 lt!190295) (_2!5351 lt!190278))))

(declare-fun lt!190296 () Unit!7459)

(declare-fun Unit!7487 () Unit!7459)

(assert (=> b!121491 (= lt!190296 Unit!7487)))

(assert (=> b!121491 (= (_1!5351 lt!190295) (_2!5352 lt!190315))))

(declare-fun b!121492 () Bool)

(assert (=> b!121492 (= e!79554 (validate_offset_bits!1 ((_ sign_extend 32) (size!2434 (buf!2868 (_2!5350 lt!189134)))) ((_ sign_extend 32) (currentByte!5553 (_2!5350 lt!189134))) ((_ sign_extend 32) (currentBit!5548 (_2!5350 lt!189134))) lt!190311))))

(declare-fun b!121493 () Bool)

(assert (=> b!121493 (= e!79553 (= (_2!5349 lt!190276) (_2!5349 lt!190285)))))

(declare-fun b!121494 () Bool)

(declare-fun e!79557 () Bool)

(declare-fun lt!190281 () tuple2!10168)

(assert (=> b!121494 (= e!79557 (= (bitIndex!0 (size!2434 (buf!2868 (_1!5349 lt!190281))) (currentByte!5553 (_1!5349 lt!190281)) (currentBit!5548 (_1!5349 lt!190281))) (bitIndex!0 (size!2434 (buf!2868 (_2!5350 lt!190279))) (currentByte!5553 (_2!5350 lt!190279)) (currentBit!5548 (_2!5350 lt!190279)))))))

(declare-fun b!121495 () Bool)

(assert (=> b!121495 (= e!79555 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun b!121496 () Bool)

(assert (=> b!121496 (= lt!190281 (readBitPure!0 (readerFrom!0 (_2!5350 lt!190279) (currentBit!5548 (_2!5350 lt!189134)) (currentByte!5553 (_2!5350 lt!189134)))))))

(declare-fun res!100621 () Bool)

(assert (=> b!121496 (= res!100621 (and (= (_2!5349 lt!190281) lt!190289) (= (_1!5349 lt!190281) (_2!5350 lt!190279))))))

(assert (=> b!121496 (=> (not res!100621) (not e!79557))))

(assert (=> b!121496 (= e!79558 e!79557)))

(assert (= (and d!39132 c!7300) b!121491))

(assert (= (and d!39132 (not c!7300)) b!121487))

(assert (= (and b!121491 res!100619) b!121486))

(assert (= (and b!121486 res!100618) b!121484))

(assert (= (and b!121484 res!100616) b!121496))

(assert (= (and b!121496 res!100621) b!121494))

(assert (= (and b!121491 res!100615) b!121493))

(assert (= (and b!121491 c!7299) b!121495))

(assert (= (and b!121491 (not c!7299)) b!121489))

(assert (= (or b!121484 b!121487) bm!1586))

(assert (= (and d!39132 res!100613) b!121488))

(assert (= (and b!121488 res!100620) b!121485))

(assert (= (and b!121485 res!100614) b!121490))

(assert (= (and b!121490 res!100617) b!121492))

(declare-fun m!184119 () Bool)

(assert (=> b!121490 m!184119))

(declare-fun m!184121 () Bool)

(assert (=> b!121490 m!184121))

(declare-fun m!184123 () Bool)

(assert (=> b!121490 m!184123))

(declare-fun m!184125 () Bool)

(assert (=> b!121490 m!184125))

(declare-fun m!184127 () Bool)

(assert (=> b!121490 m!184127))

(declare-fun m!184129 () Bool)

(assert (=> b!121492 m!184129))

(declare-fun m!184131 () Bool)

(assert (=> b!121496 m!184131))

(assert (=> b!121496 m!184131))

(declare-fun m!184133 () Bool)

(assert (=> b!121496 m!184133))

(declare-fun m!184135 () Bool)

(assert (=> b!121485 m!184135))

(declare-fun m!184137 () Bool)

(assert (=> bm!1586 m!184137))

(declare-fun m!184139 () Bool)

(assert (=> b!121488 m!184139))

(assert (=> b!121488 m!183305))

(declare-fun m!184141 () Bool)

(assert (=> b!121486 m!184141))

(assert (=> b!121486 m!183305))

(declare-fun m!184143 () Bool)

(assert (=> b!121487 m!184143))

(declare-fun m!184145 () Bool)

(assert (=> b!121494 m!184145))

(assert (=> b!121494 m!184141))

(declare-fun m!184147 () Bool)

(assert (=> b!121491 m!184147))

(declare-fun m!184149 () Bool)

(assert (=> b!121491 m!184149))

(assert (=> b!121491 m!183305))

(declare-fun m!184151 () Bool)

(assert (=> b!121491 m!184151))

(declare-fun m!184153 () Bool)

(assert (=> b!121491 m!184153))

(declare-fun m!184155 () Bool)

(assert (=> b!121491 m!184155))

(declare-fun m!184157 () Bool)

(assert (=> b!121491 m!184157))

(declare-fun m!184159 () Bool)

(assert (=> b!121491 m!184159))

(declare-fun m!184161 () Bool)

(assert (=> b!121491 m!184161))

(declare-fun m!184163 () Bool)

(assert (=> b!121491 m!184163))

(declare-fun m!184165 () Bool)

(assert (=> b!121491 m!184165))

(declare-fun m!184167 () Bool)

(assert (=> b!121491 m!184167))

(declare-fun m!184169 () Bool)

(assert (=> b!121491 m!184169))

(declare-fun m!184171 () Bool)

(assert (=> b!121491 m!184171))

(declare-fun m!184173 () Bool)

(assert (=> b!121491 m!184173))

(declare-fun m!184175 () Bool)

(assert (=> b!121491 m!184175))

(declare-fun m!184177 () Bool)

(assert (=> b!121491 m!184177))

(declare-fun m!184179 () Bool)

(assert (=> b!121491 m!184179))

(declare-fun m!184181 () Bool)

(assert (=> b!121491 m!184181))

(declare-fun m!184183 () Bool)

(assert (=> b!121491 m!184183))

(declare-fun m!184185 () Bool)

(assert (=> b!121491 m!184185))

(declare-fun m!184187 () Bool)

(assert (=> b!121491 m!184187))

(declare-fun m!184189 () Bool)

(assert (=> b!121491 m!184189))

(declare-fun m!184191 () Bool)

(assert (=> b!121491 m!184191))

(declare-fun m!184193 () Bool)

(assert (=> b!121491 m!184193))

(assert (=> b!121491 m!184153))

(declare-fun m!184195 () Bool)

(assert (=> b!121491 m!184195))

(declare-fun m!184197 () Bool)

(assert (=> b!121491 m!184197))

(declare-fun m!184199 () Bool)

(assert (=> b!121491 m!184199))

(assert (=> b!121491 m!184127))

(assert (=> b!121078 d!39132))

(declare-fun d!39220 () Bool)

(declare-fun e!79560 () Bool)

(assert (=> d!39220 e!79560))

(declare-fun res!100623 () Bool)

(assert (=> d!39220 (=> (not res!100623) (not e!79560))))

(declare-fun lt!190321 () (_ BitVec 64))

(declare-fun lt!190322 () (_ BitVec 64))

(declare-fun lt!190320 () (_ BitVec 64))

(assert (=> d!39220 (= res!100623 (= lt!190322 (bvsub lt!190320 lt!190321)))))

(assert (=> d!39220 (or (= (bvand lt!190320 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!190321 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!190320 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!190320 lt!190321) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39220 (= lt!190321 (remainingBits!0 ((_ sign_extend 32) (size!2434 (buf!2868 (_1!5349 lt!189146)))) ((_ sign_extend 32) (currentByte!5553 (_1!5349 lt!189146))) ((_ sign_extend 32) (currentBit!5548 (_1!5349 lt!189146)))))))

(declare-fun lt!190318 () (_ BitVec 64))

(declare-fun lt!190323 () (_ BitVec 64))

(assert (=> d!39220 (= lt!190320 (bvmul lt!190318 lt!190323))))

(assert (=> d!39220 (or (= lt!190318 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!190323 (bvsdiv (bvmul lt!190318 lt!190323) lt!190318)))))

(assert (=> d!39220 (= lt!190323 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!39220 (= lt!190318 ((_ sign_extend 32) (size!2434 (buf!2868 (_1!5349 lt!189146)))))))

(assert (=> d!39220 (= lt!190322 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5553 (_1!5349 lt!189146))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5548 (_1!5349 lt!189146)))))))

(assert (=> d!39220 (invariant!0 (currentBit!5548 (_1!5349 lt!189146)) (currentByte!5553 (_1!5349 lt!189146)) (size!2434 (buf!2868 (_1!5349 lt!189146))))))

(assert (=> d!39220 (= (bitIndex!0 (size!2434 (buf!2868 (_1!5349 lt!189146))) (currentByte!5553 (_1!5349 lt!189146)) (currentBit!5548 (_1!5349 lt!189146))) lt!190322)))

(declare-fun b!121497 () Bool)

(declare-fun res!100622 () Bool)

(assert (=> b!121497 (=> (not res!100622) (not e!79560))))

(assert (=> b!121497 (= res!100622 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!190322))))

(declare-fun b!121498 () Bool)

(declare-fun lt!190319 () (_ BitVec 64))

(assert (=> b!121498 (= e!79560 (bvsle lt!190322 (bvmul lt!190319 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!121498 (or (= lt!190319 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!190319 #b0000000000000000000000000000000000000000000000000000000000001000) lt!190319)))))

(assert (=> b!121498 (= lt!190319 ((_ sign_extend 32) (size!2434 (buf!2868 (_1!5349 lt!189146)))))))

(assert (= (and d!39220 res!100623) b!121497))

(assert (= (and b!121497 res!100622) b!121498))

(declare-fun m!184201 () Bool)

(assert (=> d!39220 m!184201))

(declare-fun m!184203 () Bool)

(assert (=> d!39220 m!184203))

(assert (=> b!121068 d!39220))

(declare-fun d!39222 () Bool)

(assert (=> d!39222 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!121079 d!39222))

(push 1)

(assert (not b!121296))

(assert (not d!39106))

(assert (not d!39066))

(assert (not bm!1586))

(assert (not b!121265))

(assert (not d!39068))

(assert (not d!39052))

(assert (not b!121492))

(assert (not d!39032))

(assert (not b!121295))

(assert (not b!121218))

(assert (not d!39050))

(assert (not b!121486))

(assert (not d!39082))

(assert (not d!39080))

(assert (not b!121267))

(assert (not d!39036))

(assert (not b!121261))

(assert (not d!39126))

(assert (not d!39072))

(assert (not b!121487))

(assert (not d!39220))

(assert (not b!121266))

(assert (not b!121292))

(assert (not b!121298))

(assert (not b!121293))

(assert (not d!39022))

(assert (not d!39088))

(assert (not b!121494))

(assert (not b!121258))

(assert (not b!121490))

(assert (not b!121496))

(assert (not d!39084))

(assert (not b!121227))

(assert (not d!39118))

(assert (not b!121491))

(assert (not d!39116))

(assert (not d!39076))

(assert (not b!121260))

(assert (not d!39034))

(assert (not b!121263))

(assert (not b!121485))

(assert (not b!121225))

(assert (not d!39128))

(assert (not d!39054))

(assert (not d!39012))

(assert (not d!39092))

(assert (not d!39120))

(assert (not d!39090))

(assert (not b!121488))

(assert (not b!121294))

(assert (not d!39130))

(assert (not b!121262))

(assert (not d!39124))

(assert (not d!39086))

(assert (not d!39108))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

