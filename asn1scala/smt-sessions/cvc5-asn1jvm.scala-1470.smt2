; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40418 () Bool)

(assert start!40418)

(declare-fun b!185515 () Bool)

(declare-fun e!128429 () Bool)

(declare-fun e!128433 () Bool)

(assert (=> b!185515 (= e!128429 e!128433)))

(declare-fun res!154407 () Bool)

(assert (=> b!185515 (=> res!154407 e!128433)))

(declare-fun i!590 () (_ BitVec 32))

(declare-datatypes ((array!9805 0))(
  ( (array!9806 (arr!5254 (Array (_ BitVec 32) (_ BitVec 8))) (size!4324 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7756 0))(
  ( (BitStream!7757 (buf!4784 array!9805) (currentByte!9028 (_ BitVec 32)) (currentBit!9023 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!16048 0))(
  ( (tuple2!16049 (_1!8669 BitStream!7756) (_2!8669 BitStream!7756)) )
))
(declare-fun lt!286133 () tuple2!16048)

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun lt!286118 () (_ BitVec 64))

(declare-datatypes ((tuple2!16050 0))(
  ( (tuple2!16051 (_1!8670 BitStream!7756) (_2!8670 (_ BitVec 64))) )
))
(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7756 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16050)

(assert (=> b!185515 (= res!154407 (not (= (_1!8670 (readNBitsLSBFirstsLoopPure!0 (_1!8669 lt!286133) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!286118)) (_2!8669 lt!286133))))))

(declare-datatypes ((Unit!13278 0))(
  ( (Unit!13279) )
))
(declare-datatypes ((tuple2!16052 0))(
  ( (tuple2!16053 (_1!8671 Unit!13278) (_2!8671 BitStream!7756)) )
))
(declare-fun lt!286144 () tuple2!16052)

(declare-fun lt!286138 () tuple2!16052)

(declare-fun lt!286136 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!185515 (validate_offset_bits!1 ((_ sign_extend 32) (size!4324 (buf!4784 (_2!8671 lt!286144)))) ((_ sign_extend 32) (currentByte!9028 (_2!8671 lt!286138))) ((_ sign_extend 32) (currentBit!9023 (_2!8671 lt!286138))) lt!286136)))

(declare-fun lt!286131 () Unit!13278)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7756 array!9805 (_ BitVec 64)) Unit!13278)

(assert (=> b!185515 (= lt!286131 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8671 lt!286138) (buf!4784 (_2!8671 lt!286144)) lt!286136))))

(assert (=> b!185515 (= lt!286136 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!286139 () (_ BitVec 64))

(declare-fun lt!286140 () (_ BitVec 64))

(declare-datatypes ((tuple2!16054 0))(
  ( (tuple2!16055 (_1!8672 BitStream!7756) (_2!8672 Bool)) )
))
(declare-fun lt!286122 () tuple2!16054)

(assert (=> b!185515 (= lt!286118 (bvor lt!286139 (ite (_2!8672 lt!286122) lt!286140 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!286127 () tuple2!16048)

(declare-fun lt!286125 () tuple2!16050)

(assert (=> b!185515 (= lt!286125 (readNBitsLSBFirstsLoopPure!0 (_1!8669 lt!286127) nBits!348 i!590 lt!286139))))

(declare-fun thiss!1204 () BitStream!7756)

(declare-fun lt!286134 () (_ BitVec 64))

(assert (=> b!185515 (validate_offset_bits!1 ((_ sign_extend 32) (size!4324 (buf!4784 (_2!8671 lt!286144)))) ((_ sign_extend 32) (currentByte!9028 thiss!1204)) ((_ sign_extend 32) (currentBit!9023 thiss!1204)) lt!286134)))

(declare-fun lt!286130 () Unit!13278)

(assert (=> b!185515 (= lt!286130 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4784 (_2!8671 lt!286144)) lt!286134))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!185515 (= lt!286139 (bvand v!189 (onesLSBLong!0 i!590)))))

(declare-fun lt!286123 () Bool)

(assert (=> b!185515 (= (_2!8672 lt!286122) lt!286123)))

(declare-fun readBitPure!0 (BitStream!7756) tuple2!16054)

(assert (=> b!185515 (= lt!286122 (readBitPure!0 (_1!8669 lt!286127)))))

(declare-fun reader!0 (BitStream!7756 BitStream!7756) tuple2!16048)

(assert (=> b!185515 (= lt!286133 (reader!0 (_2!8671 lt!286138) (_2!8671 lt!286144)))))

(assert (=> b!185515 (= lt!286127 (reader!0 thiss!1204 (_2!8671 lt!286144)))))

(declare-fun e!128434 () Bool)

(assert (=> b!185515 e!128434))

(declare-fun res!154405 () Bool)

(assert (=> b!185515 (=> (not res!154405) (not e!128434))))

(declare-fun lt!286124 () tuple2!16054)

(declare-fun lt!286129 () tuple2!16054)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!185515 (= res!154405 (= (bitIndex!0 (size!4324 (buf!4784 (_1!8672 lt!286124))) (currentByte!9028 (_1!8672 lt!286124)) (currentBit!9023 (_1!8672 lt!286124))) (bitIndex!0 (size!4324 (buf!4784 (_1!8672 lt!286129))) (currentByte!9028 (_1!8672 lt!286129)) (currentBit!9023 (_1!8672 lt!286129)))))))

(declare-fun lt!286135 () Unit!13278)

(declare-fun lt!286119 () BitStream!7756)

(declare-fun readBitPrefixLemma!0 (BitStream!7756 BitStream!7756) Unit!13278)

(assert (=> b!185515 (= lt!286135 (readBitPrefixLemma!0 lt!286119 (_2!8671 lt!286144)))))

(assert (=> b!185515 (= lt!286129 (readBitPure!0 (BitStream!7757 (buf!4784 (_2!8671 lt!286144)) (currentByte!9028 thiss!1204) (currentBit!9023 thiss!1204))))))

(assert (=> b!185515 (= lt!286124 (readBitPure!0 lt!286119))))

(declare-fun e!128432 () Bool)

(assert (=> b!185515 e!128432))

(declare-fun res!154396 () Bool)

(assert (=> b!185515 (=> (not res!154396) (not e!128432))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!185515 (= res!154396 (invariant!0 (currentBit!9023 thiss!1204) (currentByte!9028 thiss!1204) (size!4324 (buf!4784 (_2!8671 lt!286138)))))))

(assert (=> b!185515 (= lt!286119 (BitStream!7757 (buf!4784 (_2!8671 lt!286138)) (currentByte!9028 thiss!1204) (currentBit!9023 thiss!1204)))))

(declare-fun res!154412 () Bool)

(declare-fun e!128425 () Bool)

(assert (=> start!40418 (=> (not res!154412) (not e!128425))))

(assert (=> start!40418 (= res!154412 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!40418 e!128425))

(assert (=> start!40418 true))

(declare-fun e!128431 () Bool)

(declare-fun inv!12 (BitStream!7756) Bool)

(assert (=> start!40418 (and (inv!12 thiss!1204) e!128431)))

(declare-fun b!185516 () Bool)

(declare-fun res!154397 () Bool)

(declare-fun e!128436 () Bool)

(assert (=> b!185516 (=> (not res!154397) (not e!128436))))

(assert (=> b!185516 (= res!154397 (invariant!0 (currentBit!9023 thiss!1204) (currentByte!9028 thiss!1204) (size!4324 (buf!4784 thiss!1204))))))

(declare-fun b!185517 () Bool)

(declare-fun lt!286121 () (_ BitVec 64))

(declare-fun e!128427 () Bool)

(declare-fun lt!286120 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!7756 (_ BitVec 64)) BitStream!7756)

(assert (=> b!185517 (= e!128427 (= (_1!8669 lt!286127) (withMovedBitIndex!0 (_2!8669 lt!286127) (bvsub lt!286121 lt!286120))))))

(declare-fun b!185518 () Bool)

(declare-fun res!154413 () Bool)

(assert (=> b!185518 (=> res!154413 e!128429)))

(assert (=> b!185518 (= res!154413 (or (not (= (size!4324 (buf!4784 (_2!8671 lt!286144))) (size!4324 (buf!4784 thiss!1204)))) (not (= lt!286120 (bvsub (bvadd lt!286121 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!185519 () Bool)

(declare-fun res!154401 () Bool)

(assert (=> b!185519 (=> res!154401 e!128429)))

(declare-fun isPrefixOf!0 (BitStream!7756 BitStream!7756) Bool)

(assert (=> b!185519 (= res!154401 (not (isPrefixOf!0 (_2!8671 lt!286138) (_2!8671 lt!286144))))))

(declare-fun b!185520 () Bool)

(declare-fun res!154404 () Bool)

(assert (=> b!185520 (=> (not res!154404) (not e!128436))))

(assert (=> b!185520 (= res!154404 (not (= i!590 nBits!348)))))

(declare-fun b!185521 () Bool)

(assert (=> b!185521 (= e!128434 (= (_2!8672 lt!286124) (_2!8672 lt!286129)))))

(declare-fun b!185522 () Bool)

(declare-fun res!154408 () Bool)

(declare-fun e!128437 () Bool)

(assert (=> b!185522 (=> (not res!154408) (not e!128437))))

(assert (=> b!185522 (= res!154408 (isPrefixOf!0 thiss!1204 (_2!8671 lt!286138)))))

(declare-fun b!185523 () Bool)

(declare-fun e!128428 () Bool)

(assert (=> b!185523 (= e!128436 (not e!128428))))

(declare-fun res!154399 () Bool)

(assert (=> b!185523 (=> res!154399 e!128428)))

(declare-fun lt!286126 () (_ BitVec 64))

(assert (=> b!185523 (= res!154399 (not (= lt!286126 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!286121))))))

(assert (=> b!185523 (= lt!286126 (bitIndex!0 (size!4324 (buf!4784 (_2!8671 lt!286138))) (currentByte!9028 (_2!8671 lt!286138)) (currentBit!9023 (_2!8671 lt!286138))))))

(assert (=> b!185523 (= lt!286121 (bitIndex!0 (size!4324 (buf!4784 thiss!1204)) (currentByte!9028 thiss!1204) (currentBit!9023 thiss!1204)))))

(declare-fun e!128426 () Bool)

(assert (=> b!185523 e!128426))

(declare-fun res!154400 () Bool)

(assert (=> b!185523 (=> (not res!154400) (not e!128426))))

(assert (=> b!185523 (= res!154400 (= (size!4324 (buf!4784 thiss!1204)) (size!4324 (buf!4784 (_2!8671 lt!286138)))))))

(declare-fun appendBit!0 (BitStream!7756 Bool) tuple2!16052)

(assert (=> b!185523 (= lt!286138 (appendBit!0 thiss!1204 lt!286123))))

(assert (=> b!185523 (= lt!286123 (not (= (bvand v!189 lt!286140) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!185523 (= lt!286140 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!185524 () Bool)

(assert (=> b!185524 (= e!128426 e!128437)))

(declare-fun res!154406 () Bool)

(assert (=> b!185524 (=> (not res!154406) (not e!128437))))

(declare-fun lt!286132 () (_ BitVec 64))

(declare-fun lt!286137 () (_ BitVec 64))

(assert (=> b!185524 (= res!154406 (= lt!286132 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!286137)))))

(assert (=> b!185524 (= lt!286132 (bitIndex!0 (size!4324 (buf!4784 (_2!8671 lt!286138))) (currentByte!9028 (_2!8671 lt!286138)) (currentBit!9023 (_2!8671 lt!286138))))))

(assert (=> b!185524 (= lt!286137 (bitIndex!0 (size!4324 (buf!4784 thiss!1204)) (currentByte!9028 thiss!1204) (currentBit!9023 thiss!1204)))))

(declare-fun b!185525 () Bool)

(declare-fun array_inv!4065 (array!9805) Bool)

(assert (=> b!185525 (= e!128431 (array_inv!4065 (buf!4784 thiss!1204)))))

(declare-fun b!185526 () Bool)

(declare-fun res!154403 () Bool)

(assert (=> b!185526 (=> res!154403 e!128429)))

(assert (=> b!185526 (= res!154403 (not (isPrefixOf!0 thiss!1204 (_2!8671 lt!286138))))))

(declare-fun b!185527 () Bool)

(declare-fun res!154398 () Bool)

(assert (=> b!185527 (=> res!154398 e!128429)))

(assert (=> b!185527 (= res!154398 (not (invariant!0 (currentBit!9023 (_2!8671 lt!286144)) (currentByte!9028 (_2!8671 lt!286144)) (size!4324 (buf!4784 (_2!8671 lt!286144))))))))

(declare-fun b!185528 () Bool)

(assert (=> b!185528 (= e!128433 true)))

(assert (=> b!185528 e!128427))

(declare-fun res!154411 () Bool)

(assert (=> b!185528 (=> (not res!154411) (not e!128427))))

(declare-fun lt!286142 () tuple2!16050)

(assert (=> b!185528 (= res!154411 (and (= (_2!8670 lt!286125) (_2!8670 lt!286142)) (= (_1!8670 lt!286125) (_1!8670 lt!286142))))))

(declare-fun lt!286143 () Unit!13278)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7756 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13278)

(assert (=> b!185528 (= lt!286143 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8669 lt!286127) nBits!348 i!590 lt!286139))))

(assert (=> b!185528 (= lt!286142 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8669 lt!286127) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!286118))))

(declare-fun b!185529 () Bool)

(declare-fun e!128435 () Bool)

(declare-fun lt!286128 () tuple2!16054)

(assert (=> b!185529 (= e!128435 (= (bitIndex!0 (size!4324 (buf!4784 (_1!8672 lt!286128))) (currentByte!9028 (_1!8672 lt!286128)) (currentBit!9023 (_1!8672 lt!286128))) lt!286132))))

(declare-fun b!185530 () Bool)

(assert (=> b!185530 (= e!128437 e!128435)))

(declare-fun res!154402 () Bool)

(assert (=> b!185530 (=> (not res!154402) (not e!128435))))

(assert (=> b!185530 (= res!154402 (and (= (_2!8672 lt!286128) lt!286123) (= (_1!8672 lt!286128) (_2!8671 lt!286138))))))

(declare-fun readerFrom!0 (BitStream!7756 (_ BitVec 32) (_ BitVec 32)) BitStream!7756)

(assert (=> b!185530 (= lt!286128 (readBitPure!0 (readerFrom!0 (_2!8671 lt!286138) (currentBit!9023 thiss!1204) (currentByte!9028 thiss!1204))))))

(declare-fun b!185531 () Bool)

(assert (=> b!185531 (= e!128428 e!128429)))

(declare-fun res!154410 () Bool)

(assert (=> b!185531 (=> res!154410 e!128429)))

(assert (=> b!185531 (= res!154410 (not (= lt!286120 (bvsub (bvsub (bvadd lt!286126 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!185531 (= lt!286120 (bitIndex!0 (size!4324 (buf!4784 (_2!8671 lt!286144))) (currentByte!9028 (_2!8671 lt!286144)) (currentBit!9023 (_2!8671 lt!286144))))))

(assert (=> b!185531 (isPrefixOf!0 thiss!1204 (_2!8671 lt!286144))))

(declare-fun lt!286141 () Unit!13278)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7756 BitStream!7756 BitStream!7756) Unit!13278)

(assert (=> b!185531 (= lt!286141 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8671 lt!286138) (_2!8671 lt!286144)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7756 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!16052)

(assert (=> b!185531 (= lt!286144 (appendBitsLSBFirstLoopTR!0 (_2!8671 lt!286138) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!185532 () Bool)

(assert (=> b!185532 (= e!128425 e!128436)))

(declare-fun res!154409 () Bool)

(assert (=> b!185532 (=> (not res!154409) (not e!128436))))

(assert (=> b!185532 (= res!154409 (validate_offset_bits!1 ((_ sign_extend 32) (size!4324 (buf!4784 thiss!1204))) ((_ sign_extend 32) (currentByte!9028 thiss!1204)) ((_ sign_extend 32) (currentBit!9023 thiss!1204)) lt!286134))))

(assert (=> b!185532 (= lt!286134 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!185533 () Bool)

(assert (=> b!185533 (= e!128432 (invariant!0 (currentBit!9023 thiss!1204) (currentByte!9028 thiss!1204) (size!4324 (buf!4784 (_2!8671 lt!286144)))))))

(assert (= (and start!40418 res!154412) b!185532))

(assert (= (and b!185532 res!154409) b!185516))

(assert (= (and b!185516 res!154397) b!185520))

(assert (= (and b!185520 res!154404) b!185523))

(assert (= (and b!185523 res!154400) b!185524))

(assert (= (and b!185524 res!154406) b!185522))

(assert (= (and b!185522 res!154408) b!185530))

(assert (= (and b!185530 res!154402) b!185529))

(assert (= (and b!185523 (not res!154399)) b!185531))

(assert (= (and b!185531 (not res!154410)) b!185527))

(assert (= (and b!185527 (not res!154398)) b!185518))

(assert (= (and b!185518 (not res!154413)) b!185519))

(assert (= (and b!185519 (not res!154401)) b!185526))

(assert (= (and b!185526 (not res!154403)) b!185515))

(assert (= (and b!185515 res!154396) b!185533))

(assert (= (and b!185515 res!154405) b!185521))

(assert (= (and b!185515 (not res!154407)) b!185528))

(assert (= (and b!185528 res!154411) b!185517))

(assert (= start!40418 b!185525))

(declare-fun m!288379 () Bool)

(assert (=> b!185525 m!288379))

(declare-fun m!288381 () Bool)

(assert (=> b!185523 m!288381))

(declare-fun m!288383 () Bool)

(assert (=> b!185523 m!288383))

(declare-fun m!288385 () Bool)

(assert (=> b!185523 m!288385))

(declare-fun m!288387 () Bool)

(assert (=> b!185527 m!288387))

(declare-fun m!288389 () Bool)

(assert (=> b!185516 m!288389))

(declare-fun m!288391 () Bool)

(assert (=> start!40418 m!288391))

(declare-fun m!288393 () Bool)

(assert (=> b!185517 m!288393))

(declare-fun m!288395 () Bool)

(assert (=> b!185522 m!288395))

(declare-fun m!288397 () Bool)

(assert (=> b!185533 m!288397))

(declare-fun m!288399 () Bool)

(assert (=> b!185529 m!288399))

(assert (=> b!185524 m!288381))

(assert (=> b!185524 m!288383))

(declare-fun m!288401 () Bool)

(assert (=> b!185532 m!288401))

(declare-fun m!288403 () Bool)

(assert (=> b!185515 m!288403))

(declare-fun m!288405 () Bool)

(assert (=> b!185515 m!288405))

(declare-fun m!288407 () Bool)

(assert (=> b!185515 m!288407))

(declare-fun m!288409 () Bool)

(assert (=> b!185515 m!288409))

(declare-fun m!288411 () Bool)

(assert (=> b!185515 m!288411))

(declare-fun m!288413 () Bool)

(assert (=> b!185515 m!288413))

(declare-fun m!288415 () Bool)

(assert (=> b!185515 m!288415))

(declare-fun m!288417 () Bool)

(assert (=> b!185515 m!288417))

(declare-fun m!288419 () Bool)

(assert (=> b!185515 m!288419))

(declare-fun m!288421 () Bool)

(assert (=> b!185515 m!288421))

(declare-fun m!288423 () Bool)

(assert (=> b!185515 m!288423))

(declare-fun m!288425 () Bool)

(assert (=> b!185515 m!288425))

(declare-fun m!288427 () Bool)

(assert (=> b!185515 m!288427))

(declare-fun m!288429 () Bool)

(assert (=> b!185515 m!288429))

(declare-fun m!288431 () Bool)

(assert (=> b!185515 m!288431))

(declare-fun m!288433 () Bool)

(assert (=> b!185515 m!288433))

(declare-fun m!288435 () Bool)

(assert (=> b!185531 m!288435))

(declare-fun m!288437 () Bool)

(assert (=> b!185531 m!288437))

(declare-fun m!288439 () Bool)

(assert (=> b!185531 m!288439))

(declare-fun m!288441 () Bool)

(assert (=> b!185531 m!288441))

(declare-fun m!288443 () Bool)

(assert (=> b!185519 m!288443))

(declare-fun m!288445 () Bool)

(assert (=> b!185530 m!288445))

(assert (=> b!185530 m!288445))

(declare-fun m!288447 () Bool)

(assert (=> b!185530 m!288447))

(assert (=> b!185526 m!288395))

(declare-fun m!288449 () Bool)

(assert (=> b!185528 m!288449))

(declare-fun m!288451 () Bool)

(assert (=> b!185528 m!288451))

(assert (=> b!185528 m!288451))

(declare-fun m!288453 () Bool)

(assert (=> b!185528 m!288453))

(push 1)

(assert (not b!185523))

(assert (not b!185531))

(assert (not b!185525))

(assert (not b!185522))

(assert (not b!185530))

