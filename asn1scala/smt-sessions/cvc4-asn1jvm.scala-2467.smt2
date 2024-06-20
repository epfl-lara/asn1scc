; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62674 () Bool)

(assert start!62674)

(declare-fun b!280727 () Bool)

(declare-fun res!232977 () Bool)

(declare-fun e!200331 () Bool)

(assert (=> b!280727 (=> (not res!232977) (not e!200331))))

(declare-fun from!822 () (_ BitVec 64))

(declare-fun to!789 () (_ BitVec 64))

(assert (=> b!280727 (= res!232977 (bvslt from!822 to!789))))

(declare-fun res!232979 () Bool)

(assert (=> start!62674 (=> (not res!232979) (not e!200331))))

(declare-datatypes ((array!16214 0))(
  ( (array!16215 (arr!8004 (Array (_ BitVec 32) (_ BitVec 8))) (size!7008 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16214)

(declare-fun a2!699 () array!16214)

(assert (=> start!62674 (= res!232979 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!7008 a1!699) (size!7008 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7008 a1!699))))))))

(assert (=> start!62674 e!200331))

(assert (=> start!62674 true))

(declare-fun array_inv!6732 (array!16214) Bool)

(assert (=> start!62674 (array_inv!6732 a1!699)))

(assert (=> start!62674 (array_inv!6732 a2!699)))

(declare-fun b!280728 () Bool)

(declare-fun e!200327 () Bool)

(declare-datatypes ((tuple4!766 0))(
  ( (tuple4!767 (_1!12458 (_ BitVec 32)) (_2!12458 (_ BitVec 32)) (_3!1163 (_ BitVec 32)) (_4!383 (_ BitVec 32))) )
))
(declare-fun lt!416990 () tuple4!766)

(assert (=> b!280728 (= e!200327 (not (and (bvsge (_3!1163 lt!416990) #b00000000000000000000000000000000) (bvslt (_3!1163 lt!416990) (size!7008 a1!699)))))))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!280728 (byteRangesEq!0 (select (arr!8004 a1!699) (_3!1163 lt!416990)) (select (arr!8004 a2!699) (_3!1163 lt!416990)) ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000)))

(declare-fun b!280729 () Bool)

(declare-fun res!232976 () Bool)

(assert (=> b!280729 (=> (not res!232976) (not e!200331))))

(declare-fun arrayBitRangesEq!0 (array!16214 array!16214 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!280729 (= res!232976 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!280730 () Bool)

(assert (=> b!280730 (= e!200331 e!200327)))

(declare-fun res!232978 () Bool)

(assert (=> b!280730 (=> (not res!232978) (not e!200327))))

(assert (=> b!280730 (= res!232978 (not (= (_3!1163 lt!416990) (_4!383 lt!416990))))))

(declare-datatypes ((Unit!19697 0))(
  ( (Unit!19698) )
))
(declare-fun lt!416991 () Unit!19697)

(declare-fun e!200330 () Unit!19697)

(assert (=> b!280730 (= lt!416991 e!200330)))

(declare-fun c!13047 () Bool)

(assert (=> b!280730 (= c!13047 (bvslt (_1!12458 lt!416990) (_2!12458 lt!416990)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!766)

(assert (=> b!280730 (= lt!416990 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!280731 () Bool)

(declare-fun Unit!19699 () Unit!19697)

(assert (=> b!280731 (= e!200330 Unit!19699)))

(declare-fun b!280732 () Bool)

(declare-fun Unit!19700 () Unit!19697)

(assert (=> b!280732 (= e!200330 Unit!19700)))

(declare-fun arrayRangesEq!1276 (array!16214 array!16214 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!280732 (arrayRangesEq!1276 a1!699 a2!699 (_1!12458 lt!416990) (_2!12458 lt!416990))))

(declare-fun lt!416989 () Unit!19697)

(declare-fun arrayRangesEqSymmetricLemma!183 (array!16214 array!16214 (_ BitVec 32) (_ BitVec 32)) Unit!19697)

(assert (=> b!280732 (= lt!416989 (arrayRangesEqSymmetricLemma!183 a1!699 a2!699 (_1!12458 lt!416990) (_2!12458 lt!416990)))))

(assert (=> b!280732 (arrayRangesEq!1276 a2!699 a1!699 (_1!12458 lt!416990) (_2!12458 lt!416990))))

(assert (= (and start!62674 res!232979) b!280729))

(assert (= (and b!280729 res!232976) b!280727))

(assert (= (and b!280727 res!232977) b!280730))

(assert (= (and b!280730 c!13047) b!280732))

(assert (= (and b!280730 (not c!13047)) b!280731))

(assert (= (and b!280730 res!232978) b!280728))

(declare-fun m!413743 () Bool)

(assert (=> b!280729 m!413743))

(declare-fun m!413745 () Bool)

(assert (=> start!62674 m!413745))

(declare-fun m!413747 () Bool)

(assert (=> start!62674 m!413747))

(declare-fun m!413749 () Bool)

(assert (=> b!280730 m!413749))

(declare-fun m!413751 () Bool)

(assert (=> b!280732 m!413751))

(declare-fun m!413753 () Bool)

(assert (=> b!280732 m!413753))

(declare-fun m!413755 () Bool)

(assert (=> b!280732 m!413755))

(declare-fun m!413757 () Bool)

(assert (=> b!280728 m!413757))

(declare-fun m!413759 () Bool)

(assert (=> b!280728 m!413759))

(assert (=> b!280728 m!413757))

(assert (=> b!280728 m!413759))

(declare-fun m!413761 () Bool)

(assert (=> b!280728 m!413761))

(push 1)

(assert (not start!62674))

(assert (not b!280730))

(assert (not b!280732))

(assert (not b!280729))

(assert (not b!280728))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!96562 () Bool)

(declare-fun res!233022 () Bool)

(declare-fun e!200380 () Bool)

(assert (=> d!96562 (=> res!233022 e!200380)))

(assert (=> d!96562 (= res!233022 (= (_1!12458 lt!416990) (_2!12458 lt!416990)))))

(assert (=> d!96562 (= (arrayRangesEq!1276 a1!699 a2!699 (_1!12458 lt!416990) (_2!12458 lt!416990)) e!200380)))

(declare-fun b!280787 () Bool)

(declare-fun e!200381 () Bool)

(assert (=> b!280787 (= e!200380 e!200381)))

(declare-fun res!233023 () Bool)

(assert (=> b!280787 (=> (not res!233023) (not e!200381))))

(assert (=> b!280787 (= res!233023 (= (select (arr!8004 a1!699) (_1!12458 lt!416990)) (select (arr!8004 a2!699) (_1!12458 lt!416990))))))

(declare-fun b!280788 () Bool)

(assert (=> b!280788 (= e!200381 (arrayRangesEq!1276 a1!699 a2!699 (bvadd (_1!12458 lt!416990) #b00000000000000000000000000000001) (_2!12458 lt!416990)))))

(assert (= (and d!96562 (not res!233022)) b!280787))

(assert (= (and b!280787 res!233023) b!280788))

(declare-fun m!413805 () Bool)

(assert (=> b!280787 m!413805))

(declare-fun m!413807 () Bool)

(assert (=> b!280787 m!413807))

(declare-fun m!413809 () Bool)

(assert (=> b!280788 m!413809))

(assert (=> b!280732 d!96562))

(declare-fun d!96566 () Bool)

(assert (=> d!96566 (arrayRangesEq!1276 a2!699 a1!699 (_1!12458 lt!416990) (_2!12458 lt!416990))))

(declare-fun lt!417015 () Unit!19697)

(declare-fun choose!490 (array!16214 array!16214 (_ BitVec 32) (_ BitVec 32)) Unit!19697)

(assert (=> d!96566 (= lt!417015 (choose!490 a1!699 a2!699 (_1!12458 lt!416990) (_2!12458 lt!416990)))))

(assert (=> d!96566 (and (bvsle #b00000000000000000000000000000000 (_1!12458 lt!416990)) (bvsle (_1!12458 lt!416990) (_2!12458 lt!416990)) (bvsle (_2!12458 lt!416990) (size!7008 a1!699)))))

(assert (=> d!96566 (= (arrayRangesEqSymmetricLemma!183 a1!699 a2!699 (_1!12458 lt!416990) (_2!12458 lt!416990)) lt!417015)))

(declare-fun bs!24334 () Bool)

(assert (= bs!24334 d!96566))

(assert (=> bs!24334 m!413755))

(declare-fun m!413811 () Bool)

(assert (=> bs!24334 m!413811))

(assert (=> b!280732 d!96566))

(declare-fun d!96570 () Bool)

(declare-fun res!233024 () Bool)

(declare-fun e!200382 () Bool)

(assert (=> d!96570 (=> res!233024 e!200382)))

(assert (=> d!96570 (= res!233024 (= (_1!12458 lt!416990) (_2!12458 lt!416990)))))

(assert (=> d!96570 (= (arrayRangesEq!1276 a2!699 a1!699 (_1!12458 lt!416990) (_2!12458 lt!416990)) e!200382)))

(declare-fun b!280789 () Bool)

(declare-fun e!200383 () Bool)

(assert (=> b!280789 (= e!200382 e!200383)))

(declare-fun res!233025 () Bool)

(assert (=> b!280789 (=> (not res!233025) (not e!200383))))

(assert (=> b!280789 (= res!233025 (= (select (arr!8004 a2!699) (_1!12458 lt!416990)) (select (arr!8004 a1!699) (_1!12458 lt!416990))))))

(declare-fun b!280790 () Bool)

(assert (=> b!280790 (= e!200383 (arrayRangesEq!1276 a2!699 a1!699 (bvadd (_1!12458 lt!416990) #b00000000000000000000000000000001) (_2!12458 lt!416990)))))

(assert (= (and d!96570 (not res!233024)) b!280789))

(assert (= (and b!280789 res!233025) b!280790))

(assert (=> b!280789 m!413807))

(assert (=> b!280789 m!413805))

(declare-fun m!413813 () Bool)

(assert (=> b!280790 m!413813))

(assert (=> b!280732 d!96570))

(declare-fun d!96572 () Bool)

(assert (=> d!96572 (= (byteRangesEq!0 (select (arr!8004 a1!699) (_3!1163 lt!416990)) (select (arr!8004 a2!699) (_3!1163 lt!416990)) ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000) (or (= ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!8004 a1!699) (_3!1163 lt!416990))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!8004 a2!699) (_3!1163 lt!416990))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111))))))

(declare-fun bs!24336 () Bool)

(assert (= bs!24336 d!96572))

(declare-fun m!413819 () Bool)

(assert (=> bs!24336 m!413819))

(declare-fun m!413821 () Bool)

(assert (=> bs!24336 m!413821))

(assert (=> b!280728 d!96572))

(declare-fun d!96576 () Bool)

(assert (=> d!96576 (= (array_inv!6732 a1!699) (bvsge (size!7008 a1!699) #b00000000000000000000000000000000))))

(assert (=> start!62674 d!96576))

(declare-fun d!96578 () Bool)

(assert (=> d!96578 (= (array_inv!6732 a2!699) (bvsge (size!7008 a2!699) #b00000000000000000000000000000000))))

(assert (=> start!62674 d!96578))

(declare-fun c!13056 () Bool)

(declare-fun lt!417027 () (_ BitVec 32))

(declare-fun bm!4652 () Bool)

(declare-fun lt!417026 () tuple4!766)

(declare-fun lt!417025 () (_ BitVec 32))

(declare-fun call!4655 () Bool)

(assert (=> bm!4652 (= call!4655 (byteRangesEq!0 (ite c!13056 (select (arr!8004 a1!699) (_3!1163 lt!417026)) (select (arr!8004 a1!699) (_4!383 lt!417026))) (ite c!13056 (select (arr!8004 a2!699) (_3!1163 lt!417026)) (select (arr!8004 a2!699) (_4!383 lt!417026))) (ite c!13056 lt!417027 #b00000000000000000000000000000000) lt!417025))))

(declare-fun b!280813 () Bool)

(declare-fun e!200404 () Bool)

(declare-fun e!200405 () Bool)

(assert (=> b!280813 (= e!200404 e!200405)))

(assert (=> b!280813 (= c!13056 (= (_3!1163 lt!417026) (_4!383 lt!417026)))))

(declare-fun b!280814 () Bool)

(declare-fun res!233045 () Bool)

(assert (=> b!280814 (= res!233045 (= lt!417025 #b00000000000000000000000000000000))))

(declare-fun e!200407 () Bool)

(assert (=> b!280814 (=> res!233045 e!200407)))

(declare-fun e!200409 () Bool)

(assert (=> b!280814 (= e!200409 e!200407)))

(declare-fun b!280815 () Bool)

(assert (=> b!280815 (= e!200407 call!4655)))

(declare-fun b!280816 () Bool)

(assert (=> b!280816 (= e!200405 e!200409)))

(declare-fun res!233046 () Bool)

(assert (=> b!280816 (= res!233046 (byteRangesEq!0 (select (arr!8004 a1!699) (_3!1163 lt!417026)) (select (arr!8004 a2!699) (_3!1163 lt!417026)) lt!417027 #b00000000000000000000000000001000))))

(assert (=> b!280816 (=> (not res!233046) (not e!200409))))

(declare-fun d!96580 () Bool)

(declare-fun res!233044 () Bool)

(declare-fun e!200408 () Bool)

(assert (=> d!96580 (=> res!233044 e!200408)))

(assert (=> d!96580 (= res!233044 (bvsge from!822 to!789))))

(assert (=> d!96580 (= (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789) e!200408)))

(declare-fun b!280817 () Bool)

(assert (=> b!280817 (= e!200408 e!200404)))

(declare-fun res!233047 () Bool)

(assert (=> b!280817 (=> (not res!233047) (not e!200404))))

(declare-fun e!200406 () Bool)

(assert (=> b!280817 (= res!233047 e!200406)))

(declare-fun res!233048 () Bool)

(assert (=> b!280817 (=> res!233048 e!200406)))

(assert (=> b!280817 (= res!233048 (bvsge (_1!12458 lt!417026) (_2!12458 lt!417026)))))

(assert (=> b!280817 (= lt!417025 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!280817 (= lt!417027 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!280817 (= lt!417026 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!280818 () Bool)

(assert (=> b!280818 (= e!200406 (arrayRangesEq!1276 a1!699 a2!699 (_1!12458 lt!417026) (_2!12458 lt!417026)))))

(declare-fun b!280819 () Bool)

(assert (=> b!280819 (= e!200405 call!4655)))

(assert (= (and d!96580 (not res!233044)) b!280817))

(assert (= (and b!280817 (not res!233048)) b!280818))

(assert (= (and b!280817 res!233047) b!280813))

(assert (= (and b!280813 c!13056) b!280819))

(assert (= (and b!280813 (not c!13056)) b!280816))

(assert (= (and b!280816 res!233046) b!280814))

(assert (= (and b!280814 (not res!233045)) b!280815))

(assert (= (or b!280819 b!280815) bm!4652))

(declare-fun m!413833 () Bool)

(assert (=> bm!4652 m!413833))

(declare-fun m!413835 () Bool)

(assert (=> bm!4652 m!413835))

(declare-fun m!413837 () Bool)

(assert (=> bm!4652 m!413837))

(declare-fun m!413839 () Bool)

(assert (=> bm!4652 m!413839))

(declare-fun m!413841 () Bool)

(assert (=> bm!4652 m!413841))

(assert (=> b!280816 m!413841))

(assert (=> b!280816 m!413833))

(assert (=> b!280816 m!413841))

(assert (=> b!280816 m!413833))

(declare-fun m!413843 () Bool)

(assert (=> b!280816 m!413843))

(assert (=> b!280817 m!413749))

(declare-fun m!413845 () Bool)

(assert (=> b!280818 m!413845))

(assert (=> b!280729 d!96580))

(declare-fun d!96590 () Bool)

(assert (=> d!96590 (= (arrayBitIndices!0 from!822 to!789) (tuple4!767 ((_ extract 31 0) (bvadd (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!280730 d!96590))

(push 1)

(assert (not b!280788))

(assert (not b!280818))

(assert (not bm!4652))

(assert (not d!96566))

(assert (not b!280817))

(assert (not b!280816))

(assert (not b!280790))

(check-sat)

(pop 1)

(push 1)

(check-sat)

