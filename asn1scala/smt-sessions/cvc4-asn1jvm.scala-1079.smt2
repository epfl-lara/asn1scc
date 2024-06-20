; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31052 () Bool)

(assert start!31052)

(declare-fun b!156785 () Bool)

(declare-fun res!131036 () Bool)

(declare-fun e!106034 () Bool)

(assert (=> b!156785 (=> res!131036 e!106034)))

(declare-datatypes ((array!7210 0))(
  ( (array!7211 (arr!4105 (Array (_ BitVec 32) (_ BitVec 8))) (size!3240 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5726 0))(
  ( (BitStream!5727 (buf!3737 array!7210) (currentByte!6864 (_ BitVec 32)) (currentBit!6859 (_ BitVec 32))) )
))
(declare-fun lt!245410 () BitStream!5726)

(declare-fun from!240 () (_ BitVec 32))

(declare-fun lt!245409 () (_ BitVec 64))

(declare-fun to!236 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!156785 (= res!131036 (not (validate_offset_bytes!0 ((_ sign_extend 32) (size!3240 (buf!3737 lt!245410))) lt!245409 ((_ sign_extend 32) (currentBit!6859 lt!245410)) (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)))))))

(declare-fun b!156786 () Bool)

(declare-fun e!106033 () Bool)

(declare-fun e!106035 () Bool)

(assert (=> b!156786 (= e!106033 e!106035)))

(declare-fun res!131035 () Bool)

(assert (=> b!156786 (=> (not res!131035) (not e!106035))))

(assert (=> b!156786 (= res!131035 (not (= from!240 (bvsub to!236 #b00000000000000000000000000000001))))))

(declare-datatypes ((tuple2!14076 0))(
  ( (tuple2!14077 (_1!7482 BitStream!5726) (_2!7482 array!7210)) )
))
(declare-fun lt!245412 () tuple2!14076)

(declare-fun bs!65 () BitStream!5726)

(declare-fun arr!153 () array!7210)

(declare-fun readByteArrayLoopPure!0 (BitStream!5726 array!7210 (_ BitVec 32) (_ BitVec 32)) tuple2!14076)

(declare-datatypes ((tuple2!14078 0))(
  ( (tuple2!14079 (_1!7483 BitStream!5726) (_2!7483 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!5726) tuple2!14078)

(assert (=> b!156786 (= lt!245412 (readByteArrayLoopPure!0 lt!245410 (array!7211 (store (arr!4105 arr!153) from!240 (_2!7483 (readBytePure!0 bs!65))) (size!3240 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun withMovedByteIndex!0 (BitStream!5726 (_ BitVec 32)) BitStream!5726)

(assert (=> b!156786 (= lt!245410 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun lt!245406 () tuple2!14076)

(assert (=> b!156786 (= lt!245406 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!156788 () Bool)

(assert (=> b!156788 (= e!106035 (not e!106034))))

(declare-fun res!131038 () Bool)

(assert (=> b!156788 (=> res!131038 e!106034)))

(assert (=> b!156788 (= res!131038 (or (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)) (bvsge (bvadd #b00000000000000000000000000000001 from!240) to!236)))))

(assert (=> b!156788 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3240 (buf!3737 lt!245410))) lt!245409 ((_ sign_extend 32) (currentBit!6859 lt!245410)) (bvsub (bvsub to!236 from!240) #b00000000000000000000000000000001))))

(assert (=> b!156788 (= lt!245409 ((_ sign_extend 32) (currentByte!6864 lt!245410)))))

(declare-datatypes ((Unit!10148 0))(
  ( (Unit!10149) )
))
(declare-fun lt!245407 () Unit!10148)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5726 BitStream!5726 (_ BitVec 64) (_ BitVec 32)) Unit!10148)

(assert (=> b!156788 (= lt!245407 (validateOffsetBytesFromBitIndexLemma!0 bs!65 lt!245410 #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!236 from!240)))))

(declare-fun lt!245408 () tuple2!14078)

(assert (=> b!156788 (= lt!245408 (readBytePure!0 lt!245410))))

(declare-fun b!156789 () Bool)

(assert (=> b!156789 (= e!106034 true)))

(declare-fun lt!245413 () tuple2!14076)

(assert (=> b!156789 (= lt!245413 (readByteArrayLoopPure!0 (withMovedByteIndex!0 lt!245410 #b00000000000000000000000000000001) (array!7211 (store (store (arr!4105 arr!153) from!240 (_2!7483 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7483 lt!245408)) (size!3240 arr!153)) (bvadd #b00000000000000000000000000000010 from!240) to!236))))

(declare-fun lt!245411 () (Array (_ BitVec 32) (_ BitVec 8)))

(assert (=> b!156789 (= lt!245411 (store (arr!4105 arr!153) from!240 (_2!7483 (readBytePure!0 bs!65))))))

(declare-fun b!156790 () Bool)

(declare-fun res!131037 () Bool)

(assert (=> b!156790 (=> (not res!131037) (not e!106033))))

(assert (=> b!156790 (= res!131037 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3240 (buf!3737 bs!65))) ((_ sign_extend 32) (currentByte!6864 bs!65)) ((_ sign_extend 32) (currentBit!6859 bs!65)) (bvsub to!236 from!240)))))

(declare-fun b!156787 () Bool)

(declare-fun e!106036 () Bool)

(declare-fun array_inv!3023 (array!7210) Bool)

(assert (=> b!156787 (= e!106036 (array_inv!3023 (buf!3737 bs!65)))))

(declare-fun res!131039 () Bool)

(assert (=> start!31052 (=> (not res!131039) (not e!106033))))

(assert (=> start!31052 (= res!131039 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3240 arr!153))))))

(assert (=> start!31052 e!106033))

(assert (=> start!31052 true))

(assert (=> start!31052 (array_inv!3023 arr!153)))

(declare-fun inv!12 (BitStream!5726) Bool)

(assert (=> start!31052 (and (inv!12 bs!65) e!106036)))

(assert (= (and start!31052 res!131039) b!156790))

(assert (= (and b!156790 res!131037) b!156786))

(assert (= (and b!156786 res!131035) b!156788))

(assert (= (and b!156788 (not res!131038)) b!156785))

(assert (= (and b!156785 (not res!131036)) b!156789))

(assert (= start!31052 b!156787))

(declare-fun m!244441 () Bool)

(assert (=> b!156785 m!244441))

(declare-fun m!244443 () Bool)

(assert (=> b!156787 m!244443))

(declare-fun m!244445 () Bool)

(assert (=> b!156789 m!244445))

(declare-fun m!244447 () Bool)

(assert (=> b!156789 m!244447))

(declare-fun m!244449 () Bool)

(assert (=> b!156789 m!244449))

(assert (=> b!156789 m!244445))

(declare-fun m!244451 () Bool)

(assert (=> b!156789 m!244451))

(declare-fun m!244453 () Bool)

(assert (=> b!156789 m!244453))

(declare-fun m!244455 () Bool)

(assert (=> b!156790 m!244455))

(declare-fun m!244457 () Bool)

(assert (=> b!156786 m!244457))

(assert (=> b!156786 m!244447))

(declare-fun m!244459 () Bool)

(assert (=> b!156786 m!244459))

(assert (=> b!156786 m!244449))

(declare-fun m!244461 () Bool)

(assert (=> b!156786 m!244461))

(declare-fun m!244463 () Bool)

(assert (=> start!31052 m!244463))

(declare-fun m!244465 () Bool)

(assert (=> start!31052 m!244465))

(declare-fun m!244467 () Bool)

(assert (=> b!156788 m!244467))

(declare-fun m!244469 () Bool)

(assert (=> b!156788 m!244469))

(declare-fun m!244471 () Bool)

(assert (=> b!156788 m!244471))

(push 1)

