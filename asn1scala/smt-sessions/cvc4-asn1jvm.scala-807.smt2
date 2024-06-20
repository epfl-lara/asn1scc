; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!23568 () Bool)

(assert start!23568)

(declare-fun b!119554 () Bool)

(declare-fun e!78344 () Bool)

(declare-datatypes ((array!5343 0))(
  ( (array!5344 (arr!3014 (Array (_ BitVec 32) (_ BitVec 8))) (size!2421 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4316 0))(
  ( (BitStream!4317 (buf!2846 array!5343) (currentByte!5513 (_ BitVec 32)) (currentBit!5508 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4316)

(declare-datatypes ((Unit!7361 0))(
  ( (Unit!7362) )
))
(declare-datatypes ((tuple2!10028 0))(
  ( (tuple2!10029 (_1!5279 Unit!7361) (_2!5279 BitStream!4316)) )
))
(declare-fun lt!185073 () tuple2!10028)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!119554 (= e!78344 (invariant!0 (currentBit!5508 thiss!1305) (currentByte!5513 thiss!1305) (size!2421 (buf!2846 (_2!5279 lt!185073)))))))

(declare-fun b!119555 () Bool)

(declare-fun e!78347 () Bool)

(declare-datatypes ((tuple2!10030 0))(
  ( (tuple2!10031 (_1!5280 BitStream!4316) (_2!5280 Bool)) )
))
(declare-fun lt!185079 () tuple2!10030)

(declare-fun lt!185070 () tuple2!10030)

(assert (=> b!119555 (= e!78347 (= (_2!5280 lt!185079) (_2!5280 lt!185070)))))

(declare-fun b!119556 () Bool)

(declare-fun e!78350 () Bool)

(declare-fun lt!185080 () tuple2!10030)

(declare-fun lt!185065 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!119556 (= e!78350 (= (bitIndex!0 (size!2421 (buf!2846 (_1!5280 lt!185080))) (currentByte!5513 (_1!5280 lt!185080)) (currentBit!5508 (_1!5280 lt!185080))) lt!185065))))

(declare-fun b!119557 () Bool)

(declare-fun res!98976 () Bool)

(declare-fun e!78348 () Bool)

(assert (=> b!119557 (=> (not res!98976) (not e!78348))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!119557 (= res!98976 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!119558 () Bool)

(declare-fun e!78346 () Bool)

(declare-fun array_inv!2223 (array!5343) Bool)

(assert (=> b!119558 (= e!78346 (array_inv!2223 (buf!2846 thiss!1305)))))

(declare-fun b!119559 () Bool)

(declare-fun e!78351 () Bool)

(assert (=> b!119559 (= e!78351 e!78350)))

(declare-fun res!98973 () Bool)

(assert (=> b!119559 (=> (not res!98973) (not e!78350))))

(declare-fun lt!185077 () Bool)

(declare-fun lt!185059 () tuple2!10028)

(assert (=> b!119559 (= res!98973 (and (= (_2!5280 lt!185080) lt!185077) (= (_1!5280 lt!185080) (_2!5279 lt!185059))))))

(declare-fun readBitPure!0 (BitStream!4316) tuple2!10030)

(declare-fun readerFrom!0 (BitStream!4316 (_ BitVec 32) (_ BitVec 32)) BitStream!4316)

(assert (=> b!119559 (= lt!185080 (readBitPure!0 (readerFrom!0 (_2!5279 lt!185059) (currentBit!5508 thiss!1305) (currentByte!5513 thiss!1305))))))

(declare-fun b!119560 () Bool)

(declare-fun res!98972 () Bool)

(assert (=> b!119560 (=> (not res!98972) (not e!78344))))

(assert (=> b!119560 (= res!98972 (invariant!0 (currentBit!5508 thiss!1305) (currentByte!5513 thiss!1305) (size!2421 (buf!2846 (_2!5279 lt!185059)))))))

(declare-fun res!98970 () Bool)

(declare-fun e!78345 () Bool)

(assert (=> start!23568 (=> (not res!98970) (not e!78345))))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> start!23568 (= res!98970 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!23568 e!78345))

(assert (=> start!23568 true))

(declare-fun inv!12 (BitStream!4316) Bool)

(assert (=> start!23568 (and (inv!12 thiss!1305) e!78346)))

(declare-fun b!119561 () Bool)

(declare-fun e!78343 () Bool)

(assert (=> b!119561 (= e!78348 (not e!78343))))

(declare-fun res!98967 () Bool)

(assert (=> b!119561 (=> res!98967 e!78343)))

(declare-fun lt!185057 () (_ BitVec 64))

(declare-datatypes ((tuple2!10032 0))(
  ( (tuple2!10033 (_1!5281 BitStream!4316) (_2!5281 BitStream!4316)) )
))
(declare-fun lt!185064 () tuple2!10032)

(declare-datatypes ((tuple2!10034 0))(
  ( (tuple2!10035 (_1!5282 BitStream!4316) (_2!5282 (_ BitVec 64))) )
))
(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4316 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!10034)

(assert (=> b!119561 (= res!98967 (not (= (_1!5282 (readNLeastSignificantBitsLoopPure!0 (_1!5281 lt!185064) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!185057)) (_2!5281 lt!185064))))))

(declare-fun lt!185078 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!119561 (validate_offset_bits!1 ((_ sign_extend 32) (size!2421 (buf!2846 (_2!5279 lt!185073)))) ((_ sign_extend 32) (currentByte!5513 (_2!5279 lt!185059))) ((_ sign_extend 32) (currentBit!5508 (_2!5279 lt!185059))) lt!185078)))

(declare-fun lt!185071 () Unit!7361)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4316 array!5343 (_ BitVec 64)) Unit!7361)

(assert (=> b!119561 (= lt!185071 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5279 lt!185059) (buf!2846 (_2!5279 lt!185073)) lt!185078))))

(assert (=> b!119561 (= lt!185078 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!185067 () tuple2!10030)

(declare-fun lt!185082 () (_ BitVec 64))

(declare-fun lt!185069 () (_ BitVec 64))

(assert (=> b!119561 (= lt!185057 (bvor lt!185082 (ite (_2!5280 lt!185067) lt!185069 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!185056 () tuple2!10034)

(declare-fun lt!185060 () tuple2!10032)

(assert (=> b!119561 (= lt!185056 (readNLeastSignificantBitsLoopPure!0 (_1!5281 lt!185060) nBits!396 i!615 lt!185082))))

(declare-fun lt!185055 () (_ BitVec 64))

(assert (=> b!119561 (validate_offset_bits!1 ((_ sign_extend 32) (size!2421 (buf!2846 (_2!5279 lt!185073)))) ((_ sign_extend 32) (currentByte!5513 thiss!1305)) ((_ sign_extend 32) (currentBit!5508 thiss!1305)) lt!185055)))

(declare-fun lt!185072 () Unit!7361)

(assert (=> b!119561 (= lt!185072 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2846 (_2!5279 lt!185073)) lt!185055))))

(assert (=> b!119561 (= lt!185082 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(assert (=> b!119561 (= (_2!5280 lt!185067) lt!185077)))

(assert (=> b!119561 (= lt!185067 (readBitPure!0 (_1!5281 lt!185060)))))

(declare-fun reader!0 (BitStream!4316 BitStream!4316) tuple2!10032)

(assert (=> b!119561 (= lt!185064 (reader!0 (_2!5279 lt!185059) (_2!5279 lt!185073)))))

(assert (=> b!119561 (= lt!185060 (reader!0 thiss!1305 (_2!5279 lt!185073)))))

(assert (=> b!119561 e!78347))

(declare-fun res!98966 () Bool)

(assert (=> b!119561 (=> (not res!98966) (not e!78347))))

(assert (=> b!119561 (= res!98966 (= (bitIndex!0 (size!2421 (buf!2846 (_1!5280 lt!185079))) (currentByte!5513 (_1!5280 lt!185079)) (currentBit!5508 (_1!5280 lt!185079))) (bitIndex!0 (size!2421 (buf!2846 (_1!5280 lt!185070))) (currentByte!5513 (_1!5280 lt!185070)) (currentBit!5508 (_1!5280 lt!185070)))))))

(declare-fun lt!185076 () Unit!7361)

(declare-fun lt!185061 () BitStream!4316)

(declare-fun readBitPrefixLemma!0 (BitStream!4316 BitStream!4316) Unit!7361)

(assert (=> b!119561 (= lt!185076 (readBitPrefixLemma!0 lt!185061 (_2!5279 lt!185073)))))

(assert (=> b!119561 (= lt!185070 (readBitPure!0 (BitStream!4317 (buf!2846 (_2!5279 lt!185073)) (currentByte!5513 thiss!1305) (currentBit!5508 thiss!1305))))))

(assert (=> b!119561 (= lt!185079 (readBitPure!0 lt!185061))))

(assert (=> b!119561 (= lt!185061 (BitStream!4317 (buf!2846 (_2!5279 lt!185059)) (currentByte!5513 thiss!1305) (currentBit!5508 thiss!1305)))))

(assert (=> b!119561 e!78344))

(declare-fun res!98974 () Bool)

(assert (=> b!119561 (=> (not res!98974) (not e!78344))))

(declare-fun isPrefixOf!0 (BitStream!4316 BitStream!4316) Bool)

(assert (=> b!119561 (= res!98974 (isPrefixOf!0 thiss!1305 (_2!5279 lt!185073)))))

(declare-fun lt!185066 () Unit!7361)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4316 BitStream!4316 BitStream!4316) Unit!7361)

(assert (=> b!119561 (= lt!185066 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5279 lt!185059) (_2!5279 lt!185073)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4316 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!10028)

(assert (=> b!119561 (= lt!185073 (appendNLeastSignificantBitsLoop!0 (_2!5279 lt!185059) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!78342 () Bool)

(assert (=> b!119561 e!78342))

(declare-fun res!98968 () Bool)

(assert (=> b!119561 (=> (not res!98968) (not e!78342))))

(assert (=> b!119561 (= res!98968 (= (size!2421 (buf!2846 thiss!1305)) (size!2421 (buf!2846 (_2!5279 lt!185059)))))))

(declare-fun appendBit!0 (BitStream!4316 Bool) tuple2!10028)

(assert (=> b!119561 (= lt!185059 (appendBit!0 thiss!1305 lt!185077))))

(assert (=> b!119561 (= lt!185077 (not (= (bvand v!199 lt!185069) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!119561 (= lt!185069 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!119562 () Bool)

(declare-fun res!98971 () Bool)

(assert (=> b!119562 (=> (not res!98971) (not e!78351))))

(assert (=> b!119562 (= res!98971 (isPrefixOf!0 thiss!1305 (_2!5279 lt!185059)))))

(declare-fun b!119563 () Bool)

(declare-fun res!98975 () Bool)

(assert (=> b!119563 (=> (not res!98975) (not e!78348))))

(assert (=> b!119563 (= res!98975 (bvslt i!615 nBits!396))))

(declare-fun lt!185068 () (_ BitVec 64))

(declare-fun lt!185081 () (_ BitVec 64))

(declare-fun lt!185063 () (_ BitVec 64))

(declare-fun b!119564 () Bool)

(assert (=> b!119564 (= e!78343 (or (= lt!185081 (bvand lt!185068 #b1000000000000000000000000000000000000000000000000000000000000000)) (= lt!185081 (bvand (bvsub lt!185063 lt!185068) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!119564 (= lt!185081 (bvand lt!185063 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!119564 (= lt!185063 (bitIndex!0 (size!2421 (buf!2846 (_2!5279 lt!185059))) (currentByte!5513 (_2!5279 lt!185059)) (currentBit!5508 (_2!5279 lt!185059))))))

(declare-fun lt!185075 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!4316 (_ BitVec 64)) BitStream!4316)

(assert (=> b!119564 (= (_1!5281 lt!185060) (withMovedBitIndex!0 (_2!5281 lt!185060) (bvsub lt!185075 lt!185068)))))

(assert (=> b!119564 (= lt!185068 (bitIndex!0 (size!2421 (buf!2846 (_2!5279 lt!185073))) (currentByte!5513 (_2!5279 lt!185073)) (currentBit!5508 (_2!5279 lt!185073))))))

(assert (=> b!119564 (= lt!185075 (bitIndex!0 (size!2421 (buf!2846 thiss!1305)) (currentByte!5513 thiss!1305) (currentBit!5508 thiss!1305)))))

(declare-fun lt!185058 () tuple2!10034)

(assert (=> b!119564 (and (= (_2!5282 lt!185056) (_2!5282 lt!185058)) (= (_1!5282 lt!185056) (_1!5282 lt!185058)))))

(declare-fun lt!185062 () Unit!7361)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4316 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!7361)

(assert (=> b!119564 (= lt!185062 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5281 lt!185060) nBits!396 i!615 lt!185082))))

(assert (=> b!119564 (= lt!185058 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!5281 lt!185060) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!185057))))

(declare-fun b!119565 () Bool)

(assert (=> b!119565 (= e!78342 e!78351)))

(declare-fun res!98969 () Bool)

(assert (=> b!119565 (=> (not res!98969) (not e!78351))))

(declare-fun lt!185074 () (_ BitVec 64))

(assert (=> b!119565 (= res!98969 (= lt!185065 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!185074)))))

(assert (=> b!119565 (= lt!185065 (bitIndex!0 (size!2421 (buf!2846 (_2!5279 lt!185059))) (currentByte!5513 (_2!5279 lt!185059)) (currentBit!5508 (_2!5279 lt!185059))))))

(assert (=> b!119565 (= lt!185074 (bitIndex!0 (size!2421 (buf!2846 thiss!1305)) (currentByte!5513 thiss!1305) (currentBit!5508 thiss!1305)))))

(declare-fun b!119566 () Bool)

(assert (=> b!119566 (= e!78345 e!78348)))

(declare-fun res!98965 () Bool)

(assert (=> b!119566 (=> (not res!98965) (not e!78348))))

(assert (=> b!119566 (= res!98965 (validate_offset_bits!1 ((_ sign_extend 32) (size!2421 (buf!2846 thiss!1305))) ((_ sign_extend 32) (currentByte!5513 thiss!1305)) ((_ sign_extend 32) (currentBit!5508 thiss!1305)) lt!185055))))

(assert (=> b!119566 (= lt!185055 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(assert (= (and start!23568 res!98970) b!119566))

(assert (= (and b!119566 res!98965) b!119557))

(assert (= (and b!119557 res!98976) b!119563))

(assert (= (and b!119563 res!98975) b!119561))

(assert (= (and b!119561 res!98968) b!119565))

(assert (= (and b!119565 res!98969) b!119562))

(assert (= (and b!119562 res!98971) b!119559))

(assert (= (and b!119559 res!98973) b!119556))

(assert (= (and b!119561 res!98974) b!119560))

(assert (= (and b!119560 res!98972) b!119554))

(assert (= (and b!119561 res!98966) b!119555))

(assert (= (and b!119561 (not res!98967)) b!119564))

(assert (= start!23568 b!119558))

(declare-fun m!180119 () Bool)

(assert (=> b!119564 m!180119))

(declare-fun m!180121 () Bool)

(assert (=> b!119564 m!180121))

(declare-fun m!180123 () Bool)

(assert (=> b!119564 m!180123))

(declare-fun m!180125 () Bool)

(assert (=> b!119564 m!180125))

(assert (=> b!119564 m!180121))

(declare-fun m!180127 () Bool)

(assert (=> b!119564 m!180127))

(declare-fun m!180129 () Bool)

(assert (=> b!119564 m!180129))

(declare-fun m!180131 () Bool)

(assert (=> b!119564 m!180131))

(declare-fun m!180133 () Bool)

(assert (=> b!119554 m!180133))

(declare-fun m!180135 () Bool)

(assert (=> b!119560 m!180135))

(declare-fun m!180137 () Bool)

(assert (=> b!119556 m!180137))

(declare-fun m!180139 () Bool)

(assert (=> b!119561 m!180139))

(declare-fun m!180141 () Bool)

(assert (=> b!119561 m!180141))

(declare-fun m!180143 () Bool)

(assert (=> b!119561 m!180143))

(declare-fun m!180145 () Bool)

(assert (=> b!119561 m!180145))

(declare-fun m!180147 () Bool)

(assert (=> b!119561 m!180147))

(declare-fun m!180149 () Bool)

(assert (=> b!119561 m!180149))

(declare-fun m!180151 () Bool)

(assert (=> b!119561 m!180151))

(declare-fun m!180153 () Bool)

(assert (=> b!119561 m!180153))

(declare-fun m!180155 () Bool)

(assert (=> b!119561 m!180155))

(declare-fun m!180157 () Bool)

(assert (=> b!119561 m!180157))

(declare-fun m!180159 () Bool)

(assert (=> b!119561 m!180159))

(declare-fun m!180161 () Bool)

(assert (=> b!119561 m!180161))

(declare-fun m!180163 () Bool)

(assert (=> b!119561 m!180163))

(declare-fun m!180165 () Bool)

(assert (=> b!119561 m!180165))

(declare-fun m!180167 () Bool)

(assert (=> b!119561 m!180167))

(declare-fun m!180169 () Bool)

(assert (=> b!119561 m!180169))

(declare-fun m!180171 () Bool)

(assert (=> b!119561 m!180171))

(declare-fun m!180173 () Bool)

(assert (=> b!119561 m!180173))

(declare-fun m!180175 () Bool)

(assert (=> b!119561 m!180175))

(declare-fun m!180177 () Bool)

(assert (=> b!119558 m!180177))

(declare-fun m!180179 () Bool)

(assert (=> b!119562 m!180179))

(assert (=> b!119565 m!180119))

(assert (=> b!119565 m!180131))

(declare-fun m!180181 () Bool)

(assert (=> b!119559 m!180181))

(assert (=> b!119559 m!180181))

(declare-fun m!180183 () Bool)

(assert (=> b!119559 m!180183))

(declare-fun m!180185 () Bool)

(assert (=> b!119557 m!180185))

(declare-fun m!180187 () Bool)

(assert (=> b!119566 m!180187))

(declare-fun m!180189 () Bool)

(assert (=> start!23568 m!180189))

(push 1)

(assert (not b!119565))

(assert (not b!119561))

(assert (not b!119557))

(assert (not b!119554))

(assert (not b!119558))

(assert (not b!119560))

(assert (not b!119562))

(assert (not b!119566))

(assert (not b!119559))

(assert (not b!119564))

(assert (not start!23568))

(assert (not b!119556))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!38398 () Bool)

(declare-datatypes ((tuple2!10044 0))(
  ( (tuple2!10045 (_1!5287 Bool) (_2!5287 BitStream!4316)) )
))
(declare-fun lt!185259 () tuple2!10044)

(declare-fun readBit!0 (BitStream!4316) tuple2!10044)

(assert (=> d!38398 (= lt!185259 (readBit!0 (_1!5281 lt!185060)))))

(assert (=> d!38398 (= (readBitPure!0 (_1!5281 lt!185060)) (tuple2!10031 (_2!5287 lt!185259) (_1!5287 lt!185259)))))

(declare-fun bs!9292 () Bool)

(assert (= bs!9292 d!38398))

(declare-fun m!180329 () Bool)

(assert (=> bs!9292 m!180329))

(assert (=> b!119561 d!38398))

(declare-datatypes ((tuple2!10046 0))(
  ( (tuple2!10047 (_1!5288 (_ BitVec 64)) (_2!5288 BitStream!4316)) )
))
(declare-fun lt!185268 () tuple2!10046)

(declare-fun d!38410 () Bool)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!4316 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!10046)

(assert (=> d!38410 (= lt!185268 (readNLeastSignificantBitsLoop!0 (_1!5281 lt!185064) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!185057))))

(assert (=> d!38410 (= (readNLeastSignificantBitsLoopPure!0 (_1!5281 lt!185064) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!185057) (tuple2!10035 (_2!5288 lt!185268) (_1!5288 lt!185268)))))

(declare-fun bs!9293 () Bool)

(assert (= bs!9293 d!38410))

(declare-fun m!180335 () Bool)

(assert (=> bs!9293 m!180335))

(assert (=> b!119561 d!38410))

(declare-fun d!38414 () Bool)

(declare-fun lt!185269 () tuple2!10044)

(assert (=> d!38414 (= lt!185269 (readBit!0 (BitStream!4317 (buf!2846 (_2!5279 lt!185073)) (currentByte!5513 thiss!1305) (currentBit!5508 thiss!1305))))))

(assert (=> d!38414 (= (readBitPure!0 (BitStream!4317 (buf!2846 (_2!5279 lt!185073)) (currentByte!5513 thiss!1305) (currentBit!5508 thiss!1305))) (tuple2!10031 (_2!5287 lt!185269) (_1!5287 lt!185269)))))

(declare-fun bs!9294 () Bool)

(assert (= bs!9294 d!38414))

(declare-fun m!180337 () Bool)

(assert (=> bs!9294 m!180337))

(assert (=> b!119561 d!38414))

(declare-fun d!38416 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!38416 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2421 (buf!2846 (_2!5279 lt!185073)))) ((_ sign_extend 32) (currentByte!5513 (_2!5279 lt!185059))) ((_ sign_extend 32) (currentBit!5508 (_2!5279 lt!185059))) lt!185078) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2421 (buf!2846 (_2!5279 lt!185073)))) ((_ sign_extend 32) (currentByte!5513 (_2!5279 lt!185059))) ((_ sign_extend 32) (currentBit!5508 (_2!5279 lt!185059)))) lt!185078))))

(declare-fun bs!9295 () Bool)

(assert (= bs!9295 d!38416))

(declare-fun m!180339 () Bool)

(assert (=> bs!9295 m!180339))

(assert (=> b!119561 d!38416))

(declare-fun lt!185747 () tuple2!10032)

(declare-fun e!78462 () Bool)

(declare-fun b!119766 () Bool)

(declare-fun lt!185768 () tuple2!10034)

(assert (=> b!119766 (= e!78462 (and (= (_2!5282 lt!185768) v!199) (= (_1!5282 lt!185768) (_2!5281 lt!185747))))))

(declare-fun lt!185750 () (_ BitVec 64))

(assert (=> b!119766 (= lt!185768 (readNLeastSignificantBitsLoopPure!0 (_1!5281 lt!185747) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!185750))))

(declare-fun lt!185779 () Unit!7361)

(declare-fun lt!185766 () Unit!7361)

(assert (=> b!119766 (= lt!185779 lt!185766)))

(declare-fun lt!185764 () tuple2!10028)

(declare-fun lt!185754 () (_ BitVec 64))

(assert (=> b!119766 (validate_offset_bits!1 ((_ sign_extend 32) (size!2421 (buf!2846 (_2!5279 lt!185764)))) ((_ sign_extend 32) (currentByte!5513 (_2!5279 lt!185059))) ((_ sign_extend 32) (currentBit!5508 (_2!5279 lt!185059))) lt!185754)))

(assert (=> b!119766 (= lt!185766 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5279 lt!185059) (buf!2846 (_2!5279 lt!185764)) lt!185754))))

(declare-fun e!78464 () Bool)

(assert (=> b!119766 e!78464))

(declare-fun res!99132 () Bool)

(assert (=> b!119766 (=> (not res!99132) (not e!78464))))

(assert (=> b!119766 (= res!99132 (and (= (size!2421 (buf!2846 (_2!5279 lt!185059))) (size!2421 (buf!2846 (_2!5279 lt!185764)))) (bvsge lt!185754 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!119766 (= lt!185754 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!119766 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!119766 (= lt!185750 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!119766 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!119766 (= lt!185747 (reader!0 (_2!5279 lt!185059) (_2!5279 lt!185764)))))

(declare-fun b!119767 () Bool)

(declare-fun res!99134 () Bool)

(declare-fun lt!185763 () tuple2!10028)

(assert (=> b!119767 (= res!99134 (isPrefixOf!0 (_2!5279 lt!185059) (_2!5279 lt!185763)))))

(declare-fun e!78463 () Bool)

(assert (=> b!119767 (=> (not res!99134) (not e!78463))))

(declare-fun b!119768 () Bool)

(declare-fun e!78461 () Bool)

(declare-fun lt!185740 () tuple2!10030)

(assert (=> b!119768 (= e!78461 (= (bitIndex!0 (size!2421 (buf!2846 (_1!5280 lt!185740))) (currentByte!5513 (_1!5280 lt!185740)) (currentBit!5508 (_1!5280 lt!185740))) (bitIndex!0 (size!2421 (buf!2846 (_2!5279 lt!185763))) (currentByte!5513 (_2!5279 lt!185763)) (currentBit!5508 (_2!5279 lt!185763)))))))

(declare-fun d!38418 () Bool)

(assert (=> d!38418 e!78462))

(declare-fun res!99136 () Bool)

(assert (=> d!38418 (=> (not res!99136) (not e!78462))))

(assert (=> d!38418 (= res!99136 (= (size!2421 (buf!2846 (_2!5279 lt!185059))) (size!2421 (buf!2846 (_2!5279 lt!185764)))))))

(declare-fun e!78466 () tuple2!10028)

(assert (=> d!38418 (= lt!185764 e!78466)))

(declare-fun c!7205 () Bool)

(assert (=> d!38418 (= c!7205 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!38418 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!38418 (= (appendNLeastSignificantBitsLoop!0 (_2!5279 lt!185059) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!185764)))

(declare-fun b!119769 () Bool)

(declare-fun res!99131 () Bool)

(assert (=> b!119769 (=> (not res!99131) (not e!78462))))

(declare-fun lt!185761 () (_ BitVec 64))

(declare-fun lt!185755 () (_ BitVec 64))

(assert (=> b!119769 (= res!99131 (= (bitIndex!0 (size!2421 (buf!2846 (_2!5279 lt!185764))) (currentByte!5513 (_2!5279 lt!185764)) (currentBit!5508 (_2!5279 lt!185764))) (bvadd lt!185761 lt!185755)))))

(assert (=> b!119769 (or (not (= (bvand lt!185761 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!185755 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!185761 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!185761 lt!185755) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!119769 (= lt!185755 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!119769 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!119769 (= lt!185761 (bitIndex!0 (size!2421 (buf!2846 (_2!5279 lt!185059))) (currentByte!5513 (_2!5279 lt!185059)) (currentBit!5508 (_2!5279 lt!185059))))))

(declare-fun lt!185778 () BitStream!4316)

(declare-fun lt!185751 () tuple2!10028)

(declare-fun call!1562 () Bool)

(declare-fun bm!1559 () Bool)

(assert (=> bm!1559 (= call!1562 (isPrefixOf!0 (ite c!7205 (_2!5279 lt!185059) lt!185778) (ite c!7205 (_2!5279 lt!185751) lt!185778)))))

(declare-fun b!119770 () Bool)

(declare-fun e!78465 () (_ BitVec 64))

(assert (=> b!119770 (= e!78465 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!119771 () Bool)

(declare-fun Unit!7378 () Unit!7361)

(assert (=> b!119771 (= e!78466 (tuple2!10029 Unit!7378 (_2!5279 lt!185751)))))

(declare-fun lt!185758 () Bool)

(assert (=> b!119771 (= lt!185758 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!119771 (= lt!185763 (appendBit!0 (_2!5279 lt!185059) lt!185758))))

(declare-fun res!99139 () Bool)

(assert (=> b!119771 (= res!99139 (= (size!2421 (buf!2846 (_2!5279 lt!185059))) (size!2421 (buf!2846 (_2!5279 lt!185763)))))))

(assert (=> b!119771 (=> (not res!99139) (not e!78463))))

(assert (=> b!119771 e!78463))

(declare-fun lt!185741 () tuple2!10028)

(assert (=> b!119771 (= lt!185741 lt!185763)))

(assert (=> b!119771 (= lt!185751 (appendNLeastSignificantBitsLoop!0 (_2!5279 lt!185741) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!185745 () Unit!7361)

(assert (=> b!119771 (= lt!185745 (lemmaIsPrefixTransitive!0 (_2!5279 lt!185059) (_2!5279 lt!185741) (_2!5279 lt!185751)))))

(assert (=> b!119771 call!1562))

(declare-fun lt!185762 () Unit!7361)

(assert (=> b!119771 (= lt!185762 lt!185745)))

(assert (=> b!119771 (invariant!0 (currentBit!5508 (_2!5279 lt!185059)) (currentByte!5513 (_2!5279 lt!185059)) (size!2421 (buf!2846 (_2!5279 lt!185741))))))

(declare-fun lt!185752 () BitStream!4316)

(assert (=> b!119771 (= lt!185752 (BitStream!4317 (buf!2846 (_2!5279 lt!185741)) (currentByte!5513 (_2!5279 lt!185059)) (currentBit!5508 (_2!5279 lt!185059))))))

(assert (=> b!119771 (invariant!0 (currentBit!5508 lt!185752) (currentByte!5513 lt!185752) (size!2421 (buf!2846 (_2!5279 lt!185751))))))

(declare-fun lt!185770 () BitStream!4316)

(assert (=> b!119771 (= lt!185770 (BitStream!4317 (buf!2846 (_2!5279 lt!185751)) (currentByte!5513 lt!185752) (currentBit!5508 lt!185752)))))

(declare-fun lt!185760 () tuple2!10030)

(assert (=> b!119771 (= lt!185760 (readBitPure!0 lt!185752))))

(declare-fun lt!185759 () tuple2!10030)

(assert (=> b!119771 (= lt!185759 (readBitPure!0 lt!185770))))

(declare-fun lt!185781 () Unit!7361)

(assert (=> b!119771 (= lt!185781 (readBitPrefixLemma!0 lt!185752 (_2!5279 lt!185751)))))

(declare-fun res!99133 () Bool)

(assert (=> b!119771 (= res!99133 (= (bitIndex!0 (size!2421 (buf!2846 (_1!5280 lt!185760))) (currentByte!5513 (_1!5280 lt!185760)) (currentBit!5508 (_1!5280 lt!185760))) (bitIndex!0 (size!2421 (buf!2846 (_1!5280 lt!185759))) (currentByte!5513 (_1!5280 lt!185759)) (currentBit!5508 (_1!5280 lt!185759)))))))

(declare-fun e!78460 () Bool)

(assert (=> b!119771 (=> (not res!99133) (not e!78460))))

(assert (=> b!119771 e!78460))

(declare-fun lt!185769 () Unit!7361)

(assert (=> b!119771 (= lt!185769 lt!185781)))

(declare-fun lt!185772 () tuple2!10032)

(assert (=> b!119771 (= lt!185772 (reader!0 (_2!5279 lt!185059) (_2!5279 lt!185751)))))

(declare-fun lt!185738 () tuple2!10032)

(assert (=> b!119771 (= lt!185738 (reader!0 (_2!5279 lt!185741) (_2!5279 lt!185751)))))

(declare-fun lt!185757 () tuple2!10030)

(assert (=> b!119771 (= lt!185757 (readBitPure!0 (_1!5281 lt!185772)))))

(assert (=> b!119771 (= (_2!5280 lt!185757) lt!185758)))

(declare-fun lt!185773 () Unit!7361)

(declare-fun Unit!7379 () Unit!7361)

(assert (=> b!119771 (= lt!185773 Unit!7379)))

(declare-fun lt!185777 () (_ BitVec 64))

(assert (=> b!119771 (= lt!185777 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!185767 () (_ BitVec 64))

(assert (=> b!119771 (= lt!185767 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!185756 () Unit!7361)

(assert (=> b!119771 (= lt!185756 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5279 lt!185059) (buf!2846 (_2!5279 lt!185751)) lt!185767))))

(assert (=> b!119771 (validate_offset_bits!1 ((_ sign_extend 32) (size!2421 (buf!2846 (_2!5279 lt!185751)))) ((_ sign_extend 32) (currentByte!5513 (_2!5279 lt!185059))) ((_ sign_extend 32) (currentBit!5508 (_2!5279 lt!185059))) lt!185767)))

(declare-fun lt!185739 () Unit!7361)

(assert (=> b!119771 (= lt!185739 lt!185756)))

(declare-fun lt!185775 () tuple2!10034)

(assert (=> b!119771 (= lt!185775 (readNLeastSignificantBitsLoopPure!0 (_1!5281 lt!185772) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!185777))))

(declare-fun lt!185742 () (_ BitVec 64))

(assert (=> b!119771 (= lt!185742 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!185774 () Unit!7361)

(assert (=> b!119771 (= lt!185774 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5279 lt!185741) (buf!2846 (_2!5279 lt!185751)) lt!185742))))

(assert (=> b!119771 (validate_offset_bits!1 ((_ sign_extend 32) (size!2421 (buf!2846 (_2!5279 lt!185751)))) ((_ sign_extend 32) (currentByte!5513 (_2!5279 lt!185741))) ((_ sign_extend 32) (currentBit!5508 (_2!5279 lt!185741))) lt!185742)))

(declare-fun lt!185744 () Unit!7361)

(assert (=> b!119771 (= lt!185744 lt!185774)))

(declare-fun lt!185748 () tuple2!10034)

(assert (=> b!119771 (= lt!185748 (readNLeastSignificantBitsLoopPure!0 (_1!5281 lt!185738) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!185777 (ite (_2!5280 lt!185757) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!185753 () tuple2!10034)

(assert (=> b!119771 (= lt!185753 (readNLeastSignificantBitsLoopPure!0 (_1!5281 lt!185772) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!185777))))

(declare-fun c!7204 () Bool)

(assert (=> b!119771 (= c!7204 (_2!5280 (readBitPure!0 (_1!5281 lt!185772))))))

(declare-fun lt!185771 () tuple2!10034)

(assert (=> b!119771 (= lt!185771 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!5281 lt!185772) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!185777 e!78465)))))

(declare-fun lt!185743 () Unit!7361)

(assert (=> b!119771 (= lt!185743 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5281 lt!185772) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!185777))))

(assert (=> b!119771 (and (= (_2!5282 lt!185753) (_2!5282 lt!185771)) (= (_1!5282 lt!185753) (_1!5282 lt!185771)))))

(declare-fun lt!185749 () Unit!7361)

(assert (=> b!119771 (= lt!185749 lt!185743)))

(assert (=> b!119771 (= (_1!5281 lt!185772) (withMovedBitIndex!0 (_2!5281 lt!185772) (bvsub (bitIndex!0 (size!2421 (buf!2846 (_2!5279 lt!185059))) (currentByte!5513 (_2!5279 lt!185059)) (currentBit!5508 (_2!5279 lt!185059))) (bitIndex!0 (size!2421 (buf!2846 (_2!5279 lt!185751))) (currentByte!5513 (_2!5279 lt!185751)) (currentBit!5508 (_2!5279 lt!185751))))))))

(declare-fun lt!185765 () Unit!7361)

(declare-fun Unit!7380 () Unit!7361)

(assert (=> b!119771 (= lt!185765 Unit!7380)))

(assert (=> b!119771 (= (_1!5281 lt!185738) (withMovedBitIndex!0 (_2!5281 lt!185738) (bvsub (bitIndex!0 (size!2421 (buf!2846 (_2!5279 lt!185741))) (currentByte!5513 (_2!5279 lt!185741)) (currentBit!5508 (_2!5279 lt!185741))) (bitIndex!0 (size!2421 (buf!2846 (_2!5279 lt!185751))) (currentByte!5513 (_2!5279 lt!185751)) (currentBit!5508 (_2!5279 lt!185751))))))))

(declare-fun lt!185746 () Unit!7361)

(declare-fun Unit!7381 () Unit!7361)

(assert (=> b!119771 (= lt!185746 Unit!7381)))

(assert (=> b!119771 (= (bitIndex!0 (size!2421 (buf!2846 (_2!5279 lt!185059))) (currentByte!5513 (_2!5279 lt!185059)) (currentBit!5508 (_2!5279 lt!185059))) (bvsub (bitIndex!0 (size!2421 (buf!2846 (_2!5279 lt!185741))) (currentByte!5513 (_2!5279 lt!185741)) (currentBit!5508 (_2!5279 lt!185741))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!185782 () Unit!7361)

(declare-fun Unit!7383 () Unit!7361)

(assert (=> b!119771 (= lt!185782 Unit!7383)))

(assert (=> b!119771 (= (_2!5282 lt!185775) (_2!5282 lt!185748))))

(declare-fun lt!185780 () Unit!7361)

(declare-fun Unit!7384 () Unit!7361)

(assert (=> b!119771 (= lt!185780 Unit!7384)))

(assert (=> b!119771 (= (_1!5282 lt!185775) (_2!5281 lt!185772))))

(declare-fun b!119772 () Bool)

(assert (=> b!119772 (= lt!185740 (readBitPure!0 (readerFrom!0 (_2!5279 lt!185763) (currentBit!5508 (_2!5279 lt!185059)) (currentByte!5513 (_2!5279 lt!185059)))))))

(declare-fun res!99138 () Bool)

(assert (=> b!119772 (= res!99138 (and (= (_2!5280 lt!185740) lt!185758) (= (_1!5280 lt!185740) (_2!5279 lt!185763))))))

(assert (=> b!119772 (=> (not res!99138) (not e!78461))))

(assert (=> b!119772 (= e!78463 e!78461)))

(declare-fun b!119773 () Bool)

(assert (=> b!119773 (= e!78460 (= (_2!5280 lt!185760) (_2!5280 lt!185759)))))

(declare-fun b!119774 () Bool)

(declare-fun res!99137 () Bool)

(assert (=> b!119774 (= res!99137 (= (bitIndex!0 (size!2421 (buf!2846 (_2!5279 lt!185763))) (currentByte!5513 (_2!5279 lt!185763)) (currentBit!5508 (_2!5279 lt!185763))) (bvadd (bitIndex!0 (size!2421 (buf!2846 (_2!5279 lt!185059))) (currentByte!5513 (_2!5279 lt!185059)) (currentBit!5508 (_2!5279 lt!185059))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!119774 (=> (not res!99137) (not e!78463))))

(declare-fun b!119775 () Bool)

(assert (=> b!119775 (= e!78465 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun b!119776 () Bool)

(declare-fun lt!185776 () Unit!7361)

(assert (=> b!119776 (= e!78466 (tuple2!10029 lt!185776 (_2!5279 lt!185059)))))

(assert (=> b!119776 (= lt!185778 (_2!5279 lt!185059))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4316) Unit!7361)

(assert (=> b!119776 (= lt!185776 (lemmaIsPrefixRefl!0 lt!185778))))

(assert (=> b!119776 call!1562))

(declare-fun b!119777 () Bool)

(declare-fun res!99135 () Bool)

(assert (=> b!119777 (=> (not res!99135) (not e!78462))))

(assert (=> b!119777 (= res!99135 (isPrefixOf!0 (_2!5279 lt!185059) (_2!5279 lt!185764)))))

(declare-fun b!119778 () Bool)

(assert (=> b!119778 (= e!78464 (validate_offset_bits!1 ((_ sign_extend 32) (size!2421 (buf!2846 (_2!5279 lt!185059)))) ((_ sign_extend 32) (currentByte!5513 (_2!5279 lt!185059))) ((_ sign_extend 32) (currentBit!5508 (_2!5279 lt!185059))) lt!185754))))

(assert (= (and d!38418 c!7205) b!119771))

(assert (= (and d!38418 (not c!7205)) b!119776))

(assert (= (and b!119771 res!99139) b!119774))

(assert (= (and b!119774 res!99137) b!119767))

(assert (= (and b!119767 res!99134) b!119772))

(assert (= (and b!119772 res!99138) b!119768))

(assert (= (and b!119771 res!99133) b!119773))

(assert (= (and b!119771 c!7204) b!119775))

(assert (= (and b!119771 (not c!7204)) b!119770))

(assert (= (or b!119771 b!119776) bm!1559))

(assert (= (and d!38418 res!99136) b!119769))

(assert (= (and b!119769 res!99131) b!119777))

(assert (= (and b!119777 res!99135) b!119766))

(assert (= (and b!119766 res!99132) b!119778))

(declare-fun m!180573 () Bool)

(assert (=> b!119769 m!180573))

(assert (=> b!119769 m!180119))

(declare-fun m!180575 () Bool)

(assert (=> b!119767 m!180575))

(declare-fun m!180577 () Bool)

(assert (=> b!119768 m!180577))

(declare-fun m!180579 () Bool)

(assert (=> b!119768 m!180579))

(declare-fun m!180581 () Bool)

(assert (=> b!119776 m!180581))

(assert (=> b!119774 m!180579))

(assert (=> b!119774 m!180119))

(declare-fun m!180583 () Bool)

(assert (=> bm!1559 m!180583))

(declare-fun m!180585 () Bool)

(assert (=> b!119772 m!180585))

(assert (=> b!119772 m!180585))

(declare-fun m!180587 () Bool)

(assert (=> b!119772 m!180587))

(declare-fun m!180589 () Bool)

(assert (=> b!119777 m!180589))

(declare-fun m!180591 () Bool)

(assert (=> b!119778 m!180591))

(declare-fun m!180593 () Bool)

(assert (=> b!119771 m!180593))

(declare-fun m!180595 () Bool)

(assert (=> b!119771 m!180595))

(declare-fun m!180597 () Bool)

(assert (=> b!119771 m!180597))

(assert (=> b!119771 m!180119))

(declare-fun m!180599 () Bool)

(assert (=> b!119771 m!180599))

(declare-fun m!180601 () Bool)

(assert (=> b!119771 m!180601))

(declare-fun m!180603 () Bool)

(assert (=> b!119771 m!180603))

(declare-fun m!180605 () Bool)

(assert (=> b!119771 m!180605))

(declare-fun m!180607 () Bool)

(assert (=> b!119771 m!180607))

(declare-fun m!180609 () Bool)

(assert (=> b!119771 m!180609))

(declare-fun m!180611 () Bool)

(assert (=> b!119771 m!180611))

(declare-fun m!180613 () Bool)

(assert (=> b!119771 m!180613))

(declare-fun m!180615 () Bool)

(assert (=> b!119771 m!180615))

(declare-fun m!180617 () Bool)

(assert (=> b!119771 m!180617))

(declare-fun m!180619 () Bool)

(assert (=> b!119771 m!180619))

(declare-fun m!180621 () Bool)

(assert (=> b!119771 m!180621))

(declare-fun m!180623 () Bool)

(assert (=> b!119771 m!180623))

(declare-fun m!180625 () Bool)

(assert (=> b!119771 m!180625))

(declare-fun m!180627 () Bool)

(assert (=> b!119771 m!180627))

(declare-fun m!180629 () Bool)

(assert (=> b!119771 m!180629))

(declare-fun m!180631 () Bool)

(assert (=> b!119771 m!180631))

(declare-fun m!180633 () Bool)

(assert (=> b!119771 m!180633))

(declare-fun m!180635 () Bool)

(assert (=> b!119771 m!180635))

(declare-fun m!180637 () Bool)

(assert (=> b!119771 m!180637))

(assert (=> b!119771 m!180631))

(declare-fun m!180639 () Bool)

(assert (=> b!119771 m!180639))

(declare-fun m!180641 () Bool)

(assert (=> b!119771 m!180641))

(declare-fun m!180643 () Bool)

(assert (=> b!119771 m!180643))

(declare-fun m!180645 () Bool)

(assert (=> b!119771 m!180645))

(declare-fun m!180647 () Bool)

(assert (=> b!119766 m!180647))

(declare-fun m!180649 () Bool)

(assert (=> b!119766 m!180649))

(assert (=> b!119766 m!180621))

(declare-fun m!180651 () Bool)

(assert (=> b!119766 m!180651))

(declare-fun m!180653 () Bool)

(assert (=> b!119766 m!180653))

(assert (=> b!119561 d!38418))

(declare-fun d!38450 () Bool)

(declare-fun res!99150 () Bool)

(declare-fun e!78474 () Bool)

(assert (=> d!38450 (=> (not res!99150) (not e!78474))))

(assert (=> d!38450 (= res!99150 (= (size!2421 (buf!2846 thiss!1305)) (size!2421 (buf!2846 (_2!5279 lt!185073)))))))

(assert (=> d!38450 (= (isPrefixOf!0 thiss!1305 (_2!5279 lt!185073)) e!78474)))

(declare-fun b!119788 () Bool)

(declare-fun res!99151 () Bool)

(assert (=> b!119788 (=> (not res!99151) (not e!78474))))

(assert (=> b!119788 (= res!99151 (bvsle (bitIndex!0 (size!2421 (buf!2846 thiss!1305)) (currentByte!5513 thiss!1305) (currentBit!5508 thiss!1305)) (bitIndex!0 (size!2421 (buf!2846 (_2!5279 lt!185073))) (currentByte!5513 (_2!5279 lt!185073)) (currentBit!5508 (_2!5279 lt!185073)))))))

(declare-fun b!119789 () Bool)

(declare-fun e!78475 () Bool)

(assert (=> b!119789 (= e!78474 e!78475)))

(declare-fun res!99149 () Bool)

(assert (=> b!119789 (=> res!99149 e!78475)))

(assert (=> b!119789 (= res!99149 (= (size!2421 (buf!2846 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!119790 () Bool)

(declare-fun arrayBitRangesEq!0 (array!5343 array!5343 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!119790 (= e!78475 (arrayBitRangesEq!0 (buf!2846 thiss!1305) (buf!2846 (_2!5279 lt!185073)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2421 (buf!2846 thiss!1305)) (currentByte!5513 thiss!1305) (currentBit!5508 thiss!1305))))))

(assert (= (and d!38450 res!99150) b!119788))

(assert (= (and b!119788 res!99151) b!119789))

(assert (= (and b!119789 (not res!99149)) b!119790))

(assert (=> b!119788 m!180131))

(assert (=> b!119788 m!180129))

(assert (=> b!119790 m!180131))

(assert (=> b!119790 m!180131))

(declare-fun m!180657 () Bool)

(assert (=> b!119790 m!180657))

(assert (=> b!119561 d!38450))

(declare-fun d!38452 () Bool)

(assert (=> d!38452 (validate_offset_bits!1 ((_ sign_extend 32) (size!2421 (buf!2846 (_2!5279 lt!185073)))) ((_ sign_extend 32) (currentByte!5513 thiss!1305)) ((_ sign_extend 32) (currentBit!5508 thiss!1305)) lt!185055)))

(declare-fun lt!185806 () Unit!7361)

(declare-fun choose!9 (BitStream!4316 array!5343 (_ BitVec 64) BitStream!4316) Unit!7361)

(assert (=> d!38452 (= lt!185806 (choose!9 thiss!1305 (buf!2846 (_2!5279 lt!185073)) lt!185055 (BitStream!4317 (buf!2846 (_2!5279 lt!185073)) (currentByte!5513 thiss!1305) (currentBit!5508 thiss!1305))))))

(assert (=> d!38452 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2846 (_2!5279 lt!185073)) lt!185055) lt!185806)))

(declare-fun bs!9311 () Bool)

(assert (= bs!9311 d!38452))

(assert (=> bs!9311 m!180161))

(declare-fun m!180679 () Bool)

(assert (=> bs!9311 m!180679))

(assert (=> b!119561 d!38452))

(declare-fun d!38468 () Bool)

(assert (=> d!38468 (validate_offset_bits!1 ((_ sign_extend 32) (size!2421 (buf!2846 (_2!5279 lt!185073)))) ((_ sign_extend 32) (currentByte!5513 (_2!5279 lt!185059))) ((_ sign_extend 32) (currentBit!5508 (_2!5279 lt!185059))) lt!185078)))

(declare-fun lt!185807 () Unit!7361)

(assert (=> d!38468 (= lt!185807 (choose!9 (_2!5279 lt!185059) (buf!2846 (_2!5279 lt!185073)) lt!185078 (BitStream!4317 (buf!2846 (_2!5279 lt!185073)) (currentByte!5513 (_2!5279 lt!185059)) (currentBit!5508 (_2!5279 lt!185059)))))))

(assert (=> d!38468 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5279 lt!185059) (buf!2846 (_2!5279 lt!185073)) lt!185078) lt!185807)))

(declare-fun bs!9312 () Bool)

(assert (= bs!9312 d!38468))

(assert (=> bs!9312 m!180175))

(declare-fun m!180681 () Bool)

(assert (=> bs!9312 m!180681))

(assert (=> b!119561 d!38468))

(declare-fun d!38470 () Bool)

(declare-fun lt!185808 () tuple2!10044)

(assert (=> d!38470 (= lt!185808 (readBit!0 lt!185061))))

(assert (=> d!38470 (= (readBitPure!0 lt!185061) (tuple2!10031 (_2!5287 lt!185808) (_1!5287 lt!185808)))))

(declare-fun bs!9313 () Bool)

(assert (= bs!9313 d!38470))

(declare-fun m!180683 () Bool)

(assert (=> bs!9313 m!180683))

(assert (=> b!119561 d!38470))

(declare-fun lt!185894 () (_ BitVec 64))

(declare-fun b!119833 () Bool)

(declare-fun e!78497 () Bool)

(declare-fun lt!185900 () (_ BitVec 64))

(declare-fun lt!185890 () tuple2!10032)

(assert (=> b!119833 (= e!78497 (= (_1!5281 lt!185890) (withMovedBitIndex!0 (_2!5281 lt!185890) (bvsub lt!185894 lt!185900))))))

(assert (=> b!119833 (or (= (bvand lt!185894 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!185900 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!185894 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!185894 lt!185900) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!119833 (= lt!185900 (bitIndex!0 (size!2421 (buf!2846 (_2!5279 lt!185073))) (currentByte!5513 (_2!5279 lt!185073)) (currentBit!5508 (_2!5279 lt!185073))))))

(assert (=> b!119833 (= lt!185894 (bitIndex!0 (size!2421 (buf!2846 (_2!5279 lt!185059))) (currentByte!5513 (_2!5279 lt!185059)) (currentBit!5508 (_2!5279 lt!185059))))))

(declare-fun b!119834 () Bool)

(declare-fun res!99187 () Bool)

(assert (=> b!119834 (=> (not res!99187) (not e!78497))))

(assert (=> b!119834 (= res!99187 (isPrefixOf!0 (_1!5281 lt!185890) (_2!5279 lt!185059)))))

(declare-fun b!119835 () Bool)

(declare-fun e!78498 () Unit!7361)

(declare-fun Unit!7385 () Unit!7361)

(assert (=> b!119835 (= e!78498 Unit!7385)))

(declare-fun b!119836 () Bool)

(declare-fun lt!185883 () Unit!7361)

(assert (=> b!119836 (= e!78498 lt!185883)))

(declare-fun lt!185889 () (_ BitVec 64))

(assert (=> b!119836 (= lt!185889 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!185888 () (_ BitVec 64))

(assert (=> b!119836 (= lt!185888 (bitIndex!0 (size!2421 (buf!2846 (_2!5279 lt!185059))) (currentByte!5513 (_2!5279 lt!185059)) (currentBit!5508 (_2!5279 lt!185059))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!5343 array!5343 (_ BitVec 64) (_ BitVec 64)) Unit!7361)

(assert (=> b!119836 (= lt!185883 (arrayBitRangesEqSymmetric!0 (buf!2846 (_2!5279 lt!185059)) (buf!2846 (_2!5279 lt!185073)) lt!185889 lt!185888))))

(assert (=> b!119836 (arrayBitRangesEq!0 (buf!2846 (_2!5279 lt!185073)) (buf!2846 (_2!5279 lt!185059)) lt!185889 lt!185888)))

(declare-fun d!38472 () Bool)

(assert (=> d!38472 e!78497))

(declare-fun res!99189 () Bool)

(assert (=> d!38472 (=> (not res!99189) (not e!78497))))

(assert (=> d!38472 (= res!99189 (isPrefixOf!0 (_1!5281 lt!185890) (_2!5281 lt!185890)))))

(declare-fun lt!185895 () BitStream!4316)

(assert (=> d!38472 (= lt!185890 (tuple2!10033 lt!185895 (_2!5279 lt!185073)))))

(declare-fun lt!185897 () Unit!7361)

(declare-fun lt!185882 () Unit!7361)

(assert (=> d!38472 (= lt!185897 lt!185882)))

(assert (=> d!38472 (isPrefixOf!0 lt!185895 (_2!5279 lt!185073))))

(assert (=> d!38472 (= lt!185882 (lemmaIsPrefixTransitive!0 lt!185895 (_2!5279 lt!185073) (_2!5279 lt!185073)))))

(declare-fun lt!185893 () Unit!7361)

(declare-fun lt!185892 () Unit!7361)

(assert (=> d!38472 (= lt!185893 lt!185892)))

(assert (=> d!38472 (isPrefixOf!0 lt!185895 (_2!5279 lt!185073))))

(assert (=> d!38472 (= lt!185892 (lemmaIsPrefixTransitive!0 lt!185895 (_2!5279 lt!185059) (_2!5279 lt!185073)))))

(declare-fun lt!185881 () Unit!7361)

(assert (=> d!38472 (= lt!185881 e!78498)))

(declare-fun c!7209 () Bool)

(assert (=> d!38472 (= c!7209 (not (= (size!2421 (buf!2846 (_2!5279 lt!185059))) #b00000000000000000000000000000000)))))

(declare-fun lt!185891 () Unit!7361)

(declare-fun lt!185885 () Unit!7361)

(assert (=> d!38472 (= lt!185891 lt!185885)))

(assert (=> d!38472 (isPrefixOf!0 (_2!5279 lt!185073) (_2!5279 lt!185073))))

(assert (=> d!38472 (= lt!185885 (lemmaIsPrefixRefl!0 (_2!5279 lt!185073)))))

(declare-fun lt!185898 () Unit!7361)

(declare-fun lt!185896 () Unit!7361)

(assert (=> d!38472 (= lt!185898 lt!185896)))

(assert (=> d!38472 (= lt!185896 (lemmaIsPrefixRefl!0 (_2!5279 lt!185073)))))

(declare-fun lt!185886 () Unit!7361)

(declare-fun lt!185884 () Unit!7361)

(assert (=> d!38472 (= lt!185886 lt!185884)))

(assert (=> d!38472 (isPrefixOf!0 lt!185895 lt!185895)))

(assert (=> d!38472 (= lt!185884 (lemmaIsPrefixRefl!0 lt!185895))))

(declare-fun lt!185899 () Unit!7361)

(declare-fun lt!185887 () Unit!7361)

(assert (=> d!38472 (= lt!185899 lt!185887)))

(assert (=> d!38472 (isPrefixOf!0 (_2!5279 lt!185059) (_2!5279 lt!185059))))

(assert (=> d!38472 (= lt!185887 (lemmaIsPrefixRefl!0 (_2!5279 lt!185059)))))

(assert (=> d!38472 (= lt!185895 (BitStream!4317 (buf!2846 (_2!5279 lt!185073)) (currentByte!5513 (_2!5279 lt!185059)) (currentBit!5508 (_2!5279 lt!185059))))))

(assert (=> d!38472 (isPrefixOf!0 (_2!5279 lt!185059) (_2!5279 lt!185073))))

(assert (=> d!38472 (= (reader!0 (_2!5279 lt!185059) (_2!5279 lt!185073)) lt!185890)))

(declare-fun b!119837 () Bool)

(declare-fun res!99188 () Bool)

(assert (=> b!119837 (=> (not res!99188) (not e!78497))))

(assert (=> b!119837 (= res!99188 (isPrefixOf!0 (_2!5281 lt!185890) (_2!5279 lt!185073)))))

(assert (= (and d!38472 c!7209) b!119836))

(assert (= (and d!38472 (not c!7209)) b!119835))

(assert (= (and d!38472 res!99189) b!119834))

(assert (= (and b!119834 res!99187) b!119837))

(assert (= (and b!119837 res!99188) b!119833))

(declare-fun m!180729 () Bool)

(assert (=> b!119834 m!180729))

(declare-fun m!180731 () Bool)

(assert (=> b!119833 m!180731))

(assert (=> b!119833 m!180129))

(assert (=> b!119833 m!180119))

(declare-fun m!180733 () Bool)

(assert (=> b!119837 m!180733))

(declare-fun m!180735 () Bool)

(assert (=> d!38472 m!180735))

(declare-fun m!180737 () Bool)

(assert (=> d!38472 m!180737))

(declare-fun m!180739 () Bool)

(assert (=> d!38472 m!180739))

(declare-fun m!180741 () Bool)

(assert (=> d!38472 m!180741))

(declare-fun m!180743 () Bool)

(assert (=> d!38472 m!180743))

(declare-fun m!180745 () Bool)

(assert (=> d!38472 m!180745))

(declare-fun m!180747 () Bool)

(assert (=> d!38472 m!180747))

(declare-fun m!180749 () Bool)

(assert (=> d!38472 m!180749))

(declare-fun m!180751 () Bool)

(assert (=> d!38472 m!180751))

(declare-fun m!180753 () Bool)

(assert (=> d!38472 m!180753))

(declare-fun m!180755 () Bool)

(assert (=> d!38472 m!180755))

(assert (=> b!119836 m!180119))

(declare-fun m!180757 () Bool)

(assert (=> b!119836 m!180757))

(declare-fun m!180759 () Bool)

(assert (=> b!119836 m!180759))

(assert (=> b!119561 d!38472))

(declare-fun d!38482 () Bool)

(assert (=> d!38482 (= (onesLSBLong!0 (bvsub nBits!396 i!615)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!396 i!615)))))))

(assert (=> b!119561 d!38482))

(declare-fun d!38484 () Bool)

(assert (=> d!38484 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2421 (buf!2846 (_2!5279 lt!185073)))) ((_ sign_extend 32) (currentByte!5513 thiss!1305)) ((_ sign_extend 32) (currentBit!5508 thiss!1305)) lt!185055) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2421 (buf!2846 (_2!5279 lt!185073)))) ((_ sign_extend 32) (currentByte!5513 thiss!1305)) ((_ sign_extend 32) (currentBit!5508 thiss!1305))) lt!185055))))

(declare-fun bs!9314 () Bool)

(assert (= bs!9314 d!38484))

(declare-fun m!180761 () Bool)

(assert (=> bs!9314 m!180761))

(assert (=> b!119561 d!38484))

(declare-fun d!38486 () Bool)

(declare-fun e!78506 () Bool)

(assert (=> d!38486 e!78506))

(declare-fun res!99201 () Bool)

(assert (=> d!38486 (=> (not res!99201) (not e!78506))))

(declare-fun lt!185936 () (_ BitVec 64))

(declare-fun lt!185933 () (_ BitVec 64))

(declare-fun lt!185934 () (_ BitVec 64))

(assert (=> d!38486 (= res!99201 (= lt!185934 (bvsub lt!185933 lt!185936)))))

(assert (=> d!38486 (or (= (bvand lt!185933 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!185936 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!185933 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!185933 lt!185936) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38486 (= lt!185936 (remainingBits!0 ((_ sign_extend 32) (size!2421 (buf!2846 (_1!5280 lt!185070)))) ((_ sign_extend 32) (currentByte!5513 (_1!5280 lt!185070))) ((_ sign_extend 32) (currentBit!5508 (_1!5280 lt!185070)))))))

(declare-fun lt!185935 () (_ BitVec 64))

(declare-fun lt!185937 () (_ BitVec 64))

(assert (=> d!38486 (= lt!185933 (bvmul lt!185935 lt!185937))))

(assert (=> d!38486 (or (= lt!185935 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!185937 (bvsdiv (bvmul lt!185935 lt!185937) lt!185935)))))

(assert (=> d!38486 (= lt!185937 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!38486 (= lt!185935 ((_ sign_extend 32) (size!2421 (buf!2846 (_1!5280 lt!185070)))))))

(assert (=> d!38486 (= lt!185934 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5513 (_1!5280 lt!185070))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5508 (_1!5280 lt!185070)))))))

(assert (=> d!38486 (invariant!0 (currentBit!5508 (_1!5280 lt!185070)) (currentByte!5513 (_1!5280 lt!185070)) (size!2421 (buf!2846 (_1!5280 lt!185070))))))

(assert (=> d!38486 (= (bitIndex!0 (size!2421 (buf!2846 (_1!5280 lt!185070))) (currentByte!5513 (_1!5280 lt!185070)) (currentBit!5508 (_1!5280 lt!185070))) lt!185934)))

(declare-fun b!119849 () Bool)

(declare-fun res!99202 () Bool)

(assert (=> b!119849 (=> (not res!99202) (not e!78506))))

(assert (=> b!119849 (= res!99202 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!185934))))

(declare-fun b!119850 () Bool)

(declare-fun lt!185932 () (_ BitVec 64))

(assert (=> b!119850 (= e!78506 (bvsle lt!185934 (bvmul lt!185932 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!119850 (or (= lt!185932 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!185932 #b0000000000000000000000000000000000000000000000000000000000001000) lt!185932)))))

(assert (=> b!119850 (= lt!185932 ((_ sign_extend 32) (size!2421 (buf!2846 (_1!5280 lt!185070)))))))

(assert (= (and d!38486 res!99201) b!119849))

(assert (= (and b!119849 res!99202) b!119850))

(declare-fun m!180779 () Bool)

(assert (=> d!38486 m!180779))

(declare-fun m!180781 () Bool)

(assert (=> d!38486 m!180781))

(assert (=> b!119561 d!38486))

(declare-fun d!38496 () Bool)

(assert (=> d!38496 (isPrefixOf!0 thiss!1305 (_2!5279 lt!185073))))

(declare-fun lt!185944 () Unit!7361)

(declare-fun choose!30 (BitStream!4316 BitStream!4316 BitStream!4316) Unit!7361)

(assert (=> d!38496 (= lt!185944 (choose!30 thiss!1305 (_2!5279 lt!185059) (_2!5279 lt!185073)))))

(assert (=> d!38496 (isPrefixOf!0 thiss!1305 (_2!5279 lt!185059))))

(assert (=> d!38496 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5279 lt!185059) (_2!5279 lt!185073)) lt!185944)))

(declare-fun bs!9317 () Bool)

(assert (= bs!9317 d!38496))

(assert (=> bs!9317 m!180141))

(declare-fun m!180783 () Bool)

(assert (=> bs!9317 m!180783))

(assert (=> bs!9317 m!180179))

(assert (=> b!119561 d!38496))

(declare-fun d!38498 () Bool)

(declare-fun e!78512 () Bool)

(assert (=> d!38498 e!78512))

(declare-fun res!99210 () Bool)

(assert (=> d!38498 (=> (not res!99210) (not e!78512))))

(declare-fun lt!185984 () tuple2!10030)

(declare-fun lt!185982 () tuple2!10030)

(assert (=> d!38498 (= res!99210 (= (bitIndex!0 (size!2421 (buf!2846 (_1!5280 lt!185984))) (currentByte!5513 (_1!5280 lt!185984)) (currentBit!5508 (_1!5280 lt!185984))) (bitIndex!0 (size!2421 (buf!2846 (_1!5280 lt!185982))) (currentByte!5513 (_1!5280 lt!185982)) (currentBit!5508 (_1!5280 lt!185982)))))))

(declare-fun lt!185981 () Unit!7361)

(declare-fun lt!185983 () BitStream!4316)

(declare-fun choose!50 (BitStream!4316 BitStream!4316 BitStream!4316 tuple2!10030 tuple2!10030 BitStream!4316 Bool tuple2!10030 tuple2!10030 BitStream!4316 Bool) Unit!7361)

(assert (=> d!38498 (= lt!185981 (choose!50 lt!185061 (_2!5279 lt!185073) lt!185983 lt!185984 (tuple2!10031 (_1!5280 lt!185984) (_2!5280 lt!185984)) (_1!5280 lt!185984) (_2!5280 lt!185984) lt!185982 (tuple2!10031 (_1!5280 lt!185982) (_2!5280 lt!185982)) (_1!5280 lt!185982) (_2!5280 lt!185982)))))

(assert (=> d!38498 (= lt!185982 (readBitPure!0 lt!185983))))

(assert (=> d!38498 (= lt!185984 (readBitPure!0 lt!185061))))

(assert (=> d!38498 (= lt!185983 (BitStream!4317 (buf!2846 (_2!5279 lt!185073)) (currentByte!5513 lt!185061) (currentBit!5508 lt!185061)))))

(assert (=> d!38498 (invariant!0 (currentBit!5508 lt!185061) (currentByte!5513 lt!185061) (size!2421 (buf!2846 (_2!5279 lt!185073))))))

(assert (=> d!38498 (= (readBitPrefixLemma!0 lt!185061 (_2!5279 lt!185073)) lt!185981)))

(declare-fun b!119858 () Bool)

(assert (=> b!119858 (= e!78512 (= (_2!5280 lt!185984) (_2!5280 lt!185982)))))

(assert (= (and d!38498 res!99210) b!119858))

(declare-fun m!180801 () Bool)

(assert (=> d!38498 m!180801))

(declare-fun m!180803 () Bool)

(assert (=> d!38498 m!180803))

(declare-fun m!180805 () Bool)

(assert (=> d!38498 m!180805))

(assert (=> d!38498 m!180153))

(declare-fun m!180807 () Bool)

(assert (=> d!38498 m!180807))

(declare-fun m!180809 () Bool)

(assert (=> d!38498 m!180809))

(assert (=> b!119561 d!38498))

(declare-fun d!38506 () Bool)

(declare-fun lt!185985 () tuple2!10046)

(assert (=> d!38506 (= lt!185985 (readNLeastSignificantBitsLoop!0 (_1!5281 lt!185060) nBits!396 i!615 lt!185082))))

(assert (=> d!38506 (= (readNLeastSignificantBitsLoopPure!0 (_1!5281 lt!185060) nBits!396 i!615 lt!185082) (tuple2!10035 (_2!5288 lt!185985) (_1!5288 lt!185985)))))

(declare-fun bs!9319 () Bool)

(assert (= bs!9319 d!38506))

(declare-fun m!180811 () Bool)

(assert (=> bs!9319 m!180811))

(assert (=> b!119561 d!38506))

(declare-fun b!119871 () Bool)

(declare-fun e!78518 () Bool)

(declare-fun lt!185995 () tuple2!10030)

(declare-fun lt!185994 () tuple2!10028)

(assert (=> b!119871 (= e!78518 (= (bitIndex!0 (size!2421 (buf!2846 (_1!5280 lt!185995))) (currentByte!5513 (_1!5280 lt!185995)) (currentBit!5508 (_1!5280 lt!185995))) (bitIndex!0 (size!2421 (buf!2846 (_2!5279 lt!185994))) (currentByte!5513 (_2!5279 lt!185994)) (currentBit!5508 (_2!5279 lt!185994)))))))

(declare-fun b!119869 () Bool)

(declare-fun res!99222 () Bool)

(declare-fun e!78517 () Bool)

(assert (=> b!119869 (=> (not res!99222) (not e!78517))))

(assert (=> b!119869 (= res!99222 (isPrefixOf!0 thiss!1305 (_2!5279 lt!185994)))))

(declare-fun b!119870 () Bool)

(assert (=> b!119870 (= e!78517 e!78518)))

(declare-fun res!99221 () Bool)

(assert (=> b!119870 (=> (not res!99221) (not e!78518))))

(assert (=> b!119870 (= res!99221 (and (= (_2!5280 lt!185995) lt!185077) (= (_1!5280 lt!185995) (_2!5279 lt!185994))))))

(assert (=> b!119870 (= lt!185995 (readBitPure!0 (readerFrom!0 (_2!5279 lt!185994) (currentBit!5508 thiss!1305) (currentByte!5513 thiss!1305))))))

(declare-fun d!38508 () Bool)

(assert (=> d!38508 e!78517))

(declare-fun res!99219 () Bool)

(assert (=> d!38508 (=> (not res!99219) (not e!78517))))

(assert (=> d!38508 (= res!99219 (= (size!2421 (buf!2846 thiss!1305)) (size!2421 (buf!2846 (_2!5279 lt!185994)))))))

(declare-fun choose!16 (BitStream!4316 Bool) tuple2!10028)

(assert (=> d!38508 (= lt!185994 (choose!16 thiss!1305 lt!185077))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!38508 (validate_offset_bit!0 ((_ sign_extend 32) (size!2421 (buf!2846 thiss!1305))) ((_ sign_extend 32) (currentByte!5513 thiss!1305)) ((_ sign_extend 32) (currentBit!5508 thiss!1305)))))

(assert (=> d!38508 (= (appendBit!0 thiss!1305 lt!185077) lt!185994)))

(declare-fun b!119868 () Bool)

(declare-fun res!99220 () Bool)

(assert (=> b!119868 (=> (not res!99220) (not e!78517))))

(declare-fun lt!185997 () (_ BitVec 64))

(declare-fun lt!185996 () (_ BitVec 64))

(assert (=> b!119868 (= res!99220 (= (bitIndex!0 (size!2421 (buf!2846 (_2!5279 lt!185994))) (currentByte!5513 (_2!5279 lt!185994)) (currentBit!5508 (_2!5279 lt!185994))) (bvadd lt!185996 lt!185997)))))

(assert (=> b!119868 (or (not (= (bvand lt!185996 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!185997 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!185996 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!185996 lt!185997) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!119868 (= lt!185997 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!119868 (= lt!185996 (bitIndex!0 (size!2421 (buf!2846 thiss!1305)) (currentByte!5513 thiss!1305) (currentBit!5508 thiss!1305)))))

(assert (= (and d!38508 res!99219) b!119868))

(assert (= (and b!119868 res!99220) b!119869))

(assert (= (and b!119869 res!99222) b!119870))

(assert (= (and b!119870 res!99221) b!119871))

(declare-fun m!180813 () Bool)

(assert (=> b!119868 m!180813))

(assert (=> b!119868 m!180131))

(declare-fun m!180815 () Bool)

(assert (=> b!119870 m!180815))

(assert (=> b!119870 m!180815))

(declare-fun m!180817 () Bool)

(assert (=> b!119870 m!180817))

(declare-fun m!180819 () Bool)

(assert (=> b!119869 m!180819))

(declare-fun m!180821 () Bool)

(assert (=> d!38508 m!180821))

(declare-fun m!180823 () Bool)

(assert (=> d!38508 m!180823))

(declare-fun m!180825 () Bool)

(assert (=> b!119871 m!180825))

(assert (=> b!119871 m!180813))

(assert (=> b!119561 d!38508))

(declare-fun d!38510 () Bool)

(declare-fun e!78519 () Bool)

(assert (=> d!38510 e!78519))

(declare-fun res!99223 () Bool)

(assert (=> d!38510 (=> (not res!99223) (not e!78519))))

(declare-fun lt!185999 () (_ BitVec 64))

(declare-fun lt!186000 () (_ BitVec 64))

(declare-fun lt!186002 () (_ BitVec 64))

(assert (=> d!38510 (= res!99223 (= lt!186000 (bvsub lt!185999 lt!186002)))))

(assert (=> d!38510 (or (= (bvand lt!185999 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!186002 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!185999 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!185999 lt!186002) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38510 (= lt!186002 (remainingBits!0 ((_ sign_extend 32) (size!2421 (buf!2846 (_1!5280 lt!185079)))) ((_ sign_extend 32) (currentByte!5513 (_1!5280 lt!185079))) ((_ sign_extend 32) (currentBit!5508 (_1!5280 lt!185079)))))))

(declare-fun lt!186001 () (_ BitVec 64))

(declare-fun lt!186003 () (_ BitVec 64))

(assert (=> d!38510 (= lt!185999 (bvmul lt!186001 lt!186003))))

(assert (=> d!38510 (or (= lt!186001 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!186003 (bvsdiv (bvmul lt!186001 lt!186003) lt!186001)))))

(assert (=> d!38510 (= lt!186003 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!38510 (= lt!186001 ((_ sign_extend 32) (size!2421 (buf!2846 (_1!5280 lt!185079)))))))

(assert (=> d!38510 (= lt!186000 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5513 (_1!5280 lt!185079))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5508 (_1!5280 lt!185079)))))))

(assert (=> d!38510 (invariant!0 (currentBit!5508 (_1!5280 lt!185079)) (currentByte!5513 (_1!5280 lt!185079)) (size!2421 (buf!2846 (_1!5280 lt!185079))))))

(assert (=> d!38510 (= (bitIndex!0 (size!2421 (buf!2846 (_1!5280 lt!185079))) (currentByte!5513 (_1!5280 lt!185079)) (currentBit!5508 (_1!5280 lt!185079))) lt!186000)))

(declare-fun b!119872 () Bool)

(declare-fun res!99224 () Bool)

(assert (=> b!119872 (=> (not res!99224) (not e!78519))))

(assert (=> b!119872 (= res!99224 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!186000))))

(declare-fun b!119873 () Bool)

(declare-fun lt!185998 () (_ BitVec 64))

(assert (=> b!119873 (= e!78519 (bvsle lt!186000 (bvmul lt!185998 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!119873 (or (= lt!185998 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!185998 #b0000000000000000000000000000000000000000000000000000000000001000) lt!185998)))))

(assert (=> b!119873 (= lt!185998 ((_ sign_extend 32) (size!2421 (buf!2846 (_1!5280 lt!185079)))))))

(assert (= (and d!38510 res!99223) b!119872))

(assert (= (and b!119872 res!99224) b!119873))

(declare-fun m!180827 () Bool)

(assert (=> d!38510 m!180827))

(declare-fun m!180829 () Bool)

(assert (=> d!38510 m!180829))

(assert (=> b!119561 d!38510))

(declare-fun lt!186023 () (_ BitVec 64))

(declare-fun e!78520 () Bool)

(declare-fun lt!186013 () tuple2!10032)

(declare-fun b!119874 () Bool)

(declare-fun lt!186017 () (_ BitVec 64))

(assert (=> b!119874 (= e!78520 (= (_1!5281 lt!186013) (withMovedBitIndex!0 (_2!5281 lt!186013) (bvsub lt!186017 lt!186023))))))

(assert (=> b!119874 (or (= (bvand lt!186017 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!186023 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!186017 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!186017 lt!186023) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!119874 (= lt!186023 (bitIndex!0 (size!2421 (buf!2846 (_2!5279 lt!185073))) (currentByte!5513 (_2!5279 lt!185073)) (currentBit!5508 (_2!5279 lt!185073))))))

(assert (=> b!119874 (= lt!186017 (bitIndex!0 (size!2421 (buf!2846 thiss!1305)) (currentByte!5513 thiss!1305) (currentBit!5508 thiss!1305)))))

(declare-fun b!119875 () Bool)

(declare-fun res!99225 () Bool)

(assert (=> b!119875 (=> (not res!99225) (not e!78520))))

(assert (=> b!119875 (= res!99225 (isPrefixOf!0 (_1!5281 lt!186013) thiss!1305))))

(declare-fun b!119876 () Bool)

(declare-fun e!78521 () Unit!7361)

(declare-fun Unit!7386 () Unit!7361)

(assert (=> b!119876 (= e!78521 Unit!7386)))

(declare-fun b!119877 () Bool)

(declare-fun lt!186006 () Unit!7361)

(assert (=> b!119877 (= e!78521 lt!186006)))

(declare-fun lt!186012 () (_ BitVec 64))

(assert (=> b!119877 (= lt!186012 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!186011 () (_ BitVec 64))

(assert (=> b!119877 (= lt!186011 (bitIndex!0 (size!2421 (buf!2846 thiss!1305)) (currentByte!5513 thiss!1305) (currentBit!5508 thiss!1305)))))

(assert (=> b!119877 (= lt!186006 (arrayBitRangesEqSymmetric!0 (buf!2846 thiss!1305) (buf!2846 (_2!5279 lt!185073)) lt!186012 lt!186011))))

(assert (=> b!119877 (arrayBitRangesEq!0 (buf!2846 (_2!5279 lt!185073)) (buf!2846 thiss!1305) lt!186012 lt!186011)))

(declare-fun d!38512 () Bool)

(assert (=> d!38512 e!78520))

(declare-fun res!99227 () Bool)

(assert (=> d!38512 (=> (not res!99227) (not e!78520))))

(assert (=> d!38512 (= res!99227 (isPrefixOf!0 (_1!5281 lt!186013) (_2!5281 lt!186013)))))

(declare-fun lt!186018 () BitStream!4316)

(assert (=> d!38512 (= lt!186013 (tuple2!10033 lt!186018 (_2!5279 lt!185073)))))

(declare-fun lt!186020 () Unit!7361)

(declare-fun lt!186005 () Unit!7361)

(assert (=> d!38512 (= lt!186020 lt!186005)))

(assert (=> d!38512 (isPrefixOf!0 lt!186018 (_2!5279 lt!185073))))

(assert (=> d!38512 (= lt!186005 (lemmaIsPrefixTransitive!0 lt!186018 (_2!5279 lt!185073) (_2!5279 lt!185073)))))

(declare-fun lt!186016 () Unit!7361)

(declare-fun lt!186015 () Unit!7361)

(assert (=> d!38512 (= lt!186016 lt!186015)))

(assert (=> d!38512 (isPrefixOf!0 lt!186018 (_2!5279 lt!185073))))

(assert (=> d!38512 (= lt!186015 (lemmaIsPrefixTransitive!0 lt!186018 thiss!1305 (_2!5279 lt!185073)))))

(declare-fun lt!186004 () Unit!7361)

(assert (=> d!38512 (= lt!186004 e!78521)))

(declare-fun c!7210 () Bool)

(assert (=> d!38512 (= c!7210 (not (= (size!2421 (buf!2846 thiss!1305)) #b00000000000000000000000000000000)))))

(declare-fun lt!186014 () Unit!7361)

(declare-fun lt!186008 () Unit!7361)

(assert (=> d!38512 (= lt!186014 lt!186008)))

(assert (=> d!38512 (isPrefixOf!0 (_2!5279 lt!185073) (_2!5279 lt!185073))))

(assert (=> d!38512 (= lt!186008 (lemmaIsPrefixRefl!0 (_2!5279 lt!185073)))))

(declare-fun lt!186021 () Unit!7361)

(declare-fun lt!186019 () Unit!7361)

(assert (=> d!38512 (= lt!186021 lt!186019)))

(assert (=> d!38512 (= lt!186019 (lemmaIsPrefixRefl!0 (_2!5279 lt!185073)))))

(declare-fun lt!186009 () Unit!7361)

(declare-fun lt!186007 () Unit!7361)

(assert (=> d!38512 (= lt!186009 lt!186007)))

(assert (=> d!38512 (isPrefixOf!0 lt!186018 lt!186018)))

(assert (=> d!38512 (= lt!186007 (lemmaIsPrefixRefl!0 lt!186018))))

(declare-fun lt!186022 () Unit!7361)

(declare-fun lt!186010 () Unit!7361)

(assert (=> d!38512 (= lt!186022 lt!186010)))

(assert (=> d!38512 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!38512 (= lt!186010 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (=> d!38512 (= lt!186018 (BitStream!4317 (buf!2846 (_2!5279 lt!185073)) (currentByte!5513 thiss!1305) (currentBit!5508 thiss!1305)))))

(assert (=> d!38512 (isPrefixOf!0 thiss!1305 (_2!5279 lt!185073))))

(assert (=> d!38512 (= (reader!0 thiss!1305 (_2!5279 lt!185073)) lt!186013)))

(declare-fun b!119878 () Bool)

(declare-fun res!99226 () Bool)

(assert (=> b!119878 (=> (not res!99226) (not e!78520))))

(assert (=> b!119878 (= res!99226 (isPrefixOf!0 (_2!5281 lt!186013) (_2!5279 lt!185073)))))

(assert (= (and d!38512 c!7210) b!119877))

(assert (= (and d!38512 (not c!7210)) b!119876))

(assert (= (and d!38512 res!99227) b!119875))

(assert (= (and b!119875 res!99225) b!119878))

(assert (= (and b!119878 res!99226) b!119874))

(declare-fun m!180831 () Bool)

(assert (=> b!119875 m!180831))

(declare-fun m!180833 () Bool)

(assert (=> b!119874 m!180833))

(assert (=> b!119874 m!180129))

(assert (=> b!119874 m!180131))

(declare-fun m!180835 () Bool)

(assert (=> b!119878 m!180835))

(assert (=> d!38512 m!180141))

(declare-fun m!180837 () Bool)

(assert (=> d!38512 m!180837))

(assert (=> d!38512 m!180739))

(declare-fun m!180839 () Bool)

(assert (=> d!38512 m!180839))

(declare-fun m!180841 () Bool)

(assert (=> d!38512 m!180841))

(declare-fun m!180843 () Bool)

(assert (=> d!38512 m!180843))

(declare-fun m!180845 () Bool)

(assert (=> d!38512 m!180845))

(declare-fun m!180847 () Bool)

(assert (=> d!38512 m!180847))

(declare-fun m!180849 () Bool)

(assert (=> d!38512 m!180849))

(declare-fun m!180851 () Bool)

(assert (=> d!38512 m!180851))

(assert (=> d!38512 m!180755))

(assert (=> b!119877 m!180131))

(declare-fun m!180853 () Bool)

(assert (=> b!119877 m!180853))

(declare-fun m!180855 () Bool)

(assert (=> b!119877 m!180855))

(assert (=> b!119561 d!38512))

(declare-fun d!38514 () Bool)

(assert (=> d!38514 (= (invariant!0 (currentBit!5508 thiss!1305) (currentByte!5513 thiss!1305) (size!2421 (buf!2846 (_2!5279 lt!185059)))) (and (bvsge (currentBit!5508 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5508 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5513 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5513 thiss!1305) (size!2421 (buf!2846 (_2!5279 lt!185059)))) (and (= (currentBit!5508 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5513 thiss!1305) (size!2421 (buf!2846 (_2!5279 lt!185059))))))))))

(assert (=> b!119560 d!38514))

(declare-fun d!38516 () Bool)

(declare-fun lt!186024 () tuple2!10046)

(assert (=> d!38516 (= lt!186024 (readNLeastSignificantBitsLoop!0 (withMovedBitIndex!0 (_1!5281 lt!185060) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!185057))))

(assert (=> d!38516 (= (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!5281 lt!185060) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!185057) (tuple2!10035 (_2!5288 lt!186024) (_1!5288 lt!186024)))))

(declare-fun bs!9320 () Bool)

(assert (= bs!9320 d!38516))

(assert (=> bs!9320 m!180121))

(declare-fun m!180857 () Bool)

(assert (=> bs!9320 m!180857))

(assert (=> b!119564 d!38516))

(declare-fun d!38518 () Bool)

(declare-fun e!78524 () Bool)

(assert (=> d!38518 e!78524))

(declare-fun res!99230 () Bool)

(assert (=> d!38518 (=> (not res!99230) (not e!78524))))

(declare-fun lt!186030 () (_ BitVec 64))

(declare-fun lt!186029 () BitStream!4316)

(assert (=> d!38518 (= res!99230 (= (bvadd lt!186030 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!2421 (buf!2846 lt!186029)) (currentByte!5513 lt!186029) (currentBit!5508 lt!186029))))))

(assert (=> d!38518 (or (not (= (bvand lt!186030 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!186030 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!186030 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38518 (= lt!186030 (bitIndex!0 (size!2421 (buf!2846 (_1!5281 lt!185060))) (currentByte!5513 (_1!5281 lt!185060)) (currentBit!5508 (_1!5281 lt!185060))))))

(declare-fun moveBitIndex!0 (BitStream!4316 (_ BitVec 64)) tuple2!10028)

(assert (=> d!38518 (= lt!186029 (_2!5279 (moveBitIndex!0 (_1!5281 lt!185060) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!4316 (_ BitVec 64)) Bool)

(assert (=> d!38518 (moveBitIndexPrecond!0 (_1!5281 lt!185060) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!38518 (= (withMovedBitIndex!0 (_1!5281 lt!185060) #b0000000000000000000000000000000000000000000000000000000000000001) lt!186029)))

(declare-fun b!119881 () Bool)

(assert (=> b!119881 (= e!78524 (= (size!2421 (buf!2846 (_1!5281 lt!185060))) (size!2421 (buf!2846 lt!186029))))))

(assert (= (and d!38518 res!99230) b!119881))

(declare-fun m!180859 () Bool)

(assert (=> d!38518 m!180859))

(declare-fun m!180861 () Bool)

(assert (=> d!38518 m!180861))

(declare-fun m!180863 () Bool)

(assert (=> d!38518 m!180863))

(declare-fun m!180865 () Bool)

(assert (=> d!38518 m!180865))

(assert (=> b!119564 d!38518))

(declare-fun d!38520 () Bool)

(declare-fun e!78525 () Bool)

(assert (=> d!38520 e!78525))

(declare-fun res!99231 () Bool)

(assert (=> d!38520 (=> (not res!99231) (not e!78525))))

(declare-fun lt!186032 () (_ BitVec 64))

(declare-fun lt!186035 () (_ BitVec 64))

(declare-fun lt!186033 () (_ BitVec 64))

(assert (=> d!38520 (= res!99231 (= lt!186033 (bvsub lt!186032 lt!186035)))))

(assert (=> d!38520 (or (= (bvand lt!186032 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!186035 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!186032 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!186032 lt!186035) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38520 (= lt!186035 (remainingBits!0 ((_ sign_extend 32) (size!2421 (buf!2846 (_2!5279 lt!185059)))) ((_ sign_extend 32) (currentByte!5513 (_2!5279 lt!185059))) ((_ sign_extend 32) (currentBit!5508 (_2!5279 lt!185059)))))))

(declare-fun lt!186034 () (_ BitVec 64))

(declare-fun lt!186036 () (_ BitVec 64))

(assert (=> d!38520 (= lt!186032 (bvmul lt!186034 lt!186036))))

(assert (=> d!38520 (or (= lt!186034 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!186036 (bvsdiv (bvmul lt!186034 lt!186036) lt!186034)))))

(assert (=> d!38520 (= lt!186036 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!38520 (= lt!186034 ((_ sign_extend 32) (size!2421 (buf!2846 (_2!5279 lt!185059)))))))

(assert (=> d!38520 (= lt!186033 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5513 (_2!5279 lt!185059))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5508 (_2!5279 lt!185059)))))))

(assert (=> d!38520 (invariant!0 (currentBit!5508 (_2!5279 lt!185059)) (currentByte!5513 (_2!5279 lt!185059)) (size!2421 (buf!2846 (_2!5279 lt!185059))))))

(assert (=> d!38520 (= (bitIndex!0 (size!2421 (buf!2846 (_2!5279 lt!185059))) (currentByte!5513 (_2!5279 lt!185059)) (currentBit!5508 (_2!5279 lt!185059))) lt!186033)))

(declare-fun b!119882 () Bool)

(declare-fun res!99232 () Bool)

(assert (=> b!119882 (=> (not res!99232) (not e!78525))))

(assert (=> b!119882 (= res!99232 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!186033))))

(declare-fun b!119883 () Bool)

(declare-fun lt!186031 () (_ BitVec 64))

(assert (=> b!119883 (= e!78525 (bvsle lt!186033 (bvmul lt!186031 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!119883 (or (= lt!186031 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!186031 #b0000000000000000000000000000000000000000000000000000000000001000) lt!186031)))))

(assert (=> b!119883 (= lt!186031 ((_ sign_extend 32) (size!2421 (buf!2846 (_2!5279 lt!185059)))))))

(assert (= (and d!38520 res!99231) b!119882))

(assert (= (and b!119882 res!99232) b!119883))

(declare-fun m!180867 () Bool)

(assert (=> d!38520 m!180867))

(declare-fun m!180869 () Bool)

(assert (=> d!38520 m!180869))

(assert (=> b!119564 d!38520))

(declare-fun d!38522 () Bool)

(declare-fun e!78526 () Bool)

(assert (=> d!38522 e!78526))

(declare-fun res!99233 () Bool)

(assert (=> d!38522 (=> (not res!99233) (not e!78526))))

(declare-fun lt!186037 () BitStream!4316)

(declare-fun lt!186038 () (_ BitVec 64))

(assert (=> d!38522 (= res!99233 (= (bvadd lt!186038 (bvsub lt!185075 lt!185068)) (bitIndex!0 (size!2421 (buf!2846 lt!186037)) (currentByte!5513 lt!186037) (currentBit!5508 lt!186037))))))

(assert (=> d!38522 (or (not (= (bvand lt!186038 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!185075 lt!185068) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!186038 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!186038 (bvsub lt!185075 lt!185068)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38522 (= lt!186038 (bitIndex!0 (size!2421 (buf!2846 (_2!5281 lt!185060))) (currentByte!5513 (_2!5281 lt!185060)) (currentBit!5508 (_2!5281 lt!185060))))))

(assert (=> d!38522 (= lt!186037 (_2!5279 (moveBitIndex!0 (_2!5281 lt!185060) (bvsub lt!185075 lt!185068))))))

(assert (=> d!38522 (moveBitIndexPrecond!0 (_2!5281 lt!185060) (bvsub lt!185075 lt!185068))))

(assert (=> d!38522 (= (withMovedBitIndex!0 (_2!5281 lt!185060) (bvsub lt!185075 lt!185068)) lt!186037)))

(declare-fun b!119884 () Bool)

(assert (=> b!119884 (= e!78526 (= (size!2421 (buf!2846 (_2!5281 lt!185060))) (size!2421 (buf!2846 lt!186037))))))

(assert (= (and d!38522 res!99233) b!119884))

(declare-fun m!180871 () Bool)

(assert (=> d!38522 m!180871))

(declare-fun m!180873 () Bool)

(assert (=> d!38522 m!180873))

(declare-fun m!180875 () Bool)

(assert (=> d!38522 m!180875))

(declare-fun m!180877 () Bool)

(assert (=> d!38522 m!180877))

(assert (=> b!119564 d!38522))

(declare-fun d!38524 () Bool)

(declare-fun e!78527 () Bool)

(assert (=> d!38524 e!78527))

(declare-fun res!99234 () Bool)

(assert (=> d!38524 (=> (not res!99234) (not e!78527))))

(declare-fun lt!186043 () (_ BitVec 64))

(declare-fun lt!186040 () (_ BitVec 64))

(declare-fun lt!186041 () (_ BitVec 64))

(assert (=> d!38524 (= res!99234 (= lt!186041 (bvsub lt!186040 lt!186043)))))

(assert (=> d!38524 (or (= (bvand lt!186040 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!186043 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!186040 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!186040 lt!186043) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38524 (= lt!186043 (remainingBits!0 ((_ sign_extend 32) (size!2421 (buf!2846 (_2!5279 lt!185073)))) ((_ sign_extend 32) (currentByte!5513 (_2!5279 lt!185073))) ((_ sign_extend 32) (currentBit!5508 (_2!5279 lt!185073)))))))

(declare-fun lt!186042 () (_ BitVec 64))

(declare-fun lt!186044 () (_ BitVec 64))

(assert (=> d!38524 (= lt!186040 (bvmul lt!186042 lt!186044))))

(assert (=> d!38524 (or (= lt!186042 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!186044 (bvsdiv (bvmul lt!186042 lt!186044) lt!186042)))))

(assert (=> d!38524 (= lt!186044 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!38524 (= lt!186042 ((_ sign_extend 32) (size!2421 (buf!2846 (_2!5279 lt!185073)))))))

(assert (=> d!38524 (= lt!186041 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5513 (_2!5279 lt!185073))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5508 (_2!5279 lt!185073)))))))

(assert (=> d!38524 (invariant!0 (currentBit!5508 (_2!5279 lt!185073)) (currentByte!5513 (_2!5279 lt!185073)) (size!2421 (buf!2846 (_2!5279 lt!185073))))))

(assert (=> d!38524 (= (bitIndex!0 (size!2421 (buf!2846 (_2!5279 lt!185073))) (currentByte!5513 (_2!5279 lt!185073)) (currentBit!5508 (_2!5279 lt!185073))) lt!186041)))

(declare-fun b!119885 () Bool)

(declare-fun res!99235 () Bool)

(assert (=> b!119885 (=> (not res!99235) (not e!78527))))

(assert (=> b!119885 (= res!99235 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!186041))))

(declare-fun b!119886 () Bool)

(declare-fun lt!186039 () (_ BitVec 64))

(assert (=> b!119886 (= e!78527 (bvsle lt!186041 (bvmul lt!186039 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!119886 (or (= lt!186039 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!186039 #b0000000000000000000000000000000000000000000000000000000000001000) lt!186039)))))

(assert (=> b!119886 (= lt!186039 ((_ sign_extend 32) (size!2421 (buf!2846 (_2!5279 lt!185073)))))))

(assert (= (and d!38524 res!99234) b!119885))

(assert (= (and b!119885 res!99235) b!119886))

(declare-fun m!180879 () Bool)

(assert (=> d!38524 m!180879))

(declare-fun m!180881 () Bool)

(assert (=> d!38524 m!180881))

(assert (=> b!119564 d!38524))

(declare-fun d!38526 () Bool)

(declare-fun lt!186060 () tuple2!10034)

(declare-fun lt!186062 () tuple2!10034)

(assert (=> d!38526 (and (= (_2!5282 lt!186060) (_2!5282 lt!186062)) (= (_1!5282 lt!186060) (_1!5282 lt!186062)))))

(declare-fun lt!186061 () Bool)

(declare-fun lt!186057 () Unit!7361)

(declare-fun lt!186058 () BitStream!4316)

(declare-fun lt!186059 () (_ BitVec 64))

(declare-fun choose!45 (BitStream!4316 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!10034 tuple2!10034 BitStream!4316 (_ BitVec 64) Bool BitStream!4316 (_ BitVec 64) tuple2!10034 tuple2!10034 BitStream!4316 (_ BitVec 64)) Unit!7361)

(assert (=> d!38526 (= lt!186057 (choose!45 (_1!5281 lt!185060) nBits!396 i!615 lt!185082 lt!186060 (tuple2!10035 (_1!5282 lt!186060) (_2!5282 lt!186060)) (_1!5282 lt!186060) (_2!5282 lt!186060) lt!186061 lt!186058 lt!186059 lt!186062 (tuple2!10035 (_1!5282 lt!186062) (_2!5282 lt!186062)) (_1!5282 lt!186062) (_2!5282 lt!186062)))))

(assert (=> d!38526 (= lt!186062 (readNLeastSignificantBitsLoopPure!0 lt!186058 nBits!396 (bvadd i!615 #b00000000000000000000000000000001) lt!186059))))

(assert (=> d!38526 (= lt!186059 (bvor lt!185082 (ite lt!186061 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38526 (= lt!186058 (withMovedBitIndex!0 (_1!5281 lt!185060) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!38526 (= lt!186061 (_2!5280 (readBitPure!0 (_1!5281 lt!185060))))))

(assert (=> d!38526 (= lt!186060 (readNLeastSignificantBitsLoopPure!0 (_1!5281 lt!185060) nBits!396 i!615 lt!185082))))

(assert (=> d!38526 (= (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5281 lt!185060) nBits!396 i!615 lt!185082) lt!186057)))

(declare-fun bs!9322 () Bool)

(assert (= bs!9322 d!38526))

(assert (=> bs!9322 m!180155))

(declare-fun m!180883 () Bool)

(assert (=> bs!9322 m!180883))

(declare-fun m!180885 () Bool)

(assert (=> bs!9322 m!180885))

(assert (=> bs!9322 m!180159))

(assert (=> bs!9322 m!180121))

(assert (=> b!119564 d!38526))

(declare-fun d!38528 () Bool)

(declare-fun e!78528 () Bool)

(assert (=> d!38528 e!78528))

(declare-fun res!99236 () Bool)

(assert (=> d!38528 (=> (not res!99236) (not e!78528))))

(declare-fun lt!186064 () (_ BitVec 64))

(declare-fun lt!186065 () (_ BitVec 64))

(declare-fun lt!186067 () (_ BitVec 64))

(assert (=> d!38528 (= res!99236 (= lt!186065 (bvsub lt!186064 lt!186067)))))

(assert (=> d!38528 (or (= (bvand lt!186064 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!186067 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!186064 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!186064 lt!186067) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38528 (= lt!186067 (remainingBits!0 ((_ sign_extend 32) (size!2421 (buf!2846 thiss!1305))) ((_ sign_extend 32) (currentByte!5513 thiss!1305)) ((_ sign_extend 32) (currentBit!5508 thiss!1305))))))

(declare-fun lt!186066 () (_ BitVec 64))

(declare-fun lt!186068 () (_ BitVec 64))

(assert (=> d!38528 (= lt!186064 (bvmul lt!186066 lt!186068))))

(assert (=> d!38528 (or (= lt!186066 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!186068 (bvsdiv (bvmul lt!186066 lt!186068) lt!186066)))))

(assert (=> d!38528 (= lt!186068 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!38528 (= lt!186066 ((_ sign_extend 32) (size!2421 (buf!2846 thiss!1305))))))

(assert (=> d!38528 (= lt!186065 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5513 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5508 thiss!1305))))))

(assert (=> d!38528 (invariant!0 (currentBit!5508 thiss!1305) (currentByte!5513 thiss!1305) (size!2421 (buf!2846 thiss!1305)))))

(assert (=> d!38528 (= (bitIndex!0 (size!2421 (buf!2846 thiss!1305)) (currentByte!5513 thiss!1305) (currentBit!5508 thiss!1305)) lt!186065)))

(declare-fun b!119887 () Bool)

(declare-fun res!99237 () Bool)

(assert (=> b!119887 (=> (not res!99237) (not e!78528))))

(assert (=> b!119887 (= res!99237 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!186065))))

(declare-fun b!119888 () Bool)

(declare-fun lt!186063 () (_ BitVec 64))

(assert (=> b!119888 (= e!78528 (bvsle lt!186065 (bvmul lt!186063 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!119888 (or (= lt!186063 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!186063 #b0000000000000000000000000000000000000000000000000000000000001000) lt!186063)))))

(assert (=> b!119888 (= lt!186063 ((_ sign_extend 32) (size!2421 (buf!2846 thiss!1305))))))

(assert (= (and d!38528 res!99236) b!119887))

(assert (= (and b!119887 res!99237) b!119888))

(declare-fun m!180887 () Bool)

(assert (=> d!38528 m!180887))

(declare-fun m!180889 () Bool)

(assert (=> d!38528 m!180889))

(assert (=> b!119564 d!38528))

(declare-fun d!38530 () Bool)

(declare-fun res!99239 () Bool)

(declare-fun e!78529 () Bool)

(assert (=> d!38530 (=> (not res!99239) (not e!78529))))

(assert (=> d!38530 (= res!99239 (= (size!2421 (buf!2846 thiss!1305)) (size!2421 (buf!2846 (_2!5279 lt!185059)))))))

(assert (=> d!38530 (= (isPrefixOf!0 thiss!1305 (_2!5279 lt!185059)) e!78529)))

(declare-fun b!119889 () Bool)

(declare-fun res!99240 () Bool)

(assert (=> b!119889 (=> (not res!99240) (not e!78529))))

(assert (=> b!119889 (= res!99240 (bvsle (bitIndex!0 (size!2421 (buf!2846 thiss!1305)) (currentByte!5513 thiss!1305) (currentBit!5508 thiss!1305)) (bitIndex!0 (size!2421 (buf!2846 (_2!5279 lt!185059))) (currentByte!5513 (_2!5279 lt!185059)) (currentBit!5508 (_2!5279 lt!185059)))))))

(declare-fun b!119890 () Bool)

(declare-fun e!78530 () Bool)

(assert (=> b!119890 (= e!78529 e!78530)))

(declare-fun res!99238 () Bool)

(assert (=> b!119890 (=> res!99238 e!78530)))

(assert (=> b!119890 (= res!99238 (= (size!2421 (buf!2846 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!119891 () Bool)

(assert (=> b!119891 (= e!78530 (arrayBitRangesEq!0 (buf!2846 thiss!1305) (buf!2846 (_2!5279 lt!185059)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2421 (buf!2846 thiss!1305)) (currentByte!5513 thiss!1305) (currentBit!5508 thiss!1305))))))

(assert (= (and d!38530 res!99239) b!119889))

(assert (= (and b!119889 res!99240) b!119890))

(assert (= (and b!119890 (not res!99238)) b!119891))

(assert (=> b!119889 m!180131))

(assert (=> b!119889 m!180119))

(assert (=> b!119891 m!180131))

(assert (=> b!119891 m!180131))

(declare-fun m!180891 () Bool)

(assert (=> b!119891 m!180891))

(assert (=> b!119562 d!38530))

(declare-fun d!38532 () Bool)

(declare-fun e!78531 () Bool)

(assert (=> d!38532 e!78531))

(declare-fun res!99241 () Bool)

(assert (=> d!38532 (=> (not res!99241) (not e!78531))))

(declare-fun lt!186071 () (_ BitVec 64))

(declare-fun lt!186073 () (_ BitVec 64))

(declare-fun lt!186070 () (_ BitVec 64))

(assert (=> d!38532 (= res!99241 (= lt!186071 (bvsub lt!186070 lt!186073)))))

(assert (=> d!38532 (or (= (bvand lt!186070 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!186073 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!186070 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!186070 lt!186073) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38532 (= lt!186073 (remainingBits!0 ((_ sign_extend 32) (size!2421 (buf!2846 (_1!5280 lt!185080)))) ((_ sign_extend 32) (currentByte!5513 (_1!5280 lt!185080))) ((_ sign_extend 32) (currentBit!5508 (_1!5280 lt!185080)))))))

(declare-fun lt!186072 () (_ BitVec 64))

(declare-fun lt!186074 () (_ BitVec 64))

(assert (=> d!38532 (= lt!186070 (bvmul lt!186072 lt!186074))))

(assert (=> d!38532 (or (= lt!186072 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!186074 (bvsdiv (bvmul lt!186072 lt!186074) lt!186072)))))

(assert (=> d!38532 (= lt!186074 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!38532 (= lt!186072 ((_ sign_extend 32) (size!2421 (buf!2846 (_1!5280 lt!185080)))))))

(assert (=> d!38532 (= lt!186071 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5513 (_1!5280 lt!185080))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5508 (_1!5280 lt!185080)))))))

(assert (=> d!38532 (invariant!0 (currentBit!5508 (_1!5280 lt!185080)) (currentByte!5513 (_1!5280 lt!185080)) (size!2421 (buf!2846 (_1!5280 lt!185080))))))

(assert (=> d!38532 (= (bitIndex!0 (size!2421 (buf!2846 (_1!5280 lt!185080))) (currentByte!5513 (_1!5280 lt!185080)) (currentBit!5508 (_1!5280 lt!185080))) lt!186071)))

(declare-fun b!119892 () Bool)

(declare-fun res!99242 () Bool)

(assert (=> b!119892 (=> (not res!99242) (not e!78531))))

(assert (=> b!119892 (= res!99242 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!186071))))

(declare-fun b!119893 () Bool)

(declare-fun lt!186069 () (_ BitVec 64))

(assert (=> b!119893 (= e!78531 (bvsle lt!186071 (bvmul lt!186069 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!119893 (or (= lt!186069 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!186069 #b0000000000000000000000000000000000000000000000000000000000001000) lt!186069)))))

(assert (=> b!119893 (= lt!186069 ((_ sign_extend 32) (size!2421 (buf!2846 (_1!5280 lt!185080)))))))

(assert (= (and d!38532 res!99241) b!119892))

(assert (= (and b!119892 res!99242) b!119893))

(declare-fun m!180893 () Bool)

(assert (=> d!38532 m!180893))

(declare-fun m!180895 () Bool)

(assert (=> d!38532 m!180895))

(assert (=> b!119556 d!38532))

(declare-fun d!38534 () Bool)

(assert (=> d!38534 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2421 (buf!2846 thiss!1305))) ((_ sign_extend 32) (currentByte!5513 thiss!1305)) ((_ sign_extend 32) (currentBit!5508 thiss!1305)) lt!185055) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2421 (buf!2846 thiss!1305))) ((_ sign_extend 32) (currentByte!5513 thiss!1305)) ((_ sign_extend 32) (currentBit!5508 thiss!1305))) lt!185055))))

(declare-fun bs!9323 () Bool)

(assert (= bs!9323 d!38534))

(assert (=> bs!9323 m!180887))

(assert (=> b!119566 d!38534))

(declare-fun d!38536 () Bool)

(assert (=> d!38536 (= (invariant!0 (currentBit!5508 thiss!1305) (currentByte!5513 thiss!1305) (size!2421 (buf!2846 (_2!5279 lt!185073)))) (and (bvsge (currentBit!5508 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5508 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5513 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5513 thiss!1305) (size!2421 (buf!2846 (_2!5279 lt!185073)))) (and (= (currentBit!5508 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5513 thiss!1305) (size!2421 (buf!2846 (_2!5279 lt!185073))))))))))

(assert (=> b!119554 d!38536))

(assert (=> b!119565 d!38520))

(assert (=> b!119565 d!38528))

(declare-fun d!38538 () Bool)

(declare-fun lt!186075 () tuple2!10044)

(assert (=> d!38538 (= lt!186075 (readBit!0 (readerFrom!0 (_2!5279 lt!185059) (currentBit!5508 thiss!1305) (currentByte!5513 thiss!1305))))))

(assert (=> d!38538 (= (readBitPure!0 (readerFrom!0 (_2!5279 lt!185059) (currentBit!5508 thiss!1305) (currentByte!5513 thiss!1305))) (tuple2!10031 (_2!5287 lt!186075) (_1!5287 lt!186075)))))

(declare-fun bs!9324 () Bool)

(assert (= bs!9324 d!38538))

(assert (=> bs!9324 m!180181))

(declare-fun m!180897 () Bool)

(assert (=> bs!9324 m!180897))

(assert (=> b!119559 d!38538))

(declare-fun d!38540 () Bool)

(declare-fun e!78534 () Bool)

(assert (=> d!38540 e!78534))

(declare-fun res!99246 () Bool)

(assert (=> d!38540 (=> (not res!99246) (not e!78534))))

(assert (=> d!38540 (= res!99246 (invariant!0 (currentBit!5508 (_2!5279 lt!185059)) (currentByte!5513 (_2!5279 lt!185059)) (size!2421 (buf!2846 (_2!5279 lt!185059)))))))

(assert (=> d!38540 (= (readerFrom!0 (_2!5279 lt!185059) (currentBit!5508 thiss!1305) (currentByte!5513 thiss!1305)) (BitStream!4317 (buf!2846 (_2!5279 lt!185059)) (currentByte!5513 thiss!1305) (currentBit!5508 thiss!1305)))))

(declare-fun b!119896 () Bool)

(assert (=> b!119896 (= e!78534 (invariant!0 (currentBit!5508 thiss!1305) (currentByte!5513 thiss!1305) (size!2421 (buf!2846 (_2!5279 lt!185059)))))))

(assert (= (and d!38540 res!99246) b!119896))

(assert (=> d!38540 m!180869))

(assert (=> b!119896 m!180135))

(assert (=> b!119559 d!38540))

(declare-fun d!38542 () Bool)

(assert (=> d!38542 (= (array_inv!2223 (buf!2846 thiss!1305)) (bvsge (size!2421 (buf!2846 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!119558 d!38542))

(declare-fun d!38544 () Bool)

(assert (=> d!38544 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5508 thiss!1305) (currentByte!5513 thiss!1305) (size!2421 (buf!2846 thiss!1305))))))

(declare-fun bs!9325 () Bool)

(assert (= bs!9325 d!38544))

(assert (=> bs!9325 m!180889))

(assert (=> start!23568 d!38544))

(declare-fun d!38546 () Bool)

(assert (=> d!38546 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!119557 d!38546))

(push 1)

(assert (not d!38524))

(assert (not d!38538))

(assert (not d!38414))

(assert (not b!119870))

(assert (not b!119767))

(assert (not b!119874))

(assert (not d!38522))

(assert (not d!38484))

(assert (not b!119766))

(assert (not b!119834))

(assert (not d!38468))

(assert (not d!38410))

(assert (not d!38520))

(assert (not b!119871))

(assert (not b!119875))

(assert (not bm!1559))

(assert (not d!38452))

(assert (not b!119896))

(assert (not d!38486))

(assert (not d!38516))

(assert (not d!38544))

(assert (not d!38470))

(assert (not b!119769))

(assert (not d!38518))

(assert (not d!38526))

(assert (not b!119774))

(assert (not b!119777))

(assert (not d!38398))

(assert (not b!119878))

(assert (not d!38498))

(assert (not b!119889))

(assert (not b!119790))

(assert (not d!38496))

(assert (not d!38510))

(assert (not b!119833))

(assert (not b!119868))

(assert (not b!119776))

(assert (not d!38416))

(assert (not d!38508))

(assert (not d!38512))

(assert (not d!38532))

(assert (not b!119772))

(assert (not b!119869))

(assert (not b!119778))

(assert (not b!119768))

(assert (not b!119771))

(assert (not b!119788))

(assert (not d!38472))

(assert (not d!38534))

(assert (not d!38528))

(assert (not b!119836))

(assert (not d!38506))

(assert (not b!119891))

(assert (not b!119837))

(assert (not d!38540))

(assert (not b!119877))

(check-sat)

(pop 1)

(push 1)

(check-sat)

