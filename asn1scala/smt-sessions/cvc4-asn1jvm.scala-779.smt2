; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22378 () Bool)

(assert start!22378)

(declare-fun b!113105 () Bool)

(declare-fun res!93397 () Bool)

(declare-fun e!74219 () Bool)

(assert (=> b!113105 (=> (not res!93397) (not e!74219))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> b!113105 (= res!93397 (bvslt i!615 nBits!396))))

(declare-fun b!113106 () Bool)

(assert (=> b!113106 (= e!74219 (not (bvslt (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) (bvsub nBits!396 i!615))))))

(declare-fun e!74215 () Bool)

(assert (=> b!113106 e!74215))

(declare-fun res!93396 () Bool)

(assert (=> b!113106 (=> (not res!93396) (not e!74215))))

(declare-datatypes ((array!5142 0))(
  ( (array!5143 (arr!2930 (Array (_ BitVec 32) (_ BitVec 8))) (size!2337 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4148 0))(
  ( (BitStream!4149 (buf!2745 array!5142) (currentByte!5325 (_ BitVec 32)) (currentBit!5320 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4148)

(declare-datatypes ((Unit!6941 0))(
  ( (Unit!6942) )
))
(declare-datatypes ((tuple2!9308 0))(
  ( (tuple2!9309 (_1!4916 Unit!6941) (_2!4916 BitStream!4148)) )
))
(declare-fun lt!171908 () tuple2!9308)

(assert (=> b!113106 (= res!93396 (= (size!2337 (buf!2745 thiss!1305)) (size!2337 (buf!2745 (_2!4916 lt!171908)))))))

(declare-fun lt!171910 () Bool)

(declare-fun appendBit!0 (BitStream!4148 Bool) tuple2!9308)

(assert (=> b!113106 (= lt!171908 (appendBit!0 thiss!1305 lt!171910))))

(declare-fun v!199 () (_ BitVec 64))

(assert (=> b!113106 (= lt!171910 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!113107 () Bool)

(declare-fun res!93399 () Bool)

(assert (=> b!113107 (=> (not res!93399) (not e!74219))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!113107 (= res!93399 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!113108 () Bool)

(declare-fun res!93401 () Bool)

(declare-fun e!74220 () Bool)

(assert (=> b!113108 (=> (not res!93401) (not e!74220))))

(declare-fun isPrefixOf!0 (BitStream!4148 BitStream!4148) Bool)

(assert (=> b!113108 (= res!93401 (isPrefixOf!0 thiss!1305 (_2!4916 lt!171908)))))

(declare-fun b!113109 () Bool)

(declare-fun e!74218 () Bool)

(declare-datatypes ((tuple2!9310 0))(
  ( (tuple2!9311 (_1!4917 BitStream!4148) (_2!4917 Bool)) )
))
(declare-fun lt!171911 () tuple2!9310)

(declare-fun lt!171909 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!113109 (= e!74218 (= (bitIndex!0 (size!2337 (buf!2745 (_1!4917 lt!171911))) (currentByte!5325 (_1!4917 lt!171911)) (currentBit!5320 (_1!4917 lt!171911))) lt!171909))))

(declare-fun b!113110 () Bool)

(declare-fun e!74216 () Bool)

(declare-fun array_inv!2139 (array!5142) Bool)

(assert (=> b!113110 (= e!74216 (array_inv!2139 (buf!2745 thiss!1305)))))

(declare-fun b!113111 () Bool)

(assert (=> b!113111 (= e!74220 e!74218)))

(declare-fun res!93400 () Bool)

(assert (=> b!113111 (=> (not res!93400) (not e!74218))))

(assert (=> b!113111 (= res!93400 (and (= (_2!4917 lt!171911) lt!171910) (= (_1!4917 lt!171911) (_2!4916 lt!171908))))))

(declare-fun readBitPure!0 (BitStream!4148) tuple2!9310)

(declare-fun readerFrom!0 (BitStream!4148 (_ BitVec 32) (_ BitVec 32)) BitStream!4148)

(assert (=> b!113111 (= lt!171911 (readBitPure!0 (readerFrom!0 (_2!4916 lt!171908) (currentBit!5320 thiss!1305) (currentByte!5325 thiss!1305))))))

(declare-fun b!113112 () Bool)

(declare-fun res!93394 () Bool)

(assert (=> b!113112 (=> (not res!93394) (not e!74219))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!113112 (= res!93394 (validate_offset_bits!1 ((_ sign_extend 32) (size!2337 (buf!2745 thiss!1305))) ((_ sign_extend 32) (currentByte!5325 thiss!1305)) ((_ sign_extend 32) (currentBit!5320 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun res!93398 () Bool)

(assert (=> start!22378 (=> (not res!93398) (not e!74219))))

(assert (=> start!22378 (= res!93398 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!22378 e!74219))

(assert (=> start!22378 true))

(declare-fun inv!12 (BitStream!4148) Bool)

(assert (=> start!22378 (and (inv!12 thiss!1305) e!74216)))

(declare-fun b!113113 () Bool)

(assert (=> b!113113 (= e!74215 e!74220)))

(declare-fun res!93395 () Bool)

(assert (=> b!113113 (=> (not res!93395) (not e!74220))))

(declare-fun lt!171907 () (_ BitVec 64))

(assert (=> b!113113 (= res!93395 (= lt!171909 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!171907)))))

(assert (=> b!113113 (= lt!171909 (bitIndex!0 (size!2337 (buf!2745 (_2!4916 lt!171908))) (currentByte!5325 (_2!4916 lt!171908)) (currentBit!5320 (_2!4916 lt!171908))))))

(assert (=> b!113113 (= lt!171907 (bitIndex!0 (size!2337 (buf!2745 thiss!1305)) (currentByte!5325 thiss!1305) (currentBit!5320 thiss!1305)))))

(assert (= (and start!22378 res!93398) b!113112))

(assert (= (and b!113112 res!93394) b!113107))

(assert (= (and b!113107 res!93399) b!113105))

(assert (= (and b!113105 res!93397) b!113106))

(assert (= (and b!113106 res!93396) b!113113))

(assert (= (and b!113113 res!93395) b!113108))

(assert (= (and b!113108 res!93401) b!113111))

(assert (= (and b!113111 res!93400) b!113109))

(assert (= start!22378 b!113110))

(declare-fun m!169137 () Bool)

(assert (=> start!22378 m!169137))

(declare-fun m!169139 () Bool)

(assert (=> b!113108 m!169139))

(declare-fun m!169141 () Bool)

(assert (=> b!113110 m!169141))

(declare-fun m!169143 () Bool)

(assert (=> b!113107 m!169143))

(declare-fun m!169145 () Bool)

(assert (=> b!113113 m!169145))

(declare-fun m!169147 () Bool)

(assert (=> b!113113 m!169147))

(declare-fun m!169149 () Bool)

(assert (=> b!113111 m!169149))

(assert (=> b!113111 m!169149))

(declare-fun m!169151 () Bool)

(assert (=> b!113111 m!169151))

(declare-fun m!169153 () Bool)

(assert (=> b!113106 m!169153))

(declare-fun m!169155 () Bool)

(assert (=> b!113109 m!169155))

(declare-fun m!169157 () Bool)

(assert (=> b!113112 m!169157))

(push 1)

(assert (not b!113110))

(assert (not b!113112))

(assert (not b!113111))

(assert (not b!113107))

(assert (not b!113108))

(assert (not start!22378))

(assert (not b!113109))

(assert (not b!113106))

(assert (not b!113113))

(check-sat)

(pop 1)

(push 1)

(check-sat)

