; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65816 () Bool)

(assert start!65816)

(declare-fun b!295280 () Bool)

(declare-fun e!211178 () Bool)

(declare-fun lt!429279 () Bool)

(declare-datatypes ((array!17691 0))(
  ( (array!17692 (arr!8709 (Array (_ BitVec 32) (_ BitVec 8))) (size!7668 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13340 0))(
  ( (BitStream!13341 (buf!7731 array!17691) (currentByte!14234 (_ BitVec 32)) (currentBit!14229 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!23234 0))(
  ( (tuple2!23235 (_1!12984 Bool) (_2!12984 BitStream!13340)) )
))
(declare-fun lt!429271 () tuple2!23234)

(assert (=> b!295280 (= e!211178 (not (= lt!429279 (_1!12984 lt!429271))))))

(declare-fun lt!429270 () array!17691)

(declare-fun from!505 () (_ BitVec 64))

(declare-fun bitAt!0 (array!17691 (_ BitVec 64)) Bool)

(assert (=> b!295280 (= (bitAt!0 lt!429270 from!505) lt!429279)))

(declare-datatypes ((Unit!20585 0))(
  ( (Unit!20586) )
))
(declare-datatypes ((tuple3!1852 0))(
  ( (tuple3!1853 (_1!12985 Unit!20585) (_2!12985 BitStream!13340) (_3!1367 array!17691)) )
))
(declare-fun lt!429275 () tuple3!1852)

(assert (=> b!295280 (= lt!429279 (bitAt!0 (_3!1367 lt!429275) from!505))))

(declare-fun lt!429272 () Unit!20585)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!17691 array!17691 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20585)

(assert (=> b!295280 (= lt!429272 (arrayBitRangesEqImpliesEq!0 lt!429270 (_3!1367 lt!429275) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun arr!273 () array!17691)

(declare-fun arrayBitRangesEq!0 (array!17691 array!17691 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!295280 (arrayBitRangesEq!0 arr!273 (_3!1367 lt!429275) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!429277 () Unit!20585)

(declare-fun arrayBitRangesEqTransitive!0 (array!17691 array!17691 array!17691 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20585)

(assert (=> b!295280 (= lt!429277 (arrayBitRangesEqTransitive!0 arr!273 lt!429270 (_3!1367 lt!429275) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!295280 (arrayBitRangesEq!0 arr!273 lt!429270 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!429274 () Unit!20585)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17691 (_ BitVec 64) Bool) Unit!20585)

(assert (=> b!295280 (= lt!429274 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12984 lt!429271)))))

(declare-fun e!211176 () Bool)

(assert (=> b!295280 e!211176))

(declare-fun res!243801 () Bool)

(assert (=> b!295280 (=> (not res!243801) (not e!211176))))

(declare-fun thiss!1728 () BitStream!13340)

(declare-fun to!474 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!295280 (= res!243801 (= (bvsub (bvadd (bitIndex!0 (size!7668 (buf!7731 thiss!1728)) (currentByte!14234 thiss!1728) (currentBit!14229 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7668 (buf!7731 (_2!12985 lt!429275))) (currentByte!14234 (_2!12985 lt!429275)) (currentBit!14229 (_2!12985 lt!429275)))))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun readBitsLoop!0 (BitStream!13340 (_ BitVec 64) array!17691 (_ BitVec 64) (_ BitVec 64)) tuple3!1852)

(assert (=> b!295280 (= lt!429275 (readBitsLoop!0 (_2!12984 lt!429271) nBits!523 lt!429270 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!295280 (validate_offset_bits!1 ((_ sign_extend 32) (size!7668 (buf!7731 (_2!12984 lt!429271)))) ((_ sign_extend 32) (currentByte!14234 (_2!12984 lt!429271))) ((_ sign_extend 32) (currentBit!14229 (_2!12984 lt!429271))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!429276 () Unit!20585)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!13340 BitStream!13340 (_ BitVec 64) (_ BitVec 64)) Unit!20585)

(assert (=> b!295280 (= lt!429276 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12984 lt!429271) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!429278 () (_ BitVec 32))

(declare-fun lt!429273 () (_ BitVec 32))

(assert (=> b!295280 (= lt!429270 (array!17692 (store (arr!8709 arr!273) lt!429273 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8709 arr!273) lt!429273)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!429278)))) ((_ sign_extend 24) (ite (_1!12984 lt!429271) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!429278) #b00000000))))) (size!7668 arr!273)))))

(assert (=> b!295280 (= lt!429278 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!295280 (= lt!429273 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!13340) tuple2!23234)

(assert (=> b!295280 (= lt!429271 (readBit!0 thiss!1728))))

(declare-fun b!295282 () Bool)

(declare-fun res!243802 () Bool)

(assert (=> b!295282 (=> (not res!243802) (not e!211178))))

(assert (=> b!295282 (= res!243802 (bvslt from!505 to!474))))

(declare-fun b!295283 () Bool)

(declare-fun e!211175 () Bool)

(declare-fun array_inv!7280 (array!17691) Bool)

(assert (=> b!295283 (= e!211175 (array_inv!7280 (buf!7731 thiss!1728)))))

(declare-fun b!295284 () Bool)

(declare-fun res!243800 () Bool)

(assert (=> b!295284 (=> (not res!243800) (not e!211178))))

(assert (=> b!295284 (= res!243800 (validate_offset_bits!1 ((_ sign_extend 32) (size!7668 (buf!7731 thiss!1728))) ((_ sign_extend 32) (currentByte!14234 thiss!1728)) ((_ sign_extend 32) (currentBit!14229 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun res!243803 () Bool)

(assert (=> start!65816 (=> (not res!243803) (not e!211178))))

(assert (=> start!65816 (= res!243803 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7668 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65816 e!211178))

(declare-fun inv!12 (BitStream!13340) Bool)

(assert (=> start!65816 (and (inv!12 thiss!1728) e!211175)))

(assert (=> start!65816 true))

(assert (=> start!65816 (array_inv!7280 arr!273)))

(declare-fun b!295281 () Bool)

(assert (=> b!295281 (= e!211176 (and (= (buf!7731 thiss!1728) (buf!7731 (_2!12985 lt!429275))) (= (size!7668 arr!273) (size!7668 (_3!1367 lt!429275)))))))

(assert (= (and start!65816 res!243803) b!295284))

(assert (= (and b!295284 res!243800) b!295282))

(assert (= (and b!295282 res!243802) b!295280))

(assert (= (and b!295280 res!243801) b!295281))

(assert (= start!65816 b!295283))

(declare-fun m!432411 () Bool)

(assert (=> b!295280 m!432411))

(declare-fun m!432413 () Bool)

(assert (=> b!295280 m!432413))

(declare-fun m!432415 () Bool)

(assert (=> b!295280 m!432415))

(declare-fun m!432417 () Bool)

(assert (=> b!295280 m!432417))

(declare-fun m!432419 () Bool)

(assert (=> b!295280 m!432419))

(declare-fun m!432421 () Bool)

(assert (=> b!295280 m!432421))

(declare-fun m!432423 () Bool)

(assert (=> b!295280 m!432423))

(declare-fun m!432425 () Bool)

(assert (=> b!295280 m!432425))

(declare-fun m!432427 () Bool)

(assert (=> b!295280 m!432427))

(declare-fun m!432429 () Bool)

(assert (=> b!295280 m!432429))

(declare-fun m!432431 () Bool)

(assert (=> b!295280 m!432431))

(declare-fun m!432433 () Bool)

(assert (=> b!295280 m!432433))

(declare-fun m!432435 () Bool)

(assert (=> b!295280 m!432435))

(declare-fun m!432437 () Bool)

(assert (=> b!295280 m!432437))

(declare-fun m!432439 () Bool)

(assert (=> b!295280 m!432439))

(declare-fun m!432441 () Bool)

(assert (=> b!295280 m!432441))

(declare-fun m!432443 () Bool)

(assert (=> b!295283 m!432443))

(declare-fun m!432445 () Bool)

(assert (=> b!295284 m!432445))

(declare-fun m!432447 () Bool)

(assert (=> start!65816 m!432447))

(declare-fun m!432449 () Bool)

(assert (=> start!65816 m!432449))

(push 1)

(assert (not start!65816))

(assert (not b!295283))

(assert (not b!295284))

(assert (not b!295280))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!99536 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!99536 (= (inv!12 thiss!1728) (invariant!0 (currentBit!14229 thiss!1728) (currentByte!14234 thiss!1728) (size!7668 (buf!7731 thiss!1728))))))

(declare-fun bs!25456 () Bool)

(assert (= bs!25456 d!99536))

(declare-fun m!432523 () Bool)

(assert (=> bs!25456 m!432523))

(assert (=> start!65816 d!99536))

(declare-fun d!99538 () Bool)

(assert (=> d!99538 (= (array_inv!7280 arr!273) (bvsge (size!7668 arr!273) #b00000000000000000000000000000000))))

(assert (=> start!65816 d!99538))

(declare-fun d!99540 () Bool)

(assert (=> d!99540 (= (array_inv!7280 (buf!7731 thiss!1728)) (bvsge (size!7668 (buf!7731 thiss!1728)) #b00000000000000000000000000000000))))

(assert (=> b!295283 d!99540))

(declare-fun d!99542 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!99542 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7668 (buf!7731 thiss!1728))) ((_ sign_extend 32) (currentByte!14234 thiss!1728)) ((_ sign_extend 32) (currentBit!14229 thiss!1728)) (bvsub nBits!523 from!505)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7668 (buf!7731 thiss!1728))) ((_ sign_extend 32) (currentByte!14234 thiss!1728)) ((_ sign_extend 32) (currentBit!14229 thiss!1728))) (bvsub nBits!523 from!505)))))

(declare-fun bs!25457 () Bool)

(assert (= bs!25457 d!99542))

(declare-fun m!432525 () Bool)

(assert (=> bs!25457 m!432525))

(assert (=> b!295284 d!99542))

(declare-fun d!99544 () Bool)

(assert (=> d!99544 (= (bitAt!0 lt!429270 from!505) (not (= (bvand ((_ sign_extend 24) (select (arr!8709 lt!429270) ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!25458 () Bool)

(assert (= bs!25458 d!99544))

(declare-fun m!432527 () Bool)

(assert (=> bs!25458 m!432527))

(declare-fun m!432529 () Bool)

(assert (=> bs!25458 m!432529))

(assert (=> b!295280 d!99544))

(declare-fun b!295348 () Bool)

(declare-fun e!211236 () Bool)

(declare-fun e!211240 () Bool)

(assert (=> b!295348 (= e!211236 e!211240)))

(declare-fun res!243854 () Bool)

(assert (=> b!295348 (=> (not res!243854) (not e!211240))))

(declare-fun e!211238 () Bool)

(assert (=> b!295348 (= res!243854 e!211238)))

(declare-fun res!243856 () Bool)

(assert (=> b!295348 (=> res!243856 e!211238)))

(declare-datatypes ((tuple4!886 0))(
  ( (tuple4!887 (_1!12992 (_ BitVec 32)) (_2!12992 (_ BitVec 32)) (_3!1370 (_ BitVec 32)) (_4!443 (_ BitVec 32))) )
))
(declare-fun lt!429366 () tuple4!886)

(assert (=> b!295348 (= res!243856 (bvsge (_1!12992 lt!429366) (_2!12992 lt!429366)))))

(declare-fun lt!429365 () (_ BitVec 32))

(assert (=> b!295348 (= lt!429365 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!429364 () (_ BitVec 32))

(assert (=> b!295348 (= lt!429364 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!886)

(assert (=> b!295348 (= lt!429366 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(declare-fun b!295350 () Bool)

(declare-fun arrayRangesEq!1501 (array!17691 array!17691 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!295350 (= e!211238 (arrayRangesEq!1501 arr!273 lt!429270 (_1!12992 lt!429366) (_2!12992 lt!429366)))))

(declare-fun e!211237 () Bool)

(declare-fun b!295351 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!295351 (= e!211237 (byteRangesEq!0 (select (arr!8709 arr!273) (_4!443 lt!429366)) (select (arr!8709 lt!429270) (_4!443 lt!429366)) #b00000000000000000000000000000000 lt!429365))))

(declare-fun b!295352 () Bool)

(declare-fun e!211239 () Bool)

(declare-fun e!211241 () Bool)

(assert (=> b!295352 (= e!211239 e!211241)))

(declare-fun res!243858 () Bool)

(declare-fun call!5070 () Bool)

(assert (=> b!295352 (= res!243858 call!5070)))

(assert (=> b!295352 (=> (not res!243858) (not e!211241))))

(declare-fun b!295353 () Bool)

(declare-fun res!243855 () Bool)

(assert (=> b!295353 (= res!243855 (= lt!429365 #b00000000000000000000000000000000))))

(assert (=> b!295353 (=> res!243855 e!211237)))

(assert (=> b!295353 (= e!211241 e!211237)))

(declare-fun d!99546 () Bool)

(declare-fun res!243857 () Bool)

(assert (=> d!99546 (=> res!243857 e!211236)))

(assert (=> d!99546 (= res!243857 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!99546 (= (arrayBitRangesEq!0 arr!273 lt!429270 #b0000000000000000000000000000000000000000000000000000000000000000 from!505) e!211236)))

(declare-fun b!295349 () Bool)

(assert (=> b!295349 (= e!211239 call!5070)))

(declare-fun c!13459 () Bool)

(declare-fun bm!5067 () Bool)

(assert (=> bm!5067 (= call!5070 (byteRangesEq!0 (select (arr!8709 arr!273) (_3!1370 lt!429366)) (select (arr!8709 lt!429270) (_3!1370 lt!429366)) lt!429364 (ite c!13459 lt!429365 #b00000000000000000000000000001000)))))

(declare-fun b!295354 () Bool)

(assert (=> b!295354 (= e!211240 e!211239)))

(assert (=> b!295354 (= c!13459 (= (_3!1370 lt!429366) (_4!443 lt!429366)))))

(assert (= (and d!99546 (not res!243857)) b!295348))

(assert (= (and b!295348 (not res!243856)) b!295350))

(assert (= (and b!295348 res!243854) b!295354))

(assert (= (and b!295354 c!13459) b!295349))

(assert (= (and b!295354 (not c!13459)) b!295352))

(assert (= (and b!295352 res!243858) b!295353))

(assert (= (and b!295353 (not res!243855)) b!295351))

(assert (= (or b!295349 b!295352) bm!5067))

(declare-fun m!432531 () Bool)

(assert (=> b!295348 m!432531))

(declare-fun m!432533 () Bool)

(assert (=> b!295350 m!432533))

(declare-fun m!432535 () Bool)

(assert (=> b!295351 m!432535))

(declare-fun m!432537 () Bool)

(assert (=> b!295351 m!432537))

(assert (=> b!295351 m!432535))

(assert (=> b!295351 m!432537))

(declare-fun m!432539 () Bool)

(assert (=> b!295351 m!432539))

(declare-fun m!432541 () Bool)

(assert (=> bm!5067 m!432541))

(declare-fun m!432543 () Bool)

(assert (=> bm!5067 m!432543))

(assert (=> bm!5067 m!432541))

(assert (=> bm!5067 m!432543))

(declare-fun m!432545 () Bool)

(assert (=> bm!5067 m!432545))

(assert (=> b!295280 d!99546))

(declare-fun d!99548 () Bool)

(declare-fun e!211244 () Bool)

(assert (=> d!99548 e!211244))

(declare-fun res!243863 () Bool)

(assert (=> d!99548 (=> (not res!243863) (not e!211244))))

(declare-fun lt!429380 () (_ BitVec 64))

(declare-fun lt!429379 () (_ BitVec 64))

(declare-fun lt!429382 () (_ BitVec 64))

(assert (=> d!99548 (= res!243863 (= lt!429379 (bvsub lt!429380 lt!429382)))))

(assert (=> d!99548 (or (= (bvand lt!429380 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!429382 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!429380 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!429380 lt!429382) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!99548 (= lt!429382 (remainingBits!0 ((_ sign_extend 32) (size!7668 (buf!7731 thiss!1728))) ((_ sign_extend 32) (currentByte!14234 thiss!1728)) ((_ sign_extend 32) (currentBit!14229 thiss!1728))))))

(declare-fun lt!429383 () (_ BitVec 64))

(declare-fun lt!429381 () (_ BitVec 64))

(assert (=> d!99548 (= lt!429380 (bvmul lt!429383 lt!429381))))

(assert (=> d!99548 (or (= lt!429383 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!429381 (bvsdiv (bvmul lt!429383 lt!429381) lt!429383)))))

(assert (=> d!99548 (= lt!429381 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!99548 (= lt!429383 ((_ sign_extend 32) (size!7668 (buf!7731 thiss!1728))))))

(assert (=> d!99548 (= lt!429379 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14234 thiss!1728)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14229 thiss!1728))))))

(assert (=> d!99548 (invariant!0 (currentBit!14229 thiss!1728) (currentByte!14234 thiss!1728) (size!7668 (buf!7731 thiss!1728)))))

(assert (=> d!99548 (= (bitIndex!0 (size!7668 (buf!7731 thiss!1728)) (currentByte!14234 thiss!1728) (currentBit!14229 thiss!1728)) lt!429379)))

(declare-fun b!295359 () Bool)

(declare-fun res!243864 () Bool)

(assert (=> b!295359 (=> (not res!243864) (not e!211244))))

(assert (=> b!295359 (= res!243864 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!429379))))

(declare-fun b!295360 () Bool)

(declare-fun lt!429384 () (_ BitVec 64))

(assert (=> b!295360 (= e!211244 (bvsle lt!429379 (bvmul lt!429384 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!295360 (or (= lt!429384 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!429384 #b0000000000000000000000000000000000000000000000000000000000001000) lt!429384)))))

(assert (=> b!295360 (= lt!429384 ((_ sign_extend 32) (size!7668 (buf!7731 thiss!1728))))))

(assert (= (and d!99548 res!243863) b!295359))

(assert (= (and b!295359 res!243864) b!295360))

(assert (=> d!99548 m!432525))

(assert (=> d!99548 m!432523))

(assert (=> b!295280 d!99548))

(declare-fun d!99550 () Bool)

(declare-fun e!211247 () Bool)

(assert (=> d!99550 e!211247))

(declare-fun res!243867 () Bool)

(assert (=> d!99550 (=> (not res!243867) (not e!211247))))

(assert (=> d!99550 (= res!243867 (or (= (bvand (bvsub nBits!523 from!505) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!523 from!505) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!429387 () Unit!20585)

(declare-fun choose!27 (BitStream!13340 BitStream!13340 (_ BitVec 64) (_ BitVec 64)) Unit!20585)

(assert (=> d!99550 (= lt!429387 (choose!27 thiss!1728 (_2!12984 lt!429271) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!99550 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!523 from!505)))))

(assert (=> d!99550 (= (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12984 lt!429271) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001) lt!429387)))

(declare-fun b!295363 () Bool)

(assert (=> b!295363 (= e!211247 (validate_offset_bits!1 ((_ sign_extend 32) (size!7668 (buf!7731 (_2!12984 lt!429271)))) ((_ sign_extend 32) (currentByte!14234 (_2!12984 lt!429271))) ((_ sign_extend 32) (currentBit!14229 (_2!12984 lt!429271))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!99550 res!243867) b!295363))

(declare-fun m!432547 () Bool)

(assert (=> d!99550 m!432547))

(assert (=> b!295363 m!432435))

(assert (=> b!295280 d!99550))

(declare-fun d!99552 () Bool)

(assert (=> d!99552 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7668 (buf!7731 (_2!12984 lt!429271)))) ((_ sign_extend 32) (currentByte!14234 (_2!12984 lt!429271))) ((_ sign_extend 32) (currentBit!14229 (_2!12984 lt!429271))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7668 (buf!7731 (_2!12984 lt!429271)))) ((_ sign_extend 32) (currentByte!14234 (_2!12984 lt!429271))) ((_ sign_extend 32) (currentBit!14229 (_2!12984 lt!429271)))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!25459 () Bool)

(assert (= bs!25459 d!99552))

(declare-fun m!432549 () Bool)

(assert (=> bs!25459 m!432549))

(assert (=> b!295280 d!99552))

(declare-fun d!99554 () Bool)

(assert (=> d!99554 (= (bitAt!0 (_3!1367 lt!429275) from!505) (not (= (bvand ((_ sign_extend 24) (select (arr!8709 (_3!1367 lt!429275)) ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!25460 () Bool)

(assert (= bs!25460 d!99554))

(declare-fun m!432551 () Bool)

(assert (=> bs!25460 m!432551))

(assert (=> bs!25460 m!432529))

(assert (=> b!295280 d!99554))

(declare-fun d!99556 () Bool)

(declare-fun e!211254 () Bool)

(assert (=> d!99556 e!211254))

(declare-fun res!243870 () Bool)

(assert (=> d!99556 (=> (not res!243870) (not e!211254))))

(declare-datatypes ((tuple2!23244 0))(
  ( (tuple2!23245 (_1!12993 Unit!20585) (_2!12993 BitStream!13340)) )
))
(declare-fun increaseBitIndex!0 (BitStream!13340) tuple2!23244)

(assert (=> d!99556 (= res!243870 (= (buf!7731 (_2!12993 (increaseBitIndex!0 thiss!1728))) (buf!7731 thiss!1728)))))

(declare-fun lt!429408 () Bool)

(assert (=> d!99556 (= lt!429408 (not (= (bvand ((_ sign_extend 24) (select (arr!8709 (buf!7731 thiss!1728)) (currentByte!14234 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14229 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!429407 () tuple2!23234)

(assert (=> d!99556 (= lt!429407 (tuple2!23235 (not (= (bvand ((_ sign_extend 24) (select (arr!8709 (buf!7731 thiss!1728)) (currentByte!14234 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14229 thiss!1728)))) #b00000000000000000000000000000000)) (_2!12993 (increaseBitIndex!0 thiss!1728))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!99556 (validate_offset_bit!0 ((_ sign_extend 32) (size!7668 (buf!7731 thiss!1728))) ((_ sign_extend 32) (currentByte!14234 thiss!1728)) ((_ sign_extend 32) (currentBit!14229 thiss!1728)))))

(assert (=> d!99556 (= (readBit!0 thiss!1728) lt!429407)))

(declare-fun lt!429404 () (_ BitVec 64))

(declare-fun b!295366 () Bool)

(declare-fun lt!429406 () (_ BitVec 64))

(assert (=> b!295366 (= e!211254 (= (bitIndex!0 (size!7668 (buf!7731 (_2!12993 (increaseBitIndex!0 thiss!1728)))) (currentByte!14234 (_2!12993 (increaseBitIndex!0 thiss!1728))) (currentBit!14229 (_2!12993 (increaseBitIndex!0 thiss!1728)))) (bvadd lt!429404 lt!429406)))))

(assert (=> b!295366 (or (not (= (bvand lt!429404 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!429406 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!429404 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!429404 lt!429406) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!295366 (= lt!429406 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!295366 (= lt!429404 (bitIndex!0 (size!7668 (buf!7731 thiss!1728)) (currentByte!14234 thiss!1728) (currentBit!14229 thiss!1728)))))

(declare-fun lt!429402 () Bool)

(assert (=> b!295366 (= lt!429402 (not (= (bvand ((_ sign_extend 24) (select (arr!8709 (buf!7731 thiss!1728)) (currentByte!14234 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14229 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!429405 () Bool)

(assert (=> b!295366 (= lt!429405 (not (= (bvand ((_ sign_extend 24) (select (arr!8709 (buf!7731 thiss!1728)) (currentByte!14234 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14229 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!429403 () Bool)

(assert (=> b!295366 (= lt!429403 (not (= (bvand ((_ sign_extend 24) (select (arr!8709 (buf!7731 thiss!1728)) (currentByte!14234 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14229 thiss!1728)))) #b00000000000000000000000000000000)))))

(assert (= (and d!99556 res!243870) b!295366))

(declare-fun m!432553 () Bool)

(assert (=> d!99556 m!432553))

(declare-fun m!432555 () Bool)

(assert (=> d!99556 m!432555))

(declare-fun m!432557 () Bool)

(assert (=> d!99556 m!432557))

(declare-fun m!432559 () Bool)

(assert (=> d!99556 m!432559))

(assert (=> b!295366 m!432555))

(assert (=> b!295366 m!432553))

(assert (=> b!295366 m!432557))

(assert (=> b!295366 m!432417))

(declare-fun m!432561 () Bool)

(assert (=> b!295366 m!432561))

(assert (=> b!295280 d!99556))

(declare-fun d!99558 () Bool)

(assert (=> d!99558 (arrayBitRangesEq!0 arr!273 (_3!1367 lt!429275) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!429411 () Unit!20585)

(declare-fun choose!49 (array!17691 array!17691 array!17691 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20585)

(assert (=> d!99558 (= lt!429411 (choose!49 arr!273 lt!429270 (_3!1367 lt!429275) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!99558 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!99558 (= (arrayBitRangesEqTransitive!0 arr!273 lt!429270 (_3!1367 lt!429275) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) lt!429411)))

(declare-fun bs!25461 () Bool)

(assert (= bs!25461 d!99558))

(assert (=> bs!25461 m!432423))

(declare-fun m!432563 () Bool)

(assert (=> bs!25461 m!432563))

(assert (=> b!295280 d!99558))

(declare-fun b!295367 () Bool)

(declare-fun e!211255 () Bool)

(declare-fun e!211259 () Bool)

(assert (=> b!295367 (= e!211255 e!211259)))

(declare-fun res!243871 () Bool)

(assert (=> b!295367 (=> (not res!243871) (not e!211259))))

(declare-fun e!211257 () Bool)

(assert (=> b!295367 (= res!243871 e!211257)))

(declare-fun res!243873 () Bool)

(assert (=> b!295367 (=> res!243873 e!211257)))

(declare-fun lt!429414 () tuple4!886)

(assert (=> b!295367 (= res!243873 (bvsge (_1!12992 lt!429414) (_2!12992 lt!429414)))))

(declare-fun lt!429413 () (_ BitVec 32))

(assert (=> b!295367 (= lt!429413 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!429412 () (_ BitVec 32))

(assert (=> b!295367 (= lt!429412 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!295367 (= lt!429414 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(declare-fun b!295369 () Bool)

(assert (=> b!295369 (= e!211257 (arrayRangesEq!1501 arr!273 (_3!1367 lt!429275) (_1!12992 lt!429414) (_2!12992 lt!429414)))))

(declare-fun e!211256 () Bool)

(declare-fun b!295370 () Bool)

(assert (=> b!295370 (= e!211256 (byteRangesEq!0 (select (arr!8709 arr!273) (_4!443 lt!429414)) (select (arr!8709 (_3!1367 lt!429275)) (_4!443 lt!429414)) #b00000000000000000000000000000000 lt!429413))))

(declare-fun b!295371 () Bool)

(declare-fun e!211258 () Bool)

(declare-fun e!211260 () Bool)

(assert (=> b!295371 (= e!211258 e!211260)))

(declare-fun res!243875 () Bool)

(declare-fun call!5071 () Bool)

(assert (=> b!295371 (= res!243875 call!5071)))

(assert (=> b!295371 (=> (not res!243875) (not e!211260))))

(declare-fun b!295372 () Bool)

(declare-fun res!243872 () Bool)

(assert (=> b!295372 (= res!243872 (= lt!429413 #b00000000000000000000000000000000))))

(assert (=> b!295372 (=> res!243872 e!211256)))

(assert (=> b!295372 (= e!211260 e!211256)))

(declare-fun d!99560 () Bool)

(declare-fun res!243874 () Bool)

(assert (=> d!99560 (=> res!243874 e!211255)))

(assert (=> d!99560 (= res!243874 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!99560 (= (arrayBitRangesEq!0 arr!273 (_3!1367 lt!429275) #b0000000000000000000000000000000000000000000000000000000000000000 from!505) e!211255)))

(declare-fun b!295368 () Bool)

(assert (=> b!295368 (= e!211258 call!5071)))

(declare-fun bm!5068 () Bool)

(declare-fun c!13460 () Bool)

(assert (=> bm!5068 (= call!5071 (byteRangesEq!0 (select (arr!8709 arr!273) (_3!1370 lt!429414)) (select (arr!8709 (_3!1367 lt!429275)) (_3!1370 lt!429414)) lt!429412 (ite c!13460 lt!429413 #b00000000000000000000000000001000)))))

(declare-fun b!295373 () Bool)

(assert (=> b!295373 (= e!211259 e!211258)))

(assert (=> b!295373 (= c!13460 (= (_3!1370 lt!429414) (_4!443 lt!429414)))))

(assert (= (and d!99560 (not res!243874)) b!295367))

(assert (= (and b!295367 (not res!243873)) b!295369))

(assert (= (and b!295367 res!243871) b!295373))

(assert (= (and b!295373 c!13460) b!295368))

(assert (= (and b!295373 (not c!13460)) b!295371))

(assert (= (and b!295371 res!243875) b!295372))

(assert (= (and b!295372 (not res!243872)) b!295370))

(assert (= (or b!295368 b!295371) bm!5068))

(assert (=> b!295367 m!432531))

(declare-fun m!432565 () Bool)

(assert (=> b!295369 m!432565))

(declare-fun m!432567 () Bool)

(assert (=> b!295370 m!432567))

(declare-fun m!432569 () Bool)

(assert (=> b!295370 m!432569))

(assert (=> b!295370 m!432567))

(assert (=> b!295370 m!432569))

(declare-fun m!432571 () Bool)

(assert (=> b!295370 m!432571))

(declare-fun m!432573 () Bool)

(assert (=> bm!5068 m!432573))

(declare-fun m!432575 () Bool)

(assert (=> bm!5068 m!432575))

(assert (=> bm!5068 m!432573))

(assert (=> bm!5068 m!432575))

(declare-fun m!432577 () Bool)

(assert (=> bm!5068 m!432577))

(assert (=> b!295280 d!99560))

(declare-fun d!99562 () Bool)

(assert (=> d!99562 (= (bitAt!0 lt!429270 from!505) (bitAt!0 (_3!1367 lt!429275) from!505))))

(declare-fun lt!429423 () Unit!20585)

(declare-fun choose!31 (array!17691 array!17691 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20585)

(assert (=> d!99562 (= lt!429423 (choose!31 lt!429270 (_3!1367 lt!429275) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!99562 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!99562 (= (arrayBitRangesEqImpliesEq!0 lt!429270 (_3!1367 lt!429275) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) lt!429423)))

(declare-fun bs!25462 () Bool)

(assert (= bs!25462 d!99562))

(assert (=> bs!25462 m!432419))

(assert (=> bs!25462 m!432415))

(declare-fun m!432579 () Bool)

(assert (=> bs!25462 m!432579))

(assert (=> b!295280 d!99562))

(declare-fun lt!429787 () tuple2!23234)

(declare-fun lt!429816 () (_ BitVec 32))

(declare-fun lt!429796 () (_ BitVec 32))

(declare-fun c!13473 () Bool)

(declare-fun bm!5089 () Bool)

(declare-fun call!5092 () Bool)

(assert (=> bm!5089 (= call!5092 (arrayBitRangesEq!0 lt!429270 (ite c!13473 (array!17692 (store (arr!8709 lt!429270) lt!429796 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8709 lt!429270) lt!429796)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!429816)))) ((_ sign_extend 24) (ite (_1!12984 lt!429787) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!429816) #b00000000))))) (size!7668 lt!429270)) lt!429270) #b0000000000000000000000000000000000000000000000000000000000000000 (ite c!13473 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvmul ((_ sign_extend 32) (size!7668 lt!429270)) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun e!211333 () Bool)

(declare-fun b!295489 () Bool)

(declare-fun lt!429784 () tuple3!1852)

(declare-datatypes ((tuple2!23246 0))(
  ( (tuple2!23247 (_1!12994 BitStream!13340) (_2!12994 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!13340) tuple2!23246)

(assert (=> b!295489 (= e!211333 (= (bitAt!0 (_3!1367 lt!429784) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (_2!12994 (readBitPure!0 (_2!12984 lt!429271)))))))

(declare-fun b!295490 () Bool)

(declare-fun e!211334 () tuple3!1852)

(declare-fun lt!429797 () Unit!20585)

(assert (=> b!295490 (= e!211334 (tuple3!1853 lt!429797 (_2!12984 lt!429271) lt!429270))))

(declare-fun lt!429817 () Unit!20585)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17691) Unit!20585)

(assert (=> b!295490 (= lt!429817 (arrayBitRangesEqReflexiveLemma!0 lt!429270))))

(assert (=> b!295490 call!5092))

(declare-fun lt!429804 () Unit!20585)

(assert (=> b!295490 (= lt!429804 lt!429817)))

(declare-fun lt!429803 () array!17691)

(assert (=> b!295490 (= lt!429803 lt!429270)))

(declare-fun lt!429795 () array!17691)

(assert (=> b!295490 (= lt!429795 lt!429270)))

(declare-fun lt!429815 () (_ BitVec 64))

(assert (=> b!295490 (= lt!429815 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!429792 () (_ BitVec 64))

(assert (=> b!295490 (= lt!429792 ((_ sign_extend 32) (size!7668 lt!429270)))))

(declare-fun lt!429788 () (_ BitVec 64))

(assert (=> b!295490 (= lt!429788 (bvmul lt!429792 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!429813 () (_ BitVec 64))

(assert (=> b!295490 (= lt!429813 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!429810 () (_ BitVec 64))

(assert (=> b!295490 (= lt!429810 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))))

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17691 array!17691 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20585)

(assert (=> b!295490 (= lt!429797 (arrayBitRangesEqSlicedLemma!0 lt!429803 lt!429795 lt!429815 lt!429788 lt!429813 lt!429810))))

(declare-fun call!5093 () Bool)

(assert (=> b!295490 call!5093))

(declare-fun b!295491 () Bool)

(declare-fun res!243970 () Bool)

(declare-fun e!211332 () Bool)

(assert (=> b!295491 (=> (not res!243970) (not e!211332))))

(assert (=> b!295491 (= res!243970 (arrayBitRangesEq!0 lt!429270 (_3!1367 lt!429784) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun b!295492 () Bool)

(declare-fun res!243971 () Bool)

(assert (=> b!295492 (=> (not res!243971) (not e!211332))))

(assert (=> b!295492 (= res!243971 e!211333)))

(declare-fun res!243969 () Bool)

(assert (=> b!295492 (=> res!243969 e!211333)))

(assert (=> b!295492 (= res!243969 (not (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474)))))

(declare-fun b!295493 () Bool)

(declare-fun lt!429798 () tuple3!1852)

(declare-fun e!211331 () Bool)

(assert (=> b!295493 (= e!211331 (and (= (buf!7731 (_2!12984 lt!429271)) (buf!7731 (_2!12985 lt!429798))) (= (size!7668 lt!429270) (size!7668 (_3!1367 lt!429798)))))))

(declare-fun b!295494 () Bool)

(declare-fun lt!429805 () Unit!20585)

(assert (=> b!295494 (= e!211334 (tuple3!1853 lt!429805 (_2!12985 lt!429798) (_3!1367 lt!429798)))))

(assert (=> b!295494 (= lt!429787 (readBit!0 (_2!12984 lt!429271)))))

(declare-fun lt!429794 () (_ BitVec 32))

(assert (=> b!295494 (= lt!429794 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!429790 () (_ BitVec 32))

(assert (=> b!295494 (= lt!429790 ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!429801 () array!17691)

(assert (=> b!295494 (= lt!429801 (array!17692 (store (arr!8709 lt!429270) lt!429794 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8709 lt!429270) lt!429794)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!429790)))) ((_ sign_extend 24) (ite (_1!12984 lt!429787) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!429790) #b00000000))))) (size!7668 lt!429270)))))

(declare-fun lt!429800 () (_ BitVec 64))

(assert (=> b!295494 (= lt!429800 (bvsub nBits!523 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun lt!429811 () (_ BitVec 64))

(assert (=> b!295494 (= lt!429811 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!429785 () Unit!20585)

(assert (=> b!295494 (= lt!429785 (validateOffsetBitsIneqLemma!0 (_2!12984 lt!429271) (_2!12984 lt!429787) lt!429800 lt!429811))))

(assert (=> b!295494 (validate_offset_bits!1 ((_ sign_extend 32) (size!7668 (buf!7731 (_2!12984 lt!429787)))) ((_ sign_extend 32) (currentByte!14234 (_2!12984 lt!429787))) ((_ sign_extend 32) (currentBit!14229 (_2!12984 lt!429787))) (bvsub lt!429800 lt!429811))))

(declare-fun lt!429808 () Unit!20585)

(assert (=> b!295494 (= lt!429808 lt!429785)))

(assert (=> b!295494 (= lt!429798 (readBitsLoop!0 (_2!12984 lt!429787) nBits!523 lt!429801 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001) to!474))))

(declare-fun res!243968 () Bool)

(assert (=> b!295494 (= res!243968 (= (bvsub (bvadd (bitIndex!0 (size!7668 (buf!7731 (_2!12984 lt!429271))) (currentByte!14234 (_2!12984 lt!429271)) (currentBit!14229 (_2!12984 lt!429271))) to!474) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitIndex!0 (size!7668 (buf!7731 (_2!12985 lt!429798))) (currentByte!14234 (_2!12985 lt!429798)) (currentBit!14229 (_2!12985 lt!429798)))))))

(assert (=> b!295494 (=> (not res!243968) (not e!211331))))

(assert (=> b!295494 e!211331))

(declare-fun lt!429789 () Unit!20585)

(declare-fun Unit!20595 () Unit!20585)

(assert (=> b!295494 (= lt!429789 Unit!20595)))

(assert (=> b!295494 (= lt!429796 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!295494 (= lt!429816 ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!429819 () Unit!20585)

(assert (=> b!295494 (= lt!429819 (arrayBitRangesUpdatedAtLemma!0 lt!429270 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (_1!12984 lt!429787)))))

(assert (=> b!295494 call!5092))

(declare-fun lt!429791 () Unit!20585)

(assert (=> b!295494 (= lt!429791 lt!429819)))

(declare-fun lt!429818 () (_ BitVec 64))

(assert (=> b!295494 (= lt!429818 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!429812 () Unit!20585)

(assert (=> b!295494 (= lt!429812 (arrayBitRangesEqTransitive!0 lt!429270 lt!429801 (_3!1367 lt!429798) lt!429818 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!295494 call!5093))

(declare-fun lt!429802 () Unit!20585)

(assert (=> b!295494 (= lt!429802 lt!429812)))

(assert (=> b!295494 (arrayBitRangesEq!0 lt!429270 (_3!1367 lt!429798) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))))

(declare-fun lt!429809 () Unit!20585)

(declare-fun Unit!20596 () Unit!20585)

(assert (=> b!295494 (= lt!429809 Unit!20596)))

(declare-fun lt!429814 () Unit!20585)

(assert (=> b!295494 (= lt!429814 (arrayBitRangesEqImpliesEq!0 lt!429801 (_3!1367 lt!429798) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!295494 (= (bitAt!0 lt!429801 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitAt!0 (_3!1367 lt!429798) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun lt!429793 () Unit!20585)

(assert (=> b!295494 (= lt!429793 lt!429814)))

(declare-fun lt!429786 () Unit!20585)

(declare-fun Unit!20597 () Unit!20585)

(assert (=> b!295494 (= lt!429786 Unit!20597)))

(declare-fun lt!429807 () Bool)

(assert (=> b!295494 (= lt!429807 (= (bitAt!0 (_3!1367 lt!429798) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (_1!12984 lt!429787)))))

(declare-fun Unit!20598 () Unit!20585)

(assert (=> b!295494 (= lt!429805 Unit!20598)))

(assert (=> b!295494 lt!429807))

(declare-fun bm!5090 () Bool)

(assert (=> bm!5090 (= call!5093 (arrayBitRangesEq!0 (ite c!13473 lt!429270 lt!429803) (ite c!13473 (_3!1367 lt!429798) lt!429795) (ite c!13473 lt!429818 lt!429813) (ite c!13473 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) lt!429810)))))

(declare-fun d!99564 () Bool)

(assert (=> d!99564 e!211332))

(declare-fun res!243972 () Bool)

(assert (=> d!99564 (=> (not res!243972) (not e!211332))))

(declare-fun lt!429806 () (_ BitVec 64))

(assert (=> d!99564 (= res!243972 (= (bvsub lt!429806 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitIndex!0 (size!7668 (buf!7731 (_2!12985 lt!429784))) (currentByte!14234 (_2!12985 lt!429784)) (currentBit!14229 (_2!12985 lt!429784)))))))

(assert (=> d!99564 (or (= (bvand lt!429806 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!429806 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!429806 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!429799 () (_ BitVec 64))

(assert (=> d!99564 (= lt!429806 (bvadd lt!429799 to!474))))

(assert (=> d!99564 (or (not (= (bvand lt!429799 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!429799 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!429799 to!474) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!99564 (= lt!429799 (bitIndex!0 (size!7668 (buf!7731 (_2!12984 lt!429271))) (currentByte!14234 (_2!12984 lt!429271)) (currentBit!14229 (_2!12984 lt!429271))))))

(assert (=> d!99564 (= lt!429784 e!211334)))

(assert (=> d!99564 (= c!13473 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> d!99564 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!99564 (= (readBitsLoop!0 (_2!12984 lt!429271) nBits!523 lt!429270 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474) lt!429784)))

(declare-fun b!295495 () Bool)

(declare-datatypes ((List!983 0))(
  ( (Nil!980) (Cons!979 (h!1098 Bool) (t!1868 List!983)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!13340 array!17691 (_ BitVec 64) (_ BitVec 64)) List!983)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!13340 BitStream!13340 (_ BitVec 64)) List!983)

(assert (=> b!295495 (= e!211332 (= (byteArrayBitContentToList!0 (_2!12985 lt!429784) (_3!1367 lt!429784) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))) (bitStreamReadBitsIntoList!0 (_2!12985 lt!429784) (_2!12984 lt!429271) (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))))

(assert (=> b!295495 (or (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!295495 (or (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!295496 () Bool)

(declare-fun res!243967 () Bool)

(assert (=> b!295496 (=> (not res!243967) (not e!211332))))

(assert (=> b!295496 (= res!243967 (and (= (buf!7731 (_2!12984 lt!429271)) (buf!7731 (_2!12985 lt!429784))) (= (size!7668 lt!429270) (size!7668 (_3!1367 lt!429784)))))))

(declare-fun b!295497 () Bool)

(declare-fun res!243966 () Bool)

(assert (=> b!295497 (=> (not res!243966) (not e!211332))))

(assert (=> b!295497 (= res!243966 (invariant!0 (currentBit!14229 (_2!12985 lt!429784)) (currentByte!14234 (_2!12985 lt!429784)) (size!7668 (buf!7731 (_2!12985 lt!429784)))))))

(assert (= (and d!99564 c!13473) b!295494))

(assert (= (and d!99564 (not c!13473)) b!295490))

(assert (= (and b!295494 res!243968) b!295493))

(assert (= (or b!295494 b!295490) bm!5090))

(assert (= (or b!295494 b!295490) bm!5089))

(assert (= (and d!99564 res!243972) b!295496))

(assert (= (and b!295496 res!243967) b!295491))

(assert (= (and b!295491 res!243970) b!295492))

(assert (= (and b!295492 (not res!243969)) b!295489))

(assert (= (and b!295492 res!243971) b!295497))

(assert (= (and b!295497 res!243966) b!295495))

(declare-fun m!432769 () Bool)

(assert (=> d!99564 m!432769))

(declare-fun m!432771 () Bool)

(assert (=> d!99564 m!432771))

(declare-fun m!432773 () Bool)

(assert (=> b!295489 m!432773))

(declare-fun m!432775 () Bool)

(assert (=> b!295489 m!432775))

(declare-fun m!432777 () Bool)

(assert (=> bm!5089 m!432777))

(declare-fun m!432779 () Bool)

(assert (=> bm!5089 m!432779))

(declare-fun m!432781 () Bool)

(assert (=> bm!5089 m!432781))

(declare-fun m!432783 () Bool)

(assert (=> bm!5089 m!432783))

(declare-fun m!432785 () Bool)

(assert (=> b!295490 m!432785))

(declare-fun m!432787 () Bool)

(assert (=> b!295490 m!432787))

(declare-fun m!432789 () Bool)

(assert (=> b!295495 m!432789))

(declare-fun m!432791 () Bool)

(assert (=> b!295495 m!432791))

(declare-fun m!432793 () Bool)

(assert (=> b!295491 m!432793))

(declare-fun m!432795 () Bool)

(assert (=> b!295494 m!432795))

(declare-fun m!432797 () Bool)

(assert (=> b!295494 m!432797))

(declare-fun m!432799 () Bool)

(assert (=> b!295494 m!432799))

(declare-fun m!432801 () Bool)

(assert (=> b!295494 m!432801))

(declare-fun m!432803 () Bool)

(assert (=> b!295494 m!432803))

(declare-fun m!432805 () Bool)

(assert (=> b!295494 m!432805))

(declare-fun m!432807 () Bool)

(assert (=> b!295494 m!432807))

(declare-fun m!432809 () Bool)

(assert (=> b!295494 m!432809))

(declare-fun m!432811 () Bool)

(assert (=> b!295494 m!432811))

(assert (=> b!295494 m!432771))

(declare-fun m!432813 () Bool)

(assert (=> b!295494 m!432813))

(declare-fun m!432815 () Bool)

(assert (=> b!295494 m!432815))

(declare-fun m!432817 () Bool)

(assert (=> b!295494 m!432817))

(declare-fun m!432819 () Bool)

(assert (=> b!295494 m!432819))

(declare-fun m!432821 () Bool)

(assert (=> b!295494 m!432821))

(declare-fun m!432823 () Bool)

(assert (=> bm!5090 m!432823))

(declare-fun m!432825 () Bool)

(assert (=> b!295497 m!432825))

(assert (=> b!295280 d!99564))

(declare-fun d!99606 () Bool)

(declare-fun e!211337 () Bool)

(assert (=> d!99606 e!211337))

(declare-fun res!243975 () Bool)

(assert (=> d!99606 (=> (not res!243975) (not e!211337))))

(declare-fun lt!429829 () (_ BitVec 32))

(assert (=> d!99606 (= res!243975 (and (bvsge lt!429829 #b00000000000000000000000000000000) (bvslt lt!429829 (size!7668 arr!273))))))

(declare-fun lt!429831 () (_ BitVec 32))

(declare-fun lt!429830 () (_ BitVec 8))

(declare-fun lt!429828 () Unit!20585)

(declare-fun choose!53 (array!17691 (_ BitVec 64) Bool (_ BitVec 32) (_ BitVec 32) (_ BitVec 8)) Unit!20585)

(assert (=> d!99606 (= lt!429828 (choose!53 arr!273 from!505 (_1!12984 lt!429271) lt!429829 lt!429831 lt!429830))))

(assert (=> d!99606 (= lt!429830 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8709 arr!273) lt!429829)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!429831)))) ((_ sign_extend 24) (ite (_1!12984 lt!429271) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!429831) #b00000000)))))))

(assert (=> d!99606 (= lt!429831 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> d!99606 (= lt!429829 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> d!99606 (= (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12984 lt!429271)) lt!429828)))

(declare-fun b!295501 () Bool)

(assert (=> b!295501 (= e!211337 (arrayBitRangesEq!0 arr!273 (array!17692 (store (arr!8709 arr!273) lt!429829 lt!429830) (size!7668 arr!273)) #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (= (and d!99606 res!243975) b!295501))

(declare-fun m!432827 () Bool)

(assert (=> d!99606 m!432827))

(declare-fun m!432829 () Bool)

(assert (=> d!99606 m!432829))

(declare-fun m!432831 () Bool)

(assert (=> d!99606 m!432831))

(declare-fun m!432833 () Bool)

(assert (=> b!295501 m!432833))

(declare-fun m!432835 () Bool)

(assert (=> b!295501 m!432835))

(assert (=> b!295280 d!99606))

(declare-fun d!99608 () Bool)

(declare-fun e!211338 () Bool)

(assert (=> d!99608 e!211338))

(declare-fun res!243976 () Bool)

(assert (=> d!99608 (=> (not res!243976) (not e!211338))))

(declare-fun lt!429832 () (_ BitVec 64))

(declare-fun lt!429833 () (_ BitVec 64))

(declare-fun lt!429835 () (_ BitVec 64))

(assert (=> d!99608 (= res!243976 (= lt!429832 (bvsub lt!429833 lt!429835)))))

(assert (=> d!99608 (or (= (bvand lt!429833 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!429835 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!429833 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!429833 lt!429835) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!99608 (= lt!429835 (remainingBits!0 ((_ sign_extend 32) (size!7668 (buf!7731 (_2!12985 lt!429275)))) ((_ sign_extend 32) (currentByte!14234 (_2!12985 lt!429275))) ((_ sign_extend 32) (currentBit!14229 (_2!12985 lt!429275)))))))

(declare-fun lt!429836 () (_ BitVec 64))

(declare-fun lt!429834 () (_ BitVec 64))

(assert (=> d!99608 (= lt!429833 (bvmul lt!429836 lt!429834))))

(assert (=> d!99608 (or (= lt!429836 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!429834 (bvsdiv (bvmul lt!429836 lt!429834) lt!429836)))))

(assert (=> d!99608 (= lt!429834 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!99608 (= lt!429836 ((_ sign_extend 32) (size!7668 (buf!7731 (_2!12985 lt!429275)))))))

(assert (=> d!99608 (= lt!429832 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14234 (_2!12985 lt!429275))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14229 (_2!12985 lt!429275)))))))

(assert (=> d!99608 (invariant!0 (currentBit!14229 (_2!12985 lt!429275)) (currentByte!14234 (_2!12985 lt!429275)) (size!7668 (buf!7731 (_2!12985 lt!429275))))))

(assert (=> d!99608 (= (bitIndex!0 (size!7668 (buf!7731 (_2!12985 lt!429275))) (currentByte!14234 (_2!12985 lt!429275)) (currentBit!14229 (_2!12985 lt!429275))) lt!429832)))

(declare-fun b!295502 () Bool)

(declare-fun res!243977 () Bool)

(assert (=> b!295502 (=> (not res!243977) (not e!211338))))

(assert (=> b!295502 (= res!243977 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!429832))))

(declare-fun b!295503 () Bool)

(declare-fun lt!429837 () (_ BitVec 64))

(assert (=> b!295503 (= e!211338 (bvsle lt!429832 (bvmul lt!429837 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!295503 (or (= lt!429837 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!429837 #b0000000000000000000000000000000000000000000000000000000000001000) lt!429837)))))

(assert (=> b!295503 (= lt!429837 ((_ sign_extend 32) (size!7668 (buf!7731 (_2!12985 lt!429275)))))))

(assert (= (and d!99608 res!243976) b!295502))

(assert (= (and b!295502 res!243977) b!295503))

(declare-fun m!432837 () Bool)

(assert (=> d!99608 m!432837))

(declare-fun m!432839 () Bool)

(assert (=> d!99608 m!432839))

(assert (=> b!295280 d!99608))

(push 1)

(assert (not bm!5068))

(assert (not d!99552))

(assert (not bm!5067))

(assert (not b!295366))

(assert (not b!295350))

(assert (not d!99556))

(assert (not b!295494))

(assert (not d!99536))

(assert (not d!99608))

(assert (not b!295369))

(assert (not b!295367))

(assert (not b!295363))

(assert (not d!99548))

(assert (not d!99550))

(assert (not b!295348))

(assert (not d!99558))

(assert (not b!295370))

(assert (not d!99542))

(assert (not b!295491))

(assert (not b!295489))

(assert (not b!295497))

(assert (not b!295490))

(assert (not bm!5090))

(assert (not b!295495))

(assert (not b!295501))

(assert (not b!295351))

(assert (not bm!5089))

(assert (not d!99564))

(assert (not d!99606))

(assert (not d!99562))

(check-sat)

(pop 1)

(push 1)

(check-sat)

