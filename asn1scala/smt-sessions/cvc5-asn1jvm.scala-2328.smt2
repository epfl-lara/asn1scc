; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59450 () Bool)

(assert start!59450)

(declare-fun b!271796 () Bool)

(declare-fun e!191648 () Bool)

(declare-datatypes ((array!15152 0))(
  ( (array!15153 (arr!7576 (Array (_ BitVec 32) (_ BitVec 8))) (size!6589 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11992 0))(
  ( (BitStream!11993 (buf!7057 array!15152) (currentByte!13049 (_ BitVec 32)) (currentBit!13044 (_ BitVec 32))) )
))
(declare-fun w2!587 () BitStream!11992)

(declare-fun array_inv!6313 (array!15152) Bool)

(assert (=> b!271796 (= e!191648 (array_inv!6313 (buf!7057 w2!587)))))

(declare-fun b!271797 () Bool)

(declare-fun e!191646 () Bool)

(declare-fun e!191640 () Bool)

(assert (=> b!271797 (= e!191646 e!191640)))

(declare-fun res!226427 () Bool)

(assert (=> b!271797 (=> res!226427 e!191640)))

(declare-fun w1!591 () BitStream!11992)

(assert (=> b!271797 (= res!226427 (or (bvsge (currentByte!13049 w1!591) (size!6589 (buf!7057 w1!591))) (bvslt (currentByte!13049 w1!591) (currentByte!13049 w2!587))))))

(declare-fun b!271798 () Bool)

(declare-fun res!226429 () Bool)

(declare-fun e!191649 () Bool)

(assert (=> b!271798 (=> (not res!226429) (not e!191649))))

(declare-fun w3!25 () BitStream!11992)

(declare-fun isPrefixOf!0 (BitStream!11992 BitStream!11992) Bool)

(assert (=> b!271798 (= res!226429 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun b!271799 () Bool)

(declare-fun e!191647 () Bool)

(assert (=> b!271799 (= e!191647 (array_inv!6313 (buf!7057 w3!25)))))

(declare-fun b!271800 () Bool)

(assert (=> b!271800 (= e!191649 (not (or (bvsge (currentByte!13049 w1!591) (size!6589 (buf!7057 w1!591))) (bvsge (currentByte!13049 w1!591) #b00000000000000000000000000000000))))))

(declare-datatypes ((Unit!19133 0))(
  ( (Unit!19134) )
))
(declare-fun lt!410067 () Unit!19133)

(declare-fun e!191641 () Unit!19133)

(assert (=> b!271800 (= lt!410067 e!191641)))

(declare-fun c!12507 () Bool)

(assert (=> b!271800 (= c!12507 (and (bvslt (currentByte!13049 w1!591) (size!6589 (buf!7057 w1!591))) (bvslt (currentByte!13049 w1!591) (currentByte!13049 w2!587))))))

(assert (=> b!271800 e!191646))

(declare-fun res!226426 () Bool)

(assert (=> b!271800 (=> (not res!226426) (not e!191646))))

(declare-fun arrayRangesEq!1121 (array!15152 array!15152 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!271800 (= res!226426 (arrayRangesEq!1121 (buf!7057 w1!591) (buf!7057 w3!25) #b00000000000000000000000000000000 (currentByte!13049 w1!591)))))

(declare-fun lt!410068 () Unit!19133)

(declare-fun arrayRangesEqTransitive!384 (array!15152 array!15152 array!15152 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19133)

(assert (=> b!271800 (= lt!410068 (arrayRangesEqTransitive!384 (buf!7057 w1!591) (buf!7057 w2!587) (buf!7057 w3!25) #b00000000000000000000000000000000 (currentByte!13049 w1!591) (currentByte!13049 w2!587)))))

(declare-fun res!226425 () Bool)

(assert (=> start!59450 (=> (not res!226425) (not e!191649))))

(assert (=> start!59450 (= res!226425 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!59450 e!191649))

(declare-fun e!191644 () Bool)

(declare-fun inv!12 (BitStream!11992) Bool)

(assert (=> start!59450 (and (inv!12 w1!591) e!191644)))

(assert (=> start!59450 (and (inv!12 w2!587) e!191648)))

(assert (=> start!59450 (and (inv!12 w3!25) e!191647)))

(declare-fun b!271801 () Bool)

(assert (=> b!271801 (= e!191644 (array_inv!6313 (buf!7057 w1!591)))))

(declare-fun b!271802 () Bool)

(declare-fun Unit!19135 () Unit!19133)

(assert (=> b!271802 (= e!191641 Unit!19135)))

(declare-fun lt!410069 () Unit!19133)

(declare-fun arrayRangesEqImpliesEq!172 (array!15152 array!15152 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19133)

(assert (=> b!271802 (= lt!410069 (arrayRangesEqImpliesEq!172 (buf!7057 w2!587) (buf!7057 w3!25) #b00000000000000000000000000000000 (currentByte!13049 w1!591) (currentByte!13049 w2!587)))))

(declare-fun res!226428 () Bool)

(assert (=> b!271802 (= res!226428 (= (select (arr!7576 (buf!7057 w2!587)) (currentByte!13049 w1!591)) (select (arr!7576 (buf!7057 w3!25)) (currentByte!13049 w1!591))))))

(declare-fun e!191650 () Bool)

(assert (=> b!271802 (=> (not res!226428) (not e!191650))))

(assert (=> b!271802 e!191650))

(declare-fun b!271803 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!271803 (= e!191640 (byteRangesEq!0 (select (arr!7576 (buf!7057 w1!591)) (currentByte!13049 w1!591)) (select (arr!7576 (buf!7057 w3!25)) (currentByte!13049 w1!591)) #b00000000000000000000000000000000 (currentBit!13044 w1!591)))))

(declare-fun b!271804 () Bool)

(assert (=> b!271804 (= e!191650 (byteRangesEq!0 (select (arr!7576 (buf!7057 w1!591)) (currentByte!13049 w1!591)) (select (arr!7576 (buf!7057 w3!25)) (currentByte!13049 w1!591)) #b00000000000000000000000000000000 (currentBit!13044 w1!591)))))

(declare-fun b!271805 () Bool)

(declare-fun Unit!19136 () Unit!19133)

(assert (=> b!271805 (= e!191641 Unit!19136)))

(assert (= (and start!59450 res!226425) b!271798))

(assert (= (and b!271798 res!226429) b!271800))

(assert (= (and b!271800 res!226426) b!271797))

(assert (= (and b!271797 (not res!226427)) b!271803))

(assert (= (and b!271800 c!12507) b!271802))

(assert (= (and b!271800 (not c!12507)) b!271805))

(assert (= (and b!271802 res!226428) b!271804))

(assert (= start!59450 b!271801))

(assert (= start!59450 b!271796))

(assert (= start!59450 b!271799))

(declare-fun m!404367 () Bool)

(assert (=> b!271796 m!404367))

(declare-fun m!404369 () Bool)

(assert (=> b!271799 m!404369))

(declare-fun m!404371 () Bool)

(assert (=> b!271800 m!404371))

(declare-fun m!404373 () Bool)

(assert (=> b!271800 m!404373))

(declare-fun m!404375 () Bool)

(assert (=> b!271802 m!404375))

(declare-fun m!404377 () Bool)

(assert (=> b!271802 m!404377))

(declare-fun m!404379 () Bool)

(assert (=> b!271802 m!404379))

(declare-fun m!404381 () Bool)

(assert (=> b!271803 m!404381))

(assert (=> b!271803 m!404379))

(assert (=> b!271803 m!404381))

(assert (=> b!271803 m!404379))

(declare-fun m!404383 () Bool)

(assert (=> b!271803 m!404383))

(assert (=> b!271804 m!404381))

(assert (=> b!271804 m!404379))

(assert (=> b!271804 m!404381))

(assert (=> b!271804 m!404379))

(assert (=> b!271804 m!404383))

(declare-fun m!404385 () Bool)

(assert (=> b!271798 m!404385))

(declare-fun m!404387 () Bool)

(assert (=> b!271801 m!404387))

(declare-fun m!404389 () Bool)

(assert (=> start!59450 m!404389))

(declare-fun m!404391 () Bool)

(assert (=> start!59450 m!404391))

(declare-fun m!404393 () Bool)

(assert (=> start!59450 m!404393))

(declare-fun m!404395 () Bool)

(assert (=> start!59450 m!404395))

(push 1)

(assert (not b!271800))

(assert (not b!271796))

(assert (not start!59450))

(assert (not b!271798))

(assert (not b!271803))

(assert (not b!271801))

(assert (not b!271802))

(assert (not b!271799))

(assert (not b!271804))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!92868 () Bool)

(declare-fun res!226486 () Bool)

(declare-fun e!191735 () Bool)

(assert (=> d!92868 (=> (not res!226486) (not e!191735))))

(assert (=> d!92868 (= res!226486 (= (size!6589 (buf!7057 w2!587)) (size!6589 (buf!7057 w3!25))))))

(assert (=> d!92868 (= (isPrefixOf!0 w2!587 w3!25) e!191735)))

(declare-fun b!271890 () Bool)

(declare-fun res!226484 () Bool)

(assert (=> b!271890 (=> (not res!226484) (not e!191735))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!271890 (= res!226484 (bvsle (bitIndex!0 (size!6589 (buf!7057 w2!587)) (currentByte!13049 w2!587) (currentBit!13044 w2!587)) (bitIndex!0 (size!6589 (buf!7057 w3!25)) (currentByte!13049 w3!25) (currentBit!13044 w3!25))))))

(declare-fun b!271891 () Bool)

(declare-fun e!191736 () Bool)

(assert (=> b!271891 (= e!191735 e!191736)))

(declare-fun res!226485 () Bool)

(assert (=> b!271891 (=> res!226485 e!191736)))

(assert (=> b!271891 (= res!226485 (= (size!6589 (buf!7057 w2!587)) #b00000000000000000000000000000000))))

(declare-fun b!271892 () Bool)

(declare-fun arrayBitRangesEq!0 (array!15152 array!15152 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!271892 (= e!191736 (arrayBitRangesEq!0 (buf!7057 w2!587) (buf!7057 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6589 (buf!7057 w2!587)) (currentByte!13049 w2!587) (currentBit!13044 w2!587))))))

(assert (= (and d!92868 res!226486) b!271890))

(assert (= (and b!271890 res!226484) b!271891))

(assert (= (and b!271891 (not res!226485)) b!271892))

(declare-fun m!404477 () Bool)

(assert (=> b!271890 m!404477))

(declare-fun m!404479 () Bool)

(assert (=> b!271890 m!404479))

(assert (=> b!271892 m!404477))

(assert (=> b!271892 m!404477))

(declare-fun m!404483 () Bool)

(assert (=> b!271892 m!404483))

(assert (=> b!271798 d!92868))

(declare-fun d!92880 () Bool)

(assert (=> d!92880 (= (byteRangesEq!0 (select (arr!7576 (buf!7057 w1!591)) (currentByte!13049 w1!591)) (select (arr!7576 (buf!7057 w3!25)) (currentByte!13049 w1!591)) #b00000000000000000000000000000000 (currentBit!13044 w1!591)) (or (= #b00000000000000000000000000000000 (currentBit!13044 w1!591)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7576 (buf!7057 w1!591)) (currentByte!13049 w1!591))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!13044 w1!591)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7576 (buf!7057 w3!25)) (currentByte!13049 w1!591))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!13044 w1!591)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!23421 () Bool)

(assert (= bs!23421 d!92880))

(declare-fun m!404499 () Bool)

(assert (=> bs!23421 m!404499))

(declare-fun m!404501 () Bool)

(assert (=> bs!23421 m!404501))

(assert (=> b!271803 d!92880))

(assert (=> b!271804 d!92880))

(declare-fun d!92894 () Bool)

(assert (=> d!92894 (= (array_inv!6313 (buf!7057 w3!25)) (bvsge (size!6589 (buf!7057 w3!25)) #b00000000000000000000000000000000))))

(assert (=> b!271799 d!92894))

(declare-fun d!92898 () Bool)

(declare-fun res!226491 () Bool)

(declare-fun e!191741 () Bool)

(assert (=> d!92898 (=> res!226491 e!191741)))

(assert (=> d!92898 (= res!226491 (= #b00000000000000000000000000000000 (currentByte!13049 w1!591)))))

(assert (=> d!92898 (= (arrayRangesEq!1121 (buf!7057 w1!591) (buf!7057 w3!25) #b00000000000000000000000000000000 (currentByte!13049 w1!591)) e!191741)))

(declare-fun b!271897 () Bool)

(declare-fun e!191742 () Bool)

(assert (=> b!271897 (= e!191741 e!191742)))

(declare-fun res!226492 () Bool)

(assert (=> b!271897 (=> (not res!226492) (not e!191742))))

(assert (=> b!271897 (= res!226492 (= (select (arr!7576 (buf!7057 w1!591)) #b00000000000000000000000000000000) (select (arr!7576 (buf!7057 w3!25)) #b00000000000000000000000000000000)))))

(declare-fun b!271898 () Bool)

(assert (=> b!271898 (= e!191742 (arrayRangesEq!1121 (buf!7057 w1!591) (buf!7057 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!13049 w1!591)))))

(assert (= (and d!92898 (not res!226491)) b!271897))

(assert (= (and b!271897 res!226492) b!271898))

(declare-fun m!404503 () Bool)

(assert (=> b!271897 m!404503))

(declare-fun m!404505 () Bool)

(assert (=> b!271897 m!404505))

(declare-fun m!404507 () Bool)

(assert (=> b!271898 m!404507))

(assert (=> b!271800 d!92898))

(declare-fun d!92900 () Bool)

(assert (=> d!92900 (arrayRangesEq!1121 (buf!7057 w1!591) (buf!7057 w3!25) #b00000000000000000000000000000000 (currentByte!13049 w1!591))))

(declare-fun lt!410099 () Unit!19133)

(declare-fun choose!435 (array!15152 array!15152 array!15152 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19133)

(assert (=> d!92900 (= lt!410099 (choose!435 (buf!7057 w1!591) (buf!7057 w2!587) (buf!7057 w3!25) #b00000000000000000000000000000000 (currentByte!13049 w1!591) (currentByte!13049 w2!587)))))

