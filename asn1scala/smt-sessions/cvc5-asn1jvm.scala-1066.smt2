; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30586 () Bool)

(assert start!30586)

(declare-fun res!130273 () Bool)

(declare-fun e!105094 () Bool)

(assert (=> start!30586 (=> (not res!130273) (not e!105094))))

(declare-fun from!240 () (_ BitVec 32))

(declare-datatypes ((array!7110 0))(
  ( (array!7111 (arr!4025 (Array (_ BitVec 32) (_ BitVec 8))) (size!3193 (_ BitVec 32))) )
))
(declare-fun arr!153 () array!7110)

(declare-fun to!236 () (_ BitVec 32))

(assert (=> start!30586 (= res!130273 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3193 arr!153))))))

(assert (=> start!30586 e!105094))

(assert (=> start!30586 true))

(declare-fun array_inv!2982 (array!7110) Bool)

(assert (=> start!30586 (array_inv!2982 arr!153)))

(declare-datatypes ((BitStream!5644 0))(
  ( (BitStream!5645 (buf!3696 array!7110) (currentByte!6769 (_ BitVec 32)) (currentBit!6764 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5644)

(declare-fun e!105095 () Bool)

(declare-fun inv!12 (BitStream!5644) Bool)

(assert (=> start!30586 (and (inv!12 bs!65) e!105095)))

(declare-fun b!155798 () Bool)

(declare-fun res!130274 () Bool)

(assert (=> b!155798 (=> (not res!130274) (not e!105094))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!155798 (= res!130274 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3193 (buf!3696 bs!65))) ((_ sign_extend 32) (currentByte!6769 bs!65)) ((_ sign_extend 32) (currentBit!6764 bs!65)) (bvsub to!236 from!240)))))

(declare-fun b!155799 () Bool)

(assert (=> b!155799 (= e!105094 (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-datatypes ((tuple2!13810 0))(
  ( (tuple2!13811 (_1!7331 BitStream!5644) (_2!7331 (_ BitVec 8))) )
))
(declare-fun lt!242463 () tuple2!13810)

(declare-fun readBytePure!0 (BitStream!5644) tuple2!13810)

(assert (=> b!155799 (= lt!242463 (readBytePure!0 bs!65))))

(declare-fun lt!242462 () BitStream!5644)

(declare-fun withMovedByteIndex!0 (BitStream!5644 (_ BitVec 32)) BitStream!5644)

(assert (=> b!155799 (= lt!242462 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))

(declare-datatypes ((tuple2!13812 0))(
  ( (tuple2!13813 (_1!7332 BitStream!5644) (_2!7332 array!7110)) )
))
(declare-fun lt!242464 () tuple2!13812)

(declare-fun readByteArrayLoopPure!0 (BitStream!5644 array!7110 (_ BitVec 32) (_ BitVec 32)) tuple2!13812)

(assert (=> b!155799 (= lt!242464 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!155800 () Bool)

(assert (=> b!155800 (= e!105095 (array_inv!2982 (buf!3696 bs!65)))))

(assert (= (and start!30586 res!130273) b!155798))

(assert (= (and b!155798 res!130274) b!155799))

(assert (= start!30586 b!155800))

(declare-fun m!242091 () Bool)

(assert (=> start!30586 m!242091))

(declare-fun m!242093 () Bool)

(assert (=> start!30586 m!242093))

(declare-fun m!242095 () Bool)

(assert (=> b!155798 m!242095))

(declare-fun m!242097 () Bool)

(assert (=> b!155799 m!242097))

(declare-fun m!242099 () Bool)

(assert (=> b!155799 m!242099))

(declare-fun m!242101 () Bool)

(assert (=> b!155799 m!242101))

(declare-fun m!242103 () Bool)

(assert (=> b!155800 m!242103))

(push 1)

(assert (not start!30586))

(assert (not b!155800))

(assert (not b!155799))

(assert (not b!155798))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

