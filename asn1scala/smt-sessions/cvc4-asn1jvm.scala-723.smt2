; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20228 () Bool)

(assert start!20228)

(declare-fun b!101385 () Bool)

(declare-fun e!66290 () Bool)

(declare-fun e!66291 () Bool)

(assert (=> b!101385 (= e!66290 e!66291)))

(declare-fun res!83305 () Bool)

(assert (=> b!101385 (=> (not res!83305) (not e!66291))))

(declare-fun lt!147146 () (_ BitVec 64))

(declare-fun lt!147153 () (_ BitVec 64))

(assert (=> b!101385 (= res!83305 (= lt!147146 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!147153)))))

(declare-datatypes ((array!4759 0))(
  ( (array!4760 (arr!2765 (Array (_ BitVec 32) (_ BitVec 8))) (size!2172 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3818 0))(
  ( (BitStream!3819 (buf!2529 array!4759) (currentByte!4996 (_ BitVec 32)) (currentBit!4991 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!6216 0))(
  ( (Unit!6217) )
))
(declare-datatypes ((tuple2!8212 0))(
  ( (tuple2!8213 (_1!4361 Unit!6216) (_2!4361 BitStream!3818)) )
))
(declare-fun lt!147155 () tuple2!8212)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!101385 (= lt!147146 (bitIndex!0 (size!2172 (buf!2529 (_2!4361 lt!147155))) (currentByte!4996 (_2!4361 lt!147155)) (currentBit!4991 (_2!4361 lt!147155))))))

(declare-fun thiss!1305 () BitStream!3818)

(assert (=> b!101385 (= lt!147153 (bitIndex!0 (size!2172 (buf!2529 thiss!1305)) (currentByte!4996 thiss!1305) (currentBit!4991 thiss!1305)))))

(declare-fun b!101386 () Bool)

(declare-fun e!66293 () Bool)

(declare-fun array_inv!1974 (array!4759) Bool)

(assert (=> b!101386 (= e!66293 (array_inv!1974 (buf!2529 thiss!1305)))))

(declare-fun b!101387 () Bool)

(declare-fun res!83303 () Bool)

(declare-fun e!66294 () Bool)

(assert (=> b!101387 (=> (not res!83303) (not e!66294))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!101387 (= res!83303 (invariant!0 (currentBit!4991 thiss!1305) (currentByte!4996 thiss!1305) (size!2172 (buf!2529 (_2!4361 lt!147155)))))))

(declare-fun b!101388 () Bool)

(declare-fun res!83301 () Bool)

(declare-fun e!66287 () Bool)

(assert (=> b!101388 (=> (not res!83301) (not e!66287))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> b!101388 (= res!83301 (bvslt i!615 nBits!396))))

(declare-fun b!101389 () Bool)

(declare-fun e!66292 () Bool)

(assert (=> b!101389 (= e!66291 e!66292)))

(declare-fun res!83302 () Bool)

(assert (=> b!101389 (=> (not res!83302) (not e!66292))))

(declare-datatypes ((tuple2!8214 0))(
  ( (tuple2!8215 (_1!4362 BitStream!3818) (_2!4362 Bool)) )
))
(declare-fun lt!147154 () tuple2!8214)

(declare-fun lt!147145 () Bool)

(assert (=> b!101389 (= res!83302 (and (= (_2!4362 lt!147154) lt!147145) (= (_1!4362 lt!147154) (_2!4361 lt!147155))))))

(declare-fun readBitPure!0 (BitStream!3818) tuple2!8214)

(declare-fun readerFrom!0 (BitStream!3818 (_ BitVec 32) (_ BitVec 32)) BitStream!3818)

(assert (=> b!101389 (= lt!147154 (readBitPure!0 (readerFrom!0 (_2!4361 lt!147155) (currentBit!4991 thiss!1305) (currentByte!4996 thiss!1305))))))

(declare-fun b!101390 () Bool)

(declare-fun res!83307 () Bool)

(assert (=> b!101390 (=> (not res!83307) (not e!66287))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!101390 (= res!83307 (validate_offset_bits!1 ((_ sign_extend 32) (size!2172 (buf!2529 thiss!1305))) ((_ sign_extend 32) (currentByte!4996 thiss!1305)) ((_ sign_extend 32) (currentBit!4991 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun b!101391 () Bool)

(declare-fun res!83299 () Bool)

(assert (=> b!101391 (=> (not res!83299) (not e!66287))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!101391 (= res!83299 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun res!83309 () Bool)

(assert (=> start!20228 (=> (not res!83309) (not e!66287))))

(assert (=> start!20228 (= res!83309 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!20228 e!66287))

(assert (=> start!20228 true))

(declare-fun inv!12 (BitStream!3818) Bool)

(assert (=> start!20228 (and (inv!12 thiss!1305) e!66293)))

(declare-fun b!101392 () Bool)

(declare-fun res!83304 () Bool)

(assert (=> b!101392 (=> (not res!83304) (not e!66291))))

(declare-fun isPrefixOf!0 (BitStream!3818 BitStream!3818) Bool)

(assert (=> b!101392 (= res!83304 (isPrefixOf!0 thiss!1305 (_2!4361 lt!147155)))))

(declare-fun b!101393 () Bool)

(declare-fun e!66289 () Bool)

(declare-fun lt!147151 () tuple2!8214)

(declare-fun lt!147157 () tuple2!8214)

(assert (=> b!101393 (= e!66289 (= (_2!4362 lt!147151) (_2!4362 lt!147157)))))

(declare-fun b!101394 () Bool)

(declare-fun lt!147152 () tuple2!8212)

(assert (=> b!101394 (= e!66294 (invariant!0 (currentBit!4991 thiss!1305) (currentByte!4996 thiss!1305) (size!2172 (buf!2529 (_2!4361 lt!147152)))))))

(declare-fun b!101395 () Bool)

(assert (=> b!101395 (= e!66292 (= (bitIndex!0 (size!2172 (buf!2529 (_1!4362 lt!147154))) (currentByte!4996 (_1!4362 lt!147154)) (currentBit!4991 (_1!4362 lt!147154))) lt!147146))))

(declare-fun b!101396 () Bool)

(assert (=> b!101396 (= e!66287 (not true))))

(declare-datatypes ((tuple2!8216 0))(
  ( (tuple2!8217 (_1!4363 BitStream!3818) (_2!4363 BitStream!3818)) )
))
(declare-fun lt!147156 () tuple2!8216)

(assert (=> b!101396 (= (_2!4362 (readBitPure!0 (_1!4363 lt!147156))) lt!147145)))

(declare-fun lt!147149 () tuple2!8216)

(declare-fun reader!0 (BitStream!3818 BitStream!3818) tuple2!8216)

(assert (=> b!101396 (= lt!147149 (reader!0 (_2!4361 lt!147155) (_2!4361 lt!147152)))))

(assert (=> b!101396 (= lt!147156 (reader!0 thiss!1305 (_2!4361 lt!147152)))))

(assert (=> b!101396 e!66289))

(declare-fun res!83306 () Bool)

(assert (=> b!101396 (=> (not res!83306) (not e!66289))))

(assert (=> b!101396 (= res!83306 (= (bitIndex!0 (size!2172 (buf!2529 (_1!4362 lt!147151))) (currentByte!4996 (_1!4362 lt!147151)) (currentBit!4991 (_1!4362 lt!147151))) (bitIndex!0 (size!2172 (buf!2529 (_1!4362 lt!147157))) (currentByte!4996 (_1!4362 lt!147157)) (currentBit!4991 (_1!4362 lt!147157)))))))

(declare-fun lt!147148 () Unit!6216)

(declare-fun lt!147147 () BitStream!3818)

(declare-fun readBitPrefixLemma!0 (BitStream!3818 BitStream!3818) Unit!6216)

(assert (=> b!101396 (= lt!147148 (readBitPrefixLemma!0 lt!147147 (_2!4361 lt!147152)))))

(assert (=> b!101396 (= lt!147157 (readBitPure!0 (BitStream!3819 (buf!2529 (_2!4361 lt!147152)) (currentByte!4996 thiss!1305) (currentBit!4991 thiss!1305))))))

(assert (=> b!101396 (= lt!147151 (readBitPure!0 lt!147147))))

(assert (=> b!101396 (= lt!147147 (BitStream!3819 (buf!2529 (_2!4361 lt!147155)) (currentByte!4996 thiss!1305) (currentBit!4991 thiss!1305)))))

(assert (=> b!101396 e!66294))

(declare-fun res!83308 () Bool)

(assert (=> b!101396 (=> (not res!83308) (not e!66294))))

(assert (=> b!101396 (= res!83308 (isPrefixOf!0 thiss!1305 (_2!4361 lt!147152)))))

(declare-fun lt!147150 () Unit!6216)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3818 BitStream!3818 BitStream!3818) Unit!6216)

(assert (=> b!101396 (= lt!147150 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4361 lt!147155) (_2!4361 lt!147152)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3818 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8212)

(assert (=> b!101396 (= lt!147152 (appendNLeastSignificantBitsLoop!0 (_2!4361 lt!147155) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!101396 e!66290))

(declare-fun res!83300 () Bool)

(assert (=> b!101396 (=> (not res!83300) (not e!66290))))

(assert (=> b!101396 (= res!83300 (= (size!2172 (buf!2529 thiss!1305)) (size!2172 (buf!2529 (_2!4361 lt!147155)))))))

(declare-fun appendBit!0 (BitStream!3818 Bool) tuple2!8212)

(assert (=> b!101396 (= lt!147155 (appendBit!0 thiss!1305 lt!147145))))

(assert (=> b!101396 (= lt!147145 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!20228 res!83309) b!101390))

(assert (= (and b!101390 res!83307) b!101391))

(assert (= (and b!101391 res!83299) b!101388))

(assert (= (and b!101388 res!83301) b!101396))

(assert (= (and b!101396 res!83300) b!101385))

(assert (= (and b!101385 res!83305) b!101392))

(assert (= (and b!101392 res!83304) b!101389))

(assert (= (and b!101389 res!83302) b!101395))

(assert (= (and b!101396 res!83308) b!101387))

(assert (= (and b!101387 res!83303) b!101394))

(assert (= (and b!101396 res!83306) b!101393))

(assert (= start!20228 b!101386))

(declare-fun m!147451 () Bool)

(assert (=> b!101396 m!147451))

(declare-fun m!147453 () Bool)

(assert (=> b!101396 m!147453))

(declare-fun m!147455 () Bool)

(assert (=> b!101396 m!147455))

(declare-fun m!147457 () Bool)

(assert (=> b!101396 m!147457))

(declare-fun m!147459 () Bool)

(assert (=> b!101396 m!147459))

(declare-fun m!147461 () Bool)

(assert (=> b!101396 m!147461))

(declare-fun m!147463 () Bool)

(assert (=> b!101396 m!147463))

(declare-fun m!147465 () Bool)

(assert (=> b!101396 m!147465))

(declare-fun m!147467 () Bool)

(assert (=> b!101396 m!147467))

(declare-fun m!147469 () Bool)

(assert (=> b!101396 m!147469))

(declare-fun m!147471 () Bool)

(assert (=> b!101396 m!147471))

(declare-fun m!147473 () Bool)

(assert (=> b!101396 m!147473))

(declare-fun m!147475 () Bool)

(assert (=> b!101394 m!147475))

(declare-fun m!147477 () Bool)

(assert (=> b!101392 m!147477))

(declare-fun m!147479 () Bool)

(assert (=> b!101389 m!147479))

(assert (=> b!101389 m!147479))

(declare-fun m!147481 () Bool)

(assert (=> b!101389 m!147481))

(declare-fun m!147483 () Bool)

(assert (=> b!101385 m!147483))

(declare-fun m!147485 () Bool)

(assert (=> b!101385 m!147485))

(declare-fun m!147487 () Bool)

(assert (=> b!101395 m!147487))

(declare-fun m!147489 () Bool)

(assert (=> b!101387 m!147489))

(declare-fun m!147491 () Bool)

(assert (=> start!20228 m!147491))

(declare-fun m!147493 () Bool)

(assert (=> b!101386 m!147493))

(declare-fun m!147495 () Bool)

(assert (=> b!101391 m!147495))

(declare-fun m!147497 () Bool)

(assert (=> b!101390 m!147497))

(push 1)

(assert (not b!101396))

(assert (not b!101395))

(assert (not b!101390))

(assert (not b!101394))

(assert (not b!101385))

(assert (not b!101386))

(assert (not b!101389))

(assert (not b!101392))

(assert (not b!101391))

(assert (not start!20228))

(assert (not b!101387))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

