; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65228 () Bool)

(assert start!65228)

(declare-fun b!292753 () Bool)

(declare-fun e!208894 () Bool)

(declare-fun e!208893 () Bool)

(assert (=> b!292753 (= e!208894 (not e!208893))))

(declare-fun res!241790 () Bool)

(assert (=> b!292753 (=> res!241790 e!208893)))

(declare-fun lt!425011 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(assert (=> b!292753 (= res!241790 (not (= (bvsub (bvadd lt!425011 to!474) from!505) lt!425011)))))

(declare-datatypes ((array!17433 0))(
  ( (array!17434 (arr!8577 (Array (_ BitVec 32) (_ BitVec 8))) (size!7551 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13112 0))(
  ( (BitStream!13113 (buf!7617 array!17433) (currentByte!14072 (_ BitVec 32)) (currentBit!14067 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13112)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!292753 (= lt!425011 (bitIndex!0 (size!7551 (buf!7617 thiss!1728)) (currentByte!14072 thiss!1728) (currentBit!14067 thiss!1728)))))

(declare-fun arr!273 () array!17433)

(declare-fun arrayBitRangesEq!0 (array!17433 array!17433 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292753 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((Unit!20391 0))(
  ( (Unit!20392) )
))
(declare-fun lt!425010 () Unit!20391)

(declare-fun lt!425012 () (_ BitVec 64))

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17433 array!17433 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20391)

(assert (=> b!292753 (= lt!425010 (arrayBitRangesEqSlicedLemma!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!425012 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> b!292753 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!425012)))

(assert (=> b!292753 (= lt!425012 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7551 arr!273))))))

(declare-fun lt!425013 () Unit!20391)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17433) Unit!20391)

(assert (=> b!292753 (= lt!425013 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(declare-fun b!292754 () Bool)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292754 (= e!208893 (validate_offset_bits!1 ((_ sign_extend 32) (size!7551 (buf!7617 thiss!1728))) ((_ sign_extend 32) (currentByte!14072 thiss!1728)) ((_ sign_extend 32) (currentBit!14067 thiss!1728)) (bvsub to!474 from!505)))))

(declare-fun b!292755 () Bool)

(declare-fun e!208895 () Bool)

(declare-fun array_inv!7163 (array!17433) Bool)

(assert (=> b!292755 (= e!208895 (array_inv!7163 (buf!7617 thiss!1728)))))

(declare-fun b!292756 () Bool)

(declare-fun res!241791 () Bool)

(assert (=> b!292756 (=> (not res!241791) (not e!208894))))

(assert (=> b!292756 (= res!241791 (bvsge from!505 to!474))))

(declare-fun b!292757 () Bool)

(declare-fun res!241793 () Bool)

(assert (=> b!292757 (=> res!241793 e!208893)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!292757 (= res!241793 (not (invariant!0 (currentBit!14067 thiss!1728) (currentByte!14072 thiss!1728) (size!7551 (buf!7617 thiss!1728)))))))

(declare-fun res!241789 () Bool)

(assert (=> start!65228 (=> (not res!241789) (not e!208894))))

(declare-fun nBits!523 () (_ BitVec 64))

(assert (=> start!65228 (= res!241789 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7551 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65228 e!208894))

(declare-fun inv!12 (BitStream!13112) Bool)

(assert (=> start!65228 (and (inv!12 thiss!1728) e!208895)))

(assert (=> start!65228 true))

(assert (=> start!65228 (array_inv!7163 arr!273)))

(declare-fun b!292758 () Bool)

(declare-fun res!241792 () Bool)

(assert (=> b!292758 (=> (not res!241792) (not e!208894))))

(assert (=> b!292758 (= res!241792 (validate_offset_bits!1 ((_ sign_extend 32) (size!7551 (buf!7617 thiss!1728))) ((_ sign_extend 32) (currentByte!14072 thiss!1728)) ((_ sign_extend 32) (currentBit!14067 thiss!1728)) (bvsub nBits!523 from!505)))))

(assert (= (and start!65228 res!241789) b!292758))

(assert (= (and b!292758 res!241792) b!292756))

(assert (= (and b!292756 res!241791) b!292753))

(assert (= (and b!292753 (not res!241790)) b!292757))

(assert (= (and b!292757 (not res!241793)) b!292754))

(assert (= start!65228 b!292755))

(declare-fun m!428367 () Bool)

(assert (=> b!292754 m!428367))

(declare-fun m!428369 () Bool)

(assert (=> b!292758 m!428369))

(declare-fun m!428371 () Bool)

(assert (=> b!292755 m!428371))

(declare-fun m!428373 () Bool)

(assert (=> start!65228 m!428373))

(declare-fun m!428375 () Bool)

(assert (=> start!65228 m!428375))

(declare-fun m!428377 () Bool)

(assert (=> b!292757 m!428377))

(declare-fun m!428379 () Bool)

(assert (=> b!292753 m!428379))

(declare-fun m!428381 () Bool)

(assert (=> b!292753 m!428381))

(declare-fun m!428383 () Bool)

(assert (=> b!292753 m!428383))

(declare-fun m!428385 () Bool)

(assert (=> b!292753 m!428385))

(declare-fun m!428387 () Bool)

(assert (=> b!292753 m!428387))

(push 1)

(assert (not b!292755))

(assert (not b!292757))

(assert (not b!292758))

(assert (not b!292753))

(assert (not b!292754))

(assert (not start!65228))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!98964 () Bool)

(assert (=> d!98964 (= (invariant!0 (currentBit!14067 thiss!1728) (currentByte!14072 thiss!1728) (size!7551 (buf!7617 thiss!1728))) (and (bvsge (currentBit!14067 thiss!1728) #b00000000000000000000000000000000) (bvslt (currentBit!14067 thiss!1728) #b00000000000000000000000000001000) (bvsge (currentByte!14072 thiss!1728) #b00000000000000000000000000000000) (or (bvslt (currentByte!14072 thiss!1728) (size!7551 (buf!7617 thiss!1728))) (and (= (currentBit!14067 thiss!1728) #b00000000000000000000000000000000) (= (currentByte!14072 thiss!1728) (size!7551 (buf!7617 thiss!1728)))))))))

(assert (=> b!292757 d!98964))

(declare-fun d!98966 () Bool)

(assert (=> d!98966 (= (inv!12 thiss!1728) (invariant!0 (currentBit!14067 thiss!1728) (currentByte!14072 thiss!1728) (size!7551 (buf!7617 thiss!1728))))))

(declare-fun bs!25254 () Bool)

(assert (= bs!25254 d!98966))

(assert (=> bs!25254 m!428377))

(assert (=> start!65228 d!98966))

(declare-fun d!98968 () Bool)

(assert (=> d!98968 (= (array_inv!7163 arr!273) (bvsge (size!7551 arr!273) #b00000000000000000000000000000000))))

(assert (=> start!65228 d!98968))

(declare-fun b!292841 () Bool)

(declare-fun e!208971 () Bool)

(declare-fun e!208966 () Bool)

(assert (=> b!292841 (= e!208971 e!208966)))

(declare-fun res!241857 () Bool)

(declare-fun call!4945 () Bool)

(assert (=> b!292841 (= res!241857 call!4945)))

(assert (=> b!292841 (=> (not res!241857) (not e!208966))))

(declare-fun d!98970 () Bool)

(declare-fun res!241859 () Bool)

(declare-fun e!208967 () Bool)

(assert (=> d!98970 (=> res!241859 e!208967)))

(assert (=> d!98970 (= res!241859 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!425012))))

(assert (=> d!98970 (= (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!425012) e!208967)))

(declare-fun b!292842 () Bool)

(declare-fun res!241856 () Bool)

(declare-fun lt!425078 () (_ BitVec 32))

(assert (=> b!292842 (= res!241856 (= lt!425078 #b00000000000000000000000000000000))))

(declare-fun e!208970 () Bool)

(assert (=> b!292842 (=> res!241856 e!208970)))

(assert (=> b!292842 (= e!208966 e!208970)))

(declare-fun b!292843 () Bool)

(declare-fun e!208969 () Bool)

(assert (=> b!292843 (= e!208967 e!208969)))

(declare-fun res!241860 () Bool)

(assert (=> b!292843 (=> (not res!241860) (not e!208969))))

(declare-fun e!208968 () Bool)

(assert (=> b!292843 (= res!241860 e!208968)))

(declare-fun res!241858 () Bool)

(assert (=> b!292843 (=> res!241858 e!208968)))

(declare-datatypes ((tuple4!868 0))(
  ( (tuple4!869 (_1!12777 (_ BitVec 32)) (_2!12777 (_ BitVec 32)) (_3!1304 (_ BitVec 32)) (_4!434 (_ BitVec 32))) )
))
(declare-fun lt!425079 () tuple4!868)

(assert (=> b!292843 (= res!241858 (bvsge (_1!12777 lt!425079) (_2!12777 lt!425079)))))

(assert (=> b!292843 (= lt!425078 ((_ extract 31 0) (bvsrem lt!425012 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!425077 () (_ BitVec 32))

(assert (=> b!292843 (= lt!425077 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!868)

(assert (=> b!292843 (= lt!425079 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!425012))))

(declare-fun b!292844 () Bool)

(assert (=> b!292844 (= e!208971 call!4945)))

(declare-fun b!292845 () Bool)

(assert (=> b!292845 (= e!208969 e!208971)))

(declare-fun c!13379 () Bool)

(assert (=> b!292845 (= c!13379 (= (_3!1304 lt!425079) (_4!434 lt!425079)))))

(declare-fun b!292846 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!292846 (= e!208970 (byteRangesEq!0 (select (arr!8577 arr!273) (_4!434 lt!425079)) (select (arr!8577 arr!273) (_4!434 lt!425079)) #b00000000000000000000000000000000 lt!425078))))

(declare-fun bm!4942 () Bool)

(assert (=> bm!4942 (= call!4945 (byteRangesEq!0 (select (arr!8577 arr!273) (_3!1304 lt!425079)) (select (arr!8577 arr!273) (_3!1304 lt!425079)) lt!425077 (ite c!13379 lt!425078 #b00000000000000000000000000001000)))))

(declare-fun b!292847 () Bool)

(declare-fun arrayRangesEq!1492 (array!17433 array!17433 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!292847 (= e!208968 (arrayRangesEq!1492 arr!273 arr!273 (_1!12777 lt!425079) (_2!12777 lt!425079)))))

(assert (= (and d!98970 (not res!241859)) b!292843))

(assert (= (and b!292843 (not res!241858)) b!292847))

(assert (= (and b!292843 res!241860) b!292845))

(assert (= (and b!292845 c!13379) b!292844))

(assert (= (and b!292845 (not c!13379)) b!292841))

(assert (= (and b!292841 res!241857) b!292842))

(assert (= (and b!292842 (not res!241856)) b!292846))

(assert (= (or b!292844 b!292841) bm!4942))

(declare-fun m!428449 () Bool)

(assert (=> b!292843 m!428449))

(declare-fun m!428451 () Bool)

(assert (=> b!292846 m!428451))

(assert (=> b!292846 m!428451))

(assert (=> b!292846 m!428451))

(assert (=> b!292846 m!428451))

(declare-fun m!428453 () Bool)

(assert (=> b!292846 m!428453))

(declare-fun m!428455 () Bool)

(assert (=> bm!4942 m!428455))

(assert (=> bm!4942 m!428455))

(assert (=> bm!4942 m!428455))

(assert (=> bm!4942 m!428455))

(declare-fun m!428457 () Bool)

(assert (=> bm!4942 m!428457))

(declare-fun m!428459 () Bool)

(assert (=> b!292847 m!428459))

(assert (=> b!292753 d!98970))

(declare-fun d!98994 () Bool)

(assert (=> d!98994 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!425082 () Unit!20391)

(declare-fun choose!4 (array!17433 array!17433 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20391)

(assert (=> d!98994 (= lt!425082 (choose!4 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!425012 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!98994 (bvsle (size!7551 arr!273) (size!7551 arr!273))))

(assert (=> d!98994 (= (arrayBitRangesEqSlicedLemma!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!425012 #b0000000000000000000000000000000000000000000000000000000000000000 from!505) lt!425082)))

(declare-fun bs!25259 () Bool)

(assert (= bs!25259 d!98994))

(assert (=> bs!25259 m!428383))

(declare-fun m!428461 () Bool)

(assert (=> bs!25259 m!428461))

(assert (=> b!292753 d!98994))

(declare-fun d!98996 () Bool)

(declare-fun e!208976 () Bool)

(assert (=> d!98996 e!208976))

(declare-fun res!241867 () Bool)

(assert (=> d!98996 (=> (not res!241867) (not e!208976))))

(declare-fun lt!425100 () (_ BitVec 64))

(assert (=> d!98996 (= res!241867 (or (= lt!425100 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!425100 #b0000000000000000000000000000000000000000000000000000000000001000) lt!425100))))))

(assert (=> d!98996 (= lt!425100 ((_ sign_extend 32) (size!7551 arr!273)))))

(declare-fun lt!425099 () Unit!20391)

(declare-fun choose!59 (array!17433) Unit!20391)

(assert (=> d!98996 (= lt!425099 (choose!59 arr!273))))

(assert (=> d!98996 (= (arrayBitRangesEqReflexiveLemma!0 arr!273) lt!425099)))

(declare-fun b!292854 () Bool)

(assert (=> b!292854 (= e!208976 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul ((_ sign_extend 32) (size!7551 arr!273)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (= (and d!98996 res!241867) b!292854))

(declare-fun m!428463 () Bool)

(assert (=> d!98996 m!428463))

(declare-fun m!428465 () Bool)

(assert (=> b!292854 m!428465))

(assert (=> b!292753 d!98996))

(declare-fun d!98998 () Bool)

(declare-fun e!208980 () Bool)

(assert (=> d!98998 e!208980))

(declare-fun res!241874 () Bool)

(assert (=> d!98998 (=> (not res!241874) (not e!208980))))

(declare-fun lt!425125 () (_ BitVec 64))

(declare-fun lt!425122 () (_ BitVec 64))

(declare-fun lt!425126 () (_ BitVec 64))

(assert (=> d!98998 (= res!241874 (= lt!425125 (bvsub lt!425126 lt!425122)))))

(assert (=> d!98998 (or (= (bvand lt!425126 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!425122 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!425126 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!425126 lt!425122) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!98998 (= lt!425122 (remainingBits!0 ((_ sign_extend 32) (size!7551 (buf!7617 thiss!1728))) ((_ sign_extend 32) (currentByte!14072 thiss!1728)) ((_ sign_extend 32) (currentBit!14067 thiss!1728))))))

(declare-fun lt!425124 () (_ BitVec 64))

(declare-fun lt!425123 () (_ BitVec 64))

(assert (=> d!98998 (= lt!425126 (bvmul lt!425124 lt!425123))))

(assert (=> d!98998 (or (= lt!425124 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!425123 (bvsdiv (bvmul lt!425124 lt!425123) lt!425124)))))

(assert (=> d!98998 (= lt!425123 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!98998 (= lt!425124 ((_ sign_extend 32) (size!7551 (buf!7617 thiss!1728))))))

(assert (=> d!98998 (= lt!425125 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14072 thiss!1728)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14067 thiss!1728))))))

(assert (=> d!98998 (invariant!0 (currentBit!14067 thiss!1728) (currentByte!14072 thiss!1728) (size!7551 (buf!7617 thiss!1728)))))

(assert (=> d!98998 (= (bitIndex!0 (size!7551 (buf!7617 thiss!1728)) (currentByte!14072 thiss!1728) (currentBit!14067 thiss!1728)) lt!425125)))

(declare-fun b!292861 () Bool)

(declare-fun res!241875 () Bool)

(assert (=> b!292861 (=> (not res!241875) (not e!208980))))

(assert (=> b!292861 (= res!241875 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!425125))))

(declare-fun b!292862 () Bool)

(declare-fun lt!425127 () (_ BitVec 64))

(assert (=> b!292862 (= e!208980 (bvsle lt!425125 (bvmul lt!425127 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!292862 (or (= lt!425127 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!425127 #b0000000000000000000000000000000000000000000000000000000000001000) lt!425127)))))

(assert (=> b!292862 (= lt!425127 ((_ sign_extend 32) (size!7551 (buf!7617 thiss!1728))))))

(assert (= (and d!98998 res!241874) b!292861))

(assert (= (and b!292861 res!241875) b!292862))

(declare-fun m!428471 () Bool)

(assert (=> d!98998 m!428471))

(assert (=> d!98998 m!428377))

(assert (=> b!292753 d!98998))

(declare-fun b!292863 () Bool)

(declare-fun e!208986 () Bool)

(declare-fun e!208981 () Bool)

(assert (=> b!292863 (= e!208986 e!208981)))

(declare-fun res!241877 () Bool)

(declare-fun call!4946 () Bool)

(assert (=> b!292863 (= res!241877 call!4946)))

(assert (=> b!292863 (=> (not res!241877) (not e!208981))))

(declare-fun d!99014 () Bool)

(declare-fun res!241879 () Bool)

(declare-fun e!208982 () Bool)

(assert (=> d!99014 (=> res!241879 e!208982)))

(assert (=> d!99014 (= res!241879 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!99014 (= (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505) e!208982)))

(declare-fun b!292864 () Bool)

(declare-fun res!241876 () Bool)

(declare-fun lt!425129 () (_ BitVec 32))

(assert (=> b!292864 (= res!241876 (= lt!425129 #b00000000000000000000000000000000))))

(declare-fun e!208985 () Bool)

(assert (=> b!292864 (=> res!241876 e!208985)))

(assert (=> b!292864 (= e!208981 e!208985)))

(declare-fun b!292865 () Bool)

(declare-fun e!208984 () Bool)

(assert (=> b!292865 (= e!208982 e!208984)))

(declare-fun res!241880 () Bool)

(assert (=> b!292865 (=> (not res!241880) (not e!208984))))

(declare-fun e!208983 () Bool)

(assert (=> b!292865 (= res!241880 e!208983)))

(declare-fun res!241878 () Bool)

(assert (=> b!292865 (=> res!241878 e!208983)))

(declare-fun lt!425130 () tuple4!868)

(assert (=> b!292865 (= res!241878 (bvsge (_1!12777 lt!425130) (_2!12777 lt!425130)))))

(assert (=> b!292865 (= lt!425129 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!425128 () (_ BitVec 32))

(assert (=> b!292865 (= lt!425128 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!292865 (= lt!425130 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(declare-fun b!292866 () Bool)

(assert (=> b!292866 (= e!208986 call!4946)))

(declare-fun b!292867 () Bool)

(assert (=> b!292867 (= e!208984 e!208986)))

(declare-fun c!13380 () Bool)

(assert (=> b!292867 (= c!13380 (= (_3!1304 lt!425130) (_4!434 lt!425130)))))

(declare-fun b!292868 () Bool)

(assert (=> b!292868 (= e!208985 (byteRangesEq!0 (select (arr!8577 arr!273) (_4!434 lt!425130)) (select (arr!8577 arr!273) (_4!434 lt!425130)) #b00000000000000000000000000000000 lt!425129))))

(declare-fun bm!4943 () Bool)

(assert (=> bm!4943 (= call!4946 (byteRangesEq!0 (select (arr!8577 arr!273) (_3!1304 lt!425130)) (select (arr!8577 arr!273) (_3!1304 lt!425130)) lt!425128 (ite c!13380 lt!425129 #b00000000000000000000000000001000)))))

(declare-fun b!292869 () Bool)

(assert (=> b!292869 (= e!208983 (arrayRangesEq!1492 arr!273 arr!273 (_1!12777 lt!425130) (_2!12777 lt!425130)))))

(assert (= (and d!99014 (not res!241879)) b!292865))

(assert (= (and b!292865 (not res!241878)) b!292869))

(assert (= (and b!292865 res!241880) b!292867))

(assert (= (and b!292867 c!13380) b!292866))

(assert (= (and b!292867 (not c!13380)) b!292863))

(assert (= (and b!292863 res!241877) b!292864))

(assert (= (and b!292864 (not res!241876)) b!292868))

(assert (= (or b!292866 b!292863) bm!4943))

(declare-fun m!428473 () Bool)

(assert (=> b!292865 m!428473))

(declare-fun m!428475 () Bool)

(assert (=> b!292868 m!428475))

(assert (=> b!292868 m!428475))

(assert (=> b!292868 m!428475))

(assert (=> b!292868 m!428475))

(declare-fun m!428477 () Bool)

(assert (=> b!292868 m!428477))

(declare-fun m!428479 () Bool)

(assert (=> bm!4943 m!428479))

(assert (=> bm!4943 m!428479))

(assert (=> bm!4943 m!428479))

(assert (=> bm!4943 m!428479))

(declare-fun m!428481 () Bool)

(assert (=> bm!4943 m!428481))

(declare-fun m!428483 () Bool)

(assert (=> b!292869 m!428483))

(assert (=> b!292753 d!99014))

(declare-fun d!99016 () Bool)

(assert (=> d!99016 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7551 (buf!7617 thiss!1728))) ((_ sign_extend 32) (currentByte!14072 thiss!1728)) ((_ sign_extend 32) (currentBit!14067 thiss!1728)) (bvsub nBits!523 from!505)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7551 (buf!7617 thiss!1728))) ((_ sign_extend 32) (currentByte!14072 thiss!1728)) ((_ sign_extend 32) (currentBit!14067 thiss!1728))) (bvsub nBits!523 from!505)))))

(declare-fun bs!25264 () Bool)

(assert (= bs!25264 d!99016))

(assert (=> bs!25264 m!428471))

(assert (=> b!292758 d!99016))

(declare-fun d!99018 () Bool)

(assert (=> d!99018 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7551 (buf!7617 thiss!1728))) ((_ sign_extend 32) (currentByte!14072 thiss!1728)) ((_ sign_extend 32) (currentBit!14067 thiss!1728)) (bvsub to!474 from!505)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7551 (buf!7617 thiss!1728))) ((_ sign_extend 32) (currentByte!14072 thiss!1728)) ((_ sign_extend 32) (currentBit!14067 thiss!1728))) (bvsub to!474 from!505)))))

(declare-fun bs!25265 () Bool)

(assert (= bs!25265 d!99018))

(assert (=> bs!25265 m!428471))

(assert (=> b!292754 d!99018))

(declare-fun d!99020 () Bool)

(assert (=> d!99020 (= (array_inv!7163 (buf!7617 thiss!1728)) (bvsge (size!7551 (buf!7617 thiss!1728)) #b00000000000000000000000000000000))))

(assert (=> b!292755 d!99020))

(push 1)

(assert (not b!292865))

(assert (not b!292868))

(assert (not d!98994))

(assert (not b!292854))

(assert (not d!98966))

(assert (not b!292846))

(assert (not d!98996))

(assert (not b!292847))

(assert (not d!99016))

(assert (not bm!4943))

(assert (not b!292843))

(assert (not b!292869))

(assert (not bm!4942))

(assert (not d!98998))

(assert (not d!99018))

(check-sat)

(pop 1)

(push 1)

(check-sat)

