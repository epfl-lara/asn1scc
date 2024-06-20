; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22984 () Bool)

(assert start!22984)

(declare-fun b!116450 () Bool)

(declare-fun e!76330 () Bool)

(declare-datatypes ((array!5248 0))(
  ( (array!5249 (arr!2974 (Array (_ BitVec 32) (_ BitVec 8))) (size!2381 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4236 0))(
  ( (BitStream!4237 (buf!2791 array!5248) (currentByte!5428 (_ BitVec 32)) (currentBit!5423 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4236)

(declare-datatypes ((Unit!7167 0))(
  ( (Unit!7168) )
))
(declare-datatypes ((tuple2!9648 0))(
  ( (tuple2!9649 (_1!5089 Unit!7167) (_2!5089 BitStream!4236)) )
))
(declare-fun lt!177966 () tuple2!9648)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!116450 (= e!76330 (invariant!0 (currentBit!5423 thiss!1305) (currentByte!5428 thiss!1305) (size!2381 (buf!2791 (_2!5089 lt!177966)))))))

(declare-fun b!116451 () Bool)

(declare-fun e!76331 () Bool)

(declare-fun e!76328 () Bool)

(assert (=> b!116451 (= e!76331 e!76328)))

(declare-fun res!96283 () Bool)

(assert (=> b!116451 (=> (not res!96283) (not e!76328))))

(declare-fun lt!177962 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!116451 (= res!96283 (validate_offset_bits!1 ((_ sign_extend 32) (size!2381 (buf!2791 thiss!1305))) ((_ sign_extend 32) (currentByte!5428 thiss!1305)) ((_ sign_extend 32) (currentBit!5423 thiss!1305)) lt!177962))))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!116451 (= lt!177962 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun res!96284 () Bool)

(assert (=> start!22984 (=> (not res!96284) (not e!76331))))

(assert (=> start!22984 (= res!96284 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!22984 e!76331))

(assert (=> start!22984 true))

(declare-fun e!76329 () Bool)

(declare-fun inv!12 (BitStream!4236) Bool)

(assert (=> start!22984 (and (inv!12 thiss!1305) e!76329)))

(declare-fun b!116452 () Bool)

(declare-fun e!76327 () Bool)

(declare-datatypes ((tuple2!9650 0))(
  ( (tuple2!9651 (_1!5090 BitStream!4236) (_2!5090 Bool)) )
))
(declare-fun lt!177958 () tuple2!9650)

(declare-fun lt!177972 () tuple2!9650)

(assert (=> b!116452 (= e!76327 (= (_2!5090 lt!177958) (_2!5090 lt!177972)))))

(declare-fun b!116453 () Bool)

(declare-fun array_inv!2183 (array!5248) Bool)

(assert (=> b!116453 (= e!76329 (array_inv!2183 (buf!2791 thiss!1305)))))

(declare-fun b!116454 () Bool)

(declare-fun lt!177973 () tuple2!9650)

(declare-fun lt!177974 () (_ BitVec 64))

(assert (=> b!116454 (= e!76328 (not (or (not (_2!5090 lt!177973)) (and (bvsge lt!177974 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!177974 #b0000000000000000000000000000000000000000000000000000000001000000)))))))

(declare-fun v!199 () (_ BitVec 64))

(declare-datatypes ((tuple2!9652 0))(
  ( (tuple2!9653 (_1!5091 BitStream!4236) (_2!5091 (_ BitVec 64))) )
))
(declare-fun lt!177968 () tuple2!9652)

(declare-datatypes ((tuple2!9654 0))(
  ( (tuple2!9655 (_1!5092 BitStream!4236) (_2!5092 BitStream!4236)) )
))
(declare-fun lt!177975 () tuple2!9654)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4236 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9652)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!116454 (= lt!177968 (readNLeastSignificantBitsLoopPure!0 (_1!5092 lt!177975) nBits!396 i!615 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615))))))))

(assert (=> b!116454 (validate_offset_bits!1 ((_ sign_extend 32) (size!2381 (buf!2791 (_2!5089 lt!177966)))) ((_ sign_extend 32) (currentByte!5428 thiss!1305)) ((_ sign_extend 32) (currentBit!5423 thiss!1305)) lt!177962)))

(declare-fun lt!177960 () Unit!7167)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4236 array!5248 (_ BitVec 64)) Unit!7167)

(assert (=> b!116454 (= lt!177960 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2791 (_2!5089 lt!177966)) lt!177962))))

(declare-fun lt!177959 () Bool)

(assert (=> b!116454 (= (_2!5090 lt!177973) lt!177959)))

(declare-fun readBitPure!0 (BitStream!4236) tuple2!9650)

(assert (=> b!116454 (= lt!177973 (readBitPure!0 (_1!5092 lt!177975)))))

(declare-fun lt!177971 () tuple2!9654)

(declare-fun lt!177961 () tuple2!9648)

(declare-fun reader!0 (BitStream!4236 BitStream!4236) tuple2!9654)

(assert (=> b!116454 (= lt!177971 (reader!0 (_2!5089 lt!177961) (_2!5089 lt!177966)))))

(assert (=> b!116454 (= lt!177975 (reader!0 thiss!1305 (_2!5089 lt!177966)))))

(assert (=> b!116454 e!76327))

(declare-fun res!96282 () Bool)

(assert (=> b!116454 (=> (not res!96282) (not e!76327))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!116454 (= res!96282 (= (bitIndex!0 (size!2381 (buf!2791 (_1!5090 lt!177958))) (currentByte!5428 (_1!5090 lt!177958)) (currentBit!5423 (_1!5090 lt!177958))) (bitIndex!0 (size!2381 (buf!2791 (_1!5090 lt!177972))) (currentByte!5428 (_1!5090 lt!177972)) (currentBit!5423 (_1!5090 lt!177972)))))))

(declare-fun lt!177965 () Unit!7167)

(declare-fun lt!177964 () BitStream!4236)

(declare-fun readBitPrefixLemma!0 (BitStream!4236 BitStream!4236) Unit!7167)

(assert (=> b!116454 (= lt!177965 (readBitPrefixLemma!0 lt!177964 (_2!5089 lt!177966)))))

(assert (=> b!116454 (= lt!177972 (readBitPure!0 (BitStream!4237 (buf!2791 (_2!5089 lt!177966)) (currentByte!5428 thiss!1305) (currentBit!5423 thiss!1305))))))

(assert (=> b!116454 (= lt!177958 (readBitPure!0 lt!177964))))

(assert (=> b!116454 (= lt!177964 (BitStream!4237 (buf!2791 (_2!5089 lt!177961)) (currentByte!5428 thiss!1305) (currentBit!5423 thiss!1305)))))

(assert (=> b!116454 e!76330))

(declare-fun res!96288 () Bool)

(assert (=> b!116454 (=> (not res!96288) (not e!76330))))

(declare-fun isPrefixOf!0 (BitStream!4236 BitStream!4236) Bool)

(assert (=> b!116454 (= res!96288 (isPrefixOf!0 thiss!1305 (_2!5089 lt!177966)))))

(declare-fun lt!177969 () Unit!7167)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4236 BitStream!4236 BitStream!4236) Unit!7167)

(assert (=> b!116454 (= lt!177969 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5089 lt!177961) (_2!5089 lt!177966)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4236 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9648)

(assert (=> b!116454 (= lt!177966 (appendNLeastSignificantBitsLoop!0 (_2!5089 lt!177961) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!76324 () Bool)

(assert (=> b!116454 e!76324))

(declare-fun res!96285 () Bool)

(assert (=> b!116454 (=> (not res!96285) (not e!76324))))

(assert (=> b!116454 (= res!96285 (= (size!2381 (buf!2791 thiss!1305)) (size!2381 (buf!2791 (_2!5089 lt!177961)))))))

(declare-fun appendBit!0 (BitStream!4236 Bool) tuple2!9648)

(assert (=> b!116454 (= lt!177961 (appendBit!0 thiss!1305 lt!177959))))

(assert (=> b!116454 (= lt!177959 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 lt!177974)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!116454 (= lt!177974 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))))

(declare-fun b!116455 () Bool)

(declare-fun e!76326 () Bool)

(declare-fun e!76325 () Bool)

(assert (=> b!116455 (= e!76326 e!76325)))

(declare-fun res!96286 () Bool)

(assert (=> b!116455 (=> (not res!96286) (not e!76325))))

(declare-fun lt!177963 () tuple2!9650)

(assert (=> b!116455 (= res!96286 (and (= (_2!5090 lt!177963) lt!177959) (= (_1!5090 lt!177963) (_2!5089 lt!177961))))))

(declare-fun readerFrom!0 (BitStream!4236 (_ BitVec 32) (_ BitVec 32)) BitStream!4236)

(assert (=> b!116455 (= lt!177963 (readBitPure!0 (readerFrom!0 (_2!5089 lt!177961) (currentBit!5423 thiss!1305) (currentByte!5428 thiss!1305))))))

(declare-fun b!116456 () Bool)

(declare-fun res!96289 () Bool)

(assert (=> b!116456 (=> (not res!96289) (not e!76328))))

(assert (=> b!116456 (= res!96289 (bvslt i!615 nBits!396))))

(declare-fun b!116457 () Bool)

(declare-fun res!96281 () Bool)

(assert (=> b!116457 (=> (not res!96281) (not e!76330))))

(assert (=> b!116457 (= res!96281 (invariant!0 (currentBit!5423 thiss!1305) (currentByte!5428 thiss!1305) (size!2381 (buf!2791 (_2!5089 lt!177961)))))))

(declare-fun b!116458 () Bool)

(assert (=> b!116458 (= e!76324 e!76326)))

(declare-fun res!96291 () Bool)

(assert (=> b!116458 (=> (not res!96291) (not e!76326))))

(declare-fun lt!177970 () (_ BitVec 64))

(declare-fun lt!177967 () (_ BitVec 64))

(assert (=> b!116458 (= res!96291 (= lt!177970 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!177967)))))

(assert (=> b!116458 (= lt!177970 (bitIndex!0 (size!2381 (buf!2791 (_2!5089 lt!177961))) (currentByte!5428 (_2!5089 lt!177961)) (currentBit!5423 (_2!5089 lt!177961))))))

(assert (=> b!116458 (= lt!177967 (bitIndex!0 (size!2381 (buf!2791 thiss!1305)) (currentByte!5428 thiss!1305) (currentBit!5423 thiss!1305)))))

(declare-fun b!116459 () Bool)

(declare-fun res!96287 () Bool)

(assert (=> b!116459 (=> (not res!96287) (not e!76328))))

(assert (=> b!116459 (= res!96287 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!116460 () Bool)

(declare-fun res!96290 () Bool)

(assert (=> b!116460 (=> (not res!96290) (not e!76326))))

(assert (=> b!116460 (= res!96290 (isPrefixOf!0 thiss!1305 (_2!5089 lt!177961)))))

(declare-fun b!116461 () Bool)

(assert (=> b!116461 (= e!76325 (= (bitIndex!0 (size!2381 (buf!2791 (_1!5090 lt!177963))) (currentByte!5428 (_1!5090 lt!177963)) (currentBit!5423 (_1!5090 lt!177963))) lt!177970))))

(assert (= (and start!22984 res!96284) b!116451))

(assert (= (and b!116451 res!96283) b!116459))

(assert (= (and b!116459 res!96287) b!116456))

(assert (= (and b!116456 res!96289) b!116454))

(assert (= (and b!116454 res!96285) b!116458))

(assert (= (and b!116458 res!96291) b!116460))

(assert (= (and b!116460 res!96290) b!116455))

(assert (= (and b!116455 res!96286) b!116461))

(assert (= (and b!116454 res!96288) b!116457))

(assert (= (and b!116457 res!96281) b!116450))

(assert (= (and b!116454 res!96282) b!116452))

(assert (= start!22984 b!116453))

(declare-fun m!174379 () Bool)

(assert (=> b!116451 m!174379))

(declare-fun m!174381 () Bool)

(assert (=> b!116460 m!174381))

(declare-fun m!174383 () Bool)

(assert (=> b!116458 m!174383))

(declare-fun m!174385 () Bool)

(assert (=> b!116458 m!174385))

(declare-fun m!174387 () Bool)

(assert (=> b!116461 m!174387))

(declare-fun m!174389 () Bool)

(assert (=> b!116453 m!174389))

(declare-fun m!174391 () Bool)

(assert (=> b!116454 m!174391))

(declare-fun m!174393 () Bool)

(assert (=> b!116454 m!174393))

(declare-fun m!174395 () Bool)

(assert (=> b!116454 m!174395))

(declare-fun m!174397 () Bool)

(assert (=> b!116454 m!174397))

(declare-fun m!174399 () Bool)

(assert (=> b!116454 m!174399))

(declare-fun m!174401 () Bool)

(assert (=> b!116454 m!174401))

(declare-fun m!174403 () Bool)

(assert (=> b!116454 m!174403))

(declare-fun m!174405 () Bool)

(assert (=> b!116454 m!174405))

(declare-fun m!174407 () Bool)

(assert (=> b!116454 m!174407))

(declare-fun m!174409 () Bool)

(assert (=> b!116454 m!174409))

(declare-fun m!174411 () Bool)

(assert (=> b!116454 m!174411))

(declare-fun m!174413 () Bool)

(assert (=> b!116454 m!174413))

(declare-fun m!174415 () Bool)

(assert (=> b!116454 m!174415))

(declare-fun m!174417 () Bool)

(assert (=> b!116454 m!174417))

(declare-fun m!174419 () Bool)

(assert (=> b!116454 m!174419))

(declare-fun m!174421 () Bool)

(assert (=> b!116454 m!174421))

(declare-fun m!174423 () Bool)

(assert (=> b!116450 m!174423))

(declare-fun m!174425 () Bool)

(assert (=> b!116459 m!174425))

(declare-fun m!174427 () Bool)

(assert (=> start!22984 m!174427))

(declare-fun m!174429 () Bool)

(assert (=> b!116455 m!174429))

(assert (=> b!116455 m!174429))

(declare-fun m!174431 () Bool)

(assert (=> b!116455 m!174431))

(declare-fun m!174433 () Bool)

(assert (=> b!116457 m!174433))

(check-sat (not b!116458) (not b!116457) (not b!116454) (not start!22984) (not b!116459) (not b!116461) (not b!116455) (not b!116450) (not b!116460) (not b!116453) (not b!116451))
(check-sat)
