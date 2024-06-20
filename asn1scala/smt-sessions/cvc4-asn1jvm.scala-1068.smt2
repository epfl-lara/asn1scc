; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30668 () Bool)

(assert start!30668)

(declare-fun res!130387 () Bool)

(declare-fun e!105254 () Bool)

(assert (=> start!30668 (=> (not res!130387) (not e!105254))))

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(declare-datatypes ((array!7129 0))(
  ( (array!7130 (arr!4039 (Array (_ BitVec 32) (_ BitVec 8))) (size!3201 (_ BitVec 32))) )
))
(declare-fun arr!153 () array!7129)

(assert (=> start!30668 (= res!130387 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3201 arr!153))))))

(assert (=> start!30668 e!105254))

(assert (=> start!30668 true))

(declare-fun array_inv!2990 (array!7129) Bool)

(assert (=> start!30668 (array_inv!2990 arr!153)))

(declare-datatypes ((BitStream!5660 0))(
  ( (BitStream!5661 (buf!3704 array!7129) (currentByte!6786 (_ BitVec 32)) (currentBit!6781 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5660)

(declare-fun e!105251 () Bool)

(declare-fun inv!12 (BitStream!5660) Bool)

(assert (=> start!30668 (and (inv!12 bs!65) e!105251)))

(declare-fun b!155951 () Bool)

(declare-fun res!130388 () Bool)

(assert (=> b!155951 (=> (not res!130388) (not e!105254))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!155951 (= res!130388 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3201 (buf!3704 bs!65))) ((_ sign_extend 32) (currentByte!6786 bs!65)) ((_ sign_extend 32) (currentBit!6781 bs!65)) (bvsub to!236 from!240)))))

(declare-fun b!155952 () Bool)

(assert (=> b!155952 (= e!105254 (and (= from!240 (bvsub to!236 #b00000000000000000000000000000001)) (bvsgt #b00000000000000000000000000000000 to!236)))))

(declare-datatypes ((tuple2!13860 0))(
  ( (tuple2!13861 (_1!7359 BitStream!5660) (_2!7359 array!7129)) )
))
(declare-fun lt!242932 () tuple2!13860)

(declare-fun readByteArrayLoopPure!0 (BitStream!5660 array!7129 (_ BitVec 32) (_ BitVec 32)) tuple2!13860)

(declare-fun withMovedByteIndex!0 (BitStream!5660 (_ BitVec 32)) BitStream!5660)

(declare-datatypes ((tuple2!13862 0))(
  ( (tuple2!13863 (_1!7360 BitStream!5660) (_2!7360 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!5660) tuple2!13862)

(assert (=> b!155952 (= lt!242932 (readByteArrayLoopPure!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (array!7130 (store (arr!4039 arr!153) from!240 (_2!7360 (readBytePure!0 bs!65))) (size!3201 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun lt!242931 () tuple2!13860)

(assert (=> b!155952 (= lt!242931 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!155953 () Bool)

(assert (=> b!155953 (= e!105251 (array_inv!2990 (buf!3704 bs!65)))))

(assert (= (and start!30668 res!130387) b!155951))

(assert (= (and b!155951 res!130388) b!155952))

(assert (= start!30668 b!155953))

(declare-fun m!242403 () Bool)

(assert (=> start!30668 m!242403))

(declare-fun m!242405 () Bool)

(assert (=> start!30668 m!242405))

(declare-fun m!242407 () Bool)

(assert (=> b!155951 m!242407))

(declare-fun m!242409 () Bool)

(assert (=> b!155952 m!242409))

(declare-fun m!242411 () Bool)

(assert (=> b!155952 m!242411))

(assert (=> b!155952 m!242411))

(declare-fun m!242413 () Bool)

(assert (=> b!155952 m!242413))

(declare-fun m!242415 () Bool)

(assert (=> b!155952 m!242415))

(declare-fun m!242417 () Bool)

(assert (=> b!155952 m!242417))

(declare-fun m!242419 () Bool)

(assert (=> b!155953 m!242419))

(push 1)

(assert (not b!155953))

(assert (not b!155952))

(assert (not start!30668))

(assert (not b!155951))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

