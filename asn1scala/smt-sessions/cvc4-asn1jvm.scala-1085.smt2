; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31280 () Bool)

(assert start!31280)

(declare-fun res!131482 () Bool)

(declare-fun e!106536 () Bool)

(assert (=> start!31280 (=> (not res!131482) (not e!106536))))

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(declare-datatypes ((array!7252 0))(
  ( (array!7253 (arr!4171 (Array (_ BitVec 32) (_ BitVec 8))) (size!3282 (_ BitVec 32))) )
))
(declare-fun arr!153 () array!7252)

(assert (=> start!31280 (= res!131482 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3282 arr!153))))))

(assert (=> start!31280 e!106536))

(assert (=> start!31280 true))

(declare-fun array_inv!3041 (array!7252) Bool)

(assert (=> start!31280 (array_inv!3041 arr!153)))

(declare-datatypes ((BitStream!5756 0))(
  ( (BitStream!5757 (buf!3752 array!7252) (currentByte!6897 (_ BitVec 32)) (currentBit!6892 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5756)

(declare-fun e!106538 () Bool)

(declare-fun inv!12 (BitStream!5756) Bool)

(assert (=> start!31280 (and (inv!12 bs!65) e!106538)))

(declare-fun b!157331 () Bool)

(declare-fun res!131483 () Bool)

(assert (=> b!157331 (=> (not res!131483) (not e!106536))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!157331 (= res!131483 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3282 (buf!3752 bs!65))) ((_ sign_extend 32) (currentByte!6897 bs!65)) ((_ sign_extend 32) (currentBit!6892 bs!65)) (bvsub to!236 from!240)))))

(declare-fun b!157332 () Bool)

(assert (=> b!157332 (= e!106536 (bvsge from!240 (size!3282 arr!153)))))

(declare-datatypes ((tuple2!14172 0))(
  ( (tuple2!14173 (_1!7536 BitStream!5756) (_2!7536 (_ BitVec 8))) )
))
(declare-fun lt!247241 () tuple2!14172)

(declare-fun readBytePure!0 (BitStream!5756) tuple2!14172)

(assert (=> b!157332 (= lt!247241 (readBytePure!0 bs!65))))

(declare-fun lt!247243 () BitStream!5756)

(declare-fun withMovedByteIndex!0 (BitStream!5756 (_ BitVec 32)) BitStream!5756)

(assert (=> b!157332 (= lt!247243 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))

(declare-datatypes ((tuple2!14174 0))(
  ( (tuple2!14175 (_1!7537 BitStream!5756) (_2!7537 array!7252)) )
))
(declare-fun lt!247242 () tuple2!14174)

(declare-fun readByteArrayLoopPure!0 (BitStream!5756 array!7252 (_ BitVec 32) (_ BitVec 32)) tuple2!14174)

(assert (=> b!157332 (= lt!247242 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!157333 () Bool)

(assert (=> b!157333 (= e!106538 (array_inv!3041 (buf!3752 bs!65)))))

(assert (= (and start!31280 res!131482) b!157331))

(assert (= (and b!157331 res!131483) b!157332))

(assert (= start!31280 b!157333))

(declare-fun m!246151 () Bool)

(assert (=> start!31280 m!246151))

(declare-fun m!246153 () Bool)

(assert (=> start!31280 m!246153))

(declare-fun m!246155 () Bool)

(assert (=> b!157331 m!246155))

(declare-fun m!246157 () Bool)

(assert (=> b!157332 m!246157))

(declare-fun m!246159 () Bool)

(assert (=> b!157332 m!246159))

(declare-fun m!246161 () Bool)

(assert (=> b!157332 m!246161))

(declare-fun m!246163 () Bool)

(assert (=> b!157333 m!246163))

(push 1)

(assert (not b!157331))

(assert (not b!157333))

(assert (not b!157332))

(assert (not start!31280))

(check-sat)

(pop 1)

(push 1)

(check-sat)

