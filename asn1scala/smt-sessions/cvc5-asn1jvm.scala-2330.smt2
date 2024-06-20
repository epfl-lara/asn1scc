; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59546 () Bool)

(assert start!59546)

(declare-fun b!272088 () Bool)

(declare-fun e!191938 () Bool)

(declare-datatypes ((array!15170 0))(
  ( (array!15171 (arr!7582 (Array (_ BitVec 32) (_ BitVec 8))) (size!6595 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12004 0))(
  ( (BitStream!12005 (buf!7063 array!15170) (currentByte!13055 (_ BitVec 32)) (currentBit!13050 (_ BitVec 32))) )
))
(declare-fun w1!591 () BitStream!12004)

(declare-fun w3!25 () BitStream!12004)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!272088 (= e!191938 (byteRangesEq!0 (select (arr!7582 (buf!7063 w1!591)) (currentByte!13055 w1!591)) (select (arr!7582 (buf!7063 w3!25)) (currentByte!13055 w1!591)) #b00000000000000000000000000000000 (currentBit!13050 w1!591)))))

(declare-fun b!272089 () Bool)

(declare-fun e!191936 () Bool)

(declare-fun array_inv!6319 (array!15170) Bool)

(assert (=> b!272089 (= e!191936 (array_inv!6319 (buf!7063 w3!25)))))

(declare-fun b!272090 () Bool)

(declare-fun res!226632 () Bool)

(declare-fun e!191933 () Bool)

(assert (=> b!272090 (=> (not res!226632) (not e!191933))))

(declare-fun w2!587 () BitStream!12004)

(declare-fun isPrefixOf!0 (BitStream!12004 BitStream!12004) Bool)

(assert (=> b!272090 (= res!226632 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun res!226633 () Bool)

(assert (=> start!59546 (=> (not res!226633) (not e!191933))))

(assert (=> start!59546 (= res!226633 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!59546 e!191933))

(declare-fun e!191928 () Bool)

(declare-fun inv!12 (BitStream!12004) Bool)

(assert (=> start!59546 (and (inv!12 w1!591) e!191928)))

(declare-fun e!191929 () Bool)

(assert (=> start!59546 (and (inv!12 w2!587) e!191929)))

(assert (=> start!59546 (and (inv!12 w3!25) e!191936)))

(declare-fun b!272091 () Bool)

(assert (=> b!272091 (= e!191928 (array_inv!6319 (buf!7063 w1!591)))))

(declare-fun b!272092 () Bool)

(declare-fun e!191934 () Bool)

(assert (=> b!272092 (= e!191934 (byteRangesEq!0 (select (arr!7582 (buf!7063 w1!591)) (currentByte!13055 w1!591)) (select (arr!7582 (buf!7063 w3!25)) (currentByte!13055 w1!591)) #b00000000000000000000000000000000 (currentBit!13050 w1!591)))))

(declare-fun b!272093 () Bool)

(declare-fun e!191937 () Bool)

(assert (=> b!272093 (= e!191933 (not e!191937))))

(declare-fun res!226627 () Bool)

(assert (=> b!272093 (=> res!226627 e!191937)))

(declare-fun e!191935 () Bool)

(assert (=> b!272093 (= res!226627 e!191935)))

(declare-fun res!226628 () Bool)

(assert (=> b!272093 (=> (not res!226628) (not e!191935))))

(assert (=> b!272093 (= res!226628 (bvslt (currentByte!13055 w1!591) (size!6595 (buf!7063 w1!591))))))

(declare-datatypes ((Unit!19157 0))(
  ( (Unit!19158) )
))
(declare-fun lt!410159 () Unit!19157)

(declare-fun e!191926 () Unit!19157)

(assert (=> b!272093 (= lt!410159 e!191926)))

(declare-fun c!12525 () Bool)

(assert (=> b!272093 (= c!12525 (and (bvslt (currentByte!13055 w1!591) (size!6595 (buf!7063 w1!591))) (bvslt (currentByte!13055 w1!591) (currentByte!13055 w2!587))))))

(declare-fun e!191932 () Bool)

(assert (=> b!272093 e!191932))

(declare-fun res!226629 () Bool)

(assert (=> b!272093 (=> (not res!226629) (not e!191932))))

(declare-fun arrayRangesEq!1127 (array!15170 array!15170 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!272093 (= res!226629 (arrayRangesEq!1127 (buf!7063 w1!591) (buf!7063 w3!25) #b00000000000000000000000000000000 (currentByte!13055 w1!591)))))

(declare-fun lt!410157 () Unit!19157)

(declare-fun arrayRangesEqTransitive!390 (array!15170 array!15170 array!15170 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19157)

(assert (=> b!272093 (= lt!410157 (arrayRangesEqTransitive!390 (buf!7063 w1!591) (buf!7063 w2!587) (buf!7063 w3!25) #b00000000000000000000000000000000 (currentByte!13055 w1!591) (currentByte!13055 w2!587)))))

(declare-fun b!272094 () Bool)

(assert (=> b!272094 (= e!191937 (isPrefixOf!0 w1!591 w3!25))))

(declare-fun b!272095 () Bool)

(declare-fun Unit!19159 () Unit!19157)

(assert (=> b!272095 (= e!191926 Unit!19159)))

(declare-fun b!272096 () Bool)

(assert (=> b!272096 (= e!191932 e!191938)))

(declare-fun res!226631 () Bool)

(assert (=> b!272096 (=> res!226631 e!191938)))

(assert (=> b!272096 (= res!226631 (or (bvsge (currentByte!13055 w1!591) (size!6595 (buf!7063 w1!591))) (bvslt (currentByte!13055 w1!591) (currentByte!13055 w2!587))))))

(declare-fun b!272097 () Bool)

(assert (=> b!272097 (= e!191935 (not (byteRangesEq!0 (select (arr!7582 (buf!7063 w1!591)) (currentByte!13055 w1!591)) (select (arr!7582 (buf!7063 w3!25)) (currentByte!13055 w1!591)) #b00000000000000000000000000000000 (currentBit!13050 w1!591))))))

(declare-fun b!272098 () Bool)

(assert (=> b!272098 (= e!191929 (array_inv!6319 (buf!7063 w2!587)))))

(declare-fun b!272099 () Bool)

(declare-fun Unit!19160 () Unit!19157)

(assert (=> b!272099 (= e!191926 Unit!19160)))

(declare-fun lt!410158 () Unit!19157)

(declare-fun arrayRangesEqImpliesEq!178 (array!15170 array!15170 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19157)

(assert (=> b!272099 (= lt!410158 (arrayRangesEqImpliesEq!178 (buf!7063 w2!587) (buf!7063 w3!25) #b00000000000000000000000000000000 (currentByte!13055 w1!591) (currentByte!13055 w2!587)))))

(declare-fun res!226630 () Bool)

(assert (=> b!272099 (= res!226630 (= (select (arr!7582 (buf!7063 w2!587)) (currentByte!13055 w1!591)) (select (arr!7582 (buf!7063 w3!25)) (currentByte!13055 w1!591))))))

(assert (=> b!272099 (=> (not res!226630) (not e!191934))))

(assert (=> b!272099 e!191934))

(assert (= (and start!59546 res!226633) b!272090))

(assert (= (and b!272090 res!226632) b!272093))

(assert (= (and b!272093 res!226629) b!272096))

(assert (= (and b!272096 (not res!226631)) b!272088))

(assert (= (and b!272093 c!12525) b!272099))

(assert (= (and b!272093 (not c!12525)) b!272095))

(assert (= (and b!272099 res!226630) b!272092))

(assert (= (and b!272093 res!226628) b!272097))

(assert (= (and b!272093 (not res!226627)) b!272094))

(assert (= start!59546 b!272091))

(assert (= start!59546 b!272098))

(assert (= start!59546 b!272089))

(declare-fun m!404727 () Bool)

(assert (=> b!272092 m!404727))

(declare-fun m!404729 () Bool)

(assert (=> b!272092 m!404729))

(assert (=> b!272092 m!404727))

(assert (=> b!272092 m!404729))

(declare-fun m!404731 () Bool)

(assert (=> b!272092 m!404731))

(declare-fun m!404733 () Bool)

(assert (=> b!272090 m!404733))

(declare-fun m!404735 () Bool)

(assert (=> start!59546 m!404735))

(declare-fun m!404737 () Bool)

(assert (=> start!59546 m!404737))

(declare-fun m!404739 () Bool)

(assert (=> start!59546 m!404739))

(declare-fun m!404741 () Bool)

(assert (=> start!59546 m!404741))

(declare-fun m!404743 () Bool)

(assert (=> b!272099 m!404743))

(declare-fun m!404745 () Bool)

(assert (=> b!272099 m!404745))

(assert (=> b!272099 m!404729))

(assert (=> b!272097 m!404727))

(assert (=> b!272097 m!404729))

(assert (=> b!272097 m!404727))

(assert (=> b!272097 m!404729))

(assert (=> b!272097 m!404731))

(declare-fun m!404747 () Bool)

(assert (=> b!272089 m!404747))

(declare-fun m!404749 () Bool)

(assert (=> b!272098 m!404749))

(declare-fun m!404751 () Bool)

(assert (=> b!272091 m!404751))

(declare-fun m!404753 () Bool)

(assert (=> b!272093 m!404753))

(declare-fun m!404755 () Bool)

(assert (=> b!272093 m!404755))

(declare-fun m!404757 () Bool)

(assert (=> b!272094 m!404757))

(assert (=> b!272088 m!404727))

(assert (=> b!272088 m!404729))

(assert (=> b!272088 m!404727))

(assert (=> b!272088 m!404729))

(assert (=> b!272088 m!404731))

(push 1)

(assert (not b!272092))

(assert (not b!272097))

(assert (not start!59546))

(assert (not b!272088))

(assert (not b!272099))

(assert (not b!272090))

(assert (not b!272094))

(assert (not b!272093))

(assert (not b!272091))

(assert (not b!272089))

(assert (not b!272098))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!93018 () Bool)

(assert (=> d!93018 (= (array_inv!6319 (buf!7063 w1!591)) (bvsge (size!6595 (buf!7063 w1!591)) #b00000000000000000000000000000000))))

(assert (=> b!272091 d!93018))

(declare-fun d!93020 () Bool)

(declare-fun res!226694 () Bool)

(declare-fun e!192030 () Bool)

(assert (=> d!93020 (=> (not res!226694) (not e!192030))))

(assert (=> d!93020 (= res!226694 (= (size!6595 (buf!7063 w2!587)) (size!6595 (buf!7063 w3!25))))))

(assert (=> d!93020 (= (isPrefixOf!0 w2!587 w3!25) e!192030)))

(declare-fun b!272190 () Bool)

(declare-fun res!226695 () Bool)

(assert (=> b!272190 (=> (not res!226695) (not e!192030))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!272190 (= res!226695 (bvsle (bitIndex!0 (size!6595 (buf!7063 w2!587)) (currentByte!13055 w2!587) (currentBit!13050 w2!587)) (bitIndex!0 (size!6595 (buf!7063 w3!25)) (currentByte!13055 w3!25) (currentBit!13050 w3!25))))))

(declare-fun b!272191 () Bool)

(declare-fun e!192029 () Bool)

(assert (=> b!272191 (= e!192030 e!192029)))

(declare-fun res!226696 () Bool)

(assert (=> b!272191 (=> res!226696 e!192029)))

(assert (=> b!272191 (= res!226696 (= (size!6595 (buf!7063 w2!587)) #b00000000000000000000000000000000))))

(declare-fun b!272192 () Bool)

(declare-fun arrayBitRangesEq!0 (array!15170 array!15170 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!272192 (= e!192029 (arrayBitRangesEq!0 (buf!7063 w2!587) (buf!7063 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6595 (buf!7063 w2!587)) (currentByte!13055 w2!587) (currentBit!13050 w2!587))))))

(assert (= (and d!93020 res!226694) b!272190))

(assert (= (and b!272190 res!226695) b!272191))

(assert (= (and b!272191 (not res!226696)) b!272192))

(declare-fun m!404839 () Bool)

(assert (=> b!272190 m!404839))

(declare-fun m!404841 () Bool)

(assert (=> b!272190 m!404841))

(assert (=> b!272192 m!404839))

(assert (=> b!272192 m!404839))

(declare-fun m!404843 () Bool)

(assert (=> b!272192 m!404843))

(assert (=> b!272090 d!93020))

(declare-fun d!93030 () Bool)

(assert (=> d!93030 (= (array_inv!6319 (buf!7063 w3!25)) (bvsge (size!6595 (buf!7063 w3!25)) #b00000000000000000000000000000000))))

(assert (=> b!272089 d!93030))

(declare-fun d!93032 () Bool)

(declare-fun res!226701 () Bool)

(declare-fun e!192036 () Bool)

(assert (=> d!93032 (=> (not res!226701) (not e!192036))))

(assert (=> d!93032 (= res!226701 (= (size!6595 (buf!7063 w1!591)) (size!6595 (buf!7063 w3!25))))))

(assert (=> d!93032 (= (isPrefixOf!0 w1!591 w3!25) e!192036)))

(declare-fun b!272197 () Bool)

(declare-fun res!226702 () Bool)

(assert (=> b!272197 (=> (not res!226702) (not e!192036))))

(assert (=> b!272197 (= res!226702 (bvsle (bitIndex!0 (size!6595 (buf!7063 w1!591)) (currentByte!13055 w1!591) (currentBit!13050 w1!591)) (bitIndex!0 (size!6595 (buf!7063 w3!25)) (currentByte!13055 w3!25) (currentBit!13050 w3!25))))))

(declare-fun b!272198 () Bool)

(declare-fun e!192035 () Bool)

(assert (=> b!272198 (= e!192036 e!192035)))

(declare-fun res!226703 () Bool)

(assert (=> b!272198 (=> res!226703 e!192035)))

(assert (=> b!272198 (= res!226703 (= (size!6595 (buf!7063 w1!591)) #b00000000000000000000000000000000))))

(declare-fun b!272199 () Bool)

(assert (=> b!272199 (= e!192035 (arrayBitRangesEq!0 (buf!7063 w1!591) (buf!7063 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6595 (buf!7063 w1!591)) (currentByte!13055 w1!591) (currentBit!13050 w1!591))))))

(assert (= (and d!93032 res!226701) b!272197))

(assert (= (and b!272197 res!226702) b!272198))

(assert (= (and b!272198 (not res!226703)) b!272199))

(declare-fun m!404845 () Bool)

(assert (=> b!272197 m!404845))

(assert (=> b!272197 m!404841))

(assert (=> b!272199 m!404845))

(assert (=> b!272199 m!404845))

(declare-fun m!404847 () Bool)

(assert (=> b!272199 m!404847))

(assert (=> b!272094 d!93032))

(declare-fun d!93034 () Bool)

(assert (=> d!93034 (and (bvsge (currentByte!13055 w1!591) #b00000000000000000000000000000000) (bvslt (currentByte!13055 w1!591) (size!6595 (buf!7063 w2!587))) (bvslt (currentByte!13055 w1!591) (size!6595 (buf!7063 w3!25))) (= (select (arr!7582 (buf!7063 w2!587)) (currentByte!13055 w1!591)) (select (arr!7582 (buf!7063 w3!25)) (currentByte!13055 w1!591))))))

(declare-fun lt!410186 () Unit!19157)

(declare-fun choose!443 (array!15170 array!15170 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19157)

(assert (=> d!93034 (= lt!410186 (choose!443 (buf!7063 w2!587) (buf!7063 w3!25) #b00000000000000000000000000000000 (currentByte!13055 w1!591) (currentByte!13055 w2!587)))))

(assert (=> d!93034 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!13055 w2!587)))))

(assert (=> d!93034 (= (arrayRangesEqImpliesEq!178 (buf!7063 w2!587) (buf!7063 w3!25) #b00000000000000000000000000000000 (currentByte!13055 w1!591) (currentByte!13055 w2!587)) lt!410186)))

(declare-fun bs!23458 () Bool)

(assert (= bs!23458 d!93034))

(assert (=> bs!23458 m!404745))

(assert (=> bs!23458 m!404729))

(declare-fun m!404859 () Bool)

(assert (=> bs!23458 m!404859))

(assert (=> b!272099 d!93034))

(declare-fun d!93042 () Bool)

(assert (=> d!93042 (= (byteRangesEq!0 (select (arr!7582 (buf!7063 w1!591)) (currentByte!13055 w1!591)) (select (arr!7582 (buf!7063 w3!25)) (currentByte!13055 w1!591)) #b00000000000000000000000000000000 (currentBit!13050 w1!591)) (or (= #b00000000000000000000000000000000 (currentBit!13050 w1!591)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7582 (buf!7063 w1!591)) (currentByte!13055 w1!591))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!13050 w1!591)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7582 (buf!7063 w3!25)) (currentByte!13055 w1!591))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!13050 w1!591)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!23465 () Bool)

(assert (= bs!23465 d!93042))

(declare-fun m!404879 () Bool)

(assert (=> bs!23465 m!404879))

(declare-fun m!404881 () Bool)

(assert (=> bs!23465 m!404881))

(assert (=> b!272088 d!93042))

(declare-fun d!93056 () Bool)

(declare-fun res!226722 () Bool)

(declare-fun e!192051 () Bool)

(assert (=> d!93056 (=> res!226722 e!192051)))

(assert (=> d!93056 (= res!226722 (= #b00000000000000000000000000000000 (currentByte!13055 w1!591)))))

(assert (=> d!93056 (= (arrayRangesEq!1127 (buf!7063 w1!591) (buf!7063 w3!25) #b00000000000000000000000000000000 (currentByte!13055 w1!591)) e!192051)))

(declare-fun b!272218 () Bool)

(declare-fun e!192052 () Bool)

(assert (=> b!272218 (= e!192051 e!192052)))

(declare-fun res!226723 () Bool)

(assert (=> b!272218 (=> (not res!226723) (not e!192052))))

(assert (=> b!272218 (= res!226723 (= (select (arr!7582 (buf!7063 w1!591)) #b00000000000000000000000000000000) (select (arr!7582 (buf!7063 w3!25)) #b00000000000000000000000000000000)))))

(declare-fun b!272219 () Bool)

(assert (=> b!272219 (= e!192052 (arrayRangesEq!1127 (buf!7063 w1!591) (buf!7063 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!13055 w1!591)))))

(assert (= (and d!93056 (not res!226722)) b!272218))

(assert (= (and b!272218 res!226723) b!272219))

(declare-fun m!404883 () Bool)

(assert (=> b!272218 m!404883))

(declare-fun m!404885 () Bool)

(assert (=> b!272218 m!404885))

(declare-fun m!404887 () Bool)

(assert (=> b!272219 m!404887))

(assert (=> b!272093 d!93056))

(declare-fun d!93058 () Bool)

(assert (=> d!93058 (arrayRangesEq!1127 (buf!7063 w1!591) (buf!7063 w3!25) #b00000000000000000000000000000000 (currentByte!13055 w1!591))))

(declare-fun lt!410189 () Unit!19157)

(declare-fun choose!444 (array!15170 array!15170 array!15170 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19157)

(assert (=> d!93058 (= lt!410189 (choose!444 (buf!7063 w1!591) (buf!7063 w2!587) (buf!7063 w3!25) #b00000000000000000000000000000000 (currentByte!13055 w1!591) (currentByte!13055 w2!587)))))

(assert (=> d!93058 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!13055 w1!591)) (bvsle (currentByte!13055 w1!591) (currentByte!13055 w2!587)))))

(assert (=> d!93058 (= (arrayRangesEqTransitive!390 (buf!7063 w1!591) (buf!7063 w2!587) (buf!7063 w3!25) #b00000000000000000000000000000000 (currentByte!13055 w1!591) (currentByte!13055 w2!587)) lt!410189)))

(declare-fun bs!23466 () Bool)

(assert (= bs!23466 d!93058))

(assert (=> bs!23466 m!404753))

(declare-fun m!404889 () Bool)

(assert (=> bs!23466 m!404889))

(assert (=> b!272093 d!93058))

(declare-fun d!93060 () Bool)

(assert (=> d!93060 (= (array_inv!6319 (buf!7063 w2!587)) (bvsge (size!6595 (buf!7063 w2!587)) #b00000000000000000000000000000000))))

(assert (=> b!272098 d!93060))

(declare-fun d!93062 () Bool)

(declare-fun res!226724 () Bool)

(declare-fun e!192054 () Bool)

(assert (=> d!93062 (=> (not res!226724) (not e!192054))))

(assert (=> d!93062 (= res!226724 (= (size!6595 (buf!7063 w1!591)) (size!6595 (buf!7063 w2!587))))))

(assert (=> d!93062 (= (isPrefixOf!0 w1!591 w2!587) e!192054)))

(declare-fun b!272220 () Bool)

(declare-fun res!226725 () Bool)

(assert (=> b!272220 (=> (not res!226725) (not e!192054))))

(assert (=> b!272220 (= res!226725 (bvsle (bitIndex!0 (size!6595 (buf!7063 w1!591)) (currentByte!13055 w1!591) (currentBit!13050 w1!591)) (bitIndex!0 (size!6595 (buf!7063 w2!587)) (currentByte!13055 w2!587) (currentBit!13050 w2!587))))))

(declare-fun b!272221 () Bool)

(declare-fun e!192053 () Bool)

(assert (=> b!272221 (= e!192054 e!192053)))

(declare-fun res!226726 () Bool)

(assert (=> b!272221 (=> res!226726 e!192053)))

(assert (=> b!272221 (= res!226726 (= (size!6595 (buf!7063 w1!591)) #b00000000000000000000000000000000))))

(declare-fun b!272222 () Bool)

(assert (=> b!272222 (= e!192053 (arrayBitRangesEq!0 (buf!7063 w1!591) (buf!7063 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6595 (buf!7063 w1!591)) (currentByte!13055 w1!591) (currentBit!13050 w1!591))))))

(assert (= (and d!93062 res!226724) b!272220))

(assert (= (and b!272220 res!226725) b!272221))

(assert (= (and b!272221 (not res!226726)) b!272222))

(assert (=> b!272220 m!404845))

(assert (=> b!272220 m!404839))

(assert (=> b!272222 m!404845))

(assert (=> b!272222 m!404845))

(declare-fun m!404891 () Bool)

(assert (=> b!272222 m!404891))

(assert (=> start!59546 d!93062))

(declare-fun d!93064 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!93064 (= (inv!12 w1!591) (invariant!0 (currentBit!13050 w1!591) (currentByte!13055 w1!591) (size!6595 (buf!7063 w1!591))))))

(declare-fun bs!23467 () Bool)

(assert (= bs!23467 d!93064))

(declare-fun m!404893 () Bool)

(assert (=> bs!23467 m!404893))

(assert (=> start!59546 d!93064))

(declare-fun d!93066 () Bool)

(assert (=> d!93066 (= (inv!12 w2!587) (invariant!0 (currentBit!13050 w2!587) (currentByte!13055 w2!587) (size!6595 (buf!7063 w2!587))))))

(declare-fun bs!23468 () Bool)

(assert (= bs!23468 d!93066))

(declare-fun m!404895 () Bool)

(assert (=> bs!23468 m!404895))

(assert (=> start!59546 d!93066))

(declare-fun d!93068 () Bool)

(assert (=> d!93068 (= (inv!12 w3!25) (invariant!0 (currentBit!13050 w3!25) (currentByte!13055 w3!25) (size!6595 (buf!7063 w3!25))))))

(declare-fun bs!23469 () Bool)

(assert (= bs!23469 d!93068))

(declare-fun m!404897 () Bool)

(assert (=> bs!23469 m!404897))

(assert (=> start!59546 d!93068))

(assert (=> b!272092 d!93042))

(assert (=> b!272097 d!93042))

(push 1)

(assert (not b!272219))

(assert (not d!93064))

(assert (not d!93066))

(assert (not d!93068))

(assert (not b!272190))

(assert (not b!272222))

(assert (not d!93058))

(assert (not b!272197))

(assert (not b!272192))

(assert (not b!272220))

(assert (not b!272199))

(assert (not d!93034))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!93110 () Bool)

(assert (=> d!93110 (= (invariant!0 (currentBit!13050 w3!25) (currentByte!13055 w3!25) (size!6595 (buf!7063 w3!25))) (and (bvsge (currentBit!13050 w3!25) #b00000000000000000000000000000000) (bvslt (currentBit!13050 w3!25) #b00000000000000000000000000001000) (bvsge (currentByte!13055 w3!25) #b00000000000000000000000000000000) (or (bvslt (currentByte!13055 w3!25) (size!6595 (buf!7063 w3!25))) (and (= (currentBit!13050 w3!25) #b00000000000000000000000000000000) (= (currentByte!13055 w3!25) (size!6595 (buf!7063 w3!25)))))))))

(assert (=> d!93068 d!93110))

(declare-fun d!93112 () Bool)

(assert (=> d!93112 (= (select (arr!7582 (buf!7063 w2!587)) (currentByte!13055 w1!591)) (select (arr!7582 (buf!7063 w3!25)) (currentByte!13055 w1!591)))))

(assert (=> d!93112 true))

(declare-fun _$12!114 () Unit!19157)

(assert (=> d!93112 (= (choose!443 (buf!7063 w2!587) (buf!7063 w3!25) #b00000000000000000000000000000000 (currentByte!13055 w1!591) (currentByte!13055 w2!587)) _$12!114)))

(declare-fun bs!23475 () Bool)

(assert (= bs!23475 d!93112))

(assert (=> bs!23475 m!404745))

(assert (=> bs!23475 m!404729))

(assert (=> d!93034 d!93112))

(declare-fun b!272296 () Bool)

(declare-fun e!192116 () Bool)

(declare-fun e!192117 () Bool)

(assert (=> b!272296 (= e!192116 e!192117)))

(declare-fun res!226788 () Bool)

(assert (=> b!272296 (=> (not res!226788) (not e!192117))))

(declare-fun e!192118 () Bool)

(assert (=> b!272296 (= res!226788 e!192118)))

(declare-fun res!226789 () Bool)

(assert (=> b!272296 (=> res!226789 e!192118)))

(declare-datatypes ((tuple4!476 0))(
  ( (tuple4!477 (_1!12221 (_ BitVec 32)) (_2!12221 (_ BitVec 32)) (_3!1018 (_ BitVec 32)) (_4!238 (_ BitVec 32))) )
))
(declare-fun lt!410249 () tuple4!476)

(assert (=> b!272296 (= res!226789 (bvsge (_1!12221 lt!410249) (_2!12221 lt!410249)))))

(declare-fun lt!410248 () (_ BitVec 32))

(assert (=> b!272296 (= lt!410248 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6595 (buf!7063 w1!591)) (currentByte!13055 w1!591) (currentBit!13050 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!410247 () (_ BitVec 32))

(assert (=> b!272296 (= lt!410247 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!476)

(assert (=> b!272296 (= lt!410249 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6595 (buf!7063 w1!591)) (currentByte!13055 w1!591) (currentBit!13050 w1!591))))))

(declare-fun b!272297 () Bool)

(declare-fun e!192115 () Bool)

(assert (=> b!272297 (= e!192117 e!192115)))

(declare-fun c!12539 () Bool)

(assert (=> b!272297 (= c!12539 (= (_3!1018 lt!410249) (_4!238 lt!410249)))))

(declare-fun b!272299 () Bool)

(declare-fun res!226786 () Bool)

(assert (=> b!272299 (= res!226786 (= lt!410248 #b00000000000000000000000000000000))))

(declare-fun e!192119 () Bool)

(assert (=> b!272299 (=> res!226786 e!192119)))

(declare-fun e!192114 () Bool)

(assert (=> b!272299 (= e!192114 e!192119)))

(declare-fun b!272300 () Bool)

(declare-fun call!4363 () Bool)

(assert (=> b!272300 (= e!192119 call!4363)))

(declare-fun b!272301 () Bool)

(assert (=> b!272301 (= e!192115 e!192114)))

(declare-fun res!226790 () Bool)

(assert (=> b!272301 (= res!226790 (byteRangesEq!0 (select (arr!7582 (buf!7063 w1!591)) (_3!1018 lt!410249)) (select (arr!7582 (buf!7063 w2!587)) (_3!1018 lt!410249)) lt!410247 #b00000000000000000000000000001000))))

(assert (=> b!272301 (=> (not res!226790) (not e!192114))))

(declare-fun d!93114 () Bool)

(declare-fun res!226787 () Bool)

(assert (=> d!93114 (=> res!226787 e!192116)))

(assert (=> d!93114 (= res!226787 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6595 (buf!7063 w1!591)) (currentByte!13055 w1!591) (currentBit!13050 w1!591))))))

(assert (=> d!93114 (= (arrayBitRangesEq!0 (buf!7063 w1!591) (buf!7063 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6595 (buf!7063 w1!591)) (currentByte!13055 w1!591) (currentBit!13050 w1!591))) e!192116)))

(declare-fun b!272298 () Bool)

(assert (=> b!272298 (= e!192118 (arrayRangesEq!1127 (buf!7063 w1!591) (buf!7063 w2!587) (_1!12221 lt!410249) (_2!12221 lt!410249)))))

(declare-fun b!272302 () Bool)

(assert (=> b!272302 (= e!192115 call!4363)))

(declare-fun bm!4360 () Bool)

(assert (=> bm!4360 (= call!4363 (byteRangesEq!0 (ite c!12539 (select (arr!7582 (buf!7063 w1!591)) (_3!1018 lt!410249)) (select (arr!7582 (buf!7063 w1!591)) (_4!238 lt!410249))) (ite c!12539 (select (arr!7582 (buf!7063 w2!587)) (_3!1018 lt!410249)) (select (arr!7582 (buf!7063 w2!587)) (_4!238 lt!410249))) (ite c!12539 lt!410247 #b00000000000000000000000000000000) lt!410248))))

(assert (= (and d!93114 (not res!226787)) b!272296))

(assert (= (and b!272296 (not res!226789)) b!272298))

(assert (= (and b!272296 res!226788) b!272297))

(assert (= (and b!272297 c!12539) b!272302))

(assert (= (and b!272297 (not c!12539)) b!272301))

(assert (= (and b!272301 res!226790) b!272299))

(assert (= (and b!272299 (not res!226786)) b!272300))

(assert (= (or b!272302 b!272300) bm!4360))

(assert (=> b!272296 m!404845))

(declare-fun m!404977 () Bool)

(assert (=> b!272296 m!404977))

(declare-fun m!404979 () Bool)

(assert (=> b!272301 m!404979))

(declare-fun m!404981 () Bool)

(assert (=> b!272301 m!404981))

(assert (=> b!272301 m!404979))

(assert (=> b!272301 m!404981))

(declare-fun m!404983 () Bool)

(assert (=> b!272301 m!404983))

(declare-fun m!404985 () Bool)

(assert (=> b!272298 m!404985))

(declare-fun m!404987 () Bool)

(assert (=> bm!4360 m!404987))

(declare-fun m!404989 () Bool)

(assert (=> bm!4360 m!404989))

(assert (=> bm!4360 m!404979))

(assert (=> bm!4360 m!404981))

(declare-fun m!404991 () Bool)

(assert (=> bm!4360 m!404991))

(assert (=> b!272222 d!93114))

(declare-fun d!93116 () Bool)

(declare-fun e!192122 () Bool)

(assert (=> d!93116 e!192122))

(declare-fun res!226796 () Bool)

(assert (=> d!93116 (=> (not res!226796) (not e!192122))))

(declare-fun lt!410267 () (_ BitVec 64))

(declare-fun lt!410265 () (_ BitVec 64))

(declare-fun lt!410264 () (_ BitVec 64))

(assert (=> d!93116 (= res!226796 (= lt!410264 (bvsub lt!410267 lt!410265)))))

(assert (=> d!93116 (or (= (bvand lt!410267 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!410265 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!410267 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!410267 lt!410265) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!93116 (= lt!410265 (remainingBits!0 ((_ sign_extend 32) (size!6595 (buf!7063 w1!591))) ((_ sign_extend 32) (currentByte!13055 w1!591)) ((_ sign_extend 32) (currentBit!13050 w1!591))))))

(declare-fun lt!410266 () (_ BitVec 64))

(declare-fun lt!410263 () (_ BitVec 64))

(assert (=> d!93116 (= lt!410267 (bvmul lt!410266 lt!410263))))

(assert (=> d!93116 (or (= lt!410266 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!410263 (bvsdiv (bvmul lt!410266 lt!410263) lt!410266)))))

(assert (=> d!93116 (= lt!410263 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!93116 (= lt!410266 ((_ sign_extend 32) (size!6595 (buf!7063 w1!591))))))

(assert (=> d!93116 (= lt!410264 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13055 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13050 w1!591))))))

(assert (=> d!93116 (invariant!0 (currentBit!13050 w1!591) (currentByte!13055 w1!591) (size!6595 (buf!7063 w1!591)))))

(assert (=> d!93116 (= (bitIndex!0 (size!6595 (buf!7063 w1!591)) (currentByte!13055 w1!591) (currentBit!13050 w1!591)) lt!410264)))

(declare-fun b!272307 () Bool)

(declare-fun res!226795 () Bool)

(assert (=> b!272307 (=> (not res!226795) (not e!192122))))

(assert (=> b!272307 (= res!226795 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!410264))))

(declare-fun b!272308 () Bool)

(declare-fun lt!410262 () (_ BitVec 64))

(assert (=> b!272308 (= e!192122 (bvsle lt!410264 (bvmul lt!410262 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!272308 (or (= lt!410262 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!410262 #b0000000000000000000000000000000000000000000000000000000000001000) lt!410262)))))

(assert (=> b!272308 (= lt!410262 ((_ sign_extend 32) (size!6595 (buf!7063 w1!591))))))

(assert (= (and d!93116 res!226796) b!272307))

(assert (= (and b!272307 res!226795) b!272308))

(declare-fun m!404993 () Bool)

(assert (=> d!93116 m!404993))

(assert (=> d!93116 m!404893))

(assert (=> b!272222 d!93116))

(declare-fun d!93118 () Bool)

(declare-fun e!192123 () Bool)

(assert (=> d!93118 e!192123))

(declare-fun res!226798 () Bool)

(assert (=> d!93118 (=> (not res!226798) (not e!192123))))

(declare-fun lt!410270 () (_ BitVec 64))

(declare-fun lt!410271 () (_ BitVec 64))

(declare-fun lt!410273 () (_ BitVec 64))

(assert (=> d!93118 (= res!226798 (= lt!410270 (bvsub lt!410273 lt!410271)))))

(assert (=> d!93118 (or (= (bvand lt!410273 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!410271 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!410273 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!410273 lt!410271) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!93118 (= lt!410271 (remainingBits!0 ((_ sign_extend 32) (size!6595 (buf!7063 w2!587))) ((_ sign_extend 32) (currentByte!13055 w2!587)) ((_ sign_extend 32) (currentBit!13050 w2!587))))))

(declare-fun lt!410272 () (_ BitVec 64))

(declare-fun lt!410269 () (_ BitVec 64))

(assert (=> d!93118 (= lt!410273 (bvmul lt!410272 lt!410269))))

(assert (=> d!93118 (or (= lt!410272 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!410269 (bvsdiv (bvmul lt!410272 lt!410269) lt!410272)))))

(assert (=> d!93118 (= lt!410269 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!93118 (= lt!410272 ((_ sign_extend 32) (size!6595 (buf!7063 w2!587))))))

(assert (=> d!93118 (= lt!410270 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13055 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13050 w2!587))))))

(assert (=> d!93118 (invariant!0 (currentBit!13050 w2!587) (currentByte!13055 w2!587) (size!6595 (buf!7063 w2!587)))))

(assert (=> d!93118 (= (bitIndex!0 (size!6595 (buf!7063 w2!587)) (currentByte!13055 w2!587) (currentBit!13050 w2!587)) lt!410270)))

(declare-fun b!272309 () Bool)

(declare-fun res!226797 () Bool)

(assert (=> b!272309 (=> (not res!226797) (not e!192123))))

(assert (=> b!272309 (= res!226797 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!410270))))

(declare-fun b!272310 () Bool)

(declare-fun lt!410268 () (_ BitVec 64))

(assert (=> b!272310 (= e!192123 (bvsle lt!410270 (bvmul lt!410268 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!272310 (or (= lt!410268 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!410268 #b0000000000000000000000000000000000000000000000000000000000001000) lt!410268)))))

(assert (=> b!272310 (= lt!410268 ((_ sign_extend 32) (size!6595 (buf!7063 w2!587))))))

(assert (= (and d!93118 res!226798) b!272309))

(assert (= (and b!272309 res!226797) b!272310))

(declare-fun m!404995 () Bool)

(assert (=> d!93118 m!404995))

(assert (=> d!93118 m!404895))

(assert (=> b!272190 d!93118))

(declare-fun d!93120 () Bool)

(declare-fun e!192124 () Bool)

(assert (=> d!93120 e!192124))

(declare-fun res!226800 () Bool)

(assert (=> d!93120 (=> (not res!226800) (not e!192124))))

(declare-fun lt!410276 () (_ BitVec 64))

(declare-fun lt!410277 () (_ BitVec 64))

(declare-fun lt!410279 () (_ BitVec 64))

(assert (=> d!93120 (= res!226800 (= lt!410276 (bvsub lt!410279 lt!410277)))))

(assert (=> d!93120 (or (= (bvand lt!410279 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!410277 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!410279 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!410279 lt!410277) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!93120 (= lt!410277 (remainingBits!0 ((_ sign_extend 32) (size!6595 (buf!7063 w3!25))) ((_ sign_extend 32) (currentByte!13055 w3!25)) ((_ sign_extend 32) (currentBit!13050 w3!25))))))

(declare-fun lt!410278 () (_ BitVec 64))

(declare-fun lt!410275 () (_ BitVec 64))

(assert (=> d!93120 (= lt!410279 (bvmul lt!410278 lt!410275))))

(assert (=> d!93120 (or (= lt!410278 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!410275 (bvsdiv (bvmul lt!410278 lt!410275) lt!410278)))))

(assert (=> d!93120 (= lt!410275 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!93120 (= lt!410278 ((_ sign_extend 32) (size!6595 (buf!7063 w3!25))))))

(assert (=> d!93120 (= lt!410276 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13055 w3!25)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13050 w3!25))))))

(assert (=> d!93120 (invariant!0 (currentBit!13050 w3!25) (currentByte!13055 w3!25) (size!6595 (buf!7063 w3!25)))))

(assert (=> d!93120 (= (bitIndex!0 (size!6595 (buf!7063 w3!25)) (currentByte!13055 w3!25) (currentBit!13050 w3!25)) lt!410276)))

(declare-fun b!272311 () Bool)

(declare-fun res!226799 () Bool)

(assert (=> b!272311 (=> (not res!226799) (not e!192124))))

(assert (=> b!272311 (= res!226799 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!410276))))

(declare-fun b!272312 () Bool)

(declare-fun lt!410274 () (_ BitVec 64))

(assert (=> b!272312 (= e!192124 (bvsle lt!410276 (bvmul lt!410274 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!272312 (or (= lt!410274 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!410274 #b0000000000000000000000000000000000000000000000000000000000001000) lt!410274)))))

(assert (=> b!272312 (= lt!410274 ((_ sign_extend 32) (size!6595 (buf!7063 w3!25))))))

(assert (= (and d!93120 res!226800) b!272311))

(assert (= (and b!272311 res!226799) b!272312))

(declare-fun m!404997 () Bool)

(assert (=> d!93120 m!404997))

(assert (=> d!93120 m!404897))

(assert (=> b!272190 d!93120))

(assert (=> b!272220 d!93116))

(assert (=> b!272220 d!93118))

(assert (=> d!93058 d!93056))

(declare-fun d!93122 () Bool)

(assert (=> d!93122 (arrayRangesEq!1127 (buf!7063 w1!591) (buf!7063 w3!25) #b00000000000000000000000000000000 (currentByte!13055 w1!591))))

(assert (=> d!93122 true))

(declare-fun _$16!164 () Unit!19157)

(assert (=> d!93122 (= (choose!444 (buf!7063 w1!591) (buf!7063 w2!587) (buf!7063 w3!25) #b00000000000000000000000000000000 (currentByte!13055 w1!591) (currentByte!13055 w2!587)) _$16!164)))

(declare-fun bs!23476 () Bool)

(assert (= bs!23476 d!93122))

(assert (=> bs!23476 m!404753))

(assert (=> d!93058 d!93122))

(declare-fun b!272313 () Bool)

(declare-fun e!192127 () Bool)

(declare-fun e!192128 () Bool)

(assert (=> b!272313 (= e!192127 e!192128)))

(declare-fun res!226803 () Bool)

(assert (=> b!272313 (=> (not res!226803) (not e!192128))))

(declare-fun e!192129 () Bool)

(assert (=> b!272313 (= res!226803 e!192129)))

(declare-fun res!226804 () Bool)

(assert (=> b!272313 (=> res!226804 e!192129)))

(declare-fun lt!410282 () tuple4!476)

(assert (=> b!272313 (= res!226804 (bvsge (_1!12221 lt!410282) (_2!12221 lt!410282)))))

(declare-fun lt!410281 () (_ BitVec 32))

(assert (=> b!272313 (= lt!410281 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6595 (buf!7063 w2!587)) (currentByte!13055 w2!587) (currentBit!13050 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!410280 () (_ BitVec 32))

(assert (=> b!272313 (= lt!410280 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!272313 (= lt!410282 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6595 (buf!7063 w2!587)) (currentByte!13055 w2!587) (currentBit!13050 w2!587))))))

(declare-fun b!272314 () Bool)

(declare-fun e!192126 () Bool)

(assert (=> b!272314 (= e!192128 e!192126)))

(declare-fun c!12540 () Bool)

(assert (=> b!272314 (= c!12540 (= (_3!1018 lt!410282) (_4!238 lt!410282)))))

(declare-fun b!272316 () Bool)

(declare-fun res!226801 () Bool)

(assert (=> b!272316 (= res!226801 (= lt!410281 #b00000000000000000000000000000000))))

(declare-fun e!192130 () Bool)

(assert (=> b!272316 (=> res!226801 e!192130)))

(declare-fun e!192125 () Bool)

(assert (=> b!272316 (= e!192125 e!192130)))

(declare-fun b!272317 () Bool)

(declare-fun call!4364 () Bool)

(assert (=> b!272317 (= e!192130 call!4364)))

(declare-fun b!272318 () Bool)

(assert (=> b!272318 (= e!192126 e!192125)))

(declare-fun res!226805 () Bool)

(assert (=> b!272318 (= res!226805 (byteRangesEq!0 (select (arr!7582 (buf!7063 w2!587)) (_3!1018 lt!410282)) (select (arr!7582 (buf!7063 w3!25)) (_3!1018 lt!410282)) lt!410280 #b00000000000000000000000000001000))))

(assert (=> b!272318 (=> (not res!226805) (not e!192125))))

(declare-fun d!93124 () Bool)

(declare-fun res!226802 () Bool)

(assert (=> d!93124 (=> res!226802 e!192127)))

(assert (=> d!93124 (= res!226802 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6595 (buf!7063 w2!587)) (currentByte!13055 w2!587) (currentBit!13050 w2!587))))))

(assert (=> d!93124 (= (arrayBitRangesEq!0 (buf!7063 w2!587) (buf!7063 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6595 (buf!7063 w2!587)) (currentByte!13055 w2!587) (currentBit!13050 w2!587))) e!192127)))

(declare-fun b!272315 () Bool)

(assert (=> b!272315 (= e!192129 (arrayRangesEq!1127 (buf!7063 w2!587) (buf!7063 w3!25) (_1!12221 lt!410282) (_2!12221 lt!410282)))))

(declare-fun b!272319 () Bool)

(assert (=> b!272319 (= e!192126 call!4364)))

(declare-fun bm!4361 () Bool)

(assert (=> bm!4361 (= call!4364 (byteRangesEq!0 (ite c!12540 (select (arr!7582 (buf!7063 w2!587)) (_3!1018 lt!410282)) (select (arr!7582 (buf!7063 w2!587)) (_4!238 lt!410282))) (ite c!12540 (select (arr!7582 (buf!7063 w3!25)) (_3!1018 lt!410282)) (select (arr!7582 (buf!7063 w3!25)) (_4!238 lt!410282))) (ite c!12540 lt!410280 #b00000000000000000000000000000000) lt!410281))))

(assert (= (and d!93124 (not res!226802)) b!272313))

(assert (= (and b!272313 (not res!226804)) b!272315))

(assert (= (and b!272313 res!226803) b!272314))

(assert (= (and b!272314 c!12540) b!272319))

(assert (= (and b!272314 (not c!12540)) b!272318))

(assert (= (and b!272318 res!226805) b!272316))

(assert (= (and b!272316 (not res!226801)) b!272317))

(assert (= (or b!272319 b!272317) bm!4361))

(assert (=> b!272313 m!404839))

(declare-fun m!404999 () Bool)

(assert (=> b!272313 m!404999))

(declare-fun m!405001 () Bool)

(assert (=> b!272318 m!405001))

(declare-fun m!405003 () Bool)

(assert (=> b!272318 m!405003))

(assert (=> b!272318 m!405001))

(assert (=> b!272318 m!405003))

(declare-fun m!405005 () Bool)

(assert (=> b!272318 m!405005))

(declare-fun m!405007 () Bool)

(assert (=> b!272315 m!405007))

(declare-fun m!405009 () Bool)

(assert (=> bm!4361 m!405009))

(declare-fun m!405011 () Bool)

(assert (=> bm!4361 m!405011))

(assert (=> bm!4361 m!405001))

(assert (=> bm!4361 m!405003))

(declare-fun m!405013 () Bool)

(assert (=> bm!4361 m!405013))

(assert (=> b!272192 d!93124))

(assert (=> b!272192 d!93118))

(declare-fun d!93126 () Bool)

(assert (=> d!93126 (= (invariant!0 (currentBit!13050 w2!587) (currentByte!13055 w2!587) (size!6595 (buf!7063 w2!587))) (and (bvsge (currentBit!13050 w2!587) #b00000000000000000000000000000000) (bvslt (currentBit!13050 w2!587) #b00000000000000000000000000001000) (bvsge (currentByte!13055 w2!587) #b00000000000000000000000000000000) (or (bvslt (currentByte!13055 w2!587) (size!6595 (buf!7063 w2!587))) (and (= (currentBit!13050 w2!587) #b00000000000000000000000000000000) (= (currentByte!13055 w2!587) (size!6595 (buf!7063 w2!587)))))))))

(assert (=> d!93066 d!93126))

(declare-fun d!93128 () Bool)

(declare-fun res!226806 () Bool)

(declare-fun e!192131 () Bool)

(assert (=> d!93128 (=> res!226806 e!192131)))

(assert (=> d!93128 (= res!226806 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!13055 w1!591)))))

(assert (=> d!93128 (= (arrayRangesEq!1127 (buf!7063 w1!591) (buf!7063 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!13055 w1!591)) e!192131)))

(declare-fun b!272320 () Bool)

(declare-fun e!192132 () Bool)

(assert (=> b!272320 (= e!192131 e!192132)))

(declare-fun res!226807 () Bool)

(assert (=> b!272320 (=> (not res!226807) (not e!192132))))

(assert (=> b!272320 (= res!226807 (= (select (arr!7582 (buf!7063 w1!591)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!7582 (buf!7063 w3!25)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!272321 () Bool)

(assert (=> b!272321 (= e!192132 (arrayRangesEq!1127 (buf!7063 w1!591) (buf!7063 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!13055 w1!591)))))

(assert (= (and d!93128 (not res!226806)) b!272320))

(assert (= (and b!272320 res!226807) b!272321))

(declare-fun m!405015 () Bool)

(assert (=> b!272320 m!405015))

(declare-fun m!405017 () Bool)

(assert (=> b!272320 m!405017))

(declare-fun m!405019 () Bool)

(assert (=> b!272321 m!405019))

(assert (=> b!272219 d!93128))

(declare-fun b!272322 () Bool)

(declare-fun e!192135 () Bool)

(declare-fun e!192136 () Bool)

(assert (=> b!272322 (= e!192135 e!192136)))

(declare-fun res!226810 () Bool)

(assert (=> b!272322 (=> (not res!226810) (not e!192136))))

(declare-fun e!192137 () Bool)

(assert (=> b!272322 (= res!226810 e!192137)))

(declare-fun res!226811 () Bool)

(assert (=> b!272322 (=> res!226811 e!192137)))

(declare-fun lt!410285 () tuple4!476)

(assert (=> b!272322 (= res!226811 (bvsge (_1!12221 lt!410285) (_2!12221 lt!410285)))))

(declare-fun lt!410284 () (_ BitVec 32))

(assert (=> b!272322 (= lt!410284 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6595 (buf!7063 w1!591)) (currentByte!13055 w1!591) (currentBit!13050 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!410283 () (_ BitVec 32))

(assert (=> b!272322 (= lt!410283 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!272322 (= lt!410285 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6595 (buf!7063 w1!591)) (currentByte!13055 w1!591) (currentBit!13050 w1!591))))))

(declare-fun b!272323 () Bool)

(declare-fun e!192134 () Bool)

(assert (=> b!272323 (= e!192136 e!192134)))

(declare-fun c!12541 () Bool)

(assert (=> b!272323 (= c!12541 (= (_3!1018 lt!410285) (_4!238 lt!410285)))))

(declare-fun b!272325 () Bool)

(declare-fun res!226808 () Bool)

(assert (=> b!272325 (= res!226808 (= lt!410284 #b00000000000000000000000000000000))))

(declare-fun e!192138 () Bool)

(assert (=> b!272325 (=> res!226808 e!192138)))

(declare-fun e!192133 () Bool)

(assert (=> b!272325 (= e!192133 e!192138)))

(declare-fun b!272326 () Bool)

(declare-fun call!4365 () Bool)

(assert (=> b!272326 (= e!192138 call!4365)))

(declare-fun b!272327 () Bool)

(assert (=> b!272327 (= e!192134 e!192133)))

(declare-fun res!226812 () Bool)

(assert (=> b!272327 (= res!226812 (byteRangesEq!0 (select (arr!7582 (buf!7063 w1!591)) (_3!1018 lt!410285)) (select (arr!7582 (buf!7063 w3!25)) (_3!1018 lt!410285)) lt!410283 #b00000000000000000000000000001000))))

(assert (=> b!272327 (=> (not res!226812) (not e!192133))))

(declare-fun d!93130 () Bool)

(declare-fun res!226809 () Bool)

(assert (=> d!93130 (=> res!226809 e!192135)))

(assert (=> d!93130 (= res!226809 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6595 (buf!7063 w1!591)) (currentByte!13055 w1!591) (currentBit!13050 w1!591))))))

(assert (=> d!93130 (= (arrayBitRangesEq!0 (buf!7063 w1!591) (buf!7063 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6595 (buf!7063 w1!591)) (currentByte!13055 w1!591) (currentBit!13050 w1!591))) e!192135)))

(declare-fun b!272324 () Bool)

(assert (=> b!272324 (= e!192137 (arrayRangesEq!1127 (buf!7063 w1!591) (buf!7063 w3!25) (_1!12221 lt!410285) (_2!12221 lt!410285)))))

(declare-fun b!272328 () Bool)

(assert (=> b!272328 (= e!192134 call!4365)))

(declare-fun bm!4362 () Bool)

(assert (=> bm!4362 (= call!4365 (byteRangesEq!0 (ite c!12541 (select (arr!7582 (buf!7063 w1!591)) (_3!1018 lt!410285)) (select (arr!7582 (buf!7063 w1!591)) (_4!238 lt!410285))) (ite c!12541 (select (arr!7582 (buf!7063 w3!25)) (_3!1018 lt!410285)) (select (arr!7582 (buf!7063 w3!25)) (_4!238 lt!410285))) (ite c!12541 lt!410283 #b00000000000000000000000000000000) lt!410284))))

(assert (= (and d!93130 (not res!226809)) b!272322))

(assert (= (and b!272322 (not res!226811)) b!272324))

(assert (= (and b!272322 res!226810) b!272323))

(assert (= (and b!272323 c!12541) b!272328))

(assert (= (and b!272323 (not c!12541)) b!272327))

(assert (= (and b!272327 res!226812) b!272325))

(assert (= (and b!272325 (not res!226808)) b!272326))

(assert (= (or b!272328 b!272326) bm!4362))

(assert (=> b!272322 m!404845))

(assert (=> b!272322 m!404977))

(declare-fun m!405021 () Bool)

(assert (=> b!272327 m!405021))

(declare-fun m!405023 () Bool)

(assert (=> b!272327 m!405023))

(assert (=> b!272327 m!405021))

(assert (=> b!272327 m!405023))

(declare-fun m!405025 () Bool)

(assert (=> b!272327 m!405025))

(declare-fun m!405027 () Bool)

(assert (=> b!272324 m!405027))

(declare-fun m!405029 () Bool)

(assert (=> bm!4362 m!405029))

(declare-fun m!405031 () Bool)

(assert (=> bm!4362 m!405031))

(assert (=> bm!4362 m!405021))

(assert (=> bm!4362 m!405023))

(declare-fun m!405033 () Bool)

(assert (=> bm!4362 m!405033))

(assert (=> b!272199 d!93130))

(assert (=> b!272199 d!93116))

(declare-fun d!93132 () Bool)

(assert (=> d!93132 (= (invariant!0 (currentBit!13050 w1!591) (currentByte!13055 w1!591) (size!6595 (buf!7063 w1!591))) (and (bvsge (currentBit!13050 w1!591) #b00000000000000000000000000000000) (bvslt (currentBit!13050 w1!591) #b00000000000000000000000000001000) (bvsge (currentByte!13055 w1!591) #b00000000000000000000000000000000) (or (bvslt (currentByte!13055 w1!591) (size!6595 (buf!7063 w1!591))) (and (= (currentBit!13050 w1!591) #b00000000000000000000000000000000) (= (currentByte!13055 w1!591) (size!6595 (buf!7063 w1!591)))))))))

(assert (=> d!93064 d!93132))

(assert (=> b!272197 d!93116))

(assert (=> b!272197 d!93120))

(push 1)

(assert (not bm!4360))

(assert (not d!93122))

(assert (not b!272327))

(assert (not d!93116))

(assert (not b!272298))

(assert (not b!272313))

(assert (not b!272322))

(assert (not b!272296))

(assert (not d!93118))

(assert (not bm!4361))

(assert (not b!272315))

(assert (not b!272301))

(assert (not b!272321))

(assert (not d!93120))

(assert (not b!272324))

(assert (not b!272318))

(assert (not bm!4362))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!93218 () Bool)

(declare-fun res!226866 () Bool)

(declare-fun e!192192 () Bool)

(assert (=> d!93218 (=> res!226866 e!192192)))

(assert (=> d!93218 (= res!226866 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!13055 w1!591)))))

(assert (=> d!93218 (= (arrayRangesEq!1127 (buf!7063 w1!591) (buf!7063 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!13055 w1!591)) e!192192)))

(declare-fun b!272392 () Bool)

(declare-fun e!192193 () Bool)

(assert (=> b!272392 (= e!192192 e!192193)))

(declare-fun res!226867 () Bool)

(assert (=> b!272392 (=> (not res!226867) (not e!192193))))

(assert (=> b!272392 (= res!226867 (= (select (arr!7582 (buf!7063 w1!591)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (select (arr!7582 (buf!7063 w3!25)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!272393 () Bool)

(assert (=> b!272393 (= e!192193 (arrayRangesEq!1127 (buf!7063 w1!591) (buf!7063 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!13055 w1!591)))))

(assert (= (and d!93218 (not res!226866)) b!272392))

(assert (= (and b!272392 res!226867) b!272393))

(declare-fun m!405181 () Bool)

(assert (=> b!272392 m!405181))

(declare-fun m!405183 () Bool)

(assert (=> b!272392 m!405183))

(declare-fun m!405185 () Bool)

(assert (=> b!272393 m!405185))

(assert (=> b!272321 d!93218))

(declare-fun d!93220 () Bool)

(assert (=> d!93220 (= (byteRangesEq!0 (ite c!12541 (select (arr!7582 (buf!7063 w1!591)) (_3!1018 lt!410285)) (select (arr!7582 (buf!7063 w1!591)) (_4!238 lt!410285))) (ite c!12541 (select (arr!7582 (buf!7063 w3!25)) (_3!1018 lt!410285)) (select (arr!7582 (buf!7063 w3!25)) (_4!238 lt!410285))) (ite c!12541 lt!410283 #b00000000000000000000000000000000) lt!410284) (or (= (ite c!12541 lt!410283 #b00000000000000000000000000000000) lt!410284) (= (bvand (bvand (bvand ((_ sign_extend 24) (ite c!12541 (select (arr!7582 (buf!7063 w1!591)) (_3!1018 lt!410285)) (select (arr!7582 (buf!7063 w1!591)) (_4!238 lt!410285)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!410284))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!12541 lt!410283 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (ite c!12541 (select (arr!7582 (buf!7063 w3!25)) (_3!1018 lt!410285)) (select (arr!7582 (buf!7063 w3!25)) (_4!238 lt!410285)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!410284))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!12541 lt!410283 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111))))))

(declare-fun bs!23491 () Bool)

(assert (= bs!23491 d!93220))

(declare-fun m!405187 () Bool)

(assert (=> bs!23491 m!405187))

(declare-fun m!405189 () Bool)

(assert (=> bs!23491 m!405189))

(assert (=> bm!4362 d!93220))

(assert (=> d!93122 d!93056))

(declare-fun d!93222 () Bool)

(assert (=> d!93222 (= (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6595 (buf!7063 w2!587)) (currentByte!13055 w2!587) (currentBit!13050 w2!587))) (tuple4!477 ((_ extract 31 0) (bvadd (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!6595 (buf!7063 w2!587)) (currentByte!13055 w2!587) (currentBit!13050 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!6595 (buf!7063 w2!587)) (currentByte!13055 w2!587) (currentBit!13050 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!272313 d!93222))

(declare-fun d!93224 () Bool)

(assert (=> d!93224 (= (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6595 (buf!7063 w1!591)) (currentByte!13055 w1!591) (currentBit!13050 w1!591))) (tuple4!477 ((_ extract 31 0) (bvadd (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!6595 (buf!7063 w1!591)) (currentByte!13055 w1!591) (currentBit!13050 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!6595 (buf!7063 w1!591)) (currentByte!13055 w1!591) (currentBit!13050 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!272296 d!93224))

(declare-fun d!93226 () Bool)

(assert (=> d!93226 (= (remainingBits!0 ((_ sign_extend 32) (size!6595 (buf!7063 w1!591))) ((_ sign_extend 32) (currentByte!13055 w1!591)) ((_ sign_extend 32) (currentBit!13050 w1!591))) (bvsub (bvmul ((_ sign_extend 32) (size!6595 (buf!7063 w1!591))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!13055 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13050 w1!591)))))))

(assert (=> d!93116 d!93226))

(assert (=> d!93116 d!93132))

(declare-fun d!93228 () Bool)

(assert (=> d!93228 (= (remainingBits!0 ((_ sign_extend 32) (size!6595 (buf!7063 w2!587))) ((_ sign_extend 32) (currentByte!13055 w2!587)) ((_ sign_extend 32) (currentBit!13050 w2!587))) (bvsub (bvmul ((_ sign_extend 32) (size!6595 (buf!7063 w2!587))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!13055 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13050 w2!587)))))))

(assert (=> d!93118 d!93228))

(assert (=> d!93118 d!93126))

(declare-fun d!93230 () Bool)

(declare-fun res!226868 () Bool)

(declare-fun e!192194 () Bool)

(assert (=> d!93230 (=> res!226868 e!192194)))

(assert (=> d!93230 (= res!226868 (= (_1!12221 lt!410282) (_2!12221 lt!410282)))))

(assert (=> d!93230 (= (arrayRangesEq!1127 (buf!7063 w2!587) (buf!7063 w3!25) (_1!12221 lt!410282) (_2!12221 lt!410282)) e!192194)))

(declare-fun b!272394 () Bool)

(declare-fun e!192195 () Bool)

(assert (=> b!272394 (= e!192194 e!192195)))

(declare-fun res!226869 () Bool)

(assert (=> b!272394 (=> (not res!226869) (not e!192195))))

(assert (=> b!272394 (= res!226869 (= (select (arr!7582 (buf!7063 w2!587)) (_1!12221 lt!410282)) (select (arr!7582 (buf!7063 w3!25)) (_1!12221 lt!410282))))))

(declare-fun b!272395 () Bool)

(assert (=> b!272395 (= e!192195 (arrayRangesEq!1127 (buf!7063 w2!587) (buf!7063 w3!25) (bvadd (_1!12221 lt!410282) #b00000000000000000000000000000001) (_2!12221 lt!410282)))))

(assert (= (and d!93230 (not res!226868)) b!272394))

(assert (= (and b!272394 res!226869) b!272395))

(declare-fun m!405191 () Bool)

(assert (=> b!272394 m!405191))

(declare-fun m!405193 () Bool)

(assert (=> b!272394 m!405193))

(declare-fun m!405195 () Bool)

(assert (=> b!272395 m!405195))

(assert (=> b!272315 d!93230))

(declare-fun d!93232 () Bool)

(declare-fun res!226870 () Bool)

(declare-fun e!192196 () Bool)

(assert (=> d!93232 (=> res!226870 e!192196)))

(assert (=> d!93232 (= res!226870 (= (_1!12221 lt!410249) (_2!12221 lt!410249)))))

(assert (=> d!93232 (= (arrayRangesEq!1127 (buf!7063 w1!591) (buf!7063 w2!587) (_1!12221 lt!410249) (_2!12221 lt!410249)) e!192196)))

(declare-fun b!272396 () Bool)

(declare-fun e!192197 () Bool)

(assert (=> b!272396 (= e!192196 e!192197)))

(declare-fun res!226871 () Bool)

(assert (=> b!272396 (=> (not res!226871) (not e!192197))))

(assert (=> b!272396 (= res!226871 (= (select (arr!7582 (buf!7063 w1!591)) (_1!12221 lt!410249)) (select (arr!7582 (buf!7063 w2!587)) (_1!12221 lt!410249))))))

(declare-fun b!272397 () Bool)

(assert (=> b!272397 (= e!192197 (arrayRangesEq!1127 (buf!7063 w1!591) (buf!7063 w2!587) (bvadd (_1!12221 lt!410249) #b00000000000000000000000000000001) (_2!12221 lt!410249)))))

(assert (= (and d!93232 (not res!226870)) b!272396))

(assert (= (and b!272396 res!226871) b!272397))

(declare-fun m!405197 () Bool)

(assert (=> b!272396 m!405197))

(declare-fun m!405199 () Bool)

(assert (=> b!272396 m!405199))

(declare-fun m!405201 () Bool)

(assert (=> b!272397 m!405201))

(assert (=> b!272298 d!93232))

(declare-fun d!93234 () Bool)

(declare-fun res!226872 () Bool)

(declare-fun e!192198 () Bool)

(assert (=> d!93234 (=> res!226872 e!192198)))

(assert (=> d!93234 (= res!226872 (= (_1!12221 lt!410285) (_2!12221 lt!410285)))))

(assert (=> d!93234 (= (arrayRangesEq!1127 (buf!7063 w1!591) (buf!7063 w3!25) (_1!12221 lt!410285) (_2!12221 lt!410285)) e!192198)))

(declare-fun b!272398 () Bool)

(declare-fun e!192199 () Bool)

(assert (=> b!272398 (= e!192198 e!192199)))

(declare-fun res!226873 () Bool)

(assert (=> b!272398 (=> (not res!226873) (not e!192199))))

(assert (=> b!272398 (= res!226873 (= (select (arr!7582 (buf!7063 w1!591)) (_1!12221 lt!410285)) (select (arr!7582 (buf!7063 w3!25)) (_1!12221 lt!410285))))))

(declare-fun b!272399 () Bool)

(assert (=> b!272399 (= e!192199 (arrayRangesEq!1127 (buf!7063 w1!591) (buf!7063 w3!25) (bvadd (_1!12221 lt!410285) #b00000000000000000000000000000001) (_2!12221 lt!410285)))))

(assert (= (and d!93234 (not res!226872)) b!272398))

(assert (= (and b!272398 res!226873) b!272399))

(declare-fun m!405203 () Bool)

(assert (=> b!272398 m!405203))

(declare-fun m!405205 () Bool)

(assert (=> b!272398 m!405205))

(declare-fun m!405207 () Bool)

(assert (=> b!272399 m!405207))

(assert (=> b!272324 d!93234))

(declare-fun d!93236 () Bool)

(assert (=> d!93236 (= (byteRangesEq!0 (ite c!12540 (select (arr!7582 (buf!7063 w2!587)) (_3!1018 lt!410282)) (select (arr!7582 (buf!7063 w2!587)) (_4!238 lt!410282))) (ite c!12540 (select (arr!7582 (buf!7063 w3!25)) (_3!1018 lt!410282)) (select (arr!7582 (buf!7063 w3!25)) (_4!238 lt!410282))) (ite c!12540 lt!410280 #b00000000000000000000000000000000) lt!410281) (or (= (ite c!12540 lt!410280 #b00000000000000000000000000000000) lt!410281) (= (bvand (bvand (bvand ((_ sign_extend 24) (ite c!12540 (select (arr!7582 (buf!7063 w2!587)) (_3!1018 lt!410282)) (select (arr!7582 (buf!7063 w2!587)) (_4!238 lt!410282)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!410281))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!12540 lt!410280 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (ite c!12540 (select (arr!7582 (buf!7063 w3!25)) (_3!1018 lt!410282)) (select (arr!7582 (buf!7063 w3!25)) (_4!238 lt!410282)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!410281))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!12540 lt!410280 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111))))))

(declare-fun bs!23492 () Bool)

(assert (= bs!23492 d!93236))

(declare-fun m!405209 () Bool)

(assert (=> bs!23492 m!405209))

(declare-fun m!405211 () Bool)

(assert (=> bs!23492 m!405211))

(assert (=> bm!4361 d!93236))

(declare-fun d!93238 () Bool)

(assert (=> d!93238 (= (byteRangesEq!0 (ite c!12539 (select (arr!7582 (buf!7063 w1!591)) (_3!1018 lt!410249)) (select (arr!7582 (buf!7063 w1!591)) (_4!238 lt!410249))) (ite c!12539 (select (arr!7582 (buf!7063 w2!587)) (_3!1018 lt!410249)) (select (arr!7582 (buf!7063 w2!587)) (_4!238 lt!410249))) (ite c!12539 lt!410247 #b00000000000000000000000000000000) lt!410248) (or (= (ite c!12539 lt!410247 #b00000000000000000000000000000000) lt!410248) (= (bvand (bvand (bvand ((_ sign_extend 24) (ite c!12539 (select (arr!7582 (buf!7063 w1!591)) (_3!1018 lt!410249)) (select (arr!7582 (buf!7063 w1!591)) (_4!238 lt!410249)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!410248))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!12539 lt!410247 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (ite c!12539 (select (arr!7582 (buf!7063 w2!587)) (_3!1018 lt!410249)) (select (arr!7582 (buf!7063 w2!587)) (_4!238 lt!410249)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!410248))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!12539 lt!410247 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111))))))

(declare-fun bs!23493 () Bool)

(assert (= bs!23493 d!93238))

(declare-fun m!405213 () Bool)

(assert (=> bs!23493 m!405213))

(declare-fun m!405215 () Bool)

(assert (=> bs!23493 m!405215))

(assert (=> bm!4360 d!93238))

(assert (=> b!272322 d!93224))

(declare-fun d!93240 () Bool)

(assert (=> d!93240 (= (byteRangesEq!0 (select (arr!7582 (buf!7063 w2!587)) (_3!1018 lt!410282)) (select (arr!7582 (buf!7063 w3!25)) (_3!1018 lt!410282)) lt!410280 #b00000000000000000000000000001000) (or (= lt!410280 #b00000000000000000000000000001000) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7582 (buf!7063 w2!587)) (_3!1018 lt!410282))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!410280)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7582 (buf!7063 w3!25)) (_3!1018 lt!410282))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!410280)))) #b00000000000000000000000011111111))))))

(declare-fun bs!23494 () Bool)

(assert (= bs!23494 d!93240))

(declare-fun m!405217 () Bool)

(assert (=> bs!23494 m!405217))

(declare-fun m!405219 () Bool)

(assert (=> bs!23494 m!405219))

(assert (=> b!272318 d!93240))

(declare-fun d!93242 () Bool)

(assert (=> d!93242 (= (byteRangesEq!0 (select (arr!7582 (buf!7063 w1!591)) (_3!1018 lt!410249)) (select (arr!7582 (buf!7063 w2!587)) (_3!1018 lt!410249)) lt!410247 #b00000000000000000000000000001000) (or (= lt!410247 #b00000000000000000000000000001000) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7582 (buf!7063 w1!591)) (_3!1018 lt!410249))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!410247)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7582 (buf!7063 w2!587)) (_3!1018 lt!410249))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!410247)))) #b00000000000000000000000011111111))))))

(declare-fun bs!23495 () Bool)

(assert (= bs!23495 d!93242))

(assert (=> bs!23495 m!405217))

(declare-fun m!405221 () Bool)

(assert (=> bs!23495 m!405221))

(assert (=> b!272301 d!93242))

(declare-fun d!93244 () Bool)

(assert (=> d!93244 (= (byteRangesEq!0 (select (arr!7582 (buf!7063 w1!591)) (_3!1018 lt!410285)) (select (arr!7582 (buf!7063 w3!25)) (_3!1018 lt!410285)) lt!410283 #b00000000000000000000000000001000) (or (= lt!410283 #b00000000000000000000000000001000) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7582 (buf!7063 w1!591)) (_3!1018 lt!410285))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!410283)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7582 (buf!7063 w3!25)) (_3!1018 lt!410285))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!410283)))) #b00000000000000000000000011111111))))))

(declare-fun bs!23496 () Bool)

(assert (= bs!23496 d!93244))

(assert (=> bs!23496 m!405217))

(declare-fun m!405223 () Bool)

(assert (=> bs!23496 m!405223))

(assert (=> b!272327 d!93244))

(declare-fun d!93246 () Bool)

(assert (=> d!93246 (= (remainingBits!0 ((_ sign_extend 32) (size!6595 (buf!7063 w3!25))) ((_ sign_extend 32) (currentByte!13055 w3!25)) ((_ sign_extend 32) (currentBit!13050 w3!25))) (bvsub (bvmul ((_ sign_extend 32) (size!6595 (buf!7063 w3!25))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!13055 w3!25)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13050 w3!25)))))))

(assert (=> d!93120 d!93246))

(assert (=> d!93120 d!93110))

(push 1)

(assert (not b!272399))

(assert (not b!272393))

(assert (not b!272395))

(assert (not b!272397))

(check-sat)

(pop 1)

(push 1)

(check-sat)

