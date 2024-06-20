; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39364 () Bool)

(assert start!39364)

(declare-fun b!177000 () Bool)

(declare-fun e!123358 () Bool)

(declare-fun e!123353 () Bool)

(assert (=> b!177000 (= e!123358 e!123353)))

(declare-fun res!146692 () Bool)

(assert (=> b!177000 (=> (not res!146692) (not e!123353))))

(declare-fun lt!272159 () (_ BitVec 64))

(declare-fun lt!272156 () (_ BitVec 64))

(assert (=> b!177000 (= res!146692 (= lt!272159 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!272156)))))

(declare-datatypes ((array!9556 0))(
  ( (array!9557 (arr!5144 (Array (_ BitVec 32) (_ BitVec 8))) (size!4214 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7536 0))(
  ( (BitStream!7537 (buf!4657 array!9556) (currentByte!8828 (_ BitVec 32)) (currentBit!8823 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!12742 0))(
  ( (Unit!12743) )
))
(declare-datatypes ((tuple2!15246 0))(
  ( (tuple2!15247 (_1!8268 Unit!12742) (_2!8268 BitStream!7536)) )
))
(declare-fun lt!272157 () tuple2!15246)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!177000 (= lt!272159 (bitIndex!0 (size!4214 (buf!4657 (_2!8268 lt!272157))) (currentByte!8828 (_2!8268 lt!272157)) (currentBit!8823 (_2!8268 lt!272157))))))

(declare-fun thiss!1204 () BitStream!7536)

(assert (=> b!177000 (= lt!272156 (bitIndex!0 (size!4214 (buf!4657 thiss!1204)) (currentByte!8828 thiss!1204) (currentBit!8823 thiss!1204)))))

(declare-fun b!177001 () Bool)

(declare-fun e!123357 () Bool)

(declare-datatypes ((tuple2!15248 0))(
  ( (tuple2!15249 (_1!8269 BitStream!7536) (_2!8269 Bool)) )
))
(declare-fun lt!272158 () tuple2!15248)

(assert (=> b!177001 (= e!123357 (= (bitIndex!0 (size!4214 (buf!4657 (_1!8269 lt!272158))) (currentByte!8828 (_1!8269 lt!272158)) (currentBit!8823 (_1!8269 lt!272158))) lt!272159))))

(declare-fun res!146686 () Bool)

(declare-fun e!123356 () Bool)

(assert (=> start!39364 (=> (not res!146686) (not e!123356))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!39364 (= res!146686 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39364 e!123356))

(assert (=> start!39364 true))

(declare-fun e!123355 () Bool)

(declare-fun inv!12 (BitStream!7536) Bool)

(assert (=> start!39364 (and (inv!12 thiss!1204) e!123355)))

(declare-fun b!177002 () Bool)

(declare-fun array_inv!3955 (array!9556) Bool)

(assert (=> b!177002 (= e!123355 (array_inv!3955 (buf!4657 thiss!1204)))))

(declare-fun b!177003 () Bool)

(declare-fun res!146687 () Bool)

(assert (=> b!177003 (=> (not res!146687) (not e!123353))))

(declare-fun isPrefixOf!0 (BitStream!7536 BitStream!7536) Bool)

(assert (=> b!177003 (= res!146687 (isPrefixOf!0 thiss!1204 (_2!8268 lt!272157)))))

(declare-fun b!177004 () Bool)

(assert (=> b!177004 (= e!123353 e!123357)))

(declare-fun res!146694 () Bool)

(assert (=> b!177004 (=> (not res!146694) (not e!123357))))

(declare-fun lt!272155 () Bool)

(assert (=> b!177004 (= res!146694 (and (= (_2!8269 lt!272158) lt!272155) (= (_1!8269 lt!272158) (_2!8268 lt!272157))))))

(declare-fun readBitPure!0 (BitStream!7536) tuple2!15248)

(declare-fun readerFrom!0 (BitStream!7536 (_ BitVec 32) (_ BitVec 32)) BitStream!7536)

(assert (=> b!177004 (= lt!272158 (readBitPure!0 (readerFrom!0 (_2!8268 lt!272157) (currentBit!8823 thiss!1204) (currentByte!8828 thiss!1204))))))

(declare-fun b!177005 () Bool)

(declare-fun res!146688 () Bool)

(assert (=> b!177005 (=> (not res!146688) (not e!123356))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!177005 (= res!146688 (invariant!0 (currentBit!8823 thiss!1204) (currentByte!8828 thiss!1204) (size!4214 (buf!4657 thiss!1204))))))

(declare-fun b!177006 () Bool)

(declare-fun res!146691 () Bool)

(assert (=> b!177006 (=> (not res!146691) (not e!123356))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!177006 (= res!146691 (validate_offset_bits!1 ((_ sign_extend 32) (size!4214 (buf!4657 thiss!1204))) ((_ sign_extend 32) (currentByte!8828 thiss!1204)) ((_ sign_extend 32) (currentBit!8823 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!177007 () Bool)

(declare-fun res!146689 () Bool)

(assert (=> b!177007 (=> (not res!146689) (not e!123356))))

(assert (=> b!177007 (= res!146689 (not (= i!590 nBits!348)))))

(declare-fun b!177008 () Bool)

(declare-fun e!123354 () Bool)

(assert (=> b!177008 (= e!123354 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!590)) (bvsle (bvadd #b00000000000000000000000000000001 i!590) nBits!348)))))

(declare-fun b!177009 () Bool)

(assert (=> b!177009 (= e!123356 (not e!123354))))

(declare-fun res!146690 () Bool)

(assert (=> b!177009 (=> res!146690 e!123354)))

(assert (=> b!177009 (= res!146690 (not (= (bitIndex!0 (size!4214 (buf!4657 (_2!8268 lt!272157))) (currentByte!8828 (_2!8268 lt!272157)) (currentBit!8823 (_2!8268 lt!272157))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!4214 (buf!4657 thiss!1204)) (currentByte!8828 thiss!1204) (currentBit!8823 thiss!1204))))))))

(assert (=> b!177009 e!123358))

(declare-fun res!146693 () Bool)

(assert (=> b!177009 (=> (not res!146693) (not e!123358))))

(assert (=> b!177009 (= res!146693 (= (size!4214 (buf!4657 thiss!1204)) (size!4214 (buf!4657 (_2!8268 lt!272157)))))))

(declare-fun appendBit!0 (BitStream!7536 Bool) tuple2!15246)

(assert (=> b!177009 (= lt!272157 (appendBit!0 thiss!1204 lt!272155))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!177009 (= lt!272155 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!39364 res!146686) b!177006))

(assert (= (and b!177006 res!146691) b!177005))

(assert (= (and b!177005 res!146688) b!177007))

(assert (= (and b!177007 res!146689) b!177009))

(assert (= (and b!177009 res!146693) b!177000))

(assert (= (and b!177000 res!146692) b!177003))

(assert (= (and b!177003 res!146687) b!177004))

(assert (= (and b!177004 res!146694) b!177001))

(assert (= (and b!177009 (not res!146690)) b!177008))

(assert (= start!39364 b!177002))

(declare-fun m!276995 () Bool)

(assert (=> b!177003 m!276995))

(declare-fun m!276997 () Bool)

(assert (=> b!177006 m!276997))

(declare-fun m!276999 () Bool)

(assert (=> b!177001 m!276999))

(declare-fun m!277001 () Bool)

(assert (=> b!177004 m!277001))

(assert (=> b!177004 m!277001))

(declare-fun m!277003 () Bool)

(assert (=> b!177004 m!277003))

(declare-fun m!277005 () Bool)

(assert (=> start!39364 m!277005))

(declare-fun m!277007 () Bool)

(assert (=> b!177009 m!277007))

(declare-fun m!277009 () Bool)

(assert (=> b!177009 m!277009))

(declare-fun m!277011 () Bool)

(assert (=> b!177009 m!277011))

(declare-fun m!277013 () Bool)

(assert (=> b!177002 m!277013))

(declare-fun m!277015 () Bool)

(assert (=> b!177005 m!277015))

(assert (=> b!177000 m!277007))

(assert (=> b!177000 m!277009))

(check-sat (not start!39364) (not b!177000) (not b!177005) (not b!177009) (not b!177004) (not b!177006) (not b!177002) (not b!177001) (not b!177003))
(check-sat)
