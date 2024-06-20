; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18110 () Bool)

(assert start!18110)

(declare-fun res!73510 () Bool)

(declare-fun e!59004 () Bool)

(assert (=> start!18110 (=> (not res!73510) (not e!59004))))

(declare-fun nBits!336 () (_ BitVec 32))

(assert (=> start!18110 (= res!73510 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!18110 e!59004))

(declare-datatypes ((array!4216 0))(
  ( (array!4217 (arr!2540 (Array (_ BitVec 32) (_ BitVec 8))) (size!1903 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3368 0))(
  ( (BitStream!3369 (buf!2293 array!4216) (currentByte!4547 (_ BitVec 32)) (currentBit!4542 (_ BitVec 32))) )
))
(declare-fun thiss!1152 () BitStream!3368)

(declare-fun e!58996 () Bool)

(declare-fun inv!12 (BitStream!3368) Bool)

(assert (=> start!18110 (and (inv!12 thiss!1152) e!58996)))

(declare-fun thiss!1151 () BitStream!3368)

(declare-fun e!58998 () Bool)

(assert (=> start!18110 (and (inv!12 thiss!1151) e!58998)))

(assert (=> start!18110 true))

(declare-fun b!89272 () Bool)

(declare-fun array_inv!1749 (array!4216) Bool)

(assert (=> b!89272 (= e!58998 (array_inv!1749 (buf!2293 thiss!1151)))))

(declare-fun b!89273 () Bool)

(declare-fun res!73511 () Bool)

(declare-fun e!59000 () Bool)

(assert (=> b!89273 (=> (not res!73511) (not e!59000))))

(declare-datatypes ((Unit!5789 0))(
  ( (Unit!5790) )
))
(declare-datatypes ((tuple2!7488 0))(
  ( (tuple2!7489 (_1!3977 Unit!5789) (_2!3977 BitStream!3368)) )
))
(declare-fun lt!136460 () tuple2!7488)

(declare-fun isPrefixOf!0 (BitStream!3368 BitStream!3368) Bool)

(assert (=> b!89273 (= res!73511 (isPrefixOf!0 thiss!1152 (_2!3977 lt!136460)))))

(declare-fun b!89274 () Bool)

(declare-fun e!58999 () Bool)

(declare-fun e!59003 () Bool)

(assert (=> b!89274 (= e!58999 (not e!59003))))

(declare-fun res!73515 () Bool)

(assert (=> b!89274 (=> res!73515 e!59003)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!89274 (= res!73515 (not (invariant!0 (currentBit!4542 (_2!3977 lt!136460)) (currentByte!4547 (_2!3977 lt!136460)) (size!1903 (buf!2293 (_2!3977 lt!136460))))))))

(declare-fun e!59001 () Bool)

(assert (=> b!89274 e!59001))

(declare-fun res!73514 () Bool)

(assert (=> b!89274 (=> (not res!73514) (not e!59001))))

(assert (=> b!89274 (= res!73514 (= (size!1903 (buf!2293 thiss!1152)) (size!1903 (buf!2293 (_2!3977 lt!136460)))))))

(declare-fun lt!136463 () Bool)

(declare-fun appendBit!0 (BitStream!3368 Bool) tuple2!7488)

(assert (=> b!89274 (= lt!136460 (appendBit!0 thiss!1152 lt!136463))))

(declare-fun v!179 () (_ BitVec 64))

(declare-fun i!576 () (_ BitVec 32))

(assert (=> b!89274 (= lt!136463 (not (= (bvand v!179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!576))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!89275 () Bool)

(assert (=> b!89275 (= e!58996 (array_inv!1749 (buf!2293 thiss!1152)))))

(declare-fun b!89276 () Bool)

(assert (=> b!89276 (= e!59004 e!58999)))

(declare-fun res!73509 () Bool)

(assert (=> b!89276 (=> (not res!73509) (not e!58999))))

(declare-fun lt!136459 () (_ BitVec 64))

(declare-fun lt!136464 () (_ BitVec 64))

(assert (=> b!89276 (= res!73509 (= lt!136464 (bvadd lt!136459 ((_ sign_extend 32) i!576))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!89276 (= lt!136464 (bitIndex!0 (size!1903 (buf!2293 thiss!1152)) (currentByte!4547 thiss!1152) (currentBit!4542 thiss!1152)))))

(assert (=> b!89276 (= lt!136459 (bitIndex!0 (size!1903 (buf!2293 thiss!1151)) (currentByte!4547 thiss!1151) (currentBit!4542 thiss!1151)))))

(declare-fun b!89277 () Bool)

(declare-fun res!73520 () Bool)

(assert (=> b!89277 (=> (not res!73520) (not e!59004))))

(assert (=> b!89277 (= res!73520 (invariant!0 (currentBit!4542 thiss!1151) (currentByte!4547 thiss!1151) (size!1903 (buf!2293 thiss!1151))))))

(declare-fun b!89278 () Bool)

(declare-fun res!73517 () Bool)

(assert (=> b!89278 (=> (not res!73517) (not e!59004))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!89278 (= res!73517 (validate_offset_bits!1 ((_ sign_extend 32) (size!1903 (buf!2293 thiss!1151))) ((_ sign_extend 32) (currentByte!4547 thiss!1151)) ((_ sign_extend 32) (currentBit!4542 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!89279 () Bool)

(declare-fun res!73516 () Bool)

(assert (=> b!89279 (=> (not res!73516) (not e!58999))))

(assert (=> b!89279 (= res!73516 (bvslt i!576 nBits!336))))

(declare-fun b!89280 () Bool)

(declare-fun res!73512 () Bool)

(assert (=> b!89280 (=> (not res!73512) (not e!59004))))

(assert (=> b!89280 (= res!73512 (and (bvsle i!576 nBits!336) (= (size!1903 (buf!2293 thiss!1152)) (size!1903 (buf!2293 thiss!1151)))))))

(declare-fun b!89281 () Bool)

(assert (=> b!89281 (= e!59001 e!59000)))

(declare-fun res!73518 () Bool)

(assert (=> b!89281 (=> (not res!73518) (not e!59000))))

(declare-fun lt!136462 () (_ BitVec 64))

(assert (=> b!89281 (= res!73518 (= lt!136462 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!136464)))))

(assert (=> b!89281 (= lt!136462 (bitIndex!0 (size!1903 (buf!2293 (_2!3977 lt!136460))) (currentByte!4547 (_2!3977 lt!136460)) (currentBit!4542 (_2!3977 lt!136460))))))

(declare-fun b!89282 () Bool)

(declare-fun e!58995 () Bool)

(assert (=> b!89282 (= e!59000 e!58995)))

(declare-fun res!73519 () Bool)

(assert (=> b!89282 (=> (not res!73519) (not e!58995))))

(declare-datatypes ((tuple2!7490 0))(
  ( (tuple2!7491 (_1!3978 BitStream!3368) (_2!3978 Bool)) )
))
(declare-fun lt!136461 () tuple2!7490)

(assert (=> b!89282 (= res!73519 (and (= (_2!3978 lt!136461) lt!136463) (= (_1!3978 lt!136461) (_2!3977 lt!136460))))))

(declare-fun readBitPure!0 (BitStream!3368) tuple2!7490)

(declare-fun readerFrom!0 (BitStream!3368 (_ BitVec 32) (_ BitVec 32)) BitStream!3368)

(assert (=> b!89282 (= lt!136461 (readBitPure!0 (readerFrom!0 (_2!3977 lt!136460) (currentBit!4542 thiss!1152) (currentByte!4547 thiss!1152))))))

(declare-fun b!89283 () Bool)

(declare-fun res!73513 () Bool)

(assert (=> b!89283 (=> (not res!73513) (not e!59004))))

(assert (=> b!89283 (= res!73513 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!89284 () Bool)

(assert (=> b!89284 (= e!58995 (= (bitIndex!0 (size!1903 (buf!2293 (_1!3978 lt!136461))) (currentByte!4547 (_1!3978 lt!136461)) (currentBit!4542 (_1!3978 lt!136461))) lt!136462))))

(declare-fun b!89285 () Bool)

(declare-fun res!73521 () Bool)

(assert (=> b!89285 (=> (not res!73521) (not e!59004))))

(assert (=> b!89285 (= res!73521 (invariant!0 (currentBit!4542 thiss!1152) (currentByte!4547 thiss!1152) (size!1903 (buf!2293 thiss!1152))))))

(declare-fun b!89286 () Bool)

(declare-fun res!73522 () Bool)

(assert (=> b!89286 (=> (not res!73522) (not e!58999))))

(assert (=> b!89286 (= res!73522 (validate_offset_bits!1 ((_ sign_extend 32) (size!1903 (buf!2293 thiss!1152))) ((_ sign_extend 32) (currentByte!4547 thiss!1152)) ((_ sign_extend 32) (currentBit!4542 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun b!89287 () Bool)

(assert (=> b!89287 (= e!59003 (or (bvsge (bvadd #b00000000000000000000000000000001 i!576) nBits!336) (bvslt (bvsub nBits!336 (bvadd #b00000000000000000000000000000001 i!576)) (bvsub nBits!336 i!576))))))

(assert (= (and start!18110 res!73510) b!89278))

(assert (= (and b!89278 res!73517) b!89277))

(assert (= (and b!89277 res!73520) b!89283))

(assert (= (and b!89283 res!73513) b!89285))

(assert (= (and b!89285 res!73521) b!89280))

(assert (= (and b!89280 res!73512) b!89276))

(assert (= (and b!89276 res!73509) b!89286))

(assert (= (and b!89286 res!73522) b!89279))

(assert (= (and b!89279 res!73516) b!89274))

(assert (= (and b!89274 res!73514) b!89281))

(assert (= (and b!89281 res!73518) b!89273))

(assert (= (and b!89273 res!73511) b!89282))

(assert (= (and b!89282 res!73519) b!89284))

(assert (= (and b!89274 (not res!73515)) b!89287))

(assert (= start!18110 b!89275))

(assert (= start!18110 b!89272))

(declare-fun m!134161 () Bool)

(assert (=> b!89272 m!134161))

(declare-fun m!134163 () Bool)

(assert (=> b!89285 m!134163))

(declare-fun m!134165 () Bool)

(assert (=> b!89273 m!134165))

(declare-fun m!134167 () Bool)

(assert (=> b!89286 m!134167))

(declare-fun m!134169 () Bool)

(assert (=> b!89274 m!134169))

(declare-fun m!134171 () Bool)

(assert (=> b!89274 m!134171))

(declare-fun m!134173 () Bool)

(assert (=> b!89281 m!134173))

(declare-fun m!134175 () Bool)

(assert (=> start!18110 m!134175))

(declare-fun m!134177 () Bool)

(assert (=> start!18110 m!134177))

(declare-fun m!134179 () Bool)

(assert (=> b!89278 m!134179))

(declare-fun m!134181 () Bool)

(assert (=> b!89284 m!134181))

(declare-fun m!134183 () Bool)

(assert (=> b!89275 m!134183))

(declare-fun m!134185 () Bool)

(assert (=> b!89282 m!134185))

(assert (=> b!89282 m!134185))

(declare-fun m!134187 () Bool)

(assert (=> b!89282 m!134187))

(declare-fun m!134189 () Bool)

(assert (=> b!89277 m!134189))

(declare-fun m!134191 () Bool)

(assert (=> b!89276 m!134191))

(declare-fun m!134193 () Bool)

(assert (=> b!89276 m!134193))

(push 1)

(assert (not b!89272))

(assert (not b!89276))

(assert (not b!89286))

(assert (not start!18110))

(assert (not b!89282))

(assert (not b!89278))

(assert (not b!89281))

(assert (not b!89274))

(assert (not b!89285))

(assert (not b!89277))

(assert (not b!89284))

(assert (not b!89275))

(assert (not b!89273))

(check-sat)

(pop 1)

(push 1)

(check-sat)

