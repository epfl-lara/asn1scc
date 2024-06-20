; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39728 () Bool)

(assert start!39728)

(declare-fun b!179958 () Bool)

(declare-fun res!149384 () Bool)

(declare-fun e!125105 () Bool)

(assert (=> b!179958 (=> (not res!149384) (not e!125105))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-datatypes ((array!9662 0))(
  ( (array!9663 (arr!5191 (Array (_ BitVec 32) (_ BitVec 8))) (size!4261 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7630 0))(
  ( (BitStream!7631 (buf!4704 array!9662) (currentByte!8914 (_ BitVec 32)) (currentBit!8909 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7630)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!179958 (= res!149384 (validate_offset_bits!1 ((_ sign_extend 32) (size!4261 (buf!4704 thiss!1204))) ((_ sign_extend 32) (currentByte!8914 thiss!1204)) ((_ sign_extend 32) (currentBit!8909 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!179959 () Bool)

(declare-fun e!125103 () Bool)

(declare-fun e!125102 () Bool)

(assert (=> b!179959 (= e!125103 e!125102)))

(declare-fun res!149385 () Bool)

(assert (=> b!179959 (=> res!149385 e!125102)))

(declare-fun lt!276089 () (_ BitVec 64))

(declare-fun lt!276086 () (_ BitVec 64))

(assert (=> b!179959 (= res!149385 (not (= lt!276086 (bvsub (bvsub (bvadd lt!276089 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-datatypes ((Unit!12941 0))(
  ( (Unit!12942) )
))
(declare-datatypes ((tuple2!15512 0))(
  ( (tuple2!15513 (_1!8401 Unit!12941) (_2!8401 BitStream!7630)) )
))
(declare-fun lt!276083 () tuple2!15512)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!179959 (= lt!276086 (bitIndex!0 (size!4261 (buf!4704 (_2!8401 lt!276083))) (currentByte!8914 (_2!8401 lt!276083)) (currentBit!8909 (_2!8401 lt!276083))))))

(declare-fun isPrefixOf!0 (BitStream!7630 BitStream!7630) Bool)

(assert (=> b!179959 (isPrefixOf!0 thiss!1204 (_2!8401 lt!276083))))

(declare-fun lt!276084 () tuple2!15512)

(declare-fun lt!276093 () Unit!12941)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7630 BitStream!7630 BitStream!7630) Unit!12941)

(assert (=> b!179959 (= lt!276093 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8401 lt!276084) (_2!8401 lt!276083)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7630 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15512)

(assert (=> b!179959 (= lt!276083 (appendBitsLSBFirstLoopTR!0 (_2!8401 lt!276084) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!179960 () Bool)

(declare-fun e!125110 () Bool)

(declare-fun e!125101 () Bool)

(assert (=> b!179960 (= e!125110 e!125101)))

(declare-fun res!149377 () Bool)

(assert (=> b!179960 (=> (not res!149377) (not e!125101))))

(declare-datatypes ((tuple2!15514 0))(
  ( (tuple2!15515 (_1!8402 BitStream!7630) (_2!8402 Bool)) )
))
(declare-fun lt!276095 () tuple2!15514)

(declare-fun lt!276082 () Bool)

(assert (=> b!179960 (= res!149377 (and (= (_2!8402 lt!276095) lt!276082) (= (_1!8402 lt!276095) (_2!8401 lt!276084))))))

(declare-fun readBitPure!0 (BitStream!7630) tuple2!15514)

(declare-fun readerFrom!0 (BitStream!7630 (_ BitVec 32) (_ BitVec 32)) BitStream!7630)

(assert (=> b!179960 (= lt!276095 (readBitPure!0 (readerFrom!0 (_2!8401 lt!276084) (currentBit!8909 thiss!1204) (currentByte!8914 thiss!1204))))))

(declare-fun b!179961 () Bool)

(declare-fun e!125107 () Bool)

(declare-fun array_inv!4002 (array!9662) Bool)

(assert (=> b!179961 (= e!125107 (array_inv!4002 (buf!4704 thiss!1204)))))

(declare-fun b!179962 () Bool)

(declare-fun lt!276087 () (_ BitVec 64))

(assert (=> b!179962 (= e!125101 (= (bitIndex!0 (size!4261 (buf!4704 (_1!8402 lt!276095))) (currentByte!8914 (_1!8402 lt!276095)) (currentBit!8909 (_1!8402 lt!276095))) lt!276087))))

(declare-fun b!179963 () Bool)

(declare-fun e!125109 () Bool)

(assert (=> b!179963 (= e!125109 e!125110)))

(declare-fun res!149372 () Bool)

(assert (=> b!179963 (=> (not res!149372) (not e!125110))))

(declare-fun lt!276091 () (_ BitVec 64))

(assert (=> b!179963 (= res!149372 (= lt!276087 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!276091)))))

(assert (=> b!179963 (= lt!276087 (bitIndex!0 (size!4261 (buf!4704 (_2!8401 lt!276084))) (currentByte!8914 (_2!8401 lt!276084)) (currentBit!8909 (_2!8401 lt!276084))))))

(assert (=> b!179963 (= lt!276091 (bitIndex!0 (size!4261 (buf!4704 thiss!1204)) (currentByte!8914 thiss!1204) (currentBit!8909 thiss!1204)))))

(declare-fun b!179964 () Bool)

(declare-fun e!125104 () Bool)

(declare-fun lt!276094 () tuple2!15514)

(declare-fun lt!276085 () tuple2!15514)

(assert (=> b!179964 (= e!125104 (= (_2!8402 lt!276094) (_2!8402 lt!276085)))))

(declare-fun res!149383 () Bool)

(assert (=> start!39728 (=> (not res!149383) (not e!125105))))

(assert (=> start!39728 (= res!149383 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39728 e!125105))

(assert (=> start!39728 true))

(declare-fun inv!12 (BitStream!7630) Bool)

(assert (=> start!39728 (and (inv!12 thiss!1204) e!125107)))

(declare-fun b!179957 () Bool)

(declare-fun res!149379 () Bool)

(assert (=> b!179957 (=> res!149379 e!125102)))

(declare-fun lt!276080 () (_ BitVec 64))

(assert (=> b!179957 (= res!149379 (or (not (= (size!4261 (buf!4704 (_2!8401 lt!276083))) (size!4261 (buf!4704 thiss!1204)))) (not (= lt!276086 (bvsub (bvadd lt!276080 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!179965 () Bool)

(declare-fun res!149374 () Bool)

(assert (=> b!179965 (=> (not res!149374) (not e!125105))))

(assert (=> b!179965 (= res!149374 (not (= i!590 nBits!348)))))

(declare-fun b!179966 () Bool)

(declare-fun res!149378 () Bool)

(assert (=> b!179966 (=> res!149378 e!125102)))

(assert (=> b!179966 (= res!149378 (not (isPrefixOf!0 (_2!8401 lt!276084) (_2!8401 lt!276083))))))

(declare-fun b!179967 () Bool)

(declare-fun res!149381 () Bool)

(assert (=> b!179967 (=> res!149381 e!125102)))

(assert (=> b!179967 (= res!149381 (not (isPrefixOf!0 thiss!1204 (_2!8401 lt!276084))))))

(declare-fun b!179968 () Bool)

(assert (=> b!179968 (= e!125105 (not e!125103))))

(declare-fun res!149371 () Bool)

(assert (=> b!179968 (=> res!149371 e!125103)))

(assert (=> b!179968 (= res!149371 (not (= lt!276089 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!276080))))))

(assert (=> b!179968 (= lt!276089 (bitIndex!0 (size!4261 (buf!4704 (_2!8401 lt!276084))) (currentByte!8914 (_2!8401 lt!276084)) (currentBit!8909 (_2!8401 lt!276084))))))

(assert (=> b!179968 (= lt!276080 (bitIndex!0 (size!4261 (buf!4704 thiss!1204)) (currentByte!8914 thiss!1204) (currentBit!8909 thiss!1204)))))

(assert (=> b!179968 e!125109))

(declare-fun res!149380 () Bool)

(assert (=> b!179968 (=> (not res!149380) (not e!125109))))

(assert (=> b!179968 (= res!149380 (= (size!4261 (buf!4704 thiss!1204)) (size!4261 (buf!4704 (_2!8401 lt!276084)))))))

(declare-fun appendBit!0 (BitStream!7630 Bool) tuple2!15512)

(assert (=> b!179968 (= lt!276084 (appendBit!0 thiss!1204 lt!276082))))

(assert (=> b!179968 (= lt!276082 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!179969 () Bool)

(declare-fun res!149370 () Bool)

(assert (=> b!179969 (=> (not res!149370) (not e!125110))))

(assert (=> b!179969 (= res!149370 (isPrefixOf!0 thiss!1204 (_2!8401 lt!276084)))))

(declare-fun b!179970 () Bool)

(declare-fun res!149382 () Bool)

(assert (=> b!179970 (=> res!149382 e!125102)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!179970 (= res!149382 (not (invariant!0 (currentBit!8909 (_2!8401 lt!276083)) (currentByte!8914 (_2!8401 lt!276083)) (size!4261 (buf!4704 (_2!8401 lt!276083))))))))

(declare-fun b!179971 () Bool)

(declare-fun res!149373 () Bool)

(assert (=> b!179971 (=> (not res!149373) (not e!125105))))

(assert (=> b!179971 (= res!149373 (invariant!0 (currentBit!8909 thiss!1204) (currentByte!8914 thiss!1204) (size!4261 (buf!4704 thiss!1204))))))

(declare-fun b!179972 () Bool)

(declare-fun e!125108 () Bool)

(assert (=> b!179972 (= e!125108 (invariant!0 (currentBit!8909 thiss!1204) (currentByte!8914 thiss!1204) (size!4261 (buf!4704 (_2!8401 lt!276083)))))))

(declare-fun b!179973 () Bool)

(assert (=> b!179973 (= e!125102 true)))

(declare-datatypes ((tuple2!15516 0))(
  ( (tuple2!15517 (_1!8403 BitStream!7630) (_2!8403 BitStream!7630)) )
))
(declare-fun lt!276090 () tuple2!15516)

(assert (=> b!179973 (= (_2!8402 (readBitPure!0 (_1!8403 lt!276090))) lt!276082)))

(declare-fun lt!276081 () tuple2!15516)

(declare-fun reader!0 (BitStream!7630 BitStream!7630) tuple2!15516)

(assert (=> b!179973 (= lt!276081 (reader!0 (_2!8401 lt!276084) (_2!8401 lt!276083)))))

(assert (=> b!179973 (= lt!276090 (reader!0 thiss!1204 (_2!8401 lt!276083)))))

(assert (=> b!179973 e!125104))

(declare-fun res!149376 () Bool)

(assert (=> b!179973 (=> (not res!149376) (not e!125104))))

(assert (=> b!179973 (= res!149376 (= (bitIndex!0 (size!4261 (buf!4704 (_1!8402 lt!276094))) (currentByte!8914 (_1!8402 lt!276094)) (currentBit!8909 (_1!8402 lt!276094))) (bitIndex!0 (size!4261 (buf!4704 (_1!8402 lt!276085))) (currentByte!8914 (_1!8402 lt!276085)) (currentBit!8909 (_1!8402 lt!276085)))))))

(declare-fun lt!276088 () Unit!12941)

(declare-fun lt!276092 () BitStream!7630)

(declare-fun readBitPrefixLemma!0 (BitStream!7630 BitStream!7630) Unit!12941)

(assert (=> b!179973 (= lt!276088 (readBitPrefixLemma!0 lt!276092 (_2!8401 lt!276083)))))

(assert (=> b!179973 (= lt!276085 (readBitPure!0 (BitStream!7631 (buf!4704 (_2!8401 lt!276083)) (currentByte!8914 thiss!1204) (currentBit!8909 thiss!1204))))))

(assert (=> b!179973 (= lt!276094 (readBitPure!0 lt!276092))))

(assert (=> b!179973 e!125108))

(declare-fun res!149375 () Bool)

(assert (=> b!179973 (=> (not res!149375) (not e!125108))))

(assert (=> b!179973 (= res!149375 (invariant!0 (currentBit!8909 thiss!1204) (currentByte!8914 thiss!1204) (size!4261 (buf!4704 (_2!8401 lt!276084)))))))

(assert (=> b!179973 (= lt!276092 (BitStream!7631 (buf!4704 (_2!8401 lt!276084)) (currentByte!8914 thiss!1204) (currentBit!8909 thiss!1204)))))

(assert (= (and start!39728 res!149383) b!179958))

(assert (= (and b!179958 res!149384) b!179971))

(assert (= (and b!179971 res!149373) b!179965))

(assert (= (and b!179965 res!149374) b!179968))

(assert (= (and b!179968 res!149380) b!179963))

(assert (= (and b!179963 res!149372) b!179969))

(assert (= (and b!179969 res!149370) b!179960))

(assert (= (and b!179960 res!149377) b!179962))

(assert (= (and b!179968 (not res!149371)) b!179959))

(assert (= (and b!179959 (not res!149385)) b!179970))

(assert (= (and b!179970 (not res!149382)) b!179957))

(assert (= (and b!179957 (not res!149379)) b!179966))

(assert (= (and b!179966 (not res!149378)) b!179967))

(assert (= (and b!179967 (not res!149381)) b!179973))

(assert (= (and b!179973 res!149375) b!179972))

(assert (= (and b!179973 res!149376) b!179964))

(assert (= start!39728 b!179961))

(declare-fun m!280327 () Bool)

(assert (=> b!179973 m!280327))

(declare-fun m!280329 () Bool)

(assert (=> b!179973 m!280329))

(declare-fun m!280331 () Bool)

(assert (=> b!179973 m!280331))

(declare-fun m!280333 () Bool)

(assert (=> b!179973 m!280333))

(declare-fun m!280335 () Bool)

(assert (=> b!179973 m!280335))

(declare-fun m!280337 () Bool)

(assert (=> b!179973 m!280337))

(declare-fun m!280339 () Bool)

(assert (=> b!179973 m!280339))

(declare-fun m!280341 () Bool)

(assert (=> b!179973 m!280341))

(declare-fun m!280343 () Bool)

(assert (=> b!179973 m!280343))

(declare-fun m!280345 () Bool)

(assert (=> b!179972 m!280345))

(declare-fun m!280347 () Bool)

(assert (=> b!179962 m!280347))

(declare-fun m!280349 () Bool)

(assert (=> b!179959 m!280349))

(declare-fun m!280351 () Bool)

(assert (=> b!179959 m!280351))

(declare-fun m!280353 () Bool)

(assert (=> b!179959 m!280353))

(declare-fun m!280355 () Bool)

(assert (=> b!179959 m!280355))

(declare-fun m!280357 () Bool)

(assert (=> b!179966 m!280357))

(declare-fun m!280359 () Bool)

(assert (=> start!39728 m!280359))

(declare-fun m!280361 () Bool)

(assert (=> b!179968 m!280361))

(declare-fun m!280363 () Bool)

(assert (=> b!179968 m!280363))

(declare-fun m!280365 () Bool)

(assert (=> b!179968 m!280365))

(declare-fun m!280367 () Bool)

(assert (=> b!179958 m!280367))

(declare-fun m!280369 () Bool)

(assert (=> b!179969 m!280369))

(declare-fun m!280371 () Bool)

(assert (=> b!179961 m!280371))

(declare-fun m!280373 () Bool)

(assert (=> b!179971 m!280373))

(declare-fun m!280375 () Bool)

(assert (=> b!179970 m!280375))

(declare-fun m!280377 () Bool)

(assert (=> b!179960 m!280377))

(assert (=> b!179960 m!280377))

(declare-fun m!280379 () Bool)

(assert (=> b!179960 m!280379))

(assert (=> b!179967 m!280369))

(assert (=> b!179963 m!280361))

(assert (=> b!179963 m!280363))

(push 1)

