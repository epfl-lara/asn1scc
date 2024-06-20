; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40180 () Bool)

(assert start!40180)

(declare-fun b!183329 () Bool)

(declare-fun res!152409 () Bool)

(declare-fun e!127127 () Bool)

(assert (=> b!183329 (=> (not res!152409) (not e!127127))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!183329 (= res!152409 (not (= i!590 nBits!348)))))

(declare-fun b!183330 () Bool)

(declare-fun e!127137 () Bool)

(declare-fun e!127138 () Bool)

(assert (=> b!183330 (= e!127137 e!127138)))

(declare-fun res!152391 () Bool)

(assert (=> b!183330 (=> res!152391 e!127138)))

(declare-fun lt!282242 () (_ BitVec 64))

(declare-fun lt!282254 () (_ BitVec 64))

(assert (=> b!183330 (= res!152391 (not (= lt!282254 (bvsub (bvsub (bvadd lt!282242 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-datatypes ((array!9748 0))(
  ( (array!9749 (arr!5228 (Array (_ BitVec 32) (_ BitVec 8))) (size!4298 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7704 0))(
  ( (BitStream!7705 (buf!4753 array!9748) (currentByte!8987 (_ BitVec 32)) (currentBit!8982 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!13171 0))(
  ( (Unit!13172) )
))
(declare-datatypes ((tuple2!15820 0))(
  ( (tuple2!15821 (_1!8555 Unit!13171) (_2!8555 BitStream!7704)) )
))
(declare-fun lt!282237 () tuple2!15820)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!183330 (= lt!282254 (bitIndex!0 (size!4298 (buf!4753 (_2!8555 lt!282237))) (currentByte!8987 (_2!8555 lt!282237)) (currentBit!8982 (_2!8555 lt!282237))))))

(declare-fun thiss!1204 () BitStream!7704)

(declare-fun isPrefixOf!0 (BitStream!7704 BitStream!7704) Bool)

(assert (=> b!183330 (isPrefixOf!0 thiss!1204 (_2!8555 lt!282237))))

(declare-fun lt!282235 () Unit!13171)

(declare-fun lt!282251 () tuple2!15820)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7704 BitStream!7704 BitStream!7704) Unit!13171)

(assert (=> b!183330 (= lt!282235 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8555 lt!282251) (_2!8555 lt!282237)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7704 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15820)

(assert (=> b!183330 (= lt!282237 (appendBitsLSBFirstLoopTR!0 (_2!8555 lt!282251) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!183331 () Bool)

(declare-fun e!127134 () Bool)

(declare-fun e!127131 () Bool)

(assert (=> b!183331 (= e!127134 e!127131)))

(declare-fun res!152399 () Bool)

(assert (=> b!183331 (=> (not res!152399) (not e!127131))))

(declare-fun lt!282244 () (_ BitVec 64))

(declare-fun lt!282257 () (_ BitVec 64))

(assert (=> b!183331 (= res!152399 (= lt!282244 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!282257)))))

(assert (=> b!183331 (= lt!282244 (bitIndex!0 (size!4298 (buf!4753 (_2!8555 lt!282251))) (currentByte!8987 (_2!8555 lt!282251)) (currentBit!8982 (_2!8555 lt!282251))))))

(assert (=> b!183331 (= lt!282257 (bitIndex!0 (size!4298 (buf!4753 thiss!1204)) (currentByte!8987 thiss!1204) (currentBit!8982 thiss!1204)))))

(declare-fun b!183332 () Bool)

(declare-fun e!127135 () Bool)

(declare-fun array_inv!4039 (array!9748) Bool)

(assert (=> b!183332 (= e!127135 (array_inv!4039 (buf!4753 thiss!1204)))))

(declare-fun b!183333 () Bool)

(declare-fun res!152404 () Bool)

(assert (=> b!183333 (=> res!152404 e!127138)))

(assert (=> b!183333 (= res!152404 (not (isPrefixOf!0 (_2!8555 lt!282251) (_2!8555 lt!282237))))))

(declare-fun b!183334 () Bool)

(declare-fun e!127133 () Bool)

(declare-datatypes ((tuple2!15822 0))(
  ( (tuple2!15823 (_1!8556 BitStream!7704) (_2!8556 Bool)) )
))
(declare-fun lt!282256 () tuple2!15822)

(declare-fun lt!282245 () tuple2!15822)

(assert (=> b!183334 (= e!127133 (= (_2!8556 lt!282256) (_2!8556 lt!282245)))))

(declare-fun b!183335 () Bool)

(declare-fun e!127132 () Bool)

(declare-fun lt!282236 () tuple2!15822)

(assert (=> b!183335 (= e!127132 (= (bitIndex!0 (size!4298 (buf!4753 (_1!8556 lt!282236))) (currentByte!8987 (_1!8556 lt!282236)) (currentBit!8982 (_1!8556 lt!282236))) lt!282244))))

(declare-fun b!183336 () Bool)

(declare-fun e!127136 () Bool)

(assert (=> b!183336 (= e!127138 e!127136)))

(declare-fun res!152395 () Bool)

(assert (=> b!183336 (=> res!152395 e!127136)))

(assert (=> b!183336 (= res!152395 (or (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!590)) (bvsgt (bvadd #b00000000000000000000000000000001 i!590) nBits!348)))))

(declare-fun lt!282246 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!183336 (validate_offset_bits!1 ((_ sign_extend 32) (size!4298 (buf!4753 (_2!8555 lt!282237)))) ((_ sign_extend 32) (currentByte!8987 (_2!8555 lt!282251))) ((_ sign_extend 32) (currentBit!8982 (_2!8555 lt!282251))) lt!282246)))

(declare-fun lt!282234 () Unit!13171)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7704 array!9748 (_ BitVec 64)) Unit!13171)

(assert (=> b!183336 (= lt!282234 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8555 lt!282251) (buf!4753 (_2!8555 lt!282237)) lt!282246))))

(assert (=> b!183336 (= lt!282246 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!282253 () (_ BitVec 64))

(declare-fun lt!282250 () tuple2!15822)

(declare-fun lt!282241 () (_ BitVec 64))

(declare-fun lt!282255 () (_ BitVec 64))

(assert (=> b!183336 (= lt!282253 (bvor lt!282241 (ite (_2!8556 lt!282250) lt!282255 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((tuple2!15824 0))(
  ( (tuple2!15825 (_1!8557 BitStream!7704) (_2!8557 (_ BitVec 64))) )
))
(declare-fun lt!282248 () tuple2!15824)

(declare-datatypes ((tuple2!15826 0))(
  ( (tuple2!15827 (_1!8558 BitStream!7704) (_2!8558 BitStream!7704)) )
))
(declare-fun lt!282239 () tuple2!15826)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7704 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!15824)

(assert (=> b!183336 (= lt!282248 (readNBitsLSBFirstsLoopPure!0 (_1!8558 lt!282239) nBits!348 i!590 lt!282241))))

(declare-fun lt!282249 () (_ BitVec 64))

(assert (=> b!183336 (validate_offset_bits!1 ((_ sign_extend 32) (size!4298 (buf!4753 (_2!8555 lt!282237)))) ((_ sign_extend 32) (currentByte!8987 thiss!1204)) ((_ sign_extend 32) (currentBit!8982 thiss!1204)) lt!282249)))

(declare-fun lt!282243 () Unit!13171)

(assert (=> b!183336 (= lt!282243 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4753 (_2!8555 lt!282237)) lt!282249))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!183336 (= lt!282241 (bvand v!189 (onesLSBLong!0 i!590)))))

(declare-fun lt!282252 () Bool)

(assert (=> b!183336 (= (_2!8556 lt!282250) lt!282252)))

(declare-fun readBitPure!0 (BitStream!7704) tuple2!15822)

(assert (=> b!183336 (= lt!282250 (readBitPure!0 (_1!8558 lt!282239)))))

(declare-fun lt!282238 () tuple2!15826)

(declare-fun reader!0 (BitStream!7704 BitStream!7704) tuple2!15826)

(assert (=> b!183336 (= lt!282238 (reader!0 (_2!8555 lt!282251) (_2!8555 lt!282237)))))

(assert (=> b!183336 (= lt!282239 (reader!0 thiss!1204 (_2!8555 lt!282237)))))

(assert (=> b!183336 e!127133))

(declare-fun res!152392 () Bool)

(assert (=> b!183336 (=> (not res!152392) (not e!127133))))

(assert (=> b!183336 (= res!152392 (= (bitIndex!0 (size!4298 (buf!4753 (_1!8556 lt!282256))) (currentByte!8987 (_1!8556 lt!282256)) (currentBit!8982 (_1!8556 lt!282256))) (bitIndex!0 (size!4298 (buf!4753 (_1!8556 lt!282245))) (currentByte!8987 (_1!8556 lt!282245)) (currentBit!8982 (_1!8556 lt!282245)))))))

(declare-fun lt!282233 () Unit!13171)

(declare-fun lt!282247 () BitStream!7704)

(declare-fun readBitPrefixLemma!0 (BitStream!7704 BitStream!7704) Unit!13171)

(assert (=> b!183336 (= lt!282233 (readBitPrefixLemma!0 lt!282247 (_2!8555 lt!282237)))))

(assert (=> b!183336 (= lt!282245 (readBitPure!0 (BitStream!7705 (buf!4753 (_2!8555 lt!282237)) (currentByte!8987 thiss!1204) (currentBit!8982 thiss!1204))))))

(assert (=> b!183336 (= lt!282256 (readBitPure!0 lt!282247))))

(declare-fun e!127130 () Bool)

(assert (=> b!183336 e!127130))

(declare-fun res!152402 () Bool)

(assert (=> b!183336 (=> (not res!152402) (not e!127130))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!183336 (= res!152402 (invariant!0 (currentBit!8982 thiss!1204) (currentByte!8987 thiss!1204) (size!4298 (buf!4753 (_2!8555 lt!282251)))))))

(assert (=> b!183336 (= lt!282247 (BitStream!7705 (buf!4753 (_2!8555 lt!282251)) (currentByte!8987 thiss!1204) (currentBit!8982 thiss!1204)))))

(declare-fun b!183338 () Bool)

(declare-fun res!152394 () Bool)

(assert (=> b!183338 (=> (not res!152394) (not e!127127))))

(assert (=> b!183338 (= res!152394 (invariant!0 (currentBit!8982 thiss!1204) (currentByte!8987 thiss!1204) (size!4298 (buf!4753 thiss!1204))))))

(declare-fun b!183339 () Bool)

(declare-fun res!152407 () Bool)

(assert (=> b!183339 (=> res!152407 e!127138)))

(assert (=> b!183339 (= res!152407 (not (isPrefixOf!0 thiss!1204 (_2!8555 lt!282251))))))

(declare-fun b!183340 () Bool)

(declare-fun res!152398 () Bool)

(assert (=> b!183340 (=> res!152398 e!127138)))

(declare-fun lt!282240 () (_ BitVec 64))

(assert (=> b!183340 (= res!152398 (or (not (= (size!4298 (buf!4753 (_2!8555 lt!282237))) (size!4298 (buf!4753 thiss!1204)))) (not (= lt!282254 (bvsub (bvadd lt!282240 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!183341 () Bool)

(declare-fun res!152397 () Bool)

(assert (=> b!183341 (=> res!152397 e!127136)))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!183341 (= res!152397 (not (= (bvand lt!282253 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!183342 () Bool)

(declare-fun res!152408 () Bool)

(assert (=> b!183342 (=> (not res!152408) (not e!127131))))

(assert (=> b!183342 (= res!152408 (isPrefixOf!0 thiss!1204 (_2!8555 lt!282251)))))

(declare-fun b!183343 () Bool)

(declare-fun res!152400 () Bool)

(assert (=> b!183343 (=> res!152400 e!127136)))

(assert (=> b!183343 (= res!152400 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!4298 (buf!4753 (_1!8558 lt!282238)))) ((_ sign_extend 32) (currentByte!8987 (_1!8558 lt!282238))) ((_ sign_extend 32) (currentBit!8982 (_1!8558 lt!282238))) ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))))

(declare-fun b!183344 () Bool)

(declare-fun res!152396 () Bool)

(assert (=> b!183344 (=> res!152396 e!127138)))

(assert (=> b!183344 (= res!152396 (not (invariant!0 (currentBit!8982 (_2!8555 lt!282237)) (currentByte!8987 (_2!8555 lt!282237)) (size!4298 (buf!4753 (_2!8555 lt!282237))))))))

(declare-fun b!183345 () Bool)

(assert (=> b!183345 (= e!127136 (= (bvand lt!282253 #b1111111111111111111111111111111111111111111111111111111111111111) lt!282253))))

(declare-fun b!183346 () Bool)

(assert (=> b!183346 (= e!127130 (invariant!0 (currentBit!8982 thiss!1204) (currentByte!8987 thiss!1204) (size!4298 (buf!4753 (_2!8555 lt!282237)))))))

(declare-fun b!183347 () Bool)

(assert (=> b!183347 (= e!127131 e!127132)))

(declare-fun res!152393 () Bool)

(assert (=> b!183347 (=> (not res!152393) (not e!127132))))

(assert (=> b!183347 (= res!152393 (and (= (_2!8556 lt!282236) lt!282252) (= (_1!8556 lt!282236) (_2!8555 lt!282251))))))

(declare-fun readerFrom!0 (BitStream!7704 (_ BitVec 32) (_ BitVec 32)) BitStream!7704)

(assert (=> b!183347 (= lt!282236 (readBitPure!0 (readerFrom!0 (_2!8555 lt!282251) (currentBit!8982 thiss!1204) (currentByte!8987 thiss!1204))))))

(declare-fun b!183348 () Bool)

(assert (=> b!183348 (= e!127127 (not e!127137))))

(declare-fun res!152401 () Bool)

(assert (=> b!183348 (=> res!152401 e!127137)))

(assert (=> b!183348 (= res!152401 (not (= lt!282242 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!282240))))))

(assert (=> b!183348 (= lt!282242 (bitIndex!0 (size!4298 (buf!4753 (_2!8555 lt!282251))) (currentByte!8987 (_2!8555 lt!282251)) (currentBit!8982 (_2!8555 lt!282251))))))

(assert (=> b!183348 (= lt!282240 (bitIndex!0 (size!4298 (buf!4753 thiss!1204)) (currentByte!8987 thiss!1204) (currentBit!8982 thiss!1204)))))

(assert (=> b!183348 e!127134))

(declare-fun res!152405 () Bool)

(assert (=> b!183348 (=> (not res!152405) (not e!127134))))

(assert (=> b!183348 (= res!152405 (= (size!4298 (buf!4753 thiss!1204)) (size!4298 (buf!4753 (_2!8555 lt!282251)))))))

(declare-fun appendBit!0 (BitStream!7704 Bool) tuple2!15820)

(assert (=> b!183348 (= lt!282251 (appendBit!0 thiss!1204 lt!282252))))

(assert (=> b!183348 (= lt!282252 (not (= (bvand v!189 lt!282255) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!183348 (= lt!282255 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!183337 () Bool)

(declare-fun e!127129 () Bool)

(assert (=> b!183337 (= e!127129 e!127127)))

(declare-fun res!152406 () Bool)

(assert (=> b!183337 (=> (not res!152406) (not e!127127))))

(assert (=> b!183337 (= res!152406 (validate_offset_bits!1 ((_ sign_extend 32) (size!4298 (buf!4753 thiss!1204))) ((_ sign_extend 32) (currentByte!8987 thiss!1204)) ((_ sign_extend 32) (currentBit!8982 thiss!1204)) lt!282249))))

(assert (=> b!183337 (= lt!282249 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun res!152403 () Bool)

(assert (=> start!40180 (=> (not res!152403) (not e!127129))))

(assert (=> start!40180 (= res!152403 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!40180 e!127129))

(assert (=> start!40180 true))

(declare-fun inv!12 (BitStream!7704) Bool)

(assert (=> start!40180 (and (inv!12 thiss!1204) e!127135)))

(assert (= (and start!40180 res!152403) b!183337))

(assert (= (and b!183337 res!152406) b!183338))

(assert (= (and b!183338 res!152394) b!183329))

(assert (= (and b!183329 res!152409) b!183348))

(assert (= (and b!183348 res!152405) b!183331))

(assert (= (and b!183331 res!152399) b!183342))

(assert (= (and b!183342 res!152408) b!183347))

(assert (= (and b!183347 res!152393) b!183335))

(assert (= (and b!183348 (not res!152401)) b!183330))

(assert (= (and b!183330 (not res!152391)) b!183344))

(assert (= (and b!183344 (not res!152396)) b!183340))

(assert (= (and b!183340 (not res!152398)) b!183333))

(assert (= (and b!183333 (not res!152404)) b!183339))

(assert (= (and b!183339 (not res!152407)) b!183336))

(assert (= (and b!183336 res!152402) b!183346))

(assert (= (and b!183336 res!152392) b!183334))

(assert (= (and b!183336 (not res!152395)) b!183343))

(assert (= (and b!183343 (not res!152400)) b!183341))

(assert (= (and b!183341 (not res!152397)) b!183345))

(assert (= start!40180 b!183332))

(declare-fun m!285233 () Bool)

(assert (=> b!183332 m!285233))

(declare-fun m!285235 () Bool)

(assert (=> b!183338 m!285235))

(declare-fun m!285237 () Bool)

(assert (=> b!183342 m!285237))

(declare-fun m!285239 () Bool)

(assert (=> b!183344 m!285239))

(declare-fun m!285241 () Bool)

(assert (=> b!183335 m!285241))

(declare-fun m!285243 () Bool)

(assert (=> b!183341 m!285243))

(declare-fun m!285245 () Bool)

(assert (=> b!183346 m!285245))

(declare-fun m!285247 () Bool)

(assert (=> b!183336 m!285247))

(declare-fun m!285249 () Bool)

(assert (=> b!183336 m!285249))

(declare-fun m!285251 () Bool)

(assert (=> b!183336 m!285251))

(declare-fun m!285253 () Bool)

(assert (=> b!183336 m!285253))

(declare-fun m!285255 () Bool)

(assert (=> b!183336 m!285255))

(declare-fun m!285257 () Bool)

(assert (=> b!183336 m!285257))

(declare-fun m!285259 () Bool)

(assert (=> b!183336 m!285259))

(declare-fun m!285261 () Bool)

(assert (=> b!183336 m!285261))

(declare-fun m!285263 () Bool)

(assert (=> b!183336 m!285263))

(declare-fun m!285265 () Bool)

(assert (=> b!183336 m!285265))

(declare-fun m!285267 () Bool)

(assert (=> b!183336 m!285267))

(declare-fun m!285269 () Bool)

(assert (=> b!183336 m!285269))

(declare-fun m!285271 () Bool)

(assert (=> b!183336 m!285271))

(declare-fun m!285273 () Bool)

(assert (=> b!183336 m!285273))

(declare-fun m!285275 () Bool)

(assert (=> b!183336 m!285275))

(declare-fun m!285277 () Bool)

(assert (=> b!183333 m!285277))

(declare-fun m!285279 () Bool)

(assert (=> b!183337 m!285279))

(assert (=> b!183339 m!285237))

(declare-fun m!285281 () Bool)

(assert (=> b!183331 m!285281))

(declare-fun m!285283 () Bool)

(assert (=> b!183331 m!285283))

(declare-fun m!285285 () Bool)

(assert (=> b!183343 m!285285))

(assert (=> b!183348 m!285281))

(assert (=> b!183348 m!285283))

(declare-fun m!285287 () Bool)

(assert (=> b!183348 m!285287))

(declare-fun m!285289 () Bool)

(assert (=> start!40180 m!285289))

(declare-fun m!285291 () Bool)

(assert (=> b!183330 m!285291))

(declare-fun m!285293 () Bool)

(assert (=> b!183330 m!285293))

(declare-fun m!285295 () Bool)

(assert (=> b!183330 m!285295))

(declare-fun m!285297 () Bool)

(assert (=> b!183330 m!285297))

(declare-fun m!285299 () Bool)

(assert (=> b!183347 m!285299))

(assert (=> b!183347 m!285299))

(declare-fun m!285301 () Bool)

(assert (=> b!183347 m!285301))

(check-sat (not b!183337) (not b!183343) (not b!183347) (not b!183346) (not b!183342) (not b!183339) (not b!183335) (not b!183338) (not b!183331) (not b!183348) (not b!183333) (not start!40180) (not b!183336) (not b!183344) (not b!183341) (not b!183330) (not b!183332))
