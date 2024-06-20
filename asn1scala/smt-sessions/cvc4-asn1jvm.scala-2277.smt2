; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57652 () Bool)

(assert start!57652)

(declare-fun b!264548 () Bool)

(declare-fun e!184680 () Bool)

(declare-datatypes ((array!14754 0))(
  ( (array!14755 (arr!7425 (Array (_ BitVec 32) (_ BitVec 8))) (size!6438 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11690 0))(
  ( (BitStream!11691 (buf!6906 array!14754) (currentByte!12776 (_ BitVec 32)) (currentBit!12771 (_ BitVec 32))) )
))
(declare-fun w2!580 () BitStream!11690)

(declare-fun array_inv!6162 (array!14754) Bool)

(assert (=> b!264548 (= e!184680 (array_inv!6162 (buf!6906 w2!580)))))

(declare-fun b!264549 () Bool)

(declare-fun e!184675 () Bool)

(declare-fun w1!584 () BitStream!11690)

(declare-fun arrayBitRangesEq!0 (array!14754 array!14754 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!264549 (= e!184675 (not (arrayBitRangesEq!0 (buf!6906 w1!584) (buf!6906 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6438 (buf!6906 w1!584)) (currentByte!12776 w1!584) (currentBit!12771 w1!584)))))))

(declare-fun b!264550 () Bool)

(declare-fun e!184674 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!264550 (= e!184674 (invariant!0 (currentBit!12771 w2!580) (currentByte!12776 w2!580) (size!6438 (buf!6906 w2!580))))))

(declare-fun lt!405814 () (_ BitVec 64))

(assert (=> b!264550 (= lt!405814 (bitIndex!0 (size!6438 (buf!6906 w1!584)) (currentByte!12776 w1!584) (currentBit!12771 w1!584)))))

(declare-datatypes ((Unit!18845 0))(
  ( (Unit!18846) )
))
(declare-fun lt!405818 () Unit!18845)

(declare-fun lt!405815 () BitStream!11690)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!11690 BitStream!11690 BitStream!11690) Unit!18845)

(assert (=> b!264550 (= lt!405818 (lemmaIsPrefixTransitive!0 lt!405815 w2!580 w2!580))))

(declare-fun isPrefixOf!0 (BitStream!11690 BitStream!11690) Bool)

(assert (=> b!264550 (isPrefixOf!0 lt!405815 w2!580)))

(declare-fun lt!405812 () Unit!18845)

(assert (=> b!264550 (= lt!405812 (lemmaIsPrefixTransitive!0 lt!405815 w1!584 w2!580))))

(declare-fun res!221143 () Bool)

(declare-fun e!184679 () Bool)

(assert (=> start!57652 (=> (not res!221143) (not e!184679))))

(assert (=> start!57652 (= res!221143 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!57652 e!184679))

(declare-fun e!184681 () Bool)

(declare-fun inv!12 (BitStream!11690) Bool)

(assert (=> start!57652 (and (inv!12 w1!584) e!184681)))

(assert (=> start!57652 (and (inv!12 w2!580) e!184680)))

(declare-fun b!264551 () Bool)

(assert (=> b!264551 (= e!184681 (array_inv!6162 (buf!6906 w1!584)))))

(declare-fun b!264552 () Bool)

(declare-fun e!184677 () Bool)

(assert (=> b!264552 (= e!184677 (not (arrayBitRangesEq!0 (buf!6906 w2!580) (buf!6906 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6438 (buf!6906 w1!584)) (currentByte!12776 w1!584) (currentBit!12771 w1!584)))))))

(declare-fun b!264553 () Bool)

(declare-fun e!184683 () Unit!18845)

(declare-fun Unit!18847 () Unit!18845)

(assert (=> b!264553 (= e!184683 Unit!18847)))

(declare-fun b!264554 () Bool)

(declare-fun res!221146 () Bool)

(assert (=> b!264554 (=> res!221146 e!184674)))

(assert (=> b!264554 (= res!221146 (not (isPrefixOf!0 lt!405815 w1!584)))))

(declare-fun b!264555 () Bool)

(declare-fun e!184676 () Bool)

(assert (=> b!264555 (= e!184679 (not e!184676))))

(declare-fun res!221145 () Bool)

(assert (=> b!264555 (=> res!221145 e!184676)))

(assert (=> b!264555 (= res!221145 e!184675)))

(declare-fun res!221142 () Bool)

(assert (=> b!264555 (=> (not res!221142) (not e!184675))))

(assert (=> b!264555 (= res!221142 (not (= (size!6438 (buf!6906 w1!584)) #b00000000000000000000000000000000)))))

(assert (=> b!264555 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!405816 () Unit!18845)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11690) Unit!18845)

(assert (=> b!264555 (= lt!405816 (lemmaIsPrefixRefl!0 w2!580))))

(assert (=> b!264555 (isPrefixOf!0 lt!405815 lt!405815)))

(declare-fun lt!405817 () Unit!18845)

(assert (=> b!264555 (= lt!405817 (lemmaIsPrefixRefl!0 lt!405815))))

(assert (=> b!264555 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!405821 () Unit!18845)

(assert (=> b!264555 (= lt!405821 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!264555 (= lt!405815 (BitStream!11691 (buf!6906 w2!580) (currentByte!12776 w1!584) (currentBit!12771 w1!584)))))

(declare-fun b!264556 () Bool)

(declare-fun lt!405813 () Unit!18845)

(assert (=> b!264556 (= e!184683 lt!405813)))

(declare-fun lt!405820 () (_ BitVec 64))

(assert (=> b!264556 (= lt!405820 (bitIndex!0 (size!6438 (buf!6906 w1!584)) (currentByte!12776 w1!584) (currentBit!12771 w1!584)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!14754 array!14754 (_ BitVec 64) (_ BitVec 64)) Unit!18845)

(assert (=> b!264556 (= lt!405813 (arrayBitRangesEqSymmetric!0 (buf!6906 w1!584) (buf!6906 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!405820))))

(assert (=> b!264556 (arrayBitRangesEq!0 (buf!6906 w2!580) (buf!6906 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!405820)))

(declare-fun b!264557 () Bool)

(assert (=> b!264557 (= e!184676 e!184674)))

(declare-fun res!221141 () Bool)

(assert (=> b!264557 (=> res!221141 e!184674)))

(assert (=> b!264557 (= res!221141 e!184677)))

(declare-fun res!221144 () Bool)

(assert (=> b!264557 (=> (not res!221144) (not e!184677))))

(assert (=> b!264557 (= res!221144 (not (= (size!6438 (buf!6906 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun lt!405819 () Unit!18845)

(assert (=> b!264557 (= lt!405819 e!184683)))

(declare-fun c!12135 () Bool)

(assert (=> b!264557 (= c!12135 (not (= (size!6438 (buf!6906 w1!584)) #b00000000000000000000000000000000)))))

(assert (= (and start!57652 res!221143) b!264555))

(assert (= (and b!264555 res!221142) b!264549))

(assert (= (and b!264555 (not res!221145)) b!264557))

(assert (= (and b!264557 c!12135) b!264556))

(assert (= (and b!264557 (not c!12135)) b!264553))

(assert (= (and b!264557 res!221144) b!264552))

(assert (= (and b!264557 (not res!221141)) b!264554))

(assert (= (and b!264554 (not res!221146)) b!264550))

(assert (= start!57652 b!264551))

(assert (= start!57652 b!264548))

(declare-fun m!395075 () Bool)

(assert (=> b!264556 m!395075))

(declare-fun m!395077 () Bool)

(assert (=> b!264556 m!395077))

(declare-fun m!395079 () Bool)

(assert (=> b!264556 m!395079))

(declare-fun m!395081 () Bool)

(assert (=> b!264555 m!395081))

(declare-fun m!395083 () Bool)

(assert (=> b!264555 m!395083))

(declare-fun m!395085 () Bool)

(assert (=> b!264555 m!395085))

(declare-fun m!395087 () Bool)

(assert (=> b!264555 m!395087))

(declare-fun m!395089 () Bool)

(assert (=> b!264555 m!395089))

(declare-fun m!395091 () Bool)

(assert (=> b!264555 m!395091))

(assert (=> b!264550 m!395075))

(declare-fun m!395093 () Bool)

(assert (=> b!264550 m!395093))

(declare-fun m!395095 () Bool)

(assert (=> b!264550 m!395095))

(declare-fun m!395097 () Bool)

(assert (=> b!264550 m!395097))

(declare-fun m!395099 () Bool)

(assert (=> b!264550 m!395099))

(assert (=> b!264552 m!395075))

(assert (=> b!264552 m!395075))

(declare-fun m!395101 () Bool)

(assert (=> b!264552 m!395101))

(declare-fun m!395103 () Bool)

(assert (=> start!57652 m!395103))

(declare-fun m!395105 () Bool)

(assert (=> start!57652 m!395105))

(declare-fun m!395107 () Bool)

(assert (=> start!57652 m!395107))

(declare-fun m!395109 () Bool)

(assert (=> b!264554 m!395109))

(declare-fun m!395111 () Bool)

(assert (=> b!264548 m!395111))

(assert (=> b!264549 m!395075))

(assert (=> b!264549 m!395075))

(declare-fun m!395113 () Bool)

(assert (=> b!264549 m!395113))

(declare-fun m!395115 () Bool)

(assert (=> b!264551 m!395115))

(push 1)

(assert (not b!264551))

(assert (not b!264555))

(assert (not b!264549))

(assert (not b!264554))

(assert (not b!264548))

(assert (not b!264556))

(assert (not b!264552))

(assert (not start!57652))

(assert (not b!264550))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!89216 () Bool)

(declare-fun e!184701 () Bool)

(assert (=> d!89216 e!184701))

(declare-fun res!221167 () Bool)

(assert (=> d!89216 (=> (not res!221167) (not e!184701))))

(declare-fun lt!405866 () (_ BitVec 64))

(declare-fun lt!405861 () (_ BitVec 64))

(declare-fun lt!405865 () (_ BitVec 64))

(assert (=> d!89216 (= res!221167 (= lt!405861 (bvsub lt!405866 lt!405865)))))

(assert (=> d!89216 (or (= (bvand lt!405866 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!405865 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!405866 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!405866 lt!405865) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!89216 (= lt!405865 (remainingBits!0 ((_ sign_extend 32) (size!6438 (buf!6906 w1!584))) ((_ sign_extend 32) (currentByte!12776 w1!584)) ((_ sign_extend 32) (currentBit!12771 w1!584))))))

(declare-fun lt!405863 () (_ BitVec 64))

(declare-fun lt!405864 () (_ BitVec 64))

(assert (=> d!89216 (= lt!405866 (bvmul lt!405863 lt!405864))))

(assert (=> d!89216 (or (= lt!405863 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!405864 (bvsdiv (bvmul lt!405863 lt!405864) lt!405863)))))

(assert (=> d!89216 (= lt!405864 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!89216 (= lt!405863 ((_ sign_extend 32) (size!6438 (buf!6906 w1!584))))))

(assert (=> d!89216 (= lt!405861 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12776 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12771 w1!584))))))

(assert (=> d!89216 (invariant!0 (currentBit!12771 w1!584) (currentByte!12776 w1!584) (size!6438 (buf!6906 w1!584)))))

(assert (=> d!89216 (= (bitIndex!0 (size!6438 (buf!6906 w1!584)) (currentByte!12776 w1!584) (currentBit!12771 w1!584)) lt!405861)))

(declare-fun b!264582 () Bool)

(declare-fun res!221168 () Bool)

(assert (=> b!264582 (=> (not res!221168) (not e!184701))))

(assert (=> b!264582 (= res!221168 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!405861))))

(declare-fun b!264583 () Bool)

(declare-fun lt!405862 () (_ BitVec 64))

(assert (=> b!264583 (= e!184701 (bvsle lt!405861 (bvmul lt!405862 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!264583 (or (= lt!405862 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!405862 #b0000000000000000000000000000000000000000000000000000000000001000) lt!405862)))))

(assert (=> b!264583 (= lt!405862 ((_ sign_extend 32) (size!6438 (buf!6906 w1!584))))))

(assert (= (and d!89216 res!221167) b!264582))

(assert (= (and b!264582 res!221168) b!264583))

(declare-fun m!395123 () Bool)

(assert (=> d!89216 m!395123))

(declare-fun m!395125 () Bool)

(assert (=> d!89216 m!395125))

(assert (=> b!264556 d!89216))

(declare-fun d!89224 () Bool)

(assert (=> d!89224 (arrayBitRangesEq!0 (buf!6906 w2!580) (buf!6906 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!405820)))

(declare-fun lt!405874 () Unit!18845)

(declare-fun choose!8 (array!14754 array!14754 (_ BitVec 64) (_ BitVec 64)) Unit!18845)

(assert (=> d!89224 (= lt!405874 (choose!8 (buf!6906 w1!584) (buf!6906 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!405820))))

(assert (=> d!89224 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!405820))))

(assert (=> d!89224 (= (arrayBitRangesEqSymmetric!0 (buf!6906 w1!584) (buf!6906 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!405820) lt!405874)))

(declare-fun bs!22648 () Bool)

(assert (= bs!22648 d!89224))

(assert (=> bs!22648 m!395079))

(declare-fun m!395143 () Bool)

(assert (=> bs!22648 m!395143))

(assert (=> b!264556 d!89224))

(declare-fun b!264672 () Bool)

(declare-fun e!184772 () Bool)

(declare-fun e!184771 () Bool)

(assert (=> b!264672 (= e!184772 e!184771)))

(declare-fun res!221243 () Bool)

(assert (=> b!264672 (=> (not res!221243) (not e!184771))))

(declare-fun e!184774 () Bool)

(assert (=> b!264672 (= res!221243 e!184774)))

(declare-fun res!221247 () Bool)

(assert (=> b!264672 (=> res!221247 e!184774)))

(declare-datatypes ((tuple4!352 0))(
  ( (tuple4!353 (_1!12156 (_ BitVec 32)) (_2!12156 (_ BitVec 32)) (_3!956 (_ BitVec 32)) (_4!176 (_ BitVec 32))) )
))
(declare-fun lt!405921 () tuple4!352)

(assert (=> b!264672 (= res!221247 (bvsge (_1!12156 lt!405921) (_2!12156 lt!405921)))))

(declare-fun lt!405922 () (_ BitVec 32))

(assert (=> b!264672 (= lt!405922 ((_ extract 31 0) (bvsrem lt!405820 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!405923 () (_ BitVec 32))

(assert (=> b!264672 (= lt!405923 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!352)

(assert (=> b!264672 (= lt!405921 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!405820))))

(declare-fun b!264673 () Bool)

(declare-fun arrayRangesEq!1012 (array!14754 array!14754 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!264673 (= e!184774 (arrayRangesEq!1012 (buf!6906 w2!580) (buf!6906 w1!584) (_1!12156 lt!405921) (_2!12156 lt!405921)))))

(declare-fun b!264674 () Bool)

(declare-fun e!184773 () Bool)

(assert (=> b!264674 (= e!184771 e!184773)))

(declare-fun c!12145 () Bool)

(assert (=> b!264674 (= c!12145 (= (_3!956 lt!405921) (_4!176 lt!405921)))))

(declare-fun b!264675 () Bool)

(declare-fun call!4095 () Bool)

(assert (=> b!264675 (= e!184773 call!4095)))

(declare-fun b!264676 () Bool)

(declare-fun res!221244 () Bool)

(assert (=> b!264676 (= res!221244 (= lt!405922 #b00000000000000000000000000000000))))

(declare-fun e!184769 () Bool)

(assert (=> b!264676 (=> res!221244 e!184769)))

(declare-fun e!184770 () Bool)

(assert (=> b!264676 (= e!184770 e!184769)))

(declare-fun b!264677 () Bool)

(assert (=> b!264677 (= e!184773 e!184770)))

(declare-fun res!221246 () Bool)

(assert (=> b!264677 (= res!221246 call!4095)))

(assert (=> b!264677 (=> (not res!221246) (not e!184770))))

(declare-fun b!264678 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!264678 (= e!184769 (byteRangesEq!0 (select (arr!7425 (buf!6906 w2!580)) (_4!176 lt!405921)) (select (arr!7425 (buf!6906 w1!584)) (_4!176 lt!405921)) #b00000000000000000000000000000000 lt!405922))))

(declare-fun bm!4092 () Bool)

(assert (=> bm!4092 (= call!4095 (byteRangesEq!0 (select (arr!7425 (buf!6906 w2!580)) (_3!956 lt!405921)) (select (arr!7425 (buf!6906 w1!584)) (_3!956 lt!405921)) lt!405923 (ite c!12145 lt!405922 #b00000000000000000000000000001000)))))

(declare-fun d!89228 () Bool)

(declare-fun res!221245 () Bool)

(assert (=> d!89228 (=> res!221245 e!184772)))

(assert (=> d!89228 (= res!221245 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!405820))))

(assert (=> d!89228 (= (arrayBitRangesEq!0 (buf!6906 w2!580) (buf!6906 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!405820) e!184772)))

(assert (= (and d!89228 (not res!221245)) b!264672))

(assert (= (and b!264672 (not res!221247)) b!264673))

(assert (= (and b!264672 res!221243) b!264674))

(assert (= (and b!264674 c!12145) b!264675))

(assert (= (and b!264674 (not c!12145)) b!264677))

(assert (= (and b!264677 res!221246) b!264676))

(assert (= (and b!264676 (not res!221244)) b!264678))

(assert (= (or b!264675 b!264677) bm!4092))

(declare-fun m!395211 () Bool)

(assert (=> b!264672 m!395211))

(declare-fun m!395213 () Bool)

(assert (=> b!264673 m!395213))

(declare-fun m!395215 () Bool)

(assert (=> b!264678 m!395215))

(declare-fun m!395219 () Bool)

(assert (=> b!264678 m!395219))

(assert (=> b!264678 m!395215))

(assert (=> b!264678 m!395219))

(declare-fun m!395223 () Bool)

(assert (=> b!264678 m!395223))

(declare-fun m!395225 () Bool)

(assert (=> bm!4092 m!395225))

(declare-fun m!395227 () Bool)

(assert (=> bm!4092 m!395227))

(assert (=> bm!4092 m!395225))

(assert (=> bm!4092 m!395227))

(declare-fun m!395229 () Bool)

(assert (=> bm!4092 m!395229))

(assert (=> b!264556 d!89228))

(declare-fun d!89274 () Bool)

(assert (=> d!89274 (= (array_inv!6162 (buf!6906 w1!584)) (bvsge (size!6438 (buf!6906 w1!584)) #b00000000000000000000000000000000))))

(assert (=> b!264551 d!89274))

(declare-fun b!264686 () Bool)

(declare-fun e!184784 () Bool)

(declare-fun e!184783 () Bool)

(assert (=> b!264686 (= e!184784 e!184783)))

(declare-fun res!221253 () Bool)

(assert (=> b!264686 (=> (not res!221253) (not e!184783))))

(declare-fun e!184786 () Bool)

(assert (=> b!264686 (= res!221253 e!184786)))

(declare-fun res!221257 () Bool)

(assert (=> b!264686 (=> res!221257 e!184786)))

(declare-fun lt!405928 () tuple4!352)

(assert (=> b!264686 (= res!221257 (bvsge (_1!12156 lt!405928) (_2!12156 lt!405928)))))

(declare-fun lt!405929 () (_ BitVec 32))

(assert (=> b!264686 (= lt!405929 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6438 (buf!6906 w1!584)) (currentByte!12776 w1!584) (currentBit!12771 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!405930 () (_ BitVec 32))

(assert (=> b!264686 (= lt!405930 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!264686 (= lt!405928 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6438 (buf!6906 w1!584)) (currentByte!12776 w1!584) (currentBit!12771 w1!584))))))

(declare-fun b!264687 () Bool)

(assert (=> b!264687 (= e!184786 (arrayRangesEq!1012 (buf!6906 w2!580) (buf!6906 w1!584) (_1!12156 lt!405928) (_2!12156 lt!405928)))))

(declare-fun b!264688 () Bool)

(declare-fun e!184785 () Bool)

(assert (=> b!264688 (= e!184783 e!184785)))

(declare-fun c!12147 () Bool)

(assert (=> b!264688 (= c!12147 (= (_3!956 lt!405928) (_4!176 lt!405928)))))

(declare-fun b!264689 () Bool)

(declare-fun call!4097 () Bool)

(assert (=> b!264689 (= e!184785 call!4097)))

(declare-fun b!264690 () Bool)

(declare-fun res!221254 () Bool)

(assert (=> b!264690 (= res!221254 (= lt!405929 #b00000000000000000000000000000000))))

(declare-fun e!184781 () Bool)

(assert (=> b!264690 (=> res!221254 e!184781)))

(declare-fun e!184782 () Bool)

(assert (=> b!264690 (= e!184782 e!184781)))

(declare-fun b!264691 () Bool)

(assert (=> b!264691 (= e!184785 e!184782)))

(declare-fun res!221256 () Bool)

(assert (=> b!264691 (= res!221256 call!4097)))

(assert (=> b!264691 (=> (not res!221256) (not e!184782))))

(declare-fun b!264692 () Bool)

(assert (=> b!264692 (= e!184781 (byteRangesEq!0 (select (arr!7425 (buf!6906 w2!580)) (_4!176 lt!405928)) (select (arr!7425 (buf!6906 w1!584)) (_4!176 lt!405928)) #b00000000000000000000000000000000 lt!405929))))

(declare-fun bm!4094 () Bool)

(assert (=> bm!4094 (= call!4097 (byteRangesEq!0 (select (arr!7425 (buf!6906 w2!580)) (_3!956 lt!405928)) (select (arr!7425 (buf!6906 w1!584)) (_3!956 lt!405928)) lt!405930 (ite c!12147 lt!405929 #b00000000000000000000000000001000)))))

(declare-fun d!89278 () Bool)

(declare-fun res!221255 () Bool)

(assert (=> d!89278 (=> res!221255 e!184784)))

(assert (=> d!89278 (= res!221255 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6438 (buf!6906 w1!584)) (currentByte!12776 w1!584) (currentBit!12771 w1!584))))))

(assert (=> d!89278 (= (arrayBitRangesEq!0 (buf!6906 w2!580) (buf!6906 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6438 (buf!6906 w1!584)) (currentByte!12776 w1!584) (currentBit!12771 w1!584))) e!184784)))

(assert (= (and d!89278 (not res!221255)) b!264686))

(assert (= (and b!264686 (not res!221257)) b!264687))

(assert (= (and b!264686 res!221253) b!264688))

(assert (= (and b!264688 c!12147) b!264689))

(assert (= (and b!264688 (not c!12147)) b!264691))

(assert (= (and b!264691 res!221256) b!264690))

(assert (= (and b!264690 (not res!221254)) b!264692))

(assert (= (or b!264689 b!264691) bm!4094))

(assert (=> b!264686 m!395075))

(declare-fun m!395247 () Bool)

(assert (=> b!264686 m!395247))

(declare-fun m!395249 () Bool)

(assert (=> b!264687 m!395249))

(declare-fun m!395251 () Bool)

(assert (=> b!264692 m!395251))

(declare-fun m!395253 () Bool)

(assert (=> b!264692 m!395253))

(assert (=> b!264692 m!395251))

(assert (=> b!264692 m!395253))

(declare-fun m!395255 () Bool)

(assert (=> b!264692 m!395255))

(declare-fun m!395257 () Bool)

(assert (=> bm!4094 m!395257))

(declare-fun m!395259 () Bool)

(assert (=> bm!4094 m!395259))

(assert (=> bm!4094 m!395257))

(assert (=> bm!4094 m!395259))

(declare-fun m!395261 () Bool)

(assert (=> bm!4094 m!395261))

(assert (=> b!264552 d!89278))

(assert (=> b!264552 d!89216))

(declare-fun d!89286 () Bool)

(declare-fun res!221289 () Bool)

(declare-fun e!184813 () Bool)

(assert (=> d!89286 (=> (not res!221289) (not e!184813))))

(assert (=> d!89286 (= res!221289 (= (size!6438 (buf!6906 w1!584)) (size!6438 (buf!6906 w2!580))))))

(assert (=> d!89286 (= (isPrefixOf!0 w1!584 w2!580) e!184813)))

(declare-fun b!264728 () Bool)

(declare-fun res!221290 () Bool)

(assert (=> b!264728 (=> (not res!221290) (not e!184813))))

(assert (=> b!264728 (= res!221290 (bvsle (bitIndex!0 (size!6438 (buf!6906 w1!584)) (currentByte!12776 w1!584) (currentBit!12771 w1!584)) (bitIndex!0 (size!6438 (buf!6906 w2!580)) (currentByte!12776 w2!580) (currentBit!12771 w2!580))))))

(declare-fun b!264729 () Bool)

(declare-fun e!184814 () Bool)

(assert (=> b!264729 (= e!184813 e!184814)))

(declare-fun res!221291 () Bool)

(assert (=> b!264729 (=> res!221291 e!184814)))

(assert (=> b!264729 (= res!221291 (= (size!6438 (buf!6906 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!264730 () Bool)

(assert (=> b!264730 (= e!184814 (arrayBitRangesEq!0 (buf!6906 w1!584) (buf!6906 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6438 (buf!6906 w1!584)) (currentByte!12776 w1!584) (currentBit!12771 w1!584))))))

(assert (= (and d!89286 res!221289) b!264728))

(assert (= (and b!264728 res!221290) b!264729))

(assert (= (and b!264729 (not res!221291)) b!264730))

(assert (=> b!264728 m!395075))

(declare-fun m!395307 () Bool)

(assert (=> b!264728 m!395307))

(assert (=> b!264730 m!395075))

(assert (=> b!264730 m!395075))

(assert (=> b!264730 m!395113))

(assert (=> start!57652 d!89286))

(declare-fun d!89310 () Bool)

(assert (=> d!89310 (= (inv!12 w1!584) (invariant!0 (currentBit!12771 w1!584) (currentByte!12776 w1!584) (size!6438 (buf!6906 w1!584))))))

(declare-fun bs!22666 () Bool)

(assert (= bs!22666 d!89310))

(assert (=> bs!22666 m!395125))

(assert (=> start!57652 d!89310))

(declare-fun d!89312 () Bool)

(assert (=> d!89312 (= (inv!12 w2!580) (invariant!0 (currentBit!12771 w2!580) (currentByte!12776 w2!580) (size!6438 (buf!6906 w2!580))))))

(declare-fun bs!22667 () Bool)

(assert (= bs!22667 d!89312))

(assert (=> bs!22667 m!395093))

(assert (=> start!57652 d!89312))

(declare-fun d!89314 () Bool)

(assert (=> d!89314 (= (array_inv!6162 (buf!6906 w2!580)) (bvsge (size!6438 (buf!6906 w2!580)) #b00000000000000000000000000000000))))

(assert (=> b!264548 d!89314))

(declare-fun d!89316 () Bool)

(declare-fun res!221292 () Bool)

(declare-fun e!184815 () Bool)

(assert (=> d!89316 (=> (not res!221292) (not e!184815))))

(assert (=> d!89316 (= res!221292 (= (size!6438 (buf!6906 lt!405815)) (size!6438 (buf!6906 w1!584))))))

(assert (=> d!89316 (= (isPrefixOf!0 lt!405815 w1!584) e!184815)))

(declare-fun b!264731 () Bool)

(declare-fun res!221293 () Bool)

(assert (=> b!264731 (=> (not res!221293) (not e!184815))))

(assert (=> b!264731 (= res!221293 (bvsle (bitIndex!0 (size!6438 (buf!6906 lt!405815)) (currentByte!12776 lt!405815) (currentBit!12771 lt!405815)) (bitIndex!0 (size!6438 (buf!6906 w1!584)) (currentByte!12776 w1!584) (currentBit!12771 w1!584))))))

(declare-fun b!264732 () Bool)

(declare-fun e!184816 () Bool)

(assert (=> b!264732 (= e!184815 e!184816)))

(declare-fun res!221294 () Bool)

(assert (=> b!264732 (=> res!221294 e!184816)))

(assert (=> b!264732 (= res!221294 (= (size!6438 (buf!6906 lt!405815)) #b00000000000000000000000000000000))))

(declare-fun b!264733 () Bool)

(assert (=> b!264733 (= e!184816 (arrayBitRangesEq!0 (buf!6906 lt!405815) (buf!6906 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6438 (buf!6906 lt!405815)) (currentByte!12776 lt!405815) (currentBit!12771 lt!405815))))))

(assert (= (and d!89316 res!221292) b!264731))

(assert (= (and b!264731 res!221293) b!264732))

(assert (= (and b!264732 (not res!221294)) b!264733))

(declare-fun m!395309 () Bool)

(assert (=> b!264731 m!395309))

(assert (=> b!264731 m!395075))

(assert (=> b!264733 m!395309))

(assert (=> b!264733 m!395309))

(declare-fun m!395311 () Bool)

(assert (=> b!264733 m!395311))

(assert (=> b!264554 d!89316))

(declare-fun b!264734 () Bool)

(declare-fun e!184820 () Bool)

(declare-fun e!184819 () Bool)

(assert (=> b!264734 (= e!184820 e!184819)))

(declare-fun res!221295 () Bool)

(assert (=> b!264734 (=> (not res!221295) (not e!184819))))

(declare-fun e!184822 () Bool)

(assert (=> b!264734 (= res!221295 e!184822)))

(declare-fun res!221299 () Bool)

(assert (=> b!264734 (=> res!221299 e!184822)))

(declare-fun lt!405945 () tuple4!352)

(assert (=> b!264734 (= res!221299 (bvsge (_1!12156 lt!405945) (_2!12156 lt!405945)))))

(declare-fun lt!405946 () (_ BitVec 32))

(assert (=> b!264734 (= lt!405946 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6438 (buf!6906 w1!584)) (currentByte!12776 w1!584) (currentBit!12771 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!405947 () (_ BitVec 32))

(assert (=> b!264734 (= lt!405947 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!264734 (= lt!405945 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6438 (buf!6906 w1!584)) (currentByte!12776 w1!584) (currentBit!12771 w1!584))))))

(declare-fun b!264735 () Bool)

(assert (=> b!264735 (= e!184822 (arrayRangesEq!1012 (buf!6906 w1!584) (buf!6906 w2!580) (_1!12156 lt!405945) (_2!12156 lt!405945)))))

(declare-fun b!264736 () Bool)

(declare-fun e!184821 () Bool)

(assert (=> b!264736 (= e!184819 e!184821)))

(declare-fun c!12150 () Bool)

(assert (=> b!264736 (= c!12150 (= (_3!956 lt!405945) (_4!176 lt!405945)))))

(declare-fun b!264737 () Bool)

(declare-fun call!4100 () Bool)

(assert (=> b!264737 (= e!184821 call!4100)))

(declare-fun b!264738 () Bool)

(declare-fun res!221296 () Bool)

(assert (=> b!264738 (= res!221296 (= lt!405946 #b00000000000000000000000000000000))))

(declare-fun e!184817 () Bool)

(assert (=> b!264738 (=> res!221296 e!184817)))

(declare-fun e!184818 () Bool)

(assert (=> b!264738 (= e!184818 e!184817)))

(declare-fun b!264739 () Bool)

(assert (=> b!264739 (= e!184821 e!184818)))

(declare-fun res!221298 () Bool)

(assert (=> b!264739 (= res!221298 call!4100)))

(assert (=> b!264739 (=> (not res!221298) (not e!184818))))

(declare-fun b!264740 () Bool)

(assert (=> b!264740 (= e!184817 (byteRangesEq!0 (select (arr!7425 (buf!6906 w1!584)) (_4!176 lt!405945)) (select (arr!7425 (buf!6906 w2!580)) (_4!176 lt!405945)) #b00000000000000000000000000000000 lt!405946))))

(declare-fun bm!4097 () Bool)

(assert (=> bm!4097 (= call!4100 (byteRangesEq!0 (select (arr!7425 (buf!6906 w1!584)) (_3!956 lt!405945)) (select (arr!7425 (buf!6906 w2!580)) (_3!956 lt!405945)) lt!405947 (ite c!12150 lt!405946 #b00000000000000000000000000001000)))))

(declare-fun d!89318 () Bool)

(declare-fun res!221297 () Bool)

(assert (=> d!89318 (=> res!221297 e!184820)))

(assert (=> d!89318 (= res!221297 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6438 (buf!6906 w1!584)) (currentByte!12776 w1!584) (currentBit!12771 w1!584))))))

(assert (=> d!89318 (= (arrayBitRangesEq!0 (buf!6906 w1!584) (buf!6906 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6438 (buf!6906 w1!584)) (currentByte!12776 w1!584) (currentBit!12771 w1!584))) e!184820)))

(assert (= (and d!89318 (not res!221297)) b!264734))

(assert (= (and b!264734 (not res!221299)) b!264735))

(assert (= (and b!264734 res!221295) b!264736))

(assert (= (and b!264736 c!12150) b!264737))

(assert (= (and b!264736 (not c!12150)) b!264739))

(assert (= (and b!264739 res!221298) b!264738))

(assert (= (and b!264738 (not res!221296)) b!264740))

(assert (= (or b!264737 b!264739) bm!4097))

(assert (=> b!264734 m!395075))

(assert (=> b!264734 m!395247))

(declare-fun m!395313 () Bool)

(assert (=> b!264735 m!395313))

(declare-fun m!395315 () Bool)

(assert (=> b!264740 m!395315))

(declare-fun m!395317 () Bool)

(assert (=> b!264740 m!395317))

(assert (=> b!264740 m!395315))

(assert (=> b!264740 m!395317))

(declare-fun m!395319 () Bool)

(assert (=> b!264740 m!395319))

(declare-fun m!395321 () Bool)

(assert (=> bm!4097 m!395321))

(declare-fun m!395323 () Bool)

(assert (=> bm!4097 m!395323))

(assert (=> bm!4097 m!395321))

(assert (=> bm!4097 m!395323))

(declare-fun m!395325 () Bool)

(assert (=> bm!4097 m!395325))

(assert (=> b!264549 d!89318))

