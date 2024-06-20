; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65122 () Bool)

(assert start!65122)

(declare-fun b!292226 () Bool)

(declare-fun e!208403 () Bool)

(declare-datatypes ((array!17366 0))(
  ( (array!17367 (arr!8545 (Array (_ BitVec 32) (_ BitVec 8))) (size!7519 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13048 0))(
  ( (BitStream!13049 (buf!7585 array!17366) (currentByte!14034 (_ BitVec 32)) (currentBit!14029 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13048)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!292226 (= e!208403 (not (invariant!0 (currentBit!14029 thiss!1728) (currentByte!14034 thiss!1728) (size!7519 (buf!7585 thiss!1728)))))))

(declare-fun arr!273 () array!17366)

(declare-fun from!505 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!17366 array!17366 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292226 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!424572 () (_ BitVec 64))

(declare-datatypes ((Unit!20327 0))(
  ( (Unit!20328) )
))
(declare-fun lt!424570 () Unit!20327)

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17366 array!17366 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20327)

(assert (=> b!292226 (= lt!424570 (arrayBitRangesEqSlicedLemma!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424572 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> b!292226 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424572)))

(assert (=> b!292226 (= lt!424572 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7519 arr!273))))))

(declare-fun lt!424571 () Unit!20327)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17366) Unit!20327)

(assert (=> b!292226 (= lt!424571 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(declare-fun res!241380 () Bool)

(assert (=> start!65122 (=> (not res!241380) (not e!208403))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> start!65122 (= res!241380 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7519 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65122 e!208403))

(declare-fun e!208402 () Bool)

(declare-fun inv!12 (BitStream!13048) Bool)

(assert (=> start!65122 (and (inv!12 thiss!1728) e!208402)))

(assert (=> start!65122 true))

(declare-fun array_inv!7131 (array!17366) Bool)

(assert (=> start!65122 (array_inv!7131 arr!273)))

(declare-fun b!292224 () Bool)

(declare-fun res!241381 () Bool)

(assert (=> b!292224 (=> (not res!241381) (not e!208403))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292224 (= res!241381 (validate_offset_bits!1 ((_ sign_extend 32) (size!7519 (buf!7585 thiss!1728))) ((_ sign_extend 32) (currentByte!14034 thiss!1728)) ((_ sign_extend 32) (currentBit!14029 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!292225 () Bool)

(declare-fun res!241382 () Bool)

(assert (=> b!292225 (=> (not res!241382) (not e!208403))))

(assert (=> b!292225 (= res!241382 (bvsge from!505 to!474))))

(declare-fun b!292227 () Bool)

(assert (=> b!292227 (= e!208402 (array_inv!7131 (buf!7585 thiss!1728)))))

(assert (= (and start!65122 res!241380) b!292224))

(assert (= (and b!292224 res!241381) b!292225))

(assert (= (and b!292225 res!241382) b!292226))

(assert (= start!65122 b!292227))

(declare-fun m!427675 () Bool)

(assert (=> b!292226 m!427675))

(declare-fun m!427677 () Bool)

(assert (=> b!292226 m!427677))

(declare-fun m!427679 () Bool)

(assert (=> b!292226 m!427679))

(declare-fun m!427681 () Bool)

(assert (=> b!292226 m!427681))

(declare-fun m!427683 () Bool)

(assert (=> b!292226 m!427683))

(declare-fun m!427685 () Bool)

(assert (=> start!65122 m!427685))

(declare-fun m!427687 () Bool)

(assert (=> start!65122 m!427687))

(declare-fun m!427689 () Bool)

(assert (=> b!292224 m!427689))

(declare-fun m!427691 () Bool)

(assert (=> b!292227 m!427691))

(push 1)

(assert (not b!292226))

(assert (not b!292224))

(assert (not start!65122))

(assert (not b!292227))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!98888 () Bool)

(assert (=> d!98888 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!424593 () Unit!20327)

(declare-fun choose!4 (array!17366 array!17366 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20327)

(assert (=> d!98888 (= lt!424593 (choose!4 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424572 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!98888 (bvsle (size!7519 arr!273) (size!7519 arr!273))))

(assert (=> d!98888 (= (arrayBitRangesEqSlicedLemma!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424572 #b0000000000000000000000000000000000000000000000000000000000000000 from!505) lt!424593)))

(declare-fun bs!25215 () Bool)

(assert (= bs!25215 d!98888))

(assert (=> bs!25215 m!427683))

(declare-fun m!427729 () Bool)

(assert (=> bs!25215 m!427729))

(assert (=> b!292226 d!98888))

(declare-fun d!98890 () Bool)

(assert (=> d!98890 (= (invariant!0 (currentBit!14029 thiss!1728) (currentByte!14034 thiss!1728) (size!7519 (buf!7585 thiss!1728))) (and (bvsge (currentBit!14029 thiss!1728) #b00000000000000000000000000000000) (bvslt (currentBit!14029 thiss!1728) #b00000000000000000000000000001000) (bvsge (currentByte!14034 thiss!1728) #b00000000000000000000000000000000) (or (bvslt (currentByte!14034 thiss!1728) (size!7519 (buf!7585 thiss!1728))) (and (= (currentBit!14029 thiss!1728) #b00000000000000000000000000000000) (= (currentByte!14034 thiss!1728) (size!7519 (buf!7585 thiss!1728)))))))))

(assert (=> b!292226 d!98890))

(declare-fun d!98892 () Bool)

(declare-fun e!208434 () Bool)

(assert (=> d!98892 e!208434))

(declare-fun res!241406 () Bool)

(assert (=> d!98892 (=> (not res!241406) (not e!208434))))

(declare-fun lt!424605 () (_ BitVec 64))

(assert (=> d!98892 (= res!241406 (or (= lt!424605 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!424605 #b0000000000000000000000000000000000000000000000000000000000001000) lt!424605))))))

(assert (=> d!98892 (= lt!424605 ((_ sign_extend 32) (size!7519 arr!273)))))

(declare-fun lt!424604 () Unit!20327)

(declare-fun choose!59 (array!17366) Unit!20327)

(assert (=> d!98892 (= lt!424604 (choose!59 arr!273))))

(assert (=> d!98892 (= (arrayBitRangesEqReflexiveLemma!0 arr!273) lt!424604)))

(declare-fun b!292257 () Bool)

(assert (=> b!292257 (= e!208434 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul ((_ sign_extend 32) (size!7519 arr!273)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (= (and d!98892 res!241406) b!292257))

(declare-fun m!427735 () Bool)

(assert (=> d!98892 m!427735))

(declare-fun m!427737 () Bool)

(assert (=> b!292257 m!427737))

(assert (=> b!292226 d!98892))

(declare-fun b!292298 () Bool)

(declare-fun e!208472 () Bool)

(declare-fun e!208473 () Bool)

(assert (=> b!292298 (= e!208472 e!208473)))

(declare-fun res!241437 () Bool)

(assert (=> b!292298 (=> (not res!241437) (not e!208473))))

(declare-fun e!208471 () Bool)

(assert (=> b!292298 (= res!241437 e!208471)))

(declare-fun res!241439 () Bool)

(assert (=> b!292298 (=> res!241439 e!208471)))

(declare-datatypes ((tuple4!858 0))(
  ( (tuple4!859 (_1!12772 (_ BitVec 32)) (_2!12772 (_ BitVec 32)) (_3!1299 (_ BitVec 32)) (_4!429 (_ BitVec 32))) )
))
(declare-fun lt!424625 () tuple4!858)

(assert (=> b!292298 (= res!241439 (bvsge (_1!12772 lt!424625) (_2!12772 lt!424625)))))

(declare-fun lt!424626 () (_ BitVec 32))

(assert (=> b!292298 (= lt!424626 ((_ extract 31 0) (bvsrem lt!424572 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!424624 () (_ BitVec 32))

(assert (=> b!292298 (= lt!424624 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!858)

(assert (=> b!292298 (= lt!424625 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424572))))

(declare-fun b!292299 () Bool)

(declare-fun e!208474 () Bool)

(declare-fun call!4927 () Bool)

(assert (=> b!292299 (= e!208474 call!4927)))

(declare-fun b!292300 () Bool)

(declare-fun e!208470 () Bool)

(assert (=> b!292300 (= e!208470 call!4927)))

(declare-fun b!292302 () Bool)

(assert (=> b!292302 (= e!208473 e!208470)))

(declare-fun c!13363 () Bool)

(assert (=> b!292302 (= c!13363 (= (_3!1299 lt!424625) (_4!429 lt!424625)))))

(declare-fun b!292303 () Bool)

(declare-fun res!241435 () Bool)

(assert (=> b!292303 (= res!241435 (= lt!424626 #b00000000000000000000000000000000))))

(assert (=> b!292303 (=> res!241435 e!208474)))

(declare-fun e!208469 () Bool)

(assert (=> b!292303 (= e!208469 e!208474)))

(declare-fun bm!4924 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!4924 (= call!4927 (byteRangesEq!0 (ite c!13363 (select (arr!8545 arr!273) (_3!1299 lt!424625)) (select (arr!8545 arr!273) (_4!429 lt!424625))) (ite c!13363 (select (arr!8545 arr!273) (_3!1299 lt!424625)) (select (arr!8545 arr!273) (_4!429 lt!424625))) (ite c!13363 lt!424624 #b00000000000000000000000000000000) lt!424626))))

(declare-fun b!292304 () Bool)

(assert (=> b!292304 (= e!208470 e!208469)))

(declare-fun res!241436 () Bool)

(assert (=> b!292304 (= res!241436 (byteRangesEq!0 (select (arr!8545 arr!273) (_3!1299 lt!424625)) (select (arr!8545 arr!273) (_3!1299 lt!424625)) lt!424624 #b00000000000000000000000000001000))))

(assert (=> b!292304 (=> (not res!241436) (not e!208469))))

(declare-fun d!98896 () Bool)

(declare-fun res!241438 () Bool)

(assert (=> d!98896 (=> res!241438 e!208472)))

(assert (=> d!98896 (= res!241438 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!424572))))

(assert (=> d!98896 (= (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424572) e!208472)))

(declare-fun b!292301 () Bool)

(declare-fun arrayRangesEq!1487 (array!17366 array!17366 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!292301 (= e!208471 (arrayRangesEq!1487 arr!273 arr!273 (_1!12772 lt!424625) (_2!12772 lt!424625)))))

(assert (= (and d!98896 (not res!241438)) b!292298))

(assert (= (and b!292298 (not res!241439)) b!292301))

(assert (= (and b!292298 res!241437) b!292302))

(assert (= (and b!292302 c!13363) b!292300))

(assert (= (and b!292302 (not c!13363)) b!292304))

(assert (= (and b!292304 res!241436) b!292303))

(assert (= (and b!292303 (not res!241435)) b!292299))

(assert (= (or b!292300 b!292299) bm!4924))

(declare-fun m!427739 () Bool)

(assert (=> b!292298 m!427739))

(declare-fun m!427741 () Bool)

(assert (=> bm!4924 m!427741))

(declare-fun m!427743 () Bool)

(assert (=> bm!4924 m!427743))

(assert (=> bm!4924 m!427743))

(assert (=> bm!4924 m!427741))

(declare-fun m!427745 () Bool)

(assert (=> bm!4924 m!427745))

(assert (=> b!292304 m!427743))

(assert (=> b!292304 m!427743))

(assert (=> b!292304 m!427743))

(assert (=> b!292304 m!427743))

(declare-fun m!427747 () Bool)

(assert (=> b!292304 m!427747))

(declare-fun m!427749 () Bool)

(assert (=> b!292301 m!427749))

(assert (=> b!292226 d!98896))

(declare-fun b!292307 () Bool)

(declare-fun e!208480 () Bool)

(declare-fun e!208481 () Bool)

(assert (=> b!292307 (= e!208480 e!208481)))

(declare-fun res!241444 () Bool)

(assert (=> b!292307 (=> (not res!241444) (not e!208481))))

(declare-fun e!208479 () Bool)

(assert (=> b!292307 (= res!241444 e!208479)))

(declare-fun res!241446 () Bool)

(assert (=> b!292307 (=> res!241446 e!208479)))

(declare-fun lt!424628 () tuple4!858)

(assert (=> b!292307 (= res!241446 (bvsge (_1!12772 lt!424628) (_2!12772 lt!424628)))))

(declare-fun lt!424629 () (_ BitVec 32))

(assert (=> b!292307 (= lt!424629 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!424627 () (_ BitVec 32))

(assert (=> b!292307 (= lt!424627 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!292307 (= lt!424628 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(declare-fun b!292308 () Bool)

(declare-fun e!208482 () Bool)

(declare-fun call!4930 () Bool)

(assert (=> b!292308 (= e!208482 call!4930)))

(declare-fun b!292309 () Bool)

(declare-fun e!208478 () Bool)

(assert (=> b!292309 (= e!208478 call!4930)))

(declare-fun b!292311 () Bool)

(assert (=> b!292311 (= e!208481 e!208478)))

(declare-fun c!13364 () Bool)

(assert (=> b!292311 (= c!13364 (= (_3!1299 lt!424628) (_4!429 lt!424628)))))

(declare-fun b!292312 () Bool)

(declare-fun res!241442 () Bool)

(assert (=> b!292312 (= res!241442 (= lt!424629 #b00000000000000000000000000000000))))

(assert (=> b!292312 (=> res!241442 e!208482)))

(declare-fun e!208477 () Bool)

(assert (=> b!292312 (= e!208477 e!208482)))

(declare-fun bm!4927 () Bool)

(assert (=> bm!4927 (= call!4930 (byteRangesEq!0 (ite c!13364 (select (arr!8545 arr!273) (_3!1299 lt!424628)) (select (arr!8545 arr!273) (_4!429 lt!424628))) (ite c!13364 (select (arr!8545 arr!273) (_3!1299 lt!424628)) (select (arr!8545 arr!273) (_4!429 lt!424628))) (ite c!13364 lt!424627 #b00000000000000000000000000000000) lt!424629))))

(declare-fun b!292313 () Bool)

(assert (=> b!292313 (= e!208478 e!208477)))

(declare-fun res!241443 () Bool)

(assert (=> b!292313 (= res!241443 (byteRangesEq!0 (select (arr!8545 arr!273) (_3!1299 lt!424628)) (select (arr!8545 arr!273) (_3!1299 lt!424628)) lt!424627 #b00000000000000000000000000001000))))

(assert (=> b!292313 (=> (not res!241443) (not e!208477))))

(declare-fun d!98906 () Bool)

(declare-fun res!241445 () Bool)

(assert (=> d!98906 (=> res!241445 e!208480)))

(assert (=> d!98906 (= res!241445 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!98906 (= (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505) e!208480)))

(declare-fun b!292310 () Bool)

(assert (=> b!292310 (= e!208479 (arrayRangesEq!1487 arr!273 arr!273 (_1!12772 lt!424628) (_2!12772 lt!424628)))))

(assert (= (and d!98906 (not res!241445)) b!292307))

(assert (= (and b!292307 (not res!241446)) b!292310))

(assert (= (and b!292307 res!241444) b!292311))

(assert (= (and b!292311 c!13364) b!292309))

(assert (= (and b!292311 (not c!13364)) b!292313))

(assert (= (and b!292313 res!241443) b!292312))

(assert (= (and b!292312 (not res!241442)) b!292308))

(assert (= (or b!292309 b!292308) bm!4927))

(declare-fun m!427751 () Bool)

(assert (=> b!292307 m!427751))

(declare-fun m!427753 () Bool)

(assert (=> bm!4927 m!427753))

(declare-fun m!427755 () Bool)

(assert (=> bm!4927 m!427755))

(assert (=> bm!4927 m!427755))

(assert (=> bm!4927 m!427753))

(declare-fun m!427757 () Bool)

(assert (=> bm!4927 m!427757))

(assert (=> b!292313 m!427755))

(assert (=> b!292313 m!427755))

(assert (=> b!292313 m!427755))

(assert (=> b!292313 m!427755))

(declare-fun m!427759 () Bool)

(assert (=> b!292313 m!427759))

(declare-fun m!427761 () Bool)

(assert (=> b!292310 m!427761))

(assert (=> b!292226 d!98906))

(declare-fun d!98908 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!98908 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7519 (buf!7585 thiss!1728))) ((_ sign_extend 32) (currentByte!14034 thiss!1728)) ((_ sign_extend 32) (currentBit!14029 thiss!1728)) (bvsub nBits!523 from!505)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7519 (buf!7585 thiss!1728))) ((_ sign_extend 32) (currentByte!14034 thiss!1728)) ((_ sign_extend 32) (currentBit!14029 thiss!1728))) (bvsub nBits!523 from!505)))))

(declare-fun bs!25217 () Bool)

(assert (= bs!25217 d!98908))

(declare-fun m!427771 () Bool)

(assert (=> bs!25217 m!427771))

(assert (=> b!292224 d!98908))

(declare-fun d!98910 () Bool)

(assert (=> d!98910 (= (inv!12 thiss!1728) (invariant!0 (currentBit!14029 thiss!1728) (currentByte!14034 thiss!1728) (size!7519 (buf!7585 thiss!1728))))))

(declare-fun bs!25218 () Bool)

(assert (= bs!25218 d!98910))

(assert (=> bs!25218 m!427681))

(assert (=> start!65122 d!98910))

(declare-fun d!98914 () Bool)

(assert (=> d!98914 (= (array_inv!7131 arr!273) (bvsge (size!7519 arr!273) #b00000000000000000000000000000000))))

(assert (=> start!65122 d!98914))

(declare-fun d!98918 () Bool)

(assert (=> d!98918 (= (array_inv!7131 (buf!7585 thiss!1728)) (bvsge (size!7519 (buf!7585 thiss!1728)) #b00000000000000000000000000000000))))

(assert (=> b!292227 d!98918))

(push 1)

(assert (not d!98888))

(assert (not b!292313))

(assert (not b!292298))

(assert (not d!98908))

(assert (not d!98910))

(assert (not b!292310))

(assert (not bm!4924))

(assert (not bm!4927))

(assert (not b!292304))

(assert (not b!292257))

(assert (not b!292301))

(assert (not b!292307))

(assert (not d!98892))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

