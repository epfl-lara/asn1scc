; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39442 () Bool)

(assert start!39442)

(declare-fun b!177492 () Bool)

(declare-fun e!123688 () Bool)

(declare-datatypes ((array!9583 0))(
  ( (array!9584 (arr!5156 (Array (_ BitVec 32) (_ BitVec 8))) (size!4226 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7560 0))(
  ( (BitStream!7561 (buf!4669 array!9583) (currentByte!8849 (_ BitVec 32)) (currentBit!8844 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15300 0))(
  ( (tuple2!15301 (_1!8295 BitStream!7560) (_2!8295 Bool)) )
))
(declare-fun lt!272516 () tuple2!15300)

(declare-fun lt!272519 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!177492 (= e!123688 (= (bitIndex!0 (size!4226 (buf!4669 (_1!8295 lt!272516))) (currentByte!8849 (_1!8295 lt!272516)) (currentBit!8844 (_1!8295 lt!272516))) lt!272519))))

(declare-fun res!147149 () Bool)

(declare-fun e!123683 () Bool)

(assert (=> start!39442 (=> (not res!147149) (not e!123683))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!39442 (= res!147149 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39442 e!123683))

(assert (=> start!39442 true))

(declare-fun thiss!1204 () BitStream!7560)

(declare-fun e!123685 () Bool)

(declare-fun inv!12 (BitStream!7560) Bool)

(assert (=> start!39442 (and (inv!12 thiss!1204) e!123685)))

(declare-fun b!177493 () Bool)

(declare-fun res!147145 () Bool)

(declare-fun e!123686 () Bool)

(assert (=> b!177493 (=> (not res!147145) (not e!123686))))

(declare-datatypes ((Unit!12766 0))(
  ( (Unit!12767) )
))
(declare-datatypes ((tuple2!15302 0))(
  ( (tuple2!15303 (_1!8296 Unit!12766) (_2!8296 BitStream!7560)) )
))
(declare-fun lt!272520 () tuple2!15302)

(declare-fun isPrefixOf!0 (BitStream!7560 BitStream!7560) Bool)

(assert (=> b!177493 (= res!147145 (isPrefixOf!0 thiss!1204 (_2!8296 lt!272520)))))

(declare-fun b!177494 () Bool)

(declare-fun res!147147 () Bool)

(assert (=> b!177494 (=> (not res!147147) (not e!123683))))

(assert (=> b!177494 (= res!147147 (not (= i!590 nBits!348)))))

(declare-fun b!177495 () Bool)

(declare-fun e!123682 () Bool)

(assert (=> b!177495 (= e!123683 (not e!123682))))

(declare-fun res!147144 () Bool)

(assert (=> b!177495 (=> res!147144 e!123682)))

(assert (=> b!177495 (= res!147144 (not (= (bitIndex!0 (size!4226 (buf!4669 (_2!8296 lt!272520))) (currentByte!8849 (_2!8296 lt!272520)) (currentBit!8844 (_2!8296 lt!272520))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!4226 (buf!4669 thiss!1204)) (currentByte!8849 thiss!1204) (currentBit!8844 thiss!1204))))))))

(declare-fun e!123684 () Bool)

(assert (=> b!177495 e!123684))

(declare-fun res!147148 () Bool)

(assert (=> b!177495 (=> (not res!147148) (not e!123684))))

(assert (=> b!177495 (= res!147148 (= (size!4226 (buf!4669 thiss!1204)) (size!4226 (buf!4669 (_2!8296 lt!272520)))))))

(declare-fun lt!272518 () Bool)

(declare-fun appendBit!0 (BitStream!7560 Bool) tuple2!15302)

(assert (=> b!177495 (= lt!272520 (appendBit!0 thiss!1204 lt!272518))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!177495 (= lt!272518 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!177496 () Bool)

(assert (=> b!177496 (= e!123686 e!123688)))

(declare-fun res!147142 () Bool)

(assert (=> b!177496 (=> (not res!147142) (not e!123688))))

(assert (=> b!177496 (= res!147142 (and (= (_2!8295 lt!272516) lt!272518) (= (_1!8295 lt!272516) (_2!8296 lt!272520))))))

(declare-fun readBitPure!0 (BitStream!7560) tuple2!15300)

(declare-fun readerFrom!0 (BitStream!7560 (_ BitVec 32) (_ BitVec 32)) BitStream!7560)

(assert (=> b!177496 (= lt!272516 (readBitPure!0 (readerFrom!0 (_2!8296 lt!272520) (currentBit!8844 thiss!1204) (currentByte!8849 thiss!1204))))))

(declare-fun b!177497 () Bool)

(declare-fun res!147143 () Bool)

(assert (=> b!177497 (=> (not res!147143) (not e!123683))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!177497 (= res!147143 (validate_offset_bits!1 ((_ sign_extend 32) (size!4226 (buf!4669 thiss!1204))) ((_ sign_extend 32) (currentByte!8849 thiss!1204)) ((_ sign_extend 32) (currentBit!8844 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!177498 () Bool)

(declare-fun array_inv!3967 (array!9583) Bool)

(assert (=> b!177498 (= e!123685 (array_inv!3967 (buf!4669 thiss!1204)))))

(declare-fun b!177499 () Bool)

(declare-fun res!147150 () Bool)

(assert (=> b!177499 (=> (not res!147150) (not e!123683))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!177499 (= res!147150 (invariant!0 (currentBit!8844 thiss!1204) (currentByte!8849 thiss!1204) (size!4226 (buf!4669 thiss!1204))))))

(declare-fun b!177500 () Bool)

(assert (=> b!177500 (= e!123684 e!123686)))

(declare-fun res!147146 () Bool)

(assert (=> b!177500 (=> (not res!147146) (not e!123686))))

(declare-fun lt!272522 () (_ BitVec 64))

(assert (=> b!177500 (= res!147146 (= lt!272519 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!272522)))))

(assert (=> b!177500 (= lt!272519 (bitIndex!0 (size!4226 (buf!4669 (_2!8296 lt!272520))) (currentByte!8849 (_2!8296 lt!272520)) (currentBit!8844 (_2!8296 lt!272520))))))

(assert (=> b!177500 (= lt!272522 (bitIndex!0 (size!4226 (buf!4669 thiss!1204)) (currentByte!8849 thiss!1204) (currentBit!8844 thiss!1204)))))

(declare-fun b!177501 () Bool)

(declare-fun lt!272521 () tuple2!15302)

(assert (=> b!177501 (= e!123682 (invariant!0 (currentBit!8844 (_2!8296 lt!272521)) (currentByte!8849 (_2!8296 lt!272521)) (size!4226 (buf!4669 (_2!8296 lt!272521)))))))

(assert (=> b!177501 (isPrefixOf!0 thiss!1204 (_2!8296 lt!272521))))

(declare-fun lt!272517 () Unit!12766)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7560 BitStream!7560 BitStream!7560) Unit!12766)

(assert (=> b!177501 (= lt!272517 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8296 lt!272520) (_2!8296 lt!272521)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7560 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15302)

(assert (=> b!177501 (= lt!272521 (appendBitsLSBFirstLoopTR!0 (_2!8296 lt!272520) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(assert (= (and start!39442 res!147149) b!177497))

(assert (= (and b!177497 res!147143) b!177499))

(assert (= (and b!177499 res!147150) b!177494))

(assert (= (and b!177494 res!147147) b!177495))

(assert (= (and b!177495 res!147148) b!177500))

(assert (= (and b!177500 res!147146) b!177493))

(assert (= (and b!177493 res!147145) b!177496))

(assert (= (and b!177496 res!147142) b!177492))

(assert (= (and b!177495 (not res!147144)) b!177501))

(assert (= start!39442 b!177498))

(declare-fun m!277387 () Bool)

(assert (=> b!177500 m!277387))

(declare-fun m!277389 () Bool)

(assert (=> b!177500 m!277389))

(declare-fun m!277391 () Bool)

(assert (=> b!177496 m!277391))

(assert (=> b!177496 m!277391))

(declare-fun m!277393 () Bool)

(assert (=> b!177496 m!277393))

(declare-fun m!277395 () Bool)

(assert (=> b!177501 m!277395))

(declare-fun m!277397 () Bool)

(assert (=> b!177501 m!277397))

(declare-fun m!277399 () Bool)

(assert (=> b!177501 m!277399))

(declare-fun m!277401 () Bool)

(assert (=> b!177501 m!277401))

(declare-fun m!277403 () Bool)

(assert (=> b!177497 m!277403))

(declare-fun m!277405 () Bool)

(assert (=> start!39442 m!277405))

(declare-fun m!277407 () Bool)

(assert (=> b!177499 m!277407))

(declare-fun m!277409 () Bool)

(assert (=> b!177492 m!277409))

(declare-fun m!277411 () Bool)

(assert (=> b!177498 m!277411))

(declare-fun m!277413 () Bool)

(assert (=> b!177493 m!277413))

(assert (=> b!177495 m!277387))

(assert (=> b!177495 m!277389))

(declare-fun m!277415 () Bool)

(assert (=> b!177495 m!277415))

(check-sat (not b!177500) (not b!177492) (not start!39442) (not b!177499) (not b!177493) (not b!177498) (not b!177496) (not b!177495) (not b!177497) (not b!177501))
(check-sat)
(get-model)

(declare-fun d!62445 () Bool)

(assert (=> d!62445 (= (invariant!0 (currentBit!8844 thiss!1204) (currentByte!8849 thiss!1204) (size!4226 (buf!4669 thiss!1204))) (and (bvsge (currentBit!8844 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!8844 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!8849 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!8849 thiss!1204) (size!4226 (buf!4669 thiss!1204))) (and (= (currentBit!8844 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!8849 thiss!1204) (size!4226 (buf!4669 thiss!1204)))))))))

(assert (=> b!177499 d!62445))

(declare-fun d!62447 () Bool)

(declare-fun res!147184 () Bool)

(declare-fun e!123715 () Bool)

(assert (=> d!62447 (=> (not res!147184) (not e!123715))))

(assert (=> d!62447 (= res!147184 (= (size!4226 (buf!4669 thiss!1204)) (size!4226 (buf!4669 (_2!8296 lt!272520)))))))

(assert (=> d!62447 (= (isPrefixOf!0 thiss!1204 (_2!8296 lt!272520)) e!123715)))

(declare-fun b!177538 () Bool)

(declare-fun res!147185 () Bool)

(assert (=> b!177538 (=> (not res!147185) (not e!123715))))

(assert (=> b!177538 (= res!147185 (bvsle (bitIndex!0 (size!4226 (buf!4669 thiss!1204)) (currentByte!8849 thiss!1204) (currentBit!8844 thiss!1204)) (bitIndex!0 (size!4226 (buf!4669 (_2!8296 lt!272520))) (currentByte!8849 (_2!8296 lt!272520)) (currentBit!8844 (_2!8296 lt!272520)))))))

(declare-fun b!177539 () Bool)

(declare-fun e!123714 () Bool)

(assert (=> b!177539 (= e!123715 e!123714)))

(declare-fun res!147186 () Bool)

(assert (=> b!177539 (=> res!147186 e!123714)))

(assert (=> b!177539 (= res!147186 (= (size!4226 (buf!4669 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!177540 () Bool)

(declare-fun arrayBitRangesEq!0 (array!9583 array!9583 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!177540 (= e!123714 (arrayBitRangesEq!0 (buf!4669 thiss!1204) (buf!4669 (_2!8296 lt!272520)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4226 (buf!4669 thiss!1204)) (currentByte!8849 thiss!1204) (currentBit!8844 thiss!1204))))))

(assert (= (and d!62447 res!147184) b!177538))

(assert (= (and b!177538 res!147185) b!177539))

(assert (= (and b!177539 (not res!147186)) b!177540))

(assert (=> b!177538 m!277389))

(assert (=> b!177538 m!277387))

(assert (=> b!177540 m!277389))

(assert (=> b!177540 m!277389))

(declare-fun m!277447 () Bool)

(assert (=> b!177540 m!277447))

(assert (=> b!177493 d!62447))

(declare-fun d!62449 () Bool)

(declare-fun e!123718 () Bool)

(assert (=> d!62449 e!123718))

(declare-fun res!147192 () Bool)

(assert (=> d!62449 (=> (not res!147192) (not e!123718))))

(declare-fun lt!272557 () (_ BitVec 64))

(declare-fun lt!272560 () (_ BitVec 64))

(declare-fun lt!272559 () (_ BitVec 64))

(assert (=> d!62449 (= res!147192 (= lt!272560 (bvsub lt!272559 lt!272557)))))

(assert (=> d!62449 (or (= (bvand lt!272559 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!272557 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!272559 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!272559 lt!272557) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!62449 (= lt!272557 (remainingBits!0 ((_ sign_extend 32) (size!4226 (buf!4669 (_2!8296 lt!272520)))) ((_ sign_extend 32) (currentByte!8849 (_2!8296 lt!272520))) ((_ sign_extend 32) (currentBit!8844 (_2!8296 lt!272520)))))))

(declare-fun lt!272561 () (_ BitVec 64))

(declare-fun lt!272558 () (_ BitVec 64))

(assert (=> d!62449 (= lt!272559 (bvmul lt!272561 lt!272558))))

(assert (=> d!62449 (or (= lt!272561 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!272558 (bvsdiv (bvmul lt!272561 lt!272558) lt!272561)))))

(assert (=> d!62449 (= lt!272558 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62449 (= lt!272561 ((_ sign_extend 32) (size!4226 (buf!4669 (_2!8296 lt!272520)))))))

(assert (=> d!62449 (= lt!272560 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8849 (_2!8296 lt!272520))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8844 (_2!8296 lt!272520)))))))

(assert (=> d!62449 (invariant!0 (currentBit!8844 (_2!8296 lt!272520)) (currentByte!8849 (_2!8296 lt!272520)) (size!4226 (buf!4669 (_2!8296 lt!272520))))))

(assert (=> d!62449 (= (bitIndex!0 (size!4226 (buf!4669 (_2!8296 lt!272520))) (currentByte!8849 (_2!8296 lt!272520)) (currentBit!8844 (_2!8296 lt!272520))) lt!272560)))

(declare-fun b!177545 () Bool)

(declare-fun res!147191 () Bool)

(assert (=> b!177545 (=> (not res!147191) (not e!123718))))

(assert (=> b!177545 (= res!147191 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!272560))))

(declare-fun b!177546 () Bool)

(declare-fun lt!272556 () (_ BitVec 64))

(assert (=> b!177546 (= e!123718 (bvsle lt!272560 (bvmul lt!272556 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!177546 (or (= lt!272556 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!272556 #b0000000000000000000000000000000000000000000000000000000000001000) lt!272556)))))

(assert (=> b!177546 (= lt!272556 ((_ sign_extend 32) (size!4226 (buf!4669 (_2!8296 lt!272520)))))))

(assert (= (and d!62449 res!147192) b!177545))

(assert (= (and b!177545 res!147191) b!177546))

(declare-fun m!277449 () Bool)

(assert (=> d!62449 m!277449))

(declare-fun m!277451 () Bool)

(assert (=> d!62449 m!277451))

(assert (=> b!177495 d!62449))

(declare-fun d!62451 () Bool)

(declare-fun e!123719 () Bool)

(assert (=> d!62451 e!123719))

(declare-fun res!147194 () Bool)

(assert (=> d!62451 (=> (not res!147194) (not e!123719))))

(declare-fun lt!272566 () (_ BitVec 64))

(declare-fun lt!272565 () (_ BitVec 64))

(declare-fun lt!272563 () (_ BitVec 64))

(assert (=> d!62451 (= res!147194 (= lt!272566 (bvsub lt!272565 lt!272563)))))

(assert (=> d!62451 (or (= (bvand lt!272565 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!272563 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!272565 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!272565 lt!272563) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62451 (= lt!272563 (remainingBits!0 ((_ sign_extend 32) (size!4226 (buf!4669 thiss!1204))) ((_ sign_extend 32) (currentByte!8849 thiss!1204)) ((_ sign_extend 32) (currentBit!8844 thiss!1204))))))

(declare-fun lt!272567 () (_ BitVec 64))

(declare-fun lt!272564 () (_ BitVec 64))

(assert (=> d!62451 (= lt!272565 (bvmul lt!272567 lt!272564))))

(assert (=> d!62451 (or (= lt!272567 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!272564 (bvsdiv (bvmul lt!272567 lt!272564) lt!272567)))))

(assert (=> d!62451 (= lt!272564 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62451 (= lt!272567 ((_ sign_extend 32) (size!4226 (buf!4669 thiss!1204))))))

(assert (=> d!62451 (= lt!272566 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8849 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8844 thiss!1204))))))

(assert (=> d!62451 (invariant!0 (currentBit!8844 thiss!1204) (currentByte!8849 thiss!1204) (size!4226 (buf!4669 thiss!1204)))))

(assert (=> d!62451 (= (bitIndex!0 (size!4226 (buf!4669 thiss!1204)) (currentByte!8849 thiss!1204) (currentBit!8844 thiss!1204)) lt!272566)))

(declare-fun b!177547 () Bool)

(declare-fun res!147193 () Bool)

(assert (=> b!177547 (=> (not res!147193) (not e!123719))))

(assert (=> b!177547 (= res!147193 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!272566))))

(declare-fun b!177548 () Bool)

(declare-fun lt!272562 () (_ BitVec 64))

(assert (=> b!177548 (= e!123719 (bvsle lt!272566 (bvmul lt!272562 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!177548 (or (= lt!272562 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!272562 #b0000000000000000000000000000000000000000000000000000000000001000) lt!272562)))))

(assert (=> b!177548 (= lt!272562 ((_ sign_extend 32) (size!4226 (buf!4669 thiss!1204))))))

(assert (= (and d!62451 res!147194) b!177547))

(assert (= (and b!177547 res!147193) b!177548))

(declare-fun m!277453 () Bool)

(assert (=> d!62451 m!277453))

(assert (=> d!62451 m!277407))

(assert (=> b!177495 d!62451))

(declare-fun b!177564 () Bool)

(declare-fun e!123728 () Bool)

(declare-fun lt!272580 () tuple2!15300)

(declare-fun lt!272579 () tuple2!15302)

(assert (=> b!177564 (= e!123728 (= (bitIndex!0 (size!4226 (buf!4669 (_1!8295 lt!272580))) (currentByte!8849 (_1!8295 lt!272580)) (currentBit!8844 (_1!8295 lt!272580))) (bitIndex!0 (size!4226 (buf!4669 (_2!8296 lt!272579))) (currentByte!8849 (_2!8296 lt!272579)) (currentBit!8844 (_2!8296 lt!272579)))))))

(declare-fun b!177561 () Bool)

(declare-fun res!147209 () Bool)

(declare-fun e!123727 () Bool)

(assert (=> b!177561 (=> (not res!147209) (not e!123727))))

(declare-fun lt!272581 () (_ BitVec 64))

(declare-fun lt!272582 () (_ BitVec 64))

(assert (=> b!177561 (= res!147209 (= (bitIndex!0 (size!4226 (buf!4669 (_2!8296 lt!272579))) (currentByte!8849 (_2!8296 lt!272579)) (currentBit!8844 (_2!8296 lt!272579))) (bvadd lt!272581 lt!272582)))))

(assert (=> b!177561 (or (not (= (bvand lt!272581 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!272582 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!272581 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!272581 lt!272582) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!177561 (= lt!272582 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!177561 (= lt!272581 (bitIndex!0 (size!4226 (buf!4669 thiss!1204)) (currentByte!8849 thiss!1204) (currentBit!8844 thiss!1204)))))

(declare-fun b!177562 () Bool)

(declare-fun res!147208 () Bool)

(assert (=> b!177562 (=> (not res!147208) (not e!123727))))

(assert (=> b!177562 (= res!147208 (isPrefixOf!0 thiss!1204 (_2!8296 lt!272579)))))

(declare-fun d!62453 () Bool)

(assert (=> d!62453 e!123727))

(declare-fun res!147207 () Bool)

(assert (=> d!62453 (=> (not res!147207) (not e!123727))))

(assert (=> d!62453 (= res!147207 (= (size!4226 (buf!4669 thiss!1204)) (size!4226 (buf!4669 (_2!8296 lt!272579)))))))

(declare-fun choose!16 (BitStream!7560 Bool) tuple2!15302)

(assert (=> d!62453 (= lt!272579 (choose!16 thiss!1204 lt!272518))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!62453 (validate_offset_bit!0 ((_ sign_extend 32) (size!4226 (buf!4669 thiss!1204))) ((_ sign_extend 32) (currentByte!8849 thiss!1204)) ((_ sign_extend 32) (currentBit!8844 thiss!1204)))))

(assert (=> d!62453 (= (appendBit!0 thiss!1204 lt!272518) lt!272579)))

(declare-fun b!177563 () Bool)

(assert (=> b!177563 (= e!123727 e!123728)))

(declare-fun res!147210 () Bool)

(assert (=> b!177563 (=> (not res!147210) (not e!123728))))

(assert (=> b!177563 (= res!147210 (and (= (_2!8295 lt!272580) lt!272518) (= (_1!8295 lt!272580) (_2!8296 lt!272579))))))

(assert (=> b!177563 (= lt!272580 (readBitPure!0 (readerFrom!0 (_2!8296 lt!272579) (currentBit!8844 thiss!1204) (currentByte!8849 thiss!1204))))))

(assert (= (and d!62453 res!147207) b!177561))

(assert (= (and b!177561 res!147209) b!177562))

(assert (= (and b!177562 res!147208) b!177563))

(assert (= (and b!177563 res!147210) b!177564))

(declare-fun m!277461 () Bool)

(assert (=> b!177562 m!277461))

(declare-fun m!277463 () Bool)

(assert (=> d!62453 m!277463))

(declare-fun m!277465 () Bool)

(assert (=> d!62453 m!277465))

(declare-fun m!277467 () Bool)

(assert (=> b!177563 m!277467))

(assert (=> b!177563 m!277467))

(declare-fun m!277469 () Bool)

(assert (=> b!177563 m!277469))

(declare-fun m!277471 () Bool)

(assert (=> b!177561 m!277471))

(assert (=> b!177561 m!277389))

(declare-fun m!277473 () Bool)

(assert (=> b!177564 m!277473))

(assert (=> b!177564 m!277471))

(assert (=> b!177495 d!62453))

(assert (=> b!177500 d!62449))

(assert (=> b!177500 d!62451))

(declare-fun d!62465 () Bool)

(assert (=> d!62465 (= (invariant!0 (currentBit!8844 (_2!8296 lt!272521)) (currentByte!8849 (_2!8296 lt!272521)) (size!4226 (buf!4669 (_2!8296 lt!272521)))) (and (bvsge (currentBit!8844 (_2!8296 lt!272521)) #b00000000000000000000000000000000) (bvslt (currentBit!8844 (_2!8296 lt!272521)) #b00000000000000000000000000001000) (bvsge (currentByte!8849 (_2!8296 lt!272521)) #b00000000000000000000000000000000) (or (bvslt (currentByte!8849 (_2!8296 lt!272521)) (size!4226 (buf!4669 (_2!8296 lt!272521)))) (and (= (currentBit!8844 (_2!8296 lt!272521)) #b00000000000000000000000000000000) (= (currentByte!8849 (_2!8296 lt!272521)) (size!4226 (buf!4669 (_2!8296 lt!272521))))))))))

(assert (=> b!177501 d!62465))

(declare-fun d!62467 () Bool)

(declare-fun res!147211 () Bool)

(declare-fun e!123730 () Bool)

(assert (=> d!62467 (=> (not res!147211) (not e!123730))))

(assert (=> d!62467 (= res!147211 (= (size!4226 (buf!4669 thiss!1204)) (size!4226 (buf!4669 (_2!8296 lt!272521)))))))

(assert (=> d!62467 (= (isPrefixOf!0 thiss!1204 (_2!8296 lt!272521)) e!123730)))

(declare-fun b!177565 () Bool)

(declare-fun res!147212 () Bool)

(assert (=> b!177565 (=> (not res!147212) (not e!123730))))

(assert (=> b!177565 (= res!147212 (bvsle (bitIndex!0 (size!4226 (buf!4669 thiss!1204)) (currentByte!8849 thiss!1204) (currentBit!8844 thiss!1204)) (bitIndex!0 (size!4226 (buf!4669 (_2!8296 lt!272521))) (currentByte!8849 (_2!8296 lt!272521)) (currentBit!8844 (_2!8296 lt!272521)))))))

(declare-fun b!177566 () Bool)

(declare-fun e!123729 () Bool)

(assert (=> b!177566 (= e!123730 e!123729)))

(declare-fun res!147213 () Bool)

(assert (=> b!177566 (=> res!147213 e!123729)))

(assert (=> b!177566 (= res!147213 (= (size!4226 (buf!4669 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!177567 () Bool)

(assert (=> b!177567 (= e!123729 (arrayBitRangesEq!0 (buf!4669 thiss!1204) (buf!4669 (_2!8296 lt!272521)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4226 (buf!4669 thiss!1204)) (currentByte!8849 thiss!1204) (currentBit!8844 thiss!1204))))))

(assert (= (and d!62467 res!147211) b!177565))

(assert (= (and b!177565 res!147212) b!177566))

(assert (= (and b!177566 (not res!147213)) b!177567))

(assert (=> b!177565 m!277389))

(declare-fun m!277475 () Bool)

(assert (=> b!177565 m!277475))

(assert (=> b!177567 m!277389))

(assert (=> b!177567 m!277389))

(declare-fun m!277477 () Bool)

(assert (=> b!177567 m!277477))

(assert (=> b!177501 d!62467))

(declare-fun d!62469 () Bool)

(assert (=> d!62469 (isPrefixOf!0 thiss!1204 (_2!8296 lt!272521))))

(declare-fun lt!272585 () Unit!12766)

(declare-fun choose!30 (BitStream!7560 BitStream!7560 BitStream!7560) Unit!12766)

(assert (=> d!62469 (= lt!272585 (choose!30 thiss!1204 (_2!8296 lt!272520) (_2!8296 lt!272521)))))

(assert (=> d!62469 (isPrefixOf!0 thiss!1204 (_2!8296 lt!272520))))

(assert (=> d!62469 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8296 lt!272520) (_2!8296 lt!272521)) lt!272585)))

(declare-fun bs!15578 () Bool)

(assert (= bs!15578 d!62469))

(assert (=> bs!15578 m!277397))

(declare-fun m!277479 () Bool)

(assert (=> bs!15578 m!277479))

(assert (=> bs!15578 m!277413))

(assert (=> b!177501 d!62469))

(declare-fun b!177769 () Bool)

(declare-fun res!147387 () Bool)

(declare-fun e!123845 () Bool)

(assert (=> b!177769 (=> (not res!147387) (not e!123845))))

(declare-fun lt!273151 () tuple2!15302)

(assert (=> b!177769 (= res!147387 (isPrefixOf!0 (_2!8296 lt!272520) (_2!8296 lt!273151)))))

(declare-fun lt!273152 () tuple2!15302)

(declare-fun c!9258 () Bool)

(declare-fun call!2918 () Bool)

(declare-fun bm!2915 () Bool)

(assert (=> bm!2915 (= call!2918 (isPrefixOf!0 (_2!8296 lt!272520) (ite c!9258 (_2!8296 lt!272520) (_2!8296 lt!273152))))))

(declare-fun b!177771 () Bool)

(declare-fun e!123848 () Bool)

(declare-datatypes ((tuple2!15320 0))(
  ( (tuple2!15321 (_1!8305 BitStream!7560) (_2!8305 (_ BitVec 64))) )
))
(declare-fun lt!273171 () tuple2!15320)

(declare-datatypes ((tuple2!15322 0))(
  ( (tuple2!15323 (_1!8306 BitStream!7560) (_2!8306 BitStream!7560)) )
))
(declare-fun lt!273147 () tuple2!15322)

(assert (=> b!177771 (= e!123848 (= (_1!8305 lt!273171) (_2!8306 lt!273147)))))

(declare-fun b!177772 () Bool)

(declare-fun e!123844 () tuple2!15302)

(declare-fun Unit!12774 () Unit!12766)

(assert (=> b!177772 (= e!123844 (tuple2!15303 Unit!12774 (_2!8296 lt!272520)))))

(declare-fun lt!273157 () Unit!12766)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7560) Unit!12766)

(assert (=> b!177772 (= lt!273157 (lemmaIsPrefixRefl!0 (_2!8296 lt!272520)))))

(assert (=> b!177772 call!2918))

(declare-fun lt!273153 () Unit!12766)

(assert (=> b!177772 (= lt!273153 lt!273157)))

(declare-fun b!177773 () Bool)

(declare-fun res!147385 () Bool)

(assert (=> b!177773 (=> (not res!147385) (not e!123845))))

(declare-fun lt!273132 () (_ BitVec 64))

(declare-fun lt!273131 () (_ BitVec 64))

(assert (=> b!177773 (= res!147385 (= (bitIndex!0 (size!4226 (buf!4669 (_2!8296 lt!273151))) (currentByte!8849 (_2!8296 lt!273151)) (currentBit!8844 (_2!8296 lt!273151))) (bvsub lt!273131 lt!273132)))))

(assert (=> b!177773 (or (= (bvand lt!273131 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!273132 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!273131 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!273131 lt!273132) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!177773 (= lt!273132 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!273148 () (_ BitVec 64))

(declare-fun lt!273165 () (_ BitVec 64))

(assert (=> b!177773 (= lt!273131 (bvadd lt!273148 lt!273165))))

(assert (=> b!177773 (or (not (= (bvand lt!273148 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!273165 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!273148 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!273148 lt!273165) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!177773 (= lt!273165 ((_ sign_extend 32) nBits!348))))

(assert (=> b!177773 (= lt!273148 (bitIndex!0 (size!4226 (buf!4669 (_2!8296 lt!272520))) (currentByte!8849 (_2!8296 lt!272520)) (currentBit!8844 (_2!8296 lt!272520))))))

(declare-fun b!177774 () Bool)

(declare-fun e!123852 () Bool)

(declare-fun lt!273133 () tuple2!15300)

(declare-fun lt!273162 () tuple2!15302)

(assert (=> b!177774 (= e!123852 (= (bitIndex!0 (size!4226 (buf!4669 (_1!8295 lt!273133))) (currentByte!8849 (_1!8295 lt!273133)) (currentBit!8844 (_1!8295 lt!273133))) (bitIndex!0 (size!4226 (buf!4669 (_2!8296 lt!273162))) (currentByte!8849 (_2!8296 lt!273162)) (currentBit!8844 (_2!8296 lt!273162)))))))

(declare-fun b!177775 () Bool)

(declare-fun e!123850 () Bool)

(declare-fun lt!273154 () tuple2!15320)

(declare-fun lt!273156 () tuple2!15322)

(assert (=> b!177775 (= e!123850 (= (_1!8305 lt!273154) (_2!8306 lt!273156)))))

(declare-fun b!177776 () Bool)

(declare-fun e!123849 () (_ BitVec 64))

(assert (=> b!177776 (= e!123849 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!177777 () Bool)

(declare-fun res!147388 () Bool)

(assert (=> b!177777 (=> (not res!147388) (not e!123845))))

(assert (=> b!177777 (= res!147388 (= (size!4226 (buf!4669 (_2!8296 lt!272520))) (size!4226 (buf!4669 (_2!8296 lt!273151)))))))

(declare-fun d!62475 () Bool)

(assert (=> d!62475 e!123845))

(declare-fun res!147392 () Bool)

(assert (=> d!62475 (=> (not res!147392) (not e!123845))))

(assert (=> d!62475 (= res!147392 (invariant!0 (currentBit!8844 (_2!8296 lt!273151)) (currentByte!8849 (_2!8296 lt!273151)) (size!4226 (buf!4669 (_2!8296 lt!273151)))))))

(assert (=> d!62475 (= lt!273151 e!123844)))

(assert (=> d!62475 (= c!9258 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!62475 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!62475 (= (appendBitsLSBFirstLoopTR!0 (_2!8296 lt!272520) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!273151)))

(declare-fun b!177770 () Bool)

(assert (=> b!177770 (= lt!273133 (readBitPure!0 (readerFrom!0 (_2!8296 lt!273162) (currentBit!8844 (_2!8296 lt!272520)) (currentByte!8849 (_2!8296 lt!272520)))))))

(declare-fun res!147393 () Bool)

(declare-fun lt!273129 () Bool)

(assert (=> b!177770 (= res!147393 (and (= (_2!8295 lt!273133) lt!273129) (= (_1!8295 lt!273133) (_2!8296 lt!273162))))))

(assert (=> b!177770 (=> (not res!147393) (not e!123852))))

(declare-fun e!123847 () Bool)

(assert (=> b!177770 (= e!123847 e!123852)))

(declare-fun b!177778 () Bool)

(assert (=> b!177778 (= e!123844 (tuple2!15303 (_1!8296 lt!273152) (_2!8296 lt!273152)))))

(assert (=> b!177778 (= lt!273129 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!177778 (= lt!273162 (appendBit!0 (_2!8296 lt!272520) lt!273129))))

(declare-fun res!147390 () Bool)

(assert (=> b!177778 (= res!147390 (= (size!4226 (buf!4669 (_2!8296 lt!272520))) (size!4226 (buf!4669 (_2!8296 lt!273162)))))))

(assert (=> b!177778 (=> (not res!147390) (not e!123847))))

(assert (=> b!177778 e!123847))

(declare-fun lt!273163 () tuple2!15302)

(assert (=> b!177778 (= lt!273163 lt!273162)))

(assert (=> b!177778 (= lt!273152 (appendBitsLSBFirstLoopTR!0 (_2!8296 lt!273163) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!273130 () Unit!12766)

(assert (=> b!177778 (= lt!273130 (lemmaIsPrefixTransitive!0 (_2!8296 lt!272520) (_2!8296 lt!273163) (_2!8296 lt!273152)))))

(assert (=> b!177778 call!2918))

(declare-fun lt!273127 () Unit!12766)

(assert (=> b!177778 (= lt!273127 lt!273130)))

(assert (=> b!177778 (invariant!0 (currentBit!8844 (_2!8296 lt!272520)) (currentByte!8849 (_2!8296 lt!272520)) (size!4226 (buf!4669 (_2!8296 lt!273163))))))

(declare-fun lt!273182 () BitStream!7560)

(assert (=> b!177778 (= lt!273182 (BitStream!7561 (buf!4669 (_2!8296 lt!273163)) (currentByte!8849 (_2!8296 lt!272520)) (currentBit!8844 (_2!8296 lt!272520))))))

(assert (=> b!177778 (invariant!0 (currentBit!8844 lt!273182) (currentByte!8849 lt!273182) (size!4226 (buf!4669 (_2!8296 lt!273152))))))

(declare-fun lt!273175 () BitStream!7560)

(assert (=> b!177778 (= lt!273175 (BitStream!7561 (buf!4669 (_2!8296 lt!273152)) (currentByte!8849 lt!273182) (currentBit!8844 lt!273182)))))

(declare-fun lt!273155 () tuple2!15300)

(assert (=> b!177778 (= lt!273155 (readBitPure!0 lt!273182))))

(declare-fun lt!273139 () tuple2!15300)

(assert (=> b!177778 (= lt!273139 (readBitPure!0 lt!273175))))

(declare-fun lt!273166 () Unit!12766)

(declare-fun readBitPrefixLemma!0 (BitStream!7560 BitStream!7560) Unit!12766)

(assert (=> b!177778 (= lt!273166 (readBitPrefixLemma!0 lt!273182 (_2!8296 lt!273152)))))

(declare-fun res!147382 () Bool)

(assert (=> b!177778 (= res!147382 (= (bitIndex!0 (size!4226 (buf!4669 (_1!8295 lt!273155))) (currentByte!8849 (_1!8295 lt!273155)) (currentBit!8844 (_1!8295 lt!273155))) (bitIndex!0 (size!4226 (buf!4669 (_1!8295 lt!273139))) (currentByte!8849 (_1!8295 lt!273139)) (currentBit!8844 (_1!8295 lt!273139)))))))

(declare-fun e!123851 () Bool)

(assert (=> b!177778 (=> (not res!147382) (not e!123851))))

(assert (=> b!177778 e!123851))

(declare-fun lt!273128 () Unit!12766)

(assert (=> b!177778 (= lt!273128 lt!273166)))

(declare-fun lt!273169 () tuple2!15322)

(declare-fun reader!0 (BitStream!7560 BitStream!7560) tuple2!15322)

(assert (=> b!177778 (= lt!273169 (reader!0 (_2!8296 lt!272520) (_2!8296 lt!273152)))))

(declare-fun lt!273158 () tuple2!15322)

(assert (=> b!177778 (= lt!273158 (reader!0 (_2!8296 lt!273163) (_2!8296 lt!273152)))))

(declare-fun lt!273181 () tuple2!15300)

(assert (=> b!177778 (= lt!273181 (readBitPure!0 (_1!8306 lt!273169)))))

(assert (=> b!177778 (= (_2!8295 lt!273181) lt!273129)))

(declare-fun lt!273168 () Unit!12766)

(declare-fun Unit!12789 () Unit!12766)

(assert (=> b!177778 (= lt!273168 Unit!12789)))

(declare-fun lt!273179 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!177778 (= lt!273179 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!273174 () (_ BitVec 64))

(assert (=> b!177778 (= lt!273174 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!273146 () Unit!12766)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7560 array!9583 (_ BitVec 64)) Unit!12766)

(assert (=> b!177778 (= lt!273146 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8296 lt!272520) (buf!4669 (_2!8296 lt!273152)) lt!273174))))

(assert (=> b!177778 (validate_offset_bits!1 ((_ sign_extend 32) (size!4226 (buf!4669 (_2!8296 lt!273152)))) ((_ sign_extend 32) (currentByte!8849 (_2!8296 lt!272520))) ((_ sign_extend 32) (currentBit!8844 (_2!8296 lt!272520))) lt!273174)))

(declare-fun lt!273149 () Unit!12766)

(assert (=> b!177778 (= lt!273149 lt!273146)))

(declare-fun lt!273167 () tuple2!15320)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7560 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!15320)

(assert (=> b!177778 (= lt!273167 (readNBitsLSBFirstsLoopPure!0 (_1!8306 lt!273169) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!273179))))

(declare-fun lt!273138 () (_ BitVec 64))

(assert (=> b!177778 (= lt!273138 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!273134 () Unit!12766)

(assert (=> b!177778 (= lt!273134 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8296 lt!273163) (buf!4669 (_2!8296 lt!273152)) lt!273138))))

(assert (=> b!177778 (validate_offset_bits!1 ((_ sign_extend 32) (size!4226 (buf!4669 (_2!8296 lt!273152)))) ((_ sign_extend 32) (currentByte!8849 (_2!8296 lt!273163))) ((_ sign_extend 32) (currentBit!8844 (_2!8296 lt!273163))) lt!273138)))

(declare-fun lt!273164 () Unit!12766)

(assert (=> b!177778 (= lt!273164 lt!273134)))

(declare-fun lt!273137 () tuple2!15320)

(assert (=> b!177778 (= lt!273137 (readNBitsLSBFirstsLoopPure!0 (_1!8306 lt!273158) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!273179 (ite (_2!8295 lt!273181) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!273180 () tuple2!15320)

(assert (=> b!177778 (= lt!273180 (readNBitsLSBFirstsLoopPure!0 (_1!8306 lt!273169) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!273179))))

(declare-fun c!9257 () Bool)

(assert (=> b!177778 (= c!9257 (_2!8295 (readBitPure!0 (_1!8306 lt!273169))))))

(declare-fun lt!273141 () tuple2!15320)

(declare-fun withMovedBitIndex!0 (BitStream!7560 (_ BitVec 64)) BitStream!7560)

(assert (=> b!177778 (= lt!273141 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8306 lt!273169) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!273179 e!123849)))))

(declare-fun lt!273176 () Unit!12766)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7560 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!12766)

(assert (=> b!177778 (= lt!273176 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8306 lt!273169) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!273179))))

(assert (=> b!177778 (and (= (_2!8305 lt!273180) (_2!8305 lt!273141)) (= (_1!8305 lt!273180) (_1!8305 lt!273141)))))

(declare-fun lt!273140 () Unit!12766)

(assert (=> b!177778 (= lt!273140 lt!273176)))

(assert (=> b!177778 (= (_1!8306 lt!273169) (withMovedBitIndex!0 (_2!8306 lt!273169) (bvsub (bitIndex!0 (size!4226 (buf!4669 (_2!8296 lt!272520))) (currentByte!8849 (_2!8296 lt!272520)) (currentBit!8844 (_2!8296 lt!272520))) (bitIndex!0 (size!4226 (buf!4669 (_2!8296 lt!273152))) (currentByte!8849 (_2!8296 lt!273152)) (currentBit!8844 (_2!8296 lt!273152))))))))

(declare-fun lt!273161 () Unit!12766)

(declare-fun Unit!12794 () Unit!12766)

(assert (=> b!177778 (= lt!273161 Unit!12794)))

(assert (=> b!177778 (= (_1!8306 lt!273158) (withMovedBitIndex!0 (_2!8306 lt!273158) (bvsub (bitIndex!0 (size!4226 (buf!4669 (_2!8296 lt!273163))) (currentByte!8849 (_2!8296 lt!273163)) (currentBit!8844 (_2!8296 lt!273163))) (bitIndex!0 (size!4226 (buf!4669 (_2!8296 lt!273152))) (currentByte!8849 (_2!8296 lt!273152)) (currentBit!8844 (_2!8296 lt!273152))))))))

(declare-fun lt!273143 () Unit!12766)

(declare-fun Unit!12795 () Unit!12766)

(assert (=> b!177778 (= lt!273143 Unit!12795)))

(assert (=> b!177778 (= (bitIndex!0 (size!4226 (buf!4669 (_2!8296 lt!272520))) (currentByte!8849 (_2!8296 lt!272520)) (currentBit!8844 (_2!8296 lt!272520))) (bvsub (bitIndex!0 (size!4226 (buf!4669 (_2!8296 lt!273163))) (currentByte!8849 (_2!8296 lt!273163)) (currentBit!8844 (_2!8296 lt!273163))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!273142 () Unit!12766)

(declare-fun Unit!12796 () Unit!12766)

(assert (=> b!177778 (= lt!273142 Unit!12796)))

(assert (=> b!177778 (= (_2!8305 lt!273167) (_2!8305 lt!273137))))

(declare-fun lt!273136 () Unit!12766)

(declare-fun Unit!12797 () Unit!12766)

(assert (=> b!177778 (= lt!273136 Unit!12797)))

(assert (=> b!177778 (invariant!0 (currentBit!8844 (_2!8296 lt!273152)) (currentByte!8849 (_2!8296 lt!273152)) (size!4226 (buf!4669 (_2!8296 lt!273152))))))

(declare-fun lt!273159 () Unit!12766)

(declare-fun Unit!12798 () Unit!12766)

(assert (=> b!177778 (= lt!273159 Unit!12798)))

(assert (=> b!177778 (= (size!4226 (buf!4669 (_2!8296 lt!272520))) (size!4226 (buf!4669 (_2!8296 lt!273152))))))

(declare-fun lt!273144 () Unit!12766)

(declare-fun Unit!12799 () Unit!12766)

(assert (=> b!177778 (= lt!273144 Unit!12799)))

(assert (=> b!177778 (= (bitIndex!0 (size!4226 (buf!4669 (_2!8296 lt!273152))) (currentByte!8849 (_2!8296 lt!273152)) (currentBit!8844 (_2!8296 lt!273152))) (bvsub (bvadd (bitIndex!0 (size!4226 (buf!4669 (_2!8296 lt!272520))) (currentByte!8849 (_2!8296 lt!272520)) (currentBit!8844 (_2!8296 lt!272520))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!273145 () Unit!12766)

(declare-fun Unit!12800 () Unit!12766)

(assert (=> b!177778 (= lt!273145 Unit!12800)))

(declare-fun lt!273160 () Unit!12766)

(declare-fun Unit!12801 () Unit!12766)

(assert (=> b!177778 (= lt!273160 Unit!12801)))

(assert (=> b!177778 (= lt!273147 (reader!0 (_2!8296 lt!272520) (_2!8296 lt!273152)))))

(declare-fun lt!273172 () (_ BitVec 64))

(assert (=> b!177778 (= lt!273172 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!273135 () Unit!12766)

(assert (=> b!177778 (= lt!273135 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8296 lt!272520) (buf!4669 (_2!8296 lt!273152)) lt!273172))))

(assert (=> b!177778 (validate_offset_bits!1 ((_ sign_extend 32) (size!4226 (buf!4669 (_2!8296 lt!273152)))) ((_ sign_extend 32) (currentByte!8849 (_2!8296 lt!272520))) ((_ sign_extend 32) (currentBit!8844 (_2!8296 lt!272520))) lt!273172)))

(declare-fun lt!273170 () Unit!12766)

(assert (=> b!177778 (= lt!273170 lt!273135)))

(assert (=> b!177778 (= lt!273171 (readNBitsLSBFirstsLoopPure!0 (_1!8306 lt!273147) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!147384 () Bool)

(assert (=> b!177778 (= res!147384 (= (_2!8305 lt!273171) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!177778 (=> (not res!147384) (not e!123848))))

(assert (=> b!177778 e!123848))

(declare-fun lt!273173 () Unit!12766)

(declare-fun Unit!12802 () Unit!12766)

(assert (=> b!177778 (= lt!273173 Unit!12802)))

(declare-fun b!177779 () Bool)

(assert (=> b!177779 (= e!123849 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!177780 () Bool)

(declare-fun res!147386 () Bool)

(assert (=> b!177780 (= res!147386 (isPrefixOf!0 (_2!8296 lt!272520) (_2!8296 lt!273162)))))

(assert (=> b!177780 (=> (not res!147386) (not e!123847))))

(declare-fun b!177781 () Bool)

(declare-fun e!123846 () Bool)

(declare-fun lt!273150 () (_ BitVec 64))

(assert (=> b!177781 (= e!123846 (validate_offset_bits!1 ((_ sign_extend 32) (size!4226 (buf!4669 (_2!8296 lt!272520)))) ((_ sign_extend 32) (currentByte!8849 (_2!8296 lt!272520))) ((_ sign_extend 32) (currentBit!8844 (_2!8296 lt!272520))) lt!273150))))

(declare-fun b!177782 () Bool)

(assert (=> b!177782 (= e!123845 e!123850)))

(declare-fun res!147391 () Bool)

(assert (=> b!177782 (=> (not res!147391) (not e!123850))))

(assert (=> b!177782 (= res!147391 (= (_2!8305 lt!273154) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!177782 (= lt!273154 (readNBitsLSBFirstsLoopPure!0 (_1!8306 lt!273156) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!273177 () Unit!12766)

(declare-fun lt!273178 () Unit!12766)

(assert (=> b!177782 (= lt!273177 lt!273178)))

(assert (=> b!177782 (validate_offset_bits!1 ((_ sign_extend 32) (size!4226 (buf!4669 (_2!8296 lt!273151)))) ((_ sign_extend 32) (currentByte!8849 (_2!8296 lt!272520))) ((_ sign_extend 32) (currentBit!8844 (_2!8296 lt!272520))) lt!273150)))

(assert (=> b!177782 (= lt!273178 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8296 lt!272520) (buf!4669 (_2!8296 lt!273151)) lt!273150))))

(assert (=> b!177782 e!123846))

(declare-fun res!147389 () Bool)

(assert (=> b!177782 (=> (not res!147389) (not e!123846))))

(assert (=> b!177782 (= res!147389 (and (= (size!4226 (buf!4669 (_2!8296 lt!272520))) (size!4226 (buf!4669 (_2!8296 lt!273151)))) (bvsge lt!273150 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!177782 (= lt!273150 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!177782 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!177782 (= lt!273156 (reader!0 (_2!8296 lt!272520) (_2!8296 lt!273151)))))

(declare-fun b!177783 () Bool)

(declare-fun res!147383 () Bool)

(assert (=> b!177783 (= res!147383 (= (bitIndex!0 (size!4226 (buf!4669 (_2!8296 lt!273162))) (currentByte!8849 (_2!8296 lt!273162)) (currentBit!8844 (_2!8296 lt!273162))) (bvadd (bitIndex!0 (size!4226 (buf!4669 (_2!8296 lt!272520))) (currentByte!8849 (_2!8296 lt!272520)) (currentBit!8844 (_2!8296 lt!272520))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!177783 (=> (not res!147383) (not e!123847))))

(declare-fun b!177784 () Bool)

(assert (=> b!177784 (= e!123851 (= (_2!8295 lt!273155) (_2!8295 lt!273139)))))

(assert (= (and d!62475 c!9258) b!177772))

(assert (= (and d!62475 (not c!9258)) b!177778))

(assert (= (and b!177778 res!147390) b!177783))

(assert (= (and b!177783 res!147383) b!177780))

(assert (= (and b!177780 res!147386) b!177770))

(assert (= (and b!177770 res!147393) b!177774))

(assert (= (and b!177778 res!147382) b!177784))

(assert (= (and b!177778 c!9257) b!177776))

(assert (= (and b!177778 (not c!9257)) b!177779))

(assert (= (and b!177778 res!147384) b!177771))

(assert (= (or b!177772 b!177778) bm!2915))

(assert (= (and d!62475 res!147392) b!177777))

(assert (= (and b!177777 res!147388) b!177773))

(assert (= (and b!177773 res!147385) b!177769))

(assert (= (and b!177769 res!147387) b!177782))

(assert (= (and b!177782 res!147389) b!177781))

(assert (= (and b!177782 res!147391) b!177775))

(declare-fun m!277735 () Bool)

(assert (=> b!177781 m!277735))

(declare-fun m!277737 () Bool)

(assert (=> b!177770 m!277737))

(assert (=> b!177770 m!277737))

(declare-fun m!277739 () Bool)

(assert (=> b!177770 m!277739))

(declare-fun m!277741 () Bool)

(assert (=> b!177782 m!277741))

(declare-fun m!277743 () Bool)

(assert (=> b!177782 m!277743))

(declare-fun m!277745 () Bool)

(assert (=> b!177782 m!277745))

(declare-fun m!277747 () Bool)

(assert (=> b!177782 m!277747))

(declare-fun m!277749 () Bool)

(assert (=> b!177782 m!277749))

(declare-fun m!277751 () Bool)

(assert (=> b!177782 m!277751))

(declare-fun m!277753 () Bool)

(assert (=> d!62475 m!277753))

(declare-fun m!277755 () Bool)

(assert (=> b!177774 m!277755))

(declare-fun m!277757 () Bool)

(assert (=> b!177774 m!277757))

(assert (=> b!177783 m!277757))

(assert (=> b!177783 m!277387))

(declare-fun m!277759 () Bool)

(assert (=> b!177778 m!277759))

(declare-fun m!277761 () Bool)

(assert (=> b!177778 m!277761))

(declare-fun m!277763 () Bool)

(assert (=> b!177778 m!277763))

(declare-fun m!277765 () Bool)

(assert (=> b!177778 m!277765))

(declare-fun m!277767 () Bool)

(assert (=> b!177778 m!277767))

(declare-fun m!277769 () Bool)

(assert (=> b!177778 m!277769))

(declare-fun m!277771 () Bool)

(assert (=> b!177778 m!277771))

(declare-fun m!277773 () Bool)

(assert (=> b!177778 m!277773))

(declare-fun m!277775 () Bool)

(assert (=> b!177778 m!277775))

(declare-fun m!277777 () Bool)

(assert (=> b!177778 m!277777))

(declare-fun m!277779 () Bool)

(assert (=> b!177778 m!277779))

(declare-fun m!277781 () Bool)

(assert (=> b!177778 m!277781))

(declare-fun m!277783 () Bool)

(assert (=> b!177778 m!277783))

(declare-fun m!277785 () Bool)

(assert (=> b!177778 m!277785))

(declare-fun m!277787 () Bool)

(assert (=> b!177778 m!277787))

(declare-fun m!277789 () Bool)

(assert (=> b!177778 m!277789))

(assert (=> b!177778 m!277741))

(declare-fun m!277791 () Bool)

(assert (=> b!177778 m!277791))

(declare-fun m!277793 () Bool)

(assert (=> b!177778 m!277793))

(declare-fun m!277795 () Bool)

(assert (=> b!177778 m!277795))

(declare-fun m!277797 () Bool)

(assert (=> b!177778 m!277797))

(declare-fun m!277799 () Bool)

(assert (=> b!177778 m!277799))

(declare-fun m!277801 () Bool)

(assert (=> b!177778 m!277801))

(assert (=> b!177778 m!277767))

(declare-fun m!277803 () Bool)

(assert (=> b!177778 m!277803))

(assert (=> b!177778 m!277387))

(declare-fun m!277805 () Bool)

(assert (=> b!177778 m!277805))

(declare-fun m!277807 () Bool)

(assert (=> b!177778 m!277807))

(declare-fun m!277809 () Bool)

(assert (=> b!177778 m!277809))

(declare-fun m!277811 () Bool)

(assert (=> b!177778 m!277811))

(declare-fun m!277813 () Bool)

(assert (=> b!177778 m!277813))

(declare-fun m!277815 () Bool)

(assert (=> b!177778 m!277815))

(assert (=> b!177778 m!277751))

(declare-fun m!277817 () Bool)

(assert (=> b!177778 m!277817))

(declare-fun m!277819 () Bool)

(assert (=> b!177773 m!277819))

(assert (=> b!177773 m!277387))

(declare-fun m!277821 () Bool)

(assert (=> b!177769 m!277821))

(declare-fun m!277823 () Bool)

(assert (=> bm!2915 m!277823))

(declare-fun m!277825 () Bool)

(assert (=> b!177772 m!277825))

(declare-fun m!277827 () Bool)

(assert (=> b!177780 m!277827))

(assert (=> b!177501 d!62475))

(declare-fun d!62523 () Bool)

(declare-datatypes ((tuple2!15324 0))(
  ( (tuple2!15325 (_1!8307 Bool) (_2!8307 BitStream!7560)) )
))
(declare-fun lt!273185 () tuple2!15324)

(declare-fun readBit!0 (BitStream!7560) tuple2!15324)

(assert (=> d!62523 (= lt!273185 (readBit!0 (readerFrom!0 (_2!8296 lt!272520) (currentBit!8844 thiss!1204) (currentByte!8849 thiss!1204))))))

(assert (=> d!62523 (= (readBitPure!0 (readerFrom!0 (_2!8296 lt!272520) (currentBit!8844 thiss!1204) (currentByte!8849 thiss!1204))) (tuple2!15301 (_2!8307 lt!273185) (_1!8307 lt!273185)))))

(declare-fun bs!15586 () Bool)

(assert (= bs!15586 d!62523))

(assert (=> bs!15586 m!277391))

(declare-fun m!277829 () Bool)

(assert (=> bs!15586 m!277829))

(assert (=> b!177496 d!62523))

(declare-fun d!62525 () Bool)

(declare-fun e!123855 () Bool)

(assert (=> d!62525 e!123855))

(declare-fun res!147397 () Bool)

(assert (=> d!62525 (=> (not res!147397) (not e!123855))))

(assert (=> d!62525 (= res!147397 (invariant!0 (currentBit!8844 (_2!8296 lt!272520)) (currentByte!8849 (_2!8296 lt!272520)) (size!4226 (buf!4669 (_2!8296 lt!272520)))))))

(assert (=> d!62525 (= (readerFrom!0 (_2!8296 lt!272520) (currentBit!8844 thiss!1204) (currentByte!8849 thiss!1204)) (BitStream!7561 (buf!4669 (_2!8296 lt!272520)) (currentByte!8849 thiss!1204) (currentBit!8844 thiss!1204)))))

(declare-fun b!177787 () Bool)

(assert (=> b!177787 (= e!123855 (invariant!0 (currentBit!8844 thiss!1204) (currentByte!8849 thiss!1204) (size!4226 (buf!4669 (_2!8296 lt!272520)))))))

(assert (= (and d!62525 res!147397) b!177787))

(assert (=> d!62525 m!277451))

(declare-fun m!277831 () Bool)

(assert (=> b!177787 m!277831))

(assert (=> b!177496 d!62525))

(declare-fun d!62527 () Bool)

(assert (=> d!62527 (= (inv!12 thiss!1204) (invariant!0 (currentBit!8844 thiss!1204) (currentByte!8849 thiss!1204) (size!4226 (buf!4669 thiss!1204))))))

(declare-fun bs!15587 () Bool)

(assert (= bs!15587 d!62527))

(assert (=> bs!15587 m!277407))

(assert (=> start!39442 d!62527))

(declare-fun d!62529 () Bool)

(assert (=> d!62529 (= (array_inv!3967 (buf!4669 thiss!1204)) (bvsge (size!4226 (buf!4669 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!177498 d!62529))

(declare-fun d!62531 () Bool)

(assert (=> d!62531 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4226 (buf!4669 thiss!1204))) ((_ sign_extend 32) (currentByte!8849 thiss!1204)) ((_ sign_extend 32) (currentBit!8844 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4226 (buf!4669 thiss!1204))) ((_ sign_extend 32) (currentByte!8849 thiss!1204)) ((_ sign_extend 32) (currentBit!8844 thiss!1204))) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun bs!15588 () Bool)

(assert (= bs!15588 d!62531))

(assert (=> bs!15588 m!277453))

(assert (=> b!177497 d!62531))

(declare-fun d!62533 () Bool)

(declare-fun e!123856 () Bool)

(assert (=> d!62533 e!123856))

(declare-fun res!147399 () Bool)

(assert (=> d!62533 (=> (not res!147399) (not e!123856))))

(declare-fun lt!273190 () (_ BitVec 64))

(declare-fun lt!273187 () (_ BitVec 64))

(declare-fun lt!273189 () (_ BitVec 64))

(assert (=> d!62533 (= res!147399 (= lt!273190 (bvsub lt!273189 lt!273187)))))

(assert (=> d!62533 (or (= (bvand lt!273189 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!273187 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!273189 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!273189 lt!273187) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62533 (= lt!273187 (remainingBits!0 ((_ sign_extend 32) (size!4226 (buf!4669 (_1!8295 lt!272516)))) ((_ sign_extend 32) (currentByte!8849 (_1!8295 lt!272516))) ((_ sign_extend 32) (currentBit!8844 (_1!8295 lt!272516)))))))

(declare-fun lt!273191 () (_ BitVec 64))

(declare-fun lt!273188 () (_ BitVec 64))

(assert (=> d!62533 (= lt!273189 (bvmul lt!273191 lt!273188))))

(assert (=> d!62533 (or (= lt!273191 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!273188 (bvsdiv (bvmul lt!273191 lt!273188) lt!273191)))))

(assert (=> d!62533 (= lt!273188 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62533 (= lt!273191 ((_ sign_extend 32) (size!4226 (buf!4669 (_1!8295 lt!272516)))))))

(assert (=> d!62533 (= lt!273190 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8849 (_1!8295 lt!272516))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8844 (_1!8295 lt!272516)))))))

(assert (=> d!62533 (invariant!0 (currentBit!8844 (_1!8295 lt!272516)) (currentByte!8849 (_1!8295 lt!272516)) (size!4226 (buf!4669 (_1!8295 lt!272516))))))

(assert (=> d!62533 (= (bitIndex!0 (size!4226 (buf!4669 (_1!8295 lt!272516))) (currentByte!8849 (_1!8295 lt!272516)) (currentBit!8844 (_1!8295 lt!272516))) lt!273190)))

(declare-fun b!177788 () Bool)

(declare-fun res!147398 () Bool)

(assert (=> b!177788 (=> (not res!147398) (not e!123856))))

(assert (=> b!177788 (= res!147398 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!273190))))

(declare-fun b!177789 () Bool)

(declare-fun lt!273186 () (_ BitVec 64))

(assert (=> b!177789 (= e!123856 (bvsle lt!273190 (bvmul lt!273186 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!177789 (or (= lt!273186 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!273186 #b0000000000000000000000000000000000000000000000000000000000001000) lt!273186)))))

(assert (=> b!177789 (= lt!273186 ((_ sign_extend 32) (size!4226 (buf!4669 (_1!8295 lt!272516)))))))

(assert (= (and d!62533 res!147399) b!177788))

(assert (= (and b!177788 res!147398) b!177789))

(declare-fun m!277833 () Bool)

(assert (=> d!62533 m!277833))

(declare-fun m!277835 () Bool)

(assert (=> d!62533 m!277835))

(assert (=> b!177492 d!62533))

(check-sat (not b!177781) (not d!62533) (not b!177782) (not b!177563) (not b!177769) (not b!177787) (not b!177773) (not b!177778) (not b!177770) (not d!62523) (not d!62475) (not b!177567) (not b!177538) (not b!177540) (not b!177565) (not b!177783) (not d!62449) (not b!177772) (not d!62451) (not b!177561) (not b!177780) (not b!177562) (not bm!2915) (not d!62453) (not d!62525) (not b!177564) (not b!177774) (not d!62469) (not d!62527) (not d!62531))
