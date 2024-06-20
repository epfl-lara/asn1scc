; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62350 () Bool)

(assert start!62350)

(declare-fun b!279587 () Bool)

(declare-fun res!232131 () Bool)

(declare-fun e!199338 () Bool)

(assert (=> b!279587 (=> (not res!232131) (not e!199338))))

(declare-fun from!822 () (_ BitVec 64))

(declare-datatypes ((array!16142 0))(
  ( (array!16143 (arr!7980 (Array (_ BitVec 32) (_ BitVec 8))) (size!6984 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16142)

(declare-fun a2!699 () array!16142)

(declare-fun to!789 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!16142 array!16142 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!279587 (= res!232131 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!279588 () Bool)

(declare-datatypes ((Unit!19601 0))(
  ( (Unit!19602) )
))
(declare-fun e!199334 () Unit!19601)

(declare-fun Unit!19603 () Unit!19601)

(assert (=> b!279588 (= e!199334 Unit!19603)))

(declare-fun b!279589 () Bool)

(declare-fun e!199337 () Bool)

(declare-datatypes ((tuple4!718 0))(
  ( (tuple4!719 (_1!12434 (_ BitVec 32)) (_2!12434 (_ BitVec 32)) (_3!1139 (_ BitVec 32)) (_4!359 (_ BitVec 32))) )
))
(declare-fun lt!416441 () tuple4!718)

(assert (=> b!279589 (= e!199337 (not (and (bvsge (_3!1139 lt!416441) #b00000000000000000000000000000000) (bvslt (_3!1139 lt!416441) (size!6984 a2!699)))))))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!279589 (byteRangesEq!0 (select (arr!7980 a1!699) (_3!1139 lt!416441)) (select (arr!7980 a2!699) (_3!1139 lt!416441)) ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun res!232133 () Bool)

(assert (=> start!62350 (=> (not res!232133) (not e!199338))))

(assert (=> start!62350 (= res!232133 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6984 a1!699) (size!6984 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6984 a1!699))))))))

(assert (=> start!62350 e!199338))

(assert (=> start!62350 true))

(declare-fun array_inv!6708 (array!16142) Bool)

(assert (=> start!62350 (array_inv!6708 a1!699)))

(assert (=> start!62350 (array_inv!6708 a2!699)))

(declare-fun b!279590 () Bool)

(assert (=> b!279590 (= e!199338 e!199337)))

(declare-fun res!232130 () Bool)

(assert (=> b!279590 (=> (not res!232130) (not e!199337))))

(assert (=> b!279590 (= res!232130 (= (_3!1139 lt!416441) (_4!359 lt!416441)))))

(declare-fun lt!416440 () Unit!19601)

(assert (=> b!279590 (= lt!416440 e!199334)))

(declare-fun c!12900 () Bool)

(assert (=> b!279590 (= c!12900 (bvslt (_1!12434 lt!416441) (_2!12434 lt!416441)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!718)

(assert (=> b!279590 (= lt!416441 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!279591 () Bool)

(declare-fun Unit!19604 () Unit!19601)

(assert (=> b!279591 (= e!199334 Unit!19604)))

(declare-fun arrayRangesEq!1252 (array!16142 array!16142 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!279591 (arrayRangesEq!1252 a1!699 a2!699 (_1!12434 lt!416441) (_2!12434 lt!416441))))

(declare-fun lt!416442 () Unit!19601)

(declare-fun arrayRangesEqSymmetricLemma!159 (array!16142 array!16142 (_ BitVec 32) (_ BitVec 32)) Unit!19601)

(assert (=> b!279591 (= lt!416442 (arrayRangesEqSymmetricLemma!159 a1!699 a2!699 (_1!12434 lt!416441) (_2!12434 lt!416441)))))

(assert (=> b!279591 (arrayRangesEq!1252 a2!699 a1!699 (_1!12434 lt!416441) (_2!12434 lt!416441))))

(declare-fun b!279592 () Bool)

(declare-fun res!232132 () Bool)

(assert (=> b!279592 (=> (not res!232132) (not e!199338))))

(assert (=> b!279592 (= res!232132 (bvslt from!822 to!789))))

(assert (= (and start!62350 res!232133) b!279587))

(assert (= (and b!279587 res!232131) b!279592))

(assert (= (and b!279592 res!232132) b!279590))

(assert (= (and b!279590 c!12900) b!279591))

(assert (= (and b!279590 (not c!12900)) b!279588))

(assert (= (and b!279590 res!232130) b!279589))

(declare-fun m!412619 () Bool)

(assert (=> start!62350 m!412619))

(declare-fun m!412621 () Bool)

(assert (=> start!62350 m!412621))

(declare-fun m!412623 () Bool)

(assert (=> b!279589 m!412623))

(declare-fun m!412625 () Bool)

(assert (=> b!279589 m!412625))

(assert (=> b!279589 m!412623))

(assert (=> b!279589 m!412625))

(declare-fun m!412627 () Bool)

(assert (=> b!279589 m!412627))

(declare-fun m!412629 () Bool)

(assert (=> b!279591 m!412629))

(declare-fun m!412631 () Bool)

(assert (=> b!279591 m!412631))

(declare-fun m!412633 () Bool)

(assert (=> b!279591 m!412633))

(declare-fun m!412635 () Bool)

(assert (=> b!279587 m!412635))

(declare-fun m!412637 () Bool)

(assert (=> b!279590 m!412637))

(push 1)

(assert (not start!62350))

(assert (not b!279587))

(assert (not b!279591))

(assert (not b!279590))

(assert (not b!279589))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!96156 () Bool)

(assert (=> d!96156 (= (array_inv!6708 a1!699) (bvsge (size!6984 a1!699) #b00000000000000000000000000000000))))

(assert (=> start!62350 d!96156))

(declare-fun d!96160 () Bool)

(assert (=> d!96160 (= (array_inv!6708 a2!699) (bvsge (size!6984 a2!699) #b00000000000000000000000000000000))))

(assert (=> start!62350 d!96160))

(declare-fun d!96162 () Bool)

(assert (=> d!96162 (= (byteRangesEq!0 (select (arr!7980 a1!699) (_3!1139 lt!416441)) (select (arr!7980 a2!699) (_3!1139 lt!416441)) ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000))) (or (= ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000))) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7980 a1!699) (_3!1139 lt!416441))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7980 a2!699) (_3!1139 lt!416441))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111))))))

(declare-fun bs!24261 () Bool)

(assert (= bs!24261 d!96162))

(declare-fun m!412669 () Bool)

(assert (=> bs!24261 m!412669))

(declare-fun m!412671 () Bool)

(assert (=> bs!24261 m!412671))

(assert (=> b!279589 d!96162))

(declare-fun d!96168 () Bool)

(assert (=> d!96168 (= (arrayBitIndices!0 from!822 to!789) (tuple4!719 ((_ extract 31 0) (bvadd (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!279590 d!96168))

(declare-fun d!96174 () Bool)

(declare-fun res!232179 () Bool)

(declare-fun e!199389 () Bool)

(assert (=> d!96174 (=> res!232179 e!199389)))

(assert (=> d!96174 (= res!232179 (= (_1!12434 lt!416441) (_2!12434 lt!416441)))))

(assert (=> d!96174 (= (arrayRangesEq!1252 a1!699 a2!699 (_1!12434 lt!416441) (_2!12434 lt!416441)) e!199389)))

(declare-fun b!279648 () Bool)

(declare-fun e!199390 () Bool)

(assert (=> b!279648 (= e!199389 e!199390)))

(declare-fun res!232180 () Bool)

(assert (=> b!279648 (=> (not res!232180) (not e!199390))))

(assert (=> b!279648 (= res!232180 (= (select (arr!7980 a1!699) (_1!12434 lt!416441)) (select (arr!7980 a2!699) (_1!12434 lt!416441))))))

(declare-fun b!279649 () Bool)

(assert (=> b!279649 (= e!199390 (arrayRangesEq!1252 a1!699 a2!699 (bvadd (_1!12434 lt!416441) #b00000000000000000000000000000001) (_2!12434 lt!416441)))))

(assert (= (and d!96174 (not res!232179)) b!279648))

(assert (= (and b!279648 res!232180) b!279649))

(declare-fun m!412677 () Bool)

(assert (=> b!279648 m!412677))

(declare-fun m!412679 () Bool)

(assert (=> b!279648 m!412679))

(declare-fun m!412681 () Bool)

(assert (=> b!279649 m!412681))

(assert (=> b!279591 d!96174))

(declare-fun d!96176 () Bool)

(assert (=> d!96176 (arrayRangesEq!1252 a2!699 a1!699 (_1!12434 lt!416441) (_2!12434 lt!416441))))

(declare-fun lt!416469 () Unit!19601)

(declare-fun choose!469 (array!16142 array!16142 (_ BitVec 32) (_ BitVec 32)) Unit!19601)

(assert (=> d!96176 (= lt!416469 (choose!469 a1!699 a2!699 (_1!12434 lt!416441) (_2!12434 lt!416441)))))

(assert (=> d!96176 (and (bvsle #b00000000000000000000000000000000 (_1!12434 lt!416441)) (bvsle (_1!12434 lt!416441) (_2!12434 lt!416441)) (bvsle (_2!12434 lt!416441) (size!6984 a1!699)))))

(assert (=> d!96176 (= (arrayRangesEqSymmetricLemma!159 a1!699 a2!699 (_1!12434 lt!416441) (_2!12434 lt!416441)) lt!416469)))

(declare-fun bs!24264 () Bool)

(assert (= bs!24264 d!96176))

(assert (=> bs!24264 m!412633))

(declare-fun m!412701 () Bool)

(assert (=> bs!24264 m!412701))

(assert (=> b!279591 d!96176))

(declare-fun d!96180 () Bool)

(declare-fun res!232186 () Bool)

(declare-fun e!199397 () Bool)

(assert (=> d!96180 (=> res!232186 e!199397)))

(assert (=> d!96180 (= res!232186 (= (_1!12434 lt!416441) (_2!12434 lt!416441)))))

(assert (=> d!96180 (= (arrayRangesEq!1252 a2!699 a1!699 (_1!12434 lt!416441) (_2!12434 lt!416441)) e!199397)))

(declare-fun b!279657 () Bool)

(declare-fun e!199398 () Bool)

(assert (=> b!279657 (= e!199397 e!199398)))

(declare-fun res!232187 () Bool)

(assert (=> b!279657 (=> (not res!232187) (not e!199398))))

(assert (=> b!279657 (= res!232187 (= (select (arr!7980 a2!699) (_1!12434 lt!416441)) (select (arr!7980 a1!699) (_1!12434 lt!416441))))))

(declare-fun b!279658 () Bool)

(assert (=> b!279658 (= e!199398 (arrayRangesEq!1252 a2!699 a1!699 (bvadd (_1!12434 lt!416441) #b00000000000000000000000000000001) (_2!12434 lt!416441)))))

(assert (= (and d!96180 (not res!232186)) b!279657))

(assert (= (and b!279657 res!232187) b!279658))

(assert (=> b!279657 m!412679))

(assert (=> b!279657 m!412677))

(declare-fun m!412703 () Bool)

(assert (=> b!279658 m!412703))

(assert (=> b!279591 d!96180))

(declare-fun lt!416476 () (_ BitVec 32))

(declare-fun e!199415 () Bool)

(declare-fun lt!416477 () tuple4!718)

(declare-fun b!279673 () Bool)

(assert (=> b!279673 (= e!199415 (byteRangesEq!0 (select (arr!7980 a1!699) (_4!359 lt!416477)) (select (arr!7980 a2!699) (_4!359 lt!416477)) #b00000000000000000000000000000000 lt!416476))))

(declare-fun b!279674 () Bool)

(declare-fun e!199411 () Bool)

(declare-fun e!199416 () Bool)

(assert (=> b!279674 (= e!199411 e!199416)))

(declare-fun res!232198 () Bool)

(declare-fun call!4580 () Bool)

(assert (=> b!279674 (= res!232198 call!4580)))

(assert (=> b!279674 (=> (not res!232198) (not e!199416))))

(declare-fun b!279675 () Bool)

(declare-fun e!199412 () Bool)

(assert (=> b!279675 (= e!199412 e!199411)))

(declare-fun c!12909 () Bool)

(assert (=> b!279675 (= c!12909 (= (_3!1139 lt!416477) (_4!359 lt!416477)))))

(declare-fun b!279676 () Bool)

(declare-fun e!199414 () Bool)

(assert (=> b!279676 (= e!199414 e!199412)))

(declare-fun res!232199 () Bool)

(assert (=> b!279676 (=> (not res!232199) (not e!199412))))

(declare-fun e!199413 () Bool)

(assert (=> b!279676 (= res!232199 e!199413)))

(declare-fun res!232200 () Bool)

(assert (=> b!279676 (=> res!232200 e!199413)))

(assert (=> b!279676 (= res!232200 (bvsge (_1!12434 lt!416477) (_2!12434 lt!416477)))))

(assert (=> b!279676 (= lt!416476 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!416478 () (_ BitVec 32))

(assert (=> b!279676 (= lt!416478 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!279676 (= lt!416477 (arrayBitIndices!0 from!822 to!789))))

(declare-fun d!96182 () Bool)

(declare-fun res!232201 () Bool)

(assert (=> d!96182 (=> res!232201 e!199414)))

(assert (=> d!96182 (= res!232201 (bvsge from!822 to!789))))

(assert (=> d!96182 (= (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789) e!199414)))

(declare-fun b!279677 () Bool)

(assert (=> b!279677 (= e!199413 (arrayRangesEq!1252 a1!699 a2!699 (_1!12434 lt!416477) (_2!12434 lt!416477)))))

(declare-fun b!279678 () Bool)

(declare-fun res!232202 () Bool)

(assert (=> b!279678 (= res!232202 (= lt!416476 #b00000000000000000000000000000000))))

(assert (=> b!279678 (=> res!232202 e!199415)))

(assert (=> b!279678 (= e!199416 e!199415)))

(declare-fun b!279679 () Bool)

(assert (=> b!279679 (= e!199411 call!4580)))

(declare-fun bm!4577 () Bool)

(assert (=> bm!4577 (= call!4580 (byteRangesEq!0 (select (arr!7980 a1!699) (_3!1139 lt!416477)) (select (arr!7980 a2!699) (_3!1139 lt!416477)) lt!416478 (ite c!12909 lt!416476 #b00000000000000000000000000001000)))))

(assert (= (and d!96182 (not res!232201)) b!279676))

(assert (= (and b!279676 (not res!232200)) b!279677))

(assert (= (and b!279676 res!232199) b!279675))

(assert (= (and b!279675 c!12909) b!279679))

(assert (= (and b!279675 (not c!12909)) b!279674))

(assert (= (and b!279674 res!232198) b!279678))

(assert (= (and b!279678 (not res!232202)) b!279673))

(assert (= (or b!279679 b!279674) bm!4577))

(declare-fun m!412709 () Bool)

(assert (=> b!279673 m!412709))

(declare-fun m!412711 () Bool)

(assert (=> b!279673 m!412711))

(assert (=> b!279673 m!412709))

(assert (=> b!279673 m!412711))

(declare-fun m!412713 () Bool)

(assert (=> b!279673 m!412713))

(assert (=> b!279676 m!412637))

(declare-fun m!412715 () Bool)

(assert (=> b!279677 m!412715))

(declare-fun m!412717 () Bool)

(assert (=> bm!4577 m!412717))

(declare-fun m!412719 () Bool)

(assert (=> bm!4577 m!412719))

(assert (=> bm!4577 m!412717))

(assert (=> bm!4577 m!412719))

(declare-fun m!412721 () Bool)

(assert (=> bm!4577 m!412721))

(assert (=> b!279587 d!96182))

(push 1)

(assert (not b!279649))

(assert (not b!279658))

(assert (not b!279677))

(assert (not b!279673))

(assert (not bm!4577))

(assert (not b!279676))

(assert (not d!96176))

(check-sat)

(pop 1)

(push 1)

(check-sat)

