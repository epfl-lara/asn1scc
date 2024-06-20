; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22370 () Bool)

(assert start!22370)

(declare-fun b!112997 () Bool)

(declare-fun e!74145 () Bool)

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!112997 (= e!74145 (not (or (not (= (bvand i!615 #b10000000000000000000000000000000) #b00000000000000000000000000000000)) (= (bvand i!615 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)))))))

(declare-fun e!74144 () Bool)

(assert (=> b!112997 e!74144))

(declare-fun res!93303 () Bool)

(assert (=> b!112997 (=> (not res!93303) (not e!74144))))

(declare-datatypes ((array!5134 0))(
  ( (array!5135 (arr!2926 (Array (_ BitVec 32) (_ BitVec 8))) (size!2333 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4140 0))(
  ( (BitStream!4141 (buf!2741 array!5134) (currentByte!5321 (_ BitVec 32)) (currentBit!5316 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4140)

(declare-datatypes ((Unit!6933 0))(
  ( (Unit!6934) )
))
(declare-datatypes ((tuple2!9292 0))(
  ( (tuple2!9293 (_1!4908 Unit!6933) (_2!4908 BitStream!4140)) )
))
(declare-fun lt!171850 () tuple2!9292)

(assert (=> b!112997 (= res!93303 (= (size!2333 (buf!2741 thiss!1305)) (size!2333 (buf!2741 (_2!4908 lt!171850)))))))

(declare-fun lt!171851 () Bool)

(declare-fun appendBit!0 (BitStream!4140 Bool) tuple2!9292)

(assert (=> b!112997 (= lt!171850 (appendBit!0 thiss!1305 lt!171851))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> b!112997 (= lt!171851 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!112998 () Bool)

(declare-fun res!93300 () Bool)

(assert (=> b!112998 (=> (not res!93300) (not e!74145))))

(assert (=> b!112998 (= res!93300 (bvslt i!615 nBits!396))))

(declare-fun b!112999 () Bool)

(declare-fun res!93302 () Bool)

(declare-fun e!74143 () Bool)

(assert (=> b!112999 (=> (not res!93302) (not e!74143))))

(declare-fun isPrefixOf!0 (BitStream!4140 BitStream!4140) Bool)

(assert (=> b!112999 (= res!93302 (isPrefixOf!0 thiss!1305 (_2!4908 lt!171850)))))

(declare-fun res!93305 () Bool)

(assert (=> start!22370 (=> (not res!93305) (not e!74145))))

(assert (=> start!22370 (= res!93305 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!22370 e!74145))

(assert (=> start!22370 true))

(declare-fun e!74147 () Bool)

(declare-fun inv!12 (BitStream!4140) Bool)

(assert (=> start!22370 (and (inv!12 thiss!1305) e!74147)))

(declare-fun b!113000 () Bool)

(declare-fun e!74146 () Bool)

(assert (=> b!113000 (= e!74143 e!74146)))

(declare-fun res!93299 () Bool)

(assert (=> b!113000 (=> (not res!93299) (not e!74146))))

(declare-datatypes ((tuple2!9294 0))(
  ( (tuple2!9295 (_1!4909 BitStream!4140) (_2!4909 Bool)) )
))
(declare-fun lt!171847 () tuple2!9294)

(assert (=> b!113000 (= res!93299 (and (= (_2!4909 lt!171847) lt!171851) (= (_1!4909 lt!171847) (_2!4908 lt!171850))))))

(declare-fun readBitPure!0 (BitStream!4140) tuple2!9294)

(declare-fun readerFrom!0 (BitStream!4140 (_ BitVec 32) (_ BitVec 32)) BitStream!4140)

(assert (=> b!113000 (= lt!171847 (readBitPure!0 (readerFrom!0 (_2!4908 lt!171850) (currentBit!5316 thiss!1305) (currentByte!5321 thiss!1305))))))

(declare-fun b!113001 () Bool)

(assert (=> b!113001 (= e!74144 e!74143)))

(declare-fun res!93298 () Bool)

(assert (=> b!113001 (=> (not res!93298) (not e!74143))))

(declare-fun lt!171849 () (_ BitVec 64))

(declare-fun lt!171848 () (_ BitVec 64))

(assert (=> b!113001 (= res!93298 (= lt!171849 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!171848)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!113001 (= lt!171849 (bitIndex!0 (size!2333 (buf!2741 (_2!4908 lt!171850))) (currentByte!5321 (_2!4908 lt!171850)) (currentBit!5316 (_2!4908 lt!171850))))))

(assert (=> b!113001 (= lt!171848 (bitIndex!0 (size!2333 (buf!2741 thiss!1305)) (currentByte!5321 thiss!1305) (currentBit!5316 thiss!1305)))))

(declare-fun b!113002 () Bool)

(declare-fun res!93301 () Bool)

(assert (=> b!113002 (=> (not res!93301) (not e!74145))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!113002 (= res!93301 (validate_offset_bits!1 ((_ sign_extend 32) (size!2333 (buf!2741 thiss!1305))) ((_ sign_extend 32) (currentByte!5321 thiss!1305)) ((_ sign_extend 32) (currentBit!5316 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun b!113003 () Bool)

(declare-fun res!93304 () Bool)

(assert (=> b!113003 (=> (not res!93304) (not e!74145))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!113003 (= res!93304 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!113004 () Bool)

(assert (=> b!113004 (= e!74146 (= (bitIndex!0 (size!2333 (buf!2741 (_1!4909 lt!171847))) (currentByte!5321 (_1!4909 lt!171847)) (currentBit!5316 (_1!4909 lt!171847))) lt!171849))))

(declare-fun b!113005 () Bool)

(declare-fun array_inv!2135 (array!5134) Bool)

(assert (=> b!113005 (= e!74147 (array_inv!2135 (buf!2741 thiss!1305)))))

(assert (= (and start!22370 res!93305) b!113002))

(assert (= (and b!113002 res!93301) b!113003))

(assert (= (and b!113003 res!93304) b!112998))

(assert (= (and b!112998 res!93300) b!112997))

(assert (= (and b!112997 res!93303) b!113001))

(assert (= (and b!113001 res!93298) b!112999))

(assert (= (and b!112999 res!93302) b!113000))

(assert (= (and b!113000 res!93299) b!113004))

(assert (= start!22370 b!113005))

(declare-fun m!169049 () Bool)

(assert (=> b!113003 m!169049))

(declare-fun m!169051 () Bool)

(assert (=> b!113001 m!169051))

(declare-fun m!169053 () Bool)

(assert (=> b!113001 m!169053))

(declare-fun m!169055 () Bool)

(assert (=> b!113004 m!169055))

(declare-fun m!169057 () Bool)

(assert (=> b!112997 m!169057))

(declare-fun m!169059 () Bool)

(assert (=> start!22370 m!169059))

(declare-fun m!169061 () Bool)

(assert (=> b!113002 m!169061))

(declare-fun m!169063 () Bool)

(assert (=> b!113000 m!169063))

(assert (=> b!113000 m!169063))

(declare-fun m!169065 () Bool)

(assert (=> b!113000 m!169065))

(declare-fun m!169067 () Bool)

(assert (=> b!113005 m!169067))

(declare-fun m!169069 () Bool)

(assert (=> b!112999 m!169069))

(check-sat (not b!113001) (not start!22370) (not b!113000) (not b!112997) (not b!113003) (not b!112999) (not b!113004) (not b!113005) (not b!113002))
(check-sat)
