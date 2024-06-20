; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40178 () Bool)

(assert start!40178)

(declare-fun b!183270 () Bool)

(declare-fun e!127101 () Bool)

(declare-datatypes ((array!9746 0))(
  ( (array!9747 (arr!5227 (Array (_ BitVec 32) (_ BitVec 8))) (size!4297 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7702 0))(
  ( (BitStream!7703 (buf!4752 array!9746) (currentByte!8986 (_ BitVec 32)) (currentBit!8981 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15812 0))(
  ( (tuple2!15813 (_1!8551 BitStream!7702) (_2!8551 Bool)) )
))
(declare-fun lt!282173 () tuple2!15812)

(declare-fun lt!282176 () tuple2!15812)

(assert (=> b!183270 (= e!127101 (= (_2!8551 lt!282173) (_2!8551 lt!282176)))))

(declare-fun b!183271 () Bool)

(declare-fun res!152349 () Bool)

(declare-fun e!127094 () Bool)

(assert (=> b!183271 (=> res!152349 e!127094)))

(declare-fun lt!282168 () (_ BitVec 64))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!183271 (= res!152349 (not (= (bvand lt!282168 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!183272 () Bool)

(declare-fun e!127095 () Bool)

(assert (=> b!183272 (= e!127095 e!127094)))

(declare-fun res!152338 () Bool)

(assert (=> b!183272 (=> res!152338 e!127094)))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!183272 (= res!152338 (or (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!590)) (bvsgt (bvadd #b00000000000000000000000000000001 i!590) nBits!348)))))

(declare-datatypes ((Unit!13169 0))(
  ( (Unit!13170) )
))
(declare-datatypes ((tuple2!15814 0))(
  ( (tuple2!15815 (_1!8552 Unit!13169) (_2!8552 BitStream!7702)) )
))
(declare-fun lt!282181 () tuple2!15814)

(declare-fun lt!282169 () tuple2!15814)

(declare-fun lt!282175 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!183272 (validate_offset_bits!1 ((_ sign_extend 32) (size!4297 (buf!4752 (_2!8552 lt!282181)))) ((_ sign_extend 32) (currentByte!8986 (_2!8552 lt!282169))) ((_ sign_extend 32) (currentBit!8981 (_2!8552 lt!282169))) lt!282175)))

(declare-fun lt!282158 () Unit!13169)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7702 array!9746 (_ BitVec 64)) Unit!13169)

(assert (=> b!183272 (= lt!282158 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8552 lt!282169) (buf!4752 (_2!8552 lt!282181)) lt!282175))))

(assert (=> b!183272 (= lt!282175 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!282161 () (_ BitVec 64))

(declare-fun lt!282167 () tuple2!15812)

(declare-fun lt!282177 () (_ BitVec 64))

(assert (=> b!183272 (= lt!282168 (bvor lt!282161 (ite (_2!8551 lt!282167) lt!282177 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((tuple2!15816 0))(
  ( (tuple2!15817 (_1!8553 BitStream!7702) (_2!8553 (_ BitVec 64))) )
))
(declare-fun lt!282178 () tuple2!15816)

(declare-datatypes ((tuple2!15818 0))(
  ( (tuple2!15819 (_1!8554 BitStream!7702) (_2!8554 BitStream!7702)) )
))
(declare-fun lt!282174 () tuple2!15818)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7702 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!15816)

(assert (=> b!183272 (= lt!282178 (readNBitsLSBFirstsLoopPure!0 (_1!8554 lt!282174) nBits!348 i!590 lt!282161))))

(declare-fun thiss!1204 () BitStream!7702)

(declare-fun lt!282166 () (_ BitVec 64))

(assert (=> b!183272 (validate_offset_bits!1 ((_ sign_extend 32) (size!4297 (buf!4752 (_2!8552 lt!282181)))) ((_ sign_extend 32) (currentByte!8986 thiss!1204)) ((_ sign_extend 32) (currentBit!8981 thiss!1204)) lt!282166)))

(declare-fun lt!282170 () Unit!13169)

(assert (=> b!183272 (= lt!282170 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4752 (_2!8552 lt!282181)) lt!282166))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!183272 (= lt!282161 (bvand v!189 (onesLSBLong!0 i!590)))))

(declare-fun lt!282160 () Bool)

(assert (=> b!183272 (= (_2!8551 lt!282167) lt!282160)))

(declare-fun readBitPure!0 (BitStream!7702) tuple2!15812)

(assert (=> b!183272 (= lt!282167 (readBitPure!0 (_1!8554 lt!282174)))))

(declare-fun lt!282179 () tuple2!15818)

(declare-fun reader!0 (BitStream!7702 BitStream!7702) tuple2!15818)

(assert (=> b!183272 (= lt!282179 (reader!0 (_2!8552 lt!282169) (_2!8552 lt!282181)))))

(assert (=> b!183272 (= lt!282174 (reader!0 thiss!1204 (_2!8552 lt!282181)))))

(assert (=> b!183272 e!127101))

(declare-fun res!152339 () Bool)

(assert (=> b!183272 (=> (not res!152339) (not e!127101))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!183272 (= res!152339 (= (bitIndex!0 (size!4297 (buf!4752 (_1!8551 lt!282173))) (currentByte!8986 (_1!8551 lt!282173)) (currentBit!8981 (_1!8551 lt!282173))) (bitIndex!0 (size!4297 (buf!4752 (_1!8551 lt!282176))) (currentByte!8986 (_1!8551 lt!282176)) (currentBit!8981 (_1!8551 lt!282176)))))))

(declare-fun lt!282162 () Unit!13169)

(declare-fun lt!282180 () BitStream!7702)

(declare-fun readBitPrefixLemma!0 (BitStream!7702 BitStream!7702) Unit!13169)

(assert (=> b!183272 (= lt!282162 (readBitPrefixLemma!0 lt!282180 (_2!8552 lt!282181)))))

(assert (=> b!183272 (= lt!282176 (readBitPure!0 (BitStream!7703 (buf!4752 (_2!8552 lt!282181)) (currentByte!8986 thiss!1204) (currentBit!8981 thiss!1204))))))

(assert (=> b!183272 (= lt!282173 (readBitPure!0 lt!282180))))

(declare-fun e!127093 () Bool)

(assert (=> b!183272 e!127093))

(declare-fun res!152336 () Bool)

(assert (=> b!183272 (=> (not res!152336) (not e!127093))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!183272 (= res!152336 (invariant!0 (currentBit!8981 thiss!1204) (currentByte!8986 thiss!1204) (size!4297 (buf!4752 (_2!8552 lt!282169)))))))

(assert (=> b!183272 (= lt!282180 (BitStream!7703 (buf!4752 (_2!8552 lt!282169)) (currentByte!8986 thiss!1204) (currentBit!8981 thiss!1204)))))

(declare-fun b!183273 () Bool)

(declare-fun e!127096 () Bool)

(declare-fun array_inv!4038 (array!9746) Bool)

(assert (=> b!183273 (= e!127096 (array_inv!4038 (buf!4752 thiss!1204)))))

(declare-fun b!183274 () Bool)

(declare-fun res!152348 () Bool)

(assert (=> b!183274 (=> res!152348 e!127095)))

(declare-fun lt!282164 () (_ BitVec 64))

(declare-fun lt!282182 () (_ BitVec 64))

(assert (=> b!183274 (= res!152348 (or (not (= (size!4297 (buf!4752 (_2!8552 lt!282181))) (size!4297 (buf!4752 thiss!1204)))) (not (= lt!282182 (bvsub (bvadd lt!282164 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!183275 () Bool)

(assert (=> b!183275 (= e!127094 (= (bvand lt!282168 #b1111111111111111111111111111111111111111111111111111111111111111) lt!282168))))

(declare-fun b!183276 () Bool)

(declare-fun res!152342 () Bool)

(assert (=> b!183276 (=> res!152342 e!127095)))

(assert (=> b!183276 (= res!152342 (not (invariant!0 (currentBit!8981 (_2!8552 lt!282181)) (currentByte!8986 (_2!8552 lt!282181)) (size!4297 (buf!4752 (_2!8552 lt!282181))))))))

(declare-fun b!183277 () Bool)

(declare-fun res!152345 () Bool)

(assert (=> b!183277 (=> res!152345 e!127094)))

(assert (=> b!183277 (= res!152345 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!4297 (buf!4752 (_1!8554 lt!282179)))) ((_ sign_extend 32) (currentByte!8986 (_1!8554 lt!282179))) ((_ sign_extend 32) (currentBit!8981 (_1!8554 lt!282179))) ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))))

(declare-fun b!183278 () Bool)

(declare-fun e!127092 () Bool)

(declare-fun e!127102 () Bool)

(assert (=> b!183278 (= e!127092 e!127102)))

(declare-fun res!152346 () Bool)

(assert (=> b!183278 (=> (not res!152346) (not e!127102))))

(declare-fun lt!282163 () tuple2!15812)

(assert (=> b!183278 (= res!152346 (and (= (_2!8551 lt!282163) lt!282160) (= (_1!8551 lt!282163) (_2!8552 lt!282169))))))

(declare-fun readerFrom!0 (BitStream!7702 (_ BitVec 32) (_ BitVec 32)) BitStream!7702)

(assert (=> b!183278 (= lt!282163 (readBitPure!0 (readerFrom!0 (_2!8552 lt!282169) (currentBit!8981 thiss!1204) (currentByte!8986 thiss!1204))))))

(declare-fun b!183279 () Bool)

(declare-fun e!127098 () Bool)

(declare-fun e!127099 () Bool)

(assert (=> b!183279 (= e!127098 (not e!127099))))

(declare-fun res!152352 () Bool)

(assert (=> b!183279 (=> res!152352 e!127099)))

(declare-fun lt!282159 () (_ BitVec 64))

(assert (=> b!183279 (= res!152352 (not (= lt!282159 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!282164))))))

(assert (=> b!183279 (= lt!282159 (bitIndex!0 (size!4297 (buf!4752 (_2!8552 lt!282169))) (currentByte!8986 (_2!8552 lt!282169)) (currentBit!8981 (_2!8552 lt!282169))))))

(assert (=> b!183279 (= lt!282164 (bitIndex!0 (size!4297 (buf!4752 thiss!1204)) (currentByte!8986 thiss!1204) (currentBit!8981 thiss!1204)))))

(declare-fun e!127100 () Bool)

(assert (=> b!183279 e!127100))

(declare-fun res!152335 () Bool)

(assert (=> b!183279 (=> (not res!152335) (not e!127100))))

(assert (=> b!183279 (= res!152335 (= (size!4297 (buf!4752 thiss!1204)) (size!4297 (buf!4752 (_2!8552 lt!282169)))))))

(declare-fun appendBit!0 (BitStream!7702 Bool) tuple2!15814)

(assert (=> b!183279 (= lt!282169 (appendBit!0 thiss!1204 lt!282160))))

(assert (=> b!183279 (= lt!282160 (not (= (bvand v!189 lt!282177) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!183279 (= lt!282177 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!183280 () Bool)

(declare-fun res!152351 () Bool)

(assert (=> b!183280 (=> res!152351 e!127095)))

(declare-fun isPrefixOf!0 (BitStream!7702 BitStream!7702) Bool)

(assert (=> b!183280 (= res!152351 (not (isPrefixOf!0 (_2!8552 lt!282169) (_2!8552 lt!282181))))))

(declare-fun b!183281 () Bool)

(declare-fun res!152337 () Bool)

(assert (=> b!183281 (=> res!152337 e!127095)))

(assert (=> b!183281 (= res!152337 (not (isPrefixOf!0 thiss!1204 (_2!8552 lt!282169))))))

(declare-fun b!183282 () Bool)

(declare-fun res!152340 () Bool)

(assert (=> b!183282 (=> (not res!152340) (not e!127098))))

(assert (=> b!183282 (= res!152340 (not (= i!590 nBits!348)))))

(declare-fun res!152347 () Bool)

(declare-fun e!127091 () Bool)

(assert (=> start!40178 (=> (not res!152347) (not e!127091))))

(assert (=> start!40178 (= res!152347 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!40178 e!127091))

(assert (=> start!40178 true))

(declare-fun inv!12 (BitStream!7702) Bool)

(assert (=> start!40178 (and (inv!12 thiss!1204) e!127096)))

(declare-fun b!183269 () Bool)

(assert (=> b!183269 (= e!127100 e!127092)))

(declare-fun res!152343 () Bool)

(assert (=> b!183269 (=> (not res!152343) (not e!127092))))

(declare-fun lt!282171 () (_ BitVec 64))

(declare-fun lt!282165 () (_ BitVec 64))

(assert (=> b!183269 (= res!152343 (= lt!282171 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!282165)))))

(assert (=> b!183269 (= lt!282171 (bitIndex!0 (size!4297 (buf!4752 (_2!8552 lt!282169))) (currentByte!8986 (_2!8552 lt!282169)) (currentBit!8981 (_2!8552 lt!282169))))))

(assert (=> b!183269 (= lt!282165 (bitIndex!0 (size!4297 (buf!4752 thiss!1204)) (currentByte!8986 thiss!1204) (currentBit!8981 thiss!1204)))))

(declare-fun b!183283 () Bool)

(assert (=> b!183283 (= e!127099 e!127095)))

(declare-fun res!152350 () Bool)

(assert (=> b!183283 (=> res!152350 e!127095)))

(assert (=> b!183283 (= res!152350 (not (= lt!282182 (bvsub (bvsub (bvadd lt!282159 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!183283 (= lt!282182 (bitIndex!0 (size!4297 (buf!4752 (_2!8552 lt!282181))) (currentByte!8986 (_2!8552 lt!282181)) (currentBit!8981 (_2!8552 lt!282181))))))

(assert (=> b!183283 (isPrefixOf!0 thiss!1204 (_2!8552 lt!282181))))

(declare-fun lt!282172 () Unit!13169)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7702 BitStream!7702 BitStream!7702) Unit!13169)

(assert (=> b!183283 (= lt!282172 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8552 lt!282169) (_2!8552 lt!282181)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7702 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15814)

(assert (=> b!183283 (= lt!282181 (appendBitsLSBFirstLoopTR!0 (_2!8552 lt!282169) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!183284 () Bool)

(declare-fun res!152334 () Bool)

(assert (=> b!183284 (=> (not res!152334) (not e!127092))))

(assert (=> b!183284 (= res!152334 (isPrefixOf!0 thiss!1204 (_2!8552 lt!282169)))))

(declare-fun b!183285 () Bool)

(assert (=> b!183285 (= e!127091 e!127098)))

(declare-fun res!152341 () Bool)

(assert (=> b!183285 (=> (not res!152341) (not e!127098))))

(assert (=> b!183285 (= res!152341 (validate_offset_bits!1 ((_ sign_extend 32) (size!4297 (buf!4752 thiss!1204))) ((_ sign_extend 32) (currentByte!8986 thiss!1204)) ((_ sign_extend 32) (currentBit!8981 thiss!1204)) lt!282166))))

(assert (=> b!183285 (= lt!282166 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!183286 () Bool)

(declare-fun res!152344 () Bool)

(assert (=> b!183286 (=> (not res!152344) (not e!127098))))

(assert (=> b!183286 (= res!152344 (invariant!0 (currentBit!8981 thiss!1204) (currentByte!8986 thiss!1204) (size!4297 (buf!4752 thiss!1204))))))

(declare-fun b!183287 () Bool)

(assert (=> b!183287 (= e!127102 (= (bitIndex!0 (size!4297 (buf!4752 (_1!8551 lt!282163))) (currentByte!8986 (_1!8551 lt!282163)) (currentBit!8981 (_1!8551 lt!282163))) lt!282171))))

(declare-fun b!183288 () Bool)

(assert (=> b!183288 (= e!127093 (invariant!0 (currentBit!8981 thiss!1204) (currentByte!8986 thiss!1204) (size!4297 (buf!4752 (_2!8552 lt!282181)))))))

(assert (= (and start!40178 res!152347) b!183285))

(assert (= (and b!183285 res!152341) b!183286))

(assert (= (and b!183286 res!152344) b!183282))

(assert (= (and b!183282 res!152340) b!183279))

(assert (= (and b!183279 res!152335) b!183269))

(assert (= (and b!183269 res!152343) b!183284))

(assert (= (and b!183284 res!152334) b!183278))

(assert (= (and b!183278 res!152346) b!183287))

(assert (= (and b!183279 (not res!152352)) b!183283))

(assert (= (and b!183283 (not res!152350)) b!183276))

(assert (= (and b!183276 (not res!152342)) b!183274))

(assert (= (and b!183274 (not res!152348)) b!183280))

(assert (= (and b!183280 (not res!152351)) b!183281))

(assert (= (and b!183281 (not res!152337)) b!183272))

(assert (= (and b!183272 res!152336) b!183288))

(assert (= (and b!183272 res!152339) b!183270))

(assert (= (and b!183272 (not res!152338)) b!183277))

(assert (= (and b!183277 (not res!152345)) b!183271))

(assert (= (and b!183271 (not res!152349)) b!183275))

(assert (= start!40178 b!183273))

(declare-fun m!285163 () Bool)

(assert (=> b!183280 m!285163))

(declare-fun m!285165 () Bool)

(assert (=> start!40178 m!285165))

(declare-fun m!285167 () Bool)

(assert (=> b!183273 m!285167))

(declare-fun m!285169 () Bool)

(assert (=> b!183279 m!285169))

(declare-fun m!285171 () Bool)

(assert (=> b!183279 m!285171))

(declare-fun m!285173 () Bool)

(assert (=> b!183279 m!285173))

(declare-fun m!285175 () Bool)

(assert (=> b!183283 m!285175))

(declare-fun m!285177 () Bool)

(assert (=> b!183283 m!285177))

(declare-fun m!285179 () Bool)

(assert (=> b!183283 m!285179))

(declare-fun m!285181 () Bool)

(assert (=> b!183283 m!285181))

(declare-fun m!285183 () Bool)

(assert (=> b!183278 m!285183))

(assert (=> b!183278 m!285183))

(declare-fun m!285185 () Bool)

(assert (=> b!183278 m!285185))

(assert (=> b!183269 m!285169))

(assert (=> b!183269 m!285171))

(declare-fun m!285187 () Bool)

(assert (=> b!183286 m!285187))

(declare-fun m!285189 () Bool)

(assert (=> b!183276 m!285189))

(declare-fun m!285191 () Bool)

(assert (=> b!183284 m!285191))

(declare-fun m!285193 () Bool)

(assert (=> b!183277 m!285193))

(declare-fun m!285195 () Bool)

(assert (=> b!183285 m!285195))

(declare-fun m!285197 () Bool)

(assert (=> b!183288 m!285197))

(declare-fun m!285199 () Bool)

(assert (=> b!183272 m!285199))

(declare-fun m!285201 () Bool)

(assert (=> b!183272 m!285201))

(declare-fun m!285203 () Bool)

(assert (=> b!183272 m!285203))

(declare-fun m!285205 () Bool)

(assert (=> b!183272 m!285205))

(declare-fun m!285207 () Bool)

(assert (=> b!183272 m!285207))

(declare-fun m!285209 () Bool)

(assert (=> b!183272 m!285209))

(declare-fun m!285211 () Bool)

(assert (=> b!183272 m!285211))

(declare-fun m!285213 () Bool)

(assert (=> b!183272 m!285213))

(declare-fun m!285215 () Bool)

(assert (=> b!183272 m!285215))

(declare-fun m!285217 () Bool)

(assert (=> b!183272 m!285217))

(declare-fun m!285219 () Bool)

(assert (=> b!183272 m!285219))

(declare-fun m!285221 () Bool)

(assert (=> b!183272 m!285221))

(declare-fun m!285223 () Bool)

(assert (=> b!183272 m!285223))

(declare-fun m!285225 () Bool)

(assert (=> b!183272 m!285225))

(declare-fun m!285227 () Bool)

(assert (=> b!183272 m!285227))

(declare-fun m!285229 () Bool)

(assert (=> b!183287 m!285229))

(declare-fun m!285231 () Bool)

(assert (=> b!183271 m!285231))

(assert (=> b!183281 m!285191))

(push 1)

