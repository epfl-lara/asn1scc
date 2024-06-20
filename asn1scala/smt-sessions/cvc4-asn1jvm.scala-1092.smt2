; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31394 () Bool)

(assert start!31394)

(declare-fun b!157658 () Bool)

(declare-fun e!106901 () Bool)

(declare-fun e!106902 () Bool)

(assert (=> b!157658 (= e!106901 e!106902)))

(declare-fun res!131724 () Bool)

(assert (=> b!157658 (=> (not res!131724) (not e!106902))))

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(assert (=> b!157658 (= res!131724 (not (= from!240 (bvsub to!236 #b00000000000000000000000000000001))))))

(declare-datatypes ((array!7297 0))(
  ( (array!7298 (arr!4198 (Array (_ BitVec 32) (_ BitVec 8))) (size!3303 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5798 0))(
  ( (BitStream!5799 (buf!3773 array!7297) (currentByte!6927 (_ BitVec 32)) (currentBit!6922 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5798)

(declare-datatypes ((tuple2!14274 0))(
  ( (tuple2!14275 (_1!7590 BitStream!5798) (_2!7590 array!7297)) )
))
(declare-fun lt!247927 () tuple2!14274)

(declare-fun lt!247928 () BitStream!5798)

(declare-fun arr!153 () array!7297)

(declare-fun readByteArrayLoopPure!0 (BitStream!5798 array!7297 (_ BitVec 32) (_ BitVec 32)) tuple2!14274)

(declare-datatypes ((tuple2!14276 0))(
  ( (tuple2!14277 (_1!7591 BitStream!5798) (_2!7591 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!5798) tuple2!14276)

(assert (=> b!157658 (= lt!247927 (readByteArrayLoopPure!0 lt!247928 (array!7298 (store (arr!4198 arr!153) from!240 (_2!7591 (readBytePure!0 bs!65))) (size!3303 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun withMovedByteIndex!0 (BitStream!5798 (_ BitVec 32)) BitStream!5798)

(assert (=> b!157658 (= lt!247928 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun lt!247929 () tuple2!14274)

(assert (=> b!157658 (= lt!247929 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!157657 () Bool)

(declare-fun res!131726 () Bool)

(assert (=> b!157657 (=> (not res!131726) (not e!106901))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!157657 (= res!131726 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3303 (buf!3773 bs!65))) ((_ sign_extend 32) (currentByte!6927 bs!65)) ((_ sign_extend 32) (currentBit!6922 bs!65)) (bvsub to!236 from!240)))))

(declare-fun b!157660 () Bool)

(declare-fun e!106903 () Bool)

(declare-fun array_inv!3062 (array!7297) Bool)

(assert (=> b!157660 (= e!106903 (array_inv!3062 (buf!3773 bs!65)))))

(declare-fun b!157659 () Bool)

(assert (=> b!157659 (= e!106902 (and (not (= (bvand to!236 #b10000000000000000000000000000000) (bvand from!240 #b10000000000000000000000000000000))) (not (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvsub to!236 from!240) #b10000000000000000000000000000000)))))))

(declare-fun lt!247930 () tuple2!14276)

(assert (=> b!157659 (= lt!247930 (readBytePure!0 lt!247928))))

(declare-fun res!131725 () Bool)

(assert (=> start!31394 (=> (not res!131725) (not e!106901))))

(assert (=> start!31394 (= res!131725 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3303 arr!153))))))

(assert (=> start!31394 e!106901))

(assert (=> start!31394 true))

(assert (=> start!31394 (array_inv!3062 arr!153)))

(declare-fun inv!12 (BitStream!5798) Bool)

(assert (=> start!31394 (and (inv!12 bs!65) e!106903)))

(assert (= (and start!31394 res!131725) b!157657))

(assert (= (and b!157657 res!131726) b!157658))

(assert (= (and b!157658 res!131724) b!157659))

(assert (= start!31394 b!157660))

(declare-fun m!246883 () Bool)

(assert (=> b!157660 m!246883))

(declare-fun m!246885 () Bool)

(assert (=> b!157658 m!246885))

(declare-fun m!246887 () Bool)

(assert (=> b!157658 m!246887))

(declare-fun m!246889 () Bool)

(assert (=> b!157658 m!246889))

(declare-fun m!246891 () Bool)

(assert (=> b!157658 m!246891))

(declare-fun m!246893 () Bool)

(assert (=> b!157658 m!246893))

(declare-fun m!246895 () Bool)

(assert (=> start!31394 m!246895))

(declare-fun m!246897 () Bool)

(assert (=> start!31394 m!246897))

(declare-fun m!246899 () Bool)

(assert (=> b!157659 m!246899))

(declare-fun m!246901 () Bool)

(assert (=> b!157657 m!246901))

(push 1)

(assert (not b!157657))

(assert (not b!157659))

(assert (not b!157660))

(assert (not start!31394))

(assert (not b!157658))

(check-sat)

(pop 1)

(push 1)

(check-sat)

