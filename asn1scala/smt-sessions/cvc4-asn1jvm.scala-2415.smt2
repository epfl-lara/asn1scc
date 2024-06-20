; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61532 () Bool)

(assert start!61532)

(declare-fun b!276497 () Bool)

(declare-fun e!196441 () Bool)

(declare-fun lt!414640 () (_ BitVec 64))

(declare-datatypes ((array!15824 0))(
  ( (array!15825 (arr!7845 (Array (_ BitVec 32) (_ BitVec 8))) (size!6852 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12518 0))(
  ( (BitStream!12519 (buf!7320 array!15824) (currentByte!13540 (_ BitVec 32)) (currentBit!13535 (_ BitVec 32))) )
))
(declare-fun bs1!11 () BitStream!12518)

(assert (=> b!276497 (= e!196441 (not (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 lt!414640) (bvsle lt!414640 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6852 (buf!7320 bs1!11))))))))))

(declare-datatypes ((tuple2!22546 0))(
  ( (tuple2!22547 (_1!12317 BitStream!12518) (_2!12317 Bool)) )
))
(declare-fun lt!414641 () tuple2!22546)

(declare-fun bs2!19 () BitStream!12518)

(declare-fun readBitPure!0 (BitStream!12518) tuple2!22546)

(assert (=> b!276497 (= lt!414641 (readBitPure!0 (BitStream!12519 (buf!7320 bs2!19) (currentByte!13540 bs1!11) (currentBit!13535 bs1!11))))))

(declare-fun lt!414642 () tuple2!22546)

(assert (=> b!276497 (= lt!414642 (readBitPure!0 bs1!11))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!276497 (invariant!0 (currentBit!13535 bs1!11) (currentByte!13540 bs1!11) (size!6852 (buf!7320 bs2!19)))))

(declare-fun b!276498 () Bool)

(declare-fun e!196440 () Bool)

(assert (=> b!276498 (= e!196440 e!196441)))

(declare-fun res!229726 () Bool)

(assert (=> b!276498 (=> (not res!229726) (not e!196441))))

(declare-fun arrayBitRangesEq!0 (array!15824 array!15824 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!276498 (= res!229726 (arrayBitRangesEq!0 (buf!7320 bs1!11) (buf!7320 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 lt!414640))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!276498 (= lt!414640 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!6852 (buf!7320 bs1!11)) (currentByte!13540 bs1!11) (currentBit!13535 bs1!11))))))

(declare-fun b!276499 () Bool)

(declare-fun res!229725 () Bool)

(assert (=> b!276499 (=> (not res!229725) (not e!196440))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!276499 (= res!229725 (validate_offset_bit!0 ((_ sign_extend 32) (size!6852 (buf!7320 bs1!11))) ((_ sign_extend 32) (currentByte!13540 bs1!11)) ((_ sign_extend 32) (currentBit!13535 bs1!11))))))

(declare-fun res!229724 () Bool)

(assert (=> start!61532 (=> (not res!229724) (not e!196440))))

(assert (=> start!61532 (= res!229724 (= (size!6852 (buf!7320 bs1!11)) (size!6852 (buf!7320 bs2!19))))))

(assert (=> start!61532 e!196440))

(declare-fun e!196445 () Bool)

(declare-fun inv!12 (BitStream!12518) Bool)

(assert (=> start!61532 (and (inv!12 bs1!11) e!196445)))

(declare-fun e!196442 () Bool)

(assert (=> start!61532 (and (inv!12 bs2!19) e!196442)))

(declare-fun b!276500 () Bool)

(declare-fun array_inv!6576 (array!15824) Bool)

(assert (=> b!276500 (= e!196442 (array_inv!6576 (buf!7320 bs2!19)))))

(declare-fun b!276501 () Bool)

(assert (=> b!276501 (= e!196445 (array_inv!6576 (buf!7320 bs1!11)))))

(assert (= (and start!61532 res!229724) b!276499))

(assert (= (and b!276499 res!229725) b!276498))

(assert (= (and b!276498 res!229726) b!276497))

(assert (= start!61532 b!276501))

(assert (= start!61532 b!276500))

(declare-fun m!409527 () Bool)

(assert (=> b!276500 m!409527))

(declare-fun m!409529 () Bool)

(assert (=> b!276497 m!409529))

(declare-fun m!409531 () Bool)

(assert (=> b!276497 m!409531))

(declare-fun m!409533 () Bool)

(assert (=> b!276497 m!409533))

(declare-fun m!409535 () Bool)

(assert (=> start!61532 m!409535))

(declare-fun m!409537 () Bool)

(assert (=> start!61532 m!409537))

(declare-fun m!409539 () Bool)

(assert (=> b!276499 m!409539))

(declare-fun m!409541 () Bool)

(assert (=> b!276498 m!409541))

(declare-fun m!409543 () Bool)

(assert (=> b!276498 m!409543))

(declare-fun m!409545 () Bool)

(assert (=> b!276501 m!409545))

(push 1)

(assert (not b!276498))

(assert (not b!276501))

(assert (not start!61532))

(assert (not b!276500))

(assert (not b!276497))

(assert (not b!276499))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!95228 () Bool)

(assert (=> d!95228 (= (array_inv!6576 (buf!7320 bs2!19)) (bvsge (size!6852 (buf!7320 bs2!19)) #b00000000000000000000000000000000))))

(assert (=> b!276500 d!95228))

(declare-fun d!95230 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!95230 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6852 (buf!7320 bs1!11))) ((_ sign_extend 32) (currentByte!13540 bs1!11)) ((_ sign_extend 32) (currentBit!13535 bs1!11))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6852 (buf!7320 bs1!11))) ((_ sign_extend 32) (currentByte!13540 bs1!11)) ((_ sign_extend 32) (currentBit!13535 bs1!11))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!24017 () Bool)

(assert (= bs!24017 d!95230))

(declare-fun m!409557 () Bool)

(assert (=> bs!24017 m!409557))

(assert (=> b!276499 d!95230))

(declare-fun b!276537 () Bool)

(declare-fun e!196476 () Bool)

(declare-fun call!4451 () Bool)

(assert (=> b!276537 (= e!196476 call!4451)))

(declare-fun b!276538 () Bool)

(declare-fun e!196479 () Bool)

(assert (=> b!276538 (= e!196479 e!196476)))

(declare-fun c!12636 () Bool)

(declare-datatypes ((tuple4!530 0))(
  ( (tuple4!531 (_1!12320 (_ BitVec 32)) (_2!12320 (_ BitVec 32)) (_3!1045 (_ BitVec 32)) (_4!265 (_ BitVec 32))) )
))
(declare-fun lt!414663 () tuple4!530)

(assert (=> b!276538 (= c!12636 (= (_3!1045 lt!414663) (_4!265 lt!414663)))))

(declare-fun b!276539 () Bool)

(declare-fun res!229753 () Bool)

(declare-fun lt!414664 () (_ BitVec 32))

(assert (=> b!276539 (= res!229753 (= lt!414664 #b00000000000000000000000000000000))))

(declare-fun e!196478 () Bool)

(assert (=> b!276539 (=> res!229753 e!196478)))

(declare-fun e!196477 () Bool)

(assert (=> b!276539 (= e!196477 e!196478)))

(declare-fun b!276540 () Bool)

(assert (=> b!276540 (= e!196478 call!4451)))

(declare-fun d!95232 () Bool)

(declare-fun res!229754 () Bool)

(declare-fun e!196480 () Bool)

(assert (=> d!95232 (=> res!229754 e!196480)))

(assert (=> d!95232 (= res!229754 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!414640))))

(assert (=> d!95232 (= (arrayBitRangesEq!0 (buf!7320 bs1!11) (buf!7320 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 lt!414640) e!196480)))

(declare-fun bm!4448 () Bool)

(declare-fun lt!414662 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!4448 (= call!4451 (byteRangesEq!0 (ite c!12636 (select (arr!7845 (buf!7320 bs1!11)) (_3!1045 lt!414663)) (select (arr!7845 (buf!7320 bs1!11)) (_4!265 lt!414663))) (ite c!12636 (select (arr!7845 (buf!7320 bs2!19)) (_3!1045 lt!414663)) (select (arr!7845 (buf!7320 bs2!19)) (_4!265 lt!414663))) (ite c!12636 lt!414662 #b00000000000000000000000000000000) lt!414664))))

(declare-fun b!276541 () Bool)

(assert (=> b!276541 (= e!196480 e!196479)))

(declare-fun res!229756 () Bool)

(assert (=> b!276541 (=> (not res!229756) (not e!196479))))

(declare-fun e!196481 () Bool)

(assert (=> b!276541 (= res!229756 e!196481)))

(declare-fun res!229755 () Bool)

(assert (=> b!276541 (=> res!229755 e!196481)))

(assert (=> b!276541 (= res!229755 (bvsge (_1!12320 lt!414663) (_2!12320 lt!414663)))))

(assert (=> b!276541 (= lt!414664 ((_ extract 31 0) (bvsrem lt!414640 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!276541 (= lt!414662 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!530)

(assert (=> b!276541 (= lt!414663 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!414640))))

(declare-fun b!276542 () Bool)

(assert (=> b!276542 (= e!196476 e!196477)))

(declare-fun res!229752 () Bool)

(assert (=> b!276542 (= res!229752 (byteRangesEq!0 (select (arr!7845 (buf!7320 bs1!11)) (_3!1045 lt!414663)) (select (arr!7845 (buf!7320 bs2!19)) (_3!1045 lt!414663)) lt!414662 #b00000000000000000000000000001000))))

(assert (=> b!276542 (=> (not res!229752) (not e!196477))))

(declare-fun b!276543 () Bool)

(declare-fun arrayRangesEq!1158 (array!15824 array!15824 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!276543 (= e!196481 (arrayRangesEq!1158 (buf!7320 bs1!11) (buf!7320 bs2!19) (_1!12320 lt!414663) (_2!12320 lt!414663)))))

(assert (= (and d!95232 (not res!229754)) b!276541))

(assert (= (and b!276541 (not res!229755)) b!276543))

(assert (= (and b!276541 res!229756) b!276538))

(assert (= (and b!276538 c!12636) b!276537))

(assert (= (and b!276538 (not c!12636)) b!276542))

(assert (= (and b!276542 res!229752) b!276539))

(assert (= (and b!276539 (not res!229753)) b!276540))

(assert (= (or b!276537 b!276540) bm!4448))

(declare-fun m!409577 () Bool)

(assert (=> bm!4448 m!409577))

(declare-fun m!409579 () Bool)

(assert (=> bm!4448 m!409579))

(declare-fun m!409581 () Bool)

(assert (=> bm!4448 m!409581))

(declare-fun m!409583 () Bool)

(assert (=> bm!4448 m!409583))

(declare-fun m!409585 () Bool)

(assert (=> bm!4448 m!409585))

(declare-fun m!409587 () Bool)

(assert (=> b!276541 m!409587))

(assert (=> b!276542 m!409585))

(assert (=> b!276542 m!409577))

(assert (=> b!276542 m!409585))

(assert (=> b!276542 m!409577))

(declare-fun m!409589 () Bool)

(assert (=> b!276542 m!409589))

(declare-fun m!409591 () Bool)

(assert (=> b!276543 m!409591))

(assert (=> b!276498 d!95232))

(declare-fun d!95242 () Bool)

(declare-fun e!196499 () Bool)

(assert (=> d!95242 e!196499))

(declare-fun res!229777 () Bool)

(assert (=> d!95242 (=> (not res!229777) (not e!196499))))

(declare-fun lt!414702 () (_ BitVec 64))

(declare-fun lt!414703 () (_ BitVec 64))

(declare-fun lt!414704 () (_ BitVec 64))

(assert (=> d!95242 (= res!229777 (= lt!414703 (bvsub lt!414702 lt!414704)))))

(assert (=> d!95242 (or (= (bvand lt!414702 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!414704 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!414702 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!414702 lt!414704) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!95242 (= lt!414704 (remainingBits!0 ((_ sign_extend 32) (size!6852 (buf!7320 bs1!11))) ((_ sign_extend 32) (currentByte!13540 bs1!11)) ((_ sign_extend 32) (currentBit!13535 bs1!11))))))

(declare-fun lt!414705 () (_ BitVec 64))

(declare-fun lt!414707 () (_ BitVec 64))

(assert (=> d!95242 (= lt!414702 (bvmul lt!414705 lt!414707))))

(assert (=> d!95242 (or (= lt!414705 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!414707 (bvsdiv (bvmul lt!414705 lt!414707) lt!414705)))))

(assert (=> d!95242 (= lt!414707 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!95242 (= lt!414705 ((_ sign_extend 32) (size!6852 (buf!7320 bs1!11))))))

(assert (=> d!95242 (= lt!414703 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13540 bs1!11)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13535 bs1!11))))))

(assert (=> d!95242 (invariant!0 (currentBit!13535 bs1!11) (currentByte!13540 bs1!11) (size!6852 (buf!7320 bs1!11)))))

(assert (=> d!95242 (= (bitIndex!0 (size!6852 (buf!7320 bs1!11)) (currentByte!13540 bs1!11) (currentBit!13535 bs1!11)) lt!414703)))

(declare-fun b!276568 () Bool)

(declare-fun res!229778 () Bool)

(assert (=> b!276568 (=> (not res!229778) (not e!196499))))

(assert (=> b!276568 (= res!229778 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!414703))))

(declare-fun b!276569 () Bool)

(declare-fun lt!414701 () (_ BitVec 64))

(assert (=> b!276569 (= e!196499 (bvsle lt!414703 (bvmul lt!414701 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!276569 (or (= lt!414701 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!414701 #b0000000000000000000000000000000000000000000000000000000000001000) lt!414701)))))

(assert (=> b!276569 (= lt!414701 ((_ sign_extend 32) (size!6852 (buf!7320 bs1!11))))))

(assert (= (and d!95242 res!229777) b!276568))

(assert (= (and b!276568 res!229778) b!276569))

(assert (=> d!95242 m!409557))

(declare-fun m!409593 () Bool)

(assert (=> d!95242 m!409593))

(assert (=> b!276498 d!95242))

(declare-fun d!95244 () Bool)

(assert (=> d!95244 (= (inv!12 bs1!11) (invariant!0 (currentBit!13535 bs1!11) (currentByte!13540 bs1!11) (size!6852 (buf!7320 bs1!11))))))

(declare-fun bs!24019 () Bool)

(assert (= bs!24019 d!95244))

(assert (=> bs!24019 m!409593))

(assert (=> start!61532 d!95244))

(declare-fun d!95248 () Bool)

(assert (=> d!95248 (= (inv!12 bs2!19) (invariant!0 (currentBit!13535 bs2!19) (currentByte!13540 bs2!19) (size!6852 (buf!7320 bs2!19))))))

(declare-fun bs!24020 () Bool)

(assert (= bs!24020 d!95248))

(declare-fun m!409611 () Bool)

(assert (=> bs!24020 m!409611))

(assert (=> start!61532 d!95248))

(declare-fun d!95250 () Bool)

(declare-datatypes ((tuple2!22550 0))(
  ( (tuple2!22551 (_1!12322 Bool) (_2!12322 BitStream!12518)) )
))
(declare-fun lt!414712 () tuple2!22550)

(declare-fun readBit!0 (BitStream!12518) tuple2!22550)

(assert (=> d!95250 (= lt!414712 (readBit!0 (BitStream!12519 (buf!7320 bs2!19) (currentByte!13540 bs1!11) (currentBit!13535 bs1!11))))))

(assert (=> d!95250 (= (readBitPure!0 (BitStream!12519 (buf!7320 bs2!19) (currentByte!13540 bs1!11) (currentBit!13535 bs1!11))) (tuple2!22547 (_2!12322 lt!414712) (_1!12322 lt!414712)))))

(declare-fun bs!24021 () Bool)

(assert (= bs!24021 d!95250))

(declare-fun m!409613 () Bool)

(assert (=> bs!24021 m!409613))

(assert (=> b!276497 d!95250))

(declare-fun d!95252 () Bool)

(declare-fun lt!414713 () tuple2!22550)

(assert (=> d!95252 (= lt!414713 (readBit!0 bs1!11))))

(assert (=> d!95252 (= (readBitPure!0 bs1!11) (tuple2!22547 (_2!12322 lt!414713) (_1!12322 lt!414713)))))

(declare-fun bs!24022 () Bool)

(assert (= bs!24022 d!95252))

(declare-fun m!409615 () Bool)

(assert (=> bs!24022 m!409615))

(assert (=> b!276497 d!95252))

(declare-fun d!95254 () Bool)

(assert (=> d!95254 (= (invariant!0 (currentBit!13535 bs1!11) (currentByte!13540 bs1!11) (size!6852 (buf!7320 bs2!19))) (and (bvsge (currentBit!13535 bs1!11) #b00000000000000000000000000000000) (bvslt (currentBit!13535 bs1!11) #b00000000000000000000000000001000) (bvsge (currentByte!13540 bs1!11) #b00000000000000000000000000000000) (or (bvslt (currentByte!13540 bs1!11) (size!6852 (buf!7320 bs2!19))) (and (= (currentBit!13535 bs1!11) #b00000000000000000000000000000000) (= (currentByte!13540 bs1!11) (size!6852 (buf!7320 bs2!19)))))))))

(assert (=> b!276497 d!95254))

(declare-fun d!95256 () Bool)

(assert (=> d!95256 (= (array_inv!6576 (buf!7320 bs1!11)) (bvsge (size!6852 (buf!7320 bs1!11)) #b00000000000000000000000000000000))))

(assert (=> b!276501 d!95256))

(push 1)

(assert (not d!95250))

(assert (not d!95242))

(assert (not d!95244))

(assert (not d!95252))

(assert (not d!95230))

(assert (not d!95248))

(assert (not b!276542))

(assert (not bm!4448))

(assert (not b!276543))

(assert (not b!276541))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

