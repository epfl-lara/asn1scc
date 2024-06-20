; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18108 () Bool)

(assert start!18108)

(declare-fun b!89224 () Bool)

(declare-fun e!58965 () Bool)

(declare-datatypes ((array!4214 0))(
  ( (array!4215 (arr!2539 (Array (_ BitVec 32) (_ BitVec 8))) (size!1902 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3366 0))(
  ( (BitStream!3367 (buf!2292 array!4214) (currentByte!4546 (_ BitVec 32)) (currentBit!4541 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!7484 0))(
  ( (tuple2!7485 (_1!3975 BitStream!3366) (_2!3975 Bool)) )
))
(declare-fun lt!136446 () tuple2!7484)

(declare-fun lt!136444 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!89224 (= e!58965 (= (bitIndex!0 (size!1902 (buf!2292 (_1!3975 lt!136446))) (currentByte!4546 (_1!3975 lt!136446)) (currentBit!4541 (_1!3975 lt!136446))) lt!136444))))

(declare-fun b!89225 () Bool)

(declare-fun e!58974 () Bool)

(assert (=> b!89225 (= e!58974 e!58965)))

(declare-fun res!73469 () Bool)

(assert (=> b!89225 (=> (not res!73469) (not e!58965))))

(declare-datatypes ((Unit!5787 0))(
  ( (Unit!5788) )
))
(declare-datatypes ((tuple2!7486 0))(
  ( (tuple2!7487 (_1!3976 Unit!5787) (_2!3976 BitStream!3366)) )
))
(declare-fun lt!136445 () tuple2!7486)

(declare-fun lt!136442 () Bool)

(assert (=> b!89225 (= res!73469 (and (= (_2!3975 lt!136446) lt!136442) (= (_1!3975 lt!136446) (_2!3976 lt!136445))))))

(declare-fun thiss!1152 () BitStream!3366)

(declare-fun readBitPure!0 (BitStream!3366) tuple2!7484)

(declare-fun readerFrom!0 (BitStream!3366 (_ BitVec 32) (_ BitVec 32)) BitStream!3366)

(assert (=> b!89225 (= lt!136446 (readBitPure!0 (readerFrom!0 (_2!3976 lt!136445) (currentBit!4541 thiss!1152) (currentByte!4546 thiss!1152))))))

(declare-fun b!89226 () Bool)

(declare-fun res!73476 () Bool)

(declare-fun e!58970 () Bool)

(assert (=> b!89226 (=> (not res!73476) (not e!58970))))

(declare-fun thiss!1151 () BitStream!3366)

(declare-fun nBits!336 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!89226 (= res!73476 (validate_offset_bits!1 ((_ sign_extend 32) (size!1902 (buf!2292 thiss!1151))) ((_ sign_extend 32) (currentByte!4546 thiss!1151)) ((_ sign_extend 32) (currentBit!4541 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!89227 () Bool)

(declare-fun res!73474 () Bool)

(assert (=> b!89227 (=> (not res!73474) (not e!58970))))

(declare-fun i!576 () (_ BitVec 32))

(assert (=> b!89227 (= res!73474 (and (bvsle i!576 nBits!336) (= (size!1902 (buf!2292 thiss!1152)) (size!1902 (buf!2292 thiss!1151)))))))

(declare-fun b!89228 () Bool)

(declare-fun res!73470 () Bool)

(assert (=> b!89228 (=> (not res!73470) (not e!58974))))

(declare-fun isPrefixOf!0 (BitStream!3366 BitStream!3366) Bool)

(assert (=> b!89228 (= res!73470 (isPrefixOf!0 thiss!1152 (_2!3976 lt!136445)))))

(declare-fun b!89229 () Bool)

(declare-fun e!58973 () Bool)

(assert (=> b!89229 (= e!58973 (or (bvsge (bvadd #b00000000000000000000000000000001 i!576) nBits!336) (bvslt (bvsub nBits!336 (bvadd #b00000000000000000000000000000001 i!576)) (bvsub nBits!336 i!576))))))

(declare-fun b!89230 () Bool)

(declare-fun res!73471 () Bool)

(declare-fun e!58971 () Bool)

(assert (=> b!89230 (=> (not res!73471) (not e!58971))))

(assert (=> b!89230 (= res!73471 (bvslt i!576 nBits!336))))

(declare-fun b!89231 () Bool)

(declare-fun res!73477 () Bool)

(assert (=> b!89231 (=> (not res!73477) (not e!58971))))

(assert (=> b!89231 (= res!73477 (validate_offset_bits!1 ((_ sign_extend 32) (size!1902 (buf!2292 thiss!1152))) ((_ sign_extend 32) (currentByte!4546 thiss!1152)) ((_ sign_extend 32) (currentBit!4541 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun b!89232 () Bool)

(declare-fun res!73479 () Bool)

(assert (=> b!89232 (=> (not res!73479) (not e!58970))))

(assert (=> b!89232 (= res!73479 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!89234 () Bool)

(declare-fun e!58969 () Bool)

(assert (=> b!89234 (= e!58969 e!58974)))

(declare-fun res!73475 () Bool)

(assert (=> b!89234 (=> (not res!73475) (not e!58974))))

(declare-fun lt!136443 () (_ BitVec 64))

(assert (=> b!89234 (= res!73475 (= lt!136444 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!136443)))))

(assert (=> b!89234 (= lt!136444 (bitIndex!0 (size!1902 (buf!2292 (_2!3976 lt!136445))) (currentByte!4546 (_2!3976 lt!136445)) (currentBit!4541 (_2!3976 lt!136445))))))

(declare-fun b!89235 () Bool)

(declare-fun res!73480 () Bool)

(assert (=> b!89235 (=> (not res!73480) (not e!58970))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!89235 (= res!73480 (invariant!0 (currentBit!4541 thiss!1152) (currentByte!4546 thiss!1152) (size!1902 (buf!2292 thiss!1152))))))

(declare-fun b!89236 () Bool)

(declare-fun e!58966 () Bool)

(declare-fun array_inv!1748 (array!4214) Bool)

(assert (=> b!89236 (= e!58966 (array_inv!1748 (buf!2292 thiss!1151)))))

(declare-fun b!89237 () Bool)

(assert (=> b!89237 (= e!58971 (not e!58973))))

(declare-fun res!73468 () Bool)

(assert (=> b!89237 (=> res!73468 e!58973)))

(assert (=> b!89237 (= res!73468 (not (invariant!0 (currentBit!4541 (_2!3976 lt!136445)) (currentByte!4546 (_2!3976 lt!136445)) (size!1902 (buf!2292 (_2!3976 lt!136445))))))))

(assert (=> b!89237 e!58969))

(declare-fun res!73472 () Bool)

(assert (=> b!89237 (=> (not res!73472) (not e!58969))))

(assert (=> b!89237 (= res!73472 (= (size!1902 (buf!2292 thiss!1152)) (size!1902 (buf!2292 (_2!3976 lt!136445)))))))

(declare-fun appendBit!0 (BitStream!3366 Bool) tuple2!7486)

(assert (=> b!89237 (= lt!136445 (appendBit!0 thiss!1152 lt!136442))))

(declare-fun v!179 () (_ BitVec 64))

(assert (=> b!89237 (= lt!136442 (not (= (bvand v!179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!576))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!89238 () Bool)

(assert (=> b!89238 (= e!58970 e!58971)))

(declare-fun res!73473 () Bool)

(assert (=> b!89238 (=> (not res!73473) (not e!58971))))

(declare-fun lt!136441 () (_ BitVec 64))

(assert (=> b!89238 (= res!73473 (= lt!136443 (bvadd lt!136441 ((_ sign_extend 32) i!576))))))

(assert (=> b!89238 (= lt!136443 (bitIndex!0 (size!1902 (buf!2292 thiss!1152)) (currentByte!4546 thiss!1152) (currentBit!4541 thiss!1152)))))

(assert (=> b!89238 (= lt!136441 (bitIndex!0 (size!1902 (buf!2292 thiss!1151)) (currentByte!4546 thiss!1151) (currentBit!4541 thiss!1151)))))

(declare-fun b!89239 () Bool)

(declare-fun res!73478 () Bool)

(assert (=> b!89239 (=> (not res!73478) (not e!58970))))

(assert (=> b!89239 (= res!73478 (invariant!0 (currentBit!4541 thiss!1151) (currentByte!4546 thiss!1151) (size!1902 (buf!2292 thiss!1151))))))

(declare-fun b!89233 () Bool)

(declare-fun e!58968 () Bool)

(assert (=> b!89233 (= e!58968 (array_inv!1748 (buf!2292 thiss!1152)))))

(declare-fun res!73467 () Bool)

(assert (=> start!18108 (=> (not res!73467) (not e!58970))))

(assert (=> start!18108 (= res!73467 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!18108 e!58970))

(declare-fun inv!12 (BitStream!3366) Bool)

(assert (=> start!18108 (and (inv!12 thiss!1152) e!58968)))

(assert (=> start!18108 (and (inv!12 thiss!1151) e!58966)))

(assert (=> start!18108 true))

(assert (= (and start!18108 res!73467) b!89226))

(assert (= (and b!89226 res!73476) b!89239))

(assert (= (and b!89239 res!73478) b!89232))

(assert (= (and b!89232 res!73479) b!89235))

(assert (= (and b!89235 res!73480) b!89227))

(assert (= (and b!89227 res!73474) b!89238))

(assert (= (and b!89238 res!73473) b!89231))

(assert (= (and b!89231 res!73477) b!89230))

(assert (= (and b!89230 res!73471) b!89237))

(assert (= (and b!89237 res!73472) b!89234))

(assert (= (and b!89234 res!73475) b!89228))

(assert (= (and b!89228 res!73470) b!89225))

(assert (= (and b!89225 res!73469) b!89224))

(assert (= (and b!89237 (not res!73468)) b!89229))

(assert (= start!18108 b!89233))

(assert (= start!18108 b!89236))

(declare-fun m!134127 () Bool)

(assert (=> b!89235 m!134127))

(declare-fun m!134129 () Bool)

(assert (=> b!89233 m!134129))

(declare-fun m!134131 () Bool)

(assert (=> b!89225 m!134131))

(assert (=> b!89225 m!134131))

(declare-fun m!134133 () Bool)

(assert (=> b!89225 m!134133))

(declare-fun m!134135 () Bool)

(assert (=> b!89237 m!134135))

(declare-fun m!134137 () Bool)

(assert (=> b!89237 m!134137))

(declare-fun m!134139 () Bool)

(assert (=> b!89236 m!134139))

(declare-fun m!134141 () Bool)

(assert (=> b!89234 m!134141))

(declare-fun m!134143 () Bool)

(assert (=> b!89228 m!134143))

(declare-fun m!134145 () Bool)

(assert (=> b!89238 m!134145))

(declare-fun m!134147 () Bool)

(assert (=> b!89238 m!134147))

(declare-fun m!134149 () Bool)

(assert (=> b!89239 m!134149))

(declare-fun m!134151 () Bool)

(assert (=> b!89231 m!134151))

(declare-fun m!134153 () Bool)

(assert (=> start!18108 m!134153))

(declare-fun m!134155 () Bool)

(assert (=> start!18108 m!134155))

(declare-fun m!134157 () Bool)

(assert (=> b!89226 m!134157))

(declare-fun m!134159 () Bool)

(assert (=> b!89224 m!134159))

(check-sat (not b!89231) (not b!89228) (not b!89235) (not start!18108) (not b!89233) (not b!89225) (not b!89234) (not b!89224) (not b!89236) (not b!89238) (not b!89237) (not b!89239) (not b!89226))
(check-sat)
