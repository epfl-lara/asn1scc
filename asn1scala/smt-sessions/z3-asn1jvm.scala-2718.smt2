; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66510 () Bool)

(assert start!66510)

(declare-fun b!298049 () Bool)

(declare-fun e!213477 () Bool)

(declare-datatypes ((array!17869 0))(
  ( (array!17870 (arr!8825 (Array (_ BitVec 32) (_ BitVec 8))) (size!7745 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13494 0))(
  ( (BitStream!13495 (buf!7808 array!17869) (currentByte!14362 (_ BitVec 32)) (currentBit!14357 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13494)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!298049 (= e!213477 (not (invariant!0 (currentBit!14357 thiss!1728) (currentByte!14362 thiss!1728) (size!7745 (buf!7808 thiss!1728)))))))

(declare-fun arr!273 () array!17869)

(declare-fun from!505 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!17869 array!17869 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!298049 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!434236 () (_ BitVec 64))

(declare-datatypes ((Unit!20811 0))(
  ( (Unit!20812) )
))
(declare-fun lt!434238 () Unit!20811)

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17869 array!17869 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20811)

(assert (=> b!298049 (= lt!434238 (arrayBitRangesEqSlicedLemma!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!434236 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> b!298049 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!434236)))

(assert (=> b!298049 (= lt!434236 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7745 arr!273))))))

(declare-fun lt!434237 () Unit!20811)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17869) Unit!20811)

(assert (=> b!298049 (= lt!434237 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(declare-fun b!298047 () Bool)

(declare-fun res!245965 () Bool)

(assert (=> b!298047 (=> (not res!245965) (not e!213477))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!298047 (= res!245965 (validate_offset_bits!1 ((_ sign_extend 32) (size!7745 (buf!7808 thiss!1728))) ((_ sign_extend 32) (currentByte!14362 thiss!1728)) ((_ sign_extend 32) (currentBit!14357 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!298050 () Bool)

(declare-fun e!213479 () Bool)

(declare-fun array_inv!7357 (array!17869) Bool)

(assert (=> b!298050 (= e!213479 (array_inv!7357 (buf!7808 thiss!1728)))))

(declare-fun res!245966 () Bool)

(assert (=> start!66510 (=> (not res!245966) (not e!213477))))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> start!66510 (= res!245966 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7745 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!66510 e!213477))

(declare-fun inv!12 (BitStream!13494) Bool)

(assert (=> start!66510 (and (inv!12 thiss!1728) e!213479)))

(assert (=> start!66510 true))

(assert (=> start!66510 (array_inv!7357 arr!273)))

(declare-fun b!298048 () Bool)

(declare-fun res!245964 () Bool)

(assert (=> b!298048 (=> (not res!245964) (not e!213477))))

(assert (=> b!298048 (= res!245964 (bvsge from!505 to!474))))

(assert (= (and start!66510 res!245966) b!298047))

(assert (= (and b!298047 res!245965) b!298048))

(assert (= (and b!298048 res!245964) b!298049))

(assert (= start!66510 b!298050))

(declare-fun m!436957 () Bool)

(assert (=> b!298049 m!436957))

(declare-fun m!436959 () Bool)

(assert (=> b!298049 m!436959))

(declare-fun m!436961 () Bool)

(assert (=> b!298049 m!436961))

(declare-fun m!436963 () Bool)

(assert (=> b!298049 m!436963))

(declare-fun m!436965 () Bool)

(assert (=> b!298049 m!436965))

(declare-fun m!436967 () Bool)

(assert (=> b!298047 m!436967))

(declare-fun m!436969 () Bool)

(assert (=> b!298050 m!436969))

(declare-fun m!436971 () Bool)

(assert (=> start!66510 m!436971))

(declare-fun m!436973 () Bool)

(assert (=> start!66510 m!436973))

(check-sat (not b!298047) (not b!298049) (not start!66510) (not b!298050))
(check-sat)
(get-model)

(declare-fun d!100304 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!100304 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7745 (buf!7808 thiss!1728))) ((_ sign_extend 32) (currentByte!14362 thiss!1728)) ((_ sign_extend 32) (currentBit!14357 thiss!1728)) (bvsub nBits!523 from!505)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7745 (buf!7808 thiss!1728))) ((_ sign_extend 32) (currentByte!14362 thiss!1728)) ((_ sign_extend 32) (currentBit!14357 thiss!1728))) (bvsub nBits!523 from!505)))))

(declare-fun bs!25677 () Bool)

(assert (= bs!25677 d!100304))

(declare-fun m!436993 () Bool)

(assert (=> bs!25677 m!436993))

(assert (=> b!298047 d!100304))

(declare-fun d!100306 () Bool)

(assert (=> d!100306 (= (invariant!0 (currentBit!14357 thiss!1728) (currentByte!14362 thiss!1728) (size!7745 (buf!7808 thiss!1728))) (and (bvsge (currentBit!14357 thiss!1728) #b00000000000000000000000000000000) (bvslt (currentBit!14357 thiss!1728) #b00000000000000000000000000001000) (bvsge (currentByte!14362 thiss!1728) #b00000000000000000000000000000000) (or (bvslt (currentByte!14362 thiss!1728) (size!7745 (buf!7808 thiss!1728))) (and (= (currentBit!14357 thiss!1728) #b00000000000000000000000000000000) (= (currentByte!14362 thiss!1728) (size!7745 (buf!7808 thiss!1728)))))))))

(assert (=> b!298049 d!100306))

(declare-fun d!100308 () Bool)

(declare-fun e!213495 () Bool)

(assert (=> d!100308 e!213495))

(declare-fun res!245978 () Bool)

(assert (=> d!100308 (=> (not res!245978) (not e!213495))))

(declare-fun lt!434253 () (_ BitVec 64))

(assert (=> d!100308 (= res!245978 (or (= lt!434253 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!434253 #b0000000000000000000000000000000000000000000000000000000000001000) lt!434253))))))

(assert (=> d!100308 (= lt!434253 ((_ sign_extend 32) (size!7745 arr!273)))))

(declare-fun lt!434252 () Unit!20811)

(declare-fun choose!59 (array!17869) Unit!20811)

(assert (=> d!100308 (= lt!434252 (choose!59 arr!273))))

(assert (=> d!100308 (= (arrayBitRangesEqReflexiveLemma!0 arr!273) lt!434252)))

(declare-fun b!298065 () Bool)

(assert (=> b!298065 (= e!213495 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul ((_ sign_extend 32) (size!7745 arr!273)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (= (and d!100308 res!245978) b!298065))

(declare-fun m!436997 () Bool)

(assert (=> d!100308 m!436997))

(declare-fun m!436999 () Bool)

(assert (=> b!298065 m!436999))

(assert (=> b!298049 d!100308))

(declare-fun b!298101 () Bool)

(declare-fun e!213527 () Bool)

(declare-fun e!213524 () Bool)

(assert (=> b!298101 (= e!213527 e!213524)))

(declare-fun res!246003 () Bool)

(declare-datatypes ((tuple4!930 0))(
  ( (tuple4!931 (_1!13114 (_ BitVec 32)) (_2!13114 (_ BitVec 32)) (_3!1422 (_ BitVec 32)) (_4!465 (_ BitVec 32))) )
))
(declare-fun lt!434274 () tuple4!930)

(declare-fun lt!434273 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!298101 (= res!246003 (byteRangesEq!0 (select (arr!8825 arr!273) (_3!1422 lt!434274)) (select (arr!8825 arr!273) (_3!1422 lt!434274)) lt!434273 #b00000000000000000000000000001000))))

(assert (=> b!298101 (=> (not res!246003) (not e!213524))))

(declare-fun d!100320 () Bool)

(declare-fun res!246006 () Bool)

(declare-fun e!213531 () Bool)

(assert (=> d!100320 (=> res!246006 e!213531)))

(assert (=> d!100320 (= res!246006 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!100320 (= (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505) e!213531)))

(declare-fun b!298102 () Bool)

(declare-fun call!5273 () Bool)

(assert (=> b!298102 (= e!213527 call!5273)))

(declare-fun b!298103 () Bool)

(declare-fun e!213528 () Bool)

(assert (=> b!298103 (= e!213528 call!5273)))

(declare-fun b!298104 () Bool)

(declare-fun res!246008 () Bool)

(declare-fun lt!434271 () (_ BitVec 32))

(assert (=> b!298104 (= res!246008 (= lt!434271 #b00000000000000000000000000000000))))

(assert (=> b!298104 (=> res!246008 e!213528)))

(assert (=> b!298104 (= e!213524 e!213528)))

(declare-fun c!13635 () Bool)

(declare-fun bm!5270 () Bool)

(assert (=> bm!5270 (= call!5273 (byteRangesEq!0 (ite c!13635 (select (arr!8825 arr!273) (_3!1422 lt!434274)) (select (arr!8825 arr!273) (_4!465 lt!434274))) (ite c!13635 (select (arr!8825 arr!273) (_3!1422 lt!434274)) (select (arr!8825 arr!273) (_4!465 lt!434274))) (ite c!13635 lt!434273 #b00000000000000000000000000000000) lt!434271))))

(declare-fun b!298105 () Bool)

(declare-fun e!213529 () Bool)

(assert (=> b!298105 (= e!213531 e!213529)))

(declare-fun res!246005 () Bool)

(assert (=> b!298105 (=> (not res!246005) (not e!213529))))

(declare-fun e!213530 () Bool)

(assert (=> b!298105 (= res!246005 e!213530)))

(declare-fun res!246007 () Bool)

(assert (=> b!298105 (=> res!246007 e!213530)))

(assert (=> b!298105 (= res!246007 (bvsge (_1!13114 lt!434274) (_2!13114 lt!434274)))))

(assert (=> b!298105 (= lt!434271 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!298105 (= lt!434273 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!930)

(assert (=> b!298105 (= lt!434274 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(declare-fun b!298106 () Bool)

(declare-fun arrayRangesEq!1523 (array!17869 array!17869 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!298106 (= e!213530 (arrayRangesEq!1523 arr!273 arr!273 (_1!13114 lt!434274) (_2!13114 lt!434274)))))

(declare-fun b!298107 () Bool)

(assert (=> b!298107 (= e!213529 e!213527)))

(assert (=> b!298107 (= c!13635 (= (_3!1422 lt!434274) (_4!465 lt!434274)))))

(assert (= (and d!100320 (not res!246006)) b!298105))

(assert (= (and b!298105 (not res!246007)) b!298106))

(assert (= (and b!298105 res!246005) b!298107))

(assert (= (and b!298107 c!13635) b!298102))

(assert (= (and b!298107 (not c!13635)) b!298101))

(assert (= (and b!298101 res!246003) b!298104))

(assert (= (and b!298104 (not res!246008)) b!298103))

(assert (= (or b!298102 b!298103) bm!5270))

(declare-fun m!437005 () Bool)

(assert (=> b!298101 m!437005))

(assert (=> b!298101 m!437005))

(assert (=> b!298101 m!437005))

(assert (=> b!298101 m!437005))

(declare-fun m!437009 () Bool)

(assert (=> b!298101 m!437009))

(declare-fun m!437011 () Bool)

(assert (=> bm!5270 m!437011))

(assert (=> bm!5270 m!437005))

(assert (=> bm!5270 m!437005))

(declare-fun m!437017 () Bool)

(assert (=> bm!5270 m!437017))

(assert (=> bm!5270 m!437011))

(declare-fun m!437019 () Bool)

(assert (=> b!298105 m!437019))

(declare-fun m!437022 () Bool)

(assert (=> b!298106 m!437022))

(assert (=> b!298049 d!100320))

(declare-fun d!100330 () Bool)

(assert (=> d!100330 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!434283 () Unit!20811)

(declare-fun choose!4 (array!17869 array!17869 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20811)

(assert (=> d!100330 (= lt!434283 (choose!4 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!434236 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!100330 (bvsle (size!7745 arr!273) (size!7745 arr!273))))

(assert (=> d!100330 (= (arrayBitRangesEqSlicedLemma!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!434236 #b0000000000000000000000000000000000000000000000000000000000000000 from!505) lt!434283)))

(declare-fun bs!25682 () Bool)

(assert (= bs!25682 d!100330))

(assert (=> bs!25682 m!436963))

(declare-fun m!437029 () Bool)

(assert (=> bs!25682 m!437029))

(assert (=> b!298049 d!100330))

(declare-fun b!298122 () Bool)

(declare-fun e!213545 () Bool)

(declare-fun e!213544 () Bool)

(assert (=> b!298122 (= e!213545 e!213544)))

(declare-fun res!246019 () Bool)

(declare-fun lt!434285 () (_ BitVec 32))

(declare-fun lt!434286 () tuple4!930)

(assert (=> b!298122 (= res!246019 (byteRangesEq!0 (select (arr!8825 arr!273) (_3!1422 lt!434286)) (select (arr!8825 arr!273) (_3!1422 lt!434286)) lt!434285 #b00000000000000000000000000001000))))

(assert (=> b!298122 (=> (not res!246019) (not e!213544))))

(declare-fun d!100336 () Bool)

(declare-fun res!246021 () Bool)

(declare-fun e!213549 () Bool)

(assert (=> d!100336 (=> res!246021 e!213549)))

(assert (=> d!100336 (= res!246021 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!434236))))

(assert (=> d!100336 (= (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!434236) e!213549)))

(declare-fun b!298123 () Bool)

(declare-fun call!5276 () Bool)

(assert (=> b!298123 (= e!213545 call!5276)))

(declare-fun b!298124 () Bool)

(declare-fun e!213546 () Bool)

(assert (=> b!298124 (= e!213546 call!5276)))

(declare-fun b!298125 () Bool)

(declare-fun res!246023 () Bool)

(declare-fun lt!434284 () (_ BitVec 32))

(assert (=> b!298125 (= res!246023 (= lt!434284 #b00000000000000000000000000000000))))

(assert (=> b!298125 (=> res!246023 e!213546)))

(assert (=> b!298125 (= e!213544 e!213546)))

(declare-fun bm!5273 () Bool)

(declare-fun c!13638 () Bool)

(assert (=> bm!5273 (= call!5276 (byteRangesEq!0 (ite c!13638 (select (arr!8825 arr!273) (_3!1422 lt!434286)) (select (arr!8825 arr!273) (_4!465 lt!434286))) (ite c!13638 (select (arr!8825 arr!273) (_3!1422 lt!434286)) (select (arr!8825 arr!273) (_4!465 lt!434286))) (ite c!13638 lt!434285 #b00000000000000000000000000000000) lt!434284))))

(declare-fun b!298126 () Bool)

(declare-fun e!213547 () Bool)

(assert (=> b!298126 (= e!213549 e!213547)))

(declare-fun res!246020 () Bool)

(assert (=> b!298126 (=> (not res!246020) (not e!213547))))

(declare-fun e!213548 () Bool)

(assert (=> b!298126 (= res!246020 e!213548)))

(declare-fun res!246022 () Bool)

(assert (=> b!298126 (=> res!246022 e!213548)))

(assert (=> b!298126 (= res!246022 (bvsge (_1!13114 lt!434286) (_2!13114 lt!434286)))))

(assert (=> b!298126 (= lt!434284 ((_ extract 31 0) (bvsrem lt!434236 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!298126 (= lt!434285 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!298126 (= lt!434286 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!434236))))

(declare-fun b!298127 () Bool)

(assert (=> b!298127 (= e!213548 (arrayRangesEq!1523 arr!273 arr!273 (_1!13114 lt!434286) (_2!13114 lt!434286)))))

(declare-fun b!298128 () Bool)

(assert (=> b!298128 (= e!213547 e!213545)))

(assert (=> b!298128 (= c!13638 (= (_3!1422 lt!434286) (_4!465 lt!434286)))))

(assert (= (and d!100336 (not res!246021)) b!298126))

(assert (= (and b!298126 (not res!246022)) b!298127))

(assert (= (and b!298126 res!246020) b!298128))

(assert (= (and b!298128 c!13638) b!298123))

(assert (= (and b!298128 (not c!13638)) b!298122))

(assert (= (and b!298122 res!246019) b!298125))

(assert (= (and b!298125 (not res!246023)) b!298124))

(assert (= (or b!298123 b!298124) bm!5273))

(declare-fun m!437031 () Bool)

(assert (=> b!298122 m!437031))

(assert (=> b!298122 m!437031))

(assert (=> b!298122 m!437031))

(assert (=> b!298122 m!437031))

(declare-fun m!437033 () Bool)

(assert (=> b!298122 m!437033))

(declare-fun m!437035 () Bool)

(assert (=> bm!5273 m!437035))

(assert (=> bm!5273 m!437031))

(assert (=> bm!5273 m!437031))

(declare-fun m!437037 () Bool)

(assert (=> bm!5273 m!437037))

(assert (=> bm!5273 m!437035))

(declare-fun m!437039 () Bool)

(assert (=> b!298126 m!437039))

(declare-fun m!437041 () Bool)

(assert (=> b!298127 m!437041))

(assert (=> b!298049 d!100336))

(declare-fun d!100338 () Bool)

(assert (=> d!100338 (= (inv!12 thiss!1728) (invariant!0 (currentBit!14357 thiss!1728) (currentByte!14362 thiss!1728) (size!7745 (buf!7808 thiss!1728))))))

(declare-fun bs!25683 () Bool)

(assert (= bs!25683 d!100338))

(assert (=> bs!25683 m!436961))

(assert (=> start!66510 d!100338))

(declare-fun d!100340 () Bool)

(assert (=> d!100340 (= (array_inv!7357 arr!273) (bvsge (size!7745 arr!273) #b00000000000000000000000000000000))))

(assert (=> start!66510 d!100340))

(declare-fun d!100344 () Bool)

(assert (=> d!100344 (= (array_inv!7357 (buf!7808 thiss!1728)) (bvsge (size!7745 (buf!7808 thiss!1728)) #b00000000000000000000000000000000))))

(assert (=> b!298050 d!100344))

(check-sat (not bm!5270) (not d!100338) (not b!298106) (not d!100330) (not bm!5273) (not d!100304) (not d!100308) (not b!298126) (not b!298065) (not b!298122) (not b!298101) (not b!298127) (not b!298105))
