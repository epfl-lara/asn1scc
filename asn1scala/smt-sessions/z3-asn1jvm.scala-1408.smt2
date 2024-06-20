; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38706 () Bool)

(assert start!38706)

(declare-fun b!174272 () Bool)

(declare-fun res!144327 () Bool)

(declare-fun e!121548 () Bool)

(assert (=> b!174272 (=> (not res!144327) (not e!121548))))

(declare-datatypes ((array!9381 0))(
  ( (array!9382 (arr!5069 (Array (_ BitVec 32) (_ BitVec 8))) (size!4139 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7386 0))(
  ( (BitStream!7387 (buf!4570 array!9381) (currentByte!8684 (_ BitVec 32)) (currentBit!8679 (_ BitVec 32))) )
))
(declare-fun thiss!1187 () BitStream!7386)

(declare-fun nBits!340 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!174272 (= res!144327 (validate_offset_bits!1 ((_ sign_extend 32) (size!4139 (buf!4570 thiss!1187))) ((_ sign_extend 32) (currentByte!8684 thiss!1187)) ((_ sign_extend 32) (currentBit!8679 thiss!1187)) ((_ sign_extend 32) nBits!340)))))

(declare-fun b!174273 () Bool)

(declare-fun res!144330 () Bool)

(declare-fun e!121547 () Bool)

(assert (=> b!174273 (=> (not res!144330) (not e!121547))))

(declare-datatypes ((Unit!12532 0))(
  ( (Unit!12533) )
))
(declare-datatypes ((tuple2!15032 0))(
  ( (tuple2!15033 (_1!8158 Unit!12532) (_2!8158 BitStream!7386)) )
))
(declare-fun lt!268714 () tuple2!15032)

(declare-fun isPrefixOf!0 (BitStream!7386 BitStream!7386) Bool)

(assert (=> b!174273 (= res!144330 (isPrefixOf!0 thiss!1187 (_2!8158 lt!268714)))))

(declare-fun b!174274 () Bool)

(declare-fun res!144331 () Bool)

(assert (=> b!174274 (=> (not res!144331) (not e!121547))))

(assert (=> b!174274 (= res!144331 (= (size!4139 (buf!4570 thiss!1187)) (size!4139 (buf!4570 (_2!8158 lt!268714)))))))

(declare-fun b!174275 () Bool)

(assert (=> b!174275 (= e!121547 false)))

(declare-datatypes ((tuple2!15034 0))(
  ( (tuple2!15035 (_1!8159 BitStream!7386) (_2!8159 BitStream!7386)) )
))
(declare-fun lt!268715 () tuple2!15034)

(declare-fun reader!0 (BitStream!7386 BitStream!7386) tuple2!15034)

(assert (=> b!174275 (= lt!268715 (reader!0 thiss!1187 (_2!8158 lt!268714)))))

(declare-fun b!174276 () Bool)

(assert (=> b!174276 (= e!121548 e!121547)))

(declare-fun res!144328 () Bool)

(assert (=> b!174276 (=> (not res!144328) (not e!121547))))

(assert (=> b!174276 (= res!144328 (= (size!4139 (buf!4570 (_2!8158 lt!268714))) (size!4139 (buf!4570 thiss!1187))))))

(declare-fun v!186 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7386 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15032)

(assert (=> b!174276 (= lt!268714 (appendBitsLSBFirstLoopTR!0 thiss!1187 v!186 nBits!340 #b00000000000000000000000000000000))))

(declare-fun b!174277 () Bool)

(declare-fun e!121549 () Bool)

(declare-fun array_inv!3880 (array!9381) Bool)

(assert (=> b!174277 (= e!121549 (array_inv!3880 (buf!4570 thiss!1187)))))

(declare-fun b!174278 () Bool)

(declare-fun res!144333 () Bool)

(assert (=> b!174278 (=> (not res!144333) (not e!121548))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!174278 (= res!144333 (invariant!0 (currentBit!8679 thiss!1187) (currentByte!8684 thiss!1187) (size!4139 (buf!4570 thiss!1187))))))

(declare-fun b!174279 () Bool)

(declare-fun res!144332 () Bool)

(assert (=> b!174279 (=> (not res!144332) (not e!121547))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!174279 (= res!144332 (= (bitIndex!0 (size!4139 (buf!4570 (_2!8158 lt!268714))) (currentByte!8684 (_2!8158 lt!268714)) (currentBit!8679 (_2!8158 lt!268714))) (bvadd (bitIndex!0 (size!4139 (buf!4570 thiss!1187)) (currentByte!8684 thiss!1187) (currentBit!8679 thiss!1187)) ((_ sign_extend 32) nBits!340))))))

(declare-fun res!144329 () Bool)

(assert (=> start!38706 (=> (not res!144329) (not e!121548))))

(assert (=> start!38706 (= res!144329 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000)))))

(assert (=> start!38706 e!121548))

(assert (=> start!38706 true))

(declare-fun inv!12 (BitStream!7386) Bool)

(assert (=> start!38706 (and (inv!12 thiss!1187) e!121549)))

(assert (= (and start!38706 res!144329) b!174272))

(assert (= (and b!174272 res!144327) b!174278))

(assert (= (and b!174278 res!144333) b!174276))

(assert (= (and b!174276 res!144328) b!174279))

(assert (= (and b!174279 res!144332) b!174274))

(assert (= (and b!174274 res!144331) b!174273))

(assert (= (and b!174273 res!144330) b!174275))

(assert (= start!38706 b!174277))

(declare-fun m!273639 () Bool)

(assert (=> b!174275 m!273639))

(declare-fun m!273641 () Bool)

(assert (=> b!174277 m!273641))

(declare-fun m!273643 () Bool)

(assert (=> b!174273 m!273643))

(declare-fun m!273645 () Bool)

(assert (=> b!174278 m!273645))

(declare-fun m!273647 () Bool)

(assert (=> b!174272 m!273647))

(declare-fun m!273649 () Bool)

(assert (=> b!174276 m!273649))

(declare-fun m!273651 () Bool)

(assert (=> b!174279 m!273651))

(declare-fun m!273653 () Bool)

(assert (=> b!174279 m!273653))

(declare-fun m!273655 () Bool)

(assert (=> start!38706 m!273655))

(check-sat (not start!38706) (not b!174279) (not b!174275) (not b!174277) (not b!174276) (not b!174272) (not b!174273) (not b!174278))
