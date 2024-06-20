; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31278 () Bool)

(assert start!31278)

(declare-fun res!131476 () Bool)

(declare-fun e!106524 () Bool)

(assert (=> start!31278 (=> (not res!131476) (not e!106524))))

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(declare-datatypes ((array!7250 0))(
  ( (array!7251 (arr!4170 (Array (_ BitVec 32) (_ BitVec 8))) (size!3281 (_ BitVec 32))) )
))
(declare-fun arr!153 () array!7250)

(assert (=> start!31278 (= res!131476 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3281 arr!153))))))

(assert (=> start!31278 e!106524))

(assert (=> start!31278 true))

(declare-fun array_inv!3040 (array!7250) Bool)

(assert (=> start!31278 (array_inv!3040 arr!153)))

(declare-datatypes ((BitStream!5754 0))(
  ( (BitStream!5755 (buf!3751 array!7250) (currentByte!6896 (_ BitVec 32)) (currentBit!6891 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5754)

(declare-fun e!106526 () Bool)

(declare-fun inv!12 (BitStream!5754) Bool)

(assert (=> start!31278 (and (inv!12 bs!65) e!106526)))

(declare-fun b!157322 () Bool)

(declare-fun res!131477 () Bool)

(assert (=> b!157322 (=> (not res!131477) (not e!106524))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!157322 (= res!131477 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3281 (buf!3751 bs!65))) ((_ sign_extend 32) (currentByte!6896 bs!65)) ((_ sign_extend 32) (currentBit!6891 bs!65)) (bvsub to!236 from!240)))))

(declare-fun b!157323 () Bool)

(assert (=> b!157323 (= e!106524 (bvsge from!240 (size!3281 arr!153)))))

(declare-datatypes ((tuple2!14168 0))(
  ( (tuple2!14169 (_1!7534 BitStream!5754) (_2!7534 (_ BitVec 8))) )
))
(declare-fun lt!247232 () tuple2!14168)

(declare-fun readBytePure!0 (BitStream!5754) tuple2!14168)

(assert (=> b!157323 (= lt!247232 (readBytePure!0 bs!65))))

(declare-fun lt!247234 () BitStream!5754)

(declare-fun withMovedByteIndex!0 (BitStream!5754 (_ BitVec 32)) BitStream!5754)

(assert (=> b!157323 (= lt!247234 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))

(declare-datatypes ((tuple2!14170 0))(
  ( (tuple2!14171 (_1!7535 BitStream!5754) (_2!7535 array!7250)) )
))
(declare-fun lt!247233 () tuple2!14170)

(declare-fun readByteArrayLoopPure!0 (BitStream!5754 array!7250 (_ BitVec 32) (_ BitVec 32)) tuple2!14170)

(assert (=> b!157323 (= lt!247233 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!157324 () Bool)

(assert (=> b!157324 (= e!106526 (array_inv!3040 (buf!3751 bs!65)))))

(assert (= (and start!31278 res!131476) b!157322))

(assert (= (and b!157322 res!131477) b!157323))

(assert (= start!31278 b!157324))

(declare-fun m!246137 () Bool)

(assert (=> start!31278 m!246137))

(declare-fun m!246139 () Bool)

(assert (=> start!31278 m!246139))

(declare-fun m!246141 () Bool)

(assert (=> b!157322 m!246141))

(declare-fun m!246143 () Bool)

(assert (=> b!157323 m!246143))

(declare-fun m!246145 () Bool)

(assert (=> b!157323 m!246145))

(declare-fun m!246147 () Bool)

(assert (=> b!157323 m!246147))

(declare-fun m!246149 () Bool)

(assert (=> b!157324 m!246149))

(check-sat (not b!157322) (not b!157323) (not b!157324) (not start!31278))
(check-sat)
