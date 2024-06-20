; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41844 () Bool)

(assert start!41844)

(declare-fun b!196946 () Bool)

(declare-fun e!135309 () Bool)

(declare-datatypes ((array!10092 0))(
  ( (array!10093 (arr!5379 (Array (_ BitVec 32) (_ BitVec 8))) (size!4449 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8006 0))(
  ( (BitStream!8007 (buf!4935 array!10092) (currentByte!9264 (_ BitVec 32)) (currentBit!9259 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8006)

(declare-fun array_inv!4190 (array!10092) Bool)

(assert (=> b!196946 (= e!135309 (array_inv!4190 (buf!4935 thiss!1204)))))

(declare-fun b!196947 () Bool)

(declare-fun e!135308 () Bool)

(declare-fun e!135314 () Bool)

(assert (=> b!196947 (= e!135308 e!135314)))

(declare-fun res!164815 () Bool)

(assert (=> b!196947 (=> (not res!164815) (not e!135314))))

(declare-datatypes ((Unit!13930 0))(
  ( (Unit!13931) )
))
(declare-datatypes ((tuple2!17038 0))(
  ( (tuple2!17039 (_1!9164 Unit!13930) (_2!9164 BitStream!8006)) )
))
(declare-fun lt!306403 () tuple2!17038)

(declare-datatypes ((tuple2!17040 0))(
  ( (tuple2!17041 (_1!9165 BitStream!8006) (_2!9165 Bool)) )
))
(declare-fun lt!306405 () tuple2!17040)

(declare-fun lt!306408 () Bool)

(assert (=> b!196947 (= res!164815 (and (= (_2!9165 lt!306405) lt!306408) (= (_1!9165 lt!306405) (_2!9164 lt!306403))))))

(declare-fun readBitPure!0 (BitStream!8006) tuple2!17040)

(declare-fun readerFrom!0 (BitStream!8006 (_ BitVec 32) (_ BitVec 32)) BitStream!8006)

(assert (=> b!196947 (= lt!306405 (readBitPure!0 (readerFrom!0 (_2!9164 lt!306403) (currentBit!9259 thiss!1204) (currentByte!9264 thiss!1204))))))

(declare-fun b!196948 () Bool)

(declare-fun e!135313 () Bool)

(declare-fun lt!306402 () tuple2!17038)

(declare-fun isPrefixOf!0 (BitStream!8006 BitStream!8006) Bool)

(assert (=> b!196948 (= e!135313 (isPrefixOf!0 (_2!9164 lt!306403) (_2!9164 lt!306402)))))

(declare-fun b!196949 () Bool)

(declare-fun lt!306400 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!196949 (= e!135314 (= (bitIndex!0 (size!4449 (buf!4935 (_1!9165 lt!306405))) (currentByte!9264 (_1!9165 lt!306405)) (currentBit!9259 (_1!9165 lt!306405))) lt!306400))))

(declare-fun b!196950 () Bool)

(declare-fun res!164812 () Bool)

(assert (=> b!196950 (=> res!164812 e!135313)))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun lt!306404 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun lt!306401 () (_ BitVec 64))

(assert (=> b!196950 (= res!164812 (or (not (= (size!4449 (buf!4935 (_2!9164 lt!306402))) (size!4449 (buf!4935 thiss!1204)))) (not (= lt!306404 (bvsub (bvadd lt!306401 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!196951 () Bool)

(declare-fun res!164814 () Bool)

(declare-fun e!135312 () Bool)

(assert (=> b!196951 (=> (not res!164814) (not e!135312))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!196951 (= res!164814 (invariant!0 (currentBit!9259 thiss!1204) (currentByte!9264 thiss!1204) (size!4449 (buf!4935 thiss!1204))))))

(declare-fun b!196952 () Bool)

(declare-fun res!164813 () Bool)

(assert (=> b!196952 (=> (not res!164813) (not e!135312))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!196952 (= res!164813 (validate_offset_bits!1 ((_ sign_extend 32) (size!4449 (buf!4935 thiss!1204))) ((_ sign_extend 32) (currentByte!9264 thiss!1204)) ((_ sign_extend 32) (currentBit!9259 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun res!164816 () Bool)

(assert (=> start!41844 (=> (not res!164816) (not e!135312))))

(assert (=> start!41844 (= res!164816 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!41844 e!135312))

(assert (=> start!41844 true))

(declare-fun inv!12 (BitStream!8006) Bool)

(assert (=> start!41844 (and (inv!12 thiss!1204) e!135309)))

(declare-fun b!196953 () Bool)

(declare-fun res!164821 () Bool)

(assert (=> b!196953 (=> (not res!164821) (not e!135312))))

(assert (=> b!196953 (= res!164821 (not (= i!590 nBits!348)))))

(declare-fun b!196954 () Bool)

(declare-fun e!135310 () Bool)

(assert (=> b!196954 (= e!135310 e!135313)))

(declare-fun res!164819 () Bool)

(assert (=> b!196954 (=> res!164819 e!135313)))

(declare-fun lt!306406 () (_ BitVec 64))

(assert (=> b!196954 (= res!164819 (not (= lt!306404 (bvsub (bvsub (bvadd lt!306406 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!196954 (= lt!306404 (bitIndex!0 (size!4449 (buf!4935 (_2!9164 lt!306402))) (currentByte!9264 (_2!9164 lt!306402)) (currentBit!9259 (_2!9164 lt!306402))))))

(assert (=> b!196954 (isPrefixOf!0 thiss!1204 (_2!9164 lt!306402))))

(declare-fun lt!306409 () Unit!13930)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8006 BitStream!8006 BitStream!8006) Unit!13930)

(assert (=> b!196954 (= lt!306409 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9164 lt!306403) (_2!9164 lt!306402)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8006 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17038)

(assert (=> b!196954 (= lt!306402 (appendBitsLSBFirstLoopTR!0 (_2!9164 lt!306403) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!196955 () Bool)

(assert (=> b!196955 (= e!135312 (not e!135310))))

(declare-fun res!164823 () Bool)

(assert (=> b!196955 (=> res!164823 e!135310)))

(assert (=> b!196955 (= res!164823 (not (= lt!306406 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!306401))))))

(assert (=> b!196955 (= lt!306406 (bitIndex!0 (size!4449 (buf!4935 (_2!9164 lt!306403))) (currentByte!9264 (_2!9164 lt!306403)) (currentBit!9259 (_2!9164 lt!306403))))))

(assert (=> b!196955 (= lt!306401 (bitIndex!0 (size!4449 (buf!4935 thiss!1204)) (currentByte!9264 thiss!1204) (currentBit!9259 thiss!1204)))))

(declare-fun e!135311 () Bool)

(assert (=> b!196955 e!135311))

(declare-fun res!164818 () Bool)

(assert (=> b!196955 (=> (not res!164818) (not e!135311))))

(assert (=> b!196955 (= res!164818 (= (size!4449 (buf!4935 thiss!1204)) (size!4449 (buf!4935 (_2!9164 lt!306403)))))))

(declare-fun appendBit!0 (BitStream!8006 Bool) tuple2!17038)

(assert (=> b!196955 (= lt!306403 (appendBit!0 thiss!1204 lt!306408))))

(assert (=> b!196955 (= lt!306408 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!196956 () Bool)

(declare-fun res!164822 () Bool)

(assert (=> b!196956 (=> res!164822 e!135313)))

(assert (=> b!196956 (= res!164822 (not (invariant!0 (currentBit!9259 (_2!9164 lt!306402)) (currentByte!9264 (_2!9164 lt!306402)) (size!4449 (buf!4935 (_2!9164 lt!306402))))))))

(declare-fun b!196957 () Bool)

(assert (=> b!196957 (= e!135311 e!135308)))

(declare-fun res!164820 () Bool)

(assert (=> b!196957 (=> (not res!164820) (not e!135308))))

(declare-fun lt!306407 () (_ BitVec 64))

(assert (=> b!196957 (= res!164820 (= lt!306400 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!306407)))))

(assert (=> b!196957 (= lt!306400 (bitIndex!0 (size!4449 (buf!4935 (_2!9164 lt!306403))) (currentByte!9264 (_2!9164 lt!306403)) (currentBit!9259 (_2!9164 lt!306403))))))

(assert (=> b!196957 (= lt!306407 (bitIndex!0 (size!4449 (buf!4935 thiss!1204)) (currentByte!9264 thiss!1204) (currentBit!9259 thiss!1204)))))

(declare-fun b!196958 () Bool)

(declare-fun res!164817 () Bool)

(assert (=> b!196958 (=> (not res!164817) (not e!135308))))

(assert (=> b!196958 (= res!164817 (isPrefixOf!0 thiss!1204 (_2!9164 lt!306403)))))

(assert (= (and start!41844 res!164816) b!196952))

(assert (= (and b!196952 res!164813) b!196951))

(assert (= (and b!196951 res!164814) b!196953))

(assert (= (and b!196953 res!164821) b!196955))

(assert (= (and b!196955 res!164818) b!196957))

(assert (= (and b!196957 res!164820) b!196958))

(assert (= (and b!196958 res!164817) b!196947))

(assert (= (and b!196947 res!164815) b!196949))

(assert (= (and b!196955 (not res!164823)) b!196954))

(assert (= (and b!196954 (not res!164819)) b!196956))

(assert (= (and b!196956 (not res!164822)) b!196950))

(assert (= (and b!196950 (not res!164812)) b!196948))

(assert (= start!41844 b!196946))

(declare-fun m!304447 () Bool)

(assert (=> b!196954 m!304447))

(declare-fun m!304449 () Bool)

(assert (=> b!196954 m!304449))

(declare-fun m!304451 () Bool)

(assert (=> b!196954 m!304451))

(declare-fun m!304453 () Bool)

(assert (=> b!196954 m!304453))

(declare-fun m!304455 () Bool)

(assert (=> b!196949 m!304455))

(declare-fun m!304457 () Bool)

(assert (=> start!41844 m!304457))

(declare-fun m!304459 () Bool)

(assert (=> b!196956 m!304459))

(declare-fun m!304461 () Bool)

(assert (=> b!196951 m!304461))

(declare-fun m!304463 () Bool)

(assert (=> b!196946 m!304463))

(declare-fun m!304465 () Bool)

(assert (=> b!196947 m!304465))

(assert (=> b!196947 m!304465))

(declare-fun m!304467 () Bool)

(assert (=> b!196947 m!304467))

(declare-fun m!304469 () Bool)

(assert (=> b!196948 m!304469))

(declare-fun m!304471 () Bool)

(assert (=> b!196957 m!304471))

(declare-fun m!304473 () Bool)

(assert (=> b!196957 m!304473))

(declare-fun m!304475 () Bool)

(assert (=> b!196958 m!304475))

(assert (=> b!196955 m!304471))

(assert (=> b!196955 m!304473))

(declare-fun m!304477 () Bool)

(assert (=> b!196955 m!304477))

(declare-fun m!304479 () Bool)

(assert (=> b!196952 m!304479))

(push 1)

(assert (not b!196956))

(assert (not b!196957))

(assert (not b!196952))

(assert (not b!196951))

(assert (not b!196955))

(assert (not b!196947))

(assert (not b!196958))

(assert (not b!196954))

(assert (not b!196949))

(assert (not b!196948))

(assert (not start!41844))

(assert (not b!196946))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!66567 () Bool)

(declare-fun e!135337 () Bool)

(assert (=> d!66567 e!135337))

(declare-fun res!164862 () Bool)

(assert (=> d!66567 (=> (not res!164862) (not e!135337))))

(declare-fun lt!306471 () (_ BitVec 64))

(declare-fun lt!306473 () (_ BitVec 64))

(declare-fun lt!306475 () (_ BitVec 64))

(assert (=> d!66567 (= res!164862 (= lt!306473 (bvsub lt!306471 lt!306475)))))

(assert (=> d!66567 (or (= (bvand lt!306471 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!306475 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!306471 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!306471 lt!306475) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!66567 (= lt!306475 (remainingBits!0 ((_ sign_extend 32) (size!4449 (buf!4935 (_2!9164 lt!306402)))) ((_ sign_extend 32) (currentByte!9264 (_2!9164 lt!306402))) ((_ sign_extend 32) (currentBit!9259 (_2!9164 lt!306402)))))))

(declare-fun lt!306474 () (_ BitVec 64))

(declare-fun lt!306472 () (_ BitVec 64))

(assert (=> d!66567 (= lt!306471 (bvmul lt!306474 lt!306472))))

(assert (=> d!66567 (or (= lt!306474 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!306472 (bvsdiv (bvmul lt!306474 lt!306472) lt!306474)))))

(assert (=> d!66567 (= lt!306472 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66567 (= lt!306474 ((_ sign_extend 32) (size!4449 (buf!4935 (_2!9164 lt!306402)))))))

(assert (=> d!66567 (= lt!306473 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9264 (_2!9164 lt!306402))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9259 (_2!9164 lt!306402)))))))

(assert (=> d!66567 (invariant!0 (currentBit!9259 (_2!9164 lt!306402)) (currentByte!9264 (_2!9164 lt!306402)) (size!4449 (buf!4935 (_2!9164 lt!306402))))))

(assert (=> d!66567 (= (bitIndex!0 (size!4449 (buf!4935 (_2!9164 lt!306402))) (currentByte!9264 (_2!9164 lt!306402)) (currentBit!9259 (_2!9164 lt!306402))) lt!306473)))

(declare-fun b!196995 () Bool)

(declare-fun res!164861 () Bool)

(assert (=> b!196995 (=> (not res!164861) (not e!135337))))

(assert (=> b!196995 (= res!164861 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!306473))))

(declare-fun b!196996 () Bool)

(declare-fun lt!306470 () (_ BitVec 64))

(assert (=> b!196996 (= e!135337 (bvsle lt!306473 (bvmul lt!306470 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!196996 (or (= lt!306470 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!306470 #b0000000000000000000000000000000000000000000000000000000000001000) lt!306470)))))

(assert (=> b!196996 (= lt!306470 ((_ sign_extend 32) (size!4449 (buf!4935 (_2!9164 lt!306402)))))))

(assert (= (and d!66567 res!164862) b!196995))

(assert (= (and b!196995 res!164861) b!196996))

(declare-fun m!304503 () Bool)

(assert (=> d!66567 m!304503))

(assert (=> d!66567 m!304459))

(assert (=> b!196954 d!66567))

(declare-fun d!66573 () Bool)

(declare-fun res!164880 () Bool)

(declare-fun e!135348 () Bool)

(assert (=> d!66573 (=> (not res!164880) (not e!135348))))

(assert (=> d!66573 (= res!164880 (= (size!4449 (buf!4935 thiss!1204)) (size!4449 (buf!4935 (_2!9164 lt!306402)))))))

(assert (=> d!66573 (= (isPrefixOf!0 thiss!1204 (_2!9164 lt!306402)) e!135348)))

(declare-fun b!197012 () Bool)

(declare-fun res!164879 () Bool)

(assert (=> b!197012 (=> (not res!164879) (not e!135348))))

(assert (=> b!197012 (= res!164879 (bvsle (bitIndex!0 (size!4449 (buf!4935 thiss!1204)) (currentByte!9264 thiss!1204) (currentBit!9259 thiss!1204)) (bitIndex!0 (size!4449 (buf!4935 (_2!9164 lt!306402))) (currentByte!9264 (_2!9164 lt!306402)) (currentBit!9259 (_2!9164 lt!306402)))))))

(declare-fun b!197013 () Bool)

(declare-fun e!135349 () Bool)

(assert (=> b!197013 (= e!135348 e!135349)))

(declare-fun res!164878 () Bool)

(assert (=> b!197013 (=> res!164878 e!135349)))

(assert (=> b!197013 (= res!164878 (= (size!4449 (buf!4935 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!197014 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10092 array!10092 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!197014 (= e!135349 (arrayBitRangesEq!0 (buf!4935 thiss!1204) (buf!4935 (_2!9164 lt!306402)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4449 (buf!4935 thiss!1204)) (currentByte!9264 thiss!1204) (currentBit!9259 thiss!1204))))))

(assert (= (and d!66573 res!164880) b!197012))

(assert (= (and b!197012 res!164879) b!197013))

(assert (= (and b!197013 (not res!164878)) b!197014))

(assert (=> b!197012 m!304473))

(assert (=> b!197012 m!304447))

(assert (=> b!197014 m!304473))

(assert (=> b!197014 m!304473))

(declare-fun m!304507 () Bool)

(assert (=> b!197014 m!304507))

(assert (=> b!196954 d!66573))

(declare-fun d!66577 () Bool)

(assert (=> d!66577 (isPrefixOf!0 thiss!1204 (_2!9164 lt!306402))))

(declare-fun lt!306481 () Unit!13930)

(declare-fun choose!30 (BitStream!8006 BitStream!8006 BitStream!8006) Unit!13930)

(assert (=> d!66577 (= lt!306481 (choose!30 thiss!1204 (_2!9164 lt!306403) (_2!9164 lt!306402)))))

(assert (=> d!66577 (isPrefixOf!0 thiss!1204 (_2!9164 lt!306403))))

(assert (=> d!66577 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9164 lt!306403) (_2!9164 lt!306402)) lt!306481)))

(declare-fun bs!16533 () Bool)

(assert (= bs!16533 d!66577))

(assert (=> bs!16533 m!304449))

(declare-fun m!304511 () Bool)

(assert (=> bs!16533 m!304511))

(assert (=> bs!16533 m!304475))

(assert (=> b!196954 d!66577))

(declare-fun b!197114 () Bool)

(declare-fun e!135406 () Bool)

(declare-fun e!135404 () Bool)

(assert (=> b!197114 (= e!135406 e!135404)))

(declare-fun res!164960 () Bool)

(assert (=> b!197114 (=> (not res!164960) (not e!135404))))

(declare-datatypes ((tuple2!17048 0))(
  ( (tuple2!17049 (_1!9169 BitStream!8006) (_2!9169 (_ BitVec 64))) )
))
(declare-fun lt!306846 () tuple2!17048)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!197114 (= res!164960 (= (_2!9169 lt!306846) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-datatypes ((tuple2!17050 0))(
  ( (tuple2!17051 (_1!9170 BitStream!8006) (_2!9170 BitStream!8006)) )
))
(declare-fun lt!306830 () tuple2!17050)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8006 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17048)

(assert (=> b!197114 (= lt!306846 (readNBitsLSBFirstsLoopPure!0 (_1!9170 lt!306830) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!306833 () Unit!13930)

(declare-fun lt!306799 () Unit!13930)

(assert (=> b!197114 (= lt!306833 lt!306799)))

(declare-fun lt!306797 () tuple2!17038)

(declare-fun lt!306821 () (_ BitVec 64))

(assert (=> b!197114 (validate_offset_bits!1 ((_ sign_extend 32) (size!4449 (buf!4935 (_2!9164 lt!306797)))) ((_ sign_extend 32) (currentByte!9264 (_2!9164 lt!306403))) ((_ sign_extend 32) (currentBit!9259 (_2!9164 lt!306403))) lt!306821)))

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8006 array!10092 (_ BitVec 64)) Unit!13930)

(assert (=> b!197114 (= lt!306799 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9164 lt!306403) (buf!4935 (_2!9164 lt!306797)) lt!306821))))

(declare-fun e!135405 () Bool)

(assert (=> b!197114 e!135405))

(declare-fun res!164970 () Bool)

(assert (=> b!197114 (=> (not res!164970) (not e!135405))))

(assert (=> b!197114 (= res!164970 (and (= (size!4449 (buf!4935 (_2!9164 lt!306403))) (size!4449 (buf!4935 (_2!9164 lt!306797)))) (bvsge lt!306821 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!197114 (= lt!306821 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!197114 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(declare-fun reader!0 (BitStream!8006 BitStream!8006) tuple2!17050)

(assert (=> b!197114 (= lt!306830 (reader!0 (_2!9164 lt!306403) (_2!9164 lt!306797)))))

(declare-fun lt!306845 () tuple2!17038)

(declare-fun c!9805 () Bool)

(declare-fun bm!3095 () Bool)

(declare-fun call!3098 () Bool)

(assert (=> bm!3095 (= call!3098 (isPrefixOf!0 (_2!9164 lt!306403) (ite c!9805 (_2!9164 lt!306403) (_2!9164 lt!306845))))))

(declare-fun d!66581 () Bool)

(assert (=> d!66581 e!135406))

(declare-fun res!164965 () Bool)

(assert (=> d!66581 (=> (not res!164965) (not e!135406))))

(assert (=> d!66581 (= res!164965 (invariant!0 (currentBit!9259 (_2!9164 lt!306797)) (currentByte!9264 (_2!9164 lt!306797)) (size!4449 (buf!4935 (_2!9164 lt!306797)))))))

(declare-fun e!135412 () tuple2!17038)

(assert (=> d!66581 (= lt!306797 e!135412)))

(assert (=> d!66581 (= c!9805 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!66581 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!66581 (= (appendBitsLSBFirstLoopTR!0 (_2!9164 lt!306403) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!306797)))

(declare-fun b!197115 () Bool)

(declare-fun lt!306832 () tuple2!17038)

(assert (=> b!197115 (= e!135412 (tuple2!17039 (_1!9164 lt!306832) (_2!9164 lt!306832)))))

(declare-fun lt!306813 () Bool)

(assert (=> b!197115 (= lt!306813 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!197115 (= lt!306845 (appendBit!0 (_2!9164 lt!306403) lt!306813))))

(declare-fun res!164966 () Bool)

(assert (=> b!197115 (= res!164966 (= (size!4449 (buf!4935 (_2!9164 lt!306403))) (size!4449 (buf!4935 (_2!9164 lt!306845)))))))

(declare-fun e!135410 () Bool)

(assert (=> b!197115 (=> (not res!164966) (not e!135410))))

(assert (=> b!197115 e!135410))

(declare-fun lt!306795 () tuple2!17038)

(assert (=> b!197115 (= lt!306795 lt!306845)))

(assert (=> b!197115 (= lt!306832 (appendBitsLSBFirstLoopTR!0 (_2!9164 lt!306795) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!306804 () Unit!13930)

(assert (=> b!197115 (= lt!306804 (lemmaIsPrefixTransitive!0 (_2!9164 lt!306403) (_2!9164 lt!306795) (_2!9164 lt!306832)))))

(assert (=> b!197115 (isPrefixOf!0 (_2!9164 lt!306403) (_2!9164 lt!306832))))

(declare-fun lt!306802 () Unit!13930)

(assert (=> b!197115 (= lt!306802 lt!306804)))

(assert (=> b!197115 (invariant!0 (currentBit!9259 (_2!9164 lt!306403)) (currentByte!9264 (_2!9164 lt!306403)) (size!4449 (buf!4935 (_2!9164 lt!306795))))))

(declare-fun lt!306838 () BitStream!8006)

(assert (=> b!197115 (= lt!306838 (BitStream!8007 (buf!4935 (_2!9164 lt!306795)) (currentByte!9264 (_2!9164 lt!306403)) (currentBit!9259 (_2!9164 lt!306403))))))

(assert (=> b!197115 (invariant!0 (currentBit!9259 lt!306838) (currentByte!9264 lt!306838) (size!4449 (buf!4935 (_2!9164 lt!306832))))))

(declare-fun lt!306816 () BitStream!8006)

(assert (=> b!197115 (= lt!306816 (BitStream!8007 (buf!4935 (_2!9164 lt!306832)) (currentByte!9264 lt!306838) (currentBit!9259 lt!306838)))))

(declare-fun lt!306834 () tuple2!17040)

(assert (=> b!197115 (= lt!306834 (readBitPure!0 lt!306838))))

(declare-fun lt!306836 () tuple2!17040)

(assert (=> b!197115 (= lt!306836 (readBitPure!0 lt!306816))))

(declare-fun lt!306801 () Unit!13930)

(declare-fun readBitPrefixLemma!0 (BitStream!8006 BitStream!8006) Unit!13930)

(assert (=> b!197115 (= lt!306801 (readBitPrefixLemma!0 lt!306838 (_2!9164 lt!306832)))))

(declare-fun res!164968 () Bool)

(assert (=> b!197115 (= res!164968 (= (bitIndex!0 (size!4449 (buf!4935 (_1!9165 lt!306834))) (currentByte!9264 (_1!9165 lt!306834)) (currentBit!9259 (_1!9165 lt!306834))) (bitIndex!0 (size!4449 (buf!4935 (_1!9165 lt!306836))) (currentByte!9264 (_1!9165 lt!306836)) (currentBit!9259 (_1!9165 lt!306836)))))))

(declare-fun e!135407 () Bool)

(assert (=> b!197115 (=> (not res!164968) (not e!135407))))

(assert (=> b!197115 e!135407))

(declare-fun lt!306814 () Unit!13930)

(assert (=> b!197115 (= lt!306814 lt!306801)))

(declare-fun lt!306815 () tuple2!17050)

(assert (=> b!197115 (= lt!306815 (reader!0 (_2!9164 lt!306403) (_2!9164 lt!306832)))))

(declare-fun lt!306819 () tuple2!17050)

(assert (=> b!197115 (= lt!306819 (reader!0 (_2!9164 lt!306795) (_2!9164 lt!306832)))))

(declare-fun lt!306800 () tuple2!17040)

(assert (=> b!197115 (= lt!306800 (readBitPure!0 (_1!9170 lt!306815)))))

(assert (=> b!197115 (= (_2!9165 lt!306800) lt!306813)))

(declare-fun lt!306835 () Unit!13930)

(declare-fun Unit!13943 () Unit!13930)

(assert (=> b!197115 (= lt!306835 Unit!13943)))

(declare-fun lt!306803 () (_ BitVec 64))

(assert (=> b!197115 (= lt!306803 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!306798 () (_ BitVec 64))

(assert (=> b!197115 (= lt!306798 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!306811 () Unit!13930)

(assert (=> b!197115 (= lt!306811 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9164 lt!306403) (buf!4935 (_2!9164 lt!306832)) lt!306798))))

(assert (=> b!197115 (validate_offset_bits!1 ((_ sign_extend 32) (size!4449 (buf!4935 (_2!9164 lt!306832)))) ((_ sign_extend 32) (currentByte!9264 (_2!9164 lt!306403))) ((_ sign_extend 32) (currentBit!9259 (_2!9164 lt!306403))) lt!306798)))

(declare-fun lt!306827 () Unit!13930)

(assert (=> b!197115 (= lt!306827 lt!306811)))

(declare-fun lt!306828 () tuple2!17048)

(assert (=> b!197115 (= lt!306828 (readNBitsLSBFirstsLoopPure!0 (_1!9170 lt!306815) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!306803))))

(declare-fun lt!306823 () (_ BitVec 64))

(assert (=> b!197115 (= lt!306823 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!306805 () Unit!13930)

(assert (=> b!197115 (= lt!306805 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9164 lt!306795) (buf!4935 (_2!9164 lt!306832)) lt!306823))))

(assert (=> b!197115 (validate_offset_bits!1 ((_ sign_extend 32) (size!4449 (buf!4935 (_2!9164 lt!306832)))) ((_ sign_extend 32) (currentByte!9264 (_2!9164 lt!306795))) ((_ sign_extend 32) (currentBit!9259 (_2!9164 lt!306795))) lt!306823)))

(declare-fun lt!306794 () Unit!13930)

(assert (=> b!197115 (= lt!306794 lt!306805)))

(declare-fun lt!306807 () tuple2!17048)

(assert (=> b!197115 (= lt!306807 (readNBitsLSBFirstsLoopPure!0 (_1!9170 lt!306819) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!306803 (ite (_2!9165 lt!306800) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!306808 () tuple2!17048)

(assert (=> b!197115 (= lt!306808 (readNBitsLSBFirstsLoopPure!0 (_1!9170 lt!306815) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!306803))))

(declare-fun c!9804 () Bool)

(assert (=> b!197115 (= c!9804 (_2!9165 (readBitPure!0 (_1!9170 lt!306815))))))

(declare-fun e!135409 () (_ BitVec 64))

(declare-fun lt!306829 () tuple2!17048)

(declare-fun withMovedBitIndex!0 (BitStream!8006 (_ BitVec 64)) BitStream!8006)

(assert (=> b!197115 (= lt!306829 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9170 lt!306815) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!306803 e!135409)))))

(declare-fun lt!306793 () Unit!13930)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8006 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13930)

(assert (=> b!197115 (= lt!306793 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9170 lt!306815) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!306803))))

(assert (=> b!197115 (and (= (_2!9169 lt!306808) (_2!9169 lt!306829)) (= (_1!9169 lt!306808) (_1!9169 lt!306829)))))

(declare-fun lt!306826 () Unit!13930)

(assert (=> b!197115 (= lt!306826 lt!306793)))

(assert (=> b!197115 (= (_1!9170 lt!306815) (withMovedBitIndex!0 (_2!9170 lt!306815) (bvsub (bitIndex!0 (size!4449 (buf!4935 (_2!9164 lt!306403))) (currentByte!9264 (_2!9164 lt!306403)) (currentBit!9259 (_2!9164 lt!306403))) (bitIndex!0 (size!4449 (buf!4935 (_2!9164 lt!306832))) (currentByte!9264 (_2!9164 lt!306832)) (currentBit!9259 (_2!9164 lt!306832))))))))

(declare-fun lt!306806 () Unit!13930)

(declare-fun Unit!13944 () Unit!13930)

(assert (=> b!197115 (= lt!306806 Unit!13944)))

(assert (=> b!197115 (= (_1!9170 lt!306819) (withMovedBitIndex!0 (_2!9170 lt!306819) (bvsub (bitIndex!0 (size!4449 (buf!4935 (_2!9164 lt!306795))) (currentByte!9264 (_2!9164 lt!306795)) (currentBit!9259 (_2!9164 lt!306795))) (bitIndex!0 (size!4449 (buf!4935 (_2!9164 lt!306832))) (currentByte!9264 (_2!9164 lt!306832)) (currentBit!9259 (_2!9164 lt!306832))))))))

(declare-fun lt!306824 () Unit!13930)

(declare-fun Unit!13945 () Unit!13930)

(assert (=> b!197115 (= lt!306824 Unit!13945)))

(assert (=> b!197115 (= (bitIndex!0 (size!4449 (buf!4935 (_2!9164 lt!306403))) (currentByte!9264 (_2!9164 lt!306403)) (currentBit!9259 (_2!9164 lt!306403))) (bvsub (bitIndex!0 (size!4449 (buf!4935 (_2!9164 lt!306795))) (currentByte!9264 (_2!9164 lt!306795)) (currentBit!9259 (_2!9164 lt!306795))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!306839 () Unit!13930)

(declare-fun Unit!13946 () Unit!13930)

(assert (=> b!197115 (= lt!306839 Unit!13946)))

(assert (=> b!197115 (= (_2!9169 lt!306828) (_2!9169 lt!306807))))

(declare-fun lt!306840 () Unit!13930)

(declare-fun Unit!13947 () Unit!13930)

(assert (=> b!197115 (= lt!306840 Unit!13947)))

(assert (=> b!197115 (invariant!0 (currentBit!9259 (_2!9164 lt!306832)) (currentByte!9264 (_2!9164 lt!306832)) (size!4449 (buf!4935 (_2!9164 lt!306832))))))

(declare-fun lt!306818 () Unit!13930)

(declare-fun Unit!13948 () Unit!13930)

(assert (=> b!197115 (= lt!306818 Unit!13948)))

(assert (=> b!197115 (= (size!4449 (buf!4935 (_2!9164 lt!306403))) (size!4449 (buf!4935 (_2!9164 lt!306832))))))

(declare-fun lt!306825 () Unit!13930)

(declare-fun Unit!13949 () Unit!13930)

(assert (=> b!197115 (= lt!306825 Unit!13949)))

(assert (=> b!197115 (= (bitIndex!0 (size!4449 (buf!4935 (_2!9164 lt!306832))) (currentByte!9264 (_2!9164 lt!306832)) (currentBit!9259 (_2!9164 lt!306832))) (bvsub (bvadd (bitIndex!0 (size!4449 (buf!4935 (_2!9164 lt!306403))) (currentByte!9264 (_2!9164 lt!306403)) (currentBit!9259 (_2!9164 lt!306403))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!306844 () Unit!13930)

(declare-fun Unit!13950 () Unit!13930)

(assert (=> b!197115 (= lt!306844 Unit!13950)))

(declare-fun lt!306817 () Unit!13930)

(declare-fun Unit!13951 () Unit!13930)

(assert (=> b!197115 (= lt!306817 Unit!13951)))

(declare-fun lt!306792 () tuple2!17050)

(assert (=> b!197115 (= lt!306792 (reader!0 (_2!9164 lt!306403) (_2!9164 lt!306832)))))

(declare-fun lt!306841 () (_ BitVec 64))

(assert (=> b!197115 (= lt!306841 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!306796 () Unit!13930)

(assert (=> b!197115 (= lt!306796 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9164 lt!306403) (buf!4935 (_2!9164 lt!306832)) lt!306841))))

(assert (=> b!197115 (validate_offset_bits!1 ((_ sign_extend 32) (size!4449 (buf!4935 (_2!9164 lt!306832)))) ((_ sign_extend 32) (currentByte!9264 (_2!9164 lt!306403))) ((_ sign_extend 32) (currentBit!9259 (_2!9164 lt!306403))) lt!306841)))

(declare-fun lt!306810 () Unit!13930)

(assert (=> b!197115 (= lt!306810 lt!306796)))

(declare-fun lt!306812 () tuple2!17048)

(assert (=> b!197115 (= lt!306812 (readNBitsLSBFirstsLoopPure!0 (_1!9170 lt!306792) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!164962 () Bool)

(assert (=> b!197115 (= res!164962 (= (_2!9169 lt!306812) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun e!135411 () Bool)

(assert (=> b!197115 (=> (not res!164962) (not e!135411))))

(assert (=> b!197115 e!135411))

(declare-fun lt!306820 () Unit!13930)

(declare-fun Unit!13952 () Unit!13930)

(assert (=> b!197115 (= lt!306820 Unit!13952)))

(declare-fun b!197116 () Bool)

(assert (=> b!197116 (= e!135411 (= (_1!9169 lt!306812) (_2!9170 lt!306792)))))

(declare-fun b!197117 () Bool)

(declare-fun res!164963 () Bool)

(assert (=> b!197117 (=> (not res!164963) (not e!135406))))

(declare-fun lt!306831 () (_ BitVec 64))

(declare-fun lt!306842 () (_ BitVec 64))

(assert (=> b!197117 (= res!164963 (= (bitIndex!0 (size!4449 (buf!4935 (_2!9164 lt!306797))) (currentByte!9264 (_2!9164 lt!306797)) (currentBit!9259 (_2!9164 lt!306797))) (bvsub lt!306831 lt!306842)))))

(assert (=> b!197117 (or (= (bvand lt!306831 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!306842 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!306831 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!306831 lt!306842) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!197117 (= lt!306842 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!306843 () (_ BitVec 64))

(declare-fun lt!306822 () (_ BitVec 64))

(assert (=> b!197117 (= lt!306831 (bvadd lt!306843 lt!306822))))

(assert (=> b!197117 (or (not (= (bvand lt!306843 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!306822 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!306843 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!306843 lt!306822) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!197117 (= lt!306822 ((_ sign_extend 32) nBits!348))))

(assert (=> b!197117 (= lt!306843 (bitIndex!0 (size!4449 (buf!4935 (_2!9164 lt!306403))) (currentByte!9264 (_2!9164 lt!306403)) (currentBit!9259 (_2!9164 lt!306403))))))

(declare-fun b!197118 () Bool)

(assert (=> b!197118 (= e!135409 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!197119 () Bool)

(declare-fun res!164961 () Bool)

(assert (=> b!197119 (=> (not res!164961) (not e!135406))))

(assert (=> b!197119 (= res!164961 (isPrefixOf!0 (_2!9164 lt!306403) (_2!9164 lt!306797)))))

(declare-fun b!197120 () Bool)

(declare-fun e!135408 () Bool)

(declare-fun lt!306837 () tuple2!17040)

(assert (=> b!197120 (= e!135408 (= (bitIndex!0 (size!4449 (buf!4935 (_1!9165 lt!306837))) (currentByte!9264 (_1!9165 lt!306837)) (currentBit!9259 (_1!9165 lt!306837))) (bitIndex!0 (size!4449 (buf!4935 (_2!9164 lt!306845))) (currentByte!9264 (_2!9164 lt!306845)) (currentBit!9259 (_2!9164 lt!306845)))))))

(declare-fun b!197121 () Bool)

(assert (=> b!197121 (= e!135404 (= (_1!9169 lt!306846) (_2!9170 lt!306830)))))

(declare-fun b!197122 () Bool)

(declare-fun res!164964 () Bool)

(assert (=> b!197122 (=> (not res!164964) (not e!135406))))

(assert (=> b!197122 (= res!164964 (= (size!4449 (buf!4935 (_2!9164 lt!306403))) (size!4449 (buf!4935 (_2!9164 lt!306797)))))))

(declare-fun b!197123 () Bool)

(declare-fun res!164967 () Bool)

(assert (=> b!197123 (= res!164967 (= (bitIndex!0 (size!4449 (buf!4935 (_2!9164 lt!306845))) (currentByte!9264 (_2!9164 lt!306845)) (currentBit!9259 (_2!9164 lt!306845))) (bvadd (bitIndex!0 (size!4449 (buf!4935 (_2!9164 lt!306403))) (currentByte!9264 (_2!9164 lt!306403)) (currentBit!9259 (_2!9164 lt!306403))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!197123 (=> (not res!164967) (not e!135410))))

(declare-fun b!197124 () Bool)

(assert (=> b!197124 (= e!135407 (= (_2!9165 lt!306834) (_2!9165 lt!306836)))))

(declare-fun b!197125 () Bool)

(assert (=> b!197125 (= e!135409 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!197126 () Bool)

(assert (=> b!197126 (= e!135405 (validate_offset_bits!1 ((_ sign_extend 32) (size!4449 (buf!4935 (_2!9164 lt!306403)))) ((_ sign_extend 32) (currentByte!9264 (_2!9164 lt!306403))) ((_ sign_extend 32) (currentBit!9259 (_2!9164 lt!306403))) lt!306821))))

(declare-fun b!197127 () Bool)

(assert (=> b!197127 (= lt!306837 (readBitPure!0 (readerFrom!0 (_2!9164 lt!306845) (currentBit!9259 (_2!9164 lt!306403)) (currentByte!9264 (_2!9164 lt!306403)))))))

(declare-fun res!164959 () Bool)

(assert (=> b!197127 (= res!164959 (and (= (_2!9165 lt!306837) lt!306813) (= (_1!9165 lt!306837) (_2!9164 lt!306845))))))

(assert (=> b!197127 (=> (not res!164959) (not e!135408))))

(assert (=> b!197127 (= e!135410 e!135408)))

(declare-fun b!197128 () Bool)

(declare-fun res!164969 () Bool)

(assert (=> b!197128 (= res!164969 call!3098)))

(assert (=> b!197128 (=> (not res!164969) (not e!135410))))

(declare-fun b!197129 () Bool)

(declare-fun Unit!13953 () Unit!13930)

(assert (=> b!197129 (= e!135412 (tuple2!17039 Unit!13953 (_2!9164 lt!306403)))))

(declare-fun lt!306847 () Unit!13930)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8006) Unit!13930)

(assert (=> b!197129 (= lt!306847 (lemmaIsPrefixRefl!0 (_2!9164 lt!306403)))))

(assert (=> b!197129 call!3098))

(declare-fun lt!306809 () Unit!13930)

(assert (=> b!197129 (= lt!306809 lt!306847)))

(assert (= (and d!66581 c!9805) b!197129))

(assert (= (and d!66581 (not c!9805)) b!197115))

(assert (= (and b!197115 res!164966) b!197123))

(assert (= (and b!197123 res!164967) b!197128))

(assert (= (and b!197128 res!164969) b!197127))

(assert (= (and b!197127 res!164959) b!197120))

(assert (= (and b!197115 res!164968) b!197124))

(assert (= (and b!197115 c!9804) b!197118))

(assert (= (and b!197115 (not c!9804)) b!197125))

(assert (= (and b!197115 res!164962) b!197116))

(assert (= (or b!197129 b!197128) bm!3095))

(assert (= (and d!66581 res!164965) b!197122))

(assert (= (and b!197122 res!164964) b!197117))

(assert (= (and b!197117 res!164963) b!197119))

(assert (= (and b!197119 res!164961) b!197114))

(assert (= (and b!197114 res!164970) b!197126))

(assert (= (and b!197114 res!164960) b!197121))

(declare-fun m!304629 () Bool)

(assert (=> b!197119 m!304629))

(declare-fun m!304631 () Bool)

(assert (=> bm!3095 m!304631))

(declare-fun m!304633 () Bool)

(assert (=> b!197127 m!304633))

(assert (=> b!197127 m!304633))

(declare-fun m!304635 () Bool)

(assert (=> b!197127 m!304635))

(declare-fun m!304637 () Bool)

(assert (=> b!197117 m!304637))

(assert (=> b!197117 m!304471))

(declare-fun m!304639 () Bool)

(assert (=> b!197126 m!304639))

(declare-fun m!304641 () Bool)

(assert (=> b!197115 m!304641))

(declare-fun m!304643 () Bool)

(assert (=> b!197115 m!304643))

(declare-fun m!304645 () Bool)

(assert (=> b!197115 m!304645))

(declare-fun m!304647 () Bool)

(assert (=> b!197115 m!304647))

(declare-fun m!304649 () Bool)

(assert (=> b!197115 m!304649))

(declare-fun m!304651 () Bool)

(assert (=> b!197115 m!304651))

(declare-fun m!304653 () Bool)

(assert (=> b!197115 m!304653))

(declare-fun m!304655 () Bool)

(assert (=> b!197115 m!304655))

(declare-fun m!304657 () Bool)

(assert (=> b!197115 m!304657))

(declare-fun m!304659 () Bool)

(assert (=> b!197115 m!304659))

(declare-fun m!304661 () Bool)

(assert (=> b!197115 m!304661))

(declare-fun m!304663 () Bool)

(assert (=> b!197115 m!304663))

(declare-fun m!304665 () Bool)

(assert (=> b!197115 m!304665))

(declare-fun m!304667 () Bool)

(assert (=> b!197115 m!304667))

(declare-fun m!304669 () Bool)

(assert (=> b!197115 m!304669))

(declare-fun m!304671 () Bool)

(assert (=> b!197115 m!304671))

(declare-fun m!304673 () Bool)

(assert (=> b!197115 m!304673))

(assert (=> b!197115 m!304649))

(declare-fun m!304675 () Bool)

(assert (=> b!197115 m!304675))

(declare-fun m!304677 () Bool)

(assert (=> b!197115 m!304677))

(declare-fun m!304679 () Bool)

(assert (=> b!197115 m!304679))

(declare-fun m!304681 () Bool)

(assert (=> b!197115 m!304681))

(declare-fun m!304683 () Bool)

(assert (=> b!197115 m!304683))

(declare-fun m!304685 () Bool)

(assert (=> b!197115 m!304685))

(declare-fun m!304687 () Bool)

(assert (=> b!197115 m!304687))

(declare-fun m!304689 () Bool)

(assert (=> b!197115 m!304689))

(declare-fun m!304691 () Bool)

(assert (=> b!197115 m!304691))

(declare-fun m!304693 () Bool)

(assert (=> b!197115 m!304693))

(declare-fun m!304695 () Bool)

(assert (=> b!197115 m!304695))

(declare-fun m!304697 () Bool)

(assert (=> b!197115 m!304697))

(declare-fun m!304699 () Bool)

(assert (=> b!197115 m!304699))

(assert (=> b!197115 m!304471))

(declare-fun m!304701 () Bool)

(assert (=> b!197115 m!304701))

(declare-fun m!304703 () Bool)

(assert (=> b!197115 m!304703))

(declare-fun m!304705 () Bool)

(assert (=> b!197115 m!304705))

(declare-fun m!304707 () Bool)

(assert (=> d!66581 m!304707))

(declare-fun m!304709 () Bool)

(assert (=> b!197120 m!304709))

(declare-fun m!304711 () Bool)

(assert (=> b!197120 m!304711))

(assert (=> b!197123 m!304711))

(assert (=> b!197123 m!304471))

(declare-fun m!304713 () Bool)

(assert (=> b!197129 m!304713))

(declare-fun m!304715 () Bool)

(assert (=> b!197114 m!304715))

(declare-fun m!304717 () Bool)

(assert (=> b!197114 m!304717))

(assert (=> b!197114 m!304673))

(declare-fun m!304719 () Bool)

(assert (=> b!197114 m!304719))

(declare-fun m!304721 () Bool)

(assert (=> b!197114 m!304721))

(assert (=> b!197114 m!304647))

(assert (=> b!196954 d!66581))

(declare-fun d!66599 () Bool)

(declare-fun e!135413 () Bool)

(assert (=> d!66599 e!135413))

(declare-fun res!164972 () Bool)

(assert (=> d!66599 (=> (not res!164972) (not e!135413))))

(declare-fun lt!306853 () (_ BitVec 64))

(declare-fun lt!306851 () (_ BitVec 64))

(declare-fun lt!306849 () (_ BitVec 64))

(assert (=> d!66599 (= res!164972 (= lt!306851 (bvsub lt!306849 lt!306853)))))

(assert (=> d!66599 (or (= (bvand lt!306849 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!306853 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!306849 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!306849 lt!306853) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66599 (= lt!306853 (remainingBits!0 ((_ sign_extend 32) (size!4449 (buf!4935 (_2!9164 lt!306403)))) ((_ sign_extend 32) (currentByte!9264 (_2!9164 lt!306403))) ((_ sign_extend 32) (currentBit!9259 (_2!9164 lt!306403)))))))

(declare-fun lt!306852 () (_ BitVec 64))

(declare-fun lt!306850 () (_ BitVec 64))

(assert (=> d!66599 (= lt!306849 (bvmul lt!306852 lt!306850))))

(assert (=> d!66599 (or (= lt!306852 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!306850 (bvsdiv (bvmul lt!306852 lt!306850) lt!306852)))))

(assert (=> d!66599 (= lt!306850 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66599 (= lt!306852 ((_ sign_extend 32) (size!4449 (buf!4935 (_2!9164 lt!306403)))))))

(assert (=> d!66599 (= lt!306851 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9264 (_2!9164 lt!306403))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9259 (_2!9164 lt!306403)))))))

(assert (=> d!66599 (invariant!0 (currentBit!9259 (_2!9164 lt!306403)) (currentByte!9264 (_2!9164 lt!306403)) (size!4449 (buf!4935 (_2!9164 lt!306403))))))

(assert (=> d!66599 (= (bitIndex!0 (size!4449 (buf!4935 (_2!9164 lt!306403))) (currentByte!9264 (_2!9164 lt!306403)) (currentBit!9259 (_2!9164 lt!306403))) lt!306851)))

(declare-fun b!197130 () Bool)

(declare-fun res!164971 () Bool)

(assert (=> b!197130 (=> (not res!164971) (not e!135413))))

(assert (=> b!197130 (= res!164971 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!306851))))

(declare-fun b!197131 () Bool)

(declare-fun lt!306848 () (_ BitVec 64))

(assert (=> b!197131 (= e!135413 (bvsle lt!306851 (bvmul lt!306848 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!197131 (or (= lt!306848 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!306848 #b0000000000000000000000000000000000000000000000000000000000001000) lt!306848)))))

(assert (=> b!197131 (= lt!306848 ((_ sign_extend 32) (size!4449 (buf!4935 (_2!9164 lt!306403)))))))

(assert (= (and d!66599 res!164972) b!197130))

(assert (= (and b!197130 res!164971) b!197131))

(declare-fun m!304723 () Bool)

(assert (=> d!66599 m!304723))

(declare-fun m!304725 () Bool)

(assert (=> d!66599 m!304725))

(assert (=> b!196955 d!66599))

(declare-fun d!66601 () Bool)

(declare-fun e!135414 () Bool)

(assert (=> d!66601 e!135414))

(declare-fun res!164974 () Bool)

(assert (=> d!66601 (=> (not res!164974) (not e!135414))))

(declare-fun lt!306855 () (_ BitVec 64))

(declare-fun lt!306859 () (_ BitVec 64))

(declare-fun lt!306857 () (_ BitVec 64))

(assert (=> d!66601 (= res!164974 (= lt!306857 (bvsub lt!306855 lt!306859)))))

(assert (=> d!66601 (or (= (bvand lt!306855 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!306859 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!306855 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!306855 lt!306859) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66601 (= lt!306859 (remainingBits!0 ((_ sign_extend 32) (size!4449 (buf!4935 thiss!1204))) ((_ sign_extend 32) (currentByte!9264 thiss!1204)) ((_ sign_extend 32) (currentBit!9259 thiss!1204))))))

(declare-fun lt!306858 () (_ BitVec 64))

(declare-fun lt!306856 () (_ BitVec 64))

(assert (=> d!66601 (= lt!306855 (bvmul lt!306858 lt!306856))))

(assert (=> d!66601 (or (= lt!306858 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!306856 (bvsdiv (bvmul lt!306858 lt!306856) lt!306858)))))

(assert (=> d!66601 (= lt!306856 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66601 (= lt!306858 ((_ sign_extend 32) (size!4449 (buf!4935 thiss!1204))))))

(assert (=> d!66601 (= lt!306857 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9264 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9259 thiss!1204))))))

(assert (=> d!66601 (invariant!0 (currentBit!9259 thiss!1204) (currentByte!9264 thiss!1204) (size!4449 (buf!4935 thiss!1204)))))

(assert (=> d!66601 (= (bitIndex!0 (size!4449 (buf!4935 thiss!1204)) (currentByte!9264 thiss!1204) (currentBit!9259 thiss!1204)) lt!306857)))

(declare-fun b!197132 () Bool)

(declare-fun res!164973 () Bool)

(assert (=> b!197132 (=> (not res!164973) (not e!135414))))

(assert (=> b!197132 (= res!164973 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!306857))))

(declare-fun b!197133 () Bool)

(declare-fun lt!306854 () (_ BitVec 64))

(assert (=> b!197133 (= e!135414 (bvsle lt!306857 (bvmul lt!306854 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!197133 (or (= lt!306854 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!306854 #b0000000000000000000000000000000000000000000000000000000000001000) lt!306854)))))

(assert (=> b!197133 (= lt!306854 ((_ sign_extend 32) (size!4449 (buf!4935 thiss!1204))))))

(assert (= (and d!66601 res!164974) b!197132))

(assert (= (and b!197132 res!164973) b!197133))

(declare-fun m!304727 () Bool)

(assert (=> d!66601 m!304727))

(assert (=> d!66601 m!304461))

(assert (=> b!196955 d!66601))

(declare-fun d!66603 () Bool)

(declare-fun e!135420 () Bool)

(assert (=> d!66603 e!135420))

(declare-fun res!164986 () Bool)

(assert (=> d!66603 (=> (not res!164986) (not e!135420))))

(declare-fun lt!306871 () tuple2!17038)

(assert (=> d!66603 (= res!164986 (= (size!4449 (buf!4935 thiss!1204)) (size!4449 (buf!4935 (_2!9164 lt!306871)))))))

(declare-fun choose!16 (BitStream!8006 Bool) tuple2!17038)

(assert (=> d!66603 (= lt!306871 (choose!16 thiss!1204 lt!306408))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!66603 (validate_offset_bit!0 ((_ sign_extend 32) (size!4449 (buf!4935 thiss!1204))) ((_ sign_extend 32) (currentByte!9264 thiss!1204)) ((_ sign_extend 32) (currentBit!9259 thiss!1204)))))

(assert (=> d!66603 (= (appendBit!0 thiss!1204 lt!306408) lt!306871)))

(declare-fun b!197143 () Bool)

(declare-fun res!164984 () Bool)

(assert (=> b!197143 (=> (not res!164984) (not e!135420))))

(declare-fun lt!306870 () (_ BitVec 64))

(declare-fun lt!306869 () (_ BitVec 64))

(assert (=> b!197143 (= res!164984 (= (bitIndex!0 (size!4449 (buf!4935 (_2!9164 lt!306871))) (currentByte!9264 (_2!9164 lt!306871)) (currentBit!9259 (_2!9164 lt!306871))) (bvadd lt!306870 lt!306869)))))

(assert (=> b!197143 (or (not (= (bvand lt!306870 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!306869 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!306870 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!306870 lt!306869) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!197143 (= lt!306869 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!197143 (= lt!306870 (bitIndex!0 (size!4449 (buf!4935 thiss!1204)) (currentByte!9264 thiss!1204) (currentBit!9259 thiss!1204)))))

(declare-fun b!197145 () Bool)

(declare-fun e!135419 () Bool)

(assert (=> b!197145 (= e!135420 e!135419)))

(declare-fun res!164985 () Bool)

(assert (=> b!197145 (=> (not res!164985) (not e!135419))))

(declare-fun lt!306868 () tuple2!17040)

(assert (=> b!197145 (= res!164985 (and (= (_2!9165 lt!306868) lt!306408) (= (_1!9165 lt!306868) (_2!9164 lt!306871))))))

(assert (=> b!197145 (= lt!306868 (readBitPure!0 (readerFrom!0 (_2!9164 lt!306871) (currentBit!9259 thiss!1204) (currentByte!9264 thiss!1204))))))

(declare-fun b!197146 () Bool)

(assert (=> b!197146 (= e!135419 (= (bitIndex!0 (size!4449 (buf!4935 (_1!9165 lt!306868))) (currentByte!9264 (_1!9165 lt!306868)) (currentBit!9259 (_1!9165 lt!306868))) (bitIndex!0 (size!4449 (buf!4935 (_2!9164 lt!306871))) (currentByte!9264 (_2!9164 lt!306871)) (currentBit!9259 (_2!9164 lt!306871)))))))

(declare-fun b!197144 () Bool)

(declare-fun res!164983 () Bool)

(assert (=> b!197144 (=> (not res!164983) (not e!135420))))

(assert (=> b!197144 (= res!164983 (isPrefixOf!0 thiss!1204 (_2!9164 lt!306871)))))

(assert (= (and d!66603 res!164986) b!197143))

(assert (= (and b!197143 res!164984) b!197144))

(assert (= (and b!197144 res!164983) b!197145))

(assert (= (and b!197145 res!164985) b!197146))

(declare-fun m!304729 () Bool)

(assert (=> b!197145 m!304729))

(assert (=> b!197145 m!304729))

(declare-fun m!304731 () Bool)

(assert (=> b!197145 m!304731))

(declare-fun m!304733 () Bool)

(assert (=> b!197144 m!304733))

(declare-fun m!304735 () Bool)

(assert (=> d!66603 m!304735))

(declare-fun m!304737 () Bool)

(assert (=> d!66603 m!304737))

(declare-fun m!304739 () Bool)

(assert (=> b!197143 m!304739))

(assert (=> b!197143 m!304473))

(declare-fun m!304741 () Bool)

(assert (=> b!197146 m!304741))

(assert (=> b!197146 m!304739))

(assert (=> b!196955 d!66603))

(declare-fun d!66605 () Bool)

(assert (=> d!66605 (= (invariant!0 (currentBit!9259 (_2!9164 lt!306402)) (currentByte!9264 (_2!9164 lt!306402)) (size!4449 (buf!4935 (_2!9164 lt!306402)))) (and (bvsge (currentBit!9259 (_2!9164 lt!306402)) #b00000000000000000000000000000000) (bvslt (currentBit!9259 (_2!9164 lt!306402)) #b00000000000000000000000000001000) (bvsge (currentByte!9264 (_2!9164 lt!306402)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9264 (_2!9164 lt!306402)) (size!4449 (buf!4935 (_2!9164 lt!306402)))) (and (= (currentBit!9259 (_2!9164 lt!306402)) #b00000000000000000000000000000000) (= (currentByte!9264 (_2!9164 lt!306402)) (size!4449 (buf!4935 (_2!9164 lt!306402))))))))))

(assert (=> b!196956 d!66605))

(declare-fun d!66607 () Bool)

(assert (=> d!66607 (= (array_inv!4190 (buf!4935 thiss!1204)) (bvsge (size!4449 (buf!4935 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!196946 d!66607))

(assert (=> b!196957 d!66599))

(assert (=> b!196957 d!66601))

(declare-fun d!66609 () Bool)

(assert (=> d!66609 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9259 thiss!1204) (currentByte!9264 thiss!1204) (size!4449 (buf!4935 thiss!1204))))))

(declare-fun bs!16536 () Bool)

(assert (= bs!16536 d!66609))

(assert (=> bs!16536 m!304461))

(assert (=> start!41844 d!66609))

(declare-fun d!66611 () Bool)

(declare-fun res!164989 () Bool)

(declare-fun e!135421 () Bool)

(assert (=> d!66611 (=> (not res!164989) (not e!135421))))

(assert (=> d!66611 (= res!164989 (= (size!4449 (buf!4935 thiss!1204)) (size!4449 (buf!4935 (_2!9164 lt!306403)))))))

(assert (=> d!66611 (= (isPrefixOf!0 thiss!1204 (_2!9164 lt!306403)) e!135421)))

(declare-fun b!197147 () Bool)

(declare-fun res!164988 () Bool)

(assert (=> b!197147 (=> (not res!164988) (not e!135421))))

(assert (=> b!197147 (= res!164988 (bvsle (bitIndex!0 (size!4449 (buf!4935 thiss!1204)) (currentByte!9264 thiss!1204) (currentBit!9259 thiss!1204)) (bitIndex!0 (size!4449 (buf!4935 (_2!9164 lt!306403))) (currentByte!9264 (_2!9164 lt!306403)) (currentBit!9259 (_2!9164 lt!306403)))))))

(declare-fun b!197148 () Bool)

(declare-fun e!135422 () Bool)

(assert (=> b!197148 (= e!135421 e!135422)))

(declare-fun res!164987 () Bool)

(assert (=> b!197148 (=> res!164987 e!135422)))

(assert (=> b!197148 (= res!164987 (= (size!4449 (buf!4935 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!197149 () Bool)

(assert (=> b!197149 (= e!135422 (arrayBitRangesEq!0 (buf!4935 thiss!1204) (buf!4935 (_2!9164 lt!306403)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4449 (buf!4935 thiss!1204)) (currentByte!9264 thiss!1204) (currentBit!9259 thiss!1204))))))

(assert (= (and d!66611 res!164989) b!197147))

(assert (= (and b!197147 res!164988) b!197148))

(assert (= (and b!197148 (not res!164987)) b!197149))

(assert (=> b!197147 m!304473))

(assert (=> b!197147 m!304471))

(assert (=> b!197149 m!304473))

(assert (=> b!197149 m!304473))

(declare-fun m!304743 () Bool)

(assert (=> b!197149 m!304743))

(assert (=> b!196958 d!66611))

(declare-fun d!66613 () Bool)

(declare-datatypes ((tuple2!17056 0))(
  ( (tuple2!17057 (_1!9173 Bool) (_2!9173 BitStream!8006)) )
))
(declare-fun lt!306874 () tuple2!17056)

(declare-fun readBit!0 (BitStream!8006) tuple2!17056)

(assert (=> d!66613 (= lt!306874 (readBit!0 (readerFrom!0 (_2!9164 lt!306403) (currentBit!9259 thiss!1204) (currentByte!9264 thiss!1204))))))

(assert (=> d!66613 (= (readBitPure!0 (readerFrom!0 (_2!9164 lt!306403) (currentBit!9259 thiss!1204) (currentByte!9264 thiss!1204))) (tuple2!17041 (_2!9173 lt!306874) (_1!9173 lt!306874)))))

(declare-fun bs!16537 () Bool)

(assert (= bs!16537 d!66613))

(assert (=> bs!16537 m!304465))

(declare-fun m!304745 () Bool)

(assert (=> bs!16537 m!304745))

(assert (=> b!196947 d!66613))

(declare-fun d!66615 () Bool)

(declare-fun e!135425 () Bool)

(assert (=> d!66615 e!135425))

(declare-fun res!164993 () Bool)

(assert (=> d!66615 (=> (not res!164993) (not e!135425))))

(assert (=> d!66615 (= res!164993 (invariant!0 (currentBit!9259 (_2!9164 lt!306403)) (currentByte!9264 (_2!9164 lt!306403)) (size!4449 (buf!4935 (_2!9164 lt!306403)))))))

(assert (=> d!66615 (= (readerFrom!0 (_2!9164 lt!306403) (currentBit!9259 thiss!1204) (currentByte!9264 thiss!1204)) (BitStream!8007 (buf!4935 (_2!9164 lt!306403)) (currentByte!9264 thiss!1204) (currentBit!9259 thiss!1204)))))

(declare-fun b!197152 () Bool)

(assert (=> b!197152 (= e!135425 (invariant!0 (currentBit!9259 thiss!1204) (currentByte!9264 thiss!1204) (size!4449 (buf!4935 (_2!9164 lt!306403)))))))

(assert (= (and d!66615 res!164993) b!197152))

(assert (=> d!66615 m!304725))

(declare-fun m!304747 () Bool)

(assert (=> b!197152 m!304747))

(assert (=> b!196947 d!66615))

(declare-fun d!66617 () Bool)

(declare-fun res!164996 () Bool)

(declare-fun e!135426 () Bool)

(assert (=> d!66617 (=> (not res!164996) (not e!135426))))

(assert (=> d!66617 (= res!164996 (= (size!4449 (buf!4935 (_2!9164 lt!306403))) (size!4449 (buf!4935 (_2!9164 lt!306402)))))))

(assert (=> d!66617 (= (isPrefixOf!0 (_2!9164 lt!306403) (_2!9164 lt!306402)) e!135426)))

(declare-fun b!197153 () Bool)

(declare-fun res!164995 () Bool)

(assert (=> b!197153 (=> (not res!164995) (not e!135426))))

(assert (=> b!197153 (= res!164995 (bvsle (bitIndex!0 (size!4449 (buf!4935 (_2!9164 lt!306403))) (currentByte!9264 (_2!9164 lt!306403)) (currentBit!9259 (_2!9164 lt!306403))) (bitIndex!0 (size!4449 (buf!4935 (_2!9164 lt!306402))) (currentByte!9264 (_2!9164 lt!306402)) (currentBit!9259 (_2!9164 lt!306402)))))))

(declare-fun b!197154 () Bool)

(declare-fun e!135427 () Bool)

(assert (=> b!197154 (= e!135426 e!135427)))

(declare-fun res!164994 () Bool)

(assert (=> b!197154 (=> res!164994 e!135427)))

(assert (=> b!197154 (= res!164994 (= (size!4449 (buf!4935 (_2!9164 lt!306403))) #b00000000000000000000000000000000))))

(declare-fun b!197155 () Bool)

(assert (=> b!197155 (= e!135427 (arrayBitRangesEq!0 (buf!4935 (_2!9164 lt!306403)) (buf!4935 (_2!9164 lt!306402)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4449 (buf!4935 (_2!9164 lt!306403))) (currentByte!9264 (_2!9164 lt!306403)) (currentBit!9259 (_2!9164 lt!306403)))))))

(assert (= (and d!66617 res!164996) b!197153))

(assert (= (and b!197153 res!164995) b!197154))

(assert (= (and b!197154 (not res!164994)) b!197155))

(assert (=> b!197153 m!304471))

(assert (=> b!197153 m!304447))

(assert (=> b!197155 m!304471))

(assert (=> b!197155 m!304471))

(declare-fun m!304749 () Bool)

(assert (=> b!197155 m!304749))

(assert (=> b!196948 d!66617))

(declare-fun d!66619 () Bool)

(declare-fun e!135428 () Bool)

(assert (=> d!66619 e!135428))

(declare-fun res!164998 () Bool)

(assert (=> d!66619 (=> (not res!164998) (not e!135428))))

(declare-fun lt!306876 () (_ BitVec 64))

(declare-fun lt!306880 () (_ BitVec 64))

(declare-fun lt!306878 () (_ BitVec 64))

(assert (=> d!66619 (= res!164998 (= lt!306878 (bvsub lt!306876 lt!306880)))))

(assert (=> d!66619 (or (= (bvand lt!306876 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!306880 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!306876 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!306876 lt!306880) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66619 (= lt!306880 (remainingBits!0 ((_ sign_extend 32) (size!4449 (buf!4935 (_1!9165 lt!306405)))) ((_ sign_extend 32) (currentByte!9264 (_1!9165 lt!306405))) ((_ sign_extend 32) (currentBit!9259 (_1!9165 lt!306405)))))))

(declare-fun lt!306879 () (_ BitVec 64))

(declare-fun lt!306877 () (_ BitVec 64))

(assert (=> d!66619 (= lt!306876 (bvmul lt!306879 lt!306877))))

(assert (=> d!66619 (or (= lt!306879 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!306877 (bvsdiv (bvmul lt!306879 lt!306877) lt!306879)))))

(assert (=> d!66619 (= lt!306877 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66619 (= lt!306879 ((_ sign_extend 32) (size!4449 (buf!4935 (_1!9165 lt!306405)))))))

(assert (=> d!66619 (= lt!306878 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9264 (_1!9165 lt!306405))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9259 (_1!9165 lt!306405)))))))

(assert (=> d!66619 (invariant!0 (currentBit!9259 (_1!9165 lt!306405)) (currentByte!9264 (_1!9165 lt!306405)) (size!4449 (buf!4935 (_1!9165 lt!306405))))))

(assert (=> d!66619 (= (bitIndex!0 (size!4449 (buf!4935 (_1!9165 lt!306405))) (currentByte!9264 (_1!9165 lt!306405)) (currentBit!9259 (_1!9165 lt!306405))) lt!306878)))

(declare-fun b!197156 () Bool)

(declare-fun res!164997 () Bool)

(assert (=> b!197156 (=> (not res!164997) (not e!135428))))

(assert (=> b!197156 (= res!164997 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!306878))))

(declare-fun b!197157 () Bool)

(declare-fun lt!306875 () (_ BitVec 64))

(assert (=> b!197157 (= e!135428 (bvsle lt!306878 (bvmul lt!306875 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!197157 (or (= lt!306875 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!306875 #b0000000000000000000000000000000000000000000000000000000000001000) lt!306875)))))

(assert (=> b!197157 (= lt!306875 ((_ sign_extend 32) (size!4449 (buf!4935 (_1!9165 lt!306405)))))))

(assert (= (and d!66619 res!164998) b!197156))

(assert (= (and b!197156 res!164997) b!197157))

(declare-fun m!304751 () Bool)

(assert (=> d!66619 m!304751))

(declare-fun m!304753 () Bool)

(assert (=> d!66619 m!304753))

(assert (=> b!196949 d!66619))

(declare-fun d!66621 () Bool)

(assert (=> d!66621 (= (invariant!0 (currentBit!9259 thiss!1204) (currentByte!9264 thiss!1204) (size!4449 (buf!4935 thiss!1204))) (and (bvsge (currentBit!9259 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9259 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9264 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9264 thiss!1204) (size!4449 (buf!4935 thiss!1204))) (and (= (currentBit!9259 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9264 thiss!1204) (size!4449 (buf!4935 thiss!1204)))))))))

(assert (=> b!196951 d!66621))

(declare-fun d!66623 () Bool)

(assert (=> d!66623 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4449 (buf!4935 thiss!1204))) ((_ sign_extend 32) (currentByte!9264 thiss!1204)) ((_ sign_extend 32) (currentBit!9259 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4449 (buf!4935 thiss!1204))) ((_ sign_extend 32) (currentByte!9264 thiss!1204)) ((_ sign_extend 32) (currentBit!9259 thiss!1204))) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun bs!16538 () Bool)

(assert (= bs!16538 d!66623))

(assert (=> bs!16538 m!304727))

(assert (=> b!196952 d!66623))

(push 1)

(assert (not b!197129))

(assert (not b!197115))

(assert (not b!197126))

(assert (not bm!3095))

(assert (not b!197146))

(assert (not b!197014))

(assert (not b!197012))

(assert (not b!197149))

(assert (not d!66603))

(assert (not b!197145))

(assert (not b!197117))

(assert (not d!66609))

(assert (not b!197147))

(assert (not b!197144))

(assert (not b!197152))

(assert (not d!66567))

(assert (not d!66615))

(assert (not d!66581))

(assert (not d!66601))

(assert (not d!66613))

(assert (not b!197155))

(assert (not d!66599))

(assert (not b!197127))

(assert (not b!197153))

(assert (not d!66623))

(assert (not d!66577))

(assert (not d!66619))

(assert (not b!197123))

(assert (not b!197119))

(assert (not b!197120))

(assert (not b!197143))

(assert (not b!197114))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

