; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30666 () Bool)

(assert start!30666)

(declare-fun res!130381 () Bool)

(declare-fun e!105242 () Bool)

(assert (=> start!30666 (=> (not res!130381) (not e!105242))))

(declare-fun from!240 () (_ BitVec 32))

(declare-datatypes ((array!7127 0))(
  ( (array!7128 (arr!4038 (Array (_ BitVec 32) (_ BitVec 8))) (size!3200 (_ BitVec 32))) )
))
(declare-fun arr!153 () array!7127)

(declare-fun to!236 () (_ BitVec 32))

(assert (=> start!30666 (= res!130381 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3200 arr!153))))))

(assert (=> start!30666 e!105242))

(assert (=> start!30666 true))

(declare-fun array_inv!2989 (array!7127) Bool)

(assert (=> start!30666 (array_inv!2989 arr!153)))

(declare-datatypes ((BitStream!5658 0))(
  ( (BitStream!5659 (buf!3703 array!7127) (currentByte!6785 (_ BitVec 32)) (currentBit!6780 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5658)

(declare-fun e!105241 () Bool)

(declare-fun inv!12 (BitStream!5658) Bool)

(assert (=> start!30666 (and (inv!12 bs!65) e!105241)))

(declare-fun b!155942 () Bool)

(declare-fun res!130382 () Bool)

(assert (=> b!155942 (=> (not res!130382) (not e!105242))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!155942 (= res!130382 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3200 (buf!3703 bs!65))) ((_ sign_extend 32) (currentByte!6785 bs!65)) ((_ sign_extend 32) (currentBit!6780 bs!65)) (bvsub to!236 from!240)))))

(declare-fun b!155943 () Bool)

(assert (=> b!155943 (= e!105242 (and (= from!240 (bvsub to!236 #b00000000000000000000000000000001)) (bvsgt #b00000000000000000000000000000000 to!236)))))

(declare-datatypes ((tuple2!13856 0))(
  ( (tuple2!13857 (_1!7357 BitStream!5658) (_2!7357 array!7127)) )
))
(declare-fun lt!242926 () tuple2!13856)

(declare-fun readByteArrayLoopPure!0 (BitStream!5658 array!7127 (_ BitVec 32) (_ BitVec 32)) tuple2!13856)

(declare-fun withMovedByteIndex!0 (BitStream!5658 (_ BitVec 32)) BitStream!5658)

(declare-datatypes ((tuple2!13858 0))(
  ( (tuple2!13859 (_1!7358 BitStream!5658) (_2!7358 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!5658) tuple2!13858)

(assert (=> b!155943 (= lt!242926 (readByteArrayLoopPure!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (array!7128 (store (arr!4038 arr!153) from!240 (_2!7358 (readBytePure!0 bs!65))) (size!3200 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun lt!242925 () tuple2!13856)

(assert (=> b!155943 (= lt!242925 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!155944 () Bool)

(assert (=> b!155944 (= e!105241 (array_inv!2989 (buf!3703 bs!65)))))

(assert (= (and start!30666 res!130381) b!155942))

(assert (= (and b!155942 res!130382) b!155943))

(assert (= start!30666 b!155944))

(declare-fun m!242385 () Bool)

(assert (=> start!30666 m!242385))

(declare-fun m!242387 () Bool)

(assert (=> start!30666 m!242387))

(declare-fun m!242389 () Bool)

(assert (=> b!155942 m!242389))

(declare-fun m!242391 () Bool)

(assert (=> b!155943 m!242391))

(declare-fun m!242393 () Bool)

(assert (=> b!155943 m!242393))

(assert (=> b!155943 m!242393))

(declare-fun m!242395 () Bool)

(assert (=> b!155943 m!242395))

(declare-fun m!242397 () Bool)

(assert (=> b!155943 m!242397))

(declare-fun m!242399 () Bool)

(assert (=> b!155943 m!242399))

(declare-fun m!242401 () Bool)

(assert (=> b!155944 m!242401))

(check-sat (not b!155942) (not b!155944) (not b!155943) (not start!30666))
