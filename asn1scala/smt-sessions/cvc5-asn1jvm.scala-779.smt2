; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22374 () Bool)

(assert start!22374)

(declare-fun b!113051 () Bool)

(declare-fun e!74181 () Bool)

(declare-fun e!74184 () Bool)

(assert (=> b!113051 (= e!74181 e!74184)))

(declare-fun res!93346 () Bool)

(assert (=> b!113051 (=> (not res!93346) (not e!74184))))

(declare-fun lt!171879 () (_ BitVec 64))

(declare-fun lt!171881 () (_ BitVec 64))

(assert (=> b!113051 (= res!93346 (= lt!171879 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!171881)))))

(declare-datatypes ((array!5138 0))(
  ( (array!5139 (arr!2928 (Array (_ BitVec 32) (_ BitVec 8))) (size!2335 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4144 0))(
  ( (BitStream!4145 (buf!2743 array!5138) (currentByte!5323 (_ BitVec 32)) (currentBit!5318 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!6937 0))(
  ( (Unit!6938) )
))
(declare-datatypes ((tuple2!9300 0))(
  ( (tuple2!9301 (_1!4912 Unit!6937) (_2!4912 BitStream!4144)) )
))
(declare-fun lt!171877 () tuple2!9300)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!113051 (= lt!171879 (bitIndex!0 (size!2335 (buf!2743 (_2!4912 lt!171877))) (currentByte!5323 (_2!4912 lt!171877)) (currentBit!5318 (_2!4912 lt!171877))))))

(declare-fun thiss!1305 () BitStream!4144)

(assert (=> b!113051 (= lt!171881 (bitIndex!0 (size!2335 (buf!2743 thiss!1305)) (currentByte!5323 thiss!1305) (currentBit!5318 thiss!1305)))))

(declare-fun b!113052 () Bool)

(declare-fun res!93347 () Bool)

(assert (=> b!113052 (=> (not res!93347) (not e!74184))))

(declare-fun isPrefixOf!0 (BitStream!4144 BitStream!4144) Bool)

(assert (=> b!113052 (= res!93347 (isPrefixOf!0 thiss!1305 (_2!4912 lt!171877)))))

(declare-fun b!113053 () Bool)

(declare-fun res!93349 () Bool)

(declare-fun e!74179 () Bool)

(assert (=> b!113053 (=> (not res!93349) (not e!74179))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> b!113053 (= res!93349 (bvslt i!615 nBits!396))))

(declare-fun b!113054 () Bool)

(declare-fun e!74183 () Bool)

(declare-datatypes ((tuple2!9302 0))(
  ( (tuple2!9303 (_1!4913 BitStream!4144) (_2!4913 Bool)) )
))
(declare-fun lt!171878 () tuple2!9302)

(assert (=> b!113054 (= e!74183 (= (bitIndex!0 (size!2335 (buf!2743 (_1!4913 lt!171878))) (currentByte!5323 (_1!4913 lt!171878)) (currentBit!5318 (_1!4913 lt!171878))) lt!171879))))

(declare-fun b!113055 () Bool)

(declare-fun e!74180 () Bool)

(declare-fun array_inv!2137 (array!5138) Bool)

(assert (=> b!113055 (= e!74180 (array_inv!2137 (buf!2743 thiss!1305)))))

(declare-fun b!113056 () Bool)

(declare-fun res!93348 () Bool)

(assert (=> b!113056 (=> (not res!93348) (not e!74179))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!113056 (= res!93348 (validate_offset_bits!1 ((_ sign_extend 32) (size!2335 (buf!2743 thiss!1305))) ((_ sign_extend 32) (currentByte!5323 thiss!1305)) ((_ sign_extend 32) (currentBit!5318 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun b!113057 () Bool)

(assert (=> b!113057 (= e!74179 (not (bvslt (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) (bvsub nBits!396 i!615))))))

(assert (=> b!113057 e!74181))

(declare-fun res!93351 () Bool)

(assert (=> b!113057 (=> (not res!93351) (not e!74181))))

(assert (=> b!113057 (= res!93351 (= (size!2335 (buf!2743 thiss!1305)) (size!2335 (buf!2743 (_2!4912 lt!171877)))))))

(declare-fun lt!171880 () Bool)

(declare-fun appendBit!0 (BitStream!4144 Bool) tuple2!9300)

(assert (=> b!113057 (= lt!171877 (appendBit!0 thiss!1305 lt!171880))))

(declare-fun v!199 () (_ BitVec 64))

(assert (=> b!113057 (= lt!171880 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!93350 () Bool)

(assert (=> start!22374 (=> (not res!93350) (not e!74179))))

(assert (=> start!22374 (= res!93350 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!22374 e!74179))

(assert (=> start!22374 true))

(declare-fun inv!12 (BitStream!4144) Bool)

(assert (=> start!22374 (and (inv!12 thiss!1305) e!74180)))

(declare-fun b!113058 () Bool)

(declare-fun res!93352 () Bool)

(assert (=> b!113058 (=> (not res!93352) (not e!74179))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!113058 (= res!93352 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!113059 () Bool)

(assert (=> b!113059 (= e!74184 e!74183)))

(declare-fun res!93353 () Bool)

(assert (=> b!113059 (=> (not res!93353) (not e!74183))))

(assert (=> b!113059 (= res!93353 (and (= (_2!4913 lt!171878) lt!171880) (= (_1!4913 lt!171878) (_2!4912 lt!171877))))))

(declare-fun readBitPure!0 (BitStream!4144) tuple2!9302)

(declare-fun readerFrom!0 (BitStream!4144 (_ BitVec 32) (_ BitVec 32)) BitStream!4144)

(assert (=> b!113059 (= lt!171878 (readBitPure!0 (readerFrom!0 (_2!4912 lt!171877) (currentBit!5318 thiss!1305) (currentByte!5323 thiss!1305))))))

(assert (= (and start!22374 res!93350) b!113056))

(assert (= (and b!113056 res!93348) b!113058))

(assert (= (and b!113058 res!93352) b!113053))

(assert (= (and b!113053 res!93349) b!113057))

(assert (= (and b!113057 res!93351) b!113051))

(assert (= (and b!113051 res!93346) b!113052))

(assert (= (and b!113052 res!93347) b!113059))

(assert (= (and b!113059 res!93353) b!113054))

(assert (= start!22374 b!113055))

(declare-fun m!169093 () Bool)

(assert (=> b!113059 m!169093))

(assert (=> b!113059 m!169093))

(declare-fun m!169095 () Bool)

(assert (=> b!113059 m!169095))

(declare-fun m!169097 () Bool)

(assert (=> b!113056 m!169097))

(declare-fun m!169099 () Bool)

(assert (=> b!113051 m!169099))

(declare-fun m!169101 () Bool)

(assert (=> b!113051 m!169101))

(declare-fun m!169103 () Bool)

(assert (=> b!113058 m!169103))

(declare-fun m!169105 () Bool)

(assert (=> b!113052 m!169105))

(declare-fun m!169107 () Bool)

(assert (=> start!22374 m!169107))

(declare-fun m!169109 () Bool)

(assert (=> b!113055 m!169109))

(declare-fun m!169111 () Bool)

(assert (=> b!113054 m!169111))

(declare-fun m!169113 () Bool)

(assert (=> b!113057 m!169113))

(push 1)

(assert (not b!113052))

(assert (not b!113058))

(assert (not start!22374))

(assert (not b!113051))

(assert (not b!113059))

(assert (not b!113057))

(assert (not b!113056))

(assert (not b!113054))

(assert (not b!113055))

(check-sat)

(pop 1)

(push 1)

(check-sat)

