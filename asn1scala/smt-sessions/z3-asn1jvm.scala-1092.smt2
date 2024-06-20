; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31392 () Bool)

(assert start!31392)

(declare-fun b!157646 () Bool)

(declare-fun e!106887 () Bool)

(declare-fun e!106889 () Bool)

(assert (=> b!157646 (= e!106887 e!106889)))

(declare-fun res!131717 () Bool)

(assert (=> b!157646 (=> (not res!131717) (not e!106889))))

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(assert (=> b!157646 (= res!131717 (not (= from!240 (bvsub to!236 #b00000000000000000000000000000001))))))

(declare-datatypes ((array!7295 0))(
  ( (array!7296 (arr!4197 (Array (_ BitVec 32) (_ BitVec 8))) (size!3302 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5796 0))(
  ( (BitStream!5797 (buf!3772 array!7295) (currentByte!6926 (_ BitVec 32)) (currentBit!6921 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5796)

(declare-fun lt!247915 () BitStream!5796)

(declare-fun arr!153 () array!7295)

(declare-datatypes ((tuple2!14270 0))(
  ( (tuple2!14271 (_1!7588 BitStream!5796) (_2!7588 array!7295)) )
))
(declare-fun lt!247917 () tuple2!14270)

(declare-fun readByteArrayLoopPure!0 (BitStream!5796 array!7295 (_ BitVec 32) (_ BitVec 32)) tuple2!14270)

(declare-datatypes ((tuple2!14272 0))(
  ( (tuple2!14273 (_1!7589 BitStream!5796) (_2!7589 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!5796) tuple2!14272)

(assert (=> b!157646 (= lt!247917 (readByteArrayLoopPure!0 lt!247915 (array!7296 (store (arr!4197 arr!153) from!240 (_2!7589 (readBytePure!0 bs!65))) (size!3302 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun withMovedByteIndex!0 (BitStream!5796 (_ BitVec 32)) BitStream!5796)

(assert (=> b!157646 (= lt!247915 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun lt!247916 () tuple2!14270)

(assert (=> b!157646 (= lt!247916 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!157647 () Bool)

(assert (=> b!157647 (= e!106889 (and (not (= (bvand to!236 #b10000000000000000000000000000000) (bvand from!240 #b10000000000000000000000000000000))) (not (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvsub to!236 from!240) #b10000000000000000000000000000000)))))))

(declare-fun lt!247918 () tuple2!14272)

(assert (=> b!157647 (= lt!247918 (readBytePure!0 lt!247915))))

(declare-fun res!131716 () Bool)

(assert (=> start!31392 (=> (not res!131716) (not e!106887))))

(assert (=> start!31392 (= res!131716 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3302 arr!153))))))

(assert (=> start!31392 e!106887))

(assert (=> start!31392 true))

(declare-fun array_inv!3061 (array!7295) Bool)

(assert (=> start!31392 (array_inv!3061 arr!153)))

(declare-fun e!106885 () Bool)

(declare-fun inv!12 (BitStream!5796) Bool)

(assert (=> start!31392 (and (inv!12 bs!65) e!106885)))

(declare-fun b!157645 () Bool)

(declare-fun res!131715 () Bool)

(assert (=> b!157645 (=> (not res!131715) (not e!106887))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!157645 (= res!131715 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3302 (buf!3772 bs!65))) ((_ sign_extend 32) (currentByte!6926 bs!65)) ((_ sign_extend 32) (currentBit!6921 bs!65)) (bvsub to!236 from!240)))))

(declare-fun b!157648 () Bool)

(assert (=> b!157648 (= e!106885 (array_inv!3061 (buf!3772 bs!65)))))

(assert (= (and start!31392 res!131716) b!157645))

(assert (= (and b!157645 res!131715) b!157646))

(assert (= (and b!157646 res!131717) b!157647))

(assert (= start!31392 b!157648))

(declare-fun m!246863 () Bool)

(assert (=> b!157645 m!246863))

(declare-fun m!246865 () Bool)

(assert (=> start!31392 m!246865))

(declare-fun m!246867 () Bool)

(assert (=> start!31392 m!246867))

(declare-fun m!246869 () Bool)

(assert (=> b!157646 m!246869))

(declare-fun m!246871 () Bool)

(assert (=> b!157646 m!246871))

(declare-fun m!246873 () Bool)

(assert (=> b!157646 m!246873))

(declare-fun m!246875 () Bool)

(assert (=> b!157646 m!246875))

(declare-fun m!246877 () Bool)

(assert (=> b!157646 m!246877))

(declare-fun m!246879 () Bool)

(assert (=> b!157648 m!246879))

(declare-fun m!246881 () Bool)

(assert (=> b!157647 m!246881))

(check-sat (not b!157648) (not b!157647) (not b!157646) (not start!31392) (not b!157645))
(check-sat)
