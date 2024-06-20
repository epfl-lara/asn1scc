; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58734 () Bool)

(assert start!58734)

(declare-fun b!269609 () Bool)

(declare-fun e!189525 () Bool)

(declare-datatypes ((array!15026 0))(
  ( (array!15027 (arr!7534 (Array (_ BitVec 32) (_ BitVec 8))) (size!6547 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11908 0))(
  ( (BitStream!11909 (buf!7015 array!15026) (currentByte!12965 (_ BitVec 32)) (currentBit!12960 (_ BitVec 32))) )
))
(declare-fun w1!591 () BitStream!11908)

(declare-fun array_inv!6271 (array!15026) Bool)

(assert (=> b!269609 (= e!189525 (array_inv!6271 (buf!7015 w1!591)))))

(declare-fun b!269610 () Bool)

(declare-fun res!224742 () Bool)

(declare-fun e!189522 () Bool)

(assert (=> b!269610 (=> (not res!224742) (not e!189522))))

(declare-fun w2!587 () BitStream!11908)

(declare-fun w3!25 () BitStream!11908)

(declare-fun isPrefixOf!0 (BitStream!11908 BitStream!11908) Bool)

(assert (=> b!269610 (= res!224742 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun b!269611 () Bool)

(declare-fun e!189523 () Bool)

(assert (=> b!269611 (= e!189523 (array_inv!6271 (buf!7015 w2!587)))))

(declare-fun b!269612 () Bool)

(declare-fun res!224740 () Bool)

(assert (=> b!269612 (=> (not res!224740) (not e!189522))))

(declare-fun arrayRangesEq!1079 (array!15026 array!15026 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!269612 (= res!224740 (arrayRangesEq!1079 (buf!7015 w1!591) (buf!7015 w2!587) #b00000000000000000000000000000000 (currentByte!12965 w1!591)))))

(declare-fun b!269613 () Bool)

(declare-fun res!224743 () Bool)

(assert (=> b!269613 (=> (not res!224743) (not e!189522))))

(assert (=> b!269613 (= res!224743 (and (bvsle #b00000000000000000000000000000000 (currentByte!12965 w1!591)) (bvsle (currentByte!12965 w1!591) (currentByte!12965 w2!587)) (bvsle (size!6547 (buf!7015 w1!591)) (size!6547 (buf!7015 w2!587))) (bvsle (size!6547 (buf!7015 w2!587)) (size!6547 (buf!7015 w3!25))) (bvsle (currentByte!12965 w1!591) (size!6547 (buf!7015 w1!591))) (bvsle (currentByte!12965 w2!587) (size!6547 (buf!7015 w2!587)))))))

(declare-fun b!269614 () Bool)

(assert (=> b!269614 (= e!189522 (not (arrayRangesEq!1079 (buf!7015 w2!587) (buf!7015 w3!25) #b00000000000000000000000000000000 (currentByte!12965 w2!587))))))

(declare-fun b!269615 () Bool)

(declare-fun e!189520 () Bool)

(assert (=> b!269615 (= e!189520 (array_inv!6271 (buf!7015 w3!25)))))

(declare-fun res!224741 () Bool)

(assert (=> start!58734 (=> (not res!224741) (not e!189522))))

(assert (=> start!58734 (= res!224741 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!58734 e!189522))

(declare-fun inv!12 (BitStream!11908) Bool)

(assert (=> start!58734 (and (inv!12 w1!591) e!189525)))

(assert (=> start!58734 (and (inv!12 w2!587) e!189523)))

(assert (=> start!58734 (and (inv!12 w3!25) e!189520)))

(assert (= (and start!58734 res!224741) b!269610))

(assert (= (and b!269610 res!224742) b!269613))

(assert (= (and b!269613 res!224743) b!269612))

(assert (= (and b!269612 res!224740) b!269614))

(assert (= start!58734 b!269609))

(assert (= start!58734 b!269611))

(assert (= start!58734 b!269615))

(declare-fun m!401253 () Bool)

(assert (=> b!269615 m!401253))

(declare-fun m!401255 () Bool)

(assert (=> b!269614 m!401255))

(declare-fun m!401257 () Bool)

(assert (=> start!58734 m!401257))

(declare-fun m!401259 () Bool)

(assert (=> start!58734 m!401259))

(declare-fun m!401261 () Bool)

(assert (=> start!58734 m!401261))

(declare-fun m!401263 () Bool)

(assert (=> start!58734 m!401263))

(declare-fun m!401265 () Bool)

(assert (=> b!269610 m!401265))

(declare-fun m!401267 () Bool)

(assert (=> b!269611 m!401267))

(declare-fun m!401269 () Bool)

(assert (=> b!269609 m!401269))

(declare-fun m!401271 () Bool)

(assert (=> b!269612 m!401271))

(push 1)

(assert (not b!269614))

(assert (not b!269609))

(assert (not b!269610))

(assert (not start!58734))

(assert (not b!269612))

(assert (not b!269615))

(assert (not b!269611))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!91352 () Bool)

(declare-fun res!224795 () Bool)

(declare-fun e!189588 () Bool)

(assert (=> d!91352 (=> (not res!224795) (not e!189588))))

(assert (=> d!91352 (= res!224795 (= (size!6547 (buf!7015 w1!591)) (size!6547 (buf!7015 w2!587))))))

(assert (=> d!91352 (= (isPrefixOf!0 w1!591 w2!587) e!189588)))

(declare-fun b!269685 () Bool)

(declare-fun res!224797 () Bool)

(assert (=> b!269685 (=> (not res!224797) (not e!189588))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!269685 (= res!224797 (bvsle (bitIndex!0 (size!6547 (buf!7015 w1!591)) (currentByte!12965 w1!591) (currentBit!12960 w1!591)) (bitIndex!0 (size!6547 (buf!7015 w2!587)) (currentByte!12965 w2!587) (currentBit!12960 w2!587))))))

(declare-fun b!269686 () Bool)

(declare-fun e!189589 () Bool)

(assert (=> b!269686 (= e!189588 e!189589)))

(declare-fun res!224796 () Bool)

(assert (=> b!269686 (=> res!224796 e!189589)))

(assert (=> b!269686 (= res!224796 (= (size!6547 (buf!7015 w1!591)) #b00000000000000000000000000000000))))

(declare-fun b!269687 () Bool)

(declare-fun arrayBitRangesEq!0 (array!15026 array!15026 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!269687 (= e!189589 (arrayBitRangesEq!0 (buf!7015 w1!591) (buf!7015 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6547 (buf!7015 w1!591)) (currentByte!12965 w1!591) (currentBit!12960 w1!591))))))

(assert (= (and d!91352 res!224795) b!269685))

(assert (= (and b!269685 res!224797) b!269686))

(assert (= (and b!269686 (not res!224796)) b!269687))

(declare-fun m!401327 () Bool)

(assert (=> b!269685 m!401327))

(declare-fun m!401329 () Bool)

(assert (=> b!269685 m!401329))

(assert (=> b!269687 m!401327))

(assert (=> b!269687 m!401327))

(declare-fun m!401333 () Bool)

(assert (=> b!269687 m!401333))

(assert (=> start!58734 d!91352))

(declare-fun d!91364 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!91364 (= (inv!12 w1!591) (invariant!0 (currentBit!12960 w1!591) (currentByte!12965 w1!591) (size!6547 (buf!7015 w1!591))))))

(declare-fun bs!23129 () Bool)

(assert (= bs!23129 d!91364))

(declare-fun m!401347 () Bool)

(assert (=> bs!23129 m!401347))

(assert (=> start!58734 d!91364))

(declare-fun d!91376 () Bool)

(assert (=> d!91376 (= (inv!12 w2!587) (invariant!0 (currentBit!12960 w2!587) (currentByte!12965 w2!587) (size!6547 (buf!7015 w2!587))))))

(declare-fun bs!23130 () Bool)

(assert (= bs!23130 d!91376))

(declare-fun m!401349 () Bool)

(assert (=> bs!23130 m!401349))

(assert (=> start!58734 d!91376))

(declare-fun d!91378 () Bool)

(assert (=> d!91378 (= (inv!12 w3!25) (invariant!0 (currentBit!12960 w3!25) (currentByte!12965 w3!25) (size!6547 (buf!7015 w3!25))))))

(declare-fun bs!23131 () Bool)

(assert (= bs!23131 d!91378))

(declare-fun m!401351 () Bool)

(assert (=> bs!23131 m!401351))

(assert (=> start!58734 d!91378))

(declare-fun d!91380 () Bool)

(assert (=> d!91380 (= (array_inv!6271 (buf!7015 w1!591)) (bvsge (size!6547 (buf!7015 w1!591)) #b00000000000000000000000000000000))))

(assert (=> b!269609 d!91380))

(declare-fun d!91382 () Bool)

(assert (=> d!91382 (= (array_inv!6271 (buf!7015 w3!25)) (bvsge (size!6547 (buf!7015 w3!25)) #b00000000000000000000000000000000))))

(assert (=> b!269615 d!91382))

(declare-fun d!91384 () Bool)

(declare-fun res!224806 () Bool)

(declare-fun e!189596 () Bool)

(assert (=> d!91384 (=> (not res!224806) (not e!189596))))

(assert (=> d!91384 (= res!224806 (= (size!6547 (buf!7015 w2!587)) (size!6547 (buf!7015 w3!25))))))

(assert (=> d!91384 (= (isPrefixOf!0 w2!587 w3!25) e!189596)))

(declare-fun b!269696 () Bool)

(declare-fun res!224808 () Bool)

(assert (=> b!269696 (=> (not res!224808) (not e!189596))))

(assert (=> b!269696 (= res!224808 (bvsle (bitIndex!0 (size!6547 (buf!7015 w2!587)) (currentByte!12965 w2!587) (currentBit!12960 w2!587)) (bitIndex!0 (size!6547 (buf!7015 w3!25)) (currentByte!12965 w3!25) (currentBit!12960 w3!25))))))

(declare-fun b!269697 () Bool)

(declare-fun e!189597 () Bool)

(assert (=> b!269697 (= e!189596 e!189597)))

(declare-fun res!224807 () Bool)

(assert (=> b!269697 (=> res!224807 e!189597)))

(assert (=> b!269697 (= res!224807 (= (size!6547 (buf!7015 w2!587)) #b00000000000000000000000000000000))))

(declare-fun b!269698 () Bool)

(assert (=> b!269698 (= e!189597 (arrayBitRangesEq!0 (buf!7015 w2!587) (buf!7015 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6547 (buf!7015 w2!587)) (currentByte!12965 w2!587) (currentBit!12960 w2!587))))))

(assert (= (and d!91384 res!224806) b!269696))

(assert (= (and b!269696 res!224808) b!269697))

(assert (= (and b!269697 (not res!224807)) b!269698))

(assert (=> b!269696 m!401329))

(declare-fun m!401357 () Bool)

(assert (=> b!269696 m!401357))

(assert (=> b!269698 m!401329))

(assert (=> b!269698 m!401329))

(declare-fun m!401359 () Bool)

(assert (=> b!269698 m!401359))

(assert (=> b!269610 d!91384))

(declare-fun d!91386 () Bool)

(assert (=> d!91386 (= (array_inv!6271 (buf!7015 w2!587)) (bvsge (size!6547 (buf!7015 w2!587)) #b00000000000000000000000000000000))))

(assert (=> b!269611 d!91386))

(declare-fun d!91388 () Bool)

(declare-fun res!224824 () Bool)

(declare-fun e!189612 () Bool)

(assert (=> d!91388 (=> res!224824 e!189612)))

(assert (=> d!91388 (= res!224824 (= #b00000000000000000000000000000000 (currentByte!12965 w1!591)))))

(assert (=> d!91388 (= (arrayRangesEq!1079 (buf!7015 w1!591) (buf!7015 w2!587) #b00000000000000000000000000000000 (currentByte!12965 w1!591)) e!189612)))

(declare-fun b!269714 () Bool)

(declare-fun e!189613 () Bool)

(assert (=> b!269714 (= e!189612 e!189613)))

(declare-fun res!224825 () Bool)

(assert (=> b!269714 (=> (not res!224825) (not e!189613))))

(assert (=> b!269714 (= res!224825 (= (select (arr!7534 (buf!7015 w1!591)) #b00000000000000000000000000000000) (select (arr!7534 (buf!7015 w2!587)) #b00000000000000000000000000000000)))))

(declare-fun b!269715 () Bool)

(assert (=> b!269715 (= e!189613 (arrayRangesEq!1079 (buf!7015 w1!591) (buf!7015 w2!587) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12965 w1!591)))))

(assert (= (and d!91388 (not res!224824)) b!269714))

(assert (= (and b!269714 res!224825) b!269715))

(declare-fun m!401375 () Bool)

(assert (=> b!269714 m!401375))

(declare-fun m!401377 () Bool)

(assert (=> b!269714 m!401377))

(declare-fun m!401379 () Bool)

(assert (=> b!269715 m!401379))

(assert (=> b!269612 d!91388))

(declare-fun d!91398 () Bool)

(declare-fun res!224826 () Bool)

(declare-fun e!189614 () Bool)

(assert (=> d!91398 (=> res!224826 e!189614)))

(assert (=> d!91398 (= res!224826 (= #b00000000000000000000000000000000 (currentByte!12965 w2!587)))))

(assert (=> d!91398 (= (arrayRangesEq!1079 (buf!7015 w2!587) (buf!7015 w3!25) #b00000000000000000000000000000000 (currentByte!12965 w2!587)) e!189614)))

(declare-fun b!269716 () Bool)

(declare-fun e!189615 () Bool)

(assert (=> b!269716 (= e!189614 e!189615)))

(declare-fun res!224827 () Bool)

(assert (=> b!269716 (=> (not res!224827) (not e!189615))))

(assert (=> b!269716 (= res!224827 (= (select (arr!7534 (buf!7015 w2!587)) #b00000000000000000000000000000000) (select (arr!7534 (buf!7015 w3!25)) #b00000000000000000000000000000000)))))

(declare-fun b!269717 () Bool)

(assert (=> b!269717 (= e!189615 (arrayRangesEq!1079 (buf!7015 w2!587) (buf!7015 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12965 w2!587)))))

(assert (= (and d!91398 (not res!224826)) b!269716))

(assert (= (and b!269716 res!224827) b!269717))

(assert (=> b!269716 m!401377))

(declare-fun m!401383 () Bool)

(assert (=> b!269716 m!401383))

(declare-fun m!401385 () Bool)

(assert (=> b!269717 m!401385))

(assert (=> b!269614 d!91398))

(push 1)

(assert (not b!269698))

(assert (not b!269687))

(assert (not b!269696))

(assert (not d!91364))

(assert (not b!269715))

(assert (not d!91378))

(assert (not d!91376))

(assert (not b!269717))

(assert (not b!269685))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!91406 () Bool)

(declare-fun res!224828 () Bool)

(declare-fun e!189616 () Bool)

(assert (=> d!91406 (=> res!224828 e!189616)))

(assert (=> d!91406 (= res!224828 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12965 w2!587)))))

(assert (=> d!91406 (= (arrayRangesEq!1079 (buf!7015 w2!587) (buf!7015 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12965 w2!587)) e!189616)))

(declare-fun b!269718 () Bool)

(declare-fun e!189617 () Bool)

(assert (=> b!269718 (= e!189616 e!189617)))

(declare-fun res!224829 () Bool)

(assert (=> b!269718 (=> (not res!224829) (not e!189617))))

(assert (=> b!269718 (= res!224829 (= (select (arr!7534 (buf!7015 w2!587)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!7534 (buf!7015 w3!25)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!269719 () Bool)

(assert (=> b!269719 (= e!189617 (arrayRangesEq!1079 (buf!7015 w2!587) (buf!7015 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!12965 w2!587)))))

(assert (= (and d!91406 (not res!224828)) b!269718))

(assert (= (and b!269718 res!224829) b!269719))

(declare-fun m!401391 () Bool)

(assert (=> b!269718 m!401391))

(declare-fun m!401393 () Bool)

(assert (=> b!269718 m!401393))

(declare-fun m!401395 () Bool)

(assert (=> b!269719 m!401395))

(assert (=> b!269717 d!91406))

(declare-fun d!91410 () Bool)

(assert (=> d!91410 (= (invariant!0 (currentBit!12960 w2!587) (currentByte!12965 w2!587) (size!6547 (buf!7015 w2!587))) (and (bvsge (currentBit!12960 w2!587) #b00000000000000000000000000000000) (bvslt (currentBit!12960 w2!587) #b00000000000000000000000000001000) (bvsge (currentByte!12965 w2!587) #b00000000000000000000000000000000) (or (bvslt (currentByte!12965 w2!587) (size!6547 (buf!7015 w2!587))) (and (= (currentBit!12960 w2!587) #b00000000000000000000000000000000) (= (currentByte!12965 w2!587) (size!6547 (buf!7015 w2!587)))))))))

(assert (=> d!91376 d!91410))

(declare-fun d!91412 () Bool)

(assert (=> d!91412 (= (invariant!0 (currentBit!12960 w3!25) (currentByte!12965 w3!25) (size!6547 (buf!7015 w3!25))) (and (bvsge (currentBit!12960 w3!25) #b00000000000000000000000000000000) (bvslt (currentBit!12960 w3!25) #b00000000000000000000000000001000) (bvsge (currentByte!12965 w3!25) #b00000000000000000000000000000000) (or (bvslt (currentByte!12965 w3!25) (size!6547 (buf!7015 w3!25))) (and (= (currentBit!12960 w3!25) #b00000000000000000000000000000000) (= (currentByte!12965 w3!25) (size!6547 (buf!7015 w3!25)))))))))

(assert (=> d!91378 d!91412))

(declare-fun d!91414 () Bool)

(declare-fun e!189627 () Bool)

(assert (=> d!91414 e!189627))

(declare-fun res!224846 () Bool)

(assert (=> d!91414 (=> (not res!224846) (not e!189627))))

(declare-fun lt!409156 () (_ BitVec 64))

(declare-fun lt!409157 () (_ BitVec 64))

(declare-fun lt!409154 () (_ BitVec 64))

(assert (=> d!91414 (= res!224846 (= lt!409154 (bvsub lt!409156 lt!409157)))))

(assert (=> d!91414 (or (= (bvand lt!409156 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!409157 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!409156 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!409156 lt!409157) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!91414 (= lt!409157 (remainingBits!0 ((_ sign_extend 32) (size!6547 (buf!7015 w2!587))) ((_ sign_extend 32) (currentByte!12965 w2!587)) ((_ sign_extend 32) (currentBit!12960 w2!587))))))

(declare-fun lt!409152 () (_ BitVec 64))

(declare-fun lt!409155 () (_ BitVec 64))

(assert (=> d!91414 (= lt!409156 (bvmul lt!409152 lt!409155))))

(assert (=> d!91414 (or (= lt!409152 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!409155 (bvsdiv (bvmul lt!409152 lt!409155) lt!409152)))))

(assert (=> d!91414 (= lt!409155 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!91414 (= lt!409152 ((_ sign_extend 32) (size!6547 (buf!7015 w2!587))))))

(assert (=> d!91414 (= lt!409154 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12965 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12960 w2!587))))))

(assert (=> d!91414 (invariant!0 (currentBit!12960 w2!587) (currentByte!12965 w2!587) (size!6547 (buf!7015 w2!587)))))

(assert (=> d!91414 (= (bitIndex!0 (size!6547 (buf!7015 w2!587)) (currentByte!12965 w2!587) (currentBit!12960 w2!587)) lt!409154)))

(declare-fun b!269736 () Bool)

(declare-fun res!224847 () Bool)

(assert (=> b!269736 (=> (not res!224847) (not e!189627))))

(assert (=> b!269736 (= res!224847 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!409154))))

(declare-fun b!269737 () Bool)

(declare-fun lt!409153 () (_ BitVec 64))

(assert (=> b!269737 (= e!189627 (bvsle lt!409154 (bvmul lt!409153 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!269737 (or (= lt!409153 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!409153 #b0000000000000000000000000000000000000000000000000000000000001000) lt!409153)))))

(assert (=> b!269737 (= lt!409153 ((_ sign_extend 32) (size!6547 (buf!7015 w2!587))))))

(assert (= (and d!91414 res!224846) b!269736))

(assert (= (and b!269736 res!224847) b!269737))

(declare-fun m!401409 () Bool)

(assert (=> d!91414 m!401409))

(assert (=> d!91414 m!401349))

(assert (=> b!269696 d!91414))

(declare-fun d!91426 () Bool)

(declare-fun e!189630 () Bool)

(assert (=> d!91426 e!189630))

(declare-fun res!224850 () Bool)

(assert (=> d!91426 (=> (not res!224850) (not e!189630))))

(declare-fun lt!409160 () (_ BitVec 64))

(declare-fun lt!409163 () (_ BitVec 64))

(declare-fun lt!409162 () (_ BitVec 64))

(assert (=> d!91426 (= res!224850 (= lt!409160 (bvsub lt!409162 lt!409163)))))

(assert (=> d!91426 (or (= (bvand lt!409162 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!409163 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!409162 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!409162 lt!409163) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!91426 (= lt!409163 (remainingBits!0 ((_ sign_extend 32) (size!6547 (buf!7015 w3!25))) ((_ sign_extend 32) (currentByte!12965 w3!25)) ((_ sign_extend 32) (currentBit!12960 w3!25))))))

(declare-fun lt!409158 () (_ BitVec 64))

(declare-fun lt!409161 () (_ BitVec 64))

(assert (=> d!91426 (= lt!409162 (bvmul lt!409158 lt!409161))))

(assert (=> d!91426 (or (= lt!409158 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!409161 (bvsdiv (bvmul lt!409158 lt!409161) lt!409158)))))

(assert (=> d!91426 (= lt!409161 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!91426 (= lt!409158 ((_ sign_extend 32) (size!6547 (buf!7015 w3!25))))))

(assert (=> d!91426 (= lt!409160 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12965 w3!25)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12960 w3!25))))))

(assert (=> d!91426 (invariant!0 (currentBit!12960 w3!25) (currentByte!12965 w3!25) (size!6547 (buf!7015 w3!25)))))

(assert (=> d!91426 (= (bitIndex!0 (size!6547 (buf!7015 w3!25)) (currentByte!12965 w3!25) (currentBit!12960 w3!25)) lt!409160)))

(declare-fun b!269740 () Bool)

(declare-fun res!224851 () Bool)

(assert (=> b!269740 (=> (not res!224851) (not e!189630))))

(assert (=> b!269740 (= res!224851 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!409160))))

(declare-fun b!269741 () Bool)

(declare-fun lt!409159 () (_ BitVec 64))

(assert (=> b!269741 (= e!189630 (bvsle lt!409160 (bvmul lt!409159 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!269741 (or (= lt!409159 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!409159 #b0000000000000000000000000000000000000000000000000000000000001000) lt!409159)))))

(assert (=> b!269741 (= lt!409159 ((_ sign_extend 32) (size!6547 (buf!7015 w3!25))))))

(assert (= (and d!91426 res!224850) b!269740))

(assert (= (and b!269740 res!224851) b!269741))

(declare-fun m!401415 () Bool)

(assert (=> d!91426 m!401415))

(assert (=> d!91426 m!401351))

(assert (=> b!269696 d!91426))

(declare-fun d!91430 () Bool)

(assert (=> d!91430 (= (invariant!0 (currentBit!12960 w1!591) (currentByte!12965 w1!591) (size!6547 (buf!7015 w1!591))) (and (bvsge (currentBit!12960 w1!591) #b00000000000000000000000000000000) (bvslt (currentBit!12960 w1!591) #b00000000000000000000000000001000) (bvsge (currentByte!12965 w1!591) #b00000000000000000000000000000000) (or (bvslt (currentByte!12965 w1!591) (size!6547 (buf!7015 w1!591))) (and (= (currentBit!12960 w1!591) #b00000000000000000000000000000000) (= (currentByte!12965 w1!591) (size!6547 (buf!7015 w1!591)))))))))

(assert (=> d!91364 d!91430))

(declare-fun d!91434 () Bool)

(declare-fun e!189631 () Bool)

(assert (=> d!91434 e!189631))

(declare-fun res!224852 () Bool)

(assert (=> d!91434 (=> (not res!224852) (not e!189631))))

(declare-fun lt!409169 () (_ BitVec 64))

(declare-fun lt!409168 () (_ BitVec 64))

(declare-fun lt!409166 () (_ BitVec 64))

(assert (=> d!91434 (= res!224852 (= lt!409166 (bvsub lt!409168 lt!409169)))))

(assert (=> d!91434 (or (= (bvand lt!409168 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!409169 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!409168 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!409168 lt!409169) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!91434 (= lt!409169 (remainingBits!0 ((_ sign_extend 32) (size!6547 (buf!7015 w1!591))) ((_ sign_extend 32) (currentByte!12965 w1!591)) ((_ sign_extend 32) (currentBit!12960 w1!591))))))

(declare-fun lt!409164 () (_ BitVec 64))

(declare-fun lt!409167 () (_ BitVec 64))

(assert (=> d!91434 (= lt!409168 (bvmul lt!409164 lt!409167))))

(assert (=> d!91434 (or (= lt!409164 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!409167 (bvsdiv (bvmul lt!409164 lt!409167) lt!409164)))))

(assert (=> d!91434 (= lt!409167 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!91434 (= lt!409164 ((_ sign_extend 32) (size!6547 (buf!7015 w1!591))))))

(assert (=> d!91434 (= lt!409166 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12965 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12960 w1!591))))))

(assert (=> d!91434 (invariant!0 (currentBit!12960 w1!591) (currentByte!12965 w1!591) (size!6547 (buf!7015 w1!591)))))

(assert (=> d!91434 (= (bitIndex!0 (size!6547 (buf!7015 w1!591)) (currentByte!12965 w1!591) (currentBit!12960 w1!591)) lt!409166)))

(declare-fun b!269742 () Bool)

(declare-fun res!224853 () Bool)

(assert (=> b!269742 (=> (not res!224853) (not e!189631))))

(assert (=> b!269742 (= res!224853 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!409166))))

(declare-fun b!269743 () Bool)

(declare-fun lt!409165 () (_ BitVec 64))

(assert (=> b!269743 (= e!189631 (bvsle lt!409166 (bvmul lt!409165 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!269743 (or (= lt!409165 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!409165 #b0000000000000000000000000000000000000000000000000000000000001000) lt!409165)))))

(assert (=> b!269743 (= lt!409165 ((_ sign_extend 32) (size!6547 (buf!7015 w1!591))))))

(assert (= (and d!91434 res!224852) b!269742))

(assert (= (and b!269742 res!224853) b!269743))

(declare-fun m!401417 () Bool)

(assert (=> d!91434 m!401417))

(assert (=> d!91434 m!401347))

(assert (=> b!269685 d!91434))

(assert (=> b!269685 d!91414))

(declare-fun b!269793 () Bool)

(declare-fun e!189676 () Bool)

(declare-fun call!4303 () Bool)

(assert (=> b!269793 (= e!189676 call!4303)))

(declare-fun b!269794 () Bool)

(declare-fun e!189678 () Bool)

(declare-fun e!189674 () Bool)

(assert (=> b!269794 (= e!189678 e!189674)))

(declare-fun lt!409191 () (_ BitVec 32))

(declare-fun res!224892 () Bool)

(declare-datatypes ((tuple4!448 0))(
  ( (tuple4!449 (_1!12207 (_ BitVec 32)) (_2!12207 (_ BitVec 32)) (_3!1004 (_ BitVec 32)) (_4!224 (_ BitVec 32))) )
))
(declare-fun lt!409193 () tuple4!448)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!269794 (= res!224892 (byteRangesEq!0 (select (arr!7534 (buf!7015 w2!587)) (_3!1004 lt!409193)) (select (arr!7534 (buf!7015 w3!25)) (_3!1004 lt!409193)) lt!409191 #b00000000000000000000000000001000))))

(assert (=> b!269794 (=> (not res!224892) (not e!189674))))

(declare-fun d!91436 () Bool)

(declare-fun res!224891 () Bool)

(declare-fun e!189677 () Bool)

(assert (=> d!91436 (=> res!224891 e!189677)))

(assert (=> d!91436 (= res!224891 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6547 (buf!7015 w2!587)) (currentByte!12965 w2!587) (currentBit!12960 w2!587))))))

(assert (=> d!91436 (= (arrayBitRangesEq!0 (buf!7015 w2!587) (buf!7015 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6547 (buf!7015 w2!587)) (currentByte!12965 w2!587) (currentBit!12960 w2!587))) e!189677)))

(declare-fun b!269795 () Bool)

(declare-fun e!189679 () Bool)

(assert (=> b!269795 (= e!189679 (arrayRangesEq!1079 (buf!7015 w2!587) (buf!7015 w3!25) (_1!12207 lt!409193) (_2!12207 lt!409193)))))

(declare-fun b!269796 () Bool)

(declare-fun e!189675 () Bool)

(assert (=> b!269796 (= e!189677 e!189675)))

(declare-fun res!224893 () Bool)

(assert (=> b!269796 (=> (not res!224893) (not e!189675))))

(assert (=> b!269796 (= res!224893 e!189679)))

(declare-fun res!224889 () Bool)

(assert (=> b!269796 (=> res!224889 e!189679)))

(assert (=> b!269796 (= res!224889 (bvsge (_1!12207 lt!409193) (_2!12207 lt!409193)))))

(declare-fun lt!409192 () (_ BitVec 32))

(assert (=> b!269796 (= lt!409192 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6547 (buf!7015 w2!587)) (currentByte!12965 w2!587) (currentBit!12960 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!269796 (= lt!409191 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!448)

(assert (=> b!269796 (= lt!409193 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6547 (buf!7015 w2!587)) (currentByte!12965 w2!587) (currentBit!12960 w2!587))))))

(declare-fun c!12452 () Bool)

(declare-fun bm!4300 () Bool)

(assert (=> bm!4300 (= call!4303 (byteRangesEq!0 (ite c!12452 (select (arr!7534 (buf!7015 w2!587)) (_3!1004 lt!409193)) (select (arr!7534 (buf!7015 w2!587)) (_4!224 lt!409193))) (ite c!12452 (select (arr!7534 (buf!7015 w3!25)) (_3!1004 lt!409193)) (select (arr!7534 (buf!7015 w3!25)) (_4!224 lt!409193))) (ite c!12452 lt!409191 #b00000000000000000000000000000000) lt!409192))))

(declare-fun b!269797 () Bool)

(assert (=> b!269797 (= e!189678 call!4303)))

(declare-fun b!269798 () Bool)

(declare-fun res!224890 () Bool)

(assert (=> b!269798 (= res!224890 (= lt!409192 #b00000000000000000000000000000000))))

(assert (=> b!269798 (=> res!224890 e!189676)))

(assert (=> b!269798 (= e!189674 e!189676)))

(declare-fun b!269799 () Bool)

(assert (=> b!269799 (= e!189675 e!189678)))

(assert (=> b!269799 (= c!12452 (= (_3!1004 lt!409193) (_4!224 lt!409193)))))

(assert (= (and d!91436 (not res!224891)) b!269796))

(assert (= (and b!269796 (not res!224889)) b!269795))

(assert (= (and b!269796 res!224893) b!269799))

(assert (= (and b!269799 c!12452) b!269797))

(assert (= (and b!269799 (not c!12452)) b!269794))

(assert (= (and b!269794 res!224892) b!269798))

(assert (= (and b!269798 (not res!224890)) b!269793))

(assert (= (or b!269797 b!269793) bm!4300))

(declare-fun m!401427 () Bool)

(assert (=> b!269794 m!401427))

(declare-fun m!401431 () Bool)

(assert (=> b!269794 m!401431))

(assert (=> b!269794 m!401427))

(assert (=> b!269794 m!401431))

(declare-fun m!401433 () Bool)

(assert (=> b!269794 m!401433))

(declare-fun m!401439 () Bool)

(assert (=> b!269795 m!401439))

(assert (=> b!269796 m!401329))

(declare-fun m!401445 () Bool)

(assert (=> b!269796 m!401445))

(declare-fun m!401449 () Bool)

(assert (=> bm!4300 m!401449))

(declare-fun m!401451 () Bool)

(assert (=> bm!4300 m!401451))

(assert (=> bm!4300 m!401431))

(declare-fun m!401459 () Bool)

(assert (=> bm!4300 m!401459))

(assert (=> bm!4300 m!401427))

(assert (=> b!269698 d!91436))

(assert (=> b!269698 d!91414))

(declare-fun d!91442 () Bool)

(declare-fun res!224899 () Bool)

(declare-fun e!189686 () Bool)

(assert (=> d!91442 (=> res!224899 e!189686)))

(assert (=> d!91442 (= res!224899 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12965 w1!591)))))

(assert (=> d!91442 (= (arrayRangesEq!1079 (buf!7015 w1!591) (buf!7015 w2!587) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12965 w1!591)) e!189686)))

(declare-fun b!269807 () Bool)

(declare-fun e!189687 () Bool)

(assert (=> b!269807 (= e!189686 e!189687)))

(declare-fun res!224900 () Bool)

(assert (=> b!269807 (=> (not res!224900) (not e!189687))))

(assert (=> b!269807 (= res!224900 (= (select (arr!7534 (buf!7015 w1!591)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!7534 (buf!7015 w2!587)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!269808 () Bool)

(assert (=> b!269808 (= e!189687 (arrayRangesEq!1079 (buf!7015 w1!591) (buf!7015 w2!587) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!12965 w1!591)))))

(assert (= (and d!91442 (not res!224899)) b!269807))

(assert (= (and b!269807 res!224900) b!269808))

(declare-fun m!401467 () Bool)

(assert (=> b!269807 m!401467))

(assert (=> b!269807 m!401391))

(declare-fun m!401469 () Bool)

(assert (=> b!269808 m!401469))

(assert (=> b!269715 d!91442))

(declare-fun b!269816 () Bool)

(declare-fun e!189696 () Bool)

(declare-fun call!4306 () Bool)

(assert (=> b!269816 (= e!189696 call!4306)))

(declare-fun b!269817 () Bool)

(declare-fun e!189698 () Bool)

(declare-fun e!189694 () Bool)

(assert (=> b!269817 (= e!189698 e!189694)))

(declare-fun lt!409200 () (_ BitVec 32))

(declare-fun lt!409202 () tuple4!448)

(declare-fun res!224909 () Bool)

(assert (=> b!269817 (= res!224909 (byteRangesEq!0 (select (arr!7534 (buf!7015 w1!591)) (_3!1004 lt!409202)) (select (arr!7534 (buf!7015 w2!587)) (_3!1004 lt!409202)) lt!409200 #b00000000000000000000000000001000))))

(assert (=> b!269817 (=> (not res!224909) (not e!189694))))

(declare-fun d!91446 () Bool)

(declare-fun res!224908 () Bool)

(declare-fun e!189697 () Bool)

(assert (=> d!91446 (=> res!224908 e!189697)))

(assert (=> d!91446 (= res!224908 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6547 (buf!7015 w1!591)) (currentByte!12965 w1!591) (currentBit!12960 w1!591))))))

(assert (=> d!91446 (= (arrayBitRangesEq!0 (buf!7015 w1!591) (buf!7015 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6547 (buf!7015 w1!591)) (currentByte!12965 w1!591) (currentBit!12960 w1!591))) e!189697)))

(declare-fun e!189699 () Bool)

(declare-fun b!269818 () Bool)

(assert (=> b!269818 (= e!189699 (arrayRangesEq!1079 (buf!7015 w1!591) (buf!7015 w2!587) (_1!12207 lt!409202) (_2!12207 lt!409202)))))

(declare-fun b!269819 () Bool)

(declare-fun e!189695 () Bool)

(assert (=> b!269819 (= e!189697 e!189695)))

(declare-fun res!224910 () Bool)

(assert (=> b!269819 (=> (not res!224910) (not e!189695))))

(assert (=> b!269819 (= res!224910 e!189699)))

(declare-fun res!224906 () Bool)

(assert (=> b!269819 (=> res!224906 e!189699)))

(assert (=> b!269819 (= res!224906 (bvsge (_1!12207 lt!409202) (_2!12207 lt!409202)))))

(declare-fun lt!409201 () (_ BitVec 32))

(assert (=> b!269819 (= lt!409201 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6547 (buf!7015 w1!591)) (currentByte!12965 w1!591) (currentBit!12960 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!269819 (= lt!409200 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!269819 (= lt!409202 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6547 (buf!7015 w1!591)) (currentByte!12965 w1!591) (currentBit!12960 w1!591))))))

(declare-fun c!12455 () Bool)

(declare-fun bm!4303 () Bool)

(assert (=> bm!4303 (= call!4306 (byteRangesEq!0 (ite c!12455 (select (arr!7534 (buf!7015 w1!591)) (_3!1004 lt!409202)) (select (arr!7534 (buf!7015 w1!591)) (_4!224 lt!409202))) (ite c!12455 (select (arr!7534 (buf!7015 w2!587)) (_3!1004 lt!409202)) (select (arr!7534 (buf!7015 w2!587)) (_4!224 lt!409202))) (ite c!12455 lt!409200 #b00000000000000000000000000000000) lt!409201))))

(declare-fun b!269820 () Bool)

(assert (=> b!269820 (= e!189698 call!4306)))

(declare-fun b!269821 () Bool)

(declare-fun res!224907 () Bool)

(assert (=> b!269821 (= res!224907 (= lt!409201 #b00000000000000000000000000000000))))

(assert (=> b!269821 (=> res!224907 e!189696)))

(assert (=> b!269821 (= e!189694 e!189696)))

(declare-fun b!269822 () Bool)

(assert (=> b!269822 (= e!189695 e!189698)))

(assert (=> b!269822 (= c!12455 (= (_3!1004 lt!409202) (_4!224 lt!409202)))))

(assert (= (and d!91446 (not res!224908)) b!269819))

(assert (= (and b!269819 (not res!224906)) b!269818))

(assert (= (and b!269819 res!224910) b!269822))

(assert (= (and b!269822 c!12455) b!269820))

(assert (= (and b!269822 (not c!12455)) b!269817))

(assert (= (and b!269817 res!224909) b!269821))

(assert (= (and b!269821 (not res!224907)) b!269816))

(assert (= (or b!269820 b!269816) bm!4303))

(declare-fun m!401481 () Bool)

(assert (=> b!269817 m!401481))

(declare-fun m!401483 () Bool)

(assert (=> b!269817 m!401483))

(assert (=> b!269817 m!401481))

(assert (=> b!269817 m!401483))

(declare-fun m!401489 () Bool)

(assert (=> b!269817 m!401489))

(declare-fun m!401493 () Bool)

(assert (=> b!269818 m!401493))

(assert (=> b!269819 m!401327))

(declare-fun m!401495 () Bool)

(assert (=> b!269819 m!401495))

(declare-fun m!401497 () Bool)

(assert (=> bm!4303 m!401497))

(declare-fun m!401499 () Bool)

(assert (=> bm!4303 m!401499))

(assert (=> bm!4303 m!401483))

(declare-fun m!401501 () Bool)

(assert (=> bm!4303 m!401501))

(assert (=> bm!4303 m!401481))

(assert (=> b!269687 d!91446))

(assert (=> b!269687 d!91434))

(push 1)

(assert (not b!269818))

(assert (not b!269819))

(assert (not b!269796))

(assert (not b!269794))

(assert (not bm!4303))

(assert (not d!91426))

(assert (not d!91414))

(assert (not b!269817))

(assert (not bm!4300))

(assert (not d!91434))

(assert (not b!269808))

(assert (not b!269795))

(assert (not b!269719))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!91518 () Bool)

(assert (=> d!91518 (= (byteRangesEq!0 (ite c!12452 (select (arr!7534 (buf!7015 w2!587)) (_3!1004 lt!409193)) (select (arr!7534 (buf!7015 w2!587)) (_4!224 lt!409193))) (ite c!12452 (select (arr!7534 (buf!7015 w3!25)) (_3!1004 lt!409193)) (select (arr!7534 (buf!7015 w3!25)) (_4!224 lt!409193))) (ite c!12452 lt!409191 #b00000000000000000000000000000000) lt!409192) (or (= (ite c!12452 lt!409191 #b00000000000000000000000000000000) lt!409192) (= (bvand (bvand (bvand ((_ sign_extend 24) (ite c!12452 (select (arr!7534 (buf!7015 w2!587)) (_3!1004 lt!409193)) (select (arr!7534 (buf!7015 w2!587)) (_4!224 lt!409193)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!409192))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!12452 lt!409191 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (ite c!12452 (select (arr!7534 (buf!7015 w3!25)) (_3!1004 lt!409193)) (select (arr!7534 (buf!7015 w3!25)) (_4!224 lt!409193)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!409192))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!12452 lt!409191 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111))))))

(declare-fun bs!23143 () Bool)

(assert (= bs!23143 d!91518))

(declare-fun m!401607 () Bool)

(assert (=> bs!23143 m!401607))

(declare-fun m!401609 () Bool)

(assert (=> bs!23143 m!401609))

(assert (=> bm!4300 d!91518))

(declare-fun d!91520 () Bool)

(declare-fun res!224946 () Bool)

(declare-fun e!189731 () Bool)

(assert (=> d!91520 (=> res!224946 e!189731)))

(assert (=> d!91520 (= res!224946 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!12965 w1!591)))))

(assert (=> d!91520 (= (arrayRangesEq!1079 (buf!7015 w1!591) (buf!7015 w2!587) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!12965 w1!591)) e!189731)))

(declare-fun b!269860 () Bool)

(declare-fun e!189732 () Bool)

(assert (=> b!269860 (= e!189731 e!189732)))

(declare-fun res!224947 () Bool)

(assert (=> b!269860 (=> (not res!224947) (not e!189732))))

(assert (=> b!269860 (= res!224947 (= (select (arr!7534 (buf!7015 w1!591)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (select (arr!7534 (buf!7015 w2!587)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!269861 () Bool)

(assert (=> b!269861 (= e!189732 (arrayRangesEq!1079 (buf!7015 w1!591) (buf!7015 w2!587) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!12965 w1!591)))))

(assert (= (and d!91520 (not res!224946)) b!269860))

(assert (= (and b!269860 res!224947) b!269861))

(declare-fun m!401611 () Bool)

(assert (=> b!269860 m!401611))

(declare-fun m!401613 () Bool)

(assert (=> b!269860 m!401613))

(declare-fun m!401615 () Bool)

(assert (=> b!269861 m!401615))

(assert (=> b!269808 d!91520))

(declare-fun d!91522 () Bool)

(assert (=> d!91522 (= (byteRangesEq!0 (ite c!12455 (select (arr!7534 (buf!7015 w1!591)) (_3!1004 lt!409202)) (select (arr!7534 (buf!7015 w1!591)) (_4!224 lt!409202))) (ite c!12455 (select (arr!7534 (buf!7015 w2!587)) (_3!1004 lt!409202)) (select (arr!7534 (buf!7015 w2!587)) (_4!224 lt!409202))) (ite c!12455 lt!409200 #b00000000000000000000000000000000) lt!409201) (or (= (ite c!12455 lt!409200 #b00000000000000000000000000000000) lt!409201) (= (bvand (bvand (bvand ((_ sign_extend 24) (ite c!12455 (select (arr!7534 (buf!7015 w1!591)) (_3!1004 lt!409202)) (select (arr!7534 (buf!7015 w1!591)) (_4!224 lt!409202)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!409201))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!12455 lt!409200 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (ite c!12455 (select (arr!7534 (buf!7015 w2!587)) (_3!1004 lt!409202)) (select (arr!7534 (buf!7015 w2!587)) (_4!224 lt!409202)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!409201))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!12455 lt!409200 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111))))))

(declare-fun bs!23144 () Bool)

(assert (= bs!23144 d!91522))

(declare-fun m!401617 () Bool)

(assert (=> bs!23144 m!401617))

(declare-fun m!401619 () Bool)

(assert (=> bs!23144 m!401619))

(assert (=> bm!4303 d!91522))

(declare-fun d!91524 () Bool)

(assert (=> d!91524 (= (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6547 (buf!7015 w2!587)) (currentByte!12965 w2!587) (currentBit!12960 w2!587))) (tuple4!449 ((_ extract 31 0) (bvadd (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!6547 (buf!7015 w2!587)) (currentByte!12965 w2!587) (currentBit!12960 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!6547 (buf!7015 w2!587)) (currentByte!12965 w2!587) (currentBit!12960 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!269796 d!91524))

(declare-fun d!91526 () Bool)

(assert (=> d!91526 (= (remainingBits!0 ((_ sign_extend 32) (size!6547 (buf!7015 w2!587))) ((_ sign_extend 32) (currentByte!12965 w2!587)) ((_ sign_extend 32) (currentBit!12960 w2!587))) (bvsub (bvmul ((_ sign_extend 32) (size!6547 (buf!7015 w2!587))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12965 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12960 w2!587)))))))

(assert (=> d!91414 d!91526))

(assert (=> d!91414 d!91410))

(declare-fun d!91528 () Bool)

(assert (=> d!91528 (= (remainingBits!0 ((_ sign_extend 32) (size!6547 (buf!7015 w1!591))) ((_ sign_extend 32) (currentByte!12965 w1!591)) ((_ sign_extend 32) (currentBit!12960 w1!591))) (bvsub (bvmul ((_ sign_extend 32) (size!6547 (buf!7015 w1!591))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12965 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12960 w1!591)))))))

(assert (=> d!91434 d!91528))

(assert (=> d!91434 d!91430))

(declare-fun d!91530 () Bool)

(declare-fun res!224948 () Bool)

(declare-fun e!189733 () Bool)

(assert (=> d!91530 (=> res!224948 e!189733)))

(assert (=> d!91530 (= res!224948 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!12965 w2!587)))))

(assert (=> d!91530 (= (arrayRangesEq!1079 (buf!7015 w2!587) (buf!7015 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!12965 w2!587)) e!189733)))

(declare-fun b!269862 () Bool)

(declare-fun e!189734 () Bool)

(assert (=> b!269862 (= e!189733 e!189734)))

(declare-fun res!224949 () Bool)

(assert (=> b!269862 (=> (not res!224949) (not e!189734))))

(assert (=> b!269862 (= res!224949 (= (select (arr!7534 (buf!7015 w2!587)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (select (arr!7534 (buf!7015 w3!25)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!269863 () Bool)

(assert (=> b!269863 (= e!189734 (arrayRangesEq!1079 (buf!7015 w2!587) (buf!7015 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!12965 w2!587)))))

(assert (= (and d!91530 (not res!224948)) b!269862))

(assert (= (and b!269862 res!224949) b!269863))

(assert (=> b!269862 m!401613))

(declare-fun m!401621 () Bool)

(assert (=> b!269862 m!401621))

(declare-fun m!401623 () Bool)

(assert (=> b!269863 m!401623))

(assert (=> b!269719 d!91530))

(declare-fun d!91532 () Bool)

(assert (=> d!91532 (= (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6547 (buf!7015 w1!591)) (currentByte!12965 w1!591) (currentBit!12960 w1!591))) (tuple4!449 ((_ extract 31 0) (bvadd (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!6547 (buf!7015 w1!591)) (currentByte!12965 w1!591) (currentBit!12960 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!6547 (buf!7015 w1!591)) (currentByte!12965 w1!591) (currentBit!12960 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!269819 d!91532))

(declare-fun d!91534 () Bool)

(declare-fun res!224950 () Bool)

(declare-fun e!189735 () Bool)

(assert (=> d!91534 (=> res!224950 e!189735)))

(assert (=> d!91534 (= res!224950 (= (_1!12207 lt!409193) (_2!12207 lt!409193)))))

(assert (=> d!91534 (= (arrayRangesEq!1079 (buf!7015 w2!587) (buf!7015 w3!25) (_1!12207 lt!409193) (_2!12207 lt!409193)) e!189735)))

(declare-fun b!269864 () Bool)

(declare-fun e!189736 () Bool)

(assert (=> b!269864 (= e!189735 e!189736)))

(declare-fun res!224951 () Bool)

(assert (=> b!269864 (=> (not res!224951) (not e!189736))))

(assert (=> b!269864 (= res!224951 (= (select (arr!7534 (buf!7015 w2!587)) (_1!12207 lt!409193)) (select (arr!7534 (buf!7015 w3!25)) (_1!12207 lt!409193))))))

(declare-fun b!269865 () Bool)

(assert (=> b!269865 (= e!189736 (arrayRangesEq!1079 (buf!7015 w2!587) (buf!7015 w3!25) (bvadd (_1!12207 lt!409193) #b00000000000000000000000000000001) (_2!12207 lt!409193)))))

(assert (= (and d!91534 (not res!224950)) b!269864))

(assert (= (and b!269864 res!224951) b!269865))

(declare-fun m!401625 () Bool)

(assert (=> b!269864 m!401625))

(declare-fun m!401627 () Bool)

(assert (=> b!269864 m!401627))

(declare-fun m!401629 () Bool)

(assert (=> b!269865 m!401629))

(assert (=> b!269795 d!91534))

(declare-fun d!91536 () Bool)

(declare-fun res!224952 () Bool)

(declare-fun e!189737 () Bool)

(assert (=> d!91536 (=> res!224952 e!189737)))

(assert (=> d!91536 (= res!224952 (= (_1!12207 lt!409202) (_2!12207 lt!409202)))))

(assert (=> d!91536 (= (arrayRangesEq!1079 (buf!7015 w1!591) (buf!7015 w2!587) (_1!12207 lt!409202) (_2!12207 lt!409202)) e!189737)))

(declare-fun b!269866 () Bool)

(declare-fun e!189738 () Bool)

(assert (=> b!269866 (= e!189737 e!189738)))

(declare-fun res!224953 () Bool)

(assert (=> b!269866 (=> (not res!224953) (not e!189738))))

(assert (=> b!269866 (= res!224953 (= (select (arr!7534 (buf!7015 w1!591)) (_1!12207 lt!409202)) (select (arr!7534 (buf!7015 w2!587)) (_1!12207 lt!409202))))))

(declare-fun b!269867 () Bool)

(assert (=> b!269867 (= e!189738 (arrayRangesEq!1079 (buf!7015 w1!591) (buf!7015 w2!587) (bvadd (_1!12207 lt!409202) #b00000000000000000000000000000001) (_2!12207 lt!409202)))))

(assert (= (and d!91536 (not res!224952)) b!269866))

(assert (= (and b!269866 res!224953) b!269867))

(declare-fun m!401631 () Bool)

(assert (=> b!269866 m!401631))

(declare-fun m!401633 () Bool)

(assert (=> b!269866 m!401633))

(declare-fun m!401635 () Bool)

(assert (=> b!269867 m!401635))

(assert (=> b!269818 d!91536))

(declare-fun d!91538 () Bool)

(assert (=> d!91538 (= (byteRangesEq!0 (select (arr!7534 (buf!7015 w2!587)) (_3!1004 lt!409193)) (select (arr!7534 (buf!7015 w3!25)) (_3!1004 lt!409193)) lt!409191 #b00000000000000000000000000001000) (or (= lt!409191 #b00000000000000000000000000001000) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7534 (buf!7015 w2!587)) (_3!1004 lt!409193))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!409191)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7534 (buf!7015 w3!25)) (_3!1004 lt!409193))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!409191)))) #b00000000000000000000000011111111))))))

(declare-fun bs!23145 () Bool)

(assert (= bs!23145 d!91538))

(declare-fun m!401637 () Bool)

(assert (=> bs!23145 m!401637))

(declare-fun m!401639 () Bool)

(assert (=> bs!23145 m!401639))

(assert (=> b!269794 d!91538))

(declare-fun d!91540 () Bool)

(assert (=> d!91540 (= (remainingBits!0 ((_ sign_extend 32) (size!6547 (buf!7015 w3!25))) ((_ sign_extend 32) (currentByte!12965 w3!25)) ((_ sign_extend 32) (currentBit!12960 w3!25))) (bvsub (bvmul ((_ sign_extend 32) (size!6547 (buf!7015 w3!25))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12965 w3!25)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12960 w3!25)))))))

(assert (=> d!91426 d!91540))

(assert (=> d!91426 d!91412))

(declare-fun d!91542 () Bool)

(assert (=> d!91542 (= (byteRangesEq!0 (select (arr!7534 (buf!7015 w1!591)) (_3!1004 lt!409202)) (select (arr!7534 (buf!7015 w2!587)) (_3!1004 lt!409202)) lt!409200 #b00000000000000000000000000001000) (or (= lt!409200 #b00000000000000000000000000001000) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7534 (buf!7015 w1!591)) (_3!1004 lt!409202))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!409200)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7534 (buf!7015 w2!587)) (_3!1004 lt!409202))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!409200)))) #b00000000000000000000000011111111))))))

(declare-fun bs!23146 () Bool)

(assert (= bs!23146 d!91542))

(assert (=> bs!23146 m!401637))

(declare-fun m!401641 () Bool)

(assert (=> bs!23146 m!401641))

(assert (=> b!269817 d!91542))

(push 1)

(assert (not b!269865))

(assert (not b!269861))

(assert (not b!269867))

(assert (not b!269863))

(check-sat)

(pop 1)

(push 1)

(check-sat)

