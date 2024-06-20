; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40186 () Bool)

(assert start!40186)

(declare-fun b!183519 () Bool)

(declare-fun res!152589 () Bool)

(declare-fun e!127238 () Bool)

(assert (=> b!183519 (=> (not res!152589) (not e!127238))))

(declare-datatypes ((array!9754 0))(
  ( (array!9755 (arr!5231 (Array (_ BitVec 32) (_ BitVec 8))) (size!4301 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7710 0))(
  ( (BitStream!7711 (buf!4756 array!9754) (currentByte!8990 (_ BitVec 32)) (currentBit!8985 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7710)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!183519 (= res!152589 (invariant!0 (currentBit!8985 thiss!1204) (currentByte!8990 thiss!1204) (size!4301 (buf!4756 thiss!1204))))))

(declare-fun b!183520 () Bool)

(declare-fun e!127244 () Bool)

(declare-fun array_inv!4042 (array!9754) Bool)

(assert (=> b!183520 (= e!127244 (array_inv!4042 (buf!4756 thiss!1204)))))

(declare-fun b!183521 () Bool)

(declare-fun res!152576 () Bool)

(declare-fun e!127239 () Bool)

(assert (=> b!183521 (=> res!152576 e!127239)))

(declare-fun i!590 () (_ BitVec 32))

(declare-datatypes ((Unit!13177 0))(
  ( (Unit!13178) )
))
(declare-datatypes ((tuple2!15844 0))(
  ( (tuple2!15845 (_1!8567 Unit!13177) (_2!8567 BitStream!7710)) )
))
(declare-fun lt!282470 () tuple2!15844)

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun lt!282480 () (_ BitVec 64))

(declare-fun lt!282465 () (_ BitVec 64))

(assert (=> b!183521 (= res!152576 (or (not (= (size!4301 (buf!4756 (_2!8567 lt!282470))) (size!4301 (buf!4756 thiss!1204)))) (not (= lt!282465 (bvsub (bvadd lt!282480 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!183522 () Bool)

(declare-fun e!127243 () Bool)

(assert (=> b!183522 (= e!127243 true)))

(declare-datatypes ((tuple2!15846 0))(
  ( (tuple2!15847 (_1!8568 BitStream!7710) (_2!8568 BitStream!7710)) )
))
(declare-fun lt!282485 () tuple2!15846)

(declare-fun lt!282486 () (_ BitVec 64))

(declare-datatypes ((tuple2!15848 0))(
  ( (tuple2!15849 (_1!8569 BitStream!7710) (_2!8569 (_ BitVec 64))) )
))
(declare-fun lt!282471 () tuple2!15848)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7710 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!15848)

(declare-fun withMovedBitIndex!0 (BitStream!7710 (_ BitVec 64)) BitStream!7710)

(assert (=> b!183522 (= lt!282471 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8568 lt!282485) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!282486))))

(declare-fun b!183523 () Bool)

(declare-fun res!152572 () Bool)

(assert (=> b!183523 (=> res!152572 e!127239)))

(declare-fun lt!282488 () tuple2!15844)

(declare-fun isPrefixOf!0 (BitStream!7710 BitStream!7710) Bool)

(assert (=> b!183523 (= res!152572 (not (isPrefixOf!0 (_2!8567 lt!282488) (_2!8567 lt!282470))))))

(declare-fun b!183524 () Bool)

(declare-fun res!152587 () Bool)

(assert (=> b!183524 (=> res!152587 e!127239)))

(assert (=> b!183524 (= res!152587 (not (isPrefixOf!0 thiss!1204 (_2!8567 lt!282488))))))

(declare-fun b!183525 () Bool)

(declare-fun res!152590 () Bool)

(declare-fun e!127241 () Bool)

(assert (=> b!183525 (=> (not res!152590) (not e!127241))))

(assert (=> b!183525 (= res!152590 (isPrefixOf!0 thiss!1204 (_2!8567 lt!282488)))))

(declare-fun res!152584 () Bool)

(declare-fun e!127236 () Bool)

(assert (=> start!40186 (=> (not res!152584) (not e!127236))))

(assert (=> start!40186 (= res!152584 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!40186 e!127236))

(assert (=> start!40186 true))

(declare-fun inv!12 (BitStream!7710) Bool)

(assert (=> start!40186 (and (inv!12 thiss!1204) e!127244)))

(declare-fun b!183526 () Bool)

(declare-fun res!152585 () Bool)

(assert (=> b!183526 (=> res!152585 e!127243)))

(assert (=> b!183526 (= res!152585 (bvsge i!590 nBits!348))))

(declare-fun b!183527 () Bool)

(declare-fun e!127235 () Bool)

(assert (=> b!183527 (= e!127235 (invariant!0 (currentBit!8985 thiss!1204) (currentByte!8990 thiss!1204) (size!4301 (buf!4756 (_2!8567 lt!282470)))))))

(declare-fun b!183528 () Bool)

(declare-fun e!127240 () Bool)

(declare-datatypes ((tuple2!15850 0))(
  ( (tuple2!15851 (_1!8570 BitStream!7710) (_2!8570 Bool)) )
))
(declare-fun lt!282482 () tuple2!15850)

(declare-fun lt!282477 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!183528 (= e!127240 (= (bitIndex!0 (size!4301 (buf!4756 (_1!8570 lt!282482))) (currentByte!8990 (_1!8570 lt!282482)) (currentBit!8985 (_1!8570 lt!282482))) lt!282477))))

(declare-fun b!183529 () Bool)

(declare-fun e!127242 () Bool)

(assert (=> b!183529 (= e!127238 (not e!127242))))

(declare-fun res!152575 () Bool)

(assert (=> b!183529 (=> res!152575 e!127242)))

(declare-fun lt!282487 () (_ BitVec 64))

(assert (=> b!183529 (= res!152575 (not (= lt!282487 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!282480))))))

(assert (=> b!183529 (= lt!282487 (bitIndex!0 (size!4301 (buf!4756 (_2!8567 lt!282488))) (currentByte!8990 (_2!8567 lt!282488)) (currentBit!8985 (_2!8567 lt!282488))))))

(assert (=> b!183529 (= lt!282480 (bitIndex!0 (size!4301 (buf!4756 thiss!1204)) (currentByte!8990 thiss!1204) (currentBit!8985 thiss!1204)))))

(declare-fun e!127245 () Bool)

(assert (=> b!183529 e!127245))

(declare-fun res!152574 () Bool)

(assert (=> b!183529 (=> (not res!152574) (not e!127245))))

(assert (=> b!183529 (= res!152574 (= (size!4301 (buf!4756 thiss!1204)) (size!4301 (buf!4756 (_2!8567 lt!282488)))))))

(declare-fun lt!282467 () Bool)

(declare-fun appendBit!0 (BitStream!7710 Bool) tuple2!15844)

(assert (=> b!183529 (= lt!282488 (appendBit!0 thiss!1204 lt!282467))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun lt!282479 () (_ BitVec 64))

(assert (=> b!183529 (= lt!282467 (not (= (bvand v!189 lt!282479) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!183529 (= lt!282479 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!183530 () Bool)

(assert (=> b!183530 (= e!127239 e!127243)))

(declare-fun res!152588 () Bool)

(assert (=> b!183530 (=> res!152588 e!127243)))

(declare-fun lt!282468 () tuple2!15846)

(assert (=> b!183530 (= res!152588 (not (= (_1!8569 (readNBitsLSBFirstsLoopPure!0 (_1!8568 lt!282468) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!282486)) (_2!8568 lt!282468))))))

(declare-fun lt!282481 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!183530 (validate_offset_bits!1 ((_ sign_extend 32) (size!4301 (buf!4756 (_2!8567 lt!282470)))) ((_ sign_extend 32) (currentByte!8990 (_2!8567 lt!282488))) ((_ sign_extend 32) (currentBit!8985 (_2!8567 lt!282488))) lt!282481)))

(declare-fun lt!282484 () Unit!13177)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7710 array!9754 (_ BitVec 64)) Unit!13177)

(assert (=> b!183530 (= lt!282484 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8567 lt!282488) (buf!4756 (_2!8567 lt!282470)) lt!282481))))

(assert (=> b!183530 (= lt!282481 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!282469 () tuple2!15850)

(declare-fun lt!282483 () (_ BitVec 64))

(assert (=> b!183530 (= lt!282486 (bvor lt!282483 (ite (_2!8570 lt!282469) lt!282479 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!282476 () tuple2!15848)

(assert (=> b!183530 (= lt!282476 (readNBitsLSBFirstsLoopPure!0 (_1!8568 lt!282485) nBits!348 i!590 lt!282483))))

(declare-fun lt!282474 () (_ BitVec 64))

(assert (=> b!183530 (validate_offset_bits!1 ((_ sign_extend 32) (size!4301 (buf!4756 (_2!8567 lt!282470)))) ((_ sign_extend 32) (currentByte!8990 thiss!1204)) ((_ sign_extend 32) (currentBit!8985 thiss!1204)) lt!282474)))

(declare-fun lt!282475 () Unit!13177)

(assert (=> b!183530 (= lt!282475 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4756 (_2!8567 lt!282470)) lt!282474))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!183530 (= lt!282483 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!183530 (= (_2!8570 lt!282469) lt!282467)))

(declare-fun readBitPure!0 (BitStream!7710) tuple2!15850)

(assert (=> b!183530 (= lt!282469 (readBitPure!0 (_1!8568 lt!282485)))))

(declare-fun reader!0 (BitStream!7710 BitStream!7710) tuple2!15846)

(assert (=> b!183530 (= lt!282468 (reader!0 (_2!8567 lt!282488) (_2!8567 lt!282470)))))

(assert (=> b!183530 (= lt!282485 (reader!0 thiss!1204 (_2!8567 lt!282470)))))

(declare-fun e!127237 () Bool)

(assert (=> b!183530 e!127237))

(declare-fun res!152582 () Bool)

(assert (=> b!183530 (=> (not res!152582) (not e!127237))))

(declare-fun lt!282478 () tuple2!15850)

(declare-fun lt!282464 () tuple2!15850)

(assert (=> b!183530 (= res!152582 (= (bitIndex!0 (size!4301 (buf!4756 (_1!8570 lt!282478))) (currentByte!8990 (_1!8570 lt!282478)) (currentBit!8985 (_1!8570 lt!282478))) (bitIndex!0 (size!4301 (buf!4756 (_1!8570 lt!282464))) (currentByte!8990 (_1!8570 lt!282464)) (currentBit!8985 (_1!8570 lt!282464)))))))

(declare-fun lt!282463 () Unit!13177)

(declare-fun lt!282473 () BitStream!7710)

(declare-fun readBitPrefixLemma!0 (BitStream!7710 BitStream!7710) Unit!13177)

(assert (=> b!183530 (= lt!282463 (readBitPrefixLemma!0 lt!282473 (_2!8567 lt!282470)))))

(assert (=> b!183530 (= lt!282464 (readBitPure!0 (BitStream!7711 (buf!4756 (_2!8567 lt!282470)) (currentByte!8990 thiss!1204) (currentBit!8985 thiss!1204))))))

(assert (=> b!183530 (= lt!282478 (readBitPure!0 lt!282473))))

(assert (=> b!183530 e!127235))

(declare-fun res!152581 () Bool)

(assert (=> b!183530 (=> (not res!152581) (not e!127235))))

(assert (=> b!183530 (= res!152581 (invariant!0 (currentBit!8985 thiss!1204) (currentByte!8990 thiss!1204) (size!4301 (buf!4756 (_2!8567 lt!282488)))))))

(assert (=> b!183530 (= lt!282473 (BitStream!7711 (buf!4756 (_2!8567 lt!282488)) (currentByte!8990 thiss!1204) (currentBit!8985 thiss!1204)))))

(declare-fun b!183531 () Bool)

(assert (=> b!183531 (= e!127236 e!127238)))

(declare-fun res!152586 () Bool)

(assert (=> b!183531 (=> (not res!152586) (not e!127238))))

(assert (=> b!183531 (= res!152586 (validate_offset_bits!1 ((_ sign_extend 32) (size!4301 (buf!4756 thiss!1204))) ((_ sign_extend 32) (currentByte!8990 thiss!1204)) ((_ sign_extend 32) (currentBit!8985 thiss!1204)) lt!282474))))

(assert (=> b!183531 (= lt!282474 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!183532 () Bool)

(assert (=> b!183532 (= e!127245 e!127241)))

(declare-fun res!152577 () Bool)

(assert (=> b!183532 (=> (not res!152577) (not e!127241))))

(declare-fun lt!282472 () (_ BitVec 64))

(assert (=> b!183532 (= res!152577 (= lt!282477 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!282472)))))

(assert (=> b!183532 (= lt!282477 (bitIndex!0 (size!4301 (buf!4756 (_2!8567 lt!282488))) (currentByte!8990 (_2!8567 lt!282488)) (currentBit!8985 (_2!8567 lt!282488))))))

(assert (=> b!183532 (= lt!282472 (bitIndex!0 (size!4301 (buf!4756 thiss!1204)) (currentByte!8990 thiss!1204) (currentBit!8985 thiss!1204)))))

(declare-fun b!183533 () Bool)

(declare-fun res!152583 () Bool)

(assert (=> b!183533 (=> res!152583 e!127243)))

(assert (=> b!183533 (= res!152583 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!4301 (buf!4756 (_1!8568 lt!282485)))) ((_ sign_extend 32) (currentByte!8990 (_1!8568 lt!282485))) ((_ sign_extend 32) (currentBit!8985 (_1!8568 lt!282485))) lt!282474)))))

(declare-fun b!183534 () Bool)

(assert (=> b!183534 (= e!127237 (= (_2!8570 lt!282478) (_2!8570 lt!282464)))))

(declare-fun b!183535 () Bool)

(declare-fun res!152591 () Bool)

(assert (=> b!183535 (=> res!152591 e!127243)))

(assert (=> b!183535 (= res!152591 (not (= (bvand lt!282483 #b1111111111111111111111111111111111111111111111111111111111111111) lt!282483)))))

(declare-fun b!183536 () Bool)

(assert (=> b!183536 (= e!127242 e!127239)))

(declare-fun res!152592 () Bool)

(assert (=> b!183536 (=> res!152592 e!127239)))

(assert (=> b!183536 (= res!152592 (not (= lt!282465 (bvsub (bvsub (bvadd lt!282487 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!183536 (= lt!282465 (bitIndex!0 (size!4301 (buf!4756 (_2!8567 lt!282470))) (currentByte!8990 (_2!8567 lt!282470)) (currentBit!8985 (_2!8567 lt!282470))))))

(assert (=> b!183536 (isPrefixOf!0 thiss!1204 (_2!8567 lt!282470))))

(declare-fun lt!282466 () Unit!13177)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7710 BitStream!7710 BitStream!7710) Unit!13177)

(assert (=> b!183536 (= lt!282466 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8567 lt!282488) (_2!8567 lt!282470)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7710 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15844)

(assert (=> b!183536 (= lt!282470 (appendBitsLSBFirstLoopTR!0 (_2!8567 lt!282488) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!183537 () Bool)

(assert (=> b!183537 (= e!127241 e!127240)))

(declare-fun res!152579 () Bool)

(assert (=> b!183537 (=> (not res!152579) (not e!127240))))

(assert (=> b!183537 (= res!152579 (and (= (_2!8570 lt!282482) lt!282467) (= (_1!8570 lt!282482) (_2!8567 lt!282488))))))

(declare-fun readerFrom!0 (BitStream!7710 (_ BitVec 32) (_ BitVec 32)) BitStream!7710)

(assert (=> b!183537 (= lt!282482 (readBitPure!0 (readerFrom!0 (_2!8567 lt!282488) (currentBit!8985 thiss!1204) (currentByte!8990 thiss!1204))))))

(declare-fun b!183538 () Bool)

(declare-fun res!152578 () Bool)

(assert (=> b!183538 (=> (not res!152578) (not e!127238))))

(assert (=> b!183538 (= res!152578 (not (= i!590 nBits!348)))))

(declare-fun b!183539 () Bool)

(declare-fun res!152580 () Bool)

(assert (=> b!183539 (=> res!152580 e!127239)))

(assert (=> b!183539 (= res!152580 (not (invariant!0 (currentBit!8985 (_2!8567 lt!282470)) (currentByte!8990 (_2!8567 lt!282470)) (size!4301 (buf!4756 (_2!8567 lt!282470))))))))

(declare-fun b!183540 () Bool)

(declare-fun res!152573 () Bool)

(assert (=> b!183540 (=> res!152573 e!127243)))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!183540 (= res!152573 (not (= (bvand lt!282483 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!40186 res!152584) b!183531))

(assert (= (and b!183531 res!152586) b!183519))

(assert (= (and b!183519 res!152589) b!183538))

(assert (= (and b!183538 res!152578) b!183529))

(assert (= (and b!183529 res!152574) b!183532))

(assert (= (and b!183532 res!152577) b!183525))

(assert (= (and b!183525 res!152590) b!183537))

(assert (= (and b!183537 res!152579) b!183528))

(assert (= (and b!183529 (not res!152575)) b!183536))

(assert (= (and b!183536 (not res!152592)) b!183539))

(assert (= (and b!183539 (not res!152580)) b!183521))

(assert (= (and b!183521 (not res!152576)) b!183523))

(assert (= (and b!183523 (not res!152572)) b!183524))

(assert (= (and b!183524 (not res!152587)) b!183530))

(assert (= (and b!183530 res!152581) b!183527))

(assert (= (and b!183530 res!152582) b!183534))

(assert (= (and b!183530 (not res!152588)) b!183526))

(assert (= (and b!183526 (not res!152585)) b!183533))

(assert (= (and b!183533 (not res!152583)) b!183540))

(assert (= (and b!183540 (not res!152573)) b!183535))

(assert (= (and b!183535 (not res!152591)) b!183522))

(assert (= start!40186 b!183520))

(declare-fun m!285449 () Bool)

(assert (=> b!183529 m!285449))

(declare-fun m!285451 () Bool)

(assert (=> b!183529 m!285451))

(declare-fun m!285453 () Bool)

(assert (=> b!183529 m!285453))

(declare-fun m!285455 () Bool)

(assert (=> b!183524 m!285455))

(declare-fun m!285457 () Bool)

(assert (=> b!183523 m!285457))

(declare-fun m!285459 () Bool)

(assert (=> b!183530 m!285459))

(declare-fun m!285461 () Bool)

(assert (=> b!183530 m!285461))

(declare-fun m!285463 () Bool)

(assert (=> b!183530 m!285463))

(declare-fun m!285465 () Bool)

(assert (=> b!183530 m!285465))

(declare-fun m!285467 () Bool)

(assert (=> b!183530 m!285467))

(declare-fun m!285469 () Bool)

(assert (=> b!183530 m!285469))

(declare-fun m!285471 () Bool)

(assert (=> b!183530 m!285471))

(declare-fun m!285473 () Bool)

(assert (=> b!183530 m!285473))

(declare-fun m!285475 () Bool)

(assert (=> b!183530 m!285475))

(declare-fun m!285477 () Bool)

(assert (=> b!183530 m!285477))

(declare-fun m!285479 () Bool)

(assert (=> b!183530 m!285479))

(declare-fun m!285481 () Bool)

(assert (=> b!183530 m!285481))

(declare-fun m!285483 () Bool)

(assert (=> b!183530 m!285483))

(declare-fun m!285485 () Bool)

(assert (=> b!183530 m!285485))

(declare-fun m!285487 () Bool)

(assert (=> b!183530 m!285487))

(declare-fun m!285489 () Bool)

(assert (=> b!183530 m!285489))

(assert (=> b!183532 m!285449))

(assert (=> b!183532 m!285451))

(declare-fun m!285491 () Bool)

(assert (=> b!183540 m!285491))

(declare-fun m!285493 () Bool)

(assert (=> b!183528 m!285493))

(declare-fun m!285495 () Bool)

(assert (=> b!183533 m!285495))

(declare-fun m!285497 () Bool)

(assert (=> b!183519 m!285497))

(declare-fun m!285499 () Bool)

(assert (=> b!183536 m!285499))

(declare-fun m!285501 () Bool)

(assert (=> b!183536 m!285501))

(declare-fun m!285503 () Bool)

(assert (=> b!183536 m!285503))

(declare-fun m!285505 () Bool)

(assert (=> b!183536 m!285505))

(declare-fun m!285507 () Bool)

(assert (=> start!40186 m!285507))

(declare-fun m!285509 () Bool)

(assert (=> b!183527 m!285509))

(assert (=> b!183525 m!285455))

(declare-fun m!285511 () Bool)

(assert (=> b!183520 m!285511))

(declare-fun m!285513 () Bool)

(assert (=> b!183539 m!285513))

(declare-fun m!285515 () Bool)

(assert (=> b!183531 m!285515))

(declare-fun m!285517 () Bool)

(assert (=> b!183522 m!285517))

(assert (=> b!183522 m!285517))

(declare-fun m!285519 () Bool)

(assert (=> b!183522 m!285519))

(declare-fun m!285521 () Bool)

(assert (=> b!183537 m!285521))

(assert (=> b!183537 m!285521))

(declare-fun m!285523 () Bool)

(assert (=> b!183537 m!285523))

(check-sat (not b!183531) (not b!183523) (not b!183529) (not b!183540) (not b!183537) (not b!183524) (not b!183530) (not b!183522) (not b!183528) (not b!183539) (not b!183520) (not b!183525) (not b!183536) (not b!183533) (not b!183527) (not b!183532) (not start!40186) (not b!183519))
