; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38698 () Bool)

(assert start!38698)

(declare-fun b!174176 () Bool)

(declare-fun e!121501 () Bool)

(declare-fun nBits!340 () (_ BitVec 32))

(assert (=> b!174176 (= e!121501 (bvslt ((_ sign_extend 32) nBits!340) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((array!9373 0))(
  ( (array!9374 (arr!5065 (Array (_ BitVec 32) (_ BitVec 8))) (size!4135 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7378 0))(
  ( (BitStream!7379 (buf!4566 array!9373) (currentByte!8680 (_ BitVec 32)) (currentBit!8675 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15016 0))(
  ( (tuple2!15017 (_1!8150 BitStream!7378) (_2!8150 BitStream!7378)) )
))
(declare-fun lt!268690 () tuple2!15016)

(declare-fun thiss!1187 () BitStream!7378)

(declare-datatypes ((Unit!12524 0))(
  ( (Unit!12525) )
))
(declare-datatypes ((tuple2!15018 0))(
  ( (tuple2!15019 (_1!8151 Unit!12524) (_2!8151 BitStream!7378)) )
))
(declare-fun lt!268691 () tuple2!15018)

(declare-fun reader!0 (BitStream!7378 BitStream!7378) tuple2!15016)

(assert (=> b!174176 (= lt!268690 (reader!0 thiss!1187 (_2!8151 lt!268691)))))

(declare-fun res!144248 () Bool)

(declare-fun e!121499 () Bool)

(assert (=> start!38698 (=> (not res!144248) (not e!121499))))

(assert (=> start!38698 (= res!144248 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000)))))

(assert (=> start!38698 e!121499))

(assert (=> start!38698 true))

(declare-fun e!121500 () Bool)

(declare-fun inv!12 (BitStream!7378) Bool)

(assert (=> start!38698 (and (inv!12 thiss!1187) e!121500)))

(declare-fun b!174177 () Bool)

(declare-fun res!144243 () Bool)

(assert (=> b!174177 (=> (not res!144243) (not e!121501))))

(declare-fun isPrefixOf!0 (BitStream!7378 BitStream!7378) Bool)

(assert (=> b!174177 (= res!144243 (isPrefixOf!0 thiss!1187 (_2!8151 lt!268691)))))

(declare-fun b!174178 () Bool)

(declare-fun res!144247 () Bool)

(assert (=> b!174178 (=> (not res!144247) (not e!121501))))

(assert (=> b!174178 (= res!144247 (= (size!4135 (buf!4566 thiss!1187)) (size!4135 (buf!4566 (_2!8151 lt!268691)))))))

(declare-fun b!174179 () Bool)

(declare-fun res!144244 () Bool)

(assert (=> b!174179 (=> (not res!144244) (not e!121499))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!174179 (= res!144244 (validate_offset_bits!1 ((_ sign_extend 32) (size!4135 (buf!4566 thiss!1187))) ((_ sign_extend 32) (currentByte!8680 thiss!1187)) ((_ sign_extend 32) (currentBit!8675 thiss!1187)) ((_ sign_extend 32) nBits!340)))))

(declare-fun b!174180 () Bool)

(declare-fun res!144249 () Bool)

(assert (=> b!174180 (=> (not res!144249) (not e!121501))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!174180 (= res!144249 (= (bitIndex!0 (size!4135 (buf!4566 (_2!8151 lt!268691))) (currentByte!8680 (_2!8151 lt!268691)) (currentBit!8675 (_2!8151 lt!268691))) (bvadd (bitIndex!0 (size!4135 (buf!4566 thiss!1187)) (currentByte!8680 thiss!1187) (currentBit!8675 thiss!1187)) ((_ sign_extend 32) nBits!340))))))

(declare-fun b!174181 () Bool)

(declare-fun res!144245 () Bool)

(assert (=> b!174181 (=> (not res!144245) (not e!121499))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!174181 (= res!144245 (invariant!0 (currentBit!8675 thiss!1187) (currentByte!8680 thiss!1187) (size!4135 (buf!4566 thiss!1187))))))

(declare-fun b!174182 () Bool)

(declare-fun array_inv!3876 (array!9373) Bool)

(assert (=> b!174182 (= e!121500 (array_inv!3876 (buf!4566 thiss!1187)))))

(declare-fun b!174183 () Bool)

(assert (=> b!174183 (= e!121499 e!121501)))

(declare-fun res!144246 () Bool)

(assert (=> b!174183 (=> (not res!144246) (not e!121501))))

(assert (=> b!174183 (= res!144246 (= (size!4135 (buf!4566 (_2!8151 lt!268691))) (size!4135 (buf!4566 thiss!1187))))))

(declare-fun v!186 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7378 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15018)

(assert (=> b!174183 (= lt!268691 (appendBitsLSBFirstLoopTR!0 thiss!1187 v!186 nBits!340 #b00000000000000000000000000000000))))

(assert (= (and start!38698 res!144248) b!174179))

(assert (= (and b!174179 res!144244) b!174181))

(assert (= (and b!174181 res!144245) b!174183))

(assert (= (and b!174183 res!144246) b!174180))

(assert (= (and b!174180 res!144249) b!174178))

(assert (= (and b!174178 res!144247) b!174177))

(assert (= (and b!174177 res!144243) b!174176))

(assert (= start!38698 b!174182))

(declare-fun m!273567 () Bool)

(assert (=> b!174177 m!273567))

(declare-fun m!273569 () Bool)

(assert (=> b!174181 m!273569))

(declare-fun m!273571 () Bool)

(assert (=> b!174182 m!273571))

(declare-fun m!273573 () Bool)

(assert (=> b!174179 m!273573))

(declare-fun m!273575 () Bool)

(assert (=> start!38698 m!273575))

(declare-fun m!273577 () Bool)

(assert (=> b!174176 m!273577))

(declare-fun m!273579 () Bool)

(assert (=> b!174183 m!273579))

(declare-fun m!273581 () Bool)

(assert (=> b!174180 m!273581))

(declare-fun m!273583 () Bool)

(assert (=> b!174180 m!273583))

(push 1)

(assert (not b!174176))

(assert (not b!174177))

(assert (not b!174181))

(assert (not b!174179))

(assert (not start!38698))

(assert (not b!174182))

(assert (not b!174180))

(assert (not b!174183))

(check-sat)

(pop 1)

(push 1)

(check-sat)

