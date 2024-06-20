; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17770 () Bool)

(assert start!17770)

(declare-fun b!86339 () Bool)

(declare-fun res!70918 () Bool)

(declare-fun e!57424 () Bool)

(assert (=> b!86339 (=> (not res!70918) (not e!57424))))

(declare-datatypes ((array!4095 0))(
  ( (array!4096 (arr!2487 (Array (_ BitVec 32) (_ BitVec 8))) (size!1850 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3262 0))(
  ( (BitStream!3263 (buf!2240 array!4095) (currentByte!4446 (_ BitVec 32)) (currentBit!4441 (_ BitVec 32))) )
))
(declare-fun thiss!1152 () BitStream!3262)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!86339 (= res!70918 (invariant!0 (currentBit!4441 thiss!1152) (currentByte!4446 thiss!1152) (size!1850 (buf!2240 thiss!1152))))))

(declare-fun b!86340 () Bool)

(declare-fun res!70927 () Bool)

(declare-fun e!57419 () Bool)

(assert (=> b!86340 (=> (not res!70927) (not e!57419))))

(declare-fun i!576 () (_ BitVec 32))

(declare-fun nBits!336 () (_ BitVec 32))

(assert (=> b!86340 (= res!70927 (bvslt i!576 nBits!336))))

(declare-fun b!86341 () Bool)

(declare-fun e!57420 () Bool)

(assert (=> b!86341 (= e!57419 (not e!57420))))

(declare-fun res!70929 () Bool)

(assert (=> b!86341 (=> res!70929 e!57420)))

(declare-datatypes ((Unit!5716 0))(
  ( (Unit!5717) )
))
(declare-datatypes ((tuple2!7330 0))(
  ( (tuple2!7331 (_1!3889 Unit!5716) (_2!3889 BitStream!3262)) )
))
(declare-fun lt!135103 () tuple2!7330)

(assert (=> b!86341 (= res!70929 (not (invariant!0 (currentBit!4441 (_2!3889 lt!135103)) (currentByte!4446 (_2!3889 lt!135103)) (size!1850 (buf!2240 (_2!3889 lt!135103))))))))

(declare-fun e!57426 () Bool)

(assert (=> b!86341 e!57426))

(declare-fun res!70922 () Bool)

(assert (=> b!86341 (=> (not res!70922) (not e!57426))))

(assert (=> b!86341 (= res!70922 (= (size!1850 (buf!2240 thiss!1152)) (size!1850 (buf!2240 (_2!3889 lt!135103)))))))

(declare-fun lt!135104 () Bool)

(declare-fun appendBit!0 (BitStream!3262 Bool) tuple2!7330)

(assert (=> b!86341 (= lt!135103 (appendBit!0 thiss!1152 lt!135104))))

(declare-fun v!179 () (_ BitVec 64))

(assert (=> b!86341 (= lt!135104 (not (= (bvand v!179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!576))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!86342 () Bool)

(declare-fun res!70912 () Bool)

(assert (=> b!86342 (=> (not res!70912) (not e!57424))))

(declare-fun thiss!1151 () BitStream!3262)

(assert (=> b!86342 (= res!70912 (invariant!0 (currentBit!4441 thiss!1151) (currentByte!4446 thiss!1151) (size!1850 (buf!2240 thiss!1151))))))

(declare-fun b!86343 () Bool)

(declare-fun e!57423 () Bool)

(declare-datatypes ((tuple3!400 0))(
  ( (tuple3!401 (_1!3890 Unit!5716) (_2!3890 BitStream!3262) (_3!224 (_ BitVec 32))) )
))
(declare-fun lt!135107 () tuple3!400)

(assert (=> b!86343 (= e!57423 (or (bvsgt ((_ sign_extend 32) (size!1850 (buf!2240 (_2!3890 lt!135107)))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!4446 (_2!3890 lt!135107))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!4441 (_2!3890 lt!135107))) #b0000000000000000000000000000000001111111111111111111111111111111) (and (bvsge ((_ sign_extend 32) (size!1850 (buf!2240 (_2!3890 lt!135107)))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!4446 (_2!3890 lt!135107))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!4441 (_2!3890 lt!135107))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!86344 () Bool)

(declare-fun e!57427 () Bool)

(declare-datatypes ((tuple2!7332 0))(
  ( (tuple2!7333 (_1!3891 BitStream!3262) (_2!3891 Bool)) )
))
(declare-fun lt!135105 () tuple2!7332)

(declare-fun lt!135106 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!86344 (= e!57427 (= (bitIndex!0 (size!1850 (buf!2240 (_1!3891 lt!135105))) (currentByte!4446 (_1!3891 lt!135105)) (currentBit!4441 (_1!3891 lt!135105))) lt!135106))))

(declare-fun b!86345 () Bool)

(declare-fun res!70914 () Bool)

(assert (=> b!86345 (=> res!70914 e!57420)))

(assert (=> b!86345 (= res!70914 (bvsge (bvadd #b00000000000000000000000000000001 i!576) nBits!336))))

(declare-fun b!86346 () Bool)

(assert (=> b!86346 (= e!57420 e!57423)))

(declare-fun res!70913 () Bool)

(assert (=> b!86346 (=> res!70913 e!57423)))

(assert (=> b!86346 (= res!70913 (bvslt (_3!224 lt!135107) #b00000000000000000000000000000000))))

(declare-fun appendBitsLSBFirstWhileWhile!0 ((_ BitVec 32) BitStream!3262 (_ BitVec 64) BitStream!3262 (_ BitVec 32)) tuple3!400)

(assert (=> b!86346 (= lt!135107 (appendBitsLSBFirstWhileWhile!0 nBits!336 thiss!1151 v!179 (_2!3889 lt!135103) (bvadd #b00000000000000000000000000000001 i!576)))))

(declare-fun b!86347 () Bool)

(declare-fun res!70925 () Bool)

(assert (=> b!86347 (=> res!70925 e!57423)))

(declare-fun lt!135102 () (_ BitVec 64))

(assert (=> b!86347 (= res!70925 (not (= (bitIndex!0 (size!1850 (buf!2240 (_2!3890 lt!135107))) (currentByte!4446 (_2!3890 lt!135107)) (currentBit!4441 (_2!3890 lt!135107))) (bvadd lt!135102 ((_ sign_extend 32) (_3!224 lt!135107))))))))

(declare-fun b!86348 () Bool)

(declare-fun res!70919 () Bool)

(assert (=> b!86348 (=> (not res!70919) (not e!57424))))

(assert (=> b!86348 (= res!70919 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!86349 () Bool)

(declare-fun e!57428 () Bool)

(declare-fun array_inv!1696 (array!4095) Bool)

(assert (=> b!86349 (= e!57428 (array_inv!1696 (buf!2240 thiss!1152)))))

(declare-fun b!86350 () Bool)

(declare-fun e!57429 () Bool)

(assert (=> b!86350 (= e!57429 (array_inv!1696 (buf!2240 thiss!1151)))))

(declare-fun b!86351 () Bool)

(declare-fun res!70926 () Bool)

(assert (=> b!86351 (=> (not res!70926) (not e!57424))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!86351 (= res!70926 (validate_offset_bits!1 ((_ sign_extend 32) (size!1850 (buf!2240 thiss!1151))) ((_ sign_extend 32) (currentByte!4446 thiss!1151)) ((_ sign_extend 32) (currentBit!4441 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun res!70921 () Bool)

(assert (=> start!17770 (=> (not res!70921) (not e!57424))))

(assert (=> start!17770 (= res!70921 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!17770 e!57424))

(declare-fun inv!12 (BitStream!3262) Bool)

(assert (=> start!17770 (and (inv!12 thiss!1152) e!57428)))

(assert (=> start!17770 (and (inv!12 thiss!1151) e!57429)))

(assert (=> start!17770 true))

(declare-fun b!86352 () Bool)

(declare-fun res!70930 () Bool)

(assert (=> b!86352 (=> (not res!70930) (not e!57419))))

(assert (=> b!86352 (= res!70930 (validate_offset_bits!1 ((_ sign_extend 32) (size!1850 (buf!2240 thiss!1152))) ((_ sign_extend 32) (currentByte!4446 thiss!1152)) ((_ sign_extend 32) (currentBit!4441 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun b!86353 () Bool)

(declare-fun res!70923 () Bool)

(assert (=> b!86353 (=> res!70923 e!57423)))

(assert (=> b!86353 (= res!70923 (not (invariant!0 (currentBit!4441 (_2!3890 lt!135107)) (currentByte!4446 (_2!3890 lt!135107)) (size!1850 (buf!2240 (_2!3890 lt!135107))))))))

(declare-fun b!86354 () Bool)

(declare-fun res!70924 () Bool)

(assert (=> b!86354 (=> res!70924 e!57423)))

(assert (=> b!86354 (= res!70924 (or (bvsgt (_3!224 lt!135107) nBits!336) (not (= (size!1850 (buf!2240 (_2!3890 lt!135107))) (size!1850 (buf!2240 thiss!1151))))))))

(declare-fun b!86355 () Bool)

(declare-fun res!70915 () Bool)

(declare-fun e!57422 () Bool)

(assert (=> b!86355 (=> (not res!70915) (not e!57422))))

(declare-fun isPrefixOf!0 (BitStream!3262 BitStream!3262) Bool)

(assert (=> b!86355 (= res!70915 (isPrefixOf!0 thiss!1152 (_2!3889 lt!135103)))))

(declare-fun b!86356 () Bool)

(assert (=> b!86356 (= e!57424 e!57419)))

(declare-fun res!70916 () Bool)

(assert (=> b!86356 (=> (not res!70916) (not e!57419))))

(declare-fun lt!135108 () (_ BitVec 64))

(assert (=> b!86356 (= res!70916 (= lt!135108 (bvadd lt!135102 ((_ sign_extend 32) i!576))))))

(assert (=> b!86356 (= lt!135108 (bitIndex!0 (size!1850 (buf!2240 thiss!1152)) (currentByte!4446 thiss!1152) (currentBit!4441 thiss!1152)))))

(assert (=> b!86356 (= lt!135102 (bitIndex!0 (size!1850 (buf!2240 thiss!1151)) (currentByte!4446 thiss!1151) (currentBit!4441 thiss!1151)))))

(declare-fun b!86357 () Bool)

(assert (=> b!86357 (= e!57422 e!57427)))

(declare-fun res!70928 () Bool)

(assert (=> b!86357 (=> (not res!70928) (not e!57427))))

(assert (=> b!86357 (= res!70928 (and (= (_2!3891 lt!135105) lt!135104) (= (_1!3891 lt!135105) (_2!3889 lt!135103))))))

(declare-fun readBitPure!0 (BitStream!3262) tuple2!7332)

(declare-fun readerFrom!0 (BitStream!3262 (_ BitVec 32) (_ BitVec 32)) BitStream!3262)

(assert (=> b!86357 (= lt!135105 (readBitPure!0 (readerFrom!0 (_2!3889 lt!135103) (currentBit!4441 thiss!1152) (currentByte!4446 thiss!1152))))))

(declare-fun b!86358 () Bool)

(declare-fun res!70917 () Bool)

(assert (=> b!86358 (=> (not res!70917) (not e!57424))))

(assert (=> b!86358 (= res!70917 (and (bvsle i!576 nBits!336) (= (size!1850 (buf!2240 thiss!1152)) (size!1850 (buf!2240 thiss!1151)))))))

(declare-fun b!86359 () Bool)

(assert (=> b!86359 (= e!57426 e!57422)))

(declare-fun res!70920 () Bool)

(assert (=> b!86359 (=> (not res!70920) (not e!57422))))

(assert (=> b!86359 (= res!70920 (= lt!135106 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!135108)))))

(assert (=> b!86359 (= lt!135106 (bitIndex!0 (size!1850 (buf!2240 (_2!3889 lt!135103))) (currentByte!4446 (_2!3889 lt!135103)) (currentBit!4441 (_2!3889 lt!135103))))))

(assert (= (and start!17770 res!70921) b!86351))

(assert (= (and b!86351 res!70926) b!86342))

(assert (= (and b!86342 res!70912) b!86348))

(assert (= (and b!86348 res!70919) b!86339))

(assert (= (and b!86339 res!70918) b!86358))

(assert (= (and b!86358 res!70917) b!86356))

(assert (= (and b!86356 res!70916) b!86352))

(assert (= (and b!86352 res!70930) b!86340))

(assert (= (and b!86340 res!70927) b!86341))

(assert (= (and b!86341 res!70922) b!86359))

(assert (= (and b!86359 res!70920) b!86355))

(assert (= (and b!86355 res!70915) b!86357))

(assert (= (and b!86357 res!70928) b!86344))

(assert (= (and b!86341 (not res!70929)) b!86345))

(assert (= (and b!86345 (not res!70914)) b!86346))

(assert (= (and b!86346 (not res!70913)) b!86353))

(assert (= (and b!86353 (not res!70923)) b!86354))

(assert (= (and b!86354 (not res!70924)) b!86347))

(assert (= (and b!86347 (not res!70925)) b!86343))

(assert (= start!17770 b!86349))

(assert (= start!17770 b!86350))

(declare-fun m!132209 () Bool)

(assert (=> start!17770 m!132209))

(declare-fun m!132211 () Bool)

(assert (=> start!17770 m!132211))

(declare-fun m!132213 () Bool)

(assert (=> b!86355 m!132213))

(declare-fun m!132215 () Bool)

(assert (=> b!86349 m!132215))

(declare-fun m!132217 () Bool)

(assert (=> b!86351 m!132217))

(declare-fun m!132219 () Bool)

(assert (=> b!86357 m!132219))

(assert (=> b!86357 m!132219))

(declare-fun m!132221 () Bool)

(assert (=> b!86357 m!132221))

(declare-fun m!132223 () Bool)

(assert (=> b!86344 m!132223))

(declare-fun m!132225 () Bool)

(assert (=> b!86346 m!132225))

(declare-fun m!132227 () Bool)

(assert (=> b!86341 m!132227))

(declare-fun m!132229 () Bool)

(assert (=> b!86341 m!132229))

(declare-fun m!132231 () Bool)

(assert (=> b!86352 m!132231))

(declare-fun m!132233 () Bool)

(assert (=> b!86353 m!132233))

(declare-fun m!132235 () Bool)

(assert (=> b!86359 m!132235))

(declare-fun m!132237 () Bool)

(assert (=> b!86347 m!132237))

(declare-fun m!132239 () Bool)

(assert (=> b!86339 m!132239))

(declare-fun m!132241 () Bool)

(assert (=> b!86342 m!132241))

(declare-fun m!132243 () Bool)

(assert (=> b!86350 m!132243))

(declare-fun m!132245 () Bool)

(assert (=> b!86356 m!132245))

(declare-fun m!132247 () Bool)

(assert (=> b!86356 m!132247))

(push 1)

(assert (not b!86349))

(assert (not b!86353))

(assert (not b!86350))

(assert (not b!86347))

(assert (not b!86342))

(assert (not b!86357))

(assert (not b!86355))

(assert (not b!86346))

(assert (not b!86344))

(assert (not start!17770))

(assert (not b!86351))

(assert (not b!86352))

(assert (not b!86356))

(assert (not b!86359))

(assert (not b!86341))

(assert (not b!86339))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!27462 () Bool)

(declare-datatypes ((tuple2!7344 0))(
  ( (tuple2!7345 (_1!3899 Bool) (_2!3899 BitStream!3262)) )
))
(declare-fun lt!135202 () tuple2!7344)

(declare-fun readBit!0 (BitStream!3262) tuple2!7344)

(assert (=> d!27462 (= lt!135202 (readBit!0 (readerFrom!0 (_2!3889 lt!135103) (currentBit!4441 thiss!1152) (currentByte!4446 thiss!1152))))))

(assert (=> d!27462 (= (readBitPure!0 (readerFrom!0 (_2!3889 lt!135103) (currentBit!4441 thiss!1152) (currentByte!4446 thiss!1152))) (tuple2!7333 (_2!3899 lt!135202) (_1!3899 lt!135202)))))

(declare-fun bs!6808 () Bool)

(assert (= bs!6808 d!27462))

(assert (=> bs!6808 m!132219))

(declare-fun m!132339 () Bool)

(assert (=> bs!6808 m!132339))

(assert (=> b!86357 d!27462))

(declare-fun d!27464 () Bool)

(declare-fun e!57521 () Bool)

(assert (=> d!27464 e!57521))

(declare-fun res!71104 () Bool)

(assert (=> d!27464 (=> (not res!71104) (not e!57521))))

(assert (=> d!27464 (= res!71104 (invariant!0 (currentBit!4441 (_2!3889 lt!135103)) (currentByte!4446 (_2!3889 lt!135103)) (size!1850 (buf!2240 (_2!3889 lt!135103)))))))

(assert (=> d!27464 (= (readerFrom!0 (_2!3889 lt!135103) (currentBit!4441 thiss!1152) (currentByte!4446 thiss!1152)) (BitStream!3263 (buf!2240 (_2!3889 lt!135103)) (currentByte!4446 thiss!1152) (currentBit!4441 thiss!1152)))))

(declare-fun b!86549 () Bool)

(assert (=> b!86549 (= e!57521 (invariant!0 (currentBit!4441 thiss!1152) (currentByte!4446 thiss!1152) (size!1850 (buf!2240 (_2!3889 lt!135103)))))))

(assert (= (and d!27464 res!71104) b!86549))

(assert (=> d!27464 m!132227))

(declare-fun m!132363 () Bool)

(assert (=> b!86549 m!132363))

(assert (=> b!86357 d!27464))

(declare-fun b!86631 () Bool)

(declare-fun res!71187 () Bool)

(declare-fun e!57559 () Bool)

(assert (=> b!86631 (=> (not res!71187) (not e!57559))))

(declare-fun lt!135293 () tuple3!400)

(assert (=> b!86631 (= res!71187 (validate_offset_bits!1 ((_ sign_extend 32) (size!1850 (buf!2240 (_2!3890 lt!135293)))) ((_ sign_extend 32) (currentByte!4446 (_2!3890 lt!135293))) ((_ sign_extend 32) (currentBit!4441 (_2!3890 lt!135293))) ((_ sign_extend 32) (bvsub nBits!336 (_3!224 lt!135293)))))))

(assert (=> b!86631 (or (= (bvand nBits!336 #b10000000000000000000000000000000) (bvand (_3!224 lt!135293) #b10000000000000000000000000000000)) (= (bvand nBits!336 #b10000000000000000000000000000000) (bvand (bvsub nBits!336 (_3!224 lt!135293)) #b10000000000000000000000000000000)))))

(declare-fun b!86632 () Bool)

(declare-fun res!71189 () Bool)

(declare-fun e!57561 () Bool)

(assert (=> b!86632 (=> (not res!71189) (not e!57561))))

(assert (=> b!86632 (= res!71189 (invariant!0 (currentBit!4441 (_2!3889 lt!135103)) (currentByte!4446 (_2!3889 lt!135103)) (size!1850 (buf!2240 (_2!3889 lt!135103)))))))

(declare-fun b!86634 () Bool)

(declare-fun e!57563 () Bool)

(declare-fun e!57560 () Bool)

(assert (=> b!86634 (= e!57563 e!57560)))

(declare-fun res!71194 () Bool)

(assert (=> b!86634 (=> (not res!71194) (not e!57560))))

(declare-fun lt!135295 () tuple2!7332)

(declare-fun lt!135297 () tuple2!7330)

(declare-fun lt!135296 () Bool)

(assert (=> b!86634 (= res!71194 (and (= (_2!3891 lt!135295) lt!135296) (= (_1!3891 lt!135295) (_2!3889 lt!135297))))))

(assert (=> b!86634 (= lt!135295 (readBitPure!0 (readerFrom!0 (_2!3889 lt!135297) (currentBit!4441 (_2!3889 lt!135103)) (currentByte!4446 (_2!3889 lt!135103)))))))

(declare-fun b!86635 () Bool)

(assert (=> b!86635 (= e!57560 (= (bitIndex!0 (size!1850 (buf!2240 (_1!3891 lt!135295))) (currentByte!4446 (_1!3891 lt!135295)) (currentBit!4441 (_1!3891 lt!135295))) (bitIndex!0 (size!1850 (buf!2240 (_2!3889 lt!135297))) (currentByte!4446 (_2!3889 lt!135297)) (currentBit!4441 (_2!3889 lt!135297)))))))

(declare-fun b!86636 () Bool)

(assert (=> b!86636 (= e!57561 (bvslt (bvadd #b00000000000000000000000000000001 i!576) nBits!336))))

(declare-fun b!86637 () Bool)

(declare-fun res!71193 () Bool)

(assert (=> b!86637 (=> (not res!71193) (not e!57559))))

(assert (=> b!86637 (= res!71193 (and (bvsle (_3!224 lt!135293) nBits!336) (= (size!1850 (buf!2240 (_2!3890 lt!135293))) (size!1850 (buf!2240 thiss!1151)))))))

(declare-fun b!86638 () Bool)

(declare-fun res!71181 () Bool)

(assert (=> b!86638 (=> (not res!71181) (not e!57559))))

(assert (=> b!86638 (= res!71181 (invariant!0 (currentBit!4441 (_2!3890 lt!135293)) (currentByte!4446 (_2!3890 lt!135293)) (size!1850 (buf!2240 (_2!3890 lt!135293)))))))

(declare-fun b!86639 () Bool)

(declare-fun res!71191 () Bool)

(assert (=> b!86639 (=> (not res!71191) (not e!57563))))

(assert (=> b!86639 (= res!71191 (isPrefixOf!0 (_2!3889 lt!135103) (_2!3889 lt!135297)))))

(declare-fun b!86640 () Bool)

(declare-fun res!71183 () Bool)

(assert (=> b!86640 (=> (not res!71183) (not e!57561))))

(assert (=> b!86640 (= res!71183 (= (bitIndex!0 (size!1850 (buf!2240 (_2!3889 lt!135103))) (currentByte!4446 (_2!3889 lt!135103)) (currentBit!4441 (_2!3889 lt!135103))) (bvadd (bitIndex!0 (size!1850 (buf!2240 thiss!1151)) (currentByte!4446 thiss!1151) (currentBit!4441 thiss!1151)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!576)))))))

(declare-fun b!86641 () Bool)

(declare-fun e!57562 () tuple3!400)

(declare-fun lt!135294 () tuple2!7330)

(declare-fun lt!135298 () (_ BitVec 32))

(declare-fun Unit!5723 () Unit!5716)

(assert (=> b!86641 (= e!57562 (tuple3!401 Unit!5723 (_2!3889 lt!135294) lt!135298))))

(declare-fun b!86642 () Bool)

(declare-fun res!71192 () Bool)

(assert (=> b!86642 (=> (not res!71192) (not e!57561))))

(assert (=> b!86642 (= res!71192 (and (bvsle (bvadd #b00000000000000000000000000000001 i!576) nBits!336) (= (size!1850 (buf!2240 (_2!3889 lt!135103))) (size!1850 (buf!2240 thiss!1151)))))))

(declare-fun b!86643 () Bool)

(declare-fun res!71182 () Bool)

(assert (=> b!86643 (=> (not res!71182) (not e!57561))))

(assert (=> b!86643 (= res!71182 (validate_offset_bits!1 ((_ sign_extend 32) (size!1850 (buf!2240 (_2!3889 lt!135103)))) ((_ sign_extend 32) (currentByte!4446 (_2!3889 lt!135103))) ((_ sign_extend 32) (currentBit!4441 (_2!3889 lt!135103))) ((_ sign_extend 32) (bvsub nBits!336 (bvadd #b00000000000000000000000000000001 i!576)))))))

(declare-fun b!86644 () Bool)

(declare-fun res!71184 () Bool)

(assert (=> b!86644 (=> (not res!71184) (not e!57563))))

(assert (=> b!86644 (= res!71184 (= (bitIndex!0 (size!1850 (buf!2240 (_2!3889 lt!135297))) (currentByte!4446 (_2!3889 lt!135297)) (currentBit!4441 (_2!3889 lt!135297))) (bvadd (bitIndex!0 (size!1850 (buf!2240 (_2!3889 lt!135103))) (currentByte!4446 (_2!3889 lt!135103)) (currentBit!4441 (_2!3889 lt!135103))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!86633 () Bool)

(assert (=> b!86633 (= e!57562 (appendBitsLSBFirstWhileWhile!0 nBits!336 thiss!1151 v!179 (_2!3889 lt!135294) lt!135298))))

(declare-fun d!27468 () Bool)

(assert (=> d!27468 e!57559))

(declare-fun res!71186 () Bool)

(assert (=> d!27468 (=> (not res!71186) (not e!57559))))

(assert (=> d!27468 (= res!71186 (bvsge (_3!224 lt!135293) #b00000000000000000000000000000000))))

(assert (=> d!27468 (= lt!135293 e!57562)))

(declare-fun c!5855 () Bool)

(assert (=> d!27468 (= c!5855 (bvslt lt!135298 nBits!336))))

(assert (=> d!27468 (= lt!135298 (bvadd #b00000000000000000000000000000001 i!576 #b00000000000000000000000000000001))))

(assert (=> d!27468 (= lt!135294 lt!135297)))

(assert (=> d!27468 e!57563))

(declare-fun res!71188 () Bool)

(assert (=> d!27468 (=> (not res!71188) (not e!57563))))

(assert (=> d!27468 (= res!71188 (= (size!1850 (buf!2240 (_2!3889 lt!135103))) (size!1850 (buf!2240 (_2!3889 lt!135297)))))))

(assert (=> d!27468 (= lt!135297 (appendBit!0 (_2!3889 lt!135103) lt!135296))))

(assert (=> d!27468 (= lt!135296 (not (= (bvand v!179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!576)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!27468 e!57561))

(declare-fun res!71185 () Bool)

(assert (=> d!27468 (=> (not res!71185) (not e!57561))))

(assert (=> d!27468 (= res!71185 (bvsge (bvadd #b00000000000000000000000000000001 i!576) #b00000000000000000000000000000000))))

(assert (=> d!27468 (= (appendBitsLSBFirstWhileWhile!0 nBits!336 thiss!1151 v!179 (_2!3889 lt!135103) (bvadd #b00000000000000000000000000000001 i!576)) lt!135293)))

(declare-fun b!86645 () Bool)

(assert (=> b!86645 (= e!57559 (bvsge (_3!224 lt!135293) nBits!336))))

(declare-fun b!86646 () Bool)

(declare-fun res!71190 () Bool)

(assert (=> b!86646 (=> (not res!71190) (not e!57559))))

(declare-fun lt!135300 () (_ BitVec 64))

(declare-fun lt!135299 () (_ BitVec 64))

(assert (=> b!86646 (= res!71190 (= (bitIndex!0 (size!1850 (buf!2240 (_2!3890 lt!135293))) (currentByte!4446 (_2!3890 lt!135293)) (currentBit!4441 (_2!3890 lt!135293))) (bvadd lt!135300 lt!135299)))))

(assert (=> b!86646 (or (not (= (bvand lt!135300 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!135299 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!135300 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!135300 lt!135299) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!86646 (= lt!135299 ((_ sign_extend 32) (_3!224 lt!135293)))))

(assert (=> b!86646 (= lt!135300 (bitIndex!0 (size!1850 (buf!2240 thiss!1151)) (currentByte!4446 thiss!1151) (currentBit!4441 thiss!1151)))))

(assert (= (and d!27468 res!71185) b!86632))

(assert (= (and b!86632 res!71189) b!86642))

(assert (= (and b!86642 res!71192) b!86640))

(assert (= (and b!86640 res!71183) b!86643))

(assert (= (and b!86643 res!71182) b!86636))

(assert (= (and d!27468 res!71188) b!86644))

(assert (= (and b!86644 res!71184) b!86639))

(assert (= (and b!86639 res!71191) b!86634))

(assert (= (and b!86634 res!71194) b!86635))

(assert (= (and d!27468 c!5855) b!86633))

(assert (= (and d!27468 (not c!5855)) b!86641))

(assert (= (and d!27468 res!71186) b!86638))

(assert (= (and b!86638 res!71181) b!86637))

(assert (= (and b!86637 res!71193) b!86646))

(assert (= (and b!86646 res!71190) b!86631))

(assert (= (and b!86631 res!71187) b!86645))

(declare-fun m!132401 () Bool)

(assert (=> b!86646 m!132401))

(assert (=> b!86646 m!132247))

(assert (=> b!86632 m!132227))

(assert (=> b!86640 m!132235))

(assert (=> b!86640 m!132247))

(declare-fun m!132403 () Bool)

(assert (=> b!86638 m!132403))

(declare-fun m!132405 () Bool)

(assert (=> d!27468 m!132405))

(declare-fun m!132407 () Bool)

(assert (=> b!86633 m!132407))

(declare-fun m!132409 () Bool)

(assert (=> b!86644 m!132409))

(assert (=> b!86644 m!132235))

(declare-fun m!132411 () Bool)

(assert (=> b!86635 m!132411))

(assert (=> b!86635 m!132409))

(declare-fun m!132413 () Bool)

(assert (=> b!86631 m!132413))

(declare-fun m!132415 () Bool)

(assert (=> b!86639 m!132415))

(declare-fun m!132417 () Bool)

(assert (=> b!86643 m!132417))

(declare-fun m!132419 () Bool)

(assert (=> b!86634 m!132419))

(assert (=> b!86634 m!132419))

(declare-fun m!132421 () Bool)

(assert (=> b!86634 m!132421))

(assert (=> b!86346 d!27468))

(declare-fun d!27510 () Bool)

(declare-fun e!57570 () Bool)

(assert (=> d!27510 e!57570))

(declare-fun res!71215 () Bool)

(assert (=> d!27510 (=> (not res!71215) (not e!57570))))

(declare-fun lt!135328 () (_ BitVec 64))

(declare-fun lt!135326 () (_ BitVec 64))

(declare-fun lt!135324 () (_ BitVec 64))

(assert (=> d!27510 (= res!71215 (= lt!135326 (bvsub lt!135328 lt!135324)))))

(assert (=> d!27510 (or (= (bvand lt!135328 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!135324 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!135328 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!135328 lt!135324) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!27510 (= lt!135324 (remainingBits!0 ((_ sign_extend 32) (size!1850 (buf!2240 thiss!1152))) ((_ sign_extend 32) (currentByte!4446 thiss!1152)) ((_ sign_extend 32) (currentBit!4441 thiss!1152))))))

(declare-fun lt!135325 () (_ BitVec 64))

(declare-fun lt!135327 () (_ BitVec 64))

(assert (=> d!27510 (= lt!135328 (bvmul lt!135325 lt!135327))))

(assert (=> d!27510 (or (= lt!135325 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!135327 (bvsdiv (bvmul lt!135325 lt!135327) lt!135325)))))

(assert (=> d!27510 (= lt!135327 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27510 (= lt!135325 ((_ sign_extend 32) (size!1850 (buf!2240 thiss!1152))))))

(assert (=> d!27510 (= lt!135326 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4446 thiss!1152)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4441 thiss!1152))))))

(assert (=> d!27510 (invariant!0 (currentBit!4441 thiss!1152) (currentByte!4446 thiss!1152) (size!1850 (buf!2240 thiss!1152)))))

(assert (=> d!27510 (= (bitIndex!0 (size!1850 (buf!2240 thiss!1152)) (currentByte!4446 thiss!1152) (currentBit!4441 thiss!1152)) lt!135326)))

(declare-fun b!86667 () Bool)

(declare-fun res!71216 () Bool)

(assert (=> b!86667 (=> (not res!71216) (not e!57570))))

(assert (=> b!86667 (= res!71216 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!135326))))

(declare-fun b!86668 () Bool)

(declare-fun lt!135323 () (_ BitVec 64))

(assert (=> b!86668 (= e!57570 (bvsle lt!135326 (bvmul lt!135323 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!86668 (or (= lt!135323 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!135323 #b0000000000000000000000000000000000000000000000000000000000001000) lt!135323)))))

(assert (=> b!86668 (= lt!135323 ((_ sign_extend 32) (size!1850 (buf!2240 thiss!1152))))))

(assert (= (and d!27510 res!71215) b!86667))

(assert (= (and b!86667 res!71216) b!86668))

(declare-fun m!132423 () Bool)

(assert (=> d!27510 m!132423))

(assert (=> d!27510 m!132239))

(assert (=> b!86356 d!27510))

(declare-fun d!27512 () Bool)

(declare-fun e!57575 () Bool)

(assert (=> d!27512 e!57575))

(declare-fun res!71219 () Bool)

(assert (=> d!27512 (=> (not res!71219) (not e!57575))))

(declare-fun lt!135334 () (_ BitVec 64))

(declare-fun lt!135332 () (_ BitVec 64))

(declare-fun lt!135336 () (_ BitVec 64))

(assert (=> d!27512 (= res!71219 (= lt!135334 (bvsub lt!135336 lt!135332)))))

(assert (=> d!27512 (or (= (bvand lt!135336 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!135332 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!135336 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!135336 lt!135332) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!27512 (= lt!135332 (remainingBits!0 ((_ sign_extend 32) (size!1850 (buf!2240 thiss!1151))) ((_ sign_extend 32) (currentByte!4446 thiss!1151)) ((_ sign_extend 32) (currentBit!4441 thiss!1151))))))

(declare-fun lt!135333 () (_ BitVec 64))

(declare-fun lt!135335 () (_ BitVec 64))

(assert (=> d!27512 (= lt!135336 (bvmul lt!135333 lt!135335))))

(assert (=> d!27512 (or (= lt!135333 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!135335 (bvsdiv (bvmul lt!135333 lt!135335) lt!135333)))))

(assert (=> d!27512 (= lt!135335 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27512 (= lt!135333 ((_ sign_extend 32) (size!1850 (buf!2240 thiss!1151))))))

(assert (=> d!27512 (= lt!135334 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4446 thiss!1151)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4441 thiss!1151))))))

(assert (=> d!27512 (invariant!0 (currentBit!4441 thiss!1151) (currentByte!4446 thiss!1151) (size!1850 (buf!2240 thiss!1151)))))

(assert (=> d!27512 (= (bitIndex!0 (size!1850 (buf!2240 thiss!1151)) (currentByte!4446 thiss!1151) (currentBit!4441 thiss!1151)) lt!135334)))

(declare-fun b!86675 () Bool)

(declare-fun res!71220 () Bool)

(assert (=> b!86675 (=> (not res!71220) (not e!57575))))

(assert (=> b!86675 (= res!71220 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!135334))))

(declare-fun b!86676 () Bool)

(declare-fun lt!135331 () (_ BitVec 64))

(assert (=> b!86676 (= e!57575 (bvsle lt!135334 (bvmul lt!135331 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!86676 (or (= lt!135331 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!135331 #b0000000000000000000000000000000000000000000000000000000000001000) lt!135331)))))

(assert (=> b!86676 (= lt!135331 ((_ sign_extend 32) (size!1850 (buf!2240 thiss!1151))))))

(assert (= (and d!27512 res!71219) b!86675))

(assert (= (and b!86675 res!71220) b!86676))

(declare-fun m!132425 () Bool)

(assert (=> d!27512 m!132425))

(assert (=> d!27512 m!132241))

(assert (=> b!86356 d!27512))

(declare-fun d!27514 () Bool)

(declare-fun e!57578 () Bool)

(assert (=> d!27514 e!57578))

(declare-fun res!71222 () Bool)

(assert (=> d!27514 (=> (not res!71222) (not e!57578))))

(declare-fun lt!135338 () (_ BitVec 64))

(declare-fun lt!135342 () (_ BitVec 64))

(declare-fun lt!135340 () (_ BitVec 64))

(assert (=> d!27514 (= res!71222 (= lt!135340 (bvsub lt!135342 lt!135338)))))

(assert (=> d!27514 (or (= (bvand lt!135342 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!135338 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!135342 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!135342 lt!135338) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!27514 (= lt!135338 (remainingBits!0 ((_ sign_extend 32) (size!1850 (buf!2240 (_2!3890 lt!135107)))) ((_ sign_extend 32) (currentByte!4446 (_2!3890 lt!135107))) ((_ sign_extend 32) (currentBit!4441 (_2!3890 lt!135107)))))))

(declare-fun lt!135339 () (_ BitVec 64))

(declare-fun lt!135341 () (_ BitVec 64))

(assert (=> d!27514 (= lt!135342 (bvmul lt!135339 lt!135341))))

(assert (=> d!27514 (or (= lt!135339 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!135341 (bvsdiv (bvmul lt!135339 lt!135341) lt!135339)))))

(assert (=> d!27514 (= lt!135341 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27514 (= lt!135339 ((_ sign_extend 32) (size!1850 (buf!2240 (_2!3890 lt!135107)))))))

(assert (=> d!27514 (= lt!135340 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4446 (_2!3890 lt!135107))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4441 (_2!3890 lt!135107)))))))

(assert (=> d!27514 (invariant!0 (currentBit!4441 (_2!3890 lt!135107)) (currentByte!4446 (_2!3890 lt!135107)) (size!1850 (buf!2240 (_2!3890 lt!135107))))))

(assert (=> d!27514 (= (bitIndex!0 (size!1850 (buf!2240 (_2!3890 lt!135107))) (currentByte!4446 (_2!3890 lt!135107)) (currentBit!4441 (_2!3890 lt!135107))) lt!135340)))

(declare-fun b!86677 () Bool)

(declare-fun res!71224 () Bool)

(assert (=> b!86677 (=> (not res!71224) (not e!57578))))

(assert (=> b!86677 (= res!71224 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!135340))))

(declare-fun b!86678 () Bool)

(declare-fun lt!135337 () (_ BitVec 64))

(assert (=> b!86678 (= e!57578 (bvsle lt!135340 (bvmul lt!135337 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!86678 (or (= lt!135337 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!135337 #b0000000000000000000000000000000000000000000000000000000000001000) lt!135337)))))

(assert (=> b!86678 (= lt!135337 ((_ sign_extend 32) (size!1850 (buf!2240 (_2!3890 lt!135107)))))))

(assert (= (and d!27514 res!71222) b!86677))

(assert (= (and b!86677 res!71224) b!86678))

(declare-fun m!132427 () Bool)

(assert (=> d!27514 m!132427))

(assert (=> d!27514 m!132233))

(assert (=> b!86347 d!27514))

(declare-fun d!27516 () Bool)

(assert (=> d!27516 (= (inv!12 thiss!1152) (invariant!0 (currentBit!4441 thiss!1152) (currentByte!4446 thiss!1152) (size!1850 (buf!2240 thiss!1152))))))

(declare-fun bs!6813 () Bool)

(assert (= bs!6813 d!27516))

(assert (=> bs!6813 m!132239))

(assert (=> start!17770 d!27516))

(declare-fun d!27518 () Bool)

(assert (=> d!27518 (= (inv!12 thiss!1151) (invariant!0 (currentBit!4441 thiss!1151) (currentByte!4446 thiss!1151) (size!1850 (buf!2240 thiss!1151))))))

(declare-fun bs!6814 () Bool)

(assert (= bs!6814 d!27518))

(assert (=> bs!6814 m!132241))

(assert (=> start!17770 d!27518))

(declare-fun d!27520 () Bool)

(declare-fun res!71239 () Bool)

(declare-fun e!57584 () Bool)

(assert (=> d!27520 (=> (not res!71239) (not e!57584))))

(assert (=> d!27520 (= res!71239 (= (size!1850 (buf!2240 thiss!1152)) (size!1850 (buf!2240 (_2!3889 lt!135103)))))))

(assert (=> d!27520 (= (isPrefixOf!0 thiss!1152 (_2!3889 lt!135103)) e!57584)))

(declare-fun b!86695 () Bool)

(declare-fun res!71240 () Bool)

(assert (=> b!86695 (=> (not res!71240) (not e!57584))))

(assert (=> b!86695 (= res!71240 (bvsle (bitIndex!0 (size!1850 (buf!2240 thiss!1152)) (currentByte!4446 thiss!1152) (currentBit!4441 thiss!1152)) (bitIndex!0 (size!1850 (buf!2240 (_2!3889 lt!135103))) (currentByte!4446 (_2!3889 lt!135103)) (currentBit!4441 (_2!3889 lt!135103)))))))

(declare-fun b!86696 () Bool)

(declare-fun e!57583 () Bool)

(assert (=> b!86696 (= e!57584 e!57583)))

(declare-fun res!71241 () Bool)

(assert (=> b!86696 (=> res!71241 e!57583)))

(assert (=> b!86696 (= res!71241 (= (size!1850 (buf!2240 thiss!1152)) #b00000000000000000000000000000000))))

(declare-fun b!86697 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4095 array!4095 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!86697 (= e!57583 (arrayBitRangesEq!0 (buf!2240 thiss!1152) (buf!2240 (_2!3889 lt!135103)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1850 (buf!2240 thiss!1152)) (currentByte!4446 thiss!1152) (currentBit!4441 thiss!1152))))))

(assert (= (and d!27520 res!71239) b!86695))

(assert (= (and b!86695 res!71240) b!86696))

(assert (= (and b!86696 (not res!71241)) b!86697))

(assert (=> b!86695 m!132245))

(assert (=> b!86695 m!132235))

(assert (=> b!86697 m!132245))

(assert (=> b!86697 m!132245))

(declare-fun m!132429 () Bool)

(assert (=> b!86697 m!132429))

(assert (=> b!86355 d!27520))

(declare-fun d!27522 () Bool)

(declare-fun e!57585 () Bool)

(assert (=> d!27522 e!57585))

(declare-fun res!71242 () Bool)

(assert (=> d!27522 (=> (not res!71242) (not e!57585))))

(declare-fun lt!135350 () (_ BitVec 64))

(declare-fun lt!135348 () (_ BitVec 64))

(declare-fun lt!135352 () (_ BitVec 64))

(assert (=> d!27522 (= res!71242 (= lt!135350 (bvsub lt!135352 lt!135348)))))

(assert (=> d!27522 (or (= (bvand lt!135352 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!135348 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!135352 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!135352 lt!135348) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!27522 (= lt!135348 (remainingBits!0 ((_ sign_extend 32) (size!1850 (buf!2240 (_1!3891 lt!135105)))) ((_ sign_extend 32) (currentByte!4446 (_1!3891 lt!135105))) ((_ sign_extend 32) (currentBit!4441 (_1!3891 lt!135105)))))))

(declare-fun lt!135349 () (_ BitVec 64))

(declare-fun lt!135351 () (_ BitVec 64))

(assert (=> d!27522 (= lt!135352 (bvmul lt!135349 lt!135351))))

(assert (=> d!27522 (or (= lt!135349 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!135351 (bvsdiv (bvmul lt!135349 lt!135351) lt!135349)))))

(assert (=> d!27522 (= lt!135351 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27522 (= lt!135349 ((_ sign_extend 32) (size!1850 (buf!2240 (_1!3891 lt!135105)))))))

(assert (=> d!27522 (= lt!135350 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4446 (_1!3891 lt!135105))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4441 (_1!3891 lt!135105)))))))

(assert (=> d!27522 (invariant!0 (currentBit!4441 (_1!3891 lt!135105)) (currentByte!4446 (_1!3891 lt!135105)) (size!1850 (buf!2240 (_1!3891 lt!135105))))))

(assert (=> d!27522 (= (bitIndex!0 (size!1850 (buf!2240 (_1!3891 lt!135105))) (currentByte!4446 (_1!3891 lt!135105)) (currentBit!4441 (_1!3891 lt!135105))) lt!135350)))

(declare-fun b!86698 () Bool)

(declare-fun res!71243 () Bool)

(assert (=> b!86698 (=> (not res!71243) (not e!57585))))

(assert (=> b!86698 (= res!71243 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!135350))))

(declare-fun b!86699 () Bool)

(declare-fun lt!135347 () (_ BitVec 64))

(assert (=> b!86699 (= e!57585 (bvsle lt!135350 (bvmul lt!135347 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!86699 (or (= lt!135347 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!135347 #b0000000000000000000000000000000000000000000000000000000000001000) lt!135347)))))

(assert (=> b!86699 (= lt!135347 ((_ sign_extend 32) (size!1850 (buf!2240 (_1!3891 lt!135105)))))))

(assert (= (and d!27522 res!71242) b!86698))

(assert (= (and b!86698 res!71243) b!86699))

(declare-fun m!132431 () Bool)

(assert (=> d!27522 m!132431))

(declare-fun m!132433 () Bool)

(assert (=> d!27522 m!132433))

(assert (=> b!86344 d!27522))

(declare-fun d!27524 () Bool)

(assert (=> d!27524 (= (invariant!0 (currentBit!4441 (_2!3889 lt!135103)) (currentByte!4446 (_2!3889 lt!135103)) (size!1850 (buf!2240 (_2!3889 lt!135103)))) (and (bvsge (currentBit!4441 (_2!3889 lt!135103)) #b00000000000000000000000000000000) (bvslt (currentBit!4441 (_2!3889 lt!135103)) #b00000000000000000000000000001000) (bvsge (currentByte!4446 (_2!3889 lt!135103)) #b00000000000000000000000000000000) (or (bvslt (currentByte!4446 (_2!3889 lt!135103)) (size!1850 (buf!2240 (_2!3889 lt!135103)))) (and (= (currentBit!4441 (_2!3889 lt!135103)) #b00000000000000000000000000000000) (= (currentByte!4446 (_2!3889 lt!135103)) (size!1850 (buf!2240 (_2!3889 lt!135103))))))))))

(assert (=> b!86341 d!27524))

(declare-fun b!86729 () Bool)

(declare-fun res!71270 () Bool)

(declare-fun e!57599 () Bool)

(assert (=> b!86729 (=> (not res!71270) (not e!57599))))

(declare-fun lt!135372 () tuple2!7330)

(assert (=> b!86729 (= res!71270 (isPrefixOf!0 thiss!1152 (_2!3889 lt!135372)))))

(declare-fun d!27526 () Bool)

(assert (=> d!27526 e!57599))

(declare-fun res!71271 () Bool)

(assert (=> d!27526 (=> (not res!71271) (not e!57599))))

(assert (=> d!27526 (= res!71271 (= (size!1850 (buf!2240 thiss!1152)) (size!1850 (buf!2240 (_2!3889 lt!135372)))))))

(declare-fun choose!16 (BitStream!3262 Bool) tuple2!7330)

(assert (=> d!27526 (= lt!135372 (choose!16 thiss!1152 lt!135104))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!27526 (validate_offset_bit!0 ((_ sign_extend 32) (size!1850 (buf!2240 thiss!1152))) ((_ sign_extend 32) (currentByte!4446 thiss!1152)) ((_ sign_extend 32) (currentBit!4441 thiss!1152)))))

(assert (=> d!27526 (= (appendBit!0 thiss!1152 lt!135104) lt!135372)))

(declare-fun b!86731 () Bool)

(declare-fun e!57598 () Bool)

(declare-fun lt!135373 () tuple2!7332)

(assert (=> b!86731 (= e!57598 (= (bitIndex!0 (size!1850 (buf!2240 (_1!3891 lt!135373))) (currentByte!4446 (_1!3891 lt!135373)) (currentBit!4441 (_1!3891 lt!135373))) (bitIndex!0 (size!1850 (buf!2240 (_2!3889 lt!135372))) (currentByte!4446 (_2!3889 lt!135372)) (currentBit!4441 (_2!3889 lt!135372)))))))

(declare-fun b!86730 () Bool)

(assert (=> b!86730 (= e!57599 e!57598)))

(declare-fun res!71273 () Bool)

(assert (=> b!86730 (=> (not res!71273) (not e!57598))))

(assert (=> b!86730 (= res!71273 (and (= (_2!3891 lt!135373) lt!135104) (= (_1!3891 lt!135373) (_2!3889 lt!135372))))))

(assert (=> b!86730 (= lt!135373 (readBitPure!0 (readerFrom!0 (_2!3889 lt!135372) (currentBit!4441 thiss!1152) (currentByte!4446 thiss!1152))))))

(declare-fun b!86728 () Bool)

(declare-fun res!71272 () Bool)

(assert (=> b!86728 (=> (not res!71272) (not e!57599))))

(declare-fun lt!135375 () (_ BitVec 64))

(declare-fun lt!135374 () (_ BitVec 64))

(assert (=> b!86728 (= res!71272 (= (bitIndex!0 (size!1850 (buf!2240 (_2!3889 lt!135372))) (currentByte!4446 (_2!3889 lt!135372)) (currentBit!4441 (_2!3889 lt!135372))) (bvadd lt!135375 lt!135374)))))

(assert (=> b!86728 (or (not (= (bvand lt!135375 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!135374 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!135375 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!135375 lt!135374) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!86728 (= lt!135374 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!86728 (= lt!135375 (bitIndex!0 (size!1850 (buf!2240 thiss!1152)) (currentByte!4446 thiss!1152) (currentBit!4441 thiss!1152)))))

(assert (= (and d!27526 res!71271) b!86728))

(assert (= (and b!86728 res!71272) b!86729))

(assert (= (and b!86729 res!71270) b!86730))

(assert (= (and b!86730 res!71273) b!86731))

(declare-fun m!132461 () Bool)

(assert (=> b!86731 m!132461))

(declare-fun m!132463 () Bool)

(assert (=> b!86731 m!132463))

(declare-fun m!132465 () Bool)

(assert (=> b!86729 m!132465))

(declare-fun m!132467 () Bool)

(assert (=> d!27526 m!132467))

(declare-fun m!132469 () Bool)

(assert (=> d!27526 m!132469))

(assert (=> b!86728 m!132463))

(assert (=> b!86728 m!132245))

(declare-fun m!132471 () Bool)

(assert (=> b!86730 m!132471))

(assert (=> b!86730 m!132471))

(declare-fun m!132473 () Bool)

(assert (=> b!86730 m!132473))

(assert (=> b!86341 d!27526))

(declare-fun d!27538 () Bool)

(assert (=> d!27538 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1850 (buf!2240 thiss!1151))) ((_ sign_extend 32) (currentByte!4446 thiss!1151)) ((_ sign_extend 32) (currentBit!4441 thiss!1151)) ((_ sign_extend 32) nBits!336)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1850 (buf!2240 thiss!1151))) ((_ sign_extend 32) (currentByte!4446 thiss!1151)) ((_ sign_extend 32) (currentBit!4441 thiss!1151))) ((_ sign_extend 32) nBits!336)))))

(declare-fun bs!6816 () Bool)

(assert (= bs!6816 d!27538))

(assert (=> bs!6816 m!132425))

(assert (=> b!86351 d!27538))

(declare-fun d!27540 () Bool)

(assert (=> d!27540 (= (invariant!0 (currentBit!4441 (_2!3890 lt!135107)) (currentByte!4446 (_2!3890 lt!135107)) (size!1850 (buf!2240 (_2!3890 lt!135107)))) (and (bvsge (currentBit!4441 (_2!3890 lt!135107)) #b00000000000000000000000000000000) (bvslt (currentBit!4441 (_2!3890 lt!135107)) #b00000000000000000000000000001000) (bvsge (currentByte!4446 (_2!3890 lt!135107)) #b00000000000000000000000000000000) (or (bvslt (currentByte!4446 (_2!3890 lt!135107)) (size!1850 (buf!2240 (_2!3890 lt!135107)))) (and (= (currentBit!4441 (_2!3890 lt!135107)) #b00000000000000000000000000000000) (= (currentByte!4446 (_2!3890 lt!135107)) (size!1850 (buf!2240 (_2!3890 lt!135107))))))))))

(assert (=> b!86353 d!27540))

(declare-fun d!27542 () Bool)

(assert (=> d!27542 (= (invariant!0 (currentBit!4441 thiss!1151) (currentByte!4446 thiss!1151) (size!1850 (buf!2240 thiss!1151))) (and (bvsge (currentBit!4441 thiss!1151) #b00000000000000000000000000000000) (bvslt (currentBit!4441 thiss!1151) #b00000000000000000000000000001000) (bvsge (currentByte!4446 thiss!1151) #b00000000000000000000000000000000) (or (bvslt (currentByte!4446 thiss!1151) (size!1850 (buf!2240 thiss!1151))) (and (= (currentBit!4441 thiss!1151) #b00000000000000000000000000000000) (= (currentByte!4446 thiss!1151) (size!1850 (buf!2240 thiss!1151)))))))))

(assert (=> b!86342 d!27542))

(declare-fun d!27544 () Bool)

(assert (=> d!27544 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1850 (buf!2240 thiss!1152))) ((_ sign_extend 32) (currentByte!4446 thiss!1152)) ((_ sign_extend 32) (currentBit!4441 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1850 (buf!2240 thiss!1152))) ((_ sign_extend 32) (currentByte!4446 thiss!1152)) ((_ sign_extend 32) (currentBit!4441 thiss!1152))) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun bs!6817 () Bool)

(assert (= bs!6817 d!27544))

(assert (=> bs!6817 m!132423))

(assert (=> b!86352 d!27544))

(declare-fun d!27546 () Bool)

(assert (=> d!27546 (= (array_inv!1696 (buf!2240 thiss!1152)) (bvsge (size!1850 (buf!2240 thiss!1152)) #b00000000000000000000000000000000))))

(assert (=> b!86349 d!27546))

(declare-fun d!27548 () Bool)

(declare-fun e!57600 () Bool)

(assert (=> d!27548 e!57600))

(declare-fun res!71274 () Bool)

(assert (=> d!27548 (=> (not res!71274) (not e!57600))))

(declare-fun lt!135379 () (_ BitVec 64))

(declare-fun lt!135377 () (_ BitVec 64))

(declare-fun lt!135381 () (_ BitVec 64))

(assert (=> d!27548 (= res!71274 (= lt!135379 (bvsub lt!135381 lt!135377)))))

(assert (=> d!27548 (or (= (bvand lt!135381 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!135377 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!135381 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!135381 lt!135377) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!27548 (= lt!135377 (remainingBits!0 ((_ sign_extend 32) (size!1850 (buf!2240 (_2!3889 lt!135103)))) ((_ sign_extend 32) (currentByte!4446 (_2!3889 lt!135103))) ((_ sign_extend 32) (currentBit!4441 (_2!3889 lt!135103)))))))

(declare-fun lt!135378 () (_ BitVec 64))

(declare-fun lt!135380 () (_ BitVec 64))

(assert (=> d!27548 (= lt!135381 (bvmul lt!135378 lt!135380))))

(assert (=> d!27548 (or (= lt!135378 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!135380 (bvsdiv (bvmul lt!135378 lt!135380) lt!135378)))))

(assert (=> d!27548 (= lt!135380 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27548 (= lt!135378 ((_ sign_extend 32) (size!1850 (buf!2240 (_2!3889 lt!135103)))))))

(assert (=> d!27548 (= lt!135379 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4446 (_2!3889 lt!135103))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4441 (_2!3889 lt!135103)))))))

(assert (=> d!27548 (invariant!0 (currentBit!4441 (_2!3889 lt!135103)) (currentByte!4446 (_2!3889 lt!135103)) (size!1850 (buf!2240 (_2!3889 lt!135103))))))

(assert (=> d!27548 (= (bitIndex!0 (size!1850 (buf!2240 (_2!3889 lt!135103))) (currentByte!4446 (_2!3889 lt!135103)) (currentBit!4441 (_2!3889 lt!135103))) lt!135379)))

(declare-fun b!86732 () Bool)

(declare-fun res!71275 () Bool)

(assert (=> b!86732 (=> (not res!71275) (not e!57600))))

(assert (=> b!86732 (= res!71275 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!135379))))

(declare-fun b!86733 () Bool)

(declare-fun lt!135376 () (_ BitVec 64))

(assert (=> b!86733 (= e!57600 (bvsle lt!135379 (bvmul lt!135376 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!86733 (or (= lt!135376 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!135376 #b0000000000000000000000000000000000000000000000000000000000001000) lt!135376)))))

(assert (=> b!86733 (= lt!135376 ((_ sign_extend 32) (size!1850 (buf!2240 (_2!3889 lt!135103)))))))

(assert (= (and d!27548 res!71274) b!86732))

(assert (= (and b!86732 res!71275) b!86733))

(declare-fun m!132475 () Bool)

(assert (=> d!27548 m!132475))

(assert (=> d!27548 m!132227))

(assert (=> b!86359 d!27548))

(declare-fun d!27550 () Bool)

(assert (=> d!27550 (= (array_inv!1696 (buf!2240 thiss!1151)) (bvsge (size!1850 (buf!2240 thiss!1151)) #b00000000000000000000000000000000))))

(assert (=> b!86350 d!27550))

(declare-fun d!27552 () Bool)

(assert (=> d!27552 (= (invariant!0 (currentBit!4441 thiss!1152) (currentByte!4446 thiss!1152) (size!1850 (buf!2240 thiss!1152))) (and (bvsge (currentBit!4441 thiss!1152) #b00000000000000000000000000000000) (bvslt (currentBit!4441 thiss!1152) #b00000000000000000000000000001000) (bvsge (currentByte!4446 thiss!1152) #b00000000000000000000000000000000) (or (bvslt (currentByte!4446 thiss!1152) (size!1850 (buf!2240 thiss!1152))) (and (= (currentBit!4441 thiss!1152) #b00000000000000000000000000000000) (= (currentByte!4446 thiss!1152) (size!1850 (buf!2240 thiss!1152)))))))))

(assert (=> b!86339 d!27552))

(push 1)

(assert (not b!86695))

(assert (not d!27512))

(assert (not b!86640))

(assert (not d!27544))

(assert (not d!27462))

(assert (not b!86549))

(assert (not b!86639))

(assert (not b!86634))

(assert (not b!86633))

(assert (not b!86729))

(assert (not d!27516))

(assert (not b!86643))

(assert (not d!27514))

(assert (not b!86731))

(assert (not b!86631))

(assert (not d!27464))

(assert (not d!27522))

(assert (not d!27538))

(assert (not d!27468))

(assert (not b!86646))

(assert (not b!86635))

(assert (not d!27510))

(assert (not d!27518))

(assert (not b!86730))

(assert (not b!86728))

(assert (not b!86632))

(assert (not b!86644))

(assert (not b!86638))

(assert (not d!27548))

(assert (not b!86697))

(assert (not d!27526))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

