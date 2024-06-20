; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65972 () Bool)

(assert start!65972)

(declare-fun res!244239 () Bool)

(declare-fun e!211603 () Bool)

(assert (=> start!65972 (=> (not res!244239) (not e!211603))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-datatypes ((array!17709 0))(
  ( (array!17710 (arr!8727 (Array (_ BitVec 32) (_ BitVec 8))) (size!7674 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17709)

(assert (=> start!65972 (= res!244239 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7674 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65972 e!211603))

(declare-datatypes ((BitStream!13352 0))(
  ( (BitStream!13353 (buf!7737 array!17709) (currentByte!14252 (_ BitVec 32)) (currentBit!14247 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13352)

(declare-fun e!211600 () Bool)

(declare-fun inv!12 (BitStream!13352) Bool)

(assert (=> start!65972 (and (inv!12 thiss!1728) e!211600)))

(assert (=> start!65972 true))

(declare-fun array_inv!7286 (array!17709) Bool)

(assert (=> start!65972 (array_inv!7286 arr!273)))

(declare-fun b!295825 () Bool)

(declare-fun e!211602 () Bool)

(declare-fun lt!430618 () Bool)

(declare-datatypes ((tuple2!23270 0))(
  ( (tuple2!23271 (_1!13014 Bool) (_2!13014 BitStream!13352)) )
))
(declare-fun lt!430619 () tuple2!23270)

(assert (=> b!295825 (= e!211602 (= lt!430618 (_1!13014 lt!430619)))))

(declare-fun b!295826 () Bool)

(declare-fun res!244237 () Bool)

(assert (=> b!295826 (=> (not res!244237) (not e!211603))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!295826 (= res!244237 (validate_offset_bits!1 ((_ sign_extend 32) (size!7674 (buf!7737 thiss!1728))) ((_ sign_extend 32) (currentByte!14252 thiss!1728)) ((_ sign_extend 32) (currentBit!14247 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun lt!430629 () (_ BitVec 64))

(declare-fun lt!430617 () (_ BitVec 64))

(declare-fun b!295827 () Bool)

(assert (=> b!295827 (= e!211603 (not (or (= lt!430617 (bvand from!505 #b1000000000000000000000000000000000000000000000000000000000000000)) (= lt!430617 (bvand lt!430629 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun lt!430624 () (_ BitVec 64))

(assert (=> b!295827 (= lt!430617 (bvand lt!430624 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!295827 e!211602))

(declare-fun res!244240 () Bool)

(assert (=> b!295827 (=> (not res!244240) (not e!211602))))

(declare-fun lt!430626 () array!17709)

(declare-fun bitAt!0 (array!17709 (_ BitVec 64)) Bool)

(assert (=> b!295827 (= res!244240 (= (bitAt!0 lt!430626 from!505) lt!430618))))

(declare-datatypes ((Unit!20621 0))(
  ( (Unit!20622) )
))
(declare-datatypes ((tuple3!1864 0))(
  ( (tuple3!1865 (_1!13015 Unit!20621) (_2!13015 BitStream!13352) (_3!1379 array!17709)) )
))
(declare-fun lt!430628 () tuple3!1864)

(assert (=> b!295827 (= lt!430618 (bitAt!0 (_3!1379 lt!430628) from!505))))

(declare-fun lt!430623 () Unit!20621)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!17709 array!17709 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20621)

(assert (=> b!295827 (= lt!430623 (arrayBitRangesEqImpliesEq!0 lt!430626 (_3!1379 lt!430628) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun arrayBitRangesEq!0 (array!17709 array!17709 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!295827 (arrayBitRangesEq!0 arr!273 (_3!1379 lt!430628) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!430620 () Unit!20621)

(declare-fun arrayBitRangesEqTransitive!0 (array!17709 array!17709 array!17709 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20621)

(assert (=> b!295827 (= lt!430620 (arrayBitRangesEqTransitive!0 arr!273 lt!430626 (_3!1379 lt!430628) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!295827 (arrayBitRangesEq!0 arr!273 lt!430626 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!430627 () Unit!20621)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17709 (_ BitVec 64) Bool) Unit!20621)

(assert (=> b!295827 (= lt!430627 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!13014 lt!430619)))))

(declare-fun e!211604 () Bool)

(assert (=> b!295827 e!211604))

(declare-fun res!244241 () Bool)

(assert (=> b!295827 (=> (not res!244241) (not e!211604))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!295827 (= res!244241 (= lt!430629 (bitIndex!0 (size!7674 (buf!7737 (_2!13015 lt!430628))) (currentByte!14252 (_2!13015 lt!430628)) (currentBit!14247 (_2!13015 lt!430628)))))))

(assert (=> b!295827 (= lt!430629 (bvsub lt!430624 from!505))))

(assert (=> b!295827 (= lt!430624 (bvadd (bitIndex!0 (size!7674 (buf!7737 thiss!1728)) (currentByte!14252 thiss!1728) (currentBit!14247 thiss!1728)) to!474))))

(declare-fun readBitsLoop!0 (BitStream!13352 (_ BitVec 64) array!17709 (_ BitVec 64) (_ BitVec 64)) tuple3!1864)

(assert (=> b!295827 (= lt!430628 (readBitsLoop!0 (_2!13014 lt!430619) nBits!523 lt!430626 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!295827 (validate_offset_bits!1 ((_ sign_extend 32) (size!7674 (buf!7737 (_2!13014 lt!430619)))) ((_ sign_extend 32) (currentByte!14252 (_2!13014 lt!430619))) ((_ sign_extend 32) (currentBit!14247 (_2!13014 lt!430619))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!430625 () Unit!20621)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!13352 BitStream!13352 (_ BitVec 64) (_ BitVec 64)) Unit!20621)

(assert (=> b!295827 (= lt!430625 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!13014 lt!430619) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!430621 () (_ BitVec 32))

(declare-fun lt!430622 () (_ BitVec 32))

(assert (=> b!295827 (= lt!430626 (array!17710 (store (arr!8727 arr!273) lt!430622 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8727 arr!273) lt!430622)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!430621)))) ((_ sign_extend 24) (ite (_1!13014 lt!430619) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!430621) #b00000000))))) (size!7674 arr!273)))))

(assert (=> b!295827 (= lt!430621 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!295827 (= lt!430622 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!13352) tuple2!23270)

(assert (=> b!295827 (= lt!430619 (readBit!0 thiss!1728))))

(declare-fun b!295828 () Bool)

(assert (=> b!295828 (= e!211600 (array_inv!7286 (buf!7737 thiss!1728)))))

(declare-fun b!295829 () Bool)

(assert (=> b!295829 (= e!211604 (and (= (buf!7737 thiss!1728) (buf!7737 (_2!13015 lt!430628))) (= (size!7674 arr!273) (size!7674 (_3!1379 lt!430628)))))))

(declare-fun b!295830 () Bool)

(declare-fun res!244238 () Bool)

(assert (=> b!295830 (=> (not res!244238) (not e!211603))))

(assert (=> b!295830 (= res!244238 (bvslt from!505 to!474))))

(assert (= (and start!65972 res!244239) b!295826))

(assert (= (and b!295826 res!244237) b!295830))

(assert (= (and b!295830 res!244238) b!295827))

(assert (= (and b!295827 res!244241) b!295829))

(assert (= (and b!295827 res!244240) b!295825))

(assert (= start!65972 b!295828))

(declare-fun m!433431 () Bool)

(assert (=> start!65972 m!433431))

(declare-fun m!433433 () Bool)

(assert (=> start!65972 m!433433))

(declare-fun m!433435 () Bool)

(assert (=> b!295826 m!433435))

(declare-fun m!433437 () Bool)

(assert (=> b!295827 m!433437))

(declare-fun m!433439 () Bool)

(assert (=> b!295827 m!433439))

(declare-fun m!433441 () Bool)

(assert (=> b!295827 m!433441))

(declare-fun m!433443 () Bool)

(assert (=> b!295827 m!433443))

(declare-fun m!433445 () Bool)

(assert (=> b!295827 m!433445))

(declare-fun m!433447 () Bool)

(assert (=> b!295827 m!433447))

(declare-fun m!433449 () Bool)

(assert (=> b!295827 m!433449))

(declare-fun m!433451 () Bool)

(assert (=> b!295827 m!433451))

(declare-fun m!433453 () Bool)

(assert (=> b!295827 m!433453))

(declare-fun m!433455 () Bool)

(assert (=> b!295827 m!433455))

(declare-fun m!433457 () Bool)

(assert (=> b!295827 m!433457))

(declare-fun m!433459 () Bool)

(assert (=> b!295827 m!433459))

(declare-fun m!433461 () Bool)

(assert (=> b!295827 m!433461))

(declare-fun m!433463 () Bool)

(assert (=> b!295827 m!433463))

(declare-fun m!433465 () Bool)

(assert (=> b!295827 m!433465))

(declare-fun m!433467 () Bool)

(assert (=> b!295827 m!433467))

(declare-fun m!433469 () Bool)

(assert (=> b!295828 m!433469))

(push 1)

(assert (not b!295828))

(assert (not b!295827))

(assert (not b!295826))

(assert (not start!65972))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!99758 () Bool)

(assert (=> d!99758 (= (array_inv!7286 (buf!7737 thiss!1728)) (bvsge (size!7674 (buf!7737 thiss!1728)) #b00000000000000000000000000000000))))

(assert (=> b!295828 d!99758))

(declare-fun b!295927 () Bool)

(declare-fun e!211692 () Bool)

(declare-fun e!211689 () Bool)

(assert (=> b!295927 (= e!211692 e!211689)))

(declare-fun res!244322 () Bool)

(assert (=> b!295927 (=> (not res!244322) (not e!211689))))

(declare-fun e!211687 () Bool)

(assert (=> b!295927 (= res!244322 e!211687)))

(declare-fun res!244320 () Bool)

(assert (=> b!295927 (=> res!244320 e!211687)))

(declare-datatypes ((tuple4!898 0))(
  ( (tuple4!899 (_1!13022 (_ BitVec 32)) (_2!13022 (_ BitVec 32)) (_3!1382 (_ BitVec 32)) (_4!449 (_ BitVec 32))) )
))
(declare-fun lt!430766 () tuple4!898)

(assert (=> b!295927 (= res!244320 (bvsge (_1!13022 lt!430766) (_2!13022 lt!430766)))))

(declare-fun lt!430765 () (_ BitVec 32))

(assert (=> b!295927 (= lt!430765 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!430767 () (_ BitVec 32))

(assert (=> b!295927 (= lt!430767 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!898)

(assert (=> b!295927 (= lt!430766 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(declare-fun call!5133 () Bool)

(declare-fun c!13504 () Bool)

(declare-fun bm!5130 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!5130 (= call!5133 (byteRangesEq!0 (ite c!13504 (select (arr!8727 arr!273) (_3!1382 lt!430766)) (select (arr!8727 arr!273) (_4!449 lt!430766))) (ite c!13504 (select (arr!8727 (_3!1379 lt!430628)) (_3!1382 lt!430766)) (select (arr!8727 (_3!1379 lt!430628)) (_4!449 lt!430766))) (ite c!13504 lt!430767 #b00000000000000000000000000000000) lt!430765))))

(declare-fun b!295928 () Bool)

(declare-fun e!211691 () Bool)

(declare-fun e!211688 () Bool)

(assert (=> b!295928 (= e!211691 e!211688)))

(declare-fun res!244319 () Bool)

(assert (=> b!295928 (= res!244319 (byteRangesEq!0 (select (arr!8727 arr!273) (_3!1382 lt!430766)) (select (arr!8727 (_3!1379 lt!430628)) (_3!1382 lt!430766)) lt!430767 #b00000000000000000000000000001000))))

(assert (=> b!295928 (=> (not res!244319) (not e!211688))))

(declare-fun b!295930 () Bool)

(declare-fun res!244321 () Bool)

(assert (=> b!295930 (= res!244321 (= lt!430765 #b00000000000000000000000000000000))))

(declare-fun e!211690 () Bool)

(assert (=> b!295930 (=> res!244321 e!211690)))

(assert (=> b!295930 (= e!211688 e!211690)))

(declare-fun b!295931 () Bool)

(assert (=> b!295931 (= e!211689 e!211691)))

(assert (=> b!295931 (= c!13504 (= (_3!1382 lt!430766) (_4!449 lt!430766)))))

(declare-fun b!295932 () Bool)

(assert (=> b!295932 (= e!211691 call!5133)))

(declare-fun b!295933 () Bool)

(declare-fun arrayRangesEq!1507 (array!17709 array!17709 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!295933 (= e!211687 (arrayRangesEq!1507 arr!273 (_3!1379 lt!430628) (_1!13022 lt!430766) (_2!13022 lt!430766)))))

(declare-fun d!99760 () Bool)

(declare-fun res!244318 () Bool)

(assert (=> d!99760 (=> res!244318 e!211692)))

(assert (=> d!99760 (= res!244318 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!99760 (= (arrayBitRangesEq!0 arr!273 (_3!1379 lt!430628) #b0000000000000000000000000000000000000000000000000000000000000000 from!505) e!211692)))

(declare-fun b!295929 () Bool)

(assert (=> b!295929 (= e!211690 call!5133)))

(assert (= (and d!99760 (not res!244318)) b!295927))

(assert (= (and b!295927 (not res!244320)) b!295933))

(assert (= (and b!295927 res!244322) b!295931))

(assert (= (and b!295931 c!13504) b!295932))

(assert (= (and b!295931 (not c!13504)) b!295928))

(assert (= (and b!295928 res!244319) b!295930))

(assert (= (and b!295930 (not res!244321)) b!295929))

(assert (= (or b!295932 b!295929) bm!5130))

(declare-fun m!433583 () Bool)

(assert (=> b!295927 m!433583))

(declare-fun m!433585 () Bool)

(assert (=> bm!5130 m!433585))

(declare-fun m!433587 () Bool)

(assert (=> bm!5130 m!433587))

(declare-fun m!433589 () Bool)

(assert (=> bm!5130 m!433589))

(declare-fun m!433591 () Bool)

(assert (=> bm!5130 m!433591))

(declare-fun m!433593 () Bool)

(assert (=> bm!5130 m!433593))

(assert (=> b!295928 m!433593))

(assert (=> b!295928 m!433589))

(assert (=> b!295928 m!433593))

(assert (=> b!295928 m!433589))

(declare-fun m!433595 () Bool)

(assert (=> b!295928 m!433595))

(declare-fun m!433597 () Bool)

(assert (=> b!295933 m!433597))

(assert (=> b!295827 d!99760))

(declare-fun d!99770 () Bool)

(declare-fun e!211695 () Bool)

(assert (=> d!99770 e!211695))

(declare-fun res!244325 () Bool)

(assert (=> d!99770 (=> (not res!244325) (not e!211695))))

(assert (=> d!99770 (= res!244325 (or (= (bvand (bvsub nBits!523 from!505) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!523 from!505) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!430770 () Unit!20621)

(declare-fun choose!27 (BitStream!13352 BitStream!13352 (_ BitVec 64) (_ BitVec 64)) Unit!20621)

(assert (=> d!99770 (= lt!430770 (choose!27 thiss!1728 (_2!13014 lt!430619) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!99770 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!523 from!505)))))

(assert (=> d!99770 (= (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!13014 lt!430619) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001) lt!430770)))

(declare-fun b!295936 () Bool)

(assert (=> b!295936 (= e!211695 (validate_offset_bits!1 ((_ sign_extend 32) (size!7674 (buf!7737 (_2!13014 lt!430619)))) ((_ sign_extend 32) (currentByte!14252 (_2!13014 lt!430619))) ((_ sign_extend 32) (currentBit!14247 (_2!13014 lt!430619))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!99770 res!244325) b!295936))

(declare-fun m!433599 () Bool)

(assert (=> d!99770 m!433599))

(assert (=> b!295936 m!433451))

(assert (=> b!295827 d!99770))

(declare-fun d!99772 () Bool)

(assert (=> d!99772 (= (bitAt!0 lt!430626 from!505) (bitAt!0 (_3!1379 lt!430628) from!505))))

(declare-fun lt!430773 () Unit!20621)

(declare-fun choose!31 (array!17709 array!17709 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20621)

(assert (=> d!99772 (= lt!430773 (choose!31 lt!430626 (_3!1379 lt!430628) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!99772 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!99772 (= (arrayBitRangesEqImpliesEq!0 lt!430626 (_3!1379 lt!430628) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) lt!430773)))

(declare-fun bs!25509 () Bool)

(assert (= bs!25509 d!99772))

(assert (=> bs!25509 m!433443))

(assert (=> bs!25509 m!433465))

(declare-fun m!433601 () Bool)

(assert (=> bs!25509 m!433601))

(assert (=> b!295827 d!99772))

(declare-fun d!99774 () Bool)

(assert (=> d!99774 (= (bitAt!0 lt!430626 from!505) (not (= (bvand ((_ sign_extend 24) (select (arr!8727 lt!430626) ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!25510 () Bool)

(assert (= bs!25510 d!99774))

(declare-fun m!433603 () Bool)

(assert (=> bs!25510 m!433603))

(declare-fun m!433605 () Bool)

(assert (=> bs!25510 m!433605))

(assert (=> b!295827 d!99774))

(declare-fun d!99776 () Bool)

(assert (=> d!99776 (arrayBitRangesEq!0 arr!273 (_3!1379 lt!430628) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!430776 () Unit!20621)

(declare-fun choose!49 (array!17709 array!17709 array!17709 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20621)

(assert (=> d!99776 (= lt!430776 (choose!49 arr!273 lt!430626 (_3!1379 lt!430628) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!99776 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!99776 (= (arrayBitRangesEqTransitive!0 arr!273 lt!430626 (_3!1379 lt!430628) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) lt!430776)))

(declare-fun bs!25511 () Bool)

(assert (= bs!25511 d!99776))

(assert (=> bs!25511 m!433459))

(declare-fun m!433607 () Bool)

(assert (=> bs!25511 m!433607))

(assert (=> b!295827 d!99776))

(declare-fun d!99778 () Bool)

(assert (=> d!99778 (= (bitAt!0 (_3!1379 lt!430628) from!505) (not (= (bvand ((_ sign_extend 24) (select (arr!8727 (_3!1379 lt!430628)) ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!25512 () Bool)

(assert (= bs!25512 d!99778))

(declare-fun m!433609 () Bool)

(assert (=> bs!25512 m!433609))

(assert (=> bs!25512 m!433605))

(assert (=> b!295827 d!99778))

(declare-fun d!99780 () Bool)

(declare-fun e!211698 () Bool)

(assert (=> d!99780 e!211698))

(declare-fun res!244331 () Bool)

(assert (=> d!99780 (=> (not res!244331) (not e!211698))))

(declare-fun lt!430794 () (_ BitVec 64))

(declare-fun lt!430792 () (_ BitVec 64))

(declare-fun lt!430790 () (_ BitVec 64))

(assert (=> d!99780 (= res!244331 (= lt!430792 (bvsub lt!430794 lt!430790)))))

(assert (=> d!99780 (or (= (bvand lt!430794 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!430790 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!430794 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!430794 lt!430790) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!99780 (= lt!430790 (remainingBits!0 ((_ sign_extend 32) (size!7674 (buf!7737 thiss!1728))) ((_ sign_extend 32) (currentByte!14252 thiss!1728)) ((_ sign_extend 32) (currentBit!14247 thiss!1728))))))

(declare-fun lt!430791 () (_ BitVec 64))

(declare-fun lt!430789 () (_ BitVec 64))

(assert (=> d!99780 (= lt!430794 (bvmul lt!430791 lt!430789))))

(assert (=> d!99780 (or (= lt!430791 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!430789 (bvsdiv (bvmul lt!430791 lt!430789) lt!430791)))))

(assert (=> d!99780 (= lt!430789 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!99780 (= lt!430791 ((_ sign_extend 32) (size!7674 (buf!7737 thiss!1728))))))

(assert (=> d!99780 (= lt!430792 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14252 thiss!1728)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14247 thiss!1728))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!99780 (invariant!0 (currentBit!14247 thiss!1728) (currentByte!14252 thiss!1728) (size!7674 (buf!7737 thiss!1728)))))

(assert (=> d!99780 (= (bitIndex!0 (size!7674 (buf!7737 thiss!1728)) (currentByte!14252 thiss!1728) (currentBit!14247 thiss!1728)) lt!430792)))

(declare-fun b!295941 () Bool)

(declare-fun res!244330 () Bool)

(assert (=> b!295941 (=> (not res!244330) (not e!211698))))

(assert (=> b!295941 (= res!244330 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!430792))))

(declare-fun b!295942 () Bool)

(declare-fun lt!430793 () (_ BitVec 64))

(assert (=> b!295942 (= e!211698 (bvsle lt!430792 (bvmul lt!430793 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!295942 (or (= lt!430793 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!430793 #b0000000000000000000000000000000000000000000000000000000000001000) lt!430793)))))

(assert (=> b!295942 (= lt!430793 ((_ sign_extend 32) (size!7674 (buf!7737 thiss!1728))))))

(assert (= (and d!99780 res!244331) b!295941))

(assert (= (and b!295941 res!244330) b!295942))

(declare-fun m!433611 () Bool)

(assert (=> d!99780 m!433611))

(declare-fun m!433613 () Bool)

(assert (=> d!99780 m!433613))

(assert (=> b!295827 d!99780))

(declare-fun d!99782 () Bool)

(assert (=> d!99782 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7674 (buf!7737 (_2!13014 lt!430619)))) ((_ sign_extend 32) (currentByte!14252 (_2!13014 lt!430619))) ((_ sign_extend 32) (currentBit!14247 (_2!13014 lt!430619))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7674 (buf!7737 (_2!13014 lt!430619)))) ((_ sign_extend 32) (currentByte!14252 (_2!13014 lt!430619))) ((_ sign_extend 32) (currentBit!14247 (_2!13014 lt!430619)))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!25513 () Bool)

(assert (= bs!25513 d!99782))

(declare-fun m!433615 () Bool)

(assert (=> bs!25513 m!433615))

(assert (=> b!295827 d!99782))

(declare-fun d!99784 () Bool)

(declare-fun e!211699 () Bool)

(assert (=> d!99784 e!211699))

(declare-fun res!244333 () Bool)

(assert (=> d!99784 (=> (not res!244333) (not e!211699))))

(declare-fun lt!430798 () (_ BitVec 64))

(declare-fun lt!430796 () (_ BitVec 64))

(declare-fun lt!430800 () (_ BitVec 64))

(assert (=> d!99784 (= res!244333 (= lt!430798 (bvsub lt!430800 lt!430796)))))

(assert (=> d!99784 (or (= (bvand lt!430800 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!430796 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!430800 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!430800 lt!430796) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!99784 (= lt!430796 (remainingBits!0 ((_ sign_extend 32) (size!7674 (buf!7737 (_2!13015 lt!430628)))) ((_ sign_extend 32) (currentByte!14252 (_2!13015 lt!430628))) ((_ sign_extend 32) (currentBit!14247 (_2!13015 lt!430628)))))))

(declare-fun lt!430797 () (_ BitVec 64))

(declare-fun lt!430795 () (_ BitVec 64))

(assert (=> d!99784 (= lt!430800 (bvmul lt!430797 lt!430795))))

(assert (=> d!99784 (or (= lt!430797 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!430795 (bvsdiv (bvmul lt!430797 lt!430795) lt!430797)))))

(assert (=> d!99784 (= lt!430795 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!99784 (= lt!430797 ((_ sign_extend 32) (size!7674 (buf!7737 (_2!13015 lt!430628)))))))

(assert (=> d!99784 (= lt!430798 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14252 (_2!13015 lt!430628))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14247 (_2!13015 lt!430628)))))))

(assert (=> d!99784 (invariant!0 (currentBit!14247 (_2!13015 lt!430628)) (currentByte!14252 (_2!13015 lt!430628)) (size!7674 (buf!7737 (_2!13015 lt!430628))))))

(assert (=> d!99784 (= (bitIndex!0 (size!7674 (buf!7737 (_2!13015 lt!430628))) (currentByte!14252 (_2!13015 lt!430628)) (currentBit!14247 (_2!13015 lt!430628))) lt!430798)))

(declare-fun b!295943 () Bool)

(declare-fun res!244332 () Bool)

(assert (=> b!295943 (=> (not res!244332) (not e!211699))))

(assert (=> b!295943 (= res!244332 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!430798))))

(declare-fun b!295944 () Bool)

(declare-fun lt!430799 () (_ BitVec 64))

(assert (=> b!295944 (= e!211699 (bvsle lt!430798 (bvmul lt!430799 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!295944 (or (= lt!430799 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!430799 #b0000000000000000000000000000000000000000000000000000000000001000) lt!430799)))))

(assert (=> b!295944 (= lt!430799 ((_ sign_extend 32) (size!7674 (buf!7737 (_2!13015 lt!430628)))))))

(assert (= (and d!99784 res!244333) b!295943))

(assert (= (and b!295943 res!244332) b!295944))

(declare-fun m!433617 () Bool)

(assert (=> d!99784 m!433617))

(declare-fun m!433619 () Bool)

(assert (=> d!99784 m!433619))

(assert (=> b!295827 d!99784))

(declare-fun b!295945 () Bool)

(declare-fun e!211705 () Bool)

(declare-fun e!211702 () Bool)

(assert (=> b!295945 (= e!211705 e!211702)))

(declare-fun res!244338 () Bool)

(assert (=> b!295945 (=> (not res!244338) (not e!211702))))

(declare-fun e!211700 () Bool)

(assert (=> b!295945 (= res!244338 e!211700)))

(declare-fun res!244336 () Bool)

(assert (=> b!295945 (=> res!244336 e!211700)))

(declare-fun lt!430802 () tuple4!898)

(assert (=> b!295945 (= res!244336 (bvsge (_1!13022 lt!430802) (_2!13022 lt!430802)))))

(declare-fun lt!430801 () (_ BitVec 32))

(assert (=> b!295945 (= lt!430801 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!430803 () (_ BitVec 32))

(assert (=> b!295945 (= lt!430803 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!295945 (= lt!430802 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(declare-fun call!5134 () Bool)

(declare-fun bm!5131 () Bool)

(declare-fun c!13505 () Bool)

(assert (=> bm!5131 (= call!5134 (byteRangesEq!0 (ite c!13505 (select (arr!8727 arr!273) (_3!1382 lt!430802)) (select (arr!8727 arr!273) (_4!449 lt!430802))) (ite c!13505 (select (arr!8727 lt!430626) (_3!1382 lt!430802)) (select (arr!8727 lt!430626) (_4!449 lt!430802))) (ite c!13505 lt!430803 #b00000000000000000000000000000000) lt!430801))))

(declare-fun b!295946 () Bool)

(declare-fun e!211704 () Bool)

(declare-fun e!211701 () Bool)

(assert (=> b!295946 (= e!211704 e!211701)))

(declare-fun res!244335 () Bool)

(assert (=> b!295946 (= res!244335 (byteRangesEq!0 (select (arr!8727 arr!273) (_3!1382 lt!430802)) (select (arr!8727 lt!430626) (_3!1382 lt!430802)) lt!430803 #b00000000000000000000000000001000))))

(assert (=> b!295946 (=> (not res!244335) (not e!211701))))

(declare-fun b!295948 () Bool)

(declare-fun res!244337 () Bool)

(assert (=> b!295948 (= res!244337 (= lt!430801 #b00000000000000000000000000000000))))

(declare-fun e!211703 () Bool)

(assert (=> b!295948 (=> res!244337 e!211703)))

(assert (=> b!295948 (= e!211701 e!211703)))

(declare-fun b!295949 () Bool)

(assert (=> b!295949 (= e!211702 e!211704)))

(assert (=> b!295949 (= c!13505 (= (_3!1382 lt!430802) (_4!449 lt!430802)))))

(declare-fun b!295950 () Bool)

(assert (=> b!295950 (= e!211704 call!5134)))

(declare-fun b!295951 () Bool)

(assert (=> b!295951 (= e!211700 (arrayRangesEq!1507 arr!273 lt!430626 (_1!13022 lt!430802) (_2!13022 lt!430802)))))

(declare-fun d!99786 () Bool)

(declare-fun res!244334 () Bool)

(assert (=> d!99786 (=> res!244334 e!211705)))

(assert (=> d!99786 (= res!244334 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!99786 (= (arrayBitRangesEq!0 arr!273 lt!430626 #b0000000000000000000000000000000000000000000000000000000000000000 from!505) e!211705)))

(declare-fun b!295947 () Bool)

(assert (=> b!295947 (= e!211703 call!5134)))

(assert (= (and d!99786 (not res!244334)) b!295945))

(assert (= (and b!295945 (not res!244336)) b!295951))

(assert (= (and b!295945 res!244338) b!295949))

(assert (= (and b!295949 c!13505) b!295950))

(assert (= (and b!295949 (not c!13505)) b!295946))

(assert (= (and b!295946 res!244335) b!295948))

(assert (= (and b!295948 (not res!244337)) b!295947))

(assert (= (or b!295950 b!295947) bm!5131))

(assert (=> b!295945 m!433583))

(declare-fun m!433621 () Bool)

(assert (=> bm!5131 m!433621))

(declare-fun m!433623 () Bool)

(assert (=> bm!5131 m!433623))

(declare-fun m!433625 () Bool)

(assert (=> bm!5131 m!433625))

(declare-fun m!433627 () Bool)

(assert (=> bm!5131 m!433627))

(declare-fun m!433629 () Bool)

(assert (=> bm!5131 m!433629))

(assert (=> b!295946 m!433629))

(assert (=> b!295946 m!433625))

(assert (=> b!295946 m!433629))

(assert (=> b!295946 m!433625))

(declare-fun m!433631 () Bool)

(assert (=> b!295946 m!433631))

(declare-fun m!433633 () Bool)

(assert (=> b!295951 m!433633))

(assert (=> b!295827 d!99786))

(declare-fun d!99788 () Bool)

(declare-fun e!211712 () Bool)

(assert (=> d!99788 e!211712))

(declare-fun res!244341 () Bool)

(assert (=> d!99788 (=> (not res!244341) (not e!211712))))

(declare-datatypes ((tuple2!23280 0))(
  ( (tuple2!23281 (_1!13023 Unit!20621) (_2!13023 BitStream!13352)) )
))
(declare-fun increaseBitIndex!0 (BitStream!13352) tuple2!23280)

(assert (=> d!99788 (= res!244341 (= (buf!7737 (_2!13023 (increaseBitIndex!0 thiss!1728))) (buf!7737 thiss!1728)))))

(declare-fun lt!430819 () Bool)

(assert (=> d!99788 (= lt!430819 (not (= (bvand ((_ sign_extend 24) (select (arr!8727 (buf!7737 thiss!1728)) (currentByte!14252 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14247 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!430818 () tuple2!23270)

(assert (=> d!99788 (= lt!430818 (tuple2!23271 (not (= (bvand ((_ sign_extend 24) (select (arr!8727 (buf!7737 thiss!1728)) (currentByte!14252 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14247 thiss!1728)))) #b00000000000000000000000000000000)) (_2!13023 (increaseBitIndex!0 thiss!1728))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!99788 (validate_offset_bit!0 ((_ sign_extend 32) (size!7674 (buf!7737 thiss!1728))) ((_ sign_extend 32) (currentByte!14252 thiss!1728)) ((_ sign_extend 32) (currentBit!14247 thiss!1728)))))

(assert (=> d!99788 (= (readBit!0 thiss!1728) lt!430818)))

(declare-fun lt!430820 () (_ BitVec 64))

(declare-fun b!295954 () Bool)

(declare-fun lt!430821 () (_ BitVec 64))

(assert (=> b!295954 (= e!211712 (= (bitIndex!0 (size!7674 (buf!7737 (_2!13023 (increaseBitIndex!0 thiss!1728)))) (currentByte!14252 (_2!13023 (increaseBitIndex!0 thiss!1728))) (currentBit!14247 (_2!13023 (increaseBitIndex!0 thiss!1728)))) (bvadd lt!430820 lt!430821)))))

(assert (=> b!295954 (or (not (= (bvand lt!430820 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!430821 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!430820 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!430820 lt!430821) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!295954 (= lt!430821 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!295954 (= lt!430820 (bitIndex!0 (size!7674 (buf!7737 thiss!1728)) (currentByte!14252 thiss!1728) (currentBit!14247 thiss!1728)))))

(declare-fun lt!430823 () Bool)

(assert (=> b!295954 (= lt!430823 (not (= (bvand ((_ sign_extend 24) (select (arr!8727 (buf!7737 thiss!1728)) (currentByte!14252 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14247 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!430822 () Bool)

(assert (=> b!295954 (= lt!430822 (not (= (bvand ((_ sign_extend 24) (select (arr!8727 (buf!7737 thiss!1728)) (currentByte!14252 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14247 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!430824 () Bool)

(assert (=> b!295954 (= lt!430824 (not (= (bvand ((_ sign_extend 24) (select (arr!8727 (buf!7737 thiss!1728)) (currentByte!14252 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14247 thiss!1728)))) #b00000000000000000000000000000000)))))

(assert (= (and d!99788 res!244341) b!295954))

(declare-fun m!433635 () Bool)

(assert (=> d!99788 m!433635))

(declare-fun m!433637 () Bool)

(assert (=> d!99788 m!433637))

(declare-fun m!433639 () Bool)

(assert (=> d!99788 m!433639))

(declare-fun m!433641 () Bool)

(assert (=> d!99788 m!433641))

(declare-fun m!433643 () Bool)

(assert (=> b!295954 m!433643))

(assert (=> b!295954 m!433635))

(assert (=> b!295954 m!433447))

(assert (=> b!295954 m!433637))

(assert (=> b!295954 m!433639))

(assert (=> b!295827 d!99788))

(declare-fun d!99790 () Bool)

(declare-fun e!211715 () Bool)

(assert (=> d!99790 e!211715))

(declare-fun res!244344 () Bool)

(assert (=> d!99790 (=> (not res!244344) (not e!211715))))

(declare-fun lt!430836 () (_ BitVec 32))

(assert (=> d!99790 (= res!244344 (and (bvsge lt!430836 #b00000000000000000000000000000000) (bvslt lt!430836 (size!7674 arr!273))))))

(declare-fun lt!430835 () (_ BitVec 8))

(declare-fun lt!430834 () Unit!20621)

(declare-fun lt!430833 () (_ BitVec 32))

(declare-fun choose!53 (array!17709 (_ BitVec 64) Bool (_ BitVec 32) (_ BitVec 32) (_ BitVec 8)) Unit!20621)

(assert (=> d!99790 (= lt!430834 (choose!53 arr!273 from!505 (_1!13014 lt!430619) lt!430836 lt!430833 lt!430835))))

(assert (=> d!99790 (= lt!430835 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8727 arr!273) lt!430836)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!430833)))) ((_ sign_extend 24) (ite (_1!13014 lt!430619) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!430833) #b00000000)))))))

(assert (=> d!99790 (= lt!430833 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> d!99790 (= lt!430836 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> d!99790 (= (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!13014 lt!430619)) lt!430834)))

(declare-fun b!295958 () Bool)

(assert (=> b!295958 (= e!211715 (arrayBitRangesEq!0 arr!273 (array!17710 (store (arr!8727 arr!273) lt!430836 lt!430835) (size!7674 arr!273)) #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (= (and d!99790 res!244344) b!295958))

(declare-fun m!433645 () Bool)

(assert (=> d!99790 m!433645))

(declare-fun m!433647 () Bool)

(assert (=> d!99790 m!433647))

(declare-fun m!433649 () Bool)

(assert (=> d!99790 m!433649))

(declare-fun m!433651 () Bool)

(assert (=> b!295958 m!433651))

(declare-fun m!433653 () Bool)

(assert (=> b!295958 m!433653))

(assert (=> b!295827 d!99790))

(declare-fun lt!431180 () array!17709)

(declare-fun call!5152 () Bool)

(declare-fun lt!431152 () (_ BitVec 64))

(declare-fun bm!5149 () Bool)

(declare-fun lt!431170 () (_ BitVec 64))

(declare-fun lt!431174 () tuple3!1864)

(declare-fun c!13515 () Bool)

(declare-fun lt!431172 () array!17709)

(declare-fun lt!431166 () (_ BitVec 64))

(assert (=> bm!5149 (= call!5152 (arrayBitRangesEq!0 (ite c!13515 lt!430626 lt!431172) (ite c!13515 (_3!1379 lt!431174) lt!431180) (ite c!13515 lt!431170 lt!431152) (ite c!13515 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) lt!431166)))))

(declare-fun lt!431182 () Unit!20621)

(declare-fun e!211762 () tuple3!1864)

(declare-fun b!296041 () Bool)

(assert (=> b!296041 (= e!211762 (tuple3!1865 lt!431182 (_2!13014 lt!430619) lt!430626))))

(declare-fun lt!431179 () Unit!20621)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17709) Unit!20621)

(assert (=> b!296041 (= lt!431179 (arrayBitRangesEqReflexiveLemma!0 lt!430626))))

(declare-fun call!5153 () Bool)

(assert (=> b!296041 call!5153))

(declare-fun lt!431156 () Unit!20621)

(assert (=> b!296041 (= lt!431156 lt!431179)))

(assert (=> b!296041 (= lt!431172 lt!430626)))

(assert (=> b!296041 (= lt!431180 lt!430626)))

(declare-fun lt!431158 () (_ BitVec 64))

(assert (=> b!296041 (= lt!431158 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!431164 () (_ BitVec 64))

(assert (=> b!296041 (= lt!431164 ((_ sign_extend 32) (size!7674 lt!430626)))))

(declare-fun lt!431160 () (_ BitVec 64))

(assert (=> b!296041 (= lt!431160 (bvmul lt!431164 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!296041 (= lt!431152 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!296041 (= lt!431166 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))))

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17709 array!17709 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20621)

(assert (=> b!296041 (= lt!431182 (arrayBitRangesEqSlicedLemma!0 lt!431172 lt!431180 lt!431158 lt!431160 lt!431152 lt!431166))))

(assert (=> b!296041 call!5152))

(declare-fun b!296042 () Bool)

(declare-fun res!244411 () Bool)

(declare-fun e!211764 () Bool)

(assert (=> b!296042 (=> (not res!244411) (not e!211764))))

(declare-fun lt!431162 () tuple3!1864)

(assert (=> b!296042 (= res!244411 (invariant!0 (currentBit!14247 (_2!13015 lt!431162)) (currentByte!14252 (_2!13015 lt!431162)) (size!7674 (buf!7737 (_2!13015 lt!431162)))))))

(declare-fun b!296043 () Bool)

(declare-fun e!211763 () Bool)

(declare-datatypes ((tuple2!23282 0))(
  ( (tuple2!23283 (_1!13024 BitStream!13352) (_2!13024 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!13352) tuple2!23282)

(assert (=> b!296043 (= e!211763 (= (bitAt!0 (_3!1379 lt!431162) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (_2!13024 (readBitPure!0 (_2!13014 lt!430619)))))))

(declare-fun b!296044 () Bool)

(declare-fun res!244415 () Bool)

(assert (=> b!296044 (=> (not res!244415) (not e!211764))))

(assert (=> b!296044 (= res!244415 e!211763)))

(declare-fun res!244414 () Bool)

(assert (=> b!296044 (=> res!244414 e!211763)))

(assert (=> b!296044 (= res!244414 (not (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474)))))

(declare-fun e!211761 () Bool)

(declare-fun b!296045 () Bool)

(assert (=> b!296045 (= e!211761 (and (= (buf!7737 (_2!13014 lt!430619)) (buf!7737 (_2!13015 lt!431174))) (= (size!7674 lt!430626) (size!7674 (_3!1379 lt!431174)))))))

(declare-fun b!296046 () Bool)

(declare-fun lt!431183 () Unit!20621)

(assert (=> b!296046 (= e!211762 (tuple3!1865 lt!431183 (_2!13015 lt!431174) (_3!1379 lt!431174)))))

(declare-fun lt!431177 () tuple2!23270)

(assert (=> b!296046 (= lt!431177 (readBit!0 (_2!13014 lt!430619)))))

(declare-fun lt!431171 () (_ BitVec 32))

(assert (=> b!296046 (= lt!431171 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!431178 () (_ BitVec 32))

(assert (=> b!296046 (= lt!431178 ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!431175 () array!17709)

(assert (=> b!296046 (= lt!431175 (array!17710 (store (arr!8727 lt!430626) lt!431171 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8727 lt!430626) lt!431171)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!431178)))) ((_ sign_extend 24) (ite (_1!13014 lt!431177) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!431178) #b00000000))))) (size!7674 lt!430626)))))

(declare-fun lt!431184 () (_ BitVec 64))

(assert (=> b!296046 (= lt!431184 (bvsub nBits!523 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun lt!431169 () (_ BitVec 64))

(assert (=> b!296046 (= lt!431169 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!431154 () Unit!20621)

(assert (=> b!296046 (= lt!431154 (validateOffsetBitsIneqLemma!0 (_2!13014 lt!430619) (_2!13014 lt!431177) lt!431184 lt!431169))))

(assert (=> b!296046 (validate_offset_bits!1 ((_ sign_extend 32) (size!7674 (buf!7737 (_2!13014 lt!431177)))) ((_ sign_extend 32) (currentByte!14252 (_2!13014 lt!431177))) ((_ sign_extend 32) (currentBit!14247 (_2!13014 lt!431177))) (bvsub lt!431184 lt!431169))))

(declare-fun lt!431155 () Unit!20621)

(assert (=> b!296046 (= lt!431155 lt!431154)))

(assert (=> b!296046 (= lt!431174 (readBitsLoop!0 (_2!13014 lt!431177) nBits!523 lt!431175 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001) to!474))))

(declare-fun res!244413 () Bool)

(assert (=> b!296046 (= res!244413 (= (bvsub (bvadd (bitIndex!0 (size!7674 (buf!7737 (_2!13014 lt!430619))) (currentByte!14252 (_2!13014 lt!430619)) (currentBit!14247 (_2!13014 lt!430619))) to!474) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitIndex!0 (size!7674 (buf!7737 (_2!13015 lt!431174))) (currentByte!14252 (_2!13015 lt!431174)) (currentBit!14247 (_2!13015 lt!431174)))))))

(assert (=> b!296046 (=> (not res!244413) (not e!211761))))

(assert (=> b!296046 e!211761))

(declare-fun lt!431159 () Unit!20621)

(declare-fun Unit!20631 () Unit!20621)

(assert (=> b!296046 (= lt!431159 Unit!20631)))

(declare-fun lt!431185 () (_ BitVec 32))

(assert (=> b!296046 (= lt!431185 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!431187 () (_ BitVec 32))

(assert (=> b!296046 (= lt!431187 ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!431163 () Unit!20621)

(assert (=> b!296046 (= lt!431163 (arrayBitRangesUpdatedAtLemma!0 lt!430626 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (_1!13014 lt!431177)))))

(assert (=> b!296046 call!5153))

(declare-fun lt!431181 () Unit!20621)

(assert (=> b!296046 (= lt!431181 lt!431163)))

(assert (=> b!296046 (= lt!431170 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!431167 () Unit!20621)

(assert (=> b!296046 (= lt!431167 (arrayBitRangesEqTransitive!0 lt!430626 lt!431175 (_3!1379 lt!431174) lt!431170 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!296046 call!5152))

(declare-fun lt!431161 () Unit!20621)

(assert (=> b!296046 (= lt!431161 lt!431167)))

(assert (=> b!296046 (arrayBitRangesEq!0 lt!430626 (_3!1379 lt!431174) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))))

(declare-fun lt!431168 () Unit!20621)

(declare-fun Unit!20632 () Unit!20621)

(assert (=> b!296046 (= lt!431168 Unit!20632)))

(declare-fun lt!431153 () Unit!20621)

(assert (=> b!296046 (= lt!431153 (arrayBitRangesEqImpliesEq!0 lt!431175 (_3!1379 lt!431174) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!296046 (= (bitAt!0 lt!431175 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitAt!0 (_3!1379 lt!431174) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun lt!431157 () Unit!20621)

(assert (=> b!296046 (= lt!431157 lt!431153)))

(declare-fun lt!431165 () Unit!20621)

(declare-fun Unit!20633 () Unit!20621)

(assert (=> b!296046 (= lt!431165 Unit!20633)))

(declare-fun lt!431176 () Bool)

(assert (=> b!296046 (= lt!431176 (= (bitAt!0 (_3!1379 lt!431174) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (_1!13014 lt!431177)))))

(declare-fun Unit!20634 () Unit!20621)

(assert (=> b!296046 (= lt!431183 Unit!20634)))

(assert (=> b!296046 lt!431176))

(declare-fun d!99792 () Bool)

(assert (=> d!99792 e!211764))

(declare-fun res!244409 () Bool)

(assert (=> d!99792 (=> (not res!244409) (not e!211764))))

(declare-fun lt!431186 () (_ BitVec 64))

(assert (=> d!99792 (= res!244409 (= (bvsub lt!431186 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitIndex!0 (size!7674 (buf!7737 (_2!13015 lt!431162))) (currentByte!14252 (_2!13015 lt!431162)) (currentBit!14247 (_2!13015 lt!431162)))))))

(assert (=> d!99792 (or (= (bvand lt!431186 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!431186 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!431186 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!431173 () (_ BitVec 64))

(assert (=> d!99792 (= lt!431186 (bvadd lt!431173 to!474))))

(assert (=> d!99792 (or (not (= (bvand lt!431173 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!431173 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!431173 to!474) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!99792 (= lt!431173 (bitIndex!0 (size!7674 (buf!7737 (_2!13014 lt!430619))) (currentByte!14252 (_2!13014 lt!430619)) (currentBit!14247 (_2!13014 lt!430619))))))

(assert (=> d!99792 (= lt!431162 e!211762)))

(assert (=> d!99792 (= c!13515 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> d!99792 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!99792 (= (readBitsLoop!0 (_2!13014 lt!430619) nBits!523 lt!430626 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474) lt!431162)))

(declare-fun b!296047 () Bool)

(declare-fun res!244412 () Bool)

(assert (=> b!296047 (=> (not res!244412) (not e!211764))))

(assert (=> b!296047 (= res!244412 (and (= (buf!7737 (_2!13014 lt!430619)) (buf!7737 (_2!13015 lt!431162))) (= (size!7674 lt!430626) (size!7674 (_3!1379 lt!431162)))))))

(declare-fun b!296048 () Bool)

(declare-fun res!244410 () Bool)

(assert (=> b!296048 (=> (not res!244410) (not e!211764))))

(assert (=> b!296048 (= res!244410 (arrayBitRangesEq!0 lt!430626 (_3!1379 lt!431162) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun b!296049 () Bool)

(declare-datatypes ((List!989 0))(
  ( (Nil!986) (Cons!985 (h!1104 Bool) (t!1874 List!989)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!13352 array!17709 (_ BitVec 64) (_ BitVec 64)) List!989)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!13352 BitStream!13352 (_ BitVec 64)) List!989)

(assert (=> b!296049 (= e!211764 (= (byteArrayBitContentToList!0 (_2!13015 lt!431162) (_3!1379 lt!431162) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))) (bitStreamReadBitsIntoList!0 (_2!13015 lt!431162) (_2!13014 lt!430619) (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))))

(assert (=> b!296049 (or (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!296049 (or (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!5150 () Bool)

(assert (=> bm!5150 (= call!5153 (arrayBitRangesEq!0 lt!430626 (ite c!13515 (array!17710 (store (arr!8727 lt!430626) lt!431185 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8727 lt!430626) lt!431185)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!431187)))) ((_ sign_extend 24) (ite (_1!13014 lt!431177) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!431187) #b00000000))))) (size!7674 lt!430626)) lt!430626) #b0000000000000000000000000000000000000000000000000000000000000000 (ite c!13515 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvmul ((_ sign_extend 32) (size!7674 lt!430626)) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (= (and d!99792 c!13515) b!296046))

(assert (= (and d!99792 (not c!13515)) b!296041))

(assert (= (and b!296046 res!244413) b!296045))

(assert (= (or b!296046 b!296041) bm!5149))

(assert (= (or b!296046 b!296041) bm!5150))

(assert (= (and d!99792 res!244409) b!296047))

(assert (= (and b!296047 res!244412) b!296048))

(assert (= (and b!296048 res!244410) b!296044))

(assert (= (and b!296044 (not res!244414)) b!296043))

(assert (= (and b!296044 res!244415) b!296042))

(assert (= (and b!296042 res!244411) b!296049))

(declare-fun m!433803 () Bool)

(assert (=> b!296048 m!433803))

(declare-fun m!433805 () Bool)

(assert (=> bm!5150 m!433805))

(declare-fun m!433807 () Bool)

(assert (=> bm!5150 m!433807))

(declare-fun m!433809 () Bool)

(assert (=> bm!5150 m!433809))

(declare-fun m!433811 () Bool)

(assert (=> bm!5150 m!433811))

(declare-fun m!433813 () Bool)

(assert (=> b!296043 m!433813))

(declare-fun m!433815 () Bool)

(assert (=> b!296043 m!433815))

(declare-fun m!433817 () Bool)

(assert (=> bm!5149 m!433817))

(declare-fun m!433819 () Bool)

(assert (=> b!296041 m!433819))

(declare-fun m!433821 () Bool)

(assert (=> b!296041 m!433821))

(declare-fun m!433823 () Bool)

(assert (=> b!296042 m!433823))

(declare-fun m!433825 () Bool)

(assert (=> b!296049 m!433825))

(declare-fun m!433827 () Bool)

(assert (=> b!296049 m!433827))

(declare-fun m!433829 () Bool)

(assert (=> d!99792 m!433829))

(declare-fun m!433831 () Bool)

(assert (=> d!99792 m!433831))

(declare-fun m!433833 () Bool)

(assert (=> b!296046 m!433833))

(assert (=> b!296046 m!433831))

(declare-fun m!433835 () Bool)

(assert (=> b!296046 m!433835))

(declare-fun m!433837 () Bool)

(assert (=> b!296046 m!433837))

(declare-fun m!433839 () Bool)

(assert (=> b!296046 m!433839))

(declare-fun m!433841 () Bool)

(assert (=> b!296046 m!433841))

(declare-fun m!433843 () Bool)

(assert (=> b!296046 m!433843))

(declare-fun m!433845 () Bool)

(assert (=> b!296046 m!433845))

(declare-fun m!433847 () Bool)

(assert (=> b!296046 m!433847))

(declare-fun m!433849 () Bool)

(assert (=> b!296046 m!433849))

(declare-fun m!433851 () Bool)

(assert (=> b!296046 m!433851))

(declare-fun m!433853 () Bool)

(assert (=> b!296046 m!433853))

(declare-fun m!433855 () Bool)

(assert (=> b!296046 m!433855))

(declare-fun m!433857 () Bool)

(assert (=> b!296046 m!433857))

(declare-fun m!433859 () Bool)

(assert (=> b!296046 m!433859))

(assert (=> b!295827 d!99792))

(declare-fun d!99812 () Bool)

(assert (=> d!99812 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7674 (buf!7737 thiss!1728))) ((_ sign_extend 32) (currentByte!14252 thiss!1728)) ((_ sign_extend 32) (currentBit!14247 thiss!1728)) (bvsub nBits!523 from!505)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7674 (buf!7737 thiss!1728))) ((_ sign_extend 32) (currentByte!14252 thiss!1728)) ((_ sign_extend 32) (currentBit!14247 thiss!1728))) (bvsub nBits!523 from!505)))))

(declare-fun bs!25519 () Bool)

(assert (= bs!25519 d!99812))

(assert (=> bs!25519 m!433611))

(assert (=> b!295826 d!99812))

(declare-fun d!99814 () Bool)

(assert (=> d!99814 (= (inv!12 thiss!1728) (invariant!0 (currentBit!14247 thiss!1728) (currentByte!14252 thiss!1728) (size!7674 (buf!7737 thiss!1728))))))

(declare-fun bs!25520 () Bool)

(assert (= bs!25520 d!99814))

(assert (=> bs!25520 m!433613))

(assert (=> start!65972 d!99814))

(declare-fun d!99816 () Bool)

(assert (=> d!99816 (= (array_inv!7286 arr!273) (bvsge (size!7674 arr!273) #b00000000000000000000000000000000))))

(assert (=> start!65972 d!99816))

(push 1)

(assert (not d!99772))

(assert (not b!295945))

(assert (not bm!5149))

(assert (not b!296048))

(assert (not b!296046))

(assert (not b!296049))

(assert (not d!99780))

(assert (not b!295951))

(assert (not b!296041))

(assert (not bm!5130))

(assert (not b!295958))

(assert (not d!99782))

(assert (not d!99770))

(assert (not b!295954))

(assert (not b!295933))

(assert (not b!296043))

(assert (not d!99790))

(assert (not b!295928))

(assert (not b!295927))

(assert (not bm!5150))

(assert (not d!99788))

(assert (not b!295946))

(assert (not b!295936))

(assert (not d!99784))

(assert (not bm!5131))

(assert (not d!99776))

(assert (not d!99814))

(assert (not b!296042))

(assert (not d!99812))

(assert (not d!99792))

(check-sat)

(pop 1)

(push 1)

(check-sat)

