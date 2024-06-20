; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44834 () Bool)

(assert start!44834)

(declare-fun b!215464 () Bool)

(declare-fun res!181258 () Bool)

(declare-fun e!146599 () Bool)

(assert (=> b!215464 (=> res!181258 e!146599)))

(declare-fun lt!340230 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-datatypes ((array!10597 0))(
  ( (array!10598 (arr!5585 (Array (_ BitVec 32) (_ BitVec 8))) (size!4655 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8418 0))(
  ( (BitStream!8419 (buf!5190 array!10597) (currentByte!9768 (_ BitVec 32)) (currentBit!9763 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8418)

(declare-fun i!590 () (_ BitVec 32))

(declare-datatypes ((Unit!15294 0))(
  ( (Unit!15295) )
))
(declare-datatypes ((tuple2!18466 0))(
  ( (tuple2!18467 (_1!9888 Unit!15294) (_2!9888 BitStream!8418)) )
))
(declare-fun lt!340213 () tuple2!18466)

(declare-fun lt!340231 () (_ BitVec 64))

(assert (=> b!215464 (= res!181258 (or (not (= (size!4655 (buf!5190 (_2!9888 lt!340213))) (size!4655 (buf!5190 thiss!1204)))) (not (= lt!340230 (bvsub (bvadd lt!340231 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!215465 () Bool)

(declare-fun res!181267 () Bool)

(declare-fun e!146601 () Bool)

(assert (=> b!215465 (=> (not res!181267) (not e!146601))))

(declare-datatypes ((tuple2!18468 0))(
  ( (tuple2!18469 (_1!9889 BitStream!8418) (_2!9889 BitStream!8418)) )
))
(declare-fun lt!340223 () tuple2!18468)

(declare-fun lt!340238 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!8418 (_ BitVec 64)) BitStream!8418)

(assert (=> b!215465 (= res!181267 (= (_1!9889 lt!340223) (withMovedBitIndex!0 (_2!9889 lt!340223) (bvsub lt!340238 lt!340230))))))

(declare-fun b!215466 () Bool)

(declare-fun res!181257 () Bool)

(assert (=> b!215466 (=> res!181257 e!146599)))

(declare-fun lt!340226 () tuple2!18466)

(declare-fun isPrefixOf!0 (BitStream!8418 BitStream!8418) Bool)

(assert (=> b!215466 (= res!181257 (not (isPrefixOf!0 thiss!1204 (_2!9888 lt!340226))))))

(declare-fun b!215467 () Bool)

(declare-fun e!146608 () Bool)

(assert (=> b!215467 (= e!146599 e!146608)))

(declare-fun res!181264 () Bool)

(assert (=> b!215467 (=> res!181264 e!146608)))

(declare-datatypes ((tuple2!18470 0))(
  ( (tuple2!18471 (_1!9890 BitStream!8418) (_2!9890 (_ BitVec 64))) )
))
(declare-fun lt!340239 () tuple2!18470)

(assert (=> b!215467 (= res!181264 (not (= (_1!9890 lt!340239) (_2!9889 lt!340223))))))

(declare-fun lt!340233 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8418 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18470)

(assert (=> b!215467 (= lt!340239 (readNBitsLSBFirstsLoopPure!0 (_1!9889 lt!340223) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!340233))))

(declare-fun lt!340218 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!215467 (validate_offset_bits!1 ((_ sign_extend 32) (size!4655 (buf!5190 (_2!9888 lt!340213)))) ((_ sign_extend 32) (currentByte!9768 (_2!9888 lt!340226))) ((_ sign_extend 32) (currentBit!9763 (_2!9888 lt!340226))) lt!340218)))

(declare-fun lt!340236 () Unit!15294)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8418 array!10597 (_ BitVec 64)) Unit!15294)

(assert (=> b!215467 (= lt!340236 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9888 lt!340226) (buf!5190 (_2!9888 lt!340213)) lt!340218))))

(assert (=> b!215467 (= lt!340218 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!18472 0))(
  ( (tuple2!18473 (_1!9891 BitStream!8418) (_2!9891 Bool)) )
))
(declare-fun lt!340235 () tuple2!18472)

(declare-fun lt!340228 () (_ BitVec 64))

(declare-fun lt!340240 () (_ BitVec 64))

(assert (=> b!215467 (= lt!340233 (bvor lt!340240 (ite (_2!9891 lt!340235) lt!340228 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!340237 () tuple2!18470)

(declare-fun lt!340215 () tuple2!18468)

(assert (=> b!215467 (= lt!340237 (readNBitsLSBFirstsLoopPure!0 (_1!9889 lt!340215) nBits!348 i!590 lt!340240))))

(declare-fun lt!340225 () (_ BitVec 64))

(assert (=> b!215467 (validate_offset_bits!1 ((_ sign_extend 32) (size!4655 (buf!5190 (_2!9888 lt!340213)))) ((_ sign_extend 32) (currentByte!9768 thiss!1204)) ((_ sign_extend 32) (currentBit!9763 thiss!1204)) lt!340225)))

(declare-fun lt!340227 () Unit!15294)

(assert (=> b!215467 (= lt!340227 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5190 (_2!9888 lt!340213)) lt!340225))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!215467 (= lt!340240 (bvand v!189 (onesLSBLong!0 i!590)))))

(declare-fun lt!340224 () Bool)

(assert (=> b!215467 (= (_2!9891 lt!340235) lt!340224)))

(declare-fun readBitPure!0 (BitStream!8418) tuple2!18472)

(assert (=> b!215467 (= lt!340235 (readBitPure!0 (_1!9889 lt!340215)))))

(declare-fun reader!0 (BitStream!8418 BitStream!8418) tuple2!18468)

(assert (=> b!215467 (= lt!340223 (reader!0 (_2!9888 lt!340226) (_2!9888 lt!340213)))))

(assert (=> b!215467 (= lt!340215 (reader!0 thiss!1204 (_2!9888 lt!340213)))))

(declare-fun e!146602 () Bool)

(assert (=> b!215467 e!146602))

(declare-fun res!181266 () Bool)

(assert (=> b!215467 (=> (not res!181266) (not e!146602))))

(declare-fun lt!340222 () tuple2!18472)

(declare-fun lt!340234 () tuple2!18472)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!215467 (= res!181266 (= (bitIndex!0 (size!4655 (buf!5190 (_1!9891 lt!340222))) (currentByte!9768 (_1!9891 lt!340222)) (currentBit!9763 (_1!9891 lt!340222))) (bitIndex!0 (size!4655 (buf!5190 (_1!9891 lt!340234))) (currentByte!9768 (_1!9891 lt!340234)) (currentBit!9763 (_1!9891 lt!340234)))))))

(declare-fun lt!340232 () Unit!15294)

(declare-fun lt!340221 () BitStream!8418)

(declare-fun readBitPrefixLemma!0 (BitStream!8418 BitStream!8418) Unit!15294)

(assert (=> b!215467 (= lt!340232 (readBitPrefixLemma!0 lt!340221 (_2!9888 lt!340213)))))

(assert (=> b!215467 (= lt!340234 (readBitPure!0 (BitStream!8419 (buf!5190 (_2!9888 lt!340213)) (currentByte!9768 thiss!1204) (currentBit!9763 thiss!1204))))))

(assert (=> b!215467 (= lt!340222 (readBitPure!0 lt!340221))))

(declare-fun e!146611 () Bool)

(assert (=> b!215467 e!146611))

(declare-fun res!181255 () Bool)

(assert (=> b!215467 (=> (not res!181255) (not e!146611))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!215467 (= res!181255 (invariant!0 (currentBit!9763 thiss!1204) (currentByte!9768 thiss!1204) (size!4655 (buf!5190 (_2!9888 lt!340226)))))))

(assert (=> b!215467 (= lt!340221 (BitStream!8419 (buf!5190 (_2!9888 lt!340226)) (currentByte!9768 thiss!1204) (currentBit!9763 thiss!1204)))))

(declare-fun b!215468 () Bool)

(declare-fun e!146607 () Bool)

(declare-fun e!146606 () Bool)

(assert (=> b!215468 (= e!146607 e!146606)))

(declare-fun res!181268 () Bool)

(assert (=> b!215468 (=> (not res!181268) (not e!146606))))

(declare-fun lt!340220 () tuple2!18472)

(assert (=> b!215468 (= res!181268 (and (= (_2!9891 lt!340220) lt!340224) (= (_1!9891 lt!340220) (_2!9888 lt!340226))))))

(declare-fun readerFrom!0 (BitStream!8418 (_ BitVec 32) (_ BitVec 32)) BitStream!8418)

(assert (=> b!215468 (= lt!340220 (readBitPure!0 (readerFrom!0 (_2!9888 lt!340226) (currentBit!9763 thiss!1204) (currentByte!9768 thiss!1204))))))

(declare-fun b!215469 () Bool)

(declare-fun res!181259 () Bool)

(assert (=> b!215469 (=> (not res!181259) (not e!146601))))

(assert (=> b!215469 (= res!181259 (= (_1!9889 lt!340215) (withMovedBitIndex!0 (_2!9889 lt!340215) (bvsub lt!340231 lt!340230))))))

(declare-fun b!215470 () Bool)

(declare-fun lt!340219 () BitStream!8418)

(assert (=> b!215470 (= e!146601 (and (= lt!340231 (bvsub lt!340238 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!9889 lt!340223) lt!340219)) (= (_2!9890 lt!340237) (_2!9890 lt!340239)))))))

(declare-fun b!215471 () Bool)

(assert (=> b!215471 (= e!146602 (= (_2!9891 lt!340222) (_2!9891 lt!340234)))))

(declare-fun b!215472 () Bool)

(declare-fun e!146600 () Bool)

(declare-fun e!146603 () Bool)

(assert (=> b!215472 (= e!146600 (not e!146603))))

(declare-fun res!181270 () Bool)

(assert (=> b!215472 (=> res!181270 e!146603)))

(assert (=> b!215472 (= res!181270 (not (= lt!340238 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!340231))))))

(assert (=> b!215472 (= lt!340238 (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!340226))) (currentByte!9768 (_2!9888 lt!340226)) (currentBit!9763 (_2!9888 lt!340226))))))

(assert (=> b!215472 (= lt!340231 (bitIndex!0 (size!4655 (buf!5190 thiss!1204)) (currentByte!9768 thiss!1204) (currentBit!9763 thiss!1204)))))

(declare-fun e!146612 () Bool)

(assert (=> b!215472 e!146612))

(declare-fun res!181274 () Bool)

(assert (=> b!215472 (=> (not res!181274) (not e!146612))))

(assert (=> b!215472 (= res!181274 (= (size!4655 (buf!5190 thiss!1204)) (size!4655 (buf!5190 (_2!9888 lt!340226)))))))

(declare-fun appendBit!0 (BitStream!8418 Bool) tuple2!18466)

(assert (=> b!215472 (= lt!340226 (appendBit!0 thiss!1204 lt!340224))))

(assert (=> b!215472 (= lt!340224 (not (= (bvand v!189 lt!340228) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!215472 (= lt!340228 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!215473 () Bool)

(declare-fun res!181277 () Bool)

(assert (=> b!215473 (=> (not res!181277) (not e!146607))))

(assert (=> b!215473 (= res!181277 (isPrefixOf!0 thiss!1204 (_2!9888 lt!340226)))))

(declare-fun b!215474 () Bool)

(declare-fun lt!340241 () (_ BitVec 64))

(assert (=> b!215474 (= e!146606 (= (bitIndex!0 (size!4655 (buf!5190 (_1!9891 lt!340220))) (currentByte!9768 (_1!9891 lt!340220)) (currentBit!9763 (_1!9891 lt!340220))) lt!340241))))

(declare-fun b!215475 () Bool)

(assert (=> b!215475 (= e!146611 (invariant!0 (currentBit!9763 thiss!1204) (currentByte!9768 thiss!1204) (size!4655 (buf!5190 (_2!9888 lt!340213)))))))

(declare-fun b!215476 () Bool)

(declare-fun res!181260 () Bool)

(assert (=> b!215476 (=> (not res!181260) (not e!146600))))

(assert (=> b!215476 (= res!181260 (invariant!0 (currentBit!9763 thiss!1204) (currentByte!9768 thiss!1204) (size!4655 (buf!5190 thiss!1204))))))

(declare-fun res!181262 () Bool)

(declare-fun e!146604 () Bool)

(assert (=> start!44834 (=> (not res!181262) (not e!146604))))

(assert (=> start!44834 (= res!181262 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!44834 e!146604))

(assert (=> start!44834 true))

(declare-fun e!146609 () Bool)

(declare-fun inv!12 (BitStream!8418) Bool)

(assert (=> start!44834 (and (inv!12 thiss!1204) e!146609)))

(declare-fun b!215477 () Bool)

(declare-fun e!146605 () Bool)

(assert (=> b!215477 (= e!146605 (= (_1!9890 lt!340237) (_2!9889 lt!340215)))))

(declare-fun b!215478 () Bool)

(assert (=> b!215478 (= e!146612 e!146607)))

(declare-fun res!181273 () Bool)

(assert (=> b!215478 (=> (not res!181273) (not e!146607))))

(declare-fun lt!340214 () (_ BitVec 64))

(assert (=> b!215478 (= res!181273 (= lt!340241 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!340214)))))

(assert (=> b!215478 (= lt!340241 (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!340226))) (currentByte!9768 (_2!9888 lt!340226)) (currentBit!9763 (_2!9888 lt!340226))))))

(assert (=> b!215478 (= lt!340214 (bitIndex!0 (size!4655 (buf!5190 thiss!1204)) (currentByte!9768 thiss!1204) (currentBit!9763 thiss!1204)))))

(declare-fun b!215479 () Bool)

(declare-fun res!181265 () Bool)

(assert (=> b!215479 (=> res!181265 e!146599)))

(assert (=> b!215479 (= res!181265 (not (invariant!0 (currentBit!9763 (_2!9888 lt!340213)) (currentByte!9768 (_2!9888 lt!340213)) (size!4655 (buf!5190 (_2!9888 lt!340213))))))))

(declare-fun b!215480 () Bool)

(declare-fun array_inv!4396 (array!10597) Bool)

(assert (=> b!215480 (= e!146609 (array_inv!4396 (buf!5190 thiss!1204)))))

(declare-fun b!215481 () Bool)

(assert (=> b!215481 (= e!146603 e!146599)))

(declare-fun res!181263 () Bool)

(assert (=> b!215481 (=> res!181263 e!146599)))

(assert (=> b!215481 (= res!181263 (not (= lt!340230 (bvsub (bvsub (bvadd lt!340238 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!215481 (= lt!340230 (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!340213))) (currentByte!9768 (_2!9888 lt!340213)) (currentBit!9763 (_2!9888 lt!340213))))))

(assert (=> b!215481 (isPrefixOf!0 thiss!1204 (_2!9888 lt!340213))))

(declare-fun lt!340217 () Unit!15294)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8418 BitStream!8418 BitStream!8418) Unit!15294)

(assert (=> b!215481 (= lt!340217 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9888 lt!340226) (_2!9888 lt!340213)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8418 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!18466)

(assert (=> b!215481 (= lt!340213 (appendBitsLSBFirstLoopTR!0 (_2!9888 lt!340226) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!215482 () Bool)

(declare-fun res!181261 () Bool)

(assert (=> b!215482 (=> (not res!181261) (not e!146600))))

(assert (=> b!215482 (= res!181261 (not (= i!590 nBits!348)))))

(declare-fun b!215483 () Bool)

(declare-fun res!181256 () Bool)

(declare-fun e!146610 () Bool)

(assert (=> b!215483 (=> res!181256 e!146610)))

(assert (=> b!215483 (= res!181256 (not (= (bitIndex!0 (size!4655 (buf!5190 (_1!9890 lt!340237))) (currentByte!9768 (_1!9890 lt!340237)) (currentBit!9763 (_1!9890 lt!340237))) (bitIndex!0 (size!4655 (buf!5190 (_2!9889 lt!340215))) (currentByte!9768 (_2!9889 lt!340215)) (currentBit!9763 (_2!9889 lt!340215))))))))

(declare-fun b!215484 () Bool)

(declare-fun res!181269 () Bool)

(assert (=> b!215484 (=> res!181269 e!146599)))

(assert (=> b!215484 (= res!181269 (not (isPrefixOf!0 (_2!9888 lt!340226) (_2!9888 lt!340213))))))

(declare-fun b!215485 () Bool)

(assert (=> b!215485 (= e!146610 e!146605)))

(declare-fun res!181276 () Bool)

(assert (=> b!215485 (=> (not res!181276) (not e!146605))))

(assert (=> b!215485 (= res!181276 (= (_2!9890 lt!340237) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!215485 (= (size!4655 (buf!5190 thiss!1204)) (size!4655 (buf!5190 (_2!9888 lt!340213))))))

(declare-fun b!215486 () Bool)

(assert (=> b!215486 (= e!146608 e!146610)))

(declare-fun res!181272 () Bool)

(assert (=> b!215486 (=> res!181272 e!146610)))

(assert (=> b!215486 (= res!181272 (not (= (_1!9889 lt!340223) lt!340219)))))

(assert (=> b!215486 e!146601))

(declare-fun res!181275 () Bool)

(assert (=> b!215486 (=> (not res!181275) (not e!146601))))

(declare-fun lt!340216 () tuple2!18470)

(assert (=> b!215486 (= res!181275 (and (= (_2!9890 lt!340237) (_2!9890 lt!340216)) (= (_1!9890 lt!340237) (_1!9890 lt!340216))))))

(declare-fun lt!340229 () Unit!15294)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8418 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!15294)

(assert (=> b!215486 (= lt!340229 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9889 lt!340215) nBits!348 i!590 lt!340240))))

(assert (=> b!215486 (= lt!340216 (readNBitsLSBFirstsLoopPure!0 lt!340219 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!340233))))

(assert (=> b!215486 (= lt!340219 (withMovedBitIndex!0 (_1!9889 lt!340215) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!215487 () Bool)

(assert (=> b!215487 (= e!146604 e!146600)))

(declare-fun res!181271 () Bool)

(assert (=> b!215487 (=> (not res!181271) (not e!146600))))

(assert (=> b!215487 (= res!181271 (validate_offset_bits!1 ((_ sign_extend 32) (size!4655 (buf!5190 thiss!1204))) ((_ sign_extend 32) (currentByte!9768 thiss!1204)) ((_ sign_extend 32) (currentBit!9763 thiss!1204)) lt!340225))))

(assert (=> b!215487 (= lt!340225 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(assert (= (and start!44834 res!181262) b!215487))

(assert (= (and b!215487 res!181271) b!215476))

(assert (= (and b!215476 res!181260) b!215482))

(assert (= (and b!215482 res!181261) b!215472))

(assert (= (and b!215472 res!181274) b!215478))

(assert (= (and b!215478 res!181273) b!215473))

(assert (= (and b!215473 res!181277) b!215468))

(assert (= (and b!215468 res!181268) b!215474))

(assert (= (and b!215472 (not res!181270)) b!215481))

(assert (= (and b!215481 (not res!181263)) b!215479))

(assert (= (and b!215479 (not res!181265)) b!215464))

(assert (= (and b!215464 (not res!181258)) b!215484))

(assert (= (and b!215484 (not res!181269)) b!215466))

(assert (= (and b!215466 (not res!181257)) b!215467))

(assert (= (and b!215467 res!181255) b!215475))

(assert (= (and b!215467 res!181266) b!215471))

(assert (= (and b!215467 (not res!181264)) b!215486))

(assert (= (and b!215486 res!181275) b!215469))

(assert (= (and b!215469 res!181259) b!215465))

(assert (= (and b!215465 res!181267) b!215470))

(assert (= (and b!215486 (not res!181272)) b!215483))

(assert (= (and b!215483 (not res!181256)) b!215485))

(assert (= (and b!215485 res!181276) b!215477))

(assert (= start!44834 b!215480))

(declare-fun m!331707 () Bool)

(assert (=> b!215465 m!331707))

(declare-fun m!331709 () Bool)

(assert (=> b!215468 m!331709))

(assert (=> b!215468 m!331709))

(declare-fun m!331711 () Bool)

(assert (=> b!215468 m!331711))

(declare-fun m!331713 () Bool)

(assert (=> b!215478 m!331713))

(declare-fun m!331715 () Bool)

(assert (=> b!215478 m!331715))

(declare-fun m!331717 () Bool)

(assert (=> b!215485 m!331717))

(declare-fun m!331719 () Bool)

(assert (=> b!215480 m!331719))

(declare-fun m!331721 () Bool)

(assert (=> b!215467 m!331721))

(declare-fun m!331723 () Bool)

(assert (=> b!215467 m!331723))

(declare-fun m!331725 () Bool)

(assert (=> b!215467 m!331725))

(declare-fun m!331727 () Bool)

(assert (=> b!215467 m!331727))

(declare-fun m!331729 () Bool)

(assert (=> b!215467 m!331729))

(declare-fun m!331731 () Bool)

(assert (=> b!215467 m!331731))

(declare-fun m!331733 () Bool)

(assert (=> b!215467 m!331733))

(declare-fun m!331735 () Bool)

(assert (=> b!215467 m!331735))

(declare-fun m!331737 () Bool)

(assert (=> b!215467 m!331737))

(declare-fun m!331739 () Bool)

(assert (=> b!215467 m!331739))

(declare-fun m!331741 () Bool)

(assert (=> b!215467 m!331741))

(declare-fun m!331743 () Bool)

(assert (=> b!215467 m!331743))

(declare-fun m!331745 () Bool)

(assert (=> b!215467 m!331745))

(declare-fun m!331747 () Bool)

(assert (=> b!215467 m!331747))

(declare-fun m!331749 () Bool)

(assert (=> b!215467 m!331749))

(declare-fun m!331751 () Bool)

(assert (=> b!215467 m!331751))

(declare-fun m!331753 () Bool)

(assert (=> b!215473 m!331753))

(declare-fun m!331755 () Bool)

(assert (=> b!215474 m!331755))

(declare-fun m!331757 () Bool)

(assert (=> b!215487 m!331757))

(declare-fun m!331759 () Bool)

(assert (=> b!215475 m!331759))

(assert (=> b!215466 m!331753))

(declare-fun m!331761 () Bool)

(assert (=> b!215479 m!331761))

(declare-fun m!331763 () Bool)

(assert (=> b!215481 m!331763))

(declare-fun m!331765 () Bool)

(assert (=> b!215481 m!331765))

(declare-fun m!331767 () Bool)

(assert (=> b!215481 m!331767))

(declare-fun m!331769 () Bool)

(assert (=> b!215481 m!331769))

(assert (=> b!215472 m!331713))

(assert (=> b!215472 m!331715))

(declare-fun m!331771 () Bool)

(assert (=> b!215472 m!331771))

(declare-fun m!331773 () Bool)

(assert (=> b!215469 m!331773))

(declare-fun m!331775 () Bool)

(assert (=> b!215486 m!331775))

(declare-fun m!331777 () Bool)

(assert (=> b!215486 m!331777))

(declare-fun m!331779 () Bool)

(assert (=> b!215486 m!331779))

(declare-fun m!331781 () Bool)

(assert (=> b!215476 m!331781))

(declare-fun m!331783 () Bool)

(assert (=> start!44834 m!331783))

(declare-fun m!331785 () Bool)

(assert (=> b!215484 m!331785))

(declare-fun m!331787 () Bool)

(assert (=> b!215483 m!331787))

(declare-fun m!331789 () Bool)

(assert (=> b!215483 m!331789))

(check-sat (not b!215472) (not b!215481) (not b!215486) (not b!215483) (not b!215479) (not b!215487) (not b!215485) (not b!215475) (not b!215478) (not b!215465) (not b!215473) (not b!215466) (not start!44834) (not b!215476) (not b!215474) (not b!215484) (not b!215469) (not b!215480) (not b!215467) (not b!215468))
(check-sat)
(get-model)

(declare-fun d!72475 () Bool)

(declare-fun res!181353 () Bool)

(declare-fun e!146663 () Bool)

(assert (=> d!72475 (=> (not res!181353) (not e!146663))))

(assert (=> d!72475 (= res!181353 (= (size!4655 (buf!5190 thiss!1204)) (size!4655 (buf!5190 (_2!9888 lt!340226)))))))

(assert (=> d!72475 (= (isPrefixOf!0 thiss!1204 (_2!9888 lt!340226)) e!146663)))

(declare-fun b!215566 () Bool)

(declare-fun res!181355 () Bool)

(assert (=> b!215566 (=> (not res!181355) (not e!146663))))

(assert (=> b!215566 (= res!181355 (bvsle (bitIndex!0 (size!4655 (buf!5190 thiss!1204)) (currentByte!9768 thiss!1204) (currentBit!9763 thiss!1204)) (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!340226))) (currentByte!9768 (_2!9888 lt!340226)) (currentBit!9763 (_2!9888 lt!340226)))))))

(declare-fun b!215567 () Bool)

(declare-fun e!146664 () Bool)

(assert (=> b!215567 (= e!146663 e!146664)))

(declare-fun res!181354 () Bool)

(assert (=> b!215567 (=> res!181354 e!146664)))

(assert (=> b!215567 (= res!181354 (= (size!4655 (buf!5190 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!215568 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10597 array!10597 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!215568 (= e!146664 (arrayBitRangesEq!0 (buf!5190 thiss!1204) (buf!5190 (_2!9888 lt!340226)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4655 (buf!5190 thiss!1204)) (currentByte!9768 thiss!1204) (currentBit!9763 thiss!1204))))))

(assert (= (and d!72475 res!181353) b!215566))

(assert (= (and b!215566 res!181355) b!215567))

(assert (= (and b!215567 (not res!181354)) b!215568))

(assert (=> b!215566 m!331715))

(assert (=> b!215566 m!331713))

(assert (=> b!215568 m!331715))

(assert (=> b!215568 m!331715))

(declare-fun m!331875 () Bool)

(assert (=> b!215568 m!331875))

(assert (=> b!215473 d!72475))

(declare-fun d!72477 () Bool)

(declare-fun res!181356 () Bool)

(declare-fun e!146665 () Bool)

(assert (=> d!72477 (=> (not res!181356) (not e!146665))))

(assert (=> d!72477 (= res!181356 (= (size!4655 (buf!5190 (_2!9888 lt!340226))) (size!4655 (buf!5190 (_2!9888 lt!340213)))))))

(assert (=> d!72477 (= (isPrefixOf!0 (_2!9888 lt!340226) (_2!9888 lt!340213)) e!146665)))

(declare-fun b!215569 () Bool)

(declare-fun res!181358 () Bool)

(assert (=> b!215569 (=> (not res!181358) (not e!146665))))

(assert (=> b!215569 (= res!181358 (bvsle (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!340226))) (currentByte!9768 (_2!9888 lt!340226)) (currentBit!9763 (_2!9888 lt!340226))) (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!340213))) (currentByte!9768 (_2!9888 lt!340213)) (currentBit!9763 (_2!9888 lt!340213)))))))

(declare-fun b!215570 () Bool)

(declare-fun e!146666 () Bool)

(assert (=> b!215570 (= e!146665 e!146666)))

(declare-fun res!181357 () Bool)

(assert (=> b!215570 (=> res!181357 e!146666)))

(assert (=> b!215570 (= res!181357 (= (size!4655 (buf!5190 (_2!9888 lt!340226))) #b00000000000000000000000000000000))))

(declare-fun b!215571 () Bool)

(assert (=> b!215571 (= e!146666 (arrayBitRangesEq!0 (buf!5190 (_2!9888 lt!340226)) (buf!5190 (_2!9888 lt!340213)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!340226))) (currentByte!9768 (_2!9888 lt!340226)) (currentBit!9763 (_2!9888 lt!340226)))))))

(assert (= (and d!72477 res!181356) b!215569))

(assert (= (and b!215569 res!181358) b!215570))

(assert (= (and b!215570 (not res!181357)) b!215571))

(assert (=> b!215569 m!331713))

(assert (=> b!215569 m!331763))

(assert (=> b!215571 m!331713))

(assert (=> b!215571 m!331713))

(declare-fun m!331877 () Bool)

(assert (=> b!215571 m!331877))

(assert (=> b!215484 d!72477))

(declare-fun d!72479 () Bool)

(declare-fun e!146669 () Bool)

(assert (=> d!72479 e!146669))

(declare-fun res!181364 () Bool)

(assert (=> d!72479 (=> (not res!181364) (not e!146669))))

(declare-fun lt!340343 () (_ BitVec 64))

(declare-fun lt!340342 () (_ BitVec 64))

(declare-fun lt!340344 () (_ BitVec 64))

(assert (=> d!72479 (= res!181364 (= lt!340342 (bvsub lt!340343 lt!340344)))))

(assert (=> d!72479 (or (= (bvand lt!340343 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!340344 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!340343 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!340343 lt!340344) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!72479 (= lt!340344 (remainingBits!0 ((_ sign_extend 32) (size!4655 (buf!5190 (_1!9891 lt!340220)))) ((_ sign_extend 32) (currentByte!9768 (_1!9891 lt!340220))) ((_ sign_extend 32) (currentBit!9763 (_1!9891 lt!340220)))))))

(declare-fun lt!340345 () (_ BitVec 64))

(declare-fun lt!340346 () (_ BitVec 64))

(assert (=> d!72479 (= lt!340343 (bvmul lt!340345 lt!340346))))

(assert (=> d!72479 (or (= lt!340345 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!340346 (bvsdiv (bvmul lt!340345 lt!340346) lt!340345)))))

(assert (=> d!72479 (= lt!340346 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!72479 (= lt!340345 ((_ sign_extend 32) (size!4655 (buf!5190 (_1!9891 lt!340220)))))))

(assert (=> d!72479 (= lt!340342 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9768 (_1!9891 lt!340220))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9763 (_1!9891 lt!340220)))))))

(assert (=> d!72479 (invariant!0 (currentBit!9763 (_1!9891 lt!340220)) (currentByte!9768 (_1!9891 lt!340220)) (size!4655 (buf!5190 (_1!9891 lt!340220))))))

(assert (=> d!72479 (= (bitIndex!0 (size!4655 (buf!5190 (_1!9891 lt!340220))) (currentByte!9768 (_1!9891 lt!340220)) (currentBit!9763 (_1!9891 lt!340220))) lt!340342)))

(declare-fun b!215576 () Bool)

(declare-fun res!181363 () Bool)

(assert (=> b!215576 (=> (not res!181363) (not e!146669))))

(assert (=> b!215576 (= res!181363 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!340342))))

(declare-fun b!215577 () Bool)

(declare-fun lt!340341 () (_ BitVec 64))

(assert (=> b!215577 (= e!146669 (bvsle lt!340342 (bvmul lt!340341 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!215577 (or (= lt!340341 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!340341 #b0000000000000000000000000000000000000000000000000000000000001000) lt!340341)))))

(assert (=> b!215577 (= lt!340341 ((_ sign_extend 32) (size!4655 (buf!5190 (_1!9891 lt!340220)))))))

(assert (= (and d!72479 res!181364) b!215576))

(assert (= (and b!215576 res!181363) b!215577))

(declare-fun m!331879 () Bool)

(assert (=> d!72479 m!331879))

(declare-fun m!331881 () Bool)

(assert (=> d!72479 m!331881))

(assert (=> b!215474 d!72479))

(declare-fun d!72481 () Bool)

(assert (=> d!72481 (= (onesLSBLong!0 nBits!348) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!348))))))

(assert (=> b!215485 d!72481))

(declare-fun d!72483 () Bool)

(assert (=> d!72483 (= (invariant!0 (currentBit!9763 thiss!1204) (currentByte!9768 thiss!1204) (size!4655 (buf!5190 (_2!9888 lt!340213)))) (and (bvsge (currentBit!9763 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9763 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9768 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9768 thiss!1204) (size!4655 (buf!5190 (_2!9888 lt!340213)))) (and (= (currentBit!9763 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9768 thiss!1204) (size!4655 (buf!5190 (_2!9888 lt!340213))))))))))

(assert (=> b!215475 d!72483))

(declare-fun d!72485 () Bool)

(declare-fun lt!340364 () tuple2!18470)

(declare-fun lt!340361 () tuple2!18470)

(assert (=> d!72485 (and (= (_2!9890 lt!340364) (_2!9890 lt!340361)) (= (_1!9890 lt!340364) (_1!9890 lt!340361)))))

(declare-fun lt!340359 () Unit!15294)

(declare-fun lt!340360 () (_ BitVec 64))

(declare-fun lt!340363 () BitStream!8418)

(declare-fun lt!340362 () Bool)

(declare-fun choose!56 (BitStream!8418 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!18470 tuple2!18470 BitStream!8418 (_ BitVec 64) Bool BitStream!8418 (_ BitVec 64) tuple2!18470 tuple2!18470 BitStream!8418 (_ BitVec 64)) Unit!15294)

(assert (=> d!72485 (= lt!340359 (choose!56 (_1!9889 lt!340215) nBits!348 i!590 lt!340240 lt!340364 (tuple2!18471 (_1!9890 lt!340364) (_2!9890 lt!340364)) (_1!9890 lt!340364) (_2!9890 lt!340364) lt!340362 lt!340363 lt!340360 lt!340361 (tuple2!18471 (_1!9890 lt!340361) (_2!9890 lt!340361)) (_1!9890 lt!340361) (_2!9890 lt!340361)))))

(assert (=> d!72485 (= lt!340361 (readNBitsLSBFirstsLoopPure!0 lt!340363 nBits!348 (bvadd i!590 #b00000000000000000000000000000001) lt!340360))))

(assert (=> d!72485 (= lt!340360 (bvor lt!340240 (ite lt!340362 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72485 (= lt!340363 (withMovedBitIndex!0 (_1!9889 lt!340215) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!72485 (= lt!340362 (_2!9891 (readBitPure!0 (_1!9889 lt!340215))))))

(assert (=> d!72485 (= lt!340364 (readNBitsLSBFirstsLoopPure!0 (_1!9889 lt!340215) nBits!348 i!590 lt!340240))))

(assert (=> d!72485 (= (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9889 lt!340215) nBits!348 i!590 lt!340240) lt!340359)))

(declare-fun bs!17785 () Bool)

(assert (= bs!17785 d!72485))

(assert (=> bs!17785 m!331745))

(declare-fun m!331883 () Bool)

(assert (=> bs!17785 m!331883))

(assert (=> bs!17785 m!331721))

(assert (=> bs!17785 m!331779))

(declare-fun m!331885 () Bool)

(assert (=> bs!17785 m!331885))

(assert (=> b!215486 d!72485))

(declare-datatypes ((tuple2!18482 0))(
  ( (tuple2!18483 (_1!9896 (_ BitVec 64)) (_2!9896 BitStream!8418)) )
))
(declare-fun lt!340367 () tuple2!18482)

(declare-fun d!72487 () Bool)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!8418 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18482)

(assert (=> d!72487 (= lt!340367 (readNBitsLSBFirstsLoop!0 lt!340219 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!340233))))

(assert (=> d!72487 (= (readNBitsLSBFirstsLoopPure!0 lt!340219 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!340233) (tuple2!18471 (_2!9896 lt!340367) (_1!9896 lt!340367)))))

(declare-fun bs!17786 () Bool)

(assert (= bs!17786 d!72487))

(declare-fun m!331887 () Bool)

(assert (=> bs!17786 m!331887))

(assert (=> b!215486 d!72487))

(declare-fun d!72489 () Bool)

(declare-fun e!146672 () Bool)

(assert (=> d!72489 e!146672))

(declare-fun res!181367 () Bool)

(assert (=> d!72489 (=> (not res!181367) (not e!146672))))

(declare-fun lt!340373 () (_ BitVec 64))

(declare-fun lt!340372 () BitStream!8418)

(assert (=> d!72489 (= res!181367 (= (bvadd lt!340373 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4655 (buf!5190 lt!340372)) (currentByte!9768 lt!340372) (currentBit!9763 lt!340372))))))

(assert (=> d!72489 (or (not (= (bvand lt!340373 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!340373 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!340373 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72489 (= lt!340373 (bitIndex!0 (size!4655 (buf!5190 (_1!9889 lt!340215))) (currentByte!9768 (_1!9889 lt!340215)) (currentBit!9763 (_1!9889 lt!340215))))))

(declare-fun moveBitIndex!0 (BitStream!8418 (_ BitVec 64)) tuple2!18466)

(assert (=> d!72489 (= lt!340372 (_2!9888 (moveBitIndex!0 (_1!9889 lt!340215) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!8418 (_ BitVec 64)) Bool)

(assert (=> d!72489 (moveBitIndexPrecond!0 (_1!9889 lt!340215) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!72489 (= (withMovedBitIndex!0 (_1!9889 lt!340215) #b0000000000000000000000000000000000000000000000000000000000000001) lt!340372)))

(declare-fun b!215580 () Bool)

(assert (=> b!215580 (= e!146672 (= (size!4655 (buf!5190 (_1!9889 lt!340215))) (size!4655 (buf!5190 lt!340372))))))

(assert (= (and d!72489 res!181367) b!215580))

(declare-fun m!331889 () Bool)

(assert (=> d!72489 m!331889))

(declare-fun m!331891 () Bool)

(assert (=> d!72489 m!331891))

(declare-fun m!331893 () Bool)

(assert (=> d!72489 m!331893))

(declare-fun m!331895 () Bool)

(assert (=> d!72489 m!331895))

(assert (=> b!215486 d!72489))

(declare-fun d!72491 () Bool)

(declare-fun e!146673 () Bool)

(assert (=> d!72491 e!146673))

(declare-fun res!181368 () Bool)

(assert (=> d!72491 (=> (not res!181368) (not e!146673))))

(declare-fun lt!340375 () (_ BitVec 64))

(declare-fun lt!340374 () BitStream!8418)

(assert (=> d!72491 (= res!181368 (= (bvadd lt!340375 (bvsub lt!340238 lt!340230)) (bitIndex!0 (size!4655 (buf!5190 lt!340374)) (currentByte!9768 lt!340374) (currentBit!9763 lt!340374))))))

(assert (=> d!72491 (or (not (= (bvand lt!340375 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!340238 lt!340230) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!340375 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!340375 (bvsub lt!340238 lt!340230)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72491 (= lt!340375 (bitIndex!0 (size!4655 (buf!5190 (_2!9889 lt!340223))) (currentByte!9768 (_2!9889 lt!340223)) (currentBit!9763 (_2!9889 lt!340223))))))

(assert (=> d!72491 (= lt!340374 (_2!9888 (moveBitIndex!0 (_2!9889 lt!340223) (bvsub lt!340238 lt!340230))))))

(assert (=> d!72491 (moveBitIndexPrecond!0 (_2!9889 lt!340223) (bvsub lt!340238 lt!340230))))

(assert (=> d!72491 (= (withMovedBitIndex!0 (_2!9889 lt!340223) (bvsub lt!340238 lt!340230)) lt!340374)))

(declare-fun b!215581 () Bool)

(assert (=> b!215581 (= e!146673 (= (size!4655 (buf!5190 (_2!9889 lt!340223))) (size!4655 (buf!5190 lt!340374))))))

(assert (= (and d!72491 res!181368) b!215581))

(declare-fun m!331897 () Bool)

(assert (=> d!72491 m!331897))

(declare-fun m!331899 () Bool)

(assert (=> d!72491 m!331899))

(declare-fun m!331901 () Bool)

(assert (=> d!72491 m!331901))

(declare-fun m!331903 () Bool)

(assert (=> d!72491 m!331903))

(assert (=> b!215465 d!72491))

(declare-fun d!72493 () Bool)

(assert (=> d!72493 (= (invariant!0 (currentBit!9763 thiss!1204) (currentByte!9768 thiss!1204) (size!4655 (buf!5190 thiss!1204))) (and (bvsge (currentBit!9763 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9763 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9768 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9768 thiss!1204) (size!4655 (buf!5190 thiss!1204))) (and (= (currentBit!9763 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9768 thiss!1204) (size!4655 (buf!5190 thiss!1204)))))))))

(assert (=> b!215476 d!72493))

(declare-fun d!72495 () Bool)

(assert (=> d!72495 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4655 (buf!5190 thiss!1204))) ((_ sign_extend 32) (currentByte!9768 thiss!1204)) ((_ sign_extend 32) (currentBit!9763 thiss!1204)) lt!340225) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4655 (buf!5190 thiss!1204))) ((_ sign_extend 32) (currentByte!9768 thiss!1204)) ((_ sign_extend 32) (currentBit!9763 thiss!1204))) lt!340225))))

(declare-fun bs!17787 () Bool)

(assert (= bs!17787 d!72495))

(declare-fun m!331905 () Bool)

(assert (=> bs!17787 m!331905))

(assert (=> b!215487 d!72495))

(assert (=> b!215466 d!72475))

(declare-fun b!215592 () Bool)

(declare-fun res!181377 () Bool)

(declare-fun e!146679 () Bool)

(assert (=> b!215592 (=> (not res!181377) (not e!146679))))

(declare-fun lt!340422 () tuple2!18468)

(assert (=> b!215592 (= res!181377 (isPrefixOf!0 (_2!9889 lt!340422) (_2!9888 lt!340213)))))

(declare-fun lt!340416 () (_ BitVec 64))

(declare-fun lt!340418 () (_ BitVec 64))

(declare-fun b!215593 () Bool)

(assert (=> b!215593 (= e!146679 (= (_1!9889 lt!340422) (withMovedBitIndex!0 (_2!9889 lt!340422) (bvsub lt!340418 lt!340416))))))

(assert (=> b!215593 (or (= (bvand lt!340418 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!340416 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!340418 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!340418 lt!340416) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!215593 (= lt!340416 (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!340213))) (currentByte!9768 (_2!9888 lt!340213)) (currentBit!9763 (_2!9888 lt!340213))))))

(assert (=> b!215593 (= lt!340418 (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!340226))) (currentByte!9768 (_2!9888 lt!340226)) (currentBit!9763 (_2!9888 lt!340226))))))

(declare-fun b!215594 () Bool)

(declare-fun e!146678 () Unit!15294)

(declare-fun Unit!15298 () Unit!15294)

(assert (=> b!215594 (= e!146678 Unit!15298)))

(declare-fun b!215595 () Bool)

(declare-fun res!181376 () Bool)

(assert (=> b!215595 (=> (not res!181376) (not e!146679))))

(assert (=> b!215595 (= res!181376 (isPrefixOf!0 (_1!9889 lt!340422) (_2!9888 lt!340226)))))

(declare-fun b!215596 () Bool)

(declare-fun lt!340429 () Unit!15294)

(assert (=> b!215596 (= e!146678 lt!340429)))

(declare-fun lt!340434 () (_ BitVec 64))

(assert (=> b!215596 (= lt!340434 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!340426 () (_ BitVec 64))

(assert (=> b!215596 (= lt!340426 (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!340226))) (currentByte!9768 (_2!9888 lt!340226)) (currentBit!9763 (_2!9888 lt!340226))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!10597 array!10597 (_ BitVec 64) (_ BitVec 64)) Unit!15294)

(assert (=> b!215596 (= lt!340429 (arrayBitRangesEqSymmetric!0 (buf!5190 (_2!9888 lt!340226)) (buf!5190 (_2!9888 lt!340213)) lt!340434 lt!340426))))

(assert (=> b!215596 (arrayBitRangesEq!0 (buf!5190 (_2!9888 lt!340213)) (buf!5190 (_2!9888 lt!340226)) lt!340434 lt!340426)))

(declare-fun d!72497 () Bool)

(assert (=> d!72497 e!146679))

(declare-fun res!181375 () Bool)

(assert (=> d!72497 (=> (not res!181375) (not e!146679))))

(assert (=> d!72497 (= res!181375 (isPrefixOf!0 (_1!9889 lt!340422) (_2!9889 lt!340422)))))

(declare-fun lt!340419 () BitStream!8418)

(assert (=> d!72497 (= lt!340422 (tuple2!18469 lt!340419 (_2!9888 lt!340213)))))

(declare-fun lt!340427 () Unit!15294)

(declare-fun lt!340432 () Unit!15294)

(assert (=> d!72497 (= lt!340427 lt!340432)))

(assert (=> d!72497 (isPrefixOf!0 lt!340419 (_2!9888 lt!340213))))

(assert (=> d!72497 (= lt!340432 (lemmaIsPrefixTransitive!0 lt!340419 (_2!9888 lt!340213) (_2!9888 lt!340213)))))

(declare-fun lt!340435 () Unit!15294)

(declare-fun lt!340420 () Unit!15294)

(assert (=> d!72497 (= lt!340435 lt!340420)))

(assert (=> d!72497 (isPrefixOf!0 lt!340419 (_2!9888 lt!340213))))

(assert (=> d!72497 (= lt!340420 (lemmaIsPrefixTransitive!0 lt!340419 (_2!9888 lt!340226) (_2!9888 lt!340213)))))

(declare-fun lt!340421 () Unit!15294)

(assert (=> d!72497 (= lt!340421 e!146678)))

(declare-fun c!10511 () Bool)

(assert (=> d!72497 (= c!10511 (not (= (size!4655 (buf!5190 (_2!9888 lt!340226))) #b00000000000000000000000000000000)))))

(declare-fun lt!340417 () Unit!15294)

(declare-fun lt!340424 () Unit!15294)

(assert (=> d!72497 (= lt!340417 lt!340424)))

(assert (=> d!72497 (isPrefixOf!0 (_2!9888 lt!340213) (_2!9888 lt!340213))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8418) Unit!15294)

(assert (=> d!72497 (= lt!340424 (lemmaIsPrefixRefl!0 (_2!9888 lt!340213)))))

(declare-fun lt!340423 () Unit!15294)

(declare-fun lt!340430 () Unit!15294)

(assert (=> d!72497 (= lt!340423 lt!340430)))

(assert (=> d!72497 (= lt!340430 (lemmaIsPrefixRefl!0 (_2!9888 lt!340213)))))

(declare-fun lt!340433 () Unit!15294)

(declare-fun lt!340428 () Unit!15294)

(assert (=> d!72497 (= lt!340433 lt!340428)))

(assert (=> d!72497 (isPrefixOf!0 lt!340419 lt!340419)))

(assert (=> d!72497 (= lt!340428 (lemmaIsPrefixRefl!0 lt!340419))))

(declare-fun lt!340425 () Unit!15294)

(declare-fun lt!340431 () Unit!15294)

(assert (=> d!72497 (= lt!340425 lt!340431)))

(assert (=> d!72497 (isPrefixOf!0 (_2!9888 lt!340226) (_2!9888 lt!340226))))

(assert (=> d!72497 (= lt!340431 (lemmaIsPrefixRefl!0 (_2!9888 lt!340226)))))

(assert (=> d!72497 (= lt!340419 (BitStream!8419 (buf!5190 (_2!9888 lt!340213)) (currentByte!9768 (_2!9888 lt!340226)) (currentBit!9763 (_2!9888 lt!340226))))))

(assert (=> d!72497 (isPrefixOf!0 (_2!9888 lt!340226) (_2!9888 lt!340213))))

(assert (=> d!72497 (= (reader!0 (_2!9888 lt!340226) (_2!9888 lt!340213)) lt!340422)))

(assert (= (and d!72497 c!10511) b!215596))

(assert (= (and d!72497 (not c!10511)) b!215594))

(assert (= (and d!72497 res!181375) b!215595))

(assert (= (and b!215595 res!181376) b!215592))

(assert (= (and b!215592 res!181377) b!215593))

(assert (=> b!215596 m!331713))

(declare-fun m!331907 () Bool)

(assert (=> b!215596 m!331907))

(declare-fun m!331909 () Bool)

(assert (=> b!215596 m!331909))

(declare-fun m!331911 () Bool)

(assert (=> b!215593 m!331911))

(assert (=> b!215593 m!331763))

(assert (=> b!215593 m!331713))

(declare-fun m!331913 () Bool)

(assert (=> b!215592 m!331913))

(declare-fun m!331915 () Bool)

(assert (=> d!72497 m!331915))

(declare-fun m!331917 () Bool)

(assert (=> d!72497 m!331917))

(declare-fun m!331919 () Bool)

(assert (=> d!72497 m!331919))

(declare-fun m!331921 () Bool)

(assert (=> d!72497 m!331921))

(declare-fun m!331923 () Bool)

(assert (=> d!72497 m!331923))

(declare-fun m!331925 () Bool)

(assert (=> d!72497 m!331925))

(assert (=> d!72497 m!331785))

(declare-fun m!331927 () Bool)

(assert (=> d!72497 m!331927))

(declare-fun m!331929 () Bool)

(assert (=> d!72497 m!331929))

(declare-fun m!331931 () Bool)

(assert (=> d!72497 m!331931))

(declare-fun m!331933 () Bool)

(assert (=> d!72497 m!331933))

(declare-fun m!331935 () Bool)

(assert (=> b!215595 m!331935))

(assert (=> b!215467 d!72497))

(declare-fun d!72499 () Bool)

(assert (=> d!72499 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!215467 d!72499))

(declare-fun d!72501 () Bool)

(assert (=> d!72501 (= (invariant!0 (currentBit!9763 thiss!1204) (currentByte!9768 thiss!1204) (size!4655 (buf!5190 (_2!9888 lt!340226)))) (and (bvsge (currentBit!9763 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9763 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9768 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9768 thiss!1204) (size!4655 (buf!5190 (_2!9888 lt!340226)))) (and (= (currentBit!9763 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9768 thiss!1204) (size!4655 (buf!5190 (_2!9888 lt!340226))))))))))

(assert (=> b!215467 d!72501))

(declare-fun d!72503 () Bool)

(declare-fun e!146682 () Bool)

(assert (=> d!72503 e!146682))

(declare-fun res!181380 () Bool)

(assert (=> d!72503 (=> (not res!181380) (not e!146682))))

(declare-fun lt!340445 () tuple2!18472)

(declare-fun lt!340446 () tuple2!18472)

(assert (=> d!72503 (= res!181380 (= (bitIndex!0 (size!4655 (buf!5190 (_1!9891 lt!340445))) (currentByte!9768 (_1!9891 lt!340445)) (currentBit!9763 (_1!9891 lt!340445))) (bitIndex!0 (size!4655 (buf!5190 (_1!9891 lt!340446))) (currentByte!9768 (_1!9891 lt!340446)) (currentBit!9763 (_1!9891 lt!340446)))))))

(declare-fun lt!340444 () BitStream!8418)

(declare-fun lt!340447 () Unit!15294)

(declare-fun choose!50 (BitStream!8418 BitStream!8418 BitStream!8418 tuple2!18472 tuple2!18472 BitStream!8418 Bool tuple2!18472 tuple2!18472 BitStream!8418 Bool) Unit!15294)

(assert (=> d!72503 (= lt!340447 (choose!50 lt!340221 (_2!9888 lt!340213) lt!340444 lt!340445 (tuple2!18473 (_1!9891 lt!340445) (_2!9891 lt!340445)) (_1!9891 lt!340445) (_2!9891 lt!340445) lt!340446 (tuple2!18473 (_1!9891 lt!340446) (_2!9891 lt!340446)) (_1!9891 lt!340446) (_2!9891 lt!340446)))))

(assert (=> d!72503 (= lt!340446 (readBitPure!0 lt!340444))))

(assert (=> d!72503 (= lt!340445 (readBitPure!0 lt!340221))))

(assert (=> d!72503 (= lt!340444 (BitStream!8419 (buf!5190 (_2!9888 lt!340213)) (currentByte!9768 lt!340221) (currentBit!9763 lt!340221)))))

(assert (=> d!72503 (invariant!0 (currentBit!9763 lt!340221) (currentByte!9768 lt!340221) (size!4655 (buf!5190 (_2!9888 lt!340213))))))

(assert (=> d!72503 (= (readBitPrefixLemma!0 lt!340221 (_2!9888 lt!340213)) lt!340447)))

(declare-fun b!215599 () Bool)

(assert (=> b!215599 (= e!146682 (= (_2!9891 lt!340445) (_2!9891 lt!340446)))))

(assert (= (and d!72503 res!181380) b!215599))

(assert (=> d!72503 m!331733))

(declare-fun m!331937 () Bool)

(assert (=> d!72503 m!331937))

(declare-fun m!331939 () Bool)

(assert (=> d!72503 m!331939))

(declare-fun m!331941 () Bool)

(assert (=> d!72503 m!331941))

(declare-fun m!331943 () Bool)

(assert (=> d!72503 m!331943))

(declare-fun m!331945 () Bool)

(assert (=> d!72503 m!331945))

(assert (=> b!215467 d!72503))

(declare-fun d!72505 () Bool)

(declare-fun e!146683 () Bool)

(assert (=> d!72505 e!146683))

(declare-fun res!181382 () Bool)

(assert (=> d!72505 (=> (not res!181382) (not e!146683))))

(declare-fun lt!340451 () (_ BitVec 64))

(declare-fun lt!340449 () (_ BitVec 64))

(declare-fun lt!340450 () (_ BitVec 64))

(assert (=> d!72505 (= res!181382 (= lt!340449 (bvsub lt!340450 lt!340451)))))

(assert (=> d!72505 (or (= (bvand lt!340450 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!340451 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!340450 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!340450 lt!340451) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72505 (= lt!340451 (remainingBits!0 ((_ sign_extend 32) (size!4655 (buf!5190 (_1!9891 lt!340222)))) ((_ sign_extend 32) (currentByte!9768 (_1!9891 lt!340222))) ((_ sign_extend 32) (currentBit!9763 (_1!9891 lt!340222)))))))

(declare-fun lt!340452 () (_ BitVec 64))

(declare-fun lt!340453 () (_ BitVec 64))

(assert (=> d!72505 (= lt!340450 (bvmul lt!340452 lt!340453))))

(assert (=> d!72505 (or (= lt!340452 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!340453 (bvsdiv (bvmul lt!340452 lt!340453) lt!340452)))))

(assert (=> d!72505 (= lt!340453 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!72505 (= lt!340452 ((_ sign_extend 32) (size!4655 (buf!5190 (_1!9891 lt!340222)))))))

(assert (=> d!72505 (= lt!340449 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9768 (_1!9891 lt!340222))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9763 (_1!9891 lt!340222)))))))

(assert (=> d!72505 (invariant!0 (currentBit!9763 (_1!9891 lt!340222)) (currentByte!9768 (_1!9891 lt!340222)) (size!4655 (buf!5190 (_1!9891 lt!340222))))))

(assert (=> d!72505 (= (bitIndex!0 (size!4655 (buf!5190 (_1!9891 lt!340222))) (currentByte!9768 (_1!9891 lt!340222)) (currentBit!9763 (_1!9891 lt!340222))) lt!340449)))

(declare-fun b!215600 () Bool)

(declare-fun res!181381 () Bool)

(assert (=> b!215600 (=> (not res!181381) (not e!146683))))

(assert (=> b!215600 (= res!181381 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!340449))))

(declare-fun b!215601 () Bool)

(declare-fun lt!340448 () (_ BitVec 64))

(assert (=> b!215601 (= e!146683 (bvsle lt!340449 (bvmul lt!340448 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!215601 (or (= lt!340448 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!340448 #b0000000000000000000000000000000000000000000000000000000000001000) lt!340448)))))

(assert (=> b!215601 (= lt!340448 ((_ sign_extend 32) (size!4655 (buf!5190 (_1!9891 lt!340222)))))))

(assert (= (and d!72505 res!181382) b!215600))

(assert (= (and b!215600 res!181381) b!215601))

(declare-fun m!331947 () Bool)

(assert (=> d!72505 m!331947))

(declare-fun m!331949 () Bool)

(assert (=> d!72505 m!331949))

(assert (=> b!215467 d!72505))

(declare-fun b!215602 () Bool)

(declare-fun res!181385 () Bool)

(declare-fun e!146685 () Bool)

(assert (=> b!215602 (=> (not res!181385) (not e!146685))))

(declare-fun lt!340460 () tuple2!18468)

(assert (=> b!215602 (= res!181385 (isPrefixOf!0 (_2!9889 lt!340460) (_2!9888 lt!340213)))))

(declare-fun lt!340454 () (_ BitVec 64))

(declare-fun b!215603 () Bool)

(declare-fun lt!340456 () (_ BitVec 64))

(assert (=> b!215603 (= e!146685 (= (_1!9889 lt!340460) (withMovedBitIndex!0 (_2!9889 lt!340460) (bvsub lt!340456 lt!340454))))))

(assert (=> b!215603 (or (= (bvand lt!340456 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!340454 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!340456 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!340456 lt!340454) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!215603 (= lt!340454 (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!340213))) (currentByte!9768 (_2!9888 lt!340213)) (currentBit!9763 (_2!9888 lt!340213))))))

(assert (=> b!215603 (= lt!340456 (bitIndex!0 (size!4655 (buf!5190 thiss!1204)) (currentByte!9768 thiss!1204) (currentBit!9763 thiss!1204)))))

(declare-fun b!215604 () Bool)

(declare-fun e!146684 () Unit!15294)

(declare-fun Unit!15299 () Unit!15294)

(assert (=> b!215604 (= e!146684 Unit!15299)))

(declare-fun b!215605 () Bool)

(declare-fun res!181384 () Bool)

(assert (=> b!215605 (=> (not res!181384) (not e!146685))))

(assert (=> b!215605 (= res!181384 (isPrefixOf!0 (_1!9889 lt!340460) thiss!1204))))

(declare-fun b!215606 () Bool)

(declare-fun lt!340467 () Unit!15294)

(assert (=> b!215606 (= e!146684 lt!340467)))

(declare-fun lt!340472 () (_ BitVec 64))

(assert (=> b!215606 (= lt!340472 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!340464 () (_ BitVec 64))

(assert (=> b!215606 (= lt!340464 (bitIndex!0 (size!4655 (buf!5190 thiss!1204)) (currentByte!9768 thiss!1204) (currentBit!9763 thiss!1204)))))

(assert (=> b!215606 (= lt!340467 (arrayBitRangesEqSymmetric!0 (buf!5190 thiss!1204) (buf!5190 (_2!9888 lt!340213)) lt!340472 lt!340464))))

(assert (=> b!215606 (arrayBitRangesEq!0 (buf!5190 (_2!9888 lt!340213)) (buf!5190 thiss!1204) lt!340472 lt!340464)))

(declare-fun d!72507 () Bool)

(assert (=> d!72507 e!146685))

(declare-fun res!181383 () Bool)

(assert (=> d!72507 (=> (not res!181383) (not e!146685))))

(assert (=> d!72507 (= res!181383 (isPrefixOf!0 (_1!9889 lt!340460) (_2!9889 lt!340460)))))

(declare-fun lt!340457 () BitStream!8418)

(assert (=> d!72507 (= lt!340460 (tuple2!18469 lt!340457 (_2!9888 lt!340213)))))

(declare-fun lt!340465 () Unit!15294)

(declare-fun lt!340470 () Unit!15294)

(assert (=> d!72507 (= lt!340465 lt!340470)))

(assert (=> d!72507 (isPrefixOf!0 lt!340457 (_2!9888 lt!340213))))

(assert (=> d!72507 (= lt!340470 (lemmaIsPrefixTransitive!0 lt!340457 (_2!9888 lt!340213) (_2!9888 lt!340213)))))

(declare-fun lt!340473 () Unit!15294)

(declare-fun lt!340458 () Unit!15294)

(assert (=> d!72507 (= lt!340473 lt!340458)))

(assert (=> d!72507 (isPrefixOf!0 lt!340457 (_2!9888 lt!340213))))

(assert (=> d!72507 (= lt!340458 (lemmaIsPrefixTransitive!0 lt!340457 thiss!1204 (_2!9888 lt!340213)))))

(declare-fun lt!340459 () Unit!15294)

(assert (=> d!72507 (= lt!340459 e!146684)))

(declare-fun c!10512 () Bool)

(assert (=> d!72507 (= c!10512 (not (= (size!4655 (buf!5190 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!340455 () Unit!15294)

(declare-fun lt!340462 () Unit!15294)

(assert (=> d!72507 (= lt!340455 lt!340462)))

(assert (=> d!72507 (isPrefixOf!0 (_2!9888 lt!340213) (_2!9888 lt!340213))))

(assert (=> d!72507 (= lt!340462 (lemmaIsPrefixRefl!0 (_2!9888 lt!340213)))))

(declare-fun lt!340461 () Unit!15294)

(declare-fun lt!340468 () Unit!15294)

(assert (=> d!72507 (= lt!340461 lt!340468)))

(assert (=> d!72507 (= lt!340468 (lemmaIsPrefixRefl!0 (_2!9888 lt!340213)))))

(declare-fun lt!340471 () Unit!15294)

(declare-fun lt!340466 () Unit!15294)

(assert (=> d!72507 (= lt!340471 lt!340466)))

(assert (=> d!72507 (isPrefixOf!0 lt!340457 lt!340457)))

(assert (=> d!72507 (= lt!340466 (lemmaIsPrefixRefl!0 lt!340457))))

(declare-fun lt!340463 () Unit!15294)

(declare-fun lt!340469 () Unit!15294)

(assert (=> d!72507 (= lt!340463 lt!340469)))

(assert (=> d!72507 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!72507 (= lt!340469 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!72507 (= lt!340457 (BitStream!8419 (buf!5190 (_2!9888 lt!340213)) (currentByte!9768 thiss!1204) (currentBit!9763 thiss!1204)))))

(assert (=> d!72507 (isPrefixOf!0 thiss!1204 (_2!9888 lt!340213))))

(assert (=> d!72507 (= (reader!0 thiss!1204 (_2!9888 lt!340213)) lt!340460)))

(assert (= (and d!72507 c!10512) b!215606))

(assert (= (and d!72507 (not c!10512)) b!215604))

(assert (= (and d!72507 res!181383) b!215605))

(assert (= (and b!215605 res!181384) b!215602))

(assert (= (and b!215602 res!181385) b!215603))

(assert (=> b!215606 m!331715))

(declare-fun m!331951 () Bool)

(assert (=> b!215606 m!331951))

(declare-fun m!331953 () Bool)

(assert (=> b!215606 m!331953))

(declare-fun m!331955 () Bool)

(assert (=> b!215603 m!331955))

(assert (=> b!215603 m!331763))

(assert (=> b!215603 m!331715))

(declare-fun m!331957 () Bool)

(assert (=> b!215602 m!331957))

(declare-fun m!331959 () Bool)

(assert (=> d!72507 m!331959))

(declare-fun m!331961 () Bool)

(assert (=> d!72507 m!331961))

(declare-fun m!331963 () Bool)

(assert (=> d!72507 m!331963))

(declare-fun m!331965 () Bool)

(assert (=> d!72507 m!331965))

(declare-fun m!331967 () Bool)

(assert (=> d!72507 m!331967))

(assert (=> d!72507 m!331925))

(assert (=> d!72507 m!331765))

(declare-fun m!331969 () Bool)

(assert (=> d!72507 m!331969))

(declare-fun m!331971 () Bool)

(assert (=> d!72507 m!331971))

(declare-fun m!331973 () Bool)

(assert (=> d!72507 m!331973))

(assert (=> d!72507 m!331933))

(declare-fun m!331975 () Bool)

(assert (=> b!215605 m!331975))

(assert (=> b!215467 d!72507))

(declare-fun d!72509 () Bool)

(assert (=> d!72509 (validate_offset_bits!1 ((_ sign_extend 32) (size!4655 (buf!5190 (_2!9888 lt!340213)))) ((_ sign_extend 32) (currentByte!9768 thiss!1204)) ((_ sign_extend 32) (currentBit!9763 thiss!1204)) lt!340225)))

(declare-fun lt!340476 () Unit!15294)

(declare-fun choose!9 (BitStream!8418 array!10597 (_ BitVec 64) BitStream!8418) Unit!15294)

(assert (=> d!72509 (= lt!340476 (choose!9 thiss!1204 (buf!5190 (_2!9888 lt!340213)) lt!340225 (BitStream!8419 (buf!5190 (_2!9888 lt!340213)) (currentByte!9768 thiss!1204) (currentBit!9763 thiss!1204))))))

(assert (=> d!72509 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5190 (_2!9888 lt!340213)) lt!340225) lt!340476)))

(declare-fun bs!17788 () Bool)

(assert (= bs!17788 d!72509))

(assert (=> bs!17788 m!331723))

(declare-fun m!331977 () Bool)

(assert (=> bs!17788 m!331977))

(assert (=> b!215467 d!72509))

(declare-fun d!72511 () Bool)

(assert (=> d!72511 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4655 (buf!5190 (_2!9888 lt!340213)))) ((_ sign_extend 32) (currentByte!9768 (_2!9888 lt!340226))) ((_ sign_extend 32) (currentBit!9763 (_2!9888 lt!340226))) lt!340218) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4655 (buf!5190 (_2!9888 lt!340213)))) ((_ sign_extend 32) (currentByte!9768 (_2!9888 lt!340226))) ((_ sign_extend 32) (currentBit!9763 (_2!9888 lt!340226)))) lt!340218))))

(declare-fun bs!17789 () Bool)

(assert (= bs!17789 d!72511))

(declare-fun m!331979 () Bool)

(assert (=> bs!17789 m!331979))

(assert (=> b!215467 d!72511))

(declare-fun d!72513 () Bool)

(declare-fun lt!340477 () tuple2!18482)

(assert (=> d!72513 (= lt!340477 (readNBitsLSBFirstsLoop!0 (_1!9889 lt!340215) nBits!348 i!590 lt!340240))))

(assert (=> d!72513 (= (readNBitsLSBFirstsLoopPure!0 (_1!9889 lt!340215) nBits!348 i!590 lt!340240) (tuple2!18471 (_2!9896 lt!340477) (_1!9896 lt!340477)))))

(declare-fun bs!17790 () Bool)

(assert (= bs!17790 d!72513))

(declare-fun m!331981 () Bool)

(assert (=> bs!17790 m!331981))

(assert (=> b!215467 d!72513))

(declare-fun lt!340478 () tuple2!18482)

(declare-fun d!72515 () Bool)

(assert (=> d!72515 (= lt!340478 (readNBitsLSBFirstsLoop!0 (_1!9889 lt!340223) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!340233))))

(assert (=> d!72515 (= (readNBitsLSBFirstsLoopPure!0 (_1!9889 lt!340223) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!340233) (tuple2!18471 (_2!9896 lt!340478) (_1!9896 lt!340478)))))

(declare-fun bs!17791 () Bool)

(assert (= bs!17791 d!72515))

(declare-fun m!331983 () Bool)

(assert (=> bs!17791 m!331983))

(assert (=> b!215467 d!72515))

(declare-fun d!72517 () Bool)

(assert (=> d!72517 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4655 (buf!5190 (_2!9888 lt!340213)))) ((_ sign_extend 32) (currentByte!9768 thiss!1204)) ((_ sign_extend 32) (currentBit!9763 thiss!1204)) lt!340225) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4655 (buf!5190 (_2!9888 lt!340213)))) ((_ sign_extend 32) (currentByte!9768 thiss!1204)) ((_ sign_extend 32) (currentBit!9763 thiss!1204))) lt!340225))))

(declare-fun bs!17792 () Bool)

(assert (= bs!17792 d!72517))

(declare-fun m!331985 () Bool)

(assert (=> bs!17792 m!331985))

(assert (=> b!215467 d!72517))

(declare-fun d!72519 () Bool)

(declare-datatypes ((tuple2!18484 0))(
  ( (tuple2!18485 (_1!9897 Bool) (_2!9897 BitStream!8418)) )
))
(declare-fun lt!340481 () tuple2!18484)

(declare-fun readBit!0 (BitStream!8418) tuple2!18484)

(assert (=> d!72519 (= lt!340481 (readBit!0 (BitStream!8419 (buf!5190 (_2!9888 lt!340213)) (currentByte!9768 thiss!1204) (currentBit!9763 thiss!1204))))))

(assert (=> d!72519 (= (readBitPure!0 (BitStream!8419 (buf!5190 (_2!9888 lt!340213)) (currentByte!9768 thiss!1204) (currentBit!9763 thiss!1204))) (tuple2!18473 (_2!9897 lt!340481) (_1!9897 lt!340481)))))

(declare-fun bs!17793 () Bool)

(assert (= bs!17793 d!72519))

(declare-fun m!331987 () Bool)

(assert (=> bs!17793 m!331987))

(assert (=> b!215467 d!72519))

(declare-fun d!72521 () Bool)

(declare-fun lt!340482 () tuple2!18484)

(assert (=> d!72521 (= lt!340482 (readBit!0 (_1!9889 lt!340215)))))

(assert (=> d!72521 (= (readBitPure!0 (_1!9889 lt!340215)) (tuple2!18473 (_2!9897 lt!340482) (_1!9897 lt!340482)))))

(declare-fun bs!17794 () Bool)

(assert (= bs!17794 d!72521))

(declare-fun m!331989 () Bool)

(assert (=> bs!17794 m!331989))

(assert (=> b!215467 d!72521))

(declare-fun d!72523 () Bool)

(declare-fun lt!340483 () tuple2!18484)

(assert (=> d!72523 (= lt!340483 (readBit!0 lt!340221))))

(assert (=> d!72523 (= (readBitPure!0 lt!340221) (tuple2!18473 (_2!9897 lt!340483) (_1!9897 lt!340483)))))

(declare-fun bs!17795 () Bool)

(assert (= bs!17795 d!72523))

(declare-fun m!331991 () Bool)

(assert (=> bs!17795 m!331991))

(assert (=> b!215467 d!72523))

(declare-fun d!72525 () Bool)

(declare-fun e!146686 () Bool)

(assert (=> d!72525 e!146686))

(declare-fun res!181387 () Bool)

(assert (=> d!72525 (=> (not res!181387) (not e!146686))))

(declare-fun lt!340485 () (_ BitVec 64))

(declare-fun lt!340487 () (_ BitVec 64))

(declare-fun lt!340486 () (_ BitVec 64))

(assert (=> d!72525 (= res!181387 (= lt!340485 (bvsub lt!340486 lt!340487)))))

(assert (=> d!72525 (or (= (bvand lt!340486 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!340487 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!340486 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!340486 lt!340487) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72525 (= lt!340487 (remainingBits!0 ((_ sign_extend 32) (size!4655 (buf!5190 (_1!9891 lt!340234)))) ((_ sign_extend 32) (currentByte!9768 (_1!9891 lt!340234))) ((_ sign_extend 32) (currentBit!9763 (_1!9891 lt!340234)))))))

(declare-fun lt!340488 () (_ BitVec 64))

(declare-fun lt!340489 () (_ BitVec 64))

(assert (=> d!72525 (= lt!340486 (bvmul lt!340488 lt!340489))))

(assert (=> d!72525 (or (= lt!340488 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!340489 (bvsdiv (bvmul lt!340488 lt!340489) lt!340488)))))

(assert (=> d!72525 (= lt!340489 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!72525 (= lt!340488 ((_ sign_extend 32) (size!4655 (buf!5190 (_1!9891 lt!340234)))))))

(assert (=> d!72525 (= lt!340485 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9768 (_1!9891 lt!340234))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9763 (_1!9891 lt!340234)))))))

(assert (=> d!72525 (invariant!0 (currentBit!9763 (_1!9891 lt!340234)) (currentByte!9768 (_1!9891 lt!340234)) (size!4655 (buf!5190 (_1!9891 lt!340234))))))

(assert (=> d!72525 (= (bitIndex!0 (size!4655 (buf!5190 (_1!9891 lt!340234))) (currentByte!9768 (_1!9891 lt!340234)) (currentBit!9763 (_1!9891 lt!340234))) lt!340485)))

(declare-fun b!215607 () Bool)

(declare-fun res!181386 () Bool)

(assert (=> b!215607 (=> (not res!181386) (not e!146686))))

(assert (=> b!215607 (= res!181386 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!340485))))

(declare-fun b!215608 () Bool)

(declare-fun lt!340484 () (_ BitVec 64))

(assert (=> b!215608 (= e!146686 (bvsle lt!340485 (bvmul lt!340484 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!215608 (or (= lt!340484 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!340484 #b0000000000000000000000000000000000000000000000000000000000001000) lt!340484)))))

(assert (=> b!215608 (= lt!340484 ((_ sign_extend 32) (size!4655 (buf!5190 (_1!9891 lt!340234)))))))

(assert (= (and d!72525 res!181387) b!215607))

(assert (= (and b!215607 res!181386) b!215608))

(declare-fun m!331993 () Bool)

(assert (=> d!72525 m!331993))

(declare-fun m!331995 () Bool)

(assert (=> d!72525 m!331995))

(assert (=> b!215467 d!72525))

(declare-fun d!72527 () Bool)

(assert (=> d!72527 (validate_offset_bits!1 ((_ sign_extend 32) (size!4655 (buf!5190 (_2!9888 lt!340213)))) ((_ sign_extend 32) (currentByte!9768 (_2!9888 lt!340226))) ((_ sign_extend 32) (currentBit!9763 (_2!9888 lt!340226))) lt!340218)))

(declare-fun lt!340490 () Unit!15294)

(assert (=> d!72527 (= lt!340490 (choose!9 (_2!9888 lt!340226) (buf!5190 (_2!9888 lt!340213)) lt!340218 (BitStream!8419 (buf!5190 (_2!9888 lt!340213)) (currentByte!9768 (_2!9888 lt!340226)) (currentBit!9763 (_2!9888 lt!340226)))))))

(assert (=> d!72527 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9888 lt!340226) (buf!5190 (_2!9888 lt!340213)) lt!340218) lt!340490)))

(declare-fun bs!17796 () Bool)

(assert (= bs!17796 d!72527))

(assert (=> bs!17796 m!331727))

(declare-fun m!331997 () Bool)

(assert (=> bs!17796 m!331997))

(assert (=> b!215467 d!72527))

(declare-fun d!72529 () Bool)

(declare-fun e!146687 () Bool)

(assert (=> d!72529 e!146687))

(declare-fun res!181389 () Bool)

(assert (=> d!72529 (=> (not res!181389) (not e!146687))))

(declare-fun lt!340494 () (_ BitVec 64))

(declare-fun lt!340492 () (_ BitVec 64))

(declare-fun lt!340493 () (_ BitVec 64))

(assert (=> d!72529 (= res!181389 (= lt!340492 (bvsub lt!340493 lt!340494)))))

(assert (=> d!72529 (or (= (bvand lt!340493 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!340494 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!340493 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!340493 lt!340494) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72529 (= lt!340494 (remainingBits!0 ((_ sign_extend 32) (size!4655 (buf!5190 (_2!9888 lt!340226)))) ((_ sign_extend 32) (currentByte!9768 (_2!9888 lt!340226))) ((_ sign_extend 32) (currentBit!9763 (_2!9888 lt!340226)))))))

(declare-fun lt!340495 () (_ BitVec 64))

(declare-fun lt!340496 () (_ BitVec 64))

(assert (=> d!72529 (= lt!340493 (bvmul lt!340495 lt!340496))))

(assert (=> d!72529 (or (= lt!340495 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!340496 (bvsdiv (bvmul lt!340495 lt!340496) lt!340495)))))

(assert (=> d!72529 (= lt!340496 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!72529 (= lt!340495 ((_ sign_extend 32) (size!4655 (buf!5190 (_2!9888 lt!340226)))))))

(assert (=> d!72529 (= lt!340492 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9768 (_2!9888 lt!340226))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9763 (_2!9888 lt!340226)))))))

(assert (=> d!72529 (invariant!0 (currentBit!9763 (_2!9888 lt!340226)) (currentByte!9768 (_2!9888 lt!340226)) (size!4655 (buf!5190 (_2!9888 lt!340226))))))

(assert (=> d!72529 (= (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!340226))) (currentByte!9768 (_2!9888 lt!340226)) (currentBit!9763 (_2!9888 lt!340226))) lt!340492)))

(declare-fun b!215609 () Bool)

(declare-fun res!181388 () Bool)

(assert (=> b!215609 (=> (not res!181388) (not e!146687))))

(assert (=> b!215609 (= res!181388 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!340492))))

(declare-fun b!215610 () Bool)

(declare-fun lt!340491 () (_ BitVec 64))

(assert (=> b!215610 (= e!146687 (bvsle lt!340492 (bvmul lt!340491 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!215610 (or (= lt!340491 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!340491 #b0000000000000000000000000000000000000000000000000000000000001000) lt!340491)))))

(assert (=> b!215610 (= lt!340491 ((_ sign_extend 32) (size!4655 (buf!5190 (_2!9888 lt!340226)))))))

(assert (= (and d!72529 res!181389) b!215609))

(assert (= (and b!215609 res!181388) b!215610))

(declare-fun m!331999 () Bool)

(assert (=> d!72529 m!331999))

(declare-fun m!332001 () Bool)

(assert (=> d!72529 m!332001))

(assert (=> b!215478 d!72529))

(declare-fun d!72531 () Bool)

(declare-fun e!146688 () Bool)

(assert (=> d!72531 e!146688))

(declare-fun res!181391 () Bool)

(assert (=> d!72531 (=> (not res!181391) (not e!146688))))

(declare-fun lt!340498 () (_ BitVec 64))

(declare-fun lt!340500 () (_ BitVec 64))

(declare-fun lt!340499 () (_ BitVec 64))

(assert (=> d!72531 (= res!181391 (= lt!340498 (bvsub lt!340499 lt!340500)))))

(assert (=> d!72531 (or (= (bvand lt!340499 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!340500 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!340499 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!340499 lt!340500) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72531 (= lt!340500 (remainingBits!0 ((_ sign_extend 32) (size!4655 (buf!5190 thiss!1204))) ((_ sign_extend 32) (currentByte!9768 thiss!1204)) ((_ sign_extend 32) (currentBit!9763 thiss!1204))))))

(declare-fun lt!340501 () (_ BitVec 64))

(declare-fun lt!340502 () (_ BitVec 64))

(assert (=> d!72531 (= lt!340499 (bvmul lt!340501 lt!340502))))

(assert (=> d!72531 (or (= lt!340501 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!340502 (bvsdiv (bvmul lt!340501 lt!340502) lt!340501)))))

(assert (=> d!72531 (= lt!340502 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!72531 (= lt!340501 ((_ sign_extend 32) (size!4655 (buf!5190 thiss!1204))))))

(assert (=> d!72531 (= lt!340498 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9768 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9763 thiss!1204))))))

(assert (=> d!72531 (invariant!0 (currentBit!9763 thiss!1204) (currentByte!9768 thiss!1204) (size!4655 (buf!5190 thiss!1204)))))

(assert (=> d!72531 (= (bitIndex!0 (size!4655 (buf!5190 thiss!1204)) (currentByte!9768 thiss!1204) (currentBit!9763 thiss!1204)) lt!340498)))

(declare-fun b!215611 () Bool)

(declare-fun res!181390 () Bool)

(assert (=> b!215611 (=> (not res!181390) (not e!146688))))

(assert (=> b!215611 (= res!181390 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!340498))))

(declare-fun b!215612 () Bool)

(declare-fun lt!340497 () (_ BitVec 64))

(assert (=> b!215612 (= e!146688 (bvsle lt!340498 (bvmul lt!340497 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!215612 (or (= lt!340497 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!340497 #b0000000000000000000000000000000000000000000000000000000000001000) lt!340497)))))

(assert (=> b!215612 (= lt!340497 ((_ sign_extend 32) (size!4655 (buf!5190 thiss!1204))))))

(assert (= (and d!72531 res!181391) b!215611))

(assert (= (and b!215611 res!181390) b!215612))

(assert (=> d!72531 m!331905))

(assert (=> d!72531 m!331781))

(assert (=> b!215478 d!72531))

(declare-fun d!72533 () Bool)

(declare-fun lt!340503 () tuple2!18484)

(assert (=> d!72533 (= lt!340503 (readBit!0 (readerFrom!0 (_2!9888 lt!340226) (currentBit!9763 thiss!1204) (currentByte!9768 thiss!1204))))))

(assert (=> d!72533 (= (readBitPure!0 (readerFrom!0 (_2!9888 lt!340226) (currentBit!9763 thiss!1204) (currentByte!9768 thiss!1204))) (tuple2!18473 (_2!9897 lt!340503) (_1!9897 lt!340503)))))

(declare-fun bs!17797 () Bool)

(assert (= bs!17797 d!72533))

(assert (=> bs!17797 m!331709))

(declare-fun m!332003 () Bool)

(assert (=> bs!17797 m!332003))

(assert (=> b!215468 d!72533))

(declare-fun d!72535 () Bool)

(declare-fun e!146691 () Bool)

(assert (=> d!72535 e!146691))

(declare-fun res!181395 () Bool)

(assert (=> d!72535 (=> (not res!181395) (not e!146691))))

(assert (=> d!72535 (= res!181395 (invariant!0 (currentBit!9763 (_2!9888 lt!340226)) (currentByte!9768 (_2!9888 lt!340226)) (size!4655 (buf!5190 (_2!9888 lt!340226)))))))

(assert (=> d!72535 (= (readerFrom!0 (_2!9888 lt!340226) (currentBit!9763 thiss!1204) (currentByte!9768 thiss!1204)) (BitStream!8419 (buf!5190 (_2!9888 lt!340226)) (currentByte!9768 thiss!1204) (currentBit!9763 thiss!1204)))))

(declare-fun b!215615 () Bool)

(assert (=> b!215615 (= e!146691 (invariant!0 (currentBit!9763 thiss!1204) (currentByte!9768 thiss!1204) (size!4655 (buf!5190 (_2!9888 lt!340226)))))))

(assert (= (and d!72535 res!181395) b!215615))

(assert (=> d!72535 m!332001))

(assert (=> b!215615 m!331725))

(assert (=> b!215468 d!72535))

(declare-fun d!72537 () Bool)

(assert (=> d!72537 (= (invariant!0 (currentBit!9763 (_2!9888 lt!340213)) (currentByte!9768 (_2!9888 lt!340213)) (size!4655 (buf!5190 (_2!9888 lt!340213)))) (and (bvsge (currentBit!9763 (_2!9888 lt!340213)) #b00000000000000000000000000000000) (bvslt (currentBit!9763 (_2!9888 lt!340213)) #b00000000000000000000000000001000) (bvsge (currentByte!9768 (_2!9888 lt!340213)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9768 (_2!9888 lt!340213)) (size!4655 (buf!5190 (_2!9888 lt!340213)))) (and (= (currentBit!9763 (_2!9888 lt!340213)) #b00000000000000000000000000000000) (= (currentByte!9768 (_2!9888 lt!340213)) (size!4655 (buf!5190 (_2!9888 lt!340213))))))))))

(assert (=> b!215479 d!72537))

(declare-fun d!72539 () Bool)

(declare-fun e!146692 () Bool)

(assert (=> d!72539 e!146692))

(declare-fun res!181396 () Bool)

(assert (=> d!72539 (=> (not res!181396) (not e!146692))))

(declare-fun lt!340504 () BitStream!8418)

(declare-fun lt!340505 () (_ BitVec 64))

(assert (=> d!72539 (= res!181396 (= (bvadd lt!340505 (bvsub lt!340231 lt!340230)) (bitIndex!0 (size!4655 (buf!5190 lt!340504)) (currentByte!9768 lt!340504) (currentBit!9763 lt!340504))))))

(assert (=> d!72539 (or (not (= (bvand lt!340505 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!340231 lt!340230) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!340505 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!340505 (bvsub lt!340231 lt!340230)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72539 (= lt!340505 (bitIndex!0 (size!4655 (buf!5190 (_2!9889 lt!340215))) (currentByte!9768 (_2!9889 lt!340215)) (currentBit!9763 (_2!9889 lt!340215))))))

(assert (=> d!72539 (= lt!340504 (_2!9888 (moveBitIndex!0 (_2!9889 lt!340215) (bvsub lt!340231 lt!340230))))))

(assert (=> d!72539 (moveBitIndexPrecond!0 (_2!9889 lt!340215) (bvsub lt!340231 lt!340230))))

(assert (=> d!72539 (= (withMovedBitIndex!0 (_2!9889 lt!340215) (bvsub lt!340231 lt!340230)) lt!340504)))

(declare-fun b!215616 () Bool)

(assert (=> b!215616 (= e!146692 (= (size!4655 (buf!5190 (_2!9889 lt!340215))) (size!4655 (buf!5190 lt!340504))))))

(assert (= (and d!72539 res!181396) b!215616))

(declare-fun m!332005 () Bool)

(assert (=> d!72539 m!332005))

(assert (=> d!72539 m!331789))

(declare-fun m!332007 () Bool)

(assert (=> d!72539 m!332007))

(declare-fun m!332009 () Bool)

(assert (=> d!72539 m!332009))

(assert (=> b!215469 d!72539))

(declare-fun d!72541 () Bool)

(assert (=> d!72541 (= (array_inv!4396 (buf!5190 thiss!1204)) (bvsge (size!4655 (buf!5190 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!215480 d!72541))

(declare-fun d!72543 () Bool)

(assert (=> d!72543 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9763 thiss!1204) (currentByte!9768 thiss!1204) (size!4655 (buf!5190 thiss!1204))))))

(declare-fun bs!17798 () Bool)

(assert (= bs!17798 d!72543))

(assert (=> bs!17798 m!331781))

(assert (=> start!44834 d!72543))

(declare-fun d!72545 () Bool)

(declare-fun e!146693 () Bool)

(assert (=> d!72545 e!146693))

(declare-fun res!181398 () Bool)

(assert (=> d!72545 (=> (not res!181398) (not e!146693))))

(declare-fun lt!340509 () (_ BitVec 64))

(declare-fun lt!340508 () (_ BitVec 64))

(declare-fun lt!340507 () (_ BitVec 64))

(assert (=> d!72545 (= res!181398 (= lt!340507 (bvsub lt!340508 lt!340509)))))

(assert (=> d!72545 (or (= (bvand lt!340508 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!340509 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!340508 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!340508 lt!340509) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72545 (= lt!340509 (remainingBits!0 ((_ sign_extend 32) (size!4655 (buf!5190 (_2!9888 lt!340213)))) ((_ sign_extend 32) (currentByte!9768 (_2!9888 lt!340213))) ((_ sign_extend 32) (currentBit!9763 (_2!9888 lt!340213)))))))

(declare-fun lt!340510 () (_ BitVec 64))

(declare-fun lt!340511 () (_ BitVec 64))

(assert (=> d!72545 (= lt!340508 (bvmul lt!340510 lt!340511))))

(assert (=> d!72545 (or (= lt!340510 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!340511 (bvsdiv (bvmul lt!340510 lt!340511) lt!340510)))))

(assert (=> d!72545 (= lt!340511 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!72545 (= lt!340510 ((_ sign_extend 32) (size!4655 (buf!5190 (_2!9888 lt!340213)))))))

(assert (=> d!72545 (= lt!340507 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9768 (_2!9888 lt!340213))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9763 (_2!9888 lt!340213)))))))

(assert (=> d!72545 (invariant!0 (currentBit!9763 (_2!9888 lt!340213)) (currentByte!9768 (_2!9888 lt!340213)) (size!4655 (buf!5190 (_2!9888 lt!340213))))))

(assert (=> d!72545 (= (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!340213))) (currentByte!9768 (_2!9888 lt!340213)) (currentBit!9763 (_2!9888 lt!340213))) lt!340507)))

(declare-fun b!215617 () Bool)

(declare-fun res!181397 () Bool)

(assert (=> b!215617 (=> (not res!181397) (not e!146693))))

(assert (=> b!215617 (= res!181397 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!340507))))

(declare-fun b!215618 () Bool)

(declare-fun lt!340506 () (_ BitVec 64))

(assert (=> b!215618 (= e!146693 (bvsle lt!340507 (bvmul lt!340506 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!215618 (or (= lt!340506 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!340506 #b0000000000000000000000000000000000000000000000000000000000001000) lt!340506)))))

(assert (=> b!215618 (= lt!340506 ((_ sign_extend 32) (size!4655 (buf!5190 (_2!9888 lt!340213)))))))

(assert (= (and d!72545 res!181398) b!215617))

(assert (= (and b!215617 res!181397) b!215618))

(declare-fun m!332011 () Bool)

(assert (=> d!72545 m!332011))

(assert (=> d!72545 m!331761))

(assert (=> b!215481 d!72545))

(declare-fun d!72547 () Bool)

(declare-fun res!181399 () Bool)

(declare-fun e!146694 () Bool)

(assert (=> d!72547 (=> (not res!181399) (not e!146694))))

(assert (=> d!72547 (= res!181399 (= (size!4655 (buf!5190 thiss!1204)) (size!4655 (buf!5190 (_2!9888 lt!340213)))))))

(assert (=> d!72547 (= (isPrefixOf!0 thiss!1204 (_2!9888 lt!340213)) e!146694)))

(declare-fun b!215619 () Bool)

(declare-fun res!181401 () Bool)

(assert (=> b!215619 (=> (not res!181401) (not e!146694))))

(assert (=> b!215619 (= res!181401 (bvsle (bitIndex!0 (size!4655 (buf!5190 thiss!1204)) (currentByte!9768 thiss!1204) (currentBit!9763 thiss!1204)) (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!340213))) (currentByte!9768 (_2!9888 lt!340213)) (currentBit!9763 (_2!9888 lt!340213)))))))

(declare-fun b!215620 () Bool)

(declare-fun e!146695 () Bool)

(assert (=> b!215620 (= e!146694 e!146695)))

(declare-fun res!181400 () Bool)

(assert (=> b!215620 (=> res!181400 e!146695)))

(assert (=> b!215620 (= res!181400 (= (size!4655 (buf!5190 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!215621 () Bool)

(assert (=> b!215621 (= e!146695 (arrayBitRangesEq!0 (buf!5190 thiss!1204) (buf!5190 (_2!9888 lt!340213)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4655 (buf!5190 thiss!1204)) (currentByte!9768 thiss!1204) (currentBit!9763 thiss!1204))))))

(assert (= (and d!72547 res!181399) b!215619))

(assert (= (and b!215619 res!181401) b!215620))

(assert (= (and b!215620 (not res!181400)) b!215621))

(assert (=> b!215619 m!331715))

(assert (=> b!215619 m!331763))

(assert (=> b!215621 m!331715))

(assert (=> b!215621 m!331715))

(declare-fun m!332013 () Bool)

(assert (=> b!215621 m!332013))

(assert (=> b!215481 d!72547))

(declare-fun d!72549 () Bool)

(assert (=> d!72549 (isPrefixOf!0 thiss!1204 (_2!9888 lt!340213))))

(declare-fun lt!340514 () Unit!15294)

(declare-fun choose!30 (BitStream!8418 BitStream!8418 BitStream!8418) Unit!15294)

(assert (=> d!72549 (= lt!340514 (choose!30 thiss!1204 (_2!9888 lt!340226) (_2!9888 lt!340213)))))

(assert (=> d!72549 (isPrefixOf!0 thiss!1204 (_2!9888 lt!340226))))

(assert (=> d!72549 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9888 lt!340226) (_2!9888 lt!340213)) lt!340514)))

(declare-fun bs!17799 () Bool)

(assert (= bs!17799 d!72549))

(assert (=> bs!17799 m!331765))

(declare-fun m!332015 () Bool)

(assert (=> bs!17799 m!332015))

(assert (=> bs!17799 m!331753))

(assert (=> b!215481 d!72549))

(declare-fun b!215811 () Bool)

(declare-fun res!181571 () Bool)

(declare-fun e!146804 () Bool)

(assert (=> b!215811 (=> (not res!181571) (not e!146804))))

(declare-fun lt!341061 () tuple2!18466)

(assert (=> b!215811 (= res!181571 (isPrefixOf!0 (_2!9888 lt!340226) (_2!9888 lt!341061)))))

(declare-fun b!215812 () Bool)

(declare-fun e!146803 () Bool)

(declare-fun lt!341092 () tuple2!18470)

(declare-fun lt!341097 () tuple2!18468)

(assert (=> b!215812 (= e!146803 (= (_1!9890 lt!341092) (_2!9889 lt!341097)))))

(declare-fun b!215813 () Bool)

(declare-fun e!146808 () Bool)

(declare-fun lt!341057 () (_ BitVec 64))

(assert (=> b!215813 (= e!146808 (validate_offset_bits!1 ((_ sign_extend 32) (size!4655 (buf!5190 (_2!9888 lt!340226)))) ((_ sign_extend 32) (currentByte!9768 (_2!9888 lt!340226))) ((_ sign_extend 32) (currentBit!9763 (_2!9888 lt!340226))) lt!341057))))

(declare-fun b!215814 () Bool)

(declare-fun e!146806 () (_ BitVec 64))

(assert (=> b!215814 (= e!146806 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!215815 () Bool)

(declare-fun e!146807 () tuple2!18466)

(declare-fun Unit!15300 () Unit!15294)

(assert (=> b!215815 (= e!146807 (tuple2!18467 Unit!15300 (_2!9888 lt!340226)))))

(declare-fun lt!341056 () Unit!15294)

(assert (=> b!215815 (= lt!341056 (lemmaIsPrefixRefl!0 (_2!9888 lt!340226)))))

(declare-fun call!3363 () Bool)

(assert (=> b!215815 call!3363))

(declare-fun lt!341064 () Unit!15294)

(assert (=> b!215815 (= lt!341064 lt!341056)))

(declare-fun b!215816 () Bool)

(declare-fun res!181576 () Bool)

(assert (=> b!215816 (=> (not res!181576) (not e!146804))))

(assert (=> b!215816 (= res!181576 (= (size!4655 (buf!5190 (_2!9888 lt!340226))) (size!4655 (buf!5190 (_2!9888 lt!341061)))))))

(declare-fun b!215817 () Bool)

(declare-fun e!146811 () Bool)

(declare-fun lt!341081 () tuple2!18470)

(declare-fun lt!341079 () tuple2!18468)

(assert (=> b!215817 (= e!146811 (= (_1!9890 lt!341081) (_2!9889 lt!341079)))))

(declare-fun b!215818 () Bool)

(declare-fun res!181577 () Bool)

(declare-fun lt!341070 () tuple2!18466)

(assert (=> b!215818 (= res!181577 (= (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!341070))) (currentByte!9768 (_2!9888 lt!341070)) (currentBit!9763 (_2!9888 lt!341070))) (bvadd (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!340226))) (currentByte!9768 (_2!9888 lt!340226)) (currentBit!9763 (_2!9888 lt!340226))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun e!146805 () Bool)

(assert (=> b!215818 (=> (not res!181577) (not e!146805))))

(declare-fun d!72551 () Bool)

(assert (=> d!72551 e!146804))

(declare-fun res!181570 () Bool)

(assert (=> d!72551 (=> (not res!181570) (not e!146804))))

(assert (=> d!72551 (= res!181570 (invariant!0 (currentBit!9763 (_2!9888 lt!341061)) (currentByte!9768 (_2!9888 lt!341061)) (size!4655 (buf!5190 (_2!9888 lt!341061)))))))

(assert (=> d!72551 (= lt!341061 e!146807)))

(declare-fun c!10526 () Bool)

(assert (=> d!72551 (= c!10526 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!72551 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!72551 (= (appendBitsLSBFirstLoopTR!0 (_2!9888 lt!340226) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!341061)))

(declare-fun b!215819 () Bool)

(assert (=> b!215819 (= e!146804 e!146811)))

(declare-fun res!181572 () Bool)

(assert (=> b!215819 (=> (not res!181572) (not e!146811))))

(assert (=> b!215819 (= res!181572 (= (_2!9890 lt!341081) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!215819 (= lt!341081 (readNBitsLSBFirstsLoopPure!0 (_1!9889 lt!341079) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!341085 () Unit!15294)

(declare-fun lt!341051 () Unit!15294)

(assert (=> b!215819 (= lt!341085 lt!341051)))

(assert (=> b!215819 (validate_offset_bits!1 ((_ sign_extend 32) (size!4655 (buf!5190 (_2!9888 lt!341061)))) ((_ sign_extend 32) (currentByte!9768 (_2!9888 lt!340226))) ((_ sign_extend 32) (currentBit!9763 (_2!9888 lt!340226))) lt!341057)))

(assert (=> b!215819 (= lt!341051 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9888 lt!340226) (buf!5190 (_2!9888 lt!341061)) lt!341057))))

(assert (=> b!215819 e!146808))

(declare-fun res!181569 () Bool)

(assert (=> b!215819 (=> (not res!181569) (not e!146808))))

(assert (=> b!215819 (= res!181569 (and (= (size!4655 (buf!5190 (_2!9888 lt!340226))) (size!4655 (buf!5190 (_2!9888 lt!341061)))) (bvsge lt!341057 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!215819 (= lt!341057 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!215819 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!215819 (= lt!341079 (reader!0 (_2!9888 lt!340226) (_2!9888 lt!341061)))))

(declare-fun b!215820 () Bool)

(declare-fun res!181574 () Bool)

(assert (=> b!215820 (= res!181574 (isPrefixOf!0 (_2!9888 lt!340226) (_2!9888 lt!341070)))))

(assert (=> b!215820 (=> (not res!181574) (not e!146805))))

(declare-fun b!215821 () Bool)

(declare-fun e!146810 () Bool)

(declare-fun lt!341099 () tuple2!18472)

(assert (=> b!215821 (= e!146810 (= (bitIndex!0 (size!4655 (buf!5190 (_1!9891 lt!341099))) (currentByte!9768 (_1!9891 lt!341099)) (currentBit!9763 (_1!9891 lt!341099))) (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!341070))) (currentByte!9768 (_2!9888 lt!341070)) (currentBit!9763 (_2!9888 lt!341070)))))))

(declare-fun b!215822 () Bool)

(declare-fun lt!341049 () tuple2!18466)

(assert (=> b!215822 (= e!146807 (tuple2!18467 (_1!9888 lt!341049) (_2!9888 lt!341049)))))

(declare-fun lt!341086 () Bool)

(assert (=> b!215822 (= lt!341086 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!215822 (= lt!341070 (appendBit!0 (_2!9888 lt!340226) lt!341086))))

(declare-fun res!181575 () Bool)

(assert (=> b!215822 (= res!181575 (= (size!4655 (buf!5190 (_2!9888 lt!340226))) (size!4655 (buf!5190 (_2!9888 lt!341070)))))))

(assert (=> b!215822 (=> (not res!181575) (not e!146805))))

(assert (=> b!215822 e!146805))

(declare-fun lt!341080 () tuple2!18466)

(assert (=> b!215822 (= lt!341080 lt!341070)))

(assert (=> b!215822 (= lt!341049 (appendBitsLSBFirstLoopTR!0 (_2!9888 lt!341080) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!341052 () Unit!15294)

(assert (=> b!215822 (= lt!341052 (lemmaIsPrefixTransitive!0 (_2!9888 lt!340226) (_2!9888 lt!341080) (_2!9888 lt!341049)))))

(assert (=> b!215822 call!3363))

(declare-fun lt!341065 () Unit!15294)

(assert (=> b!215822 (= lt!341065 lt!341052)))

(assert (=> b!215822 (invariant!0 (currentBit!9763 (_2!9888 lt!340226)) (currentByte!9768 (_2!9888 lt!340226)) (size!4655 (buf!5190 (_2!9888 lt!341080))))))

(declare-fun lt!341067 () BitStream!8418)

(assert (=> b!215822 (= lt!341067 (BitStream!8419 (buf!5190 (_2!9888 lt!341080)) (currentByte!9768 (_2!9888 lt!340226)) (currentBit!9763 (_2!9888 lt!340226))))))

(assert (=> b!215822 (invariant!0 (currentBit!9763 lt!341067) (currentByte!9768 lt!341067) (size!4655 (buf!5190 (_2!9888 lt!341049))))))

(declare-fun lt!341072 () BitStream!8418)

(assert (=> b!215822 (= lt!341072 (BitStream!8419 (buf!5190 (_2!9888 lt!341049)) (currentByte!9768 lt!341067) (currentBit!9763 lt!341067)))))

(declare-fun lt!341073 () tuple2!18472)

(assert (=> b!215822 (= lt!341073 (readBitPure!0 lt!341067))))

(declare-fun lt!341066 () tuple2!18472)

(assert (=> b!215822 (= lt!341066 (readBitPure!0 lt!341072))))

(declare-fun lt!341091 () Unit!15294)

(assert (=> b!215822 (= lt!341091 (readBitPrefixLemma!0 lt!341067 (_2!9888 lt!341049)))))

(declare-fun res!181573 () Bool)

(assert (=> b!215822 (= res!181573 (= (bitIndex!0 (size!4655 (buf!5190 (_1!9891 lt!341073))) (currentByte!9768 (_1!9891 lt!341073)) (currentBit!9763 (_1!9891 lt!341073))) (bitIndex!0 (size!4655 (buf!5190 (_1!9891 lt!341066))) (currentByte!9768 (_1!9891 lt!341066)) (currentBit!9763 (_1!9891 lt!341066)))))))

(declare-fun e!146809 () Bool)

(assert (=> b!215822 (=> (not res!181573) (not e!146809))))

(assert (=> b!215822 e!146809))

(declare-fun lt!341045 () Unit!15294)

(assert (=> b!215822 (= lt!341045 lt!341091)))

(declare-fun lt!341084 () tuple2!18468)

(assert (=> b!215822 (= lt!341084 (reader!0 (_2!9888 lt!340226) (_2!9888 lt!341049)))))

(declare-fun lt!341094 () tuple2!18468)

(assert (=> b!215822 (= lt!341094 (reader!0 (_2!9888 lt!341080) (_2!9888 lt!341049)))))

(declare-fun lt!341082 () tuple2!18472)

(assert (=> b!215822 (= lt!341082 (readBitPure!0 (_1!9889 lt!341084)))))

(assert (=> b!215822 (= (_2!9891 lt!341082) lt!341086)))

(declare-fun lt!341083 () Unit!15294)

(declare-fun Unit!15301 () Unit!15294)

(assert (=> b!215822 (= lt!341083 Unit!15301)))

(declare-fun lt!341069 () (_ BitVec 64))

(assert (=> b!215822 (= lt!341069 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!341058 () (_ BitVec 64))

(assert (=> b!215822 (= lt!341058 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!341055 () Unit!15294)

(assert (=> b!215822 (= lt!341055 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9888 lt!340226) (buf!5190 (_2!9888 lt!341049)) lt!341058))))

(assert (=> b!215822 (validate_offset_bits!1 ((_ sign_extend 32) (size!4655 (buf!5190 (_2!9888 lt!341049)))) ((_ sign_extend 32) (currentByte!9768 (_2!9888 lt!340226))) ((_ sign_extend 32) (currentBit!9763 (_2!9888 lt!340226))) lt!341058)))

(declare-fun lt!341068 () Unit!15294)

(assert (=> b!215822 (= lt!341068 lt!341055)))

(declare-fun lt!341063 () tuple2!18470)

(assert (=> b!215822 (= lt!341063 (readNBitsLSBFirstsLoopPure!0 (_1!9889 lt!341084) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!341069))))

(declare-fun lt!341088 () (_ BitVec 64))

(assert (=> b!215822 (= lt!341088 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!341098 () Unit!15294)

(assert (=> b!215822 (= lt!341098 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9888 lt!341080) (buf!5190 (_2!9888 lt!341049)) lt!341088))))

(assert (=> b!215822 (validate_offset_bits!1 ((_ sign_extend 32) (size!4655 (buf!5190 (_2!9888 lt!341049)))) ((_ sign_extend 32) (currentByte!9768 (_2!9888 lt!341080))) ((_ sign_extend 32) (currentBit!9763 (_2!9888 lt!341080))) lt!341088)))

(declare-fun lt!341071 () Unit!15294)

(assert (=> b!215822 (= lt!341071 lt!341098)))

(declare-fun lt!341053 () tuple2!18470)

(assert (=> b!215822 (= lt!341053 (readNBitsLSBFirstsLoopPure!0 (_1!9889 lt!341094) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!341069 (ite (_2!9891 lt!341082) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!341095 () tuple2!18470)

(assert (=> b!215822 (= lt!341095 (readNBitsLSBFirstsLoopPure!0 (_1!9889 lt!341084) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!341069))))

(declare-fun c!10525 () Bool)

(assert (=> b!215822 (= c!10525 (_2!9891 (readBitPure!0 (_1!9889 lt!341084))))))

(declare-fun lt!341089 () tuple2!18470)

(assert (=> b!215822 (= lt!341089 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9889 lt!341084) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!341069 e!146806)))))

(declare-fun lt!341059 () Unit!15294)

(assert (=> b!215822 (= lt!341059 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9889 lt!341084) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!341069))))

(assert (=> b!215822 (and (= (_2!9890 lt!341095) (_2!9890 lt!341089)) (= (_1!9890 lt!341095) (_1!9890 lt!341089)))))

(declare-fun lt!341048 () Unit!15294)

(assert (=> b!215822 (= lt!341048 lt!341059)))

(assert (=> b!215822 (= (_1!9889 lt!341084) (withMovedBitIndex!0 (_2!9889 lt!341084) (bvsub (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!340226))) (currentByte!9768 (_2!9888 lt!340226)) (currentBit!9763 (_2!9888 lt!340226))) (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!341049))) (currentByte!9768 (_2!9888 lt!341049)) (currentBit!9763 (_2!9888 lt!341049))))))))

(declare-fun lt!341074 () Unit!15294)

(declare-fun Unit!15302 () Unit!15294)

(assert (=> b!215822 (= lt!341074 Unit!15302)))

(assert (=> b!215822 (= (_1!9889 lt!341094) (withMovedBitIndex!0 (_2!9889 lt!341094) (bvsub (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!341080))) (currentByte!9768 (_2!9888 lt!341080)) (currentBit!9763 (_2!9888 lt!341080))) (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!341049))) (currentByte!9768 (_2!9888 lt!341049)) (currentBit!9763 (_2!9888 lt!341049))))))))

(declare-fun lt!341078 () Unit!15294)

(declare-fun Unit!15303 () Unit!15294)

(assert (=> b!215822 (= lt!341078 Unit!15303)))

(assert (=> b!215822 (= (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!340226))) (currentByte!9768 (_2!9888 lt!340226)) (currentBit!9763 (_2!9888 lt!340226))) (bvsub (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!341080))) (currentByte!9768 (_2!9888 lt!341080)) (currentBit!9763 (_2!9888 lt!341080))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!341090 () Unit!15294)

(declare-fun Unit!15304 () Unit!15294)

(assert (=> b!215822 (= lt!341090 Unit!15304)))

(assert (=> b!215822 (= (_2!9890 lt!341063) (_2!9890 lt!341053))))

(declare-fun lt!341060 () Unit!15294)

(declare-fun Unit!15305 () Unit!15294)

(assert (=> b!215822 (= lt!341060 Unit!15305)))

(assert (=> b!215822 (invariant!0 (currentBit!9763 (_2!9888 lt!341049)) (currentByte!9768 (_2!9888 lt!341049)) (size!4655 (buf!5190 (_2!9888 lt!341049))))))

(declare-fun lt!341047 () Unit!15294)

(declare-fun Unit!15306 () Unit!15294)

(assert (=> b!215822 (= lt!341047 Unit!15306)))

(assert (=> b!215822 (= (size!4655 (buf!5190 (_2!9888 lt!340226))) (size!4655 (buf!5190 (_2!9888 lt!341049))))))

(declare-fun lt!341046 () Unit!15294)

(declare-fun Unit!15307 () Unit!15294)

(assert (=> b!215822 (= lt!341046 Unit!15307)))

(assert (=> b!215822 (= (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!341049))) (currentByte!9768 (_2!9888 lt!341049)) (currentBit!9763 (_2!9888 lt!341049))) (bvsub (bvadd (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!340226))) (currentByte!9768 (_2!9888 lt!340226)) (currentBit!9763 (_2!9888 lt!340226))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!341096 () Unit!15294)

(declare-fun Unit!15308 () Unit!15294)

(assert (=> b!215822 (= lt!341096 Unit!15308)))

(declare-fun lt!341050 () Unit!15294)

(declare-fun Unit!15309 () Unit!15294)

(assert (=> b!215822 (= lt!341050 Unit!15309)))

(assert (=> b!215822 (= lt!341097 (reader!0 (_2!9888 lt!340226) (_2!9888 lt!341049)))))

(declare-fun lt!341087 () (_ BitVec 64))

(assert (=> b!215822 (= lt!341087 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!341093 () Unit!15294)

(assert (=> b!215822 (= lt!341093 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9888 lt!340226) (buf!5190 (_2!9888 lt!341049)) lt!341087))))

(assert (=> b!215822 (validate_offset_bits!1 ((_ sign_extend 32) (size!4655 (buf!5190 (_2!9888 lt!341049)))) ((_ sign_extend 32) (currentByte!9768 (_2!9888 lt!340226))) ((_ sign_extend 32) (currentBit!9763 (_2!9888 lt!340226))) lt!341087)))

(declare-fun lt!341076 () Unit!15294)

(assert (=> b!215822 (= lt!341076 lt!341093)))

(assert (=> b!215822 (= lt!341092 (readNBitsLSBFirstsLoopPure!0 (_1!9889 lt!341097) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!181567 () Bool)

(assert (=> b!215822 (= res!181567 (= (_2!9890 lt!341092) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!215822 (=> (not res!181567) (not e!146803))))

(assert (=> b!215822 e!146803))

(declare-fun lt!341100 () Unit!15294)

(declare-fun Unit!15310 () Unit!15294)

(assert (=> b!215822 (= lt!341100 Unit!15310)))

(declare-fun b!215823 () Bool)

(declare-fun res!181568 () Bool)

(assert (=> b!215823 (=> (not res!181568) (not e!146804))))

(declare-fun lt!341054 () (_ BitVec 64))

(declare-fun lt!341062 () (_ BitVec 64))

(assert (=> b!215823 (= res!181568 (= (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!341061))) (currentByte!9768 (_2!9888 lt!341061)) (currentBit!9763 (_2!9888 lt!341061))) (bvsub lt!341062 lt!341054)))))

(assert (=> b!215823 (or (= (bvand lt!341062 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!341054 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!341062 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!341062 lt!341054) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!215823 (= lt!341054 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!341077 () (_ BitVec 64))

(declare-fun lt!341075 () (_ BitVec 64))

(assert (=> b!215823 (= lt!341062 (bvadd lt!341077 lt!341075))))

(assert (=> b!215823 (or (not (= (bvand lt!341077 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!341075 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!341077 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!341077 lt!341075) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!215823 (= lt!341075 ((_ sign_extend 32) nBits!348))))

(assert (=> b!215823 (= lt!341077 (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!340226))) (currentByte!9768 (_2!9888 lt!340226)) (currentBit!9763 (_2!9888 lt!340226))))))

(declare-fun bm!3360 () Bool)

(assert (=> bm!3360 (= call!3363 (isPrefixOf!0 (_2!9888 lt!340226) (ite c!10526 (_2!9888 lt!340226) (_2!9888 lt!341049))))))

(declare-fun b!215824 () Bool)

(assert (=> b!215824 (= e!146809 (= (_2!9891 lt!341073) (_2!9891 lt!341066)))))

(declare-fun b!215825 () Bool)

(assert (=> b!215825 (= e!146806 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!215826 () Bool)

(assert (=> b!215826 (= lt!341099 (readBitPure!0 (readerFrom!0 (_2!9888 lt!341070) (currentBit!9763 (_2!9888 lt!340226)) (currentByte!9768 (_2!9888 lt!340226)))))))

(declare-fun res!181578 () Bool)

(assert (=> b!215826 (= res!181578 (and (= (_2!9891 lt!341099) lt!341086) (= (_1!9891 lt!341099) (_2!9888 lt!341070))))))

(assert (=> b!215826 (=> (not res!181578) (not e!146810))))

(assert (=> b!215826 (= e!146805 e!146810)))

(assert (= (and d!72551 c!10526) b!215815))

(assert (= (and d!72551 (not c!10526)) b!215822))

(assert (= (and b!215822 res!181575) b!215818))

(assert (= (and b!215818 res!181577) b!215820))

(assert (= (and b!215820 res!181574) b!215826))

(assert (= (and b!215826 res!181578) b!215821))

(assert (= (and b!215822 res!181573) b!215824))

(assert (= (and b!215822 c!10525) b!215814))

(assert (= (and b!215822 (not c!10525)) b!215825))

(assert (= (and b!215822 res!181567) b!215812))

(assert (= (or b!215815 b!215822) bm!3360))

(assert (= (and d!72551 res!181570) b!215816))

(assert (= (and b!215816 res!181576) b!215823))

(assert (= (and b!215823 res!181568) b!215811))

(assert (= (and b!215811 res!181571) b!215819))

(assert (= (and b!215819 res!181569) b!215813))

(assert (= (and b!215819 res!181572) b!215817))

(declare-fun m!332339 () Bool)

(assert (=> b!215819 m!332339))

(declare-fun m!332341 () Bool)

(assert (=> b!215819 m!332341))

(declare-fun m!332343 () Bool)

(assert (=> b!215819 m!332343))

(assert (=> b!215819 m!331717))

(declare-fun m!332345 () Bool)

(assert (=> b!215819 m!332345))

(declare-fun m!332347 () Bool)

(assert (=> b!215819 m!332347))

(declare-fun m!332349 () Bool)

(assert (=> bm!3360 m!332349))

(declare-fun m!332351 () Bool)

(assert (=> b!215823 m!332351))

(assert (=> b!215823 m!331713))

(declare-fun m!332353 () Bool)

(assert (=> b!215813 m!332353))

(declare-fun m!332355 () Bool)

(assert (=> b!215822 m!332355))

(declare-fun m!332357 () Bool)

(assert (=> b!215822 m!332357))

(declare-fun m!332359 () Bool)

(assert (=> b!215822 m!332359))

(declare-fun m!332361 () Bool)

(assert (=> b!215822 m!332361))

(declare-fun m!332363 () Bool)

(assert (=> b!215822 m!332363))

(declare-fun m!332365 () Bool)

(assert (=> b!215822 m!332365))

(assert (=> b!215822 m!332343))

(assert (=> b!215822 m!331717))

(declare-fun m!332367 () Bool)

(assert (=> b!215822 m!332367))

(declare-fun m!332369 () Bool)

(assert (=> b!215822 m!332369))

(declare-fun m!332371 () Bool)

(assert (=> b!215822 m!332371))

(declare-fun m!332373 () Bool)

(assert (=> b!215822 m!332373))

(declare-fun m!332375 () Bool)

(assert (=> b!215822 m!332375))

(declare-fun m!332377 () Bool)

(assert (=> b!215822 m!332377))

(declare-fun m!332379 () Bool)

(assert (=> b!215822 m!332379))

(declare-fun m!332381 () Bool)

(assert (=> b!215822 m!332381))

(declare-fun m!332383 () Bool)

(assert (=> b!215822 m!332383))

(declare-fun m!332385 () Bool)

(assert (=> b!215822 m!332385))

(declare-fun m!332387 () Bool)

(assert (=> b!215822 m!332387))

(declare-fun m!332389 () Bool)

(assert (=> b!215822 m!332389))

(declare-fun m!332391 () Bool)

(assert (=> b!215822 m!332391))

(declare-fun m!332393 () Bool)

(assert (=> b!215822 m!332393))

(declare-fun m!332395 () Bool)

(assert (=> b!215822 m!332395))

(declare-fun m!332397 () Bool)

(assert (=> b!215822 m!332397))

(declare-fun m!332399 () Bool)

(assert (=> b!215822 m!332399))

(declare-fun m!332401 () Bool)

(assert (=> b!215822 m!332401))

(assert (=> b!215822 m!332387))

(declare-fun m!332403 () Bool)

(assert (=> b!215822 m!332403))

(declare-fun m!332405 () Bool)

(assert (=> b!215822 m!332405))

(declare-fun m!332407 () Bool)

(assert (=> b!215822 m!332407))

(assert (=> b!215822 m!331713))

(declare-fun m!332409 () Bool)

(assert (=> b!215822 m!332409))

(declare-fun m!332411 () Bool)

(assert (=> b!215822 m!332411))

(declare-fun m!332413 () Bool)

(assert (=> b!215822 m!332413))

(declare-fun m!332415 () Bool)

(assert (=> b!215821 m!332415))

(declare-fun m!332417 () Bool)

(assert (=> b!215821 m!332417))

(declare-fun m!332419 () Bool)

(assert (=> d!72551 m!332419))

(assert (=> b!215818 m!332417))

(assert (=> b!215818 m!331713))

(declare-fun m!332421 () Bool)

(assert (=> b!215820 m!332421))

(declare-fun m!332423 () Bool)

(assert (=> b!215826 m!332423))

(assert (=> b!215826 m!332423))

(declare-fun m!332425 () Bool)

(assert (=> b!215826 m!332425))

(declare-fun m!332427 () Bool)

(assert (=> b!215811 m!332427))

(assert (=> b!215815 m!331931))

(assert (=> b!215481 d!72551))

(assert (=> b!215472 d!72529))

(assert (=> b!215472 d!72531))

(declare-fun b!215838 () Bool)

(declare-fun e!146816 () Bool)

(declare-fun e!146817 () Bool)

(assert (=> b!215838 (= e!146816 e!146817)))

(declare-fun res!181589 () Bool)

(assert (=> b!215838 (=> (not res!181589) (not e!146817))))

(declare-fun lt!341109 () tuple2!18472)

(declare-fun lt!341112 () tuple2!18466)

(assert (=> b!215838 (= res!181589 (and (= (_2!9891 lt!341109) lt!340224) (= (_1!9891 lt!341109) (_2!9888 lt!341112))))))

(assert (=> b!215838 (= lt!341109 (readBitPure!0 (readerFrom!0 (_2!9888 lt!341112) (currentBit!9763 thiss!1204) (currentByte!9768 thiss!1204))))))

(declare-fun b!215836 () Bool)

(declare-fun res!181587 () Bool)

(assert (=> b!215836 (=> (not res!181587) (not e!146816))))

(declare-fun lt!341110 () (_ BitVec 64))

(declare-fun lt!341111 () (_ BitVec 64))

(assert (=> b!215836 (= res!181587 (= (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!341112))) (currentByte!9768 (_2!9888 lt!341112)) (currentBit!9763 (_2!9888 lt!341112))) (bvadd lt!341110 lt!341111)))))

(assert (=> b!215836 (or (not (= (bvand lt!341110 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!341111 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!341110 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!341110 lt!341111) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!215836 (= lt!341111 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!215836 (= lt!341110 (bitIndex!0 (size!4655 (buf!5190 thiss!1204)) (currentByte!9768 thiss!1204) (currentBit!9763 thiss!1204)))))

(declare-fun b!215837 () Bool)

(declare-fun res!181590 () Bool)

(assert (=> b!215837 (=> (not res!181590) (not e!146816))))

(assert (=> b!215837 (= res!181590 (isPrefixOf!0 thiss!1204 (_2!9888 lt!341112)))))

(declare-fun d!72715 () Bool)

(assert (=> d!72715 e!146816))

(declare-fun res!181588 () Bool)

(assert (=> d!72715 (=> (not res!181588) (not e!146816))))

(assert (=> d!72715 (= res!181588 (= (size!4655 (buf!5190 thiss!1204)) (size!4655 (buf!5190 (_2!9888 lt!341112)))))))

(declare-fun choose!16 (BitStream!8418 Bool) tuple2!18466)

(assert (=> d!72715 (= lt!341112 (choose!16 thiss!1204 lt!340224))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!72715 (validate_offset_bit!0 ((_ sign_extend 32) (size!4655 (buf!5190 thiss!1204))) ((_ sign_extend 32) (currentByte!9768 thiss!1204)) ((_ sign_extend 32) (currentBit!9763 thiss!1204)))))

(assert (=> d!72715 (= (appendBit!0 thiss!1204 lt!340224) lt!341112)))

(declare-fun b!215839 () Bool)

(assert (=> b!215839 (= e!146817 (= (bitIndex!0 (size!4655 (buf!5190 (_1!9891 lt!341109))) (currentByte!9768 (_1!9891 lt!341109)) (currentBit!9763 (_1!9891 lt!341109))) (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!341112))) (currentByte!9768 (_2!9888 lt!341112)) (currentBit!9763 (_2!9888 lt!341112)))))))

(assert (= (and d!72715 res!181588) b!215836))

(assert (= (and b!215836 res!181587) b!215837))

(assert (= (and b!215837 res!181590) b!215838))

(assert (= (and b!215838 res!181589) b!215839))

(declare-fun m!332429 () Bool)

(assert (=> b!215837 m!332429))

(declare-fun m!332431 () Bool)

(assert (=> d!72715 m!332431))

(declare-fun m!332433 () Bool)

(assert (=> d!72715 m!332433))

(declare-fun m!332435 () Bool)

(assert (=> b!215839 m!332435))

(declare-fun m!332437 () Bool)

(assert (=> b!215839 m!332437))

(declare-fun m!332439 () Bool)

(assert (=> b!215838 m!332439))

(assert (=> b!215838 m!332439))

(declare-fun m!332441 () Bool)

(assert (=> b!215838 m!332441))

(assert (=> b!215836 m!332437))

(assert (=> b!215836 m!331715))

(assert (=> b!215472 d!72715))

(declare-fun d!72717 () Bool)

(declare-fun e!146818 () Bool)

(assert (=> d!72717 e!146818))

(declare-fun res!181592 () Bool)

(assert (=> d!72717 (=> (not res!181592) (not e!146818))))

(declare-fun lt!341114 () (_ BitVec 64))

(declare-fun lt!341115 () (_ BitVec 64))

(declare-fun lt!341116 () (_ BitVec 64))

(assert (=> d!72717 (= res!181592 (= lt!341114 (bvsub lt!341115 lt!341116)))))

(assert (=> d!72717 (or (= (bvand lt!341115 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!341116 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!341115 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!341115 lt!341116) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72717 (= lt!341116 (remainingBits!0 ((_ sign_extend 32) (size!4655 (buf!5190 (_1!9890 lt!340237)))) ((_ sign_extend 32) (currentByte!9768 (_1!9890 lt!340237))) ((_ sign_extend 32) (currentBit!9763 (_1!9890 lt!340237)))))))

(declare-fun lt!341117 () (_ BitVec 64))

(declare-fun lt!341118 () (_ BitVec 64))

(assert (=> d!72717 (= lt!341115 (bvmul lt!341117 lt!341118))))

(assert (=> d!72717 (or (= lt!341117 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!341118 (bvsdiv (bvmul lt!341117 lt!341118) lt!341117)))))

(assert (=> d!72717 (= lt!341118 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!72717 (= lt!341117 ((_ sign_extend 32) (size!4655 (buf!5190 (_1!9890 lt!340237)))))))

(assert (=> d!72717 (= lt!341114 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9768 (_1!9890 lt!340237))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9763 (_1!9890 lt!340237)))))))

(assert (=> d!72717 (invariant!0 (currentBit!9763 (_1!9890 lt!340237)) (currentByte!9768 (_1!9890 lt!340237)) (size!4655 (buf!5190 (_1!9890 lt!340237))))))

(assert (=> d!72717 (= (bitIndex!0 (size!4655 (buf!5190 (_1!9890 lt!340237))) (currentByte!9768 (_1!9890 lt!340237)) (currentBit!9763 (_1!9890 lt!340237))) lt!341114)))

(declare-fun b!215840 () Bool)

(declare-fun res!181591 () Bool)

(assert (=> b!215840 (=> (not res!181591) (not e!146818))))

(assert (=> b!215840 (= res!181591 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!341114))))

(declare-fun b!215841 () Bool)

(declare-fun lt!341113 () (_ BitVec 64))

(assert (=> b!215841 (= e!146818 (bvsle lt!341114 (bvmul lt!341113 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!215841 (or (= lt!341113 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!341113 #b0000000000000000000000000000000000000000000000000000000000001000) lt!341113)))))

(assert (=> b!215841 (= lt!341113 ((_ sign_extend 32) (size!4655 (buf!5190 (_1!9890 lt!340237)))))))

(assert (= (and d!72717 res!181592) b!215840))

(assert (= (and b!215840 res!181591) b!215841))

(declare-fun m!332443 () Bool)

(assert (=> d!72717 m!332443))

(declare-fun m!332445 () Bool)

(assert (=> d!72717 m!332445))

(assert (=> b!215483 d!72717))

(declare-fun d!72719 () Bool)

(declare-fun e!146819 () Bool)

(assert (=> d!72719 e!146819))

(declare-fun res!181594 () Bool)

(assert (=> d!72719 (=> (not res!181594) (not e!146819))))

(declare-fun lt!341121 () (_ BitVec 64))

(declare-fun lt!341120 () (_ BitVec 64))

(declare-fun lt!341122 () (_ BitVec 64))

(assert (=> d!72719 (= res!181594 (= lt!341120 (bvsub lt!341121 lt!341122)))))

(assert (=> d!72719 (or (= (bvand lt!341121 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!341122 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!341121 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!341121 lt!341122) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72719 (= lt!341122 (remainingBits!0 ((_ sign_extend 32) (size!4655 (buf!5190 (_2!9889 lt!340215)))) ((_ sign_extend 32) (currentByte!9768 (_2!9889 lt!340215))) ((_ sign_extend 32) (currentBit!9763 (_2!9889 lt!340215)))))))

(declare-fun lt!341123 () (_ BitVec 64))

(declare-fun lt!341124 () (_ BitVec 64))

(assert (=> d!72719 (= lt!341121 (bvmul lt!341123 lt!341124))))

(assert (=> d!72719 (or (= lt!341123 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!341124 (bvsdiv (bvmul lt!341123 lt!341124) lt!341123)))))

(assert (=> d!72719 (= lt!341124 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!72719 (= lt!341123 ((_ sign_extend 32) (size!4655 (buf!5190 (_2!9889 lt!340215)))))))

(assert (=> d!72719 (= lt!341120 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9768 (_2!9889 lt!340215))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9763 (_2!9889 lt!340215)))))))

(assert (=> d!72719 (invariant!0 (currentBit!9763 (_2!9889 lt!340215)) (currentByte!9768 (_2!9889 lt!340215)) (size!4655 (buf!5190 (_2!9889 lt!340215))))))

(assert (=> d!72719 (= (bitIndex!0 (size!4655 (buf!5190 (_2!9889 lt!340215))) (currentByte!9768 (_2!9889 lt!340215)) (currentBit!9763 (_2!9889 lt!340215))) lt!341120)))

(declare-fun b!215842 () Bool)

(declare-fun res!181593 () Bool)

(assert (=> b!215842 (=> (not res!181593) (not e!146819))))

(assert (=> b!215842 (= res!181593 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!341120))))

(declare-fun b!215843 () Bool)

(declare-fun lt!341119 () (_ BitVec 64))

(assert (=> b!215843 (= e!146819 (bvsle lt!341120 (bvmul lt!341119 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!215843 (or (= lt!341119 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!341119 #b0000000000000000000000000000000000000000000000000000000000001000) lt!341119)))))

(assert (=> b!215843 (= lt!341119 ((_ sign_extend 32) (size!4655 (buf!5190 (_2!9889 lt!340215)))))))

(assert (= (and d!72719 res!181594) b!215842))

(assert (= (and b!215842 res!181593) b!215843))

(declare-fun m!332447 () Bool)

(assert (=> d!72719 m!332447))

(declare-fun m!332449 () Bool)

(assert (=> d!72719 m!332449))

(assert (=> b!215483 d!72719))

(check-sat (not b!215823) (not d!72543) (not b!215615) (not b!215837) (not d!72517) (not b!215838) (not b!215568) (not b!215822) (not b!215595) (not d!72513) (not b!215571) (not b!215606) (not d!72551) (not d!72549) (not b!215839) (not d!72523) (not b!215569) (not d!72715) (not b!215619) (not d!72505) (not d!72535) (not d!72527) (not d!72479) (not b!215826) (not d!72521) (not d!72519) (not b!215813) (not b!215596) (not d!72487) (not d!72539) (not d!72509) (not b!215602) (not d!72515) (not d!72503) (not d!72545) (not b!215605) (not bm!3360) (not d!72533) (not b!215815) (not b!215566) (not b!215811) (not d!72717) (not d!72489) (not d!72719) (not b!215836) (not d!72525) (not b!215592) (not d!72529) (not d!72495) (not b!215603) (not d!72507) (not d!72491) (not b!215821) (not d!72531) (not d!72511) (not b!215819) (not b!215621) (not b!215820) (not d!72497) (not b!215818) (not d!72485) (not b!215593))
(check-sat)
(get-model)

(assert (=> b!215569 d!72529))

(assert (=> b!215569 d!72545))

(declare-fun b!215952 () Bool)

(declare-fun e!146885 () Bool)

(declare-fun lt!341465 () tuple2!18472)

(declare-fun _$19!171 () tuple2!18466)

(assert (=> b!215952 (= e!146885 (= (bitIndex!0 (size!4655 (buf!5190 (_1!9891 lt!341465))) (currentByte!9768 (_1!9891 lt!341465)) (currentBit!9763 (_1!9891 lt!341465))) (bitIndex!0 (size!4655 (buf!5190 (_2!9888 _$19!171))) (currentByte!9768 (_2!9888 _$19!171)) (currentBit!9763 (_2!9888 _$19!171)))))))

(declare-fun b!215953 () Bool)

(declare-fun e!146884 () Bool)

(assert (=> b!215953 (= e!146884 e!146885)))

(declare-fun res!181677 () Bool)

(assert (=> b!215953 (=> (not res!181677) (not e!146885))))

(assert (=> b!215953 (= res!181677 (and (= (_2!9891 lt!341465) lt!340224) (= (_1!9891 lt!341465) (_2!9888 _$19!171))))))

(assert (=> b!215953 (= lt!341465 (readBitPure!0 (readerFrom!0 (_2!9888 _$19!171) (currentBit!9763 thiss!1204) (currentByte!9768 thiss!1204))))))

(declare-fun b!215954 () Bool)

(declare-fun res!181679 () Bool)

(assert (=> b!215954 (=> (not res!181679) (not e!146884))))

(assert (=> b!215954 (= res!181679 (isPrefixOf!0 thiss!1204 (_2!9888 _$19!171)))))

(declare-fun b!215955 () Bool)

(declare-fun res!181678 () Bool)

(assert (=> b!215955 (=> (not res!181678) (not e!146884))))

(assert (=> b!215955 (= res!181678 (= (bitIndex!0 (size!4655 (buf!5190 (_2!9888 _$19!171))) (currentByte!9768 (_2!9888 _$19!171)) (currentBit!9763 (_2!9888 _$19!171))) (bvadd (bitIndex!0 (size!4655 (buf!5190 thiss!1204)) (currentByte!9768 thiss!1204) (currentBit!9763 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!215956 () Bool)

(declare-fun e!146883 () Bool)

(assert (=> b!215956 (= e!146883 (array_inv!4396 (buf!5190 (_2!9888 _$19!171))))))

(declare-fun d!72727 () Bool)

(assert (=> d!72727 e!146884))

(declare-fun res!181676 () Bool)

(assert (=> d!72727 (=> (not res!181676) (not e!146884))))

(assert (=> d!72727 (= res!181676 (= (size!4655 (buf!5190 thiss!1204)) (size!4655 (buf!5190 (_2!9888 _$19!171)))))))

(assert (=> d!72727 (and (inv!12 (_2!9888 _$19!171)) e!146883)))

(assert (=> d!72727 (= (choose!16 thiss!1204 lt!340224) _$19!171)))

(assert (= d!72727 b!215956))

(assert (= (and d!72727 res!181676) b!215955))

(assert (= (and b!215955 res!181678) b!215954))

(assert (= (and b!215954 res!181679) b!215953))

(assert (= (and b!215953 res!181677) b!215952))

(declare-fun m!332637 () Bool)

(assert (=> b!215952 m!332637))

(declare-fun m!332639 () Bool)

(assert (=> b!215952 m!332639))

(declare-fun m!332641 () Bool)

(assert (=> b!215954 m!332641))

(assert (=> b!215955 m!332639))

(assert (=> b!215955 m!331715))

(declare-fun m!332643 () Bool)

(assert (=> d!72727 m!332643))

(declare-fun m!332645 () Bool)

(assert (=> b!215953 m!332645))

(assert (=> b!215953 m!332645))

(declare-fun m!332647 () Bool)

(assert (=> b!215953 m!332647))

(declare-fun m!332649 () Bool)

(assert (=> b!215956 m!332649))

(assert (=> d!72715 d!72727))

(declare-fun d!72729 () Bool)

(assert (=> d!72729 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!4655 (buf!5190 thiss!1204))) ((_ sign_extend 32) (currentByte!9768 thiss!1204)) ((_ sign_extend 32) (currentBit!9763 thiss!1204))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4655 (buf!5190 thiss!1204))) ((_ sign_extend 32) (currentByte!9768 thiss!1204)) ((_ sign_extend 32) (currentBit!9763 thiss!1204))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!17832 () Bool)

(assert (= bs!17832 d!72729))

(assert (=> bs!17832 m!331905))

(assert (=> d!72715 d!72729))

(declare-fun d!72731 () Bool)

(assert (=> d!72731 (= (remainingBits!0 ((_ sign_extend 32) (size!4655 (buf!5190 (_1!9891 lt!340234)))) ((_ sign_extend 32) (currentByte!9768 (_1!9891 lt!340234))) ((_ sign_extend 32) (currentBit!9763 (_1!9891 lt!340234)))) (bvsub (bvmul ((_ sign_extend 32) (size!4655 (buf!5190 (_1!9891 lt!340234)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9768 (_1!9891 lt!340234))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9763 (_1!9891 lt!340234))))))))

(assert (=> d!72525 d!72731))

(declare-fun d!72733 () Bool)

(assert (=> d!72733 (= (invariant!0 (currentBit!9763 (_1!9891 lt!340234)) (currentByte!9768 (_1!9891 lt!340234)) (size!4655 (buf!5190 (_1!9891 lt!340234)))) (and (bvsge (currentBit!9763 (_1!9891 lt!340234)) #b00000000000000000000000000000000) (bvslt (currentBit!9763 (_1!9891 lt!340234)) #b00000000000000000000000000001000) (bvsge (currentByte!9768 (_1!9891 lt!340234)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9768 (_1!9891 lt!340234)) (size!4655 (buf!5190 (_1!9891 lt!340234)))) (and (= (currentBit!9763 (_1!9891 lt!340234)) #b00000000000000000000000000000000) (= (currentByte!9768 (_1!9891 lt!340234)) (size!4655 (buf!5190 (_1!9891 lt!340234))))))))))

(assert (=> d!72525 d!72733))

(assert (=> b!215606 d!72531))

(declare-fun d!72735 () Bool)

(assert (=> d!72735 (arrayBitRangesEq!0 (buf!5190 (_2!9888 lt!340213)) (buf!5190 thiss!1204) lt!340472 lt!340464)))

(declare-fun lt!341468 () Unit!15294)

(declare-fun choose!8 (array!10597 array!10597 (_ BitVec 64) (_ BitVec 64)) Unit!15294)

(assert (=> d!72735 (= lt!341468 (choose!8 (buf!5190 thiss!1204) (buf!5190 (_2!9888 lt!340213)) lt!340472 lt!340464))))

(assert (=> d!72735 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!340472) (bvsle lt!340472 lt!340464))))

(assert (=> d!72735 (= (arrayBitRangesEqSymmetric!0 (buf!5190 thiss!1204) (buf!5190 (_2!9888 lt!340213)) lt!340472 lt!340464) lt!341468)))

(declare-fun bs!17833 () Bool)

(assert (= bs!17833 d!72735))

(assert (=> bs!17833 m!331953))

(declare-fun m!332651 () Bool)

(assert (=> bs!17833 m!332651))

(assert (=> b!215606 d!72735))

(declare-fun b!215971 () Bool)

(declare-fun e!146904 () Bool)

(declare-fun call!3372 () Bool)

(assert (=> b!215971 (= e!146904 call!3372)))

(declare-fun bm!3369 () Bool)

(declare-fun c!10541 () Bool)

(declare-fun lt!341477 () (_ BitVec 32))

(declare-fun lt!341475 () (_ BitVec 32))

(declare-datatypes ((tuple4!278 0))(
  ( (tuple4!279 (_1!9902 (_ BitVec 32)) (_2!9902 (_ BitVec 32)) (_3!655 (_ BitVec 32)) (_4!139 (_ BitVec 32))) )
))
(declare-fun lt!341476 () tuple4!278)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!3369 (= call!3372 (byteRangesEq!0 (ite c!10541 (select (arr!5585 (buf!5190 (_2!9888 lt!340213))) (_3!655 lt!341476)) (select (arr!5585 (buf!5190 (_2!9888 lt!340213))) (_4!139 lt!341476))) (ite c!10541 (select (arr!5585 (buf!5190 thiss!1204)) (_3!655 lt!341476)) (select (arr!5585 (buf!5190 thiss!1204)) (_4!139 lt!341476))) (ite c!10541 lt!341475 #b00000000000000000000000000000000) lt!341477))))

(declare-fun b!215972 () Bool)

(declare-fun e!146902 () Bool)

(assert (=> b!215972 (= e!146902 call!3372)))

(declare-fun b!215973 () Bool)

(declare-fun e!146900 () Bool)

(assert (=> b!215973 (= e!146904 e!146900)))

(declare-fun res!181690 () Bool)

(assert (=> b!215973 (= res!181690 (byteRangesEq!0 (select (arr!5585 (buf!5190 (_2!9888 lt!340213))) (_3!655 lt!341476)) (select (arr!5585 (buf!5190 thiss!1204)) (_3!655 lt!341476)) lt!341475 #b00000000000000000000000000001000))))

(assert (=> b!215973 (=> (not res!181690) (not e!146900))))

(declare-fun d!72737 () Bool)

(declare-fun res!181694 () Bool)

(declare-fun e!146901 () Bool)

(assert (=> d!72737 (=> res!181694 e!146901)))

(assert (=> d!72737 (= res!181694 (bvsge lt!340472 lt!340464))))

(assert (=> d!72737 (= (arrayBitRangesEq!0 (buf!5190 (_2!9888 lt!340213)) (buf!5190 thiss!1204) lt!340472 lt!340464) e!146901)))

(declare-fun b!215974 () Bool)

(declare-fun e!146899 () Bool)

(assert (=> b!215974 (= e!146901 e!146899)))

(declare-fun res!181692 () Bool)

(assert (=> b!215974 (=> (not res!181692) (not e!146899))))

(declare-fun e!146903 () Bool)

(assert (=> b!215974 (= res!181692 e!146903)))

(declare-fun res!181693 () Bool)

(assert (=> b!215974 (=> res!181693 e!146903)))

(assert (=> b!215974 (= res!181693 (bvsge (_1!9902 lt!341476) (_2!9902 lt!341476)))))

(assert (=> b!215974 (= lt!341477 ((_ extract 31 0) (bvsrem lt!340464 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!215974 (= lt!341475 ((_ extract 31 0) (bvsrem lt!340472 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!278)

(assert (=> b!215974 (= lt!341476 (arrayBitIndices!0 lt!340472 lt!340464))))

(declare-fun b!215975 () Bool)

(declare-fun res!181691 () Bool)

(assert (=> b!215975 (= res!181691 (= lt!341477 #b00000000000000000000000000000000))))

(assert (=> b!215975 (=> res!181691 e!146902)))

(assert (=> b!215975 (= e!146900 e!146902)))

(declare-fun b!215976 () Bool)

(declare-fun arrayRangesEq!701 (array!10597 array!10597 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!215976 (= e!146903 (arrayRangesEq!701 (buf!5190 (_2!9888 lt!340213)) (buf!5190 thiss!1204) (_1!9902 lt!341476) (_2!9902 lt!341476)))))

(declare-fun b!215977 () Bool)

(assert (=> b!215977 (= e!146899 e!146904)))

(assert (=> b!215977 (= c!10541 (= (_3!655 lt!341476) (_4!139 lt!341476)))))

(assert (= (and d!72737 (not res!181694)) b!215974))

(assert (= (and b!215974 (not res!181693)) b!215976))

(assert (= (and b!215974 res!181692) b!215977))

(assert (= (and b!215977 c!10541) b!215971))

(assert (= (and b!215977 (not c!10541)) b!215973))

(assert (= (and b!215973 res!181690) b!215975))

(assert (= (and b!215975 (not res!181691)) b!215972))

(assert (= (or b!215971 b!215972) bm!3369))

(declare-fun m!332653 () Bool)

(assert (=> bm!3369 m!332653))

(declare-fun m!332655 () Bool)

(assert (=> bm!3369 m!332655))

(declare-fun m!332657 () Bool)

(assert (=> bm!3369 m!332657))

(declare-fun m!332659 () Bool)

(assert (=> bm!3369 m!332659))

(declare-fun m!332661 () Bool)

(assert (=> bm!3369 m!332661))

(assert (=> b!215973 m!332655))

(assert (=> b!215973 m!332657))

(assert (=> b!215973 m!332655))

(assert (=> b!215973 m!332657))

(declare-fun m!332663 () Bool)

(assert (=> b!215973 m!332663))

(declare-fun m!332665 () Bool)

(assert (=> b!215974 m!332665))

(declare-fun m!332667 () Bool)

(assert (=> b!215976 m!332667))

(assert (=> b!215606 d!72737))

(declare-fun d!72739 () Bool)

(declare-fun e!146911 () Bool)

(assert (=> d!72739 e!146911))

(declare-fun res!181697 () Bool)

(assert (=> d!72739 (=> (not res!181697) (not e!146911))))

(declare-fun increaseBitIndex!0 (BitStream!8418) tuple2!18466)

(assert (=> d!72739 (= res!181697 (= (buf!5190 (_2!9888 (increaseBitIndex!0 (BitStream!8419 (buf!5190 (_2!9888 lt!340213)) (currentByte!9768 thiss!1204) (currentBit!9763 thiss!1204))))) (buf!5190 (BitStream!8419 (buf!5190 (_2!9888 lt!340213)) (currentByte!9768 thiss!1204) (currentBit!9763 thiss!1204)))))))

(declare-fun lt!341494 () Bool)

(assert (=> d!72739 (= lt!341494 (not (= (bvand ((_ sign_extend 24) (select (arr!5585 (buf!5190 (BitStream!8419 (buf!5190 (_2!9888 lt!340213)) (currentByte!9768 thiss!1204) (currentBit!9763 thiss!1204)))) (currentByte!9768 (BitStream!8419 (buf!5190 (_2!9888 lt!340213)) (currentByte!9768 thiss!1204) (currentBit!9763 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9763 (BitStream!8419 (buf!5190 (_2!9888 lt!340213)) (currentByte!9768 thiss!1204) (currentBit!9763 thiss!1204)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!341493 () tuple2!18484)

(assert (=> d!72739 (= lt!341493 (tuple2!18485 (not (= (bvand ((_ sign_extend 24) (select (arr!5585 (buf!5190 (BitStream!8419 (buf!5190 (_2!9888 lt!340213)) (currentByte!9768 thiss!1204) (currentBit!9763 thiss!1204)))) (currentByte!9768 (BitStream!8419 (buf!5190 (_2!9888 lt!340213)) (currentByte!9768 thiss!1204) (currentBit!9763 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9763 (BitStream!8419 (buf!5190 (_2!9888 lt!340213)) (currentByte!9768 thiss!1204) (currentBit!9763 thiss!1204)))))) #b00000000000000000000000000000000)) (_2!9888 (increaseBitIndex!0 (BitStream!8419 (buf!5190 (_2!9888 lt!340213)) (currentByte!9768 thiss!1204) (currentBit!9763 thiss!1204))))))))

(assert (=> d!72739 (validate_offset_bit!0 ((_ sign_extend 32) (size!4655 (buf!5190 (BitStream!8419 (buf!5190 (_2!9888 lt!340213)) (currentByte!9768 thiss!1204) (currentBit!9763 thiss!1204))))) ((_ sign_extend 32) (currentByte!9768 (BitStream!8419 (buf!5190 (_2!9888 lt!340213)) (currentByte!9768 thiss!1204) (currentBit!9763 thiss!1204)))) ((_ sign_extend 32) (currentBit!9763 (BitStream!8419 (buf!5190 (_2!9888 lt!340213)) (currentByte!9768 thiss!1204) (currentBit!9763 thiss!1204)))))))

(assert (=> d!72739 (= (readBit!0 (BitStream!8419 (buf!5190 (_2!9888 lt!340213)) (currentByte!9768 thiss!1204) (currentBit!9763 thiss!1204))) lt!341493)))

(declare-fun b!215980 () Bool)

(declare-fun lt!341498 () (_ BitVec 64))

(declare-fun lt!341497 () (_ BitVec 64))

(assert (=> b!215980 (= e!146911 (= (bitIndex!0 (size!4655 (buf!5190 (_2!9888 (increaseBitIndex!0 (BitStream!8419 (buf!5190 (_2!9888 lt!340213)) (currentByte!9768 thiss!1204) (currentBit!9763 thiss!1204)))))) (currentByte!9768 (_2!9888 (increaseBitIndex!0 (BitStream!8419 (buf!5190 (_2!9888 lt!340213)) (currentByte!9768 thiss!1204) (currentBit!9763 thiss!1204))))) (currentBit!9763 (_2!9888 (increaseBitIndex!0 (BitStream!8419 (buf!5190 (_2!9888 lt!340213)) (currentByte!9768 thiss!1204) (currentBit!9763 thiss!1204)))))) (bvadd lt!341498 lt!341497)))))

(assert (=> b!215980 (or (not (= (bvand lt!341498 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!341497 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!341498 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!341498 lt!341497) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!215980 (= lt!341497 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!215980 (= lt!341498 (bitIndex!0 (size!4655 (buf!5190 (BitStream!8419 (buf!5190 (_2!9888 lt!340213)) (currentByte!9768 thiss!1204) (currentBit!9763 thiss!1204)))) (currentByte!9768 (BitStream!8419 (buf!5190 (_2!9888 lt!340213)) (currentByte!9768 thiss!1204) (currentBit!9763 thiss!1204))) (currentBit!9763 (BitStream!8419 (buf!5190 (_2!9888 lt!340213)) (currentByte!9768 thiss!1204) (currentBit!9763 thiss!1204)))))))

(declare-fun lt!341496 () Bool)

(assert (=> b!215980 (= lt!341496 (not (= (bvand ((_ sign_extend 24) (select (arr!5585 (buf!5190 (BitStream!8419 (buf!5190 (_2!9888 lt!340213)) (currentByte!9768 thiss!1204) (currentBit!9763 thiss!1204)))) (currentByte!9768 (BitStream!8419 (buf!5190 (_2!9888 lt!340213)) (currentByte!9768 thiss!1204) (currentBit!9763 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9763 (BitStream!8419 (buf!5190 (_2!9888 lt!340213)) (currentByte!9768 thiss!1204) (currentBit!9763 thiss!1204)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!341495 () Bool)

(assert (=> b!215980 (= lt!341495 (not (= (bvand ((_ sign_extend 24) (select (arr!5585 (buf!5190 (BitStream!8419 (buf!5190 (_2!9888 lt!340213)) (currentByte!9768 thiss!1204) (currentBit!9763 thiss!1204)))) (currentByte!9768 (BitStream!8419 (buf!5190 (_2!9888 lt!340213)) (currentByte!9768 thiss!1204) (currentBit!9763 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9763 (BitStream!8419 (buf!5190 (_2!9888 lt!340213)) (currentByte!9768 thiss!1204) (currentBit!9763 thiss!1204)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!341492 () Bool)

(assert (=> b!215980 (= lt!341492 (not (= (bvand ((_ sign_extend 24) (select (arr!5585 (buf!5190 (BitStream!8419 (buf!5190 (_2!9888 lt!340213)) (currentByte!9768 thiss!1204) (currentBit!9763 thiss!1204)))) (currentByte!9768 (BitStream!8419 (buf!5190 (_2!9888 lt!340213)) (currentByte!9768 thiss!1204) (currentBit!9763 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9763 (BitStream!8419 (buf!5190 (_2!9888 lt!340213)) (currentByte!9768 thiss!1204) (currentBit!9763 thiss!1204)))))) #b00000000000000000000000000000000)))))

(assert (= (and d!72739 res!181697) b!215980))

(declare-fun m!332669 () Bool)

(assert (=> d!72739 m!332669))

(declare-fun m!332671 () Bool)

(assert (=> d!72739 m!332671))

(declare-fun m!332673 () Bool)

(assert (=> d!72739 m!332673))

(declare-fun m!332675 () Bool)

(assert (=> d!72739 m!332675))

(assert (=> b!215980 m!332671))

(assert (=> b!215980 m!332669))

(declare-fun m!332677 () Bool)

(assert (=> b!215980 m!332677))

(assert (=> b!215980 m!332673))

(declare-fun m!332679 () Bool)

(assert (=> b!215980 m!332679))

(assert (=> d!72519 d!72739))

(declare-fun d!72741 () Bool)

(assert (=> d!72741 (= (remainingBits!0 ((_ sign_extend 32) (size!4655 (buf!5190 thiss!1204))) ((_ sign_extend 32) (currentByte!9768 thiss!1204)) ((_ sign_extend 32) (currentBit!9763 thiss!1204))) (bvsub (bvmul ((_ sign_extend 32) (size!4655 (buf!5190 thiss!1204))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9768 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9763 thiss!1204)))))))

(assert (=> d!72531 d!72741))

(assert (=> d!72531 d!72493))

(assert (=> d!72527 d!72511))

(declare-fun d!72743 () Bool)

(assert (=> d!72743 (validate_offset_bits!1 ((_ sign_extend 32) (size!4655 (buf!5190 (_2!9888 lt!340213)))) ((_ sign_extend 32) (currentByte!9768 (_2!9888 lt!340226))) ((_ sign_extend 32) (currentBit!9763 (_2!9888 lt!340226))) lt!340218)))

(assert (=> d!72743 true))

(declare-fun _$6!390 () Unit!15294)

(assert (=> d!72743 (= (choose!9 (_2!9888 lt!340226) (buf!5190 (_2!9888 lt!340213)) lt!340218 (BitStream!8419 (buf!5190 (_2!9888 lt!340213)) (currentByte!9768 (_2!9888 lt!340226)) (currentBit!9763 (_2!9888 lt!340226)))) _$6!390)))

(declare-fun bs!17834 () Bool)

(assert (= bs!17834 d!72743))

(assert (=> bs!17834 m!331727))

(assert (=> d!72527 d!72743))

(declare-fun d!72745 () Bool)

(declare-fun res!181698 () Bool)

(declare-fun e!146912 () Bool)

(assert (=> d!72745 (=> (not res!181698) (not e!146912))))

(assert (=> d!72745 (= res!181698 (= (size!4655 (buf!5190 (_2!9889 lt!340460))) (size!4655 (buf!5190 (_2!9888 lt!340213)))))))

(assert (=> d!72745 (= (isPrefixOf!0 (_2!9889 lt!340460) (_2!9888 lt!340213)) e!146912)))

(declare-fun b!215981 () Bool)

(declare-fun res!181700 () Bool)

(assert (=> b!215981 (=> (not res!181700) (not e!146912))))

(assert (=> b!215981 (= res!181700 (bvsle (bitIndex!0 (size!4655 (buf!5190 (_2!9889 lt!340460))) (currentByte!9768 (_2!9889 lt!340460)) (currentBit!9763 (_2!9889 lt!340460))) (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!340213))) (currentByte!9768 (_2!9888 lt!340213)) (currentBit!9763 (_2!9888 lt!340213)))))))

(declare-fun b!215982 () Bool)

(declare-fun e!146913 () Bool)

(assert (=> b!215982 (= e!146912 e!146913)))

(declare-fun res!181699 () Bool)

(assert (=> b!215982 (=> res!181699 e!146913)))

(assert (=> b!215982 (= res!181699 (= (size!4655 (buf!5190 (_2!9889 lt!340460))) #b00000000000000000000000000000000))))

(declare-fun b!215983 () Bool)

(assert (=> b!215983 (= e!146913 (arrayBitRangesEq!0 (buf!5190 (_2!9889 lt!340460)) (buf!5190 (_2!9888 lt!340213)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4655 (buf!5190 (_2!9889 lt!340460))) (currentByte!9768 (_2!9889 lt!340460)) (currentBit!9763 (_2!9889 lt!340460)))))))

(assert (= (and d!72745 res!181698) b!215981))

(assert (= (and b!215981 res!181700) b!215982))

(assert (= (and b!215982 (not res!181699)) b!215983))

(declare-fun m!332681 () Bool)

(assert (=> b!215981 m!332681))

(assert (=> b!215981 m!331763))

(assert (=> b!215983 m!332681))

(assert (=> b!215983 m!332681))

(declare-fun m!332683 () Bool)

(assert (=> b!215983 m!332683))

(assert (=> b!215602 d!72745))

(declare-fun d!72747 () Bool)

(assert (=> d!72747 (= (invariant!0 (currentBit!9763 (_2!9888 lt!340226)) (currentByte!9768 (_2!9888 lt!340226)) (size!4655 (buf!5190 (_2!9888 lt!340226)))) (and (bvsge (currentBit!9763 (_2!9888 lt!340226)) #b00000000000000000000000000000000) (bvslt (currentBit!9763 (_2!9888 lt!340226)) #b00000000000000000000000000001000) (bvsge (currentByte!9768 (_2!9888 lt!340226)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9768 (_2!9888 lt!340226)) (size!4655 (buf!5190 (_2!9888 lt!340226)))) (and (= (currentBit!9763 (_2!9888 lt!340226)) #b00000000000000000000000000000000) (= (currentByte!9768 (_2!9888 lt!340226)) (size!4655 (buf!5190 (_2!9888 lt!340226))))))))))

(assert (=> d!72535 d!72747))

(declare-fun d!72749 () Bool)

(declare-fun res!181701 () Bool)

(declare-fun e!146914 () Bool)

(assert (=> d!72749 (=> (not res!181701) (not e!146914))))

(assert (=> d!72749 (= res!181701 (= (size!4655 (buf!5190 (_2!9888 lt!340213))) (size!4655 (buf!5190 (_2!9888 lt!340213)))))))

(assert (=> d!72749 (= (isPrefixOf!0 (_2!9888 lt!340213) (_2!9888 lt!340213)) e!146914)))

(declare-fun b!215984 () Bool)

(declare-fun res!181703 () Bool)

(assert (=> b!215984 (=> (not res!181703) (not e!146914))))

(assert (=> b!215984 (= res!181703 (bvsle (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!340213))) (currentByte!9768 (_2!9888 lt!340213)) (currentBit!9763 (_2!9888 lt!340213))) (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!340213))) (currentByte!9768 (_2!9888 lt!340213)) (currentBit!9763 (_2!9888 lt!340213)))))))

(declare-fun b!215985 () Bool)

(declare-fun e!146915 () Bool)

(assert (=> b!215985 (= e!146914 e!146915)))

(declare-fun res!181702 () Bool)

(assert (=> b!215985 (=> res!181702 e!146915)))

(assert (=> b!215985 (= res!181702 (= (size!4655 (buf!5190 (_2!9888 lt!340213))) #b00000000000000000000000000000000))))

(declare-fun b!215986 () Bool)

(assert (=> b!215986 (= e!146915 (arrayBitRangesEq!0 (buf!5190 (_2!9888 lt!340213)) (buf!5190 (_2!9888 lt!340213)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!340213))) (currentByte!9768 (_2!9888 lt!340213)) (currentBit!9763 (_2!9888 lt!340213)))))))

(assert (= (and d!72749 res!181701) b!215984))

(assert (= (and b!215984 res!181703) b!215985))

(assert (= (and b!215985 (not res!181702)) b!215986))

(assert (=> b!215984 m!331763))

(assert (=> b!215984 m!331763))

(assert (=> b!215986 m!331763))

(assert (=> b!215986 m!331763))

(declare-fun m!332685 () Bool)

(assert (=> b!215986 m!332685))

(assert (=> d!72497 d!72749))

(declare-fun d!72751 () Bool)

(declare-fun res!181704 () Bool)

(declare-fun e!146916 () Bool)

(assert (=> d!72751 (=> (not res!181704) (not e!146916))))

(assert (=> d!72751 (= res!181704 (= (size!4655 (buf!5190 lt!340419)) (size!4655 (buf!5190 (_2!9888 lt!340213)))))))

(assert (=> d!72751 (= (isPrefixOf!0 lt!340419 (_2!9888 lt!340213)) e!146916)))

(declare-fun b!215987 () Bool)

(declare-fun res!181706 () Bool)

(assert (=> b!215987 (=> (not res!181706) (not e!146916))))

(assert (=> b!215987 (= res!181706 (bvsle (bitIndex!0 (size!4655 (buf!5190 lt!340419)) (currentByte!9768 lt!340419) (currentBit!9763 lt!340419)) (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!340213))) (currentByte!9768 (_2!9888 lt!340213)) (currentBit!9763 (_2!9888 lt!340213)))))))

(declare-fun b!215988 () Bool)

(declare-fun e!146917 () Bool)

(assert (=> b!215988 (= e!146916 e!146917)))

(declare-fun res!181705 () Bool)

(assert (=> b!215988 (=> res!181705 e!146917)))

(assert (=> b!215988 (= res!181705 (= (size!4655 (buf!5190 lt!340419)) #b00000000000000000000000000000000))))

(declare-fun b!215989 () Bool)

(assert (=> b!215989 (= e!146917 (arrayBitRangesEq!0 (buf!5190 lt!340419) (buf!5190 (_2!9888 lt!340213)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4655 (buf!5190 lt!340419)) (currentByte!9768 lt!340419) (currentBit!9763 lt!340419))))))

(assert (= (and d!72751 res!181704) b!215987))

(assert (= (and b!215987 res!181706) b!215988))

(assert (= (and b!215988 (not res!181705)) b!215989))

(declare-fun m!332687 () Bool)

(assert (=> b!215987 m!332687))

(assert (=> b!215987 m!331763))

(assert (=> b!215989 m!332687))

(assert (=> b!215989 m!332687))

(declare-fun m!332689 () Bool)

(assert (=> b!215989 m!332689))

(assert (=> d!72497 d!72751))

(declare-fun d!72753 () Bool)

(declare-fun res!181707 () Bool)

(declare-fun e!146918 () Bool)

(assert (=> d!72753 (=> (not res!181707) (not e!146918))))

(assert (=> d!72753 (= res!181707 (= (size!4655 (buf!5190 lt!340419)) (size!4655 (buf!5190 lt!340419))))))

(assert (=> d!72753 (= (isPrefixOf!0 lt!340419 lt!340419) e!146918)))

(declare-fun b!215990 () Bool)

(declare-fun res!181709 () Bool)

(assert (=> b!215990 (=> (not res!181709) (not e!146918))))

(assert (=> b!215990 (= res!181709 (bvsle (bitIndex!0 (size!4655 (buf!5190 lt!340419)) (currentByte!9768 lt!340419) (currentBit!9763 lt!340419)) (bitIndex!0 (size!4655 (buf!5190 lt!340419)) (currentByte!9768 lt!340419) (currentBit!9763 lt!340419))))))

(declare-fun b!215991 () Bool)

(declare-fun e!146919 () Bool)

(assert (=> b!215991 (= e!146918 e!146919)))

(declare-fun res!181708 () Bool)

(assert (=> b!215991 (=> res!181708 e!146919)))

(assert (=> b!215991 (= res!181708 (= (size!4655 (buf!5190 lt!340419)) #b00000000000000000000000000000000))))

(declare-fun b!215992 () Bool)

(assert (=> b!215992 (= e!146919 (arrayBitRangesEq!0 (buf!5190 lt!340419) (buf!5190 lt!340419) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4655 (buf!5190 lt!340419)) (currentByte!9768 lt!340419) (currentBit!9763 lt!340419))))))

(assert (= (and d!72753 res!181707) b!215990))

(assert (= (and b!215990 res!181709) b!215991))

(assert (= (and b!215991 (not res!181708)) b!215992))

(assert (=> b!215990 m!332687))

(assert (=> b!215990 m!332687))

(assert (=> b!215992 m!332687))

(assert (=> b!215992 m!332687))

(declare-fun m!332691 () Bool)

(assert (=> b!215992 m!332691))

(assert (=> d!72497 d!72753))

(declare-fun d!72755 () Bool)

(assert (=> d!72755 (isPrefixOf!0 (_2!9888 lt!340226) (_2!9888 lt!340226))))

(declare-fun lt!341501 () Unit!15294)

(declare-fun choose!11 (BitStream!8418) Unit!15294)

(assert (=> d!72755 (= lt!341501 (choose!11 (_2!9888 lt!340226)))))

(assert (=> d!72755 (= (lemmaIsPrefixRefl!0 (_2!9888 lt!340226)) lt!341501)))

(declare-fun bs!17836 () Bool)

(assert (= bs!17836 d!72755))

(assert (=> bs!17836 m!331927))

(declare-fun m!332693 () Bool)

(assert (=> bs!17836 m!332693))

(assert (=> d!72497 d!72755))

(assert (=> d!72497 d!72477))

(declare-fun d!72757 () Bool)

(assert (=> d!72757 (isPrefixOf!0 lt!340419 (_2!9888 lt!340213))))

(declare-fun lt!341502 () Unit!15294)

(assert (=> d!72757 (= lt!341502 (choose!30 lt!340419 (_2!9888 lt!340213) (_2!9888 lt!340213)))))

(assert (=> d!72757 (isPrefixOf!0 lt!340419 (_2!9888 lt!340213))))

(assert (=> d!72757 (= (lemmaIsPrefixTransitive!0 lt!340419 (_2!9888 lt!340213) (_2!9888 lt!340213)) lt!341502)))

(declare-fun bs!17837 () Bool)

(assert (= bs!17837 d!72757))

(assert (=> bs!17837 m!331923))

(declare-fun m!332695 () Bool)

(assert (=> bs!17837 m!332695))

(assert (=> bs!17837 m!331923))

(assert (=> d!72497 d!72757))

(declare-fun d!72759 () Bool)

(declare-fun res!181710 () Bool)

(declare-fun e!146920 () Bool)

(assert (=> d!72759 (=> (not res!181710) (not e!146920))))

(assert (=> d!72759 (= res!181710 (= (size!4655 (buf!5190 (_2!9888 lt!340226))) (size!4655 (buf!5190 (_2!9888 lt!340226)))))))

(assert (=> d!72759 (= (isPrefixOf!0 (_2!9888 lt!340226) (_2!9888 lt!340226)) e!146920)))

(declare-fun b!215993 () Bool)

(declare-fun res!181712 () Bool)

(assert (=> b!215993 (=> (not res!181712) (not e!146920))))

(assert (=> b!215993 (= res!181712 (bvsle (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!340226))) (currentByte!9768 (_2!9888 lt!340226)) (currentBit!9763 (_2!9888 lt!340226))) (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!340226))) (currentByte!9768 (_2!9888 lt!340226)) (currentBit!9763 (_2!9888 lt!340226)))))))

(declare-fun b!215994 () Bool)

(declare-fun e!146921 () Bool)

(assert (=> b!215994 (= e!146920 e!146921)))

(declare-fun res!181711 () Bool)

(assert (=> b!215994 (=> res!181711 e!146921)))

(assert (=> b!215994 (= res!181711 (= (size!4655 (buf!5190 (_2!9888 lt!340226))) #b00000000000000000000000000000000))))

(declare-fun b!215995 () Bool)

(assert (=> b!215995 (= e!146921 (arrayBitRangesEq!0 (buf!5190 (_2!9888 lt!340226)) (buf!5190 (_2!9888 lt!340226)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!340226))) (currentByte!9768 (_2!9888 lt!340226)) (currentBit!9763 (_2!9888 lt!340226)))))))

(assert (= (and d!72759 res!181710) b!215993))

(assert (= (and b!215993 res!181712) b!215994))

(assert (= (and b!215994 (not res!181711)) b!215995))

(assert (=> b!215993 m!331713))

(assert (=> b!215993 m!331713))

(assert (=> b!215995 m!331713))

(assert (=> b!215995 m!331713))

(declare-fun m!332697 () Bool)

(assert (=> b!215995 m!332697))

(assert (=> d!72497 d!72759))

(declare-fun d!72761 () Bool)

(assert (=> d!72761 (isPrefixOf!0 lt!340419 (_2!9888 lt!340213))))

(declare-fun lt!341503 () Unit!15294)

(assert (=> d!72761 (= lt!341503 (choose!30 lt!340419 (_2!9888 lt!340226) (_2!9888 lt!340213)))))

(assert (=> d!72761 (isPrefixOf!0 lt!340419 (_2!9888 lt!340226))))

(assert (=> d!72761 (= (lemmaIsPrefixTransitive!0 lt!340419 (_2!9888 lt!340226) (_2!9888 lt!340213)) lt!341503)))

(declare-fun bs!17838 () Bool)

(assert (= bs!17838 d!72761))

(assert (=> bs!17838 m!331923))

(declare-fun m!332699 () Bool)

(assert (=> bs!17838 m!332699))

(declare-fun m!332701 () Bool)

(assert (=> bs!17838 m!332701))

(assert (=> d!72497 d!72761))

(declare-fun d!72763 () Bool)

(assert (=> d!72763 (isPrefixOf!0 (_2!9888 lt!340213) (_2!9888 lt!340213))))

(declare-fun lt!341504 () Unit!15294)

(assert (=> d!72763 (= lt!341504 (choose!11 (_2!9888 lt!340213)))))

(assert (=> d!72763 (= (lemmaIsPrefixRefl!0 (_2!9888 lt!340213)) lt!341504)))

(declare-fun bs!17839 () Bool)

(assert (= bs!17839 d!72763))

(assert (=> bs!17839 m!331925))

(declare-fun m!332703 () Bool)

(assert (=> bs!17839 m!332703))

(assert (=> d!72497 d!72763))

(declare-fun d!72765 () Bool)

(assert (=> d!72765 (isPrefixOf!0 lt!340419 lt!340419)))

(declare-fun lt!341505 () Unit!15294)

(assert (=> d!72765 (= lt!341505 (choose!11 lt!340419))))

(assert (=> d!72765 (= (lemmaIsPrefixRefl!0 lt!340419) lt!341505)))

(declare-fun bs!17840 () Bool)

(assert (= bs!17840 d!72765))

(assert (=> bs!17840 m!331929))

(declare-fun m!332705 () Bool)

(assert (=> bs!17840 m!332705))

(assert (=> d!72497 d!72765))

(declare-fun d!72767 () Bool)

(declare-fun res!181713 () Bool)

(declare-fun e!146922 () Bool)

(assert (=> d!72767 (=> (not res!181713) (not e!146922))))

(assert (=> d!72767 (= res!181713 (= (size!4655 (buf!5190 (_1!9889 lt!340422))) (size!4655 (buf!5190 (_2!9889 lt!340422)))))))

(assert (=> d!72767 (= (isPrefixOf!0 (_1!9889 lt!340422) (_2!9889 lt!340422)) e!146922)))

(declare-fun b!215996 () Bool)

(declare-fun res!181715 () Bool)

(assert (=> b!215996 (=> (not res!181715) (not e!146922))))

(assert (=> b!215996 (= res!181715 (bvsle (bitIndex!0 (size!4655 (buf!5190 (_1!9889 lt!340422))) (currentByte!9768 (_1!9889 lt!340422)) (currentBit!9763 (_1!9889 lt!340422))) (bitIndex!0 (size!4655 (buf!5190 (_2!9889 lt!340422))) (currentByte!9768 (_2!9889 lt!340422)) (currentBit!9763 (_2!9889 lt!340422)))))))

(declare-fun b!215997 () Bool)

(declare-fun e!146923 () Bool)

(assert (=> b!215997 (= e!146922 e!146923)))

(declare-fun res!181714 () Bool)

(assert (=> b!215997 (=> res!181714 e!146923)))

(assert (=> b!215997 (= res!181714 (= (size!4655 (buf!5190 (_1!9889 lt!340422))) #b00000000000000000000000000000000))))

(declare-fun b!215998 () Bool)

(assert (=> b!215998 (= e!146923 (arrayBitRangesEq!0 (buf!5190 (_1!9889 lt!340422)) (buf!5190 (_2!9889 lt!340422)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4655 (buf!5190 (_1!9889 lt!340422))) (currentByte!9768 (_1!9889 lt!340422)) (currentBit!9763 (_1!9889 lt!340422)))))))

(assert (= (and d!72767 res!181713) b!215996))

(assert (= (and b!215996 res!181715) b!215997))

(assert (= (and b!215997 (not res!181714)) b!215998))

(declare-fun m!332707 () Bool)

(assert (=> b!215996 m!332707))

(declare-fun m!332709 () Bool)

(assert (=> b!215996 m!332709))

(assert (=> b!215998 m!332707))

(assert (=> b!215998 m!332707))

(declare-fun m!332711 () Bool)

(assert (=> b!215998 m!332711))

(assert (=> d!72497 d!72767))

(declare-fun d!72769 () Bool)

(declare-fun lt!341506 () tuple2!18484)

(assert (=> d!72769 (= lt!341506 (readBit!0 (readerFrom!0 (_2!9888 lt!341070) (currentBit!9763 (_2!9888 lt!340226)) (currentByte!9768 (_2!9888 lt!340226)))))))

(assert (=> d!72769 (= (readBitPure!0 (readerFrom!0 (_2!9888 lt!341070) (currentBit!9763 (_2!9888 lt!340226)) (currentByte!9768 (_2!9888 lt!340226)))) (tuple2!18473 (_2!9897 lt!341506) (_1!9897 lt!341506)))))

(declare-fun bs!17841 () Bool)

(assert (= bs!17841 d!72769))

(assert (=> bs!17841 m!332423))

(declare-fun m!332713 () Bool)

(assert (=> bs!17841 m!332713))

(assert (=> b!215826 d!72769))

(declare-fun d!72771 () Bool)

(declare-fun e!146924 () Bool)

(assert (=> d!72771 e!146924))

(declare-fun res!181716 () Bool)

(assert (=> d!72771 (=> (not res!181716) (not e!146924))))

(assert (=> d!72771 (= res!181716 (invariant!0 (currentBit!9763 (_2!9888 lt!341070)) (currentByte!9768 (_2!9888 lt!341070)) (size!4655 (buf!5190 (_2!9888 lt!341070)))))))

(assert (=> d!72771 (= (readerFrom!0 (_2!9888 lt!341070) (currentBit!9763 (_2!9888 lt!340226)) (currentByte!9768 (_2!9888 lt!340226))) (BitStream!8419 (buf!5190 (_2!9888 lt!341070)) (currentByte!9768 (_2!9888 lt!340226)) (currentBit!9763 (_2!9888 lt!340226))))))

(declare-fun b!215999 () Bool)

(assert (=> b!215999 (= e!146924 (invariant!0 (currentBit!9763 (_2!9888 lt!340226)) (currentByte!9768 (_2!9888 lt!340226)) (size!4655 (buf!5190 (_2!9888 lt!341070)))))))

(assert (= (and d!72771 res!181716) b!215999))

(declare-fun m!332715 () Bool)

(assert (=> d!72771 m!332715))

(declare-fun m!332717 () Bool)

(assert (=> b!215999 m!332717))

(assert (=> b!215826 d!72771))

(declare-fun d!72773 () Bool)

(declare-fun e!146925 () Bool)

(assert (=> d!72773 e!146925))

(declare-fun res!181717 () Bool)

(assert (=> d!72773 (=> (not res!181717) (not e!146925))))

(assert (=> d!72773 (= res!181717 (= (buf!5190 (_2!9888 (increaseBitIndex!0 lt!340221))) (buf!5190 lt!340221)))))

(declare-fun lt!341509 () Bool)

(assert (=> d!72773 (= lt!341509 (not (= (bvand ((_ sign_extend 24) (select (arr!5585 (buf!5190 lt!340221)) (currentByte!9768 lt!340221))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9763 lt!340221)))) #b00000000000000000000000000000000)))))

(declare-fun lt!341508 () tuple2!18484)

(assert (=> d!72773 (= lt!341508 (tuple2!18485 (not (= (bvand ((_ sign_extend 24) (select (arr!5585 (buf!5190 lt!340221)) (currentByte!9768 lt!340221))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9763 lt!340221)))) #b00000000000000000000000000000000)) (_2!9888 (increaseBitIndex!0 lt!340221))))))

(assert (=> d!72773 (validate_offset_bit!0 ((_ sign_extend 32) (size!4655 (buf!5190 lt!340221))) ((_ sign_extend 32) (currentByte!9768 lt!340221)) ((_ sign_extend 32) (currentBit!9763 lt!340221)))))

(assert (=> d!72773 (= (readBit!0 lt!340221) lt!341508)))

(declare-fun lt!341513 () (_ BitVec 64))

(declare-fun b!216000 () Bool)

(declare-fun lt!341512 () (_ BitVec 64))

(assert (=> b!216000 (= e!146925 (= (bitIndex!0 (size!4655 (buf!5190 (_2!9888 (increaseBitIndex!0 lt!340221)))) (currentByte!9768 (_2!9888 (increaseBitIndex!0 lt!340221))) (currentBit!9763 (_2!9888 (increaseBitIndex!0 lt!340221)))) (bvadd lt!341513 lt!341512)))))

(assert (=> b!216000 (or (not (= (bvand lt!341513 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!341512 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!341513 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!341513 lt!341512) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!216000 (= lt!341512 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!216000 (= lt!341513 (bitIndex!0 (size!4655 (buf!5190 lt!340221)) (currentByte!9768 lt!340221) (currentBit!9763 lt!340221)))))

(declare-fun lt!341511 () Bool)

(assert (=> b!216000 (= lt!341511 (not (= (bvand ((_ sign_extend 24) (select (arr!5585 (buf!5190 lt!340221)) (currentByte!9768 lt!340221))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9763 lt!340221)))) #b00000000000000000000000000000000)))))

(declare-fun lt!341510 () Bool)

(assert (=> b!216000 (= lt!341510 (not (= (bvand ((_ sign_extend 24) (select (arr!5585 (buf!5190 lt!340221)) (currentByte!9768 lt!340221))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9763 lt!340221)))) #b00000000000000000000000000000000)))))

(declare-fun lt!341507 () Bool)

(assert (=> b!216000 (= lt!341507 (not (= (bvand ((_ sign_extend 24) (select (arr!5585 (buf!5190 lt!340221)) (currentByte!9768 lt!340221))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9763 lt!340221)))) #b00000000000000000000000000000000)))))

(assert (= (and d!72773 res!181717) b!216000))

(declare-fun m!332719 () Bool)

(assert (=> d!72773 m!332719))

(declare-fun m!332721 () Bool)

(assert (=> d!72773 m!332721))

(declare-fun m!332723 () Bool)

(assert (=> d!72773 m!332723))

(declare-fun m!332725 () Bool)

(assert (=> d!72773 m!332725))

(assert (=> b!216000 m!332721))

(assert (=> b!216000 m!332719))

(declare-fun m!332727 () Bool)

(assert (=> b!216000 m!332727))

(assert (=> b!216000 m!332723))

(declare-fun m!332729 () Bool)

(assert (=> b!216000 m!332729))

(assert (=> d!72523 d!72773))

(declare-fun d!72775 () Bool)

(assert (=> d!72775 (= (remainingBits!0 ((_ sign_extend 32) (size!4655 (buf!5190 (_1!9891 lt!340222)))) ((_ sign_extend 32) (currentByte!9768 (_1!9891 lt!340222))) ((_ sign_extend 32) (currentBit!9763 (_1!9891 lt!340222)))) (bvsub (bvmul ((_ sign_extend 32) (size!4655 (buf!5190 (_1!9891 lt!340222)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9768 (_1!9891 lt!340222))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9763 (_1!9891 lt!340222))))))))

(assert (=> d!72505 d!72775))

(declare-fun d!72777 () Bool)

(assert (=> d!72777 (= (invariant!0 (currentBit!9763 (_1!9891 lt!340222)) (currentByte!9768 (_1!9891 lt!340222)) (size!4655 (buf!5190 (_1!9891 lt!340222)))) (and (bvsge (currentBit!9763 (_1!9891 lt!340222)) #b00000000000000000000000000000000) (bvslt (currentBit!9763 (_1!9891 lt!340222)) #b00000000000000000000000000001000) (bvsge (currentByte!9768 (_1!9891 lt!340222)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9768 (_1!9891 lt!340222)) (size!4655 (buf!5190 (_1!9891 lt!340222)))) (and (= (currentBit!9763 (_1!9891 lt!340222)) #b00000000000000000000000000000000) (= (currentByte!9768 (_1!9891 lt!340222)) (size!4655 (buf!5190 (_1!9891 lt!340222))))))))))

(assert (=> d!72505 d!72777))

(declare-fun d!72779 () Bool)

(declare-fun e!146926 () Bool)

(assert (=> d!72779 e!146926))

(declare-fun res!181719 () Bool)

(assert (=> d!72779 (=> (not res!181719) (not e!146926))))

(declare-fun lt!341515 () (_ BitVec 64))

(declare-fun lt!341516 () (_ BitVec 64))

(declare-fun lt!341517 () (_ BitVec 64))

(assert (=> d!72779 (= res!181719 (= lt!341515 (bvsub lt!341516 lt!341517)))))

(assert (=> d!72779 (or (= (bvand lt!341516 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!341517 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!341516 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!341516 lt!341517) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72779 (= lt!341517 (remainingBits!0 ((_ sign_extend 32) (size!4655 (buf!5190 lt!340504))) ((_ sign_extend 32) (currentByte!9768 lt!340504)) ((_ sign_extend 32) (currentBit!9763 lt!340504))))))

(declare-fun lt!341518 () (_ BitVec 64))

(declare-fun lt!341519 () (_ BitVec 64))

(assert (=> d!72779 (= lt!341516 (bvmul lt!341518 lt!341519))))

(assert (=> d!72779 (or (= lt!341518 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!341519 (bvsdiv (bvmul lt!341518 lt!341519) lt!341518)))))

(assert (=> d!72779 (= lt!341519 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!72779 (= lt!341518 ((_ sign_extend 32) (size!4655 (buf!5190 lt!340504))))))

(assert (=> d!72779 (= lt!341515 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9768 lt!340504)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9763 lt!340504))))))

(assert (=> d!72779 (invariant!0 (currentBit!9763 lt!340504) (currentByte!9768 lt!340504) (size!4655 (buf!5190 lt!340504)))))

(assert (=> d!72779 (= (bitIndex!0 (size!4655 (buf!5190 lt!340504)) (currentByte!9768 lt!340504) (currentBit!9763 lt!340504)) lt!341515)))

(declare-fun b!216001 () Bool)

(declare-fun res!181718 () Bool)

(assert (=> b!216001 (=> (not res!181718) (not e!146926))))

(assert (=> b!216001 (= res!181718 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!341515))))

(declare-fun b!216002 () Bool)

(declare-fun lt!341514 () (_ BitVec 64))

(assert (=> b!216002 (= e!146926 (bvsle lt!341515 (bvmul lt!341514 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!216002 (or (= lt!341514 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!341514 #b0000000000000000000000000000000000000000000000000000000000001000) lt!341514)))))

(assert (=> b!216002 (= lt!341514 ((_ sign_extend 32) (size!4655 (buf!5190 lt!340504))))))

(assert (= (and d!72779 res!181719) b!216001))

(assert (= (and b!216001 res!181718) b!216002))

(declare-fun m!332731 () Bool)

(assert (=> d!72779 m!332731))

(declare-fun m!332733 () Bool)

(assert (=> d!72779 m!332733))

(assert (=> d!72539 d!72779))

(assert (=> d!72539 d!72719))

(declare-fun d!72781 () Bool)

(declare-fun lt!341536 () (_ BitVec 32))

(assert (=> d!72781 (= lt!341536 ((_ extract 31 0) (bvsrem (bvsub lt!340231 lt!340230) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!341534 () (_ BitVec 32))

(assert (=> d!72781 (= lt!341534 ((_ extract 31 0) (bvsdiv (bvsub lt!340231 lt!340230) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!146931 () Bool)

(assert (=> d!72781 e!146931))

(declare-fun res!181725 () Bool)

(assert (=> d!72781 (=> (not res!181725) (not e!146931))))

(assert (=> d!72781 (= res!181725 (moveBitIndexPrecond!0 (_2!9889 lt!340215) (bvsub lt!340231 lt!340230)))))

(declare-fun Unit!15337 () Unit!15294)

(declare-fun Unit!15338 () Unit!15294)

(declare-fun Unit!15339 () Unit!15294)

(assert (=> d!72781 (= (moveBitIndex!0 (_2!9889 lt!340215) (bvsub lt!340231 lt!340230)) (ite (bvslt (bvadd (currentBit!9763 (_2!9889 lt!340215)) lt!341536) #b00000000000000000000000000000000) (tuple2!18467 Unit!15337 (BitStream!8419 (buf!5190 (_2!9889 lt!340215)) (bvsub (bvadd (currentByte!9768 (_2!9889 lt!340215)) lt!341534) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!341536 (currentBit!9763 (_2!9889 lt!340215))))) (ite (bvsge (bvadd (currentBit!9763 (_2!9889 lt!340215)) lt!341536) #b00000000000000000000000000001000) (tuple2!18467 Unit!15338 (BitStream!8419 (buf!5190 (_2!9889 lt!340215)) (bvadd (currentByte!9768 (_2!9889 lt!340215)) lt!341534 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!9763 (_2!9889 lt!340215)) lt!341536) #b00000000000000000000000000001000))) (tuple2!18467 Unit!15339 (BitStream!8419 (buf!5190 (_2!9889 lt!340215)) (bvadd (currentByte!9768 (_2!9889 lt!340215)) lt!341534) (bvadd (currentBit!9763 (_2!9889 lt!340215)) lt!341536))))))))

(declare-fun b!216007 () Bool)

(declare-fun e!146932 () Bool)

(assert (=> b!216007 (= e!146931 e!146932)))

(declare-fun res!181724 () Bool)

(assert (=> b!216007 (=> (not res!181724) (not e!146932))))

(declare-fun lt!341537 () tuple2!18466)

(declare-fun lt!341533 () (_ BitVec 64))

(assert (=> b!216007 (= res!181724 (= (bvadd lt!341533 (bvsub lt!340231 lt!340230)) (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!341537))) (currentByte!9768 (_2!9888 lt!341537)) (currentBit!9763 (_2!9888 lt!341537)))))))

(assert (=> b!216007 (or (not (= (bvand lt!341533 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!340231 lt!340230) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!341533 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!341533 (bvsub lt!340231 lt!340230)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!216007 (= lt!341533 (bitIndex!0 (size!4655 (buf!5190 (_2!9889 lt!340215))) (currentByte!9768 (_2!9889 lt!340215)) (currentBit!9763 (_2!9889 lt!340215))))))

(declare-fun lt!341532 () (_ BitVec 32))

(declare-fun lt!341535 () (_ BitVec 32))

(declare-fun Unit!15340 () Unit!15294)

(declare-fun Unit!15341 () Unit!15294)

(declare-fun Unit!15342 () Unit!15294)

(assert (=> b!216007 (= lt!341537 (ite (bvslt (bvadd (currentBit!9763 (_2!9889 lt!340215)) lt!341532) #b00000000000000000000000000000000) (tuple2!18467 Unit!15340 (BitStream!8419 (buf!5190 (_2!9889 lt!340215)) (bvsub (bvadd (currentByte!9768 (_2!9889 lt!340215)) lt!341535) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!341532 (currentBit!9763 (_2!9889 lt!340215))))) (ite (bvsge (bvadd (currentBit!9763 (_2!9889 lt!340215)) lt!341532) #b00000000000000000000000000001000) (tuple2!18467 Unit!15341 (BitStream!8419 (buf!5190 (_2!9889 lt!340215)) (bvadd (currentByte!9768 (_2!9889 lt!340215)) lt!341535 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!9763 (_2!9889 lt!340215)) lt!341532) #b00000000000000000000000000001000))) (tuple2!18467 Unit!15342 (BitStream!8419 (buf!5190 (_2!9889 lt!340215)) (bvadd (currentByte!9768 (_2!9889 lt!340215)) lt!341535) (bvadd (currentBit!9763 (_2!9889 lt!340215)) lt!341532))))))))

(assert (=> b!216007 (= lt!341532 ((_ extract 31 0) (bvsrem (bvsub lt!340231 lt!340230) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!216007 (= lt!341535 ((_ extract 31 0) (bvsdiv (bvsub lt!340231 lt!340230) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!216008 () Bool)

(assert (=> b!216008 (= e!146932 (and (= (size!4655 (buf!5190 (_2!9889 lt!340215))) (size!4655 (buf!5190 (_2!9888 lt!341537)))) (= (buf!5190 (_2!9889 lt!340215)) (buf!5190 (_2!9888 lt!341537)))))))

(assert (= (and d!72781 res!181725) b!216007))

(assert (= (and b!216007 res!181724) b!216008))

(assert (=> d!72781 m!332009))

(declare-fun m!332735 () Bool)

(assert (=> b!216007 m!332735))

(assert (=> b!216007 m!331789))

(assert (=> d!72539 d!72781))

(declare-fun d!72785 () Bool)

(declare-fun res!181728 () Bool)

(declare-fun e!146935 () Bool)

(assert (=> d!72785 (=> (not res!181728) (not e!146935))))

(assert (=> d!72785 (= res!181728 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!4655 (buf!5190 (_2!9889 lt!340215))))) (bvsub lt!340231 lt!340230)) (bvsle (bvsub lt!340231 lt!340230) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!4655 (buf!5190 (_2!9889 lt!340215))))))))))

(assert (=> d!72785 (= (moveBitIndexPrecond!0 (_2!9889 lt!340215) (bvsub lt!340231 lt!340230)) e!146935)))

(declare-fun b!216012 () Bool)

(declare-fun lt!341540 () (_ BitVec 64))

(assert (=> b!216012 (= e!146935 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!341540) (bvsle lt!341540 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!4655 (buf!5190 (_2!9889 lt!340215))))))))))

(assert (=> b!216012 (= lt!341540 (bvadd (bitIndex!0 (size!4655 (buf!5190 (_2!9889 lt!340215))) (currentByte!9768 (_2!9889 lt!340215)) (currentBit!9763 (_2!9889 lt!340215))) (bvsub lt!340231 lt!340230)))))

(assert (= (and d!72785 res!181728) b!216012))

(assert (=> b!216012 m!331789))

(assert (=> d!72539 d!72785))

(declare-fun b!216013 () Bool)

(declare-fun e!146941 () Bool)

(declare-fun call!3373 () Bool)

(assert (=> b!216013 (= e!146941 call!3373)))

(declare-fun lt!341542 () tuple4!278)

(declare-fun lt!341543 () (_ BitVec 32))

(declare-fun lt!341541 () (_ BitVec 32))

(declare-fun c!10542 () Bool)

(declare-fun bm!3370 () Bool)

(assert (=> bm!3370 (= call!3373 (byteRangesEq!0 (ite c!10542 (select (arr!5585 (buf!5190 thiss!1204)) (_3!655 lt!341542)) (select (arr!5585 (buf!5190 thiss!1204)) (_4!139 lt!341542))) (ite c!10542 (select (arr!5585 (buf!5190 (_2!9888 lt!340226))) (_3!655 lt!341542)) (select (arr!5585 (buf!5190 (_2!9888 lt!340226))) (_4!139 lt!341542))) (ite c!10542 lt!341541 #b00000000000000000000000000000000) lt!341543))))

(declare-fun b!216014 () Bool)

(declare-fun e!146939 () Bool)

(assert (=> b!216014 (= e!146939 call!3373)))

(declare-fun b!216015 () Bool)

(declare-fun e!146937 () Bool)

(assert (=> b!216015 (= e!146941 e!146937)))

(declare-fun res!181729 () Bool)

(assert (=> b!216015 (= res!181729 (byteRangesEq!0 (select (arr!5585 (buf!5190 thiss!1204)) (_3!655 lt!341542)) (select (arr!5585 (buf!5190 (_2!9888 lt!340226))) (_3!655 lt!341542)) lt!341541 #b00000000000000000000000000001000))))

(assert (=> b!216015 (=> (not res!181729) (not e!146937))))

(declare-fun d!72787 () Bool)

(declare-fun res!181733 () Bool)

(declare-fun e!146938 () Bool)

(assert (=> d!72787 (=> res!181733 e!146938)))

(assert (=> d!72787 (= res!181733 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4655 (buf!5190 thiss!1204)) (currentByte!9768 thiss!1204) (currentBit!9763 thiss!1204))))))

(assert (=> d!72787 (= (arrayBitRangesEq!0 (buf!5190 thiss!1204) (buf!5190 (_2!9888 lt!340226)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4655 (buf!5190 thiss!1204)) (currentByte!9768 thiss!1204) (currentBit!9763 thiss!1204))) e!146938)))

(declare-fun b!216016 () Bool)

(declare-fun e!146936 () Bool)

(assert (=> b!216016 (= e!146938 e!146936)))

(declare-fun res!181731 () Bool)

(assert (=> b!216016 (=> (not res!181731) (not e!146936))))

(declare-fun e!146940 () Bool)

(assert (=> b!216016 (= res!181731 e!146940)))

(declare-fun res!181732 () Bool)

(assert (=> b!216016 (=> res!181732 e!146940)))

(assert (=> b!216016 (= res!181732 (bvsge (_1!9902 lt!341542) (_2!9902 lt!341542)))))

(assert (=> b!216016 (= lt!341543 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!4655 (buf!5190 thiss!1204)) (currentByte!9768 thiss!1204) (currentBit!9763 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!216016 (= lt!341541 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!216016 (= lt!341542 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4655 (buf!5190 thiss!1204)) (currentByte!9768 thiss!1204) (currentBit!9763 thiss!1204))))))

(declare-fun b!216017 () Bool)

(declare-fun res!181730 () Bool)

(assert (=> b!216017 (= res!181730 (= lt!341543 #b00000000000000000000000000000000))))

(assert (=> b!216017 (=> res!181730 e!146939)))

(assert (=> b!216017 (= e!146937 e!146939)))

(declare-fun b!216018 () Bool)

(assert (=> b!216018 (= e!146940 (arrayRangesEq!701 (buf!5190 thiss!1204) (buf!5190 (_2!9888 lt!340226)) (_1!9902 lt!341542) (_2!9902 lt!341542)))))

(declare-fun b!216019 () Bool)

(assert (=> b!216019 (= e!146936 e!146941)))

(assert (=> b!216019 (= c!10542 (= (_3!655 lt!341542) (_4!139 lt!341542)))))

(assert (= (and d!72787 (not res!181733)) b!216016))

(assert (= (and b!216016 (not res!181732)) b!216018))

(assert (= (and b!216016 res!181731) b!216019))

(assert (= (and b!216019 c!10542) b!216013))

(assert (= (and b!216019 (not c!10542)) b!216015))

(assert (= (and b!216015 res!181729) b!216017))

(assert (= (and b!216017 (not res!181730)) b!216014))

(assert (= (or b!216013 b!216014) bm!3370))

(declare-fun m!332737 () Bool)

(assert (=> bm!3370 m!332737))

(declare-fun m!332739 () Bool)

(assert (=> bm!3370 m!332739))

(declare-fun m!332741 () Bool)

(assert (=> bm!3370 m!332741))

(declare-fun m!332743 () Bool)

(assert (=> bm!3370 m!332743))

(declare-fun m!332745 () Bool)

(assert (=> bm!3370 m!332745))

(assert (=> b!216015 m!332739))

(assert (=> b!216015 m!332741))

(assert (=> b!216015 m!332739))

(assert (=> b!216015 m!332741))

(declare-fun m!332747 () Bool)

(assert (=> b!216015 m!332747))

(assert (=> b!216016 m!331715))

(declare-fun m!332749 () Bool)

(assert (=> b!216016 m!332749))

(declare-fun m!332751 () Bool)

(assert (=> b!216018 m!332751))

(assert (=> b!215568 d!72787))

(assert (=> b!215568 d!72531))

(declare-fun d!72789 () Bool)

(declare-fun e!146942 () Bool)

(assert (=> d!72789 e!146942))

(declare-fun res!181735 () Bool)

(assert (=> d!72789 (=> (not res!181735) (not e!146942))))

(declare-fun lt!341546 () (_ BitVec 64))

(declare-fun lt!341545 () (_ BitVec 64))

(declare-fun lt!341547 () (_ BitVec 64))

(assert (=> d!72789 (= res!181735 (= lt!341545 (bvsub lt!341546 lt!341547)))))

(assert (=> d!72789 (or (= (bvand lt!341546 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!341547 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!341546 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!341546 lt!341547) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72789 (= lt!341547 (remainingBits!0 ((_ sign_extend 32) (size!4655 (buf!5190 (_2!9888 lt!341061)))) ((_ sign_extend 32) (currentByte!9768 (_2!9888 lt!341061))) ((_ sign_extend 32) (currentBit!9763 (_2!9888 lt!341061)))))))

(declare-fun lt!341548 () (_ BitVec 64))

(declare-fun lt!341549 () (_ BitVec 64))

(assert (=> d!72789 (= lt!341546 (bvmul lt!341548 lt!341549))))

(assert (=> d!72789 (or (= lt!341548 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!341549 (bvsdiv (bvmul lt!341548 lt!341549) lt!341548)))))

(assert (=> d!72789 (= lt!341549 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!72789 (= lt!341548 ((_ sign_extend 32) (size!4655 (buf!5190 (_2!9888 lt!341061)))))))

(assert (=> d!72789 (= lt!341545 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9768 (_2!9888 lt!341061))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9763 (_2!9888 lt!341061)))))))

(assert (=> d!72789 (invariant!0 (currentBit!9763 (_2!9888 lt!341061)) (currentByte!9768 (_2!9888 lt!341061)) (size!4655 (buf!5190 (_2!9888 lt!341061))))))

(assert (=> d!72789 (= (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!341061))) (currentByte!9768 (_2!9888 lt!341061)) (currentBit!9763 (_2!9888 lt!341061))) lt!341545)))

(declare-fun b!216020 () Bool)

(declare-fun res!181734 () Bool)

(assert (=> b!216020 (=> (not res!181734) (not e!146942))))

(assert (=> b!216020 (= res!181734 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!341545))))

(declare-fun b!216021 () Bool)

(declare-fun lt!341544 () (_ BitVec 64))

(assert (=> b!216021 (= e!146942 (bvsle lt!341545 (bvmul lt!341544 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!216021 (or (= lt!341544 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!341544 #b0000000000000000000000000000000000000000000000000000000000001000) lt!341544)))))

(assert (=> b!216021 (= lt!341544 ((_ sign_extend 32) (size!4655 (buf!5190 (_2!9888 lt!341061)))))))

(assert (= (and d!72789 res!181735) b!216020))

(assert (= (and b!216020 res!181734) b!216021))

(declare-fun m!332753 () Bool)

(assert (=> d!72789 m!332753))

(assert (=> d!72789 m!332419))

(assert (=> b!215823 d!72789))

(assert (=> b!215823 d!72529))

(declare-fun d!72791 () Bool)

(assert (=> d!72791 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-fun lt!341550 () Unit!15294)

(assert (=> d!72791 (= lt!341550 (choose!11 thiss!1204))))

(assert (=> d!72791 (= (lemmaIsPrefixRefl!0 thiss!1204) lt!341550)))

(declare-fun bs!17842 () Bool)

(assert (= bs!17842 d!72791))

(assert (=> bs!17842 m!331969))

(declare-fun m!332755 () Bool)

(assert (=> bs!17842 m!332755))

(assert (=> d!72507 d!72791))

(declare-fun d!72793 () Bool)

(assert (=> d!72793 (isPrefixOf!0 lt!340457 lt!340457)))

(declare-fun lt!341551 () Unit!15294)

(assert (=> d!72793 (= lt!341551 (choose!11 lt!340457))))

(assert (=> d!72793 (= (lemmaIsPrefixRefl!0 lt!340457) lt!341551)))

(declare-fun bs!17843 () Bool)

(assert (= bs!17843 d!72793))

(assert (=> bs!17843 m!331971))

(declare-fun m!332757 () Bool)

(assert (=> bs!17843 m!332757))

(assert (=> d!72507 d!72793))

(declare-fun d!72795 () Bool)

(declare-fun res!181736 () Bool)

(declare-fun e!146943 () Bool)

(assert (=> d!72795 (=> (not res!181736) (not e!146943))))

(assert (=> d!72795 (= res!181736 (= (size!4655 (buf!5190 (_1!9889 lt!340460))) (size!4655 (buf!5190 (_2!9889 lt!340460)))))))

(assert (=> d!72795 (= (isPrefixOf!0 (_1!9889 lt!340460) (_2!9889 lt!340460)) e!146943)))

(declare-fun b!216022 () Bool)

(declare-fun res!181738 () Bool)

(assert (=> b!216022 (=> (not res!181738) (not e!146943))))

(assert (=> b!216022 (= res!181738 (bvsle (bitIndex!0 (size!4655 (buf!5190 (_1!9889 lt!340460))) (currentByte!9768 (_1!9889 lt!340460)) (currentBit!9763 (_1!9889 lt!340460))) (bitIndex!0 (size!4655 (buf!5190 (_2!9889 lt!340460))) (currentByte!9768 (_2!9889 lt!340460)) (currentBit!9763 (_2!9889 lt!340460)))))))

(declare-fun b!216023 () Bool)

(declare-fun e!146944 () Bool)

(assert (=> b!216023 (= e!146943 e!146944)))

(declare-fun res!181737 () Bool)

(assert (=> b!216023 (=> res!181737 e!146944)))

(assert (=> b!216023 (= res!181737 (= (size!4655 (buf!5190 (_1!9889 lt!340460))) #b00000000000000000000000000000000))))

(declare-fun b!216024 () Bool)

(assert (=> b!216024 (= e!146944 (arrayBitRangesEq!0 (buf!5190 (_1!9889 lt!340460)) (buf!5190 (_2!9889 lt!340460)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4655 (buf!5190 (_1!9889 lt!340460))) (currentByte!9768 (_1!9889 lt!340460)) (currentBit!9763 (_1!9889 lt!340460)))))))

(assert (= (and d!72795 res!181736) b!216022))

(assert (= (and b!216022 res!181738) b!216023))

(assert (= (and b!216023 (not res!181737)) b!216024))

(declare-fun m!332759 () Bool)

(assert (=> b!216022 m!332759))

(assert (=> b!216022 m!332681))

(assert (=> b!216024 m!332759))

(assert (=> b!216024 m!332759))

(declare-fun m!332761 () Bool)

(assert (=> b!216024 m!332761))

(assert (=> d!72507 d!72795))

(declare-fun d!72797 () Bool)

(declare-fun res!181739 () Bool)

(declare-fun e!146945 () Bool)

(assert (=> d!72797 (=> (not res!181739) (not e!146945))))

(assert (=> d!72797 (= res!181739 (= (size!4655 (buf!5190 thiss!1204)) (size!4655 (buf!5190 thiss!1204))))))

(assert (=> d!72797 (= (isPrefixOf!0 thiss!1204 thiss!1204) e!146945)))

(declare-fun b!216025 () Bool)

(declare-fun res!181741 () Bool)

(assert (=> b!216025 (=> (not res!181741) (not e!146945))))

(assert (=> b!216025 (= res!181741 (bvsle (bitIndex!0 (size!4655 (buf!5190 thiss!1204)) (currentByte!9768 thiss!1204) (currentBit!9763 thiss!1204)) (bitIndex!0 (size!4655 (buf!5190 thiss!1204)) (currentByte!9768 thiss!1204) (currentBit!9763 thiss!1204))))))

(declare-fun b!216026 () Bool)

(declare-fun e!146946 () Bool)

(assert (=> b!216026 (= e!146945 e!146946)))

(declare-fun res!181740 () Bool)

(assert (=> b!216026 (=> res!181740 e!146946)))

(assert (=> b!216026 (= res!181740 (= (size!4655 (buf!5190 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!216027 () Bool)

(assert (=> b!216027 (= e!146946 (arrayBitRangesEq!0 (buf!5190 thiss!1204) (buf!5190 thiss!1204) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4655 (buf!5190 thiss!1204)) (currentByte!9768 thiss!1204) (currentBit!9763 thiss!1204))))))

(assert (= (and d!72797 res!181739) b!216025))

(assert (= (and b!216025 res!181741) b!216026))

(assert (= (and b!216026 (not res!181740)) b!216027))

(assert (=> b!216025 m!331715))

(assert (=> b!216025 m!331715))

(assert (=> b!216027 m!331715))

(assert (=> b!216027 m!331715))

(declare-fun m!332763 () Bool)

(assert (=> b!216027 m!332763))

(assert (=> d!72507 d!72797))

(declare-fun d!72799 () Bool)

(assert (=> d!72799 (isPrefixOf!0 lt!340457 (_2!9888 lt!340213))))

(declare-fun lt!341552 () Unit!15294)

(assert (=> d!72799 (= lt!341552 (choose!30 lt!340457 thiss!1204 (_2!9888 lt!340213)))))

(assert (=> d!72799 (isPrefixOf!0 lt!340457 thiss!1204)))

(assert (=> d!72799 (= (lemmaIsPrefixTransitive!0 lt!340457 thiss!1204 (_2!9888 lt!340213)) lt!341552)))

(declare-fun bs!17844 () Bool)

(assert (= bs!17844 d!72799))

(assert (=> bs!17844 m!331967))

(declare-fun m!332765 () Bool)

(assert (=> bs!17844 m!332765))

(declare-fun m!332767 () Bool)

(assert (=> bs!17844 m!332767))

(assert (=> d!72507 d!72799))

(assert (=> d!72507 d!72547))

(assert (=> d!72507 d!72763))

(assert (=> d!72507 d!72749))

(declare-fun d!72801 () Bool)

(assert (=> d!72801 (isPrefixOf!0 lt!340457 (_2!9888 lt!340213))))

(declare-fun lt!341553 () Unit!15294)

(assert (=> d!72801 (= lt!341553 (choose!30 lt!340457 (_2!9888 lt!340213) (_2!9888 lt!340213)))))

(assert (=> d!72801 (isPrefixOf!0 lt!340457 (_2!9888 lt!340213))))

(assert (=> d!72801 (= (lemmaIsPrefixTransitive!0 lt!340457 (_2!9888 lt!340213) (_2!9888 lt!340213)) lt!341553)))

(declare-fun bs!17845 () Bool)

(assert (= bs!17845 d!72801))

(assert (=> bs!17845 m!331967))

(declare-fun m!332769 () Bool)

(assert (=> bs!17845 m!332769))

(assert (=> bs!17845 m!331967))

(assert (=> d!72507 d!72801))

(declare-fun d!72803 () Bool)

(declare-fun res!181742 () Bool)

(declare-fun e!146947 () Bool)

(assert (=> d!72803 (=> (not res!181742) (not e!146947))))

(assert (=> d!72803 (= res!181742 (= (size!4655 (buf!5190 lt!340457)) (size!4655 (buf!5190 lt!340457))))))

(assert (=> d!72803 (= (isPrefixOf!0 lt!340457 lt!340457) e!146947)))

(declare-fun b!216028 () Bool)

(declare-fun res!181744 () Bool)

(assert (=> b!216028 (=> (not res!181744) (not e!146947))))

(assert (=> b!216028 (= res!181744 (bvsle (bitIndex!0 (size!4655 (buf!5190 lt!340457)) (currentByte!9768 lt!340457) (currentBit!9763 lt!340457)) (bitIndex!0 (size!4655 (buf!5190 lt!340457)) (currentByte!9768 lt!340457) (currentBit!9763 lt!340457))))))

(declare-fun b!216029 () Bool)

(declare-fun e!146948 () Bool)

(assert (=> b!216029 (= e!146947 e!146948)))

(declare-fun res!181743 () Bool)

(assert (=> b!216029 (=> res!181743 e!146948)))

(assert (=> b!216029 (= res!181743 (= (size!4655 (buf!5190 lt!340457)) #b00000000000000000000000000000000))))

(declare-fun b!216030 () Bool)

(assert (=> b!216030 (= e!146948 (arrayBitRangesEq!0 (buf!5190 lt!340457) (buf!5190 lt!340457) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4655 (buf!5190 lt!340457)) (currentByte!9768 lt!340457) (currentBit!9763 lt!340457))))))

(assert (= (and d!72803 res!181742) b!216028))

(assert (= (and b!216028 res!181744) b!216029))

(assert (= (and b!216029 (not res!181743)) b!216030))

(declare-fun m!332771 () Bool)

(assert (=> b!216028 m!332771))

(assert (=> b!216028 m!332771))

(assert (=> b!216030 m!332771))

(assert (=> b!216030 m!332771))

(declare-fun m!332773 () Bool)

(assert (=> b!216030 m!332773))

(assert (=> d!72507 d!72803))

(declare-fun d!72805 () Bool)

(declare-fun res!181745 () Bool)

(declare-fun e!146949 () Bool)

(assert (=> d!72805 (=> (not res!181745) (not e!146949))))

(assert (=> d!72805 (= res!181745 (= (size!4655 (buf!5190 lt!340457)) (size!4655 (buf!5190 (_2!9888 lt!340213)))))))

(assert (=> d!72805 (= (isPrefixOf!0 lt!340457 (_2!9888 lt!340213)) e!146949)))

(declare-fun b!216031 () Bool)

(declare-fun res!181747 () Bool)

(assert (=> b!216031 (=> (not res!181747) (not e!146949))))

(assert (=> b!216031 (= res!181747 (bvsle (bitIndex!0 (size!4655 (buf!5190 lt!340457)) (currentByte!9768 lt!340457) (currentBit!9763 lt!340457)) (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!340213))) (currentByte!9768 (_2!9888 lt!340213)) (currentBit!9763 (_2!9888 lt!340213)))))))

(declare-fun b!216032 () Bool)

(declare-fun e!146950 () Bool)

(assert (=> b!216032 (= e!146949 e!146950)))

(declare-fun res!181746 () Bool)

(assert (=> b!216032 (=> res!181746 e!146950)))

(assert (=> b!216032 (= res!181746 (= (size!4655 (buf!5190 lt!340457)) #b00000000000000000000000000000000))))

(declare-fun b!216033 () Bool)

(assert (=> b!216033 (= e!146950 (arrayBitRangesEq!0 (buf!5190 lt!340457) (buf!5190 (_2!9888 lt!340213)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4655 (buf!5190 lt!340457)) (currentByte!9768 lt!340457) (currentBit!9763 lt!340457))))))

(assert (= (and d!72805 res!181745) b!216031))

(assert (= (and b!216031 res!181747) b!216032))

(assert (= (and b!216032 (not res!181746)) b!216033))

(assert (=> b!216031 m!332771))

(assert (=> b!216031 m!331763))

(assert (=> b!216033 m!332771))

(assert (=> b!216033 m!332771))

(declare-fun m!332775 () Bool)

(assert (=> b!216033 m!332775))

(assert (=> d!72507 d!72805))

(assert (=> b!215566 d!72531))

(assert (=> b!215566 d!72529))

(declare-fun d!72807 () Bool)

(declare-fun e!146951 () Bool)

(assert (=> d!72807 e!146951))

(declare-fun res!181748 () Bool)

(assert (=> d!72807 (=> (not res!181748) (not e!146951))))

(assert (=> d!72807 (= res!181748 (= (buf!5190 (_2!9888 (increaseBitIndex!0 (readerFrom!0 (_2!9888 lt!340226) (currentBit!9763 thiss!1204) (currentByte!9768 thiss!1204))))) (buf!5190 (readerFrom!0 (_2!9888 lt!340226) (currentBit!9763 thiss!1204) (currentByte!9768 thiss!1204)))))))

(declare-fun lt!341556 () Bool)

(assert (=> d!72807 (= lt!341556 (not (= (bvand ((_ sign_extend 24) (select (arr!5585 (buf!5190 (readerFrom!0 (_2!9888 lt!340226) (currentBit!9763 thiss!1204) (currentByte!9768 thiss!1204)))) (currentByte!9768 (readerFrom!0 (_2!9888 lt!340226) (currentBit!9763 thiss!1204) (currentByte!9768 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9763 (readerFrom!0 (_2!9888 lt!340226) (currentBit!9763 thiss!1204) (currentByte!9768 thiss!1204)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!341555 () tuple2!18484)

(assert (=> d!72807 (= lt!341555 (tuple2!18485 (not (= (bvand ((_ sign_extend 24) (select (arr!5585 (buf!5190 (readerFrom!0 (_2!9888 lt!340226) (currentBit!9763 thiss!1204) (currentByte!9768 thiss!1204)))) (currentByte!9768 (readerFrom!0 (_2!9888 lt!340226) (currentBit!9763 thiss!1204) (currentByte!9768 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9763 (readerFrom!0 (_2!9888 lt!340226) (currentBit!9763 thiss!1204) (currentByte!9768 thiss!1204)))))) #b00000000000000000000000000000000)) (_2!9888 (increaseBitIndex!0 (readerFrom!0 (_2!9888 lt!340226) (currentBit!9763 thiss!1204) (currentByte!9768 thiss!1204))))))))

(assert (=> d!72807 (validate_offset_bit!0 ((_ sign_extend 32) (size!4655 (buf!5190 (readerFrom!0 (_2!9888 lt!340226) (currentBit!9763 thiss!1204) (currentByte!9768 thiss!1204))))) ((_ sign_extend 32) (currentByte!9768 (readerFrom!0 (_2!9888 lt!340226) (currentBit!9763 thiss!1204) (currentByte!9768 thiss!1204)))) ((_ sign_extend 32) (currentBit!9763 (readerFrom!0 (_2!9888 lt!340226) (currentBit!9763 thiss!1204) (currentByte!9768 thiss!1204)))))))

(assert (=> d!72807 (= (readBit!0 (readerFrom!0 (_2!9888 lt!340226) (currentBit!9763 thiss!1204) (currentByte!9768 thiss!1204))) lt!341555)))

(declare-fun b!216034 () Bool)

(declare-fun lt!341559 () (_ BitVec 64))

(declare-fun lt!341560 () (_ BitVec 64))

(assert (=> b!216034 (= e!146951 (= (bitIndex!0 (size!4655 (buf!5190 (_2!9888 (increaseBitIndex!0 (readerFrom!0 (_2!9888 lt!340226) (currentBit!9763 thiss!1204) (currentByte!9768 thiss!1204)))))) (currentByte!9768 (_2!9888 (increaseBitIndex!0 (readerFrom!0 (_2!9888 lt!340226) (currentBit!9763 thiss!1204) (currentByte!9768 thiss!1204))))) (currentBit!9763 (_2!9888 (increaseBitIndex!0 (readerFrom!0 (_2!9888 lt!340226) (currentBit!9763 thiss!1204) (currentByte!9768 thiss!1204)))))) (bvadd lt!341560 lt!341559)))))

(assert (=> b!216034 (or (not (= (bvand lt!341560 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!341559 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!341560 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!341560 lt!341559) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!216034 (= lt!341559 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!216034 (= lt!341560 (bitIndex!0 (size!4655 (buf!5190 (readerFrom!0 (_2!9888 lt!340226) (currentBit!9763 thiss!1204) (currentByte!9768 thiss!1204)))) (currentByte!9768 (readerFrom!0 (_2!9888 lt!340226) (currentBit!9763 thiss!1204) (currentByte!9768 thiss!1204))) (currentBit!9763 (readerFrom!0 (_2!9888 lt!340226) (currentBit!9763 thiss!1204) (currentByte!9768 thiss!1204)))))))

(declare-fun lt!341558 () Bool)

(assert (=> b!216034 (= lt!341558 (not (= (bvand ((_ sign_extend 24) (select (arr!5585 (buf!5190 (readerFrom!0 (_2!9888 lt!340226) (currentBit!9763 thiss!1204) (currentByte!9768 thiss!1204)))) (currentByte!9768 (readerFrom!0 (_2!9888 lt!340226) (currentBit!9763 thiss!1204) (currentByte!9768 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9763 (readerFrom!0 (_2!9888 lt!340226) (currentBit!9763 thiss!1204) (currentByte!9768 thiss!1204)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!341557 () Bool)

(assert (=> b!216034 (= lt!341557 (not (= (bvand ((_ sign_extend 24) (select (arr!5585 (buf!5190 (readerFrom!0 (_2!9888 lt!340226) (currentBit!9763 thiss!1204) (currentByte!9768 thiss!1204)))) (currentByte!9768 (readerFrom!0 (_2!9888 lt!340226) (currentBit!9763 thiss!1204) (currentByte!9768 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9763 (readerFrom!0 (_2!9888 lt!340226) (currentBit!9763 thiss!1204) (currentByte!9768 thiss!1204)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!341554 () Bool)

(assert (=> b!216034 (= lt!341554 (not (= (bvand ((_ sign_extend 24) (select (arr!5585 (buf!5190 (readerFrom!0 (_2!9888 lt!340226) (currentBit!9763 thiss!1204) (currentByte!9768 thiss!1204)))) (currentByte!9768 (readerFrom!0 (_2!9888 lt!340226) (currentBit!9763 thiss!1204) (currentByte!9768 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9763 (readerFrom!0 (_2!9888 lt!340226) (currentBit!9763 thiss!1204) (currentByte!9768 thiss!1204)))))) #b00000000000000000000000000000000)))))

(assert (= (and d!72807 res!181748) b!216034))

(assert (=> d!72807 m!331709))

(declare-fun m!332777 () Bool)

(assert (=> d!72807 m!332777))

(declare-fun m!332779 () Bool)

(assert (=> d!72807 m!332779))

(declare-fun m!332781 () Bool)

(assert (=> d!72807 m!332781))

(declare-fun m!332783 () Bool)

(assert (=> d!72807 m!332783))

(assert (=> b!216034 m!332779))

(assert (=> b!216034 m!331709))

(assert (=> b!216034 m!332777))

(declare-fun m!332785 () Bool)

(assert (=> b!216034 m!332785))

(assert (=> b!216034 m!332781))

(declare-fun m!332787 () Bool)

(assert (=> b!216034 m!332787))

(assert (=> d!72533 d!72807))

(assert (=> b!215615 d!72501))

(declare-fun d!72809 () Bool)

(declare-fun e!146952 () Bool)

(assert (=> d!72809 e!146952))

(declare-fun res!181749 () Bool)

(assert (=> d!72809 (=> (not res!181749) (not e!146952))))

(assert (=> d!72809 (= res!181749 (= (buf!5190 (_2!9888 (increaseBitIndex!0 (_1!9889 lt!340215)))) (buf!5190 (_1!9889 lt!340215))))))

(declare-fun lt!341563 () Bool)

(assert (=> d!72809 (= lt!341563 (not (= (bvand ((_ sign_extend 24) (select (arr!5585 (buf!5190 (_1!9889 lt!340215))) (currentByte!9768 (_1!9889 lt!340215)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9763 (_1!9889 lt!340215))))) #b00000000000000000000000000000000)))))

(declare-fun lt!341562 () tuple2!18484)

(assert (=> d!72809 (= lt!341562 (tuple2!18485 (not (= (bvand ((_ sign_extend 24) (select (arr!5585 (buf!5190 (_1!9889 lt!340215))) (currentByte!9768 (_1!9889 lt!340215)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9763 (_1!9889 lt!340215))))) #b00000000000000000000000000000000)) (_2!9888 (increaseBitIndex!0 (_1!9889 lt!340215)))))))

(assert (=> d!72809 (validate_offset_bit!0 ((_ sign_extend 32) (size!4655 (buf!5190 (_1!9889 lt!340215)))) ((_ sign_extend 32) (currentByte!9768 (_1!9889 lt!340215))) ((_ sign_extend 32) (currentBit!9763 (_1!9889 lt!340215))))))

(assert (=> d!72809 (= (readBit!0 (_1!9889 lt!340215)) lt!341562)))

(declare-fun lt!341566 () (_ BitVec 64))

(declare-fun b!216035 () Bool)

(declare-fun lt!341567 () (_ BitVec 64))

(assert (=> b!216035 (= e!146952 (= (bitIndex!0 (size!4655 (buf!5190 (_2!9888 (increaseBitIndex!0 (_1!9889 lt!340215))))) (currentByte!9768 (_2!9888 (increaseBitIndex!0 (_1!9889 lt!340215)))) (currentBit!9763 (_2!9888 (increaseBitIndex!0 (_1!9889 lt!340215))))) (bvadd lt!341567 lt!341566)))))

(assert (=> b!216035 (or (not (= (bvand lt!341567 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!341566 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!341567 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!341567 lt!341566) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!216035 (= lt!341566 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!216035 (= lt!341567 (bitIndex!0 (size!4655 (buf!5190 (_1!9889 lt!340215))) (currentByte!9768 (_1!9889 lt!340215)) (currentBit!9763 (_1!9889 lt!340215))))))

(declare-fun lt!341565 () Bool)

(assert (=> b!216035 (= lt!341565 (not (= (bvand ((_ sign_extend 24) (select (arr!5585 (buf!5190 (_1!9889 lt!340215))) (currentByte!9768 (_1!9889 lt!340215)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9763 (_1!9889 lt!340215))))) #b00000000000000000000000000000000)))))

(declare-fun lt!341564 () Bool)

(assert (=> b!216035 (= lt!341564 (not (= (bvand ((_ sign_extend 24) (select (arr!5585 (buf!5190 (_1!9889 lt!340215))) (currentByte!9768 (_1!9889 lt!340215)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9763 (_1!9889 lt!340215))))) #b00000000000000000000000000000000)))))

(declare-fun lt!341561 () Bool)

(assert (=> b!216035 (= lt!341561 (not (= (bvand ((_ sign_extend 24) (select (arr!5585 (buf!5190 (_1!9889 lt!340215))) (currentByte!9768 (_1!9889 lt!340215)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9763 (_1!9889 lt!340215))))) #b00000000000000000000000000000000)))))

(assert (= (and d!72809 res!181749) b!216035))

(declare-fun m!332789 () Bool)

(assert (=> d!72809 m!332789))

(declare-fun m!332791 () Bool)

(assert (=> d!72809 m!332791))

(declare-fun m!332793 () Bool)

(assert (=> d!72809 m!332793))

(declare-fun m!332795 () Bool)

(assert (=> d!72809 m!332795))

(assert (=> b!216035 m!332791))

(assert (=> b!216035 m!332789))

(declare-fun m!332797 () Bool)

(assert (=> b!216035 m!332797))

(assert (=> b!216035 m!332793))

(assert (=> b!216035 m!331891))

(assert (=> d!72521 d!72809))

(declare-fun b!216050 () Bool)

(declare-fun res!181763 () Bool)

(declare-fun e!146959 () Bool)

(assert (=> b!216050 (=> (not res!181763) (not e!146959))))

(declare-fun lt!341583 () tuple2!18482)

(declare-fun lt!341580 () (_ BitVec 64))

(declare-fun lt!341581 () (_ BitVec 64))

(assert (=> b!216050 (= res!181763 (= (bitIndex!0 (size!4655 (buf!5190 (_2!9896 lt!341583))) (currentByte!9768 (_2!9896 lt!341583)) (currentBit!9763 (_2!9896 lt!341583))) (bvadd lt!341581 lt!341580)))))

(assert (=> b!216050 (or (not (= (bvand lt!341581 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!341580 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!341581 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!341581 lt!341580) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!216050 (= lt!341580 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!216050 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!216050 (= lt!341581 (bitIndex!0 (size!4655 (buf!5190 lt!340219)) (currentByte!9768 lt!340219) (currentBit!9763 lt!340219)))))

(declare-fun b!216051 () Bool)

(declare-fun res!181760 () Bool)

(assert (=> b!216051 (=> (not res!181760) (not e!146959))))

(assert (=> b!216051 (= res!181760 (= (bvand (_1!9896 lt!341583) (onesLSBLong!0 nBits!348)) (_1!9896 lt!341583)))))

(declare-fun b!216052 () Bool)

(declare-fun e!146961 () tuple2!18482)

(assert (=> b!216052 (= e!146961 (tuple2!18483 lt!340233 lt!340219))))

(declare-fun b!216053 () Bool)

(declare-fun res!181764 () Bool)

(assert (=> b!216053 (=> (not res!181764) (not e!146959))))

(assert (=> b!216053 (= res!181764 (= (bvand (_1!9896 lt!341583) (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))) (bvand lt!340233 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun b!216054 () Bool)

(declare-fun lt!341584 () tuple2!18482)

(assert (=> b!216054 (= e!146961 (tuple2!18483 (_1!9896 lt!341584) (_2!9896 lt!341584)))))

(declare-fun lt!341582 () tuple2!18484)

(assert (=> b!216054 (= lt!341582 (readBit!0 lt!340219))))

(assert (=> b!216054 (= lt!341584 (readNBitsLSBFirstsLoop!0 (_2!9897 lt!341582) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!340233 (ite (_1!9897 lt!341582) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!72811 () Bool)

(assert (=> d!72811 e!146959))

(declare-fun res!181761 () Bool)

(assert (=> d!72811 (=> (not res!181761) (not e!146959))))

(assert (=> d!72811 (= res!181761 (= (buf!5190 (_2!9896 lt!341583)) (buf!5190 lt!340219)))))

(assert (=> d!72811 (= lt!341583 e!146961)))

(declare-fun c!10545 () Bool)

(assert (=> d!72811 (= c!10545 (= nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(assert (=> d!72811 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!590)) (bvsle (bvadd #b00000000000000000000000000000001 i!590) nBits!348) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!72811 (= (readNBitsLSBFirstsLoop!0 lt!340219 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!340233) lt!341583)))

(declare-fun b!216055 () Bool)

(declare-fun e!146960 () Bool)

(assert (=> b!216055 (= e!146959 e!146960)))

(declare-fun res!181762 () Bool)

(assert (=> b!216055 (=> res!181762 e!146960)))

(assert (=> b!216055 (= res!181762 (not (bvslt (bvadd #b00000000000000000000000000000001 i!590) nBits!348)))))

(declare-fun lt!341585 () (_ BitVec 64))

(declare-fun b!216056 () Bool)

(assert (=> b!216056 (= e!146960 (= (= (bvand (bvlshr (_1!9896 lt!341583) lt!341585) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!9891 (readBitPure!0 lt!340219))))))

(assert (=> b!216056 (and (bvsge lt!341585 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!341585 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!216056 (= lt!341585 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(assert (= (and d!72811 c!10545) b!216052))

(assert (= (and d!72811 (not c!10545)) b!216054))

(assert (= (and d!72811 res!181761) b!216050))

(assert (= (and b!216050 res!181763) b!216053))

(assert (= (and b!216053 res!181764) b!216051))

(assert (= (and b!216051 res!181760) b!216055))

(assert (= (and b!216055 (not res!181762)) b!216056))

(declare-fun m!332799 () Bool)

(assert (=> b!216050 m!332799))

(declare-fun m!332801 () Bool)

(assert (=> b!216050 m!332801))

(declare-fun m!332803 () Bool)

(assert (=> b!216056 m!332803))

(declare-fun m!332805 () Bool)

(assert (=> b!216054 m!332805))

(declare-fun m!332807 () Bool)

(assert (=> b!216054 m!332807))

(assert (=> b!216051 m!331717))

(assert (=> b!216053 m!332343))

(assert (=> d!72487 d!72811))

(declare-fun d!72813 () Bool)

(declare-fun e!146962 () Bool)

(assert (=> d!72813 e!146962))

(declare-fun res!181766 () Bool)

(assert (=> d!72813 (=> (not res!181766) (not e!146962))))

(declare-fun lt!341589 () (_ BitVec 64))

(declare-fun lt!341588 () (_ BitVec 64))

(declare-fun lt!341587 () (_ BitVec 64))

(assert (=> d!72813 (= res!181766 (= lt!341587 (bvsub lt!341588 lt!341589)))))

(assert (=> d!72813 (or (= (bvand lt!341588 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!341589 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!341588 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!341588 lt!341589) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72813 (= lt!341589 (remainingBits!0 ((_ sign_extend 32) (size!4655 (buf!5190 (_1!9891 lt!341099)))) ((_ sign_extend 32) (currentByte!9768 (_1!9891 lt!341099))) ((_ sign_extend 32) (currentBit!9763 (_1!9891 lt!341099)))))))

(declare-fun lt!341590 () (_ BitVec 64))

(declare-fun lt!341591 () (_ BitVec 64))

(assert (=> d!72813 (= lt!341588 (bvmul lt!341590 lt!341591))))

(assert (=> d!72813 (or (= lt!341590 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!341591 (bvsdiv (bvmul lt!341590 lt!341591) lt!341590)))))

(assert (=> d!72813 (= lt!341591 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!72813 (= lt!341590 ((_ sign_extend 32) (size!4655 (buf!5190 (_1!9891 lt!341099)))))))

(assert (=> d!72813 (= lt!341587 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9768 (_1!9891 lt!341099))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9763 (_1!9891 lt!341099)))))))

(assert (=> d!72813 (invariant!0 (currentBit!9763 (_1!9891 lt!341099)) (currentByte!9768 (_1!9891 lt!341099)) (size!4655 (buf!5190 (_1!9891 lt!341099))))))

(assert (=> d!72813 (= (bitIndex!0 (size!4655 (buf!5190 (_1!9891 lt!341099))) (currentByte!9768 (_1!9891 lt!341099)) (currentBit!9763 (_1!9891 lt!341099))) lt!341587)))

(declare-fun b!216057 () Bool)

(declare-fun res!181765 () Bool)

(assert (=> b!216057 (=> (not res!181765) (not e!146962))))

(assert (=> b!216057 (= res!181765 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!341587))))

(declare-fun b!216058 () Bool)

(declare-fun lt!341586 () (_ BitVec 64))

(assert (=> b!216058 (= e!146962 (bvsle lt!341587 (bvmul lt!341586 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!216058 (or (= lt!341586 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!341586 #b0000000000000000000000000000000000000000000000000000000000001000) lt!341586)))))

(assert (=> b!216058 (= lt!341586 ((_ sign_extend 32) (size!4655 (buf!5190 (_1!9891 lt!341099)))))))

(assert (= (and d!72813 res!181766) b!216057))

(assert (= (and b!216057 res!181765) b!216058))

(declare-fun m!332809 () Bool)

(assert (=> d!72813 m!332809))

(declare-fun m!332811 () Bool)

(assert (=> d!72813 m!332811))

(assert (=> b!215821 d!72813))

(declare-fun d!72815 () Bool)

(declare-fun e!146963 () Bool)

(assert (=> d!72815 e!146963))

(declare-fun res!181768 () Bool)

(assert (=> d!72815 (=> (not res!181768) (not e!146963))))

(declare-fun lt!341593 () (_ BitVec 64))

(declare-fun lt!341594 () (_ BitVec 64))

(declare-fun lt!341595 () (_ BitVec 64))

(assert (=> d!72815 (= res!181768 (= lt!341593 (bvsub lt!341594 lt!341595)))))

(assert (=> d!72815 (or (= (bvand lt!341594 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!341595 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!341594 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!341594 lt!341595) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72815 (= lt!341595 (remainingBits!0 ((_ sign_extend 32) (size!4655 (buf!5190 (_2!9888 lt!341070)))) ((_ sign_extend 32) (currentByte!9768 (_2!9888 lt!341070))) ((_ sign_extend 32) (currentBit!9763 (_2!9888 lt!341070)))))))

(declare-fun lt!341596 () (_ BitVec 64))

(declare-fun lt!341597 () (_ BitVec 64))

(assert (=> d!72815 (= lt!341594 (bvmul lt!341596 lt!341597))))

(assert (=> d!72815 (or (= lt!341596 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!341597 (bvsdiv (bvmul lt!341596 lt!341597) lt!341596)))))

(assert (=> d!72815 (= lt!341597 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!72815 (= lt!341596 ((_ sign_extend 32) (size!4655 (buf!5190 (_2!9888 lt!341070)))))))

(assert (=> d!72815 (= lt!341593 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9768 (_2!9888 lt!341070))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9763 (_2!9888 lt!341070)))))))

(assert (=> d!72815 (invariant!0 (currentBit!9763 (_2!9888 lt!341070)) (currentByte!9768 (_2!9888 lt!341070)) (size!4655 (buf!5190 (_2!9888 lt!341070))))))

(assert (=> d!72815 (= (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!341070))) (currentByte!9768 (_2!9888 lt!341070)) (currentBit!9763 (_2!9888 lt!341070))) lt!341593)))

(declare-fun b!216059 () Bool)

(declare-fun res!181767 () Bool)

(assert (=> b!216059 (=> (not res!181767) (not e!146963))))

(assert (=> b!216059 (= res!181767 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!341593))))

(declare-fun b!216060 () Bool)

(declare-fun lt!341592 () (_ BitVec 64))

(assert (=> b!216060 (= e!146963 (bvsle lt!341593 (bvmul lt!341592 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!216060 (or (= lt!341592 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!341592 #b0000000000000000000000000000000000000000000000000000000000001000) lt!341592)))))

(assert (=> b!216060 (= lt!341592 ((_ sign_extend 32) (size!4655 (buf!5190 (_2!9888 lt!341070)))))))

(assert (= (and d!72815 res!181768) b!216059))

(assert (= (and b!216059 res!181767) b!216060))

(declare-fun m!332813 () Bool)

(assert (=> d!72815 m!332813))

(assert (=> d!72815 m!332715))

(assert (=> b!215821 d!72815))

(declare-fun d!72817 () Bool)

(assert (=> d!72817 (validate_offset_bits!1 ((_ sign_extend 32) (size!4655 (buf!5190 (_2!9888 lt!341061)))) ((_ sign_extend 32) (currentByte!9768 (_2!9888 lt!340226))) ((_ sign_extend 32) (currentBit!9763 (_2!9888 lt!340226))) lt!341057)))

(declare-fun lt!341598 () Unit!15294)

(assert (=> d!72817 (= lt!341598 (choose!9 (_2!9888 lt!340226) (buf!5190 (_2!9888 lt!341061)) lt!341057 (BitStream!8419 (buf!5190 (_2!9888 lt!341061)) (currentByte!9768 (_2!9888 lt!340226)) (currentBit!9763 (_2!9888 lt!340226)))))))

(assert (=> d!72817 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9888 lt!340226) (buf!5190 (_2!9888 lt!341061)) lt!341057) lt!341598)))

(declare-fun bs!17846 () Bool)

(assert (= bs!17846 d!72817))

(assert (=> bs!17846 m!332345))

(declare-fun m!332815 () Bool)

(assert (=> bs!17846 m!332815))

(assert (=> b!215819 d!72817))

(declare-fun lt!341599 () tuple2!18482)

(declare-fun d!72819 () Bool)

(assert (=> d!72819 (= lt!341599 (readNBitsLSBFirstsLoop!0 (_1!9889 lt!341079) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(assert (=> d!72819 (= (readNBitsLSBFirstsLoopPure!0 (_1!9889 lt!341079) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))) (tuple2!18471 (_2!9896 lt!341599) (_1!9896 lt!341599)))))

(declare-fun bs!17847 () Bool)

(assert (= bs!17847 d!72819))

(declare-fun m!332817 () Bool)

(assert (=> bs!17847 m!332817))

(assert (=> b!215819 d!72819))

(declare-fun b!216061 () Bool)

(declare-fun res!181771 () Bool)

(declare-fun e!146965 () Bool)

(assert (=> b!216061 (=> (not res!181771) (not e!146965))))

(declare-fun lt!341606 () tuple2!18468)

(assert (=> b!216061 (= res!181771 (isPrefixOf!0 (_2!9889 lt!341606) (_2!9888 lt!341061)))))

(declare-fun lt!341602 () (_ BitVec 64))

(declare-fun lt!341600 () (_ BitVec 64))

(declare-fun b!216062 () Bool)

(assert (=> b!216062 (= e!146965 (= (_1!9889 lt!341606) (withMovedBitIndex!0 (_2!9889 lt!341606) (bvsub lt!341602 lt!341600))))))

(assert (=> b!216062 (or (= (bvand lt!341602 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!341600 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!341602 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!341602 lt!341600) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!216062 (= lt!341600 (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!341061))) (currentByte!9768 (_2!9888 lt!341061)) (currentBit!9763 (_2!9888 lt!341061))))))

(assert (=> b!216062 (= lt!341602 (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!340226))) (currentByte!9768 (_2!9888 lt!340226)) (currentBit!9763 (_2!9888 lt!340226))))))

(declare-fun b!216063 () Bool)

(declare-fun e!146964 () Unit!15294)

(declare-fun Unit!15343 () Unit!15294)

(assert (=> b!216063 (= e!146964 Unit!15343)))

(declare-fun b!216064 () Bool)

(declare-fun res!181770 () Bool)

(assert (=> b!216064 (=> (not res!181770) (not e!146965))))

(assert (=> b!216064 (= res!181770 (isPrefixOf!0 (_1!9889 lt!341606) (_2!9888 lt!340226)))))

(declare-fun b!216065 () Bool)

(declare-fun lt!341613 () Unit!15294)

(assert (=> b!216065 (= e!146964 lt!341613)))

(declare-fun lt!341618 () (_ BitVec 64))

(assert (=> b!216065 (= lt!341618 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!341610 () (_ BitVec 64))

(assert (=> b!216065 (= lt!341610 (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!340226))) (currentByte!9768 (_2!9888 lt!340226)) (currentBit!9763 (_2!9888 lt!340226))))))

(assert (=> b!216065 (= lt!341613 (arrayBitRangesEqSymmetric!0 (buf!5190 (_2!9888 lt!340226)) (buf!5190 (_2!9888 lt!341061)) lt!341618 lt!341610))))

(assert (=> b!216065 (arrayBitRangesEq!0 (buf!5190 (_2!9888 lt!341061)) (buf!5190 (_2!9888 lt!340226)) lt!341618 lt!341610)))

(declare-fun d!72821 () Bool)

(assert (=> d!72821 e!146965))

(declare-fun res!181769 () Bool)

(assert (=> d!72821 (=> (not res!181769) (not e!146965))))

(assert (=> d!72821 (= res!181769 (isPrefixOf!0 (_1!9889 lt!341606) (_2!9889 lt!341606)))))

(declare-fun lt!341603 () BitStream!8418)

(assert (=> d!72821 (= lt!341606 (tuple2!18469 lt!341603 (_2!9888 lt!341061)))))

(declare-fun lt!341611 () Unit!15294)

(declare-fun lt!341616 () Unit!15294)

(assert (=> d!72821 (= lt!341611 lt!341616)))

(assert (=> d!72821 (isPrefixOf!0 lt!341603 (_2!9888 lt!341061))))

(assert (=> d!72821 (= lt!341616 (lemmaIsPrefixTransitive!0 lt!341603 (_2!9888 lt!341061) (_2!9888 lt!341061)))))

(declare-fun lt!341619 () Unit!15294)

(declare-fun lt!341604 () Unit!15294)

(assert (=> d!72821 (= lt!341619 lt!341604)))

(assert (=> d!72821 (isPrefixOf!0 lt!341603 (_2!9888 lt!341061))))

(assert (=> d!72821 (= lt!341604 (lemmaIsPrefixTransitive!0 lt!341603 (_2!9888 lt!340226) (_2!9888 lt!341061)))))

(declare-fun lt!341605 () Unit!15294)

(assert (=> d!72821 (= lt!341605 e!146964)))

(declare-fun c!10546 () Bool)

(assert (=> d!72821 (= c!10546 (not (= (size!4655 (buf!5190 (_2!9888 lt!340226))) #b00000000000000000000000000000000)))))

(declare-fun lt!341601 () Unit!15294)

(declare-fun lt!341608 () Unit!15294)

(assert (=> d!72821 (= lt!341601 lt!341608)))

(assert (=> d!72821 (isPrefixOf!0 (_2!9888 lt!341061) (_2!9888 lt!341061))))

(assert (=> d!72821 (= lt!341608 (lemmaIsPrefixRefl!0 (_2!9888 lt!341061)))))

(declare-fun lt!341607 () Unit!15294)

(declare-fun lt!341614 () Unit!15294)

(assert (=> d!72821 (= lt!341607 lt!341614)))

(assert (=> d!72821 (= lt!341614 (lemmaIsPrefixRefl!0 (_2!9888 lt!341061)))))

(declare-fun lt!341617 () Unit!15294)

(declare-fun lt!341612 () Unit!15294)

(assert (=> d!72821 (= lt!341617 lt!341612)))

(assert (=> d!72821 (isPrefixOf!0 lt!341603 lt!341603)))

(assert (=> d!72821 (= lt!341612 (lemmaIsPrefixRefl!0 lt!341603))))

(declare-fun lt!341609 () Unit!15294)

(declare-fun lt!341615 () Unit!15294)

(assert (=> d!72821 (= lt!341609 lt!341615)))

(assert (=> d!72821 (isPrefixOf!0 (_2!9888 lt!340226) (_2!9888 lt!340226))))

(assert (=> d!72821 (= lt!341615 (lemmaIsPrefixRefl!0 (_2!9888 lt!340226)))))

(assert (=> d!72821 (= lt!341603 (BitStream!8419 (buf!5190 (_2!9888 lt!341061)) (currentByte!9768 (_2!9888 lt!340226)) (currentBit!9763 (_2!9888 lt!340226))))))

(assert (=> d!72821 (isPrefixOf!0 (_2!9888 lt!340226) (_2!9888 lt!341061))))

(assert (=> d!72821 (= (reader!0 (_2!9888 lt!340226) (_2!9888 lt!341061)) lt!341606)))

(assert (= (and d!72821 c!10546) b!216065))

(assert (= (and d!72821 (not c!10546)) b!216063))

(assert (= (and d!72821 res!181769) b!216064))

(assert (= (and b!216064 res!181770) b!216061))

(assert (= (and b!216061 res!181771) b!216062))

(assert (=> b!216065 m!331713))

(declare-fun m!332819 () Bool)

(assert (=> b!216065 m!332819))

(declare-fun m!332821 () Bool)

(assert (=> b!216065 m!332821))

(declare-fun m!332823 () Bool)

(assert (=> b!216062 m!332823))

(assert (=> b!216062 m!332351))

(assert (=> b!216062 m!331713))

(declare-fun m!332825 () Bool)

(assert (=> b!216061 m!332825))

(declare-fun m!332827 () Bool)

(assert (=> d!72821 m!332827))

(declare-fun m!332829 () Bool)

(assert (=> d!72821 m!332829))

(declare-fun m!332831 () Bool)

(assert (=> d!72821 m!332831))

(declare-fun m!332833 () Bool)

(assert (=> d!72821 m!332833))

(declare-fun m!332835 () Bool)

(assert (=> d!72821 m!332835))

(declare-fun m!332837 () Bool)

(assert (=> d!72821 m!332837))

(assert (=> d!72821 m!332427))

(assert (=> d!72821 m!331927))

(declare-fun m!332839 () Bool)

(assert (=> d!72821 m!332839))

(assert (=> d!72821 m!331931))

(declare-fun m!332841 () Bool)

(assert (=> d!72821 m!332841))

(declare-fun m!332843 () Bool)

(assert (=> b!216064 m!332843))

(assert (=> b!215819 d!72821))

(assert (=> b!215819 d!72481))

(declare-fun d!72823 () Bool)

(assert (=> d!72823 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4655 (buf!5190 (_2!9888 lt!341061)))) ((_ sign_extend 32) (currentByte!9768 (_2!9888 lt!340226))) ((_ sign_extend 32) (currentBit!9763 (_2!9888 lt!340226))) lt!341057) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4655 (buf!5190 (_2!9888 lt!341061)))) ((_ sign_extend 32) (currentByte!9768 (_2!9888 lt!340226))) ((_ sign_extend 32) (currentBit!9763 (_2!9888 lt!340226)))) lt!341057))))

(declare-fun bs!17848 () Bool)

(assert (= bs!17848 d!72823))

(declare-fun m!332845 () Bool)

(assert (=> bs!17848 m!332845))

(assert (=> b!215819 d!72823))

(declare-fun d!72825 () Bool)

(assert (=> d!72825 (= (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvadd #b00000000000000000000000000000001 i!590)))))))

(assert (=> b!215819 d!72825))

(assert (=> b!215596 d!72529))

(declare-fun d!72827 () Bool)

(assert (=> d!72827 (arrayBitRangesEq!0 (buf!5190 (_2!9888 lt!340213)) (buf!5190 (_2!9888 lt!340226)) lt!340434 lt!340426)))

(declare-fun lt!341620 () Unit!15294)

(assert (=> d!72827 (= lt!341620 (choose!8 (buf!5190 (_2!9888 lt!340226)) (buf!5190 (_2!9888 lt!340213)) lt!340434 lt!340426))))

(assert (=> d!72827 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!340434) (bvsle lt!340434 lt!340426))))

(assert (=> d!72827 (= (arrayBitRangesEqSymmetric!0 (buf!5190 (_2!9888 lt!340226)) (buf!5190 (_2!9888 lt!340213)) lt!340434 lt!340426) lt!341620)))

(declare-fun bs!17849 () Bool)

(assert (= bs!17849 d!72827))

(assert (=> bs!17849 m!331909))

(declare-fun m!332847 () Bool)

(assert (=> bs!17849 m!332847))

(assert (=> b!215596 d!72827))

(declare-fun b!216066 () Bool)

(declare-fun e!146971 () Bool)

(declare-fun call!3374 () Bool)

(assert (=> b!216066 (= e!146971 call!3374)))

(declare-fun lt!341622 () tuple4!278)

(declare-fun bm!3371 () Bool)

(declare-fun lt!341623 () (_ BitVec 32))

(declare-fun c!10547 () Bool)

(declare-fun lt!341621 () (_ BitVec 32))

(assert (=> bm!3371 (= call!3374 (byteRangesEq!0 (ite c!10547 (select (arr!5585 (buf!5190 (_2!9888 lt!340213))) (_3!655 lt!341622)) (select (arr!5585 (buf!5190 (_2!9888 lt!340213))) (_4!139 lt!341622))) (ite c!10547 (select (arr!5585 (buf!5190 (_2!9888 lt!340226))) (_3!655 lt!341622)) (select (arr!5585 (buf!5190 (_2!9888 lt!340226))) (_4!139 lt!341622))) (ite c!10547 lt!341621 #b00000000000000000000000000000000) lt!341623))))

(declare-fun b!216067 () Bool)

(declare-fun e!146969 () Bool)

(assert (=> b!216067 (= e!146969 call!3374)))

(declare-fun b!216068 () Bool)

(declare-fun e!146967 () Bool)

(assert (=> b!216068 (= e!146971 e!146967)))

(declare-fun res!181772 () Bool)

(assert (=> b!216068 (= res!181772 (byteRangesEq!0 (select (arr!5585 (buf!5190 (_2!9888 lt!340213))) (_3!655 lt!341622)) (select (arr!5585 (buf!5190 (_2!9888 lt!340226))) (_3!655 lt!341622)) lt!341621 #b00000000000000000000000000001000))))

(assert (=> b!216068 (=> (not res!181772) (not e!146967))))

(declare-fun d!72829 () Bool)

(declare-fun res!181776 () Bool)

(declare-fun e!146968 () Bool)

(assert (=> d!72829 (=> res!181776 e!146968)))

(assert (=> d!72829 (= res!181776 (bvsge lt!340434 lt!340426))))

(assert (=> d!72829 (= (arrayBitRangesEq!0 (buf!5190 (_2!9888 lt!340213)) (buf!5190 (_2!9888 lt!340226)) lt!340434 lt!340426) e!146968)))

(declare-fun b!216069 () Bool)

(declare-fun e!146966 () Bool)

(assert (=> b!216069 (= e!146968 e!146966)))

(declare-fun res!181774 () Bool)

(assert (=> b!216069 (=> (not res!181774) (not e!146966))))

(declare-fun e!146970 () Bool)

(assert (=> b!216069 (= res!181774 e!146970)))

(declare-fun res!181775 () Bool)

(assert (=> b!216069 (=> res!181775 e!146970)))

(assert (=> b!216069 (= res!181775 (bvsge (_1!9902 lt!341622) (_2!9902 lt!341622)))))

(assert (=> b!216069 (= lt!341623 ((_ extract 31 0) (bvsrem lt!340426 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!216069 (= lt!341621 ((_ extract 31 0) (bvsrem lt!340434 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!216069 (= lt!341622 (arrayBitIndices!0 lt!340434 lt!340426))))

(declare-fun b!216070 () Bool)

(declare-fun res!181773 () Bool)

(assert (=> b!216070 (= res!181773 (= lt!341623 #b00000000000000000000000000000000))))

(assert (=> b!216070 (=> res!181773 e!146969)))

(assert (=> b!216070 (= e!146967 e!146969)))

(declare-fun b!216071 () Bool)

(assert (=> b!216071 (= e!146970 (arrayRangesEq!701 (buf!5190 (_2!9888 lt!340213)) (buf!5190 (_2!9888 lt!340226)) (_1!9902 lt!341622) (_2!9902 lt!341622)))))

(declare-fun b!216072 () Bool)

(assert (=> b!216072 (= e!146966 e!146971)))

(assert (=> b!216072 (= c!10547 (= (_3!655 lt!341622) (_4!139 lt!341622)))))

(assert (= (and d!72829 (not res!181776)) b!216069))

(assert (= (and b!216069 (not res!181775)) b!216071))

(assert (= (and b!216069 res!181774) b!216072))

(assert (= (and b!216072 c!10547) b!216066))

(assert (= (and b!216072 (not c!10547)) b!216068))

(assert (= (and b!216068 res!181772) b!216070))

(assert (= (and b!216070 (not res!181773)) b!216067))

(assert (= (or b!216066 b!216067) bm!3371))

(declare-fun m!332849 () Bool)

(assert (=> bm!3371 m!332849))

(declare-fun m!332851 () Bool)

(assert (=> bm!3371 m!332851))

(declare-fun m!332853 () Bool)

(assert (=> bm!3371 m!332853))

(declare-fun m!332855 () Bool)

(assert (=> bm!3371 m!332855))

(declare-fun m!332857 () Bool)

(assert (=> bm!3371 m!332857))

(assert (=> b!216068 m!332851))

(assert (=> b!216068 m!332853))

(assert (=> b!216068 m!332851))

(assert (=> b!216068 m!332853))

(declare-fun m!332859 () Bool)

(assert (=> b!216068 m!332859))

(declare-fun m!332861 () Bool)

(assert (=> b!216069 m!332861))

(declare-fun m!332863 () Bool)

(assert (=> b!216071 m!332863))

(assert (=> b!215596 d!72829))

(assert (=> d!72509 d!72517))

(declare-fun d!72831 () Bool)

(assert (=> d!72831 (validate_offset_bits!1 ((_ sign_extend 32) (size!4655 (buf!5190 (_2!9888 lt!340213)))) ((_ sign_extend 32) (currentByte!9768 thiss!1204)) ((_ sign_extend 32) (currentBit!9763 thiss!1204)) lt!340225)))

(assert (=> d!72831 true))

(declare-fun _$6!391 () Unit!15294)

(assert (=> d!72831 (= (choose!9 thiss!1204 (buf!5190 (_2!9888 lt!340213)) lt!340225 (BitStream!8419 (buf!5190 (_2!9888 lt!340213)) (currentByte!9768 thiss!1204) (currentBit!9763 thiss!1204))) _$6!391)))

(declare-fun bs!17850 () Bool)

(assert (= bs!17850 d!72831))

(assert (=> bs!17850 m!331723))

(assert (=> d!72509 d!72831))

(assert (=> b!215815 d!72755))

(declare-fun d!72833 () Bool)

(declare-fun lt!341624 () tuple2!18484)

(assert (=> d!72833 (= lt!341624 (readBit!0 (readerFrom!0 (_2!9888 lt!341112) (currentBit!9763 thiss!1204) (currentByte!9768 thiss!1204))))))

(assert (=> d!72833 (= (readBitPure!0 (readerFrom!0 (_2!9888 lt!341112) (currentBit!9763 thiss!1204) (currentByte!9768 thiss!1204))) (tuple2!18473 (_2!9897 lt!341624) (_1!9897 lt!341624)))))

(declare-fun bs!17851 () Bool)

(assert (= bs!17851 d!72833))

(assert (=> bs!17851 m!332439))

(declare-fun m!332865 () Bool)

(assert (=> bs!17851 m!332865))

(assert (=> b!215838 d!72833))

(declare-fun d!72835 () Bool)

(declare-fun e!146972 () Bool)

(assert (=> d!72835 e!146972))

(declare-fun res!181777 () Bool)

(assert (=> d!72835 (=> (not res!181777) (not e!146972))))

(assert (=> d!72835 (= res!181777 (invariant!0 (currentBit!9763 (_2!9888 lt!341112)) (currentByte!9768 (_2!9888 lt!341112)) (size!4655 (buf!5190 (_2!9888 lt!341112)))))))

(assert (=> d!72835 (= (readerFrom!0 (_2!9888 lt!341112) (currentBit!9763 thiss!1204) (currentByte!9768 thiss!1204)) (BitStream!8419 (buf!5190 (_2!9888 lt!341112)) (currentByte!9768 thiss!1204) (currentBit!9763 thiss!1204)))))

(declare-fun b!216073 () Bool)

(assert (=> b!216073 (= e!146972 (invariant!0 (currentBit!9763 thiss!1204) (currentByte!9768 thiss!1204) (size!4655 (buf!5190 (_2!9888 lt!341112)))))))

(assert (= (and d!72835 res!181777) b!216073))

(declare-fun m!332867 () Bool)

(assert (=> d!72835 m!332867))

(declare-fun m!332869 () Bool)

(assert (=> b!216073 m!332869))

(assert (=> b!215838 d!72835))

(declare-fun d!72837 () Bool)

(declare-fun res!181778 () Bool)

(declare-fun e!146973 () Bool)

(assert (=> d!72837 (=> (not res!181778) (not e!146973))))

(assert (=> d!72837 (= res!181778 (= (size!4655 (buf!5190 (_2!9889 lt!340422))) (size!4655 (buf!5190 (_2!9888 lt!340213)))))))

(assert (=> d!72837 (= (isPrefixOf!0 (_2!9889 lt!340422) (_2!9888 lt!340213)) e!146973)))

(declare-fun b!216074 () Bool)

(declare-fun res!181780 () Bool)

(assert (=> b!216074 (=> (not res!181780) (not e!146973))))

(assert (=> b!216074 (= res!181780 (bvsle (bitIndex!0 (size!4655 (buf!5190 (_2!9889 lt!340422))) (currentByte!9768 (_2!9889 lt!340422)) (currentBit!9763 (_2!9889 lt!340422))) (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!340213))) (currentByte!9768 (_2!9888 lt!340213)) (currentBit!9763 (_2!9888 lt!340213)))))))

(declare-fun b!216075 () Bool)

(declare-fun e!146974 () Bool)

(assert (=> b!216075 (= e!146973 e!146974)))

(declare-fun res!181779 () Bool)

(assert (=> b!216075 (=> res!181779 e!146974)))

(assert (=> b!216075 (= res!181779 (= (size!4655 (buf!5190 (_2!9889 lt!340422))) #b00000000000000000000000000000000))))

(declare-fun b!216076 () Bool)

(assert (=> b!216076 (= e!146974 (arrayBitRangesEq!0 (buf!5190 (_2!9889 lt!340422)) (buf!5190 (_2!9888 lt!340213)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4655 (buf!5190 (_2!9889 lt!340422))) (currentByte!9768 (_2!9889 lt!340422)) (currentBit!9763 (_2!9889 lt!340422)))))))

(assert (= (and d!72837 res!181778) b!216074))

(assert (= (and b!216074 res!181780) b!216075))

(assert (= (and b!216075 (not res!181779)) b!216076))

(assert (=> b!216074 m!332709))

(assert (=> b!216074 m!331763))

(assert (=> b!216076 m!332709))

(assert (=> b!216076 m!332709))

(declare-fun m!332871 () Bool)

(assert (=> b!216076 m!332871))

(assert (=> b!215592 d!72837))

(assert (=> d!72549 d!72547))

(declare-fun d!72839 () Bool)

(assert (=> d!72839 (isPrefixOf!0 thiss!1204 (_2!9888 lt!340213))))

(assert (=> d!72839 true))

(declare-fun _$15!306 () Unit!15294)

(assert (=> d!72839 (= (choose!30 thiss!1204 (_2!9888 lt!340226) (_2!9888 lt!340213)) _$15!306)))

(declare-fun bs!17852 () Bool)

(assert (= bs!17852 d!72839))

(assert (=> bs!17852 m!331765))

(assert (=> d!72549 d!72839))

(assert (=> d!72549 d!72475))

(declare-fun d!72841 () Bool)

(assert (=> d!72841 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4655 (buf!5190 (_2!9888 lt!340226)))) ((_ sign_extend 32) (currentByte!9768 (_2!9888 lt!340226))) ((_ sign_extend 32) (currentBit!9763 (_2!9888 lt!340226))) lt!341057) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4655 (buf!5190 (_2!9888 lt!340226)))) ((_ sign_extend 32) (currentByte!9768 (_2!9888 lt!340226))) ((_ sign_extend 32) (currentBit!9763 (_2!9888 lt!340226)))) lt!341057))))

(declare-fun bs!17853 () Bool)

(assert (= bs!17853 d!72841))

(assert (=> bs!17853 m!331999))

(assert (=> b!215813 d!72841))

(declare-fun d!72843 () Bool)

(declare-fun e!146975 () Bool)

(assert (=> d!72843 e!146975))

(declare-fun res!181782 () Bool)

(assert (=> d!72843 (=> (not res!181782) (not e!146975))))

(declare-fun lt!341626 () (_ BitVec 64))

(declare-fun lt!341627 () (_ BitVec 64))

(declare-fun lt!341628 () (_ BitVec 64))

(assert (=> d!72843 (= res!181782 (= lt!341626 (bvsub lt!341627 lt!341628)))))

(assert (=> d!72843 (or (= (bvand lt!341627 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!341628 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!341627 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!341627 lt!341628) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72843 (= lt!341628 (remainingBits!0 ((_ sign_extend 32) (size!4655 (buf!5190 (_2!9888 lt!341112)))) ((_ sign_extend 32) (currentByte!9768 (_2!9888 lt!341112))) ((_ sign_extend 32) (currentBit!9763 (_2!9888 lt!341112)))))))

(declare-fun lt!341629 () (_ BitVec 64))

(declare-fun lt!341630 () (_ BitVec 64))

(assert (=> d!72843 (= lt!341627 (bvmul lt!341629 lt!341630))))

(assert (=> d!72843 (or (= lt!341629 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!341630 (bvsdiv (bvmul lt!341629 lt!341630) lt!341629)))))

(assert (=> d!72843 (= lt!341630 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!72843 (= lt!341629 ((_ sign_extend 32) (size!4655 (buf!5190 (_2!9888 lt!341112)))))))

(assert (=> d!72843 (= lt!341626 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9768 (_2!9888 lt!341112))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9763 (_2!9888 lt!341112)))))))

(assert (=> d!72843 (invariant!0 (currentBit!9763 (_2!9888 lt!341112)) (currentByte!9768 (_2!9888 lt!341112)) (size!4655 (buf!5190 (_2!9888 lt!341112))))))

(assert (=> d!72843 (= (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!341112))) (currentByte!9768 (_2!9888 lt!341112)) (currentBit!9763 (_2!9888 lt!341112))) lt!341626)))

(declare-fun b!216077 () Bool)

(declare-fun res!181781 () Bool)

(assert (=> b!216077 (=> (not res!181781) (not e!146975))))

(assert (=> b!216077 (= res!181781 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!341626))))

(declare-fun b!216078 () Bool)

(declare-fun lt!341625 () (_ BitVec 64))

(assert (=> b!216078 (= e!146975 (bvsle lt!341626 (bvmul lt!341625 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!216078 (or (= lt!341625 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!341625 #b0000000000000000000000000000000000000000000000000000000000001000) lt!341625)))))

(assert (=> b!216078 (= lt!341625 ((_ sign_extend 32) (size!4655 (buf!5190 (_2!9888 lt!341112)))))))

(assert (= (and d!72843 res!181782) b!216077))

(assert (= (and b!216077 res!181781) b!216078))

(declare-fun m!332873 () Bool)

(assert (=> d!72843 m!332873))

(assert (=> d!72843 m!332867))

(assert (=> b!215836 d!72843))

(assert (=> b!215836 d!72531))

(declare-fun d!72845 () Bool)

(declare-fun res!181783 () Bool)

(declare-fun e!146976 () Bool)

(assert (=> d!72845 (=> (not res!181783) (not e!146976))))

(assert (=> d!72845 (= res!181783 (= (size!4655 (buf!5190 (_2!9888 lt!340226))) (size!4655 (buf!5190 (_2!9888 lt!341061)))))))

(assert (=> d!72845 (= (isPrefixOf!0 (_2!9888 lt!340226) (_2!9888 lt!341061)) e!146976)))

(declare-fun b!216079 () Bool)

(declare-fun res!181785 () Bool)

(assert (=> b!216079 (=> (not res!181785) (not e!146976))))

(assert (=> b!216079 (= res!181785 (bvsle (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!340226))) (currentByte!9768 (_2!9888 lt!340226)) (currentBit!9763 (_2!9888 lt!340226))) (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!341061))) (currentByte!9768 (_2!9888 lt!341061)) (currentBit!9763 (_2!9888 lt!341061)))))))

(declare-fun b!216080 () Bool)

(declare-fun e!146977 () Bool)

(assert (=> b!216080 (= e!146976 e!146977)))

(declare-fun res!181784 () Bool)

(assert (=> b!216080 (=> res!181784 e!146977)))

(assert (=> b!216080 (= res!181784 (= (size!4655 (buf!5190 (_2!9888 lt!340226))) #b00000000000000000000000000000000))))

(declare-fun b!216081 () Bool)

(assert (=> b!216081 (= e!146977 (arrayBitRangesEq!0 (buf!5190 (_2!9888 lt!340226)) (buf!5190 (_2!9888 lt!341061)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!340226))) (currentByte!9768 (_2!9888 lt!340226)) (currentBit!9763 (_2!9888 lt!340226)))))))

(assert (= (and d!72845 res!181783) b!216079))

(assert (= (and b!216079 res!181785) b!216080))

(assert (= (and b!216080 (not res!181784)) b!216081))

(assert (=> b!216079 m!331713))

(assert (=> b!216079 m!332351))

(assert (=> b!216081 m!331713))

(assert (=> b!216081 m!331713))

(declare-fun m!332875 () Bool)

(assert (=> b!216081 m!332875))

(assert (=> b!215811 d!72845))

(declare-fun d!72847 () Bool)

(declare-fun e!146978 () Bool)

(assert (=> d!72847 e!146978))

(declare-fun res!181787 () Bool)

(assert (=> d!72847 (=> (not res!181787) (not e!146978))))

(declare-fun lt!341634 () (_ BitVec 64))

(declare-fun lt!341632 () (_ BitVec 64))

(declare-fun lt!341633 () (_ BitVec 64))

(assert (=> d!72847 (= res!181787 (= lt!341632 (bvsub lt!341633 lt!341634)))))

(assert (=> d!72847 (or (= (bvand lt!341633 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!341634 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!341633 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!341633 lt!341634) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72847 (= lt!341634 (remainingBits!0 ((_ sign_extend 32) (size!4655 (buf!5190 (_1!9891 lt!340445)))) ((_ sign_extend 32) (currentByte!9768 (_1!9891 lt!340445))) ((_ sign_extend 32) (currentBit!9763 (_1!9891 lt!340445)))))))

(declare-fun lt!341635 () (_ BitVec 64))

(declare-fun lt!341636 () (_ BitVec 64))

(assert (=> d!72847 (= lt!341633 (bvmul lt!341635 lt!341636))))

(assert (=> d!72847 (or (= lt!341635 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!341636 (bvsdiv (bvmul lt!341635 lt!341636) lt!341635)))))

(assert (=> d!72847 (= lt!341636 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!72847 (= lt!341635 ((_ sign_extend 32) (size!4655 (buf!5190 (_1!9891 lt!340445)))))))

(assert (=> d!72847 (= lt!341632 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9768 (_1!9891 lt!340445))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9763 (_1!9891 lt!340445)))))))

(assert (=> d!72847 (invariant!0 (currentBit!9763 (_1!9891 lt!340445)) (currentByte!9768 (_1!9891 lt!340445)) (size!4655 (buf!5190 (_1!9891 lt!340445))))))

(assert (=> d!72847 (= (bitIndex!0 (size!4655 (buf!5190 (_1!9891 lt!340445))) (currentByte!9768 (_1!9891 lt!340445)) (currentBit!9763 (_1!9891 lt!340445))) lt!341632)))

(declare-fun b!216082 () Bool)

(declare-fun res!181786 () Bool)

(assert (=> b!216082 (=> (not res!181786) (not e!146978))))

(assert (=> b!216082 (= res!181786 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!341632))))

(declare-fun b!216083 () Bool)

(declare-fun lt!341631 () (_ BitVec 64))

(assert (=> b!216083 (= e!146978 (bvsle lt!341632 (bvmul lt!341631 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!216083 (or (= lt!341631 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!341631 #b0000000000000000000000000000000000000000000000000000000000001000) lt!341631)))))

(assert (=> b!216083 (= lt!341631 ((_ sign_extend 32) (size!4655 (buf!5190 (_1!9891 lt!340445)))))))

(assert (= (and d!72847 res!181787) b!216082))

(assert (= (and b!216082 res!181786) b!216083))

(declare-fun m!332877 () Bool)

(assert (=> d!72847 m!332877))

(declare-fun m!332879 () Bool)

(assert (=> d!72847 m!332879))

(assert (=> d!72503 d!72847))

(declare-fun d!72849 () Bool)

(assert (=> d!72849 (= (invariant!0 (currentBit!9763 lt!340221) (currentByte!9768 lt!340221) (size!4655 (buf!5190 (_2!9888 lt!340213)))) (and (bvsge (currentBit!9763 lt!340221) #b00000000000000000000000000000000) (bvslt (currentBit!9763 lt!340221) #b00000000000000000000000000001000) (bvsge (currentByte!9768 lt!340221) #b00000000000000000000000000000000) (or (bvslt (currentByte!9768 lt!340221) (size!4655 (buf!5190 (_2!9888 lt!340213)))) (and (= (currentBit!9763 lt!340221) #b00000000000000000000000000000000) (= (currentByte!9768 lt!340221) (size!4655 (buf!5190 (_2!9888 lt!340213))))))))))

(assert (=> d!72503 d!72849))

(declare-fun d!72851 () Bool)

(declare-fun e!146979 () Bool)

(assert (=> d!72851 e!146979))

(declare-fun res!181789 () Bool)

(assert (=> d!72851 (=> (not res!181789) (not e!146979))))

(declare-fun lt!341639 () (_ BitVec 64))

(declare-fun lt!341640 () (_ BitVec 64))

(declare-fun lt!341638 () (_ BitVec 64))

(assert (=> d!72851 (= res!181789 (= lt!341638 (bvsub lt!341639 lt!341640)))))

(assert (=> d!72851 (or (= (bvand lt!341639 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!341640 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!341639 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!341639 lt!341640) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72851 (= lt!341640 (remainingBits!0 ((_ sign_extend 32) (size!4655 (buf!5190 (_1!9891 lt!340446)))) ((_ sign_extend 32) (currentByte!9768 (_1!9891 lt!340446))) ((_ sign_extend 32) (currentBit!9763 (_1!9891 lt!340446)))))))

(declare-fun lt!341641 () (_ BitVec 64))

(declare-fun lt!341642 () (_ BitVec 64))

(assert (=> d!72851 (= lt!341639 (bvmul lt!341641 lt!341642))))

(assert (=> d!72851 (or (= lt!341641 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!341642 (bvsdiv (bvmul lt!341641 lt!341642) lt!341641)))))

(assert (=> d!72851 (= lt!341642 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!72851 (= lt!341641 ((_ sign_extend 32) (size!4655 (buf!5190 (_1!9891 lt!340446)))))))

(assert (=> d!72851 (= lt!341638 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9768 (_1!9891 lt!340446))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9763 (_1!9891 lt!340446)))))))

(assert (=> d!72851 (invariant!0 (currentBit!9763 (_1!9891 lt!340446)) (currentByte!9768 (_1!9891 lt!340446)) (size!4655 (buf!5190 (_1!9891 lt!340446))))))

(assert (=> d!72851 (= (bitIndex!0 (size!4655 (buf!5190 (_1!9891 lt!340446))) (currentByte!9768 (_1!9891 lt!340446)) (currentBit!9763 (_1!9891 lt!340446))) lt!341638)))

(declare-fun b!216084 () Bool)

(declare-fun res!181788 () Bool)

(assert (=> b!216084 (=> (not res!181788) (not e!146979))))

(assert (=> b!216084 (= res!181788 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!341638))))

(declare-fun b!216085 () Bool)

(declare-fun lt!341637 () (_ BitVec 64))

(assert (=> b!216085 (= e!146979 (bvsle lt!341638 (bvmul lt!341637 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!216085 (or (= lt!341637 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!341637 #b0000000000000000000000000000000000000000000000000000000000001000) lt!341637)))))

(assert (=> b!216085 (= lt!341637 ((_ sign_extend 32) (size!4655 (buf!5190 (_1!9891 lt!340446)))))))

(assert (= (and d!72851 res!181789) b!216084))

(assert (= (and b!216084 res!181788) b!216085))

(declare-fun m!332881 () Bool)

(assert (=> d!72851 m!332881))

(declare-fun m!332883 () Bool)

(assert (=> d!72851 m!332883))

(assert (=> d!72503 d!72851))

(assert (=> d!72503 d!72523))

(declare-fun d!72853 () Bool)

(declare-fun e!146982 () Bool)

(assert (=> d!72853 e!146982))

(declare-fun res!181792 () Bool)

(assert (=> d!72853 (=> (not res!181792) (not e!146982))))

(declare-fun lt!341651 () tuple2!18472)

(declare-fun lt!341649 () tuple2!18472)

(assert (=> d!72853 (= res!181792 (= (bitIndex!0 (size!4655 (buf!5190 (_1!9891 lt!341651))) (currentByte!9768 (_1!9891 lt!341651)) (currentBit!9763 (_1!9891 lt!341651))) (bitIndex!0 (size!4655 (buf!5190 (_1!9891 lt!341649))) (currentByte!9768 (_1!9891 lt!341649)) (currentBit!9763 (_1!9891 lt!341649)))))))

(declare-fun lt!341650 () BitStream!8418)

(assert (=> d!72853 (= lt!341649 (readBitPure!0 lt!341650))))

(assert (=> d!72853 (= lt!341651 (readBitPure!0 lt!340221))))

(assert (=> d!72853 (= lt!341650 (BitStream!8419 (buf!5190 (_2!9888 lt!340213)) (currentByte!9768 lt!340221) (currentBit!9763 lt!340221)))))

(assert (=> d!72853 (invariant!0 (currentBit!9763 lt!340221) (currentByte!9768 lt!340221) (size!4655 (buf!5190 (_2!9888 lt!340213))))))

(assert (=> d!72853 true))

(declare-fun _$9!87 () Unit!15294)

(assert (=> d!72853 (= (choose!50 lt!340221 (_2!9888 lt!340213) lt!340444 lt!340445 (tuple2!18473 (_1!9891 lt!340445) (_2!9891 lt!340445)) (_1!9891 lt!340445) (_2!9891 lt!340445) lt!340446 (tuple2!18473 (_1!9891 lt!340446) (_2!9891 lt!340446)) (_1!9891 lt!340446) (_2!9891 lt!340446)) _$9!87)))

(declare-fun b!216088 () Bool)

(assert (=> b!216088 (= e!146982 (= (_2!9891 lt!341651) (_2!9891 lt!341649)))))

(assert (= (and d!72853 res!181792) b!216088))

(assert (=> d!72853 m!331943))

(declare-fun m!332885 () Bool)

(assert (=> d!72853 m!332885))

(assert (=> d!72853 m!331733))

(declare-fun m!332887 () Bool)

(assert (=> d!72853 m!332887))

(declare-fun m!332889 () Bool)

(assert (=> d!72853 m!332889))

(assert (=> d!72503 d!72853))

(declare-fun d!72855 () Bool)

(declare-fun lt!341652 () tuple2!18484)

(assert (=> d!72855 (= lt!341652 (readBit!0 lt!340444))))

(assert (=> d!72855 (= (readBitPure!0 lt!340444) (tuple2!18473 (_2!9897 lt!341652) (_1!9897 lt!341652)))))

(declare-fun bs!17854 () Bool)

(assert (= bs!17854 d!72855))

(declare-fun m!332891 () Bool)

(assert (=> bs!17854 m!332891))

(assert (=> d!72503 d!72855))

(declare-fun lt!341653 () tuple2!18482)

(declare-fun d!72857 () Bool)

(assert (=> d!72857 (= lt!341653 (readNBitsLSBFirstsLoop!0 lt!340363 nBits!348 (bvadd i!590 #b00000000000000000000000000000001) lt!340360))))

(assert (=> d!72857 (= (readNBitsLSBFirstsLoopPure!0 lt!340363 nBits!348 (bvadd i!590 #b00000000000000000000000000000001) lt!340360) (tuple2!18471 (_2!9896 lt!341653) (_1!9896 lt!341653)))))

(declare-fun bs!17855 () Bool)

(assert (= bs!17855 d!72857))

(declare-fun m!332893 () Bool)

(assert (=> bs!17855 m!332893))

(assert (=> d!72485 d!72857))

(assert (=> d!72485 d!72489))

(assert (=> d!72485 d!72513))

(declare-fun d!72859 () Bool)

(declare-fun lt!341658 () tuple2!18470)

(declare-fun lt!341659 () tuple2!18470)

(assert (=> d!72859 (and (= (_2!9890 lt!341658) (_2!9890 lt!341659)) (= (_1!9890 lt!341658) (_1!9890 lt!341659)))))

(declare-fun e!146985 () (_ BitVec 64))

(assert (=> d!72859 (= lt!341659 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9889 lt!340215) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd i!590 #b00000000000000000000000000000001) (bvor lt!340240 e!146985)))))

(declare-fun c!10550 () Bool)

(assert (=> d!72859 (= c!10550 (_2!9891 (readBitPure!0 (_1!9889 lt!340215))))))

(assert (=> d!72859 (= lt!341658 (readNBitsLSBFirstsLoopPure!0 (_1!9889 lt!340215) nBits!348 i!590 lt!340240))))

(assert (=> d!72859 true))

(declare-fun _$10!37 () Unit!15294)

(assert (=> d!72859 (= (choose!56 (_1!9889 lt!340215) nBits!348 i!590 lt!340240 lt!340364 (tuple2!18471 (_1!9890 lt!340364) (_2!9890 lt!340364)) (_1!9890 lt!340364) (_2!9890 lt!340364) lt!340362 lt!340363 lt!340360 lt!340361 (tuple2!18471 (_1!9890 lt!340361) (_2!9890 lt!340361)) (_1!9890 lt!340361) (_2!9890 lt!340361)) _$10!37)))

(declare-fun b!216093 () Bool)

(assert (=> b!216093 (= e!146985 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!216094 () Bool)

(assert (=> b!216094 (= e!146985 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (= (and d!72859 c!10550) b!216093))

(assert (= (and d!72859 (not c!10550)) b!216094))

(assert (=> d!72859 m!331779))

(assert (=> d!72859 m!331779))

(declare-fun m!332895 () Bool)

(assert (=> d!72859 m!332895))

(assert (=> d!72859 m!331745))

(assert (=> d!72859 m!331721))

(assert (=> d!72485 d!72859))

(assert (=> d!72485 d!72521))

(declare-fun d!72861 () Bool)

(declare-fun res!181793 () Bool)

(declare-fun e!146986 () Bool)

(assert (=> d!72861 (=> (not res!181793) (not e!146986))))

(assert (=> d!72861 (= res!181793 (= (size!4655 (buf!5190 (_1!9889 lt!340460))) (size!4655 (buf!5190 thiss!1204))))))

(assert (=> d!72861 (= (isPrefixOf!0 (_1!9889 lt!340460) thiss!1204) e!146986)))

(declare-fun b!216095 () Bool)

(declare-fun res!181795 () Bool)

(assert (=> b!216095 (=> (not res!181795) (not e!146986))))

(assert (=> b!216095 (= res!181795 (bvsle (bitIndex!0 (size!4655 (buf!5190 (_1!9889 lt!340460))) (currentByte!9768 (_1!9889 lt!340460)) (currentBit!9763 (_1!9889 lt!340460))) (bitIndex!0 (size!4655 (buf!5190 thiss!1204)) (currentByte!9768 thiss!1204) (currentBit!9763 thiss!1204))))))

(declare-fun b!216096 () Bool)

(declare-fun e!146987 () Bool)

(assert (=> b!216096 (= e!146986 e!146987)))

(declare-fun res!181794 () Bool)

(assert (=> b!216096 (=> res!181794 e!146987)))

(assert (=> b!216096 (= res!181794 (= (size!4655 (buf!5190 (_1!9889 lt!340460))) #b00000000000000000000000000000000))))

(declare-fun b!216097 () Bool)

(assert (=> b!216097 (= e!146987 (arrayBitRangesEq!0 (buf!5190 (_1!9889 lt!340460)) (buf!5190 thiss!1204) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4655 (buf!5190 (_1!9889 lt!340460))) (currentByte!9768 (_1!9889 lt!340460)) (currentBit!9763 (_1!9889 lt!340460)))))))

(assert (= (and d!72861 res!181793) b!216095))

(assert (= (and b!216095 res!181795) b!216096))

(assert (= (and b!216096 (not res!181794)) b!216097))

(assert (=> b!216095 m!332759))

(assert (=> b!216095 m!331715))

(assert (=> b!216097 m!332759))

(assert (=> b!216097 m!332759))

(declare-fun m!332897 () Bool)

(assert (=> b!216097 m!332897))

(assert (=> b!215605 d!72861))

(declare-fun d!72863 () Bool)

(assert (=> d!72863 (= (remainingBits!0 ((_ sign_extend 32) (size!4655 (buf!5190 (_1!9890 lt!340237)))) ((_ sign_extend 32) (currentByte!9768 (_1!9890 lt!340237))) ((_ sign_extend 32) (currentBit!9763 (_1!9890 lt!340237)))) (bvsub (bvmul ((_ sign_extend 32) (size!4655 (buf!5190 (_1!9890 lt!340237)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9768 (_1!9890 lt!340237))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9763 (_1!9890 lt!340237))))))))

(assert (=> d!72717 d!72863))

(declare-fun d!72865 () Bool)

(assert (=> d!72865 (= (invariant!0 (currentBit!9763 (_1!9890 lt!340237)) (currentByte!9768 (_1!9890 lt!340237)) (size!4655 (buf!5190 (_1!9890 lt!340237)))) (and (bvsge (currentBit!9763 (_1!9890 lt!340237)) #b00000000000000000000000000000000) (bvslt (currentBit!9763 (_1!9890 lt!340237)) #b00000000000000000000000000001000) (bvsge (currentByte!9768 (_1!9890 lt!340237)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9768 (_1!9890 lt!340237)) (size!4655 (buf!5190 (_1!9890 lt!340237)))) (and (= (currentBit!9763 (_1!9890 lt!340237)) #b00000000000000000000000000000000) (= (currentByte!9768 (_1!9890 lt!340237)) (size!4655 (buf!5190 (_1!9890 lt!340237))))))))))

(assert (=> d!72717 d!72865))

(declare-fun d!72867 () Bool)

(assert (=> d!72867 (= (remainingBits!0 ((_ sign_extend 32) (size!4655 (buf!5190 (_2!9888 lt!340213)))) ((_ sign_extend 32) (currentByte!9768 (_2!9888 lt!340226))) ((_ sign_extend 32) (currentBit!9763 (_2!9888 lt!340226)))) (bvsub (bvmul ((_ sign_extend 32) (size!4655 (buf!5190 (_2!9888 lt!340213)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9768 (_2!9888 lt!340226))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9763 (_2!9888 lt!340226))))))))

(assert (=> d!72511 d!72867))

(declare-fun b!216098 () Bool)

(declare-fun e!146993 () Bool)

(declare-fun call!3375 () Bool)

(assert (=> b!216098 (= e!146993 call!3375)))

(declare-fun c!10551 () Bool)

(declare-fun lt!341660 () (_ BitVec 32))

(declare-fun bm!3372 () Bool)

(declare-fun lt!341662 () (_ BitVec 32))

(declare-fun lt!341661 () tuple4!278)

(assert (=> bm!3372 (= call!3375 (byteRangesEq!0 (ite c!10551 (select (arr!5585 (buf!5190 thiss!1204)) (_3!655 lt!341661)) (select (arr!5585 (buf!5190 thiss!1204)) (_4!139 lt!341661))) (ite c!10551 (select (arr!5585 (buf!5190 (_2!9888 lt!340213))) (_3!655 lt!341661)) (select (arr!5585 (buf!5190 (_2!9888 lt!340213))) (_4!139 lt!341661))) (ite c!10551 lt!341660 #b00000000000000000000000000000000) lt!341662))))

(declare-fun b!216099 () Bool)

(declare-fun e!146991 () Bool)

(assert (=> b!216099 (= e!146991 call!3375)))

(declare-fun b!216100 () Bool)

(declare-fun e!146989 () Bool)

(assert (=> b!216100 (= e!146993 e!146989)))

(declare-fun res!181796 () Bool)

(assert (=> b!216100 (= res!181796 (byteRangesEq!0 (select (arr!5585 (buf!5190 thiss!1204)) (_3!655 lt!341661)) (select (arr!5585 (buf!5190 (_2!9888 lt!340213))) (_3!655 lt!341661)) lt!341660 #b00000000000000000000000000001000))))

(assert (=> b!216100 (=> (not res!181796) (not e!146989))))

(declare-fun d!72869 () Bool)

(declare-fun res!181800 () Bool)

(declare-fun e!146990 () Bool)

(assert (=> d!72869 (=> res!181800 e!146990)))

(assert (=> d!72869 (= res!181800 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4655 (buf!5190 thiss!1204)) (currentByte!9768 thiss!1204) (currentBit!9763 thiss!1204))))))

(assert (=> d!72869 (= (arrayBitRangesEq!0 (buf!5190 thiss!1204) (buf!5190 (_2!9888 lt!340213)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4655 (buf!5190 thiss!1204)) (currentByte!9768 thiss!1204) (currentBit!9763 thiss!1204))) e!146990)))

(declare-fun b!216101 () Bool)

(declare-fun e!146988 () Bool)

(assert (=> b!216101 (= e!146990 e!146988)))

(declare-fun res!181798 () Bool)

(assert (=> b!216101 (=> (not res!181798) (not e!146988))))

(declare-fun e!146992 () Bool)

(assert (=> b!216101 (= res!181798 e!146992)))

(declare-fun res!181799 () Bool)

(assert (=> b!216101 (=> res!181799 e!146992)))

(assert (=> b!216101 (= res!181799 (bvsge (_1!9902 lt!341661) (_2!9902 lt!341661)))))

(assert (=> b!216101 (= lt!341662 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!4655 (buf!5190 thiss!1204)) (currentByte!9768 thiss!1204) (currentBit!9763 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!216101 (= lt!341660 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!216101 (= lt!341661 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4655 (buf!5190 thiss!1204)) (currentByte!9768 thiss!1204) (currentBit!9763 thiss!1204))))))

(declare-fun b!216102 () Bool)

(declare-fun res!181797 () Bool)

(assert (=> b!216102 (= res!181797 (= lt!341662 #b00000000000000000000000000000000))))

(assert (=> b!216102 (=> res!181797 e!146991)))

(assert (=> b!216102 (= e!146989 e!146991)))

(declare-fun b!216103 () Bool)

(assert (=> b!216103 (= e!146992 (arrayRangesEq!701 (buf!5190 thiss!1204) (buf!5190 (_2!9888 lt!340213)) (_1!9902 lt!341661) (_2!9902 lt!341661)))))

(declare-fun b!216104 () Bool)

(assert (=> b!216104 (= e!146988 e!146993)))

(assert (=> b!216104 (= c!10551 (= (_3!655 lt!341661) (_4!139 lt!341661)))))

(assert (= (and d!72869 (not res!181800)) b!216101))

(assert (= (and b!216101 (not res!181799)) b!216103))

(assert (= (and b!216101 res!181798) b!216104))

(assert (= (and b!216104 c!10551) b!216098))

(assert (= (and b!216104 (not c!10551)) b!216100))

(assert (= (and b!216100 res!181796) b!216102))

(assert (= (and b!216102 (not res!181797)) b!216099))

(assert (= (or b!216098 b!216099) bm!3372))

(declare-fun m!332899 () Bool)

(assert (=> bm!3372 m!332899))

(declare-fun m!332901 () Bool)

(assert (=> bm!3372 m!332901))

(declare-fun m!332903 () Bool)

(assert (=> bm!3372 m!332903))

(declare-fun m!332905 () Bool)

(assert (=> bm!3372 m!332905))

(declare-fun m!332907 () Bool)

(assert (=> bm!3372 m!332907))

(assert (=> b!216100 m!332901))

(assert (=> b!216100 m!332903))

(assert (=> b!216100 m!332901))

(assert (=> b!216100 m!332903))

(declare-fun m!332909 () Bool)

(assert (=> b!216100 m!332909))

(assert (=> b!216101 m!331715))

(assert (=> b!216101 m!332749))

(declare-fun m!332911 () Bool)

(assert (=> b!216103 m!332911))

(assert (=> b!215621 d!72869))

(assert (=> b!215621 d!72531))

(declare-fun d!72871 () Bool)

(declare-fun e!146994 () Bool)

(assert (=> d!72871 e!146994))

(declare-fun res!181801 () Bool)

(assert (=> d!72871 (=> (not res!181801) (not e!146994))))

(declare-fun lt!341663 () BitStream!8418)

(declare-fun lt!341664 () (_ BitVec 64))

(assert (=> d!72871 (= res!181801 (= (bvadd lt!341664 (bvsub lt!340456 lt!340454)) (bitIndex!0 (size!4655 (buf!5190 lt!341663)) (currentByte!9768 lt!341663) (currentBit!9763 lt!341663))))))

(assert (=> d!72871 (or (not (= (bvand lt!341664 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!340456 lt!340454) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!341664 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!341664 (bvsub lt!340456 lt!340454)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72871 (= lt!341664 (bitIndex!0 (size!4655 (buf!5190 (_2!9889 lt!340460))) (currentByte!9768 (_2!9889 lt!340460)) (currentBit!9763 (_2!9889 lt!340460))))))

(assert (=> d!72871 (= lt!341663 (_2!9888 (moveBitIndex!0 (_2!9889 lt!340460) (bvsub lt!340456 lt!340454))))))

(assert (=> d!72871 (moveBitIndexPrecond!0 (_2!9889 lt!340460) (bvsub lt!340456 lt!340454))))

(assert (=> d!72871 (= (withMovedBitIndex!0 (_2!9889 lt!340460) (bvsub lt!340456 lt!340454)) lt!341663)))

(declare-fun b!216105 () Bool)

(assert (=> b!216105 (= e!146994 (= (size!4655 (buf!5190 (_2!9889 lt!340460))) (size!4655 (buf!5190 lt!341663))))))

(assert (= (and d!72871 res!181801) b!216105))

(declare-fun m!332913 () Bool)

(assert (=> d!72871 m!332913))

(assert (=> d!72871 m!332681))

(declare-fun m!332915 () Bool)

(assert (=> d!72871 m!332915))

(declare-fun m!332917 () Bool)

(assert (=> d!72871 m!332917))

(assert (=> b!215603 d!72871))

(assert (=> b!215603 d!72545))

(assert (=> b!215603 d!72531))

(declare-fun d!72873 () Bool)

(assert (=> d!72873 (= (remainingBits!0 ((_ sign_extend 32) (size!4655 (buf!5190 (_2!9888 lt!340213)))) ((_ sign_extend 32) (currentByte!9768 (_2!9888 lt!340213))) ((_ sign_extend 32) (currentBit!9763 (_2!9888 lt!340213)))) (bvsub (bvmul ((_ sign_extend 32) (size!4655 (buf!5190 (_2!9888 lt!340213)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9768 (_2!9888 lt!340213))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9763 (_2!9888 lt!340213))))))))

(assert (=> d!72545 d!72873))

(assert (=> d!72545 d!72537))

(assert (=> b!215619 d!72531))

(assert (=> b!215619 d!72545))

(declare-fun d!72875 () Bool)

(assert (=> d!72875 (= (remainingBits!0 ((_ sign_extend 32) (size!4655 (buf!5190 (_2!9889 lt!340215)))) ((_ sign_extend 32) (currentByte!9768 (_2!9889 lt!340215))) ((_ sign_extend 32) (currentBit!9763 (_2!9889 lt!340215)))) (bvsub (bvmul ((_ sign_extend 32) (size!4655 (buf!5190 (_2!9889 lt!340215)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9768 (_2!9889 lt!340215))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9763 (_2!9889 lt!340215))))))))

(assert (=> d!72719 d!72875))

(declare-fun d!72877 () Bool)

(assert (=> d!72877 (= (invariant!0 (currentBit!9763 (_2!9889 lt!340215)) (currentByte!9768 (_2!9889 lt!340215)) (size!4655 (buf!5190 (_2!9889 lt!340215)))) (and (bvsge (currentBit!9763 (_2!9889 lt!340215)) #b00000000000000000000000000000000) (bvslt (currentBit!9763 (_2!9889 lt!340215)) #b00000000000000000000000000001000) (bvsge (currentByte!9768 (_2!9889 lt!340215)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9768 (_2!9889 lt!340215)) (size!4655 (buf!5190 (_2!9889 lt!340215)))) (and (= (currentBit!9763 (_2!9889 lt!340215)) #b00000000000000000000000000000000) (= (currentByte!9768 (_2!9889 lt!340215)) (size!4655 (buf!5190 (_2!9889 lt!340215))))))))))

(assert (=> d!72719 d!72877))

(declare-fun d!72879 () Bool)

(assert (=> d!72879 (= (remainingBits!0 ((_ sign_extend 32) (size!4655 (buf!5190 (_2!9888 lt!340213)))) ((_ sign_extend 32) (currentByte!9768 thiss!1204)) ((_ sign_extend 32) (currentBit!9763 thiss!1204))) (bvsub (bvmul ((_ sign_extend 32) (size!4655 (buf!5190 (_2!9888 lt!340213)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9768 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9763 thiss!1204)))))))

(assert (=> d!72517 d!72879))

(declare-fun d!72881 () Bool)

(assert (=> d!72881 (= (invariant!0 (currentBit!9763 (_2!9888 lt!341061)) (currentByte!9768 (_2!9888 lt!341061)) (size!4655 (buf!5190 (_2!9888 lt!341061)))) (and (bvsge (currentBit!9763 (_2!9888 lt!341061)) #b00000000000000000000000000000000) (bvslt (currentBit!9763 (_2!9888 lt!341061)) #b00000000000000000000000000001000) (bvsge (currentByte!9768 (_2!9888 lt!341061)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9768 (_2!9888 lt!341061)) (size!4655 (buf!5190 (_2!9888 lt!341061)))) (and (= (currentBit!9763 (_2!9888 lt!341061)) #b00000000000000000000000000000000) (= (currentByte!9768 (_2!9888 lt!341061)) (size!4655 (buf!5190 (_2!9888 lt!341061))))))))))

(assert (=> d!72551 d!72881))

(declare-fun d!72883 () Bool)

(declare-fun res!181802 () Bool)

(declare-fun e!146995 () Bool)

(assert (=> d!72883 (=> (not res!181802) (not e!146995))))

(assert (=> d!72883 (= res!181802 (= (size!4655 (buf!5190 (_2!9888 lt!340226))) (size!4655 (buf!5190 (ite c!10526 (_2!9888 lt!340226) (_2!9888 lt!341049))))))))

(assert (=> d!72883 (= (isPrefixOf!0 (_2!9888 lt!340226) (ite c!10526 (_2!9888 lt!340226) (_2!9888 lt!341049))) e!146995)))

(declare-fun b!216106 () Bool)

(declare-fun res!181804 () Bool)

(assert (=> b!216106 (=> (not res!181804) (not e!146995))))

(assert (=> b!216106 (= res!181804 (bvsle (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!340226))) (currentByte!9768 (_2!9888 lt!340226)) (currentBit!9763 (_2!9888 lt!340226))) (bitIndex!0 (size!4655 (buf!5190 (ite c!10526 (_2!9888 lt!340226) (_2!9888 lt!341049)))) (currentByte!9768 (ite c!10526 (_2!9888 lt!340226) (_2!9888 lt!341049))) (currentBit!9763 (ite c!10526 (_2!9888 lt!340226) (_2!9888 lt!341049))))))))

(declare-fun b!216107 () Bool)

(declare-fun e!146996 () Bool)

(assert (=> b!216107 (= e!146995 e!146996)))

(declare-fun res!181803 () Bool)

(assert (=> b!216107 (=> res!181803 e!146996)))

(assert (=> b!216107 (= res!181803 (= (size!4655 (buf!5190 (_2!9888 lt!340226))) #b00000000000000000000000000000000))))

(declare-fun b!216108 () Bool)

(assert (=> b!216108 (= e!146996 (arrayBitRangesEq!0 (buf!5190 (_2!9888 lt!340226)) (buf!5190 (ite c!10526 (_2!9888 lt!340226) (_2!9888 lt!341049))) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!340226))) (currentByte!9768 (_2!9888 lt!340226)) (currentBit!9763 (_2!9888 lt!340226)))))))

(assert (= (and d!72883 res!181802) b!216106))

(assert (= (and b!216106 res!181804) b!216107))

(assert (= (and b!216107 (not res!181803)) b!216108))

(assert (=> b!216106 m!331713))

(declare-fun m!332919 () Bool)

(assert (=> b!216106 m!332919))

(assert (=> b!216108 m!331713))

(assert (=> b!216108 m!331713))

(declare-fun m!332921 () Bool)

(assert (=> b!216108 m!332921))

(assert (=> bm!3360 d!72883))

(assert (=> d!72543 d!72493))

(declare-fun d!72885 () Bool)

(declare-fun lt!341665 () tuple2!18482)

(assert (=> d!72885 (= lt!341665 (readNBitsLSBFirstsLoop!0 (_1!9889 lt!341094) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!341069 (ite (_2!9891 lt!341082) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!72885 (= (readNBitsLSBFirstsLoopPure!0 (_1!9889 lt!341094) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!341069 (ite (_2!9891 lt!341082) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!18471 (_2!9896 lt!341665) (_1!9896 lt!341665)))))

(declare-fun bs!17857 () Bool)

(assert (= bs!17857 d!72885))

(declare-fun m!332923 () Bool)

(assert (=> bs!17857 m!332923))

(assert (=> b!215822 d!72885))

(declare-fun b!216109 () Bool)

(declare-fun res!181807 () Bool)

(declare-fun e!146998 () Bool)

(assert (=> b!216109 (=> (not res!181807) (not e!146998))))

(declare-fun lt!341672 () tuple2!18468)

(assert (=> b!216109 (= res!181807 (isPrefixOf!0 (_2!9889 lt!341672) (_2!9888 lt!341049)))))

(declare-fun lt!341668 () (_ BitVec 64))

(declare-fun b!216110 () Bool)

(declare-fun lt!341666 () (_ BitVec 64))

(assert (=> b!216110 (= e!146998 (= (_1!9889 lt!341672) (withMovedBitIndex!0 (_2!9889 lt!341672) (bvsub lt!341668 lt!341666))))))

(assert (=> b!216110 (or (= (bvand lt!341668 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!341666 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!341668 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!341668 lt!341666) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!216110 (= lt!341666 (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!341049))) (currentByte!9768 (_2!9888 lt!341049)) (currentBit!9763 (_2!9888 lt!341049))))))

(assert (=> b!216110 (= lt!341668 (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!340226))) (currentByte!9768 (_2!9888 lt!340226)) (currentBit!9763 (_2!9888 lt!340226))))))

(declare-fun b!216111 () Bool)

(declare-fun e!146997 () Unit!15294)

(declare-fun Unit!15344 () Unit!15294)

(assert (=> b!216111 (= e!146997 Unit!15344)))

(declare-fun b!216112 () Bool)

(declare-fun res!181806 () Bool)

(assert (=> b!216112 (=> (not res!181806) (not e!146998))))

(assert (=> b!216112 (= res!181806 (isPrefixOf!0 (_1!9889 lt!341672) (_2!9888 lt!340226)))))

(declare-fun b!216113 () Bool)

(declare-fun lt!341679 () Unit!15294)

(assert (=> b!216113 (= e!146997 lt!341679)))

(declare-fun lt!341684 () (_ BitVec 64))

(assert (=> b!216113 (= lt!341684 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!341676 () (_ BitVec 64))

(assert (=> b!216113 (= lt!341676 (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!340226))) (currentByte!9768 (_2!9888 lt!340226)) (currentBit!9763 (_2!9888 lt!340226))))))

(assert (=> b!216113 (= lt!341679 (arrayBitRangesEqSymmetric!0 (buf!5190 (_2!9888 lt!340226)) (buf!5190 (_2!9888 lt!341049)) lt!341684 lt!341676))))

(assert (=> b!216113 (arrayBitRangesEq!0 (buf!5190 (_2!9888 lt!341049)) (buf!5190 (_2!9888 lt!340226)) lt!341684 lt!341676)))

(declare-fun d!72887 () Bool)

(assert (=> d!72887 e!146998))

(declare-fun res!181805 () Bool)

(assert (=> d!72887 (=> (not res!181805) (not e!146998))))

(assert (=> d!72887 (= res!181805 (isPrefixOf!0 (_1!9889 lt!341672) (_2!9889 lt!341672)))))

(declare-fun lt!341669 () BitStream!8418)

(assert (=> d!72887 (= lt!341672 (tuple2!18469 lt!341669 (_2!9888 lt!341049)))))

(declare-fun lt!341677 () Unit!15294)

(declare-fun lt!341682 () Unit!15294)

(assert (=> d!72887 (= lt!341677 lt!341682)))

(assert (=> d!72887 (isPrefixOf!0 lt!341669 (_2!9888 lt!341049))))

(assert (=> d!72887 (= lt!341682 (lemmaIsPrefixTransitive!0 lt!341669 (_2!9888 lt!341049) (_2!9888 lt!341049)))))

(declare-fun lt!341685 () Unit!15294)

(declare-fun lt!341670 () Unit!15294)

(assert (=> d!72887 (= lt!341685 lt!341670)))

(assert (=> d!72887 (isPrefixOf!0 lt!341669 (_2!9888 lt!341049))))

(assert (=> d!72887 (= lt!341670 (lemmaIsPrefixTransitive!0 lt!341669 (_2!9888 lt!340226) (_2!9888 lt!341049)))))

(declare-fun lt!341671 () Unit!15294)

(assert (=> d!72887 (= lt!341671 e!146997)))

(declare-fun c!10552 () Bool)

(assert (=> d!72887 (= c!10552 (not (= (size!4655 (buf!5190 (_2!9888 lt!340226))) #b00000000000000000000000000000000)))))

(declare-fun lt!341667 () Unit!15294)

(declare-fun lt!341674 () Unit!15294)

(assert (=> d!72887 (= lt!341667 lt!341674)))

(assert (=> d!72887 (isPrefixOf!0 (_2!9888 lt!341049) (_2!9888 lt!341049))))

(assert (=> d!72887 (= lt!341674 (lemmaIsPrefixRefl!0 (_2!9888 lt!341049)))))

(declare-fun lt!341673 () Unit!15294)

(declare-fun lt!341680 () Unit!15294)

(assert (=> d!72887 (= lt!341673 lt!341680)))

(assert (=> d!72887 (= lt!341680 (lemmaIsPrefixRefl!0 (_2!9888 lt!341049)))))

(declare-fun lt!341683 () Unit!15294)

(declare-fun lt!341678 () Unit!15294)

(assert (=> d!72887 (= lt!341683 lt!341678)))

(assert (=> d!72887 (isPrefixOf!0 lt!341669 lt!341669)))

(assert (=> d!72887 (= lt!341678 (lemmaIsPrefixRefl!0 lt!341669))))

(declare-fun lt!341675 () Unit!15294)

(declare-fun lt!341681 () Unit!15294)

(assert (=> d!72887 (= lt!341675 lt!341681)))

(assert (=> d!72887 (isPrefixOf!0 (_2!9888 lt!340226) (_2!9888 lt!340226))))

(assert (=> d!72887 (= lt!341681 (lemmaIsPrefixRefl!0 (_2!9888 lt!340226)))))

(assert (=> d!72887 (= lt!341669 (BitStream!8419 (buf!5190 (_2!9888 lt!341049)) (currentByte!9768 (_2!9888 lt!340226)) (currentBit!9763 (_2!9888 lt!340226))))))

(assert (=> d!72887 (isPrefixOf!0 (_2!9888 lt!340226) (_2!9888 lt!341049))))

(assert (=> d!72887 (= (reader!0 (_2!9888 lt!340226) (_2!9888 lt!341049)) lt!341672)))

(assert (= (and d!72887 c!10552) b!216113))

(assert (= (and d!72887 (not c!10552)) b!216111))

(assert (= (and d!72887 res!181805) b!216112))

(assert (= (and b!216112 res!181806) b!216109))

(assert (= (and b!216109 res!181807) b!216110))

(assert (=> b!216113 m!331713))

(declare-fun m!332925 () Bool)

(assert (=> b!216113 m!332925))

(declare-fun m!332927 () Bool)

(assert (=> b!216113 m!332927))

(declare-fun m!332929 () Bool)

(assert (=> b!216110 m!332929))

(assert (=> b!216110 m!332407))

(assert (=> b!216110 m!331713))

(declare-fun m!332931 () Bool)

(assert (=> b!216109 m!332931))

(declare-fun m!332933 () Bool)

(assert (=> d!72887 m!332933))

(declare-fun m!332935 () Bool)

(assert (=> d!72887 m!332935))

(declare-fun m!332937 () Bool)

(assert (=> d!72887 m!332937))

(declare-fun m!332939 () Bool)

(assert (=> d!72887 m!332939))

(declare-fun m!332941 () Bool)

(assert (=> d!72887 m!332941))

(declare-fun m!332943 () Bool)

(assert (=> d!72887 m!332943))

(declare-fun m!332945 () Bool)

(assert (=> d!72887 m!332945))

(assert (=> d!72887 m!331927))

(declare-fun m!332947 () Bool)

(assert (=> d!72887 m!332947))

(assert (=> d!72887 m!331931))

(declare-fun m!332949 () Bool)

(assert (=> d!72887 m!332949))

(declare-fun m!332951 () Bool)

(assert (=> b!216112 m!332951))

(assert (=> b!215822 d!72887))

(declare-fun d!72889 () Bool)

(declare-fun e!146999 () Bool)

(assert (=> d!72889 e!146999))

(declare-fun res!181808 () Bool)

(assert (=> d!72889 (=> (not res!181808) (not e!146999))))

(declare-fun lt!341687 () (_ BitVec 64))

(declare-fun lt!341686 () BitStream!8418)

(assert (=> d!72889 (= res!181808 (= (bvadd lt!341687 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4655 (buf!5190 lt!341686)) (currentByte!9768 lt!341686) (currentBit!9763 lt!341686))))))

(assert (=> d!72889 (or (not (= (bvand lt!341687 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!341687 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!341687 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72889 (= lt!341687 (bitIndex!0 (size!4655 (buf!5190 (_1!9889 lt!341084))) (currentByte!9768 (_1!9889 lt!341084)) (currentBit!9763 (_1!9889 lt!341084))))))

(assert (=> d!72889 (= lt!341686 (_2!9888 (moveBitIndex!0 (_1!9889 lt!341084) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!72889 (moveBitIndexPrecond!0 (_1!9889 lt!341084) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!72889 (= (withMovedBitIndex!0 (_1!9889 lt!341084) #b0000000000000000000000000000000000000000000000000000000000000001) lt!341686)))

(declare-fun b!216114 () Bool)

(assert (=> b!216114 (= e!146999 (= (size!4655 (buf!5190 (_1!9889 lt!341084))) (size!4655 (buf!5190 lt!341686))))))

(assert (= (and d!72889 res!181808) b!216114))

(declare-fun m!332953 () Bool)

(assert (=> d!72889 m!332953))

(declare-fun m!332955 () Bool)

(assert (=> d!72889 m!332955))

(declare-fun m!332957 () Bool)

(assert (=> d!72889 m!332957))

(declare-fun m!332959 () Bool)

(assert (=> d!72889 m!332959))

(assert (=> b!215822 d!72889))

(declare-fun b!216117 () Bool)

(declare-fun e!147000 () Bool)

(declare-fun e!147001 () Bool)

(assert (=> b!216117 (= e!147000 e!147001)))

(declare-fun res!181811 () Bool)

(assert (=> b!216117 (=> (not res!181811) (not e!147001))))

(declare-fun lt!341688 () tuple2!18472)

(declare-fun lt!341691 () tuple2!18466)

(assert (=> b!216117 (= res!181811 (and (= (_2!9891 lt!341688) lt!341086) (= (_1!9891 lt!341688) (_2!9888 lt!341691))))))

(assert (=> b!216117 (= lt!341688 (readBitPure!0 (readerFrom!0 (_2!9888 lt!341691) (currentBit!9763 (_2!9888 lt!340226)) (currentByte!9768 (_2!9888 lt!340226)))))))

(declare-fun b!216115 () Bool)

(declare-fun res!181809 () Bool)

(assert (=> b!216115 (=> (not res!181809) (not e!147000))))

(declare-fun lt!341690 () (_ BitVec 64))

(declare-fun lt!341689 () (_ BitVec 64))

(assert (=> b!216115 (= res!181809 (= (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!341691))) (currentByte!9768 (_2!9888 lt!341691)) (currentBit!9763 (_2!9888 lt!341691))) (bvadd lt!341689 lt!341690)))))

(assert (=> b!216115 (or (not (= (bvand lt!341689 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!341690 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!341689 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!341689 lt!341690) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!216115 (= lt!341690 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!216115 (= lt!341689 (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!340226))) (currentByte!9768 (_2!9888 lt!340226)) (currentBit!9763 (_2!9888 lt!340226))))))

(declare-fun b!216116 () Bool)

(declare-fun res!181812 () Bool)

(assert (=> b!216116 (=> (not res!181812) (not e!147000))))

(assert (=> b!216116 (= res!181812 (isPrefixOf!0 (_2!9888 lt!340226) (_2!9888 lt!341691)))))

(declare-fun d!72891 () Bool)

(assert (=> d!72891 e!147000))

(declare-fun res!181810 () Bool)

(assert (=> d!72891 (=> (not res!181810) (not e!147000))))

(assert (=> d!72891 (= res!181810 (= (size!4655 (buf!5190 (_2!9888 lt!340226))) (size!4655 (buf!5190 (_2!9888 lt!341691)))))))

(assert (=> d!72891 (= lt!341691 (choose!16 (_2!9888 lt!340226) lt!341086))))

(assert (=> d!72891 (validate_offset_bit!0 ((_ sign_extend 32) (size!4655 (buf!5190 (_2!9888 lt!340226)))) ((_ sign_extend 32) (currentByte!9768 (_2!9888 lt!340226))) ((_ sign_extend 32) (currentBit!9763 (_2!9888 lt!340226))))))

(assert (=> d!72891 (= (appendBit!0 (_2!9888 lt!340226) lt!341086) lt!341691)))

(declare-fun b!216118 () Bool)

(assert (=> b!216118 (= e!147001 (= (bitIndex!0 (size!4655 (buf!5190 (_1!9891 lt!341688))) (currentByte!9768 (_1!9891 lt!341688)) (currentBit!9763 (_1!9891 lt!341688))) (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!341691))) (currentByte!9768 (_2!9888 lt!341691)) (currentBit!9763 (_2!9888 lt!341691)))))))

(assert (= (and d!72891 res!181810) b!216115))

(assert (= (and b!216115 res!181809) b!216116))

(assert (= (and b!216116 res!181812) b!216117))

(assert (= (and b!216117 res!181811) b!216118))

(declare-fun m!332961 () Bool)

(assert (=> b!216116 m!332961))

(declare-fun m!332963 () Bool)

(assert (=> d!72891 m!332963))

(declare-fun m!332965 () Bool)

(assert (=> d!72891 m!332965))

(declare-fun m!332967 () Bool)

(assert (=> b!216118 m!332967))

(declare-fun m!332969 () Bool)

(assert (=> b!216118 m!332969))

(declare-fun m!332971 () Bool)

(assert (=> b!216117 m!332971))

(assert (=> b!216117 m!332971))

(declare-fun m!332973 () Bool)

(assert (=> b!216117 m!332973))

(assert (=> b!216115 m!332969))

(assert (=> b!216115 m!331713))

(assert (=> b!215822 d!72891))

(declare-fun d!72893 () Bool)

(assert (=> d!72893 (validate_offset_bits!1 ((_ sign_extend 32) (size!4655 (buf!5190 (_2!9888 lt!341049)))) ((_ sign_extend 32) (currentByte!9768 (_2!9888 lt!340226))) ((_ sign_extend 32) (currentBit!9763 (_2!9888 lt!340226))) lt!341058)))

(declare-fun lt!341692 () Unit!15294)

(assert (=> d!72893 (= lt!341692 (choose!9 (_2!9888 lt!340226) (buf!5190 (_2!9888 lt!341049)) lt!341058 (BitStream!8419 (buf!5190 (_2!9888 lt!341049)) (currentByte!9768 (_2!9888 lt!340226)) (currentBit!9763 (_2!9888 lt!340226)))))))

(assert (=> d!72893 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9888 lt!340226) (buf!5190 (_2!9888 lt!341049)) lt!341058) lt!341692)))

(declare-fun bs!17858 () Bool)

(assert (= bs!17858 d!72893))

(assert (=> bs!17858 m!332403))

(declare-fun m!332975 () Bool)

(assert (=> bs!17858 m!332975))

(assert (=> b!215822 d!72893))

(declare-fun d!72895 () Bool)

(assert (=> d!72895 (validate_offset_bits!1 ((_ sign_extend 32) (size!4655 (buf!5190 (_2!9888 lt!341049)))) ((_ sign_extend 32) (currentByte!9768 (_2!9888 lt!340226))) ((_ sign_extend 32) (currentBit!9763 (_2!9888 lt!340226))) lt!341087)))

(declare-fun lt!341693 () Unit!15294)

(assert (=> d!72895 (= lt!341693 (choose!9 (_2!9888 lt!340226) (buf!5190 (_2!9888 lt!341049)) lt!341087 (BitStream!8419 (buf!5190 (_2!9888 lt!341049)) (currentByte!9768 (_2!9888 lt!340226)) (currentBit!9763 (_2!9888 lt!340226)))))))

(assert (=> d!72895 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9888 lt!340226) (buf!5190 (_2!9888 lt!341049)) lt!341087) lt!341693)))

(declare-fun bs!17859 () Bool)

(assert (= bs!17859 d!72895))

(assert (=> bs!17859 m!332373))

(declare-fun m!332977 () Bool)

(assert (=> bs!17859 m!332977))

(assert (=> b!215822 d!72895))

(declare-fun d!72897 () Bool)

(declare-fun lt!341694 () tuple2!18482)

(assert (=> d!72897 (= lt!341694 (readNBitsLSBFirstsLoop!0 (withMovedBitIndex!0 (_1!9889 lt!341084) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!341069 e!146806)))))

(assert (=> d!72897 (= (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9889 lt!341084) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!341069 e!146806)) (tuple2!18471 (_2!9896 lt!341694) (_1!9896 lt!341694)))))

(declare-fun bs!17860 () Bool)

(assert (= bs!17860 d!72897))

(assert (=> bs!17860 m!332387))

(declare-fun m!332979 () Bool)

(assert (=> bs!17860 m!332979))

(assert (=> b!215822 d!72897))

(declare-fun d!72899 () Bool)

(declare-fun e!147002 () Bool)

(assert (=> d!72899 e!147002))

(declare-fun res!181814 () Bool)

(assert (=> d!72899 (=> (not res!181814) (not e!147002))))

(declare-fun lt!341697 () (_ BitVec 64))

(declare-fun lt!341696 () (_ BitVec 64))

(declare-fun lt!341698 () (_ BitVec 64))

(assert (=> d!72899 (= res!181814 (= lt!341696 (bvsub lt!341697 lt!341698)))))

(assert (=> d!72899 (or (= (bvand lt!341697 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!341698 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!341697 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!341697 lt!341698) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72899 (= lt!341698 (remainingBits!0 ((_ sign_extend 32) (size!4655 (buf!5190 (_2!9888 lt!341049)))) ((_ sign_extend 32) (currentByte!9768 (_2!9888 lt!341049))) ((_ sign_extend 32) (currentBit!9763 (_2!9888 lt!341049)))))))

(declare-fun lt!341699 () (_ BitVec 64))

(declare-fun lt!341700 () (_ BitVec 64))

(assert (=> d!72899 (= lt!341697 (bvmul lt!341699 lt!341700))))

(assert (=> d!72899 (or (= lt!341699 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!341700 (bvsdiv (bvmul lt!341699 lt!341700) lt!341699)))))

(assert (=> d!72899 (= lt!341700 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!72899 (= lt!341699 ((_ sign_extend 32) (size!4655 (buf!5190 (_2!9888 lt!341049)))))))

(assert (=> d!72899 (= lt!341696 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9768 (_2!9888 lt!341049))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9763 (_2!9888 lt!341049)))))))

(assert (=> d!72899 (invariant!0 (currentBit!9763 (_2!9888 lt!341049)) (currentByte!9768 (_2!9888 lt!341049)) (size!4655 (buf!5190 (_2!9888 lt!341049))))))

(assert (=> d!72899 (= (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!341049))) (currentByte!9768 (_2!9888 lt!341049)) (currentBit!9763 (_2!9888 lt!341049))) lt!341696)))

(declare-fun b!216119 () Bool)

(declare-fun res!181813 () Bool)

(assert (=> b!216119 (=> (not res!181813) (not e!147002))))

(assert (=> b!216119 (= res!181813 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!341696))))

(declare-fun b!216120 () Bool)

(declare-fun lt!341695 () (_ BitVec 64))

(assert (=> b!216120 (= e!147002 (bvsle lt!341696 (bvmul lt!341695 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!216120 (or (= lt!341695 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!341695 #b0000000000000000000000000000000000000000000000000000000000001000) lt!341695)))))

(assert (=> b!216120 (= lt!341695 ((_ sign_extend 32) (size!4655 (buf!5190 (_2!9888 lt!341049)))))))

(assert (= (and d!72899 res!181814) b!216119))

(assert (= (and b!216119 res!181813) b!216120))

(declare-fun m!332981 () Bool)

(assert (=> d!72899 m!332981))

(assert (=> d!72899 m!332385))

(assert (=> b!215822 d!72899))

(declare-fun d!72901 () Bool)

(declare-fun lt!341701 () tuple2!18484)

(assert (=> d!72901 (= lt!341701 (readBit!0 lt!341072))))

(assert (=> d!72901 (= (readBitPure!0 lt!341072) (tuple2!18473 (_2!9897 lt!341701) (_1!9897 lt!341701)))))

(declare-fun bs!17861 () Bool)

(assert (= bs!17861 d!72901))

(declare-fun m!332983 () Bool)

(assert (=> bs!17861 m!332983))

(assert (=> b!215822 d!72901))

(declare-fun d!72903 () Bool)

(assert (=> d!72903 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4655 (buf!5190 (_2!9888 lt!341049)))) ((_ sign_extend 32) (currentByte!9768 (_2!9888 lt!340226))) ((_ sign_extend 32) (currentBit!9763 (_2!9888 lt!340226))) lt!341087) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4655 (buf!5190 (_2!9888 lt!341049)))) ((_ sign_extend 32) (currentByte!9768 (_2!9888 lt!340226))) ((_ sign_extend 32) (currentBit!9763 (_2!9888 lt!340226)))) lt!341087))))

(declare-fun bs!17862 () Bool)

(assert (= bs!17862 d!72903))

(declare-fun m!332985 () Bool)

(assert (=> bs!17862 m!332985))

(assert (=> b!215822 d!72903))

(declare-fun d!72905 () Bool)

(assert (=> d!72905 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4655 (buf!5190 (_2!9888 lt!341049)))) ((_ sign_extend 32) (currentByte!9768 (_2!9888 lt!340226))) ((_ sign_extend 32) (currentBit!9763 (_2!9888 lt!340226))) lt!341058) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4655 (buf!5190 (_2!9888 lt!341049)))) ((_ sign_extend 32) (currentByte!9768 (_2!9888 lt!340226))) ((_ sign_extend 32) (currentBit!9763 (_2!9888 lt!340226)))) lt!341058))))

(declare-fun bs!17863 () Bool)

(assert (= bs!17863 d!72905))

(assert (=> bs!17863 m!332985))

(assert (=> b!215822 d!72905))

(declare-fun d!72907 () Bool)

(declare-fun lt!341702 () tuple2!18484)

(assert (=> d!72907 (= lt!341702 (readBit!0 (_1!9889 lt!341084)))))

(assert (=> d!72907 (= (readBitPure!0 (_1!9889 lt!341084)) (tuple2!18473 (_2!9897 lt!341702) (_1!9897 lt!341702)))))

(declare-fun bs!17864 () Bool)

(assert (= bs!17864 d!72907))

(declare-fun m!332987 () Bool)

(assert (=> bs!17864 m!332987))

(assert (=> b!215822 d!72907))

(declare-fun b!216121 () Bool)

(declare-fun res!181819 () Bool)

(declare-fun e!147004 () Bool)

(assert (=> b!216121 (=> (not res!181819) (not e!147004))))

(declare-fun lt!341719 () tuple2!18466)

(assert (=> b!216121 (= res!181819 (isPrefixOf!0 (_2!9888 lt!341080) (_2!9888 lt!341719)))))

(declare-fun b!216122 () Bool)

(declare-fun e!147003 () Bool)

(declare-fun lt!341750 () tuple2!18470)

(declare-fun lt!341755 () tuple2!18468)

(assert (=> b!216122 (= e!147003 (= (_1!9890 lt!341750) (_2!9889 lt!341755)))))

(declare-fun b!216123 () Bool)

(declare-fun e!147008 () Bool)

(declare-fun lt!341715 () (_ BitVec 64))

(assert (=> b!216123 (= e!147008 (validate_offset_bits!1 ((_ sign_extend 32) (size!4655 (buf!5190 (_2!9888 lt!341080)))) ((_ sign_extend 32) (currentByte!9768 (_2!9888 lt!341080))) ((_ sign_extend 32) (currentBit!9763 (_2!9888 lt!341080))) lt!341715))))

(declare-fun b!216124 () Bool)

(declare-fun e!147006 () (_ BitVec 64))

(assert (=> b!216124 (= e!147006 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001))))))

(declare-fun b!216125 () Bool)

(declare-fun e!147007 () tuple2!18466)

(declare-fun Unit!15345 () Unit!15294)

(assert (=> b!216125 (= e!147007 (tuple2!18467 Unit!15345 (_2!9888 lt!341080)))))

(declare-fun lt!341714 () Unit!15294)

(assert (=> b!216125 (= lt!341714 (lemmaIsPrefixRefl!0 (_2!9888 lt!341080)))))

(declare-fun call!3376 () Bool)

(assert (=> b!216125 call!3376))

(declare-fun lt!341722 () Unit!15294)

(assert (=> b!216125 (= lt!341722 lt!341714)))

(declare-fun b!216126 () Bool)

(declare-fun res!181824 () Bool)

(assert (=> b!216126 (=> (not res!181824) (not e!147004))))

(assert (=> b!216126 (= res!181824 (= (size!4655 (buf!5190 (_2!9888 lt!341080))) (size!4655 (buf!5190 (_2!9888 lt!341719)))))))

(declare-fun b!216127 () Bool)

(declare-fun e!147011 () Bool)

(declare-fun lt!341739 () tuple2!18470)

(declare-fun lt!341737 () tuple2!18468)

(assert (=> b!216127 (= e!147011 (= (_1!9890 lt!341739) (_2!9889 lt!341737)))))

(declare-fun b!216128 () Bool)

(declare-fun res!181825 () Bool)

(declare-fun lt!341728 () tuple2!18466)

(assert (=> b!216128 (= res!181825 (= (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!341728))) (currentByte!9768 (_2!9888 lt!341728)) (currentBit!9763 (_2!9888 lt!341728))) (bvadd (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!341080))) (currentByte!9768 (_2!9888 lt!341080)) (currentBit!9763 (_2!9888 lt!341080))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun e!147005 () Bool)

(assert (=> b!216128 (=> (not res!181825) (not e!147005))))

(declare-fun d!72909 () Bool)

(assert (=> d!72909 e!147004))

(declare-fun res!181818 () Bool)

(assert (=> d!72909 (=> (not res!181818) (not e!147004))))

(assert (=> d!72909 (= res!181818 (invariant!0 (currentBit!9763 (_2!9888 lt!341719)) (currentByte!9768 (_2!9888 lt!341719)) (size!4655 (buf!5190 (_2!9888 lt!341719)))))))

(assert (=> d!72909 (= lt!341719 e!147007)))

(declare-fun c!10554 () Bool)

(assert (=> d!72909 (= c!10554 (= (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) nBits!348))))

(assert (=> d!72909 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!72909 (= (appendBitsLSBFirstLoopTR!0 (_2!9888 lt!341080) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)) lt!341719)))

(declare-fun b!216129 () Bool)

(assert (=> b!216129 (= e!147004 e!147011)))

(declare-fun res!181820 () Bool)

(assert (=> b!216129 (=> (not res!181820) (not e!147011))))

(assert (=> b!216129 (= res!181820 (= (_2!9890 lt!341739) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!216129 (= lt!341739 (readNBitsLSBFirstsLoopPure!0 (_1!9889 lt!341737) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))))

(declare-fun lt!341743 () Unit!15294)

(declare-fun lt!341709 () Unit!15294)

(assert (=> b!216129 (= lt!341743 lt!341709)))

(assert (=> b!216129 (validate_offset_bits!1 ((_ sign_extend 32) (size!4655 (buf!5190 (_2!9888 lt!341719)))) ((_ sign_extend 32) (currentByte!9768 (_2!9888 lt!341080))) ((_ sign_extend 32) (currentBit!9763 (_2!9888 lt!341080))) lt!341715)))

(assert (=> b!216129 (= lt!341709 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9888 lt!341080) (buf!5190 (_2!9888 lt!341719)) lt!341715))))

(assert (=> b!216129 e!147008))

(declare-fun res!181817 () Bool)

(assert (=> b!216129 (=> (not res!181817) (not e!147008))))

(assert (=> b!216129 (= res!181817 (and (= (size!4655 (buf!5190 (_2!9888 lt!341080))) (size!4655 (buf!5190 (_2!9888 lt!341719)))) (bvsge lt!341715 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!216129 (= lt!341715 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001))))))

(assert (=> b!216129 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!216129 (= lt!341737 (reader!0 (_2!9888 lt!341080) (_2!9888 lt!341719)))))

(declare-fun b!216130 () Bool)

(declare-fun res!181822 () Bool)

(assert (=> b!216130 (= res!181822 (isPrefixOf!0 (_2!9888 lt!341080) (_2!9888 lt!341728)))))

(assert (=> b!216130 (=> (not res!181822) (not e!147005))))

(declare-fun b!216131 () Bool)

(declare-fun e!147010 () Bool)

(declare-fun lt!341757 () tuple2!18472)

(assert (=> b!216131 (= e!147010 (= (bitIndex!0 (size!4655 (buf!5190 (_1!9891 lt!341757))) (currentByte!9768 (_1!9891 lt!341757)) (currentBit!9763 (_1!9891 lt!341757))) (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!341728))) (currentByte!9768 (_2!9888 lt!341728)) (currentBit!9763 (_2!9888 lt!341728)))))))

(declare-fun b!216132 () Bool)

(declare-fun lt!341707 () tuple2!18466)

(assert (=> b!216132 (= e!147007 (tuple2!18467 (_1!9888 lt!341707) (_2!9888 lt!341707)))))

(declare-fun lt!341744 () Bool)

(assert (=> b!216132 (= lt!341744 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!216132 (= lt!341728 (appendBit!0 (_2!9888 lt!341080) lt!341744))))

(declare-fun res!181823 () Bool)

(assert (=> b!216132 (= res!181823 (= (size!4655 (buf!5190 (_2!9888 lt!341080))) (size!4655 (buf!5190 (_2!9888 lt!341728)))))))

(assert (=> b!216132 (=> (not res!181823) (not e!147005))))

(assert (=> b!216132 e!147005))

(declare-fun lt!341738 () tuple2!18466)

(assert (=> b!216132 (= lt!341738 lt!341728)))

(assert (=> b!216132 (= lt!341707 (appendBitsLSBFirstLoopTR!0 (_2!9888 lt!341738) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(declare-fun lt!341710 () Unit!15294)

(assert (=> b!216132 (= lt!341710 (lemmaIsPrefixTransitive!0 (_2!9888 lt!341080) (_2!9888 lt!341738) (_2!9888 lt!341707)))))

(assert (=> b!216132 call!3376))

(declare-fun lt!341723 () Unit!15294)

(assert (=> b!216132 (= lt!341723 lt!341710)))

(assert (=> b!216132 (invariant!0 (currentBit!9763 (_2!9888 lt!341080)) (currentByte!9768 (_2!9888 lt!341080)) (size!4655 (buf!5190 (_2!9888 lt!341738))))))

(declare-fun lt!341725 () BitStream!8418)

(assert (=> b!216132 (= lt!341725 (BitStream!8419 (buf!5190 (_2!9888 lt!341738)) (currentByte!9768 (_2!9888 lt!341080)) (currentBit!9763 (_2!9888 lt!341080))))))

(assert (=> b!216132 (invariant!0 (currentBit!9763 lt!341725) (currentByte!9768 lt!341725) (size!4655 (buf!5190 (_2!9888 lt!341707))))))

(declare-fun lt!341730 () BitStream!8418)

(assert (=> b!216132 (= lt!341730 (BitStream!8419 (buf!5190 (_2!9888 lt!341707)) (currentByte!9768 lt!341725) (currentBit!9763 lt!341725)))))

(declare-fun lt!341731 () tuple2!18472)

(assert (=> b!216132 (= lt!341731 (readBitPure!0 lt!341725))))

(declare-fun lt!341724 () tuple2!18472)

(assert (=> b!216132 (= lt!341724 (readBitPure!0 lt!341730))))

(declare-fun lt!341749 () Unit!15294)

(assert (=> b!216132 (= lt!341749 (readBitPrefixLemma!0 lt!341725 (_2!9888 lt!341707)))))

(declare-fun res!181821 () Bool)

(assert (=> b!216132 (= res!181821 (= (bitIndex!0 (size!4655 (buf!5190 (_1!9891 lt!341731))) (currentByte!9768 (_1!9891 lt!341731)) (currentBit!9763 (_1!9891 lt!341731))) (bitIndex!0 (size!4655 (buf!5190 (_1!9891 lt!341724))) (currentByte!9768 (_1!9891 lt!341724)) (currentBit!9763 (_1!9891 lt!341724)))))))

(declare-fun e!147009 () Bool)

(assert (=> b!216132 (=> (not res!181821) (not e!147009))))

(assert (=> b!216132 e!147009))

(declare-fun lt!341703 () Unit!15294)

(assert (=> b!216132 (= lt!341703 lt!341749)))

(declare-fun lt!341742 () tuple2!18468)

(assert (=> b!216132 (= lt!341742 (reader!0 (_2!9888 lt!341080) (_2!9888 lt!341707)))))

(declare-fun lt!341752 () tuple2!18468)

(assert (=> b!216132 (= lt!341752 (reader!0 (_2!9888 lt!341738) (_2!9888 lt!341707)))))

(declare-fun lt!341740 () tuple2!18472)

(assert (=> b!216132 (= lt!341740 (readBitPure!0 (_1!9889 lt!341742)))))

(assert (=> b!216132 (= (_2!9891 lt!341740) lt!341744)))

(declare-fun lt!341741 () Unit!15294)

(declare-fun Unit!15346 () Unit!15294)

(assert (=> b!216132 (= lt!341741 Unit!15346)))

(declare-fun lt!341727 () (_ BitVec 64))

(assert (=> b!216132 (= lt!341727 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001))))))

(declare-fun lt!341716 () (_ BitVec 64))

(assert (=> b!216132 (= lt!341716 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001))))))

(declare-fun lt!341713 () Unit!15294)

(assert (=> b!216132 (= lt!341713 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9888 lt!341080) (buf!5190 (_2!9888 lt!341707)) lt!341716))))

(assert (=> b!216132 (validate_offset_bits!1 ((_ sign_extend 32) (size!4655 (buf!5190 (_2!9888 lt!341707)))) ((_ sign_extend 32) (currentByte!9768 (_2!9888 lt!341080))) ((_ sign_extend 32) (currentBit!9763 (_2!9888 lt!341080))) lt!341716)))

(declare-fun lt!341726 () Unit!15294)

(assert (=> b!216132 (= lt!341726 lt!341713)))

(declare-fun lt!341721 () tuple2!18470)

(assert (=> b!216132 (= lt!341721 (readNBitsLSBFirstsLoopPure!0 (_1!9889 lt!341742) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) lt!341727))))

(declare-fun lt!341746 () (_ BitVec 64))

(assert (=> b!216132 (= lt!341746 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))))

(declare-fun lt!341756 () Unit!15294)

(assert (=> b!216132 (= lt!341756 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9888 lt!341738) (buf!5190 (_2!9888 lt!341707)) lt!341746))))

(assert (=> b!216132 (validate_offset_bits!1 ((_ sign_extend 32) (size!4655 (buf!5190 (_2!9888 lt!341707)))) ((_ sign_extend 32) (currentByte!9768 (_2!9888 lt!341738))) ((_ sign_extend 32) (currentBit!9763 (_2!9888 lt!341738))) lt!341746)))

(declare-fun lt!341729 () Unit!15294)

(assert (=> b!216132 (= lt!341729 lt!341756)))

(declare-fun lt!341711 () tuple2!18470)

(assert (=> b!216132 (= lt!341711 (readNBitsLSBFirstsLoopPure!0 (_1!9889 lt!341752) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvor lt!341727 (ite (_2!9891 lt!341740) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!341753 () tuple2!18470)

(assert (=> b!216132 (= lt!341753 (readNBitsLSBFirstsLoopPure!0 (_1!9889 lt!341742) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) lt!341727))))

(declare-fun c!10553 () Bool)

(assert (=> b!216132 (= c!10553 (_2!9891 (readBitPure!0 (_1!9889 lt!341742))))))

(declare-fun lt!341747 () tuple2!18470)

(assert (=> b!216132 (= lt!341747 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9889 lt!341742) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvor lt!341727 e!147006)))))

(declare-fun lt!341717 () Unit!15294)

(assert (=> b!216132 (= lt!341717 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9889 lt!341742) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) lt!341727))))

(assert (=> b!216132 (and (= (_2!9890 lt!341753) (_2!9890 lt!341747)) (= (_1!9890 lt!341753) (_1!9890 lt!341747)))))

(declare-fun lt!341706 () Unit!15294)

(assert (=> b!216132 (= lt!341706 lt!341717)))

(assert (=> b!216132 (= (_1!9889 lt!341742) (withMovedBitIndex!0 (_2!9889 lt!341742) (bvsub (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!341080))) (currentByte!9768 (_2!9888 lt!341080)) (currentBit!9763 (_2!9888 lt!341080))) (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!341707))) (currentByte!9768 (_2!9888 lt!341707)) (currentBit!9763 (_2!9888 lt!341707))))))))

(declare-fun lt!341732 () Unit!15294)

(declare-fun Unit!15347 () Unit!15294)

(assert (=> b!216132 (= lt!341732 Unit!15347)))

(assert (=> b!216132 (= (_1!9889 lt!341752) (withMovedBitIndex!0 (_2!9889 lt!341752) (bvsub (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!341738))) (currentByte!9768 (_2!9888 lt!341738)) (currentBit!9763 (_2!9888 lt!341738))) (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!341707))) (currentByte!9768 (_2!9888 lt!341707)) (currentBit!9763 (_2!9888 lt!341707))))))))

(declare-fun lt!341736 () Unit!15294)

(declare-fun Unit!15348 () Unit!15294)

(assert (=> b!216132 (= lt!341736 Unit!15348)))

(assert (=> b!216132 (= (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!341080))) (currentByte!9768 (_2!9888 lt!341080)) (currentBit!9763 (_2!9888 lt!341080))) (bvsub (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!341738))) (currentByte!9768 (_2!9888 lt!341738)) (currentBit!9763 (_2!9888 lt!341738))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!341748 () Unit!15294)

(declare-fun Unit!15349 () Unit!15294)

(assert (=> b!216132 (= lt!341748 Unit!15349)))

(assert (=> b!216132 (= (_2!9890 lt!341721) (_2!9890 lt!341711))))

(declare-fun lt!341718 () Unit!15294)

(declare-fun Unit!15350 () Unit!15294)

(assert (=> b!216132 (= lt!341718 Unit!15350)))

(assert (=> b!216132 (invariant!0 (currentBit!9763 (_2!9888 lt!341707)) (currentByte!9768 (_2!9888 lt!341707)) (size!4655 (buf!5190 (_2!9888 lt!341707))))))

(declare-fun lt!341705 () Unit!15294)

(declare-fun Unit!15351 () Unit!15294)

(assert (=> b!216132 (= lt!341705 Unit!15351)))

(assert (=> b!216132 (= (size!4655 (buf!5190 (_2!9888 lt!341080))) (size!4655 (buf!5190 (_2!9888 lt!341707))))))

(declare-fun lt!341704 () Unit!15294)

(declare-fun Unit!15352 () Unit!15294)

(assert (=> b!216132 (= lt!341704 Unit!15352)))

(assert (=> b!216132 (= (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!341707))) (currentByte!9768 (_2!9888 lt!341707)) (currentBit!9763 (_2!9888 lt!341707))) (bvsub (bvadd (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!341080))) (currentByte!9768 (_2!9888 lt!341080)) (currentBit!9763 (_2!9888 lt!341080))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001))))))

(declare-fun lt!341754 () Unit!15294)

(declare-fun Unit!15353 () Unit!15294)

(assert (=> b!216132 (= lt!341754 Unit!15353)))

(declare-fun lt!341708 () Unit!15294)

(declare-fun Unit!15354 () Unit!15294)

(assert (=> b!216132 (= lt!341708 Unit!15354)))

(assert (=> b!216132 (= lt!341755 (reader!0 (_2!9888 lt!341080) (_2!9888 lt!341707)))))

(declare-fun lt!341745 () (_ BitVec 64))

(assert (=> b!216132 (= lt!341745 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001))))))

(declare-fun lt!341751 () Unit!15294)

(assert (=> b!216132 (= lt!341751 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9888 lt!341080) (buf!5190 (_2!9888 lt!341707)) lt!341745))))

(assert (=> b!216132 (validate_offset_bits!1 ((_ sign_extend 32) (size!4655 (buf!5190 (_2!9888 lt!341707)))) ((_ sign_extend 32) (currentByte!9768 (_2!9888 lt!341080))) ((_ sign_extend 32) (currentBit!9763 (_2!9888 lt!341080))) lt!341745)))

(declare-fun lt!341734 () Unit!15294)

(assert (=> b!216132 (= lt!341734 lt!341751)))

(assert (=> b!216132 (= lt!341750 (readNBitsLSBFirstsLoopPure!0 (_1!9889 lt!341755) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))))

(declare-fun res!181815 () Bool)

(assert (=> b!216132 (= res!181815 (= (_2!9890 lt!341750) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!216132 (=> (not res!181815) (not e!147003))))

(assert (=> b!216132 e!147003))

(declare-fun lt!341758 () Unit!15294)

(declare-fun Unit!15355 () Unit!15294)

(assert (=> b!216132 (= lt!341758 Unit!15355)))

(declare-fun b!216133 () Bool)

(declare-fun res!181816 () Bool)

(assert (=> b!216133 (=> (not res!181816) (not e!147004))))

(declare-fun lt!341720 () (_ BitVec 64))

(declare-fun lt!341712 () (_ BitVec 64))

(assert (=> b!216133 (= res!181816 (= (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!341719))) (currentByte!9768 (_2!9888 lt!341719)) (currentBit!9763 (_2!9888 lt!341719))) (bvsub lt!341720 lt!341712)))))

(assert (=> b!216133 (or (= (bvand lt!341720 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!341712 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!341720 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!341720 lt!341712) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!216133 (= lt!341712 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!341735 () (_ BitVec 64))

(declare-fun lt!341733 () (_ BitVec 64))

(assert (=> b!216133 (= lt!341720 (bvadd lt!341735 lt!341733))))

(assert (=> b!216133 (or (not (= (bvand lt!341735 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!341733 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!341735 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!341735 lt!341733) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!216133 (= lt!341733 ((_ sign_extend 32) nBits!348))))

(assert (=> b!216133 (= lt!341735 (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!341080))) (currentByte!9768 (_2!9888 lt!341080)) (currentBit!9763 (_2!9888 lt!341080))))))

(declare-fun bm!3373 () Bool)

(assert (=> bm!3373 (= call!3376 (isPrefixOf!0 (_2!9888 lt!341080) (ite c!10554 (_2!9888 lt!341080) (_2!9888 lt!341707))))))

(declare-fun b!216134 () Bool)

(assert (=> b!216134 (= e!147009 (= (_2!9891 lt!341731) (_2!9891 lt!341724)))))

(declare-fun b!216135 () Bool)

(assert (=> b!216135 (= e!147006 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!216136 () Bool)

(assert (=> b!216136 (= lt!341757 (readBitPure!0 (readerFrom!0 (_2!9888 lt!341728) (currentBit!9763 (_2!9888 lt!341080)) (currentByte!9768 (_2!9888 lt!341080)))))))

(declare-fun res!181826 () Bool)

(assert (=> b!216136 (= res!181826 (and (= (_2!9891 lt!341757) lt!341744) (= (_1!9891 lt!341757) (_2!9888 lt!341728))))))

(assert (=> b!216136 (=> (not res!181826) (not e!147010))))

(assert (=> b!216136 (= e!147005 e!147010)))

(assert (= (and d!72909 c!10554) b!216125))

(assert (= (and d!72909 (not c!10554)) b!216132))

(assert (= (and b!216132 res!181823) b!216128))

(assert (= (and b!216128 res!181825) b!216130))

(assert (= (and b!216130 res!181822) b!216136))

(assert (= (and b!216136 res!181826) b!216131))

(assert (= (and b!216132 res!181821) b!216134))

(assert (= (and b!216132 c!10553) b!216124))

(assert (= (and b!216132 (not c!10553)) b!216135))

(assert (= (and b!216132 res!181815) b!216122))

(assert (= (or b!216125 b!216132) bm!3373))

(assert (= (and d!72909 res!181818) b!216126))

(assert (= (and b!216126 res!181824) b!216133))

(assert (= (and b!216133 res!181816) b!216121))

(assert (= (and b!216121 res!181819) b!216129))

(assert (= (and b!216129 res!181817) b!216123))

(assert (= (and b!216129 res!181820) b!216127))

(declare-fun m!332989 () Bool)

(assert (=> b!216129 m!332989))

(declare-fun m!332991 () Bool)

(assert (=> b!216129 m!332991))

(declare-fun m!332993 () Bool)

(assert (=> b!216129 m!332993))

(assert (=> b!216129 m!331717))

(declare-fun m!332995 () Bool)

(assert (=> b!216129 m!332995))

(declare-fun m!332997 () Bool)

(assert (=> b!216129 m!332997))

(declare-fun m!332999 () Bool)

(assert (=> bm!3373 m!332999))

(declare-fun m!333001 () Bool)

(assert (=> b!216133 m!333001))

(assert (=> b!216133 m!332381))

(declare-fun m!333003 () Bool)

(assert (=> b!216123 m!333003))

(declare-fun m!333005 () Bool)

(assert (=> b!216132 m!333005))

(declare-fun m!333007 () Bool)

(assert (=> b!216132 m!333007))

(declare-fun m!333009 () Bool)

(assert (=> b!216132 m!333009))

(declare-fun m!333011 () Bool)

(assert (=> b!216132 m!333011))

(declare-fun m!333013 () Bool)

(assert (=> b!216132 m!333013))

(declare-fun m!333015 () Bool)

(assert (=> b!216132 m!333015))

(assert (=> b!216132 m!332993))

(assert (=> b!216132 m!331717))

(declare-fun m!333017 () Bool)

(assert (=> b!216132 m!333017))

(declare-fun m!333019 () Bool)

(assert (=> b!216132 m!333019))

(declare-fun m!333021 () Bool)

(assert (=> b!216132 m!333021))

(declare-fun m!333023 () Bool)

(assert (=> b!216132 m!333023))

(declare-fun m!333025 () Bool)

(assert (=> b!216132 m!333025))

(declare-fun m!333027 () Bool)

(assert (=> b!216132 m!333027))

(declare-fun m!333029 () Bool)

(assert (=> b!216132 m!333029))

(declare-fun m!333031 () Bool)

(assert (=> b!216132 m!333031))

(declare-fun m!333033 () Bool)

(assert (=> b!216132 m!333033))

(declare-fun m!333035 () Bool)

(assert (=> b!216132 m!333035))

(declare-fun m!333037 () Bool)

(assert (=> b!216132 m!333037))

(declare-fun m!333039 () Bool)

(assert (=> b!216132 m!333039))

(declare-fun m!333041 () Bool)

(assert (=> b!216132 m!333041))

(declare-fun m!333043 () Bool)

(assert (=> b!216132 m!333043))

(declare-fun m!333045 () Bool)

(assert (=> b!216132 m!333045))

(declare-fun m!333047 () Bool)

(assert (=> b!216132 m!333047))

(declare-fun m!333049 () Bool)

(assert (=> b!216132 m!333049))

(declare-fun m!333051 () Bool)

(assert (=> b!216132 m!333051))

(assert (=> b!216132 m!333037))

(declare-fun m!333053 () Bool)

(assert (=> b!216132 m!333053))

(declare-fun m!333055 () Bool)

(assert (=> b!216132 m!333055))

(declare-fun m!333057 () Bool)

(assert (=> b!216132 m!333057))

(assert (=> b!216132 m!332381))

(declare-fun m!333059 () Bool)

(assert (=> b!216132 m!333059))

(declare-fun m!333061 () Bool)

(assert (=> b!216132 m!333061))

(declare-fun m!333063 () Bool)

(assert (=> b!216132 m!333063))

(declare-fun m!333065 () Bool)

(assert (=> b!216131 m!333065))

(declare-fun m!333067 () Bool)

(assert (=> b!216131 m!333067))

(declare-fun m!333069 () Bool)

(assert (=> d!72909 m!333069))

(assert (=> b!216128 m!333067))

(assert (=> b!216128 m!332381))

(declare-fun m!333071 () Bool)

(assert (=> b!216130 m!333071))

(declare-fun m!333073 () Bool)

(assert (=> b!216136 m!333073))

(assert (=> b!216136 m!333073))

(declare-fun m!333075 () Bool)

(assert (=> b!216136 m!333075))

(declare-fun m!333077 () Bool)

(assert (=> b!216121 m!333077))

(declare-fun m!333079 () Bool)

(assert (=> b!216125 m!333079))

(assert (=> b!215822 d!72909))

(declare-fun d!72911 () Bool)

(declare-fun e!147012 () Bool)

(assert (=> d!72911 e!147012))

(declare-fun res!181828 () Bool)

(assert (=> d!72911 (=> (not res!181828) (not e!147012))))

(declare-fun lt!341761 () (_ BitVec 64))

(declare-fun lt!341762 () (_ BitVec 64))

(declare-fun lt!341760 () (_ BitVec 64))

(assert (=> d!72911 (= res!181828 (= lt!341760 (bvsub lt!341761 lt!341762)))))

(assert (=> d!72911 (or (= (bvand lt!341761 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!341762 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!341761 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!341761 lt!341762) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72911 (= lt!341762 (remainingBits!0 ((_ sign_extend 32) (size!4655 (buf!5190 (_1!9891 lt!341073)))) ((_ sign_extend 32) (currentByte!9768 (_1!9891 lt!341073))) ((_ sign_extend 32) (currentBit!9763 (_1!9891 lt!341073)))))))

(declare-fun lt!341763 () (_ BitVec 64))

(declare-fun lt!341764 () (_ BitVec 64))

(assert (=> d!72911 (= lt!341761 (bvmul lt!341763 lt!341764))))

(assert (=> d!72911 (or (= lt!341763 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!341764 (bvsdiv (bvmul lt!341763 lt!341764) lt!341763)))))

(assert (=> d!72911 (= lt!341764 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!72911 (= lt!341763 ((_ sign_extend 32) (size!4655 (buf!5190 (_1!9891 lt!341073)))))))

(assert (=> d!72911 (= lt!341760 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9768 (_1!9891 lt!341073))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9763 (_1!9891 lt!341073)))))))

(assert (=> d!72911 (invariant!0 (currentBit!9763 (_1!9891 lt!341073)) (currentByte!9768 (_1!9891 lt!341073)) (size!4655 (buf!5190 (_1!9891 lt!341073))))))

(assert (=> d!72911 (= (bitIndex!0 (size!4655 (buf!5190 (_1!9891 lt!341073))) (currentByte!9768 (_1!9891 lt!341073)) (currentBit!9763 (_1!9891 lt!341073))) lt!341760)))

(declare-fun b!216137 () Bool)

(declare-fun res!181827 () Bool)

(assert (=> b!216137 (=> (not res!181827) (not e!147012))))

(assert (=> b!216137 (= res!181827 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!341760))))

(declare-fun b!216138 () Bool)

(declare-fun lt!341759 () (_ BitVec 64))

(assert (=> b!216138 (= e!147012 (bvsle lt!341760 (bvmul lt!341759 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!216138 (or (= lt!341759 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!341759 #b0000000000000000000000000000000000000000000000000000000000001000) lt!341759)))))

(assert (=> b!216138 (= lt!341759 ((_ sign_extend 32) (size!4655 (buf!5190 (_1!9891 lt!341073)))))))

(assert (= (and d!72911 res!181828) b!216137))

(assert (= (and b!216137 res!181827) b!216138))

(declare-fun m!333081 () Bool)

(assert (=> d!72911 m!333081))

(declare-fun m!333083 () Bool)

(assert (=> d!72911 m!333083))

(assert (=> b!215822 d!72911))

(declare-fun d!72913 () Bool)

(declare-fun lt!341765 () tuple2!18482)

(assert (=> d!72913 (= lt!341765 (readNBitsLSBFirstsLoop!0 (_1!9889 lt!341084) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!341069))))

(assert (=> d!72913 (= (readNBitsLSBFirstsLoopPure!0 (_1!9889 lt!341084) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!341069) (tuple2!18471 (_2!9896 lt!341765) (_1!9896 lt!341765)))))

(declare-fun bs!17865 () Bool)

(assert (= bs!17865 d!72913))

(declare-fun m!333085 () Bool)

(assert (=> bs!17865 m!333085))

(assert (=> b!215822 d!72913))

(declare-fun d!72915 () Bool)

(assert (=> d!72915 (= (invariant!0 (currentBit!9763 (_2!9888 lt!341049)) (currentByte!9768 (_2!9888 lt!341049)) (size!4655 (buf!5190 (_2!9888 lt!341049)))) (and (bvsge (currentBit!9763 (_2!9888 lt!341049)) #b00000000000000000000000000000000) (bvslt (currentBit!9763 (_2!9888 lt!341049)) #b00000000000000000000000000001000) (bvsge (currentByte!9768 (_2!9888 lt!341049)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9768 (_2!9888 lt!341049)) (size!4655 (buf!5190 (_2!9888 lt!341049)))) (and (= (currentBit!9763 (_2!9888 lt!341049)) #b00000000000000000000000000000000) (= (currentByte!9768 (_2!9888 lt!341049)) (size!4655 (buf!5190 (_2!9888 lt!341049))))))))))

(assert (=> b!215822 d!72915))

(declare-fun b!216139 () Bool)

(declare-fun res!181831 () Bool)

(declare-fun e!147014 () Bool)

(assert (=> b!216139 (=> (not res!181831) (not e!147014))))

(declare-fun lt!341772 () tuple2!18468)

(assert (=> b!216139 (= res!181831 (isPrefixOf!0 (_2!9889 lt!341772) (_2!9888 lt!341049)))))

(declare-fun lt!341768 () (_ BitVec 64))

(declare-fun lt!341766 () (_ BitVec 64))

(declare-fun b!216140 () Bool)

(assert (=> b!216140 (= e!147014 (= (_1!9889 lt!341772) (withMovedBitIndex!0 (_2!9889 lt!341772) (bvsub lt!341768 lt!341766))))))

(assert (=> b!216140 (or (= (bvand lt!341768 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!341766 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!341768 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!341768 lt!341766) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!216140 (= lt!341766 (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!341049))) (currentByte!9768 (_2!9888 lt!341049)) (currentBit!9763 (_2!9888 lt!341049))))))

(assert (=> b!216140 (= lt!341768 (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!341080))) (currentByte!9768 (_2!9888 lt!341080)) (currentBit!9763 (_2!9888 lt!341080))))))

(declare-fun b!216141 () Bool)

(declare-fun e!147013 () Unit!15294)

(declare-fun Unit!15356 () Unit!15294)

(assert (=> b!216141 (= e!147013 Unit!15356)))

(declare-fun b!216142 () Bool)

(declare-fun res!181830 () Bool)

(assert (=> b!216142 (=> (not res!181830) (not e!147014))))

(assert (=> b!216142 (= res!181830 (isPrefixOf!0 (_1!9889 lt!341772) (_2!9888 lt!341080)))))

(declare-fun b!216143 () Bool)

(declare-fun lt!341779 () Unit!15294)

(assert (=> b!216143 (= e!147013 lt!341779)))

(declare-fun lt!341784 () (_ BitVec 64))

(assert (=> b!216143 (= lt!341784 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!341776 () (_ BitVec 64))

(assert (=> b!216143 (= lt!341776 (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!341080))) (currentByte!9768 (_2!9888 lt!341080)) (currentBit!9763 (_2!9888 lt!341080))))))

(assert (=> b!216143 (= lt!341779 (arrayBitRangesEqSymmetric!0 (buf!5190 (_2!9888 lt!341080)) (buf!5190 (_2!9888 lt!341049)) lt!341784 lt!341776))))

(assert (=> b!216143 (arrayBitRangesEq!0 (buf!5190 (_2!9888 lt!341049)) (buf!5190 (_2!9888 lt!341080)) lt!341784 lt!341776)))

(declare-fun d!72917 () Bool)

(assert (=> d!72917 e!147014))

(declare-fun res!181829 () Bool)

(assert (=> d!72917 (=> (not res!181829) (not e!147014))))

(assert (=> d!72917 (= res!181829 (isPrefixOf!0 (_1!9889 lt!341772) (_2!9889 lt!341772)))))

(declare-fun lt!341769 () BitStream!8418)

(assert (=> d!72917 (= lt!341772 (tuple2!18469 lt!341769 (_2!9888 lt!341049)))))

(declare-fun lt!341777 () Unit!15294)

(declare-fun lt!341782 () Unit!15294)

(assert (=> d!72917 (= lt!341777 lt!341782)))

(assert (=> d!72917 (isPrefixOf!0 lt!341769 (_2!9888 lt!341049))))

(assert (=> d!72917 (= lt!341782 (lemmaIsPrefixTransitive!0 lt!341769 (_2!9888 lt!341049) (_2!9888 lt!341049)))))

(declare-fun lt!341785 () Unit!15294)

(declare-fun lt!341770 () Unit!15294)

(assert (=> d!72917 (= lt!341785 lt!341770)))

(assert (=> d!72917 (isPrefixOf!0 lt!341769 (_2!9888 lt!341049))))

(assert (=> d!72917 (= lt!341770 (lemmaIsPrefixTransitive!0 lt!341769 (_2!9888 lt!341080) (_2!9888 lt!341049)))))

(declare-fun lt!341771 () Unit!15294)

(assert (=> d!72917 (= lt!341771 e!147013)))

(declare-fun c!10555 () Bool)

(assert (=> d!72917 (= c!10555 (not (= (size!4655 (buf!5190 (_2!9888 lt!341080))) #b00000000000000000000000000000000)))))

(declare-fun lt!341767 () Unit!15294)

(declare-fun lt!341774 () Unit!15294)

(assert (=> d!72917 (= lt!341767 lt!341774)))

(assert (=> d!72917 (isPrefixOf!0 (_2!9888 lt!341049) (_2!9888 lt!341049))))

(assert (=> d!72917 (= lt!341774 (lemmaIsPrefixRefl!0 (_2!9888 lt!341049)))))

(declare-fun lt!341773 () Unit!15294)

(declare-fun lt!341780 () Unit!15294)

(assert (=> d!72917 (= lt!341773 lt!341780)))

(assert (=> d!72917 (= lt!341780 (lemmaIsPrefixRefl!0 (_2!9888 lt!341049)))))

(declare-fun lt!341783 () Unit!15294)

(declare-fun lt!341778 () Unit!15294)

(assert (=> d!72917 (= lt!341783 lt!341778)))

(assert (=> d!72917 (isPrefixOf!0 lt!341769 lt!341769)))

(assert (=> d!72917 (= lt!341778 (lemmaIsPrefixRefl!0 lt!341769))))

(declare-fun lt!341775 () Unit!15294)

(declare-fun lt!341781 () Unit!15294)

(assert (=> d!72917 (= lt!341775 lt!341781)))

(assert (=> d!72917 (isPrefixOf!0 (_2!9888 lt!341080) (_2!9888 lt!341080))))

(assert (=> d!72917 (= lt!341781 (lemmaIsPrefixRefl!0 (_2!9888 lt!341080)))))

(assert (=> d!72917 (= lt!341769 (BitStream!8419 (buf!5190 (_2!9888 lt!341049)) (currentByte!9768 (_2!9888 lt!341080)) (currentBit!9763 (_2!9888 lt!341080))))))

(assert (=> d!72917 (isPrefixOf!0 (_2!9888 lt!341080) (_2!9888 lt!341049))))

(assert (=> d!72917 (= (reader!0 (_2!9888 lt!341080) (_2!9888 lt!341049)) lt!341772)))

(assert (= (and d!72917 c!10555) b!216143))

(assert (= (and d!72917 (not c!10555)) b!216141))

(assert (= (and d!72917 res!181829) b!216142))

(assert (= (and b!216142 res!181830) b!216139))

(assert (= (and b!216139 res!181831) b!216140))

(assert (=> b!216143 m!332381))

(declare-fun m!333087 () Bool)

(assert (=> b!216143 m!333087))

(declare-fun m!333089 () Bool)

(assert (=> b!216143 m!333089))

(declare-fun m!333091 () Bool)

(assert (=> b!216140 m!333091))

(assert (=> b!216140 m!332407))

(assert (=> b!216140 m!332381))

(declare-fun m!333093 () Bool)

(assert (=> b!216139 m!333093))

(declare-fun m!333095 () Bool)

(assert (=> d!72917 m!333095))

(declare-fun m!333097 () Bool)

(assert (=> d!72917 m!333097))

(declare-fun m!333099 () Bool)

(assert (=> d!72917 m!333099))

(declare-fun m!333101 () Bool)

(assert (=> d!72917 m!333101))

(declare-fun m!333103 () Bool)

(assert (=> d!72917 m!333103))

(assert (=> d!72917 m!332943))

(declare-fun m!333105 () Bool)

(assert (=> d!72917 m!333105))

(declare-fun m!333107 () Bool)

(assert (=> d!72917 m!333107))

(declare-fun m!333109 () Bool)

(assert (=> d!72917 m!333109))

(assert (=> d!72917 m!333079))

(assert (=> d!72917 m!332949))

(declare-fun m!333111 () Bool)

(assert (=> b!216142 m!333111))

(assert (=> b!215822 d!72917))

(declare-fun d!72919 () Bool)

(declare-fun lt!341786 () tuple2!18484)

(assert (=> d!72919 (= lt!341786 (readBit!0 lt!341067))))

(assert (=> d!72919 (= (readBitPure!0 lt!341067) (tuple2!18473 (_2!9897 lt!341786) (_1!9897 lt!341786)))))

(declare-fun bs!17866 () Bool)

(assert (= bs!17866 d!72919))

(declare-fun m!333113 () Bool)

(assert (=> bs!17866 m!333113))

(assert (=> b!215822 d!72919))

(assert (=> b!215822 d!72825))

(declare-fun d!72921 () Bool)

(declare-fun e!147015 () Bool)

(assert (=> d!72921 e!147015))

(declare-fun res!181833 () Bool)

(assert (=> d!72921 (=> (not res!181833) (not e!147015))))

(declare-fun lt!341790 () (_ BitVec 64))

(declare-fun lt!341789 () (_ BitVec 64))

(declare-fun lt!341788 () (_ BitVec 64))

(assert (=> d!72921 (= res!181833 (= lt!341788 (bvsub lt!341789 lt!341790)))))

(assert (=> d!72921 (or (= (bvand lt!341789 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!341790 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!341789 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!341789 lt!341790) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72921 (= lt!341790 (remainingBits!0 ((_ sign_extend 32) (size!4655 (buf!5190 (_2!9888 lt!341080)))) ((_ sign_extend 32) (currentByte!9768 (_2!9888 lt!341080))) ((_ sign_extend 32) (currentBit!9763 (_2!9888 lt!341080)))))))

(declare-fun lt!341791 () (_ BitVec 64))

(declare-fun lt!341792 () (_ BitVec 64))

(assert (=> d!72921 (= lt!341789 (bvmul lt!341791 lt!341792))))

(assert (=> d!72921 (or (= lt!341791 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!341792 (bvsdiv (bvmul lt!341791 lt!341792) lt!341791)))))

(assert (=> d!72921 (= lt!341792 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!72921 (= lt!341791 ((_ sign_extend 32) (size!4655 (buf!5190 (_2!9888 lt!341080)))))))

(assert (=> d!72921 (= lt!341788 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9768 (_2!9888 lt!341080))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9763 (_2!9888 lt!341080)))))))

(assert (=> d!72921 (invariant!0 (currentBit!9763 (_2!9888 lt!341080)) (currentByte!9768 (_2!9888 lt!341080)) (size!4655 (buf!5190 (_2!9888 lt!341080))))))

(assert (=> d!72921 (= (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!341080))) (currentByte!9768 (_2!9888 lt!341080)) (currentBit!9763 (_2!9888 lt!341080))) lt!341788)))

(declare-fun b!216144 () Bool)

(declare-fun res!181832 () Bool)

(assert (=> b!216144 (=> (not res!181832) (not e!147015))))

(assert (=> b!216144 (= res!181832 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!341788))))

(declare-fun b!216145 () Bool)

(declare-fun lt!341787 () (_ BitVec 64))

(assert (=> b!216145 (= e!147015 (bvsle lt!341788 (bvmul lt!341787 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!216145 (or (= lt!341787 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!341787 #b0000000000000000000000000000000000000000000000000000000000001000) lt!341787)))))

(assert (=> b!216145 (= lt!341787 ((_ sign_extend 32) (size!4655 (buf!5190 (_2!9888 lt!341080)))))))

(assert (= (and d!72921 res!181833) b!216144))

(assert (= (and b!216144 res!181832) b!216145))

(declare-fun m!333115 () Bool)

(assert (=> d!72921 m!333115))

(declare-fun m!333117 () Bool)

(assert (=> d!72921 m!333117))

(assert (=> b!215822 d!72921))

(declare-fun d!72923 () Bool)

(declare-fun lt!341798 () tuple2!18470)

(declare-fun lt!341795 () tuple2!18470)

(assert (=> d!72923 (and (= (_2!9890 lt!341798) (_2!9890 lt!341795)) (= (_1!9890 lt!341798) (_1!9890 lt!341795)))))

(declare-fun lt!341797 () BitStream!8418)

(declare-fun lt!341794 () (_ BitVec 64))

(declare-fun lt!341796 () Bool)

(declare-fun lt!341793 () Unit!15294)

(assert (=> d!72923 (= lt!341793 (choose!56 (_1!9889 lt!341084) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!341069 lt!341798 (tuple2!18471 (_1!9890 lt!341798) (_2!9890 lt!341798)) (_1!9890 lt!341798) (_2!9890 lt!341798) lt!341796 lt!341797 lt!341794 lt!341795 (tuple2!18471 (_1!9890 lt!341795) (_2!9890 lt!341795)) (_1!9890 lt!341795) (_2!9890 lt!341795)))))

(assert (=> d!72923 (= lt!341795 (readNBitsLSBFirstsLoopPure!0 lt!341797 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) lt!341794))))

(assert (=> d!72923 (= lt!341794 (bvor lt!341069 (ite lt!341796 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72923 (= lt!341797 (withMovedBitIndex!0 (_1!9889 lt!341084) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!72923 (= lt!341796 (_2!9891 (readBitPure!0 (_1!9889 lt!341084))))))

(assert (=> d!72923 (= lt!341798 (readNBitsLSBFirstsLoopPure!0 (_1!9889 lt!341084) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!341069))))

(assert (=> d!72923 (= (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9889 lt!341084) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!341069) lt!341793)))

(declare-fun bs!17867 () Bool)

(assert (= bs!17867 d!72923))

(assert (=> bs!17867 m!332379))

(declare-fun m!333119 () Bool)

(assert (=> bs!17867 m!333119))

(assert (=> bs!17867 m!332411))

(assert (=> bs!17867 m!332387))

(declare-fun m!333121 () Bool)

(assert (=> bs!17867 m!333121))

(assert (=> b!215822 d!72923))

(declare-fun d!72925 () Bool)

(declare-fun e!147016 () Bool)

(assert (=> d!72925 e!147016))

(declare-fun res!181834 () Bool)

(assert (=> d!72925 (=> (not res!181834) (not e!147016))))

(declare-fun lt!341800 () tuple2!18472)

(declare-fun lt!341801 () tuple2!18472)

(assert (=> d!72925 (= res!181834 (= (bitIndex!0 (size!4655 (buf!5190 (_1!9891 lt!341800))) (currentByte!9768 (_1!9891 lt!341800)) (currentBit!9763 (_1!9891 lt!341800))) (bitIndex!0 (size!4655 (buf!5190 (_1!9891 lt!341801))) (currentByte!9768 (_1!9891 lt!341801)) (currentBit!9763 (_1!9891 lt!341801)))))))

(declare-fun lt!341802 () Unit!15294)

(declare-fun lt!341799 () BitStream!8418)

(assert (=> d!72925 (= lt!341802 (choose!50 lt!341067 (_2!9888 lt!341049) lt!341799 lt!341800 (tuple2!18473 (_1!9891 lt!341800) (_2!9891 lt!341800)) (_1!9891 lt!341800) (_2!9891 lt!341800) lt!341801 (tuple2!18473 (_1!9891 lt!341801) (_2!9891 lt!341801)) (_1!9891 lt!341801) (_2!9891 lt!341801)))))

(assert (=> d!72925 (= lt!341801 (readBitPure!0 lt!341799))))

(assert (=> d!72925 (= lt!341800 (readBitPure!0 lt!341067))))

(assert (=> d!72925 (= lt!341799 (BitStream!8419 (buf!5190 (_2!9888 lt!341049)) (currentByte!9768 lt!341067) (currentBit!9763 lt!341067)))))

(assert (=> d!72925 (invariant!0 (currentBit!9763 lt!341067) (currentByte!9768 lt!341067) (size!4655 (buf!5190 (_2!9888 lt!341049))))))

(assert (=> d!72925 (= (readBitPrefixLemma!0 lt!341067 (_2!9888 lt!341049)) lt!341802)))

(declare-fun b!216146 () Bool)

(assert (=> b!216146 (= e!147016 (= (_2!9891 lt!341800) (_2!9891 lt!341801)))))

(assert (= (and d!72925 res!181834) b!216146))

(assert (=> d!72925 m!332393))

(declare-fun m!333123 () Bool)

(assert (=> d!72925 m!333123))

(declare-fun m!333125 () Bool)

(assert (=> d!72925 m!333125))

(declare-fun m!333127 () Bool)

(assert (=> d!72925 m!333127))

(assert (=> d!72925 m!332395))

(declare-fun m!333129 () Bool)

(assert (=> d!72925 m!333129))

(assert (=> b!215822 d!72925))

(declare-fun d!72927 () Bool)

(assert (=> d!72927 (validate_offset_bits!1 ((_ sign_extend 32) (size!4655 (buf!5190 (_2!9888 lt!341049)))) ((_ sign_extend 32) (currentByte!9768 (_2!9888 lt!341080))) ((_ sign_extend 32) (currentBit!9763 (_2!9888 lt!341080))) lt!341088)))

(declare-fun lt!341803 () Unit!15294)

(assert (=> d!72927 (= lt!341803 (choose!9 (_2!9888 lt!341080) (buf!5190 (_2!9888 lt!341049)) lt!341088 (BitStream!8419 (buf!5190 (_2!9888 lt!341049)) (currentByte!9768 (_2!9888 lt!341080)) (currentBit!9763 (_2!9888 lt!341080)))))))

(assert (=> d!72927 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9888 lt!341080) (buf!5190 (_2!9888 lt!341049)) lt!341088) lt!341803)))

(declare-fun bs!17868 () Bool)

(assert (= bs!17868 d!72927))

(assert (=> bs!17868 m!332401))

(declare-fun m!333131 () Bool)

(assert (=> bs!17868 m!333131))

(assert (=> b!215822 d!72927))

(declare-fun d!72929 () Bool)

(declare-fun lt!341804 () tuple2!18482)

(assert (=> d!72929 (= lt!341804 (readNBitsLSBFirstsLoop!0 (_1!9889 lt!341097) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(assert (=> d!72929 (= (readNBitsLSBFirstsLoopPure!0 (_1!9889 lt!341097) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))) (tuple2!18471 (_2!9896 lt!341804) (_1!9896 lt!341804)))))

(declare-fun bs!17869 () Bool)

(assert (= bs!17869 d!72929))

(declare-fun m!333133 () Bool)

(assert (=> bs!17869 m!333133))

(assert (=> b!215822 d!72929))

(declare-fun d!72931 () Bool)

(declare-fun e!147017 () Bool)

(assert (=> d!72931 e!147017))

(declare-fun res!181836 () Bool)

(assert (=> d!72931 (=> (not res!181836) (not e!147017))))

(declare-fun lt!341807 () (_ BitVec 64))

(declare-fun lt!341808 () (_ BitVec 64))

(declare-fun lt!341806 () (_ BitVec 64))

(assert (=> d!72931 (= res!181836 (= lt!341806 (bvsub lt!341807 lt!341808)))))

(assert (=> d!72931 (or (= (bvand lt!341807 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!341808 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!341807 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!341807 lt!341808) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72931 (= lt!341808 (remainingBits!0 ((_ sign_extend 32) (size!4655 (buf!5190 (_1!9891 lt!341066)))) ((_ sign_extend 32) (currentByte!9768 (_1!9891 lt!341066))) ((_ sign_extend 32) (currentBit!9763 (_1!9891 lt!341066)))))))

(declare-fun lt!341809 () (_ BitVec 64))

(declare-fun lt!341810 () (_ BitVec 64))

(assert (=> d!72931 (= lt!341807 (bvmul lt!341809 lt!341810))))

(assert (=> d!72931 (or (= lt!341809 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!341810 (bvsdiv (bvmul lt!341809 lt!341810) lt!341809)))))

(assert (=> d!72931 (= lt!341810 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!72931 (= lt!341809 ((_ sign_extend 32) (size!4655 (buf!5190 (_1!9891 lt!341066)))))))

(assert (=> d!72931 (= lt!341806 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9768 (_1!9891 lt!341066))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9763 (_1!9891 lt!341066)))))))

(assert (=> d!72931 (invariant!0 (currentBit!9763 (_1!9891 lt!341066)) (currentByte!9768 (_1!9891 lt!341066)) (size!4655 (buf!5190 (_1!9891 lt!341066))))))

(assert (=> d!72931 (= (bitIndex!0 (size!4655 (buf!5190 (_1!9891 lt!341066))) (currentByte!9768 (_1!9891 lt!341066)) (currentBit!9763 (_1!9891 lt!341066))) lt!341806)))

(declare-fun b!216147 () Bool)

(declare-fun res!181835 () Bool)

(assert (=> b!216147 (=> (not res!181835) (not e!147017))))

(assert (=> b!216147 (= res!181835 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!341806))))

(declare-fun b!216148 () Bool)

(declare-fun lt!341805 () (_ BitVec 64))

(assert (=> b!216148 (= e!147017 (bvsle lt!341806 (bvmul lt!341805 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!216148 (or (= lt!341805 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!341805 #b0000000000000000000000000000000000000000000000000000000000001000) lt!341805)))))

(assert (=> b!216148 (= lt!341805 ((_ sign_extend 32) (size!4655 (buf!5190 (_1!9891 lt!341066)))))))

(assert (= (and d!72931 res!181836) b!216147))

(assert (= (and b!216147 res!181835) b!216148))

(declare-fun m!333135 () Bool)

(assert (=> d!72931 m!333135))

(declare-fun m!333137 () Bool)

(assert (=> d!72931 m!333137))

(assert (=> b!215822 d!72931))

(declare-fun d!72933 () Bool)

(assert (=> d!72933 (isPrefixOf!0 (_2!9888 lt!340226) (_2!9888 lt!341049))))

(declare-fun lt!341811 () Unit!15294)

(assert (=> d!72933 (= lt!341811 (choose!30 (_2!9888 lt!340226) (_2!9888 lt!341080) (_2!9888 lt!341049)))))

(assert (=> d!72933 (isPrefixOf!0 (_2!9888 lt!340226) (_2!9888 lt!341080))))

(assert (=> d!72933 (= (lemmaIsPrefixTransitive!0 (_2!9888 lt!340226) (_2!9888 lt!341080) (_2!9888 lt!341049)) lt!341811)))

(declare-fun bs!17870 () Bool)

(assert (= bs!17870 d!72933))

(assert (=> bs!17870 m!332945))

(declare-fun m!333139 () Bool)

(assert (=> bs!17870 m!333139))

(declare-fun m!333141 () Bool)

(assert (=> bs!17870 m!333141))

(assert (=> b!215822 d!72933))

(declare-fun d!72935 () Bool)

(assert (=> d!72935 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4655 (buf!5190 (_2!9888 lt!341049)))) ((_ sign_extend 32) (currentByte!9768 (_2!9888 lt!341080))) ((_ sign_extend 32) (currentBit!9763 (_2!9888 lt!341080))) lt!341088) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4655 (buf!5190 (_2!9888 lt!341049)))) ((_ sign_extend 32) (currentByte!9768 (_2!9888 lt!341080))) ((_ sign_extend 32) (currentBit!9763 (_2!9888 lt!341080)))) lt!341088))))

(declare-fun bs!17871 () Bool)

(assert (= bs!17871 d!72935))

(declare-fun m!333143 () Bool)

(assert (=> bs!17871 m!333143))

(assert (=> b!215822 d!72935))

(declare-fun d!72937 () Bool)

(declare-fun e!147018 () Bool)

(assert (=> d!72937 e!147018))

(declare-fun res!181837 () Bool)

(assert (=> d!72937 (=> (not res!181837) (not e!147018))))

(declare-fun lt!341813 () (_ BitVec 64))

(declare-fun lt!341812 () BitStream!8418)

(assert (=> d!72937 (= res!181837 (= (bvadd lt!341813 (bvsub (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!340226))) (currentByte!9768 (_2!9888 lt!340226)) (currentBit!9763 (_2!9888 lt!340226))) (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!341049))) (currentByte!9768 (_2!9888 lt!341049)) (currentBit!9763 (_2!9888 lt!341049))))) (bitIndex!0 (size!4655 (buf!5190 lt!341812)) (currentByte!9768 lt!341812) (currentBit!9763 lt!341812))))))

(assert (=> d!72937 (or (not (= (bvand lt!341813 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!340226))) (currentByte!9768 (_2!9888 lt!340226)) (currentBit!9763 (_2!9888 lt!340226))) (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!341049))) (currentByte!9768 (_2!9888 lt!341049)) (currentBit!9763 (_2!9888 lt!341049)))) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!341813 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!341813 (bvsub (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!340226))) (currentByte!9768 (_2!9888 lt!340226)) (currentBit!9763 (_2!9888 lt!340226))) (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!341049))) (currentByte!9768 (_2!9888 lt!341049)) (currentBit!9763 (_2!9888 lt!341049))))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72937 (= lt!341813 (bitIndex!0 (size!4655 (buf!5190 (_2!9889 lt!341084))) (currentByte!9768 (_2!9889 lt!341084)) (currentBit!9763 (_2!9889 lt!341084))))))

(assert (=> d!72937 (= lt!341812 (_2!9888 (moveBitIndex!0 (_2!9889 lt!341084) (bvsub (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!340226))) (currentByte!9768 (_2!9888 lt!340226)) (currentBit!9763 (_2!9888 lt!340226))) (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!341049))) (currentByte!9768 (_2!9888 lt!341049)) (currentBit!9763 (_2!9888 lt!341049)))))))))

(assert (=> d!72937 (moveBitIndexPrecond!0 (_2!9889 lt!341084) (bvsub (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!340226))) (currentByte!9768 (_2!9888 lt!340226)) (currentBit!9763 (_2!9888 lt!340226))) (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!341049))) (currentByte!9768 (_2!9888 lt!341049)) (currentBit!9763 (_2!9888 lt!341049)))))))

(assert (=> d!72937 (= (withMovedBitIndex!0 (_2!9889 lt!341084) (bvsub (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!340226))) (currentByte!9768 (_2!9888 lt!340226)) (currentBit!9763 (_2!9888 lt!340226))) (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!341049))) (currentByte!9768 (_2!9888 lt!341049)) (currentBit!9763 (_2!9888 lt!341049))))) lt!341812)))

(declare-fun b!216149 () Bool)

(assert (=> b!216149 (= e!147018 (= (size!4655 (buf!5190 (_2!9889 lt!341084))) (size!4655 (buf!5190 lt!341812))))))

(assert (= (and d!72937 res!181837) b!216149))

(declare-fun m!333145 () Bool)

(assert (=> d!72937 m!333145))

(declare-fun m!333147 () Bool)

(assert (=> d!72937 m!333147))

(declare-fun m!333149 () Bool)

(assert (=> d!72937 m!333149))

(declare-fun m!333151 () Bool)

(assert (=> d!72937 m!333151))

(assert (=> b!215822 d!72937))

(declare-fun d!72939 () Bool)

(declare-fun e!147019 () Bool)

(assert (=> d!72939 e!147019))

(declare-fun res!181838 () Bool)

(assert (=> d!72939 (=> (not res!181838) (not e!147019))))

(declare-fun lt!341815 () (_ BitVec 64))

(declare-fun lt!341814 () BitStream!8418)

(assert (=> d!72939 (= res!181838 (= (bvadd lt!341815 (bvsub (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!341080))) (currentByte!9768 (_2!9888 lt!341080)) (currentBit!9763 (_2!9888 lt!341080))) (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!341049))) (currentByte!9768 (_2!9888 lt!341049)) (currentBit!9763 (_2!9888 lt!341049))))) (bitIndex!0 (size!4655 (buf!5190 lt!341814)) (currentByte!9768 lt!341814) (currentBit!9763 lt!341814))))))

(assert (=> d!72939 (or (not (= (bvand lt!341815 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!341080))) (currentByte!9768 (_2!9888 lt!341080)) (currentBit!9763 (_2!9888 lt!341080))) (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!341049))) (currentByte!9768 (_2!9888 lt!341049)) (currentBit!9763 (_2!9888 lt!341049)))) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!341815 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!341815 (bvsub (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!341080))) (currentByte!9768 (_2!9888 lt!341080)) (currentBit!9763 (_2!9888 lt!341080))) (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!341049))) (currentByte!9768 (_2!9888 lt!341049)) (currentBit!9763 (_2!9888 lt!341049))))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72939 (= lt!341815 (bitIndex!0 (size!4655 (buf!5190 (_2!9889 lt!341094))) (currentByte!9768 (_2!9889 lt!341094)) (currentBit!9763 (_2!9889 lt!341094))))))

(assert (=> d!72939 (= lt!341814 (_2!9888 (moveBitIndex!0 (_2!9889 lt!341094) (bvsub (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!341080))) (currentByte!9768 (_2!9888 lt!341080)) (currentBit!9763 (_2!9888 lt!341080))) (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!341049))) (currentByte!9768 (_2!9888 lt!341049)) (currentBit!9763 (_2!9888 lt!341049)))))))))

(assert (=> d!72939 (moveBitIndexPrecond!0 (_2!9889 lt!341094) (bvsub (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!341080))) (currentByte!9768 (_2!9888 lt!341080)) (currentBit!9763 (_2!9888 lt!341080))) (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!341049))) (currentByte!9768 (_2!9888 lt!341049)) (currentBit!9763 (_2!9888 lt!341049)))))))

(assert (=> d!72939 (= (withMovedBitIndex!0 (_2!9889 lt!341094) (bvsub (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!341080))) (currentByte!9768 (_2!9888 lt!341080)) (currentBit!9763 (_2!9888 lt!341080))) (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!341049))) (currentByte!9768 (_2!9888 lt!341049)) (currentBit!9763 (_2!9888 lt!341049))))) lt!341814)))

(declare-fun b!216150 () Bool)

(assert (=> b!216150 (= e!147019 (= (size!4655 (buf!5190 (_2!9889 lt!341094))) (size!4655 (buf!5190 lt!341814))))))

(assert (= (and d!72939 res!181838) b!216150))

(declare-fun m!333153 () Bool)

(assert (=> d!72939 m!333153))

(declare-fun m!333155 () Bool)

(assert (=> d!72939 m!333155))

(declare-fun m!333157 () Bool)

(assert (=> d!72939 m!333157))

(declare-fun m!333159 () Bool)

(assert (=> d!72939 m!333159))

(assert (=> b!215822 d!72939))

(assert (=> b!215822 d!72481))

(declare-fun d!72941 () Bool)

(assert (=> d!72941 (= (invariant!0 (currentBit!9763 lt!341067) (currentByte!9768 lt!341067) (size!4655 (buf!5190 (_2!9888 lt!341049)))) (and (bvsge (currentBit!9763 lt!341067) #b00000000000000000000000000000000) (bvslt (currentBit!9763 lt!341067) #b00000000000000000000000000001000) (bvsge (currentByte!9768 lt!341067) #b00000000000000000000000000000000) (or (bvslt (currentByte!9768 lt!341067) (size!4655 (buf!5190 (_2!9888 lt!341049)))) (and (= (currentBit!9763 lt!341067) #b00000000000000000000000000000000) (= (currentByte!9768 lt!341067) (size!4655 (buf!5190 (_2!9888 lt!341049))))))))))

(assert (=> b!215822 d!72941))

(declare-fun d!72943 () Bool)

(assert (=> d!72943 (= (invariant!0 (currentBit!9763 (_2!9888 lt!340226)) (currentByte!9768 (_2!9888 lt!340226)) (size!4655 (buf!5190 (_2!9888 lt!341080)))) (and (bvsge (currentBit!9763 (_2!9888 lt!340226)) #b00000000000000000000000000000000) (bvslt (currentBit!9763 (_2!9888 lt!340226)) #b00000000000000000000000000001000) (bvsge (currentByte!9768 (_2!9888 lt!340226)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9768 (_2!9888 lt!340226)) (size!4655 (buf!5190 (_2!9888 lt!341080)))) (and (= (currentBit!9763 (_2!9888 lt!340226)) #b00000000000000000000000000000000) (= (currentByte!9768 (_2!9888 lt!340226)) (size!4655 (buf!5190 (_2!9888 lt!341080))))))))))

(assert (=> b!215822 d!72943))

(assert (=> b!215822 d!72529))

(declare-fun d!72945 () Bool)

(declare-fun e!147020 () Bool)

(assert (=> d!72945 e!147020))

(declare-fun res!181840 () Bool)

(assert (=> d!72945 (=> (not res!181840) (not e!147020))))

(declare-fun lt!341817 () (_ BitVec 64))

(declare-fun lt!341818 () (_ BitVec 64))

(declare-fun lt!341819 () (_ BitVec 64))

(assert (=> d!72945 (= res!181840 (= lt!341817 (bvsub lt!341818 lt!341819)))))

(assert (=> d!72945 (or (= (bvand lt!341818 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!341819 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!341818 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!341818 lt!341819) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72945 (= lt!341819 (remainingBits!0 ((_ sign_extend 32) (size!4655 (buf!5190 lt!340374))) ((_ sign_extend 32) (currentByte!9768 lt!340374)) ((_ sign_extend 32) (currentBit!9763 lt!340374))))))

(declare-fun lt!341820 () (_ BitVec 64))

(declare-fun lt!341821 () (_ BitVec 64))

(assert (=> d!72945 (= lt!341818 (bvmul lt!341820 lt!341821))))

(assert (=> d!72945 (or (= lt!341820 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!341821 (bvsdiv (bvmul lt!341820 lt!341821) lt!341820)))))

(assert (=> d!72945 (= lt!341821 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!72945 (= lt!341820 ((_ sign_extend 32) (size!4655 (buf!5190 lt!340374))))))

(assert (=> d!72945 (= lt!341817 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9768 lt!340374)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9763 lt!340374))))))

(assert (=> d!72945 (invariant!0 (currentBit!9763 lt!340374) (currentByte!9768 lt!340374) (size!4655 (buf!5190 lt!340374)))))

(assert (=> d!72945 (= (bitIndex!0 (size!4655 (buf!5190 lt!340374)) (currentByte!9768 lt!340374) (currentBit!9763 lt!340374)) lt!341817)))

(declare-fun b!216151 () Bool)

(declare-fun res!181839 () Bool)

(assert (=> b!216151 (=> (not res!181839) (not e!147020))))

(assert (=> b!216151 (= res!181839 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!341817))))

(declare-fun b!216152 () Bool)

(declare-fun lt!341816 () (_ BitVec 64))

(assert (=> b!216152 (= e!147020 (bvsle lt!341817 (bvmul lt!341816 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!216152 (or (= lt!341816 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!341816 #b0000000000000000000000000000000000000000000000000000000000001000) lt!341816)))))

(assert (=> b!216152 (= lt!341816 ((_ sign_extend 32) (size!4655 (buf!5190 lt!340374))))))

(assert (= (and d!72945 res!181840) b!216151))

(assert (= (and b!216151 res!181839) b!216152))

(declare-fun m!333161 () Bool)

(assert (=> d!72945 m!333161))

(declare-fun m!333163 () Bool)

(assert (=> d!72945 m!333163))

(assert (=> d!72491 d!72945))

(declare-fun d!72947 () Bool)

(declare-fun e!147021 () Bool)

(assert (=> d!72947 e!147021))

(declare-fun res!181842 () Bool)

(assert (=> d!72947 (=> (not res!181842) (not e!147021))))

(declare-fun lt!341823 () (_ BitVec 64))

(declare-fun lt!341825 () (_ BitVec 64))

(declare-fun lt!341824 () (_ BitVec 64))

(assert (=> d!72947 (= res!181842 (= lt!341823 (bvsub lt!341824 lt!341825)))))

(assert (=> d!72947 (or (= (bvand lt!341824 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!341825 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!341824 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!341824 lt!341825) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72947 (= lt!341825 (remainingBits!0 ((_ sign_extend 32) (size!4655 (buf!5190 (_2!9889 lt!340223)))) ((_ sign_extend 32) (currentByte!9768 (_2!9889 lt!340223))) ((_ sign_extend 32) (currentBit!9763 (_2!9889 lt!340223)))))))

(declare-fun lt!341826 () (_ BitVec 64))

(declare-fun lt!341827 () (_ BitVec 64))

(assert (=> d!72947 (= lt!341824 (bvmul lt!341826 lt!341827))))

(assert (=> d!72947 (or (= lt!341826 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!341827 (bvsdiv (bvmul lt!341826 lt!341827) lt!341826)))))

(assert (=> d!72947 (= lt!341827 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!72947 (= lt!341826 ((_ sign_extend 32) (size!4655 (buf!5190 (_2!9889 lt!340223)))))))

(assert (=> d!72947 (= lt!341823 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9768 (_2!9889 lt!340223))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9763 (_2!9889 lt!340223)))))))

(assert (=> d!72947 (invariant!0 (currentBit!9763 (_2!9889 lt!340223)) (currentByte!9768 (_2!9889 lt!340223)) (size!4655 (buf!5190 (_2!9889 lt!340223))))))

(assert (=> d!72947 (= (bitIndex!0 (size!4655 (buf!5190 (_2!9889 lt!340223))) (currentByte!9768 (_2!9889 lt!340223)) (currentBit!9763 (_2!9889 lt!340223))) lt!341823)))

(declare-fun b!216153 () Bool)

(declare-fun res!181841 () Bool)

(assert (=> b!216153 (=> (not res!181841) (not e!147021))))

(assert (=> b!216153 (= res!181841 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!341823))))

(declare-fun b!216154 () Bool)

(declare-fun lt!341822 () (_ BitVec 64))

(assert (=> b!216154 (= e!147021 (bvsle lt!341823 (bvmul lt!341822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!216154 (or (= lt!341822 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!341822 #b0000000000000000000000000000000000000000000000000000000000001000) lt!341822)))))

(assert (=> b!216154 (= lt!341822 ((_ sign_extend 32) (size!4655 (buf!5190 (_2!9889 lt!340223)))))))

(assert (= (and d!72947 res!181842) b!216153))

(assert (= (and b!216153 res!181841) b!216154))

(declare-fun m!333165 () Bool)

(assert (=> d!72947 m!333165))

(declare-fun m!333167 () Bool)

(assert (=> d!72947 m!333167))

(assert (=> d!72491 d!72947))

(declare-fun d!72949 () Bool)

(declare-fun lt!341832 () (_ BitVec 32))

(assert (=> d!72949 (= lt!341832 ((_ extract 31 0) (bvsrem (bvsub lt!340238 lt!340230) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!341830 () (_ BitVec 32))

(assert (=> d!72949 (= lt!341830 ((_ extract 31 0) (bvsdiv (bvsub lt!340238 lt!340230) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!147022 () Bool)

(assert (=> d!72949 e!147022))

(declare-fun res!181844 () Bool)

(assert (=> d!72949 (=> (not res!181844) (not e!147022))))

(assert (=> d!72949 (= res!181844 (moveBitIndexPrecond!0 (_2!9889 lt!340223) (bvsub lt!340238 lt!340230)))))

(declare-fun Unit!15357 () Unit!15294)

(declare-fun Unit!15358 () Unit!15294)

(declare-fun Unit!15359 () Unit!15294)

(assert (=> d!72949 (= (moveBitIndex!0 (_2!9889 lt!340223) (bvsub lt!340238 lt!340230)) (ite (bvslt (bvadd (currentBit!9763 (_2!9889 lt!340223)) lt!341832) #b00000000000000000000000000000000) (tuple2!18467 Unit!15357 (BitStream!8419 (buf!5190 (_2!9889 lt!340223)) (bvsub (bvadd (currentByte!9768 (_2!9889 lt!340223)) lt!341830) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!341832 (currentBit!9763 (_2!9889 lt!340223))))) (ite (bvsge (bvadd (currentBit!9763 (_2!9889 lt!340223)) lt!341832) #b00000000000000000000000000001000) (tuple2!18467 Unit!15358 (BitStream!8419 (buf!5190 (_2!9889 lt!340223)) (bvadd (currentByte!9768 (_2!9889 lt!340223)) lt!341830 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!9763 (_2!9889 lt!340223)) lt!341832) #b00000000000000000000000000001000))) (tuple2!18467 Unit!15359 (BitStream!8419 (buf!5190 (_2!9889 lt!340223)) (bvadd (currentByte!9768 (_2!9889 lt!340223)) lt!341830) (bvadd (currentBit!9763 (_2!9889 lt!340223)) lt!341832))))))))

(declare-fun b!216155 () Bool)

(declare-fun e!147023 () Bool)

(assert (=> b!216155 (= e!147022 e!147023)))

(declare-fun res!181843 () Bool)

(assert (=> b!216155 (=> (not res!181843) (not e!147023))))

(declare-fun lt!341829 () (_ BitVec 64))

(declare-fun lt!341833 () tuple2!18466)

(assert (=> b!216155 (= res!181843 (= (bvadd lt!341829 (bvsub lt!340238 lt!340230)) (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!341833))) (currentByte!9768 (_2!9888 lt!341833)) (currentBit!9763 (_2!9888 lt!341833)))))))

(assert (=> b!216155 (or (not (= (bvand lt!341829 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!340238 lt!340230) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!341829 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!341829 (bvsub lt!340238 lt!340230)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!216155 (= lt!341829 (bitIndex!0 (size!4655 (buf!5190 (_2!9889 lt!340223))) (currentByte!9768 (_2!9889 lt!340223)) (currentBit!9763 (_2!9889 lt!340223))))))

(declare-fun lt!341828 () (_ BitVec 32))

(declare-fun lt!341831 () (_ BitVec 32))

(declare-fun Unit!15360 () Unit!15294)

(declare-fun Unit!15361 () Unit!15294)

(declare-fun Unit!15362 () Unit!15294)

(assert (=> b!216155 (= lt!341833 (ite (bvslt (bvadd (currentBit!9763 (_2!9889 lt!340223)) lt!341828) #b00000000000000000000000000000000) (tuple2!18467 Unit!15360 (BitStream!8419 (buf!5190 (_2!9889 lt!340223)) (bvsub (bvadd (currentByte!9768 (_2!9889 lt!340223)) lt!341831) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!341828 (currentBit!9763 (_2!9889 lt!340223))))) (ite (bvsge (bvadd (currentBit!9763 (_2!9889 lt!340223)) lt!341828) #b00000000000000000000000000001000) (tuple2!18467 Unit!15361 (BitStream!8419 (buf!5190 (_2!9889 lt!340223)) (bvadd (currentByte!9768 (_2!9889 lt!340223)) lt!341831 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!9763 (_2!9889 lt!340223)) lt!341828) #b00000000000000000000000000001000))) (tuple2!18467 Unit!15362 (BitStream!8419 (buf!5190 (_2!9889 lt!340223)) (bvadd (currentByte!9768 (_2!9889 lt!340223)) lt!341831) (bvadd (currentBit!9763 (_2!9889 lt!340223)) lt!341828))))))))

(assert (=> b!216155 (= lt!341828 ((_ extract 31 0) (bvsrem (bvsub lt!340238 lt!340230) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!216155 (= lt!341831 ((_ extract 31 0) (bvsdiv (bvsub lt!340238 lt!340230) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!216156 () Bool)

(assert (=> b!216156 (= e!147023 (and (= (size!4655 (buf!5190 (_2!9889 lt!340223))) (size!4655 (buf!5190 (_2!9888 lt!341833)))) (= (buf!5190 (_2!9889 lt!340223)) (buf!5190 (_2!9888 lt!341833)))))))

(assert (= (and d!72949 res!181844) b!216155))

(assert (= (and b!216155 res!181843) b!216156))

(assert (=> d!72949 m!331903))

(declare-fun m!333169 () Bool)

(assert (=> b!216155 m!333169))

(assert (=> b!216155 m!331899))

(assert (=> d!72491 d!72949))

(declare-fun d!72951 () Bool)

(declare-fun res!181845 () Bool)

(declare-fun e!147024 () Bool)

(assert (=> d!72951 (=> (not res!181845) (not e!147024))))

(assert (=> d!72951 (= res!181845 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!4655 (buf!5190 (_2!9889 lt!340223))))) (bvsub lt!340238 lt!340230)) (bvsle (bvsub lt!340238 lt!340230) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!4655 (buf!5190 (_2!9889 lt!340223))))))))))

(assert (=> d!72951 (= (moveBitIndexPrecond!0 (_2!9889 lt!340223) (bvsub lt!340238 lt!340230)) e!147024)))

(declare-fun b!216157 () Bool)

(declare-fun lt!341834 () (_ BitVec 64))

(assert (=> b!216157 (= e!147024 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!341834) (bvsle lt!341834 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!4655 (buf!5190 (_2!9889 lt!340223))))))))))

(assert (=> b!216157 (= lt!341834 (bvadd (bitIndex!0 (size!4655 (buf!5190 (_2!9889 lt!340223))) (currentByte!9768 (_2!9889 lt!340223)) (currentBit!9763 (_2!9889 lt!340223))) (bvsub lt!340238 lt!340230)))))

(assert (= (and d!72951 res!181845) b!216157))

(assert (=> b!216157 m!331899))

(assert (=> d!72491 d!72951))

(declare-fun d!72953 () Bool)

(declare-fun res!181846 () Bool)

(declare-fun e!147025 () Bool)

(assert (=> d!72953 (=> (not res!181846) (not e!147025))))

(assert (=> d!72953 (= res!181846 (= (size!4655 (buf!5190 (_2!9888 lt!340226))) (size!4655 (buf!5190 (_2!9888 lt!341070)))))))

(assert (=> d!72953 (= (isPrefixOf!0 (_2!9888 lt!340226) (_2!9888 lt!341070)) e!147025)))

(declare-fun b!216158 () Bool)

(declare-fun res!181848 () Bool)

(assert (=> b!216158 (=> (not res!181848) (not e!147025))))

(assert (=> b!216158 (= res!181848 (bvsle (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!340226))) (currentByte!9768 (_2!9888 lt!340226)) (currentBit!9763 (_2!9888 lt!340226))) (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!341070))) (currentByte!9768 (_2!9888 lt!341070)) (currentBit!9763 (_2!9888 lt!341070)))))))

(declare-fun b!216159 () Bool)

(declare-fun e!147026 () Bool)

(assert (=> b!216159 (= e!147025 e!147026)))

(declare-fun res!181847 () Bool)

(assert (=> b!216159 (=> res!181847 e!147026)))

(assert (=> b!216159 (= res!181847 (= (size!4655 (buf!5190 (_2!9888 lt!340226))) #b00000000000000000000000000000000))))

(declare-fun b!216160 () Bool)

(assert (=> b!216160 (= e!147026 (arrayBitRangesEq!0 (buf!5190 (_2!9888 lt!340226)) (buf!5190 (_2!9888 lt!341070)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!340226))) (currentByte!9768 (_2!9888 lt!340226)) (currentBit!9763 (_2!9888 lt!340226)))))))

(assert (= (and d!72953 res!181846) b!216158))

(assert (= (and b!216158 res!181848) b!216159))

(assert (= (and b!216159 (not res!181847)) b!216160))

(assert (=> b!216158 m!331713))

(assert (=> b!216158 m!332417))

(assert (=> b!216160 m!331713))

(assert (=> b!216160 m!331713))

(declare-fun m!333171 () Bool)

(assert (=> b!216160 m!333171))

(assert (=> b!215820 d!72953))

(declare-fun b!216161 () Bool)

(declare-fun res!181852 () Bool)

(declare-fun e!147027 () Bool)

(assert (=> b!216161 (=> (not res!181852) (not e!147027))))

(declare-fun lt!341838 () tuple2!18482)

(declare-fun lt!341836 () (_ BitVec 64))

(declare-fun lt!341835 () (_ BitVec 64))

(assert (=> b!216161 (= res!181852 (= (bitIndex!0 (size!4655 (buf!5190 (_2!9896 lt!341838))) (currentByte!9768 (_2!9896 lt!341838)) (currentBit!9763 (_2!9896 lt!341838))) (bvadd lt!341836 lt!341835)))))

(assert (=> b!216161 (or (not (= (bvand lt!341836 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!341835 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!341836 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!341836 lt!341835) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!216161 (= lt!341835 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!216161 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!216161 (= lt!341836 (bitIndex!0 (size!4655 (buf!5190 (_1!9889 lt!340223))) (currentByte!9768 (_1!9889 lt!340223)) (currentBit!9763 (_1!9889 lt!340223))))))

(declare-fun b!216162 () Bool)

(declare-fun res!181849 () Bool)

(assert (=> b!216162 (=> (not res!181849) (not e!147027))))

(assert (=> b!216162 (= res!181849 (= (bvand (_1!9896 lt!341838) (onesLSBLong!0 nBits!348)) (_1!9896 lt!341838)))))

(declare-fun b!216163 () Bool)

(declare-fun e!147029 () tuple2!18482)

(assert (=> b!216163 (= e!147029 (tuple2!18483 lt!340233 (_1!9889 lt!340223)))))

(declare-fun b!216164 () Bool)

(declare-fun res!181853 () Bool)

(assert (=> b!216164 (=> (not res!181853) (not e!147027))))

(assert (=> b!216164 (= res!181853 (= (bvand (_1!9896 lt!341838) (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))) (bvand lt!340233 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun b!216165 () Bool)

(declare-fun lt!341839 () tuple2!18482)

(assert (=> b!216165 (= e!147029 (tuple2!18483 (_1!9896 lt!341839) (_2!9896 lt!341839)))))

(declare-fun lt!341837 () tuple2!18484)

(assert (=> b!216165 (= lt!341837 (readBit!0 (_1!9889 lt!340223)))))

(assert (=> b!216165 (= lt!341839 (readNBitsLSBFirstsLoop!0 (_2!9897 lt!341837) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!340233 (ite (_1!9897 lt!341837) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!72955 () Bool)

(assert (=> d!72955 e!147027))

(declare-fun res!181850 () Bool)

(assert (=> d!72955 (=> (not res!181850) (not e!147027))))

(assert (=> d!72955 (= res!181850 (= (buf!5190 (_2!9896 lt!341838)) (buf!5190 (_1!9889 lt!340223))))))

(assert (=> d!72955 (= lt!341838 e!147029)))

(declare-fun c!10556 () Bool)

(assert (=> d!72955 (= c!10556 (= nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(assert (=> d!72955 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!590)) (bvsle (bvadd #b00000000000000000000000000000001 i!590) nBits!348) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!72955 (= (readNBitsLSBFirstsLoop!0 (_1!9889 lt!340223) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!340233) lt!341838)))

(declare-fun b!216166 () Bool)

(declare-fun e!147028 () Bool)

(assert (=> b!216166 (= e!147027 e!147028)))

(declare-fun res!181851 () Bool)

(assert (=> b!216166 (=> res!181851 e!147028)))

(assert (=> b!216166 (= res!181851 (not (bvslt (bvadd #b00000000000000000000000000000001 i!590) nBits!348)))))

(declare-fun lt!341840 () (_ BitVec 64))

(declare-fun b!216167 () Bool)

(assert (=> b!216167 (= e!147028 (= (= (bvand (bvlshr (_1!9896 lt!341838) lt!341840) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!9891 (readBitPure!0 (_1!9889 lt!340223)))))))

(assert (=> b!216167 (and (bvsge lt!341840 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!341840 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!216167 (= lt!341840 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(assert (= (and d!72955 c!10556) b!216163))

(assert (= (and d!72955 (not c!10556)) b!216165))

(assert (= (and d!72955 res!181850) b!216161))

(assert (= (and b!216161 res!181852) b!216164))

(assert (= (and b!216164 res!181853) b!216162))

(assert (= (and b!216162 res!181849) b!216166))

(assert (= (and b!216166 (not res!181851)) b!216167))

(declare-fun m!333173 () Bool)

(assert (=> b!216161 m!333173))

(declare-fun m!333175 () Bool)

(assert (=> b!216161 m!333175))

(declare-fun m!333177 () Bool)

(assert (=> b!216167 m!333177))

(declare-fun m!333179 () Bool)

(assert (=> b!216165 m!333179))

(declare-fun m!333181 () Bool)

(assert (=> b!216165 m!333181))

(assert (=> b!216162 m!331717))

(assert (=> b!216164 m!332343))

(assert (=> d!72515 d!72955))

(declare-fun d!72957 () Bool)

(assert (=> d!72957 (= (remainingBits!0 ((_ sign_extend 32) (size!4655 (buf!5190 (_1!9891 lt!340220)))) ((_ sign_extend 32) (currentByte!9768 (_1!9891 lt!340220))) ((_ sign_extend 32) (currentBit!9763 (_1!9891 lt!340220)))) (bvsub (bvmul ((_ sign_extend 32) (size!4655 (buf!5190 (_1!9891 lt!340220)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9768 (_1!9891 lt!340220))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9763 (_1!9891 lt!340220))))))))

(assert (=> d!72479 d!72957))

(declare-fun d!72959 () Bool)

(assert (=> d!72959 (= (invariant!0 (currentBit!9763 (_1!9891 lt!340220)) (currentByte!9768 (_1!9891 lt!340220)) (size!4655 (buf!5190 (_1!9891 lt!340220)))) (and (bvsge (currentBit!9763 (_1!9891 lt!340220)) #b00000000000000000000000000000000) (bvslt (currentBit!9763 (_1!9891 lt!340220)) #b00000000000000000000000000001000) (bvsge (currentByte!9768 (_1!9891 lt!340220)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9768 (_1!9891 lt!340220)) (size!4655 (buf!5190 (_1!9891 lt!340220)))) (and (= (currentBit!9763 (_1!9891 lt!340220)) #b00000000000000000000000000000000) (= (currentByte!9768 (_1!9891 lt!340220)) (size!4655 (buf!5190 (_1!9891 lt!340220))))))))))

(assert (=> d!72479 d!72959))

(assert (=> b!215818 d!72815))

(assert (=> b!215818 d!72529))

(declare-fun d!72961 () Bool)

(declare-fun res!181854 () Bool)

(declare-fun e!147030 () Bool)

(assert (=> d!72961 (=> (not res!181854) (not e!147030))))

(assert (=> d!72961 (= res!181854 (= (size!4655 (buf!5190 (_1!9889 lt!340422))) (size!4655 (buf!5190 (_2!9888 lt!340226)))))))

(assert (=> d!72961 (= (isPrefixOf!0 (_1!9889 lt!340422) (_2!9888 lt!340226)) e!147030)))

(declare-fun b!216168 () Bool)

(declare-fun res!181856 () Bool)

(assert (=> b!216168 (=> (not res!181856) (not e!147030))))

(assert (=> b!216168 (= res!181856 (bvsle (bitIndex!0 (size!4655 (buf!5190 (_1!9889 lt!340422))) (currentByte!9768 (_1!9889 lt!340422)) (currentBit!9763 (_1!9889 lt!340422))) (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!340226))) (currentByte!9768 (_2!9888 lt!340226)) (currentBit!9763 (_2!9888 lt!340226)))))))

(declare-fun b!216169 () Bool)

(declare-fun e!147031 () Bool)

(assert (=> b!216169 (= e!147030 e!147031)))

(declare-fun res!181855 () Bool)

(assert (=> b!216169 (=> res!181855 e!147031)))

(assert (=> b!216169 (= res!181855 (= (size!4655 (buf!5190 (_1!9889 lt!340422))) #b00000000000000000000000000000000))))

(declare-fun b!216170 () Bool)

(assert (=> b!216170 (= e!147031 (arrayBitRangesEq!0 (buf!5190 (_1!9889 lt!340422)) (buf!5190 (_2!9888 lt!340226)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4655 (buf!5190 (_1!9889 lt!340422))) (currentByte!9768 (_1!9889 lt!340422)) (currentBit!9763 (_1!9889 lt!340422)))))))

(assert (= (and d!72961 res!181854) b!216168))

(assert (= (and b!216168 res!181856) b!216169))

(assert (= (and b!216169 (not res!181855)) b!216170))

(assert (=> b!216168 m!332707))

(assert (=> b!216168 m!331713))

(assert (=> b!216170 m!332707))

(assert (=> b!216170 m!332707))

(declare-fun m!333183 () Bool)

(assert (=> b!216170 m!333183))

(assert (=> b!215595 d!72961))

(assert (=> d!72495 d!72741))

(declare-fun d!72963 () Bool)

(declare-fun e!147032 () Bool)

(assert (=> d!72963 e!147032))

(declare-fun res!181857 () Bool)

(assert (=> d!72963 (=> (not res!181857) (not e!147032))))

(declare-fun lt!341841 () BitStream!8418)

(declare-fun lt!341842 () (_ BitVec 64))

(assert (=> d!72963 (= res!181857 (= (bvadd lt!341842 (bvsub lt!340418 lt!340416)) (bitIndex!0 (size!4655 (buf!5190 lt!341841)) (currentByte!9768 lt!341841) (currentBit!9763 lt!341841))))))

(assert (=> d!72963 (or (not (= (bvand lt!341842 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!340418 lt!340416) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!341842 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!341842 (bvsub lt!340418 lt!340416)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72963 (= lt!341842 (bitIndex!0 (size!4655 (buf!5190 (_2!9889 lt!340422))) (currentByte!9768 (_2!9889 lt!340422)) (currentBit!9763 (_2!9889 lt!340422))))))

(assert (=> d!72963 (= lt!341841 (_2!9888 (moveBitIndex!0 (_2!9889 lt!340422) (bvsub lt!340418 lt!340416))))))

(assert (=> d!72963 (moveBitIndexPrecond!0 (_2!9889 lt!340422) (bvsub lt!340418 lt!340416))))

(assert (=> d!72963 (= (withMovedBitIndex!0 (_2!9889 lt!340422) (bvsub lt!340418 lt!340416)) lt!341841)))

(declare-fun b!216171 () Bool)

(assert (=> b!216171 (= e!147032 (= (size!4655 (buf!5190 (_2!9889 lt!340422))) (size!4655 (buf!5190 lt!341841))))))

(assert (= (and d!72963 res!181857) b!216171))

(declare-fun m!333185 () Bool)

(assert (=> d!72963 m!333185))

(assert (=> d!72963 m!332709))

(declare-fun m!333187 () Bool)

(assert (=> d!72963 m!333187))

(declare-fun m!333189 () Bool)

(assert (=> d!72963 m!333189))

(assert (=> b!215593 d!72963))

(assert (=> b!215593 d!72545))

(assert (=> b!215593 d!72529))

(declare-fun b!216172 () Bool)

(declare-fun e!147038 () Bool)

(declare-fun call!3377 () Bool)

(assert (=> b!216172 (= e!147038 call!3377)))

(declare-fun lt!341844 () tuple4!278)

(declare-fun c!10557 () Bool)

(declare-fun lt!341845 () (_ BitVec 32))

(declare-fun bm!3374 () Bool)

(declare-fun lt!341843 () (_ BitVec 32))

(assert (=> bm!3374 (= call!3377 (byteRangesEq!0 (ite c!10557 (select (arr!5585 (buf!5190 (_2!9888 lt!340226))) (_3!655 lt!341844)) (select (arr!5585 (buf!5190 (_2!9888 lt!340226))) (_4!139 lt!341844))) (ite c!10557 (select (arr!5585 (buf!5190 (_2!9888 lt!340213))) (_3!655 lt!341844)) (select (arr!5585 (buf!5190 (_2!9888 lt!340213))) (_4!139 lt!341844))) (ite c!10557 lt!341843 #b00000000000000000000000000000000) lt!341845))))

(declare-fun b!216173 () Bool)

(declare-fun e!147036 () Bool)

(assert (=> b!216173 (= e!147036 call!3377)))

(declare-fun b!216174 () Bool)

(declare-fun e!147034 () Bool)

(assert (=> b!216174 (= e!147038 e!147034)))

(declare-fun res!181858 () Bool)

(assert (=> b!216174 (= res!181858 (byteRangesEq!0 (select (arr!5585 (buf!5190 (_2!9888 lt!340226))) (_3!655 lt!341844)) (select (arr!5585 (buf!5190 (_2!9888 lt!340213))) (_3!655 lt!341844)) lt!341843 #b00000000000000000000000000001000))))

(assert (=> b!216174 (=> (not res!181858) (not e!147034))))

(declare-fun d!72965 () Bool)

(declare-fun res!181862 () Bool)

(declare-fun e!147035 () Bool)

(assert (=> d!72965 (=> res!181862 e!147035)))

(assert (=> d!72965 (= res!181862 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!340226))) (currentByte!9768 (_2!9888 lt!340226)) (currentBit!9763 (_2!9888 lt!340226)))))))

(assert (=> d!72965 (= (arrayBitRangesEq!0 (buf!5190 (_2!9888 lt!340226)) (buf!5190 (_2!9888 lt!340213)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!340226))) (currentByte!9768 (_2!9888 lt!340226)) (currentBit!9763 (_2!9888 lt!340226)))) e!147035)))

(declare-fun b!216175 () Bool)

(declare-fun e!147033 () Bool)

(assert (=> b!216175 (= e!147035 e!147033)))

(declare-fun res!181860 () Bool)

(assert (=> b!216175 (=> (not res!181860) (not e!147033))))

(declare-fun e!147037 () Bool)

(assert (=> b!216175 (= res!181860 e!147037)))

(declare-fun res!181861 () Bool)

(assert (=> b!216175 (=> res!181861 e!147037)))

(assert (=> b!216175 (= res!181861 (bvsge (_1!9902 lt!341844) (_2!9902 lt!341844)))))

(assert (=> b!216175 (= lt!341845 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!340226))) (currentByte!9768 (_2!9888 lt!340226)) (currentBit!9763 (_2!9888 lt!340226))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!216175 (= lt!341843 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!216175 (= lt!341844 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!340226))) (currentByte!9768 (_2!9888 lt!340226)) (currentBit!9763 (_2!9888 lt!340226)))))))

(declare-fun b!216176 () Bool)

(declare-fun res!181859 () Bool)

(assert (=> b!216176 (= res!181859 (= lt!341845 #b00000000000000000000000000000000))))

(assert (=> b!216176 (=> res!181859 e!147036)))

(assert (=> b!216176 (= e!147034 e!147036)))

(declare-fun b!216177 () Bool)

(assert (=> b!216177 (= e!147037 (arrayRangesEq!701 (buf!5190 (_2!9888 lt!340226)) (buf!5190 (_2!9888 lt!340213)) (_1!9902 lt!341844) (_2!9902 lt!341844)))))

(declare-fun b!216178 () Bool)

(assert (=> b!216178 (= e!147033 e!147038)))

(assert (=> b!216178 (= c!10557 (= (_3!655 lt!341844) (_4!139 lt!341844)))))

(assert (= (and d!72965 (not res!181862)) b!216175))

(assert (= (and b!216175 (not res!181861)) b!216177))

(assert (= (and b!216175 res!181860) b!216178))

(assert (= (and b!216178 c!10557) b!216172))

(assert (= (and b!216178 (not c!10557)) b!216174))

(assert (= (and b!216174 res!181858) b!216176))

(assert (= (and b!216176 (not res!181859)) b!216173))

(assert (= (or b!216172 b!216173) bm!3374))

(declare-fun m!333191 () Bool)

(assert (=> bm!3374 m!333191))

(declare-fun m!333193 () Bool)

(assert (=> bm!3374 m!333193))

(declare-fun m!333195 () Bool)

(assert (=> bm!3374 m!333195))

(declare-fun m!333197 () Bool)

(assert (=> bm!3374 m!333197))

(declare-fun m!333199 () Bool)

(assert (=> bm!3374 m!333199))

(assert (=> b!216174 m!333193))

(assert (=> b!216174 m!333195))

(assert (=> b!216174 m!333193))

(assert (=> b!216174 m!333195))

(declare-fun m!333201 () Bool)

(assert (=> b!216174 m!333201))

(assert (=> b!216175 m!331713))

(declare-fun m!333203 () Bool)

(assert (=> b!216175 m!333203))

(declare-fun m!333205 () Bool)

(assert (=> b!216177 m!333205))

(assert (=> b!215571 d!72965))

(assert (=> b!215571 d!72529))

(declare-fun d!72967 () Bool)

(declare-fun e!147039 () Bool)

(assert (=> d!72967 e!147039))

(declare-fun res!181864 () Bool)

(assert (=> d!72967 (=> (not res!181864) (not e!147039))))

(declare-fun lt!341847 () (_ BitVec 64))

(declare-fun lt!341848 () (_ BitVec 64))

(declare-fun lt!341849 () (_ BitVec 64))

(assert (=> d!72967 (= res!181864 (= lt!341847 (bvsub lt!341848 lt!341849)))))

(assert (=> d!72967 (or (= (bvand lt!341848 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!341849 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!341848 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!341848 lt!341849) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72967 (= lt!341849 (remainingBits!0 ((_ sign_extend 32) (size!4655 (buf!5190 (_1!9891 lt!341109)))) ((_ sign_extend 32) (currentByte!9768 (_1!9891 lt!341109))) ((_ sign_extend 32) (currentBit!9763 (_1!9891 lt!341109)))))))

(declare-fun lt!341850 () (_ BitVec 64))

(declare-fun lt!341851 () (_ BitVec 64))

(assert (=> d!72967 (= lt!341848 (bvmul lt!341850 lt!341851))))

(assert (=> d!72967 (or (= lt!341850 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!341851 (bvsdiv (bvmul lt!341850 lt!341851) lt!341850)))))

(assert (=> d!72967 (= lt!341851 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!72967 (= lt!341850 ((_ sign_extend 32) (size!4655 (buf!5190 (_1!9891 lt!341109)))))))

(assert (=> d!72967 (= lt!341847 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9768 (_1!9891 lt!341109))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9763 (_1!9891 lt!341109)))))))

(assert (=> d!72967 (invariant!0 (currentBit!9763 (_1!9891 lt!341109)) (currentByte!9768 (_1!9891 lt!341109)) (size!4655 (buf!5190 (_1!9891 lt!341109))))))

(assert (=> d!72967 (= (bitIndex!0 (size!4655 (buf!5190 (_1!9891 lt!341109))) (currentByte!9768 (_1!9891 lt!341109)) (currentBit!9763 (_1!9891 lt!341109))) lt!341847)))

(declare-fun b!216179 () Bool)

(declare-fun res!181863 () Bool)

(assert (=> b!216179 (=> (not res!181863) (not e!147039))))

(assert (=> b!216179 (= res!181863 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!341847))))

(declare-fun b!216180 () Bool)

(declare-fun lt!341846 () (_ BitVec 64))

(assert (=> b!216180 (= e!147039 (bvsle lt!341847 (bvmul lt!341846 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!216180 (or (= lt!341846 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!341846 #b0000000000000000000000000000000000000000000000000000000000001000) lt!341846)))))

(assert (=> b!216180 (= lt!341846 ((_ sign_extend 32) (size!4655 (buf!5190 (_1!9891 lt!341109)))))))

(assert (= (and d!72967 res!181864) b!216179))

(assert (= (and b!216179 res!181863) b!216180))

(declare-fun m!333207 () Bool)

(assert (=> d!72967 m!333207))

(declare-fun m!333209 () Bool)

(assert (=> d!72967 m!333209))

(assert (=> b!215839 d!72967))

(assert (=> b!215839 d!72843))

(declare-fun b!216181 () Bool)

(declare-fun res!181868 () Bool)

(declare-fun e!147040 () Bool)

(assert (=> b!216181 (=> (not res!181868) (not e!147040))))

(declare-fun lt!341852 () (_ BitVec 64))

(declare-fun lt!341853 () (_ BitVec 64))

(declare-fun lt!341855 () tuple2!18482)

(assert (=> b!216181 (= res!181868 (= (bitIndex!0 (size!4655 (buf!5190 (_2!9896 lt!341855))) (currentByte!9768 (_2!9896 lt!341855)) (currentBit!9763 (_2!9896 lt!341855))) (bvadd lt!341853 lt!341852)))))

(assert (=> b!216181 (or (not (= (bvand lt!341853 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!341852 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!341853 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!341853 lt!341852) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!216181 (= lt!341852 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(assert (=> b!216181 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand i!590 #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 i!590) #b10000000000000000000000000000000)))))

(assert (=> b!216181 (= lt!341853 (bitIndex!0 (size!4655 (buf!5190 (_1!9889 lt!340215))) (currentByte!9768 (_1!9889 lt!340215)) (currentBit!9763 (_1!9889 lt!340215))))))

(declare-fun b!216182 () Bool)

(declare-fun res!181865 () Bool)

(assert (=> b!216182 (=> (not res!181865) (not e!147040))))

(assert (=> b!216182 (= res!181865 (= (bvand (_1!9896 lt!341855) (onesLSBLong!0 nBits!348)) (_1!9896 lt!341855)))))

(declare-fun b!216183 () Bool)

(declare-fun e!147042 () tuple2!18482)

(assert (=> b!216183 (= e!147042 (tuple2!18483 lt!340240 (_1!9889 lt!340215)))))

(declare-fun b!216184 () Bool)

(declare-fun res!181869 () Bool)

(assert (=> b!216184 (=> (not res!181869) (not e!147040))))

(assert (=> b!216184 (= res!181869 (= (bvand (_1!9896 lt!341855) (onesLSBLong!0 i!590)) (bvand lt!340240 (onesLSBLong!0 i!590))))))

(declare-fun b!216185 () Bool)

(declare-fun lt!341856 () tuple2!18482)

(assert (=> b!216185 (= e!147042 (tuple2!18483 (_1!9896 lt!341856) (_2!9896 lt!341856)))))

(declare-fun lt!341854 () tuple2!18484)

(assert (=> b!216185 (= lt!341854 (readBit!0 (_1!9889 lt!340215)))))

(assert (=> b!216185 (= lt!341856 (readNBitsLSBFirstsLoop!0 (_2!9897 lt!341854) nBits!348 (bvadd i!590 #b00000000000000000000000000000001) (bvor lt!340240 (ite (_1!9897 lt!341854) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!72969 () Bool)

(assert (=> d!72969 e!147040))

(declare-fun res!181866 () Bool)

(assert (=> d!72969 (=> (not res!181866) (not e!147040))))

(assert (=> d!72969 (= res!181866 (= (buf!5190 (_2!9896 lt!341855)) (buf!5190 (_1!9889 lt!340215))))))

(assert (=> d!72969 (= lt!341855 e!147042)))

(declare-fun c!10558 () Bool)

(assert (=> d!72969 (= c!10558 (= nBits!348 i!590))))

(assert (=> d!72969 (and (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!72969 (= (readNBitsLSBFirstsLoop!0 (_1!9889 lt!340215) nBits!348 i!590 lt!340240) lt!341855)))

(declare-fun b!216186 () Bool)

(declare-fun e!147041 () Bool)

(assert (=> b!216186 (= e!147040 e!147041)))

(declare-fun res!181867 () Bool)

(assert (=> b!216186 (=> res!181867 e!147041)))

(assert (=> b!216186 (= res!181867 (not (bvslt i!590 nBits!348)))))

(declare-fun lt!341857 () (_ BitVec 64))

(declare-fun b!216187 () Bool)

(assert (=> b!216187 (= e!147041 (= (= (bvand (bvlshr (_1!9896 lt!341855) lt!341857) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!9891 (readBitPure!0 (_1!9889 lt!340215)))))))

(assert (=> b!216187 (and (bvsge lt!341857 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!341857 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!216187 (= lt!341857 ((_ sign_extend 32) i!590))))

(assert (= (and d!72969 c!10558) b!216183))

(assert (= (and d!72969 (not c!10558)) b!216185))

(assert (= (and d!72969 res!181866) b!216181))

(assert (= (and b!216181 res!181868) b!216184))

(assert (= (and b!216184 res!181869) b!216182))

(assert (= (and b!216182 res!181865) b!216186))

(assert (= (and b!216186 (not res!181867)) b!216187))

(declare-fun m!333211 () Bool)

(assert (=> b!216181 m!333211))

(assert (=> b!216181 m!331891))

(assert (=> b!216187 m!331745))

(assert (=> b!216185 m!331989))

(declare-fun m!333213 () Bool)

(assert (=> b!216185 m!333213))

(assert (=> b!216182 m!331717))

(assert (=> b!216184 m!331749))

(assert (=> d!72513 d!72969))

(declare-fun d!72971 () Bool)

(declare-fun res!181870 () Bool)

(declare-fun e!147043 () Bool)

(assert (=> d!72971 (=> (not res!181870) (not e!147043))))

(assert (=> d!72971 (= res!181870 (= (size!4655 (buf!5190 thiss!1204)) (size!4655 (buf!5190 (_2!9888 lt!341112)))))))

(assert (=> d!72971 (= (isPrefixOf!0 thiss!1204 (_2!9888 lt!341112)) e!147043)))

(declare-fun b!216188 () Bool)

(declare-fun res!181872 () Bool)

(assert (=> b!216188 (=> (not res!181872) (not e!147043))))

(assert (=> b!216188 (= res!181872 (bvsle (bitIndex!0 (size!4655 (buf!5190 thiss!1204)) (currentByte!9768 thiss!1204) (currentBit!9763 thiss!1204)) (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!341112))) (currentByte!9768 (_2!9888 lt!341112)) (currentBit!9763 (_2!9888 lt!341112)))))))

(declare-fun b!216189 () Bool)

(declare-fun e!147044 () Bool)

(assert (=> b!216189 (= e!147043 e!147044)))

(declare-fun res!181871 () Bool)

(assert (=> b!216189 (=> res!181871 e!147044)))

(assert (=> b!216189 (= res!181871 (= (size!4655 (buf!5190 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!216190 () Bool)

(assert (=> b!216190 (= e!147044 (arrayBitRangesEq!0 (buf!5190 thiss!1204) (buf!5190 (_2!9888 lt!341112)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4655 (buf!5190 thiss!1204)) (currentByte!9768 thiss!1204) (currentBit!9763 thiss!1204))))))

(assert (= (and d!72971 res!181870) b!216188))

(assert (= (and b!216188 res!181872) b!216189))

(assert (= (and b!216189 (not res!181871)) b!216190))

(assert (=> b!216188 m!331715))

(assert (=> b!216188 m!332437))

(assert (=> b!216190 m!331715))

(assert (=> b!216190 m!331715))

(declare-fun m!333215 () Bool)

(assert (=> b!216190 m!333215))

(assert (=> b!215837 d!72971))

(declare-fun d!72973 () Bool)

(assert (=> d!72973 (= (remainingBits!0 ((_ sign_extend 32) (size!4655 (buf!5190 (_2!9888 lt!340226)))) ((_ sign_extend 32) (currentByte!9768 (_2!9888 lt!340226))) ((_ sign_extend 32) (currentBit!9763 (_2!9888 lt!340226)))) (bvsub (bvmul ((_ sign_extend 32) (size!4655 (buf!5190 (_2!9888 lt!340226)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9768 (_2!9888 lt!340226))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9763 (_2!9888 lt!340226))))))))

(assert (=> d!72529 d!72973))

(assert (=> d!72529 d!72747))

(declare-fun d!72975 () Bool)

(declare-fun e!147045 () Bool)

(assert (=> d!72975 e!147045))

(declare-fun res!181874 () Bool)

(assert (=> d!72975 (=> (not res!181874) (not e!147045))))

(declare-fun lt!341861 () (_ BitVec 64))

(declare-fun lt!341860 () (_ BitVec 64))

(declare-fun lt!341859 () (_ BitVec 64))

(assert (=> d!72975 (= res!181874 (= lt!341859 (bvsub lt!341860 lt!341861)))))

(assert (=> d!72975 (or (= (bvand lt!341860 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!341861 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!341860 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!341860 lt!341861) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72975 (= lt!341861 (remainingBits!0 ((_ sign_extend 32) (size!4655 (buf!5190 lt!340372))) ((_ sign_extend 32) (currentByte!9768 lt!340372)) ((_ sign_extend 32) (currentBit!9763 lt!340372))))))

(declare-fun lt!341862 () (_ BitVec 64))

(declare-fun lt!341863 () (_ BitVec 64))

(assert (=> d!72975 (= lt!341860 (bvmul lt!341862 lt!341863))))

(assert (=> d!72975 (or (= lt!341862 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!341863 (bvsdiv (bvmul lt!341862 lt!341863) lt!341862)))))

(assert (=> d!72975 (= lt!341863 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!72975 (= lt!341862 ((_ sign_extend 32) (size!4655 (buf!5190 lt!340372))))))

(assert (=> d!72975 (= lt!341859 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9768 lt!340372)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9763 lt!340372))))))

(assert (=> d!72975 (invariant!0 (currentBit!9763 lt!340372) (currentByte!9768 lt!340372) (size!4655 (buf!5190 lt!340372)))))

(assert (=> d!72975 (= (bitIndex!0 (size!4655 (buf!5190 lt!340372)) (currentByte!9768 lt!340372) (currentBit!9763 lt!340372)) lt!341859)))

(declare-fun b!216191 () Bool)

(declare-fun res!181873 () Bool)

(assert (=> b!216191 (=> (not res!181873) (not e!147045))))

(assert (=> b!216191 (= res!181873 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!341859))))

(declare-fun b!216192 () Bool)

(declare-fun lt!341858 () (_ BitVec 64))

(assert (=> b!216192 (= e!147045 (bvsle lt!341859 (bvmul lt!341858 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!216192 (or (= lt!341858 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!341858 #b0000000000000000000000000000000000000000000000000000000000001000) lt!341858)))))

(assert (=> b!216192 (= lt!341858 ((_ sign_extend 32) (size!4655 (buf!5190 lt!340372))))))

(assert (= (and d!72975 res!181874) b!216191))

(assert (= (and b!216191 res!181873) b!216192))

(declare-fun m!333217 () Bool)

(assert (=> d!72975 m!333217))

(declare-fun m!333219 () Bool)

(assert (=> d!72975 m!333219))

(assert (=> d!72489 d!72975))

(declare-fun d!72977 () Bool)

(declare-fun e!147046 () Bool)

(assert (=> d!72977 e!147046))

(declare-fun res!181876 () Bool)

(assert (=> d!72977 (=> (not res!181876) (not e!147046))))

(declare-fun lt!341866 () (_ BitVec 64))

(declare-fun lt!341865 () (_ BitVec 64))

(declare-fun lt!341867 () (_ BitVec 64))

(assert (=> d!72977 (= res!181876 (= lt!341865 (bvsub lt!341866 lt!341867)))))

(assert (=> d!72977 (or (= (bvand lt!341866 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!341867 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!341866 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!341866 lt!341867) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72977 (= lt!341867 (remainingBits!0 ((_ sign_extend 32) (size!4655 (buf!5190 (_1!9889 lt!340215)))) ((_ sign_extend 32) (currentByte!9768 (_1!9889 lt!340215))) ((_ sign_extend 32) (currentBit!9763 (_1!9889 lt!340215)))))))

(declare-fun lt!341868 () (_ BitVec 64))

(declare-fun lt!341869 () (_ BitVec 64))

(assert (=> d!72977 (= lt!341866 (bvmul lt!341868 lt!341869))))

(assert (=> d!72977 (or (= lt!341868 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!341869 (bvsdiv (bvmul lt!341868 lt!341869) lt!341868)))))

(assert (=> d!72977 (= lt!341869 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!72977 (= lt!341868 ((_ sign_extend 32) (size!4655 (buf!5190 (_1!9889 lt!340215)))))))

(assert (=> d!72977 (= lt!341865 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9768 (_1!9889 lt!340215))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9763 (_1!9889 lt!340215)))))))

(assert (=> d!72977 (invariant!0 (currentBit!9763 (_1!9889 lt!340215)) (currentByte!9768 (_1!9889 lt!340215)) (size!4655 (buf!5190 (_1!9889 lt!340215))))))

(assert (=> d!72977 (= (bitIndex!0 (size!4655 (buf!5190 (_1!9889 lt!340215))) (currentByte!9768 (_1!9889 lt!340215)) (currentBit!9763 (_1!9889 lt!340215))) lt!341865)))

(declare-fun b!216193 () Bool)

(declare-fun res!181875 () Bool)

(assert (=> b!216193 (=> (not res!181875) (not e!147046))))

(assert (=> b!216193 (= res!181875 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!341865))))

(declare-fun b!216194 () Bool)

(declare-fun lt!341864 () (_ BitVec 64))

(assert (=> b!216194 (= e!147046 (bvsle lt!341865 (bvmul lt!341864 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!216194 (or (= lt!341864 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!341864 #b0000000000000000000000000000000000000000000000000000000000001000) lt!341864)))))

(assert (=> b!216194 (= lt!341864 ((_ sign_extend 32) (size!4655 (buf!5190 (_1!9889 lt!340215)))))))

(assert (= (and d!72977 res!181876) b!216193))

(assert (= (and b!216193 res!181875) b!216194))

(declare-fun m!333221 () Bool)

(assert (=> d!72977 m!333221))

(declare-fun m!333223 () Bool)

(assert (=> d!72977 m!333223))

(assert (=> d!72489 d!72977))

(declare-fun d!72979 () Bool)

(declare-fun lt!341874 () (_ BitVec 32))

(assert (=> d!72979 (= lt!341874 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!341872 () (_ BitVec 32))

(assert (=> d!72979 (= lt!341872 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!147047 () Bool)

(assert (=> d!72979 e!147047))

(declare-fun res!181878 () Bool)

(assert (=> d!72979 (=> (not res!181878) (not e!147047))))

(assert (=> d!72979 (= res!181878 (moveBitIndexPrecond!0 (_1!9889 lt!340215) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun Unit!15363 () Unit!15294)

(declare-fun Unit!15364 () Unit!15294)

(declare-fun Unit!15365 () Unit!15294)

(assert (=> d!72979 (= (moveBitIndex!0 (_1!9889 lt!340215) #b0000000000000000000000000000000000000000000000000000000000000001) (ite (bvslt (bvadd (currentBit!9763 (_1!9889 lt!340215)) lt!341874) #b00000000000000000000000000000000) (tuple2!18467 Unit!15363 (BitStream!8419 (buf!5190 (_1!9889 lt!340215)) (bvsub (bvadd (currentByte!9768 (_1!9889 lt!340215)) lt!341872) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!341874 (currentBit!9763 (_1!9889 lt!340215))))) (ite (bvsge (bvadd (currentBit!9763 (_1!9889 lt!340215)) lt!341874) #b00000000000000000000000000001000) (tuple2!18467 Unit!15364 (BitStream!8419 (buf!5190 (_1!9889 lt!340215)) (bvadd (currentByte!9768 (_1!9889 lt!340215)) lt!341872 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!9763 (_1!9889 lt!340215)) lt!341874) #b00000000000000000000000000001000))) (tuple2!18467 Unit!15365 (BitStream!8419 (buf!5190 (_1!9889 lt!340215)) (bvadd (currentByte!9768 (_1!9889 lt!340215)) lt!341872) (bvadd (currentBit!9763 (_1!9889 lt!340215)) lt!341874))))))))

(declare-fun b!216195 () Bool)

(declare-fun e!147048 () Bool)

(assert (=> b!216195 (= e!147047 e!147048)))

(declare-fun res!181877 () Bool)

(assert (=> b!216195 (=> (not res!181877) (not e!147048))))

(declare-fun lt!341871 () (_ BitVec 64))

(declare-fun lt!341875 () tuple2!18466)

(assert (=> b!216195 (= res!181877 (= (bvadd lt!341871 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4655 (buf!5190 (_2!9888 lt!341875))) (currentByte!9768 (_2!9888 lt!341875)) (currentBit!9763 (_2!9888 lt!341875)))))))

(assert (=> b!216195 (or (not (= (bvand lt!341871 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!341871 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!341871 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!216195 (= lt!341871 (bitIndex!0 (size!4655 (buf!5190 (_1!9889 lt!340215))) (currentByte!9768 (_1!9889 lt!340215)) (currentBit!9763 (_1!9889 lt!340215))))))

(declare-fun lt!341870 () (_ BitVec 32))

(declare-fun lt!341873 () (_ BitVec 32))

(declare-fun Unit!15366 () Unit!15294)

(declare-fun Unit!15367 () Unit!15294)

(declare-fun Unit!15368 () Unit!15294)

(assert (=> b!216195 (= lt!341875 (ite (bvslt (bvadd (currentBit!9763 (_1!9889 lt!340215)) lt!341870) #b00000000000000000000000000000000) (tuple2!18467 Unit!15366 (BitStream!8419 (buf!5190 (_1!9889 lt!340215)) (bvsub (bvadd (currentByte!9768 (_1!9889 lt!340215)) lt!341873) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!341870 (currentBit!9763 (_1!9889 lt!340215))))) (ite (bvsge (bvadd (currentBit!9763 (_1!9889 lt!340215)) lt!341870) #b00000000000000000000000000001000) (tuple2!18467 Unit!15367 (BitStream!8419 (buf!5190 (_1!9889 lt!340215)) (bvadd (currentByte!9768 (_1!9889 lt!340215)) lt!341873 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!9763 (_1!9889 lt!340215)) lt!341870) #b00000000000000000000000000001000))) (tuple2!18467 Unit!15368 (BitStream!8419 (buf!5190 (_1!9889 lt!340215)) (bvadd (currentByte!9768 (_1!9889 lt!340215)) lt!341873) (bvadd (currentBit!9763 (_1!9889 lt!340215)) lt!341870))))))))

(assert (=> b!216195 (= lt!341870 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!216195 (= lt!341873 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!216196 () Bool)

(assert (=> b!216196 (= e!147048 (and (= (size!4655 (buf!5190 (_1!9889 lt!340215))) (size!4655 (buf!5190 (_2!9888 lt!341875)))) (= (buf!5190 (_1!9889 lt!340215)) (buf!5190 (_2!9888 lt!341875)))))))

(assert (= (and d!72979 res!181878) b!216195))

(assert (= (and b!216195 res!181877) b!216196))

(assert (=> d!72979 m!331895))

(declare-fun m!333225 () Bool)

(assert (=> b!216195 m!333225))

(assert (=> b!216195 m!331891))

(assert (=> d!72489 d!72979))

(declare-fun d!72981 () Bool)

(declare-fun res!181879 () Bool)

(declare-fun e!147049 () Bool)

(assert (=> d!72981 (=> (not res!181879) (not e!147049))))

(assert (=> d!72981 (= res!181879 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!4655 (buf!5190 (_1!9889 lt!340215))))) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!4655 (buf!5190 (_1!9889 lt!340215))))))))))

(assert (=> d!72981 (= (moveBitIndexPrecond!0 (_1!9889 lt!340215) #b0000000000000000000000000000000000000000000000000000000000000001) e!147049)))

(declare-fun b!216197 () Bool)

(declare-fun lt!341876 () (_ BitVec 64))

(assert (=> b!216197 (= e!147049 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!341876) (bvsle lt!341876 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!4655 (buf!5190 (_1!9889 lt!340215))))))))))

(assert (=> b!216197 (= lt!341876 (bvadd (bitIndex!0 (size!4655 (buf!5190 (_1!9889 lt!340215))) (currentByte!9768 (_1!9889 lt!340215)) (currentBit!9763 (_1!9889 lt!340215))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (= (and d!72981 res!181879) b!216197))

(assert (=> b!216197 m!331891))

(assert (=> d!72489 d!72981))

(check-sat (not d!72945) (not d!72887) (not b!216018) (not d!72899) (not b!216125) (not b!216106) (not b!216142) (not b!216081) (not b!216103) (not d!72813) (not d!72939) (not b!216184) (not d!72807) (not d!72793) (not b!216051) (not d!72727) (not b!215987) (not b!216050) (not b!216007) (not b!216168) (not b!216131) (not b!216130) (not b!215992) (not b!216167) (not b!215974) (not b!216175) (not b!215990) (not b!216016) (not d!72769) (not b!216195) (not b!216132) (not b!216188) (not d!72763) (not b!216185) (not b!215980) (not d!72975) (not d!72911) (not d!72921) (not d!72823) (not b!216187) (not b!216112) (not d!72819) (not b!216123) (not d!72889) (not d!72833) (not b!215952) (not bm!3370) (not d!72905) (not d!72917) (not d!72847) (not b!216030) (not b!216054) (not d!72909) (not d!72801) (not b!216073) (not b!216115) (not d!72851) (not b!216033) (not bm!3373) (not b!216133) (not d!72773) (not b!215995) (not b!216162) (not b!216097) (not b!215973) (not b!215976) (not d!72853) (not b!216025) (not d!72791) (not d!72827) (not d!72809) (not d!72895) (not b!216164) (not b!215993) (not b!215986) (not d!72963) (not d!72839) (not b!215983) (not b!216100) (not b!215955) (not d!72821) (not b!216065) (not b!215996) (not d!72857) (not d!72947) (not d!72967) (not b!216071) (not b!216116) (not b!215984) (not d!72907) (not b!216181) (not b!216095) (not d!72761) (not b!215981) (not b!216177) (not d!72757) (not d!72765) (not d!72815) (not b!216190) (not b!216101) (not d!72843) (not d!72937) (not b!216174) (not b!216170) (not b!215956) (not b!216110) (not b!216015) (not b!216000) (not b!216031) (not d!72799) (not b!216108) (not b!216069) (not d!72949) (not d!72859) (not b!216027) (not d!72933) (not d!72729) (not b!216165) (not b!216157) (not d!72735) (not b!216113) (not d!72739) (not b!215999) (not b!216139) (not d!72913) (not b!216160) (not d!72755) (not d!72903) (not b!216158) (not d!72789) (not b!216079) (not b!216117) (not b!216035) (not b!215989) (not d!72919) (not d!72817) (not b!215953) (not b!216136) (not d!72929) (not b!216109) (not d!72893) (not bm!3369) (not b!216062) (not d!72935) (not d!72901) (not b!216074) (not d!72743) (not bm!3374) (not b!216129) (not d!72977) (not b!216012) (not d!72923) (not b!216197) (not d!72841) (not d!72927) (not d!72771) (not b!215998) (not bm!3372) (not b!216068) (not d!72831) (not b!216161) (not b!216121) (not d!72855) (not b!216028) (not d!72925) (not b!216053) (not d!72781) (not b!216076) (not b!216024) (not b!216143) (not d!72871) (not d!72779) (not d!72979) (not b!216155) (not d!72897) (not b!216056) (not b!216022) (not b!216140) (not d!72891) (not b!215954) (not b!216128) (not d!72885) (not bm!3371) (not b!216182) (not d!72835) (not b!216064) (not d!72931) (not b!216118) (not b!216061) (not b!216034))
(check-sat)
