; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31386 () Bool)

(assert start!31386)

(declare-fun b!157611 () Bool)

(declare-fun e!106844 () Bool)

(declare-fun from!240 () (_ BitVec 32))

(declare-datatypes ((array!7289 0))(
  ( (array!7290 (arr!4194 (Array (_ BitVec 32) (_ BitVec 8))) (size!3299 (_ BitVec 32))) )
))
(declare-fun arr!153 () array!7289)

(assert (=> b!157611 (= e!106844 (bvsge from!240 (size!3299 arr!153)))))

(declare-datatypes ((BitStream!5790 0))(
  ( (BitStream!5791 (buf!3769 array!7289) (currentByte!6923 (_ BitVec 32)) (currentBit!6918 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!14258 0))(
  ( (tuple2!14259 (_1!7582 BitStream!5790) (_2!7582 (_ BitVec 8))) )
))
(declare-fun lt!247881 () tuple2!14258)

(declare-fun lt!247882 () BitStream!5790)

(declare-fun readBytePure!0 (BitStream!5790) tuple2!14258)

(assert (=> b!157611 (= lt!247881 (readBytePure!0 lt!247882))))

(declare-fun b!157610 () Bool)

(declare-fun e!106840 () Bool)

(assert (=> b!157610 (= e!106840 e!106844)))

(declare-fun res!131688 () Bool)

(assert (=> b!157610 (=> (not res!131688) (not e!106844))))

(declare-fun to!236 () (_ BitVec 32))

(assert (=> b!157610 (= res!131688 (not (= from!240 (bvsub to!236 #b00000000000000000000000000000001))))))

(declare-fun bs!65 () BitStream!5790)

(declare-datatypes ((tuple2!14260 0))(
  ( (tuple2!14261 (_1!7583 BitStream!5790) (_2!7583 array!7289)) )
))
(declare-fun lt!247879 () tuple2!14260)

(declare-fun readByteArrayLoopPure!0 (BitStream!5790 array!7289 (_ BitVec 32) (_ BitVec 32)) tuple2!14260)

(assert (=> b!157610 (= lt!247879 (readByteArrayLoopPure!0 lt!247882 (array!7290 (store (arr!4194 arr!153) from!240 (_2!7582 (readBytePure!0 bs!65))) (size!3299 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun withMovedByteIndex!0 (BitStream!5790 (_ BitVec 32)) BitStream!5790)

(assert (=> b!157610 (= lt!247882 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun lt!247880 () tuple2!14260)

(assert (=> b!157610 (= lt!247880 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun res!131689 () Bool)

(assert (=> start!31386 (=> (not res!131689) (not e!106840))))

(assert (=> start!31386 (= res!131689 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3299 arr!153))))))

(assert (=> start!31386 e!106840))

(assert (=> start!31386 true))

(declare-fun array_inv!3058 (array!7289) Bool)

(assert (=> start!31386 (array_inv!3058 arr!153)))

(declare-fun e!106842 () Bool)

(declare-fun inv!12 (BitStream!5790) Bool)

(assert (=> start!31386 (and (inv!12 bs!65) e!106842)))

(declare-fun b!157609 () Bool)

(declare-fun res!131690 () Bool)

(assert (=> b!157609 (=> (not res!131690) (not e!106840))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!157609 (= res!131690 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3299 (buf!3769 bs!65))) ((_ sign_extend 32) (currentByte!6923 bs!65)) ((_ sign_extend 32) (currentBit!6918 bs!65)) (bvsub to!236 from!240)))))

(declare-fun b!157612 () Bool)

(assert (=> b!157612 (= e!106842 (array_inv!3058 (buf!3769 bs!65)))))

(assert (= (and start!31386 res!131689) b!157609))

(assert (= (and b!157609 res!131690) b!157610))

(assert (= (and b!157610 res!131688) b!157611))

(assert (= start!31386 b!157612))

(declare-fun m!246803 () Bool)

(assert (=> start!31386 m!246803))

(declare-fun m!246805 () Bool)

(assert (=> start!31386 m!246805))

(declare-fun m!246807 () Bool)

(assert (=> b!157610 m!246807))

(declare-fun m!246809 () Bool)

(assert (=> b!157610 m!246809))

(declare-fun m!246811 () Bool)

(assert (=> b!157610 m!246811))

(declare-fun m!246813 () Bool)

(assert (=> b!157610 m!246813))

(declare-fun m!246815 () Bool)

(assert (=> b!157610 m!246815))

(declare-fun m!246817 () Bool)

(assert (=> b!157611 m!246817))

(declare-fun m!246819 () Bool)

(assert (=> b!157612 m!246819))

(declare-fun m!246821 () Bool)

(assert (=> b!157609 m!246821))

(check-sat (not b!157612) (not b!157610) (not b!157611) (not b!157609) (not start!31386))
(check-sat)
