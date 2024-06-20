; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17768 () Bool)

(assert start!17768)

(declare-fun b!86276 () Bool)

(declare-fun res!70862 () Bool)

(declare-fun e!57390 () Bool)

(assert (=> b!86276 (=> res!70862 e!57390)))

(declare-fun i!576 () (_ BitVec 32))

(declare-fun nBits!336 () (_ BitVec 32))

(assert (=> b!86276 (= res!70862 (bvsge (bvadd #b00000000000000000000000000000001 i!576) nBits!336))))

(declare-fun b!86277 () Bool)

(declare-fun e!57393 () Bool)

(assert (=> b!86277 (= e!57390 e!57393)))

(declare-fun res!70870 () Bool)

(assert (=> b!86277 (=> res!70870 e!57393)))

(declare-datatypes ((Unit!5714 0))(
  ( (Unit!5715) )
))
(declare-datatypes ((array!4093 0))(
  ( (array!4094 (arr!2486 (Array (_ BitVec 32) (_ BitVec 8))) (size!1849 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3260 0))(
  ( (BitStream!3261 (buf!2239 array!4093) (currentByte!4445 (_ BitVec 32)) (currentBit!4440 (_ BitVec 32))) )
))
(declare-datatypes ((tuple3!398 0))(
  ( (tuple3!399 (_1!3886 Unit!5714) (_2!3886 BitStream!3260) (_3!223 (_ BitVec 32))) )
))
(declare-fun lt!135082 () tuple3!398)

(assert (=> b!86277 (= res!70870 (bvslt (_3!223 lt!135082) #b00000000000000000000000000000000))))

(declare-fun v!179 () (_ BitVec 64))

(declare-datatypes ((tuple2!7326 0))(
  ( (tuple2!7327 (_1!3887 Unit!5714) (_2!3887 BitStream!3260)) )
))
(declare-fun lt!135086 () tuple2!7326)

(declare-fun thiss!1151 () BitStream!3260)

(declare-fun appendBitsLSBFirstWhileWhile!0 ((_ BitVec 32) BitStream!3260 (_ BitVec 64) BitStream!3260 (_ BitVec 32)) tuple3!398)

(assert (=> b!86277 (= lt!135082 (appendBitsLSBFirstWhileWhile!0 nBits!336 thiss!1151 v!179 (_2!3887 lt!135086) (bvadd #b00000000000000000000000000000001 i!576)))))

(declare-fun b!86278 () Bool)

(declare-fun res!70869 () Bool)

(declare-fun e!57387 () Bool)

(assert (=> b!86278 (=> (not res!70869) (not e!57387))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!86278 (= res!70869 (invariant!0 (currentBit!4440 thiss!1151) (currentByte!4445 thiss!1151) (size!1849 (buf!2239 thiss!1151))))))

(declare-fun b!86279 () Bool)

(declare-fun res!70868 () Bool)

(assert (=> b!86279 (=> (not res!70868) (not e!57387))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!86279 (= res!70868 (validate_offset_bits!1 ((_ sign_extend 32) (size!1849 (buf!2239 thiss!1151))) ((_ sign_extend 32) (currentByte!4445 thiss!1151)) ((_ sign_extend 32) (currentBit!4440 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!86280 () Bool)

(declare-fun e!57396 () Bool)

(assert (=> b!86280 (= e!57387 e!57396)))

(declare-fun res!70858 () Bool)

(assert (=> b!86280 (=> (not res!70858) (not e!57396))))

(declare-fun lt!135087 () (_ BitVec 64))

(declare-fun lt!135081 () (_ BitVec 64))

(assert (=> b!86280 (= res!70858 (= lt!135081 (bvadd lt!135087 ((_ sign_extend 32) i!576))))))

(declare-fun thiss!1152 () BitStream!3260)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!86280 (= lt!135081 (bitIndex!0 (size!1849 (buf!2239 thiss!1152)) (currentByte!4445 thiss!1152) (currentBit!4440 thiss!1152)))))

(assert (=> b!86280 (= lt!135087 (bitIndex!0 (size!1849 (buf!2239 thiss!1151)) (currentByte!4445 thiss!1151) (currentBit!4440 thiss!1151)))))

(declare-fun b!86281 () Bool)

(declare-fun res!70856 () Bool)

(assert (=> b!86281 (=> (not res!70856) (not e!57396))))

(assert (=> b!86281 (= res!70856 (bvslt i!576 nBits!336))))

(declare-fun b!86282 () Bool)

(declare-fun res!70865 () Bool)

(assert (=> b!86282 (=> res!70865 e!57393)))

(assert (=> b!86282 (= res!70865 (not (invariant!0 (currentBit!4440 (_2!3886 lt!135082)) (currentByte!4445 (_2!3886 lt!135082)) (size!1849 (buf!2239 (_2!3886 lt!135082))))))))

(declare-fun res!70861 () Bool)

(assert (=> start!17768 (=> (not res!70861) (not e!57387))))

(assert (=> start!17768 (= res!70861 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!17768 e!57387))

(declare-fun e!57392 () Bool)

(declare-fun inv!12 (BitStream!3260) Bool)

(assert (=> start!17768 (and (inv!12 thiss!1152) e!57392)))

(declare-fun e!57388 () Bool)

(assert (=> start!17768 (and (inv!12 thiss!1151) e!57388)))

(assert (=> start!17768 true))

(declare-fun b!86283 () Bool)

(declare-fun res!70860 () Bool)

(declare-fun e!57394 () Bool)

(assert (=> b!86283 (=> (not res!70860) (not e!57394))))

(declare-fun isPrefixOf!0 (BitStream!3260 BitStream!3260) Bool)

(assert (=> b!86283 (= res!70860 (isPrefixOf!0 thiss!1152 (_2!3887 lt!135086)))))

(declare-fun b!86284 () Bool)

(declare-fun e!57395 () Bool)

(assert (=> b!86284 (= e!57394 e!57395)))

(declare-fun res!70873 () Bool)

(assert (=> b!86284 (=> (not res!70873) (not e!57395))))

(declare-datatypes ((tuple2!7328 0))(
  ( (tuple2!7329 (_1!3888 BitStream!3260) (_2!3888 Bool)) )
))
(declare-fun lt!135085 () tuple2!7328)

(declare-fun lt!135083 () Bool)

(assert (=> b!86284 (= res!70873 (and (= (_2!3888 lt!135085) lt!135083) (= (_1!3888 lt!135085) (_2!3887 lt!135086))))))

(declare-fun readBitPure!0 (BitStream!3260) tuple2!7328)

(declare-fun readerFrom!0 (BitStream!3260 (_ BitVec 32) (_ BitVec 32)) BitStream!3260)

(assert (=> b!86284 (= lt!135085 (readBitPure!0 (readerFrom!0 (_2!3887 lt!135086) (currentBit!4440 thiss!1152) (currentByte!4445 thiss!1152))))))

(declare-fun b!86285 () Bool)

(declare-fun res!70859 () Bool)

(assert (=> b!86285 (=> (not res!70859) (not e!57396))))

(assert (=> b!86285 (= res!70859 (validate_offset_bits!1 ((_ sign_extend 32) (size!1849 (buf!2239 thiss!1152))) ((_ sign_extend 32) (currentByte!4445 thiss!1152)) ((_ sign_extend 32) (currentBit!4440 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun b!86286 () Bool)

(declare-fun lt!135084 () (_ BitVec 64))

(assert (=> b!86286 (= e!57395 (= (bitIndex!0 (size!1849 (buf!2239 (_1!3888 lt!135085))) (currentByte!4445 (_1!3888 lt!135085)) (currentBit!4440 (_1!3888 lt!135085))) lt!135084))))

(declare-fun b!86287 () Bool)

(declare-fun array_inv!1695 (array!4093) Bool)

(assert (=> b!86287 (= e!57392 (array_inv!1695 (buf!2239 thiss!1152)))))

(declare-fun b!86288 () Bool)

(declare-fun res!70863 () Bool)

(assert (=> b!86288 (=> (not res!70863) (not e!57387))))

(assert (=> b!86288 (= res!70863 (invariant!0 (currentBit!4440 thiss!1152) (currentByte!4445 thiss!1152) (size!1849 (buf!2239 thiss!1152))))))

(declare-fun b!86289 () Bool)

(declare-fun res!70867 () Bool)

(assert (=> b!86289 (=> res!70867 e!57393)))

(assert (=> b!86289 (= res!70867 (or (bvsgt (_3!223 lt!135082) nBits!336) (not (= (size!1849 (buf!2239 (_2!3886 lt!135082))) (size!1849 (buf!2239 thiss!1151))))))))

(declare-fun b!86290 () Bool)

(declare-fun e!57389 () Bool)

(assert (=> b!86290 (= e!57389 e!57394)))

(declare-fun res!70857 () Bool)

(assert (=> b!86290 (=> (not res!70857) (not e!57394))))

(assert (=> b!86290 (= res!70857 (= lt!135084 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!135081)))))

(assert (=> b!86290 (= lt!135084 (bitIndex!0 (size!1849 (buf!2239 (_2!3887 lt!135086))) (currentByte!4445 (_2!3887 lt!135086)) (currentBit!4440 (_2!3887 lt!135086))))))

(declare-fun b!86291 () Bool)

(declare-fun res!70871 () Bool)

(assert (=> b!86291 (=> (not res!70871) (not e!57387))))

(assert (=> b!86291 (= res!70871 (and (bvsle i!576 nBits!336) (= (size!1849 (buf!2239 thiss!1152)) (size!1849 (buf!2239 thiss!1151)))))))

(declare-fun b!86292 () Bool)

(declare-fun res!70864 () Bool)

(assert (=> b!86292 (=> (not res!70864) (not e!57387))))

(assert (=> b!86292 (= res!70864 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!86293 () Bool)

(assert (=> b!86293 (= e!57393 (and (bvsle ((_ sign_extend 32) (size!1849 (buf!2239 (_2!3886 lt!135082)))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!4445 (_2!3886 lt!135082))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!4440 (_2!3886 lt!135082))) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(declare-fun b!86294 () Bool)

(assert (=> b!86294 (= e!57396 (not e!57390))))

(declare-fun res!70855 () Bool)

(assert (=> b!86294 (=> res!70855 e!57390)))

(assert (=> b!86294 (= res!70855 (not (invariant!0 (currentBit!4440 (_2!3887 lt!135086)) (currentByte!4445 (_2!3887 lt!135086)) (size!1849 (buf!2239 (_2!3887 lt!135086))))))))

(assert (=> b!86294 e!57389))

(declare-fun res!70872 () Bool)

(assert (=> b!86294 (=> (not res!70872) (not e!57389))))

(assert (=> b!86294 (= res!70872 (= (size!1849 (buf!2239 thiss!1152)) (size!1849 (buf!2239 (_2!3887 lt!135086)))))))

(declare-fun appendBit!0 (BitStream!3260 Bool) tuple2!7326)

(assert (=> b!86294 (= lt!135086 (appendBit!0 thiss!1152 lt!135083))))

(assert (=> b!86294 (= lt!135083 (not (= (bvand v!179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!576))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!86295 () Bool)

(assert (=> b!86295 (= e!57388 (array_inv!1695 (buf!2239 thiss!1151)))))

(declare-fun b!86296 () Bool)

(declare-fun res!70866 () Bool)

(assert (=> b!86296 (=> res!70866 e!57393)))

(assert (=> b!86296 (= res!70866 (not (= (bitIndex!0 (size!1849 (buf!2239 (_2!3886 lt!135082))) (currentByte!4445 (_2!3886 lt!135082)) (currentBit!4440 (_2!3886 lt!135082))) (bvadd lt!135087 ((_ sign_extend 32) (_3!223 lt!135082))))))))

(assert (= (and start!17768 res!70861) b!86279))

(assert (= (and b!86279 res!70868) b!86278))

(assert (= (and b!86278 res!70869) b!86292))

(assert (= (and b!86292 res!70864) b!86288))

(assert (= (and b!86288 res!70863) b!86291))

(assert (= (and b!86291 res!70871) b!86280))

(assert (= (and b!86280 res!70858) b!86285))

(assert (= (and b!86285 res!70859) b!86281))

(assert (= (and b!86281 res!70856) b!86294))

(assert (= (and b!86294 res!70872) b!86290))

(assert (= (and b!86290 res!70857) b!86283))

(assert (= (and b!86283 res!70860) b!86284))

(assert (= (and b!86284 res!70873) b!86286))

(assert (= (and b!86294 (not res!70855)) b!86276))

(assert (= (and b!86276 (not res!70862)) b!86277))

(assert (= (and b!86277 (not res!70870)) b!86282))

(assert (= (and b!86282 (not res!70865)) b!86289))

(assert (= (and b!86289 (not res!70867)) b!86296))

(assert (= (and b!86296 (not res!70866)) b!86293))

(assert (= start!17768 b!86287))

(assert (= start!17768 b!86295))

(declare-fun m!132169 () Bool)

(assert (=> b!86296 m!132169))

(declare-fun m!132171 () Bool)

(assert (=> b!86286 m!132171))

(declare-fun m!132173 () Bool)

(assert (=> b!86280 m!132173))

(declare-fun m!132175 () Bool)

(assert (=> b!86280 m!132175))

(declare-fun m!132177 () Bool)

(assert (=> b!86277 m!132177))

(declare-fun m!132179 () Bool)

(assert (=> b!86294 m!132179))

(declare-fun m!132181 () Bool)

(assert (=> b!86294 m!132181))

(declare-fun m!132183 () Bool)

(assert (=> b!86295 m!132183))

(declare-fun m!132185 () Bool)

(assert (=> b!86285 m!132185))

(declare-fun m!132187 () Bool)

(assert (=> b!86283 m!132187))

(declare-fun m!132189 () Bool)

(assert (=> b!86279 m!132189))

(declare-fun m!132191 () Bool)

(assert (=> b!86287 m!132191))

(declare-fun m!132193 () Bool)

(assert (=> start!17768 m!132193))

(declare-fun m!132195 () Bool)

(assert (=> start!17768 m!132195))

(declare-fun m!132197 () Bool)

(assert (=> b!86278 m!132197))

(declare-fun m!132199 () Bool)

(assert (=> b!86290 m!132199))

(declare-fun m!132201 () Bool)

(assert (=> b!86288 m!132201))

(declare-fun m!132203 () Bool)

(assert (=> b!86282 m!132203))

(declare-fun m!132205 () Bool)

(assert (=> b!86284 m!132205))

(assert (=> b!86284 m!132205))

(declare-fun m!132207 () Bool)

(assert (=> b!86284 m!132207))

(push 1)

(assert (not b!86290))

(assert (not b!86282))

(assert (not b!86287))

(assert (not b!86295))

(assert (not b!86279))

(assert (not b!86283))

(assert (not b!86294))

(assert (not b!86278))

(assert (not b!86280))

(assert (not b!86277))

(assert (not b!86288))

(assert (not b!86285))

(assert (not b!86296))

(assert (not b!86284))

(assert (not b!86286))

(assert (not start!17768))

(check-sat)

(pop 1)

(push 1)

(check-sat)

