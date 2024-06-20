; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58872 () Bool)

(assert start!58872)

(declare-fun b!270103 () Bool)

(declare-fun e!190003 () Bool)

(declare-datatypes ((array!15057 0))(
  ( (array!15058 (arr!7545 (Array (_ BitVec 32) (_ BitVec 8))) (size!6558 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11930 0))(
  ( (BitStream!11931 (buf!7026 array!15057) (currentByte!12985 (_ BitVec 32)) (currentBit!12980 (_ BitVec 32))) )
))
(declare-fun w3!25 () BitStream!11930)

(declare-fun array_inv!6282 (array!15057) Bool)

(assert (=> b!270103 (= e!190003 (array_inv!6282 (buf!7026 w3!25)))))

(declare-fun b!270104 () Bool)

(declare-fun e!190005 () Bool)

(declare-fun w2!587 () BitStream!11930)

(assert (=> b!270104 (= e!190005 (array_inv!6282 (buf!7026 w2!587)))))

(declare-fun b!270105 () Bool)

(declare-fun res!225112 () Bool)

(declare-fun e!190007 () Bool)

(assert (=> b!270105 (=> (not res!225112) (not e!190007))))

(declare-fun isPrefixOf!0 (BitStream!11930 BitStream!11930) Bool)

(assert (=> b!270105 (= res!225112 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun b!270106 () Bool)

(declare-fun e!190006 () Bool)

(declare-fun w1!591 () BitStream!11930)

(assert (=> b!270106 (= e!190006 (array_inv!6282 (buf!7026 w1!591)))))

(declare-fun res!225111 () Bool)

(assert (=> start!58872 (=> (not res!225111) (not e!190007))))

(assert (=> start!58872 (= res!225111 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!58872 e!190007))

(declare-fun inv!12 (BitStream!11930) Bool)

(assert (=> start!58872 (and (inv!12 w1!591) e!190006)))

(assert (=> start!58872 (and (inv!12 w2!587) e!190005)))

(assert (=> start!58872 (and (inv!12 w3!25) e!190003)))

(declare-fun b!270107 () Bool)

(assert (=> b!270107 (= e!190007 (not (or (bvsge (currentByte!12985 w1!591) (size!6558 (buf!7026 w1!591))) (bvsge (currentByte!12985 w1!591) (currentByte!12985 w2!587)) (bvsgt #b00000000000000000000000000000000 (currentByte!12985 w2!587)) (bvsgt (size!6558 (buf!7026 w2!587)) (size!6558 (buf!7026 w3!25))) (bvsle (currentByte!12985 w2!587) (size!6558 (buf!7026 w2!587))))))))

(declare-fun arrayRangesEq!1090 (array!15057 array!15057 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!270107 (arrayRangesEq!1090 (buf!7026 w1!591) (buf!7026 w3!25) #b00000000000000000000000000000000 (currentByte!12985 w1!591))))

(declare-datatypes ((Unit!19071 0))(
  ( (Unit!19072) )
))
(declare-fun lt!409277 () Unit!19071)

(declare-fun arrayRangesEqTransitive!353 (array!15057 array!15057 array!15057 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19071)

(assert (=> b!270107 (= lt!409277 (arrayRangesEqTransitive!353 (buf!7026 w1!591) (buf!7026 w2!587) (buf!7026 w3!25) #b00000000000000000000000000000000 (currentByte!12985 w1!591) (currentByte!12985 w2!587)))))

(assert (= (and start!58872 res!225111) b!270105))

(assert (= (and b!270105 res!225112) b!270107))

(assert (= start!58872 b!270106))

(assert (= start!58872 b!270104))

(assert (= start!58872 b!270103))

(declare-fun m!401929 () Bool)

(assert (=> b!270107 m!401929))

(declare-fun m!401931 () Bool)

(assert (=> b!270107 m!401931))

(declare-fun m!401933 () Bool)

(assert (=> b!270104 m!401933))

(declare-fun m!401935 () Bool)

(assert (=> start!58872 m!401935))

(declare-fun m!401937 () Bool)

(assert (=> start!58872 m!401937))

(declare-fun m!401939 () Bool)

(assert (=> start!58872 m!401939))

(declare-fun m!401941 () Bool)

(assert (=> start!58872 m!401941))

(declare-fun m!401943 () Bool)

(assert (=> b!270105 m!401943))

(declare-fun m!401945 () Bool)

(assert (=> b!270103 m!401945))

(declare-fun m!401947 () Bool)

(assert (=> b!270106 m!401947))

(push 1)

(assert (not start!58872))

(assert (not b!270104))

(assert (not b!270103))

(assert (not b!270105))

(assert (not b!270106))

(assert (not b!270107))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!91662 () Bool)

(assert (=> d!91662 (= (array_inv!6282 (buf!7026 w2!587)) (bvsge (size!6558 (buf!7026 w2!587)) #b00000000000000000000000000000000))))

(assert (=> b!270104 d!91662))

(declare-fun d!91664 () Bool)

(assert (=> d!91664 (= (array_inv!6282 (buf!7026 w3!25)) (bvsge (size!6558 (buf!7026 w3!25)) #b00000000000000000000000000000000))))

(assert (=> b!270103 d!91664))

(declare-fun d!91666 () Bool)

(assert (=> d!91666 (= (array_inv!6282 (buf!7026 w1!591)) (bvsge (size!6558 (buf!7026 w1!591)) #b00000000000000000000000000000000))))

(assert (=> b!270106 d!91666))

(declare-fun d!91668 () Bool)

(declare-fun res!225123 () Bool)

(declare-fun e!190020 () Bool)

(assert (=> d!91668 (=> res!225123 e!190020)))

(assert (=> d!91668 (= res!225123 (= #b00000000000000000000000000000000 (currentByte!12985 w1!591)))))

(assert (=> d!91668 (= (arrayRangesEq!1090 (buf!7026 w1!591) (buf!7026 w3!25) #b00000000000000000000000000000000 (currentByte!12985 w1!591)) e!190020)))

(declare-fun b!270118 () Bool)

(declare-fun e!190021 () Bool)

(assert (=> b!270118 (= e!190020 e!190021)))

(declare-fun res!225124 () Bool)

(assert (=> b!270118 (=> (not res!225124) (not e!190021))))

(assert (=> b!270118 (= res!225124 (= (select (arr!7545 (buf!7026 w1!591)) #b00000000000000000000000000000000) (select (arr!7545 (buf!7026 w3!25)) #b00000000000000000000000000000000)))))

(declare-fun b!270119 () Bool)

(assert (=> b!270119 (= e!190021 (arrayRangesEq!1090 (buf!7026 w1!591) (buf!7026 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12985 w1!591)))))

(assert (= (and d!91668 (not res!225123)) b!270118))

(assert (= (and b!270118 res!225124) b!270119))

(declare-fun m!401955 () Bool)

(assert (=> b!270118 m!401955))

(declare-fun m!401957 () Bool)

(assert (=> b!270118 m!401957))

(declare-fun m!401959 () Bool)

(assert (=> b!270119 m!401959))

(assert (=> b!270107 d!91668))

(declare-fun d!91672 () Bool)

(assert (=> d!91672 (arrayRangesEq!1090 (buf!7026 w1!591) (buf!7026 w3!25) #b00000000000000000000000000000000 (currentByte!12985 w1!591))))

(declare-fun lt!409283 () Unit!19071)

(declare-fun choose!390 (array!15057 array!15057 array!15057 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19071)

(assert (=> d!91672 (= lt!409283 (choose!390 (buf!7026 w1!591) (buf!7026 w2!587) (buf!7026 w3!25) #b00000000000000000000000000000000 (currentByte!12985 w1!591) (currentByte!12985 w2!587)))))

(assert (=> d!91672 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!12985 w1!591)) (bvsle (currentByte!12985 w1!591) (currentByte!12985 w2!587)))))

(assert (=> d!91672 (= (arrayRangesEqTransitive!353 (buf!7026 w1!591) (buf!7026 w2!587) (buf!7026 w3!25) #b00000000000000000000000000000000 (currentByte!12985 w1!591) (currentByte!12985 w2!587)) lt!409283)))

(declare-fun bs!23177 () Bool)

(assert (= bs!23177 d!91672))

(assert (=> bs!23177 m!401929))

(declare-fun m!401963 () Bool)

(assert (=> bs!23177 m!401963))

(assert (=> b!270107 d!91672))

(declare-fun d!91676 () Bool)

(declare-fun res!225140 () Bool)

(declare-fun e!190033 () Bool)

(assert (=> d!91676 (=> (not res!225140) (not e!190033))))

(assert (=> d!91676 (= res!225140 (= (size!6558 (buf!7026 w2!587)) (size!6558 (buf!7026 w3!25))))))

(assert (=> d!91676 (= (isPrefixOf!0 w2!587 w3!25) e!190033)))

(declare-fun b!270135 () Bool)

(declare-fun res!225141 () Bool)

(assert (=> b!270135 (=> (not res!225141) (not e!190033))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!270135 (= res!225141 (bvsle (bitIndex!0 (size!6558 (buf!7026 w2!587)) (currentByte!12985 w2!587) (currentBit!12980 w2!587)) (bitIndex!0 (size!6558 (buf!7026 w3!25)) (currentByte!12985 w3!25) (currentBit!12980 w3!25))))))

(declare-fun b!270136 () Bool)

(declare-fun e!190032 () Bool)

(assert (=> b!270136 (= e!190033 e!190032)))

(declare-fun res!225142 () Bool)

(assert (=> b!270136 (=> res!225142 e!190032)))

(assert (=> b!270136 (= res!225142 (= (size!6558 (buf!7026 w2!587)) #b00000000000000000000000000000000))))

(declare-fun b!270137 () Bool)

(declare-fun arrayBitRangesEq!0 (array!15057 array!15057 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!270137 (= e!190032 (arrayBitRangesEq!0 (buf!7026 w2!587) (buf!7026 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6558 (buf!7026 w2!587)) (currentByte!12985 w2!587) (currentBit!12980 w2!587))))))

(assert (= (and d!91676 res!225140) b!270135))

(assert (= (and b!270135 res!225141) b!270136))

(assert (= (and b!270136 (not res!225142)) b!270137))

(declare-fun m!401971 () Bool)

(assert (=> b!270135 m!401971))

(declare-fun m!401973 () Bool)

(assert (=> b!270135 m!401973))

(assert (=> b!270137 m!401971))

(assert (=> b!270137 m!401971))

(declare-fun m!401975 () Bool)

(assert (=> b!270137 m!401975))

(assert (=> b!270105 d!91676))

(declare-fun d!91682 () Bool)

(declare-fun res!225143 () Bool)

(declare-fun e!190035 () Bool)

(assert (=> d!91682 (=> (not res!225143) (not e!190035))))

(assert (=> d!91682 (= res!225143 (= (size!6558 (buf!7026 w1!591)) (size!6558 (buf!7026 w2!587))))))

(assert (=> d!91682 (= (isPrefixOf!0 w1!591 w2!587) e!190035)))

(declare-fun b!270138 () Bool)

(declare-fun res!225144 () Bool)

(assert (=> b!270138 (=> (not res!225144) (not e!190035))))

(assert (=> b!270138 (= res!225144 (bvsle (bitIndex!0 (size!6558 (buf!7026 w1!591)) (currentByte!12985 w1!591) (currentBit!12980 w1!591)) (bitIndex!0 (size!6558 (buf!7026 w2!587)) (currentByte!12985 w2!587) (currentBit!12980 w2!587))))))

(declare-fun b!270139 () Bool)

(declare-fun e!190034 () Bool)

(assert (=> b!270139 (= e!190035 e!190034)))

(declare-fun res!225145 () Bool)

(assert (=> b!270139 (=> res!225145 e!190034)))

(assert (=> b!270139 (= res!225145 (= (size!6558 (buf!7026 w1!591)) #b00000000000000000000000000000000))))

(declare-fun b!270140 () Bool)

(assert (=> b!270140 (= e!190034 (arrayBitRangesEq!0 (buf!7026 w1!591) (buf!7026 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6558 (buf!7026 w1!591)) (currentByte!12985 w1!591) (currentBit!12980 w1!591))))))

(assert (= (and d!91682 res!225143) b!270138))

(assert (= (and b!270138 res!225144) b!270139))

(assert (= (and b!270139 (not res!225145)) b!270140))

(declare-fun m!401979 () Bool)

(assert (=> b!270138 m!401979))

(assert (=> b!270138 m!401971))

(assert (=> b!270140 m!401979))

(assert (=> b!270140 m!401979))

(declare-fun m!401983 () Bool)

(assert (=> b!270140 m!401983))

(assert (=> start!58872 d!91682))

(declare-fun d!91688 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!91688 (= (inv!12 w1!591) (invariant!0 (currentBit!12980 w1!591) (currentByte!12985 w1!591) (size!6558 (buf!7026 w1!591))))))

(declare-fun bs!23181 () Bool)

(assert (= bs!23181 d!91688))

(declare-fun m!401991 () Bool)

(assert (=> bs!23181 m!401991))

(assert (=> start!58872 d!91688))

(declare-fun d!91694 () Bool)

(assert (=> d!91694 (= (inv!12 w2!587) (invariant!0 (currentBit!12980 w2!587) (currentByte!12985 w2!587) (size!6558 (buf!7026 w2!587))))))

(declare-fun bs!23182 () Bool)

(assert (= bs!23182 d!91694))

(declare-fun m!401993 () Bool)

(assert (=> bs!23182 m!401993))

(assert (=> start!58872 d!91694))

(declare-fun d!91696 () Bool)

(assert (=> d!91696 (= (inv!12 w3!25) (invariant!0 (currentBit!12980 w3!25) (currentByte!12985 w3!25) (size!6558 (buf!7026 w3!25))))))

(declare-fun bs!23183 () Bool)

(assert (= bs!23183 d!91696))

(declare-fun m!401995 () Bool)

(assert (=> bs!23183 m!401995))

(assert (=> start!58872 d!91696))

(push 1)

(assert (not d!91672))

(assert (not b!270137))

(assert (not b!270135))

(assert (not d!91696))

(assert (not b!270138))

(assert (not b!270140))

(assert (not d!91688))

(assert (not d!91694))

(assert (not b!270119))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!91728 () Bool)

(declare-fun e!190090 () Bool)

(assert (=> d!91728 e!190090))

(declare-fun res!225201 () Bool)

(assert (=> d!91728 (=> (not res!225201) (not e!190090))))

(declare-fun lt!409320 () (_ BitVec 64))

(declare-fun lt!409321 () (_ BitVec 64))

(declare-fun lt!409318 () (_ BitVec 64))

(assert (=> d!91728 (= res!225201 (= lt!409321 (bvsub lt!409318 lt!409320)))))

(assert (=> d!91728 (or (= (bvand lt!409318 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!409320 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!409318 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!409318 lt!409320) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!91728 (= lt!409320 (remainingBits!0 ((_ sign_extend 32) (size!6558 (buf!7026 w2!587))) ((_ sign_extend 32) (currentByte!12985 w2!587)) ((_ sign_extend 32) (currentBit!12980 w2!587))))))

(declare-fun lt!409317 () (_ BitVec 64))

(declare-fun lt!409319 () (_ BitVec 64))

(assert (=> d!91728 (= lt!409318 (bvmul lt!409317 lt!409319))))

(assert (=> d!91728 (or (= lt!409317 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!409319 (bvsdiv (bvmul lt!409317 lt!409319) lt!409317)))))

(assert (=> d!91728 (= lt!409319 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!91728 (= lt!409317 ((_ sign_extend 32) (size!6558 (buf!7026 w2!587))))))

(assert (=> d!91728 (= lt!409321 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12985 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12980 w2!587))))))

(assert (=> d!91728 (invariant!0 (currentBit!12980 w2!587) (currentByte!12985 w2!587) (size!6558 (buf!7026 w2!587)))))

(assert (=> d!91728 (= (bitIndex!0 (size!6558 (buf!7026 w2!587)) (currentByte!12985 w2!587) (currentBit!12980 w2!587)) lt!409321)))

(declare-fun b!270208 () Bool)

(declare-fun res!225202 () Bool)

(assert (=> b!270208 (=> (not res!225202) (not e!190090))))

(assert (=> b!270208 (= res!225202 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!409321))))

(declare-fun b!270209 () Bool)

(declare-fun lt!409322 () (_ BitVec 64))

(assert (=> b!270209 (= e!190090 (bvsle lt!409321 (bvmul lt!409322 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!270209 (or (= lt!409322 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!409322 #b0000000000000000000000000000000000000000000000000000000000001000) lt!409322)))))

(assert (=> b!270209 (= lt!409322 ((_ sign_extend 32) (size!6558 (buf!7026 w2!587))))))

(assert (= (and d!91728 res!225201) b!270208))

(assert (= (and b!270208 res!225202) b!270209))

(declare-fun m!402053 () Bool)

(assert (=> d!91728 m!402053))

(assert (=> d!91728 m!401993))

(assert (=> b!270135 d!91728))

(declare-fun d!91734 () Bool)

(declare-fun e!190091 () Bool)

(assert (=> d!91734 e!190091))

(declare-fun res!225203 () Bool)

(assert (=> d!91734 (=> (not res!225203) (not e!190091))))

(declare-fun lt!409326 () (_ BitVec 64))

(declare-fun lt!409327 () (_ BitVec 64))

(declare-fun lt!409324 () (_ BitVec 64))

(assert (=> d!91734 (= res!225203 (= lt!409327 (bvsub lt!409324 lt!409326)))))

(assert (=> d!91734 (or (= (bvand lt!409324 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!409326 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!409324 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!409324 lt!409326) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!91734 (= lt!409326 (remainingBits!0 ((_ sign_extend 32) (size!6558 (buf!7026 w3!25))) ((_ sign_extend 32) (currentByte!12985 w3!25)) ((_ sign_extend 32) (currentBit!12980 w3!25))))))

(declare-fun lt!409323 () (_ BitVec 64))

(declare-fun lt!409325 () (_ BitVec 64))

(assert (=> d!91734 (= lt!409324 (bvmul lt!409323 lt!409325))))

(assert (=> d!91734 (or (= lt!409323 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!409325 (bvsdiv (bvmul lt!409323 lt!409325) lt!409323)))))

(assert (=> d!91734 (= lt!409325 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!91734 (= lt!409323 ((_ sign_extend 32) (size!6558 (buf!7026 w3!25))))))

(assert (=> d!91734 (= lt!409327 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12985 w3!25)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12980 w3!25))))))

(assert (=> d!91734 (invariant!0 (currentBit!12980 w3!25) (currentByte!12985 w3!25) (size!6558 (buf!7026 w3!25)))))

(assert (=> d!91734 (= (bitIndex!0 (size!6558 (buf!7026 w3!25)) (currentByte!12985 w3!25) (currentBit!12980 w3!25)) lt!409327)))

(declare-fun b!270210 () Bool)

(declare-fun res!225204 () Bool)

(assert (=> b!270210 (=> (not res!225204) (not e!190091))))

(assert (=> b!270210 (= res!225204 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!409327))))

(declare-fun b!270211 () Bool)

(declare-fun lt!409328 () (_ BitVec 64))

(assert (=> b!270211 (= e!190091 (bvsle lt!409327 (bvmul lt!409328 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!270211 (or (= lt!409328 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!409328 #b0000000000000000000000000000000000000000000000000000000000001000) lt!409328)))))

(assert (=> b!270211 (= lt!409328 ((_ sign_extend 32) (size!6558 (buf!7026 w3!25))))))

(assert (= (and d!91734 res!225203) b!270210))

(assert (= (and b!270210 res!225204) b!270211))

(declare-fun m!402055 () Bool)

(assert (=> d!91734 m!402055))

(assert (=> d!91734 m!401995))

(assert (=> b!270135 d!91734))

(declare-fun d!91736 () Bool)

(assert (=> d!91736 (= (invariant!0 (currentBit!12980 w2!587) (currentByte!12985 w2!587) (size!6558 (buf!7026 w2!587))) (and (bvsge (currentBit!12980 w2!587) #b00000000000000000000000000000000) (bvslt (currentBit!12980 w2!587) #b00000000000000000000000000001000) (bvsge (currentByte!12985 w2!587) #b00000000000000000000000000000000) (or (bvslt (currentByte!12985 w2!587) (size!6558 (buf!7026 w2!587))) (and (= (currentBit!12980 w2!587) #b00000000000000000000000000000000) (= (currentByte!12985 w2!587) (size!6558 (buf!7026 w2!587)))))))))

(assert (=> d!91694 d!91736))

(assert (=> d!91672 d!91668))

(declare-fun d!91738 () Bool)

(assert (=> d!91738 (arrayRangesEq!1090 (buf!7026 w1!591) (buf!7026 w3!25) #b00000000000000000000000000000000 (currentByte!12985 w1!591))))

(assert (=> d!91738 true))

(declare-fun _$16!128 () Unit!19071)

(assert (=> d!91738 (= (choose!390 (buf!7026 w1!591) (buf!7026 w2!587) (buf!7026 w3!25) #b00000000000000000000000000000000 (currentByte!12985 w1!591) (currentByte!12985 w2!587)) _$16!128)))

(declare-fun bs!23189 () Bool)

(assert (= bs!23189 d!91738))

(assert (=> bs!23189 m!401929))

(assert (=> d!91672 d!91738))

(declare-fun d!91740 () Bool)

(assert (=> d!91740 (= (invariant!0 (currentBit!12980 w1!591) (currentByte!12985 w1!591) (size!6558 (buf!7026 w1!591))) (and (bvsge (currentBit!12980 w1!591) #b00000000000000000000000000000000) (bvslt (currentBit!12980 w1!591) #b00000000000000000000000000001000) (bvsge (currentByte!12985 w1!591) #b00000000000000000000000000000000) (or (bvslt (currentByte!12985 w1!591) (size!6558 (buf!7026 w1!591))) (and (= (currentBit!12980 w1!591) #b00000000000000000000000000000000) (= (currentByte!12985 w1!591) (size!6558 (buf!7026 w1!591)))))))))

(assert (=> d!91688 d!91740))

(declare-fun b!270264 () Bool)

(declare-fun e!190135 () Bool)

(declare-fun e!190131 () Bool)

(assert (=> b!270264 (= e!190135 e!190131)))

(declare-fun lt!409401 () (_ BitVec 32))

(declare-datatypes ((tuple4!454 0))(
  ( (tuple4!455 (_1!12210 (_ BitVec 32)) (_2!12210 (_ BitVec 32)) (_3!1007 (_ BitVec 32)) (_4!227 (_ BitVec 32))) )
))
(declare-fun lt!409402 () tuple4!454)

(declare-fun res!225251 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!270264 (= res!225251 (byteRangesEq!0 (select (arr!7545 (buf!7026 w1!591)) (_3!1007 lt!409402)) (select (arr!7545 (buf!7026 w2!587)) (_3!1007 lt!409402)) lt!409401 #b00000000000000000000000000001000))))

(assert (=> b!270264 (=> (not res!225251) (not e!190131))))

(declare-fun b!270265 () Bool)

(declare-fun call!4318 () Bool)

(assert (=> b!270265 (= e!190135 call!4318)))

(declare-fun d!91742 () Bool)

(declare-fun res!225252 () Bool)

(declare-fun e!190130 () Bool)

(assert (=> d!91742 (=> res!225252 e!190130)))

(assert (=> d!91742 (= res!225252 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6558 (buf!7026 w1!591)) (currentByte!12985 w1!591) (currentBit!12980 w1!591))))))

(assert (=> d!91742 (= (arrayBitRangesEq!0 (buf!7026 w1!591) (buf!7026 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6558 (buf!7026 w1!591)) (currentByte!12985 w1!591) (currentBit!12980 w1!591))) e!190130)))

(declare-fun b!270266 () Bool)

(declare-fun e!190133 () Bool)

(assert (=> b!270266 (= e!190133 call!4318)))

(declare-fun b!270267 () Bool)

(declare-fun e!190132 () Bool)

(assert (=> b!270267 (= e!190132 (arrayRangesEq!1090 (buf!7026 w1!591) (buf!7026 w2!587) (_1!12210 lt!409402) (_2!12210 lt!409402)))))

(declare-fun lt!409403 () (_ BitVec 32))

(declare-fun c!12467 () Bool)

(declare-fun bm!4315 () Bool)

(assert (=> bm!4315 (= call!4318 (byteRangesEq!0 (ite c!12467 (select (arr!7545 (buf!7026 w1!591)) (_3!1007 lt!409402)) (select (arr!7545 (buf!7026 w1!591)) (_4!227 lt!409402))) (ite c!12467 (select (arr!7545 (buf!7026 w2!587)) (_3!1007 lt!409402)) (select (arr!7545 (buf!7026 w2!587)) (_4!227 lt!409402))) (ite c!12467 lt!409401 #b00000000000000000000000000000000) lt!409403))))

(declare-fun b!270268 () Bool)

(declare-fun res!225249 () Bool)

(assert (=> b!270268 (= res!225249 (= lt!409403 #b00000000000000000000000000000000))))

(assert (=> b!270268 (=> res!225249 e!190133)))

(assert (=> b!270268 (= e!190131 e!190133)))

(declare-fun b!270269 () Bool)

(declare-fun e!190134 () Bool)

(assert (=> b!270269 (= e!190130 e!190134)))

(declare-fun res!225253 () Bool)

(assert (=> b!270269 (=> (not res!225253) (not e!190134))))

(assert (=> b!270269 (= res!225253 e!190132)))

(declare-fun res!225250 () Bool)

(assert (=> b!270269 (=> res!225250 e!190132)))

(assert (=> b!270269 (= res!225250 (bvsge (_1!12210 lt!409402) (_2!12210 lt!409402)))))

(assert (=> b!270269 (= lt!409403 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6558 (buf!7026 w1!591)) (currentByte!12985 w1!591) (currentBit!12980 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!270269 (= lt!409401 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!454)

(assert (=> b!270269 (= lt!409402 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6558 (buf!7026 w1!591)) (currentByte!12985 w1!591) (currentBit!12980 w1!591))))))

(declare-fun b!270270 () Bool)

(assert (=> b!270270 (= e!190134 e!190135)))

(assert (=> b!270270 (= c!12467 (= (_3!1007 lt!409402) (_4!227 lt!409402)))))

(assert (= (and d!91742 (not res!225252)) b!270269))

(assert (= (and b!270269 (not res!225250)) b!270267))

(assert (= (and b!270269 res!225253) b!270270))

(assert (= (and b!270270 c!12467) b!270265))

(assert (= (and b!270270 (not c!12467)) b!270264))

(assert (= (and b!270264 res!225251) b!270268))

(assert (= (and b!270268 (not res!225249)) b!270266))

(assert (= (or b!270265 b!270266) bm!4315))

(declare-fun m!402113 () Bool)

(assert (=> b!270264 m!402113))

(declare-fun m!402115 () Bool)

(assert (=> b!270264 m!402115))

(assert (=> b!270264 m!402113))

(assert (=> b!270264 m!402115))

(declare-fun m!402117 () Bool)

(assert (=> b!270264 m!402117))

(declare-fun m!402119 () Bool)

(assert (=> b!270267 m!402119))

(declare-fun m!402121 () Bool)

(assert (=> bm!4315 m!402121))

(assert (=> bm!4315 m!402113))

(declare-fun m!402123 () Bool)

(assert (=> bm!4315 m!402123))

(assert (=> bm!4315 m!402115))

(declare-fun m!402125 () Bool)

(assert (=> bm!4315 m!402125))

(assert (=> b!270269 m!401979))

(declare-fun m!402127 () Bool)

(assert (=> b!270269 m!402127))

(assert (=> b!270140 d!91742))

(declare-fun d!91768 () Bool)

(declare-fun e!190136 () Bool)

(assert (=> d!91768 e!190136))

(declare-fun res!225254 () Bool)

(assert (=> d!91768 (=> (not res!225254) (not e!190136))))

(declare-fun lt!409405 () (_ BitVec 64))

(declare-fun lt!409408 () (_ BitVec 64))

(declare-fun lt!409407 () (_ BitVec 64))

(assert (=> d!91768 (= res!225254 (= lt!409408 (bvsub lt!409405 lt!409407)))))

(assert (=> d!91768 (or (= (bvand lt!409405 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!409407 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!409405 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!409405 lt!409407) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!91768 (= lt!409407 (remainingBits!0 ((_ sign_extend 32) (size!6558 (buf!7026 w1!591))) ((_ sign_extend 32) (currentByte!12985 w1!591)) ((_ sign_extend 32) (currentBit!12980 w1!591))))))

(declare-fun lt!409404 () (_ BitVec 64))

(declare-fun lt!409406 () (_ BitVec 64))

(assert (=> d!91768 (= lt!409405 (bvmul lt!409404 lt!409406))))

(assert (=> d!91768 (or (= lt!409404 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!409406 (bvsdiv (bvmul lt!409404 lt!409406) lt!409404)))))

(assert (=> d!91768 (= lt!409406 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!91768 (= lt!409404 ((_ sign_extend 32) (size!6558 (buf!7026 w1!591))))))

(assert (=> d!91768 (= lt!409408 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12985 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12980 w1!591))))))

(assert (=> d!91768 (invariant!0 (currentBit!12980 w1!591) (currentByte!12985 w1!591) (size!6558 (buf!7026 w1!591)))))

(assert (=> d!91768 (= (bitIndex!0 (size!6558 (buf!7026 w1!591)) (currentByte!12985 w1!591) (currentBit!12980 w1!591)) lt!409408)))

(declare-fun b!270271 () Bool)

(declare-fun res!225255 () Bool)

(assert (=> b!270271 (=> (not res!225255) (not e!190136))))

(assert (=> b!270271 (= res!225255 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!409408))))

(declare-fun b!270272 () Bool)

(declare-fun lt!409409 () (_ BitVec 64))

(assert (=> b!270272 (= e!190136 (bvsle lt!409408 (bvmul lt!409409 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!270272 (or (= lt!409409 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!409409 #b0000000000000000000000000000000000000000000000000000000000001000) lt!409409)))))

(assert (=> b!270272 (= lt!409409 ((_ sign_extend 32) (size!6558 (buf!7026 w1!591))))))

(assert (= (and d!91768 res!225254) b!270271))

(assert (= (and b!270271 res!225255) b!270272))

(declare-fun m!402129 () Bool)

(assert (=> d!91768 m!402129))

(assert (=> d!91768 m!401991))

(assert (=> b!270140 d!91768))

(declare-fun d!91770 () Bool)

(assert (=> d!91770 (= (invariant!0 (currentBit!12980 w3!25) (currentByte!12985 w3!25) (size!6558 (buf!7026 w3!25))) (and (bvsge (currentBit!12980 w3!25) #b00000000000000000000000000000000) (bvslt (currentBit!12980 w3!25) #b00000000000000000000000000001000) (bvsge (currentByte!12985 w3!25) #b00000000000000000000000000000000) (or (bvslt (currentByte!12985 w3!25) (size!6558 (buf!7026 w3!25))) (and (= (currentBit!12980 w3!25) #b00000000000000000000000000000000) (= (currentByte!12985 w3!25) (size!6558 (buf!7026 w3!25)))))))))

(assert (=> d!91696 d!91770))

(declare-fun d!91772 () Bool)

(declare-fun res!225256 () Bool)

(declare-fun e!190137 () Bool)

(assert (=> d!91772 (=> res!225256 e!190137)))

(assert (=> d!91772 (= res!225256 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12985 w1!591)))))

(assert (=> d!91772 (= (arrayRangesEq!1090 (buf!7026 w1!591) (buf!7026 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12985 w1!591)) e!190137)))

(declare-fun b!270273 () Bool)

(declare-fun e!190138 () Bool)

(assert (=> b!270273 (= e!190137 e!190138)))

(declare-fun res!225257 () Bool)

(assert (=> b!270273 (=> (not res!225257) (not e!190138))))

(assert (=> b!270273 (= res!225257 (= (select (arr!7545 (buf!7026 w1!591)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!7545 (buf!7026 w3!25)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!270274 () Bool)

(assert (=> b!270274 (= e!190138 (arrayRangesEq!1090 (buf!7026 w1!591) (buf!7026 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!12985 w1!591)))))

(assert (= (and d!91772 (not res!225256)) b!270273))

(assert (= (and b!270273 res!225257) b!270274))

(declare-fun m!402131 () Bool)

(assert (=> b!270273 m!402131))

(declare-fun m!402133 () Bool)

(assert (=> b!270273 m!402133))

(declare-fun m!402135 () Bool)

(assert (=> b!270274 m!402135))

(assert (=> b!270119 d!91772))

(declare-fun b!270275 () Bool)

(declare-fun e!190144 () Bool)

(declare-fun e!190140 () Bool)

(assert (=> b!270275 (= e!190144 e!190140)))

(declare-fun res!225260 () Bool)

(declare-fun lt!409411 () tuple4!454)

(declare-fun lt!409410 () (_ BitVec 32))

(assert (=> b!270275 (= res!225260 (byteRangesEq!0 (select (arr!7545 (buf!7026 w2!587)) (_3!1007 lt!409411)) (select (arr!7545 (buf!7026 w3!25)) (_3!1007 lt!409411)) lt!409410 #b00000000000000000000000000001000))))

(assert (=> b!270275 (=> (not res!225260) (not e!190140))))

(declare-fun b!270276 () Bool)

(declare-fun call!4319 () Bool)

(assert (=> b!270276 (= e!190144 call!4319)))

(declare-fun d!91774 () Bool)

(declare-fun res!225261 () Bool)

(declare-fun e!190139 () Bool)

(assert (=> d!91774 (=> res!225261 e!190139)))

(assert (=> d!91774 (= res!225261 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6558 (buf!7026 w2!587)) (currentByte!12985 w2!587) (currentBit!12980 w2!587))))))

(assert (=> d!91774 (= (arrayBitRangesEq!0 (buf!7026 w2!587) (buf!7026 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6558 (buf!7026 w2!587)) (currentByte!12985 w2!587) (currentBit!12980 w2!587))) e!190139)))

(declare-fun b!270277 () Bool)

(declare-fun e!190142 () Bool)

(assert (=> b!270277 (= e!190142 call!4319)))

(declare-fun e!190141 () Bool)

(declare-fun b!270278 () Bool)

(assert (=> b!270278 (= e!190141 (arrayRangesEq!1090 (buf!7026 w2!587) (buf!7026 w3!25) (_1!12210 lt!409411) (_2!12210 lt!409411)))))

(declare-fun lt!409412 () (_ BitVec 32))

(declare-fun bm!4316 () Bool)

(declare-fun c!12468 () Bool)

(assert (=> bm!4316 (= call!4319 (byteRangesEq!0 (ite c!12468 (select (arr!7545 (buf!7026 w2!587)) (_3!1007 lt!409411)) (select (arr!7545 (buf!7026 w2!587)) (_4!227 lt!409411))) (ite c!12468 (select (arr!7545 (buf!7026 w3!25)) (_3!1007 lt!409411)) (select (arr!7545 (buf!7026 w3!25)) (_4!227 lt!409411))) (ite c!12468 lt!409410 #b00000000000000000000000000000000) lt!409412))))

(declare-fun b!270279 () Bool)

(declare-fun res!225258 () Bool)

(assert (=> b!270279 (= res!225258 (= lt!409412 #b00000000000000000000000000000000))))

(assert (=> b!270279 (=> res!225258 e!190142)))

(assert (=> b!270279 (= e!190140 e!190142)))

(declare-fun b!270280 () Bool)

(declare-fun e!190143 () Bool)

(assert (=> b!270280 (= e!190139 e!190143)))

(declare-fun res!225262 () Bool)

(assert (=> b!270280 (=> (not res!225262) (not e!190143))))

(assert (=> b!270280 (= res!225262 e!190141)))

(declare-fun res!225259 () Bool)

(assert (=> b!270280 (=> res!225259 e!190141)))

(assert (=> b!270280 (= res!225259 (bvsge (_1!12210 lt!409411) (_2!12210 lt!409411)))))

(assert (=> b!270280 (= lt!409412 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6558 (buf!7026 w2!587)) (currentByte!12985 w2!587) (currentBit!12980 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!270280 (= lt!409410 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!270280 (= lt!409411 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6558 (buf!7026 w2!587)) (currentByte!12985 w2!587) (currentBit!12980 w2!587))))))

(declare-fun b!270281 () Bool)

(assert (=> b!270281 (= e!190143 e!190144)))

(assert (=> b!270281 (= c!12468 (= (_3!1007 lt!409411) (_4!227 lt!409411)))))

(assert (= (and d!91774 (not res!225261)) b!270280))

(assert (= (and b!270280 (not res!225259)) b!270278))

(assert (= (and b!270280 res!225262) b!270281))

(assert (= (and b!270281 c!12468) b!270276))

(assert (= (and b!270281 (not c!12468)) b!270275))

(assert (= (and b!270275 res!225260) b!270279))

(assert (= (and b!270279 (not res!225258)) b!270277))

(assert (= (or b!270276 b!270277) bm!4316))

(declare-fun m!402137 () Bool)

(assert (=> b!270275 m!402137))

(declare-fun m!402139 () Bool)

(assert (=> b!270275 m!402139))

(assert (=> b!270275 m!402137))

(assert (=> b!270275 m!402139))

(declare-fun m!402141 () Bool)

(assert (=> b!270275 m!402141))

(declare-fun m!402143 () Bool)

(assert (=> b!270278 m!402143))

(declare-fun m!402145 () Bool)

(assert (=> bm!4316 m!402145))

(assert (=> bm!4316 m!402137))

(declare-fun m!402147 () Bool)

(assert (=> bm!4316 m!402147))

(assert (=> bm!4316 m!402139))

(declare-fun m!402149 () Bool)

(assert (=> bm!4316 m!402149))

(assert (=> b!270280 m!401971))

(declare-fun m!402151 () Bool)

(assert (=> b!270280 m!402151))

(assert (=> b!270137 d!91774))

(assert (=> b!270137 d!91728))

(assert (=> b!270138 d!91768))

(assert (=> b!270138 d!91728))

(push 1)

(assert (not d!91728))

(assert (not bm!4315))

(assert (not b!270267))

(assert (not b!270280))

(assert (not bm!4316))

(assert (not d!91734))

(assert (not d!91738))

(assert (not b!270274))

(assert (not b!270275))

(assert (not d!91768))

(assert (not b!270269))

(assert (not b!270264))

(assert (not b!270278))

(check-sat)

(pop 1)

(push 1)

(check-sat)

