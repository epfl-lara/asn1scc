; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40212 () Bool)

(assert start!40212)

(declare-fun b!184345 () Bool)

(declare-fun e!127713 () Bool)

(declare-fun e!127708 () Bool)

(assert (=> b!184345 (= e!127713 e!127708)))

(declare-fun res!153368 () Bool)

(assert (=> b!184345 (=> (not res!153368) (not e!127708))))

(declare-datatypes ((array!9780 0))(
  ( (array!9781 (arr!5244 (Array (_ BitVec 32) (_ BitVec 8))) (size!4314 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7736 0))(
  ( (BitStream!7737 (buf!4769 array!9780) (currentByte!9003 (_ BitVec 32)) (currentBit!8998 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15948 0))(
  ( (tuple2!15949 (_1!8619 BitStream!7736) (_2!8619 Bool)) )
))
(declare-fun lt!283511 () tuple2!15948)

(declare-fun lt!283494 () Bool)

(declare-datatypes ((Unit!13203 0))(
  ( (Unit!13204) )
))
(declare-datatypes ((tuple2!15950 0))(
  ( (tuple2!15951 (_1!8620 Unit!13203) (_2!8620 BitStream!7736)) )
))
(declare-fun lt!283509 () tuple2!15950)

(assert (=> b!184345 (= res!153368 (and (= (_2!8619 lt!283511) lt!283494) (= (_1!8619 lt!283511) (_2!8620 lt!283509))))))

(declare-fun thiss!1204 () BitStream!7736)

(declare-fun readBitPure!0 (BitStream!7736) tuple2!15948)

(declare-fun readerFrom!0 (BitStream!7736 (_ BitVec 32) (_ BitVec 32)) BitStream!7736)

(assert (=> b!184345 (= lt!283511 (readBitPure!0 (readerFrom!0 (_2!8620 lt!283509) (currentBit!8998 thiss!1204) (currentByte!9003 thiss!1204))))))

(declare-fun b!184346 () Bool)

(declare-fun e!127706 () Bool)

(declare-fun e!127707 () Bool)

(assert (=> b!184346 (= e!127706 e!127707)))

(declare-fun res!153361 () Bool)

(assert (=> b!184346 (=> res!153361 e!127707)))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun lt!283491 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun lt!283488 () (_ BitVec 64))

(assert (=> b!184346 (= res!153361 (not (= lt!283488 (bvsub (bvsub (bvadd lt!283491 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun lt!283508 () tuple2!15950)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!184346 (= lt!283488 (bitIndex!0 (size!4314 (buf!4769 (_2!8620 lt!283508))) (currentByte!9003 (_2!8620 lt!283508)) (currentBit!8998 (_2!8620 lt!283508))))))

(declare-fun isPrefixOf!0 (BitStream!7736 BitStream!7736) Bool)

(assert (=> b!184346 (isPrefixOf!0 thiss!1204 (_2!8620 lt!283508))))

(declare-fun lt!283498 () Unit!13203)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7736 BitStream!7736 BitStream!7736) Unit!13203)

(assert (=> b!184346 (= lt!283498 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8620 lt!283509) (_2!8620 lt!283508)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7736 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15950)

(assert (=> b!184346 (= lt!283508 (appendBitsLSBFirstLoopTR!0 (_2!8620 lt!283509) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!184347 () Bool)

(declare-fun e!127709 () Bool)

(declare-fun lt!283503 () tuple2!15948)

(declare-fun lt!283485 () tuple2!15948)

(assert (=> b!184347 (= e!127709 (= (_2!8619 lt!283503) (_2!8619 lt!283485)))))

(declare-fun b!184348 () Bool)

(declare-fun res!153360 () Bool)

(assert (=> b!184348 (=> res!153360 e!127707)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!184348 (= res!153360 (not (invariant!0 (currentBit!8998 (_2!8620 lt!283508)) (currentByte!9003 (_2!8620 lt!283508)) (size!4314 (buf!4769 (_2!8620 lt!283508))))))))

(declare-fun b!184349 () Bool)

(declare-fun e!127711 () Bool)

(declare-fun e!127710 () Bool)

(assert (=> b!184349 (= e!127711 e!127710)))

(declare-fun res!153367 () Bool)

(assert (=> b!184349 (=> (not res!153367) (not e!127710))))

(declare-fun lt!283500 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!184349 (= res!153367 (validate_offset_bits!1 ((_ sign_extend 32) (size!4314 (buf!4769 thiss!1204))) ((_ sign_extend 32) (currentByte!9003 thiss!1204)) ((_ sign_extend 32) (currentBit!8998 thiss!1204)) lt!283500))))

(assert (=> b!184349 (= lt!283500 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!184350 () Bool)

(declare-fun res!153359 () Bool)

(assert (=> b!184350 (=> (not res!153359) (not e!127713))))

(assert (=> b!184350 (= res!153359 (isPrefixOf!0 thiss!1204 (_2!8620 lt!283509)))))

(declare-fun b!184351 () Bool)

(declare-fun res!153364 () Bool)

(assert (=> b!184351 (=> (not res!153364) (not e!127710))))

(assert (=> b!184351 (= res!153364 (not (= i!590 nBits!348)))))

(declare-fun res!153365 () Bool)

(assert (=> start!40212 (=> (not res!153365) (not e!127711))))

(assert (=> start!40212 (= res!153365 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!40212 e!127711))

(assert (=> start!40212 true))

(declare-fun e!127704 () Bool)

(declare-fun inv!12 (BitStream!7736) Bool)

(assert (=> start!40212 (and (inv!12 thiss!1204) e!127704)))

(declare-fun b!184352 () Bool)

(declare-fun lt!283502 () (_ BitVec 64))

(assert (=> b!184352 (= e!127708 (= (bitIndex!0 (size!4314 (buf!4769 (_1!8619 lt!283511))) (currentByte!9003 (_1!8619 lt!283511)) (currentBit!8998 (_1!8619 lt!283511))) lt!283502))))

(declare-fun b!184353 () Bool)

(declare-fun e!127705 () Bool)

(assert (=> b!184353 (= e!127705 (invariant!0 (currentBit!8998 thiss!1204) (currentByte!9003 thiss!1204) (size!4314 (buf!4769 (_2!8620 lt!283508)))))))

(declare-fun b!184354 () Bool)

(declare-fun res!153373 () Bool)

(assert (=> b!184354 (=> res!153373 e!127707)))

(declare-fun lt!283490 () (_ BitVec 64))

(assert (=> b!184354 (= res!153373 (or (not (= (size!4314 (buf!4769 (_2!8620 lt!283508))) (size!4314 (buf!4769 thiss!1204)))) (not (= lt!283488 (bvsub (bvadd lt!283490 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!184355 () Bool)

(declare-fun res!153362 () Bool)

(assert (=> b!184355 (=> (not res!153362) (not e!127710))))

(assert (=> b!184355 (= res!153362 (invariant!0 (currentBit!8998 thiss!1204) (currentByte!9003 thiss!1204) (size!4314 (buf!4769 thiss!1204))))))

(declare-fun b!184356 () Bool)

(declare-fun array_inv!4055 (array!9780) Bool)

(assert (=> b!184356 (= e!127704 (array_inv!4055 (buf!4769 thiss!1204)))))

(declare-fun b!184357 () Bool)

(declare-fun res!153374 () Bool)

(assert (=> b!184357 (=> res!153374 e!127707)))

(assert (=> b!184357 (= res!153374 (not (isPrefixOf!0 (_2!8620 lt!283509) (_2!8620 lt!283508))))))

(declare-fun b!184358 () Bool)

(declare-fun e!127712 () Bool)

(assert (=> b!184358 (= e!127707 e!127712)))

(declare-fun res!153372 () Bool)

(assert (=> b!184358 (=> res!153372 e!127712)))

(declare-datatypes ((tuple2!15952 0))(
  ( (tuple2!15953 (_1!8621 BitStream!7736) (_2!8621 BitStream!7736)) )
))
(declare-fun lt!283506 () tuple2!15952)

(declare-fun lt!283489 () (_ BitVec 64))

(declare-datatypes ((tuple2!15954 0))(
  ( (tuple2!15955 (_1!8622 BitStream!7736) (_2!8622 (_ BitVec 64))) )
))
(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7736 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!15954)

(assert (=> b!184358 (= res!153372 (not (= (_1!8622 (readNBitsLSBFirstsLoopPure!0 (_1!8621 lt!283506) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!283489)) (_2!8621 lt!283506))))))

(declare-fun lt!283504 () (_ BitVec 64))

(assert (=> b!184358 (validate_offset_bits!1 ((_ sign_extend 32) (size!4314 (buf!4769 (_2!8620 lt!283508)))) ((_ sign_extend 32) (currentByte!9003 (_2!8620 lt!283509))) ((_ sign_extend 32) (currentBit!8998 (_2!8620 lt!283509))) lt!283504)))

(declare-fun lt!283497 () Unit!13203)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7736 array!9780 (_ BitVec 64)) Unit!13203)

(assert (=> b!184358 (= lt!283497 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8620 lt!283509) (buf!4769 (_2!8620 lt!283508)) lt!283504))))

(assert (=> b!184358 (= lt!283504 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!283487 () (_ BitVec 64))

(declare-fun lt!283493 () tuple2!15948)

(declare-fun lt!283510 () (_ BitVec 64))

(assert (=> b!184358 (= lt!283489 (bvor lt!283510 (ite (_2!8619 lt!283493) lt!283487 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!283492 () tuple2!15952)

(declare-fun lt!283486 () tuple2!15954)

(assert (=> b!184358 (= lt!283486 (readNBitsLSBFirstsLoopPure!0 (_1!8621 lt!283492) nBits!348 i!590 lt!283510))))

(assert (=> b!184358 (validate_offset_bits!1 ((_ sign_extend 32) (size!4314 (buf!4769 (_2!8620 lt!283508)))) ((_ sign_extend 32) (currentByte!9003 thiss!1204)) ((_ sign_extend 32) (currentBit!8998 thiss!1204)) lt!283500)))

(declare-fun lt!283501 () Unit!13203)

(assert (=> b!184358 (= lt!283501 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4769 (_2!8620 lt!283508)) lt!283500))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!184358 (= lt!283510 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!184358 (= (_2!8619 lt!283493) lt!283494)))

(assert (=> b!184358 (= lt!283493 (readBitPure!0 (_1!8621 lt!283492)))))

(declare-fun reader!0 (BitStream!7736 BitStream!7736) tuple2!15952)

(assert (=> b!184358 (= lt!283506 (reader!0 (_2!8620 lt!283509) (_2!8620 lt!283508)))))

(assert (=> b!184358 (= lt!283492 (reader!0 thiss!1204 (_2!8620 lt!283508)))))

(assert (=> b!184358 e!127709))

(declare-fun res!153363 () Bool)

(assert (=> b!184358 (=> (not res!153363) (not e!127709))))

(assert (=> b!184358 (= res!153363 (= (bitIndex!0 (size!4314 (buf!4769 (_1!8619 lt!283503))) (currentByte!9003 (_1!8619 lt!283503)) (currentBit!8998 (_1!8619 lt!283503))) (bitIndex!0 (size!4314 (buf!4769 (_1!8619 lt!283485))) (currentByte!9003 (_1!8619 lt!283485)) (currentBit!8998 (_1!8619 lt!283485)))))))

(declare-fun lt!283507 () Unit!13203)

(declare-fun lt!283505 () BitStream!7736)

(declare-fun readBitPrefixLemma!0 (BitStream!7736 BitStream!7736) Unit!13203)

(assert (=> b!184358 (= lt!283507 (readBitPrefixLemma!0 lt!283505 (_2!8620 lt!283508)))))

(assert (=> b!184358 (= lt!283485 (readBitPure!0 (BitStream!7737 (buf!4769 (_2!8620 lt!283508)) (currentByte!9003 thiss!1204) (currentBit!8998 thiss!1204))))))

(assert (=> b!184358 (= lt!283503 (readBitPure!0 lt!283505))))

(assert (=> b!184358 e!127705))

(declare-fun res!153375 () Bool)

(assert (=> b!184358 (=> (not res!153375) (not e!127705))))

(assert (=> b!184358 (= res!153375 (invariant!0 (currentBit!8998 thiss!1204) (currentByte!9003 thiss!1204) (size!4314 (buf!4769 (_2!8620 lt!283509)))))))

(assert (=> b!184358 (= lt!283505 (BitStream!7737 (buf!4769 (_2!8620 lt!283509)) (currentByte!9003 thiss!1204) (currentBit!8998 thiss!1204)))))

(declare-fun b!184359 () Bool)

(assert (=> b!184359 (= e!127710 (not e!127706))))

(declare-fun res!153371 () Bool)

(assert (=> b!184359 (=> res!153371 e!127706)))

(assert (=> b!184359 (= res!153371 (not (= lt!283491 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!283490))))))

(assert (=> b!184359 (= lt!283491 (bitIndex!0 (size!4314 (buf!4769 (_2!8620 lt!283509))) (currentByte!9003 (_2!8620 lt!283509)) (currentBit!8998 (_2!8620 lt!283509))))))

(assert (=> b!184359 (= lt!283490 (bitIndex!0 (size!4314 (buf!4769 thiss!1204)) (currentByte!9003 thiss!1204) (currentBit!8998 thiss!1204)))))

(declare-fun e!127703 () Bool)

(assert (=> b!184359 e!127703))

(declare-fun res!153370 () Bool)

(assert (=> b!184359 (=> (not res!153370) (not e!127703))))

(assert (=> b!184359 (= res!153370 (= (size!4314 (buf!4769 thiss!1204)) (size!4314 (buf!4769 (_2!8620 lt!283509)))))))

(declare-fun appendBit!0 (BitStream!7736 Bool) tuple2!15950)

(assert (=> b!184359 (= lt!283509 (appendBit!0 thiss!1204 lt!283494))))

(assert (=> b!184359 (= lt!283494 (not (= (bvand v!189 lt!283487) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!184359 (= lt!283487 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!184360 () Bool)

(assert (=> b!184360 (= e!127703 e!127713)))

(declare-fun res!153369 () Bool)

(assert (=> b!184360 (=> (not res!153369) (not e!127713))))

(declare-fun lt!283495 () (_ BitVec 64))

(assert (=> b!184360 (= res!153369 (= lt!283502 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!283495)))))

(assert (=> b!184360 (= lt!283502 (bitIndex!0 (size!4314 (buf!4769 (_2!8620 lt!283509))) (currentByte!9003 (_2!8620 lt!283509)) (currentBit!8998 (_2!8620 lt!283509))))))

(assert (=> b!184360 (= lt!283495 (bitIndex!0 (size!4314 (buf!4769 thiss!1204)) (currentByte!9003 thiss!1204) (currentBit!8998 thiss!1204)))))

(declare-fun b!184361 () Bool)

(assert (=> b!184361 (= e!127712 true)))

(declare-fun lt!283499 () tuple2!15954)

(assert (=> b!184361 (and (= (_2!8622 lt!283486) (_2!8622 lt!283499)) (= (_1!8622 lt!283486) (_1!8622 lt!283499)))))

(declare-fun lt!283496 () Unit!13203)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7736 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13203)

(assert (=> b!184361 (= lt!283496 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8621 lt!283492) nBits!348 i!590 lt!283510))))

(declare-fun withMovedBitIndex!0 (BitStream!7736 (_ BitVec 64)) BitStream!7736)

(assert (=> b!184361 (= lt!283499 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8621 lt!283492) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!283489))))

(declare-fun b!184362 () Bool)

(declare-fun res!153366 () Bool)

(assert (=> b!184362 (=> res!153366 e!127707)))

(assert (=> b!184362 (= res!153366 (not (isPrefixOf!0 thiss!1204 (_2!8620 lt!283509))))))

(assert (= (and start!40212 res!153365) b!184349))

(assert (= (and b!184349 res!153367) b!184355))

(assert (= (and b!184355 res!153362) b!184351))

(assert (= (and b!184351 res!153364) b!184359))

(assert (= (and b!184359 res!153370) b!184360))

(assert (= (and b!184360 res!153369) b!184350))

(assert (= (and b!184350 res!153359) b!184345))

(assert (= (and b!184345 res!153368) b!184352))

(assert (= (and b!184359 (not res!153371)) b!184346))

(assert (= (and b!184346 (not res!153361)) b!184348))

(assert (= (and b!184348 (not res!153360)) b!184354))

(assert (= (and b!184354 (not res!153373)) b!184357))

(assert (= (and b!184357 (not res!153374)) b!184362))

(assert (= (and b!184362 (not res!153366)) b!184358))

(assert (= (and b!184358 res!153375) b!184353))

(assert (= (and b!184358 res!153363) b!184347))

(assert (= (and b!184358 (not res!153372)) b!184361))

(assert (= start!40212 b!184356))

(declare-fun m!286433 () Bool)

(assert (=> start!40212 m!286433))

(declare-fun m!286435 () Bool)

(assert (=> b!184362 m!286435))

(declare-fun m!286437 () Bool)

(assert (=> b!184353 m!286437))

(declare-fun m!286439 () Bool)

(assert (=> b!184361 m!286439))

(declare-fun m!286441 () Bool)

(assert (=> b!184361 m!286441))

(assert (=> b!184361 m!286441))

(declare-fun m!286443 () Bool)

(assert (=> b!184361 m!286443))

(declare-fun m!286445 () Bool)

(assert (=> b!184358 m!286445))

(declare-fun m!286447 () Bool)

(assert (=> b!184358 m!286447))

(declare-fun m!286449 () Bool)

(assert (=> b!184358 m!286449))

(declare-fun m!286451 () Bool)

(assert (=> b!184358 m!286451))

(declare-fun m!286453 () Bool)

(assert (=> b!184358 m!286453))

(declare-fun m!286455 () Bool)

(assert (=> b!184358 m!286455))

(declare-fun m!286457 () Bool)

(assert (=> b!184358 m!286457))

(declare-fun m!286459 () Bool)

(assert (=> b!184358 m!286459))

(declare-fun m!286461 () Bool)

(assert (=> b!184358 m!286461))

(declare-fun m!286463 () Bool)

(assert (=> b!184358 m!286463))

(declare-fun m!286465 () Bool)

(assert (=> b!184358 m!286465))

(declare-fun m!286467 () Bool)

(assert (=> b!184358 m!286467))

(declare-fun m!286469 () Bool)

(assert (=> b!184358 m!286469))

(declare-fun m!286471 () Bool)

(assert (=> b!184358 m!286471))

(declare-fun m!286473 () Bool)

(assert (=> b!184358 m!286473))

(declare-fun m!286475 () Bool)

(assert (=> b!184358 m!286475))

(declare-fun m!286477 () Bool)

(assert (=> b!184360 m!286477))

(declare-fun m!286479 () Bool)

(assert (=> b!184360 m!286479))

(declare-fun m!286481 () Bool)

(assert (=> b!184346 m!286481))

(declare-fun m!286483 () Bool)

(assert (=> b!184346 m!286483))

(declare-fun m!286485 () Bool)

(assert (=> b!184346 m!286485))

(declare-fun m!286487 () Bool)

(assert (=> b!184346 m!286487))

(assert (=> b!184350 m!286435))

(assert (=> b!184359 m!286477))

(assert (=> b!184359 m!286479))

(declare-fun m!286489 () Bool)

(assert (=> b!184359 m!286489))

(declare-fun m!286491 () Bool)

(assert (=> b!184356 m!286491))

(declare-fun m!286493 () Bool)

(assert (=> b!184355 m!286493))

(declare-fun m!286495 () Bool)

(assert (=> b!184352 m!286495))

(declare-fun m!286497 () Bool)

(assert (=> b!184345 m!286497))

(assert (=> b!184345 m!286497))

(declare-fun m!286499 () Bool)

(assert (=> b!184345 m!286499))

(declare-fun m!286501 () Bool)

(assert (=> b!184348 m!286501))

(declare-fun m!286503 () Bool)

(assert (=> b!184357 m!286503))

(declare-fun m!286505 () Bool)

(assert (=> b!184349 m!286505))

(push 1)

(assert (not b!184353))

(assert (not b!184356))

(assert (not b!184350))

(assert (not b!184359))

(assert (not b!184360))

(assert (not start!40212))

(assert (not b!184352))

(assert (not b!184362))

(assert (not b!184345))

(assert (not b!184348))

(assert (not b!184358))

(assert (not b!184355))

(assert (not b!184361))

(assert (not b!184346))

(assert (not b!184357))

(assert (not b!184349))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

