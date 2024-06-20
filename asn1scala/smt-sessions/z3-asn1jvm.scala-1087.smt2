; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31290 () Bool)

(assert start!31290)

(declare-fun res!131512 () Bool)

(declare-fun e!106596 () Bool)

(assert (=> start!31290 (=> (not res!131512) (not e!106596))))

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(declare-datatypes ((array!7262 0))(
  ( (array!7263 (arr!4176 (Array (_ BitVec 32) (_ BitVec 8))) (size!3287 (_ BitVec 32))) )
))
(declare-fun arr!153 () array!7262)

(assert (=> start!31290 (= res!131512 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3287 arr!153))))))

(assert (=> start!31290 e!106596))

(assert (=> start!31290 true))

(declare-fun array_inv!3046 (array!7262) Bool)

(assert (=> start!31290 (array_inv!3046 arr!153)))

(declare-datatypes ((BitStream!5766 0))(
  ( (BitStream!5767 (buf!3757 array!7262) (currentByte!6902 (_ BitVec 32)) (currentBit!6897 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5766)

(declare-fun e!106595 () Bool)

(declare-fun inv!12 (BitStream!5766) Bool)

(assert (=> start!31290 (and (inv!12 bs!65) e!106595)))

(declare-fun b!157376 () Bool)

(declare-fun res!131513 () Bool)

(assert (=> b!157376 (=> (not res!131513) (not e!106596))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!157376 (= res!131513 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3287 (buf!3757 bs!65))) ((_ sign_extend 32) (currentByte!6902 bs!65)) ((_ sign_extend 32) (currentBit!6897 bs!65)) (bvsub to!236 from!240)))))

(declare-fun b!157377 () Bool)

(assert (=> b!157377 (= e!106596 (and (not (= (bvand to!236 #b10000000000000000000000000000000) (bvand from!240 #b10000000000000000000000000000000))) (not (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvsub to!236 from!240) #b10000000000000000000000000000000)))))))

(declare-datatypes ((tuple2!14192 0))(
  ( (tuple2!14193 (_1!7546 BitStream!5766) (_2!7546 array!7262)) )
))
(declare-fun lt!247282 () tuple2!14192)

(declare-fun readByteArrayLoopPure!0 (BitStream!5766 array!7262 (_ BitVec 32) (_ BitVec 32)) tuple2!14192)

(declare-fun withMovedByteIndex!0 (BitStream!5766 (_ BitVec 32)) BitStream!5766)

(declare-datatypes ((tuple2!14194 0))(
  ( (tuple2!14195 (_1!7547 BitStream!5766) (_2!7547 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!5766) tuple2!14194)

(assert (=> b!157377 (= lt!247282 (readByteArrayLoopPure!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (array!7263 (store (arr!4176 arr!153) from!240 (_2!7547 (readBytePure!0 bs!65))) (size!3287 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun lt!247281 () tuple2!14192)

(assert (=> b!157377 (= lt!247281 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!157378 () Bool)

(assert (=> b!157378 (= e!106595 (array_inv!3046 (buf!3757 bs!65)))))

(assert (= (and start!31290 res!131512) b!157376))

(assert (= (and b!157376 res!131513) b!157377))

(assert (= start!31290 b!157378))

(declare-fun m!246225 () Bool)

(assert (=> start!31290 m!246225))

(declare-fun m!246227 () Bool)

(assert (=> start!31290 m!246227))

(declare-fun m!246229 () Bool)

(assert (=> b!157376 m!246229))

(declare-fun m!246231 () Bool)

(assert (=> b!157377 m!246231))

(declare-fun m!246233 () Bool)

(assert (=> b!157377 m!246233))

(assert (=> b!157377 m!246233))

(declare-fun m!246235 () Bool)

(assert (=> b!157377 m!246235))

(declare-fun m!246237 () Bool)

(assert (=> b!157377 m!246237))

(declare-fun m!246239 () Bool)

(assert (=> b!157377 m!246239))

(declare-fun m!246241 () Bool)

(assert (=> b!157378 m!246241))

(check-sat (not start!31290) (not b!157377) (not b!157376) (not b!157378))
