; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43422 () Bool)

(assert start!43422)

(declare-fun b!205031 () Bool)

(declare-fun e!140327 () Bool)

(declare-fun e!140334 () Bool)

(assert (=> b!205031 (= e!140327 (not e!140334))))

(declare-fun res!171846 () Bool)

(assert (=> b!205031 (=> res!171846 e!140334)))

(declare-fun lt!320288 () (_ BitVec 64))

(declare-fun lt!320294 () (_ BitVec 64))

(assert (=> b!205031 (= res!171846 (not (= lt!320288 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!320294))))))

(declare-datatypes ((array!10355 0))(
  ( (array!10356 (arr!5482 (Array (_ BitVec 32) (_ BitVec 8))) (size!4552 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8212 0))(
  ( (BitStream!8213 (buf!5057 array!10355) (currentByte!9554 (_ BitVec 32)) (currentBit!9549 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!14628 0))(
  ( (Unit!14629) )
))
(declare-datatypes ((tuple2!17534 0))(
  ( (tuple2!17535 (_1!9419 Unit!14628) (_2!9419 BitStream!8212)) )
))
(declare-fun lt!320287 () tuple2!17534)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!205031 (= lt!320288 (bitIndex!0 (size!4552 (buf!5057 (_2!9419 lt!320287))) (currentByte!9554 (_2!9419 lt!320287)) (currentBit!9549 (_2!9419 lt!320287))))))

(declare-fun thiss!1204 () BitStream!8212)

(assert (=> b!205031 (= lt!320294 (bitIndex!0 (size!4552 (buf!5057 thiss!1204)) (currentByte!9554 thiss!1204) (currentBit!9549 thiss!1204)))))

(declare-fun e!140330 () Bool)

(assert (=> b!205031 e!140330))

(declare-fun res!171845 () Bool)

(assert (=> b!205031 (=> (not res!171845) (not e!140330))))

(assert (=> b!205031 (= res!171845 (= (size!4552 (buf!5057 thiss!1204)) (size!4552 (buf!5057 (_2!9419 lt!320287)))))))

(declare-fun lt!320290 () Bool)

(declare-fun appendBit!0 (BitStream!8212 Bool) tuple2!17534)

(assert (=> b!205031 (= lt!320287 (appendBit!0 thiss!1204 lt!320290))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!205031 (= lt!320290 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!205032 () Bool)

(declare-fun e!140331 () Bool)

(declare-fun e!140329 () Bool)

(assert (=> b!205032 (= e!140331 e!140329)))

(declare-fun res!171852 () Bool)

(assert (=> b!205032 (=> res!171852 e!140329)))

(declare-fun lt!320285 () tuple2!17534)

(assert (=> b!205032 (= res!171852 (not (= (size!4552 (buf!5057 (_2!9419 lt!320287))) (size!4552 (buf!5057 (_2!9419 lt!320285))))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!205032 (invariant!0 (currentBit!9549 thiss!1204) (currentByte!9554 thiss!1204) (size!4552 (buf!5057 (_2!9419 lt!320287))))))

(declare-fun b!205033 () Bool)

(declare-fun e!140326 () Bool)

(assert (=> b!205033 (= e!140330 e!140326)))

(declare-fun res!171859 () Bool)

(assert (=> b!205033 (=> (not res!171859) (not e!140326))))

(declare-fun lt!320289 () (_ BitVec 64))

(declare-fun lt!320286 () (_ BitVec 64))

(assert (=> b!205033 (= res!171859 (= lt!320289 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!320286)))))

(assert (=> b!205033 (= lt!320289 (bitIndex!0 (size!4552 (buf!5057 (_2!9419 lt!320287))) (currentByte!9554 (_2!9419 lt!320287)) (currentBit!9549 (_2!9419 lt!320287))))))

(assert (=> b!205033 (= lt!320286 (bitIndex!0 (size!4552 (buf!5057 thiss!1204)) (currentByte!9554 thiss!1204) (currentBit!9549 thiss!1204)))))

(declare-fun b!205034 () Bool)

(declare-fun res!171847 () Bool)

(assert (=> b!205034 (=> res!171847 e!140329)))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!205034 (= res!171847 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!4552 (buf!5057 (_2!9419 lt!320287)))) ((_ sign_extend 32) (currentByte!9554 thiss!1204)) ((_ sign_extend 32) (currentBit!9549 thiss!1204)))))))

(declare-fun b!205035 () Bool)

(declare-fun res!171848 () Bool)

(assert (=> b!205035 (=> res!171848 e!140331)))

(declare-fun isPrefixOf!0 (BitStream!8212 BitStream!8212) Bool)

(assert (=> b!205035 (= res!171848 (not (isPrefixOf!0 (_2!9419 lt!320287) (_2!9419 lt!320285))))))

(declare-fun res!171856 () Bool)

(assert (=> start!43422 (=> (not res!171856) (not e!140327))))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> start!43422 (= res!171856 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!43422 e!140327))

(assert (=> start!43422 true))

(declare-fun e!140333 () Bool)

(declare-fun inv!12 (BitStream!8212) Bool)

(assert (=> start!43422 (and (inv!12 thiss!1204) e!140333)))

(declare-fun b!205036 () Bool)

(declare-fun e!140332 () Bool)

(assert (=> b!205036 (= e!140326 e!140332)))

(declare-fun res!171858 () Bool)

(assert (=> b!205036 (=> (not res!171858) (not e!140332))))

(declare-datatypes ((tuple2!17536 0))(
  ( (tuple2!17537 (_1!9420 BitStream!8212) (_2!9420 Bool)) )
))
(declare-fun lt!320291 () tuple2!17536)

(assert (=> b!205036 (= res!171858 (and (= (_2!9420 lt!320291) lt!320290) (= (_1!9420 lt!320291) (_2!9419 lt!320287))))))

(declare-fun readBitPure!0 (BitStream!8212) tuple2!17536)

(declare-fun readerFrom!0 (BitStream!8212 (_ BitVec 32) (_ BitVec 32)) BitStream!8212)

(assert (=> b!205036 (= lt!320291 (readBitPure!0 (readerFrom!0 (_2!9419 lt!320287) (currentBit!9549 thiss!1204) (currentByte!9554 thiss!1204))))))

(declare-fun b!205037 () Bool)

(declare-fun res!171853 () Bool)

(assert (=> b!205037 (=> (not res!171853) (not e!140327))))

(assert (=> b!205037 (= res!171853 (invariant!0 (currentBit!9549 thiss!1204) (currentByte!9554 thiss!1204) (size!4552 (buf!5057 thiss!1204))))))

(declare-fun b!205038 () Bool)

(declare-fun res!171850 () Bool)

(assert (=> b!205038 (=> (not res!171850) (not e!140327))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!205038 (= res!171850 (validate_offset_bits!1 ((_ sign_extend 32) (size!4552 (buf!5057 thiss!1204))) ((_ sign_extend 32) (currentByte!9554 thiss!1204)) ((_ sign_extend 32) (currentBit!9549 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!205039 () Bool)

(declare-fun res!171857 () Bool)

(assert (=> b!205039 (=> res!171857 e!140331)))

(assert (=> b!205039 (= res!171857 (not (invariant!0 (currentBit!9549 (_2!9419 lt!320285)) (currentByte!9554 (_2!9419 lt!320285)) (size!4552 (buf!5057 (_2!9419 lt!320285))))))))

(declare-fun b!205040 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10355 array!10355 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!205040 (= e!140329 (arrayBitRangesEq!0 (buf!5057 (_2!9419 lt!320287)) (buf!5057 (_2!9419 lt!320285)) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!4552 (buf!5057 (_2!9419 lt!320287))) (currentByte!9554 thiss!1204) (currentBit!9549 thiss!1204)))))))

(declare-fun b!205041 () Bool)

(declare-fun res!171849 () Bool)

(assert (=> b!205041 (=> (not res!171849) (not e!140326))))

(assert (=> b!205041 (= res!171849 (isPrefixOf!0 thiss!1204 (_2!9419 lt!320287)))))

(declare-fun b!205042 () Bool)

(declare-fun res!171851 () Bool)

(assert (=> b!205042 (=> res!171851 e!140331)))

(assert (=> b!205042 (= res!171851 (not (isPrefixOf!0 thiss!1204 (_2!9419 lt!320287))))))

(declare-fun b!205043 () Bool)

(assert (=> b!205043 (= e!140334 e!140331)))

(declare-fun res!171854 () Bool)

(assert (=> b!205043 (=> res!171854 e!140331)))

(declare-fun lt!320292 () (_ BitVec 64))

(assert (=> b!205043 (= res!171854 (not (= lt!320292 (bvsub (bvsub (bvadd lt!320288 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!205043 (= lt!320292 (bitIndex!0 (size!4552 (buf!5057 (_2!9419 lt!320285))) (currentByte!9554 (_2!9419 lt!320285)) (currentBit!9549 (_2!9419 lt!320285))))))

(assert (=> b!205043 (isPrefixOf!0 thiss!1204 (_2!9419 lt!320285))))

(declare-fun lt!320293 () Unit!14628)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8212 BitStream!8212 BitStream!8212) Unit!14628)

(assert (=> b!205043 (= lt!320293 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9419 lt!320287) (_2!9419 lt!320285)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8212 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17534)

(assert (=> b!205043 (= lt!320285 (appendBitsLSBFirstLoopTR!0 (_2!9419 lt!320287) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!205044 () Bool)

(declare-fun res!171855 () Bool)

(assert (=> b!205044 (=> res!171855 e!140331)))

(assert (=> b!205044 (= res!171855 (or (not (= (size!4552 (buf!5057 (_2!9419 lt!320285))) (size!4552 (buf!5057 thiss!1204)))) (not (= lt!320292 (bvsub (bvadd lt!320294 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!205045 () Bool)

(declare-fun array_inv!4293 (array!10355) Bool)

(assert (=> b!205045 (= e!140333 (array_inv!4293 (buf!5057 thiss!1204)))))

(declare-fun b!205046 () Bool)

(declare-fun res!171860 () Bool)

(assert (=> b!205046 (=> (not res!171860) (not e!140327))))

(assert (=> b!205046 (= res!171860 (not (= i!590 nBits!348)))))

(declare-fun b!205047 () Bool)

(assert (=> b!205047 (= e!140332 (= (bitIndex!0 (size!4552 (buf!5057 (_1!9420 lt!320291))) (currentByte!9554 (_1!9420 lt!320291)) (currentBit!9549 (_1!9420 lt!320291))) lt!320289))))

(assert (= (and start!43422 res!171856) b!205038))

(assert (= (and b!205038 res!171850) b!205037))

(assert (= (and b!205037 res!171853) b!205046))

(assert (= (and b!205046 res!171860) b!205031))

(assert (= (and b!205031 res!171845) b!205033))

(assert (= (and b!205033 res!171859) b!205041))

(assert (= (and b!205041 res!171849) b!205036))

(assert (= (and b!205036 res!171858) b!205047))

(assert (= (and b!205031 (not res!171846)) b!205043))

(assert (= (and b!205043 (not res!171854)) b!205039))

(assert (= (and b!205039 (not res!171857)) b!205044))

(assert (= (and b!205044 (not res!171855)) b!205035))

(assert (= (and b!205035 (not res!171848)) b!205042))

(assert (= (and b!205042 (not res!171851)) b!205032))

(assert (= (and b!205032 (not res!171852)) b!205034))

(assert (= (and b!205034 (not res!171847)) b!205040))

(assert (= start!43422 b!205045))

(declare-fun m!316215 () Bool)

(assert (=> b!205032 m!316215))

(declare-fun m!316217 () Bool)

(assert (=> b!205035 m!316217))

(declare-fun m!316219 () Bool)

(assert (=> b!205045 m!316219))

(declare-fun m!316221 () Bool)

(assert (=> b!205037 m!316221))

(declare-fun m!316223 () Bool)

(assert (=> b!205042 m!316223))

(declare-fun m!316225 () Bool)

(assert (=> b!205038 m!316225))

(declare-fun m!316227 () Bool)

(assert (=> b!205040 m!316227))

(declare-fun m!316229 () Bool)

(assert (=> b!205040 m!316229))

(declare-fun m!316231 () Bool)

(assert (=> b!205036 m!316231))

(assert (=> b!205036 m!316231))

(declare-fun m!316233 () Bool)

(assert (=> b!205036 m!316233))

(declare-fun m!316235 () Bool)

(assert (=> b!205033 m!316235))

(declare-fun m!316237 () Bool)

(assert (=> b!205033 m!316237))

(assert (=> b!205041 m!316223))

(declare-fun m!316239 () Bool)

(assert (=> b!205047 m!316239))

(declare-fun m!316241 () Bool)

(assert (=> b!205039 m!316241))

(assert (=> b!205031 m!316235))

(assert (=> b!205031 m!316237))

(declare-fun m!316243 () Bool)

(assert (=> b!205031 m!316243))

(declare-fun m!316245 () Bool)

(assert (=> start!43422 m!316245))

(declare-fun m!316247 () Bool)

(assert (=> b!205034 m!316247))

(declare-fun m!316249 () Bool)

(assert (=> b!205043 m!316249))

(declare-fun m!316251 () Bool)

(assert (=> b!205043 m!316251))

(declare-fun m!316253 () Bool)

(assert (=> b!205043 m!316253))

(declare-fun m!316255 () Bool)

(assert (=> b!205043 m!316255))

(push 1)

(assert (not b!205031))

(assert (not b!205037))

(assert (not b!205039))

(assert (not b!205036))

(assert (not b!205034))

(assert (not b!205035))

(assert (not b!205043))

(assert (not b!205047))

(assert (not b!205045))

(assert (not b!205040))

(assert (not b!205041))

(assert (not b!205042))

(assert (not b!205032))

(assert (not b!205033))

(assert (not start!43422))

(assert (not b!205038))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!69885 () Bool)

(declare-datatypes ((tuple2!17550 0))(
  ( (tuple2!17551 (_1!9427 Bool) (_2!9427 BitStream!8212)) )
))
(declare-fun lt!320402 () tuple2!17550)

(declare-fun readBit!0 (BitStream!8212) tuple2!17550)

(assert (=> d!69885 (= lt!320402 (readBit!0 (readerFrom!0 (_2!9419 lt!320287) (currentBit!9549 thiss!1204) (currentByte!9554 thiss!1204))))))

(assert (=> d!69885 (= (readBitPure!0 (readerFrom!0 (_2!9419 lt!320287) (currentBit!9549 thiss!1204) (currentByte!9554 thiss!1204))) (tuple2!17537 (_2!9427 lt!320402) (_1!9427 lt!320402)))))

(declare-fun bs!17196 () Bool)

(assert (= bs!17196 d!69885))

(assert (=> bs!17196 m!316231))

(declare-fun m!316369 () Bool)

(assert (=> bs!17196 m!316369))

(assert (=> b!205036 d!69885))

(declare-fun d!69887 () Bool)

(declare-fun e!140410 () Bool)

(assert (=> d!69887 e!140410))

(declare-fun res!171994 () Bool)

(assert (=> d!69887 (=> (not res!171994) (not e!140410))))

(assert (=> d!69887 (= res!171994 (invariant!0 (currentBit!9549 (_2!9419 lt!320287)) (currentByte!9554 (_2!9419 lt!320287)) (size!4552 (buf!5057 (_2!9419 lt!320287)))))))

(assert (=> d!69887 (= (readerFrom!0 (_2!9419 lt!320287) (currentBit!9549 thiss!1204) (currentByte!9554 thiss!1204)) (BitStream!8213 (buf!5057 (_2!9419 lt!320287)) (currentByte!9554 thiss!1204) (currentBit!9549 thiss!1204)))))

(declare-fun b!205187 () Bool)

(assert (=> b!205187 (= e!140410 (invariant!0 (currentBit!9549 thiss!1204) (currentByte!9554 thiss!1204) (size!4552 (buf!5057 (_2!9419 lt!320287)))))))

(assert (= (and d!69887 res!171994) b!205187))

(declare-fun m!316371 () Bool)

(assert (=> d!69887 m!316371))

(assert (=> b!205187 m!316215))

(assert (=> b!205036 d!69887))

(declare-fun d!69889 () Bool)

(declare-fun e!140413 () Bool)

(assert (=> d!69889 e!140413))

(declare-fun res!171999 () Bool)

(assert (=> d!69889 (=> (not res!171999) (not e!140413))))

(declare-fun lt!320420 () (_ BitVec 64))

(declare-fun lt!320415 () (_ BitVec 64))

(declare-fun lt!320419 () (_ BitVec 64))

(assert (=> d!69889 (= res!171999 (= lt!320420 (bvsub lt!320419 lt!320415)))))

(assert (=> d!69889 (or (= (bvand lt!320419 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!320415 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!320419 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!320419 lt!320415) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!69889 (= lt!320415 (remainingBits!0 ((_ sign_extend 32) (size!4552 (buf!5057 (_1!9420 lt!320291)))) ((_ sign_extend 32) (currentByte!9554 (_1!9420 lt!320291))) ((_ sign_extend 32) (currentBit!9549 (_1!9420 lt!320291)))))))

(declare-fun lt!320417 () (_ BitVec 64))

(declare-fun lt!320418 () (_ BitVec 64))

(assert (=> d!69889 (= lt!320419 (bvmul lt!320417 lt!320418))))

(assert (=> d!69889 (or (= lt!320417 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!320418 (bvsdiv (bvmul lt!320417 lt!320418) lt!320417)))))

(assert (=> d!69889 (= lt!320418 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69889 (= lt!320417 ((_ sign_extend 32) (size!4552 (buf!5057 (_1!9420 lt!320291)))))))

(assert (=> d!69889 (= lt!320420 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9554 (_1!9420 lt!320291))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9549 (_1!9420 lt!320291)))))))

(assert (=> d!69889 (invariant!0 (currentBit!9549 (_1!9420 lt!320291)) (currentByte!9554 (_1!9420 lt!320291)) (size!4552 (buf!5057 (_1!9420 lt!320291))))))

(assert (=> d!69889 (= (bitIndex!0 (size!4552 (buf!5057 (_1!9420 lt!320291))) (currentByte!9554 (_1!9420 lt!320291)) (currentBit!9549 (_1!9420 lt!320291))) lt!320420)))

(declare-fun b!205192 () Bool)

(declare-fun res!172000 () Bool)

(assert (=> b!205192 (=> (not res!172000) (not e!140413))))

(assert (=> b!205192 (= res!172000 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!320420))))

(declare-fun b!205193 () Bool)

(declare-fun lt!320416 () (_ BitVec 64))

(assert (=> b!205193 (= e!140413 (bvsle lt!320420 (bvmul lt!320416 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!205193 (or (= lt!320416 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!320416 #b0000000000000000000000000000000000000000000000000000000000001000) lt!320416)))))

(assert (=> b!205193 (= lt!320416 ((_ sign_extend 32) (size!4552 (buf!5057 (_1!9420 lt!320291)))))))

(assert (= (and d!69889 res!171999) b!205192))

(assert (= (and b!205192 res!172000) b!205193))

(declare-fun m!316373 () Bool)

(assert (=> d!69889 m!316373))

(declare-fun m!316375 () Bool)

(assert (=> d!69889 m!316375))

(assert (=> b!205047 d!69889))

(declare-fun d!69891 () Bool)

(assert (=> d!69891 (= (invariant!0 (currentBit!9549 thiss!1204) (currentByte!9554 thiss!1204) (size!4552 (buf!5057 thiss!1204))) (and (bvsge (currentBit!9549 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9549 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9554 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9554 thiss!1204) (size!4552 (buf!5057 thiss!1204))) (and (= (currentBit!9549 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9554 thiss!1204) (size!4552 (buf!5057 thiss!1204)))))))))

(assert (=> b!205037 d!69891))

(declare-fun d!69893 () Bool)

(assert (=> d!69893 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4552 (buf!5057 thiss!1204))) ((_ sign_extend 32) (currentByte!9554 thiss!1204)) ((_ sign_extend 32) (currentBit!9549 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4552 (buf!5057 thiss!1204))) ((_ sign_extend 32) (currentByte!9554 thiss!1204)) ((_ sign_extend 32) (currentBit!9549 thiss!1204))) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun bs!17197 () Bool)

(assert (= bs!17197 d!69893))

(declare-fun m!316377 () Bool)

(assert (=> bs!17197 m!316377))

(assert (=> b!205038 d!69893))

(declare-fun d!69895 () Bool)

(assert (=> d!69895 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!4552 (buf!5057 (_2!9419 lt!320287)))) ((_ sign_extend 32) (currentByte!9554 thiss!1204)) ((_ sign_extend 32) (currentBit!9549 thiss!1204))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4552 (buf!5057 (_2!9419 lt!320287)))) ((_ sign_extend 32) (currentByte!9554 thiss!1204)) ((_ sign_extend 32) (currentBit!9549 thiss!1204))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!17198 () Bool)

(assert (= bs!17198 d!69895))

(declare-fun m!316379 () Bool)

(assert (=> bs!17198 m!316379))

(assert (=> b!205034 d!69895))

(declare-fun d!69897 () Bool)

(assert (=> d!69897 (= (array_inv!4293 (buf!5057 thiss!1204)) (bvsge (size!4552 (buf!5057 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!205045 d!69897))

(declare-fun d!69899 () Bool)

(declare-fun res!172008 () Bool)

(declare-fun e!140419 () Bool)

(assert (=> d!69899 (=> (not res!172008) (not e!140419))))

(assert (=> d!69899 (= res!172008 (= (size!4552 (buf!5057 (_2!9419 lt!320287))) (size!4552 (buf!5057 (_2!9419 lt!320285)))))))

(assert (=> d!69899 (= (isPrefixOf!0 (_2!9419 lt!320287) (_2!9419 lt!320285)) e!140419)))

(declare-fun b!205200 () Bool)

(declare-fun res!172009 () Bool)

(assert (=> b!205200 (=> (not res!172009) (not e!140419))))

(assert (=> b!205200 (= res!172009 (bvsle (bitIndex!0 (size!4552 (buf!5057 (_2!9419 lt!320287))) (currentByte!9554 (_2!9419 lt!320287)) (currentBit!9549 (_2!9419 lt!320287))) (bitIndex!0 (size!4552 (buf!5057 (_2!9419 lt!320285))) (currentByte!9554 (_2!9419 lt!320285)) (currentBit!9549 (_2!9419 lt!320285)))))))

(declare-fun b!205201 () Bool)

(declare-fun e!140418 () Bool)

(assert (=> b!205201 (= e!140419 e!140418)))

(declare-fun res!172007 () Bool)

(assert (=> b!205201 (=> res!172007 e!140418)))

(assert (=> b!205201 (= res!172007 (= (size!4552 (buf!5057 (_2!9419 lt!320287))) #b00000000000000000000000000000000))))

(declare-fun b!205202 () Bool)

(assert (=> b!205202 (= e!140418 (arrayBitRangesEq!0 (buf!5057 (_2!9419 lt!320287)) (buf!5057 (_2!9419 lt!320285)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4552 (buf!5057 (_2!9419 lt!320287))) (currentByte!9554 (_2!9419 lt!320287)) (currentBit!9549 (_2!9419 lt!320287)))))))

(assert (= (and d!69899 res!172008) b!205200))

(assert (= (and b!205200 res!172009) b!205201))

(assert (= (and b!205201 (not res!172007)) b!205202))

(assert (=> b!205200 m!316235))

(assert (=> b!205200 m!316249))

(assert (=> b!205202 m!316235))

(assert (=> b!205202 m!316235))

(declare-fun m!316381 () Bool)

(assert (=> b!205202 m!316381))

(assert (=> b!205035 d!69899))

(declare-fun d!69901 () Bool)

(declare-fun e!140420 () Bool)

(assert (=> d!69901 e!140420))

(declare-fun res!172010 () Bool)

(assert (=> d!69901 (=> (not res!172010) (not e!140420))))

(declare-fun lt!320421 () (_ BitVec 64))

(declare-fun lt!320426 () (_ BitVec 64))

(declare-fun lt!320425 () (_ BitVec 64))

(assert (=> d!69901 (= res!172010 (= lt!320426 (bvsub lt!320425 lt!320421)))))

(assert (=> d!69901 (or (= (bvand lt!320425 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!320421 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!320425 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!320425 lt!320421) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!69901 (= lt!320421 (remainingBits!0 ((_ sign_extend 32) (size!4552 (buf!5057 (_2!9419 lt!320287)))) ((_ sign_extend 32) (currentByte!9554 (_2!9419 lt!320287))) ((_ sign_extend 32) (currentBit!9549 (_2!9419 lt!320287)))))))

(declare-fun lt!320423 () (_ BitVec 64))

(declare-fun lt!320424 () (_ BitVec 64))

(assert (=> d!69901 (= lt!320425 (bvmul lt!320423 lt!320424))))

(assert (=> d!69901 (or (= lt!320423 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!320424 (bvsdiv (bvmul lt!320423 lt!320424) lt!320423)))))

(assert (=> d!69901 (= lt!320424 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69901 (= lt!320423 ((_ sign_extend 32) (size!4552 (buf!5057 (_2!9419 lt!320287)))))))

(assert (=> d!69901 (= lt!320426 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9554 (_2!9419 lt!320287))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9549 (_2!9419 lt!320287)))))))

(assert (=> d!69901 (invariant!0 (currentBit!9549 (_2!9419 lt!320287)) (currentByte!9554 (_2!9419 lt!320287)) (size!4552 (buf!5057 (_2!9419 lt!320287))))))

(assert (=> d!69901 (= (bitIndex!0 (size!4552 (buf!5057 (_2!9419 lt!320287))) (currentByte!9554 (_2!9419 lt!320287)) (currentBit!9549 (_2!9419 lt!320287))) lt!320426)))

(declare-fun b!205203 () Bool)

(declare-fun res!172011 () Bool)

(assert (=> b!205203 (=> (not res!172011) (not e!140420))))

(assert (=> b!205203 (= res!172011 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!320426))))

(declare-fun b!205204 () Bool)

(declare-fun lt!320422 () (_ BitVec 64))

(assert (=> b!205204 (= e!140420 (bvsle lt!320426 (bvmul lt!320422 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!205204 (or (= lt!320422 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!320422 #b0000000000000000000000000000000000000000000000000000000000001000) lt!320422)))))

(assert (=> b!205204 (= lt!320422 ((_ sign_extend 32) (size!4552 (buf!5057 (_2!9419 lt!320287)))))))

(assert (= (and d!69901 res!172010) b!205203))

(assert (= (and b!205203 res!172011) b!205204))

(declare-fun m!316383 () Bool)

(assert (=> d!69901 m!316383))

(assert (=> d!69901 m!316371))

(assert (=> b!205031 d!69901))

(declare-fun d!69903 () Bool)

(declare-fun e!140421 () Bool)

(assert (=> d!69903 e!140421))

(declare-fun res!172012 () Bool)

(assert (=> d!69903 (=> (not res!172012) (not e!140421))))

(declare-fun lt!320431 () (_ BitVec 64))

(declare-fun lt!320432 () (_ BitVec 64))

(declare-fun lt!320427 () (_ BitVec 64))

(assert (=> d!69903 (= res!172012 (= lt!320432 (bvsub lt!320431 lt!320427)))))

(assert (=> d!69903 (or (= (bvand lt!320431 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!320427 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!320431 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!320431 lt!320427) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!69903 (= lt!320427 (remainingBits!0 ((_ sign_extend 32) (size!4552 (buf!5057 thiss!1204))) ((_ sign_extend 32) (currentByte!9554 thiss!1204)) ((_ sign_extend 32) (currentBit!9549 thiss!1204))))))

(declare-fun lt!320429 () (_ BitVec 64))

(declare-fun lt!320430 () (_ BitVec 64))

(assert (=> d!69903 (= lt!320431 (bvmul lt!320429 lt!320430))))

(assert (=> d!69903 (or (= lt!320429 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!320430 (bvsdiv (bvmul lt!320429 lt!320430) lt!320429)))))

(assert (=> d!69903 (= lt!320430 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69903 (= lt!320429 ((_ sign_extend 32) (size!4552 (buf!5057 thiss!1204))))))

(assert (=> d!69903 (= lt!320432 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9554 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9549 thiss!1204))))))

(assert (=> d!69903 (invariant!0 (currentBit!9549 thiss!1204) (currentByte!9554 thiss!1204) (size!4552 (buf!5057 thiss!1204)))))

(assert (=> d!69903 (= (bitIndex!0 (size!4552 (buf!5057 thiss!1204)) (currentByte!9554 thiss!1204) (currentBit!9549 thiss!1204)) lt!320432)))

(declare-fun b!205205 () Bool)

(declare-fun res!172013 () Bool)

(assert (=> b!205205 (=> (not res!172013) (not e!140421))))

(assert (=> b!205205 (= res!172013 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!320432))))

(declare-fun b!205206 () Bool)

(declare-fun lt!320428 () (_ BitVec 64))

(assert (=> b!205206 (= e!140421 (bvsle lt!320432 (bvmul lt!320428 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!205206 (or (= lt!320428 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!320428 #b0000000000000000000000000000000000000000000000000000000000001000) lt!320428)))))

(assert (=> b!205206 (= lt!320428 ((_ sign_extend 32) (size!4552 (buf!5057 thiss!1204))))))

(assert (= (and d!69903 res!172012) b!205205))

(assert (= (and b!205205 res!172013) b!205206))

(assert (=> d!69903 m!316377))

(assert (=> d!69903 m!316221))

(assert (=> b!205031 d!69903))

(declare-fun b!205216 () Bool)

(declare-fun res!172025 () Bool)

(declare-fun e!140426 () Bool)

(assert (=> b!205216 (=> (not res!172025) (not e!140426))))

(declare-fun lt!320441 () (_ BitVec 64))

(declare-fun lt!320443 () tuple2!17534)

(declare-fun lt!320444 () (_ BitVec 64))

(assert (=> b!205216 (= res!172025 (= (bitIndex!0 (size!4552 (buf!5057 (_2!9419 lt!320443))) (currentByte!9554 (_2!9419 lt!320443)) (currentBit!9549 (_2!9419 lt!320443))) (bvadd lt!320444 lt!320441)))))

(assert (=> b!205216 (or (not (= (bvand lt!320444 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!320441 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!320444 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!320444 lt!320441) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!205216 (= lt!320441 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!205216 (= lt!320444 (bitIndex!0 (size!4552 (buf!5057 thiss!1204)) (currentByte!9554 thiss!1204) (currentBit!9549 thiss!1204)))))

(declare-fun b!205217 () Bool)

(declare-fun res!172024 () Bool)

(assert (=> b!205217 (=> (not res!172024) (not e!140426))))

(assert (=> b!205217 (= res!172024 (isPrefixOf!0 thiss!1204 (_2!9419 lt!320443)))))

(declare-fun b!205219 () Bool)

(declare-fun e!140427 () Bool)

(declare-fun lt!320442 () tuple2!17536)

(assert (=> b!205219 (= e!140427 (= (bitIndex!0 (size!4552 (buf!5057 (_1!9420 lt!320442))) (currentByte!9554 (_1!9420 lt!320442)) (currentBit!9549 (_1!9420 lt!320442))) (bitIndex!0 (size!4552 (buf!5057 (_2!9419 lt!320443))) (currentByte!9554 (_2!9419 lt!320443)) (currentBit!9549 (_2!9419 lt!320443)))))))

(declare-fun b!205218 () Bool)

(assert (=> b!205218 (= e!140426 e!140427)))

(declare-fun res!172022 () Bool)

(assert (=> b!205218 (=> (not res!172022) (not e!140427))))

(assert (=> b!205218 (= res!172022 (and (= (_2!9420 lt!320442) lt!320290) (= (_1!9420 lt!320442) (_2!9419 lt!320443))))))

(assert (=> b!205218 (= lt!320442 (readBitPure!0 (readerFrom!0 (_2!9419 lt!320443) (currentBit!9549 thiss!1204) (currentByte!9554 thiss!1204))))))

(declare-fun d!69905 () Bool)

(assert (=> d!69905 e!140426))

(declare-fun res!172023 () Bool)

(assert (=> d!69905 (=> (not res!172023) (not e!140426))))

(assert (=> d!69905 (= res!172023 (= (size!4552 (buf!5057 thiss!1204)) (size!4552 (buf!5057 (_2!9419 lt!320443)))))))

(declare-fun choose!16 (BitStream!8212 Bool) tuple2!17534)

(assert (=> d!69905 (= lt!320443 (choose!16 thiss!1204 lt!320290))))

(assert (=> d!69905 (validate_offset_bit!0 ((_ sign_extend 32) (size!4552 (buf!5057 thiss!1204))) ((_ sign_extend 32) (currentByte!9554 thiss!1204)) ((_ sign_extend 32) (currentBit!9549 thiss!1204)))))

(assert (=> d!69905 (= (appendBit!0 thiss!1204 lt!320290) lt!320443)))

(assert (= (and d!69905 res!172023) b!205216))

(assert (= (and b!205216 res!172025) b!205217))

(assert (= (and b!205217 res!172024) b!205218))

(assert (= (and b!205218 res!172022) b!205219))

(declare-fun m!316385 () Bool)

(assert (=> b!205216 m!316385))

(assert (=> b!205216 m!316237))

(declare-fun m!316387 () Bool)

(assert (=> b!205219 m!316387))

(assert (=> b!205219 m!316385))

(declare-fun m!316389 () Bool)

(assert (=> d!69905 m!316389))

(declare-fun m!316391 () Bool)

(assert (=> d!69905 m!316391))

(declare-fun m!316393 () Bool)

(assert (=> b!205218 m!316393))

(assert (=> b!205218 m!316393))

(declare-fun m!316395 () Bool)

(assert (=> b!205218 m!316395))

(declare-fun m!316397 () Bool)

(assert (=> b!205217 m!316397))

(assert (=> b!205031 d!69905))

(declare-fun d!69909 () Bool)

(declare-fun res!172027 () Bool)

(declare-fun e!140429 () Bool)

(assert (=> d!69909 (=> (not res!172027) (not e!140429))))

(assert (=> d!69909 (= res!172027 (= (size!4552 (buf!5057 thiss!1204)) (size!4552 (buf!5057 (_2!9419 lt!320287)))))))

(assert (=> d!69909 (= (isPrefixOf!0 thiss!1204 (_2!9419 lt!320287)) e!140429)))

(declare-fun b!205220 () Bool)

(declare-fun res!172028 () Bool)

(assert (=> b!205220 (=> (not res!172028) (not e!140429))))

(assert (=> b!205220 (= res!172028 (bvsle (bitIndex!0 (size!4552 (buf!5057 thiss!1204)) (currentByte!9554 thiss!1204) (currentBit!9549 thiss!1204)) (bitIndex!0 (size!4552 (buf!5057 (_2!9419 lt!320287))) (currentByte!9554 (_2!9419 lt!320287)) (currentBit!9549 (_2!9419 lt!320287)))))))

(declare-fun b!205221 () Bool)

(declare-fun e!140428 () Bool)

(assert (=> b!205221 (= e!140429 e!140428)))

(declare-fun res!172026 () Bool)

(assert (=> b!205221 (=> res!172026 e!140428)))

(assert (=> b!205221 (= res!172026 (= (size!4552 (buf!5057 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!205222 () Bool)

(assert (=> b!205222 (= e!140428 (arrayBitRangesEq!0 (buf!5057 thiss!1204) (buf!5057 (_2!9419 lt!320287)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4552 (buf!5057 thiss!1204)) (currentByte!9554 thiss!1204) (currentBit!9549 thiss!1204))))))

(assert (= (and d!69909 res!172027) b!205220))

(assert (= (and b!205220 res!172028) b!205221))

(assert (= (and b!205221 (not res!172026)) b!205222))

(assert (=> b!205220 m!316237))

(assert (=> b!205220 m!316235))

(assert (=> b!205222 m!316237))

(assert (=> b!205222 m!316237))

(declare-fun m!316399 () Bool)

(assert (=> b!205222 m!316399))

(assert (=> b!205042 d!69909))

(declare-fun d!69911 () Bool)

(assert (=> d!69911 (= (invariant!0 (currentBit!9549 thiss!1204) (currentByte!9554 thiss!1204) (size!4552 (buf!5057 (_2!9419 lt!320287)))) (and (bvsge (currentBit!9549 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9549 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9554 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9554 thiss!1204) (size!4552 (buf!5057 (_2!9419 lt!320287)))) (and (= (currentBit!9549 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9554 thiss!1204) (size!4552 (buf!5057 (_2!9419 lt!320287))))))))))

(assert (=> b!205032 d!69911))

(declare-fun d!69913 () Bool)

(declare-fun e!140430 () Bool)

(assert (=> d!69913 e!140430))

(declare-fun res!172029 () Bool)

(assert (=> d!69913 (=> (not res!172029) (not e!140430))))

(declare-fun lt!320445 () (_ BitVec 64))

(declare-fun lt!320449 () (_ BitVec 64))

(declare-fun lt!320450 () (_ BitVec 64))

(assert (=> d!69913 (= res!172029 (= lt!320450 (bvsub lt!320449 lt!320445)))))

(assert (=> d!69913 (or (= (bvand lt!320449 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!320445 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!320449 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!320449 lt!320445) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!69913 (= lt!320445 (remainingBits!0 ((_ sign_extend 32) (size!4552 (buf!5057 (_2!9419 lt!320285)))) ((_ sign_extend 32) (currentByte!9554 (_2!9419 lt!320285))) ((_ sign_extend 32) (currentBit!9549 (_2!9419 lt!320285)))))))

(declare-fun lt!320447 () (_ BitVec 64))

(declare-fun lt!320448 () (_ BitVec 64))

(assert (=> d!69913 (= lt!320449 (bvmul lt!320447 lt!320448))))

(assert (=> d!69913 (or (= lt!320447 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!320448 (bvsdiv (bvmul lt!320447 lt!320448) lt!320447)))))

(assert (=> d!69913 (= lt!320448 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69913 (= lt!320447 ((_ sign_extend 32) (size!4552 (buf!5057 (_2!9419 lt!320285)))))))

(assert (=> d!69913 (= lt!320450 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9554 (_2!9419 lt!320285))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9549 (_2!9419 lt!320285)))))))

(assert (=> d!69913 (invariant!0 (currentBit!9549 (_2!9419 lt!320285)) (currentByte!9554 (_2!9419 lt!320285)) (size!4552 (buf!5057 (_2!9419 lt!320285))))))

(assert (=> d!69913 (= (bitIndex!0 (size!4552 (buf!5057 (_2!9419 lt!320285))) (currentByte!9554 (_2!9419 lt!320285)) (currentBit!9549 (_2!9419 lt!320285))) lt!320450)))

(declare-fun b!205223 () Bool)

(declare-fun res!172030 () Bool)

(assert (=> b!205223 (=> (not res!172030) (not e!140430))))

(assert (=> b!205223 (= res!172030 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!320450))))

(declare-fun b!205224 () Bool)

(declare-fun lt!320446 () (_ BitVec 64))

(assert (=> b!205224 (= e!140430 (bvsle lt!320450 (bvmul lt!320446 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!205224 (or (= lt!320446 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!320446 #b0000000000000000000000000000000000000000000000000000000000001000) lt!320446)))))

(assert (=> b!205224 (= lt!320446 ((_ sign_extend 32) (size!4552 (buf!5057 (_2!9419 lt!320285)))))))

(assert (= (and d!69913 res!172029) b!205223))

(assert (= (and b!205223 res!172030) b!205224))

(declare-fun m!316401 () Bool)

(assert (=> d!69913 m!316401))

(assert (=> d!69913 m!316241))

(assert (=> b!205043 d!69913))

(declare-fun d!69915 () Bool)

(declare-fun res!172032 () Bool)

(declare-fun e!140432 () Bool)

(assert (=> d!69915 (=> (not res!172032) (not e!140432))))

(assert (=> d!69915 (= res!172032 (= (size!4552 (buf!5057 thiss!1204)) (size!4552 (buf!5057 (_2!9419 lt!320285)))))))

(assert (=> d!69915 (= (isPrefixOf!0 thiss!1204 (_2!9419 lt!320285)) e!140432)))

(declare-fun b!205225 () Bool)

(declare-fun res!172033 () Bool)

(assert (=> b!205225 (=> (not res!172033) (not e!140432))))

(assert (=> b!205225 (= res!172033 (bvsle (bitIndex!0 (size!4552 (buf!5057 thiss!1204)) (currentByte!9554 thiss!1204) (currentBit!9549 thiss!1204)) (bitIndex!0 (size!4552 (buf!5057 (_2!9419 lt!320285))) (currentByte!9554 (_2!9419 lt!320285)) (currentBit!9549 (_2!9419 lt!320285)))))))

(declare-fun b!205226 () Bool)

(declare-fun e!140431 () Bool)

(assert (=> b!205226 (= e!140432 e!140431)))

(declare-fun res!172031 () Bool)

(assert (=> b!205226 (=> res!172031 e!140431)))

(assert (=> b!205226 (= res!172031 (= (size!4552 (buf!5057 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!205227 () Bool)

(assert (=> b!205227 (= e!140431 (arrayBitRangesEq!0 (buf!5057 thiss!1204) (buf!5057 (_2!9419 lt!320285)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4552 (buf!5057 thiss!1204)) (currentByte!9554 thiss!1204) (currentBit!9549 thiss!1204))))))

(assert (= (and d!69915 res!172032) b!205225))

(assert (= (and b!205225 res!172033) b!205226))

(assert (= (and b!205226 (not res!172031)) b!205227))

(assert (=> b!205225 m!316237))

(assert (=> b!205225 m!316249))

(assert (=> b!205227 m!316237))

(assert (=> b!205227 m!316237))

(declare-fun m!316403 () Bool)

(assert (=> b!205227 m!316403))

(assert (=> b!205043 d!69915))

(declare-fun d!69917 () Bool)

(assert (=> d!69917 (isPrefixOf!0 thiss!1204 (_2!9419 lt!320285))))

(declare-fun lt!320453 () Unit!14628)

(declare-fun choose!30 (BitStream!8212 BitStream!8212 BitStream!8212) Unit!14628)

(assert (=> d!69917 (= lt!320453 (choose!30 thiss!1204 (_2!9419 lt!320287) (_2!9419 lt!320285)))))

(assert (=> d!69917 (isPrefixOf!0 thiss!1204 (_2!9419 lt!320287))))

(assert (=> d!69917 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9419 lt!320287) (_2!9419 lt!320285)) lt!320453)))

(declare-fun bs!17199 () Bool)

(assert (= bs!17199 d!69917))

(assert (=> bs!17199 m!316251))

(declare-fun m!316405 () Bool)

(assert (=> bs!17199 m!316405))

(assert (=> bs!17199 m!316223))

(assert (=> b!205043 d!69917))

(declare-fun b!205405 () Bool)

(declare-fun res!172182 () Bool)

(declare-fun e!140551 () Bool)

(assert (=> b!205405 (=> (not res!172182) (not e!140551))))

(declare-fun lt!320829 () tuple2!17534)

(declare-fun lt!320843 () (_ BitVec 64))

(declare-fun lt!320866 () (_ BitVec 64))

(assert (=> b!205405 (= res!172182 (= (bitIndex!0 (size!4552 (buf!5057 (_2!9419 lt!320829))) (currentByte!9554 (_2!9419 lt!320829)) (currentBit!9549 (_2!9419 lt!320829))) (bvsub lt!320866 lt!320843)))))

(assert (=> b!205405 (or (= (bvand lt!320866 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!320843 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!320866 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!320866 lt!320843) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!205405 (= lt!320843 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!320838 () (_ BitVec 64))

(declare-fun lt!320832 () (_ BitVec 64))

(assert (=> b!205405 (= lt!320866 (bvadd lt!320838 lt!320832))))

(assert (=> b!205405 (or (not (= (bvand lt!320838 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!320832 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!320838 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!320838 lt!320832) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!205405 (= lt!320832 ((_ sign_extend 32) nBits!348))))

(assert (=> b!205405 (= lt!320838 (bitIndex!0 (size!4552 (buf!5057 (_2!9419 lt!320287))) (currentByte!9554 (_2!9419 lt!320287)) (currentBit!9549 (_2!9419 lt!320287))))))

(declare-fun b!205406 () Bool)

(declare-fun e!140550 () (_ BitVec 64))

(assert (=> b!205406 (= e!140550 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!205407 () Bool)

(declare-fun res!172184 () Bool)

(assert (=> b!205407 (=> (not res!172184) (not e!140551))))

(assert (=> b!205407 (= res!172184 (isPrefixOf!0 (_2!9419 lt!320287) (_2!9419 lt!320829)))))

(declare-fun b!205408 () Bool)

(declare-fun e!140554 () tuple2!17534)

(declare-fun Unit!14645 () Unit!14628)

(assert (=> b!205408 (= e!140554 (tuple2!17535 Unit!14645 (_2!9419 lt!320287)))))

(declare-fun lt!320835 () Unit!14628)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8212) Unit!14628)

(assert (=> b!205408 (= lt!320835 (lemmaIsPrefixRefl!0 (_2!9419 lt!320287)))))

(declare-fun call!3255 () Bool)

(assert (=> b!205408 call!3255))

(declare-fun lt!320865 () Unit!14628)

(assert (=> b!205408 (= lt!320865 lt!320835)))

(declare-fun b!205409 () Bool)

(declare-fun res!172186 () Bool)

(declare-fun lt!320880 () tuple2!17534)

(assert (=> b!205409 (= res!172186 (= (bitIndex!0 (size!4552 (buf!5057 (_2!9419 lt!320880))) (currentByte!9554 (_2!9419 lt!320880)) (currentBit!9549 (_2!9419 lt!320880))) (bvadd (bitIndex!0 (size!4552 (buf!5057 (_2!9419 lt!320287))) (currentByte!9554 (_2!9419 lt!320287)) (currentBit!9549 (_2!9419 lt!320287))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun e!140555 () Bool)

(assert (=> b!205409 (=> (not res!172186) (not e!140555))))

(declare-fun b!205410 () Bool)

(declare-fun e!140548 () Bool)

(declare-datatypes ((tuple2!17554 0))(
  ( (tuple2!17555 (_1!9430 BitStream!8212) (_2!9430 (_ BitVec 64))) )
))
(declare-fun lt!320868 () tuple2!17554)

(declare-datatypes ((tuple2!17556 0))(
  ( (tuple2!17557 (_1!9431 BitStream!8212) (_2!9431 BitStream!8212)) )
))
(declare-fun lt!320863 () tuple2!17556)

(assert (=> b!205410 (= e!140548 (= (_1!9430 lt!320868) (_2!9431 lt!320863)))))

(declare-fun b!205411 () Bool)

(declare-fun e!140549 () Bool)

(declare-fun lt!320874 () tuple2!17536)

(declare-fun lt!320827 () tuple2!17536)

(assert (=> b!205411 (= e!140549 (= (_2!9420 lt!320874) (_2!9420 lt!320827)))))

(declare-fun b!205412 () Bool)

(declare-fun lt!320837 () tuple2!17536)

(assert (=> b!205412 (= lt!320837 (readBitPure!0 (readerFrom!0 (_2!9419 lt!320880) (currentBit!9549 (_2!9419 lt!320287)) (currentByte!9554 (_2!9419 lt!320287)))))))

(declare-fun lt!320828 () Bool)

(declare-fun res!172191 () Bool)

(assert (=> b!205412 (= res!172191 (and (= (_2!9420 lt!320837) lt!320828) (= (_1!9420 lt!320837) (_2!9419 lt!320880))))))

(declare-fun e!140553 () Bool)

(assert (=> b!205412 (=> (not res!172191) (not e!140553))))

(assert (=> b!205412 (= e!140555 e!140553)))

(declare-fun b!205413 () Bool)

(declare-fun res!172187 () Bool)

(assert (=> b!205413 (= res!172187 (isPrefixOf!0 (_2!9419 lt!320287) (_2!9419 lt!320880)))))

(assert (=> b!205413 (=> (not res!172187) (not e!140555))))

(declare-fun bm!3252 () Bool)

(declare-fun lt!320857 () tuple2!17534)

(declare-fun c!10169 () Bool)

(assert (=> bm!3252 (= call!3255 (isPrefixOf!0 (_2!9419 lt!320287) (ite c!10169 (_2!9419 lt!320287) (_2!9419 lt!320857))))))

(declare-fun b!205414 () Bool)

(declare-fun e!140552 () Bool)

(declare-fun lt!320872 () tuple2!17554)

(declare-fun lt!320849 () tuple2!17556)

(assert (=> b!205414 (= e!140552 (= (_1!9430 lt!320872) (_2!9431 lt!320849)))))

(declare-fun b!205415 () Bool)

(declare-fun res!172183 () Bool)

(assert (=> b!205415 (=> (not res!172183) (not e!140551))))

(assert (=> b!205415 (= res!172183 (= (size!4552 (buf!5057 (_2!9419 lt!320287))) (size!4552 (buf!5057 (_2!9419 lt!320829)))))))

(declare-fun b!205416 () Bool)

(assert (=> b!205416 (= e!140554 (tuple2!17535 (_1!9419 lt!320857) (_2!9419 lt!320857)))))

(assert (=> b!205416 (= lt!320828 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!205416 (= lt!320880 (appendBit!0 (_2!9419 lt!320287) lt!320828))))

(declare-fun res!172189 () Bool)

(assert (=> b!205416 (= res!172189 (= (size!4552 (buf!5057 (_2!9419 lt!320287))) (size!4552 (buf!5057 (_2!9419 lt!320880)))))))

(assert (=> b!205416 (=> (not res!172189) (not e!140555))))

(assert (=> b!205416 e!140555))

(declare-fun lt!320861 () tuple2!17534)

(assert (=> b!205416 (= lt!320861 lt!320880)))

(assert (=> b!205416 (= lt!320857 (appendBitsLSBFirstLoopTR!0 (_2!9419 lt!320861) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!320860 () Unit!14628)

(assert (=> b!205416 (= lt!320860 (lemmaIsPrefixTransitive!0 (_2!9419 lt!320287) (_2!9419 lt!320861) (_2!9419 lt!320857)))))

(assert (=> b!205416 call!3255))

(declare-fun lt!320830 () Unit!14628)

(assert (=> b!205416 (= lt!320830 lt!320860)))

(assert (=> b!205416 (invariant!0 (currentBit!9549 (_2!9419 lt!320287)) (currentByte!9554 (_2!9419 lt!320287)) (size!4552 (buf!5057 (_2!9419 lt!320861))))))

(declare-fun lt!320841 () BitStream!8212)

(assert (=> b!205416 (= lt!320841 (BitStream!8213 (buf!5057 (_2!9419 lt!320861)) (currentByte!9554 (_2!9419 lt!320287)) (currentBit!9549 (_2!9419 lt!320287))))))

(assert (=> b!205416 (invariant!0 (currentBit!9549 lt!320841) (currentByte!9554 lt!320841) (size!4552 (buf!5057 (_2!9419 lt!320857))))))

(declare-fun lt!320878 () BitStream!8212)

(assert (=> b!205416 (= lt!320878 (BitStream!8213 (buf!5057 (_2!9419 lt!320857)) (currentByte!9554 lt!320841) (currentBit!9549 lt!320841)))))

(assert (=> b!205416 (= lt!320874 (readBitPure!0 lt!320841))))

(assert (=> b!205416 (= lt!320827 (readBitPure!0 lt!320878))))

(declare-fun lt!320848 () Unit!14628)

(declare-fun readBitPrefixLemma!0 (BitStream!8212 BitStream!8212) Unit!14628)

(assert (=> b!205416 (= lt!320848 (readBitPrefixLemma!0 lt!320841 (_2!9419 lt!320857)))))

(declare-fun res!172190 () Bool)

(assert (=> b!205416 (= res!172190 (= (bitIndex!0 (size!4552 (buf!5057 (_1!9420 lt!320874))) (currentByte!9554 (_1!9420 lt!320874)) (currentBit!9549 (_1!9420 lt!320874))) (bitIndex!0 (size!4552 (buf!5057 (_1!9420 lt!320827))) (currentByte!9554 (_1!9420 lt!320827)) (currentBit!9549 (_1!9420 lt!320827)))))))

(assert (=> b!205416 (=> (not res!172190) (not e!140549))))

(assert (=> b!205416 e!140549))

(declare-fun lt!320873 () Unit!14628)

(assert (=> b!205416 (= lt!320873 lt!320848)))

(declare-fun lt!320881 () tuple2!17556)

(declare-fun reader!0 (BitStream!8212 BitStream!8212) tuple2!17556)

(assert (=> b!205416 (= lt!320881 (reader!0 (_2!9419 lt!320287) (_2!9419 lt!320857)))))

(declare-fun lt!320836 () tuple2!17556)

(assert (=> b!205416 (= lt!320836 (reader!0 (_2!9419 lt!320861) (_2!9419 lt!320857)))))

(declare-fun lt!320879 () tuple2!17536)

(assert (=> b!205416 (= lt!320879 (readBitPure!0 (_1!9431 lt!320881)))))

(assert (=> b!205416 (= (_2!9420 lt!320879) lt!320828)))

(declare-fun lt!320858 () Unit!14628)

(declare-fun Unit!14646 () Unit!14628)

(assert (=> b!205416 (= lt!320858 Unit!14646)))

(declare-fun lt!320834 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!205416 (= lt!320834 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!320856 () (_ BitVec 64))

(assert (=> b!205416 (= lt!320856 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!320839 () Unit!14628)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8212 array!10355 (_ BitVec 64)) Unit!14628)

(assert (=> b!205416 (= lt!320839 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9419 lt!320287) (buf!5057 (_2!9419 lt!320857)) lt!320856))))

(assert (=> b!205416 (validate_offset_bits!1 ((_ sign_extend 32) (size!4552 (buf!5057 (_2!9419 lt!320857)))) ((_ sign_extend 32) (currentByte!9554 (_2!9419 lt!320287))) ((_ sign_extend 32) (currentBit!9549 (_2!9419 lt!320287))) lt!320856)))

(declare-fun lt!320864 () Unit!14628)

(assert (=> b!205416 (= lt!320864 lt!320839)))

(declare-fun lt!320850 () tuple2!17554)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8212 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17554)

(assert (=> b!205416 (= lt!320850 (readNBitsLSBFirstsLoopPure!0 (_1!9431 lt!320881) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!320834))))

(declare-fun lt!320875 () (_ BitVec 64))

(assert (=> b!205416 (= lt!320875 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!320871 () Unit!14628)

(assert (=> b!205416 (= lt!320871 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9419 lt!320861) (buf!5057 (_2!9419 lt!320857)) lt!320875))))

(assert (=> b!205416 (validate_offset_bits!1 ((_ sign_extend 32) (size!4552 (buf!5057 (_2!9419 lt!320857)))) ((_ sign_extend 32) (currentByte!9554 (_2!9419 lt!320861))) ((_ sign_extend 32) (currentBit!9549 (_2!9419 lt!320861))) lt!320875)))

(declare-fun lt!320853 () Unit!14628)

(assert (=> b!205416 (= lt!320853 lt!320871)))

(declare-fun lt!320847 () tuple2!17554)

(assert (=> b!205416 (= lt!320847 (readNBitsLSBFirstsLoopPure!0 (_1!9431 lt!320836) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!320834 (ite (_2!9420 lt!320879) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!320833 () tuple2!17554)

(assert (=> b!205416 (= lt!320833 (readNBitsLSBFirstsLoopPure!0 (_1!9431 lt!320881) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!320834))))

(declare-fun c!10168 () Bool)

(assert (=> b!205416 (= c!10168 (_2!9420 (readBitPure!0 (_1!9431 lt!320881))))))

(declare-fun lt!320869 () tuple2!17554)

(declare-fun withMovedBitIndex!0 (BitStream!8212 (_ BitVec 64)) BitStream!8212)

(assert (=> b!205416 (= lt!320869 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9431 lt!320881) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!320834 e!140550)))))

(declare-fun lt!320882 () Unit!14628)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8212 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!14628)

(assert (=> b!205416 (= lt!320882 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9431 lt!320881) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!320834))))

(assert (=> b!205416 (and (= (_2!9430 lt!320833) (_2!9430 lt!320869)) (= (_1!9430 lt!320833) (_1!9430 lt!320869)))))

(declare-fun lt!320870 () Unit!14628)

(assert (=> b!205416 (= lt!320870 lt!320882)))

(assert (=> b!205416 (= (_1!9431 lt!320881) (withMovedBitIndex!0 (_2!9431 lt!320881) (bvsub (bitIndex!0 (size!4552 (buf!5057 (_2!9419 lt!320287))) (currentByte!9554 (_2!9419 lt!320287)) (currentBit!9549 (_2!9419 lt!320287))) (bitIndex!0 (size!4552 (buf!5057 (_2!9419 lt!320857))) (currentByte!9554 (_2!9419 lt!320857)) (currentBit!9549 (_2!9419 lt!320857))))))))

(declare-fun lt!320867 () Unit!14628)

(declare-fun Unit!14647 () Unit!14628)

(assert (=> b!205416 (= lt!320867 Unit!14647)))

(assert (=> b!205416 (= (_1!9431 lt!320836) (withMovedBitIndex!0 (_2!9431 lt!320836) (bvsub (bitIndex!0 (size!4552 (buf!5057 (_2!9419 lt!320861))) (currentByte!9554 (_2!9419 lt!320861)) (currentBit!9549 (_2!9419 lt!320861))) (bitIndex!0 (size!4552 (buf!5057 (_2!9419 lt!320857))) (currentByte!9554 (_2!9419 lt!320857)) (currentBit!9549 (_2!9419 lt!320857))))))))

(declare-fun lt!320859 () Unit!14628)

(declare-fun Unit!14648 () Unit!14628)

(assert (=> b!205416 (= lt!320859 Unit!14648)))

(assert (=> b!205416 (= (bitIndex!0 (size!4552 (buf!5057 (_2!9419 lt!320287))) (currentByte!9554 (_2!9419 lt!320287)) (currentBit!9549 (_2!9419 lt!320287))) (bvsub (bitIndex!0 (size!4552 (buf!5057 (_2!9419 lt!320861))) (currentByte!9554 (_2!9419 lt!320861)) (currentBit!9549 (_2!9419 lt!320861))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!320840 () Unit!14628)

(declare-fun Unit!14649 () Unit!14628)

(assert (=> b!205416 (= lt!320840 Unit!14649)))

(assert (=> b!205416 (= (_2!9430 lt!320850) (_2!9430 lt!320847))))

(declare-fun lt!320854 () Unit!14628)

(declare-fun Unit!14650 () Unit!14628)

(assert (=> b!205416 (= lt!320854 Unit!14650)))

(assert (=> b!205416 (invariant!0 (currentBit!9549 (_2!9419 lt!320857)) (currentByte!9554 (_2!9419 lt!320857)) (size!4552 (buf!5057 (_2!9419 lt!320857))))))

(declare-fun lt!320862 () Unit!14628)

(declare-fun Unit!14651 () Unit!14628)

(assert (=> b!205416 (= lt!320862 Unit!14651)))

(assert (=> b!205416 (= (size!4552 (buf!5057 (_2!9419 lt!320287))) (size!4552 (buf!5057 (_2!9419 lt!320857))))))

(declare-fun lt!320842 () Unit!14628)

(declare-fun Unit!14652 () Unit!14628)

(assert (=> b!205416 (= lt!320842 Unit!14652)))

(assert (=> b!205416 (= (bitIndex!0 (size!4552 (buf!5057 (_2!9419 lt!320857))) (currentByte!9554 (_2!9419 lt!320857)) (currentBit!9549 (_2!9419 lt!320857))) (bvsub (bvadd (bitIndex!0 (size!4552 (buf!5057 (_2!9419 lt!320287))) (currentByte!9554 (_2!9419 lt!320287)) (currentBit!9549 (_2!9419 lt!320287))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!320831 () Unit!14628)

(declare-fun Unit!14653 () Unit!14628)

(assert (=> b!205416 (= lt!320831 Unit!14653)))

(declare-fun lt!320876 () Unit!14628)

(declare-fun Unit!14654 () Unit!14628)

(assert (=> b!205416 (= lt!320876 Unit!14654)))

(assert (=> b!205416 (= lt!320849 (reader!0 (_2!9419 lt!320287) (_2!9419 lt!320857)))))

(declare-fun lt!320846 () (_ BitVec 64))

(assert (=> b!205416 (= lt!320846 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!320845 () Unit!14628)

(assert (=> b!205416 (= lt!320845 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9419 lt!320287) (buf!5057 (_2!9419 lt!320857)) lt!320846))))

(assert (=> b!205416 (validate_offset_bits!1 ((_ sign_extend 32) (size!4552 (buf!5057 (_2!9419 lt!320857)))) ((_ sign_extend 32) (currentByte!9554 (_2!9419 lt!320287))) ((_ sign_extend 32) (currentBit!9549 (_2!9419 lt!320287))) lt!320846)))

(declare-fun lt!320855 () Unit!14628)

(assert (=> b!205416 (= lt!320855 lt!320845)))

(assert (=> b!205416 (= lt!320872 (readNBitsLSBFirstsLoopPure!0 (_1!9431 lt!320849) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!172180 () Bool)

(assert (=> b!205416 (= res!172180 (= (_2!9430 lt!320872) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!205416 (=> (not res!172180) (not e!140552))))

(assert (=> b!205416 e!140552))

(declare-fun lt!320877 () Unit!14628)

(declare-fun Unit!14655 () Unit!14628)

(assert (=> b!205416 (= lt!320877 Unit!14655)))

(declare-fun d!69919 () Bool)

(assert (=> d!69919 e!140551))

(declare-fun res!172185 () Bool)

(assert (=> d!69919 (=> (not res!172185) (not e!140551))))

(assert (=> d!69919 (= res!172185 (invariant!0 (currentBit!9549 (_2!9419 lt!320829)) (currentByte!9554 (_2!9419 lt!320829)) (size!4552 (buf!5057 (_2!9419 lt!320829)))))))

(assert (=> d!69919 (= lt!320829 e!140554)))

(assert (=> d!69919 (= c!10169 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!69919 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!69919 (= (appendBitsLSBFirstLoopTR!0 (_2!9419 lt!320287) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!320829)))

(declare-fun b!205417 () Bool)

(declare-fun e!140547 () Bool)

(declare-fun lt!320852 () (_ BitVec 64))

(assert (=> b!205417 (= e!140547 (validate_offset_bits!1 ((_ sign_extend 32) (size!4552 (buf!5057 (_2!9419 lt!320287)))) ((_ sign_extend 32) (currentByte!9554 (_2!9419 lt!320287))) ((_ sign_extend 32) (currentBit!9549 (_2!9419 lt!320287))) lt!320852))))

(declare-fun b!205418 () Bool)

(assert (=> b!205418 (= e!140553 (= (bitIndex!0 (size!4552 (buf!5057 (_1!9420 lt!320837))) (currentByte!9554 (_1!9420 lt!320837)) (currentBit!9549 (_1!9420 lt!320837))) (bitIndex!0 (size!4552 (buf!5057 (_2!9419 lt!320880))) (currentByte!9554 (_2!9419 lt!320880)) (currentBit!9549 (_2!9419 lt!320880)))))))

(declare-fun b!205419 () Bool)

(assert (=> b!205419 (= e!140551 e!140548)))

(declare-fun res!172188 () Bool)

(assert (=> b!205419 (=> (not res!172188) (not e!140548))))

(assert (=> b!205419 (= res!172188 (= (_2!9430 lt!320868) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!205419 (= lt!320868 (readNBitsLSBFirstsLoopPure!0 (_1!9431 lt!320863) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!320851 () Unit!14628)

(declare-fun lt!320844 () Unit!14628)

(assert (=> b!205419 (= lt!320851 lt!320844)))

(assert (=> b!205419 (validate_offset_bits!1 ((_ sign_extend 32) (size!4552 (buf!5057 (_2!9419 lt!320829)))) ((_ sign_extend 32) (currentByte!9554 (_2!9419 lt!320287))) ((_ sign_extend 32) (currentBit!9549 (_2!9419 lt!320287))) lt!320852)))

(assert (=> b!205419 (= lt!320844 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9419 lt!320287) (buf!5057 (_2!9419 lt!320829)) lt!320852))))

(assert (=> b!205419 e!140547))

(declare-fun res!172181 () Bool)

(assert (=> b!205419 (=> (not res!172181) (not e!140547))))

(assert (=> b!205419 (= res!172181 (and (= (size!4552 (buf!5057 (_2!9419 lt!320287))) (size!4552 (buf!5057 (_2!9419 lt!320829)))) (bvsge lt!320852 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!205419 (= lt!320852 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!205419 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!205419 (= lt!320863 (reader!0 (_2!9419 lt!320287) (_2!9419 lt!320829)))))

(declare-fun b!205420 () Bool)

(assert (=> b!205420 (= e!140550 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (= (and d!69919 c!10169) b!205408))

(assert (= (and d!69919 (not c!10169)) b!205416))

(assert (= (and b!205416 res!172189) b!205409))

(assert (= (and b!205409 res!172186) b!205413))

(assert (= (and b!205413 res!172187) b!205412))

(assert (= (and b!205412 res!172191) b!205418))

(assert (= (and b!205416 res!172190) b!205411))

(assert (= (and b!205416 c!10168) b!205406))

(assert (= (and b!205416 (not c!10168)) b!205420))

(assert (= (and b!205416 res!172180) b!205414))

(assert (= (or b!205408 b!205416) bm!3252))

(assert (= (and d!69919 res!172185) b!205415))

(assert (= (and b!205415 res!172183) b!205405))

(assert (= (and b!205405 res!172182) b!205407))

(assert (= (and b!205407 res!172184) b!205419))

(assert (= (and b!205419 res!172181) b!205417))

(assert (= (and b!205419 res!172188) b!205410))

(declare-fun m!316581 () Bool)

(assert (=> b!205405 m!316581))

(assert (=> b!205405 m!316235))

(declare-fun m!316583 () Bool)

(assert (=> b!205409 m!316583))

(assert (=> b!205409 m!316235))

(declare-fun m!316585 () Bool)

(assert (=> b!205413 m!316585))

(declare-fun m!316587 () Bool)

(assert (=> bm!3252 m!316587))

(declare-fun m!316589 () Bool)

(assert (=> b!205407 m!316589))

(declare-fun m!316591 () Bool)

(assert (=> b!205419 m!316591))

(declare-fun m!316593 () Bool)

(assert (=> b!205419 m!316593))

(declare-fun m!316595 () Bool)

(assert (=> b!205419 m!316595))

(declare-fun m!316597 () Bool)

(assert (=> b!205419 m!316597))

(declare-fun m!316599 () Bool)

(assert (=> b!205419 m!316599))

(declare-fun m!316601 () Bool)

(assert (=> b!205419 m!316601))

(declare-fun m!316603 () Bool)

(assert (=> d!69919 m!316603))

(declare-fun m!316605 () Bool)

(assert (=> b!205408 m!316605))

(declare-fun m!316607 () Bool)

(assert (=> b!205418 m!316607))

(assert (=> b!205418 m!316583))

(declare-fun m!316609 () Bool)

(assert (=> b!205416 m!316609))

(declare-fun m!316611 () Bool)

(assert (=> b!205416 m!316611))

(declare-fun m!316613 () Bool)

(assert (=> b!205416 m!316613))

(assert (=> b!205416 m!316235))

(declare-fun m!316615 () Bool)

(assert (=> b!205416 m!316615))

(declare-fun m!316617 () Bool)

(assert (=> b!205416 m!316617))

(assert (=> b!205416 m!316591))

(declare-fun m!316619 () Bool)

(assert (=> b!205416 m!316619))

(assert (=> b!205416 m!316593))

(declare-fun m!316621 () Bool)

(assert (=> b!205416 m!316621))

(declare-fun m!316623 () Bool)

(assert (=> b!205416 m!316623))

(declare-fun m!316625 () Bool)

(assert (=> b!205416 m!316625))

(declare-fun m!316627 () Bool)

(assert (=> b!205416 m!316627))

(declare-fun m!316629 () Bool)

(assert (=> b!205416 m!316629))

(declare-fun m!316631 () Bool)

(assert (=> b!205416 m!316631))

(declare-fun m!316633 () Bool)

(assert (=> b!205416 m!316633))

(declare-fun m!316635 () Bool)

(assert (=> b!205416 m!316635))

(declare-fun m!316637 () Bool)

(assert (=> b!205416 m!316637))

(declare-fun m!316639 () Bool)

(assert (=> b!205416 m!316639))

(declare-fun m!316641 () Bool)

(assert (=> b!205416 m!316641))

(declare-fun m!316643 () Bool)

(assert (=> b!205416 m!316643))

(assert (=> b!205416 m!316633))

(declare-fun m!316645 () Bool)

(assert (=> b!205416 m!316645))

(declare-fun m!316647 () Bool)

(assert (=> b!205416 m!316647))

(declare-fun m!316649 () Bool)

(assert (=> b!205416 m!316649))

(declare-fun m!316651 () Bool)

(assert (=> b!205416 m!316651))

(declare-fun m!316653 () Bool)

(assert (=> b!205416 m!316653))

(declare-fun m!316655 () Bool)

(assert (=> b!205416 m!316655))

(declare-fun m!316657 () Bool)

(assert (=> b!205416 m!316657))

(declare-fun m!316659 () Bool)

(assert (=> b!205416 m!316659))

(declare-fun m!316661 () Bool)

(assert (=> b!205416 m!316661))

(declare-fun m!316663 () Bool)

(assert (=> b!205416 m!316663))

(declare-fun m!316665 () Bool)

(assert (=> b!205416 m!316665))

(declare-fun m!316667 () Bool)

(assert (=> b!205416 m!316667))

(declare-fun m!316669 () Bool)

(assert (=> b!205417 m!316669))

(declare-fun m!316671 () Bool)

(assert (=> b!205412 m!316671))

(assert (=> b!205412 m!316671))

(declare-fun m!316673 () Bool)

(assert (=> b!205412 m!316673))

(assert (=> b!205043 d!69919))

(assert (=> b!205033 d!69901))

(assert (=> b!205033 d!69903))

(declare-fun d!69981 () Bool)

(assert (=> d!69981 (= (invariant!0 (currentBit!9549 (_2!9419 lt!320285)) (currentByte!9554 (_2!9419 lt!320285)) (size!4552 (buf!5057 (_2!9419 lt!320285)))) (and (bvsge (currentBit!9549 (_2!9419 lt!320285)) #b00000000000000000000000000000000) (bvslt (currentBit!9549 (_2!9419 lt!320285)) #b00000000000000000000000000001000) (bvsge (currentByte!9554 (_2!9419 lt!320285)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9554 (_2!9419 lt!320285)) (size!4552 (buf!5057 (_2!9419 lt!320285)))) (and (= (currentBit!9549 (_2!9419 lt!320285)) #b00000000000000000000000000000000) (= (currentByte!9554 (_2!9419 lt!320285)) (size!4552 (buf!5057 (_2!9419 lt!320285))))))))))

(assert (=> b!205039 d!69981))

(declare-datatypes ((tuple4!274 0))(
  ( (tuple4!275 (_1!9432 (_ BitVec 32)) (_2!9432 (_ BitVec 32)) (_3!653 (_ BitVec 32)) (_4!137 (_ BitVec 32))) )
))
(declare-fun lt!320890 () tuple4!274)

(declare-fun e!140568 () Bool)

(declare-fun lt!320889 () (_ BitVec 32))

(declare-fun b!205435 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!205435 (= e!140568 (byteRangesEq!0 (select (arr!5482 (buf!5057 (_2!9419 lt!320287))) (_4!137 lt!320890)) (select (arr!5482 (buf!5057 (_2!9419 lt!320285))) (_4!137 lt!320890)) #b00000000000000000000000000000000 lt!320889))))

(declare-fun b!205436 () Bool)

(declare-fun e!140570 () Bool)

(declare-fun e!140573 () Bool)

(assert (=> b!205436 (= e!140570 e!140573)))

(declare-fun res!172203 () Bool)

(assert (=> b!205436 (=> (not res!172203) (not e!140573))))

(declare-fun e!140571 () Bool)

(assert (=> b!205436 (= res!172203 e!140571)))

(declare-fun res!172206 () Bool)

(assert (=> b!205436 (=> res!172206 e!140571)))

(assert (=> b!205436 (= res!172206 (bvsge (_1!9432 lt!320890) (_2!9432 lt!320890)))))

(assert (=> b!205436 (= lt!320889 ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!4552 (buf!5057 (_2!9419 lt!320287))) (currentByte!9554 thiss!1204) (currentBit!9549 thiss!1204))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!320891 () (_ BitVec 32))

(assert (=> b!205436 (= lt!320891 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!274)

(assert (=> b!205436 (= lt!320890 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!4552 (buf!5057 (_2!9419 lt!320287))) (currentByte!9554 thiss!1204) (currentBit!9549 thiss!1204)))))))

(declare-fun b!205437 () Bool)

(declare-fun e!140569 () Bool)

(declare-fun e!140572 () Bool)

(assert (=> b!205437 (= e!140569 e!140572)))

(declare-fun res!172204 () Bool)

(declare-fun call!3258 () Bool)

(assert (=> b!205437 (= res!172204 call!3258)))

(assert (=> b!205437 (=> (not res!172204) (not e!140572))))

(declare-fun b!205438 () Bool)

(declare-fun res!172202 () Bool)

(assert (=> b!205438 (= res!172202 (= lt!320889 #b00000000000000000000000000000000))))

(assert (=> b!205438 (=> res!172202 e!140568)))

(assert (=> b!205438 (= e!140572 e!140568)))

(declare-fun b!205439 () Bool)

(assert (=> b!205439 (= e!140573 e!140569)))

(declare-fun c!10172 () Bool)

(assert (=> b!205439 (= c!10172 (= (_3!653 lt!320890) (_4!137 lt!320890)))))

(declare-fun d!69983 () Bool)

(declare-fun res!172205 () Bool)

(assert (=> d!69983 (=> res!172205 e!140570)))

(assert (=> d!69983 (= res!172205 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!4552 (buf!5057 (_2!9419 lt!320287))) (currentByte!9554 thiss!1204) (currentBit!9549 thiss!1204)))))))

(assert (=> d!69983 (= (arrayBitRangesEq!0 (buf!5057 (_2!9419 lt!320287)) (buf!5057 (_2!9419 lt!320285)) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!4552 (buf!5057 (_2!9419 lt!320287))) (currentByte!9554 thiss!1204) (currentBit!9549 thiss!1204)))) e!140570)))

(declare-fun bm!3255 () Bool)

(assert (=> bm!3255 (= call!3258 (byteRangesEq!0 (select (arr!5482 (buf!5057 (_2!9419 lt!320287))) (_3!653 lt!320890)) (select (arr!5482 (buf!5057 (_2!9419 lt!320285))) (_3!653 lt!320890)) lt!320891 (ite c!10172 lt!320889 #b00000000000000000000000000001000)))))

(declare-fun b!205440 () Bool)

(assert (=> b!205440 (= e!140569 call!3258)))

(declare-fun b!205441 () Bool)

(declare-fun arrayRangesEq!699 (array!10355 array!10355 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!205441 (= e!140571 (arrayRangesEq!699 (buf!5057 (_2!9419 lt!320287)) (buf!5057 (_2!9419 lt!320285)) (_1!9432 lt!320890) (_2!9432 lt!320890)))))

(assert (= (and d!69983 (not res!172205)) b!205436))

(assert (= (and b!205436 (not res!172206)) b!205441))

(assert (= (and b!205436 res!172203) b!205439))

(assert (= (and b!205439 c!10172) b!205440))

(assert (= (and b!205439 (not c!10172)) b!205437))

(assert (= (and b!205437 res!172204) b!205438))

(assert (= (and b!205438 (not res!172202)) b!205435))

(assert (= (or b!205440 b!205437) bm!3255))

(declare-fun m!316675 () Bool)

(assert (=> b!205435 m!316675))

(declare-fun m!316677 () Bool)

(assert (=> b!205435 m!316677))

(assert (=> b!205435 m!316675))

(assert (=> b!205435 m!316677))

(declare-fun m!316679 () Bool)

(assert (=> b!205435 m!316679))

(declare-fun m!316681 () Bool)

(assert (=> b!205436 m!316681))

(declare-fun m!316683 () Bool)

(assert (=> bm!3255 m!316683))

(declare-fun m!316685 () Bool)

(assert (=> bm!3255 m!316685))

(assert (=> bm!3255 m!316683))

(assert (=> bm!3255 m!316685))

(declare-fun m!316687 () Bool)

(assert (=> bm!3255 m!316687))

(declare-fun m!316689 () Bool)

(assert (=> b!205441 m!316689))

(assert (=> b!205040 d!69983))

(declare-fun d!69985 () Bool)

(declare-fun e!140574 () Bool)

(assert (=> d!69985 e!140574))

(declare-fun res!172207 () Bool)

(assert (=> d!69985 (=> (not res!172207) (not e!140574))))

(declare-fun lt!320897 () (_ BitVec 64))

(declare-fun lt!320892 () (_ BitVec 64))

(declare-fun lt!320896 () (_ BitVec 64))

(assert (=> d!69985 (= res!172207 (= lt!320897 (bvsub lt!320896 lt!320892)))))

(assert (=> d!69985 (or (= (bvand lt!320896 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!320892 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!320896 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!320896 lt!320892) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!69985 (= lt!320892 (remainingBits!0 ((_ sign_extend 32) (size!4552 (buf!5057 (_2!9419 lt!320287)))) ((_ sign_extend 32) (currentByte!9554 thiss!1204)) ((_ sign_extend 32) (currentBit!9549 thiss!1204))))))

(declare-fun lt!320894 () (_ BitVec 64))

(declare-fun lt!320895 () (_ BitVec 64))

(assert (=> d!69985 (= lt!320896 (bvmul lt!320894 lt!320895))))

(assert (=> d!69985 (or (= lt!320894 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!320895 (bvsdiv (bvmul lt!320894 lt!320895) lt!320894)))))

(assert (=> d!69985 (= lt!320895 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69985 (= lt!320894 ((_ sign_extend 32) (size!4552 (buf!5057 (_2!9419 lt!320287)))))))

(assert (=> d!69985 (= lt!320897 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9554 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9549 thiss!1204))))))

(assert (=> d!69985 (invariant!0 (currentBit!9549 thiss!1204) (currentByte!9554 thiss!1204) (size!4552 (buf!5057 (_2!9419 lt!320287))))))

(assert (=> d!69985 (= (bitIndex!0 (size!4552 (buf!5057 (_2!9419 lt!320287))) (currentByte!9554 thiss!1204) (currentBit!9549 thiss!1204)) lt!320897)))

(declare-fun b!205442 () Bool)

(declare-fun res!172208 () Bool)

(assert (=> b!205442 (=> (not res!172208) (not e!140574))))

(assert (=> b!205442 (= res!172208 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!320897))))

(declare-fun b!205443 () Bool)

(declare-fun lt!320893 () (_ BitVec 64))

(assert (=> b!205443 (= e!140574 (bvsle lt!320897 (bvmul lt!320893 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!205443 (or (= lt!320893 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!320893 #b0000000000000000000000000000000000000000000000000000000000001000) lt!320893)))))

(assert (=> b!205443 (= lt!320893 ((_ sign_extend 32) (size!4552 (buf!5057 (_2!9419 lt!320287)))))))

(assert (= (and d!69985 res!172207) b!205442))

(assert (= (and b!205442 res!172208) b!205443))

(assert (=> d!69985 m!316379))

(assert (=> d!69985 m!316215))

(assert (=> b!205040 d!69985))

(declare-fun d!69987 () Bool)

(assert (=> d!69987 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9549 thiss!1204) (currentByte!9554 thiss!1204) (size!4552 (buf!5057 thiss!1204))))))

(declare-fun bs!17207 () Bool)

(assert (= bs!17207 d!69987))

(assert (=> bs!17207 m!316221))

(assert (=> start!43422 d!69987))

(assert (=> b!205041 d!69909))

(push 1)

(assert (not b!205187))

(assert (not d!69919))

(assert (not b!205405))

(assert (not b!205419))

(assert (not b!205413))

(assert (not b!205407))

(assert (not b!205441))

(assert (not d!69903))

(assert (not d!69905))

(assert (not b!205202))

(assert (not b!205435))

(assert (not b!205416))

(assert (not d!69917))

(assert (not d!69901))

(assert (not b!205227))

(assert (not d!69985))

(assert (not b!205225))

(assert (not b!205200))

(assert (not bm!3255))

(assert (not b!205219))

(assert (not b!205217))

(assert (not bm!3252))

(assert (not d!69895))

(assert (not b!205218))

(assert (not b!205220))

(assert (not b!205412))

(assert (not b!205408))

(assert (not d!69913))

(assert (not b!205417))

(assert (not b!205216))

(assert (not d!69887))

(assert (not d!69893))

(assert (not b!205409))

(assert (not d!69885))

(assert (not d!69987))

(assert (not b!205418))

(assert (not b!205436))

(assert (not b!205222))

(assert (not d!69889))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

