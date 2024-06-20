; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31536 () Bool)

(assert start!31536)

(declare-fun b!157969 () Bool)

(declare-fun res!131974 () Bool)

(declare-fun e!107208 () Bool)

(assert (=> b!157969 (=> (not res!131974) (not e!107208))))

(declare-datatypes ((array!7327 0))(
  ( (array!7328 (arr!4220 (Array (_ BitVec 32) (_ BitVec 8))) (size!3315 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5822 0))(
  ( (BitStream!5823 (buf!3785 array!7327) (currentByte!6956 (_ BitVec 32)) (currentBit!6951 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5822)

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!157969 (= res!131974 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3315 (buf!3785 bs!65))) ((_ sign_extend 32) (currentByte!6956 bs!65)) ((_ sign_extend 32) (currentBit!6951 bs!65)) (bvsub to!236 from!240)))))

(declare-fun b!157970 () Bool)

(declare-fun e!107211 () Bool)

(assert (=> b!157970 (= e!107208 e!107211)))

(declare-fun res!131972 () Bool)

(assert (=> b!157970 (=> (not res!131972) (not e!107211))))

(assert (=> b!157970 (= res!131972 (not (= from!240 (bvsub to!236 #b00000000000000000000000000000001))))))

(declare-datatypes ((tuple2!14354 0))(
  ( (tuple2!14355 (_1!7636 BitStream!5822) (_2!7636 array!7327)) )
))
(declare-fun lt!248878 () tuple2!14354)

(declare-fun lt!248879 () BitStream!5822)

(declare-fun arr!153 () array!7327)

(declare-fun readByteArrayLoopPure!0 (BitStream!5822 array!7327 (_ BitVec 32) (_ BitVec 32)) tuple2!14354)

(declare-datatypes ((tuple2!14356 0))(
  ( (tuple2!14357 (_1!7637 BitStream!5822) (_2!7637 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!5822) tuple2!14356)

(assert (=> b!157970 (= lt!248878 (readByteArrayLoopPure!0 lt!248879 (array!7328 (store (arr!4220 arr!153) from!240 (_2!7637 (readBytePure!0 bs!65))) (size!3315 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun withMovedByteIndex!0 (BitStream!5822 (_ BitVec 32)) BitStream!5822)

(assert (=> b!157970 (= lt!248879 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun lt!248882 () tuple2!14354)

(assert (=> b!157970 (= lt!248882 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!157971 () Bool)

(declare-fun e!107210 () Bool)

(assert (=> b!157971 (= e!107211 e!107210)))

(declare-fun res!131973 () Bool)

(assert (=> b!157971 (=> (not res!131973) (not e!107210))))

(assert (=> b!157971 (= res!131973 (= (size!3315 (buf!3785 bs!65)) (size!3315 (buf!3785 lt!248879))))))

(declare-fun lt!248880 () tuple2!14356)

(assert (=> b!157971 (= lt!248880 (readBytePure!0 lt!248879))))

(declare-fun res!131975 () Bool)

(assert (=> start!31536 (=> (not res!131975) (not e!107208))))

(assert (=> start!31536 (= res!131975 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3315 arr!153))))))

(assert (=> start!31536 e!107208))

(assert (=> start!31536 true))

(declare-fun array_inv!3074 (array!7327) Bool)

(assert (=> start!31536 (array_inv!3074 arr!153)))

(declare-fun e!107207 () Bool)

(declare-fun inv!12 (BitStream!5822) Bool)

(assert (=> start!31536 (and (inv!12 bs!65) e!107207)))

(declare-fun b!157972 () Bool)

(assert (=> b!157972 (= e!107210 false)))

(declare-fun lt!248881 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!157972 (= lt!248881 (bitIndex!0 (size!3315 (buf!3785 lt!248879)) (currentByte!6956 lt!248879) (currentBit!6951 lt!248879)))))

(declare-fun b!157973 () Bool)

(assert (=> b!157973 (= e!107207 (array_inv!3074 (buf!3785 bs!65)))))

(assert (= (and start!31536 res!131975) b!157969))

(assert (= (and b!157969 res!131974) b!157970))

(assert (= (and b!157970 res!131972) b!157971))

(assert (= (and b!157971 res!131973) b!157972))

(assert (= start!31536 b!157973))

(declare-fun m!247625 () Bool)

(assert (=> start!31536 m!247625))

(declare-fun m!247627 () Bool)

(assert (=> start!31536 m!247627))

(declare-fun m!247629 () Bool)

(assert (=> b!157969 m!247629))

(declare-fun m!247631 () Bool)

(assert (=> b!157971 m!247631))

(declare-fun m!247633 () Bool)

(assert (=> b!157972 m!247633))

(declare-fun m!247635 () Bool)

(assert (=> b!157973 m!247635))

(declare-fun m!247637 () Bool)

(assert (=> b!157970 m!247637))

(declare-fun m!247639 () Bool)

(assert (=> b!157970 m!247639))

(declare-fun m!247641 () Bool)

(assert (=> b!157970 m!247641))

(declare-fun m!247643 () Bool)

(assert (=> b!157970 m!247643))

(declare-fun m!247645 () Bool)

(assert (=> b!157970 m!247645))

(push 1)

(assert (not start!31536))

(assert (not b!157970))

(assert (not b!157973))

(assert (not b!157969))

(assert (not b!157971))

(assert (not b!157972))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

