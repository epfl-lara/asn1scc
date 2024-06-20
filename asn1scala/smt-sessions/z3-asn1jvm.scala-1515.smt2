; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42298 () Bool)

(assert start!42298)

(declare-fun b!199970 () Bool)

(declare-fun e!137217 () Bool)

(declare-fun e!137216 () Bool)

(assert (=> b!199970 (= e!137217 e!137216)))

(declare-fun res!167417 () Bool)

(assert (=> b!199970 (=> (not res!167417) (not e!137216))))

(declare-fun lt!312230 () Bool)

(declare-datatypes ((array!10123 0))(
  ( (array!10124 (arr!5390 (Array (_ BitVec 32) (_ BitVec 8))) (size!4460 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8028 0))(
  ( (BitStream!8029 (buf!4958 array!10123) (currentByte!9314 (_ BitVec 32)) (currentBit!9309 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!17152 0))(
  ( (tuple2!17153 (_1!9227 BitStream!8028) (_2!9227 Bool)) )
))
(declare-fun lt!312210 () tuple2!17152)

(declare-datatypes ((Unit!14201 0))(
  ( (Unit!14202) )
))
(declare-datatypes ((tuple2!17154 0))(
  ( (tuple2!17155 (_1!9228 Unit!14201) (_2!9228 BitStream!8028)) )
))
(declare-fun lt!312207 () tuple2!17154)

(assert (=> b!199970 (= res!167417 (and (= (_2!9227 lt!312210) lt!312230) (= (_1!9227 lt!312210) (_2!9228 lt!312207))))))

(declare-fun thiss!1204 () BitStream!8028)

(declare-fun readBitPure!0 (BitStream!8028) tuple2!17152)

(declare-fun readerFrom!0 (BitStream!8028 (_ BitVec 32) (_ BitVec 32)) BitStream!8028)

(assert (=> b!199970 (= lt!312210 (readBitPure!0 (readerFrom!0 (_2!9228 lt!312207) (currentBit!9309 thiss!1204) (currentByte!9314 thiss!1204))))))

(declare-fun b!199971 () Bool)

(declare-fun res!167416 () Bool)

(declare-fun e!137228 () Bool)

(assert (=> b!199971 (=> res!167416 e!137228)))

(declare-fun isPrefixOf!0 (BitStream!8028 BitStream!8028) Bool)

(assert (=> b!199971 (= res!167416 (not (isPrefixOf!0 thiss!1204 (_2!9228 lt!312207))))))

(declare-fun b!199972 () Bool)

(declare-fun e!137226 () Bool)

(assert (=> b!199972 (= e!137228 e!137226)))

(declare-fun res!167424 () Bool)

(assert (=> b!199972 (=> res!167424 e!137226)))

(declare-datatypes ((tuple2!17156 0))(
  ( (tuple2!17157 (_1!9229 BitStream!8028) (_2!9229 (_ BitVec 64))) )
))
(declare-fun lt!312209 () tuple2!17156)

(declare-datatypes ((tuple2!17158 0))(
  ( (tuple2!17159 (_1!9230 BitStream!8028) (_2!9230 BitStream!8028)) )
))
(declare-fun lt!312223 () tuple2!17158)

(assert (=> b!199972 (= res!167424 (not (= (_1!9229 lt!312209) (_2!9230 lt!312223))))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun lt!312224 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8028 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17156)

(assert (=> b!199972 (= lt!312209 (readNBitsLSBFirstsLoopPure!0 (_1!9230 lt!312223) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!312224))))

(declare-fun lt!312219 () tuple2!17154)

(declare-fun lt!312216 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!199972 (validate_offset_bits!1 ((_ sign_extend 32) (size!4460 (buf!4958 (_2!9228 lt!312219)))) ((_ sign_extend 32) (currentByte!9314 (_2!9228 lt!312207))) ((_ sign_extend 32) (currentBit!9309 (_2!9228 lt!312207))) lt!312216)))

(declare-fun lt!312221 () Unit!14201)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8028 array!10123 (_ BitVec 64)) Unit!14201)

(assert (=> b!199972 (= lt!312221 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9228 lt!312207) (buf!4958 (_2!9228 lt!312219)) lt!312216))))

(assert (=> b!199972 (= lt!312216 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!312225 () tuple2!17152)

(declare-fun lt!312220 () (_ BitVec 64))

(declare-fun lt!312218 () (_ BitVec 64))

(assert (=> b!199972 (= lt!312224 (bvor lt!312218 (ite (_2!9227 lt!312225) lt!312220 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!312211 () tuple2!17156)

(declare-fun lt!312228 () tuple2!17158)

(assert (=> b!199972 (= lt!312211 (readNBitsLSBFirstsLoopPure!0 (_1!9230 lt!312228) nBits!348 i!590 lt!312218))))

(declare-fun lt!312215 () (_ BitVec 64))

(assert (=> b!199972 (validate_offset_bits!1 ((_ sign_extend 32) (size!4460 (buf!4958 (_2!9228 lt!312219)))) ((_ sign_extend 32) (currentByte!9314 thiss!1204)) ((_ sign_extend 32) (currentBit!9309 thiss!1204)) lt!312215)))

(declare-fun lt!312227 () Unit!14201)

(assert (=> b!199972 (= lt!312227 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4958 (_2!9228 lt!312219)) lt!312215))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!199972 (= lt!312218 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!199972 (= (_2!9227 lt!312225) lt!312230)))

(assert (=> b!199972 (= lt!312225 (readBitPure!0 (_1!9230 lt!312228)))))

(declare-fun reader!0 (BitStream!8028 BitStream!8028) tuple2!17158)

(assert (=> b!199972 (= lt!312223 (reader!0 (_2!9228 lt!312207) (_2!9228 lt!312219)))))

(assert (=> b!199972 (= lt!312228 (reader!0 thiss!1204 (_2!9228 lt!312219)))))

(declare-fun e!137223 () Bool)

(assert (=> b!199972 e!137223))

(declare-fun res!167421 () Bool)

(assert (=> b!199972 (=> (not res!167421) (not e!137223))))

(declare-fun lt!312205 () tuple2!17152)

(declare-fun lt!312206 () tuple2!17152)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!199972 (= res!167421 (= (bitIndex!0 (size!4460 (buf!4958 (_1!9227 lt!312205))) (currentByte!9314 (_1!9227 lt!312205)) (currentBit!9309 (_1!9227 lt!312205))) (bitIndex!0 (size!4460 (buf!4958 (_1!9227 lt!312206))) (currentByte!9314 (_1!9227 lt!312206)) (currentBit!9309 (_1!9227 lt!312206)))))))

(declare-fun lt!312231 () Unit!14201)

(declare-fun lt!312204 () BitStream!8028)

(declare-fun readBitPrefixLemma!0 (BitStream!8028 BitStream!8028) Unit!14201)

(assert (=> b!199972 (= lt!312231 (readBitPrefixLemma!0 lt!312204 (_2!9228 lt!312219)))))

(assert (=> b!199972 (= lt!312206 (readBitPure!0 (BitStream!8029 (buf!4958 (_2!9228 lt!312219)) (currentByte!9314 thiss!1204) (currentBit!9309 thiss!1204))))))

(assert (=> b!199972 (= lt!312205 (readBitPure!0 lt!312204))))

(declare-fun e!137215 () Bool)

(assert (=> b!199972 e!137215))

(declare-fun res!167409 () Bool)

(assert (=> b!199972 (=> (not res!167409) (not e!137215))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!199972 (= res!167409 (invariant!0 (currentBit!9309 thiss!1204) (currentByte!9314 thiss!1204) (size!4460 (buf!4958 (_2!9228 lt!312207)))))))

(assert (=> b!199972 (= lt!312204 (BitStream!8029 (buf!4958 (_2!9228 lt!312207)) (currentByte!9314 thiss!1204) (currentBit!9309 thiss!1204)))))

(declare-fun b!199973 () Bool)

(declare-fun e!137225 () Bool)

(declare-fun e!137220 () Bool)

(assert (=> b!199973 (= e!137225 (not e!137220))))

(declare-fun res!167422 () Bool)

(assert (=> b!199973 (=> res!167422 e!137220)))

(declare-fun lt!312213 () (_ BitVec 64))

(declare-fun lt!312229 () (_ BitVec 64))

(assert (=> b!199973 (= res!167422 (not (= lt!312213 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!312229))))))

(assert (=> b!199973 (= lt!312213 (bitIndex!0 (size!4460 (buf!4958 (_2!9228 lt!312207))) (currentByte!9314 (_2!9228 lt!312207)) (currentBit!9309 (_2!9228 lt!312207))))))

(assert (=> b!199973 (= lt!312229 (bitIndex!0 (size!4460 (buf!4958 thiss!1204)) (currentByte!9314 thiss!1204) (currentBit!9309 thiss!1204)))))

(declare-fun e!137221 () Bool)

(assert (=> b!199973 e!137221))

(declare-fun res!167405 () Bool)

(assert (=> b!199973 (=> (not res!167405) (not e!137221))))

(assert (=> b!199973 (= res!167405 (= (size!4460 (buf!4958 thiss!1204)) (size!4460 (buf!4958 (_2!9228 lt!312207)))))))

(declare-fun appendBit!0 (BitStream!8028 Bool) tuple2!17154)

(assert (=> b!199973 (= lt!312207 (appendBit!0 thiss!1204 lt!312230))))

(assert (=> b!199973 (= lt!312230 (not (= (bvand v!189 lt!312220) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!199973 (= lt!312220 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!199974 () Bool)

(declare-fun e!137222 () Bool)

(assert (=> b!199974 (= e!137222 (= (bitIndex!0 (size!4460 (buf!4958 (_1!9229 lt!312211))) (currentByte!9314 (_1!9229 lt!312211)) (currentBit!9309 (_1!9229 lt!312211))) (bitIndex!0 (size!4460 (buf!4958 (_2!9230 lt!312228))) (currentByte!9314 (_2!9230 lt!312228)) (currentBit!9309 (_2!9230 lt!312228)))))))

(declare-fun b!199975 () Bool)

(assert (=> b!199975 (= e!137215 (invariant!0 (currentBit!9309 thiss!1204) (currentByte!9314 thiss!1204) (size!4460 (buf!4958 (_2!9228 lt!312219)))))))

(declare-fun e!137224 () Bool)

(declare-fun b!199976 () Bool)

(declare-fun lt!312232 () BitStream!8028)

(assert (=> b!199976 (= e!137224 (and (= lt!312229 (bvsub lt!312213 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!9230 lt!312223) lt!312232)) (= (_2!9229 lt!312211) (_2!9229 lt!312209)))))))

(declare-fun b!199977 () Bool)

(declare-fun e!137219 () Bool)

(declare-fun array_inv!4201 (array!10123) Bool)

(assert (=> b!199977 (= e!137219 (array_inv!4201 (buf!4958 thiss!1204)))))

(declare-fun b!199978 () Bool)

(declare-fun res!167419 () Bool)

(assert (=> b!199978 (=> (not res!167419) (not e!137225))))

(assert (=> b!199978 (= res!167419 (not (= i!590 nBits!348)))))

(declare-fun b!199979 () Bool)

(declare-fun lt!312226 () (_ BitVec 64))

(assert (=> b!199979 (= e!137216 (= (bitIndex!0 (size!4460 (buf!4958 (_1!9227 lt!312210))) (currentByte!9314 (_1!9227 lt!312210)) (currentBit!9309 (_1!9227 lt!312210))) lt!312226))))

(declare-fun b!199980 () Bool)

(declare-fun res!167412 () Bool)

(assert (=> b!199980 (=> (not res!167412) (not e!137224))))

(declare-fun lt!312212 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!8028 (_ BitVec 64)) BitStream!8028)

(assert (=> b!199980 (= res!167412 (= (_1!9230 lt!312228) (withMovedBitIndex!0 (_2!9230 lt!312228) (bvsub lt!312229 lt!312212))))))

(declare-fun b!199981 () Bool)

(declare-fun res!167408 () Bool)

(assert (=> b!199981 (=> res!167408 e!137228)))

(assert (=> b!199981 (= res!167408 (not (invariant!0 (currentBit!9309 (_2!9228 lt!312219)) (currentByte!9314 (_2!9228 lt!312219)) (size!4460 (buf!4958 (_2!9228 lt!312219))))))))

(declare-fun b!199982 () Bool)

(declare-fun res!167407 () Bool)

(assert (=> b!199982 (=> res!167407 e!137228)))

(assert (=> b!199982 (= res!167407 (or (not (= (size!4460 (buf!4958 (_2!9228 lt!312219))) (size!4460 (buf!4958 thiss!1204)))) (not (= lt!312212 (bvsub (bvadd lt!312229 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!199983 () Bool)

(declare-fun res!167411 () Bool)

(assert (=> b!199983 (=> (not res!167411) (not e!137225))))

(assert (=> b!199983 (= res!167411 (invariant!0 (currentBit!9309 thiss!1204) (currentByte!9314 thiss!1204) (size!4460 (buf!4958 thiss!1204))))))

(declare-fun b!199984 () Bool)

(declare-fun res!167404 () Bool)

(assert (=> b!199984 (=> res!167404 e!137228)))

(assert (=> b!199984 (= res!167404 (not (isPrefixOf!0 (_2!9228 lt!312207) (_2!9228 lt!312219))))))

(declare-fun b!199985 () Bool)

(assert (=> b!199985 (= e!137226 e!137222)))

(declare-fun res!167423 () Bool)

(assert (=> b!199985 (=> res!167423 e!137222)))

(assert (=> b!199985 (= res!167423 (not (= (_1!9230 lt!312223) lt!312232)))))

(assert (=> b!199985 e!137224))

(declare-fun res!167413 () Bool)

(assert (=> b!199985 (=> (not res!167413) (not e!137224))))

(declare-fun lt!312208 () tuple2!17156)

(assert (=> b!199985 (= res!167413 (and (= (_2!9229 lt!312211) (_2!9229 lt!312208)) (= (_1!9229 lt!312211) (_1!9229 lt!312208))))))

(declare-fun lt!312214 () Unit!14201)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8028 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!14201)

(assert (=> b!199985 (= lt!312214 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9230 lt!312228) nBits!348 i!590 lt!312218))))

(assert (=> b!199985 (= lt!312208 (readNBitsLSBFirstsLoopPure!0 lt!312232 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!312224))))

(assert (=> b!199985 (= lt!312232 (withMovedBitIndex!0 (_1!9230 lt!312228) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun res!167418 () Bool)

(declare-fun e!137227 () Bool)

(assert (=> start!42298 (=> (not res!167418) (not e!137227))))

(assert (=> start!42298 (= res!167418 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!42298 e!137227))

(assert (=> start!42298 true))

(declare-fun inv!12 (BitStream!8028) Bool)

(assert (=> start!42298 (and (inv!12 thiss!1204) e!137219)))

(declare-fun b!199986 () Bool)

(declare-fun res!167410 () Bool)

(assert (=> b!199986 (=> (not res!167410) (not e!137217))))

(assert (=> b!199986 (= res!167410 (isPrefixOf!0 thiss!1204 (_2!9228 lt!312207)))))

(declare-fun b!199987 () Bool)

(assert (=> b!199987 (= e!137223 (= (_2!9227 lt!312205) (_2!9227 lt!312206)))))

(declare-fun b!199988 () Bool)

(assert (=> b!199988 (= e!137221 e!137217)))

(declare-fun res!167406 () Bool)

(assert (=> b!199988 (=> (not res!167406) (not e!137217))))

(declare-fun lt!312217 () (_ BitVec 64))

(assert (=> b!199988 (= res!167406 (= lt!312226 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!312217)))))

(assert (=> b!199988 (= lt!312226 (bitIndex!0 (size!4460 (buf!4958 (_2!9228 lt!312207))) (currentByte!9314 (_2!9228 lt!312207)) (currentBit!9309 (_2!9228 lt!312207))))))

(assert (=> b!199988 (= lt!312217 (bitIndex!0 (size!4460 (buf!4958 thiss!1204)) (currentByte!9314 thiss!1204) (currentBit!9309 thiss!1204)))))

(declare-fun b!199989 () Bool)

(assert (=> b!199989 (= e!137227 e!137225)))

(declare-fun res!167415 () Bool)

(assert (=> b!199989 (=> (not res!167415) (not e!137225))))

(assert (=> b!199989 (= res!167415 (validate_offset_bits!1 ((_ sign_extend 32) (size!4460 (buf!4958 thiss!1204))) ((_ sign_extend 32) (currentByte!9314 thiss!1204)) ((_ sign_extend 32) (currentBit!9309 thiss!1204)) lt!312215))))

(assert (=> b!199989 (= lt!312215 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!199990 () Bool)

(assert (=> b!199990 (= e!137220 e!137228)))

(declare-fun res!167414 () Bool)

(assert (=> b!199990 (=> res!167414 e!137228)))

(assert (=> b!199990 (= res!167414 (not (= lt!312212 (bvsub (bvsub (bvadd lt!312213 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!199990 (= lt!312212 (bitIndex!0 (size!4460 (buf!4958 (_2!9228 lt!312219))) (currentByte!9314 (_2!9228 lt!312219)) (currentBit!9309 (_2!9228 lt!312219))))))

(assert (=> b!199990 (isPrefixOf!0 thiss!1204 (_2!9228 lt!312219))))

(declare-fun lt!312222 () Unit!14201)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8028 BitStream!8028 BitStream!8028) Unit!14201)

(assert (=> b!199990 (= lt!312222 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9228 lt!312207) (_2!9228 lt!312219)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8028 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17154)

(assert (=> b!199990 (= lt!312219 (appendBitsLSBFirstLoopTR!0 (_2!9228 lt!312207) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!199991 () Bool)

(declare-fun res!167420 () Bool)

(assert (=> b!199991 (=> (not res!167420) (not e!137224))))

(assert (=> b!199991 (= res!167420 (= (_1!9230 lt!312223) (withMovedBitIndex!0 (_2!9230 lt!312223) (bvsub lt!312213 lt!312212))))))

(assert (= (and start!42298 res!167418) b!199989))

(assert (= (and b!199989 res!167415) b!199983))

(assert (= (and b!199983 res!167411) b!199978))

(assert (= (and b!199978 res!167419) b!199973))

(assert (= (and b!199973 res!167405) b!199988))

(assert (= (and b!199988 res!167406) b!199986))

(assert (= (and b!199986 res!167410) b!199970))

(assert (= (and b!199970 res!167417) b!199979))

(assert (= (and b!199973 (not res!167422)) b!199990))

(assert (= (and b!199990 (not res!167414)) b!199981))

(assert (= (and b!199981 (not res!167408)) b!199982))

(assert (= (and b!199982 (not res!167407)) b!199984))

(assert (= (and b!199984 (not res!167404)) b!199971))

(assert (= (and b!199971 (not res!167416)) b!199972))

(assert (= (and b!199972 res!167409) b!199975))

(assert (= (and b!199972 res!167421) b!199987))

(assert (= (and b!199972 (not res!167424)) b!199985))

(assert (= (and b!199985 res!167413) b!199980))

(assert (= (and b!199980 res!167412) b!199991))

(assert (= (and b!199991 res!167420) b!199976))

(assert (= (and b!199985 (not res!167423)) b!199974))

(assert (= start!42298 b!199977))

(declare-fun m!310337 () Bool)

(assert (=> b!199991 m!310337))

(declare-fun m!310339 () Bool)

(assert (=> b!199971 m!310339))

(declare-fun m!310341 () Bool)

(assert (=> b!199984 m!310341))

(declare-fun m!310343 () Bool)

(assert (=> b!199972 m!310343))

(declare-fun m!310345 () Bool)

(assert (=> b!199972 m!310345))

(declare-fun m!310347 () Bool)

(assert (=> b!199972 m!310347))

(declare-fun m!310349 () Bool)

(assert (=> b!199972 m!310349))

(declare-fun m!310351 () Bool)

(assert (=> b!199972 m!310351))

(declare-fun m!310353 () Bool)

(assert (=> b!199972 m!310353))

(declare-fun m!310355 () Bool)

(assert (=> b!199972 m!310355))

(declare-fun m!310357 () Bool)

(assert (=> b!199972 m!310357))

(declare-fun m!310359 () Bool)

(assert (=> b!199972 m!310359))

(declare-fun m!310361 () Bool)

(assert (=> b!199972 m!310361))

(declare-fun m!310363 () Bool)

(assert (=> b!199972 m!310363))

(declare-fun m!310365 () Bool)

(assert (=> b!199972 m!310365))

(declare-fun m!310367 () Bool)

(assert (=> b!199972 m!310367))

(declare-fun m!310369 () Bool)

(assert (=> b!199972 m!310369))

(declare-fun m!310371 () Bool)

(assert (=> b!199972 m!310371))

(declare-fun m!310373 () Bool)

(assert (=> b!199972 m!310373))

(declare-fun m!310375 () Bool)

(assert (=> b!199977 m!310375))

(declare-fun m!310377 () Bool)

(assert (=> b!199983 m!310377))

(declare-fun m!310379 () Bool)

(assert (=> b!199973 m!310379))

(declare-fun m!310381 () Bool)

(assert (=> b!199973 m!310381))

(declare-fun m!310383 () Bool)

(assert (=> b!199973 m!310383))

(declare-fun m!310385 () Bool)

(assert (=> b!199981 m!310385))

(declare-fun m!310387 () Bool)

(assert (=> b!199980 m!310387))

(assert (=> b!199988 m!310379))

(assert (=> b!199988 m!310381))

(declare-fun m!310389 () Bool)

(assert (=> b!199970 m!310389))

(assert (=> b!199970 m!310389))

(declare-fun m!310391 () Bool)

(assert (=> b!199970 m!310391))

(declare-fun m!310393 () Bool)

(assert (=> b!199979 m!310393))

(declare-fun m!310395 () Bool)

(assert (=> start!42298 m!310395))

(declare-fun m!310397 () Bool)

(assert (=> b!199990 m!310397))

(declare-fun m!310399 () Bool)

(assert (=> b!199990 m!310399))

(declare-fun m!310401 () Bool)

(assert (=> b!199990 m!310401))

(declare-fun m!310403 () Bool)

(assert (=> b!199990 m!310403))

(declare-fun m!310405 () Bool)

(assert (=> b!199985 m!310405))

(declare-fun m!310407 () Bool)

(assert (=> b!199985 m!310407))

(declare-fun m!310409 () Bool)

(assert (=> b!199985 m!310409))

(declare-fun m!310411 () Bool)

(assert (=> b!199989 m!310411))

(declare-fun m!310413 () Bool)

(assert (=> b!199975 m!310413))

(declare-fun m!310415 () Bool)

(assert (=> b!199974 m!310415))

(declare-fun m!310417 () Bool)

(assert (=> b!199974 m!310417))

(assert (=> b!199986 m!310339))

(check-sat (not b!199974) (not b!199986) (not b!199991) (not b!199989) (not start!42298) (not b!199973) (not b!199983) (not b!199984) (not b!199972) (not b!199985) (not b!199977) (not b!199981) (not b!199970) (not b!199990) (not b!199971) (not b!199988) (not b!199979) (not b!199980) (not b!199975))
(check-sat)
(get-model)

(declare-fun d!68627 () Bool)

(declare-fun e!137334 () Bool)

(assert (=> d!68627 e!137334))

(declare-fun res!167583 () Bool)

(assert (=> d!68627 (=> (not res!167583) (not e!137334))))

(declare-fun lt!312658 () (_ BitVec 64))

(declare-fun lt!312661 () (_ BitVec 64))

(declare-fun lt!312662 () (_ BitVec 64))

(assert (=> d!68627 (= res!167583 (= lt!312658 (bvsub lt!312662 lt!312661)))))

(assert (=> d!68627 (or (= (bvand lt!312662 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!312661 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!312662 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!312662 lt!312661) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!68627 (= lt!312661 (remainingBits!0 ((_ sign_extend 32) (size!4460 (buf!4958 (_2!9228 lt!312207)))) ((_ sign_extend 32) (currentByte!9314 (_2!9228 lt!312207))) ((_ sign_extend 32) (currentBit!9309 (_2!9228 lt!312207)))))))

(declare-fun lt!312657 () (_ BitVec 64))

(declare-fun lt!312660 () (_ BitVec 64))

(assert (=> d!68627 (= lt!312662 (bvmul lt!312657 lt!312660))))

(assert (=> d!68627 (or (= lt!312657 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!312660 (bvsdiv (bvmul lt!312657 lt!312660) lt!312657)))))

(assert (=> d!68627 (= lt!312660 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!68627 (= lt!312657 ((_ sign_extend 32) (size!4460 (buf!4958 (_2!9228 lt!312207)))))))

(assert (=> d!68627 (= lt!312658 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9314 (_2!9228 lt!312207))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9309 (_2!9228 lt!312207)))))))

(assert (=> d!68627 (invariant!0 (currentBit!9309 (_2!9228 lt!312207)) (currentByte!9314 (_2!9228 lt!312207)) (size!4460 (buf!4958 (_2!9228 lt!312207))))))

(assert (=> d!68627 (= (bitIndex!0 (size!4460 (buf!4958 (_2!9228 lt!312207))) (currentByte!9314 (_2!9228 lt!312207)) (currentBit!9309 (_2!9228 lt!312207))) lt!312658)))

(declare-fun b!200168 () Bool)

(declare-fun res!167582 () Bool)

(assert (=> b!200168 (=> (not res!167582) (not e!137334))))

(assert (=> b!200168 (= res!167582 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!312658))))

(declare-fun b!200169 () Bool)

(declare-fun lt!312659 () (_ BitVec 64))

(assert (=> b!200169 (= e!137334 (bvsle lt!312658 (bvmul lt!312659 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!200169 (or (= lt!312659 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!312659 #b0000000000000000000000000000000000000000000000000000000000001000) lt!312659)))))

(assert (=> b!200169 (= lt!312659 ((_ sign_extend 32) (size!4460 (buf!4958 (_2!9228 lt!312207)))))))

(assert (= (and d!68627 res!167583) b!200168))

(assert (= (and b!200168 res!167582) b!200169))

(declare-fun m!310751 () Bool)

(assert (=> d!68627 m!310751))

(declare-fun m!310753 () Bool)

(assert (=> d!68627 m!310753))

(assert (=> b!199973 d!68627))

(declare-fun d!68629 () Bool)

(declare-fun e!137335 () Bool)

(assert (=> d!68629 e!137335))

(declare-fun res!167585 () Bool)

(assert (=> d!68629 (=> (not res!167585) (not e!137335))))

(declare-fun lt!312664 () (_ BitVec 64))

(declare-fun lt!312667 () (_ BitVec 64))

(declare-fun lt!312668 () (_ BitVec 64))

(assert (=> d!68629 (= res!167585 (= lt!312664 (bvsub lt!312668 lt!312667)))))

(assert (=> d!68629 (or (= (bvand lt!312668 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!312667 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!312668 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!312668 lt!312667) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!68629 (= lt!312667 (remainingBits!0 ((_ sign_extend 32) (size!4460 (buf!4958 thiss!1204))) ((_ sign_extend 32) (currentByte!9314 thiss!1204)) ((_ sign_extend 32) (currentBit!9309 thiss!1204))))))

(declare-fun lt!312663 () (_ BitVec 64))

(declare-fun lt!312666 () (_ BitVec 64))

(assert (=> d!68629 (= lt!312668 (bvmul lt!312663 lt!312666))))

(assert (=> d!68629 (or (= lt!312663 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!312666 (bvsdiv (bvmul lt!312663 lt!312666) lt!312663)))))

(assert (=> d!68629 (= lt!312666 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!68629 (= lt!312663 ((_ sign_extend 32) (size!4460 (buf!4958 thiss!1204))))))

(assert (=> d!68629 (= lt!312664 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9314 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9309 thiss!1204))))))

(assert (=> d!68629 (invariant!0 (currentBit!9309 thiss!1204) (currentByte!9314 thiss!1204) (size!4460 (buf!4958 thiss!1204)))))

(assert (=> d!68629 (= (bitIndex!0 (size!4460 (buf!4958 thiss!1204)) (currentByte!9314 thiss!1204) (currentBit!9309 thiss!1204)) lt!312664)))

(declare-fun b!200170 () Bool)

(declare-fun res!167584 () Bool)

(assert (=> b!200170 (=> (not res!167584) (not e!137335))))

(assert (=> b!200170 (= res!167584 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!312664))))

(declare-fun b!200171 () Bool)

(declare-fun lt!312665 () (_ BitVec 64))

(assert (=> b!200171 (= e!137335 (bvsle lt!312664 (bvmul lt!312665 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!200171 (or (= lt!312665 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!312665 #b0000000000000000000000000000000000000000000000000000000000001000) lt!312665)))))

(assert (=> b!200171 (= lt!312665 ((_ sign_extend 32) (size!4460 (buf!4958 thiss!1204))))))

(assert (= (and d!68629 res!167585) b!200170))

(assert (= (and b!200170 res!167584) b!200171))

(declare-fun m!310755 () Bool)

(assert (=> d!68629 m!310755))

(assert (=> d!68629 m!310377))

(assert (=> b!199973 d!68629))

(declare-fun b!200181 () Bool)

(declare-fun res!167597 () Bool)

(declare-fun e!137340 () Bool)

(assert (=> b!200181 (=> (not res!167597) (not e!137340))))

(declare-fun lt!312680 () tuple2!17154)

(declare-fun lt!312677 () (_ BitVec 64))

(declare-fun lt!312679 () (_ BitVec 64))

(assert (=> b!200181 (= res!167597 (= (bitIndex!0 (size!4460 (buf!4958 (_2!9228 lt!312680))) (currentByte!9314 (_2!9228 lt!312680)) (currentBit!9309 (_2!9228 lt!312680))) (bvadd lt!312677 lt!312679)))))

(assert (=> b!200181 (or (not (= (bvand lt!312677 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!312679 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!312677 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!312677 lt!312679) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!200181 (= lt!312679 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!200181 (= lt!312677 (bitIndex!0 (size!4460 (buf!4958 thiss!1204)) (currentByte!9314 thiss!1204) (currentBit!9309 thiss!1204)))))

(declare-fun b!200182 () Bool)

(declare-fun res!167594 () Bool)

(assert (=> b!200182 (=> (not res!167594) (not e!137340))))

(assert (=> b!200182 (= res!167594 (isPrefixOf!0 thiss!1204 (_2!9228 lt!312680)))))

(declare-fun b!200183 () Bool)

(declare-fun e!137341 () Bool)

(assert (=> b!200183 (= e!137340 e!137341)))

(declare-fun res!167596 () Bool)

(assert (=> b!200183 (=> (not res!167596) (not e!137341))))

(declare-fun lt!312678 () tuple2!17152)

(assert (=> b!200183 (= res!167596 (and (= (_2!9227 lt!312678) lt!312230) (= (_1!9227 lt!312678) (_2!9228 lt!312680))))))

(assert (=> b!200183 (= lt!312678 (readBitPure!0 (readerFrom!0 (_2!9228 lt!312680) (currentBit!9309 thiss!1204) (currentByte!9314 thiss!1204))))))

(declare-fun b!200184 () Bool)

(assert (=> b!200184 (= e!137341 (= (bitIndex!0 (size!4460 (buf!4958 (_1!9227 lt!312678))) (currentByte!9314 (_1!9227 lt!312678)) (currentBit!9309 (_1!9227 lt!312678))) (bitIndex!0 (size!4460 (buf!4958 (_2!9228 lt!312680))) (currentByte!9314 (_2!9228 lt!312680)) (currentBit!9309 (_2!9228 lt!312680)))))))

(declare-fun d!68631 () Bool)

(assert (=> d!68631 e!137340))

(declare-fun res!167595 () Bool)

(assert (=> d!68631 (=> (not res!167595) (not e!137340))))

(assert (=> d!68631 (= res!167595 (= (size!4460 (buf!4958 thiss!1204)) (size!4460 (buf!4958 (_2!9228 lt!312680)))))))

(declare-fun choose!16 (BitStream!8028 Bool) tuple2!17154)

(assert (=> d!68631 (= lt!312680 (choose!16 thiss!1204 lt!312230))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!68631 (validate_offset_bit!0 ((_ sign_extend 32) (size!4460 (buf!4958 thiss!1204))) ((_ sign_extend 32) (currentByte!9314 thiss!1204)) ((_ sign_extend 32) (currentBit!9309 thiss!1204)))))

(assert (=> d!68631 (= (appendBit!0 thiss!1204 lt!312230) lt!312680)))

(assert (= (and d!68631 res!167595) b!200181))

(assert (= (and b!200181 res!167597) b!200182))

(assert (= (and b!200182 res!167594) b!200183))

(assert (= (and b!200183 res!167596) b!200184))

(declare-fun m!310757 () Bool)

(assert (=> b!200184 m!310757))

(declare-fun m!310759 () Bool)

(assert (=> b!200184 m!310759))

(declare-fun m!310761 () Bool)

(assert (=> b!200182 m!310761))

(declare-fun m!310763 () Bool)

(assert (=> d!68631 m!310763))

(declare-fun m!310765 () Bool)

(assert (=> d!68631 m!310765))

(assert (=> b!200181 m!310759))

(assert (=> b!200181 m!310381))

(declare-fun m!310767 () Bool)

(assert (=> b!200183 m!310767))

(assert (=> b!200183 m!310767))

(declare-fun m!310769 () Bool)

(assert (=> b!200183 m!310769))

(assert (=> b!199973 d!68631))

(declare-fun d!68633 () Bool)

(declare-fun res!167606 () Bool)

(declare-fun e!137346 () Bool)

(assert (=> d!68633 (=> (not res!167606) (not e!137346))))

(assert (=> d!68633 (= res!167606 (= (size!4460 (buf!4958 (_2!9228 lt!312207))) (size!4460 (buf!4958 (_2!9228 lt!312219)))))))

(assert (=> d!68633 (= (isPrefixOf!0 (_2!9228 lt!312207) (_2!9228 lt!312219)) e!137346)))

(declare-fun b!200191 () Bool)

(declare-fun res!167604 () Bool)

(assert (=> b!200191 (=> (not res!167604) (not e!137346))))

(assert (=> b!200191 (= res!167604 (bvsle (bitIndex!0 (size!4460 (buf!4958 (_2!9228 lt!312207))) (currentByte!9314 (_2!9228 lt!312207)) (currentBit!9309 (_2!9228 lt!312207))) (bitIndex!0 (size!4460 (buf!4958 (_2!9228 lt!312219))) (currentByte!9314 (_2!9228 lt!312219)) (currentBit!9309 (_2!9228 lt!312219)))))))

(declare-fun b!200192 () Bool)

(declare-fun e!137347 () Bool)

(assert (=> b!200192 (= e!137346 e!137347)))

(declare-fun res!167605 () Bool)

(assert (=> b!200192 (=> res!167605 e!137347)))

(assert (=> b!200192 (= res!167605 (= (size!4460 (buf!4958 (_2!9228 lt!312207))) #b00000000000000000000000000000000))))

(declare-fun b!200193 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10123 array!10123 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!200193 (= e!137347 (arrayBitRangesEq!0 (buf!4958 (_2!9228 lt!312207)) (buf!4958 (_2!9228 lt!312219)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4460 (buf!4958 (_2!9228 lt!312207))) (currentByte!9314 (_2!9228 lt!312207)) (currentBit!9309 (_2!9228 lt!312207)))))))

(assert (= (and d!68633 res!167606) b!200191))

(assert (= (and b!200191 res!167604) b!200192))

(assert (= (and b!200192 (not res!167605)) b!200193))

(assert (=> b!200191 m!310379))

(assert (=> b!200191 m!310397))

(assert (=> b!200193 m!310379))

(assert (=> b!200193 m!310379))

(declare-fun m!310771 () Bool)

(assert (=> b!200193 m!310771))

(assert (=> b!199984 d!68633))

(declare-fun d!68635 () Bool)

(assert (=> d!68635 (= (invariant!0 (currentBit!9309 thiss!1204) (currentByte!9314 thiss!1204) (size!4460 (buf!4958 thiss!1204))) (and (bvsge (currentBit!9309 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9309 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9314 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9314 thiss!1204) (size!4460 (buf!4958 thiss!1204))) (and (= (currentBit!9309 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9314 thiss!1204) (size!4460 (buf!4958 thiss!1204)))))))))

(assert (=> b!199983 d!68635))

(declare-fun d!68637 () Bool)

(declare-fun lt!312695 () tuple2!17156)

(declare-fun lt!312694 () tuple2!17156)

(assert (=> d!68637 (and (= (_2!9229 lt!312695) (_2!9229 lt!312694)) (= (_1!9229 lt!312695) (_1!9229 lt!312694)))))

(declare-fun lt!312693 () BitStream!8028)

(declare-fun lt!312697 () Bool)

(declare-fun lt!312698 () (_ BitVec 64))

(declare-fun lt!312696 () Unit!14201)

(declare-fun choose!56 (BitStream!8028 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!17156 tuple2!17156 BitStream!8028 (_ BitVec 64) Bool BitStream!8028 (_ BitVec 64) tuple2!17156 tuple2!17156 BitStream!8028 (_ BitVec 64)) Unit!14201)

(assert (=> d!68637 (= lt!312696 (choose!56 (_1!9230 lt!312228) nBits!348 i!590 lt!312218 lt!312695 (tuple2!17157 (_1!9229 lt!312695) (_2!9229 lt!312695)) (_1!9229 lt!312695) (_2!9229 lt!312695) lt!312697 lt!312693 lt!312698 lt!312694 (tuple2!17157 (_1!9229 lt!312694) (_2!9229 lt!312694)) (_1!9229 lt!312694) (_2!9229 lt!312694)))))

(assert (=> d!68637 (= lt!312694 (readNBitsLSBFirstsLoopPure!0 lt!312693 nBits!348 (bvadd i!590 #b00000000000000000000000000000001) lt!312698))))

(assert (=> d!68637 (= lt!312698 (bvor lt!312218 (ite lt!312697 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!68637 (= lt!312693 (withMovedBitIndex!0 (_1!9230 lt!312228) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!68637 (= lt!312697 (_2!9227 (readBitPure!0 (_1!9230 lt!312228))))))

(assert (=> d!68637 (= lt!312695 (readNBitsLSBFirstsLoopPure!0 (_1!9230 lt!312228) nBits!348 i!590 lt!312218))))

(assert (=> d!68637 (= (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9230 lt!312228) nBits!348 i!590 lt!312218) lt!312696)))

(declare-fun bs!16904 () Bool)

(assert (= bs!16904 d!68637))

(declare-fun m!310773 () Bool)

(assert (=> bs!16904 m!310773))

(assert (=> bs!16904 m!310349))

(assert (=> bs!16904 m!310367))

(declare-fun m!310775 () Bool)

(assert (=> bs!16904 m!310775))

(assert (=> bs!16904 m!310409))

(assert (=> b!199985 d!68637))

(declare-datatypes ((tuple2!17176 0))(
  ( (tuple2!17177 (_1!9239 (_ BitVec 64)) (_2!9239 BitStream!8028)) )
))
(declare-fun lt!312701 () tuple2!17176)

(declare-fun d!68639 () Bool)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!8028 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17176)

(assert (=> d!68639 (= lt!312701 (readNBitsLSBFirstsLoop!0 lt!312232 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!312224))))

(assert (=> d!68639 (= (readNBitsLSBFirstsLoopPure!0 lt!312232 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!312224) (tuple2!17157 (_2!9239 lt!312701) (_1!9239 lt!312701)))))

(declare-fun bs!16905 () Bool)

(assert (= bs!16905 d!68639))

(declare-fun m!310777 () Bool)

(assert (=> bs!16905 m!310777))

(assert (=> b!199985 d!68639))

(declare-fun d!68641 () Bool)

(declare-fun e!137350 () Bool)

(assert (=> d!68641 e!137350))

(declare-fun res!167609 () Bool)

(assert (=> d!68641 (=> (not res!167609) (not e!137350))))

(declare-fun lt!312707 () (_ BitVec 64))

(declare-fun lt!312706 () BitStream!8028)

(assert (=> d!68641 (= res!167609 (= (bvadd lt!312707 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4460 (buf!4958 lt!312706)) (currentByte!9314 lt!312706) (currentBit!9309 lt!312706))))))

(assert (=> d!68641 (or (not (= (bvand lt!312707 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!312707 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!312707 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!68641 (= lt!312707 (bitIndex!0 (size!4460 (buf!4958 (_1!9230 lt!312228))) (currentByte!9314 (_1!9230 lt!312228)) (currentBit!9309 (_1!9230 lt!312228))))))

(declare-fun moveBitIndex!0 (BitStream!8028 (_ BitVec 64)) tuple2!17154)

(assert (=> d!68641 (= lt!312706 (_2!9228 (moveBitIndex!0 (_1!9230 lt!312228) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!8028 (_ BitVec 64)) Bool)

(assert (=> d!68641 (moveBitIndexPrecond!0 (_1!9230 lt!312228) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!68641 (= (withMovedBitIndex!0 (_1!9230 lt!312228) #b0000000000000000000000000000000000000000000000000000000000000001) lt!312706)))

(declare-fun b!200196 () Bool)

(assert (=> b!200196 (= e!137350 (= (size!4460 (buf!4958 (_1!9230 lt!312228))) (size!4460 (buf!4958 lt!312706))))))

(assert (= (and d!68641 res!167609) b!200196))

(declare-fun m!310779 () Bool)

(assert (=> d!68641 m!310779))

(declare-fun m!310781 () Bool)

(assert (=> d!68641 m!310781))

(declare-fun m!310783 () Bool)

(assert (=> d!68641 m!310783))

(declare-fun m!310785 () Bool)

(assert (=> d!68641 m!310785))

(assert (=> b!199985 d!68641))

(declare-fun d!68643 () Bool)

(declare-fun e!137351 () Bool)

(assert (=> d!68643 e!137351))

(declare-fun res!167611 () Bool)

(assert (=> d!68643 (=> (not res!167611) (not e!137351))))

(declare-fun lt!312712 () (_ BitVec 64))

(declare-fun lt!312713 () (_ BitVec 64))

(declare-fun lt!312709 () (_ BitVec 64))

(assert (=> d!68643 (= res!167611 (= lt!312709 (bvsub lt!312713 lt!312712)))))

(assert (=> d!68643 (or (= (bvand lt!312713 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!312712 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!312713 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!312713 lt!312712) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!68643 (= lt!312712 (remainingBits!0 ((_ sign_extend 32) (size!4460 (buf!4958 (_1!9229 lt!312211)))) ((_ sign_extend 32) (currentByte!9314 (_1!9229 lt!312211))) ((_ sign_extend 32) (currentBit!9309 (_1!9229 lt!312211)))))))

(declare-fun lt!312708 () (_ BitVec 64))

(declare-fun lt!312711 () (_ BitVec 64))

(assert (=> d!68643 (= lt!312713 (bvmul lt!312708 lt!312711))))

(assert (=> d!68643 (or (= lt!312708 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!312711 (bvsdiv (bvmul lt!312708 lt!312711) lt!312708)))))

(assert (=> d!68643 (= lt!312711 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!68643 (= lt!312708 ((_ sign_extend 32) (size!4460 (buf!4958 (_1!9229 lt!312211)))))))

(assert (=> d!68643 (= lt!312709 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9314 (_1!9229 lt!312211))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9309 (_1!9229 lt!312211)))))))

(assert (=> d!68643 (invariant!0 (currentBit!9309 (_1!9229 lt!312211)) (currentByte!9314 (_1!9229 lt!312211)) (size!4460 (buf!4958 (_1!9229 lt!312211))))))

(assert (=> d!68643 (= (bitIndex!0 (size!4460 (buf!4958 (_1!9229 lt!312211))) (currentByte!9314 (_1!9229 lt!312211)) (currentBit!9309 (_1!9229 lt!312211))) lt!312709)))

(declare-fun b!200197 () Bool)

(declare-fun res!167610 () Bool)

(assert (=> b!200197 (=> (not res!167610) (not e!137351))))

(assert (=> b!200197 (= res!167610 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!312709))))

(declare-fun b!200198 () Bool)

(declare-fun lt!312710 () (_ BitVec 64))

(assert (=> b!200198 (= e!137351 (bvsle lt!312709 (bvmul lt!312710 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!200198 (or (= lt!312710 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!312710 #b0000000000000000000000000000000000000000000000000000000000001000) lt!312710)))))

(assert (=> b!200198 (= lt!312710 ((_ sign_extend 32) (size!4460 (buf!4958 (_1!9229 lt!312211)))))))

(assert (= (and d!68643 res!167611) b!200197))

(assert (= (and b!200197 res!167610) b!200198))

(declare-fun m!310787 () Bool)

(assert (=> d!68643 m!310787))

(declare-fun m!310789 () Bool)

(assert (=> d!68643 m!310789))

(assert (=> b!199974 d!68643))

(declare-fun d!68645 () Bool)

(declare-fun e!137352 () Bool)

(assert (=> d!68645 e!137352))

(declare-fun res!167613 () Bool)

(assert (=> d!68645 (=> (not res!167613) (not e!137352))))

(declare-fun lt!312719 () (_ BitVec 64))

(declare-fun lt!312718 () (_ BitVec 64))

(declare-fun lt!312715 () (_ BitVec 64))

(assert (=> d!68645 (= res!167613 (= lt!312715 (bvsub lt!312719 lt!312718)))))

(assert (=> d!68645 (or (= (bvand lt!312719 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!312718 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!312719 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!312719 lt!312718) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!68645 (= lt!312718 (remainingBits!0 ((_ sign_extend 32) (size!4460 (buf!4958 (_2!9230 lt!312228)))) ((_ sign_extend 32) (currentByte!9314 (_2!9230 lt!312228))) ((_ sign_extend 32) (currentBit!9309 (_2!9230 lt!312228)))))))

(declare-fun lt!312714 () (_ BitVec 64))

(declare-fun lt!312717 () (_ BitVec 64))

(assert (=> d!68645 (= lt!312719 (bvmul lt!312714 lt!312717))))

(assert (=> d!68645 (or (= lt!312714 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!312717 (bvsdiv (bvmul lt!312714 lt!312717) lt!312714)))))

(assert (=> d!68645 (= lt!312717 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!68645 (= lt!312714 ((_ sign_extend 32) (size!4460 (buf!4958 (_2!9230 lt!312228)))))))

(assert (=> d!68645 (= lt!312715 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9314 (_2!9230 lt!312228))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9309 (_2!9230 lt!312228)))))))

(assert (=> d!68645 (invariant!0 (currentBit!9309 (_2!9230 lt!312228)) (currentByte!9314 (_2!9230 lt!312228)) (size!4460 (buf!4958 (_2!9230 lt!312228))))))

(assert (=> d!68645 (= (bitIndex!0 (size!4460 (buf!4958 (_2!9230 lt!312228))) (currentByte!9314 (_2!9230 lt!312228)) (currentBit!9309 (_2!9230 lt!312228))) lt!312715)))

(declare-fun b!200199 () Bool)

(declare-fun res!167612 () Bool)

(assert (=> b!200199 (=> (not res!167612) (not e!137352))))

(assert (=> b!200199 (= res!167612 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!312715))))

(declare-fun b!200200 () Bool)

(declare-fun lt!312716 () (_ BitVec 64))

(assert (=> b!200200 (= e!137352 (bvsle lt!312715 (bvmul lt!312716 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!200200 (or (= lt!312716 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!312716 #b0000000000000000000000000000000000000000000000000000000000001000) lt!312716)))))

(assert (=> b!200200 (= lt!312716 ((_ sign_extend 32) (size!4460 (buf!4958 (_2!9230 lt!312228)))))))

(assert (= (and d!68645 res!167613) b!200199))

(assert (= (and b!200199 res!167612) b!200200))

(declare-fun m!310791 () Bool)

(assert (=> d!68645 m!310791))

(declare-fun m!310793 () Bool)

(assert (=> d!68645 m!310793))

(assert (=> b!199974 d!68645))

(declare-fun d!68647 () Bool)

(assert (=> d!68647 (= (invariant!0 (currentBit!9309 (_2!9228 lt!312219)) (currentByte!9314 (_2!9228 lt!312219)) (size!4460 (buf!4958 (_2!9228 lt!312219)))) (and (bvsge (currentBit!9309 (_2!9228 lt!312219)) #b00000000000000000000000000000000) (bvslt (currentBit!9309 (_2!9228 lt!312219)) #b00000000000000000000000000001000) (bvsge (currentByte!9314 (_2!9228 lt!312219)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9314 (_2!9228 lt!312219)) (size!4460 (buf!4958 (_2!9228 lt!312219)))) (and (= (currentBit!9309 (_2!9228 lt!312219)) #b00000000000000000000000000000000) (= (currentByte!9314 (_2!9228 lt!312219)) (size!4460 (buf!4958 (_2!9228 lt!312219))))))))))

(assert (=> b!199981 d!68647))

(declare-fun d!68649 () Bool)

(declare-fun e!137353 () Bool)

(assert (=> d!68649 e!137353))

(declare-fun res!167614 () Bool)

(assert (=> d!68649 (=> (not res!167614) (not e!137353))))

(declare-fun lt!312721 () (_ BitVec 64))

(declare-fun lt!312720 () BitStream!8028)

(assert (=> d!68649 (= res!167614 (= (bvadd lt!312721 (bvsub lt!312213 lt!312212)) (bitIndex!0 (size!4460 (buf!4958 lt!312720)) (currentByte!9314 lt!312720) (currentBit!9309 lt!312720))))))

(assert (=> d!68649 (or (not (= (bvand lt!312721 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!312213 lt!312212) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!312721 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!312721 (bvsub lt!312213 lt!312212)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!68649 (= lt!312721 (bitIndex!0 (size!4460 (buf!4958 (_2!9230 lt!312223))) (currentByte!9314 (_2!9230 lt!312223)) (currentBit!9309 (_2!9230 lt!312223))))))

(assert (=> d!68649 (= lt!312720 (_2!9228 (moveBitIndex!0 (_2!9230 lt!312223) (bvsub lt!312213 lt!312212))))))

(assert (=> d!68649 (moveBitIndexPrecond!0 (_2!9230 lt!312223) (bvsub lt!312213 lt!312212))))

(assert (=> d!68649 (= (withMovedBitIndex!0 (_2!9230 lt!312223) (bvsub lt!312213 lt!312212)) lt!312720)))

(declare-fun b!200201 () Bool)

(assert (=> b!200201 (= e!137353 (= (size!4460 (buf!4958 (_2!9230 lt!312223))) (size!4460 (buf!4958 lt!312720))))))

(assert (= (and d!68649 res!167614) b!200201))

(declare-fun m!310795 () Bool)

(assert (=> d!68649 m!310795))

(declare-fun m!310797 () Bool)

(assert (=> d!68649 m!310797))

(declare-fun m!310799 () Bool)

(assert (=> d!68649 m!310799))

(declare-fun m!310801 () Bool)

(assert (=> d!68649 m!310801))

(assert (=> b!199991 d!68649))

(declare-fun d!68651 () Bool)

(declare-datatypes ((tuple2!17178 0))(
  ( (tuple2!17179 (_1!9240 Bool) (_2!9240 BitStream!8028)) )
))
(declare-fun lt!312724 () tuple2!17178)

(declare-fun readBit!0 (BitStream!8028) tuple2!17178)

(assert (=> d!68651 (= lt!312724 (readBit!0 (readerFrom!0 (_2!9228 lt!312207) (currentBit!9309 thiss!1204) (currentByte!9314 thiss!1204))))))

(assert (=> d!68651 (= (readBitPure!0 (readerFrom!0 (_2!9228 lt!312207) (currentBit!9309 thiss!1204) (currentByte!9314 thiss!1204))) (tuple2!17153 (_2!9240 lt!312724) (_1!9240 lt!312724)))))

(declare-fun bs!16906 () Bool)

(assert (= bs!16906 d!68651))

(assert (=> bs!16906 m!310389))

(declare-fun m!310803 () Bool)

(assert (=> bs!16906 m!310803))

(assert (=> b!199970 d!68651))

(declare-fun d!68653 () Bool)

(declare-fun e!137356 () Bool)

(assert (=> d!68653 e!137356))

(declare-fun res!167618 () Bool)

(assert (=> d!68653 (=> (not res!167618) (not e!137356))))

(assert (=> d!68653 (= res!167618 (invariant!0 (currentBit!9309 (_2!9228 lt!312207)) (currentByte!9314 (_2!9228 lt!312207)) (size!4460 (buf!4958 (_2!9228 lt!312207)))))))

(assert (=> d!68653 (= (readerFrom!0 (_2!9228 lt!312207) (currentBit!9309 thiss!1204) (currentByte!9314 thiss!1204)) (BitStream!8029 (buf!4958 (_2!9228 lt!312207)) (currentByte!9314 thiss!1204) (currentBit!9309 thiss!1204)))))

(declare-fun b!200204 () Bool)

(assert (=> b!200204 (= e!137356 (invariant!0 (currentBit!9309 thiss!1204) (currentByte!9314 thiss!1204) (size!4460 (buf!4958 (_2!9228 lt!312207)))))))

(assert (= (and d!68653 res!167618) b!200204))

(assert (=> d!68653 m!310753))

(assert (=> b!200204 m!310369))

(assert (=> b!199970 d!68653))

(declare-fun d!68655 () Bool)

(declare-fun e!137359 () Bool)

(assert (=> d!68655 e!137359))

(declare-fun res!167621 () Bool)

(assert (=> d!68655 (=> (not res!167621) (not e!137359))))

(declare-fun lt!312733 () tuple2!17152)

(declare-fun lt!312734 () tuple2!17152)

(assert (=> d!68655 (= res!167621 (= (bitIndex!0 (size!4460 (buf!4958 (_1!9227 lt!312733))) (currentByte!9314 (_1!9227 lt!312733)) (currentBit!9309 (_1!9227 lt!312733))) (bitIndex!0 (size!4460 (buf!4958 (_1!9227 lt!312734))) (currentByte!9314 (_1!9227 lt!312734)) (currentBit!9309 (_1!9227 lt!312734)))))))

(declare-fun lt!312735 () Unit!14201)

(declare-fun lt!312736 () BitStream!8028)

(declare-fun choose!50 (BitStream!8028 BitStream!8028 BitStream!8028 tuple2!17152 tuple2!17152 BitStream!8028 Bool tuple2!17152 tuple2!17152 BitStream!8028 Bool) Unit!14201)

(assert (=> d!68655 (= lt!312735 (choose!50 lt!312204 (_2!9228 lt!312219) lt!312736 lt!312733 (tuple2!17153 (_1!9227 lt!312733) (_2!9227 lt!312733)) (_1!9227 lt!312733) (_2!9227 lt!312733) lt!312734 (tuple2!17153 (_1!9227 lt!312734) (_2!9227 lt!312734)) (_1!9227 lt!312734) (_2!9227 lt!312734)))))

(assert (=> d!68655 (= lt!312734 (readBitPure!0 lt!312736))))

(assert (=> d!68655 (= lt!312733 (readBitPure!0 lt!312204))))

(assert (=> d!68655 (= lt!312736 (BitStream!8029 (buf!4958 (_2!9228 lt!312219)) (currentByte!9314 lt!312204) (currentBit!9309 lt!312204)))))

(assert (=> d!68655 (invariant!0 (currentBit!9309 lt!312204) (currentByte!9314 lt!312204) (size!4460 (buf!4958 (_2!9228 lt!312219))))))

(assert (=> d!68655 (= (readBitPrefixLemma!0 lt!312204 (_2!9228 lt!312219)) lt!312735)))

(declare-fun b!200207 () Bool)

(assert (=> b!200207 (= e!137359 (= (_2!9227 lt!312733) (_2!9227 lt!312734)))))

(assert (= (and d!68655 res!167621) b!200207))

(assert (=> d!68655 m!310373))

(declare-fun m!310805 () Bool)

(assert (=> d!68655 m!310805))

(declare-fun m!310807 () Bool)

(assert (=> d!68655 m!310807))

(declare-fun m!310809 () Bool)

(assert (=> d!68655 m!310809))

(declare-fun m!310811 () Bool)

(assert (=> d!68655 m!310811))

(declare-fun m!310813 () Bool)

(assert (=> d!68655 m!310813))

(assert (=> b!199972 d!68655))

(declare-fun d!68657 () Bool)

(declare-fun lt!312737 () tuple2!17178)

(assert (=> d!68657 (= lt!312737 (readBit!0 (BitStream!8029 (buf!4958 (_2!9228 lt!312219)) (currentByte!9314 thiss!1204) (currentBit!9309 thiss!1204))))))

(assert (=> d!68657 (= (readBitPure!0 (BitStream!8029 (buf!4958 (_2!9228 lt!312219)) (currentByte!9314 thiss!1204) (currentBit!9309 thiss!1204))) (tuple2!17153 (_2!9240 lt!312737) (_1!9240 lt!312737)))))

(declare-fun bs!16907 () Bool)

(assert (= bs!16907 d!68657))

(declare-fun m!310815 () Bool)

(assert (=> bs!16907 m!310815))

(assert (=> b!199972 d!68657))

(declare-fun b!200218 () Bool)

(declare-fun res!167629 () Bool)

(declare-fun e!137364 () Bool)

(assert (=> b!200218 (=> (not res!167629) (not e!137364))))

(declare-fun lt!312793 () tuple2!17158)

(assert (=> b!200218 (= res!167629 (isPrefixOf!0 (_1!9230 lt!312793) thiss!1204))))

(declare-fun b!200219 () Bool)

(declare-fun res!167628 () Bool)

(assert (=> b!200219 (=> (not res!167628) (not e!137364))))

(assert (=> b!200219 (= res!167628 (isPrefixOf!0 (_2!9230 lt!312793) (_2!9228 lt!312219)))))

(declare-fun b!200220 () Bool)

(declare-fun e!137365 () Unit!14201)

(declare-fun Unit!14231 () Unit!14201)

(assert (=> b!200220 (= e!137365 Unit!14231)))

(declare-fun b!200221 () Bool)

(declare-fun lt!312779 () Unit!14201)

(assert (=> b!200221 (= e!137365 lt!312779)))

(declare-fun lt!312797 () (_ BitVec 64))

(assert (=> b!200221 (= lt!312797 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!312787 () (_ BitVec 64))

(assert (=> b!200221 (= lt!312787 (bitIndex!0 (size!4460 (buf!4958 thiss!1204)) (currentByte!9314 thiss!1204) (currentBit!9309 thiss!1204)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!10123 array!10123 (_ BitVec 64) (_ BitVec 64)) Unit!14201)

(assert (=> b!200221 (= lt!312779 (arrayBitRangesEqSymmetric!0 (buf!4958 thiss!1204) (buf!4958 (_2!9228 lt!312219)) lt!312797 lt!312787))))

(assert (=> b!200221 (arrayBitRangesEq!0 (buf!4958 (_2!9228 lt!312219)) (buf!4958 thiss!1204) lt!312797 lt!312787)))

(declare-fun d!68659 () Bool)

(assert (=> d!68659 e!137364))

(declare-fun res!167630 () Bool)

(assert (=> d!68659 (=> (not res!167630) (not e!137364))))

(assert (=> d!68659 (= res!167630 (isPrefixOf!0 (_1!9230 lt!312793) (_2!9230 lt!312793)))))

(declare-fun lt!312789 () BitStream!8028)

(assert (=> d!68659 (= lt!312793 (tuple2!17159 lt!312789 (_2!9228 lt!312219)))))

(declare-fun lt!312782 () Unit!14201)

(declare-fun lt!312783 () Unit!14201)

(assert (=> d!68659 (= lt!312782 lt!312783)))

(assert (=> d!68659 (isPrefixOf!0 lt!312789 (_2!9228 lt!312219))))

(assert (=> d!68659 (= lt!312783 (lemmaIsPrefixTransitive!0 lt!312789 (_2!9228 lt!312219) (_2!9228 lt!312219)))))

(declare-fun lt!312792 () Unit!14201)

(declare-fun lt!312778 () Unit!14201)

(assert (=> d!68659 (= lt!312792 lt!312778)))

(assert (=> d!68659 (isPrefixOf!0 lt!312789 (_2!9228 lt!312219))))

(assert (=> d!68659 (= lt!312778 (lemmaIsPrefixTransitive!0 lt!312789 thiss!1204 (_2!9228 lt!312219)))))

(declare-fun lt!312780 () Unit!14201)

(assert (=> d!68659 (= lt!312780 e!137365)))

(declare-fun c!9990 () Bool)

(assert (=> d!68659 (= c!9990 (not (= (size!4460 (buf!4958 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!312781 () Unit!14201)

(declare-fun lt!312790 () Unit!14201)

(assert (=> d!68659 (= lt!312781 lt!312790)))

(assert (=> d!68659 (isPrefixOf!0 (_2!9228 lt!312219) (_2!9228 lt!312219))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8028) Unit!14201)

(assert (=> d!68659 (= lt!312790 (lemmaIsPrefixRefl!0 (_2!9228 lt!312219)))))

(declare-fun lt!312795 () Unit!14201)

(declare-fun lt!312788 () Unit!14201)

(assert (=> d!68659 (= lt!312795 lt!312788)))

(assert (=> d!68659 (= lt!312788 (lemmaIsPrefixRefl!0 (_2!9228 lt!312219)))))

(declare-fun lt!312784 () Unit!14201)

(declare-fun lt!312794 () Unit!14201)

(assert (=> d!68659 (= lt!312784 lt!312794)))

(assert (=> d!68659 (isPrefixOf!0 lt!312789 lt!312789)))

(assert (=> d!68659 (= lt!312794 (lemmaIsPrefixRefl!0 lt!312789))))

(declare-fun lt!312796 () Unit!14201)

(declare-fun lt!312785 () Unit!14201)

(assert (=> d!68659 (= lt!312796 lt!312785)))

(assert (=> d!68659 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!68659 (= lt!312785 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!68659 (= lt!312789 (BitStream!8029 (buf!4958 (_2!9228 lt!312219)) (currentByte!9314 thiss!1204) (currentBit!9309 thiss!1204)))))

(assert (=> d!68659 (isPrefixOf!0 thiss!1204 (_2!9228 lt!312219))))

(assert (=> d!68659 (= (reader!0 thiss!1204 (_2!9228 lt!312219)) lt!312793)))

(declare-fun lt!312786 () (_ BitVec 64))

(declare-fun b!200222 () Bool)

(declare-fun lt!312791 () (_ BitVec 64))

(assert (=> b!200222 (= e!137364 (= (_1!9230 lt!312793) (withMovedBitIndex!0 (_2!9230 lt!312793) (bvsub lt!312786 lt!312791))))))

(assert (=> b!200222 (or (= (bvand lt!312786 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!312791 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!312786 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!312786 lt!312791) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!200222 (= lt!312791 (bitIndex!0 (size!4460 (buf!4958 (_2!9228 lt!312219))) (currentByte!9314 (_2!9228 lt!312219)) (currentBit!9309 (_2!9228 lt!312219))))))

(assert (=> b!200222 (= lt!312786 (bitIndex!0 (size!4460 (buf!4958 thiss!1204)) (currentByte!9314 thiss!1204) (currentBit!9309 thiss!1204)))))

(assert (= (and d!68659 c!9990) b!200221))

(assert (= (and d!68659 (not c!9990)) b!200220))

(assert (= (and d!68659 res!167630) b!200218))

(assert (= (and b!200218 res!167629) b!200219))

(assert (= (and b!200219 res!167628) b!200222))

(declare-fun m!310817 () Bool)

(assert (=> b!200219 m!310817))

(declare-fun m!310819 () Bool)

(assert (=> d!68659 m!310819))

(declare-fun m!310821 () Bool)

(assert (=> d!68659 m!310821))

(declare-fun m!310823 () Bool)

(assert (=> d!68659 m!310823))

(assert (=> d!68659 m!310399))

(declare-fun m!310825 () Bool)

(assert (=> d!68659 m!310825))

(declare-fun m!310827 () Bool)

(assert (=> d!68659 m!310827))

(declare-fun m!310829 () Bool)

(assert (=> d!68659 m!310829))

(declare-fun m!310831 () Bool)

(assert (=> d!68659 m!310831))

(declare-fun m!310833 () Bool)

(assert (=> d!68659 m!310833))

(declare-fun m!310835 () Bool)

(assert (=> d!68659 m!310835))

(declare-fun m!310837 () Bool)

(assert (=> d!68659 m!310837))

(assert (=> b!200221 m!310381))

(declare-fun m!310839 () Bool)

(assert (=> b!200221 m!310839))

(declare-fun m!310841 () Bool)

(assert (=> b!200221 m!310841))

(declare-fun m!310843 () Bool)

(assert (=> b!200218 m!310843))

(declare-fun m!310845 () Bool)

(assert (=> b!200222 m!310845))

(assert (=> b!200222 m!310397))

(assert (=> b!200222 m!310381))

(assert (=> b!199972 d!68659))

(declare-fun d!68661 () Bool)

(declare-fun lt!312798 () tuple2!17178)

(assert (=> d!68661 (= lt!312798 (readBit!0 (_1!9230 lt!312228)))))

(assert (=> d!68661 (= (readBitPure!0 (_1!9230 lt!312228)) (tuple2!17153 (_2!9240 lt!312798) (_1!9240 lt!312798)))))

(declare-fun bs!16908 () Bool)

(assert (= bs!16908 d!68661))

(declare-fun m!310847 () Bool)

(assert (=> bs!16908 m!310847))

(assert (=> b!199972 d!68661))

(declare-fun lt!312799 () tuple2!17176)

(declare-fun d!68663 () Bool)

(assert (=> d!68663 (= lt!312799 (readNBitsLSBFirstsLoop!0 (_1!9230 lt!312228) nBits!348 i!590 lt!312218))))

(assert (=> d!68663 (= (readNBitsLSBFirstsLoopPure!0 (_1!9230 lt!312228) nBits!348 i!590 lt!312218) (tuple2!17157 (_2!9239 lt!312799) (_1!9239 lt!312799)))))

(declare-fun bs!16909 () Bool)

(assert (= bs!16909 d!68663))

(declare-fun m!310849 () Bool)

(assert (=> bs!16909 m!310849))

(assert (=> b!199972 d!68663))

(declare-fun d!68665 () Bool)

(declare-fun e!137366 () Bool)

(assert (=> d!68665 e!137366))

(declare-fun res!167632 () Bool)

(assert (=> d!68665 (=> (not res!167632) (not e!137366))))

(declare-fun lt!312805 () (_ BitVec 64))

(declare-fun lt!312804 () (_ BitVec 64))

(declare-fun lt!312801 () (_ BitVec 64))

(assert (=> d!68665 (= res!167632 (= lt!312801 (bvsub lt!312805 lt!312804)))))

(assert (=> d!68665 (or (= (bvand lt!312805 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!312804 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!312805 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!312805 lt!312804) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!68665 (= lt!312804 (remainingBits!0 ((_ sign_extend 32) (size!4460 (buf!4958 (_1!9227 lt!312206)))) ((_ sign_extend 32) (currentByte!9314 (_1!9227 lt!312206))) ((_ sign_extend 32) (currentBit!9309 (_1!9227 lt!312206)))))))

(declare-fun lt!312800 () (_ BitVec 64))

(declare-fun lt!312803 () (_ BitVec 64))

(assert (=> d!68665 (= lt!312805 (bvmul lt!312800 lt!312803))))

(assert (=> d!68665 (or (= lt!312800 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!312803 (bvsdiv (bvmul lt!312800 lt!312803) lt!312800)))))

(assert (=> d!68665 (= lt!312803 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!68665 (= lt!312800 ((_ sign_extend 32) (size!4460 (buf!4958 (_1!9227 lt!312206)))))))

(assert (=> d!68665 (= lt!312801 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9314 (_1!9227 lt!312206))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9309 (_1!9227 lt!312206)))))))

(assert (=> d!68665 (invariant!0 (currentBit!9309 (_1!9227 lt!312206)) (currentByte!9314 (_1!9227 lt!312206)) (size!4460 (buf!4958 (_1!9227 lt!312206))))))

(assert (=> d!68665 (= (bitIndex!0 (size!4460 (buf!4958 (_1!9227 lt!312206))) (currentByte!9314 (_1!9227 lt!312206)) (currentBit!9309 (_1!9227 lt!312206))) lt!312801)))

(declare-fun b!200223 () Bool)

(declare-fun res!167631 () Bool)

(assert (=> b!200223 (=> (not res!167631) (not e!137366))))

(assert (=> b!200223 (= res!167631 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!312801))))

(declare-fun b!200224 () Bool)

(declare-fun lt!312802 () (_ BitVec 64))

(assert (=> b!200224 (= e!137366 (bvsle lt!312801 (bvmul lt!312802 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!200224 (or (= lt!312802 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!312802 #b0000000000000000000000000000000000000000000000000000000000001000) lt!312802)))))

(assert (=> b!200224 (= lt!312802 ((_ sign_extend 32) (size!4460 (buf!4958 (_1!9227 lt!312206)))))))

(assert (= (and d!68665 res!167632) b!200223))

(assert (= (and b!200223 res!167631) b!200224))

(declare-fun m!310851 () Bool)

(assert (=> d!68665 m!310851))

(declare-fun m!310853 () Bool)

(assert (=> d!68665 m!310853))

(assert (=> b!199972 d!68665))

(declare-fun d!68667 () Bool)

(assert (=> d!68667 (validate_offset_bits!1 ((_ sign_extend 32) (size!4460 (buf!4958 (_2!9228 lt!312219)))) ((_ sign_extend 32) (currentByte!9314 (_2!9228 lt!312207))) ((_ sign_extend 32) (currentBit!9309 (_2!9228 lt!312207))) lt!312216)))

(declare-fun lt!312808 () Unit!14201)

(declare-fun choose!9 (BitStream!8028 array!10123 (_ BitVec 64) BitStream!8028) Unit!14201)

(assert (=> d!68667 (= lt!312808 (choose!9 (_2!9228 lt!312207) (buf!4958 (_2!9228 lt!312219)) lt!312216 (BitStream!8029 (buf!4958 (_2!9228 lt!312219)) (currentByte!9314 (_2!9228 lt!312207)) (currentBit!9309 (_2!9228 lt!312207)))))))

(assert (=> d!68667 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9228 lt!312207) (buf!4958 (_2!9228 lt!312219)) lt!312216) lt!312808)))

(declare-fun bs!16910 () Bool)

(assert (= bs!16910 d!68667))

(assert (=> bs!16910 m!310371))

(declare-fun m!310855 () Bool)

(assert (=> bs!16910 m!310855))

(assert (=> b!199972 d!68667))

(declare-fun b!200225 () Bool)

(declare-fun res!167634 () Bool)

(declare-fun e!137367 () Bool)

(assert (=> b!200225 (=> (not res!167634) (not e!137367))))

(declare-fun lt!312824 () tuple2!17158)

(assert (=> b!200225 (= res!167634 (isPrefixOf!0 (_1!9230 lt!312824) (_2!9228 lt!312207)))))

(declare-fun b!200226 () Bool)

(declare-fun res!167633 () Bool)

(assert (=> b!200226 (=> (not res!167633) (not e!137367))))

(assert (=> b!200226 (= res!167633 (isPrefixOf!0 (_2!9230 lt!312824) (_2!9228 lt!312219)))))

(declare-fun b!200227 () Bool)

(declare-fun e!137368 () Unit!14201)

(declare-fun Unit!14232 () Unit!14201)

(assert (=> b!200227 (= e!137368 Unit!14232)))

(declare-fun b!200228 () Bool)

(declare-fun lt!312810 () Unit!14201)

(assert (=> b!200228 (= e!137368 lt!312810)))

(declare-fun lt!312828 () (_ BitVec 64))

(assert (=> b!200228 (= lt!312828 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!312818 () (_ BitVec 64))

(assert (=> b!200228 (= lt!312818 (bitIndex!0 (size!4460 (buf!4958 (_2!9228 lt!312207))) (currentByte!9314 (_2!9228 lt!312207)) (currentBit!9309 (_2!9228 lt!312207))))))

(assert (=> b!200228 (= lt!312810 (arrayBitRangesEqSymmetric!0 (buf!4958 (_2!9228 lt!312207)) (buf!4958 (_2!9228 lt!312219)) lt!312828 lt!312818))))

(assert (=> b!200228 (arrayBitRangesEq!0 (buf!4958 (_2!9228 lt!312219)) (buf!4958 (_2!9228 lt!312207)) lt!312828 lt!312818)))

(declare-fun d!68669 () Bool)

(assert (=> d!68669 e!137367))

(declare-fun res!167635 () Bool)

(assert (=> d!68669 (=> (not res!167635) (not e!137367))))

(assert (=> d!68669 (= res!167635 (isPrefixOf!0 (_1!9230 lt!312824) (_2!9230 lt!312824)))))

(declare-fun lt!312820 () BitStream!8028)

(assert (=> d!68669 (= lt!312824 (tuple2!17159 lt!312820 (_2!9228 lt!312219)))))

(declare-fun lt!312813 () Unit!14201)

(declare-fun lt!312814 () Unit!14201)

(assert (=> d!68669 (= lt!312813 lt!312814)))

(assert (=> d!68669 (isPrefixOf!0 lt!312820 (_2!9228 lt!312219))))

(assert (=> d!68669 (= lt!312814 (lemmaIsPrefixTransitive!0 lt!312820 (_2!9228 lt!312219) (_2!9228 lt!312219)))))

(declare-fun lt!312823 () Unit!14201)

(declare-fun lt!312809 () Unit!14201)

(assert (=> d!68669 (= lt!312823 lt!312809)))

(assert (=> d!68669 (isPrefixOf!0 lt!312820 (_2!9228 lt!312219))))

(assert (=> d!68669 (= lt!312809 (lemmaIsPrefixTransitive!0 lt!312820 (_2!9228 lt!312207) (_2!9228 lt!312219)))))

(declare-fun lt!312811 () Unit!14201)

(assert (=> d!68669 (= lt!312811 e!137368)))

(declare-fun c!9991 () Bool)

(assert (=> d!68669 (= c!9991 (not (= (size!4460 (buf!4958 (_2!9228 lt!312207))) #b00000000000000000000000000000000)))))

(declare-fun lt!312812 () Unit!14201)

(declare-fun lt!312821 () Unit!14201)

(assert (=> d!68669 (= lt!312812 lt!312821)))

(assert (=> d!68669 (isPrefixOf!0 (_2!9228 lt!312219) (_2!9228 lt!312219))))

(assert (=> d!68669 (= lt!312821 (lemmaIsPrefixRefl!0 (_2!9228 lt!312219)))))

(declare-fun lt!312826 () Unit!14201)

(declare-fun lt!312819 () Unit!14201)

(assert (=> d!68669 (= lt!312826 lt!312819)))

(assert (=> d!68669 (= lt!312819 (lemmaIsPrefixRefl!0 (_2!9228 lt!312219)))))

(declare-fun lt!312815 () Unit!14201)

(declare-fun lt!312825 () Unit!14201)

(assert (=> d!68669 (= lt!312815 lt!312825)))

(assert (=> d!68669 (isPrefixOf!0 lt!312820 lt!312820)))

(assert (=> d!68669 (= lt!312825 (lemmaIsPrefixRefl!0 lt!312820))))

(declare-fun lt!312827 () Unit!14201)

(declare-fun lt!312816 () Unit!14201)

(assert (=> d!68669 (= lt!312827 lt!312816)))

(assert (=> d!68669 (isPrefixOf!0 (_2!9228 lt!312207) (_2!9228 lt!312207))))

(assert (=> d!68669 (= lt!312816 (lemmaIsPrefixRefl!0 (_2!9228 lt!312207)))))

(assert (=> d!68669 (= lt!312820 (BitStream!8029 (buf!4958 (_2!9228 lt!312219)) (currentByte!9314 (_2!9228 lt!312207)) (currentBit!9309 (_2!9228 lt!312207))))))

(assert (=> d!68669 (isPrefixOf!0 (_2!9228 lt!312207) (_2!9228 lt!312219))))

(assert (=> d!68669 (= (reader!0 (_2!9228 lt!312207) (_2!9228 lt!312219)) lt!312824)))

(declare-fun lt!312822 () (_ BitVec 64))

(declare-fun lt!312817 () (_ BitVec 64))

(declare-fun b!200229 () Bool)

(assert (=> b!200229 (= e!137367 (= (_1!9230 lt!312824) (withMovedBitIndex!0 (_2!9230 lt!312824) (bvsub lt!312817 lt!312822))))))

(assert (=> b!200229 (or (= (bvand lt!312817 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!312822 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!312817 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!312817 lt!312822) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!200229 (= lt!312822 (bitIndex!0 (size!4460 (buf!4958 (_2!9228 lt!312219))) (currentByte!9314 (_2!9228 lt!312219)) (currentBit!9309 (_2!9228 lt!312219))))))

(assert (=> b!200229 (= lt!312817 (bitIndex!0 (size!4460 (buf!4958 (_2!9228 lt!312207))) (currentByte!9314 (_2!9228 lt!312207)) (currentBit!9309 (_2!9228 lt!312207))))))

(assert (= (and d!68669 c!9991) b!200228))

(assert (= (and d!68669 (not c!9991)) b!200227))

(assert (= (and d!68669 res!167635) b!200225))

(assert (= (and b!200225 res!167634) b!200226))

(assert (= (and b!200226 res!167633) b!200229))

(declare-fun m!310857 () Bool)

(assert (=> b!200226 m!310857))

(declare-fun m!310859 () Bool)

(assert (=> d!68669 m!310859))

(assert (=> d!68669 m!310821))

(declare-fun m!310861 () Bool)

(assert (=> d!68669 m!310861))

(assert (=> d!68669 m!310341))

(declare-fun m!310863 () Bool)

(assert (=> d!68669 m!310863))

(declare-fun m!310865 () Bool)

(assert (=> d!68669 m!310865))

(assert (=> d!68669 m!310829))

(declare-fun m!310867 () Bool)

(assert (=> d!68669 m!310867))

(declare-fun m!310869 () Bool)

(assert (=> d!68669 m!310869))

(declare-fun m!310871 () Bool)

(assert (=> d!68669 m!310871))

(declare-fun m!310873 () Bool)

(assert (=> d!68669 m!310873))

(assert (=> b!200228 m!310379))

(declare-fun m!310875 () Bool)

(assert (=> b!200228 m!310875))

(declare-fun m!310877 () Bool)

(assert (=> b!200228 m!310877))

(declare-fun m!310879 () Bool)

(assert (=> b!200225 m!310879))

(declare-fun m!310881 () Bool)

(assert (=> b!200229 m!310881))

(assert (=> b!200229 m!310397))

(assert (=> b!200229 m!310379))

(assert (=> b!199972 d!68669))

(declare-fun d!68671 () Bool)

(assert (=> d!68671 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4460 (buf!4958 (_2!9228 lt!312219)))) ((_ sign_extend 32) (currentByte!9314 thiss!1204)) ((_ sign_extend 32) (currentBit!9309 thiss!1204)) lt!312215) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4460 (buf!4958 (_2!9228 lt!312219)))) ((_ sign_extend 32) (currentByte!9314 thiss!1204)) ((_ sign_extend 32) (currentBit!9309 thiss!1204))) lt!312215))))

(declare-fun bs!16911 () Bool)

(assert (= bs!16911 d!68671))

(declare-fun m!310883 () Bool)

(assert (=> bs!16911 m!310883))

(assert (=> b!199972 d!68671))

(declare-fun lt!312829 () tuple2!17176)

(declare-fun d!68673 () Bool)

(assert (=> d!68673 (= lt!312829 (readNBitsLSBFirstsLoop!0 (_1!9230 lt!312223) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!312224))))

(assert (=> d!68673 (= (readNBitsLSBFirstsLoopPure!0 (_1!9230 lt!312223) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!312224) (tuple2!17157 (_2!9239 lt!312829) (_1!9239 lt!312829)))))

(declare-fun bs!16912 () Bool)

(assert (= bs!16912 d!68673))

(declare-fun m!310885 () Bool)

(assert (=> bs!16912 m!310885))

(assert (=> b!199972 d!68673))

(declare-fun d!68675 () Bool)

(declare-fun lt!312830 () tuple2!17178)

(assert (=> d!68675 (= lt!312830 (readBit!0 lt!312204))))

(assert (=> d!68675 (= (readBitPure!0 lt!312204) (tuple2!17153 (_2!9240 lt!312830) (_1!9240 lt!312830)))))

(declare-fun bs!16913 () Bool)

(assert (= bs!16913 d!68675))

(declare-fun m!310887 () Bool)

(assert (=> bs!16913 m!310887))

(assert (=> b!199972 d!68675))

(declare-fun d!68677 () Bool)

(declare-fun e!137369 () Bool)

(assert (=> d!68677 e!137369))

(declare-fun res!167637 () Bool)

(assert (=> d!68677 (=> (not res!167637) (not e!137369))))

(declare-fun lt!312836 () (_ BitVec 64))

(declare-fun lt!312832 () (_ BitVec 64))

(declare-fun lt!312835 () (_ BitVec 64))

(assert (=> d!68677 (= res!167637 (= lt!312832 (bvsub lt!312836 lt!312835)))))

(assert (=> d!68677 (or (= (bvand lt!312836 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!312835 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!312836 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!312836 lt!312835) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!68677 (= lt!312835 (remainingBits!0 ((_ sign_extend 32) (size!4460 (buf!4958 (_1!9227 lt!312205)))) ((_ sign_extend 32) (currentByte!9314 (_1!9227 lt!312205))) ((_ sign_extend 32) (currentBit!9309 (_1!9227 lt!312205)))))))

(declare-fun lt!312831 () (_ BitVec 64))

(declare-fun lt!312834 () (_ BitVec 64))

(assert (=> d!68677 (= lt!312836 (bvmul lt!312831 lt!312834))))

(assert (=> d!68677 (or (= lt!312831 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!312834 (bvsdiv (bvmul lt!312831 lt!312834) lt!312831)))))

(assert (=> d!68677 (= lt!312834 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!68677 (= lt!312831 ((_ sign_extend 32) (size!4460 (buf!4958 (_1!9227 lt!312205)))))))

(assert (=> d!68677 (= lt!312832 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9314 (_1!9227 lt!312205))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9309 (_1!9227 lt!312205)))))))

(assert (=> d!68677 (invariant!0 (currentBit!9309 (_1!9227 lt!312205)) (currentByte!9314 (_1!9227 lt!312205)) (size!4460 (buf!4958 (_1!9227 lt!312205))))))

(assert (=> d!68677 (= (bitIndex!0 (size!4460 (buf!4958 (_1!9227 lt!312205))) (currentByte!9314 (_1!9227 lt!312205)) (currentBit!9309 (_1!9227 lt!312205))) lt!312832)))

(declare-fun b!200230 () Bool)

(declare-fun res!167636 () Bool)

(assert (=> b!200230 (=> (not res!167636) (not e!137369))))

(assert (=> b!200230 (= res!167636 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!312832))))

(declare-fun b!200231 () Bool)

(declare-fun lt!312833 () (_ BitVec 64))

(assert (=> b!200231 (= e!137369 (bvsle lt!312832 (bvmul lt!312833 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!200231 (or (= lt!312833 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!312833 #b0000000000000000000000000000000000000000000000000000000000001000) lt!312833)))))

(assert (=> b!200231 (= lt!312833 ((_ sign_extend 32) (size!4460 (buf!4958 (_1!9227 lt!312205)))))))

(assert (= (and d!68677 res!167637) b!200230))

(assert (= (and b!200230 res!167636) b!200231))

(declare-fun m!310889 () Bool)

(assert (=> d!68677 m!310889))

(declare-fun m!310891 () Bool)

(assert (=> d!68677 m!310891))

(assert (=> b!199972 d!68677))

(declare-fun d!68679 () Bool)

(assert (=> d!68679 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!199972 d!68679))

(declare-fun d!68681 () Bool)

(assert (=> d!68681 (validate_offset_bits!1 ((_ sign_extend 32) (size!4460 (buf!4958 (_2!9228 lt!312219)))) ((_ sign_extend 32) (currentByte!9314 thiss!1204)) ((_ sign_extend 32) (currentBit!9309 thiss!1204)) lt!312215)))

(declare-fun lt!312837 () Unit!14201)

(assert (=> d!68681 (= lt!312837 (choose!9 thiss!1204 (buf!4958 (_2!9228 lt!312219)) lt!312215 (BitStream!8029 (buf!4958 (_2!9228 lt!312219)) (currentByte!9314 thiss!1204) (currentBit!9309 thiss!1204))))))

(assert (=> d!68681 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4958 (_2!9228 lt!312219)) lt!312215) lt!312837)))

(declare-fun bs!16914 () Bool)

(assert (= bs!16914 d!68681))

(assert (=> bs!16914 m!310345))

(declare-fun m!310893 () Bool)

(assert (=> bs!16914 m!310893))

(assert (=> b!199972 d!68681))

(declare-fun d!68683 () Bool)

(assert (=> d!68683 (= (invariant!0 (currentBit!9309 thiss!1204) (currentByte!9314 thiss!1204) (size!4460 (buf!4958 (_2!9228 lt!312207)))) (and (bvsge (currentBit!9309 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9309 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9314 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9314 thiss!1204) (size!4460 (buf!4958 (_2!9228 lt!312207)))) (and (= (currentBit!9309 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9314 thiss!1204) (size!4460 (buf!4958 (_2!9228 lt!312207))))))))))

(assert (=> b!199972 d!68683))

(declare-fun d!68685 () Bool)

(assert (=> d!68685 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4460 (buf!4958 (_2!9228 lt!312219)))) ((_ sign_extend 32) (currentByte!9314 (_2!9228 lt!312207))) ((_ sign_extend 32) (currentBit!9309 (_2!9228 lt!312207))) lt!312216) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4460 (buf!4958 (_2!9228 lt!312219)))) ((_ sign_extend 32) (currentByte!9314 (_2!9228 lt!312207))) ((_ sign_extend 32) (currentBit!9309 (_2!9228 lt!312207)))) lt!312216))))

(declare-fun bs!16915 () Bool)

(assert (= bs!16915 d!68685))

(declare-fun m!310895 () Bool)

(assert (=> bs!16915 m!310895))

(assert (=> b!199972 d!68685))

(declare-fun d!68687 () Bool)

(declare-fun res!167640 () Bool)

(declare-fun e!137370 () Bool)

(assert (=> d!68687 (=> (not res!167640) (not e!137370))))

(assert (=> d!68687 (= res!167640 (= (size!4460 (buf!4958 thiss!1204)) (size!4460 (buf!4958 (_2!9228 lt!312207)))))))

(assert (=> d!68687 (= (isPrefixOf!0 thiss!1204 (_2!9228 lt!312207)) e!137370)))

(declare-fun b!200232 () Bool)

(declare-fun res!167638 () Bool)

(assert (=> b!200232 (=> (not res!167638) (not e!137370))))

(assert (=> b!200232 (= res!167638 (bvsle (bitIndex!0 (size!4460 (buf!4958 thiss!1204)) (currentByte!9314 thiss!1204) (currentBit!9309 thiss!1204)) (bitIndex!0 (size!4460 (buf!4958 (_2!9228 lt!312207))) (currentByte!9314 (_2!9228 lt!312207)) (currentBit!9309 (_2!9228 lt!312207)))))))

(declare-fun b!200233 () Bool)

(declare-fun e!137371 () Bool)

(assert (=> b!200233 (= e!137370 e!137371)))

(declare-fun res!167639 () Bool)

(assert (=> b!200233 (=> res!167639 e!137371)))

(assert (=> b!200233 (= res!167639 (= (size!4460 (buf!4958 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!200234 () Bool)

(assert (=> b!200234 (= e!137371 (arrayBitRangesEq!0 (buf!4958 thiss!1204) (buf!4958 (_2!9228 lt!312207)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4460 (buf!4958 thiss!1204)) (currentByte!9314 thiss!1204) (currentBit!9309 thiss!1204))))))

(assert (= (and d!68687 res!167640) b!200232))

(assert (= (and b!200232 res!167638) b!200233))

(assert (= (and b!200233 (not res!167639)) b!200234))

(assert (=> b!200232 m!310381))

(assert (=> b!200232 m!310379))

(assert (=> b!200234 m!310381))

(assert (=> b!200234 m!310381))

(declare-fun m!310897 () Bool)

(assert (=> b!200234 m!310897))

(assert (=> b!199971 d!68687))

(declare-fun d!68689 () Bool)

(assert (=> d!68689 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4460 (buf!4958 thiss!1204))) ((_ sign_extend 32) (currentByte!9314 thiss!1204)) ((_ sign_extend 32) (currentBit!9309 thiss!1204)) lt!312215) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4460 (buf!4958 thiss!1204))) ((_ sign_extend 32) (currentByte!9314 thiss!1204)) ((_ sign_extend 32) (currentBit!9309 thiss!1204))) lt!312215))))

(declare-fun bs!16916 () Bool)

(assert (= bs!16916 d!68689))

(assert (=> bs!16916 m!310755))

(assert (=> b!199989 d!68689))

(declare-fun d!68691 () Bool)

(assert (=> d!68691 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9309 thiss!1204) (currentByte!9314 thiss!1204) (size!4460 (buf!4958 thiss!1204))))))

(declare-fun bs!16917 () Bool)

(assert (= bs!16917 d!68691))

(assert (=> bs!16917 m!310377))

(assert (=> start!42298 d!68691))

(declare-fun d!68693 () Bool)

(declare-fun e!137372 () Bool)

(assert (=> d!68693 e!137372))

(declare-fun res!167641 () Bool)

(assert (=> d!68693 (=> (not res!167641) (not e!137372))))

(declare-fun lt!312839 () (_ BitVec 64))

(declare-fun lt!312838 () BitStream!8028)

(assert (=> d!68693 (= res!167641 (= (bvadd lt!312839 (bvsub lt!312229 lt!312212)) (bitIndex!0 (size!4460 (buf!4958 lt!312838)) (currentByte!9314 lt!312838) (currentBit!9309 lt!312838))))))

(assert (=> d!68693 (or (not (= (bvand lt!312839 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!312229 lt!312212) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!312839 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!312839 (bvsub lt!312229 lt!312212)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!68693 (= lt!312839 (bitIndex!0 (size!4460 (buf!4958 (_2!9230 lt!312228))) (currentByte!9314 (_2!9230 lt!312228)) (currentBit!9309 (_2!9230 lt!312228))))))

(assert (=> d!68693 (= lt!312838 (_2!9228 (moveBitIndex!0 (_2!9230 lt!312228) (bvsub lt!312229 lt!312212))))))

(assert (=> d!68693 (moveBitIndexPrecond!0 (_2!9230 lt!312228) (bvsub lt!312229 lt!312212))))

(assert (=> d!68693 (= (withMovedBitIndex!0 (_2!9230 lt!312228) (bvsub lt!312229 lt!312212)) lt!312838)))

(declare-fun b!200235 () Bool)

(assert (=> b!200235 (= e!137372 (= (size!4460 (buf!4958 (_2!9230 lt!312228))) (size!4460 (buf!4958 lt!312838))))))

(assert (= (and d!68693 res!167641) b!200235))

(declare-fun m!310899 () Bool)

(assert (=> d!68693 m!310899))

(assert (=> d!68693 m!310417))

(declare-fun m!310901 () Bool)

(assert (=> d!68693 m!310901))

(declare-fun m!310903 () Bool)

(assert (=> d!68693 m!310903))

(assert (=> b!199980 d!68693))

(declare-fun d!68695 () Bool)

(declare-fun e!137373 () Bool)

(assert (=> d!68695 e!137373))

(declare-fun res!167643 () Bool)

(assert (=> d!68695 (=> (not res!167643) (not e!137373))))

(declare-fun lt!312841 () (_ BitVec 64))

(declare-fun lt!312845 () (_ BitVec 64))

(declare-fun lt!312844 () (_ BitVec 64))

(assert (=> d!68695 (= res!167643 (= lt!312841 (bvsub lt!312845 lt!312844)))))

(assert (=> d!68695 (or (= (bvand lt!312845 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!312844 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!312845 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!312845 lt!312844) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!68695 (= lt!312844 (remainingBits!0 ((_ sign_extend 32) (size!4460 (buf!4958 (_1!9227 lt!312210)))) ((_ sign_extend 32) (currentByte!9314 (_1!9227 lt!312210))) ((_ sign_extend 32) (currentBit!9309 (_1!9227 lt!312210)))))))

(declare-fun lt!312840 () (_ BitVec 64))

(declare-fun lt!312843 () (_ BitVec 64))

(assert (=> d!68695 (= lt!312845 (bvmul lt!312840 lt!312843))))

(assert (=> d!68695 (or (= lt!312840 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!312843 (bvsdiv (bvmul lt!312840 lt!312843) lt!312840)))))

(assert (=> d!68695 (= lt!312843 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!68695 (= lt!312840 ((_ sign_extend 32) (size!4460 (buf!4958 (_1!9227 lt!312210)))))))

(assert (=> d!68695 (= lt!312841 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9314 (_1!9227 lt!312210))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9309 (_1!9227 lt!312210)))))))

(assert (=> d!68695 (invariant!0 (currentBit!9309 (_1!9227 lt!312210)) (currentByte!9314 (_1!9227 lt!312210)) (size!4460 (buf!4958 (_1!9227 lt!312210))))))

(assert (=> d!68695 (= (bitIndex!0 (size!4460 (buf!4958 (_1!9227 lt!312210))) (currentByte!9314 (_1!9227 lt!312210)) (currentBit!9309 (_1!9227 lt!312210))) lt!312841)))

(declare-fun b!200236 () Bool)

(declare-fun res!167642 () Bool)

(assert (=> b!200236 (=> (not res!167642) (not e!137373))))

(assert (=> b!200236 (= res!167642 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!312841))))

(declare-fun b!200237 () Bool)

(declare-fun lt!312842 () (_ BitVec 64))

(assert (=> b!200237 (= e!137373 (bvsle lt!312841 (bvmul lt!312842 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!200237 (or (= lt!312842 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!312842 #b0000000000000000000000000000000000000000000000000000000000001000) lt!312842)))))

(assert (=> b!200237 (= lt!312842 ((_ sign_extend 32) (size!4460 (buf!4958 (_1!9227 lt!312210)))))))

(assert (= (and d!68695 res!167643) b!200236))

(assert (= (and b!200236 res!167642) b!200237))

(declare-fun m!310905 () Bool)

(assert (=> d!68695 m!310905))

(declare-fun m!310907 () Bool)

(assert (=> d!68695 m!310907))

(assert (=> b!199979 d!68695))

(declare-fun d!68697 () Bool)

(declare-fun e!137374 () Bool)

(assert (=> d!68697 e!137374))

(declare-fun res!167645 () Bool)

(assert (=> d!68697 (=> (not res!167645) (not e!137374))))

(declare-fun lt!312851 () (_ BitVec 64))

(declare-fun lt!312850 () (_ BitVec 64))

(declare-fun lt!312847 () (_ BitVec 64))

(assert (=> d!68697 (= res!167645 (= lt!312847 (bvsub lt!312851 lt!312850)))))

(assert (=> d!68697 (or (= (bvand lt!312851 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!312850 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!312851 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!312851 lt!312850) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!68697 (= lt!312850 (remainingBits!0 ((_ sign_extend 32) (size!4460 (buf!4958 (_2!9228 lt!312219)))) ((_ sign_extend 32) (currentByte!9314 (_2!9228 lt!312219))) ((_ sign_extend 32) (currentBit!9309 (_2!9228 lt!312219)))))))

(declare-fun lt!312846 () (_ BitVec 64))

(declare-fun lt!312849 () (_ BitVec 64))

(assert (=> d!68697 (= lt!312851 (bvmul lt!312846 lt!312849))))

(assert (=> d!68697 (or (= lt!312846 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!312849 (bvsdiv (bvmul lt!312846 lt!312849) lt!312846)))))

(assert (=> d!68697 (= lt!312849 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!68697 (= lt!312846 ((_ sign_extend 32) (size!4460 (buf!4958 (_2!9228 lt!312219)))))))

(assert (=> d!68697 (= lt!312847 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9314 (_2!9228 lt!312219))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9309 (_2!9228 lt!312219)))))))

(assert (=> d!68697 (invariant!0 (currentBit!9309 (_2!9228 lt!312219)) (currentByte!9314 (_2!9228 lt!312219)) (size!4460 (buf!4958 (_2!9228 lt!312219))))))

(assert (=> d!68697 (= (bitIndex!0 (size!4460 (buf!4958 (_2!9228 lt!312219))) (currentByte!9314 (_2!9228 lt!312219)) (currentBit!9309 (_2!9228 lt!312219))) lt!312847)))

(declare-fun b!200238 () Bool)

(declare-fun res!167644 () Bool)

(assert (=> b!200238 (=> (not res!167644) (not e!137374))))

(assert (=> b!200238 (= res!167644 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!312847))))

(declare-fun b!200239 () Bool)

(declare-fun lt!312848 () (_ BitVec 64))

(assert (=> b!200239 (= e!137374 (bvsle lt!312847 (bvmul lt!312848 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!200239 (or (= lt!312848 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!312848 #b0000000000000000000000000000000000000000000000000000000000001000) lt!312848)))))

(assert (=> b!200239 (= lt!312848 ((_ sign_extend 32) (size!4460 (buf!4958 (_2!9228 lt!312219)))))))

(assert (= (and d!68697 res!167645) b!200238))

(assert (= (and b!200238 res!167644) b!200239))

(declare-fun m!310909 () Bool)

(assert (=> d!68697 m!310909))

(assert (=> d!68697 m!310385))

(assert (=> b!199990 d!68697))

(declare-fun d!68699 () Bool)

(declare-fun res!167648 () Bool)

(declare-fun e!137375 () Bool)

(assert (=> d!68699 (=> (not res!167648) (not e!137375))))

(assert (=> d!68699 (= res!167648 (= (size!4460 (buf!4958 thiss!1204)) (size!4460 (buf!4958 (_2!9228 lt!312219)))))))

(assert (=> d!68699 (= (isPrefixOf!0 thiss!1204 (_2!9228 lt!312219)) e!137375)))

(declare-fun b!200240 () Bool)

(declare-fun res!167646 () Bool)

(assert (=> b!200240 (=> (not res!167646) (not e!137375))))

(assert (=> b!200240 (= res!167646 (bvsle (bitIndex!0 (size!4460 (buf!4958 thiss!1204)) (currentByte!9314 thiss!1204) (currentBit!9309 thiss!1204)) (bitIndex!0 (size!4460 (buf!4958 (_2!9228 lt!312219))) (currentByte!9314 (_2!9228 lt!312219)) (currentBit!9309 (_2!9228 lt!312219)))))))

(declare-fun b!200241 () Bool)

(declare-fun e!137376 () Bool)

(assert (=> b!200241 (= e!137375 e!137376)))

(declare-fun res!167647 () Bool)

(assert (=> b!200241 (=> res!167647 e!137376)))

(assert (=> b!200241 (= res!167647 (= (size!4460 (buf!4958 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!200242 () Bool)

(assert (=> b!200242 (= e!137376 (arrayBitRangesEq!0 (buf!4958 thiss!1204) (buf!4958 (_2!9228 lt!312219)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4460 (buf!4958 thiss!1204)) (currentByte!9314 thiss!1204) (currentBit!9309 thiss!1204))))))

(assert (= (and d!68699 res!167648) b!200240))

(assert (= (and b!200240 res!167646) b!200241))

(assert (= (and b!200241 (not res!167647)) b!200242))

(assert (=> b!200240 m!310381))

(assert (=> b!200240 m!310397))

(assert (=> b!200242 m!310381))

(assert (=> b!200242 m!310381))

(declare-fun m!310911 () Bool)

(assert (=> b!200242 m!310911))

(assert (=> b!199990 d!68699))

(declare-fun d!68701 () Bool)

(assert (=> d!68701 (isPrefixOf!0 thiss!1204 (_2!9228 lt!312219))))

(declare-fun lt!312854 () Unit!14201)

(declare-fun choose!30 (BitStream!8028 BitStream!8028 BitStream!8028) Unit!14201)

(assert (=> d!68701 (= lt!312854 (choose!30 thiss!1204 (_2!9228 lt!312207) (_2!9228 lt!312219)))))

(assert (=> d!68701 (isPrefixOf!0 thiss!1204 (_2!9228 lt!312207))))

(assert (=> d!68701 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9228 lt!312207) (_2!9228 lt!312219)) lt!312854)))

(declare-fun bs!16918 () Bool)

(assert (= bs!16918 d!68701))

(assert (=> bs!16918 m!310399))

(declare-fun m!310913 () Bool)

(assert (=> bs!16918 m!310913))

(assert (=> bs!16918 m!310339))

(assert (=> b!199990 d!68701))

(declare-fun b!200423 () Bool)

(declare-fun e!137481 () Bool)

(declare-fun lt!313428 () tuple2!17156)

(declare-fun lt!313400 () tuple2!17158)

(assert (=> b!200423 (= e!137481 (= (_1!9229 lt!313428) (_2!9230 lt!313400)))))

(declare-fun b!200424 () Bool)

(declare-fun res!167805 () Bool)

(declare-fun e!137482 () Bool)

(assert (=> b!200424 (=> (not res!167805) (not e!137482))))

(declare-fun lt!313406 () (_ BitVec 64))

(declare-fun lt!313442 () (_ BitVec 64))

(declare-fun lt!313453 () tuple2!17154)

(assert (=> b!200424 (= res!167805 (= (bitIndex!0 (size!4460 (buf!4958 (_2!9228 lt!313453))) (currentByte!9314 (_2!9228 lt!313453)) (currentBit!9309 (_2!9228 lt!313453))) (bvsub lt!313442 lt!313406)))))

(assert (=> b!200424 (or (= (bvand lt!313442 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!313406 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!313442 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!313442 lt!313406) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!200424 (= lt!313406 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!313413 () (_ BitVec 64))

(declare-fun lt!313445 () (_ BitVec 64))

(assert (=> b!200424 (= lt!313442 (bvadd lt!313413 lt!313445))))

(assert (=> b!200424 (or (not (= (bvand lt!313413 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!313445 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!313413 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!313413 lt!313445) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!200424 (= lt!313445 ((_ sign_extend 32) nBits!348))))

(assert (=> b!200424 (= lt!313413 (bitIndex!0 (size!4460 (buf!4958 (_2!9228 lt!312207))) (currentByte!9314 (_2!9228 lt!312207)) (currentBit!9309 (_2!9228 lt!312207))))))

(declare-fun b!200425 () Bool)

(declare-fun res!167806 () Bool)

(assert (=> b!200425 (=> (not res!167806) (not e!137482))))

(assert (=> b!200425 (= res!167806 (isPrefixOf!0 (_2!9228 lt!312207) (_2!9228 lt!313453)))))

(declare-fun b!200426 () Bool)

(declare-fun res!167802 () Bool)

(declare-fun lt!313444 () tuple2!17154)

(assert (=> b!200426 (= res!167802 (= (bitIndex!0 (size!4460 (buf!4958 (_2!9228 lt!313444))) (currentByte!9314 (_2!9228 lt!313444)) (currentBit!9309 (_2!9228 lt!313444))) (bvadd (bitIndex!0 (size!4460 (buf!4958 (_2!9228 lt!312207))) (currentByte!9314 (_2!9228 lt!312207)) (currentBit!9309 (_2!9228 lt!312207))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun e!137478 () Bool)

(assert (=> b!200426 (=> (not res!167802) (not e!137478))))

(declare-fun d!68703 () Bool)

(assert (=> d!68703 e!137482))

(declare-fun res!167803 () Bool)

(assert (=> d!68703 (=> (not res!167803) (not e!137482))))

(assert (=> d!68703 (= res!167803 (invariant!0 (currentBit!9309 (_2!9228 lt!313453)) (currentByte!9314 (_2!9228 lt!313453)) (size!4460 (buf!4958 (_2!9228 lt!313453)))))))

(declare-fun e!137480 () tuple2!17154)

(assert (=> d!68703 (= lt!313453 e!137480)))

(declare-fun c!10008 () Bool)

(assert (=> d!68703 (= c!10008 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!68703 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!68703 (= (appendBitsLSBFirstLoopTR!0 (_2!9228 lt!312207) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!313453)))

(declare-fun b!200427 () Bool)

(declare-fun e!137483 () (_ BitVec 64))

(assert (=> b!200427 (= e!137483 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!200428 () Bool)

(declare-fun res!167799 () Bool)

(assert (=> b!200428 (=> (not res!167799) (not e!137482))))

(assert (=> b!200428 (= res!167799 (= (size!4460 (buf!4958 (_2!9228 lt!312207))) (size!4460 (buf!4958 (_2!9228 lt!313453)))))))

(declare-fun b!200429 () Bool)

(declare-fun e!137479 () Bool)

(declare-fun lt!313425 () tuple2!17152)

(assert (=> b!200429 (= e!137479 (= (bitIndex!0 (size!4460 (buf!4958 (_1!9227 lt!313425))) (currentByte!9314 (_1!9227 lt!313425)) (currentBit!9309 (_1!9227 lt!313425))) (bitIndex!0 (size!4460 (buf!4958 (_2!9228 lt!313444))) (currentByte!9314 (_2!9228 lt!313444)) (currentBit!9309 (_2!9228 lt!313444)))))))

(declare-fun b!200430 () Bool)

(declare-fun e!137484 () Bool)

(assert (=> b!200430 (= e!137482 e!137484)))

(declare-fun res!167808 () Bool)

(assert (=> b!200430 (=> (not res!167808) (not e!137484))))

(declare-fun lt!313407 () tuple2!17156)

(assert (=> b!200430 (= res!167808 (= (_2!9229 lt!313407) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun lt!313438 () tuple2!17158)

(assert (=> b!200430 (= lt!313407 (readNBitsLSBFirstsLoopPure!0 (_1!9230 lt!313438) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!313410 () Unit!14201)

(declare-fun lt!313451 () Unit!14201)

(assert (=> b!200430 (= lt!313410 lt!313451)))

(declare-fun lt!313414 () (_ BitVec 64))

(assert (=> b!200430 (validate_offset_bits!1 ((_ sign_extend 32) (size!4460 (buf!4958 (_2!9228 lt!313453)))) ((_ sign_extend 32) (currentByte!9314 (_2!9228 lt!312207))) ((_ sign_extend 32) (currentBit!9309 (_2!9228 lt!312207))) lt!313414)))

(assert (=> b!200430 (= lt!313451 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9228 lt!312207) (buf!4958 (_2!9228 lt!313453)) lt!313414))))

(declare-fun e!137485 () Bool)

(assert (=> b!200430 e!137485))

(declare-fun res!167797 () Bool)

(assert (=> b!200430 (=> (not res!167797) (not e!137485))))

(assert (=> b!200430 (= res!167797 (and (= (size!4460 (buf!4958 (_2!9228 lt!312207))) (size!4460 (buf!4958 (_2!9228 lt!313453)))) (bvsge lt!313414 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!200430 (= lt!313414 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!200430 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!200430 (= lt!313438 (reader!0 (_2!9228 lt!312207) (_2!9228 lt!313453)))))

(declare-fun b!200431 () Bool)

(assert (=> b!200431 (= e!137485 (validate_offset_bits!1 ((_ sign_extend 32) (size!4460 (buf!4958 (_2!9228 lt!312207)))) ((_ sign_extend 32) (currentByte!9314 (_2!9228 lt!312207))) ((_ sign_extend 32) (currentBit!9309 (_2!9228 lt!312207))) lt!313414))))

(declare-fun b!200432 () Bool)

(assert (=> b!200432 (= e!137483 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!200433 () Bool)

(declare-fun e!137486 () Bool)

(declare-fun lt!313405 () tuple2!17152)

(declare-fun lt!313421 () tuple2!17152)

(assert (=> b!200433 (= e!137486 (= (_2!9227 lt!313405) (_2!9227 lt!313421)))))

(declare-fun b!200434 () Bool)

(declare-fun lt!313441 () tuple2!17154)

(assert (=> b!200434 (= e!137480 (tuple2!17155 (_1!9228 lt!313441) (_2!9228 lt!313441)))))

(declare-fun lt!313416 () Bool)

(assert (=> b!200434 (= lt!313416 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!200434 (= lt!313444 (appendBit!0 (_2!9228 lt!312207) lt!313416))))

(declare-fun res!167801 () Bool)

(assert (=> b!200434 (= res!167801 (= (size!4460 (buf!4958 (_2!9228 lt!312207))) (size!4460 (buf!4958 (_2!9228 lt!313444)))))))

(assert (=> b!200434 (=> (not res!167801) (not e!137478))))

(assert (=> b!200434 e!137478))

(declare-fun lt!313426 () tuple2!17154)

(assert (=> b!200434 (= lt!313426 lt!313444)))

(assert (=> b!200434 (= lt!313441 (appendBitsLSBFirstLoopTR!0 (_2!9228 lt!313426) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!313446 () Unit!14201)

(assert (=> b!200434 (= lt!313446 (lemmaIsPrefixTransitive!0 (_2!9228 lt!312207) (_2!9228 lt!313426) (_2!9228 lt!313441)))))

(assert (=> b!200434 (isPrefixOf!0 (_2!9228 lt!312207) (_2!9228 lt!313441))))

(declare-fun lt!313423 () Unit!14201)

(assert (=> b!200434 (= lt!313423 lt!313446)))

(assert (=> b!200434 (invariant!0 (currentBit!9309 (_2!9228 lt!312207)) (currentByte!9314 (_2!9228 lt!312207)) (size!4460 (buf!4958 (_2!9228 lt!313426))))))

(declare-fun lt!313449 () BitStream!8028)

(assert (=> b!200434 (= lt!313449 (BitStream!8029 (buf!4958 (_2!9228 lt!313426)) (currentByte!9314 (_2!9228 lt!312207)) (currentBit!9309 (_2!9228 lt!312207))))))

(assert (=> b!200434 (invariant!0 (currentBit!9309 lt!313449) (currentByte!9314 lt!313449) (size!4460 (buf!4958 (_2!9228 lt!313441))))))

(declare-fun lt!313440 () BitStream!8028)

(assert (=> b!200434 (= lt!313440 (BitStream!8029 (buf!4958 (_2!9228 lt!313441)) (currentByte!9314 lt!313449) (currentBit!9309 lt!313449)))))

(assert (=> b!200434 (= lt!313405 (readBitPure!0 lt!313449))))

(assert (=> b!200434 (= lt!313421 (readBitPure!0 lt!313440))))

(declare-fun lt!313412 () Unit!14201)

(assert (=> b!200434 (= lt!313412 (readBitPrefixLemma!0 lt!313449 (_2!9228 lt!313441)))))

(declare-fun res!167804 () Bool)

(assert (=> b!200434 (= res!167804 (= (bitIndex!0 (size!4460 (buf!4958 (_1!9227 lt!313405))) (currentByte!9314 (_1!9227 lt!313405)) (currentBit!9309 (_1!9227 lt!313405))) (bitIndex!0 (size!4460 (buf!4958 (_1!9227 lt!313421))) (currentByte!9314 (_1!9227 lt!313421)) (currentBit!9309 (_1!9227 lt!313421)))))))

(assert (=> b!200434 (=> (not res!167804) (not e!137486))))

(assert (=> b!200434 e!137486))

(declare-fun lt!313434 () Unit!14201)

(assert (=> b!200434 (= lt!313434 lt!313412)))

(declare-fun lt!313436 () tuple2!17158)

(assert (=> b!200434 (= lt!313436 (reader!0 (_2!9228 lt!312207) (_2!9228 lt!313441)))))

(declare-fun lt!313411 () tuple2!17158)

(assert (=> b!200434 (= lt!313411 (reader!0 (_2!9228 lt!313426) (_2!9228 lt!313441)))))

(declare-fun lt!313450 () tuple2!17152)

(assert (=> b!200434 (= lt!313450 (readBitPure!0 (_1!9230 lt!313436)))))

(assert (=> b!200434 (= (_2!9227 lt!313450) lt!313416)))

(declare-fun lt!313447 () Unit!14201)

(declare-fun Unit!14233 () Unit!14201)

(assert (=> b!200434 (= lt!313447 Unit!14233)))

(declare-fun lt!313448 () (_ BitVec 64))

(assert (=> b!200434 (= lt!313448 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!313430 () (_ BitVec 64))

(assert (=> b!200434 (= lt!313430 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!313431 () Unit!14201)

(assert (=> b!200434 (= lt!313431 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9228 lt!312207) (buf!4958 (_2!9228 lt!313441)) lt!313430))))

(assert (=> b!200434 (validate_offset_bits!1 ((_ sign_extend 32) (size!4460 (buf!4958 (_2!9228 lt!313441)))) ((_ sign_extend 32) (currentByte!9314 (_2!9228 lt!312207))) ((_ sign_extend 32) (currentBit!9309 (_2!9228 lt!312207))) lt!313430)))

(declare-fun lt!313424 () Unit!14201)

(assert (=> b!200434 (= lt!313424 lt!313431)))

(declare-fun lt!313399 () tuple2!17156)

(assert (=> b!200434 (= lt!313399 (readNBitsLSBFirstsLoopPure!0 (_1!9230 lt!313436) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!313448))))

(declare-fun lt!313398 () (_ BitVec 64))

(assert (=> b!200434 (= lt!313398 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!313432 () Unit!14201)

(assert (=> b!200434 (= lt!313432 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9228 lt!313426) (buf!4958 (_2!9228 lt!313441)) lt!313398))))

(assert (=> b!200434 (validate_offset_bits!1 ((_ sign_extend 32) (size!4460 (buf!4958 (_2!9228 lt!313441)))) ((_ sign_extend 32) (currentByte!9314 (_2!9228 lt!313426))) ((_ sign_extend 32) (currentBit!9309 (_2!9228 lt!313426))) lt!313398)))

(declare-fun lt!313417 () Unit!14201)

(assert (=> b!200434 (= lt!313417 lt!313432)))

(declare-fun lt!313409 () tuple2!17156)

(assert (=> b!200434 (= lt!313409 (readNBitsLSBFirstsLoopPure!0 (_1!9230 lt!313411) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!313448 (ite (_2!9227 lt!313450) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!313427 () tuple2!17156)

(assert (=> b!200434 (= lt!313427 (readNBitsLSBFirstsLoopPure!0 (_1!9230 lt!313436) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!313448))))

(declare-fun c!10009 () Bool)

(assert (=> b!200434 (= c!10009 (_2!9227 (readBitPure!0 (_1!9230 lt!313436))))))

(declare-fun lt!313439 () tuple2!17156)

(assert (=> b!200434 (= lt!313439 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9230 lt!313436) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!313448 e!137483)))))

(declare-fun lt!313402 () Unit!14201)

(assert (=> b!200434 (= lt!313402 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9230 lt!313436) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!313448))))

(assert (=> b!200434 (and (= (_2!9229 lt!313427) (_2!9229 lt!313439)) (= (_1!9229 lt!313427) (_1!9229 lt!313439)))))

(declare-fun lt!313443 () Unit!14201)

(assert (=> b!200434 (= lt!313443 lt!313402)))

(assert (=> b!200434 (= (_1!9230 lt!313436) (withMovedBitIndex!0 (_2!9230 lt!313436) (bvsub (bitIndex!0 (size!4460 (buf!4958 (_2!9228 lt!312207))) (currentByte!9314 (_2!9228 lt!312207)) (currentBit!9309 (_2!9228 lt!312207))) (bitIndex!0 (size!4460 (buf!4958 (_2!9228 lt!313441))) (currentByte!9314 (_2!9228 lt!313441)) (currentBit!9309 (_2!9228 lt!313441))))))))

(declare-fun lt!313437 () Unit!14201)

(declare-fun Unit!14234 () Unit!14201)

(assert (=> b!200434 (= lt!313437 Unit!14234)))

(assert (=> b!200434 (= (_1!9230 lt!313411) (withMovedBitIndex!0 (_2!9230 lt!313411) (bvsub (bitIndex!0 (size!4460 (buf!4958 (_2!9228 lt!313426))) (currentByte!9314 (_2!9228 lt!313426)) (currentBit!9309 (_2!9228 lt!313426))) (bitIndex!0 (size!4460 (buf!4958 (_2!9228 lt!313441))) (currentByte!9314 (_2!9228 lt!313441)) (currentBit!9309 (_2!9228 lt!313441))))))))

(declare-fun lt!313401 () Unit!14201)

(declare-fun Unit!14235 () Unit!14201)

(assert (=> b!200434 (= lt!313401 Unit!14235)))

(assert (=> b!200434 (= (bitIndex!0 (size!4460 (buf!4958 (_2!9228 lt!312207))) (currentByte!9314 (_2!9228 lt!312207)) (currentBit!9309 (_2!9228 lt!312207))) (bvsub (bitIndex!0 (size!4460 (buf!4958 (_2!9228 lt!313426))) (currentByte!9314 (_2!9228 lt!313426)) (currentBit!9309 (_2!9228 lt!313426))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!313404 () Unit!14201)

(declare-fun Unit!14236 () Unit!14201)

(assert (=> b!200434 (= lt!313404 Unit!14236)))

(assert (=> b!200434 (= (_2!9229 lt!313399) (_2!9229 lt!313409))))

(declare-fun lt!313408 () Unit!14201)

(declare-fun Unit!14237 () Unit!14201)

(assert (=> b!200434 (= lt!313408 Unit!14237)))

(assert (=> b!200434 (invariant!0 (currentBit!9309 (_2!9228 lt!313441)) (currentByte!9314 (_2!9228 lt!313441)) (size!4460 (buf!4958 (_2!9228 lt!313441))))))

(declare-fun lt!313435 () Unit!14201)

(declare-fun Unit!14238 () Unit!14201)

(assert (=> b!200434 (= lt!313435 Unit!14238)))

(assert (=> b!200434 (= (size!4460 (buf!4958 (_2!9228 lt!312207))) (size!4460 (buf!4958 (_2!9228 lt!313441))))))

(declare-fun lt!313420 () Unit!14201)

(declare-fun Unit!14239 () Unit!14201)

(assert (=> b!200434 (= lt!313420 Unit!14239)))

(assert (=> b!200434 (= (bitIndex!0 (size!4460 (buf!4958 (_2!9228 lt!313441))) (currentByte!9314 (_2!9228 lt!313441)) (currentBit!9309 (_2!9228 lt!313441))) (bvsub (bvadd (bitIndex!0 (size!4460 (buf!4958 (_2!9228 lt!312207))) (currentByte!9314 (_2!9228 lt!312207)) (currentBit!9309 (_2!9228 lt!312207))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!313429 () Unit!14201)

(declare-fun Unit!14240 () Unit!14201)

(assert (=> b!200434 (= lt!313429 Unit!14240)))

(declare-fun lt!313452 () Unit!14201)

(declare-fun Unit!14241 () Unit!14201)

(assert (=> b!200434 (= lt!313452 Unit!14241)))

(assert (=> b!200434 (= lt!313400 (reader!0 (_2!9228 lt!312207) (_2!9228 lt!313441)))))

(declare-fun lt!313403 () (_ BitVec 64))

(assert (=> b!200434 (= lt!313403 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!313418 () Unit!14201)

(assert (=> b!200434 (= lt!313418 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9228 lt!312207) (buf!4958 (_2!9228 lt!313441)) lt!313403))))

(assert (=> b!200434 (validate_offset_bits!1 ((_ sign_extend 32) (size!4460 (buf!4958 (_2!9228 lt!313441)))) ((_ sign_extend 32) (currentByte!9314 (_2!9228 lt!312207))) ((_ sign_extend 32) (currentBit!9309 (_2!9228 lt!312207))) lt!313403)))

(declare-fun lt!313422 () Unit!14201)

(assert (=> b!200434 (= lt!313422 lt!313418)))

(assert (=> b!200434 (= lt!313428 (readNBitsLSBFirstsLoopPure!0 (_1!9230 lt!313400) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!167798 () Bool)

(assert (=> b!200434 (= res!167798 (= (_2!9229 lt!313428) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!200434 (=> (not res!167798) (not e!137481))))

(assert (=> b!200434 e!137481))

(declare-fun lt!313433 () Unit!14201)

(declare-fun Unit!14242 () Unit!14201)

(assert (=> b!200434 (= lt!313433 Unit!14242)))

(declare-fun b!200435 () Bool)

(assert (=> b!200435 (= lt!313425 (readBitPure!0 (readerFrom!0 (_2!9228 lt!313444) (currentBit!9309 (_2!9228 lt!312207)) (currentByte!9314 (_2!9228 lt!312207)))))))

(declare-fun res!167800 () Bool)

(assert (=> b!200435 (= res!167800 (and (= (_2!9227 lt!313425) lt!313416) (= (_1!9227 lt!313425) (_2!9228 lt!313444))))))

(assert (=> b!200435 (=> (not res!167800) (not e!137479))))

(assert (=> b!200435 (= e!137478 e!137479)))

(declare-fun b!200436 () Bool)

(declare-fun res!167807 () Bool)

(declare-fun call!3176 () Bool)

(assert (=> b!200436 (= res!167807 call!3176)))

(assert (=> b!200436 (=> (not res!167807) (not e!137478))))

(declare-fun b!200437 () Bool)

(assert (=> b!200437 (= e!137484 (= (_1!9229 lt!313407) (_2!9230 lt!313438)))))

(declare-fun b!200438 () Bool)

(declare-fun Unit!14243 () Unit!14201)

(assert (=> b!200438 (= e!137480 (tuple2!17155 Unit!14243 (_2!9228 lt!312207)))))

(declare-fun lt!313415 () Unit!14201)

(assert (=> b!200438 (= lt!313415 (lemmaIsPrefixRefl!0 (_2!9228 lt!312207)))))

(assert (=> b!200438 call!3176))

(declare-fun lt!313419 () Unit!14201)

(assert (=> b!200438 (= lt!313419 lt!313415)))

(declare-fun bm!3173 () Bool)

(assert (=> bm!3173 (= call!3176 (isPrefixOf!0 (_2!9228 lt!312207) (ite c!10008 (_2!9228 lt!312207) (_2!9228 lt!313444))))))

(assert (= (and d!68703 c!10008) b!200438))

(assert (= (and d!68703 (not c!10008)) b!200434))

(assert (= (and b!200434 res!167801) b!200426))

(assert (= (and b!200426 res!167802) b!200436))

(assert (= (and b!200436 res!167807) b!200435))

(assert (= (and b!200435 res!167800) b!200429))

(assert (= (and b!200434 res!167804) b!200433))

(assert (= (and b!200434 c!10009) b!200432))

(assert (= (and b!200434 (not c!10009)) b!200427))

(assert (= (and b!200434 res!167798) b!200423))

(assert (= (or b!200438 b!200436) bm!3173))

(assert (= (and d!68703 res!167803) b!200428))

(assert (= (and b!200428 res!167799) b!200424))

(assert (= (and b!200424 res!167805) b!200425))

(assert (= (and b!200425 res!167806) b!200430))

(assert (= (and b!200430 res!167797) b!200431))

(assert (= (and b!200430 res!167808) b!200437))

(declare-fun m!311177 () Bool)

(assert (=> b!200429 m!311177))

(declare-fun m!311179 () Bool)

(assert (=> b!200429 m!311179))

(assert (=> b!200426 m!311179))

(assert (=> b!200426 m!310379))

(declare-fun m!311181 () Bool)

(assert (=> d!68703 m!311181))

(declare-fun m!311183 () Bool)

(assert (=> b!200435 m!311183))

(assert (=> b!200435 m!311183))

(declare-fun m!311185 () Bool)

(assert (=> b!200435 m!311185))

(declare-fun m!311187 () Bool)

(assert (=> b!200425 m!311187))

(declare-fun m!311189 () Bool)

(assert (=> bm!3173 m!311189))

(declare-fun m!311191 () Bool)

(assert (=> b!200424 m!311191))

(assert (=> b!200424 m!310379))

(declare-fun m!311193 () Bool)

(assert (=> b!200434 m!311193))

(declare-fun m!311195 () Bool)

(assert (=> b!200434 m!311195))

(declare-fun m!311197 () Bool)

(assert (=> b!200434 m!311197))

(declare-fun m!311199 () Bool)

(assert (=> b!200434 m!311199))

(declare-fun m!311201 () Bool)

(assert (=> b!200434 m!311201))

(declare-fun m!311203 () Bool)

(assert (=> b!200434 m!311203))

(declare-fun m!311205 () Bool)

(assert (=> b!200434 m!311205))

(declare-fun m!311207 () Bool)

(assert (=> b!200434 m!311207))

(declare-fun m!311209 () Bool)

(assert (=> b!200434 m!311209))

(declare-fun m!311211 () Bool)

(assert (=> b!200434 m!311211))

(declare-fun m!311213 () Bool)

(assert (=> b!200434 m!311213))

(declare-fun m!311215 () Bool)

(assert (=> b!200434 m!311215))

(declare-fun m!311217 () Bool)

(assert (=> b!200434 m!311217))

(declare-fun m!311219 () Bool)

(assert (=> b!200434 m!311219))

(declare-fun m!311221 () Bool)

(assert (=> b!200434 m!311221))

(declare-fun m!311223 () Bool)

(assert (=> b!200434 m!311223))

(declare-fun m!311225 () Bool)

(assert (=> b!200434 m!311225))

(declare-fun m!311227 () Bool)

(assert (=> b!200434 m!311227))

(assert (=> b!200434 m!311221))

(declare-fun m!311229 () Bool)

(assert (=> b!200434 m!311229))

(declare-fun m!311231 () Bool)

(assert (=> b!200434 m!311231))

(declare-fun m!311233 () Bool)

(assert (=> b!200434 m!311233))

(declare-fun m!311235 () Bool)

(assert (=> b!200434 m!311235))

(assert (=> b!200434 m!310379))

(declare-fun m!311237 () Bool)

(assert (=> b!200434 m!311237))

(declare-fun m!311239 () Bool)

(assert (=> b!200434 m!311239))

(declare-fun m!311241 () Bool)

(assert (=> b!200434 m!311241))

(declare-fun m!311243 () Bool)

(assert (=> b!200434 m!311243))

(declare-fun m!311245 () Bool)

(assert (=> b!200434 m!311245))

(declare-fun m!311247 () Bool)

(assert (=> b!200434 m!311247))

(declare-fun m!311249 () Bool)

(assert (=> b!200434 m!311249))

(declare-fun m!311251 () Bool)

(assert (=> b!200434 m!311251))

(declare-fun m!311253 () Bool)

(assert (=> b!200434 m!311253))

(declare-fun m!311255 () Bool)

(assert (=> b!200434 m!311255))

(declare-fun m!311257 () Bool)

(assert (=> b!200434 m!311257))

(assert (=> b!200430 m!311193))

(declare-fun m!311259 () Bool)

(assert (=> b!200430 m!311259))

(declare-fun m!311261 () Bool)

(assert (=> b!200430 m!311261))

(declare-fun m!311263 () Bool)

(assert (=> b!200430 m!311263))

(assert (=> b!200430 m!311249))

(declare-fun m!311265 () Bool)

(assert (=> b!200430 m!311265))

(assert (=> b!200438 m!310861))

(declare-fun m!311267 () Bool)

(assert (=> b!200431 m!311267))

(assert (=> b!199990 d!68703))

(declare-fun d!68751 () Bool)

(assert (=> d!68751 (= (invariant!0 (currentBit!9309 thiss!1204) (currentByte!9314 thiss!1204) (size!4460 (buf!4958 (_2!9228 lt!312219)))) (and (bvsge (currentBit!9309 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9309 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9314 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9314 thiss!1204) (size!4460 (buf!4958 (_2!9228 lt!312219)))) (and (= (currentBit!9309 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9314 thiss!1204) (size!4460 (buf!4958 (_2!9228 lt!312219))))))))))

(assert (=> b!199975 d!68751))

(assert (=> b!199986 d!68687))

(declare-fun d!68753 () Bool)

(assert (=> d!68753 (= (array_inv!4201 (buf!4958 thiss!1204)) (bvsge (size!4460 (buf!4958 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!199977 d!68753))

(assert (=> b!199988 d!68627))

(assert (=> b!199988 d!68629))

(check-sat (not d!68639) (not b!200219) (not b!200181) (not b!200430) (not d!68637) (not d!68665) (not d!68659) (not b!200182) (not d!68629) (not d!68673) (not b!200184) (not b!200435) (not b!200424) (not b!200225) (not d!68641) (not d!68657) (not b!200183) (not d!68677) (not b!200228) (not d!68693) (not bm!3173) (not d!68667) (not d!68701) (not d!68649) (not b!200222) (not d!68671) (not d!68689) (not d!68651) (not d!68681) (not d!68663) (not d!68645) (not d!68695) (not b!200226) (not b!200434) (not d!68627) (not d!68655) (not b!200429) (not d!68631) (not b!200242) (not d!68703) (not d!68685) (not b!200221) (not b!200218) (not b!200191) (not b!200426) (not d!68661) (not b!200240) (not d!68643) (not b!200438) (not d!68653) (not b!200204) (not d!68669) (not d!68691) (not d!68697) (not b!200229) (not b!200193) (not b!200425) (not b!200431) (not d!68675) (not b!200234) (not b!200232))
