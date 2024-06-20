; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41022 () Bool)

(assert start!41022)

(declare-fun b!190354 () Bool)

(declare-fun res!158810 () Bool)

(declare-fun e!131363 () Bool)

(assert (=> b!190354 (=> res!158810 e!131363)))

(declare-datatypes ((array!9912 0))(
  ( (array!9913 (arr!5301 (Array (_ BitVec 32) (_ BitVec 8))) (size!4371 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7850 0))(
  ( (BitStream!7851 (buf!4845 array!9912) (currentByte!9117 (_ BitVec 32)) (currentBit!9112 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!13541 0))(
  ( (Unit!13542) )
))
(declare-datatypes ((tuple2!16476 0))(
  ( (tuple2!16477 (_1!8883 Unit!13541) (_2!8883 BitStream!7850)) )
))
(declare-fun lt!295325 () tuple2!16476)

(declare-fun lt!295314 () tuple2!16476)

(declare-fun isPrefixOf!0 (BitStream!7850 BitStream!7850) Bool)

(assert (=> b!190354 (= res!158810 (not (isPrefixOf!0 (_2!8883 lt!295325) (_2!8883 lt!295314))))))

(declare-fun b!190355 () Bool)

(declare-fun e!131358 () Bool)

(declare-fun e!131361 () Bool)

(assert (=> b!190355 (= e!131358 e!131361)))

(declare-fun res!158808 () Bool)

(assert (=> b!190355 (=> res!158808 e!131361)))

(declare-datatypes ((tuple2!16478 0))(
  ( (tuple2!16479 (_1!8884 BitStream!7850) (_2!8884 BitStream!7850)) )
))
(declare-fun lt!295332 () tuple2!16478)

(declare-fun lt!295333 () BitStream!7850)

(assert (=> b!190355 (= res!158808 (not (= (_1!8884 lt!295332) lt!295333)))))

(declare-fun e!131362 () Bool)

(assert (=> b!190355 e!131362))

(declare-fun res!158818 () Bool)

(assert (=> b!190355 (=> (not res!158818) (not e!131362))))

(declare-datatypes ((tuple2!16480 0))(
  ( (tuple2!16481 (_1!8885 BitStream!7850) (_2!8885 (_ BitVec 64))) )
))
(declare-fun lt!295323 () tuple2!16480)

(declare-fun lt!295335 () tuple2!16480)

(assert (=> b!190355 (= res!158818 (and (= (_2!8885 lt!295323) (_2!8885 lt!295335)) (= (_1!8885 lt!295323) (_1!8885 lt!295335))))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun lt!295339 () tuple2!16478)

(declare-fun lt!295334 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun lt!295337 () Unit!13541)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7850 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13541)

(assert (=> b!190355 (= lt!295337 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8884 lt!295339) nBits!348 i!590 lt!295334))))

(declare-fun lt!295319 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7850 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16480)

(assert (=> b!190355 (= lt!295335 (readNBitsLSBFirstsLoopPure!0 lt!295333 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!295319))))

(declare-fun withMovedBitIndex!0 (BitStream!7850 (_ BitVec 64)) BitStream!7850)

(assert (=> b!190355 (= lt!295333 (withMovedBitIndex!0 (_1!8884 lt!295339) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!190356 () Bool)

(declare-fun e!131360 () Bool)

(declare-fun e!131354 () Bool)

(assert (=> b!190356 (= e!131360 (not e!131354))))

(declare-fun res!158806 () Bool)

(assert (=> b!190356 (=> res!158806 e!131354)))

(declare-fun lt!295316 () (_ BitVec 64))

(declare-fun lt!295311 () (_ BitVec 64))

(assert (=> b!190356 (= res!158806 (not (= lt!295316 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!295311))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!190356 (= lt!295316 (bitIndex!0 (size!4371 (buf!4845 (_2!8883 lt!295325))) (currentByte!9117 (_2!8883 lt!295325)) (currentBit!9112 (_2!8883 lt!295325))))))

(declare-fun thiss!1204 () BitStream!7850)

(assert (=> b!190356 (= lt!295311 (bitIndex!0 (size!4371 (buf!4845 thiss!1204)) (currentByte!9117 thiss!1204) (currentBit!9112 thiss!1204)))))

(declare-fun e!131355 () Bool)

(assert (=> b!190356 e!131355))

(declare-fun res!158815 () Bool)

(assert (=> b!190356 (=> (not res!158815) (not e!131355))))

(assert (=> b!190356 (= res!158815 (= (size!4371 (buf!4845 thiss!1204)) (size!4371 (buf!4845 (_2!8883 lt!295325)))))))

(declare-fun lt!295322 () Bool)

(declare-fun appendBit!0 (BitStream!7850 Bool) tuple2!16476)

(assert (=> b!190356 (= lt!295325 (appendBit!0 thiss!1204 lt!295322))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun lt!295313 () (_ BitVec 64))

(assert (=> b!190356 (= lt!295322 (not (= (bvand v!189 lt!295313) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!190356 (= lt!295313 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun res!158817 () Bool)

(declare-fun e!131353 () Bool)

(assert (=> start!41022 (=> (not res!158817) (not e!131353))))

(assert (=> start!41022 (= res!158817 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!41022 e!131353))

(assert (=> start!41022 true))

(declare-fun e!131352 () Bool)

(declare-fun inv!12 (BitStream!7850) Bool)

(assert (=> start!41022 (and (inv!12 thiss!1204) e!131352)))

(declare-fun b!190357 () Bool)

(declare-fun e!131357 () Bool)

(declare-datatypes ((tuple2!16482 0))(
  ( (tuple2!16483 (_1!8886 BitStream!7850) (_2!8886 Bool)) )
))
(declare-fun lt!295315 () tuple2!16482)

(declare-fun lt!295321 () (_ BitVec 64))

(assert (=> b!190357 (= e!131357 (= (bitIndex!0 (size!4371 (buf!4845 (_1!8886 lt!295315))) (currentByte!9117 (_1!8886 lt!295315)) (currentBit!9112 (_1!8886 lt!295315))) lt!295321))))

(declare-fun b!190358 () Bool)

(declare-fun res!158805 () Bool)

(assert (=> b!190358 (=> (not res!158805) (not e!131362))))

(declare-fun lt!295336 () (_ BitVec 64))

(assert (=> b!190358 (= res!158805 (= (_1!8884 lt!295339) (withMovedBitIndex!0 (_2!8884 lt!295339) (bvsub lt!295311 lt!295336))))))

(declare-fun b!190359 () Bool)

(assert (=> b!190359 (= e!131353 e!131360)))

(declare-fun res!158823 () Bool)

(assert (=> b!190359 (=> (not res!158823) (not e!131360))))

(declare-fun lt!295317 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!190359 (= res!158823 (validate_offset_bits!1 ((_ sign_extend 32) (size!4371 (buf!4845 thiss!1204))) ((_ sign_extend 32) (currentByte!9117 thiss!1204)) ((_ sign_extend 32) (currentBit!9112 thiss!1204)) lt!295317))))

(assert (=> b!190359 (= lt!295317 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!190360 () Bool)

(assert (=> b!190360 (= e!131354 e!131363)))

(declare-fun res!158821 () Bool)

(assert (=> b!190360 (=> res!158821 e!131363)))

(assert (=> b!190360 (= res!158821 (not (= lt!295336 (bvsub (bvsub (bvadd lt!295316 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!190360 (= lt!295336 (bitIndex!0 (size!4371 (buf!4845 (_2!8883 lt!295314))) (currentByte!9117 (_2!8883 lt!295314)) (currentBit!9112 (_2!8883 lt!295314))))))

(assert (=> b!190360 (isPrefixOf!0 thiss!1204 (_2!8883 lt!295314))))

(declare-fun lt!295328 () Unit!13541)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7850 BitStream!7850 BitStream!7850) Unit!13541)

(assert (=> b!190360 (= lt!295328 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8883 lt!295325) (_2!8883 lt!295314)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7850 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!16476)

(assert (=> b!190360 (= lt!295314 (appendBitsLSBFirstLoopTR!0 (_2!8883 lt!295325) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!190361 () Bool)

(declare-fun res!158812 () Bool)

(assert (=> b!190361 (=> (not res!158812) (not e!131360))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!190361 (= res!158812 (invariant!0 (currentBit!9112 thiss!1204) (currentByte!9117 thiss!1204) (size!4371 (buf!4845 thiss!1204))))))

(declare-fun b!190362 () Bool)

(declare-fun res!158816 () Bool)

(assert (=> b!190362 (=> res!158816 e!131363)))

(assert (=> b!190362 (= res!158816 (or (not (= (size!4371 (buf!4845 (_2!8883 lt!295314))) (size!4371 (buf!4845 thiss!1204)))) (not (= lt!295336 (bvsub (bvadd lt!295311 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!190363 () Bool)

(declare-fun e!131359 () Bool)

(declare-fun lt!295318 () tuple2!16482)

(declare-fun lt!295338 () tuple2!16482)

(assert (=> b!190363 (= e!131359 (= (_2!8886 lt!295318) (_2!8886 lt!295338)))))

(declare-fun b!190364 () Bool)

(declare-fun e!131351 () Bool)

(assert (=> b!190364 (= e!131351 e!131357)))

(declare-fun res!158809 () Bool)

(assert (=> b!190364 (=> (not res!158809) (not e!131357))))

(assert (=> b!190364 (= res!158809 (and (= (_2!8886 lt!295315) lt!295322) (= (_1!8886 lt!295315) (_2!8883 lt!295325))))))

(declare-fun readBitPure!0 (BitStream!7850) tuple2!16482)

(declare-fun readerFrom!0 (BitStream!7850 (_ BitVec 32) (_ BitVec 32)) BitStream!7850)

(assert (=> b!190364 (= lt!295315 (readBitPure!0 (readerFrom!0 (_2!8883 lt!295325) (currentBit!9112 thiss!1204) (currentByte!9117 thiss!1204))))))

(declare-fun b!190365 () Bool)

(declare-fun res!158822 () Bool)

(assert (=> b!190365 (=> (not res!158822) (not e!131360))))

(assert (=> b!190365 (= res!158822 (not (= i!590 nBits!348)))))

(declare-fun b!190366 () Bool)

(declare-fun res!158807 () Bool)

(assert (=> b!190366 (=> res!158807 e!131363)))

(assert (=> b!190366 (= res!158807 (not (isPrefixOf!0 thiss!1204 (_2!8883 lt!295325))))))

(declare-fun b!190367 () Bool)

(declare-fun lt!295330 () tuple2!16480)

(assert (=> b!190367 (= e!131362 (and (= lt!295311 (bvsub lt!295316 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!8884 lt!295332) lt!295333)) (= (_2!8885 lt!295323) (_2!8885 lt!295330)))))))

(declare-fun b!190368 () Bool)

(declare-fun array_inv!4112 (array!9912) Bool)

(assert (=> b!190368 (= e!131352 (array_inv!4112 (buf!4845 thiss!1204)))))

(declare-fun b!190369 () Bool)

(declare-fun e!131356 () Bool)

(assert (=> b!190369 (= e!131356 (invariant!0 (currentBit!9112 thiss!1204) (currentByte!9117 thiss!1204) (size!4371 (buf!4845 (_2!8883 lt!295314)))))))

(declare-fun b!190370 () Bool)

(declare-fun res!158811 () Bool)

(assert (=> b!190370 (=> (not res!158811) (not e!131362))))

(assert (=> b!190370 (= res!158811 (= (_1!8884 lt!295332) (withMovedBitIndex!0 (_2!8884 lt!295332) (bvsub lt!295316 lt!295336))))))

(declare-fun b!190371 () Bool)

(assert (=> b!190371 (= e!131355 e!131351)))

(declare-fun res!158813 () Bool)

(assert (=> b!190371 (=> (not res!158813) (not e!131351))))

(declare-fun lt!295312 () (_ BitVec 64))

(assert (=> b!190371 (= res!158813 (= lt!295321 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!295312)))))

(assert (=> b!190371 (= lt!295321 (bitIndex!0 (size!4371 (buf!4845 (_2!8883 lt!295325))) (currentByte!9117 (_2!8883 lt!295325)) (currentBit!9112 (_2!8883 lt!295325))))))

(assert (=> b!190371 (= lt!295312 (bitIndex!0 (size!4371 (buf!4845 thiss!1204)) (currentByte!9117 thiss!1204) (currentBit!9112 thiss!1204)))))

(declare-fun b!190372 () Bool)

(declare-fun res!158819 () Bool)

(assert (=> b!190372 (=> res!158819 e!131363)))

(assert (=> b!190372 (= res!158819 (not (invariant!0 (currentBit!9112 (_2!8883 lt!295314)) (currentByte!9117 (_2!8883 lt!295314)) (size!4371 (buf!4845 (_2!8883 lt!295314))))))))

(declare-fun b!190373 () Bool)

(assert (=> b!190373 (= e!131361 (validate_offset_bits!1 ((_ sign_extend 32) (size!4371 (buf!4845 (_1!8884 lt!295339)))) ((_ sign_extend 32) (currentByte!9117 (_1!8884 lt!295339))) ((_ sign_extend 32) (currentBit!9112 (_1!8884 lt!295339))) lt!295317))))

(assert (=> b!190373 (= (size!4371 (buf!4845 thiss!1204)) (size!4371 (buf!4845 (_2!8883 lt!295314))))))

(declare-fun b!190374 () Bool)

(assert (=> b!190374 (= e!131363 e!131358)))

(declare-fun res!158814 () Bool)

(assert (=> b!190374 (=> res!158814 e!131358)))

(assert (=> b!190374 (= res!158814 (not (= (_1!8885 lt!295330) (_2!8884 lt!295332))))))

(assert (=> b!190374 (= lt!295330 (readNBitsLSBFirstsLoopPure!0 (_1!8884 lt!295332) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!295319))))

(declare-fun lt!295320 () (_ BitVec 64))

(assert (=> b!190374 (validate_offset_bits!1 ((_ sign_extend 32) (size!4371 (buf!4845 (_2!8883 lt!295314)))) ((_ sign_extend 32) (currentByte!9117 (_2!8883 lt!295325))) ((_ sign_extend 32) (currentBit!9112 (_2!8883 lt!295325))) lt!295320)))

(declare-fun lt!295326 () Unit!13541)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7850 array!9912 (_ BitVec 64)) Unit!13541)

(assert (=> b!190374 (= lt!295326 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8883 lt!295325) (buf!4845 (_2!8883 lt!295314)) lt!295320))))

(assert (=> b!190374 (= lt!295320 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!295331 () tuple2!16482)

(assert (=> b!190374 (= lt!295319 (bvor lt!295334 (ite (_2!8886 lt!295331) lt!295313 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!190374 (= lt!295323 (readNBitsLSBFirstsLoopPure!0 (_1!8884 lt!295339) nBits!348 i!590 lt!295334))))

(assert (=> b!190374 (validate_offset_bits!1 ((_ sign_extend 32) (size!4371 (buf!4845 (_2!8883 lt!295314)))) ((_ sign_extend 32) (currentByte!9117 thiss!1204)) ((_ sign_extend 32) (currentBit!9112 thiss!1204)) lt!295317)))

(declare-fun lt!295324 () Unit!13541)

(assert (=> b!190374 (= lt!295324 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4845 (_2!8883 lt!295314)) lt!295317))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!190374 (= lt!295334 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!190374 (= (_2!8886 lt!295331) lt!295322)))

(assert (=> b!190374 (= lt!295331 (readBitPure!0 (_1!8884 lt!295339)))))

(declare-fun reader!0 (BitStream!7850 BitStream!7850) tuple2!16478)

(assert (=> b!190374 (= lt!295332 (reader!0 (_2!8883 lt!295325) (_2!8883 lt!295314)))))

(assert (=> b!190374 (= lt!295339 (reader!0 thiss!1204 (_2!8883 lt!295314)))))

(assert (=> b!190374 e!131359))

(declare-fun res!158804 () Bool)

(assert (=> b!190374 (=> (not res!158804) (not e!131359))))

(assert (=> b!190374 (= res!158804 (= (bitIndex!0 (size!4371 (buf!4845 (_1!8886 lt!295318))) (currentByte!9117 (_1!8886 lt!295318)) (currentBit!9112 (_1!8886 lt!295318))) (bitIndex!0 (size!4371 (buf!4845 (_1!8886 lt!295338))) (currentByte!9117 (_1!8886 lt!295338)) (currentBit!9112 (_1!8886 lt!295338)))))))

(declare-fun lt!295329 () Unit!13541)

(declare-fun lt!295327 () BitStream!7850)

(declare-fun readBitPrefixLemma!0 (BitStream!7850 BitStream!7850) Unit!13541)

(assert (=> b!190374 (= lt!295329 (readBitPrefixLemma!0 lt!295327 (_2!8883 lt!295314)))))

(assert (=> b!190374 (= lt!295338 (readBitPure!0 (BitStream!7851 (buf!4845 (_2!8883 lt!295314)) (currentByte!9117 thiss!1204) (currentBit!9112 thiss!1204))))))

(assert (=> b!190374 (= lt!295318 (readBitPure!0 lt!295327))))

(assert (=> b!190374 e!131356))

(declare-fun res!158802 () Bool)

(assert (=> b!190374 (=> (not res!158802) (not e!131356))))

(assert (=> b!190374 (= res!158802 (invariant!0 (currentBit!9112 thiss!1204) (currentByte!9117 thiss!1204) (size!4371 (buf!4845 (_2!8883 lt!295325)))))))

(assert (=> b!190374 (= lt!295327 (BitStream!7851 (buf!4845 (_2!8883 lt!295325)) (currentByte!9117 thiss!1204) (currentBit!9112 thiss!1204)))))

(declare-fun b!190375 () Bool)

(declare-fun res!158820 () Bool)

(assert (=> b!190375 (=> (not res!158820) (not e!131351))))

(assert (=> b!190375 (= res!158820 (isPrefixOf!0 thiss!1204 (_2!8883 lt!295325)))))

(declare-fun b!190376 () Bool)

(declare-fun res!158803 () Bool)

(assert (=> b!190376 (=> res!158803 e!131361)))

(assert (=> b!190376 (= res!158803 (not (= (bitIndex!0 (size!4371 (buf!4845 (_1!8885 lt!295323))) (currentByte!9117 (_1!8885 lt!295323)) (currentBit!9112 (_1!8885 lt!295323))) (bitIndex!0 (size!4371 (buf!4845 (_2!8884 lt!295339))) (currentByte!9117 (_2!8884 lt!295339)) (currentBit!9112 (_2!8884 lt!295339))))))))

(assert (= (and start!41022 res!158817) b!190359))

(assert (= (and b!190359 res!158823) b!190361))

(assert (= (and b!190361 res!158812) b!190365))

(assert (= (and b!190365 res!158822) b!190356))

(assert (= (and b!190356 res!158815) b!190371))

(assert (= (and b!190371 res!158813) b!190375))

(assert (= (and b!190375 res!158820) b!190364))

(assert (= (and b!190364 res!158809) b!190357))

(assert (= (and b!190356 (not res!158806)) b!190360))

(assert (= (and b!190360 (not res!158821)) b!190372))

(assert (= (and b!190372 (not res!158819)) b!190362))

(assert (= (and b!190362 (not res!158816)) b!190354))

(assert (= (and b!190354 (not res!158810)) b!190366))

(assert (= (and b!190366 (not res!158807)) b!190374))

(assert (= (and b!190374 res!158802) b!190369))

(assert (= (and b!190374 res!158804) b!190363))

(assert (= (and b!190374 (not res!158814)) b!190355))

(assert (= (and b!190355 res!158818) b!190358))

(assert (= (and b!190358 res!158805) b!190370))

(assert (= (and b!190370 res!158811) b!190367))

(assert (= (and b!190355 (not res!158808)) b!190376))

(assert (= (and b!190376 (not res!158803)) b!190373))

(assert (= start!41022 b!190368))

(declare-fun m!295541 () Bool)

(assert (=> b!190373 m!295541))

(declare-fun m!295543 () Bool)

(assert (=> b!190376 m!295543))

(declare-fun m!295545 () Bool)

(assert (=> b!190376 m!295545))

(declare-fun m!295547 () Bool)

(assert (=> b!190354 m!295547))

(declare-fun m!295549 () Bool)

(assert (=> b!190374 m!295549))

(declare-fun m!295551 () Bool)

(assert (=> b!190374 m!295551))

(declare-fun m!295553 () Bool)

(assert (=> b!190374 m!295553))

(declare-fun m!295555 () Bool)

(assert (=> b!190374 m!295555))

(declare-fun m!295557 () Bool)

(assert (=> b!190374 m!295557))

(declare-fun m!295559 () Bool)

(assert (=> b!190374 m!295559))

(declare-fun m!295561 () Bool)

(assert (=> b!190374 m!295561))

(declare-fun m!295563 () Bool)

(assert (=> b!190374 m!295563))

(declare-fun m!295565 () Bool)

(assert (=> b!190374 m!295565))

(declare-fun m!295567 () Bool)

(assert (=> b!190374 m!295567))

(declare-fun m!295569 () Bool)

(assert (=> b!190374 m!295569))

(declare-fun m!295571 () Bool)

(assert (=> b!190374 m!295571))

(declare-fun m!295573 () Bool)

(assert (=> b!190374 m!295573))

(declare-fun m!295575 () Bool)

(assert (=> b!190374 m!295575))

(declare-fun m!295577 () Bool)

(assert (=> b!190374 m!295577))

(declare-fun m!295579 () Bool)

(assert (=> b!190374 m!295579))

(declare-fun m!295581 () Bool)

(assert (=> b!190360 m!295581))

(declare-fun m!295583 () Bool)

(assert (=> b!190360 m!295583))

(declare-fun m!295585 () Bool)

(assert (=> b!190360 m!295585))

(declare-fun m!295587 () Bool)

(assert (=> b!190360 m!295587))

(declare-fun m!295589 () Bool)

(assert (=> b!190372 m!295589))

(declare-fun m!295591 () Bool)

(assert (=> b!190357 m!295591))

(declare-fun m!295593 () Bool)

(assert (=> b!190366 m!295593))

(declare-fun m!295595 () Bool)

(assert (=> b!190361 m!295595))

(declare-fun m!295597 () Bool)

(assert (=> b!190364 m!295597))

(assert (=> b!190364 m!295597))

(declare-fun m!295599 () Bool)

(assert (=> b!190364 m!295599))

(declare-fun m!295601 () Bool)

(assert (=> b!190371 m!295601))

(declare-fun m!295603 () Bool)

(assert (=> b!190371 m!295603))

(declare-fun m!295605 () Bool)

(assert (=> b!190359 m!295605))

(declare-fun m!295607 () Bool)

(assert (=> b!190355 m!295607))

(declare-fun m!295609 () Bool)

(assert (=> b!190355 m!295609))

(declare-fun m!295611 () Bool)

(assert (=> b!190355 m!295611))

(declare-fun m!295613 () Bool)

(assert (=> b!190368 m!295613))

(declare-fun m!295615 () Bool)

(assert (=> start!41022 m!295615))

(declare-fun m!295617 () Bool)

(assert (=> b!190358 m!295617))

(assert (=> b!190375 m!295593))

(declare-fun m!295619 () Bool)

(assert (=> b!190369 m!295619))

(declare-fun m!295621 () Bool)

(assert (=> b!190370 m!295621))

(assert (=> b!190356 m!295601))

(assert (=> b!190356 m!295603))

(declare-fun m!295623 () Bool)

(assert (=> b!190356 m!295623))

(push 1)

(assert (not b!190364))

(assert (not b!190368))

(assert (not b!190370))

(assert (not b!190361))

(assert (not b!190357))

(assert (not b!190358))

(assert (not start!41022))

(assert (not b!190371))

(assert (not b!190355))

(assert (not b!190375))

(assert (not b!190354))

(assert (not b!190376))

(assert (not b!190374))

(assert (not b!190359))

(assert (not b!190373))

(assert (not b!190372))

(assert (not b!190356))

(assert (not b!190360))

(assert (not b!190366))

(assert (not b!190369))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!65271 () Bool)

(assert (=> d!65271 (= (array_inv!4112 (buf!4845 thiss!1204)) (bvsge (size!4371 (buf!4845 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!190368 d!65271))

(declare-fun d!65275 () Bool)

(assert (=> d!65275 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9112 thiss!1204) (currentByte!9117 thiss!1204) (size!4371 (buf!4845 thiss!1204))))))

(declare-fun bs!16231 () Bool)

(assert (= bs!16231 d!65275))

(assert (=> bs!16231 m!295595))

(assert (=> start!41022 d!65275))

(declare-fun d!65277 () Bool)

(declare-fun e!131430 () Bool)

(assert (=> d!65277 e!131430))

(declare-fun res!158926 () Bool)

(assert (=> d!65277 (=> (not res!158926) (not e!131430))))

(declare-fun lt!295631 () (_ BitVec 64))

(declare-fun lt!295634 () (_ BitVec 64))

(declare-fun lt!295629 () (_ BitVec 64))

(assert (=> d!65277 (= res!158926 (= lt!295629 (bvsub lt!295634 lt!295631)))))

(assert (=> d!65277 (or (= (bvand lt!295634 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!295631 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!295634 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!295634 lt!295631) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!65277 (= lt!295631 (remainingBits!0 ((_ sign_extend 32) (size!4371 (buf!4845 (_1!8886 lt!295315)))) ((_ sign_extend 32) (currentByte!9117 (_1!8886 lt!295315))) ((_ sign_extend 32) (currentBit!9112 (_1!8886 lt!295315)))))))

(declare-fun lt!295632 () (_ BitVec 64))

(declare-fun lt!295633 () (_ BitVec 64))

(assert (=> d!65277 (= lt!295634 (bvmul lt!295632 lt!295633))))

(assert (=> d!65277 (or (= lt!295632 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!295633 (bvsdiv (bvmul lt!295632 lt!295633) lt!295632)))))

(assert (=> d!65277 (= lt!295633 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65277 (= lt!295632 ((_ sign_extend 32) (size!4371 (buf!4845 (_1!8886 lt!295315)))))))

(assert (=> d!65277 (= lt!295629 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9117 (_1!8886 lt!295315))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9112 (_1!8886 lt!295315)))))))

(assert (=> d!65277 (invariant!0 (currentBit!9112 (_1!8886 lt!295315)) (currentByte!9117 (_1!8886 lt!295315)) (size!4371 (buf!4845 (_1!8886 lt!295315))))))

(assert (=> d!65277 (= (bitIndex!0 (size!4371 (buf!4845 (_1!8886 lt!295315))) (currentByte!9117 (_1!8886 lt!295315)) (currentBit!9112 (_1!8886 lt!295315))) lt!295629)))

(declare-fun b!190485 () Bool)

(declare-fun res!158925 () Bool)

(assert (=> b!190485 (=> (not res!158925) (not e!131430))))

(assert (=> b!190485 (= res!158925 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!295629))))

(declare-fun b!190486 () Bool)

(declare-fun lt!295630 () (_ BitVec 64))

(assert (=> b!190486 (= e!131430 (bvsle lt!295629 (bvmul lt!295630 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!190486 (or (= lt!295630 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!295630 #b0000000000000000000000000000000000000000000000000000000000001000) lt!295630)))))

(assert (=> b!190486 (= lt!295630 ((_ sign_extend 32) (size!4371 (buf!4845 (_1!8886 lt!295315)))))))

(assert (= (and d!65277 res!158926) b!190485))

(assert (= (and b!190485 res!158925) b!190486))

(declare-fun m!295837 () Bool)

(assert (=> d!65277 m!295837))

(declare-fun m!295839 () Bool)

(assert (=> d!65277 m!295839))

(assert (=> b!190357 d!65277))

(declare-fun d!65279 () Bool)

(declare-fun e!131437 () Bool)

(assert (=> d!65279 e!131437))

(declare-fun res!158935 () Bool)

(assert (=> d!65279 (=> (not res!158935) (not e!131437))))

(declare-fun lt!295680 () (_ BitVec 64))

(declare-fun lt!295679 () BitStream!7850)

(assert (=> d!65279 (= res!158935 (= (bvadd lt!295680 (bvsub lt!295311 lt!295336)) (bitIndex!0 (size!4371 (buf!4845 lt!295679)) (currentByte!9117 lt!295679) (currentBit!9112 lt!295679))))))

(assert (=> d!65279 (or (not (= (bvand lt!295680 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!295311 lt!295336) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!295680 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!295680 (bvsub lt!295311 lt!295336)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65279 (= lt!295680 (bitIndex!0 (size!4371 (buf!4845 (_2!8884 lt!295339))) (currentByte!9117 (_2!8884 lt!295339)) (currentBit!9112 (_2!8884 lt!295339))))))

(declare-fun moveBitIndex!0 (BitStream!7850 (_ BitVec 64)) tuple2!16476)

(assert (=> d!65279 (= lt!295679 (_2!8883 (moveBitIndex!0 (_2!8884 lt!295339) (bvsub lt!295311 lt!295336))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!7850 (_ BitVec 64)) Bool)

(assert (=> d!65279 (moveBitIndexPrecond!0 (_2!8884 lt!295339) (bvsub lt!295311 lt!295336))))

(assert (=> d!65279 (= (withMovedBitIndex!0 (_2!8884 lt!295339) (bvsub lt!295311 lt!295336)) lt!295679)))

(declare-fun b!190499 () Bool)

(assert (=> b!190499 (= e!131437 (= (size!4371 (buf!4845 (_2!8884 lt!295339))) (size!4371 (buf!4845 lt!295679))))))

(assert (= (and d!65279 res!158935) b!190499))

(declare-fun m!295841 () Bool)

(assert (=> d!65279 m!295841))

(assert (=> d!65279 m!295545))

(declare-fun m!295843 () Bool)

(assert (=> d!65279 m!295843))

(declare-fun m!295845 () Bool)

(assert (=> d!65279 m!295845))

(assert (=> b!190358 d!65279))

(declare-fun d!65281 () Bool)

(declare-fun e!131440 () Bool)

(assert (=> d!65281 e!131440))

(declare-fun res!158940 () Bool)

(assert (=> d!65281 (=> (not res!158940) (not e!131440))))

(declare-fun lt!295706 () (_ BitVec 64))

(declare-fun lt!295701 () (_ BitVec 64))

(declare-fun lt!295703 () (_ BitVec 64))

(assert (=> d!65281 (= res!158940 (= lt!295701 (bvsub lt!295706 lt!295703)))))

(assert (=> d!65281 (or (= (bvand lt!295706 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!295703 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!295706 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!295706 lt!295703) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65281 (= lt!295703 (remainingBits!0 ((_ sign_extend 32) (size!4371 (buf!4845 (_2!8883 lt!295325)))) ((_ sign_extend 32) (currentByte!9117 (_2!8883 lt!295325))) ((_ sign_extend 32) (currentBit!9112 (_2!8883 lt!295325)))))))

(declare-fun lt!295704 () (_ BitVec 64))

(declare-fun lt!295705 () (_ BitVec 64))

(assert (=> d!65281 (= lt!295706 (bvmul lt!295704 lt!295705))))

(assert (=> d!65281 (or (= lt!295704 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!295705 (bvsdiv (bvmul lt!295704 lt!295705) lt!295704)))))

(assert (=> d!65281 (= lt!295705 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65281 (= lt!295704 ((_ sign_extend 32) (size!4371 (buf!4845 (_2!8883 lt!295325)))))))

(assert (=> d!65281 (= lt!295701 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9117 (_2!8883 lt!295325))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9112 (_2!8883 lt!295325)))))))

(assert (=> d!65281 (invariant!0 (currentBit!9112 (_2!8883 lt!295325)) (currentByte!9117 (_2!8883 lt!295325)) (size!4371 (buf!4845 (_2!8883 lt!295325))))))

(assert (=> d!65281 (= (bitIndex!0 (size!4371 (buf!4845 (_2!8883 lt!295325))) (currentByte!9117 (_2!8883 lt!295325)) (currentBit!9112 (_2!8883 lt!295325))) lt!295701)))

(declare-fun b!190505 () Bool)

(declare-fun res!158939 () Bool)

(assert (=> b!190505 (=> (not res!158939) (not e!131440))))

(assert (=> b!190505 (= res!158939 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!295701))))

(declare-fun b!190506 () Bool)

(declare-fun lt!295702 () (_ BitVec 64))

(assert (=> b!190506 (= e!131440 (bvsle lt!295701 (bvmul lt!295702 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!190506 (or (= lt!295702 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!295702 #b0000000000000000000000000000000000000000000000000000000000001000) lt!295702)))))

(assert (=> b!190506 (= lt!295702 ((_ sign_extend 32) (size!4371 (buf!4845 (_2!8883 lt!295325)))))))

(assert (= (and d!65281 res!158940) b!190505))

(assert (= (and b!190505 res!158939) b!190506))

(declare-fun m!295847 () Bool)

(assert (=> d!65281 m!295847))

(declare-fun m!295849 () Bool)

(assert (=> d!65281 m!295849))

(assert (=> b!190356 d!65281))

(declare-fun d!65283 () Bool)

(declare-fun e!131441 () Bool)

(assert (=> d!65283 e!131441))

(declare-fun res!158942 () Bool)

(assert (=> d!65283 (=> (not res!158942) (not e!131441))))

(declare-fun lt!295712 () (_ BitVec 64))

(declare-fun lt!295707 () (_ BitVec 64))

(declare-fun lt!295709 () (_ BitVec 64))

(assert (=> d!65283 (= res!158942 (= lt!295707 (bvsub lt!295712 lt!295709)))))

(assert (=> d!65283 (or (= (bvand lt!295712 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!295709 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!295712 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!295712 lt!295709) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65283 (= lt!295709 (remainingBits!0 ((_ sign_extend 32) (size!4371 (buf!4845 thiss!1204))) ((_ sign_extend 32) (currentByte!9117 thiss!1204)) ((_ sign_extend 32) (currentBit!9112 thiss!1204))))))

(declare-fun lt!295710 () (_ BitVec 64))

(declare-fun lt!295711 () (_ BitVec 64))

(assert (=> d!65283 (= lt!295712 (bvmul lt!295710 lt!295711))))

(assert (=> d!65283 (or (= lt!295710 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!295711 (bvsdiv (bvmul lt!295710 lt!295711) lt!295710)))))

(assert (=> d!65283 (= lt!295711 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65283 (= lt!295710 ((_ sign_extend 32) (size!4371 (buf!4845 thiss!1204))))))

(assert (=> d!65283 (= lt!295707 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9117 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9112 thiss!1204))))))

(assert (=> d!65283 (invariant!0 (currentBit!9112 thiss!1204) (currentByte!9117 thiss!1204) (size!4371 (buf!4845 thiss!1204)))))

(assert (=> d!65283 (= (bitIndex!0 (size!4371 (buf!4845 thiss!1204)) (currentByte!9117 thiss!1204) (currentBit!9112 thiss!1204)) lt!295707)))

(declare-fun b!190507 () Bool)

(declare-fun res!158941 () Bool)

(assert (=> b!190507 (=> (not res!158941) (not e!131441))))

(assert (=> b!190507 (= res!158941 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!295707))))

(declare-fun b!190508 () Bool)

(declare-fun lt!295708 () (_ BitVec 64))

(assert (=> b!190508 (= e!131441 (bvsle lt!295707 (bvmul lt!295708 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!190508 (or (= lt!295708 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!295708 #b0000000000000000000000000000000000000000000000000000000000001000) lt!295708)))))

(assert (=> b!190508 (= lt!295708 ((_ sign_extend 32) (size!4371 (buf!4845 thiss!1204))))))

(assert (= (and d!65283 res!158942) b!190507))

(assert (= (and b!190507 res!158941) b!190508))

(declare-fun m!295881 () Bool)

(assert (=> d!65283 m!295881))

(assert (=> d!65283 m!295595))

(assert (=> b!190356 d!65283))

(declare-fun b!190545 () Bool)

(declare-fun e!131459 () Bool)

(declare-fun e!131458 () Bool)

(assert (=> b!190545 (= e!131459 e!131458)))

(declare-fun res!158976 () Bool)

(assert (=> b!190545 (=> (not res!158976) (not e!131458))))

(declare-fun lt!295772 () tuple2!16476)

(declare-fun lt!295770 () tuple2!16482)

(assert (=> b!190545 (= res!158976 (and (= (_2!8886 lt!295770) lt!295322) (= (_1!8886 lt!295770) (_2!8883 lt!295772))))))

(assert (=> b!190545 (= lt!295770 (readBitPure!0 (readerFrom!0 (_2!8883 lt!295772) (currentBit!9112 thiss!1204) (currentByte!9117 thiss!1204))))))

(declare-fun b!190544 () Bool)

(declare-fun res!158973 () Bool)

(assert (=> b!190544 (=> (not res!158973) (not e!131459))))

(assert (=> b!190544 (= res!158973 (isPrefixOf!0 thiss!1204 (_2!8883 lt!295772)))))

(declare-fun d!65287 () Bool)

(assert (=> d!65287 e!131459))

(declare-fun res!158974 () Bool)

(assert (=> d!65287 (=> (not res!158974) (not e!131459))))

(assert (=> d!65287 (= res!158974 (= (size!4371 (buf!4845 thiss!1204)) (size!4371 (buf!4845 (_2!8883 lt!295772)))))))

(declare-fun choose!16 (BitStream!7850 Bool) tuple2!16476)

(assert (=> d!65287 (= lt!295772 (choose!16 thiss!1204 lt!295322))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!65287 (validate_offset_bit!0 ((_ sign_extend 32) (size!4371 (buf!4845 thiss!1204))) ((_ sign_extend 32) (currentByte!9117 thiss!1204)) ((_ sign_extend 32) (currentBit!9112 thiss!1204)))))

(assert (=> d!65287 (= (appendBit!0 thiss!1204 lt!295322) lt!295772)))

(declare-fun b!190546 () Bool)

(assert (=> b!190546 (= e!131458 (= (bitIndex!0 (size!4371 (buf!4845 (_1!8886 lt!295770))) (currentByte!9117 (_1!8886 lt!295770)) (currentBit!9112 (_1!8886 lt!295770))) (bitIndex!0 (size!4371 (buf!4845 (_2!8883 lt!295772))) (currentByte!9117 (_2!8883 lt!295772)) (currentBit!9112 (_2!8883 lt!295772)))))))

(declare-fun b!190543 () Bool)

(declare-fun res!158975 () Bool)

(assert (=> b!190543 (=> (not res!158975) (not e!131459))))

(declare-fun lt!295769 () (_ BitVec 64))

(declare-fun lt!295771 () (_ BitVec 64))

(assert (=> b!190543 (= res!158975 (= (bitIndex!0 (size!4371 (buf!4845 (_2!8883 lt!295772))) (currentByte!9117 (_2!8883 lt!295772)) (currentBit!9112 (_2!8883 lt!295772))) (bvadd lt!295771 lt!295769)))))

(assert (=> b!190543 (or (not (= (bvand lt!295771 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!295769 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!295771 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!295771 lt!295769) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!190543 (= lt!295769 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!190543 (= lt!295771 (bitIndex!0 (size!4371 (buf!4845 thiss!1204)) (currentByte!9117 thiss!1204) (currentBit!9112 thiss!1204)))))

(assert (= (and d!65287 res!158974) b!190543))

(assert (= (and b!190543 res!158975) b!190544))

(assert (= (and b!190544 res!158973) b!190545))

(assert (= (and b!190545 res!158976) b!190546))

(declare-fun m!295945 () Bool)

(assert (=> b!190546 m!295945))

(declare-fun m!295947 () Bool)

(assert (=> b!190546 m!295947))

(declare-fun m!295949 () Bool)

(assert (=> b!190545 m!295949))

(assert (=> b!190545 m!295949))

(declare-fun m!295951 () Bool)

(assert (=> b!190545 m!295951))

(declare-fun m!295953 () Bool)

(assert (=> d!65287 m!295953))

(declare-fun m!295957 () Bool)

(assert (=> d!65287 m!295957))

(declare-fun m!295961 () Bool)

(assert (=> b!190544 m!295961))

(assert (=> b!190543 m!295947))

(assert (=> b!190543 m!295603))

(assert (=> b!190356 d!65287))

(declare-fun d!65315 () Bool)

(declare-fun e!131462 () Bool)

(assert (=> d!65315 e!131462))

(declare-fun res!158982 () Bool)

(assert (=> d!65315 (=> (not res!158982) (not e!131462))))

(declare-fun lt!295790 () (_ BitVec 64))

(declare-fun lt!295785 () (_ BitVec 64))

(declare-fun lt!295787 () (_ BitVec 64))

(assert (=> d!65315 (= res!158982 (= lt!295785 (bvsub lt!295790 lt!295787)))))

(assert (=> d!65315 (or (= (bvand lt!295790 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!295787 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!295790 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!295790 lt!295787) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65315 (= lt!295787 (remainingBits!0 ((_ sign_extend 32) (size!4371 (buf!4845 (_1!8885 lt!295323)))) ((_ sign_extend 32) (currentByte!9117 (_1!8885 lt!295323))) ((_ sign_extend 32) (currentBit!9112 (_1!8885 lt!295323)))))))

(declare-fun lt!295788 () (_ BitVec 64))

(declare-fun lt!295789 () (_ BitVec 64))

(assert (=> d!65315 (= lt!295790 (bvmul lt!295788 lt!295789))))

(assert (=> d!65315 (or (= lt!295788 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!295789 (bvsdiv (bvmul lt!295788 lt!295789) lt!295788)))))

(assert (=> d!65315 (= lt!295789 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65315 (= lt!295788 ((_ sign_extend 32) (size!4371 (buf!4845 (_1!8885 lt!295323)))))))

(assert (=> d!65315 (= lt!295785 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9117 (_1!8885 lt!295323))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9112 (_1!8885 lt!295323)))))))

(assert (=> d!65315 (invariant!0 (currentBit!9112 (_1!8885 lt!295323)) (currentByte!9117 (_1!8885 lt!295323)) (size!4371 (buf!4845 (_1!8885 lt!295323))))))

(assert (=> d!65315 (= (bitIndex!0 (size!4371 (buf!4845 (_1!8885 lt!295323))) (currentByte!9117 (_1!8885 lt!295323)) (currentBit!9112 (_1!8885 lt!295323))) lt!295785)))

(declare-fun b!190551 () Bool)

(declare-fun res!158981 () Bool)

(assert (=> b!190551 (=> (not res!158981) (not e!131462))))

(assert (=> b!190551 (= res!158981 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!295785))))

(declare-fun b!190552 () Bool)

(declare-fun lt!295786 () (_ BitVec 64))

(assert (=> b!190552 (= e!131462 (bvsle lt!295785 (bvmul lt!295786 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!190552 (or (= lt!295786 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!295786 #b0000000000000000000000000000000000000000000000000000000000001000) lt!295786)))))

(assert (=> b!190552 (= lt!295786 ((_ sign_extend 32) (size!4371 (buf!4845 (_1!8885 lt!295323)))))))

(assert (= (and d!65315 res!158982) b!190551))

(assert (= (and b!190551 res!158981) b!190552))

(declare-fun m!295967 () Bool)

(assert (=> d!65315 m!295967))

(declare-fun m!295969 () Bool)

(assert (=> d!65315 m!295969))

(assert (=> b!190376 d!65315))

(declare-fun d!65319 () Bool)

(declare-fun e!131464 () Bool)

(assert (=> d!65319 e!131464))

(declare-fun res!158986 () Bool)

(assert (=> d!65319 (=> (not res!158986) (not e!131464))))

(declare-fun lt!295797 () (_ BitVec 64))

(declare-fun lt!295799 () (_ BitVec 64))

(declare-fun lt!295802 () (_ BitVec 64))

(assert (=> d!65319 (= res!158986 (= lt!295797 (bvsub lt!295802 lt!295799)))))

(assert (=> d!65319 (or (= (bvand lt!295802 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!295799 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!295802 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!295802 lt!295799) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65319 (= lt!295799 (remainingBits!0 ((_ sign_extend 32) (size!4371 (buf!4845 (_2!8884 lt!295339)))) ((_ sign_extend 32) (currentByte!9117 (_2!8884 lt!295339))) ((_ sign_extend 32) (currentBit!9112 (_2!8884 lt!295339)))))))

(declare-fun lt!295800 () (_ BitVec 64))

(declare-fun lt!295801 () (_ BitVec 64))

(assert (=> d!65319 (= lt!295802 (bvmul lt!295800 lt!295801))))

(assert (=> d!65319 (or (= lt!295800 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!295801 (bvsdiv (bvmul lt!295800 lt!295801) lt!295800)))))

(assert (=> d!65319 (= lt!295801 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65319 (= lt!295800 ((_ sign_extend 32) (size!4371 (buf!4845 (_2!8884 lt!295339)))))))

(assert (=> d!65319 (= lt!295797 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9117 (_2!8884 lt!295339))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9112 (_2!8884 lt!295339)))))))

(assert (=> d!65319 (invariant!0 (currentBit!9112 (_2!8884 lt!295339)) (currentByte!9117 (_2!8884 lt!295339)) (size!4371 (buf!4845 (_2!8884 lt!295339))))))

(assert (=> d!65319 (= (bitIndex!0 (size!4371 (buf!4845 (_2!8884 lt!295339))) (currentByte!9117 (_2!8884 lt!295339)) (currentBit!9112 (_2!8884 lt!295339))) lt!295797)))

(declare-fun b!190555 () Bool)

(declare-fun res!158985 () Bool)

(assert (=> b!190555 (=> (not res!158985) (not e!131464))))

(assert (=> b!190555 (= res!158985 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!295797))))

(declare-fun b!190556 () Bool)

(declare-fun lt!295798 () (_ BitVec 64))

(assert (=> b!190556 (= e!131464 (bvsle lt!295797 (bvmul lt!295798 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!190556 (or (= lt!295798 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!295798 #b0000000000000000000000000000000000000000000000000000000000001000) lt!295798)))))

(assert (=> b!190556 (= lt!295798 ((_ sign_extend 32) (size!4371 (buf!4845 (_2!8884 lt!295339)))))))

(assert (= (and d!65319 res!158986) b!190555))

(assert (= (and b!190555 res!158985) b!190556))

(declare-fun m!295973 () Bool)

(assert (=> d!65319 m!295973))

(declare-fun m!295975 () Bool)

(assert (=> d!65319 m!295975))

(assert (=> b!190376 d!65319))

(declare-fun d!65323 () Bool)

(declare-fun res!158996 () Bool)

(declare-fun e!131471 () Bool)

(assert (=> d!65323 (=> (not res!158996) (not e!131471))))

(assert (=> d!65323 (= res!158996 (= (size!4371 (buf!4845 thiss!1204)) (size!4371 (buf!4845 (_2!8883 lt!295325)))))))

(assert (=> d!65323 (= (isPrefixOf!0 thiss!1204 (_2!8883 lt!295325)) e!131471)))

(declare-fun b!190566 () Bool)

(declare-fun res!158997 () Bool)

(assert (=> b!190566 (=> (not res!158997) (not e!131471))))

(assert (=> b!190566 (= res!158997 (bvsle (bitIndex!0 (size!4371 (buf!4845 thiss!1204)) (currentByte!9117 thiss!1204) (currentBit!9112 thiss!1204)) (bitIndex!0 (size!4371 (buf!4845 (_2!8883 lt!295325))) (currentByte!9117 (_2!8883 lt!295325)) (currentBit!9112 (_2!8883 lt!295325)))))))

(declare-fun b!190567 () Bool)

(declare-fun e!131472 () Bool)

(assert (=> b!190567 (= e!131471 e!131472)))

(declare-fun res!158998 () Bool)

(assert (=> b!190567 (=> res!158998 e!131472)))

(assert (=> b!190567 (= res!158998 (= (size!4371 (buf!4845 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!190568 () Bool)

(declare-fun arrayBitRangesEq!0 (array!9912 array!9912 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!190568 (= e!131472 (arrayBitRangesEq!0 (buf!4845 thiss!1204) (buf!4845 (_2!8883 lt!295325)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4371 (buf!4845 thiss!1204)) (currentByte!9117 thiss!1204) (currentBit!9112 thiss!1204))))))

(assert (= (and d!65323 res!158996) b!190566))

(assert (= (and b!190566 res!158997) b!190567))

(assert (= (and b!190567 (not res!158998)) b!190568))

(assert (=> b!190566 m!295603))

(assert (=> b!190566 m!295601))

(assert (=> b!190568 m!295603))

(assert (=> b!190568 m!295603))

(declare-fun m!295981 () Bool)

(assert (=> b!190568 m!295981))

(assert (=> b!190366 d!65323))

(declare-fun d!65329 () Bool)

(declare-fun lt!295821 () tuple2!16480)

(declare-fun lt!295819 () tuple2!16480)

(assert (=> d!65329 (and (= (_2!8885 lt!295821) (_2!8885 lt!295819)) (= (_1!8885 lt!295821) (_1!8885 lt!295819)))))

(declare-fun lt!295820 () Bool)

(declare-fun lt!295822 () Unit!13541)

(declare-fun lt!295818 () BitStream!7850)

(declare-fun lt!295823 () (_ BitVec 64))

(declare-fun choose!56 (BitStream!7850 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!16480 tuple2!16480 BitStream!7850 (_ BitVec 64) Bool BitStream!7850 (_ BitVec 64) tuple2!16480 tuple2!16480 BitStream!7850 (_ BitVec 64)) Unit!13541)

(assert (=> d!65329 (= lt!295822 (choose!56 (_1!8884 lt!295339) nBits!348 i!590 lt!295334 lt!295821 (tuple2!16481 (_1!8885 lt!295821) (_2!8885 lt!295821)) (_1!8885 lt!295821) (_2!8885 lt!295821) lt!295820 lt!295818 lt!295823 lt!295819 (tuple2!16481 (_1!8885 lt!295819) (_2!8885 lt!295819)) (_1!8885 lt!295819) (_2!8885 lt!295819)))))

(assert (=> d!65329 (= lt!295819 (readNBitsLSBFirstsLoopPure!0 lt!295818 nBits!348 (bvadd i!590 #b00000000000000000000000000000001) lt!295823))))

(assert (=> d!65329 (= lt!295823 (bvor lt!295334 (ite lt!295820 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65329 (= lt!295818 (withMovedBitIndex!0 (_1!8884 lt!295339) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!65329 (= lt!295820 (_2!8886 (readBitPure!0 (_1!8884 lt!295339))))))

(assert (=> d!65329 (= lt!295821 (readNBitsLSBFirstsLoopPure!0 (_1!8884 lt!295339) nBits!348 i!590 lt!295334))))

(assert (=> d!65329 (= (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8884 lt!295339) nBits!348 i!590 lt!295334) lt!295822)))

(declare-fun bs!16240 () Bool)

(assert (= bs!16240 d!65329))

(assert (=> bs!16240 m!295611))

(declare-fun m!295983 () Bool)

(assert (=> bs!16240 m!295983))

(assert (=> bs!16240 m!295549))

(declare-fun m!295985 () Bool)

(assert (=> bs!16240 m!295985))

(assert (=> bs!16240 m!295553))

(assert (=> b!190355 d!65329))

(declare-datatypes ((tuple2!16492 0))(
  ( (tuple2!16493 (_1!8891 (_ BitVec 64)) (_2!8891 BitStream!7850)) )
))
(declare-fun lt!295826 () tuple2!16492)

(declare-fun d!65331 () Bool)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!7850 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16492)

(assert (=> d!65331 (= lt!295826 (readNBitsLSBFirstsLoop!0 lt!295333 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!295319))))

(assert (=> d!65331 (= (readNBitsLSBFirstsLoopPure!0 lt!295333 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!295319) (tuple2!16481 (_2!8891 lt!295826) (_1!8891 lt!295826)))))

(declare-fun bs!16241 () Bool)

(assert (= bs!16241 d!65331))

(declare-fun m!295987 () Bool)

(assert (=> bs!16241 m!295987))

(assert (=> b!190355 d!65331))

(declare-fun d!65333 () Bool)

(declare-fun e!131473 () Bool)

(assert (=> d!65333 e!131473))

(declare-fun res!158999 () Bool)

(assert (=> d!65333 (=> (not res!158999) (not e!131473))))

(declare-fun lt!295828 () (_ BitVec 64))

(declare-fun lt!295827 () BitStream!7850)

(assert (=> d!65333 (= res!158999 (= (bvadd lt!295828 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4371 (buf!4845 lt!295827)) (currentByte!9117 lt!295827) (currentBit!9112 lt!295827))))))

(assert (=> d!65333 (or (not (= (bvand lt!295828 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!295828 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!295828 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65333 (= lt!295828 (bitIndex!0 (size!4371 (buf!4845 (_1!8884 lt!295339))) (currentByte!9117 (_1!8884 lt!295339)) (currentBit!9112 (_1!8884 lt!295339))))))

(assert (=> d!65333 (= lt!295827 (_2!8883 (moveBitIndex!0 (_1!8884 lt!295339) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!65333 (moveBitIndexPrecond!0 (_1!8884 lt!295339) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!65333 (= (withMovedBitIndex!0 (_1!8884 lt!295339) #b0000000000000000000000000000000000000000000000000000000000000001) lt!295827)))

(declare-fun b!190569 () Bool)

(assert (=> b!190569 (= e!131473 (= (size!4371 (buf!4845 (_1!8884 lt!295339))) (size!4371 (buf!4845 lt!295827))))))

(assert (= (and d!65333 res!158999) b!190569))

(declare-fun m!295989 () Bool)

(assert (=> d!65333 m!295989))

(declare-fun m!295991 () Bool)

(assert (=> d!65333 m!295991))

(declare-fun m!295993 () Bool)

(assert (=> d!65333 m!295993))

(declare-fun m!295995 () Bool)

(assert (=> d!65333 m!295995))

(assert (=> b!190355 d!65333))

(declare-fun d!65335 () Bool)

(declare-datatypes ((tuple2!16494 0))(
  ( (tuple2!16495 (_1!8892 Bool) (_2!8892 BitStream!7850)) )
))
(declare-fun lt!295831 () tuple2!16494)

(declare-fun readBit!0 (BitStream!7850) tuple2!16494)

(assert (=> d!65335 (= lt!295831 (readBit!0 (readerFrom!0 (_2!8883 lt!295325) (currentBit!9112 thiss!1204) (currentByte!9117 thiss!1204))))))

(assert (=> d!65335 (= (readBitPure!0 (readerFrom!0 (_2!8883 lt!295325) (currentBit!9112 thiss!1204) (currentByte!9117 thiss!1204))) (tuple2!16483 (_2!8892 lt!295831) (_1!8892 lt!295831)))))

(declare-fun bs!16242 () Bool)

(assert (= bs!16242 d!65335))

(assert (=> bs!16242 m!295597))

(declare-fun m!295997 () Bool)

(assert (=> bs!16242 m!295997))

(assert (=> b!190364 d!65335))

(declare-fun d!65337 () Bool)

(declare-fun e!131476 () Bool)

(assert (=> d!65337 e!131476))

(declare-fun res!159003 () Bool)

(assert (=> d!65337 (=> (not res!159003) (not e!131476))))

(assert (=> d!65337 (= res!159003 (invariant!0 (currentBit!9112 (_2!8883 lt!295325)) (currentByte!9117 (_2!8883 lt!295325)) (size!4371 (buf!4845 (_2!8883 lt!295325)))))))

(assert (=> d!65337 (= (readerFrom!0 (_2!8883 lt!295325) (currentBit!9112 thiss!1204) (currentByte!9117 thiss!1204)) (BitStream!7851 (buf!4845 (_2!8883 lt!295325)) (currentByte!9117 thiss!1204) (currentBit!9112 thiss!1204)))))

(declare-fun b!190572 () Bool)

(assert (=> b!190572 (= e!131476 (invariant!0 (currentBit!9112 thiss!1204) (currentByte!9117 thiss!1204) (size!4371 (buf!4845 (_2!8883 lt!295325)))))))

(assert (= (and d!65337 res!159003) b!190572))

(assert (=> d!65337 m!295849))

(assert (=> b!190572 m!295579))

(assert (=> b!190364 d!65337))

(declare-fun d!65339 () Bool)

(declare-fun res!159004 () Bool)

(declare-fun e!131477 () Bool)

(assert (=> d!65339 (=> (not res!159004) (not e!131477))))

(assert (=> d!65339 (= res!159004 (= (size!4371 (buf!4845 (_2!8883 lt!295325))) (size!4371 (buf!4845 (_2!8883 lt!295314)))))))

(assert (=> d!65339 (= (isPrefixOf!0 (_2!8883 lt!295325) (_2!8883 lt!295314)) e!131477)))

(declare-fun b!190573 () Bool)

(declare-fun res!159005 () Bool)

(assert (=> b!190573 (=> (not res!159005) (not e!131477))))

(assert (=> b!190573 (= res!159005 (bvsle (bitIndex!0 (size!4371 (buf!4845 (_2!8883 lt!295325))) (currentByte!9117 (_2!8883 lt!295325)) (currentBit!9112 (_2!8883 lt!295325))) (bitIndex!0 (size!4371 (buf!4845 (_2!8883 lt!295314))) (currentByte!9117 (_2!8883 lt!295314)) (currentBit!9112 (_2!8883 lt!295314)))))))

(declare-fun b!190574 () Bool)

(declare-fun e!131478 () Bool)

(assert (=> b!190574 (= e!131477 e!131478)))

(declare-fun res!159006 () Bool)

(assert (=> b!190574 (=> res!159006 e!131478)))

(assert (=> b!190574 (= res!159006 (= (size!4371 (buf!4845 (_2!8883 lt!295325))) #b00000000000000000000000000000000))))

(declare-fun b!190575 () Bool)

(assert (=> b!190575 (= e!131478 (arrayBitRangesEq!0 (buf!4845 (_2!8883 lt!295325)) (buf!4845 (_2!8883 lt!295314)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4371 (buf!4845 (_2!8883 lt!295325))) (currentByte!9117 (_2!8883 lt!295325)) (currentBit!9112 (_2!8883 lt!295325)))))))

(assert (= (and d!65339 res!159004) b!190573))

(assert (= (and b!190573 res!159005) b!190574))

(assert (= (and b!190574 (not res!159006)) b!190575))

(assert (=> b!190573 m!295601))

(assert (=> b!190573 m!295581))

(assert (=> b!190575 m!295601))

(assert (=> b!190575 m!295601))

(declare-fun m!295999 () Bool)

(assert (=> b!190575 m!295999))

(assert (=> b!190354 d!65339))

(assert (=> b!190375 d!65323))

(declare-fun d!65341 () Bool)

(assert (=> d!65341 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4371 (buf!4845 (_1!8884 lt!295339)))) ((_ sign_extend 32) (currentByte!9117 (_1!8884 lt!295339))) ((_ sign_extend 32) (currentBit!9112 (_1!8884 lt!295339))) lt!295317) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4371 (buf!4845 (_1!8884 lt!295339)))) ((_ sign_extend 32) (currentByte!9117 (_1!8884 lt!295339))) ((_ sign_extend 32) (currentBit!9112 (_1!8884 lt!295339)))) lt!295317))))

(declare-fun bs!16243 () Bool)

(assert (= bs!16243 d!65341))

(declare-fun m!296001 () Bool)

(assert (=> bs!16243 m!296001))

(assert (=> b!190373 d!65341))

(declare-fun lt!295891 () (_ BitVec 64))

(declare-fun lt!295884 () tuple2!16478)

(declare-fun lt!295877 () (_ BitVec 64))

(declare-fun b!190586 () Bool)

(declare-fun e!131483 () Bool)

(assert (=> b!190586 (= e!131483 (= (_1!8884 lt!295884) (withMovedBitIndex!0 (_2!8884 lt!295884) (bvsub lt!295877 lt!295891))))))

(assert (=> b!190586 (or (= (bvand lt!295877 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!295891 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!295877 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!295877 lt!295891) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!190586 (= lt!295891 (bitIndex!0 (size!4371 (buf!4845 (_2!8883 lt!295314))) (currentByte!9117 (_2!8883 lt!295314)) (currentBit!9112 (_2!8883 lt!295314))))))

(assert (=> b!190586 (= lt!295877 (bitIndex!0 (size!4371 (buf!4845 (_2!8883 lt!295325))) (currentByte!9117 (_2!8883 lt!295325)) (currentBit!9112 (_2!8883 lt!295325))))))

(declare-fun b!190587 () Bool)

(declare-fun res!159014 () Bool)

(assert (=> b!190587 (=> (not res!159014) (not e!131483))))

(assert (=> b!190587 (= res!159014 (isPrefixOf!0 (_1!8884 lt!295884) (_2!8883 lt!295325)))))

(declare-fun b!190588 () Bool)

(declare-fun res!159015 () Bool)

(assert (=> b!190588 (=> (not res!159015) (not e!131483))))

(assert (=> b!190588 (= res!159015 (isPrefixOf!0 (_2!8884 lt!295884) (_2!8883 lt!295314)))))

(declare-fun b!190589 () Bool)

(declare-fun e!131484 () Unit!13541)

(declare-fun Unit!13569 () Unit!13541)

(assert (=> b!190589 (= e!131484 Unit!13569)))

(declare-fun b!190590 () Bool)

(declare-fun lt!295887 () Unit!13541)

(assert (=> b!190590 (= e!131484 lt!295887)))

(declare-fun lt!295882 () (_ BitVec 64))

(assert (=> b!190590 (= lt!295882 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!295876 () (_ BitVec 64))

(assert (=> b!190590 (= lt!295876 (bitIndex!0 (size!4371 (buf!4845 (_2!8883 lt!295325))) (currentByte!9117 (_2!8883 lt!295325)) (currentBit!9112 (_2!8883 lt!295325))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!9912 array!9912 (_ BitVec 64) (_ BitVec 64)) Unit!13541)

(assert (=> b!190590 (= lt!295887 (arrayBitRangesEqSymmetric!0 (buf!4845 (_2!8883 lt!295325)) (buf!4845 (_2!8883 lt!295314)) lt!295882 lt!295876))))

(assert (=> b!190590 (arrayBitRangesEq!0 (buf!4845 (_2!8883 lt!295314)) (buf!4845 (_2!8883 lt!295325)) lt!295882 lt!295876)))

(declare-fun d!65343 () Bool)

(assert (=> d!65343 e!131483))

(declare-fun res!159013 () Bool)

(assert (=> d!65343 (=> (not res!159013) (not e!131483))))

(assert (=> d!65343 (= res!159013 (isPrefixOf!0 (_1!8884 lt!295884) (_2!8884 lt!295884)))))

(declare-fun lt!295873 () BitStream!7850)

(assert (=> d!65343 (= lt!295884 (tuple2!16479 lt!295873 (_2!8883 lt!295314)))))

(declare-fun lt!295890 () Unit!13541)

(declare-fun lt!295885 () Unit!13541)

(assert (=> d!65343 (= lt!295890 lt!295885)))

(assert (=> d!65343 (isPrefixOf!0 lt!295873 (_2!8883 lt!295314))))

(assert (=> d!65343 (= lt!295885 (lemmaIsPrefixTransitive!0 lt!295873 (_2!8883 lt!295314) (_2!8883 lt!295314)))))

(declare-fun lt!295881 () Unit!13541)

(declare-fun lt!295880 () Unit!13541)

(assert (=> d!65343 (= lt!295881 lt!295880)))

(assert (=> d!65343 (isPrefixOf!0 lt!295873 (_2!8883 lt!295314))))

(assert (=> d!65343 (= lt!295880 (lemmaIsPrefixTransitive!0 lt!295873 (_2!8883 lt!295325) (_2!8883 lt!295314)))))

(declare-fun lt!295879 () Unit!13541)

(assert (=> d!65343 (= lt!295879 e!131484)))

(declare-fun c!9630 () Bool)

(assert (=> d!65343 (= c!9630 (not (= (size!4371 (buf!4845 (_2!8883 lt!295325))) #b00000000000000000000000000000000)))))

(declare-fun lt!295878 () Unit!13541)

(declare-fun lt!295872 () Unit!13541)

(assert (=> d!65343 (= lt!295878 lt!295872)))

(assert (=> d!65343 (isPrefixOf!0 (_2!8883 lt!295314) (_2!8883 lt!295314))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7850) Unit!13541)

(assert (=> d!65343 (= lt!295872 (lemmaIsPrefixRefl!0 (_2!8883 lt!295314)))))

(declare-fun lt!295875 () Unit!13541)

(declare-fun lt!295883 () Unit!13541)

(assert (=> d!65343 (= lt!295875 lt!295883)))

(assert (=> d!65343 (= lt!295883 (lemmaIsPrefixRefl!0 (_2!8883 lt!295314)))))

(declare-fun lt!295889 () Unit!13541)

(declare-fun lt!295886 () Unit!13541)

(assert (=> d!65343 (= lt!295889 lt!295886)))

(assert (=> d!65343 (isPrefixOf!0 lt!295873 lt!295873)))

(assert (=> d!65343 (= lt!295886 (lemmaIsPrefixRefl!0 lt!295873))))

(declare-fun lt!295888 () Unit!13541)

(declare-fun lt!295874 () Unit!13541)

(assert (=> d!65343 (= lt!295888 lt!295874)))

(assert (=> d!65343 (isPrefixOf!0 (_2!8883 lt!295325) (_2!8883 lt!295325))))

(assert (=> d!65343 (= lt!295874 (lemmaIsPrefixRefl!0 (_2!8883 lt!295325)))))

(assert (=> d!65343 (= lt!295873 (BitStream!7851 (buf!4845 (_2!8883 lt!295314)) (currentByte!9117 (_2!8883 lt!295325)) (currentBit!9112 (_2!8883 lt!295325))))))

(assert (=> d!65343 (isPrefixOf!0 (_2!8883 lt!295325) (_2!8883 lt!295314))))

(assert (=> d!65343 (= (reader!0 (_2!8883 lt!295325) (_2!8883 lt!295314)) lt!295884)))

(assert (= (and d!65343 c!9630) b!190590))

(assert (= (and d!65343 (not c!9630)) b!190589))

(assert (= (and d!65343 res!159013) b!190587))

(assert (= (and b!190587 res!159014) b!190588))

(assert (= (and b!190588 res!159015) b!190586))

(declare-fun m!296003 () Bool)

(assert (=> b!190588 m!296003))

(declare-fun m!296005 () Bool)

(assert (=> b!190586 m!296005))

(assert (=> b!190586 m!295581))

(assert (=> b!190586 m!295601))

(declare-fun m!296007 () Bool)

(assert (=> b!190587 m!296007))

(assert (=> b!190590 m!295601))

(declare-fun m!296009 () Bool)

(assert (=> b!190590 m!296009))

(declare-fun m!296011 () Bool)

(assert (=> b!190590 m!296011))

(declare-fun m!296013 () Bool)

(assert (=> d!65343 m!296013))

(declare-fun m!296015 () Bool)

(assert (=> d!65343 m!296015))

(declare-fun m!296017 () Bool)

(assert (=> d!65343 m!296017))

(declare-fun m!296019 () Bool)

(assert (=> d!65343 m!296019))

(declare-fun m!296021 () Bool)

(assert (=> d!65343 m!296021))

(declare-fun m!296023 () Bool)

(assert (=> d!65343 m!296023))

(declare-fun m!296025 () Bool)

(assert (=> d!65343 m!296025))

(declare-fun m!296027 () Bool)

(assert (=> d!65343 m!296027))

(assert (=> d!65343 m!295547))

(declare-fun m!296029 () Bool)

(assert (=> d!65343 m!296029))

(declare-fun m!296031 () Bool)

(assert (=> d!65343 m!296031))

(assert (=> b!190374 d!65343))

(declare-fun d!65345 () Bool)

(assert (=> d!65345 (validate_offset_bits!1 ((_ sign_extend 32) (size!4371 (buf!4845 (_2!8883 lt!295314)))) ((_ sign_extend 32) (currentByte!9117 thiss!1204)) ((_ sign_extend 32) (currentBit!9112 thiss!1204)) lt!295317)))

(declare-fun lt!295894 () Unit!13541)

(declare-fun choose!9 (BitStream!7850 array!9912 (_ BitVec 64) BitStream!7850) Unit!13541)

(assert (=> d!65345 (= lt!295894 (choose!9 thiss!1204 (buf!4845 (_2!8883 lt!295314)) lt!295317 (BitStream!7851 (buf!4845 (_2!8883 lt!295314)) (currentByte!9117 thiss!1204) (currentBit!9112 thiss!1204))))))

(assert (=> d!65345 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4845 (_2!8883 lt!295314)) lt!295317) lt!295894)))

(declare-fun bs!16244 () Bool)

(assert (= bs!16244 d!65345))

(assert (=> bs!16244 m!295563))

(declare-fun m!296033 () Bool)

(assert (=> bs!16244 m!296033))

(assert (=> b!190374 d!65345))

(declare-fun d!65347 () Bool)

(declare-fun lt!295895 () tuple2!16494)

(assert (=> d!65347 (= lt!295895 (readBit!0 lt!295327))))

(assert (=> d!65347 (= (readBitPure!0 lt!295327) (tuple2!16483 (_2!8892 lt!295895) (_1!8892 lt!295895)))))

(declare-fun bs!16245 () Bool)

(assert (= bs!16245 d!65347))

(declare-fun m!296035 () Bool)

(assert (=> bs!16245 m!296035))

(assert (=> b!190374 d!65347))

(declare-fun d!65349 () Bool)

(assert (=> d!65349 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4371 (buf!4845 (_2!8883 lt!295314)))) ((_ sign_extend 32) (currentByte!9117 thiss!1204)) ((_ sign_extend 32) (currentBit!9112 thiss!1204)) lt!295317) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4371 (buf!4845 (_2!8883 lt!295314)))) ((_ sign_extend 32) (currentByte!9117 thiss!1204)) ((_ sign_extend 32) (currentBit!9112 thiss!1204))) lt!295317))))

(declare-fun bs!16246 () Bool)

(assert (= bs!16246 d!65349))

(declare-fun m!296037 () Bool)

(assert (=> bs!16246 m!296037))

(assert (=> b!190374 d!65349))

(declare-fun lt!295896 () tuple2!16492)

(declare-fun d!65351 () Bool)

(assert (=> d!65351 (= lt!295896 (readNBitsLSBFirstsLoop!0 (_1!8884 lt!295339) nBits!348 i!590 lt!295334))))

(assert (=> d!65351 (= (readNBitsLSBFirstsLoopPure!0 (_1!8884 lt!295339) nBits!348 i!590 lt!295334) (tuple2!16481 (_2!8891 lt!295896) (_1!8891 lt!295896)))))

(declare-fun bs!16247 () Bool)

(assert (= bs!16247 d!65351))

(declare-fun m!296039 () Bool)

(assert (=> bs!16247 m!296039))

(assert (=> b!190374 d!65351))

(declare-fun d!65353 () Bool)

(assert (=> d!65353 (validate_offset_bits!1 ((_ sign_extend 32) (size!4371 (buf!4845 (_2!8883 lt!295314)))) ((_ sign_extend 32) (currentByte!9117 (_2!8883 lt!295325))) ((_ sign_extend 32) (currentBit!9112 (_2!8883 lt!295325))) lt!295320)))

(declare-fun lt!295897 () Unit!13541)

(assert (=> d!65353 (= lt!295897 (choose!9 (_2!8883 lt!295325) (buf!4845 (_2!8883 lt!295314)) lt!295320 (BitStream!7851 (buf!4845 (_2!8883 lt!295314)) (currentByte!9117 (_2!8883 lt!295325)) (currentBit!9112 (_2!8883 lt!295325)))))))

(assert (=> d!65353 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8883 lt!295325) (buf!4845 (_2!8883 lt!295314)) lt!295320) lt!295897)))

(declare-fun bs!16248 () Bool)

(assert (= bs!16248 d!65353))

(assert (=> bs!16248 m!295567))

(declare-fun m!296041 () Bool)

(assert (=> bs!16248 m!296041))

(assert (=> b!190374 d!65353))

(declare-fun d!65355 () Bool)

(assert (=> d!65355 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4371 (buf!4845 (_2!8883 lt!295314)))) ((_ sign_extend 32) (currentByte!9117 (_2!8883 lt!295325))) ((_ sign_extend 32) (currentBit!9112 (_2!8883 lt!295325))) lt!295320) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4371 (buf!4845 (_2!8883 lt!295314)))) ((_ sign_extend 32) (currentByte!9117 (_2!8883 lt!295325))) ((_ sign_extend 32) (currentBit!9112 (_2!8883 lt!295325)))) lt!295320))))

(declare-fun bs!16249 () Bool)

(assert (= bs!16249 d!65355))

(declare-fun m!296043 () Bool)

(assert (=> bs!16249 m!296043))

(assert (=> b!190374 d!65355))

(declare-fun d!65357 () Bool)

(declare-fun lt!295898 () tuple2!16494)

(assert (=> d!65357 (= lt!295898 (readBit!0 (_1!8884 lt!295339)))))

(assert (=> d!65357 (= (readBitPure!0 (_1!8884 lt!295339)) (tuple2!16483 (_2!8892 lt!295898) (_1!8892 lt!295898)))))

(declare-fun bs!16250 () Bool)

(assert (= bs!16250 d!65357))

(declare-fun m!296045 () Bool)

(assert (=> bs!16250 m!296045))

(assert (=> b!190374 d!65357))

(declare-fun d!65359 () Bool)

(declare-fun e!131485 () Bool)

(assert (=> d!65359 e!131485))

(declare-fun res!159017 () Bool)

(assert (=> d!65359 (=> (not res!159017) (not e!131485))))

(declare-fun lt!295904 () (_ BitVec 64))

(declare-fun lt!295899 () (_ BitVec 64))

(declare-fun lt!295901 () (_ BitVec 64))

(assert (=> d!65359 (= res!159017 (= lt!295899 (bvsub lt!295904 lt!295901)))))

(assert (=> d!65359 (or (= (bvand lt!295904 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!295901 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!295904 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!295904 lt!295901) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65359 (= lt!295901 (remainingBits!0 ((_ sign_extend 32) (size!4371 (buf!4845 (_1!8886 lt!295338)))) ((_ sign_extend 32) (currentByte!9117 (_1!8886 lt!295338))) ((_ sign_extend 32) (currentBit!9112 (_1!8886 lt!295338)))))))

(declare-fun lt!295902 () (_ BitVec 64))

(declare-fun lt!295903 () (_ BitVec 64))

(assert (=> d!65359 (= lt!295904 (bvmul lt!295902 lt!295903))))

(assert (=> d!65359 (or (= lt!295902 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!295903 (bvsdiv (bvmul lt!295902 lt!295903) lt!295902)))))

(assert (=> d!65359 (= lt!295903 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65359 (= lt!295902 ((_ sign_extend 32) (size!4371 (buf!4845 (_1!8886 lt!295338)))))))

(assert (=> d!65359 (= lt!295899 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9117 (_1!8886 lt!295338))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9112 (_1!8886 lt!295338)))))))

(assert (=> d!65359 (invariant!0 (currentBit!9112 (_1!8886 lt!295338)) (currentByte!9117 (_1!8886 lt!295338)) (size!4371 (buf!4845 (_1!8886 lt!295338))))))

(assert (=> d!65359 (= (bitIndex!0 (size!4371 (buf!4845 (_1!8886 lt!295338))) (currentByte!9117 (_1!8886 lt!295338)) (currentBit!9112 (_1!8886 lt!295338))) lt!295899)))

(declare-fun b!190591 () Bool)

(declare-fun res!159016 () Bool)

(assert (=> b!190591 (=> (not res!159016) (not e!131485))))

(assert (=> b!190591 (= res!159016 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!295899))))

(declare-fun b!190592 () Bool)

(declare-fun lt!295900 () (_ BitVec 64))

(assert (=> b!190592 (= e!131485 (bvsle lt!295899 (bvmul lt!295900 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!190592 (or (= lt!295900 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!295900 #b0000000000000000000000000000000000000000000000000000000000001000) lt!295900)))))

(assert (=> b!190592 (= lt!295900 ((_ sign_extend 32) (size!4371 (buf!4845 (_1!8886 lt!295338)))))))

(assert (= (and d!65359 res!159017) b!190591))

(assert (= (and b!190591 res!159016) b!190592))

(declare-fun m!296047 () Bool)

(assert (=> d!65359 m!296047))

(declare-fun m!296049 () Bool)

(assert (=> d!65359 m!296049))

(assert (=> b!190374 d!65359))

(declare-fun d!65361 () Bool)

(declare-fun lt!295905 () tuple2!16494)

(assert (=> d!65361 (= lt!295905 (readBit!0 (BitStream!7851 (buf!4845 (_2!8883 lt!295314)) (currentByte!9117 thiss!1204) (currentBit!9112 thiss!1204))))))

(assert (=> d!65361 (= (readBitPure!0 (BitStream!7851 (buf!4845 (_2!8883 lt!295314)) (currentByte!9117 thiss!1204) (currentBit!9112 thiss!1204))) (tuple2!16483 (_2!8892 lt!295905) (_1!8892 lt!295905)))))

(declare-fun bs!16251 () Bool)

(assert (= bs!16251 d!65361))

(declare-fun m!296051 () Bool)

(assert (=> bs!16251 m!296051))

(assert (=> b!190374 d!65361))

(declare-fun d!65363 () Bool)

(declare-fun e!131488 () Bool)

(assert (=> d!65363 e!131488))

(declare-fun res!159020 () Bool)

(assert (=> d!65363 (=> (not res!159020) (not e!131488))))

(declare-fun lt!295914 () tuple2!16482)

(declare-fun lt!295915 () tuple2!16482)

(assert (=> d!65363 (= res!159020 (= (bitIndex!0 (size!4371 (buf!4845 (_1!8886 lt!295914))) (currentByte!9117 (_1!8886 lt!295914)) (currentBit!9112 (_1!8886 lt!295914))) (bitIndex!0 (size!4371 (buf!4845 (_1!8886 lt!295915))) (currentByte!9117 (_1!8886 lt!295915)) (currentBit!9112 (_1!8886 lt!295915)))))))

(declare-fun lt!295917 () Unit!13541)

(declare-fun lt!295916 () BitStream!7850)

(declare-fun choose!50 (BitStream!7850 BitStream!7850 BitStream!7850 tuple2!16482 tuple2!16482 BitStream!7850 Bool tuple2!16482 tuple2!16482 BitStream!7850 Bool) Unit!13541)

(assert (=> d!65363 (= lt!295917 (choose!50 lt!295327 (_2!8883 lt!295314) lt!295916 lt!295914 (tuple2!16483 (_1!8886 lt!295914) (_2!8886 lt!295914)) (_1!8886 lt!295914) (_2!8886 lt!295914) lt!295915 (tuple2!16483 (_1!8886 lt!295915) (_2!8886 lt!295915)) (_1!8886 lt!295915) (_2!8886 lt!295915)))))

(assert (=> d!65363 (= lt!295915 (readBitPure!0 lt!295916))))

(assert (=> d!65363 (= lt!295914 (readBitPure!0 lt!295327))))

(assert (=> d!65363 (= lt!295916 (BitStream!7851 (buf!4845 (_2!8883 lt!295314)) (currentByte!9117 lt!295327) (currentBit!9112 lt!295327)))))

(assert (=> d!65363 (invariant!0 (currentBit!9112 lt!295327) (currentByte!9117 lt!295327) (size!4371 (buf!4845 (_2!8883 lt!295314))))))

(assert (=> d!65363 (= (readBitPrefixLemma!0 lt!295327 (_2!8883 lt!295314)) lt!295917)))

(declare-fun b!190595 () Bool)

(assert (=> b!190595 (= e!131488 (= (_2!8886 lt!295914) (_2!8886 lt!295915)))))

(assert (= (and d!65363 res!159020) b!190595))

(declare-fun m!296053 () Bool)

(assert (=> d!65363 m!296053))

(declare-fun m!296055 () Bool)

(assert (=> d!65363 m!296055))

(declare-fun m!296057 () Bool)

(assert (=> d!65363 m!296057))

(assert (=> d!65363 m!295571))

(declare-fun m!296059 () Bool)

(assert (=> d!65363 m!296059))

(declare-fun m!296061 () Bool)

(assert (=> d!65363 m!296061))

(assert (=> b!190374 d!65363))

(declare-fun d!65365 () Bool)

(assert (=> d!65365 (= (invariant!0 (currentBit!9112 thiss!1204) (currentByte!9117 thiss!1204) (size!4371 (buf!4845 (_2!8883 lt!295325)))) (and (bvsge (currentBit!9112 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9112 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9117 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9117 thiss!1204) (size!4371 (buf!4845 (_2!8883 lt!295325)))) (and (= (currentBit!9112 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9117 thiss!1204) (size!4371 (buf!4845 (_2!8883 lt!295325))))))))))

(assert (=> b!190374 d!65365))

(declare-fun d!65367 () Bool)

(assert (=> d!65367 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!190374 d!65367))

(declare-fun lt!295937 () (_ BitVec 64))

(declare-fun lt!295923 () (_ BitVec 64))

(declare-fun b!190596 () Bool)

(declare-fun lt!295930 () tuple2!16478)

(declare-fun e!131489 () Bool)

(assert (=> b!190596 (= e!131489 (= (_1!8884 lt!295930) (withMovedBitIndex!0 (_2!8884 lt!295930) (bvsub lt!295923 lt!295937))))))

(assert (=> b!190596 (or (= (bvand lt!295923 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!295937 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!295923 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!295923 lt!295937) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!190596 (= lt!295937 (bitIndex!0 (size!4371 (buf!4845 (_2!8883 lt!295314))) (currentByte!9117 (_2!8883 lt!295314)) (currentBit!9112 (_2!8883 lt!295314))))))

(assert (=> b!190596 (= lt!295923 (bitIndex!0 (size!4371 (buf!4845 thiss!1204)) (currentByte!9117 thiss!1204) (currentBit!9112 thiss!1204)))))

(declare-fun b!190597 () Bool)

(declare-fun res!159022 () Bool)

(assert (=> b!190597 (=> (not res!159022) (not e!131489))))

(assert (=> b!190597 (= res!159022 (isPrefixOf!0 (_1!8884 lt!295930) thiss!1204))))

(declare-fun b!190598 () Bool)

(declare-fun res!159023 () Bool)

(assert (=> b!190598 (=> (not res!159023) (not e!131489))))

(assert (=> b!190598 (= res!159023 (isPrefixOf!0 (_2!8884 lt!295930) (_2!8883 lt!295314)))))

(declare-fun b!190599 () Bool)

(declare-fun e!131490 () Unit!13541)

(declare-fun Unit!13570 () Unit!13541)

(assert (=> b!190599 (= e!131490 Unit!13570)))

(declare-fun b!190600 () Bool)

(declare-fun lt!295933 () Unit!13541)

(assert (=> b!190600 (= e!131490 lt!295933)))

(declare-fun lt!295928 () (_ BitVec 64))

(assert (=> b!190600 (= lt!295928 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!295922 () (_ BitVec 64))

(assert (=> b!190600 (= lt!295922 (bitIndex!0 (size!4371 (buf!4845 thiss!1204)) (currentByte!9117 thiss!1204) (currentBit!9112 thiss!1204)))))

(assert (=> b!190600 (= lt!295933 (arrayBitRangesEqSymmetric!0 (buf!4845 thiss!1204) (buf!4845 (_2!8883 lt!295314)) lt!295928 lt!295922))))

(assert (=> b!190600 (arrayBitRangesEq!0 (buf!4845 (_2!8883 lt!295314)) (buf!4845 thiss!1204) lt!295928 lt!295922)))

(declare-fun d!65369 () Bool)

(assert (=> d!65369 e!131489))

(declare-fun res!159021 () Bool)

(assert (=> d!65369 (=> (not res!159021) (not e!131489))))

(assert (=> d!65369 (= res!159021 (isPrefixOf!0 (_1!8884 lt!295930) (_2!8884 lt!295930)))))

(declare-fun lt!295919 () BitStream!7850)

(assert (=> d!65369 (= lt!295930 (tuple2!16479 lt!295919 (_2!8883 lt!295314)))))

(declare-fun lt!295936 () Unit!13541)

(declare-fun lt!295931 () Unit!13541)

(assert (=> d!65369 (= lt!295936 lt!295931)))

(assert (=> d!65369 (isPrefixOf!0 lt!295919 (_2!8883 lt!295314))))

(assert (=> d!65369 (= lt!295931 (lemmaIsPrefixTransitive!0 lt!295919 (_2!8883 lt!295314) (_2!8883 lt!295314)))))

(declare-fun lt!295927 () Unit!13541)

(declare-fun lt!295926 () Unit!13541)

(assert (=> d!65369 (= lt!295927 lt!295926)))

(assert (=> d!65369 (isPrefixOf!0 lt!295919 (_2!8883 lt!295314))))

(assert (=> d!65369 (= lt!295926 (lemmaIsPrefixTransitive!0 lt!295919 thiss!1204 (_2!8883 lt!295314)))))

(declare-fun lt!295925 () Unit!13541)

(assert (=> d!65369 (= lt!295925 e!131490)))

(declare-fun c!9631 () Bool)

(assert (=> d!65369 (= c!9631 (not (= (size!4371 (buf!4845 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!295924 () Unit!13541)

(declare-fun lt!295918 () Unit!13541)

(assert (=> d!65369 (= lt!295924 lt!295918)))

(assert (=> d!65369 (isPrefixOf!0 (_2!8883 lt!295314) (_2!8883 lt!295314))))

(assert (=> d!65369 (= lt!295918 (lemmaIsPrefixRefl!0 (_2!8883 lt!295314)))))

(declare-fun lt!295921 () Unit!13541)

(declare-fun lt!295929 () Unit!13541)

(assert (=> d!65369 (= lt!295921 lt!295929)))

(assert (=> d!65369 (= lt!295929 (lemmaIsPrefixRefl!0 (_2!8883 lt!295314)))))

(declare-fun lt!295935 () Unit!13541)

(declare-fun lt!295932 () Unit!13541)

(assert (=> d!65369 (= lt!295935 lt!295932)))

(assert (=> d!65369 (isPrefixOf!0 lt!295919 lt!295919)))

(assert (=> d!65369 (= lt!295932 (lemmaIsPrefixRefl!0 lt!295919))))

(declare-fun lt!295934 () Unit!13541)

(declare-fun lt!295920 () Unit!13541)

(assert (=> d!65369 (= lt!295934 lt!295920)))

(assert (=> d!65369 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!65369 (= lt!295920 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!65369 (= lt!295919 (BitStream!7851 (buf!4845 (_2!8883 lt!295314)) (currentByte!9117 thiss!1204) (currentBit!9112 thiss!1204)))))

(assert (=> d!65369 (isPrefixOf!0 thiss!1204 (_2!8883 lt!295314))))

(assert (=> d!65369 (= (reader!0 thiss!1204 (_2!8883 lt!295314)) lt!295930)))

(assert (= (and d!65369 c!9631) b!190600))

(assert (= (and d!65369 (not c!9631)) b!190599))

(assert (= (and d!65369 res!159021) b!190597))

(assert (= (and b!190597 res!159022) b!190598))

(assert (= (and b!190598 res!159023) b!190596))

(declare-fun m!296063 () Bool)

(assert (=> b!190598 m!296063))

(declare-fun m!296065 () Bool)

(assert (=> b!190596 m!296065))

(assert (=> b!190596 m!295581))

(assert (=> b!190596 m!295603))

(declare-fun m!296067 () Bool)

(assert (=> b!190597 m!296067))

(assert (=> b!190600 m!295603))

(declare-fun m!296069 () Bool)

(assert (=> b!190600 m!296069))

(declare-fun m!296071 () Bool)

(assert (=> b!190600 m!296071))

(declare-fun m!296073 () Bool)

(assert (=> d!65369 m!296073))

(assert (=> d!65369 m!296015))

(declare-fun m!296075 () Bool)

(assert (=> d!65369 m!296075))

(declare-fun m!296077 () Bool)

(assert (=> d!65369 m!296077))

(declare-fun m!296079 () Bool)

(assert (=> d!65369 m!296079))

(declare-fun m!296081 () Bool)

(assert (=> d!65369 m!296081))

(declare-fun m!296083 () Bool)

(assert (=> d!65369 m!296083))

(declare-fun m!296085 () Bool)

(assert (=> d!65369 m!296085))

(assert (=> d!65369 m!295583))

(declare-fun m!296087 () Bool)

(assert (=> d!65369 m!296087))

(assert (=> d!65369 m!296031))

(assert (=> b!190374 d!65369))

(declare-fun lt!295938 () tuple2!16492)

(declare-fun d!65371 () Bool)

(assert (=> d!65371 (= lt!295938 (readNBitsLSBFirstsLoop!0 (_1!8884 lt!295332) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!295319))))

(assert (=> d!65371 (= (readNBitsLSBFirstsLoopPure!0 (_1!8884 lt!295332) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!295319) (tuple2!16481 (_2!8891 lt!295938) (_1!8891 lt!295938)))))

(declare-fun bs!16252 () Bool)

(assert (= bs!16252 d!65371))

(declare-fun m!296089 () Bool)

(assert (=> bs!16252 m!296089))

(assert (=> b!190374 d!65371))

(declare-fun d!65373 () Bool)

(declare-fun e!131491 () Bool)

(assert (=> d!65373 e!131491))

(declare-fun res!159025 () Bool)

(assert (=> d!65373 (=> (not res!159025) (not e!131491))))

(declare-fun lt!295939 () (_ BitVec 64))

(declare-fun lt!295944 () (_ BitVec 64))

(declare-fun lt!295941 () (_ BitVec 64))

(assert (=> d!65373 (= res!159025 (= lt!295939 (bvsub lt!295944 lt!295941)))))

(assert (=> d!65373 (or (= (bvand lt!295944 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!295941 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!295944 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!295944 lt!295941) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65373 (= lt!295941 (remainingBits!0 ((_ sign_extend 32) (size!4371 (buf!4845 (_1!8886 lt!295318)))) ((_ sign_extend 32) (currentByte!9117 (_1!8886 lt!295318))) ((_ sign_extend 32) (currentBit!9112 (_1!8886 lt!295318)))))))

(declare-fun lt!295942 () (_ BitVec 64))

(declare-fun lt!295943 () (_ BitVec 64))

(assert (=> d!65373 (= lt!295944 (bvmul lt!295942 lt!295943))))

(assert (=> d!65373 (or (= lt!295942 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!295943 (bvsdiv (bvmul lt!295942 lt!295943) lt!295942)))))

(assert (=> d!65373 (= lt!295943 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65373 (= lt!295942 ((_ sign_extend 32) (size!4371 (buf!4845 (_1!8886 lt!295318)))))))

(assert (=> d!65373 (= lt!295939 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9117 (_1!8886 lt!295318))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9112 (_1!8886 lt!295318)))))))

(assert (=> d!65373 (invariant!0 (currentBit!9112 (_1!8886 lt!295318)) (currentByte!9117 (_1!8886 lt!295318)) (size!4371 (buf!4845 (_1!8886 lt!295318))))))

(assert (=> d!65373 (= (bitIndex!0 (size!4371 (buf!4845 (_1!8886 lt!295318))) (currentByte!9117 (_1!8886 lt!295318)) (currentBit!9112 (_1!8886 lt!295318))) lt!295939)))

(declare-fun b!190601 () Bool)

(declare-fun res!159024 () Bool)

(assert (=> b!190601 (=> (not res!159024) (not e!131491))))

(assert (=> b!190601 (= res!159024 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!295939))))

(declare-fun b!190602 () Bool)

(declare-fun lt!295940 () (_ BitVec 64))

(assert (=> b!190602 (= e!131491 (bvsle lt!295939 (bvmul lt!295940 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!190602 (or (= lt!295940 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!295940 #b0000000000000000000000000000000000000000000000000000000000001000) lt!295940)))))

(assert (=> b!190602 (= lt!295940 ((_ sign_extend 32) (size!4371 (buf!4845 (_1!8886 lt!295318)))))))

(assert (= (and d!65373 res!159025) b!190601))

(assert (= (and b!190601 res!159024) b!190602))

(declare-fun m!296091 () Bool)

(assert (=> d!65373 m!296091))

(declare-fun m!296093 () Bool)

(assert (=> d!65373 m!296093))

(assert (=> b!190374 d!65373))

(declare-fun d!65375 () Bool)

(assert (=> d!65375 (= (invariant!0 (currentBit!9112 (_2!8883 lt!295314)) (currentByte!9117 (_2!8883 lt!295314)) (size!4371 (buf!4845 (_2!8883 lt!295314)))) (and (bvsge (currentBit!9112 (_2!8883 lt!295314)) #b00000000000000000000000000000000) (bvslt (currentBit!9112 (_2!8883 lt!295314)) #b00000000000000000000000000001000) (bvsge (currentByte!9117 (_2!8883 lt!295314)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9117 (_2!8883 lt!295314)) (size!4371 (buf!4845 (_2!8883 lt!295314)))) (and (= (currentBit!9112 (_2!8883 lt!295314)) #b00000000000000000000000000000000) (= (currentByte!9117 (_2!8883 lt!295314)) (size!4371 (buf!4845 (_2!8883 lt!295314))))))))))

(assert (=> b!190372 d!65375))

(declare-fun d!65377 () Bool)

(assert (=> d!65377 (= (invariant!0 (currentBit!9112 thiss!1204) (currentByte!9117 thiss!1204) (size!4371 (buf!4845 thiss!1204))) (and (bvsge (currentBit!9112 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9112 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9117 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9117 thiss!1204) (size!4371 (buf!4845 thiss!1204))) (and (= (currentBit!9112 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9117 thiss!1204) (size!4371 (buf!4845 thiss!1204)))))))))

(assert (=> b!190361 d!65377))

(declare-fun d!65379 () Bool)

(declare-fun e!131492 () Bool)

(assert (=> d!65379 e!131492))

(declare-fun res!159027 () Bool)

(assert (=> d!65379 (=> (not res!159027) (not e!131492))))

(declare-fun lt!295945 () (_ BitVec 64))

(declare-fun lt!295950 () (_ BitVec 64))

(declare-fun lt!295947 () (_ BitVec 64))

(assert (=> d!65379 (= res!159027 (= lt!295945 (bvsub lt!295950 lt!295947)))))

(assert (=> d!65379 (or (= (bvand lt!295950 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!295947 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!295950 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!295950 lt!295947) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65379 (= lt!295947 (remainingBits!0 ((_ sign_extend 32) (size!4371 (buf!4845 (_2!8883 lt!295314)))) ((_ sign_extend 32) (currentByte!9117 (_2!8883 lt!295314))) ((_ sign_extend 32) (currentBit!9112 (_2!8883 lt!295314)))))))

(declare-fun lt!295948 () (_ BitVec 64))

(declare-fun lt!295949 () (_ BitVec 64))

(assert (=> d!65379 (= lt!295950 (bvmul lt!295948 lt!295949))))

(assert (=> d!65379 (or (= lt!295948 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!295949 (bvsdiv (bvmul lt!295948 lt!295949) lt!295948)))))

(assert (=> d!65379 (= lt!295949 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65379 (= lt!295948 ((_ sign_extend 32) (size!4371 (buf!4845 (_2!8883 lt!295314)))))))

(assert (=> d!65379 (= lt!295945 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9117 (_2!8883 lt!295314))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9112 (_2!8883 lt!295314)))))))

(assert (=> d!65379 (invariant!0 (currentBit!9112 (_2!8883 lt!295314)) (currentByte!9117 (_2!8883 lt!295314)) (size!4371 (buf!4845 (_2!8883 lt!295314))))))

(assert (=> d!65379 (= (bitIndex!0 (size!4371 (buf!4845 (_2!8883 lt!295314))) (currentByte!9117 (_2!8883 lt!295314)) (currentBit!9112 (_2!8883 lt!295314))) lt!295945)))

(declare-fun b!190603 () Bool)

(declare-fun res!159026 () Bool)

(assert (=> b!190603 (=> (not res!159026) (not e!131492))))

(assert (=> b!190603 (= res!159026 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!295945))))

(declare-fun b!190604 () Bool)

(declare-fun lt!295946 () (_ BitVec 64))

(assert (=> b!190604 (= e!131492 (bvsle lt!295945 (bvmul lt!295946 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!190604 (or (= lt!295946 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!295946 #b0000000000000000000000000000000000000000000000000000000000001000) lt!295946)))))

(assert (=> b!190604 (= lt!295946 ((_ sign_extend 32) (size!4371 (buf!4845 (_2!8883 lt!295314)))))))

(assert (= (and d!65379 res!159027) b!190603))

(assert (= (and b!190603 res!159026) b!190604))

(declare-fun m!296095 () Bool)

(assert (=> d!65379 m!296095))

(assert (=> d!65379 m!295589))

(assert (=> b!190360 d!65379))

(declare-fun d!65381 () Bool)

(declare-fun res!159028 () Bool)

(declare-fun e!131493 () Bool)

(assert (=> d!65381 (=> (not res!159028) (not e!131493))))

(assert (=> d!65381 (= res!159028 (= (size!4371 (buf!4845 thiss!1204)) (size!4371 (buf!4845 (_2!8883 lt!295314)))))))

(assert (=> d!65381 (= (isPrefixOf!0 thiss!1204 (_2!8883 lt!295314)) e!131493)))

(declare-fun b!190605 () Bool)

(declare-fun res!159029 () Bool)

(assert (=> b!190605 (=> (not res!159029) (not e!131493))))

(assert (=> b!190605 (= res!159029 (bvsle (bitIndex!0 (size!4371 (buf!4845 thiss!1204)) (currentByte!9117 thiss!1204) (currentBit!9112 thiss!1204)) (bitIndex!0 (size!4371 (buf!4845 (_2!8883 lt!295314))) (currentByte!9117 (_2!8883 lt!295314)) (currentBit!9112 (_2!8883 lt!295314)))))))

(declare-fun b!190606 () Bool)

(declare-fun e!131494 () Bool)

(assert (=> b!190606 (= e!131493 e!131494)))

(declare-fun res!159030 () Bool)

(assert (=> b!190606 (=> res!159030 e!131494)))

(assert (=> b!190606 (= res!159030 (= (size!4371 (buf!4845 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!190607 () Bool)

(assert (=> b!190607 (= e!131494 (arrayBitRangesEq!0 (buf!4845 thiss!1204) (buf!4845 (_2!8883 lt!295314)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4371 (buf!4845 thiss!1204)) (currentByte!9117 thiss!1204) (currentBit!9112 thiss!1204))))))

(assert (= (and d!65381 res!159028) b!190605))

(assert (= (and b!190605 res!159029) b!190606))

(assert (= (and b!190606 (not res!159030)) b!190607))

(assert (=> b!190605 m!295603))

(assert (=> b!190605 m!295581))

(assert (=> b!190607 m!295603))

(assert (=> b!190607 m!295603))

(declare-fun m!296097 () Bool)

(assert (=> b!190607 m!296097))

(assert (=> b!190360 d!65381))

(declare-fun d!65383 () Bool)

(assert (=> d!65383 (isPrefixOf!0 thiss!1204 (_2!8883 lt!295314))))

(declare-fun lt!295953 () Unit!13541)

(declare-fun choose!30 (BitStream!7850 BitStream!7850 BitStream!7850) Unit!13541)

(assert (=> d!65383 (= lt!295953 (choose!30 thiss!1204 (_2!8883 lt!295325) (_2!8883 lt!295314)))))

(assert (=> d!65383 (isPrefixOf!0 thiss!1204 (_2!8883 lt!295325))))

(assert (=> d!65383 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8883 lt!295325) (_2!8883 lt!295314)) lt!295953)))

(declare-fun bs!16253 () Bool)

(assert (= bs!16253 d!65383))

(assert (=> bs!16253 m!295583))

(declare-fun m!296099 () Bool)

(assert (=> bs!16253 m!296099))

(assert (=> bs!16253 m!295593))

(assert (=> b!190360 d!65383))

(declare-fun b!190741 () Bool)

(declare-fun e!131576 () Bool)

(declare-fun lt!296461 () tuple2!16480)

(declare-fun lt!296426 () tuple2!16478)

(assert (=> b!190741 (= e!131576 (= (_1!8885 lt!296461) (_2!8884 lt!296426)))))

(declare-fun b!190742 () Bool)

(declare-fun e!131577 () Bool)

(declare-fun lt!296449 () tuple2!16482)

(declare-fun lt!296466 () tuple2!16476)

(assert (=> b!190742 (= e!131577 (= (bitIndex!0 (size!4371 (buf!4845 (_1!8886 lt!296449))) (currentByte!9117 (_1!8886 lt!296449)) (currentBit!9112 (_1!8886 lt!296449))) (bitIndex!0 (size!4371 (buf!4845 (_2!8883 lt!296466))) (currentByte!9117 (_2!8883 lt!296466)) (currentBit!9112 (_2!8883 lt!296466)))))))

(declare-fun b!190743 () Bool)

(declare-fun res!159143 () Bool)

(declare-fun e!131573 () Bool)

(assert (=> b!190743 (=> (not res!159143) (not e!131573))))

(declare-fun lt!296433 () tuple2!16476)

(assert (=> b!190743 (= res!159143 (isPrefixOf!0 (_2!8883 lt!295325) (_2!8883 lt!296433)))))

(declare-fun b!190745 () Bool)

(declare-fun e!131572 () Bool)

(declare-fun lt!296441 () tuple2!16482)

(declare-fun lt!296469 () tuple2!16482)

(assert (=> b!190745 (= e!131572 (= (_2!8886 lt!296441) (_2!8886 lt!296469)))))

(declare-fun b!190746 () Bool)

(declare-fun e!131574 () (_ BitVec 64))

(assert (=> b!190746 (= e!131574 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!190747 () Bool)

(declare-fun res!159138 () Bool)

(assert (=> b!190747 (= res!159138 (= (bitIndex!0 (size!4371 (buf!4845 (_2!8883 lt!296466))) (currentByte!9117 (_2!8883 lt!296466)) (currentBit!9112 (_2!8883 lt!296466))) (bvadd (bitIndex!0 (size!4371 (buf!4845 (_2!8883 lt!295325))) (currentByte!9117 (_2!8883 lt!295325)) (currentBit!9112 (_2!8883 lt!295325))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun e!131570 () Bool)

(assert (=> b!190747 (=> (not res!159138) (not e!131570))))

(declare-fun b!190748 () Bool)

(declare-fun e!131575 () Bool)

(declare-fun lt!296422 () (_ BitVec 64))

(assert (=> b!190748 (= e!131575 (validate_offset_bits!1 ((_ sign_extend 32) (size!4371 (buf!4845 (_2!8883 lt!295325)))) ((_ sign_extend 32) (currentByte!9117 (_2!8883 lt!295325))) ((_ sign_extend 32) (currentBit!9112 (_2!8883 lt!295325))) lt!296422))))

(declare-fun bm!3035 () Bool)

(declare-fun c!9648 () Bool)

(declare-fun call!3038 () Bool)

(assert (=> bm!3035 (= call!3038 (isPrefixOf!0 (_2!8883 lt!295325) (ite c!9648 (_2!8883 lt!295325) (_2!8883 lt!296466))))))

(declare-fun b!190749 () Bool)

(declare-fun res!159139 () Bool)

(assert (=> b!190749 (=> (not res!159139) (not e!131573))))

(declare-fun lt!296447 () (_ BitVec 64))

(declare-fun lt!296455 () (_ BitVec 64))

(assert (=> b!190749 (= res!159139 (= (bitIndex!0 (size!4371 (buf!4845 (_2!8883 lt!296433))) (currentByte!9117 (_2!8883 lt!296433)) (currentBit!9112 (_2!8883 lt!296433))) (bvsub lt!296447 lt!296455)))))

(assert (=> b!190749 (or (= (bvand lt!296447 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!296455 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!296447 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!296447 lt!296455) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!190749 (= lt!296455 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!296450 () (_ BitVec 64))

(declare-fun lt!296444 () (_ BitVec 64))

(assert (=> b!190749 (= lt!296447 (bvadd lt!296450 lt!296444))))

(assert (=> b!190749 (or (not (= (bvand lt!296450 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!296444 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!296450 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!296450 lt!296444) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!190749 (= lt!296444 ((_ sign_extend 32) nBits!348))))

(assert (=> b!190749 (= lt!296450 (bitIndex!0 (size!4371 (buf!4845 (_2!8883 lt!295325))) (currentByte!9117 (_2!8883 lt!295325)) (currentBit!9112 (_2!8883 lt!295325))))))

(declare-fun b!190750 () Bool)

(declare-fun e!131578 () tuple2!16476)

(declare-fun Unit!13571 () Unit!13541)

(assert (=> b!190750 (= e!131578 (tuple2!16477 Unit!13571 (_2!8883 lt!295325)))))

(declare-fun lt!296417 () Unit!13541)

(assert (=> b!190750 (= lt!296417 (lemmaIsPrefixRefl!0 (_2!8883 lt!295325)))))

(assert (=> b!190750 call!3038))

(declare-fun lt!296437 () Unit!13541)

(assert (=> b!190750 (= lt!296437 lt!296417)))

(declare-fun b!190751 () Bool)

(declare-fun res!159141 () Bool)

(assert (=> b!190751 (=> (not res!159141) (not e!131573))))

(assert (=> b!190751 (= res!159141 (= (size!4371 (buf!4845 (_2!8883 lt!295325))) (size!4371 (buf!4845 (_2!8883 lt!296433)))))))

(declare-fun b!190744 () Bool)

(declare-fun res!159140 () Bool)

(assert (=> b!190744 (= res!159140 call!3038)))

(assert (=> b!190744 (=> (not res!159140) (not e!131570))))

(declare-fun d!65385 () Bool)

(assert (=> d!65385 e!131573))

(declare-fun res!159135 () Bool)

(assert (=> d!65385 (=> (not res!159135) (not e!131573))))

(assert (=> d!65385 (= res!159135 (invariant!0 (currentBit!9112 (_2!8883 lt!296433)) (currentByte!9117 (_2!8883 lt!296433)) (size!4371 (buf!4845 (_2!8883 lt!296433)))))))

(assert (=> d!65385 (= lt!296433 e!131578)))

(assert (=> d!65385 (= c!9648 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!65385 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!65385 (= (appendBitsLSBFirstLoopTR!0 (_2!8883 lt!295325) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!296433)))

(declare-fun b!190752 () Bool)

(assert (=> b!190752 (= e!131574 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!190753 () Bool)

(declare-fun lt!296434 () tuple2!16476)

(assert (=> b!190753 (= e!131578 (tuple2!16477 (_1!8883 lt!296434) (_2!8883 lt!296434)))))

(declare-fun lt!296468 () Bool)

(assert (=> b!190753 (= lt!296468 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!190753 (= lt!296466 (appendBit!0 (_2!8883 lt!295325) lt!296468))))

(declare-fun res!159134 () Bool)

(assert (=> b!190753 (= res!159134 (= (size!4371 (buf!4845 (_2!8883 lt!295325))) (size!4371 (buf!4845 (_2!8883 lt!296466)))))))

(assert (=> b!190753 (=> (not res!159134) (not e!131570))))

(assert (=> b!190753 e!131570))

(declare-fun lt!296421 () tuple2!16476)

(assert (=> b!190753 (= lt!296421 lt!296466)))

(assert (=> b!190753 (= lt!296434 (appendBitsLSBFirstLoopTR!0 (_2!8883 lt!296421) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!296420 () Unit!13541)

(assert (=> b!190753 (= lt!296420 (lemmaIsPrefixTransitive!0 (_2!8883 lt!295325) (_2!8883 lt!296421) (_2!8883 lt!296434)))))

(assert (=> b!190753 (isPrefixOf!0 (_2!8883 lt!295325) (_2!8883 lt!296434))))

(declare-fun lt!296457 () Unit!13541)

(assert (=> b!190753 (= lt!296457 lt!296420)))

(assert (=> b!190753 (invariant!0 (currentBit!9112 (_2!8883 lt!295325)) (currentByte!9117 (_2!8883 lt!295325)) (size!4371 (buf!4845 (_2!8883 lt!296421))))))

(declare-fun lt!296446 () BitStream!7850)

(assert (=> b!190753 (= lt!296446 (BitStream!7851 (buf!4845 (_2!8883 lt!296421)) (currentByte!9117 (_2!8883 lt!295325)) (currentBit!9112 (_2!8883 lt!295325))))))

(assert (=> b!190753 (invariant!0 (currentBit!9112 lt!296446) (currentByte!9117 lt!296446) (size!4371 (buf!4845 (_2!8883 lt!296434))))))

(declare-fun lt!296427 () BitStream!7850)

(assert (=> b!190753 (= lt!296427 (BitStream!7851 (buf!4845 (_2!8883 lt!296434)) (currentByte!9117 lt!296446) (currentBit!9112 lt!296446)))))

(assert (=> b!190753 (= lt!296441 (readBitPure!0 lt!296446))))

(assert (=> b!190753 (= lt!296469 (readBitPure!0 lt!296427))))

(declare-fun lt!296459 () Unit!13541)

(assert (=> b!190753 (= lt!296459 (readBitPrefixLemma!0 lt!296446 (_2!8883 lt!296434)))))

(declare-fun res!159136 () Bool)

(assert (=> b!190753 (= res!159136 (= (bitIndex!0 (size!4371 (buf!4845 (_1!8886 lt!296441))) (currentByte!9117 (_1!8886 lt!296441)) (currentBit!9112 (_1!8886 lt!296441))) (bitIndex!0 (size!4371 (buf!4845 (_1!8886 lt!296469))) (currentByte!9117 (_1!8886 lt!296469)) (currentBit!9112 (_1!8886 lt!296469)))))))

(assert (=> b!190753 (=> (not res!159136) (not e!131572))))

(assert (=> b!190753 e!131572))

(declare-fun lt!296463 () Unit!13541)

(assert (=> b!190753 (= lt!296463 lt!296459)))

(declare-fun lt!296458 () tuple2!16478)

(assert (=> b!190753 (= lt!296458 (reader!0 (_2!8883 lt!295325) (_2!8883 lt!296434)))))

(declare-fun lt!296428 () tuple2!16478)

(assert (=> b!190753 (= lt!296428 (reader!0 (_2!8883 lt!296421) (_2!8883 lt!296434)))))

(declare-fun lt!296467 () tuple2!16482)

(assert (=> b!190753 (= lt!296467 (readBitPure!0 (_1!8884 lt!296458)))))

(assert (=> b!190753 (= (_2!8886 lt!296467) lt!296468)))

(declare-fun lt!296443 () Unit!13541)

(declare-fun Unit!13572 () Unit!13541)

(assert (=> b!190753 (= lt!296443 Unit!13572)))

(declare-fun lt!296424 () (_ BitVec 64))

(assert (=> b!190753 (= lt!296424 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!296471 () (_ BitVec 64))

(assert (=> b!190753 (= lt!296471 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!296439 () Unit!13541)

(assert (=> b!190753 (= lt!296439 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8883 lt!295325) (buf!4845 (_2!8883 lt!296434)) lt!296471))))

(assert (=> b!190753 (validate_offset_bits!1 ((_ sign_extend 32) (size!4371 (buf!4845 (_2!8883 lt!296434)))) ((_ sign_extend 32) (currentByte!9117 (_2!8883 lt!295325))) ((_ sign_extend 32) (currentBit!9112 (_2!8883 lt!295325))) lt!296471)))

(declare-fun lt!296470 () Unit!13541)

(assert (=> b!190753 (= lt!296470 lt!296439)))

(declare-fun lt!296416 () tuple2!16480)

(assert (=> b!190753 (= lt!296416 (readNBitsLSBFirstsLoopPure!0 (_1!8884 lt!296458) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!296424))))

(declare-fun lt!296451 () (_ BitVec 64))

(assert (=> b!190753 (= lt!296451 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!296432 () Unit!13541)

(assert (=> b!190753 (= lt!296432 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8883 lt!296421) (buf!4845 (_2!8883 lt!296434)) lt!296451))))

(assert (=> b!190753 (validate_offset_bits!1 ((_ sign_extend 32) (size!4371 (buf!4845 (_2!8883 lt!296434)))) ((_ sign_extend 32) (currentByte!9117 (_2!8883 lt!296421))) ((_ sign_extend 32) (currentBit!9112 (_2!8883 lt!296421))) lt!296451)))

(declare-fun lt!296429 () Unit!13541)

(assert (=> b!190753 (= lt!296429 lt!296432)))

(declare-fun lt!296456 () tuple2!16480)

(assert (=> b!190753 (= lt!296456 (readNBitsLSBFirstsLoopPure!0 (_1!8884 lt!296428) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!296424 (ite (_2!8886 lt!296467) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!296464 () tuple2!16480)

(assert (=> b!190753 (= lt!296464 (readNBitsLSBFirstsLoopPure!0 (_1!8884 lt!296458) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!296424))))

(declare-fun c!9649 () Bool)

(assert (=> b!190753 (= c!9649 (_2!8886 (readBitPure!0 (_1!8884 lt!296458))))))

(declare-fun lt!296462 () tuple2!16480)

(assert (=> b!190753 (= lt!296462 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8884 lt!296458) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!296424 e!131574)))))

(declare-fun lt!296418 () Unit!13541)

(assert (=> b!190753 (= lt!296418 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8884 lt!296458) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!296424))))

(assert (=> b!190753 (and (= (_2!8885 lt!296464) (_2!8885 lt!296462)) (= (_1!8885 lt!296464) (_1!8885 lt!296462)))))

(declare-fun lt!296440 () Unit!13541)

(assert (=> b!190753 (= lt!296440 lt!296418)))

(assert (=> b!190753 (= (_1!8884 lt!296458) (withMovedBitIndex!0 (_2!8884 lt!296458) (bvsub (bitIndex!0 (size!4371 (buf!4845 (_2!8883 lt!295325))) (currentByte!9117 (_2!8883 lt!295325)) (currentBit!9112 (_2!8883 lt!295325))) (bitIndex!0 (size!4371 (buf!4845 (_2!8883 lt!296434))) (currentByte!9117 (_2!8883 lt!296434)) (currentBit!9112 (_2!8883 lt!296434))))))))

(declare-fun lt!296454 () Unit!13541)

(declare-fun Unit!13573 () Unit!13541)

(assert (=> b!190753 (= lt!296454 Unit!13573)))

(assert (=> b!190753 (= (_1!8884 lt!296428) (withMovedBitIndex!0 (_2!8884 lt!296428) (bvsub (bitIndex!0 (size!4371 (buf!4845 (_2!8883 lt!296421))) (currentByte!9117 (_2!8883 lt!296421)) (currentBit!9112 (_2!8883 lt!296421))) (bitIndex!0 (size!4371 (buf!4845 (_2!8883 lt!296434))) (currentByte!9117 (_2!8883 lt!296434)) (currentBit!9112 (_2!8883 lt!296434))))))))

(declare-fun lt!296435 () Unit!13541)

(declare-fun Unit!13574 () Unit!13541)

(assert (=> b!190753 (= lt!296435 Unit!13574)))

(assert (=> b!190753 (= (bitIndex!0 (size!4371 (buf!4845 (_2!8883 lt!295325))) (currentByte!9117 (_2!8883 lt!295325)) (currentBit!9112 (_2!8883 lt!295325))) (bvsub (bitIndex!0 (size!4371 (buf!4845 (_2!8883 lt!296421))) (currentByte!9117 (_2!8883 lt!296421)) (currentBit!9112 (_2!8883 lt!296421))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!296423 () Unit!13541)

(declare-fun Unit!13575 () Unit!13541)

(assert (=> b!190753 (= lt!296423 Unit!13575)))

(assert (=> b!190753 (= (_2!8885 lt!296416) (_2!8885 lt!296456))))

(declare-fun lt!296452 () Unit!13541)

(declare-fun Unit!13576 () Unit!13541)

(assert (=> b!190753 (= lt!296452 Unit!13576)))

(assert (=> b!190753 (invariant!0 (currentBit!9112 (_2!8883 lt!296434)) (currentByte!9117 (_2!8883 lt!296434)) (size!4371 (buf!4845 (_2!8883 lt!296434))))))

(declare-fun lt!296442 () Unit!13541)

(declare-fun Unit!13577 () Unit!13541)

(assert (=> b!190753 (= lt!296442 Unit!13577)))

(assert (=> b!190753 (= (size!4371 (buf!4845 (_2!8883 lt!295325))) (size!4371 (buf!4845 (_2!8883 lt!296434))))))

(declare-fun lt!296460 () Unit!13541)

(declare-fun Unit!13578 () Unit!13541)

(assert (=> b!190753 (= lt!296460 Unit!13578)))

(assert (=> b!190753 (= (bitIndex!0 (size!4371 (buf!4845 (_2!8883 lt!296434))) (currentByte!9117 (_2!8883 lt!296434)) (currentBit!9112 (_2!8883 lt!296434))) (bvsub (bvadd (bitIndex!0 (size!4371 (buf!4845 (_2!8883 lt!295325))) (currentByte!9117 (_2!8883 lt!295325)) (currentBit!9112 (_2!8883 lt!295325))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!296465 () Unit!13541)

(declare-fun Unit!13579 () Unit!13541)

(assert (=> b!190753 (= lt!296465 Unit!13579)))

(declare-fun lt!296431 () Unit!13541)

(declare-fun Unit!13580 () Unit!13541)

(assert (=> b!190753 (= lt!296431 Unit!13580)))

(declare-fun lt!296425 () tuple2!16478)

(assert (=> b!190753 (= lt!296425 (reader!0 (_2!8883 lt!295325) (_2!8883 lt!296434)))))

(declare-fun lt!296430 () (_ BitVec 64))

(assert (=> b!190753 (= lt!296430 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!296445 () Unit!13541)

(assert (=> b!190753 (= lt!296445 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8883 lt!295325) (buf!4845 (_2!8883 lt!296434)) lt!296430))))

(assert (=> b!190753 (validate_offset_bits!1 ((_ sign_extend 32) (size!4371 (buf!4845 (_2!8883 lt!296434)))) ((_ sign_extend 32) (currentByte!9117 (_2!8883 lt!295325))) ((_ sign_extend 32) (currentBit!9112 (_2!8883 lt!295325))) lt!296430)))

(declare-fun lt!296436 () Unit!13541)

(assert (=> b!190753 (= lt!296436 lt!296445)))

(declare-fun lt!296438 () tuple2!16480)

(assert (=> b!190753 (= lt!296438 (readNBitsLSBFirstsLoopPure!0 (_1!8884 lt!296425) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!159142 () Bool)

(assert (=> b!190753 (= res!159142 (= (_2!8885 lt!296438) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun e!131571 () Bool)

(assert (=> b!190753 (=> (not res!159142) (not e!131571))))

(assert (=> b!190753 e!131571))

(declare-fun lt!296448 () Unit!13541)

(declare-fun Unit!13581 () Unit!13541)

(assert (=> b!190753 (= lt!296448 Unit!13581)))

(declare-fun b!190754 () Bool)

(assert (=> b!190754 (= e!131571 (= (_1!8885 lt!296438) (_2!8884 lt!296425)))))

(declare-fun b!190755 () Bool)

(assert (=> b!190755 (= lt!296449 (readBitPure!0 (readerFrom!0 (_2!8883 lt!296466) (currentBit!9112 (_2!8883 lt!295325)) (currentByte!9117 (_2!8883 lt!295325)))))))

(declare-fun res!159133 () Bool)

(assert (=> b!190755 (= res!159133 (and (= (_2!8886 lt!296449) lt!296468) (= (_1!8886 lt!296449) (_2!8883 lt!296466))))))

(assert (=> b!190755 (=> (not res!159133) (not e!131577))))

(assert (=> b!190755 (= e!131570 e!131577)))

(declare-fun b!190756 () Bool)

(assert (=> b!190756 (= e!131573 e!131576)))

(declare-fun res!159132 () Bool)

(assert (=> b!190756 (=> (not res!159132) (not e!131576))))

(assert (=> b!190756 (= res!159132 (= (_2!8885 lt!296461) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!190756 (= lt!296461 (readNBitsLSBFirstsLoopPure!0 (_1!8884 lt!296426) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!296453 () Unit!13541)

(declare-fun lt!296419 () Unit!13541)

(assert (=> b!190756 (= lt!296453 lt!296419)))

(assert (=> b!190756 (validate_offset_bits!1 ((_ sign_extend 32) (size!4371 (buf!4845 (_2!8883 lt!296433)))) ((_ sign_extend 32) (currentByte!9117 (_2!8883 lt!295325))) ((_ sign_extend 32) (currentBit!9112 (_2!8883 lt!295325))) lt!296422)))

(assert (=> b!190756 (= lt!296419 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8883 lt!295325) (buf!4845 (_2!8883 lt!296433)) lt!296422))))

(assert (=> b!190756 e!131575))

(declare-fun res!159137 () Bool)

(assert (=> b!190756 (=> (not res!159137) (not e!131575))))

(assert (=> b!190756 (= res!159137 (and (= (size!4371 (buf!4845 (_2!8883 lt!295325))) (size!4371 (buf!4845 (_2!8883 lt!296433)))) (bvsge lt!296422 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!190756 (= lt!296422 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!190756 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!190756 (= lt!296426 (reader!0 (_2!8883 lt!295325) (_2!8883 lt!296433)))))

(assert (= (and d!65385 c!9648) b!190750))

(assert (= (and d!65385 (not c!9648)) b!190753))

(assert (= (and b!190753 res!159134) b!190747))

(assert (= (and b!190747 res!159138) b!190744))

(assert (= (and b!190744 res!159140) b!190755))

(assert (= (and b!190755 res!159133) b!190742))

(assert (= (and b!190753 res!159136) b!190745))

(assert (= (and b!190753 c!9649) b!190746))

(assert (= (and b!190753 (not c!9649)) b!190752))

(assert (= (and b!190753 res!159142) b!190754))

(assert (= (or b!190750 b!190744) bm!3035))

(assert (= (and d!65385 res!159135) b!190751))

(assert (= (and b!190751 res!159141) b!190749))

(assert (= (and b!190749 res!159139) b!190743))

(assert (= (and b!190743 res!159143) b!190756))

(assert (= (and b!190756 res!159137) b!190748))

(assert (= (and b!190756 res!159132) b!190741))

(declare-fun m!296299 () Bool)

(assert (=> b!190753 m!296299))

(declare-fun m!296301 () Bool)

(assert (=> b!190753 m!296301))

(declare-fun m!296303 () Bool)

(assert (=> b!190753 m!296303))

(declare-fun m!296305 () Bool)

(assert (=> b!190753 m!296305))

(declare-fun m!296307 () Bool)

(assert (=> b!190753 m!296307))

(declare-fun m!296309 () Bool)

(assert (=> b!190753 m!296309))

(declare-fun m!296311 () Bool)

(assert (=> b!190753 m!296311))

(declare-fun m!296313 () Bool)

(assert (=> b!190753 m!296313))

(declare-fun m!296315 () Bool)

(assert (=> b!190753 m!296315))

(declare-fun m!296317 () Bool)

(assert (=> b!190753 m!296317))

(declare-fun m!296319 () Bool)

(assert (=> b!190753 m!296319))

(declare-fun m!296321 () Bool)

(assert (=> b!190753 m!296321))

(declare-fun m!296323 () Bool)

(assert (=> b!190753 m!296323))

(declare-fun m!296325 () Bool)

(assert (=> b!190753 m!296325))

(assert (=> b!190753 m!296313))

(declare-fun m!296327 () Bool)

(assert (=> b!190753 m!296327))

(declare-fun m!296329 () Bool)

(assert (=> b!190753 m!296329))

(declare-fun m!296331 () Bool)

(assert (=> b!190753 m!296331))

(assert (=> b!190753 m!295601))

(declare-fun m!296333 () Bool)

(assert (=> b!190753 m!296333))

(declare-fun m!296335 () Bool)

(assert (=> b!190753 m!296335))

(declare-fun m!296337 () Bool)

(assert (=> b!190753 m!296337))

(declare-fun m!296339 () Bool)

(assert (=> b!190753 m!296339))

(declare-fun m!296341 () Bool)

(assert (=> b!190753 m!296341))

(declare-fun m!296343 () Bool)

(assert (=> b!190753 m!296343))

(declare-fun m!296345 () Bool)

(assert (=> b!190753 m!296345))

(declare-fun m!296347 () Bool)

(assert (=> b!190753 m!296347))

(declare-fun m!296349 () Bool)

(assert (=> b!190753 m!296349))

(declare-fun m!296351 () Bool)

(assert (=> b!190753 m!296351))

(declare-fun m!296353 () Bool)

(assert (=> b!190753 m!296353))

(declare-fun m!296355 () Bool)

(assert (=> b!190753 m!296355))

(declare-fun m!296357 () Bool)

(assert (=> b!190753 m!296357))

(declare-fun m!296359 () Bool)

(assert (=> b!190753 m!296359))

(declare-fun m!296361 () Bool)

(assert (=> b!190753 m!296361))

(declare-fun m!296363 () Bool)

(assert (=> b!190753 m!296363))

(declare-fun m!296365 () Bool)

(assert (=> b!190747 m!296365))

(assert (=> b!190747 m!295601))

(declare-fun m!296367 () Bool)

(assert (=> b!190742 m!296367))

(assert (=> b!190742 m!296365))

(declare-fun m!296369 () Bool)

(assert (=> d!65385 m!296369))

(assert (=> b!190750 m!296021))

(assert (=> b!190756 m!296299))

(declare-fun m!296371 () Bool)

(assert (=> b!190756 m!296371))

(declare-fun m!296373 () Bool)

(assert (=> b!190756 m!296373))

(declare-fun m!296375 () Bool)

(assert (=> b!190756 m!296375))

(assert (=> b!190756 m!296359))

(declare-fun m!296377 () Bool)

(assert (=> b!190756 m!296377))

(declare-fun m!296379 () Bool)

(assert (=> b!190755 m!296379))

(assert (=> b!190755 m!296379))

(declare-fun m!296381 () Bool)

(assert (=> b!190755 m!296381))

(declare-fun m!296383 () Bool)

(assert (=> b!190748 m!296383))

(declare-fun m!296385 () Bool)

(assert (=> b!190743 m!296385))

(declare-fun m!296387 () Bool)

(assert (=> b!190749 m!296387))

(assert (=> b!190749 m!295601))

(declare-fun m!296389 () Bool)

(assert (=> bm!3035 m!296389))

(assert (=> b!190360 d!65385))

(assert (=> b!190371 d!65281))

(assert (=> b!190371 d!65283))

(declare-fun d!65401 () Bool)

(assert (=> d!65401 (= (invariant!0 (currentBit!9112 thiss!1204) (currentByte!9117 thiss!1204) (size!4371 (buf!4845 (_2!8883 lt!295314)))) (and (bvsge (currentBit!9112 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9112 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9117 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9117 thiss!1204) (size!4371 (buf!4845 (_2!8883 lt!295314)))) (and (= (currentBit!9112 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9117 thiss!1204) (size!4371 (buf!4845 (_2!8883 lt!295314))))))))))

(assert (=> b!190369 d!65401))

(declare-fun d!65403 () Bool)

(declare-fun e!131579 () Bool)

(assert (=> d!65403 e!131579))

(declare-fun res!159144 () Bool)

(assert (=> d!65403 (=> (not res!159144) (not e!131579))))

(declare-fun lt!296473 () (_ BitVec 64))

(declare-fun lt!296472 () BitStream!7850)

(assert (=> d!65403 (= res!159144 (= (bvadd lt!296473 (bvsub lt!295316 lt!295336)) (bitIndex!0 (size!4371 (buf!4845 lt!296472)) (currentByte!9117 lt!296472) (currentBit!9112 lt!296472))))))

(assert (=> d!65403 (or (not (= (bvand lt!296473 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!295316 lt!295336) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!296473 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!296473 (bvsub lt!295316 lt!295336)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65403 (= lt!296473 (bitIndex!0 (size!4371 (buf!4845 (_2!8884 lt!295332))) (currentByte!9117 (_2!8884 lt!295332)) (currentBit!9112 (_2!8884 lt!295332))))))

(assert (=> d!65403 (= lt!296472 (_2!8883 (moveBitIndex!0 (_2!8884 lt!295332) (bvsub lt!295316 lt!295336))))))

(assert (=> d!65403 (moveBitIndexPrecond!0 (_2!8884 lt!295332) (bvsub lt!295316 lt!295336))))

(assert (=> d!65403 (= (withMovedBitIndex!0 (_2!8884 lt!295332) (bvsub lt!295316 lt!295336)) lt!296472)))

(declare-fun b!190757 () Bool)

(assert (=> b!190757 (= e!131579 (= (size!4371 (buf!4845 (_2!8884 lt!295332))) (size!4371 (buf!4845 lt!296472))))))

(assert (= (and d!65403 res!159144) b!190757))

(declare-fun m!296391 () Bool)

(assert (=> d!65403 m!296391))

(declare-fun m!296393 () Bool)

(assert (=> d!65403 m!296393))

(declare-fun m!296395 () Bool)

(assert (=> d!65403 m!296395))

(declare-fun m!296397 () Bool)

(assert (=> d!65403 m!296397))

(assert (=> b!190370 d!65403))

(declare-fun d!65405 () Bool)

(assert (=> d!65405 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4371 (buf!4845 thiss!1204))) ((_ sign_extend 32) (currentByte!9117 thiss!1204)) ((_ sign_extend 32) (currentBit!9112 thiss!1204)) lt!295317) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4371 (buf!4845 thiss!1204))) ((_ sign_extend 32) (currentByte!9117 thiss!1204)) ((_ sign_extend 32) (currentBit!9112 thiss!1204))) lt!295317))))

(declare-fun bs!16256 () Bool)

(assert (= bs!16256 d!65405))

(assert (=> bs!16256 m!295881))

(assert (=> b!190359 d!65405))

(push 1)

(assert (not b!190753))

(assert (not d!65379))

(assert (not d!65371))

(assert (not d!65363))

(assert (not d!65355))

(assert (not b!190596))

(assert (not d!65281))

(assert (not d!65315))

(assert (not b!190743))

(assert (not b!190546))

(assert (not d!65283))

(assert (not b!190756))

(assert (not b!190545))

(assert (not bm!3035))

(assert (not b!190572))

(assert (not b!190590))

(assert (not b!190573))

(assert (not d!65335))

(assert (not b!190544))

(assert (not d!65403))

(assert (not b!190587))

(assert (not d!65351))

(assert (not d!65349))

(assert (not d!65369))

(assert (not b!190575))

(assert (not d!65345))

(assert (not d!65347))

(assert (not d!65333))

(assert (not b!190742))

(assert (not b!190568))

(assert (not d!65329))

(assert (not d!65357))

(assert (not b!190600))

(assert (not d!65287))

(assert (not b!190747))

(assert (not b!190748))

(assert (not b!190749))

(assert (not d!65359))

(assert (not d!65373))

(assert (not b!190755))

(assert (not b!190566))

(assert (not d!65405))

(assert (not d!65275))

(assert (not b!190598))

(assert (not b!190597))

(assert (not b!190750))

(assert (not b!190588))

(assert (not b!190607))

(assert (not b!190586))

(assert (not d!65343))

(assert (not d!65361))

(assert (not d!65319))

(assert (not b!190605))

(assert (not d!65331))

(assert (not b!190543))

(assert (not d!65341))

(assert (not d!65337))

(assert (not d!65385))

(assert (not d!65279))

(assert (not d!65383))

(assert (not d!65353))

(assert (not d!65277))

(check-sat)

(pop 1)

(push 1)

(check-sat)

