; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38446 () Bool)

(assert start!38446)

(declare-fun b!172683 () Bool)

(declare-fun e!120662 () Bool)

(declare-datatypes ((array!9285 0))(
  ( (array!9286 (arr!5028 (Array (_ BitVec 32) (_ BitVec 8))) (size!4098 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7304 0))(
  ( (BitStream!7305 (buf!4526 array!9285) (currentByte!8604 (_ BitVec 32)) (currentBit!8599 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!12343 0))(
  ( (Unit!12344) )
))
(declare-datatypes ((tuple2!14846 0))(
  ( (tuple2!14847 (_1!8065 Unit!12343) (_2!8065 BitStream!7304)) )
))
(declare-fun lt!265976 () tuple2!14846)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!172683 (= e!120662 (not (invariant!0 (currentBit!8599 (_2!8065 lt!265976)) (currentByte!8604 (_2!8065 lt!265976)) (size!4098 (buf!4526 (_2!8065 lt!265976))))))))

(declare-fun b!172685 () Bool)

(declare-fun res!143025 () Bool)

(assert (=> b!172685 (=> (not res!143025) (not e!120662))))

(declare-fun nBits!340 () (_ BitVec 32))

(declare-fun thiss!1187 () BitStream!7304)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!172685 (= res!143025 (= (bitIndex!0 (size!4098 (buf!4526 (_2!8065 lt!265976))) (currentByte!8604 (_2!8065 lt!265976)) (currentBit!8599 (_2!8065 lt!265976))) (bvadd (bitIndex!0 (size!4098 (buf!4526 thiss!1187)) (currentByte!8604 thiss!1187) (currentBit!8599 thiss!1187)) ((_ sign_extend 32) nBits!340))))))

(declare-fun b!172686 () Bool)

(declare-fun res!143023 () Bool)

(assert (=> b!172686 (=> (not res!143023) (not e!120662))))

(assert (=> b!172686 (= res!143023 (= (size!4098 (buf!4526 thiss!1187)) (size!4098 (buf!4526 (_2!8065 lt!265976)))))))

(declare-fun b!172687 () Bool)

(declare-fun res!143026 () Bool)

(declare-fun e!120664 () Bool)

(assert (=> b!172687 (=> (not res!143026) (not e!120664))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!172687 (= res!143026 (validate_offset_bits!1 ((_ sign_extend 32) (size!4098 (buf!4526 thiss!1187))) ((_ sign_extend 32) (currentByte!8604 thiss!1187)) ((_ sign_extend 32) (currentBit!8599 thiss!1187)) ((_ sign_extend 32) nBits!340)))))

(declare-fun b!172688 () Bool)

(assert (=> b!172688 (= e!120664 e!120662)))

(declare-fun res!143028 () Bool)

(assert (=> b!172688 (=> (not res!143028) (not e!120662))))

(assert (=> b!172688 (= res!143028 (= (size!4098 (buf!4526 (_2!8065 lt!265976))) (size!4098 (buf!4526 thiss!1187))))))

(declare-fun v!186 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7304 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!14846)

(assert (=> b!172688 (= lt!265976 (appendBitsLSBFirstLoopTR!0 thiss!1187 v!186 nBits!340 #b00000000000000000000000000000000))))

(declare-fun b!172689 () Bool)

(declare-fun e!120663 () Bool)

(declare-fun array_inv!3839 (array!9285) Bool)

(assert (=> b!172689 (= e!120663 (array_inv!3839 (buf!4526 thiss!1187)))))

(declare-fun res!143024 () Bool)

(assert (=> start!38446 (=> (not res!143024) (not e!120664))))

(assert (=> start!38446 (= res!143024 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000)))))

(assert (=> start!38446 e!120664))

(assert (=> start!38446 true))

(declare-fun inv!12 (BitStream!7304) Bool)

(assert (=> start!38446 (and (inv!12 thiss!1187) e!120663)))

(declare-fun b!172684 () Bool)

(declare-fun res!143027 () Bool)

(assert (=> b!172684 (=> (not res!143027) (not e!120664))))

(assert (=> b!172684 (= res!143027 (invariant!0 (currentBit!8599 thiss!1187) (currentByte!8604 thiss!1187) (size!4098 (buf!4526 thiss!1187))))))

(assert (= (and start!38446 res!143024) b!172687))

(assert (= (and b!172687 res!143026) b!172684))

(assert (= (and b!172684 res!143027) b!172688))

(assert (= (and b!172688 res!143028) b!172685))

(assert (= (and b!172685 res!143025) b!172686))

(assert (= (and b!172686 res!143023) b!172683))

(assert (= start!38446 b!172689))

(declare-fun m!271827 () Bool)

(assert (=> b!172689 m!271827))

(declare-fun m!271829 () Bool)

(assert (=> start!38446 m!271829))

(declare-fun m!271831 () Bool)

(assert (=> b!172688 m!271831))

(declare-fun m!271833 () Bool)

(assert (=> b!172683 m!271833))

(declare-fun m!271835 () Bool)

(assert (=> b!172684 m!271835))

(declare-fun m!271837 () Bool)

(assert (=> b!172685 m!271837))

(declare-fun m!271839 () Bool)

(assert (=> b!172685 m!271839))

(declare-fun m!271841 () Bool)

(assert (=> b!172687 m!271841))

(push 1)

(assert (not b!172689))

(assert (not start!38446))

(assert (not b!172683))

(assert (not b!172688))

(assert (not b!172687))

(assert (not b!172684))

(assert (not b!172685))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!172770 () Bool)

(declare-fun res!143098 () Bool)

(declare-fun lt!266255 () tuple2!14846)

(assert (=> b!172770 (= res!143098 (= (bitIndex!0 (size!4098 (buf!4526 (_2!8065 lt!266255))) (currentByte!8604 (_2!8065 lt!266255)) (currentBit!8599 (_2!8065 lt!266255))) (bvadd (bitIndex!0 (size!4098 (buf!4526 thiss!1187)) (currentByte!8604 thiss!1187) (currentBit!8599 thiss!1187)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun e!120712 () Bool)

(assert (=> b!172770 (=> (not res!143098) (not e!120712))))

(declare-fun d!61153 () Bool)

(declare-fun e!120713 () Bool)

(assert (=> d!61153 e!120713))

(declare-fun res!143094 () Bool)

(assert (=> d!61153 (=> (not res!143094) (not e!120713))))

(declare-fun lt!266254 () tuple2!14846)

(assert (=> d!61153 (= res!143094 (invariant!0 (currentBit!8599 (_2!8065 lt!266254)) (currentByte!8604 (_2!8065 lt!266254)) (size!4098 (buf!4526 (_2!8065 lt!266254)))))))

(declare-fun e!120714 () tuple2!14846)

(assert (=> d!61153 (= lt!266254 e!120714)))

(declare-fun c!9097 () Bool)

(assert (=> d!61153 (= c!9097 (= #b00000000000000000000000000000000 nBits!340))))

(assert (=> d!61153 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000))))

(assert (=> d!61153 (= (appendBitsLSBFirstLoopTR!0 thiss!1187 v!186 nBits!340 #b00000000000000000000000000000000) lt!266254)))

(declare-fun b!172771 () Bool)

(declare-fun lt!266293 () tuple2!14846)

(assert (=> b!172771 (= e!120714 (tuple2!14847 (_1!8065 lt!266293) (_2!8065 lt!266293)))))

(declare-fun lt!266262 () Bool)

(assert (=> b!172771 (= lt!266262 (not (= (bvand v!186 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) #b00000000000000000000000000000000))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun appendBit!0 (BitStream!7304 Bool) tuple2!14846)

(assert (=> b!172771 (= lt!266255 (appendBit!0 thiss!1187 lt!266262))))

(declare-fun res!143104 () Bool)

(assert (=> b!172771 (= res!143104 (= (size!4098 (buf!4526 thiss!1187)) (size!4098 (buf!4526 (_2!8065 lt!266255)))))))

(assert (=> b!172771 (=> (not res!143104) (not e!120712))))

(assert (=> b!172771 e!120712))

(declare-fun lt!266284 () tuple2!14846)

(assert (=> b!172771 (= lt!266284 lt!266255)))

(assert (=> b!172771 (= lt!266293 (appendBitsLSBFirstLoopTR!0 (_2!8065 lt!266284) v!186 nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!266260 () Unit!12343)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7304 BitStream!7304 BitStream!7304) Unit!12343)

(assert (=> b!172771 (= lt!266260 (lemmaIsPrefixTransitive!0 thiss!1187 (_2!8065 lt!266284) (_2!8065 lt!266293)))))

(declare-fun isPrefixOf!0 (BitStream!7304 BitStream!7304) Bool)

(assert (=> b!172771 (isPrefixOf!0 thiss!1187 (_2!8065 lt!266293))))

(declare-fun lt!266253 () Unit!12343)

(assert (=> b!172771 (= lt!266253 lt!266260)))

(assert (=> b!172771 (invariant!0 (currentBit!8599 thiss!1187) (currentByte!8604 thiss!1187) (size!4098 (buf!4526 (_2!8065 lt!266284))))))

(declare-fun lt!266261 () BitStream!7304)

(assert (=> b!172771 (= lt!266261 (BitStream!7305 (buf!4526 (_2!8065 lt!266284)) (currentByte!8604 thiss!1187) (currentBit!8599 thiss!1187)))))

(assert (=> b!172771 (invariant!0 (currentBit!8599 lt!266261) (currentByte!8604 lt!266261) (size!4098 (buf!4526 (_2!8065 lt!266293))))))

(declare-fun lt!266267 () BitStream!7304)

(assert (=> b!172771 (= lt!266267 (BitStream!7305 (buf!4526 (_2!8065 lt!266293)) (currentByte!8604 lt!266261) (currentBit!8599 lt!266261)))))

(declare-datatypes ((tuple2!14848 0))(
  ( (tuple2!14849 (_1!8066 BitStream!7304) (_2!8066 Bool)) )
))
(declare-fun lt!266296 () tuple2!14848)

(declare-fun readBitPure!0 (BitStream!7304) tuple2!14848)

(assert (=> b!172771 (= lt!266296 (readBitPure!0 lt!266261))))

(declare-fun lt!266278 () tuple2!14848)

(assert (=> b!172771 (= lt!266278 (readBitPure!0 lt!266267))))

(declare-fun lt!266273 () Unit!12343)

(declare-fun readBitPrefixLemma!0 (BitStream!7304 BitStream!7304) Unit!12343)

(assert (=> b!172771 (= lt!266273 (readBitPrefixLemma!0 lt!266261 (_2!8065 lt!266293)))))

(declare-fun res!143095 () Bool)

(assert (=> b!172771 (= res!143095 (= (bitIndex!0 (size!4098 (buf!4526 (_1!8066 lt!266296))) (currentByte!8604 (_1!8066 lt!266296)) (currentBit!8599 (_1!8066 lt!266296))) (bitIndex!0 (size!4098 (buf!4526 (_1!8066 lt!266278))) (currentByte!8604 (_1!8066 lt!266278)) (currentBit!8599 (_1!8066 lt!266278)))))))

(declare-fun e!120710 () Bool)

(assert (=> b!172771 (=> (not res!143095) (not e!120710))))

(assert (=> b!172771 e!120710))

(declare-fun lt!266299 () Unit!12343)

(assert (=> b!172771 (= lt!266299 lt!266273)))

(declare-datatypes ((tuple2!14850 0))(
  ( (tuple2!14851 (_1!8067 BitStream!7304) (_2!8067 BitStream!7304)) )
))
(declare-fun lt!266281 () tuple2!14850)

(declare-fun reader!0 (BitStream!7304 BitStream!7304) tuple2!14850)

(assert (=> b!172771 (= lt!266281 (reader!0 thiss!1187 (_2!8065 lt!266293)))))

(declare-fun lt!266272 () tuple2!14850)

(assert (=> b!172771 (= lt!266272 (reader!0 (_2!8065 lt!266284) (_2!8065 lt!266293)))))

(declare-fun lt!266250 () tuple2!14848)

(assert (=> b!172771 (= lt!266250 (readBitPure!0 (_1!8067 lt!266281)))))

(assert (=> b!172771 (= (_2!8066 lt!266250) lt!266262)))

(declare-fun lt!266258 () Unit!12343)

(declare-fun Unit!12345 () Unit!12343)

(assert (=> b!172771 (= lt!266258 Unit!12345)))

(declare-fun lt!266287 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!172771 (= lt!266287 (bvand v!186 (onesLSBLong!0 #b00000000000000000000000000000000)))))

(declare-fun lt!266285 () (_ BitVec 64))

(assert (=> b!172771 (= lt!266285 ((_ sign_extend 32) (bvsub nBits!340 #b00000000000000000000000000000000)))))

(declare-fun lt!266274 () Unit!12343)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7304 array!9285 (_ BitVec 64)) Unit!12343)

(assert (=> b!172771 (= lt!266274 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1187 (buf!4526 (_2!8065 lt!266293)) lt!266285))))

(assert (=> b!172771 (validate_offset_bits!1 ((_ sign_extend 32) (size!4098 (buf!4526 (_2!8065 lt!266293)))) ((_ sign_extend 32) (currentByte!8604 thiss!1187)) ((_ sign_extend 32) (currentBit!8599 thiss!1187)) lt!266285)))

(declare-fun lt!266257 () Unit!12343)

(assert (=> b!172771 (= lt!266257 lt!266274)))

(declare-datatypes ((tuple2!14854 0))(
  ( (tuple2!14855 (_1!8069 BitStream!7304) (_2!8069 (_ BitVec 64))) )
))
(declare-fun lt!266300 () tuple2!14854)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7304 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!14854)

(assert (=> b!172771 (= lt!266300 (readNBitsLSBFirstsLoopPure!0 (_1!8067 lt!266281) nBits!340 #b00000000000000000000000000000000 lt!266287))))

(declare-fun lt!266252 () (_ BitVec 64))

(assert (=> b!172771 (= lt!266252 ((_ sign_extend 32) (bvsub (bvsub nBits!340 #b00000000000000000000000000000000) #b00000000000000000000000000000001)))))

(declare-fun lt!266256 () Unit!12343)

(assert (=> b!172771 (= lt!266256 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8065 lt!266284) (buf!4526 (_2!8065 lt!266293)) lt!266252))))

(assert (=> b!172771 (validate_offset_bits!1 ((_ sign_extend 32) (size!4098 (buf!4526 (_2!8065 lt!266293)))) ((_ sign_extend 32) (currentByte!8604 (_2!8065 lt!266284))) ((_ sign_extend 32) (currentBit!8599 (_2!8065 lt!266284))) lt!266252)))

(declare-fun lt!266288 () Unit!12343)

(assert (=> b!172771 (= lt!266288 lt!266256)))

(declare-fun lt!266266 () tuple2!14854)

(assert (=> b!172771 (= lt!266266 (readNBitsLSBFirstsLoopPure!0 (_1!8067 lt!266272) nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!266287 (ite (_2!8066 lt!266250) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) #b00000000000000000000000000000000)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!266275 () tuple2!14854)

(assert (=> b!172771 (= lt!266275 (readNBitsLSBFirstsLoopPure!0 (_1!8067 lt!266281) nBits!340 #b00000000000000000000000000000000 lt!266287))))

(declare-fun c!9096 () Bool)

(assert (=> b!172771 (= c!9096 (_2!8066 (readBitPure!0 (_1!8067 lt!266281))))))

(declare-fun e!120715 () (_ BitVec 64))

(declare-fun lt!266289 () tuple2!14854)

(declare-fun withMovedBitIndex!0 (BitStream!7304 (_ BitVec 64)) BitStream!7304)

(assert (=> b!172771 (= lt!266289 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8067 lt!266281) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!266287 e!120715)))))

(declare-fun lt!266264 () Unit!12343)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7304 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!12343)

(assert (=> b!172771 (= lt!266264 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8067 lt!266281) nBits!340 #b00000000000000000000000000000000 lt!266287))))

(assert (=> b!172771 (and (= (_2!8069 lt!266275) (_2!8069 lt!266289)) (= (_1!8069 lt!266275) (_1!8069 lt!266289)))))

(declare-fun lt!266295 () Unit!12343)

(assert (=> b!172771 (= lt!266295 lt!266264)))

(assert (=> b!172771 (= (_1!8067 lt!266281) (withMovedBitIndex!0 (_2!8067 lt!266281) (bvsub (bitIndex!0 (size!4098 (buf!4526 thiss!1187)) (currentByte!8604 thiss!1187) (currentBit!8599 thiss!1187)) (bitIndex!0 (size!4098 (buf!4526 (_2!8065 lt!266293))) (currentByte!8604 (_2!8065 lt!266293)) (currentBit!8599 (_2!8065 lt!266293))))))))

(declare-fun lt!266303 () Unit!12343)

(declare-fun Unit!12346 () Unit!12343)

(assert (=> b!172771 (= lt!266303 Unit!12346)))

(assert (=> b!172771 (= (_1!8067 lt!266272) (withMovedBitIndex!0 (_2!8067 lt!266272) (bvsub (bitIndex!0 (size!4098 (buf!4526 (_2!8065 lt!266284))) (currentByte!8604 (_2!8065 lt!266284)) (currentBit!8599 (_2!8065 lt!266284))) (bitIndex!0 (size!4098 (buf!4526 (_2!8065 lt!266293))) (currentByte!8604 (_2!8065 lt!266293)) (currentBit!8599 (_2!8065 lt!266293))))))))

(declare-fun lt!266292 () Unit!12343)

(declare-fun Unit!12347 () Unit!12343)

(assert (=> b!172771 (= lt!266292 Unit!12347)))

(assert (=> b!172771 (= (bitIndex!0 (size!4098 (buf!4526 thiss!1187)) (currentByte!8604 thiss!1187) (currentBit!8599 thiss!1187)) (bvsub (bitIndex!0 (size!4098 (buf!4526 (_2!8065 lt!266284))) (currentByte!8604 (_2!8065 lt!266284)) (currentBit!8599 (_2!8065 lt!266284))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!266263 () Unit!12343)

(declare-fun Unit!12348 () Unit!12343)

(assert (=> b!172771 (= lt!266263 Unit!12348)))

(assert (=> b!172771 (= (_2!8069 lt!266300) (_2!8069 lt!266266))))

(declare-fun lt!266277 () Unit!12343)

(declare-fun Unit!12349 () Unit!12343)

(assert (=> b!172771 (= lt!266277 Unit!12349)))

(assert (=> b!172771 (invariant!0 (currentBit!8599 (_2!8065 lt!266293)) (currentByte!8604 (_2!8065 lt!266293)) (size!4098 (buf!4526 (_2!8065 lt!266293))))))

(declare-fun lt!266249 () Unit!12343)

(declare-fun Unit!12350 () Unit!12343)

(assert (=> b!172771 (= lt!266249 Unit!12350)))

(assert (=> b!172771 (= (size!4098 (buf!4526 thiss!1187)) (size!4098 (buf!4526 (_2!8065 lt!266293))))))

(declare-fun lt!266268 () Unit!12343)

(declare-fun Unit!12351 () Unit!12343)

(assert (=> b!172771 (= lt!266268 Unit!12351)))

(assert (=> b!172771 (= (bitIndex!0 (size!4098 (buf!4526 (_2!8065 lt!266293))) (currentByte!8604 (_2!8065 lt!266293)) (currentBit!8599 (_2!8065 lt!266293))) (bvsub (bvadd (bitIndex!0 (size!4098 (buf!4526 thiss!1187)) (currentByte!8604 thiss!1187) (currentBit!8599 thiss!1187)) ((_ sign_extend 32) nBits!340)) ((_ sign_extend 32) #b00000000000000000000000000000000)))))

(declare-fun lt!266269 () Unit!12343)

(declare-fun Unit!12352 () Unit!12343)

(assert (=> b!172771 (= lt!266269 Unit!12352)))

(declare-fun lt!266280 () Unit!12343)

(declare-fun Unit!12354 () Unit!12343)

(assert (=> b!172771 (= lt!266280 Unit!12354)))

(declare-fun lt!266291 () tuple2!14850)

(assert (=> b!172771 (= lt!266291 (reader!0 thiss!1187 (_2!8065 lt!266293)))))

(declare-fun lt!266298 () (_ BitVec 64))

(assert (=> b!172771 (= lt!266298 ((_ sign_extend 32) (bvsub nBits!340 #b00000000000000000000000000000000)))))

(declare-fun lt!266294 () Unit!12343)

(assert (=> b!172771 (= lt!266294 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1187 (buf!4526 (_2!8065 lt!266293)) lt!266298))))

(assert (=> b!172771 (validate_offset_bits!1 ((_ sign_extend 32) (size!4098 (buf!4526 (_2!8065 lt!266293)))) ((_ sign_extend 32) (currentByte!8604 thiss!1187)) ((_ sign_extend 32) (currentBit!8599 thiss!1187)) lt!266298)))

(declare-fun lt!266283 () Unit!12343)

(assert (=> b!172771 (= lt!266283 lt!266294)))

(declare-fun lt!266304 () tuple2!14854)

(assert (=> b!172771 (= lt!266304 (readNBitsLSBFirstsLoopPure!0 (_1!8067 lt!266291) nBits!340 #b00000000000000000000000000000000 (bvand v!186 (onesLSBLong!0 #b00000000000000000000000000000000))))))

(declare-fun res!143102 () Bool)

(assert (=> b!172771 (= res!143102 (= (_2!8069 lt!266304) (bvand v!186 (onesLSBLong!0 nBits!340))))))

(declare-fun e!120711 () Bool)

(assert (=> b!172771 (=> (not res!143102) (not e!120711))))

(assert (=> b!172771 e!120711))

(declare-fun lt!266282 () Unit!12343)

(declare-fun Unit!12355 () Unit!12343)

(assert (=> b!172771 (= lt!266282 Unit!12355)))

(declare-fun b!172772 () Bool)

(declare-fun lt!266265 () tuple2!14848)

(declare-fun readerFrom!0 (BitStream!7304 (_ BitVec 32) (_ BitVec 32)) BitStream!7304)

(assert (=> b!172772 (= lt!266265 (readBitPure!0 (readerFrom!0 (_2!8065 lt!266255) (currentBit!8599 thiss!1187) (currentByte!8604 thiss!1187))))))

(declare-fun res!143100 () Bool)

(assert (=> b!172772 (= res!143100 (and (= (_2!8066 lt!266265) lt!266262) (= (_1!8066 lt!266265) (_2!8065 lt!266255))))))

(declare-fun e!120716 () Bool)

(assert (=> b!172772 (=> (not res!143100) (not e!120716))))

(assert (=> b!172772 (= e!120712 e!120716)))

(declare-fun b!172773 () Bool)

(declare-fun e!120709 () Bool)

(declare-fun lt!266301 () tuple2!14854)

(declare-fun lt!266271 () tuple2!14850)

(assert (=> b!172773 (= e!120709 (= (_1!8069 lt!266301) (_2!8067 lt!266271)))))

(declare-fun call!2854 () Bool)

(declare-fun bm!2851 () Bool)

(assert (=> bm!2851 (= call!2854 (isPrefixOf!0 thiss!1187 (ite c!9097 thiss!1187 (_2!8065 lt!266255))))))

(declare-fun b!172774 () Bool)

(declare-fun e!120717 () Bool)

(declare-fun lt!266290 () (_ BitVec 64))

(assert (=> b!172774 (= e!120717 (validate_offset_bits!1 ((_ sign_extend 32) (size!4098 (buf!4526 thiss!1187))) ((_ sign_extend 32) (currentByte!8604 thiss!1187)) ((_ sign_extend 32) (currentBit!8599 thiss!1187)) lt!266290))))

(declare-fun b!172775 () Bool)

(declare-fun res!143093 () Bool)

(assert (=> b!172775 (= res!143093 call!2854)))

(assert (=> b!172775 (=> (not res!143093) (not e!120712))))

(declare-fun b!172776 () Bool)

(assert (=> b!172776 (= e!120716 (= (bitIndex!0 (size!4098 (buf!4526 (_1!8066 lt!266265))) (currentByte!8604 (_1!8066 lt!266265)) (currentBit!8599 (_1!8066 lt!266265))) (bitIndex!0 (size!4098 (buf!4526 (_2!8065 lt!266255))) (currentByte!8604 (_2!8065 lt!266255)) (currentBit!8599 (_2!8065 lt!266255)))))))

(declare-fun b!172777 () Bool)

(declare-fun res!143099 () Bool)

(assert (=> b!172777 (=> (not res!143099) (not e!120713))))

(assert (=> b!172777 (= res!143099 (= (size!4098 (buf!4526 thiss!1187)) (size!4098 (buf!4526 (_2!8065 lt!266254)))))))

(declare-fun b!172778 () Bool)

(declare-fun res!143103 () Bool)

(assert (=> b!172778 (=> (not res!143103) (not e!120713))))

(declare-fun lt!266297 () (_ BitVec 64))

(declare-fun lt!266251 () (_ BitVec 64))

(assert (=> b!172778 (= res!143103 (= (bitIndex!0 (size!4098 (buf!4526 (_2!8065 lt!266254))) (currentByte!8604 (_2!8065 lt!266254)) (currentBit!8599 (_2!8065 lt!266254))) (bvsub lt!266251 lt!266297)))))

(assert (=> b!172778 (or (= (bvand lt!266251 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!266297 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!266251 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!266251 lt!266297) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!172778 (= lt!266297 ((_ sign_extend 32) #b00000000000000000000000000000000))))

(declare-fun lt!266302 () (_ BitVec 64))

(declare-fun lt!266286 () (_ BitVec 64))

(assert (=> b!172778 (= lt!266251 (bvadd lt!266302 lt!266286))))

(assert (=> b!172778 (or (not (= (bvand lt!266302 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!266286 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!266302 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!266302 lt!266286) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!172778 (= lt!266286 ((_ sign_extend 32) nBits!340))))

(assert (=> b!172778 (= lt!266302 (bitIndex!0 (size!4098 (buf!4526 thiss!1187)) (currentByte!8604 thiss!1187) (currentBit!8599 thiss!1187)))))

(declare-fun b!172779 () Bool)

(assert (=> b!172779 (= e!120711 (= (_1!8069 lt!266304) (_2!8067 lt!266291)))))

(declare-fun b!172780 () Bool)

(declare-fun Unit!12366 () Unit!12343)

(assert (=> b!172780 (= e!120714 (tuple2!14847 Unit!12366 thiss!1187))))

(declare-fun lt!266276 () Unit!12343)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7304) Unit!12343)

(assert (=> b!172780 (= lt!266276 (lemmaIsPrefixRefl!0 thiss!1187))))

(assert (=> b!172780 call!2854))

(declare-fun lt!266270 () Unit!12343)

(assert (=> b!172780 (= lt!266270 lt!266276)))

(declare-fun b!172781 () Bool)

(declare-fun res!143096 () Bool)

(assert (=> b!172781 (=> (not res!143096) (not e!120713))))

(assert (=> b!172781 (= res!143096 (isPrefixOf!0 thiss!1187 (_2!8065 lt!266254)))))

(declare-fun b!172782 () Bool)

(assert (=> b!172782 (= e!120710 (= (_2!8066 lt!266296) (_2!8066 lt!266278)))))

(declare-fun b!172783 () Bool)

(assert (=> b!172783 (= e!120713 e!120709)))

(declare-fun res!143101 () Bool)

(assert (=> b!172783 (=> (not res!143101) (not e!120709))))

(assert (=> b!172783 (= res!143101 (= (_2!8069 lt!266301) (bvand v!186 (onesLSBLong!0 nBits!340))))))

(assert (=> b!172783 (= lt!266301 (readNBitsLSBFirstsLoopPure!0 (_1!8067 lt!266271) nBits!340 #b00000000000000000000000000000000 (bvand v!186 (onesLSBLong!0 #b00000000000000000000000000000000))))))

(declare-fun lt!266259 () Unit!12343)

(declare-fun lt!266279 () Unit!12343)

(assert (=> b!172783 (= lt!266259 lt!266279)))

(assert (=> b!172783 (validate_offset_bits!1 ((_ sign_extend 32) (size!4098 (buf!4526 (_2!8065 lt!266254)))) ((_ sign_extend 32) (currentByte!8604 thiss!1187)) ((_ sign_extend 32) (currentBit!8599 thiss!1187)) lt!266290)))

(assert (=> b!172783 (= lt!266279 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1187 (buf!4526 (_2!8065 lt!266254)) lt!266290))))

(assert (=> b!172783 e!120717))

(declare-fun res!143097 () Bool)

(assert (=> b!172783 (=> (not res!143097) (not e!120717))))

(assert (=> b!172783 (= res!143097 (and (= (size!4098 (buf!4526 thiss!1187)) (size!4098 (buf!4526 (_2!8065 lt!266254)))) (bvsge lt!266290 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!172783 (= lt!266290 ((_ sign_extend 32) (bvsub nBits!340 #b00000000000000000000000000000000)))))

(assert (=> b!172783 (or (= (bvand nBits!340 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!340 #b10000000000000000000000000000000) (bvand (bvsub nBits!340 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!172783 (= lt!266271 (reader!0 thiss!1187 (_2!8065 lt!266254)))))

(declare-fun b!172784 () Bool)

(assert (=> b!172784 (= e!120715 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) #b00000000000000000000000000000000)))))

(declare-fun b!172785 () Bool)

(assert (=> b!172785 (= e!120715 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (= (and d!61153 c!9097) b!172780))

(assert (= (and d!61153 (not c!9097)) b!172771))

(assert (= (and b!172771 res!143104) b!172770))

(assert (= (and b!172770 res!143098) b!172775))

(assert (= (and b!172775 res!143093) b!172772))

(assert (= (and b!172772 res!143100) b!172776))

(assert (= (and b!172771 res!143095) b!172782))

(assert (= (and b!172771 c!9096) b!172784))

(assert (= (and b!172771 (not c!9096)) b!172785))

(assert (= (and b!172771 res!143102) b!172779))

(assert (= (or b!172780 b!172775) bm!2851))

(assert (= (and d!61153 res!143094) b!172777))

(assert (= (and b!172777 res!143099) b!172778))

(assert (= (and b!172778 res!143103) b!172781))

(assert (= (and b!172781 res!143096) b!172783))

(assert (= (and b!172783 res!143097) b!172774))

(assert (= (and b!172783 res!143101) b!172773))

(declare-fun m!271851 () Bool)

(assert (=> b!172772 m!271851))

(assert (=> b!172772 m!271851))

(declare-fun m!271853 () Bool)

(assert (=> b!172772 m!271853))

(declare-fun m!271855 () Bool)

(assert (=> b!172783 m!271855))

(declare-fun m!271857 () Bool)

(assert (=> b!172783 m!271857))

(declare-fun m!271859 () Bool)

(assert (=> b!172783 m!271859))

(declare-fun m!271861 () Bool)

(assert (=> b!172783 m!271861))

(declare-fun m!271863 () Bool)

(assert (=> b!172783 m!271863))

(declare-fun m!271865 () Bool)

(assert (=> b!172783 m!271865))

(declare-fun m!271867 () Bool)

(assert (=> b!172771 m!271867))

(declare-fun m!271869 () Bool)

(assert (=> b!172771 m!271869))

(declare-fun m!271871 () Bool)

(assert (=> b!172771 m!271871))

(declare-fun m!271873 () Bool)

(assert (=> b!172771 m!271873))

(declare-fun m!271875 () Bool)

(assert (=> b!172771 m!271875))

(assert (=> b!172771 m!271869))

(assert (=> b!172771 m!271863))

(declare-fun m!271877 () Bool)

(assert (=> b!172771 m!271877))

(declare-fun m!271879 () Bool)

(assert (=> b!172771 m!271879))

(declare-fun m!271881 () Bool)

(assert (=> b!172771 m!271881))

(declare-fun m!271883 () Bool)

(assert (=> b!172771 m!271883))

(declare-fun m!271885 () Bool)

(assert (=> b!172771 m!271885))

(declare-fun m!271887 () Bool)

(assert (=> b!172771 m!271887))

(declare-fun m!271889 () Bool)

(assert (=> b!172771 m!271889))

(assert (=> b!172771 m!271839))

(declare-fun m!271891 () Bool)

(assert (=> b!172771 m!271891))

(declare-fun m!271893 () Bool)

(assert (=> b!172771 m!271893))

(declare-fun m!271895 () Bool)

(assert (=> b!172771 m!271895))

(declare-fun m!271897 () Bool)

(assert (=> b!172771 m!271897))

(declare-fun m!271899 () Bool)

(assert (=> b!172771 m!271899))

(declare-fun m!271901 () Bool)

(assert (=> b!172771 m!271901))

(declare-fun m!271903 () Bool)

(assert (=> b!172771 m!271903))

(declare-fun m!271905 () Bool)

(assert (=> b!172771 m!271905))

(declare-fun m!271907 () Bool)

(assert (=> b!172771 m!271907))

(declare-fun m!271909 () Bool)

(assert (=> b!172771 m!271909))

(declare-fun m!271911 () Bool)

(assert (=> b!172771 m!271911))

(declare-fun m!271913 () Bool)

(assert (=> b!172771 m!271913))

(declare-fun m!271915 () Bool)

(assert (=> b!172771 m!271915))

(declare-fun m!271917 () Bool)

(assert (=> b!172771 m!271917))

(declare-fun m!271919 () Bool)

(assert (=> b!172771 m!271919))

(declare-fun m!271921 () Bool)

(assert (=> b!172771 m!271921))

(declare-fun m!271923 () Bool)

(assert (=> b!172771 m!271923))

(assert (=> b!172771 m!271865))

(declare-fun m!271925 () Bool)

(assert (=> b!172771 m!271925))

(declare-fun m!271927 () Bool)

(assert (=> b!172771 m!271927))

(declare-fun m!271929 () Bool)

(assert (=> d!61153 m!271929))

(declare-fun m!271931 () Bool)

(assert (=> b!172781 m!271931))

(declare-fun m!271933 () Bool)

(assert (=> b!172774 m!271933))

(declare-fun m!271935 () Bool)

(assert (=> b!172770 m!271935))

(assert (=> b!172770 m!271839))

(declare-fun m!271937 () Bool)

(assert (=> b!172778 m!271937))

(assert (=> b!172778 m!271839))

(declare-fun m!271939 () Bool)

(assert (=> bm!2851 m!271939))

(declare-fun m!271941 () Bool)

(assert (=> b!172776 m!271941))

(assert (=> b!172776 m!271935))

(declare-fun m!271943 () Bool)

(assert (=> b!172780 m!271943))

(assert (=> b!172688 d!61153))

(declare-fun d!61181 () Bool)

(assert (=> d!61181 (= (inv!12 thiss!1187) (invariant!0 (currentBit!8599 thiss!1187) (currentByte!8604 thiss!1187) (size!4098 (buf!4526 thiss!1187))))))

(declare-fun bs!15223 () Bool)

(assert (= bs!15223 d!61181))

(assert (=> bs!15223 m!271835))

(assert (=> start!38446 d!61181))

(declare-fun d!61183 () Bool)

(assert (=> d!61183 (= (invariant!0 (currentBit!8599 (_2!8065 lt!265976)) (currentByte!8604 (_2!8065 lt!265976)) (size!4098 (buf!4526 (_2!8065 lt!265976)))) (and (bvsge (currentBit!8599 (_2!8065 lt!265976)) #b00000000000000000000000000000000) (bvslt (currentBit!8599 (_2!8065 lt!265976)) #b00000000000000000000000000001000) (bvsge (currentByte!8604 (_2!8065 lt!265976)) #b00000000000000000000000000000000) (or (bvslt (currentByte!8604 (_2!8065 lt!265976)) (size!4098 (buf!4526 (_2!8065 lt!265976)))) (and (= (currentBit!8599 (_2!8065 lt!265976)) #b00000000000000000000000000000000) (= (currentByte!8604 (_2!8065 lt!265976)) (size!4098 (buf!4526 (_2!8065 lt!265976))))))))))

(assert (=> b!172683 d!61183))

(declare-fun d!61185 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!61185 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4098 (buf!4526 thiss!1187))) ((_ sign_extend 32) (currentByte!8604 thiss!1187)) ((_ sign_extend 32) (currentBit!8599 thiss!1187)) ((_ sign_extend 32) nBits!340)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4098 (buf!4526 thiss!1187))) ((_ sign_extend 32) (currentByte!8604 thiss!1187)) ((_ sign_extend 32) (currentBit!8599 thiss!1187))) ((_ sign_extend 32) nBits!340)))))

(declare-fun bs!15224 () Bool)

(assert (= bs!15224 d!61185))

(declare-fun m!271945 () Bool)

(assert (=> bs!15224 m!271945))

(assert (=> b!172687 d!61185))

(declare-fun d!61187 () Bool)

(declare-fun e!120729 () Bool)

(assert (=> d!61187 e!120729))

(declare-fun res!143122 () Bool)

(assert (=> d!61187 (=> (not res!143122) (not e!120729))))

(declare-fun lt!266376 () (_ BitVec 64))

(declare-fun lt!266375 () (_ BitVec 64))

(declare-fun lt!266373 () (_ BitVec 64))

(assert (=> d!61187 (= res!143122 (= lt!266373 (bvsub lt!266376 lt!266375)))))

(assert (=> d!61187 (or (= (bvand lt!266376 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!266375 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!266376 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!266376 lt!266375) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!61187 (= lt!266375 (remainingBits!0 ((_ sign_extend 32) (size!4098 (buf!4526 (_2!8065 lt!265976)))) ((_ sign_extend 32) (currentByte!8604 (_2!8065 lt!265976))) ((_ sign_extend 32) (currentBit!8599 (_2!8065 lt!265976)))))))

(declare-fun lt!266374 () (_ BitVec 64))

(declare-fun lt!266377 () (_ BitVec 64))

(assert (=> d!61187 (= lt!266376 (bvmul lt!266374 lt!266377))))

(assert (=> d!61187 (or (= lt!266374 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!266377 (bvsdiv (bvmul lt!266374 lt!266377) lt!266374)))))

(assert (=> d!61187 (= lt!266377 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!61187 (= lt!266374 ((_ sign_extend 32) (size!4098 (buf!4526 (_2!8065 lt!265976)))))))

(assert (=> d!61187 (= lt!266373 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8604 (_2!8065 lt!265976))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8599 (_2!8065 lt!265976)))))))

(assert (=> d!61187 (invariant!0 (currentBit!8599 (_2!8065 lt!265976)) (currentByte!8604 (_2!8065 lt!265976)) (size!4098 (buf!4526 (_2!8065 lt!265976))))))

(assert (=> d!61187 (= (bitIndex!0 (size!4098 (buf!4526 (_2!8065 lt!265976))) (currentByte!8604 (_2!8065 lt!265976)) (currentBit!8599 (_2!8065 lt!265976))) lt!266373)))

(declare-fun b!172806 () Bool)

(declare-fun res!143121 () Bool)

(assert (=> b!172806 (=> (not res!143121) (not e!120729))))

(assert (=> b!172806 (= res!143121 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!266373))))

(declare-fun b!172807 () Bool)

(declare-fun lt!266378 () (_ BitVec 64))

(assert (=> b!172807 (= e!120729 (bvsle lt!266373 (bvmul lt!266378 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!172807 (or (= lt!266378 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!266378 #b0000000000000000000000000000000000000000000000000000000000001000) lt!266378)))))

(assert (=> b!172807 (= lt!266378 ((_ sign_extend 32) (size!4098 (buf!4526 (_2!8065 lt!265976)))))))

(assert (= (and d!61187 res!143122) b!172806))

(assert (= (and b!172806 res!143121) b!172807))

(declare-fun m!272041 () Bool)

(assert (=> d!61187 m!272041))

(assert (=> d!61187 m!271833))

(assert (=> b!172685 d!61187))

(declare-fun d!61193 () Bool)

(declare-fun e!120730 () Bool)

(assert (=> d!61193 e!120730))

(declare-fun res!143124 () Bool)

(assert (=> d!61193 (=> (not res!143124) (not e!120730))))

(declare-fun lt!266379 () (_ BitVec 64))

(declare-fun lt!266382 () (_ BitVec 64))

(declare-fun lt!266381 () (_ BitVec 64))

(assert (=> d!61193 (= res!143124 (= lt!266379 (bvsub lt!266382 lt!266381)))))

(assert (=> d!61193 (or (= (bvand lt!266382 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!266381 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!266382 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!266382 lt!266381) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!61193 (= lt!266381 (remainingBits!0 ((_ sign_extend 32) (size!4098 (buf!4526 thiss!1187))) ((_ sign_extend 32) (currentByte!8604 thiss!1187)) ((_ sign_extend 32) (currentBit!8599 thiss!1187))))))

(declare-fun lt!266380 () (_ BitVec 64))

(declare-fun lt!266383 () (_ BitVec 64))

(assert (=> d!61193 (= lt!266382 (bvmul lt!266380 lt!266383))))

(assert (=> d!61193 (or (= lt!266380 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!266383 (bvsdiv (bvmul lt!266380 lt!266383) lt!266380)))))

(assert (=> d!61193 (= lt!266383 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!61193 (= lt!266380 ((_ sign_extend 32) (size!4098 (buf!4526 thiss!1187))))))

(assert (=> d!61193 (= lt!266379 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8604 thiss!1187)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8599 thiss!1187))))))

(assert (=> d!61193 (invariant!0 (currentBit!8599 thiss!1187) (currentByte!8604 thiss!1187) (size!4098 (buf!4526 thiss!1187)))))

(assert (=> d!61193 (= (bitIndex!0 (size!4098 (buf!4526 thiss!1187)) (currentByte!8604 thiss!1187) (currentBit!8599 thiss!1187)) lt!266379)))

(declare-fun b!172808 () Bool)

(declare-fun res!143123 () Bool)

(assert (=> b!172808 (=> (not res!143123) (not e!120730))))

(assert (=> b!172808 (= res!143123 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!266379))))

(declare-fun b!172809 () Bool)

(declare-fun lt!266384 () (_ BitVec 64))

(assert (=> b!172809 (= e!120730 (bvsle lt!266379 (bvmul lt!266384 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!172809 (or (= lt!266384 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!266384 #b0000000000000000000000000000000000000000000000000000000000001000) lt!266384)))))

(assert (=> b!172809 (= lt!266384 ((_ sign_extend 32) (size!4098 (buf!4526 thiss!1187))))))

(assert (= (and d!61193 res!143124) b!172808))

(assert (= (and b!172808 res!143123) b!172809))

(assert (=> d!61193 m!271945))

(assert (=> d!61193 m!271835))

(assert (=> b!172685 d!61193))

(declare-fun d!61195 () Bool)

(assert (=> d!61195 (= (array_inv!3839 (buf!4526 thiss!1187)) (bvsge (size!4098 (buf!4526 thiss!1187)) #b00000000000000000000000000000000))))

(assert (=> b!172689 d!61195))

(declare-fun d!61197 () Bool)

(assert (=> d!61197 (= (invariant!0 (currentBit!8599 thiss!1187) (currentByte!8604 thiss!1187) (size!4098 (buf!4526 thiss!1187))) (and (bvsge (currentBit!8599 thiss!1187) #b00000000000000000000000000000000) (bvslt (currentBit!8599 thiss!1187) #b00000000000000000000000000001000) (bvsge (currentByte!8604 thiss!1187) #b00000000000000000000000000000000) (or (bvslt (currentByte!8604 thiss!1187) (size!4098 (buf!4526 thiss!1187))) (and (= (currentBit!8599 thiss!1187) #b00000000000000000000000000000000) (= (currentByte!8604 thiss!1187) (size!4098 (buf!4526 thiss!1187)))))))))

