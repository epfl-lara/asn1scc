; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31058 () Bool)

(assert start!31058)

(declare-fun b!156839 () Bool)

(declare-fun res!131080 () Bool)

(declare-fun e!106091 () Bool)

(assert (=> b!156839 (=> (not res!131080) (not e!106091))))

(declare-datatypes ((array!7216 0))(
  ( (array!7217 (arr!4114 (Array (_ BitVec 32) (_ BitVec 8))) (size!3249 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5732 0))(
  ( (BitStream!5733 (buf!3740 array!7216) (currentByte!6867 (_ BitVec 32)) (currentBit!6862 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5732)

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!156839 (= res!131080 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3249 (buf!3740 bs!65))) ((_ sign_extend 32) (currentByte!6867 bs!65)) ((_ sign_extend 32) (currentBit!6862 bs!65)) (bvsub to!236 from!240)))))

(declare-fun b!156840 () Bool)

(declare-fun e!106087 () Bool)

(assert (=> b!156840 (= e!106087 true)))

(declare-datatypes ((tuple2!14088 0))(
  ( (tuple2!14089 (_1!7488 BitStream!5732) (_2!7488 (_ BitVec 8))) )
))
(declare-fun lt!245483 () tuple2!14088)

(declare-datatypes ((tuple2!14090 0))(
  ( (tuple2!14091 (_1!7489 BitStream!5732) (_2!7489 array!7216)) )
))
(declare-fun lt!245485 () tuple2!14090)

(declare-fun arr!153 () array!7216)

(declare-fun lt!245481 () BitStream!5732)

(declare-fun readByteArrayLoopPure!0 (BitStream!5732 array!7216 (_ BitVec 32) (_ BitVec 32)) tuple2!14090)

(declare-fun withMovedByteIndex!0 (BitStream!5732 (_ BitVec 32)) BitStream!5732)

(declare-fun readBytePure!0 (BitStream!5732) tuple2!14088)

(assert (=> b!156840 (= lt!245485 (readByteArrayLoopPure!0 (withMovedByteIndex!0 lt!245481 #b00000000000000000000000000000001) (array!7217 (store (store (arr!4114 arr!153) from!240 (_2!7488 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7488 lt!245483)) (size!3249 arr!153)) (bvadd #b00000000000000000000000000000010 from!240) to!236))))

(declare-fun lt!245479 () (Array (_ BitVec 32) (_ BitVec 8)))

(assert (=> b!156840 (= lt!245479 (store (arr!4114 arr!153) from!240 (_2!7488 (readBytePure!0 bs!65))))))

(declare-fun b!156842 () Bool)

(declare-fun e!106088 () Bool)

(assert (=> b!156842 (= e!106088 (not e!106087))))

(declare-fun res!131081 () Bool)

(assert (=> b!156842 (=> res!131081 e!106087)))

(assert (=> b!156842 (= res!131081 (or (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)) (bvsge (bvadd #b00000000000000000000000000000001 from!240) to!236)))))

(declare-fun lt!245480 () (_ BitVec 64))

(assert (=> b!156842 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3249 (buf!3740 lt!245481))) lt!245480 ((_ sign_extend 32) (currentBit!6862 lt!245481)) (bvsub (bvsub to!236 from!240) #b00000000000000000000000000000001))))

(assert (=> b!156842 (= lt!245480 ((_ sign_extend 32) (currentByte!6867 lt!245481)))))

(declare-datatypes ((Unit!10154 0))(
  ( (Unit!10155) )
))
(declare-fun lt!245482 () Unit!10154)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5732 BitStream!5732 (_ BitVec 64) (_ BitVec 32)) Unit!10154)

(assert (=> b!156842 (= lt!245482 (validateOffsetBytesFromBitIndexLemma!0 bs!65 lt!245481 #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!236 from!240)))))

(assert (=> b!156842 (= lt!245483 (readBytePure!0 lt!245481))))

(declare-fun res!131084 () Bool)

(assert (=> start!31058 (=> (not res!131084) (not e!106091))))

(assert (=> start!31058 (= res!131084 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3249 arr!153))))))

(assert (=> start!31058 e!106091))

(assert (=> start!31058 true))

(declare-fun array_inv!3026 (array!7216) Bool)

(assert (=> start!31058 (array_inv!3026 arr!153)))

(declare-fun e!106090 () Bool)

(declare-fun inv!12 (BitStream!5732) Bool)

(assert (=> start!31058 (and (inv!12 bs!65) e!106090)))

(declare-fun b!156841 () Bool)

(assert (=> b!156841 (= e!106090 (array_inv!3026 (buf!3740 bs!65)))))

(declare-fun b!156843 () Bool)

(assert (=> b!156843 (= e!106091 e!106088)))

(declare-fun res!131083 () Bool)

(assert (=> b!156843 (=> (not res!131083) (not e!106088))))

(assert (=> b!156843 (= res!131083 (not (= from!240 (bvsub to!236 #b00000000000000000000000000000001))))))

(declare-fun lt!245478 () tuple2!14090)

(assert (=> b!156843 (= lt!245478 (readByteArrayLoopPure!0 lt!245481 (array!7217 (store (arr!4114 arr!153) from!240 (_2!7488 (readBytePure!0 bs!65))) (size!3249 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> b!156843 (= lt!245481 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun lt!245484 () tuple2!14090)

(assert (=> b!156843 (= lt!245484 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!156844 () Bool)

(declare-fun res!131082 () Bool)

(assert (=> b!156844 (=> res!131082 e!106087)))

(assert (=> b!156844 (= res!131082 (not (validate_offset_bytes!0 ((_ sign_extend 32) (size!3249 (buf!3740 lt!245481))) lt!245480 ((_ sign_extend 32) (currentBit!6862 lt!245481)) (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)))))))

(assert (= (and start!31058 res!131084) b!156839))

(assert (= (and b!156839 res!131080) b!156843))

(assert (= (and b!156843 res!131083) b!156842))

(assert (= (and b!156842 (not res!131081)) b!156844))

(assert (= (and b!156844 (not res!131082)) b!156840))

(assert (= start!31058 b!156841))

(declare-fun m!244537 () Bool)

(assert (=> b!156842 m!244537))

(declare-fun m!244539 () Bool)

(assert (=> b!156842 m!244539))

(declare-fun m!244541 () Bool)

(assert (=> b!156842 m!244541))

(declare-fun m!244543 () Bool)

(assert (=> b!156844 m!244543))

(declare-fun m!244545 () Bool)

(assert (=> b!156839 m!244545))

(declare-fun m!244547 () Bool)

(assert (=> start!31058 m!244547))

(declare-fun m!244549 () Bool)

(assert (=> start!31058 m!244549))

(declare-fun m!244551 () Bool)

(assert (=> b!156840 m!244551))

(declare-fun m!244553 () Bool)

(assert (=> b!156840 m!244553))

(declare-fun m!244555 () Bool)

(assert (=> b!156840 m!244555))

(declare-fun m!244557 () Bool)

(assert (=> b!156840 m!244557))

(assert (=> b!156840 m!244557))

(declare-fun m!244559 () Bool)

(assert (=> b!156840 m!244559))

(declare-fun m!244561 () Bool)

(assert (=> b!156841 m!244561))

(assert (=> b!156843 m!244551))

(declare-fun m!244563 () Bool)

(assert (=> b!156843 m!244563))

(assert (=> b!156843 m!244555))

(declare-fun m!244565 () Bool)

(assert (=> b!156843 m!244565))

(declare-fun m!244567 () Bool)

(assert (=> b!156843 m!244567))

(push 1)

(assert (not b!156839))

(assert (not b!156841))

(assert (not b!156840))

(assert (not start!31058))

(assert (not b!156843))

(assert (not b!156842))

(assert (not b!156844))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

