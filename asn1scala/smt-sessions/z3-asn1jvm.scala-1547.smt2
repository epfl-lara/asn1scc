; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43424 () Bool)

(assert start!43424)

(declare-fun b!205082 () Bool)

(declare-fun e!140354 () Bool)

(declare-datatypes ((array!10357 0))(
  ( (array!10358 (arr!5483 (Array (_ BitVec 32) (_ BitVec 8))) (size!4553 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8214 0))(
  ( (BitStream!8215 (buf!5058 array!10357) (currentByte!9555 (_ BitVec 32)) (currentBit!9550 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8214)

(declare-fun array_inv!4294 (array!10357) Bool)

(assert (=> b!205082 (= e!140354 (array_inv!4294 (buf!5058 thiss!1204)))))

(declare-fun b!205083 () Bool)

(declare-fun e!140361 () Bool)

(declare-fun e!140355 () Bool)

(assert (=> b!205083 (= e!140361 e!140355)))

(declare-fun res!171900 () Bool)

(assert (=> b!205083 (=> res!171900 e!140355)))

(declare-datatypes ((Unit!14630 0))(
  ( (Unit!14631) )
))
(declare-datatypes ((tuple2!17538 0))(
  ( (tuple2!17539 (_1!9421 Unit!14630) (_2!9421 BitStream!8214)) )
))
(declare-fun lt!320318 () tuple2!17538)

(declare-fun lt!320322 () tuple2!17538)

(assert (=> b!205083 (= res!171900 (not (= (size!4553 (buf!5058 (_2!9421 lt!320318))) (size!4553 (buf!5058 (_2!9421 lt!320322))))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!205083 (invariant!0 (currentBit!9550 thiss!1204) (currentByte!9555 thiss!1204) (size!4553 (buf!5058 (_2!9421 lt!320318))))))

(declare-fun b!205084 () Bool)

(declare-fun res!171897 () Bool)

(assert (=> b!205084 (=> res!171897 e!140361)))

(declare-fun isPrefixOf!0 (BitStream!8214 BitStream!8214) Bool)

(assert (=> b!205084 (= res!171897 (not (isPrefixOf!0 (_2!9421 lt!320318) (_2!9421 lt!320322))))))

(declare-fun res!171898 () Bool)

(declare-fun e!140358 () Bool)

(assert (=> start!43424 (=> (not res!171898) (not e!140358))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!43424 (= res!171898 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!43424 e!140358))

(assert (=> start!43424 true))

(declare-fun inv!12 (BitStream!8214) Bool)

(assert (=> start!43424 (and (inv!12 thiss!1204) e!140354)))

(declare-fun b!205085 () Bool)

(declare-fun res!171902 () Bool)

(assert (=> b!205085 (=> res!171902 e!140355)))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!205085 (= res!171902 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!4553 (buf!5058 (_2!9421 lt!320318)))) ((_ sign_extend 32) (currentByte!9555 thiss!1204)) ((_ sign_extend 32) (currentBit!9550 thiss!1204)))))))

(declare-fun b!205086 () Bool)

(declare-fun res!171895 () Bool)

(assert (=> b!205086 (=> res!171895 e!140361)))

(assert (=> b!205086 (= res!171895 (not (invariant!0 (currentBit!9550 (_2!9421 lt!320322)) (currentByte!9555 (_2!9421 lt!320322)) (size!4553 (buf!5058 (_2!9421 lt!320322))))))))

(declare-fun b!205087 () Bool)

(declare-fun e!140353 () Bool)

(declare-fun e!140360 () Bool)

(assert (=> b!205087 (= e!140353 e!140360)))

(declare-fun res!171903 () Bool)

(assert (=> b!205087 (=> (not res!171903) (not e!140360))))

(declare-datatypes ((tuple2!17540 0))(
  ( (tuple2!17541 (_1!9422 BitStream!8214) (_2!9422 Bool)) )
))
(declare-fun lt!320323 () tuple2!17540)

(declare-fun lt!320315 () Bool)

(assert (=> b!205087 (= res!171903 (and (= (_2!9422 lt!320323) lt!320315) (= (_1!9422 lt!320323) (_2!9421 lt!320318))))))

(declare-fun readBitPure!0 (BitStream!8214) tuple2!17540)

(declare-fun readerFrom!0 (BitStream!8214 (_ BitVec 32) (_ BitVec 32)) BitStream!8214)

(assert (=> b!205087 (= lt!320323 (readBitPure!0 (readerFrom!0 (_2!9421 lt!320318) (currentBit!9550 thiss!1204) (currentByte!9555 thiss!1204))))))

(declare-fun b!205088 () Bool)

(declare-fun res!171901 () Bool)

(assert (=> b!205088 (=> (not res!171901) (not e!140358))))

(assert (=> b!205088 (= res!171901 (not (= i!590 nBits!348)))))

(declare-fun b!205089 () Bool)

(declare-fun res!171896 () Bool)

(assert (=> b!205089 (=> (not res!171896) (not e!140353))))

(assert (=> b!205089 (= res!171896 (isPrefixOf!0 thiss!1204 (_2!9421 lt!320318)))))

(declare-fun b!205090 () Bool)

(declare-fun e!140356 () Bool)

(assert (=> b!205090 (= e!140358 (not e!140356))))

(declare-fun res!171907 () Bool)

(assert (=> b!205090 (=> res!171907 e!140356)))

(declare-fun lt!320319 () (_ BitVec 64))

(declare-fun lt!320324 () (_ BitVec 64))

(assert (=> b!205090 (= res!171907 (not (= lt!320319 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!320324))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!205090 (= lt!320319 (bitIndex!0 (size!4553 (buf!5058 (_2!9421 lt!320318))) (currentByte!9555 (_2!9421 lt!320318)) (currentBit!9550 (_2!9421 lt!320318))))))

(assert (=> b!205090 (= lt!320324 (bitIndex!0 (size!4553 (buf!5058 thiss!1204)) (currentByte!9555 thiss!1204) (currentBit!9550 thiss!1204)))))

(declare-fun e!140359 () Bool)

(assert (=> b!205090 e!140359))

(declare-fun res!171899 () Bool)

(assert (=> b!205090 (=> (not res!171899) (not e!140359))))

(assert (=> b!205090 (= res!171899 (= (size!4553 (buf!5058 thiss!1204)) (size!4553 (buf!5058 (_2!9421 lt!320318)))))))

(declare-fun appendBit!0 (BitStream!8214 Bool) tuple2!17538)

(assert (=> b!205090 (= lt!320318 (appendBit!0 thiss!1204 lt!320315))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!205090 (= lt!320315 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!205091 () Bool)

(assert (=> b!205091 (= e!140356 e!140361)))

(declare-fun res!171908 () Bool)

(assert (=> b!205091 (=> res!171908 e!140361)))

(declare-fun lt!320321 () (_ BitVec 64))

(assert (=> b!205091 (= res!171908 (not (= lt!320321 (bvsub (bvsub (bvadd lt!320319 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!205091 (= lt!320321 (bitIndex!0 (size!4553 (buf!5058 (_2!9421 lt!320322))) (currentByte!9555 (_2!9421 lt!320322)) (currentBit!9550 (_2!9421 lt!320322))))))

(assert (=> b!205091 (isPrefixOf!0 thiss!1204 (_2!9421 lt!320322))))

(declare-fun lt!320317 () Unit!14630)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8214 BitStream!8214 BitStream!8214) Unit!14630)

(assert (=> b!205091 (= lt!320317 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9421 lt!320318) (_2!9421 lt!320322)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8214 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17538)

(assert (=> b!205091 (= lt!320322 (appendBitsLSBFirstLoopTR!0 (_2!9421 lt!320318) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!205092 () Bool)

(declare-fun res!171904 () Bool)

(assert (=> b!205092 (=> (not res!171904) (not e!140358))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!205092 (= res!171904 (validate_offset_bits!1 ((_ sign_extend 32) (size!4553 (buf!5058 thiss!1204))) ((_ sign_extend 32) (currentByte!9555 thiss!1204)) ((_ sign_extend 32) (currentBit!9550 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!205093 () Bool)

(declare-fun res!171906 () Bool)

(assert (=> b!205093 (=> res!171906 e!140361)))

(assert (=> b!205093 (= res!171906 (or (not (= (size!4553 (buf!5058 (_2!9421 lt!320322))) (size!4553 (buf!5058 thiss!1204)))) (not (= lt!320321 (bvsub (bvadd lt!320324 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!205094 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10357 array!10357 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!205094 (= e!140355 (arrayBitRangesEq!0 (buf!5058 (_2!9421 lt!320318)) (buf!5058 (_2!9421 lt!320322)) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!4553 (buf!5058 (_2!9421 lt!320318))) (currentByte!9555 thiss!1204) (currentBit!9550 thiss!1204)))))))

(declare-fun b!205095 () Bool)

(declare-fun lt!320320 () (_ BitVec 64))

(assert (=> b!205095 (= e!140360 (= (bitIndex!0 (size!4553 (buf!5058 (_1!9422 lt!320323))) (currentByte!9555 (_1!9422 lt!320323)) (currentBit!9550 (_1!9422 lt!320323))) lt!320320))))

(declare-fun b!205096 () Bool)

(declare-fun res!171893 () Bool)

(assert (=> b!205096 (=> (not res!171893) (not e!140358))))

(assert (=> b!205096 (= res!171893 (invariant!0 (currentBit!9550 thiss!1204) (currentByte!9555 thiss!1204) (size!4553 (buf!5058 thiss!1204))))))

(declare-fun b!205097 () Bool)

(assert (=> b!205097 (= e!140359 e!140353)))

(declare-fun res!171905 () Bool)

(assert (=> b!205097 (=> (not res!171905) (not e!140353))))

(declare-fun lt!320316 () (_ BitVec 64))

(assert (=> b!205097 (= res!171905 (= lt!320320 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!320316)))))

(assert (=> b!205097 (= lt!320320 (bitIndex!0 (size!4553 (buf!5058 (_2!9421 lt!320318))) (currentByte!9555 (_2!9421 lt!320318)) (currentBit!9550 (_2!9421 lt!320318))))))

(assert (=> b!205097 (= lt!320316 (bitIndex!0 (size!4553 (buf!5058 thiss!1204)) (currentByte!9555 thiss!1204) (currentBit!9550 thiss!1204)))))

(declare-fun b!205098 () Bool)

(declare-fun res!171894 () Bool)

(assert (=> b!205098 (=> res!171894 e!140361)))

(assert (=> b!205098 (= res!171894 (not (isPrefixOf!0 thiss!1204 (_2!9421 lt!320318))))))

(assert (= (and start!43424 res!171898) b!205092))

(assert (= (and b!205092 res!171904) b!205096))

(assert (= (and b!205096 res!171893) b!205088))

(assert (= (and b!205088 res!171901) b!205090))

(assert (= (and b!205090 res!171899) b!205097))

(assert (= (and b!205097 res!171905) b!205089))

(assert (= (and b!205089 res!171896) b!205087))

(assert (= (and b!205087 res!171903) b!205095))

(assert (= (and b!205090 (not res!171907)) b!205091))

(assert (= (and b!205091 (not res!171908)) b!205086))

(assert (= (and b!205086 (not res!171895)) b!205093))

(assert (= (and b!205093 (not res!171906)) b!205084))

(assert (= (and b!205084 (not res!171897)) b!205098))

(assert (= (and b!205098 (not res!171894)) b!205083))

(assert (= (and b!205083 (not res!171900)) b!205085))

(assert (= (and b!205085 (not res!171902)) b!205094))

(assert (= start!43424 b!205082))

(declare-fun m!316257 () Bool)

(assert (=> b!205097 m!316257))

(declare-fun m!316259 () Bool)

(assert (=> b!205097 m!316259))

(declare-fun m!316261 () Bool)

(assert (=> b!205087 m!316261))

(assert (=> b!205087 m!316261))

(declare-fun m!316263 () Bool)

(assert (=> b!205087 m!316263))

(declare-fun m!316265 () Bool)

(assert (=> b!205083 m!316265))

(declare-fun m!316267 () Bool)

(assert (=> b!205082 m!316267))

(declare-fun m!316269 () Bool)

(assert (=> b!205095 m!316269))

(declare-fun m!316271 () Bool)

(assert (=> b!205084 m!316271))

(declare-fun m!316273 () Bool)

(assert (=> start!43424 m!316273))

(declare-fun m!316275 () Bool)

(assert (=> b!205094 m!316275))

(declare-fun m!316277 () Bool)

(assert (=> b!205094 m!316277))

(declare-fun m!316279 () Bool)

(assert (=> b!205085 m!316279))

(declare-fun m!316281 () Bool)

(assert (=> b!205089 m!316281))

(declare-fun m!316283 () Bool)

(assert (=> b!205096 m!316283))

(declare-fun m!316285 () Bool)

(assert (=> b!205092 m!316285))

(assert (=> b!205090 m!316257))

(assert (=> b!205090 m!316259))

(declare-fun m!316287 () Bool)

(assert (=> b!205090 m!316287))

(declare-fun m!316289 () Bool)

(assert (=> b!205086 m!316289))

(declare-fun m!316291 () Bool)

(assert (=> b!205091 m!316291))

(declare-fun m!316293 () Bool)

(assert (=> b!205091 m!316293))

(declare-fun m!316295 () Bool)

(assert (=> b!205091 m!316295))

(declare-fun m!316297 () Bool)

(assert (=> b!205091 m!316297))

(assert (=> b!205098 m!316281))

(check-sat (not b!205096) (not b!205091) (not start!43424) (not b!205095) (not b!205087) (not b!205084) (not b!205098) (not b!205092) (not b!205097) (not b!205089) (not b!205083) (not b!205085) (not b!205086) (not b!205090) (not b!205094) (not b!205082))
(check-sat)
(get-model)

(declare-fun d!69863 () Bool)

(assert (=> d!69863 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9550 thiss!1204) (currentByte!9555 thiss!1204) (size!4553 (buf!5058 thiss!1204))))))

(declare-fun bs!17193 () Bool)

(assert (= bs!17193 d!69863))

(assert (=> bs!17193 m!316283))

(assert (=> start!43424 d!69863))

(declare-fun d!69865 () Bool)

(declare-fun e!140391 () Bool)

(assert (=> d!69865 e!140391))

(declare-fun res!171962 () Bool)

(assert (=> d!69865 (=> (not res!171962) (not e!140391))))

(declare-fun lt!320370 () (_ BitVec 64))

(declare-fun lt!320367 () (_ BitVec 64))

(declare-fun lt!320371 () (_ BitVec 64))

(assert (=> d!69865 (= res!171962 (= lt!320370 (bvsub lt!320371 lt!320367)))))

(assert (=> d!69865 (or (= (bvand lt!320371 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!320367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!320371 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!320371 lt!320367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!69865 (= lt!320367 (remainingBits!0 ((_ sign_extend 32) (size!4553 (buf!5058 (_2!9421 lt!320318)))) ((_ sign_extend 32) (currentByte!9555 (_2!9421 lt!320318))) ((_ sign_extend 32) (currentBit!9550 (_2!9421 lt!320318)))))))

(declare-fun lt!320372 () (_ BitVec 64))

(declare-fun lt!320369 () (_ BitVec 64))

(assert (=> d!69865 (= lt!320371 (bvmul lt!320372 lt!320369))))

(assert (=> d!69865 (or (= lt!320372 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!320369 (bvsdiv (bvmul lt!320372 lt!320369) lt!320372)))))

(assert (=> d!69865 (= lt!320369 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69865 (= lt!320372 ((_ sign_extend 32) (size!4553 (buf!5058 (_2!9421 lt!320318)))))))

(assert (=> d!69865 (= lt!320370 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9555 (_2!9421 lt!320318))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9550 (_2!9421 lt!320318)))))))

(assert (=> d!69865 (invariant!0 (currentBit!9550 (_2!9421 lt!320318)) (currentByte!9555 (_2!9421 lt!320318)) (size!4553 (buf!5058 (_2!9421 lt!320318))))))

(assert (=> d!69865 (= (bitIndex!0 (size!4553 (buf!5058 (_2!9421 lt!320318))) (currentByte!9555 (_2!9421 lt!320318)) (currentBit!9550 (_2!9421 lt!320318))) lt!320370)))

(declare-fun b!205154 () Bool)

(declare-fun res!171961 () Bool)

(assert (=> b!205154 (=> (not res!171961) (not e!140391))))

(assert (=> b!205154 (= res!171961 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!320370))))

(declare-fun b!205155 () Bool)

(declare-fun lt!320368 () (_ BitVec 64))

(assert (=> b!205155 (= e!140391 (bvsle lt!320370 (bvmul lt!320368 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!205155 (or (= lt!320368 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!320368 #b0000000000000000000000000000000000000000000000000000000000001000) lt!320368)))))

(assert (=> b!205155 (= lt!320368 ((_ sign_extend 32) (size!4553 (buf!5058 (_2!9421 lt!320318)))))))

(assert (= (and d!69865 res!171962) b!205154))

(assert (= (and b!205154 res!171961) b!205155))

(declare-fun m!316341 () Bool)

(assert (=> d!69865 m!316341))

(declare-fun m!316343 () Bool)

(assert (=> d!69865 m!316343))

(assert (=> b!205090 d!69865))

(declare-fun d!69867 () Bool)

(declare-fun e!140392 () Bool)

(assert (=> d!69867 e!140392))

(declare-fun res!171964 () Bool)

(assert (=> d!69867 (=> (not res!171964) (not e!140392))))

(declare-fun lt!320373 () (_ BitVec 64))

(declare-fun lt!320377 () (_ BitVec 64))

(declare-fun lt!320376 () (_ BitVec 64))

(assert (=> d!69867 (= res!171964 (= lt!320376 (bvsub lt!320377 lt!320373)))))

(assert (=> d!69867 (or (= (bvand lt!320377 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!320373 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!320377 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!320377 lt!320373) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!69867 (= lt!320373 (remainingBits!0 ((_ sign_extend 32) (size!4553 (buf!5058 thiss!1204))) ((_ sign_extend 32) (currentByte!9555 thiss!1204)) ((_ sign_extend 32) (currentBit!9550 thiss!1204))))))

(declare-fun lt!320378 () (_ BitVec 64))

(declare-fun lt!320375 () (_ BitVec 64))

(assert (=> d!69867 (= lt!320377 (bvmul lt!320378 lt!320375))))

(assert (=> d!69867 (or (= lt!320378 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!320375 (bvsdiv (bvmul lt!320378 lt!320375) lt!320378)))))

(assert (=> d!69867 (= lt!320375 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69867 (= lt!320378 ((_ sign_extend 32) (size!4553 (buf!5058 thiss!1204))))))

(assert (=> d!69867 (= lt!320376 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9555 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9550 thiss!1204))))))

(assert (=> d!69867 (invariant!0 (currentBit!9550 thiss!1204) (currentByte!9555 thiss!1204) (size!4553 (buf!5058 thiss!1204)))))

(assert (=> d!69867 (= (bitIndex!0 (size!4553 (buf!5058 thiss!1204)) (currentByte!9555 thiss!1204) (currentBit!9550 thiss!1204)) lt!320376)))

(declare-fun b!205156 () Bool)

(declare-fun res!171963 () Bool)

(assert (=> b!205156 (=> (not res!171963) (not e!140392))))

(assert (=> b!205156 (= res!171963 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!320376))))

(declare-fun b!205157 () Bool)

(declare-fun lt!320374 () (_ BitVec 64))

(assert (=> b!205157 (= e!140392 (bvsle lt!320376 (bvmul lt!320374 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!205157 (or (= lt!320374 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!320374 #b0000000000000000000000000000000000000000000000000000000000001000) lt!320374)))))

(assert (=> b!205157 (= lt!320374 ((_ sign_extend 32) (size!4553 (buf!5058 thiss!1204))))))

(assert (= (and d!69867 res!171964) b!205156))

(assert (= (and b!205156 res!171963) b!205157))

(declare-fun m!316345 () Bool)

(assert (=> d!69867 m!316345))

(assert (=> d!69867 m!316283))

(assert (=> b!205090 d!69867))

(declare-fun b!205167 () Bool)

(declare-fun res!171976 () Bool)

(declare-fun e!140397 () Bool)

(assert (=> b!205167 (=> (not res!171976) (not e!140397))))

(declare-fun lt!320387 () tuple2!17538)

(declare-fun lt!320388 () (_ BitVec 64))

(declare-fun lt!320389 () (_ BitVec 64))

(assert (=> b!205167 (= res!171976 (= (bitIndex!0 (size!4553 (buf!5058 (_2!9421 lt!320387))) (currentByte!9555 (_2!9421 lt!320387)) (currentBit!9550 (_2!9421 lt!320387))) (bvadd lt!320388 lt!320389)))))

(assert (=> b!205167 (or (not (= (bvand lt!320388 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!320389 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!320388 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!320388 lt!320389) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!205167 (= lt!320389 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!205167 (= lt!320388 (bitIndex!0 (size!4553 (buf!5058 thiss!1204)) (currentByte!9555 thiss!1204) (currentBit!9550 thiss!1204)))))

(declare-fun d!69869 () Bool)

(assert (=> d!69869 e!140397))

(declare-fun res!171975 () Bool)

(assert (=> d!69869 (=> (not res!171975) (not e!140397))))

(assert (=> d!69869 (= res!171975 (= (size!4553 (buf!5058 thiss!1204)) (size!4553 (buf!5058 (_2!9421 lt!320387)))))))

(declare-fun choose!16 (BitStream!8214 Bool) tuple2!17538)

(assert (=> d!69869 (= lt!320387 (choose!16 thiss!1204 lt!320315))))

(assert (=> d!69869 (validate_offset_bit!0 ((_ sign_extend 32) (size!4553 (buf!5058 thiss!1204))) ((_ sign_extend 32) (currentByte!9555 thiss!1204)) ((_ sign_extend 32) (currentBit!9550 thiss!1204)))))

(assert (=> d!69869 (= (appendBit!0 thiss!1204 lt!320315) lt!320387)))

(declare-fun b!205168 () Bool)

(declare-fun res!171974 () Bool)

(assert (=> b!205168 (=> (not res!171974) (not e!140397))))

(assert (=> b!205168 (= res!171974 (isPrefixOf!0 thiss!1204 (_2!9421 lt!320387)))))

(declare-fun b!205169 () Bool)

(declare-fun e!140398 () Bool)

(assert (=> b!205169 (= e!140397 e!140398)))

(declare-fun res!171973 () Bool)

(assert (=> b!205169 (=> (not res!171973) (not e!140398))))

(declare-fun lt!320390 () tuple2!17540)

(assert (=> b!205169 (= res!171973 (and (= (_2!9422 lt!320390) lt!320315) (= (_1!9422 lt!320390) (_2!9421 lt!320387))))))

(assert (=> b!205169 (= lt!320390 (readBitPure!0 (readerFrom!0 (_2!9421 lt!320387) (currentBit!9550 thiss!1204) (currentByte!9555 thiss!1204))))))

(declare-fun b!205170 () Bool)

(assert (=> b!205170 (= e!140398 (= (bitIndex!0 (size!4553 (buf!5058 (_1!9422 lt!320390))) (currentByte!9555 (_1!9422 lt!320390)) (currentBit!9550 (_1!9422 lt!320390))) (bitIndex!0 (size!4553 (buf!5058 (_2!9421 lt!320387))) (currentByte!9555 (_2!9421 lt!320387)) (currentBit!9550 (_2!9421 lt!320387)))))))

(assert (= (and d!69869 res!171975) b!205167))

(assert (= (and b!205167 res!171976) b!205168))

(assert (= (and b!205168 res!171974) b!205169))

(assert (= (and b!205169 res!171973) b!205170))

(declare-fun m!316347 () Bool)

(assert (=> b!205168 m!316347))

(declare-fun m!316349 () Bool)

(assert (=> b!205170 m!316349))

(declare-fun m!316351 () Bool)

(assert (=> b!205170 m!316351))

(declare-fun m!316353 () Bool)

(assert (=> b!205169 m!316353))

(assert (=> b!205169 m!316353))

(declare-fun m!316355 () Bool)

(assert (=> b!205169 m!316355))

(assert (=> b!205167 m!316351))

(assert (=> b!205167 m!316259))

(declare-fun m!316357 () Bool)

(assert (=> d!69869 m!316357))

(declare-fun m!316359 () Bool)

(assert (=> d!69869 m!316359))

(assert (=> b!205090 d!69869))

(declare-fun d!69871 () Bool)

(assert (=> d!69871 (= (array_inv!4294 (buf!5058 thiss!1204)) (bvsge (size!4553 (buf!5058 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!205082 d!69871))

(declare-fun d!69873 () Bool)

(declare-fun res!171984 () Bool)

(declare-fun e!140403 () Bool)

(assert (=> d!69873 (=> (not res!171984) (not e!140403))))

(assert (=> d!69873 (= res!171984 (= (size!4553 (buf!5058 thiss!1204)) (size!4553 (buf!5058 (_2!9421 lt!320318)))))))

(assert (=> d!69873 (= (isPrefixOf!0 thiss!1204 (_2!9421 lt!320318)) e!140403)))

(declare-fun b!205177 () Bool)

(declare-fun res!171983 () Bool)

(assert (=> b!205177 (=> (not res!171983) (not e!140403))))

(assert (=> b!205177 (= res!171983 (bvsle (bitIndex!0 (size!4553 (buf!5058 thiss!1204)) (currentByte!9555 thiss!1204) (currentBit!9550 thiss!1204)) (bitIndex!0 (size!4553 (buf!5058 (_2!9421 lt!320318))) (currentByte!9555 (_2!9421 lt!320318)) (currentBit!9550 (_2!9421 lt!320318)))))))

(declare-fun b!205178 () Bool)

(declare-fun e!140404 () Bool)

(assert (=> b!205178 (= e!140403 e!140404)))

(declare-fun res!171985 () Bool)

(assert (=> b!205178 (=> res!171985 e!140404)))

(assert (=> b!205178 (= res!171985 (= (size!4553 (buf!5058 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!205179 () Bool)

(assert (=> b!205179 (= e!140404 (arrayBitRangesEq!0 (buf!5058 thiss!1204) (buf!5058 (_2!9421 lt!320318)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4553 (buf!5058 thiss!1204)) (currentByte!9555 thiss!1204) (currentBit!9550 thiss!1204))))))

(assert (= (and d!69873 res!171984) b!205177))

(assert (= (and b!205177 res!171983) b!205178))

(assert (= (and b!205178 (not res!171985)) b!205179))

(assert (=> b!205177 m!316259))

(assert (=> b!205177 m!316257))

(assert (=> b!205179 m!316259))

(assert (=> b!205179 m!316259))

(declare-fun m!316361 () Bool)

(assert (=> b!205179 m!316361))

(assert (=> b!205089 d!69873))

(declare-fun d!69875 () Bool)

(assert (=> d!69875 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4553 (buf!5058 thiss!1204))) ((_ sign_extend 32) (currentByte!9555 thiss!1204)) ((_ sign_extend 32) (currentBit!9550 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4553 (buf!5058 thiss!1204))) ((_ sign_extend 32) (currentByte!9555 thiss!1204)) ((_ sign_extend 32) (currentBit!9550 thiss!1204))) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun bs!17194 () Bool)

(assert (= bs!17194 d!69875))

(assert (=> bs!17194 m!316345))

(assert (=> b!205092 d!69875))

(declare-fun d!69877 () Bool)

(declare-fun e!140405 () Bool)

(assert (=> d!69877 e!140405))

(declare-fun res!171987 () Bool)

(assert (=> d!69877 (=> (not res!171987) (not e!140405))))

(declare-fun lt!320395 () (_ BitVec 64))

(declare-fun lt!320394 () (_ BitVec 64))

(declare-fun lt!320391 () (_ BitVec 64))

(assert (=> d!69877 (= res!171987 (= lt!320394 (bvsub lt!320395 lt!320391)))))

(assert (=> d!69877 (or (= (bvand lt!320395 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!320391 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!320395 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!320395 lt!320391) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!69877 (= lt!320391 (remainingBits!0 ((_ sign_extend 32) (size!4553 (buf!5058 (_2!9421 lt!320322)))) ((_ sign_extend 32) (currentByte!9555 (_2!9421 lt!320322))) ((_ sign_extend 32) (currentBit!9550 (_2!9421 lt!320322)))))))

(declare-fun lt!320396 () (_ BitVec 64))

(declare-fun lt!320393 () (_ BitVec 64))

(assert (=> d!69877 (= lt!320395 (bvmul lt!320396 lt!320393))))

(assert (=> d!69877 (or (= lt!320396 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!320393 (bvsdiv (bvmul lt!320396 lt!320393) lt!320396)))))

(assert (=> d!69877 (= lt!320393 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69877 (= lt!320396 ((_ sign_extend 32) (size!4553 (buf!5058 (_2!9421 lt!320322)))))))

(assert (=> d!69877 (= lt!320394 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9555 (_2!9421 lt!320322))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9550 (_2!9421 lt!320322)))))))

(assert (=> d!69877 (invariant!0 (currentBit!9550 (_2!9421 lt!320322)) (currentByte!9555 (_2!9421 lt!320322)) (size!4553 (buf!5058 (_2!9421 lt!320322))))))

(assert (=> d!69877 (= (bitIndex!0 (size!4553 (buf!5058 (_2!9421 lt!320322))) (currentByte!9555 (_2!9421 lt!320322)) (currentBit!9550 (_2!9421 lt!320322))) lt!320394)))

(declare-fun b!205180 () Bool)

(declare-fun res!171986 () Bool)

(assert (=> b!205180 (=> (not res!171986) (not e!140405))))

(assert (=> b!205180 (= res!171986 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!320394))))

(declare-fun b!205181 () Bool)

(declare-fun lt!320392 () (_ BitVec 64))

(assert (=> b!205181 (= e!140405 (bvsle lt!320394 (bvmul lt!320392 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!205181 (or (= lt!320392 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!320392 #b0000000000000000000000000000000000000000000000000000000000001000) lt!320392)))))

(assert (=> b!205181 (= lt!320392 ((_ sign_extend 32) (size!4553 (buf!5058 (_2!9421 lt!320322)))))))

(assert (= (and d!69877 res!171987) b!205180))

(assert (= (and b!205180 res!171986) b!205181))

(declare-fun m!316363 () Bool)

(assert (=> d!69877 m!316363))

(assert (=> d!69877 m!316289))

(assert (=> b!205091 d!69877))

(declare-fun d!69879 () Bool)

(declare-fun res!171989 () Bool)

(declare-fun e!140406 () Bool)

(assert (=> d!69879 (=> (not res!171989) (not e!140406))))

(assert (=> d!69879 (= res!171989 (= (size!4553 (buf!5058 thiss!1204)) (size!4553 (buf!5058 (_2!9421 lt!320322)))))))

(assert (=> d!69879 (= (isPrefixOf!0 thiss!1204 (_2!9421 lt!320322)) e!140406)))

(declare-fun b!205182 () Bool)

(declare-fun res!171988 () Bool)

(assert (=> b!205182 (=> (not res!171988) (not e!140406))))

(assert (=> b!205182 (= res!171988 (bvsle (bitIndex!0 (size!4553 (buf!5058 thiss!1204)) (currentByte!9555 thiss!1204) (currentBit!9550 thiss!1204)) (bitIndex!0 (size!4553 (buf!5058 (_2!9421 lt!320322))) (currentByte!9555 (_2!9421 lt!320322)) (currentBit!9550 (_2!9421 lt!320322)))))))

(declare-fun b!205183 () Bool)

(declare-fun e!140407 () Bool)

(assert (=> b!205183 (= e!140406 e!140407)))

(declare-fun res!171990 () Bool)

(assert (=> b!205183 (=> res!171990 e!140407)))

(assert (=> b!205183 (= res!171990 (= (size!4553 (buf!5058 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!205184 () Bool)

(assert (=> b!205184 (= e!140407 (arrayBitRangesEq!0 (buf!5058 thiss!1204) (buf!5058 (_2!9421 lt!320322)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4553 (buf!5058 thiss!1204)) (currentByte!9555 thiss!1204) (currentBit!9550 thiss!1204))))))

(assert (= (and d!69879 res!171989) b!205182))

(assert (= (and b!205182 res!171988) b!205183))

(assert (= (and b!205183 (not res!171990)) b!205184))

(assert (=> b!205182 m!316259))

(assert (=> b!205182 m!316291))

(assert (=> b!205184 m!316259))

(assert (=> b!205184 m!316259))

(declare-fun m!316365 () Bool)

(assert (=> b!205184 m!316365))

(assert (=> b!205091 d!69879))

(declare-fun d!69881 () Bool)

(assert (=> d!69881 (isPrefixOf!0 thiss!1204 (_2!9421 lt!320322))))

(declare-fun lt!320399 () Unit!14630)

(declare-fun choose!30 (BitStream!8214 BitStream!8214 BitStream!8214) Unit!14630)

(assert (=> d!69881 (= lt!320399 (choose!30 thiss!1204 (_2!9421 lt!320318) (_2!9421 lt!320322)))))

(assert (=> d!69881 (isPrefixOf!0 thiss!1204 (_2!9421 lt!320318))))

(assert (=> d!69881 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9421 lt!320318) (_2!9421 lt!320322)) lt!320399)))

(declare-fun bs!17195 () Bool)

(assert (= bs!17195 d!69881))

(assert (=> bs!17195 m!316293))

(declare-fun m!316367 () Bool)

(assert (=> bs!17195 m!316367))

(assert (=> bs!17195 m!316281))

(assert (=> b!205091 d!69881))

(declare-fun b!205326 () Bool)

(declare-fun e!140501 () Bool)

(declare-fun e!140502 () Bool)

(assert (=> b!205326 (= e!140501 e!140502)))

(declare-fun res!172126 () Bool)

(assert (=> b!205326 (=> (not res!172126) (not e!140502))))

(declare-datatypes ((tuple2!17546 0))(
  ( (tuple2!17547 (_1!9425 BitStream!8214) (_2!9425 (_ BitVec 64))) )
))
(declare-fun lt!320650 () tuple2!17546)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!205326 (= res!172126 (= (_2!9425 lt!320650) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-datatypes ((tuple2!17548 0))(
  ( (tuple2!17549 (_1!9426 BitStream!8214) (_2!9426 BitStream!8214)) )
))
(declare-fun lt!320672 () tuple2!17548)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8214 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17546)

(assert (=> b!205326 (= lt!320650 (readNBitsLSBFirstsLoopPure!0 (_1!9426 lt!320672) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!320657 () Unit!14630)

(declare-fun lt!320646 () Unit!14630)

(assert (=> b!205326 (= lt!320657 lt!320646)))

(declare-fun lt!320668 () tuple2!17538)

(declare-fun lt!320675 () (_ BitVec 64))

(assert (=> b!205326 (validate_offset_bits!1 ((_ sign_extend 32) (size!4553 (buf!5058 (_2!9421 lt!320668)))) ((_ sign_extend 32) (currentByte!9555 (_2!9421 lt!320318))) ((_ sign_extend 32) (currentBit!9550 (_2!9421 lt!320318))) lt!320675)))

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8214 array!10357 (_ BitVec 64)) Unit!14630)

(assert (=> b!205326 (= lt!320646 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9421 lt!320318) (buf!5058 (_2!9421 lt!320668)) lt!320675))))

(declare-fun e!140500 () Bool)

(assert (=> b!205326 e!140500))

(declare-fun res!172128 () Bool)

(assert (=> b!205326 (=> (not res!172128) (not e!140500))))

(assert (=> b!205326 (= res!172128 (and (= (size!4553 (buf!5058 (_2!9421 lt!320318))) (size!4553 (buf!5058 (_2!9421 lt!320668)))) (bvsge lt!320675 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!205326 (= lt!320675 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!205326 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(declare-fun reader!0 (BitStream!8214 BitStream!8214) tuple2!17548)

(assert (=> b!205326 (= lt!320672 (reader!0 (_2!9421 lt!320318) (_2!9421 lt!320668)))))

(declare-fun lt!320649 () tuple2!17538)

(declare-fun bm!3246 () Bool)

(declare-fun c!10160 () Bool)

(declare-fun call!3249 () Bool)

(assert (=> bm!3246 (= call!3249 (isPrefixOf!0 (_2!9421 lt!320318) (ite c!10160 (_2!9421 lt!320318) (_2!9421 lt!320649))))))

(declare-fun b!205328 () Bool)

(declare-fun e!140503 () Bool)

(declare-fun lt!320680 () tuple2!17546)

(declare-fun lt!320678 () tuple2!17548)

(assert (=> b!205328 (= e!140503 (= (_1!9425 lt!320680) (_2!9426 lt!320678)))))

(declare-fun b!205329 () Bool)

(declare-fun e!140499 () Bool)

(declare-fun lt!320664 () tuple2!17540)

(declare-fun lt!320643 () tuple2!17538)

(assert (=> b!205329 (= e!140499 (= (bitIndex!0 (size!4553 (buf!5058 (_1!9422 lt!320664))) (currentByte!9555 (_1!9422 lt!320664)) (currentBit!9550 (_1!9422 lt!320664))) (bitIndex!0 (size!4553 (buf!5058 (_2!9421 lt!320643))) (currentByte!9555 (_2!9421 lt!320643)) (currentBit!9550 (_2!9421 lt!320643)))))))

(declare-fun b!205330 () Bool)

(declare-fun res!172129 () Bool)

(assert (=> b!205330 (= res!172129 (isPrefixOf!0 (_2!9421 lt!320318) (_2!9421 lt!320643)))))

(declare-fun e!140495 () Bool)

(assert (=> b!205330 (=> (not res!172129) (not e!140495))))

(declare-fun b!205331 () Bool)

(declare-fun res!172118 () Bool)

(assert (=> b!205331 (=> (not res!172118) (not e!140501))))

(assert (=> b!205331 (= res!172118 (= (size!4553 (buf!5058 (_2!9421 lt!320318))) (size!4553 (buf!5058 (_2!9421 lt!320668)))))))

(declare-fun b!205332 () Bool)

(declare-fun e!140497 () Bool)

(declare-fun lt!320662 () tuple2!17540)

(declare-fun lt!320645 () tuple2!17540)

(assert (=> b!205332 (= e!140497 (= (_2!9422 lt!320662) (_2!9422 lt!320645)))))

(declare-fun b!205333 () Bool)

(declare-fun e!140496 () tuple2!17538)

(declare-fun Unit!14634 () Unit!14630)

(assert (=> b!205333 (= e!140496 (tuple2!17539 Unit!14634 (_2!9421 lt!320318)))))

(declare-fun lt!320642 () Unit!14630)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8214) Unit!14630)

(assert (=> b!205333 (= lt!320642 (lemmaIsPrefixRefl!0 (_2!9421 lt!320318)))))

(assert (=> b!205333 call!3249))

(declare-fun lt!320652 () Unit!14630)

(assert (=> b!205333 (= lt!320652 lt!320642)))

(declare-fun b!205334 () Bool)

(declare-fun e!140498 () (_ BitVec 64))

(assert (=> b!205334 (= e!140498 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!205335 () Bool)

(assert (=> b!205335 (= lt!320664 (readBitPure!0 (readerFrom!0 (_2!9421 lt!320643) (currentBit!9550 (_2!9421 lt!320318)) (currentByte!9555 (_2!9421 lt!320318)))))))

(declare-fun res!172119 () Bool)

(declare-fun lt!320639 () Bool)

(assert (=> b!205335 (= res!172119 (and (= (_2!9422 lt!320664) lt!320639) (= (_1!9422 lt!320664) (_2!9421 lt!320643))))))

(assert (=> b!205335 (=> (not res!172119) (not e!140499))))

(assert (=> b!205335 (= e!140495 e!140499)))

(declare-fun b!205336 () Bool)

(assert (=> b!205336 (= e!140498 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun d!69883 () Bool)

(assert (=> d!69883 e!140501))

(declare-fun res!172123 () Bool)

(assert (=> d!69883 (=> (not res!172123) (not e!140501))))

(assert (=> d!69883 (= res!172123 (invariant!0 (currentBit!9550 (_2!9421 lt!320668)) (currentByte!9555 (_2!9421 lt!320668)) (size!4553 (buf!5058 (_2!9421 lt!320668)))))))

(assert (=> d!69883 (= lt!320668 e!140496)))

(assert (=> d!69883 (= c!10160 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!69883 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!69883 (= (appendBitsLSBFirstLoopTR!0 (_2!9421 lt!320318) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!320668)))

(declare-fun b!205327 () Bool)

(assert (=> b!205327 (= e!140500 (validate_offset_bits!1 ((_ sign_extend 32) (size!4553 (buf!5058 (_2!9421 lt!320318)))) ((_ sign_extend 32) (currentByte!9555 (_2!9421 lt!320318))) ((_ sign_extend 32) (currentBit!9550 (_2!9421 lt!320318))) lt!320675))))

(declare-fun b!205337 () Bool)

(declare-fun res!172124 () Bool)

(assert (=> b!205337 (= res!172124 (= (bitIndex!0 (size!4553 (buf!5058 (_2!9421 lt!320643))) (currentByte!9555 (_2!9421 lt!320643)) (currentBit!9550 (_2!9421 lt!320643))) (bvadd (bitIndex!0 (size!4553 (buf!5058 (_2!9421 lt!320318))) (currentByte!9555 (_2!9421 lt!320318)) (currentBit!9550 (_2!9421 lt!320318))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!205337 (=> (not res!172124) (not e!140495))))

(declare-fun b!205338 () Bool)

(declare-fun res!172122 () Bool)

(assert (=> b!205338 (=> (not res!172122) (not e!140501))))

(declare-fun lt!320635 () (_ BitVec 64))

(declare-fun lt!320670 () (_ BitVec 64))

(assert (=> b!205338 (= res!172122 (= (bitIndex!0 (size!4553 (buf!5058 (_2!9421 lt!320668))) (currentByte!9555 (_2!9421 lt!320668)) (currentBit!9550 (_2!9421 lt!320668))) (bvsub lt!320635 lt!320670)))))

(assert (=> b!205338 (or (= (bvand lt!320635 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!320670 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!320635 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!320635 lt!320670) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!205338 (= lt!320670 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!320667 () (_ BitVec 64))

(declare-fun lt!320669 () (_ BitVec 64))

(assert (=> b!205338 (= lt!320635 (bvadd lt!320667 lt!320669))))

(assert (=> b!205338 (or (not (= (bvand lt!320667 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!320669 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!320667 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!320667 lt!320669) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!205338 (= lt!320669 ((_ sign_extend 32) nBits!348))))

(assert (=> b!205338 (= lt!320667 (bitIndex!0 (size!4553 (buf!5058 (_2!9421 lt!320318))) (currentByte!9555 (_2!9421 lt!320318)) (currentBit!9550 (_2!9421 lt!320318))))))

(declare-fun b!205339 () Bool)

(declare-fun res!172127 () Bool)

(assert (=> b!205339 (=> (not res!172127) (not e!140501))))

(assert (=> b!205339 (= res!172127 (isPrefixOf!0 (_2!9421 lt!320318) (_2!9421 lt!320668)))))

(declare-fun b!205340 () Bool)

(assert (=> b!205340 (= e!140496 (tuple2!17539 (_1!9421 lt!320649) (_2!9421 lt!320649)))))

(assert (=> b!205340 (= lt!320639 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!205340 (= lt!320643 (appendBit!0 (_2!9421 lt!320318) lt!320639))))

(declare-fun res!172125 () Bool)

(assert (=> b!205340 (= res!172125 (= (size!4553 (buf!5058 (_2!9421 lt!320318))) (size!4553 (buf!5058 (_2!9421 lt!320643)))))))

(assert (=> b!205340 (=> (not res!172125) (not e!140495))))

(assert (=> b!205340 e!140495))

(declare-fun lt!320656 () tuple2!17538)

(assert (=> b!205340 (= lt!320656 lt!320643)))

(assert (=> b!205340 (= lt!320649 (appendBitsLSBFirstLoopTR!0 (_2!9421 lt!320656) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!320684 () Unit!14630)

(assert (=> b!205340 (= lt!320684 (lemmaIsPrefixTransitive!0 (_2!9421 lt!320318) (_2!9421 lt!320656) (_2!9421 lt!320649)))))

(assert (=> b!205340 call!3249))

(declare-fun lt!320689 () Unit!14630)

(assert (=> b!205340 (= lt!320689 lt!320684)))

(assert (=> b!205340 (invariant!0 (currentBit!9550 (_2!9421 lt!320318)) (currentByte!9555 (_2!9421 lt!320318)) (size!4553 (buf!5058 (_2!9421 lt!320656))))))

(declare-fun lt!320660 () BitStream!8214)

(assert (=> b!205340 (= lt!320660 (BitStream!8215 (buf!5058 (_2!9421 lt!320656)) (currentByte!9555 (_2!9421 lt!320318)) (currentBit!9550 (_2!9421 lt!320318))))))

(assert (=> b!205340 (invariant!0 (currentBit!9550 lt!320660) (currentByte!9555 lt!320660) (size!4553 (buf!5058 (_2!9421 lt!320649))))))

(declare-fun lt!320688 () BitStream!8214)

(assert (=> b!205340 (= lt!320688 (BitStream!8215 (buf!5058 (_2!9421 lt!320649)) (currentByte!9555 lt!320660) (currentBit!9550 lt!320660)))))

(assert (=> b!205340 (= lt!320662 (readBitPure!0 lt!320660))))

(assert (=> b!205340 (= lt!320645 (readBitPure!0 lt!320688))))

(declare-fun lt!320676 () Unit!14630)

(declare-fun readBitPrefixLemma!0 (BitStream!8214 BitStream!8214) Unit!14630)

(assert (=> b!205340 (= lt!320676 (readBitPrefixLemma!0 lt!320660 (_2!9421 lt!320649)))))

(declare-fun res!172120 () Bool)

(assert (=> b!205340 (= res!172120 (= (bitIndex!0 (size!4553 (buf!5058 (_1!9422 lt!320662))) (currentByte!9555 (_1!9422 lt!320662)) (currentBit!9550 (_1!9422 lt!320662))) (bitIndex!0 (size!4553 (buf!5058 (_1!9422 lt!320645))) (currentByte!9555 (_1!9422 lt!320645)) (currentBit!9550 (_1!9422 lt!320645)))))))

(assert (=> b!205340 (=> (not res!172120) (not e!140497))))

(assert (=> b!205340 e!140497))

(declare-fun lt!320653 () Unit!14630)

(assert (=> b!205340 (= lt!320653 lt!320676)))

(declare-fun lt!320686 () tuple2!17548)

(assert (=> b!205340 (= lt!320686 (reader!0 (_2!9421 lt!320318) (_2!9421 lt!320649)))))

(declare-fun lt!320665 () tuple2!17548)

(assert (=> b!205340 (= lt!320665 (reader!0 (_2!9421 lt!320656) (_2!9421 lt!320649)))))

(declare-fun lt!320674 () tuple2!17540)

(assert (=> b!205340 (= lt!320674 (readBitPure!0 (_1!9426 lt!320686)))))

(assert (=> b!205340 (= (_2!9422 lt!320674) lt!320639)))

(declare-fun lt!320677 () Unit!14630)

(declare-fun Unit!14635 () Unit!14630)

(assert (=> b!205340 (= lt!320677 Unit!14635)))

(declare-fun lt!320679 () (_ BitVec 64))

(assert (=> b!205340 (= lt!320679 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!320659 () (_ BitVec 64))

(assert (=> b!205340 (= lt!320659 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!320661 () Unit!14630)

(assert (=> b!205340 (= lt!320661 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9421 lt!320318) (buf!5058 (_2!9421 lt!320649)) lt!320659))))

(assert (=> b!205340 (validate_offset_bits!1 ((_ sign_extend 32) (size!4553 (buf!5058 (_2!9421 lt!320649)))) ((_ sign_extend 32) (currentByte!9555 (_2!9421 lt!320318))) ((_ sign_extend 32) (currentBit!9550 (_2!9421 lt!320318))) lt!320659)))

(declare-fun lt!320666 () Unit!14630)

(assert (=> b!205340 (= lt!320666 lt!320661)))

(declare-fun lt!320682 () tuple2!17546)

(assert (=> b!205340 (= lt!320682 (readNBitsLSBFirstsLoopPure!0 (_1!9426 lt!320686) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!320679))))

(declare-fun lt!320671 () (_ BitVec 64))

(assert (=> b!205340 (= lt!320671 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!320636 () Unit!14630)

(assert (=> b!205340 (= lt!320636 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9421 lt!320656) (buf!5058 (_2!9421 lt!320649)) lt!320671))))

(assert (=> b!205340 (validate_offset_bits!1 ((_ sign_extend 32) (size!4553 (buf!5058 (_2!9421 lt!320649)))) ((_ sign_extend 32) (currentByte!9555 (_2!9421 lt!320656))) ((_ sign_extend 32) (currentBit!9550 (_2!9421 lt!320656))) lt!320671)))

(declare-fun lt!320687 () Unit!14630)

(assert (=> b!205340 (= lt!320687 lt!320636)))

(declare-fun lt!320647 () tuple2!17546)

(assert (=> b!205340 (= lt!320647 (readNBitsLSBFirstsLoopPure!0 (_1!9426 lt!320665) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!320679 (ite (_2!9422 lt!320674) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!320685 () tuple2!17546)

(assert (=> b!205340 (= lt!320685 (readNBitsLSBFirstsLoopPure!0 (_1!9426 lt!320686) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!320679))))

(declare-fun c!10159 () Bool)

(assert (=> b!205340 (= c!10159 (_2!9422 (readBitPure!0 (_1!9426 lt!320686))))))

(declare-fun lt!320673 () tuple2!17546)

(declare-fun withMovedBitIndex!0 (BitStream!8214 (_ BitVec 64)) BitStream!8214)

(assert (=> b!205340 (= lt!320673 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9426 lt!320686) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!320679 e!140498)))))

(declare-fun lt!320637 () Unit!14630)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8214 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!14630)

(assert (=> b!205340 (= lt!320637 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9426 lt!320686) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!320679))))

(assert (=> b!205340 (and (= (_2!9425 lt!320685) (_2!9425 lt!320673)) (= (_1!9425 lt!320685) (_1!9425 lt!320673)))))

(declare-fun lt!320640 () Unit!14630)

(assert (=> b!205340 (= lt!320640 lt!320637)))

(assert (=> b!205340 (= (_1!9426 lt!320686) (withMovedBitIndex!0 (_2!9426 lt!320686) (bvsub (bitIndex!0 (size!4553 (buf!5058 (_2!9421 lt!320318))) (currentByte!9555 (_2!9421 lt!320318)) (currentBit!9550 (_2!9421 lt!320318))) (bitIndex!0 (size!4553 (buf!5058 (_2!9421 lt!320649))) (currentByte!9555 (_2!9421 lt!320649)) (currentBit!9550 (_2!9421 lt!320649))))))))

(declare-fun lt!320663 () Unit!14630)

(declare-fun Unit!14636 () Unit!14630)

(assert (=> b!205340 (= lt!320663 Unit!14636)))

(assert (=> b!205340 (= (_1!9426 lt!320665) (withMovedBitIndex!0 (_2!9426 lt!320665) (bvsub (bitIndex!0 (size!4553 (buf!5058 (_2!9421 lt!320656))) (currentByte!9555 (_2!9421 lt!320656)) (currentBit!9550 (_2!9421 lt!320656))) (bitIndex!0 (size!4553 (buf!5058 (_2!9421 lt!320649))) (currentByte!9555 (_2!9421 lt!320649)) (currentBit!9550 (_2!9421 lt!320649))))))))

(declare-fun lt!320683 () Unit!14630)

(declare-fun Unit!14637 () Unit!14630)

(assert (=> b!205340 (= lt!320683 Unit!14637)))

(assert (=> b!205340 (= (bitIndex!0 (size!4553 (buf!5058 (_2!9421 lt!320318))) (currentByte!9555 (_2!9421 lt!320318)) (currentBit!9550 (_2!9421 lt!320318))) (bvsub (bitIndex!0 (size!4553 (buf!5058 (_2!9421 lt!320656))) (currentByte!9555 (_2!9421 lt!320656)) (currentBit!9550 (_2!9421 lt!320656))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!320654 () Unit!14630)

(declare-fun Unit!14638 () Unit!14630)

(assert (=> b!205340 (= lt!320654 Unit!14638)))

(assert (=> b!205340 (= (_2!9425 lt!320682) (_2!9425 lt!320647))))

(declare-fun lt!320644 () Unit!14630)

(declare-fun Unit!14639 () Unit!14630)

(assert (=> b!205340 (= lt!320644 Unit!14639)))

(assert (=> b!205340 (invariant!0 (currentBit!9550 (_2!9421 lt!320649)) (currentByte!9555 (_2!9421 lt!320649)) (size!4553 (buf!5058 (_2!9421 lt!320649))))))

(declare-fun lt!320690 () Unit!14630)

(declare-fun Unit!14640 () Unit!14630)

(assert (=> b!205340 (= lt!320690 Unit!14640)))

(assert (=> b!205340 (= (size!4553 (buf!5058 (_2!9421 lt!320318))) (size!4553 (buf!5058 (_2!9421 lt!320649))))))

(declare-fun lt!320655 () Unit!14630)

(declare-fun Unit!14641 () Unit!14630)

(assert (=> b!205340 (= lt!320655 Unit!14641)))

(assert (=> b!205340 (= (bitIndex!0 (size!4553 (buf!5058 (_2!9421 lt!320649))) (currentByte!9555 (_2!9421 lt!320649)) (currentBit!9550 (_2!9421 lt!320649))) (bvsub (bvadd (bitIndex!0 (size!4553 (buf!5058 (_2!9421 lt!320318))) (currentByte!9555 (_2!9421 lt!320318)) (currentBit!9550 (_2!9421 lt!320318))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!320638 () Unit!14630)

(declare-fun Unit!14642 () Unit!14630)

(assert (=> b!205340 (= lt!320638 Unit!14642)))

(declare-fun lt!320648 () Unit!14630)

(declare-fun Unit!14643 () Unit!14630)

(assert (=> b!205340 (= lt!320648 Unit!14643)))

(assert (=> b!205340 (= lt!320678 (reader!0 (_2!9421 lt!320318) (_2!9421 lt!320649)))))

(declare-fun lt!320658 () (_ BitVec 64))

(assert (=> b!205340 (= lt!320658 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!320651 () Unit!14630)

(assert (=> b!205340 (= lt!320651 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9421 lt!320318) (buf!5058 (_2!9421 lt!320649)) lt!320658))))

(assert (=> b!205340 (validate_offset_bits!1 ((_ sign_extend 32) (size!4553 (buf!5058 (_2!9421 lt!320649)))) ((_ sign_extend 32) (currentByte!9555 (_2!9421 lt!320318))) ((_ sign_extend 32) (currentBit!9550 (_2!9421 lt!320318))) lt!320658)))

(declare-fun lt!320641 () Unit!14630)

(assert (=> b!205340 (= lt!320641 lt!320651)))

(assert (=> b!205340 (= lt!320680 (readNBitsLSBFirstsLoopPure!0 (_1!9426 lt!320678) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!172121 () Bool)

(assert (=> b!205340 (= res!172121 (= (_2!9425 lt!320680) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!205340 (=> (not res!172121) (not e!140503))))

(assert (=> b!205340 e!140503))

(declare-fun lt!320681 () Unit!14630)

(declare-fun Unit!14644 () Unit!14630)

(assert (=> b!205340 (= lt!320681 Unit!14644)))

(declare-fun b!205341 () Bool)

(assert (=> b!205341 (= e!140502 (= (_1!9425 lt!320650) (_2!9426 lt!320672)))))

(assert (= (and d!69883 c!10160) b!205333))

(assert (= (and d!69883 (not c!10160)) b!205340))

(assert (= (and b!205340 res!172125) b!205337))

(assert (= (and b!205337 res!172124) b!205330))

(assert (= (and b!205330 res!172129) b!205335))

(assert (= (and b!205335 res!172119) b!205329))

(assert (= (and b!205340 res!172120) b!205332))

(assert (= (and b!205340 c!10159) b!205336))

(assert (= (and b!205340 (not c!10159)) b!205334))

(assert (= (and b!205340 res!172121) b!205328))

(assert (= (or b!205333 b!205340) bm!3246))

(assert (= (and d!69883 res!172123) b!205331))

(assert (= (and b!205331 res!172118) b!205338))

(assert (= (and b!205338 res!172122) b!205339))

(assert (= (and b!205339 res!172127) b!205326))

(assert (= (and b!205326 res!172128) b!205327))

(assert (= (and b!205326 res!172126) b!205341))

(declare-fun m!316461 () Bool)

(assert (=> b!205327 m!316461))

(declare-fun m!316463 () Bool)

(assert (=> b!205338 m!316463))

(assert (=> b!205338 m!316257))

(declare-fun m!316465 () Bool)

(assert (=> b!205340 m!316465))

(declare-fun m!316467 () Bool)

(assert (=> b!205340 m!316467))

(declare-fun m!316469 () Bool)

(assert (=> b!205340 m!316469))

(declare-fun m!316471 () Bool)

(assert (=> b!205340 m!316471))

(declare-fun m!316473 () Bool)

(assert (=> b!205340 m!316473))

(declare-fun m!316475 () Bool)

(assert (=> b!205340 m!316475))

(declare-fun m!316477 () Bool)

(assert (=> b!205340 m!316477))

(declare-fun m!316479 () Bool)

(assert (=> b!205340 m!316479))

(declare-fun m!316481 () Bool)

(assert (=> b!205340 m!316481))

(declare-fun m!316483 () Bool)

(assert (=> b!205340 m!316483))

(declare-fun m!316485 () Bool)

(assert (=> b!205340 m!316485))

(declare-fun m!316487 () Bool)

(assert (=> b!205340 m!316487))

(declare-fun m!316489 () Bool)

(assert (=> b!205340 m!316489))

(declare-fun m!316491 () Bool)

(assert (=> b!205340 m!316491))

(declare-fun m!316493 () Bool)

(assert (=> b!205340 m!316493))

(declare-fun m!316495 () Bool)

(assert (=> b!205340 m!316495))

(assert (=> b!205340 m!316257))

(declare-fun m!316497 () Bool)

(assert (=> b!205340 m!316497))

(declare-fun m!316499 () Bool)

(assert (=> b!205340 m!316499))

(declare-fun m!316501 () Bool)

(assert (=> b!205340 m!316501))

(declare-fun m!316503 () Bool)

(assert (=> b!205340 m!316503))

(assert (=> b!205340 m!316473))

(declare-fun m!316505 () Bool)

(assert (=> b!205340 m!316505))

(declare-fun m!316507 () Bool)

(assert (=> b!205340 m!316507))

(declare-fun m!316509 () Bool)

(assert (=> b!205340 m!316509))

(declare-fun m!316511 () Bool)

(assert (=> b!205340 m!316511))

(declare-fun m!316513 () Bool)

(assert (=> b!205340 m!316513))

(declare-fun m!316515 () Bool)

(assert (=> b!205340 m!316515))

(declare-fun m!316517 () Bool)

(assert (=> b!205340 m!316517))

(declare-fun m!316519 () Bool)

(assert (=> b!205340 m!316519))

(declare-fun m!316521 () Bool)

(assert (=> b!205340 m!316521))

(declare-fun m!316523 () Bool)

(assert (=> b!205340 m!316523))

(declare-fun m!316525 () Bool)

(assert (=> b!205340 m!316525))

(declare-fun m!316527 () Bool)

(assert (=> b!205340 m!316527))

(declare-fun m!316529 () Bool)

(assert (=> b!205335 m!316529))

(assert (=> b!205335 m!316529))

(declare-fun m!316531 () Bool)

(assert (=> b!205335 m!316531))

(declare-fun m!316533 () Bool)

(assert (=> b!205329 m!316533))

(declare-fun m!316535 () Bool)

(assert (=> b!205329 m!316535))

(assert (=> b!205337 m!316535))

(assert (=> b!205337 m!316257))

(declare-fun m!316537 () Bool)

(assert (=> b!205339 m!316537))

(declare-fun m!316539 () Bool)

(assert (=> bm!3246 m!316539))

(declare-fun m!316541 () Bool)

(assert (=> b!205330 m!316541))

(declare-fun m!316543 () Bool)

(assert (=> d!69883 m!316543))

(declare-fun m!316545 () Bool)

(assert (=> b!205333 m!316545))

(assert (=> b!205326 m!316497))

(declare-fun m!316547 () Bool)

(assert (=> b!205326 m!316547))

(assert (=> b!205326 m!316513))

(declare-fun m!316549 () Bool)

(assert (=> b!205326 m!316549))

(declare-fun m!316551 () Bool)

(assert (=> b!205326 m!316551))

(declare-fun m!316553 () Bool)

(assert (=> b!205326 m!316553))

(assert (=> b!205091 d!69883))

(declare-fun d!69961 () Bool)

(assert (=> d!69961 (= (invariant!0 (currentBit!9550 thiss!1204) (currentByte!9555 thiss!1204) (size!4553 (buf!5058 thiss!1204))) (and (bvsge (currentBit!9550 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9550 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9555 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9555 thiss!1204) (size!4553 (buf!5058 thiss!1204))) (and (= (currentBit!9550 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9555 thiss!1204) (size!4553 (buf!5058 thiss!1204)))))))))

(assert (=> b!205096 d!69961))

(declare-fun d!69963 () Bool)

(declare-fun e!140504 () Bool)

(assert (=> d!69963 e!140504))

(declare-fun res!172131 () Bool)

(assert (=> d!69963 (=> (not res!172131) (not e!140504))))

(declare-fun lt!320691 () (_ BitVec 64))

(declare-fun lt!320695 () (_ BitVec 64))

(declare-fun lt!320694 () (_ BitVec 64))

(assert (=> d!69963 (= res!172131 (= lt!320694 (bvsub lt!320695 lt!320691)))))

(assert (=> d!69963 (or (= (bvand lt!320695 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!320691 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!320695 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!320695 lt!320691) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!69963 (= lt!320691 (remainingBits!0 ((_ sign_extend 32) (size!4553 (buf!5058 (_1!9422 lt!320323)))) ((_ sign_extend 32) (currentByte!9555 (_1!9422 lt!320323))) ((_ sign_extend 32) (currentBit!9550 (_1!9422 lt!320323)))))))

(declare-fun lt!320696 () (_ BitVec 64))

(declare-fun lt!320693 () (_ BitVec 64))

(assert (=> d!69963 (= lt!320695 (bvmul lt!320696 lt!320693))))

(assert (=> d!69963 (or (= lt!320696 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!320693 (bvsdiv (bvmul lt!320696 lt!320693) lt!320696)))))

(assert (=> d!69963 (= lt!320693 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69963 (= lt!320696 ((_ sign_extend 32) (size!4553 (buf!5058 (_1!9422 lt!320323)))))))

(assert (=> d!69963 (= lt!320694 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9555 (_1!9422 lt!320323))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9550 (_1!9422 lt!320323)))))))

(assert (=> d!69963 (invariant!0 (currentBit!9550 (_1!9422 lt!320323)) (currentByte!9555 (_1!9422 lt!320323)) (size!4553 (buf!5058 (_1!9422 lt!320323))))))

(assert (=> d!69963 (= (bitIndex!0 (size!4553 (buf!5058 (_1!9422 lt!320323))) (currentByte!9555 (_1!9422 lt!320323)) (currentBit!9550 (_1!9422 lt!320323))) lt!320694)))

(declare-fun b!205342 () Bool)

(declare-fun res!172130 () Bool)

(assert (=> b!205342 (=> (not res!172130) (not e!140504))))

(assert (=> b!205342 (= res!172130 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!320694))))

(declare-fun b!205343 () Bool)

(declare-fun lt!320692 () (_ BitVec 64))

(assert (=> b!205343 (= e!140504 (bvsle lt!320694 (bvmul lt!320692 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!205343 (or (= lt!320692 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!320692 #b0000000000000000000000000000000000000000000000000000000000001000) lt!320692)))))

(assert (=> b!205343 (= lt!320692 ((_ sign_extend 32) (size!4553 (buf!5058 (_1!9422 lt!320323)))))))

(assert (= (and d!69963 res!172131) b!205342))

(assert (= (and b!205342 res!172130) b!205343))

(declare-fun m!316555 () Bool)

(assert (=> d!69963 m!316555))

(declare-fun m!316557 () Bool)

(assert (=> d!69963 m!316557))

(assert (=> b!205095 d!69963))

(declare-fun c!10163 () Bool)

(declare-datatypes ((tuple4!272 0))(
  ( (tuple4!273 (_1!9428 (_ BitVec 32)) (_2!9428 (_ BitVec 32)) (_3!652 (_ BitVec 32)) (_4!136 (_ BitVec 32))) )
))
(declare-fun lt!320705 () tuple4!272)

(declare-fun bm!3249 () Bool)

(declare-fun lt!320703 () (_ BitVec 32))

(declare-fun lt!320704 () (_ BitVec 32))

(declare-fun call!3252 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!3249 (= call!3252 (byteRangesEq!0 (ite c!10163 (select (arr!5483 (buf!5058 (_2!9421 lt!320318))) (_3!652 lt!320705)) (select (arr!5483 (buf!5058 (_2!9421 lt!320318))) (_4!136 lt!320705))) (ite c!10163 (select (arr!5483 (buf!5058 (_2!9421 lt!320322))) (_3!652 lt!320705)) (select (arr!5483 (buf!5058 (_2!9421 lt!320322))) (_4!136 lt!320705))) (ite c!10163 lt!320703 #b00000000000000000000000000000000) lt!320704))))

(declare-fun b!205358 () Bool)

(declare-fun e!140521 () Bool)

(declare-fun e!140520 () Bool)

(assert (=> b!205358 (= e!140521 e!140520)))

(declare-fun res!172146 () Bool)

(assert (=> b!205358 (= res!172146 (byteRangesEq!0 (select (arr!5483 (buf!5058 (_2!9421 lt!320318))) (_3!652 lt!320705)) (select (arr!5483 (buf!5058 (_2!9421 lt!320322))) (_3!652 lt!320705)) lt!320703 #b00000000000000000000000000001000))))

(assert (=> b!205358 (=> (not res!172146) (not e!140520))))

(declare-fun e!140519 () Bool)

(declare-fun b!205359 () Bool)

(declare-fun arrayRangesEq!698 (array!10357 array!10357 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!205359 (= e!140519 (arrayRangesEq!698 (buf!5058 (_2!9421 lt!320318)) (buf!5058 (_2!9421 lt!320322)) (_1!9428 lt!320705) (_2!9428 lt!320705)))))

(declare-fun b!205360 () Bool)

(declare-fun e!140518 () Bool)

(assert (=> b!205360 (= e!140518 call!3252)))

(declare-fun b!205362 () Bool)

(declare-fun e!140517 () Bool)

(declare-fun e!140522 () Bool)

(assert (=> b!205362 (= e!140517 e!140522)))

(declare-fun res!172142 () Bool)

(assert (=> b!205362 (=> (not res!172142) (not e!140522))))

(assert (=> b!205362 (= res!172142 e!140519)))

(declare-fun res!172143 () Bool)

(assert (=> b!205362 (=> res!172143 e!140519)))

(assert (=> b!205362 (= res!172143 (bvsge (_1!9428 lt!320705) (_2!9428 lt!320705)))))

(assert (=> b!205362 (= lt!320704 ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!4553 (buf!5058 (_2!9421 lt!320318))) (currentByte!9555 thiss!1204) (currentBit!9550 thiss!1204))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!205362 (= lt!320703 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!272)

(assert (=> b!205362 (= lt!320705 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!4553 (buf!5058 (_2!9421 lt!320318))) (currentByte!9555 thiss!1204) (currentBit!9550 thiss!1204)))))))

(declare-fun b!205363 () Bool)

(declare-fun res!172144 () Bool)

(assert (=> b!205363 (= res!172144 (= lt!320704 #b00000000000000000000000000000000))))

(assert (=> b!205363 (=> res!172144 e!140518)))

(assert (=> b!205363 (= e!140520 e!140518)))

(declare-fun b!205364 () Bool)

(assert (=> b!205364 (= e!140522 e!140521)))

(assert (=> b!205364 (= c!10163 (= (_3!652 lt!320705) (_4!136 lt!320705)))))

(declare-fun d!69965 () Bool)

(declare-fun res!172145 () Bool)

(assert (=> d!69965 (=> res!172145 e!140517)))

(assert (=> d!69965 (= res!172145 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!4553 (buf!5058 (_2!9421 lt!320318))) (currentByte!9555 thiss!1204) (currentBit!9550 thiss!1204)))))))

(assert (=> d!69965 (= (arrayBitRangesEq!0 (buf!5058 (_2!9421 lt!320318)) (buf!5058 (_2!9421 lt!320322)) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!4553 (buf!5058 (_2!9421 lt!320318))) (currentByte!9555 thiss!1204) (currentBit!9550 thiss!1204)))) e!140517)))

(declare-fun b!205361 () Bool)

(assert (=> b!205361 (= e!140521 call!3252)))

(assert (= (and d!69965 (not res!172145)) b!205362))

(assert (= (and b!205362 (not res!172143)) b!205359))

(assert (= (and b!205362 res!172142) b!205364))

(assert (= (and b!205364 c!10163) b!205361))

(assert (= (and b!205364 (not c!10163)) b!205358))

(assert (= (and b!205358 res!172146) b!205363))

(assert (= (and b!205363 (not res!172144)) b!205360))

(assert (= (or b!205361 b!205360) bm!3249))

(declare-fun m!316559 () Bool)

(assert (=> bm!3249 m!316559))

(declare-fun m!316561 () Bool)

(assert (=> bm!3249 m!316561))

(declare-fun m!316563 () Bool)

(assert (=> bm!3249 m!316563))

(declare-fun m!316565 () Bool)

(assert (=> bm!3249 m!316565))

(declare-fun m!316567 () Bool)

(assert (=> bm!3249 m!316567))

(assert (=> b!205358 m!316565))

(assert (=> b!205358 m!316567))

(assert (=> b!205358 m!316565))

(assert (=> b!205358 m!316567))

(declare-fun m!316569 () Bool)

(assert (=> b!205358 m!316569))

(declare-fun m!316571 () Bool)

(assert (=> b!205359 m!316571))

(declare-fun m!316573 () Bool)

(assert (=> b!205362 m!316573))

(assert (=> b!205094 d!69965))

(declare-fun d!69967 () Bool)

(declare-fun e!140523 () Bool)

(assert (=> d!69967 e!140523))

(declare-fun res!172148 () Bool)

(assert (=> d!69967 (=> (not res!172148) (not e!140523))))

(declare-fun lt!320710 () (_ BitVec 64))

(declare-fun lt!320709 () (_ BitVec 64))

(declare-fun lt!320706 () (_ BitVec 64))

(assert (=> d!69967 (= res!172148 (= lt!320709 (bvsub lt!320710 lt!320706)))))

(assert (=> d!69967 (or (= (bvand lt!320710 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!320706 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!320710 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!320710 lt!320706) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!69967 (= lt!320706 (remainingBits!0 ((_ sign_extend 32) (size!4553 (buf!5058 (_2!9421 lt!320318)))) ((_ sign_extend 32) (currentByte!9555 thiss!1204)) ((_ sign_extend 32) (currentBit!9550 thiss!1204))))))

(declare-fun lt!320711 () (_ BitVec 64))

(declare-fun lt!320708 () (_ BitVec 64))

(assert (=> d!69967 (= lt!320710 (bvmul lt!320711 lt!320708))))

(assert (=> d!69967 (or (= lt!320711 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!320708 (bvsdiv (bvmul lt!320711 lt!320708) lt!320711)))))

(assert (=> d!69967 (= lt!320708 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69967 (= lt!320711 ((_ sign_extend 32) (size!4553 (buf!5058 (_2!9421 lt!320318)))))))

(assert (=> d!69967 (= lt!320709 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9555 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9550 thiss!1204))))))

(assert (=> d!69967 (invariant!0 (currentBit!9550 thiss!1204) (currentByte!9555 thiss!1204) (size!4553 (buf!5058 (_2!9421 lt!320318))))))

(assert (=> d!69967 (= (bitIndex!0 (size!4553 (buf!5058 (_2!9421 lt!320318))) (currentByte!9555 thiss!1204) (currentBit!9550 thiss!1204)) lt!320709)))

(declare-fun b!205365 () Bool)

(declare-fun res!172147 () Bool)

(assert (=> b!205365 (=> (not res!172147) (not e!140523))))

(assert (=> b!205365 (= res!172147 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!320709))))

(declare-fun b!205366 () Bool)

(declare-fun lt!320707 () (_ BitVec 64))

(assert (=> b!205366 (= e!140523 (bvsle lt!320709 (bvmul lt!320707 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!205366 (or (= lt!320707 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!320707 #b0000000000000000000000000000000000000000000000000000000000001000) lt!320707)))))

(assert (=> b!205366 (= lt!320707 ((_ sign_extend 32) (size!4553 (buf!5058 (_2!9421 lt!320318)))))))

(assert (= (and d!69967 res!172148) b!205365))

(assert (= (and b!205365 res!172147) b!205366))

(declare-fun m!316575 () Bool)

(assert (=> d!69967 m!316575))

(assert (=> d!69967 m!316265))

(assert (=> b!205094 d!69967))

(declare-fun d!69969 () Bool)

(assert (=> d!69969 (= (invariant!0 (currentBit!9550 thiss!1204) (currentByte!9555 thiss!1204) (size!4553 (buf!5058 (_2!9421 lt!320318)))) (and (bvsge (currentBit!9550 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9550 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9555 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9555 thiss!1204) (size!4553 (buf!5058 (_2!9421 lt!320318)))) (and (= (currentBit!9550 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9555 thiss!1204) (size!4553 (buf!5058 (_2!9421 lt!320318))))))))))

(assert (=> b!205083 d!69969))

(assert (=> b!205098 d!69873))

(declare-fun d!69971 () Bool)

(declare-fun res!172150 () Bool)

(declare-fun e!140524 () Bool)

(assert (=> d!69971 (=> (not res!172150) (not e!140524))))

(assert (=> d!69971 (= res!172150 (= (size!4553 (buf!5058 (_2!9421 lt!320318))) (size!4553 (buf!5058 (_2!9421 lt!320322)))))))

(assert (=> d!69971 (= (isPrefixOf!0 (_2!9421 lt!320318) (_2!9421 lt!320322)) e!140524)))

(declare-fun b!205367 () Bool)

(declare-fun res!172149 () Bool)

(assert (=> b!205367 (=> (not res!172149) (not e!140524))))

(assert (=> b!205367 (= res!172149 (bvsle (bitIndex!0 (size!4553 (buf!5058 (_2!9421 lt!320318))) (currentByte!9555 (_2!9421 lt!320318)) (currentBit!9550 (_2!9421 lt!320318))) (bitIndex!0 (size!4553 (buf!5058 (_2!9421 lt!320322))) (currentByte!9555 (_2!9421 lt!320322)) (currentBit!9550 (_2!9421 lt!320322)))))))

(declare-fun b!205368 () Bool)

(declare-fun e!140525 () Bool)

(assert (=> b!205368 (= e!140524 e!140525)))

(declare-fun res!172151 () Bool)

(assert (=> b!205368 (=> res!172151 e!140525)))

(assert (=> b!205368 (= res!172151 (= (size!4553 (buf!5058 (_2!9421 lt!320318))) #b00000000000000000000000000000000))))

(declare-fun b!205369 () Bool)

(assert (=> b!205369 (= e!140525 (arrayBitRangesEq!0 (buf!5058 (_2!9421 lt!320318)) (buf!5058 (_2!9421 lt!320322)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4553 (buf!5058 (_2!9421 lt!320318))) (currentByte!9555 (_2!9421 lt!320318)) (currentBit!9550 (_2!9421 lt!320318)))))))

(assert (= (and d!69971 res!172150) b!205367))

(assert (= (and b!205367 res!172149) b!205368))

(assert (= (and b!205368 (not res!172151)) b!205369))

(assert (=> b!205367 m!316257))

(assert (=> b!205367 m!316291))

(assert (=> b!205369 m!316257))

(assert (=> b!205369 m!316257))

(declare-fun m!316577 () Bool)

(assert (=> b!205369 m!316577))

(assert (=> b!205084 d!69971))

(declare-fun d!69973 () Bool)

(declare-datatypes ((tuple2!17552 0))(
  ( (tuple2!17553 (_1!9429 Bool) (_2!9429 BitStream!8214)) )
))
(declare-fun lt!320714 () tuple2!17552)

(declare-fun readBit!0 (BitStream!8214) tuple2!17552)

(assert (=> d!69973 (= lt!320714 (readBit!0 (readerFrom!0 (_2!9421 lt!320318) (currentBit!9550 thiss!1204) (currentByte!9555 thiss!1204))))))

(assert (=> d!69973 (= (readBitPure!0 (readerFrom!0 (_2!9421 lt!320318) (currentBit!9550 thiss!1204) (currentByte!9555 thiss!1204))) (tuple2!17541 (_2!9429 lt!320714) (_1!9429 lt!320714)))))

(declare-fun bs!17205 () Bool)

(assert (= bs!17205 d!69973))

(assert (=> bs!17205 m!316261))

(declare-fun m!316579 () Bool)

(assert (=> bs!17205 m!316579))

(assert (=> b!205087 d!69973))

(declare-fun d!69975 () Bool)

(declare-fun e!140534 () Bool)

(assert (=> d!69975 e!140534))

(declare-fun res!172163 () Bool)

(assert (=> d!69975 (=> (not res!172163) (not e!140534))))

(assert (=> d!69975 (= res!172163 (invariant!0 (currentBit!9550 (_2!9421 lt!320318)) (currentByte!9555 (_2!9421 lt!320318)) (size!4553 (buf!5058 (_2!9421 lt!320318)))))))

(assert (=> d!69975 (= (readerFrom!0 (_2!9421 lt!320318) (currentBit!9550 thiss!1204) (currentByte!9555 thiss!1204)) (BitStream!8215 (buf!5058 (_2!9421 lt!320318)) (currentByte!9555 thiss!1204) (currentBit!9550 thiss!1204)))))

(declare-fun b!205384 () Bool)

(assert (=> b!205384 (= e!140534 (invariant!0 (currentBit!9550 thiss!1204) (currentByte!9555 thiss!1204) (size!4553 (buf!5058 (_2!9421 lt!320318)))))))

(assert (= (and d!69975 res!172163) b!205384))

(assert (=> d!69975 m!316343))

(assert (=> b!205384 m!316265))

(assert (=> b!205087 d!69975))

(assert (=> b!205097 d!69865))

(assert (=> b!205097 d!69867))

(declare-fun d!69977 () Bool)

(assert (=> d!69977 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!4553 (buf!5058 (_2!9421 lt!320318)))) ((_ sign_extend 32) (currentByte!9555 thiss!1204)) ((_ sign_extend 32) (currentBit!9550 thiss!1204))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4553 (buf!5058 (_2!9421 lt!320318)))) ((_ sign_extend 32) (currentByte!9555 thiss!1204)) ((_ sign_extend 32) (currentBit!9550 thiss!1204))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!17206 () Bool)

(assert (= bs!17206 d!69977))

(assert (=> bs!17206 m!316575))

(assert (=> b!205085 d!69977))

(declare-fun d!69979 () Bool)

(assert (=> d!69979 (= (invariant!0 (currentBit!9550 (_2!9421 lt!320322)) (currentByte!9555 (_2!9421 lt!320322)) (size!4553 (buf!5058 (_2!9421 lt!320322)))) (and (bvsge (currentBit!9550 (_2!9421 lt!320322)) #b00000000000000000000000000000000) (bvslt (currentBit!9550 (_2!9421 lt!320322)) #b00000000000000000000000000001000) (bvsge (currentByte!9555 (_2!9421 lt!320322)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9555 (_2!9421 lt!320322)) (size!4553 (buf!5058 (_2!9421 lt!320322)))) (and (= (currentBit!9550 (_2!9421 lt!320322)) #b00000000000000000000000000000000) (= (currentByte!9555 (_2!9421 lt!320322)) (size!4553 (buf!5058 (_2!9421 lt!320322))))))))))

(assert (=> b!205086 d!69979))

(check-sat (not b!205337) (not b!205359) (not bm!3249) (not b!205184) (not d!69865) (not b!205358) (not b!205367) (not b!205339) (not d!69869) (not b!205167) (not d!69963) (not d!69867) (not d!69975) (not b!205329) (not b!205177) (not b!205170) (not b!205384) (not b!205338) (not b!205335) (not bm!3246) (not d!69881) (not b!205330) (not b!205369) (not b!205333) (not d!69967) (not d!69875) (not d!69973) (not b!205327) (not b!205182) (not b!205326) (not d!69883) (not d!69877) (not b!205362) (not d!69977) (not d!69863) (not b!205179) (not b!205340) (not b!205169) (not b!205168))
