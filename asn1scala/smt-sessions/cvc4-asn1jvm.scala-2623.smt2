; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64736 () Bool)

(assert start!64736)

(declare-fun b!290614 () Bool)

(declare-fun e!207012 () Bool)

(declare-datatypes ((array!17250 0))(
  ( (array!17251 (arr!8475 (Array (_ BitVec 32) (_ BitVec 8))) (size!7467 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12944 0))(
  ( (BitStream!12945 (buf!7533 array!17250) (currentByte!13949 (_ BitVec 32)) (currentBit!13944 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12944)

(declare-fun array_inv!7079 (array!17250) Bool)

(assert (=> b!290614 (= e!207012 (array_inv!7079 (buf!7533 thiss!1728)))))

(declare-fun b!290615 () Bool)

(declare-fun e!207015 () Bool)

(declare-datatypes ((Unit!20187 0))(
  ( (Unit!20188) )
))
(declare-datatypes ((tuple3!1678 0))(
  ( (tuple3!1679 (_1!12665 Unit!20187) (_2!12665 BitStream!12944) (_3!1256 array!17250)) )
))
(declare-fun lt!421809 () tuple3!1678)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!290615 (= e!207015 (not (invariant!0 (currentBit!13944 (_2!12665 lt!421809)) (currentByte!13949 (_2!12665 lt!421809)) (size!7467 (buf!7533 (_2!12665 lt!421809))))))))

(declare-fun e!207010 () Bool)

(assert (=> b!290615 e!207010))

(declare-fun res!240089 () Bool)

(assert (=> b!290615 (=> (not res!240089) (not e!207010))))

(declare-fun lt!421806 () Bool)

(declare-fun from!505 () (_ BitVec 64))

(declare-fun lt!421804 () array!17250)

(declare-fun bitAt!0 (array!17250 (_ BitVec 64)) Bool)

(assert (=> b!290615 (= res!240089 (= (bitAt!0 lt!421804 from!505) lt!421806))))

(assert (=> b!290615 (= lt!421806 (bitAt!0 (_3!1256 lt!421809) from!505))))

(declare-fun lt!421803 () Unit!20187)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!17250 array!17250 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20187)

(assert (=> b!290615 (= lt!421803 (arrayBitRangesEqImpliesEq!0 lt!421804 (_3!1256 lt!421809) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun arr!273 () array!17250)

(declare-fun arrayBitRangesEq!0 (array!17250 array!17250 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!290615 (arrayBitRangesEq!0 arr!273 (_3!1256 lt!421809) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!421805 () Unit!20187)

(declare-fun arrayBitRangesEqTransitive!0 (array!17250 array!17250 array!17250 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20187)

(assert (=> b!290615 (= lt!421805 (arrayBitRangesEqTransitive!0 arr!273 lt!421804 (_3!1256 lt!421809) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!290615 (arrayBitRangesEq!0 arr!273 lt!421804 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((tuple2!22818 0))(
  ( (tuple2!22819 (_1!12666 Bool) (_2!12666 BitStream!12944)) )
))
(declare-fun lt!421807 () tuple2!22818)

(declare-fun lt!421808 () Unit!20187)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17250 (_ BitVec 64) Bool) Unit!20187)

(assert (=> b!290615 (= lt!421808 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12666 lt!421807)))))

(declare-fun e!207014 () Bool)

(assert (=> b!290615 e!207014))

(declare-fun res!240086 () Bool)

(assert (=> b!290615 (=> (not res!240086) (not e!207014))))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!290615 (= res!240086 (= (bvsub (bvadd (bitIndex!0 (size!7467 (buf!7533 thiss!1728)) (currentByte!13949 thiss!1728) (currentBit!13944 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7467 (buf!7533 (_2!12665 lt!421809))) (currentByte!13949 (_2!12665 lt!421809)) (currentBit!13944 (_2!12665 lt!421809)))))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun readBitsLoop!0 (BitStream!12944 (_ BitVec 64) array!17250 (_ BitVec 64) (_ BitVec 64)) tuple3!1678)

(assert (=> b!290615 (= lt!421809 (readBitsLoop!0 (_2!12666 lt!421807) nBits!523 lt!421804 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!290615 (validate_offset_bits!1 ((_ sign_extend 32) (size!7467 (buf!7533 (_2!12666 lt!421807)))) ((_ sign_extend 32) (currentByte!13949 (_2!12666 lt!421807))) ((_ sign_extend 32) (currentBit!13944 (_2!12666 lt!421807))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!421800 () Unit!20187)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12944 BitStream!12944 (_ BitVec 64) (_ BitVec 64)) Unit!20187)

(assert (=> b!290615 (= lt!421800 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12666 lt!421807) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!421801 () (_ BitVec 32))

(declare-fun lt!421802 () (_ BitVec 32))

(assert (=> b!290615 (= lt!421804 (array!17251 (store (arr!8475 arr!273) lt!421801 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8475 arr!273) lt!421801)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!421802)))) ((_ sign_extend 24) (ite (_1!12666 lt!421807) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!421802) #b00000000))))) (size!7467 arr!273)))))

(assert (=> b!290615 (= lt!421802 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!290615 (= lt!421801 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!12944) tuple2!22818)

(assert (=> b!290615 (= lt!421807 (readBit!0 thiss!1728))))

(declare-fun res!240088 () Bool)

(assert (=> start!64736 (=> (not res!240088) (not e!207015))))

(assert (=> start!64736 (= res!240088 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7467 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64736 e!207015))

(declare-fun inv!12 (BitStream!12944) Bool)

(assert (=> start!64736 (and (inv!12 thiss!1728) e!207012)))

(assert (=> start!64736 true))

(assert (=> start!64736 (array_inv!7079 arr!273)))

(declare-fun b!290616 () Bool)

(assert (=> b!290616 (= e!207010 (= lt!421806 (_1!12666 lt!421807)))))

(declare-fun b!290617 () Bool)

(declare-fun res!240085 () Bool)

(assert (=> b!290617 (=> (not res!240085) (not e!207015))))

(assert (=> b!290617 (= res!240085 (validate_offset_bits!1 ((_ sign_extend 32) (size!7467 (buf!7533 thiss!1728))) ((_ sign_extend 32) (currentByte!13949 thiss!1728)) ((_ sign_extend 32) (currentBit!13944 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!290618 () Bool)

(declare-fun res!240087 () Bool)

(assert (=> b!290618 (=> (not res!240087) (not e!207015))))

(assert (=> b!290618 (= res!240087 (bvslt from!505 to!474))))

(declare-fun b!290619 () Bool)

(assert (=> b!290619 (= e!207014 (and (= (buf!7533 thiss!1728) (buf!7533 (_2!12665 lt!421809))) (= (size!7467 arr!273) (size!7467 (_3!1256 lt!421809)))))))

(assert (= (and start!64736 res!240088) b!290617))

(assert (= (and b!290617 res!240085) b!290618))

(assert (= (and b!290618 res!240087) b!290615))

(assert (= (and b!290615 res!240086) b!290619))

(assert (= (and b!290615 res!240089) b!290616))

(assert (= start!64736 b!290614))

(declare-fun m!424849 () Bool)

(assert (=> b!290614 m!424849))

(declare-fun m!424851 () Bool)

(assert (=> b!290615 m!424851))

(declare-fun m!424853 () Bool)

(assert (=> b!290615 m!424853))

(declare-fun m!424855 () Bool)

(assert (=> b!290615 m!424855))

(declare-fun m!424857 () Bool)

(assert (=> b!290615 m!424857))

(declare-fun m!424859 () Bool)

(assert (=> b!290615 m!424859))

(declare-fun m!424861 () Bool)

(assert (=> b!290615 m!424861))

(declare-fun m!424863 () Bool)

(assert (=> b!290615 m!424863))

(declare-fun m!424865 () Bool)

(assert (=> b!290615 m!424865))

(declare-fun m!424867 () Bool)

(assert (=> b!290615 m!424867))

(declare-fun m!424869 () Bool)

(assert (=> b!290615 m!424869))

(declare-fun m!424871 () Bool)

(assert (=> b!290615 m!424871))

(declare-fun m!424873 () Bool)

(assert (=> b!290615 m!424873))

(declare-fun m!424875 () Bool)

(assert (=> b!290615 m!424875))

(declare-fun m!424877 () Bool)

(assert (=> b!290615 m!424877))

(declare-fun m!424879 () Bool)

(assert (=> b!290615 m!424879))

(declare-fun m!424881 () Bool)

(assert (=> b!290615 m!424881))

(declare-fun m!424883 () Bool)

(assert (=> b!290615 m!424883))

(declare-fun m!424885 () Bool)

(assert (=> start!64736 m!424885))

(declare-fun m!424887 () Bool)

(assert (=> start!64736 m!424887))

(declare-fun m!424889 () Bool)

(assert (=> b!290617 m!424889))

(push 1)

(assert (not b!290614))

(assert (not b!290617))

(assert (not start!64736))

(assert (not b!290615))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!98482 () Bool)

(assert (=> d!98482 (= (array_inv!7079 (buf!7533 thiss!1728)) (bvsge (size!7467 (buf!7533 thiss!1728)) #b00000000000000000000000000000000))))

(assert (=> b!290614 d!98482))

(declare-fun d!98484 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!98484 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7467 (buf!7533 thiss!1728))) ((_ sign_extend 32) (currentByte!13949 thiss!1728)) ((_ sign_extend 32) (currentBit!13944 thiss!1728)) (bvsub nBits!523 from!505)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7467 (buf!7533 thiss!1728))) ((_ sign_extend 32) (currentByte!13949 thiss!1728)) ((_ sign_extend 32) (currentBit!13944 thiss!1728))) (bvsub nBits!523 from!505)))))

(declare-fun bs!25084 () Bool)

(assert (= bs!25084 d!98484))

(declare-fun m!424925 () Bool)

(assert (=> bs!25084 m!424925))

(assert (=> b!290617 d!98484))

(declare-fun d!98486 () Bool)

(assert (=> d!98486 (= (inv!12 thiss!1728) (invariant!0 (currentBit!13944 thiss!1728) (currentByte!13949 thiss!1728) (size!7467 (buf!7533 thiss!1728))))))

(declare-fun bs!25085 () Bool)

(assert (= bs!25085 d!98486))

(declare-fun m!424927 () Bool)

(assert (=> bs!25085 m!424927))

(assert (=> start!64736 d!98486))

(declare-fun d!98488 () Bool)

(assert (=> d!98488 (= (array_inv!7079 arr!273) (bvsge (size!7467 arr!273) #b00000000000000000000000000000000))))

(assert (=> start!64736 d!98488))

(declare-fun d!98490 () Bool)

(assert (=> d!98490 (= (bitAt!0 lt!421804 from!505) (not (= (bvand ((_ sign_extend 24) (select (arr!8475 lt!421804) ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!25086 () Bool)

(assert (= bs!25086 d!98490))

(declare-fun m!424929 () Bool)

(assert (=> bs!25086 m!424929))

(declare-fun m!424931 () Bool)

(assert (=> bs!25086 m!424931))

(assert (=> b!290615 d!98490))

(declare-fun d!98492 () Bool)

(assert (=> d!98492 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7467 (buf!7533 (_2!12666 lt!421807)))) ((_ sign_extend 32) (currentByte!13949 (_2!12666 lt!421807))) ((_ sign_extend 32) (currentBit!13944 (_2!12666 lt!421807))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7467 (buf!7533 (_2!12666 lt!421807)))) ((_ sign_extend 32) (currentByte!13949 (_2!12666 lt!421807))) ((_ sign_extend 32) (currentBit!13944 (_2!12666 lt!421807)))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!25087 () Bool)

(assert (= bs!25087 d!98492))

(declare-fun m!424933 () Bool)

(assert (=> bs!25087 m!424933))

(assert (=> b!290615 d!98492))

(declare-fun d!98494 () Bool)

(assert (=> d!98494 (= (bitAt!0 (_3!1256 lt!421809) from!505) (not (= (bvand ((_ sign_extend 24) (select (arr!8475 (_3!1256 lt!421809)) ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!25088 () Bool)

(assert (= bs!25088 d!98494))

(declare-fun m!424935 () Bool)

(assert (=> bs!25088 m!424935))

(assert (=> bs!25088 m!424931))

(assert (=> b!290615 d!98494))

(declare-fun d!98496 () Bool)

(assert (=> d!98496 (arrayBitRangesEq!0 arr!273 (_3!1256 lt!421809) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!421851 () Unit!20187)

(declare-fun choose!49 (array!17250 array!17250 array!17250 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20187)

(assert (=> d!98496 (= lt!421851 (choose!49 arr!273 lt!421804 (_3!1256 lt!421809) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!98496 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!98496 (= (arrayBitRangesEqTransitive!0 arr!273 lt!421804 (_3!1256 lt!421809) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) lt!421851)))

(declare-fun bs!25089 () Bool)

(assert (= bs!25089 d!98496))

(assert (=> bs!25089 m!424875))

(declare-fun m!424937 () Bool)

(assert (=> bs!25089 m!424937))

(assert (=> b!290615 d!98496))

(declare-fun d!98498 () Bool)

(assert (=> d!98498 (= (invariant!0 (currentBit!13944 (_2!12665 lt!421809)) (currentByte!13949 (_2!12665 lt!421809)) (size!7467 (buf!7533 (_2!12665 lt!421809)))) (and (bvsge (currentBit!13944 (_2!12665 lt!421809)) #b00000000000000000000000000000000) (bvslt (currentBit!13944 (_2!12665 lt!421809)) #b00000000000000000000000000001000) (bvsge (currentByte!13949 (_2!12665 lt!421809)) #b00000000000000000000000000000000) (or (bvslt (currentByte!13949 (_2!12665 lt!421809)) (size!7467 (buf!7533 (_2!12665 lt!421809)))) (and (= (currentBit!13944 (_2!12665 lt!421809)) #b00000000000000000000000000000000) (= (currentByte!13949 (_2!12665 lt!421809)) (size!7467 (buf!7533 (_2!12665 lt!421809))))))))))

(assert (=> b!290615 d!98498))

(declare-fun b!290667 () Bool)

(declare-fun e!207057 () Bool)

(declare-fun e!207055 () Bool)

(assert (=> b!290667 (= e!207057 e!207055)))

(declare-fun res!240127 () Bool)

(declare-fun call!4826 () Bool)

(assert (=> b!290667 (= res!240127 call!4826)))

(assert (=> b!290667 (=> (not res!240127) (not e!207055))))

(declare-fun b!290668 () Bool)

(declare-fun res!240130 () Bool)

(declare-fun lt!421859 () (_ BitVec 32))

(assert (=> b!290668 (= res!240130 (= lt!421859 #b00000000000000000000000000000000))))

(declare-fun e!207060 () Bool)

(assert (=> b!290668 (=> res!240130 e!207060)))

(assert (=> b!290668 (= e!207055 e!207060)))

(declare-fun b!290669 () Bool)

(declare-fun e!207056 () Bool)

(declare-fun e!207058 () Bool)

(assert (=> b!290669 (= e!207056 e!207058)))

(declare-fun res!240128 () Bool)

(assert (=> b!290669 (=> (not res!240128) (not e!207058))))

(declare-fun e!207059 () Bool)

(assert (=> b!290669 (= res!240128 e!207059)))

(declare-fun res!240129 () Bool)

(assert (=> b!290669 (=> res!240129 e!207059)))

(declare-datatypes ((tuple4!838 0))(
  ( (tuple4!839 (_1!12672 (_ BitVec 32)) (_2!12672 (_ BitVec 32)) (_3!1259 (_ BitVec 32)) (_4!419 (_ BitVec 32))) )
))
(declare-fun lt!421858 () tuple4!838)

(assert (=> b!290669 (= res!240129 (bvsge (_1!12672 lt!421858) (_2!12672 lt!421858)))))

(assert (=> b!290669 (= lt!421859 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!421860 () (_ BitVec 32))

(assert (=> b!290669 (= lt!421860 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!838)

(assert (=> b!290669 (= lt!421858 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(declare-fun b!290670 () Bool)

(assert (=> b!290670 (= e!207058 e!207057)))

(declare-fun c!13287 () Bool)

(assert (=> b!290670 (= c!13287 (= (_3!1259 lt!421858) (_4!419 lt!421858)))))

(declare-fun b!290671 () Bool)

(declare-fun arrayRangesEq!1477 (array!17250 array!17250 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!290671 (= e!207059 (arrayRangesEq!1477 arr!273 lt!421804 (_1!12672 lt!421858) (_2!12672 lt!421858)))))

(declare-fun d!98500 () Bool)

(declare-fun res!240131 () Bool)

(assert (=> d!98500 (=> res!240131 e!207056)))

(assert (=> d!98500 (= res!240131 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!98500 (= (arrayBitRangesEq!0 arr!273 lt!421804 #b0000000000000000000000000000000000000000000000000000000000000000 from!505) e!207056)))

(declare-fun b!290672 () Bool)

(assert (=> b!290672 (= e!207057 call!4826)))

(declare-fun b!290673 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!290673 (= e!207060 (byteRangesEq!0 (select (arr!8475 arr!273) (_4!419 lt!421858)) (select (arr!8475 lt!421804) (_4!419 lt!421858)) #b00000000000000000000000000000000 lt!421859))))

(declare-fun bm!4823 () Bool)

(assert (=> bm!4823 (= call!4826 (byteRangesEq!0 (select (arr!8475 arr!273) (_3!1259 lt!421858)) (select (arr!8475 lt!421804) (_3!1259 lt!421858)) lt!421860 (ite c!13287 lt!421859 #b00000000000000000000000000001000)))))

(assert (= (and d!98500 (not res!240131)) b!290669))

(assert (= (and b!290669 (not res!240129)) b!290671))

(assert (= (and b!290669 res!240128) b!290670))

(assert (= (and b!290670 c!13287) b!290672))

(assert (= (and b!290670 (not c!13287)) b!290667))

(assert (= (and b!290667 res!240127) b!290668))

(assert (= (and b!290668 (not res!240130)) b!290673))

(assert (= (or b!290672 b!290667) bm!4823))

(declare-fun m!424939 () Bool)

(assert (=> b!290669 m!424939))

(declare-fun m!424941 () Bool)

(assert (=> b!290671 m!424941))

(declare-fun m!424943 () Bool)

(assert (=> b!290673 m!424943))

(declare-fun m!424945 () Bool)

(assert (=> b!290673 m!424945))

(assert (=> b!290673 m!424943))

(assert (=> b!290673 m!424945))

(declare-fun m!424947 () Bool)

(assert (=> b!290673 m!424947))

(declare-fun m!424949 () Bool)

(assert (=> bm!4823 m!424949))

(declare-fun m!424951 () Bool)

(assert (=> bm!4823 m!424951))

(assert (=> bm!4823 m!424949))

(assert (=> bm!4823 m!424951))

(declare-fun m!424953 () Bool)

(assert (=> bm!4823 m!424953))

(assert (=> b!290615 d!98500))

(declare-fun d!98502 () Bool)

(declare-fun e!207063 () Bool)

(assert (=> d!98502 e!207063))

(declare-fun res!240134 () Bool)

(assert (=> d!98502 (=> (not res!240134) (not e!207063))))

(declare-fun lt!421870 () (_ BitVec 32))

(assert (=> d!98502 (= res!240134 (and (bvsge lt!421870 #b00000000000000000000000000000000) (bvslt lt!421870 (size!7467 arr!273))))))

(declare-fun lt!421871 () (_ BitVec 32))

(declare-fun lt!421869 () (_ BitVec 8))

(declare-fun lt!421872 () Unit!20187)

(declare-fun choose!53 (array!17250 (_ BitVec 64) Bool (_ BitVec 32) (_ BitVec 32) (_ BitVec 8)) Unit!20187)

(assert (=> d!98502 (= lt!421872 (choose!53 arr!273 from!505 (_1!12666 lt!421807) lt!421870 lt!421871 lt!421869))))

(assert (=> d!98502 (= lt!421869 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8475 arr!273) lt!421870)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!421871)))) ((_ sign_extend 24) (ite (_1!12666 lt!421807) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!421871) #b00000000)))))))

(assert (=> d!98502 (= lt!421871 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> d!98502 (= lt!421870 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> d!98502 (= (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12666 lt!421807)) lt!421872)))

(declare-fun b!290677 () Bool)

(assert (=> b!290677 (= e!207063 (arrayBitRangesEq!0 arr!273 (array!17251 (store (arr!8475 arr!273) lt!421870 lt!421869) (size!7467 arr!273)) #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (= (and d!98502 res!240134) b!290677))

(declare-fun m!424955 () Bool)

(assert (=> d!98502 m!424955))

(declare-fun m!424957 () Bool)

(assert (=> d!98502 m!424957))

(declare-fun m!424959 () Bool)

(assert (=> d!98502 m!424959))

(declare-fun m!424961 () Bool)

(assert (=> b!290677 m!424961))

(declare-fun m!424963 () Bool)

(assert (=> b!290677 m!424963))

(assert (=> b!290615 d!98502))

(declare-fun b!290678 () Bool)

(declare-fun e!207066 () Bool)

(declare-fun e!207064 () Bool)

(assert (=> b!290678 (= e!207066 e!207064)))

(declare-fun res!240135 () Bool)

(declare-fun call!4827 () Bool)

(assert (=> b!290678 (= res!240135 call!4827)))

(assert (=> b!290678 (=> (not res!240135) (not e!207064))))

(declare-fun b!290679 () Bool)

(declare-fun res!240138 () Bool)

(declare-fun lt!421874 () (_ BitVec 32))

(assert (=> b!290679 (= res!240138 (= lt!421874 #b00000000000000000000000000000000))))

(declare-fun e!207069 () Bool)

(assert (=> b!290679 (=> res!240138 e!207069)))

(assert (=> b!290679 (= e!207064 e!207069)))

(declare-fun b!290680 () Bool)

(declare-fun e!207065 () Bool)

(declare-fun e!207067 () Bool)

(assert (=> b!290680 (= e!207065 e!207067)))

(declare-fun res!240136 () Bool)

(assert (=> b!290680 (=> (not res!240136) (not e!207067))))

(declare-fun e!207068 () Bool)

(assert (=> b!290680 (= res!240136 e!207068)))

(declare-fun res!240137 () Bool)

(assert (=> b!290680 (=> res!240137 e!207068)))

(declare-fun lt!421873 () tuple4!838)

(assert (=> b!290680 (= res!240137 (bvsge (_1!12672 lt!421873) (_2!12672 lt!421873)))))

(assert (=> b!290680 (= lt!421874 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!421875 () (_ BitVec 32))

(assert (=> b!290680 (= lt!421875 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!290680 (= lt!421873 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(declare-fun b!290681 () Bool)

(assert (=> b!290681 (= e!207067 e!207066)))

(declare-fun c!13288 () Bool)

(assert (=> b!290681 (= c!13288 (= (_3!1259 lt!421873) (_4!419 lt!421873)))))

(declare-fun b!290682 () Bool)

(assert (=> b!290682 (= e!207068 (arrayRangesEq!1477 arr!273 (_3!1256 lt!421809) (_1!12672 lt!421873) (_2!12672 lt!421873)))))

(declare-fun d!98504 () Bool)

(declare-fun res!240139 () Bool)

(assert (=> d!98504 (=> res!240139 e!207065)))

(assert (=> d!98504 (= res!240139 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!98504 (= (arrayBitRangesEq!0 arr!273 (_3!1256 lt!421809) #b0000000000000000000000000000000000000000000000000000000000000000 from!505) e!207065)))

(declare-fun b!290683 () Bool)

(assert (=> b!290683 (= e!207066 call!4827)))

(declare-fun b!290684 () Bool)

(assert (=> b!290684 (= e!207069 (byteRangesEq!0 (select (arr!8475 arr!273) (_4!419 lt!421873)) (select (arr!8475 (_3!1256 lt!421809)) (_4!419 lt!421873)) #b00000000000000000000000000000000 lt!421874))))

(declare-fun bm!4824 () Bool)

(assert (=> bm!4824 (= call!4827 (byteRangesEq!0 (select (arr!8475 arr!273) (_3!1259 lt!421873)) (select (arr!8475 (_3!1256 lt!421809)) (_3!1259 lt!421873)) lt!421875 (ite c!13288 lt!421874 #b00000000000000000000000000001000)))))

(assert (= (and d!98504 (not res!240139)) b!290680))

(assert (= (and b!290680 (not res!240137)) b!290682))

(assert (= (and b!290680 res!240136) b!290681))

(assert (= (and b!290681 c!13288) b!290683))

(assert (= (and b!290681 (not c!13288)) b!290678))

(assert (= (and b!290678 res!240135) b!290679))

(assert (= (and b!290679 (not res!240138)) b!290684))

(assert (= (or b!290683 b!290678) bm!4824))

(assert (=> b!290680 m!424939))

(declare-fun m!424965 () Bool)

(assert (=> b!290682 m!424965))

(declare-fun m!424967 () Bool)

(assert (=> b!290684 m!424967))

(declare-fun m!424969 () Bool)

(assert (=> b!290684 m!424969))

(assert (=> b!290684 m!424967))

(assert (=> b!290684 m!424969))

(declare-fun m!424971 () Bool)

(assert (=> b!290684 m!424971))

(declare-fun m!424973 () Bool)

(assert (=> bm!4824 m!424973))

(declare-fun m!424975 () Bool)

(assert (=> bm!4824 m!424975))

(assert (=> bm!4824 m!424973))

(assert (=> bm!4824 m!424975))

(declare-fun m!424977 () Bool)

(assert (=> bm!4824 m!424977))

(assert (=> b!290615 d!98504))

(declare-fun d!98506 () Bool)

(declare-fun e!207072 () Bool)

(assert (=> d!98506 e!207072))

(declare-fun res!240142 () Bool)

(assert (=> d!98506 (=> (not res!240142) (not e!207072))))

(assert (=> d!98506 (= res!240142 (or (= (bvand (bvsub nBits!523 from!505) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!523 from!505) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!421878 () Unit!20187)

(declare-fun choose!27 (BitStream!12944 BitStream!12944 (_ BitVec 64) (_ BitVec 64)) Unit!20187)

(assert (=> d!98506 (= lt!421878 (choose!27 thiss!1728 (_2!12666 lt!421807) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!98506 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!523 from!505)))))

(assert (=> d!98506 (= (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12666 lt!421807) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001) lt!421878)))

(declare-fun b!290687 () Bool)

(assert (=> b!290687 (= e!207072 (validate_offset_bits!1 ((_ sign_extend 32) (size!7467 (buf!7533 (_2!12666 lt!421807)))) ((_ sign_extend 32) (currentByte!13949 (_2!12666 lt!421807))) ((_ sign_extend 32) (currentBit!13944 (_2!12666 lt!421807))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!98506 res!240142) b!290687))

(declare-fun m!424979 () Bool)

(assert (=> d!98506 m!424979))

(assert (=> b!290687 m!424867))

(assert (=> b!290615 d!98506))

(declare-fun d!98508 () Bool)

(declare-fun e!207075 () Bool)

(assert (=> d!98508 e!207075))

(declare-fun res!240147 () Bool)

(assert (=> d!98508 (=> (not res!240147) (not e!207075))))

(declare-fun lt!421896 () (_ BitVec 64))

(declare-fun lt!421894 () (_ BitVec 64))

(declare-fun lt!421893 () (_ BitVec 64))

(assert (=> d!98508 (= res!240147 (= lt!421896 (bvsub lt!421893 lt!421894)))))

(assert (=> d!98508 (or (= (bvand lt!421893 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!421894 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!421893 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!421893 lt!421894) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!98508 (= lt!421894 (remainingBits!0 ((_ sign_extend 32) (size!7467 (buf!7533 thiss!1728))) ((_ sign_extend 32) (currentByte!13949 thiss!1728)) ((_ sign_extend 32) (currentBit!13944 thiss!1728))))))

(declare-fun lt!421895 () (_ BitVec 64))

(declare-fun lt!421891 () (_ BitVec 64))

(assert (=> d!98508 (= lt!421893 (bvmul lt!421895 lt!421891))))

(assert (=> d!98508 (or (= lt!421895 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!421891 (bvsdiv (bvmul lt!421895 lt!421891) lt!421895)))))

(assert (=> d!98508 (= lt!421891 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!98508 (= lt!421895 ((_ sign_extend 32) (size!7467 (buf!7533 thiss!1728))))))

(assert (=> d!98508 (= lt!421896 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13949 thiss!1728)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13944 thiss!1728))))))

(assert (=> d!98508 (invariant!0 (currentBit!13944 thiss!1728) (currentByte!13949 thiss!1728) (size!7467 (buf!7533 thiss!1728)))))

(assert (=> d!98508 (= (bitIndex!0 (size!7467 (buf!7533 thiss!1728)) (currentByte!13949 thiss!1728) (currentBit!13944 thiss!1728)) lt!421896)))

(declare-fun b!290692 () Bool)

(declare-fun res!240148 () Bool)

(assert (=> b!290692 (=> (not res!240148) (not e!207075))))

(assert (=> b!290692 (= res!240148 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!421896))))

(declare-fun b!290693 () Bool)

(declare-fun lt!421892 () (_ BitVec 64))

(assert (=> b!290693 (= e!207075 (bvsle lt!421896 (bvmul lt!421892 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!290693 (or (= lt!421892 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!421892 #b0000000000000000000000000000000000000000000000000000000000001000) lt!421892)))))

(assert (=> b!290693 (= lt!421892 ((_ sign_extend 32) (size!7467 (buf!7533 thiss!1728))))))

(assert (= (and d!98508 res!240147) b!290692))

(assert (= (and b!290692 res!240148) b!290693))

(assert (=> d!98508 m!424925))

(assert (=> d!98508 m!424927))

(assert (=> b!290615 d!98508))

(declare-fun d!98510 () Bool)

(assert (=> d!98510 (= (bitAt!0 lt!421804 from!505) (bitAt!0 (_3!1256 lt!421809) from!505))))

(declare-fun lt!421899 () Unit!20187)

(declare-fun choose!31 (array!17250 array!17250 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20187)

(assert (=> d!98510 (= lt!421899 (choose!31 lt!421804 (_3!1256 lt!421809) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!98510 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!98510 (= (arrayBitRangesEqImpliesEq!0 lt!421804 (_3!1256 lt!421809) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) lt!421899)))

(declare-fun bs!25090 () Bool)

(assert (= bs!25090 d!98510))

(assert (=> bs!25090 m!424869))

(assert (=> bs!25090 m!424873))

(declare-fun m!424981 () Bool)

(assert (=> bs!25090 m!424981))

(assert (=> b!290615 d!98510))

(declare-fun d!98512 () Bool)

(declare-fun e!207076 () Bool)

(assert (=> d!98512 e!207076))

(declare-fun res!240149 () Bool)

(assert (=> d!98512 (=> (not res!240149) (not e!207076))))

(declare-fun lt!421903 () (_ BitVec 64))

(declare-fun lt!421902 () (_ BitVec 64))

(declare-fun lt!421905 () (_ BitVec 64))

(assert (=> d!98512 (= res!240149 (= lt!421905 (bvsub lt!421902 lt!421903)))))

(assert (=> d!98512 (or (= (bvand lt!421902 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!421903 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!421902 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!421902 lt!421903) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!98512 (= lt!421903 (remainingBits!0 ((_ sign_extend 32) (size!7467 (buf!7533 (_2!12665 lt!421809)))) ((_ sign_extend 32) (currentByte!13949 (_2!12665 lt!421809))) ((_ sign_extend 32) (currentBit!13944 (_2!12665 lt!421809)))))))

(declare-fun lt!421904 () (_ BitVec 64))

(declare-fun lt!421900 () (_ BitVec 64))

(assert (=> d!98512 (= lt!421902 (bvmul lt!421904 lt!421900))))

(assert (=> d!98512 (or (= lt!421904 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!421900 (bvsdiv (bvmul lt!421904 lt!421900) lt!421904)))))

(assert (=> d!98512 (= lt!421900 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!98512 (= lt!421904 ((_ sign_extend 32) (size!7467 (buf!7533 (_2!12665 lt!421809)))))))

(assert (=> d!98512 (= lt!421905 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13949 (_2!12665 lt!421809))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13944 (_2!12665 lt!421809)))))))

(assert (=> d!98512 (invariant!0 (currentBit!13944 (_2!12665 lt!421809)) (currentByte!13949 (_2!12665 lt!421809)) (size!7467 (buf!7533 (_2!12665 lt!421809))))))

(assert (=> d!98512 (= (bitIndex!0 (size!7467 (buf!7533 (_2!12665 lt!421809))) (currentByte!13949 (_2!12665 lt!421809)) (currentBit!13944 (_2!12665 lt!421809))) lt!421905)))

(declare-fun b!290694 () Bool)

(declare-fun res!240150 () Bool)

(assert (=> b!290694 (=> (not res!240150) (not e!207076))))

(assert (=> b!290694 (= res!240150 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!421905))))

(declare-fun b!290695 () Bool)

(declare-fun lt!421901 () (_ BitVec 64))

(assert (=> b!290695 (= e!207076 (bvsle lt!421905 (bvmul lt!421901 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!290695 (or (= lt!421901 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!421901 #b0000000000000000000000000000000000000000000000000000000000001000) lt!421901)))))

(assert (=> b!290695 (= lt!421901 ((_ sign_extend 32) (size!7467 (buf!7533 (_2!12665 lt!421809)))))))

(assert (= (and d!98512 res!240149) b!290694))

(assert (= (and b!290694 res!240150) b!290695))

(declare-fun m!424983 () Bool)

(assert (=> d!98512 m!424983))

(assert (=> d!98512 m!424871))

(assert (=> b!290615 d!98512))

(declare-fun d!98514 () Bool)

(declare-fun e!207083 () Bool)

(assert (=> d!98514 e!207083))

(declare-fun res!240153 () Bool)

(assert (=> d!98514 (=> (not res!240153) (not e!207083))))

(declare-datatypes ((tuple2!22828 0))(
  ( (tuple2!22829 (_1!12674 Unit!20187) (_2!12674 BitStream!12944)) )
))
(declare-fun increaseBitIndex!0 (BitStream!12944) tuple2!22828)

(assert (=> d!98514 (= res!240153 (= (buf!7533 (_2!12674 (increaseBitIndex!0 thiss!1728))) (buf!7533 thiss!1728)))))

(declare-fun lt!421921 () Bool)

(assert (=> d!98514 (= lt!421921 (not (= (bvand ((_ sign_extend 24) (select (arr!8475 (buf!7533 thiss!1728)) (currentByte!13949 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13944 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!421923 () tuple2!22818)

(assert (=> d!98514 (= lt!421923 (tuple2!22819 (not (= (bvand ((_ sign_extend 24) (select (arr!8475 (buf!7533 thiss!1728)) (currentByte!13949 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13944 thiss!1728)))) #b00000000000000000000000000000000)) (_2!12674 (increaseBitIndex!0 thiss!1728))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!98514 (validate_offset_bit!0 ((_ sign_extend 32) (size!7467 (buf!7533 thiss!1728))) ((_ sign_extend 32) (currentByte!13949 thiss!1728)) ((_ sign_extend 32) (currentBit!13944 thiss!1728)))))

(assert (=> d!98514 (= (readBit!0 thiss!1728) lt!421923)))

(declare-fun b!290698 () Bool)

(declare-fun lt!421920 () (_ BitVec 64))

(declare-fun lt!421924 () (_ BitVec 64))

(assert (=> b!290698 (= e!207083 (= (bitIndex!0 (size!7467 (buf!7533 (_2!12674 (increaseBitIndex!0 thiss!1728)))) (currentByte!13949 (_2!12674 (increaseBitIndex!0 thiss!1728))) (currentBit!13944 (_2!12674 (increaseBitIndex!0 thiss!1728)))) (bvadd lt!421920 lt!421924)))))

(assert (=> b!290698 (or (not (= (bvand lt!421920 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!421924 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!421920 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!421920 lt!421924) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!290698 (= lt!421924 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!290698 (= lt!421920 (bitIndex!0 (size!7467 (buf!7533 thiss!1728)) (currentByte!13949 thiss!1728) (currentBit!13944 thiss!1728)))))

(declare-fun lt!421922 () Bool)

(assert (=> b!290698 (= lt!421922 (not (= (bvand ((_ sign_extend 24) (select (arr!8475 (buf!7533 thiss!1728)) (currentByte!13949 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13944 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!421926 () Bool)

(assert (=> b!290698 (= lt!421926 (not (= (bvand ((_ sign_extend 24) (select (arr!8475 (buf!7533 thiss!1728)) (currentByte!13949 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13944 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!421925 () Bool)

(assert (=> b!290698 (= lt!421925 (not (= (bvand ((_ sign_extend 24) (select (arr!8475 (buf!7533 thiss!1728)) (currentByte!13949 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13944 thiss!1728)))) #b00000000000000000000000000000000)))))

(assert (= (and d!98514 res!240153) b!290698))

(declare-fun m!424985 () Bool)

(assert (=> d!98514 m!424985))

(declare-fun m!424987 () Bool)

(assert (=> d!98514 m!424987))

(declare-fun m!424989 () Bool)

(assert (=> d!98514 m!424989))

(declare-fun m!424991 () Bool)

(assert (=> d!98514 m!424991))

(assert (=> b!290698 m!424985))

(assert (=> b!290698 m!424989))

(assert (=> b!290698 m!424987))

(declare-fun m!424993 () Bool)

(assert (=> b!290698 m!424993))

(assert (=> b!290698 m!424865))

(assert (=> b!290615 d!98514))

(declare-fun b!290830 () Bool)

(declare-fun res!240260 () Bool)

(declare-fun e!207172 () Bool)

(assert (=> b!290830 (=> (not res!240260) (not e!207172))))

(declare-fun lt!422362 () tuple3!1678)

(assert (=> b!290830 (= res!240260 (and (= (buf!7533 (_2!12666 lt!421807)) (buf!7533 (_2!12665 lt!422362))) (= (size!7467 lt!421804) (size!7467 (_3!1256 lt!422362)))))))

(declare-fun b!290831 () Bool)

(declare-fun lt!422349 () tuple3!1678)

(declare-fun e!207173 () Bool)

(assert (=> b!290831 (= e!207173 (and (= (buf!7533 (_2!12666 lt!421807)) (buf!7533 (_2!12665 lt!422349))) (= (size!7467 lt!421804) (size!7467 (_3!1256 lt!422349)))))))

(declare-fun c!13302 () Bool)

(declare-fun bm!4846 () Bool)

(declare-fun lt!422340 () (_ BitVec 32))

(declare-fun call!4850 () Bool)

(declare-fun lt!422358 () tuple2!22818)

(declare-fun lt!422354 () (_ BitVec 32))

(assert (=> bm!4846 (= call!4850 (arrayBitRangesEq!0 lt!421804 (ite c!13302 (array!17251 (store (arr!8475 lt!421804) lt!422340 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8475 lt!421804) lt!422340)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!422354)))) ((_ sign_extend 24) (ite (_1!12666 lt!422358) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!422354) #b00000000))))) (size!7467 lt!421804)) lt!421804) #b0000000000000000000000000000000000000000000000000000000000000000 (ite c!13302 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvmul ((_ sign_extend 32) (size!7467 lt!421804)) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!290832 () Bool)

(declare-fun e!207171 () Bool)

(declare-datatypes ((tuple2!22830 0))(
  ( (tuple2!22831 (_1!12675 BitStream!12944) (_2!12675 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!12944) tuple2!22830)

(assert (=> b!290832 (= e!207171 (= (bitAt!0 (_3!1256 lt!422362) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (_2!12675 (readBitPure!0 (_2!12666 lt!421807)))))))

(declare-fun d!98516 () Bool)

(assert (=> d!98516 e!207172))

(declare-fun res!240257 () Bool)

(assert (=> d!98516 (=> (not res!240257) (not e!207172))))

(declare-fun lt!422348 () (_ BitVec 64))

(assert (=> d!98516 (= res!240257 (= (bvsub lt!422348 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitIndex!0 (size!7467 (buf!7533 (_2!12665 lt!422362))) (currentByte!13949 (_2!12665 lt!422362)) (currentBit!13944 (_2!12665 lt!422362)))))))

(assert (=> d!98516 (or (= (bvand lt!422348 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!422348 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!422348 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!422366 () (_ BitVec 64))

(assert (=> d!98516 (= lt!422348 (bvadd lt!422366 to!474))))

(assert (=> d!98516 (or (not (= (bvand lt!422366 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!422366 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!422366 to!474) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!98516 (= lt!422366 (bitIndex!0 (size!7467 (buf!7533 (_2!12666 lt!421807))) (currentByte!13949 (_2!12666 lt!421807)) (currentBit!13944 (_2!12666 lt!421807))))))

(declare-fun e!207174 () tuple3!1678)

(assert (=> d!98516 (= lt!422362 e!207174)))

(assert (=> d!98516 (= c!13302 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> d!98516 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!98516 (= (readBitsLoop!0 (_2!12666 lt!421807) nBits!523 lt!421804 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474) lt!422362)))

(declare-fun b!290833 () Bool)

(declare-fun lt!422341 () Unit!20187)

(assert (=> b!290833 (= e!207174 (tuple3!1679 lt!422341 (_2!12665 lt!422349) (_3!1256 lt!422349)))))

(assert (=> b!290833 (= lt!422358 (readBit!0 (_2!12666 lt!421807)))))

(declare-fun lt!422347 () (_ BitVec 32))

(assert (=> b!290833 (= lt!422347 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!422333 () (_ BitVec 32))

(assert (=> b!290833 (= lt!422333 ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!422338 () array!17250)

(assert (=> b!290833 (= lt!422338 (array!17251 (store (arr!8475 lt!421804) lt!422347 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8475 lt!421804) lt!422347)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!422333)))) ((_ sign_extend 24) (ite (_1!12666 lt!422358) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!422333) #b00000000))))) (size!7467 lt!421804)))))

(declare-fun lt!422344 () (_ BitVec 64))

(assert (=> b!290833 (= lt!422344 (bvsub nBits!523 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun lt!422355 () (_ BitVec 64))

(assert (=> b!290833 (= lt!422355 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!422337 () Unit!20187)

(assert (=> b!290833 (= lt!422337 (validateOffsetBitsIneqLemma!0 (_2!12666 lt!421807) (_2!12666 lt!422358) lt!422344 lt!422355))))

(assert (=> b!290833 (validate_offset_bits!1 ((_ sign_extend 32) (size!7467 (buf!7533 (_2!12666 lt!422358)))) ((_ sign_extend 32) (currentByte!13949 (_2!12666 lt!422358))) ((_ sign_extend 32) (currentBit!13944 (_2!12666 lt!422358))) (bvsub lt!422344 lt!422355))))

(declare-fun lt!422335 () Unit!20187)

(assert (=> b!290833 (= lt!422335 lt!422337)))

(assert (=> b!290833 (= lt!422349 (readBitsLoop!0 (_2!12666 lt!422358) nBits!523 lt!422338 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001) to!474))))

(declare-fun res!240258 () Bool)

(assert (=> b!290833 (= res!240258 (= (bvsub (bvadd (bitIndex!0 (size!7467 (buf!7533 (_2!12666 lt!421807))) (currentByte!13949 (_2!12666 lt!421807)) (currentBit!13944 (_2!12666 lt!421807))) to!474) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitIndex!0 (size!7467 (buf!7533 (_2!12665 lt!422349))) (currentByte!13949 (_2!12665 lt!422349)) (currentBit!13944 (_2!12665 lt!422349)))))))

(assert (=> b!290833 (=> (not res!240258) (not e!207173))))

(assert (=> b!290833 e!207173))

(declare-fun lt!422342 () Unit!20187)

(declare-fun Unit!20197 () Unit!20187)

(assert (=> b!290833 (= lt!422342 Unit!20197)))

(assert (=> b!290833 (= lt!422340 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!290833 (= lt!422354 ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!422364 () Unit!20187)

(assert (=> b!290833 (= lt!422364 (arrayBitRangesUpdatedAtLemma!0 lt!421804 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (_1!12666 lt!422358)))))

(assert (=> b!290833 call!4850))

(declare-fun lt!422350 () Unit!20187)

(assert (=> b!290833 (= lt!422350 lt!422364)))

(declare-fun lt!422345 () (_ BitVec 64))

(assert (=> b!290833 (= lt!422345 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!422346 () Unit!20187)

(assert (=> b!290833 (= lt!422346 (arrayBitRangesEqTransitive!0 lt!421804 lt!422338 (_3!1256 lt!422349) lt!422345 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun call!4849 () Bool)

(assert (=> b!290833 call!4849))

(declare-fun lt!422353 () Unit!20187)

(assert (=> b!290833 (= lt!422353 lt!422346)))

(assert (=> b!290833 (arrayBitRangesEq!0 lt!421804 (_3!1256 lt!422349) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))))

(declare-fun lt!422339 () Unit!20187)

(declare-fun Unit!20198 () Unit!20187)

(assert (=> b!290833 (= lt!422339 Unit!20198)))

(declare-fun lt!422361 () Unit!20187)

(assert (=> b!290833 (= lt!422361 (arrayBitRangesEqImpliesEq!0 lt!422338 (_3!1256 lt!422349) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!290833 (= (bitAt!0 lt!422338 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitAt!0 (_3!1256 lt!422349) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun lt!422357 () Unit!20187)

(assert (=> b!290833 (= lt!422357 lt!422361)))

(declare-fun lt!422343 () Unit!20187)

(declare-fun Unit!20199 () Unit!20187)

(assert (=> b!290833 (= lt!422343 Unit!20199)))

(declare-fun lt!422352 () Bool)

(assert (=> b!290833 (= lt!422352 (= (bitAt!0 (_3!1256 lt!422349) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (_1!12666 lt!422358)))))

(declare-fun Unit!20200 () Unit!20187)

(assert (=> b!290833 (= lt!422341 Unit!20200)))

(assert (=> b!290833 lt!422352))

(declare-fun b!290834 () Bool)

(declare-datatypes ((List!959 0))(
  ( (Nil!956) (Cons!955 (h!1074 Bool) (t!1844 List!959)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!12944 array!17250 (_ BitVec 64) (_ BitVec 64)) List!959)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!12944 BitStream!12944 (_ BitVec 64)) List!959)

(assert (=> b!290834 (= e!207172 (= (byteArrayBitContentToList!0 (_2!12665 lt!422362) (_3!1256 lt!422362) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))) (bitStreamReadBitsIntoList!0 (_2!12665 lt!422362) (_2!12666 lt!421807) (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))))

(assert (=> b!290834 (or (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

