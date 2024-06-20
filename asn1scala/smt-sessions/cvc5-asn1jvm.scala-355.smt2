; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8290 () Bool)

(assert start!8290)

(declare-fun b!41451 () Bool)

(declare-fun e!27502 () Bool)

(declare-datatypes ((array!2093 0))(
  ( (array!2094 (arr!1445 (Array (_ BitVec 32) (_ BitVec 8))) (size!946 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1636 0))(
  ( (BitStream!1637 (buf!1274 array!2093) (currentByte!2717 (_ BitVec 32)) (currentBit!2712 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1636)

(declare-fun array_inv!871 (array!2093) Bool)

(assert (=> b!41451 (= e!27502 (array_inv!871 (buf!1274 thiss!1379)))))

(declare-fun res!35262 () Bool)

(declare-fun e!27503 () Bool)

(assert (=> start!8290 (=> (not res!35262) (not e!27503))))

(declare-fun srcBuffer!2 () array!2093)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!8290 (= res!35262 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!946 srcBuffer!2))))))))

(assert (=> start!8290 e!27503))

(assert (=> start!8290 true))

(assert (=> start!8290 (array_inv!871 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1636) Bool)

(assert (=> start!8290 (and (inv!12 thiss!1379) e!27502)))

(declare-fun b!41452 () Bool)

(declare-fun e!27505 () Bool)

(declare-datatypes ((tuple2!4006 0))(
  ( (tuple2!4007 (_1!2090 array!2093) (_2!2090 BitStream!1636)) )
))
(declare-fun lt!62634 () tuple2!4006)

(assert (=> b!41452 (= e!27505 (or (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 (bvsub to!314 i!635))) (bvsle (bvsub to!314 i!635) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!946 (_1!2090 lt!62634)))))))))

(declare-fun readBits!0 (BitStream!1636 (_ BitVec 64)) tuple2!4006)

(declare-datatypes ((tuple2!4008 0))(
  ( (tuple2!4009 (_1!2091 BitStream!1636) (_2!2091 BitStream!1636)) )
))
(declare-fun reader!0 (BitStream!1636 BitStream!1636) tuple2!4008)

(assert (=> b!41452 (= lt!62634 (readBits!0 (_1!2091 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!41453 () Bool)

(declare-fun res!35259 () Bool)

(assert (=> b!41453 (=> (not res!35259) (not e!27503))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!41453 (= res!35259 (validate_offset_bits!1 ((_ sign_extend 32) (size!946 (buf!1274 thiss!1379))) ((_ sign_extend 32) (currentByte!2717 thiss!1379)) ((_ sign_extend 32) (currentBit!2712 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!41454 () Bool)

(assert (=> b!41454 (= e!27503 (not e!27505))))

(declare-fun res!35261 () Bool)

(assert (=> b!41454 (=> res!35261 e!27505)))

(declare-fun lt!62633 () (_ BitVec 64))

(assert (=> b!41454 (= res!35261 (or (bvslt i!635 to!314) (not (= lt!62633 (bvsub (bvadd lt!62633 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!1636 BitStream!1636) Bool)

(assert (=> b!41454 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!2940 0))(
  ( (Unit!2941) )
))
(declare-fun lt!62635 () Unit!2940)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1636) Unit!2940)

(assert (=> b!41454 (= lt!62635 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!41454 (= lt!62633 (bitIndex!0 (size!946 (buf!1274 thiss!1379)) (currentByte!2717 thiss!1379) (currentBit!2712 thiss!1379)))))

(declare-fun b!41455 () Bool)

(declare-fun res!35260 () Bool)

(assert (=> b!41455 (=> res!35260 e!27505)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!41455 (= res!35260 (not (invariant!0 (currentBit!2712 thiss!1379) (currentByte!2717 thiss!1379) (size!946 (buf!1274 thiss!1379)))))))

(assert (= (and start!8290 res!35262) b!41453))

(assert (= (and b!41453 res!35259) b!41454))

(assert (= (and b!41454 (not res!35261)) b!41455))

(assert (= (and b!41455 (not res!35260)) b!41452))

(assert (= start!8290 b!41451))

(declare-fun m!63187 () Bool)

(assert (=> b!41455 m!63187))

(declare-fun m!63189 () Bool)

(assert (=> b!41451 m!63189))

(declare-fun m!63191 () Bool)

(assert (=> start!8290 m!63191))

(declare-fun m!63193 () Bool)

(assert (=> start!8290 m!63193))

(declare-fun m!63195 () Bool)

(assert (=> b!41454 m!63195))

(declare-fun m!63197 () Bool)

(assert (=> b!41454 m!63197))

(declare-fun m!63199 () Bool)

(assert (=> b!41454 m!63199))

(declare-fun m!63201 () Bool)

(assert (=> b!41453 m!63201))

(declare-fun m!63203 () Bool)

(assert (=> b!41452 m!63203))

(declare-fun m!63205 () Bool)

(assert (=> b!41452 m!63205))

(push 1)

(assert (not start!8290))

(assert (not b!41454))

(assert (not b!41455))

(assert (not b!41452))

(assert (not b!41453))

(assert (not b!41451))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!12108 () Bool)

(assert (=> d!12108 (= (invariant!0 (currentBit!2712 thiss!1379) (currentByte!2717 thiss!1379) (size!946 (buf!1274 thiss!1379))) (and (bvsge (currentBit!2712 thiss!1379) #b00000000000000000000000000000000) (bvslt (currentBit!2712 thiss!1379) #b00000000000000000000000000001000) (bvsge (currentByte!2717 thiss!1379) #b00000000000000000000000000000000) (or (bvslt (currentByte!2717 thiss!1379) (size!946 (buf!1274 thiss!1379))) (and (= (currentBit!2712 thiss!1379) #b00000000000000000000000000000000) (= (currentByte!2717 thiss!1379) (size!946 (buf!1274 thiss!1379)))))))))

(assert (=> b!41455 d!12108))

(declare-fun d!12110 () Bool)

(declare-fun res!35293 () Bool)

(declare-fun e!27541 () Bool)

(assert (=> d!12110 (=> (not res!35293) (not e!27541))))

(assert (=> d!12110 (= res!35293 (= (size!946 (buf!1274 thiss!1379)) (size!946 (buf!1274 thiss!1379))))))

(assert (=> d!12110 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!27541)))

(declare-fun b!41492 () Bool)

(declare-fun res!35294 () Bool)

(assert (=> b!41492 (=> (not res!35294) (not e!27541))))

(assert (=> b!41492 (= res!35294 (bvsle (bitIndex!0 (size!946 (buf!1274 thiss!1379)) (currentByte!2717 thiss!1379) (currentBit!2712 thiss!1379)) (bitIndex!0 (size!946 (buf!1274 thiss!1379)) (currentByte!2717 thiss!1379) (currentBit!2712 thiss!1379))))))

(declare-fun b!41493 () Bool)

(declare-fun e!27540 () Bool)

(assert (=> b!41493 (= e!27541 e!27540)))

(declare-fun res!35295 () Bool)

(assert (=> b!41493 (=> res!35295 e!27540)))

(assert (=> b!41493 (= res!35295 (= (size!946 (buf!1274 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!41494 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2093 array!2093 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!41494 (= e!27540 (arrayBitRangesEq!0 (buf!1274 thiss!1379) (buf!1274 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!946 (buf!1274 thiss!1379)) (currentByte!2717 thiss!1379) (currentBit!2712 thiss!1379))))))

(assert (= (and d!12110 res!35293) b!41492))

(assert (= (and b!41492 res!35294) b!41493))

(assert (= (and b!41493 (not res!35295)) b!41494))

(assert (=> b!41492 m!63199))

(assert (=> b!41492 m!63199))

(assert (=> b!41494 m!63199))

(assert (=> b!41494 m!63199))

(declare-fun m!63249 () Bool)

(assert (=> b!41494 m!63249))

(assert (=> b!41454 d!12110))

(declare-fun d!12118 () Bool)

(assert (=> d!12118 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!62656 () Unit!2940)

(declare-fun choose!11 (BitStream!1636) Unit!2940)

(assert (=> d!12118 (= lt!62656 (choose!11 thiss!1379))))

(assert (=> d!12118 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!62656)))

(declare-fun bs!3246 () Bool)

(assert (= bs!3246 d!12118))

(assert (=> bs!3246 m!63195))

(declare-fun m!63251 () Bool)

(assert (=> bs!3246 m!63251))

(assert (=> b!41454 d!12118))

(declare-fun d!12120 () Bool)

(declare-fun e!27547 () Bool)

(assert (=> d!12120 e!27547))

(declare-fun res!35316 () Bool)

(assert (=> d!12120 (=> (not res!35316) (not e!27547))))

(declare-fun lt!62696 () (_ BitVec 64))

(declare-fun lt!62701 () (_ BitVec 64))

(declare-fun lt!62698 () (_ BitVec 64))

(assert (=> d!12120 (= res!35316 (= lt!62696 (bvsub lt!62698 lt!62701)))))

(assert (=> d!12120 (or (= (bvand lt!62698 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!62701 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!62698 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!62698 lt!62701) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!12120 (= lt!62701 (remainingBits!0 ((_ sign_extend 32) (size!946 (buf!1274 thiss!1379))) ((_ sign_extend 32) (currentByte!2717 thiss!1379)) ((_ sign_extend 32) (currentBit!2712 thiss!1379))))))

(declare-fun lt!62697 () (_ BitVec 64))

(declare-fun lt!62700 () (_ BitVec 64))

(assert (=> d!12120 (= lt!62698 (bvmul lt!62697 lt!62700))))

(assert (=> d!12120 (or (= lt!62697 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!62700 (bvsdiv (bvmul lt!62697 lt!62700) lt!62697)))))

(assert (=> d!12120 (= lt!62700 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!12120 (= lt!62697 ((_ sign_extend 32) (size!946 (buf!1274 thiss!1379))))))

(assert (=> d!12120 (= lt!62696 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2717 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2712 thiss!1379))))))

(assert (=> d!12120 (invariant!0 (currentBit!2712 thiss!1379) (currentByte!2717 thiss!1379) (size!946 (buf!1274 thiss!1379)))))

(assert (=> d!12120 (= (bitIndex!0 (size!946 (buf!1274 thiss!1379)) (currentByte!2717 thiss!1379) (currentBit!2712 thiss!1379)) lt!62696)))

(declare-fun b!41514 () Bool)

(declare-fun res!35315 () Bool)

(assert (=> b!41514 (=> (not res!35315) (not e!27547))))

(assert (=> b!41514 (= res!35315 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!62696))))

(declare-fun b!41515 () Bool)

(declare-fun lt!62699 () (_ BitVec 64))

(assert (=> b!41515 (= e!27547 (bvsle lt!62696 (bvmul lt!62699 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!41515 (or (= lt!62699 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!62699 #b0000000000000000000000000000000000000000000000000000000000001000) lt!62699)))))

(assert (=> b!41515 (= lt!62699 ((_ sign_extend 32) (size!946 (buf!1274 thiss!1379))))))

(assert (= (and d!12120 res!35316) b!41514))

(assert (= (and b!41514 res!35315) b!41515))

(declare-fun m!63265 () Bool)

(assert (=> d!12120 m!63265))

(assert (=> d!12120 m!63187))

(assert (=> b!41454 d!12120))

(declare-fun d!12124 () Bool)

(assert (=> d!12124 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!946 (buf!1274 thiss!1379))) ((_ sign_extend 32) (currentByte!2717 thiss!1379)) ((_ sign_extend 32) (currentBit!2712 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!946 (buf!1274 thiss!1379))) ((_ sign_extend 32) (currentByte!2717 thiss!1379)) ((_ sign_extend 32) (currentBit!2712 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!3247 () Bool)

(assert (= bs!3247 d!12124))

(assert (=> bs!3247 m!63265))

(assert (=> b!41453 d!12124))

(declare-fun d!12126 () Bool)

(assert (=> d!12126 (= (array_inv!871 (buf!1274 thiss!1379)) (bvsge (size!946 (buf!1274 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!41451 d!12126))

(declare-fun b!41575 () Bool)

(declare-fun res!35366 () Bool)

(declare-fun e!27569 () Bool)

(assert (=> b!41575 (=> (not res!35366) (not e!27569))))

(declare-fun lt!62856 () tuple2!4006)

(assert (=> b!41575 (= res!35366 (bvsle (currentByte!2717 (_1!2091 (reader!0 thiss!1379 thiss!1379))) (currentByte!2717 (_2!2090 lt!62856))))))

(declare-fun b!41576 () Bool)

(declare-fun res!35369 () Bool)

(assert (=> b!41576 (=> (not res!35369) (not e!27569))))

(declare-fun lt!62851 () (_ BitVec 64))

(assert (=> b!41576 (= res!35369 (= (size!946 (_1!2090 lt!62856)) ((_ extract 31 0) lt!62851)))))

(assert (=> b!41576 (and (bvslt lt!62851 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!62851 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!62853 () (_ BitVec 64))

(declare-fun lt!62858 () (_ BitVec 64))

(assert (=> b!41576 (= lt!62851 (bvsdiv lt!62853 lt!62858))))

(assert (=> b!41576 (and (not (= lt!62858 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!62853 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!62858 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!41576 (= lt!62858 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!62855 () (_ BitVec 64))

(declare-fun lt!62852 () (_ BitVec 64))

(assert (=> b!41576 (= lt!62853 (bvsub lt!62855 lt!62852))))

(assert (=> b!41576 (or (= (bvand lt!62855 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!62852 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!62855 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!62855 lt!62852) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!41576 (= lt!62852 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!62850 () (_ BitVec 64))

(assert (=> b!41576 (= lt!62855 (bvadd (bvsub to!314 i!635) lt!62850))))

(assert (=> b!41576 (or (not (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!62850 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd (bvsub to!314 i!635) lt!62850) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!41576 (= lt!62850 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun b!41577 () Bool)

(declare-fun res!35367 () Bool)

(assert (=> b!41577 (=> (not res!35367) (not e!27569))))

(declare-fun lt!62854 () (_ BitVec 64))

(assert (=> b!41577 (= res!35367 (= (bvadd lt!62854 (bvsub to!314 i!635)) (bitIndex!0 (size!946 (buf!1274 (_2!2090 lt!62856))) (currentByte!2717 (_2!2090 lt!62856)) (currentBit!2712 (_2!2090 lt!62856)))))))

(assert (=> b!41577 (or (not (= (bvand lt!62854 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!62854 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!62854 (bvsub to!314 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!41577 (= lt!62854 (bitIndex!0 (size!946 (buf!1274 (_1!2091 (reader!0 thiss!1379 thiss!1379)))) (currentByte!2717 (_1!2091 (reader!0 thiss!1379 thiss!1379))) (currentBit!2712 (_1!2091 (reader!0 thiss!1379 thiss!1379)))))))

(declare-fun d!12128 () Bool)

(assert (=> d!12128 e!27569))

(declare-fun res!35370 () Bool)

(assert (=> d!12128 (=> (not res!35370) (not e!27569))))

(assert (=> d!12128 (= res!35370 (= (buf!1274 (_2!2090 lt!62856)) (buf!1274 (_1!2091 (reader!0 thiss!1379 thiss!1379)))))))

(declare-datatypes ((tuple3!164 0))(
  ( (tuple3!165 (_1!2098 Unit!2940) (_2!2098 BitStream!1636) (_3!89 array!2093)) )
))
(declare-fun lt!62857 () tuple3!164)

(assert (=> d!12128 (= lt!62856 (tuple2!4007 (_3!89 lt!62857) (_2!2098 lt!62857)))))

(declare-fun readBitsLoop!0 (BitStream!1636 (_ BitVec 64) array!2093 (_ BitVec 64) (_ BitVec 64)) tuple3!164)

(assert (=> d!12128 (= lt!62857 (readBitsLoop!0 (_1!2091 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635) (array!2094 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)))))

(assert (=> d!12128 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)) (bvsle (bvsub to!314 i!635) #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!12128 (= (readBits!0 (_1!2091 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)) lt!62856)))

(declare-fun b!41578 () Bool)

(declare-fun res!35368 () Bool)

(assert (=> b!41578 (=> (not res!35368) (not e!27569))))

(assert (=> b!41578 (= res!35368 (invariant!0 (currentBit!2712 (_2!2090 lt!62856)) (currentByte!2717 (_2!2090 lt!62856)) (size!946 (buf!1274 (_2!2090 lt!62856)))))))

(declare-fun b!41579 () Bool)

(declare-datatypes ((List!488 0))(
  ( (Nil!485) (Cons!484 (h!603 Bool) (t!1238 List!488)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!1636 array!2093 (_ BitVec 64) (_ BitVec 64)) List!488)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1636 BitStream!1636 (_ BitVec 64)) List!488)

(assert (=> b!41579 (= e!27569 (= (byteArrayBitContentToList!0 (_2!2090 lt!62856) (_1!2090 lt!62856) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)) (bitStreamReadBitsIntoList!0 (_2!2090 lt!62856) (_1!2091 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635))))))

(assert (= (and d!12128 res!35370) b!41577))

(assert (= (and b!41577 res!35367) b!41578))

(assert (= (and b!41578 res!35368) b!41576))

(assert (= (and b!41576 res!35369) b!41575))

(assert (= (and b!41575 res!35366) b!41579))

(declare-fun m!63303 () Bool)

(assert (=> b!41577 m!63303))

(declare-fun m!63305 () Bool)

(assert (=> b!41577 m!63305))

(declare-fun m!63307 () Bool)

(assert (=> d!12128 m!63307))

(declare-fun m!63309 () Bool)

(assert (=> b!41578 m!63309))

(declare-fun m!63311 () Bool)

(assert (=> b!41579 m!63311))

(declare-fun m!63313 () Bool)

(assert (=> b!41579 m!63313))

(assert (=> b!41452 d!12128))

(declare-fun e!27588 () Bool)

(declare-fun lt!62958 () (_ BitVec 64))

(declare-fun b!41616 () Bool)

(declare-fun lt!62968 () (_ BitVec 64))

(declare-fun lt!62966 () tuple2!4008)

(declare-fun withMovedBitIndex!0 (BitStream!1636 (_ BitVec 64)) BitStream!1636)

(assert (=> b!41616 (= e!27588 (= (_1!2091 lt!62966) (withMovedBitIndex!0 (_2!2091 lt!62966) (bvsub lt!62968 lt!62958))))))

(assert (=> b!41616 (or (= (bvand lt!62968 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!62958 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!62968 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!62968 lt!62958) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!41616 (= lt!62958 (bitIndex!0 (size!946 (buf!1274 thiss!1379)) (currentByte!2717 thiss!1379) (currentBit!2712 thiss!1379)))))

(assert (=> b!41616 (= lt!62968 (bitIndex!0 (size!946 (buf!1274 thiss!1379)) (currentByte!2717 thiss!1379) (currentBit!2712 thiss!1379)))))

(declare-fun d!12144 () Bool)

(assert (=> d!12144 e!27588))

(declare-fun res!35402 () Bool)

(assert (=> d!12144 (=> (not res!35402) (not e!27588))))

(assert (=> d!12144 (= res!35402 (isPrefixOf!0 (_1!2091 lt!62966) (_2!2091 lt!62966)))))

(declare-fun lt!62967 () BitStream!1636)

(assert (=> d!12144 (= lt!62966 (tuple2!4009 lt!62967 thiss!1379))))

(declare-fun lt!62961 () Unit!2940)

(declare-fun lt!62959 () Unit!2940)

(assert (=> d!12144 (= lt!62961 lt!62959)))

(assert (=> d!12144 (isPrefixOf!0 lt!62967 thiss!1379)))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1636 BitStream!1636 BitStream!1636) Unit!2940)

(assert (=> d!12144 (= lt!62959 (lemmaIsPrefixTransitive!0 lt!62967 thiss!1379 thiss!1379))))

(declare-fun lt!62970 () Unit!2940)

(declare-fun lt!62974 () Unit!2940)

(assert (=> d!12144 (= lt!62970 lt!62974)))

(assert (=> d!12144 (isPrefixOf!0 lt!62967 thiss!1379)))

(assert (=> d!12144 (= lt!62974 (lemmaIsPrefixTransitive!0 lt!62967 thiss!1379 thiss!1379))))

(declare-fun lt!62963 () Unit!2940)

(declare-fun e!27589 () Unit!2940)

(assert (=> d!12144 (= lt!62963 e!27589)))

(declare-fun c!2769 () Bool)

(assert (=> d!12144 (= c!2769 (not (= (size!946 (buf!1274 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!62972 () Unit!2940)

(declare-fun lt!62965 () Unit!2940)

(assert (=> d!12144 (= lt!62972 lt!62965)))

(assert (=> d!12144 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!12144 (= lt!62965 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!62975 () Unit!2940)

(declare-fun lt!62964 () Unit!2940)

(assert (=> d!12144 (= lt!62975 lt!62964)))

(assert (=> d!12144 (= lt!62964 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!62973 () Unit!2940)

(declare-fun lt!62976 () Unit!2940)

(assert (=> d!12144 (= lt!62973 lt!62976)))

(assert (=> d!12144 (isPrefixOf!0 lt!62967 lt!62967)))

(assert (=> d!12144 (= lt!62976 (lemmaIsPrefixRefl!0 lt!62967))))

(declare-fun lt!62971 () Unit!2940)

(declare-fun lt!62960 () Unit!2940)

(assert (=> d!12144 (= lt!62971 lt!62960)))

(assert (=> d!12144 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!12144 (= lt!62960 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!12144 (= lt!62967 (BitStream!1637 (buf!1274 thiss!1379) (currentByte!2717 thiss!1379) (currentBit!2712 thiss!1379)))))

(assert (=> d!12144 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!12144 (= (reader!0 thiss!1379 thiss!1379) lt!62966)))

(declare-fun b!41617 () Bool)

(declare-fun res!35403 () Bool)

(assert (=> b!41617 (=> (not res!35403) (not e!27588))))

(assert (=> b!41617 (= res!35403 (isPrefixOf!0 (_2!2091 lt!62966) thiss!1379))))

(declare-fun b!41618 () Bool)

(declare-fun Unit!2948 () Unit!2940)

(assert (=> b!41618 (= e!27589 Unit!2948)))

(declare-fun b!41619 () Bool)

(declare-fun lt!62977 () Unit!2940)

(assert (=> b!41619 (= e!27589 lt!62977)))

(declare-fun lt!62969 () (_ BitVec 64))

(assert (=> b!41619 (= lt!62969 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!62962 () (_ BitVec 64))

(assert (=> b!41619 (= lt!62962 (bitIndex!0 (size!946 (buf!1274 thiss!1379)) (currentByte!2717 thiss!1379) (currentBit!2712 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2093 array!2093 (_ BitVec 64) (_ BitVec 64)) Unit!2940)

(assert (=> b!41619 (= lt!62977 (arrayBitRangesEqSymmetric!0 (buf!1274 thiss!1379) (buf!1274 thiss!1379) lt!62969 lt!62962))))

(assert (=> b!41619 (arrayBitRangesEq!0 (buf!1274 thiss!1379) (buf!1274 thiss!1379) lt!62969 lt!62962)))

(declare-fun b!41620 () Bool)

(declare-fun res!35401 () Bool)

(assert (=> b!41620 (=> (not res!35401) (not e!27588))))

(assert (=> b!41620 (= res!35401 (isPrefixOf!0 (_1!2091 lt!62966) thiss!1379))))

(assert (= (and d!12144 c!2769) b!41619))

(assert (= (and d!12144 (not c!2769)) b!41618))

(assert (= (and d!12144 res!35402) b!41620))

(assert (= (and b!41620 res!35401) b!41617))

(assert (= (and b!41617 res!35403) b!41616))

(declare-fun m!63341 () Bool)

(assert (=> b!41620 m!63341))

(assert (=> d!12144 m!63195))

(declare-fun m!63343 () Bool)

(assert (=> d!12144 m!63343))

(declare-fun m!63345 () Bool)

(assert (=> d!12144 m!63345))

(declare-fun m!63347 () Bool)

(assert (=> d!12144 m!63347))

(assert (=> d!12144 m!63195))

(assert (=> d!12144 m!63197))

(assert (=> d!12144 m!63347))

(assert (=> d!12144 m!63195))

(declare-fun m!63349 () Bool)

(assert (=> d!12144 m!63349))

(assert (=> d!12144 m!63197))

(declare-fun m!63351 () Bool)

(assert (=> d!12144 m!63351))

(declare-fun m!63353 () Bool)

(assert (=> b!41616 m!63353))

(assert (=> b!41616 m!63199))

(assert (=> b!41616 m!63199))

(assert (=> b!41619 m!63199))

(declare-fun m!63355 () Bool)

(assert (=> b!41619 m!63355))

(declare-fun m!63357 () Bool)

(assert (=> b!41619 m!63357))

(declare-fun m!63359 () Bool)

(assert (=> b!41617 m!63359))

(assert (=> b!41452 d!12144))

(declare-fun d!12162 () Bool)

(assert (=> d!12162 (= (array_inv!871 srcBuffer!2) (bvsge (size!946 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!8290 d!12162))

(declare-fun d!12164 () Bool)

(assert (=> d!12164 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2712 thiss!1379) (currentByte!2717 thiss!1379) (size!946 (buf!1274 thiss!1379))))))

(declare-fun bs!3255 () Bool)

(assert (= bs!3255 d!12164))

(assert (=> bs!3255 m!63187))

(assert (=> start!8290 d!12164))

(push 1)

(assert (not d!12128))

(assert (not d!12144))

(assert (not d!12124))

(assert (not d!12120))

(assert (not b!41577))

(assert (not b!41616))

(assert (not d!12118))

(assert (not b!41492))

(assert (not b!41578))

(assert (not b!41620))

(assert (not b!41579))

(assert (not b!41494))

(assert (not d!12164))

(assert (not b!41617))

(assert (not b!41619))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

