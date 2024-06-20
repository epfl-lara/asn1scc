; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39968 () Bool)

(assert start!39968)

(declare-fun b!182224 () Bool)

(declare-fun res!151431 () Bool)

(declare-fun e!126490 () Bool)

(assert (=> b!182224 (=> (not res!151431) (not e!126490))))

(declare-datatypes ((array!9728 0))(
  ( (array!9729 (arr!5221 (Array (_ BitVec 32) (_ BitVec 8))) (size!4291 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7690 0))(
  ( (BitStream!7691 (buf!4740 array!9728) (currentByte!8962 (_ BitVec 32)) (currentBit!8957 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7690)

(declare-datatypes ((Unit!13079 0))(
  ( (Unit!13080) )
))
(declare-datatypes ((tuple2!15740 0))(
  ( (tuple2!15741 (_1!8515 Unit!13079) (_2!8515 BitStream!7690)) )
))
(declare-fun lt!279746 () tuple2!15740)

(declare-fun isPrefixOf!0 (BitStream!7690 BitStream!7690) Bool)

(assert (=> b!182224 (= res!151431 (isPrefixOf!0 thiss!1204 (_2!8515 lt!279746)))))

(declare-fun b!182225 () Bool)

(declare-fun e!126495 () Bool)

(declare-datatypes ((tuple2!15742 0))(
  ( (tuple2!15743 (_1!8516 BitStream!7690) (_2!8516 Bool)) )
))
(declare-fun lt!279745 () tuple2!15742)

(declare-fun lt!279730 () tuple2!15742)

(assert (=> b!182225 (= e!126495 (= (_2!8516 lt!279745) (_2!8516 lt!279730)))))

(declare-fun b!182226 () Bool)

(declare-fun e!126485 () Bool)

(declare-fun e!126491 () Bool)

(assert (=> b!182226 (= e!126485 e!126491)))

(declare-fun res!151428 () Bool)

(assert (=> b!182226 (=> res!151428 e!126491)))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun lt!279735 () (_ BitVec 64))

(declare-fun lt!279739 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!182226 (= res!151428 (not (= lt!279739 (bvsub (bvsub (bvadd lt!279735 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun lt!279736 () tuple2!15740)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!182226 (= lt!279739 (bitIndex!0 (size!4291 (buf!4740 (_2!8515 lt!279736))) (currentByte!8962 (_2!8515 lt!279736)) (currentBit!8957 (_2!8515 lt!279736))))))

(assert (=> b!182226 (isPrefixOf!0 thiss!1204 (_2!8515 lt!279736))))

(declare-fun lt!279741 () Unit!13079)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7690 BitStream!7690 BitStream!7690) Unit!13079)

(assert (=> b!182226 (= lt!279741 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8515 lt!279746) (_2!8515 lt!279736)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7690 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15740)

(assert (=> b!182226 (= lt!279736 (appendBitsLSBFirstLoopTR!0 (_2!8515 lt!279746) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!182227 () Bool)

(declare-fun e!126487 () Bool)

(declare-fun lt!279748 () tuple2!15742)

(declare-fun lt!279749 () (_ BitVec 64))

(assert (=> b!182227 (= e!126487 (= (bitIndex!0 (size!4291 (buf!4740 (_1!8516 lt!279748))) (currentByte!8962 (_1!8516 lt!279748)) (currentBit!8957 (_1!8516 lt!279748))) lt!279749))))

(declare-fun b!182228 () Bool)

(declare-fun res!151442 () Bool)

(assert (=> b!182228 (=> res!151442 e!126491)))

(declare-fun lt!279743 () (_ BitVec 64))

(assert (=> b!182228 (= res!151442 (or (not (= (size!4291 (buf!4740 (_2!8515 lt!279736))) (size!4291 (buf!4740 thiss!1204)))) (not (= lt!279739 (bvsub (bvadd lt!279743 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!182229 () Bool)

(declare-fun res!151440 () Bool)

(declare-fun e!126492 () Bool)

(assert (=> b!182229 (=> (not res!151440) (not e!126492))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!182229 (= res!151440 (invariant!0 (currentBit!8957 thiss!1204) (currentByte!8962 thiss!1204) (size!4291 (buf!4740 thiss!1204))))))

(declare-fun b!182230 () Bool)

(declare-fun e!126488 () Bool)

(assert (=> b!182230 (= e!126491 e!126488)))

(declare-fun res!151433 () Bool)

(assert (=> b!182230 (=> res!151433 e!126488)))

(assert (=> b!182230 (= res!151433 (or (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!590)) (bvsgt (bvadd #b00000000000000000000000000000001 i!590) nBits!348)))))

(declare-fun lt!279747 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!182230 (validate_offset_bits!1 ((_ sign_extend 32) (size!4291 (buf!4740 (_2!8515 lt!279736)))) ((_ sign_extend 32) (currentByte!8962 (_2!8515 lt!279746))) ((_ sign_extend 32) (currentBit!8957 (_2!8515 lt!279746))) lt!279747)))

(declare-fun lt!279738 () Unit!13079)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7690 array!9728 (_ BitVec 64)) Unit!13079)

(assert (=> b!182230 (= lt!279738 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8515 lt!279746) (buf!4740 (_2!8515 lt!279736)) lt!279747))))

(assert (=> b!182230 (= lt!279747 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!15744 0))(
  ( (tuple2!15745 (_1!8517 BitStream!7690) (_2!8517 (_ BitVec 64))) )
))
(declare-fun lt!279737 () tuple2!15744)

(declare-datatypes ((tuple2!15746 0))(
  ( (tuple2!15747 (_1!8518 BitStream!7690) (_2!8518 BitStream!7690)) )
))
(declare-fun lt!279733 () tuple2!15746)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7690 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!15744)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!182230 (= lt!279737 (readNBitsLSBFirstsLoopPure!0 (_1!8518 lt!279733) nBits!348 i!590 (bvand v!189 (onesLSBLong!0 i!590))))))

(declare-fun lt!279734 () (_ BitVec 64))

(assert (=> b!182230 (validate_offset_bits!1 ((_ sign_extend 32) (size!4291 (buf!4740 (_2!8515 lt!279736)))) ((_ sign_extend 32) (currentByte!8962 thiss!1204)) ((_ sign_extend 32) (currentBit!8957 thiss!1204)) lt!279734)))

(declare-fun lt!279744 () Unit!13079)

(assert (=> b!182230 (= lt!279744 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4740 (_2!8515 lt!279736)) lt!279734))))

(declare-fun lt!279732 () Bool)

(declare-fun readBitPure!0 (BitStream!7690) tuple2!15742)

(assert (=> b!182230 (= (_2!8516 (readBitPure!0 (_1!8518 lt!279733))) lt!279732)))

(declare-fun lt!279742 () tuple2!15746)

(declare-fun reader!0 (BitStream!7690 BitStream!7690) tuple2!15746)

(assert (=> b!182230 (= lt!279742 (reader!0 (_2!8515 lt!279746) (_2!8515 lt!279736)))))

(assert (=> b!182230 (= lt!279733 (reader!0 thiss!1204 (_2!8515 lt!279736)))))

(assert (=> b!182230 e!126495))

(declare-fun res!151430 () Bool)

(assert (=> b!182230 (=> (not res!151430) (not e!126495))))

(assert (=> b!182230 (= res!151430 (= (bitIndex!0 (size!4291 (buf!4740 (_1!8516 lt!279745))) (currentByte!8962 (_1!8516 lt!279745)) (currentBit!8957 (_1!8516 lt!279745))) (bitIndex!0 (size!4291 (buf!4740 (_1!8516 lt!279730))) (currentByte!8962 (_1!8516 lt!279730)) (currentBit!8957 (_1!8516 lt!279730)))))))

(declare-fun lt!279731 () Unit!13079)

(declare-fun lt!279729 () BitStream!7690)

(declare-fun readBitPrefixLemma!0 (BitStream!7690 BitStream!7690) Unit!13079)

(assert (=> b!182230 (= lt!279731 (readBitPrefixLemma!0 lt!279729 (_2!8515 lt!279736)))))

(assert (=> b!182230 (= lt!279730 (readBitPure!0 (BitStream!7691 (buf!4740 (_2!8515 lt!279736)) (currentByte!8962 thiss!1204) (currentBit!8957 thiss!1204))))))

(assert (=> b!182230 (= lt!279745 (readBitPure!0 lt!279729))))

(declare-fun e!126494 () Bool)

(assert (=> b!182230 e!126494))

(declare-fun res!151438 () Bool)

(assert (=> b!182230 (=> (not res!151438) (not e!126494))))

(assert (=> b!182230 (= res!151438 (invariant!0 (currentBit!8957 thiss!1204) (currentByte!8962 thiss!1204) (size!4291 (buf!4740 (_2!8515 lt!279746)))))))

(assert (=> b!182230 (= lt!279729 (BitStream!7691 (buf!4740 (_2!8515 lt!279746)) (currentByte!8962 thiss!1204) (currentBit!8957 thiss!1204)))))

(declare-fun b!182231 () Bool)

(declare-fun e!126496 () Bool)

(assert (=> b!182231 (= e!126496 e!126492)))

(declare-fun res!151437 () Bool)

(assert (=> b!182231 (=> (not res!151437) (not e!126492))))

(assert (=> b!182231 (= res!151437 (validate_offset_bits!1 ((_ sign_extend 32) (size!4291 (buf!4740 thiss!1204))) ((_ sign_extend 32) (currentByte!8962 thiss!1204)) ((_ sign_extend 32) (currentBit!8957 thiss!1204)) lt!279734))))

(assert (=> b!182231 (= lt!279734 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun res!151435 () Bool)

(assert (=> start!39968 (=> (not res!151435) (not e!126496))))

(assert (=> start!39968 (= res!151435 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39968 e!126496))

(assert (=> start!39968 true))

(declare-fun e!126489 () Bool)

(declare-fun inv!12 (BitStream!7690) Bool)

(assert (=> start!39968 (and (inv!12 thiss!1204) e!126489)))

(declare-fun b!182232 () Bool)

(assert (=> b!182232 (= e!126492 (not e!126485))))

(declare-fun res!151432 () Bool)

(assert (=> b!182232 (=> res!151432 e!126485)))

(assert (=> b!182232 (= res!151432 (not (= lt!279735 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!279743))))))

(assert (=> b!182232 (= lt!279735 (bitIndex!0 (size!4291 (buf!4740 (_2!8515 lt!279746))) (currentByte!8962 (_2!8515 lt!279746)) (currentBit!8957 (_2!8515 lt!279746))))))

(assert (=> b!182232 (= lt!279743 (bitIndex!0 (size!4291 (buf!4740 thiss!1204)) (currentByte!8962 thiss!1204) (currentBit!8957 thiss!1204)))))

(declare-fun e!126486 () Bool)

(assert (=> b!182232 e!126486))

(declare-fun res!151427 () Bool)

(assert (=> b!182232 (=> (not res!151427) (not e!126486))))

(assert (=> b!182232 (= res!151427 (= (size!4291 (buf!4740 thiss!1204)) (size!4291 (buf!4740 (_2!8515 lt!279746)))))))

(declare-fun appendBit!0 (BitStream!7690 Bool) tuple2!15740)

(assert (=> b!182232 (= lt!279746 (appendBit!0 thiss!1204 lt!279732))))

(assert (=> b!182232 (= lt!279732 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!182233 () Bool)

(assert (=> b!182233 (= e!126494 (invariant!0 (currentBit!8957 thiss!1204) (currentByte!8962 thiss!1204) (size!4291 (buf!4740 (_2!8515 lt!279736)))))))

(declare-fun b!182234 () Bool)

(assert (=> b!182234 (= e!126488 (validate_offset_bits!1 ((_ sign_extend 32) (size!4291 (buf!4740 (_1!8518 lt!279742)))) ((_ sign_extend 32) (currentByte!8962 (_1!8518 lt!279742))) ((_ sign_extend 32) (currentBit!8957 (_1!8518 lt!279742))) ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun b!182235 () Bool)

(declare-fun res!151443 () Bool)

(assert (=> b!182235 (=> res!151443 e!126491)))

(assert (=> b!182235 (= res!151443 (not (isPrefixOf!0 thiss!1204 (_2!8515 lt!279746))))))

(declare-fun b!182236 () Bool)

(assert (=> b!182236 (= e!126486 e!126490)))

(declare-fun res!151434 () Bool)

(assert (=> b!182236 (=> (not res!151434) (not e!126490))))

(declare-fun lt!279740 () (_ BitVec 64))

(assert (=> b!182236 (= res!151434 (= lt!279749 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!279740)))))

(assert (=> b!182236 (= lt!279749 (bitIndex!0 (size!4291 (buf!4740 (_2!8515 lt!279746))) (currentByte!8962 (_2!8515 lt!279746)) (currentBit!8957 (_2!8515 lt!279746))))))

(assert (=> b!182236 (= lt!279740 (bitIndex!0 (size!4291 (buf!4740 thiss!1204)) (currentByte!8962 thiss!1204) (currentBit!8957 thiss!1204)))))

(declare-fun b!182237 () Bool)

(declare-fun res!151436 () Bool)

(assert (=> b!182237 (=> res!151436 e!126491)))

(assert (=> b!182237 (= res!151436 (not (isPrefixOf!0 (_2!8515 lt!279746) (_2!8515 lt!279736))))))

(declare-fun b!182238 () Bool)

(declare-fun res!151429 () Bool)

(assert (=> b!182238 (=> res!151429 e!126491)))

(assert (=> b!182238 (= res!151429 (not (invariant!0 (currentBit!8957 (_2!8515 lt!279736)) (currentByte!8962 (_2!8515 lt!279736)) (size!4291 (buf!4740 (_2!8515 lt!279736))))))))

(declare-fun b!182239 () Bool)

(assert (=> b!182239 (= e!126490 e!126487)))

(declare-fun res!151439 () Bool)

(assert (=> b!182239 (=> (not res!151439) (not e!126487))))

(assert (=> b!182239 (= res!151439 (and (= (_2!8516 lt!279748) lt!279732) (= (_1!8516 lt!279748) (_2!8515 lt!279746))))))

(declare-fun readerFrom!0 (BitStream!7690 (_ BitVec 32) (_ BitVec 32)) BitStream!7690)

(assert (=> b!182239 (= lt!279748 (readBitPure!0 (readerFrom!0 (_2!8515 lt!279746) (currentBit!8957 thiss!1204) (currentByte!8962 thiss!1204))))))

(declare-fun b!182240 () Bool)

(declare-fun array_inv!4032 (array!9728) Bool)

(assert (=> b!182240 (= e!126489 (array_inv!4032 (buf!4740 thiss!1204)))))

(declare-fun b!182241 () Bool)

(declare-fun res!151441 () Bool)

(assert (=> b!182241 (=> (not res!151441) (not e!126492))))

(assert (=> b!182241 (= res!151441 (not (= i!590 nBits!348)))))

(assert (= (and start!39968 res!151435) b!182231))

(assert (= (and b!182231 res!151437) b!182229))

(assert (= (and b!182229 res!151440) b!182241))

(assert (= (and b!182241 res!151441) b!182232))

(assert (= (and b!182232 res!151427) b!182236))

(assert (= (and b!182236 res!151434) b!182224))

(assert (= (and b!182224 res!151431) b!182239))

(assert (= (and b!182239 res!151439) b!182227))

(assert (= (and b!182232 (not res!151432)) b!182226))

(assert (= (and b!182226 (not res!151428)) b!182238))

(assert (= (and b!182238 (not res!151429)) b!182228))

(assert (= (and b!182228 (not res!151442)) b!182237))

(assert (= (and b!182237 (not res!151436)) b!182235))

(assert (= (and b!182235 (not res!151443)) b!182230))

(assert (= (and b!182230 res!151438) b!182233))

(assert (= (and b!182230 res!151430) b!182225))

(assert (= (and b!182230 (not res!151433)) b!182234))

(assert (= start!39968 b!182240))

(declare-fun m!283429 () Bool)

(assert (=> b!182230 m!283429))

(declare-fun m!283431 () Bool)

(assert (=> b!182230 m!283431))

(declare-fun m!283433 () Bool)

(assert (=> b!182230 m!283433))

(declare-fun m!283435 () Bool)

(assert (=> b!182230 m!283435))

(declare-fun m!283437 () Bool)

(assert (=> b!182230 m!283437))

(declare-fun m!283439 () Bool)

(assert (=> b!182230 m!283439))

(declare-fun m!283441 () Bool)

(assert (=> b!182230 m!283441))

(declare-fun m!283443 () Bool)

(assert (=> b!182230 m!283443))

(declare-fun m!283445 () Bool)

(assert (=> b!182230 m!283445))

(declare-fun m!283447 () Bool)

(assert (=> b!182230 m!283447))

(declare-fun m!283449 () Bool)

(assert (=> b!182230 m!283449))

(declare-fun m!283451 () Bool)

(assert (=> b!182230 m!283451))

(declare-fun m!283453 () Bool)

(assert (=> b!182230 m!283453))

(declare-fun m!283455 () Bool)

(assert (=> b!182230 m!283455))

(declare-fun m!283457 () Bool)

(assert (=> b!182230 m!283457))

(declare-fun m!283459 () Bool)

(assert (=> b!182234 m!283459))

(declare-fun m!283461 () Bool)

(assert (=> b!182229 m!283461))

(declare-fun m!283463 () Bool)

(assert (=> b!182227 m!283463))

(declare-fun m!283465 () Bool)

(assert (=> b!182235 m!283465))

(declare-fun m!283467 () Bool)

(assert (=> b!182240 m!283467))

(declare-fun m!283469 () Bool)

(assert (=> start!39968 m!283469))

(declare-fun m!283471 () Bool)

(assert (=> b!182233 m!283471))

(declare-fun m!283473 () Bool)

(assert (=> b!182236 m!283473))

(declare-fun m!283475 () Bool)

(assert (=> b!182236 m!283475))

(declare-fun m!283477 () Bool)

(assert (=> b!182226 m!283477))

(declare-fun m!283479 () Bool)

(assert (=> b!182226 m!283479))

(declare-fun m!283481 () Bool)

(assert (=> b!182226 m!283481))

(declare-fun m!283483 () Bool)

(assert (=> b!182226 m!283483))

(assert (=> b!182224 m!283465))

(assert (=> b!182232 m!283473))

(assert (=> b!182232 m!283475))

(declare-fun m!283485 () Bool)

(assert (=> b!182232 m!283485))

(declare-fun m!283487 () Bool)

(assert (=> b!182237 m!283487))

(declare-fun m!283489 () Bool)

(assert (=> b!182231 m!283489))

(declare-fun m!283491 () Bool)

(assert (=> b!182239 m!283491))

(assert (=> b!182239 m!283491))

(declare-fun m!283493 () Bool)

(assert (=> b!182239 m!283493))

(declare-fun m!283495 () Bool)

(assert (=> b!182238 m!283495))

(push 1)

(assert (not b!182230))

(assert (not b!182231))

(assert (not b!182240))

(assert (not start!39968))

(assert (not b!182235))

(assert (not b!182224))

(assert (not b!182236))

(assert (not b!182238))

(assert (not b!182229))

(assert (not b!182234))

(assert (not b!182226))

(assert (not b!182233))

(assert (not b!182227))

(assert (not b!182232))

(assert (not b!182239))

(assert (not b!182237))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!63271 () Bool)

(declare-fun res!151614 () Bool)

(declare-fun e!126611 () Bool)

(assert (=> d!63271 (=> (not res!151614) (not e!126611))))

(assert (=> d!63271 (= res!151614 (= (size!4291 (buf!4740 thiss!1204)) (size!4291 (buf!4740 (_2!8515 lt!279746)))))))

(assert (=> d!63271 (= (isPrefixOf!0 thiss!1204 (_2!8515 lt!279746)) e!126611)))

(declare-fun b!182426 () Bool)

(declare-fun res!151615 () Bool)

(assert (=> b!182426 (=> (not res!151615) (not e!126611))))

(assert (=> b!182426 (= res!151615 (bvsle (bitIndex!0 (size!4291 (buf!4740 thiss!1204)) (currentByte!8962 thiss!1204) (currentBit!8957 thiss!1204)) (bitIndex!0 (size!4291 (buf!4740 (_2!8515 lt!279746))) (currentByte!8962 (_2!8515 lt!279746)) (currentBit!8957 (_2!8515 lt!279746)))))))

(declare-fun b!182427 () Bool)

(declare-fun e!126612 () Bool)

(assert (=> b!182427 (= e!126611 e!126612)))

(declare-fun res!151616 () Bool)

(assert (=> b!182427 (=> res!151616 e!126612)))

(assert (=> b!182427 (= res!151616 (= (size!4291 (buf!4740 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!182428 () Bool)

(declare-fun arrayBitRangesEq!0 (array!9728 array!9728 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!182428 (= e!126612 (arrayBitRangesEq!0 (buf!4740 thiss!1204) (buf!4740 (_2!8515 lt!279746)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4291 (buf!4740 thiss!1204)) (currentByte!8962 thiss!1204) (currentBit!8957 thiss!1204))))))

(assert (= (and d!63271 res!151614) b!182426))

(assert (= (and b!182426 res!151615) b!182427))

(assert (= (and b!182427 (not res!151616)) b!182428))

(assert (=> b!182426 m!283475))

(assert (=> b!182426 m!283473))

(assert (=> b!182428 m!283475))

(assert (=> b!182428 m!283475))

(declare-fun m!283761 () Bool)

(assert (=> b!182428 m!283761))

(assert (=> b!182235 d!63271))

(declare-fun d!63273 () Bool)

(declare-fun e!126615 () Bool)

(assert (=> d!63273 e!126615))

(declare-fun res!151622 () Bool)

(assert (=> d!63273 (=> (not res!151622) (not e!126615))))

(declare-fun lt!280059 () (_ BitVec 64))

(declare-fun lt!280056 () (_ BitVec 64))

(declare-fun lt!280060 () (_ BitVec 64))

(assert (=> d!63273 (= res!151622 (= lt!280060 (bvsub lt!280059 lt!280056)))))

(assert (=> d!63273 (or (= (bvand lt!280059 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!280056 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!280059 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!280059 lt!280056) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!63273 (= lt!280056 (remainingBits!0 ((_ sign_extend 32) (size!4291 (buf!4740 (_2!8515 lt!279746)))) ((_ sign_extend 32) (currentByte!8962 (_2!8515 lt!279746))) ((_ sign_extend 32) (currentBit!8957 (_2!8515 lt!279746)))))))

(declare-fun lt!280061 () (_ BitVec 64))

(declare-fun lt!280058 () (_ BitVec 64))

(assert (=> d!63273 (= lt!280059 (bvmul lt!280061 lt!280058))))

(assert (=> d!63273 (or (= lt!280061 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!280058 (bvsdiv (bvmul lt!280061 lt!280058) lt!280061)))))

(assert (=> d!63273 (= lt!280058 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!63273 (= lt!280061 ((_ sign_extend 32) (size!4291 (buf!4740 (_2!8515 lt!279746)))))))

(assert (=> d!63273 (= lt!280060 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8962 (_2!8515 lt!279746))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8957 (_2!8515 lt!279746)))))))

(assert (=> d!63273 (invariant!0 (currentBit!8957 (_2!8515 lt!279746)) (currentByte!8962 (_2!8515 lt!279746)) (size!4291 (buf!4740 (_2!8515 lt!279746))))))

(assert (=> d!63273 (= (bitIndex!0 (size!4291 (buf!4740 (_2!8515 lt!279746))) (currentByte!8962 (_2!8515 lt!279746)) (currentBit!8957 (_2!8515 lt!279746))) lt!280060)))

(declare-fun b!182433 () Bool)

(declare-fun res!151621 () Bool)

(assert (=> b!182433 (=> (not res!151621) (not e!126615))))

(assert (=> b!182433 (= res!151621 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!280060))))

(declare-fun b!182434 () Bool)

(declare-fun lt!280057 () (_ BitVec 64))

(assert (=> b!182434 (= e!126615 (bvsle lt!280060 (bvmul lt!280057 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!182434 (or (= lt!280057 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!280057 #b0000000000000000000000000000000000000000000000000000000000001000) lt!280057)))))

(assert (=> b!182434 (= lt!280057 ((_ sign_extend 32) (size!4291 (buf!4740 (_2!8515 lt!279746)))))))

(assert (= (and d!63273 res!151622) b!182433))

(assert (= (and b!182433 res!151621) b!182434))

(declare-fun m!283763 () Bool)

(assert (=> d!63273 m!283763))

(declare-fun m!283765 () Bool)

(assert (=> d!63273 m!283765))

(assert (=> b!182236 d!63273))

(declare-fun d!63275 () Bool)

(declare-fun e!126616 () Bool)

(assert (=> d!63275 e!126616))

(declare-fun res!151624 () Bool)

(assert (=> d!63275 (=> (not res!151624) (not e!126616))))

(declare-fun lt!280065 () (_ BitVec 64))

(declare-fun lt!280066 () (_ BitVec 64))

(declare-fun lt!280062 () (_ BitVec 64))

(assert (=> d!63275 (= res!151624 (= lt!280066 (bvsub lt!280065 lt!280062)))))

(assert (=> d!63275 (or (= (bvand lt!280065 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!280062 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!280065 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!280065 lt!280062) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63275 (= lt!280062 (remainingBits!0 ((_ sign_extend 32) (size!4291 (buf!4740 thiss!1204))) ((_ sign_extend 32) (currentByte!8962 thiss!1204)) ((_ sign_extend 32) (currentBit!8957 thiss!1204))))))

(declare-fun lt!280067 () (_ BitVec 64))

(declare-fun lt!280064 () (_ BitVec 64))

(assert (=> d!63275 (= lt!280065 (bvmul lt!280067 lt!280064))))

(assert (=> d!63275 (or (= lt!280067 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!280064 (bvsdiv (bvmul lt!280067 lt!280064) lt!280067)))))

(assert (=> d!63275 (= lt!280064 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!63275 (= lt!280067 ((_ sign_extend 32) (size!4291 (buf!4740 thiss!1204))))))

(assert (=> d!63275 (= lt!280066 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8962 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8957 thiss!1204))))))

(assert (=> d!63275 (invariant!0 (currentBit!8957 thiss!1204) (currentByte!8962 thiss!1204) (size!4291 (buf!4740 thiss!1204)))))

(assert (=> d!63275 (= (bitIndex!0 (size!4291 (buf!4740 thiss!1204)) (currentByte!8962 thiss!1204) (currentBit!8957 thiss!1204)) lt!280066)))

(declare-fun b!182435 () Bool)

(declare-fun res!151623 () Bool)

(assert (=> b!182435 (=> (not res!151623) (not e!126616))))

(assert (=> b!182435 (= res!151623 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!280066))))

(declare-fun b!182436 () Bool)

(declare-fun lt!280063 () (_ BitVec 64))

(assert (=> b!182436 (= e!126616 (bvsle lt!280066 (bvmul lt!280063 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!182436 (or (= lt!280063 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!280063 #b0000000000000000000000000000000000000000000000000000000000001000) lt!280063)))))

(assert (=> b!182436 (= lt!280063 ((_ sign_extend 32) (size!4291 (buf!4740 thiss!1204))))))

(assert (= (and d!63275 res!151624) b!182435))

(assert (= (and b!182435 res!151623) b!182436))

(declare-fun m!283767 () Bool)

(assert (=> d!63275 m!283767))

(assert (=> d!63275 m!283461))

(assert (=> b!182236 d!63275))

(declare-fun d!63277 () Bool)

(assert (=> d!63277 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4291 (buf!4740 (_1!8518 lt!279742)))) ((_ sign_extend 32) (currentByte!8962 (_1!8518 lt!279742))) ((_ sign_extend 32) (currentBit!8957 (_1!8518 lt!279742))) ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4291 (buf!4740 (_1!8518 lt!279742)))) ((_ sign_extend 32) (currentByte!8962 (_1!8518 lt!279742))) ((_ sign_extend 32) (currentBit!8957 (_1!8518 lt!279742)))) ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun bs!15761 () Bool)

(assert (= bs!15761 d!63277))

(declare-fun m!283769 () Bool)

(assert (=> bs!15761 m!283769))

(assert (=> b!182234 d!63277))

(assert (=> b!182224 d!63271))

(declare-fun d!63279 () Bool)

(declare-fun e!126617 () Bool)

(assert (=> d!63279 e!126617))

(declare-fun res!151626 () Bool)

(assert (=> d!63279 (=> (not res!151626) (not e!126617))))

(declare-fun lt!280072 () (_ BitVec 64))

(declare-fun lt!280071 () (_ BitVec 64))

(declare-fun lt!280068 () (_ BitVec 64))

(assert (=> d!63279 (= res!151626 (= lt!280072 (bvsub lt!280071 lt!280068)))))

(assert (=> d!63279 (or (= (bvand lt!280071 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!280068 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!280071 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!280071 lt!280068) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63279 (= lt!280068 (remainingBits!0 ((_ sign_extend 32) (size!4291 (buf!4740 (_1!8516 lt!279748)))) ((_ sign_extend 32) (currentByte!8962 (_1!8516 lt!279748))) ((_ sign_extend 32) (currentBit!8957 (_1!8516 lt!279748)))))))

(declare-fun lt!280073 () (_ BitVec 64))

(declare-fun lt!280070 () (_ BitVec 64))

(assert (=> d!63279 (= lt!280071 (bvmul lt!280073 lt!280070))))

(assert (=> d!63279 (or (= lt!280073 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!280070 (bvsdiv (bvmul lt!280073 lt!280070) lt!280073)))))

(assert (=> d!63279 (= lt!280070 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!63279 (= lt!280073 ((_ sign_extend 32) (size!4291 (buf!4740 (_1!8516 lt!279748)))))))

(assert (=> d!63279 (= lt!280072 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8962 (_1!8516 lt!279748))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8957 (_1!8516 lt!279748)))))))

(assert (=> d!63279 (invariant!0 (currentBit!8957 (_1!8516 lt!279748)) (currentByte!8962 (_1!8516 lt!279748)) (size!4291 (buf!4740 (_1!8516 lt!279748))))))

(assert (=> d!63279 (= (bitIndex!0 (size!4291 (buf!4740 (_1!8516 lt!279748))) (currentByte!8962 (_1!8516 lt!279748)) (currentBit!8957 (_1!8516 lt!279748))) lt!280072)))

(declare-fun b!182437 () Bool)

(declare-fun res!151625 () Bool)

(assert (=> b!182437 (=> (not res!151625) (not e!126617))))

(assert (=> b!182437 (= res!151625 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!280072))))

(declare-fun b!182438 () Bool)

(declare-fun lt!280069 () (_ BitVec 64))

(assert (=> b!182438 (= e!126617 (bvsle lt!280072 (bvmul lt!280069 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!182438 (or (= lt!280069 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!280069 #b0000000000000000000000000000000000000000000000000000000000001000) lt!280069)))))

(assert (=> b!182438 (= lt!280069 ((_ sign_extend 32) (size!4291 (buf!4740 (_1!8516 lt!279748)))))))

(assert (= (and d!63279 res!151626) b!182437))

(assert (= (and b!182437 res!151625) b!182438))

(declare-fun m!283771 () Bool)

(assert (=> d!63279 m!283771))

(declare-fun m!283773 () Bool)

(assert (=> d!63279 m!283773))

(assert (=> b!182227 d!63279))

(declare-fun d!63281 () Bool)

(assert (=> d!63281 (= (invariant!0 (currentBit!8957 (_2!8515 lt!279736)) (currentByte!8962 (_2!8515 lt!279736)) (size!4291 (buf!4740 (_2!8515 lt!279736)))) (and (bvsge (currentBit!8957 (_2!8515 lt!279736)) #b00000000000000000000000000000000) (bvslt (currentBit!8957 (_2!8515 lt!279736)) #b00000000000000000000000000001000) (bvsge (currentByte!8962 (_2!8515 lt!279736)) #b00000000000000000000000000000000) (or (bvslt (currentByte!8962 (_2!8515 lt!279736)) (size!4291 (buf!4740 (_2!8515 lt!279736)))) (and (= (currentBit!8957 (_2!8515 lt!279736)) #b00000000000000000000000000000000) (= (currentByte!8962 (_2!8515 lt!279736)) (size!4291 (buf!4740 (_2!8515 lt!279736))))))))))

(assert (=> b!182238 d!63281))

(declare-fun d!63283 () Bool)

(declare-fun e!126618 () Bool)

(assert (=> d!63283 e!126618))

(declare-fun res!151628 () Bool)

(assert (=> d!63283 (=> (not res!151628) (not e!126618))))

(declare-fun lt!280078 () (_ BitVec 64))

(declare-fun lt!280077 () (_ BitVec 64))

(declare-fun lt!280074 () (_ BitVec 64))

(assert (=> d!63283 (= res!151628 (= lt!280078 (bvsub lt!280077 lt!280074)))))

(assert (=> d!63283 (or (= (bvand lt!280077 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!280074 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!280077 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!280077 lt!280074) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63283 (= lt!280074 (remainingBits!0 ((_ sign_extend 32) (size!4291 (buf!4740 (_2!8515 lt!279736)))) ((_ sign_extend 32) (currentByte!8962 (_2!8515 lt!279736))) ((_ sign_extend 32) (currentBit!8957 (_2!8515 lt!279736)))))))

(declare-fun lt!280079 () (_ BitVec 64))

(declare-fun lt!280076 () (_ BitVec 64))

(assert (=> d!63283 (= lt!280077 (bvmul lt!280079 lt!280076))))

(assert (=> d!63283 (or (= lt!280079 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!280076 (bvsdiv (bvmul lt!280079 lt!280076) lt!280079)))))

(assert (=> d!63283 (= lt!280076 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!63283 (= lt!280079 ((_ sign_extend 32) (size!4291 (buf!4740 (_2!8515 lt!279736)))))))

(assert (=> d!63283 (= lt!280078 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8962 (_2!8515 lt!279736))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8957 (_2!8515 lt!279736)))))))

(assert (=> d!63283 (invariant!0 (currentBit!8957 (_2!8515 lt!279736)) (currentByte!8962 (_2!8515 lt!279736)) (size!4291 (buf!4740 (_2!8515 lt!279736))))))

(assert (=> d!63283 (= (bitIndex!0 (size!4291 (buf!4740 (_2!8515 lt!279736))) (currentByte!8962 (_2!8515 lt!279736)) (currentBit!8957 (_2!8515 lt!279736))) lt!280078)))

(declare-fun b!182439 () Bool)

(declare-fun res!151627 () Bool)

(assert (=> b!182439 (=> (not res!151627) (not e!126618))))

(assert (=> b!182439 (= res!151627 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!280078))))

(declare-fun b!182440 () Bool)

(declare-fun lt!280075 () (_ BitVec 64))

(assert (=> b!182440 (= e!126618 (bvsle lt!280078 (bvmul lt!280075 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!182440 (or (= lt!280075 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!280075 #b0000000000000000000000000000000000000000000000000000000000001000) lt!280075)))))

(assert (=> b!182440 (= lt!280075 ((_ sign_extend 32) (size!4291 (buf!4740 (_2!8515 lt!279736)))))))

(assert (= (and d!63283 res!151628) b!182439))

(assert (= (and b!182439 res!151627) b!182440))

(declare-fun m!283775 () Bool)

(assert (=> d!63283 m!283775))

(assert (=> d!63283 m!283495))

(assert (=> b!182226 d!63283))

(declare-fun d!63285 () Bool)

(declare-fun res!151629 () Bool)

(declare-fun e!126619 () Bool)

(assert (=> d!63285 (=> (not res!151629) (not e!126619))))

(assert (=> d!63285 (= res!151629 (= (size!4291 (buf!4740 thiss!1204)) (size!4291 (buf!4740 (_2!8515 lt!279736)))))))

(assert (=> d!63285 (= (isPrefixOf!0 thiss!1204 (_2!8515 lt!279736)) e!126619)))

(declare-fun b!182441 () Bool)

(declare-fun res!151630 () Bool)

(assert (=> b!182441 (=> (not res!151630) (not e!126619))))

(assert (=> b!182441 (= res!151630 (bvsle (bitIndex!0 (size!4291 (buf!4740 thiss!1204)) (currentByte!8962 thiss!1204) (currentBit!8957 thiss!1204)) (bitIndex!0 (size!4291 (buf!4740 (_2!8515 lt!279736))) (currentByte!8962 (_2!8515 lt!279736)) (currentBit!8957 (_2!8515 lt!279736)))))))

(declare-fun b!182442 () Bool)

(declare-fun e!126620 () Bool)

(assert (=> b!182442 (= e!126619 e!126620)))

(declare-fun res!151631 () Bool)

(assert (=> b!182442 (=> res!151631 e!126620)))

(assert (=> b!182442 (= res!151631 (= (size!4291 (buf!4740 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!182443 () Bool)

(assert (=> b!182443 (= e!126620 (arrayBitRangesEq!0 (buf!4740 thiss!1204) (buf!4740 (_2!8515 lt!279736)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4291 (buf!4740 thiss!1204)) (currentByte!8962 thiss!1204) (currentBit!8957 thiss!1204))))))

(assert (= (and d!63285 res!151629) b!182441))

(assert (= (and b!182441 res!151630) b!182442))

(assert (= (and b!182442 (not res!151631)) b!182443))

(assert (=> b!182441 m!283475))

(assert (=> b!182441 m!283477))

(assert (=> b!182443 m!283475))

(assert (=> b!182443 m!283475))

(declare-fun m!283777 () Bool)

(assert (=> b!182443 m!283777))

(assert (=> b!182226 d!63285))

(declare-fun d!63287 () Bool)

(assert (=> d!63287 (isPrefixOf!0 thiss!1204 (_2!8515 lt!279736))))

(declare-fun lt!280082 () Unit!13079)

(declare-fun choose!30 (BitStream!7690 BitStream!7690 BitStream!7690) Unit!13079)

(assert (=> d!63287 (= lt!280082 (choose!30 thiss!1204 (_2!8515 lt!279746) (_2!8515 lt!279736)))))

(assert (=> d!63287 (isPrefixOf!0 thiss!1204 (_2!8515 lt!279746))))

(assert (=> d!63287 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8515 lt!279746) (_2!8515 lt!279736)) lt!280082)))

(declare-fun bs!15762 () Bool)

(assert (= bs!15762 d!63287))

(assert (=> bs!15762 m!283479))

(declare-fun m!283779 () Bool)

(assert (=> bs!15762 m!283779))

(assert (=> bs!15762 m!283465))

(assert (=> b!182226 d!63287))

(declare-fun call!2957 () Bool)

(declare-fun lt!280300 () tuple2!15740)

(declare-fun bm!2954 () Bool)

(declare-fun c!9376 () Bool)

(assert (=> bm!2954 (= call!2957 (isPrefixOf!0 (_2!8515 lt!279746) (ite c!9376 (_2!8515 lt!279746) (_2!8515 lt!280300))))))

(declare-fun b!182516 () Bool)

(declare-fun e!126663 () tuple2!15740)

(assert (=> b!182516 (= e!126663 (tuple2!15741 (_1!8515 lt!280300) (_2!8515 lt!280300)))))

(declare-fun lt!280271 () Bool)

(assert (=> b!182516 (= lt!280271 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!280297 () tuple2!15740)

(assert (=> b!182516 (= lt!280297 (appendBit!0 (_2!8515 lt!279746) lt!280271))))

(declare-fun res!151697 () Bool)

(assert (=> b!182516 (= res!151697 (= (size!4291 (buf!4740 (_2!8515 lt!279746))) (size!4291 (buf!4740 (_2!8515 lt!280297)))))))

(declare-fun e!126662 () Bool)

(assert (=> b!182516 (=> (not res!151697) (not e!126662))))

(assert (=> b!182516 e!126662))

(declare-fun lt!280264 () tuple2!15740)

(assert (=> b!182516 (= lt!280264 lt!280297)))

(assert (=> b!182516 (= lt!280300 (appendBitsLSBFirstLoopTR!0 (_2!8515 lt!280264) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!280257 () Unit!13079)

(assert (=> b!182516 (= lt!280257 (lemmaIsPrefixTransitive!0 (_2!8515 lt!279746) (_2!8515 lt!280264) (_2!8515 lt!280300)))))

(assert (=> b!182516 call!2957))

(declare-fun lt!280266 () Unit!13079)

(assert (=> b!182516 (= lt!280266 lt!280257)))

(assert (=> b!182516 (invariant!0 (currentBit!8957 (_2!8515 lt!279746)) (currentByte!8962 (_2!8515 lt!279746)) (size!4291 (buf!4740 (_2!8515 lt!280264))))))

(declare-fun lt!280270 () BitStream!7690)

(assert (=> b!182516 (= lt!280270 (BitStream!7691 (buf!4740 (_2!8515 lt!280264)) (currentByte!8962 (_2!8515 lt!279746)) (currentBit!8957 (_2!8515 lt!279746))))))

(assert (=> b!182516 (invariant!0 (currentBit!8957 lt!280270) (currentByte!8962 lt!280270) (size!4291 (buf!4740 (_2!8515 lt!280300))))))

(declare-fun lt!280258 () BitStream!7690)

(assert (=> b!182516 (= lt!280258 (BitStream!7691 (buf!4740 (_2!8515 lt!280300)) (currentByte!8962 lt!280270) (currentBit!8957 lt!280270)))))

(declare-fun lt!280277 () tuple2!15742)

(assert (=> b!182516 (= lt!280277 (readBitPure!0 lt!280270))))

(declare-fun lt!280299 () tuple2!15742)

(assert (=> b!182516 (= lt!280299 (readBitPure!0 lt!280258))))

(declare-fun lt!280298 () Unit!13079)

(assert (=> b!182516 (= lt!280298 (readBitPrefixLemma!0 lt!280270 (_2!8515 lt!280300)))))

(declare-fun res!151705 () Bool)

(assert (=> b!182516 (= res!151705 (= (bitIndex!0 (size!4291 (buf!4740 (_1!8516 lt!280277))) (currentByte!8962 (_1!8516 lt!280277)) (currentBit!8957 (_1!8516 lt!280277))) (bitIndex!0 (size!4291 (buf!4740 (_1!8516 lt!280299))) (currentByte!8962 (_1!8516 lt!280299)) (currentBit!8957 (_1!8516 lt!280299)))))))

(declare-fun e!126665 () Bool)

(assert (=> b!182516 (=> (not res!151705) (not e!126665))))

(assert (=> b!182516 e!126665))

(declare-fun lt!280253 () Unit!13079)

(assert (=> b!182516 (= lt!280253 lt!280298)))

(declare-fun lt!280288 () tuple2!15746)

(assert (=> b!182516 (= lt!280288 (reader!0 (_2!8515 lt!279746) (_2!8515 lt!280300)))))

(declare-fun lt!280267 () tuple2!15746)

(assert (=> b!182516 (= lt!280267 (reader!0 (_2!8515 lt!280264) (_2!8515 lt!280300)))))

(declare-fun lt!280284 () tuple2!15742)

(assert (=> b!182516 (= lt!280284 (readBitPure!0 (_1!8518 lt!280288)))))

(assert (=> b!182516 (= (_2!8516 lt!280284) lt!280271)))

(declare-fun lt!280282 () Unit!13079)

(declare-fun Unit!13086 () Unit!13079)

(assert (=> b!182516 (= lt!280282 Unit!13086)))

(declare-fun lt!280279 () (_ BitVec 64))

(assert (=> b!182516 (= lt!280279 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!280294 () (_ BitVec 64))

(assert (=> b!182516 (= lt!280294 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!280263 () Unit!13079)

(assert (=> b!182516 (= lt!280263 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8515 lt!279746) (buf!4740 (_2!8515 lt!280300)) lt!280294))))

(assert (=> b!182516 (validate_offset_bits!1 ((_ sign_extend 32) (size!4291 (buf!4740 (_2!8515 lt!280300)))) ((_ sign_extend 32) (currentByte!8962 (_2!8515 lt!279746))) ((_ sign_extend 32) (currentBit!8957 (_2!8515 lt!279746))) lt!280294)))

(declare-fun lt!280256 () Unit!13079)

(assert (=> b!182516 (= lt!280256 lt!280263)))

(declare-fun lt!280285 () tuple2!15744)

(assert (=> b!182516 (= lt!280285 (readNBitsLSBFirstsLoopPure!0 (_1!8518 lt!280288) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!280279))))

(declare-fun lt!280255 () (_ BitVec 64))

(assert (=> b!182516 (= lt!280255 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!280280 () Unit!13079)

(assert (=> b!182516 (= lt!280280 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8515 lt!280264) (buf!4740 (_2!8515 lt!280300)) lt!280255))))

(assert (=> b!182516 (validate_offset_bits!1 ((_ sign_extend 32) (size!4291 (buf!4740 (_2!8515 lt!280300)))) ((_ sign_extend 32) (currentByte!8962 (_2!8515 lt!280264))) ((_ sign_extend 32) (currentBit!8957 (_2!8515 lt!280264))) lt!280255)))

(declare-fun lt!280276 () Unit!13079)

(assert (=> b!182516 (= lt!280276 lt!280280)))

(declare-fun lt!280281 () tuple2!15744)

(assert (=> b!182516 (= lt!280281 (readNBitsLSBFirstsLoopPure!0 (_1!8518 lt!280267) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!280279 (ite (_2!8516 lt!280284) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!280248 () tuple2!15744)

(assert (=> b!182516 (= lt!280248 (readNBitsLSBFirstsLoopPure!0 (_1!8518 lt!280288) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!280279))))

(declare-fun c!9375 () Bool)

(assert (=> b!182516 (= c!9375 (_2!8516 (readBitPure!0 (_1!8518 lt!280288))))))

(declare-fun e!126664 () (_ BitVec 64))

(declare-fun lt!280292 () tuple2!15744)

(declare-fun withMovedBitIndex!0 (BitStream!7690 (_ BitVec 64)) BitStream!7690)

(assert (=> b!182516 (= lt!280292 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8518 lt!280288) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!280279 e!126664)))))

(declare-fun lt!280272 () Unit!13079)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7690 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13079)

(assert (=> b!182516 (= lt!280272 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8518 lt!280288) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!280279))))

(assert (=> b!182516 (and (= (_2!8517 lt!280248) (_2!8517 lt!280292)) (= (_1!8517 lt!280248) (_1!8517 lt!280292)))))

(declare-fun lt!280289 () Unit!13079)

(assert (=> b!182516 (= lt!280289 lt!280272)))

(assert (=> b!182516 (= (_1!8518 lt!280288) (withMovedBitIndex!0 (_2!8518 lt!280288) (bvsub (bitIndex!0 (size!4291 (buf!4740 (_2!8515 lt!279746))) (currentByte!8962 (_2!8515 lt!279746)) (currentBit!8957 (_2!8515 lt!279746))) (bitIndex!0 (size!4291 (buf!4740 (_2!8515 lt!280300))) (currentByte!8962 (_2!8515 lt!280300)) (currentBit!8957 (_2!8515 lt!280300))))))))

(declare-fun lt!280260 () Unit!13079)

(declare-fun Unit!13087 () Unit!13079)

(assert (=> b!182516 (= lt!280260 Unit!13087)))

(assert (=> b!182516 (= (_1!8518 lt!280267) (withMovedBitIndex!0 (_2!8518 lt!280267) (bvsub (bitIndex!0 (size!4291 (buf!4740 (_2!8515 lt!280264))) (currentByte!8962 (_2!8515 lt!280264)) (currentBit!8957 (_2!8515 lt!280264))) (bitIndex!0 (size!4291 (buf!4740 (_2!8515 lt!280300))) (currentByte!8962 (_2!8515 lt!280300)) (currentBit!8957 (_2!8515 lt!280300))))))))

(declare-fun lt!280268 () Unit!13079)

(declare-fun Unit!13088 () Unit!13079)

(assert (=> b!182516 (= lt!280268 Unit!13088)))

(assert (=> b!182516 (= (bitIndex!0 (size!4291 (buf!4740 (_2!8515 lt!279746))) (currentByte!8962 (_2!8515 lt!279746)) (currentBit!8957 (_2!8515 lt!279746))) (bvsub (bitIndex!0 (size!4291 (buf!4740 (_2!8515 lt!280264))) (currentByte!8962 (_2!8515 lt!280264)) (currentBit!8957 (_2!8515 lt!280264))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!280252 () Unit!13079)

(declare-fun Unit!13089 () Unit!13079)

(assert (=> b!182516 (= lt!280252 Unit!13089)))

(assert (=> b!182516 (= (_2!8517 lt!280285) (_2!8517 lt!280281))))

(declare-fun lt!280246 () Unit!13079)

(declare-fun Unit!13090 () Unit!13079)

(assert (=> b!182516 (= lt!280246 Unit!13090)))

(assert (=> b!182516 (invariant!0 (currentBit!8957 (_2!8515 lt!280300)) (currentByte!8962 (_2!8515 lt!280300)) (size!4291 (buf!4740 (_2!8515 lt!280300))))))

(declare-fun lt!280249 () Unit!13079)

(declare-fun Unit!13091 () Unit!13079)

(assert (=> b!182516 (= lt!280249 Unit!13091)))

(assert (=> b!182516 (= (size!4291 (buf!4740 (_2!8515 lt!279746))) (size!4291 (buf!4740 (_2!8515 lt!280300))))))

(declare-fun lt!280283 () Unit!13079)

(declare-fun Unit!13092 () Unit!13079)

(assert (=> b!182516 (= lt!280283 Unit!13092)))

(assert (=> b!182516 (= (bitIndex!0 (size!4291 (buf!4740 (_2!8515 lt!280300))) (currentByte!8962 (_2!8515 lt!280300)) (currentBit!8957 (_2!8515 lt!280300))) (bvsub (bvadd (bitIndex!0 (size!4291 (buf!4740 (_2!8515 lt!279746))) (currentByte!8962 (_2!8515 lt!279746)) (currentBit!8957 (_2!8515 lt!279746))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!280278 () Unit!13079)

(declare-fun Unit!13093 () Unit!13079)

(assert (=> b!182516 (= lt!280278 Unit!13093)))

(declare-fun lt!280301 () Unit!13079)

(declare-fun Unit!13094 () Unit!13079)

(assert (=> b!182516 (= lt!280301 Unit!13094)))

(declare-fun lt!280247 () tuple2!15746)

(assert (=> b!182516 (= lt!280247 (reader!0 (_2!8515 lt!279746) (_2!8515 lt!280300)))))

(declare-fun lt!280265 () (_ BitVec 64))

(assert (=> b!182516 (= lt!280265 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!280293 () Unit!13079)

(assert (=> b!182516 (= lt!280293 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8515 lt!279746) (buf!4740 (_2!8515 lt!280300)) lt!280265))))

(assert (=> b!182516 (validate_offset_bits!1 ((_ sign_extend 32) (size!4291 (buf!4740 (_2!8515 lt!280300)))) ((_ sign_extend 32) (currentByte!8962 (_2!8515 lt!279746))) ((_ sign_extend 32) (currentBit!8957 (_2!8515 lt!279746))) lt!280265)))

(declare-fun lt!280261 () Unit!13079)

(assert (=> b!182516 (= lt!280261 lt!280293)))

(declare-fun lt!280250 () tuple2!15744)

(assert (=> b!182516 (= lt!280250 (readNBitsLSBFirstsLoopPure!0 (_1!8518 lt!280247) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!151706 () Bool)

(assert (=> b!182516 (= res!151706 (= (_2!8517 lt!280250) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun e!126669 () Bool)

(assert (=> b!182516 (=> (not res!151706) (not e!126669))))

(assert (=> b!182516 e!126669))

(declare-fun lt!280287 () Unit!13079)

(declare-fun Unit!13095 () Unit!13079)

(assert (=> b!182516 (= lt!280287 Unit!13095)))

(declare-fun b!182517 () Bool)

(declare-fun res!151702 () Bool)

(assert (=> b!182517 (= res!151702 (= (bitIndex!0 (size!4291 (buf!4740 (_2!8515 lt!280297))) (currentByte!8962 (_2!8515 lt!280297)) (currentBit!8957 (_2!8515 lt!280297))) (bvadd (bitIndex!0 (size!4291 (buf!4740 (_2!8515 lt!279746))) (currentByte!8962 (_2!8515 lt!279746)) (currentBit!8957 (_2!8515 lt!279746))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!182517 (=> (not res!151702) (not e!126662))))

(declare-fun b!182518 () Bool)

(declare-fun e!126668 () Bool)

(declare-fun lt!280290 () tuple2!15744)

(declare-fun lt!280254 () tuple2!15746)

(assert (=> b!182518 (= e!126668 (= (_1!8517 lt!280290) (_2!8518 lt!280254)))))

(declare-fun b!182519 () Bool)

(declare-fun lt!280262 () tuple2!15742)

(assert (=> b!182519 (= lt!280262 (readBitPure!0 (readerFrom!0 (_2!8515 lt!280297) (currentBit!8957 (_2!8515 lt!279746)) (currentByte!8962 (_2!8515 lt!279746)))))))

(declare-fun res!151695 () Bool)

(assert (=> b!182519 (= res!151695 (and (= (_2!8516 lt!280262) lt!280271) (= (_1!8516 lt!280262) (_2!8515 lt!280297))))))

(declare-fun e!126661 () Bool)

(assert (=> b!182519 (=> (not res!151695) (not e!126661))))

(assert (=> b!182519 (= e!126662 e!126661)))

(declare-fun b!182520 () Bool)

(assert (=> b!182520 (= e!126665 (= (_2!8516 lt!280277) (_2!8516 lt!280299)))))

(declare-fun b!182521 () Bool)

(assert (=> b!182521 (= e!126661 (= (bitIndex!0 (size!4291 (buf!4740 (_1!8516 lt!280262))) (currentByte!8962 (_1!8516 lt!280262)) (currentBit!8957 (_1!8516 lt!280262))) (bitIndex!0 (size!4291 (buf!4740 (_2!8515 lt!280297))) (currentByte!8962 (_2!8515 lt!280297)) (currentBit!8957 (_2!8515 lt!280297)))))))

(declare-fun b!182522 () Bool)

(declare-fun e!126667 () Bool)

(declare-fun lt!280274 () (_ BitVec 64))

(assert (=> b!182522 (= e!126667 (validate_offset_bits!1 ((_ sign_extend 32) (size!4291 (buf!4740 (_2!8515 lt!279746)))) ((_ sign_extend 32) (currentByte!8962 (_2!8515 lt!279746))) ((_ sign_extend 32) (currentBit!8957 (_2!8515 lt!279746))) lt!280274))))

(declare-fun b!182523 () Bool)

(assert (=> b!182523 (= e!126664 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!182524 () Bool)

(declare-fun res!151700 () Bool)

(declare-fun e!126666 () Bool)

(assert (=> b!182524 (=> (not res!151700) (not e!126666))))

(declare-fun lt!280273 () tuple2!15740)

(assert (=> b!182524 (= res!151700 (isPrefixOf!0 (_2!8515 lt!279746) (_2!8515 lt!280273)))))

(declare-fun d!63289 () Bool)

(assert (=> d!63289 e!126666))

(declare-fun res!151703 () Bool)

(assert (=> d!63289 (=> (not res!151703) (not e!126666))))

(assert (=> d!63289 (= res!151703 (invariant!0 (currentBit!8957 (_2!8515 lt!280273)) (currentByte!8962 (_2!8515 lt!280273)) (size!4291 (buf!4740 (_2!8515 lt!280273)))))))

(assert (=> d!63289 (= lt!280273 e!126663)))

(assert (=> d!63289 (= c!9376 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!63289 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!63289 (= (appendBitsLSBFirstLoopTR!0 (_2!8515 lt!279746) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!280273)))

(declare-fun b!182525 () Bool)

(assert (=> b!182525 (= e!126666 e!126668)))

(declare-fun res!151701 () Bool)

(assert (=> b!182525 (=> (not res!151701) (not e!126668))))

(assert (=> b!182525 (= res!151701 (= (_2!8517 lt!280290) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!182525 (= lt!280290 (readNBitsLSBFirstsLoopPure!0 (_1!8518 lt!280254) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!280286 () Unit!13079)

(declare-fun lt!280295 () Unit!13079)

(assert (=> b!182525 (= lt!280286 lt!280295)))

(assert (=> b!182525 (validate_offset_bits!1 ((_ sign_extend 32) (size!4291 (buf!4740 (_2!8515 lt!280273)))) ((_ sign_extend 32) (currentByte!8962 (_2!8515 lt!279746))) ((_ sign_extend 32) (currentBit!8957 (_2!8515 lt!279746))) lt!280274)))

(assert (=> b!182525 (= lt!280295 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8515 lt!279746) (buf!4740 (_2!8515 lt!280273)) lt!280274))))

(assert (=> b!182525 e!126667))

(declare-fun res!151699 () Bool)

(assert (=> b!182525 (=> (not res!151699) (not e!126667))))

(assert (=> b!182525 (= res!151699 (and (= (size!4291 (buf!4740 (_2!8515 lt!279746))) (size!4291 (buf!4740 (_2!8515 lt!280273)))) (bvsge lt!280274 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!182525 (= lt!280274 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!182525 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!182525 (= lt!280254 (reader!0 (_2!8515 lt!279746) (_2!8515 lt!280273)))))

(declare-fun b!182526 () Bool)

(declare-fun Unit!13097 () Unit!13079)

(assert (=> b!182526 (= e!126663 (tuple2!15741 Unit!13097 (_2!8515 lt!279746)))))

(declare-fun lt!280251 () Unit!13079)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7690) Unit!13079)

(assert (=> b!182526 (= lt!280251 (lemmaIsPrefixRefl!0 (_2!8515 lt!279746)))))

(assert (=> b!182526 call!2957))

(declare-fun lt!280259 () Unit!13079)

(assert (=> b!182526 (= lt!280259 lt!280251)))

(declare-fun b!182527 () Bool)

(assert (=> b!182527 (= e!126664 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!182528 () Bool)

(declare-fun res!151696 () Bool)

(assert (=> b!182528 (=> (not res!151696) (not e!126666))))

(assert (=> b!182528 (= res!151696 (= (size!4291 (buf!4740 (_2!8515 lt!279746))) (size!4291 (buf!4740 (_2!8515 lt!280273)))))))

(declare-fun b!182529 () Bool)

(declare-fun res!151704 () Bool)

(assert (=> b!182529 (= res!151704 (isPrefixOf!0 (_2!8515 lt!279746) (_2!8515 lt!280297)))))

(assert (=> b!182529 (=> (not res!151704) (not e!126662))))

(declare-fun b!182530 () Bool)

(assert (=> b!182530 (= e!126669 (= (_1!8517 lt!280250) (_2!8518 lt!280247)))))

(declare-fun b!182531 () Bool)

(declare-fun res!151698 () Bool)

(assert (=> b!182531 (=> (not res!151698) (not e!126666))))

(declare-fun lt!280291 () (_ BitVec 64))

(declare-fun lt!280296 () (_ BitVec 64))

(assert (=> b!182531 (= res!151698 (= (bitIndex!0 (size!4291 (buf!4740 (_2!8515 lt!280273))) (currentByte!8962 (_2!8515 lt!280273)) (currentBit!8957 (_2!8515 lt!280273))) (bvsub lt!280296 lt!280291)))))

(assert (=> b!182531 (or (= (bvand lt!280296 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!280291 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!280296 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!280296 lt!280291) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!182531 (= lt!280291 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!280269 () (_ BitVec 64))

(declare-fun lt!280275 () (_ BitVec 64))

(assert (=> b!182531 (= lt!280296 (bvadd lt!280269 lt!280275))))

(assert (=> b!182531 (or (not (= (bvand lt!280269 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!280275 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!280269 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!280269 lt!280275) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!182531 (= lt!280275 ((_ sign_extend 32) nBits!348))))

(assert (=> b!182531 (= lt!280269 (bitIndex!0 (size!4291 (buf!4740 (_2!8515 lt!279746))) (currentByte!8962 (_2!8515 lt!279746)) (currentBit!8957 (_2!8515 lt!279746))))))

(assert (= (and d!63289 c!9376) b!182526))

(assert (= (and d!63289 (not c!9376)) b!182516))

(assert (= (and b!182516 res!151697) b!182517))

(assert (= (and b!182517 res!151702) b!182529))

(assert (= (and b!182529 res!151704) b!182519))

(assert (= (and b!182519 res!151695) b!182521))

(assert (= (and b!182516 res!151705) b!182520))

(assert (= (and b!182516 c!9375) b!182523))

(assert (= (and b!182516 (not c!9375)) b!182527))

(assert (= (and b!182516 res!151706) b!182530))

(assert (= (or b!182526 b!182516) bm!2954))

(assert (= (and d!63289 res!151703) b!182528))

(assert (= (and b!182528 res!151696) b!182531))

(assert (= (and b!182531 res!151698) b!182524))

(assert (= (and b!182524 res!151700) b!182525))

(assert (= (and b!182525 res!151699) b!182522))

(assert (= (and b!182525 res!151701) b!182518))

(declare-fun m!283815 () Bool)

(assert (=> b!182524 m!283815))

(declare-fun m!283817 () Bool)

(assert (=> b!182529 m!283817))

(declare-fun m!283819 () Bool)

(assert (=> d!63289 m!283819))

(declare-fun m!283821 () Bool)

(assert (=> b!182525 m!283821))

(declare-fun m!283823 () Bool)

(assert (=> b!182525 m!283823))

(declare-fun m!283825 () Bool)

(assert (=> b!182525 m!283825))

(declare-fun m!283827 () Bool)

(assert (=> b!182525 m!283827))

(declare-fun m!283829 () Bool)

(assert (=> b!182525 m!283829))

(declare-fun m!283831 () Bool)

(assert (=> b!182525 m!283831))

(declare-fun m!283833 () Bool)

(assert (=> b!182521 m!283833))

(declare-fun m!283835 () Bool)

(assert (=> b!182521 m!283835))

(declare-fun m!283837 () Bool)

(assert (=> b!182516 m!283837))

(declare-fun m!283839 () Bool)

(assert (=> b!182516 m!283839))

(declare-fun m!283841 () Bool)

(assert (=> b!182516 m!283841))

(declare-fun m!283843 () Bool)

(assert (=> b!182516 m!283843))

(declare-fun m!283845 () Bool)

(assert (=> b!182516 m!283845))

(declare-fun m!283847 () Bool)

(assert (=> b!182516 m!283847))

(declare-fun m!283849 () Bool)

(assert (=> b!182516 m!283849))

(declare-fun m!283851 () Bool)

(assert (=> b!182516 m!283851))

(assert (=> b!182516 m!283825))

(declare-fun m!283853 () Bool)

(assert (=> b!182516 m!283853))

(declare-fun m!283855 () Bool)

(assert (=> b!182516 m!283855))

(assert (=> b!182516 m!283473))

(declare-fun m!283857 () Bool)

(assert (=> b!182516 m!283857))

(declare-fun m!283859 () Bool)

(assert (=> b!182516 m!283859))

(declare-fun m!283861 () Bool)

(assert (=> b!182516 m!283861))

(declare-fun m!283863 () Bool)

(assert (=> b!182516 m!283863))

(declare-fun m!283865 () Bool)

(assert (=> b!182516 m!283865))

(declare-fun m!283867 () Bool)

(assert (=> b!182516 m!283867))

(declare-fun m!283869 () Bool)

(assert (=> b!182516 m!283869))

(declare-fun m!283871 () Bool)

(assert (=> b!182516 m!283871))

(declare-fun m!283873 () Bool)

(assert (=> b!182516 m!283873))

(declare-fun m!283875 () Bool)

(assert (=> b!182516 m!283875))

(declare-fun m!283877 () Bool)

(assert (=> b!182516 m!283877))

(declare-fun m!283879 () Bool)

(assert (=> b!182516 m!283879))

(declare-fun m!283881 () Bool)

(assert (=> b!182516 m!283881))

(declare-fun m!283883 () Bool)

(assert (=> b!182516 m!283883))

(assert (=> b!182516 m!283863))

(declare-fun m!283885 () Bool)

(assert (=> b!182516 m!283885))

(declare-fun m!283887 () Bool)

(assert (=> b!182516 m!283887))

(declare-fun m!283889 () Bool)

(assert (=> b!182516 m!283889))

(assert (=> b!182516 m!283831))

(declare-fun m!283891 () Bool)

(assert (=> b!182516 m!283891))

(declare-fun m!283893 () Bool)

(assert (=> b!182516 m!283893))

(declare-fun m!283895 () Bool)

(assert (=> b!182516 m!283895))

(declare-fun m!283897 () Bool)

(assert (=> b!182519 m!283897))

(assert (=> b!182519 m!283897))

(declare-fun m!283899 () Bool)

(assert (=> b!182519 m!283899))

(declare-fun m!283901 () Bool)

(assert (=> bm!2954 m!283901))

(assert (=> b!182517 m!283835))

(assert (=> b!182517 m!283473))

(declare-fun m!283903 () Bool)

(assert (=> b!182531 m!283903))

(assert (=> b!182531 m!283473))

(declare-fun m!283905 () Bool)

(assert (=> b!182526 m!283905))

(declare-fun m!283907 () Bool)

(assert (=> b!182522 m!283907))

(assert (=> b!182226 d!63289))

(declare-fun d!63319 () Bool)

(declare-fun res!151707 () Bool)

(declare-fun e!126670 () Bool)

(assert (=> d!63319 (=> (not res!151707) (not e!126670))))

(assert (=> d!63319 (= res!151707 (= (size!4291 (buf!4740 (_2!8515 lt!279746))) (size!4291 (buf!4740 (_2!8515 lt!279736)))))))

(assert (=> d!63319 (= (isPrefixOf!0 (_2!8515 lt!279746) (_2!8515 lt!279736)) e!126670)))

(declare-fun b!182532 () Bool)

(declare-fun res!151708 () Bool)

(assert (=> b!182532 (=> (not res!151708) (not e!126670))))

(assert (=> b!182532 (= res!151708 (bvsle (bitIndex!0 (size!4291 (buf!4740 (_2!8515 lt!279746))) (currentByte!8962 (_2!8515 lt!279746)) (currentBit!8957 (_2!8515 lt!279746))) (bitIndex!0 (size!4291 (buf!4740 (_2!8515 lt!279736))) (currentByte!8962 (_2!8515 lt!279736)) (currentBit!8957 (_2!8515 lt!279736)))))))

(declare-fun b!182533 () Bool)

(declare-fun e!126671 () Bool)

(assert (=> b!182533 (= e!126670 e!126671)))

(declare-fun res!151709 () Bool)

(assert (=> b!182533 (=> res!151709 e!126671)))

(assert (=> b!182533 (= res!151709 (= (size!4291 (buf!4740 (_2!8515 lt!279746))) #b00000000000000000000000000000000))))

(declare-fun b!182534 () Bool)

(assert (=> b!182534 (= e!126671 (arrayBitRangesEq!0 (buf!4740 (_2!8515 lt!279746)) (buf!4740 (_2!8515 lt!279736)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4291 (buf!4740 (_2!8515 lt!279746))) (currentByte!8962 (_2!8515 lt!279746)) (currentBit!8957 (_2!8515 lt!279746)))))))

(assert (= (and d!63319 res!151707) b!182532))

(assert (= (and b!182532 res!151708) b!182533))

(assert (= (and b!182533 (not res!151709)) b!182534))

(assert (=> b!182532 m!283473))

(assert (=> b!182532 m!283477))

(assert (=> b!182534 m!283473))

(assert (=> b!182534 m!283473))

(declare-fun m!283909 () Bool)

(assert (=> b!182534 m!283909))

(assert (=> b!182237 d!63319))

(declare-fun d!63321 () Bool)

(declare-fun e!126672 () Bool)

(assert (=> d!63321 e!126672))

(declare-fun res!151711 () Bool)

(assert (=> d!63321 (=> (not res!151711) (not e!126672))))

(declare-fun lt!280306 () (_ BitVec 64))

(declare-fun lt!280302 () (_ BitVec 64))

(declare-fun lt!280305 () (_ BitVec 64))

(assert (=> d!63321 (= res!151711 (= lt!280306 (bvsub lt!280305 lt!280302)))))

(assert (=> d!63321 (or (= (bvand lt!280305 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!280302 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!280305 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!280305 lt!280302) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63321 (= lt!280302 (remainingBits!0 ((_ sign_extend 32) (size!4291 (buf!4740 (_1!8516 lt!279745)))) ((_ sign_extend 32) (currentByte!8962 (_1!8516 lt!279745))) ((_ sign_extend 32) (currentBit!8957 (_1!8516 lt!279745)))))))

(declare-fun lt!280307 () (_ BitVec 64))

(declare-fun lt!280304 () (_ BitVec 64))

(assert (=> d!63321 (= lt!280305 (bvmul lt!280307 lt!280304))))

(assert (=> d!63321 (or (= lt!280307 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!280304 (bvsdiv (bvmul lt!280307 lt!280304) lt!280307)))))

(assert (=> d!63321 (= lt!280304 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!63321 (= lt!280307 ((_ sign_extend 32) (size!4291 (buf!4740 (_1!8516 lt!279745)))))))

(assert (=> d!63321 (= lt!280306 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8962 (_1!8516 lt!279745))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8957 (_1!8516 lt!279745)))))))

(assert (=> d!63321 (invariant!0 (currentBit!8957 (_1!8516 lt!279745)) (currentByte!8962 (_1!8516 lt!279745)) (size!4291 (buf!4740 (_1!8516 lt!279745))))))

(assert (=> d!63321 (= (bitIndex!0 (size!4291 (buf!4740 (_1!8516 lt!279745))) (currentByte!8962 (_1!8516 lt!279745)) (currentBit!8957 (_1!8516 lt!279745))) lt!280306)))

(declare-fun b!182535 () Bool)

(declare-fun res!151710 () Bool)

(assert (=> b!182535 (=> (not res!151710) (not e!126672))))

(assert (=> b!182535 (= res!151710 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!280306))))

(declare-fun b!182536 () Bool)

(declare-fun lt!280303 () (_ BitVec 64))

(assert (=> b!182536 (= e!126672 (bvsle lt!280306 (bvmul lt!280303 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!182536 (or (= lt!280303 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!280303 #b0000000000000000000000000000000000000000000000000000000000001000) lt!280303)))))

(assert (=> b!182536 (= lt!280303 ((_ sign_extend 32) (size!4291 (buf!4740 (_1!8516 lt!279745)))))))

(assert (= (and d!63321 res!151711) b!182535))

(assert (= (and b!182535 res!151710) b!182536))

(declare-fun m!283911 () Bool)

(assert (=> d!63321 m!283911))

(declare-fun m!283913 () Bool)

(assert (=> d!63321 m!283913))

(assert (=> b!182230 d!63321))

(declare-fun d!63323 () Bool)

(declare-datatypes ((tuple2!15768 0))(
  ( (tuple2!15769 (_1!8529 Bool) (_2!8529 BitStream!7690)) )
))
(declare-fun lt!280310 () tuple2!15768)

(declare-fun readBit!0 (BitStream!7690) tuple2!15768)

(assert (=> d!63323 (= lt!280310 (readBit!0 lt!279729))))

(assert (=> d!63323 (= (readBitPure!0 lt!279729) (tuple2!15743 (_2!8529 lt!280310) (_1!8529 lt!280310)))))

(declare-fun bs!15766 () Bool)

(assert (= bs!15766 d!63323))

(declare-fun m!283915 () Bool)

(assert (=> bs!15766 m!283915))

(assert (=> b!182230 d!63323))

(declare-fun d!63325 () Bool)

(assert (=> d!63325 (validate_offset_bits!1 ((_ sign_extend 32) (size!4291 (buf!4740 (_2!8515 lt!279736)))) ((_ sign_extend 32) (currentByte!8962 (_2!8515 lt!279746))) ((_ sign_extend 32) (currentBit!8957 (_2!8515 lt!279746))) lt!279747)))

(declare-fun lt!280313 () Unit!13079)

(declare-fun choose!9 (BitStream!7690 array!9728 (_ BitVec 64) BitStream!7690) Unit!13079)

(assert (=> d!63325 (= lt!280313 (choose!9 (_2!8515 lt!279746) (buf!4740 (_2!8515 lt!279736)) lt!279747 (BitStream!7691 (buf!4740 (_2!8515 lt!279736)) (currentByte!8962 (_2!8515 lt!279746)) (currentBit!8957 (_2!8515 lt!279746)))))))

(assert (=> d!63325 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8515 lt!279746) (buf!4740 (_2!8515 lt!279736)) lt!279747) lt!280313)))

(declare-fun bs!15767 () Bool)

(assert (= bs!15767 d!63325))

(assert (=> bs!15767 m!283457))

(declare-fun m!283917 () Bool)

(assert (=> bs!15767 m!283917))

(assert (=> b!182230 d!63325))

(declare-fun d!63327 () Bool)

(assert (=> d!63327 (validate_offset_bits!1 ((_ sign_extend 32) (size!4291 (buf!4740 (_2!8515 lt!279736)))) ((_ sign_extend 32) (currentByte!8962 thiss!1204)) ((_ sign_extend 32) (currentBit!8957 thiss!1204)) lt!279734)))

(declare-fun lt!280314 () Unit!13079)

(assert (=> d!63327 (= lt!280314 (choose!9 thiss!1204 (buf!4740 (_2!8515 lt!279736)) lt!279734 (BitStream!7691 (buf!4740 (_2!8515 lt!279736)) (currentByte!8962 thiss!1204) (currentBit!8957 thiss!1204))))))

(assert (=> d!63327 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4740 (_2!8515 lt!279736)) lt!279734) lt!280314)))

(declare-fun bs!15768 () Bool)

(assert (= bs!15768 d!63327))

(assert (=> bs!15768 m!283433))

(declare-fun m!283919 () Bool)

(assert (=> bs!15768 m!283919))

(assert (=> b!182230 d!63327))

(declare-fun d!63329 () Bool)

(declare-fun e!126685 () Bool)

(assert (=> d!63329 e!126685))

(declare-fun res!151730 () Bool)

(assert (=> d!63329 (=> (not res!151730) (not e!126685))))

(declare-fun lt!280403 () tuple2!15746)

(assert (=> d!63329 (= res!151730 (isPrefixOf!0 (_1!8518 lt!280403) (_2!8518 lt!280403)))))

(declare-fun lt!280409 () BitStream!7690)

(assert (=> d!63329 (= lt!280403 (tuple2!15747 lt!280409 (_2!8515 lt!279736)))))

(declare-fun lt!280401 () Unit!13079)

(declare-fun lt!280402 () Unit!13079)

(assert (=> d!63329 (= lt!280401 lt!280402)))

(assert (=> d!63329 (isPrefixOf!0 lt!280409 (_2!8515 lt!279736))))

(assert (=> d!63329 (= lt!280402 (lemmaIsPrefixTransitive!0 lt!280409 (_2!8515 lt!279736) (_2!8515 lt!279736)))))

(declare-fun lt!280408 () Unit!13079)

(declare-fun lt!280407 () Unit!13079)

(assert (=> d!63329 (= lt!280408 lt!280407)))

(assert (=> d!63329 (isPrefixOf!0 lt!280409 (_2!8515 lt!279736))))

(assert (=> d!63329 (= lt!280407 (lemmaIsPrefixTransitive!0 lt!280409 thiss!1204 (_2!8515 lt!279736)))))

(declare-fun lt!280413 () Unit!13079)

(declare-fun e!126686 () Unit!13079)

(assert (=> d!63329 (= lt!280413 e!126686)))

(declare-fun c!9381 () Bool)

(assert (=> d!63329 (= c!9381 (not (= (size!4291 (buf!4740 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!280398 () Unit!13079)

(declare-fun lt!280411 () Unit!13079)

(assert (=> d!63329 (= lt!280398 lt!280411)))

(assert (=> d!63329 (isPrefixOf!0 (_2!8515 lt!279736) (_2!8515 lt!279736))))

(assert (=> d!63329 (= lt!280411 (lemmaIsPrefixRefl!0 (_2!8515 lt!279736)))))

(declare-fun lt!280400 () Unit!13079)

(declare-fun lt!280410 () Unit!13079)

(assert (=> d!63329 (= lt!280400 lt!280410)))

(assert (=> d!63329 (= lt!280410 (lemmaIsPrefixRefl!0 (_2!8515 lt!279736)))))

(declare-fun lt!280404 () Unit!13079)

(declare-fun lt!280405 () Unit!13079)

(assert (=> d!63329 (= lt!280404 lt!280405)))

(assert (=> d!63329 (isPrefixOf!0 lt!280409 lt!280409)))

(assert (=> d!63329 (= lt!280405 (lemmaIsPrefixRefl!0 lt!280409))))

(declare-fun lt!280415 () Unit!13079)

(declare-fun lt!280397 () Unit!13079)

(assert (=> d!63329 (= lt!280415 lt!280397)))

(assert (=> d!63329 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!63329 (= lt!280397 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!63329 (= lt!280409 (BitStream!7691 (buf!4740 (_2!8515 lt!279736)) (currentByte!8962 thiss!1204) (currentBit!8957 thiss!1204)))))

(assert (=> d!63329 (isPrefixOf!0 thiss!1204 (_2!8515 lt!279736))))

(assert (=> d!63329 (= (reader!0 thiss!1204 (_2!8515 lt!279736)) lt!280403)))

(declare-fun lt!280414 () (_ BitVec 64))

(declare-fun lt!280406 () (_ BitVec 64))

(declare-fun b!182561 () Bool)

(assert (=> b!182561 (= e!126685 (= (_1!8518 lt!280403) (withMovedBitIndex!0 (_2!8518 lt!280403) (bvsub lt!280414 lt!280406))))))

(assert (=> b!182561 (or (= (bvand lt!280414 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!280406 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!280414 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!280414 lt!280406) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!182561 (= lt!280406 (bitIndex!0 (size!4291 (buf!4740 (_2!8515 lt!279736))) (currentByte!8962 (_2!8515 lt!279736)) (currentBit!8957 (_2!8515 lt!279736))))))

(assert (=> b!182561 (= lt!280414 (bitIndex!0 (size!4291 (buf!4740 thiss!1204)) (currentByte!8962 thiss!1204) (currentBit!8957 thiss!1204)))))

(declare-fun b!182562 () Bool)

(declare-fun res!151729 () Bool)

(assert (=> b!182562 (=> (not res!151729) (not e!126685))))

(assert (=> b!182562 (= res!151729 (isPrefixOf!0 (_1!8518 lt!280403) thiss!1204))))

(declare-fun b!182563 () Bool)

(declare-fun Unit!13098 () Unit!13079)

(assert (=> b!182563 (= e!126686 Unit!13098)))

(declare-fun b!182564 () Bool)

(declare-fun res!151728 () Bool)

(assert (=> b!182564 (=> (not res!151728) (not e!126685))))

(assert (=> b!182564 (= res!151728 (isPrefixOf!0 (_2!8518 lt!280403) (_2!8515 lt!279736)))))

(declare-fun b!182565 () Bool)

(declare-fun lt!280416 () Unit!13079)

(assert (=> b!182565 (= e!126686 lt!280416)))

(declare-fun lt!280399 () (_ BitVec 64))

(assert (=> b!182565 (= lt!280399 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!280412 () (_ BitVec 64))

(assert (=> b!182565 (= lt!280412 (bitIndex!0 (size!4291 (buf!4740 thiss!1204)) (currentByte!8962 thiss!1204) (currentBit!8957 thiss!1204)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!9728 array!9728 (_ BitVec 64) (_ BitVec 64)) Unit!13079)

(assert (=> b!182565 (= lt!280416 (arrayBitRangesEqSymmetric!0 (buf!4740 thiss!1204) (buf!4740 (_2!8515 lt!279736)) lt!280399 lt!280412))))

(assert (=> b!182565 (arrayBitRangesEq!0 (buf!4740 (_2!8515 lt!279736)) (buf!4740 thiss!1204) lt!280399 lt!280412)))

(assert (= (and d!63329 c!9381) b!182565))

(assert (= (and d!63329 (not c!9381)) b!182563))

(assert (= (and d!63329 res!151730) b!182562))

(assert (= (and b!182562 res!151729) b!182564))

(assert (= (and b!182564 res!151728) b!182561))

(declare-fun m!283921 () Bool)

(assert (=> b!182564 m!283921))

(declare-fun m!283923 () Bool)

(assert (=> b!182561 m!283923))

(assert (=> b!182561 m!283477))

(assert (=> b!182561 m!283475))

(assert (=> b!182565 m!283475))

(declare-fun m!283925 () Bool)

(assert (=> b!182565 m!283925))

(declare-fun m!283927 () Bool)

(assert (=> b!182565 m!283927))

(declare-fun m!283929 () Bool)

(assert (=> d!63329 m!283929))

(declare-fun m!283931 () Bool)

(assert (=> d!63329 m!283931))

(declare-fun m!283933 () Bool)

(assert (=> d!63329 m!283933))

(declare-fun m!283935 () Bool)

(assert (=> d!63329 m!283935))

(declare-fun m!283937 () Bool)

(assert (=> d!63329 m!283937))

(declare-fun m!283939 () Bool)

(assert (=> d!63329 m!283939))

(declare-fun m!283941 () Bool)

(assert (=> d!63329 m!283941))

(declare-fun m!283943 () Bool)

(assert (=> d!63329 m!283943))

(assert (=> d!63329 m!283479))

(declare-fun m!283945 () Bool)

(assert (=> d!63329 m!283945))

(declare-fun m!283947 () Bool)

(assert (=> d!63329 m!283947))

(declare-fun m!283949 () Bool)

(assert (=> b!182562 m!283949))

(assert (=> b!182230 d!63329))

(declare-fun d!63331 () Bool)

(declare-fun e!126687 () Bool)

(assert (=> d!63331 e!126687))

(declare-fun res!151733 () Bool)

(assert (=> d!63331 (=> (not res!151733) (not e!126687))))

(declare-fun lt!280439 () tuple2!15746)

(assert (=> d!63331 (= res!151733 (isPrefixOf!0 (_1!8518 lt!280439) (_2!8518 lt!280439)))))

(declare-fun lt!280445 () BitStream!7690)

(assert (=> d!63331 (= lt!280439 (tuple2!15747 lt!280445 (_2!8515 lt!279736)))))

(declare-fun lt!280437 () Unit!13079)

(declare-fun lt!280438 () Unit!13079)

(assert (=> d!63331 (= lt!280437 lt!280438)))

(assert (=> d!63331 (isPrefixOf!0 lt!280445 (_2!8515 lt!279736))))

(assert (=> d!63331 (= lt!280438 (lemmaIsPrefixTransitive!0 lt!280445 (_2!8515 lt!279736) (_2!8515 lt!279736)))))

(declare-fun lt!280444 () Unit!13079)

(declare-fun lt!280443 () Unit!13079)

(assert (=> d!63331 (= lt!280444 lt!280443)))

(assert (=> d!63331 (isPrefixOf!0 lt!280445 (_2!8515 lt!279736))))

(assert (=> d!63331 (= lt!280443 (lemmaIsPrefixTransitive!0 lt!280445 (_2!8515 lt!279746) (_2!8515 lt!279736)))))

(declare-fun lt!280449 () Unit!13079)

(declare-fun e!126688 () Unit!13079)

(assert (=> d!63331 (= lt!280449 e!126688)))

(declare-fun c!9382 () Bool)

(assert (=> d!63331 (= c!9382 (not (= (size!4291 (buf!4740 (_2!8515 lt!279746))) #b00000000000000000000000000000000)))))

(declare-fun lt!280434 () Unit!13079)

(declare-fun lt!280447 () Unit!13079)

(assert (=> d!63331 (= lt!280434 lt!280447)))

(assert (=> d!63331 (isPrefixOf!0 (_2!8515 lt!279736) (_2!8515 lt!279736))))

(assert (=> d!63331 (= lt!280447 (lemmaIsPrefixRefl!0 (_2!8515 lt!279736)))))

(declare-fun lt!280436 () Unit!13079)

(declare-fun lt!280446 () Unit!13079)

(assert (=> d!63331 (= lt!280436 lt!280446)))

(assert (=> d!63331 (= lt!280446 (lemmaIsPrefixRefl!0 (_2!8515 lt!279736)))))

(declare-fun lt!280440 () Unit!13079)

(declare-fun lt!280441 () Unit!13079)

(assert (=> d!63331 (= lt!280440 lt!280441)))

(assert (=> d!63331 (isPrefixOf!0 lt!280445 lt!280445)))

(assert (=> d!63331 (= lt!280441 (lemmaIsPrefixRefl!0 lt!280445))))

(declare-fun lt!280451 () Unit!13079)

(declare-fun lt!280433 () Unit!13079)

(assert (=> d!63331 (= lt!280451 lt!280433)))

(assert (=> d!63331 (isPrefixOf!0 (_2!8515 lt!279746) (_2!8515 lt!279746))))

(assert (=> d!63331 (= lt!280433 (lemmaIsPrefixRefl!0 (_2!8515 lt!279746)))))

(assert (=> d!63331 (= lt!280445 (BitStream!7691 (buf!4740 (_2!8515 lt!279736)) (currentByte!8962 (_2!8515 lt!279746)) (currentBit!8957 (_2!8515 lt!279746))))))

(assert (=> d!63331 (isPrefixOf!0 (_2!8515 lt!279746) (_2!8515 lt!279736))))

(assert (=> d!63331 (= (reader!0 (_2!8515 lt!279746) (_2!8515 lt!279736)) lt!280439)))

(declare-fun lt!280450 () (_ BitVec 64))

(declare-fun b!182566 () Bool)

(declare-fun lt!280442 () (_ BitVec 64))

(assert (=> b!182566 (= e!126687 (= (_1!8518 lt!280439) (withMovedBitIndex!0 (_2!8518 lt!280439) (bvsub lt!280450 lt!280442))))))

(assert (=> b!182566 (or (= (bvand lt!280450 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!280442 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!280450 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!280450 lt!280442) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!182566 (= lt!280442 (bitIndex!0 (size!4291 (buf!4740 (_2!8515 lt!279736))) (currentByte!8962 (_2!8515 lt!279736)) (currentBit!8957 (_2!8515 lt!279736))))))

(assert (=> b!182566 (= lt!280450 (bitIndex!0 (size!4291 (buf!4740 (_2!8515 lt!279746))) (currentByte!8962 (_2!8515 lt!279746)) (currentBit!8957 (_2!8515 lt!279746))))))

(declare-fun b!182567 () Bool)

(declare-fun res!151732 () Bool)

(assert (=> b!182567 (=> (not res!151732) (not e!126687))))

(assert (=> b!182567 (= res!151732 (isPrefixOf!0 (_1!8518 lt!280439) (_2!8515 lt!279746)))))

(declare-fun b!182568 () Bool)

(declare-fun Unit!13099 () Unit!13079)

(assert (=> b!182568 (= e!126688 Unit!13099)))

(declare-fun b!182569 () Bool)

(declare-fun res!151731 () Bool)

(assert (=> b!182569 (=> (not res!151731) (not e!126687))))

(assert (=> b!182569 (= res!151731 (isPrefixOf!0 (_2!8518 lt!280439) (_2!8515 lt!279736)))))

(declare-fun b!182570 () Bool)

(declare-fun lt!280452 () Unit!13079)

(assert (=> b!182570 (= e!126688 lt!280452)))

(declare-fun lt!280435 () (_ BitVec 64))

(assert (=> b!182570 (= lt!280435 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!280448 () (_ BitVec 64))

(assert (=> b!182570 (= lt!280448 (bitIndex!0 (size!4291 (buf!4740 (_2!8515 lt!279746))) (currentByte!8962 (_2!8515 lt!279746)) (currentBit!8957 (_2!8515 lt!279746))))))

(assert (=> b!182570 (= lt!280452 (arrayBitRangesEqSymmetric!0 (buf!4740 (_2!8515 lt!279746)) (buf!4740 (_2!8515 lt!279736)) lt!280435 lt!280448))))

(assert (=> b!182570 (arrayBitRangesEq!0 (buf!4740 (_2!8515 lt!279736)) (buf!4740 (_2!8515 lt!279746)) lt!280435 lt!280448)))

(assert (= (and d!63331 c!9382) b!182570))

(assert (= (and d!63331 (not c!9382)) b!182568))

(assert (= (and d!63331 res!151733) b!182567))

(assert (= (and b!182567 res!151732) b!182569))

(assert (= (and b!182569 res!151731) b!182566))

(declare-fun m!283951 () Bool)

(assert (=> b!182569 m!283951))

(declare-fun m!283953 () Bool)

(assert (=> b!182566 m!283953))

(assert (=> b!182566 m!283477))

(assert (=> b!182566 m!283473))

(assert (=> b!182570 m!283473))

(declare-fun m!283955 () Bool)

(assert (=> b!182570 m!283955))

(declare-fun m!283957 () Bool)

(assert (=> b!182570 m!283957))

(assert (=> d!63331 m!283905))

(declare-fun m!283959 () Bool)

(assert (=> d!63331 m!283959))

(declare-fun m!283961 () Bool)

(assert (=> d!63331 m!283961))

(declare-fun m!283963 () Bool)

(assert (=> d!63331 m!283963))

(declare-fun m!283965 () Bool)

(assert (=> d!63331 m!283965))

(declare-fun m!283967 () Bool)

(assert (=> d!63331 m!283967))

(assert (=> d!63331 m!283941))

(declare-fun m!283969 () Bool)

(assert (=> d!63331 m!283969))

(assert (=> d!63331 m!283487))

(assert (=> d!63331 m!283945))

(declare-fun m!283971 () Bool)

(assert (=> d!63331 m!283971))

(declare-fun m!283973 () Bool)

(assert (=> b!182567 m!283973))

(assert (=> b!182230 d!63331))

(declare-fun d!63333 () Bool)

(declare-fun lt!280461 () tuple2!15768)

(assert (=> d!63333 (= lt!280461 (readBit!0 (_1!8518 lt!279733)))))

(assert (=> d!63333 (= (readBitPure!0 (_1!8518 lt!279733)) (tuple2!15743 (_2!8529 lt!280461) (_1!8529 lt!280461)))))

(declare-fun bs!15769 () Bool)

(assert (= bs!15769 d!63333))

(declare-fun m!283975 () Bool)

(assert (=> bs!15769 m!283975))

(assert (=> b!182230 d!63333))

(declare-fun d!63335 () Bool)

(assert (=> d!63335 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4291 (buf!4740 (_2!8515 lt!279736)))) ((_ sign_extend 32) (currentByte!8962 (_2!8515 lt!279746))) ((_ sign_extend 32) (currentBit!8957 (_2!8515 lt!279746))) lt!279747) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4291 (buf!4740 (_2!8515 lt!279736)))) ((_ sign_extend 32) (currentByte!8962 (_2!8515 lt!279746))) ((_ sign_extend 32) (currentBit!8957 (_2!8515 lt!279746)))) lt!279747))))

(declare-fun bs!15770 () Bool)

(assert (= bs!15770 d!63335))

(declare-fun m!283977 () Bool)

(assert (=> bs!15770 m!283977))

(assert (=> b!182230 d!63335))

(declare-fun d!63337 () Bool)

(assert (=> d!63337 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!182230 d!63337))

(declare-datatypes ((tuple2!15770 0))(
  ( (tuple2!15771 (_1!8530 (_ BitVec 64)) (_2!8530 BitStream!7690)) )
))
(declare-fun lt!280492 () tuple2!15770)

(declare-fun d!63339 () Bool)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!7690 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!15770)

(assert (=> d!63339 (= lt!280492 (readNBitsLSBFirstsLoop!0 (_1!8518 lt!279733) nBits!348 i!590 (bvand v!189 (onesLSBLong!0 i!590))))))

(assert (=> d!63339 (= (readNBitsLSBFirstsLoopPure!0 (_1!8518 lt!279733) nBits!348 i!590 (bvand v!189 (onesLSBLong!0 i!590))) (tuple2!15745 (_2!8530 lt!280492) (_1!8530 lt!280492)))))

(declare-fun bs!15771 () Bool)

(assert (= bs!15771 d!63339))

(declare-fun m!283979 () Bool)

(assert (=> bs!15771 m!283979))

(assert (=> b!182230 d!63339))

(declare-fun d!63341 () Bool)

(declare-fun e!126693 () Bool)

(assert (=> d!63341 e!126693))

(declare-fun res!151737 () Bool)

(assert (=> d!63341 (=> (not res!151737) (not e!126693))))

(declare-fun lt!280496 () (_ BitVec 64))

(declare-fun lt!280497 () (_ BitVec 64))

(declare-fun lt!280493 () (_ BitVec 64))

(assert (=> d!63341 (= res!151737 (= lt!280497 (bvsub lt!280496 lt!280493)))))

(assert (=> d!63341 (or (= (bvand lt!280496 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!280493 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!280496 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!280496 lt!280493) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63341 (= lt!280493 (remainingBits!0 ((_ sign_extend 32) (size!4291 (buf!4740 (_1!8516 lt!279730)))) ((_ sign_extend 32) (currentByte!8962 (_1!8516 lt!279730))) ((_ sign_extend 32) (currentBit!8957 (_1!8516 lt!279730)))))))

(declare-fun lt!280498 () (_ BitVec 64))

(declare-fun lt!280495 () (_ BitVec 64))

(assert (=> d!63341 (= lt!280496 (bvmul lt!280498 lt!280495))))

(assert (=> d!63341 (or (= lt!280498 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!280495 (bvsdiv (bvmul lt!280498 lt!280495) lt!280498)))))

(assert (=> d!63341 (= lt!280495 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!63341 (= lt!280498 ((_ sign_extend 32) (size!4291 (buf!4740 (_1!8516 lt!279730)))))))

(assert (=> d!63341 (= lt!280497 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8962 (_1!8516 lt!279730))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8957 (_1!8516 lt!279730)))))))

(assert (=> d!63341 (invariant!0 (currentBit!8957 (_1!8516 lt!279730)) (currentByte!8962 (_1!8516 lt!279730)) (size!4291 (buf!4740 (_1!8516 lt!279730))))))

(assert (=> d!63341 (= (bitIndex!0 (size!4291 (buf!4740 (_1!8516 lt!279730))) (currentByte!8962 (_1!8516 lt!279730)) (currentBit!8957 (_1!8516 lt!279730))) lt!280497)))

(declare-fun b!182577 () Bool)

(declare-fun res!151736 () Bool)

(assert (=> b!182577 (=> (not res!151736) (not e!126693))))

(assert (=> b!182577 (= res!151736 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!280497))))

(declare-fun b!182578 () Bool)

(declare-fun lt!280494 () (_ BitVec 64))

(assert (=> b!182578 (= e!126693 (bvsle lt!280497 (bvmul lt!280494 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!182578 (or (= lt!280494 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!280494 #b0000000000000000000000000000000000000000000000000000000000001000) lt!280494)))))

(assert (=> b!182578 (= lt!280494 ((_ sign_extend 32) (size!4291 (buf!4740 (_1!8516 lt!279730)))))))

(assert (= (and d!63341 res!151737) b!182577))

(assert (= (and b!182577 res!151736) b!182578))

(declare-fun m!283981 () Bool)

(assert (=> d!63341 m!283981))

(declare-fun m!283983 () Bool)

(assert (=> d!63341 m!283983))

(assert (=> b!182230 d!63341))

(declare-fun d!63343 () Bool)

(declare-fun e!126702 () Bool)

(assert (=> d!63343 e!126702))

(declare-fun res!151752 () Bool)

(assert (=> d!63343 (=> (not res!151752) (not e!126702))))

(declare-fun lt!280528 () tuple2!15742)

(declare-fun lt!280527 () tuple2!15742)

(assert (=> d!63343 (= res!151752 (= (bitIndex!0 (size!4291 (buf!4740 (_1!8516 lt!280528))) (currentByte!8962 (_1!8516 lt!280528)) (currentBit!8957 (_1!8516 lt!280528))) (bitIndex!0 (size!4291 (buf!4740 (_1!8516 lt!280527))) (currentByte!8962 (_1!8516 lt!280527)) (currentBit!8957 (_1!8516 lt!280527)))))))

(declare-fun lt!280525 () Unit!13079)

(declare-fun lt!280526 () BitStream!7690)

(declare-fun choose!50 (BitStream!7690 BitStream!7690 BitStream!7690 tuple2!15742 tuple2!15742 BitStream!7690 Bool tuple2!15742 tuple2!15742 BitStream!7690 Bool) Unit!13079)

(assert (=> d!63343 (= lt!280525 (choose!50 lt!279729 (_2!8515 lt!279736) lt!280526 lt!280528 (tuple2!15743 (_1!8516 lt!280528) (_2!8516 lt!280528)) (_1!8516 lt!280528) (_2!8516 lt!280528) lt!280527 (tuple2!15743 (_1!8516 lt!280527) (_2!8516 lt!280527)) (_1!8516 lt!280527) (_2!8516 lt!280527)))))

(assert (=> d!63343 (= lt!280527 (readBitPure!0 lt!280526))))

(assert (=> d!63343 (= lt!280528 (readBitPure!0 lt!279729))))

(assert (=> d!63343 (= lt!280526 (BitStream!7691 (buf!4740 (_2!8515 lt!279736)) (currentByte!8962 lt!279729) (currentBit!8957 lt!279729)))))

(assert (=> d!63343 (invariant!0 (currentBit!8957 lt!279729) (currentByte!8962 lt!279729) (size!4291 (buf!4740 (_2!8515 lt!279736))))))

(assert (=> d!63343 (= (readBitPrefixLemma!0 lt!279729 (_2!8515 lt!279736)) lt!280525)))

(declare-fun b!182593 () Bool)

(assert (=> b!182593 (= e!126702 (= (_2!8516 lt!280528) (_2!8516 lt!280527)))))

(assert (= (and d!63343 res!151752) b!182593))

(declare-fun m!283985 () Bool)

(assert (=> d!63343 m!283985))

(declare-fun m!283987 () Bool)

(assert (=> d!63343 m!283987))

(declare-fun m!283989 () Bool)

(assert (=> d!63343 m!283989))

(declare-fun m!283991 () Bool)

(assert (=> d!63343 m!283991))

(assert (=> d!63343 m!283445))

(declare-fun m!283993 () Bool)

(assert (=> d!63343 m!283993))

(assert (=> b!182230 d!63343))

(declare-fun d!63345 () Bool)

(assert (=> d!63345 (= (invariant!0 (currentBit!8957 thiss!1204) (currentByte!8962 thiss!1204) (size!4291 (buf!4740 (_2!8515 lt!279746)))) (and (bvsge (currentBit!8957 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!8957 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!8962 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!8962 thiss!1204) (size!4291 (buf!4740 (_2!8515 lt!279746)))) (and (= (currentBit!8957 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!8962 thiss!1204) (size!4291 (buf!4740 (_2!8515 lt!279746))))))))))

(assert (=> b!182230 d!63345))

(declare-fun d!63347 () Bool)

(declare-fun lt!280529 () tuple2!15768)

(assert (=> d!63347 (= lt!280529 (readBit!0 (BitStream!7691 (buf!4740 (_2!8515 lt!279736)) (currentByte!8962 thiss!1204) (currentBit!8957 thiss!1204))))))

(assert (=> d!63347 (= (readBitPure!0 (BitStream!7691 (buf!4740 (_2!8515 lt!279736)) (currentByte!8962 thiss!1204) (currentBit!8957 thiss!1204))) (tuple2!15743 (_2!8529 lt!280529) (_1!8529 lt!280529)))))

(declare-fun bs!15772 () Bool)

(assert (= bs!15772 d!63347))

(declare-fun m!283995 () Bool)

(assert (=> bs!15772 m!283995))

(assert (=> b!182230 d!63347))

(declare-fun d!63349 () Bool)

(assert (=> d!63349 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4291 (buf!4740 (_2!8515 lt!279736)))) ((_ sign_extend 32) (currentByte!8962 thiss!1204)) ((_ sign_extend 32) (currentBit!8957 thiss!1204)) lt!279734) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4291 (buf!4740 (_2!8515 lt!279736)))) ((_ sign_extend 32) (currentByte!8962 thiss!1204)) ((_ sign_extend 32) (currentBit!8957 thiss!1204))) lt!279734))))

(declare-fun bs!15773 () Bool)

(assert (= bs!15773 d!63349))

(declare-fun m!283997 () Bool)

(assert (=> bs!15773 m!283997))

(assert (=> b!182230 d!63349))

(declare-fun d!63351 () Bool)

(declare-fun lt!280530 () tuple2!15768)

(assert (=> d!63351 (= lt!280530 (readBit!0 (readerFrom!0 (_2!8515 lt!279746) (currentBit!8957 thiss!1204) (currentByte!8962 thiss!1204))))))

(assert (=> d!63351 (= (readBitPure!0 (readerFrom!0 (_2!8515 lt!279746) (currentBit!8957 thiss!1204) (currentByte!8962 thiss!1204))) (tuple2!15743 (_2!8529 lt!280530) (_1!8529 lt!280530)))))

(declare-fun bs!15774 () Bool)

(assert (= bs!15774 d!63351))

(assert (=> bs!15774 m!283491))

(declare-fun m!283999 () Bool)

(assert (=> bs!15774 m!283999))

(assert (=> b!182239 d!63351))

(declare-fun d!63353 () Bool)

(declare-fun e!126705 () Bool)

(assert (=> d!63353 e!126705))

(declare-fun res!151756 () Bool)

(assert (=> d!63353 (=> (not res!151756) (not e!126705))))

(assert (=> d!63353 (= res!151756 (invariant!0 (currentBit!8957 (_2!8515 lt!279746)) (currentByte!8962 (_2!8515 lt!279746)) (size!4291 (buf!4740 (_2!8515 lt!279746)))))))

(assert (=> d!63353 (= (readerFrom!0 (_2!8515 lt!279746) (currentBit!8957 thiss!1204) (currentByte!8962 thiss!1204)) (BitStream!7691 (buf!4740 (_2!8515 lt!279746)) (currentByte!8962 thiss!1204) (currentBit!8957 thiss!1204)))))

(declare-fun b!182596 () Bool)

(assert (=> b!182596 (= e!126705 (invariant!0 (currentBit!8957 thiss!1204) (currentByte!8962 thiss!1204) (size!4291 (buf!4740 (_2!8515 lt!279746)))))))

(assert (= (and d!63353 res!151756) b!182596))

(assert (=> d!63353 m!283765))

(assert (=> b!182596 m!283447))

(assert (=> b!182239 d!63353))

(declare-fun d!63355 () Bool)

(assert (=> d!63355 (= (invariant!0 (currentBit!8957 thiss!1204) (currentByte!8962 thiss!1204) (size!4291 (buf!4740 thiss!1204))) (and (bvsge (currentBit!8957 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!8957 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!8962 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!8962 thiss!1204) (size!4291 (buf!4740 thiss!1204))) (and (= (currentBit!8957 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!8962 thiss!1204) (size!4291 (buf!4740 thiss!1204)))))))))

(assert (=> b!182229 d!63355))

(declare-fun d!63357 () Bool)

(assert (=> d!63357 (= (inv!12 thiss!1204) (invariant!0 (currentBit!8957 thiss!1204) (currentByte!8962 thiss!1204) (size!4291 (buf!4740 thiss!1204))))))

(declare-fun bs!15775 () Bool)

(assert (= bs!15775 d!63357))

(assert (=> bs!15775 m!283461))

(assert (=> start!39968 d!63357))

(declare-fun d!63359 () Bool)

(assert (=> d!63359 (= (array_inv!4032 (buf!4740 thiss!1204)) (bvsge (size!4291 (buf!4740 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!182240 d!63359))

(declare-fun d!63361 () Bool)

(assert (=> d!63361 (= (invariant!0 (currentBit!8957 thiss!1204) (currentByte!8962 thiss!1204) (size!4291 (buf!4740 (_2!8515 lt!279736)))) (and (bvsge (currentBit!8957 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!8957 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!8962 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!8962 thiss!1204) (size!4291 (buf!4740 (_2!8515 lt!279736)))) (and (= (currentBit!8957 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!8962 thiss!1204) (size!4291 (buf!4740 (_2!8515 lt!279736))))))))))

(assert (=> b!182233 d!63361))

(declare-fun d!63363 () Bool)

(assert (=> d!63363 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4291 (buf!4740 thiss!1204))) ((_ sign_extend 32) (currentByte!8962 thiss!1204)) ((_ sign_extend 32) (currentBit!8957 thiss!1204)) lt!279734) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4291 (buf!4740 thiss!1204))) ((_ sign_extend 32) (currentByte!8962 thiss!1204)) ((_ sign_extend 32) (currentBit!8957 thiss!1204))) lt!279734))))

(declare-fun bs!15776 () Bool)

(assert (= bs!15776 d!63363))

(assert (=> bs!15776 m!283767))

(assert (=> b!182231 d!63363))

(assert (=> b!182232 d!63273))

(assert (=> b!182232 d!63275))

(declare-fun b!182623 () Bool)

(declare-fun res!151779 () Bool)

(declare-fun e!126720 () Bool)

(assert (=> b!182623 (=> (not res!151779) (not e!126720))))

(declare-fun lt!280597 () tuple2!15740)

(assert (=> b!182623 (= res!151779 (isPrefixOf!0 thiss!1204 (_2!8515 lt!280597)))))

(declare-fun b!182625 () Bool)

(declare-fun e!126719 () Bool)

(declare-fun lt!280598 () tuple2!15742)

(assert (=> b!182625 (= e!126719 (= (bitIndex!0 (size!4291 (buf!4740 (_1!8516 lt!280598))) (currentByte!8962 (_1!8516 lt!280598)) (currentBit!8957 (_1!8516 lt!280598))) (bitIndex!0 (size!4291 (buf!4740 (_2!8515 lt!280597))) (currentByte!8962 (_2!8515 lt!280597)) (currentBit!8957 (_2!8515 lt!280597)))))))

(declare-fun d!63365 () Bool)

(assert (=> d!63365 e!126720))

(declare-fun res!151778 () Bool)

(assert (=> d!63365 (=> (not res!151778) (not e!126720))))

(assert (=> d!63365 (= res!151778 (= (size!4291 (buf!4740 thiss!1204)) (size!4291 (buf!4740 (_2!8515 lt!280597)))))))

(declare-fun choose!16 (BitStream!7690 Bool) tuple2!15740)

(assert (=> d!63365 (= lt!280597 (choose!16 thiss!1204 lt!279732))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!63365 (validate_offset_bit!0 ((_ sign_extend 32) (size!4291 (buf!4740 thiss!1204))) ((_ sign_extend 32) (currentByte!8962 thiss!1204)) ((_ sign_extend 32) (currentBit!8957 thiss!1204)))))

(assert (=> d!63365 (= (appendBit!0 thiss!1204 lt!279732) lt!280597)))

(declare-fun b!182622 () Bool)

(declare-fun res!151780 () Bool)

(assert (=> b!182622 (=> (not res!151780) (not e!126720))))

(declare-fun lt!280595 () (_ BitVec 64))

(declare-fun lt!280596 () (_ BitVec 64))

(assert (=> b!182622 (= res!151780 (= (bitIndex!0 (size!4291 (buf!4740 (_2!8515 lt!280597))) (currentByte!8962 (_2!8515 lt!280597)) (currentBit!8957 (_2!8515 lt!280597))) (bvadd lt!280596 lt!280595)))))

(assert (=> b!182622 (or (not (= (bvand lt!280596 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!280595 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!280596 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!280596 lt!280595) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!182622 (= lt!280595 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!182622 (= lt!280596 (bitIndex!0 (size!4291 (buf!4740 thiss!1204)) (currentByte!8962 thiss!1204) (currentBit!8957 thiss!1204)))))

(declare-fun b!182624 () Bool)

(assert (=> b!182624 (= e!126720 e!126719)))

(declare-fun res!151777 () Bool)

(assert (=> b!182624 (=> (not res!151777) (not e!126719))))

(assert (=> b!182624 (= res!151777 (and (= (_2!8516 lt!280598) lt!279732) (= (_1!8516 lt!280598) (_2!8515 lt!280597))))))

(assert (=> b!182624 (= lt!280598 (readBitPure!0 (readerFrom!0 (_2!8515 lt!280597) (currentBit!8957 thiss!1204) (currentByte!8962 thiss!1204))))))

(assert (= (and d!63365 res!151778) b!182622))

(assert (= (and b!182622 res!151780) b!182623))

(assert (= (and b!182623 res!151779) b!182624))

(assert (= (and b!182624 res!151777) b!182625))

(declare-fun m!284093 () Bool)

(assert (=> d!63365 m!284093))

(declare-fun m!284095 () Bool)

(assert (=> d!63365 m!284095))

(declare-fun m!284097 () Bool)

(assert (=> b!182625 m!284097))

(declare-fun m!284099 () Bool)

(assert (=> b!182625 m!284099))

(declare-fun m!284101 () Bool)

(assert (=> b!182624 m!284101))

(assert (=> b!182624 m!284101))

(declare-fun m!284103 () Bool)

(assert (=> b!182624 m!284103))

(assert (=> b!182622 m!284099))

(assert (=> b!182622 m!283475))

(declare-fun m!284105 () Bool)

(assert (=> b!182623 m!284105))

(assert (=> b!182232 d!63365))

(push 1)

(assert (not d!63277))

(assert (not d!63335))

(assert (not d!63341))

(assert (not b!182531))

(assert (not b!182624))

(assert (not b!182566))

(assert (not b!182564))

(assert (not b!182521))

(assert (not b!182529))

(assert (not b!182441))

(assert (not d!63283))

(assert (not b!182522))

(assert (not d!63323))

(assert (not b!182596))

(assert (not d!63357))

(assert (not b!182516))

(assert (not d!63339))

(assert (not d!63325))

(assert (not d!63273))

(assert (not d!63351))

(assert (not d!63353))

(assert (not b!182622))

(assert (not b!182569))

(assert (not d!63349))

(assert (not b!182517))

(assert (not b!182561))

(assert (not b!182623))

(assert (not b!182534))

(assert (not b!182562))

(assert (not b!182526))

(assert (not d!63343))

(assert (not b!182443))

(assert (not b!182565))

(assert (not d!63279))

(assert (not b!182428))

(assert (not d!63289))

(assert (not b!182519))

(assert (not d!63363))

(assert (not d!63365))

(assert (not d!63333))

(assert (not d!63321))

(assert (not bm!2954))

(assert (not b!182532))

(assert (not d!63331))

(assert (not b!182525))

(assert (not d!63287))

(assert (not d!63347))

(assert (not b!182570))

(assert (not b!182524))

(assert (not d!63275))

(assert (not b!182426))

(assert (not b!182567))

(assert (not d!63329))

(assert (not d!63327))

(assert (not b!182625))

(check-sat)

(pop 1)

(push 1)

(check-sat)

