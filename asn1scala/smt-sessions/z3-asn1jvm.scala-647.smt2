; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18102 () Bool)

(assert start!18102)

(declare-fun b!89084 () Bool)

(declare-fun e!58885 () Bool)

(declare-fun e!58887 () Bool)

(assert (=> b!89084 (= e!58885 e!58887)))

(declare-fun res!73352 () Bool)

(assert (=> b!89084 (=> (not res!73352) (not e!58887))))

(declare-fun i!576 () (_ BitVec 32))

(declare-fun lt!136389 () (_ BitVec 64))

(declare-fun lt!136392 () (_ BitVec 64))

(assert (=> b!89084 (= res!73352 (= lt!136389 (bvadd lt!136392 ((_ sign_extend 32) i!576))))))

(declare-datatypes ((array!4208 0))(
  ( (array!4209 (arr!2536 (Array (_ BitVec 32) (_ BitVec 8))) (size!1899 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3360 0))(
  ( (BitStream!3361 (buf!2289 array!4208) (currentByte!4543 (_ BitVec 32)) (currentBit!4538 (_ BitVec 32))) )
))
(declare-fun thiss!1152 () BitStream!3360)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!89084 (= lt!136389 (bitIndex!0 (size!1899 (buf!2289 thiss!1152)) (currentByte!4543 thiss!1152) (currentBit!4538 thiss!1152)))))

(declare-fun thiss!1151 () BitStream!3360)

(assert (=> b!89084 (= lt!136392 (bitIndex!0 (size!1899 (buf!2289 thiss!1151)) (currentByte!4543 thiss!1151) (currentBit!4538 thiss!1151)))))

(declare-fun b!89085 () Bool)

(declare-fun res!73346 () Bool)

(assert (=> b!89085 (=> (not res!73346) (not e!58887))))

(declare-fun nBits!336 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!89085 (= res!73346 (validate_offset_bits!1 ((_ sign_extend 32) (size!1899 (buf!2289 thiss!1152))) ((_ sign_extend 32) (currentByte!4543 thiss!1152)) ((_ sign_extend 32) (currentBit!4538 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun b!89086 () Bool)

(declare-fun e!58881 () Bool)

(declare-fun array_inv!1745 (array!4208) Bool)

(assert (=> b!89086 (= e!58881 (array_inv!1745 (buf!2289 thiss!1152)))))

(declare-fun b!89087 () Bool)

(declare-fun res!73355 () Bool)

(assert (=> b!89087 (=> (not res!73355) (not e!58885))))

(assert (=> b!89087 (= res!73355 (and (bvsle i!576 nBits!336) (= (size!1899 (buf!2289 thiss!1152)) (size!1899 (buf!2289 thiss!1151)))))))

(declare-fun b!89088 () Bool)

(assert (=> b!89088 (= e!58887 (not (or (not (= (bvand i!576 #b10000000000000000000000000000000) #b00000000000000000000000000000000)) (= (bvand i!576 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!576) #b10000000000000000000000000000000)))))))

(declare-fun e!58880 () Bool)

(assert (=> b!89088 e!58880))

(declare-fun res!73354 () Bool)

(assert (=> b!89088 (=> (not res!73354) (not e!58880))))

(declare-datatypes ((Unit!5781 0))(
  ( (Unit!5782) )
))
(declare-datatypes ((tuple2!7472 0))(
  ( (tuple2!7473 (_1!3969 Unit!5781) (_2!3969 BitStream!3360)) )
))
(declare-fun lt!136387 () tuple2!7472)

(assert (=> b!89088 (= res!73354 (= (size!1899 (buf!2289 thiss!1152)) (size!1899 (buf!2289 (_2!3969 lt!136387)))))))

(declare-fun lt!136391 () Bool)

(declare-fun appendBit!0 (BitStream!3360 Bool) tuple2!7472)

(assert (=> b!89088 (= lt!136387 (appendBit!0 thiss!1152 lt!136391))))

(declare-fun v!179 () (_ BitVec 64))

(assert (=> b!89088 (= lt!136391 (not (= (bvand v!179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!576))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!89089 () Bool)

(declare-fun res!73348 () Bool)

(assert (=> b!89089 (=> (not res!73348) (not e!58885))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!89089 (= res!73348 (invariant!0 (currentBit!4538 thiss!1152) (currentByte!4543 thiss!1152) (size!1899 (buf!2289 thiss!1152))))))

(declare-fun b!89090 () Bool)

(declare-fun res!73357 () Bool)

(declare-fun e!58883 () Bool)

(assert (=> b!89090 (=> (not res!73357) (not e!58883))))

(declare-fun isPrefixOf!0 (BitStream!3360 BitStream!3360) Bool)

(assert (=> b!89090 (= res!73357 (isPrefixOf!0 thiss!1152 (_2!3969 lt!136387)))))

(declare-fun res!73350 () Bool)

(assert (=> start!18102 (=> (not res!73350) (not e!58885))))

(assert (=> start!18102 (= res!73350 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!18102 e!58885))

(declare-fun inv!12 (BitStream!3360) Bool)

(assert (=> start!18102 (and (inv!12 thiss!1152) e!58881)))

(declare-fun e!58882 () Bool)

(assert (=> start!18102 (and (inv!12 thiss!1151) e!58882)))

(assert (=> start!18102 true))

(declare-fun b!89091 () Bool)

(declare-fun res!73356 () Bool)

(assert (=> b!89091 (=> (not res!73356) (not e!58885))))

(assert (=> b!89091 (= res!73356 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!89092 () Bool)

(declare-fun e!58884 () Bool)

(declare-datatypes ((tuple2!7474 0))(
  ( (tuple2!7475 (_1!3970 BitStream!3360) (_2!3970 Bool)) )
))
(declare-fun lt!136388 () tuple2!7474)

(declare-fun lt!136390 () (_ BitVec 64))

(assert (=> b!89092 (= e!58884 (= (bitIndex!0 (size!1899 (buf!2289 (_1!3970 lt!136388))) (currentByte!4543 (_1!3970 lt!136388)) (currentBit!4538 (_1!3970 lt!136388))) lt!136390))))

(declare-fun b!89093 () Bool)

(assert (=> b!89093 (= e!58883 e!58884)))

(declare-fun res!73345 () Bool)

(assert (=> b!89093 (=> (not res!73345) (not e!58884))))

(assert (=> b!89093 (= res!73345 (and (= (_2!3970 lt!136388) lt!136391) (= (_1!3970 lt!136388) (_2!3969 lt!136387))))))

(declare-fun readBitPure!0 (BitStream!3360) tuple2!7474)

(declare-fun readerFrom!0 (BitStream!3360 (_ BitVec 32) (_ BitVec 32)) BitStream!3360)

(assert (=> b!89093 (= lt!136388 (readBitPure!0 (readerFrom!0 (_2!3969 lt!136387) (currentBit!4538 thiss!1152) (currentByte!4543 thiss!1152))))))

(declare-fun b!89094 () Bool)

(declare-fun res!73351 () Bool)

(assert (=> b!89094 (=> (not res!73351) (not e!58885))))

(assert (=> b!89094 (= res!73351 (invariant!0 (currentBit!4538 thiss!1151) (currentByte!4543 thiss!1151) (size!1899 (buf!2289 thiss!1151))))))

(declare-fun b!89095 () Bool)

(declare-fun res!73349 () Bool)

(assert (=> b!89095 (=> (not res!73349) (not e!58887))))

(assert (=> b!89095 (= res!73349 (bvslt i!576 nBits!336))))

(declare-fun b!89096 () Bool)

(assert (=> b!89096 (= e!58880 e!58883)))

(declare-fun res!73347 () Bool)

(assert (=> b!89096 (=> (not res!73347) (not e!58883))))

(assert (=> b!89096 (= res!73347 (= lt!136390 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!136389)))))

(assert (=> b!89096 (= lt!136390 (bitIndex!0 (size!1899 (buf!2289 (_2!3969 lt!136387))) (currentByte!4543 (_2!3969 lt!136387)) (currentBit!4538 (_2!3969 lt!136387))))))

(declare-fun b!89097 () Bool)

(assert (=> b!89097 (= e!58882 (array_inv!1745 (buf!2289 thiss!1151)))))

(declare-fun b!89098 () Bool)

(declare-fun res!73353 () Bool)

(assert (=> b!89098 (=> (not res!73353) (not e!58885))))

(assert (=> b!89098 (= res!73353 (validate_offset_bits!1 ((_ sign_extend 32) (size!1899 (buf!2289 thiss!1151))) ((_ sign_extend 32) (currentByte!4543 thiss!1151)) ((_ sign_extend 32) (currentBit!4538 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(assert (= (and start!18102 res!73350) b!89098))

(assert (= (and b!89098 res!73353) b!89094))

(assert (= (and b!89094 res!73351) b!89091))

(assert (= (and b!89091 res!73356) b!89089))

(assert (= (and b!89089 res!73348) b!89087))

(assert (= (and b!89087 res!73355) b!89084))

(assert (= (and b!89084 res!73352) b!89085))

(assert (= (and b!89085 res!73346) b!89095))

(assert (= (and b!89095 res!73349) b!89088))

(assert (= (and b!89088 res!73354) b!89096))

(assert (= (and b!89096 res!73347) b!89090))

(assert (= (and b!89090 res!73357) b!89093))

(assert (= (and b!89093 res!73345) b!89092))

(assert (= start!18102 b!89086))

(assert (= start!18102 b!89097))

(declare-fun m!134029 () Bool)

(assert (=> b!89097 m!134029))

(declare-fun m!134031 () Bool)

(assert (=> b!89086 m!134031))

(declare-fun m!134033 () Bool)

(assert (=> b!89098 m!134033))

(declare-fun m!134035 () Bool)

(assert (=> start!18102 m!134035))

(declare-fun m!134037 () Bool)

(assert (=> start!18102 m!134037))

(declare-fun m!134039 () Bool)

(assert (=> b!89084 m!134039))

(declare-fun m!134041 () Bool)

(assert (=> b!89084 m!134041))

(declare-fun m!134043 () Bool)

(assert (=> b!89094 m!134043))

(declare-fun m!134045 () Bool)

(assert (=> b!89096 m!134045))

(declare-fun m!134047 () Bool)

(assert (=> b!89085 m!134047))

(declare-fun m!134049 () Bool)

(assert (=> b!89090 m!134049))

(declare-fun m!134051 () Bool)

(assert (=> b!89092 m!134051))

(declare-fun m!134053 () Bool)

(assert (=> b!89089 m!134053))

(declare-fun m!134055 () Bool)

(assert (=> b!89093 m!134055))

(assert (=> b!89093 m!134055))

(declare-fun m!134057 () Bool)

(assert (=> b!89093 m!134057))

(declare-fun m!134059 () Bool)

(assert (=> b!89088 m!134059))

(check-sat (not start!18102) (not b!89092) (not b!89084) (not b!89097) (not b!89093) (not b!89089) (not b!89085) (not b!89088) (not b!89090) (not b!89098) (not b!89094) (not b!89096) (not b!89086))
(check-sat)
