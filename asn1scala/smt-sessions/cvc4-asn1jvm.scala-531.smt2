; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15532 () Bool)

(assert start!15532)

(declare-fun b!78750 () Bool)

(declare-fun e!51672 () Bool)

(declare-fun e!51678 () Bool)

(assert (=> b!78750 (= e!51672 (not e!51678))))

(declare-fun res!65140 () Bool)

(assert (=> b!78750 (=> res!65140 e!51678)))

(declare-datatypes ((array!3356 0))(
  ( (array!3357 (arr!2153 (Array (_ BitVec 32) (_ BitVec 8))) (size!1552 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2666 0))(
  ( (BitStream!2667 (buf!1942 array!3356) (currentByte!3798 (_ BitVec 32)) (currentBit!3793 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!5189 0))(
  ( (Unit!5190) )
))
(declare-datatypes ((tuple2!7018 0))(
  ( (tuple2!7019 (_1!3646 Unit!5189) (_2!3646 BitStream!2666)) )
))
(declare-fun lt!125645 () tuple2!7018)

(declare-fun thiss!1107 () BitStream!2666)

(assert (=> b!78750 (= res!65140 (not (= (size!1552 (buf!1942 (_2!3646 lt!125645))) (size!1552 (buf!1942 thiss!1107)))))))

(declare-fun e!51677 () Bool)

(assert (=> b!78750 e!51677))

(declare-fun res!65133 () Bool)

(assert (=> b!78750 (=> (not res!65133) (not e!51677))))

(assert (=> b!78750 (= res!65133 (= (size!1552 (buf!1942 thiss!1107)) (size!1552 (buf!1942 (_2!3646 lt!125645)))))))

(declare-fun lt!125648 () Bool)

(declare-fun appendBit!0 (BitStream!2666 Bool) tuple2!7018)

(assert (=> b!78750 (= lt!125645 (appendBit!0 thiss!1107 lt!125648))))

(declare-fun b!215 () (_ BitVec 8))

(declare-fun bitNr!1 () (_ BitVec 32))

(assert (=> b!78750 (= lt!125648 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) b!215))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) bitNr!1))) #b00000000000000000000000000000000)))))

(declare-fun b!78751 () Bool)

(declare-fun e!51675 () Bool)

(declare-fun e!51673 () Bool)

(assert (=> b!78751 (= e!51675 e!51673)))

(declare-fun res!65137 () Bool)

(assert (=> b!78751 (=> (not res!65137) (not e!51673))))

(declare-datatypes ((tuple2!7020 0))(
  ( (tuple2!7021 (_1!3647 BitStream!2666) (_2!3647 Bool)) )
))
(declare-fun lt!125647 () tuple2!7020)

(assert (=> b!78751 (= res!65137 (and (= (_2!3647 lt!125647) lt!125648) (= (_1!3647 lt!125647) (_2!3646 lt!125645))))))

(declare-fun readBitPure!0 (BitStream!2666) tuple2!7020)

(declare-fun readerFrom!0 (BitStream!2666 (_ BitVec 32) (_ BitVec 32)) BitStream!2666)

(assert (=> b!78751 (= lt!125647 (readBitPure!0 (readerFrom!0 (_2!3646 lt!125645) (currentBit!3793 thiss!1107) (currentByte!3798 thiss!1107))))))

(declare-fun b!78752 () Bool)

(declare-fun lt!125646 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!78752 (= e!51673 (= (bitIndex!0 (size!1552 (buf!1942 (_1!3647 lt!125647))) (currentByte!3798 (_1!3647 lt!125647)) (currentBit!3793 (_1!3647 lt!125647))) lt!125646))))

(declare-fun b!78753 () Bool)

(declare-fun res!65132 () Bool)

(assert (=> b!78753 (=> (not res!65132) (not e!51675))))

(declare-fun isPrefixOf!0 (BitStream!2666 BitStream!2666) Bool)

(assert (=> b!78753 (= res!65132 (isPrefixOf!0 thiss!1107 (_2!3646 lt!125645)))))

(declare-fun b!78755 () Bool)

(assert (=> b!78755 (= e!51677 e!51675)))

(declare-fun res!65134 () Bool)

(assert (=> b!78755 (=> (not res!65134) (not e!51675))))

(declare-fun lt!125644 () (_ BitVec 64))

(assert (=> b!78755 (= res!65134 (= lt!125646 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!125644)))))

(assert (=> b!78755 (= lt!125646 (bitIndex!0 (size!1552 (buf!1942 (_2!3646 lt!125645))) (currentByte!3798 (_2!3646 lt!125645)) (currentBit!3793 (_2!3646 lt!125645))))))

(assert (=> b!78755 (= lt!125644 (bitIndex!0 (size!1552 (buf!1942 thiss!1107)) (currentByte!3798 thiss!1107) (currentBit!3793 thiss!1107)))))

(declare-fun b!78756 () Bool)

(declare-fun res!65136 () Bool)

(assert (=> b!78756 (=> res!65136 e!51678)))

(assert (=> b!78756 (= res!65136 (not (= (bitIndex!0 (size!1552 (buf!1942 (_2!3646 lt!125645))) (currentByte!3798 (_2!3646 lt!125645)) (currentBit!3793 (_2!3646 lt!125645))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!1552 (buf!1942 thiss!1107)) (currentByte!3798 thiss!1107) (currentBit!3793 thiss!1107))))))))

(declare-fun b!78757 () Bool)

(declare-fun lt!125649 () BitStream!2666)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!78757 (= e!51678 (validate_offset_bit!0 ((_ sign_extend 32) (size!1552 (buf!1942 lt!125649))) ((_ sign_extend 32) (currentByte!3798 lt!125649)) ((_ sign_extend 32) (currentBit!3793 lt!125649))))))

(assert (=> b!78757 (= lt!125649 (readerFrom!0 (_2!3646 lt!125645) (currentBit!3793 thiss!1107) (currentByte!3798 thiss!1107)))))

(declare-fun b!78758 () Bool)

(declare-fun res!65138 () Bool)

(assert (=> b!78758 (=> res!65138 e!51678)))

(assert (=> b!78758 (= res!65138 (not (isPrefixOf!0 thiss!1107 (_2!3646 lt!125645))))))

(declare-fun b!78759 () Bool)

(declare-fun res!65139 () Bool)

(assert (=> b!78759 (=> (not res!65139) (not e!51672))))

(assert (=> b!78759 (= res!65139 (validate_offset_bit!0 ((_ sign_extend 32) (size!1552 (buf!1942 thiss!1107))) ((_ sign_extend 32) (currentByte!3798 thiss!1107)) ((_ sign_extend 32) (currentBit!3793 thiss!1107))))))

(declare-fun b!78754 () Bool)

(declare-fun e!51674 () Bool)

(declare-fun array_inv!1398 (array!3356) Bool)

(assert (=> b!78754 (= e!51674 (array_inv!1398 (buf!1942 thiss!1107)))))

(declare-fun res!65135 () Bool)

(assert (=> start!15532 (=> (not res!65135) (not e!51672))))

(assert (=> start!15532 (= res!65135 (and (bvsge bitNr!1 #b00000000000000000000000000000000) (bvslt bitNr!1 #b00000000000000000000000000001000)))))

(assert (=> start!15532 e!51672))

(assert (=> start!15532 true))

(declare-fun inv!12 (BitStream!2666) Bool)

(assert (=> start!15532 (and (inv!12 thiss!1107) e!51674)))

(assert (= (and start!15532 res!65135) b!78759))

(assert (= (and b!78759 res!65139) b!78750))

(assert (= (and b!78750 res!65133) b!78755))

(assert (= (and b!78755 res!65134) b!78753))

(assert (= (and b!78753 res!65132) b!78751))

(assert (= (and b!78751 res!65137) b!78752))

(assert (= (and b!78750 (not res!65140)) b!78756))

(assert (= (and b!78756 (not res!65136)) b!78758))

(assert (= (and b!78758 (not res!65138)) b!78757))

(assert (= start!15532 b!78754))

(declare-fun m!124227 () Bool)

(assert (=> b!78758 m!124227))

(declare-fun m!124229 () Bool)

(assert (=> b!78759 m!124229))

(declare-fun m!124231 () Bool)

(assert (=> b!78752 m!124231))

(declare-fun m!124233 () Bool)

(assert (=> b!78755 m!124233))

(declare-fun m!124235 () Bool)

(assert (=> b!78755 m!124235))

(declare-fun m!124237 () Bool)

(assert (=> b!78754 m!124237))

(declare-fun m!124239 () Bool)

(assert (=> b!78751 m!124239))

(assert (=> b!78751 m!124239))

(declare-fun m!124241 () Bool)

(assert (=> b!78751 m!124241))

(declare-fun m!124243 () Bool)

(assert (=> b!78750 m!124243))

(declare-fun m!124245 () Bool)

(assert (=> b!78750 m!124245))

(declare-fun m!124247 () Bool)

(assert (=> b!78757 m!124247))

(assert (=> b!78757 m!124239))

(assert (=> b!78753 m!124227))

(assert (=> b!78756 m!124233))

(assert (=> b!78756 m!124235))

(declare-fun m!124249 () Bool)

(assert (=> start!15532 m!124249))

(push 1)

(assert (not b!78756))

(assert (not b!78757))

(assert (not b!78752))

(assert (not start!15532))

(assert (not b!78759))

(assert (not b!78751))

(assert (not b!78753))

(assert (not b!78750))

(assert (not b!78758))

(assert (not b!78754))

(assert (not b!78755))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!24886 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!24886 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!1552 (buf!1942 lt!125649))) ((_ sign_extend 32) (currentByte!3798 lt!125649)) ((_ sign_extend 32) (currentBit!3793 lt!125649))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1552 (buf!1942 lt!125649))) ((_ sign_extend 32) (currentByte!3798 lt!125649)) ((_ sign_extend 32) (currentBit!3793 lt!125649))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!6029 () Bool)

(assert (= bs!6029 d!24886))

(declare-fun m!124277 () Bool)

(assert (=> bs!6029 m!124277))

(assert (=> b!78757 d!24886))

(declare-fun d!24888 () Bool)

(declare-fun e!51707 () Bool)

(assert (=> d!24888 e!51707))

(declare-fun res!65189 () Bool)

(assert (=> d!24888 (=> (not res!65189) (not e!51707))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!24888 (= res!65189 (invariant!0 (currentBit!3793 (_2!3646 lt!125645)) (currentByte!3798 (_2!3646 lt!125645)) (size!1552 (buf!1942 (_2!3646 lt!125645)))))))

(assert (=> d!24888 (= (readerFrom!0 (_2!3646 lt!125645) (currentBit!3793 thiss!1107) (currentByte!3798 thiss!1107)) (BitStream!2667 (buf!1942 (_2!3646 lt!125645)) (currentByte!3798 thiss!1107) (currentBit!3793 thiss!1107)))))

(declare-fun b!78806 () Bool)

(assert (=> b!78806 (= e!51707 (invariant!0 (currentBit!3793 thiss!1107) (currentByte!3798 thiss!1107) (size!1552 (buf!1942 (_2!3646 lt!125645)))))))

(assert (= (and d!24888 res!65189) b!78806))

(declare-fun m!124295 () Bool)

(assert (=> d!24888 m!124295))

(declare-fun m!124297 () Bool)

(assert (=> b!78806 m!124297))

(assert (=> b!78757 d!24888))

(declare-fun d!24894 () Bool)

(declare-fun res!65206 () Bool)

(declare-fun e!51718 () Bool)

(assert (=> d!24894 (=> (not res!65206) (not e!51718))))

(assert (=> d!24894 (= res!65206 (= (size!1552 (buf!1942 thiss!1107)) (size!1552 (buf!1942 (_2!3646 lt!125645)))))))

(assert (=> d!24894 (= (isPrefixOf!0 thiss!1107 (_2!3646 lt!125645)) e!51718)))

(declare-fun b!78823 () Bool)

(declare-fun res!65208 () Bool)

(assert (=> b!78823 (=> (not res!65208) (not e!51718))))

(assert (=> b!78823 (= res!65208 (bvsle (bitIndex!0 (size!1552 (buf!1942 thiss!1107)) (currentByte!3798 thiss!1107) (currentBit!3793 thiss!1107)) (bitIndex!0 (size!1552 (buf!1942 (_2!3646 lt!125645))) (currentByte!3798 (_2!3646 lt!125645)) (currentBit!3793 (_2!3646 lt!125645)))))))

(declare-fun b!78824 () Bool)

(declare-fun e!51719 () Bool)

(assert (=> b!78824 (= e!51718 e!51719)))

(declare-fun res!65207 () Bool)

(assert (=> b!78824 (=> res!65207 e!51719)))

(assert (=> b!78824 (= res!65207 (= (size!1552 (buf!1942 thiss!1107)) #b00000000000000000000000000000000))))

(declare-fun b!78825 () Bool)

(declare-fun arrayBitRangesEq!0 (array!3356 array!3356 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!78825 (= e!51719 (arrayBitRangesEq!0 (buf!1942 thiss!1107) (buf!1942 (_2!3646 lt!125645)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1552 (buf!1942 thiss!1107)) (currentByte!3798 thiss!1107) (currentBit!3793 thiss!1107))))))

(assert (= (and d!24894 res!65206) b!78823))

(assert (= (and b!78823 res!65208) b!78824))

(assert (= (and b!78824 (not res!65207)) b!78825))

(assert (=> b!78823 m!124235))

(assert (=> b!78823 m!124233))

(assert (=> b!78825 m!124235))

(assert (=> b!78825 m!124235))

(declare-fun m!124305 () Bool)

(assert (=> b!78825 m!124305))

(assert (=> b!78758 d!24894))

(declare-fun d!24902 () Bool)

(declare-fun e!51724 () Bool)

(assert (=> d!24902 e!51724))

(declare-fun res!65217 () Bool)

(assert (=> d!24902 (=> (not res!65217) (not e!51724))))

(declare-fun lt!125740 () (_ BitVec 64))

(declare-fun lt!125739 () (_ BitVec 64))

(declare-fun lt!125737 () (_ BitVec 64))

(assert (=> d!24902 (= res!65217 (= lt!125737 (bvsub lt!125739 lt!125740)))))

(assert (=> d!24902 (or (= (bvand lt!125739 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!125740 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!125739 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!125739 lt!125740) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!24902 (= lt!125740 (remainingBits!0 ((_ sign_extend 32) (size!1552 (buf!1942 (_2!3646 lt!125645)))) ((_ sign_extend 32) (currentByte!3798 (_2!3646 lt!125645))) ((_ sign_extend 32) (currentBit!3793 (_2!3646 lt!125645)))))))

(declare-fun lt!125738 () (_ BitVec 64))

(declare-fun lt!125741 () (_ BitVec 64))

(assert (=> d!24902 (= lt!125739 (bvmul lt!125738 lt!125741))))

(assert (=> d!24902 (or (= lt!125738 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!125741 (bvsdiv (bvmul lt!125738 lt!125741) lt!125738)))))

(assert (=> d!24902 (= lt!125741 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!24902 (= lt!125738 ((_ sign_extend 32) (size!1552 (buf!1942 (_2!3646 lt!125645)))))))

(assert (=> d!24902 (= lt!125737 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3798 (_2!3646 lt!125645))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3793 (_2!3646 lt!125645)))))))

(assert (=> d!24902 (invariant!0 (currentBit!3793 (_2!3646 lt!125645)) (currentByte!3798 (_2!3646 lt!125645)) (size!1552 (buf!1942 (_2!3646 lt!125645))))))

(assert (=> d!24902 (= (bitIndex!0 (size!1552 (buf!1942 (_2!3646 lt!125645))) (currentByte!3798 (_2!3646 lt!125645)) (currentBit!3793 (_2!3646 lt!125645))) lt!125737)))

(declare-fun b!78833 () Bool)

(declare-fun res!65216 () Bool)

(assert (=> b!78833 (=> (not res!65216) (not e!51724))))

(assert (=> b!78833 (= res!65216 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!125737))))

(declare-fun b!78834 () Bool)

(declare-fun lt!125742 () (_ BitVec 64))

(assert (=> b!78834 (= e!51724 (bvsle lt!125737 (bvmul lt!125742 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!78834 (or (= lt!125742 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!125742 #b0000000000000000000000000000000000000000000000000000000000001000) lt!125742)))))

(assert (=> b!78834 (= lt!125742 ((_ sign_extend 32) (size!1552 (buf!1942 (_2!3646 lt!125645)))))))

(assert (= (and d!24902 res!65217) b!78833))

(assert (= (and b!78833 res!65216) b!78834))

(declare-fun m!124309 () Bool)

(assert (=> d!24902 m!124309))

(assert (=> d!24902 m!124295))

(assert (=> b!78756 d!24902))

(declare-fun d!24908 () Bool)

(declare-fun e!51725 () Bool)

(assert (=> d!24908 e!51725))

(declare-fun res!65219 () Bool)

(assert (=> d!24908 (=> (not res!65219) (not e!51725))))

(declare-fun lt!125745 () (_ BitVec 64))

(declare-fun lt!125746 () (_ BitVec 64))

(declare-fun lt!125743 () (_ BitVec 64))

(assert (=> d!24908 (= res!65219 (= lt!125743 (bvsub lt!125745 lt!125746)))))

(assert (=> d!24908 (or (= (bvand lt!125745 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!125746 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!125745 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!125745 lt!125746) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!24908 (= lt!125746 (remainingBits!0 ((_ sign_extend 32) (size!1552 (buf!1942 thiss!1107))) ((_ sign_extend 32) (currentByte!3798 thiss!1107)) ((_ sign_extend 32) (currentBit!3793 thiss!1107))))))

(declare-fun lt!125744 () (_ BitVec 64))

(declare-fun lt!125747 () (_ BitVec 64))

(assert (=> d!24908 (= lt!125745 (bvmul lt!125744 lt!125747))))

(assert (=> d!24908 (or (= lt!125744 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!125747 (bvsdiv (bvmul lt!125744 lt!125747) lt!125744)))))

(assert (=> d!24908 (= lt!125747 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!24908 (= lt!125744 ((_ sign_extend 32) (size!1552 (buf!1942 thiss!1107))))))

(assert (=> d!24908 (= lt!125743 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3798 thiss!1107)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3793 thiss!1107))))))

(assert (=> d!24908 (invariant!0 (currentBit!3793 thiss!1107) (currentByte!3798 thiss!1107) (size!1552 (buf!1942 thiss!1107)))))

(assert (=> d!24908 (= (bitIndex!0 (size!1552 (buf!1942 thiss!1107)) (currentByte!3798 thiss!1107) (currentBit!3793 thiss!1107)) lt!125743)))

(declare-fun b!78835 () Bool)

(declare-fun res!65218 () Bool)

(assert (=> b!78835 (=> (not res!65218) (not e!51725))))

(assert (=> b!78835 (= res!65218 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!125743))))

(declare-fun b!78836 () Bool)

(declare-fun lt!125748 () (_ BitVec 64))

(assert (=> b!78836 (= e!51725 (bvsle lt!125743 (bvmul lt!125748 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!78836 (or (= lt!125748 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!125748 #b0000000000000000000000000000000000000000000000000000000000001000) lt!125748)))))

(assert (=> b!78836 (= lt!125748 ((_ sign_extend 32) (size!1552 (buf!1942 thiss!1107))))))

(assert (= (and d!24908 res!65219) b!78835))

(assert (= (and b!78835 res!65218) b!78836))

(declare-fun m!124311 () Bool)

(assert (=> d!24908 m!124311))

(declare-fun m!124313 () Bool)

(assert (=> d!24908 m!124313))

(assert (=> b!78756 d!24908))

(declare-fun d!24910 () Bool)

(declare-fun e!51736 () Bool)

(assert (=> d!24910 e!51736))

(declare-fun res!65242 () Bool)

(assert (=> d!24910 (=> (not res!65242) (not e!51736))))

(declare-fun lt!125773 () tuple2!7018)

(assert (=> d!24910 (= res!65242 (= (size!1552 (buf!1942 thiss!1107)) (size!1552 (buf!1942 (_2!3646 lt!125773)))))))

(declare-fun choose!16 (BitStream!2666 Bool) tuple2!7018)

(assert (=> d!24910 (= lt!125773 (choose!16 thiss!1107 lt!125648))))

(assert (=> d!24910 (validate_offset_bit!0 ((_ sign_extend 32) (size!1552 (buf!1942 thiss!1107))) ((_ sign_extend 32) (currentByte!3798 thiss!1107)) ((_ sign_extend 32) (currentBit!3793 thiss!1107)))))

(assert (=> d!24910 (= (appendBit!0 thiss!1107 lt!125648) lt!125773)))

(declare-fun b!78862 () Bool)

(declare-fun e!51737 () Bool)

(declare-fun lt!125772 () tuple2!7020)

(assert (=> b!78862 (= e!51737 (= (bitIndex!0 (size!1552 (buf!1942 (_1!3647 lt!125772))) (currentByte!3798 (_1!3647 lt!125772)) (currentBit!3793 (_1!3647 lt!125772))) (bitIndex!0 (size!1552 (buf!1942 (_2!3646 lt!125773))) (currentByte!3798 (_2!3646 lt!125773)) (currentBit!3793 (_2!3646 lt!125773)))))))

(declare-fun b!78860 () Bool)

(declare-fun res!65241 () Bool)

(assert (=> b!78860 (=> (not res!65241) (not e!51736))))

(assert (=> b!78860 (= res!65241 (isPrefixOf!0 thiss!1107 (_2!3646 lt!125773)))))

(declare-fun b!78861 () Bool)

(assert (=> b!78861 (= e!51736 e!51737)))

(declare-fun res!65240 () Bool)

(assert (=> b!78861 (=> (not res!65240) (not e!51737))))

(assert (=> b!78861 (= res!65240 (and (= (_2!3647 lt!125772) lt!125648) (= (_1!3647 lt!125772) (_2!3646 lt!125773))))))

(assert (=> b!78861 (= lt!125772 (readBitPure!0 (readerFrom!0 (_2!3646 lt!125773) (currentBit!3793 thiss!1107) (currentByte!3798 thiss!1107))))))

(declare-fun b!78859 () Bool)

(declare-fun res!65243 () Bool)

(assert (=> b!78859 (=> (not res!65243) (not e!51736))))

(declare-fun lt!125774 () (_ BitVec 64))

(declare-fun lt!125775 () (_ BitVec 64))

(assert (=> b!78859 (= res!65243 (= (bitIndex!0 (size!1552 (buf!1942 (_2!3646 lt!125773))) (currentByte!3798 (_2!3646 lt!125773)) (currentBit!3793 (_2!3646 lt!125773))) (bvadd lt!125774 lt!125775)))))

(assert (=> b!78859 (or (not (= (bvand lt!125774 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!125775 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!125774 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!125774 lt!125775) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!78859 (= lt!125775 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!78859 (= lt!125774 (bitIndex!0 (size!1552 (buf!1942 thiss!1107)) (currentByte!3798 thiss!1107) (currentBit!3793 thiss!1107)))))

(assert (= (and d!24910 res!65242) b!78859))

(assert (= (and b!78859 res!65243) b!78860))

(assert (= (and b!78860 res!65241) b!78861))

(assert (= (and b!78861 res!65240) b!78862))

(declare-fun m!124329 () Bool)

(assert (=> b!78861 m!124329))

(assert (=> b!78861 m!124329))

(declare-fun m!124331 () Bool)

(assert (=> b!78861 m!124331))

(declare-fun m!124333 () Bool)

(assert (=> b!78859 m!124333))

(assert (=> b!78859 m!124235))

(declare-fun m!124335 () Bool)

(assert (=> b!78862 m!124335))

(assert (=> b!78862 m!124333))

(declare-fun m!124337 () Bool)

(assert (=> b!78860 m!124337))

(declare-fun m!124339 () Bool)

(assert (=> d!24910 m!124339))

(assert (=> d!24910 m!124229))

(assert (=> b!78750 d!24910))

(declare-fun d!24914 () Bool)

(assert (=> d!24914 (= (inv!12 thiss!1107) (invariant!0 (currentBit!3793 thiss!1107) (currentByte!3798 thiss!1107) (size!1552 (buf!1942 thiss!1107))))))

(declare-fun bs!6033 () Bool)

(assert (= bs!6033 d!24914))

(assert (=> bs!6033 m!124313))

(assert (=> start!15532 d!24914))

(declare-fun d!24916 () Bool)

(assert (=> d!24916 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!1552 (buf!1942 thiss!1107))) ((_ sign_extend 32) (currentByte!3798 thiss!1107)) ((_ sign_extend 32) (currentBit!3793 thiss!1107))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1552 (buf!1942 thiss!1107))) ((_ sign_extend 32) (currentByte!3798 thiss!1107)) ((_ sign_extend 32) (currentBit!3793 thiss!1107))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!6034 () Bool)

(assert (= bs!6034 d!24916))

(assert (=> bs!6034 m!124311))

(assert (=> b!78759 d!24916))

(declare-fun d!24918 () Bool)

(declare-fun e!51738 () Bool)

(assert (=> d!24918 e!51738))

(declare-fun res!65245 () Bool)

(assert (=> d!24918 (=> (not res!65245) (not e!51738))))

(declare-fun lt!125779 () (_ BitVec 64))

(declare-fun lt!125776 () (_ BitVec 64))

(declare-fun lt!125778 () (_ BitVec 64))

(assert (=> d!24918 (= res!65245 (= lt!125776 (bvsub lt!125778 lt!125779)))))

(assert (=> d!24918 (or (= (bvand lt!125778 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!125779 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!125778 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!125778 lt!125779) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!24918 (= lt!125779 (remainingBits!0 ((_ sign_extend 32) (size!1552 (buf!1942 (_1!3647 lt!125647)))) ((_ sign_extend 32) (currentByte!3798 (_1!3647 lt!125647))) ((_ sign_extend 32) (currentBit!3793 (_1!3647 lt!125647)))))))

(declare-fun lt!125777 () (_ BitVec 64))

(declare-fun lt!125780 () (_ BitVec 64))

(assert (=> d!24918 (= lt!125778 (bvmul lt!125777 lt!125780))))

(assert (=> d!24918 (or (= lt!125777 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!125780 (bvsdiv (bvmul lt!125777 lt!125780) lt!125777)))))

(assert (=> d!24918 (= lt!125780 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!24918 (= lt!125777 ((_ sign_extend 32) (size!1552 (buf!1942 (_1!3647 lt!125647)))))))

(assert (=> d!24918 (= lt!125776 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3798 (_1!3647 lt!125647))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3793 (_1!3647 lt!125647)))))))

(assert (=> d!24918 (invariant!0 (currentBit!3793 (_1!3647 lt!125647)) (currentByte!3798 (_1!3647 lt!125647)) (size!1552 (buf!1942 (_1!3647 lt!125647))))))

(assert (=> d!24918 (= (bitIndex!0 (size!1552 (buf!1942 (_1!3647 lt!125647))) (currentByte!3798 (_1!3647 lt!125647)) (currentBit!3793 (_1!3647 lt!125647))) lt!125776)))

(declare-fun b!78863 () Bool)

(declare-fun res!65244 () Bool)

(assert (=> b!78863 (=> (not res!65244) (not e!51738))))

(assert (=> b!78863 (= res!65244 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!125776))))

(declare-fun b!78864 () Bool)

(declare-fun lt!125781 () (_ BitVec 64))

(assert (=> b!78864 (= e!51738 (bvsle lt!125776 (bvmul lt!125781 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!78864 (or (= lt!125781 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!125781 #b0000000000000000000000000000000000000000000000000000000000001000) lt!125781)))))

(assert (=> b!78864 (= lt!125781 ((_ sign_extend 32) (size!1552 (buf!1942 (_1!3647 lt!125647)))))))

(assert (= (and d!24918 res!65245) b!78863))

(assert (= (and b!78863 res!65244) b!78864))

(declare-fun m!124341 () Bool)

(assert (=> d!24918 m!124341))

(declare-fun m!124343 () Bool)

(assert (=> d!24918 m!124343))

(assert (=> b!78752 d!24918))

(declare-fun d!24920 () Bool)

(declare-datatypes ((tuple2!7026 0))(
  ( (tuple2!7027 (_1!3650 Bool) (_2!3650 BitStream!2666)) )
))
(declare-fun lt!125784 () tuple2!7026)

(declare-fun readBit!0 (BitStream!2666) tuple2!7026)

(assert (=> d!24920 (= lt!125784 (readBit!0 (readerFrom!0 (_2!3646 lt!125645) (currentBit!3793 thiss!1107) (currentByte!3798 thiss!1107))))))

(assert (=> d!24920 (= (readBitPure!0 (readerFrom!0 (_2!3646 lt!125645) (currentBit!3793 thiss!1107) (currentByte!3798 thiss!1107))) (tuple2!7021 (_2!3650 lt!125784) (_1!3650 lt!125784)))))

(declare-fun bs!6035 () Bool)

(assert (= bs!6035 d!24920))

(assert (=> bs!6035 m!124239))

(declare-fun m!124345 () Bool)

(assert (=> bs!6035 m!124345))

(assert (=> b!78751 d!24920))

(assert (=> b!78751 d!24888))

(assert (=> b!78755 d!24902))

(assert (=> b!78755 d!24908))

(assert (=> b!78753 d!24894))

(declare-fun d!24922 () Bool)

(assert (=> d!24922 (= (array_inv!1398 (buf!1942 thiss!1107)) (bvsge (size!1552 (buf!1942 thiss!1107)) #b00000000000000000000000000000000))))

(assert (=> b!78754 d!24922))

(push 1)

(assert (not d!24920))

(assert (not b!78825))

(assert (not b!78859))

(assert (not d!24886))

(assert (not b!78861))

(assert (not d!24918))

(assert (not d!24902))

(assert (not b!78806))

(assert (not d!24888))

(assert (not d!24914))

(assert (not d!24916))

(assert (not b!78862))

(assert (not b!78860))

(assert (not b!78823))

(assert (not d!24910))

(assert (not d!24908))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

