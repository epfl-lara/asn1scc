; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39734 () Bool)

(assert start!39734)

(declare-fun b!180110 () Bool)

(declare-fun e!125200 () Bool)

(declare-datatypes ((array!9668 0))(
  ( (array!9669 (arr!5194 (Array (_ BitVec 32) (_ BitVec 8))) (size!4264 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7636 0))(
  ( (BitStream!7637 (buf!4707 array!9668) (currentByte!8917 (_ BitVec 32)) (currentBit!8912 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15530 0))(
  ( (tuple2!15531 (_1!8410 BitStream!7636) (_2!8410 Bool)) )
))
(declare-fun lt!276226 () tuple2!15530)

(declare-fun lt!276239 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!180110 (= e!125200 (= (bitIndex!0 (size!4264 (buf!4707 (_1!8410 lt!276226))) (currentByte!8917 (_1!8410 lt!276226)) (currentBit!8912 (_1!8410 lt!276226))) lt!276239))))

(declare-fun b!180111 () Bool)

(declare-fun res!149525 () Bool)

(declare-fun e!125191 () Bool)

(assert (=> b!180111 (=> (not res!149525) (not e!125191))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun thiss!1204 () BitStream!7636)

(declare-fun i!590 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!180111 (= res!149525 (validate_offset_bits!1 ((_ sign_extend 32) (size!4264 (buf!4707 thiss!1204))) ((_ sign_extend 32) (currentByte!8917 thiss!1204)) ((_ sign_extend 32) (currentBit!8912 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!180112 () Bool)

(declare-fun e!125197 () Bool)

(declare-fun lt!276225 () tuple2!15530)

(declare-fun lt!276235 () tuple2!15530)

(assert (=> b!180112 (= e!125197 (= (_2!8410 lt!276225) (_2!8410 lt!276235)))))

(declare-fun b!180113 () Bool)

(declare-fun e!125193 () Bool)

(declare-datatypes ((Unit!12947 0))(
  ( (Unit!12948) )
))
(declare-datatypes ((tuple2!15532 0))(
  ( (tuple2!15533 (_1!8411 Unit!12947) (_2!8411 BitStream!7636)) )
))
(declare-fun lt!276224 () tuple2!15532)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!180113 (= e!125193 (invariant!0 (currentBit!8912 thiss!1204) (currentByte!8917 thiss!1204) (size!4264 (buf!4707 (_2!8411 lt!276224)))))))

(declare-fun b!180114 () Bool)

(declare-fun res!149521 () Bool)

(declare-fun e!125194 () Bool)

(assert (=> b!180114 (=> (not res!149521) (not e!125194))))

(declare-fun lt!276229 () tuple2!15532)

(declare-fun isPrefixOf!0 (BitStream!7636 BitStream!7636) Bool)

(assert (=> b!180114 (= res!149521 (isPrefixOf!0 thiss!1204 (_2!8411 lt!276229)))))

(declare-fun b!180115 () Bool)

(declare-fun res!149515 () Bool)

(assert (=> b!180115 (=> (not res!149515) (not e!125191))))

(assert (=> b!180115 (= res!149515 (invariant!0 (currentBit!8912 thiss!1204) (currentByte!8917 thiss!1204) (size!4264 (buf!4707 thiss!1204))))))

(declare-fun b!180116 () Bool)

(declare-fun res!149517 () Bool)

(declare-fun e!125198 () Bool)

(assert (=> b!180116 (=> res!149517 e!125198)))

(assert (=> b!180116 (= res!149517 (not (isPrefixOf!0 (_2!8411 lt!276229) (_2!8411 lt!276224))))))

(declare-fun b!180117 () Bool)

(assert (=> b!180117 (= e!125194 e!125200)))

(declare-fun res!149529 () Bool)

(assert (=> b!180117 (=> (not res!149529) (not e!125200))))

(declare-fun lt!276236 () Bool)

(assert (=> b!180117 (= res!149529 (and (= (_2!8410 lt!276226) lt!276236) (= (_1!8410 lt!276226) (_2!8411 lt!276229))))))

(declare-fun readBitPure!0 (BitStream!7636) tuple2!15530)

(declare-fun readerFrom!0 (BitStream!7636 (_ BitVec 32) (_ BitVec 32)) BitStream!7636)

(assert (=> b!180117 (= lt!276226 (readBitPure!0 (readerFrom!0 (_2!8411 lt!276229) (currentBit!8912 thiss!1204) (currentByte!8917 thiss!1204))))))

(declare-fun b!180118 () Bool)

(declare-fun e!125196 () Bool)

(assert (=> b!180118 (= e!125191 (not e!125196))))

(declare-fun res!149523 () Bool)

(assert (=> b!180118 (=> res!149523 e!125196)))

(declare-fun lt!276234 () (_ BitVec 64))

(declare-fun lt!276238 () (_ BitVec 64))

(assert (=> b!180118 (= res!149523 (not (= lt!276234 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!276238))))))

(assert (=> b!180118 (= lt!276234 (bitIndex!0 (size!4264 (buf!4707 (_2!8411 lt!276229))) (currentByte!8917 (_2!8411 lt!276229)) (currentBit!8912 (_2!8411 lt!276229))))))

(assert (=> b!180118 (= lt!276238 (bitIndex!0 (size!4264 (buf!4707 thiss!1204)) (currentByte!8917 thiss!1204) (currentBit!8912 thiss!1204)))))

(declare-fun e!125195 () Bool)

(assert (=> b!180118 e!125195))

(declare-fun res!149516 () Bool)

(assert (=> b!180118 (=> (not res!149516) (not e!125195))))

(assert (=> b!180118 (= res!149516 (= (size!4264 (buf!4707 thiss!1204)) (size!4264 (buf!4707 (_2!8411 lt!276229)))))))

(declare-fun appendBit!0 (BitStream!7636 Bool) tuple2!15532)

(assert (=> b!180118 (= lt!276229 (appendBit!0 thiss!1204 lt!276236))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!180118 (= lt!276236 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!180119 () Bool)

(declare-fun res!149528 () Bool)

(assert (=> b!180119 (=> res!149528 e!125198)))

(assert (=> b!180119 (= res!149528 (not (invariant!0 (currentBit!8912 (_2!8411 lt!276224)) (currentByte!8917 (_2!8411 lt!276224)) (size!4264 (buf!4707 (_2!8411 lt!276224))))))))

(declare-fun b!180120 () Bool)

(assert (=> b!180120 (= e!125198 true)))

(declare-datatypes ((tuple2!15534 0))(
  ( (tuple2!15535 (_1!8412 BitStream!7636) (_2!8412 BitStream!7636)) )
))
(declare-fun lt!276237 () tuple2!15534)

(assert (=> b!180120 (= (_2!8410 (readBitPure!0 (_1!8412 lt!276237))) lt!276236)))

(declare-fun lt!276232 () tuple2!15534)

(declare-fun reader!0 (BitStream!7636 BitStream!7636) tuple2!15534)

(assert (=> b!180120 (= lt!276232 (reader!0 (_2!8411 lt!276229) (_2!8411 lt!276224)))))

(assert (=> b!180120 (= lt!276237 (reader!0 thiss!1204 (_2!8411 lt!276224)))))

(assert (=> b!180120 e!125197))

(declare-fun res!149527 () Bool)

(assert (=> b!180120 (=> (not res!149527) (not e!125197))))

(assert (=> b!180120 (= res!149527 (= (bitIndex!0 (size!4264 (buf!4707 (_1!8410 lt!276225))) (currentByte!8917 (_1!8410 lt!276225)) (currentBit!8912 (_1!8410 lt!276225))) (bitIndex!0 (size!4264 (buf!4707 (_1!8410 lt!276235))) (currentByte!8917 (_1!8410 lt!276235)) (currentBit!8912 (_1!8410 lt!276235)))))))

(declare-fun lt!276231 () Unit!12947)

(declare-fun lt!276233 () BitStream!7636)

(declare-fun readBitPrefixLemma!0 (BitStream!7636 BitStream!7636) Unit!12947)

(assert (=> b!180120 (= lt!276231 (readBitPrefixLemma!0 lt!276233 (_2!8411 lt!276224)))))

(assert (=> b!180120 (= lt!276235 (readBitPure!0 (BitStream!7637 (buf!4707 (_2!8411 lt!276224)) (currentByte!8917 thiss!1204) (currentBit!8912 thiss!1204))))))

(assert (=> b!180120 (= lt!276225 (readBitPure!0 lt!276233))))

(assert (=> b!180120 e!125193))

(declare-fun res!149524 () Bool)

(assert (=> b!180120 (=> (not res!149524) (not e!125193))))

(assert (=> b!180120 (= res!149524 (invariant!0 (currentBit!8912 thiss!1204) (currentByte!8917 thiss!1204) (size!4264 (buf!4707 (_2!8411 lt!276229)))))))

(assert (=> b!180120 (= lt!276233 (BitStream!7637 (buf!4707 (_2!8411 lt!276229)) (currentByte!8917 thiss!1204) (currentBit!8912 thiss!1204)))))

(declare-fun b!180121 () Bool)

(declare-fun res!149526 () Bool)

(assert (=> b!180121 (=> (not res!149526) (not e!125191))))

(assert (=> b!180121 (= res!149526 (not (= i!590 nBits!348)))))

(declare-fun b!180122 () Bool)

(declare-fun res!149522 () Bool)

(assert (=> b!180122 (=> res!149522 e!125198)))

(declare-fun lt!276230 () (_ BitVec 64))

(assert (=> b!180122 (= res!149522 (or (not (= (size!4264 (buf!4707 (_2!8411 lt!276224))) (size!4264 (buf!4707 thiss!1204)))) (not (= lt!276230 (bvsub (bvadd lt!276238 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!180123 () Bool)

(assert (=> b!180123 (= e!125195 e!125194)))

(declare-fun res!149514 () Bool)

(assert (=> b!180123 (=> (not res!149514) (not e!125194))))

(declare-fun lt!276228 () (_ BitVec 64))

(assert (=> b!180123 (= res!149514 (= lt!276239 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!276228)))))

(assert (=> b!180123 (= lt!276239 (bitIndex!0 (size!4264 (buf!4707 (_2!8411 lt!276229))) (currentByte!8917 (_2!8411 lt!276229)) (currentBit!8912 (_2!8411 lt!276229))))))

(assert (=> b!180123 (= lt!276228 (bitIndex!0 (size!4264 (buf!4707 thiss!1204)) (currentByte!8917 thiss!1204) (currentBit!8912 thiss!1204)))))

(declare-fun res!149518 () Bool)

(assert (=> start!39734 (=> (not res!149518) (not e!125191))))

(assert (=> start!39734 (= res!149518 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39734 e!125191))

(assert (=> start!39734 true))

(declare-fun e!125192 () Bool)

(declare-fun inv!12 (BitStream!7636) Bool)

(assert (=> start!39734 (and (inv!12 thiss!1204) e!125192)))

(declare-fun b!180124 () Bool)

(declare-fun array_inv!4005 (array!9668) Bool)

(assert (=> b!180124 (= e!125192 (array_inv!4005 (buf!4707 thiss!1204)))))

(declare-fun b!180125 () Bool)

(assert (=> b!180125 (= e!125196 e!125198)))

(declare-fun res!149519 () Bool)

(assert (=> b!180125 (=> res!149519 e!125198)))

(assert (=> b!180125 (= res!149519 (not (= lt!276230 (bvsub (bvsub (bvadd lt!276234 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!180125 (= lt!276230 (bitIndex!0 (size!4264 (buf!4707 (_2!8411 lt!276224))) (currentByte!8917 (_2!8411 lt!276224)) (currentBit!8912 (_2!8411 lt!276224))))))

(assert (=> b!180125 (isPrefixOf!0 thiss!1204 (_2!8411 lt!276224))))

(declare-fun lt!276227 () Unit!12947)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7636 BitStream!7636 BitStream!7636) Unit!12947)

(assert (=> b!180125 (= lt!276227 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8411 lt!276229) (_2!8411 lt!276224)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7636 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15532)

(assert (=> b!180125 (= lt!276224 (appendBitsLSBFirstLoopTR!0 (_2!8411 lt!276229) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!180126 () Bool)

(declare-fun res!149520 () Bool)

(assert (=> b!180126 (=> res!149520 e!125198)))

(assert (=> b!180126 (= res!149520 (not (isPrefixOf!0 thiss!1204 (_2!8411 lt!276229))))))

(assert (= (and start!39734 res!149518) b!180111))

(assert (= (and b!180111 res!149525) b!180115))

(assert (= (and b!180115 res!149515) b!180121))

(assert (= (and b!180121 res!149526) b!180118))

(assert (= (and b!180118 res!149516) b!180123))

(assert (= (and b!180123 res!149514) b!180114))

(assert (= (and b!180114 res!149521) b!180117))

(assert (= (and b!180117 res!149529) b!180110))

(assert (= (and b!180118 (not res!149523)) b!180125))

(assert (= (and b!180125 (not res!149519)) b!180119))

(assert (= (and b!180119 (not res!149528)) b!180122))

(assert (= (and b!180122 (not res!149522)) b!180116))

(assert (= (and b!180116 (not res!149517)) b!180126))

(assert (= (and b!180126 (not res!149520)) b!180120))

(assert (= (and b!180120 res!149524) b!180113))

(assert (= (and b!180120 res!149527) b!180112))

(assert (= start!39734 b!180124))

(declare-fun m!280489 () Bool)

(assert (=> start!39734 m!280489))

(declare-fun m!280491 () Bool)

(assert (=> b!180115 m!280491))

(declare-fun m!280493 () Bool)

(assert (=> b!180120 m!280493))

(declare-fun m!280495 () Bool)

(assert (=> b!180120 m!280495))

(declare-fun m!280497 () Bool)

(assert (=> b!180120 m!280497))

(declare-fun m!280499 () Bool)

(assert (=> b!180120 m!280499))

(declare-fun m!280501 () Bool)

(assert (=> b!180120 m!280501))

(declare-fun m!280503 () Bool)

(assert (=> b!180120 m!280503))

(declare-fun m!280505 () Bool)

(assert (=> b!180120 m!280505))

(declare-fun m!280507 () Bool)

(assert (=> b!180120 m!280507))

(declare-fun m!280509 () Bool)

(assert (=> b!180120 m!280509))

(declare-fun m!280511 () Bool)

(assert (=> b!180119 m!280511))

(declare-fun m!280513 () Bool)

(assert (=> b!180118 m!280513))

(declare-fun m!280515 () Bool)

(assert (=> b!180118 m!280515))

(declare-fun m!280517 () Bool)

(assert (=> b!180118 m!280517))

(declare-fun m!280519 () Bool)

(assert (=> b!180117 m!280519))

(assert (=> b!180117 m!280519))

(declare-fun m!280521 () Bool)

(assert (=> b!180117 m!280521))

(declare-fun m!280523 () Bool)

(assert (=> b!180124 m!280523))

(declare-fun m!280525 () Bool)

(assert (=> b!180110 m!280525))

(declare-fun m!280527 () Bool)

(assert (=> b!180126 m!280527))

(declare-fun m!280529 () Bool)

(assert (=> b!180116 m!280529))

(assert (=> b!180123 m!280513))

(assert (=> b!180123 m!280515))

(declare-fun m!280531 () Bool)

(assert (=> b!180113 m!280531))

(declare-fun m!280533 () Bool)

(assert (=> b!180111 m!280533))

(declare-fun m!280535 () Bool)

(assert (=> b!180125 m!280535))

(declare-fun m!280537 () Bool)

(assert (=> b!180125 m!280537))

(declare-fun m!280539 () Bool)

(assert (=> b!180125 m!280539))

(declare-fun m!280541 () Bool)

(assert (=> b!180125 m!280541))

(assert (=> b!180114 m!280527))

(push 1)

