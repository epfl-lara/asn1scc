; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31296 () Bool)

(assert start!31296)

(declare-fun res!131530 () Bool)

(declare-fun e!106634 () Bool)

(assert (=> start!31296 (=> (not res!131530) (not e!106634))))

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(declare-datatypes ((array!7268 0))(
  ( (array!7269 (arr!4179 (Array (_ BitVec 32) (_ BitVec 8))) (size!3290 (_ BitVec 32))) )
))
(declare-fun arr!153 () array!7268)

(assert (=> start!31296 (= res!131530 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3290 arr!153))))))

(assert (=> start!31296 e!106634))

(assert (=> start!31296 true))

(declare-fun array_inv!3049 (array!7268) Bool)

(assert (=> start!31296 (array_inv!3049 arr!153)))

(declare-datatypes ((BitStream!5772 0))(
  ( (BitStream!5773 (buf!3760 array!7268) (currentByte!6905 (_ BitVec 32)) (currentBit!6900 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5772)

(declare-fun e!106633 () Bool)

(declare-fun inv!12 (BitStream!5772) Bool)

(assert (=> start!31296 (and (inv!12 bs!65) e!106633)))

(declare-fun b!157403 () Bool)

(declare-fun res!131531 () Bool)

(assert (=> b!157403 (=> (not res!131531) (not e!106634))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!157403 (= res!131531 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3290 (buf!3760 bs!65))) ((_ sign_extend 32) (currentByte!6905 bs!65)) ((_ sign_extend 32) (currentBit!6900 bs!65)) (bvsub to!236 from!240)))))

(declare-fun b!157404 () Bool)

(assert (=> b!157404 (= e!106634 (bvslt (bvsub to!236 from!240) #b00000000000000000000000000000000))))

(declare-datatypes ((tuple2!14204 0))(
  ( (tuple2!14205 (_1!7552 BitStream!5772) (_2!7552 array!7268)) )
))
(declare-fun lt!247299 () tuple2!14204)

(declare-fun readByteArrayLoopPure!0 (BitStream!5772 array!7268 (_ BitVec 32) (_ BitVec 32)) tuple2!14204)

(declare-fun withMovedByteIndex!0 (BitStream!5772 (_ BitVec 32)) BitStream!5772)

(declare-datatypes ((tuple2!14206 0))(
  ( (tuple2!14207 (_1!7553 BitStream!5772) (_2!7553 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!5772) tuple2!14206)

(assert (=> b!157404 (= lt!247299 (readByteArrayLoopPure!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (array!7269 (store (arr!4179 arr!153) from!240 (_2!7553 (readBytePure!0 bs!65))) (size!3290 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun lt!247300 () tuple2!14204)

(assert (=> b!157404 (= lt!247300 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!157405 () Bool)

(assert (=> b!157405 (= e!106633 (array_inv!3049 (buf!3760 bs!65)))))

(assert (= (and start!31296 res!131530) b!157403))

(assert (= (and b!157403 res!131531) b!157404))

(assert (= start!31296 b!157405))

(declare-fun m!246279 () Bool)

(assert (=> start!31296 m!246279))

(declare-fun m!246281 () Bool)

(assert (=> start!31296 m!246281))

(declare-fun m!246283 () Bool)

(assert (=> b!157403 m!246283))

(declare-fun m!246285 () Bool)

(assert (=> b!157404 m!246285))

(declare-fun m!246287 () Bool)

(assert (=> b!157404 m!246287))

(assert (=> b!157404 m!246287))

(declare-fun m!246289 () Bool)

(assert (=> b!157404 m!246289))

(declare-fun m!246291 () Bool)

(assert (=> b!157404 m!246291))

(declare-fun m!246293 () Bool)

(assert (=> b!157404 m!246293))

(declare-fun m!246295 () Bool)

(assert (=> b!157405 m!246295))

(check-sat (not b!157403) (not b!157404) (not start!31296) (not b!157405))
