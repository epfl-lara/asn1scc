; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62392 () Bool)

(assert start!62392)

(declare-fun b!279728 () Bool)

(declare-datatypes ((Unit!19613 0))(
  ( (Unit!19614) )
))
(declare-fun e!199457 () Unit!19613)

(declare-fun Unit!19615 () Unit!19613)

(assert (=> b!279728 (= e!199457 Unit!19615)))

(declare-fun b!279729 () Bool)

(declare-fun Unit!19616 () Unit!19613)

(assert (=> b!279729 (= e!199457 Unit!19616)))

(declare-datatypes ((array!16151 0))(
  ( (array!16152 (arr!7983 (Array (_ BitVec 32) (_ BitVec 8))) (size!6987 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16151)

(declare-fun a2!699 () array!16151)

(declare-datatypes ((tuple4!724 0))(
  ( (tuple4!725 (_1!12437 (_ BitVec 32)) (_2!12437 (_ BitVec 32)) (_3!1142 (_ BitVec 32)) (_4!362 (_ BitVec 32))) )
))
(declare-fun lt!416505 () tuple4!724)

(declare-fun arrayRangesEq!1255 (array!16151 array!16151 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!279729 (arrayRangesEq!1255 a1!699 a2!699 (_1!12437 lt!416505) (_2!12437 lt!416505))))

(declare-fun lt!416503 () Unit!19613)

(declare-fun arrayRangesEqSymmetricLemma!162 (array!16151 array!16151 (_ BitVec 32) (_ BitVec 32)) Unit!19613)

(assert (=> b!279729 (= lt!416503 (arrayRangesEqSymmetricLemma!162 a1!699 a2!699 (_1!12437 lt!416505) (_2!12437 lt!416505)))))

(assert (=> b!279729 (arrayRangesEq!1255 a2!699 a1!699 (_1!12437 lt!416505) (_2!12437 lt!416505))))

(declare-fun b!279730 () Bool)

(declare-fun res!232238 () Bool)

(declare-fun e!199461 () Bool)

(assert (=> b!279730 (=> (not res!232238) (not e!199461))))

(declare-fun to!789 () (_ BitVec 64))

(declare-fun from!822 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!16151 array!16151 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!279730 (= res!232238 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!279731 () Bool)

(declare-fun res!232236 () Bool)

(assert (=> b!279731 (=> (not res!232236) (not e!199461))))

(assert (=> b!279731 (= res!232236 (bvslt from!822 to!789))))

(declare-fun b!279732 () Bool)

(declare-fun e!199459 () Bool)

(assert (=> b!279732 (= e!199461 e!199459)))

(declare-fun res!232237 () Bool)

(assert (=> b!279732 (=> (not res!232237) (not e!199459))))

(assert (=> b!279732 (= res!232237 (= (_3!1142 lt!416505) (_4!362 lt!416505)))))

(declare-fun lt!416504 () Unit!19613)

(assert (=> b!279732 (= lt!416504 e!199457)))

(declare-fun c!12918 () Bool)

(assert (=> b!279732 (= c!12918 (bvslt (_1!12437 lt!416505) (_2!12437 lt!416505)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!724)

(assert (=> b!279732 (= lt!416505 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!279733 () Bool)

(assert (=> b!279733 (= e!199459 (not (and (bvsge (_3!1142 lt!416505) #b00000000000000000000000000000000) (bvslt (_3!1142 lt!416505) (size!6987 a1!699)))))))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!279733 (byteRangesEq!0 (select (arr!7983 a1!699) (_3!1142 lt!416505)) (select (arr!7983 a2!699) (_3!1142 lt!416505)) ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun res!232235 () Bool)

(assert (=> start!62392 (=> (not res!232235) (not e!199461))))

(assert (=> start!62392 (= res!232235 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6987 a1!699) (size!6987 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6987 a1!699))))))))

(assert (=> start!62392 e!199461))

(assert (=> start!62392 true))

(declare-fun array_inv!6711 (array!16151) Bool)

(assert (=> start!62392 (array_inv!6711 a1!699)))

(assert (=> start!62392 (array_inv!6711 a2!699)))

(assert (= (and start!62392 res!232235) b!279730))

(assert (= (and b!279730 res!232238) b!279731))

(assert (= (and b!279731 res!232236) b!279732))

(assert (= (and b!279732 c!12918) b!279729))

(assert (= (and b!279732 (not c!12918)) b!279728))

(assert (= (and b!279732 res!232237) b!279733))

(declare-fun m!412763 () Bool)

(assert (=> b!279729 m!412763))

(declare-fun m!412765 () Bool)

(assert (=> b!279729 m!412765))

(declare-fun m!412767 () Bool)

(assert (=> b!279729 m!412767))

(declare-fun m!412769 () Bool)

(assert (=> b!279730 m!412769))

(declare-fun m!412771 () Bool)

(assert (=> b!279733 m!412771))

(declare-fun m!412773 () Bool)

(assert (=> b!279733 m!412773))

(assert (=> b!279733 m!412771))

(assert (=> b!279733 m!412773))

(declare-fun m!412775 () Bool)

(assert (=> b!279733 m!412775))

(declare-fun m!412777 () Bool)

(assert (=> b!279732 m!412777))

(declare-fun m!412779 () Bool)

(assert (=> start!62392 m!412779))

(declare-fun m!412781 () Bool)

(assert (=> start!62392 m!412781))

(push 1)

(assert (not b!279732))

(assert (not b!279729))

(assert (not b!279733))

(assert (not start!62392))

(assert (not b!279730))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!279785 () Bool)

(declare-fun e!199510 () Bool)

(declare-fun e!199513 () Bool)

(assert (=> b!279785 (= e!199510 e!199513)))

(declare-fun res!232284 () Bool)

(assert (=> b!279785 (=> (not res!232284) (not e!199513))))

(declare-fun e!199511 () Bool)

(assert (=> b!279785 (= res!232284 e!199511)))

(declare-fun res!232282 () Bool)

(assert (=> b!279785 (=> res!232282 e!199511)))

(declare-fun lt!416527 () tuple4!724)

(assert (=> b!279785 (= res!232282 (bvsge (_1!12437 lt!416527) (_2!12437 lt!416527)))))

(declare-fun lt!416528 () (_ BitVec 32))

(assert (=> b!279785 (= lt!416528 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!416529 () (_ BitVec 32))

(assert (=> b!279785 (= lt!416529 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!279785 (= lt!416527 (arrayBitIndices!0 from!822 to!789))))

(declare-fun bm!4583 () Bool)

(declare-fun c!12924 () Bool)

(declare-fun call!4586 () Bool)

(assert (=> bm!4583 (= call!4586 (byteRangesEq!0 (ite c!12924 (select (arr!7983 a1!699) (_3!1142 lt!416527)) (select (arr!7983 a1!699) (_4!362 lt!416527))) (ite c!12924 (select (arr!7983 a2!699) (_3!1142 lt!416527)) (select (arr!7983 a2!699) (_4!362 lt!416527))) (ite c!12924 lt!416529 #b00000000000000000000000000000000) lt!416528))))

(declare-fun b!279786 () Bool)

(declare-fun e!199509 () Bool)

(assert (=> b!279786 (= e!199513 e!199509)))

(assert (=> b!279786 (= c!12924 (= (_3!1142 lt!416527) (_4!362 lt!416527)))))

(declare-fun b!279787 () Bool)

(declare-fun e!199508 () Bool)

(assert (=> b!279787 (= e!199508 call!4586)))

(declare-fun b!279788 () Bool)

(declare-fun res!232281 () Bool)

(assert (=> b!279788 (= res!232281 (= lt!416528 #b00000000000000000000000000000000))))

(assert (=> b!279788 (=> res!232281 e!199508)))

(declare-fun e!199512 () Bool)

(assert (=> b!279788 (= e!199512 e!199508)))

(declare-fun b!279789 () Bool)

(assert (=> b!279789 (= e!199509 call!4586)))

(declare-fun b!279790 () Bool)

(assert (=> b!279790 (= e!199509 e!199512)))

(declare-fun res!232283 () Bool)

(assert (=> b!279790 (= res!232283 (byteRangesEq!0 (select (arr!7983 a1!699) (_3!1142 lt!416527)) (select (arr!7983 a2!699) (_3!1142 lt!416527)) lt!416529 #b00000000000000000000000000001000))))

(assert (=> b!279790 (=> (not res!232283) (not e!199512))))

(declare-fun b!279791 () Bool)

(assert (=> b!279791 (= e!199511 (arrayRangesEq!1255 a1!699 a2!699 (_1!12437 lt!416527) (_2!12437 lt!416527)))))

(declare-fun d!96218 () Bool)

(declare-fun res!232280 () Bool)

(assert (=> d!96218 (=> res!232280 e!199510)))

(assert (=> d!96218 (= res!232280 (bvsge from!822 to!789))))

(assert (=> d!96218 (= (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789) e!199510)))

(assert (= (and d!96218 (not res!232280)) b!279785))

(assert (= (and b!279785 (not res!232282)) b!279791))

(assert (= (and b!279785 res!232284) b!279786))

(assert (= (and b!279786 c!12924) b!279789))

(assert (= (and b!279786 (not c!12924)) b!279790))

(assert (= (and b!279790 res!232283) b!279788))

(assert (= (and b!279788 (not res!232281)) b!279787))

(assert (= (or b!279789 b!279787) bm!4583))

(assert (=> b!279785 m!412777))

(declare-fun m!412825 () Bool)

(assert (=> bm!4583 m!412825))

(declare-fun m!412827 () Bool)

(assert (=> bm!4583 m!412827))

(declare-fun m!412829 () Bool)

(assert (=> bm!4583 m!412829))

(declare-fun m!412831 () Bool)

(assert (=> bm!4583 m!412831))

(declare-fun m!412833 () Bool)

(assert (=> bm!4583 m!412833))

(assert (=> b!279790 m!412827))

(assert (=> b!279790 m!412831))

(assert (=> b!279790 m!412827))

(assert (=> b!279790 m!412831))

(declare-fun m!412835 () Bool)

(assert (=> b!279790 m!412835))

(declare-fun m!412837 () Bool)

(assert (=> b!279791 m!412837))

(assert (=> b!279730 d!96218))

(declare-fun d!96222 () Bool)

(assert (=> d!96222 (= (array_inv!6711 a1!699) (bvsge (size!6987 a1!699) #b00000000000000000000000000000000))))

(assert (=> start!62392 d!96222))

(declare-fun d!96224 () Bool)

(assert (=> d!96224 (= (array_inv!6711 a2!699) (bvsge (size!6987 a2!699) #b00000000000000000000000000000000))))

(assert (=> start!62392 d!96224))

(declare-fun d!96226 () Bool)

(declare-fun res!232289 () Bool)

(declare-fun e!199518 () Bool)

(assert (=> d!96226 (=> res!232289 e!199518)))

(assert (=> d!96226 (= res!232289 (= (_1!12437 lt!416505) (_2!12437 lt!416505)))))

(assert (=> d!96226 (= (arrayRangesEq!1255 a1!699 a2!699 (_1!12437 lt!416505) (_2!12437 lt!416505)) e!199518)))

(declare-fun b!279796 () Bool)

(declare-fun e!199519 () Bool)

(assert (=> b!279796 (= e!199518 e!199519)))

(declare-fun res!232290 () Bool)

(assert (=> b!279796 (=> (not res!232290) (not e!199519))))

(assert (=> b!279796 (= res!232290 (= (select (arr!7983 a1!699) (_1!12437 lt!416505)) (select (arr!7983 a2!699) (_1!12437 lt!416505))))))

(declare-fun b!279797 () Bool)

(assert (=> b!279797 (= e!199519 (arrayRangesEq!1255 a1!699 a2!699 (bvadd (_1!12437 lt!416505) #b00000000000000000000000000000001) (_2!12437 lt!416505)))))

(assert (= (and d!96226 (not res!232289)) b!279796))

(assert (= (and b!279796 res!232290) b!279797))

(declare-fun m!412839 () Bool)

(assert (=> b!279796 m!412839))

(declare-fun m!412841 () Bool)

(assert (=> b!279796 m!412841))

(declare-fun m!412843 () Bool)

(assert (=> b!279797 m!412843))

(assert (=> b!279729 d!96226))

(declare-fun d!96228 () Bool)

(assert (=> d!96228 (arrayRangesEq!1255 a2!699 a1!699 (_1!12437 lt!416505) (_2!12437 lt!416505))))

(declare-fun lt!416538 () Unit!19613)

(declare-fun choose!472 (array!16151 array!16151 (_ BitVec 32) (_ BitVec 32)) Unit!19613)

(assert (=> d!96228 (= lt!416538 (choose!472 a1!699 a2!699 (_1!12437 lt!416505) (_2!12437 lt!416505)))))

(assert (=> d!96228 (and (bvsle #b00000000000000000000000000000000 (_1!12437 lt!416505)) (bvsle (_1!12437 lt!416505) (_2!12437 lt!416505)) (bvsle (_2!12437 lt!416505) (size!6987 a1!699)))))

(assert (=> d!96228 (= (arrayRangesEqSymmetricLemma!162 a1!699 a2!699 (_1!12437 lt!416505) (_2!12437 lt!416505)) lt!416538)))

(declare-fun bs!24273 () Bool)

(assert (= bs!24273 d!96228))

(assert (=> bs!24273 m!412767))

(declare-fun m!412845 () Bool)

(assert (=> bs!24273 m!412845))

(assert (=> b!279729 d!96228))

(declare-fun d!96230 () Bool)

(declare-fun res!232301 () Bool)

(declare-fun e!199532 () Bool)

(assert (=> d!96230 (=> res!232301 e!199532)))

(assert (=> d!96230 (= res!232301 (= (_1!12437 lt!416505) (_2!12437 lt!416505)))))

(assert (=> d!96230 (= (arrayRangesEq!1255 a2!699 a1!699 (_1!12437 lt!416505) (_2!12437 lt!416505)) e!199532)))

(declare-fun b!279812 () Bool)

(declare-fun e!199533 () Bool)

(assert (=> b!279812 (= e!199532 e!199533)))

(declare-fun res!232302 () Bool)

(assert (=> b!279812 (=> (not res!232302) (not e!199533))))

(assert (=> b!279812 (= res!232302 (= (select (arr!7983 a2!699) (_1!12437 lt!416505)) (select (arr!7983 a1!699) (_1!12437 lt!416505))))))

(declare-fun b!279813 () Bool)

(assert (=> b!279813 (= e!199533 (arrayRangesEq!1255 a2!699 a1!699 (bvadd (_1!12437 lt!416505) #b00000000000000000000000000000001) (_2!12437 lt!416505)))))

(assert (= (and d!96230 (not res!232301)) b!279812))

(assert (= (and b!279812 res!232302) b!279813))

(assert (=> b!279812 m!412841))

(assert (=> b!279812 m!412839))

(declare-fun m!412847 () Bool)

(assert (=> b!279813 m!412847))

(assert (=> b!279729 d!96230))

(declare-fun d!96232 () Bool)

(assert (=> d!96232 (= (byteRangesEq!0 (select (arr!7983 a1!699) (_3!1142 lt!416505)) (select (arr!7983 a2!699) (_3!1142 lt!416505)) ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000))) (or (= ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000))) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7983 a1!699) (_3!1142 lt!416505))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7983 a2!699) (_3!1142 lt!416505))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111))))))

(declare-fun bs!24274 () Bool)

(assert (= bs!24274 d!96232))

(declare-fun m!412863 () Bool)

(assert (=> bs!24274 m!412863))

(declare-fun m!412865 () Bool)

(assert (=> bs!24274 m!412865))

(assert (=> b!279733 d!96232))

(declare-fun d!96234 () Bool)

(assert (=> d!96234 (= (arrayBitIndices!0 from!822 to!789) (tuple4!725 ((_ extract 31 0) (bvadd (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!279732 d!96234))

(push 1)

(assert (not b!279791))

(assert (not b!279813))

(assert (not b!279790))

(assert (not b!279785))

(assert (not b!279797))

(assert (not bm!4583))

(assert (not d!96228))

(check-sat)

(pop 1)

(push 1)

(check-sat)

