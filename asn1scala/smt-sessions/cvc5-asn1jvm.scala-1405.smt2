; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38650 () Bool)

(assert start!38650)

(declare-fun b!173878 () Bool)

(declare-fun e!121328 () Bool)

(declare-fun e!121330 () Bool)

(assert (=> b!173878 (= e!121328 e!121330)))

(declare-fun res!144003 () Bool)

(assert (=> b!173878 (=> (not res!144003) (not e!121330))))

(declare-datatypes ((array!9358 0))(
  ( (array!9359 (arr!5059 (Array (_ BitVec 32) (_ BitVec 8))) (size!4129 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7366 0))(
  ( (BitStream!7367 (buf!4560 array!9358) (currentByte!8665 (_ BitVec 32)) (currentBit!8660 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!12479 0))(
  ( (Unit!12480) )
))
(declare-datatypes ((tuple2!14980 0))(
  ( (tuple2!14981 (_1!8132 Unit!12479) (_2!8132 BitStream!7366)) )
))
(declare-fun lt!268073 () tuple2!14980)

(declare-fun thiss!1187 () BitStream!7366)

(assert (=> b!173878 (= res!144003 (= (size!4129 (buf!4560 (_2!8132 lt!268073))) (size!4129 (buf!4560 thiss!1187))))))

(declare-fun nBits!340 () (_ BitVec 32))

(declare-fun v!186 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7366 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!14980)

(assert (=> b!173878 (= lt!268073 (appendBitsLSBFirstLoopTR!0 thiss!1187 v!186 nBits!340 #b00000000000000000000000000000000))))

(declare-fun b!173879 () Bool)

(declare-fun res!144001 () Bool)

(assert (=> b!173879 (=> (not res!144001) (not e!121328))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!173879 (= res!144001 (invariant!0 (currentBit!8660 thiss!1187) (currentByte!8665 thiss!1187) (size!4129 (buf!4560 thiss!1187))))))

(declare-fun lt!268071 () (_ BitVec 64))

(declare-fun e!121326 () Bool)

(declare-fun b!173880 () Bool)

(declare-fun lt!268072 () (_ BitVec 64))

(assert (=> b!173880 (= e!121326 (and (= (size!4129 (buf!4560 thiss!1187)) (size!4129 (buf!4560 (_2!8132 lt!268073)))) (let ((bdg!10253 (bvand lt!268072 #b1000000000000000000000000000000000000000000000000000000000000000))) (and (= bdg!10253 (bvand ((_ sign_extend 32) nBits!340) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= bdg!10253 (bvand lt!268071 #b1000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!173881 () Bool)

(declare-fun res!144002 () Bool)

(assert (=> b!173881 (=> (not res!144002) (not e!121328))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!173881 (= res!144002 (validate_offset_bits!1 ((_ sign_extend 32) (size!4129 (buf!4560 thiss!1187))) ((_ sign_extend 32) (currentByte!8665 thiss!1187)) ((_ sign_extend 32) (currentBit!8660 thiss!1187)) ((_ sign_extend 32) nBits!340)))))

(declare-fun res!144000 () Bool)

(assert (=> start!38650 (=> (not res!144000) (not e!121328))))

(assert (=> start!38650 (= res!144000 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000)))))

(assert (=> start!38650 e!121328))

(assert (=> start!38650 true))

(declare-fun e!121329 () Bool)

(declare-fun inv!12 (BitStream!7366) Bool)

(assert (=> start!38650 (and (inv!12 thiss!1187) e!121329)))

(declare-fun b!173882 () Bool)

(declare-fun array_inv!3870 (array!9358) Bool)

(assert (=> b!173882 (= e!121329 (array_inv!3870 (buf!4560 thiss!1187)))))

(declare-fun b!173883 () Bool)

(assert (=> b!173883 (= e!121330 e!121326)))

(declare-fun res!143999 () Bool)

(assert (=> b!173883 (=> (not res!143999) (not e!121326))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!173883 (= res!143999 (= (bitIndex!0 (size!4129 (buf!4560 (_2!8132 lt!268073))) (currentByte!8665 (_2!8132 lt!268073)) (currentBit!8660 (_2!8132 lt!268073))) lt!268071))))

(assert (=> b!173883 (= lt!268071 (bvadd lt!268072 ((_ sign_extend 32) nBits!340)))))

(assert (=> b!173883 (= lt!268072 (bitIndex!0 (size!4129 (buf!4560 thiss!1187)) (currentByte!8665 thiss!1187) (currentBit!8660 thiss!1187)))))

(assert (= (and start!38650 res!144000) b!173881))

(assert (= (and b!173881 res!144002) b!173879))

(assert (= (and b!173879 res!144001) b!173878))

(assert (= (and b!173878 res!144003) b!173883))

(assert (= (and b!173883 res!143999) b!173880))

(assert (= start!38650 b!173882))

(declare-fun m!273171 () Bool)

(assert (=> b!173878 m!273171))

(declare-fun m!273173 () Bool)

(assert (=> b!173879 m!273173))

(declare-fun m!273175 () Bool)

(assert (=> b!173881 m!273175))

(declare-fun m!273177 () Bool)

(assert (=> b!173883 m!273177))

(declare-fun m!273179 () Bool)

(assert (=> b!173883 m!273179))

(declare-fun m!273181 () Bool)

(assert (=> start!38650 m!273181))

(declare-fun m!273183 () Bool)

(assert (=> b!173882 m!273183))

(push 1)

(assert (not b!173881))

(assert (not b!173879))

(assert (not b!173878))

(assert (not start!38650))

(assert (not b!173882))

(assert (not b!173883))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!61351 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!61351 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4129 (buf!4560 thiss!1187))) ((_ sign_extend 32) (currentByte!8665 thiss!1187)) ((_ sign_extend 32) (currentBit!8660 thiss!1187)) ((_ sign_extend 32) nBits!340)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4129 (buf!4560 thiss!1187))) ((_ sign_extend 32) (currentByte!8665 thiss!1187)) ((_ sign_extend 32) (currentBit!8660 thiss!1187))) ((_ sign_extend 32) nBits!340)))))

(declare-fun bs!15286 () Bool)

(assert (= bs!15286 d!61351))

(declare-fun m!273215 () Bool)

(assert (=> bs!15286 m!273215))

(assert (=> b!173881 d!61351))

(declare-fun d!61353 () Bool)

(assert (=> d!61353 (= (inv!12 thiss!1187) (invariant!0 (currentBit!8660 thiss!1187) (currentByte!8665 thiss!1187) (size!4129 (buf!4560 thiss!1187))))))

(declare-fun bs!15287 () Bool)

(assert (= bs!15287 d!61353))

(assert (=> bs!15287 m!273173))

(assert (=> start!38650 d!61353))

(declare-fun b!173984 () Bool)

(declare-fun res!144085 () Bool)

(declare-fun lt!268339 () tuple2!14980)

(declare-fun isPrefixOf!0 (BitStream!7366 BitStream!7366) Bool)

(assert (=> b!173984 (= res!144085 (isPrefixOf!0 thiss!1187 (_2!8132 lt!268339)))))

(declare-fun e!121403 () Bool)

(assert (=> b!173984 (=> (not res!144085) (not e!121403))))

(declare-fun b!173985 () Bool)

(declare-fun e!121401 () Bool)

(declare-datatypes ((tuple2!14986 0))(
  ( (tuple2!14987 (_1!8135 BitStream!7366) (_2!8135 Bool)) )
))
(declare-fun lt!268335 () tuple2!14986)

(declare-fun lt!268370 () tuple2!14986)

(assert (=> b!173985 (= e!121401 (= (_2!8135 lt!268335) (_2!8135 lt!268370)))))

(declare-fun b!173986 () Bool)

(declare-fun e!121402 () tuple2!14980)

(declare-fun lt!268359 () tuple2!14980)

(assert (=> b!173986 (= e!121402 (tuple2!14981 (_1!8132 lt!268359) (_2!8132 lt!268359)))))

(declare-fun lt!268329 () Bool)

(assert (=> b!173986 (= lt!268329 (not (= (bvand v!186 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) #b00000000000000000000000000000000))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun appendBit!0 (BitStream!7366 Bool) tuple2!14980)

(assert (=> b!173986 (= lt!268339 (appendBit!0 thiss!1187 lt!268329))))

(declare-fun res!144083 () Bool)

(assert (=> b!173986 (= res!144083 (= (size!4129 (buf!4560 thiss!1187)) (size!4129 (buf!4560 (_2!8132 lt!268339)))))))

(assert (=> b!173986 (=> (not res!144083) (not e!121403))))

(assert (=> b!173986 e!121403))

(declare-fun lt!268355 () tuple2!14980)

(assert (=> b!173986 (= lt!268355 lt!268339)))

(assert (=> b!173986 (= lt!268359 (appendBitsLSBFirstLoopTR!0 (_2!8132 lt!268355) v!186 nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!268348 () Unit!12479)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7366 BitStream!7366 BitStream!7366) Unit!12479)

(assert (=> b!173986 (= lt!268348 (lemmaIsPrefixTransitive!0 thiss!1187 (_2!8132 lt!268355) (_2!8132 lt!268359)))))

(declare-fun call!2881 () Bool)

(assert (=> b!173986 call!2881))

(declare-fun lt!268347 () Unit!12479)

(assert (=> b!173986 (= lt!268347 lt!268348)))

(assert (=> b!173986 (invariant!0 (currentBit!8660 thiss!1187) (currentByte!8665 thiss!1187) (size!4129 (buf!4560 (_2!8132 lt!268355))))))

(declare-fun lt!268367 () BitStream!7366)

(assert (=> b!173986 (= lt!268367 (BitStream!7367 (buf!4560 (_2!8132 lt!268355)) (currentByte!8665 thiss!1187) (currentBit!8660 thiss!1187)))))

(assert (=> b!173986 (invariant!0 (currentBit!8660 lt!268367) (currentByte!8665 lt!268367) (size!4129 (buf!4560 (_2!8132 lt!268359))))))

(declare-fun lt!268334 () BitStream!7366)

(assert (=> b!173986 (= lt!268334 (BitStream!7367 (buf!4560 (_2!8132 lt!268359)) (currentByte!8665 lt!268367) (currentBit!8660 lt!268367)))))

(declare-fun readBitPure!0 (BitStream!7366) tuple2!14986)

(assert (=> b!173986 (= lt!268335 (readBitPure!0 lt!268367))))

(assert (=> b!173986 (= lt!268370 (readBitPure!0 lt!268334))))

(declare-fun lt!268323 () Unit!12479)

(declare-fun readBitPrefixLemma!0 (BitStream!7366 BitStream!7366) Unit!12479)

(assert (=> b!173986 (= lt!268323 (readBitPrefixLemma!0 lt!268367 (_2!8132 lt!268359)))))

(declare-fun res!144093 () Bool)

(assert (=> b!173986 (= res!144093 (= (bitIndex!0 (size!4129 (buf!4560 (_1!8135 lt!268335))) (currentByte!8665 (_1!8135 lt!268335)) (currentBit!8660 (_1!8135 lt!268335))) (bitIndex!0 (size!4129 (buf!4560 (_1!8135 lt!268370))) (currentByte!8665 (_1!8135 lt!268370)) (currentBit!8660 (_1!8135 lt!268370)))))))

(assert (=> b!173986 (=> (not res!144093) (not e!121401))))

(assert (=> b!173986 e!121401))

(declare-fun lt!268327 () Unit!12479)

(assert (=> b!173986 (= lt!268327 lt!268323)))

(declare-datatypes ((tuple2!14988 0))(
  ( (tuple2!14989 (_1!8136 BitStream!7366) (_2!8136 BitStream!7366)) )
))
(declare-fun lt!268361 () tuple2!14988)

(declare-fun reader!0 (BitStream!7366 BitStream!7366) tuple2!14988)

(assert (=> b!173986 (= lt!268361 (reader!0 thiss!1187 (_2!8132 lt!268359)))))

(declare-fun lt!268346 () tuple2!14988)

(assert (=> b!173986 (= lt!268346 (reader!0 (_2!8132 lt!268355) (_2!8132 lt!268359)))))

(declare-fun lt!268326 () tuple2!14986)

(assert (=> b!173986 (= lt!268326 (readBitPure!0 (_1!8136 lt!268361)))))

(assert (=> b!173986 (= (_2!8135 lt!268326) lt!268329)))

(declare-fun lt!268316 () Unit!12479)

(declare-fun Unit!12485 () Unit!12479)

(assert (=> b!173986 (= lt!268316 Unit!12485)))

(declare-fun lt!268318 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!173986 (= lt!268318 (bvand v!186 (onesLSBLong!0 #b00000000000000000000000000000000)))))

(declare-fun lt!268332 () (_ BitVec 64))

(assert (=> b!173986 (= lt!268332 ((_ sign_extend 32) (bvsub nBits!340 #b00000000000000000000000000000000)))))

(declare-fun lt!268317 () Unit!12479)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7366 array!9358 (_ BitVec 64)) Unit!12479)

(assert (=> b!173986 (= lt!268317 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1187 (buf!4560 (_2!8132 lt!268359)) lt!268332))))

(assert (=> b!173986 (validate_offset_bits!1 ((_ sign_extend 32) (size!4129 (buf!4560 (_2!8132 lt!268359)))) ((_ sign_extend 32) (currentByte!8665 thiss!1187)) ((_ sign_extend 32) (currentBit!8660 thiss!1187)) lt!268332)))

(declare-fun lt!268338 () Unit!12479)

(assert (=> b!173986 (= lt!268338 lt!268317)))

(declare-datatypes ((tuple2!14990 0))(
  ( (tuple2!14991 (_1!8137 BitStream!7366) (_2!8137 (_ BitVec 64))) )
))
(declare-fun lt!268345 () tuple2!14990)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7366 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!14990)

(assert (=> b!173986 (= lt!268345 (readNBitsLSBFirstsLoopPure!0 (_1!8136 lt!268361) nBits!340 #b00000000000000000000000000000000 lt!268318))))

(declare-fun lt!268369 () (_ BitVec 64))

(assert (=> b!173986 (= lt!268369 ((_ sign_extend 32) (bvsub (bvsub nBits!340 #b00000000000000000000000000000000) #b00000000000000000000000000000001)))))

(declare-fun lt!268357 () Unit!12479)

(assert (=> b!173986 (= lt!268357 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8132 lt!268355) (buf!4560 (_2!8132 lt!268359)) lt!268369))))

(assert (=> b!173986 (validate_offset_bits!1 ((_ sign_extend 32) (size!4129 (buf!4560 (_2!8132 lt!268359)))) ((_ sign_extend 32) (currentByte!8665 (_2!8132 lt!268355))) ((_ sign_extend 32) (currentBit!8660 (_2!8132 lt!268355))) lt!268369)))

(declare-fun lt!268341 () Unit!12479)

(assert (=> b!173986 (= lt!268341 lt!268357)))

(declare-fun lt!268322 () tuple2!14990)

(assert (=> b!173986 (= lt!268322 (readNBitsLSBFirstsLoopPure!0 (_1!8136 lt!268346) nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!268318 (ite (_2!8135 lt!268326) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) #b00000000000000000000000000000000)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!268337 () tuple2!14990)

(assert (=> b!173986 (= lt!268337 (readNBitsLSBFirstsLoopPure!0 (_1!8136 lt!268361) nBits!340 #b00000000000000000000000000000000 lt!268318))))

(declare-fun c!9160 () Bool)

(assert (=> b!173986 (= c!9160 (_2!8135 (readBitPure!0 (_1!8136 lt!268361))))))

(declare-fun lt!268320 () tuple2!14990)

(declare-fun e!121398 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!7366 (_ BitVec 64)) BitStream!7366)

(assert (=> b!173986 (= lt!268320 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8136 lt!268361) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!268318 e!121398)))))

(declare-fun lt!268350 () Unit!12479)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7366 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!12479)

(assert (=> b!173986 (= lt!268350 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8136 lt!268361) nBits!340 #b00000000000000000000000000000000 lt!268318))))

(assert (=> b!173986 (and (= (_2!8137 lt!268337) (_2!8137 lt!268320)) (= (_1!8137 lt!268337) (_1!8137 lt!268320)))))

(declare-fun lt!268349 () Unit!12479)

(assert (=> b!173986 (= lt!268349 lt!268350)))

(assert (=> b!173986 (= (_1!8136 lt!268361) (withMovedBitIndex!0 (_2!8136 lt!268361) (bvsub (bitIndex!0 (size!4129 (buf!4560 thiss!1187)) (currentByte!8665 thiss!1187) (currentBit!8660 thiss!1187)) (bitIndex!0 (size!4129 (buf!4560 (_2!8132 lt!268359))) (currentByte!8665 (_2!8132 lt!268359)) (currentBit!8660 (_2!8132 lt!268359))))))))

(declare-fun lt!268331 () Unit!12479)

(declare-fun Unit!12486 () Unit!12479)

(assert (=> b!173986 (= lt!268331 Unit!12486)))

(assert (=> b!173986 (= (_1!8136 lt!268346) (withMovedBitIndex!0 (_2!8136 lt!268346) (bvsub (bitIndex!0 (size!4129 (buf!4560 (_2!8132 lt!268355))) (currentByte!8665 (_2!8132 lt!268355)) (currentBit!8660 (_2!8132 lt!268355))) (bitIndex!0 (size!4129 (buf!4560 (_2!8132 lt!268359))) (currentByte!8665 (_2!8132 lt!268359)) (currentBit!8660 (_2!8132 lt!268359))))))))

(declare-fun lt!268371 () Unit!12479)

(declare-fun Unit!12487 () Unit!12479)

(assert (=> b!173986 (= lt!268371 Unit!12487)))

(assert (=> b!173986 (= (bitIndex!0 (size!4129 (buf!4560 thiss!1187)) (currentByte!8665 thiss!1187) (currentBit!8660 thiss!1187)) (bvsub (bitIndex!0 (size!4129 (buf!4560 (_2!8132 lt!268355))) (currentByte!8665 (_2!8132 lt!268355)) (currentBit!8660 (_2!8132 lt!268355))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!268366 () Unit!12479)

(declare-fun Unit!12488 () Unit!12479)

(assert (=> b!173986 (= lt!268366 Unit!12488)))

(assert (=> b!173986 (= (_2!8137 lt!268345) (_2!8137 lt!268322))))

(declare-fun lt!268368 () Unit!12479)

(declare-fun Unit!12489 () Unit!12479)

(assert (=> b!173986 (= lt!268368 Unit!12489)))

(assert (=> b!173986 (invariant!0 (currentBit!8660 (_2!8132 lt!268359)) (currentByte!8665 (_2!8132 lt!268359)) (size!4129 (buf!4560 (_2!8132 lt!268359))))))

(declare-fun lt!268352 () Unit!12479)

(declare-fun Unit!12490 () Unit!12479)

(assert (=> b!173986 (= lt!268352 Unit!12490)))

(assert (=> b!173986 (= (size!4129 (buf!4560 thiss!1187)) (size!4129 (buf!4560 (_2!8132 lt!268359))))))

(declare-fun lt!268328 () Unit!12479)

(declare-fun Unit!12491 () Unit!12479)

(assert (=> b!173986 (= lt!268328 Unit!12491)))

(assert (=> b!173986 (= (bitIndex!0 (size!4129 (buf!4560 (_2!8132 lt!268359))) (currentByte!8665 (_2!8132 lt!268359)) (currentBit!8660 (_2!8132 lt!268359))) (bvsub (bvadd (bitIndex!0 (size!4129 (buf!4560 thiss!1187)) (currentByte!8665 thiss!1187) (currentBit!8660 thiss!1187)) ((_ sign_extend 32) nBits!340)) ((_ sign_extend 32) #b00000000000000000000000000000000)))))

(declare-fun lt!268344 () Unit!12479)

(declare-fun Unit!12492 () Unit!12479)

(assert (=> b!173986 (= lt!268344 Unit!12492)))

(declare-fun lt!268351 () Unit!12479)

(declare-fun Unit!12493 () Unit!12479)

(assert (=> b!173986 (= lt!268351 Unit!12493)))

(declare-fun lt!268365 () tuple2!14988)

(assert (=> b!173986 (= lt!268365 (reader!0 thiss!1187 (_2!8132 lt!268359)))))

(declare-fun lt!268330 () (_ BitVec 64))

(assert (=> b!173986 (= lt!268330 ((_ sign_extend 32) (bvsub nBits!340 #b00000000000000000000000000000000)))))

(declare-fun lt!268362 () Unit!12479)

(assert (=> b!173986 (= lt!268362 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1187 (buf!4560 (_2!8132 lt!268359)) lt!268330))))

(assert (=> b!173986 (validate_offset_bits!1 ((_ sign_extend 32) (size!4129 (buf!4560 (_2!8132 lt!268359)))) ((_ sign_extend 32) (currentByte!8665 thiss!1187)) ((_ sign_extend 32) (currentBit!8660 thiss!1187)) lt!268330)))

(declare-fun lt!268336 () Unit!12479)

(assert (=> b!173986 (= lt!268336 lt!268362)))

(declare-fun lt!268358 () tuple2!14990)

(assert (=> b!173986 (= lt!268358 (readNBitsLSBFirstsLoopPure!0 (_1!8136 lt!268365) nBits!340 #b00000000000000000000000000000000 (bvand v!186 (onesLSBLong!0 #b00000000000000000000000000000000))))))

(declare-fun res!144090 () Bool)

(assert (=> b!173986 (= res!144090 (= (_2!8137 lt!268358) (bvand v!186 (onesLSBLong!0 nBits!340))))))

(declare-fun e!121404 () Bool)

(assert (=> b!173986 (=> (not res!144090) (not e!121404))))

(assert (=> b!173986 e!121404))

(declare-fun lt!268333 () Unit!12479)

(declare-fun Unit!12494 () Unit!12479)

(assert (=> b!173986 (= lt!268333 Unit!12494)))

(declare-fun c!9159 () Bool)

(declare-fun bm!2878 () Bool)

(assert (=> bm!2878 (= call!2881 (isPrefixOf!0 thiss!1187 (ite c!9159 thiss!1187 (_2!8132 lt!268359))))))

(declare-fun b!173988 () Bool)

(declare-fun e!121399 () Bool)

(declare-fun lt!268354 () (_ BitVec 64))

(assert (=> b!173988 (= e!121399 (validate_offset_bits!1 ((_ sign_extend 32) (size!4129 (buf!4560 thiss!1187))) ((_ sign_extend 32) (currentByte!8665 thiss!1187)) ((_ sign_extend 32) (currentBit!8660 thiss!1187)) lt!268354))))

(declare-fun b!173989 () Bool)

(declare-fun res!144089 () Bool)

(assert (=> b!173989 (= res!144089 (= (bitIndex!0 (size!4129 (buf!4560 (_2!8132 lt!268339))) (currentByte!8665 (_2!8132 lt!268339)) (currentBit!8660 (_2!8132 lt!268339))) (bvadd (bitIndex!0 (size!4129 (buf!4560 thiss!1187)) (currentByte!8665 thiss!1187) (currentBit!8660 thiss!1187)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!173989 (=> (not res!144089) (not e!121403))))

(declare-fun b!173990 () Bool)

(declare-fun e!121405 () Bool)

(declare-fun lt!268321 () tuple2!14990)

(declare-fun lt!268353 () tuple2!14988)

(assert (=> b!173990 (= e!121405 (= (_1!8137 lt!268321) (_2!8136 lt!268353)))))

(declare-fun b!173991 () Bool)

(declare-fun res!144084 () Bool)

(declare-fun e!121397 () Bool)

(assert (=> b!173991 (=> (not res!144084) (not e!121397))))

(declare-fun lt!268342 () tuple2!14980)

(assert (=> b!173991 (= res!144084 (= (size!4129 (buf!4560 thiss!1187)) (size!4129 (buf!4560 (_2!8132 lt!268342)))))))

(declare-fun b!173992 () Bool)

(declare-fun e!121400 () Bool)

(declare-fun lt!268325 () tuple2!14986)

(assert (=> b!173992 (= e!121400 (= (bitIndex!0 (size!4129 (buf!4560 (_1!8135 lt!268325))) (currentByte!8665 (_1!8135 lt!268325)) (currentBit!8660 (_1!8135 lt!268325))) (bitIndex!0 (size!4129 (buf!4560 (_2!8132 lt!268339))) (currentByte!8665 (_2!8132 lt!268339)) (currentBit!8660 (_2!8132 lt!268339)))))))

(declare-fun b!173993 () Bool)

(declare-fun readerFrom!0 (BitStream!7366 (_ BitVec 32) (_ BitVec 32)) BitStream!7366)

(assert (=> b!173993 (= lt!268325 (readBitPure!0 (readerFrom!0 (_2!8132 lt!268339) (currentBit!8660 thiss!1187) (currentByte!8665 thiss!1187))))))

(declare-fun res!144088 () Bool)

(assert (=> b!173993 (= res!144088 (and (= (_2!8135 lt!268325) lt!268329) (= (_1!8135 lt!268325) (_2!8132 lt!268339))))))

(assert (=> b!173993 (=> (not res!144088) (not e!121400))))

(assert (=> b!173993 (= e!121403 e!121400)))

(declare-fun b!173994 () Bool)

(assert (=> b!173994 (= e!121404 (= (_1!8137 lt!268358) (_2!8136 lt!268365)))))

(declare-fun b!173995 () Bool)

(assert (=> b!173995 (= e!121398 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!173987 () Bool)

(declare-fun res!144091 () Bool)

(assert (=> b!173987 (=> (not res!144091) (not e!121397))))

(assert (=> b!173987 (= res!144091 (isPrefixOf!0 thiss!1187 (_2!8132 lt!268342)))))

(declare-fun d!61355 () Bool)

(assert (=> d!61355 e!121397))

(declare-fun res!144086 () Bool)

(assert (=> d!61355 (=> (not res!144086) (not e!121397))))

(assert (=> d!61355 (= res!144086 (invariant!0 (currentBit!8660 (_2!8132 lt!268342)) (currentByte!8665 (_2!8132 lt!268342)) (size!4129 (buf!4560 (_2!8132 lt!268342)))))))

(assert (=> d!61355 (= lt!268342 e!121402)))

(assert (=> d!61355 (= c!9159 (= #b00000000000000000000000000000000 nBits!340))))

(assert (=> d!61355 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000))))

(assert (=> d!61355 (= (appendBitsLSBFirstLoopTR!0 thiss!1187 v!186 nBits!340 #b00000000000000000000000000000000) lt!268342)))

(declare-fun b!173996 () Bool)

(assert (=> b!173996 (= e!121398 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) #b00000000000000000000000000000000)))))

(declare-fun b!173997 () Bool)

(assert (=> b!173997 (= e!121397 e!121405)))

(declare-fun res!144092 () Bool)

(assert (=> b!173997 (=> (not res!144092) (not e!121405))))

(assert (=> b!173997 (= res!144092 (= (_2!8137 lt!268321) (bvand v!186 (onesLSBLong!0 nBits!340))))))

(assert (=> b!173997 (= lt!268321 (readNBitsLSBFirstsLoopPure!0 (_1!8136 lt!268353) nBits!340 #b00000000000000000000000000000000 (bvand v!186 (onesLSBLong!0 #b00000000000000000000000000000000))))))

(declare-fun lt!268319 () Unit!12479)

(declare-fun lt!268364 () Unit!12479)

(assert (=> b!173997 (= lt!268319 lt!268364)))

(assert (=> b!173997 (validate_offset_bits!1 ((_ sign_extend 32) (size!4129 (buf!4560 (_2!8132 lt!268342)))) ((_ sign_extend 32) (currentByte!8665 thiss!1187)) ((_ sign_extend 32) (currentBit!8660 thiss!1187)) lt!268354)))

(assert (=> b!173997 (= lt!268364 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1187 (buf!4560 (_2!8132 lt!268342)) lt!268354))))

(assert (=> b!173997 e!121399))

(declare-fun res!144082 () Bool)

(assert (=> b!173997 (=> (not res!144082) (not e!121399))))

(assert (=> b!173997 (= res!144082 (and (= (size!4129 (buf!4560 thiss!1187)) (size!4129 (buf!4560 (_2!8132 lt!268342)))) (bvsge lt!268354 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!173997 (= lt!268354 ((_ sign_extend 32) (bvsub nBits!340 #b00000000000000000000000000000000)))))

(assert (=> b!173997 (or (= (bvand nBits!340 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!340 #b10000000000000000000000000000000) (bvand (bvsub nBits!340 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!173997 (= lt!268353 (reader!0 thiss!1187 (_2!8132 lt!268342)))))

(declare-fun b!173998 () Bool)

(declare-fun res!144087 () Bool)

(assert (=> b!173998 (=> (not res!144087) (not e!121397))))

(declare-fun lt!268324 () (_ BitVec 64))

(declare-fun lt!268360 () (_ BitVec 64))

(assert (=> b!173998 (= res!144087 (= (bitIndex!0 (size!4129 (buf!4560 (_2!8132 lt!268342))) (currentByte!8665 (_2!8132 lt!268342)) (currentBit!8660 (_2!8132 lt!268342))) (bvsub lt!268360 lt!268324)))))

(assert (=> b!173998 (or (= (bvand lt!268360 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!268324 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!268360 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!268360 lt!268324) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!173998 (= lt!268324 ((_ sign_extend 32) #b00000000000000000000000000000000))))

(declare-fun lt!268340 () (_ BitVec 64))

(declare-fun lt!268356 () (_ BitVec 64))

(assert (=> b!173998 (= lt!268360 (bvadd lt!268340 lt!268356))))

(assert (=> b!173998 (or (not (= (bvand lt!268340 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!268356 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!268340 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!268340 lt!268356) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!173998 (= lt!268356 ((_ sign_extend 32) nBits!340))))

(assert (=> b!173998 (= lt!268340 (bitIndex!0 (size!4129 (buf!4560 thiss!1187)) (currentByte!8665 thiss!1187) (currentBit!8660 thiss!1187)))))

(declare-fun b!173999 () Bool)

(declare-fun Unit!12497 () Unit!12479)

(assert (=> b!173999 (= e!121402 (tuple2!14981 Unit!12497 thiss!1187))))

(declare-fun lt!268343 () Unit!12479)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7366) Unit!12479)

(assert (=> b!173999 (= lt!268343 (lemmaIsPrefixRefl!0 thiss!1187))))

(assert (=> b!173999 call!2881))

(declare-fun lt!268363 () Unit!12479)

(assert (=> b!173999 (= lt!268363 lt!268343)))

(assert (= (and d!61355 c!9159) b!173999))

(assert (= (and d!61355 (not c!9159)) b!173986))

(assert (= (and b!173986 res!144083) b!173989))

(assert (= (and b!173989 res!144089) b!173984))

(assert (= (and b!173984 res!144085) b!173993))

(assert (= (and b!173993 res!144088) b!173992))

(assert (= (and b!173986 res!144093) b!173985))

(assert (= (and b!173986 c!9160) b!173996))

(assert (= (and b!173986 (not c!9160)) b!173995))

(assert (= (and b!173986 res!144090) b!173994))

(assert (= (or b!173999 b!173986) bm!2878))

(assert (= (and d!61355 res!144086) b!173991))

(assert (= (and b!173991 res!144084) b!173998))

(assert (= (and b!173998 res!144087) b!173987))

(assert (= (and b!173987 res!144091) b!173997))

(assert (= (and b!173997 res!144082) b!173988))

(assert (= (and b!173997 res!144092) b!173990))

(declare-fun m!273217 () Bool)

(assert (=> d!61355 m!273217))

(declare-fun m!273219 () Bool)

(assert (=> b!173984 m!273219))

(declare-fun m!273221 () Bool)

(assert (=> b!173998 m!273221))

(assert (=> b!173998 m!273179))

(declare-fun m!273223 () Bool)

(assert (=> bm!2878 m!273223))

(declare-fun m!273225 () Bool)

(assert (=> b!173986 m!273225))

(declare-fun m!273227 () Bool)

(assert (=> b!173986 m!273227))

(declare-fun m!273229 () Bool)

(assert (=> b!173986 m!273229))

(declare-fun m!273231 () Bool)

(assert (=> b!173986 m!273231))

(declare-fun m!273233 () Bool)

(assert (=> b!173986 m!273233))

(declare-fun m!273235 () Bool)

(assert (=> b!173986 m!273235))

(declare-fun m!273237 () Bool)

(assert (=> b!173986 m!273237))

(declare-fun m!273239 () Bool)

(assert (=> b!173986 m!273239))

(declare-fun m!273241 () Bool)

(assert (=> b!173986 m!273241))

(declare-fun m!273243 () Bool)

(assert (=> b!173986 m!273243))

(declare-fun m!273245 () Bool)

(assert (=> b!173986 m!273245))

(assert (=> b!173986 m!273179))

(declare-fun m!273247 () Bool)

(assert (=> b!173986 m!273247))

(declare-fun m!273249 () Bool)

(assert (=> b!173986 m!273249))

(declare-fun m!273251 () Bool)

(assert (=> b!173986 m!273251))

(declare-fun m!273253 () Bool)

(assert (=> b!173986 m!273253))

(declare-fun m!273255 () Bool)

(assert (=> b!173986 m!273255))

(declare-fun m!273257 () Bool)

(assert (=> b!173986 m!273257))

(declare-fun m!273259 () Bool)

(assert (=> b!173986 m!273259))

(declare-fun m!273261 () Bool)

(assert (=> b!173986 m!273261))

(declare-fun m!273263 () Bool)

(assert (=> b!173986 m!273263))

(assert (=> b!173986 m!273229))

(declare-fun m!273265 () Bool)

(assert (=> b!173986 m!273265))

(declare-fun m!273267 () Bool)

(assert (=> b!173986 m!273267))

(declare-fun m!273269 () Bool)

(assert (=> b!173986 m!273269))

(declare-fun m!273271 () Bool)

(assert (=> b!173986 m!273271))

(declare-fun m!273273 () Bool)

(assert (=> b!173986 m!273273))

(declare-fun m!273275 () Bool)

(assert (=> b!173986 m!273275))

(declare-fun m!273277 () Bool)

(assert (=> b!173986 m!273277))

(declare-fun m!273279 () Bool)

(assert (=> b!173986 m!273279))

(declare-fun m!273281 () Bool)

(assert (=> b!173986 m!273281))

(declare-fun m!273283 () Bool)

(assert (=> b!173986 m!273283))

(declare-fun m!273285 () Bool)

(assert (=> b!173986 m!273285))

(declare-fun m!273287 () Bool)

(assert (=> b!173986 m!273287))

(declare-fun m!273289 () Bool)

(assert (=> b!173993 m!273289))

(assert (=> b!173993 m!273289))

(declare-fun m!273291 () Bool)

(assert (=> b!173993 m!273291))

(declare-fun m!273293 () Bool)

(assert (=> b!173987 m!273293))

(declare-fun m!273295 () Bool)

(assert (=> b!173992 m!273295))

(declare-fun m!273297 () Bool)

(assert (=> b!173992 m!273297))

(declare-fun m!273299 () Bool)

(assert (=> b!173997 m!273299))

(declare-fun m!273301 () Bool)

(assert (=> b!173997 m!273301))

(declare-fun m!273303 () Bool)

(assert (=> b!173997 m!273303))

(assert (=> b!173997 m!273269))

(assert (=> b!173997 m!273273))

(declare-fun m!273305 () Bool)

(assert (=> b!173997 m!273305))

(declare-fun m!273307 () Bool)

(assert (=> b!173999 m!273307))

(declare-fun m!273309 () Bool)

(assert (=> b!173988 m!273309))

(assert (=> b!173989 m!273297))

(assert (=> b!173989 m!273179))

(assert (=> b!173878 d!61355))

(declare-fun d!61361 () Bool)

(assert (=> d!61361 (= (invariant!0 (currentBit!8660 thiss!1187) (currentByte!8665 thiss!1187) (size!4129 (buf!4560 thiss!1187))) (and (bvsge (currentBit!8660 thiss!1187) #b00000000000000000000000000000000) (bvslt (currentBit!8660 thiss!1187) #b00000000000000000000000000001000) (bvsge (currentByte!8665 thiss!1187) #b00000000000000000000000000000000) (or (bvslt (currentByte!8665 thiss!1187) (size!4129 (buf!4560 thiss!1187))) (and (= (currentBit!8660 thiss!1187) #b00000000000000000000000000000000) (= (currentByte!8665 thiss!1187) (size!4129 (buf!4560 thiss!1187)))))))))

(assert (=> b!173879 d!61361))

(declare-fun d!61363 () Bool)

(assert (=> d!61363 (= (array_inv!3870 (buf!4560 thiss!1187)) (bvsge (size!4129 (buf!4560 thiss!1187)) #b00000000000000000000000000000000))))

(assert (=> b!173882 d!61363))

(declare-fun d!61365 () Bool)

(declare-fun e!121417 () Bool)

(assert (=> d!61365 e!121417))

(declare-fun res!144110 () Bool)

(assert (=> d!61365 (=> (not res!144110) (not e!121417))))

(declare-fun lt!268442 () (_ BitVec 64))

(declare-fun lt!268440 () (_ BitVec 64))

(declare-fun lt!268445 () (_ BitVec 64))

(assert (=> d!61365 (= res!144110 (= lt!268442 (bvsub lt!268445 lt!268440)))))

(assert (=> d!61365 (or (= (bvand lt!268445 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!268440 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!268445 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!268445 lt!268440) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!61365 (= lt!268440 (remainingBits!0 ((_ sign_extend 32) (size!4129 (buf!4560 (_2!8132 lt!268073)))) ((_ sign_extend 32) (currentByte!8665 (_2!8132 lt!268073))) ((_ sign_extend 32) (currentBit!8660 (_2!8132 lt!268073)))))))

(declare-fun lt!268444 () (_ BitVec 64))

(declare-fun lt!268441 () (_ BitVec 64))

(assert (=> d!61365 (= lt!268445 (bvmul lt!268444 lt!268441))))

(assert (=> d!61365 (or (= lt!268444 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!268441 (bvsdiv (bvmul lt!268444 lt!268441) lt!268444)))))

(assert (=> d!61365 (= lt!268441 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!61365 (= lt!268444 ((_ sign_extend 32) (size!4129 (buf!4560 (_2!8132 lt!268073)))))))

(assert (=> d!61365 (= lt!268442 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8665 (_2!8132 lt!268073))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8660 (_2!8132 lt!268073)))))))

(assert (=> d!61365 (invariant!0 (currentBit!8660 (_2!8132 lt!268073)) (currentByte!8665 (_2!8132 lt!268073)) (size!4129 (buf!4560 (_2!8132 lt!268073))))))

(assert (=> d!61365 (= (bitIndex!0 (size!4129 (buf!4560 (_2!8132 lt!268073))) (currentByte!8665 (_2!8132 lt!268073)) (currentBit!8660 (_2!8132 lt!268073))) lt!268442)))

(declare-fun b!174020 () Bool)

(declare-fun res!144111 () Bool)

(assert (=> b!174020 (=> (not res!144111) (not e!121417))))

(assert (=> b!174020 (= res!144111 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!268442))))

(declare-fun b!174021 () Bool)

(declare-fun lt!268443 () (_ BitVec 64))

(assert (=> b!174021 (= e!121417 (bvsle lt!268442 (bvmul lt!268443 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!174021 (or (= lt!268443 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!268443 #b0000000000000000000000000000000000000000000000000000000000001000) lt!268443)))))

(assert (=> b!174021 (= lt!268443 ((_ sign_extend 32) (size!4129 (buf!4560 (_2!8132 lt!268073)))))))

(assert (= (and d!61365 res!144110) b!174020))

(assert (= (and b!174020 res!144111) b!174021))

(declare-fun m!273405 () Bool)

(assert (=> d!61365 m!273405))

(declare-fun m!273407 () Bool)

(assert (=> d!61365 m!273407))

(assert (=> b!173883 d!61365))

(declare-fun d!61371 () Bool)

(declare-fun e!121418 () Bool)

(assert (=> d!61371 e!121418))

(declare-fun res!144112 () Bool)

(assert (=> d!61371 (=> (not res!144112) (not e!121418))))

(declare-fun lt!268448 () (_ BitVec 64))

(declare-fun lt!268446 () (_ BitVec 64))

(declare-fun lt!268451 () (_ BitVec 64))

(assert (=> d!61371 (= res!144112 (= lt!268448 (bvsub lt!268451 lt!268446)))))

(assert (=> d!61371 (or (= (bvand lt!268451 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!268446 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!268451 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!268451 lt!268446) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!61371 (= lt!268446 (remainingBits!0 ((_ sign_extend 32) (size!4129 (buf!4560 thiss!1187))) ((_ sign_extend 32) (currentByte!8665 thiss!1187)) ((_ sign_extend 32) (currentBit!8660 thiss!1187))))))

(declare-fun lt!268450 () (_ BitVec 64))

(declare-fun lt!268447 () (_ BitVec 64))

(assert (=> d!61371 (= lt!268451 (bvmul lt!268450 lt!268447))))

(assert (=> d!61371 (or (= lt!268450 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!268447 (bvsdiv (bvmul lt!268450 lt!268447) lt!268450)))))

(assert (=> d!61371 (= lt!268447 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!61371 (= lt!268450 ((_ sign_extend 32) (size!4129 (buf!4560 thiss!1187))))))

(assert (=> d!61371 (= lt!268448 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8665 thiss!1187)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8660 thiss!1187))))))

(assert (=> d!61371 (invariant!0 (currentBit!8660 thiss!1187) (currentByte!8665 thiss!1187) (size!4129 (buf!4560 thiss!1187)))))

(assert (=> d!61371 (= (bitIndex!0 (size!4129 (buf!4560 thiss!1187)) (currentByte!8665 thiss!1187) (currentBit!8660 thiss!1187)) lt!268448)))

(declare-fun b!174022 () Bool)

(declare-fun res!144113 () Bool)

(assert (=> b!174022 (=> (not res!144113) (not e!121418))))

(assert (=> b!174022 (= res!144113 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!268448))))

(declare-fun b!174023 () Bool)

(declare-fun lt!268449 () (_ BitVec 64))

(assert (=> b!174023 (= e!121418 (bvsle lt!268448 (bvmul lt!268449 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!174023 (or (= lt!268449 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!268449 #b0000000000000000000000000000000000000000000000000000000000001000) lt!268449)))))

(assert (=> b!174023 (= lt!268449 ((_ sign_extend 32) (size!4129 (buf!4560 thiss!1187))))))

(assert (= (and d!61371 res!144112) b!174022))

(assert (= (and b!174022 res!144113) b!174023))

(assert (=> d!61371 m!273215))

(assert (=> d!61371 m!273173))

(assert (=> b!173883 d!61371))

(push 1)

(assert (not b!173989))

(assert (not bm!2878))

(assert (not b!173999))

(assert (not d!61353))

(assert (not b!173992))

(assert (not d!61371))

(assert (not b!173997))

(assert (not b!173986))

(assert (not b!173993))

(assert (not b!173988))

(assert (not b!173984))

(assert (not b!173987))

(assert (not b!173998))

(assert (not d!61355))

(assert (not d!61351))

(assert (not d!61365))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

