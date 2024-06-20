; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59500 () Bool)

(assert start!59500)

(declare-fun b!271970 () Bool)

(declare-fun e!191819 () Bool)

(declare-datatypes ((array!15163 0))(
  ( (array!15164 (arr!7580 (Array (_ BitVec 32) (_ BitVec 8))) (size!6593 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12000 0))(
  ( (BitStream!12001 (buf!7061 array!15163) (currentByte!13053 (_ BitVec 32)) (currentBit!13048 (_ BitVec 32))) )
))
(declare-fun w1!591 () BitStream!12000)

(declare-fun w3!25 () BitStream!12000)

(assert (=> b!271970 (= e!191819 (not (or (bvsge (currentByte!13053 w1!591) (size!6593 (buf!7061 w1!591))) (and (bvsge (currentByte!13053 w1!591) #b00000000000000000000000000000000) (bvslt (currentByte!13053 w1!591) (size!6593 (buf!7061 w3!25)))))))))

(declare-datatypes ((Unit!19149 0))(
  ( (Unit!19150) )
))
(declare-fun lt!410121 () Unit!19149)

(declare-fun e!191820 () Unit!19149)

(assert (=> b!271970 (= lt!410121 e!191820)))

(declare-fun c!12519 () Bool)

(declare-fun w2!587 () BitStream!12000)

(assert (=> b!271970 (= c!12519 (and (bvslt (currentByte!13053 w1!591) (size!6593 (buf!7061 w1!591))) (bvslt (currentByte!13053 w1!591) (currentByte!13053 w2!587))))))

(declare-fun e!191817 () Bool)

(assert (=> b!271970 e!191817))

(declare-fun res!226539 () Bool)

(assert (=> b!271970 (=> (not res!226539) (not e!191817))))

(declare-fun arrayRangesEq!1125 (array!15163 array!15163 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!271970 (= res!226539 (arrayRangesEq!1125 (buf!7061 w1!591) (buf!7061 w3!25) #b00000000000000000000000000000000 (currentByte!13053 w1!591)))))

(declare-fun lt!410122 () Unit!19149)

(declare-fun arrayRangesEqTransitive!388 (array!15163 array!15163 array!15163 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19149)

(assert (=> b!271970 (= lt!410122 (arrayRangesEqTransitive!388 (buf!7061 w1!591) (buf!7061 w2!587) (buf!7061 w3!25) #b00000000000000000000000000000000 (currentByte!13053 w1!591) (currentByte!13053 w2!587)))))

(declare-fun b!271971 () Bool)

(declare-fun e!191815 () Bool)

(assert (=> b!271971 (= e!191817 e!191815)))

(declare-fun res!226541 () Bool)

(assert (=> b!271971 (=> res!226541 e!191815)))

(assert (=> b!271971 (= res!226541 (or (bvsge (currentByte!13053 w1!591) (size!6593 (buf!7061 w1!591))) (bvslt (currentByte!13053 w1!591) (currentByte!13053 w2!587))))))

(declare-fun b!271972 () Bool)

(declare-fun e!191814 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!271972 (= e!191814 (byteRangesEq!0 (select (arr!7580 (buf!7061 w1!591)) (currentByte!13053 w1!591)) (select (arr!7580 (buf!7061 w3!25)) (currentByte!13053 w1!591)) #b00000000000000000000000000000000 (currentBit!13048 w1!591)))))

(declare-fun b!271973 () Bool)

(declare-fun e!191818 () Bool)

(declare-fun array_inv!6317 (array!15163) Bool)

(assert (=> b!271973 (= e!191818 (array_inv!6317 (buf!7061 w2!587)))))

(declare-fun b!271974 () Bool)

(assert (=> b!271974 (= e!191815 (byteRangesEq!0 (select (arr!7580 (buf!7061 w1!591)) (currentByte!13053 w1!591)) (select (arr!7580 (buf!7061 w3!25)) (currentByte!13053 w1!591)) #b00000000000000000000000000000000 (currentBit!13048 w1!591)))))

(declare-fun res!226540 () Bool)

(assert (=> start!59500 (=> (not res!226540) (not e!191819))))

(declare-fun isPrefixOf!0 (BitStream!12000 BitStream!12000) Bool)

(assert (=> start!59500 (= res!226540 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!59500 e!191819))

(declare-fun e!191822 () Bool)

(declare-fun inv!12 (BitStream!12000) Bool)

(assert (=> start!59500 (and (inv!12 w1!591) e!191822)))

(assert (=> start!59500 (and (inv!12 w2!587) e!191818)))

(declare-fun e!191821 () Bool)

(assert (=> start!59500 (and (inv!12 w3!25) e!191821)))

(declare-fun b!271975 () Bool)

(declare-fun Unit!19151 () Unit!19149)

(assert (=> b!271975 (= e!191820 Unit!19151)))

(declare-fun b!271976 () Bool)

(declare-fun res!226543 () Bool)

(assert (=> b!271976 (=> (not res!226543) (not e!191819))))

(assert (=> b!271976 (= res!226543 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun b!271977 () Bool)

(declare-fun Unit!19152 () Unit!19149)

(assert (=> b!271977 (= e!191820 Unit!19152)))

(declare-fun lt!410123 () Unit!19149)

(declare-fun arrayRangesEqImpliesEq!176 (array!15163 array!15163 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19149)

(assert (=> b!271977 (= lt!410123 (arrayRangesEqImpliesEq!176 (buf!7061 w2!587) (buf!7061 w3!25) #b00000000000000000000000000000000 (currentByte!13053 w1!591) (currentByte!13053 w2!587)))))

(declare-fun res!226542 () Bool)

(assert (=> b!271977 (= res!226542 (= (select (arr!7580 (buf!7061 w2!587)) (currentByte!13053 w1!591)) (select (arr!7580 (buf!7061 w3!25)) (currentByte!13053 w1!591))))))

(assert (=> b!271977 (=> (not res!226542) (not e!191814))))

(assert (=> b!271977 e!191814))

(declare-fun b!271978 () Bool)

(assert (=> b!271978 (= e!191822 (array_inv!6317 (buf!7061 w1!591)))))

(declare-fun b!271979 () Bool)

(assert (=> b!271979 (= e!191821 (array_inv!6317 (buf!7061 w3!25)))))

(assert (= (and start!59500 res!226540) b!271976))

(assert (= (and b!271976 res!226543) b!271970))

(assert (= (and b!271970 res!226539) b!271971))

(assert (= (and b!271971 (not res!226541)) b!271974))

(assert (= (and b!271970 c!12519) b!271977))

(assert (= (and b!271970 (not c!12519)) b!271975))

(assert (= (and b!271977 res!226542) b!271972))

(assert (= start!59500 b!271978))

(assert (= start!59500 b!271973))

(assert (= start!59500 b!271979))

(declare-fun m!404577 () Bool)

(assert (=> b!271976 m!404577))

(declare-fun m!404579 () Bool)

(assert (=> b!271973 m!404579))

(declare-fun m!404581 () Bool)

(assert (=> b!271974 m!404581))

(declare-fun m!404583 () Bool)

(assert (=> b!271974 m!404583))

(assert (=> b!271974 m!404581))

(assert (=> b!271974 m!404583))

(declare-fun m!404585 () Bool)

(assert (=> b!271974 m!404585))

(assert (=> b!271972 m!404581))

(assert (=> b!271972 m!404583))

(assert (=> b!271972 m!404581))

(assert (=> b!271972 m!404583))

(assert (=> b!271972 m!404585))

(declare-fun m!404587 () Bool)

(assert (=> b!271978 m!404587))

(declare-fun m!404589 () Bool)

(assert (=> start!59500 m!404589))

(declare-fun m!404591 () Bool)

(assert (=> start!59500 m!404591))

(declare-fun m!404593 () Bool)

(assert (=> start!59500 m!404593))

(declare-fun m!404595 () Bool)

(assert (=> start!59500 m!404595))

(declare-fun m!404597 () Bool)

(assert (=> b!271970 m!404597))

(declare-fun m!404599 () Bool)

(assert (=> b!271970 m!404599))

(declare-fun m!404601 () Bool)

(assert (=> b!271977 m!404601))

(declare-fun m!404603 () Bool)

(assert (=> b!271977 m!404603))

(assert (=> b!271977 m!404583))

(declare-fun m!404605 () Bool)

(assert (=> b!271979 m!404605))

(check-sat (not b!271979) (not b!271976) (not b!271973) (not b!271970) (not start!59500) (not b!271972) (not b!271974) (not b!271977) (not b!271978))
(check-sat)
(get-model)

(declare-fun d!92934 () Bool)

(assert (=> d!92934 (= (array_inv!6317 (buf!7061 w1!591)) (bvsge (size!6593 (buf!7061 w1!591)) #b00000000000000000000000000000000))))

(assert (=> b!271978 d!92934))

(declare-fun d!92936 () Bool)

(assert (=> d!92936 (= (array_inv!6317 (buf!7061 w2!587)) (bvsge (size!6593 (buf!7061 w2!587)) #b00000000000000000000000000000000))))

(assert (=> b!271973 d!92936))

(declare-fun d!92938 () Bool)

(assert (=> d!92938 (= (array_inv!6317 (buf!7061 w3!25)) (bvsge (size!6593 (buf!7061 w3!25)) #b00000000000000000000000000000000))))

(assert (=> b!271979 d!92938))

(declare-fun d!92940 () Bool)

(assert (=> d!92940 (= (byteRangesEq!0 (select (arr!7580 (buf!7061 w1!591)) (currentByte!13053 w1!591)) (select (arr!7580 (buf!7061 w3!25)) (currentByte!13053 w1!591)) #b00000000000000000000000000000000 (currentBit!13048 w1!591)) (or (= #b00000000000000000000000000000000 (currentBit!13048 w1!591)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7580 (buf!7061 w1!591)) (currentByte!13053 w1!591))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!13048 w1!591)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7580 (buf!7061 w3!25)) (currentByte!13053 w1!591))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!13048 w1!591)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!23434 () Bool)

(assert (= bs!23434 d!92940))

(declare-fun m!404637 () Bool)

(assert (=> bs!23434 m!404637))

(declare-fun m!404639 () Bool)

(assert (=> bs!23434 m!404639))

(assert (=> b!271974 d!92940))

(declare-fun d!92942 () Bool)

(declare-fun res!226566 () Bool)

(declare-fun e!191863 () Bool)

(assert (=> d!92942 (=> (not res!226566) (not e!191863))))

(assert (=> d!92942 (= res!226566 (= (size!6593 (buf!7061 w1!591)) (size!6593 (buf!7061 w2!587))))))

(assert (=> d!92942 (= (isPrefixOf!0 w1!591 w2!587) e!191863)))

(declare-fun b!272016 () Bool)

(declare-fun res!226567 () Bool)

(assert (=> b!272016 (=> (not res!226567) (not e!191863))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!272016 (= res!226567 (bvsle (bitIndex!0 (size!6593 (buf!7061 w1!591)) (currentByte!13053 w1!591) (currentBit!13048 w1!591)) (bitIndex!0 (size!6593 (buf!7061 w2!587)) (currentByte!13053 w2!587) (currentBit!13048 w2!587))))))

(declare-fun b!272017 () Bool)

(declare-fun e!191862 () Bool)

(assert (=> b!272017 (= e!191863 e!191862)))

(declare-fun res!226565 () Bool)

(assert (=> b!272017 (=> res!226565 e!191862)))

(assert (=> b!272017 (= res!226565 (= (size!6593 (buf!7061 w1!591)) #b00000000000000000000000000000000))))

(declare-fun b!272018 () Bool)

(declare-fun arrayBitRangesEq!0 (array!15163 array!15163 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!272018 (= e!191862 (arrayBitRangesEq!0 (buf!7061 w1!591) (buf!7061 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6593 (buf!7061 w1!591)) (currentByte!13053 w1!591) (currentBit!13048 w1!591))))))

(assert (= (and d!92942 res!226566) b!272016))

(assert (= (and b!272016 res!226567) b!272017))

(assert (= (and b!272017 (not res!226565)) b!272018))

(declare-fun m!404641 () Bool)

(assert (=> b!272016 m!404641))

(declare-fun m!404643 () Bool)

(assert (=> b!272016 m!404643))

(assert (=> b!272018 m!404641))

(assert (=> b!272018 m!404641))

(declare-fun m!404645 () Bool)

(assert (=> b!272018 m!404645))

(assert (=> start!59500 d!92942))

(declare-fun d!92950 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!92950 (= (inv!12 w1!591) (invariant!0 (currentBit!13048 w1!591) (currentByte!13053 w1!591) (size!6593 (buf!7061 w1!591))))))

(declare-fun bs!23435 () Bool)

(assert (= bs!23435 d!92950))

(declare-fun m!404647 () Bool)

(assert (=> bs!23435 m!404647))

(assert (=> start!59500 d!92950))

(declare-fun d!92952 () Bool)

(assert (=> d!92952 (= (inv!12 w2!587) (invariant!0 (currentBit!13048 w2!587) (currentByte!13053 w2!587) (size!6593 (buf!7061 w2!587))))))

(declare-fun bs!23436 () Bool)

(assert (= bs!23436 d!92952))

(declare-fun m!404649 () Bool)

(assert (=> bs!23436 m!404649))

(assert (=> start!59500 d!92952))

(declare-fun d!92954 () Bool)

(assert (=> d!92954 (= (inv!12 w3!25) (invariant!0 (currentBit!13048 w3!25) (currentByte!13053 w3!25) (size!6593 (buf!7061 w3!25))))))

(declare-fun bs!23437 () Bool)

(assert (= bs!23437 d!92954))

(declare-fun m!404651 () Bool)

(assert (=> bs!23437 m!404651))

(assert (=> start!59500 d!92954))

(declare-fun d!92956 () Bool)

(declare-fun res!226572 () Bool)

(declare-fun e!191868 () Bool)

(assert (=> d!92956 (=> res!226572 e!191868)))

(assert (=> d!92956 (= res!226572 (= #b00000000000000000000000000000000 (currentByte!13053 w1!591)))))

(assert (=> d!92956 (= (arrayRangesEq!1125 (buf!7061 w1!591) (buf!7061 w3!25) #b00000000000000000000000000000000 (currentByte!13053 w1!591)) e!191868)))

(declare-fun b!272023 () Bool)

(declare-fun e!191869 () Bool)

(assert (=> b!272023 (= e!191868 e!191869)))

(declare-fun res!226573 () Bool)

(assert (=> b!272023 (=> (not res!226573) (not e!191869))))

(assert (=> b!272023 (= res!226573 (= (select (arr!7580 (buf!7061 w1!591)) #b00000000000000000000000000000000) (select (arr!7580 (buf!7061 w3!25)) #b00000000000000000000000000000000)))))

(declare-fun b!272024 () Bool)

(assert (=> b!272024 (= e!191869 (arrayRangesEq!1125 (buf!7061 w1!591) (buf!7061 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!13053 w1!591)))))

(assert (= (and d!92956 (not res!226572)) b!272023))

(assert (= (and b!272023 res!226573) b!272024))

(declare-fun m!404653 () Bool)

(assert (=> b!272023 m!404653))

(declare-fun m!404655 () Bool)

(assert (=> b!272023 m!404655))

(declare-fun m!404657 () Bool)

(assert (=> b!272024 m!404657))

(assert (=> b!271970 d!92956))

(declare-fun d!92960 () Bool)

(assert (=> d!92960 (arrayRangesEq!1125 (buf!7061 w1!591) (buf!7061 w3!25) #b00000000000000000000000000000000 (currentByte!13053 w1!591))))

(declare-fun lt!410135 () Unit!19149)

(declare-fun choose!436 (array!15163 array!15163 array!15163 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19149)

(assert (=> d!92960 (= lt!410135 (choose!436 (buf!7061 w1!591) (buf!7061 w2!587) (buf!7061 w3!25) #b00000000000000000000000000000000 (currentByte!13053 w1!591) (currentByte!13053 w2!587)))))

(assert (=> d!92960 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!13053 w1!591)) (bvsle (currentByte!13053 w1!591) (currentByte!13053 w2!587)))))

(assert (=> d!92960 (= (arrayRangesEqTransitive!388 (buf!7061 w1!591) (buf!7061 w2!587) (buf!7061 w3!25) #b00000000000000000000000000000000 (currentByte!13053 w1!591) (currentByte!13053 w2!587)) lt!410135)))

(declare-fun bs!23438 () Bool)

(assert (= bs!23438 d!92960))

(assert (=> bs!23438 m!404597))

(declare-fun m!404665 () Bool)

(assert (=> bs!23438 m!404665))

(assert (=> b!271970 d!92960))

(declare-fun d!92964 () Bool)

(declare-fun res!226587 () Bool)

(declare-fun e!191879 () Bool)

(assert (=> d!92964 (=> (not res!226587) (not e!191879))))

(assert (=> d!92964 (= res!226587 (= (size!6593 (buf!7061 w2!587)) (size!6593 (buf!7061 w3!25))))))

(assert (=> d!92964 (= (isPrefixOf!0 w2!587 w3!25) e!191879)))

(declare-fun b!272037 () Bool)

(declare-fun res!226588 () Bool)

(assert (=> b!272037 (=> (not res!226588) (not e!191879))))

(assert (=> b!272037 (= res!226588 (bvsle (bitIndex!0 (size!6593 (buf!7061 w2!587)) (currentByte!13053 w2!587) (currentBit!13048 w2!587)) (bitIndex!0 (size!6593 (buf!7061 w3!25)) (currentByte!13053 w3!25) (currentBit!13048 w3!25))))))

(declare-fun b!272038 () Bool)

(declare-fun e!191878 () Bool)

(assert (=> b!272038 (= e!191879 e!191878)))

(declare-fun res!226586 () Bool)

(assert (=> b!272038 (=> res!226586 e!191878)))

(assert (=> b!272038 (= res!226586 (= (size!6593 (buf!7061 w2!587)) #b00000000000000000000000000000000))))

(declare-fun b!272039 () Bool)

(assert (=> b!272039 (= e!191878 (arrayBitRangesEq!0 (buf!7061 w2!587) (buf!7061 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6593 (buf!7061 w2!587)) (currentByte!13053 w2!587) (currentBit!13048 w2!587))))))

(assert (= (and d!92964 res!226587) b!272037))

(assert (= (and b!272037 res!226588) b!272038))

(assert (= (and b!272038 (not res!226586)) b!272039))

(assert (=> b!272037 m!404643))

(declare-fun m!404671 () Bool)

(assert (=> b!272037 m!404671))

(assert (=> b!272039 m!404643))

(assert (=> b!272039 m!404643))

(declare-fun m!404673 () Bool)

(assert (=> b!272039 m!404673))

(assert (=> b!271976 d!92964))

(declare-fun d!92968 () Bool)

(assert (=> d!92968 (and (bvsge (currentByte!13053 w1!591) #b00000000000000000000000000000000) (bvslt (currentByte!13053 w1!591) (size!6593 (buf!7061 w2!587))) (bvslt (currentByte!13053 w1!591) (size!6593 (buf!7061 w3!25))) (= (select (arr!7580 (buf!7061 w2!587)) (currentByte!13053 w1!591)) (select (arr!7580 (buf!7061 w3!25)) (currentByte!13053 w1!591))))))

(declare-fun lt!410138 () Unit!19149)

(declare-fun choose!437 (array!15163 array!15163 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19149)

(assert (=> d!92968 (= lt!410138 (choose!437 (buf!7061 w2!587) (buf!7061 w3!25) #b00000000000000000000000000000000 (currentByte!13053 w1!591) (currentByte!13053 w2!587)))))

(assert (=> d!92968 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!13053 w2!587)))))

(assert (=> d!92968 (= (arrayRangesEqImpliesEq!176 (buf!7061 w2!587) (buf!7061 w3!25) #b00000000000000000000000000000000 (currentByte!13053 w1!591) (currentByte!13053 w2!587)) lt!410138)))

(declare-fun bs!23443 () Bool)

(assert (= bs!23443 d!92968))

(assert (=> bs!23443 m!404603))

(assert (=> bs!23443 m!404583))

(declare-fun m!404691 () Bool)

(assert (=> bs!23443 m!404691))

(assert (=> b!271977 d!92968))

(assert (=> b!271972 d!92940))

(check-sat (not b!272039) (not b!272037) (not d!92950) (not d!92952) (not b!272016) (not d!92968) (not d!92960) (not d!92954) (not b!272024) (not b!272018))
(check-sat)
