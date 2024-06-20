; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42300 () Bool)

(assert start!42300)

(declare-fun b!200036 () Bool)

(declare-fun e!137262 () Bool)

(declare-datatypes ((array!10125 0))(
  ( (array!10126 (arr!5391 (Array (_ BitVec 32) (_ BitVec 8))) (size!4461 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8030 0))(
  ( (BitStream!8031 (buf!4959 array!10125) (currentByte!9315 (_ BitVec 32)) (currentBit!9310 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!17160 0))(
  ( (tuple2!17161 (_1!9231 BitStream!8030) (_2!9231 Bool)) )
))
(declare-fun lt!312311 () tuple2!17160)

(declare-fun lt!312308 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!200036 (= e!137262 (= (bitIndex!0 (size!4461 (buf!4959 (_1!9231 lt!312311))) (currentByte!9315 (_1!9231 lt!312311)) (currentBit!9310 (_1!9231 lt!312311))) lt!312308))))

(declare-fun b!200037 () Bool)

(declare-fun res!167471 () Bool)

(declare-fun e!137264 () Bool)

(assert (=> b!200037 (=> res!167471 e!137264)))

(declare-datatypes ((Unit!14203 0))(
  ( (Unit!14204) )
))
(declare-datatypes ((tuple2!17162 0))(
  ( (tuple2!17163 (_1!9232 Unit!14203) (_2!9232 BitStream!8030)) )
))
(declare-fun lt!312312 () tuple2!17162)

(declare-fun lt!312310 () tuple2!17162)

(declare-fun isPrefixOf!0 (BitStream!8030 BitStream!8030) Bool)

(assert (=> b!200037 (= res!167471 (not (isPrefixOf!0 (_2!9232 lt!312312) (_2!9232 lt!312310))))))

(declare-fun b!200038 () Bool)

(declare-fun e!137257 () Bool)

(declare-datatypes ((tuple2!17164 0))(
  ( (tuple2!17165 (_1!9233 BitStream!8030) (_2!9233 (_ BitVec 64))) )
))
(declare-fun lt!312319 () tuple2!17164)

(declare-datatypes ((tuple2!17166 0))(
  ( (tuple2!17167 (_1!9234 BitStream!8030) (_2!9234 BitStream!8030)) )
))
(declare-fun lt!312293 () tuple2!17166)

(assert (=> b!200038 (= e!137257 (= (bitIndex!0 (size!4461 (buf!4959 (_1!9233 lt!312319))) (currentByte!9315 (_1!9233 lt!312319)) (currentBit!9310 (_1!9233 lt!312319))) (bitIndex!0 (size!4461 (buf!4959 (_2!9234 lt!312293))) (currentByte!9315 (_2!9234 lt!312293)) (currentBit!9310 (_2!9234 lt!312293)))))))

(declare-fun b!200039 () Bool)

(declare-fun res!167472 () Bool)

(declare-fun e!137269 () Bool)

(assert (=> b!200039 (=> (not res!167472) (not e!137269))))

(declare-fun thiss!1204 () BitStream!8030)

(assert (=> b!200039 (= res!167472 (isPrefixOf!0 thiss!1204 (_2!9232 lt!312312)))))

(declare-fun b!200040 () Bool)

(declare-fun e!137268 () Bool)

(declare-fun lt!312313 () tuple2!17160)

(declare-fun lt!312304 () tuple2!17160)

(assert (=> b!200040 (= e!137268 (= (_2!9231 lt!312313) (_2!9231 lt!312304)))))

(declare-fun res!167485 () Bool)

(declare-fun e!137258 () Bool)

(assert (=> start!42300 (=> (not res!167485) (not e!137258))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!42300 (= res!167485 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!42300 e!137258))

(assert (=> start!42300 true))

(declare-fun e!137270 () Bool)

(declare-fun inv!12 (BitStream!8030) Bool)

(assert (=> start!42300 (and (inv!12 thiss!1204) e!137270)))

(declare-fun b!200041 () Bool)

(declare-fun res!167474 () Bool)

(declare-fun e!137267 () Bool)

(assert (=> b!200041 (=> (not res!167474) (not e!137267))))

(assert (=> b!200041 (= res!167474 (not (= i!590 nBits!348)))))

(declare-fun b!200042 () Bool)

(declare-fun res!167477 () Bool)

(assert (=> b!200042 (=> res!167477 e!137264)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!200042 (= res!167477 (not (invariant!0 (currentBit!9310 (_2!9232 lt!312310)) (currentByte!9315 (_2!9232 lt!312310)) (size!4461 (buf!4959 (_2!9232 lt!312310))))))))

(declare-fun b!200043 () Bool)

(declare-fun e!137261 () Bool)

(assert (=> b!200043 (= e!137264 e!137261)))

(declare-fun res!167468 () Bool)

(assert (=> b!200043 (=> res!167468 e!137261)))

(declare-fun lt!312300 () tuple2!17164)

(declare-fun lt!312302 () tuple2!17166)

(assert (=> b!200043 (= res!167468 (not (= (_1!9233 lt!312300) (_2!9234 lt!312302))))))

(declare-fun lt!312306 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8030 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17164)

(assert (=> b!200043 (= lt!312300 (readNBitsLSBFirstsLoopPure!0 (_1!9234 lt!312302) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!312306))))

(declare-fun lt!312318 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!200043 (validate_offset_bits!1 ((_ sign_extend 32) (size!4461 (buf!4959 (_2!9232 lt!312310)))) ((_ sign_extend 32) (currentByte!9315 (_2!9232 lt!312312))) ((_ sign_extend 32) (currentBit!9310 (_2!9232 lt!312312))) lt!312318)))

(declare-fun lt!312294 () Unit!14203)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8030 array!10125 (_ BitVec 64)) Unit!14203)

(assert (=> b!200043 (= lt!312294 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9232 lt!312312) (buf!4959 (_2!9232 lt!312310)) lt!312318))))

(assert (=> b!200043 (= lt!312318 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!312317 () (_ BitVec 64))

(declare-fun lt!312297 () (_ BitVec 64))

(declare-fun lt!312316 () tuple2!17160)

(assert (=> b!200043 (= lt!312306 (bvor lt!312317 (ite (_2!9231 lt!312316) lt!312297 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!200043 (= lt!312319 (readNBitsLSBFirstsLoopPure!0 (_1!9234 lt!312293) nBits!348 i!590 lt!312317))))

(declare-fun lt!312309 () (_ BitVec 64))

(assert (=> b!200043 (validate_offset_bits!1 ((_ sign_extend 32) (size!4461 (buf!4959 (_2!9232 lt!312310)))) ((_ sign_extend 32) (currentByte!9315 thiss!1204)) ((_ sign_extend 32) (currentBit!9310 thiss!1204)) lt!312309)))

(declare-fun lt!312314 () Unit!14203)

(assert (=> b!200043 (= lt!312314 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4959 (_2!9232 lt!312310)) lt!312309))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!200043 (= lt!312317 (bvand v!189 (onesLSBLong!0 i!590)))))

(declare-fun lt!312305 () Bool)

(assert (=> b!200043 (= (_2!9231 lt!312316) lt!312305)))

(declare-fun readBitPure!0 (BitStream!8030) tuple2!17160)

(assert (=> b!200043 (= lt!312316 (readBitPure!0 (_1!9234 lt!312293)))))

(declare-fun reader!0 (BitStream!8030 BitStream!8030) tuple2!17166)

(assert (=> b!200043 (= lt!312302 (reader!0 (_2!9232 lt!312312) (_2!9232 lt!312310)))))

(assert (=> b!200043 (= lt!312293 (reader!0 thiss!1204 (_2!9232 lt!312310)))))

(assert (=> b!200043 e!137268))

(declare-fun res!167469 () Bool)

(assert (=> b!200043 (=> (not res!167469) (not e!137268))))

(assert (=> b!200043 (= res!167469 (= (bitIndex!0 (size!4461 (buf!4959 (_1!9231 lt!312313))) (currentByte!9315 (_1!9231 lt!312313)) (currentBit!9310 (_1!9231 lt!312313))) (bitIndex!0 (size!4461 (buf!4959 (_1!9231 lt!312304))) (currentByte!9315 (_1!9231 lt!312304)) (currentBit!9310 (_1!9231 lt!312304)))))))

(declare-fun lt!312298 () Unit!14203)

(declare-fun lt!312291 () BitStream!8030)

(declare-fun readBitPrefixLemma!0 (BitStream!8030 BitStream!8030) Unit!14203)

(assert (=> b!200043 (= lt!312298 (readBitPrefixLemma!0 lt!312291 (_2!9232 lt!312310)))))

(assert (=> b!200043 (= lt!312304 (readBitPure!0 (BitStream!8031 (buf!4959 (_2!9232 lt!312310)) (currentByte!9315 thiss!1204) (currentBit!9310 thiss!1204))))))

(assert (=> b!200043 (= lt!312313 (readBitPure!0 lt!312291))))

(declare-fun e!137259 () Bool)

(assert (=> b!200043 e!137259))

(declare-fun res!167476 () Bool)

(assert (=> b!200043 (=> (not res!167476) (not e!137259))))

(assert (=> b!200043 (= res!167476 (invariant!0 (currentBit!9310 thiss!1204) (currentByte!9315 thiss!1204) (size!4461 (buf!4959 (_2!9232 lt!312312)))))))

(assert (=> b!200043 (= lt!312291 (BitStream!8031 (buf!4959 (_2!9232 lt!312312)) (currentByte!9315 thiss!1204) (currentBit!9310 thiss!1204)))))

(declare-fun b!200044 () Bool)

(declare-fun res!167470 () Bool)

(declare-fun e!137260 () Bool)

(assert (=> b!200044 (=> (not res!167470) (not e!137260))))

(declare-fun lt!312301 () (_ BitVec 64))

(declare-fun lt!312295 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!8030 (_ BitVec 64)) BitStream!8030)

(assert (=> b!200044 (= res!167470 (= (_1!9234 lt!312302) (withMovedBitIndex!0 (_2!9234 lt!312302) (bvsub lt!312295 lt!312301))))))

(declare-fun b!200045 () Bool)

(assert (=> b!200045 (= e!137259 (invariant!0 (currentBit!9310 thiss!1204) (currentByte!9315 thiss!1204) (size!4461 (buf!4959 (_2!9232 lt!312310)))))))

(declare-fun lt!312292 () BitStream!8030)

(declare-fun b!200046 () Bool)

(declare-fun lt!312315 () (_ BitVec 64))

(assert (=> b!200046 (= e!137260 (and (= lt!312315 (bvsub lt!312295 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!9234 lt!312302) lt!312292)) (= (_2!9233 lt!312319) (_2!9233 lt!312300)))))))

(declare-fun b!200047 () Bool)

(assert (=> b!200047 (= e!137269 e!137262)))

(declare-fun res!167487 () Bool)

(assert (=> b!200047 (=> (not res!167487) (not e!137262))))

(assert (=> b!200047 (= res!167487 (and (= (_2!9231 lt!312311) lt!312305) (= (_1!9231 lt!312311) (_2!9232 lt!312312))))))

(declare-fun readerFrom!0 (BitStream!8030 (_ BitVec 32) (_ BitVec 32)) BitStream!8030)

(assert (=> b!200047 (= lt!312311 (readBitPure!0 (readerFrom!0 (_2!9232 lt!312312) (currentBit!9310 thiss!1204) (currentByte!9315 thiss!1204))))))

(declare-fun b!200048 () Bool)

(assert (=> b!200048 (= e!137258 e!137267)))

(declare-fun res!167475 () Bool)

(assert (=> b!200048 (=> (not res!167475) (not e!137267))))

(assert (=> b!200048 (= res!167475 (validate_offset_bits!1 ((_ sign_extend 32) (size!4461 (buf!4959 thiss!1204))) ((_ sign_extend 32) (currentByte!9315 thiss!1204)) ((_ sign_extend 32) (currentBit!9310 thiss!1204)) lt!312309))))

(assert (=> b!200048 (= lt!312309 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!200049 () Bool)

(declare-fun array_inv!4202 (array!10125) Bool)

(assert (=> b!200049 (= e!137270 (array_inv!4202 (buf!4959 thiss!1204)))))

(declare-fun b!200050 () Bool)

(declare-fun res!167473 () Bool)

(assert (=> b!200050 (=> res!167473 e!137264)))

(assert (=> b!200050 (= res!167473 (not (isPrefixOf!0 thiss!1204 (_2!9232 lt!312312))))))

(declare-fun b!200051 () Bool)

(declare-fun e!137265 () Bool)

(assert (=> b!200051 (= e!137265 e!137264)))

(declare-fun res!167478 () Bool)

(assert (=> b!200051 (=> res!167478 e!137264)))

(assert (=> b!200051 (= res!167478 (not (= lt!312301 (bvsub (bvsub (bvadd lt!312295 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!200051 (= lt!312301 (bitIndex!0 (size!4461 (buf!4959 (_2!9232 lt!312310))) (currentByte!9315 (_2!9232 lt!312310)) (currentBit!9310 (_2!9232 lt!312310))))))

(assert (=> b!200051 (isPrefixOf!0 thiss!1204 (_2!9232 lt!312310))))

(declare-fun lt!312296 () Unit!14203)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8030 BitStream!8030 BitStream!8030) Unit!14203)

(assert (=> b!200051 (= lt!312296 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9232 lt!312312) (_2!9232 lt!312310)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8030 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17162)

(assert (=> b!200051 (= lt!312310 (appendBitsLSBFirstLoopTR!0 (_2!9232 lt!312312) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!200052 () Bool)

(declare-fun res!167480 () Bool)

(assert (=> b!200052 (=> (not res!167480) (not e!137260))))

(assert (=> b!200052 (= res!167480 (= (_1!9234 lt!312293) (withMovedBitIndex!0 (_2!9234 lt!312293) (bvsub lt!312315 lt!312301))))))

(declare-fun b!200053 () Bool)

(declare-fun res!167481 () Bool)

(assert (=> b!200053 (=> res!167481 e!137264)))

(assert (=> b!200053 (= res!167481 (or (not (= (size!4461 (buf!4959 (_2!9232 lt!312310))) (size!4461 (buf!4959 thiss!1204)))) (not (= lt!312301 (bvsub (bvadd lt!312315 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!200054 () Bool)

(declare-fun res!167482 () Bool)

(assert (=> b!200054 (=> (not res!167482) (not e!137267))))

(assert (=> b!200054 (= res!167482 (invariant!0 (currentBit!9310 thiss!1204) (currentByte!9315 thiss!1204) (size!4461 (buf!4959 thiss!1204))))))

(declare-fun b!200055 () Bool)

(assert (=> b!200055 (= e!137267 (not e!137265))))

(declare-fun res!167483 () Bool)

(assert (=> b!200055 (=> res!167483 e!137265)))

(assert (=> b!200055 (= res!167483 (not (= lt!312295 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!312315))))))

(assert (=> b!200055 (= lt!312295 (bitIndex!0 (size!4461 (buf!4959 (_2!9232 lt!312312))) (currentByte!9315 (_2!9232 lt!312312)) (currentBit!9310 (_2!9232 lt!312312))))))

(assert (=> b!200055 (= lt!312315 (bitIndex!0 (size!4461 (buf!4959 thiss!1204)) (currentByte!9315 thiss!1204) (currentBit!9310 thiss!1204)))))

(declare-fun e!137266 () Bool)

(assert (=> b!200055 e!137266))

(declare-fun res!167486 () Bool)

(assert (=> b!200055 (=> (not res!167486) (not e!137266))))

(assert (=> b!200055 (= res!167486 (= (size!4461 (buf!4959 thiss!1204)) (size!4461 (buf!4959 (_2!9232 lt!312312)))))))

(declare-fun appendBit!0 (BitStream!8030 Bool) tuple2!17162)

(assert (=> b!200055 (= lt!312312 (appendBit!0 thiss!1204 lt!312305))))

(assert (=> b!200055 (= lt!312305 (not (= (bvand v!189 lt!312297) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!200055 (= lt!312297 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!200056 () Bool)

(assert (=> b!200056 (= e!137266 e!137269)))

(declare-fun res!167479 () Bool)

(assert (=> b!200056 (=> (not res!167479) (not e!137269))))

(declare-fun lt!312303 () (_ BitVec 64))

(assert (=> b!200056 (= res!167479 (= lt!312308 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!312303)))))

(assert (=> b!200056 (= lt!312308 (bitIndex!0 (size!4461 (buf!4959 (_2!9232 lt!312312))) (currentByte!9315 (_2!9232 lt!312312)) (currentBit!9310 (_2!9232 lt!312312))))))

(assert (=> b!200056 (= lt!312303 (bitIndex!0 (size!4461 (buf!4959 thiss!1204)) (currentByte!9315 thiss!1204) (currentBit!9310 thiss!1204)))))

(declare-fun b!200057 () Bool)

(assert (=> b!200057 (= e!137261 e!137257)))

(declare-fun res!167484 () Bool)

(assert (=> b!200057 (=> res!167484 e!137257)))

(assert (=> b!200057 (= res!167484 (not (= (_1!9234 lt!312302) lt!312292)))))

(assert (=> b!200057 e!137260))

(declare-fun res!167467 () Bool)

(assert (=> b!200057 (=> (not res!167467) (not e!137260))))

(declare-fun lt!312307 () tuple2!17164)

(assert (=> b!200057 (= res!167467 (and (= (_2!9233 lt!312319) (_2!9233 lt!312307)) (= (_1!9233 lt!312319) (_1!9233 lt!312307))))))

(declare-fun lt!312299 () Unit!14203)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8030 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!14203)

(assert (=> b!200057 (= lt!312299 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9234 lt!312293) nBits!348 i!590 lt!312317))))

(assert (=> b!200057 (= lt!312307 (readNBitsLSBFirstsLoopPure!0 lt!312292 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!312306))))

(assert (=> b!200057 (= lt!312292 (withMovedBitIndex!0 (_1!9234 lt!312293) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (= (and start!42300 res!167485) b!200048))

(assert (= (and b!200048 res!167475) b!200054))

(assert (= (and b!200054 res!167482) b!200041))

(assert (= (and b!200041 res!167474) b!200055))

(assert (= (and b!200055 res!167486) b!200056))

(assert (= (and b!200056 res!167479) b!200039))

(assert (= (and b!200039 res!167472) b!200047))

(assert (= (and b!200047 res!167487) b!200036))

(assert (= (and b!200055 (not res!167483)) b!200051))

(assert (= (and b!200051 (not res!167478)) b!200042))

(assert (= (and b!200042 (not res!167477)) b!200053))

(assert (= (and b!200053 (not res!167481)) b!200037))

(assert (= (and b!200037 (not res!167471)) b!200050))

(assert (= (and b!200050 (not res!167473)) b!200043))

(assert (= (and b!200043 res!167476) b!200045))

(assert (= (and b!200043 res!167469) b!200040))

(assert (= (and b!200043 (not res!167468)) b!200057))

(assert (= (and b!200057 res!167467) b!200052))

(assert (= (and b!200052 res!167480) b!200044))

(assert (= (and b!200044 res!167470) b!200046))

(assert (= (and b!200057 (not res!167484)) b!200038))

(assert (= start!42300 b!200049))

(declare-fun m!310419 () Bool)

(assert (=> b!200038 m!310419))

(declare-fun m!310421 () Bool)

(assert (=> b!200038 m!310421))

(declare-fun m!310423 () Bool)

(assert (=> b!200047 m!310423))

(assert (=> b!200047 m!310423))

(declare-fun m!310425 () Bool)

(assert (=> b!200047 m!310425))

(declare-fun m!310427 () Bool)

(assert (=> b!200042 m!310427))

(declare-fun m!310429 () Bool)

(assert (=> b!200055 m!310429))

(declare-fun m!310431 () Bool)

(assert (=> b!200055 m!310431))

(declare-fun m!310433 () Bool)

(assert (=> b!200055 m!310433))

(declare-fun m!310435 () Bool)

(assert (=> b!200036 m!310435))

(declare-fun m!310437 () Bool)

(assert (=> b!200048 m!310437))

(declare-fun m!310439 () Bool)

(assert (=> start!42300 m!310439))

(declare-fun m!310441 () Bool)

(assert (=> b!200043 m!310441))

(declare-fun m!310443 () Bool)

(assert (=> b!200043 m!310443))

(declare-fun m!310445 () Bool)

(assert (=> b!200043 m!310445))

(declare-fun m!310447 () Bool)

(assert (=> b!200043 m!310447))

(declare-fun m!310449 () Bool)

(assert (=> b!200043 m!310449))

(declare-fun m!310451 () Bool)

(assert (=> b!200043 m!310451))

(declare-fun m!310453 () Bool)

(assert (=> b!200043 m!310453))

(declare-fun m!310455 () Bool)

(assert (=> b!200043 m!310455))

(declare-fun m!310457 () Bool)

(assert (=> b!200043 m!310457))

(declare-fun m!310459 () Bool)

(assert (=> b!200043 m!310459))

(declare-fun m!310461 () Bool)

(assert (=> b!200043 m!310461))

(declare-fun m!310463 () Bool)

(assert (=> b!200043 m!310463))

(declare-fun m!310465 () Bool)

(assert (=> b!200043 m!310465))

(declare-fun m!310467 () Bool)

(assert (=> b!200043 m!310467))

(declare-fun m!310469 () Bool)

(assert (=> b!200043 m!310469))

(declare-fun m!310471 () Bool)

(assert (=> b!200043 m!310471))

(declare-fun m!310473 () Bool)

(assert (=> b!200052 m!310473))

(assert (=> b!200056 m!310429))

(assert (=> b!200056 m!310431))

(declare-fun m!310475 () Bool)

(assert (=> b!200037 m!310475))

(declare-fun m!310477 () Bool)

(assert (=> b!200049 m!310477))

(declare-fun m!310479 () Bool)

(assert (=> b!200050 m!310479))

(declare-fun m!310481 () Bool)

(assert (=> b!200057 m!310481))

(declare-fun m!310483 () Bool)

(assert (=> b!200057 m!310483))

(declare-fun m!310485 () Bool)

(assert (=> b!200057 m!310485))

(declare-fun m!310487 () Bool)

(assert (=> b!200044 m!310487))

(declare-fun m!310489 () Bool)

(assert (=> b!200045 m!310489))

(assert (=> b!200039 m!310479))

(declare-fun m!310491 () Bool)

(assert (=> b!200051 m!310491))

(declare-fun m!310493 () Bool)

(assert (=> b!200051 m!310493))

(declare-fun m!310495 () Bool)

(assert (=> b!200051 m!310495))

(declare-fun m!310497 () Bool)

(assert (=> b!200051 m!310497))

(declare-fun m!310499 () Bool)

(assert (=> b!200054 m!310499))

(push 1)

(assert (not b!200044))

(assert (not b!200057))

(assert (not b!200037))

(assert (not b!200038))

(assert (not b!200039))

(assert (not b!200043))

(assert (not b!200055))

(assert (not b!200050))

(assert (not b!200047))

(assert (not b!200054))

(assert (not b!200036))

(assert (not b!200049))

(assert (not b!200056))

(assert (not start!42300))

(assert (not b!200051))

(assert (not b!200052))

(assert (not b!200042))

(assert (not b!200048))

(assert (not b!200045))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!68509 () Bool)

(assert (=> d!68509 (= (invariant!0 (currentBit!9310 (_2!9232 lt!312310)) (currentByte!9315 (_2!9232 lt!312310)) (size!4461 (buf!4959 (_2!9232 lt!312310)))) (and (bvsge (currentBit!9310 (_2!9232 lt!312310)) #b00000000000000000000000000000000) (bvslt (currentBit!9310 (_2!9232 lt!312310)) #b00000000000000000000000000001000) (bvsge (currentByte!9315 (_2!9232 lt!312310)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9315 (_2!9232 lt!312310)) (size!4461 (buf!4959 (_2!9232 lt!312310)))) (and (= (currentBit!9310 (_2!9232 lt!312310)) #b00000000000000000000000000000000) (= (currentByte!9315 (_2!9232 lt!312310)) (size!4461 (buf!4959 (_2!9232 lt!312310))))))))))

(assert (=> b!200042 d!68509))

(declare-fun d!68511 () Bool)

(declare-fun e!137273 () Bool)

(assert (=> d!68511 e!137273))

(declare-fun res!167490 () Bool)

(assert (=> d!68511 (=> (not res!167490) (not e!137273))))

(declare-fun lt!312324 () BitStream!8030)

(declare-fun lt!312325 () (_ BitVec 64))

(assert (=> d!68511 (= res!167490 (= (bvadd lt!312325 (bvsub lt!312295 lt!312301)) (bitIndex!0 (size!4461 (buf!4959 lt!312324)) (currentByte!9315 lt!312324) (currentBit!9310 lt!312324))))))

(assert (=> d!68511 (or (not (= (bvand lt!312325 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!312295 lt!312301) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!312325 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!312325 (bvsub lt!312295 lt!312301)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!68511 (= lt!312325 (bitIndex!0 (size!4461 (buf!4959 (_2!9234 lt!312302))) (currentByte!9315 (_2!9234 lt!312302)) (currentBit!9310 (_2!9234 lt!312302))))))

(declare-fun moveBitIndex!0 (BitStream!8030 (_ BitVec 64)) tuple2!17162)

(assert (=> d!68511 (= lt!312324 (_2!9232 (moveBitIndex!0 (_2!9234 lt!312302) (bvsub lt!312295 lt!312301))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!8030 (_ BitVec 64)) Bool)

(assert (=> d!68511 (moveBitIndexPrecond!0 (_2!9234 lt!312302) (bvsub lt!312295 lt!312301))))

(assert (=> d!68511 (= (withMovedBitIndex!0 (_2!9234 lt!312302) (bvsub lt!312295 lt!312301)) lt!312324)))

(declare-fun b!200060 () Bool)

(assert (=> b!200060 (= e!137273 (= (size!4461 (buf!4959 (_2!9234 lt!312302))) (size!4461 (buf!4959 lt!312324))))))

(assert (= (and d!68511 res!167490) b!200060))

(declare-fun m!310501 () Bool)

(assert (=> d!68511 m!310501))

(declare-fun m!310503 () Bool)

(assert (=> d!68511 m!310503))

(declare-fun m!310505 () Bool)

(assert (=> d!68511 m!310505))

(declare-fun m!310507 () Bool)

(assert (=> d!68511 m!310507))

(assert (=> b!200044 d!68511))

(declare-fun d!68513 () Bool)

(declare-fun e!137283 () Bool)

(assert (=> d!68513 e!137283))

(declare-fun res!167507 () Bool)

(assert (=> d!68513 (=> (not res!167507) (not e!137283))))

(declare-fun lt!312401 () tuple2!17166)

(assert (=> d!68513 (= res!167507 (isPrefixOf!0 (_1!9234 lt!312401) (_2!9234 lt!312401)))))

(declare-fun lt!312398 () BitStream!8030)

(assert (=> d!68513 (= lt!312401 (tuple2!17167 lt!312398 (_2!9232 lt!312310)))))

(declare-fun lt!312394 () Unit!14203)

(declare-fun lt!312405 () Unit!14203)

(assert (=> d!68513 (= lt!312394 lt!312405)))

(assert (=> d!68513 (isPrefixOf!0 lt!312398 (_2!9232 lt!312310))))

(assert (=> d!68513 (= lt!312405 (lemmaIsPrefixTransitive!0 lt!312398 (_2!9232 lt!312310) (_2!9232 lt!312310)))))

(declare-fun lt!312402 () Unit!14203)

(declare-fun lt!312392 () Unit!14203)

(assert (=> d!68513 (= lt!312402 lt!312392)))

(assert (=> d!68513 (isPrefixOf!0 lt!312398 (_2!9232 lt!312310))))

(assert (=> d!68513 (= lt!312392 (lemmaIsPrefixTransitive!0 lt!312398 thiss!1204 (_2!9232 lt!312310)))))

(declare-fun lt!312407 () Unit!14203)

(declare-fun e!137282 () Unit!14203)

(assert (=> d!68513 (= lt!312407 e!137282)))

(declare-fun c!9982 () Bool)

(assert (=> d!68513 (= c!9982 (not (= (size!4461 (buf!4959 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!312399 () Unit!14203)

(declare-fun lt!312390 () Unit!14203)

(assert (=> d!68513 (= lt!312399 lt!312390)))

(assert (=> d!68513 (isPrefixOf!0 (_2!9232 lt!312310) (_2!9232 lt!312310))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8030) Unit!14203)

(assert (=> d!68513 (= lt!312390 (lemmaIsPrefixRefl!0 (_2!9232 lt!312310)))))

(declare-fun lt!312391 () Unit!14203)

(declare-fun lt!312408 () Unit!14203)

(assert (=> d!68513 (= lt!312391 lt!312408)))

(assert (=> d!68513 (= lt!312408 (lemmaIsPrefixRefl!0 (_2!9232 lt!312310)))))

(declare-fun lt!312397 () Unit!14203)

(declare-fun lt!312395 () Unit!14203)

(assert (=> d!68513 (= lt!312397 lt!312395)))

(assert (=> d!68513 (isPrefixOf!0 lt!312398 lt!312398)))

(assert (=> d!68513 (= lt!312395 (lemmaIsPrefixRefl!0 lt!312398))))

(declare-fun lt!312403 () Unit!14203)

(declare-fun lt!312404 () Unit!14203)

(assert (=> d!68513 (= lt!312403 lt!312404)))

(assert (=> d!68513 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!68513 (= lt!312404 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!68513 (= lt!312398 (BitStream!8031 (buf!4959 (_2!9232 lt!312310)) (currentByte!9315 thiss!1204) (currentBit!9310 thiss!1204)))))

(assert (=> d!68513 (isPrefixOf!0 thiss!1204 (_2!9232 lt!312310))))

(assert (=> d!68513 (= (reader!0 thiss!1204 (_2!9232 lt!312310)) lt!312401)))

(declare-fun b!200079 () Bool)

(declare-fun Unit!14205 () Unit!14203)

(assert (=> b!200079 (= e!137282 Unit!14205)))

(declare-fun b!200080 () Bool)

(declare-fun res!167506 () Bool)

(assert (=> b!200080 (=> (not res!167506) (not e!137283))))

(assert (=> b!200080 (= res!167506 (isPrefixOf!0 (_2!9234 lt!312401) (_2!9232 lt!312310)))))

(declare-fun lt!312396 () (_ BitVec 64))

(declare-fun b!200081 () Bool)

(declare-fun lt!312400 () (_ BitVec 64))

(assert (=> b!200081 (= e!137283 (= (_1!9234 lt!312401) (withMovedBitIndex!0 (_2!9234 lt!312401) (bvsub lt!312400 lt!312396))))))

(assert (=> b!200081 (or (= (bvand lt!312400 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!312396 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!312400 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!312400 lt!312396) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!200081 (= lt!312396 (bitIndex!0 (size!4461 (buf!4959 (_2!9232 lt!312310))) (currentByte!9315 (_2!9232 lt!312310)) (currentBit!9310 (_2!9232 lt!312310))))))

(assert (=> b!200081 (= lt!312400 (bitIndex!0 (size!4461 (buf!4959 thiss!1204)) (currentByte!9315 thiss!1204) (currentBit!9310 thiss!1204)))))

(declare-fun b!200082 () Bool)

(declare-fun res!167505 () Bool)

(assert (=> b!200082 (=> (not res!167505) (not e!137283))))

(assert (=> b!200082 (= res!167505 (isPrefixOf!0 (_1!9234 lt!312401) thiss!1204))))

(declare-fun b!200083 () Bool)

(declare-fun lt!312409 () Unit!14203)

(assert (=> b!200083 (= e!137282 lt!312409)))

(declare-fun lt!312406 () (_ BitVec 64))

(assert (=> b!200083 (= lt!312406 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!312393 () (_ BitVec 64))

(assert (=> b!200083 (= lt!312393 (bitIndex!0 (size!4461 (buf!4959 thiss!1204)) (currentByte!9315 thiss!1204) (currentBit!9310 thiss!1204)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!10125 array!10125 (_ BitVec 64) (_ BitVec 64)) Unit!14203)

(assert (=> b!200083 (= lt!312409 (arrayBitRangesEqSymmetric!0 (buf!4959 thiss!1204) (buf!4959 (_2!9232 lt!312310)) lt!312406 lt!312393))))

(declare-fun arrayBitRangesEq!0 (array!10125 array!10125 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!200083 (arrayBitRangesEq!0 (buf!4959 (_2!9232 lt!312310)) (buf!4959 thiss!1204) lt!312406 lt!312393)))

(assert (= (and d!68513 c!9982) b!200083))

(assert (= (and d!68513 (not c!9982)) b!200079))

(assert (= (and d!68513 res!167507) b!200082))

(assert (= (and b!200082 res!167505) b!200080))

(assert (= (and b!200080 res!167506) b!200081))

(declare-fun m!310515 () Bool)

(assert (=> b!200081 m!310515))

(assert (=> b!200081 m!310491))

(assert (=> b!200081 m!310431))

(declare-fun m!310517 () Bool)

(assert (=> b!200080 m!310517))

(declare-fun m!310519 () Bool)

(assert (=> d!68513 m!310519))

(declare-fun m!310521 () Bool)

(assert (=> d!68513 m!310521))

(declare-fun m!310523 () Bool)

(assert (=> d!68513 m!310523))

(assert (=> d!68513 m!310493))

(declare-fun m!310525 () Bool)

(assert (=> d!68513 m!310525))

(declare-fun m!310527 () Bool)

(assert (=> d!68513 m!310527))

(declare-fun m!310529 () Bool)

(assert (=> d!68513 m!310529))

(declare-fun m!310531 () Bool)

(assert (=> d!68513 m!310531))

(declare-fun m!310533 () Bool)

(assert (=> d!68513 m!310533))

(declare-fun m!310535 () Bool)

(assert (=> d!68513 m!310535))

(declare-fun m!310537 () Bool)

(assert (=> d!68513 m!310537))

(assert (=> b!200083 m!310431))

(declare-fun m!310539 () Bool)

(assert (=> b!200083 m!310539))

(declare-fun m!310541 () Bool)

(assert (=> b!200083 m!310541))

(declare-fun m!310543 () Bool)

(assert (=> b!200082 m!310543))

(assert (=> b!200043 d!68513))

(declare-fun d!68527 () Bool)

(declare-datatypes ((tuple2!17168 0))(
  ( (tuple2!17169 (_1!9235 Bool) (_2!9235 BitStream!8030)) )
))
(declare-fun lt!312412 () tuple2!17168)

(declare-fun readBit!0 (BitStream!8030) tuple2!17168)

(assert (=> d!68527 (= lt!312412 (readBit!0 lt!312291))))

(assert (=> d!68527 (= (readBitPure!0 lt!312291) (tuple2!17161 (_2!9235 lt!312412) (_1!9235 lt!312412)))))

(declare-fun bs!16879 () Bool)

(assert (= bs!16879 d!68527))

(declare-fun m!310545 () Bool)

(assert (=> bs!16879 m!310545))

(assert (=> b!200043 d!68527))

(declare-fun d!68529 () Bool)

(assert (=> d!68529 (validate_offset_bits!1 ((_ sign_extend 32) (size!4461 (buf!4959 (_2!9232 lt!312310)))) ((_ sign_extend 32) (currentByte!9315 (_2!9232 lt!312312))) ((_ sign_extend 32) (currentBit!9310 (_2!9232 lt!312312))) lt!312318)))

(declare-fun lt!312415 () Unit!14203)

(declare-fun choose!9 (BitStream!8030 array!10125 (_ BitVec 64) BitStream!8030) Unit!14203)

(assert (=> d!68529 (= lt!312415 (choose!9 (_2!9232 lt!312312) (buf!4959 (_2!9232 lt!312310)) lt!312318 (BitStream!8031 (buf!4959 (_2!9232 lt!312310)) (currentByte!9315 (_2!9232 lt!312312)) (currentBit!9310 (_2!9232 lt!312312)))))))

(assert (=> d!68529 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9232 lt!312312) (buf!4959 (_2!9232 lt!312310)) lt!312318) lt!312415)))

(declare-fun bs!16880 () Bool)

(assert (= bs!16880 d!68529))

(assert (=> bs!16880 m!310455))

(declare-fun m!310547 () Bool)

(assert (=> bs!16880 m!310547))

(assert (=> b!200043 d!68529))

(declare-fun d!68531 () Bool)

(assert (=> d!68531 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!200043 d!68531))

(declare-datatypes ((tuple2!17170 0))(
  ( (tuple2!17171 (_1!9236 (_ BitVec 64)) (_2!9236 BitStream!8030)) )
))
(declare-fun lt!312436 () tuple2!17170)

(declare-fun d!68533 () Bool)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!8030 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17170)

(assert (=> d!68533 (= lt!312436 (readNBitsLSBFirstsLoop!0 (_1!9234 lt!312302) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!312306))))

(assert (=> d!68533 (= (readNBitsLSBFirstsLoopPure!0 (_1!9234 lt!312302) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!312306) (tuple2!17165 (_2!9236 lt!312436) (_1!9236 lt!312436)))))

(declare-fun bs!16883 () Bool)

(assert (= bs!16883 d!68533))

(declare-fun m!310553 () Bool)

(assert (=> bs!16883 m!310553))

(assert (=> b!200043 d!68533))

(declare-fun d!68537 () Bool)

(declare-fun lt!312437 () tuple2!17168)

(assert (=> d!68537 (= lt!312437 (readBit!0 (BitStream!8031 (buf!4959 (_2!9232 lt!312310)) (currentByte!9315 thiss!1204) (currentBit!9310 thiss!1204))))))

(assert (=> d!68537 (= (readBitPure!0 (BitStream!8031 (buf!4959 (_2!9232 lt!312310)) (currentByte!9315 thiss!1204) (currentBit!9310 thiss!1204))) (tuple2!17161 (_2!9235 lt!312437) (_1!9235 lt!312437)))))

(declare-fun bs!16884 () Bool)

(assert (= bs!16884 d!68537))

(declare-fun m!310555 () Bool)

(assert (=> bs!16884 m!310555))

(assert (=> b!200043 d!68537))

(declare-fun d!68539 () Bool)

(declare-fun e!137285 () Bool)

(assert (=> d!68539 e!137285))

(declare-fun res!167510 () Bool)

(assert (=> d!68539 (=> (not res!167510) (not e!137285))))

(declare-fun lt!312449 () tuple2!17166)

(assert (=> d!68539 (= res!167510 (isPrefixOf!0 (_1!9234 lt!312449) (_2!9234 lt!312449)))))

(declare-fun lt!312446 () BitStream!8030)

(assert (=> d!68539 (= lt!312449 (tuple2!17167 lt!312446 (_2!9232 lt!312310)))))

(declare-fun lt!312442 () Unit!14203)

(declare-fun lt!312453 () Unit!14203)

(assert (=> d!68539 (= lt!312442 lt!312453)))

(assert (=> d!68539 (isPrefixOf!0 lt!312446 (_2!9232 lt!312310))))

(assert (=> d!68539 (= lt!312453 (lemmaIsPrefixTransitive!0 lt!312446 (_2!9232 lt!312310) (_2!9232 lt!312310)))))

(declare-fun lt!312450 () Unit!14203)

(declare-fun lt!312440 () Unit!14203)

(assert (=> d!68539 (= lt!312450 lt!312440)))

(assert (=> d!68539 (isPrefixOf!0 lt!312446 (_2!9232 lt!312310))))

(assert (=> d!68539 (= lt!312440 (lemmaIsPrefixTransitive!0 lt!312446 (_2!9232 lt!312312) (_2!9232 lt!312310)))))

(declare-fun lt!312455 () Unit!14203)

(declare-fun e!137284 () Unit!14203)

(assert (=> d!68539 (= lt!312455 e!137284)))

(declare-fun c!9983 () Bool)

(assert (=> d!68539 (= c!9983 (not (= (size!4461 (buf!4959 (_2!9232 lt!312312))) #b00000000000000000000000000000000)))))

(declare-fun lt!312447 () Unit!14203)

(declare-fun lt!312438 () Unit!14203)

(assert (=> d!68539 (= lt!312447 lt!312438)))

(assert (=> d!68539 (isPrefixOf!0 (_2!9232 lt!312310) (_2!9232 lt!312310))))

(assert (=> d!68539 (= lt!312438 (lemmaIsPrefixRefl!0 (_2!9232 lt!312310)))))

(declare-fun lt!312439 () Unit!14203)

(declare-fun lt!312456 () Unit!14203)

(assert (=> d!68539 (= lt!312439 lt!312456)))

(assert (=> d!68539 (= lt!312456 (lemmaIsPrefixRefl!0 (_2!9232 lt!312310)))))

(declare-fun lt!312445 () Unit!14203)

(declare-fun lt!312443 () Unit!14203)

(assert (=> d!68539 (= lt!312445 lt!312443)))

(assert (=> d!68539 (isPrefixOf!0 lt!312446 lt!312446)))

(assert (=> d!68539 (= lt!312443 (lemmaIsPrefixRefl!0 lt!312446))))

(declare-fun lt!312451 () Unit!14203)

(declare-fun lt!312452 () Unit!14203)

(assert (=> d!68539 (= lt!312451 lt!312452)))

(assert (=> d!68539 (isPrefixOf!0 (_2!9232 lt!312312) (_2!9232 lt!312312))))

(assert (=> d!68539 (= lt!312452 (lemmaIsPrefixRefl!0 (_2!9232 lt!312312)))))

(assert (=> d!68539 (= lt!312446 (BitStream!8031 (buf!4959 (_2!9232 lt!312310)) (currentByte!9315 (_2!9232 lt!312312)) (currentBit!9310 (_2!9232 lt!312312))))))

(assert (=> d!68539 (isPrefixOf!0 (_2!9232 lt!312312) (_2!9232 lt!312310))))

(assert (=> d!68539 (= (reader!0 (_2!9232 lt!312312) (_2!9232 lt!312310)) lt!312449)))

(declare-fun b!200084 () Bool)

(declare-fun Unit!14206 () Unit!14203)

(assert (=> b!200084 (= e!137284 Unit!14206)))

(declare-fun b!200085 () Bool)

(declare-fun res!167509 () Bool)

(assert (=> b!200085 (=> (not res!167509) (not e!137285))))

(assert (=> b!200085 (= res!167509 (isPrefixOf!0 (_2!9234 lt!312449) (_2!9232 lt!312310)))))

(declare-fun lt!312444 () (_ BitVec 64))

(declare-fun b!200086 () Bool)

(declare-fun lt!312448 () (_ BitVec 64))

(assert (=> b!200086 (= e!137285 (= (_1!9234 lt!312449) (withMovedBitIndex!0 (_2!9234 lt!312449) (bvsub lt!312448 lt!312444))))))

(assert (=> b!200086 (or (= (bvand lt!312448 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!312444 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!312448 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!312448 lt!312444) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!200086 (= lt!312444 (bitIndex!0 (size!4461 (buf!4959 (_2!9232 lt!312310))) (currentByte!9315 (_2!9232 lt!312310)) (currentBit!9310 (_2!9232 lt!312310))))))

(assert (=> b!200086 (= lt!312448 (bitIndex!0 (size!4461 (buf!4959 (_2!9232 lt!312312))) (currentByte!9315 (_2!9232 lt!312312)) (currentBit!9310 (_2!9232 lt!312312))))))

(declare-fun b!200087 () Bool)

(declare-fun res!167508 () Bool)

(assert (=> b!200087 (=> (not res!167508) (not e!137285))))

(assert (=> b!200087 (= res!167508 (isPrefixOf!0 (_1!9234 lt!312449) (_2!9232 lt!312312)))))

(declare-fun b!200088 () Bool)

(declare-fun lt!312457 () Unit!14203)

(assert (=> b!200088 (= e!137284 lt!312457)))

(declare-fun lt!312454 () (_ BitVec 64))

(assert (=> b!200088 (= lt!312454 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!312441 () (_ BitVec 64))

(assert (=> b!200088 (= lt!312441 (bitIndex!0 (size!4461 (buf!4959 (_2!9232 lt!312312))) (currentByte!9315 (_2!9232 lt!312312)) (currentBit!9310 (_2!9232 lt!312312))))))

(assert (=> b!200088 (= lt!312457 (arrayBitRangesEqSymmetric!0 (buf!4959 (_2!9232 lt!312312)) (buf!4959 (_2!9232 lt!312310)) lt!312454 lt!312441))))

(assert (=> b!200088 (arrayBitRangesEq!0 (buf!4959 (_2!9232 lt!312310)) (buf!4959 (_2!9232 lt!312312)) lt!312454 lt!312441)))

(assert (= (and d!68539 c!9983) b!200088))

(assert (= (and d!68539 (not c!9983)) b!200084))

(assert (= (and d!68539 res!167510) b!200087))

(assert (= (and b!200087 res!167508) b!200085))

(assert (= (and b!200085 res!167509) b!200086))

(declare-fun m!310557 () Bool)

(assert (=> b!200086 m!310557))

(assert (=> b!200086 m!310491))

(assert (=> b!200086 m!310429))

(declare-fun m!310559 () Bool)

(assert (=> b!200085 m!310559))

(declare-fun m!310561 () Bool)

(assert (=> d!68539 m!310561))

(assert (=> d!68539 m!310521))

(declare-fun m!310563 () Bool)

(assert (=> d!68539 m!310563))

(assert (=> d!68539 m!310475))

(assert (=> d!68539 m!310525))

(declare-fun m!310565 () Bool)

(assert (=> d!68539 m!310565))

(declare-fun m!310567 () Bool)

(assert (=> d!68539 m!310567))

(declare-fun m!310569 () Bool)

(assert (=> d!68539 m!310569))

(declare-fun m!310571 () Bool)

(assert (=> d!68539 m!310571))

(declare-fun m!310573 () Bool)

(assert (=> d!68539 m!310573))

(declare-fun m!310575 () Bool)

(assert (=> d!68539 m!310575))

(assert (=> b!200088 m!310429))

(declare-fun m!310577 () Bool)

(assert (=> b!200088 m!310577))

(declare-fun m!310579 () Bool)

(assert (=> b!200088 m!310579))

(declare-fun m!310581 () Bool)

(assert (=> b!200087 m!310581))

(assert (=> b!200043 d!68539))

(declare-fun d!68541 () Bool)

(assert (=> d!68541 (validate_offset_bits!1 ((_ sign_extend 32) (size!4461 (buf!4959 (_2!9232 lt!312310)))) ((_ sign_extend 32) (currentByte!9315 thiss!1204)) ((_ sign_extend 32) (currentBit!9310 thiss!1204)) lt!312309)))

(declare-fun lt!312458 () Unit!14203)

(assert (=> d!68541 (= lt!312458 (choose!9 thiss!1204 (buf!4959 (_2!9232 lt!312310)) lt!312309 (BitStream!8031 (buf!4959 (_2!9232 lt!312310)) (currentByte!9315 thiss!1204) (currentBit!9310 thiss!1204))))))

(assert (=> d!68541 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4959 (_2!9232 lt!312310)) lt!312309) lt!312458)))

(declare-fun bs!16885 () Bool)

(assert (= bs!16885 d!68541))

(assert (=> bs!16885 m!310447))

(declare-fun m!310583 () Bool)

(assert (=> bs!16885 m!310583))

(assert (=> b!200043 d!68541))

(declare-fun d!68543 () Bool)

(declare-fun e!137292 () Bool)

(assert (=> d!68543 e!137292))

(declare-fun res!167520 () Bool)

(assert (=> d!68543 (=> (not res!167520) (not e!137292))))

(declare-fun lt!312485 () (_ BitVec 64))

(declare-fun lt!312487 () (_ BitVec 64))

(declare-fun lt!312482 () (_ BitVec 64))

(assert (=> d!68543 (= res!167520 (= lt!312485 (bvsub lt!312482 lt!312487)))))

(assert (=> d!68543 (or (= (bvand lt!312482 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!312487 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!312482 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!312482 lt!312487) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!68543 (= lt!312487 (remainingBits!0 ((_ sign_extend 32) (size!4461 (buf!4959 (_1!9231 lt!312313)))) ((_ sign_extend 32) (currentByte!9315 (_1!9231 lt!312313))) ((_ sign_extend 32) (currentBit!9310 (_1!9231 lt!312313)))))))

(declare-fun lt!312483 () (_ BitVec 64))

(declare-fun lt!312484 () (_ BitVec 64))

(assert (=> d!68543 (= lt!312482 (bvmul lt!312483 lt!312484))))

(assert (=> d!68543 (or (= lt!312483 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!312484 (bvsdiv (bvmul lt!312483 lt!312484) lt!312483)))))

(assert (=> d!68543 (= lt!312484 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!68543 (= lt!312483 ((_ sign_extend 32) (size!4461 (buf!4959 (_1!9231 lt!312313)))))))

(assert (=> d!68543 (= lt!312485 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9315 (_1!9231 lt!312313))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9310 (_1!9231 lt!312313)))))))

(assert (=> d!68543 (invariant!0 (currentBit!9310 (_1!9231 lt!312313)) (currentByte!9315 (_1!9231 lt!312313)) (size!4461 (buf!4959 (_1!9231 lt!312313))))))

(assert (=> d!68543 (= (bitIndex!0 (size!4461 (buf!4959 (_1!9231 lt!312313))) (currentByte!9315 (_1!9231 lt!312313)) (currentBit!9310 (_1!9231 lt!312313))) lt!312485)))

(declare-fun b!200097 () Bool)

(declare-fun res!167519 () Bool)

(assert (=> b!200097 (=> (not res!167519) (not e!137292))))

(assert (=> b!200097 (= res!167519 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!312485))))

(declare-fun b!200098 () Bool)

(declare-fun lt!312486 () (_ BitVec 64))

(assert (=> b!200098 (= e!137292 (bvsle lt!312485 (bvmul lt!312486 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!200098 (or (= lt!312486 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!312486 #b0000000000000000000000000000000000000000000000000000000000001000) lt!312486)))))

(assert (=> b!200098 (= lt!312486 ((_ sign_extend 32) (size!4461 (buf!4959 (_1!9231 lt!312313)))))))

(assert (= (and d!68543 res!167520) b!200097))

(assert (= (and b!200097 res!167519) b!200098))

(declare-fun m!310603 () Bool)

(assert (=> d!68543 m!310603))

(declare-fun m!310605 () Bool)

(assert (=> d!68543 m!310605))

(assert (=> b!200043 d!68543))

(declare-fun d!68551 () Bool)

(declare-fun e!137293 () Bool)

(assert (=> d!68551 e!137293))

(declare-fun res!167522 () Bool)

(assert (=> d!68551 (=> (not res!167522) (not e!137293))))

(declare-fun lt!312488 () (_ BitVec 64))

(declare-fun lt!312493 () (_ BitVec 64))

(declare-fun lt!312491 () (_ BitVec 64))

(assert (=> d!68551 (= res!167522 (= lt!312491 (bvsub lt!312488 lt!312493)))))

(assert (=> d!68551 (or (= (bvand lt!312488 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!312493 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!312488 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!312488 lt!312493) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!68551 (= lt!312493 (remainingBits!0 ((_ sign_extend 32) (size!4461 (buf!4959 (_1!9231 lt!312304)))) ((_ sign_extend 32) (currentByte!9315 (_1!9231 lt!312304))) ((_ sign_extend 32) (currentBit!9310 (_1!9231 lt!312304)))))))

(declare-fun lt!312489 () (_ BitVec 64))

(declare-fun lt!312490 () (_ BitVec 64))

(assert (=> d!68551 (= lt!312488 (bvmul lt!312489 lt!312490))))

(assert (=> d!68551 (or (= lt!312489 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!312490 (bvsdiv (bvmul lt!312489 lt!312490) lt!312489)))))

(assert (=> d!68551 (= lt!312490 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!68551 (= lt!312489 ((_ sign_extend 32) (size!4461 (buf!4959 (_1!9231 lt!312304)))))))

(assert (=> d!68551 (= lt!312491 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9315 (_1!9231 lt!312304))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9310 (_1!9231 lt!312304)))))))

(assert (=> d!68551 (invariant!0 (currentBit!9310 (_1!9231 lt!312304)) (currentByte!9315 (_1!9231 lt!312304)) (size!4461 (buf!4959 (_1!9231 lt!312304))))))

(assert (=> d!68551 (= (bitIndex!0 (size!4461 (buf!4959 (_1!9231 lt!312304))) (currentByte!9315 (_1!9231 lt!312304)) (currentBit!9310 (_1!9231 lt!312304))) lt!312491)))

(declare-fun b!200099 () Bool)

(declare-fun res!167521 () Bool)

(assert (=> b!200099 (=> (not res!167521) (not e!137293))))

(assert (=> b!200099 (= res!167521 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!312491))))

(declare-fun b!200100 () Bool)

(declare-fun lt!312492 () (_ BitVec 64))

(assert (=> b!200100 (= e!137293 (bvsle lt!312491 (bvmul lt!312492 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!200100 (or (= lt!312492 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!312492 #b0000000000000000000000000000000000000000000000000000000000001000) lt!312492)))))

(assert (=> b!200100 (= lt!312492 ((_ sign_extend 32) (size!4461 (buf!4959 (_1!9231 lt!312304)))))))

(assert (= (and d!68551 res!167522) b!200099))

(assert (= (and b!200099 res!167521) b!200100))

(declare-fun m!310607 () Bool)

(assert (=> d!68551 m!310607))

(declare-fun m!310609 () Bool)

(assert (=> d!68551 m!310609))

(assert (=> b!200043 d!68551))

(declare-fun d!68553 () Bool)

(declare-fun e!137306 () Bool)

(assert (=> d!68553 e!137306))

(declare-fun res!167540 () Bool)

(assert (=> d!68553 (=> (not res!167540) (not e!137306))))

(declare-fun lt!312514 () tuple2!17160)

(declare-fun lt!312515 () tuple2!17160)

(assert (=> d!68553 (= res!167540 (= (bitIndex!0 (size!4461 (buf!4959 (_1!9231 lt!312514))) (currentByte!9315 (_1!9231 lt!312514)) (currentBit!9310 (_1!9231 lt!312514))) (bitIndex!0 (size!4461 (buf!4959 (_1!9231 lt!312515))) (currentByte!9315 (_1!9231 lt!312515)) (currentBit!9310 (_1!9231 lt!312515)))))))

(declare-fun lt!312513 () Unit!14203)

(declare-fun lt!312516 () BitStream!8030)

(declare-fun choose!50 (BitStream!8030 BitStream!8030 BitStream!8030 tuple2!17160 tuple2!17160 BitStream!8030 Bool tuple2!17160 tuple2!17160 BitStream!8030 Bool) Unit!14203)

(assert (=> d!68553 (= lt!312513 (choose!50 lt!312291 (_2!9232 lt!312310) lt!312516 lt!312514 (tuple2!17161 (_1!9231 lt!312514) (_2!9231 lt!312514)) (_1!9231 lt!312514) (_2!9231 lt!312514) lt!312515 (tuple2!17161 (_1!9231 lt!312515) (_2!9231 lt!312515)) (_1!9231 lt!312515) (_2!9231 lt!312515)))))

(assert (=> d!68553 (= lt!312515 (readBitPure!0 lt!312516))))

(assert (=> d!68553 (= lt!312514 (readBitPure!0 lt!312291))))

(assert (=> d!68553 (= lt!312516 (BitStream!8031 (buf!4959 (_2!9232 lt!312310)) (currentByte!9315 lt!312291) (currentBit!9310 lt!312291)))))

(assert (=> d!68553 (invariant!0 (currentBit!9310 lt!312291) (currentByte!9315 lt!312291) (size!4461 (buf!4959 (_2!9232 lt!312310))))))

(assert (=> d!68553 (= (readBitPrefixLemma!0 lt!312291 (_2!9232 lt!312310)) lt!312513)))

(declare-fun b!200118 () Bool)

(assert (=> b!200118 (= e!137306 (= (_2!9231 lt!312514) (_2!9231 lt!312515)))))

(assert (= (and d!68553 res!167540) b!200118))

(declare-fun m!310629 () Bool)

(assert (=> d!68553 m!310629))

(declare-fun m!310631 () Bool)

(assert (=> d!68553 m!310631))

(declare-fun m!310633 () Bool)

(assert (=> d!68553 m!310633))

(declare-fun m!310635 () Bool)

(assert (=> d!68553 m!310635))

(assert (=> d!68553 m!310471))

(declare-fun m!310639 () Bool)

(assert (=> d!68553 m!310639))

(assert (=> b!200043 d!68553))

(declare-fun d!68575 () Bool)

(declare-fun lt!312521 () tuple2!17170)

(assert (=> d!68575 (= lt!312521 (readNBitsLSBFirstsLoop!0 (_1!9234 lt!312293) nBits!348 i!590 lt!312317))))

(assert (=> d!68575 (= (readNBitsLSBFirstsLoopPure!0 (_1!9234 lt!312293) nBits!348 i!590 lt!312317) (tuple2!17165 (_2!9236 lt!312521) (_1!9236 lt!312521)))))

(declare-fun bs!16891 () Bool)

(assert (= bs!16891 d!68575))

(declare-fun m!310641 () Bool)

(assert (=> bs!16891 m!310641))

(assert (=> b!200043 d!68575))

(declare-fun d!68577 () Bool)

(assert (=> d!68577 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4461 (buf!4959 (_2!9232 lt!312310)))) ((_ sign_extend 32) (currentByte!9315 thiss!1204)) ((_ sign_extend 32) (currentBit!9310 thiss!1204)) lt!312309) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4461 (buf!4959 (_2!9232 lt!312310)))) ((_ sign_extend 32) (currentByte!9315 thiss!1204)) ((_ sign_extend 32) (currentBit!9310 thiss!1204))) lt!312309))))

(declare-fun bs!16893 () Bool)

(assert (= bs!16893 d!68577))

(declare-fun m!310645 () Bool)

(assert (=> bs!16893 m!310645))

(assert (=> b!200043 d!68577))

(declare-fun d!68581 () Bool)

(declare-fun lt!312522 () tuple2!17168)

(assert (=> d!68581 (= lt!312522 (readBit!0 (_1!9234 lt!312293)))))

(assert (=> d!68581 (= (readBitPure!0 (_1!9234 lt!312293)) (tuple2!17161 (_2!9235 lt!312522) (_1!9235 lt!312522)))))

(declare-fun bs!16894 () Bool)

(assert (= bs!16894 d!68581))

(declare-fun m!310647 () Bool)

(assert (=> bs!16894 m!310647))

(assert (=> b!200043 d!68581))

(declare-fun d!68583 () Bool)

(assert (=> d!68583 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4461 (buf!4959 (_2!9232 lt!312310)))) ((_ sign_extend 32) (currentByte!9315 (_2!9232 lt!312312))) ((_ sign_extend 32) (currentBit!9310 (_2!9232 lt!312312))) lt!312318) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4461 (buf!4959 (_2!9232 lt!312310)))) ((_ sign_extend 32) (currentByte!9315 (_2!9232 lt!312312))) ((_ sign_extend 32) (currentBit!9310 (_2!9232 lt!312312)))) lt!312318))))

(declare-fun bs!16895 () Bool)

(assert (= bs!16895 d!68583))

(declare-fun m!310649 () Bool)

(assert (=> bs!16895 m!310649))

(assert (=> b!200043 d!68583))

(declare-fun d!68585 () Bool)

(assert (=> d!68585 (= (invariant!0 (currentBit!9310 thiss!1204) (currentByte!9315 thiss!1204) (size!4461 (buf!4959 (_2!9232 lt!312312)))) (and (bvsge (currentBit!9310 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9310 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9315 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9315 thiss!1204) (size!4461 (buf!4959 (_2!9232 lt!312312)))) (and (= (currentBit!9310 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9315 thiss!1204) (size!4461 (buf!4959 (_2!9232 lt!312312))))))))))

(assert (=> b!200043 d!68585))

(declare-fun d!68587 () Bool)

(assert (=> d!68587 (= (invariant!0 (currentBit!9310 thiss!1204) (currentByte!9315 thiss!1204) (size!4461 (buf!4959 thiss!1204))) (and (bvsge (currentBit!9310 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9310 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9315 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9315 thiss!1204) (size!4461 (buf!4959 thiss!1204))) (and (= (currentBit!9310 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9315 thiss!1204) (size!4461 (buf!4959 thiss!1204)))))))))

(assert (=> b!200054 d!68587))

(declare-fun d!68589 () Bool)

(declare-fun res!167549 () Bool)

(declare-fun e!137311 () Bool)

(assert (=> d!68589 (=> (not res!167549) (not e!137311))))

(assert (=> d!68589 (= res!167549 (= (size!4461 (buf!4959 thiss!1204)) (size!4461 (buf!4959 (_2!9232 lt!312312)))))))

(assert (=> d!68589 (= (isPrefixOf!0 thiss!1204 (_2!9232 lt!312312)) e!137311)))

(declare-fun b!200125 () Bool)

(declare-fun res!167547 () Bool)

(assert (=> b!200125 (=> (not res!167547) (not e!137311))))

(assert (=> b!200125 (= res!167547 (bvsle (bitIndex!0 (size!4461 (buf!4959 thiss!1204)) (currentByte!9315 thiss!1204) (currentBit!9310 thiss!1204)) (bitIndex!0 (size!4461 (buf!4959 (_2!9232 lt!312312))) (currentByte!9315 (_2!9232 lt!312312)) (currentBit!9310 (_2!9232 lt!312312)))))))

(declare-fun b!200126 () Bool)

(declare-fun e!137312 () Bool)

(assert (=> b!200126 (= e!137311 e!137312)))

(declare-fun res!167548 () Bool)

(assert (=> b!200126 (=> res!167548 e!137312)))

(assert (=> b!200126 (= res!167548 (= (size!4461 (buf!4959 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!200127 () Bool)

(assert (=> b!200127 (= e!137312 (arrayBitRangesEq!0 (buf!4959 thiss!1204) (buf!4959 (_2!9232 lt!312312)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4461 (buf!4959 thiss!1204)) (currentByte!9315 thiss!1204) (currentBit!9310 thiss!1204))))))

(assert (= (and d!68589 res!167549) b!200125))

(assert (= (and b!200125 res!167547) b!200126))

(assert (= (and b!200126 (not res!167548)) b!200127))

(assert (=> b!200125 m!310431))

(assert (=> b!200125 m!310429))

(assert (=> b!200127 m!310431))

(assert (=> b!200127 m!310431))

(declare-fun m!310651 () Bool)

(assert (=> b!200127 m!310651))

(assert (=> b!200039 d!68589))

(assert (=> b!200050 d!68589))

(declare-fun d!68591 () Bool)

(declare-fun e!137313 () Bool)

(assert (=> d!68591 e!137313))

(declare-fun res!167550 () Bool)

(assert (=> d!68591 (=> (not res!167550) (not e!137313))))

(declare-fun lt!312524 () (_ BitVec 64))

(declare-fun lt!312523 () BitStream!8030)

(assert (=> d!68591 (= res!167550 (= (bvadd lt!312524 (bvsub lt!312315 lt!312301)) (bitIndex!0 (size!4461 (buf!4959 lt!312523)) (currentByte!9315 lt!312523) (currentBit!9310 lt!312523))))))

(assert (=> d!68591 (or (not (= (bvand lt!312524 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!312315 lt!312301) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!312524 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!312524 (bvsub lt!312315 lt!312301)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!68591 (= lt!312524 (bitIndex!0 (size!4461 (buf!4959 (_2!9234 lt!312293))) (currentByte!9315 (_2!9234 lt!312293)) (currentBit!9310 (_2!9234 lt!312293))))))

(assert (=> d!68591 (= lt!312523 (_2!9232 (moveBitIndex!0 (_2!9234 lt!312293) (bvsub lt!312315 lt!312301))))))

(assert (=> d!68591 (moveBitIndexPrecond!0 (_2!9234 lt!312293) (bvsub lt!312315 lt!312301))))

(assert (=> d!68591 (= (withMovedBitIndex!0 (_2!9234 lt!312293) (bvsub lt!312315 lt!312301)) lt!312523)))

(declare-fun b!200128 () Bool)

(assert (=> b!200128 (= e!137313 (= (size!4461 (buf!4959 (_2!9234 lt!312293))) (size!4461 (buf!4959 lt!312523))))))

(assert (= (and d!68591 res!167550) b!200128))

(declare-fun m!310653 () Bool)

(assert (=> d!68591 m!310653))

(assert (=> d!68591 m!310421))

(declare-fun m!310655 () Bool)

(assert (=> d!68591 m!310655))

(declare-fun m!310657 () Bool)

(assert (=> d!68591 m!310657))

(assert (=> b!200052 d!68591))

(declare-fun d!68593 () Bool)

(declare-fun e!137314 () Bool)

(assert (=> d!68593 e!137314))

(declare-fun res!167552 () Bool)

(assert (=> d!68593 (=> (not res!167552) (not e!137314))))

(declare-fun lt!312530 () (_ BitVec 64))

(declare-fun lt!312525 () (_ BitVec 64))

(declare-fun lt!312528 () (_ BitVec 64))

(assert (=> d!68593 (= res!167552 (= lt!312528 (bvsub lt!312525 lt!312530)))))

(assert (=> d!68593 (or (= (bvand lt!312525 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!312530 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!312525 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!312525 lt!312530) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!68593 (= lt!312530 (remainingBits!0 ((_ sign_extend 32) (size!4461 (buf!4959 (_2!9232 lt!312310)))) ((_ sign_extend 32) (currentByte!9315 (_2!9232 lt!312310))) ((_ sign_extend 32) (currentBit!9310 (_2!9232 lt!312310)))))))

(declare-fun lt!312526 () (_ BitVec 64))

(declare-fun lt!312527 () (_ BitVec 64))

(assert (=> d!68593 (= lt!312525 (bvmul lt!312526 lt!312527))))

(assert (=> d!68593 (or (= lt!312526 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!312527 (bvsdiv (bvmul lt!312526 lt!312527) lt!312526)))))

(assert (=> d!68593 (= lt!312527 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!68593 (= lt!312526 ((_ sign_extend 32) (size!4461 (buf!4959 (_2!9232 lt!312310)))))))

(assert (=> d!68593 (= lt!312528 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9315 (_2!9232 lt!312310))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9310 (_2!9232 lt!312310)))))))

(assert (=> d!68593 (invariant!0 (currentBit!9310 (_2!9232 lt!312310)) (currentByte!9315 (_2!9232 lt!312310)) (size!4461 (buf!4959 (_2!9232 lt!312310))))))

(assert (=> d!68593 (= (bitIndex!0 (size!4461 (buf!4959 (_2!9232 lt!312310))) (currentByte!9315 (_2!9232 lt!312310)) (currentBit!9310 (_2!9232 lt!312310))) lt!312528)))

(declare-fun b!200129 () Bool)

(declare-fun res!167551 () Bool)

(assert (=> b!200129 (=> (not res!167551) (not e!137314))))

(assert (=> b!200129 (= res!167551 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!312528))))

(declare-fun b!200130 () Bool)

(declare-fun lt!312529 () (_ BitVec 64))

(assert (=> b!200130 (= e!137314 (bvsle lt!312528 (bvmul lt!312529 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!200130 (or (= lt!312529 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!312529 #b0000000000000000000000000000000000000000000000000000000000001000) lt!312529)))))

(assert (=> b!200130 (= lt!312529 ((_ sign_extend 32) (size!4461 (buf!4959 (_2!9232 lt!312310)))))))

(assert (= (and d!68593 res!167552) b!200129))

(assert (= (and b!200129 res!167551) b!200130))

(declare-fun m!310659 () Bool)

(assert (=> d!68593 m!310659))

(assert (=> d!68593 m!310427))

(assert (=> b!200051 d!68593))

(declare-fun d!68595 () Bool)

(declare-fun res!167555 () Bool)

(declare-fun e!137315 () Bool)

(assert (=> d!68595 (=> (not res!167555) (not e!137315))))

(assert (=> d!68595 (= res!167555 (= (size!4461 (buf!4959 thiss!1204)) (size!4461 (buf!4959 (_2!9232 lt!312310)))))))

(assert (=> d!68595 (= (isPrefixOf!0 thiss!1204 (_2!9232 lt!312310)) e!137315)))

(declare-fun b!200131 () Bool)

(declare-fun res!167553 () Bool)

(assert (=> b!200131 (=> (not res!167553) (not e!137315))))

(assert (=> b!200131 (= res!167553 (bvsle (bitIndex!0 (size!4461 (buf!4959 thiss!1204)) (currentByte!9315 thiss!1204) (currentBit!9310 thiss!1204)) (bitIndex!0 (size!4461 (buf!4959 (_2!9232 lt!312310))) (currentByte!9315 (_2!9232 lt!312310)) (currentBit!9310 (_2!9232 lt!312310)))))))

(declare-fun b!200132 () Bool)

(declare-fun e!137316 () Bool)

(assert (=> b!200132 (= e!137315 e!137316)))

(declare-fun res!167554 () Bool)

(assert (=> b!200132 (=> res!167554 e!137316)))

(assert (=> b!200132 (= res!167554 (= (size!4461 (buf!4959 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!200133 () Bool)

(assert (=> b!200133 (= e!137316 (arrayBitRangesEq!0 (buf!4959 thiss!1204) (buf!4959 (_2!9232 lt!312310)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4461 (buf!4959 thiss!1204)) (currentByte!9315 thiss!1204) (currentBit!9310 thiss!1204))))))

(assert (= (and d!68595 res!167555) b!200131))

(assert (= (and b!200131 res!167553) b!200132))

(assert (= (and b!200132 (not res!167554)) b!200133))

(assert (=> b!200131 m!310431))

(assert (=> b!200131 m!310491))

(assert (=> b!200133 m!310431))

(assert (=> b!200133 m!310431))

(declare-fun m!310661 () Bool)

(assert (=> b!200133 m!310661))

(assert (=> b!200051 d!68595))

(declare-fun d!68597 () Bool)

(assert (=> d!68597 (isPrefixOf!0 thiss!1204 (_2!9232 lt!312310))))

(declare-fun lt!312533 () Unit!14203)

(declare-fun choose!30 (BitStream!8030 BitStream!8030 BitStream!8030) Unit!14203)

(assert (=> d!68597 (= lt!312533 (choose!30 thiss!1204 (_2!9232 lt!312312) (_2!9232 lt!312310)))))

(assert (=> d!68597 (isPrefixOf!0 thiss!1204 (_2!9232 lt!312312))))

(assert (=> d!68597 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9232 lt!312312) (_2!9232 lt!312310)) lt!312533)))

(declare-fun bs!16896 () Bool)

(assert (= bs!16896 d!68597))

(assert (=> bs!16896 m!310493))

(declare-fun m!310663 () Bool)

(assert (=> bs!16896 m!310663))

(assert (=> bs!16896 m!310479))

(assert (=> b!200051 d!68597))

(declare-fun b!200275 () Bool)

(declare-fun e!137398 () Bool)

(declare-fun lt!313013 () tuple2!17164)

(declare-fun lt!312977 () tuple2!17166)

(assert (=> b!200275 (= e!137398 (= (_1!9233 lt!313013) (_2!9234 lt!312977)))))

(declare-fun b!200276 () Bool)

(declare-fun res!167681 () Bool)

(declare-fun e!137400 () Bool)

(assert (=> b!200276 (=> (not res!167681) (not e!137400))))

(declare-fun lt!312996 () tuple2!17162)

(assert (=> b!200276 (= res!167681 (= (size!4461 (buf!4959 (_2!9232 lt!312312))) (size!4461 (buf!4959 (_2!9232 lt!312996)))))))

(declare-fun b!200277 () Bool)

(declare-fun e!137402 () tuple2!17162)

(declare-fun Unit!14209 () Unit!14203)

(assert (=> b!200277 (= e!137402 (tuple2!17163 Unit!14209 (_2!9232 lt!312312)))))

(declare-fun lt!313012 () Unit!14203)

(assert (=> b!200277 (= lt!313012 (lemmaIsPrefixRefl!0 (_2!9232 lt!312312)))))

(declare-fun call!3170 () Bool)

(assert (=> b!200277 call!3170))

(declare-fun lt!313009 () Unit!14203)

(assert (=> b!200277 (= lt!313009 lt!313012)))

(declare-fun b!200278 () Bool)

(declare-fun e!137401 () Bool)

(declare-fun lt!313010 () tuple2!17164)

(declare-fun lt!313002 () tuple2!17166)

(assert (=> b!200278 (= e!137401 (= (_1!9233 lt!313010) (_2!9234 lt!313002)))))

(declare-fun b!200279 () Bool)

(assert (=> b!200279 (= e!137400 e!137401)))

(declare-fun res!167683 () Bool)

(assert (=> b!200279 (=> (not res!167683) (not e!137401))))

(assert (=> b!200279 (= res!167683 (= (_2!9233 lt!313010) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!200279 (= lt!313010 (readNBitsLSBFirstsLoopPure!0 (_1!9234 lt!313002) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!312986 () Unit!14203)

(declare-fun lt!312995 () Unit!14203)

(assert (=> b!200279 (= lt!312986 lt!312995)))

(declare-fun lt!313003 () (_ BitVec 64))

(assert (=> b!200279 (validate_offset_bits!1 ((_ sign_extend 32) (size!4461 (buf!4959 (_2!9232 lt!312996)))) ((_ sign_extend 32) (currentByte!9315 (_2!9232 lt!312312))) ((_ sign_extend 32) (currentBit!9310 (_2!9232 lt!312312))) lt!313003)))

(assert (=> b!200279 (= lt!312995 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9232 lt!312312) (buf!4959 (_2!9232 lt!312996)) lt!313003))))

(declare-fun e!137395 () Bool)

(assert (=> b!200279 e!137395))

(declare-fun res!167677 () Bool)

(assert (=> b!200279 (=> (not res!167677) (not e!137395))))

(assert (=> b!200279 (= res!167677 (and (= (size!4461 (buf!4959 (_2!9232 lt!312312))) (size!4461 (buf!4959 (_2!9232 lt!312996)))) (bvsge lt!313003 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!200279 (= lt!313003 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!200279 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!200279 (= lt!313002 (reader!0 (_2!9232 lt!312312) (_2!9232 lt!312996)))))

(declare-fun c!9996 () Bool)

(declare-fun bm!3167 () Bool)

(declare-fun lt!312980 () tuple2!17162)

(assert (=> bm!3167 (= call!3170 (isPrefixOf!0 (_2!9232 lt!312312) (ite c!9996 (_2!9232 lt!312312) (_2!9232 lt!312980))))))

(declare-fun b!200280 () Bool)

(declare-fun e!137396 () (_ BitVec 64))

(assert (=> b!200280 (= e!137396 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!200281 () Bool)

(declare-fun e!137403 () Bool)

(declare-fun lt!312976 () tuple2!17160)

(declare-fun lt!312989 () tuple2!17162)

(assert (=> b!200281 (= e!137403 (= (bitIndex!0 (size!4461 (buf!4959 (_1!9231 lt!312976))) (currentByte!9315 (_1!9231 lt!312976)) (currentBit!9310 (_1!9231 lt!312976))) (bitIndex!0 (size!4461 (buf!4959 (_2!9232 lt!312989))) (currentByte!9315 (_2!9232 lt!312989)) (currentBit!9310 (_2!9232 lt!312989)))))))

(declare-fun b!200282 () Bool)

(declare-fun e!137397 () Bool)

(declare-fun lt!313005 () tuple2!17160)

(declare-fun lt!313021 () tuple2!17160)

(assert (=> b!200282 (= e!137397 (= (_2!9231 lt!313005) (_2!9231 lt!313021)))))

(declare-fun d!68599 () Bool)

(assert (=> d!68599 e!137400))

(declare-fun res!167682 () Bool)

(assert (=> d!68599 (=> (not res!167682) (not e!137400))))

(assert (=> d!68599 (= res!167682 (invariant!0 (currentBit!9310 (_2!9232 lt!312996)) (currentByte!9315 (_2!9232 lt!312996)) (size!4461 (buf!4959 (_2!9232 lt!312996)))))))

(assert (=> d!68599 (= lt!312996 e!137402)))

(assert (=> d!68599 (= c!9996 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!68599 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!68599 (= (appendBitsLSBFirstLoopTR!0 (_2!9232 lt!312312) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!312996)))

(declare-fun b!200283 () Bool)

(declare-fun res!167680 () Bool)

(assert (=> b!200283 (= res!167680 (= (bitIndex!0 (size!4461 (buf!4959 (_2!9232 lt!312989))) (currentByte!9315 (_2!9232 lt!312989)) (currentBit!9310 (_2!9232 lt!312989))) (bvadd (bitIndex!0 (size!4461 (buf!4959 (_2!9232 lt!312312))) (currentByte!9315 (_2!9232 lt!312312)) (currentBit!9310 (_2!9232 lt!312312))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun e!137399 () Bool)

(assert (=> b!200283 (=> (not res!167680) (not e!137399))))

(declare-fun b!200284 () Bool)

(declare-fun res!167673 () Bool)

(assert (=> b!200284 (=> (not res!167673) (not e!137400))))

(declare-fun lt!312970 () (_ BitVec 64))

(declare-fun lt!313015 () (_ BitVec 64))

(assert (=> b!200284 (= res!167673 (= (bitIndex!0 (size!4461 (buf!4959 (_2!9232 lt!312996))) (currentByte!9315 (_2!9232 lt!312996)) (currentBit!9310 (_2!9232 lt!312996))) (bvsub lt!312970 lt!313015)))))

(assert (=> b!200284 (or (= (bvand lt!312970 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!313015 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!312970 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!312970 lt!313015) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!200284 (= lt!313015 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!312972 () (_ BitVec 64))

(declare-fun lt!312990 () (_ BitVec 64))

(assert (=> b!200284 (= lt!312970 (bvadd lt!312972 lt!312990))))

(assert (=> b!200284 (or (not (= (bvand lt!312972 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!312990 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!312972 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!312972 lt!312990) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!200284 (= lt!312990 ((_ sign_extend 32) nBits!348))))

(assert (=> b!200284 (= lt!312972 (bitIndex!0 (size!4461 (buf!4959 (_2!9232 lt!312312))) (currentByte!9315 (_2!9232 lt!312312)) (currentBit!9310 (_2!9232 lt!312312))))))

(declare-fun b!200285 () Bool)

(declare-fun res!167675 () Bool)

(assert (=> b!200285 (=> (not res!167675) (not e!137400))))

(assert (=> b!200285 (= res!167675 (isPrefixOf!0 (_2!9232 lt!312312) (_2!9232 lt!312996)))))

(declare-fun b!200286 () Bool)

(assert (=> b!200286 (= e!137396 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!200287 () Bool)

(declare-fun res!167678 () Bool)

(assert (=> b!200287 (= res!167678 (isPrefixOf!0 (_2!9232 lt!312312) (_2!9232 lt!312989)))))

(assert (=> b!200287 (=> (not res!167678) (not e!137399))))

(declare-fun b!200288 () Bool)

(assert (=> b!200288 (= lt!312976 (readBitPure!0 (readerFrom!0 (_2!9232 lt!312989) (currentBit!9310 (_2!9232 lt!312312)) (currentByte!9315 (_2!9232 lt!312312)))))))

(declare-fun res!167674 () Bool)

(declare-fun lt!313014 () Bool)

(assert (=> b!200288 (= res!167674 (and (= (_2!9231 lt!312976) lt!313014) (= (_1!9231 lt!312976) (_2!9232 lt!312989))))))

(assert (=> b!200288 (=> (not res!167674) (not e!137403))))

(assert (=> b!200288 (= e!137399 e!137403)))

(declare-fun b!200289 () Bool)

(assert (=> b!200289 (= e!137402 (tuple2!17163 (_1!9232 lt!312980) (_2!9232 lt!312980)))))

(assert (=> b!200289 (= lt!313014 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!200289 (= lt!312989 (appendBit!0 (_2!9232 lt!312312) lt!313014))))

(declare-fun res!167676 () Bool)

(assert (=> b!200289 (= res!167676 (= (size!4461 (buf!4959 (_2!9232 lt!312312))) (size!4461 (buf!4959 (_2!9232 lt!312989)))))))

(assert (=> b!200289 (=> (not res!167676) (not e!137399))))

(assert (=> b!200289 e!137399))

(declare-fun lt!312969 () tuple2!17162)

(assert (=> b!200289 (= lt!312969 lt!312989)))

(assert (=> b!200289 (= lt!312980 (appendBitsLSBFirstLoopTR!0 (_2!9232 lt!312969) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!312973 () Unit!14203)

(assert (=> b!200289 (= lt!312973 (lemmaIsPrefixTransitive!0 (_2!9232 lt!312312) (_2!9232 lt!312969) (_2!9232 lt!312980)))))

(assert (=> b!200289 call!3170))

(declare-fun lt!313019 () Unit!14203)

(assert (=> b!200289 (= lt!313019 lt!312973)))

(assert (=> b!200289 (invariant!0 (currentBit!9310 (_2!9232 lt!312312)) (currentByte!9315 (_2!9232 lt!312312)) (size!4461 (buf!4959 (_2!9232 lt!312969))))))

(declare-fun lt!312968 () BitStream!8030)

(assert (=> b!200289 (= lt!312968 (BitStream!8031 (buf!4959 (_2!9232 lt!312969)) (currentByte!9315 (_2!9232 lt!312312)) (currentBit!9310 (_2!9232 lt!312312))))))

(assert (=> b!200289 (invariant!0 (currentBit!9310 lt!312968) (currentByte!9315 lt!312968) (size!4461 (buf!4959 (_2!9232 lt!312980))))))

(declare-fun lt!312971 () BitStream!8030)

(assert (=> b!200289 (= lt!312971 (BitStream!8031 (buf!4959 (_2!9232 lt!312980)) (currentByte!9315 lt!312968) (currentBit!9310 lt!312968)))))

(assert (=> b!200289 (= lt!313005 (readBitPure!0 lt!312968))))

(assert (=> b!200289 (= lt!313021 (readBitPure!0 lt!312971))))

(declare-fun lt!312967 () Unit!14203)

(assert (=> b!200289 (= lt!312967 (readBitPrefixLemma!0 lt!312968 (_2!9232 lt!312980)))))

(declare-fun res!167684 () Bool)

(assert (=> b!200289 (= res!167684 (= (bitIndex!0 (size!4461 (buf!4959 (_1!9231 lt!313005))) (currentByte!9315 (_1!9231 lt!313005)) (currentBit!9310 (_1!9231 lt!313005))) (bitIndex!0 (size!4461 (buf!4959 (_1!9231 lt!313021))) (currentByte!9315 (_1!9231 lt!313021)) (currentBit!9310 (_1!9231 lt!313021)))))))

(assert (=> b!200289 (=> (not res!167684) (not e!137397))))

(assert (=> b!200289 e!137397))

(declare-fun lt!312984 () Unit!14203)

(assert (=> b!200289 (= lt!312984 lt!312967)))

(declare-fun lt!312981 () tuple2!17166)

(assert (=> b!200289 (= lt!312981 (reader!0 (_2!9232 lt!312312) (_2!9232 lt!312980)))))

(declare-fun lt!312991 () tuple2!17166)

(assert (=> b!200289 (= lt!312991 (reader!0 (_2!9232 lt!312969) (_2!9232 lt!312980)))))

(declare-fun lt!312974 () tuple2!17160)

(assert (=> b!200289 (= lt!312974 (readBitPure!0 (_1!9234 lt!312981)))))

(assert (=> b!200289 (= (_2!9231 lt!312974) lt!313014)))

(declare-fun lt!313006 () Unit!14203)

(declare-fun Unit!14221 () Unit!14203)

(assert (=> b!200289 (= lt!313006 Unit!14221)))

(declare-fun lt!313011 () (_ BitVec 64))

(assert (=> b!200289 (= lt!313011 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!312993 () (_ BitVec 64))

(assert (=> b!200289 (= lt!312993 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!312983 () Unit!14203)

(assert (=> b!200289 (= lt!312983 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9232 lt!312312) (buf!4959 (_2!9232 lt!312980)) lt!312993))))

(assert (=> b!200289 (validate_offset_bits!1 ((_ sign_extend 32) (size!4461 (buf!4959 (_2!9232 lt!312980)))) ((_ sign_extend 32) (currentByte!9315 (_2!9232 lt!312312))) ((_ sign_extend 32) (currentBit!9310 (_2!9232 lt!312312))) lt!312993)))

(declare-fun lt!313008 () Unit!14203)

(assert (=> b!200289 (= lt!313008 lt!312983)))

(declare-fun lt!313022 () tuple2!17164)

(assert (=> b!200289 (= lt!313022 (readNBitsLSBFirstsLoopPure!0 (_1!9234 lt!312981) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!313011))))

(declare-fun lt!313020 () (_ BitVec 64))

(assert (=> b!200289 (= lt!313020 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!312997 () Unit!14203)

(assert (=> b!200289 (= lt!312997 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9232 lt!312969) (buf!4959 (_2!9232 lt!312980)) lt!313020))))

(assert (=> b!200289 (validate_offset_bits!1 ((_ sign_extend 32) (size!4461 (buf!4959 (_2!9232 lt!312980)))) ((_ sign_extend 32) (currentByte!9315 (_2!9232 lt!312969))) ((_ sign_extend 32) (currentBit!9310 (_2!9232 lt!312969))) lt!313020)))

(declare-fun lt!313018 () Unit!14203)

(assert (=> b!200289 (= lt!313018 lt!312997)))

(declare-fun lt!312999 () tuple2!17164)

(assert (=> b!200289 (= lt!312999 (readNBitsLSBFirstsLoopPure!0 (_1!9234 lt!312991) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!313011 (ite (_2!9231 lt!312974) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!313017 () tuple2!17164)

(assert (=> b!200289 (= lt!313017 (readNBitsLSBFirstsLoopPure!0 (_1!9234 lt!312981) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!313011))))

(declare-fun c!9997 () Bool)

(assert (=> b!200289 (= c!9997 (_2!9231 (readBitPure!0 (_1!9234 lt!312981))))))

(declare-fun lt!312994 () tuple2!17164)

(assert (=> b!200289 (= lt!312994 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9234 lt!312981) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!313011 e!137396)))))

(declare-fun lt!312988 () Unit!14203)

(assert (=> b!200289 (= lt!312988 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9234 lt!312981) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!313011))))

(assert (=> b!200289 (and (= (_2!9233 lt!313017) (_2!9233 lt!312994)) (= (_1!9233 lt!313017) (_1!9233 lt!312994)))))

(declare-fun lt!312998 () Unit!14203)

(assert (=> b!200289 (= lt!312998 lt!312988)))

(assert (=> b!200289 (= (_1!9234 lt!312981) (withMovedBitIndex!0 (_2!9234 lt!312981) (bvsub (bitIndex!0 (size!4461 (buf!4959 (_2!9232 lt!312312))) (currentByte!9315 (_2!9232 lt!312312)) (currentBit!9310 (_2!9232 lt!312312))) (bitIndex!0 (size!4461 (buf!4959 (_2!9232 lt!312980))) (currentByte!9315 (_2!9232 lt!312980)) (currentBit!9310 (_2!9232 lt!312980))))))))

(declare-fun lt!313007 () Unit!14203)

(declare-fun Unit!14222 () Unit!14203)

(assert (=> b!200289 (= lt!313007 Unit!14222)))

(assert (=> b!200289 (= (_1!9234 lt!312991) (withMovedBitIndex!0 (_2!9234 lt!312991) (bvsub (bitIndex!0 (size!4461 (buf!4959 (_2!9232 lt!312969))) (currentByte!9315 (_2!9232 lt!312969)) (currentBit!9310 (_2!9232 lt!312969))) (bitIndex!0 (size!4461 (buf!4959 (_2!9232 lt!312980))) (currentByte!9315 (_2!9232 lt!312980)) (currentBit!9310 (_2!9232 lt!312980))))))))

(declare-fun lt!313000 () Unit!14203)

(declare-fun Unit!14223 () Unit!14203)

(assert (=> b!200289 (= lt!313000 Unit!14223)))

(assert (=> b!200289 (= (bitIndex!0 (size!4461 (buf!4959 (_2!9232 lt!312312))) (currentByte!9315 (_2!9232 lt!312312)) (currentBit!9310 (_2!9232 lt!312312))) (bvsub (bitIndex!0 (size!4461 (buf!4959 (_2!9232 lt!312969))) (currentByte!9315 (_2!9232 lt!312969)) (currentBit!9310 (_2!9232 lt!312969))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!313001 () Unit!14203)

(declare-fun Unit!14224 () Unit!14203)

(assert (=> b!200289 (= lt!313001 Unit!14224)))

(assert (=> b!200289 (= (_2!9233 lt!313022) (_2!9233 lt!312999))))

(declare-fun lt!313004 () Unit!14203)

(declare-fun Unit!14225 () Unit!14203)

(assert (=> b!200289 (= lt!313004 Unit!14225)))

(assert (=> b!200289 (invariant!0 (currentBit!9310 (_2!9232 lt!312980)) (currentByte!9315 (_2!9232 lt!312980)) (size!4461 (buf!4959 (_2!9232 lt!312980))))))

(declare-fun lt!312978 () Unit!14203)

(declare-fun Unit!14226 () Unit!14203)

(assert (=> b!200289 (= lt!312978 Unit!14226)))

(assert (=> b!200289 (= (size!4461 (buf!4959 (_2!9232 lt!312312))) (size!4461 (buf!4959 (_2!9232 lt!312980))))))

(declare-fun lt!312992 () Unit!14203)

(declare-fun Unit!14227 () Unit!14203)

(assert (=> b!200289 (= lt!312992 Unit!14227)))

(assert (=> b!200289 (= (bitIndex!0 (size!4461 (buf!4959 (_2!9232 lt!312980))) (currentByte!9315 (_2!9232 lt!312980)) (currentBit!9310 (_2!9232 lt!312980))) (bvsub (bvadd (bitIndex!0 (size!4461 (buf!4959 (_2!9232 lt!312312))) (currentByte!9315 (_2!9232 lt!312312)) (currentBit!9310 (_2!9232 lt!312312))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!313016 () Unit!14203)

(declare-fun Unit!14228 () Unit!14203)

(assert (=> b!200289 (= lt!313016 Unit!14228)))

(declare-fun lt!312987 () Unit!14203)

(declare-fun Unit!14229 () Unit!14203)

(assert (=> b!200289 (= lt!312987 Unit!14229)))

(assert (=> b!200289 (= lt!312977 (reader!0 (_2!9232 lt!312312) (_2!9232 lt!312980)))))

(declare-fun lt!312982 () (_ BitVec 64))

(assert (=> b!200289 (= lt!312982 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!312975 () Unit!14203)

(assert (=> b!200289 (= lt!312975 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9232 lt!312312) (buf!4959 (_2!9232 lt!312980)) lt!312982))))

(assert (=> b!200289 (validate_offset_bits!1 ((_ sign_extend 32) (size!4461 (buf!4959 (_2!9232 lt!312980)))) ((_ sign_extend 32) (currentByte!9315 (_2!9232 lt!312312))) ((_ sign_extend 32) (currentBit!9310 (_2!9232 lt!312312))) lt!312982)))

(declare-fun lt!312979 () Unit!14203)

(assert (=> b!200289 (= lt!312979 lt!312975)))

(assert (=> b!200289 (= lt!313013 (readNBitsLSBFirstsLoopPure!0 (_1!9234 lt!312977) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!167679 () Bool)

(assert (=> b!200289 (= res!167679 (= (_2!9233 lt!313013) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!200289 (=> (not res!167679) (not e!137398))))

(assert (=> b!200289 e!137398))

(declare-fun lt!312985 () Unit!14203)

(declare-fun Unit!14230 () Unit!14203)

(assert (=> b!200289 (= lt!312985 Unit!14230)))

(declare-fun b!200290 () Bool)

(assert (=> b!200290 (= e!137395 (validate_offset_bits!1 ((_ sign_extend 32) (size!4461 (buf!4959 (_2!9232 lt!312312)))) ((_ sign_extend 32) (currentByte!9315 (_2!9232 lt!312312))) ((_ sign_extend 32) (currentBit!9310 (_2!9232 lt!312312))) lt!313003))))

(assert (= (and d!68599 c!9996) b!200277))

(assert (= (and d!68599 (not c!9996)) b!200289))

(assert (= (and b!200289 res!167676) b!200283))

(assert (= (and b!200283 res!167680) b!200287))

(assert (= (and b!200287 res!167678) b!200288))

(assert (= (and b!200288 res!167674) b!200281))

(assert (= (and b!200289 res!167684) b!200282))

(assert (= (and b!200289 c!9997) b!200286))

(assert (= (and b!200289 (not c!9997)) b!200280))

(assert (= (and b!200289 res!167679) b!200275))

(assert (= (or b!200277 b!200289) bm!3167))

(assert (= (and d!68599 res!167682) b!200276))

(assert (= (and b!200276 res!167681) b!200284))

(assert (= (and b!200284 res!167673) b!200285))

(assert (= (and b!200285 res!167675) b!200279))

(assert (= (and b!200279 res!167677) b!200290))

(assert (= (and b!200279 res!167683) b!200278))

(declare-fun m!310915 () Bool)

(assert (=> b!200283 m!310915))

(assert (=> b!200283 m!310429))

(declare-fun m!310917 () Bool)

(assert (=> b!200285 m!310917))

(assert (=> b!200277 m!310563))

(declare-fun m!310919 () Bool)

(assert (=> b!200281 m!310919))

(assert (=> b!200281 m!310915))

(declare-fun m!310921 () Bool)

(assert (=> b!200279 m!310921))

(declare-fun m!310923 () Bool)

(assert (=> b!200279 m!310923))

(declare-fun m!310925 () Bool)

(assert (=> b!200279 m!310925))

(declare-fun m!310927 () Bool)

(assert (=> b!200279 m!310927))

(declare-fun m!310929 () Bool)

(assert (=> b!200279 m!310929))

(declare-fun m!310931 () Bool)

(assert (=> b!200279 m!310931))

(declare-fun m!310933 () Bool)

(assert (=> b!200288 m!310933))

(assert (=> b!200288 m!310933))

(declare-fun m!310935 () Bool)

(assert (=> b!200288 m!310935))

(declare-fun m!310937 () Bool)

(assert (=> b!200287 m!310937))

(declare-fun m!310939 () Bool)

(assert (=> b!200284 m!310939))

(assert (=> b!200284 m!310429))

(declare-fun m!310941 () Bool)

(assert (=> bm!3167 m!310941))

(declare-fun m!310943 () Bool)

(assert (=> d!68599 m!310943))

(declare-fun m!310945 () Bool)

(assert (=> b!200290 m!310945))

(declare-fun m!310947 () Bool)

(assert (=> b!200289 m!310947))

(declare-fun m!310949 () Bool)

(assert (=> b!200289 m!310949))

(declare-fun m!310951 () Bool)

(assert (=> b!200289 m!310951))

(declare-fun m!310953 () Bool)

(assert (=> b!200289 m!310953))

(declare-fun m!310955 () Bool)

(assert (=> b!200289 m!310955))

(declare-fun m!310957 () Bool)

(assert (=> b!200289 m!310957))

(declare-fun m!310959 () Bool)

(assert (=> b!200289 m!310959))

(declare-fun m!310961 () Bool)

(assert (=> b!200289 m!310961))

(declare-fun m!310963 () Bool)

(assert (=> b!200289 m!310963))

(declare-fun m!310965 () Bool)

(assert (=> b!200289 m!310965))

(declare-fun m!310967 () Bool)

(assert (=> b!200289 m!310967))

(declare-fun m!310969 () Bool)

(assert (=> b!200289 m!310969))

(declare-fun m!310971 () Bool)

(assert (=> b!200289 m!310971))

(declare-fun m!310973 () Bool)

(assert (=> b!200289 m!310973))

(declare-fun m!310975 () Bool)

(assert (=> b!200289 m!310975))

(declare-fun m!310977 () Bool)

(assert (=> b!200289 m!310977))

(declare-fun m!310979 () Bool)

(assert (=> b!200289 m!310979))

(declare-fun m!310981 () Bool)

(assert (=> b!200289 m!310981))

(declare-fun m!310983 () Bool)

(assert (=> b!200289 m!310983))

(assert (=> b!200289 m!310429))

(assert (=> b!200289 m!310921))

(declare-fun m!310985 () Bool)

(assert (=> b!200289 m!310985))

(declare-fun m!310987 () Bool)

(assert (=> b!200289 m!310987))

(declare-fun m!310989 () Bool)

(assert (=> b!200289 m!310989))

(declare-fun m!310991 () Bool)

(assert (=> b!200289 m!310991))

(declare-fun m!310993 () Bool)

(assert (=> b!200289 m!310993))

(assert (=> b!200289 m!310965))

(declare-fun m!310995 () Bool)

(assert (=> b!200289 m!310995))

(declare-fun m!310997 () Bool)

(assert (=> b!200289 m!310997))

(declare-fun m!310999 () Bool)

(assert (=> b!200289 m!310999))

(assert (=> b!200289 m!310931))

(declare-fun m!311001 () Bool)

(assert (=> b!200289 m!311001))

(declare-fun m!311003 () Bool)

(assert (=> b!200289 m!311003))

(declare-fun m!311005 () Bool)

(assert (=> b!200289 m!311005))

(assert (=> b!200051 d!68599))

(declare-fun d!68705 () Bool)

(declare-fun res!167687 () Bool)

(declare-fun e!137404 () Bool)

(assert (=> d!68705 (=> (not res!167687) (not e!137404))))

(assert (=> d!68705 (= res!167687 (= (size!4461 (buf!4959 (_2!9232 lt!312312))) (size!4461 (buf!4959 (_2!9232 lt!312310)))))))

(assert (=> d!68705 (= (isPrefixOf!0 (_2!9232 lt!312312) (_2!9232 lt!312310)) e!137404)))

(declare-fun b!200291 () Bool)

(declare-fun res!167685 () Bool)

(assert (=> b!200291 (=> (not res!167685) (not e!137404))))

(assert (=> b!200291 (= res!167685 (bvsle (bitIndex!0 (size!4461 (buf!4959 (_2!9232 lt!312312))) (currentByte!9315 (_2!9232 lt!312312)) (currentBit!9310 (_2!9232 lt!312312))) (bitIndex!0 (size!4461 (buf!4959 (_2!9232 lt!312310))) (currentByte!9315 (_2!9232 lt!312310)) (currentBit!9310 (_2!9232 lt!312310)))))))

(declare-fun b!200292 () Bool)

(declare-fun e!137405 () Bool)

(assert (=> b!200292 (= e!137404 e!137405)))

(declare-fun res!167686 () Bool)

(assert (=> b!200292 (=> res!167686 e!137405)))

(assert (=> b!200292 (= res!167686 (= (size!4461 (buf!4959 (_2!9232 lt!312312))) #b00000000000000000000000000000000))))

(declare-fun b!200293 () Bool)

(assert (=> b!200293 (= e!137405 (arrayBitRangesEq!0 (buf!4959 (_2!9232 lt!312312)) (buf!4959 (_2!9232 lt!312310)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4461 (buf!4959 (_2!9232 lt!312312))) (currentByte!9315 (_2!9232 lt!312312)) (currentBit!9310 (_2!9232 lt!312312)))))))

(assert (= (and d!68705 res!167687) b!200291))

(assert (= (and b!200291 res!167685) b!200292))

(assert (= (and b!200292 (not res!167686)) b!200293))

(assert (=> b!200291 m!310429))

(assert (=> b!200291 m!310491))

(assert (=> b!200293 m!310429))

(assert (=> b!200293 m!310429))

(declare-fun m!311007 () Bool)

(assert (=> b!200293 m!311007))

(assert (=> b!200037 d!68705))

(declare-fun d!68707 () Bool)

(assert (=> d!68707 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4461 (buf!4959 thiss!1204))) ((_ sign_extend 32) (currentByte!9315 thiss!1204)) ((_ sign_extend 32) (currentBit!9310 thiss!1204)) lt!312309) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4461 (buf!4959 thiss!1204))) ((_ sign_extend 32) (currentByte!9315 thiss!1204)) ((_ sign_extend 32) (currentBit!9310 thiss!1204))) lt!312309))))

(declare-fun bs!16919 () Bool)

(assert (= bs!16919 d!68707))

(declare-fun m!311009 () Bool)

(assert (=> bs!16919 m!311009))

(assert (=> b!200048 d!68707))

(declare-fun d!68709 () Bool)

(declare-fun lt!313023 () tuple2!17168)

(assert (=> d!68709 (= lt!313023 (readBit!0 (readerFrom!0 (_2!9232 lt!312312) (currentBit!9310 thiss!1204) (currentByte!9315 thiss!1204))))))

(assert (=> d!68709 (= (readBitPure!0 (readerFrom!0 (_2!9232 lt!312312) (currentBit!9310 thiss!1204) (currentByte!9315 thiss!1204))) (tuple2!17161 (_2!9235 lt!313023) (_1!9235 lt!313023)))))

(declare-fun bs!16920 () Bool)

(assert (= bs!16920 d!68709))

(assert (=> bs!16920 m!310423))

(declare-fun m!311011 () Bool)

(assert (=> bs!16920 m!311011))

(assert (=> b!200047 d!68709))

(declare-fun d!68711 () Bool)

(declare-fun e!137410 () Bool)

(assert (=> d!68711 e!137410))

(declare-fun res!167691 () Bool)

(assert (=> d!68711 (=> (not res!167691) (not e!137410))))

(assert (=> d!68711 (= res!167691 (invariant!0 (currentBit!9310 (_2!9232 lt!312312)) (currentByte!9315 (_2!9232 lt!312312)) (size!4461 (buf!4959 (_2!9232 lt!312312)))))))

(assert (=> d!68711 (= (readerFrom!0 (_2!9232 lt!312312) (currentBit!9310 thiss!1204) (currentByte!9315 thiss!1204)) (BitStream!8031 (buf!4959 (_2!9232 lt!312312)) (currentByte!9315 thiss!1204) (currentBit!9310 thiss!1204)))))

(declare-fun b!200300 () Bool)

(assert (=> b!200300 (= e!137410 (invariant!0 (currentBit!9310 thiss!1204) (currentByte!9315 thiss!1204) (size!4461 (buf!4959 (_2!9232 lt!312312)))))))

(assert (= (and d!68711 res!167691) b!200300))

(declare-fun m!311013 () Bool)

(assert (=> d!68711 m!311013))

(assert (=> b!200300 m!310465))

(assert (=> b!200047 d!68711))

(declare-fun d!68713 () Bool)

(assert (=> d!68713 (= (array_inv!4202 (buf!4959 thiss!1204)) (bvsge (size!4461 (buf!4959 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!200049 d!68713))

(declare-fun d!68715 () Bool)

(declare-fun e!137411 () Bool)

(assert (=> d!68715 e!137411))

(declare-fun res!167693 () Bool)

(assert (=> d!68715 (=> (not res!167693) (not e!137411))))

(declare-fun lt!313041 () (_ BitVec 64))

(declare-fun lt!313039 () (_ BitVec 64))

(declare-fun lt!313036 () (_ BitVec 64))

(assert (=> d!68715 (= res!167693 (= lt!313039 (bvsub lt!313036 lt!313041)))))

(assert (=> d!68715 (or (= (bvand lt!313036 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!313041 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!313036 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!313036 lt!313041) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!68715 (= lt!313041 (remainingBits!0 ((_ sign_extend 32) (size!4461 (buf!4959 (_1!9233 lt!312319)))) ((_ sign_extend 32) (currentByte!9315 (_1!9233 lt!312319))) ((_ sign_extend 32) (currentBit!9310 (_1!9233 lt!312319)))))))

(declare-fun lt!313037 () (_ BitVec 64))

(declare-fun lt!313038 () (_ BitVec 64))

(assert (=> d!68715 (= lt!313036 (bvmul lt!313037 lt!313038))))

(assert (=> d!68715 (or (= lt!313037 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!313038 (bvsdiv (bvmul lt!313037 lt!313038) lt!313037)))))

(assert (=> d!68715 (= lt!313038 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!68715 (= lt!313037 ((_ sign_extend 32) (size!4461 (buf!4959 (_1!9233 lt!312319)))))))

(assert (=> d!68715 (= lt!313039 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9315 (_1!9233 lt!312319))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9310 (_1!9233 lt!312319)))))))

(assert (=> d!68715 (invariant!0 (currentBit!9310 (_1!9233 lt!312319)) (currentByte!9315 (_1!9233 lt!312319)) (size!4461 (buf!4959 (_1!9233 lt!312319))))))

(assert (=> d!68715 (= (bitIndex!0 (size!4461 (buf!4959 (_1!9233 lt!312319))) (currentByte!9315 (_1!9233 lt!312319)) (currentBit!9310 (_1!9233 lt!312319))) lt!313039)))

(declare-fun b!200301 () Bool)

(declare-fun res!167692 () Bool)

(assert (=> b!200301 (=> (not res!167692) (not e!137411))))

(assert (=> b!200301 (= res!167692 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!313039))))

(declare-fun b!200302 () Bool)

(declare-fun lt!313040 () (_ BitVec 64))

(assert (=> b!200302 (= e!137411 (bvsle lt!313039 (bvmul lt!313040 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!200302 (or (= lt!313040 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!313040 #b0000000000000000000000000000000000000000000000000000000000001000) lt!313040)))))

(assert (=> b!200302 (= lt!313040 ((_ sign_extend 32) (size!4461 (buf!4959 (_1!9233 lt!312319)))))))

(assert (= (and d!68715 res!167693) b!200301))

(assert (= (and b!200301 res!167692) b!200302))

(declare-fun m!311015 () Bool)

(assert (=> d!68715 m!311015))

(declare-fun m!311017 () Bool)

(assert (=> d!68715 m!311017))

(assert (=> b!200038 d!68715))

(declare-fun d!68717 () Bool)

(declare-fun e!137416 () Bool)

(assert (=> d!68717 e!137416))

(declare-fun res!167703 () Bool)

(assert (=> d!68717 (=> (not res!167703) (not e!137416))))

(declare-fun lt!313044 () (_ BitVec 64))

(declare-fun lt!313049 () (_ BitVec 64))

(declare-fun lt!313047 () (_ BitVec 64))

(assert (=> d!68717 (= res!167703 (= lt!313047 (bvsub lt!313044 lt!313049)))))

(assert (=> d!68717 (or (= (bvand lt!313044 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!313049 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!313044 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!313044 lt!313049) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!68717 (= lt!313049 (remainingBits!0 ((_ sign_extend 32) (size!4461 (buf!4959 (_2!9234 lt!312293)))) ((_ sign_extend 32) (currentByte!9315 (_2!9234 lt!312293))) ((_ sign_extend 32) (currentBit!9310 (_2!9234 lt!312293)))))))

(declare-fun lt!313045 () (_ BitVec 64))

(declare-fun lt!313046 () (_ BitVec 64))

(assert (=> d!68717 (= lt!313044 (bvmul lt!313045 lt!313046))))

(assert (=> d!68717 (or (= lt!313045 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!313046 (bvsdiv (bvmul lt!313045 lt!313046) lt!313045)))))

(assert (=> d!68717 (= lt!313046 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!68717 (= lt!313045 ((_ sign_extend 32) (size!4461 (buf!4959 (_2!9234 lt!312293)))))))

(assert (=> d!68717 (= lt!313047 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9315 (_2!9234 lt!312293))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9310 (_2!9234 lt!312293)))))))

(assert (=> d!68717 (invariant!0 (currentBit!9310 (_2!9234 lt!312293)) (currentByte!9315 (_2!9234 lt!312293)) (size!4461 (buf!4959 (_2!9234 lt!312293))))))

(assert (=> d!68717 (= (bitIndex!0 (size!4461 (buf!4959 (_2!9234 lt!312293))) (currentByte!9315 (_2!9234 lt!312293)) (currentBit!9310 (_2!9234 lt!312293))) lt!313047)))

(declare-fun b!200311 () Bool)

(declare-fun res!167702 () Bool)

(assert (=> b!200311 (=> (not res!167702) (not e!137416))))

(assert (=> b!200311 (= res!167702 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!313047))))

(declare-fun b!200312 () Bool)

(declare-fun lt!313048 () (_ BitVec 64))

(assert (=> b!200312 (= e!137416 (bvsle lt!313047 (bvmul lt!313048 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!200312 (or (= lt!313048 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!313048 #b0000000000000000000000000000000000000000000000000000000000001000) lt!313048)))))

(assert (=> b!200312 (= lt!313048 ((_ sign_extend 32) (size!4461 (buf!4959 (_2!9234 lt!312293)))))))

(assert (= (and d!68717 res!167703) b!200311))

(assert (= (and b!200311 res!167702) b!200312))

(declare-fun m!311019 () Bool)

(assert (=> d!68717 m!311019))

(declare-fun m!311021 () Bool)

(assert (=> d!68717 m!311021))

(assert (=> b!200038 d!68717))

(declare-fun d!68719 () Bool)

(assert (=> d!68719 (= (invariant!0 (currentBit!9310 thiss!1204) (currentByte!9315 thiss!1204) (size!4461 (buf!4959 (_2!9232 lt!312310)))) (and (bvsge (currentBit!9310 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9310 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9315 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9315 thiss!1204) (size!4461 (buf!4959 (_2!9232 lt!312310)))) (and (= (currentBit!9310 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9315 thiss!1204) (size!4461 (buf!4959 (_2!9232 lt!312310))))))))))

(assert (=> b!200045 d!68719))

(declare-fun d!68721 () Bool)

(declare-fun e!137417 () Bool)

(assert (=> d!68721 e!137417))

(declare-fun res!167705 () Bool)

(assert (=> d!68721 (=> (not res!167705) (not e!137417))))

(declare-fun lt!313057 () (_ BitVec 64))

(declare-fun lt!313055 () (_ BitVec 64))

(declare-fun lt!313052 () (_ BitVec 64))

(assert (=> d!68721 (= res!167705 (= lt!313055 (bvsub lt!313052 lt!313057)))))

(assert (=> d!68721 (or (= (bvand lt!313052 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!313057 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!313052 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!313052 lt!313057) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!68721 (= lt!313057 (remainingBits!0 ((_ sign_extend 32) (size!4461 (buf!4959 (_2!9232 lt!312312)))) ((_ sign_extend 32) (currentByte!9315 (_2!9232 lt!312312))) ((_ sign_extend 32) (currentBit!9310 (_2!9232 lt!312312)))))))

(declare-fun lt!313053 () (_ BitVec 64))

(declare-fun lt!313054 () (_ BitVec 64))

(assert (=> d!68721 (= lt!313052 (bvmul lt!313053 lt!313054))))

(assert (=> d!68721 (or (= lt!313053 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!313054 (bvsdiv (bvmul lt!313053 lt!313054) lt!313053)))))

(assert (=> d!68721 (= lt!313054 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!68721 (= lt!313053 ((_ sign_extend 32) (size!4461 (buf!4959 (_2!9232 lt!312312)))))))

(assert (=> d!68721 (= lt!313055 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9315 (_2!9232 lt!312312))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9310 (_2!9232 lt!312312)))))))

(assert (=> d!68721 (invariant!0 (currentBit!9310 (_2!9232 lt!312312)) (currentByte!9315 (_2!9232 lt!312312)) (size!4461 (buf!4959 (_2!9232 lt!312312))))))

(assert (=> d!68721 (= (bitIndex!0 (size!4461 (buf!4959 (_2!9232 lt!312312))) (currentByte!9315 (_2!9232 lt!312312)) (currentBit!9310 (_2!9232 lt!312312))) lt!313055)))

(declare-fun b!200313 () Bool)

(declare-fun res!167704 () Bool)

(assert (=> b!200313 (=> (not res!167704) (not e!137417))))

(assert (=> b!200313 (= res!167704 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!313055))))

(declare-fun b!200314 () Bool)

(declare-fun lt!313056 () (_ BitVec 64))

(assert (=> b!200314 (= e!137417 (bvsle lt!313055 (bvmul lt!313056 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!200314 (or (= lt!313056 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!313056 #b0000000000000000000000000000000000000000000000000000000000001000) lt!313056)))))

(assert (=> b!200314 (= lt!313056 ((_ sign_extend 32) (size!4461 (buf!4959 (_2!9232 lt!312312)))))))

(assert (= (and d!68721 res!167705) b!200313))

(assert (= (and b!200313 res!167704) b!200314))

(declare-fun m!311023 () Bool)

(assert (=> d!68721 m!311023))

(assert (=> d!68721 m!311013))

(assert (=> b!200056 d!68721))

(declare-fun d!68723 () Bool)

(declare-fun e!137418 () Bool)

(assert (=> d!68723 e!137418))

(declare-fun res!167707 () Bool)

(assert (=> d!68723 (=> (not res!167707) (not e!137418))))

(declare-fun lt!313061 () (_ BitVec 64))

(declare-fun lt!313058 () (_ BitVec 64))

(declare-fun lt!313063 () (_ BitVec 64))

(assert (=> d!68723 (= res!167707 (= lt!313061 (bvsub lt!313058 lt!313063)))))

(assert (=> d!68723 (or (= (bvand lt!313058 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!313063 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!313058 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!313058 lt!313063) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!68723 (= lt!313063 (remainingBits!0 ((_ sign_extend 32) (size!4461 (buf!4959 thiss!1204))) ((_ sign_extend 32) (currentByte!9315 thiss!1204)) ((_ sign_extend 32) (currentBit!9310 thiss!1204))))))

(declare-fun lt!313059 () (_ BitVec 64))

(declare-fun lt!313060 () (_ BitVec 64))

(assert (=> d!68723 (= lt!313058 (bvmul lt!313059 lt!313060))))

(assert (=> d!68723 (or (= lt!313059 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!313060 (bvsdiv (bvmul lt!313059 lt!313060) lt!313059)))))

(assert (=> d!68723 (= lt!313060 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!68723 (= lt!313059 ((_ sign_extend 32) (size!4461 (buf!4959 thiss!1204))))))

(assert (=> d!68723 (= lt!313061 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9315 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9310 thiss!1204))))))

(assert (=> d!68723 (invariant!0 (currentBit!9310 thiss!1204) (currentByte!9315 thiss!1204) (size!4461 (buf!4959 thiss!1204)))))

(assert (=> d!68723 (= (bitIndex!0 (size!4461 (buf!4959 thiss!1204)) (currentByte!9315 thiss!1204) (currentBit!9310 thiss!1204)) lt!313061)))

(declare-fun b!200315 () Bool)

(declare-fun res!167706 () Bool)

(assert (=> b!200315 (=> (not res!167706) (not e!137418))))

(assert (=> b!200315 (= res!167706 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!313061))))

(declare-fun b!200316 () Bool)

(declare-fun lt!313062 () (_ BitVec 64))

(assert (=> b!200316 (= e!137418 (bvsle lt!313061 (bvmul lt!313062 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!200316 (or (= lt!313062 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!313062 #b0000000000000000000000000000000000000000000000000000000000001000) lt!313062)))))

(assert (=> b!200316 (= lt!313062 ((_ sign_extend 32) (size!4461 (buf!4959 thiss!1204))))))

(assert (= (and d!68723 res!167707) b!200315))

(assert (= (and b!200315 res!167706) b!200316))

(assert (=> d!68723 m!311009))

(assert (=> d!68723 m!310499))

(assert (=> b!200056 d!68723))

(assert (=> b!200055 d!68721))

(assert (=> b!200055 d!68723))

(declare-fun b!200347 () Bool)

(declare-fun res!167733 () Bool)

(declare-fun e!137436 () Bool)

(assert (=> b!200347 (=> (not res!167733) (not e!137436))))

(declare-fun lt!313169 () tuple2!17162)

(assert (=> b!200347 (= res!167733 (isPrefixOf!0 thiss!1204 (_2!9232 lt!313169)))))

(declare-fun b!200348 () Bool)

(declare-fun e!137435 () Bool)

(assert (=> b!200348 (= e!137436 e!137435)))

(declare-fun res!167734 () Bool)

(assert (=> b!200348 (=> (not res!167734) (not e!137435))))

(declare-fun lt!313168 () tuple2!17160)

(assert (=> b!200348 (= res!167734 (and (= (_2!9231 lt!313168) lt!312305) (= (_1!9231 lt!313168) (_2!9232 lt!313169))))))

(assert (=> b!200348 (= lt!313168 (readBitPure!0 (readerFrom!0 (_2!9232 lt!313169) (currentBit!9310 thiss!1204) (currentByte!9315 thiss!1204))))))

(declare-fun d!68725 () Bool)

(assert (=> d!68725 e!137436))

(declare-fun res!167732 () Bool)

(assert (=> d!68725 (=> (not res!167732) (not e!137436))))

(assert (=> d!68725 (= res!167732 (= (size!4461 (buf!4959 thiss!1204)) (size!4461 (buf!4959 (_2!9232 lt!313169)))))))

(declare-fun choose!16 (BitStream!8030 Bool) tuple2!17162)

(assert (=> d!68725 (= lt!313169 (choose!16 thiss!1204 lt!312305))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!68725 (validate_offset_bit!0 ((_ sign_extend 32) (size!4461 (buf!4959 thiss!1204))) ((_ sign_extend 32) (currentByte!9315 thiss!1204)) ((_ sign_extend 32) (currentBit!9310 thiss!1204)))))

(assert (=> d!68725 (= (appendBit!0 thiss!1204 lt!312305) lt!313169)))

(declare-fun b!200346 () Bool)

(declare-fun res!167735 () Bool)

(assert (=> b!200346 (=> (not res!167735) (not e!137436))))

(declare-fun lt!313171 () (_ BitVec 64))

(declare-fun lt!313170 () (_ BitVec 64))

(assert (=> b!200346 (= res!167735 (= (bitIndex!0 (size!4461 (buf!4959 (_2!9232 lt!313169))) (currentByte!9315 (_2!9232 lt!313169)) (currentBit!9310 (_2!9232 lt!313169))) (bvadd lt!313171 lt!313170)))))

(assert (=> b!200346 (or (not (= (bvand lt!313171 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!313170 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!313171 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!313171 lt!313170) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!200346 (= lt!313170 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!200346 (= lt!313171 (bitIndex!0 (size!4461 (buf!4959 thiss!1204)) (currentByte!9315 thiss!1204) (currentBit!9310 thiss!1204)))))

(declare-fun b!200349 () Bool)

(assert (=> b!200349 (= e!137435 (= (bitIndex!0 (size!4461 (buf!4959 (_1!9231 lt!313168))) (currentByte!9315 (_1!9231 lt!313168)) (currentBit!9310 (_1!9231 lt!313168))) (bitIndex!0 (size!4461 (buf!4959 (_2!9232 lt!313169))) (currentByte!9315 (_2!9232 lt!313169)) (currentBit!9310 (_2!9232 lt!313169)))))))

(assert (= (and d!68725 res!167732) b!200346))

(assert (= (and b!200346 res!167735) b!200347))

(assert (= (and b!200347 res!167733) b!200348))

(assert (= (and b!200348 res!167734) b!200349))

(declare-fun m!311025 () Bool)

(assert (=> b!200347 m!311025))

(declare-fun m!311027 () Bool)

(assert (=> b!200349 m!311027))

(declare-fun m!311029 () Bool)

(assert (=> b!200349 m!311029))

(declare-fun m!311031 () Bool)

(assert (=> b!200348 m!311031))

(assert (=> b!200348 m!311031))

(declare-fun m!311033 () Bool)

(assert (=> b!200348 m!311033))

(assert (=> b!200346 m!311029))

(assert (=> b!200346 m!310431))

(declare-fun m!311035 () Bool)

(assert (=> d!68725 m!311035))

(declare-fun m!311037 () Bool)

(assert (=> d!68725 m!311037))

(assert (=> b!200055 d!68725))

(declare-fun d!68727 () Bool)

(assert (=> d!68727 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9310 thiss!1204) (currentByte!9315 thiss!1204) (size!4461 (buf!4959 thiss!1204))))))

(declare-fun bs!16921 () Bool)

(assert (= bs!16921 d!68727))

(assert (=> bs!16921 m!310499))

(assert (=> start!42300 d!68727))

(declare-fun d!68729 () Bool)

(declare-fun lt!313241 () tuple2!17164)

(declare-fun lt!313243 () tuple2!17164)

(assert (=> d!68729 (and (= (_2!9233 lt!313241) (_2!9233 lt!313243)) (= (_1!9233 lt!313241) (_1!9233 lt!313243)))))

(declare-fun lt!313245 () Bool)

(declare-fun lt!313242 () (_ BitVec 64))

(declare-fun lt!313240 () Unit!14203)

(declare-fun lt!313244 () BitStream!8030)

(declare-fun choose!56 (BitStream!8030 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!17164 tuple2!17164 BitStream!8030 (_ BitVec 64) Bool BitStream!8030 (_ BitVec 64) tuple2!17164 tuple2!17164 BitStream!8030 (_ BitVec 64)) Unit!14203)

(assert (=> d!68729 (= lt!313240 (choose!56 (_1!9234 lt!312293) nBits!348 i!590 lt!312317 lt!313241 (tuple2!17165 (_1!9233 lt!313241) (_2!9233 lt!313241)) (_1!9233 lt!313241) (_2!9233 lt!313241) lt!313245 lt!313244 lt!313242 lt!313243 (tuple2!17165 (_1!9233 lt!313243) (_2!9233 lt!313243)) (_1!9233 lt!313243) (_2!9233 lt!313243)))))

(assert (=> d!68729 (= lt!313243 (readNBitsLSBFirstsLoopPure!0 lt!313244 nBits!348 (bvadd i!590 #b00000000000000000000000000000001) lt!313242))))

(assert (=> d!68729 (= lt!313242 (bvor lt!312317 (ite lt!313245 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!68729 (= lt!313244 (withMovedBitIndex!0 (_1!9234 lt!312293) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!68729 (= lt!313245 (_2!9231 (readBitPure!0 (_1!9234 lt!312293))))))

(assert (=> d!68729 (= lt!313241 (readNBitsLSBFirstsLoopPure!0 (_1!9234 lt!312293) nBits!348 i!590 lt!312317))))

(assert (=> d!68729 (= (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9234 lt!312293) nBits!348 i!590 lt!312317) lt!313240)))

(declare-fun bs!16923 () Bool)

(assert (= bs!16923 d!68729))

(assert (=> bs!16923 m!310485))

(assert (=> bs!16923 m!310451))

(declare-fun m!311041 () Bool)

(assert (=> bs!16923 m!311041))

(declare-fun m!311045 () Bool)

(assert (=> bs!16923 m!311045))

(assert (=> bs!16923 m!310445))

(assert (=> b!200057 d!68729))

(declare-fun d!68731 () Bool)

(declare-fun lt!313246 () tuple2!17170)

(assert (=> d!68731 (= lt!313246 (readNBitsLSBFirstsLoop!0 lt!312292 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!312306))))

(assert (=> d!68731 (= (readNBitsLSBFirstsLoopPure!0 lt!312292 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!312306) (tuple2!17165 (_2!9236 lt!313246) (_1!9236 lt!313246)))))

(declare-fun bs!16924 () Bool)

(assert (= bs!16924 d!68731))

(declare-fun m!311059 () Bool)

(assert (=> bs!16924 m!311059))

(assert (=> b!200057 d!68731))

(declare-fun d!68733 () Bool)

(declare-fun e!137446 () Bool)

(assert (=> d!68733 e!137446))

(declare-fun res!167748 () Bool)

(assert (=> d!68733 (=> (not res!167748) (not e!137446))))

(declare-fun lt!313248 () (_ BitVec 64))

(declare-fun lt!313247 () BitStream!8030)

(assert (=> d!68733 (= res!167748 (= (bvadd lt!313248 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4461 (buf!4959 lt!313247)) (currentByte!9315 lt!313247) (currentBit!9310 lt!313247))))))

(assert (=> d!68733 (or (not (= (bvand lt!313248 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!313248 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!313248 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!68733 (= lt!313248 (bitIndex!0 (size!4461 (buf!4959 (_1!9234 lt!312293))) (currentByte!9315 (_1!9234 lt!312293)) (currentBit!9310 (_1!9234 lt!312293))))))

(assert (=> d!68733 (= lt!313247 (_2!9232 (moveBitIndex!0 (_1!9234 lt!312293) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!68733 (moveBitIndexPrecond!0 (_1!9234 lt!312293) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!68733 (= (withMovedBitIndex!0 (_1!9234 lt!312293) #b0000000000000000000000000000000000000000000000000000000000000001) lt!313247)))

(declare-fun b!200366 () Bool)

(assert (=> b!200366 (= e!137446 (= (size!4461 (buf!4959 (_1!9234 lt!312293))) (size!4461 (buf!4959 lt!313247))))))

(assert (= (and d!68733 res!167748) b!200366))

(declare-fun m!311087 () Bool)

(assert (=> d!68733 m!311087))

(declare-fun m!311091 () Bool)

(assert (=> d!68733 m!311091))

(declare-fun m!311093 () Bool)

(assert (=> d!68733 m!311093))

(declare-fun m!311097 () Bool)

(assert (=> d!68733 m!311097))

(assert (=> b!200057 d!68733))

(declare-fun d!68735 () Bool)

(declare-fun e!137447 () Bool)

(assert (=> d!68735 e!137447))

(declare-fun res!167750 () Bool)

(assert (=> d!68735 (=> (not res!167750) (not e!137447))))

(declare-fun lt!313254 () (_ BitVec 64))

(declare-fun lt!313249 () (_ BitVec 64))

(declare-fun lt!313252 () (_ BitVec 64))

(assert (=> d!68735 (= res!167750 (= lt!313252 (bvsub lt!313249 lt!313254)))))

(assert (=> d!68735 (or (= (bvand lt!313249 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!313254 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!313249 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!313249 lt!313254) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!68735 (= lt!313254 (remainingBits!0 ((_ sign_extend 32) (size!4461 (buf!4959 (_1!9231 lt!312311)))) ((_ sign_extend 32) (currentByte!9315 (_1!9231 lt!312311))) ((_ sign_extend 32) (currentBit!9310 (_1!9231 lt!312311)))))))

(declare-fun lt!313250 () (_ BitVec 64))

(declare-fun lt!313251 () (_ BitVec 64))

(assert (=> d!68735 (= lt!313249 (bvmul lt!313250 lt!313251))))

(assert (=> d!68735 (or (= lt!313250 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!313251 (bvsdiv (bvmul lt!313250 lt!313251) lt!313250)))))

(assert (=> d!68735 (= lt!313251 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!68735 (= lt!313250 ((_ sign_extend 32) (size!4461 (buf!4959 (_1!9231 lt!312311)))))))

(assert (=> d!68735 (= lt!313252 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9315 (_1!9231 lt!312311))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9310 (_1!9231 lt!312311)))))))

(assert (=> d!68735 (invariant!0 (currentBit!9310 (_1!9231 lt!312311)) (currentByte!9315 (_1!9231 lt!312311)) (size!4461 (buf!4959 (_1!9231 lt!312311))))))

(assert (=> d!68735 (= (bitIndex!0 (size!4461 (buf!4959 (_1!9231 lt!312311))) (currentByte!9315 (_1!9231 lt!312311)) (currentBit!9310 (_1!9231 lt!312311))) lt!313252)))

(declare-fun b!200367 () Bool)

(declare-fun res!167749 () Bool)

(assert (=> b!200367 (=> (not res!167749) (not e!137447))))

(assert (=> b!200367 (= res!167749 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!313252))))

(declare-fun b!200368 () Bool)

(declare-fun lt!313253 () (_ BitVec 64))

(assert (=> b!200368 (= e!137447 (bvsle lt!313252 (bvmul lt!313253 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!200368 (or (= lt!313253 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!313253 #b0000000000000000000000000000000000000000000000000000000000001000) lt!313253)))))

(assert (=> b!200368 (= lt!313253 ((_ sign_extend 32) (size!4461 (buf!4959 (_1!9231 lt!312311)))))))

(assert (= (and d!68735 res!167750) b!200367))

(assert (= (and b!200367 res!167749) b!200368))

(declare-fun m!311111 () Bool)

(assert (=> d!68735 m!311111))

(declare-fun m!311113 () Bool)

(assert (=> d!68735 m!311113))

(assert (=> b!200036 d!68735))

(push 1)

(assert (not b!200081))

(assert (not b!200277))

(assert (not d!68583))

(assert (not d!68511))

(assert (not d!68725))

(assert (not d!68599))

(assert (not b!200349))

(assert (not d!68591))

(assert (not d!68529))

(assert (not b!200285))

(assert (not b!200087))

(assert (not d!68707))

(assert (not d!68731))

(assert (not d!68553))

(assert (not b!200281))

(assert (not b!200346))

(assert (not d!68551))

(assert (not b!200300))

(assert (not d!68527))

(assert (not b!200287))

(assert (not d!68723))

(assert (not b!200082))

(assert (not b!200080))

(assert (not d!68727))

(assert (not b!200085))

(assert (not d!68735))

(assert (not d!68575))

(assert (not b!200284))

(assert (not b!200290))

(assert (not d!68539))

(assert (not d!68597))

(assert (not d!68711))

(assert (not b!200348))

(assert (not b!200083))

(assert (not d!68593))

(assert (not d!68537))

(assert (not d!68715))

(assert (not b!200127))

(assert (not d!68541))

(assert (not b!200125))

(assert (not d!68729))

(assert (not b!200283))

(assert (not b!200293))

(assert (not b!200086))

(assert (not d!68581))

(assert (not d!68721))

(assert (not b!200088))

(assert (not b!200289))

(assert (not b!200288))

(assert (not d!68733))

(assert (not bm!3167))

(assert (not b!200347))

(assert (not b!200133))

(assert (not d!68513))

(assert (not d!68543))

(assert (not b!200291))

(assert (not b!200131))

(assert (not d!68533))

(assert (not d!68709))

(assert (not d!68577))

(assert (not b!200279))

(assert (not d!68717))

(check-sat)

(pop 1)

(push 1)

(check-sat)

