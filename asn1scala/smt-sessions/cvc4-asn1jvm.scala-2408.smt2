; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61206 () Bool)

(assert start!61206)

(declare-fun res!229160 () Bool)

(declare-fun e!195717 () Bool)

(assert (=> start!61206 (=> (not res!229160) (not e!195717))))

(declare-datatypes ((array!15767 0))(
  ( (array!15768 (arr!7818 (Array (_ BitVec 32) (_ BitVec 8))) (size!6831 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12476 0))(
  ( (BitStream!12477 (buf!7299 array!15767) (currentByte!13472 (_ BitVec 32)) (currentBit!13467 (_ BitVec 32))) )
))
(declare-fun bs1!11 () BitStream!12476)

(declare-fun bs2!19 () BitStream!12476)

(assert (=> start!61206 (= res!229160 (= (size!6831 (buf!7299 bs1!11)) (size!6831 (buf!7299 bs2!19))))))

(assert (=> start!61206 e!195717))

(declare-fun e!195713 () Bool)

(declare-fun inv!12 (BitStream!12476) Bool)

(assert (=> start!61206 (and (inv!12 bs1!11) e!195713)))

(declare-fun e!195714 () Bool)

(assert (=> start!61206 (and (inv!12 bs2!19) e!195714)))

(declare-fun b!275734 () Bool)

(declare-fun e!195716 () Bool)

(declare-datatypes ((tuple2!22482 0))(
  ( (tuple2!22483 (_1!12273 BitStream!12476) (_2!12273 Bool)) )
))
(declare-fun lt!413713 () tuple2!22482)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!275734 (= e!195716 (invariant!0 (currentBit!13467 (_1!12273 lt!413713)) (currentByte!13472 (_1!12273 lt!413713)) (size!6831 (buf!7299 (_1!12273 lt!413713)))))))

(declare-fun lt!413715 () (_ BitVec 64))

(declare-fun bitAt!0 (array!15767 (_ BitVec 64)) Bool)

(assert (=> b!275734 (= (bitAt!0 (buf!7299 bs1!11) lt!413715) (bitAt!0 (buf!7299 bs2!19) lt!413715))))

(declare-datatypes ((Unit!19359 0))(
  ( (Unit!19360) )
))
(declare-fun lt!413717 () Unit!19359)

(declare-fun lt!413716 () (_ BitVec 64))

(declare-fun arrayBitRangesEqImpliesEq!0 (array!15767 array!15767 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!19359)

(assert (=> b!275734 (= lt!413717 (arrayBitRangesEqImpliesEq!0 (buf!7299 bs1!11) (buf!7299 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 lt!413715 lt!413716))))

(declare-fun b!275735 () Bool)

(declare-fun res!229159 () Bool)

(assert (=> b!275735 (=> (not res!229159) (not e!195717))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!275735 (= res!229159 (validate_offset_bit!0 ((_ sign_extend 32) (size!6831 (buf!7299 bs1!11))) ((_ sign_extend 32) (currentByte!13472 bs1!11)) ((_ sign_extend 32) (currentBit!13467 bs1!11))))))

(declare-fun b!275736 () Bool)

(declare-fun e!195715 () Bool)

(assert (=> b!275736 (= e!195717 e!195715)))

(declare-fun res!229162 () Bool)

(assert (=> b!275736 (=> (not res!229162) (not e!195715))))

(declare-fun arrayBitRangesEq!0 (array!15767 array!15767 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!275736 (= res!229162 (arrayBitRangesEq!0 (buf!7299 bs1!11) (buf!7299 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 lt!413716))))

(assert (=> b!275736 (= lt!413716 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!413715))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!275736 (= lt!413715 (bitIndex!0 (size!6831 (buf!7299 bs1!11)) (currentByte!13472 bs1!11) (currentBit!13467 bs1!11)))))

(declare-fun b!275737 () Bool)

(declare-fun array_inv!6555 (array!15767) Bool)

(assert (=> b!275737 (= e!195714 (array_inv!6555 (buf!7299 bs2!19)))))

(declare-fun b!275738 () Bool)

(assert (=> b!275738 (= e!195715 (not e!195716))))

(declare-fun res!229161 () Bool)

(assert (=> b!275738 (=> res!229161 e!195716)))

(assert (=> b!275738 (= res!229161 (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 lt!413716) (bvsgt lt!413716 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6831 (buf!7299 bs1!11))))) (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 lt!413715) (bvsge lt!413715 lt!413716)))))

(declare-fun lt!413714 () tuple2!22482)

(declare-fun readBitPure!0 (BitStream!12476) tuple2!22482)

(assert (=> b!275738 (= lt!413714 (readBitPure!0 (BitStream!12477 (buf!7299 bs2!19) (currentByte!13472 bs1!11) (currentBit!13467 bs1!11))))))

(assert (=> b!275738 (= lt!413713 (readBitPure!0 bs1!11))))

(assert (=> b!275738 (invariant!0 (currentBit!13467 bs1!11) (currentByte!13472 bs1!11) (size!6831 (buf!7299 bs2!19)))))

(declare-fun b!275739 () Bool)

(assert (=> b!275739 (= e!195713 (array_inv!6555 (buf!7299 bs1!11)))))

(assert (= (and start!61206 res!229160) b!275735))

(assert (= (and b!275735 res!229159) b!275736))

(assert (= (and b!275736 res!229162) b!275738))

(assert (= (and b!275738 (not res!229161)) b!275734))

(assert (= start!61206 b!275739))

(assert (= start!61206 b!275737))

(declare-fun m!408471 () Bool)

(assert (=> b!275736 m!408471))

(declare-fun m!408473 () Bool)

(assert (=> b!275736 m!408473))

(declare-fun m!408475 () Bool)

(assert (=> start!61206 m!408475))

(declare-fun m!408477 () Bool)

(assert (=> start!61206 m!408477))

(declare-fun m!408479 () Bool)

(assert (=> b!275735 m!408479))

(declare-fun m!408481 () Bool)

(assert (=> b!275734 m!408481))

(declare-fun m!408483 () Bool)

(assert (=> b!275734 m!408483))

(declare-fun m!408485 () Bool)

(assert (=> b!275734 m!408485))

(declare-fun m!408487 () Bool)

(assert (=> b!275734 m!408487))

(declare-fun m!408489 () Bool)

(assert (=> b!275739 m!408489))

(declare-fun m!408491 () Bool)

(assert (=> b!275738 m!408491))

(declare-fun m!408493 () Bool)

(assert (=> b!275738 m!408493))

(declare-fun m!408495 () Bool)

(assert (=> b!275738 m!408495))

(declare-fun m!408497 () Bool)

(assert (=> b!275737 m!408497))

(push 1)

(assert (not b!275735))

(assert (not b!275736))

(assert (not b!275734))

(assert (not b!275737))

(assert (not start!61206))

(assert (not b!275739))

(assert (not b!275738))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!94732 () Bool)

(declare-datatypes ((tuple2!22486 0))(
  ( (tuple2!22487 (_1!12275 Bool) (_2!12275 BitStream!12476)) )
))
(declare-fun lt!413723 () tuple2!22486)

(declare-fun readBit!0 (BitStream!12476) tuple2!22486)

(assert (=> d!94732 (= lt!413723 (readBit!0 (BitStream!12477 (buf!7299 bs2!19) (currentByte!13472 bs1!11) (currentBit!13467 bs1!11))))))

(assert (=> d!94732 (= (readBitPure!0 (BitStream!12477 (buf!7299 bs2!19) (currentByte!13472 bs1!11) (currentBit!13467 bs1!11))) (tuple2!22483 (_2!12275 lt!413723) (_1!12275 lt!413723)))))

(declare-fun bs!23891 () Bool)

(assert (= bs!23891 d!94732))

(declare-fun m!408515 () Bool)

(assert (=> bs!23891 m!408515))

(assert (=> b!275738 d!94732))

(declare-fun d!94740 () Bool)

(declare-fun lt!413724 () tuple2!22486)

(assert (=> d!94740 (= lt!413724 (readBit!0 bs1!11))))

(assert (=> d!94740 (= (readBitPure!0 bs1!11) (tuple2!22483 (_2!12275 lt!413724) (_1!12275 lt!413724)))))

(declare-fun bs!23892 () Bool)

(assert (= bs!23892 d!94740))

(declare-fun m!408517 () Bool)

(assert (=> bs!23892 m!408517))

(assert (=> b!275738 d!94740))

(declare-fun d!94742 () Bool)

(assert (=> d!94742 (= (invariant!0 (currentBit!13467 bs1!11) (currentByte!13472 bs1!11) (size!6831 (buf!7299 bs2!19))) (and (bvsge (currentBit!13467 bs1!11) #b00000000000000000000000000000000) (bvslt (currentBit!13467 bs1!11) #b00000000000000000000000000001000) (bvsge (currentByte!13472 bs1!11) #b00000000000000000000000000000000) (or (bvslt (currentByte!13472 bs1!11) (size!6831 (buf!7299 bs2!19))) (and (= (currentBit!13467 bs1!11) #b00000000000000000000000000000000) (= (currentByte!13472 bs1!11) (size!6831 (buf!7299 bs2!19)))))))))

(assert (=> b!275738 d!94742))

(declare-fun d!94752 () Bool)

(assert (=> d!94752 (= (array_inv!6555 (buf!7299 bs1!11)) (bvsge (size!6831 (buf!7299 bs1!11)) #b00000000000000000000000000000000))))

(assert (=> b!275739 d!94752))

(declare-fun d!94754 () Bool)

(assert (=> d!94754 (= (array_inv!6555 (buf!7299 bs2!19)) (bvsge (size!6831 (buf!7299 bs2!19)) #b00000000000000000000000000000000))))

(assert (=> b!275737 d!94754))

(declare-fun d!94756 () Bool)

(assert (=> d!94756 (= (inv!12 bs1!11) (invariant!0 (currentBit!13467 bs1!11) (currentByte!13472 bs1!11) (size!6831 (buf!7299 bs1!11))))))

(declare-fun bs!23897 () Bool)

(assert (= bs!23897 d!94756))

(declare-fun m!408527 () Bool)

(assert (=> bs!23897 m!408527))

(assert (=> start!61206 d!94756))

(declare-fun d!94762 () Bool)

(assert (=> d!94762 (= (inv!12 bs2!19) (invariant!0 (currentBit!13467 bs2!19) (currentByte!13472 bs2!19) (size!6831 (buf!7299 bs2!19))))))

(declare-fun bs!23898 () Bool)

(assert (= bs!23898 d!94762))

(declare-fun m!408529 () Bool)

(assert (=> bs!23898 m!408529))

(assert (=> start!61206 d!94762))

(declare-fun b!275775 () Bool)

(declare-fun res!229191 () Bool)

(declare-fun lt!413752 () (_ BitVec 32))

(assert (=> b!275775 (= res!229191 (= lt!413752 #b00000000000000000000000000000000))))

(declare-fun e!195753 () Bool)

(assert (=> b!275775 (=> res!229191 e!195753)))

(declare-fun e!195752 () Bool)

(assert (=> b!275775 (= e!195752 e!195753)))

(declare-fun b!275776 () Bool)

(declare-fun e!195749 () Bool)

(assert (=> b!275776 (= e!195749 e!195752)))

(declare-fun res!229188 () Bool)

(declare-fun call!4415 () Bool)

(assert (=> b!275776 (= res!229188 call!4415)))

(assert (=> b!275776 (=> (not res!229188) (not e!195752))))

(declare-fun b!275777 () Bool)

(declare-datatypes ((tuple4!506 0))(
  ( (tuple4!507 (_1!12277 (_ BitVec 32)) (_2!12277 (_ BitVec 32)) (_3!1033 (_ BitVec 32)) (_4!253 (_ BitVec 32))) )
))
(declare-fun lt!413753 () tuple4!506)

(declare-fun e!195754 () Bool)

(declare-fun arrayRangesEq!1146 (array!15767 array!15767 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!275777 (= e!195754 (arrayRangesEq!1146 (buf!7299 bs1!11) (buf!7299 bs2!19) (_1!12277 lt!413753) (_2!12277 lt!413753)))))

(declare-fun c!12600 () Bool)

(declare-fun lt!413751 () (_ BitVec 32))

(declare-fun bm!4412 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!4412 (= call!4415 (byteRangesEq!0 (select (arr!7818 (buf!7299 bs1!11)) (_3!1033 lt!413753)) (select (arr!7818 (buf!7299 bs2!19)) (_3!1033 lt!413753)) lt!413751 (ite c!12600 lt!413752 #b00000000000000000000000000001000)))))

(declare-fun d!94764 () Bool)

(declare-fun res!229190 () Bool)

(declare-fun e!195750 () Bool)

(assert (=> d!94764 (=> res!229190 e!195750)))

(assert (=> d!94764 (= res!229190 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!413716))))

(assert (=> d!94764 (= (arrayBitRangesEq!0 (buf!7299 bs1!11) (buf!7299 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 lt!413716) e!195750)))

(declare-fun b!275778 () Bool)

(assert (=> b!275778 (= e!195753 (byteRangesEq!0 (select (arr!7818 (buf!7299 bs1!11)) (_4!253 lt!413753)) (select (arr!7818 (buf!7299 bs2!19)) (_4!253 lt!413753)) #b00000000000000000000000000000000 lt!413752))))

(declare-fun b!275779 () Bool)

(declare-fun e!195751 () Bool)

(assert (=> b!275779 (= e!195751 e!195749)))

(assert (=> b!275779 (= c!12600 (= (_3!1033 lt!413753) (_4!253 lt!413753)))))

(declare-fun b!275780 () Bool)

(assert (=> b!275780 (= e!195749 call!4415)))

(declare-fun b!275781 () Bool)

(assert (=> b!275781 (= e!195750 e!195751)))

(declare-fun res!229189 () Bool)

(assert (=> b!275781 (=> (not res!229189) (not e!195751))))

(assert (=> b!275781 (= res!229189 e!195754)))

(declare-fun res!229192 () Bool)

(assert (=> b!275781 (=> res!229192 e!195754)))

(assert (=> b!275781 (= res!229192 (bvsge (_1!12277 lt!413753) (_2!12277 lt!413753)))))

(assert (=> b!275781 (= lt!413752 ((_ extract 31 0) (bvsrem lt!413716 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!275781 (= lt!413751 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!506)

(assert (=> b!275781 (= lt!413753 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!413716))))

(assert (= (and d!94764 (not res!229190)) b!275781))

(assert (= (and b!275781 (not res!229192)) b!275777))

(assert (= (and b!275781 res!229189) b!275779))

(assert (= (and b!275779 c!12600) b!275780))

(assert (= (and b!275779 (not c!12600)) b!275776))

(assert (= (and b!275776 res!229188) b!275775))

(assert (= (and b!275775 (not res!229191)) b!275778))

(assert (= (or b!275780 b!275776) bm!4412))

(declare-fun m!408545 () Bool)

(assert (=> b!275777 m!408545))

(declare-fun m!408549 () Bool)

(assert (=> bm!4412 m!408549))

(declare-fun m!408551 () Bool)

(assert (=> bm!4412 m!408551))

(assert (=> bm!4412 m!408549))

(assert (=> bm!4412 m!408551))

(declare-fun m!408559 () Bool)

(assert (=> bm!4412 m!408559))

(declare-fun m!408563 () Bool)

(assert (=> b!275778 m!408563))

(declare-fun m!408567 () Bool)

(assert (=> b!275778 m!408567))

(assert (=> b!275778 m!408563))

(assert (=> b!275778 m!408567))

(declare-fun m!408571 () Bool)

(assert (=> b!275778 m!408571))

(declare-fun m!408573 () Bool)

(assert (=> b!275781 m!408573))

(assert (=> b!275736 d!94764))

(declare-fun d!94786 () Bool)

(declare-fun e!195778 () Bool)

(assert (=> d!94786 e!195778))

(declare-fun res!229218 () Bool)

(assert (=> d!94786 (=> (not res!229218) (not e!195778))))

(declare-fun lt!413795 () (_ BitVec 64))

(declare-fun lt!413798 () (_ BitVec 64))

(declare-fun lt!413796 () (_ BitVec 64))

(assert (=> d!94786 (= res!229218 (= lt!413798 (bvsub lt!413796 lt!413795)))))

(assert (=> d!94786 (or (= (bvand lt!413796 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!413795 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!413796 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!413796 lt!413795) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!94786 (= lt!413795 (remainingBits!0 ((_ sign_extend 32) (size!6831 (buf!7299 bs1!11))) ((_ sign_extend 32) (currentByte!13472 bs1!11)) ((_ sign_extend 32) (currentBit!13467 bs1!11))))))

(declare-fun lt!413794 () (_ BitVec 64))

(declare-fun lt!413793 () (_ BitVec 64))

(assert (=> d!94786 (= lt!413796 (bvmul lt!413794 lt!413793))))

(assert (=> d!94786 (or (= lt!413794 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!413793 (bvsdiv (bvmul lt!413794 lt!413793) lt!413794)))))

(assert (=> d!94786 (= lt!413793 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!94786 (= lt!413794 ((_ sign_extend 32) (size!6831 (buf!7299 bs1!11))))))

(assert (=> d!94786 (= lt!413798 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13472 bs1!11)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13467 bs1!11))))))

(assert (=> d!94786 (invariant!0 (currentBit!13467 bs1!11) (currentByte!13472 bs1!11) (size!6831 (buf!7299 bs1!11)))))

(assert (=> d!94786 (= (bitIndex!0 (size!6831 (buf!7299 bs1!11)) (currentByte!13472 bs1!11) (currentBit!13467 bs1!11)) lt!413798)))

(declare-fun b!275813 () Bool)

(declare-fun res!229219 () Bool)

(assert (=> b!275813 (=> (not res!229219) (not e!195778))))

(assert (=> b!275813 (= res!229219 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!413798))))

(declare-fun b!275814 () Bool)

(declare-fun lt!413797 () (_ BitVec 64))

(assert (=> b!275814 (= e!195778 (bvsle lt!413798 (bvmul lt!413797 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!275814 (or (= lt!413797 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!413797 #b0000000000000000000000000000000000000000000000000000000000001000) lt!413797)))))

(assert (=> b!275814 (= lt!413797 ((_ sign_extend 32) (size!6831 (buf!7299 bs1!11))))))

(assert (= (and d!94786 res!229218) b!275813))

(assert (= (and b!275813 res!229219) b!275814))

(declare-fun m!408583 () Bool)

(assert (=> d!94786 m!408583))

(assert (=> d!94786 m!408527))

(assert (=> b!275736 d!94786))

(declare-fun d!94788 () Bool)

(assert (=> d!94788 (= (invariant!0 (currentBit!13467 (_1!12273 lt!413713)) (currentByte!13472 (_1!12273 lt!413713)) (size!6831 (buf!7299 (_1!12273 lt!413713)))) (and (bvsge (currentBit!13467 (_1!12273 lt!413713)) #b00000000000000000000000000000000) (bvslt (currentBit!13467 (_1!12273 lt!413713)) #b00000000000000000000000000001000) (bvsge (currentByte!13472 (_1!12273 lt!413713)) #b00000000000000000000000000000000) (or (bvslt (currentByte!13472 (_1!12273 lt!413713)) (size!6831 (buf!7299 (_1!12273 lt!413713)))) (and (= (currentBit!13467 (_1!12273 lt!413713)) #b00000000000000000000000000000000) (= (currentByte!13472 (_1!12273 lt!413713)) (size!6831 (buf!7299 (_1!12273 lt!413713))))))))))

(assert (=> b!275734 d!94788))

(declare-fun d!94790 () Bool)

(assert (=> d!94790 (= (bitAt!0 (buf!7299 bs1!11) lt!413715) (not (= (bvand ((_ sign_extend 24) (select (arr!7818 (buf!7299 bs1!11)) ((_ extract 31 0) (bvsdiv lt!413715 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!413715 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!23905 () Bool)

(assert (= bs!23905 d!94790))

(declare-fun m!408593 () Bool)

(assert (=> bs!23905 m!408593))

(declare-fun m!408595 () Bool)

(assert (=> bs!23905 m!408595))

(assert (=> b!275734 d!94790))

(declare-fun d!94794 () Bool)

(assert (=> d!94794 (= (bitAt!0 (buf!7299 bs2!19) lt!413715) (not (= (bvand ((_ sign_extend 24) (select (arr!7818 (buf!7299 bs2!19)) ((_ extract 31 0) (bvsdiv lt!413715 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!413715 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!23906 () Bool)

(assert (= bs!23906 d!94794))

(declare-fun m!408597 () Bool)

(assert (=> bs!23906 m!408597))

(assert (=> bs!23906 m!408595))

(assert (=> b!275734 d!94794))

(declare-fun d!94796 () Bool)

(assert (=> d!94796 (= (bitAt!0 (buf!7299 bs1!11) lt!413715) (bitAt!0 (buf!7299 bs2!19) lt!413715))))

(declare-fun lt!413801 () Unit!19359)

(declare-fun choose!31 (array!15767 array!15767 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!19359)

(assert (=> d!94796 (= lt!413801 (choose!31 (buf!7299 bs1!11) (buf!7299 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 lt!413715 lt!413716))))

(assert (=> d!94796 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!413716))))

(assert (=> d!94796 (= (arrayBitRangesEqImpliesEq!0 (buf!7299 bs1!11) (buf!7299 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 lt!413715 lt!413716) lt!413801)))

(declare-fun bs!23907 () Bool)

(assert (= bs!23907 d!94796))

(assert (=> bs!23907 m!408483))

(assert (=> bs!23907 m!408485))

(declare-fun m!408599 () Bool)

(assert (=> bs!23907 m!408599))

(assert (=> b!275734 d!94796))

(declare-fun d!94798 () Bool)

(assert (=> d!94798 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6831 (buf!7299 bs1!11))) ((_ sign_extend 32) (currentByte!13472 bs1!11)) ((_ sign_extend 32) (currentBit!13467 bs1!11))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6831 (buf!7299 bs1!11))) ((_ sign_extend 32) (currentByte!13472 bs1!11)) ((_ sign_extend 32) (currentBit!13467 bs1!11))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!23908 () Bool)

(assert (= bs!23908 d!94798))

(assert (=> bs!23908 m!408583))

(assert (=> b!275735 d!94798))

(push 1)

(assert (not d!94732))

(assert (not b!275777))

(assert (not d!94786))

(assert (not d!94740))

(assert (not d!94762))

(assert (not b!275781))

(assert (not bm!4412))

(assert (not b!275778))

(assert (not d!94796))

(assert (not d!94756))

(assert (not d!94798))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!94834 () Bool)

(assert (=> d!94834 (= (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!413716) (tuple4!507 ((_ extract 31 0) (bvadd (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv lt!413716 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv lt!413716 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!275781 d!94834))

(declare-fun d!94836 () Bool)

(assert (=> d!94836 (= (invariant!0 (currentBit!13467 bs1!11) (currentByte!13472 bs1!11) (size!6831 (buf!7299 bs1!11))) (and (bvsge (currentBit!13467 bs1!11) #b00000000000000000000000000000000) (bvslt (currentBit!13467 bs1!11) #b00000000000000000000000000001000) (bvsge (currentByte!13472 bs1!11) #b00000000000000000000000000000000) (or (bvslt (currentByte!13472 bs1!11) (size!6831 (buf!7299 bs1!11))) (and (= (currentBit!13467 bs1!11) #b00000000000000000000000000000000) (= (currentByte!13472 bs1!11) (size!6831 (buf!7299 bs1!11)))))))))

(assert (=> d!94756 d!94836))

(declare-fun d!94838 () Bool)

(assert (=> d!94838 (= (invariant!0 (currentBit!13467 bs2!19) (currentByte!13472 bs2!19) (size!6831 (buf!7299 bs2!19))) (and (bvsge (currentBit!13467 bs2!19) #b00000000000000000000000000000000) (bvslt (currentBit!13467 bs2!19) #b00000000000000000000000000001000) (bvsge (currentByte!13472 bs2!19) #b00000000000000000000000000000000) (or (bvslt (currentByte!13472 bs2!19) (size!6831 (buf!7299 bs2!19))) (and (= (currentBit!13467 bs2!19) #b00000000000000000000000000000000) (= (currentByte!13472 bs2!19) (size!6831 (buf!7299 bs2!19)))))))))

(assert (=> d!94762 d!94838))

(declare-fun d!94840 () Bool)

(assert (=> d!94840 (= (remainingBits!0 ((_ sign_extend 32) (size!6831 (buf!7299 bs1!11))) ((_ sign_extend 32) (currentByte!13472 bs1!11)) ((_ sign_extend 32) (currentBit!13467 bs1!11))) (bvsub (bvmul ((_ sign_extend 32) (size!6831 (buf!7299 bs1!11))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!13472 bs1!11)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13467 bs1!11)))))))

(assert (=> d!94798 d!94840))

(declare-fun d!94842 () Bool)

(declare-fun res!229256 () Bool)

(declare-fun e!195809 () Bool)

(assert (=> d!94842 (=> res!229256 e!195809)))

(assert (=> d!94842 (= res!229256 (= (_1!12277 lt!413753) (_2!12277 lt!413753)))))

(assert (=> d!94842 (= (arrayRangesEq!1146 (buf!7299 bs1!11) (buf!7299 bs2!19) (_1!12277 lt!413753) (_2!12277 lt!413753)) e!195809)))

(declare-fun b!275851 () Bool)

(declare-fun e!195810 () Bool)

(assert (=> b!275851 (= e!195809 e!195810)))

(declare-fun res!229257 () Bool)

(assert (=> b!275851 (=> (not res!229257) (not e!195810))))

(assert (=> b!275851 (= res!229257 (= (select (arr!7818 (buf!7299 bs1!11)) (_1!12277 lt!413753)) (select (arr!7818 (buf!7299 bs2!19)) (_1!12277 lt!413753))))))

(declare-fun b!275852 () Bool)

(assert (=> b!275852 (= e!195810 (arrayRangesEq!1146 (buf!7299 bs1!11) (buf!7299 bs2!19) (bvadd (_1!12277 lt!413753) #b00000000000000000000000000000001) (_2!12277 lt!413753)))))

(assert (= (and d!94842 (not res!229256)) b!275851))

(assert (= (and b!275851 res!229257) b!275852))

(declare-fun m!408661 () Bool)

(assert (=> b!275851 m!408661))

(declare-fun m!408663 () Bool)

(assert (=> b!275851 m!408663))

(declare-fun m!408665 () Bool)

(assert (=> b!275852 m!408665))

(assert (=> b!275777 d!94842))

(assert (=> d!94786 d!94840))

(assert (=> d!94786 d!94836))

(declare-fun d!94844 () Bool)

(declare-fun e!195817 () Bool)

(assert (=> d!94844 e!195817))

(declare-fun res!229260 () Bool)

(assert (=> d!94844 (=> (not res!229260) (not e!195817))))

(declare-datatypes ((tuple2!22492 0))(
  ( (tuple2!22493 (_1!12281 Unit!19359) (_2!12281 BitStream!12476)) )
))
(declare-fun increaseBitIndex!0 (BitStream!12476) tuple2!22492)

(assert (=> d!94844 (= res!229260 (= (buf!7299 (_2!12281 (increaseBitIndex!0 (BitStream!12477 (buf!7299 bs2!19) (currentByte!13472 bs1!11) (currentBit!13467 bs1!11))))) (buf!7299 (BitStream!12477 (buf!7299 bs2!19) (currentByte!13472 bs1!11) (currentBit!13467 bs1!11)))))))

(declare-fun lt!413900 () Bool)

(assert (=> d!94844 (= lt!413900 (not (= (bvand ((_ sign_extend 24) (select (arr!7818 (buf!7299 (BitStream!12477 (buf!7299 bs2!19) (currentByte!13472 bs1!11) (currentBit!13467 bs1!11)))) (currentByte!13472 (BitStream!12477 (buf!7299 bs2!19) (currentByte!13472 bs1!11) (currentBit!13467 bs1!11))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13467 (BitStream!12477 (buf!7299 bs2!19) (currentByte!13472 bs1!11) (currentBit!13467 bs1!11)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!413906 () tuple2!22486)

(assert (=> d!94844 (= lt!413906 (tuple2!22487 (not (= (bvand ((_ sign_extend 24) (select (arr!7818 (buf!7299 (BitStream!12477 (buf!7299 bs2!19) (currentByte!13472 bs1!11) (currentBit!13467 bs1!11)))) (currentByte!13472 (BitStream!12477 (buf!7299 bs2!19) (currentByte!13472 bs1!11) (currentBit!13467 bs1!11))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13467 (BitStream!12477 (buf!7299 bs2!19) (currentByte!13472 bs1!11) (currentBit!13467 bs1!11)))))) #b00000000000000000000000000000000)) (_2!12281 (increaseBitIndex!0 (BitStream!12477 (buf!7299 bs2!19) (currentByte!13472 bs1!11) (currentBit!13467 bs1!11))))))))

(assert (=> d!94844 (validate_offset_bit!0 ((_ sign_extend 32) (size!6831 (buf!7299 (BitStream!12477 (buf!7299 bs2!19) (currentByte!13472 bs1!11) (currentBit!13467 bs1!11))))) ((_ sign_extend 32) (currentByte!13472 (BitStream!12477 (buf!7299 bs2!19) (currentByte!13472 bs1!11) (currentBit!13467 bs1!11)))) ((_ sign_extend 32) (currentBit!13467 (BitStream!12477 (buf!7299 bs2!19) (currentByte!13472 bs1!11) (currentBit!13467 bs1!11)))))))

(assert (=> d!94844 (= (readBit!0 (BitStream!12477 (buf!7299 bs2!19) (currentByte!13472 bs1!11) (currentBit!13467 bs1!11))) lt!413906)))

(declare-fun b!275855 () Bool)

(declare-fun lt!413904 () (_ BitVec 64))

(declare-fun lt!413903 () (_ BitVec 64))

(assert (=> b!275855 (= e!195817 (= (bitIndex!0 (size!6831 (buf!7299 (_2!12281 (increaseBitIndex!0 (BitStream!12477 (buf!7299 bs2!19) (currentByte!13472 bs1!11) (currentBit!13467 bs1!11)))))) (currentByte!13472 (_2!12281 (increaseBitIndex!0 (BitStream!12477 (buf!7299 bs2!19) (currentByte!13472 bs1!11) (currentBit!13467 bs1!11))))) (currentBit!13467 (_2!12281 (increaseBitIndex!0 (BitStream!12477 (buf!7299 bs2!19) (currentByte!13472 bs1!11) (currentBit!13467 bs1!11)))))) (bvadd lt!413903 lt!413904)))))

(assert (=> b!275855 (or (not (= (bvand lt!413903 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!413904 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!413903 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!413903 lt!413904) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!275855 (= lt!413904 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!275855 (= lt!413903 (bitIndex!0 (size!6831 (buf!7299 (BitStream!12477 (buf!7299 bs2!19) (currentByte!13472 bs1!11) (currentBit!13467 bs1!11)))) (currentByte!13472 (BitStream!12477 (buf!7299 bs2!19) (currentByte!13472 bs1!11) (currentBit!13467 bs1!11))) (currentBit!13467 (BitStream!12477 (buf!7299 bs2!19) (currentByte!13472 bs1!11) (currentBit!13467 bs1!11)))))))

(declare-fun lt!413901 () Bool)

(assert (=> b!275855 (= lt!413901 (not (= (bvand ((_ sign_extend 24) (select (arr!7818 (buf!7299 (BitStream!12477 (buf!7299 bs2!19) (currentByte!13472 bs1!11) (currentBit!13467 bs1!11)))) (currentByte!13472 (BitStream!12477 (buf!7299 bs2!19) (currentByte!13472 bs1!11) (currentBit!13467 bs1!11))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13467 (BitStream!12477 (buf!7299 bs2!19) (currentByte!13472 bs1!11) (currentBit!13467 bs1!11)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!413902 () Bool)

(assert (=> b!275855 (= lt!413902 (not (= (bvand ((_ sign_extend 24) (select (arr!7818 (buf!7299 (BitStream!12477 (buf!7299 bs2!19) (currentByte!13472 bs1!11) (currentBit!13467 bs1!11)))) (currentByte!13472 (BitStream!12477 (buf!7299 bs2!19) (currentByte!13472 bs1!11) (currentBit!13467 bs1!11))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13467 (BitStream!12477 (buf!7299 bs2!19) (currentByte!13472 bs1!11) (currentBit!13467 bs1!11)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!413905 () Bool)

(assert (=> b!275855 (= lt!413905 (not (= (bvand ((_ sign_extend 24) (select (arr!7818 (buf!7299 (BitStream!12477 (buf!7299 bs2!19) (currentByte!13472 bs1!11) (currentBit!13467 bs1!11)))) (currentByte!13472 (BitStream!12477 (buf!7299 bs2!19) (currentByte!13472 bs1!11) (currentBit!13467 bs1!11))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13467 (BitStream!12477 (buf!7299 bs2!19) (currentByte!13472 bs1!11) (currentBit!13467 bs1!11)))))) #b00000000000000000000000000000000)))))

(assert (= (and d!94844 res!229260) b!275855))

(declare-fun m!408667 () Bool)

(assert (=> d!94844 m!408667))

(declare-fun m!408669 () Bool)

(assert (=> d!94844 m!408669))

(declare-fun m!408671 () Bool)

(assert (=> d!94844 m!408671))

(declare-fun m!408673 () Bool)

(assert (=> d!94844 m!408673))

(declare-fun m!408675 () Bool)

(assert (=> b!275855 m!408675))

(assert (=> b!275855 m!408669))

(declare-fun m!408677 () Bool)

(assert (=> b!275855 m!408677))

(assert (=> b!275855 m!408671))

(assert (=> b!275855 m!408667))

(assert (=> d!94732 d!94844))

(declare-fun d!94846 () Bool)

(assert (=> d!94846 (= (byteRangesEq!0 (select (arr!7818 (buf!7299 bs1!11)) (_4!253 lt!413753)) (select (arr!7818 (buf!7299 bs2!19)) (_4!253 lt!413753)) #b00000000000000000000000000000000 lt!413752) (or (= #b00000000000000000000000000000000 lt!413752) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7818 (buf!7299 bs1!11)) (_4!253 lt!413753))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!413752))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7818 (buf!7299 bs2!19)) (_4!253 lt!413753))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!413752))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!23913 () Bool)

(assert (= bs!23913 d!94846))

(declare-fun m!408679 () Bool)

(assert (=> bs!23913 m!408679))

(declare-fun m!408681 () Bool)

(assert (=> bs!23913 m!408681))

(assert (=> b!275778 d!94846))

(declare-fun d!94848 () Bool)

(assert (=> d!94848 (= (byteRangesEq!0 (select (arr!7818 (buf!7299 bs1!11)) (_3!1033 lt!413753)) (select (arr!7818 (buf!7299 bs2!19)) (_3!1033 lt!413753)) lt!413751 (ite c!12600 lt!413752 #b00000000000000000000000000001000)) (or (= lt!413751 (ite c!12600 lt!413752 #b00000000000000000000000000001000)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7818 (buf!7299 bs1!11)) (_3!1033 lt!413753))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!12600 lt!413752 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!413751)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7818 (buf!7299 bs2!19)) (_3!1033 lt!413753))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!12600 lt!413752 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!413751)))) #b00000000000000000000000011111111))))))

(declare-fun bs!23914 () Bool)

(assert (= bs!23914 d!94848))

(declare-fun m!408683 () Bool)

(assert (=> bs!23914 m!408683))

(declare-fun m!408685 () Bool)

(assert (=> bs!23914 m!408685))

(assert (=> bm!4412 d!94848))

(declare-fun d!94850 () Bool)

(declare-fun e!195818 () Bool)

(assert (=> d!94850 e!195818))

(declare-fun res!229261 () Bool)

(assert (=> d!94850 (=> (not res!229261) (not e!195818))))

(assert (=> d!94850 (= res!229261 (= (buf!7299 (_2!12281 (increaseBitIndex!0 bs1!11))) (buf!7299 bs1!11)))))

(declare-fun lt!413907 () Bool)

(assert (=> d!94850 (= lt!413907 (not (= (bvand ((_ sign_extend 24) (select (arr!7818 (buf!7299 bs1!11)) (currentByte!13472 bs1!11))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13467 bs1!11)))) #b00000000000000000000000000000000)))))

(declare-fun lt!413913 () tuple2!22486)

(assert (=> d!94850 (= lt!413913 (tuple2!22487 (not (= (bvand ((_ sign_extend 24) (select (arr!7818 (buf!7299 bs1!11)) (currentByte!13472 bs1!11))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13467 bs1!11)))) #b00000000000000000000000000000000)) (_2!12281 (increaseBitIndex!0 bs1!11))))))

(assert (=> d!94850 (validate_offset_bit!0 ((_ sign_extend 32) (size!6831 (buf!7299 bs1!11))) ((_ sign_extend 32) (currentByte!13472 bs1!11)) ((_ sign_extend 32) (currentBit!13467 bs1!11)))))

(assert (=> d!94850 (= (readBit!0 bs1!11) lt!413913)))

(declare-fun b!275856 () Bool)

(declare-fun lt!413911 () (_ BitVec 64))

(declare-fun lt!413910 () (_ BitVec 64))

(assert (=> b!275856 (= e!195818 (= (bitIndex!0 (size!6831 (buf!7299 (_2!12281 (increaseBitIndex!0 bs1!11)))) (currentByte!13472 (_2!12281 (increaseBitIndex!0 bs1!11))) (currentBit!13467 (_2!12281 (increaseBitIndex!0 bs1!11)))) (bvadd lt!413910 lt!413911)))))

(assert (=> b!275856 (or (not (= (bvand lt!413910 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!413911 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!413910 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!413910 lt!413911) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!275856 (= lt!413911 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!275856 (= lt!413910 (bitIndex!0 (size!6831 (buf!7299 bs1!11)) (currentByte!13472 bs1!11) (currentBit!13467 bs1!11)))))

(declare-fun lt!413908 () Bool)

(assert (=> b!275856 (= lt!413908 (not (= (bvand ((_ sign_extend 24) (select (arr!7818 (buf!7299 bs1!11)) (currentByte!13472 bs1!11))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13467 bs1!11)))) #b00000000000000000000000000000000)))))

(declare-fun lt!413909 () Bool)

(assert (=> b!275856 (= lt!413909 (not (= (bvand ((_ sign_extend 24) (select (arr!7818 (buf!7299 bs1!11)) (currentByte!13472 bs1!11))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13467 bs1!11)))) #b00000000000000000000000000000000)))))

(declare-fun lt!413912 () Bool)

(assert (=> b!275856 (= lt!413912 (not (= (bvand ((_ sign_extend 24) (select (arr!7818 (buf!7299 bs1!11)) (currentByte!13472 bs1!11))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13467 bs1!11)))) #b00000000000000000000000000000000)))))

(assert (= (and d!94850 res!229261) b!275856))

(declare-fun m!408687 () Bool)

(assert (=> d!94850 m!408687))

(declare-fun m!408689 () Bool)

(assert (=> d!94850 m!408689))

(declare-fun m!408691 () Bool)

(assert (=> d!94850 m!408691))

(assert (=> d!94850 m!408479))

(assert (=> b!275856 m!408473))

(assert (=> b!275856 m!408689))

(declare-fun m!408693 () Bool)

(assert (=> b!275856 m!408693))

(assert (=> b!275856 m!408691))

(assert (=> b!275856 m!408687))

(assert (=> d!94740 d!94850))

(assert (=> d!94796 d!94790))

(assert (=> d!94796 d!94794))

(declare-fun d!94852 () Bool)

(assert (=> d!94852 (= (bitAt!0 (buf!7299 bs1!11) lt!413715) (bitAt!0 (buf!7299 bs2!19) lt!413715))))

(assert (=> d!94852 true))

(declare-fun _$31!35 () Unit!19359)

(assert (=> d!94852 (= (choose!31 (buf!7299 bs1!11) (buf!7299 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 lt!413715 lt!413716) _$31!35)))

(declare-fun bs!23915 () Bool)

(assert (= bs!23915 d!94852))

(assert (=> bs!23915 m!408483))

(assert (=> bs!23915 m!408485))

(assert (=> d!94796 d!94852))

(push 1)

(assert (not d!94850))

(assert (not d!94852))

(assert (not b!275856))

(assert (not b!275855))

(assert (not b!275852))

(assert (not d!94844))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!94854 () Bool)

(declare-fun e!195819 () Bool)

(assert (=> d!94854 e!195819))

(declare-fun res!229262 () Bool)

(assert (=> d!94854 (=> (not res!229262) (not e!195819))))

(declare-fun lt!413919 () (_ BitVec 64))

(declare-fun lt!413917 () (_ BitVec 64))

(declare-fun lt!413916 () (_ BitVec 64))

(assert (=> d!94854 (= res!229262 (= lt!413919 (bvsub lt!413917 lt!413916)))))

(assert (=> d!94854 (or (= (bvand lt!413917 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!413916 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!413917 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!413917 lt!413916) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!94854 (= lt!413916 (remainingBits!0 ((_ sign_extend 32) (size!6831 (buf!7299 (_2!12281 (increaseBitIndex!0 bs1!11))))) ((_ sign_extend 32) (currentByte!13472 (_2!12281 (increaseBitIndex!0 bs1!11)))) ((_ sign_extend 32) (currentBit!13467 (_2!12281 (increaseBitIndex!0 bs1!11))))))))

(declare-fun lt!413915 () (_ BitVec 64))

(declare-fun lt!413914 () (_ BitVec 64))

(assert (=> d!94854 (= lt!413917 (bvmul lt!413915 lt!413914))))

(assert (=> d!94854 (or (= lt!413915 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!413914 (bvsdiv (bvmul lt!413915 lt!413914) lt!413915)))))

(assert (=> d!94854 (= lt!413914 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!94854 (= lt!413915 ((_ sign_extend 32) (size!6831 (buf!7299 (_2!12281 (increaseBitIndex!0 bs1!11))))))))

(assert (=> d!94854 (= lt!413919 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13472 (_2!12281 (increaseBitIndex!0 bs1!11)))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13467 (_2!12281 (increaseBitIndex!0 bs1!11))))))))

(assert (=> d!94854 (invariant!0 (currentBit!13467 (_2!12281 (increaseBitIndex!0 bs1!11))) (currentByte!13472 (_2!12281 (increaseBitIndex!0 bs1!11))) (size!6831 (buf!7299 (_2!12281 (increaseBitIndex!0 bs1!11)))))))

(assert (=> d!94854 (= (bitIndex!0 (size!6831 (buf!7299 (_2!12281 (increaseBitIndex!0 bs1!11)))) (currentByte!13472 (_2!12281 (increaseBitIndex!0 bs1!11))) (currentBit!13467 (_2!12281 (increaseBitIndex!0 bs1!11)))) lt!413919)))

(declare-fun b!275857 () Bool)

(declare-fun res!229263 () Bool)

(assert (=> b!275857 (=> (not res!229263) (not e!195819))))

(assert (=> b!275857 (= res!229263 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!413919))))

(declare-fun b!275858 () Bool)

(declare-fun lt!413918 () (_ BitVec 64))

(assert (=> b!275858 (= e!195819 (bvsle lt!413919 (bvmul lt!413918 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!275858 (or (= lt!413918 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!413918 #b0000000000000000000000000000000000000000000000000000000000001000) lt!413918)))))

(assert (=> b!275858 (= lt!413918 ((_ sign_extend 32) (size!6831 (buf!7299 (_2!12281 (increaseBitIndex!0 bs1!11))))))))

(assert (= (and d!94854 res!229262) b!275857))

(assert (= (and b!275857 res!229263) b!275858))

(declare-fun m!408695 () Bool)

(assert (=> d!94854 m!408695))

(declare-fun m!408697 () Bool)

(assert (=> d!94854 m!408697))

(assert (=> b!275856 d!94854))

(declare-fun d!94856 () Bool)

(declare-fun e!195822 () Bool)

(assert (=> d!94856 e!195822))

(declare-fun res!229268 () Bool)

(assert (=> d!94856 (=> (not res!229268) (not e!195822))))

(declare-fun lt!413931 () tuple2!22492)

(declare-fun lt!413930 () (_ BitVec 64))

(declare-fun lt!413932 () (_ BitVec 64))

(assert (=> d!94856 (= res!229268 (= (bvadd lt!413930 lt!413932) (bitIndex!0 (size!6831 (buf!7299 (_2!12281 lt!413931))) (currentByte!13472 (_2!12281 lt!413931)) (currentBit!13467 (_2!12281 lt!413931)))))))

(assert (=> d!94856 (or (not (= (bvand lt!413930 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!413932 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!413930 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!413930 lt!413932) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!94856 (= lt!413932 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!94856 (= lt!413930 (bitIndex!0 (size!6831 (buf!7299 bs1!11)) (currentByte!13472 bs1!11) (currentBit!13467 bs1!11)))))

(declare-fun Unit!19365 () Unit!19359)

(declare-fun Unit!19366 () Unit!19359)

(assert (=> d!94856 (= lt!413931 (ite (bvslt (currentBit!13467 bs1!11) #b00000000000000000000000000000111) (tuple2!22493 Unit!19365 (BitStream!12477 (buf!7299 bs1!11) (currentByte!13472 bs1!11) (bvadd (currentBit!13467 bs1!11) #b00000000000000000000000000000001))) (tuple2!22493 Unit!19366 (BitStream!12477 (buf!7299 bs1!11) (bvadd (currentByte!13472 bs1!11) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (=> d!94856 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!6831 (buf!7299 bs1!11))) ((_ sign_extend 32) (currentByte!13472 bs1!11)) ((_ sign_extend 32) (currentBit!13467 bs1!11))) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!94856 (= (increaseBitIndex!0 bs1!11) lt!413931)))

(declare-fun b!275863 () Bool)

(declare-fun res!229269 () Bool)

(assert (=> b!275863 (=> (not res!229269) (not e!195822))))

(declare-fun lt!413933 () (_ BitVec 64))

(declare-fun lt!413934 () (_ BitVec 64))

(assert (=> b!275863 (= res!229269 (= (bvsub lt!413933 lt!413934) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!275863 (or (= (bvand lt!413933 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!413934 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!413933 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!413933 lt!413934) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!275863 (= lt!413934 (remainingBits!0 ((_ sign_extend 32) (size!6831 (buf!7299 (_2!12281 lt!413931)))) ((_ sign_extend 32) (currentByte!13472 (_2!12281 lt!413931))) ((_ sign_extend 32) (currentBit!13467 (_2!12281 lt!413931)))))))

(assert (=> b!275863 (= lt!413933 (remainingBits!0 ((_ sign_extend 32) (size!6831 (buf!7299 bs1!11))) ((_ sign_extend 32) (currentByte!13472 bs1!11)) ((_ sign_extend 32) (currentBit!13467 bs1!11))))))

(declare-fun b!275864 () Bool)

(assert (=> b!275864 (= e!195822 (= (size!6831 (buf!7299 bs1!11)) (size!6831 (buf!7299 (_2!12281 lt!413931)))))))

(assert (= (and d!94856 res!229268) b!275863))

(assert (= (and b!275863 res!229269) b!275864))

(declare-fun m!408699 () Bool)

(assert (=> d!94856 m!408699))

(assert (=> d!94856 m!408473))

(assert (=> d!94856 m!408583))

(declare-fun m!408701 () Bool)

(assert (=> b!275863 m!408701))

(assert (=> b!275863 m!408583))

(assert (=> b!275856 d!94856))

(assert (=> b!275856 d!94786))

(declare-fun d!94858 () Bool)

(declare-fun e!195823 () Bool)

(assert (=> d!94858 e!195823))

(declare-fun res!229270 () Bool)

(assert (=> d!94858 (=> (not res!229270) (not e!195823))))

(declare-fun lt!413940 () (_ BitVec 64))

(declare-fun lt!413937 () (_ BitVec 64))

(declare-fun lt!413938 () (_ BitVec 64))

(assert (=> d!94858 (= res!229270 (= lt!413940 (bvsub lt!413938 lt!413937)))))

(assert (=> d!94858 (or (= (bvand lt!413938 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!413937 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!413938 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!413938 lt!413937) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!94858 (= lt!413937 (remainingBits!0 ((_ sign_extend 32) (size!6831 (buf!7299 (_2!12281 (increaseBitIndex!0 (BitStream!12477 (buf!7299 bs2!19) (currentByte!13472 bs1!11) (currentBit!13467 bs1!11))))))) ((_ sign_extend 32) (currentByte!13472 (_2!12281 (increaseBitIndex!0 (BitStream!12477 (buf!7299 bs2!19) (currentByte!13472 bs1!11) (currentBit!13467 bs1!11)))))) ((_ sign_extend 32) (currentBit!13467 (_2!12281 (increaseBitIndex!0 (BitStream!12477 (buf!7299 bs2!19) (currentByte!13472 bs1!11) (currentBit!13467 bs1!11))))))))))

(declare-fun lt!413936 () (_ BitVec 64))

(declare-fun lt!413935 () (_ BitVec 64))

(assert (=> d!94858 (= lt!413938 (bvmul lt!413936 lt!413935))))

(assert (=> d!94858 (or (= lt!413936 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!413935 (bvsdiv (bvmul lt!413936 lt!413935) lt!413936)))))

(assert (=> d!94858 (= lt!413935 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!94858 (= lt!413936 ((_ sign_extend 32) (size!6831 (buf!7299 (_2!12281 (increaseBitIndex!0 (BitStream!12477 (buf!7299 bs2!19) (currentByte!13472 bs1!11) (currentBit!13467 bs1!11))))))))))

(assert (=> d!94858 (= lt!413940 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13472 (_2!12281 (increaseBitIndex!0 (BitStream!12477 (buf!7299 bs2!19) (currentByte!13472 bs1!11) (currentBit!13467 bs1!11)))))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13467 (_2!12281 (increaseBitIndex!0 (BitStream!12477 (buf!7299 bs2!19) (currentByte!13472 bs1!11) (currentBit!13467 bs1!11))))))))))

(assert (=> d!94858 (invariant!0 (currentBit!13467 (_2!12281 (increaseBitIndex!0 (BitStream!12477 (buf!7299 bs2!19) (currentByte!13472 bs1!11) (currentBit!13467 bs1!11))))) (currentByte!13472 (_2!12281 (increaseBitIndex!0 (BitStream!12477 (buf!7299 bs2!19) (currentByte!13472 bs1!11) (currentBit!13467 bs1!11))))) (size!6831 (buf!7299 (_2!12281 (increaseBitIndex!0 (BitStream!12477 (buf!7299 bs2!19) (currentByte!13472 bs1!11) (currentBit!13467 bs1!11)))))))))

(assert (=> d!94858 (= (bitIndex!0 (size!6831 (buf!7299 (_2!12281 (increaseBitIndex!0 (BitStream!12477 (buf!7299 bs2!19) (currentByte!13472 bs1!11) (currentBit!13467 bs1!11)))))) (currentByte!13472 (_2!12281 (increaseBitIndex!0 (BitStream!12477 (buf!7299 bs2!19) (currentByte!13472 bs1!11) (currentBit!13467 bs1!11))))) (currentBit!13467 (_2!12281 (increaseBitIndex!0 (BitStream!12477 (buf!7299 bs2!19) (currentByte!13472 bs1!11) (currentBit!13467 bs1!11)))))) lt!413940)))

(declare-fun b!275865 () Bool)

(declare-fun res!229271 () Bool)

(assert (=> b!275865 (=> (not res!229271) (not e!195823))))

(assert (=> b!275865 (= res!229271 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!413940))))

(declare-fun b!275866 () Bool)

(declare-fun lt!413939 () (_ BitVec 64))

(assert (=> b!275866 (= e!195823 (bvsle lt!413940 (bvmul lt!413939 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!275866 (or (= lt!413939 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!413939 #b0000000000000000000000000000000000000000000000000000000000001000) lt!413939)))))

(assert (=> b!275866 (= lt!413939 ((_ sign_extend 32) (size!6831 (buf!7299 (_2!12281 (increaseBitIndex!0 (BitStream!12477 (buf!7299 bs2!19) (currentByte!13472 bs1!11) (currentBit!13467 bs1!11))))))))))

(assert (= (and d!94858 res!229270) b!275865))

(assert (= (and b!275865 res!229271) b!275866))

(declare-fun m!408703 () Bool)

(assert (=> d!94858 m!408703))

(declare-fun m!408705 () Bool)

(assert (=> d!94858 m!408705))

(assert (=> b!275855 d!94858))

(declare-fun d!94860 () Bool)

(declare-fun e!195824 () Bool)

(assert (=> d!94860 e!195824))

(declare-fun res!229272 () Bool)

(assert (=> d!94860 (=> (not res!229272) (not e!195824))))

(declare-fun lt!413942 () tuple2!22492)

(declare-fun lt!413941 () (_ BitVec 64))

(declare-fun lt!413943 () (_ BitVec 64))

(assert (=> d!94860 (= res!229272 (= (bvadd lt!413941 lt!413943) (bitIndex!0 (size!6831 (buf!7299 (_2!12281 lt!413942))) (currentByte!13472 (_2!12281 lt!413942)) (currentBit!13467 (_2!12281 lt!413942)))))))

(assert (=> d!94860 (or (not (= (bvand lt!413941 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!413943 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!413941 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!413941 lt!413943) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!94860 (= lt!413943 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!94860 (= lt!413941 (bitIndex!0 (size!6831 (buf!7299 (BitStream!12477 (buf!7299 bs2!19) (currentByte!13472 bs1!11) (currentBit!13467 bs1!11)))) (currentByte!13472 (BitStream!12477 (buf!7299 bs2!19) (currentByte!13472 bs1!11) (currentBit!13467 bs1!11))) (currentBit!13467 (BitStream!12477 (buf!7299 bs2!19) (currentByte!13472 bs1!11) (currentBit!13467 bs1!11)))))))

(declare-fun Unit!19367 () Unit!19359)

(declare-fun Unit!19368 () Unit!19359)

(assert (=> d!94860 (= lt!413942 (ite (bvslt (currentBit!13467 (BitStream!12477 (buf!7299 bs2!19) (currentByte!13472 bs1!11) (currentBit!13467 bs1!11))) #b00000000000000000000000000000111) (tuple2!22493 Unit!19367 (BitStream!12477 (buf!7299 (BitStream!12477 (buf!7299 bs2!19) (currentByte!13472 bs1!11) (currentBit!13467 bs1!11))) (currentByte!13472 (BitStream!12477 (buf!7299 bs2!19) (currentByte!13472 bs1!11) (currentBit!13467 bs1!11))) (bvadd (currentBit!13467 (BitStream!12477 (buf!7299 bs2!19) (currentByte!13472 bs1!11) (currentBit!13467 bs1!11))) #b00000000000000000000000000000001))) (tuple2!22493 Unit!19368 (BitStream!12477 (buf!7299 (BitStream!12477 (buf!7299 bs2!19) (currentByte!13472 bs1!11) (currentBit!13467 bs1!11))) (bvadd (currentByte!13472 (BitStream!12477 (buf!7299 bs2!19) (currentByte!13472 bs1!11) (currentBit!13467 bs1!11))) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (=> d!94860 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!6831 (buf!7299 (BitStream!12477 (buf!7299 bs2!19) (currentByte!13472 bs1!11) (currentBit!13467 bs1!11))))) ((_ sign_extend 32) (currentByte!13472 (BitStream!12477 (buf!7299 bs2!19) (currentByte!13472 bs1!11) (currentBit!13467 bs1!11)))) ((_ sign_extend 32) (currentBit!13467 (BitStream!12477 (buf!7299 bs2!19) (currentByte!13472 bs1!11) (currentBit!13467 bs1!11))))) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!94860 (= (increaseBitIndex!0 (BitStream!12477 (buf!7299 bs2!19) (currentByte!13472 bs1!11) (currentBit!13467 bs1!11))) lt!413942)))

(declare-fun b!275867 () Bool)

(declare-fun res!229273 () Bool)

(assert (=> b!275867 (=> (not res!229273) (not e!195824))))

(declare-fun lt!413944 () (_ BitVec 64))

(declare-fun lt!413945 () (_ BitVec 64))

(assert (=> b!275867 (= res!229273 (= (bvsub lt!413944 lt!413945) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!275867 (or (= (bvand lt!413944 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!413945 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!413944 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!413944 lt!413945) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!275867 (= lt!413945 (remainingBits!0 ((_ sign_extend 32) (size!6831 (buf!7299 (_2!12281 lt!413942)))) ((_ sign_extend 32) (currentByte!13472 (_2!12281 lt!413942))) ((_ sign_extend 32) (currentBit!13467 (_2!12281 lt!413942)))))))

(assert (=> b!275867 (= lt!413944 (remainingBits!0 ((_ sign_extend 32) (size!6831 (buf!7299 (BitStream!12477 (buf!7299 bs2!19) (currentByte!13472 bs1!11) (currentBit!13467 bs1!11))))) ((_ sign_extend 32) (currentByte!13472 (BitStream!12477 (buf!7299 bs2!19) (currentByte!13472 bs1!11) (currentBit!13467 bs1!11)))) ((_ sign_extend 32) (currentBit!13467 (BitStream!12477 (buf!7299 bs2!19) (currentByte!13472 bs1!11) (currentBit!13467 bs1!11))))))))

(declare-fun b!275868 () Bool)

(assert (=> b!275868 (= e!195824 (= (size!6831 (buf!7299 (BitStream!12477 (buf!7299 bs2!19) (currentByte!13472 bs1!11) (currentBit!13467 bs1!11)))) (size!6831 (buf!7299 (_2!12281 lt!413942)))))))

(assert (= (and d!94860 res!229272) b!275867))

(assert (= (and b!275867 res!229273) b!275868))

(declare-fun m!408707 () Bool)

(assert (=> d!94860 m!408707))

(assert (=> d!94860 m!408675))

(declare-fun m!408709 () Bool)

(assert (=> d!94860 m!408709))

(declare-fun m!408711 () Bool)

(assert (=> b!275867 m!408711))

(assert (=> b!275867 m!408709))

(assert (=> b!275855 d!94860))

(declare-fun d!94862 () Bool)

(declare-fun e!195825 () Bool)

(assert (=> d!94862 e!195825))

(declare-fun res!229274 () Bool)

(assert (=> d!94862 (=> (not res!229274) (not e!195825))))

(declare-fun lt!413948 () (_ BitVec 64))

(declare-fun lt!413949 () (_ BitVec 64))

(declare-fun lt!413951 () (_ BitVec 64))

(assert (=> d!94862 (= res!229274 (= lt!413951 (bvsub lt!413949 lt!413948)))))

(assert (=> d!94862 (or (= (bvand lt!413949 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!413948 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!413949 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!413949 lt!413948) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!94862 (= lt!413948 (remainingBits!0 ((_ sign_extend 32) (size!6831 (buf!7299 (BitStream!12477 (buf!7299 bs2!19) (currentByte!13472 bs1!11) (currentBit!13467 bs1!11))))) ((_ sign_extend 32) (currentByte!13472 (BitStream!12477 (buf!7299 bs2!19) (currentByte!13472 bs1!11) (currentBit!13467 bs1!11)))) ((_ sign_extend 32) (currentBit!13467 (BitStream!12477 (buf!7299 bs2!19) (currentByte!13472 bs1!11) (currentBit!13467 bs1!11))))))))

(declare-fun lt!413947 () (_ BitVec 64))

(declare-fun lt!413946 () (_ BitVec 64))

(assert (=> d!94862 (= lt!413949 (bvmul lt!413947 lt!413946))))

(assert (=> d!94862 (or (= lt!413947 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!413946 (bvsdiv (bvmul lt!413947 lt!413946) lt!413947)))))

(assert (=> d!94862 (= lt!413946 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!94862 (= lt!413947 ((_ sign_extend 32) (size!6831 (buf!7299 (BitStream!12477 (buf!7299 bs2!19) (currentByte!13472 bs1!11) (currentBit!13467 bs1!11))))))))

(assert (=> d!94862 (= lt!413951 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13472 (BitStream!12477 (buf!7299 bs2!19) (currentByte!13472 bs1!11) (currentBit!13467 bs1!11)))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13467 (BitStream!12477 (buf!7299 bs2!19) (currentByte!13472 bs1!11) (currentBit!13467 bs1!11))))))))

(assert (=> d!94862 (invariant!0 (currentBit!13467 (BitStream!12477 (buf!7299 bs2!19) (currentByte!13472 bs1!11) (currentBit!13467 bs1!11))) (currentByte!13472 (BitStream!12477 (buf!7299 bs2!19) (currentByte!13472 bs1!11) (currentBit!13467 bs1!11))) (size!6831 (buf!7299 (BitStream!12477 (buf!7299 bs2!19) (currentByte!13472 bs1!11) (currentBit!13467 bs1!11)))))))

(assert (=> d!94862 (= (bitIndex!0 (size!6831 (buf!7299 (BitStream!12477 (buf!7299 bs2!19) (currentByte!13472 bs1!11) (currentBit!13467 bs1!11)))) (currentByte!13472 (BitStream!12477 (buf!7299 bs2!19) (currentByte!13472 bs1!11) (currentBit!13467 bs1!11))) (currentBit!13467 (BitStream!12477 (buf!7299 bs2!19) (currentByte!13472 bs1!11) (currentBit!13467 bs1!11)))) lt!413951)))

(declare-fun b!275869 () Bool)

(declare-fun res!229275 () Bool)

(assert (=> b!275869 (=> (not res!229275) (not e!195825))))

(assert (=> b!275869 (= res!229275 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!413951))))

(declare-fun b!275870 () Bool)

(declare-fun lt!413950 () (_ BitVec 64))

(assert (=> b!275870 (= e!195825 (bvsle lt!413951 (bvmul lt!413950 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!275870 (or (= lt!413950 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!413950 #b0000000000000000000000000000000000000000000000000000000000001000) lt!413950)))))

(assert (=> b!275870 (= lt!413950 ((_ sign_extend 32) (size!6831 (buf!7299 (BitStream!12477 (buf!7299 bs2!19) (currentByte!13472 bs1!11) (currentBit!13467 bs1!11))))))))

(assert (= (and d!94862 res!229274) b!275869))

(assert (= (and b!275869 res!229275) b!275870))

(assert (=> d!94862 m!408709))

(declare-fun m!408713 () Bool)

(assert (=> d!94862 m!408713))

(assert (=> b!275855 d!94862))

(assert (=> d!94850 d!94856))

(assert (=> d!94850 d!94798))

(assert (=> d!94844 d!94860))

(declare-fun d!94864 () Bool)

(assert (=> d!94864 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6831 (buf!7299 (BitStream!12477 (buf!7299 bs2!19) (currentByte!13472 bs1!11) (currentBit!13467 bs1!11))))) ((_ sign_extend 32) (currentByte!13472 (BitStream!12477 (buf!7299 bs2!19) (currentByte!13472 bs1!11) (currentBit!13467 bs1!11)))) ((_ sign_extend 32) (currentBit!13467 (BitStream!12477 (buf!7299 bs2!19) (currentByte!13472 bs1!11) (currentBit!13467 bs1!11))))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6831 (buf!7299 (BitStream!12477 (buf!7299 bs2!19) (currentByte!13472 bs1!11) (currentBit!13467 bs1!11))))) ((_ sign_extend 32) (currentByte!13472 (BitStream!12477 (buf!7299 bs2!19) (currentByte!13472 bs1!11) (currentBit!13467 bs1!11)))) ((_ sign_extend 32) (currentBit!13467 (BitStream!12477 (buf!7299 bs2!19) (currentByte!13472 bs1!11) (currentBit!13467 bs1!11))))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!23916 () Bool)

(assert (= bs!23916 d!94864))

(assert (=> bs!23916 m!408709))

(assert (=> d!94844 d!94864))

(assert (=> d!94852 d!94790))

(assert (=> d!94852 d!94794))

(declare-fun d!94866 () Bool)

(declare-fun res!229276 () Bool)

(declare-fun e!195826 () Bool)

(assert (=> d!94866 (=> res!229276 e!195826)))

(assert (=> d!94866 (= res!229276 (= (bvadd (_1!12277 lt!413753) #b00000000000000000000000000000001) (_2!12277 lt!413753)))))

(assert (=> d!94866 (= (arrayRangesEq!1146 (buf!7299 bs1!11) (buf!7299 bs2!19) (bvadd (_1!12277 lt!413753) #b00000000000000000000000000000001) (_2!12277 lt!413753)) e!195826)))

(declare-fun b!275871 () Bool)

(declare-fun e!195827 () Bool)

(assert (=> b!275871 (= e!195826 e!195827)))

(declare-fun res!229277 () Bool)

(assert (=> b!275871 (=> (not res!229277) (not e!195827))))

(assert (=> b!275871 (= res!229277 (= (select (arr!7818 (buf!7299 bs1!11)) (bvadd (_1!12277 lt!413753) #b00000000000000000000000000000001)) (select (arr!7818 (buf!7299 bs2!19)) (bvadd (_1!12277 lt!413753) #b00000000000000000000000000000001))))))

(declare-fun b!275872 () Bool)

(assert (=> b!275872 (= e!195827 (arrayRangesEq!1146 (buf!7299 bs1!11) (buf!7299 bs2!19) (bvadd (_1!12277 lt!413753) #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_2!12277 lt!413753)))))

(assert (= (and d!94866 (not res!229276)) b!275871))

(assert (= (and b!275871 res!229277) b!275872))

(declare-fun m!408715 () Bool)

(assert (=> b!275871 m!408715))

(declare-fun m!408717 () Bool)

(assert (=> b!275871 m!408717))

(declare-fun m!408719 () Bool)

(assert (=> b!275872 m!408719))

(assert (=> b!275852 d!94866))

(push 1)

(assert (not d!94854))

(assert (not b!275863))

(assert (not d!94862))

(assert (not d!94856))

(assert (not d!94858))

(assert (not b!275867))

(assert (not d!94860))

(assert (not b!275872))

(assert (not d!94864))

(check-sat)

(pop 1)

(push 1)

(check-sat)

