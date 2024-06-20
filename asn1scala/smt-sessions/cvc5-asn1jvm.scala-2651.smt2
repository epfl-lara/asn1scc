; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65224 () Bool)

(assert start!65224)

(declare-fun res!241760 () Bool)

(declare-fun e!208863 () Bool)

(assert (=> start!65224 (=> (not res!241760) (not e!208863))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-datatypes ((array!17429 0))(
  ( (array!17430 (arr!8575 (Array (_ BitVec 32) (_ BitVec 8))) (size!7549 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17429)

(assert (=> start!65224 (= res!241760 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7549 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65224 e!208863))

(declare-datatypes ((BitStream!13108 0))(
  ( (BitStream!13109 (buf!7615 array!17429) (currentByte!14070 (_ BitVec 32)) (currentBit!14065 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13108)

(declare-fun e!208866 () Bool)

(declare-fun inv!12 (BitStream!13108) Bool)

(assert (=> start!65224 (and (inv!12 thiss!1728) e!208866)))

(assert (=> start!65224 true))

(declare-fun array_inv!7161 (array!17429) Bool)

(assert (=> start!65224 (array_inv!7161 arr!273)))

(declare-fun b!292717 () Bool)

(declare-fun res!241763 () Bool)

(assert (=> b!292717 (=> (not res!241763) (not e!208863))))

(assert (=> b!292717 (= res!241763 (bvsge from!505 to!474))))

(declare-fun b!292718 () Bool)

(assert (=> b!292718 (= e!208866 (array_inv!7161 (buf!7615 thiss!1728)))))

(declare-fun b!292719 () Bool)

(declare-fun res!241762 () Bool)

(declare-fun e!208864 () Bool)

(assert (=> b!292719 (=> res!241762 e!208864)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!292719 (= res!241762 (not (invariant!0 (currentBit!14065 thiss!1728) (currentByte!14070 thiss!1728) (size!7549 (buf!7615 thiss!1728)))))))

(declare-fun b!292720 () Bool)

(declare-fun res!241759 () Bool)

(assert (=> b!292720 (=> (not res!241759) (not e!208863))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292720 (= res!241759 (validate_offset_bits!1 ((_ sign_extend 32) (size!7549 (buf!7615 thiss!1728))) ((_ sign_extend 32) (currentByte!14070 thiss!1728)) ((_ sign_extend 32) (currentBit!14065 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!292721 () Bool)

(assert (=> b!292721 (= e!208863 (not e!208864))))

(declare-fun res!241761 () Bool)

(assert (=> b!292721 (=> res!241761 e!208864)))

(declare-fun lt!424987 () (_ BitVec 64))

(assert (=> b!292721 (= res!241761 (not (= (bvsub (bvadd lt!424987 to!474) from!505) lt!424987)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!292721 (= lt!424987 (bitIndex!0 (size!7549 (buf!7615 thiss!1728)) (currentByte!14070 thiss!1728) (currentBit!14065 thiss!1728)))))

(declare-fun arrayBitRangesEq!0 (array!17429 array!17429 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292721 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!424989 () (_ BitVec 64))

(declare-datatypes ((Unit!20387 0))(
  ( (Unit!20388) )
))
(declare-fun lt!424986 () Unit!20387)

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17429 array!17429 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20387)

(assert (=> b!292721 (= lt!424986 (arrayBitRangesEqSlicedLemma!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424989 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> b!292721 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424989)))

(assert (=> b!292721 (= lt!424989 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7549 arr!273))))))

(declare-fun lt!424988 () Unit!20387)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17429) Unit!20387)

(assert (=> b!292721 (= lt!424988 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(declare-fun b!292722 () Bool)

(assert (=> b!292722 (= e!208864 (validate_offset_bits!1 ((_ sign_extend 32) (size!7549 (buf!7615 thiss!1728))) ((_ sign_extend 32) (currentByte!14070 thiss!1728)) ((_ sign_extend 32) (currentBit!14065 thiss!1728)) (bvsub to!474 from!505)))))

(assert (= (and start!65224 res!241760) b!292720))

(assert (= (and b!292720 res!241759) b!292717))

(assert (= (and b!292717 res!241763) b!292721))

(assert (= (and b!292721 (not res!241761)) b!292719))

(assert (= (and b!292719 (not res!241762)) b!292722))

(assert (= start!65224 b!292718))

(declare-fun m!428323 () Bool)

(assert (=> b!292722 m!428323))

(declare-fun m!428325 () Bool)

(assert (=> b!292720 m!428325))

(declare-fun m!428327 () Bool)

(assert (=> start!65224 m!428327))

(declare-fun m!428329 () Bool)

(assert (=> start!65224 m!428329))

(declare-fun m!428331 () Bool)

(assert (=> b!292719 m!428331))

(declare-fun m!428333 () Bool)

(assert (=> b!292721 m!428333))

(declare-fun m!428335 () Bool)

(assert (=> b!292721 m!428335))

(declare-fun m!428337 () Bool)

(assert (=> b!292721 m!428337))

(declare-fun m!428339 () Bool)

(assert (=> b!292721 m!428339))

(declare-fun m!428341 () Bool)

(assert (=> b!292721 m!428341))

(declare-fun m!428343 () Bool)

(assert (=> b!292718 m!428343))

(push 1)

(assert (not b!292719))

(assert (not b!292720))

(assert (not b!292721))

(assert (not start!65224))

(assert (not b!292718))

(assert (not b!292722))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!98962 () Bool)

(declare-fun res!241837 () Bool)

(declare-fun e!208939 () Bool)

(assert (=> d!98962 (=> res!241837 e!208939)))

(assert (=> d!98962 (= res!241837 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!424989))))

(assert (=> d!98962 (= (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424989) e!208939)))

(declare-fun b!292810 () Bool)

(declare-fun e!208941 () Bool)

(declare-fun e!208940 () Bool)

(assert (=> b!292810 (= e!208941 e!208940)))

(declare-fun c!13375 () Bool)

(declare-datatypes ((tuple4!866 0))(
  ( (tuple4!867 (_1!12776 (_ BitVec 32)) (_2!12776 (_ BitVec 32)) (_3!1303 (_ BitVec 32)) (_4!433 (_ BitVec 32))) )
))
(declare-fun lt!425061 () tuple4!866)

(assert (=> b!292810 (= c!13375 (= (_3!1303 lt!425061) (_4!433 lt!425061)))))

(declare-fun call!4941 () Bool)

(declare-fun lt!425060 () (_ BitVec 32))

(declare-fun lt!425059 () (_ BitVec 32))

(declare-fun bm!4938 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!4938 (= call!4941 (byteRangesEq!0 (ite c!13375 (select (arr!8575 arr!273) (_3!1303 lt!425061)) (select (arr!8575 arr!273) (_4!433 lt!425061))) (ite c!13375 (select (arr!8575 arr!273) (_3!1303 lt!425061)) (select (arr!8575 arr!273) (_4!433 lt!425061))) (ite c!13375 lt!425059 #b00000000000000000000000000000000) lt!425060))))

(declare-fun b!292811 () Bool)

(declare-fun e!208942 () Bool)

(declare-fun arrayRangesEq!1491 (array!17429 array!17429 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!292811 (= e!208942 (arrayRangesEq!1491 arr!273 arr!273 (_1!12776 lt!425061) (_2!12776 lt!425061)))))

(declare-fun b!292812 () Bool)

(assert (=> b!292812 (= e!208939 e!208941)))

(declare-fun res!241836 () Bool)

(assert (=> b!292812 (=> (not res!241836) (not e!208941))))

(assert (=> b!292812 (= res!241836 e!208942)))

(declare-fun res!241833 () Bool)

(assert (=> b!292812 (=> res!241833 e!208942)))

(assert (=> b!292812 (= res!241833 (bvsge (_1!12776 lt!425061) (_2!12776 lt!425061)))))

(assert (=> b!292812 (= lt!425060 ((_ extract 31 0) (bvsrem lt!424989 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!292812 (= lt!425059 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!866)

(assert (=> b!292812 (= lt!425061 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424989))))

(declare-fun b!292813 () Bool)

(declare-fun e!208943 () Bool)

(assert (=> b!292813 (= e!208940 e!208943)))

(declare-fun res!241834 () Bool)

(assert (=> b!292813 (= res!241834 (byteRangesEq!0 (select (arr!8575 arr!273) (_3!1303 lt!425061)) (select (arr!8575 arr!273) (_3!1303 lt!425061)) lt!425059 #b00000000000000000000000000001000))))

(assert (=> b!292813 (=> (not res!241834) (not e!208943))))

(declare-fun b!292814 () Bool)

(declare-fun e!208944 () Bool)

(assert (=> b!292814 (= e!208944 call!4941)))

(declare-fun b!292815 () Bool)

(declare-fun res!241835 () Bool)

(assert (=> b!292815 (= res!241835 (= lt!425060 #b00000000000000000000000000000000))))

(assert (=> b!292815 (=> res!241835 e!208944)))

(assert (=> b!292815 (= e!208943 e!208944)))

(declare-fun b!292816 () Bool)

(assert (=> b!292816 (= e!208940 call!4941)))

(assert (= (and d!98962 (not res!241837)) b!292812))

(assert (= (and b!292812 (not res!241833)) b!292811))

(assert (= (and b!292812 res!241836) b!292810))

(assert (= (and b!292810 c!13375) b!292816))

(assert (= (and b!292810 (not c!13375)) b!292813))

(assert (= (and b!292813 res!241834) b!292815))

(assert (= (and b!292815 (not res!241835)) b!292814))

(assert (= (or b!292816 b!292814) bm!4938))

(declare-fun m!428421 () Bool)

(assert (=> bm!4938 m!428421))

(declare-fun m!428423 () Bool)

(assert (=> bm!4938 m!428423))

(assert (=> bm!4938 m!428423))

(declare-fun m!428425 () Bool)

(assert (=> bm!4938 m!428425))

(assert (=> bm!4938 m!428421))

(declare-fun m!428427 () Bool)

(assert (=> b!292811 m!428427))

(declare-fun m!428429 () Bool)

(assert (=> b!292812 m!428429))

(assert (=> b!292813 m!428423))

(assert (=> b!292813 m!428423))

(assert (=> b!292813 m!428423))

(assert (=> b!292813 m!428423))

(declare-fun m!428431 () Bool)

(assert (=> b!292813 m!428431))

(assert (=> b!292721 d!98962))

(declare-fun d!98984 () Bool)

(declare-fun e!208959 () Bool)

(assert (=> d!98984 e!208959))

(declare-fun res!241850 () Bool)

(assert (=> d!98984 (=> (not res!241850) (not e!208959))))

(declare-fun lt!425073 () (_ BitVec 64))

(assert (=> d!98984 (= res!241850 (or (= lt!425073 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!425073 #b0000000000000000000000000000000000000000000000000000000000001000) lt!425073))))))

(assert (=> d!98984 (= lt!425073 ((_ sign_extend 32) (size!7549 arr!273)))))

(declare-fun lt!425072 () Unit!20387)

(declare-fun choose!59 (array!17429) Unit!20387)

(assert (=> d!98984 (= lt!425072 (choose!59 arr!273))))

(assert (=> d!98984 (= (arrayBitRangesEqReflexiveLemma!0 arr!273) lt!425072)))

(declare-fun b!292833 () Bool)

(assert (=> b!292833 (= e!208959 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul ((_ sign_extend 32) (size!7549 arr!273)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (= (and d!98984 res!241850) b!292833))

(declare-fun m!428433 () Bool)

(assert (=> d!98984 m!428433))

(declare-fun m!428435 () Bool)

(assert (=> b!292833 m!428435))

(assert (=> b!292721 d!98984))

(declare-fun d!98990 () Bool)

(declare-fun res!241855 () Bool)

(declare-fun e!208960 () Bool)

(assert (=> d!98990 (=> res!241855 e!208960)))

(assert (=> d!98990 (= res!241855 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!98990 (= (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505) e!208960)))

(declare-fun b!292834 () Bool)

(declare-fun e!208962 () Bool)

(declare-fun e!208961 () Bool)

(assert (=> b!292834 (= e!208962 e!208961)))

(declare-fun c!13378 () Bool)

(declare-fun lt!425076 () tuple4!866)

(assert (=> b!292834 (= c!13378 (= (_3!1303 lt!425076) (_4!433 lt!425076)))))

(declare-fun call!4944 () Bool)

(declare-fun lt!425075 () (_ BitVec 32))

(declare-fun lt!425074 () (_ BitVec 32))

(declare-fun bm!4941 () Bool)

(assert (=> bm!4941 (= call!4944 (byteRangesEq!0 (ite c!13378 (select (arr!8575 arr!273) (_3!1303 lt!425076)) (select (arr!8575 arr!273) (_4!433 lt!425076))) (ite c!13378 (select (arr!8575 arr!273) (_3!1303 lt!425076)) (select (arr!8575 arr!273) (_4!433 lt!425076))) (ite c!13378 lt!425074 #b00000000000000000000000000000000) lt!425075))))

(declare-fun b!292835 () Bool)

(declare-fun e!208963 () Bool)

(assert (=> b!292835 (= e!208963 (arrayRangesEq!1491 arr!273 arr!273 (_1!12776 lt!425076) (_2!12776 lt!425076)))))

(declare-fun b!292836 () Bool)

(assert (=> b!292836 (= e!208960 e!208962)))

(declare-fun res!241854 () Bool)

(assert (=> b!292836 (=> (not res!241854) (not e!208962))))

(assert (=> b!292836 (= res!241854 e!208963)))

(declare-fun res!241851 () Bool)

(assert (=> b!292836 (=> res!241851 e!208963)))

(assert (=> b!292836 (= res!241851 (bvsge (_1!12776 lt!425076) (_2!12776 lt!425076)))))

(assert (=> b!292836 (= lt!425075 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!292836 (= lt!425074 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!292836 (= lt!425076 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(declare-fun b!292837 () Bool)

(declare-fun e!208964 () Bool)

(assert (=> b!292837 (= e!208961 e!208964)))

(declare-fun res!241852 () Bool)

(assert (=> b!292837 (= res!241852 (byteRangesEq!0 (select (arr!8575 arr!273) (_3!1303 lt!425076)) (select (arr!8575 arr!273) (_3!1303 lt!425076)) lt!425074 #b00000000000000000000000000001000))))

(assert (=> b!292837 (=> (not res!241852) (not e!208964))))

(declare-fun b!292838 () Bool)

(declare-fun e!208965 () Bool)

(assert (=> b!292838 (= e!208965 call!4944)))

(declare-fun b!292839 () Bool)

(declare-fun res!241853 () Bool)

(assert (=> b!292839 (= res!241853 (= lt!425075 #b00000000000000000000000000000000))))

(assert (=> b!292839 (=> res!241853 e!208965)))

(assert (=> b!292839 (= e!208964 e!208965)))

(declare-fun b!292840 () Bool)

(assert (=> b!292840 (= e!208961 call!4944)))

(assert (= (and d!98990 (not res!241855)) b!292836))

(assert (= (and b!292836 (not res!241851)) b!292835))

(assert (= (and b!292836 res!241854) b!292834))

(assert (= (and b!292834 c!13378) b!292840))

(assert (= (and b!292834 (not c!13378)) b!292837))

(assert (= (and b!292837 res!241852) b!292839))

(assert (= (and b!292839 (not res!241853)) b!292838))

(assert (= (or b!292840 b!292838) bm!4941))

(declare-fun m!428437 () Bool)

(assert (=> bm!4941 m!428437))

(declare-fun m!428439 () Bool)

(assert (=> bm!4941 m!428439))

(assert (=> bm!4941 m!428439))

(declare-fun m!428441 () Bool)

(assert (=> bm!4941 m!428441))

(assert (=> bm!4941 m!428437))

(declare-fun m!428443 () Bool)

(assert (=> b!292835 m!428443))

(declare-fun m!428445 () Bool)

(assert (=> b!292836 m!428445))

(assert (=> b!292837 m!428439))

(assert (=> b!292837 m!428439))

(assert (=> b!292837 m!428439))

(assert (=> b!292837 m!428439))

(declare-fun m!428447 () Bool)

(assert (=> b!292837 m!428447))

(assert (=> b!292721 d!98990))

(declare-fun d!98992 () Bool)

(declare-fun e!208977 () Bool)

(assert (=> d!98992 e!208977))

(declare-fun res!241868 () Bool)

(assert (=> d!98992 (=> (not res!241868) (not e!208977))))

(declare-fun lt!425106 () (_ BitVec 64))

(declare-fun lt!425102 () (_ BitVec 64))

(declare-fun lt!425105 () (_ BitVec 64))

(assert (=> d!98992 (= res!241868 (= lt!425106 (bvsub lt!425102 lt!425105)))))

(assert (=> d!98992 (or (= (bvand lt!425102 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!425105 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!425102 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!425102 lt!425105) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!98992 (= lt!425105 (remainingBits!0 ((_ sign_extend 32) (size!7549 (buf!7615 thiss!1728))) ((_ sign_extend 32) (currentByte!14070 thiss!1728)) ((_ sign_extend 32) (currentBit!14065 thiss!1728))))))

(declare-fun lt!425104 () (_ BitVec 64))

(declare-fun lt!425103 () (_ BitVec 64))

(assert (=> d!98992 (= lt!425102 (bvmul lt!425104 lt!425103))))

(assert (=> d!98992 (or (= lt!425104 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!425103 (bvsdiv (bvmul lt!425104 lt!425103) lt!425104)))))

(assert (=> d!98992 (= lt!425103 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!98992 (= lt!425104 ((_ sign_extend 32) (size!7549 (buf!7615 thiss!1728))))))

(assert (=> d!98992 (= lt!425106 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14070 thiss!1728)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14065 thiss!1728))))))

(assert (=> d!98992 (invariant!0 (currentBit!14065 thiss!1728) (currentByte!14070 thiss!1728) (size!7549 (buf!7615 thiss!1728)))))

(assert (=> d!98992 (= (bitIndex!0 (size!7549 (buf!7615 thiss!1728)) (currentByte!14070 thiss!1728) (currentBit!14065 thiss!1728)) lt!425106)))

(declare-fun b!292855 () Bool)

(declare-fun res!241869 () Bool)

(assert (=> b!292855 (=> (not res!241869) (not e!208977))))

(assert (=> b!292855 (= res!241869 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!425106))))

(declare-fun b!292856 () Bool)

(declare-fun lt!425101 () (_ BitVec 64))

(assert (=> b!292856 (= e!208977 (bvsle lt!425106 (bvmul lt!425101 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!292856 (or (= lt!425101 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!425101 #b0000000000000000000000000000000000000000000000000000000000001000) lt!425101)))))

(assert (=> b!292856 (= lt!425101 ((_ sign_extend 32) (size!7549 (buf!7615 thiss!1728))))))

(assert (= (and d!98992 res!241868) b!292855))

(assert (= (and b!292855 res!241869) b!292856))

(declare-fun m!428467 () Bool)

(assert (=> d!98992 m!428467))

(assert (=> d!98992 m!428331))

(assert (=> b!292721 d!98992))

(declare-fun d!99000 () Bool)

(assert (=> d!99000 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!425109 () Unit!20387)

(declare-fun choose!4 (array!17429 array!17429 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20387)

(assert (=> d!99000 (= lt!425109 (choose!4 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424989 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!99000 (bvsle (size!7549 arr!273) (size!7549 arr!273))))

(assert (=> d!99000 (= (arrayBitRangesEqSlicedLemma!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424989 #b0000000000000000000000000000000000000000000000000000000000000000 from!505) lt!425109)))

(declare-fun bs!25260 () Bool)

(assert (= bs!25260 d!99000))

(assert (=> bs!25260 m!428341))

(declare-fun m!428469 () Bool)

(assert (=> bs!25260 m!428469))

(assert (=> b!292721 d!99000))

(declare-fun d!99002 () Bool)

(assert (=> d!99002 (= (inv!12 thiss!1728) (invariant!0 (currentBit!14065 thiss!1728) (currentByte!14070 thiss!1728) (size!7549 (buf!7615 thiss!1728))))))

(declare-fun bs!25261 () Bool)

(assert (= bs!25261 d!99002))

(assert (=> bs!25261 m!428331))

(assert (=> start!65224 d!99002))

(declare-fun d!99004 () Bool)

(assert (=> d!99004 (= (array_inv!7161 arr!273) (bvsge (size!7549 arr!273) #b00000000000000000000000000000000))))

(assert (=> start!65224 d!99004))

(declare-fun d!99006 () Bool)

(assert (=> d!99006 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7549 (buf!7615 thiss!1728))) ((_ sign_extend 32) (currentByte!14070 thiss!1728)) ((_ sign_extend 32) (currentBit!14065 thiss!1728)) (bvsub to!474 from!505)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7549 (buf!7615 thiss!1728))) ((_ sign_extend 32) (currentByte!14070 thiss!1728)) ((_ sign_extend 32) (currentBit!14065 thiss!1728))) (bvsub to!474 from!505)))))

(declare-fun bs!25262 () Bool)

(assert (= bs!25262 d!99006))

(assert (=> bs!25262 m!428467))

(assert (=> b!292722 d!99006))

(declare-fun d!99008 () Bool)

(assert (=> d!99008 (= (array_inv!7161 (buf!7615 thiss!1728)) (bvsge (size!7549 (buf!7615 thiss!1728)) #b00000000000000000000000000000000))))

(assert (=> b!292718 d!99008))

(declare-fun d!99010 () Bool)

(assert (=> d!99010 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7549 (buf!7615 thiss!1728))) ((_ sign_extend 32) (currentByte!14070 thiss!1728)) ((_ sign_extend 32) (currentBit!14065 thiss!1728)) (bvsub nBits!523 from!505)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7549 (buf!7615 thiss!1728))) ((_ sign_extend 32) (currentByte!14070 thiss!1728)) ((_ sign_extend 32) (currentBit!14065 thiss!1728))) (bvsub nBits!523 from!505)))))

(declare-fun bs!25263 () Bool)

(assert (= bs!25263 d!99010))

(assert (=> bs!25263 m!428467))

(assert (=> b!292720 d!99010))

(declare-fun d!99012 () Bool)

(assert (=> d!99012 (= (invariant!0 (currentBit!14065 thiss!1728) (currentByte!14070 thiss!1728) (size!7549 (buf!7615 thiss!1728))) (and (bvsge (currentBit!14065 thiss!1728) #b00000000000000000000000000000000) (bvslt (currentBit!14065 thiss!1728) #b00000000000000000000000000001000) (bvsge (currentByte!14070 thiss!1728) #b00000000000000000000000000000000) (or (bvslt (currentByte!14070 thiss!1728) (size!7549 (buf!7615 thiss!1728))) (and (= (currentBit!14065 thiss!1728) #b00000000000000000000000000000000) (= (currentByte!14070 thiss!1728) (size!7549 (buf!7615 thiss!1728)))))))))

(assert (=> b!292719 d!99012))

(push 1)

(assert (not d!99006))

(assert (not bm!4938))

(assert (not d!99000))

(assert (not d!99002))

(assert (not d!99010))

(assert (not d!98984))

(assert (not b!292833))

(assert (not b!292836))

(assert (not b!292837))

(assert (not b!292811))

(assert (not d!98992))

(assert (not bm!4941))

(assert (not b!292813))

(assert (not b!292812))

(assert (not b!292835))

(check-sat)

(pop 1)

(push 1)

(check-sat)

