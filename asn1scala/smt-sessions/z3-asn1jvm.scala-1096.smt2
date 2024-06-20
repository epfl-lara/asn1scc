; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31534 () Bool)

(assert start!31534)

(declare-fun res!131963 () Bool)

(declare-fun e!107192 () Bool)

(assert (=> start!31534 (=> (not res!131963) (not e!107192))))

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(declare-datatypes ((array!7325 0))(
  ( (array!7326 (arr!4219 (Array (_ BitVec 32) (_ BitVec 8))) (size!3314 (_ BitVec 32))) )
))
(declare-fun arr!153 () array!7325)

(assert (=> start!31534 (= res!131963 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3314 arr!153))))))

(assert (=> start!31534 e!107192))

(assert (=> start!31534 true))

(declare-fun array_inv!3073 (array!7325) Bool)

(assert (=> start!31534 (array_inv!3073 arr!153)))

(declare-datatypes ((BitStream!5820 0))(
  ( (BitStream!5821 (buf!3784 array!7325) (currentByte!6955 (_ BitVec 32)) (currentBit!6950 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5820)

(declare-fun e!107190 () Bool)

(declare-fun inv!12 (BitStream!5820) Bool)

(assert (=> start!31534 (and (inv!12 bs!65) e!107190)))

(declare-fun b!157954 () Bool)

(declare-fun e!107193 () Bool)

(assert (=> b!157954 (= e!107192 e!107193)))

(declare-fun res!131962 () Bool)

(assert (=> b!157954 (=> (not res!131962) (not e!107193))))

(assert (=> b!157954 (= res!131962 (not (= from!240 (bvsub to!236 #b00000000000000000000000000000001))))))

(declare-fun lt!248865 () BitStream!5820)

(declare-datatypes ((tuple2!14350 0))(
  ( (tuple2!14351 (_1!7634 BitStream!5820) (_2!7634 array!7325)) )
))
(declare-fun lt!248867 () tuple2!14350)

(declare-fun readByteArrayLoopPure!0 (BitStream!5820 array!7325 (_ BitVec 32) (_ BitVec 32)) tuple2!14350)

(declare-datatypes ((tuple2!14352 0))(
  ( (tuple2!14353 (_1!7635 BitStream!5820) (_2!7635 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!5820) tuple2!14352)

(assert (=> b!157954 (= lt!248867 (readByteArrayLoopPure!0 lt!248865 (array!7326 (store (arr!4219 arr!153) from!240 (_2!7635 (readBytePure!0 bs!65))) (size!3314 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun withMovedByteIndex!0 (BitStream!5820 (_ BitVec 32)) BitStream!5820)

(assert (=> b!157954 (= lt!248865 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun lt!248866 () tuple2!14350)

(assert (=> b!157954 (= lt!248866 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!157955 () Bool)

(declare-fun res!131960 () Bool)

(assert (=> b!157955 (=> (not res!131960) (not e!107192))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!157955 (= res!131960 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3314 (buf!3784 bs!65))) ((_ sign_extend 32) (currentByte!6955 bs!65)) ((_ sign_extend 32) (currentBit!6950 bs!65)) (bvsub to!236 from!240)))))

(declare-fun b!157956 () Bool)

(declare-fun e!107189 () Bool)

(assert (=> b!157956 (= e!107193 e!107189)))

(declare-fun res!131961 () Bool)

(assert (=> b!157956 (=> (not res!131961) (not e!107189))))

(assert (=> b!157956 (= res!131961 (= (size!3314 (buf!3784 bs!65)) (size!3314 (buf!3784 lt!248865))))))

(declare-fun lt!248864 () tuple2!14352)

(assert (=> b!157956 (= lt!248864 (readBytePure!0 lt!248865))))

(declare-fun b!157957 () Bool)

(assert (=> b!157957 (= e!107189 false)))

(declare-fun lt!248863 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!157957 (= lt!248863 (bitIndex!0 (size!3314 (buf!3784 lt!248865)) (currentByte!6955 lt!248865) (currentBit!6950 lt!248865)))))

(declare-fun b!157958 () Bool)

(assert (=> b!157958 (= e!107190 (array_inv!3073 (buf!3784 bs!65)))))

(assert (= (and start!31534 res!131963) b!157955))

(assert (= (and b!157955 res!131960) b!157954))

(assert (= (and b!157954 res!131962) b!157956))

(assert (= (and b!157956 res!131961) b!157957))

(assert (= start!31534 b!157958))

(declare-fun m!247603 () Bool)

(assert (=> b!157958 m!247603))

(declare-fun m!247605 () Bool)

(assert (=> start!31534 m!247605))

(declare-fun m!247607 () Bool)

(assert (=> start!31534 m!247607))

(declare-fun m!247609 () Bool)

(assert (=> b!157957 m!247609))

(declare-fun m!247611 () Bool)

(assert (=> b!157955 m!247611))

(declare-fun m!247613 () Bool)

(assert (=> b!157956 m!247613))

(declare-fun m!247615 () Bool)

(assert (=> b!157954 m!247615))

(declare-fun m!247617 () Bool)

(assert (=> b!157954 m!247617))

(declare-fun m!247619 () Bool)

(assert (=> b!157954 m!247619))

(declare-fun m!247621 () Bool)

(assert (=> b!157954 m!247621))

(declare-fun m!247623 () Bool)

(assert (=> b!157954 m!247623))

(check-sat (not b!157957) (not b!157955) (not start!31534) (not b!157956) (not b!157954) (not b!157958))
