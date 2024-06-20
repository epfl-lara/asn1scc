; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39430 () Bool)

(assert start!39430)

(declare-fun b!177299 () Bool)

(declare-fun e!123546 () Bool)

(declare-datatypes ((array!9571 0))(
  ( (array!9572 (arr!5150 (Array (_ BitVec 32) (_ BitVec 8))) (size!4220 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7548 0))(
  ( (BitStream!7549 (buf!4663 array!9571) (currentByte!8843 (_ BitVec 32)) (currentBit!8838 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15276 0))(
  ( (tuple2!15277 (_1!8283 BitStream!7548) (_2!8283 Bool)) )
))
(declare-fun lt!272395 () tuple2!15276)

(declare-fun lt!272396 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!177299 (= e!123546 (= (bitIndex!0 (size!4220 (buf!4663 (_1!8283 lt!272395))) (currentByte!8843 (_1!8283 lt!272395)) (currentBit!8838 (_1!8283 lt!272395))) lt!272396))))

(declare-fun b!177300 () Bool)

(declare-fun e!123545 () Bool)

(declare-fun e!123548 () Bool)

(assert (=> b!177300 (= e!123545 (not e!123548))))

(declare-fun res!146976 () Bool)

(assert (=> b!177300 (=> res!146976 e!123548)))

(declare-datatypes ((Unit!12754 0))(
  ( (Unit!12755) )
))
(declare-datatypes ((tuple2!15278 0))(
  ( (tuple2!15279 (_1!8284 Unit!12754) (_2!8284 BitStream!7548)) )
))
(declare-fun lt!272391 () tuple2!15278)

(declare-fun thiss!1204 () BitStream!7548)

(assert (=> b!177300 (= res!146976 (not (= (bitIndex!0 (size!4220 (buf!4663 (_2!8284 lt!272391))) (currentByte!8843 (_2!8284 lt!272391)) (currentBit!8838 (_2!8284 lt!272391))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!4220 (buf!4663 thiss!1204)) (currentByte!8843 thiss!1204) (currentBit!8838 thiss!1204))))))))

(declare-fun e!123543 () Bool)

(assert (=> b!177300 e!123543))

(declare-fun res!146967 () Bool)

(assert (=> b!177300 (=> (not res!146967) (not e!123543))))

(assert (=> b!177300 (= res!146967 (= (size!4220 (buf!4663 thiss!1204)) (size!4220 (buf!4663 (_2!8284 lt!272391)))))))

(declare-fun lt!272394 () Bool)

(declare-fun appendBit!0 (BitStream!7548 Bool) tuple2!15278)

(assert (=> b!177300 (= lt!272391 (appendBit!0 thiss!1204 lt!272394))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!177300 (= lt!272394 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!146975 () Bool)

(assert (=> start!39430 (=> (not res!146975) (not e!123545))))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> start!39430 (= res!146975 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39430 e!123545))

(assert (=> start!39430 true))

(declare-fun e!123547 () Bool)

(declare-fun inv!12 (BitStream!7548) Bool)

(assert (=> start!39430 (and (inv!12 thiss!1204) e!123547)))

(declare-fun b!177301 () Bool)

(declare-fun res!146970 () Bool)

(assert (=> b!177301 (=> (not res!146970) (not e!123545))))

(assert (=> b!177301 (= res!146970 (not (= i!590 nBits!348)))))

(declare-fun b!177302 () Bool)

(declare-fun e!123550 () Bool)

(assert (=> b!177302 (= e!123550 e!123546)))

(declare-fun res!146973 () Bool)

(assert (=> b!177302 (=> (not res!146973) (not e!123546))))

(assert (=> b!177302 (= res!146973 (and (= (_2!8283 lt!272395) lt!272394) (= (_1!8283 lt!272395) (_2!8284 lt!272391))))))

(declare-fun readBitPure!0 (BitStream!7548) tuple2!15276)

(declare-fun readerFrom!0 (BitStream!7548 (_ BitVec 32) (_ BitVec 32)) BitStream!7548)

(assert (=> b!177302 (= lt!272395 (readBitPure!0 (readerFrom!0 (_2!8284 lt!272391) (currentBit!8838 thiss!1204) (currentByte!8843 thiss!1204))))))

(declare-fun b!177303 () Bool)

(assert (=> b!177303 (= e!123543 e!123550)))

(declare-fun res!146974 () Bool)

(assert (=> b!177303 (=> (not res!146974) (not e!123550))))

(declare-fun lt!272392 () (_ BitVec 64))

(assert (=> b!177303 (= res!146974 (= lt!272396 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!272392)))))

(assert (=> b!177303 (= lt!272396 (bitIndex!0 (size!4220 (buf!4663 (_2!8284 lt!272391))) (currentByte!8843 (_2!8284 lt!272391)) (currentBit!8838 (_2!8284 lt!272391))))))

(assert (=> b!177303 (= lt!272392 (bitIndex!0 (size!4220 (buf!4663 thiss!1204)) (currentByte!8843 thiss!1204) (currentBit!8838 thiss!1204)))))

(declare-fun b!177304 () Bool)

(declare-fun res!146969 () Bool)

(assert (=> b!177304 (=> (not res!146969) (not e!123550))))

(declare-fun isPrefixOf!0 (BitStream!7548 BitStream!7548) Bool)

(assert (=> b!177304 (= res!146969 (isPrefixOf!0 thiss!1204 (_2!8284 lt!272391)))))

(declare-fun b!177305 () Bool)

(declare-fun e!123549 () Bool)

(assert (=> b!177305 (= e!123549 true)))

(declare-fun lt!272393 () Bool)

(declare-fun lt!272390 () tuple2!15278)

(assert (=> b!177305 (= lt!272393 (isPrefixOf!0 (_2!8284 lt!272391) (_2!8284 lt!272390)))))

(declare-fun b!177306 () Bool)

(assert (=> b!177306 (= e!123548 e!123549)))

(declare-fun res!146972 () Bool)

(assert (=> b!177306 (=> res!146972 e!123549)))

(assert (=> b!177306 (= res!146972 (not (isPrefixOf!0 thiss!1204 (_2!8284 lt!272391))))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7548 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15278)

(assert (=> b!177306 (= lt!272390 (appendBitsLSBFirstLoopTR!0 (_2!8284 lt!272391) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!177307 () Bool)

(declare-fun array_inv!3961 (array!9571) Bool)

(assert (=> b!177307 (= e!123547 (array_inv!3961 (buf!4663 thiss!1204)))))

(declare-fun b!177308 () Bool)

(declare-fun res!146971 () Bool)

(assert (=> b!177308 (=> (not res!146971) (not e!123545))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!177308 (= res!146971 (validate_offset_bits!1 ((_ sign_extend 32) (size!4220 (buf!4663 thiss!1204))) ((_ sign_extend 32) (currentByte!8843 thiss!1204)) ((_ sign_extend 32) (currentBit!8838 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!177309 () Bool)

(declare-fun res!146968 () Bool)

(assert (=> b!177309 (=> (not res!146968) (not e!123545))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!177309 (= res!146968 (invariant!0 (currentBit!8838 thiss!1204) (currentByte!8843 thiss!1204) (size!4220 (buf!4663 thiss!1204))))))

(assert (= (and start!39430 res!146975) b!177308))

(assert (= (and b!177308 res!146971) b!177309))

(assert (= (and b!177309 res!146968) b!177301))

(assert (= (and b!177301 res!146970) b!177300))

(assert (= (and b!177300 res!146967) b!177303))

(assert (= (and b!177303 res!146974) b!177304))

(assert (= (and b!177304 res!146969) b!177302))

(assert (= (and b!177302 res!146973) b!177299))

(assert (= (and b!177300 (not res!146976)) b!177306))

(assert (= (and b!177306 (not res!146972)) b!177305))

(assert (= start!39430 b!177307))

(declare-fun m!277227 () Bool)

(assert (=> b!177309 m!277227))

(declare-fun m!277229 () Bool)

(assert (=> b!177306 m!277229))

(declare-fun m!277231 () Bool)

(assert (=> b!177306 m!277231))

(declare-fun m!277233 () Bool)

(assert (=> b!177300 m!277233))

(declare-fun m!277235 () Bool)

(assert (=> b!177300 m!277235))

(declare-fun m!277237 () Bool)

(assert (=> b!177300 m!277237))

(declare-fun m!277239 () Bool)

(assert (=> b!177299 m!277239))

(declare-fun m!277241 () Bool)

(assert (=> b!177305 m!277241))

(declare-fun m!277243 () Bool)

(assert (=> b!177302 m!277243))

(assert (=> b!177302 m!277243))

(declare-fun m!277245 () Bool)

(assert (=> b!177302 m!277245))

(assert (=> b!177304 m!277229))

(declare-fun m!277247 () Bool)

(assert (=> b!177308 m!277247))

(assert (=> b!177303 m!277233))

(assert (=> b!177303 m!277235))

(declare-fun m!277249 () Bool)

(assert (=> b!177307 m!277249))

(declare-fun m!277251 () Bool)

(assert (=> start!39430 m!277251))

(check-sat (not start!39430) (not b!177306) (not b!177299) (not b!177307) (not b!177308) (not b!177305) (not b!177303) (not b!177302) (not b!177304) (not b!177309) (not b!177300))
