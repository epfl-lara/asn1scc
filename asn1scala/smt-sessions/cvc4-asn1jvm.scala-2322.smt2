; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59130 () Bool)

(assert start!59130)

(declare-fun b!270909 () Bool)

(declare-fun e!190791 () Bool)

(declare-datatypes ((array!15102 0))(
  ( (array!15103 (arr!7560 (Array (_ BitVec 32) (_ BitVec 8))) (size!6573 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11960 0))(
  ( (BitStream!11961 (buf!7041 array!15102) (currentByte!13015 (_ BitVec 32)) (currentBit!13010 (_ BitVec 32))) )
))
(declare-fun w1!591 () BitStream!11960)

(declare-fun array_inv!6297 (array!15102) Bool)

(assert (=> b!270909 (= e!190791 (array_inv!6297 (buf!7041 w1!591)))))

(declare-fun b!270910 () Bool)

(declare-fun e!190792 () Bool)

(declare-fun w3!25 () BitStream!11960)

(assert (=> b!270910 (= e!190792 (array_inv!6297 (buf!7041 w3!25)))))

(declare-fun b!270911 () Bool)

(declare-fun res!225736 () Bool)

(declare-fun e!190790 () Bool)

(assert (=> b!270911 (=> (not res!225736) (not e!190790))))

(declare-fun w2!587 () BitStream!11960)

(declare-fun isPrefixOf!0 (BitStream!11960 BitStream!11960) Bool)

(assert (=> b!270911 (= res!225736 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun b!270912 () Bool)

(declare-fun e!190789 () Bool)

(assert (=> b!270912 (= e!190789 (array_inv!6297 (buf!7041 w2!587)))))

(declare-fun b!270914 () Bool)

(declare-fun e!190788 () Bool)

(assert (=> b!270914 (= e!190788 (or (not (= ((_ sign_extend 24) (select (arr!7560 (buf!7041 w2!587)) (currentByte!13015 w1!591))) ((_ sign_extend 24) (select (arr!7560 (buf!7041 w3!25)) (currentByte!13015 w1!591))))) (bvsge (currentByte!13015 w1!591) #b00000000000000000000000000000000)))))

(assert (=> b!270914 (= (select (arr!7560 (buf!7041 w2!587)) (currentByte!13015 w1!591)) (select (arr!7560 (buf!7041 w3!25)) (currentByte!13015 w1!591)))))

(declare-datatypes ((Unit!19101 0))(
  ( (Unit!19102) )
))
(declare-fun lt!409664 () Unit!19101)

(declare-fun arrayRangesEqImpliesEq!165 (array!15102 array!15102 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19101)

(assert (=> b!270914 (= lt!409664 (arrayRangesEqImpliesEq!165 (buf!7041 w2!587) (buf!7041 w3!25) #b00000000000000000000000000000000 (currentByte!13015 w1!591) (currentByte!13015 w2!587)))))

(declare-fun b!270913 () Bool)

(assert (=> b!270913 (= e!190790 (not e!190788))))

(declare-fun res!225735 () Bool)

(assert (=> b!270913 (=> res!225735 e!190788)))

(assert (=> b!270913 (= res!225735 (or (bvsge (currentByte!13015 w1!591) (size!6573 (buf!7041 w1!591))) (bvsge (currentByte!13015 w1!591) (currentByte!13015 w2!587))))))

(declare-fun arrayRangesEq!1105 (array!15102 array!15102 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!270913 (arrayRangesEq!1105 (buf!7041 w1!591) (buf!7041 w3!25) #b00000000000000000000000000000000 (currentByte!13015 w1!591))))

(declare-fun lt!409663 () Unit!19101)

(declare-fun arrayRangesEqTransitive!368 (array!15102 array!15102 array!15102 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19101)

(assert (=> b!270913 (= lt!409663 (arrayRangesEqTransitive!368 (buf!7041 w1!591) (buf!7041 w2!587) (buf!7041 w3!25) #b00000000000000000000000000000000 (currentByte!13015 w1!591) (currentByte!13015 w2!587)))))

(declare-fun res!225734 () Bool)

(assert (=> start!59130 (=> (not res!225734) (not e!190790))))

(assert (=> start!59130 (= res!225734 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!59130 e!190790))

(declare-fun inv!12 (BitStream!11960) Bool)

(assert (=> start!59130 (and (inv!12 w1!591) e!190791)))

(assert (=> start!59130 (and (inv!12 w2!587) e!190789)))

(assert (=> start!59130 (and (inv!12 w3!25) e!190792)))

(assert (= (and start!59130 res!225734) b!270911))

(assert (= (and b!270911 res!225736) b!270913))

(assert (= (and b!270913 (not res!225735)) b!270914))

(assert (= start!59130 b!270909))

(assert (= start!59130 b!270912))

(assert (= start!59130 b!270910))

(declare-fun m!403051 () Bool)

(assert (=> start!59130 m!403051))

(declare-fun m!403053 () Bool)

(assert (=> start!59130 m!403053))

(declare-fun m!403055 () Bool)

(assert (=> start!59130 m!403055))

(declare-fun m!403057 () Bool)

(assert (=> start!59130 m!403057))

(declare-fun m!403059 () Bool)

(assert (=> b!270914 m!403059))

(declare-fun m!403061 () Bool)

(assert (=> b!270914 m!403061))

(declare-fun m!403063 () Bool)

(assert (=> b!270914 m!403063))

(declare-fun m!403065 () Bool)

(assert (=> b!270909 m!403065))

(declare-fun m!403067 () Bool)

(assert (=> b!270913 m!403067))

(declare-fun m!403069 () Bool)

(assert (=> b!270913 m!403069))

(declare-fun m!403071 () Bool)

(assert (=> b!270912 m!403071))

(declare-fun m!403073 () Bool)

(assert (=> b!270911 m!403073))

(declare-fun m!403075 () Bool)

(assert (=> b!270910 m!403075))

(push 1)

(assert (not b!270914))

(assert (not b!270909))

(assert (not start!59130))

(assert (not b!270910))

(assert (not b!270911))

(assert (not b!270913))

(assert (not b!270912))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!92192 () Bool)

(assert (=> d!92192 (= (array_inv!6297 (buf!7041 w2!587)) (bvsge (size!6573 (buf!7041 w2!587)) #b00000000000000000000000000000000))))

(assert (=> b!270912 d!92192))

(declare-fun d!92194 () Bool)

(declare-fun res!225753 () Bool)

(declare-fun e!190804 () Bool)

(assert (=> d!92194 (=> (not res!225753) (not e!190804))))

(assert (=> d!92194 (= res!225753 (= (size!6573 (buf!7041 w2!587)) (size!6573 (buf!7041 w3!25))))))

(assert (=> d!92194 (= (isPrefixOf!0 w2!587 w3!25) e!190804)))

(declare-fun b!270930 () Bool)

(declare-fun res!225752 () Bool)

(assert (=> b!270930 (=> (not res!225752) (not e!190804))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!270930 (= res!225752 (bvsle (bitIndex!0 (size!6573 (buf!7041 w2!587)) (currentByte!13015 w2!587) (currentBit!13010 w2!587)) (bitIndex!0 (size!6573 (buf!7041 w3!25)) (currentByte!13015 w3!25) (currentBit!13010 w3!25))))))

(declare-fun b!270931 () Bool)

(declare-fun e!190803 () Bool)

(assert (=> b!270931 (= e!190804 e!190803)))

(declare-fun res!225754 () Bool)

(assert (=> b!270931 (=> res!225754 e!190803)))

(assert (=> b!270931 (= res!225754 (= (size!6573 (buf!7041 w2!587)) #b00000000000000000000000000000000))))

(declare-fun b!270932 () Bool)

(declare-fun arrayBitRangesEq!0 (array!15102 array!15102 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!270932 (= e!190803 (arrayBitRangesEq!0 (buf!7041 w2!587) (buf!7041 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6573 (buf!7041 w2!587)) (currentByte!13015 w2!587) (currentBit!13010 w2!587))))))

(assert (= (and d!92194 res!225753) b!270930))

(assert (= (and b!270930 res!225752) b!270931))

(assert (= (and b!270931 (not res!225754)) b!270932))

(declare-fun m!403083 () Bool)

(assert (=> b!270930 m!403083))

(declare-fun m!403085 () Bool)

(assert (=> b!270930 m!403085))

(assert (=> b!270932 m!403083))

(assert (=> b!270932 m!403083))

(declare-fun m!403087 () Bool)

(assert (=> b!270932 m!403087))

(assert (=> b!270911 d!92194))

(declare-fun d!92202 () Bool)

(declare-fun res!225756 () Bool)

(declare-fun e!190806 () Bool)

(assert (=> d!92202 (=> (not res!225756) (not e!190806))))

(assert (=> d!92202 (= res!225756 (= (size!6573 (buf!7041 w1!591)) (size!6573 (buf!7041 w2!587))))))

(assert (=> d!92202 (= (isPrefixOf!0 w1!591 w2!587) e!190806)))

(declare-fun b!270933 () Bool)

(declare-fun res!225755 () Bool)

(assert (=> b!270933 (=> (not res!225755) (not e!190806))))

(assert (=> b!270933 (= res!225755 (bvsle (bitIndex!0 (size!6573 (buf!7041 w1!591)) (currentByte!13015 w1!591) (currentBit!13010 w1!591)) (bitIndex!0 (size!6573 (buf!7041 w2!587)) (currentByte!13015 w2!587) (currentBit!13010 w2!587))))))

(declare-fun b!270934 () Bool)

(declare-fun e!190805 () Bool)

(assert (=> b!270934 (= e!190806 e!190805)))

(declare-fun res!225757 () Bool)

(assert (=> b!270934 (=> res!225757 e!190805)))

(assert (=> b!270934 (= res!225757 (= (size!6573 (buf!7041 w1!591)) #b00000000000000000000000000000000))))

(declare-fun b!270935 () Bool)

(assert (=> b!270935 (= e!190805 (arrayBitRangesEq!0 (buf!7041 w1!591) (buf!7041 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6573 (buf!7041 w1!591)) (currentByte!13015 w1!591) (currentBit!13010 w1!591))))))

(assert (= (and d!92202 res!225756) b!270933))

(assert (= (and b!270933 res!225755) b!270934))

(assert (= (and b!270934 (not res!225757)) b!270935))

(declare-fun m!403091 () Bool)

(assert (=> b!270933 m!403091))

(assert (=> b!270933 m!403083))

(assert (=> b!270935 m!403091))

(assert (=> b!270935 m!403091))

(declare-fun m!403097 () Bool)

(assert (=> b!270935 m!403097))

(assert (=> start!59130 d!92202))

(declare-fun d!92208 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!92208 (= (inv!12 w1!591) (invariant!0 (currentBit!13010 w1!591) (currentByte!13015 w1!591) (size!6573 (buf!7041 w1!591))))))

(declare-fun bs!23278 () Bool)

(assert (= bs!23278 d!92208))

(declare-fun m!403099 () Bool)

(assert (=> bs!23278 m!403099))

(assert (=> start!59130 d!92208))

(declare-fun d!92216 () Bool)

(assert (=> d!92216 (= (inv!12 w2!587) (invariant!0 (currentBit!13010 w2!587) (currentByte!13015 w2!587) (size!6573 (buf!7041 w2!587))))))

(declare-fun bs!23279 () Bool)

(assert (= bs!23279 d!92216))

(declare-fun m!403101 () Bool)

(assert (=> bs!23279 m!403101))

(assert (=> start!59130 d!92216))

(declare-fun d!92218 () Bool)

(assert (=> d!92218 (= (inv!12 w3!25) (invariant!0 (currentBit!13010 w3!25) (currentByte!13015 w3!25) (size!6573 (buf!7041 w3!25))))))

(declare-fun bs!23280 () Bool)

(assert (= bs!23280 d!92218))

(declare-fun m!403103 () Bool)

(assert (=> bs!23280 m!403103))

(assert (=> start!59130 d!92218))

(declare-fun d!92220 () Bool)

(assert (=> d!92220 (= (array_inv!6297 (buf!7041 w3!25)) (bvsge (size!6573 (buf!7041 w3!25)) #b00000000000000000000000000000000))))

(assert (=> b!270910 d!92220))

(declare-fun d!92222 () Bool)

(assert (=> d!92222 (= (array_inv!6297 (buf!7041 w1!591)) (bvsge (size!6573 (buf!7041 w1!591)) #b00000000000000000000000000000000))))

(assert (=> b!270909 d!92222))

(declare-fun d!92224 () Bool)

(assert (=> d!92224 (and (bvsge (currentByte!13015 w1!591) #b00000000000000000000000000000000) (bvslt (currentByte!13015 w1!591) (size!6573 (buf!7041 w2!587))) (bvslt (currentByte!13015 w1!591) (size!6573 (buf!7041 w3!25))) (= (select (arr!7560 (buf!7041 w2!587)) (currentByte!13015 w1!591)) (select (arr!7560 (buf!7041 w3!25)) (currentByte!13015 w1!591))))))

(declare-fun lt!409669 () Unit!19101)

(declare-fun choose!410 (array!15102 array!15102 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19101)

(assert (=> d!92224 (= lt!409669 (choose!410 (buf!7041 w2!587) (buf!7041 w3!25) #b00000000000000000000000000000000 (currentByte!13015 w1!591) (currentByte!13015 w2!587)))))

(assert (=> d!92224 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!13015 w2!587)))))

(assert (=> d!92224 (= (arrayRangesEqImpliesEq!165 (buf!7041 w2!587) (buf!7041 w3!25) #b00000000000000000000000000000000 (currentByte!13015 w1!591) (currentByte!13015 w2!587)) lt!409669)))

(declare-fun bs!23282 () Bool)

(assert (= bs!23282 d!92224))

(assert (=> bs!23282 m!403059))

(assert (=> bs!23282 m!403061))

(declare-fun m!403113 () Bool)

(assert (=> bs!23282 m!403113))

(assert (=> b!270914 d!92224))

(declare-fun d!92230 () Bool)

(declare-fun res!225770 () Bool)

(declare-fun e!190819 () Bool)

(assert (=> d!92230 (=> res!225770 e!190819)))

(assert (=> d!92230 (= res!225770 (= #b00000000000000000000000000000000 (currentByte!13015 w1!591)))))

(assert (=> d!92230 (= (arrayRangesEq!1105 (buf!7041 w1!591) (buf!7041 w3!25) #b00000000000000000000000000000000 (currentByte!13015 w1!591)) e!190819)))

(declare-fun b!270948 () Bool)

(declare-fun e!190820 () Bool)

(assert (=> b!270948 (= e!190819 e!190820)))

(declare-fun res!225773 () Bool)

(assert (=> b!270948 (=> (not res!225773) (not e!190820))))

(assert (=> b!270948 (= res!225773 (= (select (arr!7560 (buf!7041 w1!591)) #b00000000000000000000000000000000) (select (arr!7560 (buf!7041 w3!25)) #b00000000000000000000000000000000)))))

(declare-fun b!270949 () Bool)

(assert (=> b!270949 (= e!190820 (arrayRangesEq!1105 (buf!7041 w1!591) (buf!7041 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!13015 w1!591)))))

(assert (= (and d!92230 (not res!225770)) b!270948))

(assert (= (and b!270948 res!225773) b!270949))

(declare-fun m!403115 () Bool)

(assert (=> b!270948 m!403115))

(declare-fun m!403117 () Bool)

(assert (=> b!270948 m!403117))

(declare-fun m!403119 () Bool)

(assert (=> b!270949 m!403119))

(assert (=> b!270913 d!92230))

(declare-fun d!92232 () Bool)

(assert (=> d!92232 (arrayRangesEq!1105 (buf!7041 w1!591) (buf!7041 w3!25) #b00000000000000000000000000000000 (currentByte!13015 w1!591))))

(declare-fun lt!409676 () Unit!19101)

(declare-fun choose!411 (array!15102 array!15102 array!15102 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19101)

(assert (=> d!92232 (= lt!409676 (choose!411 (buf!7041 w1!591) (buf!7041 w2!587) (buf!7041 w3!25) #b00000000000000000000000000000000 (currentByte!13015 w1!591) (currentByte!13015 w2!587)))))

(assert (=> d!92232 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!13015 w1!591)) (bvsle (currentByte!13015 w1!591) (currentByte!13015 w2!587)))))

(assert (=> d!92232 (= (arrayRangesEqTransitive!368 (buf!7041 w1!591) (buf!7041 w2!587) (buf!7041 w3!25) #b00000000000000000000000000000000 (currentByte!13015 w1!591) (currentByte!13015 w2!587)) lt!409676)))

(declare-fun bs!23284 () Bool)

(assert (= bs!23284 d!92232))

(assert (=> bs!23284 m!403067))

(declare-fun m!403127 () Bool)

(assert (=> bs!23284 m!403127))

(assert (=> b!270913 d!92232))

(push 1)

