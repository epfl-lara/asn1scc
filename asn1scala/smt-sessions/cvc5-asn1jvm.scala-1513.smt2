; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41918 () Bool)

(assert start!41918)

(declare-fun res!165214 () Bool)

(declare-fun e!135570 () Bool)

(assert (=> start!41918 (=> (not res!165214) (not e!135570))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!41918 (= res!165214 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!41918 e!135570))

(assert (=> start!41918 true))

(declare-datatypes ((array!10103 0))(
  ( (array!10104 (arr!5383 (Array (_ BitVec 32) (_ BitVec 8))) (size!4453 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8014 0))(
  ( (BitStream!8015 (buf!4939 array!10103) (currentByte!9277 (_ BitVec 32)) (currentBit!9272 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8014)

(declare-fun e!135573 () Bool)

(declare-fun inv!12 (BitStream!8014) Bool)

(assert (=> start!41918 (and (inv!12 thiss!1204) e!135573)))

(declare-datatypes ((tuple2!17072 0))(
  ( (tuple2!17073 (_1!9181 BitStream!8014) (_2!9181 BitStream!8014)) )
))
(declare-fun lt!307232 () tuple2!17072)

(declare-fun lt!307227 () (_ BitVec 64))

(declare-fun e!135565 () Bool)

(declare-datatypes ((tuple2!17074 0))(
  ( (tuple2!17075 (_1!9182 BitStream!8014) (_2!9182 Bool)) )
))
(declare-fun lt!307223 () tuple2!17074)

(declare-fun b!197392 () Bool)

(declare-fun lt!307237 () (_ BitVec 64))

(declare-datatypes ((tuple2!17076 0))(
  ( (tuple2!17077 (_1!9183 BitStream!8014) (_2!9183 (_ BitVec 64))) )
))
(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8014 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17076)

(assert (=> b!197392 (= e!135565 (= (_1!9183 (readNBitsLSBFirstsLoopPure!0 (_1!9181 lt!307232) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvor lt!307227 (ite (_2!9182 lt!307223) lt!307237 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9181 lt!307232)))))

(declare-datatypes ((Unit!13971 0))(
  ( (Unit!13972) )
))
(declare-datatypes ((tuple2!17078 0))(
  ( (tuple2!17079 (_1!9184 Unit!13971) (_2!9184 BitStream!8014)) )
))
(declare-fun lt!307233 () tuple2!17078)

(declare-fun lt!307215 () tuple2!17078)

(declare-fun lt!307228 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!197392 (validate_offset_bits!1 ((_ sign_extend 32) (size!4453 (buf!4939 (_2!9184 lt!307233)))) ((_ sign_extend 32) (currentByte!9277 (_2!9184 lt!307215))) ((_ sign_extend 32) (currentBit!9272 (_2!9184 lt!307215))) lt!307228)))

(declare-fun lt!307231 () Unit!13971)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8014 array!10103 (_ BitVec 64)) Unit!13971)

(assert (=> b!197392 (= lt!307231 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9184 lt!307215) (buf!4939 (_2!9184 lt!307233)) lt!307228))))

(assert (=> b!197392 (= lt!307228 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!307225 () tuple2!17076)

(declare-fun lt!307220 () tuple2!17072)

(assert (=> b!197392 (= lt!307225 (readNBitsLSBFirstsLoopPure!0 (_1!9181 lt!307220) nBits!348 i!590 lt!307227))))

(declare-fun lt!307229 () (_ BitVec 64))

(assert (=> b!197392 (validate_offset_bits!1 ((_ sign_extend 32) (size!4453 (buf!4939 (_2!9184 lt!307233)))) ((_ sign_extend 32) (currentByte!9277 thiss!1204)) ((_ sign_extend 32) (currentBit!9272 thiss!1204)) lt!307229)))

(declare-fun lt!307216 () Unit!13971)

(assert (=> b!197392 (= lt!307216 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4939 (_2!9184 lt!307233)) lt!307229))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!197392 (= lt!307227 (bvand v!189 (onesLSBLong!0 i!590)))))

(declare-fun lt!307221 () Bool)

(assert (=> b!197392 (= (_2!9182 lt!307223) lt!307221)))

(declare-fun readBitPure!0 (BitStream!8014) tuple2!17074)

(assert (=> b!197392 (= lt!307223 (readBitPure!0 (_1!9181 lt!307220)))))

(declare-fun reader!0 (BitStream!8014 BitStream!8014) tuple2!17072)

(assert (=> b!197392 (= lt!307232 (reader!0 (_2!9184 lt!307215) (_2!9184 lt!307233)))))

(assert (=> b!197392 (= lt!307220 (reader!0 thiss!1204 (_2!9184 lt!307233)))))

(declare-fun e!135575 () Bool)

(assert (=> b!197392 e!135575))

(declare-fun res!165211 () Bool)

(assert (=> b!197392 (=> (not res!165211) (not e!135575))))

(declare-fun lt!307230 () tuple2!17074)

(declare-fun lt!307236 () tuple2!17074)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!197392 (= res!165211 (= (bitIndex!0 (size!4453 (buf!4939 (_1!9182 lt!307230))) (currentByte!9277 (_1!9182 lt!307230)) (currentBit!9272 (_1!9182 lt!307230))) (bitIndex!0 (size!4453 (buf!4939 (_1!9182 lt!307236))) (currentByte!9277 (_1!9182 lt!307236)) (currentBit!9272 (_1!9182 lt!307236)))))))

(declare-fun lt!307234 () Unit!13971)

(declare-fun lt!307219 () BitStream!8014)

(declare-fun readBitPrefixLemma!0 (BitStream!8014 BitStream!8014) Unit!13971)

(assert (=> b!197392 (= lt!307234 (readBitPrefixLemma!0 lt!307219 (_2!9184 lt!307233)))))

(assert (=> b!197392 (= lt!307236 (readBitPure!0 (BitStream!8015 (buf!4939 (_2!9184 lt!307233)) (currentByte!9277 thiss!1204) (currentBit!9272 thiss!1204))))))

(assert (=> b!197392 (= lt!307230 (readBitPure!0 lt!307219))))

(declare-fun e!135567 () Bool)

(assert (=> b!197392 e!135567))

(declare-fun res!165225 () Bool)

(assert (=> b!197392 (=> (not res!165225) (not e!135567))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!197392 (= res!165225 (invariant!0 (currentBit!9272 thiss!1204) (currentByte!9277 thiss!1204) (size!4453 (buf!4939 (_2!9184 lt!307215)))))))

(assert (=> b!197392 (= lt!307219 (BitStream!8015 (buf!4939 (_2!9184 lt!307215)) (currentByte!9277 thiss!1204) (currentBit!9272 thiss!1204)))))

(declare-fun b!197393 () Bool)

(declare-fun res!165220 () Bool)

(declare-fun e!135572 () Bool)

(assert (=> b!197393 (=> (not res!165220) (not e!135572))))

(assert (=> b!197393 (= res!165220 (invariant!0 (currentBit!9272 thiss!1204) (currentByte!9277 thiss!1204) (size!4453 (buf!4939 thiss!1204))))))

(declare-fun b!197394 () Bool)

(declare-fun array_inv!4194 (array!10103) Bool)

(assert (=> b!197394 (= e!135573 (array_inv!4194 (buf!4939 thiss!1204)))))

(declare-fun b!197395 () Bool)

(declare-fun e!135566 () Bool)

(declare-fun e!135568 () Bool)

(assert (=> b!197395 (= e!135566 e!135568)))

(declare-fun res!165212 () Bool)

(assert (=> b!197395 (=> (not res!165212) (not e!135568))))

(declare-fun lt!307217 () (_ BitVec 64))

(declare-fun lt!307226 () (_ BitVec 64))

(assert (=> b!197395 (= res!165212 (= lt!307217 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!307226)))))

(assert (=> b!197395 (= lt!307217 (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307215))) (currentByte!9277 (_2!9184 lt!307215)) (currentBit!9272 (_2!9184 lt!307215))))))

(assert (=> b!197395 (= lt!307226 (bitIndex!0 (size!4453 (buf!4939 thiss!1204)) (currentByte!9277 thiss!1204) (currentBit!9272 thiss!1204)))))

(declare-fun b!197396 () Bool)

(declare-fun res!165217 () Bool)

(assert (=> b!197396 (=> (not res!165217) (not e!135568))))

(declare-fun isPrefixOf!0 (BitStream!8014 BitStream!8014) Bool)

(assert (=> b!197396 (= res!165217 (isPrefixOf!0 thiss!1204 (_2!9184 lt!307215)))))

(declare-fun b!197397 () Bool)

(assert (=> b!197397 (= e!135575 (= (_2!9182 lt!307230) (_2!9182 lt!307236)))))

(declare-fun b!197398 () Bool)

(declare-fun e!135571 () Bool)

(assert (=> b!197398 (= e!135572 (not e!135571))))

(declare-fun res!165224 () Bool)

(assert (=> b!197398 (=> res!165224 e!135571)))

(declare-fun lt!307224 () (_ BitVec 64))

(declare-fun lt!307235 () (_ BitVec 64))

(assert (=> b!197398 (= res!165224 (not (= lt!307224 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!307235))))))

(assert (=> b!197398 (= lt!307224 (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307215))) (currentByte!9277 (_2!9184 lt!307215)) (currentBit!9272 (_2!9184 lt!307215))))))

(assert (=> b!197398 (= lt!307235 (bitIndex!0 (size!4453 (buf!4939 thiss!1204)) (currentByte!9277 thiss!1204) (currentBit!9272 thiss!1204)))))

(assert (=> b!197398 e!135566))

(declare-fun res!165222 () Bool)

(assert (=> b!197398 (=> (not res!165222) (not e!135566))))

(assert (=> b!197398 (= res!165222 (= (size!4453 (buf!4939 thiss!1204)) (size!4453 (buf!4939 (_2!9184 lt!307215)))))))

(declare-fun appendBit!0 (BitStream!8014 Bool) tuple2!17078)

(assert (=> b!197398 (= lt!307215 (appendBit!0 thiss!1204 lt!307221))))

(assert (=> b!197398 (= lt!307221 (not (= (bvand v!189 lt!307237) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!197398 (= lt!307237 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!197399 () Bool)

(declare-fun e!135569 () Bool)

(assert (=> b!197399 (= e!135568 e!135569)))

(declare-fun res!165223 () Bool)

(assert (=> b!197399 (=> (not res!165223) (not e!135569))))

(declare-fun lt!307222 () tuple2!17074)

(assert (=> b!197399 (= res!165223 (and (= (_2!9182 lt!307222) lt!307221) (= (_1!9182 lt!307222) (_2!9184 lt!307215))))))

(declare-fun readerFrom!0 (BitStream!8014 (_ BitVec 32) (_ BitVec 32)) BitStream!8014)

(assert (=> b!197399 (= lt!307222 (readBitPure!0 (readerFrom!0 (_2!9184 lt!307215) (currentBit!9272 thiss!1204) (currentByte!9277 thiss!1204))))))

(declare-fun b!197400 () Bool)

(declare-fun res!165216 () Bool)

(assert (=> b!197400 (=> res!165216 e!135565)))

(assert (=> b!197400 (= res!165216 (not (isPrefixOf!0 (_2!9184 lt!307215) (_2!9184 lt!307233))))))

(declare-fun b!197401 () Bool)

(declare-fun res!165215 () Bool)

(assert (=> b!197401 (=> res!165215 e!135565)))

(assert (=> b!197401 (= res!165215 (not (isPrefixOf!0 thiss!1204 (_2!9184 lt!307215))))))

(declare-fun b!197402 () Bool)

(assert (=> b!197402 (= e!135569 (= (bitIndex!0 (size!4453 (buf!4939 (_1!9182 lt!307222))) (currentByte!9277 (_1!9182 lt!307222)) (currentBit!9272 (_1!9182 lt!307222))) lt!307217))))

(declare-fun b!197403 () Bool)

(declare-fun res!165218 () Bool)

(assert (=> b!197403 (=> res!165218 e!135565)))

(assert (=> b!197403 (= res!165218 (not (invariant!0 (currentBit!9272 (_2!9184 lt!307233)) (currentByte!9277 (_2!9184 lt!307233)) (size!4453 (buf!4939 (_2!9184 lt!307233))))))))

(declare-fun b!197404 () Bool)

(declare-fun res!165219 () Bool)

(assert (=> b!197404 (=> (not res!165219) (not e!135572))))

(assert (=> b!197404 (= res!165219 (not (= i!590 nBits!348)))))

(declare-fun b!197405 () Bool)

(assert (=> b!197405 (= e!135570 e!135572)))

(declare-fun res!165221 () Bool)

(assert (=> b!197405 (=> (not res!165221) (not e!135572))))

(assert (=> b!197405 (= res!165221 (validate_offset_bits!1 ((_ sign_extend 32) (size!4453 (buf!4939 thiss!1204))) ((_ sign_extend 32) (currentByte!9277 thiss!1204)) ((_ sign_extend 32) (currentBit!9272 thiss!1204)) lt!307229))))

(assert (=> b!197405 (= lt!307229 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!197406 () Bool)

(declare-fun res!165210 () Bool)

(assert (=> b!197406 (=> res!165210 e!135565)))

(declare-fun lt!307218 () (_ BitVec 64))

(assert (=> b!197406 (= res!165210 (or (not (= (size!4453 (buf!4939 (_2!9184 lt!307233))) (size!4453 (buf!4939 thiss!1204)))) (not (= lt!307218 (bvsub (bvadd lt!307235 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!197407 () Bool)

(assert (=> b!197407 (= e!135571 e!135565)))

(declare-fun res!165213 () Bool)

(assert (=> b!197407 (=> res!165213 e!135565)))

(assert (=> b!197407 (= res!165213 (not (= lt!307218 (bvsub (bvsub (bvadd lt!307224 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!197407 (= lt!307218 (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307233))) (currentByte!9277 (_2!9184 lt!307233)) (currentBit!9272 (_2!9184 lt!307233))))))

(assert (=> b!197407 (isPrefixOf!0 thiss!1204 (_2!9184 lt!307233))))

(declare-fun lt!307214 () Unit!13971)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8014 BitStream!8014 BitStream!8014) Unit!13971)

(assert (=> b!197407 (= lt!307214 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9184 lt!307215) (_2!9184 lt!307233)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8014 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17078)

(assert (=> b!197407 (= lt!307233 (appendBitsLSBFirstLoopTR!0 (_2!9184 lt!307215) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!197408 () Bool)

(assert (=> b!197408 (= e!135567 (invariant!0 (currentBit!9272 thiss!1204) (currentByte!9277 thiss!1204) (size!4453 (buf!4939 (_2!9184 lt!307233)))))))

(assert (= (and start!41918 res!165214) b!197405))

(assert (= (and b!197405 res!165221) b!197393))

(assert (= (and b!197393 res!165220) b!197404))

(assert (= (and b!197404 res!165219) b!197398))

(assert (= (and b!197398 res!165222) b!197395))

(assert (= (and b!197395 res!165212) b!197396))

(assert (= (and b!197396 res!165217) b!197399))

(assert (= (and b!197399 res!165223) b!197402))

(assert (= (and b!197398 (not res!165224)) b!197407))

(assert (= (and b!197407 (not res!165213)) b!197403))

(assert (= (and b!197403 (not res!165218)) b!197406))

(assert (= (and b!197406 (not res!165210)) b!197400))

(assert (= (and b!197400 (not res!165216)) b!197401))

(assert (= (and b!197401 (not res!165215)) b!197392))

(assert (= (and b!197392 res!165225) b!197408))

(assert (= (and b!197392 res!165211) b!197397))

(assert (= start!41918 b!197394))

(declare-fun m!304979 () Bool)

(assert (=> b!197393 m!304979))

(declare-fun m!304981 () Bool)

(assert (=> b!197402 m!304981))

(declare-fun m!304983 () Bool)

(assert (=> b!197407 m!304983))

(declare-fun m!304985 () Bool)

(assert (=> b!197407 m!304985))

(declare-fun m!304987 () Bool)

(assert (=> b!197407 m!304987))

(declare-fun m!304989 () Bool)

(assert (=> b!197407 m!304989))

(declare-fun m!304991 () Bool)

(assert (=> b!197408 m!304991))

(declare-fun m!304993 () Bool)

(assert (=> b!197400 m!304993))

(declare-fun m!304995 () Bool)

(assert (=> b!197396 m!304995))

(declare-fun m!304997 () Bool)

(assert (=> b!197394 m!304997))

(declare-fun m!304999 () Bool)

(assert (=> b!197398 m!304999))

(declare-fun m!305001 () Bool)

(assert (=> b!197398 m!305001))

(declare-fun m!305003 () Bool)

(assert (=> b!197398 m!305003))

(declare-fun m!305005 () Bool)

(assert (=> b!197405 m!305005))

(declare-fun m!305007 () Bool)

(assert (=> b!197399 m!305007))

(assert (=> b!197399 m!305007))

(declare-fun m!305009 () Bool)

(assert (=> b!197399 m!305009))

(assert (=> b!197401 m!304995))

(declare-fun m!305011 () Bool)

(assert (=> b!197392 m!305011))

(declare-fun m!305013 () Bool)

(assert (=> b!197392 m!305013))

(declare-fun m!305015 () Bool)

(assert (=> b!197392 m!305015))

(declare-fun m!305017 () Bool)

(assert (=> b!197392 m!305017))

(declare-fun m!305019 () Bool)

(assert (=> b!197392 m!305019))

(declare-fun m!305021 () Bool)

(assert (=> b!197392 m!305021))

(declare-fun m!305023 () Bool)

(assert (=> b!197392 m!305023))

(declare-fun m!305025 () Bool)

(assert (=> b!197392 m!305025))

(declare-fun m!305027 () Bool)

(assert (=> b!197392 m!305027))

(declare-fun m!305029 () Bool)

(assert (=> b!197392 m!305029))

(declare-fun m!305031 () Bool)

(assert (=> b!197392 m!305031))

(declare-fun m!305033 () Bool)

(assert (=> b!197392 m!305033))

(declare-fun m!305035 () Bool)

(assert (=> b!197392 m!305035))

(declare-fun m!305037 () Bool)

(assert (=> b!197392 m!305037))

(declare-fun m!305039 () Bool)

(assert (=> b!197392 m!305039))

(declare-fun m!305041 () Bool)

(assert (=> b!197392 m!305041))

(declare-fun m!305043 () Bool)

(assert (=> start!41918 m!305043))

(declare-fun m!305045 () Bool)

(assert (=> b!197403 m!305045))

(assert (=> b!197395 m!304999))

(assert (=> b!197395 m!305001))

(push 1)

(assert (not b!197400))

(assert (not b!197392))

(assert (not b!197403))

(assert (not b!197393))

(assert (not b!197405))

(assert (not b!197399))

(assert (not b!197398))

(assert (not b!197402))

(assert (not start!41918))

(assert (not b!197396))

(assert (not b!197395))

(assert (not b!197394))

(assert (not b!197408))

(assert (not b!197407))

(assert (not b!197401))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!66651 () Bool)

(declare-fun res!165328 () Bool)

(declare-fun e!135646 () Bool)

(assert (=> d!66651 (=> (not res!165328) (not e!135646))))

(assert (=> d!66651 (= res!165328 (= (size!4453 (buf!4939 thiss!1204)) (size!4453 (buf!4939 (_2!9184 lt!307215)))))))

(assert (=> d!66651 (= (isPrefixOf!0 thiss!1204 (_2!9184 lt!307215)) e!135646)))

(declare-fun b!197517 () Bool)

(declare-fun res!165329 () Bool)

(assert (=> b!197517 (=> (not res!165329) (not e!135646))))

(assert (=> b!197517 (= res!165329 (bvsle (bitIndex!0 (size!4453 (buf!4939 thiss!1204)) (currentByte!9277 thiss!1204) (currentBit!9272 thiss!1204)) (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307215))) (currentByte!9277 (_2!9184 lt!307215)) (currentBit!9272 (_2!9184 lt!307215)))))))

(declare-fun b!197518 () Bool)

(declare-fun e!135647 () Bool)

(assert (=> b!197518 (= e!135646 e!135647)))

(declare-fun res!165330 () Bool)

(assert (=> b!197518 (=> res!165330 e!135647)))

(assert (=> b!197518 (= res!165330 (= (size!4453 (buf!4939 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!197519 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10103 array!10103 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!197519 (= e!135647 (arrayBitRangesEq!0 (buf!4939 thiss!1204) (buf!4939 (_2!9184 lt!307215)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4453 (buf!4939 thiss!1204)) (currentByte!9277 thiss!1204) (currentBit!9272 thiss!1204))))))

(assert (= (and d!66651 res!165328) b!197517))

(assert (= (and b!197517 res!165329) b!197518))

(assert (= (and b!197518 (not res!165330)) b!197519))

(assert (=> b!197517 m!305001))

(assert (=> b!197517 m!304999))

(assert (=> b!197519 m!305001))

(assert (=> b!197519 m!305001))

(declare-fun m!305183 () Bool)

(assert (=> b!197519 m!305183))

(assert (=> b!197401 d!66651))

(declare-fun d!66653 () Bool)

(declare-fun res!165331 () Bool)

(declare-fun e!135648 () Bool)

(assert (=> d!66653 (=> (not res!165331) (not e!135648))))

(assert (=> d!66653 (= res!165331 (= (size!4453 (buf!4939 (_2!9184 lt!307215))) (size!4453 (buf!4939 (_2!9184 lt!307233)))))))

(assert (=> d!66653 (= (isPrefixOf!0 (_2!9184 lt!307215) (_2!9184 lt!307233)) e!135648)))

(declare-fun b!197520 () Bool)

(declare-fun res!165332 () Bool)

(assert (=> b!197520 (=> (not res!165332) (not e!135648))))

(assert (=> b!197520 (= res!165332 (bvsle (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307215))) (currentByte!9277 (_2!9184 lt!307215)) (currentBit!9272 (_2!9184 lt!307215))) (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307233))) (currentByte!9277 (_2!9184 lt!307233)) (currentBit!9272 (_2!9184 lt!307233)))))))

(declare-fun b!197521 () Bool)

(declare-fun e!135649 () Bool)

(assert (=> b!197521 (= e!135648 e!135649)))

(declare-fun res!165333 () Bool)

(assert (=> b!197521 (=> res!165333 e!135649)))

(assert (=> b!197521 (= res!165333 (= (size!4453 (buf!4939 (_2!9184 lt!307215))) #b00000000000000000000000000000000))))

(declare-fun b!197522 () Bool)

(assert (=> b!197522 (= e!135649 (arrayBitRangesEq!0 (buf!4939 (_2!9184 lt!307215)) (buf!4939 (_2!9184 lt!307233)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307215))) (currentByte!9277 (_2!9184 lt!307215)) (currentBit!9272 (_2!9184 lt!307215)))))))

(assert (= (and d!66653 res!165331) b!197520))

(assert (= (and b!197520 res!165332) b!197521))

(assert (= (and b!197521 (not res!165333)) b!197522))

(assert (=> b!197520 m!304999))

(assert (=> b!197520 m!304983))

(assert (=> b!197522 m!304999))

(assert (=> b!197522 m!304999))

(declare-fun m!305185 () Bool)

(assert (=> b!197522 m!305185))

(assert (=> b!197400 d!66653))

(declare-fun d!66655 () Bool)

(declare-datatypes ((tuple2!17096 0))(
  ( (tuple2!17097 (_1!9193 Bool) (_2!9193 BitStream!8014)) )
))
(declare-fun lt!307384 () tuple2!17096)

(declare-fun readBit!0 (BitStream!8014) tuple2!17096)

(assert (=> d!66655 (= lt!307384 (readBit!0 (readerFrom!0 (_2!9184 lt!307215) (currentBit!9272 thiss!1204) (currentByte!9277 thiss!1204))))))

(assert (=> d!66655 (= (readBitPure!0 (readerFrom!0 (_2!9184 lt!307215) (currentBit!9272 thiss!1204) (currentByte!9277 thiss!1204))) (tuple2!17075 (_2!9193 lt!307384) (_1!9193 lt!307384)))))

(declare-fun bs!16548 () Bool)

(assert (= bs!16548 d!66655))

(assert (=> bs!16548 m!305007))

(declare-fun m!305187 () Bool)

(assert (=> bs!16548 m!305187))

(assert (=> b!197399 d!66655))

(declare-fun d!66657 () Bool)

(declare-fun e!135652 () Bool)

(assert (=> d!66657 e!135652))

(declare-fun res!165337 () Bool)

(assert (=> d!66657 (=> (not res!165337) (not e!135652))))

(assert (=> d!66657 (= res!165337 (invariant!0 (currentBit!9272 (_2!9184 lt!307215)) (currentByte!9277 (_2!9184 lt!307215)) (size!4453 (buf!4939 (_2!9184 lt!307215)))))))

(assert (=> d!66657 (= (readerFrom!0 (_2!9184 lt!307215) (currentBit!9272 thiss!1204) (currentByte!9277 thiss!1204)) (BitStream!8015 (buf!4939 (_2!9184 lt!307215)) (currentByte!9277 thiss!1204) (currentBit!9272 thiss!1204)))))

(declare-fun b!197525 () Bool)

(assert (=> b!197525 (= e!135652 (invariant!0 (currentBit!9272 thiss!1204) (currentByte!9277 thiss!1204) (size!4453 (buf!4939 (_2!9184 lt!307215)))))))

(assert (= (and d!66657 res!165337) b!197525))

(declare-fun m!305189 () Bool)

(assert (=> d!66657 m!305189))

(assert (=> b!197525 m!305021))

(assert (=> b!197399 d!66657))

(declare-fun d!66659 () Bool)

(declare-fun e!135655 () Bool)

(assert (=> d!66659 e!135655))

(declare-fun res!165342 () Bool)

(assert (=> d!66659 (=> (not res!165342) (not e!135655))))

(declare-fun lt!307400 () (_ BitVec 64))

(declare-fun lt!307397 () (_ BitVec 64))

(declare-fun lt!307399 () (_ BitVec 64))

(assert (=> d!66659 (= res!165342 (= lt!307397 (bvsub lt!307400 lt!307399)))))

(assert (=> d!66659 (or (= (bvand lt!307400 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!307399 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!307400 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!307400 lt!307399) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!66659 (= lt!307399 (remainingBits!0 ((_ sign_extend 32) (size!4453 (buf!4939 (_2!9184 lt!307215)))) ((_ sign_extend 32) (currentByte!9277 (_2!9184 lt!307215))) ((_ sign_extend 32) (currentBit!9272 (_2!9184 lt!307215)))))))

(declare-fun lt!307398 () (_ BitVec 64))

(declare-fun lt!307402 () (_ BitVec 64))

(assert (=> d!66659 (= lt!307400 (bvmul lt!307398 lt!307402))))

(assert (=> d!66659 (or (= lt!307398 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!307402 (bvsdiv (bvmul lt!307398 lt!307402) lt!307398)))))

(assert (=> d!66659 (= lt!307402 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66659 (= lt!307398 ((_ sign_extend 32) (size!4453 (buf!4939 (_2!9184 lt!307215)))))))

(assert (=> d!66659 (= lt!307397 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9277 (_2!9184 lt!307215))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9272 (_2!9184 lt!307215)))))))

(assert (=> d!66659 (invariant!0 (currentBit!9272 (_2!9184 lt!307215)) (currentByte!9277 (_2!9184 lt!307215)) (size!4453 (buf!4939 (_2!9184 lt!307215))))))

(assert (=> d!66659 (= (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307215))) (currentByte!9277 (_2!9184 lt!307215)) (currentBit!9272 (_2!9184 lt!307215))) lt!307397)))

(declare-fun b!197530 () Bool)

(declare-fun res!165343 () Bool)

(assert (=> b!197530 (=> (not res!165343) (not e!135655))))

(assert (=> b!197530 (= res!165343 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!307397))))

(declare-fun b!197531 () Bool)

(declare-fun lt!307401 () (_ BitVec 64))

(assert (=> b!197531 (= e!135655 (bvsle lt!307397 (bvmul lt!307401 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!197531 (or (= lt!307401 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!307401 #b0000000000000000000000000000000000000000000000000000000000001000) lt!307401)))))

(assert (=> b!197531 (= lt!307401 ((_ sign_extend 32) (size!4453 (buf!4939 (_2!9184 lt!307215)))))))

(assert (= (and d!66659 res!165342) b!197530))

(assert (= (and b!197530 res!165343) b!197531))

(declare-fun m!305191 () Bool)

(assert (=> d!66659 m!305191))

(assert (=> d!66659 m!305189))

(assert (=> b!197398 d!66659))

(declare-fun d!66661 () Bool)

(declare-fun e!135656 () Bool)

(assert (=> d!66661 e!135656))

(declare-fun res!165344 () Bool)

(assert (=> d!66661 (=> (not res!165344) (not e!135656))))

(declare-fun lt!307405 () (_ BitVec 64))

(declare-fun lt!307406 () (_ BitVec 64))

(declare-fun lt!307403 () (_ BitVec 64))

(assert (=> d!66661 (= res!165344 (= lt!307403 (bvsub lt!307406 lt!307405)))))

(assert (=> d!66661 (or (= (bvand lt!307406 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!307405 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!307406 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!307406 lt!307405) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66661 (= lt!307405 (remainingBits!0 ((_ sign_extend 32) (size!4453 (buf!4939 thiss!1204))) ((_ sign_extend 32) (currentByte!9277 thiss!1204)) ((_ sign_extend 32) (currentBit!9272 thiss!1204))))))

(declare-fun lt!307404 () (_ BitVec 64))

(declare-fun lt!307408 () (_ BitVec 64))

(assert (=> d!66661 (= lt!307406 (bvmul lt!307404 lt!307408))))

(assert (=> d!66661 (or (= lt!307404 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!307408 (bvsdiv (bvmul lt!307404 lt!307408) lt!307404)))))

(assert (=> d!66661 (= lt!307408 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66661 (= lt!307404 ((_ sign_extend 32) (size!4453 (buf!4939 thiss!1204))))))

(assert (=> d!66661 (= lt!307403 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9277 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9272 thiss!1204))))))

(assert (=> d!66661 (invariant!0 (currentBit!9272 thiss!1204) (currentByte!9277 thiss!1204) (size!4453 (buf!4939 thiss!1204)))))

(assert (=> d!66661 (= (bitIndex!0 (size!4453 (buf!4939 thiss!1204)) (currentByte!9277 thiss!1204) (currentBit!9272 thiss!1204)) lt!307403)))

(declare-fun b!197532 () Bool)

(declare-fun res!165345 () Bool)

(assert (=> b!197532 (=> (not res!165345) (not e!135656))))

(assert (=> b!197532 (= res!165345 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!307403))))

(declare-fun b!197533 () Bool)

(declare-fun lt!307407 () (_ BitVec 64))

(assert (=> b!197533 (= e!135656 (bvsle lt!307403 (bvmul lt!307407 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!197533 (or (= lt!307407 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!307407 #b0000000000000000000000000000000000000000000000000000000000001000) lt!307407)))))

(assert (=> b!197533 (= lt!307407 ((_ sign_extend 32) (size!4453 (buf!4939 thiss!1204))))))

(assert (= (and d!66661 res!165344) b!197532))

(assert (= (and b!197532 res!165345) b!197533))

(declare-fun m!305193 () Bool)

(assert (=> d!66661 m!305193))

(assert (=> d!66661 m!304979))

(assert (=> b!197398 d!66661))

(declare-fun b!197545 () Bool)

(declare-fun e!135661 () Bool)

(declare-fun e!135662 () Bool)

(assert (=> b!197545 (= e!135661 e!135662)))

(declare-fun res!165355 () Bool)

(assert (=> b!197545 (=> (not res!165355) (not e!135662))))

(declare-fun lt!307420 () tuple2!17074)

(declare-fun lt!307417 () tuple2!17078)

(assert (=> b!197545 (= res!165355 (and (= (_2!9182 lt!307420) lt!307221) (= (_1!9182 lt!307420) (_2!9184 lt!307417))))))

(assert (=> b!197545 (= lt!307420 (readBitPure!0 (readerFrom!0 (_2!9184 lt!307417) (currentBit!9272 thiss!1204) (currentByte!9277 thiss!1204))))))

(declare-fun b!197543 () Bool)

(declare-fun res!165356 () Bool)

(assert (=> b!197543 (=> (not res!165356) (not e!135661))))

(declare-fun lt!307418 () (_ BitVec 64))

(declare-fun lt!307419 () (_ BitVec 64))

(assert (=> b!197543 (= res!165356 (= (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307417))) (currentByte!9277 (_2!9184 lt!307417)) (currentBit!9272 (_2!9184 lt!307417))) (bvadd lt!307419 lt!307418)))))

(assert (=> b!197543 (or (not (= (bvand lt!307419 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!307418 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!307419 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!307419 lt!307418) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!197543 (= lt!307418 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!197543 (= lt!307419 (bitIndex!0 (size!4453 (buf!4939 thiss!1204)) (currentByte!9277 thiss!1204) (currentBit!9272 thiss!1204)))))

(declare-fun d!66663 () Bool)

(assert (=> d!66663 e!135661))

(declare-fun res!165357 () Bool)

(assert (=> d!66663 (=> (not res!165357) (not e!135661))))

(assert (=> d!66663 (= res!165357 (= (size!4453 (buf!4939 thiss!1204)) (size!4453 (buf!4939 (_2!9184 lt!307417)))))))

(declare-fun choose!16 (BitStream!8014 Bool) tuple2!17078)

(assert (=> d!66663 (= lt!307417 (choose!16 thiss!1204 lt!307221))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!66663 (validate_offset_bit!0 ((_ sign_extend 32) (size!4453 (buf!4939 thiss!1204))) ((_ sign_extend 32) (currentByte!9277 thiss!1204)) ((_ sign_extend 32) (currentBit!9272 thiss!1204)))))

(assert (=> d!66663 (= (appendBit!0 thiss!1204 lt!307221) lt!307417)))

(declare-fun b!197546 () Bool)

(assert (=> b!197546 (= e!135662 (= (bitIndex!0 (size!4453 (buf!4939 (_1!9182 lt!307420))) (currentByte!9277 (_1!9182 lt!307420)) (currentBit!9272 (_1!9182 lt!307420))) (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307417))) (currentByte!9277 (_2!9184 lt!307417)) (currentBit!9272 (_2!9184 lt!307417)))))))

(declare-fun b!197544 () Bool)

(declare-fun res!165354 () Bool)

(assert (=> b!197544 (=> (not res!165354) (not e!135661))))

(assert (=> b!197544 (= res!165354 (isPrefixOf!0 thiss!1204 (_2!9184 lt!307417)))))

(assert (= (and d!66663 res!165357) b!197543))

(assert (= (and b!197543 res!165356) b!197544))

(assert (= (and b!197544 res!165354) b!197545))

(assert (= (and b!197545 res!165355) b!197546))

(declare-fun m!305197 () Bool)

(assert (=> b!197545 m!305197))

(assert (=> b!197545 m!305197))

(declare-fun m!305199 () Bool)

(assert (=> b!197545 m!305199))

(declare-fun m!305201 () Bool)

(assert (=> b!197544 m!305201))

(declare-fun m!305203 () Bool)

(assert (=> b!197546 m!305203))

(declare-fun m!305205 () Bool)

(assert (=> b!197546 m!305205))

(declare-fun m!305207 () Bool)

(assert (=> d!66663 m!305207))

(declare-fun m!305209 () Bool)

(assert (=> d!66663 m!305209))

(assert (=> b!197543 m!305205))

(assert (=> b!197543 m!305001))

(assert (=> b!197398 d!66663))

(declare-fun d!66669 () Bool)

(assert (=> d!66669 (= (invariant!0 (currentBit!9272 thiss!1204) (currentByte!9277 thiss!1204) (size!4453 (buf!4939 (_2!9184 lt!307233)))) (and (bvsge (currentBit!9272 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9272 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9277 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9277 thiss!1204) (size!4453 (buf!4939 (_2!9184 lt!307233)))) (and (= (currentBit!9272 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9277 thiss!1204) (size!4453 (buf!4939 (_2!9184 lt!307233))))))))))

(assert (=> b!197408 d!66669))

(declare-fun d!66671 () Bool)

(declare-fun e!135663 () Bool)

(assert (=> d!66671 e!135663))

(declare-fun res!165358 () Bool)

(assert (=> d!66671 (=> (not res!165358) (not e!135663))))

(declare-fun lt!307421 () (_ BitVec 64))

(declare-fun lt!307424 () (_ BitVec 64))

(declare-fun lt!307423 () (_ BitVec 64))

(assert (=> d!66671 (= res!165358 (= lt!307421 (bvsub lt!307424 lt!307423)))))

(assert (=> d!66671 (or (= (bvand lt!307424 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!307423 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!307424 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!307424 lt!307423) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66671 (= lt!307423 (remainingBits!0 ((_ sign_extend 32) (size!4453 (buf!4939 (_2!9184 lt!307233)))) ((_ sign_extend 32) (currentByte!9277 (_2!9184 lt!307233))) ((_ sign_extend 32) (currentBit!9272 (_2!9184 lt!307233)))))))

(declare-fun lt!307422 () (_ BitVec 64))

(declare-fun lt!307426 () (_ BitVec 64))

(assert (=> d!66671 (= lt!307424 (bvmul lt!307422 lt!307426))))

(assert (=> d!66671 (or (= lt!307422 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!307426 (bvsdiv (bvmul lt!307422 lt!307426) lt!307422)))))

(assert (=> d!66671 (= lt!307426 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66671 (= lt!307422 ((_ sign_extend 32) (size!4453 (buf!4939 (_2!9184 lt!307233)))))))

(assert (=> d!66671 (= lt!307421 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9277 (_2!9184 lt!307233))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9272 (_2!9184 lt!307233)))))))

(assert (=> d!66671 (invariant!0 (currentBit!9272 (_2!9184 lt!307233)) (currentByte!9277 (_2!9184 lt!307233)) (size!4453 (buf!4939 (_2!9184 lt!307233))))))

(assert (=> d!66671 (= (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307233))) (currentByte!9277 (_2!9184 lt!307233)) (currentBit!9272 (_2!9184 lt!307233))) lt!307421)))

(declare-fun b!197547 () Bool)

(declare-fun res!165359 () Bool)

(assert (=> b!197547 (=> (not res!165359) (not e!135663))))

(assert (=> b!197547 (= res!165359 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!307421))))

(declare-fun b!197548 () Bool)

(declare-fun lt!307425 () (_ BitVec 64))

(assert (=> b!197548 (= e!135663 (bvsle lt!307421 (bvmul lt!307425 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!197548 (or (= lt!307425 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!307425 #b0000000000000000000000000000000000000000000000000000000000001000) lt!307425)))))

(assert (=> b!197548 (= lt!307425 ((_ sign_extend 32) (size!4453 (buf!4939 (_2!9184 lt!307233)))))))

(assert (= (and d!66671 res!165358) b!197547))

(assert (= (and b!197547 res!165359) b!197548))

(declare-fun m!305211 () Bool)

(assert (=> d!66671 m!305211))

(assert (=> d!66671 m!305045))

(assert (=> b!197407 d!66671))

(declare-fun d!66673 () Bool)

(declare-fun res!165362 () Bool)

(declare-fun e!135666 () Bool)

(assert (=> d!66673 (=> (not res!165362) (not e!135666))))

(assert (=> d!66673 (= res!165362 (= (size!4453 (buf!4939 thiss!1204)) (size!4453 (buf!4939 (_2!9184 lt!307233)))))))

(assert (=> d!66673 (= (isPrefixOf!0 thiss!1204 (_2!9184 lt!307233)) e!135666)))

(declare-fun b!197549 () Bool)

(declare-fun res!165363 () Bool)

(assert (=> b!197549 (=> (not res!165363) (not e!135666))))

(assert (=> b!197549 (= res!165363 (bvsle (bitIndex!0 (size!4453 (buf!4939 thiss!1204)) (currentByte!9277 thiss!1204) (currentBit!9272 thiss!1204)) (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307233))) (currentByte!9277 (_2!9184 lt!307233)) (currentBit!9272 (_2!9184 lt!307233)))))))

(declare-fun b!197550 () Bool)

(declare-fun e!135667 () Bool)

(assert (=> b!197550 (= e!135666 e!135667)))

(declare-fun res!165364 () Bool)

(assert (=> b!197550 (=> res!165364 e!135667)))

(assert (=> b!197550 (= res!165364 (= (size!4453 (buf!4939 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!197551 () Bool)

(assert (=> b!197551 (= e!135667 (arrayBitRangesEq!0 (buf!4939 thiss!1204) (buf!4939 (_2!9184 lt!307233)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4453 (buf!4939 thiss!1204)) (currentByte!9277 thiss!1204) (currentBit!9272 thiss!1204))))))

(assert (= (and d!66673 res!165362) b!197549))

(assert (= (and b!197549 res!165363) b!197550))

(assert (= (and b!197550 (not res!165364)) b!197551))

(assert (=> b!197549 m!305001))

(assert (=> b!197549 m!304983))

(assert (=> b!197551 m!305001))

(assert (=> b!197551 m!305001))

(declare-fun m!305213 () Bool)

(assert (=> b!197551 m!305213))

(assert (=> b!197407 d!66673))

(declare-fun d!66675 () Bool)

(assert (=> d!66675 (isPrefixOf!0 thiss!1204 (_2!9184 lt!307233))))

(declare-fun lt!307453 () Unit!13971)

(declare-fun choose!30 (BitStream!8014 BitStream!8014 BitStream!8014) Unit!13971)

(assert (=> d!66675 (= lt!307453 (choose!30 thiss!1204 (_2!9184 lt!307215) (_2!9184 lt!307233)))))

(assert (=> d!66675 (isPrefixOf!0 thiss!1204 (_2!9184 lt!307215))))

(assert (=> d!66675 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9184 lt!307215) (_2!9184 lt!307233)) lt!307453)))

(declare-fun bs!16550 () Bool)

(assert (= bs!16550 d!66675))

(assert (=> bs!16550 m!304985))

(declare-fun m!305219 () Bool)

(assert (=> bs!16550 m!305219))

(assert (=> bs!16550 m!304995))

(assert (=> b!197407 d!66675))

(declare-fun b!197682 () Bool)

(declare-fun e!135742 () Bool)

(declare-fun lt!307804 () tuple2!17074)

(declare-fun lt!307800 () tuple2!17078)

(assert (=> b!197682 (= e!135742 (= (bitIndex!0 (size!4453 (buf!4939 (_1!9182 lt!307804))) (currentByte!9277 (_1!9182 lt!307804)) (currentBit!9272 (_1!9182 lt!307804))) (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307800))) (currentByte!9277 (_2!9184 lt!307800)) (currentBit!9272 (_2!9184 lt!307800)))))))

(declare-fun b!197683 () Bool)

(declare-fun res!165482 () Bool)

(declare-fun e!135743 () Bool)

(assert (=> b!197683 (=> (not res!165482) (not e!135743))))

(declare-fun lt!307786 () tuple2!17078)

(assert (=> b!197683 (= res!165482 (= (size!4453 (buf!4939 (_2!9184 lt!307215))) (size!4453 (buf!4939 (_2!9184 lt!307786)))))))

(declare-fun b!197684 () Bool)

(declare-fun e!135736 () Bool)

(declare-fun lt!307765 () (_ BitVec 64))

(assert (=> b!197684 (= e!135736 (validate_offset_bits!1 ((_ sign_extend 32) (size!4453 (buf!4939 (_2!9184 lt!307215)))) ((_ sign_extend 32) (currentByte!9277 (_2!9184 lt!307215))) ((_ sign_extend 32) (currentBit!9272 (_2!9184 lt!307215))) lt!307765))))

(declare-fun d!66679 () Bool)

(assert (=> d!66679 e!135743))

(declare-fun res!165484 () Bool)

(assert (=> d!66679 (=> (not res!165484) (not e!135743))))

(assert (=> d!66679 (= res!165484 (invariant!0 (currentBit!9272 (_2!9184 lt!307786)) (currentByte!9277 (_2!9184 lt!307786)) (size!4453 (buf!4939 (_2!9184 lt!307786)))))))

(declare-fun e!135741 () tuple2!17078)

(assert (=> d!66679 (= lt!307786 e!135741)))

(declare-fun c!9820 () Bool)

(assert (=> d!66679 (= c!9820 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!66679 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!66679 (= (appendBitsLSBFirstLoopTR!0 (_2!9184 lt!307215) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!307786)))

(declare-fun b!197685 () Bool)

(declare-fun e!135739 () Bool)

(assert (=> b!197685 (= e!135743 e!135739)))

(declare-fun res!165486 () Bool)

(assert (=> b!197685 (=> (not res!165486) (not e!135739))))

(declare-fun lt!307792 () tuple2!17076)

(assert (=> b!197685 (= res!165486 (= (_2!9183 lt!307792) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun lt!307797 () tuple2!17072)

(assert (=> b!197685 (= lt!307792 (readNBitsLSBFirstsLoopPure!0 (_1!9181 lt!307797) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!307805 () Unit!13971)

(declare-fun lt!307798 () Unit!13971)

(assert (=> b!197685 (= lt!307805 lt!307798)))

(assert (=> b!197685 (validate_offset_bits!1 ((_ sign_extend 32) (size!4453 (buf!4939 (_2!9184 lt!307786)))) ((_ sign_extend 32) (currentByte!9277 (_2!9184 lt!307215))) ((_ sign_extend 32) (currentBit!9272 (_2!9184 lt!307215))) lt!307765)))

(assert (=> b!197685 (= lt!307798 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9184 lt!307215) (buf!4939 (_2!9184 lt!307786)) lt!307765))))

(assert (=> b!197685 e!135736))

(declare-fun res!165481 () Bool)

(assert (=> b!197685 (=> (not res!165481) (not e!135736))))

(assert (=> b!197685 (= res!165481 (and (= (size!4453 (buf!4939 (_2!9184 lt!307215))) (size!4453 (buf!4939 (_2!9184 lt!307786)))) (bvsge lt!307765 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!197685 (= lt!307765 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!197685 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!197685 (= lt!307797 (reader!0 (_2!9184 lt!307215) (_2!9184 lt!307786)))))

(declare-fun b!197686 () Bool)

(declare-fun lt!307809 () tuple2!17078)

(assert (=> b!197686 (= e!135741 (tuple2!17079 (_1!9184 lt!307809) (_2!9184 lt!307809)))))

(declare-fun lt!307787 () Bool)

(assert (=> b!197686 (= lt!307787 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!197686 (= lt!307800 (appendBit!0 (_2!9184 lt!307215) lt!307787))))

(declare-fun res!165480 () Bool)

(assert (=> b!197686 (= res!165480 (= (size!4453 (buf!4939 (_2!9184 lt!307215))) (size!4453 (buf!4939 (_2!9184 lt!307800)))))))

(declare-fun e!135740 () Bool)

(assert (=> b!197686 (=> (not res!165480) (not e!135740))))

(assert (=> b!197686 e!135740))

(declare-fun lt!307810 () tuple2!17078)

(assert (=> b!197686 (= lt!307810 lt!307800)))

(assert (=> b!197686 (= lt!307809 (appendBitsLSBFirstLoopTR!0 (_2!9184 lt!307810) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!307795 () Unit!13971)

(assert (=> b!197686 (= lt!307795 (lemmaIsPrefixTransitive!0 (_2!9184 lt!307215) (_2!9184 lt!307810) (_2!9184 lt!307809)))))

(assert (=> b!197686 (isPrefixOf!0 (_2!9184 lt!307215) (_2!9184 lt!307809))))

(declare-fun lt!307773 () Unit!13971)

(assert (=> b!197686 (= lt!307773 lt!307795)))

(assert (=> b!197686 (invariant!0 (currentBit!9272 (_2!9184 lt!307215)) (currentByte!9277 (_2!9184 lt!307215)) (size!4453 (buf!4939 (_2!9184 lt!307810))))))

(declare-fun lt!307794 () BitStream!8014)

(assert (=> b!197686 (= lt!307794 (BitStream!8015 (buf!4939 (_2!9184 lt!307810)) (currentByte!9277 (_2!9184 lt!307215)) (currentBit!9272 (_2!9184 lt!307215))))))

(assert (=> b!197686 (invariant!0 (currentBit!9272 lt!307794) (currentByte!9277 lt!307794) (size!4453 (buf!4939 (_2!9184 lt!307809))))))

(declare-fun lt!307781 () BitStream!8014)

(assert (=> b!197686 (= lt!307781 (BitStream!8015 (buf!4939 (_2!9184 lt!307809)) (currentByte!9277 lt!307794) (currentBit!9272 lt!307794)))))

(declare-fun lt!307788 () tuple2!17074)

(assert (=> b!197686 (= lt!307788 (readBitPure!0 lt!307794))))

(declare-fun lt!307807 () tuple2!17074)

(assert (=> b!197686 (= lt!307807 (readBitPure!0 lt!307781))))

(declare-fun lt!307789 () Unit!13971)

(assert (=> b!197686 (= lt!307789 (readBitPrefixLemma!0 lt!307794 (_2!9184 lt!307809)))))

(declare-fun res!165476 () Bool)

(assert (=> b!197686 (= res!165476 (= (bitIndex!0 (size!4453 (buf!4939 (_1!9182 lt!307788))) (currentByte!9277 (_1!9182 lt!307788)) (currentBit!9272 (_1!9182 lt!307788))) (bitIndex!0 (size!4453 (buf!4939 (_1!9182 lt!307807))) (currentByte!9277 (_1!9182 lt!307807)) (currentBit!9272 (_1!9182 lt!307807)))))))

(declare-fun e!135735 () Bool)

(assert (=> b!197686 (=> (not res!165476) (not e!135735))))

(assert (=> b!197686 e!135735))

(declare-fun lt!307776 () Unit!13971)

(assert (=> b!197686 (= lt!307776 lt!307789)))

(declare-fun lt!307785 () tuple2!17072)

(assert (=> b!197686 (= lt!307785 (reader!0 (_2!9184 lt!307215) (_2!9184 lt!307809)))))

(declare-fun lt!307783 () tuple2!17072)

(assert (=> b!197686 (= lt!307783 (reader!0 (_2!9184 lt!307810) (_2!9184 lt!307809)))))

(declare-fun lt!307772 () tuple2!17074)

(assert (=> b!197686 (= lt!307772 (readBitPure!0 (_1!9181 lt!307785)))))

(assert (=> b!197686 (= (_2!9182 lt!307772) lt!307787)))

(declare-fun lt!307791 () Unit!13971)

(declare-fun Unit!13977 () Unit!13971)

(assert (=> b!197686 (= lt!307791 Unit!13977)))

(declare-fun lt!307799 () (_ BitVec 64))

(assert (=> b!197686 (= lt!307799 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!307796 () (_ BitVec 64))

(assert (=> b!197686 (= lt!307796 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!307790 () Unit!13971)

(assert (=> b!197686 (= lt!307790 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9184 lt!307215) (buf!4939 (_2!9184 lt!307809)) lt!307796))))

(assert (=> b!197686 (validate_offset_bits!1 ((_ sign_extend 32) (size!4453 (buf!4939 (_2!9184 lt!307809)))) ((_ sign_extend 32) (currentByte!9277 (_2!9184 lt!307215))) ((_ sign_extend 32) (currentBit!9272 (_2!9184 lt!307215))) lt!307796)))

(declare-fun lt!307764 () Unit!13971)

(assert (=> b!197686 (= lt!307764 lt!307790)))

(declare-fun lt!307766 () tuple2!17076)

(assert (=> b!197686 (= lt!307766 (readNBitsLSBFirstsLoopPure!0 (_1!9181 lt!307785) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!307799))))

(declare-fun lt!307815 () (_ BitVec 64))

(assert (=> b!197686 (= lt!307815 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!307816 () Unit!13971)

(assert (=> b!197686 (= lt!307816 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9184 lt!307810) (buf!4939 (_2!9184 lt!307809)) lt!307815))))

(assert (=> b!197686 (validate_offset_bits!1 ((_ sign_extend 32) (size!4453 (buf!4939 (_2!9184 lt!307809)))) ((_ sign_extend 32) (currentByte!9277 (_2!9184 lt!307810))) ((_ sign_extend 32) (currentBit!9272 (_2!9184 lt!307810))) lt!307815)))

(declare-fun lt!307771 () Unit!13971)

(assert (=> b!197686 (= lt!307771 lt!307816)))

(declare-fun lt!307763 () tuple2!17076)

(assert (=> b!197686 (= lt!307763 (readNBitsLSBFirstsLoopPure!0 (_1!9181 lt!307783) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!307799 (ite (_2!9182 lt!307772) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!307801 () tuple2!17076)

(assert (=> b!197686 (= lt!307801 (readNBitsLSBFirstsLoopPure!0 (_1!9181 lt!307785) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!307799))))

(declare-fun c!9821 () Bool)

(assert (=> b!197686 (= c!9821 (_2!9182 (readBitPure!0 (_1!9181 lt!307785))))))

(declare-fun lt!307782 () tuple2!17076)

(declare-fun e!135738 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!8014 (_ BitVec 64)) BitStream!8014)

(assert (=> b!197686 (= lt!307782 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9181 lt!307785) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!307799 e!135738)))))

(declare-fun lt!307767 () Unit!13971)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8014 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13971)

(assert (=> b!197686 (= lt!307767 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9181 lt!307785) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!307799))))

(assert (=> b!197686 (and (= (_2!9183 lt!307801) (_2!9183 lt!307782)) (= (_1!9183 lt!307801) (_1!9183 lt!307782)))))

(declare-fun lt!307784 () Unit!13971)

(assert (=> b!197686 (= lt!307784 lt!307767)))

(assert (=> b!197686 (= (_1!9181 lt!307785) (withMovedBitIndex!0 (_2!9181 lt!307785) (bvsub (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307215))) (currentByte!9277 (_2!9184 lt!307215)) (currentBit!9272 (_2!9184 lt!307215))) (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307809))) (currentByte!9277 (_2!9184 lt!307809)) (currentBit!9272 (_2!9184 lt!307809))))))))

(declare-fun lt!307803 () Unit!13971)

(declare-fun Unit!13978 () Unit!13971)

(assert (=> b!197686 (= lt!307803 Unit!13978)))

(assert (=> b!197686 (= (_1!9181 lt!307783) (withMovedBitIndex!0 (_2!9181 lt!307783) (bvsub (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307810))) (currentByte!9277 (_2!9184 lt!307810)) (currentBit!9272 (_2!9184 lt!307810))) (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307809))) (currentByte!9277 (_2!9184 lt!307809)) (currentBit!9272 (_2!9184 lt!307809))))))))

(declare-fun lt!307802 () Unit!13971)

(declare-fun Unit!13979 () Unit!13971)

(assert (=> b!197686 (= lt!307802 Unit!13979)))

(assert (=> b!197686 (= (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307215))) (currentByte!9277 (_2!9184 lt!307215)) (currentBit!9272 (_2!9184 lt!307215))) (bvsub (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307810))) (currentByte!9277 (_2!9184 lt!307810)) (currentBit!9272 (_2!9184 lt!307810))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!307793 () Unit!13971)

(declare-fun Unit!13980 () Unit!13971)

(assert (=> b!197686 (= lt!307793 Unit!13980)))

(assert (=> b!197686 (= (_2!9183 lt!307766) (_2!9183 lt!307763))))

(declare-fun lt!307768 () Unit!13971)

(declare-fun Unit!13981 () Unit!13971)

(assert (=> b!197686 (= lt!307768 Unit!13981)))

(assert (=> b!197686 (invariant!0 (currentBit!9272 (_2!9184 lt!307809)) (currentByte!9277 (_2!9184 lt!307809)) (size!4453 (buf!4939 (_2!9184 lt!307809))))))

(declare-fun lt!307814 () Unit!13971)

(declare-fun Unit!13982 () Unit!13971)

(assert (=> b!197686 (= lt!307814 Unit!13982)))

(assert (=> b!197686 (= (size!4453 (buf!4939 (_2!9184 lt!307215))) (size!4453 (buf!4939 (_2!9184 lt!307809))))))

(declare-fun lt!307812 () Unit!13971)

(declare-fun Unit!13983 () Unit!13971)

(assert (=> b!197686 (= lt!307812 Unit!13983)))

(assert (=> b!197686 (= (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307809))) (currentByte!9277 (_2!9184 lt!307809)) (currentBit!9272 (_2!9184 lt!307809))) (bvsub (bvadd (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307215))) (currentByte!9277 (_2!9184 lt!307215)) (currentBit!9272 (_2!9184 lt!307215))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!307774 () Unit!13971)

(declare-fun Unit!13984 () Unit!13971)

(assert (=> b!197686 (= lt!307774 Unit!13984)))

(declare-fun lt!307778 () Unit!13971)

(declare-fun Unit!13985 () Unit!13971)

(assert (=> b!197686 (= lt!307778 Unit!13985)))

(declare-fun lt!307770 () tuple2!17072)

(assert (=> b!197686 (= lt!307770 (reader!0 (_2!9184 lt!307215) (_2!9184 lt!307809)))))

(declare-fun lt!307806 () (_ BitVec 64))

(assert (=> b!197686 (= lt!307806 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!307775 () Unit!13971)

(assert (=> b!197686 (= lt!307775 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9184 lt!307215) (buf!4939 (_2!9184 lt!307809)) lt!307806))))

(assert (=> b!197686 (validate_offset_bits!1 ((_ sign_extend 32) (size!4453 (buf!4939 (_2!9184 lt!307809)))) ((_ sign_extend 32) (currentByte!9277 (_2!9184 lt!307215))) ((_ sign_extend 32) (currentBit!9272 (_2!9184 lt!307215))) lt!307806)))

(declare-fun lt!307761 () Unit!13971)

(assert (=> b!197686 (= lt!307761 lt!307775)))

(declare-fun lt!307777 () tuple2!17076)

(assert (=> b!197686 (= lt!307777 (readNBitsLSBFirstsLoopPure!0 (_1!9181 lt!307770) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!165477 () Bool)

(assert (=> b!197686 (= res!165477 (= (_2!9183 lt!307777) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun e!135737 () Bool)

(assert (=> b!197686 (=> (not res!165477) (not e!135737))))

(assert (=> b!197686 e!135737))

(declare-fun lt!307769 () Unit!13971)

(declare-fun Unit!13986 () Unit!13971)

(assert (=> b!197686 (= lt!307769 Unit!13986)))

(declare-fun b!197687 () Bool)

(declare-fun res!165475 () Bool)

(assert (=> b!197687 (= res!165475 (= (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307800))) (currentByte!9277 (_2!9184 lt!307800)) (currentBit!9272 (_2!9184 lt!307800))) (bvadd (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307215))) (currentByte!9277 (_2!9184 lt!307215)) (currentBit!9272 (_2!9184 lt!307215))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!197687 (=> (not res!165475) (not e!135740))))

(declare-fun b!197688 () Bool)

(declare-fun res!165483 () Bool)

(assert (=> b!197688 (=> (not res!165483) (not e!135743))))

(declare-fun lt!307780 () (_ BitVec 64))

(declare-fun lt!307779 () (_ BitVec 64))

(assert (=> b!197688 (= res!165483 (= (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307786))) (currentByte!9277 (_2!9184 lt!307786)) (currentBit!9272 (_2!9184 lt!307786))) (bvsub lt!307780 lt!307779)))))

(assert (=> b!197688 (or (= (bvand lt!307780 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!307779 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!307780 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!307780 lt!307779) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!197688 (= lt!307779 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!307762 () (_ BitVec 64))

(declare-fun lt!307808 () (_ BitVec 64))

(assert (=> b!197688 (= lt!307780 (bvadd lt!307762 lt!307808))))

(assert (=> b!197688 (or (not (= (bvand lt!307762 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!307808 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!307762 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!307762 lt!307808) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!197688 (= lt!307808 ((_ sign_extend 32) nBits!348))))

(assert (=> b!197688 (= lt!307762 (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307215))) (currentByte!9277 (_2!9184 lt!307215)) (currentBit!9272 (_2!9184 lt!307215))))))

(declare-fun b!197689 () Bool)

(assert (=> b!197689 (= e!135739 (= (_1!9183 lt!307792) (_2!9181 lt!307797)))))

(declare-fun call!3104 () Bool)

(declare-fun bm!3101 () Bool)

(assert (=> bm!3101 (= call!3104 (isPrefixOf!0 (_2!9184 lt!307215) (ite c!9820 (_2!9184 lt!307215) (_2!9184 lt!307800))))))

(declare-fun b!197690 () Bool)

(declare-fun Unit!13987 () Unit!13971)

(assert (=> b!197690 (= e!135741 (tuple2!17079 Unit!13987 (_2!9184 lt!307215)))))

(declare-fun lt!307811 () Unit!13971)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8014) Unit!13971)

(assert (=> b!197690 (= lt!307811 (lemmaIsPrefixRefl!0 (_2!9184 lt!307215)))))

(assert (=> b!197690 call!3104))

(declare-fun lt!307813 () Unit!13971)

(assert (=> b!197690 (= lt!307813 lt!307811)))

(declare-fun b!197691 () Bool)

(assert (=> b!197691 (= e!135737 (= (_1!9183 lt!307777) (_2!9181 lt!307770)))))

(declare-fun b!197692 () Bool)

(assert (=> b!197692 (= e!135735 (= (_2!9182 lt!307788) (_2!9182 lt!307807)))))

(declare-fun b!197693 () Bool)

(declare-fun res!165479 () Bool)

(assert (=> b!197693 (=> (not res!165479) (not e!135743))))

(assert (=> b!197693 (= res!165479 (isPrefixOf!0 (_2!9184 lt!307215) (_2!9184 lt!307786)))))

(declare-fun b!197694 () Bool)

(declare-fun res!165478 () Bool)

(assert (=> b!197694 (= res!165478 call!3104)))

(assert (=> b!197694 (=> (not res!165478) (not e!135740))))

(declare-fun b!197695 () Bool)

(assert (=> b!197695 (= e!135738 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!197696 () Bool)

(assert (=> b!197696 (= e!135738 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!197697 () Bool)

(assert (=> b!197697 (= lt!307804 (readBitPure!0 (readerFrom!0 (_2!9184 lt!307800) (currentBit!9272 (_2!9184 lt!307215)) (currentByte!9277 (_2!9184 lt!307215)))))))

(declare-fun res!165485 () Bool)

(assert (=> b!197697 (= res!165485 (and (= (_2!9182 lt!307804) lt!307787) (= (_1!9182 lt!307804) (_2!9184 lt!307800))))))

(assert (=> b!197697 (=> (not res!165485) (not e!135742))))

(assert (=> b!197697 (= e!135740 e!135742)))

(assert (= (and d!66679 c!9820) b!197690))

(assert (= (and d!66679 (not c!9820)) b!197686))

(assert (= (and b!197686 res!165480) b!197687))

(assert (= (and b!197687 res!165475) b!197694))

(assert (= (and b!197694 res!165478) b!197697))

(assert (= (and b!197697 res!165485) b!197682))

(assert (= (and b!197686 res!165476) b!197692))

(assert (= (and b!197686 c!9821) b!197696))

(assert (= (and b!197686 (not c!9821)) b!197695))

(assert (= (and b!197686 res!165477) b!197691))

(assert (= (or b!197690 b!197694) bm!3101))

(assert (= (and d!66679 res!165484) b!197683))

(assert (= (and b!197683 res!165482) b!197688))

(assert (= (and b!197688 res!165483) b!197693))

(assert (= (and b!197693 res!165479) b!197685))

(assert (= (and b!197685 res!165481) b!197684))

(assert (= (and b!197685 res!165486) b!197689))

(declare-fun m!305369 () Bool)

(assert (=> b!197686 m!305369))

(declare-fun m!305371 () Bool)

(assert (=> b!197686 m!305371))

(declare-fun m!305373 () Bool)

(assert (=> b!197686 m!305373))

(declare-fun m!305375 () Bool)

(assert (=> b!197686 m!305375))

(declare-fun m!305377 () Bool)

(assert (=> b!197686 m!305377))

(declare-fun m!305379 () Bool)

(assert (=> b!197686 m!305379))

(declare-fun m!305381 () Bool)

(assert (=> b!197686 m!305381))

(declare-fun m!305383 () Bool)

(assert (=> b!197686 m!305383))

(declare-fun m!305385 () Bool)

(assert (=> b!197686 m!305385))

(declare-fun m!305387 () Bool)

(assert (=> b!197686 m!305387))

(declare-fun m!305389 () Bool)

(assert (=> b!197686 m!305389))

(declare-fun m!305391 () Bool)

(assert (=> b!197686 m!305391))

(declare-fun m!305393 () Bool)

(assert (=> b!197686 m!305393))

(declare-fun m!305395 () Bool)

(assert (=> b!197686 m!305395))

(declare-fun m!305397 () Bool)

(assert (=> b!197686 m!305397))

(declare-fun m!305399 () Bool)

(assert (=> b!197686 m!305399))

(declare-fun m!305401 () Bool)

(assert (=> b!197686 m!305401))

(declare-fun m!305403 () Bool)

(assert (=> b!197686 m!305403))

(declare-fun m!305405 () Bool)

(assert (=> b!197686 m!305405))

(declare-fun m!305407 () Bool)

(assert (=> b!197686 m!305407))

(declare-fun m!305409 () Bool)

(assert (=> b!197686 m!305409))

(declare-fun m!305411 () Bool)

(assert (=> b!197686 m!305411))

(declare-fun m!305413 () Bool)

(assert (=> b!197686 m!305413))

(declare-fun m!305415 () Bool)

(assert (=> b!197686 m!305415))

(declare-fun m!305417 () Bool)

(assert (=> b!197686 m!305417))

(declare-fun m!305419 () Bool)

(assert (=> b!197686 m!305419))

(assert (=> b!197686 m!304999))

(declare-fun m!305421 () Bool)

(assert (=> b!197686 m!305421))

(declare-fun m!305423 () Bool)

(assert (=> b!197686 m!305423))

(declare-fun m!305425 () Bool)

(assert (=> b!197686 m!305425))

(declare-fun m!305427 () Bool)

(assert (=> b!197686 m!305427))

(assert (=> b!197686 m!305369))

(declare-fun m!305429 () Bool)

(assert (=> b!197686 m!305429))

(declare-fun m!305431 () Bool)

(assert (=> b!197686 m!305431))

(declare-fun m!305433 () Bool)

(assert (=> b!197686 m!305433))

(declare-fun m!305435 () Bool)

(assert (=> b!197697 m!305435))

(assert (=> b!197697 m!305435))

(declare-fun m!305437 () Bool)

(assert (=> b!197697 m!305437))

(declare-fun m!305439 () Bool)

(assert (=> b!197685 m!305439))

(assert (=> b!197685 m!305381))

(declare-fun m!305441 () Bool)

(assert (=> b!197685 m!305441))

(declare-fun m!305443 () Bool)

(assert (=> b!197685 m!305443))

(assert (=> b!197685 m!305425))

(declare-fun m!305445 () Bool)

(assert (=> b!197685 m!305445))

(declare-fun m!305447 () Bool)

(assert (=> b!197690 m!305447))

(declare-fun m!305449 () Bool)

(assert (=> d!66679 m!305449))

(declare-fun m!305451 () Bool)

(assert (=> b!197682 m!305451))

(declare-fun m!305453 () Bool)

(assert (=> b!197682 m!305453))

(declare-fun m!305455 () Bool)

(assert (=> b!197688 m!305455))

(assert (=> b!197688 m!304999))

(declare-fun m!305457 () Bool)

(assert (=> bm!3101 m!305457))

(assert (=> b!197687 m!305453))

(assert (=> b!197687 m!304999))

(declare-fun m!305459 () Bool)

(assert (=> b!197693 m!305459))

(declare-fun m!305461 () Bool)

(assert (=> b!197684 m!305461))

(assert (=> b!197407 d!66679))

(assert (=> b!197396 d!66651))

(declare-fun d!66753 () Bool)

(assert (=> d!66753 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9272 thiss!1204) (currentByte!9277 thiss!1204) (size!4453 (buf!4939 thiss!1204))))))

(declare-fun bs!16564 () Bool)

(assert (= bs!16564 d!66753))

(assert (=> bs!16564 m!304979))

(assert (=> start!41918 d!66753))

(assert (=> b!197395 d!66659))

(assert (=> b!197395 d!66661))

(declare-fun d!66755 () Bool)

(assert (=> d!66755 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4453 (buf!4939 thiss!1204))) ((_ sign_extend 32) (currentByte!9277 thiss!1204)) ((_ sign_extend 32) (currentBit!9272 thiss!1204)) lt!307229) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4453 (buf!4939 thiss!1204))) ((_ sign_extend 32) (currentByte!9277 thiss!1204)) ((_ sign_extend 32) (currentBit!9272 thiss!1204))) lt!307229))))

(declare-fun bs!16565 () Bool)

(assert (= bs!16565 d!66755))

(assert (=> bs!16565 m!305193))

(assert (=> b!197405 d!66755))

(declare-fun d!66757 () Bool)

(assert (=> d!66757 (= (array_inv!4194 (buf!4939 thiss!1204)) (bvsge (size!4453 (buf!4939 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!197394 d!66757))

(declare-fun d!66759 () Bool)

(assert (=> d!66759 (= (invariant!0 (currentBit!9272 thiss!1204) (currentByte!9277 thiss!1204) (size!4453 (buf!4939 thiss!1204))) (and (bvsge (currentBit!9272 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9272 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9277 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9277 thiss!1204) (size!4453 (buf!4939 thiss!1204))) (and (= (currentBit!9272 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9277 thiss!1204) (size!4453 (buf!4939 thiss!1204)))))))))

(assert (=> b!197393 d!66759))

(declare-fun d!66761 () Bool)

(assert (=> d!66761 (= (invariant!0 (currentBit!9272 (_2!9184 lt!307233)) (currentByte!9277 (_2!9184 lt!307233)) (size!4453 (buf!4939 (_2!9184 lt!307233)))) (and (bvsge (currentBit!9272 (_2!9184 lt!307233)) #b00000000000000000000000000000000) (bvslt (currentBit!9272 (_2!9184 lt!307233)) #b00000000000000000000000000001000) (bvsge (currentByte!9277 (_2!9184 lt!307233)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9277 (_2!9184 lt!307233)) (size!4453 (buf!4939 (_2!9184 lt!307233)))) (and (= (currentBit!9272 (_2!9184 lt!307233)) #b00000000000000000000000000000000) (= (currentByte!9277 (_2!9184 lt!307233)) (size!4453 (buf!4939 (_2!9184 lt!307233))))))))))

(assert (=> b!197403 d!66761))

(declare-fun d!66763 () Bool)

(declare-datatypes ((tuple2!17098 0))(
  ( (tuple2!17099 (_1!9194 (_ BitVec 64)) (_2!9194 BitStream!8014)) )
))
(declare-fun lt!307819 () tuple2!17098)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!8014 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17098)

(assert (=> d!66763 (= lt!307819 (readNBitsLSBFirstsLoop!0 (_1!9181 lt!307232) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvor lt!307227 (ite (_2!9182 lt!307223) lt!307237 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!66763 (= (readNBitsLSBFirstsLoopPure!0 (_1!9181 lt!307232) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvor lt!307227 (ite (_2!9182 lt!307223) lt!307237 #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!17077 (_2!9194 lt!307819) (_1!9194 lt!307819)))))

(declare-fun bs!16566 () Bool)

(assert (= bs!16566 d!66763))

(declare-fun m!305463 () Bool)

(assert (=> bs!16566 m!305463))

(assert (=> b!197392 d!66763))

(declare-fun d!66765 () Bool)

(declare-fun lt!307820 () tuple2!17098)

(assert (=> d!66765 (= lt!307820 (readNBitsLSBFirstsLoop!0 (_1!9181 lt!307220) nBits!348 i!590 lt!307227))))

(assert (=> d!66765 (= (readNBitsLSBFirstsLoopPure!0 (_1!9181 lt!307220) nBits!348 i!590 lt!307227) (tuple2!17077 (_2!9194 lt!307820) (_1!9194 lt!307820)))))

(declare-fun bs!16567 () Bool)

(assert (= bs!16567 d!66765))

(declare-fun m!305465 () Bool)

(assert (=> bs!16567 m!305465))

(assert (=> b!197392 d!66765))

(declare-fun d!66767 () Bool)

(assert (=> d!66767 (validate_offset_bits!1 ((_ sign_extend 32) (size!4453 (buf!4939 (_2!9184 lt!307233)))) ((_ sign_extend 32) (currentByte!9277 thiss!1204)) ((_ sign_extend 32) (currentBit!9272 thiss!1204)) lt!307229)))

(declare-fun lt!307823 () Unit!13971)

(declare-fun choose!9 (BitStream!8014 array!10103 (_ BitVec 64) BitStream!8014) Unit!13971)

(assert (=> d!66767 (= lt!307823 (choose!9 thiss!1204 (buf!4939 (_2!9184 lt!307233)) lt!307229 (BitStream!8015 (buf!4939 (_2!9184 lt!307233)) (currentByte!9277 thiss!1204) (currentBit!9272 thiss!1204))))))

(assert (=> d!66767 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4939 (_2!9184 lt!307233)) lt!307229) lt!307823)))

(declare-fun bs!16568 () Bool)

(assert (= bs!16568 d!66767))

(assert (=> bs!16568 m!305017))

(declare-fun m!305467 () Bool)

(assert (=> bs!16568 m!305467))

(assert (=> b!197392 d!66767))

(declare-fun d!66769 () Bool)

(assert (=> d!66769 (validate_offset_bits!1 ((_ sign_extend 32) (size!4453 (buf!4939 (_2!9184 lt!307233)))) ((_ sign_extend 32) (currentByte!9277 (_2!9184 lt!307215))) ((_ sign_extend 32) (currentBit!9272 (_2!9184 lt!307215))) lt!307228)))

(declare-fun lt!307824 () Unit!13971)

(assert (=> d!66769 (= lt!307824 (choose!9 (_2!9184 lt!307215) (buf!4939 (_2!9184 lt!307233)) lt!307228 (BitStream!8015 (buf!4939 (_2!9184 lt!307233)) (currentByte!9277 (_2!9184 lt!307215)) (currentBit!9272 (_2!9184 lt!307215)))))))

(assert (=> d!66769 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9184 lt!307215) (buf!4939 (_2!9184 lt!307233)) lt!307228) lt!307824)))

(declare-fun bs!16569 () Bool)

(assert (= bs!16569 d!66769))

(assert (=> bs!16569 m!305029))

(declare-fun m!305469 () Bool)

(assert (=> bs!16569 m!305469))

(assert (=> b!197392 d!66769))

(declare-fun d!66771 () Bool)

(declare-fun e!135744 () Bool)

(assert (=> d!66771 e!135744))

(declare-fun res!165487 () Bool)

(assert (=> d!66771 (=> (not res!165487) (not e!135744))))

(declare-fun lt!307828 () (_ BitVec 64))

(declare-fun lt!307825 () (_ BitVec 64))

(declare-fun lt!307827 () (_ BitVec 64))

(assert (=> d!66771 (= res!165487 (= lt!307825 (bvsub lt!307828 lt!307827)))))

(assert (=> d!66771 (or (= (bvand lt!307828 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!307827 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!307828 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!307828 lt!307827) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66771 (= lt!307827 (remainingBits!0 ((_ sign_extend 32) (size!4453 (buf!4939 (_1!9182 lt!307236)))) ((_ sign_extend 32) (currentByte!9277 (_1!9182 lt!307236))) ((_ sign_extend 32) (currentBit!9272 (_1!9182 lt!307236)))))))

(declare-fun lt!307826 () (_ BitVec 64))

(declare-fun lt!307830 () (_ BitVec 64))

(assert (=> d!66771 (= lt!307828 (bvmul lt!307826 lt!307830))))

(assert (=> d!66771 (or (= lt!307826 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!307830 (bvsdiv (bvmul lt!307826 lt!307830) lt!307826)))))

(assert (=> d!66771 (= lt!307830 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66771 (= lt!307826 ((_ sign_extend 32) (size!4453 (buf!4939 (_1!9182 lt!307236)))))))

(assert (=> d!66771 (= lt!307825 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9277 (_1!9182 lt!307236))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9272 (_1!9182 lt!307236)))))))

(assert (=> d!66771 (invariant!0 (currentBit!9272 (_1!9182 lt!307236)) (currentByte!9277 (_1!9182 lt!307236)) (size!4453 (buf!4939 (_1!9182 lt!307236))))))

(assert (=> d!66771 (= (bitIndex!0 (size!4453 (buf!4939 (_1!9182 lt!307236))) (currentByte!9277 (_1!9182 lt!307236)) (currentBit!9272 (_1!9182 lt!307236))) lt!307825)))

(declare-fun b!197698 () Bool)

(declare-fun res!165488 () Bool)

(assert (=> b!197698 (=> (not res!165488) (not e!135744))))

(assert (=> b!197698 (= res!165488 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!307825))))

(declare-fun b!197699 () Bool)

(declare-fun lt!307829 () (_ BitVec 64))

(assert (=> b!197699 (= e!135744 (bvsle lt!307825 (bvmul lt!307829 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!197699 (or (= lt!307829 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!307829 #b0000000000000000000000000000000000000000000000000000000000001000) lt!307829)))))

(assert (=> b!197699 (= lt!307829 ((_ sign_extend 32) (size!4453 (buf!4939 (_1!9182 lt!307236)))))))

(assert (= (and d!66771 res!165487) b!197698))

(assert (= (and b!197698 res!165488) b!197699))

(declare-fun m!305471 () Bool)

(assert (=> d!66771 m!305471))

(declare-fun m!305473 () Bool)

(assert (=> d!66771 m!305473))

(assert (=> b!197392 d!66771))

(declare-fun d!66773 () Bool)

(declare-fun lt!307831 () tuple2!17096)

(assert (=> d!66773 (= lt!307831 (readBit!0 lt!307219))))

(assert (=> d!66773 (= (readBitPure!0 lt!307219) (tuple2!17075 (_2!9193 lt!307831) (_1!9193 lt!307831)))))

(declare-fun bs!16570 () Bool)

(assert (= bs!16570 d!66773))

(declare-fun m!305475 () Bool)

(assert (=> bs!16570 m!305475))

(assert (=> b!197392 d!66773))

(declare-fun d!66775 () Bool)

(assert (=> d!66775 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!197392 d!66775))

(declare-fun d!66777 () Bool)

(declare-fun e!135747 () Bool)

(assert (=> d!66777 e!135747))

(declare-fun res!165491 () Bool)

(assert (=> d!66777 (=> (not res!165491) (not e!135747))))

(declare-fun lt!307840 () tuple2!17074)

(declare-fun lt!307843 () tuple2!17074)

(assert (=> d!66777 (= res!165491 (= (bitIndex!0 (size!4453 (buf!4939 (_1!9182 lt!307840))) (currentByte!9277 (_1!9182 lt!307840)) (currentBit!9272 (_1!9182 lt!307840))) (bitIndex!0 (size!4453 (buf!4939 (_1!9182 lt!307843))) (currentByte!9277 (_1!9182 lt!307843)) (currentBit!9272 (_1!9182 lt!307843)))))))

(declare-fun lt!307842 () Unit!13971)

(declare-fun lt!307841 () BitStream!8014)

(declare-fun choose!50 (BitStream!8014 BitStream!8014 BitStream!8014 tuple2!17074 tuple2!17074 BitStream!8014 Bool tuple2!17074 tuple2!17074 BitStream!8014 Bool) Unit!13971)

(assert (=> d!66777 (= lt!307842 (choose!50 lt!307219 (_2!9184 lt!307233) lt!307841 lt!307840 (tuple2!17075 (_1!9182 lt!307840) (_2!9182 lt!307840)) (_1!9182 lt!307840) (_2!9182 lt!307840) lt!307843 (tuple2!17075 (_1!9182 lt!307843) (_2!9182 lt!307843)) (_1!9182 lt!307843) (_2!9182 lt!307843)))))

(assert (=> d!66777 (= lt!307843 (readBitPure!0 lt!307841))))

(assert (=> d!66777 (= lt!307840 (readBitPure!0 lt!307219))))

(assert (=> d!66777 (= lt!307841 (BitStream!8015 (buf!4939 (_2!9184 lt!307233)) (currentByte!9277 lt!307219) (currentBit!9272 lt!307219)))))

(assert (=> d!66777 (invariant!0 (currentBit!9272 lt!307219) (currentByte!9277 lt!307219) (size!4453 (buf!4939 (_2!9184 lt!307233))))))

(assert (=> d!66777 (= (readBitPrefixLemma!0 lt!307219 (_2!9184 lt!307233)) lt!307842)))

(declare-fun b!197702 () Bool)

(assert (=> b!197702 (= e!135747 (= (_2!9182 lt!307840) (_2!9182 lt!307843)))))

(assert (= (and d!66777 res!165491) b!197702))

(declare-fun m!305477 () Bool)

(assert (=> d!66777 m!305477))

(assert (=> d!66777 m!305019))

(declare-fun m!305479 () Bool)

(assert (=> d!66777 m!305479))

(declare-fun m!305481 () Bool)

(assert (=> d!66777 m!305481))

(declare-fun m!305483 () Bool)

(assert (=> d!66777 m!305483))

(declare-fun m!305485 () Bool)

(assert (=> d!66777 m!305485))

(assert (=> b!197392 d!66777))

(declare-fun d!66779 () Bool)

(assert (=> d!66779 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4453 (buf!4939 (_2!9184 lt!307233)))) ((_ sign_extend 32) (currentByte!9277 thiss!1204)) ((_ sign_extend 32) (currentBit!9272 thiss!1204)) lt!307229) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4453 (buf!4939 (_2!9184 lt!307233)))) ((_ sign_extend 32) (currentByte!9277 thiss!1204)) ((_ sign_extend 32) (currentBit!9272 thiss!1204))) lt!307229))))

(declare-fun bs!16571 () Bool)

(assert (= bs!16571 d!66779))

(declare-fun m!305487 () Bool)

(assert (=> bs!16571 m!305487))

(assert (=> b!197392 d!66779))

(declare-fun d!66781 () Bool)

(declare-fun lt!307844 () tuple2!17096)

(assert (=> d!66781 (= lt!307844 (readBit!0 (_1!9181 lt!307220)))))

(assert (=> d!66781 (= (readBitPure!0 (_1!9181 lt!307220)) (tuple2!17075 (_2!9193 lt!307844) (_1!9193 lt!307844)))))

(declare-fun bs!16572 () Bool)

(assert (= bs!16572 d!66781))

(declare-fun m!305489 () Bool)

(assert (=> bs!16572 m!305489))

(assert (=> b!197392 d!66781))

(declare-fun d!66783 () Bool)

(declare-fun e!135748 () Bool)

(assert (=> d!66783 e!135748))

(declare-fun res!165492 () Bool)

(assert (=> d!66783 (=> (not res!165492) (not e!135748))))

(declare-fun lt!307848 () (_ BitVec 64))

(declare-fun lt!307847 () (_ BitVec 64))

(declare-fun lt!307845 () (_ BitVec 64))

(assert (=> d!66783 (= res!165492 (= lt!307845 (bvsub lt!307848 lt!307847)))))

(assert (=> d!66783 (or (= (bvand lt!307848 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!307847 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!307848 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!307848 lt!307847) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66783 (= lt!307847 (remainingBits!0 ((_ sign_extend 32) (size!4453 (buf!4939 (_1!9182 lt!307230)))) ((_ sign_extend 32) (currentByte!9277 (_1!9182 lt!307230))) ((_ sign_extend 32) (currentBit!9272 (_1!9182 lt!307230)))))))

(declare-fun lt!307846 () (_ BitVec 64))

(declare-fun lt!307850 () (_ BitVec 64))

(assert (=> d!66783 (= lt!307848 (bvmul lt!307846 lt!307850))))

(assert (=> d!66783 (or (= lt!307846 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!307850 (bvsdiv (bvmul lt!307846 lt!307850) lt!307846)))))

(assert (=> d!66783 (= lt!307850 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66783 (= lt!307846 ((_ sign_extend 32) (size!4453 (buf!4939 (_1!9182 lt!307230)))))))

(assert (=> d!66783 (= lt!307845 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9277 (_1!9182 lt!307230))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9272 (_1!9182 lt!307230)))))))

(assert (=> d!66783 (invariant!0 (currentBit!9272 (_1!9182 lt!307230)) (currentByte!9277 (_1!9182 lt!307230)) (size!4453 (buf!4939 (_1!9182 lt!307230))))))

(assert (=> d!66783 (= (bitIndex!0 (size!4453 (buf!4939 (_1!9182 lt!307230))) (currentByte!9277 (_1!9182 lt!307230)) (currentBit!9272 (_1!9182 lt!307230))) lt!307845)))

(declare-fun b!197703 () Bool)

(declare-fun res!165493 () Bool)

(assert (=> b!197703 (=> (not res!165493) (not e!135748))))

(assert (=> b!197703 (= res!165493 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!307845))))

(declare-fun b!197704 () Bool)

(declare-fun lt!307849 () (_ BitVec 64))

(assert (=> b!197704 (= e!135748 (bvsle lt!307845 (bvmul lt!307849 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!197704 (or (= lt!307849 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!307849 #b0000000000000000000000000000000000000000000000000000000000001000) lt!307849)))))

(assert (=> b!197704 (= lt!307849 ((_ sign_extend 32) (size!4453 (buf!4939 (_1!9182 lt!307230)))))))

(assert (= (and d!66783 res!165492) b!197703))

(assert (= (and b!197703 res!165493) b!197704))

(declare-fun m!305491 () Bool)

(assert (=> d!66783 m!305491))

(declare-fun m!305493 () Bool)

(assert (=> d!66783 m!305493))

(assert (=> b!197392 d!66783))

(declare-fun d!66785 () Bool)

(assert (=> d!66785 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4453 (buf!4939 (_2!9184 lt!307233)))) ((_ sign_extend 32) (currentByte!9277 (_2!9184 lt!307215))) ((_ sign_extend 32) (currentBit!9272 (_2!9184 lt!307215))) lt!307228) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4453 (buf!4939 (_2!9184 lt!307233)))) ((_ sign_extend 32) (currentByte!9277 (_2!9184 lt!307215))) ((_ sign_extend 32) (currentBit!9272 (_2!9184 lt!307215)))) lt!307228))))

(declare-fun bs!16573 () Bool)

(assert (= bs!16573 d!66785))

(declare-fun m!305495 () Bool)

(assert (=> bs!16573 m!305495))

(assert (=> b!197392 d!66785))

(declare-fun b!197715 () Bool)

(declare-fun res!165501 () Bool)

(declare-fun e!135754 () Bool)

(assert (=> b!197715 (=> (not res!165501) (not e!135754))))

(declare-fun lt!307907 () tuple2!17072)

(assert (=> b!197715 (= res!165501 (isPrefixOf!0 (_2!9181 lt!307907) (_2!9184 lt!307233)))))

(declare-fun b!197716 () Bool)

(declare-fun e!135753 () Unit!13971)

(declare-fun Unit!13988 () Unit!13971)

(assert (=> b!197716 (= e!135753 Unit!13988)))

(declare-fun b!197718 () Bool)

(declare-fun lt!307910 () Unit!13971)

(assert (=> b!197718 (= e!135753 lt!307910)))

(declare-fun lt!307905 () (_ BitVec 64))

(assert (=> b!197718 (= lt!307905 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!307893 () (_ BitVec 64))

(assert (=> b!197718 (= lt!307893 (bitIndex!0 (size!4453 (buf!4939 thiss!1204)) (currentByte!9277 thiss!1204) (currentBit!9272 thiss!1204)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!10103 array!10103 (_ BitVec 64) (_ BitVec 64)) Unit!13971)

(assert (=> b!197718 (= lt!307910 (arrayBitRangesEqSymmetric!0 (buf!4939 thiss!1204) (buf!4939 (_2!9184 lt!307233)) lt!307905 lt!307893))))

(assert (=> b!197718 (arrayBitRangesEq!0 (buf!4939 (_2!9184 lt!307233)) (buf!4939 thiss!1204) lt!307905 lt!307893)))

(declare-fun b!197719 () Bool)

(declare-fun lt!307904 () (_ BitVec 64))

(declare-fun lt!307902 () (_ BitVec 64))

(assert (=> b!197719 (= e!135754 (= (_1!9181 lt!307907) (withMovedBitIndex!0 (_2!9181 lt!307907) (bvsub lt!307904 lt!307902))))))

(assert (=> b!197719 (or (= (bvand lt!307904 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!307902 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!307904 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!307904 lt!307902) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!197719 (= lt!307902 (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307233))) (currentByte!9277 (_2!9184 lt!307233)) (currentBit!9272 (_2!9184 lt!307233))))))

(assert (=> b!197719 (= lt!307904 (bitIndex!0 (size!4453 (buf!4939 thiss!1204)) (currentByte!9277 thiss!1204) (currentBit!9272 thiss!1204)))))

(declare-fun d!66787 () Bool)

(assert (=> d!66787 e!135754))

(declare-fun res!165502 () Bool)

(assert (=> d!66787 (=> (not res!165502) (not e!135754))))

(assert (=> d!66787 (= res!165502 (isPrefixOf!0 (_1!9181 lt!307907) (_2!9181 lt!307907)))))

(declare-fun lt!307896 () BitStream!8014)

(assert (=> d!66787 (= lt!307907 (tuple2!17073 lt!307896 (_2!9184 lt!307233)))))

(declare-fun lt!307892 () Unit!13971)

(declare-fun lt!307897 () Unit!13971)

(assert (=> d!66787 (= lt!307892 lt!307897)))

(assert (=> d!66787 (isPrefixOf!0 lt!307896 (_2!9184 lt!307233))))

(assert (=> d!66787 (= lt!307897 (lemmaIsPrefixTransitive!0 lt!307896 (_2!9184 lt!307233) (_2!9184 lt!307233)))))

(declare-fun lt!307891 () Unit!13971)

(declare-fun lt!307895 () Unit!13971)

(assert (=> d!66787 (= lt!307891 lt!307895)))

(assert (=> d!66787 (isPrefixOf!0 lt!307896 (_2!9184 lt!307233))))

(assert (=> d!66787 (= lt!307895 (lemmaIsPrefixTransitive!0 lt!307896 thiss!1204 (_2!9184 lt!307233)))))

(declare-fun lt!307900 () Unit!13971)

(assert (=> d!66787 (= lt!307900 e!135753)))

(declare-fun c!9824 () Bool)

(assert (=> d!66787 (= c!9824 (not (= (size!4453 (buf!4939 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!307906 () Unit!13971)

(declare-fun lt!307903 () Unit!13971)

(assert (=> d!66787 (= lt!307906 lt!307903)))

(assert (=> d!66787 (isPrefixOf!0 (_2!9184 lt!307233) (_2!9184 lt!307233))))

(assert (=> d!66787 (= lt!307903 (lemmaIsPrefixRefl!0 (_2!9184 lt!307233)))))

(declare-fun lt!307901 () Unit!13971)

(declare-fun lt!307899 () Unit!13971)

(assert (=> d!66787 (= lt!307901 lt!307899)))

(assert (=> d!66787 (= lt!307899 (lemmaIsPrefixRefl!0 (_2!9184 lt!307233)))))

(declare-fun lt!307908 () Unit!13971)

(declare-fun lt!307894 () Unit!13971)

(assert (=> d!66787 (= lt!307908 lt!307894)))

(assert (=> d!66787 (isPrefixOf!0 lt!307896 lt!307896)))

(assert (=> d!66787 (= lt!307894 (lemmaIsPrefixRefl!0 lt!307896))))

(declare-fun lt!307898 () Unit!13971)

(declare-fun lt!307909 () Unit!13971)

(assert (=> d!66787 (= lt!307898 lt!307909)))

(assert (=> d!66787 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!66787 (= lt!307909 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!66787 (= lt!307896 (BitStream!8015 (buf!4939 (_2!9184 lt!307233)) (currentByte!9277 thiss!1204) (currentBit!9272 thiss!1204)))))

(assert (=> d!66787 (isPrefixOf!0 thiss!1204 (_2!9184 lt!307233))))

(assert (=> d!66787 (= (reader!0 thiss!1204 (_2!9184 lt!307233)) lt!307907)))

(declare-fun b!197717 () Bool)

(declare-fun res!165500 () Bool)

(assert (=> b!197717 (=> (not res!165500) (not e!135754))))

(assert (=> b!197717 (= res!165500 (isPrefixOf!0 (_1!9181 lt!307907) thiss!1204))))

(assert (= (and d!66787 c!9824) b!197718))

(assert (= (and d!66787 (not c!9824)) b!197716))

(assert (= (and d!66787 res!165502) b!197717))

(assert (= (and b!197717 res!165500) b!197715))

(assert (= (and b!197715 res!165501) b!197719))

(declare-fun m!305497 () Bool)

(assert (=> b!197715 m!305497))

(assert (=> b!197718 m!305001))

(declare-fun m!305499 () Bool)

(assert (=> b!197718 m!305499))

(declare-fun m!305501 () Bool)

(assert (=> b!197718 m!305501))

(declare-fun m!305503 () Bool)

(assert (=> b!197719 m!305503))

(assert (=> b!197719 m!304983))

(assert (=> b!197719 m!305001))

(declare-fun m!305505 () Bool)

(assert (=> d!66787 m!305505))

(declare-fun m!305507 () Bool)

(assert (=> d!66787 m!305507))

(declare-fun m!305509 () Bool)

(assert (=> d!66787 m!305509))

(declare-fun m!305511 () Bool)

(assert (=> d!66787 m!305511))

(declare-fun m!305513 () Bool)

(assert (=> d!66787 m!305513))

(declare-fun m!305515 () Bool)

(assert (=> d!66787 m!305515))

(declare-fun m!305517 () Bool)

(assert (=> d!66787 m!305517))

(assert (=> d!66787 m!304985))

(declare-fun m!305519 () Bool)

(assert (=> d!66787 m!305519))

(declare-fun m!305521 () Bool)

(assert (=> d!66787 m!305521))

(declare-fun m!305523 () Bool)

(assert (=> d!66787 m!305523))

(declare-fun m!305525 () Bool)

(assert (=> b!197717 m!305525))

(assert (=> b!197392 d!66787))

(declare-fun d!66789 () Bool)

(declare-fun lt!307911 () tuple2!17096)

(assert (=> d!66789 (= lt!307911 (readBit!0 (BitStream!8015 (buf!4939 (_2!9184 lt!307233)) (currentByte!9277 thiss!1204) (currentBit!9272 thiss!1204))))))

(assert (=> d!66789 (= (readBitPure!0 (BitStream!8015 (buf!4939 (_2!9184 lt!307233)) (currentByte!9277 thiss!1204) (currentBit!9272 thiss!1204))) (tuple2!17075 (_2!9193 lt!307911) (_1!9193 lt!307911)))))

(declare-fun bs!16574 () Bool)

(assert (= bs!16574 d!66789))

(declare-fun m!305527 () Bool)

(assert (=> bs!16574 m!305527))

(assert (=> b!197392 d!66789))

(declare-fun d!66791 () Bool)

(assert (=> d!66791 (= (invariant!0 (currentBit!9272 thiss!1204) (currentByte!9277 thiss!1204) (size!4453 (buf!4939 (_2!9184 lt!307215)))) (and (bvsge (currentBit!9272 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9272 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9277 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9277 thiss!1204) (size!4453 (buf!4939 (_2!9184 lt!307215)))) (and (= (currentBit!9272 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9277 thiss!1204) (size!4453 (buf!4939 (_2!9184 lt!307215))))))))))

(assert (=> b!197392 d!66791))

(declare-fun b!197720 () Bool)

(declare-fun res!165504 () Bool)

(declare-fun e!135756 () Bool)

(assert (=> b!197720 (=> (not res!165504) (not e!135756))))

(declare-fun lt!307928 () tuple2!17072)

(assert (=> b!197720 (= res!165504 (isPrefixOf!0 (_2!9181 lt!307928) (_2!9184 lt!307233)))))

(declare-fun b!197721 () Bool)

(declare-fun e!135755 () Unit!13971)

(declare-fun Unit!13989 () Unit!13971)

(assert (=> b!197721 (= e!135755 Unit!13989)))

(declare-fun b!197723 () Bool)

(declare-fun lt!307931 () Unit!13971)

(assert (=> b!197723 (= e!135755 lt!307931)))

(declare-fun lt!307926 () (_ BitVec 64))

(assert (=> b!197723 (= lt!307926 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!307914 () (_ BitVec 64))

(assert (=> b!197723 (= lt!307914 (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307215))) (currentByte!9277 (_2!9184 lt!307215)) (currentBit!9272 (_2!9184 lt!307215))))))

(assert (=> b!197723 (= lt!307931 (arrayBitRangesEqSymmetric!0 (buf!4939 (_2!9184 lt!307215)) (buf!4939 (_2!9184 lt!307233)) lt!307926 lt!307914))))

(assert (=> b!197723 (arrayBitRangesEq!0 (buf!4939 (_2!9184 lt!307233)) (buf!4939 (_2!9184 lt!307215)) lt!307926 lt!307914)))

(declare-fun b!197724 () Bool)

(declare-fun lt!307925 () (_ BitVec 64))

(declare-fun lt!307923 () (_ BitVec 64))

(assert (=> b!197724 (= e!135756 (= (_1!9181 lt!307928) (withMovedBitIndex!0 (_2!9181 lt!307928) (bvsub lt!307925 lt!307923))))))

(assert (=> b!197724 (or (= (bvand lt!307925 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!307923 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!307925 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!307925 lt!307923) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!197724 (= lt!307923 (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307233))) (currentByte!9277 (_2!9184 lt!307233)) (currentBit!9272 (_2!9184 lt!307233))))))

(assert (=> b!197724 (= lt!307925 (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307215))) (currentByte!9277 (_2!9184 lt!307215)) (currentBit!9272 (_2!9184 lt!307215))))))

(declare-fun d!66793 () Bool)

(assert (=> d!66793 e!135756))

(declare-fun res!165505 () Bool)

(assert (=> d!66793 (=> (not res!165505) (not e!135756))))

(assert (=> d!66793 (= res!165505 (isPrefixOf!0 (_1!9181 lt!307928) (_2!9181 lt!307928)))))

(declare-fun lt!307917 () BitStream!8014)

(assert (=> d!66793 (= lt!307928 (tuple2!17073 lt!307917 (_2!9184 lt!307233)))))

(declare-fun lt!307913 () Unit!13971)

(declare-fun lt!307918 () Unit!13971)

(assert (=> d!66793 (= lt!307913 lt!307918)))

(assert (=> d!66793 (isPrefixOf!0 lt!307917 (_2!9184 lt!307233))))

(assert (=> d!66793 (= lt!307918 (lemmaIsPrefixTransitive!0 lt!307917 (_2!9184 lt!307233) (_2!9184 lt!307233)))))

(declare-fun lt!307912 () Unit!13971)

(declare-fun lt!307916 () Unit!13971)

(assert (=> d!66793 (= lt!307912 lt!307916)))

(assert (=> d!66793 (isPrefixOf!0 lt!307917 (_2!9184 lt!307233))))

(assert (=> d!66793 (= lt!307916 (lemmaIsPrefixTransitive!0 lt!307917 (_2!9184 lt!307215) (_2!9184 lt!307233)))))

(declare-fun lt!307921 () Unit!13971)

(assert (=> d!66793 (= lt!307921 e!135755)))

(declare-fun c!9825 () Bool)

(assert (=> d!66793 (= c!9825 (not (= (size!4453 (buf!4939 (_2!9184 lt!307215))) #b00000000000000000000000000000000)))))

(declare-fun lt!307927 () Unit!13971)

(declare-fun lt!307924 () Unit!13971)

(assert (=> d!66793 (= lt!307927 lt!307924)))

(assert (=> d!66793 (isPrefixOf!0 (_2!9184 lt!307233) (_2!9184 lt!307233))))

(assert (=> d!66793 (= lt!307924 (lemmaIsPrefixRefl!0 (_2!9184 lt!307233)))))

(declare-fun lt!307922 () Unit!13971)

(declare-fun lt!307920 () Unit!13971)

(assert (=> d!66793 (= lt!307922 lt!307920)))

(assert (=> d!66793 (= lt!307920 (lemmaIsPrefixRefl!0 (_2!9184 lt!307233)))))

(declare-fun lt!307929 () Unit!13971)

(declare-fun lt!307915 () Unit!13971)

(assert (=> d!66793 (= lt!307929 lt!307915)))

(assert (=> d!66793 (isPrefixOf!0 lt!307917 lt!307917)))

(assert (=> d!66793 (= lt!307915 (lemmaIsPrefixRefl!0 lt!307917))))

(declare-fun lt!307919 () Unit!13971)

(declare-fun lt!307930 () Unit!13971)

(assert (=> d!66793 (= lt!307919 lt!307930)))

(assert (=> d!66793 (isPrefixOf!0 (_2!9184 lt!307215) (_2!9184 lt!307215))))

(assert (=> d!66793 (= lt!307930 (lemmaIsPrefixRefl!0 (_2!9184 lt!307215)))))

(assert (=> d!66793 (= lt!307917 (BitStream!8015 (buf!4939 (_2!9184 lt!307233)) (currentByte!9277 (_2!9184 lt!307215)) (currentBit!9272 (_2!9184 lt!307215))))))

(assert (=> d!66793 (isPrefixOf!0 (_2!9184 lt!307215) (_2!9184 lt!307233))))

(assert (=> d!66793 (= (reader!0 (_2!9184 lt!307215) (_2!9184 lt!307233)) lt!307928)))

(declare-fun b!197722 () Bool)

(declare-fun res!165503 () Bool)

(assert (=> b!197722 (=> (not res!165503) (not e!135756))))

(assert (=> b!197722 (= res!165503 (isPrefixOf!0 (_1!9181 lt!307928) (_2!9184 lt!307215)))))

(assert (= (and d!66793 c!9825) b!197723))

(assert (= (and d!66793 (not c!9825)) b!197721))

(assert (= (and d!66793 res!165505) b!197722))

(assert (= (and b!197722 res!165503) b!197720))

(assert (= (and b!197720 res!165504) b!197724))

(declare-fun m!305529 () Bool)

(assert (=> b!197720 m!305529))

(assert (=> b!197723 m!304999))

(declare-fun m!305531 () Bool)

(assert (=> b!197723 m!305531))

(declare-fun m!305533 () Bool)

(assert (=> b!197723 m!305533))

(declare-fun m!305535 () Bool)

(assert (=> b!197724 m!305535))

(assert (=> b!197724 m!304983))

(assert (=> b!197724 m!304999))

(assert (=> d!66793 m!305447))

(assert (=> d!66793 m!305507))

(declare-fun m!305537 () Bool)

(assert (=> d!66793 m!305537))

(declare-fun m!305539 () Bool)

(assert (=> d!66793 m!305539))

(declare-fun m!305541 () Bool)

(assert (=> d!66793 m!305541))

(declare-fun m!305543 () Bool)

(assert (=> d!66793 m!305543))

(assert (=> d!66793 m!305517))

(assert (=> d!66793 m!304993))

(declare-fun m!305545 () Bool)

(assert (=> d!66793 m!305545))

(declare-fun m!305547 () Bool)

(assert (=> d!66793 m!305547))

(declare-fun m!305549 () Bool)

(assert (=> d!66793 m!305549))

(declare-fun m!305551 () Bool)

(assert (=> b!197722 m!305551))

(assert (=> b!197392 d!66793))

(declare-fun d!66795 () Bool)

(declare-fun e!135757 () Bool)

(assert (=> d!66795 e!135757))

(declare-fun res!165506 () Bool)

(assert (=> d!66795 (=> (not res!165506) (not e!135757))))

(declare-fun lt!307934 () (_ BitVec 64))

(declare-fun lt!307932 () (_ BitVec 64))

(declare-fun lt!307935 () (_ BitVec 64))

(assert (=> d!66795 (= res!165506 (= lt!307932 (bvsub lt!307935 lt!307934)))))

(assert (=> d!66795 (or (= (bvand lt!307935 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!307934 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!307935 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!307935 lt!307934) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66795 (= lt!307934 (remainingBits!0 ((_ sign_extend 32) (size!4453 (buf!4939 (_1!9182 lt!307222)))) ((_ sign_extend 32) (currentByte!9277 (_1!9182 lt!307222))) ((_ sign_extend 32) (currentBit!9272 (_1!9182 lt!307222)))))))

(declare-fun lt!307933 () (_ BitVec 64))

(declare-fun lt!307937 () (_ BitVec 64))

(assert (=> d!66795 (= lt!307935 (bvmul lt!307933 lt!307937))))

(assert (=> d!66795 (or (= lt!307933 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!307937 (bvsdiv (bvmul lt!307933 lt!307937) lt!307933)))))

(assert (=> d!66795 (= lt!307937 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66795 (= lt!307933 ((_ sign_extend 32) (size!4453 (buf!4939 (_1!9182 lt!307222)))))))

(assert (=> d!66795 (= lt!307932 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9277 (_1!9182 lt!307222))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9272 (_1!9182 lt!307222)))))))

(assert (=> d!66795 (invariant!0 (currentBit!9272 (_1!9182 lt!307222)) (currentByte!9277 (_1!9182 lt!307222)) (size!4453 (buf!4939 (_1!9182 lt!307222))))))

(assert (=> d!66795 (= (bitIndex!0 (size!4453 (buf!4939 (_1!9182 lt!307222))) (currentByte!9277 (_1!9182 lt!307222)) (currentBit!9272 (_1!9182 lt!307222))) lt!307932)))

(declare-fun b!197725 () Bool)

(declare-fun res!165507 () Bool)

(assert (=> b!197725 (=> (not res!165507) (not e!135757))))

(assert (=> b!197725 (= res!165507 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!307932))))

(declare-fun b!197726 () Bool)

(declare-fun lt!307936 () (_ BitVec 64))

(assert (=> b!197726 (= e!135757 (bvsle lt!307932 (bvmul lt!307936 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!197726 (or (= lt!307936 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!307936 #b0000000000000000000000000000000000000000000000000000000000001000) lt!307936)))))

(assert (=> b!197726 (= lt!307936 ((_ sign_extend 32) (size!4453 (buf!4939 (_1!9182 lt!307222)))))))

(assert (= (and d!66795 res!165506) b!197725))

(assert (= (and b!197725 res!165507) b!197726))

(declare-fun m!305553 () Bool)

(assert (=> d!66795 m!305553))

(declare-fun m!305555 () Bool)

(assert (=> d!66795 m!305555))

(assert (=> b!197402 d!66795))

(push 1)

(assert (not d!66777))

(assert (not b!197717))

(assert (not b!197690))

(assert (not d!66795))

(assert (not bm!3101))

(assert (not d!66679))

(assert (not d!66753))

(assert (not b!197685))

(assert (not d!66661))

(assert (not d!66763))

(assert (not b!197718))

(assert (not b!197720))

(assert (not b!197715))

(assert (not b!197522))

(assert (not d!66659))

(assert (not b!197525))

(assert (not d!66755))

(assert (not b!197722))

(assert (not b!197551))

(assert (not b!197693))

(assert (not d!66767))

(assert (not b!197688))

(assert (not b!197719))

(assert (not b!197682))

(assert (not d!66781))

(assert (not d!66657))

(assert (not d!66793))

(assert (not d!66663))

(assert (not b!197519))

(assert (not b!197686))

(assert (not d!66675))

(assert (not d!66769))

(assert (not b!197687))

(assert (not b!197544))

(assert (not d!66789))

(assert (not d!66785))

(assert (not d!66773))

(assert (not d!66783))

(assert (not b!197517))

(assert (not d!66671))

(assert (not d!66655))

(assert (not d!66765))

(assert (not b!197549))

(assert (not b!197546))

(assert (not d!66779))

(assert (not b!197543))

(assert (not b!197697))

(assert (not b!197684))

(assert (not b!197545))

(assert (not d!66787))

(assert (not b!197520))

(assert (not d!66771))

(assert (not b!197724))

(assert (not b!197723))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(assert (=> b!197520 d!66659))

(assert (=> b!197520 d!66671))

(declare-fun d!67295 () Bool)

(declare-fun e!136139 () Bool)

(assert (=> d!67295 e!136139))

(declare-fun res!165984 () Bool)

(assert (=> d!67295 (=> (not res!165984) (not e!136139))))

(declare-fun lt!309100 () (_ BitVec 64))

(declare-fun lt!309099 () (_ BitVec 64))

(declare-fun lt!309097 () (_ BitVec 64))

(assert (=> d!67295 (= res!165984 (= lt!309097 (bvsub lt!309100 lt!309099)))))

(assert (=> d!67295 (or (= (bvand lt!309100 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!309099 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!309100 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!309100 lt!309099) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67295 (= lt!309099 (remainingBits!0 ((_ sign_extend 32) (size!4453 (buf!4939 (_2!9184 lt!307417)))) ((_ sign_extend 32) (currentByte!9277 (_2!9184 lt!307417))) ((_ sign_extend 32) (currentBit!9272 (_2!9184 lt!307417)))))))

(declare-fun lt!309098 () (_ BitVec 64))

(declare-fun lt!309102 () (_ BitVec 64))

(assert (=> d!67295 (= lt!309100 (bvmul lt!309098 lt!309102))))

(assert (=> d!67295 (or (= lt!309098 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!309102 (bvsdiv (bvmul lt!309098 lt!309102) lt!309098)))))

(assert (=> d!67295 (= lt!309102 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!67295 (= lt!309098 ((_ sign_extend 32) (size!4453 (buf!4939 (_2!9184 lt!307417)))))))

(assert (=> d!67295 (= lt!309097 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9277 (_2!9184 lt!307417))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9272 (_2!9184 lt!307417)))))))

(assert (=> d!67295 (invariant!0 (currentBit!9272 (_2!9184 lt!307417)) (currentByte!9277 (_2!9184 lt!307417)) (size!4453 (buf!4939 (_2!9184 lt!307417))))))

(assert (=> d!67295 (= (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307417))) (currentByte!9277 (_2!9184 lt!307417)) (currentBit!9272 (_2!9184 lt!307417))) lt!309097)))

(declare-fun b!198305 () Bool)

(declare-fun res!165985 () Bool)

(assert (=> b!198305 (=> (not res!165985) (not e!136139))))

(assert (=> b!198305 (= res!165985 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!309097))))

(declare-fun b!198306 () Bool)

(declare-fun lt!309101 () (_ BitVec 64))

(assert (=> b!198306 (= e!136139 (bvsle lt!309097 (bvmul lt!309101 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!198306 (or (= lt!309101 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!309101 #b0000000000000000000000000000000000000000000000000000000000001000) lt!309101)))))

(assert (=> b!198306 (= lt!309101 ((_ sign_extend 32) (size!4453 (buf!4939 (_2!9184 lt!307417)))))))

(assert (= (and d!67295 res!165984) b!198305))

(assert (= (and b!198305 res!165985) b!198306))

(declare-fun m!306945 () Bool)

(assert (=> d!67295 m!306945))

(declare-fun m!306947 () Bool)

(assert (=> d!67295 m!306947))

(assert (=> b!197543 d!67295))

(assert (=> b!197543 d!66661))

(declare-fun d!67297 () Bool)

(assert (=> d!67297 (isPrefixOf!0 (_2!9184 lt!307215) (_2!9184 lt!307215))))

(declare-fun lt!309105 () Unit!13971)

(declare-fun choose!11 (BitStream!8014) Unit!13971)

(assert (=> d!67297 (= lt!309105 (choose!11 (_2!9184 lt!307215)))))

(assert (=> d!67297 (= (lemmaIsPrefixRefl!0 (_2!9184 lt!307215)) lt!309105)))

(declare-fun bs!16666 () Bool)

(assert (= bs!16666 d!67297))

(assert (=> bs!16666 m!305549))

(declare-fun m!306949 () Bool)

(assert (=> bs!16666 m!306949))

(assert (=> b!197690 d!67297))

(assert (=> d!66767 d!66779))

(declare-fun d!67299 () Bool)

(assert (=> d!67299 (validate_offset_bits!1 ((_ sign_extend 32) (size!4453 (buf!4939 (_2!9184 lt!307233)))) ((_ sign_extend 32) (currentByte!9277 thiss!1204)) ((_ sign_extend 32) (currentBit!9272 thiss!1204)) lt!307229)))

(assert (=> d!67299 true))

(declare-fun _$6!371 () Unit!13971)

(assert (=> d!67299 (= (choose!9 thiss!1204 (buf!4939 (_2!9184 lt!307233)) lt!307229 (BitStream!8015 (buf!4939 (_2!9184 lt!307233)) (currentByte!9277 thiss!1204) (currentBit!9272 thiss!1204))) _$6!371)))

(declare-fun bs!16667 () Bool)

(assert (= bs!16667 d!67299))

(assert (=> bs!16667 m!305017))

(assert (=> d!66767 d!67299))

(declare-fun d!67301 () Bool)

(declare-fun e!136142 () Bool)

(assert (=> d!67301 e!136142))

(declare-fun res!165988 () Bool)

(assert (=> d!67301 (=> (not res!165988) (not e!136142))))

(declare-fun lt!309111 () (_ BitVec 64))

(declare-fun lt!309110 () BitStream!8014)

(assert (=> d!67301 (= res!165988 (= (bvadd lt!309111 (bvsub lt!307904 lt!307902)) (bitIndex!0 (size!4453 (buf!4939 lt!309110)) (currentByte!9277 lt!309110) (currentBit!9272 lt!309110))))))

(assert (=> d!67301 (or (not (= (bvand lt!309111 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!307904 lt!307902) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!309111 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!309111 (bvsub lt!307904 lt!307902)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67301 (= lt!309111 (bitIndex!0 (size!4453 (buf!4939 (_2!9181 lt!307907))) (currentByte!9277 (_2!9181 lt!307907)) (currentBit!9272 (_2!9181 lt!307907))))))

(declare-fun moveBitIndex!0 (BitStream!8014 (_ BitVec 64)) tuple2!17078)

(assert (=> d!67301 (= lt!309110 (_2!9184 (moveBitIndex!0 (_2!9181 lt!307907) (bvsub lt!307904 lt!307902))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!8014 (_ BitVec 64)) Bool)

(assert (=> d!67301 (moveBitIndexPrecond!0 (_2!9181 lt!307907) (bvsub lt!307904 lt!307902))))

(assert (=> d!67301 (= (withMovedBitIndex!0 (_2!9181 lt!307907) (bvsub lt!307904 lt!307902)) lt!309110)))

(declare-fun b!198309 () Bool)

(assert (=> b!198309 (= e!136142 (= (size!4453 (buf!4939 (_2!9181 lt!307907))) (size!4453 (buf!4939 lt!309110))))))

(assert (= (and d!67301 res!165988) b!198309))

(declare-fun m!306951 () Bool)

(assert (=> d!67301 m!306951))

(declare-fun m!306953 () Bool)

(assert (=> d!67301 m!306953))

(declare-fun m!306955 () Bool)

(assert (=> d!67301 m!306955))

(declare-fun m!306957 () Bool)

(assert (=> d!67301 m!306957))

(assert (=> b!197719 d!67301))

(assert (=> b!197719 d!66671))

(assert (=> b!197719 d!66661))

(declare-fun d!67303 () Bool)

(declare-fun res!165989 () Bool)

(declare-fun e!136143 () Bool)

(assert (=> d!67303 (=> (not res!165989) (not e!136143))))

(assert (=> d!67303 (= res!165989 (= (size!4453 (buf!4939 (_1!9181 lt!307907))) (size!4453 (buf!4939 thiss!1204))))))

(assert (=> d!67303 (= (isPrefixOf!0 (_1!9181 lt!307907) thiss!1204) e!136143)))

(declare-fun b!198310 () Bool)

(declare-fun res!165990 () Bool)

(assert (=> b!198310 (=> (not res!165990) (not e!136143))))

(assert (=> b!198310 (= res!165990 (bvsle (bitIndex!0 (size!4453 (buf!4939 (_1!9181 lt!307907))) (currentByte!9277 (_1!9181 lt!307907)) (currentBit!9272 (_1!9181 lt!307907))) (bitIndex!0 (size!4453 (buf!4939 thiss!1204)) (currentByte!9277 thiss!1204) (currentBit!9272 thiss!1204))))))

(declare-fun b!198311 () Bool)

(declare-fun e!136144 () Bool)

(assert (=> b!198311 (= e!136143 e!136144)))

(declare-fun res!165991 () Bool)

(assert (=> b!198311 (=> res!165991 e!136144)))

(assert (=> b!198311 (= res!165991 (= (size!4453 (buf!4939 (_1!9181 lt!307907))) #b00000000000000000000000000000000))))

(declare-fun b!198312 () Bool)

(assert (=> b!198312 (= e!136144 (arrayBitRangesEq!0 (buf!4939 (_1!9181 lt!307907)) (buf!4939 thiss!1204) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4453 (buf!4939 (_1!9181 lt!307907))) (currentByte!9277 (_1!9181 lt!307907)) (currentBit!9272 (_1!9181 lt!307907)))))))

(assert (= (and d!67303 res!165989) b!198310))

(assert (= (and b!198310 res!165990) b!198311))

(assert (= (and b!198311 (not res!165991)) b!198312))

(declare-fun m!306959 () Bool)

(assert (=> b!198310 m!306959))

(assert (=> b!198310 m!305001))

(assert (=> b!198312 m!306959))

(assert (=> b!198312 m!306959))

(declare-fun m!306961 () Bool)

(assert (=> b!198312 m!306961))

(assert (=> b!197717 d!67303))

(declare-fun d!67305 () Bool)

(assert (=> d!67305 (= (remainingBits!0 ((_ sign_extend 32) (size!4453 (buf!4939 (_2!9184 lt!307233)))) ((_ sign_extend 32) (currentByte!9277 thiss!1204)) ((_ sign_extend 32) (currentBit!9272 thiss!1204))) (bvsub (bvmul ((_ sign_extend 32) (size!4453 (buf!4939 (_2!9184 lt!307233)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9277 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9272 thiss!1204)))))))

(assert (=> d!66779 d!67305))

(assert (=> d!66753 d!66759))

(declare-fun d!67307 () Bool)

(assert (=> d!67307 (= (invariant!0 (currentBit!9272 (_2!9184 lt!307215)) (currentByte!9277 (_2!9184 lt!307215)) (size!4453 (buf!4939 (_2!9184 lt!307215)))) (and (bvsge (currentBit!9272 (_2!9184 lt!307215)) #b00000000000000000000000000000000) (bvslt (currentBit!9272 (_2!9184 lt!307215)) #b00000000000000000000000000001000) (bvsge (currentByte!9277 (_2!9184 lt!307215)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9277 (_2!9184 lt!307215)) (size!4453 (buf!4939 (_2!9184 lt!307215)))) (and (= (currentBit!9272 (_2!9184 lt!307215)) #b00000000000000000000000000000000) (= (currentByte!9277 (_2!9184 lt!307215)) (size!4453 (buf!4939 (_2!9184 lt!307215))))))))))

(assert (=> d!66657 d!67307))

(declare-fun d!67309 () Bool)

(assert (=> d!67309 (= (remainingBits!0 ((_ sign_extend 32) (size!4453 (buf!4939 (_1!9182 lt!307236)))) ((_ sign_extend 32) (currentByte!9277 (_1!9182 lt!307236))) ((_ sign_extend 32) (currentBit!9272 (_1!9182 lt!307236)))) (bvsub (bvmul ((_ sign_extend 32) (size!4453 (buf!4939 (_1!9182 lt!307236)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9277 (_1!9182 lt!307236))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9272 (_1!9182 lt!307236))))))))

(assert (=> d!66771 d!67309))

(declare-fun d!67311 () Bool)

(assert (=> d!67311 (= (invariant!0 (currentBit!9272 (_1!9182 lt!307236)) (currentByte!9277 (_1!9182 lt!307236)) (size!4453 (buf!4939 (_1!9182 lt!307236)))) (and (bvsge (currentBit!9272 (_1!9182 lt!307236)) #b00000000000000000000000000000000) (bvslt (currentBit!9272 (_1!9182 lt!307236)) #b00000000000000000000000000001000) (bvsge (currentByte!9277 (_1!9182 lt!307236)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9277 (_1!9182 lt!307236)) (size!4453 (buf!4939 (_1!9182 lt!307236)))) (and (= (currentBit!9272 (_1!9182 lt!307236)) #b00000000000000000000000000000000) (= (currentByte!9277 (_1!9182 lt!307236)) (size!4453 (buf!4939 (_1!9182 lt!307236))))))))))

(assert (=> d!66771 d!67311))

(declare-fun d!67313 () Bool)

(assert (=> d!67313 (isPrefixOf!0 lt!307917 lt!307917)))

(declare-fun lt!309112 () Unit!13971)

(assert (=> d!67313 (= lt!309112 (choose!11 lt!307917))))

(assert (=> d!67313 (= (lemmaIsPrefixRefl!0 lt!307917) lt!309112)))

(declare-fun bs!16668 () Bool)

(assert (= bs!16668 d!67313))

(assert (=> bs!16668 m!305539))

(declare-fun m!306963 () Bool)

(assert (=> bs!16668 m!306963))

(assert (=> d!66793 d!67313))

(declare-fun d!67315 () Bool)

(assert (=> d!67315 (isPrefixOf!0 lt!307917 (_2!9184 lt!307233))))

(declare-fun lt!309113 () Unit!13971)

(assert (=> d!67315 (= lt!309113 (choose!30 lt!307917 (_2!9184 lt!307233) (_2!9184 lt!307233)))))

(assert (=> d!67315 (isPrefixOf!0 lt!307917 (_2!9184 lt!307233))))

(assert (=> d!67315 (= (lemmaIsPrefixTransitive!0 lt!307917 (_2!9184 lt!307233) (_2!9184 lt!307233)) lt!309113)))

(declare-fun bs!16669 () Bool)

(assert (= bs!16669 d!67315))

(assert (=> bs!16669 m!305541))

(declare-fun m!306965 () Bool)

(assert (=> bs!16669 m!306965))

(assert (=> bs!16669 m!305541))

(assert (=> d!66793 d!67315))

(declare-fun d!67317 () Bool)

(assert (=> d!67317 (isPrefixOf!0 (_2!9184 lt!307233) (_2!9184 lt!307233))))

(declare-fun lt!309114 () Unit!13971)

(assert (=> d!67317 (= lt!309114 (choose!11 (_2!9184 lt!307233)))))

(assert (=> d!67317 (= (lemmaIsPrefixRefl!0 (_2!9184 lt!307233)) lt!309114)))

(declare-fun bs!16670 () Bool)

(assert (= bs!16670 d!67317))

(assert (=> bs!16670 m!305507))

(declare-fun m!306967 () Bool)

(assert (=> bs!16670 m!306967))

(assert (=> d!66793 d!67317))

(declare-fun d!67319 () Bool)

(assert (=> d!67319 (isPrefixOf!0 lt!307917 (_2!9184 lt!307233))))

(declare-fun lt!309115 () Unit!13971)

(assert (=> d!67319 (= lt!309115 (choose!30 lt!307917 (_2!9184 lt!307215) (_2!9184 lt!307233)))))

(assert (=> d!67319 (isPrefixOf!0 lt!307917 (_2!9184 lt!307215))))

(assert (=> d!67319 (= (lemmaIsPrefixTransitive!0 lt!307917 (_2!9184 lt!307215) (_2!9184 lt!307233)) lt!309115)))

(declare-fun bs!16671 () Bool)

(assert (= bs!16671 d!67319))

(assert (=> bs!16671 m!305541))

(declare-fun m!306969 () Bool)

(assert (=> bs!16671 m!306969))

(declare-fun m!306971 () Bool)

(assert (=> bs!16671 m!306971))

(assert (=> d!66793 d!67319))

(declare-fun d!67321 () Bool)

(declare-fun res!165992 () Bool)

(declare-fun e!136145 () Bool)

(assert (=> d!67321 (=> (not res!165992) (not e!136145))))

(assert (=> d!67321 (= res!165992 (= (size!4453 (buf!4939 lt!307917)) (size!4453 (buf!4939 lt!307917))))))

(assert (=> d!67321 (= (isPrefixOf!0 lt!307917 lt!307917) e!136145)))

(declare-fun b!198313 () Bool)

(declare-fun res!165993 () Bool)

(assert (=> b!198313 (=> (not res!165993) (not e!136145))))

(assert (=> b!198313 (= res!165993 (bvsle (bitIndex!0 (size!4453 (buf!4939 lt!307917)) (currentByte!9277 lt!307917) (currentBit!9272 lt!307917)) (bitIndex!0 (size!4453 (buf!4939 lt!307917)) (currentByte!9277 lt!307917) (currentBit!9272 lt!307917))))))

(declare-fun b!198314 () Bool)

(declare-fun e!136146 () Bool)

(assert (=> b!198314 (= e!136145 e!136146)))

(declare-fun res!165994 () Bool)

(assert (=> b!198314 (=> res!165994 e!136146)))

(assert (=> b!198314 (= res!165994 (= (size!4453 (buf!4939 lt!307917)) #b00000000000000000000000000000000))))

(declare-fun b!198315 () Bool)

(assert (=> b!198315 (= e!136146 (arrayBitRangesEq!0 (buf!4939 lt!307917) (buf!4939 lt!307917) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4453 (buf!4939 lt!307917)) (currentByte!9277 lt!307917) (currentBit!9272 lt!307917))))))

(assert (= (and d!67321 res!165992) b!198313))

(assert (= (and b!198313 res!165993) b!198314))

(assert (= (and b!198314 (not res!165994)) b!198315))

(declare-fun m!306973 () Bool)

(assert (=> b!198313 m!306973))

(assert (=> b!198313 m!306973))

(assert (=> b!198315 m!306973))

(assert (=> b!198315 m!306973))

(declare-fun m!306975 () Bool)

(assert (=> b!198315 m!306975))

(assert (=> d!66793 d!67321))

(assert (=> d!66793 d!67297))

(declare-fun d!67323 () Bool)

(declare-fun res!165995 () Bool)

(declare-fun e!136147 () Bool)

(assert (=> d!67323 (=> (not res!165995) (not e!136147))))

(assert (=> d!67323 (= res!165995 (= (size!4453 (buf!4939 lt!307917)) (size!4453 (buf!4939 (_2!9184 lt!307233)))))))

(assert (=> d!67323 (= (isPrefixOf!0 lt!307917 (_2!9184 lt!307233)) e!136147)))

(declare-fun b!198316 () Bool)

(declare-fun res!165996 () Bool)

(assert (=> b!198316 (=> (not res!165996) (not e!136147))))

(assert (=> b!198316 (= res!165996 (bvsle (bitIndex!0 (size!4453 (buf!4939 lt!307917)) (currentByte!9277 lt!307917) (currentBit!9272 lt!307917)) (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307233))) (currentByte!9277 (_2!9184 lt!307233)) (currentBit!9272 (_2!9184 lt!307233)))))))

(declare-fun b!198317 () Bool)

(declare-fun e!136148 () Bool)

(assert (=> b!198317 (= e!136147 e!136148)))

(declare-fun res!165997 () Bool)

(assert (=> b!198317 (=> res!165997 e!136148)))

(assert (=> b!198317 (= res!165997 (= (size!4453 (buf!4939 lt!307917)) #b00000000000000000000000000000000))))

(declare-fun b!198318 () Bool)

(assert (=> b!198318 (= e!136148 (arrayBitRangesEq!0 (buf!4939 lt!307917) (buf!4939 (_2!9184 lt!307233)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4453 (buf!4939 lt!307917)) (currentByte!9277 lt!307917) (currentBit!9272 lt!307917))))))

(assert (= (and d!67323 res!165995) b!198316))

(assert (= (and b!198316 res!165996) b!198317))

(assert (= (and b!198317 (not res!165997)) b!198318))

(assert (=> b!198316 m!306973))

(assert (=> b!198316 m!304983))

(assert (=> b!198318 m!306973))

(assert (=> b!198318 m!306973))

(declare-fun m!306977 () Bool)

(assert (=> b!198318 m!306977))

(assert (=> d!66793 d!67323))

(declare-fun d!67325 () Bool)

(declare-fun res!165998 () Bool)

(declare-fun e!136149 () Bool)

(assert (=> d!67325 (=> (not res!165998) (not e!136149))))

(assert (=> d!67325 (= res!165998 (= (size!4453 (buf!4939 (_2!9184 lt!307215))) (size!4453 (buf!4939 (_2!9184 lt!307215)))))))

(assert (=> d!67325 (= (isPrefixOf!0 (_2!9184 lt!307215) (_2!9184 lt!307215)) e!136149)))

(declare-fun b!198319 () Bool)

(declare-fun res!165999 () Bool)

(assert (=> b!198319 (=> (not res!165999) (not e!136149))))

(assert (=> b!198319 (= res!165999 (bvsle (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307215))) (currentByte!9277 (_2!9184 lt!307215)) (currentBit!9272 (_2!9184 lt!307215))) (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307215))) (currentByte!9277 (_2!9184 lt!307215)) (currentBit!9272 (_2!9184 lt!307215)))))))

(declare-fun b!198320 () Bool)

(declare-fun e!136150 () Bool)

(assert (=> b!198320 (= e!136149 e!136150)))

(declare-fun res!166000 () Bool)

(assert (=> b!198320 (=> res!166000 e!136150)))

(assert (=> b!198320 (= res!166000 (= (size!4453 (buf!4939 (_2!9184 lt!307215))) #b00000000000000000000000000000000))))

(declare-fun b!198321 () Bool)

(assert (=> b!198321 (= e!136150 (arrayBitRangesEq!0 (buf!4939 (_2!9184 lt!307215)) (buf!4939 (_2!9184 lt!307215)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307215))) (currentByte!9277 (_2!9184 lt!307215)) (currentBit!9272 (_2!9184 lt!307215)))))))

(assert (= (and d!67325 res!165998) b!198319))

(assert (= (and b!198319 res!165999) b!198320))

(assert (= (and b!198320 (not res!166000)) b!198321))

(assert (=> b!198319 m!304999))

(assert (=> b!198319 m!304999))

(assert (=> b!198321 m!304999))

(assert (=> b!198321 m!304999))

(declare-fun m!306979 () Bool)

(assert (=> b!198321 m!306979))

(assert (=> d!66793 d!67325))

(assert (=> d!66793 d!66653))

(declare-fun d!67327 () Bool)

(declare-fun res!166001 () Bool)

(declare-fun e!136151 () Bool)

(assert (=> d!67327 (=> (not res!166001) (not e!136151))))

(assert (=> d!67327 (= res!166001 (= (size!4453 (buf!4939 (_2!9184 lt!307233))) (size!4453 (buf!4939 (_2!9184 lt!307233)))))))

(assert (=> d!67327 (= (isPrefixOf!0 (_2!9184 lt!307233) (_2!9184 lt!307233)) e!136151)))

(declare-fun b!198322 () Bool)

(declare-fun res!166002 () Bool)

(assert (=> b!198322 (=> (not res!166002) (not e!136151))))

(assert (=> b!198322 (= res!166002 (bvsle (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307233))) (currentByte!9277 (_2!9184 lt!307233)) (currentBit!9272 (_2!9184 lt!307233))) (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307233))) (currentByte!9277 (_2!9184 lt!307233)) (currentBit!9272 (_2!9184 lt!307233)))))))

(declare-fun b!198323 () Bool)

(declare-fun e!136152 () Bool)

(assert (=> b!198323 (= e!136151 e!136152)))

(declare-fun res!166003 () Bool)

(assert (=> b!198323 (=> res!166003 e!136152)))

(assert (=> b!198323 (= res!166003 (= (size!4453 (buf!4939 (_2!9184 lt!307233))) #b00000000000000000000000000000000))))

(declare-fun b!198324 () Bool)

(assert (=> b!198324 (= e!136152 (arrayBitRangesEq!0 (buf!4939 (_2!9184 lt!307233)) (buf!4939 (_2!9184 lt!307233)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307233))) (currentByte!9277 (_2!9184 lt!307233)) (currentBit!9272 (_2!9184 lt!307233)))))))

(assert (= (and d!67327 res!166001) b!198322))

(assert (= (and b!198322 res!166002) b!198323))

(assert (= (and b!198323 (not res!166003)) b!198324))

(assert (=> b!198322 m!304983))

(assert (=> b!198322 m!304983))

(assert (=> b!198324 m!304983))

(assert (=> b!198324 m!304983))

(declare-fun m!306981 () Bool)

(assert (=> b!198324 m!306981))

(assert (=> d!66793 d!67327))

(declare-fun d!67329 () Bool)

(declare-fun res!166004 () Bool)

(declare-fun e!136153 () Bool)

(assert (=> d!67329 (=> (not res!166004) (not e!136153))))

(assert (=> d!67329 (= res!166004 (= (size!4453 (buf!4939 (_1!9181 lt!307928))) (size!4453 (buf!4939 (_2!9181 lt!307928)))))))

(assert (=> d!67329 (= (isPrefixOf!0 (_1!9181 lt!307928) (_2!9181 lt!307928)) e!136153)))

(declare-fun b!198325 () Bool)

(declare-fun res!166005 () Bool)

(assert (=> b!198325 (=> (not res!166005) (not e!136153))))

(assert (=> b!198325 (= res!166005 (bvsle (bitIndex!0 (size!4453 (buf!4939 (_1!9181 lt!307928))) (currentByte!9277 (_1!9181 lt!307928)) (currentBit!9272 (_1!9181 lt!307928))) (bitIndex!0 (size!4453 (buf!4939 (_2!9181 lt!307928))) (currentByte!9277 (_2!9181 lt!307928)) (currentBit!9272 (_2!9181 lt!307928)))))))

(declare-fun b!198326 () Bool)

(declare-fun e!136154 () Bool)

(assert (=> b!198326 (= e!136153 e!136154)))

(declare-fun res!166006 () Bool)

(assert (=> b!198326 (=> res!166006 e!136154)))

(assert (=> b!198326 (= res!166006 (= (size!4453 (buf!4939 (_1!9181 lt!307928))) #b00000000000000000000000000000000))))

(declare-fun b!198327 () Bool)

(assert (=> b!198327 (= e!136154 (arrayBitRangesEq!0 (buf!4939 (_1!9181 lt!307928)) (buf!4939 (_2!9181 lt!307928)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4453 (buf!4939 (_1!9181 lt!307928))) (currentByte!9277 (_1!9181 lt!307928)) (currentBit!9272 (_1!9181 lt!307928)))))))

(assert (= (and d!67329 res!166004) b!198325))

(assert (= (and b!198325 res!166005) b!198326))

(assert (= (and b!198326 (not res!166006)) b!198327))

(declare-fun m!306983 () Bool)

(assert (=> b!198325 m!306983))

(declare-fun m!306985 () Bool)

(assert (=> b!198325 m!306985))

(assert (=> b!198327 m!306983))

(assert (=> b!198327 m!306983))

(declare-fun m!306987 () Bool)

(assert (=> b!198327 m!306987))

(assert (=> d!66793 d!67329))

(declare-fun d!67331 () Bool)

(declare-fun e!136155 () Bool)

(assert (=> d!67331 e!136155))

(declare-fun res!166007 () Bool)

(assert (=> d!67331 (=> (not res!166007) (not e!136155))))

(declare-fun lt!309119 () (_ BitVec 64))

(declare-fun lt!309116 () (_ BitVec 64))

(declare-fun lt!309118 () (_ BitVec 64))

(assert (=> d!67331 (= res!166007 (= lt!309116 (bvsub lt!309119 lt!309118)))))

(assert (=> d!67331 (or (= (bvand lt!309119 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!309118 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!309119 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!309119 lt!309118) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67331 (= lt!309118 (remainingBits!0 ((_ sign_extend 32) (size!4453 (buf!4939 (_2!9184 lt!307800)))) ((_ sign_extend 32) (currentByte!9277 (_2!9184 lt!307800))) ((_ sign_extend 32) (currentBit!9272 (_2!9184 lt!307800)))))))

(declare-fun lt!309117 () (_ BitVec 64))

(declare-fun lt!309121 () (_ BitVec 64))

(assert (=> d!67331 (= lt!309119 (bvmul lt!309117 lt!309121))))

(assert (=> d!67331 (or (= lt!309117 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!309121 (bvsdiv (bvmul lt!309117 lt!309121) lt!309117)))))

(assert (=> d!67331 (= lt!309121 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!67331 (= lt!309117 ((_ sign_extend 32) (size!4453 (buf!4939 (_2!9184 lt!307800)))))))

(assert (=> d!67331 (= lt!309116 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9277 (_2!9184 lt!307800))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9272 (_2!9184 lt!307800)))))))

(assert (=> d!67331 (invariant!0 (currentBit!9272 (_2!9184 lt!307800)) (currentByte!9277 (_2!9184 lt!307800)) (size!4453 (buf!4939 (_2!9184 lt!307800))))))

(assert (=> d!67331 (= (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307800))) (currentByte!9277 (_2!9184 lt!307800)) (currentBit!9272 (_2!9184 lt!307800))) lt!309116)))

(declare-fun b!198328 () Bool)

(declare-fun res!166008 () Bool)

(assert (=> b!198328 (=> (not res!166008) (not e!136155))))

(assert (=> b!198328 (= res!166008 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!309116))))

(declare-fun b!198329 () Bool)

(declare-fun lt!309120 () (_ BitVec 64))

(assert (=> b!198329 (= e!136155 (bvsle lt!309116 (bvmul lt!309120 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!198329 (or (= lt!309120 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!309120 #b0000000000000000000000000000000000000000000000000000000000001000) lt!309120)))))

(assert (=> b!198329 (= lt!309120 ((_ sign_extend 32) (size!4453 (buf!4939 (_2!9184 lt!307800)))))))

(assert (= (and d!67331 res!166007) b!198328))

(assert (= (and b!198328 res!166008) b!198329))

(declare-fun m!306989 () Bool)

(assert (=> d!67331 m!306989))

(declare-fun m!306991 () Bool)

(assert (=> d!67331 m!306991))

(assert (=> b!197687 d!67331))

(assert (=> b!197687 d!66659))

(declare-fun d!67333 () Bool)

(assert (=> d!67333 (= (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvadd #b00000000000000000000000000000001 i!590)))))))

(assert (=> b!197685 d!67333))

(declare-fun d!67335 () Bool)

(assert (=> d!67335 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4453 (buf!4939 (_2!9184 lt!307786)))) ((_ sign_extend 32) (currentByte!9277 (_2!9184 lt!307215))) ((_ sign_extend 32) (currentBit!9272 (_2!9184 lt!307215))) lt!307765) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4453 (buf!4939 (_2!9184 lt!307786)))) ((_ sign_extend 32) (currentByte!9277 (_2!9184 lt!307215))) ((_ sign_extend 32) (currentBit!9272 (_2!9184 lt!307215)))) lt!307765))))

(declare-fun bs!16672 () Bool)

(assert (= bs!16672 d!67335))

(declare-fun m!306993 () Bool)

(assert (=> bs!16672 m!306993))

(assert (=> b!197685 d!67335))

(declare-fun b!198330 () Bool)

(declare-fun res!166010 () Bool)

(declare-fun e!136157 () Bool)

(assert (=> b!198330 (=> (not res!166010) (not e!136157))))

(declare-fun lt!309138 () tuple2!17072)

(assert (=> b!198330 (= res!166010 (isPrefixOf!0 (_2!9181 lt!309138) (_2!9184 lt!307786)))))

(declare-fun b!198331 () Bool)

(declare-fun e!136156 () Unit!13971)

(declare-fun Unit!14044 () Unit!13971)

(assert (=> b!198331 (= e!136156 Unit!14044)))

(declare-fun b!198333 () Bool)

(declare-fun lt!309141 () Unit!13971)

(assert (=> b!198333 (= e!136156 lt!309141)))

(declare-fun lt!309136 () (_ BitVec 64))

(assert (=> b!198333 (= lt!309136 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!309124 () (_ BitVec 64))

(assert (=> b!198333 (= lt!309124 (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307215))) (currentByte!9277 (_2!9184 lt!307215)) (currentBit!9272 (_2!9184 lt!307215))))))

(assert (=> b!198333 (= lt!309141 (arrayBitRangesEqSymmetric!0 (buf!4939 (_2!9184 lt!307215)) (buf!4939 (_2!9184 lt!307786)) lt!309136 lt!309124))))

(assert (=> b!198333 (arrayBitRangesEq!0 (buf!4939 (_2!9184 lt!307786)) (buf!4939 (_2!9184 lt!307215)) lt!309136 lt!309124)))

(declare-fun lt!309135 () (_ BitVec 64))

(declare-fun b!198334 () Bool)

(declare-fun lt!309133 () (_ BitVec 64))

(assert (=> b!198334 (= e!136157 (= (_1!9181 lt!309138) (withMovedBitIndex!0 (_2!9181 lt!309138) (bvsub lt!309135 lt!309133))))))

(assert (=> b!198334 (or (= (bvand lt!309135 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!309133 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!309135 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!309135 lt!309133) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!198334 (= lt!309133 (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307786))) (currentByte!9277 (_2!9184 lt!307786)) (currentBit!9272 (_2!9184 lt!307786))))))

(assert (=> b!198334 (= lt!309135 (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307215))) (currentByte!9277 (_2!9184 lt!307215)) (currentBit!9272 (_2!9184 lt!307215))))))

(declare-fun d!67337 () Bool)

(assert (=> d!67337 e!136157))

(declare-fun res!166011 () Bool)

(assert (=> d!67337 (=> (not res!166011) (not e!136157))))

(assert (=> d!67337 (= res!166011 (isPrefixOf!0 (_1!9181 lt!309138) (_2!9181 lt!309138)))))

(declare-fun lt!309127 () BitStream!8014)

(assert (=> d!67337 (= lt!309138 (tuple2!17073 lt!309127 (_2!9184 lt!307786)))))

(declare-fun lt!309123 () Unit!13971)

(declare-fun lt!309128 () Unit!13971)

(assert (=> d!67337 (= lt!309123 lt!309128)))

(assert (=> d!67337 (isPrefixOf!0 lt!309127 (_2!9184 lt!307786))))

(assert (=> d!67337 (= lt!309128 (lemmaIsPrefixTransitive!0 lt!309127 (_2!9184 lt!307786) (_2!9184 lt!307786)))))

(declare-fun lt!309122 () Unit!13971)

(declare-fun lt!309126 () Unit!13971)

(assert (=> d!67337 (= lt!309122 lt!309126)))

(assert (=> d!67337 (isPrefixOf!0 lt!309127 (_2!9184 lt!307786))))

(assert (=> d!67337 (= lt!309126 (lemmaIsPrefixTransitive!0 lt!309127 (_2!9184 lt!307215) (_2!9184 lt!307786)))))

(declare-fun lt!309131 () Unit!13971)

(assert (=> d!67337 (= lt!309131 e!136156)))

(declare-fun c!9874 () Bool)

(assert (=> d!67337 (= c!9874 (not (= (size!4453 (buf!4939 (_2!9184 lt!307215))) #b00000000000000000000000000000000)))))

(declare-fun lt!309137 () Unit!13971)

(declare-fun lt!309134 () Unit!13971)

(assert (=> d!67337 (= lt!309137 lt!309134)))

(assert (=> d!67337 (isPrefixOf!0 (_2!9184 lt!307786) (_2!9184 lt!307786))))

(assert (=> d!67337 (= lt!309134 (lemmaIsPrefixRefl!0 (_2!9184 lt!307786)))))

(declare-fun lt!309132 () Unit!13971)

(declare-fun lt!309130 () Unit!13971)

(assert (=> d!67337 (= lt!309132 lt!309130)))

(assert (=> d!67337 (= lt!309130 (lemmaIsPrefixRefl!0 (_2!9184 lt!307786)))))

(declare-fun lt!309139 () Unit!13971)

(declare-fun lt!309125 () Unit!13971)

(assert (=> d!67337 (= lt!309139 lt!309125)))

(assert (=> d!67337 (isPrefixOf!0 lt!309127 lt!309127)))

(assert (=> d!67337 (= lt!309125 (lemmaIsPrefixRefl!0 lt!309127))))

(declare-fun lt!309129 () Unit!13971)

(declare-fun lt!309140 () Unit!13971)

(assert (=> d!67337 (= lt!309129 lt!309140)))

(assert (=> d!67337 (isPrefixOf!0 (_2!9184 lt!307215) (_2!9184 lt!307215))))

(assert (=> d!67337 (= lt!309140 (lemmaIsPrefixRefl!0 (_2!9184 lt!307215)))))

(assert (=> d!67337 (= lt!309127 (BitStream!8015 (buf!4939 (_2!9184 lt!307786)) (currentByte!9277 (_2!9184 lt!307215)) (currentBit!9272 (_2!9184 lt!307215))))))

(assert (=> d!67337 (isPrefixOf!0 (_2!9184 lt!307215) (_2!9184 lt!307786))))

(assert (=> d!67337 (= (reader!0 (_2!9184 lt!307215) (_2!9184 lt!307786)) lt!309138)))

(declare-fun b!198332 () Bool)

(declare-fun res!166009 () Bool)

(assert (=> b!198332 (=> (not res!166009) (not e!136157))))

(assert (=> b!198332 (= res!166009 (isPrefixOf!0 (_1!9181 lt!309138) (_2!9184 lt!307215)))))

(assert (= (and d!67337 c!9874) b!198333))

(assert (= (and d!67337 (not c!9874)) b!198331))

(assert (= (and d!67337 res!166011) b!198332))

(assert (= (and b!198332 res!166009) b!198330))

(assert (= (and b!198330 res!166010) b!198334))

(declare-fun m!306995 () Bool)

(assert (=> b!198330 m!306995))

(assert (=> b!198333 m!304999))

(declare-fun m!306997 () Bool)

(assert (=> b!198333 m!306997))

(declare-fun m!306999 () Bool)

(assert (=> b!198333 m!306999))

(declare-fun m!307001 () Bool)

(assert (=> b!198334 m!307001))

(assert (=> b!198334 m!305455))

(assert (=> b!198334 m!304999))

(assert (=> d!67337 m!305447))

(declare-fun m!307003 () Bool)

(assert (=> d!67337 m!307003))

(declare-fun m!307005 () Bool)

(assert (=> d!67337 m!307005))

(declare-fun m!307007 () Bool)

(assert (=> d!67337 m!307007))

(declare-fun m!307009 () Bool)

(assert (=> d!67337 m!307009))

(declare-fun m!307011 () Bool)

(assert (=> d!67337 m!307011))

(declare-fun m!307013 () Bool)

(assert (=> d!67337 m!307013))

(assert (=> d!67337 m!305459))

(declare-fun m!307015 () Bool)

(assert (=> d!67337 m!307015))

(declare-fun m!307017 () Bool)

(assert (=> d!67337 m!307017))

(assert (=> d!67337 m!305549))

(declare-fun m!307019 () Bool)

(assert (=> b!198332 m!307019))

(assert (=> b!197685 d!67337))

(declare-fun d!67339 () Bool)

(assert (=> d!67339 (validate_offset_bits!1 ((_ sign_extend 32) (size!4453 (buf!4939 (_2!9184 lt!307786)))) ((_ sign_extend 32) (currentByte!9277 (_2!9184 lt!307215))) ((_ sign_extend 32) (currentBit!9272 (_2!9184 lt!307215))) lt!307765)))

(declare-fun lt!309142 () Unit!13971)

(assert (=> d!67339 (= lt!309142 (choose!9 (_2!9184 lt!307215) (buf!4939 (_2!9184 lt!307786)) lt!307765 (BitStream!8015 (buf!4939 (_2!9184 lt!307786)) (currentByte!9277 (_2!9184 lt!307215)) (currentBit!9272 (_2!9184 lt!307215)))))))

(assert (=> d!67339 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9184 lt!307215) (buf!4939 (_2!9184 lt!307786)) lt!307765) lt!309142)))

(declare-fun bs!16673 () Bool)

(assert (= bs!16673 d!67339))

(assert (=> bs!16673 m!305441))

(declare-fun m!307021 () Bool)

(assert (=> bs!16673 m!307021))

(assert (=> b!197685 d!67339))

(declare-fun d!67341 () Bool)

(assert (=> d!67341 (= (onesLSBLong!0 nBits!348) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!348))))))

(assert (=> b!197685 d!67341))

(declare-fun lt!309143 () tuple2!17098)

(declare-fun d!67343 () Bool)

(assert (=> d!67343 (= lt!309143 (readNBitsLSBFirstsLoop!0 (_1!9181 lt!307797) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(assert (=> d!67343 (= (readNBitsLSBFirstsLoopPure!0 (_1!9181 lt!307797) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))) (tuple2!17077 (_2!9194 lt!309143) (_1!9194 lt!309143)))))

(declare-fun bs!16674 () Bool)

(assert (= bs!16674 d!67343))

(declare-fun m!307023 () Bool)

(assert (=> bs!16674 m!307023))

(assert (=> b!197685 d!67343))

(declare-fun d!67345 () Bool)

(declare-fun res!166012 () Bool)

(declare-fun e!136158 () Bool)

(assert (=> d!67345 (=> (not res!166012) (not e!136158))))

(assert (=> d!67345 (= res!166012 (= (size!4453 (buf!4939 (_2!9181 lt!307907))) (size!4453 (buf!4939 (_2!9184 lt!307233)))))))

(assert (=> d!67345 (= (isPrefixOf!0 (_2!9181 lt!307907) (_2!9184 lt!307233)) e!136158)))

(declare-fun b!198335 () Bool)

(declare-fun res!166013 () Bool)

(assert (=> b!198335 (=> (not res!166013) (not e!136158))))

(assert (=> b!198335 (= res!166013 (bvsle (bitIndex!0 (size!4453 (buf!4939 (_2!9181 lt!307907))) (currentByte!9277 (_2!9181 lt!307907)) (currentBit!9272 (_2!9181 lt!307907))) (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307233))) (currentByte!9277 (_2!9184 lt!307233)) (currentBit!9272 (_2!9184 lt!307233)))))))

(declare-fun b!198336 () Bool)

(declare-fun e!136159 () Bool)

(assert (=> b!198336 (= e!136158 e!136159)))

(declare-fun res!166014 () Bool)

(assert (=> b!198336 (=> res!166014 e!136159)))

(assert (=> b!198336 (= res!166014 (= (size!4453 (buf!4939 (_2!9181 lt!307907))) #b00000000000000000000000000000000))))

(declare-fun b!198337 () Bool)

(assert (=> b!198337 (= e!136159 (arrayBitRangesEq!0 (buf!4939 (_2!9181 lt!307907)) (buf!4939 (_2!9184 lt!307233)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4453 (buf!4939 (_2!9181 lt!307907))) (currentByte!9277 (_2!9181 lt!307907)) (currentBit!9272 (_2!9181 lt!307907)))))))

(assert (= (and d!67345 res!166012) b!198335))

(assert (= (and b!198335 res!166013) b!198336))

(assert (= (and b!198336 (not res!166014)) b!198337))

(assert (=> b!198335 m!306953))

(assert (=> b!198335 m!304983))

(assert (=> b!198337 m!306953))

(assert (=> b!198337 m!306953))

(declare-fun m!307025 () Bool)

(assert (=> b!198337 m!307025))

(assert (=> b!197715 d!67345))

(assert (=> d!66675 d!66673))

(declare-fun d!67347 () Bool)

(assert (=> d!67347 (isPrefixOf!0 thiss!1204 (_2!9184 lt!307233))))

(assert (=> d!67347 true))

(declare-fun _$15!294 () Unit!13971)

(assert (=> d!67347 (= (choose!30 thiss!1204 (_2!9184 lt!307215) (_2!9184 lt!307233)) _$15!294)))

(declare-fun bs!16675 () Bool)

(assert (= bs!16675 d!67347))

(assert (=> bs!16675 m!304985))

(assert (=> d!66675 d!67347))

(assert (=> d!66675 d!66651))

(declare-fun d!67349 () Bool)

(assert (=> d!67349 (= (remainingBits!0 ((_ sign_extend 32) (size!4453 (buf!4939 thiss!1204))) ((_ sign_extend 32) (currentByte!9277 thiss!1204)) ((_ sign_extend 32) (currentBit!9272 thiss!1204))) (bvsub (bvmul ((_ sign_extend 32) (size!4453 (buf!4939 thiss!1204))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9277 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9272 thiss!1204)))))))

(assert (=> d!66661 d!67349))

(assert (=> d!66661 d!66759))

(declare-fun d!67351 () Bool)

(assert (=> d!67351 (= (remainingBits!0 ((_ sign_extend 32) (size!4453 (buf!4939 (_2!9184 lt!307215)))) ((_ sign_extend 32) (currentByte!9277 (_2!9184 lt!307215))) ((_ sign_extend 32) (currentBit!9272 (_2!9184 lt!307215)))) (bvsub (bvmul ((_ sign_extend 32) (size!4453 (buf!4939 (_2!9184 lt!307215)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9277 (_2!9184 lt!307215))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9272 (_2!9184 lt!307215))))))))

(assert (=> d!66659 d!67351))

(assert (=> d!66659 d!67307))

(declare-fun d!67353 () Bool)

(declare-fun e!136166 () Bool)

(assert (=> d!67353 e!136166))

(declare-fun res!166017 () Bool)

(assert (=> d!67353 (=> (not res!166017) (not e!136166))))

(declare-fun increaseBitIndex!0 (BitStream!8014) tuple2!17078)

(assert (=> d!67353 (= res!166017 (= (buf!4939 (_2!9184 (increaseBitIndex!0 lt!307219))) (buf!4939 lt!307219)))))

(declare-fun lt!309162 () Bool)

(assert (=> d!67353 (= lt!309162 (not (= (bvand ((_ sign_extend 24) (select (arr!5383 (buf!4939 lt!307219)) (currentByte!9277 lt!307219))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9272 lt!307219)))) #b00000000000000000000000000000000)))))

(declare-fun lt!309160 () tuple2!17096)

(assert (=> d!67353 (= lt!309160 (tuple2!17097 (not (= (bvand ((_ sign_extend 24) (select (arr!5383 (buf!4939 lt!307219)) (currentByte!9277 lt!307219))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9272 lt!307219)))) #b00000000000000000000000000000000)) (_2!9184 (increaseBitIndex!0 lt!307219))))))

(assert (=> d!67353 (validate_offset_bit!0 ((_ sign_extend 32) (size!4453 (buf!4939 lt!307219))) ((_ sign_extend 32) (currentByte!9277 lt!307219)) ((_ sign_extend 32) (currentBit!9272 lt!307219)))))

(assert (=> d!67353 (= (readBit!0 lt!307219) lt!309160)))

(declare-fun lt!309161 () (_ BitVec 64))

(declare-fun lt!309163 () (_ BitVec 64))

(declare-fun b!198340 () Bool)

(assert (=> b!198340 (= e!136166 (= (bitIndex!0 (size!4453 (buf!4939 (_2!9184 (increaseBitIndex!0 lt!307219)))) (currentByte!9277 (_2!9184 (increaseBitIndex!0 lt!307219))) (currentBit!9272 (_2!9184 (increaseBitIndex!0 lt!307219)))) (bvadd lt!309161 lt!309163)))))

(assert (=> b!198340 (or (not (= (bvand lt!309161 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!309163 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!309161 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!309161 lt!309163) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!198340 (= lt!309163 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!198340 (= lt!309161 (bitIndex!0 (size!4453 (buf!4939 lt!307219)) (currentByte!9277 lt!307219) (currentBit!9272 lt!307219)))))

(declare-fun lt!309159 () Bool)

(assert (=> b!198340 (= lt!309159 (not (= (bvand ((_ sign_extend 24) (select (arr!5383 (buf!4939 lt!307219)) (currentByte!9277 lt!307219))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9272 lt!307219)))) #b00000000000000000000000000000000)))))

(declare-fun lt!309158 () Bool)

(assert (=> b!198340 (= lt!309158 (not (= (bvand ((_ sign_extend 24) (select (arr!5383 (buf!4939 lt!307219)) (currentByte!9277 lt!307219))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9272 lt!307219)))) #b00000000000000000000000000000000)))))

(declare-fun lt!309164 () Bool)

(assert (=> b!198340 (= lt!309164 (not (= (bvand ((_ sign_extend 24) (select (arr!5383 (buf!4939 lt!307219)) (currentByte!9277 lt!307219))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9272 lt!307219)))) #b00000000000000000000000000000000)))))

(assert (= (and d!67353 res!166017) b!198340))

(declare-fun m!307027 () Bool)

(assert (=> d!67353 m!307027))

(declare-fun m!307029 () Bool)

(assert (=> d!67353 m!307029))

(declare-fun m!307031 () Bool)

(assert (=> d!67353 m!307031))

(declare-fun m!307033 () Bool)

(assert (=> d!67353 m!307033))

(declare-fun m!307035 () Bool)

(assert (=> b!198340 m!307035))

(assert (=> b!198340 m!307027))

(assert (=> b!198340 m!307029))

(assert (=> b!198340 m!307031))

(declare-fun m!307037 () Bool)

(assert (=> b!198340 m!307037))

(assert (=> d!66773 d!67353))

(declare-fun b!198355 () Bool)

(declare-fun res!166032 () Bool)

(declare-fun e!136173 () Bool)

(assert (=> b!198355 (=> (not res!166032) (not e!136173))))

(declare-fun lt!309177 () tuple2!17098)

(assert (=> b!198355 (= res!166032 (= (bvand (_1!9194 lt!309177) (onesLSBLong!0 i!590)) (bvand lt!307227 (onesLSBLong!0 i!590))))))

(declare-fun b!198356 () Bool)

(declare-fun res!166029 () Bool)

(assert (=> b!198356 (=> (not res!166029) (not e!136173))))

(assert (=> b!198356 (= res!166029 (= (bvand (_1!9194 lt!309177) (onesLSBLong!0 nBits!348)) (_1!9194 lt!309177)))))

(declare-fun b!198357 () Bool)

(declare-fun res!166031 () Bool)

(assert (=> b!198357 (=> (not res!166031) (not e!136173))))

(declare-fun lt!309180 () (_ BitVec 64))

(declare-fun lt!309178 () (_ BitVec 64))

(assert (=> b!198357 (= res!166031 (= (bitIndex!0 (size!4453 (buf!4939 (_2!9194 lt!309177))) (currentByte!9277 (_2!9194 lt!309177)) (currentBit!9272 (_2!9194 lt!309177))) (bvadd lt!309180 lt!309178)))))

(assert (=> b!198357 (or (not (= (bvand lt!309180 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!309178 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!309180 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!309180 lt!309178) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!198357 (= lt!309178 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(assert (=> b!198357 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand i!590 #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 i!590) #b10000000000000000000000000000000)))))

(assert (=> b!198357 (= lt!309180 (bitIndex!0 (size!4453 (buf!4939 (_1!9181 lt!307220))) (currentByte!9277 (_1!9181 lt!307220)) (currentBit!9272 (_1!9181 lt!307220))))))

(declare-fun b!198358 () Bool)

(declare-fun e!136174 () tuple2!17098)

(assert (=> b!198358 (= e!136174 (tuple2!17099 lt!307227 (_1!9181 lt!307220)))))

(declare-fun b!198359 () Bool)

(declare-fun e!136175 () Bool)

(assert (=> b!198359 (= e!136173 e!136175)))

(declare-fun res!166030 () Bool)

(assert (=> b!198359 (=> res!166030 e!136175)))

(assert (=> b!198359 (= res!166030 (not (bvslt i!590 nBits!348)))))

(declare-fun b!198360 () Bool)

(declare-fun lt!309182 () (_ BitVec 64))

(assert (=> b!198360 (= e!136175 (= (= (bvand (bvlshr (_1!9194 lt!309177) lt!309182) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!9182 (readBitPure!0 (_1!9181 lt!307220)))))))

(assert (=> b!198360 (and (bvsge lt!309182 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!309182 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!198360 (= lt!309182 ((_ sign_extend 32) i!590))))

(declare-fun d!67355 () Bool)

(assert (=> d!67355 e!136173))

(declare-fun res!166028 () Bool)

(assert (=> d!67355 (=> (not res!166028) (not e!136173))))

(assert (=> d!67355 (= res!166028 (= (buf!4939 (_2!9194 lt!309177)) (buf!4939 (_1!9181 lt!307220))))))

(assert (=> d!67355 (= lt!309177 e!136174)))

(declare-fun c!9877 () Bool)

(assert (=> d!67355 (= c!9877 (= nBits!348 i!590))))

(assert (=> d!67355 (and (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!67355 (= (readNBitsLSBFirstsLoop!0 (_1!9181 lt!307220) nBits!348 i!590 lt!307227) lt!309177)))

(declare-fun b!198361 () Bool)

(declare-fun lt!309181 () tuple2!17098)

(assert (=> b!198361 (= e!136174 (tuple2!17099 (_1!9194 lt!309181) (_2!9194 lt!309181)))))

(declare-fun lt!309179 () tuple2!17096)

(assert (=> b!198361 (= lt!309179 (readBit!0 (_1!9181 lt!307220)))))

(assert (=> b!198361 (= lt!309181 (readNBitsLSBFirstsLoop!0 (_2!9193 lt!309179) nBits!348 (bvadd i!590 #b00000000000000000000000000000001) (bvor lt!307227 (ite (_1!9193 lt!309179) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!67355 c!9877) b!198358))

(assert (= (and d!67355 (not c!9877)) b!198361))

(assert (= (and d!67355 res!166028) b!198357))

(assert (= (and b!198357 res!166031) b!198355))

(assert (= (and b!198355 res!166032) b!198356))

(assert (= (and b!198356 res!166029) b!198359))

(assert (= (and b!198359 (not res!166030)) b!198360))

(assert (=> b!198356 m!305425))

(assert (=> b!198355 m!305039))

(assert (=> b!198361 m!305489))

(declare-fun m!307039 () Bool)

(assert (=> b!198361 m!307039))

(assert (=> b!198360 m!305037))

(declare-fun m!307041 () Bool)

(assert (=> b!198357 m!307041))

(declare-fun m!307043 () Bool)

(assert (=> b!198357 m!307043))

(assert (=> d!66765 d!67355))

(declare-fun b!198376 () Bool)

(declare-fun res!166043 () Bool)

(declare-fun lt!309191 () (_ BitVec 32))

(assert (=> b!198376 (= res!166043 (= lt!309191 #b00000000000000000000000000000000))))

(declare-fun e!136192 () Bool)

(assert (=> b!198376 (=> res!166043 e!136192)))

(declare-fun e!136191 () Bool)

(assert (=> b!198376 (= e!136191 e!136192)))

(declare-fun b!198377 () Bool)

(declare-fun e!136193 () Bool)

(assert (=> b!198377 (= e!136193 e!136191)))

(declare-fun res!166047 () Bool)

(declare-fun call!3129 () Bool)

(assert (=> b!198377 (= res!166047 call!3129)))

(assert (=> b!198377 (=> (not res!166047) (not e!136191))))

(declare-datatypes ((tuple4!262 0))(
  ( (tuple4!263 (_1!9201 (_ BitVec 32)) (_2!9201 (_ BitVec 32)) (_3!647 (_ BitVec 32)) (_4!131 (_ BitVec 32))) )
))
(declare-fun lt!309190 () tuple4!262)

(declare-fun lt!309189 () (_ BitVec 32))

(declare-fun bm!3126 () Bool)

(declare-fun c!9880 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!3126 (= call!3129 (byteRangesEq!0 (select (arr!5383 (buf!4939 thiss!1204)) (_3!647 lt!309190)) (select (arr!5383 (buf!4939 (_2!9184 lt!307215))) (_3!647 lt!309190)) lt!309189 (ite c!9880 lt!309191 #b00000000000000000000000000001000)))))

(declare-fun b!198378 () Bool)

(declare-fun e!136189 () Bool)

(declare-fun e!136190 () Bool)

(assert (=> b!198378 (= e!136189 e!136190)))

(declare-fun res!166044 () Bool)

(assert (=> b!198378 (=> (not res!166044) (not e!136190))))

(declare-fun e!136188 () Bool)

(assert (=> b!198378 (= res!166044 e!136188)))

(declare-fun res!166046 () Bool)

(assert (=> b!198378 (=> res!166046 e!136188)))

(assert (=> b!198378 (= res!166046 (bvsge (_1!9201 lt!309190) (_2!9201 lt!309190)))))

(assert (=> b!198378 (= lt!309191 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!4453 (buf!4939 thiss!1204)) (currentByte!9277 thiss!1204) (currentBit!9272 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!198378 (= lt!309189 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!262)

(assert (=> b!198378 (= lt!309190 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4453 (buf!4939 thiss!1204)) (currentByte!9277 thiss!1204) (currentBit!9272 thiss!1204))))))

(declare-fun b!198380 () Bool)

(assert (=> b!198380 (= e!136192 (byteRangesEq!0 (select (arr!5383 (buf!4939 thiss!1204)) (_4!131 lt!309190)) (select (arr!5383 (buf!4939 (_2!9184 lt!307215))) (_4!131 lt!309190)) #b00000000000000000000000000000000 lt!309191))))

(declare-fun b!198381 () Bool)

(declare-fun arrayRangesEq!693 (array!10103 array!10103 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!198381 (= e!136188 (arrayRangesEq!693 (buf!4939 thiss!1204) (buf!4939 (_2!9184 lt!307215)) (_1!9201 lt!309190) (_2!9201 lt!309190)))))

(declare-fun b!198382 () Bool)

(assert (=> b!198382 (= e!136193 call!3129)))

(declare-fun d!67357 () Bool)

(declare-fun res!166045 () Bool)

(assert (=> d!67357 (=> res!166045 e!136189)))

(assert (=> d!67357 (= res!166045 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4453 (buf!4939 thiss!1204)) (currentByte!9277 thiss!1204) (currentBit!9272 thiss!1204))))))

(assert (=> d!67357 (= (arrayBitRangesEq!0 (buf!4939 thiss!1204) (buf!4939 (_2!9184 lt!307215)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4453 (buf!4939 thiss!1204)) (currentByte!9277 thiss!1204) (currentBit!9272 thiss!1204))) e!136189)))

(declare-fun b!198379 () Bool)

(assert (=> b!198379 (= e!136190 e!136193)))

(assert (=> b!198379 (= c!9880 (= (_3!647 lt!309190) (_4!131 lt!309190)))))

(assert (= (and d!67357 (not res!166045)) b!198378))

(assert (= (and b!198378 (not res!166046)) b!198381))

(assert (= (and b!198378 res!166044) b!198379))

(assert (= (and b!198379 c!9880) b!198382))

(assert (= (and b!198379 (not c!9880)) b!198377))

(assert (= (and b!198377 res!166047) b!198376))

(assert (= (and b!198376 (not res!166043)) b!198380))

(assert (= (or b!198382 b!198377) bm!3126))

(declare-fun m!307045 () Bool)

(assert (=> bm!3126 m!307045))

(declare-fun m!307047 () Bool)

(assert (=> bm!3126 m!307047))

(assert (=> bm!3126 m!307045))

(assert (=> bm!3126 m!307047))

(declare-fun m!307049 () Bool)

(assert (=> bm!3126 m!307049))

(assert (=> b!198378 m!305001))

(declare-fun m!307051 () Bool)

(assert (=> b!198378 m!307051))

(declare-fun m!307053 () Bool)

(assert (=> b!198380 m!307053))

(declare-fun m!307055 () Bool)

(assert (=> b!198380 m!307055))

(assert (=> b!198380 m!307053))

(assert (=> b!198380 m!307055))

(declare-fun m!307057 () Bool)

(assert (=> b!198380 m!307057))

(declare-fun m!307059 () Bool)

(assert (=> b!198381 m!307059))

(assert (=> b!197519 d!67357))

(assert (=> b!197519 d!66661))

(assert (=> b!197525 d!66791))

(declare-fun d!67359 () Bool)

(assert (=> d!67359 (= (remainingBits!0 ((_ sign_extend 32) (size!4453 (buf!4939 (_1!9182 lt!307222)))) ((_ sign_extend 32) (currentByte!9277 (_1!9182 lt!307222))) ((_ sign_extend 32) (currentBit!9272 (_1!9182 lt!307222)))) (bvsub (bvmul ((_ sign_extend 32) (size!4453 (buf!4939 (_1!9182 lt!307222)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9277 (_1!9182 lt!307222))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9272 (_1!9182 lt!307222))))))))

(assert (=> d!66795 d!67359))

(declare-fun d!67361 () Bool)

(assert (=> d!67361 (= (invariant!0 (currentBit!9272 (_1!9182 lt!307222)) (currentByte!9277 (_1!9182 lt!307222)) (size!4453 (buf!4939 (_1!9182 lt!307222)))) (and (bvsge (currentBit!9272 (_1!9182 lt!307222)) #b00000000000000000000000000000000) (bvslt (currentBit!9272 (_1!9182 lt!307222)) #b00000000000000000000000000001000) (bvsge (currentByte!9277 (_1!9182 lt!307222)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9277 (_1!9182 lt!307222)) (size!4453 (buf!4939 (_1!9182 lt!307222)))) (and (= (currentBit!9272 (_1!9182 lt!307222)) #b00000000000000000000000000000000) (= (currentByte!9277 (_1!9182 lt!307222)) (size!4453 (buf!4939 (_1!9182 lt!307222))))))))))

(assert (=> d!66795 d!67361))

(assert (=> d!66769 d!66785))

(declare-fun d!67363 () Bool)

(assert (=> d!67363 (validate_offset_bits!1 ((_ sign_extend 32) (size!4453 (buf!4939 (_2!9184 lt!307233)))) ((_ sign_extend 32) (currentByte!9277 (_2!9184 lt!307215))) ((_ sign_extend 32) (currentBit!9272 (_2!9184 lt!307215))) lt!307228)))

(assert (=> d!67363 true))

(declare-fun _$6!372 () Unit!13971)

(assert (=> d!67363 (= (choose!9 (_2!9184 lt!307215) (buf!4939 (_2!9184 lt!307233)) lt!307228 (BitStream!8015 (buf!4939 (_2!9184 lt!307233)) (currentByte!9277 (_2!9184 lt!307215)) (currentBit!9272 (_2!9184 lt!307215)))) _$6!372)))

(declare-fun bs!16676 () Bool)

(assert (= bs!16676 d!67363))

(assert (=> bs!16676 m!305029))

(assert (=> d!66769 d!67363))

(assert (=> b!197517 d!66661))

(assert (=> b!197517 d!66659))

(declare-fun d!67365 () Bool)

(declare-fun e!136194 () Bool)

(assert (=> d!67365 e!136194))

(declare-fun res!166048 () Bool)

(assert (=> d!67365 (=> (not res!166048) (not e!136194))))

(assert (=> d!67365 (= res!166048 (= (buf!4939 (_2!9184 (increaseBitIndex!0 (BitStream!8015 (buf!4939 (_2!9184 lt!307233)) (currentByte!9277 thiss!1204) (currentBit!9272 thiss!1204))))) (buf!4939 (BitStream!8015 (buf!4939 (_2!9184 lt!307233)) (currentByte!9277 thiss!1204) (currentBit!9272 thiss!1204)))))))

(declare-fun lt!309196 () Bool)

(assert (=> d!67365 (= lt!309196 (not (= (bvand ((_ sign_extend 24) (select (arr!5383 (buf!4939 (BitStream!8015 (buf!4939 (_2!9184 lt!307233)) (currentByte!9277 thiss!1204) (currentBit!9272 thiss!1204)))) (currentByte!9277 (BitStream!8015 (buf!4939 (_2!9184 lt!307233)) (currentByte!9277 thiss!1204) (currentBit!9272 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9272 (BitStream!8015 (buf!4939 (_2!9184 lt!307233)) (currentByte!9277 thiss!1204) (currentBit!9272 thiss!1204)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!309194 () tuple2!17096)

(assert (=> d!67365 (= lt!309194 (tuple2!17097 (not (= (bvand ((_ sign_extend 24) (select (arr!5383 (buf!4939 (BitStream!8015 (buf!4939 (_2!9184 lt!307233)) (currentByte!9277 thiss!1204) (currentBit!9272 thiss!1204)))) (currentByte!9277 (BitStream!8015 (buf!4939 (_2!9184 lt!307233)) (currentByte!9277 thiss!1204) (currentBit!9272 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9272 (BitStream!8015 (buf!4939 (_2!9184 lt!307233)) (currentByte!9277 thiss!1204) (currentBit!9272 thiss!1204)))))) #b00000000000000000000000000000000)) (_2!9184 (increaseBitIndex!0 (BitStream!8015 (buf!4939 (_2!9184 lt!307233)) (currentByte!9277 thiss!1204) (currentBit!9272 thiss!1204))))))))

(assert (=> d!67365 (validate_offset_bit!0 ((_ sign_extend 32) (size!4453 (buf!4939 (BitStream!8015 (buf!4939 (_2!9184 lt!307233)) (currentByte!9277 thiss!1204) (currentBit!9272 thiss!1204))))) ((_ sign_extend 32) (currentByte!9277 (BitStream!8015 (buf!4939 (_2!9184 lt!307233)) (currentByte!9277 thiss!1204) (currentBit!9272 thiss!1204)))) ((_ sign_extend 32) (currentBit!9272 (BitStream!8015 (buf!4939 (_2!9184 lt!307233)) (currentByte!9277 thiss!1204) (currentBit!9272 thiss!1204)))))))

(assert (=> d!67365 (= (readBit!0 (BitStream!8015 (buf!4939 (_2!9184 lt!307233)) (currentByte!9277 thiss!1204) (currentBit!9272 thiss!1204))) lt!309194)))

(declare-fun lt!309195 () (_ BitVec 64))

(declare-fun b!198383 () Bool)

(declare-fun lt!309197 () (_ BitVec 64))

(assert (=> b!198383 (= e!136194 (= (bitIndex!0 (size!4453 (buf!4939 (_2!9184 (increaseBitIndex!0 (BitStream!8015 (buf!4939 (_2!9184 lt!307233)) (currentByte!9277 thiss!1204) (currentBit!9272 thiss!1204)))))) (currentByte!9277 (_2!9184 (increaseBitIndex!0 (BitStream!8015 (buf!4939 (_2!9184 lt!307233)) (currentByte!9277 thiss!1204) (currentBit!9272 thiss!1204))))) (currentBit!9272 (_2!9184 (increaseBitIndex!0 (BitStream!8015 (buf!4939 (_2!9184 lt!307233)) (currentByte!9277 thiss!1204) (currentBit!9272 thiss!1204)))))) (bvadd lt!309195 lt!309197)))))

(assert (=> b!198383 (or (not (= (bvand lt!309195 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!309197 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!309195 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!309195 lt!309197) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!198383 (= lt!309197 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!198383 (= lt!309195 (bitIndex!0 (size!4453 (buf!4939 (BitStream!8015 (buf!4939 (_2!9184 lt!307233)) (currentByte!9277 thiss!1204) (currentBit!9272 thiss!1204)))) (currentByte!9277 (BitStream!8015 (buf!4939 (_2!9184 lt!307233)) (currentByte!9277 thiss!1204) (currentBit!9272 thiss!1204))) (currentBit!9272 (BitStream!8015 (buf!4939 (_2!9184 lt!307233)) (currentByte!9277 thiss!1204) (currentBit!9272 thiss!1204)))))))

(declare-fun lt!309193 () Bool)

(assert (=> b!198383 (= lt!309193 (not (= (bvand ((_ sign_extend 24) (select (arr!5383 (buf!4939 (BitStream!8015 (buf!4939 (_2!9184 lt!307233)) (currentByte!9277 thiss!1204) (currentBit!9272 thiss!1204)))) (currentByte!9277 (BitStream!8015 (buf!4939 (_2!9184 lt!307233)) (currentByte!9277 thiss!1204) (currentBit!9272 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9272 (BitStream!8015 (buf!4939 (_2!9184 lt!307233)) (currentByte!9277 thiss!1204) (currentBit!9272 thiss!1204)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!309192 () Bool)

(assert (=> b!198383 (= lt!309192 (not (= (bvand ((_ sign_extend 24) (select (arr!5383 (buf!4939 (BitStream!8015 (buf!4939 (_2!9184 lt!307233)) (currentByte!9277 thiss!1204) (currentBit!9272 thiss!1204)))) (currentByte!9277 (BitStream!8015 (buf!4939 (_2!9184 lt!307233)) (currentByte!9277 thiss!1204) (currentBit!9272 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9272 (BitStream!8015 (buf!4939 (_2!9184 lt!307233)) (currentByte!9277 thiss!1204) (currentBit!9272 thiss!1204)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!309198 () Bool)

(assert (=> b!198383 (= lt!309198 (not (= (bvand ((_ sign_extend 24) (select (arr!5383 (buf!4939 (BitStream!8015 (buf!4939 (_2!9184 lt!307233)) (currentByte!9277 thiss!1204) (currentBit!9272 thiss!1204)))) (currentByte!9277 (BitStream!8015 (buf!4939 (_2!9184 lt!307233)) (currentByte!9277 thiss!1204) (currentBit!9272 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9272 (BitStream!8015 (buf!4939 (_2!9184 lt!307233)) (currentByte!9277 thiss!1204) (currentBit!9272 thiss!1204)))))) #b00000000000000000000000000000000)))))

(assert (= (and d!67365 res!166048) b!198383))

(declare-fun m!307061 () Bool)

(assert (=> d!67365 m!307061))

(declare-fun m!307063 () Bool)

(assert (=> d!67365 m!307063))

(declare-fun m!307065 () Bool)

(assert (=> d!67365 m!307065))

(declare-fun m!307067 () Bool)

(assert (=> d!67365 m!307067))

(declare-fun m!307069 () Bool)

(assert (=> b!198383 m!307069))

(assert (=> b!198383 m!307061))

(assert (=> b!198383 m!307063))

(assert (=> b!198383 m!307065))

(declare-fun m!307071 () Bool)

(assert (=> b!198383 m!307071))

(assert (=> d!66789 d!67365))

(declare-fun d!67367 () Bool)

(declare-fun lt!309199 () tuple2!17096)

(assert (=> d!67367 (= lt!309199 (readBit!0 (readerFrom!0 (_2!9184 lt!307800) (currentBit!9272 (_2!9184 lt!307215)) (currentByte!9277 (_2!9184 lt!307215)))))))

(assert (=> d!67367 (= (readBitPure!0 (readerFrom!0 (_2!9184 lt!307800) (currentBit!9272 (_2!9184 lt!307215)) (currentByte!9277 (_2!9184 lt!307215)))) (tuple2!17075 (_2!9193 lt!309199) (_1!9193 lt!309199)))))

(declare-fun bs!16677 () Bool)

(assert (= bs!16677 d!67367))

(assert (=> bs!16677 m!305435))

(declare-fun m!307073 () Bool)

(assert (=> bs!16677 m!307073))

(assert (=> b!197697 d!67367))

(declare-fun d!67369 () Bool)

(declare-fun e!136195 () Bool)

(assert (=> d!67369 e!136195))

(declare-fun res!166049 () Bool)

(assert (=> d!67369 (=> (not res!166049) (not e!136195))))

(assert (=> d!67369 (= res!166049 (invariant!0 (currentBit!9272 (_2!9184 lt!307800)) (currentByte!9277 (_2!9184 lt!307800)) (size!4453 (buf!4939 (_2!9184 lt!307800)))))))

(assert (=> d!67369 (= (readerFrom!0 (_2!9184 lt!307800) (currentBit!9272 (_2!9184 lt!307215)) (currentByte!9277 (_2!9184 lt!307215))) (BitStream!8015 (buf!4939 (_2!9184 lt!307800)) (currentByte!9277 (_2!9184 lt!307215)) (currentBit!9272 (_2!9184 lt!307215))))))

(declare-fun b!198384 () Bool)

(assert (=> b!198384 (= e!136195 (invariant!0 (currentBit!9272 (_2!9184 lt!307215)) (currentByte!9277 (_2!9184 lt!307215)) (size!4453 (buf!4939 (_2!9184 lt!307800)))))))

(assert (= (and d!67369 res!166049) b!198384))

(assert (=> d!67369 m!306991))

(declare-fun m!307075 () Bool)

(assert (=> b!198384 m!307075))

(assert (=> b!197697 d!67369))

(declare-fun d!67371 () Bool)

(assert (=> d!67371 (= (remainingBits!0 ((_ sign_extend 32) (size!4453 (buf!4939 (_1!9182 lt!307230)))) ((_ sign_extend 32) (currentByte!9277 (_1!9182 lt!307230))) ((_ sign_extend 32) (currentBit!9272 (_1!9182 lt!307230)))) (bvsub (bvmul ((_ sign_extend 32) (size!4453 (buf!4939 (_1!9182 lt!307230)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9277 (_1!9182 lt!307230))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9272 (_1!9182 lt!307230))))))))

(assert (=> d!66783 d!67371))

(declare-fun d!67373 () Bool)

(assert (=> d!67373 (= (invariant!0 (currentBit!9272 (_1!9182 lt!307230)) (currentByte!9277 (_1!9182 lt!307230)) (size!4453 (buf!4939 (_1!9182 lt!307230)))) (and (bvsge (currentBit!9272 (_1!9182 lt!307230)) #b00000000000000000000000000000000) (bvslt (currentBit!9272 (_1!9182 lt!307230)) #b00000000000000000000000000001000) (bvsge (currentByte!9277 (_1!9182 lt!307230)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9277 (_1!9182 lt!307230)) (size!4453 (buf!4939 (_1!9182 lt!307230)))) (and (= (currentBit!9272 (_1!9182 lt!307230)) #b00000000000000000000000000000000) (= (currentByte!9277 (_1!9182 lt!307230)) (size!4453 (buf!4939 (_1!9182 lt!307230))))))))))

(assert (=> d!66783 d!67373))

(declare-fun b!198396 () Bool)

(declare-fun e!136207 () Bool)

(declare-fun _$19!159 () tuple2!17078)

(assert (=> b!198396 (= e!136207 (array_inv!4194 (buf!4939 (_2!9184 _$19!159))))))

(declare-fun b!198397 () Bool)

(declare-fun res!166060 () Bool)

(declare-fun e!136206 () Bool)

(assert (=> b!198397 (=> (not res!166060) (not e!136206))))

(assert (=> b!198397 (= res!166060 (= (bitIndex!0 (size!4453 (buf!4939 (_2!9184 _$19!159))) (currentByte!9277 (_2!9184 _$19!159)) (currentBit!9272 (_2!9184 _$19!159))) (bvadd (bitIndex!0 (size!4453 (buf!4939 thiss!1204)) (currentByte!9277 thiss!1204) (currentBit!9272 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun d!67375 () Bool)

(assert (=> d!67375 e!136206))

(declare-fun res!166058 () Bool)

(assert (=> d!67375 (=> (not res!166058) (not e!136206))))

(assert (=> d!67375 (= res!166058 (= (size!4453 (buf!4939 thiss!1204)) (size!4453 (buf!4939 (_2!9184 _$19!159)))))))

(assert (=> d!67375 (and (inv!12 (_2!9184 _$19!159)) e!136207)))

(assert (=> d!67375 (= (choose!16 thiss!1204 lt!307221) _$19!159)))

(declare-fun b!198398 () Bool)

(declare-fun e!136205 () Bool)

(assert (=> b!198398 (= e!136206 e!136205)))

(declare-fun res!166059 () Bool)

(assert (=> b!198398 (=> (not res!166059) (not e!136205))))

(declare-fun lt!309202 () tuple2!17074)

(assert (=> b!198398 (= res!166059 (and (= (_2!9182 lt!309202) lt!307221) (= (_1!9182 lt!309202) (_2!9184 _$19!159))))))

(assert (=> b!198398 (= lt!309202 (readBitPure!0 (readerFrom!0 (_2!9184 _$19!159) (currentBit!9272 thiss!1204) (currentByte!9277 thiss!1204))))))

(declare-fun b!198399 () Bool)

(assert (=> b!198399 (= e!136205 (= (bitIndex!0 (size!4453 (buf!4939 (_1!9182 lt!309202))) (currentByte!9277 (_1!9182 lt!309202)) (currentBit!9272 (_1!9182 lt!309202))) (bitIndex!0 (size!4453 (buf!4939 (_2!9184 _$19!159))) (currentByte!9277 (_2!9184 _$19!159)) (currentBit!9272 (_2!9184 _$19!159)))))))

(declare-fun b!198400 () Bool)

(declare-fun res!166061 () Bool)

(assert (=> b!198400 (=> (not res!166061) (not e!136206))))

(assert (=> b!198400 (= res!166061 (isPrefixOf!0 thiss!1204 (_2!9184 _$19!159)))))

(assert (= d!67375 b!198396))

(assert (= (and d!67375 res!166058) b!198397))

(assert (= (and b!198397 res!166060) b!198400))

(assert (= (and b!198400 res!166061) b!198398))

(assert (= (and b!198398 res!166059) b!198399))

(declare-fun m!307077 () Bool)

(assert (=> b!198397 m!307077))

(assert (=> b!198397 m!305001))

(declare-fun m!307079 () Bool)

(assert (=> b!198396 m!307079))

(declare-fun m!307081 () Bool)

(assert (=> b!198399 m!307081))

(assert (=> b!198399 m!307077))

(declare-fun m!307083 () Bool)

(assert (=> b!198400 m!307083))

(declare-fun m!307085 () Bool)

(assert (=> d!67375 m!307085))

(declare-fun m!307087 () Bool)

(assert (=> b!198398 m!307087))

(assert (=> b!198398 m!307087))

(declare-fun m!307089 () Bool)

(assert (=> b!198398 m!307089))

(assert (=> d!66663 d!67375))

(declare-fun d!67377 () Bool)

(assert (=> d!67377 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!4453 (buf!4939 thiss!1204))) ((_ sign_extend 32) (currentByte!9277 thiss!1204)) ((_ sign_extend 32) (currentBit!9272 thiss!1204))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4453 (buf!4939 thiss!1204))) ((_ sign_extend 32) (currentByte!9277 thiss!1204)) ((_ sign_extend 32) (currentBit!9272 thiss!1204))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!16678 () Bool)

(assert (= bs!16678 d!67377))

(assert (=> bs!16678 m!305193))

(assert (=> d!66663 d!67377))

(assert (=> b!197723 d!66659))

(declare-fun d!67379 () Bool)

(assert (=> d!67379 (arrayBitRangesEq!0 (buf!4939 (_2!9184 lt!307233)) (buf!4939 (_2!9184 lt!307215)) lt!307926 lt!307914)))

(declare-fun lt!309205 () Unit!13971)

(declare-fun choose!8 (array!10103 array!10103 (_ BitVec 64) (_ BitVec 64)) Unit!13971)

(assert (=> d!67379 (= lt!309205 (choose!8 (buf!4939 (_2!9184 lt!307215)) (buf!4939 (_2!9184 lt!307233)) lt!307926 lt!307914))))

(assert (=> d!67379 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!307926) (bvsle lt!307926 lt!307914))))

(assert (=> d!67379 (= (arrayBitRangesEqSymmetric!0 (buf!4939 (_2!9184 lt!307215)) (buf!4939 (_2!9184 lt!307233)) lt!307926 lt!307914) lt!309205)))

(declare-fun bs!16679 () Bool)

(assert (= bs!16679 d!67379))

(assert (=> bs!16679 m!305533))

(declare-fun m!307091 () Bool)

(assert (=> bs!16679 m!307091))

(assert (=> b!197723 d!67379))

(declare-fun b!198401 () Bool)

(declare-fun res!166062 () Bool)

(declare-fun lt!309208 () (_ BitVec 32))

(assert (=> b!198401 (= res!166062 (= lt!309208 #b00000000000000000000000000000000))))

(declare-fun e!136212 () Bool)

(assert (=> b!198401 (=> res!166062 e!136212)))

(declare-fun e!136211 () Bool)

(assert (=> b!198401 (= e!136211 e!136212)))

(declare-fun b!198402 () Bool)

(declare-fun e!136213 () Bool)

(assert (=> b!198402 (= e!136213 e!136211)))

(declare-fun res!166066 () Bool)

(declare-fun call!3130 () Bool)

(assert (=> b!198402 (= res!166066 call!3130)))

(assert (=> b!198402 (=> (not res!166066) (not e!136211))))

(declare-fun lt!309206 () (_ BitVec 32))

(declare-fun lt!309207 () tuple4!262)

(declare-fun bm!3127 () Bool)

(declare-fun c!9881 () Bool)

(assert (=> bm!3127 (= call!3130 (byteRangesEq!0 (select (arr!5383 (buf!4939 (_2!9184 lt!307233))) (_3!647 lt!309207)) (select (arr!5383 (buf!4939 (_2!9184 lt!307215))) (_3!647 lt!309207)) lt!309206 (ite c!9881 lt!309208 #b00000000000000000000000000001000)))))

(declare-fun b!198403 () Bool)

(declare-fun e!136209 () Bool)

(declare-fun e!136210 () Bool)

(assert (=> b!198403 (= e!136209 e!136210)))

(declare-fun res!166063 () Bool)

(assert (=> b!198403 (=> (not res!166063) (not e!136210))))

(declare-fun e!136208 () Bool)

(assert (=> b!198403 (= res!166063 e!136208)))

(declare-fun res!166065 () Bool)

(assert (=> b!198403 (=> res!166065 e!136208)))

(assert (=> b!198403 (= res!166065 (bvsge (_1!9201 lt!309207) (_2!9201 lt!309207)))))

(assert (=> b!198403 (= lt!309208 ((_ extract 31 0) (bvsrem lt!307914 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!198403 (= lt!309206 ((_ extract 31 0) (bvsrem lt!307926 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!198403 (= lt!309207 (arrayBitIndices!0 lt!307926 lt!307914))))

(declare-fun b!198405 () Bool)

(assert (=> b!198405 (= e!136212 (byteRangesEq!0 (select (arr!5383 (buf!4939 (_2!9184 lt!307233))) (_4!131 lt!309207)) (select (arr!5383 (buf!4939 (_2!9184 lt!307215))) (_4!131 lt!309207)) #b00000000000000000000000000000000 lt!309208))))

(declare-fun b!198406 () Bool)

(assert (=> b!198406 (= e!136208 (arrayRangesEq!693 (buf!4939 (_2!9184 lt!307233)) (buf!4939 (_2!9184 lt!307215)) (_1!9201 lt!309207) (_2!9201 lt!309207)))))

(declare-fun b!198407 () Bool)

(assert (=> b!198407 (= e!136213 call!3130)))

(declare-fun d!67381 () Bool)

(declare-fun res!166064 () Bool)

(assert (=> d!67381 (=> res!166064 e!136209)))

(assert (=> d!67381 (= res!166064 (bvsge lt!307926 lt!307914))))

(assert (=> d!67381 (= (arrayBitRangesEq!0 (buf!4939 (_2!9184 lt!307233)) (buf!4939 (_2!9184 lt!307215)) lt!307926 lt!307914) e!136209)))

(declare-fun b!198404 () Bool)

(assert (=> b!198404 (= e!136210 e!136213)))

(assert (=> b!198404 (= c!9881 (= (_3!647 lt!309207) (_4!131 lt!309207)))))

(assert (= (and d!67381 (not res!166064)) b!198403))

(assert (= (and b!198403 (not res!166065)) b!198406))

(assert (= (and b!198403 res!166063) b!198404))

(assert (= (and b!198404 c!9881) b!198407))

(assert (= (and b!198404 (not c!9881)) b!198402))

(assert (= (and b!198402 res!166066) b!198401))

(assert (= (and b!198401 (not res!166062)) b!198405))

(assert (= (or b!198407 b!198402) bm!3127))

(declare-fun m!307093 () Bool)

(assert (=> bm!3127 m!307093))

(declare-fun m!307095 () Bool)

(assert (=> bm!3127 m!307095))

(assert (=> bm!3127 m!307093))

(assert (=> bm!3127 m!307095))

(declare-fun m!307097 () Bool)

(assert (=> bm!3127 m!307097))

(declare-fun m!307099 () Bool)

(assert (=> b!198403 m!307099))

(declare-fun m!307101 () Bool)

(assert (=> b!198405 m!307101))

(declare-fun m!307103 () Bool)

(assert (=> b!198405 m!307103))

(assert (=> b!198405 m!307101))

(assert (=> b!198405 m!307103))

(declare-fun m!307105 () Bool)

(assert (=> b!198405 m!307105))

(declare-fun m!307107 () Bool)

(assert (=> b!198406 m!307107))

(assert (=> b!197723 d!67381))

(declare-fun d!67383 () Bool)

(assert (=> d!67383 (= (remainingBits!0 ((_ sign_extend 32) (size!4453 (buf!4939 (_2!9184 lt!307233)))) ((_ sign_extend 32) (currentByte!9277 (_2!9184 lt!307233))) ((_ sign_extend 32) (currentBit!9272 (_2!9184 lt!307233)))) (bvsub (bvmul ((_ sign_extend 32) (size!4453 (buf!4939 (_2!9184 lt!307233)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9277 (_2!9184 lt!307233))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9272 (_2!9184 lt!307233))))))))

(assert (=> d!66671 d!67383))

(assert (=> d!66671 d!66761))

(declare-fun d!67385 () Bool)

(assert (=> d!67385 (= (remainingBits!0 ((_ sign_extend 32) (size!4453 (buf!4939 (_2!9184 lt!307233)))) ((_ sign_extend 32) (currentByte!9277 (_2!9184 lt!307215))) ((_ sign_extend 32) (currentBit!9272 (_2!9184 lt!307215)))) (bvsub (bvmul ((_ sign_extend 32) (size!4453 (buf!4939 (_2!9184 lt!307233)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9277 (_2!9184 lt!307215))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9272 (_2!9184 lt!307215))))))))

(assert (=> d!66785 d!67385))

(declare-fun d!67387 () Bool)

(declare-fun res!166067 () Bool)

(declare-fun e!136214 () Bool)

(assert (=> d!67387 (=> (not res!166067) (not e!136214))))

(assert (=> d!67387 (= res!166067 (= (size!4453 (buf!4939 (_2!9184 lt!307215))) (size!4453 (buf!4939 (_2!9184 lt!307786)))))))

(assert (=> d!67387 (= (isPrefixOf!0 (_2!9184 lt!307215) (_2!9184 lt!307786)) e!136214)))

(declare-fun b!198408 () Bool)

(declare-fun res!166068 () Bool)

(assert (=> b!198408 (=> (not res!166068) (not e!136214))))

(assert (=> b!198408 (= res!166068 (bvsle (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307215))) (currentByte!9277 (_2!9184 lt!307215)) (currentBit!9272 (_2!9184 lt!307215))) (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307786))) (currentByte!9277 (_2!9184 lt!307786)) (currentBit!9272 (_2!9184 lt!307786)))))))

(declare-fun b!198409 () Bool)

(declare-fun e!136215 () Bool)

(assert (=> b!198409 (= e!136214 e!136215)))

(declare-fun res!166069 () Bool)

(assert (=> b!198409 (=> res!166069 e!136215)))

(assert (=> b!198409 (= res!166069 (= (size!4453 (buf!4939 (_2!9184 lt!307215))) #b00000000000000000000000000000000))))

(declare-fun b!198410 () Bool)

(assert (=> b!198410 (= e!136215 (arrayBitRangesEq!0 (buf!4939 (_2!9184 lt!307215)) (buf!4939 (_2!9184 lt!307786)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307215))) (currentByte!9277 (_2!9184 lt!307215)) (currentBit!9272 (_2!9184 lt!307215)))))))

(assert (= (and d!67387 res!166067) b!198408))

(assert (= (and b!198408 res!166068) b!198409))

(assert (= (and b!198409 (not res!166069)) b!198410))

(assert (=> b!198408 m!304999))

(assert (=> b!198408 m!305455))

(assert (=> b!198410 m!304999))

(assert (=> b!198410 m!304999))

(declare-fun m!307109 () Bool)

(assert (=> b!198410 m!307109))

(assert (=> b!197693 d!67387))

(declare-fun b!198411 () Bool)

(declare-fun res!166070 () Bool)

(declare-fun lt!309211 () (_ BitVec 32))

(assert (=> b!198411 (= res!166070 (= lt!309211 #b00000000000000000000000000000000))))

(declare-fun e!136220 () Bool)

(assert (=> b!198411 (=> res!166070 e!136220)))

(declare-fun e!136219 () Bool)

(assert (=> b!198411 (= e!136219 e!136220)))

(declare-fun b!198412 () Bool)

(declare-fun e!136221 () Bool)

(assert (=> b!198412 (= e!136221 e!136219)))

(declare-fun res!166074 () Bool)

(declare-fun call!3131 () Bool)

(assert (=> b!198412 (= res!166074 call!3131)))

(assert (=> b!198412 (=> (not res!166074) (not e!136219))))

(declare-fun c!9882 () Bool)

(declare-fun lt!309210 () tuple4!262)

(declare-fun bm!3128 () Bool)

(declare-fun lt!309209 () (_ BitVec 32))

(assert (=> bm!3128 (= call!3131 (byteRangesEq!0 (select (arr!5383 (buf!4939 thiss!1204)) (_3!647 lt!309210)) (select (arr!5383 (buf!4939 (_2!9184 lt!307233))) (_3!647 lt!309210)) lt!309209 (ite c!9882 lt!309211 #b00000000000000000000000000001000)))))

(declare-fun b!198413 () Bool)

(declare-fun e!136217 () Bool)

(declare-fun e!136218 () Bool)

(assert (=> b!198413 (= e!136217 e!136218)))

(declare-fun res!166071 () Bool)

(assert (=> b!198413 (=> (not res!166071) (not e!136218))))

(declare-fun e!136216 () Bool)

(assert (=> b!198413 (= res!166071 e!136216)))

(declare-fun res!166073 () Bool)

(assert (=> b!198413 (=> res!166073 e!136216)))

(assert (=> b!198413 (= res!166073 (bvsge (_1!9201 lt!309210) (_2!9201 lt!309210)))))

(assert (=> b!198413 (= lt!309211 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!4453 (buf!4939 thiss!1204)) (currentByte!9277 thiss!1204) (currentBit!9272 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!198413 (= lt!309209 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!198413 (= lt!309210 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4453 (buf!4939 thiss!1204)) (currentByte!9277 thiss!1204) (currentBit!9272 thiss!1204))))))

(declare-fun b!198415 () Bool)

(assert (=> b!198415 (= e!136220 (byteRangesEq!0 (select (arr!5383 (buf!4939 thiss!1204)) (_4!131 lt!309210)) (select (arr!5383 (buf!4939 (_2!9184 lt!307233))) (_4!131 lt!309210)) #b00000000000000000000000000000000 lt!309211))))

(declare-fun b!198416 () Bool)

(assert (=> b!198416 (= e!136216 (arrayRangesEq!693 (buf!4939 thiss!1204) (buf!4939 (_2!9184 lt!307233)) (_1!9201 lt!309210) (_2!9201 lt!309210)))))

(declare-fun b!198417 () Bool)

(assert (=> b!198417 (= e!136221 call!3131)))

(declare-fun d!67389 () Bool)

(declare-fun res!166072 () Bool)

(assert (=> d!67389 (=> res!166072 e!136217)))

(assert (=> d!67389 (= res!166072 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4453 (buf!4939 thiss!1204)) (currentByte!9277 thiss!1204) (currentBit!9272 thiss!1204))))))

(assert (=> d!67389 (= (arrayBitRangesEq!0 (buf!4939 thiss!1204) (buf!4939 (_2!9184 lt!307233)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4453 (buf!4939 thiss!1204)) (currentByte!9277 thiss!1204) (currentBit!9272 thiss!1204))) e!136217)))

(declare-fun b!198414 () Bool)

(assert (=> b!198414 (= e!136218 e!136221)))

(assert (=> b!198414 (= c!9882 (= (_3!647 lt!309210) (_4!131 lt!309210)))))

(assert (= (and d!67389 (not res!166072)) b!198413))

(assert (= (and b!198413 (not res!166073)) b!198416))

(assert (= (and b!198413 res!166071) b!198414))

(assert (= (and b!198414 c!9882) b!198417))

(assert (= (and b!198414 (not c!9882)) b!198412))

(assert (= (and b!198412 res!166074) b!198411))

(assert (= (and b!198411 (not res!166070)) b!198415))

(assert (= (or b!198417 b!198412) bm!3128))

(declare-fun m!307111 () Bool)

(assert (=> bm!3128 m!307111))

(declare-fun m!307113 () Bool)

(assert (=> bm!3128 m!307113))

(assert (=> bm!3128 m!307111))

(assert (=> bm!3128 m!307113))

(declare-fun m!307115 () Bool)

(assert (=> bm!3128 m!307115))

(assert (=> b!198413 m!305001))

(assert (=> b!198413 m!307051))

(declare-fun m!307117 () Bool)

(assert (=> b!198415 m!307117))

(declare-fun m!307119 () Bool)

(assert (=> b!198415 m!307119))

(assert (=> b!198415 m!307117))

(assert (=> b!198415 m!307119))

(declare-fun m!307121 () Bool)

(assert (=> b!198415 m!307121))

(declare-fun m!307123 () Bool)

(assert (=> b!198416 m!307123))

(assert (=> b!197551 d!67389))

(assert (=> b!197551 d!66661))

(declare-fun d!67391 () Bool)

(declare-fun lt!309212 () tuple2!17096)

(assert (=> d!67391 (= lt!309212 (readBit!0 lt!307841))))

(assert (=> d!67391 (= (readBitPure!0 lt!307841) (tuple2!17075 (_2!9193 lt!309212) (_1!9193 lt!309212)))))

(declare-fun bs!16680 () Bool)

(assert (= bs!16680 d!67391))

(declare-fun m!307125 () Bool)

(assert (=> bs!16680 m!307125))

(assert (=> d!66777 d!67391))

(declare-fun d!67393 () Bool)

(assert (=> d!67393 (= (invariant!0 (currentBit!9272 lt!307219) (currentByte!9277 lt!307219) (size!4453 (buf!4939 (_2!9184 lt!307233)))) (and (bvsge (currentBit!9272 lt!307219) #b00000000000000000000000000000000) (bvslt (currentBit!9272 lt!307219) #b00000000000000000000000000001000) (bvsge (currentByte!9277 lt!307219) #b00000000000000000000000000000000) (or (bvslt (currentByte!9277 lt!307219) (size!4453 (buf!4939 (_2!9184 lt!307233)))) (and (= (currentBit!9272 lt!307219) #b00000000000000000000000000000000) (= (currentByte!9277 lt!307219) (size!4453 (buf!4939 (_2!9184 lt!307233))))))))))

(assert (=> d!66777 d!67393))

(assert (=> d!66777 d!66773))

(declare-fun d!67395 () Bool)

(declare-fun e!136224 () Bool)

(assert (=> d!67395 e!136224))

(declare-fun res!166077 () Bool)

(assert (=> d!67395 (=> (not res!166077) (not e!136224))))

(declare-fun lt!309219 () tuple2!17074)

(declare-fun lt!309221 () tuple2!17074)

(assert (=> d!67395 (= res!166077 (= (bitIndex!0 (size!4453 (buf!4939 (_1!9182 lt!309219))) (currentByte!9277 (_1!9182 lt!309219)) (currentBit!9272 (_1!9182 lt!309219))) (bitIndex!0 (size!4453 (buf!4939 (_1!9182 lt!309221))) (currentByte!9277 (_1!9182 lt!309221)) (currentBit!9272 (_1!9182 lt!309221)))))))

(declare-fun lt!309220 () BitStream!8014)

(assert (=> d!67395 (= lt!309221 (readBitPure!0 lt!309220))))

(assert (=> d!67395 (= lt!309219 (readBitPure!0 lt!307219))))

(assert (=> d!67395 (= lt!309220 (BitStream!8015 (buf!4939 (_2!9184 lt!307233)) (currentByte!9277 lt!307219) (currentBit!9272 lt!307219)))))

(assert (=> d!67395 (invariant!0 (currentBit!9272 lt!307219) (currentByte!9277 lt!307219) (size!4453 (buf!4939 (_2!9184 lt!307233))))))

(assert (=> d!67395 true))

(declare-fun _$9!75 () Unit!13971)

(assert (=> d!67395 (= (choose!50 lt!307219 (_2!9184 lt!307233) lt!307841 lt!307840 (tuple2!17075 (_1!9182 lt!307840) (_2!9182 lt!307840)) (_1!9182 lt!307840) (_2!9182 lt!307840) lt!307843 (tuple2!17075 (_1!9182 lt!307843) (_2!9182 lt!307843)) (_1!9182 lt!307843) (_2!9182 lt!307843)) _$9!75)))

(declare-fun b!198420 () Bool)

(assert (=> b!198420 (= e!136224 (= (_2!9182 lt!309219) (_2!9182 lt!309221)))))

(assert (= (and d!67395 res!166077) b!198420))

(declare-fun m!307127 () Bool)

(assert (=> d!67395 m!307127))

(assert (=> d!67395 m!305019))

(declare-fun m!307129 () Bool)

(assert (=> d!67395 m!307129))

(declare-fun m!307131 () Bool)

(assert (=> d!67395 m!307131))

(assert (=> d!67395 m!305477))

(assert (=> d!66777 d!67395))

(declare-fun d!67397 () Bool)

(declare-fun e!136225 () Bool)

(assert (=> d!67397 e!136225))

(declare-fun res!166078 () Bool)

(assert (=> d!67397 (=> (not res!166078) (not e!136225))))

(declare-fun lt!309222 () (_ BitVec 64))

(declare-fun lt!309225 () (_ BitVec 64))

(declare-fun lt!309224 () (_ BitVec 64))

(assert (=> d!67397 (= res!166078 (= lt!309222 (bvsub lt!309225 lt!309224)))))

(assert (=> d!67397 (or (= (bvand lt!309225 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!309224 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!309225 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!309225 lt!309224) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67397 (= lt!309224 (remainingBits!0 ((_ sign_extend 32) (size!4453 (buf!4939 (_1!9182 lt!307843)))) ((_ sign_extend 32) (currentByte!9277 (_1!9182 lt!307843))) ((_ sign_extend 32) (currentBit!9272 (_1!9182 lt!307843)))))))

(declare-fun lt!309223 () (_ BitVec 64))

(declare-fun lt!309227 () (_ BitVec 64))

(assert (=> d!67397 (= lt!309225 (bvmul lt!309223 lt!309227))))

(assert (=> d!67397 (or (= lt!309223 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!309227 (bvsdiv (bvmul lt!309223 lt!309227) lt!309223)))))

(assert (=> d!67397 (= lt!309227 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!67397 (= lt!309223 ((_ sign_extend 32) (size!4453 (buf!4939 (_1!9182 lt!307843)))))))

(assert (=> d!67397 (= lt!309222 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9277 (_1!9182 lt!307843))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9272 (_1!9182 lt!307843)))))))

(assert (=> d!67397 (invariant!0 (currentBit!9272 (_1!9182 lt!307843)) (currentByte!9277 (_1!9182 lt!307843)) (size!4453 (buf!4939 (_1!9182 lt!307843))))))

(assert (=> d!67397 (= (bitIndex!0 (size!4453 (buf!4939 (_1!9182 lt!307843))) (currentByte!9277 (_1!9182 lt!307843)) (currentBit!9272 (_1!9182 lt!307843))) lt!309222)))

(declare-fun b!198421 () Bool)

(declare-fun res!166079 () Bool)

(assert (=> b!198421 (=> (not res!166079) (not e!136225))))

(assert (=> b!198421 (= res!166079 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!309222))))

(declare-fun b!198422 () Bool)

(declare-fun lt!309226 () (_ BitVec 64))

(assert (=> b!198422 (= e!136225 (bvsle lt!309222 (bvmul lt!309226 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!198422 (or (= lt!309226 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!309226 #b0000000000000000000000000000000000000000000000000000000000001000) lt!309226)))))

(assert (=> b!198422 (= lt!309226 ((_ sign_extend 32) (size!4453 (buf!4939 (_1!9182 lt!307843)))))))

(assert (= (and d!67397 res!166078) b!198421))

(assert (= (and b!198421 res!166079) b!198422))

(declare-fun m!307133 () Bool)

(assert (=> d!67397 m!307133))

(declare-fun m!307135 () Bool)

(assert (=> d!67397 m!307135))

(assert (=> d!66777 d!67397))

(declare-fun d!67399 () Bool)

(declare-fun e!136226 () Bool)

(assert (=> d!67399 e!136226))

(declare-fun res!166080 () Bool)

(assert (=> d!67399 (=> (not res!166080) (not e!136226))))

(declare-fun lt!309231 () (_ BitVec 64))

(declare-fun lt!309230 () (_ BitVec 64))

(declare-fun lt!309228 () (_ BitVec 64))

(assert (=> d!67399 (= res!166080 (= lt!309228 (bvsub lt!309231 lt!309230)))))

(assert (=> d!67399 (or (= (bvand lt!309231 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!309230 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!309231 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!309231 lt!309230) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67399 (= lt!309230 (remainingBits!0 ((_ sign_extend 32) (size!4453 (buf!4939 (_1!9182 lt!307840)))) ((_ sign_extend 32) (currentByte!9277 (_1!9182 lt!307840))) ((_ sign_extend 32) (currentBit!9272 (_1!9182 lt!307840)))))))

(declare-fun lt!309229 () (_ BitVec 64))

(declare-fun lt!309233 () (_ BitVec 64))

(assert (=> d!67399 (= lt!309231 (bvmul lt!309229 lt!309233))))

(assert (=> d!67399 (or (= lt!309229 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!309233 (bvsdiv (bvmul lt!309229 lt!309233) lt!309229)))))

(assert (=> d!67399 (= lt!309233 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!67399 (= lt!309229 ((_ sign_extend 32) (size!4453 (buf!4939 (_1!9182 lt!307840)))))))

(assert (=> d!67399 (= lt!309228 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9277 (_1!9182 lt!307840))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9272 (_1!9182 lt!307840)))))))

(assert (=> d!67399 (invariant!0 (currentBit!9272 (_1!9182 lt!307840)) (currentByte!9277 (_1!9182 lt!307840)) (size!4453 (buf!4939 (_1!9182 lt!307840))))))

(assert (=> d!67399 (= (bitIndex!0 (size!4453 (buf!4939 (_1!9182 lt!307840))) (currentByte!9277 (_1!9182 lt!307840)) (currentBit!9272 (_1!9182 lt!307840))) lt!309228)))

(declare-fun b!198423 () Bool)

(declare-fun res!166081 () Bool)

(assert (=> b!198423 (=> (not res!166081) (not e!136226))))

(assert (=> b!198423 (= res!166081 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!309228))))

(declare-fun b!198424 () Bool)

(declare-fun lt!309232 () (_ BitVec 64))

(assert (=> b!198424 (= e!136226 (bvsle lt!309228 (bvmul lt!309232 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!198424 (or (= lt!309232 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!309232 #b0000000000000000000000000000000000000000000000000000000000001000) lt!309232)))))

(assert (=> b!198424 (= lt!309232 ((_ sign_extend 32) (size!4453 (buf!4939 (_1!9182 lt!307840)))))))

(assert (= (and d!67399 res!166080) b!198423))

(assert (= (and b!198423 res!166081) b!198424))

(declare-fun m!307137 () Bool)

(assert (=> d!67399 m!307137))

(declare-fun m!307139 () Bool)

(assert (=> d!67399 m!307139))

(assert (=> d!66777 d!67399))

(declare-fun d!67401 () Bool)

(declare-fun e!136227 () Bool)

(assert (=> d!67401 e!136227))

(declare-fun res!166082 () Bool)

(assert (=> d!67401 (=> (not res!166082) (not e!136227))))

(declare-fun lt!309237 () (_ BitVec 64))

(declare-fun lt!309236 () (_ BitVec 64))

(declare-fun lt!309234 () (_ BitVec 64))

(assert (=> d!67401 (= res!166082 (= lt!309234 (bvsub lt!309237 lt!309236)))))

(assert (=> d!67401 (or (= (bvand lt!309237 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!309236 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!309237 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!309237 lt!309236) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67401 (= lt!309236 (remainingBits!0 ((_ sign_extend 32) (size!4453 (buf!4939 (_1!9182 lt!307420)))) ((_ sign_extend 32) (currentByte!9277 (_1!9182 lt!307420))) ((_ sign_extend 32) (currentBit!9272 (_1!9182 lt!307420)))))))

(declare-fun lt!309235 () (_ BitVec 64))

(declare-fun lt!309239 () (_ BitVec 64))

(assert (=> d!67401 (= lt!309237 (bvmul lt!309235 lt!309239))))

(assert (=> d!67401 (or (= lt!309235 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!309239 (bvsdiv (bvmul lt!309235 lt!309239) lt!309235)))))

(assert (=> d!67401 (= lt!309239 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!67401 (= lt!309235 ((_ sign_extend 32) (size!4453 (buf!4939 (_1!9182 lt!307420)))))))

(assert (=> d!67401 (= lt!309234 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9277 (_1!9182 lt!307420))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9272 (_1!9182 lt!307420)))))))

(assert (=> d!67401 (invariant!0 (currentBit!9272 (_1!9182 lt!307420)) (currentByte!9277 (_1!9182 lt!307420)) (size!4453 (buf!4939 (_1!9182 lt!307420))))))

(assert (=> d!67401 (= (bitIndex!0 (size!4453 (buf!4939 (_1!9182 lt!307420))) (currentByte!9277 (_1!9182 lt!307420)) (currentBit!9272 (_1!9182 lt!307420))) lt!309234)))

(declare-fun b!198425 () Bool)

(declare-fun res!166083 () Bool)

(assert (=> b!198425 (=> (not res!166083) (not e!136227))))

(assert (=> b!198425 (= res!166083 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!309234))))

(declare-fun b!198426 () Bool)

(declare-fun lt!309238 () (_ BitVec 64))

(assert (=> b!198426 (= e!136227 (bvsle lt!309234 (bvmul lt!309238 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!198426 (or (= lt!309238 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!309238 #b0000000000000000000000000000000000000000000000000000000000001000) lt!309238)))))

(assert (=> b!198426 (= lt!309238 ((_ sign_extend 32) (size!4453 (buf!4939 (_1!9182 lt!307420)))))))

(assert (= (and d!67401 res!166082) b!198425))

(assert (= (and b!198425 res!166083) b!198426))

(declare-fun m!307141 () Bool)

(assert (=> d!67401 m!307141))

(declare-fun m!307143 () Bool)

(assert (=> d!67401 m!307143))

(assert (=> b!197546 d!67401))

(assert (=> b!197546 d!67295))

(declare-fun d!67403 () Bool)

(declare-fun res!166084 () Bool)

(declare-fun e!136228 () Bool)

(assert (=> d!67403 (=> (not res!166084) (not e!136228))))

(assert (=> d!67403 (= res!166084 (= (size!4453 (buf!4939 thiss!1204)) (size!4453 (buf!4939 (_2!9184 lt!307417)))))))

(assert (=> d!67403 (= (isPrefixOf!0 thiss!1204 (_2!9184 lt!307417)) e!136228)))

(declare-fun b!198427 () Bool)

(declare-fun res!166085 () Bool)

(assert (=> b!198427 (=> (not res!166085) (not e!136228))))

(assert (=> b!198427 (= res!166085 (bvsle (bitIndex!0 (size!4453 (buf!4939 thiss!1204)) (currentByte!9277 thiss!1204) (currentBit!9272 thiss!1204)) (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307417))) (currentByte!9277 (_2!9184 lt!307417)) (currentBit!9272 (_2!9184 lt!307417)))))))

(declare-fun b!198428 () Bool)

(declare-fun e!136229 () Bool)

(assert (=> b!198428 (= e!136228 e!136229)))

(declare-fun res!166086 () Bool)

(assert (=> b!198428 (=> res!166086 e!136229)))

(assert (=> b!198428 (= res!166086 (= (size!4453 (buf!4939 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!198429 () Bool)

(assert (=> b!198429 (= e!136229 (arrayBitRangesEq!0 (buf!4939 thiss!1204) (buf!4939 (_2!9184 lt!307417)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4453 (buf!4939 thiss!1204)) (currentByte!9277 thiss!1204) (currentBit!9272 thiss!1204))))))

(assert (= (and d!67403 res!166084) b!198427))

(assert (= (and b!198427 res!166085) b!198428))

(assert (= (and b!198428 (not res!166086)) b!198429))

(assert (=> b!198427 m!305001))

(assert (=> b!198427 m!305205))

(assert (=> b!198429 m!305001))

(assert (=> b!198429 m!305001))

(declare-fun m!307145 () Bool)

(assert (=> b!198429 m!307145))

(assert (=> b!197544 d!67403))

(declare-fun d!67405 () Bool)

(declare-fun e!136230 () Bool)

(assert (=> d!67405 e!136230))

(declare-fun res!166087 () Bool)

(assert (=> d!67405 (=> (not res!166087) (not e!136230))))

(assert (=> d!67405 (= res!166087 (= (buf!4939 (_2!9184 (increaseBitIndex!0 (_1!9181 lt!307220)))) (buf!4939 (_1!9181 lt!307220))))))

(declare-fun lt!309244 () Bool)

(assert (=> d!67405 (= lt!309244 (not (= (bvand ((_ sign_extend 24) (select (arr!5383 (buf!4939 (_1!9181 lt!307220))) (currentByte!9277 (_1!9181 lt!307220)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9272 (_1!9181 lt!307220))))) #b00000000000000000000000000000000)))))

(declare-fun lt!309242 () tuple2!17096)

(assert (=> d!67405 (= lt!309242 (tuple2!17097 (not (= (bvand ((_ sign_extend 24) (select (arr!5383 (buf!4939 (_1!9181 lt!307220))) (currentByte!9277 (_1!9181 lt!307220)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9272 (_1!9181 lt!307220))))) #b00000000000000000000000000000000)) (_2!9184 (increaseBitIndex!0 (_1!9181 lt!307220)))))))

(assert (=> d!67405 (validate_offset_bit!0 ((_ sign_extend 32) (size!4453 (buf!4939 (_1!9181 lt!307220)))) ((_ sign_extend 32) (currentByte!9277 (_1!9181 lt!307220))) ((_ sign_extend 32) (currentBit!9272 (_1!9181 lt!307220))))))

(assert (=> d!67405 (= (readBit!0 (_1!9181 lt!307220)) lt!309242)))

(declare-fun lt!309245 () (_ BitVec 64))

(declare-fun lt!309243 () (_ BitVec 64))

(declare-fun b!198430 () Bool)

(assert (=> b!198430 (= e!136230 (= (bitIndex!0 (size!4453 (buf!4939 (_2!9184 (increaseBitIndex!0 (_1!9181 lt!307220))))) (currentByte!9277 (_2!9184 (increaseBitIndex!0 (_1!9181 lt!307220)))) (currentBit!9272 (_2!9184 (increaseBitIndex!0 (_1!9181 lt!307220))))) (bvadd lt!309243 lt!309245)))))

(assert (=> b!198430 (or (not (= (bvand lt!309243 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!309245 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!309243 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!309243 lt!309245) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!198430 (= lt!309245 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!198430 (= lt!309243 (bitIndex!0 (size!4453 (buf!4939 (_1!9181 lt!307220))) (currentByte!9277 (_1!9181 lt!307220)) (currentBit!9272 (_1!9181 lt!307220))))))

(declare-fun lt!309241 () Bool)

(assert (=> b!198430 (= lt!309241 (not (= (bvand ((_ sign_extend 24) (select (arr!5383 (buf!4939 (_1!9181 lt!307220))) (currentByte!9277 (_1!9181 lt!307220)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9272 (_1!9181 lt!307220))))) #b00000000000000000000000000000000)))))

(declare-fun lt!309240 () Bool)

(assert (=> b!198430 (= lt!309240 (not (= (bvand ((_ sign_extend 24) (select (arr!5383 (buf!4939 (_1!9181 lt!307220))) (currentByte!9277 (_1!9181 lt!307220)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9272 (_1!9181 lt!307220))))) #b00000000000000000000000000000000)))))

(declare-fun lt!309246 () Bool)

(assert (=> b!198430 (= lt!309246 (not (= (bvand ((_ sign_extend 24) (select (arr!5383 (buf!4939 (_1!9181 lt!307220))) (currentByte!9277 (_1!9181 lt!307220)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9272 (_1!9181 lt!307220))))) #b00000000000000000000000000000000)))))

(assert (= (and d!67405 res!166087) b!198430))

(declare-fun m!307147 () Bool)

(assert (=> d!67405 m!307147))

(declare-fun m!307149 () Bool)

(assert (=> d!67405 m!307149))

(declare-fun m!307151 () Bool)

(assert (=> d!67405 m!307151))

(declare-fun m!307153 () Bool)

(assert (=> d!67405 m!307153))

(assert (=> b!198430 m!307043))

(assert (=> b!198430 m!307147))

(assert (=> b!198430 m!307149))

(assert (=> b!198430 m!307151))

(declare-fun m!307155 () Bool)

(assert (=> b!198430 m!307155))

(assert (=> d!66781 d!67405))

(declare-fun b!198431 () Bool)

(declare-fun res!166092 () Bool)

(declare-fun e!136231 () Bool)

(assert (=> b!198431 (=> (not res!166092) (not e!136231))))

(declare-fun lt!309247 () tuple2!17098)

(assert (=> b!198431 (= res!166092 (= (bvand (_1!9194 lt!309247) (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))) (bvand (bvor lt!307227 (ite (_2!9182 lt!307223) lt!307237 #b0000000000000000000000000000000000000000000000000000000000000000)) (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun b!198432 () Bool)

(declare-fun res!166089 () Bool)

(assert (=> b!198432 (=> (not res!166089) (not e!136231))))

(assert (=> b!198432 (= res!166089 (= (bvand (_1!9194 lt!309247) (onesLSBLong!0 nBits!348)) (_1!9194 lt!309247)))))

(declare-fun b!198433 () Bool)

(declare-fun res!166091 () Bool)

(assert (=> b!198433 (=> (not res!166091) (not e!136231))))

(declare-fun lt!309250 () (_ BitVec 64))

(declare-fun lt!309248 () (_ BitVec 64))

(assert (=> b!198433 (= res!166091 (= (bitIndex!0 (size!4453 (buf!4939 (_2!9194 lt!309247))) (currentByte!9277 (_2!9194 lt!309247)) (currentBit!9272 (_2!9194 lt!309247))) (bvadd lt!309250 lt!309248)))))

(assert (=> b!198433 (or (not (= (bvand lt!309250 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!309248 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!309250 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!309250 lt!309248) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!198433 (= lt!309248 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!198433 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!198433 (= lt!309250 (bitIndex!0 (size!4453 (buf!4939 (_1!9181 lt!307232))) (currentByte!9277 (_1!9181 lt!307232)) (currentBit!9272 (_1!9181 lt!307232))))))

(declare-fun e!136232 () tuple2!17098)

(declare-fun b!198434 () Bool)

(assert (=> b!198434 (= e!136232 (tuple2!17099 (bvor lt!307227 (ite (_2!9182 lt!307223) lt!307237 #b0000000000000000000000000000000000000000000000000000000000000000)) (_1!9181 lt!307232)))))

(declare-fun b!198435 () Bool)

(declare-fun e!136233 () Bool)

(assert (=> b!198435 (= e!136231 e!136233)))

(declare-fun res!166090 () Bool)

(assert (=> b!198435 (=> res!166090 e!136233)))

(assert (=> b!198435 (= res!166090 (not (bvslt (bvadd #b00000000000000000000000000000001 i!590) nBits!348)))))

(declare-fun lt!309252 () (_ BitVec 64))

(declare-fun b!198436 () Bool)

(assert (=> b!198436 (= e!136233 (= (= (bvand (bvlshr (_1!9194 lt!309247) lt!309252) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!9182 (readBitPure!0 (_1!9181 lt!307232)))))))

(assert (=> b!198436 (and (bvsge lt!309252 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!309252 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!198436 (= lt!309252 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun d!67407 () Bool)

(assert (=> d!67407 e!136231))

(declare-fun res!166088 () Bool)

(assert (=> d!67407 (=> (not res!166088) (not e!136231))))

(assert (=> d!67407 (= res!166088 (= (buf!4939 (_2!9194 lt!309247)) (buf!4939 (_1!9181 lt!307232))))))

(assert (=> d!67407 (= lt!309247 e!136232)))

(declare-fun c!9883 () Bool)

(assert (=> d!67407 (= c!9883 (= nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(assert (=> d!67407 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!590)) (bvsle (bvadd #b00000000000000000000000000000001 i!590) nBits!348) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!67407 (= (readNBitsLSBFirstsLoop!0 (_1!9181 lt!307232) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvor lt!307227 (ite (_2!9182 lt!307223) lt!307237 #b0000000000000000000000000000000000000000000000000000000000000000))) lt!309247)))

(declare-fun b!198437 () Bool)

(declare-fun lt!309251 () tuple2!17098)

(assert (=> b!198437 (= e!136232 (tuple2!17099 (_1!9194 lt!309251) (_2!9194 lt!309251)))))

(declare-fun lt!309249 () tuple2!17096)

(assert (=> b!198437 (= lt!309249 (readBit!0 (_1!9181 lt!307232)))))

(assert (=> b!198437 (= lt!309251 (readNBitsLSBFirstsLoop!0 (_2!9193 lt!309249) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor (bvor lt!307227 (ite (_2!9182 lt!307223) lt!307237 #b0000000000000000000000000000000000000000000000000000000000000000)) (ite (_1!9193 lt!309249) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!67407 c!9883) b!198434))

(assert (= (and d!67407 (not c!9883)) b!198437))

(assert (= (and d!67407 res!166088) b!198433))

(assert (= (and b!198433 res!166091) b!198431))

(assert (= (and b!198431 res!166092) b!198432))

(assert (= (and b!198432 res!166089) b!198435))

(assert (= (and b!198435 (not res!166090)) b!198436))

(assert (=> b!198432 m!305425))

(assert (=> b!198431 m!305381))

(declare-fun m!307157 () Bool)

(assert (=> b!198437 m!307157))

(declare-fun m!307159 () Bool)

(assert (=> b!198437 m!307159))

(declare-fun m!307161 () Bool)

(assert (=> b!198436 m!307161))

(declare-fun m!307163 () Bool)

(assert (=> b!198433 m!307163))

(declare-fun m!307165 () Bool)

(assert (=> b!198433 m!307165))

(assert (=> d!66763 d!67407))

(declare-fun d!67409 () Bool)

(declare-fun res!166093 () Bool)

(declare-fun e!136234 () Bool)

(assert (=> d!67409 (=> (not res!166093) (not e!136234))))

(assert (=> d!67409 (= res!166093 (= (size!4453 (buf!4939 (_2!9184 lt!307215))) (size!4453 (buf!4939 (ite c!9820 (_2!9184 lt!307215) (_2!9184 lt!307800))))))))

(assert (=> d!67409 (= (isPrefixOf!0 (_2!9184 lt!307215) (ite c!9820 (_2!9184 lt!307215) (_2!9184 lt!307800))) e!136234)))

(declare-fun b!198438 () Bool)

(declare-fun res!166094 () Bool)

(assert (=> b!198438 (=> (not res!166094) (not e!136234))))

(assert (=> b!198438 (= res!166094 (bvsle (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307215))) (currentByte!9277 (_2!9184 lt!307215)) (currentBit!9272 (_2!9184 lt!307215))) (bitIndex!0 (size!4453 (buf!4939 (ite c!9820 (_2!9184 lt!307215) (_2!9184 lt!307800)))) (currentByte!9277 (ite c!9820 (_2!9184 lt!307215) (_2!9184 lt!307800))) (currentBit!9272 (ite c!9820 (_2!9184 lt!307215) (_2!9184 lt!307800))))))))

(declare-fun b!198439 () Bool)

(declare-fun e!136235 () Bool)

(assert (=> b!198439 (= e!136234 e!136235)))

(declare-fun res!166095 () Bool)

(assert (=> b!198439 (=> res!166095 e!136235)))

(assert (=> b!198439 (= res!166095 (= (size!4453 (buf!4939 (_2!9184 lt!307215))) #b00000000000000000000000000000000))))

(declare-fun b!198440 () Bool)

(assert (=> b!198440 (= e!136235 (arrayBitRangesEq!0 (buf!4939 (_2!9184 lt!307215)) (buf!4939 (ite c!9820 (_2!9184 lt!307215) (_2!9184 lt!307800))) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307215))) (currentByte!9277 (_2!9184 lt!307215)) (currentBit!9272 (_2!9184 lt!307215)))))))

(assert (= (and d!67409 res!166093) b!198438))

(assert (= (and b!198438 res!166094) b!198439))

(assert (= (and b!198439 (not res!166095)) b!198440))

(assert (=> b!198438 m!304999))

(declare-fun m!307167 () Bool)

(assert (=> b!198438 m!307167))

(assert (=> b!198440 m!304999))

(assert (=> b!198440 m!304999))

(declare-fun m!307169 () Bool)

(assert (=> b!198440 m!307169))

(assert (=> bm!3101 d!67409))

(assert (=> b!197549 d!66661))

(assert (=> b!197549 d!66671))

(declare-fun d!67411 () Bool)

(declare-fun e!136236 () Bool)

(assert (=> d!67411 e!136236))

(declare-fun res!166096 () Bool)

(assert (=> d!67411 (=> (not res!166096) (not e!136236))))

(declare-fun lt!309253 () (_ BitVec 64))

(declare-fun lt!309256 () (_ BitVec 64))

(declare-fun lt!309255 () (_ BitVec 64))

(assert (=> d!67411 (= res!166096 (= lt!309253 (bvsub lt!309256 lt!309255)))))

(assert (=> d!67411 (or (= (bvand lt!309256 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!309255 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!309256 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!309256 lt!309255) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67411 (= lt!309255 (remainingBits!0 ((_ sign_extend 32) (size!4453 (buf!4939 (_2!9184 lt!307786)))) ((_ sign_extend 32) (currentByte!9277 (_2!9184 lt!307786))) ((_ sign_extend 32) (currentBit!9272 (_2!9184 lt!307786)))))))

(declare-fun lt!309254 () (_ BitVec 64))

(declare-fun lt!309258 () (_ BitVec 64))

(assert (=> d!67411 (= lt!309256 (bvmul lt!309254 lt!309258))))

(assert (=> d!67411 (or (= lt!309254 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!309258 (bvsdiv (bvmul lt!309254 lt!309258) lt!309254)))))

(assert (=> d!67411 (= lt!309258 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!67411 (= lt!309254 ((_ sign_extend 32) (size!4453 (buf!4939 (_2!9184 lt!307786)))))))

(assert (=> d!67411 (= lt!309253 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9277 (_2!9184 lt!307786))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9272 (_2!9184 lt!307786)))))))

(assert (=> d!67411 (invariant!0 (currentBit!9272 (_2!9184 lt!307786)) (currentByte!9277 (_2!9184 lt!307786)) (size!4453 (buf!4939 (_2!9184 lt!307786))))))

(assert (=> d!67411 (= (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307786))) (currentByte!9277 (_2!9184 lt!307786)) (currentBit!9272 (_2!9184 lt!307786))) lt!309253)))

(declare-fun b!198441 () Bool)

(declare-fun res!166097 () Bool)

(assert (=> b!198441 (=> (not res!166097) (not e!136236))))

(assert (=> b!198441 (= res!166097 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!309253))))

(declare-fun b!198442 () Bool)

(declare-fun lt!309257 () (_ BitVec 64))

(assert (=> b!198442 (= e!136236 (bvsle lt!309253 (bvmul lt!309257 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!198442 (or (= lt!309257 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!309257 #b0000000000000000000000000000000000000000000000000000000000001000) lt!309257)))))

(assert (=> b!198442 (= lt!309257 ((_ sign_extend 32) (size!4453 (buf!4939 (_2!9184 lt!307786)))))))

(assert (= (and d!67411 res!166096) b!198441))

(assert (= (and b!198441 res!166097) b!198442))

(declare-fun m!307171 () Bool)

(assert (=> d!67411 m!307171))

(assert (=> d!67411 m!305449))

(assert (=> b!197688 d!67411))

(assert (=> b!197688 d!66659))

(assert (=> b!197718 d!66661))

(declare-fun d!67413 () Bool)

(assert (=> d!67413 (arrayBitRangesEq!0 (buf!4939 (_2!9184 lt!307233)) (buf!4939 thiss!1204) lt!307905 lt!307893)))

(declare-fun lt!309259 () Unit!13971)

(assert (=> d!67413 (= lt!309259 (choose!8 (buf!4939 thiss!1204) (buf!4939 (_2!9184 lt!307233)) lt!307905 lt!307893))))

(assert (=> d!67413 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!307905) (bvsle lt!307905 lt!307893))))

(assert (=> d!67413 (= (arrayBitRangesEqSymmetric!0 (buf!4939 thiss!1204) (buf!4939 (_2!9184 lt!307233)) lt!307905 lt!307893) lt!309259)))

(declare-fun bs!16681 () Bool)

(assert (= bs!16681 d!67413))

(assert (=> bs!16681 m!305501))

(declare-fun m!307173 () Bool)

(assert (=> bs!16681 m!307173))

(assert (=> b!197718 d!67413))

(declare-fun b!198443 () Bool)

(declare-fun res!166098 () Bool)

(declare-fun lt!309262 () (_ BitVec 32))

(assert (=> b!198443 (= res!166098 (= lt!309262 #b00000000000000000000000000000000))))

(declare-fun e!136241 () Bool)

(assert (=> b!198443 (=> res!166098 e!136241)))

(declare-fun e!136240 () Bool)

(assert (=> b!198443 (= e!136240 e!136241)))

(declare-fun b!198444 () Bool)

(declare-fun e!136242 () Bool)

(assert (=> b!198444 (= e!136242 e!136240)))

(declare-fun res!166102 () Bool)

(declare-fun call!3132 () Bool)

(assert (=> b!198444 (= res!166102 call!3132)))

(assert (=> b!198444 (=> (not res!166102) (not e!136240))))

(declare-fun c!9884 () Bool)

(declare-fun bm!3129 () Bool)

(declare-fun lt!309261 () tuple4!262)

(declare-fun lt!309260 () (_ BitVec 32))

(assert (=> bm!3129 (= call!3132 (byteRangesEq!0 (select (arr!5383 (buf!4939 (_2!9184 lt!307233))) (_3!647 lt!309261)) (select (arr!5383 (buf!4939 thiss!1204)) (_3!647 lt!309261)) lt!309260 (ite c!9884 lt!309262 #b00000000000000000000000000001000)))))

(declare-fun b!198445 () Bool)

(declare-fun e!136238 () Bool)

(declare-fun e!136239 () Bool)

(assert (=> b!198445 (= e!136238 e!136239)))

(declare-fun res!166099 () Bool)

(assert (=> b!198445 (=> (not res!166099) (not e!136239))))

(declare-fun e!136237 () Bool)

(assert (=> b!198445 (= res!166099 e!136237)))

(declare-fun res!166101 () Bool)

(assert (=> b!198445 (=> res!166101 e!136237)))

(assert (=> b!198445 (= res!166101 (bvsge (_1!9201 lt!309261) (_2!9201 lt!309261)))))

(assert (=> b!198445 (= lt!309262 ((_ extract 31 0) (bvsrem lt!307893 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!198445 (= lt!309260 ((_ extract 31 0) (bvsrem lt!307905 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!198445 (= lt!309261 (arrayBitIndices!0 lt!307905 lt!307893))))

(declare-fun b!198447 () Bool)

(assert (=> b!198447 (= e!136241 (byteRangesEq!0 (select (arr!5383 (buf!4939 (_2!9184 lt!307233))) (_4!131 lt!309261)) (select (arr!5383 (buf!4939 thiss!1204)) (_4!131 lt!309261)) #b00000000000000000000000000000000 lt!309262))))

(declare-fun b!198448 () Bool)

(assert (=> b!198448 (= e!136237 (arrayRangesEq!693 (buf!4939 (_2!9184 lt!307233)) (buf!4939 thiss!1204) (_1!9201 lt!309261) (_2!9201 lt!309261)))))

(declare-fun b!198449 () Bool)

(assert (=> b!198449 (= e!136242 call!3132)))

(declare-fun d!67415 () Bool)

(declare-fun res!166100 () Bool)

(assert (=> d!67415 (=> res!166100 e!136238)))

(assert (=> d!67415 (= res!166100 (bvsge lt!307905 lt!307893))))

(assert (=> d!67415 (= (arrayBitRangesEq!0 (buf!4939 (_2!9184 lt!307233)) (buf!4939 thiss!1204) lt!307905 lt!307893) e!136238)))

(declare-fun b!198446 () Bool)

(assert (=> b!198446 (= e!136239 e!136242)))

(assert (=> b!198446 (= c!9884 (= (_3!647 lt!309261) (_4!131 lt!309261)))))

(assert (= (and d!67415 (not res!166100)) b!198445))

(assert (= (and b!198445 (not res!166101)) b!198448))

(assert (= (and b!198445 res!166099) b!198446))

(assert (= (and b!198446 c!9884) b!198449))

(assert (= (and b!198446 (not c!9884)) b!198444))

(assert (= (and b!198444 res!166102) b!198443))

(assert (= (and b!198443 (not res!166098)) b!198447))

(assert (= (or b!198449 b!198444) bm!3129))

(declare-fun m!307175 () Bool)

(assert (=> bm!3129 m!307175))

(declare-fun m!307177 () Bool)

(assert (=> bm!3129 m!307177))

(assert (=> bm!3129 m!307175))

(assert (=> bm!3129 m!307177))

(declare-fun m!307179 () Bool)

(assert (=> bm!3129 m!307179))

(declare-fun m!307181 () Bool)

(assert (=> b!198445 m!307181))

(declare-fun m!307183 () Bool)

(assert (=> b!198447 m!307183))

(declare-fun m!307185 () Bool)

(assert (=> b!198447 m!307185))

(assert (=> b!198447 m!307183))

(assert (=> b!198447 m!307185))

(declare-fun m!307187 () Bool)

(assert (=> b!198447 m!307187))

(declare-fun m!307189 () Bool)

(assert (=> b!198448 m!307189))

(assert (=> b!197718 d!67415))

(declare-fun d!67417 () Bool)

(declare-fun e!136243 () Bool)

(assert (=> d!67417 e!136243))

(declare-fun res!166103 () Bool)

(assert (=> d!67417 (=> (not res!166103) (not e!136243))))

(declare-fun lt!309263 () (_ BitVec 64))

(declare-fun lt!309265 () (_ BitVec 64))

(declare-fun lt!309266 () (_ BitVec 64))

(assert (=> d!67417 (= res!166103 (= lt!309263 (bvsub lt!309266 lt!309265)))))

(assert (=> d!67417 (or (= (bvand lt!309266 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!309265 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!309266 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!309266 lt!309265) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67417 (= lt!309265 (remainingBits!0 ((_ sign_extend 32) (size!4453 (buf!4939 (_1!9182 lt!307788)))) ((_ sign_extend 32) (currentByte!9277 (_1!9182 lt!307788))) ((_ sign_extend 32) (currentBit!9272 (_1!9182 lt!307788)))))))

(declare-fun lt!309264 () (_ BitVec 64))

(declare-fun lt!309268 () (_ BitVec 64))

(assert (=> d!67417 (= lt!309266 (bvmul lt!309264 lt!309268))))

(assert (=> d!67417 (or (= lt!309264 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!309268 (bvsdiv (bvmul lt!309264 lt!309268) lt!309264)))))

(assert (=> d!67417 (= lt!309268 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!67417 (= lt!309264 ((_ sign_extend 32) (size!4453 (buf!4939 (_1!9182 lt!307788)))))))

(assert (=> d!67417 (= lt!309263 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9277 (_1!9182 lt!307788))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9272 (_1!9182 lt!307788)))))))

(assert (=> d!67417 (invariant!0 (currentBit!9272 (_1!9182 lt!307788)) (currentByte!9277 (_1!9182 lt!307788)) (size!4453 (buf!4939 (_1!9182 lt!307788))))))

(assert (=> d!67417 (= (bitIndex!0 (size!4453 (buf!4939 (_1!9182 lt!307788))) (currentByte!9277 (_1!9182 lt!307788)) (currentBit!9272 (_1!9182 lt!307788))) lt!309263)))

(declare-fun b!198450 () Bool)

(declare-fun res!166104 () Bool)

(assert (=> b!198450 (=> (not res!166104) (not e!136243))))

(assert (=> b!198450 (= res!166104 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!309263))))

(declare-fun b!198451 () Bool)

(declare-fun lt!309267 () (_ BitVec 64))

(assert (=> b!198451 (= e!136243 (bvsle lt!309263 (bvmul lt!309267 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!198451 (or (= lt!309267 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!309267 #b0000000000000000000000000000000000000000000000000000000000001000) lt!309267)))))

(assert (=> b!198451 (= lt!309267 ((_ sign_extend 32) (size!4453 (buf!4939 (_1!9182 lt!307788)))))))

(assert (= (and d!67417 res!166103) b!198450))

(assert (= (and b!198450 res!166104) b!198451))

(declare-fun m!307191 () Bool)

(assert (=> d!67417 m!307191))

(declare-fun m!307193 () Bool)

(assert (=> d!67417 m!307193))

(assert (=> b!197686 d!67417))

(declare-fun d!67419 () Bool)

(declare-fun e!136244 () Bool)

(assert (=> d!67419 e!136244))

(declare-fun res!166105 () Bool)

(assert (=> d!67419 (=> (not res!166105) (not e!136244))))

(declare-fun lt!309269 () BitStream!8014)

(declare-fun lt!309270 () (_ BitVec 64))

(assert (=> d!67419 (= res!166105 (= (bvadd lt!309270 (bvsub (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307215))) (currentByte!9277 (_2!9184 lt!307215)) (currentBit!9272 (_2!9184 lt!307215))) (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307809))) (currentByte!9277 (_2!9184 lt!307809)) (currentBit!9272 (_2!9184 lt!307809))))) (bitIndex!0 (size!4453 (buf!4939 lt!309269)) (currentByte!9277 lt!309269) (currentBit!9272 lt!309269))))))

(assert (=> d!67419 (or (not (= (bvand lt!309270 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307215))) (currentByte!9277 (_2!9184 lt!307215)) (currentBit!9272 (_2!9184 lt!307215))) (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307809))) (currentByte!9277 (_2!9184 lt!307809)) (currentBit!9272 (_2!9184 lt!307809)))) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!309270 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!309270 (bvsub (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307215))) (currentByte!9277 (_2!9184 lt!307215)) (currentBit!9272 (_2!9184 lt!307215))) (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307809))) (currentByte!9277 (_2!9184 lt!307809)) (currentBit!9272 (_2!9184 lt!307809))))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67419 (= lt!309270 (bitIndex!0 (size!4453 (buf!4939 (_2!9181 lt!307785))) (currentByte!9277 (_2!9181 lt!307785)) (currentBit!9272 (_2!9181 lt!307785))))))

(assert (=> d!67419 (= lt!309269 (_2!9184 (moveBitIndex!0 (_2!9181 lt!307785) (bvsub (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307215))) (currentByte!9277 (_2!9184 lt!307215)) (currentBit!9272 (_2!9184 lt!307215))) (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307809))) (currentByte!9277 (_2!9184 lt!307809)) (currentBit!9272 (_2!9184 lt!307809)))))))))

(assert (=> d!67419 (moveBitIndexPrecond!0 (_2!9181 lt!307785) (bvsub (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307215))) (currentByte!9277 (_2!9184 lt!307215)) (currentBit!9272 (_2!9184 lt!307215))) (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307809))) (currentByte!9277 (_2!9184 lt!307809)) (currentBit!9272 (_2!9184 lt!307809)))))))

(assert (=> d!67419 (= (withMovedBitIndex!0 (_2!9181 lt!307785) (bvsub (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307215))) (currentByte!9277 (_2!9184 lt!307215)) (currentBit!9272 (_2!9184 lt!307215))) (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307809))) (currentByte!9277 (_2!9184 lt!307809)) (currentBit!9272 (_2!9184 lt!307809))))) lt!309269)))

(declare-fun b!198452 () Bool)

(assert (=> b!198452 (= e!136244 (= (size!4453 (buf!4939 (_2!9181 lt!307785))) (size!4453 (buf!4939 lt!309269))))))

(assert (= (and d!67419 res!166105) b!198452))

(declare-fun m!307195 () Bool)

(assert (=> d!67419 m!307195))

(declare-fun m!307197 () Bool)

(assert (=> d!67419 m!307197))

(declare-fun m!307199 () Bool)

(assert (=> d!67419 m!307199))

(declare-fun m!307201 () Bool)

(assert (=> d!67419 m!307201))

(assert (=> b!197686 d!67419))

(declare-fun d!67421 () Bool)

(declare-fun lt!309271 () tuple2!17096)

(assert (=> d!67421 (= lt!309271 (readBit!0 lt!307781))))

(assert (=> d!67421 (= (readBitPure!0 lt!307781) (tuple2!17075 (_2!9193 lt!309271) (_1!9193 lt!309271)))))

(declare-fun bs!16682 () Bool)

(assert (= bs!16682 d!67421))

(declare-fun m!307203 () Bool)

(assert (=> bs!16682 m!307203))

(assert (=> b!197686 d!67421))

(declare-fun b!198453 () Bool)

(declare-fun res!166107 () Bool)

(declare-fun e!136246 () Bool)

(assert (=> b!198453 (=> (not res!166107) (not e!136246))))

(declare-fun lt!309288 () tuple2!17072)

(assert (=> b!198453 (= res!166107 (isPrefixOf!0 (_2!9181 lt!309288) (_2!9184 lt!307809)))))

(declare-fun b!198454 () Bool)

(declare-fun e!136245 () Unit!13971)

(declare-fun Unit!14045 () Unit!13971)

(assert (=> b!198454 (= e!136245 Unit!14045)))

(declare-fun b!198456 () Bool)

(declare-fun lt!309291 () Unit!13971)

(assert (=> b!198456 (= e!136245 lt!309291)))

(declare-fun lt!309286 () (_ BitVec 64))

(assert (=> b!198456 (= lt!309286 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!309274 () (_ BitVec 64))

(assert (=> b!198456 (= lt!309274 (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307810))) (currentByte!9277 (_2!9184 lt!307810)) (currentBit!9272 (_2!9184 lt!307810))))))

(assert (=> b!198456 (= lt!309291 (arrayBitRangesEqSymmetric!0 (buf!4939 (_2!9184 lt!307810)) (buf!4939 (_2!9184 lt!307809)) lt!309286 lt!309274))))

(assert (=> b!198456 (arrayBitRangesEq!0 (buf!4939 (_2!9184 lt!307809)) (buf!4939 (_2!9184 lt!307810)) lt!309286 lt!309274)))

(declare-fun lt!309285 () (_ BitVec 64))

(declare-fun b!198457 () Bool)

(declare-fun lt!309283 () (_ BitVec 64))

(assert (=> b!198457 (= e!136246 (= (_1!9181 lt!309288) (withMovedBitIndex!0 (_2!9181 lt!309288) (bvsub lt!309285 lt!309283))))))

(assert (=> b!198457 (or (= (bvand lt!309285 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!309283 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!309285 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!309285 lt!309283) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!198457 (= lt!309283 (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307809))) (currentByte!9277 (_2!9184 lt!307809)) (currentBit!9272 (_2!9184 lt!307809))))))

(assert (=> b!198457 (= lt!309285 (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307810))) (currentByte!9277 (_2!9184 lt!307810)) (currentBit!9272 (_2!9184 lt!307810))))))

(declare-fun d!67423 () Bool)

(assert (=> d!67423 e!136246))

(declare-fun res!166108 () Bool)

(assert (=> d!67423 (=> (not res!166108) (not e!136246))))

(assert (=> d!67423 (= res!166108 (isPrefixOf!0 (_1!9181 lt!309288) (_2!9181 lt!309288)))))

(declare-fun lt!309277 () BitStream!8014)

(assert (=> d!67423 (= lt!309288 (tuple2!17073 lt!309277 (_2!9184 lt!307809)))))

(declare-fun lt!309273 () Unit!13971)

(declare-fun lt!309278 () Unit!13971)

(assert (=> d!67423 (= lt!309273 lt!309278)))

(assert (=> d!67423 (isPrefixOf!0 lt!309277 (_2!9184 lt!307809))))

(assert (=> d!67423 (= lt!309278 (lemmaIsPrefixTransitive!0 lt!309277 (_2!9184 lt!307809) (_2!9184 lt!307809)))))

(declare-fun lt!309272 () Unit!13971)

(declare-fun lt!309276 () Unit!13971)

(assert (=> d!67423 (= lt!309272 lt!309276)))

(assert (=> d!67423 (isPrefixOf!0 lt!309277 (_2!9184 lt!307809))))

(assert (=> d!67423 (= lt!309276 (lemmaIsPrefixTransitive!0 lt!309277 (_2!9184 lt!307810) (_2!9184 lt!307809)))))

(declare-fun lt!309281 () Unit!13971)

(assert (=> d!67423 (= lt!309281 e!136245)))

(declare-fun c!9885 () Bool)

(assert (=> d!67423 (= c!9885 (not (= (size!4453 (buf!4939 (_2!9184 lt!307810))) #b00000000000000000000000000000000)))))

(declare-fun lt!309287 () Unit!13971)

(declare-fun lt!309284 () Unit!13971)

(assert (=> d!67423 (= lt!309287 lt!309284)))

(assert (=> d!67423 (isPrefixOf!0 (_2!9184 lt!307809) (_2!9184 lt!307809))))

(assert (=> d!67423 (= lt!309284 (lemmaIsPrefixRefl!0 (_2!9184 lt!307809)))))

(declare-fun lt!309282 () Unit!13971)

(declare-fun lt!309280 () Unit!13971)

(assert (=> d!67423 (= lt!309282 lt!309280)))

(assert (=> d!67423 (= lt!309280 (lemmaIsPrefixRefl!0 (_2!9184 lt!307809)))))

(declare-fun lt!309289 () Unit!13971)

(declare-fun lt!309275 () Unit!13971)

(assert (=> d!67423 (= lt!309289 lt!309275)))

(assert (=> d!67423 (isPrefixOf!0 lt!309277 lt!309277)))

(assert (=> d!67423 (= lt!309275 (lemmaIsPrefixRefl!0 lt!309277))))

(declare-fun lt!309279 () Unit!13971)

(declare-fun lt!309290 () Unit!13971)

(assert (=> d!67423 (= lt!309279 lt!309290)))

(assert (=> d!67423 (isPrefixOf!0 (_2!9184 lt!307810) (_2!9184 lt!307810))))

(assert (=> d!67423 (= lt!309290 (lemmaIsPrefixRefl!0 (_2!9184 lt!307810)))))

(assert (=> d!67423 (= lt!309277 (BitStream!8015 (buf!4939 (_2!9184 lt!307809)) (currentByte!9277 (_2!9184 lt!307810)) (currentBit!9272 (_2!9184 lt!307810))))))

(assert (=> d!67423 (isPrefixOf!0 (_2!9184 lt!307810) (_2!9184 lt!307809))))

(assert (=> d!67423 (= (reader!0 (_2!9184 lt!307810) (_2!9184 lt!307809)) lt!309288)))

(declare-fun b!198455 () Bool)

(declare-fun res!166106 () Bool)

(assert (=> b!198455 (=> (not res!166106) (not e!136246))))

(assert (=> b!198455 (= res!166106 (isPrefixOf!0 (_1!9181 lt!309288) (_2!9184 lt!307810)))))

(assert (= (and d!67423 c!9885) b!198456))

(assert (= (and d!67423 (not c!9885)) b!198454))

(assert (= (and d!67423 res!166108) b!198455))

(assert (= (and b!198455 res!166106) b!198453))

(assert (= (and b!198453 res!166107) b!198457))

(declare-fun m!307205 () Bool)

(assert (=> b!198453 m!307205))

(assert (=> b!198456 m!305413))

(declare-fun m!307207 () Bool)

(assert (=> b!198456 m!307207))

(declare-fun m!307209 () Bool)

(assert (=> b!198456 m!307209))

(declare-fun m!307211 () Bool)

(assert (=> b!198457 m!307211))

(assert (=> b!198457 m!305405))

(assert (=> b!198457 m!305413))

(declare-fun m!307213 () Bool)

(assert (=> d!67423 m!307213))

(declare-fun m!307215 () Bool)

(assert (=> d!67423 m!307215))

(declare-fun m!307217 () Bool)

(assert (=> d!67423 m!307217))

(declare-fun m!307219 () Bool)

(assert (=> d!67423 m!307219))

(declare-fun m!307221 () Bool)

(assert (=> d!67423 m!307221))

(declare-fun m!307223 () Bool)

(assert (=> d!67423 m!307223))

(declare-fun m!307225 () Bool)

(assert (=> d!67423 m!307225))

(declare-fun m!307227 () Bool)

(assert (=> d!67423 m!307227))

(declare-fun m!307229 () Bool)

(assert (=> d!67423 m!307229))

(declare-fun m!307231 () Bool)

(assert (=> d!67423 m!307231))

(declare-fun m!307233 () Bool)

(assert (=> d!67423 m!307233))

(declare-fun m!307235 () Bool)

(assert (=> b!198455 m!307235))

(assert (=> b!197686 d!67423))

(assert (=> b!197686 d!67333))

(declare-fun d!67425 () Bool)

(assert (=> d!67425 (= (invariant!0 (currentBit!9272 lt!307794) (currentByte!9277 lt!307794) (size!4453 (buf!4939 (_2!9184 lt!307809)))) (and (bvsge (currentBit!9272 lt!307794) #b00000000000000000000000000000000) (bvslt (currentBit!9272 lt!307794) #b00000000000000000000000000001000) (bvsge (currentByte!9277 lt!307794) #b00000000000000000000000000000000) (or (bvslt (currentByte!9277 lt!307794) (size!4453 (buf!4939 (_2!9184 lt!307809)))) (and (= (currentBit!9272 lt!307794) #b00000000000000000000000000000000) (= (currentByte!9277 lt!307794) (size!4453 (buf!4939 (_2!9184 lt!307809))))))))))

(assert (=> b!197686 d!67425))

(declare-fun d!67427 () Bool)

(declare-fun lt!309292 () tuple2!17098)

(assert (=> d!67427 (= lt!309292 (readNBitsLSBFirstsLoop!0 (withMovedBitIndex!0 (_1!9181 lt!307785) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!307799 e!135738)))))

(assert (=> d!67427 (= (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9181 lt!307785) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!307799 e!135738)) (tuple2!17077 (_2!9194 lt!309292) (_1!9194 lt!309292)))))

(declare-fun bs!16683 () Bool)

(assert (= bs!16683 d!67427))

(assert (=> bs!16683 m!305369))

(declare-fun m!307237 () Bool)

(assert (=> bs!16683 m!307237))

(assert (=> b!197686 d!67427))

(declare-fun d!67429 () Bool)

(assert (=> d!67429 (= (invariant!0 (currentBit!9272 (_2!9184 lt!307809)) (currentByte!9277 (_2!9184 lt!307809)) (size!4453 (buf!4939 (_2!9184 lt!307809)))) (and (bvsge (currentBit!9272 (_2!9184 lt!307809)) #b00000000000000000000000000000000) (bvslt (currentBit!9272 (_2!9184 lt!307809)) #b00000000000000000000000000001000) (bvsge (currentByte!9277 (_2!9184 lt!307809)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9277 (_2!9184 lt!307809)) (size!4453 (buf!4939 (_2!9184 lt!307809)))) (and (= (currentBit!9272 (_2!9184 lt!307809)) #b00000000000000000000000000000000) (= (currentByte!9277 (_2!9184 lt!307809)) (size!4453 (buf!4939 (_2!9184 lt!307809))))))))))

(assert (=> b!197686 d!67429))

(declare-fun d!67431 () Bool)

(declare-fun e!136247 () Bool)

(assert (=> d!67431 e!136247))

(declare-fun res!166109 () Bool)

(assert (=> d!67431 (=> (not res!166109) (not e!136247))))

(declare-fun lt!309293 () (_ BitVec 64))

(declare-fun lt!309295 () (_ BitVec 64))

(declare-fun lt!309296 () (_ BitVec 64))

(assert (=> d!67431 (= res!166109 (= lt!309293 (bvsub lt!309296 lt!309295)))))

(assert (=> d!67431 (or (= (bvand lt!309296 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!309295 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!309296 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!309296 lt!309295) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67431 (= lt!309295 (remainingBits!0 ((_ sign_extend 32) (size!4453 (buf!4939 (_1!9182 lt!307807)))) ((_ sign_extend 32) (currentByte!9277 (_1!9182 lt!307807))) ((_ sign_extend 32) (currentBit!9272 (_1!9182 lt!307807)))))))

(declare-fun lt!309294 () (_ BitVec 64))

(declare-fun lt!309298 () (_ BitVec 64))

(assert (=> d!67431 (= lt!309296 (bvmul lt!309294 lt!309298))))

(assert (=> d!67431 (or (= lt!309294 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!309298 (bvsdiv (bvmul lt!309294 lt!309298) lt!309294)))))

(assert (=> d!67431 (= lt!309298 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!67431 (= lt!309294 ((_ sign_extend 32) (size!4453 (buf!4939 (_1!9182 lt!307807)))))))

(assert (=> d!67431 (= lt!309293 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9277 (_1!9182 lt!307807))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9272 (_1!9182 lt!307807)))))))

(assert (=> d!67431 (invariant!0 (currentBit!9272 (_1!9182 lt!307807)) (currentByte!9277 (_1!9182 lt!307807)) (size!4453 (buf!4939 (_1!9182 lt!307807))))))

(assert (=> d!67431 (= (bitIndex!0 (size!4453 (buf!4939 (_1!9182 lt!307807))) (currentByte!9277 (_1!9182 lt!307807)) (currentBit!9272 (_1!9182 lt!307807))) lt!309293)))

(declare-fun b!198458 () Bool)

(declare-fun res!166110 () Bool)

(assert (=> b!198458 (=> (not res!166110) (not e!136247))))

(assert (=> b!198458 (= res!166110 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!309293))))

(declare-fun b!198459 () Bool)

(declare-fun lt!309297 () (_ BitVec 64))

(assert (=> b!198459 (= e!136247 (bvsle lt!309293 (bvmul lt!309297 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!198459 (or (= lt!309297 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!309297 #b0000000000000000000000000000000000000000000000000000000000001000) lt!309297)))))

(assert (=> b!198459 (= lt!309297 ((_ sign_extend 32) (size!4453 (buf!4939 (_1!9182 lt!307807)))))))

(assert (= (and d!67431 res!166109) b!198458))

(assert (= (and b!198458 res!166110) b!198459))

(declare-fun m!307239 () Bool)

(assert (=> d!67431 m!307239))

(declare-fun m!307241 () Bool)

(assert (=> d!67431 m!307241))

(assert (=> b!197686 d!67431))

(declare-fun b!198462 () Bool)

(declare-fun e!136248 () Bool)

(declare-fun e!136249 () Bool)

(assert (=> b!198462 (= e!136248 e!136249)))

(declare-fun res!166112 () Bool)

(assert (=> b!198462 (=> (not res!166112) (not e!136249))))

(declare-fun lt!309302 () tuple2!17074)

(declare-fun lt!309299 () tuple2!17078)

(assert (=> b!198462 (= res!166112 (and (= (_2!9182 lt!309302) lt!307787) (= (_1!9182 lt!309302) (_2!9184 lt!309299))))))

(assert (=> b!198462 (= lt!309302 (readBitPure!0 (readerFrom!0 (_2!9184 lt!309299) (currentBit!9272 (_2!9184 lt!307215)) (currentByte!9277 (_2!9184 lt!307215)))))))

(declare-fun b!198460 () Bool)

(declare-fun res!166113 () Bool)

(assert (=> b!198460 (=> (not res!166113) (not e!136248))))

(declare-fun lt!309301 () (_ BitVec 64))

(declare-fun lt!309300 () (_ BitVec 64))

(assert (=> b!198460 (= res!166113 (= (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!309299))) (currentByte!9277 (_2!9184 lt!309299)) (currentBit!9272 (_2!9184 lt!309299))) (bvadd lt!309301 lt!309300)))))

(assert (=> b!198460 (or (not (= (bvand lt!309301 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!309300 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!309301 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!309301 lt!309300) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!198460 (= lt!309300 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!198460 (= lt!309301 (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307215))) (currentByte!9277 (_2!9184 lt!307215)) (currentBit!9272 (_2!9184 lt!307215))))))

(declare-fun d!67433 () Bool)

(assert (=> d!67433 e!136248))

(declare-fun res!166114 () Bool)

(assert (=> d!67433 (=> (not res!166114) (not e!136248))))

(assert (=> d!67433 (= res!166114 (= (size!4453 (buf!4939 (_2!9184 lt!307215))) (size!4453 (buf!4939 (_2!9184 lt!309299)))))))

(assert (=> d!67433 (= lt!309299 (choose!16 (_2!9184 lt!307215) lt!307787))))

(assert (=> d!67433 (validate_offset_bit!0 ((_ sign_extend 32) (size!4453 (buf!4939 (_2!9184 lt!307215)))) ((_ sign_extend 32) (currentByte!9277 (_2!9184 lt!307215))) ((_ sign_extend 32) (currentBit!9272 (_2!9184 lt!307215))))))

(assert (=> d!67433 (= (appendBit!0 (_2!9184 lt!307215) lt!307787) lt!309299)))

(declare-fun b!198463 () Bool)

(assert (=> b!198463 (= e!136249 (= (bitIndex!0 (size!4453 (buf!4939 (_1!9182 lt!309302))) (currentByte!9277 (_1!9182 lt!309302)) (currentBit!9272 (_1!9182 lt!309302))) (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!309299))) (currentByte!9277 (_2!9184 lt!309299)) (currentBit!9272 (_2!9184 lt!309299)))))))

(declare-fun b!198461 () Bool)

(declare-fun res!166111 () Bool)

(assert (=> b!198461 (=> (not res!166111) (not e!136248))))

(assert (=> b!198461 (= res!166111 (isPrefixOf!0 (_2!9184 lt!307215) (_2!9184 lt!309299)))))

(assert (= (and d!67433 res!166114) b!198460))

(assert (= (and b!198460 res!166113) b!198461))

(assert (= (and b!198461 res!166111) b!198462))

(assert (= (and b!198462 res!166112) b!198463))

(declare-fun m!307243 () Bool)

(assert (=> b!198462 m!307243))

(assert (=> b!198462 m!307243))

(declare-fun m!307245 () Bool)

(assert (=> b!198462 m!307245))

(declare-fun m!307247 () Bool)

(assert (=> b!198461 m!307247))

(declare-fun m!307249 () Bool)

(assert (=> b!198463 m!307249))

(declare-fun m!307251 () Bool)

(assert (=> b!198463 m!307251))

(declare-fun m!307253 () Bool)

(assert (=> d!67433 m!307253))

(declare-fun m!307255 () Bool)

(assert (=> d!67433 m!307255))

(assert (=> b!198460 m!307251))

(assert (=> b!198460 m!304999))

(assert (=> b!197686 d!67433))

(declare-fun b!198464 () Bool)

(declare-fun e!136257 () Bool)

(declare-fun lt!309346 () tuple2!17074)

(declare-fun lt!309342 () tuple2!17078)

(assert (=> b!198464 (= e!136257 (= (bitIndex!0 (size!4453 (buf!4939 (_1!9182 lt!309346))) (currentByte!9277 (_1!9182 lt!309346)) (currentBit!9272 (_1!9182 lt!309346))) (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!309342))) (currentByte!9277 (_2!9184 lt!309342)) (currentBit!9272 (_2!9184 lt!309342)))))))

(declare-fun b!198465 () Bool)

(declare-fun res!166122 () Bool)

(declare-fun e!136258 () Bool)

(assert (=> b!198465 (=> (not res!166122) (not e!136258))))

(declare-fun lt!309328 () tuple2!17078)

(assert (=> b!198465 (= res!166122 (= (size!4453 (buf!4939 (_2!9184 lt!307810))) (size!4453 (buf!4939 (_2!9184 lt!309328)))))))

(declare-fun b!198466 () Bool)

(declare-fun e!136251 () Bool)

(declare-fun lt!309307 () (_ BitVec 64))

(assert (=> b!198466 (= e!136251 (validate_offset_bits!1 ((_ sign_extend 32) (size!4453 (buf!4939 (_2!9184 lt!307810)))) ((_ sign_extend 32) (currentByte!9277 (_2!9184 lt!307810))) ((_ sign_extend 32) (currentBit!9272 (_2!9184 lt!307810))) lt!309307))))

(declare-fun d!67435 () Bool)

(assert (=> d!67435 e!136258))

(declare-fun res!166124 () Bool)

(assert (=> d!67435 (=> (not res!166124) (not e!136258))))

(assert (=> d!67435 (= res!166124 (invariant!0 (currentBit!9272 (_2!9184 lt!309328)) (currentByte!9277 (_2!9184 lt!309328)) (size!4453 (buf!4939 (_2!9184 lt!309328)))))))

(declare-fun e!136256 () tuple2!17078)

(assert (=> d!67435 (= lt!309328 e!136256)))

(declare-fun c!9886 () Bool)

(assert (=> d!67435 (= c!9886 (= (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) nBits!348))))

(assert (=> d!67435 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!67435 (= (appendBitsLSBFirstLoopTR!0 (_2!9184 lt!307810) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)) lt!309328)))

(declare-fun b!198467 () Bool)

(declare-fun e!136254 () Bool)

(assert (=> b!198467 (= e!136258 e!136254)))

(declare-fun res!166126 () Bool)

(assert (=> b!198467 (=> (not res!166126) (not e!136254))))

(declare-fun lt!309334 () tuple2!17076)

(assert (=> b!198467 (= res!166126 (= (_2!9183 lt!309334) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun lt!309339 () tuple2!17072)

(assert (=> b!198467 (= lt!309334 (readNBitsLSBFirstsLoopPure!0 (_1!9181 lt!309339) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))))

(declare-fun lt!309347 () Unit!13971)

(declare-fun lt!309340 () Unit!13971)

(assert (=> b!198467 (= lt!309347 lt!309340)))

(assert (=> b!198467 (validate_offset_bits!1 ((_ sign_extend 32) (size!4453 (buf!4939 (_2!9184 lt!309328)))) ((_ sign_extend 32) (currentByte!9277 (_2!9184 lt!307810))) ((_ sign_extend 32) (currentBit!9272 (_2!9184 lt!307810))) lt!309307)))

(assert (=> b!198467 (= lt!309340 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9184 lt!307810) (buf!4939 (_2!9184 lt!309328)) lt!309307))))

(assert (=> b!198467 e!136251))

(declare-fun res!166121 () Bool)

(assert (=> b!198467 (=> (not res!166121) (not e!136251))))

(assert (=> b!198467 (= res!166121 (and (= (size!4453 (buf!4939 (_2!9184 lt!307810))) (size!4453 (buf!4939 (_2!9184 lt!309328)))) (bvsge lt!309307 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!198467 (= lt!309307 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001))))))

(assert (=> b!198467 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!198467 (= lt!309339 (reader!0 (_2!9184 lt!307810) (_2!9184 lt!309328)))))

(declare-fun b!198468 () Bool)

(declare-fun lt!309351 () tuple2!17078)

(assert (=> b!198468 (= e!136256 (tuple2!17079 (_1!9184 lt!309351) (_2!9184 lt!309351)))))

(declare-fun lt!309329 () Bool)

(assert (=> b!198468 (= lt!309329 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!198468 (= lt!309342 (appendBit!0 (_2!9184 lt!307810) lt!309329))))

(declare-fun res!166120 () Bool)

(assert (=> b!198468 (= res!166120 (= (size!4453 (buf!4939 (_2!9184 lt!307810))) (size!4453 (buf!4939 (_2!9184 lt!309342)))))))

(declare-fun e!136255 () Bool)

(assert (=> b!198468 (=> (not res!166120) (not e!136255))))

(assert (=> b!198468 e!136255))

(declare-fun lt!309352 () tuple2!17078)

(assert (=> b!198468 (= lt!309352 lt!309342)))

(assert (=> b!198468 (= lt!309351 (appendBitsLSBFirstLoopTR!0 (_2!9184 lt!309352) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(declare-fun lt!309337 () Unit!13971)

(assert (=> b!198468 (= lt!309337 (lemmaIsPrefixTransitive!0 (_2!9184 lt!307810) (_2!9184 lt!309352) (_2!9184 lt!309351)))))

(assert (=> b!198468 (isPrefixOf!0 (_2!9184 lt!307810) (_2!9184 lt!309351))))

(declare-fun lt!309315 () Unit!13971)

(assert (=> b!198468 (= lt!309315 lt!309337)))

(assert (=> b!198468 (invariant!0 (currentBit!9272 (_2!9184 lt!307810)) (currentByte!9277 (_2!9184 lt!307810)) (size!4453 (buf!4939 (_2!9184 lt!309352))))))

(declare-fun lt!309336 () BitStream!8014)

(assert (=> b!198468 (= lt!309336 (BitStream!8015 (buf!4939 (_2!9184 lt!309352)) (currentByte!9277 (_2!9184 lt!307810)) (currentBit!9272 (_2!9184 lt!307810))))))

(assert (=> b!198468 (invariant!0 (currentBit!9272 lt!309336) (currentByte!9277 lt!309336) (size!4453 (buf!4939 (_2!9184 lt!309351))))))

(declare-fun lt!309323 () BitStream!8014)

(assert (=> b!198468 (= lt!309323 (BitStream!8015 (buf!4939 (_2!9184 lt!309351)) (currentByte!9277 lt!309336) (currentBit!9272 lt!309336)))))

(declare-fun lt!309330 () tuple2!17074)

(assert (=> b!198468 (= lt!309330 (readBitPure!0 lt!309336))))

(declare-fun lt!309349 () tuple2!17074)

(assert (=> b!198468 (= lt!309349 (readBitPure!0 lt!309323))))

(declare-fun lt!309331 () Unit!13971)

(assert (=> b!198468 (= lt!309331 (readBitPrefixLemma!0 lt!309336 (_2!9184 lt!309351)))))

(declare-fun res!166116 () Bool)

(assert (=> b!198468 (= res!166116 (= (bitIndex!0 (size!4453 (buf!4939 (_1!9182 lt!309330))) (currentByte!9277 (_1!9182 lt!309330)) (currentBit!9272 (_1!9182 lt!309330))) (bitIndex!0 (size!4453 (buf!4939 (_1!9182 lt!309349))) (currentByte!9277 (_1!9182 lt!309349)) (currentBit!9272 (_1!9182 lt!309349)))))))

(declare-fun e!136250 () Bool)

(assert (=> b!198468 (=> (not res!166116) (not e!136250))))

(assert (=> b!198468 e!136250))

(declare-fun lt!309318 () Unit!13971)

(assert (=> b!198468 (= lt!309318 lt!309331)))

(declare-fun lt!309327 () tuple2!17072)

(assert (=> b!198468 (= lt!309327 (reader!0 (_2!9184 lt!307810) (_2!9184 lt!309351)))))

(declare-fun lt!309325 () tuple2!17072)

(assert (=> b!198468 (= lt!309325 (reader!0 (_2!9184 lt!309352) (_2!9184 lt!309351)))))

(declare-fun lt!309314 () tuple2!17074)

(assert (=> b!198468 (= lt!309314 (readBitPure!0 (_1!9181 lt!309327)))))

(assert (=> b!198468 (= (_2!9182 lt!309314) lt!309329)))

(declare-fun lt!309333 () Unit!13971)

(declare-fun Unit!14046 () Unit!13971)

(assert (=> b!198468 (= lt!309333 Unit!14046)))

(declare-fun lt!309341 () (_ BitVec 64))

(assert (=> b!198468 (= lt!309341 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001))))))

(declare-fun lt!309338 () (_ BitVec 64))

(assert (=> b!198468 (= lt!309338 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001))))))

(declare-fun lt!309332 () Unit!13971)

(assert (=> b!198468 (= lt!309332 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9184 lt!307810) (buf!4939 (_2!9184 lt!309351)) lt!309338))))

(assert (=> b!198468 (validate_offset_bits!1 ((_ sign_extend 32) (size!4453 (buf!4939 (_2!9184 lt!309351)))) ((_ sign_extend 32) (currentByte!9277 (_2!9184 lt!307810))) ((_ sign_extend 32) (currentBit!9272 (_2!9184 lt!307810))) lt!309338)))

(declare-fun lt!309306 () Unit!13971)

(assert (=> b!198468 (= lt!309306 lt!309332)))

(declare-fun lt!309308 () tuple2!17076)

(assert (=> b!198468 (= lt!309308 (readNBitsLSBFirstsLoopPure!0 (_1!9181 lt!309327) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) lt!309341))))

(declare-fun lt!309357 () (_ BitVec 64))

(assert (=> b!198468 (= lt!309357 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))))

(declare-fun lt!309358 () Unit!13971)

(assert (=> b!198468 (= lt!309358 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9184 lt!309352) (buf!4939 (_2!9184 lt!309351)) lt!309357))))

(assert (=> b!198468 (validate_offset_bits!1 ((_ sign_extend 32) (size!4453 (buf!4939 (_2!9184 lt!309351)))) ((_ sign_extend 32) (currentByte!9277 (_2!9184 lt!309352))) ((_ sign_extend 32) (currentBit!9272 (_2!9184 lt!309352))) lt!309357)))

(declare-fun lt!309313 () Unit!13971)

(assert (=> b!198468 (= lt!309313 lt!309358)))

(declare-fun lt!309305 () tuple2!17076)

(assert (=> b!198468 (= lt!309305 (readNBitsLSBFirstsLoopPure!0 (_1!9181 lt!309325) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvor lt!309341 (ite (_2!9182 lt!309314) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!309343 () tuple2!17076)

(assert (=> b!198468 (= lt!309343 (readNBitsLSBFirstsLoopPure!0 (_1!9181 lt!309327) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) lt!309341))))

(declare-fun c!9887 () Bool)

(assert (=> b!198468 (= c!9887 (_2!9182 (readBitPure!0 (_1!9181 lt!309327))))))

(declare-fun lt!309324 () tuple2!17076)

(declare-fun e!136253 () (_ BitVec 64))

(assert (=> b!198468 (= lt!309324 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9181 lt!309327) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvor lt!309341 e!136253)))))

(declare-fun lt!309309 () Unit!13971)

(assert (=> b!198468 (= lt!309309 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9181 lt!309327) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) lt!309341))))

(assert (=> b!198468 (and (= (_2!9183 lt!309343) (_2!9183 lt!309324)) (= (_1!9183 lt!309343) (_1!9183 lt!309324)))))

(declare-fun lt!309326 () Unit!13971)

(assert (=> b!198468 (= lt!309326 lt!309309)))

(assert (=> b!198468 (= (_1!9181 lt!309327) (withMovedBitIndex!0 (_2!9181 lt!309327) (bvsub (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307810))) (currentByte!9277 (_2!9184 lt!307810)) (currentBit!9272 (_2!9184 lt!307810))) (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!309351))) (currentByte!9277 (_2!9184 lt!309351)) (currentBit!9272 (_2!9184 lt!309351))))))))

(declare-fun lt!309345 () Unit!13971)

(declare-fun Unit!14047 () Unit!13971)

(assert (=> b!198468 (= lt!309345 Unit!14047)))

(assert (=> b!198468 (= (_1!9181 lt!309325) (withMovedBitIndex!0 (_2!9181 lt!309325) (bvsub (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!309352))) (currentByte!9277 (_2!9184 lt!309352)) (currentBit!9272 (_2!9184 lt!309352))) (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!309351))) (currentByte!9277 (_2!9184 lt!309351)) (currentBit!9272 (_2!9184 lt!309351))))))))

(declare-fun lt!309344 () Unit!13971)

(declare-fun Unit!14048 () Unit!13971)

(assert (=> b!198468 (= lt!309344 Unit!14048)))

(assert (=> b!198468 (= (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307810))) (currentByte!9277 (_2!9184 lt!307810)) (currentBit!9272 (_2!9184 lt!307810))) (bvsub (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!309352))) (currentByte!9277 (_2!9184 lt!309352)) (currentBit!9272 (_2!9184 lt!309352))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!309335 () Unit!13971)

(declare-fun Unit!14049 () Unit!13971)

(assert (=> b!198468 (= lt!309335 Unit!14049)))

(assert (=> b!198468 (= (_2!9183 lt!309308) (_2!9183 lt!309305))))

(declare-fun lt!309310 () Unit!13971)

(declare-fun Unit!14050 () Unit!13971)

(assert (=> b!198468 (= lt!309310 Unit!14050)))

(assert (=> b!198468 (invariant!0 (currentBit!9272 (_2!9184 lt!309351)) (currentByte!9277 (_2!9184 lt!309351)) (size!4453 (buf!4939 (_2!9184 lt!309351))))))

(declare-fun lt!309356 () Unit!13971)

(declare-fun Unit!14051 () Unit!13971)

(assert (=> b!198468 (= lt!309356 Unit!14051)))

(assert (=> b!198468 (= (size!4453 (buf!4939 (_2!9184 lt!307810))) (size!4453 (buf!4939 (_2!9184 lt!309351))))))

(declare-fun lt!309354 () Unit!13971)

(declare-fun Unit!14052 () Unit!13971)

(assert (=> b!198468 (= lt!309354 Unit!14052)))

(assert (=> b!198468 (= (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!309351))) (currentByte!9277 (_2!9184 lt!309351)) (currentBit!9272 (_2!9184 lt!309351))) (bvsub (bvadd (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307810))) (currentByte!9277 (_2!9184 lt!307810)) (currentBit!9272 (_2!9184 lt!307810))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001))))))

(declare-fun lt!309316 () Unit!13971)

(declare-fun Unit!14053 () Unit!13971)

(assert (=> b!198468 (= lt!309316 Unit!14053)))

(declare-fun lt!309320 () Unit!13971)

(declare-fun Unit!14054 () Unit!13971)

(assert (=> b!198468 (= lt!309320 Unit!14054)))

(declare-fun lt!309312 () tuple2!17072)

(assert (=> b!198468 (= lt!309312 (reader!0 (_2!9184 lt!307810) (_2!9184 lt!309351)))))

(declare-fun lt!309348 () (_ BitVec 64))

(assert (=> b!198468 (= lt!309348 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001))))))

(declare-fun lt!309317 () Unit!13971)

(assert (=> b!198468 (= lt!309317 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9184 lt!307810) (buf!4939 (_2!9184 lt!309351)) lt!309348))))

(assert (=> b!198468 (validate_offset_bits!1 ((_ sign_extend 32) (size!4453 (buf!4939 (_2!9184 lt!309351)))) ((_ sign_extend 32) (currentByte!9277 (_2!9184 lt!307810))) ((_ sign_extend 32) (currentBit!9272 (_2!9184 lt!307810))) lt!309348)))

(declare-fun lt!309303 () Unit!13971)

(assert (=> b!198468 (= lt!309303 lt!309317)))

(declare-fun lt!309319 () tuple2!17076)

(assert (=> b!198468 (= lt!309319 (readNBitsLSBFirstsLoopPure!0 (_1!9181 lt!309312) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))))

(declare-fun res!166117 () Bool)

(assert (=> b!198468 (= res!166117 (= (_2!9183 lt!309319) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun e!136252 () Bool)

(assert (=> b!198468 (=> (not res!166117) (not e!136252))))

(assert (=> b!198468 e!136252))

(declare-fun lt!309311 () Unit!13971)

(declare-fun Unit!14055 () Unit!13971)

(assert (=> b!198468 (= lt!309311 Unit!14055)))

(declare-fun b!198469 () Bool)

(declare-fun res!166115 () Bool)

(assert (=> b!198469 (= res!166115 (= (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!309342))) (currentByte!9277 (_2!9184 lt!309342)) (currentBit!9272 (_2!9184 lt!309342))) (bvadd (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307810))) (currentByte!9277 (_2!9184 lt!307810)) (currentBit!9272 (_2!9184 lt!307810))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!198469 (=> (not res!166115) (not e!136255))))

(declare-fun b!198470 () Bool)

(declare-fun res!166123 () Bool)

(assert (=> b!198470 (=> (not res!166123) (not e!136258))))

(declare-fun lt!309321 () (_ BitVec 64))

(declare-fun lt!309322 () (_ BitVec 64))

(assert (=> b!198470 (= res!166123 (= (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!309328))) (currentByte!9277 (_2!9184 lt!309328)) (currentBit!9272 (_2!9184 lt!309328))) (bvsub lt!309322 lt!309321)))))

(assert (=> b!198470 (or (= (bvand lt!309322 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!309321 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!309322 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!309322 lt!309321) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!198470 (= lt!309321 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!309304 () (_ BitVec 64))

(declare-fun lt!309350 () (_ BitVec 64))

(assert (=> b!198470 (= lt!309322 (bvadd lt!309304 lt!309350))))

(assert (=> b!198470 (or (not (= (bvand lt!309304 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!309350 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!309304 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!309304 lt!309350) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!198470 (= lt!309350 ((_ sign_extend 32) nBits!348))))

(assert (=> b!198470 (= lt!309304 (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307810))) (currentByte!9277 (_2!9184 lt!307810)) (currentBit!9272 (_2!9184 lt!307810))))))

(declare-fun b!198471 () Bool)

(assert (=> b!198471 (= e!136254 (= (_1!9183 lt!309334) (_2!9181 lt!309339)))))

(declare-fun call!3133 () Bool)

(declare-fun bm!3130 () Bool)

(assert (=> bm!3130 (= call!3133 (isPrefixOf!0 (_2!9184 lt!307810) (ite c!9886 (_2!9184 lt!307810) (_2!9184 lt!309342))))))

(declare-fun b!198472 () Bool)

(declare-fun Unit!14056 () Unit!13971)

(assert (=> b!198472 (= e!136256 (tuple2!17079 Unit!14056 (_2!9184 lt!307810)))))

(declare-fun lt!309353 () Unit!13971)

(assert (=> b!198472 (= lt!309353 (lemmaIsPrefixRefl!0 (_2!9184 lt!307810)))))

(assert (=> b!198472 call!3133))

(declare-fun lt!309355 () Unit!13971)

(assert (=> b!198472 (= lt!309355 lt!309353)))

(declare-fun b!198473 () Bool)

(assert (=> b!198473 (= e!136252 (= (_1!9183 lt!309319) (_2!9181 lt!309312)))))

(declare-fun b!198474 () Bool)

(assert (=> b!198474 (= e!136250 (= (_2!9182 lt!309330) (_2!9182 lt!309349)))))

(declare-fun b!198475 () Bool)

(declare-fun res!166119 () Bool)

(assert (=> b!198475 (=> (not res!166119) (not e!136258))))

(assert (=> b!198475 (= res!166119 (isPrefixOf!0 (_2!9184 lt!307810) (_2!9184 lt!309328)))))

(declare-fun b!198476 () Bool)

(declare-fun res!166118 () Bool)

(assert (=> b!198476 (= res!166118 call!3133)))

(assert (=> b!198476 (=> (not res!166118) (not e!136255))))

(declare-fun b!198477 () Bool)

(assert (=> b!198477 (= e!136253 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!198478 () Bool)

(assert (=> b!198478 (= e!136253 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001))))))

(declare-fun b!198479 () Bool)

(assert (=> b!198479 (= lt!309346 (readBitPure!0 (readerFrom!0 (_2!9184 lt!309342) (currentBit!9272 (_2!9184 lt!307810)) (currentByte!9277 (_2!9184 lt!307810)))))))

(declare-fun res!166125 () Bool)

(assert (=> b!198479 (= res!166125 (and (= (_2!9182 lt!309346) lt!309329) (= (_1!9182 lt!309346) (_2!9184 lt!309342))))))

(assert (=> b!198479 (=> (not res!166125) (not e!136257))))

(assert (=> b!198479 (= e!136255 e!136257)))

(assert (= (and d!67435 c!9886) b!198472))

(assert (= (and d!67435 (not c!9886)) b!198468))

(assert (= (and b!198468 res!166120) b!198469))

(assert (= (and b!198469 res!166115) b!198476))

(assert (= (and b!198476 res!166118) b!198479))

(assert (= (and b!198479 res!166125) b!198464))

(assert (= (and b!198468 res!166116) b!198474))

(assert (= (and b!198468 c!9887) b!198478))

(assert (= (and b!198468 (not c!9887)) b!198477))

(assert (= (and b!198468 res!166117) b!198473))

(assert (= (or b!198472 b!198476) bm!3130))

(assert (= (and d!67435 res!166124) b!198465))

(assert (= (and b!198465 res!166122) b!198470))

(assert (= (and b!198470 res!166123) b!198475))

(assert (= (and b!198475 res!166119) b!198467))

(assert (= (and b!198467 res!166121) b!198466))

(assert (= (and b!198467 res!166126) b!198471))

(declare-fun m!307257 () Bool)

(assert (=> b!198468 m!307257))

(declare-fun m!307259 () Bool)

(assert (=> b!198468 m!307259))

(declare-fun m!307261 () Bool)

(assert (=> b!198468 m!307261))

(declare-fun m!307263 () Bool)

(assert (=> b!198468 m!307263))

(declare-fun m!307265 () Bool)

(assert (=> b!198468 m!307265))

(declare-fun m!307267 () Bool)

(assert (=> b!198468 m!307267))

(declare-fun m!307269 () Bool)

(assert (=> b!198468 m!307269))

(declare-fun m!307271 () Bool)

(assert (=> b!198468 m!307271))

(declare-fun m!307273 () Bool)

(assert (=> b!198468 m!307273))

(declare-fun m!307275 () Bool)

(assert (=> b!198468 m!307275))

(declare-fun m!307277 () Bool)

(assert (=> b!198468 m!307277))

(declare-fun m!307279 () Bool)

(assert (=> b!198468 m!307279))

(declare-fun m!307281 () Bool)

(assert (=> b!198468 m!307281))

(declare-fun m!307283 () Bool)

(assert (=> b!198468 m!307283))

(declare-fun m!307285 () Bool)

(assert (=> b!198468 m!307285))

(declare-fun m!307287 () Bool)

(assert (=> b!198468 m!307287))

(declare-fun m!307289 () Bool)

(assert (=> b!198468 m!307289))

(declare-fun m!307291 () Bool)

(assert (=> b!198468 m!307291))

(declare-fun m!307293 () Bool)

(assert (=> b!198468 m!307293))

(declare-fun m!307295 () Bool)

(assert (=> b!198468 m!307295))

(declare-fun m!307297 () Bool)

(assert (=> b!198468 m!307297))

(declare-fun m!307299 () Bool)

(assert (=> b!198468 m!307299))

(declare-fun m!307301 () Bool)

(assert (=> b!198468 m!307301))

(declare-fun m!307303 () Bool)

(assert (=> b!198468 m!307303))

(declare-fun m!307305 () Bool)

(assert (=> b!198468 m!307305))

(declare-fun m!307307 () Bool)

(assert (=> b!198468 m!307307))

(assert (=> b!198468 m!305413))

(declare-fun m!307309 () Bool)

(assert (=> b!198468 m!307309))

(declare-fun m!307311 () Bool)

(assert (=> b!198468 m!307311))

(assert (=> b!198468 m!305425))

(declare-fun m!307313 () Bool)

(assert (=> b!198468 m!307313))

(assert (=> b!198468 m!307257))

(declare-fun m!307315 () Bool)

(assert (=> b!198468 m!307315))

(declare-fun m!307317 () Bool)

(assert (=> b!198468 m!307317))

(declare-fun m!307319 () Bool)

(assert (=> b!198468 m!307319))

(declare-fun m!307321 () Bool)

(assert (=> b!198479 m!307321))

(assert (=> b!198479 m!307321))

(declare-fun m!307323 () Bool)

(assert (=> b!198479 m!307323))

(declare-fun m!307325 () Bool)

(assert (=> b!198467 m!307325))

(assert (=> b!198467 m!307269))

(declare-fun m!307327 () Bool)

(assert (=> b!198467 m!307327))

(declare-fun m!307329 () Bool)

(assert (=> b!198467 m!307329))

(assert (=> b!198467 m!305425))

(declare-fun m!307331 () Bool)

(assert (=> b!198467 m!307331))

(assert (=> b!198472 m!307213))

(declare-fun m!307333 () Bool)

(assert (=> d!67435 m!307333))

(declare-fun m!307335 () Bool)

(assert (=> b!198464 m!307335))

(declare-fun m!307337 () Bool)

(assert (=> b!198464 m!307337))

(declare-fun m!307339 () Bool)

(assert (=> b!198470 m!307339))

(assert (=> b!198470 m!305413))

(declare-fun m!307341 () Bool)

(assert (=> bm!3130 m!307341))

(assert (=> b!198469 m!307337))

(assert (=> b!198469 m!305413))

(declare-fun m!307343 () Bool)

(assert (=> b!198475 m!307343))

(declare-fun m!307345 () Bool)

(assert (=> b!198466 m!307345))

(assert (=> b!197686 d!67435))

(declare-fun lt!309359 () tuple2!17098)

(declare-fun d!67437 () Bool)

(assert (=> d!67437 (= lt!309359 (readNBitsLSBFirstsLoop!0 (_1!9181 lt!307785) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!307799))))

(assert (=> d!67437 (= (readNBitsLSBFirstsLoopPure!0 (_1!9181 lt!307785) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!307799) (tuple2!17077 (_2!9194 lt!309359) (_1!9194 lt!309359)))))

(declare-fun bs!16684 () Bool)

(assert (= bs!16684 d!67437))

(declare-fun m!307347 () Bool)

(assert (=> bs!16684 m!307347))

(assert (=> b!197686 d!67437))

(declare-fun d!67439 () Bool)

(assert (=> d!67439 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4453 (buf!4939 (_2!9184 lt!307809)))) ((_ sign_extend 32) (currentByte!9277 (_2!9184 lt!307215))) ((_ sign_extend 32) (currentBit!9272 (_2!9184 lt!307215))) lt!307796) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4453 (buf!4939 (_2!9184 lt!307809)))) ((_ sign_extend 32) (currentByte!9277 (_2!9184 lt!307215))) ((_ sign_extend 32) (currentBit!9272 (_2!9184 lt!307215)))) lt!307796))))

(declare-fun bs!16685 () Bool)

(assert (= bs!16685 d!67439))

(declare-fun m!307349 () Bool)

(assert (=> bs!16685 m!307349))

(assert (=> b!197686 d!67439))

(declare-fun d!67441 () Bool)

(declare-fun e!136259 () Bool)

(assert (=> d!67441 e!136259))

(declare-fun res!166127 () Bool)

(assert (=> d!67441 (=> (not res!166127) (not e!136259))))

(declare-fun lt!309360 () (_ BitVec 64))

(declare-fun lt!309363 () (_ BitVec 64))

(declare-fun lt!309362 () (_ BitVec 64))

(assert (=> d!67441 (= res!166127 (= lt!309360 (bvsub lt!309363 lt!309362)))))

(assert (=> d!67441 (or (= (bvand lt!309363 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!309362 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!309363 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!309363 lt!309362) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67441 (= lt!309362 (remainingBits!0 ((_ sign_extend 32) (size!4453 (buf!4939 (_2!9184 lt!307810)))) ((_ sign_extend 32) (currentByte!9277 (_2!9184 lt!307810))) ((_ sign_extend 32) (currentBit!9272 (_2!9184 lt!307810)))))))

(declare-fun lt!309361 () (_ BitVec 64))

(declare-fun lt!309365 () (_ BitVec 64))

(assert (=> d!67441 (= lt!309363 (bvmul lt!309361 lt!309365))))

(assert (=> d!67441 (or (= lt!309361 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!309365 (bvsdiv (bvmul lt!309361 lt!309365) lt!309361)))))

(assert (=> d!67441 (= lt!309365 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!67441 (= lt!309361 ((_ sign_extend 32) (size!4453 (buf!4939 (_2!9184 lt!307810)))))))

(assert (=> d!67441 (= lt!309360 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9277 (_2!9184 lt!307810))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9272 (_2!9184 lt!307810)))))))

(assert (=> d!67441 (invariant!0 (currentBit!9272 (_2!9184 lt!307810)) (currentByte!9277 (_2!9184 lt!307810)) (size!4453 (buf!4939 (_2!9184 lt!307810))))))

(assert (=> d!67441 (= (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307810))) (currentByte!9277 (_2!9184 lt!307810)) (currentBit!9272 (_2!9184 lt!307810))) lt!309360)))

(declare-fun b!198480 () Bool)

(declare-fun res!166128 () Bool)

(assert (=> b!198480 (=> (not res!166128) (not e!136259))))

(assert (=> b!198480 (= res!166128 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!309360))))

(declare-fun b!198481 () Bool)

(declare-fun lt!309364 () (_ BitVec 64))

(assert (=> b!198481 (= e!136259 (bvsle lt!309360 (bvmul lt!309364 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!198481 (or (= lt!309364 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!309364 #b0000000000000000000000000000000000000000000000000000000000001000) lt!309364)))))

(assert (=> b!198481 (= lt!309364 ((_ sign_extend 32) (size!4453 (buf!4939 (_2!9184 lt!307810)))))))

(assert (= (and d!67441 res!166127) b!198480))

(assert (= (and b!198480 res!166128) b!198481))

(declare-fun m!307351 () Bool)

(assert (=> d!67441 m!307351))

(declare-fun m!307353 () Bool)

(assert (=> d!67441 m!307353))

(assert (=> b!197686 d!67441))

(declare-fun b!198482 () Bool)

(declare-fun res!166130 () Bool)

(declare-fun e!136261 () Bool)

(assert (=> b!198482 (=> (not res!166130) (not e!136261))))

(declare-fun lt!309382 () tuple2!17072)

(assert (=> b!198482 (= res!166130 (isPrefixOf!0 (_2!9181 lt!309382) (_2!9184 lt!307809)))))

(declare-fun b!198483 () Bool)

(declare-fun e!136260 () Unit!13971)

(declare-fun Unit!14057 () Unit!13971)

(assert (=> b!198483 (= e!136260 Unit!14057)))

(declare-fun b!198485 () Bool)

(declare-fun lt!309385 () Unit!13971)

(assert (=> b!198485 (= e!136260 lt!309385)))

(declare-fun lt!309380 () (_ BitVec 64))

(assert (=> b!198485 (= lt!309380 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!309368 () (_ BitVec 64))

(assert (=> b!198485 (= lt!309368 (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307215))) (currentByte!9277 (_2!9184 lt!307215)) (currentBit!9272 (_2!9184 lt!307215))))))

(assert (=> b!198485 (= lt!309385 (arrayBitRangesEqSymmetric!0 (buf!4939 (_2!9184 lt!307215)) (buf!4939 (_2!9184 lt!307809)) lt!309380 lt!309368))))

(assert (=> b!198485 (arrayBitRangesEq!0 (buf!4939 (_2!9184 lt!307809)) (buf!4939 (_2!9184 lt!307215)) lt!309380 lt!309368)))

(declare-fun lt!309377 () (_ BitVec 64))

(declare-fun lt!309379 () (_ BitVec 64))

(declare-fun b!198486 () Bool)

(assert (=> b!198486 (= e!136261 (= (_1!9181 lt!309382) (withMovedBitIndex!0 (_2!9181 lt!309382) (bvsub lt!309379 lt!309377))))))

(assert (=> b!198486 (or (= (bvand lt!309379 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!309377 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!309379 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!309379 lt!309377) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!198486 (= lt!309377 (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307809))) (currentByte!9277 (_2!9184 lt!307809)) (currentBit!9272 (_2!9184 lt!307809))))))

(assert (=> b!198486 (= lt!309379 (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307215))) (currentByte!9277 (_2!9184 lt!307215)) (currentBit!9272 (_2!9184 lt!307215))))))

(declare-fun d!67443 () Bool)

(assert (=> d!67443 e!136261))

(declare-fun res!166131 () Bool)

(assert (=> d!67443 (=> (not res!166131) (not e!136261))))

(assert (=> d!67443 (= res!166131 (isPrefixOf!0 (_1!9181 lt!309382) (_2!9181 lt!309382)))))

(declare-fun lt!309371 () BitStream!8014)

(assert (=> d!67443 (= lt!309382 (tuple2!17073 lt!309371 (_2!9184 lt!307809)))))

(declare-fun lt!309367 () Unit!13971)

(declare-fun lt!309372 () Unit!13971)

(assert (=> d!67443 (= lt!309367 lt!309372)))

(assert (=> d!67443 (isPrefixOf!0 lt!309371 (_2!9184 lt!307809))))

(assert (=> d!67443 (= lt!309372 (lemmaIsPrefixTransitive!0 lt!309371 (_2!9184 lt!307809) (_2!9184 lt!307809)))))

(declare-fun lt!309366 () Unit!13971)

(declare-fun lt!309370 () Unit!13971)

(assert (=> d!67443 (= lt!309366 lt!309370)))

(assert (=> d!67443 (isPrefixOf!0 lt!309371 (_2!9184 lt!307809))))

(assert (=> d!67443 (= lt!309370 (lemmaIsPrefixTransitive!0 lt!309371 (_2!9184 lt!307215) (_2!9184 lt!307809)))))

(declare-fun lt!309375 () Unit!13971)

(assert (=> d!67443 (= lt!309375 e!136260)))

(declare-fun c!9888 () Bool)

(assert (=> d!67443 (= c!9888 (not (= (size!4453 (buf!4939 (_2!9184 lt!307215))) #b00000000000000000000000000000000)))))

(declare-fun lt!309381 () Unit!13971)

(declare-fun lt!309378 () Unit!13971)

(assert (=> d!67443 (= lt!309381 lt!309378)))

(assert (=> d!67443 (isPrefixOf!0 (_2!9184 lt!307809) (_2!9184 lt!307809))))

(assert (=> d!67443 (= lt!309378 (lemmaIsPrefixRefl!0 (_2!9184 lt!307809)))))

(declare-fun lt!309376 () Unit!13971)

(declare-fun lt!309374 () Unit!13971)

(assert (=> d!67443 (= lt!309376 lt!309374)))

(assert (=> d!67443 (= lt!309374 (lemmaIsPrefixRefl!0 (_2!9184 lt!307809)))))

(declare-fun lt!309383 () Unit!13971)

(declare-fun lt!309369 () Unit!13971)

(assert (=> d!67443 (= lt!309383 lt!309369)))

(assert (=> d!67443 (isPrefixOf!0 lt!309371 lt!309371)))

(assert (=> d!67443 (= lt!309369 (lemmaIsPrefixRefl!0 lt!309371))))

(declare-fun lt!309373 () Unit!13971)

(declare-fun lt!309384 () Unit!13971)

(assert (=> d!67443 (= lt!309373 lt!309384)))

(assert (=> d!67443 (isPrefixOf!0 (_2!9184 lt!307215) (_2!9184 lt!307215))))

(assert (=> d!67443 (= lt!309384 (lemmaIsPrefixRefl!0 (_2!9184 lt!307215)))))

(assert (=> d!67443 (= lt!309371 (BitStream!8015 (buf!4939 (_2!9184 lt!307809)) (currentByte!9277 (_2!9184 lt!307215)) (currentBit!9272 (_2!9184 lt!307215))))))

(assert (=> d!67443 (isPrefixOf!0 (_2!9184 lt!307215) (_2!9184 lt!307809))))

(assert (=> d!67443 (= (reader!0 (_2!9184 lt!307215) (_2!9184 lt!307809)) lt!309382)))

(declare-fun b!198484 () Bool)

(declare-fun res!166129 () Bool)

(assert (=> b!198484 (=> (not res!166129) (not e!136261))))

(assert (=> b!198484 (= res!166129 (isPrefixOf!0 (_1!9181 lt!309382) (_2!9184 lt!307215)))))

(assert (= (and d!67443 c!9888) b!198485))

(assert (= (and d!67443 (not c!9888)) b!198483))

(assert (= (and d!67443 res!166131) b!198484))

(assert (= (and b!198484 res!166129) b!198482))

(assert (= (and b!198482 res!166130) b!198486))

(declare-fun m!307355 () Bool)

(assert (=> b!198482 m!307355))

(assert (=> b!198485 m!304999))

(declare-fun m!307357 () Bool)

(assert (=> b!198485 m!307357))

(declare-fun m!307359 () Bool)

(assert (=> b!198485 m!307359))

(declare-fun m!307361 () Bool)

(assert (=> b!198486 m!307361))

(assert (=> b!198486 m!305405))

(assert (=> b!198486 m!304999))

(assert (=> d!67443 m!305447))

(assert (=> d!67443 m!307215))

(declare-fun m!307363 () Bool)

(assert (=> d!67443 m!307363))

(declare-fun m!307365 () Bool)

(assert (=> d!67443 m!307365))

(declare-fun m!307367 () Bool)

(assert (=> d!67443 m!307367))

(declare-fun m!307369 () Bool)

(assert (=> d!67443 m!307369))

(assert (=> d!67443 m!307225))

(assert (=> d!67443 m!305373))

(declare-fun m!307371 () Bool)

(assert (=> d!67443 m!307371))

(declare-fun m!307373 () Bool)

(assert (=> d!67443 m!307373))

(assert (=> d!67443 m!305549))

(declare-fun m!307375 () Bool)

(assert (=> b!198484 m!307375))

(assert (=> b!197686 d!67443))

(declare-fun d!67445 () Bool)

(declare-fun lt!309386 () tuple2!17096)

(assert (=> d!67445 (= lt!309386 (readBit!0 (_1!9181 lt!307785)))))

(assert (=> d!67445 (= (readBitPure!0 (_1!9181 lt!307785)) (tuple2!17075 (_2!9193 lt!309386) (_1!9193 lt!309386)))))

(declare-fun bs!16686 () Bool)

(assert (= bs!16686 d!67445))

(declare-fun m!307377 () Bool)

(assert (=> bs!16686 m!307377))

(assert (=> b!197686 d!67445))

(declare-fun d!67447 () Bool)

(assert (=> d!67447 (isPrefixOf!0 (_2!9184 lt!307215) (_2!9184 lt!307809))))

(declare-fun lt!309387 () Unit!13971)

(assert (=> d!67447 (= lt!309387 (choose!30 (_2!9184 lt!307215) (_2!9184 lt!307810) (_2!9184 lt!307809)))))

(assert (=> d!67447 (isPrefixOf!0 (_2!9184 lt!307215) (_2!9184 lt!307810))))

(assert (=> d!67447 (= (lemmaIsPrefixTransitive!0 (_2!9184 lt!307215) (_2!9184 lt!307810) (_2!9184 lt!307809)) lt!309387)))

(declare-fun bs!16687 () Bool)

(assert (= bs!16687 d!67447))

(assert (=> bs!16687 m!305373))

(declare-fun m!307379 () Bool)

(assert (=> bs!16687 m!307379))

(declare-fun m!307381 () Bool)

(assert (=> bs!16687 m!307381))

(assert (=> b!197686 d!67447))

(declare-fun d!67449 () Bool)

(declare-fun lt!309388 () tuple2!17098)

(assert (=> d!67449 (= lt!309388 (readNBitsLSBFirstsLoop!0 (_1!9181 lt!307770) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(assert (=> d!67449 (= (readNBitsLSBFirstsLoopPure!0 (_1!9181 lt!307770) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))) (tuple2!17077 (_2!9194 lt!309388) (_1!9194 lt!309388)))))

(declare-fun bs!16688 () Bool)

(assert (= bs!16688 d!67449))

(declare-fun m!307383 () Bool)

(assert (=> bs!16688 m!307383))

(assert (=> b!197686 d!67449))

(declare-fun d!67451 () Bool)

(declare-fun e!136262 () Bool)

(assert (=> d!67451 e!136262))

(declare-fun res!166132 () Bool)

(assert (=> d!67451 (=> (not res!166132) (not e!136262))))

(declare-fun lt!309390 () (_ BitVec 64))

(declare-fun lt!309389 () BitStream!8014)

(assert (=> d!67451 (= res!166132 (= (bvadd lt!309390 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4453 (buf!4939 lt!309389)) (currentByte!9277 lt!309389) (currentBit!9272 lt!309389))))))

(assert (=> d!67451 (or (not (= (bvand lt!309390 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!309390 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!309390 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67451 (= lt!309390 (bitIndex!0 (size!4453 (buf!4939 (_1!9181 lt!307785))) (currentByte!9277 (_1!9181 lt!307785)) (currentBit!9272 (_1!9181 lt!307785))))))

(assert (=> d!67451 (= lt!309389 (_2!9184 (moveBitIndex!0 (_1!9181 lt!307785) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!67451 (moveBitIndexPrecond!0 (_1!9181 lt!307785) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!67451 (= (withMovedBitIndex!0 (_1!9181 lt!307785) #b0000000000000000000000000000000000000000000000000000000000000001) lt!309389)))

(declare-fun b!198487 () Bool)

(assert (=> b!198487 (= e!136262 (= (size!4453 (buf!4939 (_1!9181 lt!307785))) (size!4453 (buf!4939 lt!309389))))))

(assert (= (and d!67451 res!166132) b!198487))

(declare-fun m!307385 () Bool)

(assert (=> d!67451 m!307385))

(declare-fun m!307387 () Bool)

(assert (=> d!67451 m!307387))

(declare-fun m!307389 () Bool)

(assert (=> d!67451 m!307389))

(declare-fun m!307391 () Bool)

(assert (=> d!67451 m!307391))

(assert (=> b!197686 d!67451))

(declare-fun d!67453 () Bool)

(assert (=> d!67453 (validate_offset_bits!1 ((_ sign_extend 32) (size!4453 (buf!4939 (_2!9184 lt!307809)))) ((_ sign_extend 32) (currentByte!9277 (_2!9184 lt!307810))) ((_ sign_extend 32) (currentBit!9272 (_2!9184 lt!307810))) lt!307815)))

(declare-fun lt!309391 () Unit!13971)

(assert (=> d!67453 (= lt!309391 (choose!9 (_2!9184 lt!307810) (buf!4939 (_2!9184 lt!307809)) lt!307815 (BitStream!8015 (buf!4939 (_2!9184 lt!307809)) (currentByte!9277 (_2!9184 lt!307810)) (currentBit!9272 (_2!9184 lt!307810)))))))

(assert (=> d!67453 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9184 lt!307810) (buf!4939 (_2!9184 lt!307809)) lt!307815) lt!309391)))

(declare-fun bs!16689 () Bool)

(assert (= bs!16689 d!67453))

(assert (=> bs!16689 m!305421))

(declare-fun m!307393 () Bool)

(assert (=> bs!16689 m!307393))

(assert (=> b!197686 d!67453))

(declare-fun lt!309392 () tuple2!17098)

(declare-fun d!67455 () Bool)

(assert (=> d!67455 (= lt!309392 (readNBitsLSBFirstsLoop!0 (_1!9181 lt!307783) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!307799 (ite (_2!9182 lt!307772) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!67455 (= (readNBitsLSBFirstsLoopPure!0 (_1!9181 lt!307783) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!307799 (ite (_2!9182 lt!307772) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!17077 (_2!9194 lt!309392) (_1!9194 lt!309392)))))

(declare-fun bs!16690 () Bool)

(assert (= bs!16690 d!67455))

(declare-fun m!307395 () Bool)

(assert (=> bs!16690 m!307395))

(assert (=> b!197686 d!67455))

(assert (=> b!197686 d!66659))

(declare-fun d!67457 () Bool)

(declare-fun e!136263 () Bool)

(assert (=> d!67457 e!136263))

(declare-fun res!166133 () Bool)

(assert (=> d!67457 (=> (not res!166133) (not e!136263))))

(declare-fun lt!309394 () (_ BitVec 64))

(declare-fun lt!309393 () BitStream!8014)

(assert (=> d!67457 (= res!166133 (= (bvadd lt!309394 (bvsub (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307810))) (currentByte!9277 (_2!9184 lt!307810)) (currentBit!9272 (_2!9184 lt!307810))) (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307809))) (currentByte!9277 (_2!9184 lt!307809)) (currentBit!9272 (_2!9184 lt!307809))))) (bitIndex!0 (size!4453 (buf!4939 lt!309393)) (currentByte!9277 lt!309393) (currentBit!9272 lt!309393))))))

(assert (=> d!67457 (or (not (= (bvand lt!309394 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307810))) (currentByte!9277 (_2!9184 lt!307810)) (currentBit!9272 (_2!9184 lt!307810))) (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307809))) (currentByte!9277 (_2!9184 lt!307809)) (currentBit!9272 (_2!9184 lt!307809)))) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!309394 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!309394 (bvsub (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307810))) (currentByte!9277 (_2!9184 lt!307810)) (currentBit!9272 (_2!9184 lt!307810))) (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307809))) (currentByte!9277 (_2!9184 lt!307809)) (currentBit!9272 (_2!9184 lt!307809))))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67457 (= lt!309394 (bitIndex!0 (size!4453 (buf!4939 (_2!9181 lt!307783))) (currentByte!9277 (_2!9181 lt!307783)) (currentBit!9272 (_2!9181 lt!307783))))))

(assert (=> d!67457 (= lt!309393 (_2!9184 (moveBitIndex!0 (_2!9181 lt!307783) (bvsub (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307810))) (currentByte!9277 (_2!9184 lt!307810)) (currentBit!9272 (_2!9184 lt!307810))) (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307809))) (currentByte!9277 (_2!9184 lt!307809)) (currentBit!9272 (_2!9184 lt!307809)))))))))

(assert (=> d!67457 (moveBitIndexPrecond!0 (_2!9181 lt!307783) (bvsub (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307810))) (currentByte!9277 (_2!9184 lt!307810)) (currentBit!9272 (_2!9184 lt!307810))) (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307809))) (currentByte!9277 (_2!9184 lt!307809)) (currentBit!9272 (_2!9184 lt!307809)))))))

(assert (=> d!67457 (= (withMovedBitIndex!0 (_2!9181 lt!307783) (bvsub (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307810))) (currentByte!9277 (_2!9184 lt!307810)) (currentBit!9272 (_2!9184 lt!307810))) (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307809))) (currentByte!9277 (_2!9184 lt!307809)) (currentBit!9272 (_2!9184 lt!307809))))) lt!309393)))

(declare-fun b!198488 () Bool)

(assert (=> b!198488 (= e!136263 (= (size!4453 (buf!4939 (_2!9181 lt!307783))) (size!4453 (buf!4939 lt!309393))))))

(assert (= (and d!67457 res!166133) b!198488))

(declare-fun m!307397 () Bool)

(assert (=> d!67457 m!307397))

(declare-fun m!307399 () Bool)

(assert (=> d!67457 m!307399))

(declare-fun m!307401 () Bool)

(assert (=> d!67457 m!307401))

(declare-fun m!307403 () Bool)

(assert (=> d!67457 m!307403))

(assert (=> b!197686 d!67457))

(declare-fun d!67459 () Bool)

(declare-fun lt!309412 () tuple2!17076)

(declare-fun lt!309409 () tuple2!17076)

(assert (=> d!67459 (and (= (_2!9183 lt!309412) (_2!9183 lt!309409)) (= (_1!9183 lt!309412) (_1!9183 lt!309409)))))

(declare-fun lt!309410 () Bool)

(declare-fun lt!309411 () BitStream!8014)

(declare-fun lt!309408 () (_ BitVec 64))

(declare-fun lt!309407 () Unit!13971)

(declare-fun choose!56 (BitStream!8014 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!17076 tuple2!17076 BitStream!8014 (_ BitVec 64) Bool BitStream!8014 (_ BitVec 64) tuple2!17076 tuple2!17076 BitStream!8014 (_ BitVec 64)) Unit!13971)

(assert (=> d!67459 (= lt!309407 (choose!56 (_1!9181 lt!307785) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!307799 lt!309412 (tuple2!17077 (_1!9183 lt!309412) (_2!9183 lt!309412)) (_1!9183 lt!309412) (_2!9183 lt!309412) lt!309410 lt!309411 lt!309408 lt!309409 (tuple2!17077 (_1!9183 lt!309409) (_2!9183 lt!309409)) (_1!9183 lt!309409) (_2!9183 lt!309409)))))

(assert (=> d!67459 (= lt!309409 (readNBitsLSBFirstsLoopPure!0 lt!309411 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) lt!309408))))

(assert (=> d!67459 (= lt!309408 (bvor lt!307799 (ite lt!309410 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67459 (= lt!309411 (withMovedBitIndex!0 (_1!9181 lt!307785) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!67459 (= lt!309410 (_2!9182 (readBitPure!0 (_1!9181 lt!307785))))))

(assert (=> d!67459 (= lt!309412 (readNBitsLSBFirstsLoopPure!0 (_1!9181 lt!307785) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!307799))))

(assert (=> d!67459 (= (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9181 lt!307785) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!307799) lt!309407)))

(declare-fun bs!16692 () Bool)

(assert (= bs!16692 d!67459))

(declare-fun m!307405 () Bool)

(assert (=> bs!16692 m!307405))

(declare-fun m!307407 () Bool)

(assert (=> bs!16692 m!307407))

(assert (=> bs!16692 m!305409))

(assert (=> bs!16692 m!305415))

(assert (=> bs!16692 m!305369))

(assert (=> b!197686 d!67459))

(declare-fun d!67461 () Bool)

(declare-fun res!166134 () Bool)

(declare-fun e!136264 () Bool)

(assert (=> d!67461 (=> (not res!166134) (not e!136264))))

(assert (=> d!67461 (= res!166134 (= (size!4453 (buf!4939 (_2!9184 lt!307215))) (size!4453 (buf!4939 (_2!9184 lt!307809)))))))

(assert (=> d!67461 (= (isPrefixOf!0 (_2!9184 lt!307215) (_2!9184 lt!307809)) e!136264)))

(declare-fun b!198489 () Bool)

(declare-fun res!166135 () Bool)

(assert (=> b!198489 (=> (not res!166135) (not e!136264))))

(assert (=> b!198489 (= res!166135 (bvsle (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307215))) (currentByte!9277 (_2!9184 lt!307215)) (currentBit!9272 (_2!9184 lt!307215))) (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307809))) (currentByte!9277 (_2!9184 lt!307809)) (currentBit!9272 (_2!9184 lt!307809)))))))

(declare-fun b!198490 () Bool)

(declare-fun e!136265 () Bool)

(assert (=> b!198490 (= e!136264 e!136265)))

(declare-fun res!166136 () Bool)

(assert (=> b!198490 (=> res!166136 e!136265)))

(assert (=> b!198490 (= res!166136 (= (size!4453 (buf!4939 (_2!9184 lt!307215))) #b00000000000000000000000000000000))))

(declare-fun b!198491 () Bool)

(assert (=> b!198491 (= e!136265 (arrayBitRangesEq!0 (buf!4939 (_2!9184 lt!307215)) (buf!4939 (_2!9184 lt!307809)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307215))) (currentByte!9277 (_2!9184 lt!307215)) (currentBit!9272 (_2!9184 lt!307215)))))))

(assert (= (and d!67461 res!166134) b!198489))

(assert (= (and b!198489 res!166135) b!198490))

(assert (= (and b!198490 (not res!166136)) b!198491))

(assert (=> b!198489 m!304999))

(assert (=> b!198489 m!305405))

(assert (=> b!198491 m!304999))

(assert (=> b!198491 m!304999))

(declare-fun m!307409 () Bool)

(assert (=> b!198491 m!307409))

(assert (=> b!197686 d!67461))

(declare-fun d!67463 () Bool)

(assert (=> d!67463 (validate_offset_bits!1 ((_ sign_extend 32) (size!4453 (buf!4939 (_2!9184 lt!307809)))) ((_ sign_extend 32) (currentByte!9277 (_2!9184 lt!307215))) ((_ sign_extend 32) (currentBit!9272 (_2!9184 lt!307215))) lt!307806)))

(declare-fun lt!309413 () Unit!13971)

(assert (=> d!67463 (= lt!309413 (choose!9 (_2!9184 lt!307215) (buf!4939 (_2!9184 lt!307809)) lt!307806 (BitStream!8015 (buf!4939 (_2!9184 lt!307809)) (currentByte!9277 (_2!9184 lt!307215)) (currentBit!9272 (_2!9184 lt!307215)))))))

(assert (=> d!67463 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9184 lt!307215) (buf!4939 (_2!9184 lt!307809)) lt!307806) lt!309413)))

(declare-fun bs!16693 () Bool)

(assert (= bs!16693 d!67463))

(assert (=> bs!16693 m!305393))

(declare-fun m!307411 () Bool)

(assert (=> bs!16693 m!307411))

(assert (=> b!197686 d!67463))

(declare-fun d!67465 () Bool)

(declare-fun e!136266 () Bool)

(assert (=> d!67465 e!136266))

(declare-fun res!166137 () Bool)

(assert (=> d!67465 (=> (not res!166137) (not e!136266))))

(declare-fun lt!309416 () (_ BitVec 64))

(declare-fun lt!309414 () (_ BitVec 64))

(declare-fun lt!309417 () (_ BitVec 64))

(assert (=> d!67465 (= res!166137 (= lt!309414 (bvsub lt!309417 lt!309416)))))

(assert (=> d!67465 (or (= (bvand lt!309417 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!309416 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!309417 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!309417 lt!309416) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67465 (= lt!309416 (remainingBits!0 ((_ sign_extend 32) (size!4453 (buf!4939 (_2!9184 lt!307809)))) ((_ sign_extend 32) (currentByte!9277 (_2!9184 lt!307809))) ((_ sign_extend 32) (currentBit!9272 (_2!9184 lt!307809)))))))

(declare-fun lt!309415 () (_ BitVec 64))

(declare-fun lt!309419 () (_ BitVec 64))

(assert (=> d!67465 (= lt!309417 (bvmul lt!309415 lt!309419))))

(assert (=> d!67465 (or (= lt!309415 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!309419 (bvsdiv (bvmul lt!309415 lt!309419) lt!309415)))))

(assert (=> d!67465 (= lt!309419 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!67465 (= lt!309415 ((_ sign_extend 32) (size!4453 (buf!4939 (_2!9184 lt!307809)))))))

(assert (=> d!67465 (= lt!309414 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9277 (_2!9184 lt!307809))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9272 (_2!9184 lt!307809)))))))

(assert (=> d!67465 (invariant!0 (currentBit!9272 (_2!9184 lt!307809)) (currentByte!9277 (_2!9184 lt!307809)) (size!4453 (buf!4939 (_2!9184 lt!307809))))))

(assert (=> d!67465 (= (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307809))) (currentByte!9277 (_2!9184 lt!307809)) (currentBit!9272 (_2!9184 lt!307809))) lt!309414)))

(declare-fun b!198492 () Bool)

(declare-fun res!166138 () Bool)

(assert (=> b!198492 (=> (not res!166138) (not e!136266))))

(assert (=> b!198492 (= res!166138 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!309414))))

(declare-fun b!198493 () Bool)

(declare-fun lt!309418 () (_ BitVec 64))

(assert (=> b!198493 (= e!136266 (bvsle lt!309414 (bvmul lt!309418 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!198493 (or (= lt!309418 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!309418 #b0000000000000000000000000000000000000000000000000000000000001000) lt!309418)))))

(assert (=> b!198493 (= lt!309418 ((_ sign_extend 32) (size!4453 (buf!4939 (_2!9184 lt!307809)))))))

(assert (= (and d!67465 res!166137) b!198492))

(assert (= (and b!198492 res!166138) b!198493))

(declare-fun m!307413 () Bool)

(assert (=> d!67465 m!307413))

(assert (=> d!67465 m!305377))

(assert (=> b!197686 d!67465))

(declare-fun d!67467 () Bool)

(declare-fun e!136267 () Bool)

(assert (=> d!67467 e!136267))

(declare-fun res!166139 () Bool)

(assert (=> d!67467 (=> (not res!166139) (not e!136267))))

(declare-fun lt!309420 () tuple2!17074)

(declare-fun lt!309423 () tuple2!17074)

(assert (=> d!67467 (= res!166139 (= (bitIndex!0 (size!4453 (buf!4939 (_1!9182 lt!309420))) (currentByte!9277 (_1!9182 lt!309420)) (currentBit!9272 (_1!9182 lt!309420))) (bitIndex!0 (size!4453 (buf!4939 (_1!9182 lt!309423))) (currentByte!9277 (_1!9182 lt!309423)) (currentBit!9272 (_1!9182 lt!309423)))))))

(declare-fun lt!309422 () Unit!13971)

(declare-fun lt!309421 () BitStream!8014)

(assert (=> d!67467 (= lt!309422 (choose!50 lt!307794 (_2!9184 lt!307809) lt!309421 lt!309420 (tuple2!17075 (_1!9182 lt!309420) (_2!9182 lt!309420)) (_1!9182 lt!309420) (_2!9182 lt!309420) lt!309423 (tuple2!17075 (_1!9182 lt!309423) (_2!9182 lt!309423)) (_1!9182 lt!309423) (_2!9182 lt!309423)))))

(assert (=> d!67467 (= lt!309423 (readBitPure!0 lt!309421))))

(assert (=> d!67467 (= lt!309420 (readBitPure!0 lt!307794))))

(assert (=> d!67467 (= lt!309421 (BitStream!8015 (buf!4939 (_2!9184 lt!307809)) (currentByte!9277 lt!307794) (currentBit!9272 lt!307794)))))

(assert (=> d!67467 (invariant!0 (currentBit!9272 lt!307794) (currentByte!9277 lt!307794) (size!4453 (buf!4939 (_2!9184 lt!307809))))))

(assert (=> d!67467 (= (readBitPrefixLemma!0 lt!307794 (_2!9184 lt!307809)) lt!309422)))

(declare-fun b!198494 () Bool)

(assert (=> b!198494 (= e!136267 (= (_2!9182 lt!309420) (_2!9182 lt!309423)))))

(assert (= (and d!67467 res!166139) b!198494))

(assert (=> d!67467 m!305411))

(assert (=> d!67467 m!305387))

(declare-fun m!307415 () Bool)

(assert (=> d!67467 m!307415))

(declare-fun m!307417 () Bool)

(assert (=> d!67467 m!307417))

(declare-fun m!307419 () Bool)

(assert (=> d!67467 m!307419))

(declare-fun m!307421 () Bool)

(assert (=> d!67467 m!307421))

(assert (=> b!197686 d!67467))

(declare-fun d!67469 () Bool)

(declare-fun lt!309424 () tuple2!17096)

(assert (=> d!67469 (= lt!309424 (readBit!0 lt!307794))))

(assert (=> d!67469 (= (readBitPure!0 lt!307794) (tuple2!17075 (_2!9193 lt!309424) (_1!9193 lt!309424)))))

(declare-fun bs!16694 () Bool)

(assert (= bs!16694 d!67469))

(declare-fun m!307423 () Bool)

(assert (=> bs!16694 m!307423))

(assert (=> b!197686 d!67469))

(assert (=> b!197686 d!67341))

(declare-fun d!67471 () Bool)

(assert (=> d!67471 (validate_offset_bits!1 ((_ sign_extend 32) (size!4453 (buf!4939 (_2!9184 lt!307809)))) ((_ sign_extend 32) (currentByte!9277 (_2!9184 lt!307215))) ((_ sign_extend 32) (currentBit!9272 (_2!9184 lt!307215))) lt!307796)))

(declare-fun lt!309425 () Unit!13971)

(assert (=> d!67471 (= lt!309425 (choose!9 (_2!9184 lt!307215) (buf!4939 (_2!9184 lt!307809)) lt!307796 (BitStream!8015 (buf!4939 (_2!9184 lt!307809)) (currentByte!9277 (_2!9184 lt!307215)) (currentBit!9272 (_2!9184 lt!307215)))))))

(assert (=> d!67471 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9184 lt!307215) (buf!4939 (_2!9184 lt!307809)) lt!307796) lt!309425)))

(declare-fun bs!16695 () Bool)

(assert (= bs!16695 d!67471))

(assert (=> bs!16695 m!305399))

(declare-fun m!307425 () Bool)

(assert (=> bs!16695 m!307425))

(assert (=> b!197686 d!67471))

(declare-fun d!67473 () Bool)

(assert (=> d!67473 (= (invariant!0 (currentBit!9272 (_2!9184 lt!307215)) (currentByte!9277 (_2!9184 lt!307215)) (size!4453 (buf!4939 (_2!9184 lt!307810)))) (and (bvsge (currentBit!9272 (_2!9184 lt!307215)) #b00000000000000000000000000000000) (bvslt (currentBit!9272 (_2!9184 lt!307215)) #b00000000000000000000000000001000) (bvsge (currentByte!9277 (_2!9184 lt!307215)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9277 (_2!9184 lt!307215)) (size!4453 (buf!4939 (_2!9184 lt!307810)))) (and (= (currentBit!9272 (_2!9184 lt!307215)) #b00000000000000000000000000000000) (= (currentByte!9277 (_2!9184 lt!307215)) (size!4453 (buf!4939 (_2!9184 lt!307810))))))))))

(assert (=> b!197686 d!67473))

(declare-fun d!67475 () Bool)

(assert (=> d!67475 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4453 (buf!4939 (_2!9184 lt!307809)))) ((_ sign_extend 32) (currentByte!9277 (_2!9184 lt!307215))) ((_ sign_extend 32) (currentBit!9272 (_2!9184 lt!307215))) lt!307806) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4453 (buf!4939 (_2!9184 lt!307809)))) ((_ sign_extend 32) (currentByte!9277 (_2!9184 lt!307215))) ((_ sign_extend 32) (currentBit!9272 (_2!9184 lt!307215)))) lt!307806))))

(declare-fun bs!16696 () Bool)

(assert (= bs!16696 d!67475))

(assert (=> bs!16696 m!307349))

(assert (=> b!197686 d!67475))

(declare-fun d!67477 () Bool)

(assert (=> d!67477 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4453 (buf!4939 (_2!9184 lt!307809)))) ((_ sign_extend 32) (currentByte!9277 (_2!9184 lt!307810))) ((_ sign_extend 32) (currentBit!9272 (_2!9184 lt!307810))) lt!307815) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4453 (buf!4939 (_2!9184 lt!307809)))) ((_ sign_extend 32) (currentByte!9277 (_2!9184 lt!307810))) ((_ sign_extend 32) (currentBit!9272 (_2!9184 lt!307810)))) lt!307815))))

(declare-fun bs!16697 () Bool)

(assert (= bs!16697 d!67477))

(declare-fun m!307427 () Bool)

(assert (=> bs!16697 m!307427))

(assert (=> b!197686 d!67477))

(declare-fun d!67479 () Bool)

(assert (=> d!67479 (= (invariant!0 (currentBit!9272 (_2!9184 lt!307786)) (currentByte!9277 (_2!9184 lt!307786)) (size!4453 (buf!4939 (_2!9184 lt!307786)))) (and (bvsge (currentBit!9272 (_2!9184 lt!307786)) #b00000000000000000000000000000000) (bvslt (currentBit!9272 (_2!9184 lt!307786)) #b00000000000000000000000000001000) (bvsge (currentByte!9277 (_2!9184 lt!307786)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9277 (_2!9184 lt!307786)) (size!4453 (buf!4939 (_2!9184 lt!307786)))) (and (= (currentBit!9272 (_2!9184 lt!307786)) #b00000000000000000000000000000000) (= (currentByte!9277 (_2!9184 lt!307786)) (size!4453 (buf!4939 (_2!9184 lt!307786))))))))))

(assert (=> d!66679 d!67479))

(declare-fun d!67481 () Bool)

(assert (=> d!67481 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4453 (buf!4939 (_2!9184 lt!307215)))) ((_ sign_extend 32) (currentByte!9277 (_2!9184 lt!307215))) ((_ sign_extend 32) (currentBit!9272 (_2!9184 lt!307215))) lt!307765) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4453 (buf!4939 (_2!9184 lt!307215)))) ((_ sign_extend 32) (currentByte!9277 (_2!9184 lt!307215))) ((_ sign_extend 32) (currentBit!9272 (_2!9184 lt!307215)))) lt!307765))))

(declare-fun bs!16698 () Bool)

(assert (= bs!16698 d!67481))

(assert (=> bs!16698 m!305191))

(assert (=> b!197684 d!67481))

(declare-fun d!67483 () Bool)

(declare-fun e!136268 () Bool)

(assert (=> d!67483 e!136268))

(declare-fun res!166140 () Bool)

(assert (=> d!67483 (=> (not res!166140) (not e!136268))))

(declare-fun lt!309429 () (_ BitVec 64))

(declare-fun lt!309428 () (_ BitVec 64))

(declare-fun lt!309426 () (_ BitVec 64))

(assert (=> d!67483 (= res!166140 (= lt!309426 (bvsub lt!309429 lt!309428)))))

(assert (=> d!67483 (or (= (bvand lt!309429 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!309428 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!309429 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!309429 lt!309428) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67483 (= lt!309428 (remainingBits!0 ((_ sign_extend 32) (size!4453 (buf!4939 (_1!9182 lt!307804)))) ((_ sign_extend 32) (currentByte!9277 (_1!9182 lt!307804))) ((_ sign_extend 32) (currentBit!9272 (_1!9182 lt!307804)))))))

(declare-fun lt!309427 () (_ BitVec 64))

(declare-fun lt!309431 () (_ BitVec 64))

(assert (=> d!67483 (= lt!309429 (bvmul lt!309427 lt!309431))))

(assert (=> d!67483 (or (= lt!309427 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!309431 (bvsdiv (bvmul lt!309427 lt!309431) lt!309427)))))

(assert (=> d!67483 (= lt!309431 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!67483 (= lt!309427 ((_ sign_extend 32) (size!4453 (buf!4939 (_1!9182 lt!307804)))))))

(assert (=> d!67483 (= lt!309426 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9277 (_1!9182 lt!307804))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9272 (_1!9182 lt!307804)))))))

(assert (=> d!67483 (invariant!0 (currentBit!9272 (_1!9182 lt!307804)) (currentByte!9277 (_1!9182 lt!307804)) (size!4453 (buf!4939 (_1!9182 lt!307804))))))

(assert (=> d!67483 (= (bitIndex!0 (size!4453 (buf!4939 (_1!9182 lt!307804))) (currentByte!9277 (_1!9182 lt!307804)) (currentBit!9272 (_1!9182 lt!307804))) lt!309426)))

(declare-fun b!198495 () Bool)

(declare-fun res!166141 () Bool)

(assert (=> b!198495 (=> (not res!166141) (not e!136268))))

(assert (=> b!198495 (= res!166141 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!309426))))

(declare-fun b!198496 () Bool)

(declare-fun lt!309430 () (_ BitVec 64))

(assert (=> b!198496 (= e!136268 (bvsle lt!309426 (bvmul lt!309430 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!198496 (or (= lt!309430 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!309430 #b0000000000000000000000000000000000000000000000000000000000001000) lt!309430)))))

(assert (=> b!198496 (= lt!309430 ((_ sign_extend 32) (size!4453 (buf!4939 (_1!9182 lt!307804)))))))

(assert (= (and d!67483 res!166140) b!198495))

(assert (= (and b!198495 res!166141) b!198496))

(declare-fun m!307429 () Bool)

(assert (=> d!67483 m!307429))

(declare-fun m!307431 () Bool)

(assert (=> d!67483 m!307431))

(assert (=> b!197682 d!67483))

(assert (=> b!197682 d!67331))

(declare-fun d!67485 () Bool)

(declare-fun res!166142 () Bool)

(declare-fun e!136269 () Bool)

(assert (=> d!67485 (=> (not res!166142) (not e!136269))))

(assert (=> d!67485 (= res!166142 (= (size!4453 (buf!4939 (_1!9181 lt!307907))) (size!4453 (buf!4939 (_2!9181 lt!307907)))))))

(assert (=> d!67485 (= (isPrefixOf!0 (_1!9181 lt!307907) (_2!9181 lt!307907)) e!136269)))

(declare-fun b!198497 () Bool)

(declare-fun res!166143 () Bool)

(assert (=> b!198497 (=> (not res!166143) (not e!136269))))

(assert (=> b!198497 (= res!166143 (bvsle (bitIndex!0 (size!4453 (buf!4939 (_1!9181 lt!307907))) (currentByte!9277 (_1!9181 lt!307907)) (currentBit!9272 (_1!9181 lt!307907))) (bitIndex!0 (size!4453 (buf!4939 (_2!9181 lt!307907))) (currentByte!9277 (_2!9181 lt!307907)) (currentBit!9272 (_2!9181 lt!307907)))))))

(declare-fun b!198498 () Bool)

(declare-fun e!136270 () Bool)

(assert (=> b!198498 (= e!136269 e!136270)))

(declare-fun res!166144 () Bool)

(assert (=> b!198498 (=> res!166144 e!136270)))

(assert (=> b!198498 (= res!166144 (= (size!4453 (buf!4939 (_1!9181 lt!307907))) #b00000000000000000000000000000000))))

(declare-fun b!198499 () Bool)

(assert (=> b!198499 (= e!136270 (arrayBitRangesEq!0 (buf!4939 (_1!9181 lt!307907)) (buf!4939 (_2!9181 lt!307907)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4453 (buf!4939 (_1!9181 lt!307907))) (currentByte!9277 (_1!9181 lt!307907)) (currentBit!9272 (_1!9181 lt!307907)))))))

(assert (= (and d!67485 res!166142) b!198497))

(assert (= (and b!198497 res!166143) b!198498))

(assert (= (and b!198498 (not res!166144)) b!198499))

(assert (=> b!198497 m!306959))

(assert (=> b!198497 m!306953))

(assert (=> b!198499 m!306959))

(assert (=> b!198499 m!306959))

(declare-fun m!307433 () Bool)

(assert (=> b!198499 m!307433))

(assert (=> d!66787 d!67485))

(declare-fun d!67487 () Bool)

(assert (=> d!67487 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-fun lt!309432 () Unit!13971)

(assert (=> d!67487 (= lt!309432 (choose!11 thiss!1204))))

(assert (=> d!67487 (= (lemmaIsPrefixRefl!0 thiss!1204) lt!309432)))

(declare-fun bs!16699 () Bool)

(assert (= bs!16699 d!67487))

(assert (=> bs!16699 m!305523))

(declare-fun m!307435 () Bool)

(assert (=> bs!16699 m!307435))

(assert (=> d!66787 d!67487))

(declare-fun d!67489 () Bool)

(declare-fun res!166145 () Bool)

(declare-fun e!136271 () Bool)

(assert (=> d!67489 (=> (not res!166145) (not e!136271))))

(assert (=> d!67489 (= res!166145 (= (size!4453 (buf!4939 lt!307896)) (size!4453 (buf!4939 (_2!9184 lt!307233)))))))

(assert (=> d!67489 (= (isPrefixOf!0 lt!307896 (_2!9184 lt!307233)) e!136271)))

(declare-fun b!198500 () Bool)

(declare-fun res!166146 () Bool)

(assert (=> b!198500 (=> (not res!166146) (not e!136271))))

(assert (=> b!198500 (= res!166146 (bvsle (bitIndex!0 (size!4453 (buf!4939 lt!307896)) (currentByte!9277 lt!307896) (currentBit!9272 lt!307896)) (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307233))) (currentByte!9277 (_2!9184 lt!307233)) (currentBit!9272 (_2!9184 lt!307233)))))))

(declare-fun b!198501 () Bool)

(declare-fun e!136272 () Bool)

(assert (=> b!198501 (= e!136271 e!136272)))

(declare-fun res!166147 () Bool)

(assert (=> b!198501 (=> res!166147 e!136272)))

(assert (=> b!198501 (= res!166147 (= (size!4453 (buf!4939 lt!307896)) #b00000000000000000000000000000000))))

(declare-fun b!198502 () Bool)

(assert (=> b!198502 (= e!136272 (arrayBitRangesEq!0 (buf!4939 lt!307896) (buf!4939 (_2!9184 lt!307233)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4453 (buf!4939 lt!307896)) (currentByte!9277 lt!307896) (currentBit!9272 lt!307896))))))

(assert (= (and d!67489 res!166145) b!198500))

(assert (= (and b!198500 res!166146) b!198501))

(assert (= (and b!198501 (not res!166147)) b!198502))

(declare-fun m!307437 () Bool)

(assert (=> b!198500 m!307437))

(assert (=> b!198500 m!304983))

(assert (=> b!198502 m!307437))

(assert (=> b!198502 m!307437))

(declare-fun m!307439 () Bool)

(assert (=> b!198502 m!307439))

(assert (=> d!66787 d!67489))

(declare-fun d!67491 () Bool)

(assert (=> d!67491 (isPrefixOf!0 lt!307896 (_2!9184 lt!307233))))

(declare-fun lt!309433 () Unit!13971)

(assert (=> d!67491 (= lt!309433 (choose!30 lt!307896 (_2!9184 lt!307233) (_2!9184 lt!307233)))))

(assert (=> d!67491 (isPrefixOf!0 lt!307896 (_2!9184 lt!307233))))

(assert (=> d!67491 (= (lemmaIsPrefixTransitive!0 lt!307896 (_2!9184 lt!307233) (_2!9184 lt!307233)) lt!309433)))

(declare-fun bs!16700 () Bool)

(assert (= bs!16700 d!67491))

(assert (=> bs!16700 m!305513))

(declare-fun m!307441 () Bool)

(assert (=> bs!16700 m!307441))

(assert (=> bs!16700 m!305513))

(assert (=> d!66787 d!67491))

(assert (=> d!66787 d!67327))

(declare-fun d!67493 () Bool)

(declare-fun res!166148 () Bool)

(declare-fun e!136273 () Bool)

(assert (=> d!67493 (=> (not res!166148) (not e!136273))))

(assert (=> d!67493 (= res!166148 (= (size!4453 (buf!4939 lt!307896)) (size!4453 (buf!4939 lt!307896))))))

(assert (=> d!67493 (= (isPrefixOf!0 lt!307896 lt!307896) e!136273)))

(declare-fun b!198503 () Bool)

(declare-fun res!166149 () Bool)

(assert (=> b!198503 (=> (not res!166149) (not e!136273))))

(assert (=> b!198503 (= res!166149 (bvsle (bitIndex!0 (size!4453 (buf!4939 lt!307896)) (currentByte!9277 lt!307896) (currentBit!9272 lt!307896)) (bitIndex!0 (size!4453 (buf!4939 lt!307896)) (currentByte!9277 lt!307896) (currentBit!9272 lt!307896))))))

(declare-fun b!198504 () Bool)

(declare-fun e!136274 () Bool)

(assert (=> b!198504 (= e!136273 e!136274)))

(declare-fun res!166150 () Bool)

(assert (=> b!198504 (=> res!166150 e!136274)))

(assert (=> b!198504 (= res!166150 (= (size!4453 (buf!4939 lt!307896)) #b00000000000000000000000000000000))))

(declare-fun b!198505 () Bool)

(assert (=> b!198505 (= e!136274 (arrayBitRangesEq!0 (buf!4939 lt!307896) (buf!4939 lt!307896) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4453 (buf!4939 lt!307896)) (currentByte!9277 lt!307896) (currentBit!9272 lt!307896))))))

(assert (= (and d!67493 res!166148) b!198503))

(assert (= (and b!198503 res!166149) b!198504))

(assert (= (and b!198504 (not res!166150)) b!198505))

(assert (=> b!198503 m!307437))

(assert (=> b!198503 m!307437))

(assert (=> b!198505 m!307437))

(assert (=> b!198505 m!307437))

(declare-fun m!307443 () Bool)

(assert (=> b!198505 m!307443))

(assert (=> d!66787 d!67493))

(declare-fun d!67495 () Bool)

(assert (=> d!67495 (isPrefixOf!0 lt!307896 lt!307896)))

(declare-fun lt!309434 () Unit!13971)

(assert (=> d!67495 (= lt!309434 (choose!11 lt!307896))))

(assert (=> d!67495 (= (lemmaIsPrefixRefl!0 lt!307896) lt!309434)))

(declare-fun bs!16701 () Bool)

(assert (= bs!16701 d!67495))

(assert (=> bs!16701 m!305511))

(declare-fun m!307445 () Bool)

(assert (=> bs!16701 m!307445))

(assert (=> d!66787 d!67495))

(declare-fun d!67497 () Bool)

(assert (=> d!67497 (isPrefixOf!0 lt!307896 (_2!9184 lt!307233))))

(declare-fun lt!309435 () Unit!13971)

(assert (=> d!67497 (= lt!309435 (choose!30 lt!307896 thiss!1204 (_2!9184 lt!307233)))))

(assert (=> d!67497 (isPrefixOf!0 lt!307896 thiss!1204)))

(assert (=> d!67497 (= (lemmaIsPrefixTransitive!0 lt!307896 thiss!1204 (_2!9184 lt!307233)) lt!309435)))

(declare-fun bs!16702 () Bool)

(assert (= bs!16702 d!67497))

(assert (=> bs!16702 m!305513))

(declare-fun m!307447 () Bool)

(assert (=> bs!16702 m!307447))

(declare-fun m!307449 () Bool)

(assert (=> bs!16702 m!307449))

(assert (=> d!66787 d!67497))

(assert (=> d!66787 d!67317))

(assert (=> d!66787 d!66673))

(declare-fun d!67499 () Bool)

(declare-fun res!166151 () Bool)

(declare-fun e!136275 () Bool)

(assert (=> d!67499 (=> (not res!166151) (not e!136275))))

(assert (=> d!67499 (= res!166151 (= (size!4453 (buf!4939 thiss!1204)) (size!4453 (buf!4939 thiss!1204))))))

(assert (=> d!67499 (= (isPrefixOf!0 thiss!1204 thiss!1204) e!136275)))

(declare-fun b!198506 () Bool)

(declare-fun res!166152 () Bool)

(assert (=> b!198506 (=> (not res!166152) (not e!136275))))

(assert (=> b!198506 (= res!166152 (bvsle (bitIndex!0 (size!4453 (buf!4939 thiss!1204)) (currentByte!9277 thiss!1204) (currentBit!9272 thiss!1204)) (bitIndex!0 (size!4453 (buf!4939 thiss!1204)) (currentByte!9277 thiss!1204) (currentBit!9272 thiss!1204))))))

(declare-fun b!198507 () Bool)

(declare-fun e!136276 () Bool)

(assert (=> b!198507 (= e!136275 e!136276)))

(declare-fun res!166153 () Bool)

(assert (=> b!198507 (=> res!166153 e!136276)))

(assert (=> b!198507 (= res!166153 (= (size!4453 (buf!4939 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!198508 () Bool)

(assert (=> b!198508 (= e!136276 (arrayBitRangesEq!0 (buf!4939 thiss!1204) (buf!4939 thiss!1204) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4453 (buf!4939 thiss!1204)) (currentByte!9277 thiss!1204) (currentBit!9272 thiss!1204))))))

(assert (= (and d!67499 res!166151) b!198506))

(assert (= (and b!198506 res!166152) b!198507))

(assert (= (and b!198507 (not res!166153)) b!198508))

(assert (=> b!198506 m!305001))

(assert (=> b!198506 m!305001))

(assert (=> b!198508 m!305001))

(assert (=> b!198508 m!305001))

(declare-fun m!307451 () Bool)

(assert (=> b!198508 m!307451))

(assert (=> d!66787 d!67499))

(declare-fun d!67501 () Bool)

(declare-fun e!136277 () Bool)

(assert (=> d!67501 e!136277))

(declare-fun res!166154 () Bool)

(assert (=> d!67501 (=> (not res!166154) (not e!136277))))

(assert (=> d!67501 (= res!166154 (= (buf!4939 (_2!9184 (increaseBitIndex!0 (readerFrom!0 (_2!9184 lt!307215) (currentBit!9272 thiss!1204) (currentByte!9277 thiss!1204))))) (buf!4939 (readerFrom!0 (_2!9184 lt!307215) (currentBit!9272 thiss!1204) (currentByte!9277 thiss!1204)))))))

(declare-fun lt!309440 () Bool)

(assert (=> d!67501 (= lt!309440 (not (= (bvand ((_ sign_extend 24) (select (arr!5383 (buf!4939 (readerFrom!0 (_2!9184 lt!307215) (currentBit!9272 thiss!1204) (currentByte!9277 thiss!1204)))) (currentByte!9277 (readerFrom!0 (_2!9184 lt!307215) (currentBit!9272 thiss!1204) (currentByte!9277 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9272 (readerFrom!0 (_2!9184 lt!307215) (currentBit!9272 thiss!1204) (currentByte!9277 thiss!1204)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!309438 () tuple2!17096)

(assert (=> d!67501 (= lt!309438 (tuple2!17097 (not (= (bvand ((_ sign_extend 24) (select (arr!5383 (buf!4939 (readerFrom!0 (_2!9184 lt!307215) (currentBit!9272 thiss!1204) (currentByte!9277 thiss!1204)))) (currentByte!9277 (readerFrom!0 (_2!9184 lt!307215) (currentBit!9272 thiss!1204) (currentByte!9277 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9272 (readerFrom!0 (_2!9184 lt!307215) (currentBit!9272 thiss!1204) (currentByte!9277 thiss!1204)))))) #b00000000000000000000000000000000)) (_2!9184 (increaseBitIndex!0 (readerFrom!0 (_2!9184 lt!307215) (currentBit!9272 thiss!1204) (currentByte!9277 thiss!1204))))))))

(assert (=> d!67501 (validate_offset_bit!0 ((_ sign_extend 32) (size!4453 (buf!4939 (readerFrom!0 (_2!9184 lt!307215) (currentBit!9272 thiss!1204) (currentByte!9277 thiss!1204))))) ((_ sign_extend 32) (currentByte!9277 (readerFrom!0 (_2!9184 lt!307215) (currentBit!9272 thiss!1204) (currentByte!9277 thiss!1204)))) ((_ sign_extend 32) (currentBit!9272 (readerFrom!0 (_2!9184 lt!307215) (currentBit!9272 thiss!1204) (currentByte!9277 thiss!1204)))))))

(assert (=> d!67501 (= (readBit!0 (readerFrom!0 (_2!9184 lt!307215) (currentBit!9272 thiss!1204) (currentByte!9277 thiss!1204))) lt!309438)))

(declare-fun b!198509 () Bool)

(declare-fun lt!309441 () (_ BitVec 64))

(declare-fun lt!309439 () (_ BitVec 64))

(assert (=> b!198509 (= e!136277 (= (bitIndex!0 (size!4453 (buf!4939 (_2!9184 (increaseBitIndex!0 (readerFrom!0 (_2!9184 lt!307215) (currentBit!9272 thiss!1204) (currentByte!9277 thiss!1204)))))) (currentByte!9277 (_2!9184 (increaseBitIndex!0 (readerFrom!0 (_2!9184 lt!307215) (currentBit!9272 thiss!1204) (currentByte!9277 thiss!1204))))) (currentBit!9272 (_2!9184 (increaseBitIndex!0 (readerFrom!0 (_2!9184 lt!307215) (currentBit!9272 thiss!1204) (currentByte!9277 thiss!1204)))))) (bvadd lt!309439 lt!309441)))))

(assert (=> b!198509 (or (not (= (bvand lt!309439 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!309441 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!309439 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!309439 lt!309441) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!198509 (= lt!309441 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!198509 (= lt!309439 (bitIndex!0 (size!4453 (buf!4939 (readerFrom!0 (_2!9184 lt!307215) (currentBit!9272 thiss!1204) (currentByte!9277 thiss!1204)))) (currentByte!9277 (readerFrom!0 (_2!9184 lt!307215) (currentBit!9272 thiss!1204) (currentByte!9277 thiss!1204))) (currentBit!9272 (readerFrom!0 (_2!9184 lt!307215) (currentBit!9272 thiss!1204) (currentByte!9277 thiss!1204)))))))

(declare-fun lt!309437 () Bool)

(assert (=> b!198509 (= lt!309437 (not (= (bvand ((_ sign_extend 24) (select (arr!5383 (buf!4939 (readerFrom!0 (_2!9184 lt!307215) (currentBit!9272 thiss!1204) (currentByte!9277 thiss!1204)))) (currentByte!9277 (readerFrom!0 (_2!9184 lt!307215) (currentBit!9272 thiss!1204) (currentByte!9277 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9272 (readerFrom!0 (_2!9184 lt!307215) (currentBit!9272 thiss!1204) (currentByte!9277 thiss!1204)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!309436 () Bool)

(assert (=> b!198509 (= lt!309436 (not (= (bvand ((_ sign_extend 24) (select (arr!5383 (buf!4939 (readerFrom!0 (_2!9184 lt!307215) (currentBit!9272 thiss!1204) (currentByte!9277 thiss!1204)))) (currentByte!9277 (readerFrom!0 (_2!9184 lt!307215) (currentBit!9272 thiss!1204) (currentByte!9277 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9272 (readerFrom!0 (_2!9184 lt!307215) (currentBit!9272 thiss!1204) (currentByte!9277 thiss!1204)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!309442 () Bool)

(assert (=> b!198509 (= lt!309442 (not (= (bvand ((_ sign_extend 24) (select (arr!5383 (buf!4939 (readerFrom!0 (_2!9184 lt!307215) (currentBit!9272 thiss!1204) (currentByte!9277 thiss!1204)))) (currentByte!9277 (readerFrom!0 (_2!9184 lt!307215) (currentBit!9272 thiss!1204) (currentByte!9277 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9272 (readerFrom!0 (_2!9184 lt!307215) (currentBit!9272 thiss!1204) (currentByte!9277 thiss!1204)))))) #b00000000000000000000000000000000)))))

(assert (= (and d!67501 res!166154) b!198509))

(assert (=> d!67501 m!305007))

(declare-fun m!307453 () Bool)

(assert (=> d!67501 m!307453))

(declare-fun m!307455 () Bool)

(assert (=> d!67501 m!307455))

(declare-fun m!307457 () Bool)

(assert (=> d!67501 m!307457))

(declare-fun m!307459 () Bool)

(assert (=> d!67501 m!307459))

(declare-fun m!307461 () Bool)

(assert (=> b!198509 m!307461))

(assert (=> b!198509 m!305007))

(assert (=> b!198509 m!307453))

(assert (=> b!198509 m!307455))

(assert (=> b!198509 m!307457))

(declare-fun m!307463 () Bool)

(assert (=> b!198509 m!307463))

(assert (=> d!66655 d!67501))

(declare-fun d!67503 () Bool)

(declare-fun e!136278 () Bool)

(assert (=> d!67503 e!136278))

(declare-fun res!166155 () Bool)

(assert (=> d!67503 (=> (not res!166155) (not e!136278))))

(declare-fun lt!309444 () (_ BitVec 64))

(declare-fun lt!309443 () BitStream!8014)

(assert (=> d!67503 (= res!166155 (= (bvadd lt!309444 (bvsub lt!307925 lt!307923)) (bitIndex!0 (size!4453 (buf!4939 lt!309443)) (currentByte!9277 lt!309443) (currentBit!9272 lt!309443))))))

(assert (=> d!67503 (or (not (= (bvand lt!309444 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!307925 lt!307923) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!309444 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!309444 (bvsub lt!307925 lt!307923)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!67503 (= lt!309444 (bitIndex!0 (size!4453 (buf!4939 (_2!9181 lt!307928))) (currentByte!9277 (_2!9181 lt!307928)) (currentBit!9272 (_2!9181 lt!307928))))))

(assert (=> d!67503 (= lt!309443 (_2!9184 (moveBitIndex!0 (_2!9181 lt!307928) (bvsub lt!307925 lt!307923))))))

(assert (=> d!67503 (moveBitIndexPrecond!0 (_2!9181 lt!307928) (bvsub lt!307925 lt!307923))))

(assert (=> d!67503 (= (withMovedBitIndex!0 (_2!9181 lt!307928) (bvsub lt!307925 lt!307923)) lt!309443)))

(declare-fun b!198510 () Bool)

(assert (=> b!198510 (= e!136278 (= (size!4453 (buf!4939 (_2!9181 lt!307928))) (size!4453 (buf!4939 lt!309443))))))

(assert (= (and d!67503 res!166155) b!198510))

(declare-fun m!307465 () Bool)

(assert (=> d!67503 m!307465))

(assert (=> d!67503 m!306985))

(declare-fun m!307467 () Bool)

(assert (=> d!67503 m!307467))

(declare-fun m!307469 () Bool)

(assert (=> d!67503 m!307469))

(assert (=> b!197724 d!67503))

(assert (=> b!197724 d!66671))

(assert (=> b!197724 d!66659))

(declare-fun d!67505 () Bool)

(declare-fun res!166156 () Bool)

(declare-fun e!136279 () Bool)

(assert (=> d!67505 (=> (not res!166156) (not e!136279))))

(assert (=> d!67505 (= res!166156 (= (size!4453 (buf!4939 (_1!9181 lt!307928))) (size!4453 (buf!4939 (_2!9184 lt!307215)))))))

(assert (=> d!67505 (= (isPrefixOf!0 (_1!9181 lt!307928) (_2!9184 lt!307215)) e!136279)))

(declare-fun b!198511 () Bool)

(declare-fun res!166157 () Bool)

(assert (=> b!198511 (=> (not res!166157) (not e!136279))))

(assert (=> b!198511 (= res!166157 (bvsle (bitIndex!0 (size!4453 (buf!4939 (_1!9181 lt!307928))) (currentByte!9277 (_1!9181 lt!307928)) (currentBit!9272 (_1!9181 lt!307928))) (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307215))) (currentByte!9277 (_2!9184 lt!307215)) (currentBit!9272 (_2!9184 lt!307215)))))))

(declare-fun b!198512 () Bool)

(declare-fun e!136280 () Bool)

(assert (=> b!198512 (= e!136279 e!136280)))

(declare-fun res!166158 () Bool)

(assert (=> b!198512 (=> res!166158 e!136280)))

(assert (=> b!198512 (= res!166158 (= (size!4453 (buf!4939 (_1!9181 lt!307928))) #b00000000000000000000000000000000))))

(declare-fun b!198513 () Bool)

(assert (=> b!198513 (= e!136280 (arrayBitRangesEq!0 (buf!4939 (_1!9181 lt!307928)) (buf!4939 (_2!9184 lt!307215)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4453 (buf!4939 (_1!9181 lt!307928))) (currentByte!9277 (_1!9181 lt!307928)) (currentBit!9272 (_1!9181 lt!307928)))))))

(assert (= (and d!67505 res!166156) b!198511))

(assert (= (and b!198511 res!166157) b!198512))

(assert (= (and b!198512 (not res!166158)) b!198513))

(assert (=> b!198511 m!306983))

(assert (=> b!198511 m!304999))

(assert (=> b!198513 m!306983))

(assert (=> b!198513 m!306983))

(declare-fun m!307471 () Bool)

(assert (=> b!198513 m!307471))

(assert (=> b!197722 d!67505))

(declare-fun d!67507 () Bool)

(declare-fun lt!309445 () tuple2!17096)

(assert (=> d!67507 (= lt!309445 (readBit!0 (readerFrom!0 (_2!9184 lt!307417) (currentBit!9272 thiss!1204) (currentByte!9277 thiss!1204))))))

(assert (=> d!67507 (= (readBitPure!0 (readerFrom!0 (_2!9184 lt!307417) (currentBit!9272 thiss!1204) (currentByte!9277 thiss!1204))) (tuple2!17075 (_2!9193 lt!309445) (_1!9193 lt!309445)))))

(declare-fun bs!16703 () Bool)

(assert (= bs!16703 d!67507))

(assert (=> bs!16703 m!305197))

(declare-fun m!307473 () Bool)

(assert (=> bs!16703 m!307473))

(assert (=> b!197545 d!67507))

(declare-fun d!67509 () Bool)

(declare-fun e!136281 () Bool)

(assert (=> d!67509 e!136281))

(declare-fun res!166159 () Bool)

(assert (=> d!67509 (=> (not res!166159) (not e!136281))))

(assert (=> d!67509 (= res!166159 (invariant!0 (currentBit!9272 (_2!9184 lt!307417)) (currentByte!9277 (_2!9184 lt!307417)) (size!4453 (buf!4939 (_2!9184 lt!307417)))))))

(assert (=> d!67509 (= (readerFrom!0 (_2!9184 lt!307417) (currentBit!9272 thiss!1204) (currentByte!9277 thiss!1204)) (BitStream!8015 (buf!4939 (_2!9184 lt!307417)) (currentByte!9277 thiss!1204) (currentBit!9272 thiss!1204)))))

(declare-fun b!198514 () Bool)

(assert (=> b!198514 (= e!136281 (invariant!0 (currentBit!9272 thiss!1204) (currentByte!9277 thiss!1204) (size!4453 (buf!4939 (_2!9184 lt!307417)))))))

(assert (= (and d!67509 res!166159) b!198514))

(assert (=> d!67509 m!306947))

(declare-fun m!307475 () Bool)

(assert (=> b!198514 m!307475))

(assert (=> b!197545 d!67509))

(assert (=> d!66755 d!67349))

(declare-fun b!198515 () Bool)

(declare-fun res!166160 () Bool)

(declare-fun lt!309448 () (_ BitVec 32))

(assert (=> b!198515 (= res!166160 (= lt!309448 #b00000000000000000000000000000000))))

(declare-fun e!136286 () Bool)

(assert (=> b!198515 (=> res!166160 e!136286)))

(declare-fun e!136285 () Bool)

(assert (=> b!198515 (= e!136285 e!136286)))

(declare-fun b!198516 () Bool)

(declare-fun e!136287 () Bool)

(assert (=> b!198516 (= e!136287 e!136285)))

(declare-fun res!166164 () Bool)

(declare-fun call!3134 () Bool)

(assert (=> b!198516 (= res!166164 call!3134)))

(assert (=> b!198516 (=> (not res!166164) (not e!136285))))

(declare-fun lt!309446 () (_ BitVec 32))

(declare-fun c!9889 () Bool)

(declare-fun lt!309447 () tuple4!262)

(declare-fun bm!3131 () Bool)

(assert (=> bm!3131 (= call!3134 (byteRangesEq!0 (select (arr!5383 (buf!4939 (_2!9184 lt!307215))) (_3!647 lt!309447)) (select (arr!5383 (buf!4939 (_2!9184 lt!307233))) (_3!647 lt!309447)) lt!309446 (ite c!9889 lt!309448 #b00000000000000000000000000001000)))))

(declare-fun b!198517 () Bool)

(declare-fun e!136283 () Bool)

(declare-fun e!136284 () Bool)

(assert (=> b!198517 (= e!136283 e!136284)))

(declare-fun res!166161 () Bool)

(assert (=> b!198517 (=> (not res!166161) (not e!136284))))

(declare-fun e!136282 () Bool)

(assert (=> b!198517 (= res!166161 e!136282)))

(declare-fun res!166163 () Bool)

(assert (=> b!198517 (=> res!166163 e!136282)))

(assert (=> b!198517 (= res!166163 (bvsge (_1!9201 lt!309447) (_2!9201 lt!309447)))))

(assert (=> b!198517 (= lt!309448 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307215))) (currentByte!9277 (_2!9184 lt!307215)) (currentBit!9272 (_2!9184 lt!307215))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!198517 (= lt!309446 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!198517 (= lt!309447 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307215))) (currentByte!9277 (_2!9184 lt!307215)) (currentBit!9272 (_2!9184 lt!307215)))))))

(declare-fun b!198519 () Bool)

(assert (=> b!198519 (= e!136286 (byteRangesEq!0 (select (arr!5383 (buf!4939 (_2!9184 lt!307215))) (_4!131 lt!309447)) (select (arr!5383 (buf!4939 (_2!9184 lt!307233))) (_4!131 lt!309447)) #b00000000000000000000000000000000 lt!309448))))

(declare-fun b!198520 () Bool)

(assert (=> b!198520 (= e!136282 (arrayRangesEq!693 (buf!4939 (_2!9184 lt!307215)) (buf!4939 (_2!9184 lt!307233)) (_1!9201 lt!309447) (_2!9201 lt!309447)))))

(declare-fun b!198521 () Bool)

(assert (=> b!198521 (= e!136287 call!3134)))

(declare-fun d!67511 () Bool)

(declare-fun res!166162 () Bool)

(assert (=> d!67511 (=> res!166162 e!136283)))

(assert (=> d!67511 (= res!166162 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307215))) (currentByte!9277 (_2!9184 lt!307215)) (currentBit!9272 (_2!9184 lt!307215)))))))

(assert (=> d!67511 (= (arrayBitRangesEq!0 (buf!4939 (_2!9184 lt!307215)) (buf!4939 (_2!9184 lt!307233)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307215))) (currentByte!9277 (_2!9184 lt!307215)) (currentBit!9272 (_2!9184 lt!307215)))) e!136283)))

(declare-fun b!198518 () Bool)

(assert (=> b!198518 (= e!136284 e!136287)))

(assert (=> b!198518 (= c!9889 (= (_3!647 lt!309447) (_4!131 lt!309447)))))

(assert (= (and d!67511 (not res!166162)) b!198517))

(assert (= (and b!198517 (not res!166163)) b!198520))

(assert (= (and b!198517 res!166161) b!198518))

(assert (= (and b!198518 c!9889) b!198521))

(assert (= (and b!198518 (not c!9889)) b!198516))

(assert (= (and b!198516 res!166164) b!198515))

(assert (= (and b!198515 (not res!166160)) b!198519))

(assert (= (or b!198521 b!198516) bm!3131))

(declare-fun m!307477 () Bool)

(assert (=> bm!3131 m!307477))

(declare-fun m!307479 () Bool)

(assert (=> bm!3131 m!307479))

(assert (=> bm!3131 m!307477))

(assert (=> bm!3131 m!307479))

(declare-fun m!307481 () Bool)

(assert (=> bm!3131 m!307481))

(assert (=> b!198517 m!304999))

(declare-fun m!307483 () Bool)

(assert (=> b!198517 m!307483))

(declare-fun m!307485 () Bool)

(assert (=> b!198519 m!307485))

(declare-fun m!307487 () Bool)

(assert (=> b!198519 m!307487))

(assert (=> b!198519 m!307485))

(assert (=> b!198519 m!307487))

(declare-fun m!307489 () Bool)

(assert (=> b!198519 m!307489))

(declare-fun m!307491 () Bool)

(assert (=> b!198520 m!307491))

(assert (=> b!197522 d!67511))

(assert (=> b!197522 d!66659))

(declare-fun d!67513 () Bool)

(declare-fun res!166165 () Bool)

(declare-fun e!136288 () Bool)

(assert (=> d!67513 (=> (not res!166165) (not e!136288))))

(assert (=> d!67513 (= res!166165 (= (size!4453 (buf!4939 (_2!9181 lt!307928))) (size!4453 (buf!4939 (_2!9184 lt!307233)))))))

(assert (=> d!67513 (= (isPrefixOf!0 (_2!9181 lt!307928) (_2!9184 lt!307233)) e!136288)))

(declare-fun b!198522 () Bool)

(declare-fun res!166166 () Bool)

(assert (=> b!198522 (=> (not res!166166) (not e!136288))))

(assert (=> b!198522 (= res!166166 (bvsle (bitIndex!0 (size!4453 (buf!4939 (_2!9181 lt!307928))) (currentByte!9277 (_2!9181 lt!307928)) (currentBit!9272 (_2!9181 lt!307928))) (bitIndex!0 (size!4453 (buf!4939 (_2!9184 lt!307233))) (currentByte!9277 (_2!9184 lt!307233)) (currentBit!9272 (_2!9184 lt!307233)))))))

(declare-fun b!198523 () Bool)

(declare-fun e!136289 () Bool)

(assert (=> b!198523 (= e!136288 e!136289)))

(declare-fun res!166167 () Bool)

(assert (=> b!198523 (=> res!166167 e!136289)))

(assert (=> b!198523 (= res!166167 (= (size!4453 (buf!4939 (_2!9181 lt!307928))) #b00000000000000000000000000000000))))

(declare-fun b!198524 () Bool)

(assert (=> b!198524 (= e!136289 (arrayBitRangesEq!0 (buf!4939 (_2!9181 lt!307928)) (buf!4939 (_2!9184 lt!307233)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4453 (buf!4939 (_2!9181 lt!307928))) (currentByte!9277 (_2!9181 lt!307928)) (currentBit!9272 (_2!9181 lt!307928)))))))

(assert (= (and d!67513 res!166165) b!198522))

(assert (= (and b!198522 res!166166) b!198523))

(assert (= (and b!198523 (not res!166167)) b!198524))

(assert (=> b!198522 m!306985))

(assert (=> b!198522 m!304983))

(assert (=> b!198524 m!306985))

(assert (=> b!198524 m!306985))

(declare-fun m!307493 () Bool)

(assert (=> b!198524 m!307493))

(assert (=> b!197720 d!67513))

(push 1)

(assert (not d!67337))

(assert (not b!198499))

(assert (not b!198524))

(assert (not d!67507))

(assert (not b!198486))

(assert (not b!198514))

(assert (not b!198429))

(assert (not d!67451))

(assert (not d!67423))

(assert (not d!67421))

(assert (not b!198431))

(assert (not d!67339))

(assert (not b!198403))

(assert (not d!67353))

(assert (not d!67449))

(assert (not b!198335))

(assert (not d!67317))

(assert (not d!67433))

(assert (not d!67497))

(assert (not b!198517))

(assert (not b!198337))

(assert (not b!198327))

(assert (not d!67463))

(assert (not b!198325))

(assert (not b!198430))

(assert (not b!198312))

(assert (not b!198455))

(assert (not b!198396))

(assert (not b!198457))

(assert (not b!198448))

(assert (not b!198432))

(assert (not b!198484))

(assert (not b!198398))

(assert (not bm!3129))

(assert (not b!198400))

(assert (not b!198383))

(assert (not b!198433))

(assert (not d!67369))

(assert (not bm!3131))

(assert (not d!67435))

(assert (not d!67443))

(assert (not b!198410))

(assert (not d!67487))

(assert (not d!67441))

(assert (not d!67457))

(assert (not d!67299))

(assert (not d!67377))

(assert (not d!67471))

(assert (not b!198502))

(assert (not b!198467))

(assert (not b!198463))

(assert (not d!67315))

(assert (not b!198505))

(assert (not b!198310))

(assert (not d!67391))

(assert (not d!67481))

(assert (not b!198405))

(assert (not b!198380))

(assert (not d!67439))

(assert (not b!198324))

(assert (not d!67467))

(assert (not b!198381))

(assert (not b!198511))

(assert (not d!67447))

(assert (not b!198437))

(assert (not d!67445))

(assert (not b!198503))

(assert (not d!67469))

(assert (not b!198513))

(assert (not b!198479))

(assert (not b!198520))

(assert (not b!198489))

(assert (not d!67413))

(assert (not d!67495))

(assert (not b!198462))

(assert (not d!67399))

(assert (not b!198313))

(assert (not b!198482))

(assert (not b!198378))

(assert (not b!198508))

(assert (not bm!3128))

(assert (not b!198332))

(assert (not b!198461))

(assert (not b!198340))

(assert (not d!67465))

(assert (not d!67491))

(assert (not d!67363))

(assert (not b!198330))

(assert (not b!198399))

(assert (not d!67411))

(assert (not d!67295))

(assert (not d!67475))

(assert (not b!198453))

(assert (not d!67335))

(assert (not d!67379))

(assert (not bm!3126))

(assert (not b!198447))

(assert (not d!67375))

(assert (not b!198334))

(assert (not d!67459))

(assert (not b!198413))

(assert (not b!198519))

(assert (not d!67405))

(assert (not b!198361))

(assert (not b!198408))

(assert (not b!198472))

(assert (not b!198360))

(assert (not d!67503))

(assert (not b!198485))

(assert (not d!67331))

(assert (not b!198397))

(assert (not b!198464))

(assert (not b!198475))

(assert (not d!67477))

(assert (not b!198415))

(assert (not d!67509))

(assert (not d!67437))

(assert (not b!198416))

(assert (not b!198333))

(assert (not b!198445))

(assert (not b!198357))

(assert (not d!67319))

(assert (not d!67427))

(assert (not b!198316))

(assert (not b!198436))

(assert (not d!67343))

(assert (not b!198500))

(assert (not b!198355))

(assert (not b!198427))

(assert (not d!67365))

(assert (not d!67297))

(assert (not d!67483))

(assert (not b!198438))

(assert (not b!198468))

(assert (not b!198319))

(assert (not b!198384))

(assert (not b!198509))

(assert (not b!198470))

(assert (not d!67313))

(assert (not b!198356))

(assert (not b!198440))

(assert (not b!198491))

(assert (not b!198497))

(assert (not b!198321))

(assert (not bm!3127))

(assert (not b!198406))

(assert (not d!67397))

(assert (not d!67395))

(assert (not b!198469))

(assert (not bm!3130))

(assert (not d!67501))

(assert (not d!67453))

(assert (not d!67431))

(assert (not d!67401))

(assert (not b!198460))

(assert (not d!67455))

(assert (not d!67347))

(assert (not d!67301))

(assert (not b!198315))

(assert (not b!198506))

(assert (not d!67367))

(assert (not d!67419))

(assert (not b!198456))

(assert (not b!198466))

(assert (not b!198318))

(assert (not d!67417))

(assert (not b!198322))

(assert (not b!198522))

(check-sat)

(pop 1)

(push 1)

(check-sat)

