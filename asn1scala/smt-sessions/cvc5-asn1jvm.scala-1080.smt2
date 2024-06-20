; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31054 () Bool)

(assert start!31054)

(declare-fun b!156803 () Bool)

(declare-fun res!131054 () Bool)

(declare-fun e!106055 () Bool)

(assert (=> b!156803 (=> res!131054 e!106055)))

(declare-datatypes ((array!7212 0))(
  ( (array!7213 (arr!4108 (Array (_ BitVec 32) (_ BitVec 8))) (size!3243 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5728 0))(
  ( (BitStream!5729 (buf!3738 array!7212) (currentByte!6865 (_ BitVec 32)) (currentBit!6860 (_ BitVec 32))) )
))
(declare-fun lt!245436 () BitStream!5728)

(declare-fun from!240 () (_ BitVec 32))

(declare-fun lt!245434 () (_ BitVec 64))

(declare-fun to!236 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!156803 (= res!131054 (not (validate_offset_bytes!0 ((_ sign_extend 32) (size!3243 (buf!3738 lt!245436))) lt!245434 ((_ sign_extend 32) (currentBit!6860 lt!245436)) (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)))))))

(declare-fun b!156804 () Bool)

(declare-fun e!106050 () Bool)

(assert (=> b!156804 (= e!106050 (not e!106055))))

(declare-fun res!131051 () Bool)

(assert (=> b!156804 (=> res!131051 e!106055)))

(assert (=> b!156804 (= res!131051 (or (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)) (bvsge (bvadd #b00000000000000000000000000000001 from!240) to!236)))))

(assert (=> b!156804 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3243 (buf!3738 lt!245436))) lt!245434 ((_ sign_extend 32) (currentBit!6860 lt!245436)) (bvsub (bvsub to!236 from!240) #b00000000000000000000000000000001))))

(assert (=> b!156804 (= lt!245434 ((_ sign_extend 32) (currentByte!6865 lt!245436)))))

(declare-fun bs!65 () BitStream!5728)

(declare-datatypes ((Unit!10150 0))(
  ( (Unit!10151) )
))
(declare-fun lt!245430 () Unit!10150)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5728 BitStream!5728 (_ BitVec 64) (_ BitVec 32)) Unit!10150)

(assert (=> b!156804 (= lt!245430 (validateOffsetBytesFromBitIndexLemma!0 bs!65 lt!245436 #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!236 from!240)))))

(declare-datatypes ((tuple2!14080 0))(
  ( (tuple2!14081 (_1!7484 BitStream!5728) (_2!7484 (_ BitVec 8))) )
))
(declare-fun lt!245437 () tuple2!14080)

(declare-fun readBytePure!0 (BitStream!5728) tuple2!14080)

(assert (=> b!156804 (= lt!245437 (readBytePure!0 lt!245436))))

(declare-fun b!156805 () Bool)

(declare-fun e!106052 () Bool)

(declare-fun array_inv!3024 (array!7212) Bool)

(assert (=> b!156805 (= e!106052 (array_inv!3024 (buf!3738 bs!65)))))

(declare-fun b!156806 () Bool)

(assert (=> b!156806 (= e!106055 true)))

(declare-datatypes ((tuple2!14082 0))(
  ( (tuple2!14083 (_1!7485 BitStream!5728) (_2!7485 array!7212)) )
))
(declare-fun lt!245435 () tuple2!14082)

(declare-fun arr!153 () array!7212)

(declare-fun readByteArrayLoopPure!0 (BitStream!5728 array!7212 (_ BitVec 32) (_ BitVec 32)) tuple2!14082)

(declare-fun withMovedByteIndex!0 (BitStream!5728 (_ BitVec 32)) BitStream!5728)

(assert (=> b!156806 (= lt!245435 (readByteArrayLoopPure!0 (withMovedByteIndex!0 lt!245436 #b00000000000000000000000000000001) (array!7213 (store (store (arr!4108 arr!153) from!240 (_2!7484 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7484 lt!245437)) (size!3243 arr!153)) (bvadd #b00000000000000000000000000000010 from!240) to!236))))

(declare-fun lt!245433 () (Array (_ BitVec 32) (_ BitVec 8)))

(assert (=> b!156806 (= lt!245433 (store (arr!4108 arr!153) from!240 (_2!7484 (readBytePure!0 bs!65))))))

(declare-fun b!156807 () Bool)

(declare-fun e!106051 () Bool)

(assert (=> b!156807 (= e!106051 e!106050)))

(declare-fun res!131050 () Bool)

(assert (=> b!156807 (=> (not res!131050) (not e!106050))))

(assert (=> b!156807 (= res!131050 (not (= from!240 (bvsub to!236 #b00000000000000000000000000000001))))))

(declare-fun lt!245431 () tuple2!14082)

(assert (=> b!156807 (= lt!245431 (readByteArrayLoopPure!0 lt!245436 (array!7213 (store (arr!4108 arr!153) from!240 (_2!7484 (readBytePure!0 bs!65))) (size!3243 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> b!156807 (= lt!245436 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun lt!245432 () tuple2!14082)

(assert (=> b!156807 (= lt!245432 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!156808 () Bool)

(declare-fun res!131052 () Bool)

(assert (=> b!156808 (=> (not res!131052) (not e!106051))))

(assert (=> b!156808 (= res!131052 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3243 (buf!3738 bs!65))) ((_ sign_extend 32) (currentByte!6865 bs!65)) ((_ sign_extend 32) (currentBit!6860 bs!65)) (bvsub to!236 from!240)))))

(declare-fun res!131053 () Bool)

(assert (=> start!31054 (=> (not res!131053) (not e!106051))))

(assert (=> start!31054 (= res!131053 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3243 arr!153))))))

(assert (=> start!31054 e!106051))

(assert (=> start!31054 true))

(assert (=> start!31054 (array_inv!3024 arr!153)))

(declare-fun inv!12 (BitStream!5728) Bool)

(assert (=> start!31054 (and (inv!12 bs!65) e!106052)))

(assert (= (and start!31054 res!131053) b!156808))

(assert (= (and b!156808 res!131052) b!156807))

(assert (= (and b!156807 res!131050) b!156804))

(assert (= (and b!156804 (not res!131051)) b!156803))

(assert (= (and b!156803 (not res!131054)) b!156806))

(assert (= start!31054 b!156805))

(declare-fun m!244473 () Bool)

(assert (=> b!156808 m!244473))

(declare-fun m!244475 () Bool)

(assert (=> b!156806 m!244475))

(declare-fun m!244477 () Bool)

(assert (=> b!156806 m!244477))

(declare-fun m!244479 () Bool)

(assert (=> b!156806 m!244479))

(declare-fun m!244481 () Bool)

(assert (=> b!156806 m!244481))

(assert (=> b!156806 m!244475))

(declare-fun m!244483 () Bool)

(assert (=> b!156806 m!244483))

(assert (=> b!156807 m!244479))

(assert (=> b!156807 m!244481))

(declare-fun m!244485 () Bool)

(assert (=> b!156807 m!244485))

(declare-fun m!244487 () Bool)

(assert (=> b!156807 m!244487))

(declare-fun m!244489 () Bool)

(assert (=> b!156807 m!244489))

(declare-fun m!244491 () Bool)

(assert (=> b!156804 m!244491))

(declare-fun m!244493 () Bool)

(assert (=> b!156804 m!244493))

(declare-fun m!244495 () Bool)

(assert (=> b!156804 m!244495))

(declare-fun m!244497 () Bool)

(assert (=> b!156803 m!244497))

(declare-fun m!244499 () Bool)

(assert (=> b!156805 m!244499))

(declare-fun m!244501 () Bool)

(assert (=> start!31054 m!244501))

(declare-fun m!244503 () Bool)

(assert (=> start!31054 m!244503))

(push 1)

(assert (not b!156806))

(assert (not start!31054))

(assert (not b!156803))

(assert (not b!156808))

(assert (not b!156804))

(assert (not b!156805))

(assert (not b!156807))

(check-sat)

(pop 1)

