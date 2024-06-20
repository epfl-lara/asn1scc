; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65074 () Bool)

(assert start!65074)

(declare-fun b!292098 () Bool)

(declare-fun e!208286 () Bool)

(declare-datatypes ((array!17357 0))(
  ( (array!17358 (arr!8542 (Array (_ BitVec 32) (_ BitVec 8))) (size!7516 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13042 0))(
  ( (BitStream!13043 (buf!7582 array!17357) (currentByte!14025 (_ BitVec 32)) (currentBit!14020 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13042)

(declare-fun array_inv!7128 (array!17357) Bool)

(assert (=> b!292098 (= e!208286 (array_inv!7128 (buf!7582 thiss!1728)))))

(declare-fun res!241284 () Bool)

(declare-fun e!208287 () Bool)

(assert (=> start!65074 (=> (not res!241284) (not e!208287))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun arr!273 () array!17357)

(assert (=> start!65074 (= res!241284 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7516 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65074 e!208287))

(declare-fun inv!12 (BitStream!13042) Bool)

(assert (=> start!65074 (and (inv!12 thiss!1728) e!208286)))

(assert (=> start!65074 true))

(assert (=> start!65074 (array_inv!7128 arr!273)))

(declare-fun b!292096 () Bool)

(declare-fun res!241285 () Bool)

(assert (=> b!292096 (=> (not res!241285) (not e!208287))))

(assert (=> b!292096 (= res!241285 (bvsge from!505 to!474))))

(declare-fun b!292095 () Bool)

(declare-fun res!241286 () Bool)

(assert (=> b!292095 (=> (not res!241286) (not e!208287))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292095 (= res!241286 (validate_offset_bits!1 ((_ sign_extend 32) (size!7516 (buf!7582 thiss!1728))) ((_ sign_extend 32) (currentByte!14025 thiss!1728)) ((_ sign_extend 32) (currentBit!14020 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!292097 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!292097 (= e!208287 (not (invariant!0 (currentBit!14020 thiss!1728) (currentByte!14025 thiss!1728) (size!7516 (buf!7582 thiss!1728)))))))

(declare-fun arrayBitRangesEq!0 (array!17357 array!17357 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292097 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((Unit!20321 0))(
  ( (Unit!20322) )
))
(declare-fun lt!424482 () Unit!20321)

(declare-fun lt!424481 () (_ BitVec 64))

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17357 array!17357 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20321)

(assert (=> b!292097 (= lt!424482 (arrayBitRangesEqSlicedLemma!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424481 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> b!292097 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424481)))

(assert (=> b!292097 (= lt!424481 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7516 arr!273))))))

(declare-fun lt!424480 () Unit!20321)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17357) Unit!20321)

(assert (=> b!292097 (= lt!424480 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(assert (= (and start!65074 res!241284) b!292095))

(assert (= (and b!292095 res!241286) b!292096))

(assert (= (and b!292096 res!241285) b!292097))

(assert (= start!65074 b!292098))

(declare-fun m!427525 () Bool)

(assert (=> b!292098 m!427525))

(declare-fun m!427527 () Bool)

(assert (=> start!65074 m!427527))

(declare-fun m!427529 () Bool)

(assert (=> start!65074 m!427529))

(declare-fun m!427531 () Bool)

(assert (=> b!292095 m!427531))

(declare-fun m!427533 () Bool)

(assert (=> b!292097 m!427533))

(declare-fun m!427535 () Bool)

(assert (=> b!292097 m!427535))

(declare-fun m!427537 () Bool)

(assert (=> b!292097 m!427537))

(declare-fun m!427539 () Bool)

(assert (=> b!292097 m!427539))

(declare-fun m!427541 () Bool)

(assert (=> b!292097 m!427541))

(push 1)

(assert (not b!292097))

(assert (not b!292098))

(assert (not start!65074))

(assert (not b!292095))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!98828 () Bool)

(assert (=> d!98828 (= (invariant!0 (currentBit!14020 thiss!1728) (currentByte!14025 thiss!1728) (size!7516 (buf!7582 thiss!1728))) (and (bvsge (currentBit!14020 thiss!1728) #b00000000000000000000000000000000) (bvslt (currentBit!14020 thiss!1728) #b00000000000000000000000000001000) (bvsge (currentByte!14025 thiss!1728) #b00000000000000000000000000000000) (or (bvslt (currentByte!14025 thiss!1728) (size!7516 (buf!7582 thiss!1728))) (and (= (currentBit!14020 thiss!1728) #b00000000000000000000000000000000) (= (currentByte!14025 thiss!1728) (size!7516 (buf!7582 thiss!1728)))))))))

(assert (=> b!292097 d!98828))

(declare-fun d!98830 () Bool)

(declare-fun e!208314 () Bool)

(assert (=> d!98830 e!208314))

(declare-fun res!241307 () Bool)

(assert (=> d!98830 (=> (not res!241307) (not e!208314))))

(declare-fun lt!424506 () (_ BitVec 64))

(assert (=> d!98830 (= res!241307 (or (= lt!424506 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!424506 #b0000000000000000000000000000000000000000000000000000000000001000) lt!424506))))))

(assert (=> d!98830 (= lt!424506 ((_ sign_extend 32) (size!7516 arr!273)))))

(declare-fun lt!424505 () Unit!20321)

(declare-fun choose!59 (array!17357) Unit!20321)

(assert (=> d!98830 (= lt!424505 (choose!59 arr!273))))

(assert (=> d!98830 (= (arrayBitRangesEqReflexiveLemma!0 arr!273) lt!424505)))

(declare-fun b!292125 () Bool)

(assert (=> b!292125 (= e!208314 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul ((_ sign_extend 32) (size!7516 arr!273)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (= (and d!98830 res!241307) b!292125))

(declare-fun m!427579 () Bool)

(assert (=> d!98830 m!427579))

(declare-fun m!427581 () Bool)

(assert (=> b!292125 m!427581))

(assert (=> b!292097 d!98830))

(declare-fun b!292161 () Bool)

(declare-fun e!208348 () Bool)

(declare-fun e!208349 () Bool)

(assert (=> b!292161 (= e!208348 e!208349)))

(declare-fun res!241337 () Bool)

(declare-fun call!4916 () Bool)

(assert (=> b!292161 (= res!241337 call!4916)))

(assert (=> b!292161 (=> (not res!241337) (not e!208349))))

(declare-fun b!292162 () Bool)

(declare-fun res!241335 () Bool)

(declare-fun lt!424523 () (_ BitVec 32))

(assert (=> b!292162 (= res!241335 (= lt!424523 #b00000000000000000000000000000000))))

(declare-fun e!208350 () Bool)

(assert (=> b!292162 (=> res!241335 e!208350)))

(assert (=> b!292162 (= e!208349 e!208350)))

(declare-fun b!292163 () Bool)

(assert (=> b!292163 (= e!208348 call!4916)))

(declare-fun b!292164 () Bool)

(declare-datatypes ((tuple4!852 0))(
  ( (tuple4!853 (_1!12769 (_ BitVec 32)) (_2!12769 (_ BitVec 32)) (_3!1296 (_ BitVec 32)) (_4!426 (_ BitVec 32))) )
))
(declare-fun lt!424524 () tuple4!852)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!292164 (= e!208350 (byteRangesEq!0 (select (arr!8542 arr!273) (_4!426 lt!424524)) (select (arr!8542 arr!273) (_4!426 lt!424524)) #b00000000000000000000000000000000 lt!424523))))

(declare-fun d!98832 () Bool)

(declare-fun res!241336 () Bool)

(declare-fun e!208347 () Bool)

(assert (=> d!98832 (=> res!241336 e!208347)))

(assert (=> d!98832 (= res!241336 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!424481))))

(assert (=> d!98832 (= (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424481) e!208347)))

(declare-fun b!292165 () Bool)

(declare-fun e!208345 () Bool)

(assert (=> b!292165 (= e!208345 e!208348)))

(declare-fun c!13350 () Bool)

(assert (=> b!292165 (= c!13350 (= (_3!1296 lt!424524) (_4!426 lt!424524)))))

(declare-fun bm!4913 () Bool)

(declare-fun lt!424522 () (_ BitVec 32))

(assert (=> bm!4913 (= call!4916 (byteRangesEq!0 (select (arr!8542 arr!273) (_3!1296 lt!424524)) (select (arr!8542 arr!273) (_3!1296 lt!424524)) lt!424522 (ite c!13350 lt!424523 #b00000000000000000000000000001000)))))

(declare-fun b!292166 () Bool)

(assert (=> b!292166 (= e!208347 e!208345)))

(declare-fun res!241334 () Bool)

(assert (=> b!292166 (=> (not res!241334) (not e!208345))))

(declare-fun e!208346 () Bool)

(assert (=> b!292166 (= res!241334 e!208346)))

(declare-fun res!241333 () Bool)

(assert (=> b!292166 (=> res!241333 e!208346)))

(assert (=> b!292166 (= res!241333 (bvsge (_1!12769 lt!424524) (_2!12769 lt!424524)))))

(assert (=> b!292166 (= lt!424523 ((_ extract 31 0) (bvsrem lt!424481 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!292166 (= lt!424522 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!852)

(assert (=> b!292166 (= lt!424524 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424481))))

(declare-fun b!292167 () Bool)

(declare-fun arrayRangesEq!1484 (array!17357 array!17357 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!292167 (= e!208346 (arrayRangesEq!1484 arr!273 arr!273 (_1!12769 lt!424524) (_2!12769 lt!424524)))))

(assert (= (and d!98832 (not res!241336)) b!292166))

(assert (= (and b!292166 (not res!241333)) b!292167))

(assert (= (and b!292166 res!241334) b!292165))

(assert (= (and b!292165 c!13350) b!292163))

(assert (= (and b!292165 (not c!13350)) b!292161))

(assert (= (and b!292161 res!241337) b!292162))

(assert (= (and b!292162 (not res!241335)) b!292164))

(assert (= (or b!292163 b!292161) bm!4913))

(declare-fun m!427595 () Bool)

(assert (=> b!292164 m!427595))

(assert (=> b!292164 m!427595))

(assert (=> b!292164 m!427595))

(assert (=> b!292164 m!427595))

(declare-fun m!427597 () Bool)

(assert (=> b!292164 m!427597))

(declare-fun m!427599 () Bool)

(assert (=> bm!4913 m!427599))

(assert (=> bm!4913 m!427599))

(assert (=> bm!4913 m!427599))

(assert (=> bm!4913 m!427599))

(declare-fun m!427601 () Bool)

(assert (=> bm!4913 m!427601))

(declare-fun m!427603 () Bool)

(assert (=> b!292166 m!427603))

(declare-fun m!427605 () Bool)

(assert (=> b!292167 m!427605))

(assert (=> b!292097 d!98832))

(declare-fun d!98840 () Bool)

(assert (=> d!98840 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!424536 () Unit!20321)

(declare-fun choose!4 (array!17357 array!17357 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20321)

(assert (=> d!98840 (= lt!424536 (choose!4 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424481 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!98840 (bvsle (size!7516 arr!273) (size!7516 arr!273))))

(assert (=> d!98840 (= (arrayBitRangesEqSlicedLemma!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424481 #b0000000000000000000000000000000000000000000000000000000000000000 from!505) lt!424536)))

(declare-fun bs!25204 () Bool)

(assert (= bs!25204 d!98840))

(assert (=> bs!25204 m!427539))

(declare-fun m!427609 () Bool)

(assert (=> bs!25204 m!427609))

(assert (=> b!292097 d!98840))

(declare-fun b!292182 () Bool)

(declare-fun e!208366 () Bool)

(declare-fun e!208367 () Bool)

(assert (=> b!292182 (= e!208366 e!208367)))

(declare-fun res!241352 () Bool)

(declare-fun call!4919 () Bool)

(assert (=> b!292182 (= res!241352 call!4919)))

(assert (=> b!292182 (=> (not res!241352) (not e!208367))))

(declare-fun b!292183 () Bool)

(declare-fun res!241350 () Bool)

(declare-fun lt!424538 () (_ BitVec 32))

(assert (=> b!292183 (= res!241350 (= lt!424538 #b00000000000000000000000000000000))))

(declare-fun e!208368 () Bool)

(assert (=> b!292183 (=> res!241350 e!208368)))

(assert (=> b!292183 (= e!208367 e!208368)))

(declare-fun b!292184 () Bool)

(assert (=> b!292184 (= e!208366 call!4919)))

(declare-fun lt!424539 () tuple4!852)

(declare-fun b!292185 () Bool)

(assert (=> b!292185 (= e!208368 (byteRangesEq!0 (select (arr!8542 arr!273) (_4!426 lt!424539)) (select (arr!8542 arr!273) (_4!426 lt!424539)) #b00000000000000000000000000000000 lt!424538))))

(declare-fun d!98844 () Bool)

(declare-fun res!241351 () Bool)

(declare-fun e!208365 () Bool)

(assert (=> d!98844 (=> res!241351 e!208365)))

(assert (=> d!98844 (= res!241351 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!98844 (= (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505) e!208365)))

(declare-fun b!292186 () Bool)

(declare-fun e!208363 () Bool)

(assert (=> b!292186 (= e!208363 e!208366)))

(declare-fun c!13353 () Bool)

(assert (=> b!292186 (= c!13353 (= (_3!1296 lt!424539) (_4!426 lt!424539)))))

(declare-fun lt!424537 () (_ BitVec 32))

(declare-fun bm!4916 () Bool)

(assert (=> bm!4916 (= call!4919 (byteRangesEq!0 (select (arr!8542 arr!273) (_3!1296 lt!424539)) (select (arr!8542 arr!273) (_3!1296 lt!424539)) lt!424537 (ite c!13353 lt!424538 #b00000000000000000000000000001000)))))

(declare-fun b!292187 () Bool)

(assert (=> b!292187 (= e!208365 e!208363)))

(declare-fun res!241349 () Bool)

(assert (=> b!292187 (=> (not res!241349) (not e!208363))))

(declare-fun e!208364 () Bool)

(assert (=> b!292187 (= res!241349 e!208364)))

(declare-fun res!241348 () Bool)

(assert (=> b!292187 (=> res!241348 e!208364)))

(assert (=> b!292187 (= res!241348 (bvsge (_1!12769 lt!424539) (_2!12769 lt!424539)))))

(assert (=> b!292187 (= lt!424538 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!292187 (= lt!424537 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!292187 (= lt!424539 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(declare-fun b!292188 () Bool)

(assert (=> b!292188 (= e!208364 (arrayRangesEq!1484 arr!273 arr!273 (_1!12769 lt!424539) (_2!12769 lt!424539)))))

(assert (= (and d!98844 (not res!241351)) b!292187))

(assert (= (and b!292187 (not res!241348)) b!292188))

(assert (= (and b!292187 res!241349) b!292186))

(assert (= (and b!292186 c!13353) b!292184))

(assert (= (and b!292186 (not c!13353)) b!292182))

(assert (= (and b!292182 res!241352) b!292183))

(assert (= (and b!292183 (not res!241350)) b!292185))

(assert (= (or b!292184 b!292182) bm!4916))

(declare-fun m!427611 () Bool)

(assert (=> b!292185 m!427611))

(assert (=> b!292185 m!427611))

(assert (=> b!292185 m!427611))

(assert (=> b!292185 m!427611))

(declare-fun m!427613 () Bool)

(assert (=> b!292185 m!427613))

(declare-fun m!427615 () Bool)

(assert (=> bm!4916 m!427615))

(assert (=> bm!4916 m!427615))

(assert (=> bm!4916 m!427615))

(assert (=> bm!4916 m!427615))

(declare-fun m!427617 () Bool)

(assert (=> bm!4916 m!427617))

(declare-fun m!427619 () Bool)

(assert (=> b!292187 m!427619))

(declare-fun m!427621 () Bool)

(assert (=> b!292188 m!427621))

(assert (=> b!292097 d!98844))

(declare-fun d!98848 () Bool)

(assert (=> d!98848 (= (array_inv!7128 (buf!7582 thiss!1728)) (bvsge (size!7516 (buf!7582 thiss!1728)) #b00000000000000000000000000000000))))

(assert (=> b!292098 d!98848))

(declare-fun d!98850 () Bool)

(assert (=> d!98850 (= (inv!12 thiss!1728) (invariant!0 (currentBit!14020 thiss!1728) (currentByte!14025 thiss!1728) (size!7516 (buf!7582 thiss!1728))))))

(declare-fun bs!25205 () Bool)

(assert (= bs!25205 d!98850))

(assert (=> bs!25205 m!427537))

(assert (=> start!65074 d!98850))

(declare-fun d!98852 () Bool)

(assert (=> d!98852 (= (array_inv!7128 arr!273) (bvsge (size!7516 arr!273) #b00000000000000000000000000000000))))

(assert (=> start!65074 d!98852))

(declare-fun d!98854 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!98854 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7516 (buf!7582 thiss!1728))) ((_ sign_extend 32) (currentByte!14025 thiss!1728)) ((_ sign_extend 32) (currentBit!14020 thiss!1728)) (bvsub nBits!523 from!505)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7516 (buf!7582 thiss!1728))) ((_ sign_extend 32) (currentByte!14025 thiss!1728)) ((_ sign_extend 32) (currentBit!14020 thiss!1728))) (bvsub nBits!523 from!505)))))

(declare-fun bs!25206 () Bool)

(assert (= bs!25206 d!98854))

(declare-fun m!427627 () Bool)

(assert (=> bs!25206 m!427627))

(assert (=> b!292095 d!98854))

(push 1)

(assert (not b!292167))

(assert (not bm!4913))

(assert (not b!292164))

(assert (not bm!4916))

(assert (not d!98830))

(assert (not b!292185))

(assert (not d!98840))

(assert (not b!292187))

(assert (not d!98850))

(assert (not d!98854))

(assert (not b!292188))

(assert (not b!292166))

(assert (not b!292125))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

