; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62516 () Bool)

(assert start!62516)

(declare-fun b!280158 () Bool)

(declare-datatypes ((Unit!19645 0))(
  ( (Unit!19646) )
))
(declare-fun e!199835 () Unit!19645)

(declare-fun Unit!19647 () Unit!19645)

(assert (=> b!280158 (= e!199835 Unit!19647)))

(declare-fun b!280159 () Bool)

(declare-fun e!199836 () Bool)

(declare-datatypes ((tuple4!740 0))(
  ( (tuple4!741 (_1!12445 (_ BitVec 32)) (_2!12445 (_ BitVec 32)) (_3!1150 (_ BitVec 32)) (_4!370 (_ BitVec 32))) )
))
(declare-fun lt!416729 () tuple4!740)

(declare-datatypes ((array!16176 0))(
  ( (array!16177 (arr!7991 (Array (_ BitVec 32) (_ BitVec 8))) (size!6995 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16176)

(assert (=> b!280159 (= e!199836 (and (not (= (_3!1150 lt!416729) (_4!370 lt!416729))) (or (bvslt (_3!1150 lt!416729) #b00000000000000000000000000000000) (bvsge (_3!1150 lt!416729) (size!6995 a1!699)))))))

(declare-fun lt!416728 () Unit!19645)

(assert (=> b!280159 (= lt!416728 e!199835)))

(declare-fun c!12972 () Bool)

(assert (=> b!280159 (= c!12972 (bvslt (_1!12445 lt!416729) (_2!12445 lt!416729)))))

(declare-fun from!822 () (_ BitVec 64))

(declare-fun to!789 () (_ BitVec 64))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!740)

(assert (=> b!280159 (= lt!416729 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!280161 () Bool)

(declare-fun Unit!19648 () Unit!19645)

(assert (=> b!280161 (= e!199835 Unit!19648)))

(declare-fun a2!699 () array!16176)

(declare-fun arrayRangesEq!1263 (array!16176 array!16176 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!280161 (arrayRangesEq!1263 a1!699 a2!699 (_1!12445 lt!416729) (_2!12445 lt!416729))))

(declare-fun lt!416730 () Unit!19645)

(declare-fun arrayRangesEqSymmetricLemma!170 (array!16176 array!16176 (_ BitVec 32) (_ BitVec 32)) Unit!19645)

(assert (=> b!280161 (= lt!416730 (arrayRangesEqSymmetricLemma!170 a1!699 a2!699 (_1!12445 lt!416729) (_2!12445 lt!416729)))))

(assert (=> b!280161 (arrayRangesEq!1263 a2!699 a1!699 (_1!12445 lt!416729) (_2!12445 lt!416729))))

(declare-fun b!280162 () Bool)

(declare-fun res!232558 () Bool)

(assert (=> b!280162 (=> (not res!232558) (not e!199836))))

(assert (=> b!280162 (= res!232558 (bvslt from!822 to!789))))

(declare-fun b!280160 () Bool)

(declare-fun res!232559 () Bool)

(assert (=> b!280160 (=> (not res!232559) (not e!199836))))

(declare-fun arrayBitRangesEq!0 (array!16176 array!16176 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!280160 (= res!232559 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun res!232557 () Bool)

(assert (=> start!62516 (=> (not res!232557) (not e!199836))))

(assert (=> start!62516 (= res!232557 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6995 a1!699) (size!6995 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6995 a1!699))))))))

(assert (=> start!62516 e!199836))

(assert (=> start!62516 true))

(declare-fun array_inv!6719 (array!16176) Bool)

(assert (=> start!62516 (array_inv!6719 a1!699)))

(assert (=> start!62516 (array_inv!6719 a2!699)))

(assert (= (and start!62516 res!232557) b!280160))

(assert (= (and b!280160 res!232559) b!280162))

(assert (= (and b!280162 res!232558) b!280159))

(assert (= (and b!280159 c!12972) b!280161))

(assert (= (and b!280159 (not c!12972)) b!280158))

(declare-fun m!413201 () Bool)

(assert (=> b!280159 m!413201))

(declare-fun m!413203 () Bool)

(assert (=> b!280161 m!413203))

(declare-fun m!413205 () Bool)

(assert (=> b!280161 m!413205))

(declare-fun m!413207 () Bool)

(assert (=> b!280161 m!413207))

(declare-fun m!413209 () Bool)

(assert (=> b!280160 m!413209))

(declare-fun m!413211 () Bool)

(assert (=> start!62516 m!413211))

(declare-fun m!413213 () Bool)

(assert (=> start!62516 m!413213))

(check-sat (not start!62516) (not b!280161) (not b!280159) (not b!280160))
(check-sat)
(get-model)

(declare-fun d!96364 () Bool)

(assert (=> d!96364 (= (array_inv!6719 a1!699) (bvsge (size!6995 a1!699) #b00000000000000000000000000000000))))

(assert (=> start!62516 d!96364))

(declare-fun d!96366 () Bool)

(assert (=> d!96366 (= (array_inv!6719 a2!699) (bvsge (size!6995 a2!699) #b00000000000000000000000000000000))))

(assert (=> start!62516 d!96366))

(declare-fun d!96368 () Bool)

(declare-fun res!232585 () Bool)

(declare-fun e!199865 () Bool)

(assert (=> d!96368 (=> res!232585 e!199865)))

(assert (=> d!96368 (= res!232585 (= (_1!12445 lt!416729) (_2!12445 lt!416729)))))

(assert (=> d!96368 (= (arrayRangesEq!1263 a1!699 a2!699 (_1!12445 lt!416729) (_2!12445 lt!416729)) e!199865)))

(declare-fun b!280194 () Bool)

(declare-fun e!199866 () Bool)

(assert (=> b!280194 (= e!199865 e!199866)))

(declare-fun res!232586 () Bool)

(assert (=> b!280194 (=> (not res!232586) (not e!199866))))

(assert (=> b!280194 (= res!232586 (= (select (arr!7991 a1!699) (_1!12445 lt!416729)) (select (arr!7991 a2!699) (_1!12445 lt!416729))))))

(declare-fun b!280195 () Bool)

(assert (=> b!280195 (= e!199866 (arrayRangesEq!1263 a1!699 a2!699 (bvadd (_1!12445 lt!416729) #b00000000000000000000000000000001) (_2!12445 lt!416729)))))

(assert (= (and d!96368 (not res!232585)) b!280194))

(assert (= (and b!280194 res!232586) b!280195))

(declare-fun m!413243 () Bool)

(assert (=> b!280194 m!413243))

(declare-fun m!413247 () Bool)

(assert (=> b!280194 m!413247))

(declare-fun m!413249 () Bool)

(assert (=> b!280195 m!413249))

(assert (=> b!280161 d!96368))

(declare-fun d!96382 () Bool)

(assert (=> d!96382 (arrayRangesEq!1263 a2!699 a1!699 (_1!12445 lt!416729) (_2!12445 lt!416729))))

(declare-fun lt!416748 () Unit!19645)

(declare-fun choose!478 (array!16176 array!16176 (_ BitVec 32) (_ BitVec 32)) Unit!19645)

(assert (=> d!96382 (= lt!416748 (choose!478 a1!699 a2!699 (_1!12445 lt!416729) (_2!12445 lt!416729)))))

(assert (=> d!96382 (and (bvsle #b00000000000000000000000000000000 (_1!12445 lt!416729)) (bvsle (_1!12445 lt!416729) (_2!12445 lt!416729)) (bvsle (_2!12445 lt!416729) (size!6995 a1!699)))))

(assert (=> d!96382 (= (arrayRangesEqSymmetricLemma!170 a1!699 a2!699 (_1!12445 lt!416729) (_2!12445 lt!416729)) lt!416748)))

(declare-fun bs!24304 () Bool)

(assert (= bs!24304 d!96382))

(assert (=> bs!24304 m!413207))

(declare-fun m!413255 () Bool)

(assert (=> bs!24304 m!413255))

(assert (=> b!280161 d!96382))

(declare-fun d!96388 () Bool)

(declare-fun res!232591 () Bool)

(declare-fun e!199871 () Bool)

(assert (=> d!96388 (=> res!232591 e!199871)))

(assert (=> d!96388 (= res!232591 (= (_1!12445 lt!416729) (_2!12445 lt!416729)))))

(assert (=> d!96388 (= (arrayRangesEq!1263 a2!699 a1!699 (_1!12445 lt!416729) (_2!12445 lt!416729)) e!199871)))

(declare-fun b!280200 () Bool)

(declare-fun e!199872 () Bool)

(assert (=> b!280200 (= e!199871 e!199872)))

(declare-fun res!232592 () Bool)

(assert (=> b!280200 (=> (not res!232592) (not e!199872))))

(assert (=> b!280200 (= res!232592 (= (select (arr!7991 a2!699) (_1!12445 lt!416729)) (select (arr!7991 a1!699) (_1!12445 lt!416729))))))

(declare-fun b!280201 () Bool)

(assert (=> b!280201 (= e!199872 (arrayRangesEq!1263 a2!699 a1!699 (bvadd (_1!12445 lt!416729) #b00000000000000000000000000000001) (_2!12445 lt!416729)))))

(assert (= (and d!96388 (not res!232591)) b!280200))

(assert (= (and b!280200 res!232592) b!280201))

(assert (=> b!280200 m!413247))

(assert (=> b!280200 m!413243))

(declare-fun m!413257 () Bool)

(assert (=> b!280201 m!413257))

(assert (=> b!280161 d!96388))

(declare-fun d!96390 () Bool)

(assert (=> d!96390 (= (arrayBitIndices!0 from!822 to!789) (tuple4!741 ((_ extract 31 0) (bvadd (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!280159 d!96390))

(declare-fun b!280258 () Bool)

(declare-fun e!199921 () Bool)

(declare-fun call!4619 () Bool)

(assert (=> b!280258 (= e!199921 call!4619)))

(declare-fun b!280259 () Bool)

(declare-fun e!199923 () Bool)

(declare-fun e!199922 () Bool)

(assert (=> b!280259 (= e!199923 e!199922)))

(declare-fun res!232634 () Bool)

(assert (=> b!280259 (=> (not res!232634) (not e!199922))))

(declare-fun e!199925 () Bool)

(assert (=> b!280259 (= res!232634 e!199925)))

(declare-fun res!232637 () Bool)

(assert (=> b!280259 (=> res!232637 e!199925)))

(declare-fun lt!416773 () tuple4!740)

(assert (=> b!280259 (= res!232637 (bvsge (_1!12445 lt!416773) (_2!12445 lt!416773)))))

(declare-fun lt!416774 () (_ BitVec 32))

(assert (=> b!280259 (= lt!416774 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!416775 () (_ BitVec 32))

(assert (=> b!280259 (= lt!416775 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!280259 (= lt!416773 (arrayBitIndices!0 from!822 to!789))))

(declare-fun d!96392 () Bool)

(declare-fun res!232633 () Bool)

(assert (=> d!96392 (=> res!232633 e!199923)))

(assert (=> d!96392 (= res!232633 (bvsge from!822 to!789))))

(assert (=> d!96392 (= (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789) e!199923)))

(declare-fun bm!4616 () Bool)

(declare-fun c!12984 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!4616 (= call!4619 (byteRangesEq!0 (ite c!12984 (select (arr!7991 a1!699) (_3!1150 lt!416773)) (select (arr!7991 a1!699) (_4!370 lt!416773))) (ite c!12984 (select (arr!7991 a2!699) (_3!1150 lt!416773)) (select (arr!7991 a2!699) (_4!370 lt!416773))) (ite c!12984 lt!416775 #b00000000000000000000000000000000) lt!416774))))

(declare-fun b!280260 () Bool)

(declare-fun e!199924 () Bool)

(assert (=> b!280260 (= e!199924 call!4619)))

(declare-fun b!280261 () Bool)

(assert (=> b!280261 (= e!199925 (arrayRangesEq!1263 a1!699 a2!699 (_1!12445 lt!416773) (_2!12445 lt!416773)))))

(declare-fun b!280262 () Bool)

(declare-fun res!232636 () Bool)

(assert (=> b!280262 (= res!232636 (= lt!416774 #b00000000000000000000000000000000))))

(assert (=> b!280262 (=> res!232636 e!199921)))

(declare-fun e!199926 () Bool)

(assert (=> b!280262 (= e!199926 e!199921)))

(declare-fun b!280263 () Bool)

(assert (=> b!280263 (= e!199922 e!199924)))

(assert (=> b!280263 (= c!12984 (= (_3!1150 lt!416773) (_4!370 lt!416773)))))

(declare-fun b!280264 () Bool)

(assert (=> b!280264 (= e!199924 e!199926)))

(declare-fun res!232635 () Bool)

(assert (=> b!280264 (= res!232635 (byteRangesEq!0 (select (arr!7991 a1!699) (_3!1150 lt!416773)) (select (arr!7991 a2!699) (_3!1150 lt!416773)) lt!416775 #b00000000000000000000000000001000))))

(assert (=> b!280264 (=> (not res!232635) (not e!199926))))

(assert (= (and d!96392 (not res!232633)) b!280259))

(assert (= (and b!280259 (not res!232637)) b!280261))

(assert (= (and b!280259 res!232634) b!280263))

(assert (= (and b!280263 c!12984) b!280260))

(assert (= (and b!280263 (not c!12984)) b!280264))

(assert (= (and b!280264 res!232635) b!280262))

(assert (= (and b!280262 (not res!232636)) b!280258))

(assert (= (or b!280260 b!280258) bm!4616))

(assert (=> b!280259 m!413201))

(declare-fun m!413287 () Bool)

(assert (=> bm!4616 m!413287))

(declare-fun m!413289 () Bool)

(assert (=> bm!4616 m!413289))

(declare-fun m!413291 () Bool)

(assert (=> bm!4616 m!413291))

(declare-fun m!413293 () Bool)

(assert (=> bm!4616 m!413293))

(declare-fun m!413295 () Bool)

(assert (=> bm!4616 m!413295))

(declare-fun m!413297 () Bool)

(assert (=> b!280261 m!413297))

(assert (=> b!280264 m!413293))

(assert (=> b!280264 m!413295))

(assert (=> b!280264 m!413293))

(assert (=> b!280264 m!413295))

(declare-fun m!413299 () Bool)

(assert (=> b!280264 m!413299))

(assert (=> b!280160 d!96392))

(check-sat (not bm!4616) (not b!280201) (not d!96382) (not b!280264) (not b!280195) (not b!280259) (not b!280261))
(check-sat)
