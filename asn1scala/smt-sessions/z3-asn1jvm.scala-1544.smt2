; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43334 () Bool)

(assert start!43334)

(declare-fun b!204389 () Bool)

(declare-fun e!139974 () Bool)

(declare-datatypes ((array!10336 0))(
  ( (array!10337 (arr!5474 (Array (_ BitVec 32) (_ BitVec 8))) (size!4544 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8196 0))(
  ( (BitStream!8197 (buf!5049 array!10336) (currentByte!9534 (_ BitVec 32)) (currentBit!9529 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8196)

(declare-fun array_inv!4285 (array!10336) Bool)

(assert (=> b!204389 (= e!139974 (array_inv!4285 (buf!5049 thiss!1204)))))

(declare-fun b!204390 () Bool)

(declare-fun res!171263 () Bool)

(declare-fun e!139972 () Bool)

(assert (=> b!204390 (=> res!171263 e!139972)))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun lt!319385 () (_ BitVec 64))

(declare-fun lt!319382 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-datatypes ((Unit!14579 0))(
  ( (Unit!14580) )
))
(declare-datatypes ((tuple2!17484 0))(
  ( (tuple2!17485 (_1!9394 Unit!14579) (_2!9394 BitStream!8196)) )
))
(declare-fun lt!319377 () tuple2!17484)

(assert (=> b!204390 (= res!171263 (or (not (= (size!4544 (buf!5049 (_2!9394 lt!319377))) (size!4544 (buf!5049 thiss!1204)))) (not (= lt!319382 (bvsub (bvadd lt!319385 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!204391 () Bool)

(declare-fun res!171268 () Bool)

(declare-fun e!139969 () Bool)

(assert (=> b!204391 (=> (not res!171268) (not e!139969))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!204391 (= res!171268 (validate_offset_bits!1 ((_ sign_extend 32) (size!4544 (buf!5049 thiss!1204))) ((_ sign_extend 32) (currentByte!9534 thiss!1204)) ((_ sign_extend 32) (currentBit!9529 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!204392 () Bool)

(declare-fun e!139973 () Bool)

(assert (=> b!204392 (= e!139973 e!139972)))

(declare-fun res!171273 () Bool)

(assert (=> b!204392 (=> res!171273 e!139972)))

(declare-fun lt!319379 () (_ BitVec 64))

(assert (=> b!204392 (= res!171273 (not (= lt!319382 (bvsub (bvsub (bvadd lt!319379 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!204392 (= lt!319382 (bitIndex!0 (size!4544 (buf!5049 (_2!9394 lt!319377))) (currentByte!9534 (_2!9394 lt!319377)) (currentBit!9529 (_2!9394 lt!319377))))))

(declare-fun isPrefixOf!0 (BitStream!8196 BitStream!8196) Bool)

(assert (=> b!204392 (isPrefixOf!0 thiss!1204 (_2!9394 lt!319377))))

(declare-fun lt!319383 () tuple2!17484)

(declare-fun lt!319376 () Unit!14579)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8196 BitStream!8196 BitStream!8196) Unit!14579)

(assert (=> b!204392 (= lt!319376 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9394 lt!319383) (_2!9394 lt!319377)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8196 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17484)

(assert (=> b!204392 (= lt!319377 (appendBitsLSBFirstLoopTR!0 (_2!9394 lt!319383) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!204393 () Bool)

(declare-fun res!171275 () Bool)

(assert (=> b!204393 (=> res!171275 e!139972)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!204393 (= res!171275 (not (invariant!0 (currentBit!9529 (_2!9394 lt!319377)) (currentByte!9534 (_2!9394 lt!319377)) (size!4544 (buf!5049 (_2!9394 lt!319377))))))))

(declare-fun b!204394 () Bool)

(declare-fun res!171267 () Bool)

(assert (=> b!204394 (=> (not res!171267) (not e!139969))))

(assert (=> b!204394 (= res!171267 (invariant!0 (currentBit!9529 thiss!1204) (currentByte!9534 thiss!1204) (size!4544 (buf!5049 thiss!1204))))))

(declare-fun b!204395 () Bool)

(declare-fun e!139971 () Bool)

(declare-fun e!139970 () Bool)

(assert (=> b!204395 (= e!139971 e!139970)))

(declare-fun res!171271 () Bool)

(assert (=> b!204395 (=> (not res!171271) (not e!139970))))

(declare-fun lt!319384 () (_ BitVec 64))

(declare-fun lt!319375 () (_ BitVec 64))

(assert (=> b!204395 (= res!171271 (= lt!319384 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!319375)))))

(assert (=> b!204395 (= lt!319384 (bitIndex!0 (size!4544 (buf!5049 (_2!9394 lt!319383))) (currentByte!9534 (_2!9394 lt!319383)) (currentBit!9529 (_2!9394 lt!319383))))))

(assert (=> b!204395 (= lt!319375 (bitIndex!0 (size!4544 (buf!5049 thiss!1204)) (currentByte!9534 thiss!1204) (currentBit!9529 thiss!1204)))))

(declare-fun b!204396 () Bool)

(declare-fun e!139967 () Bool)

(assert (=> b!204396 (= e!139970 e!139967)))

(declare-fun res!171270 () Bool)

(assert (=> b!204396 (=> (not res!171270) (not e!139967))))

(declare-fun lt!319381 () Bool)

(declare-datatypes ((tuple2!17486 0))(
  ( (tuple2!17487 (_1!9395 BitStream!8196) (_2!9395 Bool)) )
))
(declare-fun lt!319380 () tuple2!17486)

(assert (=> b!204396 (= res!171270 (and (= (_2!9395 lt!319380) lt!319381) (= (_1!9395 lt!319380) (_2!9394 lt!319383))))))

(declare-fun readBitPure!0 (BitStream!8196) tuple2!17486)

(declare-fun readerFrom!0 (BitStream!8196 (_ BitVec 32) (_ BitVec 32)) BitStream!8196)

(assert (=> b!204396 (= lt!319380 (readBitPure!0 (readerFrom!0 (_2!9394 lt!319383) (currentBit!9529 thiss!1204) (currentByte!9534 thiss!1204))))))

(declare-fun b!204398 () Bool)

(declare-fun res!171269 () Bool)

(assert (=> b!204398 (=> (not res!171269) (not e!139970))))

(assert (=> b!204398 (= res!171269 (isPrefixOf!0 thiss!1204 (_2!9394 lt!319383)))))

(declare-fun b!204399 () Bool)

(assert (=> b!204399 (= e!139967 (= (bitIndex!0 (size!4544 (buf!5049 (_1!9395 lt!319380))) (currentByte!9534 (_1!9395 lt!319380)) (currentBit!9529 (_1!9395 lt!319380))) lt!319384))))

(declare-fun b!204400 () Bool)

(declare-fun res!171274 () Bool)

(assert (=> b!204400 (=> (not res!171274) (not e!139969))))

(assert (=> b!204400 (= res!171274 (not (= i!590 nBits!348)))))

(declare-fun b!204401 () Bool)

(assert (=> b!204401 (= e!139972 true)))

(declare-fun lt!319378 () Bool)

(assert (=> b!204401 (= lt!319378 (isPrefixOf!0 thiss!1204 (_2!9394 lt!319383)))))

(declare-fun b!204402 () Bool)

(assert (=> b!204402 (= e!139969 (not e!139973))))

(declare-fun res!171264 () Bool)

(assert (=> b!204402 (=> res!171264 e!139973)))

(assert (=> b!204402 (= res!171264 (not (= lt!319379 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!319385))))))

(assert (=> b!204402 (= lt!319379 (bitIndex!0 (size!4544 (buf!5049 (_2!9394 lt!319383))) (currentByte!9534 (_2!9394 lt!319383)) (currentBit!9529 (_2!9394 lt!319383))))))

(assert (=> b!204402 (= lt!319385 (bitIndex!0 (size!4544 (buf!5049 thiss!1204)) (currentByte!9534 thiss!1204) (currentBit!9529 thiss!1204)))))

(assert (=> b!204402 e!139971))

(declare-fun res!171272 () Bool)

(assert (=> b!204402 (=> (not res!171272) (not e!139971))))

(assert (=> b!204402 (= res!171272 (= (size!4544 (buf!5049 thiss!1204)) (size!4544 (buf!5049 (_2!9394 lt!319383)))))))

(declare-fun appendBit!0 (BitStream!8196 Bool) tuple2!17484)

(assert (=> b!204402 (= lt!319383 (appendBit!0 thiss!1204 lt!319381))))

(assert (=> b!204402 (= lt!319381 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!204397 () Bool)

(declare-fun res!171266 () Bool)

(assert (=> b!204397 (=> res!171266 e!139972)))

(assert (=> b!204397 (= res!171266 (not (isPrefixOf!0 (_2!9394 lt!319383) (_2!9394 lt!319377))))))

(declare-fun res!171265 () Bool)

(assert (=> start!43334 (=> (not res!171265) (not e!139969))))

(assert (=> start!43334 (= res!171265 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!43334 e!139969))

(assert (=> start!43334 true))

(declare-fun inv!12 (BitStream!8196) Bool)

(assert (=> start!43334 (and (inv!12 thiss!1204) e!139974)))

(assert (= (and start!43334 res!171265) b!204391))

(assert (= (and b!204391 res!171268) b!204394))

(assert (= (and b!204394 res!171267) b!204400))

(assert (= (and b!204400 res!171274) b!204402))

(assert (= (and b!204402 res!171272) b!204395))

(assert (= (and b!204395 res!171271) b!204398))

(assert (= (and b!204398 res!171269) b!204396))

(assert (= (and b!204396 res!171270) b!204399))

(assert (= (and b!204402 (not res!171264)) b!204392))

(assert (= (and b!204392 (not res!171273)) b!204393))

(assert (= (and b!204393 (not res!171275)) b!204390))

(assert (= (and b!204390 (not res!171263)) b!204397))

(assert (= (and b!204397 (not res!171266)) b!204401))

(assert (= start!43334 b!204389))

(declare-fun m!315529 () Bool)

(assert (=> b!204398 m!315529))

(declare-fun m!315531 () Bool)

(assert (=> start!43334 m!315531))

(declare-fun m!315533 () Bool)

(assert (=> b!204391 m!315533))

(declare-fun m!315535 () Bool)

(assert (=> b!204399 m!315535))

(declare-fun m!315537 () Bool)

(assert (=> b!204392 m!315537))

(declare-fun m!315539 () Bool)

(assert (=> b!204392 m!315539))

(declare-fun m!315541 () Bool)

(assert (=> b!204392 m!315541))

(declare-fun m!315543 () Bool)

(assert (=> b!204392 m!315543))

(declare-fun m!315545 () Bool)

(assert (=> b!204394 m!315545))

(declare-fun m!315547 () Bool)

(assert (=> b!204395 m!315547))

(declare-fun m!315549 () Bool)

(assert (=> b!204395 m!315549))

(assert (=> b!204401 m!315529))

(assert (=> b!204402 m!315547))

(assert (=> b!204402 m!315549))

(declare-fun m!315551 () Bool)

(assert (=> b!204402 m!315551))

(declare-fun m!315553 () Bool)

(assert (=> b!204389 m!315553))

(declare-fun m!315555 () Bool)

(assert (=> b!204393 m!315555))

(declare-fun m!315557 () Bool)

(assert (=> b!204397 m!315557))

(declare-fun m!315559 () Bool)

(assert (=> b!204396 m!315559))

(assert (=> b!204396 m!315559))

(declare-fun m!315561 () Bool)

(assert (=> b!204396 m!315561))

(check-sat (not b!204397) (not b!204399) (not start!43334) (not b!204396) (not b!204389) (not b!204392) (not b!204393) (not b!204401) (not b!204402) (not b!204394) (not b!204395) (not b!204391) (not b!204398))
