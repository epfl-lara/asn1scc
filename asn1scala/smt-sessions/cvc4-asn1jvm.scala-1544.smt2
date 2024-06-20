; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43336 () Bool)

(assert start!43336)

(declare-fun b!204431 () Bool)

(declare-fun res!171305 () Bool)

(declare-fun e!139996 () Bool)

(assert (=> b!204431 (=> (not res!171305) (not e!139996))))

(declare-datatypes ((array!10338 0))(
  ( (array!10339 (arr!5475 (Array (_ BitVec 32) (_ BitVec 8))) (size!4545 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8198 0))(
  ( (BitStream!8199 (buf!5050 array!10338) (currentByte!9535 (_ BitVec 32)) (currentBit!9530 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8198)

(declare-datatypes ((Unit!14581 0))(
  ( (Unit!14582) )
))
(declare-datatypes ((tuple2!17488 0))(
  ( (tuple2!17489 (_1!9396 Unit!14581) (_2!9396 BitStream!8198)) )
))
(declare-fun lt!319413 () tuple2!17488)

(declare-fun isPrefixOf!0 (BitStream!8198 BitStream!8198) Bool)

(assert (=> b!204431 (= res!171305 (isPrefixOf!0 thiss!1204 (_2!9396 lt!319413)))))

(declare-fun b!204432 () Bool)

(declare-fun e!139997 () Bool)

(declare-fun e!139993 () Bool)

(assert (=> b!204432 (= e!139997 (not e!139993))))

(declare-fun res!171313 () Bool)

(assert (=> b!204432 (=> res!171313 e!139993)))

(declare-fun lt!319417 () (_ BitVec 64))

(declare-fun lt!319414 () (_ BitVec 64))

(assert (=> b!204432 (= res!171313 (not (= lt!319417 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!319414))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!204432 (= lt!319417 (bitIndex!0 (size!4545 (buf!5050 (_2!9396 lt!319413))) (currentByte!9535 (_2!9396 lt!319413)) (currentBit!9530 (_2!9396 lt!319413))))))

(assert (=> b!204432 (= lt!319414 (bitIndex!0 (size!4545 (buf!5050 thiss!1204)) (currentByte!9535 thiss!1204) (currentBit!9530 thiss!1204)))))

(declare-fun e!139998 () Bool)

(assert (=> b!204432 e!139998))

(declare-fun res!171306 () Bool)

(assert (=> b!204432 (=> (not res!171306) (not e!139998))))

(assert (=> b!204432 (= res!171306 (= (size!4545 (buf!5050 thiss!1204)) (size!4545 (buf!5050 (_2!9396 lt!319413)))))))

(declare-fun lt!319411 () Bool)

(declare-fun appendBit!0 (BitStream!8198 Bool) tuple2!17488)

(assert (=> b!204432 (= lt!319413 (appendBit!0 thiss!1204 lt!319411))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!204432 (= lt!319411 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!204433 () Bool)

(declare-fun e!139995 () Bool)

(declare-datatypes ((tuple2!17490 0))(
  ( (tuple2!17491 (_1!9397 BitStream!8198) (_2!9397 Bool)) )
))
(declare-fun lt!319409 () tuple2!17490)

(declare-fun lt!319408 () (_ BitVec 64))

(assert (=> b!204433 (= e!139995 (= (bitIndex!0 (size!4545 (buf!5050 (_1!9397 lt!319409))) (currentByte!9535 (_1!9397 lt!319409)) (currentBit!9530 (_1!9397 lt!319409))) lt!319408))))

(declare-fun b!204434 () Bool)

(declare-fun e!139992 () Bool)

(assert (=> b!204434 (= e!139993 e!139992)))

(declare-fun res!171308 () Bool)

(assert (=> b!204434 (=> res!171308 e!139992)))

(declare-fun lt!319416 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!204434 (= res!171308 (not (= lt!319416 (bvsub (bvsub (bvadd lt!319417 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun lt!319418 () tuple2!17488)

(assert (=> b!204434 (= lt!319416 (bitIndex!0 (size!4545 (buf!5050 (_2!9396 lt!319418))) (currentByte!9535 (_2!9396 lt!319418)) (currentBit!9530 (_2!9396 lt!319418))))))

(assert (=> b!204434 (isPrefixOf!0 thiss!1204 (_2!9396 lt!319418))))

(declare-fun lt!319415 () Unit!14581)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8198 BitStream!8198 BitStream!8198) Unit!14581)

(assert (=> b!204434 (= lt!319415 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9396 lt!319413) (_2!9396 lt!319418)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8198 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17488)

(assert (=> b!204434 (= lt!319418 (appendBitsLSBFirstLoopTR!0 (_2!9396 lt!319413) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!204435 () Bool)

(declare-fun res!171309 () Bool)

(assert (=> b!204435 (=> res!171309 e!139992)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!204435 (= res!171309 (not (invariant!0 (currentBit!9530 (_2!9396 lt!319418)) (currentByte!9535 (_2!9396 lt!319418)) (size!4545 (buf!5050 (_2!9396 lt!319418))))))))

(declare-fun res!171314 () Bool)

(assert (=> start!43336 (=> (not res!171314) (not e!139997))))

(assert (=> start!43336 (= res!171314 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!43336 e!139997))

(assert (=> start!43336 true))

(declare-fun e!139994 () Bool)

(declare-fun inv!12 (BitStream!8198) Bool)

(assert (=> start!43336 (and (inv!12 thiss!1204) e!139994)))

(declare-fun b!204436 () Bool)

(assert (=> b!204436 (= e!139992 true)))

(declare-fun lt!319412 () Bool)

(assert (=> b!204436 (= lt!319412 (isPrefixOf!0 thiss!1204 (_2!9396 lt!319413)))))

(declare-fun b!204437 () Bool)

(declare-fun res!171304 () Bool)

(assert (=> b!204437 (=> (not res!171304) (not e!139997))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!204437 (= res!171304 (validate_offset_bits!1 ((_ sign_extend 32) (size!4545 (buf!5050 thiss!1204))) ((_ sign_extend 32) (currentByte!9535 thiss!1204)) ((_ sign_extend 32) (currentBit!9530 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!204438 () Bool)

(declare-fun res!171312 () Bool)

(assert (=> b!204438 (=> (not res!171312) (not e!139997))))

(assert (=> b!204438 (= res!171312 (invariant!0 (currentBit!9530 thiss!1204) (currentByte!9535 thiss!1204) (size!4545 (buf!5050 thiss!1204))))))

(declare-fun b!204439 () Bool)

(declare-fun array_inv!4286 (array!10338) Bool)

(assert (=> b!204439 (= e!139994 (array_inv!4286 (buf!5050 thiss!1204)))))

(declare-fun b!204440 () Bool)

(declare-fun res!171303 () Bool)

(assert (=> b!204440 (=> res!171303 e!139992)))

(assert (=> b!204440 (= res!171303 (or (not (= (size!4545 (buf!5050 (_2!9396 lt!319418))) (size!4545 (buf!5050 thiss!1204)))) (not (= lt!319416 (bvsub (bvadd lt!319414 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!204441 () Bool)

(assert (=> b!204441 (= e!139998 e!139996)))

(declare-fun res!171311 () Bool)

(assert (=> b!204441 (=> (not res!171311) (not e!139996))))

(declare-fun lt!319410 () (_ BitVec 64))

(assert (=> b!204441 (= res!171311 (= lt!319408 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!319410)))))

(assert (=> b!204441 (= lt!319408 (bitIndex!0 (size!4545 (buf!5050 (_2!9396 lt!319413))) (currentByte!9535 (_2!9396 lt!319413)) (currentBit!9530 (_2!9396 lt!319413))))))

(assert (=> b!204441 (= lt!319410 (bitIndex!0 (size!4545 (buf!5050 thiss!1204)) (currentByte!9535 thiss!1204) (currentBit!9530 thiss!1204)))))

(declare-fun b!204442 () Bool)

(declare-fun res!171310 () Bool)

(assert (=> b!204442 (=> res!171310 e!139992)))

(assert (=> b!204442 (= res!171310 (not (isPrefixOf!0 (_2!9396 lt!319413) (_2!9396 lt!319418))))))

(declare-fun b!204443 () Bool)

(assert (=> b!204443 (= e!139996 e!139995)))

(declare-fun res!171307 () Bool)

(assert (=> b!204443 (=> (not res!171307) (not e!139995))))

(assert (=> b!204443 (= res!171307 (and (= (_2!9397 lt!319409) lt!319411) (= (_1!9397 lt!319409) (_2!9396 lt!319413))))))

(declare-fun readBitPure!0 (BitStream!8198) tuple2!17490)

(declare-fun readerFrom!0 (BitStream!8198 (_ BitVec 32) (_ BitVec 32)) BitStream!8198)

(assert (=> b!204443 (= lt!319409 (readBitPure!0 (readerFrom!0 (_2!9396 lt!319413) (currentBit!9530 thiss!1204) (currentByte!9535 thiss!1204))))))

(declare-fun b!204444 () Bool)

(declare-fun res!171302 () Bool)

(assert (=> b!204444 (=> (not res!171302) (not e!139997))))

(assert (=> b!204444 (= res!171302 (not (= i!590 nBits!348)))))

(assert (= (and start!43336 res!171314) b!204437))

(assert (= (and b!204437 res!171304) b!204438))

(assert (= (and b!204438 res!171312) b!204444))

(assert (= (and b!204444 res!171302) b!204432))

(assert (= (and b!204432 res!171306) b!204441))

(assert (= (and b!204441 res!171311) b!204431))

(assert (= (and b!204431 res!171305) b!204443))

(assert (= (and b!204443 res!171307) b!204433))

(assert (= (and b!204432 (not res!171313)) b!204434))

(assert (= (and b!204434 (not res!171308)) b!204435))

(assert (= (and b!204435 (not res!171309)) b!204440))

(assert (= (and b!204440 (not res!171303)) b!204442))

(assert (= (and b!204442 (not res!171310)) b!204436))

(assert (= start!43336 b!204439))

(declare-fun m!315563 () Bool)

(assert (=> b!204442 m!315563))

(declare-fun m!315565 () Bool)

(assert (=> b!204438 m!315565))

(declare-fun m!315567 () Bool)

(assert (=> b!204431 m!315567))

(declare-fun m!315569 () Bool)

(assert (=> b!204439 m!315569))

(declare-fun m!315571 () Bool)

(assert (=> b!204432 m!315571))

(declare-fun m!315573 () Bool)

(assert (=> b!204432 m!315573))

(declare-fun m!315575 () Bool)

(assert (=> b!204432 m!315575))

(assert (=> b!204436 m!315567))

(assert (=> b!204441 m!315571))

(assert (=> b!204441 m!315573))

(declare-fun m!315577 () Bool)

(assert (=> b!204437 m!315577))

(declare-fun m!315579 () Bool)

(assert (=> b!204433 m!315579))

(declare-fun m!315581 () Bool)

(assert (=> start!43336 m!315581))

(declare-fun m!315583 () Bool)

(assert (=> b!204435 m!315583))

(declare-fun m!315585 () Bool)

(assert (=> b!204443 m!315585))

(assert (=> b!204443 m!315585))

(declare-fun m!315587 () Bool)

(assert (=> b!204443 m!315587))

(declare-fun m!315589 () Bool)

(assert (=> b!204434 m!315589))

(declare-fun m!315591 () Bool)

(assert (=> b!204434 m!315591))

(declare-fun m!315593 () Bool)

(assert (=> b!204434 m!315593))

(declare-fun m!315595 () Bool)

(assert (=> b!204434 m!315595))

(push 1)

