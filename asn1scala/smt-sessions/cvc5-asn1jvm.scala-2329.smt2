; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59498 () Bool)

(assert start!59498)

(declare-fun b!271940 () Bool)

(declare-fun e!191781 () Bool)

(declare-datatypes ((array!15161 0))(
  ( (array!15162 (arr!7579 (Array (_ BitVec 32) (_ BitVec 8))) (size!6592 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11998 0))(
  ( (BitStream!11999 (buf!7060 array!15161) (currentByte!13052 (_ BitVec 32)) (currentBit!13047 (_ BitVec 32))) )
))
(declare-fun w1!591 () BitStream!11998)

(declare-fun w3!25 () BitStream!11998)

(assert (=> b!271940 (= e!191781 (not (or (bvsge (currentByte!13052 w1!591) (size!6592 (buf!7060 w1!591))) (and (bvsge (currentByte!13052 w1!591) #b00000000000000000000000000000000) (bvslt (currentByte!13052 w1!591) (size!6592 (buf!7060 w3!25)))))))))

(declare-datatypes ((Unit!19145 0))(
  ( (Unit!19146) )
))
(declare-fun lt!410114 () Unit!19145)

(declare-fun e!191786 () Unit!19145)

(assert (=> b!271940 (= lt!410114 e!191786)))

(declare-fun c!12516 () Bool)

(declare-fun w2!587 () BitStream!11998)

(assert (=> b!271940 (= c!12516 (and (bvslt (currentByte!13052 w1!591) (size!6592 (buf!7060 w1!591))) (bvslt (currentByte!13052 w1!591) (currentByte!13052 w2!587))))))

(declare-fun e!191782 () Bool)

(assert (=> b!271940 e!191782))

(declare-fun res!226527 () Bool)

(assert (=> b!271940 (=> (not res!226527) (not e!191782))))

(declare-fun arrayRangesEq!1124 (array!15161 array!15161 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!271940 (= res!226527 (arrayRangesEq!1124 (buf!7060 w1!591) (buf!7060 w3!25) #b00000000000000000000000000000000 (currentByte!13052 w1!591)))))

(declare-fun lt!410113 () Unit!19145)

(declare-fun arrayRangesEqTransitive!387 (array!15161 array!15161 array!15161 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19145)

(assert (=> b!271940 (= lt!410113 (arrayRangesEqTransitive!387 (buf!7060 w1!591) (buf!7060 w2!587) (buf!7060 w3!25) #b00000000000000000000000000000000 (currentByte!13052 w1!591) (currentByte!13052 w2!587)))))

(declare-fun b!271941 () Bool)

(declare-fun Unit!19147 () Unit!19145)

(assert (=> b!271941 (= e!191786 Unit!19147)))

(declare-fun b!271942 () Bool)

(declare-fun e!191789 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!271942 (= e!191789 (byteRangesEq!0 (select (arr!7579 (buf!7060 w1!591)) (currentByte!13052 w1!591)) (select (arr!7579 (buf!7060 w3!25)) (currentByte!13052 w1!591)) #b00000000000000000000000000000000 (currentBit!13047 w1!591)))))

(declare-fun res!226524 () Bool)

(assert (=> start!59498 (=> (not res!226524) (not e!191781))))

(declare-fun isPrefixOf!0 (BitStream!11998 BitStream!11998) Bool)

(assert (=> start!59498 (= res!226524 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!59498 e!191781))

(declare-fun e!191788 () Bool)

(declare-fun inv!12 (BitStream!11998) Bool)

(assert (=> start!59498 (and (inv!12 w1!591) e!191788)))

(declare-fun e!191783 () Bool)

(assert (=> start!59498 (and (inv!12 w2!587) e!191783)))

(declare-fun e!191785 () Bool)

(assert (=> start!59498 (and (inv!12 w3!25) e!191785)))

(declare-fun b!271943 () Bool)

(declare-fun array_inv!6316 (array!15161) Bool)

(assert (=> b!271943 (= e!191783 (array_inv!6316 (buf!7060 w2!587)))))

(declare-fun b!271944 () Bool)

(declare-fun res!226528 () Bool)

(assert (=> b!271944 (=> (not res!226528) (not e!191781))))

(assert (=> b!271944 (= res!226528 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun b!271945 () Bool)

(assert (=> b!271945 (= e!191788 (array_inv!6316 (buf!7060 w1!591)))))

(declare-fun b!271946 () Bool)

(declare-fun e!191791 () Bool)

(assert (=> b!271946 (= e!191791 (byteRangesEq!0 (select (arr!7579 (buf!7060 w1!591)) (currentByte!13052 w1!591)) (select (arr!7579 (buf!7060 w3!25)) (currentByte!13052 w1!591)) #b00000000000000000000000000000000 (currentBit!13047 w1!591)))))

(declare-fun b!271947 () Bool)

(declare-fun Unit!19148 () Unit!19145)

(assert (=> b!271947 (= e!191786 Unit!19148)))

(declare-fun lt!410112 () Unit!19145)

(declare-fun arrayRangesEqImpliesEq!175 (array!15161 array!15161 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19145)

(assert (=> b!271947 (= lt!410112 (arrayRangesEqImpliesEq!175 (buf!7060 w2!587) (buf!7060 w3!25) #b00000000000000000000000000000000 (currentByte!13052 w1!591) (currentByte!13052 w2!587)))))

(declare-fun res!226525 () Bool)

(assert (=> b!271947 (= res!226525 (= (select (arr!7579 (buf!7060 w2!587)) (currentByte!13052 w1!591)) (select (arr!7579 (buf!7060 w3!25)) (currentByte!13052 w1!591))))))

(assert (=> b!271947 (=> (not res!226525) (not e!191789))))

(assert (=> b!271947 e!191789))

(declare-fun b!271948 () Bool)

(assert (=> b!271948 (= e!191782 e!191791)))

(declare-fun res!226526 () Bool)

(assert (=> b!271948 (=> res!226526 e!191791)))

(assert (=> b!271948 (= res!226526 (or (bvsge (currentByte!13052 w1!591) (size!6592 (buf!7060 w1!591))) (bvslt (currentByte!13052 w1!591) (currentByte!13052 w2!587))))))

(declare-fun b!271949 () Bool)

(assert (=> b!271949 (= e!191785 (array_inv!6316 (buf!7060 w3!25)))))

(assert (= (and start!59498 res!226524) b!271944))

(assert (= (and b!271944 res!226528) b!271940))

(assert (= (and b!271940 res!226527) b!271948))

(assert (= (and b!271948 (not res!226526)) b!271946))

(assert (= (and b!271940 c!12516) b!271947))

(assert (= (and b!271940 (not c!12516)) b!271941))

(assert (= (and b!271947 res!226525) b!271942))

(assert (= start!59498 b!271945))

(assert (= start!59498 b!271943))

(assert (= start!59498 b!271949))

(declare-fun m!404547 () Bool)

(assert (=> b!271946 m!404547))

(declare-fun m!404549 () Bool)

(assert (=> b!271946 m!404549))

(assert (=> b!271946 m!404547))

(assert (=> b!271946 m!404549))

(declare-fun m!404551 () Bool)

(assert (=> b!271946 m!404551))

(declare-fun m!404553 () Bool)

(assert (=> b!271944 m!404553))

(assert (=> b!271942 m!404547))

(assert (=> b!271942 m!404549))

(assert (=> b!271942 m!404547))

(assert (=> b!271942 m!404549))

(assert (=> b!271942 m!404551))

(declare-fun m!404555 () Bool)

(assert (=> b!271949 m!404555))

(declare-fun m!404557 () Bool)

(assert (=> b!271945 m!404557))

(declare-fun m!404559 () Bool)

(assert (=> b!271947 m!404559))

(declare-fun m!404561 () Bool)

(assert (=> b!271947 m!404561))

(assert (=> b!271947 m!404549))

(declare-fun m!404563 () Bool)

(assert (=> start!59498 m!404563))

(declare-fun m!404565 () Bool)

(assert (=> start!59498 m!404565))

(declare-fun m!404567 () Bool)

(assert (=> start!59498 m!404567))

(declare-fun m!404569 () Bool)

(assert (=> start!59498 m!404569))

(declare-fun m!404571 () Bool)

(assert (=> b!271940 m!404571))

(declare-fun m!404573 () Bool)

(assert (=> b!271940 m!404573))

(declare-fun m!404575 () Bool)

(assert (=> b!271943 m!404575))

(push 1)

(assert (not b!271945))

(assert (not b!271940))

(assert (not b!271943))

(assert (not b!271947))

(assert (not b!271946))

(assert (not b!271944))

(assert (not b!271942))

(assert (not start!59498))

(assert (not b!271949))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!92944 () Bool)

(assert (=> d!92944 (= (array_inv!6316 (buf!7060 w2!587)) (bvsge (size!6592 (buf!7060 w2!587)) #b00000000000000000000000000000000))))

(assert (=> b!271943 d!92944))

(declare-fun d!92946 () Bool)

(assert (=> d!92946 (= (array_inv!6316 (buf!7060 w3!25)) (bvsge (size!6592 (buf!7060 w3!25)) #b00000000000000000000000000000000))))

(assert (=> b!271949 d!92946))

(declare-fun d!92948 () Bool)

(declare-fun res!226580 () Bool)

(declare-fun e!191874 () Bool)

(assert (=> d!92948 (=> (not res!226580) (not e!191874))))

(assert (=> d!92948 (= res!226580 (= (size!6592 (buf!7060 w2!587)) (size!6592 (buf!7060 w3!25))))))

(assert (=> d!92948 (= (isPrefixOf!0 w2!587 w3!25) e!191874)))

(declare-fun b!272031 () Bool)

(declare-fun res!226582 () Bool)

(assert (=> b!272031 (=> (not res!226582) (not e!191874))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!272031 (= res!226582 (bvsle (bitIndex!0 (size!6592 (buf!7060 w2!587)) (currentByte!13052 w2!587) (currentBit!13047 w2!587)) (bitIndex!0 (size!6592 (buf!7060 w3!25)) (currentByte!13052 w3!25) (currentBit!13047 w3!25))))))

(declare-fun b!272032 () Bool)

(declare-fun e!191875 () Bool)

(assert (=> b!272032 (= e!191874 e!191875)))

(declare-fun res!226581 () Bool)

(assert (=> b!272032 (=> res!226581 e!191875)))

(assert (=> b!272032 (= res!226581 (= (size!6592 (buf!7060 w2!587)) #b00000000000000000000000000000000))))

(declare-fun b!272033 () Bool)

(declare-fun arrayBitRangesEq!0 (array!15161 array!15161 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!272033 (= e!191875 (arrayBitRangesEq!0 (buf!7060 w2!587) (buf!7060 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6592 (buf!7060 w2!587)) (currentByte!13052 w2!587) (currentBit!13047 w2!587))))))

(assert (= (and d!92948 res!226580) b!272031))

(assert (= (and b!272031 res!226582) b!272032))

(assert (= (and b!272032 (not res!226581)) b!272033))

(declare-fun m!404659 () Bool)

(assert (=> b!272031 m!404659))

(declare-fun m!404661 () Bool)

(assert (=> b!272031 m!404661))

(assert (=> b!272033 m!404659))

(assert (=> b!272033 m!404659))

(declare-fun m!404663 () Bool)

(assert (=> b!272033 m!404663))

(assert (=> b!271944 d!92948))

(declare-fun d!92962 () Bool)

(declare-fun res!226583 () Bool)

(declare-fun e!191876 () Bool)

(assert (=> d!92962 (=> (not res!226583) (not e!191876))))

(assert (=> d!92962 (= res!226583 (= (size!6592 (buf!7060 w1!591)) (size!6592 (buf!7060 w2!587))))))

(assert (=> d!92962 (= (isPrefixOf!0 w1!591 w2!587) e!191876)))

(declare-fun b!272034 () Bool)

(declare-fun res!226585 () Bool)

(assert (=> b!272034 (=> (not res!226585) (not e!191876))))

(assert (=> b!272034 (= res!226585 (bvsle (bitIndex!0 (size!6592 (buf!7060 w1!591)) (currentByte!13052 w1!591) (currentBit!13047 w1!591)) (bitIndex!0 (size!6592 (buf!7060 w2!587)) (currentByte!13052 w2!587) (currentBit!13047 w2!587))))))

(declare-fun b!272035 () Bool)

(declare-fun e!191877 () Bool)

(assert (=> b!272035 (= e!191876 e!191877)))

(declare-fun res!226584 () Bool)

(assert (=> b!272035 (=> res!226584 e!191877)))

(assert (=> b!272035 (= res!226584 (= (size!6592 (buf!7060 w1!591)) #b00000000000000000000000000000000))))

(declare-fun b!272036 () Bool)

(assert (=> b!272036 (= e!191877 (arrayBitRangesEq!0 (buf!7060 w1!591) (buf!7060 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6592 (buf!7060 w1!591)) (currentByte!13052 w1!591) (currentBit!13047 w1!591))))))

(assert (= (and d!92962 res!226583) b!272034))

(assert (= (and b!272034 res!226585) b!272035))

(assert (= (and b!272035 (not res!226584)) b!272036))

(declare-fun m!404667 () Bool)

(assert (=> b!272034 m!404667))

(assert (=> b!272034 m!404659))

(assert (=> b!272036 m!404667))

(assert (=> b!272036 m!404667))

(declare-fun m!404669 () Bool)

(assert (=> b!272036 m!404669))

(assert (=> start!59498 d!92962))

(declare-fun d!92966 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!92966 (= (inv!12 w1!591) (invariant!0 (currentBit!13047 w1!591) (currentByte!13052 w1!591) (size!6592 (buf!7060 w1!591))))))

(declare-fun bs!23439 () Bool)

(assert (= bs!23439 d!92966))

(declare-fun m!404675 () Bool)

(assert (=> bs!23439 m!404675))

(assert (=> start!59498 d!92966))

(declare-fun d!92970 () Bool)

(assert (=> d!92970 (= (inv!12 w2!587) (invariant!0 (currentBit!13047 w2!587) (currentByte!13052 w2!587) (size!6592 (buf!7060 w2!587))))))

(declare-fun bs!23440 () Bool)

(assert (= bs!23440 d!92970))

(declare-fun m!404677 () Bool)

(assert (=> bs!23440 m!404677))

(assert (=> start!59498 d!92970))

(declare-fun d!92972 () Bool)

(assert (=> d!92972 (= (inv!12 w3!25) (invariant!0 (currentBit!13047 w3!25) (currentByte!13052 w3!25) (size!6592 (buf!7060 w3!25))))))

(declare-fun bs!23441 () Bool)

(assert (= bs!23441 d!92972))

(declare-fun m!404679 () Bool)

(assert (=> bs!23441 m!404679))

(assert (=> start!59498 d!92972))

(declare-fun d!92974 () Bool)

(assert (=> d!92974 (= (array_inv!6316 (buf!7060 w1!591)) (bvsge (size!6592 (buf!7060 w1!591)) #b00000000000000000000000000000000))))

(assert (=> b!271945 d!92974))

(declare-fun d!92976 () Bool)

(declare-fun res!226593 () Bool)

(declare-fun e!191884 () Bool)

(assert (=> d!92976 (=> res!226593 e!191884)))

(assert (=> d!92976 (= res!226593 (= #b00000000000000000000000000000000 (currentByte!13052 w1!591)))))

(assert (=> d!92976 (= (arrayRangesEq!1124 (buf!7060 w1!591) (buf!7060 w3!25) #b00000000000000000000000000000000 (currentByte!13052 w1!591)) e!191884)))

(declare-fun b!272044 () Bool)

(declare-fun e!191885 () Bool)

(assert (=> b!272044 (= e!191884 e!191885)))

(declare-fun res!226594 () Bool)

(assert (=> b!272044 (=> (not res!226594) (not e!191885))))

(assert (=> b!272044 (= res!226594 (= (select (arr!7579 (buf!7060 w1!591)) #b00000000000000000000000000000000) (select (arr!7579 (buf!7060 w3!25)) #b00000000000000000000000000000000)))))

(declare-fun b!272045 () Bool)

(assert (=> b!272045 (= e!191885 (arrayRangesEq!1124 (buf!7060 w1!591) (buf!7060 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!13052 w1!591)))))

(assert (= (and d!92976 (not res!226593)) b!272044))

(assert (= (and b!272044 res!226594) b!272045))

(declare-fun m!404685 () Bool)

(assert (=> b!272044 m!404685))

(declare-fun m!404687 () Bool)

(assert (=> b!272044 m!404687))

(declare-fun m!404689 () Bool)

(assert (=> b!272045 m!404689))

(assert (=> b!271940 d!92976))

(declare-fun d!92980 () Bool)

(assert (=> d!92980 (arrayRangesEq!1124 (buf!7060 w1!591) (buf!7060 w3!25) #b00000000000000000000000000000000 (currentByte!13052 w1!591))))

(declare-fun lt!410141 () Unit!19145)

(declare-fun choose!438 (array!15161 array!15161 array!15161 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19145)

(assert (=> d!92980 (= lt!410141 (choose!438 (buf!7060 w1!591) (buf!7060 w2!587) (buf!7060 w3!25) #b00000000000000000000000000000000 (currentByte!13052 w1!591) (currentByte!13052 w2!587)))))

(assert (=> d!92980 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!13052 w1!591)) (bvsle (currentByte!13052 w1!591) (currentByte!13052 w2!587)))))

(assert (=> d!92980 (= (arrayRangesEqTransitive!387 (buf!7060 w1!591) (buf!7060 w2!587) (buf!7060 w3!25) #b00000000000000000000000000000000 (currentByte!13052 w1!591) (currentByte!13052 w2!587)) lt!410141)))

(declare-fun bs!23444 () Bool)

(assert (= bs!23444 d!92980))

(assert (=> bs!23444 m!404571))

(declare-fun m!404693 () Bool)

(assert (=> bs!23444 m!404693))

(assert (=> b!271940 d!92980))

(declare-fun d!92982 () Bool)

(assert (=> d!92982 (= (byteRangesEq!0 (select (arr!7579 (buf!7060 w1!591)) (currentByte!13052 w1!591)) (select (arr!7579 (buf!7060 w3!25)) (currentByte!13052 w1!591)) #b00000000000000000000000000000000 (currentBit!13047 w1!591)) (or (= #b00000000000000000000000000000000 (currentBit!13047 w1!591)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7579 (buf!7060 w1!591)) (currentByte!13052 w1!591))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!13047 w1!591)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7579 (buf!7060 w3!25)) (currentByte!13052 w1!591))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!13047 w1!591)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!23445 () Bool)

(assert (= bs!23445 d!92982))

(declare-fun m!404695 () Bool)

(assert (=> bs!23445 m!404695))

(declare-fun m!404697 () Bool)

(assert (=> bs!23445 m!404697))

(assert (=> b!271946 d!92982))

(declare-fun d!92984 () Bool)

(assert (=> d!92984 (and (bvsge (currentByte!13052 w1!591) #b00000000000000000000000000000000) (bvslt (currentByte!13052 w1!591) (size!6592 (buf!7060 w2!587))) (bvslt (currentByte!13052 w1!591) (size!6592 (buf!7060 w3!25))) (= (select (arr!7579 (buf!7060 w2!587)) (currentByte!13052 w1!591)) (select (arr!7579 (buf!7060 w3!25)) (currentByte!13052 w1!591))))))

(declare-fun lt!410144 () Unit!19145)

(declare-fun choose!439 (array!15161 array!15161 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19145)

(assert (=> d!92984 (= lt!410144 (choose!439 (buf!7060 w2!587) (buf!7060 w3!25) #b00000000000000000000000000000000 (currentByte!13052 w1!591) (currentByte!13052 w2!587)))))

(assert (=> d!92984 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!13052 w2!587)))))

(assert (=> d!92984 (= (arrayRangesEqImpliesEq!175 (buf!7060 w2!587) (buf!7060 w3!25) #b00000000000000000000000000000000 (currentByte!13052 w1!591) (currentByte!13052 w2!587)) lt!410144)))

(declare-fun bs!23446 () Bool)

(assert (= bs!23446 d!92984))

(assert (=> bs!23446 m!404561))

(assert (=> bs!23446 m!404549))

(declare-fun m!404705 () Bool)

(assert (=> bs!23446 m!404705))

(assert (=> b!271947 d!92984))

(assert (=> b!271942 d!92982))

(push 1)

(assert (not d!92972))

(assert (not b!272031))

(assert (not b!272045))

(assert (not b!272036))

(assert (not d!92980))

(assert (not b!272033))

(assert (not b!272034))

(assert (not d!92966))

(assert (not d!92970))

(assert (not d!92984))

(check-sat)

(pop 1)

(push 1)

(check-sat)

