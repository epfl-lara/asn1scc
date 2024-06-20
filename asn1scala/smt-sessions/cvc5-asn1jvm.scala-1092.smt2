; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31390 () Bool)

(assert start!31390)

(declare-fun res!131706 () Bool)

(declare-fun e!106872 () Bool)

(assert (=> start!31390 (=> (not res!131706) (not e!106872))))

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(declare-datatypes ((array!7293 0))(
  ( (array!7294 (arr!4196 (Array (_ BitVec 32) (_ BitVec 8))) (size!3301 (_ BitVec 32))) )
))
(declare-fun arr!153 () array!7293)

(assert (=> start!31390 (= res!131706 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3301 arr!153))))))

(assert (=> start!31390 e!106872))

(assert (=> start!31390 true))

(declare-fun array_inv!3060 (array!7293) Bool)

(assert (=> start!31390 (array_inv!3060 arr!153)))

(declare-datatypes ((BitStream!5794 0))(
  ( (BitStream!5795 (buf!3771 array!7293) (currentByte!6925 (_ BitVec 32)) (currentBit!6920 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5794)

(declare-fun e!106874 () Bool)

(declare-fun inv!12 (BitStream!5794) Bool)

(assert (=> start!31390 (and (inv!12 bs!65) e!106874)))

(declare-fun b!157636 () Bool)

(assert (=> b!157636 (= e!106874 (array_inv!3060 (buf!3771 bs!65)))))

(declare-fun b!157634 () Bool)

(declare-fun e!106873 () Bool)

(assert (=> b!157634 (= e!106872 e!106873)))

(declare-fun res!131707 () Bool)

(assert (=> b!157634 (=> (not res!131707) (not e!106873))))

(assert (=> b!157634 (= res!131707 (not (= from!240 (bvsub to!236 #b00000000000000000000000000000001))))))

(declare-fun lt!247904 () BitStream!5794)

(declare-datatypes ((tuple2!14266 0))(
  ( (tuple2!14267 (_1!7586 BitStream!5794) (_2!7586 array!7293)) )
))
(declare-fun lt!247906 () tuple2!14266)

(declare-fun readByteArrayLoopPure!0 (BitStream!5794 array!7293 (_ BitVec 32) (_ BitVec 32)) tuple2!14266)

(declare-datatypes ((tuple2!14268 0))(
  ( (tuple2!14269 (_1!7587 BitStream!5794) (_2!7587 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!5794) tuple2!14268)

(assert (=> b!157634 (= lt!247906 (readByteArrayLoopPure!0 lt!247904 (array!7294 (store (arr!4196 arr!153) from!240 (_2!7587 (readBytePure!0 bs!65))) (size!3301 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun withMovedByteIndex!0 (BitStream!5794 (_ BitVec 32)) BitStream!5794)

(assert (=> b!157634 (= lt!247904 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun lt!247903 () tuple2!14266)

(assert (=> b!157634 (= lt!247903 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!157633 () Bool)

(declare-fun res!131708 () Bool)

(assert (=> b!157633 (=> (not res!131708) (not e!106872))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!157633 (= res!131708 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3301 (buf!3771 bs!65))) ((_ sign_extend 32) (currentByte!6925 bs!65)) ((_ sign_extend 32) (currentBit!6920 bs!65)) (bvsub to!236 from!240)))))

(declare-fun b!157635 () Bool)

(assert (=> b!157635 (= e!106873 (and (not (= (bvand to!236 #b10000000000000000000000000000000) (bvand from!240 #b10000000000000000000000000000000))) (not (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvsub to!236 from!240) #b10000000000000000000000000000000)))))))

(declare-fun lt!247905 () tuple2!14268)

(assert (=> b!157635 (= lt!247905 (readBytePure!0 lt!247904))))

(assert (= (and start!31390 res!131706) b!157633))

(assert (= (and b!157633 res!131708) b!157634))

(assert (= (and b!157634 res!131707) b!157635))

(assert (= start!31390 b!157636))

(declare-fun m!246843 () Bool)

(assert (=> b!157633 m!246843))

(declare-fun m!246845 () Bool)

(assert (=> b!157634 m!246845))

(declare-fun m!246847 () Bool)

(assert (=> b!157634 m!246847))

(declare-fun m!246849 () Bool)

(assert (=> b!157634 m!246849))

(declare-fun m!246851 () Bool)

(assert (=> b!157634 m!246851))

(declare-fun m!246853 () Bool)

(assert (=> b!157634 m!246853))

(declare-fun m!246855 () Bool)

(assert (=> b!157636 m!246855))

(declare-fun m!246857 () Bool)

(assert (=> b!157635 m!246857))

(declare-fun m!246859 () Bool)

(assert (=> start!31390 m!246859))

(declare-fun m!246861 () Bool)

(assert (=> start!31390 m!246861))

(push 1)

(assert (not b!157633))

(assert (not b!157634))

(assert (not start!31390))

(assert (not b!157636))

(assert (not b!157635))

(check-sat)

(pop 1)

(push 1)

(check-sat)

