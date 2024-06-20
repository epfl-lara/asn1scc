; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31384 () Bool)

(assert start!31384)

(declare-fun b!157600 () Bool)

(declare-fun e!106825 () Bool)

(declare-datatypes ((array!7287 0))(
  ( (array!7288 (arr!4193 (Array (_ BitVec 32) (_ BitVec 8))) (size!3298 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5788 0))(
  ( (BitStream!5789 (buf!3768 array!7287) (currentByte!6922 (_ BitVec 32)) (currentBit!6917 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5788)

(declare-fun array_inv!3057 (array!7287) Bool)

(assert (=> b!157600 (= e!106825 (array_inv!3057 (buf!3768 bs!65)))))

(declare-fun res!131680 () Bool)

(declare-fun e!106828 () Bool)

(assert (=> start!31384 (=> (not res!131680) (not e!106828))))

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(declare-fun arr!153 () array!7287)

(assert (=> start!31384 (= res!131680 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3298 arr!153))))))

(assert (=> start!31384 e!106828))

(assert (=> start!31384 true))

(assert (=> start!31384 (array_inv!3057 arr!153)))

(declare-fun inv!12 (BitStream!5788) Bool)

(assert (=> start!31384 (and (inv!12 bs!65) e!106825)))

(declare-fun b!157599 () Bool)

(declare-fun e!106829 () Bool)

(assert (=> b!157599 (= e!106829 (bvsge from!240 (size!3298 arr!153)))))

(declare-datatypes ((tuple2!14254 0))(
  ( (tuple2!14255 (_1!7580 BitStream!5788) (_2!7580 (_ BitVec 8))) )
))
(declare-fun lt!247869 () tuple2!14254)

(declare-fun lt!247867 () BitStream!5788)

(declare-fun readBytePure!0 (BitStream!5788) tuple2!14254)

(assert (=> b!157599 (= lt!247869 (readBytePure!0 lt!247867))))

(declare-fun b!157598 () Bool)

(assert (=> b!157598 (= e!106828 e!106829)))

(declare-fun res!131681 () Bool)

(assert (=> b!157598 (=> (not res!131681) (not e!106829))))

(assert (=> b!157598 (= res!131681 (not (= from!240 (bvsub to!236 #b00000000000000000000000000000001))))))

(declare-datatypes ((tuple2!14256 0))(
  ( (tuple2!14257 (_1!7581 BitStream!5788) (_2!7581 array!7287)) )
))
(declare-fun lt!247870 () tuple2!14256)

(declare-fun readByteArrayLoopPure!0 (BitStream!5788 array!7287 (_ BitVec 32) (_ BitVec 32)) tuple2!14256)

(assert (=> b!157598 (= lt!247870 (readByteArrayLoopPure!0 lt!247867 (array!7288 (store (arr!4193 arr!153) from!240 (_2!7580 (readBytePure!0 bs!65))) (size!3298 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun withMovedByteIndex!0 (BitStream!5788 (_ BitVec 32)) BitStream!5788)

(assert (=> b!157598 (= lt!247867 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun lt!247868 () tuple2!14256)

(assert (=> b!157598 (= lt!247868 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!157597 () Bool)

(declare-fun res!131679 () Bool)

(assert (=> b!157597 (=> (not res!131679) (not e!106828))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!157597 (= res!131679 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3298 (buf!3768 bs!65))) ((_ sign_extend 32) (currentByte!6922 bs!65)) ((_ sign_extend 32) (currentBit!6917 bs!65)) (bvsub to!236 from!240)))))

(assert (= (and start!31384 res!131680) b!157597))

(assert (= (and b!157597 res!131679) b!157598))

(assert (= (and b!157598 res!131681) b!157599))

(assert (= start!31384 b!157600))

(declare-fun m!246783 () Bool)

(assert (=> b!157600 m!246783))

(declare-fun m!246785 () Bool)

(assert (=> b!157598 m!246785))

(declare-fun m!246787 () Bool)

(assert (=> b!157598 m!246787))

(declare-fun m!246789 () Bool)

(assert (=> b!157598 m!246789))

(declare-fun m!246791 () Bool)

(assert (=> b!157598 m!246791))

(declare-fun m!246793 () Bool)

(assert (=> b!157598 m!246793))

(declare-fun m!246795 () Bool)

(assert (=> start!31384 m!246795))

(declare-fun m!246797 () Bool)

(assert (=> start!31384 m!246797))

(declare-fun m!246799 () Bool)

(assert (=> b!157597 m!246799))

(declare-fun m!246801 () Bool)

(assert (=> b!157599 m!246801))

(push 1)

(assert (not b!157599))

(assert (not start!31384))

(assert (not b!157597))

(assert (not b!157600))

(assert (not b!157598))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

