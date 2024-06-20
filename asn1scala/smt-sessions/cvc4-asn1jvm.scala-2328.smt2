; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59454 () Bool)

(assert start!59454)

(declare-fun b!271856 () Bool)

(declare-fun e!191716 () Bool)

(declare-datatypes ((array!15156 0))(
  ( (array!15157 (arr!7578 (Array (_ BitVec 32) (_ BitVec 8))) (size!6591 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11996 0))(
  ( (BitStream!11997 (buf!7059 array!15156) (currentByte!13051 (_ BitVec 32)) (currentBit!13046 (_ BitVec 32))) )
))
(declare-fun w1!591 () BitStream!11996)

(declare-fun w3!25 () BitStream!11996)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!271856 (= e!191716 (byteRangesEq!0 (select (arr!7578 (buf!7059 w1!591)) (currentByte!13051 w1!591)) (select (arr!7578 (buf!7059 w3!25)) (currentByte!13051 w1!591)) #b00000000000000000000000000000000 (currentBit!13046 w1!591)))))

(declare-fun b!271857 () Bool)

(declare-datatypes ((Unit!19141 0))(
  ( (Unit!19142) )
))
(declare-fun e!191707 () Unit!19141)

(declare-fun Unit!19143 () Unit!19141)

(assert (=> b!271857 (= e!191707 Unit!19143)))

(declare-fun w2!587 () BitStream!11996)

(declare-fun lt!410086 () Unit!19141)

(declare-fun arrayRangesEqImpliesEq!174 (array!15156 array!15156 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19141)

(assert (=> b!271857 (= lt!410086 (arrayRangesEqImpliesEq!174 (buf!7059 w2!587) (buf!7059 w3!25) #b00000000000000000000000000000000 (currentByte!13051 w1!591) (currentByte!13051 w2!587)))))

(declare-fun res!226455 () Bool)

(assert (=> b!271857 (= res!226455 (= (select (arr!7578 (buf!7059 w2!587)) (currentByte!13051 w1!591)) (select (arr!7578 (buf!7059 w3!25)) (currentByte!13051 w1!591))))))

(declare-fun e!191714 () Bool)

(assert (=> b!271857 (=> (not res!226455) (not e!191714))))

(assert (=> b!271857 e!191714))

(declare-fun b!271858 () Bool)

(declare-fun e!191709 () Bool)

(assert (=> b!271858 (= e!191709 e!191716)))

(declare-fun res!226459 () Bool)

(assert (=> b!271858 (=> res!226459 e!191716)))

(assert (=> b!271858 (= res!226459 (or (bvsge (currentByte!13051 w1!591) (size!6591 (buf!7059 w1!591))) (bvslt (currentByte!13051 w1!591) (currentByte!13051 w2!587))))))

(declare-fun b!271859 () Bool)

(declare-fun e!191713 () Bool)

(declare-fun array_inv!6315 (array!15156) Bool)

(assert (=> b!271859 (= e!191713 (array_inv!6315 (buf!7059 w3!25)))))

(declare-fun b!271861 () Bool)

(declare-fun e!191711 () Bool)

(assert (=> b!271861 (= e!191711 (not (or (bvsge (currentByte!13051 w1!591) (size!6591 (buf!7059 w1!591))) (bvsge (currentByte!13051 w1!591) #b00000000000000000000000000000000))))))

(declare-fun lt!410085 () Unit!19141)

(assert (=> b!271861 (= lt!410085 e!191707)))

(declare-fun c!12513 () Bool)

(assert (=> b!271861 (= c!12513 (and (bvslt (currentByte!13051 w1!591) (size!6591 (buf!7059 w1!591))) (bvslt (currentByte!13051 w1!591) (currentByte!13051 w2!587))))))

(assert (=> b!271861 e!191709))

(declare-fun res!226458 () Bool)

(assert (=> b!271861 (=> (not res!226458) (not e!191709))))

(declare-fun arrayRangesEq!1123 (array!15156 array!15156 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!271861 (= res!226458 (arrayRangesEq!1123 (buf!7059 w1!591) (buf!7059 w3!25) #b00000000000000000000000000000000 (currentByte!13051 w1!591)))))

(declare-fun lt!410087 () Unit!19141)

(declare-fun arrayRangesEqTransitive!386 (array!15156 array!15156 array!15156 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19141)

(assert (=> b!271861 (= lt!410087 (arrayRangesEqTransitive!386 (buf!7059 w1!591) (buf!7059 w2!587) (buf!7059 w3!25) #b00000000000000000000000000000000 (currentByte!13051 w1!591) (currentByte!13051 w2!587)))))

(declare-fun b!271862 () Bool)

(assert (=> b!271862 (= e!191714 (byteRangesEq!0 (select (arr!7578 (buf!7059 w1!591)) (currentByte!13051 w1!591)) (select (arr!7578 (buf!7059 w3!25)) (currentByte!13051 w1!591)) #b00000000000000000000000000000000 (currentBit!13046 w1!591)))))

(declare-fun b!271863 () Bool)

(declare-fun e!191712 () Bool)

(assert (=> b!271863 (= e!191712 (array_inv!6315 (buf!7059 w2!587)))))

(declare-fun b!271864 () Bool)

(declare-fun res!226456 () Bool)

(assert (=> b!271864 (=> (not res!226456) (not e!191711))))

(declare-fun isPrefixOf!0 (BitStream!11996 BitStream!11996) Bool)

(assert (=> b!271864 (= res!226456 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun b!271865 () Bool)

(declare-fun Unit!19144 () Unit!19141)

(assert (=> b!271865 (= e!191707 Unit!19144)))

(declare-fun res!226457 () Bool)

(assert (=> start!59454 (=> (not res!226457) (not e!191711))))

(assert (=> start!59454 (= res!226457 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!59454 e!191711))

(declare-fun e!191710 () Bool)

(declare-fun inv!12 (BitStream!11996) Bool)

(assert (=> start!59454 (and (inv!12 w1!591) e!191710)))

(assert (=> start!59454 (and (inv!12 w2!587) e!191712)))

(assert (=> start!59454 (and (inv!12 w3!25) e!191713)))

(declare-fun b!271860 () Bool)

(assert (=> b!271860 (= e!191710 (array_inv!6315 (buf!7059 w1!591)))))

(assert (= (and start!59454 res!226457) b!271864))

(assert (= (and b!271864 res!226456) b!271861))

(assert (= (and b!271861 res!226458) b!271858))

(assert (= (and b!271858 (not res!226459)) b!271856))

(assert (= (and b!271861 c!12513) b!271857))

(assert (= (and b!271861 (not c!12513)) b!271865))

(assert (= (and b!271857 res!226455) b!271862))

(assert (= start!59454 b!271860))

(assert (= start!59454 b!271863))

(assert (= start!59454 b!271859))

(declare-fun m!404427 () Bool)

(assert (=> b!271860 m!404427))

(declare-fun m!404429 () Bool)

(assert (=> b!271859 m!404429))

(declare-fun m!404431 () Bool)

(assert (=> start!59454 m!404431))

(declare-fun m!404433 () Bool)

(assert (=> start!59454 m!404433))

(declare-fun m!404435 () Bool)

(assert (=> start!59454 m!404435))

(declare-fun m!404437 () Bool)

(assert (=> start!59454 m!404437))

(declare-fun m!404439 () Bool)

(assert (=> b!271863 m!404439))

(declare-fun m!404441 () Bool)

(assert (=> b!271857 m!404441))

(declare-fun m!404443 () Bool)

(assert (=> b!271857 m!404443))

(declare-fun m!404445 () Bool)

(assert (=> b!271857 m!404445))

(declare-fun m!404447 () Bool)

(assert (=> b!271861 m!404447))

(declare-fun m!404449 () Bool)

(assert (=> b!271861 m!404449))

(declare-fun m!404451 () Bool)

(assert (=> b!271856 m!404451))

(assert (=> b!271856 m!404445))

(assert (=> b!271856 m!404451))

(assert (=> b!271856 m!404445))

(declare-fun m!404453 () Bool)

(assert (=> b!271856 m!404453))

(declare-fun m!404455 () Bool)

(assert (=> b!271864 m!404455))

(assert (=> b!271862 m!404451))

(assert (=> b!271862 m!404445))

(assert (=> b!271862 m!404451))

(assert (=> b!271862 m!404445))

(assert (=> b!271862 m!404453))

(push 1)

(assert (not b!271856))

(assert (not b!271860))

(assert (not b!271862))

(assert (not b!271863))

(assert (not b!271857))

(assert (not b!271861))

(assert (not start!59454))

(assert (not b!271864))

(assert (not b!271859))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!92872 () Bool)

(assert (=> d!92872 (= (byteRangesEq!0 (select (arr!7578 (buf!7059 w1!591)) (currentByte!13051 w1!591)) (select (arr!7578 (buf!7059 w3!25)) (currentByte!13051 w1!591)) #b00000000000000000000000000000000 (currentBit!13046 w1!591)) (or (= #b00000000000000000000000000000000 (currentBit!13046 w1!591)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7578 (buf!7059 w1!591)) (currentByte!13051 w1!591))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!13046 w1!591)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7578 (buf!7059 w3!25)) (currentByte!13051 w1!591))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!13046 w1!591)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!23418 () Bool)

(assert (= bs!23418 d!92872))

(declare-fun m!404491 () Bool)

(assert (=> bs!23418 m!404491))

(declare-fun m!404493 () Bool)

(assert (=> bs!23418 m!404493))

(assert (=> b!271862 d!92872))

(declare-fun d!92888 () Bool)

(assert (=> d!92888 (and (bvsge (currentByte!13051 w1!591) #b00000000000000000000000000000000) (bvslt (currentByte!13051 w1!591) (size!6591 (buf!7059 w2!587))) (bvslt (currentByte!13051 w1!591) (size!6591 (buf!7059 w3!25))) (= (select (arr!7578 (buf!7059 w2!587)) (currentByte!13051 w1!591)) (select (arr!7578 (buf!7059 w3!25)) (currentByte!13051 w1!591))))))

(declare-fun lt!410096 () Unit!19141)

(declare-fun choose!434 (array!15156 array!15156 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19141)

(assert (=> d!92888 (= lt!410096 (choose!434 (buf!7059 w2!587) (buf!7059 w3!25) #b00000000000000000000000000000000 (currentByte!13051 w1!591) (currentByte!13051 w2!587)))))

(assert (=> d!92888 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!13051 w2!587)))))

(assert (=> d!92888 (= (arrayRangesEqImpliesEq!174 (buf!7059 w2!587) (buf!7059 w3!25) #b00000000000000000000000000000000 (currentByte!13051 w1!591) (currentByte!13051 w2!587)) lt!410096)))

(declare-fun bs!23420 () Bool)

(assert (= bs!23420 d!92888))

