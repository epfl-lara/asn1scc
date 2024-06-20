; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65814 () Bool)

(assert start!65814)

(declare-fun b!295265 () Bool)

(declare-fun e!211161 () Bool)

(declare-fun lt!429244 () Bool)

(declare-datatypes ((array!17689 0))(
  ( (array!17690 (arr!8708 (Array (_ BitVec 32) (_ BitVec 8))) (size!7667 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13338 0))(
  ( (BitStream!13339 (buf!7730 array!17689) (currentByte!14233 (_ BitVec 32)) (currentBit!14228 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!23232 0))(
  ( (tuple2!23233 (_1!12982 Bool) (_2!12982 BitStream!13338)) )
))
(declare-fun lt!429242 () tuple2!23232)

(assert (=> b!295265 (= e!211161 (not (= lt!429244 (_1!12982 lt!429242))))))

(declare-fun lt!429247 () array!17689)

(declare-fun from!505 () (_ BitVec 64))

(declare-fun bitAt!0 (array!17689 (_ BitVec 64)) Bool)

(assert (=> b!295265 (= (bitAt!0 lt!429247 from!505) lt!429244)))

(declare-datatypes ((Unit!20583 0))(
  ( (Unit!20584) )
))
(declare-datatypes ((tuple3!1850 0))(
  ( (tuple3!1851 (_1!12983 Unit!20583) (_2!12983 BitStream!13338) (_3!1366 array!17689)) )
))
(declare-fun lt!429246 () tuple3!1850)

(assert (=> b!295265 (= lt!429244 (bitAt!0 (_3!1366 lt!429246) from!505))))

(declare-fun lt!429240 () Unit!20583)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!17689 array!17689 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20583)

(assert (=> b!295265 (= lt!429240 (arrayBitRangesEqImpliesEq!0 lt!429247 (_3!1366 lt!429246) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun arr!273 () array!17689)

(declare-fun arrayBitRangesEq!0 (array!17689 array!17689 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!295265 (arrayBitRangesEq!0 arr!273 (_3!1366 lt!429246) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!429243 () Unit!20583)

(declare-fun arrayBitRangesEqTransitive!0 (array!17689 array!17689 array!17689 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20583)

(assert (=> b!295265 (= lt!429243 (arrayBitRangesEqTransitive!0 arr!273 lt!429247 (_3!1366 lt!429246) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!295265 (arrayBitRangesEq!0 arr!273 lt!429247 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!429245 () Unit!20583)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17689 (_ BitVec 64) Bool) Unit!20583)

(assert (=> b!295265 (= lt!429245 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12982 lt!429242)))))

(declare-fun e!211164 () Bool)

(assert (=> b!295265 e!211164))

(declare-fun res!243790 () Bool)

(assert (=> b!295265 (=> (not res!243790) (not e!211164))))

(declare-fun thiss!1728 () BitStream!13338)

(declare-fun to!474 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!295265 (= res!243790 (= (bvsub (bvadd (bitIndex!0 (size!7667 (buf!7730 thiss!1728)) (currentByte!14233 thiss!1728) (currentBit!14228 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7667 (buf!7730 (_2!12983 lt!429246))) (currentByte!14233 (_2!12983 lt!429246)) (currentBit!14228 (_2!12983 lt!429246)))))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun readBitsLoop!0 (BitStream!13338 (_ BitVec 64) array!17689 (_ BitVec 64) (_ BitVec 64)) tuple3!1850)

(assert (=> b!295265 (= lt!429246 (readBitsLoop!0 (_2!12982 lt!429242) nBits!523 lt!429247 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!295265 (validate_offset_bits!1 ((_ sign_extend 32) (size!7667 (buf!7730 (_2!12982 lt!429242)))) ((_ sign_extend 32) (currentByte!14233 (_2!12982 lt!429242))) ((_ sign_extend 32) (currentBit!14228 (_2!12982 lt!429242))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!429248 () Unit!20583)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!13338 BitStream!13338 (_ BitVec 64) (_ BitVec 64)) Unit!20583)

(assert (=> b!295265 (= lt!429248 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12982 lt!429242) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!429249 () (_ BitVec 32))

(declare-fun lt!429241 () (_ BitVec 32))

(assert (=> b!295265 (= lt!429247 (array!17690 (store (arr!8708 arr!273) lt!429249 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8708 arr!273) lt!429249)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!429241)))) ((_ sign_extend 24) (ite (_1!12982 lt!429242) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!429241) #b00000000))))) (size!7667 arr!273)))))

(assert (=> b!295265 (= lt!429241 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!295265 (= lt!429249 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!13338) tuple2!23232)

(assert (=> b!295265 (= lt!429242 (readBit!0 thiss!1728))))

(declare-fun res!243788 () Bool)

(assert (=> start!65814 (=> (not res!243788) (not e!211161))))

(assert (=> start!65814 (= res!243788 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7667 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65814 e!211161))

(declare-fun e!211160 () Bool)

(declare-fun inv!12 (BitStream!13338) Bool)

(assert (=> start!65814 (and (inv!12 thiss!1728) e!211160)))

(assert (=> start!65814 true))

(declare-fun array_inv!7279 (array!17689) Bool)

(assert (=> start!65814 (array_inv!7279 arr!273)))

(declare-fun b!295266 () Bool)

(assert (=> b!295266 (= e!211160 (array_inv!7279 (buf!7730 thiss!1728)))))

(declare-fun b!295267 () Bool)

(declare-fun res!243789 () Bool)

(assert (=> b!295267 (=> (not res!243789) (not e!211161))))

(assert (=> b!295267 (= res!243789 (bvslt from!505 to!474))))

(declare-fun b!295268 () Bool)

(assert (=> b!295268 (= e!211164 (and (= (buf!7730 thiss!1728) (buf!7730 (_2!12983 lt!429246))) (= (size!7667 arr!273) (size!7667 (_3!1366 lt!429246)))))))

(declare-fun b!295269 () Bool)

(declare-fun res!243791 () Bool)

(assert (=> b!295269 (=> (not res!243791) (not e!211161))))

(assert (=> b!295269 (= res!243791 (validate_offset_bits!1 ((_ sign_extend 32) (size!7667 (buf!7730 thiss!1728))) ((_ sign_extend 32) (currentByte!14233 thiss!1728)) ((_ sign_extend 32) (currentBit!14228 thiss!1728)) (bvsub nBits!523 from!505)))))

(assert (= (and start!65814 res!243788) b!295269))

(assert (= (and b!295269 res!243791) b!295267))

(assert (= (and b!295267 res!243789) b!295265))

(assert (= (and b!295265 res!243790) b!295268))

(assert (= start!65814 b!295266))

(declare-fun m!432371 () Bool)

(assert (=> b!295265 m!432371))

(declare-fun m!432373 () Bool)

(assert (=> b!295265 m!432373))

(declare-fun m!432375 () Bool)

(assert (=> b!295265 m!432375))

(declare-fun m!432377 () Bool)

(assert (=> b!295265 m!432377))

(declare-fun m!432379 () Bool)

(assert (=> b!295265 m!432379))

(declare-fun m!432381 () Bool)

(assert (=> b!295265 m!432381))

(declare-fun m!432383 () Bool)

(assert (=> b!295265 m!432383))

(declare-fun m!432385 () Bool)

(assert (=> b!295265 m!432385))

(declare-fun m!432387 () Bool)

(assert (=> b!295265 m!432387))

(declare-fun m!432389 () Bool)

(assert (=> b!295265 m!432389))

(declare-fun m!432391 () Bool)

(assert (=> b!295265 m!432391))

(declare-fun m!432393 () Bool)

(assert (=> b!295265 m!432393))

(declare-fun m!432395 () Bool)

(assert (=> b!295265 m!432395))

(declare-fun m!432397 () Bool)

(assert (=> b!295265 m!432397))

(declare-fun m!432399 () Bool)

(assert (=> b!295265 m!432399))

(declare-fun m!432401 () Bool)

(assert (=> b!295265 m!432401))

(declare-fun m!432403 () Bool)

(assert (=> start!65814 m!432403))

(declare-fun m!432405 () Bool)

(assert (=> start!65814 m!432405))

(declare-fun m!432407 () Bool)

(assert (=> b!295266 m!432407))

(declare-fun m!432409 () Bool)

(assert (=> b!295269 m!432409))

(check-sat (not b!295269) (not b!295265) (not start!65814) (not b!295266))
(check-sat)
(get-model)

(declare-fun d!99508 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!99508 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7667 (buf!7730 thiss!1728))) ((_ sign_extend 32) (currentByte!14233 thiss!1728)) ((_ sign_extend 32) (currentBit!14228 thiss!1728)) (bvsub nBits!523 from!505)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7667 (buf!7730 thiss!1728))) ((_ sign_extend 32) (currentByte!14233 thiss!1728)) ((_ sign_extend 32) (currentBit!14228 thiss!1728))) (bvsub nBits!523 from!505)))))

(declare-fun bs!25452 () Bool)

(assert (= bs!25452 d!99508))

(declare-fun m!432451 () Bool)

(assert (=> bs!25452 m!432451))

(assert (=> b!295269 d!99508))

(declare-fun d!99510 () Bool)

(declare-fun e!211182 () Bool)

(assert (=> d!99510 e!211182))

(declare-fun res!243806 () Bool)

(assert (=> d!99510 (=> (not res!243806) (not e!211182))))

(assert (=> d!99510 (= res!243806 (or (= (bvand (bvsub nBits!523 from!505) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!523 from!505) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!429282 () Unit!20583)

(declare-fun choose!27 (BitStream!13338 BitStream!13338 (_ BitVec 64) (_ BitVec 64)) Unit!20583)

(assert (=> d!99510 (= lt!429282 (choose!27 thiss!1728 (_2!12982 lt!429242) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!99510 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!523 from!505)))))

(assert (=> d!99510 (= (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12982 lt!429242) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001) lt!429282)))

(declare-fun b!295287 () Bool)

(assert (=> b!295287 (= e!211182 (validate_offset_bits!1 ((_ sign_extend 32) (size!7667 (buf!7730 (_2!12982 lt!429242)))) ((_ sign_extend 32) (currentByte!14233 (_2!12982 lt!429242))) ((_ sign_extend 32) (currentBit!14228 (_2!12982 lt!429242))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!99510 res!243806) b!295287))

(declare-fun m!432453 () Bool)

(assert (=> d!99510 m!432453))

(assert (=> b!295287 m!432381))

(assert (=> b!295265 d!99510))

(declare-fun d!99512 () Bool)

(declare-fun e!211185 () Bool)

(assert (=> d!99512 e!211185))

(declare-fun res!243809 () Bool)

(assert (=> d!99512 (=> (not res!243809) (not e!211185))))

(declare-fun lt!429294 () (_ BitVec 32))

(assert (=> d!99512 (= res!243809 (and (bvsge lt!429294 #b00000000000000000000000000000000) (bvslt lt!429294 (size!7667 arr!273))))))

(declare-fun lt!429291 () (_ BitVec 8))

(declare-fun lt!429292 () (_ BitVec 32))

(declare-fun lt!429293 () Unit!20583)

(declare-fun choose!53 (array!17689 (_ BitVec 64) Bool (_ BitVec 32) (_ BitVec 32) (_ BitVec 8)) Unit!20583)

(assert (=> d!99512 (= lt!429293 (choose!53 arr!273 from!505 (_1!12982 lt!429242) lt!429294 lt!429292 lt!429291))))

(assert (=> d!99512 (= lt!429291 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8708 arr!273) lt!429294)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!429292)))) ((_ sign_extend 24) (ite (_1!12982 lt!429242) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!429292) #b00000000)))))))

(assert (=> d!99512 (= lt!429292 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> d!99512 (= lt!429294 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> d!99512 (= (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12982 lt!429242)) lt!429293)))

(declare-fun b!295291 () Bool)

(assert (=> b!295291 (= e!211185 (arrayBitRangesEq!0 arr!273 (array!17690 (store (arr!8708 arr!273) lt!429294 lt!429291) (size!7667 arr!273)) #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (= (and d!99512 res!243809) b!295291))

(declare-fun m!432455 () Bool)

(assert (=> d!99512 m!432455))

(declare-fun m!432457 () Bool)

(assert (=> d!99512 m!432457))

(declare-fun m!432459 () Bool)

(assert (=> d!99512 m!432459))

(declare-fun m!432461 () Bool)

(assert (=> b!295291 m!432461))

(declare-fun m!432463 () Bool)

(assert (=> b!295291 m!432463))

(assert (=> b!295265 d!99512))

(declare-fun d!99514 () Bool)

(declare-fun e!211188 () Bool)

(assert (=> d!99514 e!211188))

(declare-fun res!243815 () Bool)

(assert (=> d!99514 (=> (not res!243815) (not e!211188))))

(declare-fun lt!429308 () (_ BitVec 64))

(declare-fun lt!429307 () (_ BitVec 64))

(declare-fun lt!429310 () (_ BitVec 64))

(assert (=> d!99514 (= res!243815 (= lt!429310 (bvsub lt!429308 lt!429307)))))

(assert (=> d!99514 (or (= (bvand lt!429308 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!429307 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!429308 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!429308 lt!429307) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!99514 (= lt!429307 (remainingBits!0 ((_ sign_extend 32) (size!7667 (buf!7730 (_2!12983 lt!429246)))) ((_ sign_extend 32) (currentByte!14233 (_2!12983 lt!429246))) ((_ sign_extend 32) (currentBit!14228 (_2!12983 lt!429246)))))))

(declare-fun lt!429311 () (_ BitVec 64))

(declare-fun lt!429312 () (_ BitVec 64))

(assert (=> d!99514 (= lt!429308 (bvmul lt!429311 lt!429312))))

(assert (=> d!99514 (or (= lt!429311 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!429312 (bvsdiv (bvmul lt!429311 lt!429312) lt!429311)))))

(assert (=> d!99514 (= lt!429312 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!99514 (= lt!429311 ((_ sign_extend 32) (size!7667 (buf!7730 (_2!12983 lt!429246)))))))

(assert (=> d!99514 (= lt!429310 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14233 (_2!12983 lt!429246))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14228 (_2!12983 lt!429246)))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!99514 (invariant!0 (currentBit!14228 (_2!12983 lt!429246)) (currentByte!14233 (_2!12983 lt!429246)) (size!7667 (buf!7730 (_2!12983 lt!429246))))))

(assert (=> d!99514 (= (bitIndex!0 (size!7667 (buf!7730 (_2!12983 lt!429246))) (currentByte!14233 (_2!12983 lt!429246)) (currentBit!14228 (_2!12983 lt!429246))) lt!429310)))

(declare-fun b!295296 () Bool)

(declare-fun res!243814 () Bool)

(assert (=> b!295296 (=> (not res!243814) (not e!211188))))

(assert (=> b!295296 (= res!243814 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!429310))))

(declare-fun b!295297 () Bool)

(declare-fun lt!429309 () (_ BitVec 64))

(assert (=> b!295297 (= e!211188 (bvsle lt!429310 (bvmul lt!429309 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!295297 (or (= lt!429309 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!429309 #b0000000000000000000000000000000000000000000000000000000000001000) lt!429309)))))

(assert (=> b!295297 (= lt!429309 ((_ sign_extend 32) (size!7667 (buf!7730 (_2!12983 lt!429246)))))))

(assert (= (and d!99514 res!243815) b!295296))

(assert (= (and b!295296 res!243814) b!295297))

(declare-fun m!432465 () Bool)

(assert (=> d!99514 m!432465))

(declare-fun m!432467 () Bool)

(assert (=> d!99514 m!432467))

(assert (=> b!295265 d!99514))

(declare-fun d!99516 () Bool)

(declare-fun res!243829 () Bool)

(declare-fun e!211206 () Bool)

(assert (=> d!99516 (=> res!243829 e!211206)))

(assert (=> d!99516 (= res!243829 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!99516 (= (arrayBitRangesEq!0 arr!273 (_3!1366 lt!429246) #b0000000000000000000000000000000000000000000000000000000000000000 from!505) e!211206)))

(declare-fun b!295315 () Bool)

(declare-fun e!211204 () Bool)

(declare-fun call!5066 () Bool)

(assert (=> b!295315 (= e!211204 call!5066)))

(declare-fun b!295316 () Bool)

(declare-fun e!211205 () Bool)

(assert (=> b!295316 (= e!211204 e!211205)))

(declare-fun res!243830 () Bool)

(declare-fun lt!429323 () (_ BitVec 32))

(declare-datatypes ((tuple4!882 0))(
  ( (tuple4!883 (_1!12986 (_ BitVec 32)) (_2!12986 (_ BitVec 32)) (_3!1368 (_ BitVec 32)) (_4!441 (_ BitVec 32))) )
))
(declare-fun lt!429324 () tuple4!882)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!295316 (= res!243830 (byteRangesEq!0 (select (arr!8708 arr!273) (_3!1368 lt!429324)) (select (arr!8708 (_3!1366 lt!429246)) (_3!1368 lt!429324)) lt!429323 #b00000000000000000000000000001000))))

(assert (=> b!295316 (=> (not res!243830) (not e!211205))))

(declare-fun lt!429322 () (_ BitVec 32))

(declare-fun c!13455 () Bool)

(declare-fun bm!5063 () Bool)

(assert (=> bm!5063 (= call!5066 (byteRangesEq!0 (ite c!13455 (select (arr!8708 arr!273) (_3!1368 lt!429324)) (select (arr!8708 arr!273) (_4!441 lt!429324))) (ite c!13455 (select (arr!8708 (_3!1366 lt!429246)) (_3!1368 lt!429324)) (select (arr!8708 (_3!1366 lt!429246)) (_4!441 lt!429324))) (ite c!13455 lt!429323 #b00000000000000000000000000000000) lt!429322))))

(declare-fun e!211209 () Bool)

(declare-fun b!295317 () Bool)

(declare-fun arrayRangesEq!1499 (array!17689 array!17689 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!295317 (= e!211209 (arrayRangesEq!1499 arr!273 (_3!1366 lt!429246) (_1!12986 lt!429324) (_2!12986 lt!429324)))))

(declare-fun b!295318 () Bool)

(declare-fun e!211208 () Bool)

(assert (=> b!295318 (= e!211206 e!211208)))

(declare-fun res!243831 () Bool)

(assert (=> b!295318 (=> (not res!243831) (not e!211208))))

(assert (=> b!295318 (= res!243831 e!211209)))

(declare-fun res!243833 () Bool)

(assert (=> b!295318 (=> res!243833 e!211209)))

(assert (=> b!295318 (= res!243833 (bvsge (_1!12986 lt!429324) (_2!12986 lt!429324)))))

(assert (=> b!295318 (= lt!429322 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!295318 (= lt!429323 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!882)

(assert (=> b!295318 (= lt!429324 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(declare-fun b!295319 () Bool)

(declare-fun res!243832 () Bool)

(assert (=> b!295319 (= res!243832 (= lt!429322 #b00000000000000000000000000000000))))

(declare-fun e!211207 () Bool)

(assert (=> b!295319 (=> res!243832 e!211207)))

(assert (=> b!295319 (= e!211205 e!211207)))

(declare-fun b!295320 () Bool)

(assert (=> b!295320 (= e!211208 e!211204)))

(assert (=> b!295320 (= c!13455 (= (_3!1368 lt!429324) (_4!441 lt!429324)))))

(declare-fun b!295321 () Bool)

(assert (=> b!295321 (= e!211207 call!5066)))

(assert (= (and d!99516 (not res!243829)) b!295318))

(assert (= (and b!295318 (not res!243833)) b!295317))

(assert (= (and b!295318 res!243831) b!295320))

(assert (= (and b!295320 c!13455) b!295315))

(assert (= (and b!295320 (not c!13455)) b!295316))

(assert (= (and b!295316 res!243830) b!295319))

(assert (= (and b!295319 (not res!243832)) b!295321))

(assert (= (or b!295315 b!295321) bm!5063))

(declare-fun m!432475 () Bool)

(assert (=> b!295316 m!432475))

(declare-fun m!432477 () Bool)

(assert (=> b!295316 m!432477))

(assert (=> b!295316 m!432475))

(assert (=> b!295316 m!432477))

(declare-fun m!432479 () Bool)

(assert (=> b!295316 m!432479))

(assert (=> bm!5063 m!432475))

(declare-fun m!432481 () Bool)

(assert (=> bm!5063 m!432481))

(declare-fun m!432483 () Bool)

(assert (=> bm!5063 m!432483))

(declare-fun m!432485 () Bool)

(assert (=> bm!5063 m!432485))

(assert (=> bm!5063 m!432477))

(declare-fun m!432487 () Bool)

(assert (=> b!295317 m!432487))

(declare-fun m!432489 () Bool)

(assert (=> b!295318 m!432489))

(assert (=> b!295265 d!99516))

(declare-fun d!99524 () Bool)

(assert (=> d!99524 (= (bitAt!0 (_3!1366 lt!429246) from!505) (not (= (bvand ((_ sign_extend 24) (select (arr!8708 (_3!1366 lt!429246)) ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!25454 () Bool)

(assert (= bs!25454 d!99524))

(declare-fun m!432491 () Bool)

(assert (=> bs!25454 m!432491))

(declare-fun m!432493 () Bool)

(assert (=> bs!25454 m!432493))

(assert (=> b!295265 d!99524))

(declare-fun d!99526 () Bool)

(declare-fun e!211210 () Bool)

(assert (=> d!99526 e!211210))

(declare-fun res!243835 () Bool)

(assert (=> d!99526 (=> (not res!243835) (not e!211210))))

(declare-fun lt!429326 () (_ BitVec 64))

(declare-fun lt!429328 () (_ BitVec 64))

(declare-fun lt!429325 () (_ BitVec 64))

(assert (=> d!99526 (= res!243835 (= lt!429328 (bvsub lt!429326 lt!429325)))))

(assert (=> d!99526 (or (= (bvand lt!429326 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!429325 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!429326 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!429326 lt!429325) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!99526 (= lt!429325 (remainingBits!0 ((_ sign_extend 32) (size!7667 (buf!7730 thiss!1728))) ((_ sign_extend 32) (currentByte!14233 thiss!1728)) ((_ sign_extend 32) (currentBit!14228 thiss!1728))))))

(declare-fun lt!429329 () (_ BitVec 64))

(declare-fun lt!429330 () (_ BitVec 64))

(assert (=> d!99526 (= lt!429326 (bvmul lt!429329 lt!429330))))

(assert (=> d!99526 (or (= lt!429329 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!429330 (bvsdiv (bvmul lt!429329 lt!429330) lt!429329)))))

(assert (=> d!99526 (= lt!429330 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!99526 (= lt!429329 ((_ sign_extend 32) (size!7667 (buf!7730 thiss!1728))))))

(assert (=> d!99526 (= lt!429328 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14233 thiss!1728)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14228 thiss!1728))))))

(assert (=> d!99526 (invariant!0 (currentBit!14228 thiss!1728) (currentByte!14233 thiss!1728) (size!7667 (buf!7730 thiss!1728)))))

(assert (=> d!99526 (= (bitIndex!0 (size!7667 (buf!7730 thiss!1728)) (currentByte!14233 thiss!1728) (currentBit!14228 thiss!1728)) lt!429328)))

(declare-fun b!295322 () Bool)

(declare-fun res!243834 () Bool)

(assert (=> b!295322 (=> (not res!243834) (not e!211210))))

(assert (=> b!295322 (= res!243834 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!429328))))

(declare-fun b!295323 () Bool)

(declare-fun lt!429327 () (_ BitVec 64))

(assert (=> b!295323 (= e!211210 (bvsle lt!429328 (bvmul lt!429327 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!295323 (or (= lt!429327 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!429327 #b0000000000000000000000000000000000000000000000000000000000001000) lt!429327)))))

(assert (=> b!295323 (= lt!429327 ((_ sign_extend 32) (size!7667 (buf!7730 thiss!1728))))))

(assert (= (and d!99526 res!243835) b!295322))

(assert (= (and b!295322 res!243834) b!295323))

(assert (=> d!99526 m!432451))

(declare-fun m!432495 () Bool)

(assert (=> d!99526 m!432495))

(assert (=> b!295265 d!99526))

(declare-fun d!99528 () Bool)

(assert (=> d!99528 (arrayBitRangesEq!0 arr!273 (_3!1366 lt!429246) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!429333 () Unit!20583)

(declare-fun choose!49 (array!17689 array!17689 array!17689 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20583)

(assert (=> d!99528 (= lt!429333 (choose!49 arr!273 lt!429247 (_3!1366 lt!429246) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!99528 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!99528 (= (arrayBitRangesEqTransitive!0 arr!273 lt!429247 (_3!1366 lt!429246) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) lt!429333)))

(declare-fun bs!25455 () Bool)

(assert (= bs!25455 d!99528))

(assert (=> bs!25455 m!432395))

(declare-fun m!432497 () Bool)

(assert (=> bs!25455 m!432497))

(assert (=> b!295265 d!99528))

(declare-fun d!99530 () Bool)

(declare-fun e!211217 () Bool)

(assert (=> d!99530 e!211217))

(declare-fun res!243838 () Bool)

(assert (=> d!99530 (=> (not res!243838) (not e!211217))))

(declare-datatypes ((tuple2!23236 0))(
  ( (tuple2!23237 (_1!12987 Unit!20583) (_2!12987 BitStream!13338)) )
))
(declare-fun increaseBitIndex!0 (BitStream!13338) tuple2!23236)

(assert (=> d!99530 (= res!243838 (= (buf!7730 (_2!12987 (increaseBitIndex!0 thiss!1728))) (buf!7730 thiss!1728)))))

(declare-fun lt!429353 () Bool)

(assert (=> d!99530 (= lt!429353 (not (= (bvand ((_ sign_extend 24) (select (arr!8708 (buf!7730 thiss!1728)) (currentByte!14233 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14228 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!429352 () tuple2!23232)

(assert (=> d!99530 (= lt!429352 (tuple2!23233 (not (= (bvand ((_ sign_extend 24) (select (arr!8708 (buf!7730 thiss!1728)) (currentByte!14233 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14228 thiss!1728)))) #b00000000000000000000000000000000)) (_2!12987 (increaseBitIndex!0 thiss!1728))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!99530 (validate_offset_bit!0 ((_ sign_extend 32) (size!7667 (buf!7730 thiss!1728))) ((_ sign_extend 32) (currentByte!14233 thiss!1728)) ((_ sign_extend 32) (currentBit!14228 thiss!1728)))))

(assert (=> d!99530 (= (readBit!0 thiss!1728) lt!429352)))

(declare-fun lt!429351 () (_ BitVec 64))

(declare-fun b!295326 () Bool)

(declare-fun lt!429354 () (_ BitVec 64))

(assert (=> b!295326 (= e!211217 (= (bitIndex!0 (size!7667 (buf!7730 (_2!12987 (increaseBitIndex!0 thiss!1728)))) (currentByte!14233 (_2!12987 (increaseBitIndex!0 thiss!1728))) (currentBit!14228 (_2!12987 (increaseBitIndex!0 thiss!1728)))) (bvadd lt!429354 lt!429351)))))

(assert (=> b!295326 (or (not (= (bvand lt!429354 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!429351 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!429354 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!429354 lt!429351) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!295326 (= lt!429351 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!295326 (= lt!429354 (bitIndex!0 (size!7667 (buf!7730 thiss!1728)) (currentByte!14233 thiss!1728) (currentBit!14228 thiss!1728)))))

(declare-fun lt!429348 () Bool)

(assert (=> b!295326 (= lt!429348 (not (= (bvand ((_ sign_extend 24) (select (arr!8708 (buf!7730 thiss!1728)) (currentByte!14233 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14228 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!429349 () Bool)

(assert (=> b!295326 (= lt!429349 (not (= (bvand ((_ sign_extend 24) (select (arr!8708 (buf!7730 thiss!1728)) (currentByte!14233 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14228 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!429350 () Bool)

(assert (=> b!295326 (= lt!429350 (not (= (bvand ((_ sign_extend 24) (select (arr!8708 (buf!7730 thiss!1728)) (currentByte!14233 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14228 thiss!1728)))) #b00000000000000000000000000000000)))))

(assert (= (and d!99530 res!243838) b!295326))

(declare-fun m!432499 () Bool)

(assert (=> d!99530 m!432499))

(declare-fun m!432501 () Bool)

(assert (=> d!99530 m!432501))

(declare-fun m!432503 () Bool)

(assert (=> d!99530 m!432503))

(declare-fun m!432505 () Bool)

(assert (=> d!99530 m!432505))

(assert (=> b!295326 m!432375))

(assert (=> b!295326 m!432499))

(declare-fun m!432507 () Bool)

(assert (=> b!295326 m!432507))

(assert (=> b!295326 m!432503))

(assert (=> b!295326 m!432501))

(assert (=> b!295265 d!99530))

(declare-fun d!99532 () Bool)

(declare-fun res!243839 () Bool)

(declare-fun e!211220 () Bool)

(assert (=> d!99532 (=> res!243839 e!211220)))

(assert (=> d!99532 (= res!243839 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!99532 (= (arrayBitRangesEq!0 arr!273 lt!429247 #b0000000000000000000000000000000000000000000000000000000000000000 from!505) e!211220)))

(declare-fun b!295327 () Bool)

(declare-fun e!211218 () Bool)

(declare-fun call!5067 () Bool)

(assert (=> b!295327 (= e!211218 call!5067)))

(declare-fun b!295328 () Bool)

(declare-fun e!211219 () Bool)

(assert (=> b!295328 (= e!211218 e!211219)))

(declare-fun lt!429356 () (_ BitVec 32))

(declare-fun lt!429357 () tuple4!882)

(declare-fun res!243840 () Bool)

(assert (=> b!295328 (= res!243840 (byteRangesEq!0 (select (arr!8708 arr!273) (_3!1368 lt!429357)) (select (arr!8708 lt!429247) (_3!1368 lt!429357)) lt!429356 #b00000000000000000000000000001000))))

(assert (=> b!295328 (=> (not res!243840) (not e!211219))))

(declare-fun lt!429355 () (_ BitVec 32))

(declare-fun c!13456 () Bool)

(declare-fun bm!5064 () Bool)

(assert (=> bm!5064 (= call!5067 (byteRangesEq!0 (ite c!13456 (select (arr!8708 arr!273) (_3!1368 lt!429357)) (select (arr!8708 arr!273) (_4!441 lt!429357))) (ite c!13456 (select (arr!8708 lt!429247) (_3!1368 lt!429357)) (select (arr!8708 lt!429247) (_4!441 lt!429357))) (ite c!13456 lt!429356 #b00000000000000000000000000000000) lt!429355))))

(declare-fun b!295329 () Bool)

(declare-fun e!211223 () Bool)

(assert (=> b!295329 (= e!211223 (arrayRangesEq!1499 arr!273 lt!429247 (_1!12986 lt!429357) (_2!12986 lt!429357)))))

(declare-fun b!295330 () Bool)

(declare-fun e!211222 () Bool)

(assert (=> b!295330 (= e!211220 e!211222)))

(declare-fun res!243841 () Bool)

(assert (=> b!295330 (=> (not res!243841) (not e!211222))))

(assert (=> b!295330 (= res!243841 e!211223)))

(declare-fun res!243843 () Bool)

(assert (=> b!295330 (=> res!243843 e!211223)))

(assert (=> b!295330 (= res!243843 (bvsge (_1!12986 lt!429357) (_2!12986 lt!429357)))))

(assert (=> b!295330 (= lt!429355 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!295330 (= lt!429356 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!295330 (= lt!429357 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(declare-fun b!295331 () Bool)

(declare-fun res!243842 () Bool)

(assert (=> b!295331 (= res!243842 (= lt!429355 #b00000000000000000000000000000000))))

(declare-fun e!211221 () Bool)

(assert (=> b!295331 (=> res!243842 e!211221)))

(assert (=> b!295331 (= e!211219 e!211221)))

(declare-fun b!295332 () Bool)

(assert (=> b!295332 (= e!211222 e!211218)))

(assert (=> b!295332 (= c!13456 (= (_3!1368 lt!429357) (_4!441 lt!429357)))))

(declare-fun b!295333 () Bool)

(assert (=> b!295333 (= e!211221 call!5067)))

(assert (= (and d!99532 (not res!243839)) b!295330))

(assert (= (and b!295330 (not res!243843)) b!295329))

(assert (= (and b!295330 res!243841) b!295332))

(assert (= (and b!295332 c!13456) b!295327))

(assert (= (and b!295332 (not c!13456)) b!295328))

(assert (= (and b!295328 res!243840) b!295331))

(assert (= (and b!295331 (not res!243842)) b!295333))

(assert (= (or b!295327 b!295333) bm!5064))

(declare-fun m!432509 () Bool)

(assert (=> b!295328 m!432509))

(declare-fun m!432511 () Bool)

(assert (=> b!295328 m!432511))

(assert (=> b!295328 m!432509))

(assert (=> b!295328 m!432511))

(declare-fun m!432513 () Bool)

(assert (=> b!295328 m!432513))

(assert (=> bm!5064 m!432509))

(declare-fun m!432515 () Bool)

(assert (=> bm!5064 m!432515))

(declare-fun m!432517 () Bool)

(assert (=> bm!5064 m!432517))

(declare-fun m!432519 () Bool)

(assert (=> bm!5064 m!432519))

(assert (=> bm!5064 m!432511))

(declare-fun m!432521 () Bool)

(assert (=> b!295329 m!432521))

(assert (=> b!295330 m!432489))

(assert (=> b!295265 d!99532))

(declare-fun lt!429656 () (_ BitVec 32))

(declare-fun bm!5079 () Bool)

(declare-fun lt!429664 () (_ BitVec 32))

(declare-fun lt!429652 () tuple2!23232)

(declare-fun c!13466 () Bool)

(declare-fun call!5083 () Bool)

(assert (=> bm!5079 (= call!5083 (arrayBitRangesEq!0 lt!429247 (ite c!13466 (array!17690 (store (arr!8708 lt!429247) lt!429656 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8708 lt!429247) lt!429656)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!429664)))) ((_ sign_extend 24) (ite (_1!12982 lt!429652) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!429664) #b00000000))))) (size!7667 lt!429247)) lt!429247) #b0000000000000000000000000000000000000000000000000000000000000000 (ite c!13466 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvmul ((_ sign_extend 32) (size!7667 lt!429247)) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!295429 () Bool)

(declare-fun res!243920 () Bool)

(declare-fun e!211288 () Bool)

(assert (=> b!295429 (=> (not res!243920) (not e!211288))))

(declare-fun e!211289 () Bool)

(assert (=> b!295429 (= res!243920 e!211289)))

(declare-fun res!243921 () Bool)

(assert (=> b!295429 (=> res!243921 e!211289)))

(assert (=> b!295429 (= res!243921 (not (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474)))))

(declare-fun b!295430 () Bool)

(declare-fun res!243926 () Bool)

(assert (=> b!295430 (=> (not res!243926) (not e!211288))))

(declare-fun lt!429643 () tuple3!1850)

(assert (=> b!295430 (= res!243926 (arrayBitRangesEq!0 lt!429247 (_3!1366 lt!429643) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun b!295431 () Bool)

(declare-fun res!243922 () Bool)

(assert (=> b!295431 (=> (not res!243922) (not e!211288))))

(assert (=> b!295431 (= res!243922 (invariant!0 (currentBit!14228 (_2!12983 lt!429643)) (currentByte!14233 (_2!12983 lt!429643)) (size!7667 (buf!7730 (_2!12983 lt!429643)))))))

(declare-fun b!295432 () Bool)

(declare-fun res!243925 () Bool)

(assert (=> b!295432 (=> (not res!243925) (not e!211288))))

(assert (=> b!295432 (= res!243925 (and (= (buf!7730 (_2!12982 lt!429242)) (buf!7730 (_2!12983 lt!429643))) (= (size!7667 lt!429247) (size!7667 (_3!1366 lt!429643)))))))

(declare-fun lt!429662 () tuple3!1850)

(declare-fun lt!429635 () array!17689)

(declare-fun lt!429650 () (_ BitVec 64))

(declare-fun lt!429655 () (_ BitVec 64))

(declare-fun call!5082 () Bool)

(declare-fun lt!429644 () (_ BitVec 64))

(declare-fun lt!429649 () array!17689)

(declare-fun bm!5080 () Bool)

(assert (=> bm!5080 (= call!5082 (arrayBitRangesEq!0 (ite c!13466 lt!429247 lt!429649) (ite c!13466 (_3!1366 lt!429662) lt!429635) (ite c!13466 lt!429644 lt!429650) (ite c!13466 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) lt!429655)))))

(declare-fun b!295433 () Bool)

(declare-fun e!211287 () Bool)

(assert (=> b!295433 (= e!211287 (and (= (buf!7730 (_2!12982 lt!429242)) (buf!7730 (_2!12983 lt!429662))) (= (size!7667 lt!429247) (size!7667 (_3!1366 lt!429662)))))))

(declare-fun b!295434 () Bool)

(declare-datatypes ((tuple2!23238 0))(
  ( (tuple2!23239 (_1!12988 BitStream!13338) (_2!12988 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!13338) tuple2!23238)

(assert (=> b!295434 (= e!211289 (= (bitAt!0 (_3!1366 lt!429643) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (_2!12988 (readBitPure!0 (_2!12982 lt!429242)))))))

(declare-fun d!99534 () Bool)

(assert (=> d!99534 e!211288))

(declare-fun res!243924 () Bool)

(assert (=> d!99534 (=> (not res!243924) (not e!211288))))

(declare-fun lt!429639 () (_ BitVec 64))

(assert (=> d!99534 (= res!243924 (= (bvsub lt!429639 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitIndex!0 (size!7667 (buf!7730 (_2!12983 lt!429643))) (currentByte!14233 (_2!12983 lt!429643)) (currentBit!14228 (_2!12983 lt!429643)))))))

(assert (=> d!99534 (or (= (bvand lt!429639 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!429639 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!429639 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!429647 () (_ BitVec 64))

(assert (=> d!99534 (= lt!429639 (bvadd lt!429647 to!474))))

(assert (=> d!99534 (or (not (= (bvand lt!429647 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!429647 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!429647 to!474) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!99534 (= lt!429647 (bitIndex!0 (size!7667 (buf!7730 (_2!12982 lt!429242))) (currentByte!14233 (_2!12982 lt!429242)) (currentBit!14228 (_2!12982 lt!429242))))))

(declare-fun e!211290 () tuple3!1850)

(assert (=> d!99534 (= lt!429643 e!211290)))

(assert (=> d!99534 (= c!13466 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> d!99534 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!99534 (= (readBitsLoop!0 (_2!12982 lt!429242) nBits!523 lt!429247 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474) lt!429643)))

(declare-fun b!295435 () Bool)

(declare-datatypes ((List!982 0))(
  ( (Nil!979) (Cons!978 (h!1097 Bool) (t!1867 List!982)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!13338 array!17689 (_ BitVec 64) (_ BitVec 64)) List!982)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!13338 BitStream!13338 (_ BitVec 64)) List!982)

(assert (=> b!295435 (= e!211288 (= (byteArrayBitContentToList!0 (_2!12983 lt!429643) (_3!1366 lt!429643) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))) (bitStreamReadBitsIntoList!0 (_2!12983 lt!429643) (_2!12982 lt!429242) (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))))

(assert (=> b!295435 (or (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!295435 (or (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!295436 () Bool)

(declare-fun lt!429657 () Unit!20583)

(assert (=> b!295436 (= e!211290 (tuple3!1851 lt!429657 (_2!12983 lt!429662) (_3!1366 lt!429662)))))

(assert (=> b!295436 (= lt!429652 (readBit!0 (_2!12982 lt!429242)))))

(declare-fun lt!429660 () (_ BitVec 32))

(assert (=> b!295436 (= lt!429660 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!429636 () (_ BitVec 32))

(assert (=> b!295436 (= lt!429636 ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!429666 () array!17689)

(assert (=> b!295436 (= lt!429666 (array!17690 (store (arr!8708 lt!429247) lt!429660 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8708 lt!429247) lt!429660)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!429636)))) ((_ sign_extend 24) (ite (_1!12982 lt!429652) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!429636) #b00000000))))) (size!7667 lt!429247)))))

(declare-fun lt!429661 () (_ BitVec 64))

(assert (=> b!295436 (= lt!429661 (bvsub nBits!523 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun lt!429668 () (_ BitVec 64))

(assert (=> b!295436 (= lt!429668 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!429638 () Unit!20583)

(assert (=> b!295436 (= lt!429638 (validateOffsetBitsIneqLemma!0 (_2!12982 lt!429242) (_2!12982 lt!429652) lt!429661 lt!429668))))

(assert (=> b!295436 (validate_offset_bits!1 ((_ sign_extend 32) (size!7667 (buf!7730 (_2!12982 lt!429652)))) ((_ sign_extend 32) (currentByte!14233 (_2!12982 lt!429652))) ((_ sign_extend 32) (currentBit!14228 (_2!12982 lt!429652))) (bvsub lt!429661 lt!429668))))

(declare-fun lt!429634 () Unit!20583)

(assert (=> b!295436 (= lt!429634 lt!429638)))

(assert (=> b!295436 (= lt!429662 (readBitsLoop!0 (_2!12982 lt!429652) nBits!523 lt!429666 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001) to!474))))

(declare-fun res!243923 () Bool)

(assert (=> b!295436 (= res!243923 (= (bvsub (bvadd (bitIndex!0 (size!7667 (buf!7730 (_2!12982 lt!429242))) (currentByte!14233 (_2!12982 lt!429242)) (currentBit!14228 (_2!12982 lt!429242))) to!474) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitIndex!0 (size!7667 (buf!7730 (_2!12983 lt!429662))) (currentByte!14233 (_2!12983 lt!429662)) (currentBit!14228 (_2!12983 lt!429662)))))))

(assert (=> b!295436 (=> (not res!243923) (not e!211287))))

(assert (=> b!295436 e!211287))

(declare-fun lt!429653 () Unit!20583)

(declare-fun Unit!20591 () Unit!20583)

(assert (=> b!295436 (= lt!429653 Unit!20591)))

(assert (=> b!295436 (= lt!429656 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!295436 (= lt!429664 ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!429646 () Unit!20583)

(assert (=> b!295436 (= lt!429646 (arrayBitRangesUpdatedAtLemma!0 lt!429247 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (_1!12982 lt!429652)))))

(assert (=> b!295436 call!5083))

(declare-fun lt!429663 () Unit!20583)

(assert (=> b!295436 (= lt!429663 lt!429646)))

(assert (=> b!295436 (= lt!429644 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!429665 () Unit!20583)

(assert (=> b!295436 (= lt!429665 (arrayBitRangesEqTransitive!0 lt!429247 lt!429666 (_3!1366 lt!429662) lt!429644 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!295436 call!5082))

(declare-fun lt!429667 () Unit!20583)

(assert (=> b!295436 (= lt!429667 lt!429665)))

(assert (=> b!295436 (arrayBitRangesEq!0 lt!429247 (_3!1366 lt!429662) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))))

(declare-fun lt!429669 () Unit!20583)

(declare-fun Unit!20592 () Unit!20583)

(assert (=> b!295436 (= lt!429669 Unit!20592)))

(declare-fun lt!429651 () Unit!20583)

(assert (=> b!295436 (= lt!429651 (arrayBitRangesEqImpliesEq!0 lt!429666 (_3!1366 lt!429662) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!295436 (= (bitAt!0 lt!429666 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitAt!0 (_3!1366 lt!429662) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun lt!429658 () Unit!20583)

(assert (=> b!295436 (= lt!429658 lt!429651)))

(declare-fun lt!429648 () Unit!20583)

(declare-fun Unit!20593 () Unit!20583)

(assert (=> b!295436 (= lt!429648 Unit!20593)))

(declare-fun lt!429645 () Bool)

(assert (=> b!295436 (= lt!429645 (= (bitAt!0 (_3!1366 lt!429662) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (_1!12982 lt!429652)))))

(declare-fun Unit!20594 () Unit!20583)

(assert (=> b!295436 (= lt!429657 Unit!20594)))

(assert (=> b!295436 lt!429645))

(declare-fun b!295437 () Bool)

(declare-fun lt!429641 () Unit!20583)

(assert (=> b!295437 (= e!211290 (tuple3!1851 lt!429641 (_2!12982 lt!429242) lt!429247))))

(declare-fun lt!429659 () Unit!20583)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17689) Unit!20583)

(assert (=> b!295437 (= lt!429659 (arrayBitRangesEqReflexiveLemma!0 lt!429247))))

(assert (=> b!295437 call!5083))

(declare-fun lt!429654 () Unit!20583)

(assert (=> b!295437 (= lt!429654 lt!429659)))

(assert (=> b!295437 (= lt!429649 lt!429247)))

(assert (=> b!295437 (= lt!429635 lt!429247)))

(declare-fun lt!429637 () (_ BitVec 64))

(assert (=> b!295437 (= lt!429637 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!429640 () (_ BitVec 64))

(assert (=> b!295437 (= lt!429640 ((_ sign_extend 32) (size!7667 lt!429247)))))

(declare-fun lt!429642 () (_ BitVec 64))

(assert (=> b!295437 (= lt!429642 (bvmul lt!429640 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!295437 (= lt!429650 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!295437 (= lt!429655 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))))

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17689 array!17689 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20583)

(assert (=> b!295437 (= lt!429641 (arrayBitRangesEqSlicedLemma!0 lt!429649 lt!429635 lt!429637 lt!429642 lt!429650 lt!429655))))

(assert (=> b!295437 call!5082))

(assert (= (and d!99534 c!13466) b!295436))

(assert (= (and d!99534 (not c!13466)) b!295437))

(assert (= (and b!295436 res!243923) b!295433))

(assert (= (or b!295436 b!295437) bm!5080))

(assert (= (or b!295436 b!295437) bm!5079))

(assert (= (and d!99534 res!243924) b!295432))

(assert (= (and b!295432 res!243925) b!295430))

(assert (= (and b!295430 res!243926) b!295429))

(assert (= (and b!295429 (not res!243921)) b!295434))

(assert (= (and b!295429 res!243920) b!295431))

(assert (= (and b!295431 res!243922) b!295435))

(declare-fun m!432657 () Bool)

(assert (=> bm!5079 m!432657))

(declare-fun m!432659 () Bool)

(assert (=> bm!5079 m!432659))

(declare-fun m!432661 () Bool)

(assert (=> bm!5079 m!432661))

(declare-fun m!432663 () Bool)

(assert (=> bm!5079 m!432663))

(declare-fun m!432665 () Bool)

(assert (=> b!295435 m!432665))

(declare-fun m!432667 () Bool)

(assert (=> b!295435 m!432667))

(declare-fun m!432669 () Bool)

(assert (=> b!295430 m!432669))

(declare-fun m!432671 () Bool)

(assert (=> bm!5080 m!432671))

(declare-fun m!432673 () Bool)

(assert (=> b!295431 m!432673))

(declare-fun m!432675 () Bool)

(assert (=> b!295437 m!432675))

(declare-fun m!432677 () Bool)

(assert (=> b!295437 m!432677))

(declare-fun m!432679 () Bool)

(assert (=> d!99534 m!432679))

(declare-fun m!432681 () Bool)

(assert (=> d!99534 m!432681))

(declare-fun m!432683 () Bool)

(assert (=> b!295434 m!432683))

(declare-fun m!432685 () Bool)

(assert (=> b!295434 m!432685))

(declare-fun m!432687 () Bool)

(assert (=> b!295436 m!432687))

(declare-fun m!432689 () Bool)

(assert (=> b!295436 m!432689))

(declare-fun m!432691 () Bool)

(assert (=> b!295436 m!432691))

(declare-fun m!432693 () Bool)

(assert (=> b!295436 m!432693))

(declare-fun m!432695 () Bool)

(assert (=> b!295436 m!432695))

(declare-fun m!432697 () Bool)

(assert (=> b!295436 m!432697))

(declare-fun m!432699 () Bool)

(assert (=> b!295436 m!432699))

(declare-fun m!432701 () Bool)

(assert (=> b!295436 m!432701))

(declare-fun m!432703 () Bool)

(assert (=> b!295436 m!432703))

(declare-fun m!432705 () Bool)

(assert (=> b!295436 m!432705))

(declare-fun m!432707 () Bool)

(assert (=> b!295436 m!432707))

(declare-fun m!432709 () Bool)

(assert (=> b!295436 m!432709))

(declare-fun m!432711 () Bool)

(assert (=> b!295436 m!432711))

(assert (=> b!295436 m!432681))

(declare-fun m!432713 () Bool)

(assert (=> b!295436 m!432713))

(assert (=> b!295265 d!99534))

(declare-fun d!99576 () Bool)

(assert (=> d!99576 (= (bitAt!0 lt!429247 from!505) (bitAt!0 (_3!1366 lt!429246) from!505))))

(declare-fun lt!429672 () Unit!20583)

(declare-fun choose!31 (array!17689 array!17689 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20583)

(assert (=> d!99576 (= lt!429672 (choose!31 lt!429247 (_3!1366 lt!429246) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!99576 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!99576 (= (arrayBitRangesEqImpliesEq!0 lt!429247 (_3!1366 lt!429246) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) lt!429672)))

(declare-fun bs!25465 () Bool)

(assert (= bs!25465 d!99576))

(assert (=> bs!25465 m!432387))

(assert (=> bs!25465 m!432399))

(declare-fun m!432715 () Bool)

(assert (=> bs!25465 m!432715))

(assert (=> b!295265 d!99576))

(declare-fun d!99578 () Bool)

(assert (=> d!99578 (= (bitAt!0 lt!429247 from!505) (not (= (bvand ((_ sign_extend 24) (select (arr!8708 lt!429247) ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!25466 () Bool)

(assert (= bs!25466 d!99578))

(declare-fun m!432717 () Bool)

(assert (=> bs!25466 m!432717))

(assert (=> bs!25466 m!432493))

(assert (=> b!295265 d!99578))

(declare-fun d!99580 () Bool)

(assert (=> d!99580 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7667 (buf!7730 (_2!12982 lt!429242)))) ((_ sign_extend 32) (currentByte!14233 (_2!12982 lt!429242))) ((_ sign_extend 32) (currentBit!14228 (_2!12982 lt!429242))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7667 (buf!7730 (_2!12982 lt!429242)))) ((_ sign_extend 32) (currentByte!14233 (_2!12982 lt!429242))) ((_ sign_extend 32) (currentBit!14228 (_2!12982 lt!429242)))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!25467 () Bool)

(assert (= bs!25467 d!99580))

(declare-fun m!432719 () Bool)

(assert (=> bs!25467 m!432719))

(assert (=> b!295265 d!99580))

(declare-fun d!99582 () Bool)

(assert (=> d!99582 (= (inv!12 thiss!1728) (invariant!0 (currentBit!14228 thiss!1728) (currentByte!14233 thiss!1728) (size!7667 (buf!7730 thiss!1728))))))

(declare-fun bs!25468 () Bool)

(assert (= bs!25468 d!99582))

(assert (=> bs!25468 m!432495))

(assert (=> start!65814 d!99582))

(declare-fun d!99584 () Bool)

(assert (=> d!99584 (= (array_inv!7279 arr!273) (bvsge (size!7667 arr!273) #b00000000000000000000000000000000))))

(assert (=> start!65814 d!99584))

(declare-fun d!99586 () Bool)

(assert (=> d!99586 (= (array_inv!7279 (buf!7730 thiss!1728)) (bvsge (size!7667 (buf!7730 thiss!1728)) #b00000000000000000000000000000000))))

(assert (=> b!295266 d!99586))

(check-sat (not d!99508) (not d!99580) (not bm!5064) (not b!295431) (not b!295435) (not b!295434) (not b!295287) (not bm!5063) (not b!295316) (not b!295329) (not b!295436) (not d!99576) (not b!295330) (not d!99582) (not d!99528) (not d!99534) (not d!99530) (not d!99514) (not bm!5080) (not b!295328) (not b!295318) (not b!295326) (not b!295437) (not d!99512) (not d!99526) (not bm!5079) (not d!99510) (not b!295430) (not b!295317) (not b!295291))
(check-sat)
