; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65970 () Bool)

(assert start!65970)

(declare-fun b!295807 () Bool)

(declare-fun res!244226 () Bool)

(declare-fun e!211584 () Bool)

(assert (=> b!295807 (=> (not res!244226) (not e!211584))))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!295807 (= res!244226 (bvslt from!505 to!474))))

(declare-fun b!295808 () Bool)

(declare-fun e!211583 () Bool)

(declare-datatypes ((array!17707 0))(
  ( (array!17708 (arr!8726 (Array (_ BitVec 32) (_ BitVec 8))) (size!7673 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13350 0))(
  ( (BitStream!13351 (buf!7736 array!17707) (currentByte!14251 (_ BitVec 32)) (currentBit!14246 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13350)

(declare-fun array_inv!7285 (array!17707) Bool)

(assert (=> b!295808 (= e!211583 (array_inv!7285 (buf!7736 thiss!1728)))))

(declare-fun b!295809 () Bool)

(declare-fun e!211587 () Bool)

(declare-fun lt!430583 () Bool)

(declare-datatypes ((tuple2!23268 0))(
  ( (tuple2!23269 (_1!13012 Bool) (_2!13012 BitStream!13350)) )
))
(declare-fun lt!430588 () tuple2!23268)

(assert (=> b!295809 (= e!211587 (= lt!430583 (_1!13012 lt!430588)))))

(declare-fun res!244222 () Bool)

(assert (=> start!65970 (=> (not res!244222) (not e!211584))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun arr!273 () array!17707)

(assert (=> start!65970 (= res!244222 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7673 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65970 e!211584))

(declare-fun inv!12 (BitStream!13350) Bool)

(assert (=> start!65970 (and (inv!12 thiss!1728) e!211583)))

(assert (=> start!65970 true))

(assert (=> start!65970 (array_inv!7285 arr!273)))

(declare-fun b!295810 () Bool)

(declare-fun res!244225 () Bool)

(assert (=> b!295810 (=> (not res!244225) (not e!211584))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!295810 (= res!244225 (validate_offset_bits!1 ((_ sign_extend 32) (size!7673 (buf!7736 thiss!1728))) ((_ sign_extend 32) (currentByte!14251 thiss!1728)) ((_ sign_extend 32) (currentBit!14246 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!295811 () Bool)

(declare-fun lt!430590 () (_ BitVec 64))

(declare-fun lt!430580 () (_ BitVec 64))

(assert (=> b!295811 (= e!211584 (not (or (= lt!430580 (bvand from!505 #b1000000000000000000000000000000000000000000000000000000000000000)) (= lt!430580 (bvand lt!430590 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun lt!430585 () (_ BitVec 64))

(assert (=> b!295811 (= lt!430580 (bvand lt!430585 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!295811 e!211587))

(declare-fun res!244223 () Bool)

(assert (=> b!295811 (=> (not res!244223) (not e!211587))))

(declare-fun lt!430589 () array!17707)

(declare-fun bitAt!0 (array!17707 (_ BitVec 64)) Bool)

(assert (=> b!295811 (= res!244223 (= (bitAt!0 lt!430589 from!505) lt!430583))))

(declare-datatypes ((Unit!20619 0))(
  ( (Unit!20620) )
))
(declare-datatypes ((tuple3!1862 0))(
  ( (tuple3!1863 (_1!13013 Unit!20619) (_2!13013 BitStream!13350) (_3!1378 array!17707)) )
))
(declare-fun lt!430587 () tuple3!1862)

(assert (=> b!295811 (= lt!430583 (bitAt!0 (_3!1378 lt!430587) from!505))))

(declare-fun lt!430581 () Unit!20619)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!17707 array!17707 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20619)

(assert (=> b!295811 (= lt!430581 (arrayBitRangesEqImpliesEq!0 lt!430589 (_3!1378 lt!430587) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun arrayBitRangesEq!0 (array!17707 array!17707 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!295811 (arrayBitRangesEq!0 arr!273 (_3!1378 lt!430587) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!430579 () Unit!20619)

(declare-fun arrayBitRangesEqTransitive!0 (array!17707 array!17707 array!17707 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20619)

(assert (=> b!295811 (= lt!430579 (arrayBitRangesEqTransitive!0 arr!273 lt!430589 (_3!1378 lt!430587) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!295811 (arrayBitRangesEq!0 arr!273 lt!430589 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!430586 () Unit!20619)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17707 (_ BitVec 64) Bool) Unit!20619)

(assert (=> b!295811 (= lt!430586 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!13012 lt!430588)))))

(declare-fun e!211585 () Bool)

(assert (=> b!295811 e!211585))

(declare-fun res!244224 () Bool)

(assert (=> b!295811 (=> (not res!244224) (not e!211585))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!295811 (= res!244224 (= lt!430590 (bitIndex!0 (size!7673 (buf!7736 (_2!13013 lt!430587))) (currentByte!14251 (_2!13013 lt!430587)) (currentBit!14246 (_2!13013 lt!430587)))))))

(assert (=> b!295811 (= lt!430590 (bvsub lt!430585 from!505))))

(assert (=> b!295811 (= lt!430585 (bvadd (bitIndex!0 (size!7673 (buf!7736 thiss!1728)) (currentByte!14251 thiss!1728) (currentBit!14246 thiss!1728)) to!474))))

(declare-fun readBitsLoop!0 (BitStream!13350 (_ BitVec 64) array!17707 (_ BitVec 64) (_ BitVec 64)) tuple3!1862)

(assert (=> b!295811 (= lt!430587 (readBitsLoop!0 (_2!13012 lt!430588) nBits!523 lt!430589 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!295811 (validate_offset_bits!1 ((_ sign_extend 32) (size!7673 (buf!7736 (_2!13012 lt!430588)))) ((_ sign_extend 32) (currentByte!14251 (_2!13012 lt!430588))) ((_ sign_extend 32) (currentBit!14246 (_2!13012 lt!430588))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!430584 () Unit!20619)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!13350 BitStream!13350 (_ BitVec 64) (_ BitVec 64)) Unit!20619)

(assert (=> b!295811 (= lt!430584 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!13012 lt!430588) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!430578 () (_ BitVec 32))

(declare-fun lt!430582 () (_ BitVec 32))

(assert (=> b!295811 (= lt!430589 (array!17708 (store (arr!8726 arr!273) lt!430578 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8726 arr!273) lt!430578)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!430582)))) ((_ sign_extend 24) (ite (_1!13012 lt!430588) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!430582) #b00000000))))) (size!7673 arr!273)))))

(assert (=> b!295811 (= lt!430582 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!295811 (= lt!430578 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!13350) tuple2!23268)

(assert (=> b!295811 (= lt!430588 (readBit!0 thiss!1728))))

(declare-fun b!295812 () Bool)

(assert (=> b!295812 (= e!211585 (and (= (buf!7736 thiss!1728) (buf!7736 (_2!13013 lt!430587))) (= (size!7673 arr!273) (size!7673 (_3!1378 lt!430587)))))))

(assert (= (and start!65970 res!244222) b!295810))

(assert (= (and b!295810 res!244225) b!295807))

(assert (= (and b!295807 res!244226) b!295811))

(assert (= (and b!295811 res!244224) b!295812))

(assert (= (and b!295811 res!244223) b!295809))

(assert (= start!65970 b!295808))

(declare-fun m!433391 () Bool)

(assert (=> b!295808 m!433391))

(declare-fun m!433393 () Bool)

(assert (=> start!65970 m!433393))

(declare-fun m!433395 () Bool)

(assert (=> start!65970 m!433395))

(declare-fun m!433397 () Bool)

(assert (=> b!295810 m!433397))

(declare-fun m!433399 () Bool)

(assert (=> b!295811 m!433399))

(declare-fun m!433401 () Bool)

(assert (=> b!295811 m!433401))

(declare-fun m!433403 () Bool)

(assert (=> b!295811 m!433403))

(declare-fun m!433405 () Bool)

(assert (=> b!295811 m!433405))

(declare-fun m!433407 () Bool)

(assert (=> b!295811 m!433407))

(declare-fun m!433409 () Bool)

(assert (=> b!295811 m!433409))

(declare-fun m!433411 () Bool)

(assert (=> b!295811 m!433411))

(declare-fun m!433413 () Bool)

(assert (=> b!295811 m!433413))

(declare-fun m!433415 () Bool)

(assert (=> b!295811 m!433415))

(declare-fun m!433417 () Bool)

(assert (=> b!295811 m!433417))

(declare-fun m!433419 () Bool)

(assert (=> b!295811 m!433419))

(declare-fun m!433421 () Bool)

(assert (=> b!295811 m!433421))

(declare-fun m!433423 () Bool)

(assert (=> b!295811 m!433423))

(declare-fun m!433425 () Bool)

(assert (=> b!295811 m!433425))

(declare-fun m!433427 () Bool)

(assert (=> b!295811 m!433427))

(declare-fun m!433429 () Bool)

(assert (=> b!295811 m!433429))

(check-sat (not b!295808) (not start!65970) (not b!295811) (not b!295810))
(check-sat)
(get-model)

(declare-fun d!99716 () Bool)

(assert (=> d!99716 (= (array_inv!7285 (buf!7736 thiss!1728)) (bvsge (size!7673 (buf!7736 thiss!1728)) #b00000000000000000000000000000000))))

(assert (=> b!295808 d!99716))

(declare-fun d!99718 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!99718 (= (inv!12 thiss!1728) (invariant!0 (currentBit!14246 thiss!1728) (currentByte!14251 thiss!1728) (size!7673 (buf!7736 thiss!1728))))))

(declare-fun bs!25500 () Bool)

(assert (= bs!25500 d!99718))

(declare-fun m!433471 () Bool)

(assert (=> bs!25500 m!433471))

(assert (=> start!65970 d!99718))

(declare-fun d!99720 () Bool)

(assert (=> d!99720 (= (array_inv!7285 arr!273) (bvsge (size!7673 arr!273) #b00000000000000000000000000000000))))

(assert (=> start!65970 d!99720))

(declare-fun d!99722 () Bool)

(declare-fun e!211608 () Bool)

(assert (=> d!99722 e!211608))

(declare-fun res!244247 () Bool)

(assert (=> d!99722 (=> (not res!244247) (not e!211608))))

(declare-fun lt!430644 () (_ BitVec 64))

(declare-fun lt!430645 () (_ BitVec 64))

(declare-fun lt!430642 () (_ BitVec 64))

(assert (=> d!99722 (= res!244247 (= lt!430644 (bvsub lt!430645 lt!430642)))))

(assert (=> d!99722 (or (= (bvand lt!430645 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!430642 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!430645 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!430645 lt!430642) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!99722 (= lt!430642 (remainingBits!0 ((_ sign_extend 32) (size!7673 (buf!7736 (_2!13013 lt!430587)))) ((_ sign_extend 32) (currentByte!14251 (_2!13013 lt!430587))) ((_ sign_extend 32) (currentBit!14246 (_2!13013 lt!430587)))))))

(declare-fun lt!430643 () (_ BitVec 64))

(declare-fun lt!430647 () (_ BitVec 64))

(assert (=> d!99722 (= lt!430645 (bvmul lt!430643 lt!430647))))

(assert (=> d!99722 (or (= lt!430643 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!430647 (bvsdiv (bvmul lt!430643 lt!430647) lt!430643)))))

(assert (=> d!99722 (= lt!430647 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!99722 (= lt!430643 ((_ sign_extend 32) (size!7673 (buf!7736 (_2!13013 lt!430587)))))))

(assert (=> d!99722 (= lt!430644 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14251 (_2!13013 lt!430587))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14246 (_2!13013 lt!430587)))))))

(assert (=> d!99722 (invariant!0 (currentBit!14246 (_2!13013 lt!430587)) (currentByte!14251 (_2!13013 lt!430587)) (size!7673 (buf!7736 (_2!13013 lt!430587))))))

(assert (=> d!99722 (= (bitIndex!0 (size!7673 (buf!7736 (_2!13013 lt!430587))) (currentByte!14251 (_2!13013 lt!430587)) (currentBit!14246 (_2!13013 lt!430587))) lt!430644)))

(declare-fun b!295835 () Bool)

(declare-fun res!244246 () Bool)

(assert (=> b!295835 (=> (not res!244246) (not e!211608))))

(assert (=> b!295835 (= res!244246 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!430644))))

(declare-fun b!295836 () Bool)

(declare-fun lt!430646 () (_ BitVec 64))

(assert (=> b!295836 (= e!211608 (bvsle lt!430644 (bvmul lt!430646 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!295836 (or (= lt!430646 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!430646 #b0000000000000000000000000000000000000000000000000000000000001000) lt!430646)))))

(assert (=> b!295836 (= lt!430646 ((_ sign_extend 32) (size!7673 (buf!7736 (_2!13013 lt!430587)))))))

(assert (= (and d!99722 res!244247) b!295835))

(assert (= (and b!295835 res!244246) b!295836))

(declare-fun m!433473 () Bool)

(assert (=> d!99722 m!433473))

(declare-fun m!433475 () Bool)

(assert (=> d!99722 m!433475))

(assert (=> b!295811 d!99722))

(declare-fun b!295851 () Bool)

(declare-fun e!211621 () Bool)

(declare-fun call!5126 () Bool)

(assert (=> b!295851 (= e!211621 call!5126)))

(declare-fun d!99724 () Bool)

(declare-fun res!244261 () Bool)

(declare-fun e!211624 () Bool)

(assert (=> d!99724 (=> res!244261 e!211624)))

(assert (=> d!99724 (= res!244261 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!99724 (= (arrayBitRangesEq!0 arr!273 (_3!1378 lt!430587) #b0000000000000000000000000000000000000000000000000000000000000000 from!505) e!211624)))

(declare-fun b!295852 () Bool)

(declare-fun e!211622 () Bool)

(assert (=> b!295852 (= e!211622 e!211621)))

(declare-fun c!13497 () Bool)

(declare-datatypes ((tuple4!894 0))(
  ( (tuple4!895 (_1!13016 (_ BitVec 32)) (_2!13016 (_ BitVec 32)) (_3!1380 (_ BitVec 32)) (_4!447 (_ BitVec 32))) )
))
(declare-fun lt!430655 () tuple4!894)

(assert (=> b!295852 (= c!13497 (= (_3!1380 lt!430655) (_4!447 lt!430655)))))

(declare-fun b!295853 () Bool)

(declare-fun res!244260 () Bool)

(declare-fun lt!430654 () (_ BitVec 32))

(assert (=> b!295853 (= res!244260 (= lt!430654 #b00000000000000000000000000000000))))

(declare-fun e!211623 () Bool)

(assert (=> b!295853 (=> res!244260 e!211623)))

(declare-fun e!211626 () Bool)

(assert (=> b!295853 (= e!211626 e!211623)))

(declare-fun b!295854 () Bool)

(assert (=> b!295854 (= e!211623 call!5126)))

(declare-fun e!211625 () Bool)

(declare-fun b!295855 () Bool)

(declare-fun arrayRangesEq!1505 (array!17707 array!17707 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!295855 (= e!211625 (arrayRangesEq!1505 arr!273 (_3!1378 lt!430587) (_1!13016 lt!430655) (_2!13016 lt!430655)))))

(declare-fun b!295856 () Bool)

(assert (=> b!295856 (= e!211621 e!211626)))

(declare-fun res!244258 () Bool)

(declare-fun lt!430656 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!295856 (= res!244258 (byteRangesEq!0 (select (arr!8726 arr!273) (_3!1380 lt!430655)) (select (arr!8726 (_3!1378 lt!430587)) (_3!1380 lt!430655)) lt!430656 #b00000000000000000000000000001000))))

(assert (=> b!295856 (=> (not res!244258) (not e!211626))))

(declare-fun b!295857 () Bool)

(assert (=> b!295857 (= e!211624 e!211622)))

(declare-fun res!244259 () Bool)

(assert (=> b!295857 (=> (not res!244259) (not e!211622))))

(assert (=> b!295857 (= res!244259 e!211625)))

(declare-fun res!244262 () Bool)

(assert (=> b!295857 (=> res!244262 e!211625)))

(assert (=> b!295857 (= res!244262 (bvsge (_1!13016 lt!430655) (_2!13016 lt!430655)))))

(assert (=> b!295857 (= lt!430654 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!295857 (= lt!430656 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!894)

(assert (=> b!295857 (= lt!430655 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(declare-fun bm!5123 () Bool)

(assert (=> bm!5123 (= call!5126 (byteRangesEq!0 (ite c!13497 (select (arr!8726 arr!273) (_3!1380 lt!430655)) (select (arr!8726 arr!273) (_4!447 lt!430655))) (ite c!13497 (select (arr!8726 (_3!1378 lt!430587)) (_3!1380 lt!430655)) (select (arr!8726 (_3!1378 lt!430587)) (_4!447 lt!430655))) (ite c!13497 lt!430656 #b00000000000000000000000000000000) lt!430654))))

(assert (= (and d!99724 (not res!244261)) b!295857))

(assert (= (and b!295857 (not res!244262)) b!295855))

(assert (= (and b!295857 res!244259) b!295852))

(assert (= (and b!295852 c!13497) b!295851))

(assert (= (and b!295852 (not c!13497)) b!295856))

(assert (= (and b!295856 res!244258) b!295853))

(assert (= (and b!295853 (not res!244260)) b!295854))

(assert (= (or b!295851 b!295854) bm!5123))

(declare-fun m!433477 () Bool)

(assert (=> b!295855 m!433477))

(declare-fun m!433479 () Bool)

(assert (=> b!295856 m!433479))

(declare-fun m!433481 () Bool)

(assert (=> b!295856 m!433481))

(assert (=> b!295856 m!433479))

(assert (=> b!295856 m!433481))

(declare-fun m!433483 () Bool)

(assert (=> b!295856 m!433483))

(declare-fun m!433485 () Bool)

(assert (=> b!295857 m!433485))

(assert (=> bm!5123 m!433481))

(assert (=> bm!5123 m!433479))

(declare-fun m!433487 () Bool)

(assert (=> bm!5123 m!433487))

(declare-fun m!433489 () Bool)

(assert (=> bm!5123 m!433489))

(declare-fun m!433491 () Bool)

(assert (=> bm!5123 m!433491))

(assert (=> b!295811 d!99724))

(declare-fun d!99726 () Bool)

(declare-fun e!211629 () Bool)

(assert (=> d!99726 e!211629))

(declare-fun res!244265 () Bool)

(assert (=> d!99726 (=> (not res!244265) (not e!211629))))

(assert (=> d!99726 (= res!244265 (or (= (bvand (bvsub nBits!523 from!505) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!523 from!505) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!430659 () Unit!20619)

(declare-fun choose!27 (BitStream!13350 BitStream!13350 (_ BitVec 64) (_ BitVec 64)) Unit!20619)

(assert (=> d!99726 (= lt!430659 (choose!27 thiss!1728 (_2!13012 lt!430588) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!99726 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!523 from!505)))))

(assert (=> d!99726 (= (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!13012 lt!430588) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001) lt!430659)))

(declare-fun b!295860 () Bool)

(assert (=> b!295860 (= e!211629 (validate_offset_bits!1 ((_ sign_extend 32) (size!7673 (buf!7736 (_2!13012 lt!430588)))) ((_ sign_extend 32) (currentByte!14251 (_2!13012 lt!430588))) ((_ sign_extend 32) (currentBit!14246 (_2!13012 lt!430588))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!99726 res!244265) b!295860))

(declare-fun m!433493 () Bool)

(assert (=> d!99726 m!433493))

(assert (=> b!295860 m!433421))

(assert (=> b!295811 d!99726))

(declare-fun d!99728 () Bool)

(assert (=> d!99728 (= (bitAt!0 lt!430589 from!505) (bitAt!0 (_3!1378 lt!430587) from!505))))

(declare-fun lt!430662 () Unit!20619)

(declare-fun choose!31 (array!17707 array!17707 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20619)

(assert (=> d!99728 (= lt!430662 (choose!31 lt!430589 (_3!1378 lt!430587) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!99728 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!99728 (= (arrayBitRangesEqImpliesEq!0 lt!430589 (_3!1378 lt!430587) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) lt!430662)))

(declare-fun bs!25501 () Bool)

(assert (= bs!25501 d!99728))

(assert (=> bs!25501 m!433423))

(assert (=> bs!25501 m!433413))

(declare-fun m!433495 () Bool)

(assert (=> bs!25501 m!433495))

(assert (=> b!295811 d!99728))

(declare-fun d!99730 () Bool)

(declare-fun e!211630 () Bool)

(assert (=> d!99730 e!211630))

(declare-fun res!244267 () Bool)

(assert (=> d!99730 (=> (not res!244267) (not e!211630))))

(declare-fun lt!430663 () (_ BitVec 64))

(declare-fun lt!430665 () (_ BitVec 64))

(declare-fun lt!430666 () (_ BitVec 64))

(assert (=> d!99730 (= res!244267 (= lt!430665 (bvsub lt!430666 lt!430663)))))

(assert (=> d!99730 (or (= (bvand lt!430666 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!430663 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!430666 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!430666 lt!430663) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!99730 (= lt!430663 (remainingBits!0 ((_ sign_extend 32) (size!7673 (buf!7736 thiss!1728))) ((_ sign_extend 32) (currentByte!14251 thiss!1728)) ((_ sign_extend 32) (currentBit!14246 thiss!1728))))))

(declare-fun lt!430664 () (_ BitVec 64))

(declare-fun lt!430668 () (_ BitVec 64))

(assert (=> d!99730 (= lt!430666 (bvmul lt!430664 lt!430668))))

(assert (=> d!99730 (or (= lt!430664 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!430668 (bvsdiv (bvmul lt!430664 lt!430668) lt!430664)))))

(assert (=> d!99730 (= lt!430668 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!99730 (= lt!430664 ((_ sign_extend 32) (size!7673 (buf!7736 thiss!1728))))))

(assert (=> d!99730 (= lt!430665 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14251 thiss!1728)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14246 thiss!1728))))))

(assert (=> d!99730 (invariant!0 (currentBit!14246 thiss!1728) (currentByte!14251 thiss!1728) (size!7673 (buf!7736 thiss!1728)))))

(assert (=> d!99730 (= (bitIndex!0 (size!7673 (buf!7736 thiss!1728)) (currentByte!14251 thiss!1728) (currentBit!14246 thiss!1728)) lt!430665)))

(declare-fun b!295861 () Bool)

(declare-fun res!244266 () Bool)

(assert (=> b!295861 (=> (not res!244266) (not e!211630))))

(assert (=> b!295861 (= res!244266 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!430665))))

(declare-fun b!295862 () Bool)

(declare-fun lt!430667 () (_ BitVec 64))

(assert (=> b!295862 (= e!211630 (bvsle lt!430665 (bvmul lt!430667 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!295862 (or (= lt!430667 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!430667 #b0000000000000000000000000000000000000000000000000000000000001000) lt!430667)))))

(assert (=> b!295862 (= lt!430667 ((_ sign_extend 32) (size!7673 (buf!7736 thiss!1728))))))

(assert (= (and d!99730 res!244267) b!295861))

(assert (= (and b!295861 res!244266) b!295862))

(declare-fun m!433497 () Bool)

(assert (=> d!99730 m!433497))

(assert (=> d!99730 m!433471))

(assert (=> b!295811 d!99730))

(declare-fun d!99732 () Bool)

(declare-fun e!211633 () Bool)

(assert (=> d!99732 e!211633))

(declare-fun res!244270 () Bool)

(assert (=> d!99732 (=> (not res!244270) (not e!211633))))

(declare-fun lt!430680 () (_ BitVec 32))

(assert (=> d!99732 (= res!244270 (and (bvsge lt!430680 #b00000000000000000000000000000000) (bvslt lt!430680 (size!7673 arr!273))))))

(declare-fun lt!430677 () (_ BitVec 32))

(declare-fun lt!430678 () Unit!20619)

(declare-fun lt!430679 () (_ BitVec 8))

(declare-fun choose!53 (array!17707 (_ BitVec 64) Bool (_ BitVec 32) (_ BitVec 32) (_ BitVec 8)) Unit!20619)

(assert (=> d!99732 (= lt!430678 (choose!53 arr!273 from!505 (_1!13012 lt!430588) lt!430680 lt!430677 lt!430679))))

(assert (=> d!99732 (= lt!430679 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8726 arr!273) lt!430680)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!430677)))) ((_ sign_extend 24) (ite (_1!13012 lt!430588) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!430677) #b00000000)))))))

(assert (=> d!99732 (= lt!430677 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> d!99732 (= lt!430680 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> d!99732 (= (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!13012 lt!430588)) lt!430678)))

(declare-fun b!295866 () Bool)

(assert (=> b!295866 (= e!211633 (arrayBitRangesEq!0 arr!273 (array!17708 (store (arr!8726 arr!273) lt!430680 lt!430679) (size!7673 arr!273)) #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (= (and d!99732 res!244270) b!295866))

(declare-fun m!433501 () Bool)

(assert (=> d!99732 m!433501))

(declare-fun m!433503 () Bool)

(assert (=> d!99732 m!433503))

(declare-fun m!433505 () Bool)

(assert (=> d!99732 m!433505))

(declare-fun m!433507 () Bool)

(assert (=> b!295866 m!433507))

(declare-fun m!433509 () Bool)

(assert (=> b!295866 m!433509))

(assert (=> b!295811 d!99732))

(declare-fun d!99738 () Bool)

(assert (=> d!99738 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7673 (buf!7736 (_2!13012 lt!430588)))) ((_ sign_extend 32) (currentByte!14251 (_2!13012 lt!430588))) ((_ sign_extend 32) (currentBit!14246 (_2!13012 lt!430588))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7673 (buf!7736 (_2!13012 lt!430588)))) ((_ sign_extend 32) (currentByte!14251 (_2!13012 lt!430588))) ((_ sign_extend 32) (currentBit!14246 (_2!13012 lt!430588)))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!25503 () Bool)

(assert (= bs!25503 d!99738))

(declare-fun m!433511 () Bool)

(assert (=> bs!25503 m!433511))

(assert (=> b!295811 d!99738))

(declare-fun b!295867 () Bool)

(declare-fun e!211634 () Bool)

(declare-fun call!5127 () Bool)

(assert (=> b!295867 (= e!211634 call!5127)))

(declare-fun d!99740 () Bool)

(declare-fun res!244274 () Bool)

(declare-fun e!211637 () Bool)

(assert (=> d!99740 (=> res!244274 e!211637)))

(assert (=> d!99740 (= res!244274 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!99740 (= (arrayBitRangesEq!0 arr!273 lt!430589 #b0000000000000000000000000000000000000000000000000000000000000000 from!505) e!211637)))

(declare-fun b!295868 () Bool)

(declare-fun e!211635 () Bool)

(assert (=> b!295868 (= e!211635 e!211634)))

(declare-fun c!13498 () Bool)

(declare-fun lt!430682 () tuple4!894)

(assert (=> b!295868 (= c!13498 (= (_3!1380 lt!430682) (_4!447 lt!430682)))))

(declare-fun b!295869 () Bool)

(declare-fun res!244273 () Bool)

(declare-fun lt!430681 () (_ BitVec 32))

(assert (=> b!295869 (= res!244273 (= lt!430681 #b00000000000000000000000000000000))))

(declare-fun e!211636 () Bool)

(assert (=> b!295869 (=> res!244273 e!211636)))

(declare-fun e!211639 () Bool)

(assert (=> b!295869 (= e!211639 e!211636)))

(declare-fun b!295870 () Bool)

(assert (=> b!295870 (= e!211636 call!5127)))

(declare-fun b!295871 () Bool)

(declare-fun e!211638 () Bool)

(assert (=> b!295871 (= e!211638 (arrayRangesEq!1505 arr!273 lt!430589 (_1!13016 lt!430682) (_2!13016 lt!430682)))))

(declare-fun b!295872 () Bool)

(assert (=> b!295872 (= e!211634 e!211639)))

(declare-fun lt!430683 () (_ BitVec 32))

(declare-fun res!244271 () Bool)

(assert (=> b!295872 (= res!244271 (byteRangesEq!0 (select (arr!8726 arr!273) (_3!1380 lt!430682)) (select (arr!8726 lt!430589) (_3!1380 lt!430682)) lt!430683 #b00000000000000000000000000001000))))

(assert (=> b!295872 (=> (not res!244271) (not e!211639))))

(declare-fun b!295873 () Bool)

(assert (=> b!295873 (= e!211637 e!211635)))

(declare-fun res!244272 () Bool)

(assert (=> b!295873 (=> (not res!244272) (not e!211635))))

(assert (=> b!295873 (= res!244272 e!211638)))

(declare-fun res!244275 () Bool)

(assert (=> b!295873 (=> res!244275 e!211638)))

(assert (=> b!295873 (= res!244275 (bvsge (_1!13016 lt!430682) (_2!13016 lt!430682)))))

(assert (=> b!295873 (= lt!430681 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!295873 (= lt!430683 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!295873 (= lt!430682 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(declare-fun bm!5124 () Bool)

(assert (=> bm!5124 (= call!5127 (byteRangesEq!0 (ite c!13498 (select (arr!8726 arr!273) (_3!1380 lt!430682)) (select (arr!8726 arr!273) (_4!447 lt!430682))) (ite c!13498 (select (arr!8726 lt!430589) (_3!1380 lt!430682)) (select (arr!8726 lt!430589) (_4!447 lt!430682))) (ite c!13498 lt!430683 #b00000000000000000000000000000000) lt!430681))))

(assert (= (and d!99740 (not res!244274)) b!295873))

(assert (= (and b!295873 (not res!244275)) b!295871))

(assert (= (and b!295873 res!244272) b!295868))

(assert (= (and b!295868 c!13498) b!295867))

(assert (= (and b!295868 (not c!13498)) b!295872))

(assert (= (and b!295872 res!244271) b!295869))

(assert (= (and b!295869 (not res!244273)) b!295870))

(assert (= (or b!295867 b!295870) bm!5124))

(declare-fun m!433513 () Bool)

(assert (=> b!295871 m!433513))

(declare-fun m!433515 () Bool)

(assert (=> b!295872 m!433515))

(declare-fun m!433517 () Bool)

(assert (=> b!295872 m!433517))

(assert (=> b!295872 m!433515))

(assert (=> b!295872 m!433517))

(declare-fun m!433519 () Bool)

(assert (=> b!295872 m!433519))

(assert (=> b!295873 m!433485))

(assert (=> bm!5124 m!433517))

(assert (=> bm!5124 m!433515))

(declare-fun m!433521 () Bool)

(assert (=> bm!5124 m!433521))

(declare-fun m!433523 () Bool)

(assert (=> bm!5124 m!433523))

(declare-fun m!433525 () Bool)

(assert (=> bm!5124 m!433525))

(assert (=> b!295811 d!99740))

(declare-fun b!295977 () Bool)

(declare-fun res!244363 () Bool)

(declare-fun e!211727 () Bool)

(assert (=> b!295977 (=> (not res!244363) (not e!211727))))

(declare-fun lt!430932 () tuple3!1862)

(assert (=> b!295977 (= res!244363 (arrayBitRangesEq!0 lt!430589 (_3!1378 lt!430932) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun lt!430929 () tuple3!1862)

(declare-fun bm!5136 () Bool)

(declare-fun call!5140 () Bool)

(declare-fun c!13508 () Bool)

(assert (=> bm!5136 (= call!5140 (arrayBitRangesEq!0 lt!430589 (ite c!13508 (_3!1378 lt!430929) lt!430589) #b0000000000000000000000000000000000000000000000000000000000000000 (ite c!13508 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvmul ((_ sign_extend 32) (size!7673 lt!430589)) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!295978 () Bool)

(declare-fun res!244360 () Bool)

(assert (=> b!295978 (=> (not res!244360) (not e!211727))))

(assert (=> b!295978 (= res!244360 (and (= (buf!7736 (_2!13012 lt!430588)) (buf!7736 (_2!13013 lt!430932))) (= (size!7673 lt!430589) (size!7673 (_3!1378 lt!430932)))))))

(declare-fun d!99742 () Bool)

(assert (=> d!99742 e!211727))

(declare-fun res!244365 () Bool)

(assert (=> d!99742 (=> (not res!244365) (not e!211727))))

(declare-fun lt!430909 () (_ BitVec 64))

(assert (=> d!99742 (= res!244365 (= (bvsub lt!430909 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitIndex!0 (size!7673 (buf!7736 (_2!13013 lt!430932))) (currentByte!14251 (_2!13013 lt!430932)) (currentBit!14246 (_2!13013 lt!430932)))))))

(assert (=> d!99742 (or (= (bvand lt!430909 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!430909 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!430909 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!430934 () (_ BitVec 64))

(assert (=> d!99742 (= lt!430909 (bvadd lt!430934 to!474))))

(assert (=> d!99742 (or (not (= (bvand lt!430934 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!430934 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!430934 to!474) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!99742 (= lt!430934 (bitIndex!0 (size!7673 (buf!7736 (_2!13012 lt!430588))) (currentByte!14251 (_2!13012 lt!430588)) (currentBit!14246 (_2!13012 lt!430588))))))

(declare-fun e!211725 () tuple3!1862)

(assert (=> d!99742 (= lt!430932 e!211725)))

(assert (=> d!99742 (= c!13508 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> d!99742 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!99742 (= (readBitsLoop!0 (_2!13012 lt!430588) nBits!523 lt!430589 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474) lt!430932)))

(declare-fun b!295979 () Bool)

(declare-datatypes ((List!987 0))(
  ( (Nil!984) (Cons!983 (h!1102 Bool) (t!1872 List!987)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!13350 array!17707 (_ BitVec 64) (_ BitVec 64)) List!987)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!13350 BitStream!13350 (_ BitVec 64)) List!987)

(assert (=> b!295979 (= e!211727 (= (byteArrayBitContentToList!0 (_2!13013 lt!430932) (_3!1378 lt!430932) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))) (bitStreamReadBitsIntoList!0 (_2!13013 lt!430932) (_2!13012 lt!430588) (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))))

(assert (=> b!295979 (or (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!295979 (or (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!211726 () Bool)

(declare-fun b!295980 () Bool)

(assert (=> b!295980 (= e!211726 (and (= (buf!7736 (_2!13012 lt!430588)) (buf!7736 (_2!13013 lt!430929))) (= (size!7673 lt!430589) (size!7673 (_3!1378 lt!430929)))))))

(declare-fun b!295981 () Bool)

(declare-fun res!244362 () Bool)

(assert (=> b!295981 (=> (not res!244362) (not e!211727))))

(assert (=> b!295981 (= res!244362 (invariant!0 (currentBit!14246 (_2!13013 lt!430932)) (currentByte!14251 (_2!13013 lt!430932)) (size!7673 (buf!7736 (_2!13013 lt!430932)))))))

(declare-fun e!211724 () Bool)

(declare-fun b!295982 () Bool)

(declare-datatypes ((tuple2!23272 0))(
  ( (tuple2!23273 (_1!13017 BitStream!13350) (_2!13017 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!13350) tuple2!23272)

(assert (=> b!295982 (= e!211724 (= (bitAt!0 (_3!1378 lt!430932) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (_2!13017 (readBitPure!0 (_2!13012 lt!430588)))))))

(declare-fun b!295983 () Bool)

(declare-fun res!244361 () Bool)

(assert (=> b!295983 (=> (not res!244361) (not e!211727))))

(assert (=> b!295983 (= res!244361 e!211724)))

(declare-fun res!244364 () Bool)

(assert (=> b!295983 (=> res!244364 e!211724)))

(assert (=> b!295983 (= res!244364 (not (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474)))))

(declare-fun b!295984 () Bool)

(declare-fun lt!430911 () Unit!20619)

(assert (=> b!295984 (= e!211725 (tuple3!1863 lt!430911 (_2!13013 lt!430929) (_3!1378 lt!430929)))))

(declare-fun lt!430936 () tuple2!23268)

(assert (=> b!295984 (= lt!430936 (readBit!0 (_2!13012 lt!430588)))))

(declare-fun lt!430938 () (_ BitVec 32))

(assert (=> b!295984 (= lt!430938 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!430912 () (_ BitVec 32))

(assert (=> b!295984 (= lt!430912 ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!430923 () array!17707)

(assert (=> b!295984 (= lt!430923 (array!17708 (store (arr!8726 lt!430589) lt!430938 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8726 lt!430589) lt!430938)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!430912)))) ((_ sign_extend 24) (ite (_1!13012 lt!430936) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!430912) #b00000000))))) (size!7673 lt!430589)))))

(declare-fun lt!430935 () (_ BitVec 64))

(assert (=> b!295984 (= lt!430935 (bvsub nBits!523 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun lt!430927 () (_ BitVec 64))

(assert (=> b!295984 (= lt!430927 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!430917 () Unit!20619)

(assert (=> b!295984 (= lt!430917 (validateOffsetBitsIneqLemma!0 (_2!13012 lt!430588) (_2!13012 lt!430936) lt!430935 lt!430927))))

(assert (=> b!295984 (validate_offset_bits!1 ((_ sign_extend 32) (size!7673 (buf!7736 (_2!13012 lt!430936)))) ((_ sign_extend 32) (currentByte!14251 (_2!13012 lt!430936))) ((_ sign_extend 32) (currentBit!14246 (_2!13012 lt!430936))) (bvsub lt!430935 lt!430927))))

(declare-fun lt!430939 () Unit!20619)

(assert (=> b!295984 (= lt!430939 lt!430917)))

(assert (=> b!295984 (= lt!430929 (readBitsLoop!0 (_2!13012 lt!430936) nBits!523 lt!430923 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001) to!474))))

(declare-fun res!244359 () Bool)

(assert (=> b!295984 (= res!244359 (= (bvsub (bvadd (bitIndex!0 (size!7673 (buf!7736 (_2!13012 lt!430588))) (currentByte!14251 (_2!13012 lt!430588)) (currentBit!14246 (_2!13012 lt!430588))) to!474) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitIndex!0 (size!7673 (buf!7736 (_2!13013 lt!430929))) (currentByte!14251 (_2!13013 lt!430929)) (currentBit!14246 (_2!13013 lt!430929)))))))

(assert (=> b!295984 (=> (not res!244359) (not e!211726))))

(assert (=> b!295984 e!211726))

(declare-fun lt!430920 () Unit!20619)

(declare-fun Unit!20623 () Unit!20619)

(assert (=> b!295984 (= lt!430920 Unit!20623)))

(declare-fun lt!430937 () (_ BitVec 32))

(assert (=> b!295984 (= lt!430937 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!430915 () (_ BitVec 32))

(assert (=> b!295984 (= lt!430915 ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!430910 () Unit!20619)

(assert (=> b!295984 (= lt!430910 (arrayBitRangesUpdatedAtLemma!0 lt!430589 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (_1!13012 lt!430936)))))

(declare-fun call!5139 () Bool)

(assert (=> b!295984 call!5139))

(declare-fun lt!430913 () Unit!20619)

(assert (=> b!295984 (= lt!430913 lt!430910)))

(declare-fun lt!430941 () (_ BitVec 64))

(assert (=> b!295984 (= lt!430941 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!430919 () Unit!20619)

(assert (=> b!295984 (= lt!430919 (arrayBitRangesEqTransitive!0 lt!430589 lt!430923 (_3!1378 lt!430929) lt!430941 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!295984 (arrayBitRangesEq!0 lt!430589 (_3!1378 lt!430929) lt!430941 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))))

(declare-fun lt!430926 () Unit!20619)

(assert (=> b!295984 (= lt!430926 lt!430919)))

(assert (=> b!295984 call!5140))

(declare-fun lt!430940 () Unit!20619)

(declare-fun Unit!20624 () Unit!20619)

(assert (=> b!295984 (= lt!430940 Unit!20624)))

(declare-fun lt!430928 () Unit!20619)

(assert (=> b!295984 (= lt!430928 (arrayBitRangesEqImpliesEq!0 lt!430923 (_3!1378 lt!430929) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!295984 (= (bitAt!0 lt!430923 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitAt!0 (_3!1378 lt!430929) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun lt!430944 () Unit!20619)

(assert (=> b!295984 (= lt!430944 lt!430928)))

(declare-fun lt!430921 () Unit!20619)

(declare-fun Unit!20625 () Unit!20619)

(assert (=> b!295984 (= lt!430921 Unit!20625)))

(declare-fun lt!430931 () Bool)

(assert (=> b!295984 (= lt!430931 (= (bitAt!0 (_3!1378 lt!430929) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (_1!13012 lt!430936)))))

(declare-fun Unit!20626 () Unit!20619)

(assert (=> b!295984 (= lt!430911 Unit!20626)))

(assert (=> b!295984 lt!430931))

(declare-fun lt!430918 () Unit!20619)

(declare-fun b!295985 () Bool)

(assert (=> b!295985 (= e!211725 (tuple3!1863 lt!430918 (_2!13012 lt!430588) lt!430589))))

(declare-fun lt!430924 () Unit!20619)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17707) Unit!20619)

(assert (=> b!295985 (= lt!430924 (arrayBitRangesEqReflexiveLemma!0 lt!430589))))

(assert (=> b!295985 call!5140))

(declare-fun lt!430914 () Unit!20619)

(assert (=> b!295985 (= lt!430914 lt!430924)))

(declare-fun lt!430942 () array!17707)

(assert (=> b!295985 (= lt!430942 lt!430589)))

(declare-fun lt!430925 () array!17707)

(assert (=> b!295985 (= lt!430925 lt!430589)))

(declare-fun lt!430943 () (_ BitVec 64))

(assert (=> b!295985 (= lt!430943 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!430930 () (_ BitVec 64))

(assert (=> b!295985 (= lt!430930 ((_ sign_extend 32) (size!7673 lt!430589)))))

(declare-fun lt!430922 () (_ BitVec 64))

(assert (=> b!295985 (= lt!430922 (bvmul lt!430930 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!430933 () (_ BitVec 64))

(assert (=> b!295985 (= lt!430933 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!430916 () (_ BitVec 64))

(assert (=> b!295985 (= lt!430916 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))))

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17707 array!17707 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20619)

(assert (=> b!295985 (= lt!430918 (arrayBitRangesEqSlicedLemma!0 lt!430942 lt!430925 lt!430943 lt!430922 lt!430933 lt!430916))))

(assert (=> b!295985 call!5139))

(declare-fun bm!5137 () Bool)

(assert (=> bm!5137 (= call!5139 (arrayBitRangesEq!0 (ite c!13508 lt!430589 lt!430942) (ite c!13508 (array!17708 (store (arr!8726 lt!430589) lt!430937 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8726 lt!430589) lt!430937)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!430915)))) ((_ sign_extend 24) (ite (_1!13012 lt!430936) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!430915) #b00000000))))) (size!7673 lt!430589)) lt!430925) (ite c!13508 #b0000000000000000000000000000000000000000000000000000000000000000 lt!430933) (ite c!13508 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) lt!430916)))))

(assert (= (and d!99742 c!13508) b!295984))

(assert (= (and d!99742 (not c!13508)) b!295985))

(assert (= (and b!295984 res!244359) b!295980))

(assert (= (or b!295984 b!295985) bm!5136))

(assert (= (or b!295984 b!295985) bm!5137))

(assert (= (and d!99742 res!244365) b!295978))

(assert (= (and b!295978 res!244360) b!295977))

(assert (= (and b!295977 res!244363) b!295983))

(assert (= (and b!295983 (not res!244364)) b!295982))

(assert (= (and b!295983 res!244361) b!295981))

(assert (= (and b!295981 res!244362) b!295979))

(declare-fun m!433655 () Bool)

(assert (=> bm!5137 m!433655))

(declare-fun m!433657 () Bool)

(assert (=> bm!5137 m!433657))

(declare-fun m!433659 () Bool)

(assert (=> bm!5137 m!433659))

(declare-fun m!433661 () Bool)

(assert (=> bm!5137 m!433661))

(declare-fun m!433663 () Bool)

(assert (=> b!295977 m!433663))

(declare-fun m!433665 () Bool)

(assert (=> d!99742 m!433665))

(declare-fun m!433667 () Bool)

(assert (=> d!99742 m!433667))

(declare-fun m!433669 () Bool)

(assert (=> b!295981 m!433669))

(declare-fun m!433671 () Bool)

(assert (=> b!295979 m!433671))

(declare-fun m!433673 () Bool)

(assert (=> b!295979 m!433673))

(declare-fun m!433675 () Bool)

(assert (=> b!295985 m!433675))

(declare-fun m!433677 () Bool)

(assert (=> b!295985 m!433677))

(declare-fun m!433679 () Bool)

(assert (=> b!295984 m!433679))

(declare-fun m!433681 () Bool)

(assert (=> b!295984 m!433681))

(declare-fun m!433683 () Bool)

(assert (=> b!295984 m!433683))

(declare-fun m!433685 () Bool)

(assert (=> b!295984 m!433685))

(assert (=> b!295984 m!433667))

(declare-fun m!433687 () Bool)

(assert (=> b!295984 m!433687))

(declare-fun m!433689 () Bool)

(assert (=> b!295984 m!433689))

(declare-fun m!433691 () Bool)

(assert (=> b!295984 m!433691))

(declare-fun m!433693 () Bool)

(assert (=> b!295984 m!433693))

(declare-fun m!433695 () Bool)

(assert (=> b!295984 m!433695))

(declare-fun m!433697 () Bool)

(assert (=> b!295984 m!433697))

(declare-fun m!433699 () Bool)

(assert (=> b!295984 m!433699))

(declare-fun m!433701 () Bool)

(assert (=> b!295984 m!433701))

(declare-fun m!433703 () Bool)

(assert (=> b!295984 m!433703))

(declare-fun m!433705 () Bool)

(assert (=> b!295984 m!433705))

(declare-fun m!433707 () Bool)

(assert (=> bm!5136 m!433707))

(declare-fun m!433709 () Bool)

(assert (=> b!295982 m!433709))

(declare-fun m!433711 () Bool)

(assert (=> b!295982 m!433711))

(assert (=> b!295811 d!99742))

(declare-fun d!99794 () Bool)

(assert (=> d!99794 (= (bitAt!0 lt!430589 from!505) (not (= (bvand ((_ sign_extend 24) (select (arr!8726 lt!430589) ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!25514 () Bool)

(assert (= bs!25514 d!99794))

(declare-fun m!433713 () Bool)

(assert (=> bs!25514 m!433713))

(declare-fun m!433715 () Bool)

(assert (=> bs!25514 m!433715))

(assert (=> b!295811 d!99794))

(declare-fun d!99796 () Bool)

(declare-fun e!211734 () Bool)

(assert (=> d!99796 e!211734))

(declare-fun res!244368 () Bool)

(assert (=> d!99796 (=> (not res!244368) (not e!211734))))

(declare-datatypes ((tuple2!23274 0))(
  ( (tuple2!23275 (_1!13018 Unit!20619) (_2!13018 BitStream!13350)) )
))
(declare-fun increaseBitIndex!0 (BitStream!13350) tuple2!23274)

(assert (=> d!99796 (= res!244368 (= (buf!7736 (_2!13018 (increaseBitIndex!0 thiss!1728))) (buf!7736 thiss!1728)))))

(declare-fun lt!430965 () Bool)

(assert (=> d!99796 (= lt!430965 (not (= (bvand ((_ sign_extend 24) (select (arr!8726 (buf!7736 thiss!1728)) (currentByte!14251 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14246 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!430964 () tuple2!23268)

(assert (=> d!99796 (= lt!430964 (tuple2!23269 (not (= (bvand ((_ sign_extend 24) (select (arr!8726 (buf!7736 thiss!1728)) (currentByte!14251 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14246 thiss!1728)))) #b00000000000000000000000000000000)) (_2!13018 (increaseBitIndex!0 thiss!1728))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!99796 (validate_offset_bit!0 ((_ sign_extend 32) (size!7673 (buf!7736 thiss!1728))) ((_ sign_extend 32) (currentByte!14251 thiss!1728)) ((_ sign_extend 32) (currentBit!14246 thiss!1728)))))

(assert (=> d!99796 (= (readBit!0 thiss!1728) lt!430964)))

(declare-fun lt!430959 () (_ BitVec 64))

(declare-fun lt!430960 () (_ BitVec 64))

(declare-fun b!295988 () Bool)

(assert (=> b!295988 (= e!211734 (= (bitIndex!0 (size!7673 (buf!7736 (_2!13018 (increaseBitIndex!0 thiss!1728)))) (currentByte!14251 (_2!13018 (increaseBitIndex!0 thiss!1728))) (currentBit!14246 (_2!13018 (increaseBitIndex!0 thiss!1728)))) (bvadd lt!430959 lt!430960)))))

(assert (=> b!295988 (or (not (= (bvand lt!430959 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!430960 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!430959 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!430959 lt!430960) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!295988 (= lt!430960 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!295988 (= lt!430959 (bitIndex!0 (size!7673 (buf!7736 thiss!1728)) (currentByte!14251 thiss!1728) (currentBit!14246 thiss!1728)))))

(declare-fun lt!430961 () Bool)

(assert (=> b!295988 (= lt!430961 (not (= (bvand ((_ sign_extend 24) (select (arr!8726 (buf!7736 thiss!1728)) (currentByte!14251 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14246 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!430962 () Bool)

(assert (=> b!295988 (= lt!430962 (not (= (bvand ((_ sign_extend 24) (select (arr!8726 (buf!7736 thiss!1728)) (currentByte!14251 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14246 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!430963 () Bool)

(assert (=> b!295988 (= lt!430963 (not (= (bvand ((_ sign_extend 24) (select (arr!8726 (buf!7736 thiss!1728)) (currentByte!14251 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14246 thiss!1728)))) #b00000000000000000000000000000000)))))

(assert (= (and d!99796 res!244368) b!295988))

(declare-fun m!433717 () Bool)

(assert (=> d!99796 m!433717))

(declare-fun m!433719 () Bool)

(assert (=> d!99796 m!433719))

(declare-fun m!433721 () Bool)

(assert (=> d!99796 m!433721))

(declare-fun m!433723 () Bool)

(assert (=> d!99796 m!433723))

(assert (=> b!295988 m!433721))

(assert (=> b!295988 m!433405))

(declare-fun m!433725 () Bool)

(assert (=> b!295988 m!433725))

(assert (=> b!295988 m!433717))

(assert (=> b!295988 m!433719))

(assert (=> b!295811 d!99796))

(declare-fun d!99798 () Bool)

(assert (=> d!99798 (= (bitAt!0 (_3!1378 lt!430587) from!505) (not (= (bvand ((_ sign_extend 24) (select (arr!8726 (_3!1378 lt!430587)) ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!25515 () Bool)

(assert (= bs!25515 d!99798))

(declare-fun m!433727 () Bool)

(assert (=> bs!25515 m!433727))

(assert (=> bs!25515 m!433715))

(assert (=> b!295811 d!99798))

(declare-fun d!99800 () Bool)

(assert (=> d!99800 (arrayBitRangesEq!0 arr!273 (_3!1378 lt!430587) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!430968 () Unit!20619)

(declare-fun choose!49 (array!17707 array!17707 array!17707 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20619)

(assert (=> d!99800 (= lt!430968 (choose!49 arr!273 lt!430589 (_3!1378 lt!430587) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!99800 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!99800 (= (arrayBitRangesEqTransitive!0 arr!273 lt!430589 (_3!1378 lt!430587) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) lt!430968)))

(declare-fun bs!25516 () Bool)

(assert (= bs!25516 d!99800))

(assert (=> bs!25516 m!433399))

(declare-fun m!433729 () Bool)

(assert (=> bs!25516 m!433729))

(assert (=> b!295811 d!99800))

(declare-fun d!99802 () Bool)

(assert (=> d!99802 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7673 (buf!7736 thiss!1728))) ((_ sign_extend 32) (currentByte!14251 thiss!1728)) ((_ sign_extend 32) (currentBit!14246 thiss!1728)) (bvsub nBits!523 from!505)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7673 (buf!7736 thiss!1728))) ((_ sign_extend 32) (currentByte!14251 thiss!1728)) ((_ sign_extend 32) (currentBit!14246 thiss!1728))) (bvsub nBits!523 from!505)))))

(declare-fun bs!25517 () Bool)

(assert (= bs!25517 d!99802))

(assert (=> bs!25517 m!433497))

(assert (=> b!295810 d!99802))

(check-sat (not bm!5123) (not d!99802) (not b!295985) (not b!295860) (not b!295977) (not d!99728) (not d!99800) (not b!295979) (not b!295984) (not d!99742) (not b!295855) (not b!295857) (not b!295988) (not d!99732) (not bm!5136) (not d!99718) (not bm!5137) (not b!295873) (not b!295981) (not d!99738) (not b!295871) (not d!99722) (not b!295982) (not d!99730) (not b!295856) (not d!99726) (not b!295872) (not d!99796) (not bm!5124) (not b!295866))
