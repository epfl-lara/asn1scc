; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58502 () Bool)

(assert start!58502)

(declare-fun b!268591 () Bool)

(declare-fun e!188589 () Bool)

(declare-datatypes ((array!14977 0))(
  ( (array!14978 (arr!7517 (Array (_ BitVec 32) (_ BitVec 8))) (size!6530 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11874 0))(
  ( (BitStream!11875 (buf!6998 array!14977) (currentByte!12922 (_ BitVec 32)) (currentBit!12917 (_ BitVec 32))) )
))
(declare-fun w1!591 () BitStream!11874)

(declare-fun array_inv!6254 (array!14977) Bool)

(assert (=> b!268591 (= e!188589 (array_inv!6254 (buf!6998 w1!591)))))

(declare-fun b!268592 () Bool)

(declare-fun res!223989 () Bool)

(declare-fun e!188592 () Bool)

(assert (=> b!268592 (=> (not res!223989) (not e!188592))))

(declare-fun w2!587 () BitStream!11874)

(declare-fun w3!25 () BitStream!11874)

(declare-fun isPrefixOf!0 (BitStream!11874 BitStream!11874) Bool)

(assert (=> b!268592 (= res!223989 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun b!268593 () Bool)

(assert (=> b!268593 (= e!188592 (not (or (bvsge (currentByte!12922 w1!591) (size!6530 (buf!6998 w1!591))) (bvslt (currentByte!12922 w1!591) (currentByte!12922 w2!587)) (bvsle (currentBit!12917 w1!591) (currentBit!12917 w2!587)))))))

(declare-fun arrayRangesEq!1065 (array!14977 array!14977 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!268593 (arrayRangesEq!1065 (buf!6998 w1!591) (buf!6998 w3!25) #b00000000000000000000000000000000 (currentByte!12922 w1!591))))

(declare-datatypes ((Unit!19039 0))(
  ( (Unit!19040) )
))
(declare-fun lt!408566 () Unit!19039)

(declare-fun arrayRangesEqTransitive!340 (array!14977 array!14977 array!14977 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19039)

(assert (=> b!268593 (= lt!408566 (arrayRangesEqTransitive!340 (buf!6998 w1!591) (buf!6998 w2!587) (buf!6998 w3!25) #b00000000000000000000000000000000 (currentByte!12922 w1!591) (currentByte!12922 w2!587)))))

(declare-fun b!268594 () Bool)

(declare-fun e!188594 () Bool)

(assert (=> b!268594 (= e!188594 (array_inv!6254 (buf!6998 w3!25)))))

(declare-fun b!268595 () Bool)

(declare-fun e!188591 () Bool)

(assert (=> b!268595 (= e!188591 (array_inv!6254 (buf!6998 w2!587)))))

(declare-fun res!223990 () Bool)

(assert (=> start!58502 (=> (not res!223990) (not e!188592))))

(assert (=> start!58502 (= res!223990 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!58502 e!188592))

(declare-fun inv!12 (BitStream!11874) Bool)

(assert (=> start!58502 (and (inv!12 w1!591) e!188589)))

(assert (=> start!58502 (and (inv!12 w2!587) e!188591)))

(assert (=> start!58502 (and (inv!12 w3!25) e!188594)))

(assert (= (and start!58502 res!223990) b!268592))

(assert (= (and b!268592 res!223989) b!268593))

(assert (= start!58502 b!268591))

(assert (= start!58502 b!268595))

(assert (= start!58502 b!268594))

(declare-fun m!400087 () Bool)

(assert (=> b!268591 m!400087))

(declare-fun m!400089 () Bool)

(assert (=> b!268594 m!400089))

(declare-fun m!400091 () Bool)

(assert (=> b!268592 m!400091))

(declare-fun m!400093 () Bool)

(assert (=> b!268595 m!400093))

(declare-fun m!400095 () Bool)

(assert (=> start!58502 m!400095))

(declare-fun m!400097 () Bool)

(assert (=> start!58502 m!400097))

(declare-fun m!400099 () Bool)

(assert (=> start!58502 m!400099))

(declare-fun m!400101 () Bool)

(assert (=> start!58502 m!400101))

(declare-fun m!400103 () Bool)

(assert (=> b!268593 m!400103))

(declare-fun m!400105 () Bool)

(assert (=> b!268593 m!400105))

(check-sat (not b!268593) (not b!268594) (not b!268595) (not b!268592) (not b!268591) (not start!58502))
(check-sat)
(get-model)

(declare-fun d!90824 () Bool)

(assert (=> d!90824 (= (array_inv!6254 (buf!6998 w2!587)) (bvsge (size!6530 (buf!6998 w2!587)) #b00000000000000000000000000000000))))

(assert (=> b!268595 d!90824))

(declare-fun d!90826 () Bool)

(assert (=> d!90826 (= (array_inv!6254 (buf!6998 w3!25)) (bvsge (size!6530 (buf!6998 w3!25)) #b00000000000000000000000000000000))))

(assert (=> b!268594 d!90826))

(declare-fun d!90828 () Bool)

(declare-fun res!224023 () Bool)

(declare-fun e!188636 () Bool)

(assert (=> d!90828 (=> (not res!224023) (not e!188636))))

(assert (=> d!90828 (= res!224023 (= (size!6530 (buf!6998 w1!591)) (size!6530 (buf!6998 w2!587))))))

(assert (=> d!90828 (= (isPrefixOf!0 w1!591 w2!587) e!188636)))

(declare-fun b!268635 () Bool)

(declare-fun res!224022 () Bool)

(assert (=> b!268635 (=> (not res!224022) (not e!188636))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!268635 (= res!224022 (bvsle (bitIndex!0 (size!6530 (buf!6998 w1!591)) (currentByte!12922 w1!591) (currentBit!12917 w1!591)) (bitIndex!0 (size!6530 (buf!6998 w2!587)) (currentByte!12922 w2!587) (currentBit!12917 w2!587))))))

(declare-fun b!268636 () Bool)

(declare-fun e!188635 () Bool)

(assert (=> b!268636 (= e!188636 e!188635)))

(declare-fun res!224021 () Bool)

(assert (=> b!268636 (=> res!224021 e!188635)))

(assert (=> b!268636 (= res!224021 (= (size!6530 (buf!6998 w1!591)) #b00000000000000000000000000000000))))

(declare-fun b!268637 () Bool)

(declare-fun arrayBitRangesEq!0 (array!14977 array!14977 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!268637 (= e!188635 (arrayBitRangesEq!0 (buf!6998 w1!591) (buf!6998 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6530 (buf!6998 w1!591)) (currentByte!12922 w1!591) (currentBit!12917 w1!591))))))

(assert (= (and d!90828 res!224023) b!268635))

(assert (= (and b!268635 res!224022) b!268636))

(assert (= (and b!268636 (not res!224021)) b!268637))

(declare-fun m!400149 () Bool)

(assert (=> b!268635 m!400149))

(declare-fun m!400151 () Bool)

(assert (=> b!268635 m!400151))

(assert (=> b!268637 m!400149))

(assert (=> b!268637 m!400149))

(declare-fun m!400153 () Bool)

(assert (=> b!268637 m!400153))

(assert (=> start!58502 d!90828))

(declare-fun d!90850 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!90850 (= (inv!12 w1!591) (invariant!0 (currentBit!12917 w1!591) (currentByte!12922 w1!591) (size!6530 (buf!6998 w1!591))))))

(declare-fun bs!23052 () Bool)

(assert (= bs!23052 d!90850))

(declare-fun m!400155 () Bool)

(assert (=> bs!23052 m!400155))

(assert (=> start!58502 d!90850))

(declare-fun d!90852 () Bool)

(assert (=> d!90852 (= (inv!12 w2!587) (invariant!0 (currentBit!12917 w2!587) (currentByte!12922 w2!587) (size!6530 (buf!6998 w2!587))))))

(declare-fun bs!23053 () Bool)

(assert (= bs!23053 d!90852))

(declare-fun m!400157 () Bool)

(assert (=> bs!23053 m!400157))

(assert (=> start!58502 d!90852))

(declare-fun d!90854 () Bool)

(assert (=> d!90854 (= (inv!12 w3!25) (invariant!0 (currentBit!12917 w3!25) (currentByte!12922 w3!25) (size!6530 (buf!6998 w3!25))))))

(declare-fun bs!23054 () Bool)

(assert (= bs!23054 d!90854))

(declare-fun m!400159 () Bool)

(assert (=> bs!23054 m!400159))

(assert (=> start!58502 d!90854))

(declare-fun d!90856 () Bool)

(declare-fun res!224037 () Bool)

(declare-fun e!188647 () Bool)

(assert (=> d!90856 (=> res!224037 e!188647)))

(assert (=> d!90856 (= res!224037 (= #b00000000000000000000000000000000 (currentByte!12922 w1!591)))))

(assert (=> d!90856 (= (arrayRangesEq!1065 (buf!6998 w1!591) (buf!6998 w3!25) #b00000000000000000000000000000000 (currentByte!12922 w1!591)) e!188647)))

(declare-fun b!268651 () Bool)

(declare-fun e!188648 () Bool)

(assert (=> b!268651 (= e!188647 e!188648)))

(declare-fun res!224038 () Bool)

(assert (=> b!268651 (=> (not res!224038) (not e!188648))))

(assert (=> b!268651 (= res!224038 (= (select (arr!7517 (buf!6998 w1!591)) #b00000000000000000000000000000000) (select (arr!7517 (buf!6998 w3!25)) #b00000000000000000000000000000000)))))

(declare-fun b!268652 () Bool)

(assert (=> b!268652 (= e!188648 (arrayRangesEq!1065 (buf!6998 w1!591) (buf!6998 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12922 w1!591)))))

(assert (= (and d!90856 (not res!224037)) b!268651))

(assert (= (and b!268651 res!224038) b!268652))

(declare-fun m!400175 () Bool)

(assert (=> b!268651 m!400175))

(declare-fun m!400177 () Bool)

(assert (=> b!268651 m!400177))

(declare-fun m!400179 () Bool)

(assert (=> b!268652 m!400179))

(assert (=> b!268593 d!90856))

(declare-fun d!90868 () Bool)

(assert (=> d!90868 (arrayRangesEq!1065 (buf!6998 w1!591) (buf!6998 w3!25) #b00000000000000000000000000000000 (currentByte!12922 w1!591))))

(declare-fun lt!408575 () Unit!19039)

(declare-fun choose!381 (array!14977 array!14977 array!14977 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19039)

(assert (=> d!90868 (= lt!408575 (choose!381 (buf!6998 w1!591) (buf!6998 w2!587) (buf!6998 w3!25) #b00000000000000000000000000000000 (currentByte!12922 w1!591) (currentByte!12922 w2!587)))))

(assert (=> d!90868 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!12922 w1!591)) (bvsle (currentByte!12922 w1!591) (currentByte!12922 w2!587)))))

(assert (=> d!90868 (= (arrayRangesEqTransitive!340 (buf!6998 w1!591) (buf!6998 w2!587) (buf!6998 w3!25) #b00000000000000000000000000000000 (currentByte!12922 w1!591) (currentByte!12922 w2!587)) lt!408575)))

(declare-fun bs!23059 () Bool)

(assert (= bs!23059 d!90868))

(assert (=> bs!23059 m!400103))

(declare-fun m!400185 () Bool)

(assert (=> bs!23059 m!400185))

(assert (=> b!268593 d!90868))

(declare-fun d!90872 () Bool)

(declare-fun res!224050 () Bool)

(declare-fun e!188658 () Bool)

(assert (=> d!90872 (=> (not res!224050) (not e!188658))))

(assert (=> d!90872 (= res!224050 (= (size!6530 (buf!6998 w2!587)) (size!6530 (buf!6998 w3!25))))))

(assert (=> d!90872 (= (isPrefixOf!0 w2!587 w3!25) e!188658)))

(declare-fun b!268662 () Bool)

(declare-fun res!224049 () Bool)

(assert (=> b!268662 (=> (not res!224049) (not e!188658))))

(assert (=> b!268662 (= res!224049 (bvsle (bitIndex!0 (size!6530 (buf!6998 w2!587)) (currentByte!12922 w2!587) (currentBit!12917 w2!587)) (bitIndex!0 (size!6530 (buf!6998 w3!25)) (currentByte!12922 w3!25) (currentBit!12917 w3!25))))))

(declare-fun b!268663 () Bool)

(declare-fun e!188657 () Bool)

(assert (=> b!268663 (= e!188658 e!188657)))

(declare-fun res!224048 () Bool)

(assert (=> b!268663 (=> res!224048 e!188657)))

(assert (=> b!268663 (= res!224048 (= (size!6530 (buf!6998 w2!587)) #b00000000000000000000000000000000))))

(declare-fun b!268664 () Bool)

(assert (=> b!268664 (= e!188657 (arrayBitRangesEq!0 (buf!6998 w2!587) (buf!6998 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6530 (buf!6998 w2!587)) (currentByte!12922 w2!587) (currentBit!12917 w2!587))))))

(assert (= (and d!90872 res!224050) b!268662))

(assert (= (and b!268662 res!224049) b!268663))

(assert (= (and b!268663 (not res!224048)) b!268664))

(assert (=> b!268662 m!400151))

(declare-fun m!400193 () Bool)

(assert (=> b!268662 m!400193))

(assert (=> b!268664 m!400151))

(assert (=> b!268664 m!400151))

(declare-fun m!400195 () Bool)

(assert (=> b!268664 m!400195))

(assert (=> b!268592 d!90872))

(declare-fun d!90876 () Bool)

(assert (=> d!90876 (= (array_inv!6254 (buf!6998 w1!591)) (bvsge (size!6530 (buf!6998 w1!591)) #b00000000000000000000000000000000))))

(assert (=> b!268591 d!90876))

(check-sat (not b!268662) (not b!268637) (not b!268664) (not b!268635) (not d!90852) (not d!90854) (not d!90850) (not d!90868) (not b!268652))
(check-sat)
(get-model)

(declare-fun b!268679 () Bool)

(declare-fun e!188673 () Bool)

(declare-fun e!188672 () Bool)

(assert (=> b!268679 (= e!188673 e!188672)))

(declare-fun res!224063 () Bool)

(declare-fun call!4250 () Bool)

(assert (=> b!268679 (= res!224063 call!4250)))

(assert (=> b!268679 (=> (not res!224063) (not e!188672))))

(declare-fun d!90878 () Bool)

(declare-fun res!224064 () Bool)

(declare-fun e!188671 () Bool)

(assert (=> d!90878 (=> res!224064 e!188671)))

(assert (=> d!90878 (= res!224064 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6530 (buf!6998 w1!591)) (currentByte!12922 w1!591) (currentBit!12917 w1!591))))))

(assert (=> d!90878 (= (arrayBitRangesEq!0 (buf!6998 w1!591) (buf!6998 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6530 (buf!6998 w1!591)) (currentByte!12922 w1!591) (currentBit!12917 w1!591))) e!188671)))

(declare-fun b!268680 () Bool)

(declare-datatypes ((tuple4!420 0))(
  ( (tuple4!421 (_1!12193 (_ BitVec 32)) (_2!12193 (_ BitVec 32)) (_3!990 (_ BitVec 32)) (_4!210 (_ BitVec 32))) )
))
(declare-fun lt!408585 () tuple4!420)

(declare-fun e!188674 () Bool)

(assert (=> b!268680 (= e!188674 (arrayRangesEq!1065 (buf!6998 w1!591) (buf!6998 w2!587) (_1!12193 lt!408585) (_2!12193 lt!408585)))))

(declare-fun b!268681 () Bool)

(assert (=> b!268681 (= e!188673 call!4250)))

(declare-fun b!268682 () Bool)

(declare-fun res!224062 () Bool)

(declare-fun lt!408586 () (_ BitVec 32))

(assert (=> b!268682 (= res!224062 (= lt!408586 #b00000000000000000000000000000000))))

(declare-fun e!188676 () Bool)

(assert (=> b!268682 (=> res!224062 e!188676)))

(assert (=> b!268682 (= e!188672 e!188676)))

(declare-fun b!268683 () Bool)

(declare-fun e!188675 () Bool)

(assert (=> b!268683 (= e!188675 e!188673)))

(declare-fun c!12390 () Bool)

(assert (=> b!268683 (= c!12390 (= (_3!990 lt!408585) (_4!210 lt!408585)))))

(declare-fun b!268684 () Bool)

(assert (=> b!268684 (= e!188671 e!188675)))

(declare-fun res!224065 () Bool)

(assert (=> b!268684 (=> (not res!224065) (not e!188675))))

(assert (=> b!268684 (= res!224065 e!188674)))

(declare-fun res!224061 () Bool)

(assert (=> b!268684 (=> res!224061 e!188674)))

(assert (=> b!268684 (= res!224061 (bvsge (_1!12193 lt!408585) (_2!12193 lt!408585)))))

(assert (=> b!268684 (= lt!408586 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6530 (buf!6998 w1!591)) (currentByte!12922 w1!591) (currentBit!12917 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!408587 () (_ BitVec 32))

(assert (=> b!268684 (= lt!408587 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!420)

(assert (=> b!268684 (= lt!408585 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6530 (buf!6998 w1!591)) (currentByte!12922 w1!591) (currentBit!12917 w1!591))))))

(declare-fun bm!4247 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!4247 (= call!4250 (byteRangesEq!0 (select (arr!7517 (buf!6998 w1!591)) (_3!990 lt!408585)) (select (arr!7517 (buf!6998 w2!587)) (_3!990 lt!408585)) lt!408587 (ite c!12390 lt!408586 #b00000000000000000000000000001000)))))

(declare-fun b!268685 () Bool)

(assert (=> b!268685 (= e!188676 (byteRangesEq!0 (select (arr!7517 (buf!6998 w1!591)) (_4!210 lt!408585)) (select (arr!7517 (buf!6998 w2!587)) (_4!210 lt!408585)) #b00000000000000000000000000000000 lt!408586))))

(assert (= (and d!90878 (not res!224064)) b!268684))

(assert (= (and b!268684 (not res!224061)) b!268680))

(assert (= (and b!268684 res!224065) b!268683))

(assert (= (and b!268683 c!12390) b!268681))

(assert (= (and b!268683 (not c!12390)) b!268679))

(assert (= (and b!268679 res!224063) b!268682))

(assert (= (and b!268682 (not res!224062)) b!268685))

(assert (= (or b!268681 b!268679) bm!4247))

(declare-fun m!400199 () Bool)

(assert (=> b!268680 m!400199))

(assert (=> b!268684 m!400149))

(declare-fun m!400201 () Bool)

(assert (=> b!268684 m!400201))

(declare-fun m!400203 () Bool)

(assert (=> bm!4247 m!400203))

(declare-fun m!400205 () Bool)

(assert (=> bm!4247 m!400205))

(assert (=> bm!4247 m!400203))

(assert (=> bm!4247 m!400205))

(declare-fun m!400207 () Bool)

(assert (=> bm!4247 m!400207))

(declare-fun m!400209 () Bool)

(assert (=> b!268685 m!400209))

(declare-fun m!400211 () Bool)

(assert (=> b!268685 m!400211))

(assert (=> b!268685 m!400209))

(assert (=> b!268685 m!400211))

(declare-fun m!400213 () Bool)

(assert (=> b!268685 m!400213))

(assert (=> b!268637 d!90878))

(declare-fun d!90880 () Bool)

(declare-fun e!188681 () Bool)

(assert (=> d!90880 e!188681))

(declare-fun res!224073 () Bool)

(assert (=> d!90880 (=> (not res!224073) (not e!188681))))

(declare-fun lt!408600 () (_ BitVec 64))

(declare-fun lt!408605 () (_ BitVec 64))

(declare-fun lt!408603 () (_ BitVec 64))

(assert (=> d!90880 (= res!224073 (= lt!408600 (bvsub lt!408603 lt!408605)))))

(assert (=> d!90880 (or (= (bvand lt!408603 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!408605 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!408603 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!408603 lt!408605) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!90880 (= lt!408605 (remainingBits!0 ((_ sign_extend 32) (size!6530 (buf!6998 w1!591))) ((_ sign_extend 32) (currentByte!12922 w1!591)) ((_ sign_extend 32) (currentBit!12917 w1!591))))))

(declare-fun lt!408601 () (_ BitVec 64))

(declare-fun lt!408602 () (_ BitVec 64))

(assert (=> d!90880 (= lt!408603 (bvmul lt!408601 lt!408602))))

(assert (=> d!90880 (or (= lt!408601 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!408602 (bvsdiv (bvmul lt!408601 lt!408602) lt!408601)))))

(assert (=> d!90880 (= lt!408602 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!90880 (= lt!408601 ((_ sign_extend 32) (size!6530 (buf!6998 w1!591))))))

(assert (=> d!90880 (= lt!408600 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12922 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12917 w1!591))))))

(assert (=> d!90880 (invariant!0 (currentBit!12917 w1!591) (currentByte!12922 w1!591) (size!6530 (buf!6998 w1!591)))))

(assert (=> d!90880 (= (bitIndex!0 (size!6530 (buf!6998 w1!591)) (currentByte!12922 w1!591) (currentBit!12917 w1!591)) lt!408600)))

(declare-fun b!268692 () Bool)

(declare-fun res!224072 () Bool)

(assert (=> b!268692 (=> (not res!224072) (not e!188681))))

(assert (=> b!268692 (= res!224072 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!408600))))

(declare-fun b!268693 () Bool)

(declare-fun lt!408604 () (_ BitVec 64))

(assert (=> b!268693 (= e!188681 (bvsle lt!408600 (bvmul lt!408604 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!268693 (or (= lt!408604 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!408604 #b0000000000000000000000000000000000000000000000000000000000001000) lt!408604)))))

(assert (=> b!268693 (= lt!408604 ((_ sign_extend 32) (size!6530 (buf!6998 w1!591))))))

(assert (= (and d!90880 res!224073) b!268692))

(assert (= (and b!268692 res!224072) b!268693))

(declare-fun m!400221 () Bool)

(assert (=> d!90880 m!400221))

(assert (=> d!90880 m!400155))

(assert (=> b!268637 d!90880))

(declare-fun d!90888 () Bool)

(assert (=> d!90888 (= (invariant!0 (currentBit!12917 w1!591) (currentByte!12922 w1!591) (size!6530 (buf!6998 w1!591))) (and (bvsge (currentBit!12917 w1!591) #b00000000000000000000000000000000) (bvslt (currentBit!12917 w1!591) #b00000000000000000000000000001000) (bvsge (currentByte!12922 w1!591) #b00000000000000000000000000000000) (or (bvslt (currentByte!12922 w1!591) (size!6530 (buf!6998 w1!591))) (and (= (currentBit!12917 w1!591) #b00000000000000000000000000000000) (= (currentByte!12922 w1!591) (size!6530 (buf!6998 w1!591)))))))))

(assert (=> d!90850 d!90888))

(declare-fun d!90892 () Bool)

(assert (=> d!90892 (= (invariant!0 (currentBit!12917 w3!25) (currentByte!12922 w3!25) (size!6530 (buf!6998 w3!25))) (and (bvsge (currentBit!12917 w3!25) #b00000000000000000000000000000000) (bvslt (currentBit!12917 w3!25) #b00000000000000000000000000001000) (bvsge (currentByte!12922 w3!25) #b00000000000000000000000000000000) (or (bvslt (currentByte!12922 w3!25) (size!6530 (buf!6998 w3!25))) (and (= (currentBit!12917 w3!25) #b00000000000000000000000000000000) (= (currentByte!12922 w3!25) (size!6530 (buf!6998 w3!25)))))))))

(assert (=> d!90854 d!90892))

(declare-fun b!268694 () Bool)

(declare-fun e!188684 () Bool)

(declare-fun e!188683 () Bool)

(assert (=> b!268694 (= e!188684 e!188683)))

(declare-fun res!224076 () Bool)

(declare-fun call!4251 () Bool)

(assert (=> b!268694 (= res!224076 call!4251)))

(assert (=> b!268694 (=> (not res!224076) (not e!188683))))

(declare-fun d!90894 () Bool)

(declare-fun res!224077 () Bool)

(declare-fun e!188682 () Bool)

(assert (=> d!90894 (=> res!224077 e!188682)))

(assert (=> d!90894 (= res!224077 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6530 (buf!6998 w2!587)) (currentByte!12922 w2!587) (currentBit!12917 w2!587))))))

(assert (=> d!90894 (= (arrayBitRangesEq!0 (buf!6998 w2!587) (buf!6998 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6530 (buf!6998 w2!587)) (currentByte!12922 w2!587) (currentBit!12917 w2!587))) e!188682)))

(declare-fun lt!408606 () tuple4!420)

(declare-fun e!188685 () Bool)

(declare-fun b!268695 () Bool)

(assert (=> b!268695 (= e!188685 (arrayRangesEq!1065 (buf!6998 w2!587) (buf!6998 w3!25) (_1!12193 lt!408606) (_2!12193 lt!408606)))))

(declare-fun b!268696 () Bool)

(assert (=> b!268696 (= e!188684 call!4251)))

(declare-fun b!268697 () Bool)

(declare-fun res!224075 () Bool)

(declare-fun lt!408607 () (_ BitVec 32))

(assert (=> b!268697 (= res!224075 (= lt!408607 #b00000000000000000000000000000000))))

(declare-fun e!188687 () Bool)

(assert (=> b!268697 (=> res!224075 e!188687)))

(assert (=> b!268697 (= e!188683 e!188687)))

(declare-fun b!268698 () Bool)

(declare-fun e!188686 () Bool)

(assert (=> b!268698 (= e!188686 e!188684)))

(declare-fun c!12391 () Bool)

(assert (=> b!268698 (= c!12391 (= (_3!990 lt!408606) (_4!210 lt!408606)))))

(declare-fun b!268699 () Bool)

(assert (=> b!268699 (= e!188682 e!188686)))

(declare-fun res!224078 () Bool)

(assert (=> b!268699 (=> (not res!224078) (not e!188686))))

(assert (=> b!268699 (= res!224078 e!188685)))

(declare-fun res!224074 () Bool)

(assert (=> b!268699 (=> res!224074 e!188685)))

(assert (=> b!268699 (= res!224074 (bvsge (_1!12193 lt!408606) (_2!12193 lt!408606)))))

(assert (=> b!268699 (= lt!408607 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6530 (buf!6998 w2!587)) (currentByte!12922 w2!587) (currentBit!12917 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!408608 () (_ BitVec 32))

(assert (=> b!268699 (= lt!408608 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!268699 (= lt!408606 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6530 (buf!6998 w2!587)) (currentByte!12922 w2!587) (currentBit!12917 w2!587))))))

(declare-fun bm!4248 () Bool)

(assert (=> bm!4248 (= call!4251 (byteRangesEq!0 (select (arr!7517 (buf!6998 w2!587)) (_3!990 lt!408606)) (select (arr!7517 (buf!6998 w3!25)) (_3!990 lt!408606)) lt!408608 (ite c!12391 lt!408607 #b00000000000000000000000000001000)))))

(declare-fun b!268700 () Bool)

(assert (=> b!268700 (= e!188687 (byteRangesEq!0 (select (arr!7517 (buf!6998 w2!587)) (_4!210 lt!408606)) (select (arr!7517 (buf!6998 w3!25)) (_4!210 lt!408606)) #b00000000000000000000000000000000 lt!408607))))

(assert (= (and d!90894 (not res!224077)) b!268699))

(assert (= (and b!268699 (not res!224074)) b!268695))

(assert (= (and b!268699 res!224078) b!268698))

(assert (= (and b!268698 c!12391) b!268696))

(assert (= (and b!268698 (not c!12391)) b!268694))

(assert (= (and b!268694 res!224076) b!268697))

(assert (= (and b!268697 (not res!224075)) b!268700))

(assert (= (or b!268696 b!268694) bm!4248))

(declare-fun m!400223 () Bool)

(assert (=> b!268695 m!400223))

(assert (=> b!268699 m!400151))

(declare-fun m!400225 () Bool)

(assert (=> b!268699 m!400225))

(declare-fun m!400227 () Bool)

(assert (=> bm!4248 m!400227))

(declare-fun m!400229 () Bool)

(assert (=> bm!4248 m!400229))

(assert (=> bm!4248 m!400227))

(assert (=> bm!4248 m!400229))

(declare-fun m!400231 () Bool)

(assert (=> bm!4248 m!400231))

(declare-fun m!400233 () Bool)

(assert (=> b!268700 m!400233))

(declare-fun m!400235 () Bool)

(assert (=> b!268700 m!400235))

(assert (=> b!268700 m!400233))

(assert (=> b!268700 m!400235))

(declare-fun m!400237 () Bool)

(assert (=> b!268700 m!400237))

(assert (=> b!268664 d!90894))

(declare-fun d!90896 () Bool)

(declare-fun e!188688 () Bool)

(assert (=> d!90896 e!188688))

(declare-fun res!224080 () Bool)

(assert (=> d!90896 (=> (not res!224080) (not e!188688))))

(declare-fun lt!408609 () (_ BitVec 64))

(declare-fun lt!408614 () (_ BitVec 64))

(declare-fun lt!408612 () (_ BitVec 64))

(assert (=> d!90896 (= res!224080 (= lt!408609 (bvsub lt!408612 lt!408614)))))

(assert (=> d!90896 (or (= (bvand lt!408612 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!408614 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!408612 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!408612 lt!408614) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!90896 (= lt!408614 (remainingBits!0 ((_ sign_extend 32) (size!6530 (buf!6998 w2!587))) ((_ sign_extend 32) (currentByte!12922 w2!587)) ((_ sign_extend 32) (currentBit!12917 w2!587))))))

(declare-fun lt!408610 () (_ BitVec 64))

(declare-fun lt!408611 () (_ BitVec 64))

(assert (=> d!90896 (= lt!408612 (bvmul lt!408610 lt!408611))))

(assert (=> d!90896 (or (= lt!408610 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!408611 (bvsdiv (bvmul lt!408610 lt!408611) lt!408610)))))

(assert (=> d!90896 (= lt!408611 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!90896 (= lt!408610 ((_ sign_extend 32) (size!6530 (buf!6998 w2!587))))))

(assert (=> d!90896 (= lt!408609 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12922 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12917 w2!587))))))

(assert (=> d!90896 (invariant!0 (currentBit!12917 w2!587) (currentByte!12922 w2!587) (size!6530 (buf!6998 w2!587)))))

(assert (=> d!90896 (= (bitIndex!0 (size!6530 (buf!6998 w2!587)) (currentByte!12922 w2!587) (currentBit!12917 w2!587)) lt!408609)))

(declare-fun b!268701 () Bool)

(declare-fun res!224079 () Bool)

(assert (=> b!268701 (=> (not res!224079) (not e!188688))))

(assert (=> b!268701 (= res!224079 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!408609))))

(declare-fun b!268702 () Bool)

(declare-fun lt!408613 () (_ BitVec 64))

(assert (=> b!268702 (= e!188688 (bvsle lt!408609 (bvmul lt!408613 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!268702 (or (= lt!408613 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!408613 #b0000000000000000000000000000000000000000000000000000000000001000) lt!408613)))))

(assert (=> b!268702 (= lt!408613 ((_ sign_extend 32) (size!6530 (buf!6998 w2!587))))))

(assert (= (and d!90896 res!224080) b!268701))

(assert (= (and b!268701 res!224079) b!268702))

(declare-fun m!400239 () Bool)

(assert (=> d!90896 m!400239))

(assert (=> d!90896 m!400157))

(assert (=> b!268664 d!90896))

(assert (=> b!268635 d!90880))

(assert (=> b!268635 d!90896))

(declare-fun d!90898 () Bool)

(assert (=> d!90898 (= (invariant!0 (currentBit!12917 w2!587) (currentByte!12922 w2!587) (size!6530 (buf!6998 w2!587))) (and (bvsge (currentBit!12917 w2!587) #b00000000000000000000000000000000) (bvslt (currentBit!12917 w2!587) #b00000000000000000000000000001000) (bvsge (currentByte!12922 w2!587) #b00000000000000000000000000000000) (or (bvslt (currentByte!12922 w2!587) (size!6530 (buf!6998 w2!587))) (and (= (currentBit!12917 w2!587) #b00000000000000000000000000000000) (= (currentByte!12922 w2!587) (size!6530 (buf!6998 w2!587)))))))))

(assert (=> d!90852 d!90898))

(assert (=> d!90868 d!90856))

(declare-fun d!90900 () Bool)

(assert (=> d!90900 (arrayRangesEq!1065 (buf!6998 w1!591) (buf!6998 w3!25) #b00000000000000000000000000000000 (currentByte!12922 w1!591))))

(assert (=> d!90900 true))

(declare-fun _$16!116 () Unit!19039)

(assert (=> d!90900 (= (choose!381 (buf!6998 w1!591) (buf!6998 w2!587) (buf!6998 w3!25) #b00000000000000000000000000000000 (currentByte!12922 w1!591) (currentByte!12922 w2!587)) _$16!116)))

(declare-fun bs!23061 () Bool)

(assert (= bs!23061 d!90900))

(assert (=> bs!23061 m!400103))

(assert (=> d!90868 d!90900))

(declare-fun d!90902 () Bool)

(declare-fun res!224087 () Bool)

(declare-fun e!188695 () Bool)

(assert (=> d!90902 (=> res!224087 e!188695)))

(assert (=> d!90902 (= res!224087 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12922 w1!591)))))

(assert (=> d!90902 (= (arrayRangesEq!1065 (buf!6998 w1!591) (buf!6998 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12922 w1!591)) e!188695)))

(declare-fun b!268709 () Bool)

(declare-fun e!188696 () Bool)

(assert (=> b!268709 (= e!188695 e!188696)))

(declare-fun res!224088 () Bool)

(assert (=> b!268709 (=> (not res!224088) (not e!188696))))

(assert (=> b!268709 (= res!224088 (= (select (arr!7517 (buf!6998 w1!591)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!7517 (buf!6998 w3!25)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!268710 () Bool)

(assert (=> b!268710 (= e!188696 (arrayRangesEq!1065 (buf!6998 w1!591) (buf!6998 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!12922 w1!591)))))

(assert (= (and d!90902 (not res!224087)) b!268709))

(assert (= (and b!268709 res!224088) b!268710))

(declare-fun m!400241 () Bool)

(assert (=> b!268709 m!400241))

(declare-fun m!400243 () Bool)

(assert (=> b!268709 m!400243))

(declare-fun m!400245 () Bool)

(assert (=> b!268710 m!400245))

(assert (=> b!268652 d!90902))

(assert (=> b!268662 d!90896))

(declare-fun d!90904 () Bool)

(declare-fun e!188701 () Bool)

(assert (=> d!90904 e!188701))

(declare-fun res!224092 () Bool)

(assert (=> d!90904 (=> (not res!224092) (not e!188701))))

(declare-fun lt!408626 () (_ BitVec 64))

(declare-fun lt!408621 () (_ BitVec 64))

(declare-fun lt!408624 () (_ BitVec 64))

(assert (=> d!90904 (= res!224092 (= lt!408621 (bvsub lt!408624 lt!408626)))))

(assert (=> d!90904 (or (= (bvand lt!408624 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!408626 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!408624 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!408624 lt!408626) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!90904 (= lt!408626 (remainingBits!0 ((_ sign_extend 32) (size!6530 (buf!6998 w3!25))) ((_ sign_extend 32) (currentByte!12922 w3!25)) ((_ sign_extend 32) (currentBit!12917 w3!25))))))

(declare-fun lt!408622 () (_ BitVec 64))

(declare-fun lt!408623 () (_ BitVec 64))

(assert (=> d!90904 (= lt!408624 (bvmul lt!408622 lt!408623))))

(assert (=> d!90904 (or (= lt!408622 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!408623 (bvsdiv (bvmul lt!408622 lt!408623) lt!408622)))))

(assert (=> d!90904 (= lt!408623 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!90904 (= lt!408622 ((_ sign_extend 32) (size!6530 (buf!6998 w3!25))))))

(assert (=> d!90904 (= lt!408621 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12922 w3!25)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12917 w3!25))))))

(assert (=> d!90904 (invariant!0 (currentBit!12917 w3!25) (currentByte!12922 w3!25) (size!6530 (buf!6998 w3!25)))))

(assert (=> d!90904 (= (bitIndex!0 (size!6530 (buf!6998 w3!25)) (currentByte!12922 w3!25) (currentBit!12917 w3!25)) lt!408621)))

(declare-fun b!268717 () Bool)

(declare-fun res!224091 () Bool)

(assert (=> b!268717 (=> (not res!224091) (not e!188701))))

(assert (=> b!268717 (= res!224091 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!408621))))

(declare-fun b!268718 () Bool)

(declare-fun lt!408625 () (_ BitVec 64))

(assert (=> b!268718 (= e!188701 (bvsle lt!408621 (bvmul lt!408625 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!268718 (or (= lt!408625 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!408625 #b0000000000000000000000000000000000000000000000000000000000001000) lt!408625)))))

(assert (=> b!268718 (= lt!408625 ((_ sign_extend 32) (size!6530 (buf!6998 w3!25))))))

(assert (= (and d!90904 res!224092) b!268717))

(assert (= (and b!268717 res!224091) b!268718))

(declare-fun m!400247 () Bool)

(assert (=> d!90904 m!400247))

(assert (=> d!90904 m!400159))

(assert (=> b!268662 d!90904))

(check-sat (not b!268684) (not bm!4247) (not b!268685) (not d!90880) (not bm!4248) (not d!90900) (not d!90896) (not b!268699) (not b!268700) (not b!268695) (not b!268710) (not d!90904) (not b!268680))
(check-sat)
