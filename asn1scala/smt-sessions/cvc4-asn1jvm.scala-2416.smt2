; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61580 () Bool)

(assert start!61580)

(declare-fun b!276623 () Bool)

(declare-fun e!196562 () Bool)

(declare-datatypes ((array!15833 0))(
  ( (array!15834 (arr!7848 (Array (_ BitVec 32) (_ BitVec 8))) (size!6855 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12524 0))(
  ( (BitStream!12525 (buf!7323 array!15833) (currentByte!13552 (_ BitVec 32)) (currentBit!13547 (_ BitVec 32))) )
))
(declare-fun bs2!19 () BitStream!12524)

(declare-fun array_inv!6579 (array!15833) Bool)

(assert (=> b!276623 (= e!196562 (array_inv!6579 (buf!7323 bs2!19)))))

(declare-fun b!276624 () Bool)

(declare-fun e!196560 () Bool)

(declare-fun e!196557 () Bool)

(assert (=> b!276624 (= e!196560 e!196557)))

(declare-fun res!229816 () Bool)

(assert (=> b!276624 (=> (not res!229816) (not e!196557))))

(declare-fun lt!414770 () (_ BitVec 64))

(declare-fun bs1!11 () BitStream!12524)

(declare-fun arrayBitRangesEq!0 (array!15833 array!15833 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!276624 (= res!229816 (arrayBitRangesEq!0 (buf!7323 bs1!11) (buf!7323 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 lt!414770))))

(declare-fun lt!414771 () (_ BitVec 64))

(assert (=> b!276624 (= lt!414770 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!414771))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!276624 (= lt!414771 (bitIndex!0 (size!6855 (buf!7323 bs1!11)) (currentByte!13552 bs1!11) (currentBit!13547 bs1!11)))))

(declare-fun b!276625 () Bool)

(declare-fun res!229815 () Bool)

(assert (=> b!276625 (=> (not res!229815) (not e!196560))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!276625 (= res!229815 (validate_offset_bit!0 ((_ sign_extend 32) (size!6855 (buf!7323 bs1!11))) ((_ sign_extend 32) (currentByte!13552 bs1!11)) ((_ sign_extend 32) (currentBit!13547 bs1!11))))))

(declare-fun b!276626 () Bool)

(assert (=> b!276626 (= e!196557 (not (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 lt!414770) (bvsgt lt!414770 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6855 (buf!7323 bs1!11))))) (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!414771) (bvslt lt!414771 lt!414770)))))))

(declare-datatypes ((tuple2!22558 0))(
  ( (tuple2!22559 (_1!12326 BitStream!12524) (_2!12326 Bool)) )
))
(declare-fun lt!414769 () tuple2!22558)

(declare-fun readBitPure!0 (BitStream!12524) tuple2!22558)

(assert (=> b!276626 (= lt!414769 (readBitPure!0 (BitStream!12525 (buf!7323 bs2!19) (currentByte!13552 bs1!11) (currentBit!13547 bs1!11))))))

(declare-fun lt!414768 () tuple2!22558)

(assert (=> b!276626 (= lt!414768 (readBitPure!0 bs1!11))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!276626 (invariant!0 (currentBit!13547 bs1!11) (currentByte!13552 bs1!11) (size!6855 (buf!7323 bs2!19)))))

(declare-fun b!276627 () Bool)

(declare-fun e!196558 () Bool)

(assert (=> b!276627 (= e!196558 (array_inv!6579 (buf!7323 bs1!11)))))

(declare-fun res!229814 () Bool)

(assert (=> start!61580 (=> (not res!229814) (not e!196560))))

(assert (=> start!61580 (= res!229814 (= (size!6855 (buf!7323 bs1!11)) (size!6855 (buf!7323 bs2!19))))))

(assert (=> start!61580 e!196560))

(declare-fun inv!12 (BitStream!12524) Bool)

(assert (=> start!61580 (and (inv!12 bs1!11) e!196558)))

(assert (=> start!61580 (and (inv!12 bs2!19) e!196562)))

(assert (= (and start!61580 res!229814) b!276625))

(assert (= (and b!276625 res!229815) b!276624))

(assert (= (and b!276624 res!229816) b!276626))

(assert (= start!61580 b!276627))

(assert (= start!61580 b!276623))

(declare-fun m!409665 () Bool)

(assert (=> start!61580 m!409665))

(declare-fun m!409667 () Bool)

(assert (=> start!61580 m!409667))

(declare-fun m!409669 () Bool)

(assert (=> b!276624 m!409669))

(declare-fun m!409671 () Bool)

(assert (=> b!276624 m!409671))

(declare-fun m!409673 () Bool)

(assert (=> b!276627 m!409673))

(declare-fun m!409675 () Bool)

(assert (=> b!276626 m!409675))

(declare-fun m!409677 () Bool)

(assert (=> b!276626 m!409677))

(declare-fun m!409679 () Bool)

(assert (=> b!276626 m!409679))

(declare-fun m!409681 () Bool)

(assert (=> b!276623 m!409681))

(declare-fun m!409683 () Bool)

(assert (=> b!276625 m!409683))

(push 1)

(assert (not b!276626))

(assert (not start!61580))

(assert (not b!276627))

(assert (not b!276623))

(assert (not b!276624))

(assert (not b!276625))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-datatypes ((tuple4!536 0))(
  ( (tuple4!537 (_1!12329 (_ BitVec 32)) (_2!12329 (_ BitVec 32)) (_3!1048 (_ BitVec 32)) (_4!268 (_ BitVec 32))) )
))
(declare-fun lt!414793 () tuple4!536)

(declare-fun e!196593 () Bool)

(declare-fun b!276663 () Bool)

(declare-fun arrayRangesEq!1160 (array!15833 array!15833 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!276663 (= e!196593 (arrayRangesEq!1160 (buf!7323 bs1!11) (buf!7323 bs2!19) (_1!12329 lt!414793) (_2!12329 lt!414793)))))

(declare-fun b!276664 () Bool)

(declare-fun e!196594 () Bool)

(declare-fun call!4460 () Bool)

(assert (=> b!276664 (= e!196594 call!4460)))

(declare-fun e!196598 () Bool)

(declare-fun lt!414791 () (_ BitVec 32))

(declare-fun b!276665 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!276665 (= e!196598 (byteRangesEq!0 (select (arr!7848 (buf!7323 bs1!11)) (_4!268 lt!414793)) (select (arr!7848 (buf!7323 bs2!19)) (_4!268 lt!414793)) #b00000000000000000000000000000000 lt!414791))))

(declare-fun b!276666 () Bool)

(declare-fun e!196597 () Bool)

(assert (=> b!276666 (= e!196597 e!196594)))

(declare-fun c!12645 () Bool)

(assert (=> b!276666 (= c!12645 (= (_3!1048 lt!414793) (_4!268 lt!414793)))))

(declare-fun d!95292 () Bool)

(declare-fun res!229843 () Bool)

(declare-fun e!196595 () Bool)

(assert (=> d!95292 (=> res!229843 e!196595)))

(assert (=> d!95292 (= res!229843 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!414770))))

(assert (=> d!95292 (= (arrayBitRangesEq!0 (buf!7323 bs1!11) (buf!7323 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 lt!414770) e!196595)))

(declare-fun b!276667 () Bool)

(declare-fun e!196596 () Bool)

(assert (=> b!276667 (= e!196594 e!196596)))

(declare-fun res!229844 () Bool)

(assert (=> b!276667 (= res!229844 call!4460)))

(assert (=> b!276667 (=> (not res!229844) (not e!196596))))

(declare-fun b!276668 () Bool)

(declare-fun res!229845 () Bool)

(assert (=> b!276668 (= res!229845 (= lt!414791 #b00000000000000000000000000000000))))

(assert (=> b!276668 (=> res!229845 e!196598)))

(assert (=> b!276668 (= e!196596 e!196598)))

(declare-fun b!276669 () Bool)

(assert (=> b!276669 (= e!196595 e!196597)))

(declare-fun res!229846 () Bool)

(assert (=> b!276669 (=> (not res!229846) (not e!196597))))

(assert (=> b!276669 (= res!229846 e!196593)))

(declare-fun res!229842 () Bool)

(assert (=> b!276669 (=> res!229842 e!196593)))

(assert (=> b!276669 (= res!229842 (bvsge (_1!12329 lt!414793) (_2!12329 lt!414793)))))

(assert (=> b!276669 (= lt!414791 ((_ extract 31 0) (bvsrem lt!414770 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!414792 () (_ BitVec 32))

(assert (=> b!276669 (= lt!414792 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!536)

(assert (=> b!276669 (= lt!414793 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!414770))))

(declare-fun bm!4457 () Bool)

(assert (=> bm!4457 (= call!4460 (byteRangesEq!0 (select (arr!7848 (buf!7323 bs1!11)) (_3!1048 lt!414793)) (select (arr!7848 (buf!7323 bs2!19)) (_3!1048 lt!414793)) lt!414792 (ite c!12645 lt!414791 #b00000000000000000000000000001000)))))

(assert (= (and d!95292 (not res!229843)) b!276669))

(assert (= (and b!276669 (not res!229842)) b!276663))

(assert (= (and b!276669 res!229846) b!276666))

(assert (= (and b!276666 c!12645) b!276664))

(assert (= (and b!276666 (not c!12645)) b!276667))

(assert (= (and b!276667 res!229844) b!276668))

(assert (= (and b!276668 (not res!229845)) b!276665))

(assert (= (or b!276664 b!276667) bm!4457))

(declare-fun m!409711 () Bool)

(assert (=> b!276663 m!409711))

(declare-fun m!409713 () Bool)

(assert (=> b!276665 m!409713))

(declare-fun m!409715 () Bool)

(assert (=> b!276665 m!409715))

(assert (=> b!276665 m!409713))

(assert (=> b!276665 m!409715))

(declare-fun m!409717 () Bool)

(assert (=> b!276665 m!409717))

(declare-fun m!409719 () Bool)

(assert (=> b!276669 m!409719))

(declare-fun m!409721 () Bool)

(assert (=> bm!4457 m!409721))

(declare-fun m!409723 () Bool)

(assert (=> bm!4457 m!409723))

(assert (=> bm!4457 m!409721))

(assert (=> bm!4457 m!409723))

(declare-fun m!409725 () Bool)

(assert (=> bm!4457 m!409725))

(assert (=> b!276624 d!95292))

(declare-fun d!95298 () Bool)

(declare-fun e!196622 () Bool)

(assert (=> d!95298 e!196622))

(declare-fun res!229872 () Bool)

(assert (=> d!95298 (=> (not res!229872) (not e!196622))))

(declare-fun lt!414834 () (_ BitVec 64))

(declare-fun lt!414838 () (_ BitVec 64))

(declare-fun lt!414835 () (_ BitVec 64))

(assert (=> d!95298 (= res!229872 (= lt!414834 (bvsub lt!414835 lt!414838)))))

(assert (=> d!95298 (or (= (bvand lt!414835 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!414838 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!414835 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!414835 lt!414838) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!95298 (= lt!414838 (remainingBits!0 ((_ sign_extend 32) (size!6855 (buf!7323 bs1!11))) ((_ sign_extend 32) (currentByte!13552 bs1!11)) ((_ sign_extend 32) (currentBit!13547 bs1!11))))))

(declare-fun lt!414833 () (_ BitVec 64))

(declare-fun lt!414837 () (_ BitVec 64))

(assert (=> d!95298 (= lt!414835 (bvmul lt!414833 lt!414837))))

(assert (=> d!95298 (or (= lt!414833 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!414837 (bvsdiv (bvmul lt!414833 lt!414837) lt!414833)))))

(assert (=> d!95298 (= lt!414837 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!95298 (= lt!414833 ((_ sign_extend 32) (size!6855 (buf!7323 bs1!11))))))

(assert (=> d!95298 (= lt!414834 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13552 bs1!11)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13547 bs1!11))))))

(assert (=> d!95298 (invariant!0 (currentBit!13547 bs1!11) (currentByte!13552 bs1!11) (size!6855 (buf!7323 bs1!11)))))

(assert (=> d!95298 (= (bitIndex!0 (size!6855 (buf!7323 bs1!11)) (currentByte!13552 bs1!11) (currentBit!13547 bs1!11)) lt!414834)))

(declare-fun b!276701 () Bool)

(declare-fun res!229873 () Bool)

(assert (=> b!276701 (=> (not res!229873) (not e!196622))))

(assert (=> b!276701 (= res!229873 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!414834))))

(declare-fun b!276702 () Bool)

(declare-fun lt!414836 () (_ BitVec 64))

(assert (=> b!276702 (= e!196622 (bvsle lt!414834 (bvmul lt!414836 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!276702 (or (= lt!414836 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!414836 #b0000000000000000000000000000000000000000000000000000000000001000) lt!414836)))))

(assert (=> b!276702 (= lt!414836 ((_ sign_extend 32) (size!6855 (buf!7323 bs1!11))))))

(assert (= (and d!95298 res!229872) b!276701))

(assert (= (and b!276701 res!229873) b!276702))

(declare-fun m!409745 () Bool)

(assert (=> d!95298 m!409745))

(declare-fun m!409747 () Bool)

(assert (=> d!95298 m!409747))

(assert (=> b!276624 d!95298))

(declare-fun d!95304 () Bool)

(assert (=> d!95304 (= (array_inv!6579 (buf!7323 bs2!19)) (bvsge (size!6855 (buf!7323 bs2!19)) #b00000000000000000000000000000000))))

(assert (=> b!276623 d!95304))

(declare-fun d!95306 () Bool)

(assert (=> d!95306 (= (array_inv!6579 (buf!7323 bs1!11)) (bvsge (size!6855 (buf!7323 bs1!11)) #b00000000000000000000000000000000))))

(assert (=> b!276627 d!95306))

(declare-fun d!95308 () Bool)

(assert (=> d!95308 (= (inv!12 bs1!11) (invariant!0 (currentBit!13547 bs1!11) (currentByte!13552 bs1!11) (size!6855 (buf!7323 bs1!11))))))

(declare-fun bs!24036 () Bool)

(assert (= bs!24036 d!95308))

(assert (=> bs!24036 m!409747))

(assert (=> start!61580 d!95308))

(declare-fun d!95310 () Bool)

(assert (=> d!95310 (= (inv!12 bs2!19) (invariant!0 (currentBit!13547 bs2!19) (currentByte!13552 bs2!19) (size!6855 (buf!7323 bs2!19))))))

(declare-fun bs!24037 () Bool)

(assert (= bs!24037 d!95310))

(declare-fun m!409749 () Bool)

(assert (=> bs!24037 m!409749))

(assert (=> start!61580 d!95310))

(declare-fun d!95312 () Bool)

(declare-datatypes ((tuple2!22562 0))(
  ( (tuple2!22563 (_1!12331 Bool) (_2!12331 BitStream!12524)) )
))
(declare-fun lt!414841 () tuple2!22562)

(declare-fun readBit!0 (BitStream!12524) tuple2!22562)

(assert (=> d!95312 (= lt!414841 (readBit!0 (BitStream!12525 (buf!7323 bs2!19) (currentByte!13552 bs1!11) (currentBit!13547 bs1!11))))))

(assert (=> d!95312 (= (readBitPure!0 (BitStream!12525 (buf!7323 bs2!19) (currentByte!13552 bs1!11) (currentBit!13547 bs1!11))) (tuple2!22559 (_2!12331 lt!414841) (_1!12331 lt!414841)))))

(declare-fun bs!24038 () Bool)

(assert (= bs!24038 d!95312))

(declare-fun m!409751 () Bool)

(assert (=> bs!24038 m!409751))

(assert (=> b!276626 d!95312))

(declare-fun d!95314 () Bool)

(declare-fun lt!414842 () tuple2!22562)

(assert (=> d!95314 (= lt!414842 (readBit!0 bs1!11))))

(assert (=> d!95314 (= (readBitPure!0 bs1!11) (tuple2!22559 (_2!12331 lt!414842) (_1!12331 lt!414842)))))

(declare-fun bs!24039 () Bool)

(assert (= bs!24039 d!95314))

(declare-fun m!409753 () Bool)

(assert (=> bs!24039 m!409753))

(assert (=> b!276626 d!95314))

(declare-fun d!95316 () Bool)

(assert (=> d!95316 (= (invariant!0 (currentBit!13547 bs1!11) (currentByte!13552 bs1!11) (size!6855 (buf!7323 bs2!19))) (and (bvsge (currentBit!13547 bs1!11) #b00000000000000000000000000000000) (bvslt (currentBit!13547 bs1!11) #b00000000000000000000000000001000) (bvsge (currentByte!13552 bs1!11) #b00000000000000000000000000000000) (or (bvslt (currentByte!13552 bs1!11) (size!6855 (buf!7323 bs2!19))) (and (= (currentBit!13547 bs1!11) #b00000000000000000000000000000000) (= (currentByte!13552 bs1!11) (size!6855 (buf!7323 bs2!19)))))))))

(assert (=> b!276626 d!95316))

(declare-fun d!95318 () Bool)

(assert (=> d!95318 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6855 (buf!7323 bs1!11))) ((_ sign_extend 32) (currentByte!13552 bs1!11)) ((_ sign_extend 32) (currentBit!13547 bs1!11))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6855 (buf!7323 bs1!11))) ((_ sign_extend 32) (currentByte!13552 bs1!11)) ((_ sign_extend 32) (currentBit!13547 bs1!11))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!24040 () Bool)

(assert (= bs!24040 d!95318))

(assert (=> bs!24040 m!409745))

(assert (=> b!276625 d!95318))

(push 1)

(assert (not bm!4457))

(assert (not d!95310))

(assert (not d!95298))

(assert (not d!95314))

(assert (not d!95312))

(assert (not d!95318))

(assert (not d!95308))

(assert (not b!276665))

(assert (not b!276663))

(assert (not b!276669))

(check-sat)

(pop 1)

(push 1)

(check-sat)

