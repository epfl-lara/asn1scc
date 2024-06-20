; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59372 () Bool)

(assert start!59372)

(declare-fun res!226226 () Bool)

(declare-fun e!191414 () Bool)

(assert (=> start!59372 (=> (not res!226226) (not e!191414))))

(declare-datatypes ((array!15143 0))(
  ( (array!15144 (arr!7573 (Array (_ BitVec 32) (_ BitVec 8))) (size!6586 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11986 0))(
  ( (BitStream!11987 (buf!7054 array!15143) (currentByte!13037 (_ BitVec 32)) (currentBit!13032 (_ BitVec 32))) )
))
(declare-fun w1!591 () BitStream!11986)

(declare-fun w2!587 () BitStream!11986)

(declare-fun isPrefixOf!0 (BitStream!11986 BitStream!11986) Bool)

(assert (=> start!59372 (= res!226226 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!59372 e!191414))

(declare-fun e!191413 () Bool)

(declare-fun inv!12 (BitStream!11986) Bool)

(assert (=> start!59372 (and (inv!12 w1!591) e!191413)))

(declare-fun e!191412 () Bool)

(assert (=> start!59372 (and (inv!12 w2!587) e!191412)))

(declare-fun w3!25 () BitStream!11986)

(declare-fun e!191416 () Bool)

(assert (=> start!59372 (and (inv!12 w3!25) e!191416)))

(declare-fun b!271542 () Bool)

(declare-fun array_inv!6310 (array!15143) Bool)

(assert (=> b!271542 (= e!191413 (array_inv!6310 (buf!7054 w1!591)))))

(declare-fun b!271543 () Bool)

(declare-fun e!191411 () Bool)

(assert (=> b!271543 (= e!191414 (not e!191411))))

(declare-fun res!226227 () Bool)

(assert (=> b!271543 (=> res!226227 e!191411)))

(assert (=> b!271543 (= res!226227 (or (bvsge (currentByte!13037 w1!591) (size!6586 (buf!7054 w1!591))) (bvslt (currentByte!13037 w1!591) (currentByte!13037 w2!587)) (bvsgt (currentBit!13032 w1!591) (currentBit!13032 w2!587))))))

(declare-fun arrayRangesEq!1118 (array!15143 array!15143 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!271543 (arrayRangesEq!1118 (buf!7054 w1!591) (buf!7054 w3!25) #b00000000000000000000000000000000 (currentByte!13037 w1!591))))

(declare-datatypes ((Unit!19127 0))(
  ( (Unit!19128) )
))
(declare-fun lt!409919 () Unit!19127)

(declare-fun arrayRangesEqTransitive!381 (array!15143 array!15143 array!15143 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19127)

(assert (=> b!271543 (= lt!409919 (arrayRangesEqTransitive!381 (buf!7054 w1!591) (buf!7054 w2!587) (buf!7054 w3!25) #b00000000000000000000000000000000 (currentByte!13037 w1!591) (currentByte!13037 w2!587)))))

(declare-fun b!271544 () Bool)

(declare-fun res!226228 () Bool)

(assert (=> b!271544 (=> (not res!226228) (not e!191414))))

(assert (=> b!271544 (= res!226228 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun b!271545 () Bool)

(assert (=> b!271545 (= e!191416 (array_inv!6310 (buf!7054 w3!25)))))

(declare-fun b!271546 () Bool)

(assert (=> b!271546 (= e!191412 (array_inv!6310 (buf!7054 w2!587)))))

(declare-fun b!271547 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!271547 (= e!191411 (byteRangesEq!0 (select (arr!7573 (buf!7054 w1!591)) (currentByte!13037 w1!591)) (select (arr!7573 (buf!7054 w3!25)) (currentByte!13037 w1!591)) #b00000000000000000000000000000000 (currentBit!13032 w1!591)))))

(assert (= (and start!59372 res!226226) b!271544))

(assert (= (and b!271544 res!226228) b!271543))

(assert (= (and b!271543 (not res!226227)) b!271547))

(assert (= start!59372 b!271542))

(assert (= start!59372 b!271546))

(assert (= start!59372 b!271545))

(declare-fun m!403979 () Bool)

(assert (=> b!271545 m!403979))

(declare-fun m!403981 () Bool)

(assert (=> start!59372 m!403981))

(declare-fun m!403983 () Bool)

(assert (=> start!59372 m!403983))

(declare-fun m!403985 () Bool)

(assert (=> start!59372 m!403985))

(declare-fun m!403987 () Bool)

(assert (=> start!59372 m!403987))

(declare-fun m!403989 () Bool)

(assert (=> b!271543 m!403989))

(declare-fun m!403991 () Bool)

(assert (=> b!271543 m!403991))

(declare-fun m!403993 () Bool)

(assert (=> b!271547 m!403993))

(declare-fun m!403995 () Bool)

(assert (=> b!271547 m!403995))

(assert (=> b!271547 m!403993))

(assert (=> b!271547 m!403995))

(declare-fun m!403997 () Bool)

(assert (=> b!271547 m!403997))

(declare-fun m!403999 () Bool)

(assert (=> b!271546 m!403999))

(declare-fun m!404001 () Bool)

(assert (=> b!271544 m!404001))

(declare-fun m!404003 () Bool)

(assert (=> b!271542 m!404003))

(push 1)

(assert (not b!271546))

(assert (not start!59372))

(assert (not b!271545))

(assert (not b!271547))

(assert (not b!271543))

(assert (not b!271544))

(assert (not b!271542))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!92668 () Bool)

(declare-fun res!226257 () Bool)

(declare-fun e!191475 () Bool)

(assert (=> d!92668 (=> res!226257 e!191475)))

(assert (=> d!92668 (= res!226257 (= #b00000000000000000000000000000000 (currentByte!13037 w1!591)))))

(assert (=> d!92668 (= (arrayRangesEq!1118 (buf!7054 w1!591) (buf!7054 w3!25) #b00000000000000000000000000000000 (currentByte!13037 w1!591)) e!191475)))

(declare-fun b!271594 () Bool)

(declare-fun e!191476 () Bool)

(assert (=> b!271594 (= e!191475 e!191476)))

(declare-fun res!226258 () Bool)

(assert (=> b!271594 (=> (not res!226258) (not e!191476))))

(assert (=> b!271594 (= res!226258 (= (select (arr!7573 (buf!7054 w1!591)) #b00000000000000000000000000000000) (select (arr!7573 (buf!7054 w3!25)) #b00000000000000000000000000000000)))))

(declare-fun b!271595 () Bool)

(assert (=> b!271595 (= e!191476 (arrayRangesEq!1118 (buf!7054 w1!591) (buf!7054 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!13037 w1!591)))))

(assert (= (and d!92668 (not res!226257)) b!271594))

(assert (= (and b!271594 res!226258) b!271595))

(declare-fun m!404059 () Bool)

(assert (=> b!271594 m!404059))

(declare-fun m!404063 () Bool)

(assert (=> b!271594 m!404063))

(declare-fun m!404067 () Bool)

(assert (=> b!271595 m!404067))

(assert (=> b!271543 d!92668))

(declare-fun d!92676 () Bool)

(assert (=> d!92676 (arrayRangesEq!1118 (buf!7054 w1!591) (buf!7054 w3!25) #b00000000000000000000000000000000 (currentByte!13037 w1!591))))

(declare-fun lt!409930 () Unit!19127)

(declare-fun choose!429 (array!15143 array!15143 array!15143 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19127)

(assert (=> d!92676 (= lt!409930 (choose!429 (buf!7054 w1!591) (buf!7054 w2!587) (buf!7054 w3!25) #b00000000000000000000000000000000 (currentByte!13037 w1!591) (currentByte!13037 w2!587)))))

(assert (=> d!92676 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!13037 w1!591)) (bvsle (currentByte!13037 w1!591) (currentByte!13037 w2!587)))))

(assert (=> d!92676 (= (arrayRangesEqTransitive!381 (buf!7054 w1!591) (buf!7054 w2!587) (buf!7054 w3!25) #b00000000000000000000000000000000 (currentByte!13037 w1!591) (currentByte!13037 w2!587)) lt!409930)))

(declare-fun bs!23381 () Bool)

(assert (= bs!23381 d!92676))

(assert (=> bs!23381 m!403989))

(declare-fun m!404071 () Bool)

(assert (=> bs!23381 m!404071))

(assert (=> b!271543 d!92676))

(declare-fun d!92678 () Bool)

(declare-fun res!226271 () Bool)

(declare-fun e!191487 () Bool)

(assert (=> d!92678 (=> (not res!226271) (not e!191487))))

(assert (=> d!92678 (= res!226271 (= (size!6586 (buf!7054 w2!587)) (size!6586 (buf!7054 w3!25))))))

(assert (=> d!92678 (= (isPrefixOf!0 w2!587 w3!25) e!191487)))

(declare-fun b!271608 () Bool)

(declare-fun res!226273 () Bool)

(assert (=> b!271608 (=> (not res!226273) (not e!191487))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!271608 (= res!226273 (bvsle (bitIndex!0 (size!6586 (buf!7054 w2!587)) (currentByte!13037 w2!587) (currentBit!13032 w2!587)) (bitIndex!0 (size!6586 (buf!7054 w3!25)) (currentByte!13037 w3!25) (currentBit!13032 w3!25))))))

(declare-fun b!271609 () Bool)

(declare-fun e!191488 () Bool)

(assert (=> b!271609 (= e!191487 e!191488)))

(declare-fun res!226272 () Bool)

(assert (=> b!271609 (=> res!226272 e!191488)))

(assert (=> b!271609 (= res!226272 (= (size!6586 (buf!7054 w2!587)) #b00000000000000000000000000000000))))

(declare-fun b!271610 () Bool)

(declare-fun arrayBitRangesEq!0 (array!15143 array!15143 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!271610 (= e!191488 (arrayBitRangesEq!0 (buf!7054 w2!587) (buf!7054 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6586 (buf!7054 w2!587)) (currentByte!13037 w2!587) (currentBit!13032 w2!587))))))

(assert (= (and d!92678 res!226271) b!271608))

(assert (= (and b!271608 res!226273) b!271609))

(assert (= (and b!271609 (not res!226272)) b!271610))

(declare-fun m!404087 () Bool)

(assert (=> b!271608 m!404087))

(declare-fun m!404089 () Bool)

(assert (=> b!271608 m!404089))

(assert (=> b!271610 m!404087))

(assert (=> b!271610 m!404087))

(declare-fun m!404091 () Bool)

(assert (=> b!271610 m!404091))

(assert (=> b!271544 d!92678))

(declare-fun d!92692 () Bool)

(assert (=> d!92692 (= (array_inv!6310 (buf!7054 w2!587)) (bvsge (size!6586 (buf!7054 w2!587)) #b00000000000000000000000000000000))))

(assert (=> b!271546 d!92692))

(declare-fun d!92696 () Bool)

(assert (=> d!92696 (= (array_inv!6310 (buf!7054 w3!25)) (bvsge (size!6586 (buf!7054 w3!25)) #b00000000000000000000000000000000))))

(assert (=> b!271545 d!92696))

(declare-fun d!92698 () Bool)

(assert (=> d!92698 (= (array_inv!6310 (buf!7054 w1!591)) (bvsge (size!6586 (buf!7054 w1!591)) #b00000000000000000000000000000000))))

(assert (=> b!271542 d!92698))

(declare-fun d!92700 () Bool)

(assert (=> d!92700 (= (byteRangesEq!0 (select (arr!7573 (buf!7054 w1!591)) (currentByte!13037 w1!591)) (select (arr!7573 (buf!7054 w3!25)) (currentByte!13037 w1!591)) #b00000000000000000000000000000000 (currentBit!13032 w1!591)) (or (= #b00000000000000000000000000000000 (currentBit!13032 w1!591)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7573 (buf!7054 w1!591)) (currentByte!13037 w1!591))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!13032 w1!591)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7573 (buf!7054 w3!25)) (currentByte!13037 w1!591))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!13032 w1!591)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!23385 () Bool)

(assert (= bs!23385 d!92700))

(declare-fun m!404101 () Bool)

(assert (=> bs!23385 m!404101))

(declare-fun m!404105 () Bool)

(assert (=> bs!23385 m!404105))

(assert (=> b!271547 d!92700))

(declare-fun d!92704 () Bool)

(declare-fun res!226292 () Bool)

(declare-fun e!191501 () Bool)

(assert (=> d!92704 (=> (not res!226292) (not e!191501))))

(assert (=> d!92704 (= res!226292 (= (size!6586 (buf!7054 w1!591)) (size!6586 (buf!7054 w2!587))))))

(assert (=> d!92704 (= (isPrefixOf!0 w1!591 w2!587) e!191501)))

(declare-fun b!271629 () Bool)

(declare-fun res!226294 () Bool)

(assert (=> b!271629 (=> (not res!226294) (not e!191501))))

(assert (=> b!271629 (= res!226294 (bvsle (bitIndex!0 (size!6586 (buf!7054 w1!591)) (currentByte!13037 w1!591) (currentBit!13032 w1!591)) (bitIndex!0 (size!6586 (buf!7054 w2!587)) (currentByte!13037 w2!587) (currentBit!13032 w2!587))))))

(declare-fun b!271630 () Bool)

(declare-fun e!191502 () Bool)

(assert (=> b!271630 (= e!191501 e!191502)))

(declare-fun res!226293 () Bool)

(assert (=> b!271630 (=> res!226293 e!191502)))

(assert (=> b!271630 (= res!226293 (= (size!6586 (buf!7054 w1!591)) #b00000000000000000000000000000000))))

(declare-fun b!271631 () Bool)

(assert (=> b!271631 (= e!191502 (arrayBitRangesEq!0 (buf!7054 w1!591) (buf!7054 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6586 (buf!7054 w1!591)) (currentByte!13037 w1!591) (currentBit!13032 w1!591))))))

(assert (= (and d!92704 res!226292) b!271629))

(assert (= (and b!271629 res!226294) b!271630))

(assert (= (and b!271630 (not res!226293)) b!271631))

(declare-fun m!404109 () Bool)

(assert (=> b!271629 m!404109))

(assert (=> b!271629 m!404087))

(assert (=> b!271631 m!404109))

(assert (=> b!271631 m!404109))

(declare-fun m!404111 () Bool)

(assert (=> b!271631 m!404111))

(assert (=> start!59372 d!92704))

(declare-fun d!92708 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!92708 (= (inv!12 w1!591) (invariant!0 (currentBit!13032 w1!591) (currentByte!13037 w1!591) (size!6586 (buf!7054 w1!591))))))

(declare-fun bs!23389 () Bool)

(assert (= bs!23389 d!92708))

(declare-fun m!404119 () Bool)

(assert (=> bs!23389 m!404119))

(assert (=> start!59372 d!92708))

(declare-fun d!92714 () Bool)

(assert (=> d!92714 (= (inv!12 w2!587) (invariant!0 (currentBit!13032 w2!587) (currentByte!13037 w2!587) (size!6586 (buf!7054 w2!587))))))

(declare-fun bs!23390 () Bool)

(assert (= bs!23390 d!92714))

(declare-fun m!404125 () Bool)

(assert (=> bs!23390 m!404125))

(assert (=> start!59372 d!92714))

(declare-fun d!92716 () Bool)

(assert (=> d!92716 (= (inv!12 w3!25) (invariant!0 (currentBit!13032 w3!25) (currentByte!13037 w3!25) (size!6586 (buf!7054 w3!25))))))

(declare-fun bs!23391 () Bool)

(assert (= bs!23391 d!92716))

(declare-fun m!404129 () Bool)

(assert (=> bs!23391 m!404129))

(assert (=> start!59372 d!92716))

(push 1)

(assert (not b!271595))

(assert (not d!92708))

(assert (not d!92716))

(assert (not b!271608))

(assert (not b!271629))

(assert (not b!271610))

(assert (not b!271631))

(assert (not d!92676))

(assert (not d!92714))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!92732 () Bool)

(declare-fun e!191540 () Bool)

(assert (=> d!92732 e!191540))

(declare-fun res!226338 () Bool)

(assert (=> d!92732 (=> (not res!226338) (not e!191540))))

(declare-fun lt!409991 () (_ BitVec 64))

(declare-fun lt!409994 () (_ BitVec 64))

(declare-fun lt!409993 () (_ BitVec 64))

(assert (=> d!92732 (= res!226338 (= lt!409994 (bvsub lt!409991 lt!409993)))))

(assert (=> d!92732 (or (= (bvand lt!409991 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!409993 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!409991 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!409991 lt!409993) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!92732 (= lt!409993 (remainingBits!0 ((_ sign_extend 32) (size!6586 (buf!7054 w2!587))) ((_ sign_extend 32) (currentByte!13037 w2!587)) ((_ sign_extend 32) (currentBit!13032 w2!587))))))

(declare-fun lt!409992 () (_ BitVec 64))

(declare-fun lt!409990 () (_ BitVec 64))

(assert (=> d!92732 (= lt!409991 (bvmul lt!409992 lt!409990))))

(assert (=> d!92732 (or (= lt!409992 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!409990 (bvsdiv (bvmul lt!409992 lt!409990) lt!409992)))))

(assert (=> d!92732 (= lt!409990 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!92732 (= lt!409992 ((_ sign_extend 32) (size!6586 (buf!7054 w2!587))))))

(assert (=> d!92732 (= lt!409994 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13037 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13032 w2!587))))))

(assert (=> d!92732 (invariant!0 (currentBit!13032 w2!587) (currentByte!13037 w2!587) (size!6586 (buf!7054 w2!587)))))

(assert (=> d!92732 (= (bitIndex!0 (size!6586 (buf!7054 w2!587)) (currentByte!13037 w2!587) (currentBit!13032 w2!587)) lt!409994)))

(declare-fun b!271682 () Bool)

(declare-fun res!226337 () Bool)

(assert (=> b!271682 (=> (not res!226337) (not e!191540))))

(assert (=> b!271682 (= res!226337 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!409994))))

(declare-fun b!271683 () Bool)

(declare-fun lt!409989 () (_ BitVec 64))

(assert (=> b!271683 (= e!191540 (bvsle lt!409994 (bvmul lt!409989 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!271683 (or (= lt!409989 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!409989 #b0000000000000000000000000000000000000000000000000000000000001000) lt!409989)))))

(assert (=> b!271683 (= lt!409989 ((_ sign_extend 32) (size!6586 (buf!7054 w2!587))))))

(assert (= (and d!92732 res!226338) b!271682))

(assert (= (and b!271682 res!226337) b!271683))

(declare-fun m!404185 () Bool)

(assert (=> d!92732 m!404185))

(assert (=> d!92732 m!404125))

(assert (=> b!271608 d!92732))

(declare-fun d!92748 () Bool)

(declare-fun e!191541 () Bool)

(assert (=> d!92748 e!191541))

(declare-fun res!226340 () Bool)

(assert (=> d!92748 (=> (not res!226340) (not e!191541))))

(declare-fun lt!410000 () (_ BitVec 64))

(declare-fun lt!409999 () (_ BitVec 64))

(declare-fun lt!409997 () (_ BitVec 64))

(assert (=> d!92748 (= res!226340 (= lt!410000 (bvsub lt!409997 lt!409999)))))

(assert (=> d!92748 (or (= (bvand lt!409997 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!409999 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!409997 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!409997 lt!409999) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!92748 (= lt!409999 (remainingBits!0 ((_ sign_extend 32) (size!6586 (buf!7054 w3!25))) ((_ sign_extend 32) (currentByte!13037 w3!25)) ((_ sign_extend 32) (currentBit!13032 w3!25))))))

(declare-fun lt!409998 () (_ BitVec 64))

(declare-fun lt!409996 () (_ BitVec 64))

(assert (=> d!92748 (= lt!409997 (bvmul lt!409998 lt!409996))))

(assert (=> d!92748 (or (= lt!409998 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!409996 (bvsdiv (bvmul lt!409998 lt!409996) lt!409998)))))

(assert (=> d!92748 (= lt!409996 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!92748 (= lt!409998 ((_ sign_extend 32) (size!6586 (buf!7054 w3!25))))))

(assert (=> d!92748 (= lt!410000 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13037 w3!25)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13032 w3!25))))))

(assert (=> d!92748 (invariant!0 (currentBit!13032 w3!25) (currentByte!13037 w3!25) (size!6586 (buf!7054 w3!25)))))

(assert (=> d!92748 (= (bitIndex!0 (size!6586 (buf!7054 w3!25)) (currentByte!13037 w3!25) (currentBit!13032 w3!25)) lt!410000)))

(declare-fun b!271684 () Bool)

(declare-fun res!226339 () Bool)

(assert (=> b!271684 (=> (not res!226339) (not e!191541))))

(assert (=> b!271684 (= res!226339 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!410000))))

(declare-fun b!271685 () Bool)

(declare-fun lt!409995 () (_ BitVec 64))

(assert (=> b!271685 (= e!191541 (bvsle lt!410000 (bvmul lt!409995 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!271685 (or (= lt!409995 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!409995 #b0000000000000000000000000000000000000000000000000000000000001000) lt!409995)))))

(assert (=> b!271685 (= lt!409995 ((_ sign_extend 32) (size!6586 (buf!7054 w3!25))))))

(assert (= (and d!92748 res!226340) b!271684))

(assert (= (and b!271684 res!226339) b!271685))

(declare-fun m!404187 () Bool)

(assert (=> d!92748 m!404187))

(assert (=> d!92748 m!404129))

(assert (=> b!271608 d!92748))

(declare-fun d!92750 () Bool)

(declare-fun res!226341 () Bool)

(declare-fun e!191542 () Bool)

(assert (=> d!92750 (=> res!226341 e!191542)))

(assert (=> d!92750 (= res!226341 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!13037 w1!591)))))

(assert (=> d!92750 (= (arrayRangesEq!1118 (buf!7054 w1!591) (buf!7054 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!13037 w1!591)) e!191542)))

(declare-fun b!271686 () Bool)

(declare-fun e!191543 () Bool)

(assert (=> b!271686 (= e!191542 e!191543)))

(declare-fun res!226342 () Bool)

(assert (=> b!271686 (=> (not res!226342) (not e!191543))))

(assert (=> b!271686 (= res!226342 (= (select (arr!7573 (buf!7054 w1!591)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!7573 (buf!7054 w3!25)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!271687 () Bool)

(assert (=> b!271687 (= e!191543 (arrayRangesEq!1118 (buf!7054 w1!591) (buf!7054 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!13037 w1!591)))))

(assert (= (and d!92750 (not res!226341)) b!271686))

(assert (= (and b!271686 res!226342) b!271687))

(declare-fun m!404189 () Bool)

(assert (=> b!271686 m!404189))

(declare-fun m!404191 () Bool)

(assert (=> b!271686 m!404191))

(declare-fun m!404193 () Bool)

(assert (=> b!271687 m!404193))

(assert (=> b!271595 d!92750))

(assert (=> d!92676 d!92668))

(declare-fun d!92752 () Bool)

(assert (=> d!92752 (arrayRangesEq!1118 (buf!7054 w1!591) (buf!7054 w3!25) #b00000000000000000000000000000000 (currentByte!13037 w1!591))))

(assert (=> d!92752 true))

(declare-fun _$16!155 () Unit!19127)

(assert (=> d!92752 (= (choose!429 (buf!7054 w1!591) (buf!7054 w2!587) (buf!7054 w3!25) #b00000000000000000000000000000000 (currentByte!13037 w1!591) (currentByte!13037 w2!587)) _$16!155)))

(declare-fun bs!23396 () Bool)

(assert (= bs!23396 d!92752))

(assert (=> bs!23396 m!403989))

(assert (=> d!92676 d!92752))

(declare-fun d!92754 () Bool)

(assert (=> d!92754 (= (invariant!0 (currentBit!13032 w1!591) (currentByte!13037 w1!591) (size!6586 (buf!7054 w1!591))) (and (bvsge (currentBit!13032 w1!591) #b00000000000000000000000000000000) (bvslt (currentBit!13032 w1!591) #b00000000000000000000000000001000) (bvsge (currentByte!13037 w1!591) #b00000000000000000000000000000000) (or (bvslt (currentByte!13037 w1!591) (size!6586 (buf!7054 w1!591))) (and (= (currentBit!13032 w1!591) #b00000000000000000000000000000000) (= (currentByte!13037 w1!591) (size!6586 (buf!7054 w1!591)))))))))

(assert (=> d!92708 d!92754))

(declare-fun d!92756 () Bool)

(declare-fun e!191544 () Bool)

(assert (=> d!92756 e!191544))

(declare-fun res!226344 () Bool)

(assert (=> d!92756 (=> (not res!226344) (not e!191544))))

(declare-fun lt!410003 () (_ BitVec 64))

(declare-fun lt!410006 () (_ BitVec 64))

(declare-fun lt!410005 () (_ BitVec 64))

(assert (=> d!92756 (= res!226344 (= lt!410006 (bvsub lt!410003 lt!410005)))))

(assert (=> d!92756 (or (= (bvand lt!410003 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!410005 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!410003 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!410003 lt!410005) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!92756 (= lt!410005 (remainingBits!0 ((_ sign_extend 32) (size!6586 (buf!7054 w1!591))) ((_ sign_extend 32) (currentByte!13037 w1!591)) ((_ sign_extend 32) (currentBit!13032 w1!591))))))

(declare-fun lt!410004 () (_ BitVec 64))

(declare-fun lt!410002 () (_ BitVec 64))

(assert (=> d!92756 (= lt!410003 (bvmul lt!410004 lt!410002))))

(assert (=> d!92756 (or (= lt!410004 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!410002 (bvsdiv (bvmul lt!410004 lt!410002) lt!410004)))))

(assert (=> d!92756 (= lt!410002 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!92756 (= lt!410004 ((_ sign_extend 32) (size!6586 (buf!7054 w1!591))))))

(assert (=> d!92756 (= lt!410006 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13037 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13032 w1!591))))))

(assert (=> d!92756 (invariant!0 (currentBit!13032 w1!591) (currentByte!13037 w1!591) (size!6586 (buf!7054 w1!591)))))

(assert (=> d!92756 (= (bitIndex!0 (size!6586 (buf!7054 w1!591)) (currentByte!13037 w1!591) (currentBit!13032 w1!591)) lt!410006)))

(declare-fun b!271688 () Bool)

(declare-fun res!226343 () Bool)

(assert (=> b!271688 (=> (not res!226343) (not e!191544))))

(assert (=> b!271688 (= res!226343 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!410006))))

(declare-fun b!271689 () Bool)

(declare-fun lt!410001 () (_ BitVec 64))

(assert (=> b!271689 (= e!191544 (bvsle lt!410006 (bvmul lt!410001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!271689 (or (= lt!410001 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!410001 #b0000000000000000000000000000000000000000000000000000000000001000) lt!410001)))))

(assert (=> b!271689 (= lt!410001 ((_ sign_extend 32) (size!6586 (buf!7054 w1!591))))))

(assert (= (and d!92756 res!226344) b!271688))

(assert (= (and b!271688 res!226343) b!271689))

(declare-fun m!404195 () Bool)

(assert (=> d!92756 m!404195))

(assert (=> d!92756 m!404119))

(assert (=> b!271629 d!92756))

(assert (=> b!271629 d!92732))

(declare-fun d!92758 () Bool)

(assert (=> d!92758 (= (invariant!0 (currentBit!13032 w3!25) (currentByte!13037 w3!25) (size!6586 (buf!7054 w3!25))) (and (bvsge (currentBit!13032 w3!25) #b00000000000000000000000000000000) (bvslt (currentBit!13032 w3!25) #b00000000000000000000000000001000) (bvsge (currentByte!13037 w3!25) #b00000000000000000000000000000000) (or (bvslt (currentByte!13037 w3!25) (size!6586 (buf!7054 w3!25))) (and (= (currentBit!13032 w3!25) #b00000000000000000000000000000000) (= (currentByte!13037 w3!25) (size!6586 (buf!7054 w3!25)))))))))

(assert (=> d!92716 d!92758))

(declare-fun d!92760 () Bool)

(assert (=> d!92760 (= (invariant!0 (currentBit!13032 w2!587) (currentByte!13037 w2!587) (size!6586 (buf!7054 w2!587))) (and (bvsge (currentBit!13032 w2!587) #b00000000000000000000000000000000) (bvslt (currentBit!13032 w2!587) #b00000000000000000000000000001000) (bvsge (currentByte!13037 w2!587) #b00000000000000000000000000000000) (or (bvslt (currentByte!13037 w2!587) (size!6586 (buf!7054 w2!587))) (and (= (currentBit!13032 w2!587) #b00000000000000000000000000000000) (= (currentByte!13037 w2!587) (size!6586 (buf!7054 w2!587)))))))))

(assert (=> d!92714 d!92760))

(declare-fun call!4350 () Bool)

(declare-fun c!12499 () Bool)

(declare-fun lt!410014 () (_ BitVec 32))

(declare-datatypes ((tuple4!470 0))(
  ( (tuple4!471 (_1!12218 (_ BitVec 32)) (_2!12218 (_ BitVec 32)) (_3!1015 (_ BitVec 32)) (_4!235 (_ BitVec 32))) )
))
(declare-fun lt!410013 () tuple4!470)

(declare-fun bm!4347 () Bool)

(declare-fun lt!410015 () (_ BitVec 32))

(assert (=> bm!4347 (= call!4350 (byteRangesEq!0 (select (arr!7573 (buf!7054 w2!587)) (_3!1015 lt!410013)) (select (arr!7573 (buf!7054 w3!25)) (_3!1015 lt!410013)) lt!410014 (ite c!12499 lt!410015 #b00000000000000000000000000001000)))))

(declare-fun e!191561 () Bool)

(declare-fun b!271704 () Bool)

(assert (=> b!271704 (= e!191561 (arrayRangesEq!1118 (buf!7054 w2!587) (buf!7054 w3!25) (_1!12218 lt!410013) (_2!12218 lt!410013)))))

(declare-fun b!271705 () Bool)

(declare-fun res!226356 () Bool)

(assert (=> b!271705 (= res!226356 (= lt!410015 #b00000000000000000000000000000000))))

(declare-fun e!191559 () Bool)

(assert (=> b!271705 (=> res!226356 e!191559)))

(declare-fun e!191557 () Bool)

(assert (=> b!271705 (= e!191557 e!191559)))

(declare-fun b!271706 () Bool)

(declare-fun e!191558 () Bool)

(assert (=> b!271706 (= e!191558 e!191557)))

(declare-fun res!226355 () Bool)

(assert (=> b!271706 (= res!226355 call!4350)))

(assert (=> b!271706 (=> (not res!226355) (not e!191557))))

(declare-fun b!271707 () Bool)

(assert (=> b!271707 (= e!191559 (byteRangesEq!0 (select (arr!7573 (buf!7054 w2!587)) (_4!235 lt!410013)) (select (arr!7573 (buf!7054 w3!25)) (_4!235 lt!410013)) #b00000000000000000000000000000000 lt!410015))))

(declare-fun b!271708 () Bool)

(declare-fun e!191560 () Bool)

(declare-fun e!191562 () Bool)

(assert (=> b!271708 (= e!191560 e!191562)))

(declare-fun res!226359 () Bool)

(assert (=> b!271708 (=> (not res!226359) (not e!191562))))

(assert (=> b!271708 (= res!226359 e!191561)))

(declare-fun res!226358 () Bool)

(assert (=> b!271708 (=> res!226358 e!191561)))

(assert (=> b!271708 (= res!226358 (bvsge (_1!12218 lt!410013) (_2!12218 lt!410013)))))

(assert (=> b!271708 (= lt!410015 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6586 (buf!7054 w2!587)) (currentByte!13037 w2!587) (currentBit!13032 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!271708 (= lt!410014 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!470)

(assert (=> b!271708 (= lt!410013 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6586 (buf!7054 w2!587)) (currentByte!13037 w2!587) (currentBit!13032 w2!587))))))

(declare-fun d!92762 () Bool)

(declare-fun res!226357 () Bool)

(assert (=> d!92762 (=> res!226357 e!191560)))

(assert (=> d!92762 (= res!226357 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6586 (buf!7054 w2!587)) (currentByte!13037 w2!587) (currentBit!13032 w2!587))))))

(assert (=> d!92762 (= (arrayBitRangesEq!0 (buf!7054 w2!587) (buf!7054 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6586 (buf!7054 w2!587)) (currentByte!13037 w2!587) (currentBit!13032 w2!587))) e!191560)))

(declare-fun b!271709 () Bool)

(assert (=> b!271709 (= e!191562 e!191558)))

(assert (=> b!271709 (= c!12499 (= (_3!1015 lt!410013) (_4!235 lt!410013)))))

(declare-fun b!271710 () Bool)

(assert (=> b!271710 (= e!191558 call!4350)))

(assert (= (and d!92762 (not res!226357)) b!271708))

(assert (= (and b!271708 (not res!226358)) b!271704))

(assert (= (and b!271708 res!226359) b!271709))

(assert (= (and b!271709 c!12499) b!271710))

(assert (= (and b!271709 (not c!12499)) b!271706))

(assert (= (and b!271706 res!226355) b!271705))

(assert (= (and b!271705 (not res!226356)) b!271707))

(assert (= (or b!271710 b!271706) bm!4347))

(declare-fun m!404197 () Bool)

(assert (=> bm!4347 m!404197))

(declare-fun m!404199 () Bool)

(assert (=> bm!4347 m!404199))

(assert (=> bm!4347 m!404197))

(assert (=> bm!4347 m!404199))

(declare-fun m!404201 () Bool)

(assert (=> bm!4347 m!404201))

(declare-fun m!404203 () Bool)

(assert (=> b!271704 m!404203))

(declare-fun m!404205 () Bool)

(assert (=> b!271707 m!404205))

(declare-fun m!404207 () Bool)

(assert (=> b!271707 m!404207))

(assert (=> b!271707 m!404205))

(assert (=> b!271707 m!404207))

(declare-fun m!404209 () Bool)

(assert (=> b!271707 m!404209))

(assert (=> b!271708 m!404087))

(declare-fun m!404211 () Bool)

(assert (=> b!271708 m!404211))

(assert (=> b!271610 d!92762))

(assert (=> b!271610 d!92732))

(declare-fun bm!4348 () Bool)

(declare-fun lt!410018 () tuple4!470)

(declare-fun call!4351 () Bool)

(declare-fun c!12500 () Bool)

(declare-fun lt!410019 () (_ BitVec 32))

(declare-fun lt!410020 () (_ BitVec 32))

(assert (=> bm!4348 (= call!4351 (byteRangesEq!0 (select (arr!7573 (buf!7054 w1!591)) (_3!1015 lt!410018)) (select (arr!7573 (buf!7054 w2!587)) (_3!1015 lt!410018)) lt!410019 (ite c!12500 lt!410020 #b00000000000000000000000000001000)))))

(declare-fun b!271711 () Bool)

(declare-fun e!191567 () Bool)

(assert (=> b!271711 (= e!191567 (arrayRangesEq!1118 (buf!7054 w1!591) (buf!7054 w2!587) (_1!12218 lt!410018) (_2!12218 lt!410018)))))

(declare-fun b!271712 () Bool)

(declare-fun res!226361 () Bool)

(assert (=> b!271712 (= res!226361 (= lt!410020 #b00000000000000000000000000000000))))

(declare-fun e!191565 () Bool)

(assert (=> b!271712 (=> res!226361 e!191565)))

(declare-fun e!191563 () Bool)

(assert (=> b!271712 (= e!191563 e!191565)))

(declare-fun b!271713 () Bool)

(declare-fun e!191564 () Bool)

(assert (=> b!271713 (= e!191564 e!191563)))

(declare-fun res!226360 () Bool)

(assert (=> b!271713 (= res!226360 call!4351)))

(assert (=> b!271713 (=> (not res!226360) (not e!191563))))

(declare-fun b!271714 () Bool)

(assert (=> b!271714 (= e!191565 (byteRangesEq!0 (select (arr!7573 (buf!7054 w1!591)) (_4!235 lt!410018)) (select (arr!7573 (buf!7054 w2!587)) (_4!235 lt!410018)) #b00000000000000000000000000000000 lt!410020))))

(declare-fun b!271715 () Bool)

(declare-fun e!191566 () Bool)

(declare-fun e!191568 () Bool)

(assert (=> b!271715 (= e!191566 e!191568)))

(declare-fun res!226364 () Bool)

(assert (=> b!271715 (=> (not res!226364) (not e!191568))))

(assert (=> b!271715 (= res!226364 e!191567)))

(declare-fun res!226363 () Bool)

(assert (=> b!271715 (=> res!226363 e!191567)))

(assert (=> b!271715 (= res!226363 (bvsge (_1!12218 lt!410018) (_2!12218 lt!410018)))))

(assert (=> b!271715 (= lt!410020 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6586 (buf!7054 w1!591)) (currentByte!13037 w1!591) (currentBit!13032 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!271715 (= lt!410019 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!271715 (= lt!410018 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6586 (buf!7054 w1!591)) (currentByte!13037 w1!591) (currentBit!13032 w1!591))))))

(declare-fun d!92766 () Bool)

(declare-fun res!226362 () Bool)

(assert (=> d!92766 (=> res!226362 e!191566)))

(assert (=> d!92766 (= res!226362 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6586 (buf!7054 w1!591)) (currentByte!13037 w1!591) (currentBit!13032 w1!591))))))

(assert (=> d!92766 (= (arrayBitRangesEq!0 (buf!7054 w1!591) (buf!7054 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6586 (buf!7054 w1!591)) (currentByte!13037 w1!591) (currentBit!13032 w1!591))) e!191566)))

(declare-fun b!271716 () Bool)

(assert (=> b!271716 (= e!191568 e!191564)))

(assert (=> b!271716 (= c!12500 (= (_3!1015 lt!410018) (_4!235 lt!410018)))))

(declare-fun b!271717 () Bool)

(assert (=> b!271717 (= e!191564 call!4351)))

(assert (= (and d!92766 (not res!226362)) b!271715))

(assert (= (and b!271715 (not res!226363)) b!271711))

(assert (= (and b!271715 res!226364) b!271716))

(assert (= (and b!271716 c!12500) b!271717))

(assert (= (and b!271716 (not c!12500)) b!271713))

(assert (= (and b!271713 res!226360) b!271712))

(assert (= (and b!271712 (not res!226361)) b!271714))

(assert (= (or b!271717 b!271713) bm!4348))

(declare-fun m!404213 () Bool)

(assert (=> bm!4348 m!404213))

(declare-fun m!404215 () Bool)

(assert (=> bm!4348 m!404215))

(assert (=> bm!4348 m!404213))

(assert (=> bm!4348 m!404215))

(declare-fun m!404217 () Bool)

(assert (=> bm!4348 m!404217))

(declare-fun m!404219 () Bool)

(assert (=> b!271711 m!404219))

(declare-fun m!404221 () Bool)

(assert (=> b!271714 m!404221))

(declare-fun m!404223 () Bool)

(assert (=> b!271714 m!404223))

(assert (=> b!271714 m!404221))

(assert (=> b!271714 m!404223))

(declare-fun m!404225 () Bool)

(assert (=> b!271714 m!404225))

(assert (=> b!271715 m!404109))

(declare-fun m!404227 () Bool)

(assert (=> b!271715 m!404227))

(assert (=> b!271631 d!92766))

(assert (=> b!271631 d!92756))

(push 1)

(assert (not b!271711))

(assert (not b!271708))

(assert (not b!271715))

(assert (not bm!4347))

(assert (not d!92732))

(assert (not bm!4348))

(assert (not d!92748))

(assert (not b!271714))

(assert (not d!92756))

(assert (not b!271687))

(assert (not b!271707))

(assert (not d!92752))

(assert (not b!271704))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!92834 () Bool)

(assert (=> d!92834 (= (remainingBits!0 ((_ sign_extend 32) (size!6586 (buf!7054 w2!587))) ((_ sign_extend 32) (currentByte!13037 w2!587)) ((_ sign_extend 32) (currentBit!13032 w2!587))) (bvsub (bvmul ((_ sign_extend 32) (size!6586 (buf!7054 w2!587))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!13037 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13032 w2!587)))))))

(assert (=> d!92732 d!92834))

(assert (=> d!92732 d!92760))

(declare-fun d!92836 () Bool)

(assert (=> d!92836 (= (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6586 (buf!7054 w1!591)) (currentByte!13037 w1!591) (currentBit!13032 w1!591))) (tuple4!471 ((_ extract 31 0) (bvadd (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!6586 (buf!7054 w1!591)) (currentByte!13037 w1!591) (currentBit!13032 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!6586 (buf!7054 w1!591)) (currentByte!13037 w1!591) (currentBit!13032 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!271715 d!92836))

(declare-fun d!92838 () Bool)

(assert (=> d!92838 (= (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6586 (buf!7054 w2!587)) (currentByte!13037 w2!587) (currentBit!13032 w2!587))) (tuple4!471 ((_ extract 31 0) (bvadd (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!6586 (buf!7054 w2!587)) (currentByte!13037 w2!587) (currentBit!13032 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!6586 (buf!7054 w2!587)) (currentByte!13037 w2!587) (currentBit!13032 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!271708 d!92838))

(declare-fun d!92840 () Bool)

(assert (=> d!92840 (= (byteRangesEq!0 (select (arr!7573 (buf!7054 w2!587)) (_4!235 lt!410013)) (select (arr!7573 (buf!7054 w3!25)) (_4!235 lt!410013)) #b00000000000000000000000000000000 lt!410015) (or (= #b00000000000000000000000000000000 lt!410015) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7573 (buf!7054 w2!587)) (_4!235 lt!410013))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!410015))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7573 (buf!7054 w3!25)) (_4!235 lt!410013))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!410015))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!23406 () Bool)

(assert (= bs!23406 d!92840))

(declare-fun m!404337 () Bool)

(assert (=> bs!23406 m!404337))

(assert (=> bs!23406 m!404105))

(assert (=> b!271707 d!92840))

(declare-fun d!92842 () Bool)

(assert (=> d!92842 (= (remainingBits!0 ((_ sign_extend 32) (size!6586 (buf!7054 w1!591))) ((_ sign_extend 32) (currentByte!13037 w1!591)) ((_ sign_extend 32) (currentBit!13032 w1!591))) (bvsub (bvmul ((_ sign_extend 32) (size!6586 (buf!7054 w1!591))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!13037 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13032 w1!591)))))))

(assert (=> d!92756 d!92842))

(assert (=> d!92756 d!92754))

(assert (=> d!92752 d!92668))

(declare-fun d!92844 () Bool)

(declare-fun res!226409 () Bool)

(declare-fun e!191612 () Bool)

(assert (=> d!92844 (=> res!226409 e!191612)))

(assert (=> d!92844 (= res!226409 (= (_1!12218 lt!410013) (_2!12218 lt!410013)))))

(assert (=> d!92844 (= (arrayRangesEq!1118 (buf!7054 w2!587) (buf!7054 w3!25) (_1!12218 lt!410013) (_2!12218 lt!410013)) e!191612)))

(declare-fun b!271770 () Bool)

(declare-fun e!191613 () Bool)

(assert (=> b!271770 (= e!191612 e!191613)))

(declare-fun res!226410 () Bool)

(assert (=> b!271770 (=> (not res!226410) (not e!191613))))

(assert (=> b!271770 (= res!226410 (= (select (arr!7573 (buf!7054 w2!587)) (_1!12218 lt!410013)) (select (arr!7573 (buf!7054 w3!25)) (_1!12218 lt!410013))))))

(declare-fun b!271771 () Bool)

(assert (=> b!271771 (= e!191613 (arrayRangesEq!1118 (buf!7054 w2!587) (buf!7054 w3!25) (bvadd (_1!12218 lt!410013) #b00000000000000000000000000000001) (_2!12218 lt!410013)))))

(assert (= (and d!92844 (not res!226409)) b!271770))

(assert (= (and b!271770 res!226410) b!271771))

(declare-fun m!404339 () Bool)

(assert (=> b!271770 m!404339))

(declare-fun m!404341 () Bool)

(assert (=> b!271770 m!404341))

(declare-fun m!404343 () Bool)

(assert (=> b!271771 m!404343))

(assert (=> b!271704 d!92844))

(declare-fun d!92846 () Bool)

(assert (=> d!92846 (= (byteRangesEq!0 (select (arr!7573 (buf!7054 w2!587)) (_3!1015 lt!410013)) (select (arr!7573 (buf!7054 w3!25)) (_3!1015 lt!410013)) lt!410014 (ite c!12499 lt!410015 #b00000000000000000000000000001000)) (or (= lt!410014 (ite c!12499 lt!410015 #b00000000000000000000000000001000)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7573 (buf!7054 w2!587)) (_3!1015 lt!410013))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!12499 lt!410015 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!410014)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7573 (buf!7054 w3!25)) (_3!1015 lt!410013))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!12499 lt!410015 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!410014)))) #b00000000000000000000000011111111))))))

(declare-fun bs!23407 () Bool)

(assert (= bs!23407 d!92846))

(declare-fun m!404345 () Bool)

(assert (=> bs!23407 m!404345))

(declare-fun m!404347 () Bool)

(assert (=> bs!23407 m!404347))

(assert (=> bm!4347 d!92846))

(declare-fun d!92848 () Bool)

(assert (=> d!92848 (= (byteRangesEq!0 (select (arr!7573 (buf!7054 w1!591)) (_4!235 lt!410018)) (select (arr!7573 (buf!7054 w2!587)) (_4!235 lt!410018)) #b00000000000000000000000000000000 lt!410020) (or (= #b00000000000000000000000000000000 lt!410020) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7573 (buf!7054 w1!591)) (_4!235 lt!410018))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!410020))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7573 (buf!7054 w2!587)) (_4!235 lt!410018))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!410020))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!23408 () Bool)

(assert (= bs!23408 d!92848))

(declare-fun m!404349 () Bool)

(assert (=> bs!23408 m!404349))

(assert (=> bs!23408 m!404105))

(assert (=> b!271714 d!92848))

(declare-fun d!92850 () Bool)

(assert (=> d!92850 (= (byteRangesEq!0 (select (arr!7573 (buf!7054 w1!591)) (_3!1015 lt!410018)) (select (arr!7573 (buf!7054 w2!587)) (_3!1015 lt!410018)) lt!410019 (ite c!12500 lt!410020 #b00000000000000000000000000001000)) (or (= lt!410019 (ite c!12500 lt!410020 #b00000000000000000000000000001000)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7573 (buf!7054 w1!591)) (_3!1015 lt!410018))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!12500 lt!410020 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!410019)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7573 (buf!7054 w2!587)) (_3!1015 lt!410018))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!12500 lt!410020 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!410019)))) #b00000000000000000000000011111111))))))

(declare-fun bs!23409 () Bool)

(assert (= bs!23409 d!92850))

(declare-fun m!404351 () Bool)

(assert (=> bs!23409 m!404351))

(declare-fun m!404353 () Bool)

(assert (=> bs!23409 m!404353))

(assert (=> bm!4348 d!92850))

(declare-fun d!92852 () Bool)

(declare-fun res!226411 () Bool)

(declare-fun e!191614 () Bool)

(assert (=> d!92852 (=> res!226411 e!191614)))

(assert (=> d!92852 (= res!226411 (= (_1!12218 lt!410018) (_2!12218 lt!410018)))))

(assert (=> d!92852 (= (arrayRangesEq!1118 (buf!7054 w1!591) (buf!7054 w2!587) (_1!12218 lt!410018) (_2!12218 lt!410018)) e!191614)))

(declare-fun b!271772 () Bool)

(declare-fun e!191615 () Bool)

(assert (=> b!271772 (= e!191614 e!191615)))

(declare-fun res!226412 () Bool)

(assert (=> b!271772 (=> (not res!226412) (not e!191615))))

(assert (=> b!271772 (= res!226412 (= (select (arr!7573 (buf!7054 w1!591)) (_1!12218 lt!410018)) (select (arr!7573 (buf!7054 w2!587)) (_1!12218 lt!410018))))))

(declare-fun b!271773 () Bool)

(assert (=> b!271773 (= e!191615 (arrayRangesEq!1118 (buf!7054 w1!591) (buf!7054 w2!587) (bvadd (_1!12218 lt!410018) #b00000000000000000000000000000001) (_2!12218 lt!410018)))))

(assert (= (and d!92852 (not res!226411)) b!271772))

(assert (= (and b!271772 res!226412) b!271773))

(declare-fun m!404355 () Bool)

(assert (=> b!271772 m!404355))

(declare-fun m!404357 () Bool)

(assert (=> b!271772 m!404357))

(declare-fun m!404359 () Bool)

(assert (=> b!271773 m!404359))

(assert (=> b!271711 d!92852))

(declare-fun d!92854 () Bool)

(assert (=> d!92854 (= (remainingBits!0 ((_ sign_extend 32) (size!6586 (buf!7054 w3!25))) ((_ sign_extend 32) (currentByte!13037 w3!25)) ((_ sign_extend 32) (currentBit!13032 w3!25))) (bvsub (bvmul ((_ sign_extend 32) (size!6586 (buf!7054 w3!25))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!13037 w3!25)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13032 w3!25)))))))

(assert (=> d!92748 d!92854))

(assert (=> d!92748 d!92758))

(declare-fun d!92856 () Bool)

(declare-fun res!226413 () Bool)

(declare-fun e!191616 () Bool)

(assert (=> d!92856 (=> res!226413 e!191616)))

(assert (=> d!92856 (= res!226413 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!13037 w1!591)))))

(assert (=> d!92856 (= (arrayRangesEq!1118 (buf!7054 w1!591) (buf!7054 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!13037 w1!591)) e!191616)))

(declare-fun b!271774 () Bool)

(declare-fun e!191617 () Bool)

(assert (=> b!271774 (= e!191616 e!191617)))

(declare-fun res!226414 () Bool)

(assert (=> b!271774 (=> (not res!226414) (not e!191617))))

(assert (=> b!271774 (= res!226414 (= (select (arr!7573 (buf!7054 w1!591)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (select (arr!7573 (buf!7054 w3!25)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!271775 () Bool)

(assert (=> b!271775 (= e!191617 (arrayRangesEq!1118 (buf!7054 w1!591) (buf!7054 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!13037 w1!591)))))

(assert (= (and d!92856 (not res!226413)) b!271774))

(assert (= (and b!271774 res!226414) b!271775))

(declare-fun m!404361 () Bool)

(assert (=> b!271774 m!404361))

(declare-fun m!404363 () Bool)

(assert (=> b!271774 m!404363))

(declare-fun m!404365 () Bool)

(assert (=> b!271775 m!404365))

(assert (=> b!271687 d!92856))

(push 1)

(assert (not b!271775))

(assert (not b!271771))

(assert (not b!271773))

(check-sat)

(pop 1)

(push 1)

(check-sat)

