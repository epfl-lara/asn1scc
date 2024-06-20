; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11844 () Bool)

(assert start!11844)

(declare-fun b!59328 () Bool)

(declare-fun res!49363 () Bool)

(declare-fun e!39467 () Bool)

(assert (=> b!59328 (=> res!49363 e!39467)))

(declare-datatypes ((array!2701 0))(
  ( (array!2702 (arr!1790 (Array (_ BitVec 32) (_ BitVec 8))) (size!1226 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2140 0))(
  ( (BitStream!2141 (buf!1607 array!2701) (currentByte!3225 (_ BitVec 32)) (currentBit!3220 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2140)

(declare-datatypes ((Unit!4075 0))(
  ( (Unit!4076) )
))
(declare-datatypes ((tuple2!5402 0))(
  ( (tuple2!5403 (_1!2812 Unit!4075) (_2!2812 BitStream!2140)) )
))
(declare-fun lt!93130 () tuple2!5402)

(assert (=> b!59328 (= res!49363 (not (= (size!1226 (buf!1607 thiss!1379)) (size!1226 (buf!1607 (_2!2812 lt!93130))))))))

(declare-fun b!59329 () Bool)

(declare-fun e!39461 () Bool)

(declare-fun e!39457 () Bool)

(assert (=> b!59329 (= e!39461 (not e!39457))))

(declare-fun res!49374 () Bool)

(assert (=> b!59329 (=> res!49374 e!39457)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!59329 (= res!49374 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!2140 BitStream!2140) Bool)

(assert (=> b!59329 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!93127 () Unit!4075)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2140) Unit!4075)

(assert (=> b!59329 (= lt!93127 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!93133 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!59329 (= lt!93133 (bitIndex!0 (size!1226 (buf!1607 thiss!1379)) (currentByte!3225 thiss!1379) (currentBit!3220 thiss!1379)))))

(declare-fun b!59331 () Bool)

(declare-fun e!39466 () Bool)

(assert (=> b!59331 (= e!39467 e!39466)))

(declare-fun res!49366 () Bool)

(assert (=> b!59331 (=> res!49366 e!39466)))

(declare-fun lt!93136 () tuple2!5402)

(assert (=> b!59331 (= res!49366 (not (= (size!1226 (buf!1607 (_2!2812 lt!93136))) (size!1226 (buf!1607 (_2!2812 lt!93130))))))))

(declare-fun e!39460 () Bool)

(assert (=> b!59331 e!39460))

(declare-fun res!49372 () Bool)

(assert (=> b!59331 (=> (not res!49372) (not e!39460))))

(assert (=> b!59331 (= res!49372 (= (size!1226 (buf!1607 (_2!2812 lt!93130))) (size!1226 (buf!1607 thiss!1379))))))

(declare-fun b!59332 () Bool)

(declare-fun res!49362 () Bool)

(assert (=> b!59332 (=> (not res!49362) (not e!39461))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!59332 (= res!49362 (validate_offset_bits!1 ((_ sign_extend 32) (size!1226 (buf!1607 thiss!1379))) ((_ sign_extend 32) (currentByte!3225 thiss!1379)) ((_ sign_extend 32) (currentBit!3220 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!59333 () Bool)

(declare-fun res!49368 () Bool)

(assert (=> b!59333 (=> res!49368 e!39466)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!59333 (= res!49368 (not (invariant!0 (currentBit!3220 (_2!2812 lt!93136)) (currentByte!3225 (_2!2812 lt!93136)) (size!1226 (buf!1607 (_2!2812 lt!93136))))))))

(declare-fun b!59334 () Bool)

(declare-fun res!49371 () Bool)

(assert (=> b!59334 (=> res!49371 e!39467)))

(assert (=> b!59334 (= res!49371 (not (invariant!0 (currentBit!3220 (_2!2812 lt!93130)) (currentByte!3225 (_2!2812 lt!93130)) (size!1226 (buf!1607 (_2!2812 lt!93130))))))))

(declare-fun b!59335 () Bool)

(declare-fun e!39459 () Bool)

(declare-fun e!39458 () Bool)

(assert (=> b!59335 (= e!39459 e!39458)))

(declare-fun res!49370 () Bool)

(assert (=> b!59335 (=> res!49370 e!39458)))

(assert (=> b!59335 (= res!49370 (not (isPrefixOf!0 (_2!2812 lt!93136) (_2!2812 lt!93130))))))

(assert (=> b!59335 (isPrefixOf!0 thiss!1379 (_2!2812 lt!93130))))

(declare-fun lt!93126 () Unit!4075)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2140 BitStream!2140 BitStream!2140) Unit!4075)

(assert (=> b!59335 (= lt!93126 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2812 lt!93136) (_2!2812 lt!93130)))))

(declare-fun srcBuffer!2 () array!2701)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2140 array!2701 (_ BitVec 64) (_ BitVec 64)) tuple2!5402)

(assert (=> b!59335 (= lt!93130 (appendBitsMSBFirstLoop!0 (_2!2812 lt!93136) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!39465 () Bool)

(assert (=> b!59335 e!39465))

(declare-fun res!49373 () Bool)

(assert (=> b!59335 (=> (not res!49373) (not e!39465))))

(assert (=> b!59335 (= res!49373 (validate_offset_bits!1 ((_ sign_extend 32) (size!1226 (buf!1607 (_2!2812 lt!93136)))) ((_ sign_extend 32) (currentByte!3225 thiss!1379)) ((_ sign_extend 32) (currentBit!3220 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!93135 () Unit!4075)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2140 array!2701 (_ BitVec 64)) Unit!4075)

(assert (=> b!59335 (= lt!93135 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1607 (_2!2812 lt!93136)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!5404 0))(
  ( (tuple2!5405 (_1!2813 BitStream!2140) (_2!2813 BitStream!2140)) )
))
(declare-fun lt!93125 () tuple2!5404)

(declare-fun reader!0 (BitStream!2140 BitStream!2140) tuple2!5404)

(assert (=> b!59335 (= lt!93125 (reader!0 thiss!1379 (_2!2812 lt!93136)))))

(declare-fun b!59336 () Bool)

(assert (=> b!59336 (= e!39466 (or (not (= (bvand i!635 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (bvand i!635 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!93132 () (_ BitVec 64))

(assert (=> b!59336 (validate_offset_bits!1 ((_ sign_extend 32) (size!1226 (buf!1607 (_2!2812 lt!93130)))) ((_ sign_extend 32) (currentByte!3225 (_2!2812 lt!93136))) ((_ sign_extend 32) (currentBit!3220 (_2!2812 lt!93136))) lt!93132)))

(declare-fun lt!93131 () Unit!4075)

(assert (=> b!59336 (= lt!93131 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2812 lt!93136) (buf!1607 (_2!2812 lt!93130)) lt!93132))))

(declare-fun lt!93134 () tuple2!5404)

(assert (=> b!59336 (= lt!93134 (reader!0 (_2!2812 lt!93136) (_2!2812 lt!93130)))))

(assert (=> b!59336 (validate_offset_bits!1 ((_ sign_extend 32) (size!1226 (buf!1607 (_2!2812 lt!93130)))) ((_ sign_extend 32) (currentByte!3225 thiss!1379)) ((_ sign_extend 32) (currentBit!3220 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!93129 () Unit!4075)

(assert (=> b!59336 (= lt!93129 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1607 (_2!2812 lt!93130)) (bvsub to!314 i!635)))))

(declare-fun lt!93128 () tuple2!5404)

(assert (=> b!59336 (= lt!93128 (reader!0 thiss!1379 (_2!2812 lt!93130)))))

(declare-fun b!59337 () Bool)

(assert (=> b!59337 (= e!39457 e!39459)))

(declare-fun res!49367 () Bool)

(assert (=> b!59337 (=> res!49367 e!39459)))

(assert (=> b!59337 (= res!49367 (not (isPrefixOf!0 thiss!1379 (_2!2812 lt!93136))))))

(assert (=> b!59337 (validate_offset_bits!1 ((_ sign_extend 32) (size!1226 (buf!1607 (_2!2812 lt!93136)))) ((_ sign_extend 32) (currentByte!3225 (_2!2812 lt!93136))) ((_ sign_extend 32) (currentBit!3220 (_2!2812 lt!93136))) lt!93132)))

(assert (=> b!59337 (= lt!93132 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!93124 () Unit!4075)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2140 BitStream!2140 (_ BitVec 64) (_ BitVec 64)) Unit!4075)

(assert (=> b!59337 (= lt!93124 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2812 lt!93136) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2140 (_ BitVec 8) (_ BitVec 32)) tuple2!5402)

(assert (=> b!59337 (= lt!93136 (appendBitFromByte!0 thiss!1379 (select (arr!1790 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!93123 () (_ BitVec 64))

(declare-fun b!59330 () Bool)

(assert (=> b!59330 (= e!39460 (= lt!93123 (bvsub (bvsub (bvadd (bitIndex!0 (size!1226 (buf!1607 (_2!2812 lt!93136))) (currentByte!3225 (_2!2812 lt!93136)) (currentBit!3220 (_2!2812 lt!93136))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun res!49369 () Bool)

(assert (=> start!11844 (=> (not res!49369) (not e!39461))))

(assert (=> start!11844 (= res!49369 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1226 srcBuffer!2))))))))

(assert (=> start!11844 e!39461))

(assert (=> start!11844 true))

(declare-fun array_inv!1129 (array!2701) Bool)

(assert (=> start!11844 (array_inv!1129 srcBuffer!2)))

(declare-fun e!39462 () Bool)

(declare-fun inv!12 (BitStream!2140) Bool)

(assert (=> start!11844 (and (inv!12 thiss!1379) e!39462)))

(declare-fun b!59338 () Bool)

(assert (=> b!59338 (= e!39458 e!39467)))

(declare-fun res!49364 () Bool)

(assert (=> b!59338 (=> res!49364 e!39467)))

(assert (=> b!59338 (= res!49364 (not (= lt!93123 (bvsub (bvadd lt!93133 to!314) i!635))))))

(assert (=> b!59338 (= lt!93123 (bitIndex!0 (size!1226 (buf!1607 (_2!2812 lt!93130))) (currentByte!3225 (_2!2812 lt!93130)) (currentBit!3220 (_2!2812 lt!93130))))))

(declare-fun b!59339 () Bool)

(declare-datatypes ((List!645 0))(
  ( (Nil!642) (Cons!641 (h!760 Bool) (t!1395 List!645)) )
))
(declare-fun head!464 (List!645) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2140 array!2701 (_ BitVec 64) (_ BitVec 64)) List!645)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2140 BitStream!2140 (_ BitVec 64)) List!645)

(assert (=> b!59339 (= e!39465 (= (head!464 (byteArrayBitContentToList!0 (_2!2812 lt!93136) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!464 (bitStreamReadBitsIntoList!0 (_2!2812 lt!93136) (_1!2813 lt!93125) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!59340 () Bool)

(assert (=> b!59340 (= e!39462 (array_inv!1129 (buf!1607 thiss!1379)))))

(declare-fun b!59341 () Bool)

(declare-fun res!49365 () Bool)

(assert (=> b!59341 (=> res!49365 e!39466)))

(assert (=> b!59341 (= res!49365 (not (invariant!0 (currentBit!3220 (_2!2812 lt!93136)) (currentByte!3225 (_2!2812 lt!93136)) (size!1226 (buf!1607 (_2!2812 lt!93130))))))))

(assert (= (and start!11844 res!49369) b!59332))

(assert (= (and b!59332 res!49362) b!59329))

(assert (= (and b!59329 (not res!49374)) b!59337))

(assert (= (and b!59337 (not res!49367)) b!59335))

(assert (= (and b!59335 res!49373) b!59339))

(assert (= (and b!59335 (not res!49370)) b!59338))

(assert (= (and b!59338 (not res!49364)) b!59334))

(assert (= (and b!59334 (not res!49371)) b!59328))

(assert (= (and b!59328 (not res!49363)) b!59331))

(assert (= (and b!59331 res!49372) b!59330))

(assert (= (and b!59331 (not res!49366)) b!59333))

(assert (= (and b!59333 (not res!49368)) b!59341))

(assert (= (and b!59341 (not res!49365)) b!59336))

(assert (= start!11844 b!59340))

(declare-fun m!93421 () Bool)

(assert (=> b!59333 m!93421))

(declare-fun m!93423 () Bool)

(assert (=> start!11844 m!93423))

(declare-fun m!93425 () Bool)

(assert (=> start!11844 m!93425))

(declare-fun m!93427 () Bool)

(assert (=> b!59329 m!93427))

(declare-fun m!93429 () Bool)

(assert (=> b!59329 m!93429))

(declare-fun m!93431 () Bool)

(assert (=> b!59329 m!93431))

(declare-fun m!93433 () Bool)

(assert (=> b!59341 m!93433))

(declare-fun m!93435 () Bool)

(assert (=> b!59337 m!93435))

(declare-fun m!93437 () Bool)

(assert (=> b!59337 m!93437))

(declare-fun m!93439 () Bool)

(assert (=> b!59337 m!93439))

(declare-fun m!93441 () Bool)

(assert (=> b!59337 m!93441))

(assert (=> b!59337 m!93435))

(declare-fun m!93443 () Bool)

(assert (=> b!59337 m!93443))

(declare-fun m!93445 () Bool)

(assert (=> b!59335 m!93445))

(declare-fun m!93447 () Bool)

(assert (=> b!59335 m!93447))

(declare-fun m!93449 () Bool)

(assert (=> b!59335 m!93449))

(declare-fun m!93451 () Bool)

(assert (=> b!59335 m!93451))

(declare-fun m!93453 () Bool)

(assert (=> b!59335 m!93453))

(declare-fun m!93455 () Bool)

(assert (=> b!59335 m!93455))

(declare-fun m!93457 () Bool)

(assert (=> b!59335 m!93457))

(declare-fun m!93459 () Bool)

(assert (=> b!59336 m!93459))

(declare-fun m!93461 () Bool)

(assert (=> b!59336 m!93461))

(declare-fun m!93463 () Bool)

(assert (=> b!59336 m!93463))

(declare-fun m!93465 () Bool)

(assert (=> b!59336 m!93465))

(declare-fun m!93467 () Bool)

(assert (=> b!59336 m!93467))

(declare-fun m!93469 () Bool)

(assert (=> b!59336 m!93469))

(declare-fun m!93471 () Bool)

(assert (=> b!59338 m!93471))

(declare-fun m!93473 () Bool)

(assert (=> b!59330 m!93473))

(declare-fun m!93475 () Bool)

(assert (=> b!59339 m!93475))

(assert (=> b!59339 m!93475))

(declare-fun m!93477 () Bool)

(assert (=> b!59339 m!93477))

(declare-fun m!93479 () Bool)

(assert (=> b!59339 m!93479))

(assert (=> b!59339 m!93479))

(declare-fun m!93481 () Bool)

(assert (=> b!59339 m!93481))

(declare-fun m!93483 () Bool)

(assert (=> b!59332 m!93483))

(declare-fun m!93485 () Bool)

(assert (=> b!59340 m!93485))

(declare-fun m!93487 () Bool)

(assert (=> b!59334 m!93487))

(push 1)

(assert (not b!59336))

(assert (not b!59339))

(assert (not b!59332))

(assert (not b!59329))

(assert (not b!59330))

(assert (not b!59335))

(assert (not b!59333))

(assert (not b!59341))

(assert (not b!59338))

(assert (not b!59337))

(assert (not b!59334))

(assert (not b!59340))

(assert (not start!11844))

(check-sat)

(pop 1)

(push 1)

(check-sat)

