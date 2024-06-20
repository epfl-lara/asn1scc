; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59502 () Bool)

(assert start!59502)

(declare-fun b!272000 () Bool)

(declare-datatypes ((Unit!19153 0))(
  ( (Unit!19154) )
))
(declare-fun e!191852 () Unit!19153)

(declare-fun Unit!19155 () Unit!19153)

(assert (=> b!272000 (= e!191852 Unit!19155)))

(declare-fun b!272001 () Bool)

(declare-fun e!191847 () Bool)

(declare-datatypes ((array!15165 0))(
  ( (array!15166 (arr!7581 (Array (_ BitVec 32) (_ BitVec 8))) (size!6594 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12002 0))(
  ( (BitStream!12003 (buf!7062 array!15165) (currentByte!13054 (_ BitVec 32)) (currentBit!13049 (_ BitVec 32))) )
))
(declare-fun w1!591 () BitStream!12002)

(declare-fun array_inv!6318 (array!15165) Bool)

(assert (=> b!272001 (= e!191847 (array_inv!6318 (buf!7062 w1!591)))))

(declare-fun b!272002 () Bool)

(declare-fun e!191853 () Bool)

(declare-fun w3!25 () BitStream!12002)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!272002 (= e!191853 (byteRangesEq!0 (select (arr!7581 (buf!7062 w1!591)) (currentByte!13054 w1!591)) (select (arr!7581 (buf!7062 w3!25)) (currentByte!13054 w1!591)) #b00000000000000000000000000000000 (currentBit!13049 w1!591)))))

(declare-fun b!272003 () Bool)

(declare-fun e!191854 () Bool)

(assert (=> b!272003 (= e!191854 (not (or (bvsge (currentByte!13054 w1!591) (size!6594 (buf!7062 w1!591))) (and (bvsge (currentByte!13054 w1!591) #b00000000000000000000000000000000) (bvslt (currentByte!13054 w1!591) (size!6594 (buf!7062 w3!25)))))))))

(declare-fun lt!410131 () Unit!19153)

(assert (=> b!272003 (= lt!410131 e!191852)))

(declare-fun c!12522 () Bool)

(declare-fun w2!587 () BitStream!12002)

(assert (=> b!272003 (= c!12522 (and (bvslt (currentByte!13054 w1!591) (size!6594 (buf!7062 w1!591))) (bvslt (currentByte!13054 w1!591) (currentByte!13054 w2!587))))))

(declare-fun e!191848 () Bool)

(assert (=> b!272003 e!191848))

(declare-fun res!226557 () Bool)

(assert (=> b!272003 (=> (not res!226557) (not e!191848))))

(declare-fun arrayRangesEq!1126 (array!15165 array!15165 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!272003 (= res!226557 (arrayRangesEq!1126 (buf!7062 w1!591) (buf!7062 w3!25) #b00000000000000000000000000000000 (currentByte!13054 w1!591)))))

(declare-fun lt!410132 () Unit!19153)

(declare-fun arrayRangesEqTransitive!389 (array!15165 array!15165 array!15165 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19153)

(assert (=> b!272003 (= lt!410132 (arrayRangesEqTransitive!389 (buf!7062 w1!591) (buf!7062 w2!587) (buf!7062 w3!25) #b00000000000000000000000000000000 (currentByte!13054 w1!591) (currentByte!13054 w2!587)))))

(declare-fun b!272004 () Bool)

(declare-fun e!191855 () Bool)

(assert (=> b!272004 (= e!191855 (array_inv!6318 (buf!7062 w2!587)))))

(declare-fun b!272005 () Bool)

(declare-fun Unit!19156 () Unit!19153)

(assert (=> b!272005 (= e!191852 Unit!19156)))

(declare-fun lt!410130 () Unit!19153)

(declare-fun arrayRangesEqImpliesEq!177 (array!15165 array!15165 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19153)

(assert (=> b!272005 (= lt!410130 (arrayRangesEqImpliesEq!177 (buf!7062 w2!587) (buf!7062 w3!25) #b00000000000000000000000000000000 (currentByte!13054 w1!591) (currentByte!13054 w2!587)))))

(declare-fun res!226555 () Bool)

(assert (=> b!272005 (= res!226555 (= (select (arr!7581 (buf!7062 w2!587)) (currentByte!13054 w1!591)) (select (arr!7581 (buf!7062 w3!25)) (currentByte!13054 w1!591))))))

(assert (=> b!272005 (=> (not res!226555) (not e!191853))))

(assert (=> b!272005 e!191853))

(declare-fun b!272006 () Bool)

(declare-fun e!191851 () Bool)

(assert (=> b!272006 (= e!191851 (byteRangesEq!0 (select (arr!7581 (buf!7062 w1!591)) (currentByte!13054 w1!591)) (select (arr!7581 (buf!7062 w3!25)) (currentByte!13054 w1!591)) #b00000000000000000000000000000000 (currentBit!13049 w1!591)))))

(declare-fun b!272007 () Bool)

(assert (=> b!272007 (= e!191848 e!191851)))

(declare-fun res!226558 () Bool)

(assert (=> b!272007 (=> res!226558 e!191851)))

(assert (=> b!272007 (= res!226558 (or (bvsge (currentByte!13054 w1!591) (size!6594 (buf!7062 w1!591))) (bvslt (currentByte!13054 w1!591) (currentByte!13054 w2!587))))))

(declare-fun b!272008 () Bool)

(declare-fun res!226556 () Bool)

(assert (=> b!272008 (=> (not res!226556) (not e!191854))))

(declare-fun isPrefixOf!0 (BitStream!12002 BitStream!12002) Bool)

(assert (=> b!272008 (= res!226556 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun res!226554 () Bool)

(assert (=> start!59502 (=> (not res!226554) (not e!191854))))

(assert (=> start!59502 (= res!226554 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!59502 e!191854))

(declare-fun inv!12 (BitStream!12002) Bool)

(assert (=> start!59502 (and (inv!12 w1!591) e!191847)))

(assert (=> start!59502 (and (inv!12 w2!587) e!191855)))

(declare-fun e!191850 () Bool)

(assert (=> start!59502 (and (inv!12 w3!25) e!191850)))

(declare-fun b!272009 () Bool)

(assert (=> b!272009 (= e!191850 (array_inv!6318 (buf!7062 w3!25)))))

(assert (= (and start!59502 res!226554) b!272008))

(assert (= (and b!272008 res!226556) b!272003))

(assert (= (and b!272003 res!226557) b!272007))

(assert (= (and b!272007 (not res!226558)) b!272006))

(assert (= (and b!272003 c!12522) b!272005))

(assert (= (and b!272003 (not c!12522)) b!272000))

(assert (= (and b!272005 res!226555) b!272002))

(assert (= start!59502 b!272001))

(assert (= start!59502 b!272004))

(assert (= start!59502 b!272009))

(declare-fun m!404607 () Bool)

(assert (=> b!272005 m!404607))

(declare-fun m!404609 () Bool)

(assert (=> b!272005 m!404609))

(declare-fun m!404611 () Bool)

(assert (=> b!272005 m!404611))

(declare-fun m!404613 () Bool)

(assert (=> b!272002 m!404613))

(assert (=> b!272002 m!404611))

(assert (=> b!272002 m!404613))

(assert (=> b!272002 m!404611))

(declare-fun m!404615 () Bool)

(assert (=> b!272002 m!404615))

(declare-fun m!404617 () Bool)

(assert (=> b!272001 m!404617))

(assert (=> b!272006 m!404613))

(assert (=> b!272006 m!404611))

(assert (=> b!272006 m!404613))

(assert (=> b!272006 m!404611))

(assert (=> b!272006 m!404615))

(declare-fun m!404619 () Bool)

(assert (=> b!272009 m!404619))

(declare-fun m!404621 () Bool)

(assert (=> b!272004 m!404621))

(declare-fun m!404623 () Bool)

(assert (=> b!272003 m!404623))

(declare-fun m!404625 () Bool)

(assert (=> b!272003 m!404625))

(declare-fun m!404627 () Bool)

(assert (=> start!59502 m!404627))

(declare-fun m!404629 () Bool)

(assert (=> start!59502 m!404629))

(declare-fun m!404631 () Bool)

(assert (=> start!59502 m!404631))

(declare-fun m!404633 () Bool)

(assert (=> start!59502 m!404633))

(declare-fun m!404635 () Bool)

(assert (=> b!272008 m!404635))

(push 1)

(assert (not b!272003))

(assert (not b!272008))

(assert (not start!59502))

(assert (not b!272001))

(assert (not b!272004))

(assert (not b!272002))

(assert (not b!272006))

(assert (not b!272005))

(assert (not b!272009))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!92958 () Bool)

(assert (=> d!92958 (= (byteRangesEq!0 (select (arr!7581 (buf!7062 w1!591)) (currentByte!13054 w1!591)) (select (arr!7581 (buf!7062 w3!25)) (currentByte!13054 w1!591)) #b00000000000000000000000000000000 (currentBit!13049 w1!591)) (or (= #b00000000000000000000000000000000 (currentBit!13049 w1!591)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7581 (buf!7062 w1!591)) (currentByte!13054 w1!591))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!13049 w1!591)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7581 (buf!7062 w3!25)) (currentByte!13054 w1!591))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!13049 w1!591)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!23442 () Bool)

(assert (= bs!23442 d!92958))

(declare-fun m!404681 () Bool)

(assert (=> bs!23442 m!404681))

(declare-fun m!404683 () Bool)

(assert (=> bs!23442 m!404683))

(assert (=> b!272002 d!92958))

(declare-fun d!92978 () Bool)

(declare-fun res!226601 () Bool)

(declare-fun e!191891 () Bool)

(assert (=> d!92978 (=> (not res!226601) (not e!191891))))

(assert (=> d!92978 (= res!226601 (= (size!6594 (buf!7062 w2!587)) (size!6594 (buf!7062 w3!25))))))

(assert (=> d!92978 (= (isPrefixOf!0 w2!587 w3!25) e!191891)))

(declare-fun b!272052 () Bool)

(declare-fun res!226603 () Bool)

(assert (=> b!272052 (=> (not res!226603) (not e!191891))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!272052 (= res!226603 (bvsle (bitIndex!0 (size!6594 (buf!7062 w2!587)) (currentByte!13054 w2!587) (currentBit!13049 w2!587)) (bitIndex!0 (size!6594 (buf!7062 w3!25)) (currentByte!13054 w3!25) (currentBit!13049 w3!25))))))

(declare-fun b!272053 () Bool)

(declare-fun e!191890 () Bool)

(assert (=> b!272053 (= e!191891 e!191890)))

(declare-fun res!226602 () Bool)

(assert (=> b!272053 (=> res!226602 e!191890)))

(assert (=> b!272053 (= res!226602 (= (size!6594 (buf!7062 w2!587)) #b00000000000000000000000000000000))))

(declare-fun b!272054 () Bool)

(declare-fun arrayBitRangesEq!0 (array!15165 array!15165 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!272054 (= e!191890 (arrayBitRangesEq!0 (buf!7062 w2!587) (buf!7062 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6594 (buf!7062 w2!587)) (currentByte!13054 w2!587) (currentBit!13049 w2!587))))))

(assert (= (and d!92978 res!226601) b!272052))

(assert (= (and b!272052 res!226603) b!272053))

(assert (= (and b!272053 (not res!226602)) b!272054))

(declare-fun m!404699 () Bool)

(assert (=> b!272052 m!404699))

(declare-fun m!404701 () Bool)

(assert (=> b!272052 m!404701))

(assert (=> b!272054 m!404699))

(assert (=> b!272054 m!404699))

(declare-fun m!404703 () Bool)

(assert (=> b!272054 m!404703))

(assert (=> b!272008 d!92978))

(declare-fun d!92986 () Bool)

(declare-fun res!226608 () Bool)

(declare-fun e!191896 () Bool)

(assert (=> d!92986 (=> res!226608 e!191896)))

(assert (=> d!92986 (= res!226608 (= #b00000000000000000000000000000000 (currentByte!13054 w1!591)))))

(assert (=> d!92986 (= (arrayRangesEq!1126 (buf!7062 w1!591) (buf!7062 w3!25) #b00000000000000000000000000000000 (currentByte!13054 w1!591)) e!191896)))

(declare-fun b!272059 () Bool)

(declare-fun e!191897 () Bool)

(assert (=> b!272059 (= e!191896 e!191897)))

(declare-fun res!226609 () Bool)

(assert (=> b!272059 (=> (not res!226609) (not e!191897))))

(assert (=> b!272059 (= res!226609 (= (select (arr!7581 (buf!7062 w1!591)) #b00000000000000000000000000000000) (select (arr!7581 (buf!7062 w3!25)) #b00000000000000000000000000000000)))))

(declare-fun b!272060 () Bool)

(assert (=> b!272060 (= e!191897 (arrayRangesEq!1126 (buf!7062 w1!591) (buf!7062 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!13054 w1!591)))))

(assert (= (and d!92986 (not res!226608)) b!272059))

(assert (= (and b!272059 res!226609) b!272060))

(declare-fun m!404707 () Bool)

(assert (=> b!272059 m!404707))

(declare-fun m!404709 () Bool)

(assert (=> b!272059 m!404709))

(declare-fun m!404711 () Bool)

(assert (=> b!272060 m!404711))

(assert (=> b!272003 d!92986))

(declare-fun d!92988 () Bool)

(assert (=> d!92988 (arrayRangesEq!1126 (buf!7062 w1!591) (buf!7062 w3!25) #b00000000000000000000000000000000 (currentByte!13054 w1!591))))

(declare-fun lt!410147 () Unit!19153)

(declare-fun choose!440 (array!15165 array!15165 array!15165 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19153)

(assert (=> d!92988 (= lt!410147 (choose!440 (buf!7062 w1!591) (buf!7062 w2!587) (buf!7062 w3!25) #b00000000000000000000000000000000 (currentByte!13054 w1!591) (currentByte!13054 w2!587)))))

(assert (=> d!92988 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!13054 w1!591)) (bvsle (currentByte!13054 w1!591) (currentByte!13054 w2!587)))))

(assert (=> d!92988 (= (arrayRangesEqTransitive!389 (buf!7062 w1!591) (buf!7062 w2!587) (buf!7062 w3!25) #b00000000000000000000000000000000 (currentByte!13054 w1!591) (currentByte!13054 w2!587)) lt!410147)))

(declare-fun bs!23447 () Bool)

(assert (= bs!23447 d!92988))

(assert (=> bs!23447 m!404623))

(declare-fun m!404713 () Bool)

(assert (=> bs!23447 m!404713))

(assert (=> b!272003 d!92988))

