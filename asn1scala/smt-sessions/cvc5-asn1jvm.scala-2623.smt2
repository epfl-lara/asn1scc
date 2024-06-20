; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64732 () Bool)

(assert start!64732)

(declare-fun res!240056 () Bool)

(declare-fun e!206976 () Bool)

(assert (=> start!64732 (=> (not res!240056) (not e!206976))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-datatypes ((array!17246 0))(
  ( (array!17247 (arr!8473 (Array (_ BitVec 32) (_ BitVec 8))) (size!7465 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17246)

(assert (=> start!64732 (= res!240056 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7465 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64732 e!206976))

(declare-datatypes ((BitStream!12940 0))(
  ( (BitStream!12941 (buf!7531 array!17246) (currentByte!13947 (_ BitVec 32)) (currentBit!13942 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12940)

(declare-fun e!206974 () Bool)

(declare-fun inv!12 (BitStream!12940) Bool)

(assert (=> start!64732 (and (inv!12 thiss!1728) e!206974)))

(assert (=> start!64732 true))

(declare-fun array_inv!7077 (array!17246) Bool)

(assert (=> start!64732 (array_inv!7077 arr!273)))

(declare-fun b!290578 () Bool)

(declare-fun res!240058 () Bool)

(assert (=> b!290578 (=> (not res!240058) (not e!206976))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!290578 (= res!240058 (validate_offset_bits!1 ((_ sign_extend 32) (size!7465 (buf!7531 thiss!1728))) ((_ sign_extend 32) (currentByte!13947 thiss!1728)) ((_ sign_extend 32) (currentBit!13942 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!290579 () Bool)

(declare-fun res!240057 () Bool)

(assert (=> b!290579 (=> (not res!240057) (not e!206976))))

(assert (=> b!290579 (= res!240057 (bvslt from!505 to!474))))

(declare-fun b!290580 () Bool)

(declare-datatypes ((Unit!20183 0))(
  ( (Unit!20184) )
))
(declare-datatypes ((tuple3!1674 0))(
  ( (tuple3!1675 (_1!12661 Unit!20183) (_2!12661 BitStream!12940) (_3!1254 array!17246)) )
))
(declare-fun lt!421748 () tuple3!1674)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!290580 (= e!206976 (not (invariant!0 (currentBit!13942 (_2!12661 lt!421748)) (currentByte!13947 (_2!12661 lt!421748)) (size!7465 (buf!7531 (_2!12661 lt!421748))))))))

(declare-fun e!206977 () Bool)

(assert (=> b!290580 e!206977))

(declare-fun res!240059 () Bool)

(assert (=> b!290580 (=> (not res!240059) (not e!206977))))

(declare-fun lt!421747 () array!17246)

(declare-fun lt!421744 () Bool)

(declare-fun bitAt!0 (array!17246 (_ BitVec 64)) Bool)

(assert (=> b!290580 (= res!240059 (= (bitAt!0 lt!421747 from!505) lt!421744))))

(assert (=> b!290580 (= lt!421744 (bitAt!0 (_3!1254 lt!421748) from!505))))

(declare-fun lt!421742 () Unit!20183)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!17246 array!17246 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20183)

(assert (=> b!290580 (= lt!421742 (arrayBitRangesEqImpliesEq!0 lt!421747 (_3!1254 lt!421748) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun arrayBitRangesEq!0 (array!17246 array!17246 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!290580 (arrayBitRangesEq!0 arr!273 (_3!1254 lt!421748) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!421745 () Unit!20183)

(declare-fun arrayBitRangesEqTransitive!0 (array!17246 array!17246 array!17246 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20183)

(assert (=> b!290580 (= lt!421745 (arrayBitRangesEqTransitive!0 arr!273 lt!421747 (_3!1254 lt!421748) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!290580 (arrayBitRangesEq!0 arr!273 lt!421747 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!421746 () Unit!20183)

(declare-datatypes ((tuple2!22814 0))(
  ( (tuple2!22815 (_1!12662 Bool) (_2!12662 BitStream!12940)) )
))
(declare-fun lt!421741 () tuple2!22814)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17246 (_ BitVec 64) Bool) Unit!20183)

(assert (=> b!290580 (= lt!421746 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12662 lt!421741)))))

(declare-fun e!206975 () Bool)

(assert (=> b!290580 e!206975))

(declare-fun res!240055 () Bool)

(assert (=> b!290580 (=> (not res!240055) (not e!206975))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!290580 (= res!240055 (= (bvsub (bvadd (bitIndex!0 (size!7465 (buf!7531 thiss!1728)) (currentByte!13947 thiss!1728) (currentBit!13942 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7465 (buf!7531 (_2!12661 lt!421748))) (currentByte!13947 (_2!12661 lt!421748)) (currentBit!13942 (_2!12661 lt!421748)))))))

(declare-fun readBitsLoop!0 (BitStream!12940 (_ BitVec 64) array!17246 (_ BitVec 64) (_ BitVec 64)) tuple3!1674)

(assert (=> b!290580 (= lt!421748 (readBitsLoop!0 (_2!12662 lt!421741) nBits!523 lt!421747 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!290580 (validate_offset_bits!1 ((_ sign_extend 32) (size!7465 (buf!7531 (_2!12662 lt!421741)))) ((_ sign_extend 32) (currentByte!13947 (_2!12662 lt!421741))) ((_ sign_extend 32) (currentBit!13942 (_2!12662 lt!421741))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!421740 () Unit!20183)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12940 BitStream!12940 (_ BitVec 64) (_ BitVec 64)) Unit!20183)

(assert (=> b!290580 (= lt!421740 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12662 lt!421741) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!421743 () (_ BitVec 32))

(declare-fun lt!421749 () (_ BitVec 32))

(assert (=> b!290580 (= lt!421747 (array!17247 (store (arr!8473 arr!273) lt!421749 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8473 arr!273) lt!421749)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!421743)))) ((_ sign_extend 24) (ite (_1!12662 lt!421741) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!421743) #b00000000))))) (size!7465 arr!273)))))

(assert (=> b!290580 (= lt!421743 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!290580 (= lt!421749 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!12940) tuple2!22814)

(assert (=> b!290580 (= lt!421741 (readBit!0 thiss!1728))))

(declare-fun b!290581 () Bool)

(assert (=> b!290581 (= e!206974 (array_inv!7077 (buf!7531 thiss!1728)))))

(declare-fun b!290582 () Bool)

(assert (=> b!290582 (= e!206977 (= lt!421744 (_1!12662 lt!421741)))))

(declare-fun b!290583 () Bool)

(assert (=> b!290583 (= e!206975 (and (= (buf!7531 thiss!1728) (buf!7531 (_2!12661 lt!421748))) (= (size!7465 arr!273) (size!7465 (_3!1254 lt!421748)))))))

(assert (= (and start!64732 res!240056) b!290578))

(assert (= (and b!290578 res!240058) b!290579))

(assert (= (and b!290579 res!240057) b!290580))

(assert (= (and b!290580 res!240055) b!290583))

(assert (= (and b!290580 res!240059) b!290582))

(assert (= start!64732 b!290581))

(declare-fun m!424765 () Bool)

(assert (=> start!64732 m!424765))

(declare-fun m!424767 () Bool)

(assert (=> start!64732 m!424767))

(declare-fun m!424769 () Bool)

(assert (=> b!290578 m!424769))

(declare-fun m!424771 () Bool)

(assert (=> b!290580 m!424771))

(declare-fun m!424773 () Bool)

(assert (=> b!290580 m!424773))

(declare-fun m!424775 () Bool)

(assert (=> b!290580 m!424775))

(declare-fun m!424777 () Bool)

(assert (=> b!290580 m!424777))

(declare-fun m!424779 () Bool)

(assert (=> b!290580 m!424779))

(declare-fun m!424781 () Bool)

(assert (=> b!290580 m!424781))

(declare-fun m!424783 () Bool)

(assert (=> b!290580 m!424783))

(declare-fun m!424785 () Bool)

(assert (=> b!290580 m!424785))

(declare-fun m!424787 () Bool)

(assert (=> b!290580 m!424787))

(declare-fun m!424789 () Bool)

(assert (=> b!290580 m!424789))

(declare-fun m!424791 () Bool)

(assert (=> b!290580 m!424791))

(declare-fun m!424793 () Bool)

(assert (=> b!290580 m!424793))

(declare-fun m!424795 () Bool)

(assert (=> b!290580 m!424795))

(declare-fun m!424797 () Bool)

(assert (=> b!290580 m!424797))

(declare-fun m!424799 () Bool)

(assert (=> b!290580 m!424799))

(declare-fun m!424801 () Bool)

(assert (=> b!290580 m!424801))

(declare-fun m!424803 () Bool)

(assert (=> b!290580 m!424803))

(declare-fun m!424805 () Bool)

(assert (=> b!290581 m!424805))

(push 1)

(assert (not b!290581))

(assert (not start!64732))

(assert (not b!290580))

(assert (not b!290578))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!98470 () Bool)

(assert (=> d!98470 (= (array_inv!7077 (buf!7531 thiss!1728)) (bvsge (size!7465 (buf!7531 thiss!1728)) #b00000000000000000000000000000000))))

(assert (=> b!290581 d!98470))

(declare-fun d!98472 () Bool)

(assert (=> d!98472 (= (inv!12 thiss!1728) (invariant!0 (currentBit!13942 thiss!1728) (currentByte!13947 thiss!1728) (size!7465 (buf!7531 thiss!1728))))))

(declare-fun bs!25083 () Bool)

(assert (= bs!25083 d!98472))

(declare-fun m!424905 () Bool)

(assert (=> bs!25083 m!424905))

(assert (=> start!64732 d!98472))

(declare-fun d!98474 () Bool)

(assert (=> d!98474 (= (array_inv!7077 arr!273) (bvsge (size!7465 arr!273) #b00000000000000000000000000000000))))

(assert (=> start!64732 d!98474))

(declare-fun d!98476 () Bool)

(declare-fun e!207024 () Bool)

(assert (=> d!98476 e!207024))

(declare-fun res!240101 () Bool)

(assert (=> d!98476 (=> (not res!240101) (not e!207024))))

(assert (=> d!98476 (= res!240101 (or (= (bvand (bvsub nBits!523 from!505) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!523 from!505) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!421839 () Unit!20183)

(declare-fun choose!27 (BitStream!12940 BitStream!12940 (_ BitVec 64) (_ BitVec 64)) Unit!20183)

(assert (=> d!98476 (= lt!421839 (choose!27 thiss!1728 (_2!12662 lt!421741) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!98476 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!523 from!505)))))

(assert (=> d!98476 (= (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12662 lt!421741) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001) lt!421839)))

(declare-fun b!290631 () Bool)

(assert (=> b!290631 (= e!207024 (validate_offset_bits!1 ((_ sign_extend 32) (size!7465 (buf!7531 (_2!12662 lt!421741)))) ((_ sign_extend 32) (currentByte!13947 (_2!12662 lt!421741))) ((_ sign_extend 32) (currentBit!13942 (_2!12662 lt!421741))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!98476 res!240101) b!290631))

(declare-fun m!424907 () Bool)

(assert (=> d!98476 m!424907))

(assert (=> b!290631 m!424783))

(assert (=> b!290580 d!98476))

(declare-fun b!290646 () Bool)

(declare-fun e!207041 () Bool)

(declare-fun call!4823 () Bool)

(assert (=> b!290646 (= e!207041 call!4823)))

(declare-fun b!290647 () Bool)

(declare-fun e!207038 () Bool)

(declare-fun e!207040 () Bool)

(assert (=> b!290647 (= e!207038 e!207040)))

(declare-fun res!240114 () Bool)

(assert (=> b!290647 (=> (not res!240114) (not e!207040))))

(declare-fun e!207037 () Bool)

(assert (=> b!290647 (= res!240114 e!207037)))

(declare-fun res!240116 () Bool)

(assert (=> b!290647 (=> res!240116 e!207037)))

(declare-datatypes ((tuple4!836 0))(
  ( (tuple4!837 (_1!12669 (_ BitVec 32)) (_2!12669 (_ BitVec 32)) (_3!1258 (_ BitVec 32)) (_4!418 (_ BitVec 32))) )
))
(declare-fun lt!421848 () tuple4!836)

(assert (=> b!290647 (= res!240116 (bvsge (_1!12669 lt!421848) (_2!12669 lt!421848)))))

(declare-fun lt!421847 () (_ BitVec 32))

(assert (=> b!290647 (= lt!421847 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!421846 () (_ BitVec 32))

(assert (=> b!290647 (= lt!421846 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!836)

(assert (=> b!290647 (= lt!421848 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(declare-fun d!98478 () Bool)

(declare-fun res!240112 () Bool)

(assert (=> d!98478 (=> res!240112 e!207038)))

(assert (=> d!98478 (= res!240112 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!98478 (= (arrayBitRangesEq!0 arr!273 (_3!1254 lt!421748) #b0000000000000000000000000000000000000000000000000000000000000000 from!505) e!207038)))

(declare-fun b!290648 () Bool)

(declare-fun arrayRangesEq!1476 (array!17246 array!17246 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!290648 (= e!207037 (arrayRangesEq!1476 arr!273 (_3!1254 lt!421748) (_1!12669 lt!421848) (_2!12669 lt!421848)))))

(declare-fun bm!4820 () Bool)

(declare-fun c!13284 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!4820 (= call!4823 (byteRangesEq!0 (select (arr!8473 arr!273) (_3!1258 lt!421848)) (select (arr!8473 (_3!1254 lt!421748)) (_3!1258 lt!421848)) lt!421846 (ite c!13284 lt!421847 #b00000000000000000000000000001000)))))

(declare-fun e!207039 () Bool)

(declare-fun b!290649 () Bool)

(assert (=> b!290649 (= e!207039 (byteRangesEq!0 (select (arr!8473 arr!273) (_4!418 lt!421848)) (select (arr!8473 (_3!1254 lt!421748)) (_4!418 lt!421848)) #b00000000000000000000000000000000 lt!421847))))

(declare-fun b!290650 () Bool)

(declare-fun res!240113 () Bool)

(assert (=> b!290650 (= res!240113 (= lt!421847 #b00000000000000000000000000000000))))

(assert (=> b!290650 (=> res!240113 e!207039)))

(declare-fun e!207042 () Bool)

(assert (=> b!290650 (= e!207042 e!207039)))

(declare-fun b!290651 () Bool)

(assert (=> b!290651 (= e!207041 e!207042)))

(declare-fun res!240115 () Bool)

(assert (=> b!290651 (= res!240115 call!4823)))

(assert (=> b!290651 (=> (not res!240115) (not e!207042))))

(declare-fun b!290652 () Bool)

(assert (=> b!290652 (= e!207040 e!207041)))

(assert (=> b!290652 (= c!13284 (= (_3!1258 lt!421848) (_4!418 lt!421848)))))

(assert (= (and d!98478 (not res!240112)) b!290647))

(assert (= (and b!290647 (not res!240116)) b!290648))

(assert (= (and b!290647 res!240114) b!290652))

(assert (= (and b!290652 c!13284) b!290646))

(assert (= (and b!290652 (not c!13284)) b!290651))

(assert (= (and b!290651 res!240115) b!290650))

(assert (= (and b!290650 (not res!240113)) b!290649))

(assert (= (or b!290646 b!290651) bm!4820))

(declare-fun m!424909 () Bool)

(assert (=> b!290647 m!424909))

(declare-fun m!424911 () Bool)

(assert (=> b!290648 m!424911))

(declare-fun m!424913 () Bool)

(assert (=> bm!4820 m!424913))

(declare-fun m!424915 () Bool)

(assert (=> bm!4820 m!424915))

(assert (=> bm!4820 m!424913))

(assert (=> bm!4820 m!424915))

(declare-fun m!424917 () Bool)

(assert (=> bm!4820 m!424917))

(declare-fun m!424919 () Bool)

(assert (=> b!290649 m!424919))

(declare-fun m!424921 () Bool)

(assert (=> b!290649 m!424921))

(assert (=> b!290649 m!424919))

(assert (=> b!290649 m!424921))

(declare-fun m!424923 () Bool)

(assert (=> b!290649 m!424923))

(assert (=> b!290580 d!98478))

(declare-fun c!13298 () Bool)

(declare-fun call!4842 () Bool)

(declare-fun bm!4839 () Bool)

(declare-fun lt!422171 () (_ BitVec 64))

(declare-fun lt!422176 () tuple3!1674)

(assert (=> bm!4839 (= call!4842 (arrayBitRangesEq!0 lt!421747 (ite c!13298 (_3!1254 lt!422176) lt!421747) (ite c!13298 lt!422171 #b0000000000000000000000000000000000000000000000000000000000000000) (ite c!13298 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvmul ((_ sign_extend 32) (size!7465 lt!421747)) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!422163 () Unit!20183)

(declare-fun b!290777 () Bool)

(declare-fun e!207139 () tuple3!1674)

(assert (=> b!290777 (= e!207139 (tuple3!1675 lt!422163 (_2!12662 lt!421741) lt!421747))))

(declare-fun lt!422158 () Unit!20183)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17246) Unit!20183)

(assert (=> b!290777 (= lt!422158 (arrayBitRangesEqReflexiveLemma!0 lt!421747))))

(assert (=> b!290777 call!4842))

(declare-fun lt!422161 () Unit!20183)

(assert (=> b!290777 (= lt!422161 lt!422158)))

(declare-fun lt!422151 () array!17246)

(assert (=> b!290777 (= lt!422151 lt!421747)))

(declare-fun lt!422146 () array!17246)

(assert (=> b!290777 (= lt!422146 lt!421747)))

(declare-fun lt!422156 () (_ BitVec 64))

(assert (=> b!290777 (= lt!422156 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!422154 () (_ BitVec 64))

(assert (=> b!290777 (= lt!422154 ((_ sign_extend 32) (size!7465 lt!421747)))))

(declare-fun lt!422165 () (_ BitVec 64))

(assert (=> b!290777 (= lt!422165 (bvmul lt!422154 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!422173 () (_ BitVec 64))

(assert (=> b!290777 (= lt!422173 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!422159 () (_ BitVec 64))

(assert (=> b!290777 (= lt!422159 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))))

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17246 array!17246 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20183)

(assert (=> b!290777 (= lt!422163 (arrayBitRangesEqSlicedLemma!0 lt!422151 lt!422146 lt!422156 lt!422165 lt!422173 lt!422159))))

(declare-fun call!4843 () Bool)

(assert (=> b!290777 call!4843))

(declare-fun b!290778 () Bool)

(declare-fun res!240219 () Bool)

(declare-fun e!207137 () Bool)

(assert (=> b!290778 (=> (not res!240219) (not e!207137))))

(declare-fun lt!422175 () tuple3!1674)

(assert (=> b!290778 (= res!240219 (and (= (buf!7531 (_2!12662 lt!421741)) (buf!7531 (_2!12661 lt!422175))) (= (size!7465 lt!421747) (size!7465 (_3!1254 lt!422175)))))))

(declare-fun b!290779 () Bool)

(declare-fun res!240218 () Bool)

(assert (=> b!290779 (=> (not res!240218) (not e!207137))))

(assert (=> b!290779 (= res!240218 (arrayBitRangesEq!0 lt!421747 (_3!1254 lt!422175) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun lt!422160 () (_ BitVec 32))

(declare-fun bm!4840 () Bool)

(declare-fun lt!422170 () tuple2!22814)

(declare-fun lt!422150 () (_ BitVec 32))

(assert (=> bm!4840 (= call!4843 (arrayBitRangesEq!0 (ite c!13298 lt!421747 lt!422151) (ite c!13298 (array!17247 (store (arr!8473 lt!421747) lt!422160 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8473 lt!421747) lt!422160)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!422150)))) ((_ sign_extend 24) (ite (_1!12662 lt!422170) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!422150) #b00000000))))) (size!7465 lt!421747)) lt!422146) (ite c!13298 #b0000000000000000000000000000000000000000000000000000000000000000 lt!422173) (ite c!13298 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) lt!422159)))))

(declare-fun e!207138 () Bool)

(declare-fun b!290780 () Bool)

(declare-datatypes ((tuple2!22824 0))(
  ( (tuple2!22825 (_1!12671 BitStream!12940) (_2!12671 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!12940) tuple2!22824)

(assert (=> b!290780 (= e!207138 (= (bitAt!0 (_3!1254 lt!422175) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (_2!12671 (readBitPure!0 (_2!12662 lt!421741)))))))

(declare-fun d!98480 () Bool)

(assert (=> d!98480 e!207137))

(declare-fun res!240216 () Bool)

(assert (=> d!98480 (=> (not res!240216) (not e!207137))))

(declare-fun lt!422155 () (_ BitVec 64))

(assert (=> d!98480 (= res!240216 (= (bvsub lt!422155 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitIndex!0 (size!7465 (buf!7531 (_2!12661 lt!422175))) (currentByte!13947 (_2!12661 lt!422175)) (currentBit!13942 (_2!12661 lt!422175)))))))

(assert (=> d!98480 (or (= (bvand lt!422155 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!422155 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!422155 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!422178 () (_ BitVec 64))

(assert (=> d!98480 (= lt!422155 (bvadd lt!422178 to!474))))

(assert (=> d!98480 (or (not (= (bvand lt!422178 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!422178 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!422178 to!474) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!98480 (= lt!422178 (bitIndex!0 (size!7465 (buf!7531 (_2!12662 lt!421741))) (currentByte!13947 (_2!12662 lt!421741)) (currentBit!13942 (_2!12662 lt!421741))))))

(assert (=> d!98480 (= lt!422175 e!207139)))

(assert (=> d!98480 (= c!13298 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> d!98480 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!98480 (= (readBitsLoop!0 (_2!12662 lt!421741) nBits!523 lt!421747 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474) lt!422175)))

(declare-fun b!290781 () Bool)

(declare-fun lt!422180 () Unit!20183)

(assert (=> b!290781 (= e!207139 (tuple3!1675 lt!422180 (_2!12661 lt!422176) (_3!1254 lt!422176)))))

(assert (=> b!290781 (= lt!422170 (readBit!0 (_2!12662 lt!421741)))))

(declare-fun lt!422174 () (_ BitVec 32))

(assert (=> b!290781 (= lt!422174 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!422148 () (_ BitVec 32))

(assert (=> b!290781 (= lt!422148 ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!422152 () array!17246)

(assert (=> b!290781 (= lt!422152 (array!17247 (store (arr!8473 lt!421747) lt!422174 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8473 lt!421747) lt!422174)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!422148)))) ((_ sign_extend 24) (ite (_1!12662 lt!422170) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!422148) #b00000000))))) (size!7465 lt!421747)))))

(declare-fun lt!422166 () (_ BitVec 64))

(assert (=> b!290781 (= lt!422166 (bvsub nBits!523 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun lt!422181 () (_ BitVec 64))

(assert (=> b!290781 (= lt!422181 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!422169 () Unit!20183)

(assert (=> b!290781 (= lt!422169 (validateOffsetBitsIneqLemma!0 (_2!12662 lt!421741) (_2!12662 lt!422170) lt!422166 lt!422181))))

(assert (=> b!290781 (validate_offset_bits!1 ((_ sign_extend 32) (size!7465 (buf!7531 (_2!12662 lt!422170)))) ((_ sign_extend 32) (currentByte!13947 (_2!12662 lt!422170))) ((_ sign_extend 32) (currentBit!13942 (_2!12662 lt!422170))) (bvsub lt!422166 lt!422181))))

(declare-fun lt!422157 () Unit!20183)

(assert (=> b!290781 (= lt!422157 lt!422169)))

(assert (=> b!290781 (= lt!422176 (readBitsLoop!0 (_2!12662 lt!422170) nBits!523 lt!422152 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001) to!474))))

(declare-fun res!240217 () Bool)

(assert (=> b!290781 (= res!240217 (= (bvsub (bvadd (bitIndex!0 (size!7465 (buf!7531 (_2!12662 lt!421741))) (currentByte!13947 (_2!12662 lt!421741)) (currentBit!13942 (_2!12662 lt!421741))) to!474) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitIndex!0 (size!7465 (buf!7531 (_2!12661 lt!422176))) (currentByte!13947 (_2!12661 lt!422176)) (currentBit!13942 (_2!12661 lt!422176)))))))

(declare-fun e!207136 () Bool)

(assert (=> b!290781 (=> (not res!240217) (not e!207136))))

(assert (=> b!290781 e!207136))

(declare-fun lt!422177 () Unit!20183)

(declare-fun Unit!20193 () Unit!20183)

(assert (=> b!290781 (= lt!422177 Unit!20193)))

(assert (=> b!290781 (= lt!422160 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!290781 (= lt!422150 ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!422153 () Unit!20183)

(assert (=> b!290781 (= lt!422153 (arrayBitRangesUpdatedAtLemma!0 lt!421747 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (_1!12662 lt!422170)))))

(assert (=> b!290781 call!4843))

(declare-fun lt!422179 () Unit!20183)

(assert (=> b!290781 (= lt!422179 lt!422153)))

(assert (=> b!290781 (= lt!422171 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!422168 () Unit!20183)

(assert (=> b!290781 (= lt!422168 (arrayBitRangesEqTransitive!0 lt!421747 lt!422152 (_3!1254 lt!422176) lt!422171 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!290781 call!4842))

(declare-fun lt!422149 () Unit!20183)

(assert (=> b!290781 (= lt!422149 lt!422168)))

(assert (=> b!290781 (arrayBitRangesEq!0 lt!421747 (_3!1254 lt!422176) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))))

(declare-fun lt!422147 () Unit!20183)

(declare-fun Unit!20194 () Unit!20183)

(assert (=> b!290781 (= lt!422147 Unit!20194)))

(declare-fun lt!422172 () Unit!20183)

(assert (=> b!290781 (= lt!422172 (arrayBitRangesEqImpliesEq!0 lt!422152 (_3!1254 lt!422176) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!290781 (= (bitAt!0 lt!422152 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitAt!0 (_3!1254 lt!422176) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun lt!422164 () Unit!20183)

(assert (=> b!290781 (= lt!422164 lt!422172)))

(declare-fun lt!422162 () Unit!20183)

(declare-fun Unit!20195 () Unit!20183)

(assert (=> b!290781 (= lt!422162 Unit!20195)))

(declare-fun lt!422167 () Bool)

(assert (=> b!290781 (= lt!422167 (= (bitAt!0 (_3!1254 lt!422176) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (_1!12662 lt!422170)))))

(declare-fun Unit!20196 () Unit!20183)

(assert (=> b!290781 (= lt!422180 Unit!20196)))

(assert (=> b!290781 lt!422167))

(declare-fun b!290782 () Bool)

(declare-datatypes ((List!958 0))(
  ( (Nil!955) (Cons!954 (h!1073 Bool) (t!1843 List!958)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!12940 array!17246 (_ BitVec 64) (_ BitVec 64)) List!958)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!12940 BitStream!12940 (_ BitVec 64)) List!958)

(assert (=> b!290782 (= e!207137 (= (byteArrayBitContentToList!0 (_2!12661 lt!422175) (_3!1254 lt!422175) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))) (bitStreamReadBitsIntoList!0 (_2!12661 lt!422175) (_2!12662 lt!421741) (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))))

(assert (=> b!290782 (or (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!290782 (or (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!290783 () Bool)

(declare-fun res!240220 () Bool)

(assert (=> b!290783 (=> (not res!240220) (not e!207137))))

(assert (=> b!290783 (= res!240220 e!207138)))

(declare-fun res!240214 () Bool)

(assert (=> b!290783 (=> res!240214 e!207138)))

(assert (=> b!290783 (= res!240214 (not (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474)))))

(declare-fun b!290784 () Bool)

(assert (=> b!290784 (= e!207136 (and (= (buf!7531 (_2!12662 lt!421741)) (buf!7531 (_2!12661 lt!422176))) (= (size!7465 lt!421747) (size!7465 (_3!1254 lt!422176)))))))

(declare-fun b!290785 () Bool)

(declare-fun res!240215 () Bool)

(assert (=> b!290785 (=> (not res!240215) (not e!207137))))

(assert (=> b!290785 (= res!240215 (invariant!0 (currentBit!13942 (_2!12661 lt!422175)) (currentByte!13947 (_2!12661 lt!422175)) (size!7465 (buf!7531 (_2!12661 lt!422175)))))))

(assert (= (and d!98480 c!13298) b!290781))

(assert (= (and d!98480 (not c!13298)) b!290777))

(assert (= (and b!290781 res!240217) b!290784))

(assert (= (or b!290781 b!290777) bm!4840))

(assert (= (or b!290781 b!290777) bm!4839))

(assert (= (and d!98480 res!240216) b!290778))

(assert (= (and b!290778 res!240219) b!290779))

(assert (= (and b!290779 res!240218) b!290783))

(assert (= (and b!290783 (not res!240214)) b!290780))

(assert (= (and b!290783 res!240220) b!290785))

(assert (= (and b!290785 res!240215) b!290782))

(declare-fun m!425099 () Bool)

(assert (=> b!290781 m!425099))

(declare-fun m!425101 () Bool)

(assert (=> b!290781 m!425101))

(declare-fun m!425103 () Bool)

(assert (=> b!290781 m!425103))

(declare-fun m!425105 () Bool)

(assert (=> b!290781 m!425105))

(declare-fun m!425107 () Bool)

(assert (=> b!290781 m!425107))

(declare-fun m!425109 () Bool)

(assert (=> b!290781 m!425109))

(declare-fun m!425111 () Bool)

(assert (=> b!290781 m!425111))

(declare-fun m!425113 () Bool)

(assert (=> b!290781 m!425113))

(declare-fun m!425115 () Bool)

(assert (=> b!290781 m!425115))

(declare-fun m!425117 () Bool)

(assert (=> b!290781 m!425117))

(declare-fun m!425119 () Bool)

(assert (=> b!290781 m!425119))

(declare-fun m!425121 () Bool)

(assert (=> b!290781 m!425121))

(declare-fun m!425123 () Bool)

(assert (=> b!290781 m!425123))

(declare-fun m!425125 () Bool)

(assert (=> b!290781 m!425125))

(declare-fun m!425127 () Bool)

(assert (=> b!290781 m!425127))

(declare-fun m!425129 () Bool)

(assert (=> b!290780 m!425129))

(declare-fun m!425131 () Bool)

(assert (=> b!290780 m!425131))

(declare-fun m!425133 () Bool)

(assert (=> b!290779 m!425133))

(declare-fun m!425135 () Bool)

(assert (=> bm!4840 m!425135))

(declare-fun m!425137 () Bool)

(assert (=> bm!4840 m!425137))

(declare-fun m!425139 () Bool)

(assert (=> bm!4840 m!425139))

(declare-fun m!425141 () Bool)

(assert (=> bm!4840 m!425141))

(declare-fun m!425143 () Bool)

(assert (=> bm!4839 m!425143))

(declare-fun m!425145 () Bool)

(assert (=> b!290782 m!425145))

(declare-fun m!425147 () Bool)

(assert (=> b!290782 m!425147))

(declare-fun m!425149 () Bool)

(assert (=> d!98480 m!425149))

(assert (=> d!98480 m!425113))

(declare-fun m!425151 () Bool)

(assert (=> b!290777 m!425151))

(declare-fun m!425153 () Bool)

(assert (=> b!290777 m!425153))

(declare-fun m!425155 () Bool)

(assert (=> b!290785 m!425155))

(assert (=> b!290580 d!98480))

(declare-fun d!98532 () Bool)

(assert (=> d!98532 (arrayBitRangesEq!0 arr!273 (_3!1254 lt!421748) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!422196 () Unit!20183)

(declare-fun choose!49 (array!17246 array!17246 array!17246 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20183)

(assert (=> d!98532 (= lt!422196 (choose!49 arr!273 lt!421747 (_3!1254 lt!421748) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!98532 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!98532 (= (arrayBitRangesEqTransitive!0 arr!273 lt!421747 (_3!1254 lt!421748) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) lt!422196)))

(declare-fun bs!25095 () Bool)

(assert (= bs!25095 d!98532))

(assert (=> bs!25095 m!424797))

(declare-fun m!425167 () Bool)

(assert (=> bs!25095 m!425167))

(assert (=> b!290580 d!98532))

(declare-fun d!98542 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!98542 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7465 (buf!7531 (_2!12662 lt!421741)))) ((_ sign_extend 32) (currentByte!13947 (_2!12662 lt!421741))) ((_ sign_extend 32) (currentBit!13942 (_2!12662 lt!421741))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7465 (buf!7531 (_2!12662 lt!421741)))) ((_ sign_extend 32) (currentByte!13947 (_2!12662 lt!421741))) ((_ sign_extend 32) (currentBit!13942 (_2!12662 lt!421741)))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!25096 () Bool)

(assert (= bs!25096 d!98542))

(declare-fun m!425169 () Bool)

(assert (=> bs!25096 m!425169))

(assert (=> b!290580 d!98542))

(declare-fun b!290790 () Bool)

(declare-fun e!207147 () Bool)

(declare-fun call!4844 () Bool)

(assert (=> b!290790 (= e!207147 call!4844)))

(declare-fun b!290791 () Bool)

(declare-fun e!207144 () Bool)

(declare-fun e!207146 () Bool)

(assert (=> b!290791 (= e!207144 e!207146)))

(declare-fun res!240226 () Bool)

(assert (=> b!290791 (=> (not res!240226) (not e!207146))))

(declare-fun e!207143 () Bool)

(assert (=> b!290791 (= res!240226 e!207143)))

(declare-fun res!240228 () Bool)

(assert (=> b!290791 (=> res!240228 e!207143)))

(declare-fun lt!422199 () tuple4!836)

(assert (=> b!290791 (= res!240228 (bvsge (_1!12669 lt!422199) (_2!12669 lt!422199)))))

(declare-fun lt!422198 () (_ BitVec 32))

(assert (=> b!290791 (= lt!422198 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!422197 () (_ BitVec 32))

(assert (=> b!290791 (= lt!422197 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!290791 (= lt!422199 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(declare-fun d!98544 () Bool)

(declare-fun res!240224 () Bool)

(assert (=> d!98544 (=> res!240224 e!207144)))

(assert (=> d!98544 (= res!240224 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!98544 (= (arrayBitRangesEq!0 arr!273 lt!421747 #b0000000000000000000000000000000000000000000000000000000000000000 from!505) e!207144)))

(declare-fun b!290792 () Bool)

(assert (=> b!290792 (= e!207143 (arrayRangesEq!1476 arr!273 lt!421747 (_1!12669 lt!422199) (_2!12669 lt!422199)))))

(declare-fun c!13299 () Bool)

(declare-fun bm!4841 () Bool)

(assert (=> bm!4841 (= call!4844 (byteRangesEq!0 (select (arr!8473 arr!273) (_3!1258 lt!422199)) (select (arr!8473 lt!421747) (_3!1258 lt!422199)) lt!422197 (ite c!13299 lt!422198 #b00000000000000000000000000001000)))))

(declare-fun b!290793 () Bool)

(declare-fun e!207145 () Bool)

(assert (=> b!290793 (= e!207145 (byteRangesEq!0 (select (arr!8473 arr!273) (_4!418 lt!422199)) (select (arr!8473 lt!421747) (_4!418 lt!422199)) #b00000000000000000000000000000000 lt!422198))))

(declare-fun b!290794 () Bool)

(declare-fun res!240225 () Bool)

(assert (=> b!290794 (= res!240225 (= lt!422198 #b00000000000000000000000000000000))))

(assert (=> b!290794 (=> res!240225 e!207145)))

(declare-fun e!207148 () Bool)

(assert (=> b!290794 (= e!207148 e!207145)))

(declare-fun b!290795 () Bool)

(assert (=> b!290795 (= e!207147 e!207148)))

(declare-fun res!240227 () Bool)

(assert (=> b!290795 (= res!240227 call!4844)))

(assert (=> b!290795 (=> (not res!240227) (not e!207148))))

(declare-fun b!290796 () Bool)

(assert (=> b!290796 (= e!207146 e!207147)))

(assert (=> b!290796 (= c!13299 (= (_3!1258 lt!422199) (_4!418 lt!422199)))))

(assert (= (and d!98544 (not res!240224)) b!290791))

(assert (= (and b!290791 (not res!240228)) b!290792))

(assert (= (and b!290791 res!240226) b!290796))

(assert (= (and b!290796 c!13299) b!290790))

(assert (= (and b!290796 (not c!13299)) b!290795))

(assert (= (and b!290795 res!240227) b!290794))

(assert (= (and b!290794 (not res!240225)) b!290793))

(assert (= (or b!290790 b!290795) bm!4841))

(assert (=> b!290791 m!424909))

(declare-fun m!425171 () Bool)

(assert (=> b!290792 m!425171))

(declare-fun m!425173 () Bool)

(assert (=> bm!4841 m!425173))

(declare-fun m!425175 () Bool)

(assert (=> bm!4841 m!425175))

(assert (=> bm!4841 m!425173))

(assert (=> bm!4841 m!425175))

(declare-fun m!425177 () Bool)

(assert (=> bm!4841 m!425177))

(declare-fun m!425179 () Bool)

(assert (=> b!290793 m!425179))

(declare-fun m!425181 () Bool)

(assert (=> b!290793 m!425181))

(assert (=> b!290793 m!425179))

(assert (=> b!290793 m!425181))

(declare-fun m!425183 () Bool)

(assert (=> b!290793 m!425183))

(assert (=> b!290580 d!98544))

(declare-fun d!98546 () Bool)

(declare-fun e!207151 () Bool)

(assert (=> d!98546 e!207151))

(declare-fun res!240231 () Bool)

(assert (=> d!98546 (=> (not res!240231) (not e!207151))))

(declare-fun lt!422211 () (_ BitVec 32))

(assert (=> d!98546 (= res!240231 (and (bvsge lt!422211 #b00000000000000000000000000000000) (bvslt lt!422211 (size!7465 arr!273))))))

(declare-fun lt!422209 () (_ BitVec 32))

(declare-fun lt!422210 () Unit!20183)

(declare-fun lt!422208 () (_ BitVec 8))

(declare-fun choose!53 (array!17246 (_ BitVec 64) Bool (_ BitVec 32) (_ BitVec 32) (_ BitVec 8)) Unit!20183)

(assert (=> d!98546 (= lt!422210 (choose!53 arr!273 from!505 (_1!12662 lt!421741) lt!422211 lt!422209 lt!422208))))

(assert (=> d!98546 (= lt!422208 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8473 arr!273) lt!422211)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!422209)))) ((_ sign_extend 24) (ite (_1!12662 lt!421741) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!422209) #b00000000)))))))

(assert (=> d!98546 (= lt!422209 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> d!98546 (= lt!422211 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> d!98546 (= (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12662 lt!421741)) lt!422210)))

(declare-fun b!290800 () Bool)

(assert (=> b!290800 (= e!207151 (arrayBitRangesEq!0 arr!273 (array!17247 (store (arr!8473 arr!273) lt!422211 lt!422208) (size!7465 arr!273)) #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (= (and d!98546 res!240231) b!290800))

(declare-fun m!425185 () Bool)

(assert (=> d!98546 m!425185))

(declare-fun m!425187 () Bool)

(assert (=> d!98546 m!425187))

(declare-fun m!425189 () Bool)

(assert (=> d!98546 m!425189))

(declare-fun m!425191 () Bool)

(assert (=> b!290800 m!425191))

(declare-fun m!425193 () Bool)

(assert (=> b!290800 m!425193))

(assert (=> b!290580 d!98546))

(declare-fun d!98548 () Bool)

(assert (=> d!98548 (= (invariant!0 (currentBit!13942 (_2!12661 lt!421748)) (currentByte!13947 (_2!12661 lt!421748)) (size!7465 (buf!7531 (_2!12661 lt!421748)))) (and (bvsge (currentBit!13942 (_2!12661 lt!421748)) #b00000000000000000000000000000000) (bvslt (currentBit!13942 (_2!12661 lt!421748)) #b00000000000000000000000000001000) (bvsge (currentByte!13947 (_2!12661 lt!421748)) #b00000000000000000000000000000000) (or (bvslt (currentByte!13947 (_2!12661 lt!421748)) (size!7465 (buf!7531 (_2!12661 lt!421748)))) (and (= (currentBit!13942 (_2!12661 lt!421748)) #b00000000000000000000000000000000) (= (currentByte!13947 (_2!12661 lt!421748)) (size!7465 (buf!7531 (_2!12661 lt!421748))))))))))

(assert (=> b!290580 d!98548))

(declare-fun d!98550 () Bool)

(declare-fun e!207158 () Bool)

(assert (=> d!98550 e!207158))

(declare-fun res!240234 () Bool)

(assert (=> d!98550 (=> (not res!240234) (not e!207158))))

(declare-datatypes ((tuple2!22826 0))(
  ( (tuple2!22827 (_1!12673 Unit!20183) (_2!12673 BitStream!12940)) )
))
(declare-fun increaseBitIndex!0 (BitStream!12940) tuple2!22826)

(assert (=> d!98550 (= res!240234 (= (buf!7531 (_2!12673 (increaseBitIndex!0 thiss!1728))) (buf!7531 thiss!1728)))))

(declare-fun lt!422227 () Bool)

(assert (=> d!98550 (= lt!422227 (not (= (bvand ((_ sign_extend 24) (select (arr!8473 (buf!7531 thiss!1728)) (currentByte!13947 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13942 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!422232 () tuple2!22814)

(assert (=> d!98550 (= lt!422232 (tuple2!22815 (not (= (bvand ((_ sign_extend 24) (select (arr!8473 (buf!7531 thiss!1728)) (currentByte!13947 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13942 thiss!1728)))) #b00000000000000000000000000000000)) (_2!12673 (increaseBitIndex!0 thiss!1728))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!98550 (validate_offset_bit!0 ((_ sign_extend 32) (size!7465 (buf!7531 thiss!1728))) ((_ sign_extend 32) (currentByte!13947 thiss!1728)) ((_ sign_extend 32) (currentBit!13942 thiss!1728)))))

(assert (=> d!98550 (= (readBit!0 thiss!1728) lt!422232)))

(declare-fun lt!422226 () (_ BitVec 64))

(declare-fun b!290803 () Bool)

(declare-fun lt!422229 () (_ BitVec 64))

(assert (=> b!290803 (= e!207158 (= (bitIndex!0 (size!7465 (buf!7531 (_2!12673 (increaseBitIndex!0 thiss!1728)))) (currentByte!13947 (_2!12673 (increaseBitIndex!0 thiss!1728))) (currentBit!13942 (_2!12673 (increaseBitIndex!0 thiss!1728)))) (bvadd lt!422229 lt!422226)))))

(assert (=> b!290803 (or (not (= (bvand lt!422229 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!422226 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!422229 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!422229 lt!422226) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!290803 (= lt!422226 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!290803 (= lt!422229 (bitIndex!0 (size!7465 (buf!7531 thiss!1728)) (currentByte!13947 thiss!1728) (currentBit!13942 thiss!1728)))))

(declare-fun lt!422228 () Bool)

(assert (=> b!290803 (= lt!422228 (not (= (bvand ((_ sign_extend 24) (select (arr!8473 (buf!7531 thiss!1728)) (currentByte!13947 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13942 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!422230 () Bool)

(assert (=> b!290803 (= lt!422230 (not (= (bvand ((_ sign_extend 24) (select (arr!8473 (buf!7531 thiss!1728)) (currentByte!13947 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13942 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!422231 () Bool)

(assert (=> b!290803 (= lt!422231 (not (= (bvand ((_ sign_extend 24) (select (arr!8473 (buf!7531 thiss!1728)) (currentByte!13947 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13942 thiss!1728)))) #b00000000000000000000000000000000)))))

(assert (= (and d!98550 res!240234) b!290803))

(declare-fun m!425195 () Bool)

(assert (=> d!98550 m!425195))

(declare-fun m!425197 () Bool)

(assert (=> d!98550 m!425197))

(declare-fun m!425199 () Bool)

(assert (=> d!98550 m!425199))

(declare-fun m!425201 () Bool)

(assert (=> d!98550 m!425201))

(assert (=> b!290803 m!425195))

(assert (=> b!290803 m!425199))

(assert (=> b!290803 m!425197))

(declare-fun m!425203 () Bool)

(assert (=> b!290803 m!425203))

(assert (=> b!290803 m!424775))

(assert (=> b!290580 d!98550))

(declare-fun d!98552 () Bool)

(assert (=> d!98552 (= (bitAt!0 lt!421747 from!505) (bitAt!0 (_3!1254 lt!421748) from!505))))

(declare-fun lt!422235 () Unit!20183)

(declare-fun choose!31 (array!17246 array!17246 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20183)

(assert (=> d!98552 (= lt!422235 (choose!31 lt!421747 (_3!1254 lt!421748) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!98552 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!98552 (= (arrayBitRangesEqImpliesEq!0 lt!421747 (_3!1254 lt!421748) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) lt!422235)))

(declare-fun bs!25097 () Bool)

(assert (= bs!25097 d!98552))

(assert (=> bs!25097 m!424795))

(assert (=> bs!25097 m!424779))

(declare-fun m!425205 () Bool)

(assert (=> bs!25097 m!425205))

(assert (=> b!290580 d!98552))

(declare-fun d!98554 () Bool)

(declare-fun e!207161 () Bool)

(assert (=> d!98554 e!207161))

(declare-fun res!240239 () Bool)

(assert (=> d!98554 (=> (not res!240239) (not e!207161))))

(declare-fun lt!422248 () (_ BitVec 64))

(declare-fun lt!422249 () (_ BitVec 64))

(declare-fun lt!422252 () (_ BitVec 64))

(assert (=> d!98554 (= res!240239 (= lt!422248 (bvsub lt!422252 lt!422249)))))

(assert (=> d!98554 (or (= (bvand lt!422252 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!422249 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!422252 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!422252 lt!422249) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!98554 (= lt!422249 (remainingBits!0 ((_ sign_extend 32) (size!7465 (buf!7531 thiss!1728))) ((_ sign_extend 32) (currentByte!13947 thiss!1728)) ((_ sign_extend 32) (currentBit!13942 thiss!1728))))))

(declare-fun lt!422253 () (_ BitVec 64))

(declare-fun lt!422251 () (_ BitVec 64))

(assert (=> d!98554 (= lt!422252 (bvmul lt!422253 lt!422251))))

(assert (=> d!98554 (or (= lt!422253 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!422251 (bvsdiv (bvmul lt!422253 lt!422251) lt!422253)))))

(assert (=> d!98554 (= lt!422251 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!98554 (= lt!422253 ((_ sign_extend 32) (size!7465 (buf!7531 thiss!1728))))))

(assert (=> d!98554 (= lt!422248 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13947 thiss!1728)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13942 thiss!1728))))))

(assert (=> d!98554 (invariant!0 (currentBit!13942 thiss!1728) (currentByte!13947 thiss!1728) (size!7465 (buf!7531 thiss!1728)))))

(assert (=> d!98554 (= (bitIndex!0 (size!7465 (buf!7531 thiss!1728)) (currentByte!13947 thiss!1728) (currentBit!13942 thiss!1728)) lt!422248)))

(declare-fun b!290808 () Bool)

(declare-fun res!240240 () Bool)

(assert (=> b!290808 (=> (not res!240240) (not e!207161))))

(assert (=> b!290808 (= res!240240 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!422248))))

(declare-fun b!290809 () Bool)

(declare-fun lt!422250 () (_ BitVec 64))

(assert (=> b!290809 (= e!207161 (bvsle lt!422248 (bvmul lt!422250 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!290809 (or (= lt!422250 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!422250 #b0000000000000000000000000000000000000000000000000000000000001000) lt!422250)))))

(assert (=> b!290809 (= lt!422250 ((_ sign_extend 32) (size!7465 (buf!7531 thiss!1728))))))

(assert (= (and d!98554 res!240239) b!290808))

(assert (= (and b!290808 res!240240) b!290809))

(declare-fun m!425207 () Bool)

(assert (=> d!98554 m!425207))

(assert (=> d!98554 m!424905))

(assert (=> b!290580 d!98554))

(declare-fun d!98556 () Bool)

(assert (=> d!98556 (= (bitAt!0 (_3!1254 lt!421748) from!505) (not (= (bvand ((_ sign_extend 24) (select (arr!8473 (_3!1254 lt!421748)) ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!25098 () Bool)

(assert (= bs!25098 d!98556))

(declare-fun m!425209 () Bool)

(assert (=> bs!25098 m!425209))

(declare-fun m!425211 () Bool)

(assert (=> bs!25098 m!425211))

(assert (=> b!290580 d!98556))

(declare-fun d!98558 () Bool)

(assert (=> d!98558 (= (bitAt!0 lt!421747 from!505) (not (= (bvand ((_ sign_extend 24) (select (arr!8473 lt!421747) ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!25099 () Bool)

(assert (= bs!25099 d!98558))

(declare-fun m!425213 () Bool)

(assert (=> bs!25099 m!425213))

(assert (=> bs!25099 m!425211))

(assert (=> b!290580 d!98558))

(declare-fun d!98560 () Bool)

(declare-fun e!207162 () Bool)

(assert (=> d!98560 e!207162))

(declare-fun res!240241 () Bool)

(assert (=> d!98560 (=> (not res!240241) (not e!207162))))

(declare-fun lt!422254 () (_ BitVec 64))

(declare-fun lt!422255 () (_ BitVec 64))

(declare-fun lt!422258 () (_ BitVec 64))

(assert (=> d!98560 (= res!240241 (= lt!422254 (bvsub lt!422258 lt!422255)))))

(assert (=> d!98560 (or (= (bvand lt!422258 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!422255 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!422258 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!422258 lt!422255) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!98560 (= lt!422255 (remainingBits!0 ((_ sign_extend 32) (size!7465 (buf!7531 (_2!12661 lt!421748)))) ((_ sign_extend 32) (currentByte!13947 (_2!12661 lt!421748))) ((_ sign_extend 32) (currentBit!13942 (_2!12661 lt!421748)))))))

(declare-fun lt!422259 () (_ BitVec 64))

(declare-fun lt!422257 () (_ BitVec 64))

(assert (=> d!98560 (= lt!422258 (bvmul lt!422259 lt!422257))))

(assert (=> d!98560 (or (= lt!422259 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!422257 (bvsdiv (bvmul lt!422259 lt!422257) lt!422259)))))

(assert (=> d!98560 (= lt!422257 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!98560 (= lt!422259 ((_ sign_extend 32) (size!7465 (buf!7531 (_2!12661 lt!421748)))))))

(assert (=> d!98560 (= lt!422254 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13947 (_2!12661 lt!421748))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13942 (_2!12661 lt!421748)))))))

(assert (=> d!98560 (invariant!0 (currentBit!13942 (_2!12661 lt!421748)) (currentByte!13947 (_2!12661 lt!421748)) (size!7465 (buf!7531 (_2!12661 lt!421748))))))

(assert (=> d!98560 (= (bitIndex!0 (size!7465 (buf!7531 (_2!12661 lt!421748))) (currentByte!13947 (_2!12661 lt!421748)) (currentBit!13942 (_2!12661 lt!421748))) lt!422254)))

(declare-fun b!290810 () Bool)

(declare-fun res!240242 () Bool)

(assert (=> b!290810 (=> (not res!240242) (not e!207162))))

(assert (=> b!290810 (= res!240242 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!422254))))

(declare-fun b!290811 () Bool)

(declare-fun lt!422256 () (_ BitVec 64))

(assert (=> b!290811 (= e!207162 (bvsle lt!422254 (bvmul lt!422256 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!290811 (or (= lt!422256 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!422256 #b0000000000000000000000000000000000000000000000000000000000001000) lt!422256)))))

(assert (=> b!290811 (= lt!422256 ((_ sign_extend 32) (size!7465 (buf!7531 (_2!12661 lt!421748)))))))

(assert (= (and d!98560 res!240241) b!290810))

(assert (= (and b!290810 res!240242) b!290811))

(declare-fun m!425215 () Bool)

(assert (=> d!98560 m!425215))

(assert (=> d!98560 m!424777))

(assert (=> b!290580 d!98560))

(declare-fun d!98562 () Bool)

(assert (=> d!98562 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7465 (buf!7531 thiss!1728))) ((_ sign_extend 32) (currentByte!13947 thiss!1728)) ((_ sign_extend 32) (currentBit!13942 thiss!1728)) (bvsub nBits!523 from!505)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7465 (buf!7531 thiss!1728))) ((_ sign_extend 32) (currentByte!13947 thiss!1728)) ((_ sign_extend 32) (currentBit!13942 thiss!1728))) (bvsub nBits!523 from!505)))))

(declare-fun bs!25100 () Bool)

(assert (= bs!25100 d!98562))

(assert (=> bs!25100 m!425207))

(assert (=> b!290578 d!98562))

(push 1)

(assert (not bm!4839))

(assert (not d!98554))

(assert (not b!290800))

(assert (not d!98542))

(assert (not b!290791))

(assert (not b!290781))

(assert (not d!98562))

(assert (not d!98546))

(assert (not b!290777))

(assert (not d!98560))

(assert (not d!98472))

(assert (not b!290793))

(assert (not bm!4820))

(assert (not b!290631))

(assert (not bm!4840))

(assert (not d!98480))

(assert (not d!98532))

(assert (not b!290792))

(assert (not b!290780))

(assert (not b!290782))

(assert (not b!290803))

(assert (not b!290647))

(assert (not b!290648))

(assert (not d!98552))

(assert (not d!98550))

(assert (not bm!4841))

(assert (not b!290649))

(assert (not b!290785))

(assert (not d!98476))

(assert (not b!290779))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

