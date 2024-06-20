; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58500 () Bool)

(assert start!58500)

(declare-fun b!268576 () Bool)

(declare-fun e!188574 () Bool)

(declare-datatypes ((array!14975 0))(
  ( (array!14976 (arr!7516 (Array (_ BitVec 32) (_ BitVec 8))) (size!6529 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11872 0))(
  ( (BitStream!11873 (buf!6997 array!14975) (currentByte!12921 (_ BitVec 32)) (currentBit!12916 (_ BitVec 32))) )
))
(declare-fun w1!591 () BitStream!11872)

(declare-fun w2!587 () BitStream!11872)

(assert (=> b!268576 (= e!188574 (not (or (bvsge (currentByte!12921 w1!591) (size!6529 (buf!6997 w1!591))) (bvslt (currentByte!12921 w1!591) (currentByte!12921 w2!587)) (bvsle (currentBit!12916 w1!591) (currentBit!12916 w2!587)))))))

(declare-fun w3!25 () BitStream!11872)

(declare-fun arrayRangesEq!1064 (array!14975 array!14975 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!268576 (arrayRangesEq!1064 (buf!6997 w1!591) (buf!6997 w3!25) #b00000000000000000000000000000000 (currentByte!12921 w1!591))))

(declare-datatypes ((Unit!19037 0))(
  ( (Unit!19038) )
))
(declare-fun lt!408563 () Unit!19037)

(declare-fun arrayRangesEqTransitive!339 (array!14975 array!14975 array!14975 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19037)

(assert (=> b!268576 (= lt!408563 (arrayRangesEqTransitive!339 (buf!6997 w1!591) (buf!6997 w2!587) (buf!6997 w3!25) #b00000000000000000000000000000000 (currentByte!12921 w1!591) (currentByte!12921 w2!587)))))

(declare-fun b!268578 () Bool)

(declare-fun res!223983 () Bool)

(assert (=> b!268578 (=> (not res!223983) (not e!188574))))

(declare-fun isPrefixOf!0 (BitStream!11872 BitStream!11872) Bool)

(assert (=> b!268578 (= res!223983 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun b!268579 () Bool)

(declare-fun e!188568 () Bool)

(declare-fun array_inv!6253 (array!14975) Bool)

(assert (=> b!268579 (= e!188568 (array_inv!6253 (buf!6997 w2!587)))))

(declare-fun b!268580 () Bool)

(declare-fun e!188571 () Bool)

(assert (=> b!268580 (= e!188571 (array_inv!6253 (buf!6997 w1!591)))))

(declare-fun res!223984 () Bool)

(assert (=> start!58500 (=> (not res!223984) (not e!188574))))

(assert (=> start!58500 (= res!223984 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!58500 e!188574))

(declare-fun inv!12 (BitStream!11872) Bool)

(assert (=> start!58500 (and (inv!12 w1!591) e!188571)))

(assert (=> start!58500 (and (inv!12 w2!587) e!188568)))

(declare-fun e!188569 () Bool)

(assert (=> start!58500 (and (inv!12 w3!25) e!188569)))

(declare-fun b!268577 () Bool)

(assert (=> b!268577 (= e!188569 (array_inv!6253 (buf!6997 w3!25)))))

(assert (= (and start!58500 res!223984) b!268578))

(assert (= (and b!268578 res!223983) b!268576))

(assert (= start!58500 b!268580))

(assert (= start!58500 b!268579))

(assert (= start!58500 b!268577))

(declare-fun m!400067 () Bool)

(assert (=> b!268580 m!400067))

(declare-fun m!400069 () Bool)

(assert (=> b!268576 m!400069))

(declare-fun m!400071 () Bool)

(assert (=> b!268576 m!400071))

(declare-fun m!400073 () Bool)

(assert (=> b!268577 m!400073))

(declare-fun m!400075 () Bool)

(assert (=> start!58500 m!400075))

(declare-fun m!400077 () Bool)

(assert (=> start!58500 m!400077))

(declare-fun m!400079 () Bool)

(assert (=> start!58500 m!400079))

(declare-fun m!400081 () Bool)

(assert (=> start!58500 m!400081))

(declare-fun m!400083 () Bool)

(assert (=> b!268579 m!400083))

(declare-fun m!400085 () Bool)

(assert (=> b!268578 m!400085))

(push 1)

(assert (not b!268576))

(assert (not start!58500))

(assert (not b!268580))

(assert (not b!268578))

(assert (not b!268579))

(assert (not b!268577))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!90818 () Bool)

(assert (=> d!90818 (= (array_inv!6253 (buf!6997 w1!591)) (bvsge (size!6529 (buf!6997 w1!591)) #b00000000000000000000000000000000))))

(assert (=> b!268580 d!90818))

(declare-fun d!90820 () Bool)

(assert (=> d!90820 (= (array_inv!6253 (buf!6997 w2!587)) (bvsge (size!6529 (buf!6997 w2!587)) #b00000000000000000000000000000000))))

(assert (=> b!268579 d!90820))

(declare-fun d!90822 () Bool)

(declare-fun res!224004 () Bool)

(declare-fun e!188622 () Bool)

(assert (=> d!90822 (=> (not res!224004) (not e!188622))))

(assert (=> d!90822 (= res!224004 (= (size!6529 (buf!6997 w2!587)) (size!6529 (buf!6997 w3!25))))))

(assert (=> d!90822 (= (isPrefixOf!0 w2!587 w3!25) e!188622)))

(declare-fun b!268617 () Bool)

(declare-fun res!224003 () Bool)

(assert (=> b!268617 (=> (not res!224003) (not e!188622))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!268617 (= res!224003 (bvsle (bitIndex!0 (size!6529 (buf!6997 w2!587)) (currentByte!12921 w2!587) (currentBit!12916 w2!587)) (bitIndex!0 (size!6529 (buf!6997 w3!25)) (currentByte!12921 w3!25) (currentBit!12916 w3!25))))))

(declare-fun b!268618 () Bool)

(declare-fun e!188621 () Bool)

(assert (=> b!268618 (= e!188622 e!188621)))

(declare-fun res!224005 () Bool)

(assert (=> b!268618 (=> res!224005 e!188621)))

(assert (=> b!268618 (= res!224005 (= (size!6529 (buf!6997 w2!587)) #b00000000000000000000000000000000))))

(declare-fun b!268619 () Bool)

(declare-fun arrayBitRangesEq!0 (array!14975 array!14975 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!268619 (= e!188621 (arrayBitRangesEq!0 (buf!6997 w2!587) (buf!6997 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6529 (buf!6997 w2!587)) (currentByte!12921 w2!587) (currentBit!12916 w2!587))))))

(assert (= (and d!90822 res!224004) b!268617))

(assert (= (and b!268617 res!224003) b!268618))

(assert (= (and b!268618 (not res!224005)) b!268619))

(declare-fun m!400127 () Bool)

(assert (=> b!268617 m!400127))

(declare-fun m!400129 () Bool)

(assert (=> b!268617 m!400129))

(assert (=> b!268619 m!400127))

(assert (=> b!268619 m!400127))

(declare-fun m!400131 () Bool)

(assert (=> b!268619 m!400131))

(assert (=> b!268578 d!90822))

(declare-fun d!90836 () Bool)

(declare-fun res!224007 () Bool)

(declare-fun e!188624 () Bool)

(assert (=> d!90836 (=> (not res!224007) (not e!188624))))

(assert (=> d!90836 (= res!224007 (= (size!6529 (buf!6997 w1!591)) (size!6529 (buf!6997 w2!587))))))

(assert (=> d!90836 (= (isPrefixOf!0 w1!591 w2!587) e!188624)))

(declare-fun b!268620 () Bool)

(declare-fun res!224006 () Bool)

(assert (=> b!268620 (=> (not res!224006) (not e!188624))))

(assert (=> b!268620 (= res!224006 (bvsle (bitIndex!0 (size!6529 (buf!6997 w1!591)) (currentByte!12921 w1!591) (currentBit!12916 w1!591)) (bitIndex!0 (size!6529 (buf!6997 w2!587)) (currentByte!12921 w2!587) (currentBit!12916 w2!587))))))

(declare-fun b!268621 () Bool)

(declare-fun e!188623 () Bool)

(assert (=> b!268621 (= e!188624 e!188623)))

(declare-fun res!224008 () Bool)

(assert (=> b!268621 (=> res!224008 e!188623)))

(assert (=> b!268621 (= res!224008 (= (size!6529 (buf!6997 w1!591)) #b00000000000000000000000000000000))))

(declare-fun b!268622 () Bool)

(assert (=> b!268622 (= e!188623 (arrayBitRangesEq!0 (buf!6997 w1!591) (buf!6997 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6529 (buf!6997 w1!591)) (currentByte!12921 w1!591) (currentBit!12916 w1!591))))))

(assert (= (and d!90836 res!224007) b!268620))

(assert (= (and b!268620 res!224006) b!268621))

(assert (= (and b!268621 (not res!224008)) b!268622))

(declare-fun m!400133 () Bool)

(assert (=> b!268620 m!400133))

(assert (=> b!268620 m!400127))

(assert (=> b!268622 m!400133))

(assert (=> b!268622 m!400133))

(declare-fun m!400135 () Bool)

(assert (=> b!268622 m!400135))

(assert (=> start!58500 d!90836))

(declare-fun d!90838 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!90838 (= (inv!12 w1!591) (invariant!0 (currentBit!12916 w1!591) (currentByte!12921 w1!591) (size!6529 (buf!6997 w1!591))))))

(declare-fun bs!23049 () Bool)

(assert (= bs!23049 d!90838))

(declare-fun m!400137 () Bool)

(assert (=> bs!23049 m!400137))

(assert (=> start!58500 d!90838))

(declare-fun d!90840 () Bool)

(assert (=> d!90840 (= (inv!12 w2!587) (invariant!0 (currentBit!12916 w2!587) (currentByte!12921 w2!587) (size!6529 (buf!6997 w2!587))))))

(declare-fun bs!23050 () Bool)

(assert (= bs!23050 d!90840))

(declare-fun m!400139 () Bool)

(assert (=> bs!23050 m!400139))

(assert (=> start!58500 d!90840))

(declare-fun d!90842 () Bool)

(assert (=> d!90842 (= (inv!12 w3!25) (invariant!0 (currentBit!12916 w3!25) (currentByte!12921 w3!25) (size!6529 (buf!6997 w3!25))))))

(declare-fun bs!23051 () Bool)

(assert (= bs!23051 d!90842))

(declare-fun m!400141 () Bool)

(assert (=> bs!23051 m!400141))

(assert (=> start!58500 d!90842))

(declare-fun d!90844 () Bool)

(assert (=> d!90844 (= (array_inv!6253 (buf!6997 w3!25)) (bvsge (size!6529 (buf!6997 w3!25)) #b00000000000000000000000000000000))))

(assert (=> b!268577 d!90844))

(declare-fun d!90846 () Bool)

(declare-fun res!224019 () Bool)

(declare-fun e!188633 () Bool)

(assert (=> d!90846 (=> res!224019 e!188633)))

(assert (=> d!90846 (= res!224019 (= #b00000000000000000000000000000000 (currentByte!12921 w1!591)))))

(assert (=> d!90846 (= (arrayRangesEq!1064 (buf!6997 w1!591) (buf!6997 w3!25) #b00000000000000000000000000000000 (currentByte!12921 w1!591)) e!188633)))

(declare-fun b!268633 () Bool)

(declare-fun e!188634 () Bool)

(assert (=> b!268633 (= e!188633 e!188634)))

(declare-fun res!224020 () Bool)

(assert (=> b!268633 (=> (not res!224020) (not e!188634))))

(assert (=> b!268633 (= res!224020 (= (select (arr!7516 (buf!6997 w1!591)) #b00000000000000000000000000000000) (select (arr!7516 (buf!6997 w3!25)) #b00000000000000000000000000000000)))))

(declare-fun b!268634 () Bool)

(assert (=> b!268634 (= e!188634 (arrayRangesEq!1064 (buf!6997 w1!591) (buf!6997 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12921 w1!591)))))

(assert (= (and d!90846 (not res!224019)) b!268633))

(assert (= (and b!268633 res!224020) b!268634))

(declare-fun m!400143 () Bool)

(assert (=> b!268633 m!400143))

(declare-fun m!400145 () Bool)

(assert (=> b!268633 m!400145))

(declare-fun m!400147 () Bool)

(assert (=> b!268634 m!400147))

(assert (=> b!268576 d!90846))

(declare-fun d!90848 () Bool)

(assert (=> d!90848 (arrayRangesEq!1064 (buf!6997 w1!591) (buf!6997 w3!25) #b00000000000000000000000000000000 (currentByte!12921 w1!591))))

(declare-fun lt!408572 () Unit!19037)

(declare-fun choose!382 (array!14975 array!14975 array!14975 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19037)

(assert (=> d!90848 (= lt!408572 (choose!382 (buf!6997 w1!591) (buf!6997 w2!587) (buf!6997 w3!25) #b00000000000000000000000000000000 (currentByte!12921 w1!591) (currentByte!12921 w2!587)))))

(assert (=> d!90848 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!12921 w1!591)) (bvsle (currentByte!12921 w1!591) (currentByte!12921 w2!587)))))

(assert (=> d!90848 (= (arrayRangesEqTransitive!339 (buf!6997 w1!591) (buf!6997 w2!587) (buf!6997 w3!25) #b00000000000000000000000000000000 (currentByte!12921 w1!591) (currentByte!12921 w2!587)) lt!408572)))

(declare-fun bs!23055 () Bool)

(assert (= bs!23055 d!90848))

(assert (=> bs!23055 m!400069))

(declare-fun m!400161 () Bool)

(assert (=> bs!23055 m!400161))

(assert (=> b!268576 d!90848))

(push 1)

(assert (not d!90840))

(assert (not b!268620))

(assert (not d!90838))

(assert (not b!268622))

(assert (not d!90842))

(assert (not b!268634))

(assert (not b!268619))

(assert (not d!90848))

(assert (not b!268617))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!90882 () Bool)

(declare-fun res!224066 () Bool)

(declare-fun e!188677 () Bool)

(assert (=> d!90882 (=> res!224066 e!188677)))

(assert (=> d!90882 (= res!224066 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12921 w1!591)))))

(assert (=> d!90882 (= (arrayRangesEq!1064 (buf!6997 w1!591) (buf!6997 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12921 w1!591)) e!188677)))

(declare-fun b!268686 () Bool)

(declare-fun e!188678 () Bool)

(assert (=> b!268686 (= e!188677 e!188678)))

(declare-fun res!224067 () Bool)

(assert (=> b!268686 (=> (not res!224067) (not e!188678))))

(assert (=> b!268686 (= res!224067 (= (select (arr!7516 (buf!6997 w1!591)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!7516 (buf!6997 w3!25)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!268687 () Bool)

(assert (=> b!268687 (= e!188678 (arrayRangesEq!1064 (buf!6997 w1!591) (buf!6997 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!12921 w1!591)))))

(assert (= (and d!90882 (not res!224066)) b!268686))

(assert (= (and b!268686 res!224067) b!268687))

(declare-fun m!400215 () Bool)

(assert (=> b!268686 m!400215))

(declare-fun m!400217 () Bool)

(assert (=> b!268686 m!400217))

(declare-fun m!400219 () Bool)

(assert (=> b!268687 m!400219))

(assert (=> b!268634 d!90882))

(declare-fun d!90884 () Bool)

(assert (=> d!90884 (= (invariant!0 (currentBit!12916 w1!591) (currentByte!12921 w1!591) (size!6529 (buf!6997 w1!591))) (and (bvsge (currentBit!12916 w1!591) #b00000000000000000000000000000000) (bvslt (currentBit!12916 w1!591) #b00000000000000000000000000001000) (bvsge (currentByte!12921 w1!591) #b00000000000000000000000000000000) (or (bvslt (currentByte!12921 w1!591) (size!6529 (buf!6997 w1!591))) (and (= (currentBit!12916 w1!591) #b00000000000000000000000000000000) (= (currentByte!12921 w1!591) (size!6529 (buf!6997 w1!591)))))))))

(assert (=> d!90838 d!90884))

(declare-fun b!268721 () Bool)

(declare-fun e!188709 () Bool)

(declare-fun e!188704 () Bool)

(assert (=> b!268721 (= e!188709 e!188704)))

(declare-fun c!12394 () Bool)

(declare-datatypes ((tuple4!424 0))(
  ( (tuple4!425 (_1!12195 (_ BitVec 32)) (_2!12195 (_ BitVec 32)) (_3!992 (_ BitVec 32)) (_4!212 (_ BitVec 32))) )
))
(declare-fun lt!408628 () tuple4!424)

(assert (=> b!268721 (= c!12394 (= (_3!992 lt!408628) (_4!212 lt!408628)))))

(declare-fun b!268722 () Bool)

(declare-fun call!4254 () Bool)

(assert (=> b!268722 (= e!188704 call!4254)))

(declare-fun d!90886 () Bool)

(declare-fun res!224098 () Bool)

(declare-fun e!188707 () Bool)

(assert (=> d!90886 (=> res!224098 e!188707)))

(assert (=> d!90886 (= res!224098 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6529 (buf!6997 w1!591)) (currentByte!12921 w1!591) (currentBit!12916 w1!591))))))

(assert (=> d!90886 (= (arrayBitRangesEq!0 (buf!6997 w1!591) (buf!6997 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6529 (buf!6997 w1!591)) (currentByte!12921 w1!591) (currentBit!12916 w1!591))) e!188707)))

(declare-fun bm!4251 () Bool)

(declare-fun lt!408629 () (_ BitVec 32))

(declare-fun lt!408627 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!4251 (= call!4254 (byteRangesEq!0 (select (arr!7516 (buf!6997 w1!591)) (_3!992 lt!408628)) (select (arr!7516 (buf!6997 w2!587)) (_3!992 lt!408628)) lt!408629 (ite c!12394 lt!408627 #b00000000000000000000000000001000)))))

(declare-fun b!268723 () Bool)

(assert (=> b!268723 (= e!188707 e!188709)))

(declare-fun res!224099 () Bool)

(assert (=> b!268723 (=> (not res!224099) (not e!188709))))

(declare-fun e!188705 () Bool)

(assert (=> b!268723 (= res!224099 e!188705)))

(declare-fun res!224095 () Bool)

(assert (=> b!268723 (=> res!224095 e!188705)))

(assert (=> b!268723 (= res!224095 (bvsge (_1!12195 lt!408628) (_2!12195 lt!408628)))))

(assert (=> b!268723 (= lt!408627 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6529 (buf!6997 w1!591)) (currentByte!12921 w1!591) (currentBit!12916 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!268723 (= lt!408629 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!424)

(assert (=> b!268723 (= lt!408628 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6529 (buf!6997 w1!591)) (currentByte!12921 w1!591) (currentBit!12916 w1!591))))))

(declare-fun b!268724 () Bool)

(declare-fun res!224096 () Bool)

(assert (=> b!268724 (= res!224096 (= lt!408627 #b00000000000000000000000000000000))))

(declare-fun e!188706 () Bool)

(assert (=> b!268724 (=> res!224096 e!188706)))

(declare-fun e!188708 () Bool)

(assert (=> b!268724 (= e!188708 e!188706)))

(declare-fun b!268725 () Bool)

(assert (=> b!268725 (= e!188704 e!188708)))

(declare-fun res!224097 () Bool)

(assert (=> b!268725 (= res!224097 call!4254)))

(assert (=> b!268725 (=> (not res!224097) (not e!188708))))

(declare-fun b!268726 () Bool)

(assert (=> b!268726 (= e!188706 (byteRangesEq!0 (select (arr!7516 (buf!6997 w1!591)) (_4!212 lt!408628)) (select (arr!7516 (buf!6997 w2!587)) (_4!212 lt!408628)) #b00000000000000000000000000000000 lt!408627))))

(declare-fun b!268727 () Bool)

(assert (=> b!268727 (= e!188705 (arrayRangesEq!1064 (buf!6997 w1!591) (buf!6997 w2!587) (_1!12195 lt!408628) (_2!12195 lt!408628)))))

(assert (= (and d!90886 (not res!224098)) b!268723))

(assert (= (and b!268723 (not res!224095)) b!268727))

(assert (= (and b!268723 res!224099) b!268721))

(assert (= (and b!268721 c!12394) b!268722))

(assert (= (and b!268721 (not c!12394)) b!268725))

(assert (= (and b!268725 res!224097) b!268724))

(assert (= (and b!268724 (not res!224096)) b!268726))

(assert (= (or b!268722 b!268725) bm!4251))

(declare-fun m!400249 () Bool)

(assert (=> bm!4251 m!400249))

(declare-fun m!400251 () Bool)

(assert (=> bm!4251 m!400251))

(assert (=> bm!4251 m!400249))

(assert (=> bm!4251 m!400251))

(declare-fun m!400253 () Bool)

(assert (=> bm!4251 m!400253))

(assert (=> b!268723 m!400133))

(declare-fun m!400255 () Bool)

(assert (=> b!268723 m!400255))

(declare-fun m!400257 () Bool)

(assert (=> b!268726 m!400257))

(declare-fun m!400259 () Bool)

(assert (=> b!268726 m!400259))

(assert (=> b!268726 m!400257))

(assert (=> b!268726 m!400259))

(declare-fun m!400261 () Bool)

(assert (=> b!268726 m!400261))

(declare-fun m!400263 () Bool)

(assert (=> b!268727 m!400263))

(assert (=> b!268622 d!90886))

(declare-fun d!90906 () Bool)

(declare-fun e!188730 () Bool)

(assert (=> d!90906 e!188730))

(declare-fun res!224119 () Bool)

(assert (=> d!90906 (=> (not res!224119) (not e!188730))))

(declare-fun lt!408655 () (_ BitVec 64))

(declare-fun lt!408654 () (_ BitVec 64))

(declare-fun lt!408653 () (_ BitVec 64))

(assert (=> d!90906 (= res!224119 (= lt!408653 (bvsub lt!408655 lt!408654)))))

(assert (=> d!90906 (or (= (bvand lt!408655 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!408654 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!408655 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!408655 lt!408654) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!90906 (= lt!408654 (remainingBits!0 ((_ sign_extend 32) (size!6529 (buf!6997 w1!591))) ((_ sign_extend 32) (currentByte!12921 w1!591)) ((_ sign_extend 32) (currentBit!12916 w1!591))))))

(declare-fun lt!408652 () (_ BitVec 64))

(declare-fun lt!408656 () (_ BitVec 64))

(assert (=> d!90906 (= lt!408655 (bvmul lt!408652 lt!408656))))

(assert (=> d!90906 (or (= lt!408652 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!408656 (bvsdiv (bvmul lt!408652 lt!408656) lt!408652)))))

(assert (=> d!90906 (= lt!408656 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!90906 (= lt!408652 ((_ sign_extend 32) (size!6529 (buf!6997 w1!591))))))

(assert (=> d!90906 (= lt!408653 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12921 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12916 w1!591))))))

(assert (=> d!90906 (invariant!0 (currentBit!12916 w1!591) (currentByte!12921 w1!591) (size!6529 (buf!6997 w1!591)))))

(assert (=> d!90906 (= (bitIndex!0 (size!6529 (buf!6997 w1!591)) (currentByte!12921 w1!591) (currentBit!12916 w1!591)) lt!408653)))

(declare-fun b!268753 () Bool)

(declare-fun res!224120 () Bool)

(assert (=> b!268753 (=> (not res!224120) (not e!188730))))

(assert (=> b!268753 (= res!224120 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!408653))))

(declare-fun b!268754 () Bool)

(declare-fun lt!408651 () (_ BitVec 64))

(assert (=> b!268754 (= e!188730 (bvsle lt!408653 (bvmul lt!408651 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!268754 (or (= lt!408651 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!408651 #b0000000000000000000000000000000000000000000000000000000000001000) lt!408651)))))

(assert (=> b!268754 (= lt!408651 ((_ sign_extend 32) (size!6529 (buf!6997 w1!591))))))

(assert (= (and d!90906 res!224119) b!268753))

(assert (= (and b!268753 res!224120) b!268754))

(declare-fun m!400281 () Bool)

(assert (=> d!90906 m!400281))

(assert (=> d!90906 m!400137))

(assert (=> b!268622 d!90906))

(declare-fun b!268755 () Bool)

(declare-fun e!188736 () Bool)

(declare-fun e!188731 () Bool)

(assert (=> b!268755 (= e!188736 e!188731)))

(declare-fun c!12398 () Bool)

(declare-fun lt!408658 () tuple4!424)

(assert (=> b!268755 (= c!12398 (= (_3!992 lt!408658) (_4!212 lt!408658)))))

(declare-fun b!268756 () Bool)

(declare-fun call!4258 () Bool)

(assert (=> b!268756 (= e!188731 call!4258)))

(declare-fun d!90910 () Bool)

(declare-fun res!224124 () Bool)

(declare-fun e!188734 () Bool)

(assert (=> d!90910 (=> res!224124 e!188734)))

(assert (=> d!90910 (= res!224124 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6529 (buf!6997 w2!587)) (currentByte!12921 w2!587) (currentBit!12916 w2!587))))))

(assert (=> d!90910 (= (arrayBitRangesEq!0 (buf!6997 w2!587) (buf!6997 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6529 (buf!6997 w2!587)) (currentByte!12921 w2!587) (currentBit!12916 w2!587))) e!188734)))

(declare-fun lt!408659 () (_ BitVec 32))

(declare-fun lt!408657 () (_ BitVec 32))

(declare-fun bm!4255 () Bool)

(assert (=> bm!4255 (= call!4258 (byteRangesEq!0 (select (arr!7516 (buf!6997 w2!587)) (_3!992 lt!408658)) (select (arr!7516 (buf!6997 w3!25)) (_3!992 lt!408658)) lt!408659 (ite c!12398 lt!408657 #b00000000000000000000000000001000)))))

(declare-fun b!268757 () Bool)

(assert (=> b!268757 (= e!188734 e!188736)))

(declare-fun res!224125 () Bool)

(assert (=> b!268757 (=> (not res!224125) (not e!188736))))

(declare-fun e!188732 () Bool)

(assert (=> b!268757 (= res!224125 e!188732)))

(declare-fun res!224121 () Bool)

(assert (=> b!268757 (=> res!224121 e!188732)))

(assert (=> b!268757 (= res!224121 (bvsge (_1!12195 lt!408658) (_2!12195 lt!408658)))))

(assert (=> b!268757 (= lt!408657 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6529 (buf!6997 w2!587)) (currentByte!12921 w2!587) (currentBit!12916 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!268757 (= lt!408659 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!268757 (= lt!408658 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6529 (buf!6997 w2!587)) (currentByte!12921 w2!587) (currentBit!12916 w2!587))))))

(declare-fun b!268758 () Bool)

(declare-fun res!224122 () Bool)

(assert (=> b!268758 (= res!224122 (= lt!408657 #b00000000000000000000000000000000))))

(declare-fun e!188733 () Bool)

(assert (=> b!268758 (=> res!224122 e!188733)))

(declare-fun e!188735 () Bool)

(assert (=> b!268758 (= e!188735 e!188733)))

(declare-fun b!268759 () Bool)

(assert (=> b!268759 (= e!188731 e!188735)))

(declare-fun res!224123 () Bool)

(assert (=> b!268759 (= res!224123 call!4258)))

(assert (=> b!268759 (=> (not res!224123) (not e!188735))))

(declare-fun b!268760 () Bool)

(assert (=> b!268760 (= e!188733 (byteRangesEq!0 (select (arr!7516 (buf!6997 w2!587)) (_4!212 lt!408658)) (select (arr!7516 (buf!6997 w3!25)) (_4!212 lt!408658)) #b00000000000000000000000000000000 lt!408657))))

(declare-fun b!268761 () Bool)

(assert (=> b!268761 (= e!188732 (arrayRangesEq!1064 (buf!6997 w2!587) (buf!6997 w3!25) (_1!12195 lt!408658) (_2!12195 lt!408658)))))

(assert (= (and d!90910 (not res!224124)) b!268757))

(assert (= (and b!268757 (not res!224121)) b!268761))

(assert (= (and b!268757 res!224125) b!268755))

(assert (= (and b!268755 c!12398) b!268756))

(assert (= (and b!268755 (not c!12398)) b!268759))

(assert (= (and b!268759 res!224123) b!268758))

(assert (= (and b!268758 (not res!224122)) b!268760))

(assert (= (or b!268756 b!268759) bm!4255))

(declare-fun m!400283 () Bool)

(assert (=> bm!4255 m!400283))

(declare-fun m!400285 () Bool)

(assert (=> bm!4255 m!400285))

(assert (=> bm!4255 m!400283))

(assert (=> bm!4255 m!400285))

(declare-fun m!400287 () Bool)

(assert (=> bm!4255 m!400287))

(assert (=> b!268757 m!400127))

(declare-fun m!400289 () Bool)

(assert (=> b!268757 m!400289))

(declare-fun m!400291 () Bool)

(assert (=> b!268760 m!400291))

(declare-fun m!400293 () Bool)

(assert (=> b!268760 m!400293))

(assert (=> b!268760 m!400291))

(assert (=> b!268760 m!400293))

(declare-fun m!400295 () Bool)

(assert (=> b!268760 m!400295))

(declare-fun m!400297 () Bool)

(assert (=> b!268761 m!400297))

(assert (=> b!268619 d!90910))

(declare-fun d!90912 () Bool)

(declare-fun e!188737 () Bool)

(assert (=> d!90912 e!188737))

(declare-fun res!224126 () Bool)

(assert (=> d!90912 (=> (not res!224126) (not e!188737))))

(declare-fun lt!408664 () (_ BitVec 64))

(declare-fun lt!408663 () (_ BitVec 64))

(declare-fun lt!408662 () (_ BitVec 64))

(assert (=> d!90912 (= res!224126 (= lt!408662 (bvsub lt!408664 lt!408663)))))

(assert (=> d!90912 (or (= (bvand lt!408664 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!408663 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!408664 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!408664 lt!408663) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!90912 (= lt!408663 (remainingBits!0 ((_ sign_extend 32) (size!6529 (buf!6997 w2!587))) ((_ sign_extend 32) (currentByte!12921 w2!587)) ((_ sign_extend 32) (currentBit!12916 w2!587))))))

(declare-fun lt!408661 () (_ BitVec 64))

(declare-fun lt!408665 () (_ BitVec 64))

(assert (=> d!90912 (= lt!408664 (bvmul lt!408661 lt!408665))))

(assert (=> d!90912 (or (= lt!408661 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!408665 (bvsdiv (bvmul lt!408661 lt!408665) lt!408661)))))

(assert (=> d!90912 (= lt!408665 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!90912 (= lt!408661 ((_ sign_extend 32) (size!6529 (buf!6997 w2!587))))))

(assert (=> d!90912 (= lt!408662 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12921 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12916 w2!587))))))

(assert (=> d!90912 (invariant!0 (currentBit!12916 w2!587) (currentByte!12921 w2!587) (size!6529 (buf!6997 w2!587)))))

(assert (=> d!90912 (= (bitIndex!0 (size!6529 (buf!6997 w2!587)) (currentByte!12921 w2!587) (currentBit!12916 w2!587)) lt!408662)))

(declare-fun b!268762 () Bool)

(declare-fun res!224127 () Bool)

(assert (=> b!268762 (=> (not res!224127) (not e!188737))))

(assert (=> b!268762 (= res!224127 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!408662))))

(declare-fun b!268763 () Bool)

(declare-fun lt!408660 () (_ BitVec 64))

(assert (=> b!268763 (= e!188737 (bvsle lt!408662 (bvmul lt!408660 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!268763 (or (= lt!408660 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!408660 #b0000000000000000000000000000000000000000000000000000000000001000) lt!408660)))))

(assert (=> b!268763 (= lt!408660 ((_ sign_extend 32) (size!6529 (buf!6997 w2!587))))))

(assert (= (and d!90912 res!224126) b!268762))

(assert (= (and b!268762 res!224127) b!268763))

(declare-fun m!400299 () Bool)

(assert (=> d!90912 m!400299))

(assert (=> d!90912 m!400139))

(assert (=> b!268619 d!90912))

(declare-fun d!90918 () Bool)

(assert (=> d!90918 (= (invariant!0 (currentBit!12916 w3!25) (currentByte!12921 w3!25) (size!6529 (buf!6997 w3!25))) (and (bvsge (currentBit!12916 w3!25) #b00000000000000000000000000000000) (bvslt (currentBit!12916 w3!25) #b00000000000000000000000000001000) (bvsge (currentByte!12921 w3!25) #b00000000000000000000000000000000) (or (bvslt (currentByte!12921 w3!25) (size!6529 (buf!6997 w3!25))) (and (= (currentBit!12916 w3!25) #b00000000000000000000000000000000) (= (currentByte!12921 w3!25) (size!6529 (buf!6997 w3!25)))))))))

(assert (=> d!90842 d!90918))

(assert (=> d!90848 d!90846))

(declare-fun d!90920 () Bool)

(assert (=> d!90920 (arrayRangesEq!1064 (buf!6997 w1!591) (buf!6997 w3!25) #b00000000000000000000000000000000 (currentByte!12921 w1!591))))

(assert (=> d!90920 true))

(declare-fun _$16!119 () Unit!19037)

(assert (=> d!90920 (= (choose!382 (buf!6997 w1!591) (buf!6997 w2!587) (buf!6997 w3!25) #b00000000000000000000000000000000 (currentByte!12921 w1!591) (currentByte!12921 w2!587)) _$16!119)))

(declare-fun bs!23062 () Bool)

(assert (= bs!23062 d!90920))

(assert (=> bs!23062 m!400069))

(assert (=> d!90848 d!90920))

(declare-fun d!90928 () Bool)

(assert (=> d!90928 (= (invariant!0 (currentBit!12916 w2!587) (currentByte!12921 w2!587) (size!6529 (buf!6997 w2!587))) (and (bvsge (currentBit!12916 w2!587) #b00000000000000000000000000000000) (bvslt (currentBit!12916 w2!587) #b00000000000000000000000000001000) (bvsge (currentByte!12921 w2!587) #b00000000000000000000000000000000) (or (bvslt (currentByte!12921 w2!587) (size!6529 (buf!6997 w2!587))) (and (= (currentBit!12916 w2!587) #b00000000000000000000000000000000) (= (currentByte!12921 w2!587) (size!6529 (buf!6997 w2!587)))))))))

(assert (=> d!90840 d!90928))

(assert (=> b!268620 d!90906))

(assert (=> b!268620 d!90912))

(assert (=> b!268617 d!90912))

(declare-fun d!90930 () Bool)

(declare-fun e!188751 () Bool)

(assert (=> d!90930 e!188751))

(declare-fun res!224145 () Bool)

(assert (=> d!90930 (=> (not res!224145) (not e!188751))))

(declare-fun lt!408701 () (_ BitVec 64))

(declare-fun lt!408703 () (_ BitVec 64))

(declare-fun lt!408702 () (_ BitVec 64))

(assert (=> d!90930 (= res!224145 (= lt!408701 (bvsub lt!408703 lt!408702)))))

(assert (=> d!90930 (or (= (bvand lt!408703 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!408702 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!408703 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!408703 lt!408702) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!90930 (= lt!408702 (remainingBits!0 ((_ sign_extend 32) (size!6529 (buf!6997 w3!25))) ((_ sign_extend 32) (currentByte!12921 w3!25)) ((_ sign_extend 32) (currentBit!12916 w3!25))))))

(declare-fun lt!408700 () (_ BitVec 64))

(declare-fun lt!408704 () (_ BitVec 64))

(assert (=> d!90930 (= lt!408703 (bvmul lt!408700 lt!408704))))

(assert (=> d!90930 (or (= lt!408700 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!408704 (bvsdiv (bvmul lt!408700 lt!408704) lt!408700)))))

(assert (=> d!90930 (= lt!408704 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!90930 (= lt!408700 ((_ sign_extend 32) (size!6529 (buf!6997 w3!25))))))

(assert (=> d!90930 (= lt!408701 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12921 w3!25)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12916 w3!25))))))

(assert (=> d!90930 (invariant!0 (currentBit!12916 w3!25) (currentByte!12921 w3!25) (size!6529 (buf!6997 w3!25)))))

(assert (=> d!90930 (= (bitIndex!0 (size!6529 (buf!6997 w3!25)) (currentByte!12921 w3!25) (currentBit!12916 w3!25)) lt!408701)))

(declare-fun b!268783 () Bool)

(declare-fun res!224146 () Bool)

(assert (=> b!268783 (=> (not res!224146) (not e!188751))))

(assert (=> b!268783 (= res!224146 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!408701))))

(declare-fun b!268784 () Bool)

(declare-fun lt!408699 () (_ BitVec 64))

(assert (=> b!268784 (= e!188751 (bvsle lt!408701 (bvmul lt!408699 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!268784 (or (= lt!408699 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!408699 #b0000000000000000000000000000000000000000000000000000000000001000) lt!408699)))))

(assert (=> b!268784 (= lt!408699 ((_ sign_extend 32) (size!6529 (buf!6997 w3!25))))))

(assert (= (and d!90930 res!224145) b!268783))

(assert (= (and b!268783 res!224146) b!268784))

(declare-fun m!400329 () Bool)

(assert (=> d!90930 m!400329))

(assert (=> d!90930 m!400141))

(assert (=> b!268617 d!90930))

(push 1)

(assert (not bm!4251))

(assert (not b!268727))

(assert (not b!268723))

(assert (not b!268757))

(assert (not b!268760))

(assert (not d!90930))

(assert (not bm!4255))

(assert (not d!90920))

(assert (not d!90906))

(assert (not b!268687))

(assert (not d!90912))

(assert (not b!268726))

(assert (not b!268761))

(check-sat)

(pop 1)

(push 1)

(check-sat)

