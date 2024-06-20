; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31022 () Bool)

(assert start!31022)

(declare-fun res!130814 () Bool)

(declare-fun e!105766 () Bool)

(assert (=> start!31022 (=> (not res!130814) (not e!105766))))

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(declare-datatypes ((array!7180 0))(
  ( (array!7181 (arr!4084 (Array (_ BitVec 32) (_ BitVec 8))) (size!3219 (_ BitVec 32))) )
))
(declare-fun arr!153 () array!7180)

(assert (=> start!31022 (= res!130814 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3219 arr!153))))))

(assert (=> start!31022 e!105766))

(assert (=> start!31022 true))

(declare-fun array_inv!3008 (array!7180) Bool)

(assert (=> start!31022 (array_inv!3008 arr!153)))

(declare-datatypes ((BitStream!5696 0))(
  ( (BitStream!5697 (buf!3722 array!7180) (currentByte!6849 (_ BitVec 32)) (currentBit!6844 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5696)

(declare-fun e!105762 () Bool)

(declare-fun inv!12 (BitStream!5696) Bool)

(assert (=> start!31022 (and (inv!12 bs!65) e!105762)))

(declare-fun b!156515 () Bool)

(declare-fun res!130813 () Bool)

(declare-fun e!105763 () Bool)

(assert (=> b!156515 (=> (not res!130813) (not e!105763))))

(declare-fun lt!245158 () BitStream!5696)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!156515 (= res!130813 (bvsle #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3219 (buf!3722 lt!245158)) (currentByte!6849 lt!245158) (currentBit!6844 lt!245158))))))

(declare-fun b!156516 () Bool)

(declare-fun e!105764 () Bool)

(assert (=> b!156516 (= e!105764 e!105763)))

(declare-fun res!130812 () Bool)

(assert (=> b!156516 (=> (not res!130812) (not e!105763))))

(assert (=> b!156516 (= res!130812 (= (size!3219 (buf!3722 bs!65)) (size!3219 (buf!3722 lt!245158))))))

(declare-datatypes ((tuple2!14016 0))(
  ( (tuple2!14017 (_1!7452 BitStream!5696) (_2!7452 (_ BitVec 8))) )
))
(declare-fun lt!245159 () tuple2!14016)

(declare-fun readBytePure!0 (BitStream!5696) tuple2!14016)

(assert (=> b!156516 (= lt!245159 (readBytePure!0 lt!245158))))

(declare-fun b!156517 () Bool)

(assert (=> b!156517 (= e!105762 (array_inv!3008 (buf!3722 bs!65)))))

(declare-fun b!156518 () Bool)

(assert (=> b!156518 (= e!105766 e!105764)))

(declare-fun res!130811 () Bool)

(assert (=> b!156518 (=> (not res!130811) (not e!105764))))

(assert (=> b!156518 (= res!130811 (not (= from!240 (bvsub to!236 #b00000000000000000000000000000001))))))

(declare-datatypes ((tuple2!14018 0))(
  ( (tuple2!14019 (_1!7453 BitStream!5696) (_2!7453 array!7180)) )
))
(declare-fun lt!245161 () tuple2!14018)

(declare-fun readByteArrayLoopPure!0 (BitStream!5696 array!7180 (_ BitVec 32) (_ BitVec 32)) tuple2!14018)

(assert (=> b!156518 (= lt!245161 (readByteArrayLoopPure!0 lt!245158 (array!7181 (store (arr!4084 arr!153) from!240 (_2!7452 (readBytePure!0 bs!65))) (size!3219 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun withMovedByteIndex!0 (BitStream!5696 (_ BitVec 32)) BitStream!5696)

(assert (=> b!156518 (= lt!245158 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun lt!245160 () tuple2!14018)

(assert (=> b!156518 (= lt!245160 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!156519 () Bool)

(declare-fun res!130810 () Bool)

(assert (=> b!156519 (=> (not res!130810) (not e!105766))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!156519 (= res!130810 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3219 (buf!3722 bs!65))) ((_ sign_extend 32) (currentByte!6849 bs!65)) ((_ sign_extend 32) (currentBit!6844 bs!65)) (bvsub to!236 from!240)))))

(declare-fun b!156520 () Bool)

(assert (=> b!156520 (= e!105763 false)))

(declare-fun lt!245157 () (_ BitVec 64))

(assert (=> b!156520 (= lt!245157 (bitIndex!0 (size!3219 (buf!3722 bs!65)) (currentByte!6849 bs!65) (currentBit!6844 bs!65)))))

(assert (= (and start!31022 res!130814) b!156519))

(assert (= (and b!156519 res!130810) b!156518))

(assert (= (and b!156518 res!130811) b!156516))

(assert (= (and b!156516 res!130812) b!156515))

(assert (= (and b!156515 res!130813) b!156520))

(assert (= start!31022 b!156517))

(declare-fun m!244065 () Bool)

(assert (=> b!156520 m!244065))

(declare-fun m!244067 () Bool)

(assert (=> b!156516 m!244067))

(declare-fun m!244069 () Bool)

(assert (=> b!156515 m!244069))

(declare-fun m!244071 () Bool)

(assert (=> start!31022 m!244071))

(declare-fun m!244073 () Bool)

(assert (=> start!31022 m!244073))

(declare-fun m!244075 () Bool)

(assert (=> b!156518 m!244075))

(declare-fun m!244077 () Bool)

(assert (=> b!156518 m!244077))

(declare-fun m!244079 () Bool)

(assert (=> b!156518 m!244079))

(declare-fun m!244081 () Bool)

(assert (=> b!156518 m!244081))

(declare-fun m!244083 () Bool)

(assert (=> b!156518 m!244083))

(declare-fun m!244085 () Bool)

(assert (=> b!156517 m!244085))

(declare-fun m!244087 () Bool)

(assert (=> b!156519 m!244087))

(push 1)

(assert (not b!156518))

(assert (not start!31022))

(assert (not b!156516))

(assert (not b!156515))

(assert (not b!156519))

(assert (not b!156517))

(assert (not b!156520))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

