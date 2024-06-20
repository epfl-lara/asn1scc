; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17928 () Bool)

(assert start!17928)

(declare-fun b!87952 () Bool)

(declare-fun res!72389 () Bool)

(declare-fun e!58269 () Bool)

(assert (=> b!87952 (=> (not res!72389) (not e!58269))))

(declare-datatypes ((array!4145 0))(
  ( (array!4146 (arr!2509 (Array (_ BitVec 32) (_ BitVec 8))) (size!1872 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3306 0))(
  ( (BitStream!3307 (buf!2262 array!4145) (currentByte!4486 (_ BitVec 32)) (currentBit!4481 (_ BitVec 32))) )
))
(declare-fun thiss!1152 () BitStream!3306)

(declare-fun i!576 () (_ BitVec 32))

(declare-fun nBits!336 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!87952 (= res!72389 (validate_offset_bits!1 ((_ sign_extend 32) (size!1872 (buf!2262 thiss!1152))) ((_ sign_extend 32) (currentByte!4486 thiss!1152)) ((_ sign_extend 32) (currentBit!4481 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun b!87953 () Bool)

(declare-fun res!72391 () Bool)

(declare-fun e!58267 () Bool)

(assert (=> b!87953 (=> res!72391 e!58267)))

(declare-datatypes ((Unit!5763 0))(
  ( (Unit!5764) )
))
(declare-datatypes ((tuple2!7430 0))(
  ( (tuple2!7431 (_1!3948 Unit!5763) (_2!3948 BitStream!3306)) )
))
(declare-fun lt!135919 () tuple2!7430)

(assert (=> b!87953 (= res!72391 (or (bvsgt ((_ sign_extend 32) (size!1872 (buf!2262 (_2!3948 lt!135919)))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!4486 (_2!3948 lt!135919))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!4481 (_2!3948 lt!135919))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvslt ((_ sign_extend 32) (size!1872 (buf!2262 (_2!3948 lt!135919)))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!4486 (_2!3948 lt!135919))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!4481 (_2!3948 lt!135919))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!87954 () Bool)

(declare-fun res!72375 () Bool)

(declare-fun e!58263 () Bool)

(assert (=> b!87954 (=> (not res!72375) (not e!58263))))

(declare-fun isPrefixOf!0 (BitStream!3306 BitStream!3306) Bool)

(assert (=> b!87954 (= res!72375 (isPrefixOf!0 thiss!1152 (_2!3948 lt!135919)))))

(declare-fun b!87955 () Bool)

(declare-fun res!72380 () Bool)

(declare-fun e!58264 () Bool)

(assert (=> b!87955 (=> (not res!72380) (not e!58264))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!87955 (= res!72380 (invariant!0 (currentBit!4481 thiss!1152) (currentByte!4486 thiss!1152) (size!1872 (buf!2262 thiss!1152))))))

(declare-fun res!72390 () Bool)

(assert (=> start!17928 (=> (not res!72390) (not e!58264))))

(assert (=> start!17928 (= res!72390 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!17928 e!58264))

(declare-fun e!58268 () Bool)

(declare-fun inv!12 (BitStream!3306) Bool)

(assert (=> start!17928 (and (inv!12 thiss!1152) e!58268)))

(declare-fun thiss!1151 () BitStream!3306)

(declare-fun e!58262 () Bool)

(assert (=> start!17928 (and (inv!12 thiss!1151) e!58262)))

(assert (=> start!17928 true))

(declare-fun b!87956 () Bool)

(declare-fun array_inv!1718 (array!4145) Bool)

(assert (=> b!87956 (= e!58268 (array_inv!1718 (buf!2262 thiss!1152)))))

(declare-fun b!87957 () Bool)

(declare-fun res!72377 () Bool)

(assert (=> b!87957 (=> (not res!72377) (not e!58269))))

(assert (=> b!87957 (= res!72377 (bvslt i!576 nBits!336))))

(declare-fun b!87958 () Bool)

(declare-fun e!58266 () Bool)

(assert (=> b!87958 (= e!58263 e!58266)))

(declare-fun res!72385 () Bool)

(assert (=> b!87958 (=> (not res!72385) (not e!58266))))

(declare-datatypes ((tuple2!7432 0))(
  ( (tuple2!7433 (_1!3949 BitStream!3306) (_2!3949 Bool)) )
))
(declare-fun lt!135924 () tuple2!7432)

(declare-fun lt!135923 () Bool)

(assert (=> b!87958 (= res!72385 (and (= (_2!3949 lt!135924) lt!135923) (= (_1!3949 lt!135924) (_2!3948 lt!135919))))))

(declare-fun readBitPure!0 (BitStream!3306) tuple2!7432)

(declare-fun readerFrom!0 (BitStream!3306 (_ BitVec 32) (_ BitVec 32)) BitStream!3306)

(assert (=> b!87958 (= lt!135924 (readBitPure!0 (readerFrom!0 (_2!3948 lt!135919) (currentBit!4481 thiss!1152) (currentByte!4486 thiss!1152))))))

(declare-fun b!87959 () Bool)

(declare-fun res!72378 () Bool)

(assert (=> b!87959 (=> (not res!72378) (not e!58264))))

(assert (=> b!87959 (= res!72378 (and (bvsle i!576 nBits!336) (= (size!1872 (buf!2262 thiss!1152)) (size!1872 (buf!2262 thiss!1151)))))))

(declare-fun b!87960 () Bool)

(declare-fun res!72383 () Bool)

(assert (=> b!87960 (=> (not res!72383) (not e!58264))))

(assert (=> b!87960 (= res!72383 (invariant!0 (currentBit!4481 thiss!1151) (currentByte!4486 thiss!1151) (size!1872 (buf!2262 thiss!1151))))))

(declare-fun b!87961 () Bool)

(assert (=> b!87961 (= e!58264 e!58269)))

(declare-fun res!72381 () Bool)

(assert (=> b!87961 (=> (not res!72381) (not e!58269))))

(declare-fun lt!135921 () (_ BitVec 64))

(declare-fun lt!135922 () (_ BitVec 64))

(assert (=> b!87961 (= res!72381 (= lt!135922 (bvadd lt!135921 ((_ sign_extend 32) i!576))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!87961 (= lt!135922 (bitIndex!0 (size!1872 (buf!2262 thiss!1152)) (currentByte!4486 thiss!1152) (currentBit!4481 thiss!1152)))))

(assert (=> b!87961 (= lt!135921 (bitIndex!0 (size!1872 (buf!2262 thiss!1151)) (currentByte!4486 thiss!1151) (currentBit!4481 thiss!1151)))))

(declare-fun b!87962 () Bool)

(assert (=> b!87962 (= e!58262 (array_inv!1718 (buf!2262 thiss!1151)))))

(declare-fun b!87963 () Bool)

(declare-fun res!72388 () Bool)

(assert (=> b!87963 (=> res!72388 e!58267)))

(assert (=> b!87963 (= res!72388 (not (= (bitIndex!0 (size!1872 (buf!2262 (_2!3948 lt!135919))) (currentByte!4486 (_2!3948 lt!135919)) (currentBit!4481 (_2!3948 lt!135919))) (bvadd lt!135921 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!576))))))))

(declare-fun b!87964 () Bool)

(declare-fun e!58261 () Bool)

(assert (=> b!87964 (= e!58261 e!58263)))

(declare-fun res!72376 () Bool)

(assert (=> b!87964 (=> (not res!72376) (not e!58263))))

(declare-fun lt!135920 () (_ BitVec 64))

(assert (=> b!87964 (= res!72376 (= lt!135920 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!135922)))))

(assert (=> b!87964 (= lt!135920 (bitIndex!0 (size!1872 (buf!2262 (_2!3948 lt!135919))) (currentByte!4486 (_2!3948 lt!135919)) (currentBit!4481 (_2!3948 lt!135919))))))

(declare-fun b!87965 () Bool)

(assert (=> b!87965 (= e!58266 (= (bitIndex!0 (size!1872 (buf!2262 (_1!3949 lt!135924))) (currentByte!4486 (_1!3949 lt!135924)) (currentBit!4481 (_1!3949 lt!135924))) lt!135920))))

(declare-fun b!87966 () Bool)

(declare-fun res!72384 () Bool)

(assert (=> b!87966 (=> res!72384 e!58267)))

(assert (=> b!87966 (= res!72384 (or (bvslt (bvadd #b00000000000000000000000000000001 i!576) nBits!336) (bvslt (bvadd #b00000000000000000000000000000001 i!576) #b00000000000000000000000000000000) (not (= (size!1872 (buf!2262 (_2!3948 lt!135919))) (size!1872 (buf!2262 thiss!1151))))))))

(declare-fun b!87967 () Bool)

(declare-fun res!72382 () Bool)

(assert (=> b!87967 (=> (not res!72382) (not e!58264))))

(assert (=> b!87967 (= res!72382 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!87968 () Bool)

(assert (=> b!87968 (= e!58267 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4481 (_2!3948 lt!135919)))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4486 (_2!3948 lt!135919)))) ((_ extract 31 0) ((_ sign_extend 32) (size!1872 (buf!2262 (_2!3948 lt!135919)))))))))

(declare-fun b!87969 () Bool)

(assert (=> b!87969 (= e!58269 (not e!58267))))

(declare-fun res!72379 () Bool)

(assert (=> b!87969 (=> res!72379 e!58267)))

(assert (=> b!87969 (= res!72379 (not (invariant!0 (currentBit!4481 (_2!3948 lt!135919)) (currentByte!4486 (_2!3948 lt!135919)) (size!1872 (buf!2262 (_2!3948 lt!135919))))))))

(assert (=> b!87969 e!58261))

(declare-fun res!72386 () Bool)

(assert (=> b!87969 (=> (not res!72386) (not e!58261))))

(assert (=> b!87969 (= res!72386 (= (size!1872 (buf!2262 thiss!1152)) (size!1872 (buf!2262 (_2!3948 lt!135919)))))))

(declare-fun appendBit!0 (BitStream!3306 Bool) tuple2!7430)

(assert (=> b!87969 (= lt!135919 (appendBit!0 thiss!1152 lt!135923))))

(declare-fun v!179 () (_ BitVec 64))

(assert (=> b!87969 (= lt!135923 (not (= (bvand v!179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!576))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!87970 () Bool)

(declare-fun res!72387 () Bool)

(assert (=> b!87970 (=> (not res!72387) (not e!58264))))

(assert (=> b!87970 (= res!72387 (validate_offset_bits!1 ((_ sign_extend 32) (size!1872 (buf!2262 thiss!1151))) ((_ sign_extend 32) (currentByte!4486 thiss!1151)) ((_ sign_extend 32) (currentBit!4481 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(assert (= (and start!17928 res!72390) b!87970))

(assert (= (and b!87970 res!72387) b!87960))

(assert (= (and b!87960 res!72383) b!87967))

(assert (= (and b!87967 res!72382) b!87955))

(assert (= (and b!87955 res!72380) b!87959))

(assert (= (and b!87959 res!72378) b!87961))

(assert (= (and b!87961 res!72381) b!87952))

(assert (= (and b!87952 res!72389) b!87957))

(assert (= (and b!87957 res!72377) b!87969))

(assert (= (and b!87969 res!72386) b!87964))

(assert (= (and b!87964 res!72376) b!87954))

(assert (= (and b!87954 res!72375) b!87958))

(assert (= (and b!87958 res!72385) b!87965))

(assert (= (and b!87969 (not res!72379)) b!87966))

(assert (= (and b!87966 (not res!72384)) b!87963))

(assert (= (and b!87963 (not res!72388)) b!87953))

(assert (= (and b!87953 (not res!72391)) b!87968))

(assert (= start!17928 b!87956))

(assert (= start!17928 b!87962))

(declare-fun m!133265 () Bool)

(assert (=> b!87960 m!133265))

(declare-fun m!133267 () Bool)

(assert (=> b!87952 m!133267))

(declare-fun m!133269 () Bool)

(assert (=> b!87961 m!133269))

(declare-fun m!133271 () Bool)

(assert (=> b!87961 m!133271))

(declare-fun m!133273 () Bool)

(assert (=> b!87964 m!133273))

(declare-fun m!133275 () Bool)

(assert (=> b!87962 m!133275))

(declare-fun m!133277 () Bool)

(assert (=> b!87956 m!133277))

(declare-fun m!133279 () Bool)

(assert (=> b!87955 m!133279))

(declare-fun m!133281 () Bool)

(assert (=> b!87969 m!133281))

(declare-fun m!133283 () Bool)

(assert (=> b!87969 m!133283))

(declare-fun m!133285 () Bool)

(assert (=> b!87965 m!133285))

(declare-fun m!133287 () Bool)

(assert (=> start!17928 m!133287))

(declare-fun m!133289 () Bool)

(assert (=> start!17928 m!133289))

(declare-fun m!133291 () Bool)

(assert (=> b!87970 m!133291))

(declare-fun m!133293 () Bool)

(assert (=> b!87954 m!133293))

(declare-fun m!133295 () Bool)

(assert (=> b!87958 m!133295))

(assert (=> b!87958 m!133295))

(declare-fun m!133297 () Bool)

(assert (=> b!87958 m!133297))

(assert (=> b!87963 m!133273))

(declare-fun m!133299 () Bool)

(assert (=> b!87968 m!133299))

(check-sat (not b!87964) (not b!87960) (not b!87965) (not b!87955) (not b!87958) (not b!87956) (not b!87969) (not b!87963) (not b!87962) (not start!17928) (not b!87970) (not b!87952) (not b!87961) (not b!87968) (not b!87954))
