; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40214 () Bool)

(assert start!40214)

(declare-fun b!184399 () Bool)

(declare-fun res!153410 () Bool)

(declare-fun e!127742 () Bool)

(assert (=> b!184399 (=> res!153410 e!127742)))

(declare-datatypes ((array!9782 0))(
  ( (array!9783 (arr!5245 (Array (_ BitVec 32) (_ BitVec 8))) (size!4315 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7738 0))(
  ( (BitStream!7739 (buf!4770 array!9782) (currentByte!9004 (_ BitVec 32)) (currentBit!8999 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!13205 0))(
  ( (Unit!13206) )
))
(declare-datatypes ((tuple2!15956 0))(
  ( (tuple2!15957 (_1!8623 Unit!13205) (_2!8623 BitStream!7738)) )
))
(declare-fun lt!283574 () tuple2!15956)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!184399 (= res!153410 (not (invariant!0 (currentBit!8999 (_2!8623 lt!283574)) (currentByte!9004 (_2!8623 lt!283574)) (size!4315 (buf!4770 (_2!8623 lt!283574))))))))

(declare-fun b!184400 () Bool)

(declare-fun res!153415 () Bool)

(assert (=> b!184400 (=> res!153415 e!127742)))

(declare-fun thiss!1204 () BitStream!7738)

(declare-fun lt!283592 () tuple2!15956)

(declare-fun isPrefixOf!0 (BitStream!7738 BitStream!7738) Bool)

(assert (=> b!184400 (= res!153415 (not (isPrefixOf!0 thiss!1204 (_2!8623 lt!283592))))))

(declare-fun b!184401 () Bool)

(declare-fun e!127740 () Bool)

(declare-fun e!127746 () Bool)

(assert (=> b!184401 (= e!127740 e!127746)))

(declare-fun res!153425 () Bool)

(assert (=> b!184401 (=> (not res!153425) (not e!127746))))

(declare-fun lt!283567 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!184401 (= res!153425 (validate_offset_bits!1 ((_ sign_extend 32) (size!4315 (buf!4770 thiss!1204))) ((_ sign_extend 32) (currentByte!9004 thiss!1204)) ((_ sign_extend 32) (currentBit!8999 thiss!1204)) lt!283567))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!184401 (= lt!283567 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!184402 () Bool)

(declare-fun e!127745 () Bool)

(assert (=> b!184402 (= e!127745 (invariant!0 (currentBit!8999 thiss!1204) (currentByte!9004 thiss!1204) (size!4315 (buf!4770 (_2!8623 lt!283574)))))))

(declare-fun b!184403 () Bool)

(declare-fun res!153417 () Bool)

(assert (=> b!184403 (=> res!153417 e!127742)))

(declare-fun lt!283584 () (_ BitVec 64))

(declare-fun lt!283583 () (_ BitVec 64))

(assert (=> b!184403 (= res!153417 (or (not (= (size!4315 (buf!4770 (_2!8623 lt!283574))) (size!4315 (buf!4770 thiss!1204)))) (not (= lt!283584 (bvsub (bvadd lt!283583 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!184404 () Bool)

(declare-fun e!127743 () Bool)

(assert (=> b!184404 (= e!127743 e!127742)))

(declare-fun res!153414 () Bool)

(assert (=> b!184404 (=> res!153414 e!127742)))

(declare-fun lt!283573 () (_ BitVec 64))

(assert (=> b!184404 (= res!153414 (not (= lt!283584 (bvsub (bvsub (bvadd lt!283573 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!184404 (= lt!283584 (bitIndex!0 (size!4315 (buf!4770 (_2!8623 lt!283574))) (currentByte!9004 (_2!8623 lt!283574)) (currentBit!8999 (_2!8623 lt!283574))))))

(assert (=> b!184404 (isPrefixOf!0 thiss!1204 (_2!8623 lt!283574))))

(declare-fun lt!283575 () Unit!13205)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7738 BitStream!7738 BitStream!7738) Unit!13205)

(assert (=> b!184404 (= lt!283575 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8623 lt!283592) (_2!8623 lt!283574)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7738 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15956)

(assert (=> b!184404 (= lt!283574 (appendBitsLSBFirstLoopTR!0 (_2!8623 lt!283592) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!184405 () Bool)

(declare-fun e!127744 () Bool)

(declare-fun e!127750 () Bool)

(assert (=> b!184405 (= e!127744 e!127750)))

(declare-fun res!153426 () Bool)

(assert (=> b!184405 (=> (not res!153426) (not e!127750))))

(declare-fun lt!283585 () Bool)

(declare-datatypes ((tuple2!15958 0))(
  ( (tuple2!15959 (_1!8624 BitStream!7738) (_2!8624 Bool)) )
))
(declare-fun lt!283571 () tuple2!15958)

(assert (=> b!184405 (= res!153426 (and (= (_2!8624 lt!283571) lt!283585) (= (_1!8624 lt!283571) (_2!8623 lt!283592))))))

(declare-fun readBitPure!0 (BitStream!7738) tuple2!15958)

(declare-fun readerFrom!0 (BitStream!7738 (_ BitVec 32) (_ BitVec 32)) BitStream!7738)

(assert (=> b!184405 (= lt!283571 (readBitPure!0 (readerFrom!0 (_2!8623 lt!283592) (currentBit!8999 thiss!1204) (currentByte!9004 thiss!1204))))))

(declare-fun b!184406 () Bool)

(declare-fun e!127749 () Bool)

(assert (=> b!184406 (= e!127742 e!127749)))

(declare-fun res!153419 () Bool)

(assert (=> b!184406 (=> res!153419 e!127749)))

(declare-fun lt!283577 () (_ BitVec 64))

(declare-datatypes ((tuple2!15960 0))(
  ( (tuple2!15961 (_1!8625 BitStream!7738) (_2!8625 BitStream!7738)) )
))
(declare-fun lt!283591 () tuple2!15960)

(declare-datatypes ((tuple2!15962 0))(
  ( (tuple2!15963 (_1!8626 BitStream!7738) (_2!8626 (_ BitVec 64))) )
))
(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7738 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!15962)

(assert (=> b!184406 (= res!153419 (not (= (_1!8626 (readNBitsLSBFirstsLoopPure!0 (_1!8625 lt!283591) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!283577)) (_2!8625 lt!283591))))))

(declare-fun lt!283578 () (_ BitVec 64))

(assert (=> b!184406 (validate_offset_bits!1 ((_ sign_extend 32) (size!4315 (buf!4770 (_2!8623 lt!283574)))) ((_ sign_extend 32) (currentByte!9004 (_2!8623 lt!283592))) ((_ sign_extend 32) (currentBit!8999 (_2!8623 lt!283592))) lt!283578)))

(declare-fun lt!283581 () Unit!13205)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7738 array!9782 (_ BitVec 64)) Unit!13205)

(assert (=> b!184406 (= lt!283581 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8623 lt!283592) (buf!4770 (_2!8623 lt!283574)) lt!283578))))

(assert (=> b!184406 (= lt!283578 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!283580 () (_ BitVec 64))

(declare-fun lt!283576 () tuple2!15958)

(declare-fun lt!283572 () (_ BitVec 64))

(assert (=> b!184406 (= lt!283577 (bvor lt!283572 (ite (_2!8624 lt!283576) lt!283580 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!283569 () tuple2!15962)

(declare-fun lt!283587 () tuple2!15960)

(assert (=> b!184406 (= lt!283569 (readNBitsLSBFirstsLoopPure!0 (_1!8625 lt!283587) nBits!348 i!590 lt!283572))))

(assert (=> b!184406 (validate_offset_bits!1 ((_ sign_extend 32) (size!4315 (buf!4770 (_2!8623 lt!283574)))) ((_ sign_extend 32) (currentByte!9004 thiss!1204)) ((_ sign_extend 32) (currentBit!8999 thiss!1204)) lt!283567)))

(declare-fun lt!283590 () Unit!13205)

(assert (=> b!184406 (= lt!283590 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4770 (_2!8623 lt!283574)) lt!283567))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!184406 (= lt!283572 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!184406 (= (_2!8624 lt!283576) lt!283585)))

(assert (=> b!184406 (= lt!283576 (readBitPure!0 (_1!8625 lt!283587)))))

(declare-fun reader!0 (BitStream!7738 BitStream!7738) tuple2!15960)

(assert (=> b!184406 (= lt!283591 (reader!0 (_2!8623 lt!283592) (_2!8623 lt!283574)))))

(assert (=> b!184406 (= lt!283587 (reader!0 thiss!1204 (_2!8623 lt!283574)))))

(declare-fun e!127741 () Bool)

(assert (=> b!184406 e!127741))

(declare-fun res!153412 () Bool)

(assert (=> b!184406 (=> (not res!153412) (not e!127741))))

(declare-fun lt!283589 () tuple2!15958)

(declare-fun lt!283579 () tuple2!15958)

(assert (=> b!184406 (= res!153412 (= (bitIndex!0 (size!4315 (buf!4770 (_1!8624 lt!283589))) (currentByte!9004 (_1!8624 lt!283589)) (currentBit!8999 (_1!8624 lt!283589))) (bitIndex!0 (size!4315 (buf!4770 (_1!8624 lt!283579))) (currentByte!9004 (_1!8624 lt!283579)) (currentBit!8999 (_1!8624 lt!283579)))))))

(declare-fun lt!283582 () Unit!13205)

(declare-fun lt!283568 () BitStream!7738)

(declare-fun readBitPrefixLemma!0 (BitStream!7738 BitStream!7738) Unit!13205)

(assert (=> b!184406 (= lt!283582 (readBitPrefixLemma!0 lt!283568 (_2!8623 lt!283574)))))

(assert (=> b!184406 (= lt!283579 (readBitPure!0 (BitStream!7739 (buf!4770 (_2!8623 lt!283574)) (currentByte!9004 thiss!1204) (currentBit!8999 thiss!1204))))))

(assert (=> b!184406 (= lt!283589 (readBitPure!0 lt!283568))))

(assert (=> b!184406 e!127745))

(declare-fun res!153424 () Bool)

(assert (=> b!184406 (=> (not res!153424) (not e!127745))))

(assert (=> b!184406 (= res!153424 (invariant!0 (currentBit!8999 thiss!1204) (currentByte!9004 thiss!1204) (size!4315 (buf!4770 (_2!8623 lt!283592)))))))

(assert (=> b!184406 (= lt!283568 (BitStream!7739 (buf!4770 (_2!8623 lt!283592)) (currentByte!9004 thiss!1204) (currentBit!8999 thiss!1204)))))

(declare-fun b!184407 () Bool)

(assert (=> b!184407 (= e!127746 (not e!127743))))

(declare-fun res!153418 () Bool)

(assert (=> b!184407 (=> res!153418 e!127743)))

(assert (=> b!184407 (= res!153418 (not (= lt!283573 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!283583))))))

(assert (=> b!184407 (= lt!283573 (bitIndex!0 (size!4315 (buf!4770 (_2!8623 lt!283592))) (currentByte!9004 (_2!8623 lt!283592)) (currentBit!8999 (_2!8623 lt!283592))))))

(assert (=> b!184407 (= lt!283583 (bitIndex!0 (size!4315 (buf!4770 thiss!1204)) (currentByte!9004 thiss!1204) (currentBit!8999 thiss!1204)))))

(declare-fun e!127747 () Bool)

(assert (=> b!184407 e!127747))

(declare-fun res!153421 () Bool)

(assert (=> b!184407 (=> (not res!153421) (not e!127747))))

(assert (=> b!184407 (= res!153421 (= (size!4315 (buf!4770 thiss!1204)) (size!4315 (buf!4770 (_2!8623 lt!283592)))))))

(declare-fun appendBit!0 (BitStream!7738 Bool) tuple2!15956)

(assert (=> b!184407 (= lt!283592 (appendBit!0 thiss!1204 lt!283585))))

(assert (=> b!184407 (= lt!283585 (not (= (bvand v!189 lt!283580) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!184407 (= lt!283580 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!184408 () Bool)

(assert (=> b!184408 (= e!127747 e!127744)))

(declare-fun res!153416 () Bool)

(assert (=> b!184408 (=> (not res!153416) (not e!127744))))

(declare-fun lt!283588 () (_ BitVec 64))

(declare-fun lt!283570 () (_ BitVec 64))

(assert (=> b!184408 (= res!153416 (= lt!283588 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!283570)))))

(assert (=> b!184408 (= lt!283588 (bitIndex!0 (size!4315 (buf!4770 (_2!8623 lt!283592))) (currentByte!9004 (_2!8623 lt!283592)) (currentBit!8999 (_2!8623 lt!283592))))))

(assert (=> b!184408 (= lt!283570 (bitIndex!0 (size!4315 (buf!4770 thiss!1204)) (currentByte!9004 thiss!1204) (currentBit!8999 thiss!1204)))))

(declare-fun res!153420 () Bool)

(assert (=> start!40214 (=> (not res!153420) (not e!127740))))

(assert (=> start!40214 (= res!153420 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!40214 e!127740))

(assert (=> start!40214 true))

(declare-fun e!127748 () Bool)

(declare-fun inv!12 (BitStream!7738) Bool)

(assert (=> start!40214 (and (inv!12 thiss!1204) e!127748)))

(declare-fun b!184409 () Bool)

(declare-fun array_inv!4056 (array!9782) Bool)

(assert (=> b!184409 (= e!127748 (array_inv!4056 (buf!4770 thiss!1204)))))

(declare-fun b!184410 () Bool)

(assert (=> b!184410 (= e!127750 (= (bitIndex!0 (size!4315 (buf!4770 (_1!8624 lt!283571))) (currentByte!9004 (_1!8624 lt!283571)) (currentBit!8999 (_1!8624 lt!283571))) lt!283588))))

(declare-fun b!184411 () Bool)

(declare-fun res!153423 () Bool)

(assert (=> b!184411 (=> (not res!153423) (not e!127744))))

(assert (=> b!184411 (= res!153423 (isPrefixOf!0 thiss!1204 (_2!8623 lt!283592)))))

(declare-fun b!184412 () Bool)

(declare-fun res!153422 () Bool)

(assert (=> b!184412 (=> res!153422 e!127742)))

(assert (=> b!184412 (= res!153422 (not (isPrefixOf!0 (_2!8623 lt!283592) (_2!8623 lt!283574))))))

(declare-fun b!184413 () Bool)

(assert (=> b!184413 (= e!127741 (= (_2!8624 lt!283589) (_2!8624 lt!283579)))))

(declare-fun b!184414 () Bool)

(declare-fun res!153413 () Bool)

(assert (=> b!184414 (=> (not res!153413) (not e!127746))))

(assert (=> b!184414 (= res!153413 (invariant!0 (currentBit!8999 thiss!1204) (currentByte!9004 thiss!1204) (size!4315 (buf!4770 thiss!1204))))))

(declare-fun b!184415 () Bool)

(assert (=> b!184415 (= e!127749 true)))

(declare-fun lt!283566 () tuple2!15962)

(assert (=> b!184415 (and (= (_2!8626 lt!283569) (_2!8626 lt!283566)) (= (_1!8626 lt!283569) (_1!8626 lt!283566)))))

(declare-fun lt!283586 () Unit!13205)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7738 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13205)

(assert (=> b!184415 (= lt!283586 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8625 lt!283587) nBits!348 i!590 lt!283572))))

(declare-fun withMovedBitIndex!0 (BitStream!7738 (_ BitVec 64)) BitStream!7738)

(assert (=> b!184415 (= lt!283566 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8625 lt!283587) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!283577))))

(declare-fun b!184416 () Bool)

(declare-fun res!153411 () Bool)

(assert (=> b!184416 (=> (not res!153411) (not e!127746))))

(assert (=> b!184416 (= res!153411 (not (= i!590 nBits!348)))))

(assert (= (and start!40214 res!153420) b!184401))

(assert (= (and b!184401 res!153425) b!184414))

(assert (= (and b!184414 res!153413) b!184416))

(assert (= (and b!184416 res!153411) b!184407))

(assert (= (and b!184407 res!153421) b!184408))

(assert (= (and b!184408 res!153416) b!184411))

(assert (= (and b!184411 res!153423) b!184405))

(assert (= (and b!184405 res!153426) b!184410))

(assert (= (and b!184407 (not res!153418)) b!184404))

(assert (= (and b!184404 (not res!153414)) b!184399))

(assert (= (and b!184399 (not res!153410)) b!184403))

(assert (= (and b!184403 (not res!153417)) b!184412))

(assert (= (and b!184412 (not res!153422)) b!184400))

(assert (= (and b!184400 (not res!153415)) b!184406))

(assert (= (and b!184406 res!153424) b!184402))

(assert (= (and b!184406 res!153412) b!184413))

(assert (= (and b!184406 (not res!153419)) b!184415))

(assert (= start!40214 b!184409))

(declare-fun m!286507 () Bool)

(assert (=> b!184414 m!286507))

(declare-fun m!286509 () Bool)

(assert (=> b!184407 m!286509))

(declare-fun m!286511 () Bool)

(assert (=> b!184407 m!286511))

(declare-fun m!286513 () Bool)

(assert (=> b!184407 m!286513))

(declare-fun m!286515 () Bool)

(assert (=> start!40214 m!286515))

(declare-fun m!286517 () Bool)

(assert (=> b!184404 m!286517))

(declare-fun m!286519 () Bool)

(assert (=> b!184404 m!286519))

(declare-fun m!286521 () Bool)

(assert (=> b!184404 m!286521))

(declare-fun m!286523 () Bool)

(assert (=> b!184404 m!286523))

(declare-fun m!286525 () Bool)

(assert (=> b!184412 m!286525))

(declare-fun m!286527 () Bool)

(assert (=> b!184409 m!286527))

(declare-fun m!286529 () Bool)

(assert (=> b!184401 m!286529))

(assert (=> b!184408 m!286509))

(assert (=> b!184408 m!286511))

(declare-fun m!286531 () Bool)

(assert (=> b!184411 m!286531))

(declare-fun m!286533 () Bool)

(assert (=> b!184402 m!286533))

(declare-fun m!286535 () Bool)

(assert (=> b!184399 m!286535))

(declare-fun m!286537 () Bool)

(assert (=> b!184415 m!286537))

(declare-fun m!286539 () Bool)

(assert (=> b!184415 m!286539))

(assert (=> b!184415 m!286539))

(declare-fun m!286541 () Bool)

(assert (=> b!184415 m!286541))

(declare-fun m!286543 () Bool)

(assert (=> b!184410 m!286543))

(declare-fun m!286545 () Bool)

(assert (=> b!184405 m!286545))

(assert (=> b!184405 m!286545))

(declare-fun m!286547 () Bool)

(assert (=> b!184405 m!286547))

(declare-fun m!286549 () Bool)

(assert (=> b!184406 m!286549))

(declare-fun m!286551 () Bool)

(assert (=> b!184406 m!286551))

(declare-fun m!286553 () Bool)

(assert (=> b!184406 m!286553))

(declare-fun m!286555 () Bool)

(assert (=> b!184406 m!286555))

(declare-fun m!286557 () Bool)

(assert (=> b!184406 m!286557))

(declare-fun m!286559 () Bool)

(assert (=> b!184406 m!286559))

(declare-fun m!286561 () Bool)

(assert (=> b!184406 m!286561))

(declare-fun m!286563 () Bool)

(assert (=> b!184406 m!286563))

(declare-fun m!286565 () Bool)

(assert (=> b!184406 m!286565))

(declare-fun m!286567 () Bool)

(assert (=> b!184406 m!286567))

(declare-fun m!286569 () Bool)

(assert (=> b!184406 m!286569))

(declare-fun m!286571 () Bool)

(assert (=> b!184406 m!286571))

(declare-fun m!286573 () Bool)

(assert (=> b!184406 m!286573))

(declare-fun m!286575 () Bool)

(assert (=> b!184406 m!286575))

(declare-fun m!286577 () Bool)

(assert (=> b!184406 m!286577))

(declare-fun m!286579 () Bool)

(assert (=> b!184406 m!286579))

(assert (=> b!184400 m!286531))

(push 1)

(assert (not b!184411))

(assert (not b!184415))

(assert (not b!184401))

(assert (not b!184414))

(assert (not b!184408))

(assert (not b!184405))

(assert (not b!184400))

(assert (not b!184410))

(assert (not b!184406))

(assert (not b!184399))

(assert (not b!184412))

(assert (not b!184402))

(assert (not b!184409))

(assert (not b!184407))

(assert (not start!40214))

(assert (not b!184404))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

