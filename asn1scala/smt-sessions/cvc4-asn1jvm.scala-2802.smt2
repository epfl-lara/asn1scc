; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67450 () Bool)

(assert start!67450)

(declare-fun res!249302 () Bool)

(declare-fun e!217858 () Bool)

(assert (=> start!67450 (=> (not res!249302) (not e!217858))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-datatypes ((array!18405 0))(
  ( (array!18406 (arr!9075 (Array (_ BitVec 32) (_ BitVec 8))) (size!7992 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18405)

(declare-fun a2!948 () array!18405)

(declare-fun toBit!258 () (_ BitVec 64))

(assert (=> start!67450 (= res!249302 (and (bvsle (size!7992 a1!948) (size!7992 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67450 e!217858))

(assert (=> start!67450 true))

(declare-fun array_inv!7604 (array!18405) Bool)

(assert (=> start!67450 (array_inv!7604 a1!948)))

(assert (=> start!67450 (array_inv!7604 a2!948)))

(declare-fun b!302898 () Bool)

(declare-fun e!217857 () Bool)

(assert (=> b!302898 (= e!217858 e!217857)))

(declare-fun res!249304 () Bool)

(assert (=> b!302898 (=> (not res!249304) (not e!217857))))

(declare-fun lt!437490 () (_ BitVec 64))

(assert (=> b!302898 (= res!249304 (and (bvsle toBit!258 lt!437490) (bvsle fromBit!258 lt!437490)))))

(assert (=> b!302898 (= lt!437490 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7992 a1!948))))))

(declare-fun b!302899 () Bool)

(declare-fun e!217859 () Bool)

(assert (=> b!302899 (= e!217857 e!217859)))

(declare-fun res!249303 () Bool)

(assert (=> b!302899 (=> (not res!249303) (not e!217859))))

(declare-datatypes ((tuple4!1126 0))(
  ( (tuple4!1127 (_1!13218 (_ BitVec 32)) (_2!13218 (_ BitVec 32)) (_3!1520 (_ BitVec 32)) (_4!563 (_ BitVec 32))) )
))
(declare-fun lt!437489 () tuple4!1126)

(declare-fun lt!437488 () tuple4!1126)

(assert (=> b!302899 (= res!249303 (and (bvslt (_1!13218 lt!437488) (_2!13218 lt!437488)) (bvsle #b00000000000000000000000000000000 (_1!13218 lt!437489)) (bvsle (_1!13218 lt!437489) (_2!13218 lt!437489)) (bvsle (_2!13218 lt!437489) (size!7992 a1!948)) (bvsle (_1!13218 lt!437489) (_1!13218 lt!437488)) (bvsle (_1!13218 lt!437488) (_2!13218 lt!437488)) (bvsle (_2!13218 lt!437488) (_2!13218 lt!437489))))))

(declare-fun fromSlice!52 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1126)

(assert (=> b!302899 (= lt!437488 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!302899 (= lt!437489 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!302900 () Bool)

(declare-fun arrayRangesEq!1621 (array!18405 array!18405 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!302900 (= e!217859 (not (arrayRangesEq!1621 a1!948 a2!948 (_1!13218 lt!437489) (_2!13218 lt!437489))))))

(declare-fun b!302901 () Bool)

(declare-fun res!249306 () Bool)

(assert (=> b!302901 (=> (not res!249306) (not e!217857))))

(assert (=> b!302901 (= res!249306 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!437490) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!302902 () Bool)

(declare-fun res!249305 () Bool)

(assert (=> b!302902 (=> (not res!249305) (not e!217857))))

(declare-fun arrayBitRangesEq!0 (array!18405 array!18405 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!302902 (= res!249305 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(assert (= (and start!67450 res!249302) b!302898))

(assert (= (and b!302898 res!249304) b!302902))

(assert (= (and b!302902 res!249305) b!302901))

(assert (= (and b!302901 res!249306) b!302899))

(assert (= (and b!302899 res!249303) b!302900))

(declare-fun m!441621 () Bool)

(assert (=> start!67450 m!441621))

(declare-fun m!441623 () Bool)

(assert (=> start!67450 m!441623))

(declare-fun m!441625 () Bool)

(assert (=> b!302899 m!441625))

(declare-fun m!441627 () Bool)

(assert (=> b!302899 m!441627))

(declare-fun m!441629 () Bool)

(assert (=> b!302900 m!441629))

(declare-fun m!441631 () Bool)

(assert (=> b!302902 m!441631))

(push 1)

(assert (not b!302902))

(assert (not start!67450))

(assert (not b!302900))

(assert (not b!302899))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!302971 () Bool)

(declare-fun e!217923 () Bool)

(declare-fun call!5558 () Bool)

(assert (=> b!302971 (= e!217923 call!5558)))

(declare-fun b!302972 () Bool)

(declare-fun lt!437516 () tuple4!1126)

(declare-fun e!217925 () Bool)

(assert (=> b!302972 (= e!217925 (arrayRangesEq!1621 a1!948 a2!948 (_1!13218 lt!437516) (_2!13218 lt!437516)))))

(declare-fun bm!5555 () Bool)

(declare-fun lt!437515 () (_ BitVec 32))

(declare-fun c!14388 () Bool)

(declare-fun lt!437517 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!5555 (= call!5558 (byteRangesEq!0 (select (arr!9075 a1!948) (_3!1520 lt!437516)) (select (arr!9075 a2!948) (_3!1520 lt!437516)) lt!437517 (ite c!14388 lt!437515 #b00000000000000000000000000001000)))))

(declare-fun b!302973 () Bool)

(declare-fun res!249363 () Bool)

(assert (=> b!302973 (= res!249363 (= lt!437515 #b00000000000000000000000000000000))))

(declare-fun e!217924 () Bool)

(assert (=> b!302973 (=> res!249363 e!217924)))

(declare-fun e!217926 () Bool)

(assert (=> b!302973 (= e!217926 e!217924)))

(declare-fun d!101196 () Bool)

(declare-fun res!249360 () Bool)

(declare-fun e!217922 () Bool)

(assert (=> d!101196 (=> res!249360 e!217922)))

(assert (=> d!101196 (= res!249360 (bvsge fromBit!258 toBit!258))))

(assert (=> d!101196 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!217922)))

(declare-fun b!302974 () Bool)

(assert (=> b!302974 (= e!217924 (byteRangesEq!0 (select (arr!9075 a1!948) (_4!563 lt!437516)) (select (arr!9075 a2!948) (_4!563 lt!437516)) #b00000000000000000000000000000000 lt!437515))))

(declare-fun b!302975 () Bool)

(assert (=> b!302975 (= e!217923 e!217926)))

(declare-fun res!249361 () Bool)

(assert (=> b!302975 (= res!249361 call!5558)))

(assert (=> b!302975 (=> (not res!249361) (not e!217926))))

(declare-fun b!302976 () Bool)

(declare-fun e!217927 () Bool)

(assert (=> b!302976 (= e!217922 e!217927)))

(declare-fun res!249359 () Bool)

(assert (=> b!302976 (=> (not res!249359) (not e!217927))))

(assert (=> b!302976 (= res!249359 e!217925)))

(declare-fun res!249362 () Bool)

(assert (=> b!302976 (=> res!249362 e!217925)))

(assert (=> b!302976 (= res!249362 (bvsge (_1!13218 lt!437516) (_2!13218 lt!437516)))))

(assert (=> b!302976 (= lt!437515 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!302976 (= lt!437517 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!302976 (= lt!437516 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!302977 () Bool)

(assert (=> b!302977 (= e!217927 e!217923)))

(assert (=> b!302977 (= c!14388 (= (_3!1520 lt!437516) (_4!563 lt!437516)))))

(assert (= (and d!101196 (not res!249360)) b!302976))

(assert (= (and b!302976 (not res!249362)) b!302972))

(assert (= (and b!302976 res!249359) b!302977))

(assert (= (and b!302977 c!14388) b!302971))

(assert (= (and b!302977 (not c!14388)) b!302975))

(assert (= (and b!302975 res!249361) b!302973))

(assert (= (and b!302973 (not res!249363)) b!302974))

(assert (= (or b!302971 b!302975) bm!5555))

(declare-fun m!441673 () Bool)

(assert (=> b!302972 m!441673))

(declare-fun m!441675 () Bool)

(assert (=> bm!5555 m!441675))

(declare-fun m!441677 () Bool)

(assert (=> bm!5555 m!441677))

(assert (=> bm!5555 m!441675))

(assert (=> bm!5555 m!441677))

(declare-fun m!441679 () Bool)

(assert (=> bm!5555 m!441679))

(declare-fun m!441681 () Bool)

(assert (=> b!302974 m!441681))

(declare-fun m!441683 () Bool)

(assert (=> b!302974 m!441683))

(assert (=> b!302974 m!441681))

(assert (=> b!302974 m!441683))

(declare-fun m!441685 () Bool)

(assert (=> b!302974 m!441685))

(assert (=> b!302976 m!441627))

(assert (=> b!302902 d!101196))

(declare-fun d!101210 () Bool)

(assert (=> d!101210 (= (array_inv!7604 a1!948) (bvsge (size!7992 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!67450 d!101210))

(declare-fun d!101212 () Bool)

(assert (=> d!101212 (= (array_inv!7604 a2!948) (bvsge (size!7992 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!67450 d!101212))

(declare-fun d!101214 () Bool)

(declare-fun res!249368 () Bool)

(declare-fun e!217932 () Bool)

(assert (=> d!101214 (=> res!249368 e!217932)))

(assert (=> d!101214 (= res!249368 (= (_1!13218 lt!437489) (_2!13218 lt!437489)))))

(assert (=> d!101214 (= (arrayRangesEq!1621 a1!948 a2!948 (_1!13218 lt!437489) (_2!13218 lt!437489)) e!217932)))

(declare-fun b!302982 () Bool)

(declare-fun e!217933 () Bool)

(assert (=> b!302982 (= e!217932 e!217933)))

(declare-fun res!249369 () Bool)

(assert (=> b!302982 (=> (not res!249369) (not e!217933))))

(assert (=> b!302982 (= res!249369 (= (select (arr!9075 a1!948) (_1!13218 lt!437489)) (select (arr!9075 a2!948) (_1!13218 lt!437489))))))

(declare-fun b!302983 () Bool)

(assert (=> b!302983 (= e!217933 (arrayRangesEq!1621 a1!948 a2!948 (bvadd (_1!13218 lt!437489) #b00000000000000000000000000000001) (_2!13218 lt!437489)))))

(assert (= (and d!101214 (not res!249368)) b!302982))

(assert (= (and b!302982 res!249369) b!302983))

(declare-fun m!441687 () Bool)

(assert (=> b!302982 m!441687))

(declare-fun m!441689 () Bool)

(assert (=> b!302982 m!441689))

(declare-fun m!441691 () Bool)

(assert (=> b!302983 m!441691))

(assert (=> b!302900 d!101214))

(declare-fun d!101216 () Bool)

(assert (=> d!101216 (= (arrayBitIndices!0 fromSlice!52 toSlice!52) (tuple4!1127 ((_ extract 31 0) (bvadd (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!302899 d!101216))

(declare-fun d!101218 () Bool)

(assert (=> d!101218 (= (arrayBitIndices!0 fromBit!258 toBit!258) (tuple4!1127 ((_ extract 31 0) (bvadd (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!302899 d!101218))

(push 1)

(assert (not b!302972))

(assert (not b!302976))

(assert (not bm!5555))

(assert (not b!302974))

(assert (not b!302983))

(check-sat)

