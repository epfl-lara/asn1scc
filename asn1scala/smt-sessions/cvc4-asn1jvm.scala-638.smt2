; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17930 () Bool)

(assert start!17930)

(declare-fun b!88009 () Bool)

(declare-fun e!58293 () Bool)

(declare-fun e!58292 () Bool)

(assert (=> b!88009 (= e!58293 e!58292)))

(declare-fun res!72433 () Bool)

(assert (=> b!88009 (=> (not res!72433) (not e!58292))))

(declare-fun lt!135940 () (_ BitVec 64))

(declare-fun i!576 () (_ BitVec 32))

(declare-fun lt!135942 () (_ BitVec 64))

(assert (=> b!88009 (= res!72433 (= lt!135942 (bvadd lt!135940 ((_ sign_extend 32) i!576))))))

(declare-datatypes ((array!4147 0))(
  ( (array!4148 (arr!2510 (Array (_ BitVec 32) (_ BitVec 8))) (size!1873 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3308 0))(
  ( (BitStream!3309 (buf!2263 array!4147) (currentByte!4487 (_ BitVec 32)) (currentBit!4482 (_ BitVec 32))) )
))
(declare-fun thiss!1152 () BitStream!3308)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!88009 (= lt!135942 (bitIndex!0 (size!1873 (buf!2263 thiss!1152)) (currentByte!4487 thiss!1152) (currentBit!4482 thiss!1152)))))

(declare-fun thiss!1151 () BitStream!3308)

(assert (=> b!88009 (= lt!135940 (bitIndex!0 (size!1873 (buf!2263 thiss!1151)) (currentByte!4487 thiss!1151) (currentBit!4482 thiss!1151)))))

(declare-fun b!88010 () Bool)

(declare-fun res!72428 () Bool)

(assert (=> b!88010 (=> (not res!72428) (not e!58293))))

(assert (=> b!88010 (= res!72428 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!88011 () Bool)

(declare-fun e!58291 () Bool)

(declare-datatypes ((Unit!5765 0))(
  ( (Unit!5766) )
))
(declare-datatypes ((tuple2!7434 0))(
  ( (tuple2!7435 (_1!3950 Unit!5765) (_2!3950 BitStream!3308)) )
))
(declare-fun lt!135941 () tuple2!7434)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!88011 (= e!58291 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4482 (_2!3950 lt!135941)))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4487 (_2!3950 lt!135941)))) ((_ extract 31 0) ((_ sign_extend 32) (size!1873 (buf!2263 (_2!3950 lt!135941)))))))))

(declare-fun b!88012 () Bool)

(declare-fun res!72432 () Bool)

(assert (=> b!88012 (=> res!72432 e!58291)))

(assert (=> b!88012 (= res!72432 (or (bvsgt ((_ sign_extend 32) (size!1873 (buf!2263 (_2!3950 lt!135941)))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!4487 (_2!3950 lt!135941))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!4482 (_2!3950 lt!135941))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvslt ((_ sign_extend 32) (size!1873 (buf!2263 (_2!3950 lt!135941)))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!4487 (_2!3950 lt!135941))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!4482 (_2!3950 lt!135941))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!88013 () Bool)

(declare-fun res!72426 () Bool)

(assert (=> b!88013 (=> (not res!72426) (not e!58292))))

(declare-fun nBits!336 () (_ BitVec 32))

(assert (=> b!88013 (= res!72426 (bvslt i!576 nBits!336))))

(declare-fun b!88014 () Bool)

(declare-fun e!58294 () Bool)

(declare-datatypes ((tuple2!7436 0))(
  ( (tuple2!7437 (_1!3951 BitStream!3308) (_2!3951 Bool)) )
))
(declare-fun lt!135939 () tuple2!7436)

(declare-fun lt!135938 () (_ BitVec 64))

(assert (=> b!88014 (= e!58294 (= (bitIndex!0 (size!1873 (buf!2263 (_1!3951 lt!135939))) (currentByte!4487 (_1!3951 lt!135939)) (currentBit!4482 (_1!3951 lt!135939))) lt!135938))))

(declare-fun b!88015 () Bool)

(declare-fun res!72430 () Bool)

(assert (=> b!88015 (=> (not res!72430) (not e!58293))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!88015 (= res!72430 (validate_offset_bits!1 ((_ sign_extend 32) (size!1873 (buf!2263 thiss!1151))) ((_ sign_extend 32) (currentByte!4487 thiss!1151)) ((_ sign_extend 32) (currentBit!4482 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun res!72429 () Bool)

(assert (=> start!17930 (=> (not res!72429) (not e!58293))))

(assert (=> start!17930 (= res!72429 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!17930 e!58293))

(declare-fun e!58290 () Bool)

(declare-fun inv!12 (BitStream!3308) Bool)

(assert (=> start!17930 (and (inv!12 thiss!1152) e!58290)))

(declare-fun e!58295 () Bool)

(assert (=> start!17930 (and (inv!12 thiss!1151) e!58295)))

(assert (=> start!17930 true))

(declare-fun b!88016 () Bool)

(declare-fun res!72427 () Bool)

(declare-fun e!58296 () Bool)

(assert (=> b!88016 (=> (not res!72427) (not e!58296))))

(declare-fun isPrefixOf!0 (BitStream!3308 BitStream!3308) Bool)

(assert (=> b!88016 (= res!72427 (isPrefixOf!0 thiss!1152 (_2!3950 lt!135941)))))

(declare-fun b!88017 () Bool)

(declare-fun res!72434 () Bool)

(assert (=> b!88017 (=> (not res!72434) (not e!58292))))

(assert (=> b!88017 (= res!72434 (validate_offset_bits!1 ((_ sign_extend 32) (size!1873 (buf!2263 thiss!1152))) ((_ sign_extend 32) (currentByte!4487 thiss!1152)) ((_ sign_extend 32) (currentBit!4482 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun b!88018 () Bool)

(declare-fun e!58298 () Bool)

(assert (=> b!88018 (= e!58298 e!58296)))

(declare-fun res!72441 () Bool)

(assert (=> b!88018 (=> (not res!72441) (not e!58296))))

(assert (=> b!88018 (= res!72441 (= lt!135938 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!135942)))))

(assert (=> b!88018 (= lt!135938 (bitIndex!0 (size!1873 (buf!2263 (_2!3950 lt!135941))) (currentByte!4487 (_2!3950 lt!135941)) (currentBit!4482 (_2!3950 lt!135941))))))

(declare-fun b!88019 () Bool)

(assert (=> b!88019 (= e!58296 e!58294)))

(declare-fun res!72442 () Bool)

(assert (=> b!88019 (=> (not res!72442) (not e!58294))))

(declare-fun lt!135937 () Bool)

(assert (=> b!88019 (= res!72442 (and (= (_2!3951 lt!135939) lt!135937) (= (_1!3951 lt!135939) (_2!3950 lt!135941))))))

(declare-fun readBitPure!0 (BitStream!3308) tuple2!7436)

(declare-fun readerFrom!0 (BitStream!3308 (_ BitVec 32) (_ BitVec 32)) BitStream!3308)

(assert (=> b!88019 (= lt!135939 (readBitPure!0 (readerFrom!0 (_2!3950 lt!135941) (currentBit!4482 thiss!1152) (currentByte!4487 thiss!1152))))))

(declare-fun b!88020 () Bool)

(declare-fun res!72440 () Bool)

(assert (=> b!88020 (=> (not res!72440) (not e!58293))))

(assert (=> b!88020 (= res!72440 (invariant!0 (currentBit!4482 thiss!1152) (currentByte!4487 thiss!1152) (size!1873 (buf!2263 thiss!1152))))))

(declare-fun b!88021 () Bool)

(declare-fun res!72435 () Bool)

(assert (=> b!88021 (=> res!72435 e!58291)))

(assert (=> b!88021 (= res!72435 (not (= (bitIndex!0 (size!1873 (buf!2263 (_2!3950 lt!135941))) (currentByte!4487 (_2!3950 lt!135941)) (currentBit!4482 (_2!3950 lt!135941))) (bvadd lt!135940 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!576))))))))

(declare-fun b!88022 () Bool)

(assert (=> b!88022 (= e!58292 (not e!58291))))

(declare-fun res!72431 () Bool)

(assert (=> b!88022 (=> res!72431 e!58291)))

(assert (=> b!88022 (= res!72431 (not (invariant!0 (currentBit!4482 (_2!3950 lt!135941)) (currentByte!4487 (_2!3950 lt!135941)) (size!1873 (buf!2263 (_2!3950 lt!135941))))))))

(assert (=> b!88022 e!58298))

(declare-fun res!72437 () Bool)

(assert (=> b!88022 (=> (not res!72437) (not e!58298))))

(assert (=> b!88022 (= res!72437 (= (size!1873 (buf!2263 thiss!1152)) (size!1873 (buf!2263 (_2!3950 lt!135941)))))))

(declare-fun appendBit!0 (BitStream!3308 Bool) tuple2!7434)

(assert (=> b!88022 (= lt!135941 (appendBit!0 thiss!1152 lt!135937))))

(declare-fun v!179 () (_ BitVec 64))

(assert (=> b!88022 (= lt!135937 (not (= (bvand v!179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!576))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!88023 () Bool)

(declare-fun array_inv!1719 (array!4147) Bool)

(assert (=> b!88023 (= e!58290 (array_inv!1719 (buf!2263 thiss!1152)))))

(declare-fun b!88024 () Bool)

(assert (=> b!88024 (= e!58295 (array_inv!1719 (buf!2263 thiss!1151)))))

(declare-fun b!88025 () Bool)

(declare-fun res!72438 () Bool)

(assert (=> b!88025 (=> (not res!72438) (not e!58293))))

(assert (=> b!88025 (= res!72438 (and (bvsle i!576 nBits!336) (= (size!1873 (buf!2263 thiss!1152)) (size!1873 (buf!2263 thiss!1151)))))))

(declare-fun b!88026 () Bool)

(declare-fun res!72436 () Bool)

(assert (=> b!88026 (=> (not res!72436) (not e!58293))))

(assert (=> b!88026 (= res!72436 (invariant!0 (currentBit!4482 thiss!1151) (currentByte!4487 thiss!1151) (size!1873 (buf!2263 thiss!1151))))))

(declare-fun b!88027 () Bool)

(declare-fun res!72439 () Bool)

(assert (=> b!88027 (=> res!72439 e!58291)))

(assert (=> b!88027 (= res!72439 (or (bvslt (bvadd #b00000000000000000000000000000001 i!576) nBits!336) (bvslt (bvadd #b00000000000000000000000000000001 i!576) #b00000000000000000000000000000000) (not (= (size!1873 (buf!2263 (_2!3950 lt!135941))) (size!1873 (buf!2263 thiss!1151))))))))

(assert (= (and start!17930 res!72429) b!88015))

(assert (= (and b!88015 res!72430) b!88026))

(assert (= (and b!88026 res!72436) b!88010))

(assert (= (and b!88010 res!72428) b!88020))

(assert (= (and b!88020 res!72440) b!88025))

(assert (= (and b!88025 res!72438) b!88009))

(assert (= (and b!88009 res!72433) b!88017))

(assert (= (and b!88017 res!72434) b!88013))

(assert (= (and b!88013 res!72426) b!88022))

(assert (= (and b!88022 res!72437) b!88018))

(assert (= (and b!88018 res!72441) b!88016))

(assert (= (and b!88016 res!72427) b!88019))

(assert (= (and b!88019 res!72442) b!88014))

(assert (= (and b!88022 (not res!72431)) b!88027))

(assert (= (and b!88027 (not res!72439)) b!88021))

(assert (= (and b!88021 (not res!72435)) b!88012))

(assert (= (and b!88012 (not res!72432)) b!88011))

(assert (= start!17930 b!88023))

(assert (= start!17930 b!88024))

(declare-fun m!133301 () Bool)

(assert (=> b!88023 m!133301))

(declare-fun m!133303 () Bool)

(assert (=> b!88009 m!133303))

(declare-fun m!133305 () Bool)

(assert (=> b!88009 m!133305))

(declare-fun m!133307 () Bool)

(assert (=> b!88014 m!133307))

(declare-fun m!133309 () Bool)

(assert (=> b!88026 m!133309))

(declare-fun m!133311 () Bool)

(assert (=> b!88019 m!133311))

(assert (=> b!88019 m!133311))

(declare-fun m!133313 () Bool)

(assert (=> b!88019 m!133313))

(declare-fun m!133315 () Bool)

(assert (=> b!88017 m!133315))

(declare-fun m!133317 () Bool)

(assert (=> b!88018 m!133317))

(declare-fun m!133319 () Bool)

(assert (=> b!88016 m!133319))

(declare-fun m!133321 () Bool)

(assert (=> b!88020 m!133321))

(declare-fun m!133323 () Bool)

(assert (=> b!88015 m!133323))

(declare-fun m!133325 () Bool)

(assert (=> b!88022 m!133325))

(declare-fun m!133327 () Bool)

(assert (=> b!88022 m!133327))

(declare-fun m!133329 () Bool)

(assert (=> b!88011 m!133329))

(assert (=> b!88021 m!133317))

(declare-fun m!133331 () Bool)

(assert (=> start!17930 m!133331))

(declare-fun m!133333 () Bool)

(assert (=> start!17930 m!133333))

(declare-fun m!133335 () Bool)

(assert (=> b!88024 m!133335))

(push 1)

(assert (not b!88016))

(assert (not b!88022))

(assert (not b!88026))

(assert (not b!88009))

(assert (not b!88017))

(assert (not b!88015))

(assert (not b!88024))

(assert (not b!88014))

(assert (not b!88018))

(assert (not b!88020))

