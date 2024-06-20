; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59168 () Bool)

(assert start!59168)

(declare-fun b!270981 () Bool)

(declare-fun e!190852 () Bool)

(declare-datatypes ((array!15107 0))(
  ( (array!15108 (arr!7561 (Array (_ BitVec 32) (_ BitVec 8))) (size!6574 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11962 0))(
  ( (BitStream!11963 (buf!7042 array!15107) (currentByte!13016 (_ BitVec 32)) (currentBit!13011 (_ BitVec 32))) )
))
(declare-fun w3!25 () BitStream!11962)

(declare-fun array_inv!6298 (array!15107) Bool)

(assert (=> b!270981 (= e!190852 (array_inv!6298 (buf!7042 w3!25)))))

(declare-fun b!270983 () Bool)

(declare-fun e!190853 () Bool)

(declare-fun w2!587 () BitStream!11962)

(assert (=> b!270983 (= e!190853 (array_inv!6298 (buf!7042 w2!587)))))

(declare-fun b!270984 () Bool)

(declare-fun res!225799 () Bool)

(declare-fun e!190858 () Bool)

(assert (=> b!270984 (=> (not res!225799) (not e!190858))))

(declare-fun isPrefixOf!0 (BitStream!11962 BitStream!11962) Bool)

(assert (=> b!270984 (= res!225799 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun b!270985 () Bool)

(declare-fun e!190857 () Bool)

(assert (=> b!270985 (= e!190858 (not e!190857))))

(declare-fun res!225798 () Bool)

(assert (=> b!270985 (=> res!225798 e!190857)))

(declare-fun w1!591 () BitStream!11962)

(assert (=> b!270985 (= res!225798 (or (bvsge (currentByte!13016 w1!591) (size!6574 (buf!7042 w1!591))) (bvsge (currentByte!13016 w1!591) (currentByte!13016 w2!587))))))

(declare-fun arrayRangesEq!1106 (array!15107 array!15107 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!270985 (arrayRangesEq!1106 (buf!7042 w1!591) (buf!7042 w3!25) #b00000000000000000000000000000000 (currentByte!13016 w1!591))))

(declare-datatypes ((Unit!19103 0))(
  ( (Unit!19104) )
))
(declare-fun lt!409687 () Unit!19103)

(declare-fun arrayRangesEqTransitive!369 (array!15107 array!15107 array!15107 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19103)

(assert (=> b!270985 (= lt!409687 (arrayRangesEqTransitive!369 (buf!7042 w1!591) (buf!7042 w2!587) (buf!7042 w3!25) #b00000000000000000000000000000000 (currentByte!13016 w1!591) (currentByte!13016 w2!587)))))

(declare-fun b!270986 () Bool)

(assert (=> b!270986 (= e!190857 (or (not (= ((_ sign_extend 24) (select (arr!7561 (buf!7042 w2!587)) (currentByte!13016 w1!591))) ((_ sign_extend 24) (select (arr!7561 (buf!7042 w3!25)) (currentByte!13016 w1!591))))) (and (bvsge (currentByte!13016 w1!591) #b00000000000000000000000000000000) (bvslt (currentByte!13016 w1!591) (size!6574 (buf!7042 w3!25))))))))

(assert (=> b!270986 (= (select (arr!7561 (buf!7042 w2!587)) (currentByte!13016 w1!591)) (select (arr!7561 (buf!7042 w3!25)) (currentByte!13016 w1!591)))))

(declare-fun lt!409688 () Unit!19103)

(declare-fun arrayRangesEqImpliesEq!166 (array!15107 array!15107 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19103)

(assert (=> b!270986 (= lt!409688 (arrayRangesEqImpliesEq!166 (buf!7042 w2!587) (buf!7042 w3!25) #b00000000000000000000000000000000 (currentByte!13016 w1!591) (currentByte!13016 w2!587)))))

(declare-fun res!225797 () Bool)

(assert (=> start!59168 (=> (not res!225797) (not e!190858))))

(assert (=> start!59168 (= res!225797 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!59168 e!190858))

(declare-fun e!190856 () Bool)

(declare-fun inv!12 (BitStream!11962) Bool)

(assert (=> start!59168 (and (inv!12 w1!591) e!190856)))

(assert (=> start!59168 (and (inv!12 w2!587) e!190853)))

(assert (=> start!59168 (and (inv!12 w3!25) e!190852)))

(declare-fun b!270982 () Bool)

(assert (=> b!270982 (= e!190856 (array_inv!6298 (buf!7042 w1!591)))))

(assert (= (and start!59168 res!225797) b!270984))

(assert (= (and b!270984 res!225799) b!270985))

(assert (= (and b!270985 (not res!225798)) b!270986))

(assert (= start!59168 b!270982))

(assert (= start!59168 b!270983))

(assert (= start!59168 b!270981))

(declare-fun m!403155 () Bool)

(assert (=> b!270985 m!403155))

(declare-fun m!403157 () Bool)

(assert (=> b!270985 m!403157))

(declare-fun m!403159 () Bool)

(assert (=> b!270984 m!403159))

(declare-fun m!403161 () Bool)

(assert (=> b!270981 m!403161))

(declare-fun m!403163 () Bool)

(assert (=> b!270983 m!403163))

(declare-fun m!403165 () Bool)

(assert (=> b!270986 m!403165))

(declare-fun m!403167 () Bool)

(assert (=> b!270986 m!403167))

(declare-fun m!403169 () Bool)

(assert (=> b!270986 m!403169))

(declare-fun m!403171 () Bool)

(assert (=> start!59168 m!403171))

(declare-fun m!403173 () Bool)

(assert (=> start!59168 m!403173))

(declare-fun m!403175 () Bool)

(assert (=> start!59168 m!403175))

(declare-fun m!403177 () Bool)

(assert (=> start!59168 m!403177))

(declare-fun m!403179 () Bool)

(assert (=> b!270982 m!403179))

(push 1)

(assert (not start!59168))

(assert (not b!270985))

(assert (not b!270982))

(assert (not b!270986))

(assert (not b!270981))

(assert (not b!270983))

(assert (not b!270984))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!92258 () Bool)

(assert (=> d!92258 (= (array_inv!6298 (buf!7042 w3!25)) (bvsge (size!6574 (buf!7042 w3!25)) #b00000000000000000000000000000000))))

(assert (=> b!270981 d!92258))

(declare-fun d!92260 () Bool)

(assert (=> d!92260 (and (bvsge (currentByte!13016 w1!591) #b00000000000000000000000000000000) (bvslt (currentByte!13016 w1!591) (size!6574 (buf!7042 w2!587))) (bvslt (currentByte!13016 w1!591) (size!6574 (buf!7042 w3!25))) (= (select (arr!7561 (buf!7042 w2!587)) (currentByte!13016 w1!591)) (select (arr!7561 (buf!7042 w3!25)) (currentByte!13016 w1!591))))))

(declare-fun lt!409703 () Unit!19103)

(declare-fun choose!412 (array!15107 array!15107 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19103)

(assert (=> d!92260 (= lt!409703 (choose!412 (buf!7042 w2!587) (buf!7042 w3!25) #b00000000000000000000000000000000 (currentByte!13016 w1!591) (currentByte!13016 w2!587)))))

(assert (=> d!92260 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!13016 w2!587)))))

(assert (=> d!92260 (= (arrayRangesEqImpliesEq!166 (buf!7042 w2!587) (buf!7042 w3!25) #b00000000000000000000000000000000 (currentByte!13016 w1!591) (currentByte!13016 w2!587)) lt!409703)))

(declare-fun bs!23293 () Bool)

(assert (= bs!23293 d!92260))

(assert (=> bs!23293 m!403165))

(assert (=> bs!23293 m!403167))

(declare-fun m!403233 () Bool)

(assert (=> bs!23293 m!403233))

(assert (=> b!270986 d!92260))

(declare-fun d!92266 () Bool)

(declare-fun res!225822 () Bool)

(declare-fun e!190911 () Bool)

(assert (=> d!92266 (=> res!225822 e!190911)))

(assert (=> d!92266 (= res!225822 (= #b00000000000000000000000000000000 (currentByte!13016 w1!591)))))

(assert (=> d!92266 (= (arrayRangesEq!1106 (buf!7042 w1!591) (buf!7042 w3!25) #b00000000000000000000000000000000 (currentByte!13016 w1!591)) e!190911)))

(declare-fun b!271027 () Bool)

(declare-fun e!190912 () Bool)

(assert (=> b!271027 (= e!190911 e!190912)))

(declare-fun res!225823 () Bool)

(assert (=> b!271027 (=> (not res!225823) (not e!190912))))

(assert (=> b!271027 (= res!225823 (= (select (arr!7561 (buf!7042 w1!591)) #b00000000000000000000000000000000) (select (arr!7561 (buf!7042 w3!25)) #b00000000000000000000000000000000)))))

(declare-fun b!271028 () Bool)

(assert (=> b!271028 (= e!190912 (arrayRangesEq!1106 (buf!7042 w1!591) (buf!7042 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!13016 w1!591)))))

(assert (= (and d!92266 (not res!225822)) b!271027))

(assert (= (and b!271027 res!225823) b!271028))

(declare-fun m!403235 () Bool)

(assert (=> b!271027 m!403235))

(declare-fun m!403237 () Bool)

(assert (=> b!271027 m!403237))

(declare-fun m!403239 () Bool)

(assert (=> b!271028 m!403239))

(assert (=> b!270985 d!92266))

(declare-fun d!92268 () Bool)

(assert (=> d!92268 (arrayRangesEq!1106 (buf!7042 w1!591) (buf!7042 w3!25) #b00000000000000000000000000000000 (currentByte!13016 w1!591))))

(declare-fun lt!409709 () Unit!19103)

(declare-fun choose!414 (array!15107 array!15107 array!15107 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19103)

(assert (=> d!92268 (= lt!409709 (choose!414 (buf!7042 w1!591) (buf!7042 w2!587) (buf!7042 w3!25) #b00000000000000000000000000000000 (currentByte!13016 w1!591) (currentByte!13016 w2!587)))))

(assert (=> d!92268 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!13016 w1!591)) (bvsle (currentByte!13016 w1!591) (currentByte!13016 w2!587)))))

(assert (=> d!92268 (= (arrayRangesEqTransitive!369 (buf!7042 w1!591) (buf!7042 w2!587) (buf!7042 w3!25) #b00000000000000000000000000000000 (currentByte!13016 w1!591) (currentByte!13016 w2!587)) lt!409709)))

(declare-fun bs!23295 () Bool)

(assert (= bs!23295 d!92268))

(assert (=> bs!23295 m!403155))

(declare-fun m!403243 () Bool)

(assert (=> bs!23295 m!403243))

(assert (=> b!270985 d!92268))

(declare-fun d!92272 () Bool)

(declare-fun res!225849 () Bool)

(declare-fun e!190929 () Bool)

(assert (=> d!92272 (=> (not res!225849) (not e!190929))))

(assert (=> d!92272 (= res!225849 (= (size!6574 (buf!7042 w2!587)) (size!6574 (buf!7042 w3!25))))))

(assert (=> d!92272 (= (isPrefixOf!0 w2!587 w3!25) e!190929)))

(declare-fun b!271053 () Bool)

(declare-fun res!225850 () Bool)

(assert (=> b!271053 (=> (not res!225850) (not e!190929))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!271053 (= res!225850 (bvsle (bitIndex!0 (size!6574 (buf!7042 w2!587)) (currentByte!13016 w2!587) (currentBit!13011 w2!587)) (bitIndex!0 (size!6574 (buf!7042 w3!25)) (currentByte!13016 w3!25) (currentBit!13011 w3!25))))))

(declare-fun b!271054 () Bool)

(declare-fun e!190930 () Bool)

(assert (=> b!271054 (= e!190929 e!190930)))

(declare-fun res!225848 () Bool)

(assert (=> b!271054 (=> res!225848 e!190930)))

(assert (=> b!271054 (= res!225848 (= (size!6574 (buf!7042 w2!587)) #b00000000000000000000000000000000))))

(declare-fun b!271055 () Bool)

(declare-fun arrayBitRangesEq!0 (array!15107 array!15107 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!271055 (= e!190930 (arrayBitRangesEq!0 (buf!7042 w2!587) (buf!7042 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6574 (buf!7042 w2!587)) (currentByte!13016 w2!587) (currentBit!13011 w2!587))))))

(assert (= (and d!92272 res!225849) b!271053))

(assert (= (and b!271053 res!225850) b!271054))

(assert (= (and b!271054 (not res!225848)) b!271055))

(declare-fun m!403263 () Bool)

(assert (=> b!271053 m!403263))

(declare-fun m!403265 () Bool)

(assert (=> b!271053 m!403265))

(assert (=> b!271055 m!403263))

(assert (=> b!271055 m!403263))

(declare-fun m!403269 () Bool)

(assert (=> b!271055 m!403269))

(assert (=> b!270984 d!92272))

(declare-fun d!92290 () Bool)

(assert (=> d!92290 (= (array_inv!6298 (buf!7042 w2!587)) (bvsge (size!6574 (buf!7042 w2!587)) #b00000000000000000000000000000000))))

(assert (=> b!270983 d!92290))

(declare-fun d!92292 () Bool)

(declare-fun res!225855 () Bool)

(declare-fun e!190933 () Bool)

(assert (=> d!92292 (=> (not res!225855) (not e!190933))))

(assert (=> d!92292 (= res!225855 (= (size!6574 (buf!7042 w1!591)) (size!6574 (buf!7042 w2!587))))))

(assert (=> d!92292 (= (isPrefixOf!0 w1!591 w2!587) e!190933)))

(declare-fun b!271059 () Bool)

(declare-fun res!225856 () Bool)

(assert (=> b!271059 (=> (not res!225856) (not e!190933))))

(assert (=> b!271059 (= res!225856 (bvsle (bitIndex!0 (size!6574 (buf!7042 w1!591)) (currentByte!13016 w1!591) (currentBit!13011 w1!591)) (bitIndex!0 (size!6574 (buf!7042 w2!587)) (currentByte!13016 w2!587) (currentBit!13011 w2!587))))))

(declare-fun b!271060 () Bool)

(declare-fun e!190934 () Bool)

(assert (=> b!271060 (= e!190933 e!190934)))

(declare-fun res!225854 () Bool)

(assert (=> b!271060 (=> res!225854 e!190934)))

(assert (=> b!271060 (= res!225854 (= (size!6574 (buf!7042 w1!591)) #b00000000000000000000000000000000))))

(declare-fun b!271061 () Bool)

(assert (=> b!271061 (= e!190934 (arrayBitRangesEq!0 (buf!7042 w1!591) (buf!7042 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6574 (buf!7042 w1!591)) (currentByte!13016 w1!591) (currentBit!13011 w1!591))))))

(assert (= (and d!92292 res!225855) b!271059))

(assert (= (and b!271059 res!225856) b!271060))

(assert (= (and b!271060 (not res!225854)) b!271061))

(declare-fun m!403275 () Bool)

(assert (=> b!271059 m!403275))

(assert (=> b!271059 m!403263))

(assert (=> b!271061 m!403275))

(assert (=> b!271061 m!403275))

(declare-fun m!403277 () Bool)

(assert (=> b!271061 m!403277))

(assert (=> start!59168 d!92292))

(declare-fun d!92296 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!92296 (= (inv!12 w1!591) (invariant!0 (currentBit!13011 w1!591) (currentByte!13016 w1!591) (size!6574 (buf!7042 w1!591))))))

(declare-fun bs!23303 () Bool)

(assert (= bs!23303 d!92296))

(declare-fun m!403289 () Bool)

(assert (=> bs!23303 m!403289))

(assert (=> start!59168 d!92296))

(declare-fun d!92306 () Bool)

(assert (=> d!92306 (= (inv!12 w2!587) (invariant!0 (currentBit!13011 w2!587) (currentByte!13016 w2!587) (size!6574 (buf!7042 w2!587))))))

(declare-fun bs!23304 () Bool)

(assert (= bs!23304 d!92306))

(declare-fun m!403297 () Bool)

(assert (=> bs!23304 m!403297))

(assert (=> start!59168 d!92306))

(declare-fun d!92310 () Bool)

(assert (=> d!92310 (= (inv!12 w3!25) (invariant!0 (currentBit!13011 w3!25) (currentByte!13016 w3!25) (size!6574 (buf!7042 w3!25))))))

(declare-fun bs!23305 () Bool)

(assert (= bs!23305 d!92310))

(declare-fun m!403299 () Bool)

(assert (=> bs!23305 m!403299))

(assert (=> start!59168 d!92310))

(declare-fun d!92312 () Bool)

(assert (=> d!92312 (= (array_inv!6298 (buf!7042 w1!591)) (bvsge (size!6574 (buf!7042 w1!591)) #b00000000000000000000000000000000))))

(assert (=> b!270982 d!92312))

(push 1)

