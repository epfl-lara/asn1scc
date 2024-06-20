; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64836 () Bool)

(assert start!64836)

(declare-fun b!291031 () Bool)

(declare-fun e!207369 () Bool)

(declare-datatypes ((array!17275 0))(
  ( (array!17276 (arr!8492 (Array (_ BitVec 32) (_ BitVec 8))) (size!7478 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12966 0))(
  ( (BitStream!12967 (buf!7544 array!17275) (currentByte!13969 (_ BitVec 32)) (currentBit!13964 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12966)

(declare-fun array_inv!7090 (array!17275) Bool)

(assert (=> b!291031 (= e!207369 (array_inv!7090 (buf!7544 thiss!1728)))))

(declare-fun b!291032 () Bool)

(declare-fun res!240427 () Bool)

(declare-fun e!207371 () Bool)

(assert (=> b!291032 (=> (not res!240427) (not e!207371))))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!291032 (= res!240427 (bvslt from!505 to!474))))

(declare-fun b!291033 () Bool)

(declare-datatypes ((Unit!20221 0))(
  ( (Unit!20222) )
))
(declare-datatypes ((tuple3!1700 0))(
  ( (tuple3!1701 (_1!12696 Unit!20221) (_2!12696 BitStream!12966) (_3!1270 array!17275)) )
))
(declare-fun lt!422688 () tuple3!1700)

(declare-fun e!207368 () Bool)

(declare-fun arr!273 () array!17275)

(assert (=> b!291033 (= e!207368 (and (= (buf!7544 thiss!1728) (buf!7544 (_2!12696 lt!422688))) (= (size!7478 arr!273) (size!7478 (_3!1270 lt!422688)))))))

(declare-fun b!291034 () Bool)

(declare-fun res!240426 () Bool)

(assert (=> b!291034 (=> (not res!240426) (not e!207371))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!291034 (= res!240426 (validate_offset_bits!1 ((_ sign_extend 32) (size!7478 (buf!7544 thiss!1728))) ((_ sign_extend 32) (currentByte!13969 thiss!1728)) ((_ sign_extend 32) (currentBit!13964 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!291035 () Bool)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!291035 (= e!207371 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!7478 (buf!7544 thiss!1728))) ((_ sign_extend 32) (currentByte!13969 thiss!1728)) ((_ sign_extend 32) (currentBit!13964 thiss!1728)))))))

(declare-fun e!207367 () Bool)

(assert (=> b!291035 e!207367))

(declare-fun res!240424 () Bool)

(assert (=> b!291035 (=> (not res!240424) (not e!207367))))

(declare-fun lt!422697 () Bool)

(declare-fun lt!422690 () array!17275)

(declare-fun bitAt!0 (array!17275 (_ BitVec 64)) Bool)

(assert (=> b!291035 (= res!240424 (= (bitAt!0 lt!422690 from!505) lt!422697))))

(assert (=> b!291035 (= lt!422697 (bitAt!0 (_3!1270 lt!422688) from!505))))

(declare-fun lt!422695 () Unit!20221)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!17275 array!17275 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20221)

(assert (=> b!291035 (= lt!422695 (arrayBitRangesEqImpliesEq!0 lt!422690 (_3!1270 lt!422688) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun arrayBitRangesEq!0 (array!17275 array!17275 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!291035 (arrayBitRangesEq!0 arr!273 (_3!1270 lt!422688) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!422691 () Unit!20221)

(declare-fun arrayBitRangesEqTransitive!0 (array!17275 array!17275 array!17275 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20221)

(assert (=> b!291035 (= lt!422691 (arrayBitRangesEqTransitive!0 arr!273 lt!422690 (_3!1270 lt!422688) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!291035 (arrayBitRangesEq!0 arr!273 lt!422690 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!422689 () Unit!20221)

(declare-datatypes ((tuple2!22852 0))(
  ( (tuple2!22853 (_1!12697 Bool) (_2!12697 BitStream!12966)) )
))
(declare-fun lt!422694 () tuple2!22852)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17275 (_ BitVec 64) Bool) Unit!20221)

(assert (=> b!291035 (= lt!422689 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12697 lt!422694)))))

(assert (=> b!291035 e!207368))

(declare-fun res!240425 () Bool)

(assert (=> b!291035 (=> (not res!240425) (not e!207368))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!291035 (= res!240425 (= (bvsub (bvadd (bitIndex!0 (size!7478 (buf!7544 thiss!1728)) (currentByte!13969 thiss!1728) (currentBit!13964 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7478 (buf!7544 (_2!12696 lt!422688))) (currentByte!13969 (_2!12696 lt!422688)) (currentBit!13964 (_2!12696 lt!422688)))))))

(declare-fun readBitsLoop!0 (BitStream!12966 (_ BitVec 64) array!17275 (_ BitVec 64) (_ BitVec 64)) tuple3!1700)

(assert (=> b!291035 (= lt!422688 (readBitsLoop!0 (_2!12697 lt!422694) nBits!523 lt!422690 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!291035 (validate_offset_bits!1 ((_ sign_extend 32) (size!7478 (buf!7544 (_2!12697 lt!422694)))) ((_ sign_extend 32) (currentByte!13969 (_2!12697 lt!422694))) ((_ sign_extend 32) (currentBit!13964 (_2!12697 lt!422694))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!422693 () Unit!20221)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12966 BitStream!12966 (_ BitVec 64) (_ BitVec 64)) Unit!20221)

(assert (=> b!291035 (= lt!422693 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12697 lt!422694) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!422696 () (_ BitVec 32))

(declare-fun lt!422692 () (_ BitVec 32))

(assert (=> b!291035 (= lt!422690 (array!17276 (store (arr!8492 arr!273) lt!422692 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8492 arr!273) lt!422692)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!422696)))) ((_ sign_extend 24) (ite (_1!12697 lt!422694) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!422696) #b00000000))))) (size!7478 arr!273)))))

(assert (=> b!291035 (= lt!422696 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!291035 (= lt!422692 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!12966) tuple2!22852)

(assert (=> b!291035 (= lt!422694 (readBit!0 thiss!1728))))

(declare-fun res!240428 () Bool)

(assert (=> start!64836 (=> (not res!240428) (not e!207371))))

(assert (=> start!64836 (= res!240428 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7478 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64836 e!207371))

(declare-fun inv!12 (BitStream!12966) Bool)

(assert (=> start!64836 (and (inv!12 thiss!1728) e!207369)))

(assert (=> start!64836 true))

(assert (=> start!64836 (array_inv!7090 arr!273)))

(declare-fun b!291036 () Bool)

(assert (=> b!291036 (= e!207367 (= lt!422697 (_1!12697 lt!422694)))))

(assert (= (and start!64836 res!240428) b!291034))

(assert (= (and b!291034 res!240426) b!291032))

(assert (= (and b!291032 res!240427) b!291035))

(assert (= (and b!291035 res!240425) b!291033))

(assert (= (and b!291035 res!240424) b!291036))

(assert (= start!64836 b!291031))

(declare-fun m!425677 () Bool)

(assert (=> b!291031 m!425677))

(declare-fun m!425679 () Bool)

(assert (=> b!291034 m!425679))

(declare-fun m!425681 () Bool)

(assert (=> b!291035 m!425681))

(declare-fun m!425683 () Bool)

(assert (=> b!291035 m!425683))

(declare-fun m!425685 () Bool)

(assert (=> b!291035 m!425685))

(declare-fun m!425687 () Bool)

(assert (=> b!291035 m!425687))

(declare-fun m!425689 () Bool)

(assert (=> b!291035 m!425689))

(declare-fun m!425691 () Bool)

(assert (=> b!291035 m!425691))

(declare-fun m!425693 () Bool)

(assert (=> b!291035 m!425693))

(declare-fun m!425695 () Bool)

(assert (=> b!291035 m!425695))

(declare-fun m!425697 () Bool)

(assert (=> b!291035 m!425697))

(declare-fun m!425699 () Bool)

(assert (=> b!291035 m!425699))

(declare-fun m!425701 () Bool)

(assert (=> b!291035 m!425701))

(declare-fun m!425703 () Bool)

(assert (=> b!291035 m!425703))

(declare-fun m!425705 () Bool)

(assert (=> b!291035 m!425705))

(declare-fun m!425707 () Bool)

(assert (=> b!291035 m!425707))

(declare-fun m!425709 () Bool)

(assert (=> b!291035 m!425709))

(declare-fun m!425711 () Bool)

(assert (=> b!291035 m!425711))

(declare-fun m!425713 () Bool)

(assert (=> b!291035 m!425713))

(declare-fun m!425715 () Bool)

(assert (=> start!64836 m!425715))

(declare-fun m!425717 () Bool)

(assert (=> start!64836 m!425717))

(check-sat (not b!291031) (not b!291034) (not b!291035) (not start!64836))
(check-sat)
(get-model)

(declare-fun d!98572 () Bool)

(assert (=> d!98572 (= (array_inv!7090 (buf!7544 thiss!1728)) (bvsge (size!7478 (buf!7544 thiss!1728)) #b00000000000000000000000000000000))))

(assert (=> b!291031 d!98572))

(declare-fun d!98574 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!98574 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7478 (buf!7544 thiss!1728))) ((_ sign_extend 32) (currentByte!13969 thiss!1728)) ((_ sign_extend 32) (currentBit!13964 thiss!1728)) (bvsub nBits!523 from!505)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7478 (buf!7544 thiss!1728))) ((_ sign_extend 32) (currentByte!13969 thiss!1728)) ((_ sign_extend 32) (currentBit!13964 thiss!1728))) (bvsub nBits!523 from!505)))))

(declare-fun bs!25113 () Bool)

(assert (= bs!25113 d!98574))

(declare-fun m!425761 () Bool)

(assert (=> bs!25113 m!425761))

(assert (=> b!291034 d!98574))

(declare-fun d!98576 () Bool)

(assert (=> d!98576 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!7478 (buf!7544 thiss!1728))) ((_ sign_extend 32) (currentByte!13969 thiss!1728)) ((_ sign_extend 32) (currentBit!13964 thiss!1728))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7478 (buf!7544 thiss!1728))) ((_ sign_extend 32) (currentByte!13969 thiss!1728)) ((_ sign_extend 32) (currentBit!13964 thiss!1728))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!25114 () Bool)

(assert (= bs!25114 d!98576))

(assert (=> bs!25114 m!425761))

(assert (=> b!291035 d!98576))

(declare-fun d!98578 () Bool)

(declare-fun e!207393 () Bool)

(assert (=> d!98578 e!207393))

(declare-fun res!240446 () Bool)

(assert (=> d!98578 (=> (not res!240446) (not e!207393))))

(declare-fun lt!422739 () (_ BitVec 32))

(assert (=> d!98578 (= res!240446 (and (bvsge lt!422739 #b00000000000000000000000000000000) (bvslt lt!422739 (size!7478 arr!273))))))

(declare-fun lt!422737 () (_ BitVec 8))

(declare-fun lt!422738 () Unit!20221)

(declare-fun lt!422736 () (_ BitVec 32))

(declare-fun choose!53 (array!17275 (_ BitVec 64) Bool (_ BitVec 32) (_ BitVec 32) (_ BitVec 8)) Unit!20221)

(assert (=> d!98578 (= lt!422738 (choose!53 arr!273 from!505 (_1!12697 lt!422694) lt!422739 lt!422736 lt!422737))))

(assert (=> d!98578 (= lt!422737 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8492 arr!273) lt!422739)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!422736)))) ((_ sign_extend 24) (ite (_1!12697 lt!422694) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!422736) #b00000000)))))))

(assert (=> d!98578 (= lt!422736 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> d!98578 (= lt!422739 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> d!98578 (= (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12697 lt!422694)) lt!422738)))

(declare-fun b!291058 () Bool)

(assert (=> b!291058 (= e!207393 (arrayBitRangesEq!0 arr!273 (array!17276 (store (arr!8492 arr!273) lt!422739 lt!422737) (size!7478 arr!273)) #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (= (and d!98578 res!240446) b!291058))

(declare-fun m!425763 () Bool)

(assert (=> d!98578 m!425763))

(declare-fun m!425765 () Bool)

(assert (=> d!98578 m!425765))

(declare-fun m!425767 () Bool)

(assert (=> d!98578 m!425767))

(declare-fun m!425769 () Bool)

(assert (=> b!291058 m!425769))

(declare-fun m!425771 () Bool)

(assert (=> b!291058 m!425771))

(assert (=> b!291035 d!98578))

(declare-fun d!98580 () Bool)

(assert (=> d!98580 (= (bitAt!0 lt!422690 from!505) (not (= (bvand ((_ sign_extend 24) (select (arr!8492 lt!422690) ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!25115 () Bool)

(assert (= bs!25115 d!98580))

(declare-fun m!425773 () Bool)

(assert (=> bs!25115 m!425773))

(declare-fun m!425775 () Bool)

(assert (=> bs!25115 m!425775))

(assert (=> b!291035 d!98580))

(declare-fun b!291073 () Bool)

(declare-fun res!240461 () Bool)

(declare-fun lt!422747 () (_ BitVec 32))

(assert (=> b!291073 (= res!240461 (= lt!422747 #b00000000000000000000000000000000))))

(declare-fun e!207406 () Bool)

(assert (=> b!291073 (=> res!240461 e!207406)))

(declare-fun e!207410 () Bool)

(assert (=> b!291073 (= e!207410 e!207406)))

(declare-fun b!291074 () Bool)

(declare-fun e!207409 () Bool)

(declare-fun e!207408 () Bool)

(assert (=> b!291074 (= e!207409 e!207408)))

(declare-fun c!13305 () Bool)

(declare-datatypes ((tuple4!840 0))(
  ( (tuple4!841 (_1!12700 (_ BitVec 32)) (_2!12700 (_ BitVec 32)) (_3!1272 (_ BitVec 32)) (_4!420 (_ BitVec 32))) )
))
(declare-fun lt!422748 () tuple4!840)

(assert (=> b!291074 (= c!13305 (= (_3!1272 lt!422748) (_4!420 lt!422748)))))

(declare-fun b!291075 () Bool)

(declare-fun call!4853 () Bool)

(assert (=> b!291075 (= e!207408 call!4853)))

(declare-fun b!291076 () Bool)

(declare-fun e!207407 () Bool)

(assert (=> b!291076 (= e!207407 e!207409)))

(declare-fun res!240459 () Bool)

(assert (=> b!291076 (=> (not res!240459) (not e!207409))))

(declare-fun e!207411 () Bool)

(assert (=> b!291076 (= res!240459 e!207411)))

(declare-fun res!240460 () Bool)

(assert (=> b!291076 (=> res!240460 e!207411)))

(assert (=> b!291076 (= res!240460 (bvsge (_1!12700 lt!422748) (_2!12700 lt!422748)))))

(assert (=> b!291076 (= lt!422747 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!422746 () (_ BitVec 32))

(assert (=> b!291076 (= lt!422746 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!840)

(assert (=> b!291076 (= lt!422748 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(declare-fun d!98582 () Bool)

(declare-fun res!240458 () Bool)

(assert (=> d!98582 (=> res!240458 e!207407)))

(assert (=> d!98582 (= res!240458 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!98582 (= (arrayBitRangesEq!0 arr!273 (_3!1270 lt!422688) #b0000000000000000000000000000000000000000000000000000000000000000 from!505) e!207407)))

(declare-fun bm!4850 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!4850 (= call!4853 (byteRangesEq!0 (select (arr!8492 arr!273) (_3!1272 lt!422748)) (select (arr!8492 (_3!1270 lt!422688)) (_3!1272 lt!422748)) lt!422746 (ite c!13305 lt!422747 #b00000000000000000000000000001000)))))

(declare-fun b!291077 () Bool)

(assert (=> b!291077 (= e!207408 e!207410)))

(declare-fun res!240457 () Bool)

(assert (=> b!291077 (= res!240457 call!4853)))

(assert (=> b!291077 (=> (not res!240457) (not e!207410))))

(declare-fun b!291078 () Bool)

(assert (=> b!291078 (= e!207406 (byteRangesEq!0 (select (arr!8492 arr!273) (_4!420 lt!422748)) (select (arr!8492 (_3!1270 lt!422688)) (_4!420 lt!422748)) #b00000000000000000000000000000000 lt!422747))))

(declare-fun b!291079 () Bool)

(declare-fun arrayRangesEq!1478 (array!17275 array!17275 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!291079 (= e!207411 (arrayRangesEq!1478 arr!273 (_3!1270 lt!422688) (_1!12700 lt!422748) (_2!12700 lt!422748)))))

(assert (= (and d!98582 (not res!240458)) b!291076))

(assert (= (and b!291076 (not res!240460)) b!291079))

(assert (= (and b!291076 res!240459) b!291074))

(assert (= (and b!291074 c!13305) b!291075))

(assert (= (and b!291074 (not c!13305)) b!291077))

(assert (= (and b!291077 res!240457) b!291073))

(assert (= (and b!291073 (not res!240461)) b!291078))

(assert (= (or b!291075 b!291077) bm!4850))

(declare-fun m!425777 () Bool)

(assert (=> b!291076 m!425777))

(declare-fun m!425779 () Bool)

(assert (=> bm!4850 m!425779))

(declare-fun m!425781 () Bool)

(assert (=> bm!4850 m!425781))

(assert (=> bm!4850 m!425779))

(assert (=> bm!4850 m!425781))

(declare-fun m!425783 () Bool)

(assert (=> bm!4850 m!425783))

(declare-fun m!425785 () Bool)

(assert (=> b!291078 m!425785))

(declare-fun m!425787 () Bool)

(assert (=> b!291078 m!425787))

(assert (=> b!291078 m!425785))

(assert (=> b!291078 m!425787))

(declare-fun m!425789 () Bool)

(assert (=> b!291078 m!425789))

(declare-fun m!425791 () Bool)

(assert (=> b!291079 m!425791))

(assert (=> b!291035 d!98582))

(declare-fun d!98584 () Bool)

(declare-fun e!207414 () Bool)

(assert (=> d!98584 e!207414))

(declare-fun res!240467 () Bool)

(assert (=> d!98584 (=> (not res!240467) (not e!207414))))

(declare-fun lt!422766 () (_ BitVec 64))

(declare-fun lt!422763 () (_ BitVec 64))

(declare-fun lt!422765 () (_ BitVec 64))

(assert (=> d!98584 (= res!240467 (= lt!422763 (bvsub lt!422765 lt!422766)))))

(assert (=> d!98584 (or (= (bvand lt!422765 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!422766 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!422765 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!422765 lt!422766) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!98584 (= lt!422766 (remainingBits!0 ((_ sign_extend 32) (size!7478 (buf!7544 thiss!1728))) ((_ sign_extend 32) (currentByte!13969 thiss!1728)) ((_ sign_extend 32) (currentBit!13964 thiss!1728))))))

(declare-fun lt!422762 () (_ BitVec 64))

(declare-fun lt!422764 () (_ BitVec 64))

(assert (=> d!98584 (= lt!422765 (bvmul lt!422762 lt!422764))))

(assert (=> d!98584 (or (= lt!422762 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!422764 (bvsdiv (bvmul lt!422762 lt!422764) lt!422762)))))

(assert (=> d!98584 (= lt!422764 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!98584 (= lt!422762 ((_ sign_extend 32) (size!7478 (buf!7544 thiss!1728))))))

(assert (=> d!98584 (= lt!422763 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13969 thiss!1728)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13964 thiss!1728))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!98584 (invariant!0 (currentBit!13964 thiss!1728) (currentByte!13969 thiss!1728) (size!7478 (buf!7544 thiss!1728)))))

(assert (=> d!98584 (= (bitIndex!0 (size!7478 (buf!7544 thiss!1728)) (currentByte!13969 thiss!1728) (currentBit!13964 thiss!1728)) lt!422763)))

(declare-fun b!291084 () Bool)

(declare-fun res!240466 () Bool)

(assert (=> b!291084 (=> (not res!240466) (not e!207414))))

(assert (=> b!291084 (= res!240466 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!422763))))

(declare-fun b!291085 () Bool)

(declare-fun lt!422761 () (_ BitVec 64))

(assert (=> b!291085 (= e!207414 (bvsle lt!422763 (bvmul lt!422761 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!291085 (or (= lt!422761 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!422761 #b0000000000000000000000000000000000000000000000000000000000001000) lt!422761)))))

(assert (=> b!291085 (= lt!422761 ((_ sign_extend 32) (size!7478 (buf!7544 thiss!1728))))))

(assert (= (and d!98584 res!240467) b!291084))

(assert (= (and b!291084 res!240466) b!291085))

(assert (=> d!98584 m!425761))

(declare-fun m!425793 () Bool)

(assert (=> d!98584 m!425793))

(assert (=> b!291035 d!98584))

(declare-fun d!98586 () Bool)

(assert (=> d!98586 (= (bitAt!0 lt!422690 from!505) (bitAt!0 (_3!1270 lt!422688) from!505))))

(declare-fun lt!422769 () Unit!20221)

(declare-fun choose!31 (array!17275 array!17275 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20221)

(assert (=> d!98586 (= lt!422769 (choose!31 lt!422690 (_3!1270 lt!422688) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!98586 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!98586 (= (arrayBitRangesEqImpliesEq!0 lt!422690 (_3!1270 lt!422688) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) lt!422769)))

(declare-fun bs!25116 () Bool)

(assert (= bs!25116 d!98586))

(assert (=> bs!25116 m!425707))

(assert (=> bs!25116 m!425711))

(declare-fun m!425795 () Bool)

(assert (=> bs!25116 m!425795))

(assert (=> b!291035 d!98586))

(declare-fun d!98588 () Bool)

(declare-fun e!207417 () Bool)

(assert (=> d!98588 e!207417))

(declare-fun res!240470 () Bool)

(assert (=> d!98588 (=> (not res!240470) (not e!207417))))

(assert (=> d!98588 (= res!240470 (or (= (bvand (bvsub nBits!523 from!505) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!523 from!505) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!422774 () Unit!20221)

(declare-fun choose!27 (BitStream!12966 BitStream!12966 (_ BitVec 64) (_ BitVec 64)) Unit!20221)

(assert (=> d!98588 (= lt!422774 (choose!27 thiss!1728 (_2!12697 lt!422694) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!98588 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!523 from!505)))))

(assert (=> d!98588 (= (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12697 lt!422694) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001) lt!422774)))

(declare-fun b!291088 () Bool)

(assert (=> b!291088 (= e!207417 (validate_offset_bits!1 ((_ sign_extend 32) (size!7478 (buf!7544 (_2!12697 lt!422694)))) ((_ sign_extend 32) (currentByte!13969 (_2!12697 lt!422694))) ((_ sign_extend 32) (currentBit!13964 (_2!12697 lt!422694))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!98588 res!240470) b!291088))

(declare-fun m!425799 () Bool)

(assert (=> d!98588 m!425799))

(assert (=> b!291088 m!425703))

(assert (=> b!291035 d!98588))

(declare-fun d!98596 () Bool)

(assert (=> d!98596 (= (bitAt!0 (_3!1270 lt!422688) from!505) (not (= (bvand ((_ sign_extend 24) (select (arr!8492 (_3!1270 lt!422688)) ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!25119 () Bool)

(assert (= bs!25119 d!98596))

(declare-fun m!425801 () Bool)

(assert (=> bs!25119 m!425801))

(assert (=> bs!25119 m!425775))

(assert (=> b!291035 d!98596))

(declare-fun d!98600 () Bool)

(assert (=> d!98600 (arrayBitRangesEq!0 arr!273 (_3!1270 lt!422688) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!422778 () Unit!20221)

(declare-fun choose!49 (array!17275 array!17275 array!17275 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20221)

(assert (=> d!98600 (= lt!422778 (choose!49 arr!273 lt!422690 (_3!1270 lt!422688) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!98600 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!98600 (= (arrayBitRangesEqTransitive!0 arr!273 lt!422690 (_3!1270 lt!422688) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) lt!422778)))

(declare-fun bs!25121 () Bool)

(assert (= bs!25121 d!98600))

(assert (=> bs!25121 m!425693))

(declare-fun m!425805 () Bool)

(assert (=> bs!25121 m!425805))

(assert (=> b!291035 d!98600))

(declare-fun d!98604 () Bool)

(declare-fun e!207424 () Bool)

(assert (=> d!98604 e!207424))

(declare-fun res!240473 () Bool)

(assert (=> d!98604 (=> (not res!240473) (not e!207424))))

(declare-datatypes ((tuple2!22856 0))(
  ( (tuple2!22857 (_1!12701 Unit!20221) (_2!12701 BitStream!12966)) )
))
(declare-fun increaseBitIndex!0 (BitStream!12966) tuple2!22856)

(assert (=> d!98604 (= res!240473 (= (buf!7544 (_2!12701 (increaseBitIndex!0 thiss!1728))) (buf!7544 thiss!1728)))))

(declare-fun lt!422796 () Bool)

(assert (=> d!98604 (= lt!422796 (not (= (bvand ((_ sign_extend 24) (select (arr!8492 (buf!7544 thiss!1728)) (currentByte!13969 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13964 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!422794 () tuple2!22852)

(assert (=> d!98604 (= lt!422794 (tuple2!22853 (not (= (bvand ((_ sign_extend 24) (select (arr!8492 (buf!7544 thiss!1728)) (currentByte!13969 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13964 thiss!1728)))) #b00000000000000000000000000000000)) (_2!12701 (increaseBitIndex!0 thiss!1728))))))

(assert (=> d!98604 (validate_offset_bit!0 ((_ sign_extend 32) (size!7478 (buf!7544 thiss!1728))) ((_ sign_extend 32) (currentByte!13969 thiss!1728)) ((_ sign_extend 32) (currentBit!13964 thiss!1728)))))

(assert (=> d!98604 (= (readBit!0 thiss!1728) lt!422794)))

(declare-fun b!291091 () Bool)

(declare-fun lt!422797 () (_ BitVec 64))

(declare-fun lt!422793 () (_ BitVec 64))

(assert (=> b!291091 (= e!207424 (= (bitIndex!0 (size!7478 (buf!7544 (_2!12701 (increaseBitIndex!0 thiss!1728)))) (currentByte!13969 (_2!12701 (increaseBitIndex!0 thiss!1728))) (currentBit!13964 (_2!12701 (increaseBitIndex!0 thiss!1728)))) (bvadd lt!422793 lt!422797)))))

(assert (=> b!291091 (or (not (= (bvand lt!422793 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!422797 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!422793 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!422793 lt!422797) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!291091 (= lt!422797 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!291091 (= lt!422793 (bitIndex!0 (size!7478 (buf!7544 thiss!1728)) (currentByte!13969 thiss!1728) (currentBit!13964 thiss!1728)))))

(declare-fun lt!422799 () Bool)

(assert (=> b!291091 (= lt!422799 (not (= (bvand ((_ sign_extend 24) (select (arr!8492 (buf!7544 thiss!1728)) (currentByte!13969 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13964 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!422795 () Bool)

(assert (=> b!291091 (= lt!422795 (not (= (bvand ((_ sign_extend 24) (select (arr!8492 (buf!7544 thiss!1728)) (currentByte!13969 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13964 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!422798 () Bool)

(assert (=> b!291091 (= lt!422798 (not (= (bvand ((_ sign_extend 24) (select (arr!8492 (buf!7544 thiss!1728)) (currentByte!13969 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13964 thiss!1728)))) #b00000000000000000000000000000000)))))

(assert (= (and d!98604 res!240473) b!291091))

(declare-fun m!425807 () Bool)

(assert (=> d!98604 m!425807))

(declare-fun m!425809 () Bool)

(assert (=> d!98604 m!425809))

(declare-fun m!425811 () Bool)

(assert (=> d!98604 m!425811))

(assert (=> d!98604 m!425687))

(assert (=> b!291091 m!425809))

(assert (=> b!291091 m!425807))

(assert (=> b!291091 m!425811))

(declare-fun m!425813 () Bool)

(assert (=> b!291091 m!425813))

(assert (=> b!291091 m!425691))

(assert (=> b!291035 d!98604))

(declare-fun d!98606 () Bool)

(assert (=> d!98606 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7478 (buf!7544 (_2!12697 lt!422694)))) ((_ sign_extend 32) (currentByte!13969 (_2!12697 lt!422694))) ((_ sign_extend 32) (currentBit!13964 (_2!12697 lt!422694))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7478 (buf!7544 (_2!12697 lt!422694)))) ((_ sign_extend 32) (currentByte!13969 (_2!12697 lt!422694))) ((_ sign_extend 32) (currentBit!13964 (_2!12697 lt!422694)))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!25122 () Bool)

(assert (= bs!25122 d!98606))

(declare-fun m!425815 () Bool)

(assert (=> bs!25122 m!425815))

(assert (=> b!291035 d!98606))

(declare-fun b!291092 () Bool)

(declare-fun res!240478 () Bool)

(declare-fun lt!422801 () (_ BitVec 32))

(assert (=> b!291092 (= res!240478 (= lt!422801 #b00000000000000000000000000000000))))

(declare-fun e!207425 () Bool)

(assert (=> b!291092 (=> res!240478 e!207425)))

(declare-fun e!207429 () Bool)

(assert (=> b!291092 (= e!207429 e!207425)))

(declare-fun b!291093 () Bool)

(declare-fun e!207428 () Bool)

(declare-fun e!207427 () Bool)

(assert (=> b!291093 (= e!207428 e!207427)))

(declare-fun c!13306 () Bool)

(declare-fun lt!422802 () tuple4!840)

(assert (=> b!291093 (= c!13306 (= (_3!1272 lt!422802) (_4!420 lt!422802)))))

(declare-fun b!291094 () Bool)

(declare-fun call!4854 () Bool)

(assert (=> b!291094 (= e!207427 call!4854)))

(declare-fun b!291095 () Bool)

(declare-fun e!207426 () Bool)

(assert (=> b!291095 (= e!207426 e!207428)))

(declare-fun res!240476 () Bool)

(assert (=> b!291095 (=> (not res!240476) (not e!207428))))

(declare-fun e!207430 () Bool)

(assert (=> b!291095 (= res!240476 e!207430)))

(declare-fun res!240477 () Bool)

(assert (=> b!291095 (=> res!240477 e!207430)))

(assert (=> b!291095 (= res!240477 (bvsge (_1!12700 lt!422802) (_2!12700 lt!422802)))))

(assert (=> b!291095 (= lt!422801 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!422800 () (_ BitVec 32))

(assert (=> b!291095 (= lt!422800 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!291095 (= lt!422802 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(declare-fun d!98608 () Bool)

(declare-fun res!240475 () Bool)

(assert (=> d!98608 (=> res!240475 e!207426)))

(assert (=> d!98608 (= res!240475 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!98608 (= (arrayBitRangesEq!0 arr!273 lt!422690 #b0000000000000000000000000000000000000000000000000000000000000000 from!505) e!207426)))

(declare-fun bm!4851 () Bool)

(assert (=> bm!4851 (= call!4854 (byteRangesEq!0 (select (arr!8492 arr!273) (_3!1272 lt!422802)) (select (arr!8492 lt!422690) (_3!1272 lt!422802)) lt!422800 (ite c!13306 lt!422801 #b00000000000000000000000000001000)))))

(declare-fun b!291096 () Bool)

(assert (=> b!291096 (= e!207427 e!207429)))

(declare-fun res!240474 () Bool)

(assert (=> b!291096 (= res!240474 call!4854)))

(assert (=> b!291096 (=> (not res!240474) (not e!207429))))

(declare-fun b!291097 () Bool)

(assert (=> b!291097 (= e!207425 (byteRangesEq!0 (select (arr!8492 arr!273) (_4!420 lt!422802)) (select (arr!8492 lt!422690) (_4!420 lt!422802)) #b00000000000000000000000000000000 lt!422801))))

(declare-fun b!291098 () Bool)

(assert (=> b!291098 (= e!207430 (arrayRangesEq!1478 arr!273 lt!422690 (_1!12700 lt!422802) (_2!12700 lt!422802)))))

(assert (= (and d!98608 (not res!240475)) b!291095))

(assert (= (and b!291095 (not res!240477)) b!291098))

(assert (= (and b!291095 res!240476) b!291093))

(assert (= (and b!291093 c!13306) b!291094))

(assert (= (and b!291093 (not c!13306)) b!291096))

(assert (= (and b!291096 res!240474) b!291092))

(assert (= (and b!291092 (not res!240478)) b!291097))

(assert (= (or b!291094 b!291096) bm!4851))

(assert (=> b!291095 m!425777))

(declare-fun m!425817 () Bool)

(assert (=> bm!4851 m!425817))

(declare-fun m!425819 () Bool)

(assert (=> bm!4851 m!425819))

(assert (=> bm!4851 m!425817))

(assert (=> bm!4851 m!425819))

(declare-fun m!425821 () Bool)

(assert (=> bm!4851 m!425821))

(declare-fun m!425823 () Bool)

(assert (=> b!291097 m!425823))

(declare-fun m!425825 () Bool)

(assert (=> b!291097 m!425825))

(assert (=> b!291097 m!425823))

(assert (=> b!291097 m!425825))

(declare-fun m!425827 () Bool)

(assert (=> b!291097 m!425827))

(declare-fun m!425829 () Bool)

(assert (=> b!291098 m!425829))

(assert (=> b!291035 d!98608))

(declare-fun d!98610 () Bool)

(declare-fun e!207482 () Bool)

(assert (=> d!98610 e!207482))

(declare-fun res!240546 () Bool)

(assert (=> d!98610 (=> (not res!240546) (not e!207482))))

(declare-fun lt!423051 () tuple3!1700)

(declare-fun lt!423031 () (_ BitVec 64))

(assert (=> d!98610 (= res!240546 (= (bvsub lt!423031 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitIndex!0 (size!7478 (buf!7544 (_2!12696 lt!423051))) (currentByte!13969 (_2!12696 lt!423051)) (currentBit!13964 (_2!12696 lt!423051)))))))

(assert (=> d!98610 (or (= (bvand lt!423031 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!423031 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!423031 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!423027 () (_ BitVec 64))

(assert (=> d!98610 (= lt!423031 (bvadd lt!423027 to!474))))

(assert (=> d!98610 (or (not (= (bvand lt!423027 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!423027 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!423027 to!474) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!98610 (= lt!423027 (bitIndex!0 (size!7478 (buf!7544 (_2!12697 lt!422694))) (currentByte!13969 (_2!12697 lt!422694)) (currentBit!13964 (_2!12697 lt!422694))))))

(declare-fun e!207483 () tuple3!1700)

(assert (=> d!98610 (= lt!423051 e!207483)))

(declare-fun c!13316 () Bool)

(assert (=> d!98610 (= c!13316 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> d!98610 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!98610 (= (readBitsLoop!0 (_2!12697 lt!422694) nBits!523 lt!422690 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474) lt!423051)))

(declare-fun b!291179 () Bool)

(declare-fun lt!423043 () tuple3!1700)

(declare-fun e!207484 () Bool)

(assert (=> b!291179 (= e!207484 (and (= (buf!7544 (_2!12697 lt!422694)) (buf!7544 (_2!12696 lt!423043))) (= (size!7478 lt!422690) (size!7478 (_3!1270 lt!423043)))))))

(declare-fun e!207481 () Bool)

(declare-fun b!291180 () Bool)

(declare-datatypes ((tuple2!22858 0))(
  ( (tuple2!22859 (_1!12702 BitStream!12966) (_2!12702 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!12966) tuple2!22858)

(assert (=> b!291180 (= e!207481 (= (bitAt!0 (_3!1270 lt!423051) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (_2!12702 (readBitPure!0 (_2!12697 lt!422694)))))))

(declare-fun b!291181 () Bool)

(declare-fun res!240542 () Bool)

(assert (=> b!291181 (=> (not res!240542) (not e!207482))))

(assert (=> b!291181 (= res!240542 (and (= (buf!7544 (_2!12697 lt!422694)) (buf!7544 (_2!12696 lt!423051))) (= (size!7478 lt!422690) (size!7478 (_3!1270 lt!423051)))))))

(declare-fun b!291182 () Bool)

(declare-fun lt!423029 () Unit!20221)

(assert (=> b!291182 (= e!207483 (tuple3!1701 lt!423029 (_2!12697 lt!422694) lt!422690))))

(declare-fun lt!423016 () Unit!20221)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17275) Unit!20221)

(assert (=> b!291182 (= lt!423016 (arrayBitRangesEqReflexiveLemma!0 lt!422690))))

(declare-fun call!4869 () Bool)

(assert (=> b!291182 call!4869))

(declare-fun lt!423024 () Unit!20221)

(assert (=> b!291182 (= lt!423024 lt!423016)))

(declare-fun lt!423022 () array!17275)

(assert (=> b!291182 (= lt!423022 lt!422690)))

(declare-fun lt!423036 () array!17275)

(assert (=> b!291182 (= lt!423036 lt!422690)))

(declare-fun lt!423028 () (_ BitVec 64))

(assert (=> b!291182 (= lt!423028 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!423030 () (_ BitVec 64))

(assert (=> b!291182 (= lt!423030 ((_ sign_extend 32) (size!7478 lt!422690)))))

(declare-fun lt!423047 () (_ BitVec 64))

(assert (=> b!291182 (= lt!423047 (bvmul lt!423030 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!423033 () (_ BitVec 64))

(assert (=> b!291182 (= lt!423033 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!423017 () (_ BitVec 64))

(assert (=> b!291182 (= lt!423017 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))))

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17275 array!17275 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20221)

(assert (=> b!291182 (= lt!423029 (arrayBitRangesEqSlicedLemma!0 lt!423022 lt!423036 lt!423028 lt!423047 lt!423033 lt!423017))))

(declare-fun call!4870 () Bool)

(assert (=> b!291182 call!4870))

(declare-fun b!291183 () Bool)

(declare-fun res!240541 () Bool)

(assert (=> b!291183 (=> (not res!240541) (not e!207482))))

(assert (=> b!291183 (= res!240541 (invariant!0 (currentBit!13964 (_2!12696 lt!423051)) (currentByte!13969 (_2!12696 lt!423051)) (size!7478 (buf!7544 (_2!12696 lt!423051)))))))

(declare-fun b!291184 () Bool)

(declare-fun res!240545 () Bool)

(assert (=> b!291184 (=> (not res!240545) (not e!207482))))

(assert (=> b!291184 (= res!240545 e!207481)))

(declare-fun res!240544 () Bool)

(assert (=> b!291184 (=> res!240544 e!207481)))

(assert (=> b!291184 (= res!240544 (not (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474)))))

(declare-fun b!291185 () Bool)

(declare-fun res!240540 () Bool)

(assert (=> b!291185 (=> (not res!240540) (not e!207482))))

(assert (=> b!291185 (= res!240540 (arrayBitRangesEq!0 lt!422690 (_3!1270 lt!423051) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun b!291186 () Bool)

(declare-fun lt!423042 () Unit!20221)

(assert (=> b!291186 (= e!207483 (tuple3!1701 lt!423042 (_2!12696 lt!423043) (_3!1270 lt!423043)))))

(declare-fun lt!423048 () tuple2!22852)

(assert (=> b!291186 (= lt!423048 (readBit!0 (_2!12697 lt!422694)))))

(declare-fun lt!423040 () (_ BitVec 32))

(assert (=> b!291186 (= lt!423040 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!423019 () (_ BitVec 32))

(assert (=> b!291186 (= lt!423019 ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!423049 () array!17275)

(assert (=> b!291186 (= lt!423049 (array!17276 (store (arr!8492 lt!422690) lt!423040 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8492 lt!422690) lt!423040)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!423019)))) ((_ sign_extend 24) (ite (_1!12697 lt!423048) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!423019) #b00000000))))) (size!7478 lt!422690)))))

(declare-fun lt!423046 () (_ BitVec 64))

(assert (=> b!291186 (= lt!423046 (bvsub nBits!523 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun lt!423044 () (_ BitVec 64))

(assert (=> b!291186 (= lt!423044 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!423037 () Unit!20221)

(assert (=> b!291186 (= lt!423037 (validateOffsetBitsIneqLemma!0 (_2!12697 lt!422694) (_2!12697 lt!423048) lt!423046 lt!423044))))

(assert (=> b!291186 (validate_offset_bits!1 ((_ sign_extend 32) (size!7478 (buf!7544 (_2!12697 lt!423048)))) ((_ sign_extend 32) (currentByte!13969 (_2!12697 lt!423048))) ((_ sign_extend 32) (currentBit!13964 (_2!12697 lt!423048))) (bvsub lt!423046 lt!423044))))

(declare-fun lt!423039 () Unit!20221)

(assert (=> b!291186 (= lt!423039 lt!423037)))

(assert (=> b!291186 (= lt!423043 (readBitsLoop!0 (_2!12697 lt!423048) nBits!523 lt!423049 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001) to!474))))

(declare-fun res!240543 () Bool)

(assert (=> b!291186 (= res!240543 (= (bvsub (bvadd (bitIndex!0 (size!7478 (buf!7544 (_2!12697 lt!422694))) (currentByte!13969 (_2!12697 lt!422694)) (currentBit!13964 (_2!12697 lt!422694))) to!474) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitIndex!0 (size!7478 (buf!7544 (_2!12696 lt!423043))) (currentByte!13969 (_2!12696 lt!423043)) (currentBit!13964 (_2!12696 lt!423043)))))))

(assert (=> b!291186 (=> (not res!240543) (not e!207484))))

(assert (=> b!291186 e!207484))

(declare-fun lt!423021 () Unit!20221)

(declare-fun Unit!20225 () Unit!20221)

(assert (=> b!291186 (= lt!423021 Unit!20225)))

(declare-fun lt!423026 () (_ BitVec 32))

(assert (=> b!291186 (= lt!423026 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!423018 () (_ BitVec 32))

(assert (=> b!291186 (= lt!423018 ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!423034 () Unit!20221)

(assert (=> b!291186 (= lt!423034 (arrayBitRangesUpdatedAtLemma!0 lt!422690 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (_1!12697 lt!423048)))))

(assert (=> b!291186 (arrayBitRangesEq!0 lt!422690 (array!17276 (store (arr!8492 lt!422690) lt!423026 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8492 lt!422690) lt!423026)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!423018)))) ((_ sign_extend 24) (ite (_1!12697 lt!423048) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!423018) #b00000000))))) (size!7478 lt!422690)) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))))

(declare-fun lt!423020 () Unit!20221)

(assert (=> b!291186 (= lt!423020 lt!423034)))

(declare-fun lt!423023 () (_ BitVec 64))

(assert (=> b!291186 (= lt!423023 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!423041 () Unit!20221)

(assert (=> b!291186 (= lt!423041 (arrayBitRangesEqTransitive!0 lt!422690 lt!423049 (_3!1270 lt!423043) lt!423023 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!291186 call!4869))

(declare-fun lt!423045 () Unit!20221)

(assert (=> b!291186 (= lt!423045 lt!423041)))

(assert (=> b!291186 call!4870))

(declare-fun lt!423038 () Unit!20221)

(declare-fun Unit!20226 () Unit!20221)

(assert (=> b!291186 (= lt!423038 Unit!20226)))

(declare-fun lt!423025 () Unit!20221)

(assert (=> b!291186 (= lt!423025 (arrayBitRangesEqImpliesEq!0 lt!423049 (_3!1270 lt!423043) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!291186 (= (bitAt!0 lt!423049 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitAt!0 (_3!1270 lt!423043) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun lt!423050 () Unit!20221)

(assert (=> b!291186 (= lt!423050 lt!423025)))

(declare-fun lt!423032 () Unit!20221)

(declare-fun Unit!20227 () Unit!20221)

(assert (=> b!291186 (= lt!423032 Unit!20227)))

(declare-fun lt!423035 () Bool)

(assert (=> b!291186 (= lt!423035 (= (bitAt!0 (_3!1270 lt!423043) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (_1!12697 lt!423048)))))

(declare-fun Unit!20228 () Unit!20221)

(assert (=> b!291186 (= lt!423042 Unit!20228)))

(assert (=> b!291186 lt!423035))

(declare-fun bm!4866 () Bool)

(assert (=> bm!4866 (= call!4869 (arrayBitRangesEq!0 lt!422690 (ite c!13316 (_3!1270 lt!423043) lt!422690) (ite c!13316 lt!423023 #b0000000000000000000000000000000000000000000000000000000000000000) (ite c!13316 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvmul ((_ sign_extend 32) (size!7478 lt!422690)) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun bm!4867 () Bool)

(assert (=> bm!4867 (= call!4870 (arrayBitRangesEq!0 (ite c!13316 lt!422690 lt!423022) (ite c!13316 (_3!1270 lt!423043) lt!423036) (ite c!13316 #b0000000000000000000000000000000000000000000000000000000000000000 lt!423033) (ite c!13316 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) lt!423017)))))

(declare-fun b!291187 () Bool)

(declare-datatypes ((List!961 0))(
  ( (Nil!958) (Cons!957 (h!1076 Bool) (t!1846 List!961)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!12966 array!17275 (_ BitVec 64) (_ BitVec 64)) List!961)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!12966 BitStream!12966 (_ BitVec 64)) List!961)

(assert (=> b!291187 (= e!207482 (= (byteArrayBitContentToList!0 (_2!12696 lt!423051) (_3!1270 lt!423051) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))) (bitStreamReadBitsIntoList!0 (_2!12696 lt!423051) (_2!12697 lt!422694) (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))))

(assert (=> b!291187 (or (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!291187 (or (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!98610 c!13316) b!291186))

(assert (= (and d!98610 (not c!13316)) b!291182))

(assert (= (and b!291186 res!240543) b!291179))

(assert (= (or b!291186 b!291182) bm!4867))

(assert (= (or b!291186 b!291182) bm!4866))

(assert (= (and d!98610 res!240546) b!291181))

(assert (= (and b!291181 res!240542) b!291185))

(assert (= (and b!291185 res!240540) b!291184))

(assert (= (and b!291184 (not res!240544)) b!291180))

(assert (= (and b!291184 res!240545) b!291183))

(assert (= (and b!291183 res!240541) b!291187))

(declare-fun m!425941 () Bool)

(assert (=> b!291182 m!425941))

(declare-fun m!425943 () Bool)

(assert (=> b!291182 m!425943))

(declare-fun m!425945 () Bool)

(assert (=> bm!4866 m!425945))

(declare-fun m!425947 () Bool)

(assert (=> b!291183 m!425947))

(declare-fun m!425949 () Bool)

(assert (=> b!291185 m!425949))

(declare-fun m!425951 () Bool)

(assert (=> d!98610 m!425951))

(declare-fun m!425953 () Bool)

(assert (=> d!98610 m!425953))

(declare-fun m!425955 () Bool)

(assert (=> b!291180 m!425955))

(declare-fun m!425957 () Bool)

(assert (=> b!291180 m!425957))

(declare-fun m!425959 () Bool)

(assert (=> bm!4867 m!425959))

(declare-fun m!425961 () Bool)

(assert (=> b!291187 m!425961))

(declare-fun m!425963 () Bool)

(assert (=> b!291187 m!425963))

(declare-fun m!425965 () Bool)

(assert (=> b!291186 m!425965))

(declare-fun m!425967 () Bool)

(assert (=> b!291186 m!425967))

(declare-fun m!425969 () Bool)

(assert (=> b!291186 m!425969))

(declare-fun m!425971 () Bool)

(assert (=> b!291186 m!425971))

(declare-fun m!425973 () Bool)

(assert (=> b!291186 m!425973))

(declare-fun m!425975 () Bool)

(assert (=> b!291186 m!425975))

(declare-fun m!425977 () Bool)

(assert (=> b!291186 m!425977))

(declare-fun m!425979 () Bool)

(assert (=> b!291186 m!425979))

(declare-fun m!425981 () Bool)

(assert (=> b!291186 m!425981))

(declare-fun m!425983 () Bool)

(assert (=> b!291186 m!425983))

(declare-fun m!425985 () Bool)

(assert (=> b!291186 m!425985))

(declare-fun m!425987 () Bool)

(assert (=> b!291186 m!425987))

(declare-fun m!425989 () Bool)

(assert (=> b!291186 m!425989))

(assert (=> b!291186 m!425953))

(declare-fun m!425991 () Bool)

(assert (=> b!291186 m!425991))

(declare-fun m!425993 () Bool)

(assert (=> b!291186 m!425993))

(declare-fun m!425995 () Bool)

(assert (=> b!291186 m!425995))

(declare-fun m!425997 () Bool)

(assert (=> b!291186 m!425997))

(assert (=> b!291035 d!98610))

(declare-fun d!98634 () Bool)

(declare-fun e!207485 () Bool)

(assert (=> d!98634 e!207485))

(declare-fun res!240548 () Bool)

(assert (=> d!98634 (=> (not res!240548) (not e!207485))))

(declare-fun lt!423057 () (_ BitVec 64))

(declare-fun lt!423054 () (_ BitVec 64))

(declare-fun lt!423056 () (_ BitVec 64))

(assert (=> d!98634 (= res!240548 (= lt!423054 (bvsub lt!423056 lt!423057)))))

(assert (=> d!98634 (or (= (bvand lt!423056 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!423057 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!423056 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!423056 lt!423057) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!98634 (= lt!423057 (remainingBits!0 ((_ sign_extend 32) (size!7478 (buf!7544 (_2!12696 lt!422688)))) ((_ sign_extend 32) (currentByte!13969 (_2!12696 lt!422688))) ((_ sign_extend 32) (currentBit!13964 (_2!12696 lt!422688)))))))

(declare-fun lt!423053 () (_ BitVec 64))

(declare-fun lt!423055 () (_ BitVec 64))

(assert (=> d!98634 (= lt!423056 (bvmul lt!423053 lt!423055))))

(assert (=> d!98634 (or (= lt!423053 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!423055 (bvsdiv (bvmul lt!423053 lt!423055) lt!423053)))))

(assert (=> d!98634 (= lt!423055 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!98634 (= lt!423053 ((_ sign_extend 32) (size!7478 (buf!7544 (_2!12696 lt!422688)))))))

(assert (=> d!98634 (= lt!423054 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13969 (_2!12696 lt!422688))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13964 (_2!12696 lt!422688)))))))

(assert (=> d!98634 (invariant!0 (currentBit!13964 (_2!12696 lt!422688)) (currentByte!13969 (_2!12696 lt!422688)) (size!7478 (buf!7544 (_2!12696 lt!422688))))))

(assert (=> d!98634 (= (bitIndex!0 (size!7478 (buf!7544 (_2!12696 lt!422688))) (currentByte!13969 (_2!12696 lt!422688)) (currentBit!13964 (_2!12696 lt!422688))) lt!423054)))

(declare-fun b!291188 () Bool)

(declare-fun res!240547 () Bool)

(assert (=> b!291188 (=> (not res!240547) (not e!207485))))

(assert (=> b!291188 (= res!240547 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!423054))))

(declare-fun b!291189 () Bool)

(declare-fun lt!423052 () (_ BitVec 64))

(assert (=> b!291189 (= e!207485 (bvsle lt!423054 (bvmul lt!423052 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!291189 (or (= lt!423052 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!423052 #b0000000000000000000000000000000000000000000000000000000000001000) lt!423052)))))

(assert (=> b!291189 (= lt!423052 ((_ sign_extend 32) (size!7478 (buf!7544 (_2!12696 lt!422688)))))))

(assert (= (and d!98634 res!240548) b!291188))

(assert (= (and b!291188 res!240547) b!291189))

(declare-fun m!425999 () Bool)

(assert (=> d!98634 m!425999))

(declare-fun m!426001 () Bool)

(assert (=> d!98634 m!426001))

(assert (=> b!291035 d!98634))

(declare-fun d!98636 () Bool)

(assert (=> d!98636 (= (inv!12 thiss!1728) (invariant!0 (currentBit!13964 thiss!1728) (currentByte!13969 thiss!1728) (size!7478 (buf!7544 thiss!1728))))))

(declare-fun bs!25127 () Bool)

(assert (= bs!25127 d!98636))

(assert (=> bs!25127 m!425793))

(assert (=> start!64836 d!98636))

(declare-fun d!98638 () Bool)

(assert (=> d!98638 (= (array_inv!7090 arr!273) (bvsge (size!7478 arr!273) #b00000000000000000000000000000000))))

(assert (=> start!64836 d!98638))

(check-sat (not b!291078) (not d!98574) (not b!291183) (not b!291180) (not b!291098) (not d!98584) (not b!291095) (not d!98636) (not d!98578) (not b!291088) (not b!291076) (not d!98586) (not d!98610) (not d!98606) (not bm!4867) (not b!291058) (not bm!4866) (not d!98600) (not d!98634) (not d!98588) (not b!291185) (not b!291097) (not d!98604) (not b!291186) (not bm!4851) (not bm!4850) (not b!291091) (not b!291187) (not b!291079) (not b!291182) (not d!98576))
