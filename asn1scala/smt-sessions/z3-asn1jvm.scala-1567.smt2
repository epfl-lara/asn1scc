; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44318 () Bool)

(assert start!44318)

(declare-fun b!211140 () Bool)

(declare-fun res!177309 () Bool)

(declare-fun e!143998 () Bool)

(assert (=> b!211140 (=> res!177309 e!143998)))

(declare-datatypes ((array!10501 0))(
  ( (array!10502 (arr!5543 (Array (_ BitVec 32) (_ BitVec 8))) (size!4613 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8334 0))(
  ( (BitStream!8335 (buf!5136 array!10501) (currentByte!9690 (_ BitVec 32)) (currentBit!9685 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8334)

(declare-datatypes ((Unit!15054 0))(
  ( (Unit!15055) )
))
(declare-datatypes ((tuple2!18082 0))(
  ( (tuple2!18083 (_1!9696 Unit!15054) (_2!9696 BitStream!8334)) )
))
(declare-fun lt!332072 () tuple2!18082)

(declare-fun isPrefixOf!0 (BitStream!8334 BitStream!8334) Bool)

(assert (=> b!211140 (= res!177309 (not (isPrefixOf!0 thiss!1204 (_2!9696 lt!332072))))))

(declare-fun b!211141 () Bool)

(declare-fun res!177308 () Bool)

(assert (=> b!211141 (=> res!177308 e!143998)))

(declare-fun lt!332086 () tuple2!18082)

(assert (=> b!211141 (= res!177308 (not (isPrefixOf!0 (_2!9696 lt!332072) (_2!9696 lt!332086))))))

(declare-fun b!211142 () Bool)

(declare-fun res!177307 () Bool)

(assert (=> b!211142 (=> res!177307 e!143998)))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun lt!332070 () (_ BitVec 64))

(declare-fun lt!332082 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!211142 (= res!177307 (or (not (= (size!4613 (buf!5136 (_2!9696 lt!332086))) (size!4613 (buf!5136 thiss!1204)))) (not (= lt!332070 (bvsub (bvadd lt!332082 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!211143 () Bool)

(declare-fun e!144001 () Bool)

(assert (=> b!211143 (= e!144001 e!143998)))

(declare-fun res!177300 () Bool)

(assert (=> b!211143 (=> res!177300 e!143998)))

(declare-fun lt!332075 () (_ BitVec 64))

(assert (=> b!211143 (= res!177300 (not (= lt!332070 (bvsub (bvsub (bvadd lt!332075 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!211143 (= lt!332070 (bitIndex!0 (size!4613 (buf!5136 (_2!9696 lt!332086))) (currentByte!9690 (_2!9696 lt!332086)) (currentBit!9685 (_2!9696 lt!332086))))))

(assert (=> b!211143 (isPrefixOf!0 thiss!1204 (_2!9696 lt!332086))))

(declare-fun lt!332083 () Unit!15054)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8334 BitStream!8334 BitStream!8334) Unit!15054)

(assert (=> b!211143 (= lt!332083 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9696 lt!332072) (_2!9696 lt!332086)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8334 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!18082)

(assert (=> b!211143 (= lt!332086 (appendBitsLSBFirstLoopTR!0 (_2!9696 lt!332072) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!211144 () Bool)

(declare-fun e!143994 () Bool)

(declare-fun e!143999 () Bool)

(assert (=> b!211144 (= e!143994 e!143999)))

(declare-fun res!177312 () Bool)

(assert (=> b!211144 (=> (not res!177312) (not e!143999))))

(declare-fun lt!332078 () Bool)

(declare-datatypes ((tuple2!18084 0))(
  ( (tuple2!18085 (_1!9697 BitStream!8334) (_2!9697 Bool)) )
))
(declare-fun lt!332084 () tuple2!18084)

(assert (=> b!211144 (= res!177312 (and (= (_2!9697 lt!332084) lt!332078) (= (_1!9697 lt!332084) (_2!9696 lt!332072))))))

(declare-fun readBitPure!0 (BitStream!8334) tuple2!18084)

(declare-fun readerFrom!0 (BitStream!8334 (_ BitVec 32) (_ BitVec 32)) BitStream!8334)

(assert (=> b!211144 (= lt!332084 (readBitPure!0 (readerFrom!0 (_2!9696 lt!332072) (currentBit!9685 thiss!1204) (currentByte!9690 thiss!1204))))))

(declare-fun b!211145 () Bool)

(declare-fun e!143992 () Bool)

(declare-fun lt!332081 () tuple2!18084)

(declare-fun lt!332069 () tuple2!18084)

(assert (=> b!211145 (= e!143992 (= (_2!9697 lt!332081) (_2!9697 lt!332069)))))

(declare-fun b!211146 () Bool)

(declare-fun lt!332068 () (_ BitVec 64))

(assert (=> b!211146 (= e!143999 (= (bitIndex!0 (size!4613 (buf!5136 (_1!9697 lt!332084))) (currentByte!9690 (_1!9697 lt!332084)) (currentBit!9685 (_1!9697 lt!332084))) lt!332068))))

(declare-fun b!211147 () Bool)

(declare-fun e!144002 () Bool)

(assert (=> b!211147 (= e!144002 e!143994)))

(declare-fun res!177313 () Bool)

(assert (=> b!211147 (=> (not res!177313) (not e!143994))))

(declare-fun lt!332067 () (_ BitVec 64))

(assert (=> b!211147 (= res!177313 (= lt!332068 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!332067)))))

(assert (=> b!211147 (= lt!332068 (bitIndex!0 (size!4613 (buf!5136 (_2!9696 lt!332072))) (currentByte!9690 (_2!9696 lt!332072)) (currentBit!9685 (_2!9696 lt!332072))))))

(assert (=> b!211147 (= lt!332067 (bitIndex!0 (size!4613 (buf!5136 thiss!1204)) (currentByte!9690 thiss!1204) (currentBit!9685 thiss!1204)))))

(declare-fun e!143995 () Bool)

(declare-fun b!211149 () Bool)

(declare-datatypes ((tuple2!18086 0))(
  ( (tuple2!18087 (_1!9698 BitStream!8334) (_2!9698 BitStream!8334)) )
))
(declare-fun lt!332092 () tuple2!18086)

(declare-fun withMovedBitIndex!0 (BitStream!8334 (_ BitVec 64)) BitStream!8334)

(assert (=> b!211149 (= e!143995 (= (_1!9698 lt!332092) (withMovedBitIndex!0 (_2!9698 lt!332092) (bvsub lt!332075 lt!332070))))))

(declare-fun e!144003 () Bool)

(assert (=> b!211149 e!144003))

(declare-fun res!177303 () Bool)

(assert (=> b!211149 (=> (not res!177303) (not e!144003))))

(declare-datatypes ((tuple2!18088 0))(
  ( (tuple2!18089 (_1!9699 BitStream!8334) (_2!9699 (_ BitVec 64))) )
))
(declare-fun lt!332090 () tuple2!18088)

(declare-fun lt!332071 () tuple2!18088)

(assert (=> b!211149 (= res!177303 (and (= (_2!9699 lt!332090) (_2!9699 lt!332071)) (= (_1!9699 lt!332090) (_1!9699 lt!332071))))))

(declare-fun lt!332088 () (_ BitVec 64))

(declare-fun lt!332076 () Unit!15054)

(declare-fun lt!332073 () tuple2!18086)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8334 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!15054)

(assert (=> b!211149 (= lt!332076 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9698 lt!332073) nBits!348 i!590 lt!332088))))

(declare-fun lt!332074 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8334 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18088)

(assert (=> b!211149 (= lt!332071 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9698 lt!332073) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!332074))))

(declare-fun b!211150 () Bool)

(declare-fun res!177306 () Bool)

(declare-fun e!143993 () Bool)

(assert (=> b!211150 (=> (not res!177306) (not e!143993))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!211150 (= res!177306 (invariant!0 (currentBit!9685 thiss!1204) (currentByte!9690 thiss!1204) (size!4613 (buf!5136 thiss!1204))))))

(declare-fun b!211151 () Bool)

(declare-fun e!143997 () Bool)

(assert (=> b!211151 (= e!143997 (invariant!0 (currentBit!9685 thiss!1204) (currentByte!9690 thiss!1204) (size!4613 (buf!5136 (_2!9696 lt!332086)))))))

(declare-fun b!211152 () Bool)

(declare-fun e!144000 () Bool)

(assert (=> b!211152 (= e!144000 e!143993)))

(declare-fun res!177304 () Bool)

(assert (=> b!211152 (=> (not res!177304) (not e!143993))))

(declare-fun lt!332085 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!211152 (= res!177304 (validate_offset_bits!1 ((_ sign_extend 32) (size!4613 (buf!5136 thiss!1204))) ((_ sign_extend 32) (currentByte!9690 thiss!1204)) ((_ sign_extend 32) (currentBit!9685 thiss!1204)) lt!332085))))

(assert (=> b!211152 (= lt!332085 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!211153 () Bool)

(declare-fun res!177310 () Bool)

(assert (=> b!211153 (=> (not res!177310) (not e!143994))))

(assert (=> b!211153 (= res!177310 (isPrefixOf!0 thiss!1204 (_2!9696 lt!332072)))))

(declare-fun b!211154 () Bool)

(declare-fun res!177311 () Bool)

(assert (=> b!211154 (=> (not res!177311) (not e!143993))))

(assert (=> b!211154 (= res!177311 (not (= i!590 nBits!348)))))

(declare-fun b!211148 () Bool)

(declare-fun e!143996 () Bool)

(declare-fun array_inv!4354 (array!10501) Bool)

(assert (=> b!211148 (= e!143996 (array_inv!4354 (buf!5136 thiss!1204)))))

(declare-fun res!177297 () Bool)

(assert (=> start!44318 (=> (not res!177297) (not e!144000))))

(assert (=> start!44318 (= res!177297 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!44318 e!144000))

(assert (=> start!44318 true))

(declare-fun inv!12 (BitStream!8334) Bool)

(assert (=> start!44318 (and (inv!12 thiss!1204) e!143996)))

(declare-fun b!211155 () Bool)

(assert (=> b!211155 (= e!143998 e!143995)))

(declare-fun res!177305 () Bool)

(assert (=> b!211155 (=> res!177305 e!143995)))

(assert (=> b!211155 (= res!177305 (not (= (_1!9699 (readNBitsLSBFirstsLoopPure!0 (_1!9698 lt!332092) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!332074)) (_2!9698 lt!332092))))))

(declare-fun lt!332091 () (_ BitVec 64))

(assert (=> b!211155 (validate_offset_bits!1 ((_ sign_extend 32) (size!4613 (buf!5136 (_2!9696 lt!332086)))) ((_ sign_extend 32) (currentByte!9690 (_2!9696 lt!332072))) ((_ sign_extend 32) (currentBit!9685 (_2!9696 lt!332072))) lt!332091)))

(declare-fun lt!332087 () Unit!15054)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8334 array!10501 (_ BitVec 64)) Unit!15054)

(assert (=> b!211155 (= lt!332087 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9696 lt!332072) (buf!5136 (_2!9696 lt!332086)) lt!332091))))

(assert (=> b!211155 (= lt!332091 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!332077 () tuple2!18084)

(declare-fun lt!332079 () (_ BitVec 64))

(assert (=> b!211155 (= lt!332074 (bvor lt!332088 (ite (_2!9697 lt!332077) lt!332079 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!211155 (= lt!332090 (readNBitsLSBFirstsLoopPure!0 (_1!9698 lt!332073) nBits!348 i!590 lt!332088))))

(assert (=> b!211155 (validate_offset_bits!1 ((_ sign_extend 32) (size!4613 (buf!5136 (_2!9696 lt!332086)))) ((_ sign_extend 32) (currentByte!9690 thiss!1204)) ((_ sign_extend 32) (currentBit!9685 thiss!1204)) lt!332085)))

(declare-fun lt!332080 () Unit!15054)

(assert (=> b!211155 (= lt!332080 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5136 (_2!9696 lt!332086)) lt!332085))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!211155 (= lt!332088 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!211155 (= (_2!9697 lt!332077) lt!332078)))

(assert (=> b!211155 (= lt!332077 (readBitPure!0 (_1!9698 lt!332073)))))

(declare-fun reader!0 (BitStream!8334 BitStream!8334) tuple2!18086)

(assert (=> b!211155 (= lt!332092 (reader!0 (_2!9696 lt!332072) (_2!9696 lt!332086)))))

(assert (=> b!211155 (= lt!332073 (reader!0 thiss!1204 (_2!9696 lt!332086)))))

(assert (=> b!211155 e!143992))

(declare-fun res!177302 () Bool)

(assert (=> b!211155 (=> (not res!177302) (not e!143992))))

(assert (=> b!211155 (= res!177302 (= (bitIndex!0 (size!4613 (buf!5136 (_1!9697 lt!332081))) (currentByte!9690 (_1!9697 lt!332081)) (currentBit!9685 (_1!9697 lt!332081))) (bitIndex!0 (size!4613 (buf!5136 (_1!9697 lt!332069))) (currentByte!9690 (_1!9697 lt!332069)) (currentBit!9685 (_1!9697 lt!332069)))))))

(declare-fun lt!332089 () Unit!15054)

(declare-fun lt!332093 () BitStream!8334)

(declare-fun readBitPrefixLemma!0 (BitStream!8334 BitStream!8334) Unit!15054)

(assert (=> b!211155 (= lt!332089 (readBitPrefixLemma!0 lt!332093 (_2!9696 lt!332086)))))

(assert (=> b!211155 (= lt!332069 (readBitPure!0 (BitStream!8335 (buf!5136 (_2!9696 lt!332086)) (currentByte!9690 thiss!1204) (currentBit!9685 thiss!1204))))))

(assert (=> b!211155 (= lt!332081 (readBitPure!0 lt!332093))))

(assert (=> b!211155 e!143997))

(declare-fun res!177314 () Bool)

(assert (=> b!211155 (=> (not res!177314) (not e!143997))))

(assert (=> b!211155 (= res!177314 (invariant!0 (currentBit!9685 thiss!1204) (currentByte!9690 thiss!1204) (size!4613 (buf!5136 (_2!9696 lt!332072)))))))

(assert (=> b!211155 (= lt!332093 (BitStream!8335 (buf!5136 (_2!9696 lt!332072)) (currentByte!9690 thiss!1204) (currentBit!9685 thiss!1204)))))

(declare-fun b!211156 () Bool)

(assert (=> b!211156 (= e!144003 (= (_1!9698 lt!332073) (withMovedBitIndex!0 (_2!9698 lt!332073) (bvsub lt!332082 lt!332070))))))

(declare-fun b!211157 () Bool)

(declare-fun res!177301 () Bool)

(assert (=> b!211157 (=> res!177301 e!143998)))

(assert (=> b!211157 (= res!177301 (not (invariant!0 (currentBit!9685 (_2!9696 lt!332086)) (currentByte!9690 (_2!9696 lt!332086)) (size!4613 (buf!5136 (_2!9696 lt!332086))))))))

(declare-fun b!211158 () Bool)

(assert (=> b!211158 (= e!143993 (not e!144001))))

(declare-fun res!177298 () Bool)

(assert (=> b!211158 (=> res!177298 e!144001)))

(assert (=> b!211158 (= res!177298 (not (= lt!332075 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!332082))))))

(assert (=> b!211158 (= lt!332075 (bitIndex!0 (size!4613 (buf!5136 (_2!9696 lt!332072))) (currentByte!9690 (_2!9696 lt!332072)) (currentBit!9685 (_2!9696 lt!332072))))))

(assert (=> b!211158 (= lt!332082 (bitIndex!0 (size!4613 (buf!5136 thiss!1204)) (currentByte!9690 thiss!1204) (currentBit!9685 thiss!1204)))))

(assert (=> b!211158 e!144002))

(declare-fun res!177299 () Bool)

(assert (=> b!211158 (=> (not res!177299) (not e!144002))))

(assert (=> b!211158 (= res!177299 (= (size!4613 (buf!5136 thiss!1204)) (size!4613 (buf!5136 (_2!9696 lt!332072)))))))

(declare-fun appendBit!0 (BitStream!8334 Bool) tuple2!18082)

(assert (=> b!211158 (= lt!332072 (appendBit!0 thiss!1204 lt!332078))))

(assert (=> b!211158 (= lt!332078 (not (= (bvand v!189 lt!332079) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!211158 (= lt!332079 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(assert (= (and start!44318 res!177297) b!211152))

(assert (= (and b!211152 res!177304) b!211150))

(assert (= (and b!211150 res!177306) b!211154))

(assert (= (and b!211154 res!177311) b!211158))

(assert (= (and b!211158 res!177299) b!211147))

(assert (= (and b!211147 res!177313) b!211153))

(assert (= (and b!211153 res!177310) b!211144))

(assert (= (and b!211144 res!177312) b!211146))

(assert (= (and b!211158 (not res!177298)) b!211143))

(assert (= (and b!211143 (not res!177300)) b!211157))

(assert (= (and b!211157 (not res!177301)) b!211142))

(assert (= (and b!211142 (not res!177307)) b!211141))

(assert (= (and b!211141 (not res!177308)) b!211140))

(assert (= (and b!211140 (not res!177309)) b!211155))

(assert (= (and b!211155 res!177314) b!211151))

(assert (= (and b!211155 res!177302) b!211145))

(assert (= (and b!211155 (not res!177305)) b!211149))

(assert (= (and b!211149 res!177303) b!211156))

(assert (= start!44318 b!211148))

(declare-fun m!325269 () Bool)

(assert (=> start!44318 m!325269))

(declare-fun m!325271 () Bool)

(assert (=> b!211153 m!325271))

(declare-fun m!325273 () Bool)

(assert (=> b!211149 m!325273))

(declare-fun m!325275 () Bool)

(assert (=> b!211149 m!325275))

(declare-fun m!325277 () Bool)

(assert (=> b!211149 m!325277))

(assert (=> b!211149 m!325277))

(declare-fun m!325279 () Bool)

(assert (=> b!211149 m!325279))

(declare-fun m!325281 () Bool)

(assert (=> b!211143 m!325281))

(declare-fun m!325283 () Bool)

(assert (=> b!211143 m!325283))

(declare-fun m!325285 () Bool)

(assert (=> b!211143 m!325285))

(declare-fun m!325287 () Bool)

(assert (=> b!211143 m!325287))

(declare-fun m!325289 () Bool)

(assert (=> b!211155 m!325289))

(declare-fun m!325291 () Bool)

(assert (=> b!211155 m!325291))

(declare-fun m!325293 () Bool)

(assert (=> b!211155 m!325293))

(declare-fun m!325295 () Bool)

(assert (=> b!211155 m!325295))

(declare-fun m!325297 () Bool)

(assert (=> b!211155 m!325297))

(declare-fun m!325299 () Bool)

(assert (=> b!211155 m!325299))

(declare-fun m!325301 () Bool)

(assert (=> b!211155 m!325301))

(declare-fun m!325303 () Bool)

(assert (=> b!211155 m!325303))

(declare-fun m!325305 () Bool)

(assert (=> b!211155 m!325305))

(declare-fun m!325307 () Bool)

(assert (=> b!211155 m!325307))

(declare-fun m!325309 () Bool)

(assert (=> b!211155 m!325309))

(declare-fun m!325311 () Bool)

(assert (=> b!211155 m!325311))

(declare-fun m!325313 () Bool)

(assert (=> b!211155 m!325313))

(declare-fun m!325315 () Bool)

(assert (=> b!211155 m!325315))

(declare-fun m!325317 () Bool)

(assert (=> b!211155 m!325317))

(declare-fun m!325319 () Bool)

(assert (=> b!211155 m!325319))

(declare-fun m!325321 () Bool)

(assert (=> b!211151 m!325321))

(declare-fun m!325323 () Bool)

(assert (=> b!211141 m!325323))

(declare-fun m!325325 () Bool)

(assert (=> b!211152 m!325325))

(declare-fun m!325327 () Bool)

(assert (=> b!211158 m!325327))

(declare-fun m!325329 () Bool)

(assert (=> b!211158 m!325329))

(declare-fun m!325331 () Bool)

(assert (=> b!211158 m!325331))

(assert (=> b!211140 m!325271))

(declare-fun m!325333 () Bool)

(assert (=> b!211156 m!325333))

(declare-fun m!325335 () Bool)

(assert (=> b!211150 m!325335))

(declare-fun m!325337 () Bool)

(assert (=> b!211157 m!325337))

(declare-fun m!325339 () Bool)

(assert (=> b!211144 m!325339))

(assert (=> b!211144 m!325339))

(declare-fun m!325341 () Bool)

(assert (=> b!211144 m!325341))

(assert (=> b!211147 m!325327))

(assert (=> b!211147 m!325329))

(declare-fun m!325343 () Bool)

(assert (=> b!211146 m!325343))

(declare-fun m!325345 () Bool)

(assert (=> b!211148 m!325345))

(check-sat (not start!44318) (not b!211140) (not b!211157) (not b!211146) (not b!211150) (not b!211151) (not b!211141) (not b!211147) (not b!211152) (not b!211143) (not b!211153) (not b!211149) (not b!211148) (not b!211158) (not b!211156) (not b!211155) (not b!211144))
(check-sat)
(get-model)

(declare-fun d!71595 () Bool)

(declare-fun e!144108 () Bool)

(assert (=> d!71595 e!144108))

(declare-fun res!177469 () Bool)

(assert (=> d!71595 (=> (not res!177469) (not e!144108))))

(declare-fun lt!332446 () (_ BitVec 64))

(declare-fun lt!332445 () BitStream!8334)

(assert (=> d!71595 (= res!177469 (= (bvadd lt!332446 (bvsub lt!332082 lt!332070)) (bitIndex!0 (size!4613 (buf!5136 lt!332445)) (currentByte!9690 lt!332445) (currentBit!9685 lt!332445))))))

(assert (=> d!71595 (or (not (= (bvand lt!332446 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!332082 lt!332070) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!332446 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!332446 (bvsub lt!332082 lt!332070)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71595 (= lt!332446 (bitIndex!0 (size!4613 (buf!5136 (_2!9698 lt!332073))) (currentByte!9690 (_2!9698 lt!332073)) (currentBit!9685 (_2!9698 lt!332073))))))

(declare-fun moveBitIndex!0 (BitStream!8334 (_ BitVec 64)) tuple2!18082)

(assert (=> d!71595 (= lt!332445 (_2!9696 (moveBitIndex!0 (_2!9698 lt!332073) (bvsub lt!332082 lt!332070))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!8334 (_ BitVec 64)) Bool)

(assert (=> d!71595 (moveBitIndexPrecond!0 (_2!9698 lt!332073) (bvsub lt!332082 lt!332070))))

(assert (=> d!71595 (= (withMovedBitIndex!0 (_2!9698 lt!332073) (bvsub lt!332082 lt!332070)) lt!332445)))

(declare-fun b!211324 () Bool)

(assert (=> b!211324 (= e!144108 (= (size!4613 (buf!5136 (_2!9698 lt!332073))) (size!4613 (buf!5136 lt!332445))))))

(assert (= (and d!71595 res!177469) b!211324))

(declare-fun m!325625 () Bool)

(assert (=> d!71595 m!325625))

(declare-fun m!325627 () Bool)

(assert (=> d!71595 m!325627))

(declare-fun m!325629 () Bool)

(assert (=> d!71595 m!325629))

(declare-fun m!325631 () Bool)

(assert (=> d!71595 m!325631))

(assert (=> b!211156 d!71595))

(declare-fun d!71597 () Bool)

(declare-fun e!144111 () Bool)

(assert (=> d!71597 e!144111))

(declare-fun res!177475 () Bool)

(assert (=> d!71597 (=> (not res!177475) (not e!144111))))

(declare-fun lt!332463 () (_ BitVec 64))

(declare-fun lt!332460 () (_ BitVec 64))

(declare-fun lt!332459 () (_ BitVec 64))

(assert (=> d!71597 (= res!177475 (= lt!332459 (bvsub lt!332463 lt!332460)))))

(assert (=> d!71597 (or (= (bvand lt!332463 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!332460 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!332463 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!332463 lt!332460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!71597 (= lt!332460 (remainingBits!0 ((_ sign_extend 32) (size!4613 (buf!5136 (_1!9697 lt!332084)))) ((_ sign_extend 32) (currentByte!9690 (_1!9697 lt!332084))) ((_ sign_extend 32) (currentBit!9685 (_1!9697 lt!332084)))))))

(declare-fun lt!332464 () (_ BitVec 64))

(declare-fun lt!332462 () (_ BitVec 64))

(assert (=> d!71597 (= lt!332463 (bvmul lt!332464 lt!332462))))

(assert (=> d!71597 (or (= lt!332464 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!332462 (bvsdiv (bvmul lt!332464 lt!332462) lt!332464)))))

(assert (=> d!71597 (= lt!332462 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!71597 (= lt!332464 ((_ sign_extend 32) (size!4613 (buf!5136 (_1!9697 lt!332084)))))))

(assert (=> d!71597 (= lt!332459 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9690 (_1!9697 lt!332084))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9685 (_1!9697 lt!332084)))))))

(assert (=> d!71597 (invariant!0 (currentBit!9685 (_1!9697 lt!332084)) (currentByte!9690 (_1!9697 lt!332084)) (size!4613 (buf!5136 (_1!9697 lt!332084))))))

(assert (=> d!71597 (= (bitIndex!0 (size!4613 (buf!5136 (_1!9697 lt!332084))) (currentByte!9690 (_1!9697 lt!332084)) (currentBit!9685 (_1!9697 lt!332084))) lt!332459)))

(declare-fun b!211329 () Bool)

(declare-fun res!177474 () Bool)

(assert (=> b!211329 (=> (not res!177474) (not e!144111))))

(assert (=> b!211329 (= res!177474 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!332459))))

(declare-fun b!211330 () Bool)

(declare-fun lt!332461 () (_ BitVec 64))

(assert (=> b!211330 (= e!144111 (bvsle lt!332459 (bvmul lt!332461 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!211330 (or (= lt!332461 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!332461 #b0000000000000000000000000000000000000000000000000000000000001000) lt!332461)))))

(assert (=> b!211330 (= lt!332461 ((_ sign_extend 32) (size!4613 (buf!5136 (_1!9697 lt!332084)))))))

(assert (= (and d!71597 res!177475) b!211329))

(assert (= (and b!211329 res!177474) b!211330))

(declare-fun m!325633 () Bool)

(assert (=> d!71597 m!325633))

(declare-fun m!325635 () Bool)

(assert (=> d!71597 m!325635))

(assert (=> b!211146 d!71597))

(declare-fun d!71599 () Bool)

(declare-datatypes ((tuple2!18106 0))(
  ( (tuple2!18107 (_1!9708 Bool) (_2!9708 BitStream!8334)) )
))
(declare-fun lt!332467 () tuple2!18106)

(declare-fun readBit!0 (BitStream!8334) tuple2!18106)

(assert (=> d!71599 (= lt!332467 (readBit!0 (readerFrom!0 (_2!9696 lt!332072) (currentBit!9685 thiss!1204) (currentByte!9690 thiss!1204))))))

(assert (=> d!71599 (= (readBitPure!0 (readerFrom!0 (_2!9696 lt!332072) (currentBit!9685 thiss!1204) (currentByte!9690 thiss!1204))) (tuple2!18085 (_2!9708 lt!332467) (_1!9708 lt!332467)))))

(declare-fun bs!17571 () Bool)

(assert (= bs!17571 d!71599))

(assert (=> bs!17571 m!325339))

(declare-fun m!325637 () Bool)

(assert (=> bs!17571 m!325637))

(assert (=> b!211144 d!71599))

(declare-fun d!71601 () Bool)

(declare-fun e!144114 () Bool)

(assert (=> d!71601 e!144114))

(declare-fun res!177479 () Bool)

(assert (=> d!71601 (=> (not res!177479) (not e!144114))))

(assert (=> d!71601 (= res!177479 (invariant!0 (currentBit!9685 (_2!9696 lt!332072)) (currentByte!9690 (_2!9696 lt!332072)) (size!4613 (buf!5136 (_2!9696 lt!332072)))))))

(assert (=> d!71601 (= (readerFrom!0 (_2!9696 lt!332072) (currentBit!9685 thiss!1204) (currentByte!9690 thiss!1204)) (BitStream!8335 (buf!5136 (_2!9696 lt!332072)) (currentByte!9690 thiss!1204) (currentBit!9685 thiss!1204)))))

(declare-fun b!211333 () Bool)

(assert (=> b!211333 (= e!144114 (invariant!0 (currentBit!9685 thiss!1204) (currentByte!9690 thiss!1204) (size!4613 (buf!5136 (_2!9696 lt!332072)))))))

(assert (= (and d!71601 res!177479) b!211333))

(declare-fun m!325639 () Bool)

(assert (=> d!71601 m!325639))

(assert (=> b!211333 m!325293))

(assert (=> b!211144 d!71601))

(declare-fun d!71603 () Bool)

(declare-fun e!144115 () Bool)

(assert (=> d!71603 e!144115))

(declare-fun res!177481 () Bool)

(assert (=> d!71603 (=> (not res!177481) (not e!144115))))

(declare-fun lt!332468 () (_ BitVec 64))

(declare-fun lt!332469 () (_ BitVec 64))

(declare-fun lt!332472 () (_ BitVec 64))

(assert (=> d!71603 (= res!177481 (= lt!332468 (bvsub lt!332472 lt!332469)))))

(assert (=> d!71603 (or (= (bvand lt!332472 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!332469 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!332472 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!332472 lt!332469) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71603 (= lt!332469 (remainingBits!0 ((_ sign_extend 32) (size!4613 (buf!5136 (_1!9697 lt!332081)))) ((_ sign_extend 32) (currentByte!9690 (_1!9697 lt!332081))) ((_ sign_extend 32) (currentBit!9685 (_1!9697 lt!332081)))))))

(declare-fun lt!332473 () (_ BitVec 64))

(declare-fun lt!332471 () (_ BitVec 64))

(assert (=> d!71603 (= lt!332472 (bvmul lt!332473 lt!332471))))

(assert (=> d!71603 (or (= lt!332473 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!332471 (bvsdiv (bvmul lt!332473 lt!332471) lt!332473)))))

(assert (=> d!71603 (= lt!332471 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!71603 (= lt!332473 ((_ sign_extend 32) (size!4613 (buf!5136 (_1!9697 lt!332081)))))))

(assert (=> d!71603 (= lt!332468 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9690 (_1!9697 lt!332081))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9685 (_1!9697 lt!332081)))))))

(assert (=> d!71603 (invariant!0 (currentBit!9685 (_1!9697 lt!332081)) (currentByte!9690 (_1!9697 lt!332081)) (size!4613 (buf!5136 (_1!9697 lt!332081))))))

(assert (=> d!71603 (= (bitIndex!0 (size!4613 (buf!5136 (_1!9697 lt!332081))) (currentByte!9690 (_1!9697 lt!332081)) (currentBit!9685 (_1!9697 lt!332081))) lt!332468)))

(declare-fun b!211334 () Bool)

(declare-fun res!177480 () Bool)

(assert (=> b!211334 (=> (not res!177480) (not e!144115))))

(assert (=> b!211334 (= res!177480 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!332468))))

(declare-fun b!211335 () Bool)

(declare-fun lt!332470 () (_ BitVec 64))

(assert (=> b!211335 (= e!144115 (bvsle lt!332468 (bvmul lt!332470 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!211335 (or (= lt!332470 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!332470 #b0000000000000000000000000000000000000000000000000000000000001000) lt!332470)))))

(assert (=> b!211335 (= lt!332470 ((_ sign_extend 32) (size!4613 (buf!5136 (_1!9697 lt!332081)))))))

(assert (= (and d!71603 res!177481) b!211334))

(assert (= (and b!211334 res!177480) b!211335))

(declare-fun m!325641 () Bool)

(assert (=> d!71603 m!325641))

(declare-fun m!325643 () Bool)

(assert (=> d!71603 m!325643))

(assert (=> b!211155 d!71603))

(declare-fun d!71605 () Bool)

(declare-fun lt!332474 () tuple2!18106)

(assert (=> d!71605 (= lt!332474 (readBit!0 (_1!9698 lt!332073)))))

(assert (=> d!71605 (= (readBitPure!0 (_1!9698 lt!332073)) (tuple2!18085 (_2!9708 lt!332474) (_1!9708 lt!332474)))))

(declare-fun bs!17572 () Bool)

(assert (= bs!17572 d!71605))

(declare-fun m!325645 () Bool)

(assert (=> bs!17572 m!325645))

(assert (=> b!211155 d!71605))

(declare-fun d!71607 () Bool)

(assert (=> d!71607 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!211155 d!71607))

(declare-fun d!71609 () Bool)

(declare-fun e!144116 () Bool)

(assert (=> d!71609 e!144116))

(declare-fun res!177483 () Bool)

(assert (=> d!71609 (=> (not res!177483) (not e!144116))))

(declare-fun lt!332476 () (_ BitVec 64))

(declare-fun lt!332479 () (_ BitVec 64))

(declare-fun lt!332475 () (_ BitVec 64))

(assert (=> d!71609 (= res!177483 (= lt!332475 (bvsub lt!332479 lt!332476)))))

(assert (=> d!71609 (or (= (bvand lt!332479 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!332476 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!332479 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!332479 lt!332476) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71609 (= lt!332476 (remainingBits!0 ((_ sign_extend 32) (size!4613 (buf!5136 (_1!9697 lt!332069)))) ((_ sign_extend 32) (currentByte!9690 (_1!9697 lt!332069))) ((_ sign_extend 32) (currentBit!9685 (_1!9697 lt!332069)))))))

(declare-fun lt!332480 () (_ BitVec 64))

(declare-fun lt!332478 () (_ BitVec 64))

(assert (=> d!71609 (= lt!332479 (bvmul lt!332480 lt!332478))))

(assert (=> d!71609 (or (= lt!332480 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!332478 (bvsdiv (bvmul lt!332480 lt!332478) lt!332480)))))

(assert (=> d!71609 (= lt!332478 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!71609 (= lt!332480 ((_ sign_extend 32) (size!4613 (buf!5136 (_1!9697 lt!332069)))))))

(assert (=> d!71609 (= lt!332475 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9690 (_1!9697 lt!332069))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9685 (_1!9697 lt!332069)))))))

(assert (=> d!71609 (invariant!0 (currentBit!9685 (_1!9697 lt!332069)) (currentByte!9690 (_1!9697 lt!332069)) (size!4613 (buf!5136 (_1!9697 lt!332069))))))

(assert (=> d!71609 (= (bitIndex!0 (size!4613 (buf!5136 (_1!9697 lt!332069))) (currentByte!9690 (_1!9697 lt!332069)) (currentBit!9685 (_1!9697 lt!332069))) lt!332475)))

(declare-fun b!211336 () Bool)

(declare-fun res!177482 () Bool)

(assert (=> b!211336 (=> (not res!177482) (not e!144116))))

(assert (=> b!211336 (= res!177482 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!332475))))

(declare-fun b!211337 () Bool)

(declare-fun lt!332477 () (_ BitVec 64))

(assert (=> b!211337 (= e!144116 (bvsle lt!332475 (bvmul lt!332477 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!211337 (or (= lt!332477 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!332477 #b0000000000000000000000000000000000000000000000000000000000001000) lt!332477)))))

(assert (=> b!211337 (= lt!332477 ((_ sign_extend 32) (size!4613 (buf!5136 (_1!9697 lt!332069)))))))

(assert (= (and d!71609 res!177483) b!211336))

(assert (= (and b!211336 res!177482) b!211337))

(declare-fun m!325647 () Bool)

(assert (=> d!71609 m!325647))

(declare-fun m!325649 () Bool)

(assert (=> d!71609 m!325649))

(assert (=> b!211155 d!71609))

(declare-fun d!71611 () Bool)

(assert (=> d!71611 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4613 (buf!5136 (_2!9696 lt!332086)))) ((_ sign_extend 32) (currentByte!9690 thiss!1204)) ((_ sign_extend 32) (currentBit!9685 thiss!1204)) lt!332085) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4613 (buf!5136 (_2!9696 lt!332086)))) ((_ sign_extend 32) (currentByte!9690 thiss!1204)) ((_ sign_extend 32) (currentBit!9685 thiss!1204))) lt!332085))))

(declare-fun bs!17573 () Bool)

(assert (= bs!17573 d!71611))

(declare-fun m!325651 () Bool)

(assert (=> bs!17573 m!325651))

(assert (=> b!211155 d!71611))

(declare-fun b!211348 () Bool)

(declare-fun e!144122 () Unit!15054)

(declare-fun Unit!15084 () Unit!15054)

(assert (=> b!211348 (= e!144122 Unit!15084)))

(declare-fun d!71613 () Bool)

(declare-fun e!144121 () Bool)

(assert (=> d!71613 e!144121))

(declare-fun res!177492 () Bool)

(assert (=> d!71613 (=> (not res!177492) (not e!144121))))

(declare-fun lt!332524 () tuple2!18086)

(assert (=> d!71613 (= res!177492 (isPrefixOf!0 (_1!9698 lt!332524) (_2!9698 lt!332524)))))

(declare-fun lt!332536 () BitStream!8334)

(assert (=> d!71613 (= lt!332524 (tuple2!18087 lt!332536 (_2!9696 lt!332086)))))

(declare-fun lt!332531 () Unit!15054)

(declare-fun lt!332526 () Unit!15054)

(assert (=> d!71613 (= lt!332531 lt!332526)))

(assert (=> d!71613 (isPrefixOf!0 lt!332536 (_2!9696 lt!332086))))

(assert (=> d!71613 (= lt!332526 (lemmaIsPrefixTransitive!0 lt!332536 (_2!9696 lt!332086) (_2!9696 lt!332086)))))

(declare-fun lt!332525 () Unit!15054)

(declare-fun lt!332521 () Unit!15054)

(assert (=> d!71613 (= lt!332525 lt!332521)))

(assert (=> d!71613 (isPrefixOf!0 lt!332536 (_2!9696 lt!332086))))

(assert (=> d!71613 (= lt!332521 (lemmaIsPrefixTransitive!0 lt!332536 (_2!9696 lt!332072) (_2!9696 lt!332086)))))

(declare-fun lt!332533 () Unit!15054)

(assert (=> d!71613 (= lt!332533 e!144122)))

(declare-fun c!10395 () Bool)

(assert (=> d!71613 (= c!10395 (not (= (size!4613 (buf!5136 (_2!9696 lt!332072))) #b00000000000000000000000000000000)))))

(declare-fun lt!332528 () Unit!15054)

(declare-fun lt!332530 () Unit!15054)

(assert (=> d!71613 (= lt!332528 lt!332530)))

(assert (=> d!71613 (isPrefixOf!0 (_2!9696 lt!332086) (_2!9696 lt!332086))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8334) Unit!15054)

(assert (=> d!71613 (= lt!332530 (lemmaIsPrefixRefl!0 (_2!9696 lt!332086)))))

(declare-fun lt!332523 () Unit!15054)

(declare-fun lt!332522 () Unit!15054)

(assert (=> d!71613 (= lt!332523 lt!332522)))

(assert (=> d!71613 (= lt!332522 (lemmaIsPrefixRefl!0 (_2!9696 lt!332086)))))

(declare-fun lt!332534 () Unit!15054)

(declare-fun lt!332540 () Unit!15054)

(assert (=> d!71613 (= lt!332534 lt!332540)))

(assert (=> d!71613 (isPrefixOf!0 lt!332536 lt!332536)))

(assert (=> d!71613 (= lt!332540 (lemmaIsPrefixRefl!0 lt!332536))))

(declare-fun lt!332538 () Unit!15054)

(declare-fun lt!332532 () Unit!15054)

(assert (=> d!71613 (= lt!332538 lt!332532)))

(assert (=> d!71613 (isPrefixOf!0 (_2!9696 lt!332072) (_2!9696 lt!332072))))

(assert (=> d!71613 (= lt!332532 (lemmaIsPrefixRefl!0 (_2!9696 lt!332072)))))

(assert (=> d!71613 (= lt!332536 (BitStream!8335 (buf!5136 (_2!9696 lt!332086)) (currentByte!9690 (_2!9696 lt!332072)) (currentBit!9685 (_2!9696 lt!332072))))))

(assert (=> d!71613 (isPrefixOf!0 (_2!9696 lt!332072) (_2!9696 lt!332086))))

(assert (=> d!71613 (= (reader!0 (_2!9696 lt!332072) (_2!9696 lt!332086)) lt!332524)))

(declare-fun lt!332529 () (_ BitVec 64))

(declare-fun b!211349 () Bool)

(declare-fun lt!332527 () (_ BitVec 64))

(assert (=> b!211349 (= e!144121 (= (_1!9698 lt!332524) (withMovedBitIndex!0 (_2!9698 lt!332524) (bvsub lt!332527 lt!332529))))))

(assert (=> b!211349 (or (= (bvand lt!332527 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!332529 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!332527 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!332527 lt!332529) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!211349 (= lt!332529 (bitIndex!0 (size!4613 (buf!5136 (_2!9696 lt!332086))) (currentByte!9690 (_2!9696 lt!332086)) (currentBit!9685 (_2!9696 lt!332086))))))

(assert (=> b!211349 (= lt!332527 (bitIndex!0 (size!4613 (buf!5136 (_2!9696 lt!332072))) (currentByte!9690 (_2!9696 lt!332072)) (currentBit!9685 (_2!9696 lt!332072))))))

(declare-fun b!211350 () Bool)

(declare-fun res!177490 () Bool)

(assert (=> b!211350 (=> (not res!177490) (not e!144121))))

(assert (=> b!211350 (= res!177490 (isPrefixOf!0 (_1!9698 lt!332524) (_2!9696 lt!332072)))))

(declare-fun b!211351 () Bool)

(declare-fun res!177491 () Bool)

(assert (=> b!211351 (=> (not res!177491) (not e!144121))))

(assert (=> b!211351 (= res!177491 (isPrefixOf!0 (_2!9698 lt!332524) (_2!9696 lt!332086)))))

(declare-fun b!211352 () Bool)

(declare-fun lt!332535 () Unit!15054)

(assert (=> b!211352 (= e!144122 lt!332535)))

(declare-fun lt!332539 () (_ BitVec 64))

(assert (=> b!211352 (= lt!332539 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!332537 () (_ BitVec 64))

(assert (=> b!211352 (= lt!332537 (bitIndex!0 (size!4613 (buf!5136 (_2!9696 lt!332072))) (currentByte!9690 (_2!9696 lt!332072)) (currentBit!9685 (_2!9696 lt!332072))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!10501 array!10501 (_ BitVec 64) (_ BitVec 64)) Unit!15054)

(assert (=> b!211352 (= lt!332535 (arrayBitRangesEqSymmetric!0 (buf!5136 (_2!9696 lt!332072)) (buf!5136 (_2!9696 lt!332086)) lt!332539 lt!332537))))

(declare-fun arrayBitRangesEq!0 (array!10501 array!10501 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!211352 (arrayBitRangesEq!0 (buf!5136 (_2!9696 lt!332086)) (buf!5136 (_2!9696 lt!332072)) lt!332539 lt!332537)))

(assert (= (and d!71613 c!10395) b!211352))

(assert (= (and d!71613 (not c!10395)) b!211348))

(assert (= (and d!71613 res!177492) b!211350))

(assert (= (and b!211350 res!177490) b!211351))

(assert (= (and b!211351 res!177491) b!211349))

(declare-fun m!325653 () Bool)

(assert (=> b!211351 m!325653))

(assert (=> b!211352 m!325327))

(declare-fun m!325655 () Bool)

(assert (=> b!211352 m!325655))

(declare-fun m!325657 () Bool)

(assert (=> b!211352 m!325657))

(declare-fun m!325659 () Bool)

(assert (=> b!211349 m!325659))

(assert (=> b!211349 m!325281))

(assert (=> b!211349 m!325327))

(declare-fun m!325661 () Bool)

(assert (=> b!211350 m!325661))

(declare-fun m!325663 () Bool)

(assert (=> d!71613 m!325663))

(declare-fun m!325665 () Bool)

(assert (=> d!71613 m!325665))

(declare-fun m!325667 () Bool)

(assert (=> d!71613 m!325667))

(declare-fun m!325669 () Bool)

(assert (=> d!71613 m!325669))

(declare-fun m!325671 () Bool)

(assert (=> d!71613 m!325671))

(declare-fun m!325673 () Bool)

(assert (=> d!71613 m!325673))

(assert (=> d!71613 m!325323))

(declare-fun m!325675 () Bool)

(assert (=> d!71613 m!325675))

(declare-fun m!325677 () Bool)

(assert (=> d!71613 m!325677))

(declare-fun m!325679 () Bool)

(assert (=> d!71613 m!325679))

(declare-fun m!325681 () Bool)

(assert (=> d!71613 m!325681))

(assert (=> b!211155 d!71613))

(declare-fun d!71615 () Bool)

(declare-fun lt!332541 () tuple2!18106)

(assert (=> d!71615 (= lt!332541 (readBit!0 lt!332093))))

(assert (=> d!71615 (= (readBitPure!0 lt!332093) (tuple2!18085 (_2!9708 lt!332541) (_1!9708 lt!332541)))))

(declare-fun bs!17574 () Bool)

(assert (= bs!17574 d!71615))

(declare-fun m!325683 () Bool)

(assert (=> bs!17574 m!325683))

(assert (=> b!211155 d!71615))

(declare-datatypes ((tuple2!18108 0))(
  ( (tuple2!18109 (_1!9709 (_ BitVec 64)) (_2!9709 BitStream!8334)) )
))
(declare-fun lt!332544 () tuple2!18108)

(declare-fun d!71617 () Bool)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!8334 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18108)

(assert (=> d!71617 (= lt!332544 (readNBitsLSBFirstsLoop!0 (_1!9698 lt!332092) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!332074))))

(assert (=> d!71617 (= (readNBitsLSBFirstsLoopPure!0 (_1!9698 lt!332092) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!332074) (tuple2!18089 (_2!9709 lt!332544) (_1!9709 lt!332544)))))

(declare-fun bs!17575 () Bool)

(assert (= bs!17575 d!71617))

(declare-fun m!325685 () Bool)

(assert (=> bs!17575 m!325685))

(assert (=> b!211155 d!71617))

(declare-fun b!211353 () Bool)

(declare-fun e!144124 () Unit!15054)

(declare-fun Unit!15085 () Unit!15054)

(assert (=> b!211353 (= e!144124 Unit!15085)))

(declare-fun d!71619 () Bool)

(declare-fun e!144123 () Bool)

(assert (=> d!71619 e!144123))

(declare-fun res!177495 () Bool)

(assert (=> d!71619 (=> (not res!177495) (not e!144123))))

(declare-fun lt!332548 () tuple2!18086)

(assert (=> d!71619 (= res!177495 (isPrefixOf!0 (_1!9698 lt!332548) (_2!9698 lt!332548)))))

(declare-fun lt!332560 () BitStream!8334)

(assert (=> d!71619 (= lt!332548 (tuple2!18087 lt!332560 (_2!9696 lt!332086)))))

(declare-fun lt!332555 () Unit!15054)

(declare-fun lt!332550 () Unit!15054)

(assert (=> d!71619 (= lt!332555 lt!332550)))

(assert (=> d!71619 (isPrefixOf!0 lt!332560 (_2!9696 lt!332086))))

(assert (=> d!71619 (= lt!332550 (lemmaIsPrefixTransitive!0 lt!332560 (_2!9696 lt!332086) (_2!9696 lt!332086)))))

(declare-fun lt!332549 () Unit!15054)

(declare-fun lt!332545 () Unit!15054)

(assert (=> d!71619 (= lt!332549 lt!332545)))

(assert (=> d!71619 (isPrefixOf!0 lt!332560 (_2!9696 lt!332086))))

(assert (=> d!71619 (= lt!332545 (lemmaIsPrefixTransitive!0 lt!332560 thiss!1204 (_2!9696 lt!332086)))))

(declare-fun lt!332557 () Unit!15054)

(assert (=> d!71619 (= lt!332557 e!144124)))

(declare-fun c!10396 () Bool)

(assert (=> d!71619 (= c!10396 (not (= (size!4613 (buf!5136 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!332552 () Unit!15054)

(declare-fun lt!332554 () Unit!15054)

(assert (=> d!71619 (= lt!332552 lt!332554)))

(assert (=> d!71619 (isPrefixOf!0 (_2!9696 lt!332086) (_2!9696 lt!332086))))

(assert (=> d!71619 (= lt!332554 (lemmaIsPrefixRefl!0 (_2!9696 lt!332086)))))

(declare-fun lt!332547 () Unit!15054)

(declare-fun lt!332546 () Unit!15054)

(assert (=> d!71619 (= lt!332547 lt!332546)))

(assert (=> d!71619 (= lt!332546 (lemmaIsPrefixRefl!0 (_2!9696 lt!332086)))))

(declare-fun lt!332558 () Unit!15054)

(declare-fun lt!332564 () Unit!15054)

(assert (=> d!71619 (= lt!332558 lt!332564)))

(assert (=> d!71619 (isPrefixOf!0 lt!332560 lt!332560)))

(assert (=> d!71619 (= lt!332564 (lemmaIsPrefixRefl!0 lt!332560))))

(declare-fun lt!332562 () Unit!15054)

(declare-fun lt!332556 () Unit!15054)

(assert (=> d!71619 (= lt!332562 lt!332556)))

(assert (=> d!71619 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!71619 (= lt!332556 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!71619 (= lt!332560 (BitStream!8335 (buf!5136 (_2!9696 lt!332086)) (currentByte!9690 thiss!1204) (currentBit!9685 thiss!1204)))))

(assert (=> d!71619 (isPrefixOf!0 thiss!1204 (_2!9696 lt!332086))))

(assert (=> d!71619 (= (reader!0 thiss!1204 (_2!9696 lt!332086)) lt!332548)))

(declare-fun b!211354 () Bool)

(declare-fun lt!332553 () (_ BitVec 64))

(declare-fun lt!332551 () (_ BitVec 64))

(assert (=> b!211354 (= e!144123 (= (_1!9698 lt!332548) (withMovedBitIndex!0 (_2!9698 lt!332548) (bvsub lt!332551 lt!332553))))))

(assert (=> b!211354 (or (= (bvand lt!332551 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!332553 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!332551 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!332551 lt!332553) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!211354 (= lt!332553 (bitIndex!0 (size!4613 (buf!5136 (_2!9696 lt!332086))) (currentByte!9690 (_2!9696 lt!332086)) (currentBit!9685 (_2!9696 lt!332086))))))

(assert (=> b!211354 (= lt!332551 (bitIndex!0 (size!4613 (buf!5136 thiss!1204)) (currentByte!9690 thiss!1204) (currentBit!9685 thiss!1204)))))

(declare-fun b!211355 () Bool)

(declare-fun res!177493 () Bool)

(assert (=> b!211355 (=> (not res!177493) (not e!144123))))

(assert (=> b!211355 (= res!177493 (isPrefixOf!0 (_1!9698 lt!332548) thiss!1204))))

(declare-fun b!211356 () Bool)

(declare-fun res!177494 () Bool)

(assert (=> b!211356 (=> (not res!177494) (not e!144123))))

(assert (=> b!211356 (= res!177494 (isPrefixOf!0 (_2!9698 lt!332548) (_2!9696 lt!332086)))))

(declare-fun b!211357 () Bool)

(declare-fun lt!332559 () Unit!15054)

(assert (=> b!211357 (= e!144124 lt!332559)))

(declare-fun lt!332563 () (_ BitVec 64))

(assert (=> b!211357 (= lt!332563 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!332561 () (_ BitVec 64))

(assert (=> b!211357 (= lt!332561 (bitIndex!0 (size!4613 (buf!5136 thiss!1204)) (currentByte!9690 thiss!1204) (currentBit!9685 thiss!1204)))))

(assert (=> b!211357 (= lt!332559 (arrayBitRangesEqSymmetric!0 (buf!5136 thiss!1204) (buf!5136 (_2!9696 lt!332086)) lt!332563 lt!332561))))

(assert (=> b!211357 (arrayBitRangesEq!0 (buf!5136 (_2!9696 lt!332086)) (buf!5136 thiss!1204) lt!332563 lt!332561)))

(assert (= (and d!71619 c!10396) b!211357))

(assert (= (and d!71619 (not c!10396)) b!211353))

(assert (= (and d!71619 res!177495) b!211355))

(assert (= (and b!211355 res!177493) b!211356))

(assert (= (and b!211356 res!177494) b!211354))

(declare-fun m!325687 () Bool)

(assert (=> b!211356 m!325687))

(assert (=> b!211357 m!325329))

(declare-fun m!325689 () Bool)

(assert (=> b!211357 m!325689))

(declare-fun m!325691 () Bool)

(assert (=> b!211357 m!325691))

(declare-fun m!325693 () Bool)

(assert (=> b!211354 m!325693))

(assert (=> b!211354 m!325281))

(assert (=> b!211354 m!325329))

(declare-fun m!325695 () Bool)

(assert (=> b!211355 m!325695))

(declare-fun m!325697 () Bool)

(assert (=> d!71619 m!325697))

(declare-fun m!325699 () Bool)

(assert (=> d!71619 m!325699))

(declare-fun m!325701 () Bool)

(assert (=> d!71619 m!325701))

(assert (=> d!71619 m!325669))

(declare-fun m!325703 () Bool)

(assert (=> d!71619 m!325703))

(declare-fun m!325705 () Bool)

(assert (=> d!71619 m!325705))

(assert (=> d!71619 m!325283))

(assert (=> d!71619 m!325675))

(declare-fun m!325707 () Bool)

(assert (=> d!71619 m!325707))

(declare-fun m!325709 () Bool)

(assert (=> d!71619 m!325709))

(declare-fun m!325711 () Bool)

(assert (=> d!71619 m!325711))

(assert (=> b!211155 d!71619))

(declare-fun d!71621 () Bool)

(assert (=> d!71621 (validate_offset_bits!1 ((_ sign_extend 32) (size!4613 (buf!5136 (_2!9696 lt!332086)))) ((_ sign_extend 32) (currentByte!9690 (_2!9696 lt!332072))) ((_ sign_extend 32) (currentBit!9685 (_2!9696 lt!332072))) lt!332091)))

(declare-fun lt!332567 () Unit!15054)

(declare-fun choose!9 (BitStream!8334 array!10501 (_ BitVec 64) BitStream!8334) Unit!15054)

(assert (=> d!71621 (= lt!332567 (choose!9 (_2!9696 lt!332072) (buf!5136 (_2!9696 lt!332086)) lt!332091 (BitStream!8335 (buf!5136 (_2!9696 lt!332086)) (currentByte!9690 (_2!9696 lt!332072)) (currentBit!9685 (_2!9696 lt!332072)))))))

(assert (=> d!71621 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9696 lt!332072) (buf!5136 (_2!9696 lt!332086)) lt!332091) lt!332567)))

(declare-fun bs!17576 () Bool)

(assert (= bs!17576 d!71621))

(assert (=> bs!17576 m!325297))

(declare-fun m!325713 () Bool)

(assert (=> bs!17576 m!325713))

(assert (=> b!211155 d!71621))

(declare-fun d!71623 () Bool)

(assert (=> d!71623 (= (invariant!0 (currentBit!9685 thiss!1204) (currentByte!9690 thiss!1204) (size!4613 (buf!5136 (_2!9696 lt!332072)))) (and (bvsge (currentBit!9685 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9685 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9690 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9690 thiss!1204) (size!4613 (buf!5136 (_2!9696 lt!332072)))) (and (= (currentBit!9685 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9690 thiss!1204) (size!4613 (buf!5136 (_2!9696 lt!332072))))))))))

(assert (=> b!211155 d!71623))

(declare-fun d!71625 () Bool)

(declare-fun lt!332568 () tuple2!18106)

(assert (=> d!71625 (= lt!332568 (readBit!0 (BitStream!8335 (buf!5136 (_2!9696 lt!332086)) (currentByte!9690 thiss!1204) (currentBit!9685 thiss!1204))))))

(assert (=> d!71625 (= (readBitPure!0 (BitStream!8335 (buf!5136 (_2!9696 lt!332086)) (currentByte!9690 thiss!1204) (currentBit!9685 thiss!1204))) (tuple2!18085 (_2!9708 lt!332568) (_1!9708 lt!332568)))))

(declare-fun bs!17577 () Bool)

(assert (= bs!17577 d!71625))

(declare-fun m!325715 () Bool)

(assert (=> bs!17577 m!325715))

(assert (=> b!211155 d!71625))

(declare-fun d!71627 () Bool)

(assert (=> d!71627 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4613 (buf!5136 (_2!9696 lt!332086)))) ((_ sign_extend 32) (currentByte!9690 (_2!9696 lt!332072))) ((_ sign_extend 32) (currentBit!9685 (_2!9696 lt!332072))) lt!332091) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4613 (buf!5136 (_2!9696 lt!332086)))) ((_ sign_extend 32) (currentByte!9690 (_2!9696 lt!332072))) ((_ sign_extend 32) (currentBit!9685 (_2!9696 lt!332072)))) lt!332091))))

(declare-fun bs!17578 () Bool)

(assert (= bs!17578 d!71627))

(declare-fun m!325717 () Bool)

(assert (=> bs!17578 m!325717))

(assert (=> b!211155 d!71627))

(declare-fun d!71629 () Bool)

(declare-fun lt!332569 () tuple2!18108)

(assert (=> d!71629 (= lt!332569 (readNBitsLSBFirstsLoop!0 (_1!9698 lt!332073) nBits!348 i!590 lt!332088))))

(assert (=> d!71629 (= (readNBitsLSBFirstsLoopPure!0 (_1!9698 lt!332073) nBits!348 i!590 lt!332088) (tuple2!18089 (_2!9709 lt!332569) (_1!9709 lt!332569)))))

(declare-fun bs!17579 () Bool)

(assert (= bs!17579 d!71629))

(declare-fun m!325719 () Bool)

(assert (=> bs!17579 m!325719))

(assert (=> b!211155 d!71629))

(declare-fun d!71631 () Bool)

(declare-fun e!144127 () Bool)

(assert (=> d!71631 e!144127))

(declare-fun res!177498 () Bool)

(assert (=> d!71631 (=> (not res!177498) (not e!144127))))

(declare-fun lt!332580 () tuple2!18084)

(declare-fun lt!332578 () tuple2!18084)

(assert (=> d!71631 (= res!177498 (= (bitIndex!0 (size!4613 (buf!5136 (_1!9697 lt!332580))) (currentByte!9690 (_1!9697 lt!332580)) (currentBit!9685 (_1!9697 lt!332580))) (bitIndex!0 (size!4613 (buf!5136 (_1!9697 lt!332578))) (currentByte!9690 (_1!9697 lt!332578)) (currentBit!9685 (_1!9697 lt!332578)))))))

(declare-fun lt!332579 () BitStream!8334)

(declare-fun lt!332581 () Unit!15054)

(declare-fun choose!50 (BitStream!8334 BitStream!8334 BitStream!8334 tuple2!18084 tuple2!18084 BitStream!8334 Bool tuple2!18084 tuple2!18084 BitStream!8334 Bool) Unit!15054)

(assert (=> d!71631 (= lt!332581 (choose!50 lt!332093 (_2!9696 lt!332086) lt!332579 lt!332580 (tuple2!18085 (_1!9697 lt!332580) (_2!9697 lt!332580)) (_1!9697 lt!332580) (_2!9697 lt!332580) lt!332578 (tuple2!18085 (_1!9697 lt!332578) (_2!9697 lt!332578)) (_1!9697 lt!332578) (_2!9697 lt!332578)))))

(assert (=> d!71631 (= lt!332578 (readBitPure!0 lt!332579))))

(assert (=> d!71631 (= lt!332580 (readBitPure!0 lt!332093))))

(assert (=> d!71631 (= lt!332579 (BitStream!8335 (buf!5136 (_2!9696 lt!332086)) (currentByte!9690 lt!332093) (currentBit!9685 lt!332093)))))

(assert (=> d!71631 (invariant!0 (currentBit!9685 lt!332093) (currentByte!9690 lt!332093) (size!4613 (buf!5136 (_2!9696 lt!332086))))))

(assert (=> d!71631 (= (readBitPrefixLemma!0 lt!332093 (_2!9696 lt!332086)) lt!332581)))

(declare-fun b!211360 () Bool)

(assert (=> b!211360 (= e!144127 (= (_2!9697 lt!332580) (_2!9697 lt!332578)))))

(assert (= (and d!71631 res!177498) b!211360))

(declare-fun m!325721 () Bool)

(assert (=> d!71631 m!325721))

(declare-fun m!325723 () Bool)

(assert (=> d!71631 m!325723))

(assert (=> d!71631 m!325315))

(declare-fun m!325725 () Bool)

(assert (=> d!71631 m!325725))

(declare-fun m!325727 () Bool)

(assert (=> d!71631 m!325727))

(declare-fun m!325729 () Bool)

(assert (=> d!71631 m!325729))

(assert (=> b!211155 d!71631))

(declare-fun d!71633 () Bool)

(assert (=> d!71633 (validate_offset_bits!1 ((_ sign_extend 32) (size!4613 (buf!5136 (_2!9696 lt!332086)))) ((_ sign_extend 32) (currentByte!9690 thiss!1204)) ((_ sign_extend 32) (currentBit!9685 thiss!1204)) lt!332085)))

(declare-fun lt!332582 () Unit!15054)

(assert (=> d!71633 (= lt!332582 (choose!9 thiss!1204 (buf!5136 (_2!9696 lt!332086)) lt!332085 (BitStream!8335 (buf!5136 (_2!9696 lt!332086)) (currentByte!9690 thiss!1204) (currentBit!9685 thiss!1204))))))

(assert (=> d!71633 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5136 (_2!9696 lt!332086)) lt!332085) lt!332582)))

(declare-fun bs!17580 () Bool)

(assert (= bs!17580 d!71633))

(assert (=> bs!17580 m!325305))

(declare-fun m!325731 () Bool)

(assert (=> bs!17580 m!325731))

(assert (=> b!211155 d!71633))

(declare-fun d!71635 () Bool)

(declare-fun res!177507 () Bool)

(declare-fun e!144133 () Bool)

(assert (=> d!71635 (=> (not res!177507) (not e!144133))))

(assert (=> d!71635 (= res!177507 (= (size!4613 (buf!5136 thiss!1204)) (size!4613 (buf!5136 (_2!9696 lt!332072)))))))

(assert (=> d!71635 (= (isPrefixOf!0 thiss!1204 (_2!9696 lt!332072)) e!144133)))

(declare-fun b!211367 () Bool)

(declare-fun res!177505 () Bool)

(assert (=> b!211367 (=> (not res!177505) (not e!144133))))

(assert (=> b!211367 (= res!177505 (bvsle (bitIndex!0 (size!4613 (buf!5136 thiss!1204)) (currentByte!9690 thiss!1204) (currentBit!9685 thiss!1204)) (bitIndex!0 (size!4613 (buf!5136 (_2!9696 lt!332072))) (currentByte!9690 (_2!9696 lt!332072)) (currentBit!9685 (_2!9696 lt!332072)))))))

(declare-fun b!211368 () Bool)

(declare-fun e!144132 () Bool)

(assert (=> b!211368 (= e!144133 e!144132)))

(declare-fun res!177506 () Bool)

(assert (=> b!211368 (=> res!177506 e!144132)))

(assert (=> b!211368 (= res!177506 (= (size!4613 (buf!5136 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!211369 () Bool)

(assert (=> b!211369 (= e!144132 (arrayBitRangesEq!0 (buf!5136 thiss!1204) (buf!5136 (_2!9696 lt!332072)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4613 (buf!5136 thiss!1204)) (currentByte!9690 thiss!1204) (currentBit!9685 thiss!1204))))))

(assert (= (and d!71635 res!177507) b!211367))

(assert (= (and b!211367 res!177505) b!211368))

(assert (= (and b!211368 (not res!177506)) b!211369))

(assert (=> b!211367 m!325329))

(assert (=> b!211367 m!325327))

(assert (=> b!211369 m!325329))

(assert (=> b!211369 m!325329))

(declare-fun m!325733 () Bool)

(assert (=> b!211369 m!325733))

(assert (=> b!211153 d!71635))

(declare-fun d!71637 () Bool)

(declare-fun e!144134 () Bool)

(assert (=> d!71637 e!144134))

(declare-fun res!177509 () Bool)

(assert (=> d!71637 (=> (not res!177509) (not e!144134))))

(declare-fun lt!332587 () (_ BitVec 64))

(declare-fun lt!332584 () (_ BitVec 64))

(declare-fun lt!332583 () (_ BitVec 64))

(assert (=> d!71637 (= res!177509 (= lt!332583 (bvsub lt!332587 lt!332584)))))

(assert (=> d!71637 (or (= (bvand lt!332587 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!332584 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!332587 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!332587 lt!332584) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71637 (= lt!332584 (remainingBits!0 ((_ sign_extend 32) (size!4613 (buf!5136 (_2!9696 lt!332086)))) ((_ sign_extend 32) (currentByte!9690 (_2!9696 lt!332086))) ((_ sign_extend 32) (currentBit!9685 (_2!9696 lt!332086)))))))

(declare-fun lt!332588 () (_ BitVec 64))

(declare-fun lt!332586 () (_ BitVec 64))

(assert (=> d!71637 (= lt!332587 (bvmul lt!332588 lt!332586))))

(assert (=> d!71637 (or (= lt!332588 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!332586 (bvsdiv (bvmul lt!332588 lt!332586) lt!332588)))))

(assert (=> d!71637 (= lt!332586 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!71637 (= lt!332588 ((_ sign_extend 32) (size!4613 (buf!5136 (_2!9696 lt!332086)))))))

(assert (=> d!71637 (= lt!332583 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9690 (_2!9696 lt!332086))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9685 (_2!9696 lt!332086)))))))

(assert (=> d!71637 (invariant!0 (currentBit!9685 (_2!9696 lt!332086)) (currentByte!9690 (_2!9696 lt!332086)) (size!4613 (buf!5136 (_2!9696 lt!332086))))))

(assert (=> d!71637 (= (bitIndex!0 (size!4613 (buf!5136 (_2!9696 lt!332086))) (currentByte!9690 (_2!9696 lt!332086)) (currentBit!9685 (_2!9696 lt!332086))) lt!332583)))

(declare-fun b!211370 () Bool)

(declare-fun res!177508 () Bool)

(assert (=> b!211370 (=> (not res!177508) (not e!144134))))

(assert (=> b!211370 (= res!177508 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!332583))))

(declare-fun b!211371 () Bool)

(declare-fun lt!332585 () (_ BitVec 64))

(assert (=> b!211371 (= e!144134 (bvsle lt!332583 (bvmul lt!332585 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!211371 (or (= lt!332585 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!332585 #b0000000000000000000000000000000000000000000000000000000000001000) lt!332585)))))

(assert (=> b!211371 (= lt!332585 ((_ sign_extend 32) (size!4613 (buf!5136 (_2!9696 lt!332086)))))))

(assert (= (and d!71637 res!177509) b!211370))

(assert (= (and b!211370 res!177508) b!211371))

(declare-fun m!325735 () Bool)

(assert (=> d!71637 m!325735))

(assert (=> d!71637 m!325337))

(assert (=> b!211143 d!71637))

(declare-fun d!71639 () Bool)

(declare-fun res!177512 () Bool)

(declare-fun e!144136 () Bool)

(assert (=> d!71639 (=> (not res!177512) (not e!144136))))

(assert (=> d!71639 (= res!177512 (= (size!4613 (buf!5136 thiss!1204)) (size!4613 (buf!5136 (_2!9696 lt!332086)))))))

(assert (=> d!71639 (= (isPrefixOf!0 thiss!1204 (_2!9696 lt!332086)) e!144136)))

(declare-fun b!211372 () Bool)

(declare-fun res!177510 () Bool)

(assert (=> b!211372 (=> (not res!177510) (not e!144136))))

(assert (=> b!211372 (= res!177510 (bvsle (bitIndex!0 (size!4613 (buf!5136 thiss!1204)) (currentByte!9690 thiss!1204) (currentBit!9685 thiss!1204)) (bitIndex!0 (size!4613 (buf!5136 (_2!9696 lt!332086))) (currentByte!9690 (_2!9696 lt!332086)) (currentBit!9685 (_2!9696 lt!332086)))))))

(declare-fun b!211373 () Bool)

(declare-fun e!144135 () Bool)

(assert (=> b!211373 (= e!144136 e!144135)))

(declare-fun res!177511 () Bool)

(assert (=> b!211373 (=> res!177511 e!144135)))

(assert (=> b!211373 (= res!177511 (= (size!4613 (buf!5136 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!211374 () Bool)

(assert (=> b!211374 (= e!144135 (arrayBitRangesEq!0 (buf!5136 thiss!1204) (buf!5136 (_2!9696 lt!332086)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4613 (buf!5136 thiss!1204)) (currentByte!9690 thiss!1204) (currentBit!9685 thiss!1204))))))

(assert (= (and d!71639 res!177512) b!211372))

(assert (= (and b!211372 res!177510) b!211373))

(assert (= (and b!211373 (not res!177511)) b!211374))

(assert (=> b!211372 m!325329))

(assert (=> b!211372 m!325281))

(assert (=> b!211374 m!325329))

(assert (=> b!211374 m!325329))

(declare-fun m!325737 () Bool)

(assert (=> b!211374 m!325737))

(assert (=> b!211143 d!71639))

(declare-fun d!71641 () Bool)

(assert (=> d!71641 (isPrefixOf!0 thiss!1204 (_2!9696 lt!332086))))

(declare-fun lt!332591 () Unit!15054)

(declare-fun choose!30 (BitStream!8334 BitStream!8334 BitStream!8334) Unit!15054)

(assert (=> d!71641 (= lt!332591 (choose!30 thiss!1204 (_2!9696 lt!332072) (_2!9696 lt!332086)))))

(assert (=> d!71641 (isPrefixOf!0 thiss!1204 (_2!9696 lt!332072))))

(assert (=> d!71641 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9696 lt!332072) (_2!9696 lt!332086)) lt!332591)))

(declare-fun bs!17581 () Bool)

(assert (= bs!17581 d!71641))

(assert (=> bs!17581 m!325283))

(declare-fun m!325739 () Bool)

(assert (=> bs!17581 m!325739))

(assert (=> bs!17581 m!325271))

(assert (=> b!211143 d!71641))

(declare-fun b!211547 () Bool)

(declare-fun res!177650 () Bool)

(declare-fun e!144236 () Bool)

(assert (=> b!211547 (=> (not res!177650) (not e!144236))))

(declare-fun lt!333174 () tuple2!18082)

(declare-fun lt!333182 () (_ BitVec 64))

(declare-fun lt!333193 () (_ BitVec 64))

(assert (=> b!211547 (= res!177650 (= (bitIndex!0 (size!4613 (buf!5136 (_2!9696 lt!333174))) (currentByte!9690 (_2!9696 lt!333174)) (currentBit!9685 (_2!9696 lt!333174))) (bvsub lt!333182 lt!333193)))))

(assert (=> b!211547 (or (= (bvand lt!333182 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!333193 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!333182 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!333182 lt!333193) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!211547 (= lt!333193 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!333176 () (_ BitVec 64))

(declare-fun lt!333217 () (_ BitVec 64))

(assert (=> b!211547 (= lt!333182 (bvadd lt!333176 lt!333217))))

(assert (=> b!211547 (or (not (= (bvand lt!333176 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!333217 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!333176 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!333176 lt!333217) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!211547 (= lt!333217 ((_ sign_extend 32) nBits!348))))

(assert (=> b!211547 (= lt!333176 (bitIndex!0 (size!4613 (buf!5136 (_2!9696 lt!332072))) (currentByte!9690 (_2!9696 lt!332072)) (currentBit!9685 (_2!9696 lt!332072))))))

(declare-fun b!211548 () Bool)

(declare-fun e!144239 () tuple2!18082)

(declare-fun lt!333179 () tuple2!18082)

(assert (=> b!211548 (= e!144239 (tuple2!18083 (_1!9696 lt!333179) (_2!9696 lt!333179)))))

(declare-fun lt!333208 () Bool)

(assert (=> b!211548 (= lt!333208 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!333216 () tuple2!18082)

(assert (=> b!211548 (= lt!333216 (appendBit!0 (_2!9696 lt!332072) lt!333208))))

(declare-fun res!177645 () Bool)

(assert (=> b!211548 (= res!177645 (= (size!4613 (buf!5136 (_2!9696 lt!332072))) (size!4613 (buf!5136 (_2!9696 lt!333216)))))))

(declare-fun e!144234 () Bool)

(assert (=> b!211548 (=> (not res!177645) (not e!144234))))

(assert (=> b!211548 e!144234))

(declare-fun lt!333187 () tuple2!18082)

(assert (=> b!211548 (= lt!333187 lt!333216)))

(assert (=> b!211548 (= lt!333179 (appendBitsLSBFirstLoopTR!0 (_2!9696 lt!333187) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!333205 () Unit!15054)

(assert (=> b!211548 (= lt!333205 (lemmaIsPrefixTransitive!0 (_2!9696 lt!332072) (_2!9696 lt!333187) (_2!9696 lt!333179)))))

(declare-fun call!3333 () Bool)

(assert (=> b!211548 call!3333))

(declare-fun lt!333178 () Unit!15054)

(assert (=> b!211548 (= lt!333178 lt!333205)))

(assert (=> b!211548 (invariant!0 (currentBit!9685 (_2!9696 lt!332072)) (currentByte!9690 (_2!9696 lt!332072)) (size!4613 (buf!5136 (_2!9696 lt!333187))))))

(declare-fun lt!333192 () BitStream!8334)

(assert (=> b!211548 (= lt!333192 (BitStream!8335 (buf!5136 (_2!9696 lt!333187)) (currentByte!9690 (_2!9696 lt!332072)) (currentBit!9685 (_2!9696 lt!332072))))))

(assert (=> b!211548 (invariant!0 (currentBit!9685 lt!333192) (currentByte!9690 lt!333192) (size!4613 (buf!5136 (_2!9696 lt!333179))))))

(declare-fun lt!333203 () BitStream!8334)

(assert (=> b!211548 (= lt!333203 (BitStream!8335 (buf!5136 (_2!9696 lt!333179)) (currentByte!9690 lt!333192) (currentBit!9685 lt!333192)))))

(declare-fun lt!333209 () tuple2!18084)

(assert (=> b!211548 (= lt!333209 (readBitPure!0 lt!333192))))

(declare-fun lt!333194 () tuple2!18084)

(assert (=> b!211548 (= lt!333194 (readBitPure!0 lt!333203))))

(declare-fun lt!333200 () Unit!15054)

(assert (=> b!211548 (= lt!333200 (readBitPrefixLemma!0 lt!333192 (_2!9696 lt!333179)))))

(declare-fun res!177654 () Bool)

(assert (=> b!211548 (= res!177654 (= (bitIndex!0 (size!4613 (buf!5136 (_1!9697 lt!333209))) (currentByte!9690 (_1!9697 lt!333209)) (currentBit!9685 (_1!9697 lt!333209))) (bitIndex!0 (size!4613 (buf!5136 (_1!9697 lt!333194))) (currentByte!9690 (_1!9697 lt!333194)) (currentBit!9685 (_1!9697 lt!333194)))))))

(declare-fun e!144240 () Bool)

(assert (=> b!211548 (=> (not res!177654) (not e!144240))))

(assert (=> b!211548 e!144240))

(declare-fun lt!333212 () Unit!15054)

(assert (=> b!211548 (= lt!333212 lt!333200)))

(declare-fun lt!333195 () tuple2!18086)

(assert (=> b!211548 (= lt!333195 (reader!0 (_2!9696 lt!332072) (_2!9696 lt!333179)))))

(declare-fun lt!333222 () tuple2!18086)

(assert (=> b!211548 (= lt!333222 (reader!0 (_2!9696 lt!333187) (_2!9696 lt!333179)))))

(declare-fun lt!333206 () tuple2!18084)

(assert (=> b!211548 (= lt!333206 (readBitPure!0 (_1!9698 lt!333195)))))

(assert (=> b!211548 (= (_2!9697 lt!333206) lt!333208)))

(declare-fun lt!333211 () Unit!15054)

(declare-fun Unit!15086 () Unit!15054)

(assert (=> b!211548 (= lt!333211 Unit!15086)))

(declare-fun lt!333177 () (_ BitVec 64))

(assert (=> b!211548 (= lt!333177 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!333207 () (_ BitVec 64))

(assert (=> b!211548 (= lt!333207 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!333188 () Unit!15054)

(assert (=> b!211548 (= lt!333188 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9696 lt!332072) (buf!5136 (_2!9696 lt!333179)) lt!333207))))

(assert (=> b!211548 (validate_offset_bits!1 ((_ sign_extend 32) (size!4613 (buf!5136 (_2!9696 lt!333179)))) ((_ sign_extend 32) (currentByte!9690 (_2!9696 lt!332072))) ((_ sign_extend 32) (currentBit!9685 (_2!9696 lt!332072))) lt!333207)))

(declare-fun lt!333201 () Unit!15054)

(assert (=> b!211548 (= lt!333201 lt!333188)))

(declare-fun lt!333175 () tuple2!18088)

(assert (=> b!211548 (= lt!333175 (readNBitsLSBFirstsLoopPure!0 (_1!9698 lt!333195) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!333177))))

(declare-fun lt!333196 () (_ BitVec 64))

(assert (=> b!211548 (= lt!333196 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!333173 () Unit!15054)

(assert (=> b!211548 (= lt!333173 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9696 lt!333187) (buf!5136 (_2!9696 lt!333179)) lt!333196))))

(assert (=> b!211548 (validate_offset_bits!1 ((_ sign_extend 32) (size!4613 (buf!5136 (_2!9696 lt!333179)))) ((_ sign_extend 32) (currentByte!9690 (_2!9696 lt!333187))) ((_ sign_extend 32) (currentBit!9685 (_2!9696 lt!333187))) lt!333196)))

(declare-fun lt!333213 () Unit!15054)

(assert (=> b!211548 (= lt!333213 lt!333173)))

(declare-fun lt!333198 () tuple2!18088)

(assert (=> b!211548 (= lt!333198 (readNBitsLSBFirstsLoopPure!0 (_1!9698 lt!333222) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!333177 (ite (_2!9697 lt!333206) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!333185 () tuple2!18088)

(assert (=> b!211548 (= lt!333185 (readNBitsLSBFirstsLoopPure!0 (_1!9698 lt!333195) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!333177))))

(declare-fun c!10417 () Bool)

(assert (=> b!211548 (= c!10417 (_2!9697 (readBitPure!0 (_1!9698 lt!333195))))))

(declare-fun e!144237 () (_ BitVec 64))

(declare-fun lt!333181 () tuple2!18088)

(assert (=> b!211548 (= lt!333181 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9698 lt!333195) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!333177 e!144237)))))

(declare-fun lt!333197 () Unit!15054)

(assert (=> b!211548 (= lt!333197 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9698 lt!333195) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!333177))))

(assert (=> b!211548 (and (= (_2!9699 lt!333185) (_2!9699 lt!333181)) (= (_1!9699 lt!333185) (_1!9699 lt!333181)))))

(declare-fun lt!333214 () Unit!15054)

(assert (=> b!211548 (= lt!333214 lt!333197)))

(assert (=> b!211548 (= (_1!9698 lt!333195) (withMovedBitIndex!0 (_2!9698 lt!333195) (bvsub (bitIndex!0 (size!4613 (buf!5136 (_2!9696 lt!332072))) (currentByte!9690 (_2!9696 lt!332072)) (currentBit!9685 (_2!9696 lt!332072))) (bitIndex!0 (size!4613 (buf!5136 (_2!9696 lt!333179))) (currentByte!9690 (_2!9696 lt!333179)) (currentBit!9685 (_2!9696 lt!333179))))))))

(declare-fun lt!333218 () Unit!15054)

(declare-fun Unit!15087 () Unit!15054)

(assert (=> b!211548 (= lt!333218 Unit!15087)))

(assert (=> b!211548 (= (_1!9698 lt!333222) (withMovedBitIndex!0 (_2!9698 lt!333222) (bvsub (bitIndex!0 (size!4613 (buf!5136 (_2!9696 lt!333187))) (currentByte!9690 (_2!9696 lt!333187)) (currentBit!9685 (_2!9696 lt!333187))) (bitIndex!0 (size!4613 (buf!5136 (_2!9696 lt!333179))) (currentByte!9690 (_2!9696 lt!333179)) (currentBit!9685 (_2!9696 lt!333179))))))))

(declare-fun lt!333183 () Unit!15054)

(declare-fun Unit!15088 () Unit!15054)

(assert (=> b!211548 (= lt!333183 Unit!15088)))

(assert (=> b!211548 (= (bitIndex!0 (size!4613 (buf!5136 (_2!9696 lt!332072))) (currentByte!9690 (_2!9696 lt!332072)) (currentBit!9685 (_2!9696 lt!332072))) (bvsub (bitIndex!0 (size!4613 (buf!5136 (_2!9696 lt!333187))) (currentByte!9690 (_2!9696 lt!333187)) (currentBit!9685 (_2!9696 lt!333187))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!333202 () Unit!15054)

(declare-fun Unit!15089 () Unit!15054)

(assert (=> b!211548 (= lt!333202 Unit!15089)))

(assert (=> b!211548 (= (_2!9699 lt!333175) (_2!9699 lt!333198))))

(declare-fun lt!333186 () Unit!15054)

(declare-fun Unit!15090 () Unit!15054)

(assert (=> b!211548 (= lt!333186 Unit!15090)))

(assert (=> b!211548 (invariant!0 (currentBit!9685 (_2!9696 lt!333179)) (currentByte!9690 (_2!9696 lt!333179)) (size!4613 (buf!5136 (_2!9696 lt!333179))))))

(declare-fun lt!333199 () Unit!15054)

(declare-fun Unit!15091 () Unit!15054)

(assert (=> b!211548 (= lt!333199 Unit!15091)))

(assert (=> b!211548 (= (size!4613 (buf!5136 (_2!9696 lt!332072))) (size!4613 (buf!5136 (_2!9696 lt!333179))))))

(declare-fun lt!333189 () Unit!15054)

(declare-fun Unit!15092 () Unit!15054)

(assert (=> b!211548 (= lt!333189 Unit!15092)))

(assert (=> b!211548 (= (bitIndex!0 (size!4613 (buf!5136 (_2!9696 lt!333179))) (currentByte!9690 (_2!9696 lt!333179)) (currentBit!9685 (_2!9696 lt!333179))) (bvsub (bvadd (bitIndex!0 (size!4613 (buf!5136 (_2!9696 lt!332072))) (currentByte!9690 (_2!9696 lt!332072)) (currentBit!9685 (_2!9696 lt!332072))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!333204 () Unit!15054)

(declare-fun Unit!15093 () Unit!15054)

(assert (=> b!211548 (= lt!333204 Unit!15093)))

(declare-fun lt!333225 () Unit!15054)

(declare-fun Unit!15094 () Unit!15054)

(assert (=> b!211548 (= lt!333225 Unit!15094)))

(declare-fun lt!333221 () tuple2!18086)

(assert (=> b!211548 (= lt!333221 (reader!0 (_2!9696 lt!332072) (_2!9696 lt!333179)))))

(declare-fun lt!333210 () (_ BitVec 64))

(assert (=> b!211548 (= lt!333210 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!333220 () Unit!15054)

(assert (=> b!211548 (= lt!333220 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9696 lt!332072) (buf!5136 (_2!9696 lt!333179)) lt!333210))))

(assert (=> b!211548 (validate_offset_bits!1 ((_ sign_extend 32) (size!4613 (buf!5136 (_2!9696 lt!333179)))) ((_ sign_extend 32) (currentByte!9690 (_2!9696 lt!332072))) ((_ sign_extend 32) (currentBit!9685 (_2!9696 lt!332072))) lt!333210)))

(declare-fun lt!333184 () Unit!15054)

(assert (=> b!211548 (= lt!333184 lt!333220)))

(declare-fun lt!333172 () tuple2!18088)

(assert (=> b!211548 (= lt!333172 (readNBitsLSBFirstsLoopPure!0 (_1!9698 lt!333221) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!177652 () Bool)

(assert (=> b!211548 (= res!177652 (= (_2!9699 lt!333172) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun e!144235 () Bool)

(assert (=> b!211548 (=> (not res!177652) (not e!144235))))

(assert (=> b!211548 e!144235))

(declare-fun lt!333171 () Unit!15054)

(declare-fun Unit!15095 () Unit!15054)

(assert (=> b!211548 (= lt!333171 Unit!15095)))

(declare-fun b!211549 () Bool)

(declare-fun lt!333191 () tuple2!18084)

(assert (=> b!211549 (= lt!333191 (readBitPure!0 (readerFrom!0 (_2!9696 lt!333216) (currentBit!9685 (_2!9696 lt!332072)) (currentByte!9690 (_2!9696 lt!332072)))))))

(declare-fun res!177646 () Bool)

(assert (=> b!211549 (= res!177646 (and (= (_2!9697 lt!333191) lt!333208) (= (_1!9697 lt!333191) (_2!9696 lt!333216))))))

(declare-fun e!144238 () Bool)

(assert (=> b!211549 (=> (not res!177646) (not e!144238))))

(assert (=> b!211549 (= e!144234 e!144238)))

(declare-fun bm!3330 () Bool)

(declare-fun c!10418 () Bool)

(assert (=> bm!3330 (= call!3333 (isPrefixOf!0 (_2!9696 lt!332072) (ite c!10418 (_2!9696 lt!332072) (_2!9696 lt!333179))))))

(declare-fun b!211550 () Bool)

(declare-fun res!177649 () Bool)

(assert (=> b!211550 (=> (not res!177649) (not e!144236))))

(assert (=> b!211550 (= res!177649 (= (size!4613 (buf!5136 (_2!9696 lt!332072))) (size!4613 (buf!5136 (_2!9696 lt!333174)))))))

(declare-fun b!211551 () Bool)

(assert (=> b!211551 (= e!144235 (= (_1!9699 lt!333172) (_2!9698 lt!333221)))))

(declare-fun b!211552 () Bool)

(declare-fun Unit!15096 () Unit!15054)

(assert (=> b!211552 (= e!144239 (tuple2!18083 Unit!15096 (_2!9696 lt!332072)))))

(declare-fun lt!333223 () Unit!15054)

(assert (=> b!211552 (= lt!333223 (lemmaIsPrefixRefl!0 (_2!9696 lt!332072)))))

(assert (=> b!211552 call!3333))

(declare-fun lt!333180 () Unit!15054)

(assert (=> b!211552 (= lt!333180 lt!333223)))

(declare-fun b!211553 () Bool)

(assert (=> b!211553 (= e!144237 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!211554 () Bool)

(declare-fun e!144232 () Bool)

(declare-fun lt!333224 () tuple2!18088)

(declare-fun lt!333190 () tuple2!18086)

(assert (=> b!211554 (= e!144232 (= (_1!9699 lt!333224) (_2!9698 lt!333190)))))

(declare-fun b!211555 () Bool)

(declare-fun res!177653 () Bool)

(assert (=> b!211555 (=> (not res!177653) (not e!144236))))

(assert (=> b!211555 (= res!177653 (isPrefixOf!0 (_2!9696 lt!332072) (_2!9696 lt!333174)))))

(declare-fun d!71643 () Bool)

(assert (=> d!71643 e!144236))

(declare-fun res!177651 () Bool)

(assert (=> d!71643 (=> (not res!177651) (not e!144236))))

(assert (=> d!71643 (= res!177651 (invariant!0 (currentBit!9685 (_2!9696 lt!333174)) (currentByte!9690 (_2!9696 lt!333174)) (size!4613 (buf!5136 (_2!9696 lt!333174)))))))

(assert (=> d!71643 (= lt!333174 e!144239)))

(assert (=> d!71643 (= c!10418 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!71643 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!71643 (= (appendBitsLSBFirstLoopTR!0 (_2!9696 lt!332072) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!333174)))

(declare-fun b!211556 () Bool)

(assert (=> b!211556 (= e!144240 (= (_2!9697 lt!333209) (_2!9697 lt!333194)))))

(declare-fun b!211557 () Bool)

(declare-fun res!177655 () Bool)

(assert (=> b!211557 (= res!177655 (isPrefixOf!0 (_2!9696 lt!332072) (_2!9696 lt!333216)))))

(assert (=> b!211557 (=> (not res!177655) (not e!144234))))

(declare-fun b!211558 () Bool)

(assert (=> b!211558 (= e!144238 (= (bitIndex!0 (size!4613 (buf!5136 (_1!9697 lt!333191))) (currentByte!9690 (_1!9697 lt!333191)) (currentBit!9685 (_1!9697 lt!333191))) (bitIndex!0 (size!4613 (buf!5136 (_2!9696 lt!333216))) (currentByte!9690 (_2!9696 lt!333216)) (currentBit!9685 (_2!9696 lt!333216)))))))

(declare-fun b!211559 () Bool)

(assert (=> b!211559 (= e!144236 e!144232)))

(declare-fun res!177656 () Bool)

(assert (=> b!211559 (=> (not res!177656) (not e!144232))))

(assert (=> b!211559 (= res!177656 (= (_2!9699 lt!333224) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!211559 (= lt!333224 (readNBitsLSBFirstsLoopPure!0 (_1!9698 lt!333190) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!333219 () Unit!15054)

(declare-fun lt!333170 () Unit!15054)

(assert (=> b!211559 (= lt!333219 lt!333170)))

(declare-fun lt!333215 () (_ BitVec 64))

(assert (=> b!211559 (validate_offset_bits!1 ((_ sign_extend 32) (size!4613 (buf!5136 (_2!9696 lt!333174)))) ((_ sign_extend 32) (currentByte!9690 (_2!9696 lt!332072))) ((_ sign_extend 32) (currentBit!9685 (_2!9696 lt!332072))) lt!333215)))

(assert (=> b!211559 (= lt!333170 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9696 lt!332072) (buf!5136 (_2!9696 lt!333174)) lt!333215))))

(declare-fun e!144233 () Bool)

(assert (=> b!211559 e!144233))

(declare-fun res!177647 () Bool)

(assert (=> b!211559 (=> (not res!177647) (not e!144233))))

(assert (=> b!211559 (= res!177647 (and (= (size!4613 (buf!5136 (_2!9696 lt!332072))) (size!4613 (buf!5136 (_2!9696 lt!333174)))) (bvsge lt!333215 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!211559 (= lt!333215 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!211559 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!211559 (= lt!333190 (reader!0 (_2!9696 lt!332072) (_2!9696 lt!333174)))))

(declare-fun b!211560 () Bool)

(assert (=> b!211560 (= e!144237 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!211561 () Bool)

(declare-fun res!177648 () Bool)

(assert (=> b!211561 (= res!177648 (= (bitIndex!0 (size!4613 (buf!5136 (_2!9696 lt!333216))) (currentByte!9690 (_2!9696 lt!333216)) (currentBit!9685 (_2!9696 lt!333216))) (bvadd (bitIndex!0 (size!4613 (buf!5136 (_2!9696 lt!332072))) (currentByte!9690 (_2!9696 lt!332072)) (currentBit!9685 (_2!9696 lt!332072))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!211561 (=> (not res!177648) (not e!144234))))

(declare-fun b!211562 () Bool)

(assert (=> b!211562 (= e!144233 (validate_offset_bits!1 ((_ sign_extend 32) (size!4613 (buf!5136 (_2!9696 lt!332072)))) ((_ sign_extend 32) (currentByte!9690 (_2!9696 lt!332072))) ((_ sign_extend 32) (currentBit!9685 (_2!9696 lt!332072))) lt!333215))))

(assert (= (and d!71643 c!10418) b!211552))

(assert (= (and d!71643 (not c!10418)) b!211548))

(assert (= (and b!211548 res!177645) b!211561))

(assert (= (and b!211561 res!177648) b!211557))

(assert (= (and b!211557 res!177655) b!211549))

(assert (= (and b!211549 res!177646) b!211558))

(assert (= (and b!211548 res!177654) b!211556))

(assert (= (and b!211548 c!10417) b!211560))

(assert (= (and b!211548 (not c!10417)) b!211553))

(assert (= (and b!211548 res!177652) b!211551))

(assert (= (or b!211552 b!211548) bm!3330))

(assert (= (and d!71643 res!177651) b!211550))

(assert (= (and b!211550 res!177649) b!211547))

(assert (= (and b!211547 res!177650) b!211555))

(assert (= (and b!211555 res!177653) b!211559))

(assert (= (and b!211559 res!177647) b!211562))

(assert (= (and b!211559 res!177656) b!211554))

(declare-fun m!326041 () Bool)

(assert (=> b!211548 m!326041))

(declare-fun m!326043 () Bool)

(assert (=> b!211548 m!326043))

(declare-fun m!326045 () Bool)

(assert (=> b!211548 m!326045))

(declare-fun m!326047 () Bool)

(assert (=> b!211548 m!326047))

(declare-fun m!326049 () Bool)

(assert (=> b!211548 m!326049))

(declare-fun m!326051 () Bool)

(assert (=> b!211548 m!326051))

(declare-fun m!326053 () Bool)

(assert (=> b!211548 m!326053))

(declare-fun m!326055 () Bool)

(assert (=> b!211548 m!326055))

(declare-fun m!326057 () Bool)

(assert (=> b!211548 m!326057))

(declare-fun m!326059 () Bool)

(assert (=> b!211548 m!326059))

(declare-fun m!326061 () Bool)

(assert (=> b!211548 m!326061))

(declare-fun m!326063 () Bool)

(assert (=> b!211548 m!326063))

(declare-fun m!326065 () Bool)

(assert (=> b!211548 m!326065))

(declare-fun m!326067 () Bool)

(assert (=> b!211548 m!326067))

(declare-fun m!326069 () Bool)

(assert (=> b!211548 m!326069))

(declare-fun m!326071 () Bool)

(assert (=> b!211548 m!326071))

(declare-fun m!326073 () Bool)

(assert (=> b!211548 m!326073))

(declare-fun m!326075 () Bool)

(assert (=> b!211548 m!326075))

(declare-fun m!326077 () Bool)

(assert (=> b!211548 m!326077))

(declare-fun m!326079 () Bool)

(assert (=> b!211548 m!326079))

(declare-fun m!326081 () Bool)

(assert (=> b!211548 m!326081))

(declare-fun m!326083 () Bool)

(assert (=> b!211548 m!326083))

(declare-fun m!326085 () Bool)

(assert (=> b!211548 m!326085))

(declare-fun m!326087 () Bool)

(assert (=> b!211548 m!326087))

(declare-fun m!326089 () Bool)

(assert (=> b!211548 m!326089))

(declare-fun m!326091 () Bool)

(assert (=> b!211548 m!326091))

(declare-fun m!326093 () Bool)

(assert (=> b!211548 m!326093))

(declare-fun m!326095 () Bool)

(assert (=> b!211548 m!326095))

(declare-fun m!326097 () Bool)

(assert (=> b!211548 m!326097))

(declare-fun m!326099 () Bool)

(assert (=> b!211548 m!326099))

(declare-fun m!326101 () Bool)

(assert (=> b!211548 m!326101))

(assert (=> b!211548 m!326093))

(assert (=> b!211548 m!325327))

(declare-fun m!326103 () Bool)

(assert (=> b!211548 m!326103))

(declare-fun m!326105 () Bool)

(assert (=> b!211547 m!326105))

(assert (=> b!211547 m!325327))

(declare-fun m!326107 () Bool)

(assert (=> b!211559 m!326107))

(declare-fun m!326109 () Bool)

(assert (=> b!211559 m!326109))

(assert (=> b!211559 m!326045))

(declare-fun m!326111 () Bool)

(assert (=> b!211559 m!326111))

(declare-fun m!326113 () Bool)

(assert (=> b!211559 m!326113))

(assert (=> b!211559 m!326051))

(declare-fun m!326115 () Bool)

(assert (=> b!211557 m!326115))

(declare-fun m!326117 () Bool)

(assert (=> d!71643 m!326117))

(assert (=> b!211552 m!325667))

(declare-fun m!326119 () Bool)

(assert (=> b!211555 m!326119))

(declare-fun m!326121 () Bool)

(assert (=> b!211562 m!326121))

(declare-fun m!326123 () Bool)

(assert (=> bm!3330 m!326123))

(declare-fun m!326125 () Bool)

(assert (=> b!211558 m!326125))

(declare-fun m!326127 () Bool)

(assert (=> b!211558 m!326127))

(assert (=> b!211561 m!326127))

(assert (=> b!211561 m!325327))

(declare-fun m!326129 () Bool)

(assert (=> b!211549 m!326129))

(assert (=> b!211549 m!326129))

(declare-fun m!326131 () Bool)

(assert (=> b!211549 m!326131))

(assert (=> b!211143 d!71643))

(declare-fun d!71693 () Bool)

(assert (=> d!71693 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4613 (buf!5136 thiss!1204))) ((_ sign_extend 32) (currentByte!9690 thiss!1204)) ((_ sign_extend 32) (currentBit!9685 thiss!1204)) lt!332085) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4613 (buf!5136 thiss!1204))) ((_ sign_extend 32) (currentByte!9690 thiss!1204)) ((_ sign_extend 32) (currentBit!9685 thiss!1204))) lt!332085))))

(declare-fun bs!17593 () Bool)

(assert (= bs!17593 d!71693))

(declare-fun m!326133 () Bool)

(assert (=> bs!17593 m!326133))

(assert (=> b!211152 d!71693))

(declare-fun d!71695 () Bool)

(declare-fun res!177659 () Bool)

(declare-fun e!144242 () Bool)

(assert (=> d!71695 (=> (not res!177659) (not e!144242))))

(assert (=> d!71695 (= res!177659 (= (size!4613 (buf!5136 (_2!9696 lt!332072))) (size!4613 (buf!5136 (_2!9696 lt!332086)))))))

(assert (=> d!71695 (= (isPrefixOf!0 (_2!9696 lt!332072) (_2!9696 lt!332086)) e!144242)))

(declare-fun b!211563 () Bool)

(declare-fun res!177657 () Bool)

(assert (=> b!211563 (=> (not res!177657) (not e!144242))))

(assert (=> b!211563 (= res!177657 (bvsle (bitIndex!0 (size!4613 (buf!5136 (_2!9696 lt!332072))) (currentByte!9690 (_2!9696 lt!332072)) (currentBit!9685 (_2!9696 lt!332072))) (bitIndex!0 (size!4613 (buf!5136 (_2!9696 lt!332086))) (currentByte!9690 (_2!9696 lt!332086)) (currentBit!9685 (_2!9696 lt!332086)))))))

(declare-fun b!211564 () Bool)

(declare-fun e!144241 () Bool)

(assert (=> b!211564 (= e!144242 e!144241)))

(declare-fun res!177658 () Bool)

(assert (=> b!211564 (=> res!177658 e!144241)))

(assert (=> b!211564 (= res!177658 (= (size!4613 (buf!5136 (_2!9696 lt!332072))) #b00000000000000000000000000000000))))

(declare-fun b!211565 () Bool)

(assert (=> b!211565 (= e!144241 (arrayBitRangesEq!0 (buf!5136 (_2!9696 lt!332072)) (buf!5136 (_2!9696 lt!332086)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4613 (buf!5136 (_2!9696 lt!332072))) (currentByte!9690 (_2!9696 lt!332072)) (currentBit!9685 (_2!9696 lt!332072)))))))

(assert (= (and d!71695 res!177659) b!211563))

(assert (= (and b!211563 res!177657) b!211564))

(assert (= (and b!211564 (not res!177658)) b!211565))

(assert (=> b!211563 m!325327))

(assert (=> b!211563 m!325281))

(assert (=> b!211565 m!325327))

(assert (=> b!211565 m!325327))

(declare-fun m!326135 () Bool)

(assert (=> b!211565 m!326135))

(assert (=> b!211141 d!71695))

(assert (=> b!211140 d!71635))

(declare-fun d!71697 () Bool)

(assert (=> d!71697 (= (invariant!0 (currentBit!9685 thiss!1204) (currentByte!9690 thiss!1204) (size!4613 (buf!5136 (_2!9696 lt!332086)))) (and (bvsge (currentBit!9685 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9685 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9690 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9690 thiss!1204) (size!4613 (buf!5136 (_2!9696 lt!332086)))) (and (= (currentBit!9685 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9690 thiss!1204) (size!4613 (buf!5136 (_2!9696 lt!332086))))))))))

(assert (=> b!211151 d!71697))

(declare-fun d!71699 () Bool)

(assert (=> d!71699 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9685 thiss!1204) (currentByte!9690 thiss!1204) (size!4613 (buf!5136 thiss!1204))))))

(declare-fun bs!17594 () Bool)

(assert (= bs!17594 d!71699))

(assert (=> bs!17594 m!325335))

(assert (=> start!44318 d!71699))

(declare-fun d!71701 () Bool)

(declare-fun e!144243 () Bool)

(assert (=> d!71701 e!144243))

(declare-fun res!177660 () Bool)

(assert (=> d!71701 (=> (not res!177660) (not e!144243))))

(declare-fun lt!333227 () (_ BitVec 64))

(declare-fun lt!333226 () BitStream!8334)

(assert (=> d!71701 (= res!177660 (= (bvadd lt!333227 (bvsub lt!332075 lt!332070)) (bitIndex!0 (size!4613 (buf!5136 lt!333226)) (currentByte!9690 lt!333226) (currentBit!9685 lt!333226))))))

(assert (=> d!71701 (or (not (= (bvand lt!333227 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!332075 lt!332070) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!333227 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!333227 (bvsub lt!332075 lt!332070)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71701 (= lt!333227 (bitIndex!0 (size!4613 (buf!5136 (_2!9698 lt!332092))) (currentByte!9690 (_2!9698 lt!332092)) (currentBit!9685 (_2!9698 lt!332092))))))

(assert (=> d!71701 (= lt!333226 (_2!9696 (moveBitIndex!0 (_2!9698 lt!332092) (bvsub lt!332075 lt!332070))))))

(assert (=> d!71701 (moveBitIndexPrecond!0 (_2!9698 lt!332092) (bvsub lt!332075 lt!332070))))

(assert (=> d!71701 (= (withMovedBitIndex!0 (_2!9698 lt!332092) (bvsub lt!332075 lt!332070)) lt!333226)))

(declare-fun b!211566 () Bool)

(assert (=> b!211566 (= e!144243 (= (size!4613 (buf!5136 (_2!9698 lt!332092))) (size!4613 (buf!5136 lt!333226))))))

(assert (= (and d!71701 res!177660) b!211566))

(declare-fun m!326137 () Bool)

(assert (=> d!71701 m!326137))

(declare-fun m!326139 () Bool)

(assert (=> d!71701 m!326139))

(declare-fun m!326141 () Bool)

(assert (=> d!71701 m!326141))

(declare-fun m!326143 () Bool)

(assert (=> d!71701 m!326143))

(assert (=> b!211149 d!71701))

(declare-fun d!71703 () Bool)

(declare-fun lt!333240 () tuple2!18088)

(declare-fun lt!333241 () tuple2!18088)

(assert (=> d!71703 (and (= (_2!9699 lt!333240) (_2!9699 lt!333241)) (= (_1!9699 lt!333240) (_1!9699 lt!333241)))))

(declare-fun lt!333243 () Bool)

(declare-fun lt!333245 () BitStream!8334)

(declare-fun lt!333244 () Unit!15054)

(declare-fun lt!333242 () (_ BitVec 64))

(declare-fun choose!56 (BitStream!8334 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!18088 tuple2!18088 BitStream!8334 (_ BitVec 64) Bool BitStream!8334 (_ BitVec 64) tuple2!18088 tuple2!18088 BitStream!8334 (_ BitVec 64)) Unit!15054)

(assert (=> d!71703 (= lt!333244 (choose!56 (_1!9698 lt!332073) nBits!348 i!590 lt!332088 lt!333240 (tuple2!18089 (_1!9699 lt!333240) (_2!9699 lt!333240)) (_1!9699 lt!333240) (_2!9699 lt!333240) lt!333243 lt!333245 lt!333242 lt!333241 (tuple2!18089 (_1!9699 lt!333241) (_2!9699 lt!333241)) (_1!9699 lt!333241) (_2!9699 lt!333241)))))

(assert (=> d!71703 (= lt!333241 (readNBitsLSBFirstsLoopPure!0 lt!333245 nBits!348 (bvadd i!590 #b00000000000000000000000000000001) lt!333242))))

(assert (=> d!71703 (= lt!333242 (bvor lt!332088 (ite lt!333243 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71703 (= lt!333245 (withMovedBitIndex!0 (_1!9698 lt!332073) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!71703 (= lt!333243 (_2!9697 (readBitPure!0 (_1!9698 lt!332073))))))

(assert (=> d!71703 (= lt!333240 (readNBitsLSBFirstsLoopPure!0 (_1!9698 lt!332073) nBits!348 i!590 lt!332088))))

(assert (=> d!71703 (= (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9698 lt!332073) nBits!348 i!590 lt!332088) lt!333244)))

(declare-fun bs!17596 () Bool)

(assert (= bs!17596 d!71703))

(assert (=> bs!17596 m!325277))

(assert (=> bs!17596 m!325303))

(declare-fun m!326145 () Bool)

(assert (=> bs!17596 m!326145))

(assert (=> bs!17596 m!325301))

(declare-fun m!326147 () Bool)

(assert (=> bs!17596 m!326147))

(assert (=> b!211149 d!71703))

(declare-fun d!71705 () Bool)

(declare-fun lt!333246 () tuple2!18108)

(assert (=> d!71705 (= lt!333246 (readNBitsLSBFirstsLoop!0 (withMovedBitIndex!0 (_1!9698 lt!332073) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!332074))))

(assert (=> d!71705 (= (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9698 lt!332073) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!332074) (tuple2!18089 (_2!9709 lt!333246) (_1!9709 lt!333246)))))

(declare-fun bs!17597 () Bool)

(assert (= bs!17597 d!71705))

(assert (=> bs!17597 m!325277))

(declare-fun m!326149 () Bool)

(assert (=> bs!17597 m!326149))

(assert (=> b!211149 d!71705))

(declare-fun d!71707 () Bool)

(declare-fun e!144244 () Bool)

(assert (=> d!71707 e!144244))

(declare-fun res!177661 () Bool)

(assert (=> d!71707 (=> (not res!177661) (not e!144244))))

(declare-fun lt!333248 () (_ BitVec 64))

(declare-fun lt!333247 () BitStream!8334)

(assert (=> d!71707 (= res!177661 (= (bvadd lt!333248 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4613 (buf!5136 lt!333247)) (currentByte!9690 lt!333247) (currentBit!9685 lt!333247))))))

(assert (=> d!71707 (or (not (= (bvand lt!333248 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!333248 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!333248 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71707 (= lt!333248 (bitIndex!0 (size!4613 (buf!5136 (_1!9698 lt!332073))) (currentByte!9690 (_1!9698 lt!332073)) (currentBit!9685 (_1!9698 lt!332073))))))

(assert (=> d!71707 (= lt!333247 (_2!9696 (moveBitIndex!0 (_1!9698 lt!332073) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!71707 (moveBitIndexPrecond!0 (_1!9698 lt!332073) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!71707 (= (withMovedBitIndex!0 (_1!9698 lt!332073) #b0000000000000000000000000000000000000000000000000000000000000001) lt!333247)))

(declare-fun b!211567 () Bool)

(assert (=> b!211567 (= e!144244 (= (size!4613 (buf!5136 (_1!9698 lt!332073))) (size!4613 (buf!5136 lt!333247))))))

(assert (= (and d!71707 res!177661) b!211567))

(declare-fun m!326151 () Bool)

(assert (=> d!71707 m!326151))

(declare-fun m!326153 () Bool)

(assert (=> d!71707 m!326153))

(declare-fun m!326155 () Bool)

(assert (=> d!71707 m!326155))

(declare-fun m!326157 () Bool)

(assert (=> d!71707 m!326157))

(assert (=> b!211149 d!71707))

(declare-fun d!71709 () Bool)

(assert (=> d!71709 (= (invariant!0 (currentBit!9685 thiss!1204) (currentByte!9690 thiss!1204) (size!4613 (buf!5136 thiss!1204))) (and (bvsge (currentBit!9685 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9685 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9690 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9690 thiss!1204) (size!4613 (buf!5136 thiss!1204))) (and (= (currentBit!9685 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9690 thiss!1204) (size!4613 (buf!5136 thiss!1204)))))))))

(assert (=> b!211150 d!71709))

(declare-fun d!71711 () Bool)

(assert (=> d!71711 (= (array_inv!4354 (buf!5136 thiss!1204)) (bvsge (size!4613 (buf!5136 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!211148 d!71711))

(declare-fun d!71713 () Bool)

(assert (=> d!71713 (= (invariant!0 (currentBit!9685 (_2!9696 lt!332086)) (currentByte!9690 (_2!9696 lt!332086)) (size!4613 (buf!5136 (_2!9696 lt!332086)))) (and (bvsge (currentBit!9685 (_2!9696 lt!332086)) #b00000000000000000000000000000000) (bvslt (currentBit!9685 (_2!9696 lt!332086)) #b00000000000000000000000000001000) (bvsge (currentByte!9690 (_2!9696 lt!332086)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9690 (_2!9696 lt!332086)) (size!4613 (buf!5136 (_2!9696 lt!332086)))) (and (= (currentBit!9685 (_2!9696 lt!332086)) #b00000000000000000000000000000000) (= (currentByte!9690 (_2!9696 lt!332086)) (size!4613 (buf!5136 (_2!9696 lt!332086))))))))))

(assert (=> b!211157 d!71713))

(declare-fun d!71715 () Bool)

(declare-fun e!144245 () Bool)

(assert (=> d!71715 e!144245))

(declare-fun res!177663 () Bool)

(assert (=> d!71715 (=> (not res!177663) (not e!144245))))

(declare-fun lt!333253 () (_ BitVec 64))

(declare-fun lt!333249 () (_ BitVec 64))

(declare-fun lt!333250 () (_ BitVec 64))

(assert (=> d!71715 (= res!177663 (= lt!333249 (bvsub lt!333253 lt!333250)))))

(assert (=> d!71715 (or (= (bvand lt!333253 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!333250 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!333253 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!333253 lt!333250) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71715 (= lt!333250 (remainingBits!0 ((_ sign_extend 32) (size!4613 (buf!5136 (_2!9696 lt!332072)))) ((_ sign_extend 32) (currentByte!9690 (_2!9696 lt!332072))) ((_ sign_extend 32) (currentBit!9685 (_2!9696 lt!332072)))))))

(declare-fun lt!333254 () (_ BitVec 64))

(declare-fun lt!333252 () (_ BitVec 64))

(assert (=> d!71715 (= lt!333253 (bvmul lt!333254 lt!333252))))

(assert (=> d!71715 (or (= lt!333254 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!333252 (bvsdiv (bvmul lt!333254 lt!333252) lt!333254)))))

(assert (=> d!71715 (= lt!333252 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!71715 (= lt!333254 ((_ sign_extend 32) (size!4613 (buf!5136 (_2!9696 lt!332072)))))))

(assert (=> d!71715 (= lt!333249 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9690 (_2!9696 lt!332072))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9685 (_2!9696 lt!332072)))))))

(assert (=> d!71715 (invariant!0 (currentBit!9685 (_2!9696 lt!332072)) (currentByte!9690 (_2!9696 lt!332072)) (size!4613 (buf!5136 (_2!9696 lt!332072))))))

(assert (=> d!71715 (= (bitIndex!0 (size!4613 (buf!5136 (_2!9696 lt!332072))) (currentByte!9690 (_2!9696 lt!332072)) (currentBit!9685 (_2!9696 lt!332072))) lt!333249)))

(declare-fun b!211568 () Bool)

(declare-fun res!177662 () Bool)

(assert (=> b!211568 (=> (not res!177662) (not e!144245))))

(assert (=> b!211568 (= res!177662 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!333249))))

(declare-fun b!211569 () Bool)

(declare-fun lt!333251 () (_ BitVec 64))

(assert (=> b!211569 (= e!144245 (bvsle lt!333249 (bvmul lt!333251 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!211569 (or (= lt!333251 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!333251 #b0000000000000000000000000000000000000000000000000000000000001000) lt!333251)))))

(assert (=> b!211569 (= lt!333251 ((_ sign_extend 32) (size!4613 (buf!5136 (_2!9696 lt!332072)))))))

(assert (= (and d!71715 res!177663) b!211568))

(assert (= (and b!211568 res!177662) b!211569))

(declare-fun m!326159 () Bool)

(assert (=> d!71715 m!326159))

(assert (=> d!71715 m!325639))

(assert (=> b!211158 d!71715))

(declare-fun d!71717 () Bool)

(declare-fun e!144246 () Bool)

(assert (=> d!71717 e!144246))

(declare-fun res!177665 () Bool)

(assert (=> d!71717 (=> (not res!177665) (not e!144246))))

(declare-fun lt!333256 () (_ BitVec 64))

(declare-fun lt!333255 () (_ BitVec 64))

(declare-fun lt!333259 () (_ BitVec 64))

(assert (=> d!71717 (= res!177665 (= lt!333255 (bvsub lt!333259 lt!333256)))))

(assert (=> d!71717 (or (= (bvand lt!333259 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!333256 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!333259 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!333259 lt!333256) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71717 (= lt!333256 (remainingBits!0 ((_ sign_extend 32) (size!4613 (buf!5136 thiss!1204))) ((_ sign_extend 32) (currentByte!9690 thiss!1204)) ((_ sign_extend 32) (currentBit!9685 thiss!1204))))))

(declare-fun lt!333260 () (_ BitVec 64))

(declare-fun lt!333258 () (_ BitVec 64))

(assert (=> d!71717 (= lt!333259 (bvmul lt!333260 lt!333258))))

(assert (=> d!71717 (or (= lt!333260 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!333258 (bvsdiv (bvmul lt!333260 lt!333258) lt!333260)))))

(assert (=> d!71717 (= lt!333258 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!71717 (= lt!333260 ((_ sign_extend 32) (size!4613 (buf!5136 thiss!1204))))))

(assert (=> d!71717 (= lt!333255 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9690 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9685 thiss!1204))))))

(assert (=> d!71717 (invariant!0 (currentBit!9685 thiss!1204) (currentByte!9690 thiss!1204) (size!4613 (buf!5136 thiss!1204)))))

(assert (=> d!71717 (= (bitIndex!0 (size!4613 (buf!5136 thiss!1204)) (currentByte!9690 thiss!1204) (currentBit!9685 thiss!1204)) lt!333255)))

(declare-fun b!211570 () Bool)

(declare-fun res!177664 () Bool)

(assert (=> b!211570 (=> (not res!177664) (not e!144246))))

(assert (=> b!211570 (= res!177664 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!333255))))

(declare-fun b!211571 () Bool)

(declare-fun lt!333257 () (_ BitVec 64))

(assert (=> b!211571 (= e!144246 (bvsle lt!333255 (bvmul lt!333257 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!211571 (or (= lt!333257 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!333257 #b0000000000000000000000000000000000000000000000000000000000001000) lt!333257)))))

(assert (=> b!211571 (= lt!333257 ((_ sign_extend 32) (size!4613 (buf!5136 thiss!1204))))))

(assert (= (and d!71717 res!177665) b!211570))

(assert (= (and b!211570 res!177664) b!211571))

(assert (=> d!71717 m!326133))

(assert (=> d!71717 m!325335))

(assert (=> b!211158 d!71717))

(declare-fun b!211584 () Bool)

(declare-fun e!144251 () Bool)

(declare-fun lt!333270 () tuple2!18084)

(declare-fun lt!333271 () tuple2!18082)

(assert (=> b!211584 (= e!144251 (= (bitIndex!0 (size!4613 (buf!5136 (_1!9697 lt!333270))) (currentByte!9690 (_1!9697 lt!333270)) (currentBit!9685 (_1!9697 lt!333270))) (bitIndex!0 (size!4613 (buf!5136 (_2!9696 lt!333271))) (currentByte!9690 (_2!9696 lt!333271)) (currentBit!9685 (_2!9696 lt!333271)))))))

(declare-fun d!71719 () Bool)

(declare-fun e!144252 () Bool)

(assert (=> d!71719 e!144252))

(declare-fun res!177675 () Bool)

(assert (=> d!71719 (=> (not res!177675) (not e!144252))))

(assert (=> d!71719 (= res!177675 (= (size!4613 (buf!5136 thiss!1204)) (size!4613 (buf!5136 (_2!9696 lt!333271)))))))

(declare-fun choose!16 (BitStream!8334 Bool) tuple2!18082)

(assert (=> d!71719 (= lt!333271 (choose!16 thiss!1204 lt!332078))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!71719 (validate_offset_bit!0 ((_ sign_extend 32) (size!4613 (buf!5136 thiss!1204))) ((_ sign_extend 32) (currentByte!9690 thiss!1204)) ((_ sign_extend 32) (currentBit!9685 thiss!1204)))))

(assert (=> d!71719 (= (appendBit!0 thiss!1204 lt!332078) lt!333271)))

(declare-fun b!211581 () Bool)

(declare-fun res!177674 () Bool)

(assert (=> b!211581 (=> (not res!177674) (not e!144252))))

(declare-fun lt!333272 () (_ BitVec 64))

(declare-fun lt!333269 () (_ BitVec 64))

(assert (=> b!211581 (= res!177674 (= (bitIndex!0 (size!4613 (buf!5136 (_2!9696 lt!333271))) (currentByte!9690 (_2!9696 lt!333271)) (currentBit!9685 (_2!9696 lt!333271))) (bvadd lt!333272 lt!333269)))))

(assert (=> b!211581 (or (not (= (bvand lt!333272 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!333269 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!333272 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!333272 lt!333269) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!211581 (= lt!333269 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!211581 (= lt!333272 (bitIndex!0 (size!4613 (buf!5136 thiss!1204)) (currentByte!9690 thiss!1204) (currentBit!9685 thiss!1204)))))

(declare-fun b!211583 () Bool)

(assert (=> b!211583 (= e!144252 e!144251)))

(declare-fun res!177677 () Bool)

(assert (=> b!211583 (=> (not res!177677) (not e!144251))))

(assert (=> b!211583 (= res!177677 (and (= (_2!9697 lt!333270) lt!332078) (= (_1!9697 lt!333270) (_2!9696 lt!333271))))))

(assert (=> b!211583 (= lt!333270 (readBitPure!0 (readerFrom!0 (_2!9696 lt!333271) (currentBit!9685 thiss!1204) (currentByte!9690 thiss!1204))))))

(declare-fun b!211582 () Bool)

(declare-fun res!177676 () Bool)

(assert (=> b!211582 (=> (not res!177676) (not e!144252))))

(assert (=> b!211582 (= res!177676 (isPrefixOf!0 thiss!1204 (_2!9696 lt!333271)))))

(assert (= (and d!71719 res!177675) b!211581))

(assert (= (and b!211581 res!177674) b!211582))

(assert (= (and b!211582 res!177676) b!211583))

(assert (= (and b!211583 res!177677) b!211584))

(declare-fun m!326161 () Bool)

(assert (=> b!211584 m!326161))

(declare-fun m!326163 () Bool)

(assert (=> b!211584 m!326163))

(declare-fun m!326165 () Bool)

(assert (=> d!71719 m!326165))

(declare-fun m!326167 () Bool)

(assert (=> d!71719 m!326167))

(declare-fun m!326169 () Bool)

(assert (=> b!211582 m!326169))

(declare-fun m!326171 () Bool)

(assert (=> b!211583 m!326171))

(assert (=> b!211583 m!326171))

(declare-fun m!326173 () Bool)

(assert (=> b!211583 m!326173))

(assert (=> b!211581 m!326163))

(assert (=> b!211581 m!325329))

(assert (=> b!211158 d!71719))

(assert (=> b!211147 d!71715))

(assert (=> b!211147 d!71717))

(check-sat (not d!71599) (not b!211559) (not d!71627) (not b!211583) (not d!71719) (not b!211562) (not d!71613) (not b!211333) (not b!211584) (not d!71617) (not d!71637) (not d!71595) (not d!71699) (not b!211549) (not d!71601) (not d!71597) (not b!211352) (not d!71629) (not b!211351) (not d!71619) (not b!211354) (not d!71621) (not b!211372) (not d!71641) (not b!211547) (not d!71631) (not d!71609) (not d!71643) (not b!211548) (not b!211555) (not d!71715) (not d!71705) (not b!211374) (not d!71603) (not d!71625) (not d!71633) (not b!211561) (not b!211357) (not d!71611) (not d!71693) (not d!71707) (not d!71717) (not b!211350) (not d!71703) (not b!211349) (not bm!3330) (not b!211558) (not d!71615) (not b!211356) (not b!211552) (not b!211563) (not b!211367) (not b!211557) (not b!211369) (not b!211565) (not d!71605) (not b!211582) (not d!71701) (not b!211355) (not b!211581))
(check-sat)
