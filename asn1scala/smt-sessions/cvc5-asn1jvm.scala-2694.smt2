; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65968 () Bool)

(assert start!65968)

(declare-datatypes ((array!17705 0))(
  ( (array!17706 (arr!8725 (Array (_ BitVec 32) (_ BitVec 8))) (size!7672 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13348 0))(
  ( (BitStream!13349 (buf!7735 array!17705) (currentByte!14250 (_ BitVec 32)) (currentBit!14245 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13348)

(declare-fun e!211565 () Bool)

(declare-fun arr!273 () array!17705)

(declare-datatypes ((Unit!20617 0))(
  ( (Unit!20618) )
))
(declare-datatypes ((tuple3!1860 0))(
  ( (tuple3!1861 (_1!13010 Unit!20617) (_2!13010 BitStream!13348) (_3!1377 array!17705)) )
))
(declare-fun lt!430545 () tuple3!1860)

(declare-fun b!295789 () Bool)

(assert (=> b!295789 (= e!211565 (and (= (buf!7735 thiss!1728) (buf!7735 (_2!13010 lt!430545))) (= (size!7672 arr!273) (size!7672 (_3!1377 lt!430545)))))))

(declare-fun b!295790 () Bool)

(declare-fun e!211568 () Bool)

(declare-fun array_inv!7284 (array!17705) Bool)

(assert (=> b!295790 (= e!211568 (array_inv!7284 (buf!7735 thiss!1728)))))

(declare-fun b!295791 () Bool)

(declare-fun e!211564 () Bool)

(declare-fun lt!430551 () Bool)

(declare-datatypes ((tuple2!23266 0))(
  ( (tuple2!23267 (_1!13011 Bool) (_2!13011 BitStream!13348)) )
))
(declare-fun lt!430540 () tuple2!23266)

(assert (=> b!295791 (= e!211564 (= lt!430551 (_1!13011 lt!430540)))))

(declare-fun b!295792 () Bool)

(declare-fun res!244208 () Bool)

(declare-fun e!211567 () Bool)

(assert (=> b!295792 (=> (not res!244208) (not e!211567))))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!295792 (= res!244208 (bvslt from!505 to!474))))

(declare-fun b!295793 () Bool)

(declare-fun lt!430539 () (_ BitVec 64))

(declare-fun lt!430542 () (_ BitVec 64))

(assert (=> b!295793 (= e!211567 (not (or (= lt!430539 (bvand from!505 #b1000000000000000000000000000000000000000000000000000000000000000)) (= lt!430539 (bvand lt!430542 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun lt!430549 () (_ BitVec 64))

(assert (=> b!295793 (= lt!430539 (bvand lt!430549 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!295793 e!211564))

(declare-fun res!244207 () Bool)

(assert (=> b!295793 (=> (not res!244207) (not e!211564))))

(declare-fun lt!430546 () array!17705)

(declare-fun bitAt!0 (array!17705 (_ BitVec 64)) Bool)

(assert (=> b!295793 (= res!244207 (= (bitAt!0 lt!430546 from!505) lt!430551))))

(assert (=> b!295793 (= lt!430551 (bitAt!0 (_3!1377 lt!430545) from!505))))

(declare-fun lt!430541 () Unit!20617)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!17705 array!17705 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20617)

(assert (=> b!295793 (= lt!430541 (arrayBitRangesEqImpliesEq!0 lt!430546 (_3!1377 lt!430545) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun arrayBitRangesEq!0 (array!17705 array!17705 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!295793 (arrayBitRangesEq!0 arr!273 (_3!1377 lt!430545) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!430547 () Unit!20617)

(declare-fun arrayBitRangesEqTransitive!0 (array!17705 array!17705 array!17705 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20617)

(assert (=> b!295793 (= lt!430547 (arrayBitRangesEqTransitive!0 arr!273 lt!430546 (_3!1377 lt!430545) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!295793 (arrayBitRangesEq!0 arr!273 lt!430546 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!430543 () Unit!20617)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17705 (_ BitVec 64) Bool) Unit!20617)

(assert (=> b!295793 (= lt!430543 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!13011 lt!430540)))))

(assert (=> b!295793 e!211565))

(declare-fun res!244211 () Bool)

(assert (=> b!295793 (=> (not res!244211) (not e!211565))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!295793 (= res!244211 (= lt!430542 (bitIndex!0 (size!7672 (buf!7735 (_2!13010 lt!430545))) (currentByte!14250 (_2!13010 lt!430545)) (currentBit!14245 (_2!13010 lt!430545)))))))

(assert (=> b!295793 (= lt!430542 (bvsub lt!430549 from!505))))

(assert (=> b!295793 (= lt!430549 (bvadd (bitIndex!0 (size!7672 (buf!7735 thiss!1728)) (currentByte!14250 thiss!1728) (currentBit!14245 thiss!1728)) to!474))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun readBitsLoop!0 (BitStream!13348 (_ BitVec 64) array!17705 (_ BitVec 64) (_ BitVec 64)) tuple3!1860)

(assert (=> b!295793 (= lt!430545 (readBitsLoop!0 (_2!13011 lt!430540) nBits!523 lt!430546 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!295793 (validate_offset_bits!1 ((_ sign_extend 32) (size!7672 (buf!7735 (_2!13011 lt!430540)))) ((_ sign_extend 32) (currentByte!14250 (_2!13011 lt!430540))) ((_ sign_extend 32) (currentBit!14245 (_2!13011 lt!430540))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!430544 () Unit!20617)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!13348 BitStream!13348 (_ BitVec 64) (_ BitVec 64)) Unit!20617)

(assert (=> b!295793 (= lt!430544 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!13011 lt!430540) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!430548 () (_ BitVec 32))

(declare-fun lt!430550 () (_ BitVec 32))

(assert (=> b!295793 (= lt!430546 (array!17706 (store (arr!8725 arr!273) lt!430548 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8725 arr!273) lt!430548)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!430550)))) ((_ sign_extend 24) (ite (_1!13011 lt!430540) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!430550) #b00000000))))) (size!7672 arr!273)))))

(assert (=> b!295793 (= lt!430550 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!295793 (= lt!430548 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!13348) tuple2!23266)

(assert (=> b!295793 (= lt!430540 (readBit!0 thiss!1728))))

(declare-fun b!295794 () Bool)

(declare-fun res!244209 () Bool)

(assert (=> b!295794 (=> (not res!244209) (not e!211567))))

(assert (=> b!295794 (= res!244209 (validate_offset_bits!1 ((_ sign_extend 32) (size!7672 (buf!7735 thiss!1728))) ((_ sign_extend 32) (currentByte!14250 thiss!1728)) ((_ sign_extend 32) (currentBit!14245 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun res!244210 () Bool)

(assert (=> start!65968 (=> (not res!244210) (not e!211567))))

(assert (=> start!65968 (= res!244210 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7672 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65968 e!211567))

(declare-fun inv!12 (BitStream!13348) Bool)

(assert (=> start!65968 (and (inv!12 thiss!1728) e!211568)))

(assert (=> start!65968 true))

(assert (=> start!65968 (array_inv!7284 arr!273)))

(assert (= (and start!65968 res!244210) b!295794))

(assert (= (and b!295794 res!244209) b!295792))

(assert (= (and b!295792 res!244208) b!295793))

(assert (= (and b!295793 res!244211) b!295789))

(assert (= (and b!295793 res!244207) b!295791))

(assert (= start!65968 b!295790))

(declare-fun m!433351 () Bool)

(assert (=> b!295790 m!433351))

(declare-fun m!433353 () Bool)

(assert (=> b!295793 m!433353))

(declare-fun m!433355 () Bool)

(assert (=> b!295793 m!433355))

(declare-fun m!433357 () Bool)

(assert (=> b!295793 m!433357))

(declare-fun m!433359 () Bool)

(assert (=> b!295793 m!433359))

(declare-fun m!433361 () Bool)

(assert (=> b!295793 m!433361))

(declare-fun m!433363 () Bool)

(assert (=> b!295793 m!433363))

(declare-fun m!433365 () Bool)

(assert (=> b!295793 m!433365))

(declare-fun m!433367 () Bool)

(assert (=> b!295793 m!433367))

(declare-fun m!433369 () Bool)

(assert (=> b!295793 m!433369))

(declare-fun m!433371 () Bool)

(assert (=> b!295793 m!433371))

(declare-fun m!433373 () Bool)

(assert (=> b!295793 m!433373))

(declare-fun m!433375 () Bool)

(assert (=> b!295793 m!433375))

(declare-fun m!433377 () Bool)

(assert (=> b!295793 m!433377))

(declare-fun m!433379 () Bool)

(assert (=> b!295793 m!433379))

(declare-fun m!433381 () Bool)

(assert (=> b!295793 m!433381))

(declare-fun m!433383 () Bool)

(assert (=> b!295793 m!433383))

(declare-fun m!433385 () Bool)

(assert (=> b!295794 m!433385))

(declare-fun m!433387 () Bool)

(assert (=> start!65968 m!433387))

(declare-fun m!433389 () Bool)

(assert (=> start!65968 m!433389))

(push 1)

(assert (not b!295794))

(assert (not b!295793))

(assert (not b!295790))

(assert (not start!65968))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!99734 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!99734 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7672 (buf!7735 thiss!1728))) ((_ sign_extend 32) (currentByte!14250 thiss!1728)) ((_ sign_extend 32) (currentBit!14245 thiss!1728)) (bvsub nBits!523 from!505)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7672 (buf!7735 thiss!1728))) ((_ sign_extend 32) (currentByte!14250 thiss!1728)) ((_ sign_extend 32) (currentBit!14245 thiss!1728))) (bvsub nBits!523 from!505)))))

(declare-fun bs!25502 () Bool)

(assert (= bs!25502 d!99734))

(declare-fun m!433499 () Bool)

(assert (=> bs!25502 m!433499))

(assert (=> b!295794 d!99734))

(declare-fun d!99736 () Bool)

(declare-fun e!211642 () Bool)

(assert (=> d!99736 e!211642))

(declare-fun res!244278 () Bool)

(assert (=> d!99736 (=> (not res!244278) (not e!211642))))

(declare-fun lt!430695 () (_ BitVec 32))

(assert (=> d!99736 (= res!244278 (and (bvsge lt!430695 #b00000000000000000000000000000000) (bvslt lt!430695 (size!7672 arr!273))))))

(declare-fun lt!430692 () (_ BitVec 8))

(declare-fun lt!430693 () (_ BitVec 32))

(declare-fun lt!430694 () Unit!20617)

(declare-fun choose!53 (array!17705 (_ BitVec 64) Bool (_ BitVec 32) (_ BitVec 32) (_ BitVec 8)) Unit!20617)

(assert (=> d!99736 (= lt!430694 (choose!53 arr!273 from!505 (_1!13011 lt!430540) lt!430695 lt!430693 lt!430692))))

(assert (=> d!99736 (= lt!430692 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8725 arr!273) lt!430695)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!430693)))) ((_ sign_extend 24) (ite (_1!13011 lt!430540) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!430693) #b00000000)))))))

(assert (=> d!99736 (= lt!430693 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> d!99736 (= lt!430695 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> d!99736 (= (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!13011 lt!430540)) lt!430694)))

(declare-fun b!295877 () Bool)

(assert (=> b!295877 (= e!211642 (arrayBitRangesEq!0 arr!273 (array!17706 (store (arr!8725 arr!273) lt!430695 lt!430692) (size!7672 arr!273)) #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (= (and d!99736 res!244278) b!295877))

(declare-fun m!433527 () Bool)

(assert (=> d!99736 m!433527))

(declare-fun m!433529 () Bool)

(assert (=> d!99736 m!433529))

(declare-fun m!433531 () Bool)

(assert (=> d!99736 m!433531))

(declare-fun m!433533 () Bool)

(assert (=> b!295877 m!433533))

(declare-fun m!433535 () Bool)

(assert (=> b!295877 m!433535))

(assert (=> b!295793 d!99736))

(declare-fun d!99744 () Bool)

(declare-fun e!211645 () Bool)

(assert (=> d!99744 e!211645))

(declare-fun res!244283 () Bool)

(assert (=> d!99744 (=> (not res!244283) (not e!211645))))

(declare-fun lt!430710 () (_ BitVec 64))

(declare-fun lt!430712 () (_ BitVec 64))

(declare-fun lt!430713 () (_ BitVec 64))

(assert (=> d!99744 (= res!244283 (= lt!430713 (bvsub lt!430712 lt!430710)))))

(assert (=> d!99744 (or (= (bvand lt!430712 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!430710 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!430712 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!430712 lt!430710) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!99744 (= lt!430710 (remainingBits!0 ((_ sign_extend 32) (size!7672 (buf!7735 thiss!1728))) ((_ sign_extend 32) (currentByte!14250 thiss!1728)) ((_ sign_extend 32) (currentBit!14245 thiss!1728))))))

(declare-fun lt!430709 () (_ BitVec 64))

(declare-fun lt!430708 () (_ BitVec 64))

(assert (=> d!99744 (= lt!430712 (bvmul lt!430709 lt!430708))))

(assert (=> d!99744 (or (= lt!430709 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!430708 (bvsdiv (bvmul lt!430709 lt!430708) lt!430709)))))

(assert (=> d!99744 (= lt!430708 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!99744 (= lt!430709 ((_ sign_extend 32) (size!7672 (buf!7735 thiss!1728))))))

(assert (=> d!99744 (= lt!430713 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14250 thiss!1728)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14245 thiss!1728))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!99744 (invariant!0 (currentBit!14245 thiss!1728) (currentByte!14250 thiss!1728) (size!7672 (buf!7735 thiss!1728)))))

(assert (=> d!99744 (= (bitIndex!0 (size!7672 (buf!7735 thiss!1728)) (currentByte!14250 thiss!1728) (currentBit!14245 thiss!1728)) lt!430713)))

(declare-fun b!295882 () Bool)

(declare-fun res!244284 () Bool)

(assert (=> b!295882 (=> (not res!244284) (not e!211645))))

(assert (=> b!295882 (= res!244284 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!430713))))

(declare-fun b!295883 () Bool)

(declare-fun lt!430711 () (_ BitVec 64))

(assert (=> b!295883 (= e!211645 (bvsle lt!430713 (bvmul lt!430711 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!295883 (or (= lt!430711 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!430711 #b0000000000000000000000000000000000000000000000000000000000001000) lt!430711)))))

(assert (=> b!295883 (= lt!430711 ((_ sign_extend 32) (size!7672 (buf!7735 thiss!1728))))))

(assert (= (and d!99744 res!244283) b!295882))

(assert (= (and b!295882 res!244284) b!295883))

(assert (=> d!99744 m!433499))

(declare-fun m!433537 () Bool)

(assert (=> d!99744 m!433537))

(assert (=> b!295793 d!99744))

(declare-fun d!99746 () Bool)

(declare-fun e!211646 () Bool)

(assert (=> d!99746 e!211646))

(declare-fun res!244285 () Bool)

(assert (=> d!99746 (=> (not res!244285) (not e!211646))))

(declare-fun lt!430716 () (_ BitVec 64))

(declare-fun lt!430719 () (_ BitVec 64))

(declare-fun lt!430718 () (_ BitVec 64))

(assert (=> d!99746 (= res!244285 (= lt!430719 (bvsub lt!430718 lt!430716)))))

(assert (=> d!99746 (or (= (bvand lt!430718 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!430716 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!430718 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!430718 lt!430716) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!99746 (= lt!430716 (remainingBits!0 ((_ sign_extend 32) (size!7672 (buf!7735 (_2!13010 lt!430545)))) ((_ sign_extend 32) (currentByte!14250 (_2!13010 lt!430545))) ((_ sign_extend 32) (currentBit!14245 (_2!13010 lt!430545)))))))

(declare-fun lt!430715 () (_ BitVec 64))

(declare-fun lt!430714 () (_ BitVec 64))

(assert (=> d!99746 (= lt!430718 (bvmul lt!430715 lt!430714))))

(assert (=> d!99746 (or (= lt!430715 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!430714 (bvsdiv (bvmul lt!430715 lt!430714) lt!430715)))))

(assert (=> d!99746 (= lt!430714 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!99746 (= lt!430715 ((_ sign_extend 32) (size!7672 (buf!7735 (_2!13010 lt!430545)))))))

(assert (=> d!99746 (= lt!430719 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14250 (_2!13010 lt!430545))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14245 (_2!13010 lt!430545)))))))

(assert (=> d!99746 (invariant!0 (currentBit!14245 (_2!13010 lt!430545)) (currentByte!14250 (_2!13010 lt!430545)) (size!7672 (buf!7735 (_2!13010 lt!430545))))))

(assert (=> d!99746 (= (bitIndex!0 (size!7672 (buf!7735 (_2!13010 lt!430545))) (currentByte!14250 (_2!13010 lt!430545)) (currentBit!14245 (_2!13010 lt!430545))) lt!430719)))

(declare-fun b!295884 () Bool)

(declare-fun res!244286 () Bool)

(assert (=> b!295884 (=> (not res!244286) (not e!211646))))

(assert (=> b!295884 (= res!244286 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!430719))))

(declare-fun b!295885 () Bool)

(declare-fun lt!430717 () (_ BitVec 64))

(assert (=> b!295885 (= e!211646 (bvsle lt!430719 (bvmul lt!430717 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!295885 (or (= lt!430717 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!430717 #b0000000000000000000000000000000000000000000000000000000000001000) lt!430717)))))

(assert (=> b!295885 (= lt!430717 ((_ sign_extend 32) (size!7672 (buf!7735 (_2!13010 lt!430545)))))))

(assert (= (and d!99746 res!244285) b!295884))

(assert (= (and b!295884 res!244286) b!295885))

(declare-fun m!433539 () Bool)

(assert (=> d!99746 m!433539))

(declare-fun m!433541 () Bool)

(assert (=> d!99746 m!433541))

(assert (=> b!295793 d!99746))

(declare-fun d!99748 () Bool)

(assert (=> d!99748 (= (bitAt!0 (_3!1377 lt!430545) from!505) (not (= (bvand ((_ sign_extend 24) (select (arr!8725 (_3!1377 lt!430545)) ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!25504 () Bool)

(assert (= bs!25504 d!99748))

(declare-fun m!433543 () Bool)

(assert (=> bs!25504 m!433543))

(declare-fun m!433545 () Bool)

(assert (=> bs!25504 m!433545))

(assert (=> b!295793 d!99748))

(declare-fun d!99750 () Bool)

(declare-fun e!211649 () Bool)

(assert (=> d!99750 e!211649))

(declare-fun res!244289 () Bool)

(assert (=> d!99750 (=> (not res!244289) (not e!211649))))

(assert (=> d!99750 (= res!244289 (or (= (bvand (bvsub nBits!523 from!505) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!523 from!505) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!430722 () Unit!20617)

(declare-fun choose!27 (BitStream!13348 BitStream!13348 (_ BitVec 64) (_ BitVec 64)) Unit!20617)

(assert (=> d!99750 (= lt!430722 (choose!27 thiss!1728 (_2!13011 lt!430540) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!99750 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!523 from!505)))))

(assert (=> d!99750 (= (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!13011 lt!430540) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001) lt!430722)))

(declare-fun b!295888 () Bool)

(assert (=> b!295888 (= e!211649 (validate_offset_bits!1 ((_ sign_extend 32) (size!7672 (buf!7735 (_2!13011 lt!430540)))) ((_ sign_extend 32) (currentByte!14250 (_2!13011 lt!430540))) ((_ sign_extend 32) (currentBit!14245 (_2!13011 lt!430540))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!99750 res!244289) b!295888))

(declare-fun m!433547 () Bool)

(assert (=> d!99750 m!433547))

(assert (=> b!295888 m!433373))

(assert (=> b!295793 d!99750))

(declare-fun d!99752 () Bool)

(declare-fun e!211656 () Bool)

(assert (=> d!99752 e!211656))

(declare-fun res!244292 () Bool)

(assert (=> d!99752 (=> (not res!244292) (not e!211656))))

(declare-datatypes ((tuple2!23276 0))(
  ( (tuple2!23277 (_1!13019 Unit!20617) (_2!13019 BitStream!13348)) )
))
(declare-fun increaseBitIndex!0 (BitStream!13348) tuple2!23276)

(assert (=> d!99752 (= res!244292 (= (buf!7735 (_2!13019 (increaseBitIndex!0 thiss!1728))) (buf!7735 thiss!1728)))))

(declare-fun lt!430737 () Bool)

(assert (=> d!99752 (= lt!430737 (not (= (bvand ((_ sign_extend 24) (select (arr!8725 (buf!7735 thiss!1728)) (currentByte!14250 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14245 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!430740 () tuple2!23266)

(assert (=> d!99752 (= lt!430740 (tuple2!23267 (not (= (bvand ((_ sign_extend 24) (select (arr!8725 (buf!7735 thiss!1728)) (currentByte!14250 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14245 thiss!1728)))) #b00000000000000000000000000000000)) (_2!13019 (increaseBitIndex!0 thiss!1728))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!99752 (validate_offset_bit!0 ((_ sign_extend 32) (size!7672 (buf!7735 thiss!1728))) ((_ sign_extend 32) (currentByte!14250 thiss!1728)) ((_ sign_extend 32) (currentBit!14245 thiss!1728)))))

(assert (=> d!99752 (= (readBit!0 thiss!1728) lt!430740)))

(declare-fun lt!430738 () (_ BitVec 64))

(declare-fun b!295891 () Bool)

(declare-fun lt!430743 () (_ BitVec 64))

(assert (=> b!295891 (= e!211656 (= (bitIndex!0 (size!7672 (buf!7735 (_2!13019 (increaseBitIndex!0 thiss!1728)))) (currentByte!14250 (_2!13019 (increaseBitIndex!0 thiss!1728))) (currentBit!14245 (_2!13019 (increaseBitIndex!0 thiss!1728)))) (bvadd lt!430738 lt!430743)))))

(assert (=> b!295891 (or (not (= (bvand lt!430738 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!430743 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!430738 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!430738 lt!430743) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!295891 (= lt!430743 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!295891 (= lt!430738 (bitIndex!0 (size!7672 (buf!7735 thiss!1728)) (currentByte!14250 thiss!1728) (currentBit!14245 thiss!1728)))))

(declare-fun lt!430741 () Bool)

(assert (=> b!295891 (= lt!430741 (not (= (bvand ((_ sign_extend 24) (select (arr!8725 (buf!7735 thiss!1728)) (currentByte!14250 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14245 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!430742 () Bool)

(assert (=> b!295891 (= lt!430742 (not (= (bvand ((_ sign_extend 24) (select (arr!8725 (buf!7735 thiss!1728)) (currentByte!14250 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14245 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!430739 () Bool)

(assert (=> b!295891 (= lt!430739 (not (= (bvand ((_ sign_extend 24) (select (arr!8725 (buf!7735 thiss!1728)) (currentByte!14250 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14245 thiss!1728)))) #b00000000000000000000000000000000)))))

(assert (= (and d!99752 res!244292) b!295891))

(declare-fun m!433549 () Bool)

(assert (=> d!99752 m!433549))

(declare-fun m!433551 () Bool)

(assert (=> d!99752 m!433551))

(declare-fun m!433553 () Bool)

(assert (=> d!99752 m!433553))

(declare-fun m!433555 () Bool)

(assert (=> d!99752 m!433555))

(declare-fun m!433557 () Bool)

(assert (=> b!295891 m!433557))

(assert (=> b!295891 m!433549))

(assert (=> b!295891 m!433377))

(assert (=> b!295891 m!433551))

(assert (=> b!295891 m!433553))

(assert (=> b!295793 d!99752))

(declare-fun d!99754 () Bool)

(assert (=> d!99754 (= (bitAt!0 lt!430546 from!505) (not (= (bvand ((_ sign_extend 24) (select (arr!8725 lt!430546) ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!25505 () Bool)

(assert (= bs!25505 d!99754))

(declare-fun m!433559 () Bool)

(assert (=> bs!25505 m!433559))

(assert (=> bs!25505 m!433545))

(assert (=> b!295793 d!99754))

(declare-fun b!295906 () Bool)

(declare-fun e!211670 () Bool)

(declare-fun e!211669 () Bool)

(assert (=> b!295906 (= e!211670 e!211669)))

(declare-fun res!244305 () Bool)

(assert (=> b!295906 (=> (not res!244305) (not e!211669))))

(declare-fun e!211673 () Bool)

(assert (=> b!295906 (= res!244305 e!211673)))

(declare-fun res!244303 () Bool)

(assert (=> b!295906 (=> res!244303 e!211673)))

(declare-datatypes ((tuple4!896 0))(
  ( (tuple4!897 (_1!13020 (_ BitVec 32)) (_2!13020 (_ BitVec 32)) (_3!1381 (_ BitVec 32)) (_4!448 (_ BitVec 32))) )
))
(declare-fun lt!430752 () tuple4!896)

(assert (=> b!295906 (= res!244303 (bvsge (_1!13020 lt!430752) (_2!13020 lt!430752)))))

(declare-fun lt!430750 () (_ BitVec 32))

(assert (=> b!295906 (= lt!430750 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!430751 () (_ BitVec 32))

(assert (=> b!295906 (= lt!430751 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!896)

(assert (=> b!295906 (= lt!430752 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(declare-fun b!295907 () Bool)

(declare-fun res!244307 () Bool)

(assert (=> b!295907 (= res!244307 (= lt!430750 #b00000000000000000000000000000000))))

(declare-fun e!211671 () Bool)

(assert (=> b!295907 (=> res!244307 e!211671)))

(declare-fun e!211674 () Bool)

(assert (=> b!295907 (= e!211674 e!211671)))

(declare-fun b!295908 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!295908 (= e!211671 (byteRangesEq!0 (select (arr!8725 arr!273) (_4!448 lt!430752)) (select (arr!8725 (_3!1377 lt!430545)) (_4!448 lt!430752)) #b00000000000000000000000000000000 lt!430750))))

(declare-fun d!99756 () Bool)

(declare-fun res!244304 () Bool)

(assert (=> d!99756 (=> res!244304 e!211670)))

(assert (=> d!99756 (= res!244304 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!99756 (= (arrayBitRangesEq!0 arr!273 (_3!1377 lt!430545) #b0000000000000000000000000000000000000000000000000000000000000000 from!505) e!211670)))

(declare-fun c!13501 () Bool)

(declare-fun call!5130 () Bool)

(declare-fun bm!5127 () Bool)

(assert (=> bm!5127 (= call!5130 (byteRangesEq!0 (select (arr!8725 arr!273) (_3!1381 lt!430752)) (select (arr!8725 (_3!1377 lt!430545)) (_3!1381 lt!430752)) lt!430751 (ite c!13501 lt!430750 #b00000000000000000000000000001000)))))

(declare-fun b!295909 () Bool)

(declare-fun e!211672 () Bool)

(assert (=> b!295909 (= e!211672 call!5130)))

(declare-fun b!295910 () Bool)

(assert (=> b!295910 (= e!211672 e!211674)))

(declare-fun res!244306 () Bool)

(assert (=> b!295910 (= res!244306 call!5130)))

(assert (=> b!295910 (=> (not res!244306) (not e!211674))))

(declare-fun b!295911 () Bool)

(declare-fun arrayRangesEq!1506 (array!17705 array!17705 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!295911 (= e!211673 (arrayRangesEq!1506 arr!273 (_3!1377 lt!430545) (_1!13020 lt!430752) (_2!13020 lt!430752)))))

(declare-fun b!295912 () Bool)

(assert (=> b!295912 (= e!211669 e!211672)))

(assert (=> b!295912 (= c!13501 (= (_3!1381 lt!430752) (_4!448 lt!430752)))))

(assert (= (and d!99756 (not res!244304)) b!295906))

(assert (= (and b!295906 (not res!244303)) b!295911))

(assert (= (and b!295906 res!244305) b!295912))

(assert (= (and b!295912 c!13501) b!295909))

(assert (= (and b!295912 (not c!13501)) b!295910))

(assert (= (and b!295910 res!244306) b!295907))

(assert (= (and b!295907 (not res!244307)) b!295908))

(assert (= (or b!295909 b!295910) bm!5127))

(declare-fun m!433561 () Bool)

(assert (=> b!295906 m!433561))

(declare-fun m!433563 () Bool)

(assert (=> b!295908 m!433563))

(declare-fun m!433565 () Bool)

(assert (=> b!295908 m!433565))

(assert (=> b!295908 m!433563))

(assert (=> b!295908 m!433565))

(declare-fun m!433567 () Bool)

(assert (=> b!295908 m!433567))

(declare-fun m!433569 () Bool)

(assert (=> bm!5127 m!433569))

(declare-fun m!433571 () Bool)

(assert (=> bm!5127 m!433571))

(assert (=> bm!5127 m!433569))

(assert (=> bm!5127 m!433571))

(declare-fun m!433573 () Bool)

(assert (=> bm!5127 m!433573))

(declare-fun m!433575 () Bool)

(assert (=> b!295911 m!433575))

(assert (=> b!295793 d!99756))

(declare-fun d!99762 () Bool)

(assert (=> d!99762 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7672 (buf!7735 (_2!13011 lt!430540)))) ((_ sign_extend 32) (currentByte!14250 (_2!13011 lt!430540))) ((_ sign_extend 32) (currentBit!14245 (_2!13011 lt!430540))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7672 (buf!7735 (_2!13011 lt!430540)))) ((_ sign_extend 32) (currentByte!14250 (_2!13011 lt!430540))) ((_ sign_extend 32) (currentBit!14245 (_2!13011 lt!430540)))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!25506 () Bool)

(assert (= bs!25506 d!99762))

(declare-fun m!433577 () Bool)

(assert (=> bs!25506 m!433577))

(assert (=> b!295793 d!99762))

(declare-fun d!99764 () Bool)

(assert (=> d!99764 (= (bitAt!0 lt!430546 from!505) (bitAt!0 (_3!1377 lt!430545) from!505))))

(declare-fun lt!430755 () Unit!20617)

(declare-fun choose!31 (array!17705 array!17705 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20617)

(assert (=> d!99764 (= lt!430755 (choose!31 lt!430546 (_3!1377 lt!430545) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!99764 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!99764 (= (arrayBitRangesEqImpliesEq!0 lt!430546 (_3!1377 lt!430545) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) lt!430755)))

(declare-fun bs!25507 () Bool)

(assert (= bs!25507 d!99764))

(assert (=> bs!25507 m!433363))

(assert (=> bs!25507 m!433353))

(declare-fun m!433579 () Bool)

(assert (=> bs!25507 m!433579))

(assert (=> b!295793 d!99764))

(declare-fun d!99766 () Bool)

(assert (=> d!99766 (arrayBitRangesEq!0 arr!273 (_3!1377 lt!430545) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!430758 () Unit!20617)

(declare-fun choose!49 (array!17705 array!17705 array!17705 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20617)

(assert (=> d!99766 (= lt!430758 (choose!49 arr!273 lt!430546 (_3!1377 lt!430545) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!99766 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!99766 (= (arrayBitRangesEqTransitive!0 arr!273 lt!430546 (_3!1377 lt!430545) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) lt!430758)))

(declare-fun bs!25508 () Bool)

(assert (= bs!25508 d!99766))

(assert (=> bs!25508 m!433379))

(declare-fun m!433581 () Bool)

(assert (=> bs!25508 m!433581))

(assert (=> b!295793 d!99766))

(declare-fun b!296007 () Bool)

(declare-fun res!244383 () Bool)

(declare-fun e!211743 () Bool)

(assert (=> b!296007 (=> (not res!244383) (not e!211743))))

(declare-fun e!211745 () Bool)

(assert (=> b!296007 (= res!244383 e!211745)))

(declare-fun res!244388 () Bool)

(assert (=> b!296007 (=> res!244388 e!211745)))

(assert (=> b!296007 (= res!244388 (not (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474)))))

(declare-fun lt!431045 () tuple3!1860)

(declare-fun b!296008 () Bool)

(declare-datatypes ((tuple2!23278 0))(
  ( (tuple2!23279 (_1!13021 BitStream!13348) (_2!13021 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!13348) tuple2!23278)

(assert (=> b!296008 (= e!211745 (= (bitAt!0 (_3!1377 lt!431045) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (_2!13021 (readBitPure!0 (_2!13011 lt!430540)))))))

(declare-fun b!296009 () Bool)

(declare-fun e!211744 () tuple3!1860)

(declare-fun lt!431075 () Unit!20617)

(declare-fun lt!431057 () tuple3!1860)

(assert (=> b!296009 (= e!211744 (tuple3!1861 lt!431075 (_2!13010 lt!431057) (_3!1377 lt!431057)))))

(declare-fun lt!431076 () tuple2!23266)

(assert (=> b!296009 (= lt!431076 (readBit!0 (_2!13011 lt!430540)))))

(declare-fun lt!431071 () (_ BitVec 32))

(assert (=> b!296009 (= lt!431071 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!431060 () (_ BitVec 32))

(assert (=> b!296009 (= lt!431060 ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!431069 () array!17705)

(assert (=> b!296009 (= lt!431069 (array!17706 (store (arr!8725 lt!430546) lt!431071 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8725 lt!430546) lt!431071)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!431060)))) ((_ sign_extend 24) (ite (_1!13011 lt!431076) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!431060) #b00000000))))) (size!7672 lt!430546)))))

(declare-fun lt!431070 () (_ BitVec 64))

(assert (=> b!296009 (= lt!431070 (bvsub nBits!523 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun lt!431055 () (_ BitVec 64))

(assert (=> b!296009 (= lt!431055 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!431052 () Unit!20617)

(assert (=> b!296009 (= lt!431052 (validateOffsetBitsIneqLemma!0 (_2!13011 lt!430540) (_2!13011 lt!431076) lt!431070 lt!431055))))

(assert (=> b!296009 (validate_offset_bits!1 ((_ sign_extend 32) (size!7672 (buf!7735 (_2!13011 lt!431076)))) ((_ sign_extend 32) (currentByte!14250 (_2!13011 lt!431076))) ((_ sign_extend 32) (currentBit!14245 (_2!13011 lt!431076))) (bvsub lt!431070 lt!431055))))

(declare-fun lt!431064 () Unit!20617)

(assert (=> b!296009 (= lt!431064 lt!431052)))

(assert (=> b!296009 (= lt!431057 (readBitsLoop!0 (_2!13011 lt!431076) nBits!523 lt!431069 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001) to!474))))

(declare-fun res!244389 () Bool)

(assert (=> b!296009 (= res!244389 (= (bvsub (bvadd (bitIndex!0 (size!7672 (buf!7735 (_2!13011 lt!430540))) (currentByte!14250 (_2!13011 lt!430540)) (currentBit!14245 (_2!13011 lt!430540))) to!474) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitIndex!0 (size!7672 (buf!7735 (_2!13010 lt!431057))) (currentByte!14250 (_2!13010 lt!431057)) (currentBit!14245 (_2!13010 lt!431057)))))))

(declare-fun e!211746 () Bool)

(assert (=> b!296009 (=> (not res!244389) (not e!211746))))

(assert (=> b!296009 e!211746))

(declare-fun lt!431073 () Unit!20617)

(declare-fun Unit!20627 () Unit!20617)

(assert (=> b!296009 (= lt!431073 Unit!20627)))

(declare-fun lt!431059 () (_ BitVec 32))

(assert (=> b!296009 (= lt!431059 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!431072 () (_ BitVec 32))

(assert (=> b!296009 (= lt!431072 ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!431042 () Unit!20617)

(assert (=> b!296009 (= lt!431042 (arrayBitRangesUpdatedAtLemma!0 lt!430546 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (_1!13011 lt!431076)))))

(declare-fun call!5146 () Bool)

(assert (=> b!296009 call!5146))

(declare-fun lt!431043 () Unit!20617)

(assert (=> b!296009 (= lt!431043 lt!431042)))

(declare-fun lt!431061 () (_ BitVec 64))

(assert (=> b!296009 (= lt!431061 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!431044 () Unit!20617)

(assert (=> b!296009 (= lt!431044 (arrayBitRangesEqTransitive!0 lt!430546 lt!431069 (_3!1377 lt!431057) lt!431061 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!296009 (arrayBitRangesEq!0 lt!430546 (_3!1377 lt!431057) lt!431061 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))))

(declare-fun lt!431063 () Unit!20617)

(assert (=> b!296009 (= lt!431063 lt!431044)))

(declare-fun call!5145 () Bool)

(assert (=> b!296009 call!5145))

(declare-fun lt!431048 () Unit!20617)

(declare-fun Unit!20628 () Unit!20617)

(assert (=> b!296009 (= lt!431048 Unit!20628)))

(declare-fun lt!431068 () Unit!20617)

(assert (=> b!296009 (= lt!431068 (arrayBitRangesEqImpliesEq!0 lt!431069 (_3!1377 lt!431057) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!296009 (= (bitAt!0 lt!431069 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitAt!0 (_3!1377 lt!431057) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun lt!431050 () Unit!20617)

(assert (=> b!296009 (= lt!431050 lt!431068)))

(declare-fun lt!431058 () Unit!20617)

(declare-fun Unit!20629 () Unit!20617)

(assert (=> b!296009 (= lt!431058 Unit!20629)))

(declare-fun lt!431067 () Bool)

(assert (=> b!296009 (= lt!431067 (= (bitAt!0 (_3!1377 lt!431057) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (_1!13011 lt!431076)))))

(declare-fun Unit!20630 () Unit!20617)

(assert (=> b!296009 (= lt!431075 Unit!20630)))

(assert (=> b!296009 lt!431067))

(declare-fun b!296011 () Bool)

(declare-fun res!244387 () Bool)

(assert (=> b!296011 (=> (not res!244387) (not e!211743))))

(assert (=> b!296011 (= res!244387 (invariant!0 (currentBit!14245 (_2!13010 lt!431045)) (currentByte!14250 (_2!13010 lt!431045)) (size!7672 (buf!7735 (_2!13010 lt!431045)))))))

(declare-fun lt!431046 () (_ BitVec 64))

(declare-fun lt!431053 () (_ BitVec 64))

(declare-fun lt!431056 () array!17705)

(declare-fun bm!5142 () Bool)

(declare-fun lt!431041 () array!17705)

(declare-fun c!13511 () Bool)

(assert (=> bm!5142 (= call!5145 (arrayBitRangesEq!0 (ite c!13511 lt!430546 lt!431056) (ite c!13511 (_3!1377 lt!431057) lt!431041) (ite c!13511 #b0000000000000000000000000000000000000000000000000000000000000000 lt!431046) (ite c!13511 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) lt!431053)))))

(declare-fun bm!5143 () Bool)

(assert (=> bm!5143 (= call!5146 (arrayBitRangesEq!0 lt!430546 (ite c!13511 (array!17706 (store (arr!8725 lt!430546) lt!431059 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8725 lt!430546) lt!431059)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!431072)))) ((_ sign_extend 24) (ite (_1!13011 lt!431076) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!431072) #b00000000))))) (size!7672 lt!430546)) lt!430546) #b0000000000000000000000000000000000000000000000000000000000000000 (ite c!13511 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvmul ((_ sign_extend 32) (size!7672 lt!430546)) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!296012 () Bool)

(declare-fun lt!431054 () Unit!20617)

(assert (=> b!296012 (= e!211744 (tuple3!1861 lt!431054 (_2!13011 lt!430540) lt!430546))))

(declare-fun lt!431051 () Unit!20617)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17705) Unit!20617)

(assert (=> b!296012 (= lt!431051 (arrayBitRangesEqReflexiveLemma!0 lt!430546))))

(assert (=> b!296012 call!5146))

(declare-fun lt!431049 () Unit!20617)

(assert (=> b!296012 (= lt!431049 lt!431051)))

(assert (=> b!296012 (= lt!431056 lt!430546)))

(assert (=> b!296012 (= lt!431041 lt!430546)))

(declare-fun lt!431047 () (_ BitVec 64))

(assert (=> b!296012 (= lt!431047 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!431074 () (_ BitVec 64))

(assert (=> b!296012 (= lt!431074 ((_ sign_extend 32) (size!7672 lt!430546)))))

(declare-fun lt!431065 () (_ BitVec 64))

(assert (=> b!296012 (= lt!431065 (bvmul lt!431074 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!296012 (= lt!431046 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!296012 (= lt!431053 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))))

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17705 array!17705 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20617)

(assert (=> b!296012 (= lt!431054 (arrayBitRangesEqSlicedLemma!0 lt!431056 lt!431041 lt!431047 lt!431065 lt!431046 lt!431053))))

(assert (=> b!296012 call!5145))

(declare-fun b!296013 () Bool)

(declare-fun res!244384 () Bool)

(assert (=> b!296013 (=> (not res!244384) (not e!211743))))

(assert (=> b!296013 (= res!244384 (and (= (buf!7735 (_2!13011 lt!430540)) (buf!7735 (_2!13010 lt!431045))) (= (size!7672 lt!430546) (size!7672 (_3!1377 lt!431045)))))))

(declare-fun b!296010 () Bool)

(assert (=> b!296010 (= e!211746 (and (= (buf!7735 (_2!13011 lt!430540)) (buf!7735 (_2!13010 lt!431057))) (= (size!7672 lt!430546) (size!7672 (_3!1377 lt!431057)))))))

(declare-fun d!99768 () Bool)

(assert (=> d!99768 e!211743))

(declare-fun res!244386 () Bool)

(assert (=> d!99768 (=> (not res!244386) (not e!211743))))

(declare-fun lt!431062 () (_ BitVec 64))

(assert (=> d!99768 (= res!244386 (= (bvsub lt!431062 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitIndex!0 (size!7672 (buf!7735 (_2!13010 lt!431045))) (currentByte!14250 (_2!13010 lt!431045)) (currentBit!14245 (_2!13010 lt!431045)))))))

(assert (=> d!99768 (or (= (bvand lt!431062 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!431062 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!431062 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!431066 () (_ BitVec 64))

(assert (=> d!99768 (= lt!431062 (bvadd lt!431066 to!474))))

(assert (=> d!99768 (or (not (= (bvand lt!431066 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!431066 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!431066 to!474) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!99768 (= lt!431066 (bitIndex!0 (size!7672 (buf!7735 (_2!13011 lt!430540))) (currentByte!14250 (_2!13011 lt!430540)) (currentBit!14245 (_2!13011 lt!430540))))))

(assert (=> d!99768 (= lt!431045 e!211744)))

(assert (=> d!99768 (= c!13511 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> d!99768 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!99768 (= (readBitsLoop!0 (_2!13011 lt!430540) nBits!523 lt!430546 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474) lt!431045)))

(declare-fun b!296014 () Bool)

(declare-fun res!244385 () Bool)

(assert (=> b!296014 (=> (not res!244385) (not e!211743))))

(assert (=> b!296014 (= res!244385 (arrayBitRangesEq!0 lt!430546 (_3!1377 lt!431045) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun b!296015 () Bool)

(declare-datatypes ((List!988 0))(
  ( (Nil!985) (Cons!984 (h!1103 Bool) (t!1873 List!988)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!13348 array!17705 (_ BitVec 64) (_ BitVec 64)) List!988)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!13348 BitStream!13348 (_ BitVec 64)) List!988)

(assert (=> b!296015 (= e!211743 (= (byteArrayBitContentToList!0 (_2!13010 lt!431045) (_3!1377 lt!431045) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))) (bitStreamReadBitsIntoList!0 (_2!13010 lt!431045) (_2!13011 lt!430540) (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))))

(assert (=> b!296015 (or (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!296015 (or (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!99768 c!13511) b!296009))

(assert (= (and d!99768 (not c!13511)) b!296012))

(assert (= (and b!296009 res!244389) b!296010))

(assert (= (or b!296009 b!296012) bm!5142))

(assert (= (or b!296009 b!296012) bm!5143))

(assert (= (and d!99768 res!244386) b!296013))

(assert (= (and b!296013 res!244384) b!296014))

(assert (= (and b!296014 res!244385) b!296007))

(assert (= (and b!296007 (not res!244388)) b!296008))

(assert (= (and b!296007 res!244383) b!296011))

(assert (= (and b!296011 res!244387) b!296015))

(declare-fun m!433731 () Bool)

(assert (=> b!296008 m!433731))

(declare-fun m!433733 () Bool)

(assert (=> b!296008 m!433733))

(declare-fun m!433735 () Bool)

(assert (=> b!296012 m!433735))

(declare-fun m!433737 () Bool)

(assert (=> b!296012 m!433737))

(declare-fun m!433739 () Bool)

(assert (=> b!296014 m!433739))

(declare-fun m!433741 () Bool)

(assert (=> b!296015 m!433741))

(declare-fun m!433743 () Bool)

(assert (=> b!296015 m!433743))

(declare-fun m!433745 () Bool)

(assert (=> b!296011 m!433745))

(declare-fun m!433747 () Bool)

(assert (=> d!99768 m!433747))

(declare-fun m!433749 () Bool)

(assert (=> d!99768 m!433749))

(declare-fun m!433751 () Bool)

(assert (=> bm!5143 m!433751))

(declare-fun m!433753 () Bool)

(assert (=> bm!5143 m!433753))

(declare-fun m!433755 () Bool)

(assert (=> bm!5143 m!433755))

(declare-fun m!433757 () Bool)

(assert (=> bm!5143 m!433757))

(declare-fun m!433759 () Bool)

(assert (=> b!296009 m!433759))

(declare-fun m!433761 () Bool)

(assert (=> b!296009 m!433761))

(declare-fun m!433763 () Bool)

(assert (=> b!296009 m!433763))

(declare-fun m!433765 () Bool)

(assert (=> b!296009 m!433765))

(declare-fun m!433767 () Bool)

(assert (=> b!296009 m!433767))

(declare-fun m!433769 () Bool)

(assert (=> b!296009 m!433769))

(declare-fun m!433771 () Bool)

(assert (=> b!296009 m!433771))

(assert (=> b!296009 m!433749))

(declare-fun m!433773 () Bool)

(assert (=> b!296009 m!433773))

(declare-fun m!433775 () Bool)

(assert (=> b!296009 m!433775))

(declare-fun m!433777 () Bool)

(assert (=> b!296009 m!433777))

(declare-fun m!433779 () Bool)

(assert (=> b!296009 m!433779))

(declare-fun m!433781 () Bool)

(assert (=> b!296009 m!433781))

(declare-fun m!433783 () Bool)

(assert (=> b!296009 m!433783))

(declare-fun m!433785 () Bool)

(assert (=> b!296009 m!433785))

(declare-fun m!433787 () Bool)

(assert (=> bm!5142 m!433787))

(assert (=> b!295793 d!99768))

(declare-fun b!296016 () Bool)

(declare-fun e!211748 () Bool)

(declare-fun e!211747 () Bool)

(assert (=> b!296016 (= e!211748 e!211747)))

(declare-fun res!244392 () Bool)

(assert (=> b!296016 (=> (not res!244392) (not e!211747))))

(declare-fun e!211751 () Bool)

(assert (=> b!296016 (= res!244392 e!211751)))

(declare-fun res!244390 () Bool)

(assert (=> b!296016 (=> res!244390 e!211751)))

(declare-fun lt!431079 () tuple4!896)

(assert (=> b!296016 (= res!244390 (bvsge (_1!13020 lt!431079) (_2!13020 lt!431079)))))

(declare-fun lt!431077 () (_ BitVec 32))

(assert (=> b!296016 (= lt!431077 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!431078 () (_ BitVec 32))

(assert (=> b!296016 (= lt!431078 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!296016 (= lt!431079 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(declare-fun b!296017 () Bool)

(declare-fun res!244394 () Bool)

(assert (=> b!296017 (= res!244394 (= lt!431077 #b00000000000000000000000000000000))))

(declare-fun e!211749 () Bool)

(assert (=> b!296017 (=> res!244394 e!211749)))

(declare-fun e!211752 () Bool)

(assert (=> b!296017 (= e!211752 e!211749)))

(declare-fun b!296018 () Bool)

(assert (=> b!296018 (= e!211749 (byteRangesEq!0 (select (arr!8725 arr!273) (_4!448 lt!431079)) (select (arr!8725 lt!430546) (_4!448 lt!431079)) #b00000000000000000000000000000000 lt!431077))))

(declare-fun d!99804 () Bool)

(declare-fun res!244391 () Bool)

(assert (=> d!99804 (=> res!244391 e!211748)))

(assert (=> d!99804 (= res!244391 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!99804 (= (arrayBitRangesEq!0 arr!273 lt!430546 #b0000000000000000000000000000000000000000000000000000000000000000 from!505) e!211748)))

(declare-fun bm!5144 () Bool)

(declare-fun c!13512 () Bool)

(declare-fun call!5147 () Bool)

(assert (=> bm!5144 (= call!5147 (byteRangesEq!0 (select (arr!8725 arr!273) (_3!1381 lt!431079)) (select (arr!8725 lt!430546) (_3!1381 lt!431079)) lt!431078 (ite c!13512 lt!431077 #b00000000000000000000000000001000)))))

(declare-fun b!296019 () Bool)

(declare-fun e!211750 () Bool)

(assert (=> b!296019 (= e!211750 call!5147)))

(declare-fun b!296020 () Bool)

(assert (=> b!296020 (= e!211750 e!211752)))

(declare-fun res!244393 () Bool)

(assert (=> b!296020 (= res!244393 call!5147)))

(assert (=> b!296020 (=> (not res!244393) (not e!211752))))

(declare-fun b!296021 () Bool)

(assert (=> b!296021 (= e!211751 (arrayRangesEq!1506 arr!273 lt!430546 (_1!13020 lt!431079) (_2!13020 lt!431079)))))

(declare-fun b!296022 () Bool)

(assert (=> b!296022 (= e!211747 e!211750)))

(assert (=> b!296022 (= c!13512 (= (_3!1381 lt!431079) (_4!448 lt!431079)))))

(assert (= (and d!99804 (not res!244391)) b!296016))

(assert (= (and b!296016 (not res!244390)) b!296021))

(assert (= (and b!296016 res!244392) b!296022))

(assert (= (and b!296022 c!13512) b!296019))

(assert (= (and b!296022 (not c!13512)) b!296020))

(assert (= (and b!296020 res!244393) b!296017))

(assert (= (and b!296017 (not res!244394)) b!296018))

(assert (= (or b!296019 b!296020) bm!5144))

(assert (=> b!296016 m!433561))

(declare-fun m!433789 () Bool)

(assert (=> b!296018 m!433789))

(declare-fun m!433791 () Bool)

(assert (=> b!296018 m!433791))

(assert (=> b!296018 m!433789))

(assert (=> b!296018 m!433791))

(declare-fun m!433793 () Bool)

(assert (=> b!296018 m!433793))

(declare-fun m!433795 () Bool)

(assert (=> bm!5144 m!433795))

(declare-fun m!433797 () Bool)

(assert (=> bm!5144 m!433797))

(assert (=> bm!5144 m!433795))

(assert (=> bm!5144 m!433797))

(declare-fun m!433799 () Bool)

(assert (=> bm!5144 m!433799))

(declare-fun m!433801 () Bool)

(assert (=> b!296021 m!433801))

(assert (=> b!295793 d!99804))

(declare-fun d!99806 () Bool)

(assert (=> d!99806 (= (array_inv!7284 (buf!7735 thiss!1728)) (bvsge (size!7672 (buf!7735 thiss!1728)) #b00000000000000000000000000000000))))

(assert (=> b!295790 d!99806))

(declare-fun d!99808 () Bool)

(assert (=> d!99808 (= (inv!12 thiss!1728) (invariant!0 (currentBit!14245 thiss!1728) (currentByte!14250 thiss!1728) (size!7672 (buf!7735 thiss!1728))))))

(declare-fun bs!25518 () Bool)

(assert (= bs!25518 d!99808))

(assert (=> bs!25518 m!433537))

(assert (=> start!65968 d!99808))

(declare-fun d!99810 () Bool)

(assert (=> d!99810 (= (array_inv!7284 arr!273) (bvsge (size!7672 arr!273) #b00000000000000000000000000000000))))

(assert (=> start!65968 d!99810))

(push 1)

(assert (not b!296021))

(assert (not b!296015))

(assert (not bm!5144))

(assert (not bm!5127))

(assert (not d!99746))

(assert (not b!295891))

(assert (not d!99752))

(assert (not b!295908))

(assert (not b!296011))

(assert (not d!99768))

(assert (not b!295911))

(assert (not b!296008))

(assert (not d!99736))

(assert (not b!296009))

(assert (not d!99744))

(assert (not d!99734))

(assert (not b!295877))

(assert (not d!99762))

(assert (not d!99766))

(assert (not b!296016))

(assert (not d!99764))

(assert (not b!295888))

(assert (not b!296018))

(assert (not b!295906))

(assert (not d!99808))

(assert (not bm!5142))

(assert (not bm!5143))

(assert (not b!296012))

(assert (not b!296014))

(assert (not d!99750))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

