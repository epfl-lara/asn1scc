; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59126 () Bool)

(assert start!59126)

(declare-fun b!270873 () Bool)

(declare-fun res!225718 () Bool)

(declare-fun e!190737 () Bool)

(assert (=> b!270873 (=> (not res!225718) (not e!190737))))

(declare-datatypes ((array!15098 0))(
  ( (array!15099 (arr!7558 (Array (_ BitVec 32) (_ BitVec 8))) (size!6571 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11956 0))(
  ( (BitStream!11957 (buf!7039 array!15098) (currentByte!13013 (_ BitVec 32)) (currentBit!13008 (_ BitVec 32))) )
))
(declare-fun w2!587 () BitStream!11956)

(declare-fun w3!25 () BitStream!11956)

(declare-fun isPrefixOf!0 (BitStream!11956 BitStream!11956) Bool)

(assert (=> b!270873 (= res!225718 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun b!270874 () Bool)

(declare-fun e!190743 () Bool)

(declare-fun array_inv!6295 (array!15098) Bool)

(assert (=> b!270874 (= e!190743 (array_inv!6295 (buf!7039 w2!587)))))

(declare-fun b!270875 () Bool)

(declare-fun e!190742 () Bool)

(assert (=> b!270875 (= e!190742 (array_inv!6295 (buf!7039 w3!25)))))

(declare-fun b!270876 () Bool)

(declare-fun e!190738 () Bool)

(declare-fun w1!591 () BitStream!11956)

(assert (=> b!270876 (= e!190738 (array_inv!6295 (buf!7039 w1!591)))))

(declare-fun b!270877 () Bool)

(declare-fun e!190740 () Bool)

(assert (=> b!270877 (= e!190737 (not e!190740))))

(declare-fun res!225716 () Bool)

(assert (=> b!270877 (=> res!225716 e!190740)))

(assert (=> b!270877 (= res!225716 (or (bvsge (currentByte!13013 w1!591) (size!6571 (buf!7039 w1!591))) (bvsge (currentByte!13013 w1!591) (currentByte!13013 w2!587))))))

(declare-fun arrayRangesEq!1103 (array!15098 array!15098 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!270877 (arrayRangesEq!1103 (buf!7039 w1!591) (buf!7039 w3!25) #b00000000000000000000000000000000 (currentByte!13013 w1!591))))

(declare-datatypes ((Unit!19097 0))(
  ( (Unit!19098) )
))
(declare-fun lt!409652 () Unit!19097)

(declare-fun arrayRangesEqTransitive!366 (array!15098 array!15098 array!15098 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19097)

(assert (=> b!270877 (= lt!409652 (arrayRangesEqTransitive!366 (buf!7039 w1!591) (buf!7039 w2!587) (buf!7039 w3!25) #b00000000000000000000000000000000 (currentByte!13013 w1!591) (currentByte!13013 w2!587)))))

(declare-fun res!225717 () Bool)

(assert (=> start!59126 (=> (not res!225717) (not e!190737))))

(assert (=> start!59126 (= res!225717 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!59126 e!190737))

(declare-fun inv!12 (BitStream!11956) Bool)

(assert (=> start!59126 (and (inv!12 w1!591) e!190738)))

(assert (=> start!59126 (and (inv!12 w2!587) e!190743)))

(assert (=> start!59126 (and (inv!12 w3!25) e!190742)))

(declare-fun b!270878 () Bool)

(assert (=> b!270878 (= e!190740 (or (not (= ((_ sign_extend 24) (select (arr!7558 (buf!7039 w2!587)) (currentByte!13013 w1!591))) ((_ sign_extend 24) (select (arr!7558 (buf!7039 w3!25)) (currentByte!13013 w1!591))))) (bvsge (currentByte!13013 w1!591) #b00000000000000000000000000000000)))))

(assert (=> b!270878 (= (select (arr!7558 (buf!7039 w2!587)) (currentByte!13013 w1!591)) (select (arr!7558 (buf!7039 w3!25)) (currentByte!13013 w1!591)))))

(declare-fun lt!409651 () Unit!19097)

(declare-fun arrayRangesEqImpliesEq!163 (array!15098 array!15098 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19097)

(assert (=> b!270878 (= lt!409651 (arrayRangesEqImpliesEq!163 (buf!7039 w2!587) (buf!7039 w3!25) #b00000000000000000000000000000000 (currentByte!13013 w1!591) (currentByte!13013 w2!587)))))

(assert (= (and start!59126 res!225717) b!270873))

(assert (= (and b!270873 res!225718) b!270877))

(assert (= (and b!270877 (not res!225716)) b!270878))

(assert (= start!59126 b!270876))

(assert (= start!59126 b!270874))

(assert (= start!59126 b!270875))

(declare-fun m!402999 () Bool)

(assert (=> b!270874 m!402999))

(declare-fun m!403001 () Bool)

(assert (=> b!270877 m!403001))

(declare-fun m!403003 () Bool)

(assert (=> b!270877 m!403003))

(declare-fun m!403005 () Bool)

(assert (=> b!270873 m!403005))

(declare-fun m!403007 () Bool)

(assert (=> b!270878 m!403007))

(declare-fun m!403009 () Bool)

(assert (=> b!270878 m!403009))

(declare-fun m!403011 () Bool)

(assert (=> b!270878 m!403011))

(declare-fun m!403013 () Bool)

(assert (=> b!270876 m!403013))

(declare-fun m!403015 () Bool)

(assert (=> b!270875 m!403015))

(declare-fun m!403017 () Bool)

(assert (=> start!59126 m!403017))

(declare-fun m!403019 () Bool)

(assert (=> start!59126 m!403019))

(declare-fun m!403021 () Bool)

(assert (=> start!59126 m!403021))

(declare-fun m!403023 () Bool)

(assert (=> start!59126 m!403023))

(push 1)

(assert (not b!270876))

(assert (not start!59126))

(assert (not b!270875))

(assert (not b!270873))

(assert (not b!270878))

(assert (not b!270874))

(assert (not b!270877))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!92188 () Bool)

(assert (=> d!92188 (= (array_inv!6295 (buf!7039 w2!587)) (bvsge (size!6571 (buf!7039 w2!587)) #b00000000000000000000000000000000))))

(assert (=> b!270874 d!92188))

(declare-fun d!92190 () Bool)

(declare-fun res!225749 () Bool)

(declare-fun e!190801 () Bool)

(assert (=> d!92190 (=> (not res!225749) (not e!190801))))

(assert (=> d!92190 (= res!225749 (= (size!6571 (buf!7039 w1!591)) (size!6571 (buf!7039 w2!587))))))

(assert (=> d!92190 (= (isPrefixOf!0 w1!591 w2!587) e!190801)))

(declare-fun b!270927 () Bool)

(declare-fun res!225751 () Bool)

(assert (=> b!270927 (=> (not res!225751) (not e!190801))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!270927 (= res!225751 (bvsle (bitIndex!0 (size!6571 (buf!7039 w1!591)) (currentByte!13013 w1!591) (currentBit!13008 w1!591)) (bitIndex!0 (size!6571 (buf!7039 w2!587)) (currentByte!13013 w2!587) (currentBit!13008 w2!587))))))

(declare-fun b!270928 () Bool)

(declare-fun e!190802 () Bool)

(assert (=> b!270928 (= e!190801 e!190802)))

(declare-fun res!225750 () Bool)

(assert (=> b!270928 (=> res!225750 e!190802)))

(assert (=> b!270928 (= res!225750 (= (size!6571 (buf!7039 w1!591)) #b00000000000000000000000000000000))))

(declare-fun b!270929 () Bool)

(declare-fun arrayBitRangesEq!0 (array!15098 array!15098 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!270929 (= e!190802 (arrayBitRangesEq!0 (buf!7039 w1!591) (buf!7039 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6571 (buf!7039 w1!591)) (currentByte!13013 w1!591) (currentBit!13008 w1!591))))))

(assert (= (and d!92190 res!225749) b!270927))

(assert (= (and b!270927 res!225751) b!270928))

(assert (= (and b!270928 (not res!225750)) b!270929))

(declare-fun m!403077 () Bool)

(assert (=> b!270927 m!403077))

(declare-fun m!403079 () Bool)

(assert (=> b!270927 m!403079))

(assert (=> b!270929 m!403077))

(assert (=> b!270929 m!403077))

(declare-fun m!403081 () Bool)

(assert (=> b!270929 m!403081))

(assert (=> start!59126 d!92190))

(declare-fun d!92200 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!92200 (= (inv!12 w1!591) (invariant!0 (currentBit!13008 w1!591) (currentByte!13013 w1!591) (size!6571 (buf!7039 w1!591))))))

(declare-fun bs!23275 () Bool)

(assert (= bs!23275 d!92200))

(declare-fun m!403089 () Bool)

(assert (=> bs!23275 m!403089))

(assert (=> start!59126 d!92200))

(declare-fun d!92204 () Bool)

(assert (=> d!92204 (= (inv!12 w2!587) (invariant!0 (currentBit!13008 w2!587) (currentByte!13013 w2!587) (size!6571 (buf!7039 w2!587))))))

(declare-fun bs!23276 () Bool)

(assert (= bs!23276 d!92204))

(declare-fun m!403093 () Bool)

(assert (=> bs!23276 m!403093))

(assert (=> start!59126 d!92204))

(declare-fun d!92206 () Bool)

(assert (=> d!92206 (= (inv!12 w3!25) (invariant!0 (currentBit!13008 w3!25) (currentByte!13013 w3!25) (size!6571 (buf!7039 w3!25))))))

(declare-fun bs!23277 () Bool)

(assert (= bs!23277 d!92206))

(declare-fun m!403095 () Bool)

(assert (=> bs!23277 m!403095))

(assert (=> start!59126 d!92206))

(declare-fun d!92210 () Bool)

(assert (=> d!92210 (= (array_inv!6295 (buf!7039 w3!25)) (bvsge (size!6571 (buf!7039 w3!25)) #b00000000000000000000000000000000))))

(assert (=> b!270875 d!92210))

(declare-fun d!92212 () Bool)

(assert (=> d!92212 (= (array_inv!6295 (buf!7039 w1!591)) (bvsge (size!6571 (buf!7039 w1!591)) #b00000000000000000000000000000000))))

(assert (=> b!270876 d!92212))

(declare-fun d!92214 () Bool)

(declare-fun res!225762 () Bool)

(declare-fun e!190811 () Bool)

(assert (=> d!92214 (=> res!225762 e!190811)))

(assert (=> d!92214 (= res!225762 (= #b00000000000000000000000000000000 (currentByte!13013 w1!591)))))

(assert (=> d!92214 (= (arrayRangesEq!1103 (buf!7039 w1!591) (buf!7039 w3!25) #b00000000000000000000000000000000 (currentByte!13013 w1!591)) e!190811)))

(declare-fun b!270940 () Bool)

(declare-fun e!190812 () Bool)

(assert (=> b!270940 (= e!190811 e!190812)))

(declare-fun res!225763 () Bool)

(assert (=> b!270940 (=> (not res!225763) (not e!190812))))

(assert (=> b!270940 (= res!225763 (= (select (arr!7558 (buf!7039 w1!591)) #b00000000000000000000000000000000) (select (arr!7558 (buf!7039 w3!25)) #b00000000000000000000000000000000)))))

(declare-fun b!270941 () Bool)

(assert (=> b!270941 (= e!190812 (arrayRangesEq!1103 (buf!7039 w1!591) (buf!7039 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!13013 w1!591)))))

(assert (= (and d!92214 (not res!225762)) b!270940))

(assert (= (and b!270940 res!225763) b!270941))

(declare-fun m!403105 () Bool)

(assert (=> b!270940 m!403105))

(declare-fun m!403107 () Bool)

(assert (=> b!270940 m!403107))

(declare-fun m!403109 () Bool)

(assert (=> b!270941 m!403109))

(assert (=> b!270877 d!92214))

(declare-fun d!92226 () Bool)

(assert (=> d!92226 (arrayRangesEq!1103 (buf!7039 w1!591) (buf!7039 w3!25) #b00000000000000000000000000000000 (currentByte!13013 w1!591))))

(declare-fun lt!409670 () Unit!19097)

(declare-fun choose!408 (array!15098 array!15098 array!15098 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19097)

(assert (=> d!92226 (= lt!409670 (choose!408 (buf!7039 w1!591) (buf!7039 w2!587) (buf!7039 w3!25) #b00000000000000000000000000000000 (currentByte!13013 w1!591) (currentByte!13013 w2!587)))))

(assert (=> d!92226 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!13013 w1!591)) (bvsle (currentByte!13013 w1!591) (currentByte!13013 w2!587)))))

(assert (=> d!92226 (= (arrayRangesEqTransitive!366 (buf!7039 w1!591) (buf!7039 w2!587) (buf!7039 w3!25) #b00000000000000000000000000000000 (currentByte!13013 w1!591) (currentByte!13013 w2!587)) lt!409670)))

(declare-fun bs!23281 () Bool)

(assert (= bs!23281 d!92226))

(assert (=> bs!23281 m!403001))

(declare-fun m!403111 () Bool)

(assert (=> bs!23281 m!403111))

(assert (=> b!270877 d!92226))

(declare-fun d!92228 () Bool)

(assert (=> d!92228 (and (bvsge (currentByte!13013 w1!591) #b00000000000000000000000000000000) (bvslt (currentByte!13013 w1!591) (size!6571 (buf!7039 w2!587))) (bvslt (currentByte!13013 w1!591) (size!6571 (buf!7039 w3!25))) (= (select (arr!7558 (buf!7039 w2!587)) (currentByte!13013 w1!591)) (select (arr!7558 (buf!7039 w3!25)) (currentByte!13013 w1!591))))))

(declare-fun lt!409673 () Unit!19097)

(declare-fun choose!409 (array!15098 array!15098 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19097)

(assert (=> d!92228 (= lt!409673 (choose!409 (buf!7039 w2!587) (buf!7039 w3!25) #b00000000000000000000000000000000 (currentByte!13013 w1!591) (currentByte!13013 w2!587)))))

(assert (=> d!92228 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!13013 w2!587)))))

(assert (=> d!92228 (= (arrayRangesEqImpliesEq!163 (buf!7039 w2!587) (buf!7039 w3!25) #b00000000000000000000000000000000 (currentByte!13013 w1!591) (currentByte!13013 w2!587)) lt!409673)))

(declare-fun bs!23283 () Bool)

(assert (= bs!23283 d!92228))

(assert (=> bs!23283 m!403007))

(assert (=> bs!23283 m!403009))

(declare-fun m!403121 () Bool)

(assert (=> bs!23283 m!403121))

(assert (=> b!270878 d!92228))

(declare-fun d!92234 () Bool)

(declare-fun res!225776 () Bool)

(declare-fun e!190823 () Bool)

(assert (=> d!92234 (=> (not res!225776) (not e!190823))))

(assert (=> d!92234 (= res!225776 (= (size!6571 (buf!7039 w2!587)) (size!6571 (buf!7039 w3!25))))))

(assert (=> d!92234 (= (isPrefixOf!0 w2!587 w3!25) e!190823)))

(declare-fun b!270954 () Bool)

(declare-fun res!225778 () Bool)

(assert (=> b!270954 (=> (not res!225778) (not e!190823))))

(assert (=> b!270954 (= res!225778 (bvsle (bitIndex!0 (size!6571 (buf!7039 w2!587)) (currentByte!13013 w2!587) (currentBit!13008 w2!587)) (bitIndex!0 (size!6571 (buf!7039 w3!25)) (currentByte!13013 w3!25) (currentBit!13008 w3!25))))))

(declare-fun b!270955 () Bool)

(declare-fun e!190824 () Bool)

(assert (=> b!270955 (= e!190823 e!190824)))

(declare-fun res!225777 () Bool)

(assert (=> b!270955 (=> res!225777 e!190824)))

(assert (=> b!270955 (= res!225777 (= (size!6571 (buf!7039 w2!587)) #b00000000000000000000000000000000))))

(declare-fun b!270956 () Bool)

(assert (=> b!270956 (= e!190824 (arrayBitRangesEq!0 (buf!7039 w2!587) (buf!7039 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6571 (buf!7039 w2!587)) (currentByte!13013 w2!587) (currentBit!13008 w2!587))))))

(assert (= (and d!92234 res!225776) b!270954))

(assert (= (and b!270954 res!225778) b!270955))

(assert (= (and b!270955 (not res!225777)) b!270956))

(assert (=> b!270954 m!403079))

(declare-fun m!403123 () Bool)

(assert (=> b!270954 m!403123))

(assert (=> b!270956 m!403079))

(assert (=> b!270956 m!403079))

(declare-fun m!403125 () Bool)

(assert (=> b!270956 m!403125))

(assert (=> b!270873 d!92234))

(push 1)

(assert (not b!270956))

(assert (not d!92228))

(assert (not b!270929))

(assert (not b!270927))

(assert (not d!92204))

(assert (not d!92226))

(assert (not d!92200))

(assert (not b!270954))

(assert (not d!92206))

(assert (not b!270941))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

