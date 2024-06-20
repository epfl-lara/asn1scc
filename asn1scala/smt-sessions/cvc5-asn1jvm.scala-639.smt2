; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17932 () Bool)

(assert start!17932)

(declare-fun b!88068 () Bool)

(declare-fun e!58329 () Bool)

(declare-fun e!58323 () Bool)

(assert (=> b!88068 (= e!58329 e!58323)))

(declare-fun res!72490 () Bool)

(assert (=> b!88068 (=> (not res!72490) (not e!58323))))

(declare-fun lt!135956 () (_ BitVec 64))

(declare-fun lt!135960 () (_ BitVec 64))

(declare-fun i!576 () (_ BitVec 32))

(assert (=> b!88068 (= res!72490 (= lt!135960 (bvadd lt!135956 ((_ sign_extend 32) i!576))))))

(declare-datatypes ((array!4149 0))(
  ( (array!4150 (arr!2511 (Array (_ BitVec 32) (_ BitVec 8))) (size!1874 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3310 0))(
  ( (BitStream!3311 (buf!2264 array!4149) (currentByte!4488 (_ BitVec 32)) (currentBit!4483 (_ BitVec 32))) )
))
(declare-fun thiss!1152 () BitStream!3310)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!88068 (= lt!135960 (bitIndex!0 (size!1874 (buf!2264 thiss!1152)) (currentByte!4488 thiss!1152) (currentBit!4483 thiss!1152)))))

(declare-fun thiss!1151 () BitStream!3310)

(assert (=> b!88068 (= lt!135956 (bitIndex!0 (size!1874 (buf!2264 thiss!1151)) (currentByte!4488 thiss!1151) (currentBit!4483 thiss!1151)))))

(declare-fun b!88069 () Bool)

(declare-fun e!58325 () Bool)

(declare-datatypes ((tuple2!7438 0))(
  ( (tuple2!7439 (_1!3952 BitStream!3310) (_2!3952 Bool)) )
))
(declare-fun lt!135959 () tuple2!7438)

(declare-fun lt!135958 () (_ BitVec 64))

(assert (=> b!88069 (= e!58325 (= (bitIndex!0 (size!1874 (buf!2264 (_1!3952 lt!135959))) (currentByte!4488 (_1!3952 lt!135959)) (currentBit!4483 (_1!3952 lt!135959))) lt!135958))))

(declare-fun b!88070 () Bool)

(declare-fun res!72482 () Bool)

(declare-fun e!58322 () Bool)

(assert (=> b!88070 (=> res!72482 e!58322)))

(declare-datatypes ((Unit!5767 0))(
  ( (Unit!5768) )
))
(declare-datatypes ((tuple2!7440 0))(
  ( (tuple2!7441 (_1!3953 Unit!5767) (_2!3953 BitStream!3310)) )
))
(declare-fun lt!135957 () tuple2!7440)

(assert (=> b!88070 (= res!72482 (not (= (bitIndex!0 (size!1874 (buf!2264 (_2!3953 lt!135957))) (currentByte!4488 (_2!3953 lt!135957)) (currentBit!4483 (_2!3953 lt!135957))) (bvadd lt!135956 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!576))))))))

(declare-fun b!88071 () Bool)

(declare-fun res!72486 () Bool)

(assert (=> b!88071 (=> (not res!72486) (not e!58329))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!88071 (= res!72486 (invariant!0 (currentBit!4483 thiss!1151) (currentByte!4488 thiss!1151) (size!1874 (buf!2264 thiss!1151))))))

(declare-fun b!88072 () Bool)

(declare-fun res!72496 () Bool)

(assert (=> b!88072 (=> (not res!72496) (not e!58323))))

(declare-fun nBits!336 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!88072 (= res!72496 (validate_offset_bits!1 ((_ sign_extend 32) (size!1874 (buf!2264 thiss!1152))) ((_ sign_extend 32) (currentByte!4488 thiss!1152)) ((_ sign_extend 32) (currentBit!4483 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun b!88073 () Bool)

(declare-fun res!72479 () Bool)

(declare-fun e!58324 () Bool)

(assert (=> b!88073 (=> (not res!72479) (not e!58324))))

(declare-fun isPrefixOf!0 (BitStream!3310 BitStream!3310) Bool)

(assert (=> b!88073 (= res!72479 (isPrefixOf!0 thiss!1152 (_2!3953 lt!135957)))))

(declare-fun b!88074 () Bool)

(declare-fun res!72494 () Bool)

(assert (=> b!88074 (=> (not res!72494) (not e!58329))))

(assert (=> b!88074 (= res!72494 (validate_offset_bits!1 ((_ sign_extend 32) (size!1874 (buf!2264 thiss!1151))) ((_ sign_extend 32) (currentByte!4488 thiss!1151)) ((_ sign_extend 32) (currentBit!4483 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun res!72495 () Bool)

(assert (=> start!17932 (=> (not res!72495) (not e!58329))))

(assert (=> start!17932 (= res!72495 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!17932 e!58329))

(declare-fun e!58320 () Bool)

(declare-fun inv!12 (BitStream!3310) Bool)

(assert (=> start!17932 (and (inv!12 thiss!1152) e!58320)))

(declare-fun e!58328 () Bool)

(assert (=> start!17932 (and (inv!12 thiss!1151) e!58328)))

(assert (=> start!17932 true))

(declare-fun b!88075 () Bool)

(declare-fun array_inv!1720 (array!4149) Bool)

(assert (=> b!88075 (= e!58320 (array_inv!1720 (buf!2264 thiss!1152)))))

(declare-fun b!88076 () Bool)

(declare-fun res!72493 () Bool)

(assert (=> b!88076 (=> (not res!72493) (not e!58329))))

(assert (=> b!88076 (= res!72493 (and (bvsle i!576 nBits!336) (= (size!1874 (buf!2264 thiss!1152)) (size!1874 (buf!2264 thiss!1151)))))))

(declare-fun b!88077 () Bool)

(assert (=> b!88077 (= e!58324 e!58325)))

(declare-fun res!72480 () Bool)

(assert (=> b!88077 (=> (not res!72480) (not e!58325))))

(declare-fun lt!135955 () Bool)

(assert (=> b!88077 (= res!72480 (and (= (_2!3952 lt!135959) lt!135955) (= (_1!3952 lt!135959) (_2!3953 lt!135957))))))

(declare-fun readBitPure!0 (BitStream!3310) tuple2!7438)

(declare-fun readerFrom!0 (BitStream!3310 (_ BitVec 32) (_ BitVec 32)) BitStream!3310)

(assert (=> b!88077 (= lt!135959 (readBitPure!0 (readerFrom!0 (_2!3953 lt!135957) (currentBit!4483 thiss!1152) (currentByte!4488 thiss!1152))))))

(declare-fun b!88078 () Bool)

(declare-fun res!72485 () Bool)

(assert (=> b!88078 (=> res!72485 e!58322)))

(assert (=> b!88078 (= res!72485 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4483 (_2!3953 lt!135957)))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4488 (_2!3953 lt!135957)))) ((_ extract 31 0) ((_ sign_extend 32) (size!1874 (buf!2264 (_2!3953 lt!135957))))))))))

(declare-fun b!88079 () Bool)

(declare-fun res!72491 () Bool)

(assert (=> b!88079 (=> (not res!72491) (not e!58329))))

(assert (=> b!88079 (= res!72491 (invariant!0 (currentBit!4483 thiss!1152) (currentByte!4488 thiss!1152) (size!1874 (buf!2264 thiss!1152))))))

(declare-fun b!88080 () Bool)

(declare-fun res!72483 () Bool)

(assert (=> b!88080 (=> res!72483 e!58322)))

(assert (=> b!88080 (= res!72483 (or (bvsgt ((_ sign_extend 32) (size!1874 (buf!2264 (_2!3953 lt!135957)))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!4488 (_2!3953 lt!135957))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!4483 (_2!3953 lt!135957))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvslt ((_ sign_extend 32) (size!1874 (buf!2264 (_2!3953 lt!135957)))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!4488 (_2!3953 lt!135957))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!4483 (_2!3953 lt!135957))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!88081 () Bool)

(assert (=> b!88081 (= e!58322 (bvsge ((_ sign_extend 32) (bvsub nBits!336 (bvadd #b00000000000000000000000000000001 i!576))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!88082 () Bool)

(assert (=> b!88082 (= e!58323 (not e!58322))))

(declare-fun res!72489 () Bool)

(assert (=> b!88082 (=> res!72489 e!58322)))

(assert (=> b!88082 (= res!72489 (not (invariant!0 (currentBit!4483 (_2!3953 lt!135957)) (currentByte!4488 (_2!3953 lt!135957)) (size!1874 (buf!2264 (_2!3953 lt!135957))))))))

(declare-fun e!58327 () Bool)

(assert (=> b!88082 e!58327))

(declare-fun res!72488 () Bool)

(assert (=> b!88082 (=> (not res!72488) (not e!58327))))

(assert (=> b!88082 (= res!72488 (= (size!1874 (buf!2264 thiss!1152)) (size!1874 (buf!2264 (_2!3953 lt!135957)))))))

(declare-fun appendBit!0 (BitStream!3310 Bool) tuple2!7440)

(assert (=> b!88082 (= lt!135957 (appendBit!0 thiss!1152 lt!135955))))

(declare-fun v!179 () (_ BitVec 64))

(assert (=> b!88082 (= lt!135955 (not (= (bvand v!179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!576))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!88083 () Bool)

(assert (=> b!88083 (= e!58328 (array_inv!1720 (buf!2264 thiss!1151)))))

(declare-fun b!88084 () Bool)

(declare-fun res!72481 () Bool)

(assert (=> b!88084 (=> (not res!72481) (not e!58323))))

(assert (=> b!88084 (= res!72481 (bvslt i!576 nBits!336))))

(declare-fun b!88085 () Bool)

(declare-fun res!72487 () Bool)

(assert (=> b!88085 (=> res!72487 e!58322)))

(assert (=> b!88085 (= res!72487 (or (bvslt (bvadd #b00000000000000000000000000000001 i!576) nBits!336) (bvslt (bvadd #b00000000000000000000000000000001 i!576) #b00000000000000000000000000000000) (not (= (size!1874 (buf!2264 (_2!3953 lt!135957))) (size!1874 (buf!2264 thiss!1151))))))))

(declare-fun b!88086 () Bool)

(declare-fun res!72492 () Bool)

(assert (=> b!88086 (=> (not res!72492) (not e!58329))))

(assert (=> b!88086 (= res!72492 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!88087 () Bool)

(assert (=> b!88087 (= e!58327 e!58324)))

(declare-fun res!72484 () Bool)

(assert (=> b!88087 (=> (not res!72484) (not e!58324))))

(assert (=> b!88087 (= res!72484 (= lt!135958 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!135960)))))

(assert (=> b!88087 (= lt!135958 (bitIndex!0 (size!1874 (buf!2264 (_2!3953 lt!135957))) (currentByte!4488 (_2!3953 lt!135957)) (currentBit!4483 (_2!3953 lt!135957))))))

(assert (= (and start!17932 res!72495) b!88074))

(assert (= (and b!88074 res!72494) b!88071))

(assert (= (and b!88071 res!72486) b!88086))

(assert (= (and b!88086 res!72492) b!88079))

(assert (= (and b!88079 res!72491) b!88076))

(assert (= (and b!88076 res!72493) b!88068))

(assert (= (and b!88068 res!72490) b!88072))

(assert (= (and b!88072 res!72496) b!88084))

(assert (= (and b!88084 res!72481) b!88082))

(assert (= (and b!88082 res!72488) b!88087))

(assert (= (and b!88087 res!72484) b!88073))

(assert (= (and b!88073 res!72479) b!88077))

(assert (= (and b!88077 res!72480) b!88069))

(assert (= (and b!88082 (not res!72489)) b!88085))

(assert (= (and b!88085 (not res!72487)) b!88070))

(assert (= (and b!88070 (not res!72482)) b!88080))

(assert (= (and b!88080 (not res!72483)) b!88078))

(assert (= (and b!88078 (not res!72485)) b!88081))

(assert (= start!17932 b!88075))

(assert (= start!17932 b!88083))

(declare-fun m!133337 () Bool)

(assert (=> b!88070 m!133337))

(declare-fun m!133339 () Bool)

(assert (=> b!88082 m!133339))

(declare-fun m!133341 () Bool)

(assert (=> b!88082 m!133341))

(declare-fun m!133343 () Bool)

(assert (=> b!88078 m!133343))

(declare-fun m!133345 () Bool)

(assert (=> b!88068 m!133345))

(declare-fun m!133347 () Bool)

(assert (=> b!88068 m!133347))

(declare-fun m!133349 () Bool)

(assert (=> b!88071 m!133349))

(declare-fun m!133351 () Bool)

(assert (=> b!88079 m!133351))

(declare-fun m!133353 () Bool)

(assert (=> b!88072 m!133353))

(declare-fun m!133355 () Bool)

(assert (=> b!88077 m!133355))

(assert (=> b!88077 m!133355))

(declare-fun m!133357 () Bool)

(assert (=> b!88077 m!133357))

(assert (=> b!88087 m!133337))

(declare-fun m!133359 () Bool)

(assert (=> b!88083 m!133359))

(declare-fun m!133361 () Bool)

(assert (=> b!88073 m!133361))

(declare-fun m!133363 () Bool)

(assert (=> b!88069 m!133363))

(declare-fun m!133365 () Bool)

(assert (=> start!17932 m!133365))

(declare-fun m!133367 () Bool)

(assert (=> start!17932 m!133367))

(declare-fun m!133369 () Bool)

(assert (=> b!88074 m!133369))

(declare-fun m!133371 () Bool)

(assert (=> b!88075 m!133371))

(push 1)

(assert (not b!88074))

(assert (not b!88071))

(assert (not b!88082))

(assert (not b!88068))

(assert (not start!17932))

(assert (not b!88079))

(assert (not b!88075))

(assert (not b!88072))

(assert (not b!88078))

(assert (not b!88087))

(assert (not b!88073))

(assert (not b!88083))

(assert (not b!88077))

(assert (not b!88069))

(assert (not b!88070))

(check-sat)

(pop 1)

(push 1)

(check-sat)

