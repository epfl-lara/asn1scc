; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31302 () Bool)

(assert start!31302)

(declare-fun res!131548 () Bool)

(declare-fun e!106670 () Bool)

(assert (=> start!31302 (=> (not res!131548) (not e!106670))))

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(declare-datatypes ((array!7274 0))(
  ( (array!7275 (arr!4182 (Array (_ BitVec 32) (_ BitVec 8))) (size!3293 (_ BitVec 32))) )
))
(declare-fun arr!153 () array!7274)

(assert (=> start!31302 (= res!131548 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3293 arr!153))))))

(assert (=> start!31302 e!106670))

(assert (=> start!31302 true))

(declare-fun array_inv!3052 (array!7274) Bool)

(assert (=> start!31302 (array_inv!3052 arr!153)))

(declare-datatypes ((BitStream!5778 0))(
  ( (BitStream!5779 (buf!3763 array!7274) (currentByte!6908 (_ BitVec 32)) (currentBit!6903 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5778)

(declare-fun e!106668 () Bool)

(declare-fun inv!12 (BitStream!5778) Bool)

(assert (=> start!31302 (and (inv!12 bs!65) e!106668)))

(declare-fun b!157430 () Bool)

(declare-fun res!131549 () Bool)

(assert (=> b!157430 (=> (not res!131549) (not e!106670))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!157430 (= res!131549 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3293 (buf!3763 bs!65))) ((_ sign_extend 32) (currentByte!6908 bs!65)) ((_ sign_extend 32) (currentBit!6903 bs!65)) (bvsub to!236 from!240)))))

(declare-fun b!157431 () Bool)

(assert (=> b!157431 (= e!106670 (and (not (= (bvand to!236 #b10000000000000000000000000000000) #b00000000000000000000000000000000)) (not (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvsub to!236 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))))

(declare-datatypes ((tuple2!14216 0))(
  ( (tuple2!14217 (_1!7558 BitStream!5778) (_2!7558 array!7274)) )
))
(declare-fun lt!247317 () tuple2!14216)

(declare-fun readByteArrayLoopPure!0 (BitStream!5778 array!7274 (_ BitVec 32) (_ BitVec 32)) tuple2!14216)

(declare-fun withMovedByteIndex!0 (BitStream!5778 (_ BitVec 32)) BitStream!5778)

(declare-datatypes ((tuple2!14218 0))(
  ( (tuple2!14219 (_1!7559 BitStream!5778) (_2!7559 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!5778) tuple2!14218)

(assert (=> b!157431 (= lt!247317 (readByteArrayLoopPure!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (array!7275 (store (arr!4182 arr!153) from!240 (_2!7559 (readBytePure!0 bs!65))) (size!3293 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun lt!247318 () tuple2!14216)

(assert (=> b!157431 (= lt!247318 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!157432 () Bool)

(assert (=> b!157432 (= e!106668 (array_inv!3052 (buf!3763 bs!65)))))

(assert (= (and start!31302 res!131548) b!157430))

(assert (= (and b!157430 res!131549) b!157431))

(assert (= start!31302 b!157432))

(declare-fun m!246333 () Bool)

(assert (=> start!31302 m!246333))

(declare-fun m!246335 () Bool)

(assert (=> start!31302 m!246335))

(declare-fun m!246337 () Bool)

(assert (=> b!157430 m!246337))

(declare-fun m!246339 () Bool)

(assert (=> b!157431 m!246339))

(declare-fun m!246341 () Bool)

(assert (=> b!157431 m!246341))

(assert (=> b!157431 m!246341))

(declare-fun m!246343 () Bool)

(assert (=> b!157431 m!246343))

(declare-fun m!246345 () Bool)

(assert (=> b!157431 m!246345))

(declare-fun m!246347 () Bool)

(assert (=> b!157431 m!246347))

(declare-fun m!246349 () Bool)

(assert (=> b!157432 m!246349))

(check-sat (not b!157432) (not b!157430) (not b!157431) (not start!31302))
