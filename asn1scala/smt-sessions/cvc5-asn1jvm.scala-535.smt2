; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15654 () Bool)

(assert start!15654)

(declare-fun b!79229 () Bool)

(declare-fun res!65582 () Bool)

(declare-fun e!51994 () Bool)

(assert (=> b!79229 (=> (not res!65582) (not e!51994))))

(declare-datatypes ((array!3382 0))(
  ( (array!3383 (arr!2163 (Array (_ BitVec 32) (_ BitVec 8))) (size!1562 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2686 0))(
  ( (BitStream!2687 (buf!1952 array!3382) (currentByte!3823 (_ BitVec 32)) (currentBit!3818 (_ BitVec 32))) )
))
(declare-fun thiss!1107 () BitStream!2686)

(declare-datatypes ((Unit!5209 0))(
  ( (Unit!5210) )
))
(declare-datatypes ((tuple2!7070 0))(
  ( (tuple2!7071 (_1!3672 Unit!5209) (_2!3672 BitStream!2686)) )
))
(declare-fun lt!126103 () tuple2!7070)

(declare-fun isPrefixOf!0 (BitStream!2686 BitStream!2686) Bool)

(assert (=> b!79229 (= res!65582 (isPrefixOf!0 thiss!1107 (_2!3672 lt!126103)))))

(declare-fun b!79230 () Bool)

(declare-fun res!65585 () Bool)

(declare-fun e!51997 () Bool)

(assert (=> b!79230 (=> (not res!65585) (not e!51997))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!79230 (= res!65585 (validate_offset_bit!0 ((_ sign_extend 32) (size!1562 (buf!1952 thiss!1107))) ((_ sign_extend 32) (currentByte!3823 thiss!1107)) ((_ sign_extend 32) (currentBit!3818 thiss!1107))))))

(declare-fun b!79231 () Bool)

(declare-fun e!51999 () Bool)

(declare-datatypes ((tuple2!7072 0))(
  ( (tuple2!7073 (_1!3673 BitStream!2686) (_2!3673 Bool)) )
))
(declare-fun lt!126099 () tuple2!7072)

(declare-fun lt!126105 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!79231 (= e!51999 (= (bitIndex!0 (size!1562 (buf!1952 (_1!3673 lt!126099))) (currentByte!3823 (_1!3673 lt!126099)) (currentBit!3818 (_1!3673 lt!126099))) lt!126105))))

(declare-fun b!79232 () Bool)

(declare-fun e!51998 () Bool)

(assert (=> b!79232 (= e!51998 e!51994)))

(declare-fun res!65583 () Bool)

(assert (=> b!79232 (=> (not res!65583) (not e!51994))))

(declare-fun lt!126104 () (_ BitVec 64))

(assert (=> b!79232 (= res!65583 (= lt!126105 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!126104)))))

(assert (=> b!79232 (= lt!126105 (bitIndex!0 (size!1562 (buf!1952 (_2!3672 lt!126103))) (currentByte!3823 (_2!3672 lt!126103)) (currentBit!3818 (_2!3672 lt!126103))))))

(assert (=> b!79232 (= lt!126104 (bitIndex!0 (size!1562 (buf!1952 thiss!1107)) (currentByte!3823 thiss!1107) (currentBit!3818 thiss!1107)))))

(declare-fun res!65587 () Bool)

(assert (=> start!15654 (=> (not res!65587) (not e!51997))))

(declare-fun bitNr!1 () (_ BitVec 32))

(assert (=> start!15654 (= res!65587 (and (bvsge bitNr!1 #b00000000000000000000000000000000) (bvslt bitNr!1 #b00000000000000000000000000001000)))))

(assert (=> start!15654 e!51997))

(assert (=> start!15654 true))

(declare-fun e!51995 () Bool)

(declare-fun inv!12 (BitStream!2686) Bool)

(assert (=> start!15654 (and (inv!12 thiss!1107) e!51995)))

(declare-fun b!79233 () Bool)

(declare-fun e!51996 () Bool)

(assert (=> b!79233 (= e!51997 (not e!51996))))

(declare-fun res!65581 () Bool)

(assert (=> b!79233 (=> res!65581 e!51996)))

(assert (=> b!79233 (= res!65581 (not (= (size!1562 (buf!1952 (_2!3672 lt!126103))) (size!1562 (buf!1952 thiss!1107)))))))

(assert (=> b!79233 e!51998))

(declare-fun res!65586 () Bool)

(assert (=> b!79233 (=> (not res!65586) (not e!51998))))

(assert (=> b!79233 (= res!65586 (= (size!1562 (buf!1952 thiss!1107)) (size!1562 (buf!1952 (_2!3672 lt!126103)))))))

(declare-fun lt!126100 () Bool)

(declare-fun appendBit!0 (BitStream!2686 Bool) tuple2!7070)

(assert (=> b!79233 (= lt!126103 (appendBit!0 thiss!1107 lt!126100))))

(declare-fun b!215 () (_ BitVec 8))

(assert (=> b!79233 (= lt!126100 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) b!215))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) bitNr!1))) #b00000000000000000000000000000000)))))

(declare-fun b!79234 () Bool)

(declare-fun lt!126101 () (_ BitVec 64))

(declare-fun lt!126102 () (_ BitVec 64))

(assert (=> b!79234 (= e!51996 (or (not (= lt!126101 #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!126101 (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!126102) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!79234 (= lt!126101 (bvand lt!126102 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!79234 (= lt!126102 (bitIndex!0 (size!1562 (buf!1952 thiss!1107)) (currentByte!3823 thiss!1107) (currentBit!3818 thiss!1107)))))

(declare-fun b!79235 () Bool)

(assert (=> b!79235 (= e!51994 e!51999)))

(declare-fun res!65584 () Bool)

(assert (=> b!79235 (=> (not res!65584) (not e!51999))))

(assert (=> b!79235 (= res!65584 (and (= (_2!3673 lt!126099) lt!126100) (= (_1!3673 lt!126099) (_2!3672 lt!126103))))))

(declare-fun readBitPure!0 (BitStream!2686) tuple2!7072)

(declare-fun readerFrom!0 (BitStream!2686 (_ BitVec 32) (_ BitVec 32)) BitStream!2686)

(assert (=> b!79235 (= lt!126099 (readBitPure!0 (readerFrom!0 (_2!3672 lt!126103) (currentBit!3818 thiss!1107) (currentByte!3823 thiss!1107))))))

(declare-fun b!79236 () Bool)

(declare-fun array_inv!1408 (array!3382) Bool)

(assert (=> b!79236 (= e!51995 (array_inv!1408 (buf!1952 thiss!1107)))))

(assert (= (and start!15654 res!65587) b!79230))

(assert (= (and b!79230 res!65585) b!79233))

(assert (= (and b!79233 res!65586) b!79232))

(assert (= (and b!79232 res!65583) b!79229))

(assert (= (and b!79229 res!65582) b!79235))

(assert (= (and b!79235 res!65584) b!79231))

(assert (= (and b!79233 (not res!65581)) b!79234))

(assert (= start!15654 b!79236))

(declare-fun m!124659 () Bool)

(assert (=> b!79232 m!124659))

(declare-fun m!124661 () Bool)

(assert (=> b!79232 m!124661))

(declare-fun m!124663 () Bool)

(assert (=> b!79229 m!124663))

(declare-fun m!124665 () Bool)

(assert (=> start!15654 m!124665))

(declare-fun m!124667 () Bool)

(assert (=> b!79231 m!124667))

(declare-fun m!124669 () Bool)

(assert (=> b!79233 m!124669))

(declare-fun m!124671 () Bool)

(assert (=> b!79233 m!124671))

(declare-fun m!124673 () Bool)

(assert (=> b!79230 m!124673))

(declare-fun m!124675 () Bool)

(assert (=> b!79235 m!124675))

(assert (=> b!79235 m!124675))

(declare-fun m!124677 () Bool)

(assert (=> b!79235 m!124677))

(declare-fun m!124679 () Bool)

(assert (=> b!79236 m!124679))

(assert (=> b!79234 m!124661))

(push 1)

(assert (not b!79234))

(assert (not b!79232))

(assert (not b!79233))

(assert (not b!79236))

(assert (not start!15654))

(assert (not b!79230))

(assert (not b!79231))

(assert (not b!79229))

(assert (not b!79235))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!79318 () Bool)

(declare-fun res!65663 () Bool)

(declare-fun e!52062 () Bool)

(assert (=> b!79318 (=> (not res!65663) (not e!52062))))

(declare-fun lt!126202 () (_ BitVec 64))

(declare-fun lt!126201 () (_ BitVec 64))

(declare-fun lt!126200 () tuple2!7070)

(assert (=> b!79318 (= res!65663 (= (bitIndex!0 (size!1562 (buf!1952 (_2!3672 lt!126200))) (currentByte!3823 (_2!3672 lt!126200)) (currentBit!3818 (_2!3672 lt!126200))) (bvadd lt!126202 lt!126201)))))

(assert (=> b!79318 (or (not (= (bvand lt!126202 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!126201 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!126202 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!126202 lt!126201) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!79318 (= lt!126201 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!79318 (= lt!126202 (bitIndex!0 (size!1562 (buf!1952 thiss!1107)) (currentByte!3823 thiss!1107) (currentBit!3818 thiss!1107)))))

(declare-fun b!79321 () Bool)

(declare-fun e!52063 () Bool)

(declare-fun lt!126199 () tuple2!7072)

(assert (=> b!79321 (= e!52063 (= (bitIndex!0 (size!1562 (buf!1952 (_1!3673 lt!126199))) (currentByte!3823 (_1!3673 lt!126199)) (currentBit!3818 (_1!3673 lt!126199))) (bitIndex!0 (size!1562 (buf!1952 (_2!3672 lt!126200))) (currentByte!3823 (_2!3672 lt!126200)) (currentBit!3818 (_2!3672 lt!126200)))))))

(declare-fun b!79320 () Bool)

(assert (=> b!79320 (= e!52062 e!52063)))

(declare-fun res!65667 () Bool)

(assert (=> b!79320 (=> (not res!65667) (not e!52063))))

(assert (=> b!79320 (= res!65667 (and (= (_2!3673 lt!126199) lt!126100) (= (_1!3673 lt!126199) (_2!3672 lt!126200))))))

(assert (=> b!79320 (= lt!126199 (readBitPure!0 (readerFrom!0 (_2!3672 lt!126200) (currentBit!3818 thiss!1107) (currentByte!3823 thiss!1107))))))

(declare-fun b!79319 () Bool)

(declare-fun res!65668 () Bool)

(assert (=> b!79319 (=> (not res!65668) (not e!52062))))

(assert (=> b!79319 (= res!65668 (isPrefixOf!0 thiss!1107 (_2!3672 lt!126200)))))

(declare-fun d!25020 () Bool)

(assert (=> d!25020 e!52062))

(declare-fun res!65666 () Bool)

(assert (=> d!25020 (=> (not res!65666) (not e!52062))))

(assert (=> d!25020 (= res!65666 (= (size!1562 (buf!1952 thiss!1107)) (size!1562 (buf!1952 (_2!3672 lt!126200)))))))

(declare-fun choose!16 (BitStream!2686 Bool) tuple2!7070)

(assert (=> d!25020 (= lt!126200 (choose!16 thiss!1107 lt!126100))))

(assert (=> d!25020 (validate_offset_bit!0 ((_ sign_extend 32) (size!1562 (buf!1952 thiss!1107))) ((_ sign_extend 32) (currentByte!3823 thiss!1107)) ((_ sign_extend 32) (currentBit!3818 thiss!1107)))))

(assert (=> d!25020 (= (appendBit!0 thiss!1107 lt!126100) lt!126200)))

(assert (= (and d!25020 res!65666) b!79318))

(assert (= (and b!79318 res!65663) b!79319))

(assert (= (and b!79319 res!65668) b!79320))

(assert (= (and b!79320 res!65667) b!79321))

(declare-fun m!124743 () Bool)

(assert (=> d!25020 m!124743))

(assert (=> d!25020 m!124673))

(declare-fun m!124745 () Bool)

(assert (=> b!79321 m!124745))

(declare-fun m!124747 () Bool)

(assert (=> b!79321 m!124747))

(declare-fun m!124749 () Bool)

(assert (=> b!79320 m!124749))

(assert (=> b!79320 m!124749))

(declare-fun m!124751 () Bool)

(assert (=> b!79320 m!124751))

(declare-fun m!124753 () Bool)

(assert (=> b!79319 m!124753))

(assert (=> b!79318 m!124747))

(assert (=> b!79318 m!124661))

(assert (=> b!79233 d!25020))

(declare-fun d!25028 () Bool)

(declare-fun res!65692 () Bool)

(declare-fun e!52077 () Bool)

(assert (=> d!25028 (=> (not res!65692) (not e!52077))))

(assert (=> d!25028 (= res!65692 (= (size!1562 (buf!1952 thiss!1107)) (size!1562 (buf!1952 (_2!3672 lt!126103)))))))

(assert (=> d!25028 (= (isPrefixOf!0 thiss!1107 (_2!3672 lt!126103)) e!52077)))

(declare-fun b!79347 () Bool)

(declare-fun res!65691 () Bool)

(assert (=> b!79347 (=> (not res!65691) (not e!52077))))

(assert (=> b!79347 (= res!65691 (bvsle (bitIndex!0 (size!1562 (buf!1952 thiss!1107)) (currentByte!3823 thiss!1107) (currentBit!3818 thiss!1107)) (bitIndex!0 (size!1562 (buf!1952 (_2!3672 lt!126103))) (currentByte!3823 (_2!3672 lt!126103)) (currentBit!3818 (_2!3672 lt!126103)))))))

(declare-fun b!79348 () Bool)

(declare-fun e!52076 () Bool)

(assert (=> b!79348 (= e!52077 e!52076)))

(declare-fun res!65693 () Bool)

(assert (=> b!79348 (=> res!65693 e!52076)))

(assert (=> b!79348 (= res!65693 (= (size!1562 (buf!1952 thiss!1107)) #b00000000000000000000000000000000))))

(declare-fun b!79349 () Bool)

(declare-fun arrayBitRangesEq!0 (array!3382 array!3382 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!79349 (= e!52076 (arrayBitRangesEq!0 (buf!1952 thiss!1107) (buf!1952 (_2!3672 lt!126103)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1562 (buf!1952 thiss!1107)) (currentByte!3823 thiss!1107) (currentBit!3818 thiss!1107))))))

(assert (= (and d!25028 res!65692) b!79347))

(assert (= (and b!79347 res!65691) b!79348))

(assert (= (and b!79348 (not res!65693)) b!79349))

(assert (=> b!79347 m!124661))

(assert (=> b!79347 m!124659))

(assert (=> b!79349 m!124661))

(assert (=> b!79349 m!124661))

(declare-fun m!124777 () Bool)

(assert (=> b!79349 m!124777))

(assert (=> b!79229 d!25028))

(declare-fun d!25038 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!25038 (= (inv!12 thiss!1107) (invariant!0 (currentBit!3818 thiss!1107) (currentByte!3823 thiss!1107) (size!1562 (buf!1952 thiss!1107))))))

(declare-fun bs!6067 () Bool)

(assert (= bs!6067 d!25038))

(declare-fun m!124779 () Bool)

(assert (=> bs!6067 m!124779))

(assert (=> start!15654 d!25038))

(declare-fun d!25040 () Bool)

(declare-fun e!52083 () Bool)

(assert (=> d!25040 e!52083))

(declare-fun res!65702 () Bool)

(assert (=> d!25040 (=> (not res!65702) (not e!52083))))

(declare-fun lt!126249 () (_ BitVec 64))

(declare-fun lt!126246 () (_ BitVec 64))

(declare-fun lt!126247 () (_ BitVec 64))

(assert (=> d!25040 (= res!65702 (= lt!126249 (bvsub lt!126247 lt!126246)))))

(assert (=> d!25040 (or (= (bvand lt!126247 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!126246 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!126247 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!126247 lt!126246) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!25040 (= lt!126246 (remainingBits!0 ((_ sign_extend 32) (size!1562 (buf!1952 thiss!1107))) ((_ sign_extend 32) (currentByte!3823 thiss!1107)) ((_ sign_extend 32) (currentBit!3818 thiss!1107))))))

(declare-fun lt!126248 () (_ BitVec 64))

(declare-fun lt!126244 () (_ BitVec 64))

(assert (=> d!25040 (= lt!126247 (bvmul lt!126248 lt!126244))))

(assert (=> d!25040 (or (= lt!126248 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!126244 (bvsdiv (bvmul lt!126248 lt!126244) lt!126248)))))

(assert (=> d!25040 (= lt!126244 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!25040 (= lt!126248 ((_ sign_extend 32) (size!1562 (buf!1952 thiss!1107))))))

(assert (=> d!25040 (= lt!126249 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3823 thiss!1107)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3818 thiss!1107))))))

(assert (=> d!25040 (invariant!0 (currentBit!3818 thiss!1107) (currentByte!3823 thiss!1107) (size!1562 (buf!1952 thiss!1107)))))

(assert (=> d!25040 (= (bitIndex!0 (size!1562 (buf!1952 thiss!1107)) (currentByte!3823 thiss!1107) (currentBit!3818 thiss!1107)) lt!126249)))

(declare-fun b!79357 () Bool)

(declare-fun res!65703 () Bool)

(assert (=> b!79357 (=> (not res!65703) (not e!52083))))

(assert (=> b!79357 (= res!65703 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!126249))))

(declare-fun b!79358 () Bool)

(declare-fun lt!126245 () (_ BitVec 64))

(assert (=> b!79358 (= e!52083 (bvsle lt!126249 (bvmul lt!126245 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!79358 (or (= lt!126245 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!126245 #b0000000000000000000000000000000000000000000000000000000000001000) lt!126245)))))

(assert (=> b!79358 (= lt!126245 ((_ sign_extend 32) (size!1562 (buf!1952 thiss!1107))))))

(assert (= (and d!25040 res!65702) b!79357))

(assert (= (and b!79357 res!65703) b!79358))

(declare-fun m!124785 () Bool)

(assert (=> d!25040 m!124785))

(assert (=> d!25040 m!124779))

(assert (=> b!79234 d!25040))

(declare-fun d!25046 () Bool)

(assert (=> d!25046 (= (array_inv!1408 (buf!1952 thiss!1107)) (bvsge (size!1562 (buf!1952 thiss!1107)) #b00000000000000000000000000000000))))

(assert (=> b!79236 d!25046))

(declare-fun d!25048 () Bool)

(declare-datatypes ((tuple2!7084 0))(
  ( (tuple2!7085 (_1!3679 Bool) (_2!3679 BitStream!2686)) )
))
(declare-fun lt!126252 () tuple2!7084)

(declare-fun readBit!0 (BitStream!2686) tuple2!7084)

(assert (=> d!25048 (= lt!126252 (readBit!0 (readerFrom!0 (_2!3672 lt!126103) (currentBit!3818 thiss!1107) (currentByte!3823 thiss!1107))))))

(assert (=> d!25048 (= (readBitPure!0 (readerFrom!0 (_2!3672 lt!126103) (currentBit!3818 thiss!1107) (currentByte!3823 thiss!1107))) (tuple2!7073 (_2!3679 lt!126252) (_1!3679 lt!126252)))))

(declare-fun bs!6069 () Bool)

(assert (= bs!6069 d!25048))

(assert (=> bs!6069 m!124675))

(declare-fun m!124787 () Bool)

(assert (=> bs!6069 m!124787))

(assert (=> b!79235 d!25048))

(declare-fun d!25050 () Bool)

(declare-fun e!52086 () Bool)

(assert (=> d!25050 e!52086))

(declare-fun res!65707 () Bool)

(assert (=> d!25050 (=> (not res!65707) (not e!52086))))

(assert (=> d!25050 (= res!65707 (invariant!0 (currentBit!3818 (_2!3672 lt!126103)) (currentByte!3823 (_2!3672 lt!126103)) (size!1562 (buf!1952 (_2!3672 lt!126103)))))))

(assert (=> d!25050 (= (readerFrom!0 (_2!3672 lt!126103) (currentBit!3818 thiss!1107) (currentByte!3823 thiss!1107)) (BitStream!2687 (buf!1952 (_2!3672 lt!126103)) (currentByte!3823 thiss!1107) (currentBit!3818 thiss!1107)))))

(declare-fun b!79361 () Bool)

(assert (=> b!79361 (= e!52086 (invariant!0 (currentBit!3818 thiss!1107) (currentByte!3823 thiss!1107) (size!1562 (buf!1952 (_2!3672 lt!126103)))))))

(assert (= (and d!25050 res!65707) b!79361))

(declare-fun m!124789 () Bool)

(assert (=> d!25050 m!124789))

(declare-fun m!124791 () Bool)

(assert (=> b!79361 m!124791))

(assert (=> b!79235 d!25050))

(declare-fun d!25052 () Bool)

(assert (=> d!25052 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!1562 (buf!1952 thiss!1107))) ((_ sign_extend 32) (currentByte!3823 thiss!1107)) ((_ sign_extend 32) (currentBit!3818 thiss!1107))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1562 (buf!1952 thiss!1107))) ((_ sign_extend 32) (currentByte!3823 thiss!1107)) ((_ sign_extend 32) (currentBit!3818 thiss!1107))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!6070 () Bool)

(assert (= bs!6070 d!25052))

(assert (=> bs!6070 m!124785))

(assert (=> b!79230 d!25052))

(declare-fun d!25054 () Bool)

(declare-fun e!52091 () Bool)

(assert (=> d!25054 e!52091))

(declare-fun res!65716 () Bool)

(assert (=> d!25054 (=> (not res!65716) (not e!52091))))

(declare-fun lt!126263 () (_ BitVec 64))

(declare-fun lt!126266 () (_ BitVec 64))

(declare-fun lt!126264 () (_ BitVec 64))

(assert (=> d!25054 (= res!65716 (= lt!126266 (bvsub lt!126264 lt!126263)))))

(assert (=> d!25054 (or (= (bvand lt!126264 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!126263 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!126264 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!126264 lt!126263) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!25054 (= lt!126263 (remainingBits!0 ((_ sign_extend 32) (size!1562 (buf!1952 (_2!3672 lt!126103)))) ((_ sign_extend 32) (currentByte!3823 (_2!3672 lt!126103))) ((_ sign_extend 32) (currentBit!3818 (_2!3672 lt!126103)))))))

(declare-fun lt!126265 () (_ BitVec 64))

(declare-fun lt!126261 () (_ BitVec 64))

(assert (=> d!25054 (= lt!126264 (bvmul lt!126265 lt!126261))))

(assert (=> d!25054 (or (= lt!126265 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!126261 (bvsdiv (bvmul lt!126265 lt!126261) lt!126265)))))

(assert (=> d!25054 (= lt!126261 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!25054 (= lt!126265 ((_ sign_extend 32) (size!1562 (buf!1952 (_2!3672 lt!126103)))))))

(assert (=> d!25054 (= lt!126266 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3823 (_2!3672 lt!126103))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3818 (_2!3672 lt!126103)))))))

(assert (=> d!25054 (invariant!0 (currentBit!3818 (_2!3672 lt!126103)) (currentByte!3823 (_2!3672 lt!126103)) (size!1562 (buf!1952 (_2!3672 lt!126103))))))

(assert (=> d!25054 (= (bitIndex!0 (size!1562 (buf!1952 (_2!3672 lt!126103))) (currentByte!3823 (_2!3672 lt!126103)) (currentBit!3818 (_2!3672 lt!126103))) lt!126266)))

(declare-fun b!79371 () Bool)

(declare-fun res!65717 () Bool)

(assert (=> b!79371 (=> (not res!65717) (not e!52091))))

(assert (=> b!79371 (= res!65717 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!126266))))

(declare-fun b!79372 () Bool)

(declare-fun lt!126262 () (_ BitVec 64))

(assert (=> b!79372 (= e!52091 (bvsle lt!126266 (bvmul lt!126262 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!79372 (or (= lt!126262 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!126262 #b0000000000000000000000000000000000000000000000000000000000001000) lt!126262)))))

(assert (=> b!79372 (= lt!126262 ((_ sign_extend 32) (size!1562 (buf!1952 (_2!3672 lt!126103)))))))

(assert (= (and d!25054 res!65716) b!79371))

(assert (= (and b!79371 res!65717) b!79372))

(declare-fun m!124793 () Bool)

(assert (=> d!25054 m!124793))

(assert (=> d!25054 m!124789))

(assert (=> b!79232 d!25054))

(assert (=> b!79232 d!25040))

(declare-fun d!25056 () Bool)

(declare-fun e!52092 () Bool)

(assert (=> d!25056 e!52092))

(declare-fun res!65718 () Bool)

(assert (=> d!25056 (=> (not res!65718) (not e!52092))))

(declare-fun lt!126270 () (_ BitVec 64))

(declare-fun lt!126269 () (_ BitVec 64))

(declare-fun lt!126272 () (_ BitVec 64))

(assert (=> d!25056 (= res!65718 (= lt!126272 (bvsub lt!126270 lt!126269)))))

(assert (=> d!25056 (or (= (bvand lt!126270 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!126269 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!126270 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!126270 lt!126269) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!25056 (= lt!126269 (remainingBits!0 ((_ sign_extend 32) (size!1562 (buf!1952 (_1!3673 lt!126099)))) ((_ sign_extend 32) (currentByte!3823 (_1!3673 lt!126099))) ((_ sign_extend 32) (currentBit!3818 (_1!3673 lt!126099)))))))

(declare-fun lt!126271 () (_ BitVec 64))

(declare-fun lt!126267 () (_ BitVec 64))

(assert (=> d!25056 (= lt!126270 (bvmul lt!126271 lt!126267))))

(assert (=> d!25056 (or (= lt!126271 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!126267 (bvsdiv (bvmul lt!126271 lt!126267) lt!126271)))))

(assert (=> d!25056 (= lt!126267 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!25056 (= lt!126271 ((_ sign_extend 32) (size!1562 (buf!1952 (_1!3673 lt!126099)))))))

(assert (=> d!25056 (= lt!126272 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3823 (_1!3673 lt!126099))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3818 (_1!3673 lt!126099)))))))

(assert (=> d!25056 (invariant!0 (currentBit!3818 (_1!3673 lt!126099)) (currentByte!3823 (_1!3673 lt!126099)) (size!1562 (buf!1952 (_1!3673 lt!126099))))))

(assert (=> d!25056 (= (bitIndex!0 (size!1562 (buf!1952 (_1!3673 lt!126099))) (currentByte!3823 (_1!3673 lt!126099)) (currentBit!3818 (_1!3673 lt!126099))) lt!126272)))

(declare-fun b!79373 () Bool)

(declare-fun res!65719 () Bool)

(assert (=> b!79373 (=> (not res!65719) (not e!52092))))

(assert (=> b!79373 (= res!65719 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!126272))))

(declare-fun b!79374 () Bool)

(declare-fun lt!126268 () (_ BitVec 64))

(assert (=> b!79374 (= e!52092 (bvsle lt!126272 (bvmul lt!126268 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!79374 (or (= lt!126268 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!126268 #b0000000000000000000000000000000000000000000000000000000000001000) lt!126268)))))

(assert (=> b!79374 (= lt!126268 ((_ sign_extend 32) (size!1562 (buf!1952 (_1!3673 lt!126099)))))))

(assert (= (and d!25056 res!65718) b!79373))

(assert (= (and b!79373 res!65719) b!79374))

(declare-fun m!124795 () Bool)

(assert (=> d!25056 m!124795))

(declare-fun m!124797 () Bool)

(assert (=> d!25056 m!124797))

(assert (=> b!79231 d!25056))

(push 1)

(assert (not b!79347))

(assert (not b!79318))

(assert (not b!79349))

(assert (not b!79319))

(assert (not d!25038))

(assert (not d!25040))

(assert (not d!25056))

(assert (not b!79361))

(assert (not d!25052))

(assert (not d!25054))

(assert (not d!25050))

(assert (not d!25048))

(assert (not b!79320))

(assert (not d!25020))

(assert (not b!79321))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

