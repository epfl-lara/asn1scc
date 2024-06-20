; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66246 () Bool)

(assert start!66246)

(declare-fun res!245141 () Bool)

(declare-fun e!212511 () Bool)

(assert (=> start!66246 (=> (not res!245141) (not e!212511))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-datatypes ((array!17764 0))(
  ( (array!17765 (arr!8768 (Array (_ BitVec 32) (_ BitVec 8))) (size!7697 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17764)

(assert (=> start!66246 (= res!245141 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7697 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!66246 e!212511))

(declare-datatypes ((BitStream!13398 0))(
  ( (BitStream!13399 (buf!7760 array!17764) (currentByte!14296 (_ BitVec 32)) (currentBit!14291 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13398)

(declare-fun e!212514 () Bool)

(declare-fun inv!12 (BitStream!13398) Bool)

(assert (=> start!66246 (and (inv!12 thiss!1728) e!212514)))

(assert (=> start!66246 true))

(declare-fun array_inv!7309 (array!17764) Bool)

(assert (=> start!66246 (array_inv!7309 arr!273)))

(declare-fun b!296932 () Bool)

(declare-fun res!245143 () Bool)

(assert (=> b!296932 (=> (not res!245143) (not e!212511))))

(assert (=> b!296932 (= res!245143 (bvslt from!505 to!474))))

(declare-fun b!296933 () Bool)

(assert (=> b!296933 (= e!212514 (array_inv!7309 (buf!7760 thiss!1728)))))

(declare-fun b!296934 () Bool)

(declare-datatypes ((Unit!20703 0))(
  ( (Unit!20704) )
))
(declare-datatypes ((tuple3!1910 0))(
  ( (tuple3!1911 (_1!13092 Unit!20703) (_2!13092 BitStream!13398) (_3!1411 array!17764)) )
))
(declare-fun lt!433001 () tuple3!1910)

(declare-datatypes ((List!997 0))(
  ( (Nil!994) (Cons!993 (h!1112 Bool) (t!1882 List!997)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!13398 array!17764 (_ BitVec 64) (_ BitVec 64)) List!997)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!13398 BitStream!13398 (_ BitVec 64)) List!997)

(assert (=> b!296934 (= e!212511 (not (= (byteArrayBitContentToList!0 (_2!13092 lt!433001) (_3!1411 lt!433001) from!505 (bvsub to!474 from!505)) (bitStreamReadBitsIntoList!0 (_2!13092 lt!433001) thiss!1728 (bvsub to!474 from!505)))))))

(declare-fun e!212512 () Bool)

(assert (=> b!296934 e!212512))

(declare-fun res!245140 () Bool)

(assert (=> b!296934 (=> (not res!245140) (not e!212512))))

(declare-fun lt!432997 () array!17764)

(declare-fun lt!432993 () Bool)

(declare-fun bitAt!0 (array!17764 (_ BitVec 64)) Bool)

(assert (=> b!296934 (= res!245140 (= (bitAt!0 lt!432997 from!505) lt!432993))))

(assert (=> b!296934 (= lt!432993 (bitAt!0 (_3!1411 lt!433001) from!505))))

(declare-fun lt!432999 () Unit!20703)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!17764 array!17764 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20703)

(assert (=> b!296934 (= lt!432999 (arrayBitRangesEqImpliesEq!0 lt!432997 (_3!1411 lt!433001) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun arrayBitRangesEq!0 (array!17764 array!17764 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!296934 (arrayBitRangesEq!0 arr!273 (_3!1411 lt!433001) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!432998 () Unit!20703)

(declare-fun arrayBitRangesEqTransitive!0 (array!17764 array!17764 array!17764 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20703)

(assert (=> b!296934 (= lt!432998 (arrayBitRangesEqTransitive!0 arr!273 lt!432997 (_3!1411 lt!433001) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!296934 (arrayBitRangesEq!0 arr!273 lt!432997 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!432995 () Unit!20703)

(declare-datatypes ((tuple2!23362 0))(
  ( (tuple2!23363 (_1!13093 Bool) (_2!13093 BitStream!13398)) )
))
(declare-fun lt!433002 () tuple2!23362)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17764 (_ BitVec 64) Bool) Unit!20703)

(assert (=> b!296934 (= lt!432995 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!13093 lt!433002)))))

(declare-fun e!212509 () Bool)

(assert (=> b!296934 e!212509))

(declare-fun res!245142 () Bool)

(assert (=> b!296934 (=> (not res!245142) (not e!212509))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!296934 (= res!245142 (= (bvsub (bvadd (bitIndex!0 (size!7697 (buf!7760 thiss!1728)) (currentByte!14296 thiss!1728) (currentBit!14291 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7697 (buf!7760 (_2!13092 lt!433001))) (currentByte!14296 (_2!13092 lt!433001)) (currentBit!14291 (_2!13092 lt!433001)))))))

(declare-fun readBitsLoop!0 (BitStream!13398 (_ BitVec 64) array!17764 (_ BitVec 64) (_ BitVec 64)) tuple3!1910)

(assert (=> b!296934 (= lt!433001 (readBitsLoop!0 (_2!13093 lt!433002) nBits!523 lt!432997 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!296934 (validate_offset_bits!1 ((_ sign_extend 32) (size!7697 (buf!7760 (_2!13093 lt!433002)))) ((_ sign_extend 32) (currentByte!14296 (_2!13093 lt!433002))) ((_ sign_extend 32) (currentBit!14291 (_2!13093 lt!433002))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!432996 () Unit!20703)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!13398 BitStream!13398 (_ BitVec 64) (_ BitVec 64)) Unit!20703)

(assert (=> b!296934 (= lt!432996 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!13093 lt!433002) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!432994 () (_ BitVec 32))

(declare-fun lt!433000 () (_ BitVec 32))

(assert (=> b!296934 (= lt!432997 (array!17765 (store (arr!8768 arr!273) lt!433000 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8768 arr!273) lt!433000)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!432994)))) ((_ sign_extend 24) (ite (_1!13093 lt!433002) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!432994) #b00000000))))) (size!7697 arr!273)))))

(assert (=> b!296934 (= lt!432994 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!296934 (= lt!433000 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!13398) tuple2!23362)

(assert (=> b!296934 (= lt!433002 (readBit!0 thiss!1728))))

(declare-fun b!296935 () Bool)

(declare-fun res!245144 () Bool)

(assert (=> b!296935 (=> (not res!245144) (not e!212511))))

(assert (=> b!296935 (= res!245144 (validate_offset_bits!1 ((_ sign_extend 32) (size!7697 (buf!7760 thiss!1728))) ((_ sign_extend 32) (currentByte!14296 thiss!1728)) ((_ sign_extend 32) (currentBit!14291 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!296936 () Bool)

(assert (=> b!296936 (= e!212512 (= lt!432993 (_1!13093 lt!433002)))))

(declare-fun b!296937 () Bool)

(assert (=> b!296937 (= e!212509 (and (= (buf!7760 thiss!1728) (buf!7760 (_2!13092 lt!433001))) (= (size!7697 arr!273) (size!7697 (_3!1411 lt!433001)))))))

(assert (= (and start!66246 res!245141) b!296935))

(assert (= (and b!296935 res!245144) b!296932))

(assert (= (and b!296932 res!245143) b!296934))

(assert (= (and b!296934 res!245142) b!296937))

(assert (= (and b!296934 res!245140) b!296936))

(assert (= start!66246 b!296933))

(declare-fun m!435555 () Bool)

(assert (=> start!66246 m!435555))

(declare-fun m!435557 () Bool)

(assert (=> start!66246 m!435557))

(declare-fun m!435559 () Bool)

(assert (=> b!296933 m!435559))

(declare-fun m!435561 () Bool)

(assert (=> b!296934 m!435561))

(declare-fun m!435563 () Bool)

(assert (=> b!296934 m!435563))

(declare-fun m!435565 () Bool)

(assert (=> b!296934 m!435565))

(declare-fun m!435567 () Bool)

(assert (=> b!296934 m!435567))

(declare-fun m!435569 () Bool)

(assert (=> b!296934 m!435569))

(declare-fun m!435571 () Bool)

(assert (=> b!296934 m!435571))

(declare-fun m!435573 () Bool)

(assert (=> b!296934 m!435573))

(declare-fun m!435575 () Bool)

(assert (=> b!296934 m!435575))

(declare-fun m!435577 () Bool)

(assert (=> b!296934 m!435577))

(declare-fun m!435579 () Bool)

(assert (=> b!296934 m!435579))

(declare-fun m!435581 () Bool)

(assert (=> b!296934 m!435581))

(declare-fun m!435583 () Bool)

(assert (=> b!296934 m!435583))

(declare-fun m!435585 () Bool)

(assert (=> b!296934 m!435585))

(declare-fun m!435587 () Bool)

(assert (=> b!296934 m!435587))

(declare-fun m!435589 () Bool)

(assert (=> b!296934 m!435589))

(declare-fun m!435591 () Bool)

(assert (=> b!296934 m!435591))

(declare-fun m!435593 () Bool)

(assert (=> b!296934 m!435593))

(declare-fun m!435595 () Bool)

(assert (=> b!296934 m!435595))

(declare-fun m!435597 () Bool)

(assert (=> b!296935 m!435597))

(check-sat (not start!66246) (not b!296934) (not b!296935) (not b!296933))
(check-sat)
(get-model)

(declare-fun d!100050 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!100050 (= (inv!12 thiss!1728) (invariant!0 (currentBit!14291 thiss!1728) (currentByte!14296 thiss!1728) (size!7697 (buf!7760 thiss!1728))))))

(declare-fun bs!25590 () Bool)

(assert (= bs!25590 d!100050))

(declare-fun m!435643 () Bool)

(assert (=> bs!25590 m!435643))

(assert (=> start!66246 d!100050))

(declare-fun d!100052 () Bool)

(assert (=> d!100052 (= (array_inv!7309 arr!273) (bvsge (size!7697 arr!273) #b00000000000000000000000000000000))))

(assert (=> start!66246 d!100052))

(declare-fun b!296970 () Bool)

(declare-fun res!245171 () Bool)

(declare-fun lt!433040 () (_ BitVec 32))

(assert (=> b!296970 (= res!245171 (= lt!433040 #b00000000000000000000000000000000))))

(declare-fun e!212550 () Bool)

(assert (=> b!296970 (=> res!245171 e!212550)))

(declare-fun e!212549 () Bool)

(assert (=> b!296970 (= e!212549 e!212550)))

(declare-fun b!296971 () Bool)

(declare-fun e!212546 () Bool)

(declare-fun call!5216 () Bool)

(assert (=> b!296971 (= e!212546 call!5216)))

(declare-fun b!296972 () Bool)

(declare-fun e!212545 () Bool)

(declare-fun e!212547 () Bool)

(assert (=> b!296972 (= e!212545 e!212547)))

(declare-fun res!245173 () Bool)

(assert (=> b!296972 (=> (not res!245173) (not e!212547))))

(declare-fun e!212548 () Bool)

(assert (=> b!296972 (= res!245173 e!212548)))

(declare-fun res!245172 () Bool)

(assert (=> b!296972 (=> res!245172 e!212548)))

(declare-datatypes ((tuple4!912 0))(
  ( (tuple4!913 (_1!13096 (_ BitVec 32)) (_2!13096 (_ BitVec 32)) (_3!1413 (_ BitVec 32)) (_4!456 (_ BitVec 32))) )
))
(declare-fun lt!433041 () tuple4!912)

(assert (=> b!296972 (= res!245172 (bvsge (_1!13096 lt!433041) (_2!13096 lt!433041)))))

(assert (=> b!296972 (= lt!433040 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!433039 () (_ BitVec 32))

(assert (=> b!296972 (= lt!433039 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!912)

(assert (=> b!296972 (= lt!433041 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(declare-fun b!296973 () Bool)

(assert (=> b!296973 (= e!212547 e!212546)))

(declare-fun c!13560 () Bool)

(assert (=> b!296973 (= c!13560 (= (_3!1413 lt!433041) (_4!456 lt!433041)))))

(declare-fun b!296974 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!296974 (= e!212550 (byteRangesEq!0 (select (arr!8768 arr!273) (_4!456 lt!433041)) (select (arr!8768 lt!432997) (_4!456 lt!433041)) #b00000000000000000000000000000000 lt!433040))))

(declare-fun bm!5213 () Bool)

(assert (=> bm!5213 (= call!5216 (byteRangesEq!0 (select (arr!8768 arr!273) (_3!1413 lt!433041)) (select (arr!8768 lt!432997) (_3!1413 lt!433041)) lt!433039 (ite c!13560 lt!433040 #b00000000000000000000000000001000)))))

(declare-fun b!296975 () Bool)

(assert (=> b!296975 (= e!212546 e!212549)))

(declare-fun res!245170 () Bool)

(assert (=> b!296975 (= res!245170 call!5216)))

(assert (=> b!296975 (=> (not res!245170) (not e!212549))))

(declare-fun d!100054 () Bool)

(declare-fun res!245174 () Bool)

(assert (=> d!100054 (=> res!245174 e!212545)))

(assert (=> d!100054 (= res!245174 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!100054 (= (arrayBitRangesEq!0 arr!273 lt!432997 #b0000000000000000000000000000000000000000000000000000000000000000 from!505) e!212545)))

(declare-fun b!296976 () Bool)

(declare-fun arrayRangesEq!1514 (array!17764 array!17764 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!296976 (= e!212548 (arrayRangesEq!1514 arr!273 lt!432997 (_1!13096 lt!433041) (_2!13096 lt!433041)))))

(assert (= (and d!100054 (not res!245174)) b!296972))

(assert (= (and b!296972 (not res!245172)) b!296976))

(assert (= (and b!296972 res!245173) b!296973))

(assert (= (and b!296973 c!13560) b!296971))

(assert (= (and b!296973 (not c!13560)) b!296975))

(assert (= (and b!296975 res!245170) b!296970))

(assert (= (and b!296970 (not res!245171)) b!296974))

(assert (= (or b!296971 b!296975) bm!5213))

(declare-fun m!435645 () Bool)

(assert (=> b!296972 m!435645))

(declare-fun m!435647 () Bool)

(assert (=> b!296974 m!435647))

(declare-fun m!435649 () Bool)

(assert (=> b!296974 m!435649))

(assert (=> b!296974 m!435647))

(assert (=> b!296974 m!435649))

(declare-fun m!435651 () Bool)

(assert (=> b!296974 m!435651))

(declare-fun m!435653 () Bool)

(assert (=> bm!5213 m!435653))

(declare-fun m!435655 () Bool)

(assert (=> bm!5213 m!435655))

(assert (=> bm!5213 m!435653))

(assert (=> bm!5213 m!435655))

(declare-fun m!435657 () Bool)

(assert (=> bm!5213 m!435657))

(declare-fun m!435659 () Bool)

(assert (=> b!296976 m!435659))

(assert (=> b!296934 d!100054))

(declare-fun d!100056 () Bool)

(assert (=> d!100056 (arrayBitRangesEq!0 arr!273 (_3!1411 lt!433001) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!433044 () Unit!20703)

(declare-fun choose!49 (array!17764 array!17764 array!17764 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20703)

(assert (=> d!100056 (= lt!433044 (choose!49 arr!273 lt!432997 (_3!1411 lt!433001) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!100056 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!100056 (= (arrayBitRangesEqTransitive!0 arr!273 lt!432997 (_3!1411 lt!433001) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) lt!433044)))

(declare-fun bs!25591 () Bool)

(assert (= bs!25591 d!100056))

(assert (=> bs!25591 m!435569))

(declare-fun m!435661 () Bool)

(assert (=> bs!25591 m!435661))

(assert (=> b!296934 d!100056))

(declare-fun b!296985 () Bool)

(declare-datatypes ((tuple2!23366 0))(
  ( (tuple2!23367 (_1!13097 List!997) (_2!13097 BitStream!13398)) )
))
(declare-fun e!212555 () tuple2!23366)

(assert (=> b!296985 (= e!212555 (tuple2!23367 Nil!994 thiss!1728))))

(declare-fun b!296988 () Bool)

(declare-fun e!212556 () Bool)

(declare-fun lt!433051 () List!997)

(declare-fun length!493 (List!997) Int)

(assert (=> b!296988 (= e!212556 (> (length!493 lt!433051) 0))))

(declare-fun d!100058 () Bool)

(assert (=> d!100058 e!212556))

(declare-fun c!13566 () Bool)

(assert (=> d!100058 (= c!13566 (= (bvsub to!474 from!505) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!100058 (= lt!433051 (_1!13097 e!212555))))

(declare-fun c!13565 () Bool)

(assert (=> d!100058 (= c!13565 (= (bvsub to!474 from!505) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!100058 (bvsge (bvsub to!474 from!505) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!100058 (= (bitStreamReadBitsIntoList!0 (_2!13092 lt!433001) thiss!1728 (bvsub to!474 from!505)) lt!433051)))

(declare-fun lt!433053 () (_ BitVec 64))

(declare-fun lt!433052 () tuple2!23362)

(declare-fun b!296986 () Bool)

(assert (=> b!296986 (= e!212555 (tuple2!23367 (Cons!993 (_1!13093 lt!433052) (bitStreamReadBitsIntoList!0 (_2!13092 lt!433001) (_2!13093 lt!433052) (bvsub (bvsub to!474 from!505) lt!433053))) (_2!13093 lt!433052)))))

(assert (=> b!296986 (= lt!433052 (readBit!0 thiss!1728))))

(assert (=> b!296986 (= lt!433053 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!296987 () Bool)

(declare-fun isEmpty!268 (List!997) Bool)

(assert (=> b!296987 (= e!212556 (isEmpty!268 lt!433051))))

(assert (= (and d!100058 c!13565) b!296985))

(assert (= (and d!100058 (not c!13565)) b!296986))

(assert (= (and d!100058 c!13566) b!296987))

(assert (= (and d!100058 (not c!13566)) b!296988))

(declare-fun m!435663 () Bool)

(assert (=> b!296988 m!435663))

(declare-fun m!435665 () Bool)

(assert (=> b!296986 m!435665))

(assert (=> b!296986 m!435593))

(declare-fun m!435667 () Bool)

(assert (=> b!296987 m!435667))

(assert (=> b!296934 d!100058))

(declare-fun d!100062 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!100062 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7697 (buf!7760 (_2!13093 lt!433002)))) ((_ sign_extend 32) (currentByte!14296 (_2!13093 lt!433002))) ((_ sign_extend 32) (currentBit!14291 (_2!13093 lt!433002))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7697 (buf!7760 (_2!13093 lt!433002)))) ((_ sign_extend 32) (currentByte!14296 (_2!13093 lt!433002))) ((_ sign_extend 32) (currentBit!14291 (_2!13093 lt!433002)))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!25592 () Bool)

(assert (= bs!25592 d!100062))

(declare-fun m!435669 () Bool)

(assert (=> bs!25592 m!435669))

(assert (=> b!296934 d!100062))

(declare-fun d!100064 () Bool)

(declare-fun e!212562 () Bool)

(assert (=> d!100064 e!212562))

(declare-fun res!245180 () Bool)

(assert (=> d!100064 (=> (not res!245180) (not e!212562))))

(declare-fun lt!433068 () (_ BitVec 32))

(assert (=> d!100064 (= res!245180 (and (bvsge lt!433068 #b00000000000000000000000000000000) (bvslt lt!433068 (size!7697 arr!273))))))

(declare-fun lt!433070 () (_ BitVec 32))

(declare-fun lt!433067 () (_ BitVec 8))

(declare-fun lt!433069 () Unit!20703)

(declare-fun choose!53 (array!17764 (_ BitVec 64) Bool (_ BitVec 32) (_ BitVec 32) (_ BitVec 8)) Unit!20703)

(assert (=> d!100064 (= lt!433069 (choose!53 arr!273 from!505 (_1!13093 lt!433002) lt!433068 lt!433070 lt!433067))))

(assert (=> d!100064 (= lt!433067 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8768 arr!273) lt!433068)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!433070)))) ((_ sign_extend 24) (ite (_1!13093 lt!433002) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!433070) #b00000000)))))))

(assert (=> d!100064 (= lt!433070 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> d!100064 (= lt!433068 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> d!100064 (= (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!13093 lt!433002)) lt!433069)))

(declare-fun b!296995 () Bool)

(assert (=> b!296995 (= e!212562 (arrayBitRangesEq!0 arr!273 (array!17765 (store (arr!8768 arr!273) lt!433068 lt!433067) (size!7697 arr!273)) #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (= (and d!100064 res!245180) b!296995))

(declare-fun m!435679 () Bool)

(assert (=> d!100064 m!435679))

(declare-fun m!435681 () Bool)

(assert (=> d!100064 m!435681))

(declare-fun m!435683 () Bool)

(assert (=> d!100064 m!435683))

(declare-fun m!435685 () Bool)

(assert (=> b!296995 m!435685))

(declare-fun m!435689 () Bool)

(assert (=> b!296995 m!435689))

(assert (=> b!296934 d!100064))

(declare-fun d!100072 () Bool)

(declare-fun e!212579 () Bool)

(assert (=> d!100072 e!212579))

(declare-fun res!245209 () Bool)

(assert (=> d!100072 (=> (not res!245209) (not e!212579))))

(declare-fun lt!433271 () tuple3!1910)

(declare-fun lt!433280 () (_ BitVec 64))

(assert (=> d!100072 (= res!245209 (= (bvsub lt!433280 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitIndex!0 (size!7697 (buf!7760 (_2!13092 lt!433271))) (currentByte!14296 (_2!13092 lt!433271)) (currentBit!14291 (_2!13092 lt!433271)))))))

(assert (=> d!100072 (or (= (bvand lt!433280 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!433280 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!433280 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!433217 () (_ BitVec 64))

(assert (=> d!100072 (= lt!433280 (bvadd lt!433217 to!474))))

(assert (=> d!100072 (or (not (= (bvand lt!433217 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!433217 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!433217 to!474) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!100072 (= lt!433217 (bitIndex!0 (size!7697 (buf!7760 (_2!13093 lt!433002))) (currentByte!14296 (_2!13093 lt!433002)) (currentBit!14291 (_2!13093 lt!433002))))))

(declare-fun e!212581 () tuple3!1910)

(assert (=> d!100072 (= lt!433271 e!212581)))

(declare-fun c!13572 () Bool)

(assert (=> d!100072 (= c!13572 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> d!100072 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!100072 (= (readBitsLoop!0 (_2!13093 lt!433002) nBits!523 lt!432997 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474) lt!433271)))

(declare-fun b!297032 () Bool)

(declare-fun res!245221 () Bool)

(assert (=> b!297032 (=> (not res!245221) (not e!212579))))

(assert (=> b!297032 (= res!245221 (invariant!0 (currentBit!14291 (_2!13092 lt!433271)) (currentByte!14296 (_2!13092 lt!433271)) (size!7697 (buf!7760 (_2!13092 lt!433271)))))))

(declare-fun b!297034 () Bool)

(declare-fun lt!433227 () Unit!20703)

(declare-fun lt!433233 () tuple3!1910)

(assert (=> b!297034 (= e!212581 (tuple3!1911 lt!433227 (_2!13092 lt!433233) (_3!1411 lt!433233)))))

(declare-fun lt!433262 () tuple2!23362)

(assert (=> b!297034 (= lt!433262 (readBit!0 (_2!13093 lt!433002)))))

(declare-fun lt!433236 () (_ BitVec 32))

(assert (=> b!297034 (= lt!433236 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!433268 () (_ BitVec 32))

(assert (=> b!297034 (= lt!433268 ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!433248 () array!17764)

(assert (=> b!297034 (= lt!433248 (array!17765 (store (arr!8768 lt!432997) lt!433236 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8768 lt!432997) lt!433236)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!433268)))) ((_ sign_extend 24) (ite (_1!13093 lt!433262) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!433268) #b00000000))))) (size!7697 lt!432997)))))

(declare-fun lt!433282 () (_ BitVec 64))

(assert (=> b!297034 (= lt!433282 (bvsub nBits!523 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun lt!433263 () (_ BitVec 64))

(assert (=> b!297034 (= lt!433263 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!433249 () Unit!20703)

(assert (=> b!297034 (= lt!433249 (validateOffsetBitsIneqLemma!0 (_2!13093 lt!433002) (_2!13093 lt!433262) lt!433282 lt!433263))))

(assert (=> b!297034 (validate_offset_bits!1 ((_ sign_extend 32) (size!7697 (buf!7760 (_2!13093 lt!433262)))) ((_ sign_extend 32) (currentByte!14296 (_2!13093 lt!433262))) ((_ sign_extend 32) (currentBit!14291 (_2!13093 lt!433262))) (bvsub lt!433282 lt!433263))))

(declare-fun lt!433231 () Unit!20703)

(assert (=> b!297034 (= lt!433231 lt!433249)))

(assert (=> b!297034 (= lt!433233 (readBitsLoop!0 (_2!13093 lt!433262) nBits!523 lt!433248 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001) to!474))))

(declare-fun res!245220 () Bool)

(assert (=> b!297034 (= res!245220 (= (bvsub (bvadd (bitIndex!0 (size!7697 (buf!7760 (_2!13093 lt!433002))) (currentByte!14296 (_2!13093 lt!433002)) (currentBit!14291 (_2!13093 lt!433002))) to!474) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitIndex!0 (size!7697 (buf!7760 (_2!13092 lt!433233))) (currentByte!14296 (_2!13092 lt!433233)) (currentBit!14291 (_2!13092 lt!433233)))))))

(declare-fun e!212582 () Bool)

(assert (=> b!297034 (=> (not res!245220) (not e!212582))))

(assert (=> b!297034 e!212582))

(declare-fun lt!433219 () Unit!20703)

(declare-fun Unit!20707 () Unit!20703)

(assert (=> b!297034 (= lt!433219 Unit!20707)))

(declare-fun lt!433241 () (_ BitVec 32))

(assert (=> b!297034 (= lt!433241 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!433257 () (_ BitVec 32))

(assert (=> b!297034 (= lt!433257 ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!433261 () Unit!20703)

(assert (=> b!297034 (= lt!433261 (arrayBitRangesUpdatedAtLemma!0 lt!432997 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (_1!13093 lt!433262)))))

(declare-fun call!5226 () Bool)

(assert (=> b!297034 call!5226))

(declare-fun lt!433255 () Unit!20703)

(assert (=> b!297034 (= lt!433255 lt!433261)))

(declare-fun lt!433246 () (_ BitVec 64))

(assert (=> b!297034 (= lt!433246 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!433279 () Unit!20703)

(assert (=> b!297034 (= lt!433279 (arrayBitRangesEqTransitive!0 lt!432997 lt!433248 (_3!1411 lt!433233) lt!433246 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!297034 (arrayBitRangesEq!0 lt!432997 (_3!1411 lt!433233) lt!433246 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))))

(declare-fun lt!433223 () Unit!20703)

(assert (=> b!297034 (= lt!433223 lt!433279)))

(declare-fun call!5228 () Bool)

(assert (=> b!297034 call!5228))

(declare-fun lt!433243 () Unit!20703)

(declare-fun Unit!20708 () Unit!20703)

(assert (=> b!297034 (= lt!433243 Unit!20708)))

(declare-fun lt!433221 () Unit!20703)

(assert (=> b!297034 (= lt!433221 (arrayBitRangesEqImpliesEq!0 lt!433248 (_3!1411 lt!433233) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!297034 (= (bitAt!0 lt!433248 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitAt!0 (_3!1411 lt!433233) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun lt!433229 () Unit!20703)

(assert (=> b!297034 (= lt!433229 lt!433221)))

(declare-fun lt!433275 () Unit!20703)

(declare-fun Unit!20709 () Unit!20703)

(assert (=> b!297034 (= lt!433275 Unit!20709)))

(declare-fun lt!433259 () Bool)

(assert (=> b!297034 (= lt!433259 (= (bitAt!0 (_3!1411 lt!433233) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (_1!13093 lt!433262)))))

(declare-fun Unit!20710 () Unit!20703)

(assert (=> b!297034 (= lt!433227 Unit!20710)))

(assert (=> b!297034 lt!433259))

(declare-fun lt!433228 () Unit!20703)

(declare-fun b!297036 () Bool)

(assert (=> b!297036 (= e!212581 (tuple3!1911 lt!433228 (_2!13093 lt!433002) lt!432997))))

(declare-fun lt!433265 () Unit!20703)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17764) Unit!20703)

(assert (=> b!297036 (= lt!433265 (arrayBitRangesEqReflexiveLemma!0 lt!432997))))

(assert (=> b!297036 call!5226))

(declare-fun lt!433244 () Unit!20703)

(assert (=> b!297036 (= lt!433244 lt!433265)))

(declare-fun lt!433225 () array!17764)

(assert (=> b!297036 (= lt!433225 lt!432997)))

(declare-fun lt!433277 () array!17764)

(assert (=> b!297036 (= lt!433277 lt!432997)))

(declare-fun lt!433251 () (_ BitVec 64))

(assert (=> b!297036 (= lt!433251 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!433238 () (_ BitVec 64))

(assert (=> b!297036 (= lt!433238 ((_ sign_extend 32) (size!7697 lt!432997)))))

(declare-fun lt!433283 () (_ BitVec 64))

(assert (=> b!297036 (= lt!433283 (bvmul lt!433238 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!433252 () (_ BitVec 64))

(assert (=> b!297036 (= lt!433252 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!433240 () (_ BitVec 64))

(assert (=> b!297036 (= lt!433240 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))))

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17764 array!17764 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20703)

(assert (=> b!297036 (= lt!433228 (arrayBitRangesEqSlicedLemma!0 lt!433225 lt!433277 lt!433251 lt!433283 lt!433252 lt!433240))))

(assert (=> b!297036 call!5228))

(declare-fun b!297037 () Bool)

(declare-fun res!245217 () Bool)

(assert (=> b!297037 (=> (not res!245217) (not e!212579))))

(assert (=> b!297037 (= res!245217 (and (= (buf!7760 (_2!13093 lt!433002)) (buf!7760 (_2!13092 lt!433271))) (= (size!7697 lt!432997) (size!7697 (_3!1411 lt!433271)))))))

(declare-fun bm!5223 () Bool)

(assert (=> bm!5223 (= call!5228 (arrayBitRangesEq!0 (ite c!13572 lt!432997 lt!433225) (ite c!13572 (_3!1411 lt!433233) lt!433277) (ite c!13572 #b0000000000000000000000000000000000000000000000000000000000000000 lt!433252) (ite c!13572 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) lt!433240)))))

(declare-fun b!297039 () Bool)

(declare-fun e!212584 () Bool)

(declare-datatypes ((tuple2!23368 0))(
  ( (tuple2!23369 (_1!13098 BitStream!13398) (_2!13098 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!13398) tuple2!23368)

(assert (=> b!297039 (= e!212584 (= (bitAt!0 (_3!1411 lt!433271) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (_2!13098 (readBitPure!0 (_2!13093 lt!433002)))))))

(declare-fun b!297041 () Bool)

(assert (=> b!297041 (= e!212582 (and (= (buf!7760 (_2!13093 lt!433002)) (buf!7760 (_2!13092 lt!433233))) (= (size!7697 lt!432997) (size!7697 (_3!1411 lt!433233)))))))

(declare-fun b!297043 () Bool)

(declare-fun res!245218 () Bool)

(assert (=> b!297043 (=> (not res!245218) (not e!212579))))

(assert (=> b!297043 (= res!245218 (arrayBitRangesEq!0 lt!432997 (_3!1411 lt!433271) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun b!297045 () Bool)

(declare-fun res!245210 () Bool)

(assert (=> b!297045 (=> (not res!245210) (not e!212579))))

(assert (=> b!297045 (= res!245210 e!212584)))

(declare-fun res!245216 () Bool)

(assert (=> b!297045 (=> res!245216 e!212584)))

(assert (=> b!297045 (= res!245216 (not (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474)))))

(declare-fun bm!5225 () Bool)

(assert (=> bm!5225 (= call!5226 (arrayBitRangesEq!0 lt!432997 (ite c!13572 (array!17765 (store (arr!8768 lt!432997) lt!433241 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8768 lt!432997) lt!433241)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!433257)))) ((_ sign_extend 24) (ite (_1!13093 lt!433262) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!433257) #b00000000))))) (size!7697 lt!432997)) lt!432997) #b0000000000000000000000000000000000000000000000000000000000000000 (ite c!13572 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvmul ((_ sign_extend 32) (size!7697 lt!432997)) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!297048 () Bool)

(assert (=> b!297048 (= e!212579 (= (byteArrayBitContentToList!0 (_2!13092 lt!433271) (_3!1411 lt!433271) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))) (bitStreamReadBitsIntoList!0 (_2!13092 lt!433271) (_2!13093 lt!433002) (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))))

(assert (=> b!297048 (or (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!297048 (or (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!100072 c!13572) b!297034))

(assert (= (and d!100072 (not c!13572)) b!297036))

(assert (= (and b!297034 res!245220) b!297041))

(assert (= (or b!297034 b!297036) bm!5223))

(assert (= (or b!297034 b!297036) bm!5225))

(assert (= (and d!100072 res!245209) b!297037))

(assert (= (and b!297037 res!245217) b!297043))

(assert (= (and b!297043 res!245218) b!297045))

(assert (= (and b!297045 (not res!245216)) b!297039))

(assert (= (and b!297045 res!245210) b!297032))

(assert (= (and b!297032 res!245221) b!297048))

(declare-fun m!435691 () Bool)

(assert (=> b!297048 m!435691))

(declare-fun m!435697 () Bool)

(assert (=> b!297048 m!435697))

(declare-fun m!435701 () Bool)

(assert (=> b!297034 m!435701))

(declare-fun m!435703 () Bool)

(assert (=> b!297034 m!435703))

(declare-fun m!435705 () Bool)

(assert (=> b!297034 m!435705))

(declare-fun m!435707 () Bool)

(assert (=> b!297034 m!435707))

(declare-fun m!435711 () Bool)

(assert (=> b!297034 m!435711))

(declare-fun m!435713 () Bool)

(assert (=> b!297034 m!435713))

(declare-fun m!435715 () Bool)

(assert (=> b!297034 m!435715))

(declare-fun m!435717 () Bool)

(assert (=> b!297034 m!435717))

(declare-fun m!435719 () Bool)

(assert (=> b!297034 m!435719))

(declare-fun m!435721 () Bool)

(assert (=> b!297034 m!435721))

(declare-fun m!435727 () Bool)

(assert (=> b!297034 m!435727))

(declare-fun m!435729 () Bool)

(assert (=> b!297034 m!435729))

(declare-fun m!435733 () Bool)

(assert (=> b!297034 m!435733))

(declare-fun m!435737 () Bool)

(assert (=> b!297034 m!435737))

(declare-fun m!435741 () Bool)

(assert (=> b!297034 m!435741))

(declare-fun m!435745 () Bool)

(assert (=> b!297039 m!435745))

(declare-fun m!435747 () Bool)

(assert (=> b!297039 m!435747))

(declare-fun m!435753 () Bool)

(assert (=> bm!5223 m!435753))

(declare-fun m!435757 () Bool)

(assert (=> b!297043 m!435757))

(declare-fun m!435761 () Bool)

(assert (=> b!297032 m!435761))

(declare-fun m!435763 () Bool)

(assert (=> b!297036 m!435763))

(declare-fun m!435765 () Bool)

(assert (=> b!297036 m!435765))

(declare-fun m!435769 () Bool)

(assert (=> d!100072 m!435769))

(assert (=> d!100072 m!435741))

(declare-fun m!435775 () Bool)

(assert (=> bm!5225 m!435775))

(declare-fun m!435779 () Bool)

(assert (=> bm!5225 m!435779))

(declare-fun m!435787 () Bool)

(assert (=> bm!5225 m!435787))

(declare-fun m!435805 () Bool)

(assert (=> bm!5225 m!435805))

(assert (=> b!296934 d!100072))

(declare-fun d!100080 () Bool)

(assert (=> d!100080 (= (bitAt!0 (_3!1411 lt!433001) from!505) (not (= (bvand ((_ sign_extend 24) (select (arr!8768 (_3!1411 lt!433001)) ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!25596 () Bool)

(assert (= bs!25596 d!100080))

(declare-fun m!435807 () Bool)

(assert (=> bs!25596 m!435807))

(declare-fun m!435809 () Bool)

(assert (=> bs!25596 m!435809))

(assert (=> b!296934 d!100080))

(declare-fun d!100082 () Bool)

(assert (=> d!100082 (= (bitAt!0 lt!432997 from!505) (not (= (bvand ((_ sign_extend 24) (select (arr!8768 lt!432997) ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!25597 () Bool)

(assert (= bs!25597 d!100082))

(declare-fun m!435811 () Bool)

(assert (=> bs!25597 m!435811))

(assert (=> bs!25597 m!435809))

(assert (=> b!296934 d!100082))

(declare-fun b!297054 () Bool)

(declare-fun res!245224 () Bool)

(declare-fun lt!433297 () (_ BitVec 32))

(assert (=> b!297054 (= res!245224 (= lt!433297 #b00000000000000000000000000000000))))

(declare-fun e!212594 () Bool)

(assert (=> b!297054 (=> res!245224 e!212594)))

(declare-fun e!212593 () Bool)

(assert (=> b!297054 (= e!212593 e!212594)))

(declare-fun b!297055 () Bool)

(declare-fun e!212590 () Bool)

(declare-fun call!5229 () Bool)

(assert (=> b!297055 (= e!212590 call!5229)))

(declare-fun b!297056 () Bool)

(declare-fun e!212589 () Bool)

(declare-fun e!212591 () Bool)

(assert (=> b!297056 (= e!212589 e!212591)))

(declare-fun res!245226 () Bool)

(assert (=> b!297056 (=> (not res!245226) (not e!212591))))

(declare-fun e!212592 () Bool)

(assert (=> b!297056 (= res!245226 e!212592)))

(declare-fun res!245225 () Bool)

(assert (=> b!297056 (=> res!245225 e!212592)))

(declare-fun lt!433298 () tuple4!912)

(assert (=> b!297056 (= res!245225 (bvsge (_1!13096 lt!433298) (_2!13096 lt!433298)))))

(assert (=> b!297056 (= lt!433297 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!433296 () (_ BitVec 32))

(assert (=> b!297056 (= lt!433296 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!297056 (= lt!433298 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(declare-fun b!297057 () Bool)

(assert (=> b!297057 (= e!212591 e!212590)))

(declare-fun c!13575 () Bool)

(assert (=> b!297057 (= c!13575 (= (_3!1413 lt!433298) (_4!456 lt!433298)))))

(declare-fun b!297058 () Bool)

(assert (=> b!297058 (= e!212594 (byteRangesEq!0 (select (arr!8768 arr!273) (_4!456 lt!433298)) (select (arr!8768 (_3!1411 lt!433001)) (_4!456 lt!433298)) #b00000000000000000000000000000000 lt!433297))))

(declare-fun bm!5226 () Bool)

(assert (=> bm!5226 (= call!5229 (byteRangesEq!0 (select (arr!8768 arr!273) (_3!1413 lt!433298)) (select (arr!8768 (_3!1411 lt!433001)) (_3!1413 lt!433298)) lt!433296 (ite c!13575 lt!433297 #b00000000000000000000000000001000)))))

(declare-fun b!297059 () Bool)

(assert (=> b!297059 (= e!212590 e!212593)))

(declare-fun res!245223 () Bool)

(assert (=> b!297059 (= res!245223 call!5229)))

(assert (=> b!297059 (=> (not res!245223) (not e!212593))))

(declare-fun d!100084 () Bool)

(declare-fun res!245227 () Bool)

(assert (=> d!100084 (=> res!245227 e!212589)))

(assert (=> d!100084 (= res!245227 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!100084 (= (arrayBitRangesEq!0 arr!273 (_3!1411 lt!433001) #b0000000000000000000000000000000000000000000000000000000000000000 from!505) e!212589)))

(declare-fun b!297060 () Bool)

(assert (=> b!297060 (= e!212592 (arrayRangesEq!1514 arr!273 (_3!1411 lt!433001) (_1!13096 lt!433298) (_2!13096 lt!433298)))))

(assert (= (and d!100084 (not res!245227)) b!297056))

(assert (= (and b!297056 (not res!245225)) b!297060))

(assert (= (and b!297056 res!245226) b!297057))

(assert (= (and b!297057 c!13575) b!297055))

(assert (= (and b!297057 (not c!13575)) b!297059))

(assert (= (and b!297059 res!245223) b!297054))

(assert (= (and b!297054 (not res!245224)) b!297058))

(assert (= (or b!297055 b!297059) bm!5226))

(assert (=> b!297056 m!435645))

(declare-fun m!435813 () Bool)

(assert (=> b!297058 m!435813))

(declare-fun m!435815 () Bool)

(assert (=> b!297058 m!435815))

(assert (=> b!297058 m!435813))

(assert (=> b!297058 m!435815))

(declare-fun m!435817 () Bool)

(assert (=> b!297058 m!435817))

(declare-fun m!435819 () Bool)

(assert (=> bm!5226 m!435819))

(declare-fun m!435821 () Bool)

(assert (=> bm!5226 m!435821))

(assert (=> bm!5226 m!435819))

(assert (=> bm!5226 m!435821))

(declare-fun m!435823 () Bool)

(assert (=> bm!5226 m!435823))

(declare-fun m!435825 () Bool)

(assert (=> b!297060 m!435825))

(assert (=> b!296934 d!100084))

(declare-fun d!100086 () Bool)

(assert (=> d!100086 (= (bitAt!0 lt!432997 from!505) (bitAt!0 (_3!1411 lt!433001) from!505))))

(declare-fun lt!433361 () Unit!20703)

(declare-fun choose!31 (array!17764 array!17764 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20703)

(assert (=> d!100086 (= lt!433361 (choose!31 lt!432997 (_3!1411 lt!433001) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!100086 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!100086 (= (arrayBitRangesEqImpliesEq!0 lt!432997 (_3!1411 lt!433001) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) lt!433361)))

(declare-fun bs!25598 () Bool)

(assert (= bs!25598 d!100086))

(assert (=> bs!25598 m!435571))

(assert (=> bs!25598 m!435595))

(declare-fun m!435827 () Bool)

(assert (=> bs!25598 m!435827))

(assert (=> b!296934 d!100086))

(declare-fun d!100088 () Bool)

(declare-fun e!212631 () Bool)

(assert (=> d!100088 e!212631))

(declare-fun res!245270 () Bool)

(assert (=> d!100088 (=> (not res!245270) (not e!212631))))

(declare-datatypes ((tuple2!23372 0))(
  ( (tuple2!23373 (_1!13100 Unit!20703) (_2!13100 BitStream!13398)) )
))
(declare-fun increaseBitIndex!0 (BitStream!13398) tuple2!23372)

(assert (=> d!100088 (= res!245270 (= (buf!7760 (_2!13100 (increaseBitIndex!0 thiss!1728))) (buf!7760 thiss!1728)))))

(declare-fun lt!433441 () Bool)

(assert (=> d!100088 (= lt!433441 (not (= (bvand ((_ sign_extend 24) (select (arr!8768 (buf!7760 thiss!1728)) (currentByte!14296 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14291 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!433443 () tuple2!23362)

(assert (=> d!100088 (= lt!433443 (tuple2!23363 (not (= (bvand ((_ sign_extend 24) (select (arr!8768 (buf!7760 thiss!1728)) (currentByte!14296 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14291 thiss!1728)))) #b00000000000000000000000000000000)) (_2!13100 (increaseBitIndex!0 thiss!1728))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!100088 (validate_offset_bit!0 ((_ sign_extend 32) (size!7697 (buf!7760 thiss!1728))) ((_ sign_extend 32) (currentByte!14296 thiss!1728)) ((_ sign_extend 32) (currentBit!14291 thiss!1728)))))

(assert (=> d!100088 (= (readBit!0 thiss!1728) lt!433443)))

(declare-fun lt!433439 () (_ BitVec 64))

(declare-fun b!297111 () Bool)

(declare-fun lt!433437 () (_ BitVec 64))

(assert (=> b!297111 (= e!212631 (= (bitIndex!0 (size!7697 (buf!7760 (_2!13100 (increaseBitIndex!0 thiss!1728)))) (currentByte!14296 (_2!13100 (increaseBitIndex!0 thiss!1728))) (currentBit!14291 (_2!13100 (increaseBitIndex!0 thiss!1728)))) (bvadd lt!433437 lt!433439)))))

(assert (=> b!297111 (or (not (= (bvand lt!433437 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!433439 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!433437 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!433437 lt!433439) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!297111 (= lt!433439 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!297111 (= lt!433437 (bitIndex!0 (size!7697 (buf!7760 thiss!1728)) (currentByte!14296 thiss!1728) (currentBit!14291 thiss!1728)))))

(declare-fun lt!433438 () Bool)

(assert (=> b!297111 (= lt!433438 (not (= (bvand ((_ sign_extend 24) (select (arr!8768 (buf!7760 thiss!1728)) (currentByte!14296 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14291 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!433440 () Bool)

(assert (=> b!297111 (= lt!433440 (not (= (bvand ((_ sign_extend 24) (select (arr!8768 (buf!7760 thiss!1728)) (currentByte!14296 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14291 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!433442 () Bool)

(assert (=> b!297111 (= lt!433442 (not (= (bvand ((_ sign_extend 24) (select (arr!8768 (buf!7760 thiss!1728)) (currentByte!14296 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14291 thiss!1728)))) #b00000000000000000000000000000000)))))

(assert (= (and d!100088 res!245270) b!297111))

(declare-fun m!435903 () Bool)

(assert (=> d!100088 m!435903))

(declare-fun m!435905 () Bool)

(assert (=> d!100088 m!435905))

(declare-fun m!435911 () Bool)

(assert (=> d!100088 m!435911))

(declare-fun m!435913 () Bool)

(assert (=> d!100088 m!435913))

(declare-fun m!435915 () Bool)

(assert (=> b!297111 m!435915))

(assert (=> b!297111 m!435911))

(assert (=> b!297111 m!435585))

(assert (=> b!297111 m!435903))

(assert (=> b!297111 m!435905))

(assert (=> b!296934 d!100088))

(declare-fun d!100096 () Bool)

(declare-fun e!212641 () Bool)

(assert (=> d!100096 e!212641))

(declare-fun res!245283 () Bool)

(assert (=> d!100096 (=> (not res!245283) (not e!212641))))

(declare-fun lt!433485 () (_ BitVec 64))

(declare-fun lt!433481 () (_ BitVec 64))

(declare-fun lt!433483 () (_ BitVec 64))

(assert (=> d!100096 (= res!245283 (= lt!433483 (bvsub lt!433485 lt!433481)))))

(assert (=> d!100096 (or (= (bvand lt!433485 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!433481 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!433485 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!433485 lt!433481) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!100096 (= lt!433481 (remainingBits!0 ((_ sign_extend 32) (size!7697 (buf!7760 (_2!13092 lt!433001)))) ((_ sign_extend 32) (currentByte!14296 (_2!13092 lt!433001))) ((_ sign_extend 32) (currentBit!14291 (_2!13092 lt!433001)))))))

(declare-fun lt!433482 () (_ BitVec 64))

(declare-fun lt!433480 () (_ BitVec 64))

(assert (=> d!100096 (= lt!433485 (bvmul lt!433482 lt!433480))))

(assert (=> d!100096 (or (= lt!433482 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!433480 (bvsdiv (bvmul lt!433482 lt!433480) lt!433482)))))

(assert (=> d!100096 (= lt!433480 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!100096 (= lt!433482 ((_ sign_extend 32) (size!7697 (buf!7760 (_2!13092 lt!433001)))))))

(assert (=> d!100096 (= lt!433483 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14296 (_2!13092 lt!433001))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14291 (_2!13092 lt!433001)))))))

(assert (=> d!100096 (invariant!0 (currentBit!14291 (_2!13092 lt!433001)) (currentByte!14296 (_2!13092 lt!433001)) (size!7697 (buf!7760 (_2!13092 lt!433001))))))

(assert (=> d!100096 (= (bitIndex!0 (size!7697 (buf!7760 (_2!13092 lt!433001))) (currentByte!14296 (_2!13092 lt!433001)) (currentBit!14291 (_2!13092 lt!433001))) lt!433483)))

(declare-fun b!297130 () Bool)

(declare-fun res!245284 () Bool)

(assert (=> b!297130 (=> (not res!245284) (not e!212641))))

(assert (=> b!297130 (= res!245284 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!433483))))

(declare-fun b!297131 () Bool)

(declare-fun lt!433484 () (_ BitVec 64))

(assert (=> b!297131 (= e!212641 (bvsle lt!433483 (bvmul lt!433484 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!297131 (or (= lt!433484 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!433484 #b0000000000000000000000000000000000000000000000000000000000001000) lt!433484)))))

(assert (=> b!297131 (= lt!433484 ((_ sign_extend 32) (size!7697 (buf!7760 (_2!13092 lt!433001)))))))

(assert (= (and d!100096 res!245283) b!297130))

(assert (= (and b!297130 res!245284) b!297131))

(declare-fun m!435923 () Bool)

(assert (=> d!100096 m!435923))

(declare-fun m!435925 () Bool)

(assert (=> d!100096 m!435925))

(assert (=> b!296934 d!100096))

(declare-fun d!100102 () Bool)

(declare-fun c!13588 () Bool)

(assert (=> d!100102 (= c!13588 (= (bvsub to!474 from!505) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!212650 () List!997)

(assert (=> d!100102 (= (byteArrayBitContentToList!0 (_2!13092 lt!433001) (_3!1411 lt!433001) from!505 (bvsub to!474 from!505)) e!212650)))

(declare-fun b!297146 () Bool)

(assert (=> b!297146 (= e!212650 Nil!994)))

(declare-fun b!297147 () Bool)

(assert (=> b!297147 (= e!212650 (Cons!993 (not (= (bvand ((_ sign_extend 24) (select (arr!8768 (_3!1411 lt!433001)) ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!13092 lt!433001) (_3!1411 lt!433001) (bvadd from!505 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!474 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!100102 c!13588) b!297146))

(assert (= (and d!100102 (not c!13588)) b!297147))

(assert (=> b!297147 m!435807))

(assert (=> b!297147 m!435809))

(declare-fun m!435943 () Bool)

(assert (=> b!297147 m!435943))

(assert (=> b!296934 d!100102))

(declare-fun d!100108 () Bool)

(declare-fun e!212651 () Bool)

(assert (=> d!100108 e!212651))

(declare-fun res!245288 () Bool)

(assert (=> d!100108 (=> (not res!245288) (not e!212651))))

(declare-fun lt!433506 () (_ BitVec 64))

(declare-fun lt!433504 () (_ BitVec 64))

(declare-fun lt!433502 () (_ BitVec 64))

(assert (=> d!100108 (= res!245288 (= lt!433504 (bvsub lt!433506 lt!433502)))))

(assert (=> d!100108 (or (= (bvand lt!433506 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!433502 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!433506 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!433506 lt!433502) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!100108 (= lt!433502 (remainingBits!0 ((_ sign_extend 32) (size!7697 (buf!7760 thiss!1728))) ((_ sign_extend 32) (currentByte!14296 thiss!1728)) ((_ sign_extend 32) (currentBit!14291 thiss!1728))))))

(declare-fun lt!433503 () (_ BitVec 64))

(declare-fun lt!433501 () (_ BitVec 64))

(assert (=> d!100108 (= lt!433506 (bvmul lt!433503 lt!433501))))

(assert (=> d!100108 (or (= lt!433503 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!433501 (bvsdiv (bvmul lt!433503 lt!433501) lt!433503)))))

(assert (=> d!100108 (= lt!433501 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!100108 (= lt!433503 ((_ sign_extend 32) (size!7697 (buf!7760 thiss!1728))))))

(assert (=> d!100108 (= lt!433504 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14296 thiss!1728)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14291 thiss!1728))))))

(assert (=> d!100108 (invariant!0 (currentBit!14291 thiss!1728) (currentByte!14296 thiss!1728) (size!7697 (buf!7760 thiss!1728)))))

(assert (=> d!100108 (= (bitIndex!0 (size!7697 (buf!7760 thiss!1728)) (currentByte!14296 thiss!1728) (currentBit!14291 thiss!1728)) lt!433504)))

(declare-fun b!297148 () Bool)

(declare-fun res!245289 () Bool)

(assert (=> b!297148 (=> (not res!245289) (not e!212651))))

(assert (=> b!297148 (= res!245289 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!433504))))

(declare-fun b!297149 () Bool)

(declare-fun lt!433505 () (_ BitVec 64))

(assert (=> b!297149 (= e!212651 (bvsle lt!433504 (bvmul lt!433505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!297149 (or (= lt!433505 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!433505 #b0000000000000000000000000000000000000000000000000000000000001000) lt!433505)))))

(assert (=> b!297149 (= lt!433505 ((_ sign_extend 32) (size!7697 (buf!7760 thiss!1728))))))

(assert (= (and d!100108 res!245288) b!297148))

(assert (= (and b!297148 res!245289) b!297149))

(declare-fun m!435947 () Bool)

(assert (=> d!100108 m!435947))

(assert (=> d!100108 m!435643))

(assert (=> b!296934 d!100108))

(declare-fun d!100112 () Bool)

(declare-fun e!212661 () Bool)

(assert (=> d!100112 e!212661))

(declare-fun res!245299 () Bool)

(assert (=> d!100112 (=> (not res!245299) (not e!212661))))

(assert (=> d!100112 (= res!245299 (or (= (bvand (bvsub nBits!523 from!505) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!523 from!505) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!433518 () Unit!20703)

(declare-fun choose!27 (BitStream!13398 BitStream!13398 (_ BitVec 64) (_ BitVec 64)) Unit!20703)

(assert (=> d!100112 (= lt!433518 (choose!27 thiss!1728 (_2!13093 lt!433002) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!100112 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!523 from!505)))))

(assert (=> d!100112 (= (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!13093 lt!433002) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001) lt!433518)))

(declare-fun b!297161 () Bool)

(assert (=> b!297161 (= e!212661 (validate_offset_bits!1 ((_ sign_extend 32) (size!7697 (buf!7760 (_2!13093 lt!433002)))) ((_ sign_extend 32) (currentByte!14296 (_2!13093 lt!433002))) ((_ sign_extend 32) (currentBit!14291 (_2!13093 lt!433002))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!100112 res!245299) b!297161))

(declare-fun m!435969 () Bool)

(assert (=> d!100112 m!435969))

(assert (=> b!297161 m!435579))

(assert (=> b!296934 d!100112))

(declare-fun d!100120 () Bool)

(assert (=> d!100120 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7697 (buf!7760 thiss!1728))) ((_ sign_extend 32) (currentByte!14296 thiss!1728)) ((_ sign_extend 32) (currentBit!14291 thiss!1728)) (bvsub nBits!523 from!505)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7697 (buf!7760 thiss!1728))) ((_ sign_extend 32) (currentByte!14296 thiss!1728)) ((_ sign_extend 32) (currentBit!14291 thiss!1728))) (bvsub nBits!523 from!505)))))

(declare-fun bs!25601 () Bool)

(assert (= bs!25601 d!100120))

(assert (=> bs!25601 m!435947))

(assert (=> b!296935 d!100120))

(declare-fun d!100122 () Bool)

(assert (=> d!100122 (= (array_inv!7309 (buf!7760 thiss!1728)) (bvsge (size!7697 (buf!7760 thiss!1728)) #b00000000000000000000000000000000))))

(assert (=> b!296933 d!100122))

(check-sat (not b!297032) (not b!297147) (not d!100120) (not d!100096) (not b!297034) (not b!296995) (not bm!5226) (not b!297048) (not d!100086) (not b!296986) (not b!297043) (not b!297039) (not bm!5223) (not b!297036) (not b!297060) (not d!100056) (not b!296974) (not b!296988) (not d!100072) (not b!297056) (not bm!5213) (not b!297058) (not d!100088) (not bm!5225) (not d!100050) (not b!296987) (not b!297161) (not d!100062) (not b!297111) (not b!296976) (not b!296972) (not d!100112) (not d!100064) (not d!100108))
(check-sat)
