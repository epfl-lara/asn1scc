; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59550 () Bool)

(assert start!59550)

(declare-fun b!272160 () Bool)

(declare-fun e!192011 () Bool)

(declare-datatypes ((array!15174 0))(
  ( (array!15175 (arr!7584 (Array (_ BitVec 32) (_ BitVec 8))) (size!6597 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12008 0))(
  ( (BitStream!12009 (buf!7065 array!15174) (currentByte!13057 (_ BitVec 32)) (currentBit!13052 (_ BitVec 32))) )
))
(declare-fun w2!587 () BitStream!12008)

(declare-fun array_inv!6321 (array!15174) Bool)

(assert (=> b!272160 (= e!192011 (array_inv!6321 (buf!7065 w2!587)))))

(declare-fun b!272161 () Bool)

(declare-fun e!192006 () Bool)

(declare-fun w1!591 () BitStream!12008)

(assert (=> b!272161 (= e!192006 (array_inv!6321 (buf!7065 w1!591)))))

(declare-fun b!272162 () Bool)

(declare-fun e!192012 () Bool)

(declare-fun w3!25 () BitStream!12008)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!272162 (= e!192012 (byteRangesEq!0 (select (arr!7584 (buf!7065 w1!591)) (currentByte!13057 w1!591)) (select (arr!7584 (buf!7065 w3!25)) (currentByte!13057 w1!591)) #b00000000000000000000000000000000 (currentBit!13052 w1!591)))))

(declare-fun b!272163 () Bool)

(declare-fun res!226669 () Bool)

(declare-fun e!192013 () Bool)

(assert (=> b!272163 (=> (not res!226669) (not e!192013))))

(declare-fun isPrefixOf!0 (BitStream!12008 BitStream!12008) Bool)

(assert (=> b!272163 (= res!226669 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun b!272164 () Bool)

(declare-fun e!192010 () Bool)

(assert (=> b!272164 (= e!192010 (byteRangesEq!0 (select (arr!7584 (buf!7065 w1!591)) (currentByte!13057 w1!591)) (select (arr!7584 (buf!7065 w3!25)) (currentByte!13057 w1!591)) #b00000000000000000000000000000000 (currentBit!13052 w1!591)))))

(declare-fun b!272165 () Bool)

(declare-datatypes ((Unit!19165 0))(
  ( (Unit!19166) )
))
(declare-fun e!192009 () Unit!19165)

(declare-fun Unit!19167 () Unit!19165)

(assert (=> b!272165 (= e!192009 Unit!19167)))

(declare-fun b!272166 () Bool)

(declare-fun e!192016 () Bool)

(assert (=> b!272166 (= e!192013 (not e!192016))))

(declare-fun res!226671 () Bool)

(assert (=> b!272166 (=> res!226671 e!192016)))

(declare-fun e!192014 () Bool)

(assert (=> b!272166 (= res!226671 e!192014)))

(declare-fun res!226673 () Bool)

(assert (=> b!272166 (=> (not res!226673) (not e!192014))))

(assert (=> b!272166 (= res!226673 (bvslt (currentByte!13057 w1!591) (size!6597 (buf!7065 w1!591))))))

(declare-fun lt!410176 () Unit!19165)

(assert (=> b!272166 (= lt!410176 e!192009)))

(declare-fun c!12531 () Bool)

(assert (=> b!272166 (= c!12531 (and (bvslt (currentByte!13057 w1!591) (size!6597 (buf!7065 w1!591))) (bvslt (currentByte!13057 w1!591) (currentByte!13057 w2!587))))))

(declare-fun e!192005 () Bool)

(assert (=> b!272166 e!192005))

(declare-fun res!226672 () Bool)

(assert (=> b!272166 (=> (not res!226672) (not e!192005))))

(declare-fun arrayRangesEq!1129 (array!15174 array!15174 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!272166 (= res!226672 (arrayRangesEq!1129 (buf!7065 w1!591) (buf!7065 w3!25) #b00000000000000000000000000000000 (currentByte!13057 w1!591)))))

(declare-fun lt!410175 () Unit!19165)

(declare-fun arrayRangesEqTransitive!392 (array!15174 array!15174 array!15174 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19165)

(assert (=> b!272166 (= lt!410175 (arrayRangesEqTransitive!392 (buf!7065 w1!591) (buf!7065 w2!587) (buf!7065 w3!25) #b00000000000000000000000000000000 (currentByte!13057 w1!591) (currentByte!13057 w2!587)))))

(declare-fun b!272167 () Bool)

(declare-fun e!192008 () Bool)

(assert (=> b!272167 (= e!192008 (array_inv!6321 (buf!7065 w3!25)))))

(declare-fun b!272168 () Bool)

(assert (=> b!272168 (= e!192016 (isPrefixOf!0 w1!591 w3!25))))

(declare-fun b!272169 () Bool)

(declare-fun Unit!19168 () Unit!19165)

(assert (=> b!272169 (= e!192009 Unit!19168)))

(declare-fun lt!410177 () Unit!19165)

(declare-fun arrayRangesEqImpliesEq!180 (array!15174 array!15174 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19165)

(assert (=> b!272169 (= lt!410177 (arrayRangesEqImpliesEq!180 (buf!7065 w2!587) (buf!7065 w3!25) #b00000000000000000000000000000000 (currentByte!13057 w1!591) (currentByte!13057 w2!587)))))

(declare-fun res!226670 () Bool)

(assert (=> b!272169 (= res!226670 (= (select (arr!7584 (buf!7065 w2!587)) (currentByte!13057 w1!591)) (select (arr!7584 (buf!7065 w3!25)) (currentByte!13057 w1!591))))))

(assert (=> b!272169 (=> (not res!226670) (not e!192012))))

(assert (=> b!272169 e!192012))

(declare-fun res!226675 () Bool)

(assert (=> start!59550 (=> (not res!226675) (not e!192013))))

(assert (=> start!59550 (= res!226675 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!59550 e!192013))

(declare-fun inv!12 (BitStream!12008) Bool)

(assert (=> start!59550 (and (inv!12 w1!591) e!192006)))

(assert (=> start!59550 (and (inv!12 w2!587) e!192011)))

(assert (=> start!59550 (and (inv!12 w3!25) e!192008)))

(declare-fun b!272170 () Bool)

(assert (=> b!272170 (= e!192005 e!192010)))

(declare-fun res!226674 () Bool)

(assert (=> b!272170 (=> res!226674 e!192010)))

(assert (=> b!272170 (= res!226674 (or (bvsge (currentByte!13057 w1!591) (size!6597 (buf!7065 w1!591))) (bvslt (currentByte!13057 w1!591) (currentByte!13057 w2!587))))))

(declare-fun b!272171 () Bool)

(assert (=> b!272171 (= e!192014 (not (byteRangesEq!0 (select (arr!7584 (buf!7065 w1!591)) (currentByte!13057 w1!591)) (select (arr!7584 (buf!7065 w3!25)) (currentByte!13057 w1!591)) #b00000000000000000000000000000000 (currentBit!13052 w1!591))))))

(assert (= (and start!59550 res!226675) b!272163))

(assert (= (and b!272163 res!226669) b!272166))

(assert (= (and b!272166 res!226672) b!272170))

(assert (= (and b!272170 (not res!226674)) b!272164))

(assert (= (and b!272166 c!12531) b!272169))

(assert (= (and b!272166 (not c!12531)) b!272165))

(assert (= (and b!272169 res!226670) b!272162))

(assert (= (and b!272166 res!226673) b!272171))

(assert (= (and b!272166 (not res!226671)) b!272168))

(assert (= start!59550 b!272161))

(assert (= start!59550 b!272160))

(assert (= start!59550 b!272167))

(declare-fun m!404791 () Bool)

(assert (=> b!272171 m!404791))

(declare-fun m!404793 () Bool)

(assert (=> b!272171 m!404793))

(assert (=> b!272171 m!404791))

(assert (=> b!272171 m!404793))

(declare-fun m!404795 () Bool)

(assert (=> b!272171 m!404795))

(declare-fun m!404797 () Bool)

(assert (=> b!272169 m!404797))

(declare-fun m!404799 () Bool)

(assert (=> b!272169 m!404799))

(assert (=> b!272169 m!404793))

(declare-fun m!404801 () Bool)

(assert (=> b!272167 m!404801))

(declare-fun m!404803 () Bool)

(assert (=> b!272168 m!404803))

(assert (=> b!272162 m!404791))

(assert (=> b!272162 m!404793))

(assert (=> b!272162 m!404791))

(assert (=> b!272162 m!404793))

(assert (=> b!272162 m!404795))

(declare-fun m!404805 () Bool)

(assert (=> start!59550 m!404805))

(declare-fun m!404807 () Bool)

(assert (=> start!59550 m!404807))

(declare-fun m!404809 () Bool)

(assert (=> start!59550 m!404809))

(declare-fun m!404811 () Bool)

(assert (=> start!59550 m!404811))

(declare-fun m!404813 () Bool)

(assert (=> b!272166 m!404813))

(declare-fun m!404815 () Bool)

(assert (=> b!272166 m!404815))

(declare-fun m!404817 () Bool)

(assert (=> b!272163 m!404817))

(declare-fun m!404819 () Bool)

(assert (=> b!272160 m!404819))

(declare-fun m!404821 () Bool)

(assert (=> b!272161 m!404821))

(assert (=> b!272164 m!404791))

(assert (=> b!272164 m!404793))

(assert (=> b!272164 m!404791))

(assert (=> b!272164 m!404793))

(assert (=> b!272164 m!404795))

(push 1)

(assert (not b!272169))

(assert (not b!272164))

(assert (not b!272160))

(assert (not b!272166))

(assert (not b!272168))

(assert (not b!272171))

(assert (not b!272161))

(assert (not start!59550))

(assert (not b!272163))

(assert (not b!272162))

(assert (not b!272167))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!93022 () Bool)

(declare-fun res!226716 () Bool)

(declare-fun e!192046 () Bool)

(assert (=> d!93022 (=> (not res!226716) (not e!192046))))

(assert (=> d!93022 (= res!226716 (= (size!6597 (buf!7065 w1!591)) (size!6597 (buf!7065 w2!587))))))

(assert (=> d!93022 (= (isPrefixOf!0 w1!591 w2!587) e!192046)))

(declare-fun b!272211 () Bool)

(declare-fun res!226715 () Bool)

(assert (=> b!272211 (=> (not res!226715) (not e!192046))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!272211 (= res!226715 (bvsle (bitIndex!0 (size!6597 (buf!7065 w1!591)) (currentByte!13057 w1!591) (currentBit!13052 w1!591)) (bitIndex!0 (size!6597 (buf!7065 w2!587)) (currentByte!13057 w2!587) (currentBit!13052 w2!587))))))

(declare-fun b!272212 () Bool)

(declare-fun e!192045 () Bool)

(assert (=> b!272212 (= e!192046 e!192045)))

(declare-fun res!226717 () Bool)

(assert (=> b!272212 (=> res!226717 e!192045)))

(assert (=> b!272212 (= res!226717 (= (size!6597 (buf!7065 w1!591)) #b00000000000000000000000000000000))))

(declare-fun b!272213 () Bool)

(declare-fun arrayBitRangesEq!0 (array!15174 array!15174 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!272213 (= e!192045 (arrayBitRangesEq!0 (buf!7065 w1!591) (buf!7065 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6597 (buf!7065 w1!591)) (currentByte!13057 w1!591) (currentBit!13052 w1!591))))))

(assert (= (and d!93022 res!226716) b!272211))

(assert (= (and b!272211 res!226715) b!272212))

(assert (= (and b!272212 (not res!226717)) b!272213))

(declare-fun m!404864 () Bool)

(assert (=> b!272211 m!404864))

(declare-fun m!404867 () Bool)

(assert (=> b!272211 m!404867))

(assert (=> b!272213 m!404864))

(assert (=> b!272213 m!404864))

(declare-fun m!404871 () Bool)

(assert (=> b!272213 m!404871))

(assert (=> start!59550 d!93022))

(declare-fun d!93048 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!93048 (= (inv!12 w1!591) (invariant!0 (currentBit!13052 w1!591) (currentByte!13057 w1!591) (size!6597 (buf!7065 w1!591))))))

(declare-fun bs!23462 () Bool)

(assert (= bs!23462 d!93048))

(declare-fun m!404873 () Bool)

(assert (=> bs!23462 m!404873))

(assert (=> start!59550 d!93048))

(declare-fun d!93050 () Bool)

(assert (=> d!93050 (= (inv!12 w2!587) (invariant!0 (currentBit!13052 w2!587) (currentByte!13057 w2!587) (size!6597 (buf!7065 w2!587))))))

(declare-fun bs!23463 () Bool)

(assert (= bs!23463 d!93050))

(declare-fun m!404875 () Bool)

(assert (=> bs!23463 m!404875))

(assert (=> start!59550 d!93050))

(declare-fun d!93052 () Bool)

(assert (=> d!93052 (= (inv!12 w3!25) (invariant!0 (currentBit!13052 w3!25) (currentByte!13057 w3!25) (size!6597 (buf!7065 w3!25))))))

(declare-fun bs!23464 () Bool)

(assert (= bs!23464 d!93052))

(declare-fun m!404877 () Bool)

(assert (=> bs!23464 m!404877))

(assert (=> start!59550 d!93052))

(declare-fun d!93054 () Bool)

(assert (=> d!93054 (= (byteRangesEq!0 (select (arr!7584 (buf!7065 w1!591)) (currentByte!13057 w1!591)) (select (arr!7584 (buf!7065 w3!25)) (currentByte!13057 w1!591)) #b00000000000000000000000000000000 (currentBit!13052 w1!591)) (or (= #b00000000000000000000000000000000 (currentBit!13052 w1!591)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7584 (buf!7065 w1!591)) (currentByte!13057 w1!591))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!13052 w1!591)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7584 (buf!7065 w3!25)) (currentByte!13057 w1!591))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!13052 w1!591)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!23470 () Bool)

(assert (= bs!23470 d!93054))

(declare-fun m!404899 () Bool)

(assert (=> bs!23470 m!404899))

(declare-fun m!404901 () Bool)

(assert (=> bs!23470 m!404901))

(assert (=> b!272164 d!93054))

(declare-fun d!93070 () Bool)

(assert (=> d!93070 (and (bvsge (currentByte!13057 w1!591) #b00000000000000000000000000000000) (bvslt (currentByte!13057 w1!591) (size!6597 (buf!7065 w2!587))) (bvslt (currentByte!13057 w1!591) (size!6597 (buf!7065 w3!25))) (= (select (arr!7584 (buf!7065 w2!587)) (currentByte!13057 w1!591)) (select (arr!7584 (buf!7065 w3!25)) (currentByte!13057 w1!591))))))

(declare-fun lt!410192 () Unit!19165)

(declare-fun choose!445 (array!15174 array!15174 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19165)

(assert (=> d!93070 (= lt!410192 (choose!445 (buf!7065 w2!587) (buf!7065 w3!25) #b00000000000000000000000000000000 (currentByte!13057 w1!591) (currentByte!13057 w2!587)))))

(assert (=> d!93070 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!13057 w2!587)))))

(assert (=> d!93070 (= (arrayRangesEqImpliesEq!180 (buf!7065 w2!587) (buf!7065 w3!25) #b00000000000000000000000000000000 (currentByte!13057 w1!591) (currentByte!13057 w2!587)) lt!410192)))

(declare-fun bs!23471 () Bool)

(assert (= bs!23471 d!93070))

(assert (=> bs!23471 m!404799))

(assert (=> bs!23471 m!404793))

(declare-fun m!404903 () Bool)

(assert (=> bs!23471 m!404903))

(assert (=> b!272169 d!93070))

(declare-fun d!93072 () Bool)

(declare-fun res!226728 () Bool)

(declare-fun e!192056 () Bool)

(assert (=> d!93072 (=> (not res!226728) (not e!192056))))

(assert (=> d!93072 (= res!226728 (= (size!6597 (buf!7065 w2!587)) (size!6597 (buf!7065 w3!25))))))

(assert (=> d!93072 (= (isPrefixOf!0 w2!587 w3!25) e!192056)))

(declare-fun b!272223 () Bool)

(declare-fun res!226727 () Bool)

(assert (=> b!272223 (=> (not res!226727) (not e!192056))))

(assert (=> b!272223 (= res!226727 (bvsle (bitIndex!0 (size!6597 (buf!7065 w2!587)) (currentByte!13057 w2!587) (currentBit!13052 w2!587)) (bitIndex!0 (size!6597 (buf!7065 w3!25)) (currentByte!13057 w3!25) (currentBit!13052 w3!25))))))

(declare-fun b!272224 () Bool)

(declare-fun e!192055 () Bool)

(assert (=> b!272224 (= e!192056 e!192055)))

(declare-fun res!226729 () Bool)

(assert (=> b!272224 (=> res!226729 e!192055)))

(assert (=> b!272224 (= res!226729 (= (size!6597 (buf!7065 w2!587)) #b00000000000000000000000000000000))))

(declare-fun b!272225 () Bool)

(assert (=> b!272225 (= e!192055 (arrayBitRangesEq!0 (buf!7065 w2!587) (buf!7065 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6597 (buf!7065 w2!587)) (currentByte!13057 w2!587) (currentBit!13052 w2!587))))))

(assert (= (and d!93072 res!226728) b!272223))

(assert (= (and b!272223 res!226727) b!272224))

(assert (= (and b!272224 (not res!226729)) b!272225))

(assert (=> b!272223 m!404867))

(declare-fun m!404905 () Bool)

(assert (=> b!272223 m!404905))

(assert (=> b!272225 m!404867))

(assert (=> b!272225 m!404867))

(declare-fun m!404907 () Bool)

(assert (=> b!272225 m!404907))

(assert (=> b!272163 d!93072))

(declare-fun d!93074 () Bool)

(declare-fun res!226731 () Bool)

(declare-fun e!192058 () Bool)

(assert (=> d!93074 (=> (not res!226731) (not e!192058))))

(assert (=> d!93074 (= res!226731 (= (size!6597 (buf!7065 w1!591)) (size!6597 (buf!7065 w3!25))))))

(assert (=> d!93074 (= (isPrefixOf!0 w1!591 w3!25) e!192058)))

(declare-fun b!272226 () Bool)

(declare-fun res!226730 () Bool)

(assert (=> b!272226 (=> (not res!226730) (not e!192058))))

(assert (=> b!272226 (= res!226730 (bvsle (bitIndex!0 (size!6597 (buf!7065 w1!591)) (currentByte!13057 w1!591) (currentBit!13052 w1!591)) (bitIndex!0 (size!6597 (buf!7065 w3!25)) (currentByte!13057 w3!25) (currentBit!13052 w3!25))))))

(declare-fun b!272227 () Bool)

(declare-fun e!192057 () Bool)

(assert (=> b!272227 (= e!192058 e!192057)))

(declare-fun res!226732 () Bool)

(assert (=> b!272227 (=> res!226732 e!192057)))

(assert (=> b!272227 (= res!226732 (= (size!6597 (buf!7065 w1!591)) #b00000000000000000000000000000000))))

(declare-fun b!272228 () Bool)

(assert (=> b!272228 (= e!192057 (arrayBitRangesEq!0 (buf!7065 w1!591) (buf!7065 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6597 (buf!7065 w1!591)) (currentByte!13057 w1!591) (currentBit!13052 w1!591))))))

(assert (= (and d!93074 res!226731) b!272226))

(assert (= (and b!272226 res!226730) b!272227))

(assert (= (and b!272227 (not res!226732)) b!272228))

(assert (=> b!272226 m!404864))

(assert (=> b!272226 m!404905))

(assert (=> b!272228 m!404864))

(assert (=> b!272228 m!404864))

(declare-fun m!404909 () Bool)

(assert (=> b!272228 m!404909))

(assert (=> b!272168 d!93074))

(assert (=> b!272162 d!93054))

(declare-fun d!93076 () Bool)

(assert (=> d!93076 (= (array_inv!6321 (buf!7065 w3!25)) (bvsge (size!6597 (buf!7065 w3!25)) #b00000000000000000000000000000000))))

(assert (=> b!272167 d!93076))

(declare-fun d!93078 () Bool)

(assert (=> d!93078 (= (array_inv!6321 (buf!7065 w1!591)) (bvsge (size!6597 (buf!7065 w1!591)) #b00000000000000000000000000000000))))

(assert (=> b!272161 d!93078))

(declare-fun d!93080 () Bool)

(declare-fun res!226737 () Bool)

(declare-fun e!192063 () Bool)

(assert (=> d!93080 (=> res!226737 e!192063)))

(assert (=> d!93080 (= res!226737 (= #b00000000000000000000000000000000 (currentByte!13057 w1!591)))))

(assert (=> d!93080 (= (arrayRangesEq!1129 (buf!7065 w1!591) (buf!7065 w3!25) #b00000000000000000000000000000000 (currentByte!13057 w1!591)) e!192063)))

(declare-fun b!272233 () Bool)

(declare-fun e!192064 () Bool)

(assert (=> b!272233 (= e!192063 e!192064)))

(declare-fun res!226738 () Bool)

(assert (=> b!272233 (=> (not res!226738) (not e!192064))))

(assert (=> b!272233 (= res!226738 (= (select (arr!7584 (buf!7065 w1!591)) #b00000000000000000000000000000000) (select (arr!7584 (buf!7065 w3!25)) #b00000000000000000000000000000000)))))

(declare-fun b!272234 () Bool)

(assert (=> b!272234 (= e!192064 (arrayRangesEq!1129 (buf!7065 w1!591) (buf!7065 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!13057 w1!591)))))

(assert (= (and d!93080 (not res!226737)) b!272233))

(assert (= (and b!272233 res!226738) b!272234))

(declare-fun m!404911 () Bool)

(assert (=> b!272233 m!404911))

(declare-fun m!404913 () Bool)

(assert (=> b!272233 m!404913))

(declare-fun m!404915 () Bool)

(assert (=> b!272234 m!404915))

(assert (=> b!272166 d!93080))

(declare-fun d!93082 () Bool)

(assert (=> d!93082 (arrayRangesEq!1129 (buf!7065 w1!591) (buf!7065 w3!25) #b00000000000000000000000000000000 (currentByte!13057 w1!591))))

(declare-fun lt!410195 () Unit!19165)

(declare-fun choose!446 (array!15174 array!15174 array!15174 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19165)

(assert (=> d!93082 (= lt!410195 (choose!446 (buf!7065 w1!591) (buf!7065 w2!587) (buf!7065 w3!25) #b00000000000000000000000000000000 (currentByte!13057 w1!591) (currentByte!13057 w2!587)))))

(assert (=> d!93082 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!13057 w1!591)) (bvsle (currentByte!13057 w1!591) (currentByte!13057 w2!587)))))

(assert (=> d!93082 (= (arrayRangesEqTransitive!392 (buf!7065 w1!591) (buf!7065 w2!587) (buf!7065 w3!25) #b00000000000000000000000000000000 (currentByte!13057 w1!591) (currentByte!13057 w2!587)) lt!410195)))

(declare-fun bs!23472 () Bool)

(assert (= bs!23472 d!93082))

(assert (=> bs!23472 m!404813))

(declare-fun m!404917 () Bool)

(assert (=> bs!23472 m!404917))

(assert (=> b!272166 d!93082))

(assert (=> b!272171 d!93054))

(declare-fun d!93084 () Bool)

(assert (=> d!93084 (= (array_inv!6321 (buf!7065 w2!587)) (bvsge (size!6597 (buf!7065 w2!587)) #b00000000000000000000000000000000))))

(assert (=> b!272160 d!93084))

(push 1)

(assert (not b!272234))

(assert (not b!272226))

(assert (not b!272228))

(assert (not d!93048))

(assert (not b!272211))

(assert (not b!272213))

(assert (not d!93052))

(assert (not d!93070))

(assert (not d!93082))

(assert (not b!272225))

(assert (not d!93050))

(assert (not b!272223))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!93134 () Bool)

(declare-fun e!192141 () Bool)

(assert (=> d!93134 e!192141))

(declare-fun res!226817 () Bool)

(assert (=> d!93134 (=> (not res!226817) (not e!192141))))

(declare-fun lt!410298 () (_ BitVec 64))

(declare-fun lt!410301 () (_ BitVec 64))

(declare-fun lt!410299 () (_ BitVec 64))

(assert (=> d!93134 (= res!226817 (= lt!410298 (bvsub lt!410299 lt!410301)))))

(assert (=> d!93134 (or (= (bvand lt!410299 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!410301 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!410299 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!410299 lt!410301) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!93134 (= lt!410301 (remainingBits!0 ((_ sign_extend 32) (size!6597 (buf!7065 w2!587))) ((_ sign_extend 32) (currentByte!13057 w2!587)) ((_ sign_extend 32) (currentBit!13052 w2!587))))))

(declare-fun lt!410300 () (_ BitVec 64))

(declare-fun lt!410303 () (_ BitVec 64))

(assert (=> d!93134 (= lt!410299 (bvmul lt!410300 lt!410303))))

(assert (=> d!93134 (or (= lt!410300 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!410303 (bvsdiv (bvmul lt!410300 lt!410303) lt!410300)))))

(assert (=> d!93134 (= lt!410303 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!93134 (= lt!410300 ((_ sign_extend 32) (size!6597 (buf!7065 w2!587))))))

(assert (=> d!93134 (= lt!410298 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13057 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13052 w2!587))))))

(assert (=> d!93134 (invariant!0 (currentBit!13052 w2!587) (currentByte!13057 w2!587) (size!6597 (buf!7065 w2!587)))))

(assert (=> d!93134 (= (bitIndex!0 (size!6597 (buf!7065 w2!587)) (currentByte!13057 w2!587) (currentBit!13052 w2!587)) lt!410298)))

(declare-fun b!272333 () Bool)

(declare-fun res!226818 () Bool)

(assert (=> b!272333 (=> (not res!226818) (not e!192141))))

(assert (=> b!272333 (= res!226818 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!410298))))

(declare-fun b!272334 () Bool)

(declare-fun lt!410302 () (_ BitVec 64))

(assert (=> b!272334 (= e!192141 (bvsle lt!410298 (bvmul lt!410302 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!272334 (or (= lt!410302 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!410302 #b0000000000000000000000000000000000000000000000000000000000001000) lt!410302)))))

(assert (=> b!272334 (= lt!410302 ((_ sign_extend 32) (size!6597 (buf!7065 w2!587))))))

(assert (= (and d!93134 res!226817) b!272333))

(assert (= (and b!272333 res!226818) b!272334))

(declare-fun m!405035 () Bool)

(assert (=> d!93134 m!405035))

(assert (=> d!93134 m!404875))

(assert (=> b!272223 d!93134))

(declare-fun d!93136 () Bool)

(declare-fun e!192142 () Bool)

(assert (=> d!93136 e!192142))

(declare-fun res!226819 () Bool)

(assert (=> d!93136 (=> (not res!226819) (not e!192142))))

(declare-fun lt!410304 () (_ BitVec 64))

(declare-fun lt!410305 () (_ BitVec 64))

(declare-fun lt!410307 () (_ BitVec 64))

(assert (=> d!93136 (= res!226819 (= lt!410304 (bvsub lt!410305 lt!410307)))))

(assert (=> d!93136 (or (= (bvand lt!410305 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!410307 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!410305 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!410305 lt!410307) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!93136 (= lt!410307 (remainingBits!0 ((_ sign_extend 32) (size!6597 (buf!7065 w3!25))) ((_ sign_extend 32) (currentByte!13057 w3!25)) ((_ sign_extend 32) (currentBit!13052 w3!25))))))

(declare-fun lt!410306 () (_ BitVec 64))

(declare-fun lt!410309 () (_ BitVec 64))

(assert (=> d!93136 (= lt!410305 (bvmul lt!410306 lt!410309))))

(assert (=> d!93136 (or (= lt!410306 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!410309 (bvsdiv (bvmul lt!410306 lt!410309) lt!410306)))))

(assert (=> d!93136 (= lt!410309 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!93136 (= lt!410306 ((_ sign_extend 32) (size!6597 (buf!7065 w3!25))))))

(assert (=> d!93136 (= lt!410304 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13057 w3!25)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13052 w3!25))))))

(assert (=> d!93136 (invariant!0 (currentBit!13052 w3!25) (currentByte!13057 w3!25) (size!6597 (buf!7065 w3!25)))))

(assert (=> d!93136 (= (bitIndex!0 (size!6597 (buf!7065 w3!25)) (currentByte!13057 w3!25) (currentBit!13052 w3!25)) lt!410304)))

(declare-fun b!272335 () Bool)

(declare-fun res!226820 () Bool)

(assert (=> b!272335 (=> (not res!226820) (not e!192142))))

(assert (=> b!272335 (= res!226820 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!410304))))

(declare-fun b!272336 () Bool)

(declare-fun lt!410308 () (_ BitVec 64))

(assert (=> b!272336 (= e!192142 (bvsle lt!410304 (bvmul lt!410308 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!272336 (or (= lt!410308 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!410308 #b0000000000000000000000000000000000000000000000000000000000001000) lt!410308)))))

(assert (=> b!272336 (= lt!410308 ((_ sign_extend 32) (size!6597 (buf!7065 w3!25))))))

(assert (= (and d!93136 res!226819) b!272335))

(assert (= (and b!272335 res!226820) b!272336))

(declare-fun m!405037 () Bool)

(assert (=> d!93136 m!405037))

(assert (=> d!93136 m!404877))

(assert (=> b!272223 d!93136))

(declare-fun d!93138 () Bool)

(assert (=> d!93138 (= (select (arr!7584 (buf!7065 w2!587)) (currentByte!13057 w1!591)) (select (arr!7584 (buf!7065 w3!25)) (currentByte!13057 w1!591)))))

(assert (=> d!93138 true))

(declare-fun _$12!117 () Unit!19165)

(assert (=> d!93138 (= (choose!445 (buf!7065 w2!587) (buf!7065 w3!25) #b00000000000000000000000000000000 (currentByte!13057 w1!591) (currentByte!13057 w2!587)) _$12!117)))

(declare-fun bs!23477 () Bool)

(assert (= bs!23477 d!93138))

(assert (=> bs!23477 m!404799))

(assert (=> bs!23477 m!404793))

(assert (=> d!93070 d!93138))

(declare-fun b!272351 () Bool)

(declare-fun e!192158 () Bool)

(declare-fun e!192159 () Bool)

(assert (=> b!272351 (= e!192158 e!192159)))

(declare-fun res!226834 () Bool)

(declare-fun lt!410318 () (_ BitVec 32))

(declare-datatypes ((tuple4!478 0))(
  ( (tuple4!479 (_1!12222 (_ BitVec 32)) (_2!12222 (_ BitVec 32)) (_3!1019 (_ BitVec 32)) (_4!239 (_ BitVec 32))) )
))
(declare-fun lt!410317 () tuple4!478)

(assert (=> b!272351 (= res!226834 (byteRangesEq!0 (select (arr!7584 (buf!7065 w1!591)) (_3!1019 lt!410317)) (select (arr!7584 (buf!7065 w2!587)) (_3!1019 lt!410317)) lt!410318 #b00000000000000000000000000001000))))

(assert (=> b!272351 (=> (not res!226834) (not e!192159))))

(declare-fun b!272352 () Bool)

(declare-fun call!4368 () Bool)

(assert (=> b!272352 (= e!192158 call!4368)))

(declare-fun b!272353 () Bool)

(declare-fun e!192160 () Bool)

(declare-fun e!192156 () Bool)

(assert (=> b!272353 (= e!192160 e!192156)))

(declare-fun res!226835 () Bool)

(assert (=> b!272353 (=> (not res!226835) (not e!192156))))

(declare-fun e!192155 () Bool)

(assert (=> b!272353 (= res!226835 e!192155)))

(declare-fun res!226831 () Bool)

(assert (=> b!272353 (=> res!226831 e!192155)))

(assert (=> b!272353 (= res!226831 (bvsge (_1!12222 lt!410317) (_2!12222 lt!410317)))))

(declare-fun lt!410316 () (_ BitVec 32))

(assert (=> b!272353 (= lt!410316 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6597 (buf!7065 w1!591)) (currentByte!13057 w1!591) (currentBit!13052 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!272353 (= lt!410318 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!478)

(assert (=> b!272353 (= lt!410317 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6597 (buf!7065 w1!591)) (currentByte!13057 w1!591) (currentBit!13052 w1!591))))))

(declare-fun d!93140 () Bool)

(declare-fun res!226832 () Bool)

(assert (=> d!93140 (=> res!226832 e!192160)))

(assert (=> d!93140 (= res!226832 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6597 (buf!7065 w1!591)) (currentByte!13057 w1!591) (currentBit!13052 w1!591))))))

(assert (=> d!93140 (= (arrayBitRangesEq!0 (buf!7065 w1!591) (buf!7065 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6597 (buf!7065 w1!591)) (currentByte!13057 w1!591) (currentBit!13052 w1!591))) e!192160)))

(declare-fun b!272354 () Bool)

(assert (=> b!272354 (= e!192156 e!192158)))

(declare-fun c!12544 () Bool)

(assert (=> b!272354 (= c!12544 (= (_3!1019 lt!410317) (_4!239 lt!410317)))))

(declare-fun bm!4365 () Bool)

(assert (=> bm!4365 (= call!4368 (byteRangesEq!0 (ite c!12544 (select (arr!7584 (buf!7065 w1!591)) (_3!1019 lt!410317)) (select (arr!7584 (buf!7065 w1!591)) (_4!239 lt!410317))) (ite c!12544 (select (arr!7584 (buf!7065 w2!587)) (_3!1019 lt!410317)) (select (arr!7584 (buf!7065 w2!587)) (_4!239 lt!410317))) (ite c!12544 lt!410318 #b00000000000000000000000000000000) lt!410316))))

(declare-fun b!272355 () Bool)

(declare-fun res!226833 () Bool)

(assert (=> b!272355 (= res!226833 (= lt!410316 #b00000000000000000000000000000000))))

(declare-fun e!192157 () Bool)

(assert (=> b!272355 (=> res!226833 e!192157)))

(assert (=> b!272355 (= e!192159 e!192157)))

(declare-fun b!272356 () Bool)

(assert (=> b!272356 (= e!192157 call!4368)))

(declare-fun b!272357 () Bool)

(assert (=> b!272357 (= e!192155 (arrayRangesEq!1129 (buf!7065 w1!591) (buf!7065 w2!587) (_1!12222 lt!410317) (_2!12222 lt!410317)))))

(assert (= (and d!93140 (not res!226832)) b!272353))

(assert (= (and b!272353 (not res!226831)) b!272357))

(assert (= (and b!272353 res!226835) b!272354))

(assert (= (and b!272354 c!12544) b!272352))

(assert (= (and b!272354 (not c!12544)) b!272351))

(assert (= (and b!272351 res!226834) b!272355))

(assert (= (and b!272355 (not res!226833)) b!272356))

(assert (= (or b!272352 b!272356) bm!4365))

(declare-fun m!405039 () Bool)

(assert (=> b!272351 m!405039))

(declare-fun m!405041 () Bool)

(assert (=> b!272351 m!405041))

(assert (=> b!272351 m!405039))

(assert (=> b!272351 m!405041))

(declare-fun m!405043 () Bool)

(assert (=> b!272351 m!405043))

(assert (=> b!272353 m!404864))

(declare-fun m!405045 () Bool)

(assert (=> b!272353 m!405045))

(assert (=> bm!4365 m!405041))

(declare-fun m!405047 () Bool)

(assert (=> bm!4365 m!405047))

(declare-fun m!405049 () Bool)

(assert (=> bm!4365 m!405049))

(declare-fun m!405051 () Bool)

(assert (=> bm!4365 m!405051))

(assert (=> bm!4365 m!405039))

(declare-fun m!405053 () Bool)

(assert (=> b!272357 m!405053))

(assert (=> b!272213 d!93140))

(declare-fun d!93142 () Bool)

(declare-fun e!192161 () Bool)

(assert (=> d!93142 e!192161))

(declare-fun res!226836 () Bool)

(assert (=> d!93142 (=> (not res!226836) (not e!192161))))

(declare-fun lt!410322 () (_ BitVec 64))

(declare-fun lt!410320 () (_ BitVec 64))

(declare-fun lt!410319 () (_ BitVec 64))

(assert (=> d!93142 (= res!226836 (= lt!410319 (bvsub lt!410320 lt!410322)))))

(assert (=> d!93142 (or (= (bvand lt!410320 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!410322 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!410320 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!410320 lt!410322) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!93142 (= lt!410322 (remainingBits!0 ((_ sign_extend 32) (size!6597 (buf!7065 w1!591))) ((_ sign_extend 32) (currentByte!13057 w1!591)) ((_ sign_extend 32) (currentBit!13052 w1!591))))))

(declare-fun lt!410321 () (_ BitVec 64))

(declare-fun lt!410324 () (_ BitVec 64))

(assert (=> d!93142 (= lt!410320 (bvmul lt!410321 lt!410324))))

(assert (=> d!93142 (or (= lt!410321 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!410324 (bvsdiv (bvmul lt!410321 lt!410324) lt!410321)))))

(assert (=> d!93142 (= lt!410324 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!93142 (= lt!410321 ((_ sign_extend 32) (size!6597 (buf!7065 w1!591))))))

(assert (=> d!93142 (= lt!410319 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13057 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13052 w1!591))))))

(assert (=> d!93142 (invariant!0 (currentBit!13052 w1!591) (currentByte!13057 w1!591) (size!6597 (buf!7065 w1!591)))))

(assert (=> d!93142 (= (bitIndex!0 (size!6597 (buf!7065 w1!591)) (currentByte!13057 w1!591) (currentBit!13052 w1!591)) lt!410319)))

(declare-fun b!272358 () Bool)

(declare-fun res!226837 () Bool)

(assert (=> b!272358 (=> (not res!226837) (not e!192161))))

(assert (=> b!272358 (= res!226837 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!410319))))

(declare-fun b!272359 () Bool)

(declare-fun lt!410323 () (_ BitVec 64))

(assert (=> b!272359 (= e!192161 (bvsle lt!410319 (bvmul lt!410323 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!272359 (or (= lt!410323 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!410323 #b0000000000000000000000000000000000000000000000000000000000001000) lt!410323)))))

(assert (=> b!272359 (= lt!410323 ((_ sign_extend 32) (size!6597 (buf!7065 w1!591))))))

(assert (= (and d!93142 res!226836) b!272358))

(assert (= (and b!272358 res!226837) b!272359))

(declare-fun m!405055 () Bool)

(assert (=> d!93142 m!405055))

(assert (=> d!93142 m!404873))

(assert (=> b!272213 d!93142))

(declare-fun d!93144 () Bool)

(assert (=> d!93144 (= (invariant!0 (currentBit!13052 w3!25) (currentByte!13057 w3!25) (size!6597 (buf!7065 w3!25))) (and (bvsge (currentBit!13052 w3!25) #b00000000000000000000000000000000) (bvslt (currentBit!13052 w3!25) #b00000000000000000000000000001000) (bvsge (currentByte!13057 w3!25) #b00000000000000000000000000000000) (or (bvslt (currentByte!13057 w3!25) (size!6597 (buf!7065 w3!25))) (and (= (currentBit!13052 w3!25) #b00000000000000000000000000000000) (= (currentByte!13057 w3!25) (size!6597 (buf!7065 w3!25)))))))))

(assert (=> d!93052 d!93144))

(assert (=> b!272226 d!93142))

(assert (=> b!272226 d!93136))

(declare-fun b!272360 () Bool)

(declare-fun e!192165 () Bool)

(declare-fun e!192166 () Bool)

(assert (=> b!272360 (= e!192165 e!192166)))

(declare-fun res!226841 () Bool)

(declare-fun lt!410327 () (_ BitVec 32))

(declare-fun lt!410326 () tuple4!478)

(assert (=> b!272360 (= res!226841 (byteRangesEq!0 (select (arr!7584 (buf!7065 w2!587)) (_3!1019 lt!410326)) (select (arr!7584 (buf!7065 w3!25)) (_3!1019 lt!410326)) lt!410327 #b00000000000000000000000000001000))))

(assert (=> b!272360 (=> (not res!226841) (not e!192166))))

(declare-fun b!272361 () Bool)

(declare-fun call!4369 () Bool)

(assert (=> b!272361 (= e!192165 call!4369)))

(declare-fun b!272362 () Bool)

(declare-fun e!192167 () Bool)

(declare-fun e!192163 () Bool)

(assert (=> b!272362 (= e!192167 e!192163)))

(declare-fun res!226842 () Bool)

(assert (=> b!272362 (=> (not res!226842) (not e!192163))))

(declare-fun e!192162 () Bool)

(assert (=> b!272362 (= res!226842 e!192162)))

(declare-fun res!226838 () Bool)

(assert (=> b!272362 (=> res!226838 e!192162)))

(assert (=> b!272362 (= res!226838 (bvsge (_1!12222 lt!410326) (_2!12222 lt!410326)))))

(declare-fun lt!410325 () (_ BitVec 32))

(assert (=> b!272362 (= lt!410325 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6597 (buf!7065 w2!587)) (currentByte!13057 w2!587) (currentBit!13052 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!272362 (= lt!410327 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!272362 (= lt!410326 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6597 (buf!7065 w2!587)) (currentByte!13057 w2!587) (currentBit!13052 w2!587))))))

(declare-fun d!93146 () Bool)

(declare-fun res!226839 () Bool)

(assert (=> d!93146 (=> res!226839 e!192167)))

(assert (=> d!93146 (= res!226839 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6597 (buf!7065 w2!587)) (currentByte!13057 w2!587) (currentBit!13052 w2!587))))))

(assert (=> d!93146 (= (arrayBitRangesEq!0 (buf!7065 w2!587) (buf!7065 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6597 (buf!7065 w2!587)) (currentByte!13057 w2!587) (currentBit!13052 w2!587))) e!192167)))

(declare-fun b!272363 () Bool)

(assert (=> b!272363 (= e!192163 e!192165)))

(declare-fun c!12545 () Bool)

(assert (=> b!272363 (= c!12545 (= (_3!1019 lt!410326) (_4!239 lt!410326)))))

(declare-fun bm!4366 () Bool)

(assert (=> bm!4366 (= call!4369 (byteRangesEq!0 (ite c!12545 (select (arr!7584 (buf!7065 w2!587)) (_3!1019 lt!410326)) (select (arr!7584 (buf!7065 w2!587)) (_4!239 lt!410326))) (ite c!12545 (select (arr!7584 (buf!7065 w3!25)) (_3!1019 lt!410326)) (select (arr!7584 (buf!7065 w3!25)) (_4!239 lt!410326))) (ite c!12545 lt!410327 #b00000000000000000000000000000000) lt!410325))))

(declare-fun b!272364 () Bool)

(declare-fun res!226840 () Bool)

(assert (=> b!272364 (= res!226840 (= lt!410325 #b00000000000000000000000000000000))))

(declare-fun e!192164 () Bool)

(assert (=> b!272364 (=> res!226840 e!192164)))

(assert (=> b!272364 (= e!192166 e!192164)))

(declare-fun b!272365 () Bool)

(assert (=> b!272365 (= e!192164 call!4369)))

(declare-fun b!272366 () Bool)

(assert (=> b!272366 (= e!192162 (arrayRangesEq!1129 (buf!7065 w2!587) (buf!7065 w3!25) (_1!12222 lt!410326) (_2!12222 lt!410326)))))

(assert (= (and d!93146 (not res!226839)) b!272362))

(assert (= (and b!272362 (not res!226838)) b!272366))

(assert (= (and b!272362 res!226842) b!272363))

(assert (= (and b!272363 c!12545) b!272361))

(assert (= (and b!272363 (not c!12545)) b!272360))

(assert (= (and b!272360 res!226841) b!272364))

(assert (= (and b!272364 (not res!226840)) b!272365))

(assert (= (or b!272361 b!272365) bm!4366))

(declare-fun m!405057 () Bool)

(assert (=> b!272360 m!405057))

(declare-fun m!405059 () Bool)

(assert (=> b!272360 m!405059))

(assert (=> b!272360 m!405057))

(assert (=> b!272360 m!405059))

(declare-fun m!405061 () Bool)

(assert (=> b!272360 m!405061))

(assert (=> b!272362 m!404867))

(declare-fun m!405063 () Bool)

(assert (=> b!272362 m!405063))

(assert (=> bm!4366 m!405059))

(declare-fun m!405065 () Bool)

(assert (=> bm!4366 m!405065))

(declare-fun m!405067 () Bool)

(assert (=> bm!4366 m!405067))

(declare-fun m!405069 () Bool)

(assert (=> bm!4366 m!405069))

(assert (=> bm!4366 m!405057))

(declare-fun m!405071 () Bool)

(assert (=> b!272366 m!405071))

(assert (=> b!272225 d!93146))

(assert (=> b!272225 d!93134))

(assert (=> d!93082 d!93080))

(declare-fun d!93148 () Bool)

(assert (=> d!93148 (arrayRangesEq!1129 (buf!7065 w1!591) (buf!7065 w3!25) #b00000000000000000000000000000000 (currentByte!13057 w1!591))))

(assert (=> d!93148 true))

(declare-fun _$16!167 () Unit!19165)

(assert (=> d!93148 (= (choose!446 (buf!7065 w1!591) (buf!7065 w2!587) (buf!7065 w3!25) #b00000000000000000000000000000000 (currentByte!13057 w1!591) (currentByte!13057 w2!587)) _$16!167)))

(declare-fun bs!23478 () Bool)

(assert (= bs!23478 d!93148))

(assert (=> bs!23478 m!404813))

(assert (=> d!93082 d!93148))

(declare-fun d!93150 () Bool)

(assert (=> d!93150 (= (invariant!0 (currentBit!13052 w1!591) (currentByte!13057 w1!591) (size!6597 (buf!7065 w1!591))) (and (bvsge (currentBit!13052 w1!591) #b00000000000000000000000000000000) (bvslt (currentBit!13052 w1!591) #b00000000000000000000000000001000) (bvsge (currentByte!13057 w1!591) #b00000000000000000000000000000000) (or (bvslt (currentByte!13057 w1!591) (size!6597 (buf!7065 w1!591))) (and (= (currentBit!13052 w1!591) #b00000000000000000000000000000000) (= (currentByte!13057 w1!591) (size!6597 (buf!7065 w1!591)))))))))

(assert (=> d!93048 d!93150))

(declare-fun b!272367 () Bool)

(declare-fun e!192171 () Bool)

(declare-fun e!192172 () Bool)

(assert (=> b!272367 (= e!192171 e!192172)))

(declare-fun lt!410330 () (_ BitVec 32))

(declare-fun res!226846 () Bool)

(declare-fun lt!410329 () tuple4!478)

(assert (=> b!272367 (= res!226846 (byteRangesEq!0 (select (arr!7584 (buf!7065 w1!591)) (_3!1019 lt!410329)) (select (arr!7584 (buf!7065 w3!25)) (_3!1019 lt!410329)) lt!410330 #b00000000000000000000000000001000))))

(assert (=> b!272367 (=> (not res!226846) (not e!192172))))

(declare-fun b!272368 () Bool)

(declare-fun call!4370 () Bool)

(assert (=> b!272368 (= e!192171 call!4370)))

(declare-fun b!272369 () Bool)

(declare-fun e!192173 () Bool)

(declare-fun e!192169 () Bool)

(assert (=> b!272369 (= e!192173 e!192169)))

(declare-fun res!226847 () Bool)

(assert (=> b!272369 (=> (not res!226847) (not e!192169))))

(declare-fun e!192168 () Bool)

(assert (=> b!272369 (= res!226847 e!192168)))

(declare-fun res!226843 () Bool)

(assert (=> b!272369 (=> res!226843 e!192168)))

(assert (=> b!272369 (= res!226843 (bvsge (_1!12222 lt!410329) (_2!12222 lt!410329)))))

(declare-fun lt!410328 () (_ BitVec 32))

(assert (=> b!272369 (= lt!410328 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6597 (buf!7065 w1!591)) (currentByte!13057 w1!591) (currentBit!13052 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!272369 (= lt!410330 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!272369 (= lt!410329 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6597 (buf!7065 w1!591)) (currentByte!13057 w1!591) (currentBit!13052 w1!591))))))

(declare-fun d!93152 () Bool)

(declare-fun res!226844 () Bool)

(assert (=> d!93152 (=> res!226844 e!192173)))

(assert (=> d!93152 (= res!226844 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6597 (buf!7065 w1!591)) (currentByte!13057 w1!591) (currentBit!13052 w1!591))))))

(assert (=> d!93152 (= (arrayBitRangesEq!0 (buf!7065 w1!591) (buf!7065 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6597 (buf!7065 w1!591)) (currentByte!13057 w1!591) (currentBit!13052 w1!591))) e!192173)))

(declare-fun b!272370 () Bool)

(assert (=> b!272370 (= e!192169 e!192171)))

(declare-fun c!12546 () Bool)

(assert (=> b!272370 (= c!12546 (= (_3!1019 lt!410329) (_4!239 lt!410329)))))

(declare-fun bm!4367 () Bool)

(assert (=> bm!4367 (= call!4370 (byteRangesEq!0 (ite c!12546 (select (arr!7584 (buf!7065 w1!591)) (_3!1019 lt!410329)) (select (arr!7584 (buf!7065 w1!591)) (_4!239 lt!410329))) (ite c!12546 (select (arr!7584 (buf!7065 w3!25)) (_3!1019 lt!410329)) (select (arr!7584 (buf!7065 w3!25)) (_4!239 lt!410329))) (ite c!12546 lt!410330 #b00000000000000000000000000000000) lt!410328))))

(declare-fun b!272371 () Bool)

(declare-fun res!226845 () Bool)

(assert (=> b!272371 (= res!226845 (= lt!410328 #b00000000000000000000000000000000))))

(declare-fun e!192170 () Bool)

(assert (=> b!272371 (=> res!226845 e!192170)))

(assert (=> b!272371 (= e!192172 e!192170)))

(declare-fun b!272372 () Bool)

(assert (=> b!272372 (= e!192170 call!4370)))

(declare-fun b!272373 () Bool)

(assert (=> b!272373 (= e!192168 (arrayRangesEq!1129 (buf!7065 w1!591) (buf!7065 w3!25) (_1!12222 lt!410329) (_2!12222 lt!410329)))))

(assert (= (and d!93152 (not res!226844)) b!272369))

(assert (= (and b!272369 (not res!226843)) b!272373))

(assert (= (and b!272369 res!226847) b!272370))

(assert (= (and b!272370 c!12546) b!272368))

(assert (= (and b!272370 (not c!12546)) b!272367))

(assert (= (and b!272367 res!226846) b!272371))

(assert (= (and b!272371 (not res!226845)) b!272372))

(assert (= (or b!272368 b!272372) bm!4367))

(declare-fun m!405073 () Bool)

(assert (=> b!272367 m!405073))

(declare-fun m!405075 () Bool)

(assert (=> b!272367 m!405075))

(assert (=> b!272367 m!405073))

(assert (=> b!272367 m!405075))

(declare-fun m!405077 () Bool)

(assert (=> b!272367 m!405077))

(assert (=> b!272369 m!404864))

(assert (=> b!272369 m!405045))

(assert (=> bm!4367 m!405075))

(declare-fun m!405079 () Bool)

(assert (=> bm!4367 m!405079))

(declare-fun m!405081 () Bool)

(assert (=> bm!4367 m!405081))

(declare-fun m!405083 () Bool)

(assert (=> bm!4367 m!405083))

(assert (=> bm!4367 m!405073))

(declare-fun m!405085 () Bool)

(assert (=> b!272373 m!405085))

(assert (=> b!272228 d!93152))

(assert (=> b!272228 d!93142))

(declare-fun d!93154 () Bool)

(assert (=> d!93154 (= (invariant!0 (currentBit!13052 w2!587) (currentByte!13057 w2!587) (size!6597 (buf!7065 w2!587))) (and (bvsge (currentBit!13052 w2!587) #b00000000000000000000000000000000) (bvslt (currentBit!13052 w2!587) #b00000000000000000000000000001000) (bvsge (currentByte!13057 w2!587) #b00000000000000000000000000000000) (or (bvslt (currentByte!13057 w2!587) (size!6597 (buf!7065 w2!587))) (and (= (currentBit!13052 w2!587) #b00000000000000000000000000000000) (= (currentByte!13057 w2!587) (size!6597 (buf!7065 w2!587)))))))))

(assert (=> d!93050 d!93154))

(declare-fun d!93156 () Bool)

(declare-fun res!226848 () Bool)

(declare-fun e!192174 () Bool)

(assert (=> d!93156 (=> res!226848 e!192174)))

(assert (=> d!93156 (= res!226848 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!13057 w1!591)))))

(assert (=> d!93156 (= (arrayRangesEq!1129 (buf!7065 w1!591) (buf!7065 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!13057 w1!591)) e!192174)))

(declare-fun b!272374 () Bool)

(declare-fun e!192175 () Bool)

(assert (=> b!272374 (= e!192174 e!192175)))

(declare-fun res!226849 () Bool)

(assert (=> b!272374 (=> (not res!226849) (not e!192175))))

(assert (=> b!272374 (= res!226849 (= (select (arr!7584 (buf!7065 w1!591)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!7584 (buf!7065 w3!25)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!272375 () Bool)

(assert (=> b!272375 (= e!192175 (arrayRangesEq!1129 (buf!7065 w1!591) (buf!7065 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!13057 w1!591)))))

(assert (= (and d!93156 (not res!226848)) b!272374))

(assert (= (and b!272374 res!226849) b!272375))

(declare-fun m!405087 () Bool)

(assert (=> b!272374 m!405087))

(declare-fun m!405089 () Bool)

(assert (=> b!272374 m!405089))

(declare-fun m!405091 () Bool)

(assert (=> b!272375 m!405091))

(assert (=> b!272234 d!93156))

(assert (=> b!272211 d!93142))

(assert (=> b!272211 d!93134))

(push 1)

(assert (not bm!4367))

(assert (not d!93134))

(assert (not b!272366))

(assert (not b!272367))

(assert (not d!93148))

(assert (not d!93136))

(assert (not d!93142))

(assert (not b!272375))

(assert (not bm!4366))

(assert (not b!272357))

(assert (not b!272353))

(assert (not bm!4365))

(assert (not b!272351))

(assert (not b!272373))

(assert (not b!272369))

(assert (not b!272360))

(assert (not b!272362))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!93188 () Bool)

(assert (=> d!93188 (= (byteRangesEq!0 (ite c!12545 (select (arr!7584 (buf!7065 w2!587)) (_3!1019 lt!410326)) (select (arr!7584 (buf!7065 w2!587)) (_4!239 lt!410326))) (ite c!12545 (select (arr!7584 (buf!7065 w3!25)) (_3!1019 lt!410326)) (select (arr!7584 (buf!7065 w3!25)) (_4!239 lt!410326))) (ite c!12545 lt!410327 #b00000000000000000000000000000000) lt!410325) (or (= (ite c!12545 lt!410327 #b00000000000000000000000000000000) lt!410325) (= (bvand (bvand (bvand ((_ sign_extend 24) (ite c!12545 (select (arr!7584 (buf!7065 w2!587)) (_3!1019 lt!410326)) (select (arr!7584 (buf!7065 w2!587)) (_4!239 lt!410326)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!410325))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!12545 lt!410327 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (ite c!12545 (select (arr!7584 (buf!7065 w3!25)) (_3!1019 lt!410326)) (select (arr!7584 (buf!7065 w3!25)) (_4!239 lt!410326)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!410325))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!12545 lt!410327 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111))))))

(declare-fun bs!23485 () Bool)

(assert (= bs!23485 d!93188))

(declare-fun m!405137 () Bool)

(assert (=> bs!23485 m!405137))

(declare-fun m!405139 () Bool)

(assert (=> bs!23485 m!405139))

(assert (=> bm!4366 d!93188))

(declare-fun d!93190 () Bool)

(assert (=> d!93190 (= (byteRangesEq!0 (ite c!12544 (select (arr!7584 (buf!7065 w1!591)) (_3!1019 lt!410317)) (select (arr!7584 (buf!7065 w1!591)) (_4!239 lt!410317))) (ite c!12544 (select (arr!7584 (buf!7065 w2!587)) (_3!1019 lt!410317)) (select (arr!7584 (buf!7065 w2!587)) (_4!239 lt!410317))) (ite c!12544 lt!410318 #b00000000000000000000000000000000) lt!410316) (or (= (ite c!12544 lt!410318 #b00000000000000000000000000000000) lt!410316) (= (bvand (bvand (bvand ((_ sign_extend 24) (ite c!12544 (select (arr!7584 (buf!7065 w1!591)) (_3!1019 lt!410317)) (select (arr!7584 (buf!7065 w1!591)) (_4!239 lt!410317)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!410316))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!12544 lt!410318 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (ite c!12544 (select (arr!7584 (buf!7065 w2!587)) (_3!1019 lt!410317)) (select (arr!7584 (buf!7065 w2!587)) (_4!239 lt!410317)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!410316))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!12544 lt!410318 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111))))))

(declare-fun bs!23486 () Bool)

(assert (= bs!23486 d!93190))

(declare-fun m!405141 () Bool)

(assert (=> bs!23486 m!405141))

(declare-fun m!405143 () Bool)

(assert (=> bs!23486 m!405143))

(assert (=> bm!4365 d!93190))

(declare-fun d!93192 () Bool)

(assert (=> d!93192 (= (byteRangesEq!0 (select (arr!7584 (buf!7065 w1!591)) (_3!1019 lt!410329)) (select (arr!7584 (buf!7065 w3!25)) (_3!1019 lt!410329)) lt!410330 #b00000000000000000000000000001000) (or (= lt!410330 #b00000000000000000000000000001000) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7584 (buf!7065 w1!591)) (_3!1019 lt!410329))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!410330)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7584 (buf!7065 w3!25)) (_3!1019 lt!410329))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!410330)))) #b00000000000000000000000011111111))))))

(declare-fun bs!23487 () Bool)

(assert (= bs!23487 d!93192))

(declare-fun m!405145 () Bool)

(assert (=> bs!23487 m!405145))

(declare-fun m!405147 () Bool)

(assert (=> bs!23487 m!405147))

(assert (=> b!272367 d!93192))

(declare-fun d!93194 () Bool)

(assert (=> d!93194 (= (remainingBits!0 ((_ sign_extend 32) (size!6597 (buf!7065 w2!587))) ((_ sign_extend 32) (currentByte!13057 w2!587)) ((_ sign_extend 32) (currentBit!13052 w2!587))) (bvsub (bvmul ((_ sign_extend 32) (size!6597 (buf!7065 w2!587))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!13057 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13052 w2!587)))))))

(assert (=> d!93134 d!93194))

(assert (=> d!93134 d!93154))

(declare-fun d!93196 () Bool)

(assert (=> d!93196 (= (byteRangesEq!0 (ite c!12546 (select (arr!7584 (buf!7065 w1!591)) (_3!1019 lt!410329)) (select (arr!7584 (buf!7065 w1!591)) (_4!239 lt!410329))) (ite c!12546 (select (arr!7584 (buf!7065 w3!25)) (_3!1019 lt!410329)) (select (arr!7584 (buf!7065 w3!25)) (_4!239 lt!410329))) (ite c!12546 lt!410330 #b00000000000000000000000000000000) lt!410328) (or (= (ite c!12546 lt!410330 #b00000000000000000000000000000000) lt!410328) (= (bvand (bvand (bvand ((_ sign_extend 24) (ite c!12546 (select (arr!7584 (buf!7065 w1!591)) (_3!1019 lt!410329)) (select (arr!7584 (buf!7065 w1!591)) (_4!239 lt!410329)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!410328))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!12546 lt!410330 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (ite c!12546 (select (arr!7584 (buf!7065 w3!25)) (_3!1019 lt!410329)) (select (arr!7584 (buf!7065 w3!25)) (_4!239 lt!410329)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!410328))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!12546 lt!410330 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111))))))

(declare-fun bs!23488 () Bool)

(assert (= bs!23488 d!93196))

(declare-fun m!405149 () Bool)

(assert (=> bs!23488 m!405149))

(declare-fun m!405151 () Bool)

(assert (=> bs!23488 m!405151))

(assert (=> bm!4367 d!93196))

(declare-fun d!93198 () Bool)

(declare-fun res!226858 () Bool)

(declare-fun e!192184 () Bool)

(assert (=> d!93198 (=> res!226858 e!192184)))

(assert (=> d!93198 (= res!226858 (= (_1!12222 lt!410326) (_2!12222 lt!410326)))))

(assert (=> d!93198 (= (arrayRangesEq!1129 (buf!7065 w2!587) (buf!7065 w3!25) (_1!12222 lt!410326) (_2!12222 lt!410326)) e!192184)))

(declare-fun b!272384 () Bool)

(declare-fun e!192185 () Bool)

(assert (=> b!272384 (= e!192184 e!192185)))

(declare-fun res!226859 () Bool)

(assert (=> b!272384 (=> (not res!226859) (not e!192185))))

(assert (=> b!272384 (= res!226859 (= (select (arr!7584 (buf!7065 w2!587)) (_1!12222 lt!410326)) (select (arr!7584 (buf!7065 w3!25)) (_1!12222 lt!410326))))))

(declare-fun b!272385 () Bool)

(assert (=> b!272385 (= e!192185 (arrayRangesEq!1129 (buf!7065 w2!587) (buf!7065 w3!25) (bvadd (_1!12222 lt!410326) #b00000000000000000000000000000001) (_2!12222 lt!410326)))))

(assert (= (and d!93198 (not res!226858)) b!272384))

(assert (= (and b!272384 res!226859) b!272385))

(declare-fun m!405153 () Bool)

(assert (=> b!272384 m!405153))

(declare-fun m!405155 () Bool)

(assert (=> b!272384 m!405155))

(declare-fun m!405157 () Bool)

(assert (=> b!272385 m!405157))

(assert (=> b!272366 d!93198))

(declare-fun d!93200 () Bool)

(declare-fun res!226860 () Bool)

(declare-fun e!192186 () Bool)

(assert (=> d!93200 (=> res!226860 e!192186)))

(assert (=> d!93200 (= res!226860 (= (_1!12222 lt!410317) (_2!12222 lt!410317)))))

(assert (=> d!93200 (= (arrayRangesEq!1129 (buf!7065 w1!591) (buf!7065 w2!587) (_1!12222 lt!410317) (_2!12222 lt!410317)) e!192186)))

(declare-fun b!272386 () Bool)

(declare-fun e!192187 () Bool)

(assert (=> b!272386 (= e!192186 e!192187)))

(declare-fun res!226861 () Bool)

(assert (=> b!272386 (=> (not res!226861) (not e!192187))))

(assert (=> b!272386 (= res!226861 (= (select (arr!7584 (buf!7065 w1!591)) (_1!12222 lt!410317)) (select (arr!7584 (buf!7065 w2!587)) (_1!12222 lt!410317))))))

(declare-fun b!272387 () Bool)

(assert (=> b!272387 (= e!192187 (arrayRangesEq!1129 (buf!7065 w1!591) (buf!7065 w2!587) (bvadd (_1!12222 lt!410317) #b00000000000000000000000000000001) (_2!12222 lt!410317)))))

(assert (= (and d!93200 (not res!226860)) b!272386))

(assert (= (and b!272386 res!226861) b!272387))

(declare-fun m!405159 () Bool)

(assert (=> b!272386 m!405159))

(declare-fun m!405161 () Bool)

(assert (=> b!272386 m!405161))

(declare-fun m!405163 () Bool)

(assert (=> b!272387 m!405163))

(assert (=> b!272357 d!93200))

(declare-fun d!93202 () Bool)

(assert (=> d!93202 (= (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6597 (buf!7065 w1!591)) (currentByte!13057 w1!591) (currentBit!13052 w1!591))) (tuple4!479 ((_ extract 31 0) (bvadd (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!6597 (buf!7065 w1!591)) (currentByte!13057 w1!591) (currentBit!13052 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!6597 (buf!7065 w1!591)) (currentByte!13057 w1!591) (currentBit!13052 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!272369 d!93202))

(declare-fun d!93204 () Bool)

(assert (=> d!93204 (= (remainingBits!0 ((_ sign_extend 32) (size!6597 (buf!7065 w3!25))) ((_ sign_extend 32) (currentByte!13057 w3!25)) ((_ sign_extend 32) (currentBit!13052 w3!25))) (bvsub (bvmul ((_ sign_extend 32) (size!6597 (buf!7065 w3!25))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!13057 w3!25)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13052 w3!25)))))))

(assert (=> d!93136 d!93204))

(assert (=> d!93136 d!93144))

(declare-fun d!93206 () Bool)

(assert (=> d!93206 (= (byteRangesEq!0 (select (arr!7584 (buf!7065 w2!587)) (_3!1019 lt!410326)) (select (arr!7584 (buf!7065 w3!25)) (_3!1019 lt!410326)) lt!410327 #b00000000000000000000000000001000) (or (= lt!410327 #b00000000000000000000000000001000) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7584 (buf!7065 w2!587)) (_3!1019 lt!410326))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!410327)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7584 (buf!7065 w3!25)) (_3!1019 lt!410326))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!410327)))) #b00000000000000000000000011111111))))))

(declare-fun bs!23489 () Bool)

(assert (= bs!23489 d!93206))

(assert (=> bs!23489 m!405145))

(declare-fun m!405165 () Bool)

(assert (=> bs!23489 m!405165))

(assert (=> b!272360 d!93206))

(declare-fun d!93208 () Bool)

(assert (=> d!93208 (= (byteRangesEq!0 (select (arr!7584 (buf!7065 w1!591)) (_3!1019 lt!410317)) (select (arr!7584 (buf!7065 w2!587)) (_3!1019 lt!410317)) lt!410318 #b00000000000000000000000000001000) (or (= lt!410318 #b00000000000000000000000000001000) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7584 (buf!7065 w1!591)) (_3!1019 lt!410317))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!410318)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7584 (buf!7065 w2!587)) (_3!1019 lt!410317))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!410318)))) #b00000000000000000000000011111111))))))

(declare-fun bs!23490 () Bool)

(assert (= bs!23490 d!93208))

(assert (=> bs!23490 m!405145))

(declare-fun m!405167 () Bool)

(assert (=> bs!23490 m!405167))

(assert (=> b!272351 d!93208))

(declare-fun d!93210 () Bool)

(declare-fun res!226862 () Bool)

(declare-fun e!192188 () Bool)

(assert (=> d!93210 (=> res!226862 e!192188)))

(assert (=> d!93210 (= res!226862 (= (_1!12222 lt!410329) (_2!12222 lt!410329)))))

(assert (=> d!93210 (= (arrayRangesEq!1129 (buf!7065 w1!591) (buf!7065 w3!25) (_1!12222 lt!410329) (_2!12222 lt!410329)) e!192188)))

(declare-fun b!272388 () Bool)

(declare-fun e!192189 () Bool)

(assert (=> b!272388 (= e!192188 e!192189)))

(declare-fun res!226863 () Bool)

(assert (=> b!272388 (=> (not res!226863) (not e!192189))))

(assert (=> b!272388 (= res!226863 (= (select (arr!7584 (buf!7065 w1!591)) (_1!12222 lt!410329)) (select (arr!7584 (buf!7065 w3!25)) (_1!12222 lt!410329))))))

(declare-fun b!272389 () Bool)

(assert (=> b!272389 (= e!192189 (arrayRangesEq!1129 (buf!7065 w1!591) (buf!7065 w3!25) (bvadd (_1!12222 lt!410329) #b00000000000000000000000000000001) (_2!12222 lt!410329)))))

(assert (= (and d!93210 (not res!226862)) b!272388))

(assert (= (and b!272388 res!226863) b!272389))

(declare-fun m!405169 () Bool)

(assert (=> b!272388 m!405169))

(declare-fun m!405171 () Bool)

(assert (=> b!272388 m!405171))

(declare-fun m!405173 () Bool)

(assert (=> b!272389 m!405173))

(assert (=> b!272373 d!93210))

(declare-fun d!93212 () Bool)

(declare-fun res!226864 () Bool)

(declare-fun e!192190 () Bool)

(assert (=> d!93212 (=> res!226864 e!192190)))

(assert (=> d!93212 (= res!226864 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!13057 w1!591)))))

(assert (=> d!93212 (= (arrayRangesEq!1129 (buf!7065 w1!591) (buf!7065 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!13057 w1!591)) e!192190)))

(declare-fun b!272390 () Bool)

(declare-fun e!192191 () Bool)

(assert (=> b!272390 (= e!192190 e!192191)))

(declare-fun res!226865 () Bool)

(assert (=> b!272390 (=> (not res!226865) (not e!192191))))

(assert (=> b!272390 (= res!226865 (= (select (arr!7584 (buf!7065 w1!591)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (select (arr!7584 (buf!7065 w3!25)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!272391 () Bool)

(assert (=> b!272391 (= e!192191 (arrayRangesEq!1129 (buf!7065 w1!591) (buf!7065 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!13057 w1!591)))))

(assert (= (and d!93212 (not res!226864)) b!272390))

(assert (= (and b!272390 res!226865) b!272391))

(declare-fun m!405175 () Bool)

(assert (=> b!272390 m!405175))

(declare-fun m!405177 () Bool)

(assert (=> b!272390 m!405177))

(declare-fun m!405179 () Bool)

(assert (=> b!272391 m!405179))

(assert (=> b!272375 d!93212))

(assert (=> d!93148 d!93080))

(declare-fun d!93214 () Bool)

(assert (=> d!93214 (= (remainingBits!0 ((_ sign_extend 32) (size!6597 (buf!7065 w1!591))) ((_ sign_extend 32) (currentByte!13057 w1!591)) ((_ sign_extend 32) (currentBit!13052 w1!591))) (bvsub (bvmul ((_ sign_extend 32) (size!6597 (buf!7065 w1!591))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!13057 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13052 w1!591)))))))

(assert (=> d!93142 d!93214))

(assert (=> d!93142 d!93150))

(declare-fun d!93216 () Bool)

(assert (=> d!93216 (= (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6597 (buf!7065 w2!587)) (currentByte!13057 w2!587) (currentBit!13052 w2!587))) (tuple4!479 ((_ extract 31 0) (bvadd (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!6597 (buf!7065 w2!587)) (currentByte!13057 w2!587) (currentBit!13052 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!6597 (buf!7065 w2!587)) (currentByte!13057 w2!587) (currentBit!13052 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!272362 d!93216))

(assert (=> b!272353 d!93202))

(push 1)

(assert (not b!272387))

(assert (not b!272389))

(assert (not b!272391))

(assert (not b!272385))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

