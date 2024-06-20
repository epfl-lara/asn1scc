; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68622 () Bool)

(assert start!68622)

(declare-fun b!309254 () Bool)

(declare-fun res!253675 () Bool)

(declare-fun e!222436 () Bool)

(assert (=> b!309254 (=> (not res!253675) (not e!222436))))

(declare-fun i!932 () (_ BitVec 32))

(declare-fun fromSlice!46 () (_ BitVec 32))

(assert (=> b!309254 (= res!253675 (not (= i!932 fromSlice!46)))))

(declare-fun b!309255 () Bool)

(declare-fun e!222437 () Bool)

(assert (=> b!309255 (= e!222436 (not e!222437))))

(declare-fun res!253676 () Bool)

(assert (=> b!309255 (=> res!253676 e!222437)))

(declare-fun to!617 () (_ BitVec 32))

(assert (=> b!309255 (= res!253676 (or (bvsgt fromSlice!46 (bvsub i!932 #b00000000000000000000000000000001)) (bvsgt (bvsub i!932 #b00000000000000000000000000000001) to!617)))))

(declare-datatypes ((T!58109 0))(
  ( (T!58110 (val!451 Int)) )
))
(declare-datatypes ((array!18767 0))(
  ( (array!18768 (arr!9221 (Array (_ BitVec 32) T!58109)) (size!8138 (_ BitVec 32))) )
))
(declare-fun a1!524 () array!18767)

(declare-fun a2!524 () array!18767)

(assert (=> b!309255 (= (select (arr!9221 a1!524) (bvsub i!932 #b00000000000000000000000000000001)) (select (arr!9221 a2!524) (bvsub i!932 #b00000000000000000000000000000001)))))

(declare-fun from!650 () (_ BitVec 32))

(declare-datatypes ((Unit!21483 0))(
  ( (Unit!21484) )
))
(declare-fun lt!440373 () Unit!21483)

(declare-fun arrayRangesEqImpliesEq!312 (array!18767 array!18767 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21483)

(assert (=> b!309255 (= lt!440373 (arrayRangesEqImpliesEq!312 a1!524 a2!524 from!650 (bvsub i!932 #b00000000000000000000000000000001) to!617))))

(declare-fun mapIsEmpty!2873 () Bool)

(declare-fun mapRes!2874 () Bool)

(assert (=> mapIsEmpty!2873 mapRes!2874))

(declare-fun b!309256 () Bool)

(declare-fun res!253678 () Bool)

(assert (=> b!309256 (=> (not res!253678) (not e!222436))))

(assert (=> b!309256 (= res!253678 (and (bvsle fromSlice!46 i!932) (bvsle i!932 to!617)))))

(declare-fun res!253672 () Bool)

(assert (=> start!68622 (=> (not res!253672) (not e!222436))))

(declare-fun toSlice!46 () (_ BitVec 32))

(assert (=> start!68622 (= res!253672 (and (bvsle #b00000000000000000000000000000000 from!650) (bvsle from!650 to!617) (bvsle (size!8138 a1!524) (size!8138 a2!524)) (bvsle to!617 (size!8138 a1!524)) (bvsle from!650 fromSlice!46) (bvsle fromSlice!46 toSlice!46) (bvsle toSlice!46 to!617)))))

(assert (=> start!68622 e!222436))

(assert (=> start!68622 true))

(declare-fun e!222434 () Bool)

(declare-fun array_inv!7719 (array!18767) Bool)

(assert (=> start!68622 (and (array_inv!7719 a2!524) e!222434)))

(declare-fun e!222435 () Bool)

(assert (=> start!68622 (and (array_inv!7719 a1!524) e!222435)))

(declare-fun mapNonEmpty!2873 () Bool)

(declare-fun tp!2873 () Bool)

(declare-fun tp_is_empty!903 () Bool)

(assert (=> mapNonEmpty!2873 (= mapRes!2874 (and tp!2873 tp_is_empty!903))))

(declare-fun mapKey!2874 () (_ BitVec 32))

(declare-fun mapRest!2873 () (Array (_ BitVec 32) T!58109))

(declare-fun mapValue!2874 () T!58109)

(assert (=> mapNonEmpty!2873 (= (arr!9221 a1!524) (store mapRest!2873 mapKey!2874 mapValue!2874))))

(declare-fun b!309257 () Bool)

(declare-fun res!253674 () Bool)

(assert (=> b!309257 (=> (not res!253674) (not e!222436))))

(declare-fun arrayRangesEq!1750 (array!18767 array!18767 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!309257 (= res!253674 (arrayRangesEq!1750 a1!524 a2!524 i!932 to!617))))

(declare-fun b!309258 () Bool)

(declare-fun res!253673 () Bool)

(assert (=> b!309258 (=> (not res!253673) (not e!222436))))

(assert (=> b!309258 (= res!253673 (arrayRangesEq!1750 a1!524 a2!524 from!650 to!617))))

(declare-fun e!222438 () Bool)

(declare-fun b!309259 () Bool)

(assert (=> b!309259 (= e!222438 (arrayRangesEq!1750 a1!524 a2!524 i!932 toSlice!46))))

(declare-fun b!309260 () Bool)

(declare-fun mapRes!2873 () Bool)

(assert (=> b!309260 (= e!222434 (and tp_is_empty!903 mapRes!2873))))

(declare-fun condMapEmpty!2874 () Bool)

(declare-fun mapDefault!2874 () T!58109)

(assert (=> b!309260 (= condMapEmpty!2874 (= (arr!9221 a2!524) ((as const (Array (_ BitVec 32) T!58109)) mapDefault!2874)))))

(declare-fun b!309261 () Bool)

(assert (=> b!309261 (= e!222437 (arrayRangesEq!1750 a1!524 a2!524 (bvsub i!932 #b00000000000000000000000000000001) to!617))))

(declare-fun b!309262 () Bool)

(assert (=> b!309262 (= e!222435 (and tp_is_empty!903 mapRes!2874))))

(declare-fun condMapEmpty!2873 () Bool)

(declare-fun mapDefault!2873 () T!58109)

(assert (=> b!309262 (= condMapEmpty!2873 (= (arr!9221 a1!524) ((as const (Array (_ BitVec 32) T!58109)) mapDefault!2873)))))

(declare-fun b!309263 () Bool)

(declare-fun res!253679 () Bool)

(assert (=> b!309263 (=> (not res!253679) (not e!222436))))

(assert (=> b!309263 (= res!253679 e!222438)))

(declare-fun res!253677 () Bool)

(assert (=> b!309263 (=> res!253677 e!222438)))

(assert (=> b!309263 (= res!253677 (bvsgt i!932 toSlice!46))))

(declare-fun mapNonEmpty!2874 () Bool)

(declare-fun tp!2874 () Bool)

(assert (=> mapNonEmpty!2874 (= mapRes!2873 (and tp!2874 tp_is_empty!903))))

(declare-fun mapRest!2874 () (Array (_ BitVec 32) T!58109))

(declare-fun mapKey!2873 () (_ BitVec 32))

(declare-fun mapValue!2873 () T!58109)

(assert (=> mapNonEmpty!2874 (= (arr!9221 a2!524) (store mapRest!2874 mapKey!2873 mapValue!2873))))

(declare-fun mapIsEmpty!2874 () Bool)

(assert (=> mapIsEmpty!2874 mapRes!2873))

(assert (= (and start!68622 res!253672) b!309258))

(assert (= (and b!309258 res!253673) b!309256))

(assert (= (and b!309256 res!253678) b!309257))

(assert (= (and b!309257 res!253674) b!309263))

(assert (= (and b!309263 (not res!253677)) b!309259))

(assert (= (and b!309263 res!253679) b!309254))

(assert (= (and b!309254 res!253675) b!309255))

(assert (= (and b!309255 (not res!253676)) b!309261))

(assert (= (and b!309260 condMapEmpty!2874) mapIsEmpty!2874))

(assert (= (and b!309260 (not condMapEmpty!2874)) mapNonEmpty!2874))

(assert (= start!68622 b!309260))

(assert (= (and b!309262 condMapEmpty!2873) mapIsEmpty!2873))

(assert (= (and b!309262 (not condMapEmpty!2873)) mapNonEmpty!2873))

(assert (= start!68622 b!309262))

(declare-fun m!447289 () Bool)

(assert (=> start!68622 m!447289))

(declare-fun m!447291 () Bool)

(assert (=> start!68622 m!447291))

(declare-fun m!447293 () Bool)

(assert (=> b!309259 m!447293))

(declare-fun m!447295 () Bool)

(assert (=> b!309255 m!447295))

(declare-fun m!447297 () Bool)

(assert (=> b!309255 m!447297))

(declare-fun m!447299 () Bool)

(assert (=> b!309255 m!447299))

(declare-fun m!447301 () Bool)

(assert (=> mapNonEmpty!2873 m!447301))

(declare-fun m!447303 () Bool)

(assert (=> mapNonEmpty!2874 m!447303))

(declare-fun m!447305 () Bool)

(assert (=> b!309261 m!447305))

(declare-fun m!447307 () Bool)

(assert (=> b!309258 m!447307))

(declare-fun m!447309 () Bool)

(assert (=> b!309257 m!447309))

(check-sat (not b!309257) (not b!309255) (not mapNonEmpty!2873) tp_is_empty!903 (not mapNonEmpty!2874) (not b!309259) (not b!309261) (not start!68622) (not b!309258))
(check-sat)
(get-model)

(declare-fun d!102688 () Bool)

(declare-fun res!253708 () Bool)

(declare-fun e!222458 () Bool)

(assert (=> d!102688 (=> res!253708 e!222458)))

(assert (=> d!102688 (= res!253708 (= (bvsub i!932 #b00000000000000000000000000000001) to!617))))

(assert (=> d!102688 (= (arrayRangesEq!1750 a1!524 a2!524 (bvsub i!932 #b00000000000000000000000000000001) to!617) e!222458)))

(declare-fun b!309298 () Bool)

(declare-fun e!222459 () Bool)

(assert (=> b!309298 (= e!222458 e!222459)))

(declare-fun res!253709 () Bool)

(assert (=> b!309298 (=> (not res!253709) (not e!222459))))

(assert (=> b!309298 (= res!253709 (= (select (arr!9221 a1!524) (bvsub i!932 #b00000000000000000000000000000001)) (select (arr!9221 a2!524) (bvsub i!932 #b00000000000000000000000000000001))))))

(declare-fun b!309299 () Bool)

(assert (=> b!309299 (= e!222459 (arrayRangesEq!1750 a1!524 a2!524 (bvadd (bvsub i!932 #b00000000000000000000000000000001) #b00000000000000000000000000000001) to!617))))

(assert (= (and d!102688 (not res!253708)) b!309298))

(assert (= (and b!309298 res!253709) b!309299))

(assert (=> b!309298 m!447295))

(assert (=> b!309298 m!447297))

(declare-fun m!447333 () Bool)

(assert (=> b!309299 m!447333))

(assert (=> b!309261 d!102688))

(declare-fun d!102690 () Bool)

(assert (=> d!102690 (= (array_inv!7719 a2!524) (bvsge (size!8138 a2!524) #b00000000000000000000000000000000))))

(assert (=> start!68622 d!102690))

(declare-fun d!102692 () Bool)

(assert (=> d!102692 (= (array_inv!7719 a1!524) (bvsge (size!8138 a1!524) #b00000000000000000000000000000000))))

(assert (=> start!68622 d!102692))

(declare-fun d!102694 () Bool)

(declare-fun res!253710 () Bool)

(declare-fun e!222460 () Bool)

(assert (=> d!102694 (=> res!253710 e!222460)))

(assert (=> d!102694 (= res!253710 (= i!932 toSlice!46))))

(assert (=> d!102694 (= (arrayRangesEq!1750 a1!524 a2!524 i!932 toSlice!46) e!222460)))

(declare-fun b!309300 () Bool)

(declare-fun e!222461 () Bool)

(assert (=> b!309300 (= e!222460 e!222461)))

(declare-fun res!253711 () Bool)

(assert (=> b!309300 (=> (not res!253711) (not e!222461))))

(assert (=> b!309300 (= res!253711 (= (select (arr!9221 a1!524) i!932) (select (arr!9221 a2!524) i!932)))))

(declare-fun b!309301 () Bool)

(assert (=> b!309301 (= e!222461 (arrayRangesEq!1750 a1!524 a2!524 (bvadd i!932 #b00000000000000000000000000000001) toSlice!46))))

(assert (= (and d!102694 (not res!253710)) b!309300))

(assert (= (and b!309300 res!253711) b!309301))

(declare-fun m!447335 () Bool)

(assert (=> b!309300 m!447335))

(declare-fun m!447337 () Bool)

(assert (=> b!309300 m!447337))

(declare-fun m!447339 () Bool)

(assert (=> b!309301 m!447339))

(assert (=> b!309259 d!102694))

(declare-fun d!102696 () Bool)

(assert (=> d!102696 (and (bvsge (bvsub i!932 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub i!932 #b00000000000000000000000000000001) (size!8138 a1!524)) (bvslt (bvsub i!932 #b00000000000000000000000000000001) (size!8138 a2!524)) (= (select (arr!9221 a1!524) (bvsub i!932 #b00000000000000000000000000000001)) (select (arr!9221 a2!524) (bvsub i!932 #b00000000000000000000000000000001))))))

(declare-fun lt!440379 () Unit!21483)

(declare-fun choose!650 (array!18767 array!18767 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21483)

(assert (=> d!102696 (= lt!440379 (choose!650 a1!524 a2!524 from!650 (bvsub i!932 #b00000000000000000000000000000001) to!617))))

(assert (=> d!102696 (and (bvsle #b00000000000000000000000000000000 from!650) (bvsle from!650 to!617))))

(assert (=> d!102696 (= (arrayRangesEqImpliesEq!312 a1!524 a2!524 from!650 (bvsub i!932 #b00000000000000000000000000000001) to!617) lt!440379)))

(declare-fun bs!26529 () Bool)

(assert (= bs!26529 d!102696))

(assert (=> bs!26529 m!447295))

(assert (=> bs!26529 m!447297))

(declare-fun m!447341 () Bool)

(assert (=> bs!26529 m!447341))

(assert (=> b!309255 d!102696))

(declare-fun d!102698 () Bool)

(declare-fun res!253712 () Bool)

(declare-fun e!222462 () Bool)

(assert (=> d!102698 (=> res!253712 e!222462)))

(assert (=> d!102698 (= res!253712 (= from!650 to!617))))

(assert (=> d!102698 (= (arrayRangesEq!1750 a1!524 a2!524 from!650 to!617) e!222462)))

(declare-fun b!309302 () Bool)

(declare-fun e!222463 () Bool)

(assert (=> b!309302 (= e!222462 e!222463)))

(declare-fun res!253713 () Bool)

(assert (=> b!309302 (=> (not res!253713) (not e!222463))))

(assert (=> b!309302 (= res!253713 (= (select (arr!9221 a1!524) from!650) (select (arr!9221 a2!524) from!650)))))

(declare-fun b!309303 () Bool)

(assert (=> b!309303 (= e!222463 (arrayRangesEq!1750 a1!524 a2!524 (bvadd from!650 #b00000000000000000000000000000001) to!617))))

(assert (= (and d!102698 (not res!253712)) b!309302))

(assert (= (and b!309302 res!253713) b!309303))

(declare-fun m!447343 () Bool)

(assert (=> b!309302 m!447343))

(declare-fun m!447345 () Bool)

(assert (=> b!309302 m!447345))

(declare-fun m!447347 () Bool)

(assert (=> b!309303 m!447347))

(assert (=> b!309258 d!102698))

(declare-fun d!102700 () Bool)

(declare-fun res!253714 () Bool)

(declare-fun e!222464 () Bool)

(assert (=> d!102700 (=> res!253714 e!222464)))

(assert (=> d!102700 (= res!253714 (= i!932 to!617))))

(assert (=> d!102700 (= (arrayRangesEq!1750 a1!524 a2!524 i!932 to!617) e!222464)))

(declare-fun b!309304 () Bool)

(declare-fun e!222465 () Bool)

(assert (=> b!309304 (= e!222464 e!222465)))

(declare-fun res!253715 () Bool)

(assert (=> b!309304 (=> (not res!253715) (not e!222465))))

(assert (=> b!309304 (= res!253715 (= (select (arr!9221 a1!524) i!932) (select (arr!9221 a2!524) i!932)))))

(declare-fun b!309305 () Bool)

(assert (=> b!309305 (= e!222465 (arrayRangesEq!1750 a1!524 a2!524 (bvadd i!932 #b00000000000000000000000000000001) to!617))))

(assert (= (and d!102700 (not res!253714)) b!309304))

(assert (= (and b!309304 res!253715) b!309305))

(assert (=> b!309304 m!447335))

(assert (=> b!309304 m!447337))

(declare-fun m!447349 () Bool)

(assert (=> b!309305 m!447349))

(assert (=> b!309257 d!102700))

(declare-fun condMapEmpty!2883 () Bool)

(declare-fun mapDefault!2883 () T!58109)

(assert (=> mapNonEmpty!2873 (= condMapEmpty!2883 (= mapRest!2873 ((as const (Array (_ BitVec 32) T!58109)) mapDefault!2883)))))

(declare-fun mapRes!2883 () Bool)

(assert (=> mapNonEmpty!2873 (= tp!2873 (and tp_is_empty!903 mapRes!2883))))

(declare-fun mapIsEmpty!2883 () Bool)

(assert (=> mapIsEmpty!2883 mapRes!2883))

(declare-fun mapNonEmpty!2883 () Bool)

(declare-fun tp!2883 () Bool)

(assert (=> mapNonEmpty!2883 (= mapRes!2883 (and tp!2883 tp_is_empty!903))))

(declare-fun mapKey!2883 () (_ BitVec 32))

(declare-fun mapRest!2883 () (Array (_ BitVec 32) T!58109))

(declare-fun mapValue!2883 () T!58109)

(assert (=> mapNonEmpty!2883 (= mapRest!2873 (store mapRest!2883 mapKey!2883 mapValue!2883))))

(assert (= (and mapNonEmpty!2873 condMapEmpty!2883) mapIsEmpty!2883))

(assert (= (and mapNonEmpty!2873 (not condMapEmpty!2883)) mapNonEmpty!2883))

(declare-fun m!447351 () Bool)

(assert (=> mapNonEmpty!2883 m!447351))

(declare-fun condMapEmpty!2884 () Bool)

(declare-fun mapDefault!2884 () T!58109)

(assert (=> mapNonEmpty!2874 (= condMapEmpty!2884 (= mapRest!2874 ((as const (Array (_ BitVec 32) T!58109)) mapDefault!2884)))))

(declare-fun mapRes!2884 () Bool)

(assert (=> mapNonEmpty!2874 (= tp!2874 (and tp_is_empty!903 mapRes!2884))))

(declare-fun mapIsEmpty!2884 () Bool)

(assert (=> mapIsEmpty!2884 mapRes!2884))

(declare-fun mapNonEmpty!2884 () Bool)

(declare-fun tp!2884 () Bool)

(assert (=> mapNonEmpty!2884 (= mapRes!2884 (and tp!2884 tp_is_empty!903))))

(declare-fun mapRest!2884 () (Array (_ BitVec 32) T!58109))

(declare-fun mapKey!2884 () (_ BitVec 32))

(declare-fun mapValue!2884 () T!58109)

(assert (=> mapNonEmpty!2884 (= mapRest!2874 (store mapRest!2884 mapKey!2884 mapValue!2884))))

(assert (= (and mapNonEmpty!2874 condMapEmpty!2884) mapIsEmpty!2884))

(assert (= (and mapNonEmpty!2874 (not condMapEmpty!2884)) mapNonEmpty!2884))

(declare-fun m!447353 () Bool)

(assert (=> mapNonEmpty!2884 m!447353))

(check-sat (not b!309299) (not b!309303) (not b!309305) (not mapNonEmpty!2883) tp_is_empty!903 (not mapNonEmpty!2884) (not d!102696) (not b!309301))
(check-sat)
